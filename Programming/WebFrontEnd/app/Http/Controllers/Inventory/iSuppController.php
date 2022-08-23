<?php

namespace App\Http\Controllers\Inventory;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Http\Controllers\Controller;

class iSuppController extends Controller
{
    public function index(Request $request)
    {
        $varAPIWebToken = $request->session()->get('SessionLogin');
        $request->session()->forget("SessioniSupp");

        $varDataProject = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
            \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
            $varAPIWebToken,
            'dataPickList.project.getProject',
            'latest',
            [
                'parameter' => []
            ]
        );
        $var = 0;
        if (!empty($_GET['var'])) {
            $var =  $_GET['var'];
        }
        $compact = [
            'dataProject' => $varDataProject['data']['data'],
            'var' => $var,
        ];
        return view('Inventory.iSupp.Transactions.createISupp', $compact);
    }

    public function StoreValidateiSupp(Request $request)
    {
        $tamp = 0;
        $status = 200;
        $val = $request->input('productiSuppDetail');
        $data = $request->session()->get("SessioniSupp");
        if ($request->session()->has("SessioniSupp")) {
            for ($i = 0; $i < count($data); $i++) {
                if ($data[$i] == $val) {
                    $tamp = 1;
                }
            }
            if ($tamp == 0) {
                $request->session()->push("SessioniSupp", $val);
            } else {
                $status = 500;
            }
        } else {
            $request->session()->push("SessioniSupp", $val);
        }

        return response()->json($status);
    }

    public function StoreValidateiSupp2(Request $request)
    {
        $messages = $request->session()->get("SessioniSupp");
        $val = $request->input('productiSuppDetail');
        if (($key = array_search($val, $messages)) !== false) {
            unset($messages[$key]);
            $newClass = array_values($messages);
            $request->session()->put("SessioniSupp", $newClass);
        }
    }

    public function store(Request $request)
    {
        // $input = $request->all();
        // $count_product = count($input['var_product_id']);

        // $varAPIWebToken = $request->session()->get('SessionLogin');

        // $advanceDetail = [];
        // for ($n = 0; $n < $count_product; $n++) {
        //     $advanceDetail[$n] = [
        //         'entities' => [
        //             "combinedBudgetSectionDetail_RefID" => (int) $input['var_combinedBudget'][$n],
        //             "product_RefID" => (int) $input['var_product_id'][$n],
        //             "quantity" => (float) $input['var_quantity'][$n],
        //             "quantityUnit_RefID" => 73000000000001,
        //             "productUnitPriceCurrency_RefID" => 62000000000001,
        //             "productUnitPriceCurrencyValue" => (float) $input['var_price'][$n],
        //             "productUnitPriceCurrencyExchangeRate" => 1,
        //             "remarks" => 'Catatan Detail'
        //         ]
        //     ];
        // }

        // $varData = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
        //     \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
        //     $varAPIWebToken,
        //     'transaction.create.finance.setAdvance',
        //     'latest',
        //     [
        //         'entities' => [
        //             "documentDateTimeTZ" => $input['var_date'],
        //             "log_FileUpload_Pointer_RefID" => 91000000000001,
        //             "requesterWorkerJobsPosition_RefID" => (int)$input['var_request_name_id'],
        //             "beneficiaryWorkerJobsPosition_RefID" => 25000000000439,
        //             "beneficiaryBankAccount_RefID" => 167000000000001,
        //             "internalNotes" => 'My Internal Notes',
        //             "remarks" => $input['var_remark'],
        //             "additionalData" => [
        //                 "itemList" => [
        //                     "items" => $advanceDetail
        //                 ]
        //             ]
        //         ]
        //     ]
        // );

        $compact = [
            "advnumber" => "ADV-testing-00111",
        ];

        return response()->json($compact);
    }

    public function revisionDorIndex(Request $request)
    {
        if ($request->searchDorNumberRevision == 'Q000181') {
            $project = "Project Code 1";
            $projectDetail = "Project Detail 1";
            $site = "Site Code 1";
            $siteDetail = "Site Detail 1";
            $beneficary = "Beneficary ";
            $bank = "Bank Name 1";
            $accountName = "Account Name 1";
            $accountNumber = "Account Number 1";
            $internal = "Internal Notes 1";
            $requester = "Requester 1";
            $workId = "Work Id 1";
            $workIdDetail = "Work Id Detail 1";
            $productId = "Product Id 1";
            $productIdDetail = "Product Detail 1";
            $qty = "2";
            $qtyDetail = "IDR";
            $unitPrice = "500";
            $unitPriceDetail = "Rp";
            $total = "1000";
            $remark = "Remark";
            $totalBoq = "200000";
            $requestTotal = "200000";
            $balance = "200000";
        } else if ($request->searchDorNumberRevision == 'Q000182') {
            $project = "Project Code 2";
            $projectDetail = "Project Detail 2";
            $site = "Site Code 2";
            $siteDetail = "Site Detail 2";
            $beneficary = "Beneficary ";
            $bank = "Bank Name 2";
            $accountName = "Account Name 2";
            $accountNumber = "Account Number 2";
            $internal = "Internal Notes 2";
            $requester = "Requester 2";
            $workId = "Work Id 2";
            $workIdDetail = "Work Id Detail 2";
            $productId = "Product Id 2";
            $productIdDetail = "Product Detail 2";
            $qty = "2";
            $qtyDetail = "IDR";
            $unitPrice = "500";
            $unitPriceDetail = "Rp";
            $total = "1000";
            $remark = "Remark";
            $totalBoq = "200000";
            $requestTotal = "200000";
            $balance = "200000";
        } else if ($request->searchDorNumberRevision == 'Q000183') {
            $project = "Project Code 3";
            $projectDetail = "Project Detail 3";
            $site = "Site Code 3";
            $siteDetail = "Site Detail 3";
            $beneficary = "Beneficary ";
            $bank = "Bank Name 3";
            $accountName = "Account Name 3";
            $accountNumber = "Account Number 3";
            $internal = "Internal Notes 3";
            $requester = "Requester 3";
            $workId = "Work Id 3";
            $workIdDetail = "Work Id Detail 3";
            $productId = "Product Id 3";
            $productIdDetail = "Product Detail 3";
            $qty = "2";
            $qtyDetail = "IDR";
            $unitPrice = "500";
            $unitPriceDetail = "Rp";
            $total = "1000";
            $remark = "Remark";
            $totalBoq = "200000";
            $requestTotal = "200000";
            $balance = "200000";
        }

        $varAPIWebToken = $request->session()->get('SessionLogin');

        $varData = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
            \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
            $varAPIWebToken,
            'dataPickList.project.getProject',
            'latest',
            [
                'parameter' => []
            ]
        );

        $data = $varData['data'];


        return view('Inventory.DeliveryOrderRequest.Transactions.createDor', compact('project', 'projectDetail', 'site', 'siteDetail', 'beneficary', 'bank', 'accountNumber', 'accountName', 'internal', 'requester', 'workId', 'productId', 'workIdDetail', 'productIdDetail', 'qty', 'qtyDetail', 'unitPrice', 'unitPriceDetail', 'total', 'remark', 'totalBoq', 'requestTotal', 'balance', 'data'));
    }
}
