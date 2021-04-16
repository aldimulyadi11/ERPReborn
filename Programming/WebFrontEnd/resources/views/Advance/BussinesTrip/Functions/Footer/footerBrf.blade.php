<script type="text/javascript">
  $(document).ready(function() {
    $("#brfhide1").hide();
    $("#brfhide3").hide();
    $("#brfhide4").hide();
    $("#brfhide5").hide();
    $(".brfhide6").hide();
    $(".budgetDetail").hide();

    $("#projectcode2").prop("disabled", true);
    $("#sitecode2").prop("disabled", true);
    $("#requester_name2").prop("disabled", true);
    $("#saveBrfList").prop("disabled", true);
  });
</script>

<script>
    $(function() {
        $("#origin_budget").on('click', function(e) {
            e.preventDefault();

            var val = $("#origin_budget").val();
            if(val == ""){
                $("#projectcode2").prop("disabled", true);
            }
            else{
                $("#projectcode2").prop("disabled", false);
            }

            $(".budgetDetail").show();
            $("#sequenceRequest").val('1');
            $("#sequence").val('1');
            $("#sequenceRequest").prop("disabled", true);
            
        });

        $("#projectcode2").on('click', function(e) {
            e.preventDefault();
            $("#sitecode2").prop("disabled", false);
        });

        $("#sitecode2").on('click', function(e) {
            e.preventDefault();
            $("#requester_name2").prop("disabled", false);
        });
    });
</script>

<script>
  $(document).ready(function() {
    $('#longTerm').click(function() {
      $("#sequenceRequest").val('0');
      $("#sequenceRequest").prop("disabled", false);
    });

    $('#shortTerm').click(function() {
      $("#sequenceRequest").val('1');
      $("#sequenceRequest").prop("disabled", true);
    });

    $('#dayTripTravel').click(function() {
      $("#sequenceRequest").val('1');
      $("#sequenceRequest").prop("disabled", true);
    });
  });
</script>


<script>
  var x = 1; //initlal text box count        
  var wrapper = $(".input_fields_wrap"); //Fields wrapper
  $('.add_field_button').click(function() {
    cek = 0;
    addColomn();
  });

  function addColomn() { //on add input button click
    if (cek == 0) {
      cek++;
      x++; //text box increment
      $(wrapper).append(

        '<div class="col-md-12">' +
        '<div class="form-group">' +
        '<div class="input-group control-group" style="width:105%;position:relative;center:8px;">' +
        '<input type="file" class="form-control filenames" id="filenames_' + x + '" style="height:26px;">' +
        '<div class="input-group-btn">' +
        '<button class="btn btn-outline-secondary btn-sm remove_field" type="button"><i class="glyphicon glyphicon-remove"></i> Remove</button>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '</div>'

      ); //add input box                
    }
  }

  $(wrapper).on("click", ".remove_field", function(e) { //user click on remove text
    e.preventDefault();
    $(this).parent().parent().parent('div').remove();
    x--;
  })
</script>

