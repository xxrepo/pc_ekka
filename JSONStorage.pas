unit JSONStorage;

interface

uses
  Classes,
  SysUtils,
  AppCustomStorage,
  AbstractStorage,
  iFOBSWrapper,
  Contnrs;

const
  DEBUG_PARAM_NAME = 'DEBUG';

  SAVE_DOC_PATH = 'Export\Document';
  SAVE_ACC_BAL_PATH = 'Export\AccountBalance';
  IMPORT_DOC_PATH = 'Import';

const // попытка подбора пароля к секретному ключу
  LOCKMINUTESAPP: Word = 60; // интервал блокировки пользователя
  QUANTITY_OF_ATTEMPTS = 3;    // кол-во попыток после чего устанавливается блокировка

type
  TNewDocState = (ndsInput, ndsDiferred);
  EIniFileError = class(Exception);

  {настройки для валютных документов}
  TFXDocSettings = class(TCustomNotifyProp)
  private
    FFXSellMFO: string;
    FFXSellAccNo: string;
    FFXSellOKPO: string;
    FFXSellName: string;

    FPFMFO: string;
    FPFAccountNo: string;
    FPFOKPO: string;
    FPFName: string;
    FPFRegNo: string;

    FFeePercentConv: Double;
    FFeePercentBuy: Double;
    FFeePercentSell: Double;

    FFXConvFeeAccountNo: string;
    FFXBuyFeeAccountNo: string;
    FFXSellFeeAccountNo: string;

    FFXSwiftUrgentType: Integer;

    procedure SetFXSellMFO(const Value: string);
    procedure SetFXSellAccNo(const Value: string);
    procedure SetFXSellOKPO(const Value: string);
    procedure SetFXSellName(const Value: string);
    procedure SetPFMFO(const Value: string);
    procedure SetPFAccountNo(const Value: string);
    procedure SetPFOKPO(const Value: string);
    procedure SetPFName(const Value: string);
    procedure SetPFRegNo(const Value: string);
    procedure SetFeePercentConv(const Value: Double);
    procedure SetFeePercentBuy(const Value: Double);
    procedure SetFeePercentSell(const Value: Double);
    procedure SetFXConvFeeAccountNo(const Value: string);
    procedure SetFXBuyFeeAccountNo(const Value: string);
    procedure SetFXSellFeeAccountNo(const Value: string);
    procedure SetFXSwiftUrgentType(const Value: Integer);

  published
    property FXSellMFO: string read FFXSellMFO write SetFXSellMFO;
    property FXSellAccNo: string read FFXSellAccNo write SetFXSellAccNo;
    property FXSellOKPO: string read FFXSellOKPO write SetFXSellOKPO;
    property FXSellName: string read FFXSellName write SetFXSellName;

    property PFMFO: string read FPFMFO write SetPFMFO;
    property PFAccountNo: string read FPFAccountNo write SetPFAccountNo;
    property PFOKPO: string read FPFOKPO write SetPFOKPO;
    property PFName: string read FPFName write SetPFName;
    property PFRegNo: string read FPFRegNo write SetPFRegNo;

    property FeePercentConv: Double read FFeePercentConv write SetFeePercentConv;
    property FeePercentBuy: Double read FFeePercentBuy write SetFeePercentBuy;
    property FeePercentSell: Double read FFeePercentSell write SetFeePercentSell;

    property FXConvFeeAccountNo: string read FFXConvFeeAccountNo write SetFXConvFeeAccountNo;
    property FXBuyFeeAccountNo: string read FFXBuyFeeAccountNo write SetFXBuyFeeAccountNo;
    property FXSellFeeAccountNo: string read FFXSellFeeAccountNo write SetFXSellFeeAccountNo;

    property FXSwiftUrgentType: Integer read FFXSwiftUrgentType write SetFXSwiftUrgentType;
  end;

  TPrintSettings = class(TCustomNotifyProp)
  private
    FPrintOEMText: Boolean;
//    FPrint2DocPerSheet: Boolean;
    FDefaultCopies: Byte;
    FLeftMargin: Double;
    FTopMargin: Double;
    FBottomMargin: Double;
    FRightMargin: Double;
    FPageHeight: Double;
    FCanSaveAndOpenReports: Boolean;
    procedure SetDefaultCopies(const Value: Byte);
//    procedure SetPrint2DocPerSheet(const Value: Boolean);
    procedure SetPrintOEMText(const Value: Boolean);
    procedure SetBottomMargin(const Value: Double);
    procedure SetLeftMargin(const Value: Double);
    procedure SetRightMargin(const Value: Double);
    procedure SetTopMargin(const Value: Double);
    procedure SetPageHeight(const Value: Double);
    procedure SetCanSaveAndOpenReports(const Value: Boolean);
