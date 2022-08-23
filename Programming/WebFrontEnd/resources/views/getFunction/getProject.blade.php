<div id="myProject" class="modal fade" role="dialog" aria-labelledby="contohModalScrollableTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Choose Budget</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body table-responsive p-0" style="height: 400px;">
                                <table class="table table-head-fixed text-nowrap" id="tableGetProject">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Budget Code</th>
                                            <th>Budget Name</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php $no = 1 @endphp
                                        @foreach($dataProject as $dataProjects)
                                        <tr>
                                            <td>{{ $no++ }}</td>
                                            <td data-dismiss="modal" class="klikProject" data-id="{{$dataProjects['sys_ID']}}" data-name="{{$dataProjects['sys_Text']}}">{{$dataProjects['sys_ID']}}</td>
                                            <td>{{$dataProjects['sys_Text']}}</td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--|----------------------------------------------------------------------------------|
    |                            End Function My Project Code                          |
    |----------------------------------------------------------------------------------|-->

<script>
    // $('#tableGetSite').empty();

    $(function() {
        $('.klikProject').on('click', function(e) {
            e.preventDefault(); // in chase you change to a link or button
            let $this = $(this);
            let code = $this.data("id");
            let name = $this.data("name");
            $("#projectcode").val(code);
            $("#projectcode2").val(code);
            $("#projectname").val(name);
            $("#headerProjectCode").val(code);
            $("#sitecode2").prop("disabled", false);
            $("#advance_number2").prop("disabled", false);
            $("#headerPrNumber2").prop("disabled", false);

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $.ajax({
                type: 'GET',
                url: '{!! route("getProject") !!}?projectcode=' + $('#projectcode').val(),
                success: function(data) {

                    var no = 1;

                    var t = $('#tableGetSite').DataTable();
                    $.each(data, function(key, val) {

                        t.row.add([
                            '<tbody><tr><td>' + no++ + '</td>',
                            '<td><span data-dismiss="modal" class="klikSite" data-id="' + val.sys_ID + '" data-name="' + val.sys_Text + '">' + val.sys_ID + '</span></td>',
                            '<td style="border:1px solid #e9ecef;">' + val.sys_Text + '</td></tr></tbody>'
                        ]).draw();

                    });

                    $('.klikSite').on('click', function(e) {
                        e.preventDefault(); // in chase you change to a link or button
                        $("#projectcode2").prop("disabled", true);
                        $("#addToDoDetail").prop("disabled", false);

                        $("#tableShowHideDor").show();

                        $("#detailPR").show();
                        $("#brfhide3").show();
                        $(".pageArfBoq").show();
                        $(".pageDetailTransaction").show();
                        $("#showContentBOQ3").show();
                        $("#showContentBOQ2").show();
                        $("#tableShowHideBOQ2").show();
                        $("#tableShowHideBOQ3").show();
                        $("#customerPopUp").prop("disabled", false);
                        $("#currencyPopUp").prop("disabled", false);
                        $("#request_name2").prop("disabled", false);
                        $("#request_name").attr('required', true);
                        $("#tableShowHideGetBudgetArf").show();

                        var $this = $(this);
                        var code = $this.data("id");
                        var name = $this.data("name");
                        $("#sitecode").val(code);
                        $("#sitecode2").val(name);
                        $("#sitename").val(name);
                        $("#sitecode2").prop("disabled", true);
                        $("#productIdRemPopUp").prop("disabled", false);

                        //DATA MIX

                        $("#arfNumberAsf").prop("disabled", true);
                        $("#requester").val("requester 1");
                        $("#managerAsfUid").val("Manager 1");
                        $("#managerAsfName").val("Manager Detail 1");
                        $("#currency").val("IDR");
                        $("#currencyCode").val("IDR");
                        $("#financeArfUtableBudgetBrfid").val("finance 1");
                        $("#financeArfName").val("Finance Detail 1");
                        $("#remark").val("Remark 1");
                        $("#total").val("100000");
                        $("#totalDetail").val("Rp");


                        $.ajaxSetup({
                            headers: {
                                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                            }
                        });

                        $.ajax({
                            type: 'GET',
                            url: '{!! route("getSite") !!}?sitecode=' + $('#sitecode').val(),
                            success: function(data) {

                                var no = 1;
                                $.each(data, function(key, val2) {
                                    var html = '<tr>' +
                                        '<td style="border:1px solid #e9ecef;width:5%;">' +
                                        '&nbsp;&nbsp;<button type="reset" class="btn btn-sm klikBudgetDetail" data-id1="' + val2.product_RefID + '" data-id2="' + val2.quantity + '" data-id3="' + val2.unitPriceBaseCurrencyValue + '" data-id4="' + val2.sys_ID + '" data-id5="' + val2.productName + '" data-id6="' + val2.quantityUnitName + '" data-id7="' + val2.priceBaseCurrencyISOCode + '" style="border: 1px solid #ced4da;padding-left:4px;padding-right:4px;padding-top:2px;padding-bottom:2px;border-radius:3px;"><img src="AdminLTE-master/dist/img/add.png" width="15" alt="" title="Add to Detail"></button>' +
                                        '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' +
                                        '<div class="progress progress-xs" style="height: 14px;border-radius:8px;"><div class="progress-bar bg-red" style="width:50%;"></div><small><center>50 %</center></small></div>' +
                                        '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getWorkId">' + val2.combinedBudgetSubSectionLevel1_RefID + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getWorkName">' + val2.combinedBudgetSubSectionLevel2Name + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getProductId">' + val2.product_RefID + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getProductName">' + val2.productName + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getQty">' + 'N/A' + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getQty2">' + val2.quantity.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getPrice">' + val2.unitPriceBaseCurrencyValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="totalArf">' + val2.priceBaseCurrencyValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getUom">' + val2.quantityUnitName + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getCurrency">' + val2.priceBaseCurrencyISOCode + '</span>' + '</td>' +
                                        '</tr>';

                                    $('table.tableBudgetDetail tbody').append(html);
                                });

                                $.each(data, function(key, val2) {
                                    var html = '<tr>' +
                                        '<td style="border:1px solid #e9ecef;width:5%;">' +
                                        '&nbsp;&nbsp;<button type="reset" class="btn btn-outline-success btn-sm klikBudgetPr" data-id1="' + val2.name + '" data-id2="' + val2.quantity + '" data-id3="' + val2.unitPriceBaseCurrencyValue + '" data-id4="' + val2.priceBaseCurrencyValue + '" data-id5="' + code + '" title="Submit" style="border-radius: 100px;"><i class="fas fa-plus" aria-hidden="true"></i></button>' +
                                        '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getTranoDor">' + code + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getProjectDor">' + 'N/A' + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getSiteDor">' + 'N/A' + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getProductIdDor">' + val2.product_RefID + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getProductNameDor">' + val2.name + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getQtyDor">' + val2.quantity.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getPriceDor">' + val2.unitPriceBaseCurrencyValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getAverageDor">' + val2.priceBaseCurrencyValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</span>' + '</td>' +
                                        '<td style="border:1px solid #e9ecef;">' + '<span id="getAvailable">' + 'N/A' + '</span>' + '</td>' +
                                        '</tr>';

                                    $('table.tablePrDetailDor tbody').append(html);
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
                                    $("#totalBalance").val(parseFloat(qty * price).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                                    $("#combinedBudget").val(combinedBudget);


                                    $("#tableShowHideBOQ1").find("input,button,textarea,select").attr("disabled", true);
                                    $("#tableShowHideBOQ3").find("input,button,textarea,select").attr("disabled", true);
                                    // $("#addFromDetailtoCart").prop("disabled", true);
                                    $(".available").show();
                                    $("#detailTransAvail").show();
                                    $("#putProductId2").prop("disabled", true);
                                    $("#statusEditArf").val("No");
                                    $("#statusEditArfRevision").val("No");
                                });

                                $('.klikBudgetPr').on('click', function(e) {
                                    e.preventDefault();
                                    var $this = $(this);
                                    var productName = $this.data("id1");
                                    var qty = $this.data("id2");
                                    var prPrice = $this.data("id3");
                                    var average = $this.data("id4");
                                    var prNumber = $this.data("id5");
                                    $("#detailDor").show();
                                    $("#tableShowHideDor").find("input,button,textarea,select").attr("disabled", true);

                                    $("#prNumberDorDetail").val(prNumber);
                                    $("#projectDorDetail").val("N/A");
                                    $("#projectDorDetail2").val("N/A");
                                    $("#siteDorDetail").val("N/A");
                                    $("#siteDorDetail2").val("N/A");
                                    $("#workIdDorDetail").val("N/A");
                                    $("#workIdDorDetail2").val("N/A");
                                    $("#priceDorDetail").val(prPrice);
                                    $("#averageDorDetail").val(average);
                                    $("#qtyDorDetail").val(qty);
                                    $("#qtyDorDetail2").val("N/A");
                                    $("#productIdDorDetail").val("N/A");
                                    $("#productIdDorDetail2").val(productName);
                                    $("#prQty").val(qty);
                                    $("#inDorQty").val(qty);
                                    $("#balanceQty").val(qty);
                                    $("#qtyDorHide").val(qty);

                                });
                            }
                        });

                    });

                }
            });
        });

    });
</script>