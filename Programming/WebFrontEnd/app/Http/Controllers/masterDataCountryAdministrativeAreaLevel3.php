<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use DB;

class masterDataCountryAdministrativeAreaLevel3 extends Controller
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
            'transaction.read.dataList.master.getCountryAdministrativeAreaLevel3',
            'latest',
            [
                'countryAdministrativeAreaLevel2_RefID' => 22000000000192,
                'SQLStatement' => [
                    'pick' => null,
                    'sort' => null,
                    'filter' => null,
                    'paging' => null
                ]
            ]
        );
        return view('Master.CountryAdministrativeAreaLevel3.Transactions.index')->with('data', $varData['data']);
    }

    public function create()
    {
        return view('Master.CountryAdministrativeAreaLevel3.Transactions.create');
    }

    public function store(Request $request)
    {
        $varAPIWebToken = $request->session()->get('SessionLogin');
        //---Core---
        $varData = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
            \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
            $varAPIWebToken,
            'transaction.create.master.setCountryAdministrativeAreaLevel3',
            'latest',
            [
                'entities' => [
                    'countryAdministrativeAreaLevel2_RefID' => 22000000000192,
                    'name' => $request->CountryAdministrativeAreaLevel3_code
                ]
            ]
        );

        return redirect()->route('CountryAdministrativeAreaLevel3.index');
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
            'transaction.read.dataRecord.master.getCountryAdministrativeAreaLevel3',
            'latest',
            [
                'recordID' => (int)$id,
            ]
        );

        return view('Master.CountryAdministrativeAreaLevel3.Transactions.edit')->with('data', $varData['data']);
    }

    public function update(Request $request, $id)
    {
        $varAPIWebToken = $request->session()->get('SessionLogin');
        //---Core---
        $varData = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
            \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
            $varAPIWebToken,
            'transaction.update.master.setCountryAdministrativeAreaLevel3',
            'latest',
            [
                'recordID' => (int)$id,
                'entities' => [
                    'countryAdministrativeAreaLevel2_RefID' => 22000000000192,
                    'name' => $request->CountryAdministrativeAreaLevel3_code
                ]
            ]
        );

        return redirect()->route('CountryAdministrativeAreaLevel3.index');
    }

    public function destroy(Request $request, $id)
    {
        $varAPIWebToken = $request->session()->get('SessionLogin');
        //---Core---
        $varData = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
            \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
            $varAPIWebToken,
            'transaction.delete.master.setCountryAdministrativeAreaLevel3',
            'latest',
            [
                'recordID' => (int)$id
            ]
        );
        return redirect()->route('CountryAdministrativeAreaLevel3.index');
    }
}