//    property Print2DocPerSheet: Boolean read FPrint2DocPerSheet write SetPrint2DocPerSheet; {deprecated}

  published
    property DefaultCopies: Byte read FDefaultCopies write SetDefaultCopies;
    property PrintOEMText: Boolean read FPrintOEMText write SetPrintOEMText;
    property LeftMargin: Double read FLeftMargin write SetLeftMargin;
    property RightMargin: Double read FRightMargin write SetRightMargin;
    property TopMargin: Double read FTopMargin write SetTopMargin;
    property BottomMargin: Double read FBottomMargin write SetBottomMargin;
    property PageHeight: Double read FPageHeight write SetPageHeight;
    property CanSaveAndOpenReports: Boolean read FCanSaveAndOpenReports write SetCanSaveAndOpenReports;
  end;

  TForecastDeffered = class(TCustomNotifyProp)
  private
    FNeedCalc: Boolean;
    procedure SetNeedCalc(const Value: Boolean);
  published
    property NeedCalc: Boolean read FNeedCalc write SetNeedCalc;
  end;

  THintType = class(TCustomNotifyProp)
  private
    FStandardHint: Boolean;
    FHintsOn: Boolean;
    procedure SetStandardHint(const Value: Boolean);
    procedure SetHintsOn(const Value: Boolean);
  published
    property StandardHint: Boolean read FStandardHint write SetStandardHint;
    property HintsOn: Boolean read FHintsOn write SetHintsOn;
  end;

  TStopEndCloseAppType = class(TCustomNotifyProp)
  private
    FTimeStop: Integer;
    procedure SetTimeStop(const Value: Integer);
  published
    property TimeStop: Integer read FTimeStop write SetTimeStop;
  end;

  TShowBalanceForecast = class(TCustomNotifyProp)
  private
    FStShowBalanceForecast: Boolean;
    FStShowBalanceForecastInpDoc: Boolean;
    //количество подписей для отображения прогноза
    FSigCountForBal: Integer;
    FShowBalanceAvailable: Boolean;
    procedure SetShowBalanceForecast(const Value: Boolean);
    procedure SetShowBalanceForecastInpDoc(const Value: Boolean);
    procedure SetSigCountForBal(const Value: Integer);
    procedure SetShowBalanceAvailable(const Value: Boolean);
  published
    property ShowBalanceForecast: Boolean read FStShowBalanceForecast write SetShowBalanceForecast;
    property ShowBalanceForecastInpDoc: Boolean read FStShowBalanceForecastInpDoc write SetShowBalanceForecastInpDoc;
    property SigCountForBal: Integer read FSigCountForBal write SetSigCountForBal;
    property ShowBalanceAvailable : Boolean read FShowBalanceAvailable write SetShowBalanceAvailable;
  end;

  TShowSummaryNotify = class(TCustomNotifyProp)
  private
    FStShowSummaryNotify: Boolean;
    procedure SetShowSummaryNotify(const Value: Boolean);
  published
    property ShowSummaryNotify: Boolean read FStShowSummaryNotify write SetShowSummaryNotify;
  end;

  TDebugModeOnEvent = class(TObject)
  end;

  TConnProfile = class;

  TConnProfiles = class(TCollection)
  private
    FOwner : TAbstractAppStorage;
    function GetItem(Index: Integer): TConnProfile;
    procedure SetItem(Index: Integer; const Value: TConnProfile);
    //FCurrProfileIndex : Integer;
  public
    function Add : TConnProfile;
    property Items[Index : Integer] : TConnProfile read GetItem write SetItem; default;
    constructor Create(aItemClass: TCollectionItemClass; aOwner : TAbstractAppStorage);
  end;

  TConnProfile = class(TCollectionItem)
  private
    FName : String;
    FHost : String;
    FPort : Word;
    procedure SetHost(const Value: String);
    procedure SetPort(const Value: Word);
    procedure SetName(const Value: String);
  protected
    procedure AssignTo(Dest: TPersistent); override;
  published
    property Name : String read FName write SetName;
    property Host : String read FHost write SetHost;
    property Port : Word read FPort write SetPort;
  public
    constructor Create(Collection : TCollection; const AName, aHost : String; const aPort : Word); reintroduce;
  end;


  { TGlobalStorage - сохраняет, записывает
   настройки общие для всего приложения и не
   конкретизированны под пользователя }
  TGlobalAppStorage = class(TCustomAppStorage)
  private
    FActiveLang: Integer;
    FIsDebug: Boolean;
    FDBPath: string;
    FMaxLogSize: Word;
    FLogArchivationType: TArchivationType;
    FLogKind: TLogKind;
    FShowSplash: Boolean;
    FMaxDataBlockSize: Word;
    FAutoSignDoc: Boolean;
    FSigCountNeedForSend: Word;
    FNewDocDefaultState: TNewDocState;
    FUseProxy: Boolean;
    FUseProxyAuth: Boolean;
    FProxyHost: string;
    FProxyUser: string;
    FProxyPort: Word;
    FProxyPassw: string;
    FMaxOutDataBlockSize: Word;
    FConnectIgnoreErrorsCount: Word;
    FLastSignedUserLogin: string;
    FPrinterParams: TPrintSettings;
    FUserFirstStart: Boolean;
    FInterruptTimeoutMin: Integer;
    FForecastDeffered: TForecastDeffered;
    FAutoSignOnlySignedDoc: Boolean;
    FCanInputCyrillicSWIFT: Boolean;
    FSendAllDocsToBank: Boolean;
    FDefDetailsOfPayment: string;
    FUseDefDetailsOfPaymentToClone: Boolean;
    FRelativeDocPath: string;
    FRelativeAccBalPath: string;
    FRelativeDocImportPath: string;
    FCrossNumbering: Boolean;
    FNumberingThroughOKPO: Boolean;
    FShowDeletedAndRejectedDocs: Boolean;
    FLinearExport: Boolean;
    FShowSyncDetails: Boolean;
    FLastSignAsKeyPath: string;
    FNatDocPlatCopies: Word;
    FCurrDayFiltering: Boolean;
    FAutoCorrectAccNo: Boolean;
    FAutoCorrectVAT: Boolean;
    FConnProfiles: TConnProfiles;
    FOldBalForecastEqualsSumma: Boolean;
    FShowSysDateAlert: Boolean;
    FHintType: THintType;
    FFXDocSettings: TFXDocSettings;
    FShowSummaryNotify: TShowSummaryNotify;
    FIgnoreClientDebetLimitChecks: Boolean;
    FLastMailBranchID: Integer;
    FShowDayAlert: Boolean;
    FMailDeliviryOnFullSync: Boolean;
    FBalForecastSetting: TShowBalanceForecast;
    FShowOnlyOpenAccounts: Boolean;
    FShowDialogsWhenSync: Boolean;
    FNextPackDate: TDateTime;
    FCheckPackDaysInterval: Integer;
    FImmediatePack: Boolean;
    FUseAutoImportFromDirectory: Boolean;
    FPackDBCounter: Integer;
    FFXSwiftOnePage: Boolean;
    FFXBuyOnePage: Boolean;
    FDBConnectRetryCount: Word;
    FSaveProfiles: TConnProfiles;
    FAutoBuildElAccRep: Boolean;
    FFxCommissionType: Boolean;
    FImportResultToExcel: Boolean;
    FLastChangePasswDB: TDateTime;
    FCheckChangePasswDBMonthInterval: integer;
    FFxSwiftParID37: Boolean;
    FNeedSyncSWBankCorr: Boolean;
    FMailAttachPath: string;
    FSalMobilePhoneRequired: Boolean;
    FSortPrintDocPaymOrder: Word;
    FAutoStopCloseApp: TStopEndCloseAppType;
    FAutoStopAndCloseApp: Integer;
    FLockAppTime: TDateTime;
    FLockAppAttemptNumber: Word;
    FSalColumnRequired: Boolean;
    FComplexPasswRulesLevel: Word;
    FMinPswLen: Word;
    FMaxPswLen: Word;
    FCountFailedLoginsBlock: Boolean;
    FCountFailedLogins: Boolean;
    FCountFailedLoginsQ: Word;
    FKeyExpPeriod: Word;
    FPswExpPeriod: Word;
    FCountCashePassw: Word;
    FSelectOnlyOpenAccounts: Boolean;
    FCertExpReg: Boolean;
    FShowPaymentPurposePFAdd: Boolean;
    FSalPhoneCode: Boolean;
    FDisableAppTimeFailedLogins: Word;
    FSalCustomEmpl: Boolean;
    FDocCRValueDateValidPeriod: Word;
    FDocCRValueDateValid_Cur: Word;
    FDocumentDatePeriod: Word;
    FDocumentDatePeriod_cur: Word;
    FShowWarnDayExpForSignAs: Boolean;
    FShowAccountStateBlockDebetAsOpen: Boolean;
    FReportShowDailySums: Boolean;
    FReportShowPeriodSums: Boolean;
    FShowBalanceFilial: Boolean;
    FDBChangeVersion: Boolean;
    FUserCertAfterPeriod: Integer;
    FIFOBSDisableStandartLogin: Boolean;
    FDaysBeforeTokenEnd: Integer;
    FPathImportTMS: String;
    FPathExportTMS: String;
    FPathRepositoryTMS: String;
    FIsRSAAdaptive: Boolean;
    FNationalCurrencyUse: Boolean;
    FOtpConfDoc: Integer;
    FIfobsMactokenCertificateUse: boolean;
    FOtptokenCbmessageEnabled: Boolean;
    FOtpConfirmationDocumentOnlySign: Boolean;
    FAutoPain002: Boolean;
    FAutoMT940: Boolean;
    FAutoMT942: Boolean;
    FAutoSyncAfterImportPain001: Boolean;
    FOtpConfirmationChunkShortSignData: Boolean;
    FDaysRelevanceEDSforMessages: Integer;
    FIfobsUserPasswordVerifyAnonymity: Boolean;
    FIfobsUserPasswordVerifySimple: Boolean;
    FCardActiveOperationsEnabled: Boolean;
    FAssociatedUAHContractEnabled: Boolean;
    FCardsProcessingUpcType: String;
    FIfobsTransferToCardCorp: Boolean;
    FSoftConfirmationEnabled: Boolean;
    FLockCashePrivateKey: Boolean;
    FCanViewPassword: Boolean;
    FOtptokenPdforderEnabled: Boolean;
    FExternal_Cert_Enabled: Boolean;
    FExternal_Cert_IIT_URL: string;
    FLastSignAsExtKeyPath: string;
    FCountFailedLoginsSysPass: Integer;
    FExternal_Cert_UAKey_URL: string;
    FBank_Cert_IIT_URL: string;
    FBankName: string;
    FBankNameDefault: string;
    FCertModeAlt: Integer;
    FIsExtKey: Boolean;
    FIsCipher: Boolean;
    FBankCSKName: String;
    FLastSignAsBankKeyPath: string;
    FIsPresentRight153: Boolean;
    FIsPhoneForConfirmKey: Boolean;
    FIsExtKeyCSK: Boolean;
    FIsExtKeyOTPEnabled: Boolean;
    FIsCipherDSTU: Boolean;
    FIsNewVersionDB: Boolean;
    procedure SetActiveLang(Value: Integer);
    procedure SetLogArchivationType(const Value: TArchivationType);
    procedure SetLogKind(const Value: TLogKind);
    procedure SetMaxLogSize(const Value: Word);
    procedure SetShowSplash(const Value: Boolean);
    procedure SetMaxDataBlockSize(const Value: Word);
    procedure SetAutoSignDoc(const Value: Boolean);
    procedure SetNewDocDefaultState(const Value: TNewDocState);
    procedure SetSigCountNeedForSend(const Value: Word);
    procedure SetProxyHost(const Value: string);
    procedure SetProxyUser(const Value: string);
    procedure SetUseProxy(const Value: Boolean);
    procedure SetUseProxyAuth(const Value: Boolean);
    procedure SetProxyPort(const Value: Word);
    procedure SetProxyPassw(const Value: string);
    function GetProxyPassw: string;
    procedure SetMaxOutDataBlockSize(const Value: Word);
    procedure SetConnectIgnoreErrorsCount(const Value: Word);
    procedure SetLastSignedUserLogin(const Value: string);
    procedure SetPrinterParams(const Value: TPrintSettings);
    procedure SetUserFirstStart(const Value: Boolean);
    procedure SetInterruptTimeoutMin(const Value: Integer);
    procedure SetForecastDeffered(const Value: TForecastDeffered);
    procedure SetAutoSignOnlySignedDoc(const Value: Boolean);
    procedure SetCanInputCyrillicSWIFT(const Value: Boolean);
    procedure SetSendAllDocsToBank(const Value: Boolean);
    procedure SetUseDefDetailsOfPaymentToClone(const Value: Boolean);
    procedure SetDefDetailsOfPayment(const Value: string);
    procedure SetDocPath(const Value: string);
    procedure SetAccBalPath(const Value: string);
    procedure SetDocImportPath(const Value: string);
    procedure SetCrossNumbering(const Value: Boolean);
    procedure SetNumberingThroughOKPO(const Value: Boolean);
    procedure SetShowDeletedAndRejectedDocs(const Value: Boolean);
    procedure SetLinearExport(const Value: Boolean);
    procedure SetShowSyncDetails(const Value: Boolean);
    function GetLogKind: TLogKind;
    procedure SetNatDocPlatCopies(const Value: Word);
    procedure SetCurrDayFiltering(const Value: Boolean);
    procedure SetAutoCorrectAccNo(const Value: Boolean);
    procedure SetAutoCorrectVAT(const Value: Boolean);
    procedure SetConnProfiles(const Value: TConnProfiles);
    procedure SetOldBalForecastEqualsSumma(const Value: Boolean);
    procedure SetShowSysDateAlert(const Value: Boolean);
    function GetHost: string;
    function GetPort: Word;
    function GetShowSplash: Boolean;
    procedure SetHintType(const Value: THintType);
    procedure SetFXDocSettings(const Value: TFXDocSettings);
    procedure SetShowSummaryNotify(const Value: TShowSummaryNotify);
    procedure SetIgnoreClientDebetLimitChecks(const Value: Boolean);
    procedure SetLastMailBranchID(const Value: Integer);
    procedure SetShowDayAlert(const Value: Boolean);
    procedure SetMailDeliviryOnFullSync(const Value: Boolean);
    procedure SetBalForecastSetting(const Value: TShowBalanceForecast);
    procedure SetShowOnlyOpenAccounts(const Value: Boolean);
    procedure SetShowDialogsWhenSync(const Value: Boolean);
    procedure SetNextPackDate(const Value: TDateTime);
    procedure SetCheckPackDaysInterval(const Value: Integer);
    procedure SetDBPath(const Value: string);
    function  GetDBPath: string;
    function  GetDBMultiUsers: boolean;

    function GetDocPath: string;
    function GetAccBalPath: string;
    function GetDocImportPath: string;
    procedure SetRelativeDocPath(const Value: string);
    procedure SetRelativeAccBalPath(const Value: string);
    procedure SetRelativeDocImportPath(const Value: string);
    procedure SetImmediatePack(const Value: Boolean);
    procedure SetUseAutoImportFromDirectory(const Value: Boolean);
    procedure SetPackDBCounter(const Value: Integer);
    procedure SetFXSwiftOnePage(const Value: Boolean);
    procedure SetFXBuyOnePage(const Value: Boolean);
    procedure SetDBConnectRetryCount(const Value: Word);
    procedure SetAutoBuildElAccRep(const Value: Boolean);
    procedure SetFxCommissionType(const Value: Boolean);
    procedure SetImportResultToExcel(const Value: Boolean);
    function GetIsFullImportResult: Boolean;
    procedure SetLastChangePasswDB(const Value: TDateTime);
    procedure SetSortPrintDocPaymOrder(const Value: Word);
    procedure SetAutoStopCloseApp(const Value: TStopEndCloseAppType);
    procedure SetAutoStopAndCloseApp(const Value: Integer);
    procedure SetLockAppTime(const Value: TDateTime);
    procedure SetLockAppAttemptNumber(const Value: Word);
    procedure SetComplexPasswRulesLevel(const Value: Word);
    procedure SetCountFailedLoginsQ(const Value: Word);
    procedure SetDisableAppTimeFailedLogins(const Value: Word);
    procedure SetDocCRValueDateValidPeriod(const Value: Word);
    function GetDocCRValueDateValidPeriod: Word;
    procedure SetDocCRValueDateValid_Cur(const Value: Word);
    function GetDocCRValueDateValid_Cur: Word;
    procedure SetIFOBSDisableStandartLogin(const Value: Boolean);
    procedure SetNationalCurrencyUse(const Value: Boolean);
    procedure SetIfobsMactokenCertificateUse(const Value: boolean);
    function GetBankName: string;
    function GetCertModeAlt: Integer;
    function GetIsExtKey: Boolean;
  public
    procedure Load; override;
    procedure InitAllDefault; override;
    procedure InitDebugMode;
    procedure CancelDebugMode;

    constructor Create(const AINISection: string; const AINIFileName: string = '');
    destructor Destroy; override;
    function GetAvgDocPackCount(const RecSize: Integer): Word;
    property DebugMode: Boolean read FIsDebug;
    procedure AddConnProfile(const AName, AHost: string; APort: Word; AIndex: Integer = MaxInt);
    property Host: string read GetHost;
    property Port: Word read GetPort;
    procedure SetNextPackDay(AImmediate: Boolean = False);

    { DocPath и AccBalPath - путь для экспорта документов и остатков }
    property DocPath: string read GetDocPath write SetDocPath;
    property AccBalPath: string read GetAccBalPath write SetAccBalPath;
    { DocImportPath - путь для импорта документов }
    property DocImportPath: string read GetDocImportPath write SetDocImportPath;
    property DBPathActual: string read GetDBPath;
    property DBMultiUsers: boolean read GetDBMultiUsers;

    { StartUpdate/EndUpdate/CancelUpdate - Lock для профилей соединения }
    procedure StartUpdate;
    procedure EndUpdate;
    procedure CancelUpdate;
    function MaxUnpackedBlockSize: Integer;
    // Если эта опция активна, то результаты импорта будут формироваться на основании всех строк для импорта
    property IsFullImportResult: Boolean read GetIsFullImportResult;
    function NeedChangePasswDB: boolean;
    procedure SetLastChangePasswDBS;
    function LockAppPasswFailedLogins:Boolean; // блокировка программы при попытке подбора пароля на секретный ключ
    property AutoStopCloseApp:TStopEndCloseAppType read FAutoStopCloseApp write SetAutoStopCloseApp;
    property LockAppAttemptNumber: Word read FLockAppAttemptNumber write SetLockAppAttemptNumber;
    property BankName: string read GetBankName write FBankName;
    property IsCipher: Boolean read FIsCipher write FIsCipher;
    property IsCipherDSTU: Boolean read FIsCipherDSTU write FIsCipherDSTU;
    property IsExtKey: Boolean read GetIsExtKey write FIsExtKey;
    property IsExtKeyCSK: Boolean read FIsExtKeyCSK write FIsExtKeyCSK;
    property BankCSKName: String read FBankCSKName write FBankCSKName;
    property CertModeAlt: Integer read GetCertModeAlt write FCertModeAlt;
    property IsPresentRight153: Boolean read FIsPresentRight153 write FIsPresentRight153;
    property IsPhoneForConfirmKey: Boolean read FIsPhoneForConfirmKey write FIsPhoneForConfirmKey;
    //настройка конфига external.cert.otp.enabled
    property IsExtKeyOTPEnabled: Boolean read FIsExtKeyOTPEnabled write FIsExtKeyOTPEnabled;
    //
    property IsNewVersionDB: Boolean read FIsNewVersionDB write FIsNewVersionDB;
  published
    property ActiveLang: Integer read FActiveLang write SetActiveLang;
    // работа с настройками банка
    property BankNameDefault: string read FBankNameDefault write FBankNameDefault;
    property LogKind: TLogKind read GetLogKind write SetLogKind;
    property DBPath: string read FDBPath write SetDBPath;
    property LogArchivationType: TArchivationType read FLogArchivationType write SetLogArchivationType;
    property MaxLogSize: Word read FMaxLogSize write SetMaxLogSize;
    property ShowSplash: Boolean read GetShowSplash write SetShowSplash;
    property MaxDataBlockSize: Word read FMaxDataBlockSize write SetMaxDataBlockSize;
    //автоотключение пользователя при простое более чем AutoStopAndCloseApp в минутах
    property AutoStopAndCloseApp:Integer read FAutoStopAndCloseApp write SetAutoStopAndCloseApp;
    property LockAppTime: TDateTime read FLockAppTime write SetLockAppTime;
    //оцениваемый размер xml в байтах, который умещается в зазипованном виде в блок размера MaxDataBlockSize
    property MaxOutDataBlockSize: Word read FMaxOutDataBlockSize write SetMaxOutDataBlockSize;
    property AutoSignDoc: Boolean read FAutoSignDoc write SetAutoSignDoc;
    property NewDocDefaultState: TNewDocState read FNewDocDefaultState write SetNewDocDefaultState;
    property SigCountNeedForSend: Word read FSigCountNeedForSend write SetSigCountNeedForSend;
    property UseProxy: Boolean read FUseProxy write SetUseProxy;
    { ProxyHostPort - Host:Port }
    property ProxyHost: string read FProxyHost write SetProxyHost;
    property ProxyPort: Word read FProxyPort write SetProxyPort;
    property UseProxyAuth: Boolean read FUseProxyAuth write SetUseProxyAuth;
    property ProxyUser: string read FProxyUser write SetProxyUser;
    property ProxyPassw: string read GetProxyPassw write SetProxyPassw;

    { ConnectIgnoreErrorsCount  - количество раз, сколько система будет пытаться установить связь с сервером и игнорировать ошибки }
    property ConnectIgnoreErrorsCount: Word read FConnectIgnoreErrorsCount write SetConnectIgnoreErrorsCount;

    property PrinterParams: TPrintSettings read FPrinterParams write SetPrinterParams;
    { UserFirstStart - флаг используется для более "смартового определения"
      "первого старта системы" при выдаче сообщений пользователю }
    property UserFirstStart: Boolean read FUserFirstStart write SetUserFirstStart;
    property InterruptTimeoutMin: Integer read FInterruptTimeoutMin write SetInterruptTimeoutMin;

    property ForecastDeffered: TForecastDeffered read FForecastDeffered write SetForecastDeffered;
    { AutoSignOnlySignedDoc. If a "AutoSignDoc" is checked then this flag take effect. It show
    what will need sign only already signed documents }
    property AutoSignOnlySignedDoc: Boolean read FAutoSignOnlySignedDoc write SetAutoSignOnlySignedDoc;
    property CanInputCyrillicSWIFT: Boolean read FCanInputCyrillicSWIFT write SetCanInputCyrillicSWIFT;

    { SendAllDocsToBank - отсылать документы готовые к отправке всех пользователей рабочего места }
    property SendAllDocsToBank: Boolean read FSendAllDocsToBank write SetSendAllDocsToBank;
    property DefDetailsOfPayment: string read FDefDetailsOfPayment write SetDefDetailsOfPayment;
    property UseDefDetailsOfPaymentToClone: Boolean read FUseDefDetailsOfPaymentToClone write SetUseDefDetailsOfPaymentToClone;

    { CrossNumbering - сквозная нумерация документов }
    property CrossNumbering: Boolean read FCrossNumbering write SetCrossNumbering;

    { NumberingThroughOKPO - нумерация документов в разрезе ОКПО юр. лица }
    property NumberingThroughOKPO: Boolean read FNumberingThroughOKPO write SetNumberingThroughOKPO;

    { ShowDeletedAndRejectedDocs - отображать удаленные и отклоненные документы в фильтре "Не проведенные" }
    property ShowDeletedAndRejectedDocs: Boolean read FShowDeletedAndRejectedDocs write SetShowDeletedAndRejectedDocs;

    { LinearExport - признак необходимости произведения экспорта в линейном виде (Вид "по-умолчанию"),
      т.е. в таком виде грида, который определен разработчиком }
    property LinearExport: Boolean read FLinearExport write SetLinearExport;
    property ShowSyncDetails: Boolean read FShowSyncDetails write SetShowSyncDetails;
    property LastSignAsKeyPath: string read FLastSignAsKeyPath write FLastSignAsKeyPath;
    property LastSignedUserLogin: string read FLastSignedUserLogin write SetLastSignedUserLogin;
    property NatDocPlatCopies: Word read FNatDocPlatCopies write SetNatDocPlatCopies;
    property SortPrintDocPaymOrder: Word read FSortPrintDocPaymOrder write SetSortPrintDocPaymOrder;

    property CurrDayFiltering: Boolean read FCurrDayFiltering write SetCurrDayFiltering;
    property AutoCorrectAccNo: Boolean read FAutoCorrectAccNo write SetAutoCorrectAccNo;
    property AutoCorrectVAT: Boolean read FAutoCorrectVAT write SetAutoCorrectVAT;
    //профили подключения
    property ConnProfiles : TConnProfiles read FConnProfiles write SetConnProfiles;
    //Опция для расчета остатка не текущего дня (по умолчанию для Закрытого дня Прогозируемый остаток должен равняться Тек. остатку )
    property OldBalForecastEqualsSumma : Boolean read FOldBalForecastEqualsSumma write SetOldBalForecastEqualsSumma;
    property ShowSysDateAlert: Boolean read FShowSysDateAlert write SetShowSysDateAlert;

    property HintType: THintType read FHintType write SetHintType;

    property FXDocSettings: TFXDocSettings read FFXDocSettings write SetFXDocSettings;

    {на стпанице "Мой iFOBS" поакзывать Прогнозируемый остаток или итоговую сумму}
    property BalForecastSetting: TShowBalanceForecast read FBalForecastSetting write SetBalForecastSetting;

    {показывать итоговую сумму}
    property ShowSummaryNotify: TShowSummaryNotify read FShowSummaryNotify write SetShowSummaryNotify;

    { IgnoreClientDebetLimitChecks - если True - то не проверяются лимиты }
    property IgnoreClientDebetLimitChecks: Boolean read FIgnoreClientDebetLimitChecks write SetIgnoreClientDebetLimitChecks;
    property LastMailBranchID: Integer read FLastMailBranchID write SetLastMailBranchID;
    { ShowDayAlert - показывать оповещение о сменне ОДБ }
    property ShowDayAlert: Boolean read FShowDayAlert write SetShowDayAlert;
    { MailDeliviryOnFullSync - отправлять/получать почту при полной синхронизации (если False - то только с формы сообщений) }
    property MailDeliviryOnFullSync: Boolean read FMailDeliviryOnFullSync write SetMailDeliviryOnFullSync;

    {  ShowOnlyOpenAccounts - отоображать на форме "Мой iFOBS" только открытые счета }
    property ShowOnlyOpenAccounts: Boolean read FShowOnlyOpenAccounts write SetShowOnlyOpenAccounts;

    { ShowDialogsWhenSync - разрешить отображение диалогов во время синхронизации (как в старых версиях) }
    property ShowDialogsWhenSync: Boolean read FShowDialogsWhenSync write SetShowDialogsWhenSync;

    { NextPackDate - время следующей упаковки БД }
    property NextPackDate: TDateTime read FNextPackDate write SetNextPackDate;
    property CheckPackDaysInterval: Integer read FCheckPackDaysInterval write SetCheckPackDaysInterval;
    { ImmediatePack - устанавливает дату NextPackDate = текущей }
    property ImmediatePack: Boolean read FImmediatePack write SetImmediatePack;


    property RelativeDocPath: string read FRelativeDocPath write SetRelativeDocPath;
    property RelativeAccBalPath: string read FRelativeAccBalPath write SetRelativeAccBalPath;

    property UseAutoImportFromDirectory: Boolean read FUseAutoImportFromDirectory write SetUseAutoImportFromDirectory;
    property RelativeDocImportPath: string read FRelativeDocImportPath write SetRelativeDocImportPath;

    property PackDBCounter: Integer read FPackDBCounter write SetPackDBCounter;

    property FXSwiftOnePage: Boolean read FFXSwiftOnePage write SetFXSwiftOnePage;
    property FXBuyOnePage: Boolean read FFXBuyOnePage write SetFXBuyOnePage;
    property DBConnectRetryCount: Word read FDBConnectRetryCount write SetDBConnectRetryCount;
    { ComplexPasswRules - дубликат из секьюрного сторэджа }
    property ComplexPasswRulesLevel: Word read FComplexPasswRulesLevel write SetComplexPasswRulesLevel;
      // мин.макс. размер пароля
    property MinPswLen: Word read FMinPswLen write FMinPswLen;
    property MaxPswLen: Word read FMaxPswLen write FMaxPswLen;
      // через сколько дней менять пароль на секретный ключ
    property KeyExpPeriod: Word read FKeyExpPeriod write FKeyExpPeriod;
      // через сколько дней менять пароль на вход в систему
    property PswExpPeriod: Word read FPswExpPeriod write FPswExpPeriod;
      // через сколько раз можно повторно использовать пароль
    property CountCashePassw: Word read FCountCashePassw write FCountCashePassw;
      // Подсчитывать неудачное кол-во входа в систему
    property CountFailedLogins: Boolean read FCountFailedLogins write FCountFailedLogins;
      // Блокировать ли после определенного числа неуспешных паролей
    property CountFailedLoginsBlock: Boolean read FCountFailedLoginsBlock write FCountFailedLoginsBlock;
      // Кол-во неудачных попыток входа в систему iFOBS после чего блокировать клиента
    property CountFailedLoginsQ: Word read FCountFailedLoginsQ write SetCountFailedLoginsQ;
      // Блокировать WIN32 клиента на время в минутах
      // Кол-во неудачных попыток входа в систему iFOBS после чего пользователь будет заблокирован в системе
    property CountFailedLoginsSysPass: Integer read FCountFailedLoginsSysPass write FCountFailedLoginsSysPass;
    property DisableAppTimeFailedLogins: Word read FDisableAppTimeFailedLogins write SetDisableAppTimeFailedLogins;

    // AutoBuildElAccRep - автоматическая генерация электронных выписок через указанный в настройках промежуток времени
    property AutoBuildElAccRep: Boolean read FAutoBuildElAccRep write SetAutoBuildElAccRep;
    // FxCommissionType - ввод комиссии только в процентах
    property FxCommissionType: Boolean read FFxCommissionType write SetFxCommissionType;
    // Если эта опция активна, то результаты импорта так же будут сохранены в формате XLS
    property ImportResultToExcel: Boolean read FImportResultToExcel write SetImportResultToExcel;
    { LastChangePasswDB - время последней смены пароля}
    property LastChangePasswDB: TDateTime read FLastChangePasswDB write SetLastChangePasswDB;
    property CheckChangePasswDBMonthInterval: Integer read FCheckChangePasswDBMonthInterval write FCheckChangePasswDBMonthInterval;
    //В SWIFT максимальная длина ParID = 37
    property FxSwiftParID37: Boolean read FFxSwiftParID37 write FFxSwiftParID37;
    //Нужно грузить справочник BIC-ов для Easy SWIFT
    property NeedSyncSWBankCorr: Boolean read FNeedSyncSWBankCorr write FNeedSyncSWBankCorr;
    // Путь к папке для сохранения файлов расширенных сообщений
    property MailAttachPath: String read FMailAttachPath write FMailAttachPath;
    // Путь к папке для сохранения файлов расширенных сообщений
    property SalMobilePhoneRequired: boolean read FSalMobilePhoneRequired write FSalMobilePhoneRequired;
    // Обязательность заполнения полей "Отделение банка", "Тип карты"
    property SalColumnRequired: Boolean read FSalColumnRequired write FSalColumnRequired;
    //При создании документа доступны для выбора счета в состоянии "открыт"
    property SelectOnlyOpenAccounts: boolean read FSelectOnlyOpenAccounts write FSelectOnlyOpenAccounts;
    // Разрешено генерировать пароль
    property CertExpReg: boolean read FCertExpReg write FCertExpReg;
    // True - При формировании платежа на счет 3719% в назначении платежа добавляется блок вида *;AAA;BBBBBBBB; (AAA - тех. код цифры 6-8 счета получателя, BBBBBBBB - ид. код клиента
    property ShowPaymentPurposePFAdd: boolean read FShowPaymentPurposePFAdd write FShowPaymentPurposePFAdd;
    // Возможность ввода телефонных кодов в карточке сотрудника предприятия
    property SalPhoneCode: boolean read FSalPhoneCode write FSalPhoneCode;
    property SalCustomEmpl: boolean read FSalCustomEmpl write FSalCustomEmpl;
    // 30, Разрешенная разница между датой валютирования и датой документа в нац. валюте' defaultvalue = 10
    property DocCRValueDateValidPeriod: Word read GetDocCRValueDateValidPeriod write SetDocCRValueDateValidPeriod;
    // 27,Разрешенная разница между датой валютирования и датой документа в иностранной валюте' defaultvalue = 30
    property DocCRValueDateValid_Cur: Word read GetDocCRValueDateValid_Cur write SetDocCRValueDateValid_Cur;
    // 31, Разрешенная разница между датой опер.дня и датой документа в нац. валюте' defaultvalue = 30
    property DocumentDatePeriod: Word read FDocumentDatePeriod write FDocumentDatePeriod;
    // 32,Разрешенная разница между датой опер.дня и датой документа в иностранной валюте' defaultvalue = 29
    property DocumentDatePeriod_cur: Word read FDocumentDatePeriod_cur write FDocumentDatePeriod_cur;
    // Отображать предупреждение об окончании срока действия сертификата
    property ShowWarnDayExpForSignAs: Boolean read FShowWarnDayExpForSignAs write FShowWarnDayExpForSignAs;
    property ShowAccountStateBlockDebetAsOpen: Boolean read FShowAccountStateBlockDebetAsOpen write FShowAccountStateBlockDebetAsOpen;
    // показывать ли в выписке итоги за каждый день
    property ReportShowDailySums: Boolean read FReportShowDailySums write FReportShowDailySums;
    // показывать ли в выписке итоги за весь период выписки
    property ReportShowPeriodSums: Boolean read FReportShowPeriodSums write FReportShowPeriodSums;
   // Отображать остатки по опер дню основного филиала
    property ShowBalanceFilial: Boolean read FShowBalanceFilial write FShowBalanceFilial;
   // При обновлении версии БД не изменять настройки кл.мест которые задает пользователь
    property DBChangeVersion: Boolean read FDBChangeVersion write FDBChangeVersion;
    // Количество дней, в течении которых можно прегенерировать сертификат, после окончания срока действия сертификата
    property UserCertAfterPeriod: Integer read FUserCertAfterPeriod write FUserCertAfterPeriod;
    // Заблокировать работу RSA
    property IFOBSDisableStandartLogin: Boolean read FIFOBSDisableStandartLogin write SetIFOBSDisableStandartLogin;
    property DaysBeforeTokenEnd: Integer read FDaysBeforeTokenEnd write FDaysBeforeTokenEnd;
    // Путь к документам импорта TMS Bellin
    property PathImportTMS: String  read FPathImportTMS write FPathImportTMS;
    // Путь к документам экспорта TMS Bellin
    property PathExportTMS: String  read FPathExportTMS write FPathExportTMS;
    // Путь к хранилищу документов экспорта TMS Bellin
    property PathRepositoryTMS: String read FPathRepositoryTMS write FPathRepositoryTMS;
    property IsRSAAdaptive: Boolean read FIsRSAAdaptive write FIsRSAAdaptive;
    property NationalCurrencyUse: Boolean read FNationalCurrencyUse write SetNationalCurrencyUse;
    // 1 -Использование нового расширенного режима работы OTP-токена (Интеркредит), 2- (ICB, VTB), 0 - не использовать
    property OtpConfDoc:Integer read FOtpConfDoc write FOtpConfDoc;
    // Признак запроса ОТП-кода при перегенерации, восстановлении сертификатов.
    property IfobsMactokenCertificateUse: boolean read FIfobsMactokenCertificateUse write SetIfobsMactokenCertificateUse;
    // Признак авторизации сообщений OTP-паралем
    property OtptokenCbmessageEnabled: Boolean read FOtptokenCbmessageEnabled write FOtptokenCbmessageEnabled;
    // Признак подтверждения ОТР-кодом только подписанных документов
    property OtpConfirmationDocumentOnlySign: Boolean  read FOtpConfirmationDocumentOnlySign write FOtpConfirmationDocumentOnlySign;
    // Возможность автоматического формирования отчетов ISO20022
    property AutoPain002: Boolean read FAutoPain002 write FAutoPain002;
    property AutoMT940: Boolean read FAutoMT940 write FAutoMT940;
    property AutoMT942: Boolean read FAutoMT942 write FAutoMT942;
    property AutoSyncAfterImportPain001: Boolean read FAutoSyncAfterImportPain001 write FAutoSyncAfterImportPain001;
    // Признак формирования ОТР-кода по коротким данным - четыре последних цифры счета + сумма без копеек
    property OtpConfirmationChunkShortSignData: Boolean  read FOtpConfirmationChunkShortSignData write FOtpConfirmationChunkShortSignData;
    // Количество дней актуальности ЭЦП для сообщений из банка
    property DaysRelevanceEDSforMessages: Integer  read FDaysRelevanceEDSforMessages write FDaysRelevanceEDSforMessages;
    // признак проверки пароля на наличин личных данных - Login, Дата рождения, телефон
    property IfobsUserPasswordVerifyAnonymity :Boolean read FIfobsUserPasswordVerifyAnonymity write FIfobsUserPasswordVerifyAnonymity;
    // признак проверки пароля по справочнику запрещенных паролей
    property IfobsUserPasswordVerifySimple: Boolean read FIfobsUserPasswordVerifySimple write FIfobsUserPasswordVerifySimple;
    // признак отключения финансовых операций по картам
    property CardActiveOperationsEnabled:Boolean read FCardActiveOperationsEnabled write FCardActiveOperationsEnabled;
    // признак печати  выписки по авлютным карточным счетам по ассоциативному договору
    property AssociatedUAHContractEnabled: Boolean read FAssociatedUAHContractEnabled write FAssociatedUAHContractEnabled;
    // Тип карточного процессинга UPC
    property CardsProcessingUpcType: String read FCardsProcessingUpcType write FCardsProcessingUpcType;
    // Разришение перевода НВ со счета на карточку
    property IfobsTransferToCardCorp: Boolean read FIfobsTransferToCardCorp write FIfobsTransferToCardCorp;
    // Разрешение на использование софт-токен
    property SoftConfirmationEnabled: Boolean  read FSoftConfirmationEnabled write FSoftConfirmationEnabled;
    // Иметь возможность заблокировать кеширование секретных ключей на клиентском месте с предустановленным состоянием
    property LockCashePrivateKey : Boolean read FLockCashePrivateKey write FLockCashePrivateKey;
    // Отображение пароля на логиновой странице.
    property CanViewPassword : Boolean read FCanViewPassword write FCanViewPassword;
    property OtptokenPdforderEnabled: Boolean read FOtptokenPdforderEnabled write FOtptokenPdforderEnabled;
    // работа с внешними ключами
    property External_Cert_Enabled: Boolean read FExternal_Cert_Enabled write FExternal_Cert_Enabled;
    property External_Cert_IIT_URL: string read FExternal_Cert_IIT_URL write FExternal_Cert_IIT_URL;
    property External_Cert_UAKey_URL: string read FExternal_Cert_UAKey_URL write FExternal_Cert_UAKey_URL;
    property Bank_Cert_IIT_URL: string read FBank_Cert_IIT_URL write FBank_Cert_IIT_URL;
    property LastSignAsExtKeyPath: string read FLastSignAsExtKeyPath write FLastSignAsExtKeyPath;
    property LastSignAsBankKeyPath: string read FLastSignAsBankKeyPath write FLastSignAsBankKeyPath;
  end;


