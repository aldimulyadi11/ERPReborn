@extends('Partials.app')
@section('main')
@include('Partials.navbar')
@include('Partials.sidebar')
@include('getFunction.getSite')
@include('Documents.Functions.PopUp.SearchCheckDocument')

<div class="content-wrapper">
  <section class="content">
    <div class="container-fluid">
      <div class="row mb-1" style="background-color:#4B586A;">
        <div class="col-sm-6" style="height:30px;">
          <label style="font-size:15px;position:relative;top:7px;color:white;">Check Document on Process</label>
        </div>
      </div>

      @include('Documents.Functions.Menu.MenuCheckDocument')

      @if($var == 1)
      <div class="card" style="position:relative;bottom:10px;">
        <div class="tab-content p-3" id="nav-tabContent">

          <div class="row">
            <!-- <div class="card ViewWorkflow" style="background-color:#e9ecef;border:1px solid #ced4da;margin-left:10px;">
              <a class="btn btn-default btn-sm">
                View Workflow History
              </a>
            </div> -->

            <div class="card ViewDocument" style="background-color:#e9ecef;border:1px solid #ced4da;margin-left:10px;">
              <a class="btn btn-default btn-sm">
                View Document Transaction
              </a>
            </div>
          </div>

          <div class="row">

            @include('Documents.Transactions.DocumentWorkflow')

            @if($dataHeader['BusinessDocumentType_Name'] == "Advance Form")
            @include('Documents.Transactions.DocumentAdvance')

            @elseif($dataHeader['BusinessDocumentType_Name'] == "Person Business Trip Form")
            @include('Documents.Transactions.DocumentBussinesTripRequest')

            @elseif($dataHeader['BusinessDocumentType_Name'] == "Purchase Requisition Form")
            @include('Documents.Transactions.DocumentPurchaseRequisition')

            @elseif($dataHeader['BusinessDocumentType_Name'] == "Purchase Order Form")
            @include('Documents.Transactions.DocumentPurchaseRequisition')

            @endif

            @include('Documents.Transactions.ButtonApproval')

            @include('Documents.Transactions.DocumentApprovalHistory')

          </div>

        </div>
      </div>
      @endif
    </div>
  </section>
</div>
@include('Partials.footer')
@include('Documents.Functions.Footer.FooterCheckDocument')
@endsection