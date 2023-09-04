<?php

/*
+----------------------------------------------------------------------------------------------------------------------------------+
| ▪ Category    : Example - API Call Controller                                                                                    |
| ▪ Name Space  : \App\Http\Controllers\Application\FrontEnd\SandBox\Examples_APICall\transaction\create\dataAcquisition           |
|                 \setLog_FileContent\v1                                                                                           |
| ▪ API Key     : transaction.create.dataAcquisition.setLog_FileContent                                                            |
| ▪ API Version : 1                                                                                                                |
|                                                                                                                                  |
| ▪ Copyleft 🄯 2023 Zheta (teguhpjs@gmail.com)                                                                                     |
+----------------------------------------------------------------------------------------------------------------------------------+
*/
namespace App\Http\Controllers\Application\FrontEnd\SandBox\Examples_APICall\transaction\create\dataAcquisition\setLog_FileContent\v1
    {
    class example extends \App\Http\Controllers\Controller
        {
        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Call URL        : http(s)://<HOST>/transaction.create.dataAcquisition.setLog_FileContent.v1_throughAPIGateway          |
        |                     ► http://172.28.0.4/transaction.create.dataAcquisition.setLog_FileContent.v1_throughAPIGateway       |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2023-09-03                                                                                           |
        | ▪ Creation Date   : 2023-09-03                                                                                           |
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
                'transaction.create.dataAcquisition.setLog_FileContent', 
                'latest', 
                [
                'entities' => [
                    "additionalData" => [
                        "itemList" => [
                            "items" => [
                                    [
                                    "entities" => [
                                        "log_FileContent_RefID" => 236000000000001,
                                        "sequence" => 1,
                                        "name" => 'fileName.csv',
                                        "size" => 6,
                                        "MIME" => 'text/csv',
                                        "extension" => 'csv',
                                        "lastModifiedDateTimeTZ" => 'Thu Aug 31 2023 08:48:41 GMT+0700 (Western Indonesia Time)',
                                        "lastModifiedUnixTimestamp" => 1693446521406,
                                        "contentBase64" => 'IklZm9'
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
        |                     transaction.create.dataAcquisition.setLog_FileContent.v1_throughAPIGatewayJQuery                     |
        |                     ► http://172.28.0.4/                                                                                 |
        |                       transaction.create.dataAcquisition.setLog_FileContent.v1_throughAPIGatewayJQuery                   |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2023-09-03                                                                                           |
        | ▪ Creation Date   : 2023-09-03                                                                                           |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function throughAPIGatewayJQuery($varAPIWebToken)
            {
            //---Parameter Set---
            if (!$varAPIWebToken) {
                $varAPIWebToken = \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System();
                }
            //---Core---
            }
        }
    }