function GlobalAppStorage: TGlobalAppStorage;
function GlobalAppStorageDB: TGlobalAppStorage;
function GetDBIniFileName(const AUser: string = ''): string;
function IsAssignedGlobalAppStorage: Boolean;

function IsVTBLoginForm: Boolean;
function IsICBLoginForm: Boolean;
function IsExteranalKeyLoginForm: Boolean;
function IsUkrEximLogin: Boolean;
function IsAlphaLogin: Boolean;
function IsOTPLogin: Boolean;
function IsWUCBLogin: Boolean;
function IsAGROPROSPERISBank : Boolean;
function IsPIVDENNYBank : Boolean;

function IsUseBCSK_IIT: Boolean;

function IsSafeVersion: Boolean;
procedure glOnGetTokenError(var AText: String);

implementation

uses
  Forms,
  StrUtils,
  AppSysUtils,
  IdCoderMIME,
  IdCoder,
  GlobalConst,
  DateUtils,
  CertConsoleMode, SecuritySystem;

var
  glGlobalAppStorage: TGlobalAppStorage;
  glGlobalAppStorageDB: TGlobalAppStorage;


function GlobalAppStorage: TGlobalAppStorage;

  procedure CreateNew;
  begin
    glGlobalAppStorage := TGlobalAppStorage.Create(INI_GLOBAL_SECTION, TCustomAppStorage.GetIniFileName);
    if IsVTBLoginForm then
       glGlobalAppStorage.FUserCertAfterPeriod := 90;
  end;

