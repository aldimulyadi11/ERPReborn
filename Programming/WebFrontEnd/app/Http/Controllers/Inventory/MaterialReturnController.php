<?php

namespace App\Http\Controllers\Inventory;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Http\Controllers\Controller;

class MaterialReturnController extends Controller
{
    public function index(Request $request)
    {
        $request->session()->forget("SessionMaterialReturn");
        $var = 0;
        if (!empty($_GET['var'])) {
            $var =  $_GET['var'];
        }

        $compact = [
            'var' => $var,
            'statusRevisi' => 0,
        ];

        return view('Inventory.MaterialReturn.Transactions.CreateMaterialReturn', $compact);
    }
    public function ReportMatReturnSummary(Request $request)
    {
        $varAPIWebToken = $request->session()->get('SessionLogin');
        $var = 0;
        if (!empty($_GET['var'])) {
            $var =  $_GET['var'];
        }
        $compact = [
            'varAPIWebToken' => $varAPIWebToken,
            'var' => $var,
            'statusRevisi' => 1,
        ];

        return view('Inventory.MaterialReturn.Reports.ReportMatReturnSummary', $compact);
    }
    public function ReportMatReturnDetail(Request $request)
    {
        $varAPIWebToken = $request->session()->get('SessionLogin');
        $var = 0;
        if (!empty($_GET['var'])) {
            $var =  $_GET['var'];
        }
        $compact = [
            'varAPIWebToken' => $varAPIWebToken,
            'var' => $var,
            'statusRevisi' => 1,
        ];

        return view('Inventory.MaterialReturn.Reports.ReportMatReturnDetail', $compact);
    }
    
    public function StoreValidateiMaterialReturn(Request $request)
    {
        $tamp = 0; $status = 200;
        $val = $request->input('putWorkId');
        $val2 = $request->input('putProductId');
        $data = $request->session()->get("SessionMaterialReturn");
        if($request->session()->has("SessionMaterialReturn")){
            for($i = 0; $i < count($data); $i++){
                if($data[$i] == $val && $data[$i+1] == $val2){
                    $tamp = 1;
                }
            }
            if($tamp == 0){
                $request->session()->push("SessionMaterialReturn", $val);
                $request->session()->push("SessionMaterialReturn", $val2);
            }
            else{
                $status = 500;
            }
        }
        else{
            $request->session()->push("SessionMaterialReturn", $val);
            $request->session()->push("SessionMaterialReturn", $val2);
        }

        return response()->json($status);
    }

    public function StoreValidateiMaterialReturn2(Request $request)
    {
        $val = $request->input('putWorkId');
        $val2 = $request->input('putProductId');
        $data = $request->session()->get("SessionMaterialReturn");
        if($request->session()->has("SessionMaterialReturn")){
            for($i = 0; $i < count($data); $i++){
                if($data[$i] == $val && $data[$i+1] == $val2){
                    unset($data[$i]);
                    unset($data[$i+1]);
                    $newClass = array_values($data);
                    $request->session()->put("SessionMaterialReturn", $newClass);
                }
            }
        }
    }

    public function store(Request $request)
    {
        $input = $request->all();
        dd($input);
    }

    public function MaterialReturnListData(Request $request)
    {
        $varAPIWebToken = $request->session()->get('SessionLogin');
        $varDataAdvanceRequest = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
            \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
            $varAPIWebToken, 
            'transaction.read.dataList.finance.getAdvance', 
            'latest', 
            [
            'parameter' => null,
            'SQLStatement' => [
                'pick' => null,
                'sort' => null,
                'filter' => null,
                'paging' => null
                ]
            ]
            );
            
        return response()->json($varDataAdvanceRequest['data']);
    }
    public function MaterialReturnByDorID(Request $request)
    {
        $varAPIWebToken = $request->session()->get('SessionLogin');
        $var_recordID = $request->input('var_recordID');
        $varDataAdvanceList = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
            \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
            $varAPIWebToken,
            'transaction.read.dataList.finance.getAdvanceDetail',
            'latest',
            [
                'parameter' => [
                    'advance_RefID' => (int) $var_recordID,
                ],
                'SQLStatement' => [
                    'pick' => null,
                    'sort' => null,
                    'filter' => null,
                    'paging' => null
                ]
            ]
        );
        // dd($varDataAdvanceList);
        $compact = [
            'DataAdvanceList' => $varDataAdvanceList['data'],
        ];
        return response()->json($compact);
    }

    public function RevisionMaterialReturnIndex(Request $request)
    {
        $varAPIWebToken = $request->session()->get('SessionLogin');
        $request->session()->forget("SessionMaterialReturn");

        $varDataAdvanceRevision = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
            \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
            $varAPIWebToken,
            'report.form.documentForm.finance.getAdvance',
            'latest',
            [
                'parameter' => [
                    'recordID' => (int) $request->searchMaterialReturnNumberRevisionId,
                ]
            ]
        );
        // dd($varDataAdvanceRevision['data'][0]['document']['content']['itemList']['ungrouped'][0]);
        $compact = [
            'dataAdvanceRevisions' => $varDataAdvanceRevision['data'][0]['document']['content']['itemList']['ungrouped'][0],
            'dataRequester' => $varDataAdvanceRevision['data'][0]['document']['content']['involvedPersons']['requester'],
            'var_recordID' => $request->searchMaterialReturnNumberRevisionId,
            'statusRevisi' => 0,
        ];
        
        return view('Inventory.MaterialReturn.Transactions.RevisionMaterialReturn', $compact);
    }
    public function MaterialReturnListCartRevision(Request $request)
    {

        $varAPIWebToken = $request->session()->get('SessionLogin');
        $var_recordID = $request->input('var_recordID');

        $varData = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
        \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
        $varAPIWebToken, 
        'transaction.read.dataList.finance.getAdvanceDetail', 
        'latest', 
        [
        'parameter' => [
            'advance_RefID' => (int) $var_recordID,
            ],
        'SQLStatement' => [
            'pick' => null,
            'sort' => null,
            'filter' => null,
            'paging' => null
            ]
        ]
        );
        return response()->json($varData['data']);
    }

    public function update(Request $request, $id)
    {
        $input = $request->all();
        dd($input);
    }
}
