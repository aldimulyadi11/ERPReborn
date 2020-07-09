<?php

/*
+----------------------------------------------------------------------------------------------------------------------------------+
| ▪ Category   : Laravel Helpers                                                                                                   |
| ▪ Name Space : \App\Helpers\ZhtHelper\General                                                                                    |
|                                                                                                                                  |
| ▪ Copyleft 🄯 2020 Zheta (teguhpjs@gmail.com)                                                                                     |
+----------------------------------------------------------------------------------------------------------------------------------+
*/
namespace App\Helpers\ZhtHelper\General
    {
    use Illuminate\Http\Request;
    
    /*
    +------------------------------------------------------------------------------------------------------------------------------+
    | ▪ Class Name  : File                                                                                                         |
    | ▪ Description : Menangani File dan Direktori                                                                                 |
    +------------------------------------------------------------------------------------------------------------------------------+
    */
    class File
        {
        private static $varNameSpace;
        
        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : init                                                                                                 |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2020-07-09                                                                                           |
        | ▪ Description     : Inisialisasi                                                                                         |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public static function init()
            {
            self::$varNameSpace=get_class();
            }

        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : getAutoMatchSystemFilePath                                                                           |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2020-07-09                                                                                           |
        | ▪ Description     : Mencari posisi file path varPostfix relatif terhadap varPrefix                                       |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (string) varPrefix ► Prefix Path                                                                                  |
        |      ▪ (string) varPostfix ► Postfix Path                                                                                |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (string) varPath                                                                                                  |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public static function getAutoMatchSystemFilePath($varPrefix, $varPostfix)
            {
            $varPath=$varPrefix.$varPostfix;
            if(is_file($varPath)==0)
                {
                for ($i=0; $i!=10; $i++)
                    {
                    if(is_file($varPrefix.'/.'.str_repeat("/..", $i).'/'.$varPostfix))
                        {
                        $varPath = $varPrefix.'/.'.str_repeat("/..", $i).'/'.$varPostfix;
                        break;
                        }
                    }
                }
            return $varPath;
            }

        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : getFileContent                                                                                       |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2020-07-09                                                                                           |
        | ▪ Description     : Mendapatkan isi suatu file berdasarkan path (varPath)                                                |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (string) varPath ► Path File                                                                                      |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (string) varFileContent                                                                                           |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public static function getFileContent($varPath)
            {
            if(is_file($varPath))
                {
                $varFileContent=file_get_contents($varPath);
                }
            return $varFileContent;
            }
        }
    }