begin
  if not Assigned(glGlobalAppStorage) then
    CreateNew;
  Result := glGlobalAppStorage;
end;

function GlobalAppStorageDB: TGlobalAppStorage;

  procedure CreateNew;
  begin
    if GlobalAppStorage.DBMultiUsers then
      glGlobalAppStorageDB :=
         TGlobalAppStorage.Create(INI_GLOBAL_SECTION,
                               GetDBIniFileName)
    else
      glGlobalAppStorageDB := GlobalAppStorage;
 end;

begin
  if not Assigned(glGlobalAppStorageDB) then
    CreateNew;
  Result := glGlobalAppStorageDB;
end;

function GetDBIniFileName(
  const AUser: string): string;
const
  INI_FOLDER_NAME ='Ini';
  INI_EXT = '.ini';
  INI_DB ='DB';
var
  _FileName: string;
begin
  Result := TCustomAppStorage.GetIniFileName(AUser);
  Result := ChangeFileExt(Result, INI_DB);
  Result := ChangeFileExt(Result, INI_EXT);
  if (GlobalAppStorage.DBPath <> '') then
  begin
    _FileName := ExtractFileName(Result);
    Result := GlobalAppStorage.DBPathActual + INI_FOLDER_NAME;
    if not ForceDirectories(Result) then
      raise EIniFileError.CreateFmt(GetiFOBSText('CantCreateFolderError'), [Result]);
    Result := IncludeTrailingPathDelimiter(Result) + _FileName;
  end;
