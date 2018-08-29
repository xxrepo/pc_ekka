Unit MainU;

Interface

Uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
     Menus, ExtCtrls, ComCtrls, StdCtrls, Util, Grids, DBGrids, StdActns,
     ActnList, DBActns, DB, Buttons, ADODB, Digits, ComObj, AdoInt, EKKAU, IniFiles,
     PrintReport, USBEject, IdMessage, IdBaseComponent, IdComponent, WinInet,
     IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, ClipBrd, ExecCommU, VCLUnZip,
     VCLZip, Jpeg, ShellApi, DBCtrls, Volume, DateUtils, Mask, IdPOP3, IdHTTP,
     IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, EncdDecd, SendReceiveXML,
     InvokeRegistry, SOAPHTTPClient, SOAPHTTPTrans;

Type TByteSet=Set of Byte;  // Тип множество Byte
     TCharSet=Set of Char;  // Тип множество символов

     TArtCode=Record
               Annot:Byte;
               ArtAdd:Byte;
               Recipt:Byte;
               Color:TColor;
              end;

     TGrafTime=Record
                tStart:Byte;
                tStMin:Byte;
                tEnd:Byte;
                tEndMin:Byte;
                Descr:String;
               end;

     TCardInfo=Record
                NumCard:Int64;
                F:String;
                I:String;
                O:String;
                Addr:String;
                DateR:String;
                ChName1:String;
                ChName2:String;
                ChName3:String;
                ChDateR1:String;
                ChDateR2:String;
                ChDateR3:String;
                EMail:String;
                Phone:String;
               end;

     TVozrForm=Record
                F:String;
                N:String;
                O:String;
                A:String;
                Pr:String;
                DateR:TDateTime;
                PaspD:TDateTime;
                PaspS:String;
                PaspN:String;
                PaspV:String;
                PaspT:String;
                Z:String;
                Summ:Currency;
                NumbChek:Int64;
               end;

     TFileOpt=Record               // Структура ini-файла
               SQLProvider:String;    // Провайдер SQL (начиная с SQL2005 он другой чем в 2000)
               Server:String;         // Имя сервера
               Base:String;           // Имя базы
               BaseUser:String;       // Имя пользователя базы данных
               BasePassw:String;      // Пароль базы данных
               Camera:Integer;        // Есть ли камера (1 - есть, 0 - нету)
               WebCamera:Integer;     // Есть ли web-камера (1 - есть, 0 - нету)
               KassaID:Integer;       // Номер кассы
               FlashPath:String;      // Путь выгрузки остатков
               TimeZ:TDateTime;       // Время Выдачи
               LoadNaklPath:String;   // Путь выгрузки накладных
               LogPath:String;        // Локальный путь для загрузки файлов
               ServerLogPath:String;  // Сетевой путь для загрузки файлов
               ServerWorkPath:String; //
               SMTPHost:String;       // Адрес почтового сервера
               SMTPPort:Integer;      // Порт по которому будет осуществляться подключение
               EMailAddress:String;   // Адрес электронной почты
               CHPName:String;        // Имя ЧП
               CHPIndN:String;        // Идентификационный код ЧП
               CHPAddr:String;        // Адрес ЧП
               PrintPort:String;      // Порт принтера для печати чеков ЧП
               ShowMCash:Boolean;     // Признак видимости окна сдачи
               ConStrMess:String;     // Строка подключения для сообщений в офис
               ShowRegFull:Boolean;   // Показывать / скрыть полки срок карантин
              end;

     TClOptions=Record             // Цветовые параметры
                 Order:TColor;        // Фон активной сортировки в справочнике
                 SklFon:TColor;       // Фон справочника
                 ChFon:TColor;        // Фон чека
                 CodeF:TColor;        // Цвет штрифта поля "Код"
                 NamesF:TColor;       // Цвет штрифта поля "Наименование"
                 OstatF:TColor;       // Цвет штрифта поля "Остаток"
                 CenaF:TColor;        // Цвет штрифта поля "Цена"
                 SklFS:Integer;       // Размер шрифта справочника
                 SklFN:String;        // Шрифт справочника
                 IndicFon:TColor;     // Фон индикатора суммы
                 IndicF:TColor;       // Цвет шрифта индикатора
                 IndicFSkd:TColor;    // Цвет шрифта индикатора со скидкой
                 MinSum:Real;         // Минимальная сумма для цифрового индикатора
                 IndicNoScanF:TColor; // Цвет шрифта индикатора неотсканированных
                 CashSumF:TColor;     // Цвет шрифта поля "Сумма сдачи"
                end;

     TPrParams=Record               // Параметры программы
                UserName:String;      // Имя пользователя
                Login:String;         // Логин пользователя
                Passw:String;         // Пароль пользователя
                UserID:Integer;       // ID пользователя
                ID_Gamma:Integer;     // ID пользователя в общем списке
                AptekaID:Integer;     // Номер аптеки
                AptekaNameUA:String;  // Название аптеки
                AptekaNameRU:String;  // Название аптеки на русском языке
                SkladAdress:String;   // Адрес склада
                AptName:String;       // Название аптеки для загрузки накладных
                UserRole:Integer;     // Права пользователя (может временно изменяться)
                SafeUserRole:Integer; // Копия прав пользователя (устанавливается один раз!!!)
                PrPath:String;        // Путь к программе
                OptFile:String;       // Главный ini-файл настроек
                Prof:String;          // Имя профиля в ини файле
                StartTime:String;     // Начальное время запрета ночных скидок
                EndTime:String;       // Конечное время запрета ночных скидок
                CR_BEGIN:String;      // Префикс основных дисконтных карточек
                ColorFile:String;     // Файл настроек цветовой палитры
                FirmID:Integer;       // ID фирмы из справочника SprFirms
                FirmNameRU:String;    // Название фирмы по русски
                FirmNameUA:String;    // Название фирмы по украински
                FullFirmNameRU:String;// Название фирмы по русски полностью
                Boss:String;          // Директор фирмы
                BossRod:String;       // Директор фирмы в родительном падеже
                NDS:Boolean;          // Если ли ндс или нет
                TimeZRep:String;      // Время снятия Z-отчета
                SumSkd:Real;          // Сумма чека необходимая для регистрации карточки
                SkdFirst:Boolean;     // Карточка с первой покупки или нет
                {Полный адрес аптеки}
                aObl:String;          // Область
                aRegion:String;       // Район
                aCity:String;         // Город
                aAdress:String;       // Адрес
                MediID:Integer;       // Код аптеки для MediCard
                ServerKompName:String;// Имя компьютера, который сервер
                RealizMinus:Boolean;  // Разрешить реализацию в минус
               end;

     TChekPos=Record   // Параметры позиции чека
               NumbChek:Integer;   // Номер чека
               TypeOplat:Integer;  // Тип оплаты 0 - наличные, 1 - безнал, 4-чп, 99 - возврат на склад
                                   // при записи в ArhCheks записывается значение TypeOplat+1 !!!
               Date:TDateTime;     // Дата
               Kol:Integer;        // Количество
               Kod_Name:Integer;   // Kod_Name
               Art_Code:Integer;   // Art_Code
               Cena:Real;          // Цена
               PSkd:Currency;      // % скидки
               Skd:Currency;       // % скидки позиции (временная переменная)
               Type_Skd:Integer;   // Тип скидки
               ArtName:String;     // Короткое наименование для ArhCheks и Номер накладной для Moves
               Type_Tov:Integer;   // Тип товара
               ID_User:Integer;    // ID пользователя
               ID_Kassa:Integer;   // № кассы
               NumCard:Int64;      // Номер дисконтной карточки
               IsReg:Boolean;      // Необходимост регичтрации карточки
               TypeCard:Integer;   // Тип дисконтной карточки
               SumSkd:Real;        // Сумма скидки на одну позицию
               F_NDS:Integer;      // F_NDS нужен для возвратов
               Priznak:Integer;    // Причина возврата
               BCard:String;       // Номер банковской карточки
               BFIO:String;        // Фамилия покупателя по банковской карточке
               BSkd:Real;          // Скидка для приватбанковских карточек
               TakedSum:Real;      // Сумма полученная от покупателя
               SumChek:Real;       // Сумма чека
               SumOplata:Real;     // Сумма чека
               Vzh:Int64;          // Заводской номер кассового аппарата
               VzDescr:String;     // Примечание для возвратов
               PrPayRecipt:Byte;   // Признак пробития/непробития рецептурных препаратов
               Iter:Byte;          // Номер прохода цикла
               NPrepChek:Integer;  // Номер предоплатного чека
               SPrepChek:Real;     // Сумма предоплатного чека
               SumSertif:Currency; // Сумма сертификата
               IdRes:Integer;      // ID брони
               Bonus:Real;         // Сумма бонуса
               BonusAll:Real;      // Сумма Бонусов
               NumCardRecipt:Int64;// Штрихкод на рецепте
               NumCardStretch:Int64; // Штрихкод стретч карты
               NumCardProf:Int64;  // Штрихкод карты профарма
               NumMediCard:Int64;  // Штрихкод карты Медикард
               NumMDMUCard:Int64;  // Штрихкод карты MDMU
              end;

     TFileOst=Record  // Параметры выгружаемого файла
               Num:Integer;
               Name:String;
               Descr:String;
               Requir:Boolean;
              end;

     TGroups=Array of TRadioButton; // Тип список типов товаров

     TThArhBase=class(TThread) // Поток для выгрузки базы и архивации базы
     private

     protected

       procedure Execute; override;

     end;

     TMainF=class(TForm) // Класс главной формы
       mmMain:TMainMenu;
       miFile:TMenuItem;
       miZakaz:TMenuItem;
       miUnloadFlash:TMenuItem;
       miSendMail:TMenuItem;
       miF2:TMenuItem;
       miExit:TMenuItem;
       miF1:TMenuItem;
       miNakl:TMenuItem;
       miHistory:TMenuItem;
       miService:TMenuItem;
       miArhBase: TMenuItem;
       miS2:TMenuItem;
       miCardInfo:TMenuItem;
       miS3:TMenuItem;
       miUsers:TMenuItem;
       miOptions:TMenuItem;
       miMoveMoney:TMenuItem;
       miZX:TMenuItem;
       miS4:TMenuItem;
       stMain:TStatusBar;
       pcMain:TPageControl;
       TabSale:TTabSheet;
       TabEKKA:TTabSheet;
       pnMainTop:TPanel;
       splMain:TSplitter;
       pnMainBottom:TPanel;
       pnGroup:TPanel;
       pnSklad:TPanel;
       dbgSklad:TDBGrid;
       alMain:TActionList;
       SetOrderArt_Code:TAction;
       SetOrderNames:TAction;
       SetGroup1:TAction;
       SetGroup2:TAction;
       SetGroup3:TAction;
       SetGroup4:TAction;
       SetGroup5:TAction;
       pnStatus:TPanel;
       pnControl:TPanel;
       lbSearch:TLabel;
       pnBottom:TPanel;
       cbBoxZero:TCheckBox;
       pnChek:TPanel;
       pnShowSumm:TPanel;
       dbgChek:TDBGrid;
       btnBack:TBitBtn;
       btnOChek:TBitBtn;
       btnCChek:TBitBtn;
       tmrFlushPassw:TTimer;
       pnIndicator:TPanel;
       ImIndicator:TImage;
       btnPayCash:TBitBtn;
       btnPayChek:TBitBtn;
       pmMain:TPopupMenu;
       miOpenChek:TMenuItem;
       miCloseChek:TMenuItem;
       miChek:TMenuItem;
       miCancelChek:TMenuItem;
       CloseChek:TAction;
       miBlockN:TMenuItem;
       miFixSkd:TMenuItem;
       miP1:TMenuItem;
       miCardSkd:TMenuItem;
       miP2:TMenuItem;
       miFindByName:TMenuItem;
       miFindByCode:TMenuItem;
       miFindEx:TMenuItem;
       lbChek:TStaticText;
       lbCheck:TLabel;
       bvSplit1:TBevel;
       bvSplit2:TBevel;
       pnCash:TPanel;
       sb1:TSpeedButton;
       sb2:TSpeedButton;
       sb5:TSpeedButton;
       sb10:TSpeedButton;
       sb20:TSpeedButton;
       sb200:TSpeedButton;
       sbClear:TSpeedButton;
       sb50:TSpeedButton;
       sb100:TSpeedButton;
       sb500:TSpeedButton;
       edCash:TEdit;
       lbOtPOkup:TLabel;
       imCash:TImage;
       lbSumCash:TStaticText;
       lbCash:TStaticText;
       pnLogEKKA:TPanel;
       cbEKKA:TCheckBox;
       meEKKA:TMemo;
       lbState:TLabel;
       miEAN13Info:TMenuItem;
       cbFind:TComboBox;
       miOptSum:TMenuItem;
       pnFlash:TPanel;
       lbAlertUnloadFlash:TLabel;
       pbUnLoad:TProgressBar;
       miUnloadBase:TMenuItem;
       miAddOtkaz:TMenuItem;
       pnUnBase:TPanel;
       lbAlertUnLoadBase:TLabel;
       btPrCennik:TBitBtn;
       miOtkaz:TMenuItem;
       miNoScan:TMenuItem;
       miATC1:TMenuItem;
       miP3:TMenuItem;
       miReports:TMenuItem;
       miPrintOst:TMenuItem;
       miLoad:TMenuItem;
       miRepRealiz:TMenuItem;
       miCheckDB:TMenuItem;
       miCheckOst:TMenuItem;
       miCheckSumZ:TMenuItem;
       miOper:TMenuItem;
       miPrev:TMenuItem;
       miBack:TMenuItem;
       SMTP:TIdSMTP;
       IdMessage:TIdMessage;
       btPrnChek:TBitBtn;
       btSumChek:TBitBtn;
       pmSkdList:TPopupMenu;
       miSkd2:TMenuItem;
       miSkd3:TMenuItem;
       miSkd4:TMenuItem;
       miSkd5:TMenuItem;
       miSkd6:TMenuItem;
       miSkd7:TMenuItem;
       miSkd10:TMenuItem;
       miSkd15:TMenuItem;
       miSkd20:TMenuItem;
       miSkdSplit:TMenuItem;
       miSkdOther:TMenuItem;
       miSumSkd:TMenuItem;
       sbOpenPort:TSpeedButton;
       sbClosePort:TSpeedButton;
       pnWrEKKA:TPanel;
       lbLogo:TLabel;
       edLogoEKKA:TEdit;
       sbPath:TSpeedButton;
       pnLogoEKKA:TPanel;
       imLogoEKKA:TImage;
       bbLoadLogo:TBitBtn;
       odLoad:TOpenDialog;
       pnInfoEKKA:TPanel;
       bbReadEKKA:TBitBtn;
       lbFactoryNum:TStaticText;
       lbRegNom:TStaticText;
       lbFirma:TStaticText;
       lbKassirIsReg:TStaticText;
       lbKeyPos:TStaticText;
       lbIsObnulen:TStaticText;
       lbNomerLastZ:TStaticText;
       lbNomberLastChek:TStaticText;
       lbFiskDate:TStaticText;
       lbFiskTime:TStaticText;
       stFiskTime:TStaticText;
       stFiskDate:TStaticText;
       stNomberLastChek:TStaticText;
       stNomerLastZ:TStaticText;
       stIsObnulen:TStaticText;
       stKeyPos:TStaticText;
       stKassirIsReg:TStaticText;
       stFirma:TStaticText;
       stRegNom:TStaticText;
       stFactoryNum:TStaticText;
       lbAptekaName:TLabel;
       miRepKassir:TMenuItem;
       miRep:TMenuItem;
       pnSkd:TPanel;
       sbFix:TSpeedButton;
       sbCard:TSpeedButton;
       lbSkdTit:TLabel;
       bvSkd:TBevel;
       lbSkidkaTit:TLabel;
       lbSumTit:TLabel;
       bvSumms:TBevel;
       lbNalTit:TLabel;
       lbAllTit:TLabel;
       lbPercSkd:TLabel;
       bvInfoSkd:TBevel;
       lbDSkdTit:TLabel;
       lbNCard:TLabel;
       lbIndNal:TLabel;
       lbIndSkd:TLabel;
       lbIndAll:TLabel;
       lbPrSkd:TLabel;
       lbNCrd:TLabel;
       lbPerc1:TLabel;
       lbPerc2:TLabel;
       sbSumm:TSpeedButton;
       cbFixSkd:TComboBox;
       stPercSkd:TStaticText;
       tmpButton: TButton;
       CopyData:TAction;
       tmWaitComm:TTimer;
       miIncomeBlanks:TMenuItem;
       imEKKA:TImage;
       lbVersion:TStaticText;
       lbMoney:TStaticText;
       stMoney:TStaticText;
       stDtVersion:TStaticText;
       stVersion:TStaticText;
       lbDtVersion:TStaticText;
       pnEditEKKA:TPanel;
       bbServLim:TBitBtn;
       edKolStr:TEdit;
       lbNumStr:TLabel;
       lbNumDay:TLabel;
       edKolDay:TEdit;
       bvServLim:TBevel;
       bbTermEKKA:TBitBtn;
       lbNumCard50:TLabel;
       miAnnot:TMenuItem;
       imAnnot:TImage;
       tmrWaitMess:TTimer;
       miEditReg:TMenuItem;
       miLT:TMenuItem;
       miLTJ:TMenuItem;
       miTable:TMenuItem;
       miCancelV:TMenuItem;
       lbCountCards:TLabel;
       miObnov:TMenuItem;
       miPeresort:TMenuItem;
       miFNDS1:TMenuItem;
       miFNDS2:TMenuItem;
       miCheckBase:TMenuItem;
       edKassaTxt:TEdit;
       btReadTxt:TButton;
       lbHistory:TLabel;
       imHistory:TImage;
       miReg:TMenuItem;
       miPeresortPereuchet:TMenuItem;
       miKolProd:TMenuItem;
       miVozvrPis:TMenuItem;
       tmWaitMessOffice:TTimer;
       tmFlash:TTimer;
       imFlashMail:TImage;
       bbForceCloseCash:TBitBtn;
       bbForceCloseChek:TBitBtn;
       miJReoc:TMenuItem;
       miFNDS3:TMenuItem;
       miFNDS4:TMenuItem;
       miUpdate:TMenuItem;
       acK1:TAction;
       miSendMess:TMenuItem;
       lbNewMess:TLabel;
       imNoScan:TImage;
       imRecipt:TImage;
       acNEKKA:TAction;
       miSpec:TMenuItem;
       miKRO:TMenuItem;
       miChekKurier:TMenuItem;
       miZero:TMenuItem;
       miRepAlf:TMenuItem;
       miRepReg:TMenuItem;
       miMoveTov:TMenuItem;
       miInv:TMenuItem;
       tmpButton2:TButton;
       miShowMCash:TMenuItem;
       tmChek:TButton;
       miNewNameOtkaz:TMenuItem;
       miTerap:TMenuItem;
       miUnloadRealiz:TMenuItem;
       miNoTov:TMenuItem;
       sbProf:TSpeedButton;
       miCenaUp:TMenuItem;
       miScanBox:TMenuItem;
       miObnDate: TMenuItem;
       miNDS1: TMenuItem;
       miNDS2: TMenuItem;
       miNDS3: TMenuItem;
       miNDS4: TMenuItem;
       miPrepChek: TMenuItem;
    N2: TMenuItem;
       bbReserve: TBitBtn;
    N5: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
       miPredst: TMenuItem;
       miPredstKRO: TMenuItem;
       btnSetStr: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
       btnReadStr: TBitBtn;
       edFN:TEdit;
       edPN:TEdit;
       edID:TEdit;
       edHead:TEdit;
       edStr1:TEdit;
       edStr2:TEdit;
       edStr3:TEdit;
       edStr4:TEdit;
       sbBSkd:TSpeedButton;
       sbMag:TSpeedButton;
       sbRecipt:TSpeedButton;
       miSktretchChek:TMenuItem;
    N8: TMenuItem;
       tmrUpdateVersion:TTimer;
       miBackToSklad: TMenuItem;
       imAvto: TImage;
       miProfarma: TMenuItem;
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
       sbMediCard:TSpeedButton;
    N1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
       pnPercShow:TPanel;
       lbPercShow:TLabel;
       upPercShow:TUpDown;
       edPercShow:TEdit;
       miForProvis:TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
       HTTPRR:THTTPReqResp;
       sbMDMU:TSpeedButton;
       miHotKeyInfo:TMenuItem;
       lbMB:TLabel;
       lbMBInfo:TLabel;
    Timer1: TTimer;
    N14: TMenuItem;
       sbGoldG:TSpeedButton;
    N15: TMenuItem;
    N16: TMenuItem;
    miLTM: TMenuItem;
    miPilot: TMenuItem;
    EKKA1: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    sbMDMU1: TSpeedButton;
    MDMU1: TMenuItem;
    imMB: TImage;
    CheckBox1: TCheckBox;
    Bevel1: TBevel;
    pn1: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Panel2: TPanel;

       procedure FormActivate(Sender:TObject);
       procedure miUsersClick(Sender:TObject);
       procedure FormCreate(Sender:TObject);
       procedure miExitClick(Sender:TObject);
       procedure FormResize(Sender:TObject);
       procedure RbGroupClick(Sender:TObject);
       procedure cbBoxZeroClick(Sender:TObject);
       procedure pcMainChange(Sender:TObject);
       procedure SetOrderArt_CodeExecute(Sender:TObject);
       procedure SetOrderNamesExecute(Sender:TObject);
       procedure SetGroup1Execute(Sender:TObject);
       procedure SetGroup2Execute(Sender:TObject);
       procedure SetGroup3Execute(Sender:TObject);
       procedure SetGroup4Execute(Sender:TObject);
       procedure SetGroup5Execute(Sender:TObject);
       procedure dbgSkladKeyPress(Sender:TObject; var Key:Char);
       procedure dbgSkladKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
       procedure btnOChekClick(Sender:TObject);
       procedure btnCChekClick(Sender:TObject);
       procedure dbgSkladDblClick(Sender:TObject);
       procedure tmrFlushPasswTimer(Sender:TObject);
       procedure FormClose(Sender:TObject; var Action:TCloseAction);
       procedure sbFixClick(Sender:TObject);
       procedure sbCardClick(Sender:TObject);
       procedure cbFixSkdChange(Sender:TObject);
       procedure dbgChekKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
       procedure dbgChekDblClick(Sender:TObject);
       procedure cbEKKAClick(Sender:TObject);
       procedure miOpenChekClick(Sender:TObject);
       procedure miCancelChekClick(Sender:TObject);
       procedure miCloseChekClick(Sender:TObject);
       procedure miChekClick(Sender:TObject);
       procedure dbgSkladDrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
       procedure dbgChekDrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
       procedure CloseChekExecute(Sender:TObject);
       procedure miBlockNClick(Sender:TObject);
       procedure miFixSkdClick(Sender:TObject);
       procedure miCardSkdClick(Sender:TObject);
       procedure miOptionsClick(Sender:TObject);
       procedure miMoveTovClick(Sender:TObject);
       procedure miCheckOstClick(Sender:TObject);
       procedure dbgSkladTitleClick(Column: TColumn);
       procedure dbgChekKeyPress(Sender:TObject; var Key:Char);
       procedure edCashChange(Sender:TObject);
       procedure edCashKeyPress(Sender:TObject; var Key:Char);
       procedure sb1Click(Sender:TObject);
       procedure sbClearClick(Sender:TObject);
       procedure miZXClick(Sender:TObject);
       procedure miEAN13InfoClick(Sender:TObject);
       procedure miUnloadFlashClick(Sender:TObject);
       procedure miCheckSumZClick(Sender:TObject);
       procedure miHistoryClick(Sender:TObject);
       procedure cbFindCloseUp(Sender:TObject);
       procedure cbFindEnter(Sender:TObject);
       procedure cbFindExit(Sender:TObject);
       procedure cbFindKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
       procedure miFindExClick(Sender:TObject);
       procedure miOptSumClick(Sender:TObject);
       procedure miUnloadBaseClick(Sender:TObject);
       procedure miZakazClick(Sender:TObject);
       procedure miAddOtkazClick(Sender:TObject);
       procedure miMoveMoneyClick(Sender:TObject);
       procedure miCardInfoClick(Sender:TObject);
       procedure btPrCennikClick(Sender:TObject);
       procedure miOtkazClick(Sender:TObject);
       procedure miNoScanClick(Sender:TObject);
       procedure miATC1Click(Sender:TObject);
       procedure miPrintOstClick(Sender:TObject);
       procedure miLoadClick(Sender:TObject);
       procedure miRepRealizClick(Sender:TObject);
       procedure miPrevClick(Sender:TObject);
       procedure miBackClick(Sender:TObject);
       procedure miSendMailClick(Sender:TObject);
       procedure sbSummClick(Sender:TObject);
       procedure btPrnChekClick(Sender:TObject);
       procedure btSumChekClick(Sender:TObject);
       procedure miSkd2Click(Sender:TObject);
       procedure miSkdOtherClick(Sender:TObject);
       procedure miSumSkdClick(Sender:TObject);
       procedure sbClosePortClick(Sender:TObject);
       procedure sbOpenPortClick(Sender:TObject);
       procedure sbPathClick(Sender:TObject);
       procedure bbLoadLogoClick(Sender:TObject);
       procedure tmpButtonClick(Sender:TObject);
       procedure bbReadEKKAClick(Sender:TObject);
       procedure miRepKassirClick(Sender:TObject);
       procedure miRepClick(Sender:TObject);
       procedure FormDestroy(Sender:TObject);
       procedure CopyDataExecute(Sender:TObject);
       procedure tmWaitCommTimer(Sender:TObject);
       procedure miIncomeBlanksClick(Sender:TObject);
       procedure bbServLimClick(Sender:TObject);
       procedure edKolStrKeyPress(Sender:TObject; var Key:Char);
       procedure bbTermEKKAClick(Sender:TObject);
       procedure miArhBaseClick(Sender:TObject);
       procedure miAnnotClick(Sender:TObject);
       procedure tmrWaitMessTimer(Sender:TObject);
       procedure lbHistoryMouseLeave(Sender:TObject);
       procedure lbHistoryMouseEnter(Sender:TObject);
       procedure miEditRegClick(Sender:TObject);
       procedure lbHistoryClick(Sender:TObject);
       procedure miLTClick(Sender:TObject);
       procedure miLTJClick(Sender:TObject);
       procedure miTableClick(Sender:TObject);
       procedure miCancelVClick(Sender:TObject);
       procedure miPeresortClick(Sender:TObject);
       procedure miFNDS1Click(Sender:TObject);
       procedure miCheckBaseClick(Sender:TObject);
       procedure miRegClick(Sender:TObject);
       procedure miPeresortPereuchetClick(Sender: TObject);
       procedure miKolProdClick(Sender: TObject);
       procedure btReadTxtClick(Sender: TObject);
       procedure FormShow(Sender: TObject);
       procedure miVozvrPisClick(Sender: TObject);
       procedure imHistoryDblClick(Sender: TObject);
       procedure tmWaitMessOfficeTimer(Sender: TObject);
       procedure tmFlashTimer(Sender: TObject);
       procedure bbForceCloseCashClick(Sender:TObject);
       procedure bbForceCloseChekClick(Sender:TObject);
       procedure CheckBox1Click(Sender: TObject);
       procedure miJReocClick(Sender: TObject);
       procedure miUpdateClick(Sender: TObject);
       procedure acK1Execute(Sender: TObject);
       procedure miSendMessClick(Sender: TObject);
       procedure lbNewMessMouseEnter(Sender: TObject);
       procedure lbNewMessMouseLeave(Sender: TObject);
       procedure lbNewMessClick(Sender: TObject);
       procedure tmpButton2Click(Sender: TObject);
       procedure acNEKKAExecute(Sender: TObject);
       procedure miSpecClick(Sender: TObject);
       procedure miKROClick(Sender: TObject);
       procedure miChekKurierClick(Sender: TObject);
       procedure miRepAlfClick(Sender: TObject);
       procedure miInvClick(Sender: TObject);
       procedure miShowMCashClick(Sender: TObject);
       procedure tmChekClick(Sender: TObject);
       procedure miTerapClick(Sender: TObject);
       procedure miUnloadRealizClick(Sender: TObject);
       procedure miNoTovClick(Sender: TObject);
       procedure sbProfClick(Sender: TObject);
       procedure miCenaUpClick(Sender: TObject);
       procedure miScanBoxClick(Sender: TObject);
       procedure miNDS1Click(Sender: TObject);
       procedure miPrepChekClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
       procedure bbReserveClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
       procedure miPredstClick(Sender: TObject);
       procedure miPredstKROClick(Sender: TObject);
       procedure btnReadStrClick(Sender: TObject);
       procedure btnSetStrClick(Sender: TObject);
       procedure sbMagClick(Sender: TObject);
       procedure sbReciptClick(Sender: TObject);
       procedure miSktretchChekClick(Sender: TObject);
       procedure tmrUpdateVersionTimer(Sender: TObject);
       procedure miBackToSkladClick(Sender: TObject);
       procedure miProfarmaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
       procedure sbMediCardClick(Sender:TObject);
    procedure N1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
       procedure edPercShowChange(Sender:TObject);
    procedure N9Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
       procedure sbMDMUClick(Sender: TObject);
       procedure miHotKeyInfoClick(Sender:TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N14Click(Sender: TObject);
       procedure sbBSkdClick(Sender:TObject);
       procedure sbGoldGClick(Sender:TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
       procedure miLTMClick(Sender: TObject);
       procedure miPilotClick(Sender: TObject);
       procedure EKKA1Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure MDMU1Click(Sender: TObject);

     private

       FEx:Boolean;
       FGroups:TGroups;
       FGroupIndex:Integer;
       FSprOrder:Integer;
       FChekOpened:Boolean;
       FIsCHP:Boolean;
       FType_Skd:Integer;
       FPercentSkd:Real;
       FSumSkd:Real;          // Сумма скидки по чеку
       FSumChek:Real;         // Сумма чека БЕЗ скидки
       FNumCard:Int64;
       FTypeCard:Integer;
       FChangeUser:Boolean;
       FLastError:String;
       FPayCount:Integer;
       FPayWork:Boolean;
       FChpChek:TStringList;
       FFlagW:Boolean;
       FCanExecCom:Boolean;
       FApplDateTime:TDateTime;
       FIP:String;
       FDesign:Boolean;
       FMistake:Boolean;
       FMistakes:TByteSet;
       FChekEmpty:Boolean;
       FArtCh:Byte;
       FNonClosed:Boolean;
       FIsStart:Boolean;
       FUseEKKASafe:Boolean;
       FIsSkdDop:Boolean;
       FTypeChek:Integer;
       FIsFozzy:Boolean;
       FIsDop7:Boolean;
       FIsFirstShowMess:Boolean;
       FNPChek:Integer;
       FSumPChek:Real;
       FSumSertif:Currency;
       FSumMomBaby:Currency;
       FMedName:String;
       FIDRES:Integer;
       FIsRegCard:Boolean;
       FNumCardMag:Int64;
       FNumCardProf:Int64;
       FNumMediCard:Int64;
       FNumMDMUCard:Int64;
       FNumCardRecipt:Int64;
       FNumCardStretch:Int64;
       FIsOneRegCard:Boolean;
       FIsDay:Boolean;
       FForReserve:Boolean;
       FSkdCalced:Boolean;
       FEnterKol:Boolean;
       mVF:TVozrForm;
       MDMU221TypeCard:Byte;

       procedure AppMessage(var Msg:TMsg; var Handled:Boolean);
       procedure InitChek;
       procedure InitFixSkd;
       procedure InitEKKA;
       procedure SetOrder(V:Integer);
       procedure SetType_Tov(V:Integer);
       procedure RefreshChek;
       procedure SetVisWhenChekOpened(V:Boolean);
       procedure OpenChek;
       procedure CancelChek(P:Byte=0);
       procedure ClearChekFull(Param:Integer);
       procedure PrevEnterKol(Param:Integer; IsFirstRec:Byte=0);
       procedure PrevDelKol;
       procedure SetIsCHP;
       procedure ReopenChek;
       procedure SetSumSkd(V:Real);
       procedure SetSumChek(V:Real);
       procedure SetType_Skd(V:Integer);
       procedure SetNumCard(V:Int64);
       procedure SwitchSkd(sb,mi:TObject);
       procedure ClearGroups(FGroups:TGroups);
       procedure StartCamera(Param:Integer);
       procedure EscFind;
       procedure UnLoadToFlash(P:Integer);
       procedure InitGroupsMain;
       procedure PrepareBase;
       procedure InitColors;
       procedure InitPanels;
       procedure ForceUnLoadAll;
       procedure CopyArh(Path:String);
       procedure SetPercentSkd(V:Real);
       procedure InitFields;
       procedure InitFonts;
       procedure ShowPKUInfo(Art_Code:Integer; P:Byte=0);
       procedure UnLoadArhBase;
       procedure ExecCommand(Comm:String);
       procedure InitAnnotList;
       procedure InitIP;
       procedure SetVolume;
       procedure SetMistake(const Value:Boolean);
       procedure CopyTextLog(Path:String);
       procedure MakePeresort(P:Byte);
       procedure InitScripts;
       procedure GetNumCardDialog(var NumCard:Int64; var TypeCard:Integer);
       procedure CheckTimeZRep;
       procedure SetSkdMag(Sender:TObject; B:Boolean);
       procedure UpdateVersion;
       procedure PrintTodayZeroRep(P:Byte);
       procedure SetMediCardSkd;
       procedure MediSendRealiz(CP:TChekPos);
       procedure PrintBlankForRegCard(NumCard:Int64; FIO,DateR:String);
       procedure PrintBlankForRegMBCard(CR:TCardInfo);

       function  GetSumChekFull:Real;
       function  CheckStrNum(S:String):Boolean;
       function  CheckScan(var Pers:String):Boolean;
       function  UnLoadFile(P:Integer; Path:String):Boolean;
       function  CheckUnLoad(Path:String):String;
       function  GetBonusPerc(NC:Int64):Real;
       function  GetVzhNum:Int64;
       function  GetPercentSkd:Real;
       function  GetBaseCHP:Boolean;
       function  GetBaseFileName:String;
       function  CheckNightSkdTime:Boolean;
       function  GetBegPeriod:TDateTime;
       function  GetEndPeriod:TDateTime;
       function  CheckOnlyRecipt(Art_Code:Integer; Names:String; Kol:Integer):Boolean;
       function  CheckKolUpak(Kol:Integer; var S:String):Boolean;
       function  GetIsKiosk:Boolean;
       function  GetKolArtAdd(Art_Code:Integer; var KolAdd,ArtAdd:Integer; P:Integer=0):Boolean;
       function  GetPercForPrice:Byte;
       function  UnLoadFor271(D1,D2:TDateTime; Path:String):String;
       function  IsCanRegMomBabyCard:Boolean;
       function  IsMomBabyCard(NumCard: Int64): Boolean;
       function  MDMUCheckLogin:Boolean;
       function  PayChek(TypeOplat:Integer):Boolean;
       function  CheckTypeMDMU:Integer;
       function  GetMDMSkd(AC:Integer; Upak:Integer; Kol,Cena:Currency):Real;
       function  MDMUSendRealiz(CP:TChekPos):Boolean;

     public

       FArtCodeList:Array of TArtCode;
       FIsChSeria:Boolean;

       procedure FilterSklad;                     // Показ товаров из справочника в зависимости от типа и сортировки
       procedure ShowIndicator(Sum:Currency);     // Показ суммы кристалическим шрифтом
       procedure ShowStatus(S:String); overload;  // Показ текста в строке статус в ячейке 3
       procedure ShowStatus(S:String; N:Integer); overload; // Показ текста в строке статус в указанной ячейке
       procedure dbGKeyPress(db:TDBGrid; var Key:Char; var sSr:String; Order,P,Kol:Integer;  var IsFind:Boolean);
       procedure SendMail;
       procedure ShowErrorEKKA(Res:Boolean);
       procedure UnLoadFiles(Path:String);
       procedure ShowEAN13(Source:TDataSet);
       procedure ShowCountCards;
       procedure ClearChekOnly(UserID:Integer);
       procedure PrintObnov(F_NDS:Integer; Gr:Integer=-1; dtDate:TDateTime=0);
       procedure PrintObnovDate(F_NDS:Integer);

       function  FindEAN13(db:TDBGrid; EAN13:String; P,Kol:Integer; var IsFind:Boolean):String;

       function  InitGroups(var FGroups:TGroups; pnGroup:TWinControl; P:Integer):Boolean;
       function  MessBox(Mes:String; Btn:Integer):Integer; overload;
       function  MessBox(Mes:String):Integer; overload;

       function  IsPermit(S:TByteSet; Param:Byte):Boolean; overload;
       function  IsPermit(S:TByteSet; Mes:String; Param:Byte):Boolean; overload;

       function  WriteToIni(FName:String; F:String; V:Variant):Boolean; overload;
       function  WriteToIni(F:String; V:Variant):Boolean; overload;

       function  ReadFromIni(FName:String; F,Def:String):String; overload;
       function  ReadFromIni(F,Def:String):String; overload;

       function  RBClick(Sender:TObject; FGr:TGroups):Integer;
       function  GetKolFromDialog(Nm:String; DefKol:Integer; var Art_Code:Integer; P:Byte; Koef:Integer=0; Upak:Integer=0):Integer;
       function  CheckLimitSkd(Nm:Int64):Boolean;
       function  CheckPassword(Psw:String):Boolean;
       function  GetPasswRep:String;

       property  Ex:Boolean read FEx write FEx;
       property  GroupIndex:Integer read FGroupIndex;            // Тип товара
       property  SprOrder:Integer read FSprOrder write SetOrder; // Режим сортировки справочника товаров
       property  ChekOpened:Boolean read FChekOpened;
       property  IsCHP:Boolean read FIsCHP;                      // Тип товара в открытом чеке
       property  Type_Skd:Integer read FType_Skd write SetType_Skd;
       property  PercentSkd:Real read GetPercentSkd write SetPercentSkd;
       property  SumSkd:Real read FSumSkd write SetSumSkd;
       property  SumChek:Real read FSumChek write SetSumChek;
       property  SumChekFull:Real read GetSumChekFull;
       property  NumCard:Int64 read FNumCard write SetNumCard;
       property  TypeCard:Integer read FTypeCard write FTypeCard;
       property  LastError:String read FLastError write FLastError;
       property  VzhNum:Int64 read GetVzhNum;
       property  PayCount:Integer read FPayCount write FPayCount;
       property  BaseCHP:Boolean read GetBaseCHP;
       property  CHPChek:TStringList read FCHPChek write FCHPChek;
       property  FlagW:Boolean read FFlagW write FFlagW;
       property  BaseFileName:String read GetBaseFileName;
       property  IP:String read FIP;
       property  Design:Boolean read FDesign;
       property  Mistake:Boolean read FMistake write SetMistake;
       property  Mistakes:TByteSet read FMistakes;
       property  BegPeriod:TDateTime read GetBegPeriod;
       property  EndPeriod:TDateTime read GetEndPeriod;
       property  ChekEmpty:Boolean read FChekEmpty write FChekEmpty;
       property  ArtCh:Byte read FArtCh write FArtCh;
       property  UseEKKASafe:Boolean read FUseEKKASafe;
       property  IsSkdDop:Boolean read FIsSkdDop;
       property  TypeChek:Integer read FTypeChek write FTypeChek;
       property  IsFozzy:Boolean read FIsFozzy write FIsFozzy;
       property  IsDop7:Boolean read FIsDop7 write FIsDop7;
       property  IsKiosk:Boolean read GetIsKiosk;
       property  IsChSeria:Boolean read FIsChSeria write FIsChSeria;
       property  PercForPrice:Byte read GetPercForPrice;
       property  NumCardMag:Int64 read FNumCardMag write FNumCardMag;
       property  NumCardProf:Int64 read FNumCardProf write FNumCardProf;
       property  NumCardRecipt:Int64 read FNumCardRecipt write FNumCardRecipt;
       property  NumCardStretch:Int64 read FNumCardStretch write FNumCardStretch;
       property  NumMediCard:Int64 read FNumMediCard write FNumMediCard;
       property  NumMDMUCard:Int64 read FNumMDMUCard write FNumMDMUCard;
       property  IsRegCard:Boolean read FIsRegCard write FIsRegCard;
       property  IsDay:Boolean read FIsDay write FIsDay;
       property  ForReserve:Boolean read FForReserve write FForReserve;

     end;

Const MFC='Регистрация продаж';  // Надпись на главном окне

      ER_CR_FORM='Ошибка создания окна!';

      { --- Права пользователей --- }
      R_ADMIN=0;  // права Администратора
      R_KASSIR=1; // права Кассира
      R_PROVIZ=2; // права Провизора
      R_DISP=3;   // права Диспетчера (для Курьера)
      R_SUPER=4;  // права Заведующей
      R_OPER=5;   // парва Каптерщика (запрещено пробивать чеки)

      { --- Признаки проверки прав пользователей --- }
      P_ALERT=0;  // вывести сообщение
      P_SILENT=1; // не выводить сообщение

      { --- Признаки сортировки справочника товаров --- }
      O_ART_CODE=0; // поиск по Art_Code
      O_NAMES=1;    // поиск по Names

      CH_ANSI=['Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J','K','L','Z',
               'X','C','V','B','N','M','q','w','e','r','t','y','u','i','o','p','a','s','d','f',
               'g','h','j','k','l','z','x','c','v','b','n','m','-','_',' ',',','.','\','"','Й',
               'Ц','У','К','Е','Н','Г','Ш','Щ','З','Х','Ъ','Ф','Ы','В','А','П','Р','О','Л','Д',
               'Ж','Э','Я','Ч','С','М','И','Т','Ь','Б','Ю','Ё','й','ц','у','к','е','н','г','ш',
               'щ','з','х','ъ','ф','ы','в','а','п','р','о','л','д','ж','э','я','ч','с','м','и',
               'т','ь','б','ю','ё','0','1','2','3','4','5','6','7','8','9'];

      CH_DIGIT=['0'..'9']; // Цифровые символы

      K_ARROW_KEYS=[37,38,39,40,13]; // Коды стрелок курсора

      // !!!!!!!!! НЕ МЕНЯТЬ ЗНАЧЕНИЯ ЭТИХ КОНСТАНТ !!!!!!!!!!!!!!!!!!!!!
      EK_DIALOG=0; // Ввод товара через диалог
      EK_SCAN=1;   // Ввод через сканер штрих кодов
      EK_CHEK=2;   // Изменение количества в чеке

      F_NDS_CHP=[4,3]; // Признаки F_NDS ЧП-шного товара

      { --- Цвет индикатора суммы ---}
      CL_GREEN=clLime;   // Цвет индикатора без скидки
      CL_RED=$0000ECFF;  // Цвет индикатора со скидкой

      { --- Режимы скидок ---}
      SK_NONE=0;   // Режим без скидок
      SK_SUMM=1;   // Суммовая скидка
      SK_FIX= 2;   // Режим фиксированной скидки
      SK_CARD=4;   // Режим скидок по карточкам
      SK_DRCARD=5; // Режим скидок по Леди-кард
      SK_ORANGE=6; // Оранж кард

      { --- Признаки пробития чеков ---}
      NO_ERROR=-1;  // Нет ошибок
      SH_CANC=10;   // Сдвиг-признак отмены чека
      TO_CASH=0;    // Оплата наличными
      TO_CHEK=1;    // Оплата по безналу
      TO_CHP=4;     // Оплата ЧП
      TO_BACK=99;   // Возврат на склад

      {--- Признаки отмена чека ---}
      CC_CANCEL=0; // Полная отмена чека
      CC_END=1;    // Завершение чека (при оплате, возврате)

      {--- Признаки накладных ---}
      DC_INCOME=1; // Признак приходных накладных
      DC_BACK=2;   // Признак возвратных накладных

      MAX_NUMCARD=10000000; // Максимальный номер для "Зеленых" карточек

      { --- Организация поиска в различныз DBGrid ---}
      SC_SKLAD=1;  // В главном справочнике товара
      SC_CHEK=2;   // В Чеке
      SC_FIND=3;   // Просто поиск в DBGrid
      SC_SCNAKL=4; // Сканирование накладных
      SC_TMPSPIS=5;// Сканирование возвратов

      { --- Управление камерой --- }
      CM_START=270; // Старт записи
      CM_STOP=271;  // Остановка записи

      { --- Пареметры выгрузки информации на флешку --- }
      UN_ARHO=0; // Выгрузка файлов реализации остатков
      UN_BASE=1; // Выгрузка всей базы

      { --- Переменные для инициализации групп товаров --- }
      GR_ZAKAZ=1; // Если группы для Заявки
      GR_MAIN=2;  // Если группы для Главного справочника товаров

      { --- Режим пробития сумм по ЕККА ---}
      SM_OPT=1;  // Пробитие оптовой сумму
      SM_PREP=2; // Пробитие предоплаты

      { --- Префиксы дисконтных карт --- }
      CR_911  ='911';  // 'Спец.' карточки (5% на старте, а дальше по накопительной)
      CR_STUD ='3597'; // Студенческие карточки (5% на старте, а дальше по накопительной)
      CR_BEGDR='255';  // Карточки врачей
//      CR_NAKLOF='277'; // Карточки врачей Наклофен
      CR_BIOSTR='288'; // Карточки врачей Биострепта
      CR_KARAV='29';   // Карточки супермаркета Караван
      CR_ORANG='88';   // Оранж кард
      CR_DAFI='029';   // Карточки на Дафи
      CR_271='99';     // Карточки для 271 аптек
      CR_DOCT1='231';  // Карточки врачей 10% на все препар
      CR_PREDST='261'; // Карточки медпредставителей
      CR_KRO='251';    // Карточки батвиневцев
//      CR_STR241='241'; // Скретч карты (Сертификаты)
      CR_DRIVER='558'; // Карточки водителей

      // 2220000000017
      // 2240000000017
      // 2250000000013
      // 2260000000013
      // 210 - сотрудники аптек
      // 201 - профарма
      // 223000000001 - 10% ,223000000002 - 20%,223000000003 - 30%, 223000000004 -15%
      // 227 -
      // 272 - код для медикард так как родной медикар начинается с MD0
      // 228 - карточки для Чистюли
      // 2890000000012 - 10 %

      { --- Признаки работы со справочником товара ---}
      W_CENNIK=1;    // Печать ценников
      W_LT=2;        // Формирование лишнего товара
      W_PEREUCHET=3; // Формирование выборочной инвентаризации
      W_BACK=4;      // Формирование возврата по списку
      W_BACK1=5;     // Формирование возврата по списку
      W_LTM=6;       // Формирование лишнего товара по минусовой реализации

      { --- Признаки формирования пересорта ---}
      P_MONTH=1;      // Пересорт за месяц
      P_PEREUCHET=2;  // Пересорт по переучету

      { --- Признаки ввода количества ---}
      EN_SIMPLE=0; // Простой ввод
      EN_PODBOR=1; // Ввод с подбором замены

      { --- Признаки формироания списков пользователей ---}
      USERS_ALL=0; // Пользователи не зарегистрированные
      USERS_APT=1; // Пользователи зарегистрированные

      { --- Типы чеков ---}
      TC_MAIN=1;
      TC_KURER=2;
      TC_PREP=3;
      TC_SERTIF=4;
      TC_STRETCH=6;
      TC_BACK=7;
      TC_PROFARMA=8;
      TC_MOMBABY=9;
      TC_PILOT=10;

      { --- Типы вводимых значений ---}
      INT_VALUE=1;
      STR_VALUE=2;
      CUR_VALUE=3;

      { --- Признаки карточек MDM --- }
      MDM_1='482';
      MDM_2='221';

Var MainF:TMainF=nil;
    Opt:TFileOpt;
    Prm:TPrParams;
    CL:TClOptions;
    FlagD:Integer;
//    aFiles:Array of TFileOst;
    ErrMess:String;

Implementation

Uses DataModuleU, StartU, AboutU, UsersU, EnterKolU, OstatCheckU, DialogU,
     BlockingU, DateBackU, OptU, MoveTovU, RealizRepU, CardReadU, ZXRepU,
     ShowEAN13U, SumZU, ViewNaklU, EnterStrU, ShareU, OptSumU, LoadNaklU,
     ZakazU, MoveMoneyU, ShowTerminalAlertU, ShowCardInfoU, BankCardU,
     OtkazU, NoScanU, ShowATCU, BackClientU, InitCPU, RepKassirSummU,
     RepOstatU, RepPeriodU, InfoPKUU, RepIncomU, TermEKKAU, CutBaseU,
     ShowNewInfoU, EditRegU, HistoryU, WorkSprU, ViewLTU, JTableU,
     CancelViewU, PeresortU, CheckBaseU, RepRegU, KolProdU, SpisU,
     PrOtkazU, ShowMessU, SpisArtAddU, JReocU, AkciiU, SpisUserU, BlankKROU, PswU, EnterValueU,
     BlankReciptU, PrintObnovU, MoneyCashU, ShowTerapU, EnterDateU,
     CenaUpakU, Mess1U, ScanBoxU, RegPredstU, SimpleMessU, EnterDate1U,
     SertifIU, AddResU, WorkResU, ScanMagU, AECardsU, ShowAkciiU, ScanStretchU, ChooseVLU,
     MBSpisU, ProvizInfoU, SignInfoU, HotKeyInfoU, TableU, TabelU, FirstRecU,
     CountersU, ShowRecOnlyU, LTMU, FormForVozrU, CalcZarplU, ReasonNoTovU,
  FirstRecomendU, ShowBackClInstructU, PrihodMDMU;

{$R *.dfm}

// Create формы
procedure TMainF.FormCreate(Sender:TObject);
 begin
  try
   FIsStart:=True;
   try
    Application.OnMessage:=AppMessage;
    Ex:=True;
    InitFields;
    InitIP;
    InitFonts;
    InitColors;
    InitPanels;
    InitGroupsMain;
    InitChek;
    InitFixSkd;
    InitEKKA;
    InitAnnotList;
    InitScripts;
    SetVolume;
    Ex:=False;
   finally
    FIsStart:=False;
   end;
  except
   on E:EAbort do begin Ex:=True; ErrMess:=E.Message; end else begin Ex:=True; ErrMess:='Ошибка инициализации программы!'; end;
  end;
 end; {FormCreate}

// Запуск SQL - запросов
procedure TMainF.InitScripts;
 begin
  if Design then Exit;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('delete from Inform..JReadMess where id_mess in (select id from Inform..JMess where DateM<getdate()-10)');
   DM.Qr.SQL.Add('delete from Inform..JMess where DateM<getdate()-10');
   DM.Qr.ExecSQL;
  except
  end;

 end; {InitScripts}

// Запись своего IP в справочник IP
procedure TMainF.InitIP;
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('delete from UpdateReg where id_kassa='+IntToStr(Opt.KassaID));
   DM.Qr.SQL.Add('insert into UpdateReg(ID_KASSA,DATEEXE)');
   DM.Qr.SQL.Add('Values ('+IntToStr(Opt.KassaID)+','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',FApplDateTime)+''')');
   DM.Qr.ExecSQL;
  except
  end;

  try
   if Not IsServer then Exit;
   FIP:=GetLocalIP;
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('delete from SprIP where id_kassa='+IntToStr(Opt.KassaID));
   DM.Qr.SQL.Add('insert into SprIP(IP,ID_KASSA)');
   DM.Qr.SQL.Add('Values ('''+IP+''','+IntToStr(Opt.KassaID)+')');
   DM.Qr.ExecSQL;
  except
  end;

  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('insert into RegPredst(id_p,dt,flag) ');
   DM.Qr.SQL.Add('select id_p,convert(datetime,convert(varchar,getdate()-1,23)+'' 23:59:59''),2                       ');
   DM.Qr.SQL.Add('from SprPredst s                    ');
   DM.Qr.SQL.Add('where IsNull((select top 1 r.Flag from RegPredst r where r.dt<convert(datetime,convert(varchar,getdate(),23)) and r.id_p=s.id_p order by dt desc,flag desc),0)=1 ');
   DM.Qr.ExecSQL;
  except
  end;
 end; {InitIP}

// Подгружает список арткодов на которые есть аннотации
procedure TMainF.InitAnnotList;
var i:Integer;
 begin
  if Design then Exit;
  // Инициализация списка арткодов для Аннотаций
  try
   SetLength(FArtCodeList,0);
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select IsNull(Max(art_code),0) as Cnt from SprTov where art_code<>99999';
   DM.Qr.Open;
   SetLength(FArtCodeList,DM.Qr.FieldByName('Cnt').AsInteger*2);

   for i:=Low(FArtCodeList) to High(FArtCodeList) do
    begin
     FArtCodeList[i].Annot:=0;
     FArtCodeList[i].ArtAdd:=0;
     FArtCodeList[i].Recipt:=1;
     FArtCodeList[i].Color:=-1;
    end;
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select art_code from Annotacii..Annotaci where art_code<>99999 group by art_code order by art_code';
   DM.Qr.Open;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     FArtCodeList[DM.Qr.FieldByName('art_code').AsInteger].Annot:=1;
    end;
  except
  end;

  // Инициализация списка подарочных арткодов
 { try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select art_add from SprArtAdd where art_add>0');
   DM.Qr.SQL.Add('union');
   DM.Qr.SQL.Add('select art_code from SprArtAddDop where art_code>0');
   DM.Qr.Open;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     FArtCodeList[DM.Qr.FieldByName('art_add').AsInteger].ArtAdd:=1;
    end;
  except
  end;
 }
  // Инициализация списка цветовой подсветки
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select art_code,color from SprColor');
   DM.Qr.Open;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     FArtCodeList[DM.Qr.FieldByName('art_code').AsInteger].Color:=DM.Qr.FieldByName('color').AsInteger;
    end;
  except
  end;

  // Список безрецептурных препаратов
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('if Object_ID(N''tempdb..#srok'') is not null drop table #srok     ');
   DM.Qr.SQL.Add('select art_code,rtrim(substring(names,1,len(names)-7)) as names   ');
   DM.Qr.SQL.Add('into #srok                                                        ');
   DM.Qr.SQL.Add('from SprTov                                                       ');
   DM.Qr.SQL.Add('where Names like ''%(__.__)''                                     ');
   DM.Qr.SQL.Add('group by art_code,rtrim(substring(names,1,len(names)-7))          ');
   DM.Qr.SQL.Add('select a.art_code                                                 ');
   DM.Qr.SQL.Add('from #srok a, SprTov b, SprNoRecipt c                             ');
   DM.Qr.SQL.Add('where a.names=b.names and b.art_code=c.art_code                   ');
   DM.Qr.SQL.Add('group by a.art_code                                               ');
   DM.Qr.SQL.Add('union                                                             ');
   DM.Qr.SQL.Add('select art_code from SprNoRecipt                                  ');
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Abort;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     FArtCodeList[DM.Qr.FieldByName('art_code').AsInteger].Recipt:=0;
    end;
  except
   for i:=Low(FArtCodeList) to High(FArtCodeList) do FArtCodeList[i].Recipt:=0;
  end;

 end; {InitAnnotList}

// Установка шрифтов "Bookman Old Style"
procedure TMainF.InitFonts;
var i:Integer;
    B1,B2:Boolean;
 begin
  B1:=False; B2:=False;
  try
   for i:=0 to Screen.Fonts.Count-1 do
    begin
     if AnsiUpperCase(Screen.Fonts[i])=AnsiUpperCase('Bookman Old Style') then B1:=True;
     if AnsiUpperCase(Screen.Fonts[i])=AnsiUpperCase('EanBwrP36Tt') then B2:=True;
     if B1 and B2 then Break;
    end;
   if Not B1 then
    begin
     AddFontResource(PChar(WorkPath+'\BOOKOS.TTF'));
     AddFontResource(PChar(WorkPath+'\BOOKOSB.TTF'));
     AddFontResource(PChar(WorkPath+'\BOOKOSBI.TTF'));
     AddFontResource(PChar(WorkPath+'\BOOKOSI.TTF'));
     SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
    end;
   if Not B2 then
    begin
     AddFontResource(PChar(WorkPath+'\V200011_.TTF'));
     SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
    end;
   except
   end;
 end; {InitFonts}

// Инициализация полей класса формы
procedure TMainF.InitFields;
 begin
  Randomize;
  FChpChek:=TStringList.Create;
  sbMag.Hint:='Перечень скидок: '+#10#10+
              '  - Газета по штрихкоду 222хххххххххх 5% или 10%; '+#10+
              '  - "Биона" по штрихкоду 223хххххххххх - 20%; '+#10+
              '  - Стратадерм гель по штрихкоду 7640140190150 - 5%; '+#10+
              '  - Бланки врачей по штрихкоду 231хххххххххх - доп. 3% или фикс. 5%.'+#10;

  DecimalSeparator:='.';
  FIsFirstShowMess:=True;

  if Prm.RealizMinus then
   begin
    cbBoxZero.Checked:=False;
    cbBoxZero.Enabled:=False;
   end;
  ShortDateFormat:='dd.mm.yy';
  ShortTimeFormat:='hh:nn:ss';
  FSkdCalced:=False;
  FEnterKol:=False;
  FNonClosed:=False;
  FFlagW:=False;
  FChekOpened:=False;
  FType_Skd:=0;
  FChangeUser:=False;
  FPayWork:=False;
  FPayCount:=0;
  FIsFozzy:=False;
  FApplDateTime:=GetFileDateTime(Application.ExeName);
  Caption:=MFC+' - пользователь: '+Prm.UserName+'    Дата создания: '+DateTimeToStr(FApplDateTime);
  pcMain.ActivePage:=TabSale;
  PercentSkd:=0;
  FCanExecCom:=True;
  FIsChSeria:=False;
  FTypeChek:=TC_MAIN;
  Mistake:=False;
  ExecComm.KassaID:=Opt.KassaID;
  ExecComm.Qr.Connection:=DM.ADOCo;
  ExecComm.QrEx.Connection:=DM.ADOCo;
  ExecComm.Clear;
  FIDRES:=-1;
  ForReserve:=False;
  FNumCardMag:=-1;
  FNumCardProf:=-1;
  FNumCardRecipt:=-1;
  FNumMediCard:=-1;
  FNumMDMUCard:=-1;
  miShowMCash.Checked:=Opt.ShowMCash;
  if Not IsServer and (AnsiUpperCase(GetCompName)<>AnsiUpperCase('SERGEY')) then SetTime(DM.GetServerDate);
  try
   DM.Qr.Close;
   DM.Qr.SQl.Text:='select * from Spr_Const where Descr=''SkdDop''';
   DM.Qr.Open;
   FIsSkdDop:=Not DM.Qr.IsEmpty;
  except
   FIsSkdDop:=False;
  end;

  if Prm.SkdFirst then Prm.SumSkd:=0 else
  if Prm.SkdFirst=False then
   try

    DM.QrEx.Close;
    DM.QrEx.SQL.Text:='select Min(date_nakl) as dn from JMoves';
    DM.QrEx.Open;
    if DM.QrEx.FieldByName('dn').AsDateTime+90>Date then Prm.SumSkd:=0;

   except
   end;
//  Prm.SumSkd:=Prm.SumSkd;

//  Prm.SkdFirst:=False;
//  Prm.SumSkd:=100000000;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='insert into UserLog(id_user,id_kassa,dt,flag) values('+IntToStr(Prm.UserID)+','+IntToStr(Opt.KassaID)+',getdate(),1)';
   DM.QrEx.ExecSQL;
  except
  end;

  SndRecXML.Variable:='medicard';
  SndRecXML.URL:='http://www.medicard.com.ua/api/api.php';

  if Prm.AptekaID=28 then
   begin
    SndRecXML.HTTP.ProxyParams.ProxyServer:='';
    SndRecXML.HTTP.ProxyParams.ProxyPort:=80;
   end;

 end; {InitFields}

// Инициализация цветов главного окна
procedure TMainF.InitColors;
var i:Integer;
 begin
  dbgSklad.Color:=CL.SklFon;
  dbgChek.Color:=CL.ChFon;

  dbgSklad.Columns[0].Font.Color:=CL.CodeF;
  dbgSklad.Columns[2].Font.Color:=CL.NamesF;
  dbgSklad.Columns[3].Font.Color:=CL.OstatF;
  dbgSklad.Columns[4].Font.Color:=CL.CenaF;

  dbgSklad.Font.Size:=CL.SklFS;
  dbgSklad.Font.Name:=CL.SklFN;

  for i:=0 to dbgSklad.Columns.Count-1 do
   begin
    dbgSklad.Columns[i].Font.Size:=CL.SklFS;
    dbgSklad.Columns[i].Font.Name:=CL.SklFN;
   end;

  lbChek.Font.Color:=CL.IndicNoScanF;
  lbSumCash.Font.Color:=CL.CashSumF;
  lbChek.Color:=CL.IndicFon;
  lbSumCash.Color:=CL.IndicFon;
  pnIndicator.Color:=CL.IndicFon;

 end; {InitColors}

// Размещение информационных панелей по центру
procedure TMainF.InitPanels;
 begin
  pnFlash.Left:=(Screen.Width-pnFlash.Width) div 2;
  pnFlash.Top:=(Screen.Height-pnFlash.Height) div 2;
  pnUnBase.Left:=(Screen.Width-pnUnBase.Width) div 2;
  pnUnBase.Top:=(Screen.Height-pnUnBase.Height) div 2;
  lbAptekaName.Visible:=IsPermit([],P_SILENT);
  lbAptekaName.Caption:=Prm.AptekaNameRU;
  edLogoEKKA.Text:=Opt.LoadNaklPath+'Logo.bmp';
  FDesign:=FileExists(PrPath+'\PC_EKKA.dsg');
  tmpButton.Visible:=Design;

  miFNDS1.Visible:=(Prm.UserRole=R_ADMIN);
  miFNDS2.Visible:=(Prm.UserRole=R_ADMIN);

  miFNDS3.Visible:=MainF.BaseCHP and (Prm.UserRole=R_ADMIN);
  miFNDS4.Visible:=MainF.BaseCHP and (Prm.UserRole=R_ADMIN);

  miNDS3.Visible:=MainF.BaseCHP;
  miNDS4.Visible:=MainF.BaseCHP;

  tmChek.Visible:=Design;
  tmpButton2.Visible:=(Prm.AptekaID in [2,14,18,30..38,54]) or Design;
  ShowStatus(Opt.Server,4);
  if Prm.UserRole=R_DISP then
   begin
    pnMainBottom.Visible:=False;
    pnControl.Visible:=False;
    pnSkd.Visible:=False;
    //pnStatus.Visible:=False;
    cbBoxZero.Checked:=False;
    splMain.Visible:=False;
   end;
  miLTM.Visible:=Prm.RealizMinus;
  bbForceCloseCash.Visible:=EKKA.TypeEKKA=EKKA_DATECS3530T;
  bbForceCloseChek.Visible:=EKKA.TypeEKKA=EKKA_DATECS3530T;
  pnWrEKKA.Visible:=(Prm.UserRole=R_ADMIN) or (Prm.FirmID=1);
  miUnloadRealiz.Visible:=(Prm.FirmID=5) or (Design);
 end; {InitPanels}

// Установка прокрутки всех DBGrid колесиком мышки
procedure TMainF.AppMessage(var Msg: TMsg; var Handled:Boolean);
var i:SmallInt;
 begin
  if Msg.Message=WM_MOUSEWHEEL then
   begin
    Msg.Message:=WM_KEYDOWN;
    Msg.lParam:=0;
    i:=HiWord(Msg.wParam);
    if i>0 then Msg.wParam:=VK_UP else Msg.wParam:=VK_DOWN;
    Handled:=False;
   end;
 end; {AppMessage}

// Обработка нажатия кнопок Групп товаров
function TMainF.RBClick(Sender:TObject; FGr:TGroups):Integer;
var i:Integer;
 begin
  for i:=Low(FGr) to High(FGr) do
   begin
    FGr[i].Font.Style:=[];
    FGr[i].Font.Color:=clBlack;
    FGr[i].Width:=20+TextPixWidth(FGr[i].Caption,FGr[i].Font)
   end;
  TRadioButton(Sender).Font.Style:=[fsBold];
  TRadioButton(Sender).Font.Color:=clBlue;
  TRadioButton(Sender).Width:=20+TextPixWidth(TRadioButton(Sender).Caption,TRadioButton(Sender).Font);
  Result:=TRadioButton(Sender).Tag;
 end; {RBClick}

// Обработчик переключения по группам товаров
procedure TMainF.RbGroupClick(Sender:TObject);
 begin
  if Sender=nil then Exit;
  FGroupIndex:=RBClick(Sender,FGroups);
  FilterSklad;
 end; {RbGroupClick}

// Очистка массива групп 
procedure TMainF.ClearGroups(FGroups:TGroups);
var i:Integer;
 begin
  for i:=Low(FGroups) to High(FGroups) do FGroups[i].Free;
  SetLength(FGroups,0);
 end; {ClearGroups}

// Инициализация типов товаров
function TMainF.InitGroups(var FGroups:TGroups; pnGroup:TWinControl; P:Integer):Boolean;
var dx,CA,i:Integer;
    Ds:String;
 begin
  Result:=True;
  ClearGroups(FGroups);
  DM.Qr.Close;
  DM.Qr.SQL.Text:='select Type_Tov from SprTov group by Type_Tov order by Type_Tov';
  DM.Qr.Open;
  if (DM.Qr.IsEmpty) or (P=GR_ZAKAZ) then
   begin
    CA:=High(FGroups)+1; SetLength(FGroups,CA+1);
    FGroups[CA]:=TRadioButton.Create(Self);
    FGroups[CA].Parent:=pnGroup;
    FGroups[CA].Caption:='Все';
    FGroups[CA].Tag:=0;
    FGroups[CA].Width:=25+TextPixWidth(FGroups[CA].Caption,FGroups[CA].Font);
    FGroups[CA].Left:=5;
    FGroups[CA].Top:=5;
    if DM.Qr.IsEmpty then
     begin
      Result:=False;
      Exit;
     end;
   end;
  dx:=(pnGroup.Width-50) div DM.Qr.RecordCount;
  for i:=1 to DM.Qr.RecordCount do
   begin
    if i=1 then DM.Qr.First else DM.Qr.Next;
    CA:=High(FGroups)+1; SetLength(FGroups,CA+1);
    FGroups[CA]:=TRadioButton.Create(Self);
    FGroups[CA].Parent:=pnGroup;
    Case DM.Qr.FieldByName('Type_Tov').AsInteger of
     1:Ds:='Товар без НДС';
     2:Ds:='Товар c НДС';
     3:Ds:='Детское питание';
     99:Ds:='Подарочные товары' else Ds:='Группа '+IntToStr(i);
    end;
    FGroups[CA].Caption:=Ds;
    FGroups[CA].Tag:=DM.Qr.FieldByName('Type_Tov').AsInteger;
    FGroups[CA].Width:=25+TextPixWidth(FGroups[CA].Caption,FGroups[CA].Font);
    FGroups[CA].Left:=(i-1)*dx+15;
    FGroups[CA].Top:=5;
   end;
 end; {InitGroups}

// Инизиализация груп товаров в главном окне
procedure TMainF.InitGroupsMain;
var i:Integer;
 begin
  if Not InitGroups(FGroups,pnGroup,GR_MAIN) then Exit;
  for i:=low(FGroups) to High(FGroups) do
   begin
    FGroups[i].OnClick:=RbGroupClick;
    if i=0 then
     begin
      FSprOrder:=O_NAMES;
      FGroups[i].Checked:=True;
     end;
   end;
 end; {InitGroupsMain}

// Инициализация чека, в частности проверка на непустость чека
procedure TMainF.InitChek;
 begin
  FSumSkd:=0;
  FSumChek:=0;
  try
   if DM.qrChek.Active then DM.qrChek.Close;
   DM.qrChek.SQL.Clear;
   DM.qrChek.SQL.Add('select a.art_code,a.names,Max(a.art_name) as art_name,Sum(a.kol) as kol,a.cena,a.type_tov,a.f_nds,a.printing,a.skd,Sum(a.kol*a.cena) as SumRow, ');
   DM.qrChek.SQL.Add('       Sum(a.sumskd) as SumSkd, IsNull(Sum(a.SumSkdK),0) as SumSkdK, b.P1,b.P2,b.P3');
   DM.qrChek.SQL.Add('from Chek a left join Inform..SprReg b on a.art_code=b.art_code                    ');
   DM.qrChek.SQL.Add('where a.compname=host_name() and a.id_user='+IntToStr(Prm.UserID) );
   DM.qrChek.SQL.Add('group by a.art_code,a.names,a.cena,a.f_nds,a.type_tov,a.printing,b.P1,b.P2,b.P3,a.skd ');
   DM.qrChek.SQL.Add('order by a.names                      ');
   DM.qrChek.Open;
   if DM.qrChek.IsEmpty then Abort;
   OpenChek;
  except
   DM.qrChek.Close;
   FIsCHP:=False;
   SetVisWhenChekOpened(False);
  end;
 end; {InitChek}

// Инициализация фиксированных скидок
procedure TMainF.InitFixSkd;
var i:Integer;
 begin
  try
   if DM.Qr.Active then DM.Qr.Close;
   DM.Qr.SQL.Text:='select skd from Skd where Type_Skd=2 order by skd';
   DM.Qr.Open;
   if DM.Qr.IsEmpty then EAbort.Create('Ошибка инициализации фиксированных скидок!');
   cbFixSkd.Clear;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     cbFixSkd.Items.Add(DM.Qr.FieldByName('SKD').AsString);
    end;
   cbFixSkd.ItemIndex:=-1;
  except
   raise EAbort.Create('Ошибка инициализации фиксированных скидок!');
  end;
 end; {InitFixSkd}

// Инициализация кассового аппарата 
procedure TMainF.InitEKKA;
var S:String;
 begin
  EKKA.KassaID:=Opt.KassaID;
  EKKA.Log:=meEKKA.Lines;
  EKKA.Kassir:=IntToStr(Prm.ID_Gamma);
  if Prm.UserRole=R_ADMIN then EKKA.UseEKKA:=False;
  FUseEKKASafe:=EKKA.UseEKKA;
  cbEKKA.Checked:=Not(EKKA.UseEKKA);
  ShowErrorEKKA(EKKA.fpConnect);
  EKKA.fpCutBeep(1,0);
  EKKA.fpSetBottomStr('');
  EKKA.fpSetBottomStrEx(CenterStr('БАЖАЄМО ВАМ ЗДОРОВ''Я',21),0,0,3);
//  S:='PPOD1'; EKKA.fpSendCommand(S);
 end;{InitEKKA}

// Вывод настраиваемого окна сообщения
function TMainF.MessBox(Mes:String; Btn:Integer):Integer;
 begin
  Result:=Application.MessageBox(PChar(Mes),PChar(MFC),Btn);
 end; {MessBox}

// Вывод сообщения с кнопкой OK и типом MB_ICONWARNING
function TMainF.MessBox(Mes:String):Integer;
 begin
  Result:=Application.MessageBox(PChar(Mes),PChar(MFC),48);
 end; {MessBox}

// Проверка прав текущего пользователя из списка указанных прав в множестве S
function TMainF.IsPermit(S:TByteSet; Mes:String; Param:Byte):Boolean;
var ss:TByteSet;
 begin
  try
   Result:=False;
   ss:=[]; Include(ss,R_ADMIN);
   if Prm.UserRole in (S+ss) then Result:=True else
    begin
     if Param<>P_ALERT then Exit;
     try
      FlagD:=0;
      DialogF:=TDialogF.Create(Self);
      try
       DialogF.ShowModal;
       if FlagD=0 then Exit;
       if Prm.UserRole in (S+ss) then Result:=True;
      finally
       DialogF.Free;
      end;
     except
      MessBox(Mes,48); Exit;
     end;
    end;
  finally
   Prm.UserRole:=Prm.SafeUserRole;
  end;
 end; {IsPermit}

// Проверка прав текущего пользователя из списка указанных прав в множестве S с фиксированным сообщением
function TMainF.IsPermit(S:TByteSet; Param:Byte):Boolean;
 begin
  Result:=IsPermit(S,'У вас нет прав на эту операцию',Param);
 end; {IsPermit}

// Activate формы
procedure TMainF.FormActivate(Sender:TObject);
 begin
  WindowState:=wsMaximized;
  dbgSklad.Visible:=True;
  dbgSklad.SetFocus;
  LoadKeyboardLayout('00000419', KLF_ACTIVATE);
  tmrFlushPasswTimer(nil);
  WriteToJournZ(0,0,0,0,0);
  if Prm.AptekaID<>100 then ForceUnLoadAll;
  if Prm.UserRole=R_DISP then
   begin
    pnSklad.Width:=Screen.Width-10;
    pnSklad.Height:=Screen.Height-163;
    pnStatus.Top:=pnSklad.Top+pnSklad.Height+1;
   end;
 end; {FormActivate}

// Resize формы
procedure TMainF.FormResize(Sender:TObject);
var chX,dx,i:Integer;
 begin
  try
   // Равномерное размещение переключателей типов товаров
   dbgSklad.Columns[11].Width:=0;
   dbgSklad.Columns[12].Width:=0;
   dx:=(pnGroup.Width-400) div (High(FGroups)+1); for i:=Low(FGroups) to High(FGroups) do FGroups[i].Left:=i*dx+15;

   // Растяжка колонок dbgSklad
   dbgSklad.Columns[0].Width:=Round((40/582)*(dbgSklad.Width-34));
   dbgSklad.Columns[1].Width:=Round((21/582)*(dbgSklad.Width-34));

   dbgSklad.Columns[3].Width:=Round((38/582)*(dbgSklad.Width-34));
   dbgSklad.Columns[4].Width:=Round((37/582)*(dbgSklad.Width-34));
   dbgSklad.Columns[5].Width:=Round((37/582)*(dbgSklad.Width-34));


   chX:=0;
   if Opt.ShowRegFull then
    begin
     dbgSklad.Columns[2].Width:=Round((302/582)*(dbgSklad.Width-34));
     dbgSklad.Columns[6].Width:=Round((19/582)*(dbgSklad.Width-34));
     dbgSklad.Columns[7].Width:=Round((19/582)*(dbgSklad.Width-34));
     dbgSklad.Columns[8].Width:=Round((19/582)*(dbgSklad.Width-34));
     dbgSklad.Columns[9].Width:=Round((20/582)*(dbgSklad.Width-34));

     for i:=0 to dbgSklad.Columns.Count-3 do Inc(chX,dbgSklad.Columns[i].Width);
     dbgSklad.Columns[9].Width:=dbgSklad.Width-chX-38;
    end else begin
              dbgSklad.Columns[2].Width:=Round((344/582)*(dbgSklad.Width-34));
              dbgSklad.Columns[6].Width:=Round((21/582)*(dbgSklad.Width-34));
              dbgSklad.Columns[7].Width:=Round((21/582)*(dbgSklad.Width-34));
              dbgSklad.Columns[9].Width:=0;
              dbgSklad.Columns[10].Width:=0;
              for i:=0 to dbgSklad.Columns.Count-3 do Inc(chX,dbgSklad.Columns[i].Width);
              dbgSklad.Columns[8].Width:=dbgSklad.Width-chX-36;
             end;

   if Prm.AptekaID in [16,58] then
    begin
     pnPercShow.Visible:=True;
     dbgSklad.Columns[2].Width:=dbgSklad.Columns[2].Width-120;
     dbgSklad.Columns[11].Width:=60;
     dbgSklad.Columns[12].Width:=60;
    end else pnPercShow.Visible:=False;
   // Растяжка колонок dbgChek
   RisizeDBGrid(dbgChek,20);
  except
  end;
 end; {FormResize}

// Проверка чека на предмет неотсканированных позиций
function TMainF.CheckScan(var Pers:String):Boolean;
var Q1,Q2:Integer;
 begin
  Pers:='Чек не проверен';
  try
   if Not(DM.qrChek.Active) then Abort;
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select art_code from Chek where IsNull(PRINTING,0)<>1 and compname=host_name() and ID_USER = '+IntToStr(Prm.UserID)+' group by art_code';
   DM.Qr.Open;
   Q2:=DM.qrChek.RecordCount;
   Q1:=DM.Qr.RecordCount;
   if Q1>0 then
    begin
     Pers:='Чек не проверен на '+IntToStr(Round(100*Q1/Q2))+'%';
    end else Abort;
   Result:=True;
  except
   Result:=False;
  end
 end; {CheckScan}

// Установка видимости/невидимости компонентов в процесе окрытия/закрытия чека
procedure TMainF.SetVisWhenChekOpened(V:Boolean);
var P:String;
 begin
  btnCChek.Enabled:=V;
  btnPayCash.Enabled:=V;

  btPrnChek.Enabled:=V;
  if Not IsSkdDop then btPrnChek.Enabled:=False;

  btSumChek.Enabled:=V;
  btnPayChek.Enabled:=V;
  sbRecipt.Enabled:=V;
  sbProf.Enabled:=V;
  sbBskd.Enabled:=V;
  sbGoldG.Enabled:=V;
  btnBack.Enabled:=V;
  sbMag.Enabled:=V;
  sbMediCard.Enabled:=V;
  sbMDMU.Enabled:=V;
  sbMDMU1.Enabled:=V;

  if V then
   begin
    btnBack.Enabled:=TypeChek=TC_BACK;
    btnPayChek.Enabled:=Not (TypeChek=TC_STRETCH) and Not (TypeChek=TC_SERTIF) and  Not (TypeChek=TC_BACK);
    btnPayCash.Enabled:=Not (TypeChek=TC_BACK);

    lbChek.Visible:=CheckScan(P);
    lbChek.Caption:=P;

    bbReserve.Enabled:=btnPayChek.Enabled and (ForReserve=False);
//    ForReserve:=False;
   end else begin
             sbMag.Down:=False;
             bbReserve.Enabled:=V;
             lbChek.Visible:=V;
             FChekOpened:=False;
             Type_Skd:=SK_NONE;
             if dbgSklad.Visible then dbgSklad.Enabled:=True;
             sbCard.Enabled:=True;
             miCardSkd.Enabled:=True;
            end;
  dbgChek.Visible:=V;
  btnOChek.Enabled:=Not V;
  miPrepChek.Enabled:=Not V;
  miChekKurier.Enabled:=Not V;
  miSktretchChek.Enabled:=Not V;
  miBackToSklad.Enabled:=Not V;
  miPilot.Enabled:=Not V;

  pnIndicator.Visible:=V;
  lbIndNal.Visible:=V;
  lbIndAll.Visible:=V;
  lbIndSkd.Visible:=V;
  lbNCrd.Visible:=V;
  lbPrSkd.Visible:=V;
  pnCash.Visible:=V;
  lbCash.Visible:=V;
  lbSumCash.Visible:=V;
  imCash.Visible:=V;
  lbMB.Visible:=V;
  lbMBInfo.Visible:=V;
  if V=False then edCash.Text:='0' else
  if dbgSklad.Visible then dbgSklad.SetFocus;
  lbSearch.Caption:='';
  lbCheck.Caption:='';
 end; {SetVisWhenChekOpened}

// Управление камерой
procedure TMainF.StartCamera(Param:Integer);
 begin
  try
   if Opt.Camera<>1 then Exit;
   PostMessage(FindWindow('TMain','BeholdTV'),WM_USER+200,WM_USER+Param,0);
   Application.ProcessMessages;
  except
  end;
 end; {StartCamera}

// Открывает чек
procedure TMainF.OpenChek;

 procedure ShowCardRead;
 var IsSkd:Boolean;
     tm:TDateTime;
  begin
   if FIsChSeria then Exit;
   tm:=Time;
   IsDay:=True;
   if StrToTime(Prm.StartTime)>StrToTime(Prm.EndTime) then
    begin
     if (tm>StrToTime(Prm.StartTime)) or (tm<StrToTime(Prm.EndTime)) then IsDay:=False;
    end else
     if (tm>StrToTime(Prm.StartTime)) and (tm<StrToTime(Prm.EndTime)) then IsDay:=False;

   if (FIsStart=False) then
    begin
     IsSkd:=True;
    { try
      DM.Qr.Close;
      DM.Qr.SQL.Text:='select * from Chek where art_code in (select art_code from skd_limit where type_skd=4 and skd=0) and id_user='+IntToStr(Prm.UserID);
      DM.Qr.Open;
      if Not DM.Qr.IsEmpty then IsSkd:=False;
     except
     end;
     }
//     IsDay:=False;
     if DM.qrChek.IsEmpty and IsDay and IsSkd and (Prm.SumSkd>0) then begin FIsOneRegCard:=False; SwitchSkd(sbCard,miCardSkd); end;
    end else begin
              DM.Qr.Close;
              DM.Qr.SQL.Text:='select * from Chek where compname=host_name() and id_user='+IntToStr(Prm.UserID);
              DM.Qr.Open;
              if DM.Qr.IsEmpty then Exit;
              if DM.Qr.FieldByName('NumCard').AsInteger>0 then
               begin
                NumCard:=DM.Qr.FieldByName('NumCard').AsInteger;
                Type_Skd:=SK_CARD;
                sbCard.Down:=True;
               end else Type_Skd:=SK_NONE;
             end;
  end;

 function CheckPredopl(var Sum:Real; var NCh:Integer):Boolean;
 var FIO,DateR:String;
  begin
   try
    Result:=True;
    Sum:=0; NCh:=0;
    if TypeChek<>TC_PREP then Exit;
    if Not EnterIntValue(NCh,'Введите номер предоплатного чека') then Abort;
    DM.Qr3.Close;
    DM.Qr3.SQL.Text:='select IsNull(Sum(cena),0) as Sm from ArhCheks where kod_name=0 and Numb_Chek='+IntToStr(NCh)+' and Vzh='+IntToStr(EKKA.VzhNum);
    DM.Qr3.Open;
    if (DM.Qr3.IsEmpty) or (DM.Qr3.FieldByName('Sm').AsFloat<=0) then
     begin
      MessBox('Чек с номером "'+IntToStr(NCh)+'" не найден! '#10' Возможно он пробит на другой кассе или не является предоплатным!');
      Abort;
     end;
    Sum:=DM.Qr3.FieldByName('Sm').AsFloat;

    if { (Prm.AptekaID<>123) and } Not ((Prm.AptekaID=4) and (Opt.KassaID=5)) then
     begin
      {try
     ShowBackClInstructF:=TShowBackClInstructF.Create(Self);
     try
      ShowBackClInstructF.ShowModal;
     finally
      ShowBackClInstructF.Free;
     end;
    except
    end;}

      if MessBox('Напечатать бланк "Согласие на сбор и обработку персональных данных"',52)<>ID_YES then Abort;

      FormForVozrF:=TFormForVozrF.Create(Self);
      try
       FormForVozrF.Edit5.Enabled:=False;
       FormForVozrF.Edit5.Clear;
       FormForVozrF.Edit5.Items.Add('предоплата товара');
       FormForVozrF.Edit5.ItemIndex:=0;
       FormForVozrF.ShowModal;
       if FormForVozrF.Flag<>1 then  Abort;
       mVF:=FormForVozrF.VF;
      finally
       FormForVozrF.Free;
      end;

     FIO:=mVF.F+' '+mVF.N+' '+mVF.O;
     DateR:=DateToStr(mVF.DateR);
     PrintBlankForRegCard(0,FIO,DateR);
    end;

   except
    Sum:=0; NCh:=0;
    Result:=False;
   end;
  end;

 function CheckSertif(var Sum:Currency):Boolean;
 var nc:Int64;
  begin
   try
    Result:=True;
    Sum:=0;
    if Not (TypeChek in [TC_SERTIF,TC_STRETCH,TC_MOMBABY]) then Exit;
    if TypeChek=TC_SERTIF then
     if Not EnterCurrValue(Sum,'Введите сумму сертификата!') then Abort;

    if TypeChek in [TC_STRETCH,TC_MOMBABY] then
     begin
      ScanStretchF:=TScanStretchF.Create(Self);
      try
       ScanStretchF.Param:=TypeChek;
       ScanStretchF.ShowModal;
       if (ScanStretchF.Flag=0) or (ScanStretchF.Summ<=0) then Abort;
       Sum:=ScanStretchF.Summ;
       if TypeChek=TC_STRETCH then FNumCardStretch:=0;
      finally
       ScanStretchF.Free;
      end;
     end;
   except
    Sum:=0;
    Result:=False;
   end;
  end;

 function CheckPilot(var FMedName:String):Boolean;
  begin
   try
    FMedName:='';
    Result:=EnterStrValue(FMedName,'Введите название лечебного учреждения, выдавшего рецепт');
    if FMedName='' then Abort;
   except
    Result:=False;
   end;
  end;

 Begin
  FlagW:=False;
  if (IsPermit([R_SUPER,R_KASSIR,R_OPER],P_SILENT)) then
   if Not (ChekOpened) then
    try

     if Prm.AptekaID=4 then AppendStringToFile('D:\AVA\TypeCheks.txt',DateTimeToStr(Now)+' : '+IntToStr(Prm.UserID)+' : '+IntToStr(TypeChek));

     IsDay:=True;
     FNumCardStretch:=-1;
     FNumCardRecipt:=-1;
     lbMBInfo.Caption:='0';

     if Not CheckPredopl(FSumPChek,FNPChek) then Exit;
     Case TypeChek of
      TC_STRETCH:if Not CheckSertif(FSumSertif) then Exit;
      TC_MOMBABY:if Not CheckSertif(FSumMomBaby) then Exit;
      TC_PILOT:if Not CheckPilot(FMedName) then Exit;
     end;
     sbBSkd.Down:=False;
     sbGoldG.Down:=False;
     sbRecipt.Down:=False;
     SetSkdMag(nil,False);
     DM.qrChek.Close;
     PayCount:=0;
     FChekOpened:=True;
     FIsOneRegCard:=True;
     try
      ShowCardRead;
     finally
      FIsOneRegCard:=Not sbCard.Down;
     end;
     ReopenChek;
     cbEKKA.Checked:=Not(UseEKKASafe);
     lbNumCard50.Visible:=False;
     StartCamera(CM_START);
    except
     on E:Exception do
      begin
       FChekOpened:=False;
       MessBox('Ошибка открытия чека: '+E.Message);
      end;
    end
   else else MessBox('У вас нет прав на эту операцию!');
 End; {OpenChek}

// Только очитска таблицы Chek и корректировка остатков в SprTov
procedure TMainF.ClearChekOnly(UserID:Integer);
 begin
  DM.spY_ClearChek.Close;
  DM.spY_ClearChek.Parameters.ParamValues['@iduser']:=Prm.UserID;
  DM.spY_ClearChek.ExecProc;
  if DM.spY_ClearChek.Parameters.ParamValues['@RETURN_VALUE']<>7654 then Abort;
{
  DM.Qr.SQL.Clear;
  DM.Qr.SQL.Add('update SprTov                                                    ');
  DM.Qr.SQL.Add('set Ostat=Ostat+a.kol                                            ');
  DM.Qr.SQL.Add('from Chek a,SprTov b                                             ');
  DM.Qr.SQL.Add('where a.kod_name=b.kod_name and a.id_user='+IntToStr(UserID)      );
  DM.Qr.SQL.Add('                                                                 ');
  DM.Qr.SQL.Add('delete from chek where id_user='+IntToStr(UserID)                 );
  DM.Qr.SQL.Add('delete from sertiftmp where id_user='+IntToStr(UserID)                 );
  DM.Qr.ExecSQL;
}
 end; {ClearChekOnly}

// Очистка чека
procedure TMainF.ClearChekFull(Param:Integer);

 procedure ShowCancelIndic;
 var i,j:Integer;
     S,ss:String;

  begin
   if Not(DM.qrChek.IsEmpty) then
    begin
     PlayWav(WV_CANCEL,0);
    end;

   TypeChek:=TC_MAIN;
   EKKA.fpStrToDisp('');
  end;

 procedure WriteCancelChek;
  begin
   if IsPermit([],P_SILENT) then Exit;
   try
    DM.Qr.Close;
    DM.Qr.SQL.Clear;
    DM.Qr.SQL.Add('Insert into CancelCheck(dt,kod_name,nm_s,kol,cena,kassa,id_user,priznak,skd,numcard)');
    DM.Qr.SQL.Add('select getdate(),');
    DM.Qr.SQL.Add('       kod_name,names,kol,cena,'+IntToStr(Opt.KassaID)+',id_user,1,skd,numcard');
    DM.Qr.SQL.Add('from Chek where compname=host_name() and id_user='+IntToStr(Prm.UserID));
    DM.Qr.ExecSQL;
   except
   end;
  end;

 Begin
  try
   EKKA.fpCancelFiscalReceipt;
   sbBSkd.Down:=False;
   sbGoldG.Down:=False;
   sbRecipt.Down:=False;
   ForReserve:=False;
   SetSkdMag(nil,False);
   if Param=CC_CANCEL then DM.ADOCo.BeginTrans;
   try
    if Param=CC_CANCEL then
     begin
      ShowCancelIndic;
      WriteCancelChek;
      ClearChekOnly(Prm.UserID);
      DM.ADOCo.CommitTrans;
     end;
    SetVisWhenChekOpened(False);
    DM.qrChek.Close;
   except
    if Param=CC_CANCEL then DM.ADOCo.RollbackTrans;
    MessBox('Ошибка отмены чека!');
   end;
  finally
   cbEKKA.Checked:=Not(UseEKKASafe);
   lbNumCard50.Visible:=False;
   StartCamera(CM_STOP);
   dbgSklad.SetFocus;
   if Param=CC_CANCEL then FilterSklad;
  end;
 End; {ClearChekFull}

// Отменяет чек
procedure TMainF.CancelChek(P:Byte=0);
 begin
  if Not (ChekOpened) then Exit;
  if (P=1) then
   if MessBox('Вы действительно хотите отменить чек?',52)<>ID_YES then Exit;
  ClearChekFull(CC_CANCEL);
 end; {CancelChek}

// Вызов пункта меню "Регистрация пользователя"
procedure TMainF.miUsersClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  if IsPermit([R_SUPER],P_ALERT) then
   try
    UsersF:=TUsersF.Create(Self);
    try
     UsersF.ShowModal;
    finally
     UsersF.Free;
    end;
   except
    MessBox(ER_CR_FORM,48);   
   end;
 end; {miUsersClick}

// Установка сортировки справочника товара
procedure TMainF.SetOrder(V:Integer);
 begin
  FSprOrder:=V;
  FilterSklad;
 end; {SetOrder}

// Проверка какой товар находиться в чеке ЧП или обычный
procedure TMainF.SetIsCHP;
 begin
  if DM.qrChek.Active then
   begin
    FIsCHP:=False;
    try
     DM.Qr5.Close;
     DM.Qr5.SQL.Text:='select Count(*) as cnt from Chek where f_nds>2 and compname=host_name() and id_user='+IntToStr(Prm.UserID)+' and art_code not in (select art_add from DtAkcii group by art_add)';
     DM.Qr5.Open;
     FIsCHP:=DM.Qr5.FieldByName('cnt').AsInteger>0;
{     if DM.qrChek.RecordCount>0 then
      if DM.qrChek.FieldByName('F_NDS').AsInteger in F_NDS_CHP then FIsCHP:=True;}
    except
    end
   end;
 end; {SetIsCHP}

function TMainF.IsCanRegMomBabyCard:Boolean;
 begin
  try
   DM.Qr5.Close;
   DM.Qr5.SQL.Text:='select Sum(kol*cena) as Sm from Chek where compname=host_name() and id_user='+IntToStr(Prm.UserID)+' and art_code in (select art_code from Bonuses) ';
   DM.Qr5.Open;
   Result:=DM.Qr5.FieldByName('Sm').AsFloat>=50;
  except
   Result:=False;
  end;
 end;

function TMainF.IsMomBabyCard(NumCard:Int64):Boolean;
 begin
  try
   DM.Qr5.Close;
   DM.Qr5.SQL.Text:='select * from MomBabyCards where NumCard='+IntToStr(NumCard);
   DM.Qr5.Open;
   Result:=Not DM.Qr5.IsEmpty;
  except
   Result:=False;
  end;
 end;

// Переоткрытие чека без try except - важно!!!!!!!!!!!!!
procedure TMainF.ReopenChek;
var Art_Code:Integer;

 procedure CalcSkd;
  begin
//   if Not (((FEnterKol=True) and (FSkdCAlced=False)) or (FEnterKol=False)) then Exit;
   SetMediCardSkd;

   DM.spY_CalcSKD.Close;
   DM.spY_CalcSKD.Parameters.ParamValues['@pid_user']:=Prm.UserID;
   DM.spY_CalcSKD.Parameters.ParamValues['@t_s']:=Type_Skd;
   DM.spY_CalcSKD.Parameters.ParamValues['@pskd']:=PercentSKD;

   if sbBSkd.Down then
    DM.spY_CalcSKD.Parameters.ParamValues['@bskd']:=2 else
   if sbGoldG.Down then
    DM.spY_CalcSKD.Parameters.ParamValues['@bskd']:=5
   else
    DM.spY_CalcSKD.Parameters.ParamValues['@bskd']:=0;

   DM.spY_CalcSKD.Parameters.ParamValues['@pnumcard']:=NumCard;
   if sbProf.Down then DM.spY_CalcSKD.Parameters.ParamValues['@profarma']:=1
                  else DM.spY_CalcSKD.Parameters.ParamValues['@profarma']:=0;
   if FSumPChek>0 then DM.spY_CalcSKD.Parameters.ParamValues['@SumP']:=FSumPChek
                  else DM.spY_CalcSKD.Parameters.ParamValues['@SumP']:=0;

   if sbMag.Down  then DM.spY_CalcSKD.Parameters.ParamValues['@ncMag']:=StrToInt(Copy(IntToStr(NumCardMag),1,3)) else
   if sbMediCard.Down then DM.spY_CalcSKD.Parameters.ParamValues['@ncMag']:=NumMediCard else
   if sbMDMU.Down or sbMDMU1.Down then DM.spY_CalcSKD.Parameters.ParamValues['@ncMag']:=NumMDMUCard
                  else DM.spY_CalcSKD.Parameters.ParamValues['@ncMag']:=-1;

   if (TypeChek=TC_MOMBABY) and (FSumMomBaby>0) then DM.spY_CalcSKD.Parameters.ParamValues['@SumBonus']:=FSumMomBaby
                                                else DM.spY_CalcSKD.Parameters.ParamValues['@SumBonus']:=0;

   if TypeChek=TC_PILOT then DM.spY_CalcSKD.Parameters.ParamValues['@MedName']:=FMedName
                        else DM.spY_CalcSKD.Parameters.ParamValues['@MedName']:='';
   DM.spY_CalcSKD.Open;
   FSumSkd:=DM.spY_CalcSKD.FieldByName('Skd').AsFloat;
   SumChek:=DM.spY_CalcSKD.FieldByName('Sm').AsFloat;
   DM.spY_CalcSKD.Close;
//   if FEnterKol=True then FSkdCalced:=True;
  end;

 Begin
  try
   Art_Code:=-1;
   if DM.qrChek.Active then
    begin
     Art_Code:=DM.qrChek.FieldByName('Art_Code').AsInteger;
     DM.qrChek.Close;
    end;
   CalcSkd;
   if ((SumChek>=Prm.SumSkd) or (IsCanRegMomBabyCard)) and (FIsOneRegCard) then
    begin
     FIsOneRegCard:=False;
     try
      sbCard.Tag:=1;
      SwitchSkd(sbCard,miCardSkd);
     finally
      sbCard.Tag:=0;
     end;
     CalcSkd;
    end;
//   if (SumChek<Prm.SumSkd) and (IsRegCard) then FIsOneRegCard:=True;
   DM.qrChek.Open;
   ChekEmpty:=DM.qrChek.IsEmpty;
   lbCheck.Caption:='';
   SetIsCHP;
   if Art_Code<>-1 then DM.qrChek.Locate('Art_Code',Art_Code,[]);
   SetVisWhenChekOpened(True);
  finally
   if Not (DM.qrChek.Active) then Abort;
  end;
 End; {ReopenChek}

// Обновление чека
procedure TMainF.RefreshChek;
 begin
  if ChekOpened then
   try
    ReopenChek;
   except
    on E:Exception do
     begin
      btnPayCash.Enabled:=False;
      btnPayChek.Enabled:=False;
      MessBox('Ошибка доступа к чеку: '+E.Message);
     end;
   end;
 end; {RefreshChek}

procedure TMainF.ShowCountCards;
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select Sum(Ostat) as Sm from SprTov where art_code=1';
   DM.Qr.Open;
   lbCountCards.Caption:=' Дисконтных карт: '+DM.Qr.FieldByName('Sm').AsString;
  except
  end;
 end;

// Установка показа товаров согласно выбранного типа и сортировки
procedure TMainF.FilterSklad;
var sZero:Integer;
    Art_Code,Art_Code1,i:Integer;
 begin
  try
   lbSearch.Caption:='';
   Art_Code:=-1;
   Art_Code1:=-1;
   for i:=0 to dbgSklad.Columns.Count-1 do dbgSklad.Columns[i].Title.Font.Color:=clNavy;
   sZero:=-1;
   if (cbBoxZero.Checked) then sZero:=0;
   if Prm.RealizMinus then sZero:=-1000000000;
   if DM.spY_FilterSklad.Active then
    begin
     Art_Code:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;
     DM.spY_FilterSklad.Prior;
     Art_Code1:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;
     DM.spY_FilterSklad.Next;
     DM.spY_FilterSklad.Close;
    end;
   DM.spY_FilterSklad.Parameters.ParamValues['@ptov']:=GroupIndex;
   DM.spY_FilterSklad.Parameters.ParamValues['@pzero']:=sZero;
   DM.spY_FilterSklad.Parameters.ParamValues['@porder']:=SprOrder;
   Case SprOrder of
    O_ART_CODE:dbgSklad.Columns[0].Title.Font.Color:=clRed;
    O_NAMES   :dbgSklad.Columns[2].Title.Font.Color:=clRed;
   end;

   DM.spY_FilterSklad.Open;
   if Art_Code<>-1 then
    if Not DM.spY_FilterSklad.Locate('Art_Code',Art_Code,[]) then
     DM.spY_FilterSklad.Locate('Art_Code',Art_Code1,[]);
   ShowCountCards;
   if dbgSklad.Visible then dbgSklad.SetFocus;
  except
   try
    DM.ADOCo.Connected:=False;
    DM.ADOCo.Connected:=True;
   except
    MessBox('Ошибка доступа к справочнику товаров');
   end;
  end
 end; {FilterSklad}

// Вызов пункта меню "Выход"
procedure TMainF.miExitClick(Sender:TObject); begin Close; end; {miExitClick}

// Вкл/выкл режим > 0
procedure TMainF.cbBoxZeroClick(Sender:TObject); begin FilterSklad; end; {cbBoxZeroClick}

// Обработка переключения главных закладок
procedure TMainF.pcMainChange(Sender:TObject);
 begin
  if pcMain.ActivePage=TabSale then dbgSklad.SetFocus;
 end; {pcMainChange}

// Устновка типа товара
procedure TMainF.SetType_Tov(V:Integer);
var i:Integer;
 begin
  for i:=Low(FGroups) to High(FGroups) do if FGroups[i].Tag=V then begin FGroups[i].Checked:=True; Break; end;
 end; {SetType_Tov}

// Реализация событий ActionList1 ----------------------------------------------
procedure TMainF.SetOrderArt_CodeExecute(Sender:TObject); begin SprOrder:=O_ART_CODE; end;
procedure TMainF.SetOrderNamesExecute(Sender:TObject); begin SprOrder:=O_NAMES; end;
procedure TMainF.SetGroup1Execute(Sender:TObject); begin SetType_Tov(1); end;
procedure TMainF.SetGroup2Execute(Sender:TObject); begin SetType_Tov(2); end;
procedure TMainF.SetGroup3Execute(Sender:TObject); begin SetType_Tov(3); end;
procedure TMainF.SetGroup4Execute(Sender:TObject); begin SetType_Tov(4); end;
procedure TMainF.SetGroup5Execute(Sender:TObject); begin SetType_Tov(5); end;
//------------------------------------------------------------------------------

// Поиск препаратов по Штрих-Коду
function TMainF.FindEAN13(db:TDBGrid; EAN13:String; P,Kol:Integer; var IsFind:Boolean):String;
var sq:String;
    AC:Integer;

 procedure FindInSklad(B:Boolean);
  begin
   DM.Qr1.Close;
   DM.Qr1.SQL.Text:='select Max(IsNull(type_tov,0)) as tt from SprTov where art_code='+IntToStr(AC);
   DM.Qr1.Open;
   if P<>SC_FIND then if DM.Qr1.RecordCount>0 then SetType_Tov(DM.Qr1.FieldByName('tt').AsInteger);
   if db.DataSource.DataSet.Locate('ART_CODE',AnsiUpperCase(IntToStr(AC)),[loCaseInsensitive,loPartialKey]) then
    begin
     if B then PrevEnterKol(EK_SCAN) else IsFind:=True;
    end;
  end;

 procedure FindInChek;
  begin
   if Not (db.DataSource.DataSet.Active) then Exit;
   if db.DataSource.DataSet.RecordCount<=0 then Exit;
   db.Visible:=False;
   try
    DM.Qr1.Close;
    DM.Qr1.SQL.Clear;
    DM.Qr1.SQL.Add('update Chek set printing=1 ');
    DM.Qr1.SQL.Add('where art_Code='+IntToStr(AC));
    DM.Qr1.SQL.Add(' and compname=host_name() and id_user='+IntToStr(Prm.UserID));
    DM.Qr1.ExecSQL;
   finally
    db.Visible:=True;
    RefreshChek;
    db.DataSource.DataSet.Locate('ART_CODE',AC,[loCaseInsensitive,loPartialKey]);
    db.SetFocus;
   end;
  end;

 procedure ScanNakl;
  begin
   IsFind:=db.DataSource.DataSet.Locate('ART_CODE',AC,[loCaseInsensitive,loPartialKey]);
  end;

 Begin
  try
   IsFind:=False;
   if Length(EAN13)>13 then Abort;
{
   if P in [SC_SKLAD,SC_CHEK] then
    if Length(EAN13)=13 then
     if (Copy(EAN13,1,5)='55555') and ((Copy(EAN13,1,12)<>'555550000024') and (Copy(EAN13,1,12)<>'555550000028')) then
      begin

       lbNumCard50.Caption:=Copy(EAN13,6,7);
       IsSkd50:=Not(IsSkd50);
       Exit;
      end;
}
   DM.Qr.Close;
   Case P of
    SC_SKLAD:sq:='select art_code from sprtov where ostat>0';
    SC_FIND:sq:='select art_code from sprtov where ostat>'+IntToStr(Kol-1);
    SC_CHEK:sq:='select b.art_code from sprtov a, chek b where a.kod_name=b.kod_name';
    SC_SCNAKL:sq:='select art_code from TmpNakl ';
    SC_TMPSPIS:sq:='select art_code from Inform..Tmp_Spis where compname=host_name() and id_user='+IntToStr(Prm.UserID);
   end;
   DM.Qr.SQL.Text:='select IsNull(Max(Art_code),-1) as Art_Code from SprEAN where EAN13='''+EAN13+''' and art_code in ('+sq+')';
   DM.Qr.Open;
   AC:=DM.Qr.FieldByName('Art_Code').AsInteger;
   if AC<>-1 then
    Case P of
     SC_SKLAD:FindInSklad(True);
     SC_FIND:FindInSklad(False);
     SC_CHEK:FindInChek;
     SC_SCNAKL,SC_TMPSPIS:ScanNakl;
    end;
   if Length(EAN13)=13 then
    begin
     if (AC=-1) and (P=SC_CHEK) then MessBox('Позиции с штрих-кодом '+EAN13+' в чеке нет!');
     Abort;
    end;
   Result:=EAN13;
  except
   Result:='';
  end;
 End; {FindEAN13}

// Проверка строки на наличие хоть одного нецифрового символа
function TMainF.CheckStrNum(S:String):Boolean;
var i:Integer;
 begin
  try
   for i:=1 to Length(S) do
    if Not (S[i] in CH_DIGIT) then Abort;
   Result:=True;
  except
   Result:=False;
  end;
 end; {CheckStrNum}

// Поиск в dbGrid вручную и со сканера
procedure TMainF.dbGKeyPress(db:TDBGrid; var Key:Char; var sSr:String; Order,P,Kol:Integer; var IsFind:Boolean);
var S:String;
 begin
  IsFind:=False;
  Case Order of
   O_ART_CODE:begin
               sSr:=sSr+Key;
               if Key in CH_DIGIT then
                if Length(sSr)<8 then
                 db.DataSource.DataSet.Locate('ART_CODE',AnsiUpperCase(sSr),[loCaseInsensitive,loPartialKey])
                else
                 sSr:=FindEAN13(db,sSr,P,Kol,IsFind);
              end;
   O_NAMES:begin
            S:=AnsiUpperCase(sSr+Key);
            if Key in CH_ANSI then
             if CheckStrNum(S)=False then
              begin
               if db.DataSource.DataSet.Locate('NAMES',AnsiLowerCase(S),[loCaseInsensitive,loPartialKey]) then
                sSr:=S;
              end else sSr:=FindEAN13(db,S,P,Kol,IsFind);
           end;
  end;
 end; {dbGKeyPress}
 
// Организация поиска ввводом из клавиатуры или со сканера
procedure TMainF.dbgSkladKeyPress(Sender:TObject; var Key:Char);
var S:String;
    IsFind:Boolean;
 begin
  if Sender=Nil then Exit;
  S:=lbSearch.Caption;
  dbGKeyPress(TDBGrid(Sender),Key,S,SprOrder,SC_SKLAD,1,IsFind);
  lbSearch.Caption:=S;
 end; {dbgSkladKeyPress}

// Обработка нажатий клавиш в окне справочника товаров
procedure TMainF.dbgSkladKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key in K_ARROW_KEYS then lbSearch.Caption:='';
  if Key=VK_RETURN then PrevEnterKol(EK_DIALOG);
 end; {dbgSkladKeyDown}

// Ввод количества с диалога
function TMainF.GetKolFromDialog(Nm:String; DefKol:Integer; var Art_Code:Integer; P:Byte; Koef:Integer=0; Upak:Integer=0):Integer;
var Kol,K:Integer;
 begin
  try
   Result:=-1;
   Kol:=0;
   EnterKolF:=TEnterKolF.Create(Self);
   try
    EnterKolF.Art_Code:=Art_Code;
    EnterKolF.lbName.Caption:=Nm;
    EnterKolF.lbAlert.Visible:=False;
    if (Koef>1) or (Upak>1) then
     begin
      if (Koef=1) and (Upak>1) then K:=Upak else K:=Koef;
      EnterKolF.lbAlert.Visible:=True;
      EnterKolF.lbAlert.Caption:='Препарат делится! Будьте внимательны! В уп. - '+IntToStr(K)+' шт.';
     end;
{    DM.Qr7.Close;
    DM.Qr7.SQL.Text:='select kol from SprKol where art_code='+IntToStr(art_code);
    DM.Qr7.Open;
//    EnterKolF.UpDown1.Min:=0;
    if (P<>EN_SIMPLE) and (DM.Qr7.IsEmpty) and Not (Prm.AptekaID in [12,78,72,43,20]) and (Prm.FirmID<>5) then EnterKolF.UpDown1.Min:=DefKol;
}
    EnterKolF.UpDown1.Position:=DefKol;
    EnterKolF.Param:=P;
    EnterKolF.ShowModal;
    if EnterKolF.ModalResult<>mrOK then begin Kol:=-1; Exit; end;
    Art_Code:=EnterKolF.Art_Code;
    Kol:=EnterKolF.UpDown1.Position;
   finally
    Result:=Kol;
    EnterKolF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
   Result:=0;
  end;
 end; {GetKolFromDialog}

// Отображает информацию о препарате если он находиться на ПКУ
procedure TMainF.ShowPKUInfo(Art_Code:Integer; P:Byte=0);
 begin
  if P=0 then
   try
    DM.Qr.Close;
    DM.Qr.SQL.Text:='select * from SprPKU where art_code='+IntToStr(Art_Code);
    DM.Qr.Open;
    if DM.Qr.IsEmpty then Exit;
    DM.Qr1.Close;
    DM.Qr1.SQL.Text:='select names from SprTov where art_code='+IntToStr(Art_Code);
    DM.Qr1.Open;
    InfoPKUF:=TInfoPKUF.Create(Self);
    try
     InfoPKUF.lbName.Caption:=DM.Qr1.FieldByName('Names').AsString;
     if DM.Qr.FieldByName('Descr').AsString<>'' then
      begin
       InfoPKUF.lbCap.Visible:=True;
       InfoPKUF.lbKol.Visible:=True;
       InfoPKUF.lbKol.Caption:=DM.Qr.FieldByName('Descr').AsString;
      end else InfoPKUF.Height:=563;
     InfoPKUF.ShowModal;
    finally
     InfoPKUF.Free;
    end;
   except
   end else
  if P=1 then
   try
    DM.Qr.Close;
    DM.Qr.SQL.Text:='select * from SprRecOnly a, SprTov b where a.art_code=b.art_code and a.art_code='+IntToStr(Art_Code);
    DM.Qr.Open;
    if DM.Qr.IsEmpty then Exit;
    ShowRecOnlyF:=TShowRecOnlyF.Create(Self);
    try
     ShowRecOnlyF.ShowModal;
    finally
     ShowRecOnlyF.Free;
    end;
   except
   end;
 end; {ShowPKUInfo}

// Определение сопутствующих препаратов
function TMainF.GetKolArtAdd(Art_Code:Integer; var KolAdd,ArtAdd:Integer; P:Integer=0):Boolean;
 begin
  Result:=False;
  try
   DM.qrArtAdd.Close;
   DM.qrArtAdd.SQL.Clear;

   if P=0 then
    begin
     DM.qrArtAdd.SQL.Add('select IsNull((select top 1 Descr from Inform..SprDopDescr c where c.id_descr=Max(b.id_descr)),'''') as descr,a.art_code,a.names,Sum(a.Ostat) as Ostat, Max(a.Cena) as Cena,');
     DM.qrArtAdd.SQL.Add('(select top 1  art_name from SprTov s1 where s1.art_Code='+IntToStr(Art_Code)+') as art_name');
     DM.qrArtAdd.SQL.Add('from SprTov a, Inform..SprDop b, Inform..SprDop b1, SprITC c');
     DM.qrArtAdd.SQL.Add('where a.ostat>0 and c.art_code=a.art_code and b.art_code=b1.art_map and b.forma=b1.forma_map and c.itc=b.art_map and b.art_code in (select itc from SprITC where art_code='+IntToStr(Art_Code)+')');
     DM.qrArtAdd.SQL.Add('group by a.art_code,a.names');
     DM.qrArtAdd.SQL.Add('order by a.names');
    end else
   if (P>700000) and (P<799999) then
    begin
     DM.qrArtAdd.SQL.Add('select '''' as descr,b.art_add as art_code,a.names,Sum(a.Ostat) as Ostat, Max(a.Cena) as Cena');
     DM.qrArtAdd.SQL.Add('from SprTov a, DtAkcii b');
     DM.qrArtAdd.SQL.Add('where a.ostat>0 and a.art_code=b.art_add and b.id_akcii='+IntToStr(P-700000));
     DM.qrArtAdd.SQL.Add('group by b.art_add,a.names');
     DM.qrArtAdd.SQL.Add('order by a.names');
    end;
   DM.qrArtAdd.SQL.SaveToFile('C:\456.sql'); 
   DM.qrArtAdd.Open;
   if DM.qrArtAdd.IsEmpty then Exit;
   SpisArtAddF:=TSpisArtAddF.Create(Self);
   try
    SpisArtAddF.Param:=P;
    if (P>700000) and (P<799999) then
     SpisArtAddF.Label1.Caption:='Ув. провизоры, выберите в качестве подарка покупателю любой товар из ниже перечисленного списка' else
    if DM.qrArtAdd.FieldByName('Descr').AsString<>'' then
     SpisArtAddF.Label1.Caption:=StringReplace(DM.qrArtAdd.FieldByName('Descr').AsString,'$$$',DM.qrArtAdd.FieldByName('art_name').AsString,[rfIgnoreCase]);

    if (DM.qrArtAdd.RecordCount>1)  or (P=0) then
     begin
      SpisArtAddF.ShowModal;
      KolAdd:=SpisArtAddF.Kol;
      ArtAdd:=SpisArtAddF.Art_Code;
      Result:=SpisArtAddF.Flag=1;
     end else begin
               KolAdd:=1;
               ArtAdd:=DM.qrArtAdd.FieldByName('art_code').AsInteger;
               Result:=True;
              end;
   finally
    SpisArtAddF.Free;
   end;
  except
   on E:Exception do
    begin
     Result:=False;
     MessBox(ER_CR_FORM+': '+E.Message);
    end; 
  end;
 end; {GetKolArtAdd}

function TMainF.CheckOnlyRecipt(Art_Code:Integer; Names:String; Kol:Integer):Boolean;
 begin
  Result:=True;
  if FIsChSeria then Exit;
  if Not ((Art_code=45889) or (Art_code=39660) or (Art_code=39659)) then Exit;
  try
   Result:=False;
   BlankReciptF:=TBlankReciptF.Create(Self);
   try
    BlankReciptF.Kol:=Kol;
    BlankReciptF.Names:=Names;
    BlankReciptF.ShowModal;
    if BlankReciptF.Flag<>1 then Abort;
    Result:=True;
   finally
    BlankReciptF.Free;
   end;
  except
   Result:=False;
   MessBox('Необходимо заполнить форму рецепта!');
  end;
 end;

function TMainF.CheckKolUpak(Kol:Integer; var S:String):Boolean;
 begin
  try
   if (Kol>200) and (Kol<=299) then
    begin
     S:='                                               Внимание!!!! '+#10#10+
        'Вы можете отпустить покупателю только '+IntToStr(Kol-200)+' упаковк(ки) данного препарата!!!';
     Abort;
    end;
   Result:=True;
  except
   Result:=False;
  end;
 end;

function TMainF.GetMDMSkd(AC:Integer; Upak:Integer; Kol,Cena:Currency):Real;
var ss,s:String;
    sr,sr1:TStringStream;
 begin
  try
   if CheckTypeMDMU<>2 then Abort;

   DM.Qr8.Close;
   DM.Qr8.SQL.Text:='select * from SprMDM221 where art_code='+IntToStr(AC);
   DM.Qr8.Open;
   if DM.Qr8.IsEmpty then Exit;

   HTTPRR.URL:='http://exim.demo.mdmworld.com/CardService.asmx';

   s:='<?xml version="1.0" encoding="utf-8"?> '+#10+
      '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> '+#10+
      '  <soap:Body>                                              '+#10+
      '    <checkCardSale xmlns="http://tempuri.org/">            '+#10+
      '      <aSaleList>                                          '+#10+
      '        <CardCheckItem>                                    '+#10+
      '          <MdmCode>'+IntToStr(NumMDMUCard)+'</MdmCode>     '+#10+
      '          <ProductFormCode>'+DM.Qr8.FieldByName('EAN13').AsString+'</ProductFormCode>        '+#10+
      '          <SaleType>1</SaleType>                      '+#10+
      '          <RequestedPrice>'+CurrToStr(Cena*Upak)+'</RequestedPrice>         '+#10+
      '          <RequestedQuantity>'+CurrToStrF(Kol/Upak,ffFixed,2)+'</RequestedQuantity>   '+#10+
      '          <RequestedAmount>'+CurrToStr((Cena*Upak)*StrToCurr(CurrToStrF(Kol/Upak,ffFixed,2)))+'</RequestedAmount>       '+#10+
      '        </CardCheckItem>                                   '+#10+
      '      </aSaleList>                                         '+#10+
      '      <aLoginName>TEST_APTEKA911</aLoginName>                      '+#10+
      '      <aLoginPassword>pass</aLoginPassword>              '+#10+
      '    </checkCardSale>                                       '+#10+
      '  </soap:Body>                                             '+#10+
      '</soap:Envelope>                                           ';

   HTTPRR.SoapAction:='http://tempuri.org/checkCardSale';

   sR:=TStringStream.Create(s);
   sR1:=TStringStream.Create('');
   try

    DM.Qr6.SQL.Text:=sR.DataString; DM.Qr6.SQL.SaveToFile('C:\Sr_.txt');
    HTTPRR.Execute(sR,sR1);
    DM.Qr6.SQL.Text:=Utf8ToAnsi(sR1.DataString); DM.Qr6.SQL.SaveToFile('C:\Sr_1.txt');
    ss:=GetValueFromXML('ResultStatus',sR1.DataString);
    if ss<>'0' then
     begin
      MessBox(GetValueFromXML('ResultDescription',sR1.DataString));
      Abort;
     end else begin
               //Result:=StrToInt(GetValueFromXML('ResultDiscountPercent',sR1.DataString));
               DM.Qr8.Close;
               DM.Qr8.SQL.Text:='select 100-convert(numeric(8,2),100*cena/'+CurrToStr(Cena*Upak)+') as skd  from MDMU221 where art_code='+IntToStr(AC)+' and Type_Card='+IntToStr(MDMU221TypeCard);
               DM.Qr8.Open;
               if DM.Qr8.IsEmpty then Abort;
               Result:=DM.Qr8.FieldByName('skd').AsFloat;
              end;
{
 if AnsiLowerCase(ss)='card code doesn''t exist' then raise EAbort.Create('Карточка не существует!');
}
//    Result:=True;
   finally
    sR.Free;
    sR1.Free;
   end;

  except
   Result:=0;
   sbMDMU1.Down:=False;
   NumMDMUCard:=-1;
  end;
 end;

{   if CheckTypeMDMU=2 then
    begin
     s1:='checkCardResult';
     HTTPRR.URL:='http://exim.demo.mdmworld.com/CardService.asmx';
     s:='<?xml version="1.0" encoding="utf-8"?> '+#10+
        '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> '+#10+
        '  <soap:Body>                                   '+#10+
        '    <checkCard xmlns="http://tempuri.org/">     '+#10+
        '      <aMdmCode>'+IntToStr(NumMDMUCard)+'</aMdmCode>               '+#10+
        '      <aLoginName>TEST_APTEKA911</aLoginName>           '+#10+
        '      <aLoginPassword>pass</aLoginPassword>   '+#10+
        '    </checkCard>                                '+#10+
        '  </soap:Body>                                  '+#10+
        '</soap:Envelope>                                ';
     HTTPRR.SoapAction:='http://tempuri.org/checkCard';
    end;

   sR:=TStringStream.Create(s);
   sR1:=TStringStream.Create('');
   try

    DM.Qr6.SQL.Text:=sR.DataString; DM.Qr6.SQL.SaveToFile('C:\Sr_.txt');
    HTTPRR.Execute(sR,sR1);
    DM.Qr6.SQL.Text:=sR1.DataString; DM.Qr6.SQL.SaveToFile('C:\Sr_1.txt');
    ss:=GetValueFromXML(s1,sR1.DataString);
    if AnsiLowerCase(ss)='card code doesn''t exist' then raise EAbort.Create('Карточка не существует!');
    Result:=True;
   finally
    sR.Free;
    sR1.Free;
   end;
}
// Запрос на ввод количества единиц товара со всеми предварительными и пост-проверками
procedure TMainF.PrevEnterKol(Param:Integer; IsFirstRec:Byte=0);
var P,KolD,i,Upak,Koef,Koef1,Kol,KolAdd,ArtAdd,Art_Code,Art_CodeSafe,Old_Art,F_NDS,Type_Map:Integer;
    T:TDateTime;
    erStr:String;

 // Определение совместимости товаров ЧП или не ЧП
 function CheckComp:Boolean;
  begin
   if DM.qrChek.IsEmpty then Result:=True else
    begin
     Result:=False;
     if IsCHP then
      begin
       if Not (F_NDS in F_NDS_CHP) then MessBox('Нельзя добавить в чек товар не ЧП!')
                                   else Result:=True;
      end else begin
                if F_NDS in F_NDS_CHP then MessBox('Нельзя добавить в чек товар ЧП!')
                                      else Result:=True;
               end;
    end;
  end;

 function KolArtAdd(P:Integer=0):Boolean;
  begin
   Result:=False;
   if TypeChek=TC_BACK then Exit;
   KolAdd:=0;
   if Kol>0 then Result:=GetKolArtAdd(Art_CodeSafe,KolAdd,ArtAdd,P);
   if Old_Art<>Art_Code then
    try
     Type_Map:=1;
     DM.Qr1.Close;
     DM.Qr1.SQL.Text:='select * from NoScan where art_code='+IntToStr(Art_Code);
     DM.Qr1.Open;
     if DM.Qr1.IsEmpty then Abort;
     Param:=1;
    except
     Param:=0;
    end;
  end;

 procedure GetZamPrep(var Art_code:Integer);
  begin
{
  try
    DM.qrZamPrep.Close;
    DM.qrZamPrep.SQL.Clear;
    DM.qrZamPrep.SQL.Add('select z.art_code,s.names,Sum(s.ostat) as kol,s.cena,z.pr                           ');
    DM.qrZamPrep.SQL.Add('from SprZamPrem z,                                                                  ');
    DM.qrZamPrep.SQL.Add('     SprTov s                                                                       ');
    DM.qrZamPrep.SQL.Add('where z.art_code=s.art_code and z.atc in (select itc from SprITC where art_code='+IntToStr(art_code)+') ');
    DM.qrZamPrep.SQL.Add('group by z.art_code,s.names,s.cena,z.pr ');
    DM.qrZamPrep.SQL.Add('order by 2 ');
    DM.qrZamPrep.Open;
    if DM.qrZamPrep.IsEmpty then Exit;
    FirstRecF:=TFirstRecF.Create(Self);
     try
      FirstRecF.ShowModal;
      if FirstRecF.Flag=1 then Art_Code:=DM.qrZamPrep.FieldByName('art_code').AsInteger;
     finally
      FirstRecF.Free;
     end;
   except
   end;
}
  end;

 Begin
  try
   FEnterKol:=True;
   FSkdCalced:=False;
   T:=Time;
   Type_Map:=0;
   if Not (IsPermit([R_SUPER,R_KASSIR,R_OPER],P_ALERT)) then Exit;
   Art_Code:=DM.spY_FilterSklad.FieldByName('ART_CODE').AsInteger;
   Art_CodeSafe:=Art_Code;
   if TypeChek=TC_BACK then KolD:=EN_SIMPLE else KolD:=EN_PODBOR;
   if (Param=0) and (GroupIndex=99) and (TypeChek<>TC_BACK) then
    begin
     MessBox('Товары этой группы можно добавлять в чек только путем сканирования!');
     Exit;
    end;
   if Art_Code<=0 then begin MessBox('Нулевой "Код"!'); Exit; end;
   if High(FArtCodeList)>Art_code then
    if FArtCodeList[Art_Code].ArtAdd=1 then begin MessBox('Этот препарат в чек добавить нельзя!'); Exit; end;
   F_NDS:=DM.spY_FilterSklad.FieldByName('F_NDS').AsInteger;
{
AppendStringToFile('C:\111.txt','1. '+IntToStr(MilliSecondsBetween(T,Time)));
T:=Time;
}
   DM.Qr.Close;
   if CheckComp then
    begin
{
AppendStringToFile('C:\111.txt','2. '+IntToStr(MilliSecondsBetween(T,Time)));
T:=Time;
}
     Old_Art:=Art_Code;
     Koef:=0;
     try
      DM.Qr1.Close;
      DM.Qr1.SQL.Text:='select * from Inform..SprKoef where art_code='+IntToStr(Art_Code);
      DM.Qr1.Open;
      if DM.Qr1.IsEmpty then Abort;

      Upak:=DM.Qr1.FieldByName('Upak').AsInteger;
      Koef1:=DM.Qr1.FieldByName('Koef').AsInteger;

      Kol:=GetKoef(DM.Qr1.FieldByName('Koef').AsInteger,DM.Qr1.FieldByName('Upak').AsInteger);
      Kol:=DM.Qr1.FieldByName('Koef').AsInteger;
      Koef:=Kol;
      if Kol<=1 then Abort;
      if Kol>DM.spY_FilterSklad.FieldByName('OSTAT').AsInteger then Kol:=DM.spY_FilterSklad.FieldByName('OSTAT').AsInteger;
{
 AppendStringToFile('C:\111.txt','3. '+IntToStr(MilliSecondsBetween(T,Time)));
 T:=Time;
}
     except
      Kol:=0;
     end;
     if Kol=0 then Kol:=1;
     if FIsChSeria then
      begin
       Kol:=Random(5)+1;
       if Kol>DM.spY_FilterSklad.FieldByName('OSTAT').AsInteger then Kol:=DM.spY_FilterSklad.FieldByName('OSTAT').AsInteger;
      end else Kol:=GetKolFromDialog(DM.spY_FilterSklad.FieldByName('Names').AsString,Kol,Art_Code,KolD,Koef,DM.Qr1.FieldByName('Upak').AsInteger);
{
AppendStringToFile('C:\111.txt','4. '+IntToStr(MilliSecondsBetween(T,Time)));
T:=Time;
}    if Art_code=Old_Art then GetZamPrep(Art_code);

     if Kol<=0 then Exit;
     if Art_Code<=0 then begin MessBox('Нулевой "Код"!'); Exit; end;
     if Not CheckOnlyRecipt(Art_Code,DM.spY_FilterSklad.FieldByName('Names').AsString,Kol) then Abort;

     ShowPKUInfo(Art_Code);
     ShowPKUInfo(Art_Code,1);
{
AppendStringToFile('C:\111.txt','7. '+IntToStr(MilliSecondsBetween(T,Time)));
T:=Time;
}    P:=0;
     for i:=1 to 100000 do
      begin
       if i>1 then
        begin
         if Not KolArtAdd(P) then Break;
         if KolAdd<=0 then Continue else
          begin
           Type_Map:=2;
           Kol:=KolAdd;
           if i>2 then Old_Art:=Art_CodeSafe;
           Art_code:=ArtAdd;
          end;
        end;
       try
        DM.spY_EnterKol.Parameters.ParamValues['@part_code']:=Art_code;
        DM.spY_EnterKol.Parameters.ParamValues['@pold_art']:=Old_Art;
        DM.spY_EnterKol.Parameters.ParamValues['@pkol']:=Kol;
        DM.spY_EnterKol.Parameters.ParamValues['@piduser']:=Prm.UserID;
        DM.spY_EnterKol.Parameters.ParamValues['@ptm']:=Type_map;
        DM.spY_EnterKol.Parameters.ParamValues['@fr']:=IsFirstRec;
        DM.spY_EnterKol.Parameters.ParamValues['@MDMSkd']:=GetMDMSkd(Art_code,Koef1,Kol,DM.spY_FilterSklad.FieldByName('Cena').AsFloat);

        if (FTypeChek=TC_BACK) or ((P>700000) and (P<799999))  then
         begin
          DM.spY_EnterKol.Parameters.ParamValues['@simp']:=1;
          P:=0;
         end else DM.spY_EnterKol.Parameters.ParamValues['@simp']:=0;
        Case i of
         1:begin
            if DM.spY_FilterSklad.FieldByName('IsScan').AsInteger<>0 then
             DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=1
            else
             DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=Param;
           end;
         2:DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=-1;
        end;

       DM.ADOCo.BeginTrans;
        try
         DM.spY_EnterKol.ExecProc;

         if (DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']>700000) and (DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']<799999) then
          P:=DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE'] else

         if DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']=21 then
          raise EAbort.Create('Введеное количество превышает остаток склада'+#10+'Или товар забрал другой оператор либо товар находиться в спике забронированных!') else

         if DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']=25 then
          raise EAbort.Create('В чеке недостаточное количество "Сертификатов" для ввода данного препарата!');

         if Not CheckKolUpak(DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE'],erStr) then raise EAbort.Create(erStr);

        DM.ADOCo.CommitTrans;
{
AppendStringToFile('C:\111.txt','8. '+IntToStr(MilliSecondsBetween(T,Time)));
T:=Time;
}
         if Not ChekOpened then begin TypeChek:=TC_MAIN; OpenChek; end;
{         Util
AppendStringToFile('C:\111.txt','9. '+IntToStr(MilliSecondsBetween(T,Time)));
T:=Time;
}
        except
         on E:EAbort do
          begin
           DM.ADOCo.RollbackTrans;
           MessBox(E.Message);
          end else DM.ADOCo.RollbackTrans;
        end;
      finally
       FilterSklad;
{
AppendStringToFile('C:\111.txt','10. '+IntToStr(MilliSecondsBetween(T,Time)));
T:=Time;
}
       RefreshChek;
{
AppendStringToFile('C:\111.txt','11. '+IntToStr(MilliSecondsBetween(T,Time)));
T:=Time;
}
      end;
     end;
    end;
//  ShowMessage(IntToStr(MilliSecondsBetween(T,Time)));
  finally
   FEnterKol:=False;
   FSkdCalced:=False;
  end;
 End; {PrevEnterKol}

// Ввод количества товара в Чеке
procedure TMainF.PrevDelKol;
var Res,Kol,Art_Code,AC:Integer;
    erStr:String;
 begin
  if ChekOpened then
   begin
    Res:=0;
    AC:=0;
    Art_Code:=DM.qrChek.FieldByName('Art_Code').AsInteger;
    if Art_Code<=0 then begin MessBox('Нулевой "Код"!'); Exit; end;
    if High(FArtCodeList)>Art_code then
     if FArtCodeList[Art_Code].ArtAdd=1 then begin MessBox('Этот препарат в чеке редактировать нельзя!'); Exit; end;

    Kol:=GetKolFromDialog(DM.qrChek.FieldByName('Names').AsString,DM.qrChek.FieldByName('Kol').AsInteger,AC,EN_SIMPLE);
    if Kol<0 then Exit;
    if (Kol=0) and ((art_code=80237) or (art_code=38526) or (art_code=81858)) then
     if MessBox('ОБЯЗАТЕЛЬНО уточните у покупателя нужен ли ему пакет!!!!!!!'#10#10'Контроль покупки пакетов ведет тайный покупатель, если вы не предложите ему пакет - штраф 100 грн.',52)=ID_YES then Exit;
    try
     DM.spY_DelKol.Parameters.ParamValues['@part_code']:=Art_Code;
     DM.spY_DelKol.Parameters.ParamValues['@pkol']:=Kol;
     DM.spY_DelKol.Parameters.ParamValues['@piduser']:=Prm.UserID;
     DM.spY_DelKol.Parameters.ParamValues['@id_kassa']:=Opt.KassaID;
     if FTypeChek=TC_BACK then DM.spY_DelKol.Parameters.ParamValues['@simp']:=1
                          else DM.spY_DelKol.Parameters.ParamValues['@simp']:=0;

     DM.ADOCo.BeginTrans;
     try
      DM.spY_DelKol.ExecProc;
      Res:=DM.spY_DelKol.Parameters.ParamValues['@RETURN_VALUE'];
      if Res=21 then
       raise EAbort.Create('Введеное количество превышает остаток склада'+#10+'Или товар забрал другой оператор!') else

      if Res=25 then
       raise EAbort.Create('В чеке недостаточное количество "Сертификатов" для ввода данного препарата!');

      if Not CheckKolUpak(Res,erStr) then raise EAbort.Create(erStr);
      DM.ADOCo.CommitTrans;
     except
      on E:EAbort do
       begin
        DM.ADOCo.RollbackTrans;
        MessBox(E.Message);
       end else DM.ADOCo.RollbackTrans;
     end;
    finally
     FilterSklad;
     if Res=22 then ClearChekFull(CC_CANCEL) else
      begin
       RefreshChek;
       dbgChek.SetFocus;
      end;
    end;
   end;
 end; {PrevDelKol}

// Нажатие кнопки "Открыть чек"
procedure TMainF.btnOChekClick(Sender:TObject); begin TypeChek:=TC_MAIN; OpenChek; end; {btnOChekClick}

// Нажатие кнопки "Отменить чек"
procedure TMainF.btnCChekClick(Sender:TObject); begin CancelChek(1); end; {btnCChekClick}

// Вызов диалога ввода количества двойным щелчком мыши
procedure TMainF.dbgSkladDblClick(Sender:TObject);
 begin
  PrevEnterKol(EK_DIALOG);
 end; {dbgSkladDblClick}

// Выгрузка заархивированной базы
procedure TMainF.UnLoadArhBase;
var VCLZip1:TVCLZip;
 begin
  try
   DM.QrTh.Close;
   DM.QrTh.SQL.Text:='update spr_const set Value=''0'' where descr=''ArhBase''';
   DM.QrTh.ExecSQL;
   if UnLoadBase(DM.QrTh,Opt.LoadNaklPath,False) then
    try
     VCLZip1:=TVCLZip.Create(nil);
     try
      VCLZip1.DestDir:=Opt.LoadNaklPath;
      VCLZip1.RootDir:=Opt.LoadNaklPath;
      VCLZip1.FilesList.Clear;
      VCLZip1.FilesList.Add(Opt.LoadNaklPath+BaseFileName);
      VCLZip1.ZipName:=ChangeFileExt(Opt.LoadNaklPath+BaseFileName,'.zip');
      VCLZip1.Zip;
      DeleteFile(Opt.LoadNaklPath+BaseFileName);
     finally
      VCLZip1.Free;
     end;
    except
    end;
  except
  end;
 end; {UnLoadArBase}

// Проверка не пора ли снимать Z-отчет
procedure TMainF.CheckTimeZRep;
var T:TDateTime;
 begin
  try
   if EKKA.UseEKKA=False then Exit;
   if Not EKKA.fpGetStatus then Abort;
   T:=StrToTime(JTimeToStr(EKKA.RD_Item[4]));
  except
   T:=Time;
  end;
  try
   if (T=StrToTime(Prm.TimeZRep+':00')) and (FIsFirstShowMess=True) then
    begin
     FIsFirstShowMess:=False;
     Mess1F:=TMess1F.Create(Self);
     try
      Mess1F.Label1.Font.Color:=clRed;
      Mess1F.Label1.Caption:='Пора снимать Z-отчет!';
      PlayWavFile(WorkPath+'\Wav\tada.wav');
      Mess1F.ShowModal;
     finally
      Mess1F.Free;
     end;
    end;
  except
  end;
 end; {CheckTimeZRep;}

//Постоянно напоминаем о себе другим пользователям
procedure TMainF.tmrFlushPasswTimer(Sender:TObject);
var T:TDateTime;
    Er:String;
 begin
  if Design then Exit;
  tmrFlushPassw.Enabled:=False;
  try
   // Обновление даты
//   lbDate.Date:=Date;

   // Даем знать, что мы еще подключены к серверу
   //ExecADOSQL(DM.TimerQr,'update SprUser set flag_ok=1 where id='+IntToStr(Prm.UserID));

   // Сообщаем о необходимости выгрузки остатков на флешку
   T:=Time;
   if  ((T>StrToTime('05:00:00')) and (T<StrToTime('05:00:08'))) then
    begin
     MessBox('Не ЗАБУДЬТЕ выключить рекламу!');
    end else
   if  ((T>StrToTime('16:00:00')) and (T<StrToTime('16:00:08'))) then
    begin
     MessBox('Не ЗАБУДЬТЕ включить рекламу!');
    end else
   if  ((T>StrToTime('05:00:00')) and (T<StrToTime('05:00:08'))) or
       ((T>StrToTime('06:00:01')) and (T<StrToTime('06:00:09'))) or
       ((T>StrToTime('07:00:02')) and (T<StrToTime('07:00:10'))) then
    begin
     MessBox('Не ЗАБУДЬТЕ выгрузить остатки на флешку'+#10+
             'и передать УТРОМ с инкассацией и по возможности ОТПРАВИТЬ почту.');
    end;

   CheckTimeZRep; // Проверка не пора ли снимать Z-отчет

   // Принудительно выгружаем остатки
   try
    T:=Time;
    if  ((T>StrToTime(IntToStr(Opt.KassaID+1)+':30:00')) and (T<StrToTime(IntToStr(Opt.KassaID+1)+':30:08'))) then ForceUnLoadAll;
   except
   end;

   // Выгрузка заархивированной базы
   try
    DM.TimerQr.Close;
    DM.TimerQr.SQL.Text:='select * from spr_const where descr=''ArhBase''';
    DM.TimerQr.Open;
    if Not DM.TimerQr.IsEmpty then
     if DM.TimerQr.FieldByName('Value').AsString='1' then
      if IsServer then TThArhBase.Create(False);
   except
   end;
  finally
   tmrFlushPassw.Enabled:=True;
  end;

  // Реиндекс базы
  tmrFlushPassw.Enabled:=False;
  try
   T:=Time;
   if (T>StrToTime('04:00:00')) and (T<StrToTime('04:00:08')) then
    try
     DM.spY_ReindexBase.Close;
     DM.spY_ReindexBase.ExecProc;
    except
    end;
  finally
   tmrFlushPassw.Enabled:=True;
  end;

 end; {tmrFlushPasswTimer}

// Close формы
procedure TMainF.FormClose(Sender:TObject; var Action:TCloseAction);
var v:Byte;
 begin
  try
   tmrFlushPassw.Enabled:=False;
   try
    DeleteFile(PrPath+'\PC_EKKA.new');
    if Opt.ShowMCash then v:=1 else v:=0;
    WriteToIni('ShowMCash',IntToStr(v));
    if FChangeUser then // Если происходит смена пользователей
     begin
      StartF.ShowLogon:=False;
      StartF.MaskEdit1.Text:='';
      StartF.PrepareUserList;
      StartF.Show;
      SetAsMainForm(StartF);
      Action:=caFree;
     end;
    CancelChek;
   finally
    FChangeUser:=False;
    // Освобождает папку пользователя
    ExecADOSQL(DM.TimerQr,'update SprUser set flag_ok=0 where id='+IntToStr(Prm.UserID));
    ExecADOSQL(DM.QrEx,'insert into UserLog(id_user,id_kassa,dt,flag) values('+IntToStr(Prm.UserID)+','+IntToStr(Opt.KassaID)+',getdate(),2)');
   end;
  except
  end;
 end; {FormClose}

// Подсчет суммы с учетом скидки
function TMainF.GetSumChekFull:Real;
 begin
  Result:=FSumChek-FSumSkd;
{  if TypeChek=TC_STRETCH then Result:=Result-FSumSertif else
  if TypeChek=TC_MOMBABY then Result:=Result-FSumMomBaby;
  if Result<0 then Result:=0;
 }
 end; {GetSumChekFull}

// Показ скидки везде
procedure TMainF.SetSumSkd(V:Real);
 begin
  FSumSkd:=V;
  lbIndSkd.Caption:=CurrToStrF(V,ffFixed,2);
  lbIndNal.Caption:=CurrToStrF(FSumChek,ffFixed,2);
  ShowIndicator(SumChekFull);
 end; {SetSumSkd}

// Показ суммы чека везде
procedure TMainF.SetSumChek(V:Real);
 begin
  FSumChek:=V;
  lbIndNal.Caption:=CurrToStrF(V,ffFixed,2);
  lbIndSkd.Caption:=CurrToStrF(FSumSkd,ffFixed,2);
  ShowIndicator(SumChekFull);
 end; {SetSumChek}

// Вывод суммы на индикатор
procedure TMainF.ShowIndicator(Sum:Currency);
var C:TColor;
 begin
  lbIndAll.Caption:=CurrToStrF(Sum,ffFixed,2);
  if Sum<=CL.MinSum then
   begin
    if Type_Skd=0 then C:=CL_GREEN else C:=CL_RED;
    ImIndicator.Visible:=True;
    ShowSumDigit(ImIndicator,Sum,7,6,C,$00000000);
   end else begin
             if Type_Skd=0 then C:=CL.IndicF else C:=CL.IndicFSkd;
             ImIndicator.Visible:=False;
             pnIndicator.Color:=CL.IndicFon;
             pnIndicator.Font.Color:=C;
             pnIndicator.Caption:=CurrToStrF(Sum,ffFixed,2);
            end;
  EKKA.fpCurrToDisp(Sum);
  edCashChange(edCash);
 end; {Indicator}

// Устанавливает значение свойства NumCard
procedure TMainF.SetNumCard(V:Int64);
 begin
  FNumCard:=V;
  if (V>0) and (Copy(IntToStr(V),1,2)<>CR_ORANG) then lbNCrd.Caption:=IntToStr(V) else lbNCrd.Caption:='';
 end; {SetNumCard}

// Считывает номер карточки
procedure TMainF.GetNumCardDialog(var NumCard:Int64; var TypeCard:Integer);
 begin
  Case TypeChek of
   TC_MAIN,TC_PREP,TC_SERTIF,TC_STRETCH:
           try
            CardReadF:=TCardReadF.Create(Self);
            try
             CardReadF.Label1.Caption:='Проведите карточку через устройство чтения.';
             if sbCard.Tag=1 then CardReadF.Label1.Caption:='Предложите оформить клиенту дисконтную карточку.';
             CardReadF.IsMBCard:=IsCanRegMomBabyCard;
             CardReadF.ShowModal;
             NumCard:=CardReadF.NumCard;
             if (NumCard>0) and (CardReadF.IsMBCard) and (CardReadF.IsReg) then
              try
               DM.spY_EnterKol.Parameters.ParamValues['@part_code']:=66671;
               DM.spY_EnterKol.Parameters.ParamValues['@pold_art']:=66671;
               DM.spY_EnterKol.Parameters.ParamValues['@pkol']:=1;
               DM.spY_EnterKol.Parameters.ParamValues['@piduser']:=Prm.UserID;
               DM.spY_EnterKol.Parameters.ParamValues['@ptm']:=1;
               DM.spY_EnterKol.Parameters.ParamValues['@simp']:=1;
               DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=1;
               DM.spY_EnterKol.ExecProc;
              except
              end;

             if (NumCard>0) then
              try
               DM.QrEx4.Close;
               DM.QrEx4.SQL.Text:='select IsNull(Sum(Bonus),0) as Sm from Cards where NumCard='+IntToStr(NumCard);
               DM.QrEx4.Open;
               lbMBInfo.Caption:=CurrToStrF(DM.QrEx4.FieldByName('Sm').AsFloat,ffFixed,2);
              except
              end;

             IsRegCard:=CardReadF.IsReg;
             TypeCard:=CardReadF.KodEAN;
            finally
             CardReadF.Free;
            end;
           except
            IsRegCard:=False;
            NumCard:=0;
            TypeCard:=0
           end;
   TC_KURER:try
             EnterValueF:=TEnterValueF.Create(Self);
             try
              EnterValueF.TypeValue:=INT_VALUE;
              EnterValueF.lbCaption.Caption:='Введите номер карточки';
              EnterValueF.lbCaption.Font.Style:=[fsBold];
              EnterValueF.ShowModal;
              if EnterValueF.Flag<>1 then Abort;
              NumCard:=StrToInt(EnterValueF.edValue.Text);
              TypeCard:=1;
              DM.QrE.Close;
              DM.QrE.SQL.Clear;
              DM.QrE.SQL.Add('if (select Count(*) from Cards where NumCard='+IntToStr(NumCard)+')<=0');
              DM.QrE.SQL.Add(' insert into Cards(NumCard,Summa) Values('+IntToStr(NumCard)+',0)');
              DM.QrE.ExecSQL;
             finally
              EnterValueF.Free;
             end;
            except
             TypeCard:=0;
             NumCard:=0;
            end;
  end;
 end; {GetNumCardDialog}

// Получение значения бонусного процента
function TMainF.GetBonusPerc(NC:Int64):Real;
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select IsNull(Skd,-1) as Skd, Vip from BonusCards where NumCard='+IntToStr(NC);
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Abort;
   if (CheckNightSkdTime=False) and (DM.Qr.FieldByName('Vip').AsInteger in [0,2]) then Abort;
   Result:=DM.Qr.FieldByName('Skd').AsFloat;
  except
   Result:=-1;
  end;
 end; {GetBonusPerc}

// Изменение типа скидки и, соответственно, пересчет скидки
procedure TMainF.SetType_Skd(V:Integer);
 begin
  try
   if (ChekOpened=False) or ((DM.qrChek.IsEmpty=False) and (V=SK_CARD)) then V:=SK_NONE;
   FType_Skd:=V;
   stPercSkd.Visible:=False;
   cbFixSkd.Visible:=False;
   lbPerc1.Visible:=False;
   lbPerc2.Visible:=False;
   lbSkdTit.Font.Color:=clBlack;
   lbSkdTit.Caption:='Режим скидок: выключен';
   lbPrSkd.Visible:=False;
   Case V of
    SK_NONE:  begin
               lbMBInfo.Caption:='0';
               NumCard:=-1;
               IsRegCard:=False;
               cbFixSkd.ItemIndex:=-1;
               PercentSkd:=0;
               sbSumm.Down:=False;
               sbFix.Down:=False;
               sbCard.Down:=False;
               miSumSkd.Checked:=False;
               miFixSkd.Checked:=False;
               miCardSkd.Checked:=False;
               sbMag.Enabled:=True;
              end;
    SK_SUMM:  begin
               NumCard:=-1;
               IsRegCard:=False;
               lbPrSkd.Caption:='Акционная';
               NumCard:=0;
//               sbMag.Enabled:=False;
              end;
    SK_FIX:   begin
//               sbMag.Enabled:=False;
               IsRegCard:=False;
               NumCard:=-1;
               cbFixSkd.Visible:=True;
               lbPerc1.Visible:=True;
               lbSkdTit.Font.Color:=clRed;
               lbSkdTit.Caption:='Режим скидок: включен';
               lbPrSkd.Visible:=True;
               PercentSkd:=0;
               if cbFixSKD.ItemIndex>=0 then
                begin
                 PercentSkd:=StrToFloat(cbFixSkd.Text);
                 NumCard:=0;
                end;
              end;
    SK_CARD:  begin
//               sbMag.Enabled:=False;
               PercentSkd:=PercentSkd;
              end;
    SK_DRCARD:PercentSkd:=5;
    SK_ORANGE:lbPrSkd.Caption:='Акционная';
   end;
  finally
   RefreshChek;
  end;
 end; {SetType_Skd}

// Проверка времени недействия ночных скидок
function TMainF.CheckNightSkdTime:Boolean;
var tm:TDateTime;
 begin
  if ChekEmpty=False then begin Result:=True; Exit; end;
  try
   tm:=Time;
   if StrToTime(Prm.StartTime)>StrToTime(Prm.EndTime) then
    begin
     if (tm>StrToTime(Prm.StartTime)) or (tm<StrToTime(Prm.EndTime)) then Abort;
    end else
     if (tm>StrToTime(Prm.StartTime)) and (tm<StrToTime(Prm.EndTime)) then Abort;
   Result:=True;
  except
   Result:=False;
  end;
 end; {CheckNightSkdTime}

// Чтение текущего процента скидки
function TMainF.GetPercentSkd:Real;
var SumChek,SumCh,SumCard:Real;
    Bonus:Real;
    NC:Int64;
    TC:Integer;
    IsMB:Boolean;
 begin
  if FType_Skd=SK_CARD then
   begin
    try
//     if (Prm.AptekaID=63) or (FSumPChek>0) then
      begin
       DM.QrEx4.Close;
       DM.QrEx4.SQL.Text:='select Sum(kol*cena) as Sm from Chek where compname=host_name() and id_user='+IntToStr(Prm.UserID);
       DM.QrEx4.Open;
       SumCh:=DM.QrEx4.FieldByName('Sm').AsFloat;
      end;

     if NumCard<=0 then
      begin
       GetNumCardDialog(NC,TC);
       EmptyKeyQueue;
       lbSearch.Caption:='';
       NumCard:=NC;
       TypeCard:=TC;
       IsFozzy:=False;
       IsDop7:=False;
       if (TypeCard=1) then
        begin
         if (Prm.AptekaID=28) and (MessBox('Есть ли у клиента сертификат супермаркета "Fozzy" на скидку 10%?'+#10#10+
                                           'Если ли есть, нажмите да и клиент получит скидку в 13%.',52)=ID_YES) then
          IsFozzy:=True { else
         if (Prm.AptekaID=5 ) and (MessBox('Есть ли у клиента флаер на дополнительную скидку 7% ?',52)=ID_YES) then
          IsDop7:=True};
        end;
      end;
     if NumCard<=0 then Abort;
     Bonus:=GetBonusPerc(NumCard);
     if Bonus>=0 then FPercentSkd:=Bonus else
     if (Copy(IntToStr(NumCard),1,3)<>CR_DOCT1) and (Copy(IntToStr(NumCard),1,3)<>CR_911) and (Copy(IntToStr(NumCard),1,4)<>CR_STUD) and (TypeCard<>8) and (TypeCard<>1) then
      begin
       if (Copy(IntToStr(NumCard),1,2)=CR_KARAV) and (Prm.AptekaID=133) then FPercentSkd:=2 else
       if ((Copy(IntToStr(NumCard),1,2)=CR_KARAV) or (Copy(IntToStr(NumCard),1,Length(CR_DAFI))=CR_DAFI)) and (Prm.AptekaID=28) then FPercentSkd:=7 else
       if (Copy(IntToStr(NumCard),1,2)=CR_ORANG) {and (Prm.AptekaID in [4,5,10])} then
        begin
         FType_skd:=SK_ORANGE;
        end else
       if (Copy(IntToStr(NumCard),1,3)=CR_BEGDR) then
        begin
         FType_skd:=SK_DRCARD;
         FPercentSkd:=5;
        end else
       if (Copy(IntToStr(NumCard),1,2)=CR_271) and (Prm.AptekaID in [63]) and (NumCard>10000000) then
        begin
         FPercentSkd:=0;
         if SumCh>0 then FPercentSkd:=6;
        end else
       if {(Copy(IntToStr(NumCard),1,3)=CR_NAKLOF) or }((Copy(IntToStr(NumCard),1,3)=CR_BIOSTR)) then
        begin
         FType_skd:=SK_DRCARD;
         FPercentSkd:=10;
        end;
      end else try
//                if Not (CheckNightSkdTime) then Abort;
                if Not IsDay then Abort;

                DM.Qr.Close;
                DM.Qr.SQL.Clear;
                DM.Qr.SQL.Add('select IsNull((select Sum(Summa) from Cards where NumCard='+IntToStr(NumCard)+'),0) as SumCr,  ');
                DM.Qr.SQL.Add('IsNull((select Sum(kol*cena) from Chek                                                          ');
                DM.Qr.SQL.Add('where compname=host_name() and id_user='+IntToStr(Prm.UserID)+' and art_code not in             ');
                DM.Qr.SQL.Add('(select art_code from skd_limit where type_skd=4 and skd<=0)),0) as SumCh                      ');
                DM.Qr.Open;

                SumCard:=DM.Qr.FieldByName('SumCr').AsCurrency;
                SumChek:=DM.Qr.FieldByName('SumCh').AsCurrency;

//                if IsMB then

                DM.Qr.Close;
                DM.Qr.SQL.Text:='select IsNull(Max(Skd),0) as Sk from Skd where type_skd=1 and Summ<'+CurrToStr(SumCard);
                DM.Qr.Open;
                FPercentSkd:=DM.Qr.FieldByName('Sk').AsFloat;

                DM.Qr.Close;
                DM.Qr.SQL.Text:='select IsNull(Max(Skd),0) as Sk from Skd where type_skd=1 and SummN<'+CurrToStr(SumCard+SumChek);
                DM.Qr.Open;
                if FPercentSkd<DM.Qr.FieldByName('Sk').AsFloat then FPercentSkd:=DM.Qr.FieldByName('Sk').AsFloat;

                if IsFozzy then FPercentSkd:=13;
                if IsDop7 then FPercentSkd:=FPercentSkd+7 else
                if (SumCh*0.9<=FSumPChek) and (FSumPChek>0) then FPercentSkd:=FPercentSkd+3;

                if ((Copy(IntToStr(NumCard),1,3)=CR_911) or
                   (Copy(IntToStr(NumCard),1,4)=CR_STUD) or
                   (TypeCard=8) or
                   ((NumCard>=479000) and (NumCard<=479999))) and (FPercentSkd<5) then FPercentSkd:=5;

                if (Copy(IntToStr(NumCard),1,3)=CR_DOCT1) and (NumCard>10000000) then FPercentSkd:=10;
                DM.Qr.Close;
                if (IsRegCard) and (SumCh<Prm.SumSkd) and (Copy(IntToStr(NumCard),1,4)<>CR_STUD) and ((IsCanRegMomBabyCard=False) or (IsMomBabyCard(NumCard)=False)) then FPercentSkd:=0;

               except
                FPercentSkd:=0;
                Abort;
               end;
     stPercSkd.Visible:=True;
     lbPerc2.Visible:=True;
     lbSkdTit.Font.Color:=clRed;
     lbSkdTit.Caption:='Режим скидок: включен';
     lbPrSkd.Visible:=True;
     sbCard.Enabled:=True;
     miCardSkd.Enabled:=True;
    except
     FPercentSkd:=0;
     Type_SKD:=SK_NONE;
     sbCard.Down:=False;
    end;
    SetPercentSkd(FPercentSkd);
   end;
  Result:=FPercentSkd;
 end; {GetPercentSkd}

{ Изменение процента скидки и все что нужно сделать в связи с этим}
procedure TMainF.SetPercentSkd(V:Real);
 begin
  FPercentSkd:=V;
  if FType_skd=SK_ORANGE then
   begin
    lbPrSkd.Caption:='Оранж кард';
    stPercSkd.Caption:='';
   end else begin
             lbPrSkd.Caption:=CurrToStr(FPercentSkd);
             stPercSkd.Caption:=CurrToStr(FPercentSkd);
            end;
 end; {SetPercentSkd}

// Нажатие, отжатие кнопки "Суммарная"
procedure TMainF.sbSummClick(Sender:TObject);
 begin
  if TSpeedButton(Sender).Down then Type_Skd:=SK_SUMM else Type_Skd:=SK_NONE;
 end; {sbSummClick}

// Нажатие, отжатие кнопки "Фиксированная"
procedure TMainF.sbFixClick(Sender:TObject);
 begin
  if TSpeedButton(Sender).Down then Type_Skd:=SK_FIX else Type_Skd:=SK_NONE;
 end; {sbFixClick}

// Нажатие, отжатие кнопки "С карточки"
procedure TMainF.sbCardClick(Sender:TObject);
 begin
  if TSpeedButton(Sender).Down then Type_Skd:=SK_CARD else Type_Skd:=SK_NONE;
 end; {sbCardClick}

// Выбор процента фиксированной скидки
procedure TMainF.cbFixSkdChange(Sender:TObject);
 begin
  Type_Skd:=Type_Skd;
 end; {cbFixSkdChange}

// Нажатие Enter в чеке
procedure TMainF.dbgChekKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key in K_ARROW_KEYS then lbCheck.Caption:='';
  if Key=VK_RETURN then PrevDelKol;
 end; {dbgChekKeyDown}

// Двойной клик в Чеке
procedure TMainF.dbgChekDblClick(Sender:TObject);
 begin
  PrevDelKol;
 end; {dbgChekDblClick}

// Отобаржение текста в строке статуса в конкретной ячейке
procedure TMainF.ShowStatus(S:String; N:Integer);
 begin
  try
   stMain.Panels[N].Text:=S;
   Application.ProcessMessages;
  except
  end;
 end; {ShowSatatus}

// Отобаржение текста в строке статуса в ячейке №3
procedure TMainF.ShowStatus(S:String);
 begin
  ShowStatus(S,3);
 end; {ShowSatatus}

procedure TMainF.PrintBlankForRegCard(NumCard:Int64; FIO,DateR:String);
var Tb:TTableObj;
    S:String;
 begin

  S:='"Аптечной сети 9-1-1 ';
  if Prm.FirmID=5 then S:='';
  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Font.Name:='Times New Roman';
  PrintRep.Font.Size  :=5;
  PrintRep.Font.Style:=[fsBold];
  if NumCard>0 then PrintRep.AddText('Номер дисконтной карты: '+IntToStr(NumCard)+#10#10);

  PrintRep.Font.Style:=[];
  PrintRep.AddTable(1,1);
  Tb:=PrintRep.LastTable;
  Tb.SetWidths('10000');
  Tb.Cell[1,1].Indent:=10;
  Tb.Cell[1,1].LeftMargin:=30;
  Tb.Cell[1,1].Align:=AL_CENTER;
  Tb.Cell[1,1].Font.Style:=[fsBold];
  Tb.Cell[1,1].AddText('Согласие'+#10+'на сбор и обработку персональных данных'+#10#10);

  Tb.Cell[1,1].Align:=AL_JUST;
  Tb.Cell[1,1].Font.Style:=[];
  if FIO='' then
   begin
    Tb.Cell[1,1].AddText('Я, ______________________________________________________________________________ ,'+#10);
    Tb.Cell[1,1].Font.Style:=[fsItalic];
    Tb.Cell[1,1].AddText('                    (Указать Ф.И.О.)'+#10);
   end else Tb.Cell[1,1].AddText('Я, '+FIO+' , ');


  Tb.Cell[1,1].Font.Style:=[];

  if DateR='' then Tb.Cell[1,1].AddText('    родился ___________ / ______________ / ____________, подписывая этот документ, предоставляю согласие    владельцу базы персональных  данных ')
              else Tb.Cell[1,1].AddText('    родился '+DateR+', подписывая этот документ, предоставляю согласие    владельцу базы персональных  данных ');

  Tb.Cell[1,1].Font.Style:=[fsBold,fsUnderLine];
  Tb.Cell[1,1].AddText(Prm.FullFirmNameRU);

  Tb.Cell[1,1].Font.Style:=[];
  Tb.Cell[1,1].AddText('на сбор, обработку и использование моих  персональных  данных с  целью ');

  Tb.Cell[1,1].Font.Style:=[fsUnderLine];
  Tb.Cell[1,1].AddText('выполнения_требований Закона Украины  " О защите персональных данных", ведения хозяйственной деятельности, предоставления скидок покупателям '+S);
  Tb.Cell[1,1].AddText(Prm.FirmNameRu+' и выполнение других требований действующего законодательства.'+#10);

  Tb.Cell[1,1].Font.Style:=[];
  Tb.Cell[1,1].AddText('С этой целью передаю ');

  Tb.Cell[1,1].Font.Style:=[fsBold];
  Tb.Cell[1,1].AddText(Prm.FullFirmNameRU+' ');

  Tb.Cell[1,1].Font.Style:=[];
  Tb.Cell[1,1].AddText('информацию о моих персональных данных таких как: Ф.И.О., дата рождения, контактный телефон и адрес. Подтверждаю, что с Положением о персональных данных ');
  Tb.Cell[1,1].AddText('владельца базы персональных данных, ознакомлен. Персональные данные также могут быть использованы Владельцем или третьими лицами с целью ');

  Tb.Cell[1,1].Font.Style:=[fsUnderLine];
  Tb.Cell[1,1].AddText('предоставления скидок постоянным клиентам, информированием о проводимых акциях, предоставления информации на запросы физических лиц или компетентных органов, и другие цели, не запрещенные действующим законодательством. ');

  Tb.Cell[1,1].Font.Style:=[];
  Tb.Cell[1,1].AddText(Prm.FirmNameRu+' может передавать в обработку другим юридическим лицам (распорядителям) мои персональные данные в порядке, предусмотренном действующим законодательством.'+#10);

  Tb.Cell[1,1].AddText('Владелец обязуется использовать персональные данные справедливо и законно в соответствии с законодательством о защите персональных данных. В случае изменения цели обработки персональных данных Владелец должен сообщить об ');
  Tb.Cell[1,1].AddText('этом субъекту персональных данных и получить согласие на обработку его данных в соответствии с измененной целью.'+#10#10);

  Tb.Cell[1,1].Font.Style:=[fsBold];
  Tb.Cell[1,1].AddText('          Дата '+DateToStr(Date)+'                                                                  подпись______________'+#10#10);
//  Tb.Cell[1,1].AddText('          Дата 28.12.12                                                                  подпись______________'+#10#10);

  PrintRep.AddInterv(6);

  PrintRep.AddTable(1,1);
  Tb:=PrintRep.LastTable;
  Tb.SetWidths('10000');
  Tb.Cell[1,1].Indent:=10;
  Tb.Cell[1,1].LeftMargin:=30;
  Tb.Cell[1,1].Align:=AL_CENTER;
  Tb.Cell[1,1].Font.Style:=[fsBold];
  Tb.Cell[1,1].AddText('Сообщение о правах'+#10+'в соответствии с Законом Украины "О защите персональных данных"'+#10#10);

  Tb.Cell[1,1].Align:=AL_JUST;
  Tb.Cell[1,1].Font.Style:=[];

  if FIO='' then
   Tb.Cell[1,1].AddText('Я,__________________________________________________________________ удостоверяю, что получил сообщение о внесении информации обо мне в базу персональных данных с целью выполнения ')
  else
   Tb.Cell[1,1].AddText('Я, '+FIO+' удостоверяю, что получил сообщение о внесении информации обо мне в базу персональных данных с целью выполнения ');

  Tb.Cell[1,1].AddText(Prm.FirmNameRu+' требований Закона Украины "О защите персональных данных", ведения хозяйственной деятельности, участия в программах предоставления скидок покупателям '+S);
  Tb.Cell[1,1].AddText(Prm.FirmNameRu+' и выполнение других требований действующего законодательства. Мне также сообщили о третьих лицах, юридических лицах (распорядителях), органах государственной власти и местного самоуправления, ');
  Tb.Cell[1,1].AddText(' которым могут передаваться мои персональные данные в ходе выполнения '+Prm.FirmNameRu+' требований законодательства.'+#10#10);
  Tb.Cell[1,1].AddText('Предоставляя свои персональные данные, я выражаю свое согласие на обработку персональных данных на условиях, изложенных в этом документе.'#10);
  Tb.Cell[1,1].AddText('С положениями Закона Украины "О защите персональных данных" ознакомлен.'+#10#10);

  Tb.Cell[1,1].Font.Style:=[fsBold];
  Tb.Cell[1,1].AddText('Дата '+DateToStr(Date)+'                                       Ф.И.О./подпись_________________________'+#10#10#10#10);
//  Tb.Cell[1,1].AddText('Дата 28.12.12                                       Ф.И.О./подпись_________________________'+#10#10#10#10);

  if Not PrintRep.PreView then Abort;
  PrintRep.Clear;
 end;


procedure TMainF.PrintBlankForRegMBCard(CR:TCardInfo);
var Tb:TTableObj;
    q:Integer;
    Bm:TBitMap;
 begin
  PixperI:=650;
  PrintRep.Clear;
  PrintRep.SetDefault;

  PrintRep.Indent:=0;
  PrintRep.AddTable(2,1);
  Tb:=PrintRep.LastTable;
  Tb.SetWidths('12000,8000');
  Tb.SetBorders(1,1,2,1,EMPTY_BORDER);
  Tb.Cell[1,1].Font.Name:='Arial';
  Tb.Cell[1,1].Font.Size:=18;
  Tb.Cell[1,1].Font.Style:=[fsBold];
  Tb.Cell[1,1].Align:=AL_CENTER;
  Tb.Cell[1,1].AddText('АНКЕТА');
  Tb.Cell[1,1].Font.Size:=7;
  Tb.Cell[1,1].AddText(#10'участника программы');

  Bm:=TBitMap.Create;
  Bm.Assign(MainF.imMB.Picture);
  Tb.Cell[2,1].Stretch:=True;
  Tb.Cell[2,1].AddImage(Bm,80);
  Bm.Free;

  PrintRep.Font.Size:=4;
  PrintRep.AddText(#10'Фамилия: '+CR.F+#10);
  PrintRep.AddText('Имя: '+CR.I+#10);
  PrintRep.AddText('Отчество: '+CR.O+#10);
  PrintRep.AddText('Дата рождения покупателя: '+CR.DateR+#10);
  PrintRep.AddText('Адрес: '+CR.Addr+#10);
  PrintRep.AddText('Контактные телефоны: '+CR.Phone+#10#10);
  PrintRep.AddText('Дети'+#10);

  PrintRep.AddTable(2,2);
  Tb:=PrintRep.LastTable;
  Tb.SetWidths('5000,3500');
  Tb.SetBorders(1,1,2,2,Border(clBlack,6,psSolid));
  Tb.Cell[1,1].LeftBorder:=EMPTY_BORDER;
  Tb.Cell[1,2].LeftBorder:=EMPTY_BORDER;

  Tb.Cell[2,1].LeftBorder:=EMPTY_BORDER;
  Tb.Cell[2,2].LeftBorder:=EMPTY_BORDER;

  Tb.Cell[2,1].RightBorder:=EMPTY_BORDER;
  Tb.Cell[2,2].RightBorder:=EMPTY_BORDER;
  q:=1;
  if CR.ChName1<>'' then
   begin
    Tb.Cell[1,1].AddText(IntToStr(q)+'. '+CR.ChName1);  Tb.Cell[2,1].AddText(CR.ChDateR1);
    Inc(q);
   end;
  if CR.ChName2<>'' then
   begin
    if q>1 then
     begin
      Tb.Cell[1,1].AddText(#10);
      Tb.Cell[2,1].AddText(#10);
     end;
    Tb.Cell[1,1].AddText(IntToStr(q)+'. '+CR.ChName2);
    Tb.Cell[2,1].AddText(CR.ChDateR2);
    Inc(q);
   end;
  if CR.ChName3<>'' then
   begin
    if q>1 then
     begin
      Tb.Cell[1,1].AddText(#10);
      Tb.Cell[2,1].AddText(#10);
     end;
    Tb.Cell[1,1].AddText(IntToStr(q)+'. '+CR.ChName3);
    Tb.Cell[2,1].AddText(CR.ChDateR3);
    Inc(q);
   end;

  Tb.MergeCells(1,2,2,2);
  if CR.EMail<>'' then Tb.Cell[1,2].AddText('EMail: '+CR.EMail+#10);
  Tb.Cell[1,2].AddText(#10#10+'Откуда вы узнали о программе ___________________________'#10);
  Tb.Cell[1,2].AddText('Хотели бы Вы получать информацию об акциях и скидках в Аптечной сети 911?  Да ___  Нет ____'#10);
  Tb.Cell[1,2].AddText('Выберите удобный для вас вариант получения информации:'#10);
  Tb.Cell[1,2].AddText('Электронная почта ____	по смс рассылке ____	по почте _____'#10);
  Tb.Cell[1,2].AddText('Карта номер: '+IntToStr(CR.NumCard)+#10);
  Tb.Cell[1,2].AddText('Подпись __________________                                             Дата Выдачи: '+DateToStr(Date)+'                                                        ');

  Tb.Cell[1,2].Font.Size:=3;
  Tb.Cell[1,2].AddText(IntToStr(Prm.AptekaID));
  Tb.Cell[1,2].Font.Size:=4;


  PrintRep.Align:=AL_CENTER;
  PrintRep.Font.Style:=[fsBold];
  PrintRep.AddText(#10'Согласие'#10'на сбор и обработку персональных данных'#10#10);

  PrintRep.Align:=AL_JUST;
  PrintRep.Font.Style:=[];
  PrintRep.Indent:=10;
  PrintRep.AddText('Я, '+CR.F+' '+CR.I+' '+CR.O+', родился '+CR.DateR+', подписывая этот документ, предоставляю согласие владельцу базы персональных данных '+Prm.FirmNameRU);
  PrintRep.AddText(' на сбор, обработку и использование моих  персональных  данных с  целью ');
  PrintRep.Font.Style:=[fsUnderLine];
  PrintRep.AddText(' выполнения_требований Закона Украины  " О защите персональных данных", ведения хозяйственной деятельности, предоставления скидок покупателям "Аптечной сети 9-1-1 '+Prm.FirmNameRU+' и выполнение других требований действующего законодательства.'#10);

  PrintRep.Font.Style:=[];
  PrintRep.AddText('С этой целью передаю '+Prm.FirmNameRU+' информацию о моих персональных данных таких как: Ф.И.О., дата рождения, контактный телефон и адрес. Подтверждаю, что с Положением о персональных данных владельца базы персональных данных, ознакомлен. ');
  PrintRep.AddText('Персональные данные также могут быть использованы Владельцем или третьими лицами с целью ');
  PrintRep.Font.Style:=[fsUnderLine];
  PrintRep.AddText('предоставления скидок постоянным клиентам, информированием о проводимых акциях, предоставления информации на запросы физических лиц или компетентных органов, и другие цели, не запрещенные действующим законодательством. ');

  PrintRep.Font.Style:=[];
  PrintRep.AddText(Prm.FirmNameRU+' может передавать в обработку другим юридическим лицам (распорядителям) мои персональные данные в порядке, предусмотренном действующим законодательством. '#10);

  PrintRep.AddText('Владелец обязуется использовать персональные данные справедливо и законно в соответствии с законодательством о защите персональных данных. В случае изменения цели обработки персональных данных'+' Владелец должен сообщить об этом субъекту персональных данных и получить согласие на обработку его данных в соответствии с измененной целью.'#10#10);
  PrintRep.Font.Style:=[fsBold];
  PrintRep.AddText('Дата '+DateToStr(Date)+'                                                                             Подпись______________'#10#10);

  PrintRep.Align:=AL_CENTER;
  PrintRep.AddText('Сообщение о правах'#10'в соответствии с Законом Украины "О защите персональных данных"'#10);
  PrintRep.Align:=AL_JUST;
  PrintRep.Font.Style:=[];

  PrintRep.AddText('Я, '+CR.F+' '+CR.I+' '+CR.O+' удостоверяю, что получил сообщение о внесении информации обо мне в базу персональных данных с целью выполнения '+Prm.FirmNameRU);
  PrintRep.AddText(' требований Закона Украины "О защите персональных данных", ведения хозяйственной деятельности, участия в программах предоставления скидок покупателям "Аптечной сети 9-1-1" '+Prm.FirmNameRU);
  PrintRep.AddText(' и выполнение других требований действующего законодательства. Мне также сообщили о третьих лицах, юридических лицах (распорядителях), органах государственной власти и местного самоуправления,'+' которым могут передаваться мои персональные данные в ходе выполнения '+Prm.FirmNameRU);
  PrintRep.AddText(' требований законодательства.'#10);
  PrintRep.AddText('Предоставляя свои персональные данные, я выражаю свое согласие на обработку персональных данных на условиях, изложенных в этом документе.'#10);
  PrintRep.AddText('С положениями Закона Украины "О защите персональных данных" ознакомлен.'#10);
  PrintRep.Font.Style:=[fsBold];
  PrintRep.AddText('Дата '+DateToStr(Date)+'            '+CR.F+' '+CR.I+' '+CR.O+'               Подпись______________'#10);



  if Not PrintRep.PreView then Abort;
  PrintRep.Clear;
 end;

// Оплата чека
function TMainF.PayChek(TypeOplat:Integer):Boolean;
var CP:TChekPos;
    SumCard:Currency;
    cb_EKKA:Boolean;
    iii:Integer;

 procedure SetCashSumm;
  begin
   if TypeOplat=TO_CASH then
    try
     CP.TakedSum:=StrToCurr(edCash.Text);
     if CP.TakedSum<SumChekFull then CP.TakedSum:=SumChekFull;
    except
     CP.TakedSum:=0;
    end;
  end; {SetCashSumm}

 // Запоминаем значения, на редкий случай если глобальные переменные изменятся в ходе процесса оплаты чека
 procedure Init;
  begin
   SumCard:=0;
   cb_EKKA:=cbEKKA.Checked;
   CP.TypeOplat:=TypeOplat;
   if (IsCHP) and (TypeOplat<>TO_BACK) then CP.TypeOplat:=TO_CHP
                                       else TypeOplat:=CP.TypeOplat;
   CP.PrPayRecipt:=0;
   if (IsKiosk) and (CP.TypeOplat=TO_CASH ) then
    begin
     DM.QrEx2.Close;
     DM.QrEx2.SQL.Clear;
     DM.QrEx2.SQL.Add('declare @Cnt int, @cntr int');
     DM.QrEx2.SQL.Add('set @cnt =IsNull((select Count(*) from Chek where compname=host_name() and id_user='+IntToStr(Prm.UserID)+'),0)');
     DM.QrEx2.SQL.Add('set @cntr=IsNull((select Count(*) from Chek where art_code not in (select IsNull(art_code,0) from SprNoRecipt) and compname=host_name() and id_user='+IntToStr(Prm.UserID)+'),0)');
     DM.QrEx2.SQL.Add('if (@cnt=@cntr) select 2 as Res if @cntr=0 select 0 as Res else select 1 as Res');
     DM.QrEx2.Open;
     if DM.QrEx2.FieldByName('Res').AsInteger=2 then CP.PrPayRecipt:=20 else
     if DM.QrEx2.FieldByName('Res').AsInteger=1 then CP.PrPayRecipt:=10
                                                else CP.PrPayRecipt:=0;
    end;

   CP.Type_Skd:=Type_Skd;
   CP.IsReg:=IsRegCard;
   if CP.IsReg and (SumChek<Prm.SumSkd) then CP.NumCard:=-1 else CP.NumCard:=NumCard;
   CP.ID_Kassa:=Opt.KassaID;
   CP.PSkd:=PercentSKD;
   CP.Date:=Date;
   CP.Priznak:=0;
   CP.BCard:='';
   CP.BFIO:='';
   CP.ID_User:=Prm.UserID;
   CP.ID_Kassa:=Opt.KassaID;
   CP.Vzh:=MainF.VzhNum;
   CP.TakedSum:=SumChekFull;
   CP.SumChek:=SumChekFull;
   CP.NPrepChek:=FNPChek;
   CP.SPrepChek:=FSumPChek;
   CP.SumSertif:=FSumSertif;
   CP.IdRes:=FIDRes;
   CP.BSkd:=0;
   CP.NumCardRecipt:=NumCardRecipt;
   CP.NumCardStretch:=NumCardStretch;
   CP.NumCardProf:=NumCardProf;
   CP.NumMediCard:=NumMediCard;
   CP.NumMDMUCard:=NumMDMUCard;
   SetCashSumm;
  end; {Init}

  // Проверка Чека ограничений на скидку
 function ChekSkdConstraints:Boolean;
  begin
   Result:=True;
   if (CP.Type_Skd in [SK_NONE,SK_SUMM,SK_ORANGE]) or ((CP.TypeOplat=TO_CHEK) and (CP.Type_Skd=SK_FIX) and (CP.PSkd=5)) then Exit;
   try
    DM.spY_CheckSKD.Parameters.ParamValues['@pt_skd']:=CP.Type_Skd;
    DM.spY_CheckSKD.Parameters.ParamValues['@pskd']:=CP.PSkd;
    DM.spY_CheckSKD.Parameters.ParamValues['@piduser']:=Prm.UserID;
    DM.spY_CheckSKD.ExecProc;
    if DM.spY_CheckSKD.Parameters.ParamValues['@RETURN_VALUE']<>1 then Abort;
   except
    Result:=False;
    MessBox('В чеке есть препараты, которые нельзя пробивать по выбранной скидке!'+#10+'В чеке они подсвечены желтым цветом!');
    RefreshChek;
   end;
  end; {ChekSkdConstraints}

 // Проверка на наличие новой версии программы
 function CheckNewVersion:Boolean;
 var F1,F,FNew:String;
  begin
   try
    FNew:=PrPath+'\PC_EKKA_NEW.exe';
    F1:=PrPath+'\PC_EKKA1.exe';
    F:=Application.ExeName;
    if Not CheckCRCFile(FNew) then Abort;
    //if GetFileDateTime(FNew)<=FApplDateTime then Abort;
    DeleteFile(F1);
    if FileExists(F1) then Abort;
    RenameFile(F,F1);
    if FileExists(F) then Abort;
    RenameFile(FNew,F);
    if Not FileExists(F) then
     begin
      RenameFile(F1,F);
      Abort;
     end;
    DeleteFile(PrPath+'\PC_EKKA_NEW.crc');
    Result:=True;
    MessBox('Появилась более новая версия программы, поэтому текущая программа будет закрыта, после чего откройте программу заново!');
    Close;
   except
    Result:=False;
   end;
  end; {CheckNewVersion}

 // Завершающие действия по закрытию чека
 procedure EndChek;
 var i,j:Integer;
     S:String;
  begin
   sbBSkd.Down:=False;
   sbGoldG.Down:=False;
   sbRecipt.Down:=False;
   SetSkdMag(nil,False);
   PlayWav(WV_SKD,Round(CP.PSkd));
   SetVisWhenChekOpened(False);
   ShowStatus('Чек закрыт.');
   EKKA.fpStrToDisp('');
   StartCamera(CM_STOP);
   TypeChek:=TC_MAIN;
   ForReserve:=False;
   NumCardRecipt:=-1;
//   if CheckNewVersion then Exit;
   ExecCommand('CLOSE');
  end; {EndChek}

 // Ввод реквизитов банковской карточки
 function CheckBankCard:Boolean;
  begin
   Result:=True;
   if CP.TypeOplat<>TO_CHEK then Exit;
   try
    BankCardF:=TBankCardF.Create(Self);
    try
     BankCardF.ShowModal;
     if BankCardF.Flag<>1 then Abort;
     CP.BCard:=BankCardF.edCard.Text;
     CP.BFIO:=BankCardF.edFIO.Text;
//     if BankCardF.RadioButton2.Checked then CP.BSkd:=2;
    finally
     BankCardF.Free;
    end;
   except
    Result:=False;
    MessBox('Реквизиты банковской карточки не введены! Пробитие чека невозможно!');
   end
  end; {CheckBankCard}

 // Выдача дополнительного сообщения при нажатии кнопки ЧЕК
 function CheckTerminal:Boolean;
  begin
   Result:=True;
   if CP.TypeOplat<>TO_CHEK then Exit;
   Result:=False;
   try
    ShowTerminalAlertF:=TShowTerminalAlertF.Create(Self);
    try
     if ShowTerminalAlertF.ShowModal=mrOK then Result:=True;
    finally
     ShowTerminalAlertF.Free;
    end;
   except
   end;
  end; {CheckTerminal}

 // Проверяет, перевалило ли время за полночь после снятия Z-отчета
 function CheckZRep:Boolean;
 var T:String;
  begin
   Result:=True;
   if cbEKKA.Checked then Exit;
   try
    ShowStatus('Чтение состояния кассы...');
    if Not EKKA.fpGetStatus then Abort;
    T:=EKKA.RD_Item[4];
    Insert(':',T,5);
    Insert(':',T,3);
    if Ord(EKKA.RD_Item[9][1])=1 then
     if (StrToTime(T)>StrToTime('23:00:00')) and (StrToTime(T)<StrToTime('23:59:59')) then
      if MessBox('Время в кассовом аппарате не перевалило за полночь!'+#10+
                 'Пробить ЧЕК сейчас или подождете несколько минут?',52)<>ID_YES then Abort;
    Result:=True;
   except
    Result:=False;
   end;
  end; {CheckZRep}

 function CheckSertif:Boolean;
  begin
   try
    Result:=True;    
    if Not (TypeChek in [TC_SERTIF,TC_STRETCH]) then Exit;
    if CP.SumChek>CP.SumSertif then
     begin
      SertifIF:=TSertifIF.Create(Self);
      try
       SertifIF.Label4.Caption:=CurrToStrF(CP.SumSertif,ffFixed,2);
       SertifIF.Label5.Caption:=CurrToStrF(CP.SumChek,ffFixed,2);
       SertifIF.Label6.Caption:=CurrToStrF(CP.SumChek-CP.SumSertif,ffFixed,2);
       SertifIF.ShowModal;
       if SertifIF.Flag<>1 then Abort;
      finally
       SertifIF.Free;
      end;
     end;
   except
    Result:=False;
   end;
  end;
  
 procedure CheckContinuePay;
 var Mes:String;
     B:Boolean;
  begin
   if FIsChSeria then Exit;
   if lbChek.Visible then
    begin
     if MessBox('В ЧЕКЕ ЕСТЬ НЕПРОВЕРЕННЫЕ ПОЗИЦИИ !!!'+#10+'Вы действительно хотите закрыть чек ?',52)<>ID_YES then Abort;
     if MessBox('В ЧЕКЕ ЕЩЕ ЕСТЬ НЕПРОВЕРЕННЫЕ ПОЗИЦИИ !!!'+#10+'Вы действительно хотите закрыть чек ?',52)<>ID_YES then Abort;
     Mes:='В ЧЕКЕ ВСЕ ЕЩЕ ЕСТЬ НЕПРОВЕРЕННЫЕ ПОЗИЦИИ !!!'+#10+'Вы действительно хотите закрыть чек ?'
     end else Mes:='Вы действительно хотите закрыть чек ?';
    if MessBox(Mes,MB_ICONWARNING+MB_YESNO)<>ID_YES then Abort;
   if Not CheckSertif then Abort;
   if Not Opt.ShowMCash then Exit;
   B:=True;

   if (CP.TypeOplat in [TO_CASH,TO_CHP]) or ( (TypeChek in [TC_SERTIF,TC_STRETCH]) and (CP.SumChek>CP.SumSertif) ) then
    try
     MoneyCashF:=TMoneyCashF.Create(Self);
     try
      if (TypeChek in [TC_SERTIF,TC_STRETCH]) and (CP.SumChek>CP.SumSertif) then
       MoneyCashF.SumChek:=CP.SumChek-CP.SumSertif
      else
       MoneyCashF.SumChek:=CP.SumChek;
      MoneyCashF.ShowModal;
      if MoneyCashF.Flag<>1 then B:=False;
      edCash.Text:=MoneyCashF.Memo1.Text;
     finally
      MoneyCashF.Free;
     end;
    except
     MessBox(ER_CR_FORM);
    end;

   if Not B then Abort;

   SetCashSumm;
  end;

 function CheckTerof:Boolean;
 var S:String;
  begin
   if CP.TypeOplat=TO_BACK then begin Result:=True; Exit; end;
   try
    S:='';
    DM.Qr3.Close;
    DM.Qr3.SQL.Text:='select * from Chek where compname=host_name() and id_user='+IntToStr(Prm.UserID)+' and art_code=61109';
    DM.Qr3.Open;
    if DM.Qr3.IsEmpty=False then
     begin
      if Not lbNumCard50.Visible then
       if MessBox('Вы действительно хотите пробить перпарат 61109 по кассовому аппарату?',52)<>ID_YES then Abort;

      if CP.TypeOplat<>TO_CASH then
       begin
        S:='Препарат 61109 нельзя продавать по кнопке "ЧЕК" (терминалу)!';
        Abort;
       end; 
     end;
    Result:=True;
   except
    if S<>'' then MessBox(S);
    Result:=False;
   end;
  end;

 procedure PrepChek;
 var CP1:TChekPos;
     Kl,i,Ty:Integer;
     Nm:String;
  begin
   if TypeChek<>TC_PREP then Exit;
   try
    DM.ADOCo.BeginTrans;
    if Not (EKKA.fpGetStatus) then AbortM(EKKA.LastErrorDescr);
    if EKKA.UseEKKA then
     begin
      EKKA.fpCancelFiscalReceipt;
      if EKKA.ReceiptNumber<0 then raise EAbort.Create('Ошибка определения номера чека');
      CP1.NumbChek:=EKKA.ReceiptNumber+1;
      if Not EKKA.fpSetBackReceipt(IntToStr(CP.NPrepChek)) then AbortM('Ошибка определения номера возвратного чека: '+EKKA.LastErrorDescr);
      if Not EKKA.fpOpenFiscalReceipt(CH_BACK) then AbortM('Ошибка открытия чека: '+EKKA.LastErrorDescr);
     end else begin
               CP1.NumbChek:=GetNewNumbChek;
               if CP1.NumbChek=0 then begin MainF.MessBox('Ошибка определения номера чека!'); Exit; end;
              end;
    CP1.Date:=DM.GetServerDate;
    CP1.Vzh:=MainF.VzhNum;
    CP1.ID_User:=Prm.UserID;
    CP1.ID_Kassa:=Opt.KassaID;
    CP1.SumChek:=0;

    DM.Qr3.Close;
    DM.Qr3.SQL.Text:='select * from ArhCheks where kod_name=0 and Numb_Chek='+IntToStr(CP.NPrepChek)+' and Vzh='+IntToStr(EKKA.VzhNum);
    DM.Qr3.Open;
    for i:=1 to DM.Qr3.RecordCount do
     begin
      if i=1 then DM.Qr3.First else DM.Qr3.Next;
      CP1.PSkd:=DM.Qr3.FieldByName('Skd').AsFloat;
      CP1.NumCard:=DM.Qr3.FieldByName('NumCard').AsInteger;
      if DM.Qr3.FieldByName('Kassa_Num').AsInteger=3 then
       CP1.TypeOplat:=TO_CASH
      else
       CP1.TypeOplat:=DM.Qr3.FieldByName('Kassa_Num').AsInteger-1;
      CP1.Kod_Name:=2;
      CP1.ArtName:=IntToStr(CP.NumbChek);
      Nm:='Передплата за лiкарськi засоби';
      CP1.Kol:=0;
      Kl:=1;
      CP1.Skd:=0;
      CP1.Cena:=DM.Qr3.FieldByName('Cena').AsFloat;
      CP1.SumSkd:=0;
      CP1.F_NDS:=2;
      CP1.Type_Tov:=1;
      CP1.SumChek:=CP1.SumChek+Abs(Kl)*CP1.Cena-CP1.SumSkd;
      Case CP1.TypeOplat of
       TO_CASH:Ty:=4;
       TO_CHEK:Ty:=2;
      end;
      DM.InsertArhChek(CP1);
      DM.Qr4.Close;
      DM.Qr4.SQL.Text:='update ArhCheks set Kod_Name=1 where row_id='+DM.Qr3.FieldByName('ROW_ID').AsString;
      DM.Qr4.ExecSQL;

      if Not EKKA.fpAddBack(Nm,
                            Abs(Kl),
                            CP1.Cena,
                            1,
                            CP1.F_NDS,
                            -Abs(CP1.SumSkd),
                            ''
                            ) then AbortM('Ошибка пробития позиции чека: '+EKKA.LastErrorDescr);

     end;

    if Not EKKA.fpCloseFiscalReceipt(CP1.SumChek,Ty,CP1.SumChek) then AbortM('Ошибка закрытия чека: '+EKKA.LastErrorDescr);
     try
      EKKA.fpCheckCopy;
      DM.ADOCo.CommitTrans;
     except
      AbortM('Ошибка фиксации записи в архив чеков!');
     end
   except
    on E:Exception do
     begin
      DM.ADOCo.RollBackTrans;
      EKKA.fpCancelFiscalReceipt;
      ShowExceptMessage(E);
     end;
   end;
  end;

 function RegDisountCard:Boolean;
 var bMB:Boolean;
     FIO,DateR:String;
     CR:TCardInfo;
  begin
   Result:=False;
   bMB:=IsCanRegMomBabyCard and IsMomBabyCard(NumCard);
   if Not ((CP.IsReg) and (Type_Skd=SK_CARD) and ((SumChek>Prm.SumSkd) or bMB or (Copy(IntToStr(NumCard),1,4)=CR_STUD) )) then begin Result:=True; Exit; end;

//   if Prm.AptekaID<>123 then
    if MessBox('Напечатать бланк "Согласие на сбор и обработку персональных данных"',52)<>ID_YES then Exit;

   try
    AECardsF:=TAECardsF.Create(Self);
    try
     AECardsF.NumCard:=NumCard;
     AECardsF.IsMomBabyCard:=bMB;
     AECardsF.ShowModal;
     if AECardsF.Flag<>1 then Abort;
     FIO:=AECardsF.Edit2.Text+' '+AECardsF.Edit3.Text+' '+AECardsF.Edit5.Text;
     CR.NumCard:=NumCard;
     CR.F:=AECardsF.Edit2.Text;
     CR.I:=AECardsF.Edit3.Text;
     CR.O:=AECardsF.Edit5.Text;
     CR.Addr:=AECardsF.Edit1.Text+' '+AECardsF.Edit6.Text+' '+AECardsF.Edit7.Text+' '+AECardsF.Edit8.Text;

     CR.ChName1:=AECardsF.Edit12.Text;
     CR.ChName2:=AECardsF.Edit13.Text;
     CR.ChName3:=AECardsF.Edit14.Text;

     CR.ChDateR1:=AECardsF.ComboBox6.Text+' '+AECardsF.ComboBox7.Text+' '+AECardsF.Edit15.Text+' г.';
     CR.ChDateR2:=AECardsF.ComboBox8.Text+' '+AECardsF.ComboBox9.Text+' '+AECardsF.Edit16.Text+' г.';
     CR.ChDateR3:=AECardsF.ComboBox10.Text+' '+AECardsF.ComboBox11.Text+' '+AECardsF.Edit17.Text+' г.';

     CR.EMail:=AECardsF.Edit11.Text;
     CR.Phone:=AECardsF.Edit4.Text+' '+AECardsF.Edit9.Text+' '+AECardsF.Edit10.Text;

     DateR:='';
     if AECardsF.RadioButton1.Checked then
      begin
       DateR:=AECardsF.ComboBox2.Text+' '+AECardsF.ComboBox3.Text+' '+AECardsF.ComboBox1.Text+' г.';
       CR.DateR:=DateR;
      end else CR.DateR:=AECardsF.ComboBox5.Text;
    finally
     AECardsF.Free;
    end;

//    if Prm.AptekaID<>123 then
     begin

      if bMB then PrintBlankForRegMBCard(CR)
             else PrintBlankForRegCard(NumCard,FIO,DateR);

     end;

    Result:=True;
   except
    Result:=False;
   end;
  end;

 // Предварительные проверки
 function PriorCheking:Boolean;
 var Mes:String;
  begin
   try

    if TypeOplat=TO_BACK then
     begin
     { if (Prm.UserRole<>R_ADMIN) and (Not (Prm.FirmID in [1,5])) and (Not (DayOfTheWeek(Date) in [2,4,7])) and (Not ((Prm.AptekaID in [11,7,29,20,21,3,24]) and (StrToDate(DateToStr(Date))=StrToDate('29.02.2012') ) )) then
       begin
        MessBox('Извените, возврат можно делать только по вторникам, четвергам, воскресеньям!');
        Abort;
       end;
     }
      if Not IsPermit([R_KASSIR,R_SUPER,R_OPER],P_ALERT) then Abort;
     end else if Not IsPermit([R_KASSIR,R_SUPER],P_ALERT) then Abort;

    if (TypeOplat<>TO_CHEK) and (sbBskd.Down or sbGoldG.Down) then
     begin
      MessBox('Чек можно закрыть только по кнопке "ЧЕК"');
      Abort;
     end;

    if (IsCHP) and (TypeOplat=TO_CHEK) then
     begin
      MessBox('Товар ЧП нельзя проводить по терминалу!');
      Abort;
     end;
    if Type_Skd=SK_CARD then
     if Not CheckLimitSkd(NumCard) then Abort;
    if Not (CheckTerminal) then Abort;
    if Not (ChekSkdConstraints) then Abort;
    if Not (CheckBankCard) then Abort;
    if Not (CheckTerof) then Abort;

    if CP.TypeOplat=TO_BACK then Mes:='Вы действительно хотите сделать ВОЗВРАТ НА СКЛАД ?' else

    Case CP.Iter of
     1:CheckContinuePay;
     2:begin
        if CP.PrPayRecipt=20 then CheckContinuePay;
        //Mes:='Не пробивать р-ный чек?';
        Mes:='Выберите необходимое действие: '+#10#10+'  "Да" - не пробивать р-ный чек'+#10+'  "Нет" - пробивать р-ный чек';
        cbEKKA.Checked:=MessBox(Mes,MB_ICONWARNING+MB_YESNO)=ID_YES;
        if cbEKKA.Checked then CP.PrPayRecipt:=21 else CP.PrPayRecipt:=20;
       end;
    end;
    if DM.qrChek.IsEmpty then
     begin
      if CP.TypeOplat=TO_BACK then MessBox('Нельзя вернуть пустой чек!')
                              else MessBox('Нельзя пробить пустой чек!');
      Abort;
     end;

    DM.Qr5.Close;
    DM.Qr5.SQL.Text:='select art_code from Chek where art_code in (select art_code from Skd_Limit where type_skd=7) and compname=host_name() and id_user='+IntToStr(Prm.UserID);
    DM.Qr5.Open;
    if (DM.Qr5.IsEmpty=False) and (sbProf.Down=False) then
     begin
      if MessBox('Внимание! В чеке есть перпараты профарма и вы забыли спросить у покупателя рецепт для получения скидки!'+#10+
                 'Если таковой имеется у покупателя, нажмите кнопку "Профарма" и проведите через сканер верхний штрихкод на рецепте!'#10#10+
                 'А также не забудьте забрать лист с рецептом профарма у покупателя иначе вы будете оштрафованы на крупную сумму!'+#10#10#10+
                 '   ДА - закрыть чек без рецепта профармы,'+#10+'   НЕТ - отменить закрытие чека.',52)=ID_NO then Abort;
     end else
    if (DM.Qr5.IsEmpty=False) and (sbProf.Down=True) then
     begin
      MessBox('Не забудьте забрать лист с рецептом профарма у покупателя иначе вы будете оштрафованы на крупную сумму!',48);
     end;

    if Not RegDisountCard then Abort;

    // Если возврат на склад, то выходим
    if CP.TypeOplat=TO_BACK then
     try
      DateBackF:=TDateBackF.Create(Self);
      try
       DateBackF.Flag:=-1;
       DateBackF.ShowModal;
       if DateBackF.Flag=-2 then
        begin
         RefreshChek;
         MessBox('В чеке есть позиции, которые вы не можете вернуть с признаком "Переброска"!'+#10+'В чеке они подсвечены желтым цветом!');
        end;
       if DateBackF.Flag<=-1 then Abort;
       CP.Priznak:=DateBackF.Flag;
       CP.VzDescr:=DateBackF.edDescr.Text;
       Result:=True; Exit;
      finally
       DateBackF.Free;
      end;
     except
      Result:=False; Exit;
     end;

    {Если есть незакрытый чек (только для Datecs)}
    FNonClosed:=EKKA.fpIsNonClosedReceipt;
    if FNonClosed then
     begin
      if EKKA.LastError<>'' then begin MessBox(EKKA.LastError); Abort; end;
      btnCChek.Enabled:=False;
      Result:=True; Exit;
     end;

    if Prm.AptekaID in [39] then
     if Not EKKA.KeyPosition(KEY_W) then
      begin
       MainF.MessBox('Переведите ключ в положение [P]!');
       Abort;
      end;

    if (CP.TypeOplat=TO_CHP) or (cbEKKA.Checked) then
     begin

      if (lbNumCard50.Visible) or (CP.PrPayRecipt=21) then CP.NumbChek:=GetNewNumbChek(1)
                                                      else CP.NumbChek:=GetNewNumbChek;

      if CP.NumbChek=0 then begin MessBox('Ошибка определения номера чека!'); Abort; end;
      Result:=True; Exit;
     end else begin // Если чек по кассовому аппарату и он используется
               if Not CheckZRep then Abort;
               EKKA.fpCancelFiscalReceipt;
               if EKKA.ReceiptNumber<0 then Abort;
               CP.NumbChek:=EKKA.ReceiptNumber+1;
              end;

    if PayCount>0 then cbEKKA.Checked:=True;

    ShowStatus('Открытие нового чека...');
    if Not EKKA.fpOpenFiscalReceipt then
     begin
      MessBox('Не выполнилась открытие нового чека!'+#10+
              '_______________________________________________________________'+#10#10+EKKA.LastErrorDescr);
      Abort;
     end else WriteLog('Чек: №'+IntToStr(CP.NumbChek));
    ShowStatus('Чек открыт.');
    Result:=True;
   except
    Result:=False;
   end;
  end; {PriorCheking}

 // Дополнительные параметры пробивки чека (только для администраторских прав)
 function AddonInitCP:Boolean;
  begin
   Result:=True;
   if CP.TypeOplat=TO_BACK then Exit;
   if Not (IsPermit([],P_SILENT)) then Exit;
   CP.Priznak:=200;
   try
    InitCPF:=TInitCPF.Create(Self);
    try
     InitCPF.CP:=CP;
     InitCPF.ShowModal;
     if InitCPF.Flag=1 then
      begin
       CP:=InitCPF.CP;
      end else  Result:=False;
    finally
     InitCPF.Free;
    end;
   except
    MessBox(ER_CR_FORM);
   end;
  end; {AddonInitCP}

 // Показывает список подарков
 procedure ShowMessAkcii;
  begin
   if FTypeChek=TC_BACK then Exit;
   try
    DM.qrShAkcii.Close;
    DM.qrShAkcii.SQL.Clear;
    DM.qrShAkcii.SQL.Add('select a.art_code,a.names,Sum(a.kol) as kol from Chek a,DtAkcii b ');
    DM.qrShAkcii.SQL.Add('where a.art_code=b.art_add and a.compname=host_name() and a.id_user='+IntToStr(Prm.UserID));
    DM.qrShAkcii.SQL.Add('group by a.art_code,a.names order by 2 ');
    DM.qrShAkcii.Open;
    if DM.qrShAkcii.IsEmpty then Exit;
    ShowAkciiF:=TShowAkciiF.Create(Self);
    try
     if DM.qrShAkcii.RecordCount>1 then ShowAkciiF.Label1.Caption:='Не забудьте выдать покупателю следующие подарки';
     ShowAkciiF.ShowModal;
    finally
     ShowAkciiF.Free;
    end;
   except
   end;
  end; {ShowMEssAkcii}

 // Устанавливает дополнительную скидку
 procedure CorrSkd50;
 var S1,S2:String;
  begin
{   if Not IsSkdDop then Exit;
//   if Not (Prm.AptekaID in [6,11,20,21,22,24,17..19,8,7,30..38]) then Exit;
   S1:='0'; S2:='NULL';
   if lbNumCard50.Visible then
    begin
//     S1:='(cena*kol-IsNull(SumSkd,0))*@perc/100.';
     S1:='(cena*kol-IsNull(SumSkd,0))';
     S2:='1';
     FlagW:=True;
    end;
   DM.QrDS.Close;
   DM.QrDS.SQL.Clear;
//   DM.Qr.SQL.Add('declare @perc numeric(8,2)');
//   DM.Qr.SQL.Add('select @perc= IsNull(convert(numeric(8,2),Value),0) from Spr_Const where Descr=''Skd50''');
   DM.QrDS.SQL.Add('Update Chek set SumSkdK='+S1+', NumCardK='+S2+' where id_user='+IntToStr(Prm.UserID));
   DM.QrDS.ExecSQL;
//   DM.qrChek.Close;
//   DM.qrChek.Open;
   ReOpenChek;
}
  end; {CorrCena10}

 Begin
  if FPayWork then Exit;
  Result:=False;
  try
   FPayWork:=True;
   Init;
   for iii:=1 to 2 do
    begin
     CP.Iter:=iii;
     if iii=1 then
      begin
       if (IsKiosk) and (CP.TypeOplat=TO_CASH) and (CP.PrPayRecipt=20) then Continue;
      end else
     if iii=2 then
      begin
       PayCount:=0;
       if (IsKiosk=False) or (CP.TypeOplat<>TO_CASH) or (CP.PrPayRecipt=0) then Break;
      end;
     if Not PriorCheking then Exit;
     if Not AddonInitCP then Exit;
     dbgChek.Enabled:=False;
     try
      DM.ADOCo.BeginTrans;
      try
       CorrSkd50;
       ShowMEssAkcii;
       DM.WriteChek(CP);
       if Not MDMUSendRealiz(CP) then Abort;
       if FNonClosed=False then FiscalChek(DM.qrChek,CP,True)
                           else ForceCloseReceipt(CP.TypeOplat);
       DM.ADOCo.CommitTrans;
       Result:=True;
       PrepChek;
       MediSendRealiz(CP);
      except
       on E:Exception do
        begin
         EKKA.fpCancelFiscalReceipt;
         DM.ADOCo.RollbackTrans;
         ShowExceptMessage(E);
         Exit;
        end;
     end;
    finally
     dbgChek.Enabled:=True;
     dbgChek.Repaint;
     if dbgSklad.Visible then dbgSklad.SetFocus;
     cbEKKA.Checked:=cb_EKKA;
    end;
   end;
   EndChek;
  finally
   FIDRES:=-1;
   FlagW:=False;
   FPayWork:=False;
   lbNumCard50.Visible:=False;
   cbEKKA.Checked:=Not(UseEKKASafe);
  end;
 End; {PayChek}

// Описание действий по закрытию чека
procedure TMainF.CloseChekExecute(Sender:TObject);
 begin
  if TControl(Sender).Enabled then
   begin
    if Sender=btnPayCash then PayChek(TO_CASH) else
    if Sender=btnPayChek then PayChek(TO_CHEK) else
    if Sender=btnBack    then PayChek(TO_BACK);
   end;
 end; {CloseChekExecute}

// Переключение флага использования EKKA
procedure TMainF.cbEKKAClick(Sender:TObject);
 begin
  EKKA.UseEKKA:=Not(TCheckBox(Sender).Checked);
 end; {cbEKKAClick}

// Обработчики контекстного меню pmMain
procedure TMainF.miOpenChekClick(Sender:TObject); begin TypeChek:=TC_MAIN; OpenChek; end;
procedure TMainF.miCancelChekClick(Sender:TObject); begin CancelChek(1); end;
procedure TMainF.miCloseChekClick(Sender:TObject); begin CloseChekExecute(btnPayCash); end;
procedure TMainF.miChekClick(Sender:TObject); begin CloseChekExecute(btnPayChek); end;
procedure TMainF.miFixSkdClick(Sender:TObject); begin SwitchSkd(sbFix,Sender); end;
procedure TMainF.miCardSkdClick(Sender:TObject); begin SwitchSkd(sbCard,Sender); end;
procedure TMainF.miSumSkdClick(Sender:TObject); begin SwitchSkd(sbSumm,Sender); end;

//*************************************

// Раскраска Справочника товаров
procedure TMainF.dbgSkladDrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
var db:TDBGrid;
    dR,sR:TRect;
    Art_Code:Integer;
    PCena:String;
    C:TColor;

 procedure MarkColumn(N:Integer);
  begin
   if Column=db.Columns[N] then db.Canvas.Brush.Color:=Cl.Order;
  end;

 procedure Transp(dr:TRect);
 var j,i:Integer;
  begin
   C:=db.Canvas.Pixels[dr.Left,dr.Top];
   for j:=dr.Top to dr.Bottom do
    for i:=dr.Left to dr.Right do
     if db.Canvas.Pixels[i,j]=C then
      db.Canvas.Pixels[i,j]:=db.Canvas.Brush.Color;
  end;

 Begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  Case SprOrder of
   O_ART_CODE:MarkColumn(0);
   O_NAMES   :MarkColumn(2);
  end;

  Art_Code:=db.DataSource.DataSet.FieldByName('Art_Code').AsInteger;

  if db.DataSource.DataSet.FieldByName('OSTAT').AsInteger<=0 then
   begin

    if db.DataSource.DataSet.FieldByName('F_NDS').AsInteger>2 then
     db.Canvas.Brush.Color:=clPurple
    else begin
          if Prm.RealizMinus then
           begin
            if db.DataSource.DataSet.FieldByName('OSTAT').AsInteger=0 then db.Canvas.Brush.Color:=clGray
                                                                      else db.Canvas.Brush.Color:=$008080FF;
           end else db.Canvas.Brush.Color:=clRed;
         end;

    db.Canvas.Font.Color:=clWhite;
   end;
  if db.DataSource.DataSet.FieldByName('F_NDS').AsInteger>2 then db.Canvas.Font.Style:=[fsItalic,fsBold];

  if (IsSrok(db.DataSource.DataSet.FieldByName('NAMES').AsString)) and (DataCol=2) then
   begin
    db.Canvas.Brush.Color:=$00D2D2FF;
   end;

  try
   if High(FArtCodeList)>=Art_Code then
    if (FArtCodeList[Art_Code].Color<>-1) and (DataCol in [3,4]) then db.Canvas.Brush.Color:=FArtCodeList[Art_Code].Color;
  except
  end;

  if (db.DataSource.DataSet.FieldByName('IsScan').AsInteger<>0) and(DataCol=0) then
   begin
    db.Canvas.Brush.Color:=$00FFD98A;
    db.Canvas.Font.Color:=clBlack;
   end;

  if (gdSelected in State) then
   begin
    if (db.DataSource.DataSet.FieldByName('OSTAT').AsInteger>0) or
       ((db.DataSource.DataSet.FieldByName('OSTAT').AsInteger<=0) and (DataCol=0)) then
     begin
      db.Canvas.Brush.Color:=clNavy;
      db.Canvas.Font.Color:=clWhite;
     end;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);

  if DataCol=11 then
   begin
    PCena:=CurrToStrF(db.DataSource.DataSet.FieldByName('Cena').AsFloat*(100-upPercShow.Position)/100,ffFixed,2);
    db.Canvas.Font.Color:=clOlive;
    db.Canvas.TextOut(Rect.Right-3-db.Canvas.TextWidth(PCena),Rect.Top+2,PCena);
   end;

  if DataCol=12 then
   begin
    PCena:=CurrToStrF(db.DataSource.DataSet.FieldByName('CenaUp').AsFloat*(100-upPercShow.Position)/100,ffFixed,2);
    db.Canvas.Font.Color:=clOlive;
    db.Canvas.TextOut(Rect.Right-3-db.Canvas.TextWidth(PCena),Rect.Top+2,PCena);
   end;

  {--- Рисование значка "Разрешенные для несканирования"}
  if (db.DataSource.DataSet.FieldByName('IsScan').AsInteger<>0) and (DataCol=0) then
   begin
    dR:=Rect;
    dr.Left:=dr.Left+2; dr.Top:=dr.Top+2;
    dr.Right:=dR.Left+imNoScan.Width; dr.Bottom:=dR.Top+imNoScan.Height;
    sR.Left:=0; sR.Top:=0;
    sR.Right:=imNoScan.Width; sR.Bottom:=imNoScan.Height;
    db.Canvas.CopyRect(dR,imNoScan.Canvas,sR);
   end;

  {--- Рисование значка "Есть аннотация"}
  if DataCol=3 then
   try
    if High(FArtCodeList)>=Art_Code then
     if FArtCodeList[Art_Code].Annot=1 then
      begin
       dR:=Rect;
       dr.Left:=dr.Left+2; dr.Top:=dr.Top+2;
       dr.Right:=dR.Left+imAnnot.Width; dr.Bottom:=dR.Top+imAnnot.Height;
       sR.Left:=0; sR.Top:=0;
       sR.Right:=imAnnot.Width; sR.Bottom:=imAnnot.Height;

       db.Canvas.CopyRect(dR,imAnnot.Canvas,sR);
       if (gdSelected in State) then Transp(dr);
      end;
   except
   end;

  {--- Рисование значка "Рецептура"}
  if (DataCol=2) and (db.DataSource.DataSet.FieldByName('F_NDS').AsInteger=2) then
   try
    if High(FArtCodeList)>=Art_Code then
     if FArtCodeList[Art_Code].Recipt=1 then
      begin
       db.Canvas.FillRect(Rect);
       db.Canvas.TextOut(Rect.Left+20, Rect.Top+1,db.DataSource.DataSet.FieldByName('NAMES').AsString);
       dR:=Rect;
       dr.Left:=dr.Left+2; dr.Top:=dr.Top+2;
       dr.Right:=dR.Left+imRecipt.Width; dr.Bottom:=dR.Top+imRecipt.Height;
       sR.Left:=0; sR.Top:=0;
       sR.Right:=imRecipt.Width; sR.Bottom:=imRecipt.Height;

       db.Canvas.CopyRect(dR,imRecipt.Canvas,sR);
       if (gdSelected in State) then Transp(dr);
      end;
   except
   end;

  {--- Рисование значка "Есть автозамена"}
  if (db.DataSource.DataSet.FieldByName('IsMap').AsInteger<>0) and (DataCol=2) then
   try
    dR:=Rect;
    dr.Left:=dr.Right-imAvto.Width-2; dr.Top:=dr.Top+2; dr.Bottom:=dR.Top+imAvto.Height;
    dr.Right:=dr.Right-2;
    sR.Left:=0; sR.Top:=0;
    sR.Right:=imAvto.Width; sR.Bottom:=imAvto.Height;

    db.Canvas.CopyRect(dR,imAvto.Canvas,sR);
    if (gdSelected in State) then Transp(dr);
   except
   end;

 End; {dbgSkladDrawColumnCell}

// Раскраска Чека
procedure TMainF.dbgChekDrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
var db:TDBGrid;
    pr:Integer;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if db.DataSource.DataSet.FieldByName('F_NDS').AsInteger>2 then
   begin
    db.Canvas.Brush.Color:=clBlue;
    db.Canvas.Font.Color:=clWhite;
    db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
   end;
  pr:=db.DataSource.DataSet.FieldByName('PRINTING').AsInteger;
  if pr>0 then
   begin
    if (gdSelected in State) and (DataCol=2) then
     begin
      db.Canvas.Brush.Color:=clNavy;
      db.Canvas.Font.Color:=clWhite;
     end else begin
               Case pr of
                  1:db.Canvas.Brush.Color:=clLime;
                2,3:db.Canvas.Brush.Color:=clYellow;
               end; 
               db.Canvas.Font.Color:=clBlack;
              end;
    db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
   end;
 end; {dbgChekDrawColumnCell}

// Блокировка программы и организация смены пользователя
procedure TMainF.miBlockNClick(Sender:TObject);
 begin
  try
   FChangeUser:=False;
   BlockingF:=TBlockingF.Create(Self);
   try
    BlockingF.ShowModal;
    Case BlockingF.Flag of
     1:begin FChangeUser:=True; Close; end;
     2:Close;
    end;
   finally
    BlockingF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miBlockNClick}

// Переключение скидок
procedure TMainF.SwitchSkd(sb,mi:TObject);
 begin
  if TSpeedButton(sb).Visible then
   if TSpeedButton(sb).Enabled then
    begin
     TMenuItem(mi).Checked:=Not(TMenuItem(mi).Checked);
     TSpeedButton(sb).Down:=TMenuItem(mi).Checked;
     TSpeedButton(sb).Click;
    end;
 end; {SwitchSkd}

// Вызов окна "Настройки"
procedure TMainF.miOptionsClick(Sender:TObject);
 begin
  if IsPermit([],P_ALERT) then
   try
    OptF:=TOptF.Create(Self);
    try
     OptF.ShowModal;
    finally
     OptF.Free;
    end;
   except
    MessBox(ER_CR_FORM);
   end;
 end; {miOptionsClick}

// Запись значения в ини файл любой
function TMainF.WriteToIni(FName:String; F:String; V:Variant):Boolean;
var IniF:TIniFile;
 begin
  try
   IniF:=TIniFile.Create(FName);
   try
    IniF.WriteString(Prm.Prof,F,V);
    Result:=True;
   finally
    IniF.Free;
   end;
  except
   Result:=False;
  end;
 end; {WriteToIni}

// Запись значения в ини файл Prm.OptFile
function TMainF.WriteToIni(F:String; V:Variant):Boolean;
 begin
  Result:=WriteToIni(Prm.OptFile,F,V);
 end; {WriteToIni}

// Читает значение из ини файла в виде строки
function TMainF.ReadFromIni(FName:String; F,Def:String):String;
var IniF:TIniFile;
 begin
  try
   Result:='';
   IniF:=TIniFile.Create(FName);
   try
    Result:=IniF.ReadString(Prm.Prof,F,Def);
   finally
    IniF.Free;
   end;
  except
   Result:='';
  end;
 end; {ReadFromIni}

// Читает значение из ини файла Prm.OptFile в виде строки
function TMainF.ReadFromIni(F,Def:String):String;
 begin
  Result:=ReadFromIni(Prm.OptFile,F,Def);
 end; {ReadFromIni}

// Вызов окна "Движение товара"
procedure TMainF.miMoveTovClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  if DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger<>0 then
   try
    MoveTovF:=TMoveTovF.Create(Self);
    try
     MoveTovF.ShowModal;
    finally
     MoveTovF.Free;
    end;
   except
    MessBox(ER_CR_FORM);
   end;
 end; {miMoveTovClick}

// Вызов окна "Проверка остатков"
procedure TMainF.miCheckOstClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  ShowOstatCheckF;
 end; {miCheckOstClick}

// Ортировка справочника по наименованию или арт_коду
procedure TMainF.dbgSkladTitleClick(Column: TColumn);
 begin
  if Column=dbgSklad.Columns[0] then SprOrder:=O_ART_CODE else
  if Column=dbgSklad.Columns[2] then SprOrder:=O_NAMES;
 end; {dbgSkladTitleClick}

// Организация поиска в чеке (вручную или со сканера) 
procedure TMainF.dbgChekKeyPress(Sender:TObject; var Key:Char);
var IsFind:Boolean;
 begin
  if Sender=nil then Exit;
  if Key in CH_DIGIT then
   begin
    lbCheck.Caption:=lbCheck.Caption+Key;
    lbCheck.Caption:=FindEAN13(TDBGrid(Sender),lbCheck.Caption,SC_CHEK,1,IsFind);
   end;
 end; {dbgChekKeyPress}

// Подсчет сдачи по чеку
procedure TMainF.edCashChange(Sender:TObject);
var sm:Currency;
    ed:TEdit;
 begin
  try
   if Sender=nil then Exit;
   ed:=TEdit(Sender);
   if ed.Text<>'' then
    try
     sm:=StrToCurr(ed.Text)-SumChekFull;
     if sm<0 then lbSumCash.Caption:='0.00'
             else lbSumCash.Caption:=CurrToStrF(sm,ffFixed,2);
    except
     ed.Text:='0';
     lbSumCash.Caption:='0.00';
    end;
  except
  end;
 end; {edCashChange}

// Ввод только цифр и дробных разделителей в окне ввода суммы от покупателя
procedure TMainF.edCashKeyPress(Sender:TObject; var Key:Char);
var S:Set of Char;
 begin
  if (Key='.') or (Key=',') then Key:=GetDivPoint;
  S:=CH_DIGIT;
  Include(S,GetDivPoint);
  try
   if Key in S then StrToCurr(edCash.Text+Key) else
   if Key<>#8 then Abort;
  except
   Key:=#0;
  end;
 end; {edCashKeyPress}

// Ввод суммы с помощью кнопок калькулятора 
procedure TMainF.sb1Click(Sender:TObject);
var sb:TSpeedButton;
 begin
  if Sender=nil then Exit;
  sb:=TSpeedButton(Sender);
  if edCash.Text='' then edCash.Text:='0';
  try
   edCash.Text:=CurrToStr(StrToCurr(edCash.Text)+sb.Tag);
  except
  end;
 end; {sb1Click}

// Кнопка очистки окна ввода суммы от покупателя
procedure TMainF.sbClearClick(Sender:TObject);
 begin
  edCash.Text:='0';
 end; {sbClearClick}

// Вызов окна "ОТЧЕТЫ (Z,&X, внесение/выдача)"
procedure TMainF.miZXClick(Sender:TObject);
 begin
  try
   ZXRepF:=TZXRepF.Create(Self);
   try
    ZXRepF.ShowModal;
   finally
    ZXRepF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miZXClick}

// Вывод ошибка кассового аппарата если она была
procedure TMainF.ShowErrorEKKA(Res:Boolean);
 begin
  if (Res) and (EKKA.LastError='') then Exit;
  if EKKA.LastError<>'' then
  MessBox(EKKA.LastErrorDescr);
 end; {CheckEKKA}

// Отображение штрих-кода по выбранной позиции
procedure TMainF.ShowEAN13(Source:TDataSet);
 begin
  if Not IsPermit([],P_SILENT) then Exit;
  if Source.IsEmpty then Exit;
  try
   ShowEAN13F:=TShowEAN13F.Create(Self);
   try
    ShowEAN13F.Panel2.Caption:='  '+Source.FieldByName('Art_Code').AsString+' '+Source.FieldByName('Names').AsString;
    DM.qrEAN.Close;
    DM.qrEAN.SQL.Text:='select * from sprean where art_code='+Source.FieldByName('Art_Code').AsString+' order by EAN13';
    DM.qrEAN.Open;
    if DM.qrEAN.IsEmpty then
     MessBox('Штрих-код на препарат '+Source.FieldByName('Names').AsString+' отсутствует!')
    else
     ShowEAN13F.ShowModal;
   finally
    ShowEAN13F.Free;
   end;
  except
   MainF.MessBox(ER_CR_FORM);
  end;
 end; {ShowEAN13}

// Вызов окна Штрих-кодов выбранного товара
procedure TMainF.miEAN13InfoClick(Sender:TObject);
 begin
  if dbgSklad.Focused then ShowEAN13(dbgSklad.DataSource.DataSet) else
  if dbgChek.Focused then ShowEAN13(dbgChek.DataSource.DataSet);
 end; {miEAN13InfoClick}

// Выгрузка конкретного файла для флешки со всеми проверками
function TMainF.UnLoadFile(P:Integer; Path:String):Boolean;
var Pth,FN:String;
    sl:TStringList;
    i:Integer;
    A:TStrArray;
 begin
  try
   ForceDirectories(Path);
   Pth:=Copy(WorkPath,3,Length(WorkPath));
   if IsServer then
    DeleteFile(WorkPath+'\ARH\'+FN)
   else
    DeleteFile('\\'+Prm.ServerKompName+Pth+'\ARH\'+FN);

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('exec spY_UnLoad '+IntToStr(P)+','''+Opt.ServerWorkPath+'ARH\'',999,5 ,'''+Opt.BaseUser+''','''+Opt.BasePassw+'''');
   DM.Qr.ExecSQL;

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select Max(FName) as FName from FileList where Num='+IntToStr(P);
   DM.Qr.Open;
   FN:=DM.Qr.FieldByName('FName').AsString+IntToStr(Prm.AptekaID)+'.txt';

   if IsServer then
    CopyFile(PChar(WorkPath+'\ARH\'+FN),PChar(Path+FN),False)
   else
    CopyFile(PChar('\\'+Prm.ServerKompName+Pth+'\ARH\'+FN),PChar(Path+FN),False);

   if Not FileExists(Path+FN) then Abort;
   if P=20 then
    try
     sl:=TStringList.Create;
     try
      sl.LoadFromFile(Path+FN);
      FMistake:=False;
      FMistakes:=[];
      for i:=0 to sl.Count-1 do
       begin
        GetStrArray(sl[i],A,['|']);
        if A[1]='Период' then Continue;
        if A[2]<>'OK' then
         begin
          Mistake:=True;
          Include(FMistakes,i);
         end;
       end;
     finally
      sl.Free;
     end;
    except
    end;
   Result:=True;
  except
   Result:=False;
  end;
 end; {UnLoadFile}

// Проверка выгрузки файлов
function TMainF.CheckUnLoad(Path:String):String;
var i:Integer;
 begin
  Result:='';
  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select * from FileList order by Num';
  DM.QrEx.Open;
  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    if DM.QrEx.FieldByName('Requir').AsInteger=1 then
     if Not(FileExists(Path+DM.QrEx.FieldByName('FName').AsString+IntToStr(Prm.AptekaID)+'.txt')) then Result:=Result+'Не выгрузился файл "'+DM.QrEx.FieldByName('Descr').AsString+'"'+#10;
   end;
 end; {ChekUnLoad}

// Выгрузка всех остатков
procedure TMainF.UnLoadFiles(Path:String);
var i:Integer;
 begin
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select * from FileList order by Num';
   DM.QrEx.Open;
   pbUnLoad.Position:=0;
   pbUnLoad.Max:=DM.QrEx.RecordCount;
   pbUnLoad.Visible:=True;
   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;
     UnLoadFile(DM.QrEx.FieldByName('Num').AsInteger,Path);
     ShowStatus('Выгружаются: "'+DM.QrEx.FieldByName('Descr').AsString+'"',2);
     pbUnLoad.Position:=i+1;
     Application.ProcessMessages;
    end;
  finally
   pbUnLoad.Visible:=False;
   ShowStatus('',2);
  end;
  pbUnLoad.Visible:=False;
 end; {UnLoadFiles}

// Отправка почты
procedure TMainF.SendMail;
var i:Integer;
    FL:String;
 begin
  try
   ShowStatus('Подготовка информации для отправки...');
   UnLoadFiles(WorkPath+'\Mail\');
   SMTP.Host:=Opt.SMTPHost;
   SMTP.Port:=Opt.SMTPPort;
   With IdMessage do
    begin
     Body.Text:=' ';
     From.Text:='apteka@ukr.net';
     Recipients.EMailAddresses:=Opt.EMailAddress;
     Subject:=Prm.AptName+' za '+FormatDateTime('dd.mm.yyyy hh:nn:ss',Now);
     DM.QrEx.Close;
     DM.QrEx.SQL.Text:='select * from FileList order by Num';
     DM.QrEx.Open;
     for i:=1 to DM.QrEx.RecordCount do
      begin
       if i=1 then DM.QrEx.First else DM.QrEx.Next;
       if DM.QrEx.FieldByName('Requir').AsInteger=1 then
        begin
         FL:=WorkPath+'\Mail\'+Dm.QrEx.FieldByName('FName').AsString+IntToStr(Prm.AptekaID)+'.txt';
         if FileExists(FL) then TIdAttachment.Create(IdMessage.MessageParts,FL);
        end;
      end;
    end;
   ShowStatus('Установка соединения с SMTP-сервером!');
   SMTP.Connect;
   try
    ShowStatus('Идет отправка почты. Подождите...');
    SMTP.Send(IdMessage);
   finally
    SMTP.Disconnect;
   end;
   MainF.MessBox('Почта отправлена!',64);
  except
   on E:Exception do MainF.MessBox('Ошибка отправки почты: '+E.Message);
  end;
  ShowStatus('');
 end; {SendMail}

// Копирует текстовые файлики лога робивки по ЕККА за текущий период
procedure TMainF.CopyTextLog(Path:String);
var FromP,ToP:String;
    sr:TSearchRec;

 function ExtractDate(S:String):TDateTime;
 var ss:String;
  begin
   ss:=Copy(S,8,8);
   Result:=StrToDate(Copy(ss,1,2)+'.'+Copy(ss,3,2)+'.'+Copy(ss,5,4));
  end;

 Begin
  try
   FromP:=WorkPath+'\Txt';
   ToP:=Path+'TextLog\';
   ForceDirectories(Path+'TextLog\');
   DelDir(ToP+'*');
   if FindFirst(FromP+'\Kassa'+IntToStr(Opt.KassaID)+'*.txt', faArchive,sr)=0 then
    begin
     Repeat
      try
       if (ExtractDate(sr.Name)>=BegPeriod) and (ExtractDate(sr.Name)<=EndPeriod) then
        CopyFile(PChar(FromP+'\'+sr.Name),PChar(ToP+sr.Name),False);
      except
      end;
     Until FindNext(sr)<>0;
     FindClose(sr);
    end;
  except
  end;
 End; {CopyTextLog}

// Выгрузка базы каждого второго числа месяца
procedure TMainF.PrepareBase;
 begin
// if (FormatDateTime('dd',Date)='02') or (Mistake=True) then
  try
   pnUnBase.Visible:=True;
   UnLoadBase(DM.Qr,Opt.FlashPath,False);
   if 1 in Mistakes then CopyTextLog(Opt.FlashPath);
   Delay(3);
  finally
   pnUnBase.Visible:=False;
  end;
 end; {PrepareBase}

// Выгрузка различных данных на флешку
procedure TMainF.UnLoadToFlash(P:Integer);
var Path,Mess,S:String;
    bt:Integer;
 begin
  if Not DirectoryExists(Opt.FlashPath) then
   MessBox('                              Вставте флешку!                                ',64);
  bt:=0;
  Repeat
   if Not DirectoryExists(Opt.FlashPath) then
   if MessBox('Флешка не найдена! Вставтье флешку в исправный разъем и нажмите "Да"'+
              #10+' Нажмите "Нет" для отмены выгрузки остатков.',52)=ID_NO then Exit
   else else Break;
  Until False;
  Case P of
   UN_BASE:begin
            if UnLoadBase(DM.Qr,Opt.FlashPath,False) then
             begin
              bt:=64;
              Mess:='                  База выгружена успешно!                  ';
             end else begin bt:=48; Mess:='Ошибка выгрузки базы!'; end;
           end;
   UN_ARHO:begin
            Path:=Opt.FlashPath+FormatDateTime('dd.mm.yy',Date)+'\';
            ExecScript(Opt.FlashPath+'\SQLScript'+IntToStr(Prm.AptekaID)+'.sql');
            UnLoadFiles(Path);
            if Prm.FirmID=5 then UnLoadFor271(StrToDate(DateToStr(Date-15)),Date,Path);
            CopyArh(Opt.FlashPath);
            S:=CheckUnLoad(Path);
            PrepareBase;
            if S<>'' then begin
                           Mess:=S; bt:=48;
                          end else begin
                                    bt:=64;
                                    Mess:='                  Все выгружено успешно!                  ';
                                   end;
           end;
  end;
  Delay(5);
  //EjectUSB;
  MainF.MessBox(Mess,bt);
 end; {UnLoadToFlash}

// Пункт меню "Выгрузить все на флешку"
procedure TMainF.miUnloadFlashClick(Sender:TObject);
 begin
  if (Time>StrToTime('22:00:00')) and (Time<=StrToTime('23:59:59')) then pnFlash.Visible:=True;
  try
   UnLoadToFlash(UN_ARHO);

  finally
   pnFlash.Visible:=False;
  end;
 end; {miUnloadFlashClick}

// Пункт меню "Проверка сумм по Z-отчетам"
procedure TMainF.miCheckSumZClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  ShowSumZ;
 end; {miCheckSumZClick}

// Пункт меню "История накладных"
procedure TMainF.miHistoryClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   ViewNaklF:=TViewNaklF.Create(Self);
   try
    ViewNaklF.ShowModal;
   finally
    ViewNaklF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miHistoryClick}

// Поиск по вхождению в справочнике товара выбраной позиции 
procedure TMainF.cbFindCloseUp(Sender:TObject);
 begin
  try
   if Not(DM.qrFind.IsEmpty) then
    begin
     DM.qrFind.First;
     DM.qrFind.MoveBy(cbFind.ItemIndex);
     SetType_Tov(DM.qrFind.FieldByName('Type_Tov').AsInteger);
     dbgSklad.DataSource.DataSet.Locate('Art_Code',DM.qrFind.FieldByName('Art_Code').AsInteger,[loCaseInsensitive,loPartialKey]);
    end;
  finally
   EscFind;
  end;
 end; {cbFindCloseUp}

procedure TMainF.cbFindEnter(Sender:TObject);
 begin
  if Not (cbFind.DroppedDown) then cbFind.DroppedDown:=False;
 end; {cbFindEnter}

// Отмена поиска по вхождению
procedure TMainF.EscFind;
 begin
  cbFind.Visible:=False;
  dbgsklad.SetFocus;
 end; {EscFind}

// Обработчик нажатия кнопок в окне поиска по вхождению
procedure TMainF.cbFindKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key=VK_ESCAPE then EscFind;
 end; {cbFindKeyDown}

// Если фокус ввода из окна поиска по входжению переключился на другой контрол
procedure TMainF.cbFindExit(Sender:TObject);
 begin
  EscFind;
 end; {cbFindExit}

// Пункт меню "Поиск по вхождению"
procedure TMainF.miFindExClick(Sender:TObject);
var i:Integer;
 begin
  try
   EnterStrF:=TEnterStrF.Create(Self);
   try
    EnterStrF.ShowModal;
    if EnterStrF.Flag=1 then
     begin
      DM.qrFind.Close;
      DM.qrFind.SQL.Clear;
      DM.qrFind.SQL.Add('select Art_Code,Names,Type_Tov');
      DM.qrFind.SQL.Add('from SprTov');
      DM.qrFind.SQL.Add('where names like ''%'+EnterStrF.edStr.Text+'%'' ');
      if cbBoxZero.Checked then
       DM.qrFind.SQL.Add('and ostat>0');
      DM.qrFind.SQL.Add('group by Art_Code,Names,Type_Tov');
      DM.qrFind.SQL.Add('order by Names ');
      DM.qrFind.Open;
      if DM.qrFind.RecordCount<=0 then Exit;
      cbFind.Clear;
      for i:=1 to DM.qrFind.RecordCount do
       begin
        if i=1 then DM.qrFind.First else DM.qrFind.Next;
        cbFind.Items.Add(DM.qrFind.FieldByname('Names').AsString);
       end;
      cbFind.Visible:=True;
      cbFind.SetFocus;
      cbFind.ItemIndex:=0;
      cbFind.DroppedDown:=True;
     end;
   finally
    EnterStrF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miFindExClick}

// Пункт меню "Пробитие оптовой суммы"
procedure TMainF.miOptSumClick(Sender:TObject);
 begin
  if Not(IsPermit([R_ADMIN],P_ALERT)) then Exit;
  try
   OptSumF:=TOptSumF.Create(Self);
   try
    OptSumF.Flag:=SM_OPT;
    OptSumF.ShowModal;
   finally
    OptSumF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miOptSumClick}

// Пункт меню "Выгрузить базу на флешку"
procedure TMainF.miUnloadBaseClick(Sender:TObject);
 begin
  UnLoadToFlash(UN_BASE);
 end; {miUnloadBaseClick}

// Пункт меню "Заявка"
procedure TMainF.miZakazClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  ShowZakazF;
 end; {miZakazClick}

// Пункт контекстного меню "Добавить позицию в отказы"
procedure TMainF.miAddOtkazClick(Sender:TObject);
var DefKol,Tg,Flag,Kol,Art_Code:Integer;
    Names,Cena:String;

 begin
  if Sender=nil then Exit;
  Tg:=TMenuItem(Sender).Tag;
  Flag:=0;
  Art_Code:=0;
  Names:='';
  try
   if Tg=2 then
    begin
     Flag:=3;
     Cena:=DM.spY_FilterSklad.FieldByName('Cena').AsString;
    end else
    begin
     PrOtkazF:=TPrOtkazF.Create(Self);
     try
      PrOtkazF.Tp:=Tg;
      PrOtkazF.ShowModal;
      if PrOtkazF.Flag=0 then Exit;
      Flag:=PrOtkazF.Flag;
      if Tg=1 then
       begin
        Names:=PrOtkazF.edName.Text;
        Art_Code:=PrOtkazF.edName.Tag;
       end;
      if Flag in [1,3] then
       begin
        if Tg=1 then Cena:='0'
                else Cena:=DM.spY_FilterSklad.FieldByName('Cena').AsString;
        end else Cena:=CurrToStrF(PrOtkazF.Cena,ffFixed,2);
     finally
      PrOtkazF.Free;
     end;
    end; 

  except
   MessBox(ER_CR_FORM);
  end;
  if Flag=1 then DefKol:=0 else DefKol:=1;
  if Tg=1 then
   begin
    Kol:=GetKolFromDialog(TrimRight(Names),DefKol,Art_Code,EN_SIMPLE);
   end else begin
             if DM.spY_FilterSklad.IsEmpty then Exit;
             Kol:=GetKolFromDialog(TrimRight(DM.spY_FilterSklad.FieldByName('Names').AsString),DefKol,Art_Code,EN_SIMPLE);
             Art_Code:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;
            end;

  if (Kol<0) or ((Kol=0) and (Flag=3)) then Exit;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('declare @rl int');
   DM.Qr.SQL.Add('select @rl=IsNull(Sum(kol),0)                                            ');
   DM.Qr.SQL.Add('from ExpCheks a, SprTov b                                                ');
   DM.Qr.SQL.Add('where a.kol>0 and a.kod_name=b.kod_name and                              ');
   DM.Qr.SQL.Add('      a.date_chek>getdate()-30 and                                       ');
   DM.Qr.SQL.Add('      b.art_code='+DM.spY_FilterSklad.FieldByName('Art_Code').AsString    );
   DM.Qr.SQL.Add('select @rl=IsNull(Sum(kol),0)                                            ');
   DM.Qr.SQL.Add('from ArhCheks a, SprTov b                                                ');
   DM.Qr.SQL.Add('where a.kol>0 and a.kod_name=b.kod_name and                              ');
   DM.Qr.SQL.Add('      a.date_chek>getdate()-30 and                                       ');
   DM.Qr.SQL.Add('      b.art_code='+IntToStr(Art_Code)                                     );
   DM.Qr.SQL.Add('declare @cn int');
   DM.Qr.SQL.Add('select @cn=IsNull(Count(*),0) from Otkaz where art_code='+IntToStr(Art_Code));
   DM.Qr.SQL.Add('                                           and date_otkaz='''+FormatDateTime('yyyy-mm-dd',Date)+' 00:00:00''');

  // if Flag=3 then Flag:=1;
   DM.Qr.SQL.Add(' Insert into Otkaz(date_otkaz,art_code,realiz,otkaz,priznak,cena,names,id_user)   ');
   DM.Qr.SQL.Add(' Values(getdate(),                                                        ');
   DM.Qr.SQL.Add(IntToStr(Art_Code)+',                     ');
   DM.Qr.SQL.Add(' @rl,');
   DM.Qr.SQL.Add(IntToStr(Kol)+','+IntToStr(Flag)+','+Cena+','''+Names+''','+IntToStr(Prm.UserID)+')');
   DM.Qr.ExecSQL;
   {
    if Tg=1 then
     MessBox('Позиция "'+TrimRight(Names)+'" в таблицу отказов добавлена!',64)
    else
     MessBox('Позиция "'+TrimRight(DM.spY_FilterSklad.FieldByName('Names').AsString)+'" в таблицу отказов добавлена!',64)
   }
  except
   on E:Exception do
    MessBox('Ошибка добавления позици в отказы: '+E.Message);
  end;
 end; {miAddOtkazClick}

// Пункт меню "Движение денег по кассе"
procedure TMainF.miMoveMoneyClick(Sender:TObject);
 begin
  try
   MoveMoneyF:=TMoveMoneyF.Create(Self);
   try
    MoveMoneyF.ShowModal;
   finally
    MoveMoneyF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miMoveMoneyClick}

// Пункт меню "Информация о карточке"
procedure TMainF.miCardInfoClick(Sender:TObject);
 begin
  try
   ShowCardInfoF:=TShowCardInfoF.Create(Self);
   try
    ShowCardInfoF.ShowModal;
   finally
    ShowCardInfoF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miCardInfoClick}

// Кнопка "Печать ценников по чеку"
procedure TMainF.btPrCennikClick(Sender:TObject);
 begin
  ShowWorkSprF(W_CENNIK);
 end; {btPrCennikClick}

// Пункт меню "Отказы"
procedure TMainF.miOtkazClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   OtkazF:=TOtkazF.Create(Self);
   try
    OtkazF.ShowModal;
   finally
    OtkazF.Free;
    OtkazF:=nil;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miOtkazClick}

// Пункт меню "Неотсканированные позиции"  
procedure TMainF.miNoScanClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   NoScanF:=TNoScanF.Create(Self);
   try
    NoScanF.ShowModal;
   finally
    NoScanF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miNoScanClick}

// Вызов окна ATC-кодов для выбранной позиции товара
procedure TMainF.miATC1Click(Sender:TObject);
 begin
  if DM.spY_FilterSklad.IsEmpty then Exit;
  try
   ShowATCF:=TShowATCF.Create(Self);
   try
    ShowATCF.lbName.Caption:=DM.spY_FilterSklad.FieldByName('Names').AsString;
    ShowATCF.lbName.Tag:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;
    ShowATCF.ReOpen('a.Names');
//    if DM.qrATC.IsEmpty then Exit;
    ShowATCF.ShowModal;
    if ShowATCF.IsFind then
     begin
      SetType_Tov(DM.qrATC.FieldByName('Type_Tov').AsInteger);
      dbgSklad.DataSource.DataSet.Locate('Art_Code',DM.qrATC.FieldByName('Art_Code').AsInteger,[loCaseInsensitive,loPartialKey]);
     end;

   finally
    ShowATCF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miATC1Click}

// Пункт меню "Печать остатков"
procedure TMainF.miPrintOstClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   RepOstatF:=TRepOstatF.Create(Self);
   try
    RepOstatF.ShowModal;
   finally
    RepOstatF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miPrintOstClick}

// Пунтк меню "Загрузка накладных"
procedure TMainF.miLoadClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   LoadNaklF:=TLoadNaklF.Create(Self);
   try
    LoadNaklF.ShowModal;
    FilterSklad;
   finally
    LoadNaklF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miLoadClick}

// Пункт меню "Отчет пореализации"
procedure TMainF.miRepRealizClick(Sender:TObject);
var i:Integer;
    CP:TChekPos;
    Sm:Real;
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   RealizRepF:=TRealizRepF.Create(Self);
   try
    RealizRepF.ShowModal;
    if RealizRepF.Flag=1 then
     begin
      DM.ADOCo.BeginTrans;
      try
{
       DM.QrEx.Close;
       DM.QrEx.SQL.Clear;
       DM.QrEx.SQL.Add('declare @n int, @v bigint');
       DM.QrEx.SQL.Add('set @n='+DM.spY_ChekList.FieldByName('Numb_Chek').AsString);
       DM.QrEx.SQL.Add('set @v='+DM.spY_ChekList.FieldByName('Vzh').AsString);
       DM.QrEx.SQL.Add('update SprTov set ostat=ostat+b.kol');
       DM.QrEx.SQL.Add('from SprTov a, ArhCheks b');
       DM.QrEx.SQL.Add('where a.kod_name=b.kod_name and b.vzh=@v and b.numb_chek=@n');
       DM.QrEx.SQL.Add('delete from ArhCheks b where b.vzh=@v and b.numb_chek=@n');
       DM.QrEx.ExecSQL;
 }
       EKKA.fpCancelFiscalReceipt;
       if EKKA.ReceiptNumber<0 then Abort;
       CP.NumbChek:=EKKA.ReceiptNumber+1;
       if Not EKKA.fpOpenFiscalReceipt then
        begin
         MessBox('Не выполнилась открытие нового чека!'+#10+
                 '_______________________________________________________________'+#10#10+EKKA.LastErrorDescr);
         Abort;
        end;
       for i:=1 to DM.spY_ShowChek.RecordCount do
        begin
         if i=1 then DM.spY_ShowChek.First else DM.spY_ShowChek.Next;
         if DM.spY_ShowChek.FieldByName('Kol').AsInteger*DM.spY_ShowChek.FieldByName('Cena').AsCurrency<=0 then Continue;

         Sm:=DM.spY_ShowChek.FieldByName('Kol').AsInteger*DM.spY_ShowChek.FieldByName('Cena').AsCurrency*DM.spY_ShowChek.FieldByName('Skd').AsCurrency/100.;
         DM.QrEx.Close;
         DM.QrEx.SQL.Clear;
         DM.QrEx.SQL.Add('select f_nds,convert(numeric(8,2),'+CurrToStrF(Sm,ffFixed,2)+') as SumSkd from SprTov where kod_name='+DM.spY_ShowChek.FieldByName('Kod_Name').AsString);
         DM.QrEx.Open;

         if Not EKKA.fpAddSale(DM.spY_ShowChek.FieldByName('Art_Code').AsString+' '+
                               DM.spY_ShowChek.FieldByName('Names').AsString,
                               DM.spY_ShowChek.FieldByName('Kol').AsInteger,
                               DM.spY_ShowChek.FieldByName('Cena').AsCurrency,
                               1,
                               0,
                               DM.QrEx.FieldByName('F_NDS').AsInteger,
//                               -DM.QrEx.FieldByName('SumSkd').AsCurrency,
                               -StrToCurr(CurrToStrF(Sm,ffFixed,2)),
                               ''
                              ) then AbortM(EKKA.LastErrorDescr);

{
         DM.spY_EnterKol.Parameters.ParamValues['@part_code']:=DM.spY_ShowChek.FieldByName('Art_code').AsInteger;
         DM.spY_EnterKol.Parameters.ParamValues['@pold_art']:=DM.spY_ShowChek.FieldByName('Art_code').AsInteger;
         DM.spY_EnterKol.Parameters.ParamValues['@pkol']:=DM.spY_ShowChek.FieldByName('kol').AsInteger;
         DM.spY_EnterKol.Parameters.ParamValues['@piduser']:=Prm.UserID;
         DM.spY_EnterKol.Parameters.ParamValues['@ptm']:=0;
         DM.spY_EnterKol.Parameters.ParamValues['@simp']:=0;
         DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=1;
         DM.spY_EnterKol.ExecProc;
}
        end;

       if DM.spY_ShowChek.FieldByName('Skd').AsCurrency>0 then
        EKKA.fpServiceText(1,1,1,'Знижка: '+IntToStr(Round(DM.spY_ShowChek.FieldByName('Skd').AsCurrency))+'%');
       if Not EKKA.fpCloseFiscalReceipt(0,4) then AbortM(EKKA.LastErrorDescr);

       DM.QrEx.Close;
       DM.QrEx.SQL.Clear;
       DM.QrEx.SQL.Add('declare @n int, @v bigint');
       DM.QrEx.SQL.Add('set @n='+DM.spY_ChekList.FieldByName('Numb_Chek').AsString);
       DM.QrEx.SQL.Add('set @v='+DM.spY_ChekList.FieldByName('Vzh').AsString);
       DM.QrEx.SQL.Add('update ArhCheks set SumSkdK=0, Numb_chek='+IntToStr(CP.NumbChek)+', Vzh='+IntToStr(EKKA.VzhNum)+' where numb_chek=@n and vzh=@v');
       DM.QrEx.ExecSQL;
       RealizRepF.FilterRealiz;
       DM.ADOCo.CommitTrans;
       RealizRepF.ShowModal;
      except
       DM.ADOCo.RollbackTrans;
       RealizRepF.ShowModal;
      end;
     end;

   finally
    RealizRepF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miRepRealizClick}

// Пункт меню Оформить предоплату
procedure TMainF.miPrevClick(Sender:TObject);
 begin
  try
   OptSumF:=TOptSumF.Create(Self);
   try
    OptSumF.Flag:=SM_PREP;
    OptSumF.ShowModal;
   finally
    OptSumF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miPrevClick}

// Возврат от покупателя
procedure TMainF.miBackClick(Sender:TObject);
var VF:TVozrForm;
    FIO,DateR:String;
 begin
  if { (Prm.AptekaID<>123) and } Not ((Prm.AptekaID=4) and (Opt.KassaID=5)) then
   begin
    try
     ShowBackClInstructF:=TShowBackClInstructF.Create(Self);
     try
      ShowBackClInstructF.ShowModal;
     finally
      ShowBackClInstructF.Free;
     end;
    except
    end;

    if MessBox('Напечатать бланк "Согласие на сбор и обработку персональных данных"',52)<>ID_YES then Exit;

    try

     FormForVozrF:=TFormForVozrF.Create(Self);
     try
      FormForVozrF.ShowModal;
      if FormForVozrF.Flag<>1 then  Exit;
      VF:=FormForVozrF.VF;
     finally
      FormForVozrF.Free;
     end;
    except
     Exit;
    end;

    FIO:=VF.F+' '+VF.N+' '+VF.O;
    DateR:=DateToStr(VF.DateR);
    PrintBlankForRegCard(0,FIO,DateR);
   end;

{  VF.F:='Васильчук';
  VF.N:='Олег';
  VF.O:='Николаевич';
  VF.A:='г. Харьков, ул. Грицевца,2';
  VF.Pr:='аллергия';
  VF.Z:='Булах Юлий Евгеньевич';
  VF.PaspS:='МН';
  VF.PaspN:='327096';
  VF.PaspD:=StrToDate('29.11.99');
  VF.PaspT:='паспорт';
  VF.PaspV:='Орджоникидзевским РВ УМВС Украины';}
  try
   BackClientF:=TBackClientF.Create(Self);
   try
    BackClientF.VF:=VF;
    BackClientF.ShowModal;
   finally
    BackClientF.Free;
    BackClientF:=nil;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miBackClick}

// Установка соединения с интернетом и отправка почты
procedure TMainF.miSendMailClick(Sender:TObject);
var F:Boolean;
 begin
  if Prm.AptekaID=28 then Exit;
  F:=InternetAutodial(INTERNET_AUTODIAL_FORCE_UNATTENDED,Handle);
  if Not (F) then begin MainF.MessBox('Соединение с интернет не установлено! Попробуйте еще раз.'); Exit; end;
  MainF.miSendMail.Enabled:=False;
  try
   SendMail;
  finally
   InternetAutodialHangup(0);
   MainF.miSendMail.Enabled:=True;
  end;
 end; {miSendMailClick}

// Принудительная выгрузка остатков
procedure TMainF.ForceUnLoadAll;
var Path,DT:String;
    i:Integer;
 begin
  if Design then Exit;
  try
   for i:=7 to 60 do
    if DirectoryExists(WorkPath+'\Arh\'+FormatDateTime('dd.mm.yy',Date-i)) then
     DelDir(WorkPath+'\Arh\'+FormatDateTime('dd.mm.yy',Date-i));
   Path:=WorkPath+'\Arh\'+FormatDateTime('dd.mm.yy',Date)+'\';
   if CheckUnLoad(Path)='' then Exit;
   DT:=FormatDateTime('yyyy-mm-dd',Date)+' 00:00:00';
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from JUnLoad where id_kassa='+IntToStr(Opt.KassaID)+' and Date_UN='''+DT+'''';
   DM.Qr.Open;
   if Not (DM.Qr.IsEmpty) then Exit;
   UnLoadFiles(Path);
   if CheckUnLoad(Path)='' then
    begin
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('Insert into JUnLoad(ID_KASSA,Date_UN)');
     DM.Qr.SQL.Add('Values('+IntToStr(Opt.KassaID)+','''+DT+''')');
     DM.Qr.ExecSQL;
    end;
  except
  end;
 end; {ForceUnLoadAll}

// Полная обработка копирования истории выгрузки остатков
procedure TMainF.CopyArh(Path:String);
var Dir,FromPath:String;
    i:Integer;
 begin
  FromPath:=WorkPath+'\Arh\';
  for i:=0 to 6 do
   begin
    Dir:=FormatDateTime('dd.mm.yy',Date-i)+'\';
    if Not (DirectoryExists(FromPath+Dir)) then Continue;
    if Not (DirectoryExists(Path+Dir)) then MoveDir(ExcludeTrailingBackSlash(FromPath+Dir),
                                                    ExcludeTrailingBackSlash(Path+Dir)) else
     if (CheckUnload(FromPath+Dir)='') and (CheckUnload(Path+Dir)<>'') then CopyDir(FromPath+Dir,Path+Dir)
   end;
  DelDir(FromPath+'*');
 end; {CopyArh}

// Кнопка "Печать Ценников по Чеку"
procedure TMainF.btPrnChekClick(Sender:TObject);
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select a.art_code as Код_I_1500,');
   DM.Qr.SQL.Add('       b.names as Наименование_S_8000,');
   DM.Qr.SQL.Add('       Sum(a.kol) as [Кол-во_I_1000] ,');
   DM.Qr.SQL.Add('       convert(numeric(8,2),a.cena) as Цена_N_1500,');
   DM.Qr.SQL.Add('       Sum(convert(numeric(8,2),a.cena*a.kol)) as Сумма_N_1500,');
   DM.Qr.SQL.Add('       c.P1 as [Осн_S_1000],');
   DM.Qr.SQL.Add('       c.P2 as [Витр_S_1000],');
   DM.Qr.SQL.Add('       c.P3 as [Скл_S_1000]');
   DM.Qr.SQL.Add('from Chek a, SprTov b left join Inform..SprReg c on b.art_code=c.art_code');
   DM.Qr.SQL.Add('where a.kod_name=b.kod_name and a.compname=host_name() and a.id_user='+IntToStr(Prm.UserID));
   DM.Qr.SQL.Add('group by a.art_code,b.names,a.cena,c.P1,c.P2,c.P3');
   DM.Qr.SQL.Add('order by c.P1,c.P2,c.P3,b.names');
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Exit;
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=5;
   PrintRep.AddText('Копия чека'+#10#10#10);
   PrintRep.AddText(Prm.FirmNameUA+#10#10#10);
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(false,0,0);
   PrintRep.AddText(#10#10+'Сумма:   '+CurrToStrF(SumChek,ffFixed,2)+' грн.'+#10#10);
   PrintRep.AddText(#10#10+'Провизор_________________');
   PrintRep.PreView;
  except
  end;
 end; {btPrnChekClick}

// Вызов контекстного меню "Сумма чека со скидкой"
procedure TMainF.btSumChekClick(Sender:TObject);
var dx,dy:Integer;
    Com:TControl;
 begin
  if Sender=nil then Exit;
  dx:=Left+3; dy:=Top+TControl(Sender).Height+41;
  Com:=TControl(Sender);
  While Com<>Self do
   begin
    Inc(dx,Com.Left);
    Inc(dy,Com.Top);
    Com:=Com.Parent;
   end;
  pmSkdList.Popup(dx,dy);
 end; {btSumChekClick}

// Пунткы контекстного меню "Сумма чекоа со скидкой"
procedure TMainF.miSkd2Click(Sender:TObject);
var Perc:Integer;
 begin
  if Sender=nil then Exit;
  Perc:=TMenuItem(Sender).Tag;
  MessBox('Сумма чека со скидкой '+IntToStr(Perc)+' % : '+CurrToStrF(SumChek*(1-Perc/100),ffFixed,2)+' грн.',64);
 end; {miSkd2Click}

// Пункт контекстного меню "Сумма чекоа со скидкой" - "Другой %..."
procedure TMainF.miSkdOtherClick(Sender:TObject);
var Kol,Art_Code:Integer;
 begin
  Art_Code:=0;
  if Sender=nil then Exit;
  Kol:=GetKolFromDialog('Введите процент скидки',1,Art_Code,EN_SIMPLE);
  if Kol<=0 then Exit else TMenuItem(Sender).Tag:=Kol;
  miSkd2Click(Sender);
 end; {miSkdOtherClick}

// Кнопка "Закрыть порт"
procedure TMainF.sbClosePortClick(Sender:TObject);
 begin
  EKKA.fpClosePort;
 end; {sbClosePortClick}

// Кнопка "Открыть порт"
procedure TMainF.sbOpenPortClick(Sender:TObject);
 begin
  ShowErrorEKKA(EKKA.fpConnect);
 end; {sbOpenPortClick}

// Кнопка выбора папки файлика с изображением логотипа 
procedure TMainF.sbPathClick(Sender:TObject);
var Bm:TBitMap;
 begin
  if Not odLoad.Execute then Exit;
  edLogoEKKA.Text:=odLoad.FileName;
  try
   Bm:=TBitMap.Create;
   try
    Bm.LoadFromFile(edLogoEKKA.Text);
    imLogoEKKA.Picture.Assign(Bm);
   finally
    Bm.Free;
   end;
  except
   MessBox('Ошибка загрузки изображения логотипа для просмотра!');
  end;
 end; {sbPathClick}

// Кнопка "Загрузить логотип" 
procedure TMainF.bbLoadLogoClick(Sender:TObject);
var T:TDateTime;
    Bm:TBitMap;
 begin
  T:=Time;
  try
   Bm:=TBitMap.Create;
   try
    Bm.Assign(imLogoEKKA.Picture);
    if Not EKKA.fpLoadLogo(Bm,True) then raise EAbort.Create(EKKA.LastErrorDescr);
    MessBox('Логотип загружен! Затрачено времени: '+TimeToStr(Abs(T-Time)),64);
   finally
    Bm.Free;
   end;
  except
   on E:Exception do MessBox(E.Message);
  end;
 end; {bbLoadLogoClick}

// Кнопка "Читать EKKA"
procedure TMainF.bbReadEKKAClick(Sender:TObject);
var B:Boolean;              
 begin
  stFactoryNum.Caption:='';
  stRegNom.Caption:='';
  stFirma.Caption:='';
  stKassirIsReg.Caption:='';
  stKeyPos.Caption:='';
  stIsObnulen.Caption:='';
  stNomerLastZ.Caption:='';
  stNomberLastChek.Caption:='';
  stFiskDate.Caption:='';
  stFiskTime.Caption:='';
  stVersion.Caption:='';
  stDtVersion.Caption:='';
  stMoney.Caption:='';
  if cbEKKA.Checked then Exit;
  B:=EKKA.fpGetStatus;
  ShowErrorEKKA(B);
  if Not B then Exit;
  stFactoryNum.Caption:=EKKA.RD_Item[0]+' ';
  stRegNom.Caption:=EKKA.RD_Item[1]+' ';
  stFirma.Caption:=Trim(EKKA.RD_Item[2]);
  if EKKA.RD_Item[7]='0' then stKassirIsReg.Caption:='Не зарегистрирован' else
  if EKKA.RD_Item[7]='1' then stKassirIsReg.Caption:='Зарегистрирован';
  Case Ord(EKKA.RD_Item[5][1]) of
   KEY_O:stKeyPos.Caption:='Отключен';
   KEY_W:stKeyPos.Caption:='Работа';
   KEY_X:stKeyPos.Caption:='X-отчет';
   KEY_Z:stKeyPos.Caption:='Z-отчет';
   KEY_P:stKeyPos.Caption:='Программирование';
  end;
  Case Ord(EKKA.RD_Item[9][1]) of
   1:stIsObnulen.Caption:='Обнулена';
   0:stIsObnulen.Caption:='Не обнулена';
  end;
  stNomerLastZ.Caption:=EKKA.RD_Item[10]+' ';
  stNomberLastChek.Caption:=EKKA.RD_Item[11]+' ';
  stFiskDate.Caption:=JDateToStr(EKKA.RD_Item[3])+' ';
  stFiskTime.Caption:=JTimeToStr(EKKA.RD_Item[4])+' ';
  stVersion.Caption:=EKKA.RD_Item[13]+' ';
  stDtVersion.Caption:=JDateToStr(EKKA.RD_Item[14])+' ';;
  stMoney.Caption:=EKKA.RD_Item[18]+' ';
 end; {bbReadEKKAClick}

// Чтение свойства VzhNum
function TMainF.GetVzhNum:Int64;
 begin
  if cbEKKA.Checked then Result:=Opt.KassaID
                    else Result:=EKKA.VzhNum;
 end; {GetVzhNum}

// Пунтк меню "Выручки по кассирам"
procedure TMainF.miRepKassirClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   RepKassirSummF:=TRepKassirSummF.Create(Self);
   try
    RepKassirSummF.ShowModal;
   finally
    RepKassirSummF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miRepKassirClick}

// Возвращает база ЧП или нет (ЧП - true, не ЧП false)
function TMainF.GetBaseCHP:Boolean;
 begin
  Result:=False;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select Max(F_NDS) as F_NDS from SprTov';
   DM.Qr.Open;
   if DM.Qr.FieldByName('F_NDS').AsInteger>2 then Result:=True else Abort;
  except
   Result:=False;
  end;
 end; {GetBaseCHP}

// Пункт меню "Отчеты различные" 
procedure TMainF.miRepClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   RepPeriodF:=TRepPeriodF.Create(Self);
   try
    RepPeriodF.ShowModal;
   finally
    RepPeriodF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miRepClick}

// Дестрой главной формы
procedure TMainF.FormDestroy(Sender:TObject);
 begin
  FChpChek.Free;
 end; {FormDestroy}

// Копирование в буфер обмена арт_кода или наименования
procedure TMainF.CopyDataExecute(Sender:TObject);
 begin
  if Not dbgSklad.Focused then Exit;
  if SprOrder=O_ART_CODE then ClipBoard.AsText:=dbgSklad.DataSource.DataSet.FieldByName('ART_CODE').AsString;
  if SprOrder=O_NAMES then ClipBoard.AsText:=dbgSklad.DataSource.DataSet.FieldByName('NAMES').AsString;
 end; {CopyDataExecute}

// Выполнение внешней или внутренней команды
procedure TMainF.ExecCommand(Comm:String);
 begin
  if Not FCanExecCom then Exit;
  try
   FCanExecCom:=False;
   ExecComm.ecExecComm(Comm);
  finally
   FCanExecCom:=True;
  end;
 end; {ExecCommand}

// Ожидание внешних комманд
procedure TMainF.tmWaitCommTimer(Sender:TObject);
 begin
  if Design then Exit;
  ExecCommand('GCCAS');
  ExecCommand('ULOAD');
 end; {tmWaitCommTimer}

// Пункт меню "Бланки инкассации"
procedure TMainF.miIncomeBlanksClick(Sender:TObject);
 begin
  try
   RepIncomF:=TRepIncomF.Create(Self);
   try
    RepIncomF.ShowModal;
   finally
    RepIncomF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miIncomeBlanksClick}

// Возвращает имя файла базы по формату 'Base'<номер аптеки>'.bak'
function TMainF.GetBaseFileName:String;
 begin
  Result:='Base'+IntToStr(Prm.AptekaID)+'.bak'
 end; {GetBaseFileName}

// Выгрузка базы в потоке
procedure TThArhBase.Execute;
 begin
  FreeOnTerminate:=True;
  MainF.UnLoadArhBase;
 end; {Execute}

// Кнопка сброс сервис-лимита 
procedure TMainF.bbServLimClick(Sender:TObject);
 begin
  if MessBox('Вы действительно хотите выполнить сброс сервис-лимита?',52)<>ID_YES then Exit;
  try
   if Not EKKA.fpServPassw('2222222222') then raise EAbort.Create(EKKA.LastErrorDescr);
   if Not EKKA.fpPrintLimit(StrToInt(edKolStr.Text)) then raise EAbort.Create(EKKA.LastErrorDescr);
   if Not EKKA.fpDayLimit(StrToInt(edKolDay.Text)) then raise EAbort.Create(EKKA.LastErrorDescr);
   MessBox('Сброс сервис лимита прошел успешно.',64);
  except
   on E:EXception do MessBox(E.Message);
  end;
 end; {bbServLimClick}

// Организация ввода только цифр в TEdit 
procedure TMainF.edKolStrKeyPress(Sender:TObject; var Key:Char);
 begin
  try
   if Sender=Nil then Exit;
   if Key in CH_DIGIT then StrToInt(TEdit(Sender).Text+Key) else
   if Key<>#8 then Abort;
  except
   Key:=#0;
  end;
 end; {edKolStrKeyPress}

// Вызов окна терминала кассового аппарата
procedure TMainF.bbTermEKKAClick(Sender: TObject);
var ch:Boolean;
 begin
  if Not(IsPermit([R_ADMIN],P_ALERT)) then Exit;
  try
   LoadKeyboardLayout('00000409',KLF_ACTIVATE);
   ch:=cbEKKA.Checked;
   cbEKKA.Checked:=False;
   TermEKKAF:=TTermEKKAF.Create(Self);
   try
    TermEKKAF.ShowModal;
   finally
    cbEKKA.Checked:=ch;
    LoadKeyboardLayout('00000419',KLF_ACTIVATE);
    TermEKKAF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {bbTermEKKAClick}

// Пункт меню Архивация базы 
procedure TMainF.miArhBaseClick(Sender: TObject);
 begin
  if Not(IsPermit([R_ADMIN],P_ALERT)) then Exit;
  try
   CutBaseF:=TCutBaseF.Create(Self);
   try
    CutBaseF.ShowModal;
   finally
    CutBaseF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miArhBaseClick}

// Вызов окна просмотра аннотации к препарату
procedure TMainF.miAnnotClick(Sender: TObject);
var DS:TDataSet;
 begin
  DS:=nil;
  if dbgSklad.Focused then DS:=dbgSklad.DataSource.DataSet else
  if dbgChek.Focused then DS:=dbgChek.DataSource.DataSet;
  if DS=nil then Exit;
  if DS.IsEmpty then Exit;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select Art_Code,Opis        ');
   DM.Qr.SQL.Add('from Annotacii..Annotaci a,            ');
   DM.Qr.SQL.Add('     Annotacii..Texts b                ');
   DM.Qr.SQL.Add('where a.Art_code='+DS.FieldByName('Art_Code').AsString+' and   ');
   DM.Qr.SQL.Add('      a.OpisID=b.ID         ');
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Exit;
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Align:=AL_CENTER;
   PrintRep.Font.Style:=[fsBold,fsUnderLine];
   PrintRep.AddText(DS.FieldByName('Names').AsString+#10#10#10);
   PrintRep.Indent:=0;
   PrintRep.Font.Style:=[];
   PrintRep.Align:=AL_JUST;
   PrintRep.AddText(DM.Qr.FieldByName('Opis').AsString);
   PrintRep.PreView;
  except
  end;
 end; {miAnnotClick}

// Установка звука в максимальное значение на компьютерах с USB-колонками
procedure TMainF.SetVolume;
 begin
  try
   if (Prm.AptekaID=8) or (Prm.AptekaID=2) or (Prm.AptekaID=3) or
      ((Prm.AptekaID=5) and (Opt.KassaID=1)) or ((Prm.AptekaID=23) and (Opt.KassaID=1)) or ((Prm.AptekaID=72) and (Opt.KassaID=1)) then
    begin
     SetMasterVolumeToValue(65500);
     SetMasterVolumeToValue(65530);
    end;
  except
  end;
 end;

// Ожидание различных текстовых сообщений из офиса
procedure TMainF.tmrWaitMessTimer(Sender:TObject);
var i,ID:Integer;
    Blob:TMemoryStream;
    ss:String;
 begin
  if Design then Exit;
  SetVolume;

  try
   DM.TimerQr1.Close;
   DM.TimerQr1.SQL.Clear;
   DM.TimerQr1.SQL.Add('update DhRes set Closed=1,id_close=0,date_close=getdate() where IsNull(closed,0)=0 and date_res<getdate()-3');
   DM.TimerQr1.ExecSQL;
  except
  end;

  // Ожидание сообщений
  if Prm.UserRole=R_ADMIN then Exit;
  try
   tmrWaitMess.Enabled:=False;
   try
    DM.TimerQr1.Close;
    DM.TimerQr1.SQL.Clear;
    ss:='';
    if Prm.UserRole=R_SUPER then ss:='-2,';
    DM.TimerQr1.SQL.Add('select top 1 *,(select top 1 users from SprUser s where s.id_gamma=j.id_from) as users from Inform..JMess j where DateM>getdate()-7 and (IsNull(id_dest,-1) in (-1,'+ss+IntToStr(Prm.ID_Gamma)+') ) and id not in (');
    DM.TimerQr1.SQL.Add('select id_mess from Inform..JReadMess where id_user='+IntToStr(Prm.UserID)+' and done=1');
    DM.TimerQr1.SQL.Add(') order by DateM desc');
    DM.TimerQr1.Open;
    if Not DM.TimerQr1.IsEmpty then
     begin
      ShowNewInfoF:=TShowNewInfoF.Create(Self);
      try
       ID:=DM.TimerQr1.FieldByName('ID').AsInteger;
       ShowNewInfoF.lbFrom.Caption:='От кого: '+DM.TimerQr1.FieldByName('Users').AsString;
       ShowNewInfoF.lbDate.Caption:=DM.TimerQr1.FieldByName('DateM').AsString;
       ShowNewInfoF.FileName:=DM.TimerQr1.FieldByName('FName').AsString;
       ShowNewInfoF.Mess:=DM.TimerQr1.FieldByName('Mess').AsString;
       ShowNewInfoF.ShowModal;
       DM.TimerQr1.Close;
       DM.TimerQr1.SQL.Clear;
       DM.TimerQr1.SQL.Add('Insert into Inform..JReadMess(ID_MESS,ID_USER,DONE)');
       DM.TimerQr1.SQL.Add('Values ('+IntToStr(ID)+','+IntToStr(Prm.UserID)+',1)');
       DM.TimerQr1.ExecSQL;

       DM.TimerQr2.Close;
       DM.TimerQr2.SQL.Text:='select * from Inform..JFiles where id_mess='+IntToStr(ID);
       DM.TimerQr2.Open;
       if DM.TimerQr2.IsEmpty=False then
        begin
         for i:=1 to DM.TimerQr2.RecordCount do
          begin
           if i=1 then DM.TimerQr2.First else DM.TimerQr2.Next;
           Blob:=TADOBlobStream.Create(TBlobField(DM.TimerQr2.FieldByName('FData')),bmRead);
           Blob.SaveToFile(IncludeTrailingBackslash(Opt.LoadNaklPath)+DM.TimerQr2.FieldByName('FName').AsString);
          end;
        end;
      finally
       ShowNewInfoF.Free;
      end;
     end;
   except
   end;
  finally
   tmrWaitMess.Enabled:=True;
  end;
 end; {tmrWaitMessTimer}

// Подсветка ссылки "История сообщений"
procedure TMainF.lbHistoryMouseLeave(Sender:TObject);
 begin
  if Sender=Nil then Exit;
  if Not TLabel(Sender).Enabled then Exit;
  TLabel(Sender).Font.Color:=clNavy;
  TLabel(Sender).Font.Style:=[fsUnderLine];
 end; {lbHistoryMouseLeave}

// Подсветка ссылки "История сообщений"
procedure TMainF.lbHistoryMouseEnter(Sender: TObject);
 begin
  if Sender=Nil then Exit;
  if Not TLabel(Sender).Enabled then Exit;
  TLabel(Sender).Font.Color:=clBlue;
  TLabel(Sender).Font.Style:=[fsBold,fsUnderLine];
 end; {lbHistoryMouseEnter}

// пункт меню "Редактирование мест хранений"
procedure TMainF.miEditRegClick(Sender: TObject);
 begin
  try
   EditRegF:=TEditRegF.Create(Self);
   try
    EditRegF.Art_Code:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;
    EditRegF.Label4.Caption:=DM.spY_FilterSklad.FieldByName('Art_Code').AsString+' '+
                             DM.spY_FilterSklad.FieldByName('Names').AsString;
    EditRegF.Edit1.Text:=IntToStr(DM.spY_FilterSklad.FieldByName('P1').AsInteger);
    EditRegF.Edit2.Text:=IntToStr(DM.spY_FilterSklad.FieldByName('P2').AsInteger);
    EditRegF.Edit3.Text:=IntToStr(DM.spY_FilterSklad.FieldByName('P3').AsInteger);

    EditRegF.Edit4.Enabled:=Opt.ShowRegFull;
    EditRegF.Edit5.Enabled:=Opt.ShowRegFull;

    EditRegF.Edit2.Text:=IntToStr(DM.spY_FilterSklad.FieldByName('P2').AsInteger);
    EditRegF.Edit3.Text:=IntToStr(DM.spY_FilterSklad.FieldByName('P3').AsInteger);

    if Opt.ShowRegFull then
     begin
      EditRegF.Edit4.Text:=IntToStr(DM.spY_FilterSklad.FieldByName('P4').AsInteger);
      EditRegF.Edit5.Text:=IntToStr(DM.spY_FilterSklad.FieldByName('P5').AsInteger);
     end else begin
               EditRegF.Edit4.Text:='0';
               EditRegF.Edit5.Text:='0';
              end;
    EditRegF.ShowModal;
   finally
    EditRegF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miEditRegClick}

// Клик по ссылке "История сообщений"
procedure TMainF.lbHistoryClick(Sender: TObject);
 begin
  try
   HistoryF:=THistoryF.Create(Self);
   try
    HistoryF.ShowModal;
   finally
    HistoryF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {lbHistoryClick}

// Пункт меню "Формирование лишнего товара"
procedure TMainF.miLTClick(Sender:TObject);
 begin
  ShowWorkSprF(W_LT);
 end; {miLTClick}

// Пункт меню "История лишнего товара"
procedure TMainF.miLTJClick(Sender: TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   ViewLTF:=TViewLTF.Create(Self);
   try
    ViewLTF.ShowModal;
   finally
    ViewLTF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miLTJClick}

// Пункт меню "График работы сотрудников"
procedure TMainF.miTableClick(Sender: TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   JTableF:=TJTableF.Create(Self);
   try
    JTableF.ShowModal;
   finally
    JTableF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miTableClick}

// Пункт меню "Просмотр отмененных чеков"
procedure TMainF.miCancelVClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  if IsPermit([R_SUPER],P_ALERT) then
   try
    CancelViewF:=TCancelViewF.Create(Self);
    try
     CancelViewF.ShowModal;
    finally
     CancelViewF.Free;
    end;
   except
    MessBox(ER_CR_FORM);
   end;
 end; {miCancelVClick}

// Проверка офисных карточек на предмет превышения лимита скидки в 2000 грн
function TMainF.CheckLimitSkd(Nm:Int64):Boolean;
var D1,D31:TDateTime;
 begin
  try
   if (Nm<236000) or (Nm>236499) then Abort;
   GetDaysOfMonth(StrToInt(FormatDateTime('mm',Date())),D1,D31);
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select IsNull(Sum(convert(numeric(8,2),kol*cena*(skd/100.))),0) as Summ '+#10+
                   'from ArhCheks where NumCard='+IntToStr(Nm)+' and '+#10+
                   'date_chek>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and '+#10+
                   'date_chek<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59''';
   DM.Qr.Open;
   if (DM.Qr.FieldByName('Summ').AsFloat+MainF.SumSkd)<=2000 then Abort;

   MessBox('Извините. Превышен лимит суммы скидки в этом месяце!');

   Result:=False;
  except
   Result:=True;
  end; {CheckLimitSkd}
 end;

procedure TMainF.acK1Execute(Sender:TObject);
var AC:Integer;
 begin
  Exit;
  if Prm.AptekaID<>9 then Exit;
  if InputBox('Password', 'Введите пароль', '')<>'555' then Exit;
  try
   if DM.spY_FilterSklad.IsEmpty then Exit;
   if DM.spY_FilterSklad.FieldByName('K1').AsInteger<=0 then
    begin
     MessBox('Операция невозможна!');
     Exit;
    end;
   AC:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('declare @Kol int, @kodn int');
   DM.QrEx.SQL.Add('set @Kol=IsNull((select Sum(ostat) from SprTov where Art_Code='+IntToStr(AC)+'),0)');
   DM.QrEx.SQL.Add('set @kodn=-1 ');
   DM.QrEx.SQL.Add('select top 1 @kodn=kod_name from SprTov where art_code='+IntToStr(AC)+' and ');
   DM.QrEx.SQL.Add(' IsNull(ostat_beg,0)<=0 or (IsNull(ostat_beg,0)>0 and cena_beg=cena) and ostat>0 ');
   DM.QrEx.SQL.Add('begin tran ');
   DM.QrEx.SQL.Add(' if @kodn<>-1 ');
   DM.QrEx.SQL.Add('  begin ');
   DM.QrEx.SQL.Add('   insert into SpisK(kod_name,kol,dt) ');
   DM.QrEx.SQL.Add('   values(@kodn,1,getdate()) ');
   DM.QrEx.SQL.Add('   update SprTov set ostat=ostat-1, ostat_beg=ostat_beg+1, cena_beg=cena ');
   DM.QrEx.SQL.Add('   where kod_name=@kodn ');
   DM.QrEx.SQL.Add('  end ');
   DM.QrEx.SQL.Add(' if @kodn=-1 begin rollback tran select 0 as Res end else');
   DM.QrEx.SQL.Add(' if @Kol=IsNull((select Sum(ostat) from SprTov where Art_Code='+IntToStr(AC)+'),0) ');
   DM.QrEx.SQL.Add('  begin ');
   DM.QrEx.SQL.Add('   rollback tran select 0 as Res');
   DM.QrEx.SQL.Add('  end else begin commit tran select 1 as Res end');
   DM.QrEx.Open;
   if DM.QrEx.FieldByName('Res').AsInteger=0 then MessBox('Операция невозможна!') else FilterSklad;
  except
   on E:Exception do ShowMEssage(E.Message);
  end;
 end; {acK1Execute}

// Формирование пересорта
procedure TMainF.MakePeresort(P:Byte);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   PeresortF:=TPeresortF.Create(Self);
   try
    PeresortF.Period:=P;
    PeresortF.ShowModal;
   finally
    PeresortF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {MakePeresort}

// Пункт меню "Формирование пересорта"
procedure TMainF.miPeresortClick(Sender:TObject);
 begin
  MakePeresort(P_MONTH);
 end; {miPeresortClick}

// Пункт меню "Формирование пересорта по переучету"
procedure TMainF.miPeresortPereuchetClick(Sender: TObject);
 begin
  MakePeresort(P_PEREUCHET);
 end; {miPeresortPereuchetClick}

// Печать обновленки по признаку НДС
procedure TMainF.PrintObnov(F_NDS:Integer; Gr:Integer=-1; dtDate:TDateTime=0);
var Nds:Boolean;
    It:Integer;
    Dt:TDateTime;
    Tb:TTableObj;
    i:Integer;
    s:String;
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   if F_NDS<>5 then
    begin
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('declare @mina datetime, @minm datetime');
     DM.Qr.SQL.Add('set @mina=IsNull((select Min(date_Chek) from ArhCheks),getdate())');
     DM.Qr.SQL.Add('set @minm=IsNull((select Min(date_nakl) from Moves),getdate())');
     DM.Qr.SQL.Add('if @mina<@minm select @mina as dt else select @minm as dt');
     DM.Qr.Open;
     Dt:=DM.Qr.FieldbyName('Dt').AsDateTime;
    end else begin
              Dt:=StartOfTheWeek(Date);
             end;


   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   if F_NDS in [1..4] then
    begin
     if F_NDS in [1,3] then
      begin
       DM.Qr.SQL.Add('select ''NumS'' as [№0пп_S_1000],');
       DM.Qr.SQL.Add('       Names as Наименование_S_8000,');
       DM.Qr.SQL.Add('      ''   уп'' as [Ед.изм_S_1000],');
       DM.Qr.SQL.Add('       Sum(Ostat_beg) as [Кол-во_I_1500],');
       DM.Qr.SQL.Add('       Max(Convert(Numeric(8,2),Cena_beg*5/6)) as [Цена0без0НДС_N_1700],');
       DM.Qr.SQL.Add('       Max(Cena_beg-Convert(Numeric(8,2),Cena_beg*5/6)) as [НДС0на0ед_N_1500],');
       DM.Qr.SQL.Add('       Max(Cena_beg) as [Цена0с0НДС_N_1700],');
       DM.Qr.SQL.Add('       Sum(Ostat_beg*Cena_beg) as Сумма_N_1700');
       It:=8;
       Nds:=True;
      end else
     if F_NDS in [2,4] then
      begin
       DM.Qr.SQL.Add('select ''NumS'' as [№0пп_S_1100],');
       DM.Qr.SQL.Add('       Names as Наименование_S_9000,');
       DM.Qr.SQL.Add('      ''   уп'' as [Ед.изм_S_1000],');
       DM.Qr.SQL.Add('       Sum(Ostat_beg) as [Кол-во_I_1700],');
       DM.Qr.SQL.Add('       Max(Cena_beg) as Цена_N_1700,');
       DM.Qr.SQL.Add('       Sum(Ostat_beg*Cena_beg) as Сумма_N_1700');
       Nds:=False;
       It:=6;
      end;

     DM.Qr.SQL.Add('from SprTov');
//     DM.Qr.SQL.Add('where (art_code not in (select art from tmpa) and art_code not in (9809,9312,49066,7607,15684,708,12397,14332,37104,25942,2730,53537)) and f_nds='+IntToStr(F_NDS));

     if Gr=-1 then
      DM.Qr.SQL.Add('where art_code<>0 and f_nds='+IntToStr(F_NDS))
     else
      DM.Qr.SQL.Add('where art_code<>0 and art_code in (select IsNull(art_code,0) from #tmparto where gr='+IntToStr(Gr)+' and f_nds='+IntToStr(F_NDS)+')');

//     DM.Qr.SQL.Add('where art_code<>0 and f_nds='+IntToStr(F_NDS));
     DM.Qr.SQL.Add('group by Art_Code,Names');
     DM.Qr.SQL.Add('having Sum(Ostat_beg)>0');
     DM.Qr.SQL.Add('order by Names');
    end else begin
              DM.Qr.SQL.Add('declare @kol int');
//              DM.Qr.SQL.Add('set @kol=160');
              DM.Qr.SQL.Add('set @kol=(select Sum(ostat) from SprTov where art_code=53537)+');
              DM.Qr.SQL.Add('IsNull((select Sum(kol) from ArhCheks where date_chek>='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Dt)+''' and kod_name in (select kod_name from SprTov where art_code=53537)),0)-');
              DM.Qr.SQL.Add('IsNull((select Sum(kol) from Moves where date_nakl>='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Dt)+''' and debcrd=1 and kod_name in (select kod_name from SprTov where art_code=53537)),0)+');
              DM.Qr.SQL.Add('IsNull((select Sum(kol) from Moves where date_nakl>='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Dt)+''' and debcrd=2 and kod_name in (select kod_name from SprTov where art_code=53537)),0)');
              DM.Qr.SQL.Add('select ''NumS'' as [№0пп_S_1100],');
              DM.Qr.SQL.Add('       Names as Наименование_S_9000,');
              DM.Qr.SQL.Add('      ''   уп'' as [Ед.изм_S_1000],');
              DM.Qr.SQL.Add('       @kol as [Кол-во_I_1700],');
              DM.Qr.SQL.Add('       Max(Cena) as Цена_N_1700,');
              DM.Qr.SQL.Add('       @kol*Max(Cena) as Сумма_N_1700');
              DM.Qr.SQL.Add('from SprTov ');
              DM.Qr.SQL.Add('where art_code=53537 ');
              DM.Qr.SQL.Add('group by Art_Code,Names');
              DM.Qr.SQL.Add('order by Names');
             end;
   DM.Qr.Open;
   DM.Qr.First;
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.Font.Size:=4;
   PrintRep.Font.Name:='Arial';
   PrintRep.Align:=AL_LEFT;

   PrintRep.AddTable(2,4);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('5200,1400');
   for i:=1 to 3 do Tb.Cell[2,i].Align:=AL_CENTER;
   Tb.SetBorders(1,1,1,4,EMPTY_BORDER);

   if F_NDS in [1,2,5] then
    begin
     Tb.SetBorders(2,1,2,3,Border(clBlack,5,psSolid));

     Tb.Cell[2,1].AddText(Prm.FirmNameUA);
     Tb.Cell[2,2].Font.Size:=3;
     Tb.Cell[2,2].AddText('ВХОДНОЙ КОНТРОЛЬ');
     Tb.Cell[2,3].AddText('ПРОВИЗОР___________');
    end else begin
              for i:=1 to 3 do Tb.Cell[2,i].RightBorder:=EMPTY_BORDER;
              Tb.Cell[2,1].TopBorder:=EMPTY_BORDER;
              Tb.Cell[2,4].TopBorder:=EMPTY_BORDER;
             end;
   Tb.Cell[2,2].TopBorder:=EMPTY_BORDER;
   Tb.Cell[2,3].TopBorder:=EMPTY_BORDER;
   Tb.Cell[2,4].RightBorder:=EMPTY_BORDER;
   s:='';
   if Gr<>-1 then S:=IntToStr(Gr);
   Tb.Cell[1,1].AddText('Накладная №'+IntToStr(Prm.AptekaID)+'/'+IntToStr(F_NDS)+s+'                       от '+FormatDateTime('dd.mm.yyyy',Dt));
   if F_NDS in [1,2,5] then
    begin
     Tb.Cell[1,3].AddText('От кого : '+Prm.FirmNameUA);
     Tb.Cell[1,4].AddText('Кому : '+Prm.AptekaNameRU);
    end else begin
              Tb.Cell[1,3].AddText('От кого : '+Opt.CHPName);
              Tb.Cell[1,4].AddText('Кому : '+Opt.CHPAddr);
             end;

   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Size:=4;
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(Nds,It,0);
   if F_NDS<=2 then
    PrintRep.AddText(#10#10+'Отпуск разрешил:______________'+#10);

   PrintRep.AddInterv(6);
   PrintRep.AddText('Отпустил:____________________           Получил:_______________________'+#10);
   PrintRep.PreView;
  except
   ShowMessage('Ошибка доступа к справочнику товаров!');
  end;
 end; {PrintObnov}

// Пункт меню "Печать обновленки..."
procedure TMainF.miFNDS1Click(Sender: TObject);
 begin
  if Sender=Nil then Exit;
  PrintObnov(TMenuItem(Sender).Tag);
 end; {miFNDS1Click}

// Пункт меню "Отчеты->Товарный отчет->Спец"
procedure TMainF.miSpecClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
{if Sender=Nil then Exit;
 PrintObnov(TMenuItem(Sender).Tag);}
  try
   PrintObnovF:=TPrintObnovF.Create(Self);
   try
    PrintObnovF.ShowModal;
   finally
    PrintObnovF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {N1Click}

// Пункт меню "Проверка базы"
procedure TMainF.miCheckBaseClick(Sender: TObject);
 begin
  try
   CheckBaseF:=TCheckBaseF.Create(Self);
   try
    CheckBaseF.ShowModal;
   finally
    CheckBaseF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miCheckBaseClick}

// Дата начала периода
function TMainF.GetBegPeriod:TDateTime;
var m:Integer;
    D,D1:TDateTime;
 begin
  m:=StrToInt(FormatDateTime('mm',Date));
  if StrToInt(FormatDateTime('dd',Date))=1 then
   begin
    if m=1 then D:=StrToDate('01.12.'+FormatDateTime('yyyy',Date-10))
           else GetDaysOfMonth(m-1,D,D1);
   end else GetDaysOfMonth(m,D,D1);
  Result:=D;
 end; {GetBegPeriod}

// Дата конца периода
function TMainF.GetEndPeriod:TDateTime;
var m:Integer;
    D,D1:TDateTime;
 begin
  m:=StrToInt(FormatDateTime('mm',Date));
  if StrToInt(FormatDateTime('dd',Date))=1 then
   begin
    if m=1 then D1:=StrToDate('31.12.'+FormatDateTime('yyyy',Date-10))
           else GetDaysOfMonth(m-1,D,D1);
   end else begin
             GetDaysOfMonth(m,D,D1);
             D1:=Date-1;
            end;
  Result:=D1;
 end; {GetEndPeriod}

// Устанавливает значение свойства Mistake
procedure TMainF.SetMistake(const Value:Boolean);
 begin
  FMistake:=Value;
  if Value=False then FMistakes:=[];
 end; {SetMistake}

// Пункт меню "Отчет по полкам"
procedure TMainF.miRegClick(Sender:TObject);
 begin
  try
   RepRegF:=TRepRegF.Create(Self);
   try
    RepRegF.ShowModal;
   finally
    RepRegF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miRegClick}

// Пункт меню "Количество проданного.."
procedure TMainF.miKolProdClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  if DM.spY_FilterSklad.IsEmpty then Exit;
  try
   KolProdF:=TKolProdF.Create(Self);
   try
    KolProdF.lbName.Caption:=DM.spY_FilterSklad.FieldByName('Names').AsString;
    KolProdF.Art_Code:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;
    KolProdF.ShowModal;
   finally
    KolProdF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miKolProdClick}

// Показ списка предлагаемых препаратов
procedure TMainF.FormShow(Sender:TObject);
var Perc,AvgSm:Real;
    Nch:Integer;
 begin
  if IsPermit([],P_SILENT) or Design then Exit;
  try
   DM.qrSpisNeed.Close;
   DM.qrSpisNeed.SQL.Text:='select art_code,Names from SprTov where art_code in (select art_code from Inform..SpisNeed) and ostat>0 group by art_code,Names order by Names';
   DM.qrSpisNeed.Open;
   if DM.qrSpisNeed.IsEmpty then Exit;
   SpisF:=TSpisF.Create(Self);
   try
    try
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('declare @cntAll int, @cntD int                  ');
     DM.Qr.SQL.Add('set @cntAll=(select Count(*) from               ');
     DM.Qr.SQL.Add('             (select b.art_code,a.date_chek     ');
     DM.Qr.SQL.Add('              from ArhCheks a, SprTov b         ');
     DM.Qr.SQL.Add('              where a.kod_name=b.kod_name and b.art_code in (select art_code from Inform..SprDop) and a.date_chek>getdate()-30 and a.id_user='+IntToStr(Prm.UserID)+' group by b.art_code,a.date_chek) a) ');
     DM.Qr.SQL.Add('set @cntD  =(select Count(*) from                                                                                                                                               ');
     DM.Qr.SQL.Add('             (select b.art_code,a.date_chek                                                                                                                                     ');
     DM.Qr.SQL.Add('              from ArhCheks a, ChArt b                                                                                                                                          ');
     DM.Qr.SQL.Add('              where a.row_id=b.row_id_a and a.date_chek>getdate()-30 and a.id_user='+IntToStr(Prm.UserID)+' and b.type_map=2 group by b.art_code,a.date_chek) a)                ');
     DM.Qr.SQL.Add('if @cntAll=0                                                                                                                                                                    ');
     DM.Qr.SQL.Add(' select 0 as Perc                                                                                                                                                               ');
     DM.Qr.SQL.Add('else                                                                                                                                                                            ');
     DM.Qr.SQL.Add(' select convert(numeric(8,2),@cntD)/convert(numeric(8,2),@cntAll)*100 as Perc                                                                                                   ');
     DM.Qr.Open;
     Perc:=DM.Qr.FieldByName('Perc').AsFloat;

     DM.Qr.Close;
     DM.Qr.SQL.Text:='select Count(distinct convert(varchar,numb_chek)+convert(varchar,id_kassa)) as NCh from ArhCheks where date_chek>getdate()-30 and id_user='+IntToStr(Prm.UserID);
     DM.Qr.Open;
     NCh:=DM.Qr.FieldByName('NCh').AsInteger;

     DM.Qr.Close;
     DM.Qr.SQL.Text:='select (Sum(kol*cena)-IsNull(Sum(kol*cena*(skd/100.)),0))/'+IntToStr(NCh)+' as AvgSm from ArhCheks where date_chek>getdate()-30 and id_user='+IntToStr(Prm.UserID);
     DM.Qr.Open;
     AvgSm:=DM.Qr.FieldByName('AvgSm').AsFloat;
    except
     NCh:=0;
     AvgSm:=0;
     Perc:=0;
    end;

    SpisF.lbAvgCh.Caption:=CurrToStrF(AvgSm,ffFixed,2)+' грн. ';
    SpisF.lbNCh.Caption:=IntToStr(NCh)+' ';
    SpisF.lbSop.Caption:=CurrToStrF(Perc,ffFixed,2)+' % ';

    try
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('');
     DM.Qr.SQL.Add('select a.numb_chek,a.id_kassa,Users,Sum(kol*cena)-IsNull(Sum(kol*cena*(skd/100.)),0) as SumCh ');
     DM.Qr.SQL.Add('into #tmpch                                                                                   ');
     DM.Qr.SQL.Add('from ArhCheks a, SprUser b                                                                    ');
     DM.Qr.SQL.Add('where a.id_user=b.id and date_chek>getdate()-30                                               ');
     DM.Qr.SQL.Add('group by numb_chek,id_kassa,users                                                             ');
     DM.Qr.SQL.Add('                                                                                              ');
     DM.Qr.SQL.Add('select top 1 Users,Sum(SumCh)/Count(numb_chek) as MaxSm                                       ');
     DM.Qr.SQL.Add('from #tmpch                                                                                   ');
     DM.Qr.SQL.Add('group by Users                                                                                ');
     DM.Qr.SQL.Add('order by 2 desc                                                                               ');
     DM.Qr.Open;
     SpisF.lbMaxAvgCh.Caption:='Максимальная сумма чека '+
                                CurrToStrF(DM.Qr.FieldByName('MaxSm').AsFloat,ffFixed,2)+
                                ' грн. у пользователя '+DM.Qr.FieldByName('Users').AsString+' !';
    except
    end;

    SpisF.ShowModal;
   finally
    SpisF.Free;
   end;
  except
  end ;
 end; {FormShow}

// Пункт меню "Формирование возврата по списку"
procedure TMainF.miVozvrPisClick(Sender:TObject);
var Dt:TDateTime;
 begin
  try
   ChooseVLF:=TChooseVLF.Create(Self);
   try
    ChooseVLF.ShowModal;
    if ChooseVLF.Flag<>1 then Exit;
    Dt:=ChooseVLF.DateVz;
   finally
    ChooseVLF.Free;
   end;
   ShowWorkSprF(W_BACK,Dt);
  except
  end;

 {  try
   MakeVozvrF:=TMakeVozvrF.Create(Self);
   try
    MakeVozvrF.ShowModal;
   finally
    try
     ClearChekOnly(Prm.UserID+1000);
     DM.Qr.Close;
     DM.Qr.SQL.Text:='truncate table TmpSpisVozr';
     DM.Qr.ExecSQL;
    except
    end;
    MakeVozvrF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
}
 end; {miVozvrPisClick}

// ------------------------------------------------
procedure TMainF.imHistoryDblClick(Sender:TObject);
 begin
  miSendMessClick(miSendMess);
 end; {imHistoryDblClick}

// Таймер проверки наличия новых сообщений
procedure TMainF.tmWaitMessOfficeTimer(Sender:TObject);
var RC:Integer;
 begin
  tmWaitMessOffice.Enabled:=False;
  try
   try
    DM.qrTmM.Close;
    DM.qrTmM.SQL.Text:='select Count(*) as Cnt from Inform..JMessOffice where IsNull(Done,0)=0 and id_dest='+IntToStr(Prm.ID_Gamma);
    DM.qrTmM.Open;
    RC:=DM.qrTmM.FieldByName('Cnt').AsInteger;
    if RC<=0 then
     begin
      tmFlash.Enabled:=False;
      imFlashMail.Visible:=False;
      lbNewMess.Visible:=False;
     end else begin
               tmFlash.Enabled:=True;
               lbNewMess.Caption:='Непрочитаных сообщений '+IntToStr(RC)+' ...';
               lbNewMess.Visible:=True;
              end;
   except
   end;
  finally
   tmWaitMessOffice.Enabled:=True;
  end;
 end; {tmWaitMessOfficeTimer}

// Таймер мигания индикатора новых сообщений
procedure TMainF.tmFlashTimer(Sender: TObject);
 begin
  imFlashMail.Visible:=Not imFlashMail.Visible;
 end; {tmFlashTimer}

// Кнопка принудительного закрытия чека по наличной оплате (только для Datecs)
procedure TMainF.bbForceCloseCashClick(Sender:TObject);
 begin
  ForceCloseReceipt(TO_CASH);
 end; {bbForceCloseCashClick}

// Кнопка принудительного закрытия чека по безналичной оплате (только для Datecs)
procedure TMainF.bbForceCloseChekClick(Sender:TObject);
 begin
  ForceCloseReceipt(TO_CHEK);
 end; {bbForceCloseChekClick}

// Пунтк меню "История переоценок"
procedure TMainF.miJReocClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   JReocF:=TJReocF.Create(Self);
   try
    JReocF.ShowModal;
   finally
    JReocF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miJReocClick}

procedure TMainF.miUpdateClick(Sender:TObject);
 begin
  //
 end; {miUpdateClick}

procedure TMainF.btReadTxtClick(Sender:TObject);
 begin
  LoadTextLog(edKassaTxt.Text);
 end;

procedure TMainF.CheckBox1Click(Sender:TObject);
 begin
  EKKA.IsAbort:=CheckBox1.Checked;
 end;

// Пункт меню "Отправить сообщение"
procedure TMainF.miSendMessClick(Sender:TObject);
 begin
  try
   SpisUserF:=TSpisUserF.Create(Self);
   try
    SpisUserF.ShowModal;
    if SpisUserF.Flag=0 then Exit;
   finally
    SpisUserF.Free;
   end;
   if DM.qrSpisUser.IsEmpty then Exit;

    SimpleMessF:=TSimpleMessF.Create(Self);
    try
     SimpleMessF.ID_Dest:=DM.qrSpisUser.FieldByName('ID_GAMMA').AsInteger;
     SimpleMessF.Label2.Caption:=DM.qrSpisUser.FieldByName('Users').AsString;
     SimpleMessF.ShowModal;
    finally
     SimpleMessF.Free;
    end;

{
   ShowMessF:=TShowMessF.Create(Self);
   try
    ShowMessF.ID_Dest:=DM.qrSpisUser.FieldByName('ID_GAMMA').AsInteger;
    ShowMessF.lbName.Caption:=DM.qrSpisUser.FieldByName('Users').AsString;
    ShowMessF.ShowModal;
    tmWaitMessOfficeTimer(tmWaitMessOffice);
   finally
    ShowMessF.Free;
   end;
}
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miSendMessClick}

// Подсветка ссылки "Непрочитанные сообщения"
procedure TMainF.lbNewMessMouseEnter(Sender: TObject);
 begin
  if Sender=Nil then Exit;
  if Not TLabel(Sender).Enabled then Exit;
  TLabel(Sender).Font.Style:=[fsBold,fsUnderLine];
 end; {lbNewMessMouseEnter}

// Подсветка ссылки "Непрочитанные сообщения"
procedure TMainF.lbNewMessMouseLeave(Sender: TObject);
 begin
  if Sender=Nil then Exit;
  if Not TLabel(Sender).Enabled then Exit;
  TLabel(Sender).Font.Style:=[fsUnderLine];
 end; {lbNewMessMouseLeave}

// Открытие окна для чтения/записи сообщений
procedure TMainF.lbNewMessClick(Sender:TObject);
 begin
  imHistoryDblClick(imHistory);
 end; {lbNewMessClick}

// !!!!!
procedure TMainF.acNEKKAExecute(Sender:TObject);
 begin
  if Not IsSkdDop then Exit;
  if Not ChekOpened then Exit;
  if TypeChek<>TC_MAIN then Exit;

  lbNumCard50.Visible:=Not lbNumCard50.Visible;
  btnPayChek.Enabled:=Not lbNumCard50.Visible;
  FlagW:=Not FlagW;
  cbEKKA.Checked:=lbNumCard50.Visible;
 end; {acNEKKAExecute}

function TMainF.CheckPassword(Psw:String):Boolean;
 begin
  if Design and (Prm.UserRole=R_ADMIN) then begin Result:=True; Exit; end;
  try
   PswF:=TPswF.Create(Self);
   try
    PswF.Passw:=Psw;
    PswF.ShowModal;
    if PswF.Flag<>1 then Abort;
   finally
    PswF.Free;
   end;
   Result:=True;
  except
   Result:=False;
  end;
 end;

// Пункт меню "Ведомости КРО"
procedure TMainF.miKROClick(Sender:TObject);
 begin
  if Not CheckPassword('777') then Exit;
  try
   BlankKROF:=TBlankKROF.Create(Self);
   try
    BlankKROF.ShowModal;
   finally
    BlankKROF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miKROClick}

// Пункт меню "Чек для курьера"
procedure TMainF.miChekKurierClick(Sender:TObject);
 begin
  FTypeChek:=TC_KURER;
  OpenChek;
 end; {miChekKurierClick}

// Отчет по закончившимся наименованиям
procedure TMainF.PrintTodayZeroRep(P:Byte);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1150], ');
   DM.Qr.SQL.Add('       a.Art_Code as Код_I_1500, ');
   DM.Qr.SQL.Add('       a.Names as Наименование_S_7500, ');
   DM.Qr.SQL.Add('       Max(a.Cena) as Цена_N_1000, ');
   DM.Qr.SQL.Add('       b.P1 as [Осн._S_1000], ');
   DM.Qr.SQL.Add('       b.P2 as [Витр._S_1000], ');
   DM.Qr.SQL.Add('       b.P3 as [Скл._S_1000] ');
   DM.Qr.SQL.Add('from (select s.art_code from ArhCheks aa, SprTov s                           ');
   DM.Qr.SQL.Add('      where aa.kod_name=s.kod_name and                                       ');
   DM.Qr.SQL.Add('            aa.date_chek>convert(datetime,convert(varchar,getdate(),23))) c, ');
   DM.Qr.SQL.Add('     SprTov a left join Inform..SprReg b on a.art_code=b.art_code            ');
   DM.Qr.SQL.Add('where a.art_code=c.art_code                                                  ');
   DM.Qr.SQL.Add('group by a.Art_Code,a.Names,b.P1,b.P2,b.P3                                   ');
   DM.Qr.SQL.Add('having Sum(ostat)<=0                                                         ');
   Case P of
    1:DM.Qr.SQL.Add('order by a.Names ');
    2:DM.Qr.SQL.Add('order by b.P2,b.P1,b.P3,a.Names ');
   end;
   DM.Qr.Open;
   DM.Qr.First;

   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Size:=5;
   PrintRep.Font.Name:='Arial';
   PrintRep.Align:=AL_CENTER;
   PrintRep.AddText('Список наименований, которые закончились '+FormatDateTime('dd.mm.yyyy',Date)+#10' по торговой точке '+Prm.AptekaNameRU+#10);
   PrintRep.Align:=AL_LEFT;
   PrintRep.AddText(#10'Время печати: '+FormatDateTime('dd.mm.yyyy hh:nn:ss',Now)+#10#10#10);
   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Size:=4;
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(False,0,0);
   PrintRep.PreView;
  except
   MainF.MessBox('Ошибка формирования отчета!');
  end;
 end; {PrintTodayZeroRep}

// Пункт меню "Отчет по закончившимся наименованиям"
procedure TMainF.miRepAlfClick(Sender:TObject);
 begin
  if Sender=nil then Exit;
  PrintTodayZeroRep(TMenuItem(Sender).Tag);
 end; {miRepAlfClick}

// Пункт меню "Выборочная инвентаризация"
procedure TMainF.miInvClick(Sender:TObject);
 begin
  if Not CheckPassword('777') then Exit;
  ShowWorkSprF(W_PEREUCHET);
 end; {miInvClick}

// Признак киоск/аптека
function TMainF.GetIsKiosk:Boolean;
 begin
  Result:=(AnsiUpperCase(Copy(Prm.AptekaNameRU,1,10))=AnsiUpperCase('Апт. киоск')) and
          ((Prm.AptekaID in [2,14])=False);
 end; {GetIsKiosk}

// Пункт меню "Показывать окно ввода сдачи"
procedure TMainF.miShowMCashClick(Sender:TObject);
 begin
  miShowMCash.Checked:=Not miShowMCash.Checked;
  Opt.ShowMCash:=miShowMCash.Checked;
 end; {miShowMCashClick}

// Пункт меню "Терапевтическая замена"
procedure TMainF.miTerapClick(Sender: TObject);
 begin
  if DM.spY_FilterSklad.IsEmpty then Exit;
  try
   ShowTerapF:=TShowTerapF.Create(Self);
   try
    ShowTerapF.lbName.Caption:=DM.spY_FilterSklad.FieldByName('Names').AsString;
    ShowTerapF.lbName.Tag:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;
    ShowTerapF.MakeList;
    ShowTerapF.ReOpen(-1);
    if DM.qrTerap.IsEmpty then Exit;
    ShowTerapF.ShowModal;
    if ShowTerapF.IsFind then
     begin
      SetType_Tov(DM.qrTerap.FieldByName('Type_Tov').AsInteger);
      dbgSklad.DataSource.DataSet.Locate('Art_Code',DM.qrTerap.FieldByName('Art_Code').AsInteger,[loCaseInsensitive,loPartialKey]);
     end;
   finally
    ShowTerapF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miTerapClick}

// Метод чтения процента скидки для ценников
function TMainF.GetPercForPrice:Byte;
 begin
  Result:=0;
  if Prm.AptekaID in [58,16] then Result:=10; // else
//  if Prm.AptekaID in [58,46] then Result:=10; // else
//  if Prm.AptekaID in [72] then Result:=3;
 end; {GetPercForPrice}

// Выгрузка данных для 271-х аптек
function TMainF.UnLoadFor271(D1,D2:TDateTime; Path:String):String;
var Er,ss,S,FName,Pth:String;

 function UnLoad(SQL,FName,FServName:String):String;
  begin
   try
    DM.QrEx.Close;
    DM.QrEx.SQL.Clear;
    DM.QrEx.SQL.Add(' declare @sql varchar(1000),@FileName varchar(500)      ');
    DM.QrEx.SQL.Add(' set @FileName='''+FName+'''                            ');
    DM.QrEx.SQL.Add(' set @sql='''+SQL+'''                                   ');
    DM.QrEx.SQL.Add(' exec spY_UnloadToFile @sql,@FileName,''sa'','''+Opt.BasePassw+''',''\t'' ');
    DM.QrEx.ExecSQL;
    if Not FileExists(FServName) then Abort;
    Result:='';
   except
    Result:=FName;
   end;
  end;

 procedure UnLoadDate(D:TDateTime);
  begin
   FName:='BankRealiz'+FormatDateTime('ddmmyyyy',D)+'.txt';
   DeleteFile(Pth+FName);
   S:=' set dateformat ymd  select convert(varchar,date_chek,104)+'''' ''''+convert(varchar,date_chek,8) as date_chek,a.numb_chek,Sum(a.cena*a.kol) as SumCh,IsNull(Sum(convert(numeric(8,2),a.cena*a.kol*(a.skd/100.))),0) as sumskd,'+IntToStr(Prm.AptekaID)+' as Num, '''''+FormatDateTime('dd.mm.yyyy',D)+''''' as Dt '+
      ' from apteka_net..arhcheks a'+
      ' where a.kol>0 and a.kassa_num in (2,4) and '+
      ' date_chek between '''''+FormatDateTime('yyyy-mm-dd',D)+' 00:00:00'''' and '''''+FormatDateTime('yyyy-mm-dd',D)+' 23:59:59'''' group by date_chek,numb_chek';
   DM.QrEx.SQl.Text:=S;
   DM.QrEx.SQL.SaveToFile('C:\122222.txt');

   ss:=UnLoad(S,Opt.LogPath+FName,Pth+FName);
   if Path<>'' then CopyFile(PChar(Pth+FName),PChar(Path+FName),false);
   if ss<>'' then Er:=' - '+ss;


   FName:='Realiz'+FormatDateTime('ddmmyyyy',D)+'.txt';
   DeleteFile(Pth+FName);
   S:=' set dateformat ymd select b.art_code,b.names,Sum(a.kol) as Kol,a.cena,IsNull(Sum(convert(numeric(8,2),a.cena*a.kol*(a.skd/100.))),0) as sumskd,a.VZH,a.NUMB_CHEK,a.kassa_num,'+IntToStr(Prm.AptekaID)+' as Num, '''''+FormatDateTime('dd.mm.yyyy',D)+''''' as Dt '+
      ' from apteka_net..arhcheks a, apteka_net..sprtov b '+
      ' where a.kol>0 and a.kod_name=b.kod_name and '+
      ' date_chek between '''''+FormatDateTime('yyyy-mm-dd',D)+' 00:00:00'''' and '''''+FormatDateTime('yyyy-mm-dd',D)+' 23:59:59'''' group by b.art_code,b.names,a.cena,a.VZH,a.NUMB_CHEK,a.skd,a.kassa_num';

   ss:=UnLoad(S,Opt.LogPath+FName,Pth+FName);
   if Path<>'' then CopyFile(PChar(Pth+FName),PChar(Path+FName),false);
   if ss<>'' then Er:=' - '+ss;

   FName:='BackCl'+FormatDateTime('ddmmyyyy',D)+'.txt';
   DeleteFile(Pth+FName);
   S:=' set dateformat ymd select b.art_code,b.names,Abs(Sum(a.kol)) as Kol,a.cena,Abs(IsNull(Sum(convert(numeric(8,2),a.cena*a.kol*(a.skd/100.))),0)) as sumskd, a.VZH,a.NUMB_CHEK,'+IntToStr(Prm.AptekaID)+' as Num, '''''+FormatDateTime('dd.mm.yyyy',D)+''''' as Dt '+
      ' from apteka_net..arhcheks a, apteka_net..sprtov b '+
      ' where a.kol<0 and a.kod_name=b.kod_name and '+
      ' date_chek between '''''+FormatDateTime('yyyy-mm-dd',D)+' 00:00:00'''' and '''''+FormatDateTime('yyyy-mm-dd',D)+' 23:59:59'''' group by b.art_code,b.names,a.cena,a.skd,a.VZH,a.NUMB_CHEK';
   ss:=UnLoad(S,Opt.LogPath+FName,Pth+FName);
   if Path<>'' then CopyFile(PChar(Pth+FName),PChar(Path+FName),false);
   if ss<>'' then Er:=Er+#10+' - '+ss;

   FName:='Vozvr'+FormatDateTime('ddmmyyyy',D)+'.txt';
   DeleteFile(Pth+FName);
   S:=' set dateformat ymd select a.nn_nakl,b.art_code,b.names,Sum(a.kol) as Kol,a.cena,'+IntToStr(Prm.AptekaID)+' as Num, '''''+FormatDateTime('dd.mm.yyyy',D)+''''' as Dt '+
      ' from apteka_net..moves a, apteka_net..sprtov b '+
      ' where a.debcrd=2 and a.nn_nakl not like ''''%пр-%'''' and a.kod_name=b.kod_name and '+
      ' date_nakl between '''''+FormatDateTime('yyyy-mm-dd',D)+' 00:00:00'''' and '''''+FormatDateTime('yyyy-mm-dd',D)+' 23:59:59'''' group by a.nn_nakl,b.art_code,b.names,a.cena';
   ss:=UnLoad(S,Opt.LogPath+FName,Pth+FName);
   if Path<>'' then CopyFile(PChar(Pth+FName),PChar(Path+FName),false);
   if ss<>'' then Er:=Er+#10+' - '+ss;

   FName:='CenaOst'+FormatDateTime('ddmmyyyy',D)+'.txt';
   DeleteFile(Pth+FName);
   S:='set dateformat ymd exec(''''  declare @dt datetime '+
      'set @dt='''''''''+FormatDateTime('yyyy-mm-dd',D)+' 00:00:00''''''''  '+
      'select a.art_code,a.names, '+
      'Sum(a.ostat)+ '+
      'IsNull((select Sum(kol) from apteka_net..ArhCheks a1, apteka_net..SprTov s1 where a1.kod_name=s1.kod_name and s1.art_code=a.art_code and a1.date_chek>=@dt),0)+ '+
      'IsNull((select Sum(kol) from apteka_net..Moves m1, apteka_net..SprTov s2 where m1.kod_name=s2.kod_name and s2.art_code=a.art_code and m1.date_nakl>=@dt and m1.debcrd=2),0)- '+
      'IsNull((select Sum(kol) from apteka_net..Moves m2, apteka_net..SprTov s3 where m2.kod_name=s3.kod_name and s3.art_code=a.art_code and m2.date_nakl>=@dt and m2.debcrd=1),0) as Ostat, '+
      'IsNull((select top 1 m.cena from apteka_net..Moves m, apteka_net..SprTov s '+
      'where m.kod_name=s.kod_name and s.art_code=a.art_code and '+
      'm.nn_nakl like ''''''''Впр%'''''''' and m.debcrd=2 and m.date_nakl>=@dt '+
      'order by date_nakl, nn_nakl),cena) as cena_old ,'+IntToStr(Prm.AptekaID)+' as Num, '''''''''+FormatDateTime('dd.mm.yyyy',D)+''''''''' as Dt '+
      'from apteka_net..SprTov a '+
      'group by a.art_code,a.names,a.cena'''')';

   ss:=UnLoad(S,Opt.LogPath+FName,Pth+FName);
   if Path<>'' then CopyFile(PChar(Pth+FName),PChar(Path+FName),false);
   if ss<>'' then Er:=Er+#10+' - '+ss;
  end;

 begin
  Result:='';
  try
   if IsServer then Pth:=Opt.LogPath else Pth:=Opt.ServerLogPath;
   While D1<=D2 do
    begin
     UnLoadDate(D1);
     D1:=D1+1;
    end;
   Result:=Er;
  except
   Result:=Er;
  end;
 end;

// Пункт меню "Выгрузить реализацию"
procedure TMainF.miUnloadRealizClick(Sender:TObject);
var D1,D2:TDateTime;
    Er:String;

 begin
  if GetDiagDate(D1,D2)=False then Exit;
  try
   Er:=UnLoadFor271(D1,D2,'');
   if Er='' then MessBox('Все выгружено успешно!',64) else Abort;
  except
   MessBox('Ошибка выгрузки файлов: '+#10#10+Er);
  end;
 End; {miUnloadRealizClick}

procedure TMainF.tmChekClick(Sender: TObject);
var Art,L,P,AC,i,j,q,k:Integer;
    en:Boolean;
    Sum,SumNeed,SumChPrev:Currency;
 begin
  try
   AC:=0;
   en:=False;
   EKKA.fpCutBeep(1,0);
   FIsChSeria:=True;
   if DM.spY_FilterSklad.IsEmpty then Exit;
   q:=GetKolFromDialog('',999,AC,EN_SIMPLE);
   if Not EnterCurrValue(SumNeed) then Exit;

   for i:=1 to q do
    begin
     EKKA.fpCashState(0);
     if StrToInt(EKKA.RD_Item[5])*0.01>=SumNeed then Break;
     OpenChek;
     for j:=1 to Random(6)+1 do
      begin
       DM.Qr.Close;
       DM.Qr.SQL.Text:='select top 1 art_code from SprTov where f_nds=2 and ostat>0 order by NewID()';
       DM.Qr.Open;
       if DM.Qr.IsEmpty then Break;

       if DM.spY_FilterSklad.IsEmpty then Break;
       Art:=DM.Qr.FieldByName('art_code').AsInteger;
       DM.spY_FilterSklad.Locate('art_code',Art,[]);
       SumChPrev:=SumChekFull;

       // PrevEnterKol(EK_SCAN);
       DM.Qr1.Close;
       DM.Qr1.SQL.Clear;
       DM.Qr1.SQL.Add('declare @part_code integer,@pkol int,@piduser smallint,@pscan smallint ');
       DM.Qr1.SQL.Add('set @part_code='+IntToStr(Art)+'                                            ');
       DM.Qr1.SQL.Add('set @pkol='+IntToStr(Random(5)+1)+'                                         ');
       DM.Qr1.SQL.Add('set @piduser='+IntToStr(Prm.UserID)+'                                       ');
       DM.Qr1.SQL.Add('set @pscan=1 if @pkol>100 set @pkol=1                                                               ');
//       DM.Qr1.SQL.Add('delete from Chek where id_user=@piduser                                     ');
       DM.Qr1.SQL.Add('insert into Chek(art_code,kod_name,art_name,names,kol,cena,f_nds,type_tov,id_user,printing,sumskd,skd,numcard,old_art,type_map,compname) ');
       DM.Qr1.SQL.Add('select @part_code,kod_name,art_name,names,ostat,cena,f_nds,type_tov,@piduser,@pscan,0,0,-1,@part_code,0,host_name()                         ');
       DM.Qr1.SQL.Add('from sprtov where art_code=@part_code and ostat>0                                                                               ');
       DM.Qr1.SQL.Add('            and kod_name not in (select kod_name from Chek where id_user=@piduser)');
       DM.Qr1.SQL.Add('order by kod_name                                                                                                               ');
       DM.Qr1.SQL.Add('update Chek set @pkol=kol_akcii=@pkol-kol+IsNull(kol_akcii,0) where id_user=@piduser                                            ');
       DM.Qr1.SQL.Add('update Chek set kol_akcii=(case when kol_akcii+kol>kol then kol when kol_akcii+kol>0 then kol_akcii+kol else 0 end) where id_user=@piduser ');
       DM.Qr1.SQL.Add('update Chek set kol=kol_akcii where id_user=@piduser    ');
       DM.Qr1.SQL.Add('update Chek set kol=1 where kol>20 ');

       DM.Qr1.SQL.Add('delete from Chek where id_user=@piduser and kol<=0  and compname=host_name()    ');

//       DM.Qr1.SQL.Add('update SprTov set ostat=ostat-b.kol from SprTov a, Chek b where a.kod_name=b.kod_name and id_user=@piduser ');
       DM.Qr1.ExecSQL;

       if StrToInt(EKKA.RD_Item[5])*0.01+SumChekFull>SumNeed then Break;
{        begin
         DM.Qr1.Close;
         DM.Qr1.SQL.Clear;
         DM.Qr1.SQL.Add('declare @kd int');
         DM.Qr1.SQL.Add('set @kd=(select top 1 kod_name from Chek where id_user='+IntToStr(Prm.UserID)+' and art_code='+IntToStr(Art)+')');
         DM.Qr1.SQL.Add('delete from Chek where kod_name<>@kd and id_user='+IntToStr(Prm.UserID));
         DM.Qr1.SQL.Add('update Chek set kol=1, cena='+CurrToStr(SumNeed-SumChPrev-StrToInt(EKKA.RD_Item[5])*0.01)+' where kod_name=@kd and id_user='+IntToStr(Prm.UserID));
         DM.Qr1.ExecSQL;
         ReopenChek;
         Break;
        end;
}
{       if then
        begin
         en:=True;
         Break
        end;  }
      end;
     ReopenChek;

     if DM.qrChek.IsEmpty then Break;
     PayChek(TO_CASH);
     if en then Break;
    end;

   if MessBox('Сделать выдачу и снять X,Z-отчеты?',52)=ID_YES then
    begin
     EKKA.fpCashState(0);
     MainF.ShowErrorEKKA(EKKA.fpCashOutput(StrToInt(EKKA.RD_Item[5])*0.01));
     if EKKA.LastError<>'' then begin MessBox('Не удалось сделать выдачу: '+EKKA.LastErrorDescr,48); Exit; end;
     Repeat
      if EKKA.fpXRep then Break;
      if EKKA.LastError='SOFTSLZREP' then
       if MainF.MessBox('Переведите ключ в положение X. Для отмены снятия X-отчета нажмите "Нет"',52)<>ID_YES then Exit else
      else begin
            MainF.MessBox(EKKA.LastErrorDescr);
            Exit;
           end;
     Until False;

     Repeat
      if EKKA.fpZRep then Break;
      if EKKA.LastError='SOFTSLNREP' then
       if MainF.MessBox('Переведите ключ в положение Z. Для отмены снятия Z-отчета нажмите "Нет"',52)<>ID_YES then Exit else
      else begin
            MainF.MessBox(EKKA.LastErrorDescr);
            Exit;
           end;
     Until False;

    end;
  finally
   FIsChSeria:=False;
  end;
 end;

procedure TMainF.sbProfClick(Sender:TObject);
 begin
  SetSkdMag(sbProf,True);
  RefreshChek;
 end;

procedure TMainF.miNoTovClick(Sender:TObject);
 begin
 {
  try
   DM.Qr4.Close;
   DM.Qr4.SQL.Text:='select * from SprNoTov where Descr not like ''%другое%'' and art_code='+DM.spY_FilterSklad.FieldByName('art_code').AsString;
   DM.Qr4.Open;
   if DM.Qr4.IsEmpty then
    MessBox('Причина отсутствия препарата "'+DM.spY_FilterSklad.FieldByName('names').AsString+'" неизвестна!')
   else
    MessBox('Причина отсутствия препарата "'+DM.spY_FilterSklad.FieldByName('names').AsString+'": '+#10#10+
            '  - '+DM.Qr4.FieldByName('Descr').AsString,64);
  except
   on E:Exception do MessBox('Ошибка доступа к справочнику товаров: '+E.Message);
  end;
 }

  try
   DM.Qr4.Close;
   DM.Qr4.SQL.Text:='select b.Descr,IsNull(a.art_code,-1) as art_code from SprReason b left join SprNoTov a on b.descr=a.descr and a.art_code='+DM.spY_FilterSklad.FieldByName('art_code').AsString;
   DM.Qr4.Open;
   if DM.Qr4.IsEmpty then begin MessBox('Причина отсутствия неизвестна!'); Exit; end;
   ReasonNoTovF:=TReasonNoTovF.Create(Self);
   try
    ReasonNoTovF.ShowModal;
   finally
    ReasonNoTovF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.miCenaUpClick(Sender:TObject);
var Art_Code,Koef,Kol:Integer;
 begin
  if DM.spY_FilterSklad.IsEmpty then Exit;
  Art_Code:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;
  Koef:=0;
  try
   DM.Qr1.Close;
   DM.Qr1.SQL.Text:='select * from Inform..SprKoef where art_code='+IntToStr(Art_Code);
   DM.Qr1.Open;
   if DM.Qr1.IsEmpty then Abort;

   Kol:=GetKoef(DM.Qr1.FieldByName('Koef').AsInteger,DM.Qr1.FieldByName('Upak').AsInteger);
   Kol:=DM.Qr1.FieldByName('Koef').AsInteger;
   Koef:=Kol;
   if Kol<=1 then Abort;
   if Kol>DM.spY_FilterSklad.FieldByName('OSTAT').AsInteger then Kol:=DM.spY_FilterSklad.FieldByName('OSTAT').AsInteger;
  except
   Kol:=0;
  end;
  Kol:=GetKolFromDialog(DM.spY_FilterSklad.FieldByName('Names').AsString,Kol,Art_Code,EN_SIMPLE,Koef,DM.Qr1.FieldByName('Upak').AsInteger);

  try
   CenaUpakF:=TCenaUpakF.Create(Self);
   try
    CenaUpakF.Kol:=Kol;
    CenaUpakF.Cena:=DM.spY_FilterSklad.FieldByName('Cena').AsFloat;
    CenaUpakF.Names:=DM.spY_FilterSklad.FieldByName('Names').AsString;
    CenaUpakF.ShowModal;
   finally
    CenaUpakF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.miScanBoxClick(Sender:TObject);
 begin
  try
   ScanBoxF:=TScanBoxF.Create(Self);
   try
    ScanBoxF.ShowModal;
   finally
    ScanBoxF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.PrintObnovDate(F_NDS:Integer);
var Nds:Boolean;
    It:Integer;
    Dt:TDateTime;
    Tb:TTableObj;
    i:Integer;
 begin

  if Not CheckPassword(GetPasswRep) then Exit;
  try
   if GetDiagDate1(Dt)=False then Exit;
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spY_OstatToDate '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Dt)+''' ';
   DM.QrEx.ExecSQL;


   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   if F_NDS in [1..4] then
    begin
     if F_NDS in [1,3] then
      begin
       DM.Qr.SQL.Add('select ''NumS'' as [№0пп_S_1000],');
       DM.Qr.SQL.Add('       Names as Наименование_S_8000,');
       DM.Qr.SQL.Add('      ''   уп'' as [Ед.изм_S_1000],');
       DM.Qr.SQL.Add('       Sum(Ostat) as [Кол-во_I_1500],');
       DM.Qr.SQL.Add('       Convert(Numeric(8,2),Cena*5/6) as [Цена0без0НДС_N_1700],');
       DM.Qr.SQL.Add('       Cena-Convert(Numeric(8,2),Cena*5/6) as [НДС0на0ед_N_1500],');
       DM.Qr.SQL.Add('       Cena as [Цена0с0НДС_N_1700],');
       DM.Qr.SQL.Add('       Sum(Ostat*Cena) as Сумма_N_1700');
       It:=8;
       Nds:=True;
      end else
     if F_NDS in [2,4] then
      begin
       DM.Qr.SQL.Add('select ''NumS'' as [№0пп_S_1100],');
       DM.Qr.SQL.Add('       Names as Наименование_S_9000,');
       DM.Qr.SQL.Add('      ''   уп'' as [Ед.изм_S_1000],');
       DM.Qr.SQL.Add('       Sum(Ostat) as [Кол-во_I_1700],');
       DM.Qr.SQL.Add('       Cena as Цена_N_1700,');
       DM.Qr.SQL.Add('       Sum(Ostat*Cena) as Сумма_N_1700');
       Nds:=False;
       It:=6;
      end;

     DM.Qr.SQL.Add('from SprOstat');
     DM.Qr.SQL.Add('where Dt='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Dt)+''' and ostat>0 and art_code<>0 and f_nds='+IntToStr(F_NDS));
     DM.Qr.SQL.Add('group by art_code,Names,cena');
     DM.Qr.SQL.Add('order by Names');
    end;
//   DM.Qr.SQL.SaveToFile('C:\9876.txt');
   DM.Qr.Open;
   DM.Qr.First;
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.Font.Size:=4;
   PrintRep.Font.Name:='Arial';
   PrintRep.Align:=AL_LEFT;

   PrintRep.AddTable(2,4);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('5200,1400');
   for i:=1 to 3 do Tb.Cell[2,i].Align:=AL_CENTER;
   Tb.SetBorders(1,1,1,4,EMPTY_BORDER);

   if F_NDS in [1,2,5] then
    begin
     Tb.SetBorders(2,1,2,3,Border(clBlack,5,psSolid));

     Tb.Cell[2,1].AddText(Prm.FirmNameUA);
     Tb.Cell[2,2].Font.Size:=3;
     Tb.Cell[2,2].AddText('ВХОДНОЙ КОНТРОЛЬ');
     Tb.Cell[2,3].AddText('ПРОВИЗОР___________');
    end else begin
              for i:=1 to 3 do Tb.Cell[2,i].RightBorder:=EMPTY_BORDER;
              Tb.Cell[2,1].TopBorder:=EMPTY_BORDER;
              Tb.Cell[2,4].TopBorder:=EMPTY_BORDER;
             end;
   Tb.Cell[2,2].TopBorder:=EMPTY_BORDER;
   Tb.Cell[2,3].TopBorder:=EMPTY_BORDER;
   Tb.Cell[2,4].RightBorder:=EMPTY_BORDER;
   Tb.Cell[1,1].AddText('Накладная №'+IntToStr(Prm.AptekaID)+'/'+IntToStr(F_NDS)+'                       от '+FormatDateTime('dd.mm.yyyy',Dt));
   if F_NDS in [1,2,5] then
    begin
     Tb.Cell[1,3].AddText('От кого : '+Prm.FirmNameUA);
     Tb.Cell[1,4].AddText('Кому : '+Prm.AptekaNameRU);
    end else begin
              Tb.Cell[1,3].AddText('От кого : '+Opt.CHPName);
              Tb.Cell[1,4].AddText('Кому : '+Opt.CHPAddr);
             end;

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select top 1 * from SprOstat where Dt='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Dt)+''' ';
   DM.QrEx.Open;

   PrintRep.Indent:=0;
   PrintRep.AddText(#10+'Дата формирования: '+DM.QrEx.FieldByName('Tm').AsString);
   PrintRep.AddText(#10+'Дата печати: '+DateTimeToStr(Now)+#10#10);

   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Size:=4;
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(Nds,It,0);
   if F_NDS<=2 then
    PrintRep.AddText(#10#10+'Отпуск разрешил:______________'+#10);

   PrintRep.AddInterv(6);
   PrintRep.AddText('Отпустил:____________________           Получил:_______________________'+#10);
   PrintRep.PreView;
  except
   on E:Exception do MessBox('Ошибка доступа к справочнику товаров: '+E.Message);
  end;
 end; {PrintObnov}

procedure TMainF.miNDS1Click(Sender: TObject);
 begin
  if Sender=Nil then Exit;
  PrintObnovDate(TMenuItem(Sender).Tag);
 end; {miNDS1Click}

procedure TMainF.miPrepChekClick(Sender: TObject);
 begin
  FTypeChek:=TC_PREP;
  OpenChek;
 end; {N1Click}

procedure TMainF.N2Click(Sender:TObject);
 begin
  FTypeChek:=TC_SERTIF;
  OpenChek;
 end; {N2Click}

procedure TMainF.bbReserveClick(Sender:TObject);
 begin
  if DM.qrChek.IsEmpty then
   begin
    MessBox('Чек пустой!');
    Exit;
   end; 
  try
   AddResF:=TAddResF.Create(Self);
   try
    AddResF.ShowModal;
    if AddResF.Flag=1 then
     begin
      DM.ADOCo.BeginTrans;
      try
       DM.spY_AddToReserve.Close;
       DM.spY_AddToReserve.Parameters.ParamValues['@fio']:=AddResF.Edit1.Text;
       DM.spY_AddToReserve.Parameters.ParamValues['@phone']:=AddResF.Edit3.Text;
       DM.spY_AddToReserve.Parameters.ParamValues['@id_user']:=Prm.UserID;
       DM.spY_AddToReserve.ExecProc;
       if DM.spY_AddToReserve.Parameters.ParamValues['@RETURN_VALUE']<>4444 then Abort;
       DM.ADOCo.CommitTrans;
       CancelChek;
      except
       DM.ADOCo.RollbackTrans;
       raise;
      end;
     end;
   finally
    AddResF.Free;
   end;
  except
   on E:Exception do MessBox('Ошибка бронирования препаратов: '+E.Message);
  end;
 end; {bbReserveClick}

procedure TMainF.N3Click(Sender:TObject);
var i:Integer;
 begin
  try
   WorkResF:=TWorkResF.Create(Self);
   try
    WorkResF.ShowModal;
    if WorkResF.Flag=1 then
     begin
      FIDRES:=WorkResF.IDRES;
      DM.ADOCo.BeginTrans;
      try

       DM.Qr4.Close;
       DM.Qr4.SQL.Text:='update DhRes set Closed=2 where idres='+IntToStr(FIDRES);
       DM.Qr4.ExecSQL;

       for i:=1 to DM.qrResPos.RecordCount do
        begin
         if i=1 then DM.qrResPos.First else DM.qrResPos.Next;

         DM.spY_EnterKol.Parameters.ParamValues['@part_code']:=DM.qrResPos.FieldByName('Art_code').AsInteger;
         DM.spY_EnterKol.Parameters.ParamValues['@pold_art']:=DM.qrResPos.FieldByName('Art_code').AsInteger;
         DM.spY_EnterKol.Parameters.ParamValues['@pkol']:=DM.qrResPos.FieldByName('kol').AsInteger;
         DM.spY_EnterKol.Parameters.ParamValues['@piduser']:=Prm.UserID;
         DM.spY_EnterKol.Parameters.ParamValues['@ptm']:=0;
         DM.spY_EnterKol.Parameters.ParamValues['@simp']:=0;

         if DM.qrResPos.FieldByName('IsScan').AsInteger<>0 then DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=1
                                                           else DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=0;
         DM.spY_EnterKol.ExecProc;
        end;

       DM.Qr4.Close;
       DM.Qr4.SQL.Text:='update DhRes set Closed=0 where idres='+IntToStr(FIDRES);
       DM.Qr4.ExecSQL;

       DM.ADOCo.CommitTrans;
      except
       DM.ADOCo.RollbackTrans;
      end;
      OpenChek;
     end;
   finally
    WorkResF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {N3Click}

procedure TMainF.miPredstClick(Sender:TObject);
 begin
  try
   RegPredstF:=TRegPredstF.Create(Self);
   try
    RegPredstF.crPref:=CR_PREDST;
    RegPredstF.Cap:='медпредставителя';
    RegPredstF.Tab:='RegPredst';
    RegPredstF.ShowModal;
   finally
    RegPredstF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miPredstClick}

procedure TMainF.sbMagClick(Sender:TObject);
 begin
  SetSkdMag(sbMag,True);
  RefreshChek;
 end;

procedure TMainF.sbMediCardClick(Sender:TObject);
 begin
  SetSkdMag(sbMediCard,True);
  RefreshChek;
 end;

procedure TMainF.SetMediCardSkd;
var i,k:Integer;
    d:Real;
    sl:TStringList;
 begin
  try
//   if Design then Exit;
   if sbMediCard.Down=False then Exit;
   DM.Qr5.Close;
   DM.Qr5.SQL.Text:='select a.art_code from Chek a, MediCard b where a.art_code=b.art_code and skdm is null and compname=host_name() and id_user='+IntToStr(Prm.UserID);
   DM.Qr5.Open;
   if DM.Qr5.IsEmpty then Exit;

   DM.Qr5.Close;
   DM.Qr5.SQL.Text:='select a.art_code,b.medi,convert(numeric(8,2),Sum(a.kol))/convert(numeric(8,2),dbo.GetKoefUpak(a.art_code)) as kol from Chek a, MediCard b where a.art_code=b.art_code and compname=host_name() and id_user='+IntToStr(Prm.UserID)+' group by a.art_code,medi';
   DM.Qr5.Open;
   if DM.Qr5.IsEmpty then Exit;

   for i:=1 to DM.Qr5.RecordCount do
    try
     if i=1 then DM.Qr5.First else DM.Qr5.Next;
     SndRecXML.XMLBody:='<?xml version="1.0" encoding="UTF-8"?>'+#10+
                        '<data>'+#10+
                        ' <request_type>1</request_type>'+#10+
                        ' <id_casual>f4c5068424dab2e514f5fe536b5e4a8a</id_casual>'+#10+
                        ' <inside_code>'+IntToStr(Prm.MediID)+'</inside_code>'+#10+
                        ' <card_code>MD0'+Copy(IntToStr(NumMediCard),4,10)+'</card_code>'+#10+
                        ' <product_code>'+DM.Qr5.FieldByName('art_code').AsString+'</product_code>'+#10+
                        ' <qty>'+DM.Qr5.FieldByName('kol').AsString+'</qty>'+#10+
                        ' <login></login><password></password>'+#10+
                        '</data>';
//     ShowMessage(SndRecXML.XMLBody);
     SndRecXML.Post;

//     ShowMessage( SndRecXML.Results);
     sl:=TStringList.Create;
     sl.Text:=SndRecXML.Results;
     sl.SaveToFile('D:\ava\medi.txt');
     DM.Qr6.Close;
     DM.Qr6.SQL.Clear;
     DM.Qr6.SQL.Add('insert into Inform..WebLog(Req,Answ,TypeLog)');
     DM.Qr6.SQL.Add('values('''+SndRecXML.XMLBody+''','''+SndRecXML.Results+''',1)');
     DM.Qr6.ExecSQL;
     if SndRecXML.Results='' then Continue;

     try d:=StrToFloat(GetValueFromXML('discont',SndRecXML.Results)); if d<0 then Abort; except d:=0; end;
     try k:=StrToInt(GetValueFromXML('qty',SndRecXML.Results)); if k<0 then Abort; except k:=0; end;
     DM.Qr6.Close;
     DM.Qr6.SQL.Clear;
     DM.Qr6.SQL.Add('update Chek set skdm='+FloatToStr(d)+',kolm='+IntToStr(k));
     DM.Qr6.SQL.Add('where art_code='+DM.Qr5.FieldByName('art_code').AsString+' and compname=host_name() and id_user='+IntToStr(Prm.UserID));
     DM.Qr6.ExecSQL;
    except
     on E:Exception do MessBox('Ошибка отправки запроса: '+E.Message);
    end;
  except
   on E:Exception do MessBox('Ошибка отправки запроса: '+E.Message);
  end;
 end;

function TMainF.CheckTypeMDMU:Integer;
 begin
  try
   if Copy(IntToStr(NumMDMUCard),1,3)=MDM_1 then Result:=1 else
   if Copy(IntToStr(NumMDMUCard),1,3)=MDM_2 then Result:=2 else Abort;
  except
   Result:=-1;
  end;
 end;

function TMainF.MDMUCheckLogin:Boolean;
var sR,sR1:TStringStream;
    s,s1,ss:String;
 begin
  try
//   if Design then Exit;
   if CheckTypeMDMU=1 then
    begin
     s1:='checkLoginResult';
     HTTPRR.URL:='https://exim.mdmworld.com/OrganizationSaleService.asmx';
     s:='<?xml version="1.0" encoding="utf-8"?>'+#10+
                      '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> '+#10+
                      '  <soap:Body>                                 '+#10+
                      '    <checkLogin xmlns="http://tempuri.org/">  '+#10+
                      '      <aLoginName>Service.Gamma55</aLoginName>         '+#10+
                      '      <aLoginPassword>yvb74_dr19</aLoginPassword> '+#10+
                      '    </checkLogin>                             '+#10+
                      '  </soap:Body>                                '+#10+
                      '</soap:Envelope>                              ';
     HTTPRR.SoapAction:='http://tempuri.org/checkLogin';
    end else
   if CheckTypeMDMU=2 then
    begin
     s1:='checkCardResult';
     HTTPRR.URL:='http://exim.demo.mdmworld.com/CardService.asmx';
     s:='<?xml version="1.0" encoding="utf-8"?> '+#10+
        '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> '+#10+
        '  <soap:Body>                                   '+#10+
        '    <checkCard xmlns="http://tempuri.org/">     '+#10+
        '      <aMdmCode>'+IntToStr(NumMDMUCard)+'</aMdmCode>               '+#10+
        '      <aLoginName>TEST_APTEKA911</aLoginName>           '+#10+
        '      <aLoginPassword>pass</aLoginPassword>   '+#10+
        '    </checkCard>                                '+#10+
        '  </soap:Body>                                  '+#10+
        '</soap:Envelope>                                ';
     HTTPRR.SoapAction:='http://tempuri.org/checkCard';
    end;

   sR:=TStringStream.Create(s);
   sR1:=TStringStream.Create('');
   try

    DM.Qr6.SQL.Text:=sR.DataString; DM.Qr6.SQL.SaveToFile('C:\Sr_.txt');
    HTTPRR.Execute(sR,sR1);
    DM.Qr6.SQL.Text:=Utf8ToAnsi(sR1.DataString); DM.Qr6.SQL.SaveToFile('C:\Sr_1.txt');
    ss:=Utf8ToAnsi(GetValueFromXML(s1,sR1.DataString));

    if CheckTypeMDMU=2 then
     if Not (ss[1] in ['1','2','3'] ) then raise EAbort.Create('Карточка не существует либо продажа уже совершена!') else MDMU221TypeCard:=StrToInt(ss);

    Result:=True;
   finally
    sR.Free;
    sR1.Free;
   end;
  except
   on E:Exception do begin MessBox(E.Message,48); Result:=False; end;
  end;
 end;

function TMainF.MDMUSendRealiz(CP:TChekPos):Boolean;
var sR,sR1:TStringStream;
    s,ss:String;
    i:Integer;
 begin
  try
//   if Design then Exit;
   if NumMDMUCard<0 then Exit;

   if CheckTypeMDMU=1 then
    begin
     HTTPRR.URL:='https://exim.mdmworld.com/OrganizationSaleService.asmx';
     HTTPRR.SoapAction:='http://tempuri.org/loadSaleList';
     s:='<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">'+#10+
        ' <s:Body>'+#10+
        '  <loadSaleList xmlns="http://tempuri.org/" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">'+#10+
        '   <aSaleList>';
{
   s:='<?xml version="1.0" encoding="utf-8"?>'+#10+
      ' <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">'+#10+
      '  <soap:Body> '+#10+
      '  <loadSaleList xmlns="http://tempuri.org/">';
}
    DM.Qr6.Close;
    DM.Qr6.SQL.Clear;
    DM.Qr6.SQL.Add('select a.date_Chek,b.art_code,b.names,a.cardpref,a.skd,a.numb_chek,a.cena,convert(numeric(8,2),a.cena*(100-a.skd)/100.) as cenaskd, Sum(a.kol) as kol,Sum(a.kol*a.cena)-IsNull(Sum(convert(numeric(8,2),a.kol*a.cena*a.skd/100.)),0) as summa,');
    DM.Qr6.SQL.Add('       (select Max(morion) from Inform..SprKoef k where k.art_code=b.art_code) as morion');
    DM.Qr6.SQL.Add('from ArhCheks a, SprTov b');
    DM.Qr6.SQL.Add('where a.kod_name=b.kod_name and a.numb_chek='+IntToStr(CP.NumbChek)+' and a.vzh='+IntToStr(CP.Vzh));
    DM.Qr6.SQL.Add('group by a.date_Chek,b.art_code,b.names,a.cardpref,a.skd,a.numb_chek,a.cena');
    DM.Qr6.Open;
    for i:=1 to DM.Qr6.RecordCount do
     begin
      if i=1 then DM.Qr6.First else DM.Qr6.Next;
      s:=s+'     <OrganizationSale> '+#10+
           '      <OrganizationCode>'+IntToStr(Prm.AptekaID)+'</OrganizationCode>'+#10+
           '      <OrganizationMorionCode></OrganizationMorionCode>'+#10+
           '      <OrganizationName>'+Prm.AptekaNameRU+'</OrganizationName>'+#10+
           '      <OrganizationRegion>'+Prm.aObl+'</OrganizationRegion>'+#10+
           '      <OrganizationCity>'+Prm.aCity+'</OrganizationCity>'+#10+
           '      <OrganizationAddress>'+Prm.aAdress+'</OrganizationAddress>'+#10+
           '      <ProductFormCode>'+DM.Qr6.FieldByName('art_code').AsString+'</ProductFormCode>'+#10+
           '      <ProductFormMorionCode>'+DM.Qr6.FieldByName('morion').AsString+'</ProductFormMorionCode>'+#10+
           '      <ProductFormName>'+DM.Qr6.FieldByName('names').AsString+'</ProductFormName>'+#10+
           '      <CheckId></CheckId>'+#10+
           '      <CheckCode>'+DM.Qr6.FieldByName('numb_chek').AsString+'</CheckCode>'+#10+
           '      <CheckDate>'+FormatDateTime('yyyy-mm-dd',DM.Qr6.FieldByName('date_chek').AsDateTime)+'T'+FormatDateTime('hh:nn:ss',DM.Qr6.FieldByName('date_chek').AsDateTime)+'</CheckDate>'+#10+
           '      <MdmCode>'+DM.Qr6.FieldByName('CardPref').AsString+'</MdmCode>'+#10+
           '      <PrimaryPrice>'+DM.Qr6.FieldByName('cena').AsString+'</PrimaryPrice>'+#10+
           '      <Quantity>'+DM.Qr6.FieldByName('kol').AsString+'</Quantity>'+#10+
           '      <Discount>'+DM.Qr6.FieldByName('skd').AsString+'</Discount>'+#10+
          '      <Price>'+DM.Qr6.FieldByName('cenaskd').AsString+'</Price>'+#10+
          '      <Amount>'+DM.Qr6.FieldByName('summa').AsString+'</Amount>'+#10+
          '     </OrganizationSale>';
    end;

    s:=s+'    </aSaleList> '+#10+
        '   <aLoginName>Service.Gamma55</aLoginName>'+#10+
        '   <aLoginPassword>yvb74_dr19</aLoginPassword>'+#10+
        '  </loadSaleList>'+#10+
        ' </s:Body>'+#10+
        '</s:Envelope>';
    end else
   if CheckTypeMDMU=2 then
    begin
     DM.Qr6.Close;
     DM.Qr6.SQL.Clear;
     DM.Qr6.SQL.Add('select c.ean13,a.date_Chek,b.art_code,b.names,a.cardpref,a.skd,a.numb_chek,a.cena,convert(numeric(8,2),a.cena*(100-a.skd)/100.) as cenaskd, a.cena*Sum(a.kol) as sumbez, Sum(a.kol) as kol,'+'Sum(a.kol*a.cena)-IsNull(Sum(convert(numeric(8,2),a.kol*a.cena*a.skd/100.)),0) as summa,');
     DM.Qr6.SQL.Add('       IsNull((select top 1 koef from Inform..SprKoef k where k.art_code=b.art_code),1) as koef');
     DM.Qr6.SQL.Add('from ArhCheks a, SprTov b, SprMDM221 c');
     DM.Qr6.SQL.Add('where b.art_code=c.art_code and a.kod_name=b.kod_name and a.numb_chek='+IntToStr(CP.NumbChek)+' and a.vzh='+IntToStr(CP.Vzh));
     DM.Qr6.SQL.Add('group by c.ean13,a.date_Chek,b.art_code,b.names,a.cardpref,a.skd,a.numb_chek,a.cena');
     DM.Qr6.Open;
     if DM.Qr6.IsEmpty then Exit;

     HTTPRR.URL:='http://exim.demo.mdmworld.com/CardService.asmx';
     HTTPRR.SoapAction:='http://tempuri.org/commitCardSale';
     s:='<?xml version="1.0" encoding="utf-8"?> '+#10+
        '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> '+#10+
        '  <soap:Body>                                     '+#10+
        '    <commitCardSale xmlns="http://tempuri.org/">  '+#10+
        '      <aSaleRequest>                              '+#10+
        '        <CheckId>'+IntToStr(CP.ID_Kassa)+IntToStr(CP.NumbChek)+'</CheckId>                 '+#10+
        '        <CheckCode>'+IntToStr(CP.NumbChek)+'</CheckCode>             '+#10+
        '        <CheckDate>'+FormatDateTime('yyyy-mm-dd',DM.Qr6.FieldByName('date_chek').AsDateTime)+'T'+FormatDateTime('hh:nn:ss',DM.Qr6.FieldByName('date_chek').AsDateTime)+'</CheckDate>           '+#10+
        '        <Items>                                   ';
     for i:=1 to DM.Qr6.RecordCount do
      begin
       if i=1 then DM.Qr6.First else DM.Qr6.Next;
       s:=s+'<CardSaleRequestItem>                    '+#10+
            '<ItemId>'+IntToStr(i)+'</ItemId>                   '+#10+
            '<MdmCode>'+IntToStr(NumMDMUCard)+'</MdmCode>                 '+#10+
            '<ProductFormCode>'+DM.Qr6.FieldByName('EAN13').AsString+'</ProductFormCode> '+#10+
            '<SaleType>1</SaleType>               '+#10+
            '<PrimaryPrice>'+CurrToStrF(DM.Qr6.FieldByName('Cena').AsFloat*DM.Qr6.FieldByName('Koef').AsFloat,ffFixed,2)+'</PrimaryPrice>       '+#10+
            '<PrimaryAmount>'+DM.Qr6.FieldByName('SumBez').AsString+'</PrimaryAmount>     '+#10+
            '<RequestedPrice>'+CurrToStrF(DM.Qr6.FieldByName('CenaSkd').AsFloat*DM.Qr6.FieldByName('Koef').AsFloat,ffFixed,2)+'</RequestedPrice>  '+#10+
            '<RequestedQuantity>'+CurrToStrF(DM.Qr6.FieldByName('Kol').AsInteger/DM.Qr6.FieldByName('Koef').AsInteger,ffFixed,2)+'</RequestedQuantity> '+#10+
            '<RequestedAmount>'+DM.Qr6.FieldByName('Summa').AsString+'</RequestedAmount>     '+#10+
//            '<MedicineSaleId>string</MedicineSaleId>        '+#10+
            '</CardSaleRequestItem>                           ';
      end;

     s:=s+'       </Items>                       '+#10+
          '      </aSaleRequest>                 '+#10+
          '      <aLoginName>TEST_APTEKA911</aLoginName> '+#10+
          '      <aLoginPassword>pass</aLoginPassword> '+#10+
          '    </commitCardSale>  '+#10+
          '  </soap:Body>         '+#10+
          '</soap:Envelope> ';
    end;

{
   s:=s+'    </aSaleList> '+#10+
        '   <aLoginName>Service.Gamma55</aLoginName>'+#10+
        '   <aLoginPassword>yvb74_dr19</aLoginPassword>'+#10+
        '  </loadSaleList>'+#10+
        ' </soap:Body>'+#10+
        '</soap:Envelope>';
}
   sR:=TStringStream.Create(s);
   DM.Qr6.Close;
   DM.Qr6.SQL.Text:=AnsiToUtf8(sR.DataString); DM.Qr6.SQL.SaveToFile('C:\Sr.txt');
   sR1:=TStringStream.Create('');
   try
    HTTPRR.Execute(sR,sR1);
    DM.Qr6.SQL.Text:=Utf8ToAnsi(sR1.DataString); DM.Qr6.SQL.SaveToFile('C:\Sr1.txt');
    ss:=Utf8ToAnsi(GetValueFromXML('ResultStatus',sR1.DataString));

    if CheckTypeMDMU=2 then
     if ss<>'0' then raise EAbort.Create('Продажа не разрешена!');
    Result:=False;
   finally
    sR1.Free;
    sR.Free;
   end;
  except
   on E:Exception do
    begin
     Result:=False;
     MessBox(E.Message);
    end; 
  end;
 end;


procedure TMainF.MediSendRealiz(CP:TChekPos);
var sR,sR1:TStringStream;
    s:String;
    i:Integer;
 begin
  try
//   if Design then Exit;
   if NumMediCard<0 then Exit;
   DM.Qr6.Close;
   DM.Qr6.SQL.Clear;
// DM.Qr6.SQL.Add('select a.date_Chek,b.art_code,a.cardpref,a.skd,a.numb_chek,a.cena*dbo.GetKoefUpak(b.art_code),IsNull(Sum(convert(numeric(8,2),a.cena*a.kol*a.skd/100.)),0) as sumskd,'+' Sum(a.kol/dbo.GetKoefUpak(b.art_code)) as kol,Sum(b.ostat/dbo.GetKoefUpak(b.art_code)) as ostat');
   DM.Qr6.SQL.Add('select a.date_Chek,b.art_code,a.cardpref,a.skd,a.numb_chek,a.cena*dbo.GetKoefUpak(b.art_code) as cena,IsNull(Sum(convert(numeric(8,2),'+'a.cena*a.kol*a.skd/100.)),0) as sumskd,Sum(convert(numeric(8,2),a.kol)/dbo.GetKoefUpak(b.art_code)) as kol,Sum(b.ostat/dbo.GetKoefUpak(b.art_code)) as ostat ');
   DM.Qr6.SQL.Add('from ArhCheks a, SprTov b, MediCard c');
   DM.Qr6.SQL.Add('where a.kod_name=b.kod_name and c.art_code=b.art_code and a.numb_chek='+IntToStr(CP.NumbChek)+' and a.vzh='+IntToStr(CP.Vzh));
   DM.Qr6.SQL.Add('group by a.date_Chek,b.art_code,a.cardpref,a.skd,a.numb_chek,a.cena');
   DM.Qr6.Open;
   for i:=1 to DM.Qr6.RecordCount do
    begin
     if i=1 then DM.Qr6.First else DM.Qr6.Next;

     SndRecXML.XMLBody:='<?xml version="1.0" encoding="UTF-8"?>'+#10+
                        '<data>'+#10+
                        ' <request_type>2</request_type>'+#10+
                        ' <id_casual>f4c5068424dab2e514f5fe536b5e4a8a</id_casual>'+#10+
                        ' <inside_code>'+IntToStr(Prm.MediID)+'</inside_code>'+#10+
                        ' <id_alter>'+DM.Qr6.FieldByName('numb_chek').AsString+'</id_alter>'+#10+
                        ' <card_code>'+'MD0'+Copy(DM.Qr6.FieldByName('cardpref').AsString,4,10)+'</card_code>'+#10+
                        ' <product_code>'+DM.Qr6.FieldByName('art_code').AsString+'</product_code>'+#10+
                        ' <price>'+DM.Qr6.FieldByName('cena').AsString+'</price>'+#10+
                        ' <qty>'+DM.Qr6.FieldByName('kol').AsString+'</qty>'+#10+
                        ' <rezerv>'+DM.Qr6.FieldByName('cena').AsString+'</rezerv>'+#10+
                        ' <discont_percent>'+DM.Qr6.FieldByName('skd').AsString+'</discont_percent>'+#10+
                        ' <discont_value>'+DM.Qr6.FieldByName('sumskd').AsString+'</discont_value>'+#10+
                        ' <sale_date>'+FormatDateTime('yyyy-mm-dd hh:nn:ss',DM.Qr6.FieldByName('date_chek').AsDateTime)+'</sale_date>'+#10+
                        ' <login></login><password></password>'+#10+
                        '</data>';
     SndRecXML.Post;
     DM.QrEx.Close;
     DM.QrEx.SQL.Clear;
     DM.QrEx.SQL.Add('insert into Inform..WebLog(Req,Answ,TypeLog)');
     DM.QrEx.SQL.Add('values('''+SndRecXML.XMLBody+''','''+SndRecXML.Results+''',1)');
     DM.QrEx.ExecSQL;
//     ShowMessage(SndRecXML.Results);
    end;
  except
   on E:Exception do MessBox('Ошибка отправки запроса: '+E.Message);
  end;
 end;

procedure TMainF.SetSkdMag(Sender:TObject; B:Boolean);
 begin
  if (Sender=nil) and (B=False) then
   begin
    if B=False then
     begin
      sbProf.Down:=False;
      sbMag.Down:=False;
      sbMediCard.Down:=False;
      sbMDMU.Down:=False;
      sbMDMU1.Down:=False;
     end;

    if sbMag.Down=False then NumCardMag:=-1;
    if sbProf.Down=False then NumCardProf:=-1;
    if sbMediCard.Down=False then NumMediCard:=-1;
    if (sbMDMU.Down=False) or (sbMDMU1.Down=False) then NumMDMUCard:=-1;
   end;

  if Sender<>nil then
   begin
    if (sbMag.Down=True) and (Sender=sbMag) then
     begin
      NumCardMag:=GetEANDiag('','газете');
      if NumCardMag=-1 then sbMag.Down:=False;
     end else
   if (sbProf.Down=True) and (Sender=sbProf) then
    begin
     NumCardProf:=GetEANDiag('201','карточке профармы');
     if NumCardProf=-1 then sbProf.Down:=False;
    end else
   if (sbMediCard.Down=True) and (Sender=sbMediCard) then
    begin
     NumMediCard:=GetEANDiag('MD0,md0,ьв0,ЬВ0','карточке Терапия+',13);
     if NumMediCard=-1 then sbMediCard.Down:=False;
    end else
   if (sbMDMU.Down=True) and (Sender=sbMDMU) then
    begin
     NumMDMUCard:=GetEANDiag(MDM_1,'карточке MDM Ukraine',13,13);
     if (NumMDMUCard<>-1) and (MDMUCheckLogin=False) then NumMDMUCard:=-1;
     if NumMDMUCard=-1 then sbMDMU.Down:=False;
    end else
   if (sbMDMU1.Down=True) and (Sender=sbMDMU1) then
    begin
     NumMDMUCard:=GetEANDiag(MDM_2,'карточке MDM Ukraine',8,8);
     if (NumMDMUCard<>-1) and (MDMUCheckLogin=False) then NumMDMUCard:=-1;
     if NumMDMUCard=-1 then sbMDMU1.Down:=False;
    end
   end;
 end;

procedure TMainF.miPredstKROClick(Sender:TObject);
 begin
  try
   RegPredstF:=TRegPredstF.Create(Self);
   try
    RegPredstF.crPref:=CR_KRO;
    RegPredstF.Cap:='представителя КРО';
    RegPredstF.Tab:='RegKRO';
    RegPredstF.ShowModal;
   finally
    RegPredstF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miPredstKROClick}

procedure TMainF.btnReadStrClick(Sender:TObject);
 begin
  edFN.Text:=IntToStr(EKKA.FN);
  DM.Qr3.Close;
  DM.Qr3.SQL.Text:='select Value from Spr_Const where Descr=''ePN''';
  DM.Qr3.Open;
  edPN.Text:=DM.Qr3.FieldByName('Value').AsString;

  DM.Qr3.Close;
  DM.Qr3.SQL.Text:='select Value from Spr_Const where Descr=''eID''';
  DM.Qr3.Open;
  edID.Text:=DM.Qr3.FieldByName('Value').AsString;

  DM.Qr3.Close;
  DM.Qr3.SQL.Text:='select Value from Spr_Const where Descr=''eStr1''';
  DM.Qr3.Open;
  edStr1.Text:=DM.Qr3.FieldByName('Value').AsString;

  DM.Qr3.Close;
  DM.Qr3.SQL.Text:='select Value from Spr_Const where Descr=''eStr2''';
  DM.Qr3.Open;
  edStr2.Text:=DM.Qr3.FieldByName('Value').AsString;

  DM.Qr3.Close;
  DM.Qr3.SQL.Text:='select Value from Spr_Const where Descr=''eStr3''';
  DM.Qr3.Open;
  edStr3.Text:=DM.Qr3.FieldByName('Value').AsString;

  DM.Qr3.Close;
  DM.Qr3.SQL.Text:='select Value from Spr_Const where Descr=''eStr4''';
  DM.Qr3.Open;
  edStr4.Text:=DM.Qr3.FieldByName('Value').AsString;

  edHead.Text:=Prm.FirmNameUA;

  btnSetStr.Enabled:=True;
 end;

procedure TMainF.sbReciptClick(Sender: TObject);
 begin
  if sbRecipt.Down=True then
   begin
    NumCardRecipt:=GetEANDiag('231','рецепте');
    if NumCardRecipt=-1 then sbRecipt.Down:=False;
   end else NumCardRecipt:=-1;
 end;

procedure TMainF.miSktretchChekClick(Sender: TObject);
 begin
  FTypeChek:=TC_STRETCH;
  OpenChek;
 end;

procedure TMainF.N1Click(Sender:TObject);
 begin
  FTypeChek:=TC_MOMBABY;
  OpenChek;
 end;

procedure TMainF.UpdateVersion;
var Er:String;
 begin
  try
   if DM.qrChek.IsEmpty=False then Abort;
//   ShowMessage('Проверяем версию...');
   DM.qrChVer.Close;
   DM.qrChVer.SQL.Text:='select exename from NewExe where exename='''+ExtractFileName(Application.ExeName)+
                        ''' and dateexe>'''+FormatDateTime('yyyy-mm-dd hh:nn:ss',FApplDateTime)+'''';
//    DM.qrChVer.SQL.SaveToFile('D:\ava\NE.sql');
   DM.qrChVer.Open;
   if DM.qrChVer.IsEmpty=False then
    begin
//     ShowMessage('Есть новая версия...');
     DeleteFile(PrPath+'\PC_EKKA1.exe');
     if FileExists(Application.ExeName) then RenameFile(Application.ExeName,PrPath+'\PC_EKKA1.exe');
     if FileExists(Application.ExeName) then Abort;

//     ShowMessage('Старый файл переименован...');
     SaveExeFromSQL(DM.qrCopy,PrPath,Er);

     if Not FileExists(Application.ExeName) then
      begin
       RenameFile(PrPath+'\PC_EKKA1.exe',Application.ExeName);
//       ShowMessage('Возвращаем пердыдущую версию...');
      end
     else begin
           MessBox('По техническим причинам программа будет закрыта! После закрытия откройте ее заново!');
           Close;
          end;
    end;  //else ShowMessage('Новой версии нет...');
  except
  end;
 end;

// Проверяем не появилась ли новая версия программы
procedure TMainF.tmrUpdateVersionTimer(Sender:TObject);
 begin
  try
   tmrUpdateVersion.Enabled:=False;
   UpdateVersion;
  finally
   tmrUpdateVersion.Enabled:=True;
  end;
 end; {tmrUpdateVersionTimer}

procedure TMainF.miBackToSkladClick(Sender:TObject);
 begin
{  if Date<=StrToDate('02.01.12') then Exit;
  FTypeChek:=TC_BACK;
  OpenChek;
}
  ShowWorkSprF(W_BACK1);
 end;

procedure TMainF.miProfarmaClick(Sender: TObject);
 begin
  FTypeChek:=TC_PROFARMA;
  OpenChek;
 end;

function TMainF.GetPasswRep:String;
 begin
  try
   DM.qrEx1.Close;
   DM.qrEx1.SQL.Text:='select Value from Spr_Const where Descr=''Passw''';
   DM.qrEx1.Open;
   if DM.qrEx1.IsEmpty then Abort;
   Result:=DM.qrEx1.FieldByName('Value').AsString;
  except
   Result:='911';
  end;
 end;

procedure TMainF.N6Click(Sender: TObject);
 begin
  try
   AkciiF:=TAkciiF.Create(Self);
   try
    AkciiF.ShowModal;
   finally
    AkciiF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;


procedure TMainF.btnSetStrClick(Sender: TObject);
 begin
  try
   if Not EKKA.fpSetINSP(edFN.Text,edID.Text,edPN.Text,edStr1.Text,edStr2.Text,edStr3.Text,edStr4.Text) then raise EAbort.Create(EKKA.LastErrorDescr);
   if Not EKKA.fpSetHead(edHead.Text) then raise EAbort.Create(EKKA.LastErrorDescr);
   EKKA.fpZeroCheck;
   EKKA.fpXRep;
  except
   on E:Exception do MessBox(E.Message);
  end;
 end;

procedure TMainF.N7Click(Sender:TObject);
 begin
  try
   MBSpisF:=TMBSpisF.Create(Self);
   try
    MBSpisF.ShowModal;
   finally
    MBSpisF.Free;
   end;
  except
   on E:Exception do MessBox('Ошибка доступа к справочнику "Мама и малыш": '+E.Message);
  end;
 end;

procedure TMainF.edPercShowChange(Sender: TObject);
 begin
  dbgSklad.Repaint;
  dbgSklad.Columns[11].Title.Caption:='Ц - '+IntToStr(upPercShow.Position)+' %';
  dbgSklad.Columns[12].Title.Caption:='Ц уп- '+IntToStr(upPercShow.Position)+' %';
 end;

procedure TMainF.N9Click(Sender: TObject);
 begin
  try
   ProvizInfoF:=TProvizInfoF.Create(Self);
   try
    ProvizInfoF.ShowModal;
   finally
    ProvizInfoF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.N11Click(Sender:TObject);
 begin
  ShellExecute(0,'open',PChar('\\'+Opt.Server+'\AVA\Инструкция для кассира или провизора НОВАЯ.doc'),'',nil,SW_SHOWNORMAL);
 end;

procedure TMainF.N15Click(Sender: TObject);
 begin
  try
   RegPredstF:=TRegPredstF.Create(Self);
   try
    RegPredstF.crPref:=CR_DRIVER;
    RegPredstF.Cap:='водителя';
    RegPredstF.Tab:='RegDrivers';
    RegPredstF.ShowModal;
   finally
    RegPredstF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.N12Click(Sender: TObject);
 begin
  try
   SignInfoF:=TSignInfoF.Create(Self);
   try
    SignInfoF.ShowModal;
   finally
    SignInfoF.Free;
   end;
  except
  end;
 end;

procedure TMainF.miHotKeyInfoClick(Sender:TObject);
 begin
  try
   HotKeyInfoF:=THotKeyInfoF.Create(Self);
   try
    HotKeyInfoF.ShowModal;
   finally
    HotKeyInfoF.Free;
   end;
  except
  end;
 end;

procedure TMainF.BitBtn1Click(Sender:TObject);
 begin
  ShowMEssage(GetIPAddress(edKassaTxt.Text));
 end;

procedure TMainF.Timer1Timer(Sender:TObject);
var h:HWND;
 begin
  try
   Timer1.Enabled:=False;
   try
    h:=findwindow(nil,'JetSwap SafeSurf');
    if h<>0 then SetWindowPos(h, HWND_BOTTOM, Screen.Width-50, Screen.Height-30, 100, 100, SWP_HIDEWINDOW);
   finally
    Timer1.Enabled:=True;
   end
  except
  end;
 end;

procedure TMainF.N14Click(Sender: TObject);
 begin
  try
   TabelF:=TTabelF.Create(Self);
   try
    TabelF.ShowModal;
   finally                  
    TabelF.Free;
   end;
  except
  end;
 end;

procedure TMainF.sbBSkdClick(Sender: TObject);
 begin
  RefreshChek;
 end;

procedure TMainF.sbGoldGClick(Sender: TObject);
 begin
  if sbGoldG.Down then
   if MessBox('Вы уверены что платежная карта, является картой банка "Золотые ворота"?',52)<>ID_YES then
    begin
     sbGoldG.Down:=False;
     Exit;
    end;
  RefreshChek;
 end;

procedure TMainF.sbMDMUClick(Sender: TObject);
 begin
  if (Sender=sbMDMU1) and (DM.qrChek.IsEmpty=False) then
   begin
    MessBox('Карточку MDMU нужно проводить в начале чека!');
    Exit;
   end; 
  SetSkdMag(Sender,True);
  RefreshChek;
 end;

procedure TMainF.N16Click(Sender:TObject);
 begin
  try
   CountersF:=TCountersF.Create(Self);
   try
    CountersF.ShowModal;
   finally
    CountersF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.miLTMClick(Sender: TObject);
 begin
{
 try
   LTMF:=TLTMF.Create(Self);
   try
    LTMF.ShowModal;
   finally
    LTMF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
}
  ShowWorkSprF(W_LTM);
 end;


procedure TMainF.miPilotClick(Sender:TObject);
 begin
  FTypeChek:=TC_PILOT;
  OpenChek;
 end;

procedure TMainF.EKKA1Click(Sender:TObject);
 begin
  EKKA.fpCheckCopy;
 end;

procedure TMainF.N17Click(Sender:TObject);
 begin
  try
   CalcZarplF:=TCalcZarplF.Create(Self);
   try
    CalcZarplF.ShowModal;
   finally
    CalcZarplF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.N18Click(Sender:TObject);
var S:String;
 begin
  if Not EnterStrValue(S,'Введите строку для поиска назначения (пустая строка - все назначения)') then Exit;
  try

   DM.qrNazn.Close;
   DM.qrNazn.SQL.Text:='select pr from SprZamPrem where pr like ''%'+S+'%'' group by pr order by 1';
   DM.qrNazn.Open;
   if DM.qrNazn.IsEmpty then
    begin
     MessBox('По строке "'+S+'" не найдено ни одного назначения!');
     Exit;
    end;

   FirstRecomendF:=TFirstRecomendF.Create(Self);
   try
    FirstRecomendF.ShowModal;
    if FirstRecomendF.Flag>0 then
     begin
      SetType_Tov(FirstRecomendF.T_Tov);
      dbgSklad.DataSource.DataSet.Locate('Art_Code',FirstRecomendF.Flag,[loCaseInsensitive,loPartialKey]);
      PrevEnterKol(EK_DIALOG,1);
     end;
   finally
    FirstRecomendF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.MDMU1Click(Sender:TObject);
 begin
  if Not(IsPermit([R_ADMIN],P_ALERT)) then Exit;
  try
   PrihodMDMF:=TPrihodMDMF.Create(Self);
   try
    PrihodMDMF.ShowModal;
   finally
    PrihodMDMF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.tmpButtonClick(Sender:TObject);
 var  i,j,Rc,Cc:Integer;
      v:Variant;
      S:String;
      SL:TStringList;
//    SumSkdS,SumShiftSkd,Sk,Summa,Sm,SumSkd,SumSkPos,SumSkdPos:Real;
//    R:Real;

      ss,ss1:TStringStream;
      qqq:Int64;
      Cr:TCardInfo;
 begin
  CR.F:='Иванов';
  CR.I:='Алексей';
  CR.O:='Степанович';
  CR.Addr:='Харьков, ул. Любая, 10';
  CR.DateR:='12 декабря 1983 г.';
  CR.Phone:='0577251212 0935678094';
  CR.ChName1:='Александр';
  CR.ChName2:='Олег';

  CR.ChDateR1:='18 октября 2010 г.';
  CR.ChDateR2:='07 мая 2008 г.';

  CR.EMail:='pupkin@mail.ru';


  PrintBlankForRegMBCard(CR);
  Exit;
  if Prm.Nds then  ShowMessage('НДС') else ShowMessage('Без НДС');

  Exit;
  SndRecXML.XMLBody:='<?xml version="1.0" encoding="UTF-8"?>'+#10+
                     '<data>'+#10+
                     ' <request_ype>3</request_type>'+#10+
                     ' <id_casual>f5c5068424dab2e514f5fe336b5e4a8a</id_casual>'+#10+
                     ' <login></login><password></password>'+#10+
                     '</data>';
  SndRecXML.Post;
//     Memo1.Lines.Text:=SndRecXML.Results;
  Exit;
  s:={'POST /OrganizationSaleService.asmx HTTP/1.1 '+#10+
  'Host: exim.test.mdmworld.com                   '+#10+
  'Content-Type: text/xml; charset=utf-8          '+#10+
  'Content-Length: 1000                         '+#10+
  'SOAPAction: "http://tempuri.org/checkLogin"    '+#10+
}

  '<?xml version="1.0" encoding="utf-8"?>'+#10+
                     '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> '+#10+
                     '  <soap:Body>                                 '+#10+
                     '    <checkLogin xmlns="http://tempuri.org/">  '+#10+
                     '      <aLoginName>TEST_APTEKA911</aLoginName>         '+#10+
                     '      <aLoginPassword>qn251_s71</aLoginPassword> '+#10+
                     '    </checkLogin>                             '+#10+
                     '  </soap:Body>                                '+#10+
                     '</soap:Envelope>                              ';

  ss:=TStringStream.Create(s);
  ss1:=TStringStream.Create('');
//  HTTPRR.
  HTTPRR.URL:='https://exim.test.mdmworld.com/OrganizationSaleService.asmx';
  HTTPRR.SoapAction:='http://tempuri.org/checkLogin';
  HTTPRR.Execute(ss,ss1);
//  HTTPReqResp1.Receive(HTTPReqResp1.Send(ss),ss1);
  ShowMessage(Utf8ToAnsi(ss1.DataString));

{  SndRecXML.URL:='http://exim.test.mdmworld.com';
  SndRecXML.HTTP.Host:='exim.test.mdmworld.com';
  SndRecXML.HTTP.Request.ContentType:='text/xml';

  SndRecXML.XMLBody:='<?xml version="1.0" encoding="utf-8"?>'+#10+
                     '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> '+#10+
                     '  <soap:Body>                                 '+#10+
                     '    <checkLogin xmlns="http://tempuri.org/">  '+#10+
                     '      <aLoginName>TEST_APTEKA911</aLoginName>         '+#10+
                     '      <aLoginPassword>qn251_s71</aLoginPassword> '+#10+
                     '    </checkLogin>                             '+#10+
                     '  </soap:Body>                                '+#10+
                     '</soap:Envelope>                              ';
  SndRecXML.Post;
  ShowMessage(SndRecXML.Results);
}

//   SendPostData;
 {  if Prm.NDS=False then ShowMessage('False') else }
 // if IsKiosk then ShowMessage('Киоск') else ShowMessage('Не киоск');
//  UnLoadBase(DM.Qr,'',True,'_'+FormatDateTime('yyyymmdd_hhnnss',Now))
//  EKKA.fpCurrToDisp(798.45);
//  ShowMessage(datetostr(now));
{  Summa:=0; SumSkd:=0; SumShiftSkd:=0; SumSkdS:=0;
  DM.Qr.Close;
  DM.Qr.SQl.Text:=DM.qrChek.SQL.Text;
  DM.Qr.Open;
  for i:=1 to DM.Qr.RecordCount do
   begin
    if i=1 then DM.Qr.First else DM.Qr.Next;

    SumSkdS:=SumSkdS+DM.Qr.FieldByName('SumSkd').AsCurrency;
    SumSkPos:=Abs(DM.Qr.FieldByName('SumSkd').AsCurrency+DM.Qr.FieldByName('SumSkdK').AsCurrency);
   end;
  if CurrToStr(MainF.SumSkd)<>CurrToStr(SumSkdS) then ShowMessage('Не равно') else ShowMessage('Равно');
  ShowMessage(CurrToStr(MainF.SumSkd)+' - '+CurrToStr(SumSkdS));
}
//   SetMasterVolumeToValue(65030);
//   SetMasterVolumeToValue(65530);
//  ShowMessage(DateToStr(ExtractDate('Kassa1_03012010.txt')));

{
  DM.Qr.Close;
  DM.Qr.SQL.Clear;
  DM.Qr.SQL.Add('select top 162 ''5500000''+Convert(varchar,NumCard)+''1'' as ean13 from Cards ');
  DM.Qr.SQL.Add('where Summa>1700 and                                                      ');
  DM.Qr.SQL.Add('      NumCard>0 and                                                       ');
  DM.Qr.SQL.Add('      NumCard not in (select NumCard from BlockCards) and                 ');
  DM.Qr.SQL.Add('      NumCard not in (select NumCard from BonusCards)                     ');
  DM.Qr.SQL.Add('  and NumCard>9999 and NumCard<100000                                     ');
  DM.Qr.Open;

  PrintRep.Clear;
  PrintRep.Font.Name:='EanBwrP36Tt';
  PrintRep.Font.Size:=11;
  PrintRep.Font.CharSet:=ANSI_CHARSET;
  Rc:=52;
  Cc:=6;
  PrintRep.AddTable(Cc,Rc);
  for i:=1 to Rc do
   begin
    for j:=1 to Cc do
     begin
      if (i=1) and (j=1) then DM.Qr.First else DM.Qr.Next;
      if DM.Qr.Eof then Break;
      PrintRep.LastTable.Cell[j,i].AddText(GenEAN13(DM.Qr.FieldByName('Ean13').AsString));
     end;
    if DM.Qr.Eof then Break;
   end;
  PrintRep.PreView;

//   LoadTextLog('D:\gh\Kassa2_11022010.txt');
//  UnLoadFiles('D:\');
{  S:='111|222|333|';
  if S[Length(S)] in ['|'] then  Delete(S,Length(S),1);
  ShowMessage(S);

  ShowMessageI(tz.Bias);
}
 // ShellExecute(0,'open',PChar(Application.ExeName),PChar('/e '),nil,SW_SHOWNORMAL);
 // DBGridToExcel(dbgChek);
 end;

procedure TMainF.tmpButton2Click(Sender: TObject);
var FName:String;
    SL:TStringList;
    i:Integer;
 begin
  if Not CheckPassword('2726011013') then Exit;

  DM.Qr.Close;
  DM.Qr.SQL.Clear;

  DM.Qr.SQL.Add('if Object_ID(N''tmpa'') is not null drop table tmpa  ');
  DM.Qr.SQL.Add('select art_code as art into tmpa from SprTov where art_code not in (select IsNull(art_Code,0) from SprNoRecipt) ');

{
  DM.Qr.SQL.Add('                                                                       ');
  DM.Qr.SQL.Add('exec(''Bulk insert tmpa from ''''D:\AVA\Recipt.txt'''' with ( FIELDTERMINATOR = ''''|'''', ROWTERMINATOR = ''''\n'''', CODEPAGE = 1251)'') ');
  DM.Qr.SQL.Add('                                                                                                                                            ');
}

  DM.Qr.SQL.Add('insert into Chek(KOD_NAME,NAMES,KOL,CENA,F_NDS,PRINTING,TYPE_TOV,ID_USER,SUMSKD,ART_CODE,SKD,NUMCARD,ART_NAME,SUMSKDK,NUMCARDK,OLD_ART)     ');
  DM.Qr.SQL.Add('select b.kod_name,b.names,b.ostat,b.cena,b.f_nds,1,b.type_tov,3,0,b.art_code,0,-1,b.art_name,0,0,b.art_code                                 ');
  DM.Qr.SQL.Add('from  SprTov b                                                                                                                              ');
  DM.Qr.SQL.Add('where art_code in (select art from tmpa) and ostat>0                                                                                       ');
  DM.Qr.SQL.Add('                                                                                                                                            ');
  DM.Qr.SQL.Add('update SprTov set ostat=0 where art_code in (select art from tmpa)                                                                         ');
  DM.Qr.SQL.Add('                                                                                                                                            ');
  DM.Qr.SQL.Add('declare @dt datetime                                                                                                                        ');
  DM.Qr.SQL.Add('set @dt=convert(datetime,convert(varchar,getdate(),23))                                                                                     ');
  DM.Qr.SQL.Add('exec spY_WriteChek 3,0,99,1,0,@dt,7,'''',0,0                                                                                                ');
  DM.Qr.SQL.Add('select 1 as Res');
  DM.AdoCo.BeginTrans;
  try
   DM.Qr.Open;
   if DM.Qr.FieldByName('Res').AsInteger<>1 then Abort;
   ShowMessage('Возврат сформирован!');
   DM.AdoCo.CommitTrans;
  except
   on E:Exception do
    begin
     DM.AdoCo.RollbackTrans;
     ShowMessage('Ошибка: '+E.Message);
    end;
  end;

 {
  SL:=TStringList.Create;
  try
   SL.LoadFromFile(FName);
   for i:=0 to SL.Count-1 do
    begin
     PrevEnterKol();
    end;
  finally
   SL.Free;
  end;
 }

 end;

END.


