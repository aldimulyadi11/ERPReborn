<?php

/*
+----------------------------------------------------------------------------------------------------------------------------------+
| ▪ Category    : Example - API Call Controller                                                                                    |
| ▪ Name Space  : \App\Http\Controllers\Application\FrontEnd\SandBox\Examples_APICall\transaction\create\supplyChain               |
|                 \setOrderPickingRequisition\v1                                                                                   |
| ▪ API Key     : transaction.create.supplyChain.setOrderPickingRequisition                                                        |
| ▪ API Version : 1                                                                                                                |
|                                                                                                                                  |
| ▪ Copyleft 🄯 2024 Zheta (teguhpjs@gmail.com)                                                                                     |
+----------------------------------------------------------------------------------------------------------------------------------+
*/
namespace App\Http\Controllers\Application\FrontEnd\SandBox\Examples_APICall\transaction\create\supplyChain\setOrderPickingRequisition\v1
    {
    class example extends \App\Http\Controllers\Controller
        {
        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Call URL        : http(s)://<HOST>/transaction.create.supplyChain.setOrderPickingRequisition.v1_throughAPIGateway      |
        |                     ► http://172.28.0.4/transaction.create.supplyChain.setOrderPickingRequisition.v1_throughAPIGateway   |
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
                'transaction.create.supplyChain.setOrderPickingRequisition', 
                'latest', 
                [
                'entities' => [
                    "documentDateTimeTZ" => '2022-03-07',
                    "requesterWorkerJobsPosition_RefID" => 164000000000497,
                    "remarks" => 'My Remarks',
                    "additionalData" => [
                        "itemList" => [
                            "items" => [
                                    [
                                    "entities" => [
                                        "purchaseRequisitionDetail_RefID" => 84000000000001,
                                        "product_RefID" => 88000000000002,
                                        "quantity" => 10,
                                        "quantityUnit_RefID" => 73000000000001,
                                        "productUnitPriceCurrency_RefID" => 62000000000001,
                                        "productUnitPriceCurrencyValue" => 30000,
                                        "productUnitPriceCurrencyExchangeRate" => 1,
                                        "fulfillmentDeadlineDateTimeTZ" => '2023-05-10',
                                        "remarks" => 'Catatan Pertama'
                                        ]                                   
                                    ],
                                    [
                                    "entities" => [
                                        "purchaseRequisitionDetail_RefID" => 84000000000002,
                                        "product_RefID" => 88000000000003,
                                        "quantity" => 10,
                                        "quantityUnit_RefID" => 73000000000001,
                                        "productUnitPriceCurrency_RefID" => 62000000000001,
                                        "productUnitPriceCurrencyValue" => 30000,
                                        "productUnitPriceCurrencyExchangeRate" => 1,
                                        "fulfillmentDeadlineDateTimeTZ" => '2023-03-01',
                                        "remarks" => 'Catatan Kedua'
                                        ]
                                    ],
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
        | ▪ Call URL        : http(s)://<HOST>/                                                                                    |
        |                     transaction.create.supplyChain.setOrderPickingRequisition.v1_throughAPIGatewayJQuery                 |
        |                     ► http://172.28.0.4/                                                                                 |
        |                       transaction.create.supplyChain.setOrderPickingRequisition.v1_throughAPIGatewayJQuery               |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2024-01-11                                                                                           |
        | ▪ Creation Date   : 2024-01-11                                                                                           |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function throughAPIGatewayJQuery($varAPIWebToken)
            {
            if (!$varAPIWebToken) {
                $varAPIWebToken = \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System();
                }
            //---Core---
            echo \App\Helpers\ZhtHelper\General\Helper_JavaScript::setLibrary(\App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System());
            echo '<table border="1" style="border-collapse: collapse;">';
            echo    '<tr><td colspan="2" bgcolor="#6666cc" align="middle"><p style="color:#ffffff">Order Picking Requisition Main Data</p></td></tr>';
            echo        '<tr><td>DocumentDateTimeTZ</td><td><input type="text" id="dataInput_DocumentDateTimeTZ" value="2022-03-07"></td></tr>';
            echo        '<tr><td>RequesterWorkerJobsPosition_RefID</td><td><input type="text" id="dataInput_RequesterWorkerJobsPosition_RefID" value=164000000000497></td></tr>';
            echo        '<tr><td>Remarks</td><td><input type="text" id="dataInput_Remarks" value="My Remarks"></td></tr>';
            echo    '<tr><td colspan="2" bgcolor="#6666cc" align="middle"><p style="color:#ffffff">Purchase Requisition Detail Data</p></td></tr></tr>';
            echo        '<tr><td>PurchaseRequisitionDetail_RefID_1</td><td><input type="text" id="dataInput_PurchaseRequisitionDetail_RefID_1" value=84000000000001></td></tr>';
            echo        '<tr><td>Product_RefID_1</td><td><input type="text" id="dataInput_Product_RefID_1" value=88000000000002></td></tr>';
            echo        '<tr><td>Quantity_1</td><td><input type="text" id="dataInput_Quantity_1" value=10></td></tr>';
            echo        '<tr><td>QuantityUnit_RefID_1</td><td><input type="text" id="dataInput_QuantityUnit_RefID_1" value=73000000000001></td></tr>';
            echo        '<tr><td>ProductUnitPriceCurrency_RefID_1</td><td><input type="text" id="dataInput_ProductUnitPriceCurrency_RefID_1" value=62000000000001></td></tr>';
            echo        '<tr><td>ProductUnitPriceCurrencyValue_1</td><td><input type="text" id="dataInput_ProductUnitPriceCurrencyValue_1" value=30000></td></tr>';
            echo        '<tr><td>ProductUnitPriceCurrencyExchangeRate_1</td><td><input type="text" id="dataInput_ProductUnitPriceCurrencyExchangeRate_1" value=1></td></tr>';
            echo        '<tr><td>FulfillmentDeadlineDateTimeTZ_1</td><td><input type="text" id="dataInput_FulfillmentDeadlineDateTimeTZ_1" value="2023-03-10"></td></tr>';
            echo        '<tr><td>Remarks_1</td><td><input type="text" id="dataInput_Remarks_1" value="Catatan Pertama Revisi"></td></tr>';
            echo    '<tr><td colspan="2" bgcolor="#6666cc" align="middle"><p style="color:#ffffff"></p></td></tr></tr>';
            echo        '<tr><td>PurchaseRequisitionDetail_RefID_2</td><td><input type="text" id="dataInput_PurchaseRequisitionDetail_RefID_2" value=84000000000002></td></tr>';
            echo        '<tr><td>Product_RefID_2</td><td><input type="text" id="dataInput_Product_RefID_2" value=88000000000003></td></tr>';
            echo        '<tr><td>Quantity_2</td><td><input type="text" id="dataInput_Quantity_2" value=5></td></tr>';
            echo        '<tr><td>QuantityUnit_RefID_2</td><td><input type="text" id="dataInput_QuantityUnit_RefID_2" value=73000000000001></td></tr>';
            echo        '<tr><td>ProductUnitPriceCurrency_RefID_2</td><td><input type="text" id="dataInput_ProductUnitPriceCurrency_RefID_2" value=62000000000001></td></tr>';
            echo        '<tr><td>ProductUnitPriceCurrencyValue_2</td><td><input type="text" id="dataInput_ProductUnitPriceCurrencyValue_2" value=40000></td></tr>';
            echo        '<tr><td>ProductUnitPriceCurrencyExchangeRate_2</td><td><input type="text" id="dataInput_ProductUnitPriceCurrencyExchangeRate_2" value=1></td></tr>';
            echo        '<tr><td>FulfillmentDeadlineDateTimeTZ_2</td><td><input type="text" id="dataInput_FulfillmentDeadlineDateTimeTZ_2" value="2023-03-01"></td></tr>';
            echo        '<tr><td>Remarks_2</td><td><input type="text" id="dataInput_Remarks_2" value="Catatan Kedua Revisi"></td></tr>';
            echo '</table><br>';
            $varJQueryFunction = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGatewayJQuery(
                \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(), 
                $varAPIWebToken, 
                'transaction.create.supplyChain.setOrderPickingRequisition', 
                'latest', 
                '{'.
                    '"entities" : {'.
                        '"documentDateTimeTZ" : document.getElementById("dataInput_DocumentDateTimeTZ").value, '.
                        '"requesterWorkerJobsPosition_RefID" : parseInt(document.getElementById("dataInput_RequesterWorkerJobsPosition_RefID").value), '.
                        '"remarks" : document.getElementById("dataInput_Remarks").value, '.
                        '"additionalData" : {'.
                            '"itemList" : {'.
                                '"items" : ['.
                                        '{'.
                                        '"entities" : '.
                                            '{'.
                                            '"purchaseRequisitionDetail_RefID" : parseInt(document.getElementById("dataInput_PurchaseRequisitionDetail_RefID_1").value), '.
                                            '"product_RefID" : parseInt(document.getElementById("dataInput_Product_RefID_1").value), '.
                                            '"quantity" : parseFloat(document.getElementById("dataInput_Quantity_1").value), '.
                                            '"quantityUnit_RefID" : parseInt(document.getElementById("dataInput_QuantityUnit_RefID_1").value),'.
                                            '"productUnitPriceCurrency_RefID" : parseInt(document.getElementById("dataInput_ProductUnitPriceCurrency_RefID_1").value),'.
                                            '"productUnitPriceCurrencyValue" : parseFloat(document.getElementById("dataInput_ProductUnitPriceCurrencyValue_1").value),'.
                                            '"productUnitPriceCurrencyExchangeRate" : parseFloat(document.getElementById("dataInput_ProductUnitPriceCurrencyExchangeRate_1").value),'.
                                            '"fulfillmentDeadlineDateTimeTZ" : document.getElementById("dataInput_FulfillmentDeadlineDateTimeTZ_1").value, '.
                                            '"remarks" : document.getElementById("dataInput_Remarks_1").value'.
                                            '}'.
                                        '}, '.
                                        '{'.
                                        '"entities" : '.
                                            '{'.
                                            '"purchaseRequisitionDetail_RefID" : parseInt(document.getElementById("dataInput_PurchaseRequisitionDetail_RefID_2").value), '.
                                            '"product_RefID" : parseInt(document.getElementById("dataInput_Product_RefID_2").value), '.
                                            '"quantity" : parseFloat(document.getElementById("dataInput_Quantity_2").value), '.
                                            '"quantityUnit_RefID" : parseInt(document.getElementById("dataInput_QuantityUnit_RefID_2").value),'.
                                            '"productUnitPriceCurrency_RefID" : parseInt(document.getElementById("dataInput_ProductUnitPriceCurrency_RefID_2").value),'.
                                            '"productUnitPriceCurrencyValue" : parseFloat(document.getElementById("dataInput_ProductUnitPriceCurrencyValue_2").value),'.
                                            '"productUnitPriceCurrencyExchangeRate" : parseFloat(document.getElementById("dataInput_ProductUnitPriceCurrencyExchangeRate_2").value),'.
                                            '"fulfillmentDeadlineDateTimeTZ" : document.getElementById("dataInput_FulfillmentDeadlineDateTimeTZ_2").value, '.
                                            '"remarks" : document.getElementById("dataInput_Remarks_2").value'.
                                            '}'.
                                        '}'.
                                    ']'.
                                '}'.
                            '}'.
                        '}'.
                '}'
                );
            echo "<button type='button' onclick='javascript:var varData = ".$varJQueryFunction."; $(\"body\").append(JSON.stringify(varData));'>Submit Data</button>";
            dd($varJQueryFunction);
            }
        }
    }