end;

function IsAssignedGlobalAppStorage: Boolean;
begin
  Result := Assigned(glGlobalAppStorage);
end;

function IsVTBLoginForm: Boolean;
begin
  Result := (GlobalAppStorage.BankName = 'VTB') or (GetCertMode and 2 = 2);
end;

function IsICBLoginForm: Boolean;
begin
  Result := (GlobalAppStorage.BankName = 'PIRAEUS') or (GetCertMode and 4 = 4);
end;

function IsUkrEximLogin: Boolean;
begin
  Result := (GlobalAppStorage.BankName = 'EXIM') or (GetCertMode and 32 = 32);
end;

function IsAlphaLogin: Boolean;
begin
  Result := GlobalAppStorage.BankName = 'ALFA';
end;

function IsOTPLogin: Boolean;
begin
  Result := GlobalAppStorage.BankName = 'OTP';
end;

function IsWUCBLogin: Boolean;
begin
  Result := GlobalAppStorage.BankName = 'KREDOBANK';
end;

function IsAGROPROSPERISBank: Boolean;
begin
  Result := GlobalAppStorage.BankName = 'ASTRA';
end;

function IsPIVDENNYBank: Boolean;
begin
  Result := GlobalAppStorage.BankName = 'PIVDENNY';
end;


function IsUseBCSK_IIT: Boolean;
begin
  Result := IsOTPLogin or IsAlphaLogin;
end;

procedure glOnGetTokenError(var AText: String);
begin
  if IsICBLoginForm then
    if trim(AText) = 'CKR_PIN_LOCKED' then
      AText := 'CKR_PIN_LOCKED_ICB';
end;

function IsExteranalKeyLoginForm: Boolean;
begin
  Result := GlobalAppStorage.IsExtKey or (GetCertMode and 16 = 16);
end;

function IsSafeVersion: Boolean;
begin
  Result := GlobalAppStorage.IsCipher or (GetSecuritySystemVersion and 1 = 1);
end;

{ TGlobalStorage }


procedure TGlobalAppStorage.AddConnProfile(const AName, AHost: string;
  APort: Word; AIndex: Integer);
var
  _Profile: TConnProfile;
  i: Integer;
begin
  _Profile := nil;
  for i := 0 to ConnProfiles.Count - 1 do
    if ConnProfiles[i].Name = AName then
    begin
      _Profile := ConnProfiles[i];
      break;
    end;
  if not Assigned(_Profile) then
    _Profile := ConnProfiles.Add;
  _Profile.Name := AName;
  _Profile.Host := AHost;
  _Profile.Port := APort;
  if (AIndex >= 0) and (AIndex < ConnProfiles.Count) then
    _Profile.Index := AIndex;
end;

procedure TGlobalAppStorage.CancelDebugMode;
begin
  FIsDebug := False;
end;

constructor TGlobalAppStorage.Create(const AINISection,
  AINIFileName: string);

  function IsDebug: Boolean;
  var
    i: Integer;
  begin
    for i := 1 to ParamCount do
      if AnsiSameText(ParamStr(i), '-' + DEBUG_PARAM_NAME) or
         AnsiSameText(ParamStr(i), '/' + DEBUG_PARAM_NAME) then
      begin
        Result := True;
        Exit;
      end;
    Result := False;
  end;

begin
  FPrinterParams := TPrintSettings.Create(Self);
  FForecastDeffered := TForecastDeffered.Create(Self);
  FConnProfiles := TConnProfiles.Create(TConnProfile, Self);
  FSaveProfiles := TConnProfiles.Create(TConnProfile, Self);
  FHintType := THintType.Create(Self);
  FFXDocSettings := TFXDocSettings.Create(Self);
  FBalForecastSetting := TShowBalanceForecast.Create(Self);
  FShowSummaryNotify := TShowSummaryNotify.Create(Self);
  FAutoStopCloseApp := TStopEndCloseAppType.Create(Self);
{$IFDEF DEBUG_LOGXML}
  FIsDebug := True;
{$ELSE}
  FIsDebug := IsDebug;
{$ENDIF}
  inherited;
end;

destructor TGlobalAppStorage.Destroy;
begin
  inherited;
  { TODO -odrn : Возможно, не понадобится, если реализовать ICustopPropNotify }
  FSaveProfiles.Free;
  FConnProfiles.Free;
end;

function TGlobalAppStorage.GetAvgDocPackCount(const RecSize: Integer): Word;
const
  AVG_DOC_WITH_SIGN_SIZE_BYTE = 140;
begin
  //считаем, что в 140 Кб отправляемых на сервер помещается 1024 записи размером по 2048 байт.
  Result := (1024 * 2048 * MaxOutDataBlockSize) div (AVG_DOC_WITH_SIGN_SIZE_BYTE * RecSize);
end;

function TGlobalAppStorage.GetHost: string;
begin
  if ConnProfiles.Count > 0 then
    Result := ConnProfiles[0].Host
  else
    Result := DEFAULT_HOST;
end;

function TGlobalAppStorage.GetLogKind: TLogKind;
begin
  if FSaving then
    Result := FLogKind
  else if not FIsDebug then
    Result := FLogKind
  else
    Result := lkDebug;
end;

function TGlobalAppStorage.GetPort: Word;
begin
  if ConnProfiles.Count > 0 then
    Result := ConnProfiles[0].Port
  else
    Result := DEFAULT_PORT;
end;

function TGlobalAppStorage.GetProxyPassw: string;
begin
  if FSaving then
    Result := TIdEncoderMIME.EncodeString(FProxyPassw)
  else
    Result := FProxyPassw
end;

function TGlobalAppStorage.GetShowSplash: Boolean;
begin
{$IFDEF DEBUG_LOGXML}
  Result := False;
{$ELSE}
  Result := FShowSplash;
{$ENDIF}
end;

