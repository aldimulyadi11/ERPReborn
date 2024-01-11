<?php

/*
+----------------------------------------------------------------------------------------------------------------------------------+
| ▪ Category    : Example - API Call Controller                                                                                    |
| ▪ Name Space  : \App\Http\Controllers\Application\FrontEnd\SandBox\Examples_APICall\transaction\create\supplyChain               |
|                 \setOrderPicking\v1                                                                                              |
| ▪ API Key     : transaction.create.supplyChain.setOrderPicking                                                                   |
| ▪ API Version : 1                                                                                                                |
|                                                                                                                                  |
| ▪ Copyleft 🄯 2024 Zheta (teguhpjs@gmail.com)                                                                                     |
+----------------------------------------------------------------------------------------------------------------------------------+
*/
namespace App\Http\Controllers\Application\FrontEnd\SandBox\Examples_APICall\transaction\create\supplyChain\setOrderPicking\v1
    {
    class example extends \App\Http\Controllers\Controller
        {
        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Call URL        : http(s)://<HOST>/transaction.create.supplyChain.setOrderPicking.v1_throughAPIGateway                 |
        |                     ► http://172.28.0.4/transaction.create.supplyChain.setOrderPicking.v1_throughAPIGateway              |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2024-01-11                                                                                           |
        | ▪ Creation Date   : 2024-01-11                                                                                           |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function throughAPIGateway($varAPIWebToken)
            {
            //---Parameter Set---
            if (!$varAPIWebToken) {
                $varAPIWebToken = \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System();
                }
            //---Core---
            $varData = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
                \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
                $varAPIWebToken, 
                'transaction.create.supplyChain.setOrderPicking', 
                'latest', 
                [
                'entities' => [
                    "documentDateTimeTZ" => '2022-03-04',
                    "requesterWorkerJobsPosition_RefID" => 164000000000497,
                    "warehouse_RefID" => 173000000000001,
                    "deliveryDateTimeTZ" => '2022-03-08',
                    "deliveryDestination_RefID" => 173000000000002,
                    "remarks" => 'My Remarks',
                    "additionalData" => [
                        "itemList" => [
                            "items" => [
                                    [
                                    "entities" => [
                                        "orderPickingRequisitionDetail_RefID" => 249000000000001,
                                        "quantity" => 10,
                                        "quantityUnit_RefID" => 73000000000001,
                                        "productUnitPriceCurrency_RefID" => 62000000000001,
                                        "productUnitPriceCurrencyeValue" => 30000,
                                        "productUnitPriceCurrencyExchangeRate" => 1,
                                        "productUnitPriceDiscountCurrency_RefID" => 62000000000001,
                                        "productUnitPriceDiscountCurrencyeValue" => 0,
                                        "productUnitPriceDiscountCurrencyExchangeRate" => 1,
                                        "remarks" => 'Catatan Pertama Update'
                                        ]                                    
                                    ],
                                    [
                                    "entities" => [
                                        "orderPickingRequisitionDetail_RefID" => 249000000000002,
                                        "quantity" => 10,
                                        "quantityUnit_RefID" => 73000000000001,
                                        "productUnitPriceCurrency_RefID" => 62000000000001,
                                        "productUnitPriceCurrencyeValue" => 30000,
                                        "productUnitPriceCurrencyExchangeRate" => 1,
                                        "productUnitPriceDiscountCurrency_RefID" => 62000000000001,
                                        "productUnitPriceDiscountCurrencyeValue" => 0,
                                        "productUnitPriceDiscountCurrencyExchangeRate" => 1,
                                        "remarks" => 'Catatan Kedua Update'
                                        ]                                    
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
                );
            var_dump($varData);
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Call URL        : http(s)://<HOST>/transaction.create.supplyChain.setOrderPicking.v1_throughAPIGatewayJQuery          |
        |                     ► http://172.28.0.4/transaction.create.supplyChain.setOrderPicking.v1_throughAPIGatewayJQuery       |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2024-01-11                                                                                           |
        | ▪ Creation Date   : 2024-01-11                                                                                           |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function throughAPIGatewayJQuery($varAPIWebToken)
            {
/*            //---Parameter Set---
            if (!$varAPIWebToken) {
                $varAPIWebToken = \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System();
                }
            //---Core---
            echo \App\Helpers\ZhtHelper\General\Helper_JavaScript::setLibrary(\App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System());
            echo '<input type="text" id="dataInput_RecordID" value=85000000000001>';
            echo '<input type="text" id="dataInput_DocumentDateTimeTZ" value="2022-03-04">';
            echo '<input type="text" id="dataInput_RequesterWorkerJobsPosition_RefID" value=164000000000497>';
            echo '<input type="text" id="dataInput_Supplier_RefID" value=126000000000001>';
            echo '<input type="text" id="dataInput_DeliveryDateTimeTZ" value="2022-03-08">';
            echo '<input type="text" id="dataInput_DeliveryDestination_RefID" value=173000000000001>';
            echo '<input type="text" id="dataInput_SupplierInvoiceBillingPurpose_RefID" value=189000000000001>';
            echo '<input type="text" id="dataInput_PaymentTerm" value="My Payment Term">';
            echo '<input type="text" id="dataInput_Remarks" value="My Remarks">';
            $varJQueryFunction = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGatewayJQuery(
                \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(), 
                $varAPIWebToken, 
                'transaction.create.supplyChain.setOrderPicking', 
                'latest', 
                '{'.
                    '"recordID" : parseInt(document.getElementById("dataInput_RecordID").value), '.
                    '"entities" : {'.
                        '"documentDateTimeTZ" : document.getElementById("dataInput_DocumentDateTimeTZ").value, '.
                        '"requesterWorkerJobsPosition_RefID" : parseInt(document.getElementById("dataInput_RequesterWorkerJobsPosition_RefID").value), '.
                        '"supplier_RefID" : parseInt(document.getElementById("dataInput_Supplier_RefID").value), '.
                        '"deliveryDateTimeTZ" : document.getElementById("dataInput_DeliveryDateTimeTZ").value, '.
                        '"deliveryDestination_RefID" : parseInt(document.getElementById("dataInput_DeliveryDestination_RefID").value), '.
                        '"supplierInvoiceBillingPurpose_RefID" : parseInt(document.getElementById("dataInput_SupplierInvoiceBillingPurpose_RefID").value), '.
                        '"paymentTerm" : document.getElementById("dataInput_PaymentTerm").value, '.
                        '"remarks" : document.getElementById("dataInput_Remarks").value'.
                        '}'.
                '}'
                ); 
            echo "<button type='button' onclick='javascript:var varData = ".$varJQueryFunction."; $(\"body\").append(JSON.stringify(varData));'>Submit Data</button>";
            dd($varJQueryFunction);*/
            }
        }
    }