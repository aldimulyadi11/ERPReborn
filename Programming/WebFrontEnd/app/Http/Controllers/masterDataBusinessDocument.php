<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use DB;

class masterDataBusinessDocument extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $varAPIWebToken = $request->session()->get('SessionLogin');
        //---Core---
        $varData = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
            \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
            $varAPIWebToken,
            'transaction.read.dataList.master.getBusinessDocument',
            'latest',
            [
                'businessDocumentType_RefID' => 77000000000005,
                'SQLStatement' => [
                    'pick' => null,
                    'sort' => null,
                    'filter' => null,
                    'paging' => null
                ]
            ]
        );
        return view('Master.BusinessDocument.Transactions.index')->with('data', $varData['data']);
    }

    public function create()
    {
        return view('Master.BusinessDocument.Transactions.create');
    }

    public function store(Request $request)
    {
        $varAPIWebToken = $request->session()->get('SessionLogin');
        //---Core---
        $varData = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
            \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
            $varAPIWebToken,
            'transaction.create.master.setBusinessDocument',
            'latest',
            [
                'entities' => [
                    'name' => $request->BusinessDocument_code
                ]
            ]
        );
        return redirect()->route('BusinessDocument.index');
    }

    public function show($id)
    {
        //
    }

    public function edit(Request $request, $id)
    {
        $varAPIWebToken = $request->session()->get('SessionLogin');

        $varData = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
            \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
            $varAPIWebToken,
            'transaction.read.dataRecord.master.getBusinessDocument',
            'latest',
            [
                'recordID' => (int)$id,
            ]
        );
        // dd($varData);

        return view('Master.BusinessDocument.Transactions.edit')->with('data', $varData['data']);
    }

    public function update(Request $request, $id)
    {
        $varAPIWebToken = $request->session()->get('SessionLogin');
        //---Core---
        $varData = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
            \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
            $varAPIWebToken,
            'transaction.update.master.setBusinessDocument',
            'latest',
            [
                'recordID' => (int)$id,
                'entities' => [
                    'name' => $request->BusinessDocument_code
                ]
            ]
        );

        return redirect()->route('BusinessDocument.index');
    }

    public function destroy(Request $request, $id)
    {
        $varAPIWebToken = $request->session()->get('SessionLogin');
        //---Core---
        $varData = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
            \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
            $varAPIWebToken,
            'transaction.delete.master.setBusinessDocument',
            'latest',
            [
                'recordID' => (int)$id
            ]
        );
        return redirect()->route('BusinessDocument.index');
    }
}
