<!--  SHOW HIDE AVAILABEL -->
<script type="text/javascript">
    $(document).ready(function() {
        // $("#detailPurchaseRequisitionList").hide();
        // $("#detailTransAvail").hide();
        $("#projectcode2").prop("disabled", true);
        $("#sitecode2").prop("disabled", true);
        $("#addFromDetailtoCart").prop("disabled", true);
        // $("#showContentBOQ3").hide();
        // $("#tableShowHideBOQ3").hide();

        $("#iconProductId2").hide();
        $("#iconQty2").hide();
        $("#iconUnitPrice2").hide();
        $("#iconRemark2").hide();
        $("#product_id2").prop("disabled", true);

        // $("#submitPR").prop("disabled", true);
    });
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $(".detailTransaction").click(function() {
            $("#tableShowHideBOQ1").find("input,button,textarea,select").attr("disabled", false);
            $("#tableShowHideBOQ3").find("input,button,textarea,select").attr("disabled", false);
        });
    });
</script>


<script type="text/javascript">
    $(document).ready(function() {
        $(".CancelDetailPurchaseRequisition").click(function() {
            let product_id = $("#putProductId").val();
            let putProductName = $("#putProductName").val();
            let qtyCek = $('#qtyCek').val();
            let putUom = $("#putUom").val();
            let priceCek = $("#priceCek").val();
            let putCurrency = $("#putCurrency").val();
            let totalProcReqDetails = $("#totalProcReqDetails").val();
            let putRemark = $("#putRemark").val();
            let totalBalance = $("#totalBalance").val();
            let putPrice = $('#putPrice').val();
            let combinedBudget = $("#combinedBudget").val();
            let recordIDDetail = $("#recordIDDetail").val();
            let statusEditProcReqRevision = $("#statusEditProcReqRevision").val();

            if (statusEditProcReqRevision == "Yes") {

                qtyCek = $('#ValidateQuantity').val();
                priceCek = $('#ValidatePrice').val();
                totalProcReqDetails = parseFloat(qtyCek.replace(/,/g, '') * priceCek.replace(/,/g, ''));
                putRemark = $("#ValidateRemark").val();

                var html = '<tr>' +
                    '<td style="border:1px solid #e9ecef;width:5%;">' +
                    '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-xs EditPurchaseRequisition" data-dismiss="modal" data-id1="' + product_id + '" data-id2="' + putProductName + '" data-id3="' + qtyCek + '" data-id4="' + putUom + '" data-id5="' + priceCek + '" data-id6="' + putCurrency + '" data-id7="' + totalProcReqDetails.toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '" data-id8="' + putRemark + '" data-id9="' + totalBalance + '"  style="border: 1px solid #ced4da;padding-left:4px;padding-right:4px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/edit.png" width="18" alt="" title="Edit"></button> ' +
                    '<input type="hidden" name="var_product_id[]" value="' + product_id + '">' +
                    '<input type="hidden" name="var_product_name[]" id="var_product_name" value="' + putProductName + '">' +
                    '<input type="hidden" name="var_quantity[]" value="' + qtyCek + '">' +
                    '<input type="hidden" name="var_uom[]" value="' + putUom + '">' +
                    '<input type="hidden" name="var_price[]" value="' + priceCek + '">' +
                    '<input type="hidden" name="var_totalPrice[]" value="' + (priceCek * qtyCek) + '">' +
                    '<input type="hidden" name="var_currency[]" value="' + putCurrency + '">' +
                    '<input type="hidden" name="var_remark[]" value="' + putRemark + '">' +
                    '<input type="hidden" name="var_combinedBudget[]" value="' + combinedBudget + '">' +
                    '<input type="hidden" name="var_recordIDDetail[]" value="' + recordIDDetail + '">' +
                    '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + product_id + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + putProductName + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + qtyCek + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + putUom + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + priceCek + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + totalProcReqDetails.toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + putCurrency + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + putRemark + '</td>' +
                    '</tr>';
                $('table.TablePurchaseRequisition tbody').append(html);
                $("#statusEditProcReqRevision").val("No");
            }
            $("#tableShowHideBOQ1").find("input,button,textarea,select").attr("disabled", false);
            $("#tableShowHideBOQ3").find("input,button,textarea,select").attr("disabled", false);
            $("#putProductId").css("border", "1px solid #ced4da");

            $("#putProductId").val("");
            $("#putProductName").val("");
            $("#qtyCek").val("");
            $("#putUom").val("");
            $("#priceCek").val("");
            $("#putCurrency").val("");
            $("#totalBalance").val("");
            $("#totalProcReqDetails").val("");
            $("#putRemark").val("");
        });
    });
