<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <label class="card-title">
                    <ul class="navbar-nav ml-auto left">
                        <li class="nav-item dropdown user-menu">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" style="color:#4B586A;font-size:12px;height:12px;">
                                <span style="position:relative;bottom:5px;"><img src="{{ asset('AdminLTE-master/dist/img/add.png') }}" width="25" alt="" style="border: 1px solid #ced4da;padding-left:4px;padding-right:4px;padding-top:2px;padding-bottom:2px;border-radius:3px;"> SELECT ACTION </span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-left" style="padding: 10px;font-size:14px;background-color:#4B586A;margin-top:8px;">
                                @if(in_array("Module.SupplyChain.Procurement.PurchaseOrder.Transaction.Create", $privilageMenu, TRUE))
                                <li class="nav-item">
                                    <a href="{{ route('PurchaseOrder.index') }}" class="nav-link" style="color:white;padding-bottom:10px;">
                                        <i class="far fa-file nav-icon-sm"> Create Purchase Order</i>
                                    </a>
                                </li>
                                @endif
                                @if(in_array("Module.SupplyChain.Procurement.PurchaseOrder.Transaction.Edit", $privilageMenu, TRUE))
                                <li class="nav-item">
                                    <a class="nav-link myPopUpPurchaseOrderRevision" data-toggle="modal" data-target="#myPopUpPurchaseOrderRevision" style="color:white;padding-bottom:10px;">
                                        <i class="far fa-file nav-icon-sm"> Revision Purchase Order</i>
                                    </a>
                                </li>
                                @endif
                            </ul>
                        </li>
                    </ul>
                </label>
            </div>
        </div>
    </div>
</div>

<script>
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $(function() {
        $('.myPopUpPurchaseOrderRevision').on('click', function(e) {
            e.preventDefault();
            $.ajax({
                type: 'GET',
                url: '{!! route("PurchaseOrder.PurchaseOrderListData") !!}',
                success: function(data) {
                    var no = 1; t = $('#TableSearchPORevision').DataTable();
                    t.clear();
                    $.each(data, function(key, val) {
                        t.row.add([
                            '<tbody><tr><td>' + no++ + '</td>',
                            '<td><span data-dismiss="modal" onclick="klikPopUpPurchaseOrder(\'' + val.sys_ID + '\', \'' + val.documentNumber + '\');">' + val.documentNumber + '</span></td>',
                            '<td><span data-dismiss="modal" onclick="klikPopUpPurchaseOrder(\'' + val.sys_ID + '\', \'' + val.documentNumber + '\');">' + val.combinedBudget_RefID + '</span></td>',
                            '<td><span data-dismiss="modal" onclick="klikPopUpPurchaseOrder(\'' + val.sys_ID + '\', \'' + val.documentNumber + '\');">' + val.combinedBudgetName + '</span></td>',
                            '<td><span data-dismiss="modal" onclick="klikPopUpPurchaseOrder(\'' + val.sys_ID + '\', \'' + val.documentNumber + '\');">' + val.combinedBudgetSection_RefID + '</span></td>',
                            '<td><span data-dismiss="modal" onclick="klikPopUpPurchaseOrder(\'' + val.sys_ID + '\', \'' + val.documentNumber + '\');">' + val.combinedBudgetSectionName + '</td></tr></tbody>'
                        ]).draw();

                    });
                }
            });
        });

    });
</script>