<script>
  var varTotal = 0;
  var valAllowance = 0;
  var valTransport =0;
  var valAirportTax =0;
  var valAccomodation = 0;
  var valOthers = 0;
  var varTotalBrf = 0;
  
  function validateFormAsfPaymentSequence() {
    var allowance = document.forms["formAsfPaymentSequence"]["allowance"].value;
    var transport = document.forms["formAsfPaymentSequence"]["transport"].value;
    var airport_tax = document.forms["formAsfPaymentSequence"]["airport_tax"].value;
    var accomodation = document.forms["formAsfPaymentSequence"]["accomodation"].value;
    var other = document.forms["formAsfPaymentSequence"]["other"].value;

    if (allowance == "") {
      Swal.fire("Error !", "Please Input Allowance !", "error");
    } else if (transport == "") {
      Swal.fire("Error !", "Please Input Transport !", "error");
    } else if (airport_tax == "") {
      Swal.fire("Error !", "Please Input Airport Tax !", "error");
    } else if (accomodation == "") {
      Swal.fire("Error !", "Please Input Accomodation !", "error");
    } else if (other == "") {
      Swal.fire("Error !", "Please Input Other !", "error");
    } else {

      
      var varBudgetRequest = $('#budgetRequest').val();
      var varSequenceReq = $('#sequenceRequest').val();
      var varSequence = $('#sequence').val();
      var varAllowance = $('#allowance').val();
      var varTransport = $('#transport').val();
      var varAirport_tax = $('#airport_tax').val();
      var varAccomodation = $('#accomodation').val();
      var varOther = $('#other').val();
      var varSum = +varAllowance + +varTransport + +varAirport_tax + +varAccomodation + +varOther; 
      
      if (varSequence > varSequenceReq) {
        Swal.fire("Error !", "Total Sequence more than Sequence Request", "error");
      }
      else {

        for (var varLoop = varSequence; varLoop <= varSequence; ++varLoop) {
          $("#sum").val(varSum);
          var datas = [];
          for (var i = 1; i <= x; i++) {
            var data = {
              sequence: $('#sequence').val(),
              allowance: $('#allowance').val(),
              transport: $('#transport').val(),
              airport_tax: $('#airport_tax').val(),
              accomodation: $('#accomodation').val(),
              other: $('#other').val(),
              sum: $('#sum').val(),
            }
            datas.push(data);
          }

          var json_object = JSON.stringify(datas);

          $.ajax({
            type: "POST",
            url: '{{route('BRF.storePaymentSequenceBrf')}}',
            data: json_object,
            contentType: "application/json",
            processData: true,
            headers: {
              'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            success: function(data) {
              Swal.fire("Success !", "Data Has Been Updated", "success");
              y++;
              $.each(data, function(key, val) {

                varTotal += +val.sum;
                if(varBudgetRequest < varTotal){
                  Swal.fire("Error !", "Your request budget is not Sufficient", "error");
                }
                else{
                  $('#tableBrf').append('<tr id="control-group"><td><center><button class="btn btn-outline-danger btn-rounded btn-sm my-0 remove-val-list remove-attachment" style="border-radius: 100px;"><i class="fa fa-trash"></i></button></center></td><td style="text-align:center;"><span id="lastWorkId_' + y + '">' + val.sequence + '</span></td><td style="text-align:center;"><span id="lastWorkName_' + y + '">' + val.allowance + '</span></td><td style="text-align:center;"><span id="lastProductId_' + y + '">' + val.transport + '</span></td><td style="text-align:center;"><span id="lastProductName_' + y + '">' + val.airport_tax + '</span></td><td style="text-align:center;"><span id="lastUom_' + y + '">' + val.accomodation + '</span></td><td style="text-align:center;"><span id="lastUom_' + y + '">' + val.other + '</span></td></tr>');
                  $("#sequence").val(varLoop);

                  valAllowance += +val.allowance;
                  valTransport += +val.transport;
                  valAirportTax += +val.airport_tax;
                  valAccomodation += +val.accomodation;
                  valOthers += +val.other;

                  varTotalBrf = +valAllowance + +valTransport + +valAirportTax + +valAccomodation + +valOthers;

                  $("#valAllowance").html(valAllowance);
                  $("#valTransport").html(valTransport);
                  $("#valAirportTax").html(valAirportTax);
                  $("#valAccomodation").html(valAccomodation);
                  $("#valOthers").html(valOthers);

                  $("#totalBrf").html(varTotalBrf);
                  $("#totalSequence").html(varSequenceReq);

                  $(".brfhide6").show();
                }
              });
            },
            error: function(data) {
              Swal.fire("Error !", "Data Canceled Added", "error");
            }
          });
        }
      }
    }
  }
</script>




