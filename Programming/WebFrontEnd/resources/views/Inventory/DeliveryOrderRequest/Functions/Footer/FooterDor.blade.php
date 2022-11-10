<script type="text/javascript">
    $(document).ready(function() {
        $(".headerDor1").hide();
        $(".headerDor2").hide();
        $(".headerDor3").hide();
        $(".headerDor4").hide();
        $("#detailPR").hide();
        $("#detailDor").hide();
        $(".detailDorList").hide();
        $("#tableShowHideDor").hide();
        $("#headerPrNumber2").prop("disabled", true);
        $("#pr_number2").prop("disabled", true);
    });
</script>

<script>
    function klikProject(code, name) {
        $("#projectcode").val(code);
        $("#projectname").val(name);
        $("#pr_number2").prop("disabled", false);

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $.ajax({
            type: 'GET',
            url: '{!! route("DeliveryOrderRequest.DeliveryOrderRequestByBudgetID") !!}?projectcode=' + $('#projectcode').val(),
            success: function(data) {

                var no = 1;
                t = $('#tableSearchPrInDor').DataTable();
                $.each(data.DataAdvanceRequest, function(key, val) {
                    t.row.add([
                        '<tbody><tr><td>' + no++ + '</td>',
                        '<td><span data-dismiss="modal" onclick="klikPrNumberInDor(\'' + val.sys_ID + '\', \'' + val.documentNumber + '\', \'' + val.requesterWorkerJobsPosition_RefID + '\', \'' + val.requesterWorkerName + '\');">' + val.documentNumber + '</span></td>',
                        '<td><span data-dismiss="modal" onclick="klikPrNumberInDor(\'' + val.sys_ID + '\', \'' + val.documentNumber + '\', \'' + val.requesterWorkerJobsPosition_RefID + '\', \'' + val.requesterWorkerName + '\');">' + val.combinedBudget_RefID + '</span></td>',
                        '<td><span data-dismiss="modal" onclick="klikPrNumberInDor(\'' + val.sys_ID + '\', \'' + val.documentNumber + '\', \'' + val.requesterWorkerJobsPosition_RefID + '\', \'' + val.requesterWorkerName + '\');">' + val.combinedBudgetName + '</span></td>',
                        '<td><span data-dismiss="modal" onclick="klikPrNumberInDor(\'' + val.sys_ID + '\', \'' + val.documentNumber + '\', \'' + val.requesterWorkerJobsPosition_RefID + '\', \'' + val.requesterWorkerName + '\');">' + val.combinedBudgetSection_RefID + '</span></td>',
                        '<td><span data-dismiss="modal" onclick="klikPrNumberInDor(\'' + val.sys_ID + '\', \'' + val.documentNumber + '\', \'' + val.requesterWorkerJobsPosition_RefID + '\', \'' + val.requesterWorkerName + '\');">' + val.combinedBudgetSectionName + '</span></td>',
                    ]).draw();

                });
            }
        });
    }
</script>


