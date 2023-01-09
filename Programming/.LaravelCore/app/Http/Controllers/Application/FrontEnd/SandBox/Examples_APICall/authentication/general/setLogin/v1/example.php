<?php

/*
+----------------------------------------------------------------------------------------------------------------------------------+
| ▪ Category    : Example - API Call Controller                                                                                    |
| ▪ Name Space  : \App\Http\Controllers\Application\FrontEnd\SandBox\Examples_APICall\authentication\general\setLogin\v1           |
| ▪ API Key     : authentication.general.setLogin                                                                                  |
| ▪ API Version : 1                                                                                                                |
|                                                                                                                                  |
| ▪ Copyleft 🄯 2022 Zheta (teguhpjs@gmail.com)                                                                                     |
+----------------------------------------------------------------------------------------------------------------------------------+
*/
namespace App\Http\Controllers\Application\FrontEnd\SandBox\Examples_APICall\authentication\general\setLogin\v1
    {
    class example extends \App\Http\Controllers\Controller
        {
        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Call URL        : http(s)://<HOST>/authentication.general.setLogin.v1_throughAPIAuthentication                         |
        |                     ► http://172.28.0.4/authentication.general.setLogin.v1_throughAPIAuthentication                      |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2022-07-22                                                                                           |
        | ▪ Creation Date   : 2022-07-22                                                                                           |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function throughAPIAuthentication()
            {
            //---Parameter Set---
            $varUserName = 'sysadmin';
            $varUserPassword = 'sysadmin1234';
//            $varUserName = 'aldi.mulyadi';
//            $varUserPassword = 'aldi1234';
            //---Core---
            $varData = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIAuthentication(
                \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
                $varUserName, 
                $varUserPassword
                );
            var_dump($varData);
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Call URL        : http(s)://<HOST>/authentication.general.setLogin.v1_throughAPIAuthenticationJQuery                   |
        |                     ► http://172.28.0.4/authentication.general.setLogin.v1_throughAPIAuthenticationJQuery                |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2022-07-22                                                                                           |
        | ▪ Creation Date   : 2022-07-22                                                                                           |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function throughAPIAuthenticationJQuery()
            {
            //---Parameter Set---
            $varUserName = 'sysadmin';
            $varUserPassword = 'sysadmin1234';
            //---Core---
            echo \App\Helpers\ZhtHelper\General\Helper_JavaScript::setLibrary(\App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System());
            echo '<input type="text" id="dataInput_UserName" value="'.$varUserName.'">';
            echo '<input type="text" id="dataInput_UserPassword" value="'.$varUserPassword.'">';
            //---Core---          
            $varJQueryFunction = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIAuthenticationJQuery(
                \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(), 
                '{'.
                    '"userName" : document.getElementById("dataInput_UserName").value, '.
                    '"userPassword" : document.getElementById("dataInput_UserPassword").value '.
                '}'
                ); 
            
            echo "<button type='button' onclick='javascript: var varData = ".$varJQueryFunction."; $(\"body\").append(JSON.stringify(varData));'>Submit Data</button>";
            dd($varJQueryFunction);
            }
        }
    }