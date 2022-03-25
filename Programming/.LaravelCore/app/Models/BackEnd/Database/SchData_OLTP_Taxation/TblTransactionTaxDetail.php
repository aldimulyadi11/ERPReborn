<?php

/*
+----------------------------------------------------------------------------------------------------------------------------------+
| ▪ Category   : Laravel Models                                                                                                    |
| ▪ Name Space : \App\Models\Database\SchData_OLTP_Taxation                                                                        |
|                                                                                                                                  |
| ▪ Copyleft 🄯 2022 Zheta (teguhpjs@gmail.com)                                                                                     |
+----------------------------------------------------------------------------------------------------------------------------------+
*/
namespace App\Models\Database\SchData_OLTP_Taxation
    {
    /*
    +------------------------------------------------------------------------------------------------------------------------------+
    | ▪ Class Name  : TblTransactionTaxDetail                                                                                      |
    | ▪ Description : Menangani Models Database ► SchData-OLTP-Taxation ► TblTransactionTaxDetail                                  |
    +------------------------------------------------------------------------------------------------------------------------------+
    */
    class TblTransactionTaxDetail extends \App\Models\Database\DefaultClassPrototype
        {
        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : __construct                                                                                          |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Creation Date   : 2022-03-16                                                                                           |
        | ▪ Last Update     : 2022-03-16                                                                                           |
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
        | ▪ Method Name     : setDataInsert                                                                                        |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000001                                                                                       |
        | ▪ Creation Date   : 2022-03-16                                                                                           |
        | ▪ Last Update     : 2022-03-24                                                                                           |
        | ▪ Description     : Data Insert                                                                                          |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (string) varSysDataAnnotation ► System Data Annotation                                                            |
        |      ▪ (string) varSysPartitionRemovableRecordKeyRefType ► System Partition Removable Record Key Reference Type          |
        |      ▪ (int)    varSysBranch_RefID ► System Branch Reference ID                                                          |
        |      ▪ (int)    varSysBaseCurrency_RefID ► System Base Currency Reference ID                                             |
        |      ▪ (int)    varTransactionTax_RefID ► Transaction Tax Reference ID                                                   |
        |      ▪ (int)    varTaxType_RefID ► Tax Type Reference ID                                                                 |
        |      ▪ (int)    varCurrency_RefID ► Currency Reference ID                                                                |
        |      ▪ (float)  varCurrencyValue ► Currency Value                                                                        |
        |      ▪ (int)    varBaseCurrency_RefID ► Base Currency Reference ID                                                       |
        |      ▪ (float)  varCurrencyExchangeRate ► Currency Exchange Rate                                                         |
        |      ▪ (string) varRemarks ► Remarks                                                                                     |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (array)  varReturn                                                                                                | 
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function setDataInsert(
            $varUserSession, 
            string $varSysDataAnnotation = null, int $varSysPartitionRemovableRecordKeyRefType = null, int $varSysBranch_RefID = null, int $varSysBaseCurrency_RefID = null,
            int $varTransactionTax_RefID = null, int $varTaxType_RefID = null, int $varCurrency_RefID = null, float $varCurrencyValue = null, float $varCurrencyExchangeRate = null, string $varRemarks = null)
            {
            $varReturn = \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getQueryExecution(
                $varUserSession, 
                \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getBuildStringLiteral_StoredProcedure(
                    $varUserSession,
                    parent::getSchemaName($varUserSession).'.Func_'.parent::getTableName($varUserSession).'_SET',
                    [
                        [$varUserSession, 'bigint'],
                        [null, 'bigint'],
                        [$varSysDataAnnotation, 'varchar'],
                        [$varSysPartitionRemovableRecordKeyRefType, 'varchar'],
                        [$varSysBranch_RefID, 'bigint'],
                        [$varSysBaseCurrency_RefID, 'bigint'],

                        [$varTransactionTax_RefID, 'bigint'],
                        [$varTaxType_RefID, 'bigint'],
                        [$varCurrency_RefID, 'bigint'],
                        [$varCurrencyValue, 'numeric'],
                        [$varCurrencyExchangeRate, 'numeric'],
                        [$varRemarks, 'varchar']
                    ]
                    )
                );
            return $varReturn['Data'][0];
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : setDataUpdate                                                                                        |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000001                                                                                       |
        | ▪ Creation Date   : 2022-03-16                                                                                           |
        | ▪ Last Update     : 2022-03-24                                                                                           |
        | ▪ Description     : Data Update                                                                                          |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (int)    varSysID ► System Record ID                                                                              |
        |      ▪ (string) varSysDataAnnotation ► System Data Annotation                                                            |
        |      ▪ (string) varSysPartitionRemovableRecordKeyRefType ► System Partition Removable Record Key Reference Type          |
        |      ▪ (int)    varSysBranch_RefID ► System Branch Reference ID                                                          |
        |      ▪ (int)    varSysBaseCurrency_RefID ► System Base Currency Reference ID                                             |
        |      ▪ (int)    varTransactionTax_RefID ► Transaction Tax Reference ID                                                   |
        |      ▪ (int)    varTaxType_RefID ► Tax Type Reference ID                                                                 |
        |      ▪ (int)    varCurrency_RefID ► Currency Reference ID                                                                |
        |      ▪ (float)  varCurrencyValue ► Currency Value                                                                        |
        |      ▪ (int)    varBaseCurrency_RefID ► Base Currency Reference ID                                                       |
        |      ▪ (float)  varCurrencyExchangeRate ► Currency Exchange Rate                                                         |
        |      ▪ (string) varRemarks ► Remarks                                                                                     |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (array)  varReturn                                                                                                | 
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function setDataUpdate(
            $varUserSession, 
            int $varSysID, string $varSysDataAnnotation = null, int $varSysPartitionRemovableRecordKeyRefType = null, int $varSysBranch_RefID = null, int $varSysBaseCurrency_RefID = null,
            int $varTransactionTax_RefID = null, int $varTaxType_RefID = null, int $varCurrency_RefID = null, float $varCurrencyValue = null, float $varCurrencyExchangeRate = null, string $varRemarks = null)
            {
            $varReturn = \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getQueryExecution(
                $varUserSession, 
                \App\Helpers\ZhtHelper\Database\Helper_PostgreSQL::getBuildStringLiteral_StoredProcedure(
                    $varUserSession,
                    parent::getSchemaName($varUserSession).'.Func_'.parent::getTableName($varUserSession).'_SET',
                    [
                        [$varUserSession, 'bigint'],
                        [$varSysID, 'bigint'],
                        [$varSysDataAnnotation, 'varchar'],
                        [$varSysPartitionRemovableRecordKeyRefType, 'varchar'],
                        [$varSysBranch_RefID, 'bigint'],
                        [$varSysBaseCurrency_RefID, 'bigint'],

                        [$varTransactionTax_RefID, 'bigint'],
                        [$varTaxType_RefID, 'bigint'],
                        [$varCurrency_RefID, 'bigint'],
                        [$varCurrencyValue, 'numeric'],
                        [$varCurrencyExchangeRate, 'numeric'],
                        [$varRemarks, 'varchar']
                    ],
                    )
                );
            return $varReturn['Data'][0];
            }
        }
    }