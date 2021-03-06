<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;

class procurementTransactionPO extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createPO()
    {
        return view('Purchase.PurchaseOrder.Transactions.createPO');
    }
    public function revisionPO()
    {
        return view('Purchase.PurchaseOrder.Transactions.editExisting');
    }

    public function createPOverhead()
    {
        return view('Purchase.PurchaseOrder.Transactions.createPOverhead');
    }

    public function createPOSales()
    {
        return view('Purchase.PurchaseOrder.Transactions.createPOSales');
    }
    public function requestCancelPO()
    {
        return view('Purchase.PurchaseOrder.Transactions.requestCancelPO');
    }
    public function fileUploadPO()
    {
        return view('Purchase.PurchaseOrder.Transactions.fileUploadPO');
    }
    public function editExisting()
    {
        return view('Purchase.PurchaseOrder.Transactions.editExisting');
    }
    public function editExistingSales()
    {
        return view('Purchase.PurchaseOrder.Transactions.editExistingSales');
    }
    public function EditExistingOverhead()
    {
        return view('Purchase.PurchaseOrder.Transactions.editExistingOverhead');
    }
    

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}