<?php

/*
+----------------------------------------------------------------------------------------------------------------------------------+
| ▪ Category   : Laravel Models                                                                                                    |
| ▪ Name Space : \App\Models\Database\SchData_OLTP_Production                                                                      |
|                                                                                                                                  |
| ▪ Copyleft 🄯 2021 Zheta (teguhpjs@gmail.com)                                                                                     |
+----------------------------------------------------------------------------------------------------------------------------------+
*/
namespace App\Models\Database\SchData_OLTP_Production
    {
    /*
    +------------------------------------------------------------------------------------------------------------------------------+
    | ▪ Class Name  : General                                                                                                      |
    | ▪ Description : Menangani Models Database ► SchData_OLTP_Production ► Non Specific Table                                     |
    +------------------------------------------------------------------------------------------------------------------------------+
    */
    class General
        {
        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : getDataEntities_MaterialProduct                                                                      |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2022-09-27                                                                                           |
        | ▪ Creation Date   : 2022-09-27                                                                                           |
        | ▪ Description     : Get Data Entities - Material Product                                                                 |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (int)    varSysID ► System Record ID                                                                              |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (array)  varReturn                                                                                                | 
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function getDataEntities_MaterialProduct($varUserSession, 
            string $varIDSet)
            {
            try {
                $varFunctionName='SchData-OLTP-Production.Func_GetDataEntities_MaterialProduct';
                $varTemp = \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getQueryExecution(
                    $varUserSession, 
                    \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getBuildStringLiteral_StoredProcedure(
                        $varUserSession,
                        $varFunctionName,
                            [
                                [$varUserSession, 'bigint'],
                                [$varIDSet, 'bigint[]']
                            ]
                        )
                    ); 

                for ($i=0; $i!=count($varTemp['Data']); $i++)
                    {
                    $varReturn[$i] = \App\Helpers\ZhtHelper\General\Helper_Encode::getJSONDecode(
                        $varUserSession, 
                        $varTemp['Data'][$i][explode('.', $varFunctionName)[1]]);
                    }
                return $varReturn;
                }
            catch (\Exception $ex) {
                return [];
                }
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : getDataList_BillOfMaterial                                                                           |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-10-12                                                                                           |
        | ▪ Description     : Mendapatkan Daftar Bill Of Material                                                                  |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (int)    varBranchID ► Branch ID                                                                                  |
        |      ▪ (string) varPickStatement ► Pick Statement                                                                        |
        |      ▪ (string) varSortStatement ► Sort Statement                                                                        |
        |      ▪ (string) varFilterStatement ► Filter Statement                                                                    |
        |      ▪ (string) varPagingStatement ► Paging Statement                                                                    |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (array)  varReturn                                                                                                | 
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function getDataList_BillOfMaterial($varUserSession, int $varBranchID, 
            string $varPickStatement = null, string $varSortStatement = null, string $varFilterStatement = null, string $varPagingStatement = null)
            {
            try {
                $varReturn = \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getQueryExecution(
                    $varUserSession, 
                    \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getBuildStringLiteral_StoredProcedure(
                        $varUserSession,
                        'SchData-OLTP-Production.Func_GetDataList_BillOfMaterial',
                        [
                            [$varBranchID, 'bigint' ],
                            [$varPickStatement, 'varchar'],
                            [$varSortStatement, 'varchar'],
                            [$varFilterStatement, 'varchar'],
                            [$varPagingStatement, 'varchar']
                        ]
                        )
                    );                
                return $varReturn['Data'];
                }
            catch (\Exception $ex) {
                return [];
                }
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : getDataList_BillOfMaterialDetail                                                                     |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2022-01-05                                                                                           |
        | ▪ Description     : Mendapatkan Daftar Bill Of Material Detail                                                           |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (int)    varBranchID ► Branch ID                                                                                  |
        |      ▪ (int)    varBillOfMaterial_RefID ► Bill Of Material Reference ID                                                  |
        |      ▪ (string) varPickStatement ► Pick Statement                                                                        |
        |      ▪ (string) varSortStatement ► Sort Statement                                                                        |
        |      ▪ (string) varFilterStatement ► Filter Statement                                                                    |
        |      ▪ (string) varPagingStatement ► Paging Statement                                                                    |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (array)  varReturn                                                                                                | 
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function getDataList_BillOfMaterialDetail($varUserSession, int $varBranchID, 
            int $varBillOfMaterial_RefID,
            string $varPickStatement = null, string $varSortStatement = null, string $varFilterStatement = null, string $varPagingStatement = null)
            {
            try {
                $varReturn = \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getQueryExecution(
                    $varUserSession, 
                    \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getBuildStringLiteral_StoredProcedure(
                        $varUserSession,
                        'SchData-OLTP-Production.Func_GetDataList_BillOfMaterialDetail',
                        [
                            [$varBranchID, 'bigint' ],
                            [$varBillOfMaterial_RefID, 'bigint' ],
                            [$varPickStatement, 'varchar'],
                            [$varSortStatement, 'varchar'],
                            [$varFilterStatement, 'varchar'],
                            [$varPagingStatement, 'varchar']
                        ]
                        )
                    );                
                return $varReturn['Data'];
                }
            catch (\Exception $ex) {
                return [];
                }
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : getDataPickList_BillOfMaterial                                                                       |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-10-12                                                                                           |
        | ▪ Description     : Mendapatkan Daftar Pilihan Data Bill Of Material                                                     |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (int)    varBranchID ► Branch ID                                                                                  |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (array)  varReturn                                                                                                | 
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function getDataPickList_BillOfMaterial($varUserSession, int $varBranchID)
            {
            try {
                $varReturn = \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getQueryExecution(
                    $varUserSession, 
                    \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getBuildStringLiteral_StoredProcedure(
                        $varUserSession,
                        'SchData-OLTP-Production.Func_GetDataPickList_BillOfMaterial',
                        [
                            [$varBranchID, 'bigint' ]
                        ]
                        )
                    );
                return $varReturn['Data'];
                }
            catch (\Exception $ex) {
                return [];
                }
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : getDataList_MaterialProductAssembly                                                                  |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-05-27                                                                                           |
        | ▪ Description     : Mendapatkan Daftar Material Product Assembly                                                         |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (int)    varBranchID ► Branch ID                                                                                  |
        |      ▪ (string) varPickStatement ► Pick Statement                                                                        |
        |      ▪ (string) varSortStatement ► Sort Statement                                                                        |
        |      ▪ (string) varFilterStatement ► Filter Statement                                                                    |
        |      ▪ (string) varPagingStatement ► Paging Statement                                                                    |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (array)  varReturn                                                                                                | 
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function getDataList_MaterialProductAssembly($varUserSession, int $varBranchID, 
            string $varPickStatement = null, string $varSortStatement = null, string $varFilterStatement = null, string $varPagingStatement = null)
            {
            try {
                $varReturn = \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getQueryExecution(
                    $varUserSession, 
                    \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getBuildStringLiteral_StoredProcedure(
                        $varUserSession,
                        'SchData-OLTP-Production.Func_GetDataList_MaterialProductAssembly',
                        [
                            [$varBranchID, 'bigint' ],
                            [$varPickStatement, 'varchar'],
                            [$varSortStatement, 'varchar'],
                            [$varFilterStatement, 'varchar'],
                            [$varPagingStatement, 'varchar']
                        ]
                        )
                    );                
                return $varReturn['Data'];
                }
            catch (\Exception $ex) {
                return [];
                }
            }

        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : getDataList_MaterialProductComponent                                                                 |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-05-27                                                                                           |
        | ▪ Description     : Mendapatkan Daftar Material Product Component                                                        |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (int)    varBranchID ► Branch ID                                                                                  |
        |      ▪ (string) varPickStatement ► Pick Statement                                                                        |
        |      ▪ (string) varSortStatement ► Sort Statement                                                                        |
        |      ▪ (string) varFilterStatement ► Filter Statement                                                                    |
        |      ▪ (string) varPagingStatement ► Paging Statement                                                                    |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (array)  varReturn                                                                                                | 
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function getDataList_MaterialProductComponent($varUserSession, int $varBranchID, 
            string $varPickStatement = null, string $varSortStatement = null, string $varFilterStatement = null, string $varPagingStatement = null)
            {
            try {
                $varReturn = \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getQueryExecution(
                    $varUserSession, 
                    \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getBuildStringLiteral_StoredProcedure(
                        $varUserSession,
                        'SchData-OLTP-Production.Func_GetDataList_MaterialProductComponent',
                        [
                            [$varBranchID, 'bigint' ],
                            [$varPickStatement, 'varchar'],
                            [$varSortStatement, 'varchar'],
                            [$varFilterStatement, 'varchar'],
                            [$varPagingStatement, 'varchar']
                        ]
                        )
                    );                
                return $varReturn['Data'];
                }
            catch (\Exception $ex) {
                return [];
                }
            }
            
            
        }
    }