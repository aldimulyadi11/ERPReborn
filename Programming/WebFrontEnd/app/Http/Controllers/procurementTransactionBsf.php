<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;

class procurementTransactionBsf extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createBSF()
    {
        return view('Advance.BussinesTrip.Transactions.createBSF');
    }

    public function BSFtoBRF()
    {
        return view('Advance.BussinesTrip.Transactions.BSFtoBRF');
    }

    public function fundBRF()
    {
        return view('Advance.BussinesTrip.Transactions.fundBRF');
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
        $data = json_decode($request->getContent(), true);
        $dataAll = array();

        foreach ($data as $i => $v) {

            array_push($dataAll, array(
                'filenames' => $v['filenames']

            ));
        }
        $data2 = json_decode($request->getContent(), true);
        $dataAll2 = array();

        foreach ($data2 as $i => $v) {

            array_push($dataAll2, array(
                'origin_budget' => $v['origin_budget'],
                'projectcode' => $v['projectcode'],
                'projectname' => $v['projectname'],
                'subprojectc' => $v['subprojectc'],
                'subprojectn' => $v['subprojectn'],
                'beneficiary' => $v['beneficiary'],
                'bank_name' => $v['bank_name'],
                'account_name' => $v['account_name'],
                'account_number' => $v['account_number'],
                'internal_notes' => $v['internal_notes'],
                'requestNameArf' => $v['requestNameArf'],
                'putWorkId' => $v['putWorkId'],
                'putWorkName' => $v['putWorkName'],
                'putProductId' => $v['putProductId'],
                'putProductName' => $v['putProductName'],
                'putQty' => $v['putQty'],
                'putQtys' => $v['putQtys'],
                'putUom' => $v['putUom'],
                'putPrice' => $v['putPrice'],
                'putCurrency' => $v['putCurrency'],
                'totalArfDetails' => $v['totalArfDetails'],
                'putRemark' => $v['putRemark'],

            ));
            break;
        }
        return response()->json($dataAll2);
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
    public function revisionBsfIndex(Request $request)
    {
        return view('Advance.BussinesTrip.Transactions.revisionBSF');
    }
}