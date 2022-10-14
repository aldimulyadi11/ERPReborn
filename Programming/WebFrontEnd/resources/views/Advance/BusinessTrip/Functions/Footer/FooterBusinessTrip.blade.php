<script type="text/javascript">
  $(document).ready(function() {
    $("#brfhide1").hide();
    $("#brfhide3").hide();
    $("#brfhide4").hide();
    $(".FormTransportDetails").hide();
    $(".brfhide6").hide();
    $(".budgetDetail").hide();
    $("#tableShowHideBOQ3").hide();
    $("#sitecode2").prop("disabled", true);
    $("#request_name2").prop("disabled", true);
    $("#saveBrfList").prop("disabled", true);
    $("#dateEnd").prop("disabled", true);
    $("#dateArrival").prop("disabled", true);
  });
</script>

<script>
  $(document).ready(function() {
    $('#longTerm').click(function() {
      $("#sequenceRequest").val('0');
      $(".budgetDetail").show();
      $("#sequenceRequest").prop("disabled", false);
    });

    $('#shortTerm').click(function() {
      $("#sequenceRequest").val('1');
      $(".budgetDetail").show();
      $("#sequenceRequest").prop("disabled", true);
    });

    $('#dayTripTravel').click(function() {
      $("#sequenceRequest").val('1');
      $(".budgetDetail").show();
      $("#sequenceRequest").prop("disabled", true);
    });
  });
</script>

<script>
  var varTotal = 0;
  var valAllowance = 0;
  var valTransport = 0;
  var valAirportTax = 0;
  var valAccomodation = 0;
  var valOthers = 0;
  var varTotalBrf = 0;
  var y = 0;

  function addFromDetailtoCartJs() {
    var varBudgetRequest = $('#budgetRequest').val().replace(/,/g, '');
    var varSequenceReq = $('#sequenceRequest').val();
    var varSequence = $('#sequence').val();
    var varAllowance = $('#allowance').val().replace(/,/g, '');
    var varTransport = $('#transport').val().replace(/,/g, '');
    var varAirport_tax = $('#airport_tax').val().replace(/,/g, '');
    var varAccomodation = $('#accomodation').val().replace(/,/g, '');
    var varOther = $('#other').val().replace(/,/g, '');
    if (varSequence > varSequenceReq) {
      Swal.fire("Error !", "Total Sequence more than Sequence Request", "error");
    } else {

      if (varSequence == varSequenceReq) {
        $("#saveBrfList").prop("disabled", false);
      }

      var sequence = $('#sequence').val();
      var allowance = $('#allowance').val();
      var transport = $('#transport').val();
      var airport_tax = $('#airport_tax').val();
      var accomodation = $('#accomodation').val();
      var other = $('#other').val();

      var varLoop = +varSequence + 1;
      $("#sequence").val(varLoop);

      var varTotal = +allowance + +transport + +airport_tax + +accomodation + +other;

      if (varTotal > varBudgetRequest) {

        Swal.fire("Error !", "Total Budget more than Budget Request", "error");
        var varLoop = $("#sequence").val() - 1;
        $("#sequence").val(varLoop);

      } else {

        valAllowance += +allowance;
        valTransport += +transport;
        valAirportTax += +airport_tax;
        valAccomodation += +accomodation;
        valOthers += +other;

        varTotalBrf = +valAllowance + +valTransport + +valAirportTax + +valAccomodation + +valOthers;

        $("#valAllowance").html(valAllowance);
        $("#valTransport").html(valTransport);
        $("#valAirportTax").html(valAirportTax);
        $("#valAccomodation").html(valAccomodation);
        $("#valOthers").html(valOthers);
        $("#totalBrf").html(varTotalBrf);
        $("#totalSequence").html(varSequenceReq);

        var html = '<tr>' +
          '<td style="border:1px solid #e9ecef;width:7%;">' +
          '&nbsp;&nbsp;<button type="button" class="btn btn-xs RemoveBusinessTrip" style="border: 1px solid #ced4da;padding-left:2px;padding-right:2px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/delete.png" width="18" alt="" title="Remove"></button> ' +
          '&nbsp;<button type="button" class="btn btn-xs EditAdvance" data-dismiss="modal" data-id1="' + allowance + '" data-id2="' + transport + '" data-id3="' + airport_tax + '" data-id4="' + accomodation + '" data-id5="' + other + '" style="border: 1px solid #ced4da;padding-left:2px;padding-right:2px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/edit.png" width="17" alt="" title="Edit"></button> ' +
          '<input type="hidden" name="sequence[]" value="' + sequence + '">' +
          '<input type="hidden" name="allowance[]" value="' + allowance + '">' +
          '<input type="hidden" name="transport[]" value="' + transport + '">' +
          '<input type="hidden" name="airport_tax[]" value="' + airport_tax + '">' +
          '<input type="hidden" name="accomodation[]" value="' + accomodation + '">' +
          '<input type="hidden" name="other[]" value="' + other + '">' +
          '</td>' +
          '<td style="border:1px solid #e9ecef;width:20%;">' + allowance + '</td>' +
          '<td style="border:1px solid #e9ecef;width:20%;">' + transport + '</td>' +
          '<td style="border:1px solid #e9ecef;width:20%;">' + airport_tax + '</td>' +
          '<td style="border:1px solid #e9ecef;width:20%;">' + accomodation + '</td>' +
          '<td style="border:1px solid #e9ecef;width:13%;">' + other + '</td>' +
          '</tr>';

        $('table.tableBrf tbody').append(html);
        $(".brfhide6").show();
      }
    }
    $("body").on("click", ".RemoveBusinessTrip", function() {
      var varLoop = varSequence - 1;
      $("#sequence").val(varLoop);
      $(this).closest("tr").remove();

      if (varSequenceReq != varLoop) {
        $("#saveBrfList").prop("disabled", true);
      }
    });

    $("body").on("click", ".edit", function() {
      var $this = $(this);
      var id1 = $this.data("id1");
      var id2 = $this.data("id2");
      var id3 = $this.data("id3");
      var id4 = $this.data("id4");
      var id5 = $this.data("id5");
      $("#allowance").val(id1);
      $("#transport").val(id2);
      $('#airport_tax').val(id3);
      $("#accomodation").val(id4);
      $("#other ").val(id5);

      var varLoop = varSequence - 1;
      $("#sequence").val(varLoop);
      $(this).closest("tr").remove();
    });

    $("#allowance").val("");
    $("#transport").val("");
    $('#airport_tax').val("");
    $("#accomodation").val("");
    $("#other ").val("");
  }
