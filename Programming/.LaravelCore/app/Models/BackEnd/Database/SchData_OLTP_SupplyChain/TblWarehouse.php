<?php

/*
+----------------------------------------------------------------------------------------------------------------------------------+
| ▪ Category   : Laravel Models                                                                                                    |
| ▪ Name Space : \App\Models\Database\SchData_OLTP_SupplyChain                                                                     |
|                                                                                                                                  |
| ▪ Copyleft 🄯 2022 Zheta (teguhpjs@gmail.com)                                                                                     |
+----------------------------------------------------------------------------------------------------------------------------------+
*/
namespace App\Models\Database\SchData_OLTP_SupplyChain
    {
    /*
    +------------------------------------------------------------------------------------------------------------------------------+
    | ▪ Class Name  : TblWarehouse                                                                                                 |
    | ▪ Description : Menangani Models Database ► SchData-OLTP-SupplyChain ► TblWarehouse                                          |
    +------------------------------------------------------------------------------------------------------------------------------+
    */
    class TblWarehouse extends \App\Models\Database\DefaultClassPrototype
        {
        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : __construct                                                                                          |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2022-03-01                                                                                           |
        | ▪ Creation Date   : 2022-03-01                                                                                           |
        | ▪ Description     : System's Default Constructor                                                                         |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        function __construct()
            {
            parent::__construct(__CLASS__);
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : setDataInitialize                                                                                    |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2022-03-02                                                                                           |
        | ▪ Creation Date   : 2022-03-02                                                                                           |
        | ▪ Description     : Data Initialize                                                                                      |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (array)  varReturn                                                                                                | 
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function setDataInitialize($varUserSession)
            {
            $varReturn = \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getQueryExecution(
                $varUserSession, 
                \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getBuildStringLiteral_StoredProcedure(
                    $varUserSession,
                    'SchSysConfig-Initialize.Func_'.parent::getSchemaName($varUserSession).'_'.parent::getTableName($varUserSession),
                    []
                    )
                );
            return $varReturn['Data'][0];
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : setDataInsert                                                                                        |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0001.0000000                                                                                       |
        | ▪ Last Update     : 2023-12-11                                                                                           |
        | ▪ Creation Date   : 2022-03-01                                                                                           |
        | ▪ Description     : Data Insert                                                                                          |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (string) varSysDataAnnotation ► System Data Annotation                                                            |
        |      ▪ (string) varSysPartitionRemovableRecordKeyRefType ► System Partition Removable Record Key Reference Type          |
        |      ▪ (int)    varSysBranchRefID ► System Branch Reference ID                                                           |
        |      ▪ (int)    varSysBaseCurrency_RefID ► System Base Currency Reference ID                                             |
        |        ----------------------------------------                                                                          |
        |      ▪ (int)    varInstitutionBranch_RefID ► Institution Branch_Reference ID                                             |
        |      ▪ (string) varName ► Name                                                                                           |
        |      ▪ (int)    varWarehouseType_RefID ► Warehouse Type Reference ID                                                     |
        |      ▪ (string) varAddress ► Address                                                                                     |
        |      ▪ (int)    varCountryAdministrativeArea_RefID ► Country Administrative Area Reference ID                            |
        |      ▪ (string) varPostalCode ► Postal Code                                                                              |
        |      ▪ (string) varGPSPoint ► GPS Point                                                                                  |
        |      ▪ (string) varCode ► Code                                                                                           |
        |        ----------------------------------------                                                                          |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (array)  varReturn                                                                                                | 
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function setDataInsert(
            $varUserSession, 
            string $varSysDataAnnotation = null, int $varSysPartitionRemovableRecordKeyRefType = null, int $varSysBranchRefID = null, int $varSysBaseCurrency_RefID = null, 
            int $varInstitutionBranch_RefID = null, string $varName = null, int $varWarehouseType_RefID = null, string $varAddress = null, int $varCountryAdministrativeArea_RefID = null, string $varPostalCode = null, string $varGPSPoint = null, string $varCode = null)
            {
            $varReturn = 
                \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getQueryExecution(
                    $varUserSession, 
                    \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getBuildStringLiteral_StoredProcedure(
                        $varUserSession,
                        parent::getSchemaName($varUserSession).'.Func_'.parent::getTableName($varUserSession).'_SET',
                        [
                            [$varUserSession, 'bigint'],
                            [null, 'bigint'],
                            [$varSysDataAnnotation, 'varchar'],
                            [$varSysPartitionRemovableRecordKeyRefType, 'varchar'],
                            [$varSysBranchRefID, 'bigint'],
                            [$varSysBaseCurrency_RefID, 'bigint'],

                            [$varInstitutionBranch_RefID, 'bigint'],
                            [$varName, 'varchar'],
                            [$varWarehouseType_RefID, 'bigint'],
                            [$varAddress, 'varchar'],
                            [$varCountryAdministrativeArea_RefID, 'bigint'],
                            [$varPostalCode, 'varchar'],
                            [$varGPSPoint, 'varchar'],
                            [$varCode, 'varchar']
                        ]
                        )
                    );
            return $varReturn['Data'][0];
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : setDataUpdate                                                                                        |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0001.0000000                                                                                       |
        | ▪ Last Update     : 2023-12-11                                                                                           |
        | ▪ Creation Date   : 2022-03-01                                                                                           |
        | ▪ Description     : Data Update                                                                                          |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (int)    varSysID ► System Record ID                                                                              |
        |      ▪ (string) varSysDataAnnotation ► System Data Annotation                                                            |
        |      ▪ (string) varSysPartitionRemovableRecordKeyRefType ► System Partition Removable Record Key Reference Type          |
        |      ▪ (int)    varSysBranchRefID ► System Branch Reference ID                                                           |
        |      ▪ (int)    varSysBaseCurrency_RefID ► System Base Currency Reference ID                                             |
        |        ----------------------------------------                                                                          |
        |      ▪ (int)    varInstitutionBranch_RefID ► Institution Branch_Reference ID                                             |
        |      ▪ (string) varName ► Name                                                                                           |
        |      ▪ (int)    varWarehouseType_RefID ► Warehouse Type Reference ID                                                     |
        |      ▪ (string) varAddress ► Address                                                                                     |
        |      ▪ (int)    varCountryAdministrativeArea_RefID ► Country Administrative Area Reference ID                            |
        |      ▪ (string) varPostalCode ► Postal Code                                                                              |
        |      ▪ (string) varGPSPoint ► GPS Point                                                                                  |
        |      ▪ (string) varCode ► Code                                                                                           |
        |        ----------------------------------------                                                                          |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (array)  varReturn                                                                                                | 
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function setDataUpdate(
            $varUserSession, 
            int $varSysID, string $varSysDataAnnotation = null, int $varSysPartitionRemovableRecordKeyRefType = null, int $varSysBranchRefID = null, int $varSysBaseCurrency_RefID = null, 
            int $varInstitutionBranch_RefID = null, string $varName = null, int $varWarehouseType_RefID = null, string $varAddress = null, int $varCountryAdministrativeArea_RefID = null, string $varPostalCode = null, string $varGPSPoint = null, string $varCode = null)
            {
            $varReturn = 
                \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getQueryExecution(
                    $varUserSession, 
                    \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getBuildStringLiteral_StoredProcedure(
                        $varUserSession,
                        parent::getSchemaName($varUserSession).'.Func_'.parent::getTableName($varUserSession).'_SET',
                        [
                            [$varUserSession, 'bigint'],
                            [$varSysID, 'bigint'],
                            [$varSysDataAnnotation, 'varchar'],
                            [$varSysPartitionRemovableRecordKeyRefType, 'varchar'],
                            [$varSysBranchRefID, 'bigint'],
                            [$varSysBaseCurrency_RefID, 'bigint'],

                            [$varInstitutionBranch_RefID, 'bigint'],
                            [$varName, 'varchar'],
                            [$varWarehouseType_RefID, 'bigint'],
                            [$varAddress, 'varchar'],
                            [$varCountryAdministrativeArea_RefID, 'bigint'],
                            [$varPostalCode, 'varchar'],
                            [$varGPSPoint, 'varchar'],
                            [$varCode, 'varchar']
                        ]
                        )
                    );
            return $varReturn['Data'][0];
            }
        }
    }