</script>
<script type="text/javascript">
    function addFromDetailtoCartJs() {

        var valProductId = $("#putProductId").val();
        var valQty = $("#qtyCek").val();
        var valPrice = $("#priceCek").val();
        var valRemark = $("#putRemark").val();
        var totalPo = parseFloat($("#totalPo").val().replace(/,/g, ''));
        var totalProcReqDetails = parseFloat($("#totalProcReqDetails").val().replace(/,/g, ''));
        $("#putProductId").css("border", "1px solid #ced4da");
        $("#qtyCek").css("border", "1px solid #ced4da");
        $("#priceCek").css("border", "1px solid #ced4da");
        $("#putRemark").css("border", "1px solid #ced4da");
        console.log(totalPo);
        console.log(totalProcReqDetails);
        if (valProductId === "") {
            $("#putProductId").focus();
            $("#putProductId").attr('required', true);
            $("#putProductId").css("border", "1px solid red");
        } else if (valQty === "") {
            $("#qtyCek").focus();
            $("#qtyCek").attr('required', true);
            $("#qtyCek").css("border", "1px solid red");
        } else if (valPrice === "") {
            $("#priceCek").focus();
            $("#priceCek").attr('required', true);
            $("#priceCek").css("border", "1px solid red");
        } else if (valRemark === "") {
            $("#putRemark").focus();
            $("#putRemark").attr('required', true);
            $("#putRemark").css("border", "1px solid red");
        } else if (totalPo > totalProcReqDetails) {
            Swal.fire("Error !", "Your request must bigger than total PO !", "error");
        } else {

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $.ajax({
                type: "POST",
                url: '{!! route("PurchaseRequisition.StoreValidatePurchaseRequisition") !!}?putProductId=' + $('#putProductId').val(),
                success: function(data) {

                    if (data == "200") {

                        $("#product_id2").prop("disabled", true);

                        var product_id = $("#putProductId").val();
                        var putProductName = $("#putProductName").val();
                        var qtyCek = $('#qtyCek').val().replace(/^\s+|\s+$/g, '');
                        var putUom = $("#putUom").val();
                        var priceCek = $("#priceCek").val().replace(/^\s+|\s+$/g, '');
                        var putCurrency = $("#putCurrency").val();
                        var totalProcReqDetails = $("#totalProcReqDetails").val().replace(/^\s+|\s+$/g, '');
                        var putRemark = $("#putRemark").val();
                        var totalBalance = $("#totalBalance").val();
                        var combinedBudget = $("#combinedBudget").val();
                        var recordIDDetail = $("#recordIDDetail").val();
                        var putPrice = $('#putPrice').val();
                        var html = '<tr>' +
                            '<td style="border:1px solid #e9ecef;width:5%;">' +
                            '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-xs EditPurchaseRequisition" data-dismiss="modal" data-id1="' + product_id + '" data-id2="' + putProductName + '" data-id3="' + qtyCek + '" data-id4="' + putUom + '" data-id5="' + priceCek + '" data-id6="' + putCurrency + '" data-id7="' + totalProcReqDetails + '" data-id8="' + putRemark + '" data-id9="' + totalBalance + '"  style="border: 1px solid #ced4da;padding-left:4px;padding-right:4px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/edit.png" width="18" alt="" title="Edit"></button> ' +
                            '<input type="hidden" name="var_product_id[]" value="' + product_id + '">' +
                            '<input type="hidden" name="var_product_name[]" id="var_product_name" value="' + putProductName + '">' +
                            '<input type="hidden" name="var_quantity[]" value="' + qtyCek + '">' +
                            '<input type="hidden" name="var_uom[]" value="' + putUom + '">' +
                            '<input type="hidden" name="var_price[]" value="' + priceCek + '">' +
                            '<input type="hidden" name="var_totalPrice[]" value="' + (priceCek * qtyCek) + '">' +
                            '<input type="hidden" name="var_currency[]" value="' + putCurrency + '">' +
                            '<input type="hidden" name="var_remark[]" value="' + putRemark + '">' +
                            '<input type="hidden" name="var_combinedBudget[]" value="' + combinedBudget + '">' +
                            '<input type="hidden" name="var_recordIDDetail[]" value="' + recordIDDetail + '">' +
                            '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + product_id + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + putProductName + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + qtyCek + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + putUom + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + priceCek + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + totalProcReqDetails + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + putCurrency + '</td>' +
                            '<td style="border:1px solid #e9ecef;">' + putRemark + '</td>' +
                            '</tr>';
                        $('table.TablePurchaseRequisition tbody').append(html);
                        $("#statusEditProcReqRevision").val("No");

                        $("body").on("click", ".RemovePurchaseRequisition", function() {
                            $(this).closest("tr").remove();
                            var ProductId = $(this).data("id1");
                            $.ajax({
                                type: "POST",
                                url: '{!! route("PurchaseRequisition.StoreValidatePurchaseRequisition2") !!}?putProductId=' + ProductId,
                            });
                        });
                        $("body").on("click", ".EditPurchaseRequisition", function() {
                            var $this = $(this);

                            $.ajax({
                                type: "POST",
                                url: '{!! route("PurchaseRequisition.StoreValidatePurchaseRequisition2") !!}?putProductId=' + $this.data("id1"),
                            });

                            $("#putProductId").val($this.data("id1"));
                            $("#putProductName").val($this.data("id2"));
                            $('#qtyCek').val($this.data("id3").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                            $("#putUom").val($this.data("id4"));
                            $("#priceCek").val($this.data("id5").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                            $("#putCurrency").val($this.data("id6"));
                            $("#totalProcReqDetails").val($this.data("id7").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                            $("#putRemark").val($this.data("id8"));
                            $("#totalBalance").val($this.data("id9"));
                            $("#ValidateQuantity").val($this.data("id3").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                            $("#ValidatePrice").val($this.data("id5").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                            $("#ValidateRemark").val($this.data("id8"));
                            $("#statusEditProcReqRevision").val("Yes");

                            $(this).closest("tr").remove();

                            if ($this.data("id10") == "Yes") {
                                $("#product_id2").prop("disabled", false);
                            } else {
                                $("#product_id2").prop("disabled", true);
                            }
                        });

                        $("#putProductId").val("");
                        $("#putProductName").val("");
                        $("#putUom").val("");
                        $("#qtyCek").val("");
                        $("#priceCek").val("");
                        $("#putCurrency").val("");
                        $("#putRemark").val("");
                        $("#totalProcReqDetails").val("");
                        $("#totalBalance").val("");

                        $("#iconProductId").hide();
                        $("#iconQty").hide();
                        $("#iconRemark").hide();
                        $("#iconProductId2").hide();
                        $("#iconQty2").hide();
                        $("#iconRemark2").hide();
                        $("#submitPR").prop("disabled", false);

                        $("#tableShowHideBOQ1").find("input,button,textarea,select").attr("disabled", false);
                        $("#tableShowHideBOQ3").find("input,button,textarea,select").attr("disabled", false);
                        $("#detailPurchaseRequisitionList").show();

                        $("#qtyCek").attr('required', false);
                        $("#putProductId").attr('required', false);
                        $("#priceCek").attr('required', false);
                    } else {
                        Swal.fire("Error !", "Please use edit to update this item !", "error");
                    }
                },
            });
        }
    }
</script>

<script type="text/javascript">
    //GET PR LIST 

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    var ProcReqRefID = $("#var_recordID").val();

    $.ajax({
        type: "POST",
        url: '{!! route("PurchaseRequisition.ProcReqListCartRevision") !!}?ProcReqRefID=' + ProcReqRefID,
        success: function(data) {
            $.each(data, function(key, value) {
                $("#product_id2").prop("disabled", true);
                var statusProduct = $("#statusProduct").val();
                var html = '<tr>' +
                    '<td style="border:1px solid #e9ecef;width:5%;">' +
                    '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-xs EditPurchaseRequisitionCart" data-dismiss="modal" data-id1="' + value.product_RefID + '" data-id2="' + value.productName + '" data-id3="' + value.quantity + '" data-id4="' + value.quantityUnitName + '" data-id5="' + value.productUnitPriceCurrencyValue + '" data-id6="' + value.priceCurrencyISOCode + '" data-id7="' + value.remarks + '" data-id8="' + value.priceBaseCurrencyValue + '" data-id9="' + statusProduct + '" data-id10="' + value.combinedBudgetSectionDetail_RefID + '" data-id11="' + value.sys_ID + '" data-id12="' + value.combinedBudget_Quantity + '" data-id13="' + value.combinedBudget_UnitPriceBaseCurrencyValue + '" data-id14="' + value.combinedBudget_PriceBaseCurrencyValue + '" style="border: 1px solid #ced4da;padding-left:4px;padding-right:4px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/edit.png" width="18" alt="" title="Edit"></button> ' +
                    '<input type="hidden" name="var_product_id[]" value="' + value.product_RefID + '">' +
                    '<input type="hidden" name="var_product_name[]" id="var_product_name" value="' + value.productName + '">' +
                    '<input type="hidden" name="var_quantity[]" value="' + value.quantity + '">' +
                    '<input type="hidden" name="var_uom[]" value="' + value.quantityUnitName + '">' +
                    '<input type="hidden" name="var_price[]" value="' + value.productUnitPriceCurrencyValue + '">' +
                    '<input type="hidden" name="var_totalPrice[]" value="' + (priceCek * qtyCek) + '">' +
                    '<input type="hidden" name="var_currency[]" value="' + value.priceCurrencyISOCode + '">' +
                    '<input type="hidden" name="var_remark[]" value="' + value.remarks + '">' +
                    '<input type="hidden" name="var_combinedBudget[]" value="' + value.combinedBudgetSectionDetail_RefID + '">' +
                    '<input type="hidden" name="var_recordIDDetail[]" value="' + value.sys_ID + '">' +
                    '<input type="hidden" name="var_statusProduct[]" value="' + statusProduct + '">' +
                    '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + value.product_RefID + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + value.productName + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + value.quantity.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + value.quantityUnitName + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + value.productUnitPriceCurrencyValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + value.priceBaseCurrencyValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + value.priceCurrencyISOCode + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + value.remarks + '</td>' +
                    '</tr>';

                $('table.TablePurchaseRequisition tbody').append(html);
            });

            $("body").on("click", ".EditPurchaseRequisitionCart", function() {
                alert("D");
                var $this = $(this);
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });

                $.ajax({
                    type: "POST",
                    url: '{!! route("PurchaseRequisition.StoreValidatePurchaseRequisition2") !!}?putProductId=' + $this.data("id1"),
                });

                $("#putProductId").val($this.data("id1"));
                $("#putProductName").val($this.data("id2"));
                $('#qtyCek').val($this.data("id3").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $('#putQty').val($this.data("id3"));
                $("#putUom").val($this.data("id4"));
                $("#priceCek").val($this.data("id5").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $("#putPrice").val($this.data("id5"));
                $("#putCurrency").val($this.data("id6"));
                $("#putRemark").val($this.data("id7"));
                $("#totalProcReqDetails").val($this.data("id8").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $("#totalBalance").val($this.data("id14").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $("#totalPayment").val("0");
                $("#combinedBudget").val($this.data("id10"));
                $("#recordIDDetail").val($this.data("id11"));
                $("#ValidateQuantity").val($this.data("id3").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $("#ValidatePrice").val($this.data("id5").toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $("#ValidateRemark").val($this.data("id7"));
                $("#statusEditProcReqRevision").val("Yes");


                $(this).closest("tr").remove();

                if ($this.data("id9") == "Yes") {
                    $("#product_id2").prop("disabled", false);
                } else {
                    $("#product_id2").prop("disabled", true);
                }
            });

            $("#putProductId").val("");
            $("#putProductName").val("");
            $("#qtyCek").val("");
            $("#putUom").val("");
            $("#priceCek").val("");
            $("#putCurrency").val("");
            $("#putRemark").val("");
            $("#totalProcReqDetails").val("");
            $("#totalRequester").val("");
            $("#totalQtyRequest").val("");
            $("#totalBalance").val("");

            $("#iconProductId").hide();
            $("#iconQty").hide();
            $("#iconRemark").hide();
            $("#iconProductId2").hide();
            $("#iconQty2").hide();
            $("#iconRemark2").hide();
            $("#tableShowHideBOQ1").find("input,button,textarea,select").attr("disabled", false);
            $("#tableShowHideBOQ3").find("input,button,textarea,select").attr("disabled", false);

        },
    });

    //GET BUDGET

    var siteCodePrRevAfter = $("#siteCodePrRevAfter").val();

    $.ajax({
        type: 'GET',
        url: '{!! route("getSite") !!}?sitecode=' + siteCodePrRevAfter,

        success: function(data) {
            var no = 1;
            $.each(data, function(key, value2) {
                var html = '<tr>' +
                    '<td style="border:1px solid #e9ecef;width:5%;">' +
                    '&nbsp;&nbsp;<button type="reset" class="btn btn-sm float-right klikBudgetProcReqRevision" data-id1="' + value2.product_RefID + '" data-id2="' + value2.quantity + '" data-id3="' + value2.unitPriceBaseCurrencyValue + '" data-id4="' + value2.sys_ID + '" data-id5="' + value2.productName + '" data-id6="' + value2.quantityUnitName + '" data-id7="' + value2.priceBaseCurrencyISOCode + '" style="border: 1px solid #ced4da;padding-left:4px;padding-right:4px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/add.png" width="15" alt="" title="Add to Detail"></button>' +
                    '</td>' +
                    '<td style="border:1px solid #e9ecef;">' +
                    '<div class="progress progress-xs" style="height: 14px;border-radius:8px;"><div class="progress-bar bg-red" style="width:50%;"></div><small><center>50 %</center></small></div>' +
                    '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + '<span>' + value2.combinedBudgetSubSectionLevel1_RefID + '</span>' + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + '<span>' + value2.combinedBudgetSubSectionLevel2Name + '</span>' + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + '<span>' + value2.product_RefID + '</span>' + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + '<span>' + value2.productName + '</span>' + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + '<span>' + 'N/A' + '</span>' + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + '<span>' + value2.quantity.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</span>' + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + '<span>' + value2.unitPriceBaseCurrencyValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</span>' + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + '<span>' + value2.priceBaseCurrencyValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</span>' + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + '<span>' + value2.quantityUnitName + '</span>' + '</td>' +
                    '<td style="border:1px solid #e9ecef;">' + '<span>' + value2.priceBaseCurrencyISOCode + '</span>' + '</td>' +
                    '</tr>';

                $('table.tableBudgetDetail tbody').append(html);
            });

            $('.klikBudgetProcReqRevision').on('click', function(e) {
                e.preventDefault();
                var $this = $(this);
                var price = $this.data("id3");
                var productId = $this.data("id1");
                var qty = $this.data("id2");
                var combinedBudget = $this.data("id4");
                var productName = $this.data("id5");
                var uom = $this.data("id6");
                var currency = $this.data("id7");
                var total = parseFloat(qty.replace(/,/g, '') * price.replace(/,/g, ''));

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
                $("#putPrice").val(price);
                $("#priceCek").val(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $("#putCurrency").val(currency);
                $("#totalBalance").val(total.toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $("#totalProcReqDetails").val(total.toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $("#combinedBudget").val(combinedBudget);
                $("#totalPayment").val("0");

                $("#ValidateQuantity").val($this.data("id2"));
                $("#ValidatePrice").val($this.data("id3"));


                $("#tableShowHideBOQ1").find("input,button,textarea,select").attr("disabled", true);
                $("#tableShowHideBOQ3").find("input,button,textarea,select").attr("disabled", true);
                $("#addFromDetailtoCart").prop("disabled", true);
                $(".available").show();
                $("#detailTransAvail").show();
                $("#putProductId2").prop("disabled", true);
            });
        }
    });
</script>

<script>
    $('document').ready(function() {
        $('.ChangeQty').keyup(function() {

            var qtyReq = $(this).val();
            var putQty = $('#putQty').val();
            var priceCek = parseFloat($('#priceCek').val().replace(/,/g, ''));
            var total = putQty * priceCek;
            var total2 = qtyReq * priceCek;

            if (parseFloat(qtyReq) == '') {
                $('#totalProcReqDetails').val(0);
                $("#qtyCek").css("border", "1px solid red");
            } else if (parseFloat(qtyReq) > parseFloat(putQty)) {
                Swal.fire("Error !", "Your Quantity Request is Over", "error");
                $("#qtyCek").val(0);
                $('#totalProcReqDetails').val(0);
                $("#qtyCek").css("border", "1px solid red");
            } else if (parseFloat(total2) > parseFloat(total)) {
                Swal.fire("Error !", "Your Request Is Over Budget", "error");
                $('#totalProcReqDetails').val(0);

                $("#qtyCek").css("border", "1px solid red");
            } else {
                var totalReq = parseFloat(total2);
                $('#totalProcReqDetails').val(parseFloat(totalReq).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $("#qtyCek").css("border", "1px solid #ced4da");
            }

        });
    });
</script>

<script>
    $('document').ready(function() {
        $('.ChangePrice').keyup(function() {

            var priceReq = parseFloat($(this).val().replace(/,/g, ''));
            var qtyCek = $('#qtyCek').val();
            var putPrice = parseFloat($('#putPrice').val().replace(/,/g, ''));
            var total = qtyCek * priceReq;
            var total2 = qtyCek * putPrice;
            var totalBalance = $("#totalBalance").val();

            if (priceReq == '') {
                $('#totalProcReqDetails').val(0);
                $("#priceCek").css("border", "1px solid red");
            } else if (parseFloat(total) > parseFloat(total2)) {
                Swal.fire("Error !", "Your Request Is Over Budget", "error");
                $("#priceCek").val(0);
                $('#totalProcReqDetails').val(0);
                $("#priceCek").css("border", "1px solid red");
            } else {
                var totalReq = total;
                $('#totalProcReqDetails').val(parseFloat(totalReq).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                $("#priceCek").css("border", "1px solid #ced4da");
            }

        });
    });
</script>

<script>
    $(function() {
        $("#FormSubmitProcReqRevision").on("submit", function(e) { //id of form 
            e.preventDefault();

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
                                html: 'Data has been saved updated',
                                showCloseButton: false,
                                showCancelButton: false,
                                focusConfirm: false,
                                confirmButtonText: '<span style="color:black;"> Ok </span>',
                                confirmButtonColor: '#4B586A',
                                confirmButtonColor: '#e9ecef',
                                reverseButtons: true
                            });

                            window.location.href = '/PurchaseRequisition?var=1';
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

                    })
                }
            })
        });

    });
</script>

<script type="text/javascript">
    function CancelPurchaseRequisition() {
        $("#loading").show();
        $(".loader").show();
        location.reload();
    }
</script>