</script>

<script type="text/javascript">
  function CancelBusinessTrip() {
    $("#loading").show();
    $(".loader").show();
    location.reload();
  }
</script>

<script>
  function klikProject(code, name) {
    $("#projectcode").val(code);
    $("#projectname").val(name);
    $("#sitecode2").prop("disabled", false);

    $.ajaxSetup({
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });

    $.ajax({
      type: 'GET',
      url: '{!! route("getSite") !!}?projectcode=' + $('#projectcode').val(),
      success: function(data) {

        var no = 1;

        var t = $('#tableGetSite').DataTable();
        t.clear();
        $.each(data, function(key, val) {
          t.row.add([
            '<tbody><tr><td>' + no++ + '</td>',
            '<td><span data-dismiss="modal" onclick="klikSite(\'' + val.sys_ID + '\', \'' + val.sys_Text + '\');">' + val.sys_ID + '</span></td>',
            '<td style="border:1px solid #e9ecef;">' + val.sys_Text + '</td></tr></tbody>'
          ]).draw();
        });
      }
    });
  }
</script>

<script>
  function klikSite(code, name) {
    $("#sitecode").val(code);
    $("#sitename").val(name);
    $("#sitecode2").prop("disabled", true);
    $("#projectcode2").prop("disabled", true);
    $("#tableShowHideBOQ3").show();
    $("#request_name2").prop("disabled", false);
    $("#request_name").attr('required', true);

    $.ajaxSetup({
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });

    $.ajax({
      type: 'GET',
      url: '{!! route("getBudget") !!}?sitecode=' + $('#sitecode').val(),
      success: function(data) {
        var no = 1;
        $.each(data, function(key, val2) {
          if(val2.quantityAbsorption == "0.00" && val2.quantity == "0.00"){
              var applied = 0;
          }
          else{
              var applied = Math.round(parseFloat(val2.quantityAbsorption) / parseFloat(val2.quantity) * 100);
          }
          var status = "";
          if(applied >= 100){
              var status = "disabled";
          }
          var html = '<tr>' +
            '<td style="border:1px solid #e9ecef;width:5%;">' +
            '&nbsp;&nbsp;<button type="reset" ' + status + ' class="btn btn-sm klikBudgetDetail klikBudgetDetail2' + status + '" data-id1="' + val2.product_RefID + '" data-id2="' + val2.quantityRemain + '" data-id3="' + val2.unitPriceBaseCurrencyValue + '" data-id4="' + val2.sys_ID + '" data-id5="' + val2.productName + '" data-id6="' + val2.quantityUnitName + '" data-id7="' + val2.priceBaseCurrencyISOCode + '" style="border: 1px solid #ced4da;padding-left:4px;padding-right:4px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/add.png" width="15" alt="" title="Add to Detail"></button>' +
            '</td>' +
            '<td style="border:1px solid #e9ecef;">' +
            '<div class="progress progress-xs" style="height: 14px;border-radius:8px;"> @if('+ applied +' >= '+0+' && '+ applied +' <= '+40+')<div class="progress-bar bg-red" style="width:'+ applied +'%;"></div> @elseif('+ applied +' >= '+41+' && '+ applied +' <= '+89+')<div class="progress-bar bg-blue" style="width:'+ applied +'%;"></div> @elseif('+ applied + ' >= '+ 90 +' && ' + applied + ' <= '+ 100 +')<div class="progress-bar bg-green" style="width:'+ applied +'%;"></div> @else<div class="progress-bar bg-grey" style="width:100%;"></div> @endif</div><small><center>'+ applied +' %</center></small>' +
            '</td>' +
            '<td style="border:1px solid #e9ecef;">' + '<span id="getWorkId">' + val2.combinedBudgetSubSectionLevel1_RefID + '</span>' + '</td>' +
            '<td style="border:1px solid #e9ecef;">' + '<span id="getWorkName">' + val2.combinedBudgetSubSectionLevel2Name + '</span>' + '</td>' +
            '<td style="border:1px solid #e9ecef;">' + '<span id="getProductId">' + val2.product_RefID + '</span>' + '</td>' +
            '<td style="border:1px solid #e9ecef;">' + '<span id="getProductName">' + val2.productName + '</span>' + '</td>' +
            '<td style="border:1px solid #e9ecef;">' + '<span id="getQty">' + val2.quantity.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</span>' + '</td>' +
            '<td style="border:1px solid #e9ecef;">' + '<span id="getQty2">' + val2.quantityRemain.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</span>' + '</td>' +
            '<td style="border:1px solid #e9ecef;">' + '<span id="getPrice">' + val2.unitPriceBaseCurrencyValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</span>' + '</td>' +
            '<td style="border:1px solid #e9ecef;">' + '<span id="totalArf">' + val2.priceBaseCurrencyValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</span>' + '</td>' +
            '<td style="border:1px solid #e9ecef;">' + '<span id="getUom">' + val2.quantityUnitName + '</span>' + '</td>' +
            '<td style="border:1px solid #e9ecef;">' + '<span id="getCurrency">' + val2.priceBaseCurrencyISOCode + '</span>' + '</td>' +
            '</tr>';

          $('table.tableBudgetDetail tbody').append(html);
        });

        $('.klikBudgetDetail').on('click', function(e) {
          e.preventDefault();
          var $this = $(this);
          var price = $this.data("id3");
          var productId = $this.data("id1");
          var qty = $this.data("id2");
          var combinedBudget = $this.data("id4");
          var productName = $this.data("id5");
          var uom = $this.data("id6");
          var currency = $this.data("id7");

          if (productName == "Unspecified Product") {
            $("#product_id2").prop("disabled", false);
            var putProductName = "";
            var putProductId = "";
            $("#statusProduct").val("Yes");
          } else {
            $("#product_id2").prop("disabled", true);
            var putProductName = productName;
            var putProductId = productId;
            $("#statusProduct").val("No");
          }
          $("#putProductId").val(putProductId);
          $("#putProductName").val(putProductName);
          $("#qtyCek").val(qty);
          $("#putQty").val(qty);
          $("#putUom").val(uom);
          $("#priceCek").val(parseFloat(price).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
          $("#putPrice").val(price);
          $("#putCurrency").val(currency);
          $("#totalArfDetails").val(parseFloat(qty * price).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
          $("#totalPieceMealDetails").val(parseFloat(qty * price).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
          $("#totalProcReqDetails").val(parseFloat(qty * price).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
          $("#totalBalance").val(parseFloat(qty * price).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
          $("#combinedBudget").val(combinedBudget);
          $("#brfhide1").show();
          $(".klikBudgetDetail2").prop("disabled", true);
        });
      }
    });

  }
</script>


<script type="text/javascript">

    function AddFormTransportDetails() {  
      $(".FormTransportDetails").show();
    }

    function CancelFormTransportDetails() {  
      $(".FormTransportDetails").hide();
      $("#transportType").val("");
      $("#transportBooking").val("");
      $("#dateDepart").val("");
      $("#dateArrival").val("");
      $("#qoutedFare").val("");
    }

    function UpdateFormTransportDetails() {

      var transportType = $("#transportType").val();
      var transportBooking = $("#transportBooking").val();
      var dateDepart = $("#dateDepart").val();
      var dateArrival = $("#dateArrival").val();
      var qoutedFare = $("#qoutedFare").val();

      if (transportType === "") {
          $("#transportType").focus();
          $("#transportType").attr('required', true);
          $("#transportType").css("border", "1px solid red");
      }else if (transportBooking === "") {
          $("#transportBooking").focus();
          $("#transportBooking").attr('required', true);
          $("#transportBooking").css("border", "1px solid red");
          $("#transportType").css("border", "1px solid #ced4da");
      }else if (dateDepart === "") {
          $("#dateDepart").focus();
          $("#dateDepart").attr('required', true);
          $("#dateDepart").css("border", "1px solid red");
          $("#transportBooking").css("border", "1px solid #ced4da");
      }else if (dateArrival === "") {
          $("#dateArrival").focus();
          $("#dateArrival").attr('required', true);
          $("#dateArrival").css("border", "1px solid red");
          $("#dateDepart").css("border", "1px solid #ced4da");
      }else if (qoutedFare === "") {
          $("#qoutedFare").focus();
          $("#qoutedFare").attr('required', true);
          $("#qoutedFare").css("border", "1px solid red");
          $("#dateArrival").css("border", "1px solid #ced4da");
      }
      else {
        $("#transportType").css("border", "1px solid #ced4da");
        $("#transportBooking").css("border", "1px solid #ced4da");
        $("#dateDepart").css("border", "1px solid #ced4da");
        $("#dateArrival").css("border", "1px solid #ced4da");
        $("#qoutedFare").css("border", "1px solid #ced4da");
        $(".FormTransportDetails").hide();
        var html = '<tr>' +
            '<td style="border:1px solid #e9ecef;width:10px;">' +
            '&nbsp;<button type="button" class="btn btn-xs" onclick="RemoveTransportDetails(this);" style="border: 1px solid #ced4da;padding-left:2px;padding-right:2px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/delete.png" width="18" alt="" title="Remove"></button> ' +
            '<input type="hidden" name="transportType[]" value="' + transportType + '">' +
            '<input type="hidden" name="transportBooking[]" value="' + transportBooking + '">' +
            '<input type="hidden" name="dateDepart[]" value="' + dateDepart + '">' +
            '<input type="hidden" name="dateArrival[]" value="' + dateArrival + '">' +
            '<input type="hidden" name="qoutedFare[]" value="' + qoutedFare + '">' +
            '</td>' +
            '<td style="border:1px solid #e9ecef;">' + transportType + '</td>' +
            '<td style="border:1px solid #e9ecef;">' + transportBooking + '</td>' +
            '<td style="border:1px solid #e9ecef;">' + dateDepart + '</td>' +
            '<td style="border:1px solid #e9ecef;">' + dateArrival + '</td>' +
            '<td style="border:1px solid #e9ecef;">' + qoutedFare + '</td>' +
            '</tr>';

          $('table.TableTransportDetails tbody').append(html);
          
        $("#transportType").val("");
        $("#transportBooking").val("");
        $("#dateDepart").val("");
        $("#dateArrival").val("");
        $("#qoutedFare").val("");
      }
    }

    function RemoveTransportDetails(tr) {
        var i = tr.parentNode.parentNode.rowIndex;
        document.getElementById("TableTransportDetails").deleteRow(i);
    }
</script>

<script>
  $(function() {
    $("#FormSubmitBusinessTrip").on("submit", function(e) { //id of form 
      e.preventDefault();
      var valRequestName = $("#request_name").val();
      var valRemark = $("#putRemark").val();
      $("#request_name").css("border", "1px solid #ced4da");
      $("#putRemark").css("border", "1px solid #ced4da");

      if (valRequestName === "") {
        $("#request_name").focus();
        $("#request_name").attr('required', true);
        $("#request_name").css("border", "1px solid red");
      } else if (valRemark === "") {
        $("#putRemark").focus();
        $("#putRemark").attr('required', true);
        $("#putRemark").css("border", "1px solid red");
      } else {
        var action = $(this).attr("action"); //get submit action from form
        var method = $(this).attr("method"); // get submit method
        var form_data = new FormData($(this)[0]); // convert form into formdata 
        var form = $(this);


        const swalWithBootstrapButtons = Swal.mixin({
          confirmButtonClass: 'btn btn-success btn-sm',
          cancelButtonClass: 'btn btn-danger btn-sm',
          buttonsStyling: true,
        })

        swalWithBootstrapButtons.fire({

          title: 'Are you sure?',
          text: "Save this data?",
          type: 'question',

          showCancelButton: true,
          confirmButtonText: '<img src="{{ asset("AdminLTE-master/dist/img/save.png") }}" width="13" alt=""><span style="color:black;">Yes, save it </span>',
          cancelButtonText: '<img src="{{ asset("AdminLTE-master/dist/img/cancel.png") }}" width="13" alt=""><span style="color:black;"> No, cancel </span>',
          confirmButtonColor: '#e9ecef',
          cancelButtonColor: '#e9ecef',
          reverseButtons: true
        }).then((result) => {
          if (result.value) {

            $("#loading").show();
            $(".loader").show();

            $.ajax({
              url: action,
              dataType: 'json', // what to expect back from the server
              cache: false,
              contentType: false,
              processData: false,
              data: form_data,
              type: method,
              success: function(response) {

                $("#loading").hide();
                $(".loader").hide();

                swalWithBootstrapButtons.fire({

                  title: 'Successful !',
                  type: 'success',
                  html: 'Data has been saved. Your transaction number is ' + '<span style="color:red;">' + response.brfnumber + '</span>',
                  showCloseButton: false,
                  showCancelButton: false,
                  focusConfirm: false,
                  confirmButtonText: '<span style="color:black;"> Ok </span>',
                  confirmButtonColor: '#4B586A',
                  confirmButtonColor: '#e9ecef',
                  reverseButtons: true
                }).then((result) => {
                  if (result.value) {
                    $("#loading").show();
                    $(".loader").show();

                    window.location.href = '/BusinessTripRequest?var=1';
                  }
                })
              },

              error: function(response) { // handle the error
                Swal.fire("Cancelled", "Data Cancel Inputed", "error");
              },

            })


          } else if (
            result.dismiss === Swal.DismissReason.cancel
          ) {
            swalWithBootstrapButtons.fire({

              title: 'Cancelled',
              text: "Process Canceled",
              type: 'error',
              confirmButtonColor: '#e9ecef',
              confirmButtonText: '<span style="color:black;"> Ok </span>',

            }).then((result) => {
                if (result.value) {
                  $("#loading").show();
                  $(".loader").show();

                  window.location.href = '/BusinessTripRequest?var=1';
                }
              })
          }
        })
      }
    });

  });
</script>

<script>
  var date = new Date();
  var today = new Date(date.setMonth(date.getMonth() - 3));
  document.getElementById('dateCommance').setAttribute('min', today.toISOString().split('T')[0]);
  document.getElementById('dateDepart').setAttribute('min', today.toISOString().split('T')[0]);
</script>

<script>
  $(document).ready(function() {
    $('#dateCommance').change(function() {
      $("#dateEnd").prop("disabled", false);
      var dateCommance = new Date($("#dateCommance").val());
      document.getElementById('dateEnd').setAttribute('min', dateCommance.toISOString().split('T')[0]);
    });

    $('#dateDepart').change(function() {
      $("#dateArrival").prop("disabled", false);
      var dateDepart = new Date($("#dateDepart").val());
      document.getElementById('dateArrival').setAttribute('min', dateDepart.toISOString().split('T')[0]);
    });
  });
</script>