<script>
  $('#saveBrfList').click(function() {

    var origin_budget = document.forms["formHeaderBrf"]["origin_budget"].value;
    var projectcode = document.forms["formHeaderBrf"]["projectcode"].value;
    var sitecode = document.forms["formHeaderBrf"]["sitecode"].value;
    var requestNameArf = document.forms["formHeaderBrf"]["requestNameArf"].value;
    var jobTitle = document.forms["formHeaderBrf"]["jobTitle"].value;
    var department = document.forms["formHeaderBrf"]["department"].value;
    var reasonTravel = document.forms["formHeaderBrf"]["reasonTravel"].value;
    var headStationLocation = document.forms["formHeaderBrf"]["headStationLocation"].value;
    var bussinesLocation = document.forms["formHeaderBrf"]["bussinesLocation"].value;
    var contactPhone = document.forms["formHeaderBrf"]["contactPhone"].value;

    if (origin_budget == "") {
      Swal.fire("Error !", "Please Input Origin Budget !", "error");
    } else if (projectcode == "") {
      Swal.fire("Error !", "Please Input Project Code !", "error");
    } else if (sitecode == "") {
      Swal.fire("Error !", "Please Input Site Code !", "error");
    } else if (requestNameArf == "") {
      Swal.fire("Error !", "Please Input Requester !", "error");
    } else if (jobTitle == "") {
      Swal.fire("Error !", "Please Input Job Title !", "error");
    } else if (department == "") {
      Swal.fire("Error !", "Please Input Department !", "error");
    } else if (reasonTravel == "") {
      Swal.fire("Error !", "Please Input Reason Travel !", "error");
    } else if (headStationLocation == "") {
      Swal.fire("Error !", "Please Input Head Station Location !", "error");
    } else if (bussinesLocation == "") {
      Swal.fire("Error !", "Please Input Bussines Trip Location !", "error");
    } else if (contactPhone == "") {
      Swal.fire("Error !", "Please Input Contact Phone !", "error");
    } else {

      const swalWithBootstrapButtons = Swal.mixin({
        confirmButtonClass: 'btn btn-success btn-sm',
        cancelButtonClass: 'btn btn-danger  btn-sm',
        buttonsStyling: true,
      })

      swalWithBootstrapButtons.fire({

        title: 'Are you sure?',
        text: "Save this data?",
        type: 'question',

        showCancelButton: true,
        confirmButtonText: 'Yes, save it!',
        cancelButtonText: 'No, cancel!',
        reverseButtons: true
      }).then((result) => {
        if (result.value) {
          swalWithBootstrapButtons.fire(
            'Succesful!',
            'Data has been updated !',
            'success'
          )

          //Batas

          var datax = [];
          for (var i = 1; i <= y; i++) {
            var data = {
              lastWorkId: $('#lastWorkId_' + i).html(),
              lastWorkName: $('#lastWorkName_' + i).html(),
              lastProductId: $('#lastProductId_' + i).html(),
              lastProductName: $('#lastProductName_' + i).html(),
              lastQty: $('#lastQty_' + i).val(),
              lastUom: $('#lastUom_' + i).html(),
              lastPrice: $('#lastPrice_' + i).html(),
              totalArfDetails: $('#totalArfDetails_' + i).html(),
              lastCurrency: $('#lastCurrency_' + i).html(),
              lastRemark: $('#lastRemark_' + i).html(),

            }
            datax.push(data);
          }

          var json_object = JSON.stringify(datax);
          console.log(json_object);

          $.ajax({
            type: "POST",
            url: '{{route('ARF.tests')}}',
            data: json_object,
            contentType: "application/json",
            processData: true,
            headers: {
              'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            success: function(data) {
              console.log(data);
            },
            error: function(data) {
              Swal.fire("Error !", "Data Canceled Added", "error");
            }
          });

          //EndBatas

        } else if (
          result.dismiss === Swal.DismissReason.cancel
        ) {
          swalWithBootstrapButtons.fire(
            'Cancelled',
            'Process Canceled !',
            'error'
          )
        }
      })
    }
  });
</script>