@extends('Partials.app')
@section('main')
@include('Partials.navbar')
@include('Partials.sidebar')
@include('getFunction.getProject')
@include('getFunction.getSite')
@include('getFunction.getDelivery')
@include('getFunction.getReceive')
<div class="content-wrapper" style="position:relative;bottom:12px;">
    <section class="content">
        <div class="container-fluid">
            <div class="row mb-1" style="background-color:#4B586A;">
                <div class="col-sm-6" style="height:30px;">
                    <label style="font-size:15px;position:relative;top:7px;color:white;">Material Return</label>
                </div>
            </div>
            @include('Inventory.MaterialReturn.Functions.Menu.MenuMaterialReturn')
            @if($var == 0)
            <div class="card" style="position:relative;bottom:10px;">
                <form method="post" enctype="multipart/form-data" action="{{ route('iSupp.store') }}" id="formSubmitMatRet">
                    @csrf
                    <div class="tab-content p-3" id="nav-tabContent">
                        @include('Inventory.MaterialReturn.Functions.Header.headerMaterialReturn')
                        <div class="tab-pane fade show active" role="tabpanel" aria-labelledby="product-desc-tab">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <label class="card-title">
                                                Delivery Order Detail
                                            </label>
                                            <div class="card-tools">
                                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                    <i class="fas fa-angle-down btn-sm" style="color:black;"></i>
                                                </button>
                                            </div>
                                        </div>
                                        @include('Inventory.MaterialReturn.Functions.Table.returnDetailDor')
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <label class="card-title">
                                            Detail Material Return
                                        </label>
                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                <i class="fas fa-angle-down btn-sm" style="color:black;"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-body table-responsive p-0" id="DetailMaterialReturn">
                                        <table class="table text-nowrap table-sm" style="text-align: center;">
                                            <thead>
                                                <tr>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;width:15%;border:1px solid #e9ecef;">Product Id</th>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;width:20%;border:1px solid #e9ecef;">Product Name</th>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;width:10%;border:1px solid #e9ecef;">Qty</th>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;width:5%;border:1px solid #e9ecef;">UOM</th>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;width:10%;border:1px solid #e9ecef;">Unit Price</th>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;width:5%;border:1px solid #e9ecef;">Currency</th>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;width:20%;border:1px solid #e9ecef;">Remark</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <td style="border:1px solid #e9ecef;">
                                                    <input id="ProductId" style="border-radius:0;" type="text" class="form-control" readonly="">
                                                </td>
                                                <td style="border:1px solid #e9ecef;">
                                                    <input id="ProductName" style="border-radius:0;" type="text" class="form-control" readonly="">
                                                </td>
                                                <td style="border:1px solid #e9ecef;">
                                                    <div class="input-group">
                                                        <input id="Quantity" style="border-radius:0;" type="text" class="form-control ChangeQty">
                                                        <input id="QuantityHide" style="border-radius:0;" type="hidden" class="form-control">
                                                        <input id="QuantityHide2" style="border-radius:0;" type="hidden" class="form-control">
                                                    </div>
                                                </td>
                                                <td style="border:1px solid #e9ecef;">
                                                    <div class="input-group">
                                                        <input readonly id="Uom" style="border-radius:0;" type="text" class="form-control">
                                                    </div>
                                                </td>
                                                <td style="border:1px solid #e9ecef;">
                                                    <div class="input-group">
                                                        <input id="Price" style="border-radius:0;" type="text" class="form-control" readonly="">
                                                        <input id="PriceHide" style="border-radius:0;" type="hidden" class="form-control">
                                                    </div>
                                                </td>
                                                <td style="border:1px solid #e9ecef;">
                                                    <div class="input-group">
                                                        <input readonly id="Currency" style="border-radius:0;" type="text" class="form-control">
                                                    </div>
                                                </td>
                                                <td style="border:1px solid #e9ecef;">
                                                    <input id="Remark" style="border-radius:0;" type="text" class="form-control">
                                                    <input id="Remark2" style="border-radius:0;" type="hidden" class="form-control">
                                                </td>

                                                <input id="WorkId" style="border-radius:0;" type="hidden" class="form-control">
                                                <input id="WorkName" style="border-radius:0;" type="hidden" class="form-control">
                                                <input id="statusEditMatRet" style="border-radius:0;" type="hidden" class="form-control" readonly="">
                                            </tbody>
                                        </table>
                                        <div style="padding-right:10px;padding-top:10px;">
                                            <a class="btn btn-default btn-sm float-right CancelDetailMatret" style="background-color:#e9ecef;border:1px solid #ced4da;margin-right: 5px;">
                                                <img src="{{ asset('AdminLTE-master/dist/img/cancel.png') }}" width="13" alt="" title="Cancel to Add Advance List Cart"> Cancel
                                            </a>
                                            <a class="btn btn-default btn-sm float-right" id="addFromDetailtoCart" style="margin-right: 5px;background-color:#e9ecef;border:1px solid #ced4da;">
                                                <img src="{{ asset('AdminLTE-master/dist/img/add.png') }}" width="13" alt="" title="Add to Advance List"> Add
                                            </a>
                                        </div>
                                        <br><br><br>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <label class="card-title">
                                            Material Return List Cart
                                        </label>
                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                <i class="fas fa-angle-down btn-sm" style="color:black;"></i>
                                            </button>
                                        </div>
                                    </div>

                                    <div class="card-body table-responsive p-0" id="MaterialReturnList">
                                        <table class="table text-nowrap TableMaterialReturn table-sm">
                                            <thead>
                                                <tr>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;border:1px solid #e9ecef;text-align: center;">Action</th>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;border:1px solid #e9ecef;text-align: center;">Work Id</th>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;border:1px solid #e9ecef;text-align: center;">Work Name</th>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;border:1px solid #e9ecef;text-align: center;">Product Id</th>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;border:1px solid #e9ecef;text-align: center;">Product Name</th>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;border:1px solid #e9ecef;text-align: center;">Qty</th>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;border:1px solid #e9ecef;text-align: center;">Uom</th>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;border:1px solid #e9ecef;text-align: center;">Price</th>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;border:1px solid #e9ecef;text-align: center;">Currency</th>
                                                    <th style="padding-bottom: 10px;padding-top: 10px;border:1px solid #e9ecef;text-align: center;">Description</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <a onclick="CancelMatRet();" class="btn btn-default btn-sm float-right" style="background-color:#e9ecef;border:1px solid #ced4da;">
                                    <img src="{{ asset('AdminLTE-master/dist/img/cancel.png') }}" width="13" alt="" title="Cancel Advance List Cart"> Cancel
                                </a>
                                <button class="btn btn-default btn-sm float-right" type="submit" id="SubmitMaterialReturn" style="margin-right: 5px;background-color:#e9ecef;border:1px solid #ced4da;">
                                    <img src="{{ asset('AdminLTE-master/dist/img/save.png') }}" width="13" alt="" title="Submit to Advance"> Submit
                                </button>
                                <br><br><br>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            @endif
        </div>
    </section>
</div>
@include('Partials.footer')
@include('Inventory.MaterialReturn.Functions.Footer.footerMaterialReturn')
@endsection