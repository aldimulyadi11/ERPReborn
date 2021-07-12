<?php

namespace zhtSDK\Software\PDF\TCPDF
    {
    class zhtSDK extends \TCPDF
        {
        private $varUserSession;
        private $varTotalPages;
        private $varContentMargins;


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : __construct                                                                                          |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-07-08                                                                                           |
        | ▪ Description     : System's Default Constructor                                                                         |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function __construct()
            {
            $this->varTotalPages = -1;
            $this->zhtInitContentMargins();
            
            parent::__construct(__CLASS__);
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : AddPage (PARENT METHOD OVERIDE)                                                                      |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-07-12                                                                                           |
        | ▪ Description     : AddPage                                                                                              |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function AddPage($orientation='', $format='', $keepmargins=false, $tocpage=false) {
            $this->varTotalPages++;
            parent::AddPage($orientation, $format, $keepmargins, $tocpage);
            }

            
        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : Footer (PARENT METHOD OVERIDE)                                                                       |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-07-12                                                                                           |
        | ▪ Description     : Page Footer                                                                                          |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function Footer() 
            {
            //---> Line
            $this->SetY(-16);
            $varLineStyle = [
                'width' => 0.5, 
                'cap' => 'butt', 
                'join' => 'miter', 
                'dash' => 0, 
                'color' => [0, 0, 0]
                ];
            $this->Line(($this->getMargins()['left']), ($this->GetY()), $this->getPageWidth()-($this->getMargins()['right']), ($this->GetY()), $varLineStyle);

            //---> Document Number
            $this->SetY(-18);
            $varDocumentPageNumber = ('Page '.$this->getAliasNumPage().' of '.$this->getAliasNbPages());
            $this->SetFont('helvetica', 'I', 8);
            $this->Cell('', 10, $varDocumentPageNumber, 0, false, 'R', 0, '', 0, false, 'T', 'M');
            
            $varIssuedDateTime = \App\Helpers\ZhtHelper\General\Helper_DateTime::getCurrentDateTimeString($this->varUserSession['UserSessionID']);
            $varDocumentSignature = \App\Helpers\ZhtHelper\General\Helper_Hash::getMD5(
                $this->varUserSession['UserSessionID'],
                $this->varUserSession['UserSessionID'].\App\Helpers\ZhtHelper\System\Helper_Environment::getBackEndConfigEnvironment($this->varUserSession['UserSessionID'], 'TAG_DATA_SEPARATOR').$varIssuedDateTime
                 );
            //---> Document Signature
            $this->SetFont('helvetica', 'I', 8);
            $this->SetY(-18);
            $this->Cell(0, 10, 'Document Signature : '. $varDocumentSignature, 0, false, 'L', 0, '', 0, false, 'T', 'M');
            //---> Issued
            $this->SetY(-15);
            $this->Cell(0, 10, 'Issued date and time : '.$varIssuedDateTime , 0, false, 'L', 0, '', 0, false, 'T', 'M');
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : Header (PARENT METHOD OVERIDE)                                                                       |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-07-12                                                                                           |
        | ▪ Description     : Page Header                                                                                          |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function Header() {
            //---> Init Content Margins
            $this->zhtInitContentMargins();
            //---> Kop Dokumen
            if (($this->PageNo())==1)
                {
                $this->zhtSetLetterHead(
                    $this->varUserSession['UserSessionID'], 
                    getcwd().'/images/Logo/AppObject_InstitutionBranch/Small/'.$this->varUserSession['InstitutionBranch']['ID'].'.png',
                    'abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890'
                    );
                //---> Update Top Content Margins 
                $this->varContentMargins['top'] = ((int) ($this->GetY())) + 5;
                }
            else
                {
                //---> Update Top Content Margins 
                $this->varContentMargins['top'] = (int) $this->getMargins()['top'];              
                }
            //---> Background Image
            $this->zhtSetBackgroundImage($this->varUserSession['UserSessionID'], 50, getcwd().'/images/Logo/AppObject_InstitutionBranch/Large/'.$this->varUserSession['InstitutionBranch']['ID'].'.png');
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : zhtInitContentMargins                                                                                |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-07-12                                                                                           |
        | ▪ Description     : Fungsi untuk menginisialisasi Content Margins                                                        |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        private function zhtInitContentMargins()
            {
            $this->varContentMargins = [
                'top' => (int) $this->getMargins()['top'],
                'bottom' => (int) $this->getMargins()['bottom'],
                'right' => (int) $this->getMargins()['right'],
                'left' => (int) $this->getMargins()['left']
                ];            
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : zhtGetContentMargins                                                                                 |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-07-12                                                                                           |
        | ▪ Description     : Fungsi untuk mendapatkan Content Margins                                                             |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function zhtGetContentMargins($varUserSession)
            {
            //$this->SetXY($this->varContentMargins['left'], $this->varContentMargins['top']);
            //$this->Cell(0, 10, 'Top : '.$this->varContentMargins['top'].', Bottom : '.$this->varContentMargins['bottom'].', Left : '.$this->varContentMargins['left'].', Right : '.$this->varContentMargins['right']);
            return $this->varContentMargins;
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : zhtSetBackgroundImage                                                                                |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-07-12                                                                                           |
        | ▪ Description     : Fungsi Pengesetan QRCode                                                                             |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (int)    varDimension ► Dimension                                                                                 |
        |      ▪ (string) varPath_ImageFile ► Image File Path                                                                      |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function zhtSetBackgroundImage($varUserSession, int $varDimension = 50, string $varPath_ImageFile = null)
            {
            $this->SetAlpha(0.2);
            $this->Image($varPath_ImageFile, '', (($this->getPageHeight()-$varDimension)/2), '', $varDimension, 'PNG', '', 'T', false, 300, 'C', false, false, 0, false, false, false);           
            $this->SetAlpha(1);
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : zhtSetContentCoordinateStartPoint                                                                    |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-07-12                                                                                           |
        | ▪ Description     : Fungsi Pengesetan Koordinat Awal Content                                                             |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function zhtSetContentCoordinateStartPoint($varUserSession)
            {
            $this->SetXY(($this->zhtGetContentMargins($varUserSession))['left'], ($this->zhtGetContentMargins($varUserSession))['top']);            
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : zhtSetContent_SubTitle                                                                               |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-07-12                                                                                           |
        | ▪ Description     : Fungsi Pengesetan Sub Judul Content                                                                  |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (string) varTitle ► Title                                                                                         |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function zhtSetContent_SubTitle($varUserSession, string $varTitle = '')
            {
            $varCellHeight = 6;
            $this->SetFont('helvetica', 'B', 12);
            $this->Cell(0, $varCellHeight, $varTitle, 0, false, 'C');

            $this->SetXY(($this->zhtGetContentMargins($varUserSession))['left'], $this->GetY()+$varCellHeight);
            //$this->Cell(0, 10, $varTitle, 1, false, 'C');
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : zhtSetContent_Title                                                                                  |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-07-12                                                                                           |
        | ▪ Description     : Fungsi Pengesetan Judul Content                                                                      |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (string) varTitle ► Title                                                                                         |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function zhtSetContent_Title($varUserSession, string $varTitle = '')
            {
            $varCellHeight = 10;
            $this->zhtSetContentCoordinateStartPoint($varUserSession);
            $this->SetFont('helvetica', 'B', 22);
            $this->Cell(0, $varCellHeight, $varTitle, 0, false, 'C');

            $this->SetXY(($this->zhtGetContentMargins($varUserSession))['left'], $this->GetY()+$varCellHeight);
            //$this->Cell(0, 10, $varTitle, 1, false, 'C');
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : zhtSetLetterHead                                                                                     |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-07-12                                                                                           |
        | ▪ Description     : Fungsi Pengesetan QRCode                                                                             |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (string) varPath_ImageFile ► Image File Path                                                                      |
        |      ▪ (string) $varQRCodeData ► QR Code Data                                                                            |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function zhtSetLetterHead($varUserSession, string $varPath_ImageFile = null, string $varQRCodeData = null)
            {
            if(is_file($varPath_ImageFile))
                {
                $this->Image($varPath_ImageFile, '', ($this->getMargins()['left']), 30, '', '', '', '', false, 300);
                }

            $this->SetFont('helvetica', 'B', 10);
            $this->SetXY(($this->getMargins()['left']), 23);
            $this->Cell(0, 15, $this->varUserSession['InstitutionBranch']['Name'], 0, false, 'L', 0, '', 0, false, 'M', 'M');

            $this->SetXY(($this->getMargins()['left']), ($this->getY()+5));
            $this->SetFont('helvetica', '', 7);
            $this->MultiCell(150, '', $this->varUserSession['InstitutionBranch']['Address'], 0, '', 0, 1, '', '', true);
            $this->MultiCell(150, '', $this->varUserSession['InstitutionBranch']['Contact'], 0, '', 0, 1, '', '', true);
            $this->SetXY(($this->getMargins()['left']), ceil($this->GetY()));

            $this->zhtSetQRCode($this->varUserSession['UserSessionID'], 40, $varQRCodeData);

            $varLineStyle = [
                'width' => 0.5, 
                'cap' => 'butt', 
                'join' => 'miter', 
                'dash' => 0, 
                'color' => [0, 0, 0]
                ];
            $this->Line(($this->getMargins()['left']), ($this->GetY()+2), $this->getPageWidth()-($this->getMargins()['right']), ($this->GetY()+2), $varLineStyle);
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : zhtSetQRCode                                                                                         |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-07-12                                                                                           |
        | ▪ Description     : Fungsi Pengesetan QRCode                                                                             |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        |      ▪ (int)    varDimension ► Dimension                                                                                 |
        |      ▪ (string) varData ► Data                                                                                           |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function zhtSetQRCode($varUserSession, int $varDimension = 40, string $varData = null)
            {
            $varStyle = [
                'border' => 1,
                'vpadding' => 1, //'auto',
                'hpadding' => 1, //'auto',
                'fgcolor' => array(0,0,0),
                'bgcolor' => false, //array(255,255,255)
                'module_width' => 1, // width of a single module in points
                'module_height' => 1 // height of a single module in points
                ];
            $this->write2DBarcode($varData, 'QRCODE,Q', ($this->getPageWidth()-$varDimension), 10, $varDimension, $varDimension, $varStyle, 'N');
            }


        /*
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Method Name     : zhtSetUserSession                                                                                    |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Version         : 1.0000.0000000                                                                                       |
        | ▪ Last Update     : 2021-07-12                                                                                           |
        | ▪ Description     : Fungsi Pengesetan User Session                                                                       |
        +--------------------------------------------------------------------------------------------------------------------------+
        | ▪ Input Variable  :                                                                                                      |
        |      ▪ (mixed)  varUserSession ► User Session                                                                            |
        | ▪ Output Variable :                                                                                                      |
        |      ▪ (void)                                                                                                            |
        +--------------------------------------------------------------------------------------------------------------------------+
        */
        public function zhtSetUserSession($varUserSession)
            {
            $this->varUserSession = [
                'ApplicationID' => \App\Helpers\ZhtHelper\System\Helper_Environment::getLaravelEnvironment('APP_NAME'),
                'UserSessionID' => $varUserSession,
                'InstitutionBranch' => [
                    'ID' => (\App\Helpers\ZhtHelper\System\BackEnd\Helper_API::getUserLoginSessionEntityByAPIWebToken($varUserSession))['branchID'],
                    'Name' =>  'PT. QDC Technologies',
                    'Address' => 'Graha Sentra Mampang QDC, Jl. Mampang Prapatan Raya No. 28 Blok C Kelurahan Pela Mampang Kecamatan Mampang Prapatan Kota Jakarta Selatan 12790',
                    'Contact' => 'Telp : +62-21-79191234, Fax : +62-21-79193333'
                    ]
                ];
            $this->SetCreator(PDF_CREATOR);
            $this->SetAuthor($this->varUserSession['ApplicationID']);
            }
        }
    }