procedure TGlobalAppStorage.InitAllDefault;
begin
  FActiveLang := 0; //Russian
  FAutoSignOnlySignedDoc := True;
  FDBPath := '';
  FShowSplash := True;
  FMaxLogSize := 500;
  FLogArchivationType := atArchive;
  FLogKind := lkEverythingPossible;
  FMaxDataBlockSize := 400;
  FMaxOutDataBlockSize := 250;
  FAutoSignDoc := False; { автоматически подписывать документы }
  FNewDocDefaultState := ndsInput; { состояние документа по-умолчанию - ВВЕДЕН }
  FSigCountNeedForSend := 2; { для отправки на сервер необходимо чтобы было 2 подписи }
  FUseProxy := False;
  FProxyHost := '';
  FProxyPort := 3129;
  FUseProxyAuth := False;
  FProxyUser := '';
  FProxyPassw := '';
  FConnectIgnoreErrorsCount := 10;
  FLastSignedUserLogin := '';
  FPrinterParams.FPrintOEMText := False;
//  FPrinterParams.FPrint2DocPerSheet := False;
  FPrinterParams.FDefaultCopies := 1;
  FPrinterParams.FLeftMargin := 10;
  FPrinterParams.FTopMargin := 10;
  FPrinterParams.FBottomMargin := 10;
  FPrinterParams.FRightMargin := 10;
  FUserFirstStart := True;
  FInterruptTimeoutMin := 5; //5 минут
  FForecastDeffered.FNeedCalc := False;
  FCanInputCyrillicSWIFT := False;
  FSendAllDocsToBank := False;
  FDefDetailsOfPayment := '';
  FUseDefDetailsOfPaymentToClone := False;
  //дефолтные директории
  FRelativeDocPath := SAVE_DOC_PATH;
  FRelativeAccBalPath := SAVE_ACC_BAL_PATH;
  //для импорта гривневых документов
  FRelativeDocImportPath := IMPORT_DOC_PATH;

  FCrossNumbering := True;
  FNumberingThroughOKPO := True;
  FShowDeletedAndRejectedDocs := True;
  FLinearExport := True;
  FShowSyncDetails := False;
  FNatDocPlatCopies := 1;
  FSortPrintDocPaymOrder := 0;
  FCurrDayFiltering := True;
  FAutoCorrectAccNo := False; //ifobs-1638
  FAutoCorrectVAT := True; //ifobs-1641
  //делаем профиль по умолчанию
  with FConnProfiles.Add do
  begin
    Name := 'Профиль по умолчанию';
    Host := DEFAULT_HOST;
    Port := DEFAULT_PORT;
  end;
  FOldBalForecastEqualsSumma := True;
  FShowSysDateAlert :={$IFDEF DEBUG_LOGXML}True{$ELSE}False{$ENDIF};
  FHintType.StandardHint := True; //on Vista hang up... (VER_PLATFORM_WIN32_NT <> Win32Platform);
  FHintType.HintsOn := True;
  FAutoStopAndCloseApp := 0;
  FAutoStopCloseApp.TimeStop := 0;
  FLockAppTime:=0;
  {FXDocSettings}
  //--------------------------
  FShowSummaryNotify.ShowSummaryNotify := True;
  FBalForecastSetting.ShowBalanceForecast := True;
  FBalForecastSetting.ShowBalanceForecastInpDoc := True;
  //default количество подписей для отображения прогноза
  //-- учитывать только с 2мя подписями
  FBalForecastSetting.SigCountForBal := 2;
  FIgnoreClientDebetLimitChecks := False;
  FShowDayAlert := True;
  FMailDeliviryOnFullSync := True;
  FShowOnlyOpenAccounts := True;
  FShowDialogsWhenSync := True; //as old version
  FCheckPackDaysInterval := 30;
  FNextPackDate := Now + FCheckPackDaysInterval;
  FUseAutoImportFromDirectory := False;
  FPackDBCounter := 3400; //экспериментально
  FFXSwiftOnePage := True;
  FFXBuyOnePage := True;
  FDBConnectRetryCount := 3;
  FComplexPasswRulesLevel := 0;
  FMinPswLen:=5;
  FMaxPswLen:=30;
  FKeyExpPeriod:=30;
  FPswExpPeriod:=30;
  FCountCashePassw:=5;
  FCountFailedLogins:=False;
  FCountFailedLoginsBlock:=False;
  FDisableAppTimeFailedLogins := LOCKMINUTESAPP;
  FIFOBSDisableStandartLogin := False;

  FCountFailedLoginsQ:=5;

  PrinterParams.CanSaveAndOpenReports := False;
  FFxCommissionType := False;
  FImportResultToExcel := False;
  FLastChangePasswDB := Date;
  FCheckChangePasswDBMonthInterval := 60; //5 лет
  FSalMobilePhoneRequired := true;
  FSalColumnRequired := False;
  FCertExpReg := true;
  FSelectOnlyOpenAccounts:= False;
  FShowPaymentPurposePFAdd:= False;
  FSalPhoneCode:= False;
  FDocCRValueDateValidPeriod := 10;
  FDocCRValueDateValid_Cur := 30;
  FDocumentDatePeriod := 30;
  FDocumentDatePeriod_cur := 29;
  FShowWarnDayExpForSignAs := True;
  FShowAccountStateBlockDebetAsOpen := False;
  FReportShowDailySums := True;
  FReportShowPeriodSums := True;
  FShowBalanceFilial := True;
  FDBChangeVersion := False;
  FUserCertAfterPeriod := 1;
  FIsRSAAdaptive := False;
  FOtpConfDoc := 0;
  FOtptokenCbmessageEnabled := False;
  FOtptokenPdforderEnabled := False;
  FDaysRelevanceEDSforMessages := 0;
  FOtpConfirmationDocumentOnlySign := False;
  FPathImportTMS := '';
  FPathExportTMS := '';
  FPathRepositoryTMS := '';
  FAutoPain002 := False;
  FAutoMT940 := False;
  FAutoMT942 := False;
  FAutoSyncAfterImportPain001 := False;
  FOtpConfirmationChunkShortSignData := False;
  FIfobsUserPasswordVerifyAnonymity := False;
  FIfobsUserPasswordVerifySimple := False;
  FCardActiveOperationsEnabled := True;
  FAssociatedUAHContractEnabled := False;
  FCardsProcessingUpcType := '';
  FIfobsTransferToCardCorp := false;
  FSoftConfirmationEnabled := false;
  FLockCashePrivateKey := False;
  FCanViewPassword := False;
  FExternal_Cert_Enabled := False;
  FExternal_Cert_IIT_URL := '';
  FExternal_Cert_UAKey_URL := '';
  FBank_Cert_IIT_URL := '';
  FCountFailedLoginsSysPass := 0;
  FIsCipher := False;
  FIsExtKey := False;
  FIsExtKeyCSK := False;
  FBankCSKName := '';
end;

procedure TGlobalAppStorage.InitDebugMode;
begin
  FIsDebug := True;
  glDebugMode := True;
end;

procedure TGlobalAppStorage.Load;
const
  HOST_ID = 'Host';
  PORT_ID = 'Port';
begin
  inherited;
  //если после загрузки текущий не задан, то загрузим и сохраним дефолтный профиль

  Assert(FConnProfiles.Count > 0, 'Нет информации о параметрах подключения!');
  if (FConnProfiles.Count > 0) and (FConnProfiles[0].Host = DEFAULT_HOST)  then
  begin
    FConnProfiles[0].Name := 'Профиль по умолчанию';
    FConnProfiles[0].Host := DoReadStr(INI_GLOBAL_SECTION, HOST_ID, DEFAULT_HOST);
    FConnProfiles[0].Port := StrToIntDef(DoReadStr(INI_GLOBAL_SECTION, PORT_ID, ''), DEFAULT_PORT);
  end;
end;

procedure TGlobalAppStorage.SetAutoCorrectAccNo(const Value: Boolean);
begin
  FAutoCorrectAccNo := Value;
end;

procedure TGlobalAppStorage.SetAutoCorrectVAT(const Value: Boolean);
begin
  FAutoCorrectVAT := Value;
end;

procedure TGlobalAppStorage.SetAutoSignDoc(const Value: Boolean);
begin
  FAutoSignDoc := Value;
end;

procedure TGlobalAppStorage.SetAutoSignOnlySignedDoc(const Value: Boolean);
begin
  FAutoSignOnlySignedDoc := Value;
end;

procedure TGlobalAppStorage.SetCanInputCyrillicSWIFT(const Value: Boolean);
begin
  FCanInputCyrillicSWIFT := Value;
end;

procedure TGlobalAppStorage.SetConnectIgnoreErrorsCount(const Value: Word);
begin
  if Value <= 100 then
    FConnectIgnoreErrorsCount := Value;
end;




procedure TGlobalAppStorage.SetConnProfiles(const Value: TConnProfiles);
begin
  FConnProfiles := Value;
end;

procedure TGlobalAppStorage.SetCrossNumbering(const Value: Boolean);
begin
  FCrossNumbering := Value;
end;

procedure TGlobalAppStorage.SetCurrDayFiltering(const Value: Boolean);
begin
  FCurrDayFiltering := Value;
end;

procedure TGlobalAppStorage.SetDefDetailsOfPayment(const Value: string);
begin
  if (FDefDetailsOfPayment <> Value) then
  begin
    if Length(Value) > 160 then
      FDefDetailsOfPayment := Copy(Value, 1, 160)
    else
      FDefDetailsOfPayment := Value;
  end;
end;

procedure TGlobalAppStorage.SetUseDefDetailsOfPaymentToClone(const Value: Boolean);
begin
  if (FUseDefDetailsOfPaymentToClone <> Value) then
  begin
      FUseDefDetailsOfPaymentToClone := Value;
  end;
end;

procedure TGlobalAppStorage.SetForecastDeffered(
  const Value: TForecastDeffered);
begin
  FForecastDeffered := Value;
end;

procedure TGlobalAppStorage.SetHintType(const Value: THintType);
begin
  FHintType := Value;
end;

procedure TGlobalAppStorage.SetFXDocSettings(const Value: TFXDocSettings);
begin
  FFXDocSettings := Value;
end;

procedure TGlobalAppStorage.SetShowSummaryNotify(const Value: TShowSummaryNotify);
begin
  FShowSummaryNotify := Value;
end;

procedure TGlobalAppStorage.SetIgnoreClientDebetLimitChecks(
  const Value: Boolean);
begin
  FIgnoreClientDebetLimitChecks := Value;
end;

procedure TGlobalAppStorage.SetInterruptTimeoutMin(const Value: Integer);
begin
  if Value > 0 then
    FInterruptTimeoutMin := Value;
end;

procedure TGlobalAppStorage.SetLastMailBranchID(const Value: Integer);
begin
  FLastMailBranchID := Value;
end;

