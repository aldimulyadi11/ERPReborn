@extends('Partials.app')
@section('main')
@include('Partials.navbar')
@include('Partials.sidebar')
@include('Inventory.iSupp.Functions.PopUp.searchPoNumber')
@include('Inventory.iSupp.Functions.PopUp.searchDoNumber')
@include('getFunction.getWarehouse')
<div class="content-wrapper">
    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <form method="post" enctype="multipart/form-data" action="#" name="formHeaderDor">
                    <div class="tab-content p-3" id="nav-tabContent">
                        @include('Inventory.iSupp.Functions.Header.headeriSupp')
                </form>
                <div class="tab-pane fade show active" role="tabpanel" aria-labelledby="product-desc-tab">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <label class="card-title">
                                        PO Detail
                                    </label>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-angle-down btn-sm" style="color:black;"></i>
                                        </button>
                                    </div>
                                </div>
                                @include('Inventory.iSupp.Functions.Table.tablePoDetail')
                            </div>
                        </div>
                    </div>
                </div>

                <form method="post" enctype="multipart/form-data" name="formDetailDor">
                    <div class="tab-pane fade show active" id="detailTransAvail" role="tabpanel" aria-labelledby="product-desc-tab">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <label class="card-title">
                                            Detail i-Supp
                                        </label>
                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                <i class="fas fa-angle-down btn-sm" style="color:black;"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-body" id="detailiSupp">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <table>
                                                        <tr>
                                                            <td><label>Project Code</label></td>
                                                            <td>
                                                                <input name="projectiSuppDetail" id="projectiSuppDetail" style="border-radius:0;" type="text" class="form-control" readonly="">
                                                            </td>
                                                            <td>
                                                                <input name="projectiSuppDetail2" id="projectiSuppDetail2" style="border-radius:0;" type="text" class="form-control" readonly="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td><label>Work Id</label></td>
                                                            <td>
                                                                <input name="workIdiSuppDetail" id="workIdiSuppDetail" style="border-radius:0;" type="text" class="form-control" readonly="">
                                                            </td>
                                                            <td>
                                                                <input name="workIdiSuppDetail2" id="workIdiSuppDetail2" style="border-radius:0;" type="text" class="form-control" readonly="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td><Label>Qty</Label></td>
                                                            <td>
                                                                <input name="qtyiSuppChange" id="qtyiSuppChange" style="border-radius:0;" type="text" class="form-control ChangeQty">
                                                                <input name="qtyiSupp" id="qtyiSupp" style="border-radius:0;" type="hidden" class="form-control">
                                                            </td>
                                                            <td>
                                                                <input name="qtyiSupp2" id="qtyiSupp2" style="border-radius:0;" type="text" class="form-control" readonly="">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <table>
                                                        <tr>
                                                            <td><label>Site Code</label></td>
                                                            <td>
                                                                <input name="siteiSuppDetail" id="siteiSuppDetail" style="border-radius:0;" type="text" class="form-control" readonly="">
                                                            </td>
                                                            <td>
                                                                <input name="siteiSuppDetail2" id="siteiSuppDetail2" style="border-radius:0;" type="text" class="form-control" readonly="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td><label>Product Id</label></td>
                                                            <td>
                                                                <input name="productiSuppDetail" id="productiSuppDetail" style="border-radius:0;" type="text" class="form-control" readonly="">
                                                            </td>
                                                            <td>
                                                                <input name="productiSuppDetail2" id="productiSuppDetail2" style="border-radius:0;" type="text" class="form-control" readonly="">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td><Label>Remark</Label></td>
                                                            <td>
                                                            <div class="input-group">
                                                                <textarea name="remarkiSuppDetail" id="remarkiSuppDetail" style="border-radius:0;" cols="60" rows="1" class="form-control"></textarea>
                                                            </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="card-title" style="border:5px solid #DCDCDC;width:100%;">
                                                            <p style="position:relative;text-align:center;top:7px;">Balance</p>
                                                        </div>
                                                        <div class="card-body table-responsive p-0 available" style="height: 85px;">
                                                            <table>
                                                                <tbody>
                                                                    <br>
                                                                    <tr>
                                                                        <td title="Total BOQ Detail"><label>Qty in PO</label></td>
                                                                        <td>:</td>
                                                                        <td style="font-weight:bold;">
                                                                            <input name="qtyInPoiSupp" id="qtyInPoiSupp" style="border-radius:0;background-color:white;border:1px solid white;" type="text" class="form-control">
                                                                        </td>
                                                                        <td>Pcs</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><label>Qty in i-Supp</label></td>
                                                                        <td>:</td>
                                                                        <td style="font-weight:bold;">
                                                                            <input name="qtyIniSupp" id="qtyIniSupp" style="border-radius:0;background-color:white;border:1px solid white;" type="text" class="form-control">
                                                                        </td>
                                                                        <td>Pcs</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><label>Balance Qty</label></td>
                                                                        <td>:</td>
                                                                        <td style="font-weight:bold;color:red;">
                                                                            <input name="balanceQtyiSupp" id="balanceQtyiSupp" style="border-radius:0;background-color:white;border:1px solid white;color:red;" type="text" class="form-control">
                                                                        </td>
                                                                        <td>Pcs</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button type="reset" class="btn btn-outline btn-danger btn-sm float-right CanceliSupp">
                                                    <i class="fa fa-times" aria-hidden="true" title="Cancel to Add DOR List Cart">Cancel</i>
                                                </button>
                                                <a class="btn btn-outline btn-success btn-sm float-right" id="addFromDetailiSupptoCart" style="margin-right: 5px;">
                                                    <i class="fa fa-plus" aria-hidden="true" title="Add to Advance List" style="color: white;">Add to i-Supp List Cart</i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <label class="card-title">
                                    i-Supp Cart
                                </label>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-angle-down btn-sm" style="color:black;"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="card-body" id="iSuppCart">
                                <div class="row">
                                    <table class="table table-head-fixed text-nowrap tableiSuppCart">
                                        <thead>
                                            <tr>
                                                <th>Action</th>
                                                <th>Project</th>
                                                <th>Site</th>
                                                <th>Work Id</th>
                                                <th>Product Id</th>
                                                <th>Product Name</th>
                                                <th>Qty</th>
                                                <th>UOM</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <a href="{{ url('arflist/cancel/') }}" class="btn btn-outline btn-danger btn-sm float-right remove-arf-list">
                            <i class="fa fa-times" aria-hidden="true" title="Cancel DOR List Cart">Cancel</i>
                        </a>
                        <a class="btn btn-success btn-sm float-right" href="javascript:buttonSubmitDor()" style="color:white;">
                            <i class="fa fa-save" aria-hidden="true"></i>
                            Save i-Supp
                        </a>

                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@include('Partials.footer')
@include('Inventory.iSupp.Functions.Footer.footeriSupp')
@endsection