<script>
    function klikPrNumberInDor(id, docNum, reqId, reqName) {
        var pr_RefID = id;
        var pr_number = docNum;
        var requester_RefID = reqId;
        var requester_name = reqName;
        $("#pr_number").val(docNum);
        $("#tableShowHideDor").show();
        $("#projectcode2").prop("disabled", true);
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $.ajax({
            type: "POST",
            url: '{!! route("DeliveryOrderRequest.DeliveryOrderRequestByPrID") !!}?pr_RefID=' + pr_RefID,
            success: function(data) {
                $.each(data.varData, function(key, value) {
                    var html =
                        '<tr>' +
                        '<td style="border:1px solid #e9ecef;width:5%;">' +
                        '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-xs AddToDetail AddToDetail2" data-dismiss="modal" data-id0="' + value.combinedBudget_SubSectionLevel1_RefID + '" data-id1="' + pr_number + '" data-id2="' + value.product_RefID + '" data-id3="' + value.productName + '" data-id4="' + value.quantity + '" data-id5="' + value.productUnitPriceCurrencyValue + '" data-id6="' + value.priceBaseCurrencyValue + '" style="border: 1px solid #ced4da;padding-left:2px;padding-right:2px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/add.png" width="18" alt="" title="Add"></button> ' +
                        '</td>' +
                        '<td style="border:1px solid #e9ecef;">' +
                        '<div class="progress progress-xs" style="height: 14px;border-radius:8px;"><div class="progress-bar bg-red" style="width:50%;"></div><small><center>50 %</center></small></div>' +
                        '</td>' +
                        '<td style="border:1px solid #e9ecef;">' + pr_number + '</td>' +
                        '<td style="border:1px solid #e9ecef;">' + value.product_RefID + '</td>' +
                        '<td style="border:1px solid #e9ecef;">' + value.productName + '</td>' +
                        '<td style="border:1px solid #e9ecef;">' + value.quantity.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
                        '<td style="border:1px solid #e9ecef;">' + value.productUnitPriceCurrencyValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
                        '<td style="border:1px solid #e9ecef;">' + value.priceBaseCurrencyValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
                        '</tr>';

                    $('table.tablePrDetailDor tbody').append(html);
                });

                $("body").on("click", ".AddToDetail", function() {
                    $("#detailDor").show();

                    var $this = $(this);
                    $("#putWorkId").val($this.data("id0"));
                    $("#pr_number_detail").val($this.data("id1"));
                    $("#putProductId").val($this.data("id2"));
                    $("#putProductName").val($this.data("id3"));
                    $("#qtyCek").val($this.data("id4").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                    $("#putQty").val($this.data("id4"));
                    $("#priceCek").val($this.data("id5").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                    $("#putPrice").val($this.data("id5"));
                    $("#average").val($this.data("id6").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                    $("#totalBalance").val($this.data("id4").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

                    $(".AddToDetail2").prop("disabled", true);
                    $(".ActionButton").prop("disabled", true);

                });
            },
        });
    }
</script>

<script type="text/javascript">
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    function addFromDetailtoCartJs() {
        var date = new Date().toJSON().slice(0, 10).replace(/-/g, '-');
        var valQty = $("#qtyCek").val();
        var valPrice = $("#priceCek").val();

        $("#qtyCek").css("border", "1px solid #ced4da");
        $("#priceCek").css("border", "1px solid #ced4da");

        if (valQty === "") {
            $("#qtyCek").focus();
            $("#qtyCek").attr('required', true);
            $("#qtyCek").css("border", "1px solid red");
        } else if (valPrice === "") {
            $("#priceCek").focus();
            $("#priceCek").attr('required', true);
            $("#priceCek").css("border", "1px solid red");
        } else {
            $.ajax({
                type: "POST",
                url: '{!! route("DeliveryOrderRequest.StoreValidateDeliveryOrderRequest") !!}?putProductId=' + $('#putProductId').val() + '&putWorkId=' + $('#putWorkId').val(),
                success: function(data) {

                    if (data == "200") {

                        $("#product_id2").prop("disabled", true);
                        var trano = $("#pr_number_detail").val();
                        var work_id = $("#putWorkId").val();
                        var putProductId = $("#putProductId").val();
                        var putProductName = $("#putProductName").val();
                        var qtyCek = $('#qtyCek').val().replace(/^\s+|\s+$/g, '');
                        var priceCek = $("#priceCek").val().replace(/^\s+|\s+$/g, '');
                        var average = $("#average").val().replace(/^\s+|\s+$/g, '');
                        var totalBalance = $("#totalBalance").val();
                        var putPrice = $('#putPrice').val();

                        //TOTAL ADVANCE
                        if($("#TotalDeliveryOrderRequest").html() == ""){
                            $("#TotalDeliveryOrderRequest").html('0');
                        }
                        var TotalDeliveryOrderRequest = parseFloat($("#average").val().replace(/,/g, ''));
                        var TotalDeliveryOrderRequest2 = parseFloat($("#TotalDeliveryOrderRequest").html().replace(/,/g, ''));
                        $("#TotalDeliveryOrderRequest").html(parseFloat(+TotalDeliveryOrderRequest2 + TotalDeliveryOrderRequest).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

                        var html = '<tr>' +
                            '<td style="border:1px solid #e9ecef;width:7%;">' +
                            '&nbsp;&nbsp;<button type="button" class="btn btn-xs ActionButton" onclick="RemoveAdvance(\'' + work_id + '\', \'' + putProductId + '\', \'' + average + '\', this);" style="border: 1px solid #ced4da;padding-left:2px;padding-right:2px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/delete.png" width="18" alt="" title="Remove"></button> ' +
                            '&nbsp;<button type="button" class="btn btn-xs ActionButton" onclick="EditAdvance(this)" data-dismiss="modal" data-id0="' + work_id + '" data-id1="' + putProductId + '" data-id2="' + putProductName + '" data-id3="' + qtyCek + '" data-id4="' + priceCek + '" data-id5="' + average + '" data-id6="' + totalBalance + '" style="border: 1px solid #ced4da;padding-left:2px;padding-right:2px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/edit.png" width="17" alt="" title="Edit"></button> ' +
                            '<input type="hidden" name="var_putProductId[]" value="' + putProductId + '">' +
                            '<input type="hidden" name="var_product_name[]" id="var_product_name" value="' + putProductName + '">' +
                            '<input type="hidden" name="var_quantity[]" value="' + parseFloat(qtyCek.replace(/,/g, '')) + '">' +
                            '<input type="hidden" name="var_price[]" value="' + parseFloat(priceCek.replace(/,/g, '')) + '">' +
                            '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + trano + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + work_id + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + putProductId + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + putProductName + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + qtyCek + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + priceCek + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + average + '</td>' +
                            '</tr>';

                        $('table.TableDorCart tbody').append(html);
                        $("#statusEditDor").val("No");


                        $("#pr_number_detail").val("");
                        $("#putWorkId").val("");
                        $("#putProductId").val("");
                        $("#putProductName").val("");
                        $("#qtyCek").val("");
                        $("#priceCek").val("");
                        $("#average").val("");
                        $("#totalBalance").val("");

                        $(".AddToDetail2").prop("disabled", false);
                        $(".ActionButton").prop("disabled", false);
                        $(".detailDorList").show();

                    } else {
                        Swal.fire("Error !", "Please use edit to update this item !", "error");
                    }
                },
            });
        }
    }
    
</script>

<script type="text/javascript">
    function CancelDetailDor() {
        var trano = $('#advance_number_detail').val();
        var work_id = $("#putWorkId").val();
        var putProductId = $("#putProductId").val();
        var putProductName = $("#putProductName").val();
        var qtyCek = $('#qtyCek').val().replace(/^\s+|\s+$/g, '');
        var priceCek = $("#priceCek").val().replace(/^\s+|\s+$/g, '');
        var average = $("#average").val().replace(/^\s+|\s+$/g, '');
        var totalBalance = $("#totalBalance").val();
        var putPrice = $('#putPrice').val();
        var statusEditDor = $("#statusEditDor").val();

        if (statusEditDor == "Yes") {

            qtyCek = $('#ValidateQuantity').val();
            priceCek = $('#ValidatePrice').val();
            average = parseFloat(qtyCek.replace(/,/g, '') * priceCek.replace(/,/g, ''));

            $.ajaxSetup({
                headers: {
                    'X-CSRFcac-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            
            $.ajax({
                type: "POST",
                url: '{!! route("DeliveryOrderRequest.StoreValidateDeliveryOrderRequest") !!}?putProductId=' + $('#putProductId').val() + '&putWorkId=' + $('#putWorkId').val(),
                success: function(data) {

                    if (data == "200") {

                        let html = '<tr>' +
                            '<td style="border:1px solid #e9ecef;width:7%;">' +
                            '&nbsp;&nbsp;<button type="button" class="btn btn-xs ActionButton" onclick="RemoveDor(\'' + work_id + '\', \'' + putProductId + '\', \'' + average + '\', this);" style="border: 1px solid #ced4da;padding-left:2px;padding-right:2px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/delete.png" width="18" alt="" title="Remove"></button> ' +
                            '&nbsp;<button type="button" class="btn btn-xs ActionButton" onclick="EditDor(this)" data-dismiss="modal" data-id0="' + work_id + '" data-id1="' + putProductId + '" data-id2="' + putProductName + '" data-id3="' + qtyCek + '" data-id4="' + priceCek + '" data-id5="' + average.toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '" data-id6="' + totalBalance + '" data-id7="' + trano + '" style="border: 1px solid #ced4da;padding-left:2px;padding-right:2px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/edit.png" width="17" alt="" title="Edit"></button> ' +
                            '<input type="hidden" name="var_putProductId[]" value="' + putProductId + '">' +
                            '<input type="hidden" name="var_product_name[]" id="var_product_name" value="' + putProductName + '">' +
                            '<input type="hidden" name="var_quantity[]" value="' + qtyCek + '">' +
                            '<input type="hidden" name="var_price[]" value="' + priceCek + '">' +
                            '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + trano + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + work_id + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + putProductId + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + putProductName + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + qtyCek + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + priceCek + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + average + '</td>' +
                            '</tr>';
                        $('table.TableDorCart tbody').append(html);

                        var TotalDeliveryOrderRequest = parseFloat($("#TotalDeliveryOrderRequest").html().replace(/,/g, ''));
                        $("#TotalDeliveryOrderRequest").html(parseFloat(+TotalDeliveryOrderRequest + average).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

                    }else {
                        Swal.fire("Error !", "Please use edit to update this item !", "error");
                    }
                },
            });
            $("#statusEditDor").val("No");
        }

        $(".AddToDetail2").prop("disabled", false);
        $(".ActionButton").prop("disabled", false);

        $("#putProductId").css("border", "1px solid #ced4da");
        $("#putProductId").val("");
        $("#putProductName").val("");
        $("#qtyCek").val("");
        $("#putUom").val("");
        $("#priceCek").val("");
        $("#putCurrency").val("");
        $("#totalBalance").val("");
        $("#average").val("");
    }
</script>

<script>
    $('document').ready(function() {
        $('.ChangeQty').keyup(function() {
            var qtyReq = $(this).val().replace(/[^a-zA-Z0-9 ]/g, "");
            if (qtyReq == 0 || qtyReq == '') {
                qtyReq = 0;
            }
            var qtyDorHide = $('#qtyDorHide').val();
            
            if (qtyReq == '') {
                $("#addFromDetailDortoCart").prop("disabled", true);

            } else if (qtyReq > qtyDorHide) {
                Swal.fire("Error !", "Your Qty Request is Over", "error");
                $("#qtyDorDetail").val(qtyDorHide);
                $("#addFromDetailDortoCart").prop("disabled", true);
            } else {
                $("#addFromDetailDortoCart").prop("disabled", false);
            }

        });
    });
</script>


<script type="text/javascript">
    $(document).ready(function() {
      $(".deliverType").on('click', function(e) {
          e.preventDefault();
          var valType = $(".deliverType").val();
          if(valType == "Warehouse to Site"){
              $(".headerDor1").show();
              $(".headerDor2").hide();
              $(".headerDor3").hide();
              $(".headerDor4").hide();
          }
          else if(valType == "Warehouse to Warehouse"){
              $(".headerDor2").show();
              $(".headerDor1").hide();
              $(".headerDor3").hide();
              $(".headerDor4").hide();
          }
          else if(valType == "Supplier to Site"){
              $(".headerDor3").show();
              $(".headerDor2").hide();
              $(".headerDor1").hide();
              $(".headerDor4").hide();
          }
          else if(valType == "Site to Warehouse"){
              $(".headerDor4").show();
              $(".headerDor3").hide();
              $(".headerDor2").hide();
              $(".headerDor1").hide();
          }
      });

      $(".siteName1").on('click', function(e) {
          e.preventDefault();
          var valSite = $(".siteName1").val();
          if(valSite == "WH-001"){
              $("#headerAddressSiteName1").val("Jl. Baru Leko. Kode Pos, : 97796. Desa/Kelurahan, : DESA LEKO SULA. Kecamatan/Kota (LN), Kec. Mangoli Barat, Kab. Kepulauan Sula, Prov. Maluku Utara");
          }
          else if(valSite == "WH-002"){
              $("#headerAddressSiteName1").val("Bekasi cyber park, RT.001/RW.009, Kayuringin Jaya, Kec. Bekasi Bar., Kota Bks, Jawa Barat 17415");
          }
      });

      $(".siteName2").on('click', function(e) {
          e.preventDefault();
          var valSite = $(".siteName2").val();
          if(valSite == "WH-001"){
              $("#headerAddressSiteName2").val("Jl. Baru Leko. Kode Pos, : 97796. Desa/Kelurahan, : DESA LEKO SULA. Kecamatan/Kota (LN), Kec. Mangoli Barat, Kab. Kepulauan Sula, Prov. Maluku Utara");
          }
          else if(valSite == "WH-002"){
              $("#headerAddressSiteName2").val("Bekasi cyber park, RT.001/RW.009, Kayuringin Jaya, Kec. Bekasi Bar., Kota Bks, Jawa Barat 17415");
          }
      });

      $(".siteName3").on('click', function(e) {
          e.preventDefault();
          var valSite = $(".siteName3").val();
          if(valSite == "WH-001"){
              $("#headerAddressSiteName3").val("Jl. Baru Leko. Kode Pos, : 97796. Desa/Kelurahan, : DESA LEKO SULA. Kecamatan/Kota (LN), Kec. Mangoli Barat, Kab. Kepulauan Sula, Prov. Maluku Utara");
          }
          else if(valSite == "WH-002"){
              $("#headerAddressSiteName3").val("Bekasi cyber park, RT.001/RW.009, Kayuringin Jaya, Kec. Bekasi Bar., Kota Bks, Jawa Barat 17415");
          }
      });
    });
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $(".CancelDor").click(function() {
            $("#tableShowHideDor").find("input,button,textarea,select").attr("disabled", false);
        });
    });
</script>