procedure TGlobalAppStorage.SetLastSignedUserLogin(const Value: string);
begin
  FLastSignedUserLogin := Value;
end;

procedure TGlobalAppStorage.SetLinearExport(const Value: Boolean);
begin
  FLinearExport := Value;
end;

procedure TGlobalAppStorage.SetLogArchivationType(
  const Value: TArchivationType);
begin
  FLogArchivationType := Value;
end;

procedure TGlobalAppStorage.SetLogKind(const Value: TLogKind);
begin
  if Value = lkDebug then
    FLogKind := Pred(Value)
  else
    FLogKind := Value;
end;

procedure TGlobalAppStorage.SetMaxDataBlockSize(const Value: Word);
begin
  FMaxDataBlockSize := Value;
end;

procedure TGlobalAppStorage.SetMaxLogSize(const Value: Word);
begin
  FMaxLogSize := Value;
end;

procedure TGlobalAppStorage.SetMaxOutDataBlockSize(const Value: Word);
begin
  FMaxOutDataBlockSize := Value;
end;

procedure TGlobalAppStorage.SetNatDocPlatCopies(const Value: Word);
begin
  FNatDocPlatCopies := Value;
end;

procedure TGlobalAppStorage.SetNewDocDefaultState(
  const Value: TNewDocState);
begin
  FNewDocDefaultState := Value;
end;

procedure TGlobalAppStorage.SetNumberingThroughOKPO(const Value: Boolean);
begin
  FNumberingThroughOKPO := Value;
end;

procedure TGlobalAppStorage.SetOldBalForecastEqualsSumma(
  const Value: Boolean);
begin
  FOldBalForecastEqualsSumma := Value;
end;

procedure TGlobalAppStorage.SetPrinterParams(const Value: TPrintSettings);
begin
  FPrinterParams := Value;
end;

procedure TGlobalAppStorage.SetProxyHost(const Value: string);
begin
  FProxyHost := Value;
end;

procedure TGlobalAppStorage.SetProxyPassw(const Value: string);
begin
  if FLoading then
  try
    FProxyPassw := TIdDecoderMIME.DecodeString(Value)
  except
  end  
  else
    FProxyPassw := Value;
end;

procedure TGlobalAppStorage.SetProxyPort(const Value: Word);
begin
  if Value > 0 then
    FProxyPort := Value;
end;

procedure TGlobalAppStorage.SetProxyUser(const Value: string);
begin
  FProxyUser := Value;
end;

procedure TGlobalAppStorage.SetSendAllDocsToBank(const Value: Boolean);
begin
  FSendAllDocsToBank := Value;
end;

procedure TGlobalAppStorage.SetShowDeletedAndRejectedDocs(
  const Value: Boolean);
begin
  FShowDeletedAndRejectedDocs := Value;
end;

procedure TGlobalAppStorage.SetShowSplash(const Value: Boolean);
begin
  FShowSplash := Value;
end;

procedure TGlobalAppStorage.SetShowSyncDetails(const Value: Boolean);
begin
  FShowSyncDetails := Value;
end;

procedure TGlobalAppStorage.SetShowSysDateAlert(const Value: Boolean);
begin
  FShowSysDateAlert := Value;
end;

procedure TGlobalAppStorage.SetSigCountNeedForSend(const Value: Word);
begin
  if FSigCountNeedForSend <> Value then
    FSigCountNeedForSend := Value;
end;

procedure TGlobalAppStorage.SetUseProxy(const Value: Boolean);
begin
  FUseProxy := Value;
end;

procedure TGlobalAppStorage.SetUseProxyAuth(const Value: Boolean);
begin
  FUseProxyAuth := Value;
end;

{ TPrintSettings }

procedure TPrintSettings.SetBottomMargin(const Value: Double);
begin
  FBottomMargin := Value;
end;

procedure TPrintSettings.SetCanSaveAndOpenReports(const Value: Boolean);
begin
  FCanSaveAndOpenReports := Value;
end;

procedure TPrintSettings.SetDefaultCopies(const Value: Byte);
begin
  if FDefaultCopies <> Value then
  begin
    FDefaultCopies := Value;
    DoChanged;
  end;
end;

procedure TPrintSettings.SetLeftMargin(const Value: Double);
begin
  FLeftMargin := Value;
end;

//procedure TPrintSettings.SetPrint2DocPerSheet(const Value: Boolean);
//begin
//  if FPrint2DocPerSheet <> Value then
//  begin
//    FPrint2DocPerSheet := Value;
//    DoChanged;
//  end;
//end;

procedure TPrintSettings.SetPageHeight(const Value: Double);
begin
  FPageHeight := Value;
end;

procedure TPrintSettings.SetPrintOEMText(const Value: Boolean);
begin
  if FPrintOEMText <> Value then
  begin
    FPrintOEMText := Value;
    DoChanged;
  end;
end;

procedure TGlobalAppStorage.SetUserFirstStart(const Value: Boolean);
begin
  FUserFirstStart := Value;
end;

procedure TPrintSettings.SetRightMargin(const Value: Double);
begin
  FRightMargin := Value;
end;

procedure TPrintSettings.SetTopMargin(const Value: Double);
begin
  FTopMargin := Value;
end;

{ TForecastDeffered }

procedure TForecastDeffered.SetNeedCalc(const Value: Boolean);
begin
  if FNeedCalc <> Value then
  begin
    FNeedCalc := Value;
    DoChanged;
  end;
end;

{ TConnProfile }

procedure TConnProfile.AssignTo(Dest: TPersistent);
begin
  if not (Dest is TConnProfile) then
    inherited
  else
  begin
    TConnProfile(Dest).FName := Name;
    TConnProfile(Dest).FHost := Host;
    TConnProfile(Dest).FPort := Port;
  end;
end;

constructor TConnProfile.Create(Collection : TCollection; const AName, aHost : String; const aPort : Word);
begin
  inherited Create(Collection);
  FName := aName;
  FHost := aHost;
  FPort := aPort;
end;

procedure TConnProfile.SetHost(const Value: String);
begin
  FHost := Value;
end;

procedure TConnProfile.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TConnProfile.SetPort(const Value: Word);
begin
  FPort := Value;
end;

{ TConnProfiles }

function TConnProfiles.Add: TConnProfile;
begin
  Result := TConnProfile(inherited Add);
end;

constructor TConnProfiles.Create(aItemClass: TCollectionItemClass; aOwner : TAbstractAppStorage);
begin
  inherited Create(aItemClass);
  Assert(Assigned(AOwner));
  FOwner := AOwner;
  { TODO -odrn : Consider implementing ICustomProps interface }
  //FOwner.NotifyProps.Add(Self);
end;

function TConnProfiles.GetItem(Index: Integer): TConnProfile;
begin
  Result := TConnProfile(inherited GetItem(Index));
end;


procedure TConnProfiles.SetItem(Index: Integer; const Value: TConnProfile);
begin
  inherited SetItem(Index, Value);
end;

{ THintType }

procedure THintType.SetHintsOn(const Value: Boolean);
begin
  if FHintsOn <> Value then
  begin
    FHintsOn := Value;
    DoChanged;
  end;
end;

procedure THintType.SetStandardHint(const Value: Boolean);
begin
  if FStandardHint <> Value then
  begin
    FStandardHint := Value;
    DoChanged;
  end;
end;

{ TShowBalanceForecast }

procedure TShowBalanceForecast.SetShowBalanceAvailable(const Value: Boolean);
begin
  if FShowBalanceAvailable <> Value then
  begin
    FShowBalanceAvailable := Value;
    DoChanged;
  end;
end;

procedure TShowBalanceForecast.SetShowBalanceForecast(const Value: Boolean);
begin
  if FStShowBalanceForecast <> Value then
  begin
    FStShowBalanceForecast := Value;
    DoChanged;
  end;
end;

procedure TShowBalanceForecast.SetShowBalanceForecastInpDoc(const Value: Boolean);
begin
  if FStShowBalanceForecastInpDoc <> Value then
  begin
    FStShowBalanceForecastInpDoc := Value;
    DoChanged;
  end;
end;

procedure TShowBalanceForecast.SetSigCountForBal(const Value: Integer);
begin
  if FSigCountForBal <> Value then
  begin
    FSigCountForBal := Value;
    DoChanged;
  end;
end;

{ TShowSummaryNotify }

procedure TShowSummaryNotify.SetShowSummaryNotify(const Value: Boolean);
begin
  if FStShowSummaryNotify <> Value then
  begin
    FStShowSummaryNotify := Value;
    DoChanged;
  end;
end;

{ TStopEndCloseAppType }

procedure TStopEndCloseAppType.SetTimeStop(const Value: Integer);
begin
  if Value<0 then
     FTimeStop :=0
  else if Value>100 then
     FTimeStop :=100
  else
    FTimeStop := Value;
  DoChanged;
end;

procedure TGlobalAppStorage.SetShowDayAlert(const Value: Boolean);
begin
  FShowDayAlert := Value;
end;

procedure TGlobalAppStorage.SetMailDeliviryOnFullSync(
  const Value: Boolean);
begin
  FMailDeliviryOnFullSync := Value;
end;

procedure TGlobalAppStorage.SetBalForecastSetting(
  const Value: TShowBalanceForecast);
begin
  FBalForecastSetting := Value;
end;

procedure TGlobalAppStorage.SetShowOnlyOpenAccounts(const Value: Boolean);
begin
  FShowOnlyOpenAccounts := Value;
end;

procedure TGlobalAppStorage.SetShowDialogsWhenSync(const Value: Boolean);
begin
  FShowDialogsWhenSync := Value;
end;

procedure TGlobalAppStorage.SetNextPackDate(const Value: TDateTime);
begin
  FNextPackDate := Value;
end;

procedure TGlobalAppStorage.SetNextPackDay(AImmediate: Boolean);
begin
  if AImmediate then
    NextPackDate := Now - 1 //вчера
  else
    NextPackDate := Now + CheckPackDaysInterval; // через 10 дней

  Save;
end;

procedure TGlobalAppStorage.SetCheckPackDaysInterval(const Value: Integer);
begin
  if Value = 0 then
    SetNextPackDay(True)
  else
    FCheckPackDaysInterval := Value;
end;

function TGlobalAppStorage.GetDocPath: string;
begin
  SetCurrentDir(ExtractFilePath(ParamStr(0)));
  Result := ExpandFileName(RelativeDocPath);
end;

function TGlobalAppStorage.GetAccBalPath: string;
begin
  SetCurrentDir(ExtractFilePath(ParamStr(0)));
  Result := ExpandFileName(RelativeAccBalPath);
end;

function TGlobalAppStorage.GetDocImportPath: string;
begin
  SetCurrentDir(ExtractFilePath(ParamStr(0)));
  Result := ExpandFileName(RelativeDocImportPath);
