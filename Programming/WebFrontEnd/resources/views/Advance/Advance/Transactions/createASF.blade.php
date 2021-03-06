@extends('Partials.app')
@section('main')
@include('Partials.navbar')
@include('Partials.sidebar')
@include('Advance.Advance.Functions.PopUp.searchArf')

<div class="content-wrapper">
  <section class="content">
    <div class="container-fluid">
      <div class="card">
        <div class="tab-content p-3" id="nav-tabContent">
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                  <label class="card-title">
                    Create New Settelement
                  </label>
                  <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                      <i class="fas fa-angle-down btn-sm" style="color:black;"></i>
                    </button>
                  </div>
                </div>
                @include('Advance.Advance.Functions.Header.headerAsf')
                <button type="reset" class="btn btn-danger btn-sm float-right" title="Reset">
                  <i class="fa fa-times" aria-hidden="true">Reset</i>
                </button>
              </div>
            </div>
          </div>
          </form>
        </div>
      </div>
    </div>

    <div class="col-12 tableArfDetail">
      <div class="card">
        <div class="card-header">
          <label class="card-title">
            ARF Detail
          </label>
          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse">
              <i class="fas fa-angle-down btn-sm" style="color:black;"></i>
            </button>
          </div>
        </div>
        @include('Advance.Advance.Functions.Table.tableArfDetail')
      </div>
    </div>
    <form action="" name="formAsf1">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <label class="card-title">
                Detail Settelement
              </label>
              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                  <i class="fas fa-angle-down btn-sm" style="color:black;"></i>
                </button>
              </div>
            </div>
            <div class="card-body detailASF">
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <table>
                      <tr>
                        <td><label>ARF Number</label></td>
                        <td>
                          <div class="input-group">
                            <input readonly name="arf_number" id="arf_number" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td><label>ARF Date</label></td>
                        <td>
                          <div class="input-group">
                            <input readonly name="arf_date" id="arf_date" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td><label>Project Code</label></td>
                        <td>
                          <div class="input-group">
                            <input readonly name="projectcode" id="projectcode" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                        <td>
                          <div class="input-group">
                            <input readonly name="projectcode2" id="projectcode2" style="border-radius:0;" type="text" class="form-control">
                          </div>
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
                          <div class="input-group">
                            <input readonly name="sitecode" id="sitecode" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                        <td>
                          <div class="input-group">
                            <input readonly name="sitecode2" id="sitecode2" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td><label>CFS Code</label></td>
                        <td>
                          <div class="input-group">
                            <input name="cfs_code" id="cfs_code" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                        <td>
                          <div id="iconCfsCode" style="color:red;margin-left:5px;"></div>
                        </td>
                      </tr>
                    </table>
                  </div>
                </div>

                <div class="col-md-4">
                  <div class="form-group">
                    <table>
                      <tr>
                        <div>
                          <label>
                            <strong>Balance</strong><br>
                          </label>
                        </div>
                      </tr>
                      <tr>
                        <td><label>Total ARF</label></td>
                        <td>
                          <div class="input-group">
                            <input readonly name="total_arf" id="total_arf" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                        <td>
                          <div class="input-group">
                            <input readonly name="total_arf2" id="total_arf2" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td><label>Total Settelement</label></td>
                        <td>
                          <div class="input-group">
                            <input readonly name="total_asf" id="total_asf" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                        <td>
                          <div class="input-group">
                            <input readonly name="total_asf2" id="total_asf2" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td><label>Balance</label></td>
                        <td>
                          <div class="input-group">
                            <input readonly name="balance" id="balance" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                        <td>
                          <div class="input-group">
                            <input readonly name="balance2" id="balance2" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                      </tr>
                    </table>
                  </div>
                </div>
              </div>
            </div>

            <div class="card-body detailASF">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <table>
                      <tr>
                        <div>
                          <label>
                            <strong>Expense Claim</strong><br>
                          </label>
                        </div>
                      </tr>
                      <tr>
                        <td><label>QTY</label></td>
                        <td>
                          <div class="input-group" style="padding-left: 43px;">
                            <input name="qty_expense" id="qty_expense" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                        <td>
                          <div class="input-group">
                            <input readonly name="qty_expense2" id="qty_expense2" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                        <td>
                          <div id="iconQtyExpense" style="color: red;margin-left:5px;"></div>
                        </td>
                      </tr>
                      <tr>
                        <td><label>Price</label></td>
                        <td>
                          <div class="input-group" style="padding-left: 43px;">
                            <input name="price_expense" id="price_expense" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                        <td>
                          <div class="input-group">
                            <input readonly name="price_expense2" id="price_expense2" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                        <td>
                          <div id="iconPriceExpense" style="color: red;margin-left:5px;"></div>
                        </td>
                      </tr>
                      <tr>
                        <td><label>Total</label></td>
                        <td>
                          <div class="input-group" style="padding-left: 43px;">
                            <input readonly name="total_expense" id="total_expense" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                        <td>
                          <div class="input-group">
                            <input readonly name="total_expense2" id="total_expense2" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                      </tr>
                    </table>
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="form-group">
                    <table>

                      <tr>
                        <div>
                          <label>
                            <strong>Amount Due to Company</strong><br>
                          </label>
                        </div>
                      </tr>
                      <tr>
                        <td><label>QTY</label></td>
                        <td>
                          <div class="input-group" style="padding-left: 23px;">
                            <input name="qty_amount" id="qty_amount" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                        <td>
                          <div class="input-group">
                            <input readonly name="qty_amount2" id="qty_amount2" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                        <td>
                          <div id="iconQtyAmount" style="color: red;margin-left:5px;"></div>
                        </td>
                      </tr>
                      <tr>
                        <td><label>Price</label></td>
                        <td>
                          <div class="input-group" style="padding-left: 23px;">
                            <input name="price_amount" id="price_amount" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                        <td>
                          <div class="input-group">
                            <input readonly name="price_amount2" id="price_amount2" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                        <td>
                          <div id="iconPriceAmount" style="color: red;margin-left:5px;"></div>
                        </td>
                      </tr>
                      <tr>
                        <td><label>Total</label></td>
                        <td>
                          <div class="input-group" style="padding-left: 23px;">
                            <input readonly name="total_amount" id="total_amount" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                        <td>
                          <div class="input-group">
                            <input readonly name="total_amount2" id="total_amount2" style="border-radius:0;" type="text" class="form-control">
                          </div>
                        </td>
                      </tr>
                    </table>
                  </div>
                  <br>
                  <button type="reset" class="btn btn-danger btn-sm float-right" title="Reset">
                    <i class="fa fa-times" aria-hidden="true">Cancel Add</i>
                  </button>

                  <button type="reset" class="btn btn-outline btn-success btn-sm float-right" id="addAsfListCart" style="margin-right: 5px;">
                    <i class="fa fa-plus" aria-hidden="true" title="Add to Advance List" style="color: white;">Add</i>
                  </button>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>

    <nav class="w-100">
      <div class="nav nav-tabs" id="product-tab" role="tablist">
        <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#amountdueto" role="tab" aria-controls="product-desc" aria-selected="true"><span style="font-weight:bold;padding:40px;color:black;">Amount Due to Company Cart</span></a>&nbsp&nbsp&nbsp
        <a class="nav-item nav-link" id="product-comments-tab" data-toggle="tab" href="#expense" role="tab" aria-controls="product-comments" aria-selected="false"><span style="font-weight:bold;padding:40px;color:black;">Expense Claim Cart</span></a>
      </div><br>
    </nav>

    <div class="tab-pane fade show active" id="amountdueto" role="tabpanel" aria-labelledby="product-desc-tab">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <label class="card-title">
                Amount Due to Company Cart
              </label>
              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                  <i class="fas fa-angle-down btn-sm" style="color:black;"></i>
                </button>
              </div>
            </div>

            <div class="card-body table-responsive p-0" id="amountCompanyCart">
              <table id="tableAmountDueto" class="table table-head-fixed text-nowrap table-striped">
                <thead>
                  <tr>
                    <th>No</th>
                    <th>Action</th>
                    <th>No Trans</th>
                    <th>Product ID</th>
                    <th>Name Material</th>
                    <th>Unit</th>
                    <th>Unit Price</th>
                    <th>QTY</th>
                    <th>Total Price</th>
                    <th>Description</th>
                    <th>CFS Code</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="tab-pane fade" id="expense" role="tabpanel" aria-labelledby="product-comments-tab">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <label class="card-title">
                Expense Claim Cart
              </label>
              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                  <i class="fas fa-angle-down btn-sm" style="color:black;"></i>
                </button>
              </div>
            </div>

            <div class="card-body table-responsive p-0" id="amountCompanyCart">
              <table id="tableExpenseClaim" class="table table-head-fixed text-nowrap table-striped">
                <thead>
                  <tr>
                    <th>No</th>
                    <th>Action</th>
                    <th>No Trans</th>
                    <th>Product ID</th>
                    <th>Name Material</th>
                    <th>Unit</th>
                    <th>Unit Price</th>
                    <th>QTY</th>
                    <th>Total Price</th>
                    <th>Description</th>
                    <th>CSF Code</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <button type="reset" class="btn btn-danger btn-sm float-right">
      <i class="fa fa-times" aria-hidden="true"></i>
      Cancel Settelement List (Cart)
    </button>
    <button type="reset" class="btn btn-success btn-sm float-right" id="saveAsfList">
      <i class="fa fa-save" aria-hidden="true"></i>
      Save Settelement List(Cart)
    </button>
  </section>
</div>
@include('Partials.footer')
@include('Advance.Advance.Functions.Footer.footerAsf')
@endsection