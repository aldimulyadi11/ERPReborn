<?php

/*
+----------------------------------------------------------------------------------------------------------------------------------+
| ▪ Category   : Laravel Models                                                                                                    |
| ▪ Name Space : \App\Models\Database\SchData_OLTP_SupplyChain                                                                     |
|                                                                                                                                  |
| ▪ Copyleft 🄯 2024 Zheta (teguhpjs@gmail.com)                                                                                     |
+----------------------------------------------------------------------------------------------------------------------------------+
*/
namespace App\Models\Database\SchData_OLTP_SupplyChain
    {
    /*
    +------------------------------------------------------------------------------------------------------------------------------+
    | ▪ Class Name  : TblOrderPickingRequisitionDetail                                                                             |
    | ▪ Description : Menangani Models Database ► SchData-OLTP-SupplyChain ► TblOrderPickingRequisitionDetail                      |
    +------------------------------------------------------------------------------------------------------------------------------+
    */
    class TblOrderPickingRequisitionDetail extends \App\Models\Database\DefaultClassPrototype
        {
        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : __construct                                                                                          |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2024-01-02                                                                                           |
        | ▪ Creation Date   : 2024-01-02                                                                                           |
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
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2024-01-02                                                                                           |
        | ▪ Creation Date   : 2024-01-02                                                                                           |
        | ▪ Description     : Data Insert                                                                                          |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (string) varSysDataAnnotation ► System Data Annotation                                                            |
        |      ▪ (string) varSysPartitionRemovableRecordKeyRefType ► System Partition Removable Record Key Reference Type          |
        |      ▪ (int)    varSysBranch_RefID ► System Branch Reference ID                                                          |
        |      ▪ (int)    varSysBaseCurrency_RefID ► System Base Currency Reference ID                                             |
        |        ----------------------------------------                                                                          |
        |      ▪ (int)    varOrderPickingRequisition_RefID ► Order Picking Requisition Reference ID                                |
        |      ▪ (int)    varCombinedBudgetSectionDetail_RefID ► Combined Budget Section Detail Reference ID                       |
        |      ▪ (int)    varProduct_RefID ► Product Reference ID                                                                  |
        |      ▪ (float)  varQuantity ► Quantity                                                                                   |
        |      ▪ (int)    varQuantityUnit_RefID ► Quantity Unit Reference ID                                                       |
        |      ▪ (int)    varProductUnitPriceCurrency_RefID ► Product Unit Price Currency Reference ID                             |
        |      ▪ (float)  varProductUnitPriceCurrencyValue ► Product Unit Price Currency Value                                     |
        |      ▪ (float)  varProductUnitPriceCurrencyExchangeRate ► Product Unit Price Currency Exchange Rate                      |
        |      ▪ (string) varFulfillmentDeadlineDateTimeTZ ► Fulfillment Deadline DateTimeTZ                                       |
        |      ▪ (string) varRemarks ► Remarks                                                                                     |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (array)  varReturn                                                                                                | 
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function setDataInsert(
            $varUserSession, 
            string $varSysDataAnnotation = null, int $varSysPartitionRemovableRecordKeyRefType = null, int $varSysBranch_RefID = null, int $varSysBaseCurrency_RefID = null,
            int $varOrderPickingRequisition_RefID = null, int $varCombinedBudgetSectionDetail_RefID = null, int $varProduct_RefID = null, float $varQuantity = null, int $varQuantityUnit_RefID = null, int $varProductUnitPriceCurrency_RefID = null, float $varProductUnitPriceCurrencyValue = null, float $varProductUnitPriceCurrencyExchangeRate = null, string $varFulfillmentDeadlineDateTimeTZ = null, string $varRemarks = null)
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
                        
                        [$varOrderPickingRequisition_RefID, 'bigint'],
                        [$varCombinedBudgetSectionDetail_RefID, 'bigint'],
                        [$varProduct_RefID, 'bigint'],
                        [$varQuantity, 'numeric'],
                        [$varQuantityUnit_RefID, 'bigint'],
                        [$varProductUnitPriceCurrency_RefID, 'bigint'],
                        [$varProductUnitPriceCurrencyValue, 'numeric'],
                        [$varProductUnitPriceCurrencyExchangeRate, 'numeric'],
                        [$varFulfillmentDeadlineDateTimeTZ, 'timestamptz'],
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
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2024-01-02                                                                                           |
        | ▪ Creation Date   : 2024-01-02                                                                                           |
        | ▪ Description     : Data Update                                                                                          |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (int)    varSysID ► System Record ID                                                                              |
        |      ▪ (string) varSysDataAnnotation ► System Data Annotation                                                            |
        |      ▪ (string) varSysPartitionRemovableRecordKeyRefType ► System Partition Removable Record Key Reference Type          |
        |      ▪ (int)    varSysBranch_RefID ► System Branch Reference ID                                                          |
        |      ▪ (int)    varSysBaseCurrency_RefID ► System Base Currency Reference ID                                             |
        |        ----------------------------------------                                                                          |
        |      ▪ (int)    varOrderPickingRequisition_RefID ► Order Picking Requisition Reference ID                                |
        |      ▪ (int)    varCombinedBudgetSectionDetail_RefID ► Combined Budget Section Detail Reference ID                       |
        |      ▪ (int)    varProduct_RefID ► Product Reference ID                                                                  |
        |      ▪ (float)  varQuantity ► Quantity                                                                                   |
        |      ▪ (int)    varQuantityUnit_RefID ► Quantity Unit Reference ID                                                       |
        |      ▪ (int)    varProductUnitPriceCurrency_RefID ► Product Unit Price Currency Reference ID                             |
        |      ▪ (float)  varProductUnitPriceCurrencyValue ► Product Unit Price Currency Value                                     |
        |      ▪ (float)  varProductUnitPriceCurrencyExchangeRate ► Product Unit Price Currency Exchange Rate                      |
        |      ▪ (string) varFulfillmentDeadlineDateTimeTZ ► Fulfillment Deadline DateTimeTZ                                       |
        |      ▪ (string) varRemarks ► Remarks                                                                                     |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (array)  varReturn                                                                                                | 
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function setDataUpdate(
            $varUserSession, 
            int $varSysID, string $varSysDataAnnotation = null, int $varSysPartitionRemovableRecordKeyRefType = null, int $varSysBranch_RefID = null, int $varSysBaseCurrency_RefID = null,
            int $varOrderPickingRequisition_RefID = null, int $varCombinedBudgetSectionDetail_RefID = null, int $varProduct_RefID = null, float $varQuantity = null, int $varQuantityUnit_RefID = null, int $varProductUnitPriceCurrency_RefID = null, float $varProductUnitPriceCurrencyValue = null, float $varProductUnitPriceCurrencyExchangeRate = null, string $varFulfillmentDeadlineDateTimeTZ = null, string $varRemarks = null)
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
                        
                        [$varOrderPickingRequisition_RefID, 'bigint'],
                        [$varCombinedBudgetSectionDetail_RefID, 'bigint'],
                        [$varProduct_RefID, 'bigint'],
                        [$varQuantity, 'numeric'],
                        [$varQuantityUnit_RefID, 'bigint'],
                        [$varProductUnitPriceCurrency_RefID, 'bigint'],
                        [$varProductUnitPriceCurrencyValue, 'numeric'],
                        [$varProductUnitPriceCurrencyExchangeRate, 'numeric'],
                        [$varFulfillmentDeadlineDateTimeTZ, 'timestamptz'],
                        [$varRemarks, 'varchar']
                    ],
                    )
                );
            return $varReturn['Data'][0];
            }
        }
    }