end;

procedure TGlobalAppStorage.SetDocPath(const Value: string);
begin
  RelativeDocPath := ExtractRelativePath(ExtractFilePath(ParamStr(0)), Value);
end;

procedure TGlobalAppStorage.SetAccBalPath(const Value: string);
begin
  RelativeAccBalPath := ExtractRelativePath(ExtractFilePath(ParamStr(0)), Value);
end;

procedure TGlobalAppStorage.SetDocImportPath(const Value: string);
begin
  RelativeDocImportPath := ExtractRelativePath(ExtractFilePath(ParamStr(0)), Value);
end;


procedure TGlobalAppStorage.SetRelativeDocPath(const Value: string);
begin
  FRelativeDocPath := Value;
end;

procedure TGlobalAppStorage.SetRelativeAccBalPath(const Value: string);
begin
  FRelativeAccBalPath := Value;
end;

procedure TGlobalAppStorage.SetRelativeDocImportPath(const Value: string);
begin
  FRelativeDocImportPath := Value;
end;

procedure TGlobalAppStorage.SetImmediatePack(const Value: Boolean);
begin
  if Value then
    SetNextPackDay(True);

  FImmediatePack := False;
end;

procedure TGlobalAppStorage.SetUseAutoImportFromDirectory(
  const Value: Boolean);
begin
  FUseAutoImportFromDirectory := Value;
end;

procedure TGlobalAppStorage.SetPackDBCounter(const Value: Integer);
begin
  FPackDBCounter := Value;
end;

procedure TGlobalAppStorage.SetFXSwiftOnePage(const Value: Boolean);
begin
  FFXSwiftOnePage := Value;
end;

procedure TGlobalAppStorage.SetFXBuyOnePage(const Value: Boolean);
begin
  FFXBuyOnePage := Value;
end;

procedure TGlobalAppStorage.SetDBConnectRetryCount(const Value: Word);
begin
  FDBConnectRetryCount := Value;
end;

procedure TGlobalAppStorage.SetComplexPasswRulesLevel(const Value: Word);
begin
  FComplexPasswRulesLevel := Value;
  if FComplexPasswRulesLevel>2 then FComplexPasswRulesLevel:=2;
end;

procedure TGlobalAppStorage.SetActiveLang(Value: Integer);
begin
  FActiveLang := Value;
end;

procedure TGlobalAppStorage.SetAutoBuildElAccRep(const Value: Boolean);
begin
  FAutoBuildElAccRep := Value;
end;

{---TFXDocSettings---}
procedure TFXDocSettings.SetFXSellMFO(const Value: string);
begin
  FFXSellMFO := Value;
end;

procedure TFXDocSettings.SetFXSellAccNo(const Value: string);
begin
  FFXSellAccNo := Value;
end;

procedure TFXDocSettings.SetFXSellOKPO(const Value: string);
begin
   FFXSellOKPO := Value;
end;

procedure TFXDocSettings.SetFXSellName(const Value: string);
begin
  FFXSellName := Value;
end;

procedure TFXDocSettings.SetPFMFO(const Value: string);
begin
  FPFMFO := Value;
end;

procedure TFXDocSettings.SetPFAccountNo(const Value: string);
begin
  FPFAccountNo := Value;
end;

procedure TFXDocSettings.SetPFOKPO(const Value: string);
begin
  FPFOKPO := Value;
end;

procedure TFXDocSettings.SetPFName(const Value: string);
begin
  FPFName:= Value;
end;

procedure TFXDocSettings.SetPFRegNo(const Value: string);
begin
  FPFRegNo := Value;
end;

procedure TFXDocSettings.SetFeePercentConv(const Value: Double);
begin
  FFeePercentConv := Value;
end;

procedure TFXDocSettings.SetFeePercentBuy(const Value: Double);
begin
  FFeePercentBuy := Value;
end;

procedure TFXDocSettings.SetFeePercentSell(const Value: Double);
begin
  FFeePercentSell := Value;
end;

procedure TFXDocSettings.SetFXConvFeeAccountNo(const Value: string);
begin
  FFXConvFeeAccountNo := Value;
end;

procedure TFXDocSettings.SetFXBuyFeeAccountNo(const Value: string);
begin
  FFXBuyFeeAccountNo := Value;
end;

procedure TFXDocSettings.SetFXSellFeeAccountNo(const Value: string);
begin
  FFXSellFeeAccountNo := Value;
end;

procedure TFXDocSettings.SetFXSwiftUrgentType(const Value: Integer);
begin
  FFXSwiftUrgentType := Value;
end;

procedure TGlobalAppStorage.CancelUpdate;
begin
  FConnProfiles.Assign(FSaveProfiles);
end;

procedure TGlobalAppStorage.EndUpdate;
begin
  FSaveProfiles.Clear;
end;

procedure TGlobalAppStorage.StartUpdate;
begin
  FSaveProfiles.Assign(FConnProfiles);
end;

function TGlobalAppStorage.GetDBPath: string;
Var
  _DBPath : string;
begin
  if (Length(FDBPath) > 0) and DirectoryExists(FDBPath) then
    _DBPath := FDBPath
  else
    _DBPath := ExtractFileDir(ParamStr(0));
  Result := IncludeTrailingPathDelimiter(_DBPath);
end;

procedure TGlobalAppStorage.SetDBPath(const Value: string);
begin
  if DBMultiUsers then
  begin
    FDBPath := Value;
    if (not FLoading) and (Value <> '') then
      CreateDirectory(Value);
  end;
end;

function TGlobalAppStorage.GetDBMultiUsers: boolean;
begin
{$IFDEF MULTI_USERS}
  Result := True;
{$ELSE}
  Result := False;
{$ENDIF}
end;

procedure TGlobalAppStorage.SetFxCommissionType(const Value: Boolean);
begin
  FFxCommissionType := Value;
end;

procedure TGlobalAppStorage.SetImportResultToExcel(
  const Value: Boolean);
begin
  FImportResultToExcel := Value;
end;

function TGlobalAppStorage.GetIsFullImportResult: Boolean;
begin
  // Пока так, возможно потом понадобится включить какое-то доп. условие
  result := FImportResultToExcel;
end;


function TGlobalAppStorage.MaxUnpackedBlockSize: Integer;
//считаем, что zip сжимает отправляемый xml c encode строкой в 10 раз
const AvgPackRatio = 10;
begin
  Result := FMaxOutDataBlockSize * 1024 * AvgPackRatio;
end;

procedure TGlobalAppStorage.SetLastChangePasswDB(const Value: TDateTime);
begin
  FLastChangePasswDB := Value;
end;

function TGlobalAppStorage.NeedChangePasswDB: boolean;
begin
  result := (Date > FLastChangePasswDB) and (FCheckChangePasswDBMonthInterval > 0) and
            (MonthsBetween(Date, FLastChangePasswDB) >= FCheckChangePasswDBMonthInterval);
end;

procedure TGlobalAppStorage.SetLastChangePasswDBS;
begin
  SetLastChangePasswDB(Date);
  Save;
end;

procedure TGlobalAppStorage.SetSortPrintDocPaymOrder(const Value: Word);
begin
  FSortPrintDocPaymOrder:=Value;
end;

procedure TGlobalAppStorage.SetAutoStopCloseApp(const Value: TStopEndCloseAppType);
begin
  FAutoStopCloseApp := Value;
end;

procedure TGlobalAppStorage.SetAutoStopAndCloseApp(const Value: Integer);
begin
  FAutoStopAndCloseApp := Value;
  AutoStopCloseApp.TimeStop:=FAutoStopAndCloseApp;
end;

procedure TGlobalAppStorage.SetLockAppTime(const Value: TDateTime);
begin
  FLockAppTime := Value;
end;

procedure TGlobalAppStorage.SetLockAppAttemptNumber(const Value: Word);
begin
  FLockAppAttemptNumber := Value; // счетчик попыток ввода пароля
  if FLockAppAttemptNumber>=CountFailedLoginsQ then
    LockAppTime:=Now();
end;

function TGlobalAppStorage.LockAppPasswFailedLogins: Boolean;
begin // блокировка программы при попытке подбора пароля на секретный ключ
  Result:=False;
  if (DisableAppTimeFailedLogins>0) and (ComplexPasswRulesLevel in [0,1,2,3]) and CountFailedLoginsBlock and CountFailedLogins then
  begin
    LockAppAttemptNumber:=LockAppAttemptNumber+1;
    Result:=GlobalAppStorage.LockAppAttemptNumber>=CountFailedLoginsQ;
  end;
end;

procedure TGlobalAppStorage.SetDisableAppTimeFailedLogins(const Value: Word);
begin
  if Value>300 then
    FDisableAppTimeFailedLogins := 300
  else
    FDisableAppTimeFailedLogins := Value;
end;

procedure TGlobalAppStorage.SetCountFailedLoginsQ(const Value: Word);
begin
  if Value<QUANTITY_OF_ATTEMPTS then
    FCountFailedLoginsQ := QUANTITY_OF_ATTEMPTS
  else FCountFailedLoginsQ := Value;
end;

procedure TGlobalAppStorage.SetDocCRValueDateValidPeriod(const Value: Word);
begin
  FDocCRValueDateValidPeriod := Value;
end;

function TGlobalAppStorage.GetDocCRValueDateValidPeriod: Word;
begin
  result := FDocCRValueDateValidPeriod;
  if result < 10 then
    result := 10;
end;

procedure TGlobalAppStorage.SetDocCRValueDateValid_Cur(const Value: Word);
begin
  FDocCRValueDateValid_Cur := Value;
end;

function TGlobalAppStorage.GetDocCRValueDateValid_Cur: Word;
begin
  result := FDocCRValueDateValid_Cur;
  if result < 10 then
    result := 10;
end;

procedure TGlobalAppStorage.SetIFOBSDisableStandartLogin(
  const Value: Boolean);
begin
  FIFOBSDisableStandartLogin := Value;
end;

procedure TGlobalAppStorage.SetNationalCurrencyUse(const Value: Boolean);
begin
  FNationalCurrencyUse := Value;
end;

procedure TGlobalAppStorage.SetIfobsMactokenCertificateUse(
  const Value: boolean);
begin
  FIfobsMactokenCertificateUse := Value;
end;

function TGlobalAppStorage.GetBankName: string;
begin
  if FBankName = '' then
    Result := FBankNameDefault
  else
    Result := FBankName;
end;

function TGlobalAppStorage.GetCertModeAlt: Integer;
begin
  Result := FCertModeAlt;
end;

function TGlobalAppStorage.GetIsExtKey: Boolean;
begin
  Result := FIsExtKey or FIsExtKeyCSK;
end;

initialization
  glGlobalAppStorage := nil;

finalization
  FreeAndNil(glGlobalAppStorage);

end.
