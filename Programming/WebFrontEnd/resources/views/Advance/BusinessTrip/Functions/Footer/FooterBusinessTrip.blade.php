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
    $("#dateEnd").css("background-color", "white");
    $("#dateArrival").prop("disabled", true);
    $("#dateArrival").css("background-color", "white");
    $("#putProductId2").prop("disabled", true);
    $("#sequenceRequest").prop("disabled", true);
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

    $(".budgetDetail").show();

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
            $("#putProductId2").prop("disabled", false);
            var putProductName = "";
            var putProductId = "";
            $("#statusProduct").val("Yes");
          } else {
            $("#putProductId2").prop("disabled", true);
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
          $("#totalBalance").val(parseFloat(qty * price).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
          $("#combinedBudget").val(combinedBudget);
          $("#brfhide1").show();
          $(".klikBudgetDetail2").prop("disabled", true);
          $("#sequenceRequest").val('1');
          $("#statusEditBrf").val('No');
        });
      }
    });

  }
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
    
    
    var putProductId = $('#putProductId').val();

    if(putProductId === ""){
      $("#putProductId").focus();
      $("#putProductId").attr('required', true);
      $("#putProductId").css("border", "1px solid red");
    }
    else if(varBudgetRequest === ""){
      $("#budgetRequest").focus();
      $("#budgetRequest").attr('required', true);
      $("#budgetRequest").css("border", "1px solid red");
    }
    else if (varSequence > varSequenceReq) {
      Swal.fire("Error !", "Total Sequence more than Sequence Request", "error");
    } else {

      if (varSequence == varSequenceReq) {
        $("#saveBrfList").prop("disabled", false);
      }

      var sequence = $('#sequence').val().replace(/,/g, '');
      var allowance = $('#allowance').val().replace(/,/g, '');
      var transport = $('#transport').val().replace(/,/g, '');
      var airport_tax = $('#airport_tax').val().replace(/,/g, '');
      var accomodation = $('#accomodation').val().replace(/,/g, '');
      var other = $('#other').val().replace(/,/g, '');

      var varLoop = +varSequence + 1;
      $("#sequence").val(varLoop);

      var varTotal = +allowance + +transport + +airport_tax + +accomodation + +other;

      if (parseFloat(varTotal) > parseFloat(varBudgetRequest)) {

        Swal.fire("Error !", "Total Budget more than Budget Request", "error");
        var varLoop = $("#sequence").val() - 1;
        $("#sequence").val(varLoop);

      } else {

        $("#totalSequence").html(varSequenceReq);
        
        if($("#valAllowance").html() == ""){ $("#valAllowance").html('0'); }
        var valAllowance = parseFloat($("#valAllowance").html().replace(/,/g, ''));
        $("#valAllowance").html(parseFloat(+valAllowance + +allowance).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        
        if($("#valTransport").html() == ""){ $("#valTransport").html('0'); }
        var valTransport = parseFloat($("#valTransport").html().replace(/,/g, ''));
        $("#valTransport").html(parseFloat(+valTransport + +transport).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        if($("#valAirportTax").html() == ""){ $("#valAirportTax").html('0'); }
        var valAirportTax = parseFloat($("#valAirportTax").html().replace(/,/g, ''));
        $("#valAirportTax").html(parseFloat(+valAirportTax + +airport_tax).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        if($("#valAccomodation").html() == ""){ $("#valAccomodation").html('0'); }
        var valAccomodation = parseFloat($("#valAccomodation").html().replace(/,/g, ''));
        $("#valAccomodation").html(parseFloat(+valAccomodation + +accomodation).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        if($("#valOthers").html() == ""){ $("#valOthers").html('0'); }
        var valOthers = parseFloat($("#valOthers").html().replace(/,/g, ''));
        $("#valOthers").html(parseFloat(+valOthers + +other).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        if($("#totalBrf").html() == ""){ $("#totalBrf").html('0'); }
        var totalBrf = parseFloat($("#totalBrf").html().replace(/,/g, ''));
        $("#totalBrf").html(parseFloat(+totalBrf + +varTotal).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        var html = '<tr>' +
          '<td style="border:1px solid #e9ecef;width:7%;">' +
          '&nbsp;&nbsp;<button type="button" class="btn btn-xs" onclick="RemoveBusinessTrip(this);"  data-id1="' + allowance + '" data-id2="' + transport + '" data-id3="' + airport_tax + '" data-id4="' + accomodation + '" data-id5="' + other + '" style="border: 1px solid #ced4da;padding-left:2px;padding-right:2px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/delete.png" width="18" alt="" title="Remove"></button> ' +
          '&nbsp;<button type="button" class="btn btn-xs " onclick="EditBusinessTrip(this);" data-dismiss="modal" data-id1="' + allowance + '" data-id2="' + transport + '" data-id3="' + airport_tax + '" data-id4="' + accomodation + '" data-id5="' + other + '" style="border: 1px solid #ced4da;padding-left:2px;padding-right:2px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/edit.png" width="17" alt="" title="Edit"></button> ' +
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
        $("#statusEditBrf").val('No');
        $(".brfhide6").show();
        $(".klikBudgetDetail2").prop("disabled", false);
      }
    }
    $("#allowance").val("0.00");
    $("#transport").val("0.00");
    $('#airport_tax').val("0.00");
    $("#accomodation").val("0.00");
    $("#other ").val("0.00");
  }
</script>

<script>

    function RemoveBusinessTrip(tr) {
        var i = tr.parentNode.parentNode.rowIndex;
        document.getElementById("tableBrf").deleteRow(i);

        var varSequence = $('#sequence').val();
        $("#sequence").val(varSequence - 1);


        var $this = $(tr);
        allowance = $this.data("id1");
        transport = $this.data("id2");
        airportTax = $this.data("id3");
        accomodation = $this.data("id4");
        others = $this.data("id5");
        
        var valAllowance = parseFloat($("#valAllowance").html().replace(/,/g, ''));
        $("#valAllowance").html(parseFloat(valAllowance - allowance).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        var valTransport = parseFloat($("#valTransport").html().replace(/,/g, ''));
        $("#valTransport").html(parseFloat(valTransport - transport).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        var valAirportTax = parseFloat($("#valAirportTax").html().replace(/,/g, ''));
        $("#valAirportTax").html(parseFloat(valAirportTax - airportTax).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        var valAccomodation = parseFloat($("#valAccomodation").html().replace(/,/g, ''));
        $("#valAccomodation").html(parseFloat(valAccomodation - accomodation).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        
        var valOthers = parseFloat($("#valOthers").html().replace(/,/g, ''));
        $("#valOthers").html(parseFloat(valOthers - others).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        varTotalBrf = +allowance + +transport + +airportTax + +accomodation + +others;
        var totalBrf = parseFloat($("#totalBrf").html().replace(/,/g, ''));
        $("#totalBrf").html(parseFloat(totalBrf - varTotalBrf).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    }

    function EditBusinessTrip(tr) {
      var i = tr.parentNode.parentNode.rowIndex;
        document.getElementById("tableBrf").deleteRow(i);
        
        var varSequence = $('#sequence').val();
        $("#sequence").val(varSequence - 1);

        var $this = $(tr);
        $("#allowance").val($this.data("id1"));
        $("#transport").val($this.data("id2"));
        $("#airport_tax").val($this.data("id3"));
        $("#accomodation").val($this.data("id4"));
        $("#other").val($this.data("id5"));

        allowance = $this.data("id1");
        transport = $this.data("id2");
        airportTax = $this.data("id3");
        accomodation = $this.data("id4");
        others = $this.data("id5");

        $('#ValidateAllowance').val(allowance);
        $('#ValidateTransport').val(transport);
        $('#ValidateAirportTax').val(airportTax);
        $('#ValidateAccomodation').val(accomodation);
        $('#ValidateOther').val(others);
        
        var valAllowance = parseFloat($("#valAllowance").html().replace(/,/g, ''));
        $("#valAllowance").html(parseFloat(valAllowance - allowance).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        var valTransport = parseFloat($("#valTransport").html().replace(/,/g, ''));
        $("#valTransport").html(parseFloat(valTransport - transport).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        var valAirportTax = parseFloat($("#valAirportTax").html().replace(/,/g, ''));
        $("#valAirportTax").html(parseFloat(valAirportTax - airportTax).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        var valAccomodation = parseFloat($("#valAccomodation").html().replace(/,/g, ''));
        $("#valAccomodation").html(parseFloat(valAccomodation - accomodation).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        
        var valOthers = parseFloat($("#valOthers").html().replace(/,/g, ''));
        $("#valOthers").html(parseFloat(valOthers - others).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        varTotalBrf = +allowance + +transport + +airportTax + +accomodation + +others;
        var totalBrf = parseFloat($("#totalBrf").html().replace(/,/g, ''));
        $("#totalBrf").html(parseFloat(totalBrf - varTotalBrf).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        $("#statusEditBrf").val('Yes');
        $(".klikBudgetDetail2").prop("disabled", true);
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
      $("#transportType").css("border", "1px solid #ced4da");
      $("#transportBooking").css("border", "1px solid #ced4da");
      $("#dateDepart").css("border", "1px solid #ced4da");
      $("#dateArrival").css("border", "1px solid #ced4da");
      $("#qoutedFare").css("border", "1px solid #ced4da");
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

<script type="text/javascript">
    function CancelDetailBrf() {
        $(".klikBudgetDetail2").prop("disabled", false);
        $("#putProductId2").prop("disabled", true);

        var sequence = $('#sequence').val().replace(/^\s+|\s+$/g, '');
        var allowance = $('#allowance').val().replace(/^\s+|\s+$/g, '');
        var transport = $('#transport').val().replace(/^\s+|\s+$/g, '');
        var airport_tax = $('#airport_tax').val().replace(/^\s+|\s+$/g, '');
        var accomodation = $('#accomodation').val().replace(/^\s+|\s+$/g, '');
        var other = $('#other').val().replace(/^\s+|\s+$/g, '');
        
        var statusEditBrf = $("#statusEditBrf").val();

        if (statusEditBrf == "Yes") {

          var varSequence = $('#sequence').val();
          $("#sequence").val(+varSequence + +1);

          var allowance = $('#ValidateAllowance').val().replace(/^\s+|\s+$/g, '');
          var transport = $('#ValidateTransport').val().replace(/^\s+|\s+$/g, '');
          var airport_tax = $('#ValidateAirportTax').val().replace(/^\s+|\s+$/g, '');
          var accomodation = $('#ValidateAccomodation').val().replace(/^\s+|\s+$/g, '');
          var other = $('#ValidateOther').val().replace(/^\s+|\s+$/g, '');
          
          var html = '<tr>' +
          '<td style="border:1px solid #e9ecef;width:7%;">' +
          '&nbsp;&nbsp;<button type="button" class="btn btn-xs" onclick="RemoveBusinessTrip(this);"  data-id1="' + allowance + '" data-id2="' + transport + '" data-id3="' + airport_tax + '" data-id4="' + accomodation + '" data-id5="' + other + '" style="border: 1px solid #ced4da;padding-left:2px;padding-right:2px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/delete.png" width="18" alt="" title="Remove"></button> ' +
          '&nbsp;<button type="button" class="btn btn-xs " onclick="EditBusinessTrip(this);" data-dismiss="modal" data-id1="' + allowance + '" data-id2="' + transport + '" data-id3="' + airport_tax + '" data-id4="' + accomodation + '" data-id5="' + other + '" style="border: 1px solid #ced4da;padding-left:2px;padding-right:2px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/edit.png" width="17" alt="" title="Edit"></button> ' +
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
          $("#statusEditBrf").val('No');
        }
        
        if($("#valAllowance").html() == ""){ $("#valAllowance").html('0'); }
        var valAllowance = parseFloat($("#valAllowance").html().replace(/,/g, ''));
        $("#valAllowance").html(parseFloat(+valAllowance + +allowance).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        
        if($("#valTransport").html() == ""){ $("#valTransport").html('0'); }
        var valTransport = parseFloat($("#valTransport").html().replace(/,/g, ''));
        $("#valTransport").html(parseFloat(+valTransport + +transport).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        if($("#valAirportTax").html() == ""){ $("#valAirportTax").html('0'); }
        var valAirportTax = parseFloat($("#valAirportTax").html().replace(/,/g, ''));
        $("#valAirportTax").html(parseFloat(+valAirportTax + +airport_tax).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        if($("#valAccomodation").html() == ""){ $("#valAccomodation").html('0'); }
        var valAccomodation = parseFloat($("#valAccomodation").html().replace(/,/g, ''));
        $("#valAccomodation").html(parseFloat(+valAccomodation + +accomodation).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        if($("#valOthers").html() == ""){ $("#valOthers").html('0'); }
        var valOthers = parseFloat($("#valOthers").html().replace(/,/g, ''));
        $("#valOthers").html(parseFloat(+valOthers + +other).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        if($("#totalBrf").html() == ""){ $("#totalBrf").html('0'); }
        var totalBrf = parseFloat($("#totalBrf").html().replace(/,/g, ''));
        var varTotal = +allowance + +transport + +airport_tax + +accomodation + +other;
        $("#totalBrf").html(parseFloat(+totalBrf + +varTotal).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        $("#putProductId").val("");
        $("#putProductName").val("");
        $("#allowance").val("0.00");
        $("#transport").val("0.00");
        $("#airport_tax").val("0.00");
        $("#accomodation").val("0.00");
        $("#other").val("0.00");
        // $("#totalBalance").val("");
    }
</script>


<script>
    $('document').ready(function() {
        $('#budgetRequest').keyup(function() {

            var budgetRequest = parseFloat($(this).val().replace(/,/g, ''));
            var totalBalance = parseFloat($('#totalBalance').val().replace(/,/g, ''));

            if (parseFloat(budgetRequest) == '') {
                $('#budgetRequest').val(0);
            } else if (parseFloat(budgetRequest) > parseFloat(totalBalance)) {
                Swal.fire("Error !", "Your Budget Request is Over", "error");
                $("#budgetRequest").val(0);
                $("#budgetRequest").css("border", "1px solid red");
            }  else {
                $("#budgetRequest").css("border", "1px solid #ced4da");
            }
        });
    });
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

<script type="text/javascript">
  function CancelBusinessTrip() {
    $("#loading").show();
    $(".loader").show();
    window.location.href = '/BusinessTripRequest?var=1';
  }
</script>
