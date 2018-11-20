unit ReplPhoneAccountU;

interface

uses
  Forms,DB,ADODB,StdCtrls,Buttons,Controls,Classes,SysUtils,Windows,
  Graphics,MainU, uJSON, Dialogs;

type
  TErrorResponse = record
    error: Ansistring;
    code: Ansistring;
  end;

type
  TAuthUser = record
    id: WideString;
    userid: WideString;
    name: WideString;
    needchangepass: WideString;
  end;
type
  TAuthObject = record
    id: WideString;
    code: WideString;
    name: WideString;
    parent_id: WideString;
  end;
type
  TAuthResponse = record
    objects: array of TAuthObject;
    user: TAuthUser;
  end;

type
  TGr_prov_type = record
    id: string;
    name: string;
  end;
type
  TServiceData = record
    id: integer;
    name: string;
    code: string;
    mark: string;
    DefaultAmount: double;
    UpdateDate: string;
    IsDirectPay: boolean;
    Currency: integer;
    group: TGr_prov_type;
    provider: TGr_prov_type;
    ServiceType: TGr_prov_type;
    ImagePath: string;
    acctype: string;
    extratype: string;
    mask: string;
    sortIndex: integer;
    minamount: double;
    maxamount: double;
    keyboard: string;
    image: string;
  end;
type
  TServiceResponse = record
    Data: array of TServiceData;
  end;

type
  TAccountResponse = record
    status: string;
    description: string;
    providercode: integer;
    code: integer;
    service: string;
    limit: double;
    fee: double;
    currency: string;
    dpamount: string;
    dpcurrency: string;
    OrderGUID: string;
    providerid: integer;
  end;

type
  TCurrency = record
    id: string;
    name: string;
    short: string;
  end;
type
  TPortfolios = record
    amount: integer;
    limit: integer;
    currency: TCurrency;
  end;
type
  TBalanceResponse = record
    portfolios: array of TPortfolios;
  end;

type
  TColibry = record
    UserKey: widestring;
    UserName: widestring;
    Password: widestring;
    BaseURL: widestring;
    ObjectCode: widestring;
    pService: string;
    pAccType: string;
    pAmount: string;
    pAccount: string;
    pObject: string;
    pOrderGuid: string;
  end;

type
  TService = record
    id: integer;
  end;
type
  TOrderResponse = record
    status: string;
    description: string;
    code: integer;
    orderid: integer;
    createdate: string;
    transdate: string;
    payid: integer;
    amount: double;
    fee: double;
    account: string;
    acctype: string;
    name: string;
    service: TService;
  end;

type
  TStatusResponse = record
    status: string;
    description: string;
    code: integer;
    orderid: integer;
    payid: integer;
    receipt: integer;
    amount: double;
    currency: string;
    dpamount: double;
    dpcurrency: string;
    fee: double;
    createdate: string;
    transdate: string;
    account: string;
    acctype: string;
    service: TGr_prov_type;
  end;
type
   TNotifyChangePaySumEvent = procedure(Value : Currency) of object;
   TNotifyPayEvent = procedure(Value : Currency; Error : integer; var aClose : boolean) of object;
   NotChargedException = class(Exception);
   TransactRollbackException = class(Exception);
   PaymentWasCanceledException = class(Exception);
   PaymentInWaitException = class(Exception);
type
  TReplPhoneAccountF=class(TForm)
    Label3:TLabel;
    Label4:TLabel;
    edAccount:TEdit;
    edAmount:TEdit;
    btOK:TBitBtn;
    btCancel:TBitBtn;
    lbSum:TLabel;
    lbSurrender:TLabel;
    edSurrender:TEdit;
    lbPaySum:TLabel;
    edPaySum:TEdit;
    edSum:TEdit;
    qSaveReplenishment:TADOQuery;
    lbFee:TLabel;
    edFee:TEdit;
    Label5:TLabel;
    lbService:TLabel;
    btAccount:TBitBtn;
    QrEx:TADOQuery;
    lbChangeEdAmountByFee: TLabel;
    procedure FormCreate(Sender:TObject);
    procedure FormActivate(Sender:TObject);

    procedure edAccountEnter(Sender:TObject);
    procedure edAccountExit(Sender:TObject);
    procedure edAccountKeyDown(Sender:TObject;var Key:Word;Shift:TShiftState);
    procedure edAccountKeyPress(Sender:TObject;var Key:Char);
    procedure edAccountKeyUp(Sender:TObject;var Key:Word;Shift:TShiftState);
    procedure edAmountChange(Sender:TObject);
    procedure edAmountKeyDown(Sender:TObject;var Key:Word;Shift:TShiftState);
    procedure edAmountKeyPress(Sender:TObject;var Key:Char);
    procedure btAccountClick(Sender:TObject);
    procedure edSumChange(Sender:TObject);
    procedure edSumKeyDown(Sender:TObject;var Key:Word;Shift:TShiftState);
    procedure edSumKeyPress(Sender:TObject;var Key:Char);
    procedure btOKClick(Sender:TObject);
    procedure btCancelClick(Sender:TObject);
    procedure btAccountKeyDown(Sender:TObject;var Key:Word;Shift:TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edPaySumChange(Sender: TObject);

  private
    fOnChangePaySum: TNotifyChangePaySumEvent;
    FOnCancel : TNotifyEvent;
    fOnPayed  : TNotifyPayEvent;
    procedure AccountChange(Sender:TObject);
    function CreateColibry:boolean;
    function GetService(Account:string;out pType:string):string;
    function auth: boolean;
    function service: boolean;
    function ChkAccount(account:string):boolean;
    function FillAuthResponse(auth_res:ansistring): boolean;
//    procedure FillServiceResponse(service_resp:ansistring);
    function  FillServiceResponse(service_resp:ansistring): boolean;
    function Smart2Float(s:string;xDefault:double=0):double;
    function CheckAndTrimAccount(Account:string):string;
    procedure balance(var err:boolean);
    procedure FillBalanceResponse(balance_responce:ansistring);
    procedure genorderguid;
    procedure account(var err:boolean);
    procedure FillAccountResponce(Acc_responce:ansistring);
    function PrintChek(var CP:TChekPos):Boolean;
    procedure order(var err:boolean);
    procedure FillOrderResponse(ord_responce:ansistring);
    procedure status(var err:boolean);
    procedure FillStatusResponse(stat_responce:ansistring);
    procedure SaveTransferToDB(CP:TChekPos);
    function GetAmountSum: Currency;
    function GetFeeSum: Currency;
    procedure SetAmountSum(const Value: Currency);
    function GetCustomerSum: Currency;
    procedure SetCustomerSum(const Value: Currency);
    function GetPaySum: Currency;
    { Открытые члены класса }
    public
      lockCanChargeMessage : Boolean; // не выводить сообщение после успешной проверки пополнения мобильной связи
      procedure Clear;
      procedure ShowHidePaymentInformation(CanVisible:Boolean);
      property AmountSum : Currency read GetAmountSum write SetAmountSum;
      property CustomerSum : Currency read GetCustomerSum write SetCustomerSum;
      property FeeSum : Currency read GetFeeSum;
      property PaySum : Currency read GetPaySum;
      property OnChangePaySum : TNotifyChangePaySumEvent read fOnChangePaySum write fOnChangePaySum;
      property OnCancel : TNotifyEvent read FOnCancel write FOnCancel;
      property OnPayed : TNotifyPayEvent read fOnPayed write fOnPayed;

    public
      class function CheckAccess : boolean;
  end;

type
  TPhoneCodes_To_ServiceID = record
    PhoneCode: string;
    ServiceID: string;
    ProviderName: string;
    Color: TColor;
  end;

var
  ReplPhoneAccountF:TReplPhoneAccountF;
  Colibry: TColibry;
  ServiceResponse: TServiceResponse;
  AuthResponse: TAuthResponse;
  ErrorResponse: TErrorResponse;

  BalanceResponse: TBalanceResponse;
  AccountResponse: TAccountResponse;
  StatusResponse: TStatusResponse;
  OrderResponse: TOrderResponse;
  ChekOnly:Boolean;

const
  ACCOUNT_PLACE_HOLDER='+38 (___) ___-__-__';
  TEMP_FILE_PREFIX='~Ek'#0;
  PHONE_CODES_TO_SERVICE_ID: array[0..12] of TPhoneCodes_To_ServiceID = ((PhoneCode:'050';ServiceID:'927';ProviderName:'Vodafone';Color:clRed),//mts
                                                                       (PhoneCode:'066';ServiceID:'927';ProviderName:'Vodafone';Color:clRed),//mts
                                                                       (PhoneCode:'095';ServiceID:'927';ProviderName:'Vodafone';Color:clRed),//mts
                                                                       (PhoneCode:'099';ServiceID:'927';ProviderName:'Vodafone';Color:clRed),//mts
                                                                       (PhoneCode:'039';ServiceID:'929';ProviderName:'Kyivstar';Color:clBlue),//kyivstar
                                                                       (PhoneCode:'067';ServiceID:'929';ProviderName:'Kyivstar';Color:clBlue),//kyivstar
                                                                       (PhoneCode:'068';ServiceID:'929';ProviderName:'Kyivstar';Color:clBlue),//kyivstar
                                                                       (PhoneCode:'096';ServiceID:'929';ProviderName:'Kyivstar';Color:clBlue),//kyivstar
                                                                       (PhoneCode:'097';ServiceID:'929';ProviderName:'Kyivstar';Color:clBlue),//kyivstar
                                                                       (PhoneCode:'098';ServiceID:'929';ProviderName:'Kyivstar';Color:clBlue),//kyivstar
                                                                       (PhoneCode:'063';ServiceID:'926';ProviderName:'LifeCell';Color:clYellow),//life
                                                                       (PhoneCode:'073';ServiceID:'926';ProviderName:'LifeCell';Color:clYellow),//life
                                                                       (PhoneCode:'093';ServiceID:'926';ProviderName:'LifeCell';Color:clYellow) //life
                                                                      );
(*
//  PhoneCodes_To_ServiceID: array[1..13] of TPhoneCodes_To_ServiceID = ((PhoneCode:'050';ServiceID:'927';ProviderName:'Vodafone';Color:clRed),//mts
//                                                                       (PhoneCode:'066';ServiceID:'927';ProviderName:'Vodafone';Color:clRed),//mts
//                                                                       (PhoneCode:'095';ServiceID:'927';ProviderName:'Vodafone';Color:clRed),//mts
//                                                                       (PhoneCode:'099';ServiceID:'927';ProviderName:'Vodafone';Color:clRed),//mts
//                                                                       (PhoneCode:'039';ServiceID:'929';ProviderName:'Kyivstar';Color:clBlue),//kyivstar
//                                                                       (PhoneCode:'067';ServiceID:'929';ProviderName:'Kyivstar';Color:clBlue),//kyivstar
//                                                                       (PhoneCode:'068';ServiceID:'929';ProviderName:'Kyivstar';Color:clBlue),//kyivstar
//                                                                       (PhoneCode:'096';ServiceID:'929';ProviderName:'Kyivstar';Color:clBlue),//kyivstar
//                                                                       (PhoneCode:'097';ServiceID:'929';ProviderName:'Kyivstar';Color:clBlue),//kyivstar
//                                                                       (PhoneCode:'098';ServiceID:'929';ProviderName:'Kyivstar';Color:clBlue),//kyivstar
//                                                                       (PhoneCode:'063';ServiceID:'926';ProviderName:'LifeCell';Color:clYellow),//life
//                                                                       (PhoneCode:'073';ServiceID:'926';ProviderName:'LifeCell';Color:clYellow),//life
//                                                                       (PhoneCode:'093';ServiceID:'926';ProviderName:'LifeCell';Color:clYellow) //life
//                                                                      );
//  Intertelecom_Array: string[4] = '094';
//  PeopleNet_Array: string[4] = '092';
//  TriMob_Utel_Array: string[4] = '091';
*)

implementation

uses
  DataModuleU,Util, EKKAU, ShareU, StrUtils
  ;
//  ReplConnectionEditU;

function CreateColibryAPI(TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt): boolean; stdcall;external'ColibryDLL.dll';
function AUTH_Request(TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt): boolean; stdcall; external 'ColibryDLL.dll';
//function AUTH_Request(TmpPath: PAnsiChar; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt): boolean; stdcall; external 'ColibryDLL.dll';
{  procedure AUTH_Request(pUserKey   :   PAnsiChar;
                         pUserName  :   PAnsiChar;
                         pPassword  :   PAnsiChar;
                         pBaseURL   :   PAnsiChar;
                         TmpPath    :   ansistring;
                         TmpFile    :   ansistring;
                         TmpPathLen :   LongInt;
                         TmpFileLen :   LongInt;
                         IsError    :   boolean = false); stdcall; external 'ColibryDLL.dll';}

//procedure SERVICE_Request(pUserKey: widestring; pUserName: widestring; pPassword: widestring; pObject: widestring; pBaseURL: widestring; TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt; IsError: boolean = false); stdcall; external 'ColibryDLL.dll';
function SERVICE_Request(pObject: widestring; TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt): boolean; stdcall; external 'ColibryDLL.dll';

procedure BALANCE_Request(pUserKey: widestring; pUserName: widestring; pPassword: widestring; pObject: widestring; pBaseURL: widestring; TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt; IsError: boolean = false); stdcall; external 'ColibryDLL.dll';
procedure GenerateOrderGUID(TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt); stdcall; external 'ColibryDLL.dll';
//procedure ACCOUNT_Request(pUserKey: WideString; pUserName: WideString; pPassword: WideString; pObject: WideString; pBaseURL: WideString; pAccount: WideString; pAccType: WideString; pAmount: WideString; pService: WideString; pOrderGuid: ansistring; TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt; IsError: boolean = false); stdcall; external 'ColibryDLL.dll';
procedure ACCOUNT_Request({pUserName: WideString; pPassword: WideString; pBaseURL: WideString;}
                          pUserKey: WideString;
                          pObject: WideString;
                          pAccount: WideString;
                          pAccType: WideString;
                          pAmount: WideString;
                          pService: WideString;
                          pOrderGuid: ansistring;
                          TmpPath: ansistring;
                          TmpFile: ansistring;
                          TmpPathLen: LongInt;
                          TmpFileLen: LongInt;
                          IsError: boolean = false); stdcall; external 'ColibryDLL.dll';
procedure ORDER_Request(pUserKey: WideString; pUserName: WideString; pPassword: WideString; pObject: WideString; pBaseURL: WideString; pAccount: WideString; pAccType: WideString; pAmount: WideString; pService: WideString; pOrderGuid: ansistring; TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt; IsError: boolean = false); stdcall; external 'ColibryDLL.dll';
procedure STATUS_Request(pUserKey: widestring; pUserName: widestring; pPassword: widestring; pObject: widestring; pBaseURL: widestring; pOrderGUID: ansistring; TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt; IsError: boolean = false); stdcall; external 'ColibryDLL.dll';

{$R *.dfm}

(*----------------------------------------------------------------------------*)
procedure TReplPhoneAccountF.FormCreate(Sender:TObject);
var
  cr:TCursor;
  prmF: TextFile;
begin
  lockCanChargeMessage := False;
  try
    try
      cr:=Screen.Cursor;
      Screen.Cursor:=crHourGlass;

      BorderStyle:=bsDialog;
      Caption:=MFC;
      Position:=poMainFormCenter;

      edAccount.Text:=ACCOUNT_PLACE_HOLDER;
      edAmount.Text:='0';
      edFee.Text:='0';
      edPaySum.Text:='0';
      edSum.Text:='0';
      edSurrender.Text:='0';
      AccountChange(sender);
{
  //1. Подготовить редактируемые поля:
  //1.1. Очистить поля редактирования либо выставить дефолтные значения
  //1.2. Заполнить справочники, установить дефолтные значения

    //1. Проверить заполнение полей UserKey, UserName, Password, BaseURL
    //2. Если одно из полей UserName, Password, BaseURL пустое - предложить заполнить значения. Для UserKey - сгенерировать новый ключ
    if not CreateColibry then
      ReplPhoneAccountF.Close;
}

      //проверить парамметры подключения
      with TADOQuery.Create(self) do
      begin
        Connection:=DM.ADOCo;

        Close;
        SQL.Clear;
        SQL.Add('select terminal_id,terminal_user_name,terminal_pass,isactive,userkey,userkey_service from SprPhoneReplenishments where id_apteka='+IntToStr(Prm.AptekaID)+' and id_kassa='+IntToStr(Opt.KassaID)+' and isnull(IsActive,0)=1');
        Open;

        Prm.c_code:=FieldByName('terminal_id').AsString;
        Prm.c_username:=FieldByName('terminal_user_name').AsString;
        Prm.c_userpass:=FieldByName('terminal_pass').AsString;
        if not FieldByName('userkey_service').IsNull then
          Prm.userkey := FieldByName('userkey_service').AsString
        else
        begin
          genorderguid;
          Prm.userkey := Colibry.pOrderGuid;
          with TADOQuery.Create(self) do
          begin
            try
              Connection:=DM.ADOCo;
              SQL.Clear;
              SQL.Add('update SprPhoneReplenishments set userkey_service = '''+Prm.userkey+''' where id_apteka='+IntToStr(Prm.AptekaID)+' and id_kassa='+IntToStr(Opt.KassaID)+' and isnull(IsActive,0)=1');
              ExecSQL;
            finally
              Free;
            end;
          end;
        end;
        Close;
        SQL.Clear;
        SQL.Add('select * from SPR_CONST where DESCR = ''baseurl''');
        Open;
        Prm.baseurl:=FieldByName('Value').AsString;
      end;

      if trim(Prm.baseurl)='' then
        raise Exception.Create('Не указан URL подключения к сервису пополнения счета')
      else if trim(Prm.c_code)='' then
        raise Exception.Create('Не указан идентификатор пользователя сервиса пополнения счета')
      else if trim(Prm.c_username)='' then
        raise Exception.Create('Не указан пользователь сервиса пополнения счета')
      else if trim(Prm.c_userpass)='' then
        raise Exception.Create('Не указан пароль пользователя сервиса пополнения счета')
      else if trim(Prm.userkey)='' then
        raise Exception.Create('Не указан ключ идентификатора пользователя сервиса пополнения счета');

      ChekOnly:=False;

    //1. Проверить наличие файликов с параметрами подключения, при необходимости создать
    DeleteFile(PChar(ExtractFileDir(Application.ExeName)+'\baseurl'));
    if Not FileExists('baseurl') then
    begin
      AssignFile(prmF,ExtractFilePath(Application.ExeName)+'baseurl');
      Rewrite(prmF);
      CloseFile(prmF);
      Append(prmF);
      writeln(prmF,Prm.baseurl);
      CloseFile(prmF);
    end;

    DeleteFile(PChar(ExtractFileDir(Application.ExeName)+'\userkey'));
    if not FileExists('userkey') then
    begin
      AssignFile(prmF,ExtractFilePath(Application.ExeName)+'userkey');
      Rewrite(prmF);
      CloseFile(prmF);
      Append(prmF);

      Prm.userkey:=Prm.userkey; //'{BB3903E3-E395-42C7-87F0-06BFC8E5D3EC}';
      writeln(prmF,prm.userkey);
      CloseFile(prmF);
    end;

    DeleteFile(PChar(ExtractFileDir(Application.ExeName)+'\username'));
    if not FileExists('username') then
    begin
      AssignFile(prmF,ExtractFilePath(Application.ExeName)+'username');
      Rewrite(prmF);
      CloseFile(prmF);
      Append(prmF);

      writeln(prmF,prm.c_username);
      CloseFile(prmF);
    end;

    DeleteFile(PChar(ExtractFileDir(Application.ExeName)+'\userpass'));
    if not FileExists('userpass') then
    begin
      AssignFile(prmF,ExtractFilePath(Application.ExeName)+'userpass');
      Rewrite(prmF);
      CloseFile(prmF);
      Append(prmF);

      writeln(prmF,prm.c_userpass);
      CloseFile(prmF);
    end;

    DeleteFile(PChar(ExtractFileDir(Application.ExeName)+'\objcode'));
    if not FileExists('objcode') then
    begin
      AssignFile(prmF,ExtractFilePath(Application.ExeName)+'objcode');
      Rewrite(prmF);
      CloseFile(prmF);
      Append(prmF);

      writeln(prmF,prm.c_code);
      CloseFile(prmF);
    end;

      edAccount.OnChange:=AccountChange;
    //3. Проверить возможность авторизации на сервисе Colibry
      if not auth then
        raise Exception.Create('Не могу подключиться к сервису пополнения!');
    //4. При удачной авторизации заполнить справочник доступных объектов (терминалов)
    //5. Получить список доступных услуг (сервисов)
    //6. Проверить наличие справочников в БД. При необходимости создать необходимые таблицы
    //7. Проверить заполнение справочников услуг (сервисов), при необходимости дополнить или обновить
    except
      on E:Exception do
      begin
        MainF.MessBox('При инициализации параметров подключения к сервису пополнения возникла ошибка:'+#13+
          E.Message+#13+
          'Обратитесь в IT-отдел',16);
        Close;
      end;
    end;
  finally
    Screen.Cursor:=cr;
  end;
end;

procedure TReplPhoneAccountF.FormActivate(Sender:TObject);
var
  cr:TCursor;
begin
  //1. Подготовить редактируемые поля:
  //1.1. Очистить поля редактирования либо выставить дефолтные значения
  //1.2. Заполнить справочники, установить дефолтные значения
  try
    cr:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;
  finally
    Screen.Cursor:=cr;
    edAccount.SetFocus;
  end;
end;


procedure TReplPhoneAccountF.AccountChange(Sender:TObject);
begin
  lbService.Caption:='';
  lbService.Font.Color:=clWindowText;
  lbService.Color:=clWhite;
  edFee.Text:='0';
//  edAmount.Text:='0';
  edPaySum.Text:='0';
  Application.ProcessMessages;

  ShowHidePaymentInformation(false);
  Application.ProcessMessages;
end;


procedure TReplPhoneAccountF.ShowHidePaymentInformation(CanVisible:Boolean);
begin
  lbFee.Visible:=CanVisible;
  edFee.Visible:=CanVisible;
  lbPaySum.Visible:=CanVisible;
  edPaySum.Visible:=CanVisible;
  lbSum.Visible:=CanVisible;
  edSum.Visible:=CanVisible;
  lbSurrender.Visible:=CanVisible;
  edSurrender.Visible:=CanVisible;
  btOK.Visible:=CanVisible;
end;

function TReplPhoneAccountF.CreateColibry:boolean;
var
  TmpPathLength:cardinal;
  TmpPath,TmpFile:ansistring;
  TmpPathLen,TmpFileLen:LongInt;
  tmpF:TextFile;
  APIRslt:ansistring;
  cr:TCursor;
begin
  try
    cr:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;

    Result:=false;

    try
      TmpPathLength:=GetTempPath(0,PAnsiChar(TmpPath));
      SetLength(TmpPath,TmpPathLength);
      GetTempPath(TmpPathLength,PAnsiChar(TmpPath));
      SetLength(TmpFile,TmpPathLength+10);
      GetTempFileName(PAnsiChar(TmpPath),PAnsiChar(TEMP_FILE_PREFIX),0,PAnsiChar(TmpFile));
      TmpPathLen:=length(TmpPath);
      TmpFileLen:=length(TmpFile);

      try
        if FileExists(TmpFile) then
        begin
          AssignFile(tmpF,TmpFile);
          Rewrite(tmpF);
          APIRslt:='{';
          APIRslt:=APIRslt+'"baseurl":"'+Prm.baseurl+'",';
          APIRslt:=APIRslt+'"ObjectCode":"'+Prm.c_code+'",';
          APIRslt:=APIRslt+'"UserName":"'+Prm.c_username+'",';
          APIRslt:=APIRslt+'"UserPass":"'+Prm.c_userpass+'",';
          APIRslt:=APIRslt+'"UserKey":"'+Prm.userkey+'"';
          APIRslt:=APIRslt+'}';
          Write(tmpF,APIRslt);
          CloseFile(tmpF);
       end;

      try
        if not CreateColibryAPI(TmpPath,TmpFile,TmpPathLen,TmpFileLen) then
          raise Exception.Create('Произошла ошибка при подключаении к библиотеке');
      except
        on E:Exception do
          raise Exception.Create('Произошла ошибка при подключаении к библиотеке: '+E.Message);
      end;

       Colibry.UserKey:=Prm.userkey;
       Colibry.UserName:=Prm.c_username;
       Colibry.Password:=Prm.c_userpass;
       Colibry.BaseURL:=Prm.baseurl;
       Colibry.ObjectCode:=Prm.c_code;

       if (trim(Colibry.UserKey)='')or
          (trim(Colibry.UserName)='')or
          (trim(Colibry.Password)='')or
          (trim(Colibry.BaseURL)='')or
          (trim(Colibry.ObjectCode)='')
       then
         raise Exception.Create('Один из параметров подключения к сервису пополнения отсутствует.');
//
//      if (trim(Colibry.UserKey)='')or(trim(Colibry.UserName)='')or(trim(Colibry.Password)='')or(trim(Colibry.BaseURL)='') then
//      begin
//        //if MainF.MessBox('Вы не можете подключиться к удаленному сервису пополнения!'+#13+
//        //              'Вы хотите заполнить параметры для подключения к сервису пополнения?',36) <> ID_YES then
//        //begin
//          MainF.MessBox('Вы не можете осуществлять услугу '+#13+
//                        'пополнения счета мобильных телефонов!'+#13+
//                        'Для активации услуги пополнения '+#13+
//                        'заполните параметры подключения к сервису пополнения.'+#13+
//                        'За дополнительными параметрами обратитесь в IT-отдел'+#13+
//                        'по телефону горячей линии.',16);
//          Self.Close;
//          DeleteFile(PAnsiChar(TmpFile));
//          Result:=false;
//          Exit;
//        //end
//        //else
//        //begin
//        //  showmessage('Реализовать форму заполнения параметров подключения к сервису.'+#13+'Для UserKey открыть форму редактирования параметров и сгенерировать GUID приложения'+#13+'форма ReplConnectionEditF'+#13+'вызов из function CreateColibry: boolean;');
//        //end;
//      end;
      finally
        Result:=true;
        DeleteFile(PAnsiChar(TmpFile));
      end;
    except
      on E:Exception do
      begin
        Result:=false;
        MainF.MessBox('При инициализации параметров подключения к сервису пополнения возникла ошибка:'+#13+
          E.Message+#13+
          'Обратитесь в IT-отдел',16);
      end;
    end;
  finally
    Screen.Cursor:=cr;
  end;
end;
(*----------------------------------------------------------------------------*)

procedure TReplPhoneAccountF.edAccountEnter(Sender:TObject);
begin
  EditEnter(Sender);
end;

procedure TReplPhoneAccountF.edAccountExit(Sender:TObject);
begin
  //проверить правильность ввода номера телефона для пополнения
  if not ChkAccount(edAccount.Text) then
  begin
    edAccount.SetFocus;
    edAccount.Text:=ACCOUNT_PLACE_HOLDER;
    edAccount.Hint:='';
    exit;
  end;

  //5. Попытаться определить тип пополнения. При не возможности определить тип пополнения - предложить указать вручную
  Colibry.pService:=GetService(edAccount.Text,Colibry.pAccType);
end;

procedure TReplPhoneAccountF.edAccountKeyDown(Sender:TObject;var Key:Word;Shift:TShiftState);
begin
  EditKeyUp(Sender,Key,Shift);
  if Key=VK_RETURN then
    edAmount.SetFocus
  else if Key=VK_ESCAPE then
    btCancelClick(sender);
end;

procedure TReplPhoneAccountF.edAccountKeyPress(Sender:TObject;var Key:Char);
begin
  EditKeyPress(Sender,Key);
end;

procedure TReplPhoneAccountF.edAccountKeyUp(Sender:TObject;var Key:Word;Shift:TShiftState);
begin
  EditKeyUp(Sender,Key,Shift);
end;

procedure TReplPhoneAccountF.edAmountChange(Sender:TObject);
begin
  edPaySum.Text:='0';
  edFee.Text:='0';
  edSum.Text:='0';

  ShowHidePaymentInformation(false);
  Application.ProcessMessages;
end;

procedure TReplPhoneAccountF.edAmountKeyDown(Sender:TObject;var Key:Word;Shift:TShiftState);
begin
  try
    Colibry.pAmount:=CurrToStr(StrToCurr(edAmount.Text)*100);
  except
    edAmount.Text:='0';
    edFee.Text:='0';
    edAmount.SelectAll;
    edAmount.SetFocus;
    Colibry.pAmount:='0';
  end;
(*
  if (Key = VK_RETURN) and (edPaySum.Visible) then edPaySum.SetFocus;// else btAccount.SetFocus;
*)
  if Key=VK_RETURN then
    btAccount.SetFocus
  else if Key=VK_ESCAPE then
    btCancelClick(sender);
end;

procedure TReplPhoneAccountF.edAmountKeyPress(Sender:TObject;var Key:Char);
var
  P:Integer;
begin
  if Key=',' then Key:='.';
  if Key <> chr(VK_BACK) then
  begin
    if Not (Key in ['0'..'9']+['.']) then Key:=#0;
    P:=Pos('.',TEdit(Sender).Text);
    if P <> 0 then
    begin
      if (Key='.') or ((Length(TEdit(Sender).Text) > P+1) and (TEdit(Sender).SelStart >= P)) then Key:=#0;
    end;
  end;
end;

procedure TReplPhoneAccountF.btAccountClick(Sender:TObject);
var
  cr: TCursor;
  F_Error: boolean;
  amount: double;
  i: integer;
  BalanceCurrency, BalanceValue: string;
begin
  lbChangeEdAmountByFee.Visible := False;
  try
    cr:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;

    try
      StrToFloat(edAmount.Text);
    except
      edAmount.SetFocus;
      edAmount.Text:='0';
      exit;
    end;

    try
      //III Пополнение счета

      //1. Проверить возможность авторизации и получить список доступных объектов (auth)
      if not auth then
        raise Exception.Create('Не могу подключиться к сервису пополнения!');

      //2. Получить список услуг (service)
      if not service then
        raise Exception.Create('Не могу получить список доступных услуг!');

      //3. Проверить правильность ввода номера абонента
      Colibry.pAccount:=CheckAndTrimAccount(edAccount.Text);
      if Length(Trim(Colibry.pAccount)) <> 10 then
      begin
        edAccount.Text:=ACCOUNT_PLACE_HOLDER;
        edAccount.Hint:='';
        lbService.Caption:='';
        lbService.Font.Color:=clWindowText;
        edAccount.SetFocus;
        //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
        ShowHidePaymentInformation(false);
        Application.ProcessMessages;
        raise Exception.Create('Номер телефона для пополнения введен не верно!'+#13+'Проверьте правильность ввода номера телефона!');
        Exit;
      end;

      //4. Попытаться определить сервис (услугу). при не возможности определить сервис (услугу) - предложить указать вручную
      //showmessage('добавить возможность выбора сервиса вручную. выбор из нового окна. вызов из TReplPhoneAccountF.edAmountExit');

      //5. Попытаться определить тип пополнения. При не возможности определить тип пополнения - предложить указать вручную
      Colibry.pService:=GetService(edAccount.Text,Colibry.pAccType);
      //showmessage('добавить возможность выбора типа пополнения. выбор из нового окна. вызов из TReplPhoneAccountF.edAmountExit');

      try
        StrToCurr(edAmount.Text);
      except
        edAmount.Text:='0';
        edFee.Text:='0';
        edAccount.SetFocus;
        edAmount.SetFocus;
        edAmount.SelectAll;
        //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
        ShowHidePaymentInformation(false);
        Application.ProcessMessages;
        exit;
      end;

      if edAmount.Text='0' then
      begin
        edAmount.Text:='0';
        edFee.Text:='0';
        edAccount.SetFocus;
        edAmount.SetFocus;
        edAmount.SelectAll;
        //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
        ShowHidePaymentInformation(false);
        Application.ProcessMessages;
        exit;
      end;
      Colibry.pAmount:=CurrToStr(StrToCurr(edAmount.Text)*100);

      //6. Проверить баланс портфеля
      balance(F_Error);
      if F_Error then
      begin
        edAccount.SetFocus;
        //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
        ShowHidePaymentInformation(false);
        Application.ProcessMessages;
        raise Exception.Create('Не настроены параметры подключения!'+#13+
                               'Настройте параметры подключения'+#13+
                               'и повторите попытку пополнения!'+#13+
                               'За дополнительной информацией обратитесь в IT-отдел!');
        exit;
      end;

      //7. Проверить возможность пополнения счета (аккаунта)
      //7.1. Сгенерировать OrderGUID
      genorderguid;

      //7.2. Проверить, что сумма пополнения не больше доступного баланса
      amount:=StrToFloat(edAmount.Text)*100;
      for i:=0 to Length(BalanceResponse.portfolios)-1 do
      begin
        if BalanceResponse.portfolios[i].currency.id='980' then
        begin
          if amount > BalanceResponse.portfolios[i].limit then
          begin
            edAmount.Text:=FloatToStr(BalanceResponse.portfolios[i].limit/100);
            edAccount.SetFocus;
            edAmount.SetFocus;
            edAmount.SelectAll;
            //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
            ShowHidePaymentInformation(false);
            Application.ProcessMessages;
            raise Exception.Create('Досутпный баланс для пополнения '+FloatToStr(BalanceResponse.portfolios[i].limit/100)+' '+BalanceResponse.portfolios[i].currency.short
                  +#13+'Сумма, на которую Вы хотите пополнить счет'
                  +#13+'больше доступного баланса!'
                  +#13+'Уменьшите сумму пополнения и повторите попытку!'
                  +#13+'При повторной ошибке обратитесь в IT-отдел за консультацией!');
            exit;
          end;
        end
      end;

      //7.3. Отправить запрос проверки возможности пополнения
      account(F_Error);
      if F_Error then
      begin
        edAccount.SetFocus;
        //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
        ShowHidePaymentInformation(false);
        Application.ProcessMessages;
        raise Exception.Create('Не настроены параметры подключения!'+#13+
                               'Настройте параметры подключения'+#13+
                               'и повторите попытку пополнения!'+#13+
                               'За дополнительной информацией обратитесь в IT-отдел!');
        exit;
      end;

      //7.4. При положительном ответе от сервиса - уведомить, что пополнение возможно и указать сумму к оплате
      //7.5. При отрицательном ответе от сервиса - уведомление о не возможности пополнить на весь экран!
      if LowerCase(AccountResponse.status) = 'o' then
      begin
        edFee.Text:=FloatToStr(AccountResponse.fee/100);
        edPaySum.Text:=FloatToStr((StrToFloat(AccountResponse.dpamount)+AccountResponse.fee)/100);
        edSum.Text:=edPaySum.Text;

        //показать комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
        ShowHidePaymentInformation(true);
        Application.ProcessMessages;

        edSum.SetFocus;
        Application.ProcessMessages;

        if Length(BalanceResponse.portfolios) > 0 then
        begin
          for i:=0 to length(BalanceResponse.portfolios)-1 do
          begin
            if BalanceResponse.portfolios[i].currency.id='980' then
            begin
              BalanceCurrency:=BalanceResponse.portfolios[i].currency.short;
              BalanceValue:=FloatToStr(BalanceResponse.portfolios[i].amount/100);
            end;
          end;
          if not lockCanChargeMessage then
            MainF.MessBox('Пополнение возможно!'+#13+
                        'Номер для пополнения: '+edAccount.Text+#13+
                        'Сумма пополнения: '+edAmount.Text+' '+BalanceCurrency+#13+
                        'Введите сумму полученную от покупателя и выполните пополнение!',16);
        end
        else
          if not lockCanChargeMessage then
            MainF.MessBox('Пополнение возможно!'+#13+
                        'Номер для пополнения: '+edAccount.Text+#13+
                        'Сумма пополнения: '+edAmount.Text+#13+
                        'Введите сумму полученную от покупателя и выполните пополнение!',64);
        edSum.Text:=edPaySum.Text;
        edSum.SetFocus;
        Application.ProcessMessages;
      end
      else
      begin
        if F_Error then
        begin
          if Length(BalanceResponse.portfolios) > 0 then
          begin
            for i:=0 to length(BalanceResponse.portfolios)-1 do
            begin
              if BalanceResponse.portfolios[i].currency.id='980' then
              begin
                BalanceCurrency:=BalanceResponse.portfolios[i].currency.short;
                BalanceValue:=FloatToStr(BalanceResponse.portfolios[i].amount/100);
              end;
            end;
            raise Exception.Create('Пополнение не возможно!'+#13+
                                   'Номер для пополнения: '+edAccount.Text+#13+
                                   'Сумма пополнения: '+edAmount.Text+' '+BalanceCurrency+#13+
                                   'Доступный баланс: '+BalanceValue+' '+BalanceCurrency+#13+
                                   'За дополнительной информацией обратитесь в IT-отдел!');
          end
          else
            raise Exception.Create('Пополнение не возможно!'+#13+
                                   'Номер для пополнения: '+edAccount.Text+#13+
                                   'Сумма пополнения: '+edAmount.Text+#13+
                                   'За дополнительной информацией обратитесь в IT-отдел!');
          //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
          ShowHidePaymentInformation(false);
          Application.ProcessMessages;
        end
        else
        begin
          if Length(BalanceResponse.portfolios) > 0 then
          begin
            for i:=0 to length(BalanceResponse.portfolios)-1 do
            begin
              if BalanceResponse.portfolios[i].currency.id='980' then
              begin
                BalanceCurrency:=BalanceResponse.portfolios[i].currency.short;
                BalanceValue:=FloatToStr(BalanceResponse.portfolios[i].amount/100);
              end;
            end;
            MainF.MessBox('Пополнение возможно!'+#13+
                          'Номер для пополнения: '+edAccount.Text+#13+
                          'Сумма пополнения: '+edAmount.Text+' '+BalanceCurrency+#13+
                          'Введите сумму полученную от покупателя и выполните пополнение!');
          end
          else
            MainF.MessBox('Пополнение возможно!'+#13+
                          'Номер для пополнения: '+edAccount.Text+#13+
                          'Сумма пополнения: '+edAmount.Text+#13+
                          'Введите сумму полученную от покупателя и выполните пополнение!');
        end;
      end;

    except
      on E:Exception do
      begin
        ShowHidePaymentInformation(false);
        Application.ProcessMessages;
        MainF.MessBox('При проверке возможности пополнения счета возникла ошибка'+#13+E.Message,16);
      end;
    end;
  finally
    Screen.Cursor:=cr;
  end;
end;

procedure TReplPhoneAccountF.edSumChange(Sender:TObject);
begin
  edSurrender.Text:=FloatToStr(StrToFloat(edSum.Text)-StrToFloat(edPaySum.Text));
end;

procedure TReplPhoneAccountF.edSumKeyDown(Sender:TObject;var Key:Word;Shift:TShiftState);
begin
(*
  if key = VK_RETURN then btOK.SetFocus;
*)
  if Key=VK_RETURN then
  begin
    if btOK.Visible then btOK.SetFocus;
  end
  else if Key=VK_ESCAPE then
      btCancelClick(sender);
end;

procedure TReplPhoneAccountF.edSumKeyPress(Sender:TObject;var Key:Char);
var
  P:Integer;
begin
  if Key=',' then Key:='.';
  if Key<>chr(VK_BACK) then
  begin
    if Not (Key in ['0'..'9']+['.']) then Key:=#0;
    P:=Pos('.',TEdit(Sender).Text);
    if P<>0 then
    begin
      if (Key='.') or ((Length(TEdit(Sender).Text)>P+1) and (TEdit(Sender).SelStart>=P)) then Key:=#0;
    end;
  end;
end;

procedure TReplPhoneAccountF.btOKClick(Sender:TObject);
var
  cr: TCursor;
  CP: TChekPos;
  F_Error: boolean;
  ErrorCode : integer;
  IsExit : boolean;
{
  amount: double;
  i: integer;
  BalanceCurrency, BalanceValue: string;
}
begin
{$IFDEF PAYMENTEMULATE}
  OrderResponse.status := 'c';
{$ENDIF}
  ErrorCode := 0;
  IsExit := False;
  try
    cr:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;

    try
      //7. При положительном результате проверки пополнения счета (аккаунта)
      //7.1. проверить, что полученая сумма больше или равна сумме к оплате

      //проверить правильность ввода номера телефона для пополнения
      if not ChkAccount(edAccount.Text) then
      begin
        edAccount.SetFocus;
        edAccount.Text:=ACCOUNT_PLACE_HOLDER;
        edAccount.Hint:='';
        ShowHidePaymentInformation(false);
        Application.ProcessMessages;
        exit;
      end;

      if ChekOnly then
      begin
        if PrintChek(CP) then Close;
        Exit;
      end;

      F_Error:=false;

      if StrToFloat(edSum.Text) < StrToFloat(edPaySum.Text) then
      begin
        MainF.MessBox('Сумма, полученая от покупателя'
               +#13'меньше суммы пополнения с учетом комиссий!'
               +#13+'Проверьте, что сумма полученая от покупателя'
               +#13+'больше или равна сумме к оплате'
               +#13+'и повторите попытку!'
               +#13+'За дополнительной, при необходимости, информацией обратитесь в IT-отдел',16);
        edSum.SetFocus;
        edSum.SelectAll;
        Exit;
      end;


      //7.2. пополнить счет без дополнительных вопросов пользователю
{$IFNDEF  PAYMENTEMULATE}
      order(F_Error);
{$ENDIF}
      if F_Error then
      begin
        edAccount.SetFocus;
        //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
        ShowHidePaymentInformation(false);
        Application.ProcessMessages;
        raise Exception.Create('Не настроены параметры подключения!'+#13+
                               'Настройте параметры подключения'+#13+
                               'и повторите попытку пополнения!'+#13+
                               'За дополнительной информацией обратитесь в IT-отдел!');
        exit;
      end;

      //7.3. после распаршивания ответа после пополнения, убедиться, что не было ошибки в процесссе пополнения (status = "E" | " " | "R").
      //     При отрицательном ответе (не возможности пополнить счет) - уведомление об ошибке на весь экран
      if (LowerCase(OrderResponse.status)='e')or(LowerCase(OrderResponse.status)='r')or(trim(OrderResponse.status)='') then
      begin
        if MessageDlg('Во время выполнения операции пополнения счета '
                 +#13+'произошла ошибка и счет не был пополнен!'
                 +#13+'Ответ от сервиса пополнения: '
                 +#13+'"'+OrderResponse.description+'"'
                 +#13+'Код ошибки: '+IntToStr(OrderResponse.code)
                 +#13+'Хотите повторить пополнение счета?'+#13+'(Нажатие на кнопку [Нет] или [NO] отменит транзакцию)',mtError,[mbYes,mbNo],0)=mrYes then
        begin
          edAmount.SetFocus;
          exit;
        end
        else
        begin
          //добавить проверку пополнения счета и при отрицательном ответе показать ошибку
          status(F_Error);
          if F_Error then
          begin
            //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
            ShowHidePaymentInformation(false);
            Application.ProcessMessages;
            raise Exception.Create('Транзакция отменена!'+#13+'Счет пополнен не был!');
          end;
        end;
      end;

      //7.4. если ответ от сервера - платеж в процессе проведения (status = "W") - проверить статус пополнения
      if LowerCase(OrderResponse.status)='w' then
      begin
        status(F_Error);
        if F_Error then
        begin
          //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
          ShowHidePaymentInformation(false);
          Application.ProcessMessages;
          ErrorCode := -2;
          raise Exception.Create('Транзакция отменена!'+#13+'Счет пополнен не был!');
        end;
      end;

      //7.10. Распечатать чек
{$IFNDEF  PAYMENTEMULATE}
      if PrintChek(CP)=False then
      begin
        ChekOnly:=True;
        Exit;
      end;
{$ENDIF}
      //7.5. При положительном ответе (удачном пополнении, status = "C") - уведомить, что пополнение прошло успешно
      if (LowerCase(OrderResponse.status)='c')or(LowerCase(StatusResponse.status)='c') then
      begin
        //7.9. Записать данные о трансфере в БД
        SaveTransferToDB(CP);
        if Assigned(fOnPayed) then
        begin
          FOnPayed(PaySum, 0, IsExit);
          if IsExit then
          begin
            ShowHidePaymentInformation(false);
            AmountSum := 0;
            Exit;
          end;
        end;
        if MessageDlg('Счет успешно пополнен!'
                 +#13+'Вы хотите пополнить еще один номер телефона?'
                 +#13+'(нажатие на кнопку "[NO]" или "[НЕТ]" закроет окно для пополнения).',mtConfirmation,[mbYes,mbNo],0)=mrYes then
        begin
          with Self do
          begin
            ChekOnly:=False;
            edAccount.Text:=ACCOUNT_PLACE_HOLDER;
            edAccount.Hint:='';
            lbService.Caption:='';
            lbService.Font.Color:=clWindowText;
            edAmount.Text:='0';
            edFee.Text:='0';
            edPaySum.Text:='0';
            edSum.Text:='0';
            edSurrender.Text:='0';
            edAccount.SetFocus;
            //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
            ShowHidePaymentInformation(false);
            Application.ProcessMessages;
          end;
          edAccount.SetFocus;
        end
        else
          Self.Close;
      end;

      //7.6. При отсутствии ответа от сервера или по таймауту - запросить статус пополнения (F_Error)
      //     при отрицательном ответе на проверку статуса (счет не был пополнен) - предложить повторить операцию
      if F_Error then
      begin
        status(F_Error);

        if LowerCase(StatusResponse.status)='e' then
        begin
          ErrorCode := -1;
          raise Exception.Create('Счет не был пополнен!'+#13+
                                 'Ошибка: '+IntToStr(StatusResponse.code)+' '+StatusResponse.description);
        end
        else
        begin
          ErrorCode := -2;
          if LowerCase(StatusResponse.status)='r' then
            raise Exception.Create('Транзакция аннулирована!'+#13+
                                   'Ответ: '+IntToStr(StatusResponse.code)+' '+StatusResponse.description)
          else
          begin
            ErrorCode := -3;
            if trim(StatusResponse.status)='' then
              raise Exception.Create('Платеж отменен или не найден!'+#13+
                                     'Ответ: '+IntToStr(StatusResponse.code)+' '+StatusResponse.description)
            else
            begin
              ErrorCode := 2;
              if LowerCase(StatusResponse.status)='w' then
                raise Exception.Create('Платеж в процессе проведения!'+#13+
                                       'Ответ: '+IntToStr(StatusResponse.code)+' '+StatusResponse.description)
              else
              begin
                ErrorCode := 1;
                if LowerCase(StatusResponse.status)='c' then
                  MainF.MessBox('Платеж успешно проведен!'+#13+
                                'Ответ: '+IntToStr(StatusResponse.code)+' '+StatusResponse.description);
                  if Assigned(fOnPayed) then
                  begin
                    FOnPayed(PaySum, ErrorCode, IsExit);
                    if IsExit then
                    begin
                      ShowHidePaymentInformation(false);
                      AmountSum := 0;
                      Exit;
                    end;
                  end;
              end;
            end;
          end;
        end;
      end;

    except
      on E:Exception do
        MainF.MessBox('Во время пополнения счета возникла ошибка '+E.Message,16);
    end;
  finally
    Screen.Cursor:=cr;
  end;
{
    try
      StrToFloat(edAmount.Text);
    except
      edAmount.SetFocus;
      edAmount.Text:='0';
      exit;
    end;

    try
      //III Пополнение счета

      //1. Проверить возможность авторизации и получить список доступных объектов (auth)
      if not auth then
        raise Exception.Create('Не могу подключиться к сервису пополнения!');

      //2. Получить список услуг (service)
      if not service then
        raise Exception.Create('Не могу получить список доступных услуг!');

      //3. Проверить правильность ввода номера абонента
      Colibry.pAccount:=CheckAndTrimAccount(edAccount.Text);
      if Length(Trim(Colibry.pAccount)) <> 10 then
      begin
        edAccount.Text:=ACCOUNT_PLACE_HOLDER;
        edAccount.Hint:='';
        lbService.Caption:='';
        lbService.Font.Color:=clWindowText;
        edAccount.SetFocus;
        //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
        ShowHidePaymentInformation(false);
        Application.ProcessMessages;
        raise Exception.Create('Номер телефона для пополнения введен не верно!'+#13+'Проверьте правильность ввода номера телефона!');
        Exit;
      end;

      //4. Попытаться определить сервис (услугу). при не возможности определить сервис (услугу) - предложить указать вручную
      //showmessage('добавить возможность выбора сервиса вручную. выбор из нового окна. вызов из TReplPhoneAccountF.edAmountExit');

      //5. Попытаться определить тип пополнения. При не возможности определить тип пополнения - предложить указать вручную
      Colibry.pService:=GetService(edAccount.Text,Colibry.pAccType);
      //showmessage('добавить возможность выбора типа пополнения. выбор из нового окна. вызов из TReplPhoneAccountF.edAmountExit');

      try
        StrToCurr(edAmount.Text);
      except
        edAmount.Text:='0';
        edFee.Text:='0';
        edAccount.SetFocus;
        edAmount.SetFocus;
        edAmount.SelectAll;
        //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
        ShowHidePaymentInformation(false);
        Application.ProcessMessages;
        exit;
      end;

      if edAmount.Text='0' then
      begin
        edAmount.Text:='0';
        edFee.Text:='0';
        edAccount.SetFocus;
        edAmount.SetFocus;
        edAmount.SelectAll;
        //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
        ShowHidePaymentInformation(false);
        Application.ProcessMessages;
        exit;
      end;
      Colibry.pAmount:=CurrToStr(StrToCurr(edAmount.Text)*100);

      //6. Проверить баланс портфеля
      balance(F_Error);
      if F_Error then
      begin
        edAccount.SetFocus;
        //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
        ShowHidePaymentInformation(false);
        Application.ProcessMessages;
        raise Exception.Create('Не настроены параметры подключения!'+#13+
                               'Настройте параметры подключения'+#13+
                               'и повторите попытку пополнения!'+#13+
                               'За дополнительной информацией обратитесь в IT-отдел!');
        exit;
      end;

      //7. Проверить возможность пополнения счета (аккаунта)
      //7.1. Сгенерировать OrderGUID
      genorderguid;

      //7.2. Проверить, что сумма пополнения не больше доступного баланса
      amount:=StrToFloat(edAmount.Text)*100;
      for i:=0 to Length(BalanceResponse.portfolios)-1 do
      begin
        if BalanceResponse.portfolios[i].currency.id='980' then
        begin
          if amount > BalanceResponse.portfolios[i].limit then
          begin
            edAmount.Text:=FloatToStr(BalanceResponse.portfolios[i].limit/100);
            edAccount.SetFocus;
            edAmount.SetFocus;
            edAmount.SelectAll;
            //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
            ShowHidePaymentInformation(false);
            Application.ProcessMessages;
            raise Exception.Create('Досутпный баланс для пополнения '+FloatToStr(BalanceResponse.portfolios[i].limit/100)+' '+BalanceResponse.portfolios[i].currency.short
                  +#13+'Сумма, на которую Вы хотите пополнить счет'
                  +#13+'больше доступного баланса!'
                  +#13+'Уменьшите сумму пополнения и повторите попытку!'
                  +#13+'При повторной ошибке обратитесь в IT-отдел за консультацией!');
            exit;
          end;
        end
      end;

      //7.3. Отправить запрос проверки возможности пополнения
      account(F_Error);
      if F_Error then
      begin
        edAccount.SetFocus;
        //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
        ShowHidePaymentInformation(false);
        Application.ProcessMessages;
        raise Exception.Create('Не настроены параметры подключения!'+#13+
                               'Настройте параметры подключения'+#13+
                               'и повторите попытку пополнения!'+#13+
                               'За дополнительной информацией обратитесь в IT-отдел!');
        exit;
      end;

      //7.4. При положительном ответе от сервиса - уведомить, что пополнение возможно и указать сумму к оплате
      //7.5. При отрицательном ответе от сервиса - уведомление о не возможности пополнить на весь экран!
      if LowerCase(AccountResponse.status) = 'o' then
      begin
        edFee.Text:=FloatToStr(AccountResponse.fee/100);
        edPaySum.Text:=FloatToStr((StrToFloat(AccountResponse.dpamount)+AccountResponse.fee)/100);
        edSum.Text:=edPaySum.Text;

        //показать комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
        ShowHidePaymentInformation(true);
        Application.ProcessMessages;

        edSum.SetFocus;
        Application.ProcessMessages;

        if Length(BalanceResponse.portfolios) > 0 then
        begin
          for i:=0 to length(BalanceResponse.portfolios)-1 do
          begin
            if BalanceResponse.portfolios[i].currency.id='980' then
            begin
              BalanceCurrency:=BalanceResponse.portfolios[i].currency.short;
              BalanceValue:=FloatToStr(BalanceResponse.portfolios[i].amount/100);
            end;
          end;
          MainF.MessBox('Пополнение возможно!'+#13+
                        'Номер для пополнения: '+edAccount.Text+#13+
                        'Сумма пополнения: '+edAmount.Text+' '+BalanceCurrency+#13+
                        'Введите сумму полученную от покупателя и выполните пополнение!',16);
        end
        else
          MainF.MessBox('Пополнение возможно!'+#13+
                        'Номер для пополнения: '+edAccount.Text+#13+
                        'Сумма пополнения: '+edAmount.Text+#13+
                        'Введите сумму полученную от покупателя и выполните пополнение!',64);
        edSum.Text:=edPaySum.Text;
        edSum.SetFocus;
        Application.ProcessMessages;
      end
      else
      begin
        if F_Error then
        begin
          if Length(BalanceResponse.portfolios) > 0 then
          begin
            for i:=0 to length(BalanceResponse.portfolios)-1 do
            begin
              if BalanceResponse.portfolios[i].currency.id='980' then
              begin
                BalanceCurrency:=BalanceResponse.portfolios[i].currency.short;
                BalanceValue:=FloatToStr(BalanceResponse.portfolios[i].amount/100);
              end;
            end;
            raise Exception.Create('Пополнение не возможно!'+#13+
                                   'Номер для пополнения: '+edAccount.Text+#13+
                                   'Сумма пополнения: '+edAmount.Text+' '+BalanceCurrency+#13+
                                   'Доступный баланс: '+BalanceValue+' '+BalanceCurrency+#13+
                                   'За дополнительной информацией обратитесь в IT-отдел!');
          end
          else
            raise Exception.Create('Пополнение не возможно!'+#13+
                                   'Номер для пополнения: '+edAccount.Text+#13+
                                   'Сумма пополнения: '+edAmount.Text+#13+
                                   'За дополнительной информацией обратитесь в IT-отдел!');
          //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
          ShowHidePaymentInformation(false);
          Application.ProcessMessages;
        end
        else
        begin
          if Length(BalanceResponse.portfolios) > 0 then
          begin
            for i:=0 to length(BalanceResponse.portfolios)-1 do
            begin
              if BalanceResponse.portfolios[i].currency.id='980' then
              begin
                BalanceCurrency:=BalanceResponse.portfolios[i].currency.short;
                BalanceValue:=FloatToStr(BalanceResponse.portfolios[i].amount/100);
              end;
            end;
            MainF.MessBox('Пополнение возможно!'+#13+
                          'Номер для пополнения: '+edAccount.Text+#13+
                          'Сумма пополнения: '+edAmount.Text+' '+BalanceCurrency+#13+
                          'Введите сумму полученную от покупателя и выполните пополнение!');
          end
          else
            MainF.MessBox('Пополнение возможно!'+#13+
                          'Номер для пополнения: '+edAccount.Text+#13+
                          'Сумма пополнения: '+edAmount.Text+#13+
                          'Введите сумму полученную от покупателя и выполните пополнение!');
        end;
      end;

    except
      on E:Exception do
      begin
        ShowHidePaymentInformation(false);
        Application.ProcessMessages;
        MainF.MessBox('При проверке возможности пополнения счета возникла ошибка'+#13+E.Message,16);
      end;
    end;
}
end;

procedure TReplPhoneAccountF.btCancelClick(Sender:TObject);
begin
  if Assigned(fOnCancel) then
    fOnCancel(Self);
  Self.Close;
end;

(*----------------------------------------------------------------------------*)

function TReplPhoneAccountF.ChkAccount(account:string):boolean;
var
  str:string;
begin
  Result:=false;
  str:=account;
  delete(str,1,5);
  delete(str,4,length(str));
  try
    StrToInt(str);
  except
    Result:=false;
    Exit;
  end;

  str:=account;
  delete(str,1,10);
  delete(str,4,length(str));
  try
    StrToInt(str);
  except
    Result:=false;
    Exit;
  end;

  str:=account;
  delete(str,1,14);
  delete(str,3,length(str));
  try
    StrToInt(str);
  except
    Result:=false;
    Exit;
  end;

  str:=account;
  delete(str,1,17);
  try
    StrToInt(str);
  except
    Result:=false;
    Exit;
  end;
  Result:=true;
end;

function TReplPhoneAccountF.GetService(Account:string;out pType:string):string;
//определение параметра SERVICE
var
  i: integer;
  serv: string;
begin
  Result:='';
  i:=0;
  serv:=Account;
  Delete(serv,1,5);
  Delete(serv,4,Length(serv));

  //получение сервиса для запроса
  for i:=0 to length(PHONE_CODES_TO_SERVICE_ID)-1 do
    if PHONE_CODES_TO_SERVICE_ID[i].PhoneCode = serv then
    begin
      Colibry.pService:=PHONE_CODES_TO_SERVICE_ID[i].ServiceID;
      lbService.Caption:=PHONE_CODES_TO_SERVICE_ID[i].ProviderName;
      lbService.Font.Color:=PHONE_CODES_TO_SERVICE_ID[i].Color;
      Break;
    end;


  //получение доступных услуг
  if not auth then
    raise Exception.Create('Не могу подключиться к сервису пополнения!');
  if not service then
    raise Exception.Create('Не могу получить список доступных услуг!');

  //получение типа аккаунта: Р - по номеру телефона; А - по номеру счета
  for i:=0 to length(ServiceResponse.Data)-1 do
  begin
    if Colibry.pService=IntToStr(ServiceResponse.Data[i].id) then
    begin
      if (trim(ServiceResponse.Data[i].acctype)='')or(LowerCase(ServiceResponse.Data[i].acctype)='p') then
        Colibry.pAccType:='P'
      else
        Colibry.pAccType:='A';
      Break;
    end;
  end;
  pType:=Colibry.pAccType;
  Result:=Colibry.pService;
end;

//procedure TReplPhoneAccountF.auth(var err:boolean);
function TReplPhoneAccountF.auth: boolean;//(var err:boolean);
var
  temp_string: AnsiString;
  TmpPathLength: cardinal;
  TmpPath, TmpFile: ansistring;
  TmpPathLen, TmpFileLen: LongInt;
  tmpF: TextFile;
  AuthRslt: AnsiString;
begin
  try
    try
      TmpPathLength:= GetTempPath(0, PAnsiChar(TmpPath));
      SetLength(TmpPath, TmpPathLength);
      GetTempPath(TmpPathLength, PAnsiChar(TmpPath));
      SetLength(TmpFile, TmpPathLength+10);
      GetTempFileName(PAnsiChar(TmpPath), PAnsiChar(TEMP_FILE_PREFIX), 0, PAnsiChar(TmpFile));
      TmpPathLen:= length(TmpPath);
      TmpFileLen:= length(TmpFile);

      try
        Result:=AUTH_Request(TmpPath,TmpFile,TmpPathLen,TmpFileLen);
      except
        on E:Exception do
          Exception.Create('Произошла ошибка в подключаемой библиотеке'+#13+E.Message);
      end;

      if FileExists(TmpFile) then
      begin
        AssignFile(tmpF,TmpFile);
        Reset(tmpF);
        Read(tmpF,AuthRslt);
        CloseFile(tmpF);
      end;
      if not FillAuthResponse(AuthRslt) then
        raise Exception.Create('Ошибка расшифровки ответа от сервиса пополнения: '+ErrorResponse.code+' '+ErrorResponse.error);
    except
      on E:Exception do
      begin
        Result:=false;
        MainF.MessBox('При попытке авторизации на сервисе пополнения возникла ошибка:'+#13+
          E.Message+#13+
          'Обратитесь в IT-отдел',16);
      end;
    end;
  finally
    DeleteFile(PAnsiChar(TmpFile));
  end;
end;

function TReplPhoneAccountF.FillAuthResponse(auth_res:ansistring): boolean;
(*
var
  i: integer;
*)
var
  user_string, objects_string: widestring;
  i: integer;
  MaxArray: integer;
begin
  Result:=false;
  try
    with TJSONObject.create(auth_res) do
    begin
      try
        if has('user') then
        begin
          with uJSON.TJSONObject.create(getString('user')) do
          begin
            try
              if has('id') then AuthResponse.user.id:=getString('id');
              if has('userid') then AuthResponse.user.userid:=getString('userid');
              if has('name') then AuthResponse.user.name:=getString('name');
              if has('needchangepass') then AuthResponse.user.needchangepass:=getString('needchangepass');
            finally
              Free;
            end;
          end;
        end;
        if has('objects') then
        begin
          with uJSON.TJSONArray.create(getString('objects')) do
          begin
            try
              SetLength(AuthResponse.objects,length);
              for i:=0 to length-1 do
              begin
                with uJSON.TJSONObject.create(getString(i)) do
                begin
                  try
                    if has('id') then AuthResponse.objects[i].id:=getString('id');
                    if has('code') then AuthResponse.objects[i].code:=getString('code');
                    if has('name') then AuthResponse.objects[i].name:=getString('name');
                    if has('parent_id') then AuthResponse.objects[i].parent_id:=getString('parent_id');
                  finally
                    Free;
                  end;
                end;
              end;
            finally
              Free;
            end;
          end;
        end;
      finally
        Free;
      end;
    end;
    for i:=0 to length(AuthResponse.objects)-1 do
    begin
      if AuthResponse.objects[i].id=Colibry.ObjectCode then
      begin
        Colibry.pObject:=AuthResponse.objects[i].code;
        Break;
      end;
    end;
    Result:=true;
  except
    on E:Exception do
      MainF.MessBox('Ошибка распаршивания запроса авторизации на сервисе пополнения '+E.Message);
  end;

(*
  MaxArray:=0;
  objects_string:=auth_res;
  user_string:=auth_res;
  if Pos('objects=[',objects_string) > 0 then
  begin
    Delete(objects_string,1,9);
    Delete(objects_string,pos('];user=[',objects_string),length(objects_string));
  end;
  if Pos('];user=[',user_string) > 0 then
  begin
    Delete(user_string,1,Pos('];user=[',user_string)+7);
    delete(user_string,length(user_string),1);
  end;
  //распарс(ш)ивание ответа на авторизацию, ключ 'USER'
  AuthResponse.user.id:=user_string;
  delete(AuthResponse.user.id,1,3);
  delete(AuthResponse.user.id,pos(',userid=',AuthResponse.user.id),length(AuthResponse.user.id));
  AuthResponse.user.userid:=user_string;
  delete(AuthResponse.user.userid,1,11+length(AuthResponse.user.id));
  AuthResponse.user.name:=AuthResponse.user.userid;
  delete(AuthResponse.user.userid,pos(',name=',AuthResponse.user.userid),length(AuthResponse.user.userid));
  delete(AuthResponse.user.name,1,length(AuthResponse.user.userid)+6);
  AuthResponse.user.needchangepass:=AuthResponse.user.name;
  delete(AuthResponse.user.name,pos(',needchangepass=',AuthResponse.user.name),length(AuthResponse.user.name));
  delete(AuthResponse.user.needchangepass,1,length(AuthResponse.user.name)+16);
  //распарс(ш)ивание ответа на авторизацию, ключ 'OBJECTS'
  for i:=0 to length(objects_string) do
  begin
    if pos('id_'+inttostr(i),objects_string) > 0 then
    else
    begin
      MaxArray:=i;
      Break;
    end;
  end;
  SetLength(AuthResponse.objects,MaxArray+1);
  i:=0;
  if length(AuthResponse.objects)>0 then
  begin
    AuthResponse.objects[0].id:=objects_string;
    for i:=0 to MaxArray-1 do
    begin
      if i = 0 then
        delete(AuthResponse.objects[i].id,1,4+length(IntToStr(i)))
      else
        delete(AuthResponse.objects[i].id,1,9+length(IntToStr(i)));
      AuthResponse.objects[i].code:=AuthResponse.objects[i].id;
      delete(AuthResponse.objects[i].id,pos(',code_'+inttostr(i)+'=',AuthResponse.objects[i].id),length(AuthResponse.objects[i].id));
      delete(AuthResponse.objects[i].code,1,length(AuthResponse.objects[i].id)+7+length(inttostr(i)));
      AuthResponse.objects[i].name:=AuthResponse.objects[i].code;
      delete(AuthResponse.objects[i].code,pos(',name_'+inttostr(i)+'=',AuthResponse.objects[i].code),length(AuthResponse.objects[i].code));
      delete(AuthResponse.objects[i].name,1,length(AuthResponse.objects[i].code)+7+length(inttostr(i)));
      AuthResponse.objects[i].parent_id:=AuthResponse.objects[i].name;
      delete(AuthResponse.objects[i].name,pos(',parent_'+inttostr(i)+'=',AuthResponse.objects[i].name),length(AuthResponse.objects[i].name));
      delete(AuthResponse.objects[i].parent_id,1,length(AuthResponse.objects[i].name)+9+length(inttostr(i)));
      if i < MaxArray then
        AuthResponse.objects[i+1].id:=AuthResponse.objects[i].parent_id;
      delete(AuthResponse.objects[i].parent_id,pos(';id_',AuthResponse.objects[i].parent_id),length(AuthResponse.objects[i].parent_id));
    end;
  end
  else
    AuthResponse.objects:=nil;

  if length(AuthResponse.objects) > 0 then
   for i:=Low(AuthResponse.objects) to High(AuthResponse.objects) do
    if AuthResponse.objects[i].id=Prm.c_code then
     begin
      Colibry.pObject:=AuthResponse.objects[i].code;
      Break;
     end;
*)
end;

function TReplPhoneAccountF.service: boolean;
(*
var
  TmpPathLength, TmpFileLength: cardinal;
  TmpPath, TmpFile: ansistring;
  TmpPathLen,TmpFileLen: LongInt;
  tmpF: TextFile;
  ServiceRslt: AnsiString;
*)

var
  temp_string: AnsiString;
  TmpPathLength: cardinal;
  TmpPath, TmpFile: ansistring;
  TmpPathLen, TmpFileLen: LongInt;
  tmpF: TextFile;
  ServiceRslt: AnsiString;
begin
  try
    try
      TmpPathLength:= GetTempPath(0, PAnsiChar(TmpPath));
      SetLength(TmpPath, TmpPathLength);
      GetTempPath(TmpPathLength, PAnsiChar(TmpPath));
      SetLength(TmpFile, TmpPathLength+10);
      GetTempFileName(PAnsiChar(TmpPath), PAnsiChar(TEMP_FILE_PREFIX), 0, PAnsiChar(TmpFile));
      TmpPathLen:= length(TmpPath);
      TmpFileLen:= length(TmpFile);

      try
          Result:=SERVICE_Request(Colibry.pObject,TmpPath,TmpFile,TmpPathLen,TmpFileLen);
      except
        on E:Exception do
          Exception.Create('Произошла ошибка в подключаемой библиотеке'+#13+E.Message);
          //MainF.MessBox('Произошла ошибка в подключаемой библиотеке'+#13+E.Message,16);
      end;

      if FileExists(TmpFile) then
      begin
        AssignFile(tmpF,TmpFile);
        Reset(tmpF);
        Read(tmpF,ServiceRslt);
        CloseFile(tmpF);
      end;

      if not FillServiceResponse(ServiceRslt) then
        raise Exception.Create('Ошибка расшифровки ответа от сервиса пополнения: '+ErrorResponse.code+' '+ErrorResponse.error);

//      if FileExists(TmpFile) then
//      begin
//        AssignFile(tmpF,TmpFile);
//        Reset(tmpF);
//    Read(tmpF,ServiceRslt);
//        CloseFile(tmpF);
//      end;
//  //if not err then
//  FillServiceResponse(ServiceRslt);
//  //      raise Exception.Create('Ошибка расшифровки ответа от сервиса пополнения: '+ErrorResponse.code+' '+ErrorResponse.error);

    except
      on E:Exception do
      begin
        Result:=false;
        MainF.MessBox('При попытке получения списка доступных услуг на сервисе пополнения возникла ошибка:'+#13+
          E.Message+#13+
          'Обратитесь в IT-отдел',16);
      end;
    end;
  finally
    DeleteFile(PAnsiChar(TmpFile));
  end;
(*
  err:=false;
  TmpPathLength:= GetTempPath(0, PAnsiChar(TmpPath));
  SetLength(TmpPath, TmpPathLength);
  GetTempPath(TmpPathLength, PAnsiChar(TmpPath));
  SetLength(TmpFile, TmpPathLength+10);
  GetTempFileName(PAnsiChar(TmpPath), PAnsiChar(TEMP_FILE_PREFIX), 0, PAnsiChar(TmpFile));
  TmpPathLen:= length(TmpPath);
  TmpFileLen:= length(TmpFile);

  try
    SERVICE_Request(Colibry.UserKey,Colibry.UserName,Colibry.Password,Colibry.pObject,Colibry.BaseURL,TmpPath,TmpFile,TmpPathLen,TmpFileLen,err);
  except
    on E:Exception do
      MainF.MessBox('Произошла ошибка в подключаемой библиотеке'+#13+E.Message,16);
  end;

  if err then
  begin
    MainF.MessBox('Пополнение не возможно!'+#13+
               'Проверьте параметры подключения к сервису пополнения!'+#13+
               'За дополнительной информацией обратитесь в IT-отдел!',16);
    Self.Close;
    exit;
  end;

  if FileExists(TmpFile) then
  begin
    AssignFile(tmpF,TmpFile);
    Reset(tmpF);
    Read(tmpF,ServiceRslt);
    CloseFile(tmpF);
  end;
  if not err then FillServiceResponse(ServiceRslt);
  DeleteFile(PAnsiChar(TmpFile));
*)
end;

//procedure TReplPhoneAccountF.FillServiceResponse(service_resp:ansistring);
function TReplPhoneAccountF.FillServiceResponse(service_resp:ansistring): boolean;
(*
var
  data_string: widestring;
  MaxArray: integer;
  i: integer;
  DataArray: array of string;
  TempStr: string;
*)
var
  i: integer;
{
  user_string, objects_string: widestring;
  MaxArray: integer;
}
   {костыль для замены числа с плавающей запятой на число с плавающей точко  в параметре minamount }
   function ReplaceMinAmountCommaValueToDotValue(aJSonText : String) : string;
   const
      JSonKey = '"minamount":';
   var
     sBuf : string;
     FindPosKey,  // начало ключа minamount
     FindNextKey : CArdinal; // начало следующего ключа после minamount
     cOffset : Cardinal;
     dummyFloat : Double;
   begin
     cOffset := 1;
     Result := '';
     FindNextKey := 1;
     { ищем ключ }
     FindPosKey := PosEx(JSonKey, aJSonText, cOffset);
     { если нашли ключ тогда, если нужно, то будем заменять значение запятой на точку }
     while (FindPosKey > 0) do
     begin
        sBuf := '';
        Inc(FindPosKey,Length(JSonKey));
        Result := Result + Copy(aJSonText,cOffset,FindPosKey-cOffset); //скопировали левую часть от смещения до конца ключа
        { ищем начало следующего ключа результат помещаем в FindNextKey }
        FindNextKey :=PosEx(',"', aJSonText, FindPosKey);
        { копируем значеие ключа minamount результат помещаем в sBuf}
        sBuf := Copy(aJSonText,FindPosKey,FindNextKey - FindPosKey);
        { в результирующую строку добавляем значение найденного ключа с заменой запятой на точку }
        Result := Result + '0';//StringReplace(sBuf, ',', '.',[rfReplaceAll,rfIgnoreCase]);
        { устанавливаем новое значение смещания начала поиска позиции в строке}
        if FindNextKey > 0 then
           cOffset := FindNextKey;
        { ищем ключ }
        FindPosKey := PosEx(JSonKey, aJSonText, cOffset);
     end;
     { копируем остааток строки }
     Result := Result +Copy(aJSonText ,cOffset,  Length(aJSonText)-cOffset+1);
   end;

begin
  Result:=false;
  try
    service_resp := ReplaceMinAmountCommaValueToDotValue(service_resp);
    with TJSONObject.create(service_resp) do
    begin
      try
        if has('data') then
        begin
          with TJSONArray.create(getString('data')) do
          begin
            SetLength(ServiceResponse.Data,length);
            for i:=0 to length-1 do
            begin
              with TJSONObject.create(getString(i)) do
              begin
                try
                  if has('id') then ServiceResponse.Data[i].id:=getInt('id');
                  if has('name') then ServiceResponse.Data[i].name:=getString('name');
                  if has('code') then ServiceResponse.Data[i].code:=getString('code');
                  if has('mark') then ServiceResponse.Data[i].mark:=getString('mark');
                  if has('DefaultAmount') then ServiceResponse.Data[i].DefaultAmount:=getDouble('DefaultAmount');
                  if has('UpdateDate') then ServiceResponse.Data[i].UpdateDate:=getString('UpdateDate');
                  if has('IsDirectPay') then ServiceResponse.Data[i].IsDirectPay:=getBoolean('IsDirectPay');
                  if has('Currency') then ServiceResponse.Data[i].Currency:=getInt('Currency');
                  if has('ImagePath') then ServiceResponse.Data[i].ImagePath:=getString('ImagePath');
                  if has('acctype') then ServiceResponse.Data[i].acctype:=getString('acctype');
                  if has('extratype') then ServiceResponse.Data[i].extratype:=getString('extratype');
                  if has('mask') then ServiceResponse.Data[i].mask:=getString('mask');
                  if has('sortIndex') then ServiceResponse.Data[i].sortIndex:=getInt('sortIndex');
                  if has('minamount') then ServiceResponse.Data[i].minamount:=getDouble('minamount');
                  if has('maxamount') then ServiceResponse.Data[i].maxamount:=getDouble('maxamount');
                  if has('keyboard') then ServiceResponse.Data[i].keyboard:=getString('keyboard');
                  if has('image') then ServiceResponse.Data[i].image:=getString('image');
                  if has('group') then
                  begin
                    with TJSONObject.create(getString('group')) do
                    begin
                      try
                        if has('id') then ServiceResponse.Data[i].group.id:=getString('id');
                        if has('name') then ServiceResponse.Data[i].group.name:=getString('name');
                      finally
                        Free;
                      end;
                    end;
                  end;
                  if has('provider') then
                  begin
                    with TJSONObject.create(getString('provider')) do
                    begin
                      try
                        if has('id') then ServiceResponse.Data[i].provider.id:=getString('id');
                        if has('name') then ServiceResponse.Data[i].provider.name:=getString('name');
                      finally
                        Free;
                      end;
                    end;
                  end;
                  if has('type') then
                  begin
                    with TJSONObject.create(getString('type')) do
                    begin
                      try
                        if has('id') then ServiceResponse.Data[i].ServiceType.id:=getString('id');
                        if has('name') then ServiceResponse.Data[i].ServiceType.name:=getString('name');
                      finally
                        Free;
                      end;
                    end;
                  end;
                  //if has('') then ServiceResponse.Data[i].:=get('');
                finally
                  Free;
                end;
              end;
            end;
          end;
        end;
      finally
        Free;
      end;
    end;
{
    for i:=0 to length(AuthResponse.objects)-1 do
    begin
      if AuthResponse.objects[i].id=Colibry.ObjectCode then
      begin
        Colibry.pObject:=AuthResponse.objects[i].code;
        Break;
      end;
    end;
}
    Result:=true;
  except
    on E:Exception do
      MainF.MessBox('Ошибка распаршивания запроса авторизации на сервисе пополнения '+E.Message);
  end;
(*
  data_string:=service_resp;
  MaxArray:=0;
  ServiceResponse.Data:=nil;
  DataArray:=nil;
  if Pos('data=[',service_resp) > 0 then
  begin
    Delete(data_string,1,6);
    delete(data_string,pos(']',data_string),length(data_string));
  end;

  //распарс(ш)ивание ответа на авторизацию, ключ 'DATA'
  if length(trim(data_string)) > 0 then
    for i:=0 to length(data_string) do
      if pos('id_'+inttostr(i)+'=',data_string) > 0 then
      else
      begin
        MaxArray:=i;
        Break;
      end;

  SetLength(ServiceResponse.Data,MaxArray+1);
  SetLength(DataArray,MaxArray+1);
  i:=0;

  if Length(DataArray) > 0 then
    DataArray[0]:=data_string;
  for i:=0 to MaxArray-1 do
  begin
    if i < MaxArray then
    begin
      DataArray[i]:=data_string;
      Delete(data_string,1,pos(';id_'+inttostr(i+1)+'=',data_string));
      Delete(DataArray[i],pos(';id_'+inttostr(i+1)+'=',DataArray[i]),length(DataArray[i]));
    end
    else
    begin
      Delete(data_string,1,pos('id_'+inttostr(i)+'=',data_string));
      Delete(DataArray[i],pos('id_'+inttostr(i)+'=',DataArray[i]),length(DataArray[i]));
    end
  end;
  for i:=0 to MaxArray-1 do
  begin
    TempStr:=DataArray[i];
    delete(TempStr,1,4+length(inttostr(i)));
    delete(DataArray[i],1,4+length(inttostr(i)));
    delete(TempStr,pos(',name_'+inttostr(i),TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+7+length(inttostr(i)));
    try
      ServiceResponse.Data[i].id:=StrToInt(TempStr);
    except
      ServiceResponse.Data[i].id:=-1000;
    end;

    TempStr:=DataArray[i];
    delete(TempStr,pos(',code_'+inttostr(i),TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+7+length(inttostr(i)));
    ServiceResponse.Data[i].name:=TempStr;

    TempStr:=DataArray[i];
    delete(TempStr,pos(',mark_'+inttostr(i),TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+7+length(inttostr(i)));
    ServiceResponse.Data[i].code:=TempStr;

    TempStr:=DataArray[i];
    delete(TempStr,pos(',defaultamount_'+inttostr(i),TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+16+length(inttostr(i)));
    ServiceResponse.Data[i].mark:=TempStr;

    TempStr:=DataArray[i];
    delete(TempStr,pos(',updatedate_'+inttostr(i),TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+13+length(inttostr(i)));
    try
      ServiceResponse.Data[i].DefaultAmount:=Smart2Float(TempStr);
    except
      ServiceResponse.Data[i].DefaultAmount:=-1000;
    end;

    TempStr:=DataArray[i];
    delete(TempStr,pos(',isdirectpay_'+inttostr(i),TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+14+length(inttostr(i)));
    ServiceResponse.Data[i].UpdateDate:=TempStr;

    TempStr:=DataArray[i];
    delete(TempStr,pos(',group_'+inttostr(i),TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+12+length(inttostr(i)));
    if (TempStr=LowerCase('true'))or(TempStr='1') then
      ServiceResponse.Data[i].IsDirectPay:=true
    else
      ServiceResponse.Data[i].IsDirectPay:=false;

    TempStr:=DataArray[i];
    delete(TempStr,pos(',name=',TempStr),length(TempStr));
    delete(DataArray[i],1,6+length(TempStr));
    ServiceResponse.Data[i].group.id:=TempStr;

    TempStr:=DataArray[i];
    delete(TempStr,pos('},provider_'+inttostr(i),TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+11+length(IntToStr(i))+5);
    ServiceResponse.Data[i].group.name:=TempStr;

    TempStr:=DataArray[i];
    delete(TempStr,pos(',name=',TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+6);
    ServiceResponse.Data[i].provider.id:=TempStr;

    TempStr:=DataArray[i];
    Delete(TempStr,pos('},type_'+inttostr(i),TempStr),length(TempStr));
    Delete(DataArray[i],1,length(TempStr)+7+length(inttostr(i))+5);
    ServiceResponse.Data[i].provider.name:=TempStr;

    TempStr:=DataArray[i];
    delete(TempStr,pos(',name=',TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+6);
    ServiceResponse.Data[i].ServiceType.id:=TempStr;

    TempStr:=DataArray[i];
    delete(TempStr,pos('},imagePath_'+inttostr(i),TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+13+length(inttostr(i)));
    ServiceResponse.Data[i].ServiceType.name:=TempStr;

    TempStr:=DataArray[i];
    delete(TempStr,pos(',acctype_'+IntToStr(i),TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+10+length(IntToStr(i)));
    ServiceResponse.Data[i].ImagePath:=TempStr;

    TempStr:=DataArray[i];
    delete(TempStr,pos(',extratype_'+inttostr(i),TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+12+length(inttostr(i)));
    ServiceResponse.Data[i].acctype:=TempStr;

    TempStr:=DataArray[i];
    delete(TempStr,pos(',mask_'+inttostr(i),TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+7+length(inttostr(i)));
    ServiceResponse.Data[i].extratype:=TempStr;

    TempStr:=DataArray[i];
    delete(TempStr,pos(',minamount_'+inttostr(i),TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+12+length(inttostr(i)));
    ServiceResponse.Data[i].mask:=TempStr;

    TempStr:=DataArray[i];
    delete(TempStr,pos(',maxamount_'+inttostr(i),TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+12+length(inttostr(i)));
    try
      ServiceResponse.Data[i].minamount:=Smart2Float(TempStr);
    except
      ServiceResponse.Data[i].minamount:=-1000;
    end;

    TempStr:=DataArray[i];
    delete(TempStr,pos(',image_'+inttostr(i),TempStr),length(TempStr));
    delete(DataArray[i],1,length(TempStr)+8+length(inttostr(i)));
    try
      ServiceResponse.Data[i].maxamount:=Smart2Float(TempStr);
    except
      ServiceResponse.Data[i].maxamount:=-1000;
    end;
    ServiceResponse.Data[i].image:=DataArray[i];
  end;
*)
end;

function TReplPhoneAccountF.Smart2Float(s:string;xDefault:double):double;
(*
var i: integer;
*)
begin
(*
  i:= pos( ',', s ); if i <> 0 then s[i] := '.';
  Val( s, Result, i );
  if i <> 0 then {ошибка преобразования} Result:= xDefault; // или Raise Exception...
*)
end;

function TReplPhoneAccountF.CheckAndTrimAccount(Account:string):string;
//подготовка параметра SERVICE для запроса
var
  ChkAccount: string;
  i: integer;
  chr: char;
const
  Numbs: set of char = ['1','2','3','4','5','6','7','8','9','0'];
begin
  Result:='';
  if Length(trim(Account)) < 19 then
  begin
    Result:='';
    exit;
  end;
  ChkAccount:=Account;
  Delete(ChkAccount,1,5);
  Delete(ChkAccount,4,2);
  Delete(ChkAccount,7,1);
  Delete(ChkAccount,9,1);
  if Length(trim(ChkAccount)) <> 10 then
  begin
    Result:='';
    exit;
  end;
  for i:=1 to Length(ChkAccount) do
  begin
    chr:=Char(ChkAccount[i]);
    if not (chr in Numbs) then
    begin
      Result:='';
      exit;
    end;
  end;
  Result:=ChkAccount;
end;

procedure TReplPhoneAccountF.balance(var err:boolean);
var
  TmpPathLength, TmpFileLength: cardinal;
  TmpPath, TmpFile: ansistring;
  TmpPathLen,TmpFileLen: LongInt;
  tmpF: TextFile;
  BalanceRslt: AnsiString;
begin
  err:=false;
  TmpPathLength:= GetTempPath(0, PAnsiChar(TmpPath));
  SetLength(TmpPath, TmpPathLength);
  GetTempPath(TmpPathLength, PAnsiChar(TmpPath));
  SetLength(TmpFile, TmpPathLength+10);
  GetTempFileName(PAnsiChar(TmpPath), PAnsiChar(TEMP_FILE_PREFIX), 0, PAnsiChar(TmpFile));
  TmpPathLen:= length(TmpPath);
  TmpFileLen:= length(TmpFile);

  try
    BALANCE_Request(Colibry.UserKey,Colibry.UserName,Colibry.Password,Colibry.pObject,Colibry.BaseURL,TmpPath,TmpFile,TmpPathLen,TmpFileLen,err);
  except
    on E:Exception do
      MainF.MessBox('Произошла ошибка в подключаемой библиотеке'+#13+E.Message,16);
  end;

  if err then
  begin
    MainF.MessBox('Пополнение не возможно!'+#13+
               'Проверьте параметры подключения к сервису пополнения!'+#13+
               'За дополнительной информацией обратитесь в IT-отдел!',16);
    Self.Close;
    exit;
  end;

  if FileExists(TmpFile) then
  begin
    AssignFile(tmpF,TmpFile);
    Reset(tmpF);
    Read(tmpF,BalanceRslt);
    CloseFile(tmpF);
  end;
  if not err then FillBalanceResponse(BalanceRslt);
  DeleteFile(PAnsiChar(TmpFile));
end;

procedure TReplPhoneAccountF.FillBalanceResponse(balance_responce:ansistring);
(*
var
  portfolio_string: widestring;
  i: integer;
  MaxArray: integer;
  PortfoliosArray: array of string;
  TempStr: string;
*)
begin
(*
  portfolio_string:=balance_responce;
  BalanceResponse.portfolios:=nil;
  MaxArray:=0;
  PortfoliosArray:=nil;
  if Pos('portfolios=[',balance_responce) > 0 then
  begin
    Delete(portfolio_string,1,12);
    delete(portfolio_string,pos(']',portfolio_string),length(portfolio_string));
  end;

  //распарс(ш)ивание ответа на авторизацию, ключ 'PORTFOLIO'
  if length(trim(portfolio_string)) > 0 then
    for i:=0 to length(portfolio_string) do
      if pos('amount_'+inttostr(i)+'=',portfolio_string) > 0 then
      else
      begin
        MaxArray:=i;
        Break;
      end;

  SetLength(BalanceResponse.portfolios,MaxArray+1);
  SetLength(PortfoliosArray,MaxArray+1);
  i:=0;

  if Length(PortfoliosArray) > 0 then
    PortfoliosArray[0]:=portfolio_string;
  for i:=0 to MaxArray-1 do
  begin
    if i < MaxArray then
    begin
      PortfoliosArray[i]:=portfolio_string;
      Delete(portfolio_string,1,pos(';amount_'+inttostr(i+1)+'=',portfolio_string));
      Delete(PortfoliosArray[i],pos(';amount_'+inttostr(i+1)+'=',PortfoliosArray[i]),length(PortfoliosArray[i]));
    end
    else
    begin
      Delete(portfolio_string,1,pos('amount_'+inttostr(i)+'=',portfolio_string));
      Delete(PortfoliosArray[i],pos('amount_'+inttostr(i)+'=',PortfoliosArray[i]),length(PortfoliosArray[i]));
    end;
  end;
  for i:=0 to MaxArray-1 do
  begin
    TempStr:=PortfoliosArray[i];
    delete(TempStr,1,8+length(inttostr(i)));
    delete(TempStr,pos(',limit_',TempStr),length(TempStr));
    try
      BalanceResponse.portfolios[i].amount:=StrToInt(TempStr);
    except
      BalanceResponse.portfolios[i].amount:=-1000;
    end;
    delete(PortfoliosArray[i],1,8+length(TempStr)+length(inttostr(i)));

    TempStr:=PortfoliosArray[i];
    delete(TempStr,1,8+length(inttostr(i)));
    delete(TempStr,pos(',currency_'+inttostr(i),TempStr),length(TempStr));
    try
      BalanceResponse.portfolios[i].limit:=StrToInt(TempStr);
    except
      BalanceResponse.portfolios[i].limit:=-1000;
    end;
    delete(PortfoliosArray[i],1,8+length(TempStr)+length(inttostr(i)));

    TempStr:=PortfoliosArray[i];
    delete(TempStr,1,15+length(inttostr(i)));
    delete(TempStr,pos(',name=',TempStr),length(TempStr));
    BalanceResponse.portfolios[i].currency.id:=TempStr;
    delete(PortfoliosArray[i],1,15+length(inttostr(i))+length(TempStr));

    TempStr:=PortfoliosArray[i];
    delete(TempStr,1,6);
    delete(TempStr,pos(',short=',TempStr),length(TempStr));
    BalanceResponse.portfolios[i].currency.name:=TempStr;
    delete(PortfoliosArray[i],1,length(TempStr)+6);

    TempStr:=PortfoliosArray[i];
    delete(TempStr,1,7);
    delete(TempStr,pos('}',TempStr),1);
    BalanceResponse.portfolios[i].currency.short:=TempStr;
  end;
*)
end;

procedure TReplPhoneAccountF.genorderguid;
var
  TmpPathLength, TmpFileLength: cardinal;
  TmpPath, TmpFile: ansistring;
  TmpPathLen,TmpFileLen: LongInt;
  tmpF: TextFile;
begin
  TmpPathLength:= GetTempPath(0, PAnsiChar(TmpPath));
  SetLength(TmpPath, TmpPathLength);
  GetTempPath(TmpPathLength, PAnsiChar(TmpPath));
  SetLength(TmpFile, TmpPathLength+10);
  GetTempFileName(PAnsiChar(TmpPath), PAnsiChar(TEMP_FILE_PREFIX), 0, PAnsiChar(TmpFile));
  TmpPathLen:= length(TmpPath);
  TmpFileLen:= length(TmpFile);

  try
    GenerateOrderGUID(TmpPath,TmpFile,TmpPathLen,TmpFileLen);
  except
    on E:Exception do
      MainF.MessBox('Произошла ошибка в подключаемой библиотеке'+#13+E.Message,16);
  end;

  if FileExists(TmpFile) then
  begin
    AssignFile(tmpF,TmpFile);
    Reset(tmpF);
    Read(tmpF,Colibry.pOrderGuid);
    CloseFile(tmpF);
  end;
  DeleteFile(PAnsiChar(TmpFile));
end;

procedure TReplPhoneAccountF.account(var err:boolean);
var
  TmpPathLength, TmpFileLength: cardinal;
  TmpPath, TmpFile: ansistring;
  TmpPathLen,TmpFileLen: LongInt;
  tmpF: TextFile;
  AccountRslt: AnsiString;
begin
  err:=false;
  TmpPathLength:= GetTempPath(0, PAnsiChar(TmpPath));
  SetLength(TmpPath, TmpPathLength);
  GetTempPath(TmpPathLength, PAnsiChar(TmpPath));
  SetLength(TmpFile, TmpPathLength+10);
  GetTempFileName(PAnsiChar(TmpPath), PAnsiChar(TEMP_FILE_PREFIX), 0, PAnsiChar(TmpFile));
  TmpPathLen:= length(TmpPath);
  TmpFileLen:= length(TmpFile);

  try
    ACCOUNT_Request({Colibry.UserName,Colibry.Password,Colibry.BaseURL,}Colibry.UserKey,Colibry.pObject,Colibry.pAccount,Colibry.pAccType,Colibry.pAmount,Colibry.pService,Colibry.pOrderGuid,TmpPath,TmpFile,TmpPathLen,TmpFileLen,err);
  except
    on E:Exception do
      MainF.MessBox('Произошла ошибка в подключаемой библиотеке'+#13+E.Message,16);
  end;

  if err then
  begin
    MainF.MessBox('Пополнение не возможно!'+#13+
               'Проверьте параметры подключения к сервису пополнения!'+#13+
               'За дополнительной информацией обратитесь в IT-отдел!',16);
    Self.Close;
    exit;
  end;

  if FileExists(TmpFile) then
  begin
    AssignFile(tmpF,TmpFile);
    Reset(tmpF);
    Read(tmpF,AccountRslt);
    CloseFile(tmpF);
  end;
  if not err then FillAccountResponce(AccountRslt);
  DeleteFile(PAnsiChar(TmpFile));
end;

procedure TReplPhoneAccountF.FillAccountResponce(Acc_responce:ansistring);
var
  responce_string: widestring;
  TempStr: string;
begin
  responce_string:=Acc_responce;
  if Pos('[status=',responce_string) > 0 then
  begin
    delete(responce_string,1,8);
    delete(responce_string,length(responce_string),1);
  end;

  //распарс(ш)ивание ответа
  if Length(Trim(responce_string)) > 0 then
  begin
    AccountResponse.status:=responce_string;
    Delete(AccountResponse.status,pos(',description=',AccountResponse.status),length(AccountResponse.status));
    delete(responce_string,1,length(AccountResponse.status)+13);
  end;

  if LowerCase(AccountResponse.status)='o' then
  begin
    AccountResponse.description:=responce_string;
    delete(AccountResponse.description,pos(',providercode=',AccountResponse.description),length(AccountResponse.description));
    delete(responce_string,1,length(AccountResponse.description)+14);

    TempStr:=responce_string;
    delete(TempStr,pos(',code=',TempStr),length(TempStr));
    try
      AccountResponse.providercode:=StrToInt(TempStr);
    except
      AccountResponse.providercode:=0;
    end;
    Delete(responce_string,1,length(TempStr)+6);

    TempStr:=responce_string;
    Delete(TempStr,pos(',service=',TempStr),length(TempStr));
    try
      AccountResponse.code:=StrToInt(TempStr);
    except
      AccountResponse.code:=0;
    end;
    delete(responce_string,1,length(TempStr)+9);

    AccountResponse.service:=responce_string;
    delete(AccountResponse.service,pos(',limit=',AccountResponse.service),length(AccountResponse.service));
    delete(responce_string,1,length(AccountResponse.service)+7);

    TempStr:=responce_string;
    delete(TempStr,pos(',fee=',TempStr),length(TempStr));
    try
      AccountResponse.limit:=StrToFloat(TempStr);
    except
      AccountResponse.limit:=0;
    end;
    delete(responce_string,1,length(TempStr)+5);

    TempStr:=responce_string;
    delete(TempStr,pos(',currency=',TempStr),length(TempStr));
    try
      AccountResponse.fee:=StrToFloat(TempStr);
    except
      AccountResponse.fee:=0;
    end;
    delete(responce_string,1,length(TempStr)+10);

    AccountResponse.currency:=responce_string;
    delete(AccountResponse.currency,pos(',dpamount=',AccountResponse.currency),length(AccountResponse.currency));
    delete(responce_string,1,length(AccountResponse.currency)+10);

    AccountResponse.dpamount:=responce_string;
    delete(AccountResponse.dpamount,pos(',dpcurrency=',AccountResponse.dpamount),length(AccountResponse.dpamount));
    delete(responce_string,1,length(AccountResponse.dpamount)+12);

    AccountResponse.dpcurrency:=responce_string;
    if pos(',orderguid=',AccountResponse.dpcurrency) > 0 then
      delete(AccountResponse.dpcurrency,pos(',orderguid=',AccountResponse.dpcurrency),length(AccountResponse.dpcurrency));
    if pos(',providerid=',AccountResponse.dpcurrency) > 0 then
      delete(AccountResponse.dpcurrency,pos(',providerid=',AccountResponse.dpcurrency),length(AccountResponse.dpcurrency));
    delete(responce_string,1,length(AccountResponse.dpcurrency));

    if Pos(',orderguid=',responce_string) > 0 then
    begin
      AccountResponse.OrderGUID:=responce_string;
      delete(AccountResponse.OrderGUID,1,11);
      delete(responce_string,1,11);
      delete(AccountResponse.OrderGUID,pos(',providerid=',AccountResponse.OrderGUID),length(AccountResponse.OrderGUID));
      delete(responce_string,pos(',providerid=',responce_string),length(responce_string));
    end;

    if pos(',providerid=',responce_string) > 0 then
    begin
      TempStr:=responce_string;
      delete(TempStr,1,12);
      delete(responce_string,1,12);
      try
        AccountResponse.providerid:=StrToInt(TempStr);
      except
        AccountResponse.providerid:=-100500;
      end;
    end;
  end;
end;

function TReplPhoneAccountF.PrintChek(var CP:TChekPos):Boolean;
const   TerminalIdTemplate = '00000000';
var
  Mess, Nm, Nm1: string;
  F_NDS: integer;
  SumA, SumF: real;
  Ty: Integer;
  TakedSum, SumChek: Currency;
  Licens : string;
  PhoneNum : string;
begin
  //оригинал - procedure TOptSumF.BitBtn1Click(Sender: TObject);
  Result:=False;
  if (MainF.cbEKKA.Checked) and (EKKA.EmulEKKA=False) then
  begin
    MainF.MessBox('Кассовый аппарат не используется! Пробитие невозможно!');
    Exit;
  end;
  Mess:='Вы действительно хотите пробить сумму пополнения?';

  if MainF.MessBox(Mess,52)<>ID_YES then Exit;

  if Not CheckReal(Self.edPaySum.Text) then
  begin
    MainF.MessBox('Проверьте правильность ввода номера абонента и суммы пополнения!');
    Self.edAmount.SetFocus;
    Exit;
  end
  else
    SumA:=StrToCurr(CurrToStrF(StrToCurr(SElf.edAmount.Text),ffFixed,2));
  SumF:=StrToCurr(CurrToStrF(StrToCurr(Self.edFee.Text),ffFixed,2));

  try
    if Not EKKA.fpGetStatus then AbortM(EKKA.LastErrorDescr);

    EKKA.fpCancelFiscalReceipt;

    if EKKA.ReceiptNumber<0 then AbortM('Ошибка определения номера чека');
    CP.NumbChek:=EKKA.ReceiptNumber+1;

    if Not EKKA.fpOpenFiscalReceipt then AbortM('Ошибка открытия чека: '+EKKA.LastErrorDescr);
    //if Not EKKA.fpAddFinStr(StatusResponse.service.name) then AbortM('Ошибка добавления строк: '+EKKA.LastErrorDescr);

    Nm1:='Електроннi грошi';
    {
    if ReplPhoneAccountF.lbService.Caption='Vodafone' then Nm1:='Послуги ПрАТ "МТС УКРАЇНА"' else
    if ReplPhoneAccountF.lbService.Caption='Kyivstar' then Nm1:='Київстар, 8gmn' else
    if ReplPhoneAccountF.lbService.Caption='LifeCell' then Nm1:='Послуги LifeCell';
    }
    {Уберем из номера телефона пробелы т +38}
    PhoneNum := StringReplace(EKKA.FirmNameUA, ' ','',[rfReplaceAll]);
    PhoneNum := StringReplace(PhoneNum, '+38','',[rfReplaceAll]);
    if Not EKKA.fpAddSale(Nm1, 1, SumA, 1, 0, 3, 0, '') then AbortM('Ошибка пробития позиции чека: '+EKKA.LastErrorDescr);
    if Not EKKA.fpAddSale('Комисія, шт', 1, SumF, 1, 0, 1, 0, '') then AbortM('Ошибка пробития позиции чека: '+EKKA.LastErrorDescr);

    EKKA.fpServiceText(1,1,0,'№ терминала: '+Copy(TerminalIdTemplate,1,Length(TerminalIdTemplate)-Length(Prm.c_code)) + Prm.c_code);
    EKKA.fpServiceText(1,1,0,'№ тел.:'+Self.edAccount.Text);
    EKKA.fpServiceText(1,1,0,'Агент розповсюдження ');
    EKKA.fpServiceText(1,1,0,StringReplace(EKKA.FirmNameUA, '"','''',[rfReplaceAll]));
    EKKA.fpServiceText(1,1,0,'ЄДРПОУ  '+EKKA.sID);
    EKKA.fpServiceText(1,1,0,'Номер підтримки: ' );
    EKKA.fpServiceText(1,1,0,'    0504030444');
    EKKA.fpServiceText(1,1,0,'    0675794774');
    EKKA.fpServiceText(1,1,0,'    0931977155');

    EKKA.fpServiceText(1,1,0,'Генеральний агент');
    EKKA.fpServiceText(1,1,0,'ТОВ ''ЕЛЕКТРУМ ПЕЙМЕНТ СІСТЕМ''');
    EKKA.fpServiceText(1,1,0,'м.Київ,вул.Столичне шосе, 103');
    EKKA.fpServiceText(1,1,0,' ');
    EKKA.fpServiceText(1,1,0,'ЄДРПОУ 40243180');
    EKKA.fpServiceText(1,1,0,'РР 26507008000057');
    EKKA.fpServiceText(1,1,0,'у АК ''УКРГАЗБАНК''');
    EKKA.fpServiceText(1,1,0,'МФО 320478');
    EKKA.fpServiceText(1,1,0,'');
    case Prm.FirmID of
      //ПФ "Гамма-55"
      1: Licens := '1702/39 від 16.04.2018';
      // ПП "Аптека 2011"
      3: Licens := '1702/36 від 12.04.2018';
      // ПП "Темп 2011"
      4: Licens := '1702/40 від 16.04.2018';
      //ПП "ФАРМАРОСТ 2011"
      6: Licens := '1702/33 від 11.04.2018';
      //ТОВ "ДАНУНЦ"
      9: Licens := '1702/35 від 11.04.2018';
      // ТОВ "Аптека №308"
      13: Licens := '1702/37 від 12.04.2018';
      // 16 ЦРА
      14: Licens := '1702/38 від 12.04.2018';
      // ТОВ "Регiонфарм 2016"
      18:Licens := '1702/41 від 16.04.2018';
    end;

    EKKA.fpServiceText(1,1,0,'Договір '+Licens);

    SumChek:=StrToCurr(Self.edPaySum.Text);
    Ty:=4;

    if Ty=4 then
     begin
      if StrToCurr(Self.edSum.Text)>SumChek then TakedSum:=StrToCurr(Self.edSum.Text)
                                                         else TakedSum:=SumChek;
     end else TakedSum:=SumChek;
    //if Not EKKA.fpCloseFiscalReceipt(TakedSum,Ty,SumChek) then AbortM('Ошибка закрытия чека: '+EKKA.LastErrorDescr);
    if Not EKKA.fpCloseFiscalReceipt(TakedSum,Ty,SumChek,0,false,0,StrToIntDef(MainF.RRN,1),MainF.BankCard) then AbortM('Ошибка закрытия чека: '+EKKA.LastErrorDescr);

    CP.ID_User:=Prm.ID_Gamma;
    CP.ID_Kassa:=Opt.KassaID;
    CP.PSkd:=0;
    CP.NumCard:=-1;
    CP.TypeOplat:=TO_CASH;
    CP.ArtName:=Copy(Nm,1,16);
    CP.Kod_Name:=0;
    CP.Kol:=0;
    CP.Cena:=SumA+SumF;
    CP.Type_Tov:=1;
    CP.Date:=DM.GetServerDate;
    CP.Vzh:=MainF.VzhNum;
    CP.VzhSafe:=CP.Vzh;

    DM.QrEx.Close;
    DM.QrEx.SQL.Clear;
    DM.QrEx.SQL.Add('DECLARE @temp_ID TABLE (ID INT);');
    DM.QrEx.SQL.Add('insert into arh_replenishments(unique_num_check,dt,id_kassa,kassa_num,id_gamma,vzh,f_nds,amount,fee,numb_chek) ');
    DM.QrEx.SQL.Add('OUTPUT INSERTED.row_id INTO @temp_ID(ID) ');
    DM.QrEx.SQL.Add('values(');
    DM.QrEx.SQL.Add('NewId(),getdate(),'+IntToStr(CP.ID_Kassa)+',1,'+IntToStr(CP.ID_User)+','+IntToStr(CP.Vzh)+',1,'+Self.edAmount.Text+','+Self.edFee.Text+','+IntToStr(CP.NumbChek)+')');
    DM.QrEx.SQL.Add('select top 1 ID from  @temp_ID');
    DM.QrEx.Open;
    CP.Row_id:=DM.QrEx.FieldByName('id').AsInteger;
    Result:=True;


    TryWriteToJournal;
  except
    on E:Exception do
    begin
      EKKA.fpCancelFiscalReceipt;
      if E.Message<>'' then MainF.MessBox(E.Message) else MainF.MessBox('Ошибка пробивки суммы!');
    end;
  end;
end;

procedure TReplPhoneAccountF.order(var err:boolean);
var
  TmpPath, TmpFile: ansistring;
  TmpPathLength, TmpFileLength: cardinal;
  TmpPathLen,TmpFileLen: LongInt;
  tmpF: TextFile;
  OrderRslt: ansistring;
begin
  err:=false;
  TmpPathLength:= GetTempPath(0, PAnsiChar(TmpPath));
  SetLength(TmpPath, TmpPathLength);
  GetTempPath(TmpPathLength, PAnsiChar(TmpPath));
  SetLength(TmpFile, TmpPathLength+10);
  GetTempFileName(PAnsiChar(TmpPath), PAnsiChar(TEMP_FILE_PREFIX), 0, PAnsiChar(TmpFile));
  TmpPathLen:= length(TmpPath);
  TmpFileLen:= length(TmpFile);

  try
    ORDER_Request(Colibry.UserKey,Colibry.UserName,Colibry.Password,Colibry.pObject,Colibry.BaseURL,Colibry.pAccount,Colibry.pAccType,Colibry.pAmount,Colibry.pService,Colibry.pOrderGuid,TmpPath,TmpFile,TmpPathLen,TmpFileLen,err);
  except
    on E:Exception do
      MainF.MessBox('Произошла ошибка в подключаемой библиотеке'+#13+E.Message,16);
  end;

  if err then
  begin
    MainF.MessBox('Пополнение не возможно!'+#13+
               'Проверьте параметры подключения к сервису пополнения!'+#13+
               'За дополнительной информацией обратитесь в IT-отдел!',16);
    Self.Close;
    exit;
  end;

  if FileExists(TmpFile) then
  begin
    AssignFile(tmpF,TmpFile);
    Reset(tmpF);
    Read(tmpF,OrderRslt);
    CloseFile(tmpF);
    DeleteFile(PAnsiChar(TmpFile));
  end;
  if not err then FillOrderResponse(OrderRslt);
  DeleteFile(PAnsiChar(TmpFile));
end;

procedure TReplPhoneAccountF.FillOrderResponse(ord_responce:ansistring);
var
  responce_string: widestring;
  TempStr: string;
begin
  responce_string:=ord_responce;
  if Pos('[status=',responce_string) > 0 then
  begin
    delete(responce_string,1,8);
    delete(responce_string,length(responce_string),1);
  end;

  //распарс(ш)ивание ответа
  if Length(Trim(responce_string)) > 0 then
  begin
    OrderResponse.status:=responce_string;
    Delete(OrderResponse.status,pos(',description=',OrderResponse.status),length(OrderResponse.status));
    delete(responce_string,1,length(OrderResponse.status)+13);

    OrderResponse.description:=responce_string;
    delete(OrderResponse.description,pos(',code=',OrderResponse.description),length(OrderResponse.description));
    delete(responce_string,1,length(OrderResponse.description)+6);
  end;

  if (LowerCase(OrderResponse.status)='c')or(LowerCase(OrderResponse.status)='w') then
  begin
    TempStr:=responce_string;
    delete(TempStr,pos(',orderid=',TempStr),length(TempStr));
    try
      OrderResponse.code:=StrToInt(TempStr);
    except
      OrderResponse.code:=0;
    end;
    Delete(responce_string,1,length(TempStr)+9);

    TempStr:=responce_string;
    delete(TempStr,pos(',createdate=',TempStr),length(TempStr));
    try
      OrderResponse.orderid:=StrToInt(TempStr);
    except
      OrderResponse.orderid:=0;
    end;
    Delete(responce_string,1,length(TempStr)+12);

    TempStr:=responce_string;
    delete(TempStr,pos(',transdate=',TempStr),length(TempStr));
    OrderResponse.createdate:=TempStr;
    delete(responce_string,1,length(TempStr)+11);

    TempStr:=responce_string;
    delete(TempStr,pos(',payid=',TempStr),length(TempStr));
    OrderResponse.transdate:=TempStr;
    delete(responce_string,1,length(TempStr)+7);

    TempStr:=responce_string;
    delete(TempStr,pos(',amount=',TempStr),length(TempStr));
    try
      OrderResponse.payid:=StrToInt(TempStr);
    except
      OrderResponse.payid:=0;
    end;
    Delete(responce_string,1,length(TempStr)+8);

    TempStr:=responce_string;
    delete(TempStr,pos(',fee=',TempStr),length(TempStr));
    try
      OrderResponse.amount:=StrToFloat(TempStr);
    except
      OrderResponse.amount:=0;
    end;
    Delete(responce_string,1,length(TempStr)+5);

    TempStr:=responce_string;
    delete(TempStr,pos(',account=',TempStr),length(TempStr));
    try
      OrderResponse.fee:=StrToFloat(TempStr);
    except
      OrderResponse.fee:=0;
    end;
    Delete(responce_string,1,length(TempStr)+9);

    TempStr:=responce_string;
    delete(TempStr,pos(',acctype=',TempStr),length(TempStr));
    OrderResponse.account:=TempStr;
    delete(responce_string,1,length(TempStr)+9);

    TempStr:=responce_string;
    delete(TempStr,pos(',name=',TempStr),length(TempStr));
    OrderResponse.acctype:=TempStr;
    delete(responce_string,1,length(TempStr)+6);

    TempStr:=responce_string;
    delete(TempStr,pos(',service={id=',TempStr),length(TempStr));
    OrderResponse.name:=TempStr;
    delete(responce_string,1,length(TempStr)+13);

    TempStr:=responce_string;
    delete(TempStr,pos('}',TempStr),length(TempStr));
    try
      OrderResponse.service.id:=StrToInt(TempStr);
    except
      OrderResponse.service.id:=0;
    end;
  end;
end;

procedure TReplPhoneAccountF.status(var err:boolean);
var
  TmpPath, TmpFile: ansistring;
  TmpPathLength, TmpFileLength: cardinal;
  TmpPathLen,TmpFileLen: LongInt;
  tmpF: TextFile;
  StatusRslt: ansistring;
begin
  err:=false;
  TmpPathLength:= GetTempPath(0, PAnsiChar(TmpPath));
  SetLength(TmpPath, TmpPathLength);
  GetTempPath(TmpPathLength, PAnsiChar(TmpPath));
  SetLength(TmpFile, TmpPathLength+10);
  GetTempFileName(PAnsiChar(TmpPath), PAnsiChar(TEMP_FILE_PREFIX), 0, PAnsiChar(TmpFile));
  TmpPathLen:= length(TmpPath);
  TmpFileLen:= length(TmpFile);

  try
    STATUS_Request(Colibry.UserKey,Colibry.UserName,Colibry.Password,Colibry.pObject,Colibry.BaseURL,Colibry.pOrderGuid,TmpPath,TmpFile,TmpPathLen,TmpFileLen,err);
  except
    on E:Exception do
      MainF.MessBox('Произошла ошибка в подключаемой библиотеке'+#13+E.Message,16);
  end;

  if err then
  begin
    MainF.MessBox('Пополнение не возможно!'+#13+
               'Проверьте параметры подключения к сервису пополнения!'+#13+
               'За дополнительной информацией обратитесь в IT-отдел!',16);
    Self.Close;
    exit;
  end;

  if FileExists(TmpFile) then
  begin
    AssignFile(tmpF,TmpFile);
    Reset(tmpF);
    Read(tmpF,StatusRslt);
    CloseFile(tmpF);
  end;
  if not err then FillStatusResponse(StatusRslt);
  DeleteFile(PAnsiChar(TmpFile));
end;

procedure TReplPhoneAccountF.FillStatusResponse(stat_responce:ansistring);
var
  responce_string: widestring;
  TempStr: string;
begin
  responce_string:=stat_responce;
  delete(responce_string,1,8);
  delete(responce_string,length(responce_string),1);

  TempStr:=responce_string;
  delete(TempStr,pos(',description=',TempStr),length(TempStr));
  StatusResponse.status:=TempStr;
  delete(responce_string,1,length(TempStr)+13);

  TempStr:=responce_string;
  delete(TempStr,pos(',code=',TempStr),length(TempStr));
  StatusResponse.description:=TempStr;
  delete(responce_string,1,length(TempStr)+6);

  if (LowerCase(StatusResponse.status)='e') or (LowerCase(StatusResponse.status)='r') or (trim(StatusResponse.status)='') then
  begin
    TempStr:=responce_string;
    try
      StatusResponse.code:=StrToInt(TempStr);
    except
      StatusResponse.code:=0;
    end;
  end
  else
  begin
    TempStr:=responce_string;
    delete(TempStr,pos(',orderid=',TempStr),length(TempStr));
    try
      StatusResponse.code:=StrToInt(TempStr);
    except
      StatusResponse.code:=0;
    end;
    delete(responce_string,1,length(TempStr)+9);

    TempStr:=responce_string;
    delete(TempStr,pos(',payid=',TempStr),length(TempStr));
    try
      StatusResponse.orderid:=StrToInt(TempStr);
    except
      StatusResponse.orderid:=0;
    end;
    delete(responce_string,1,length(TempStr)+7);

    TempStr:=responce_string;
    delete(TempStr,pos(',receipt=',TempStr),length(TempStr));
    try
      StatusResponse.payid:=StrToInt(TempStr);
    except
      StatusResponse.payid:=0;
    end;
    delete(responce_string,1,length(TempStr)+9);

    TempStr:=responce_string;
    delete(TempStr,pos(',amount=',TempStr),length(TempStr));
    try
      StatusResponse.receipt:=StrToInt(TempStr);
    except
      StatusResponse.receipt:=0;
    end;
    delete(responce_string,1,length(TempStr)+8);

    TempStr:=responce_string;
    delete(TempStr,pos(',currency=',TempStr),length(TempStr));
    try
      StatusResponse.amount:=StrToFloat(TempStr);
    except
      StatusResponse.amount:=0;
    end;
    delete(responce_string,1,length(TempStr)+10);

    TempStr:=responce_string;
    delete(TempStr,pos(',dpamount=',TempStr),length(TempStr));
    StatusResponse.currency:=TempStr;
    delete(responce_string,1,length(TempStr)+10);

    TempStr:=responce_string;
    delete(TempStr,pos(',dpcurrency=',TempStr),length(TempStr));
    try
      StatusResponse.dpamount:=StrToFloat(TempStr);
    except
      StatusResponse.dpamount:=0;
    end;
    delete(responce_string,1,length(TempStr)+12);

    TempStr:=responce_string;
    delete(TempStr,pos(',fee=',TempStr),length(TempStr));
    StatusResponse.dpcurrency:=TempStr;
    delete(responce_string,1,length(TempStr)+5);

    TempStr:=responce_string;
    delete(TempStr,pos(',createdate=',TempStr),length(TempStr));
    try
      StatusResponse.fee:=StrToFloat(TempStr);
    except
      StatusResponse.fee:=0;
    end;
    delete(responce_string,1,length(TempStr)+12);

    TempStr:=responce_string;
    delete(TempStr,pos(',transdate=',TempStr),length(TempStr));
    StatusResponse.createdate:=TempStr;
    delete(responce_string,1,length(TempStr)+11);

    TempStr:=responce_string;
    delete(TempStr,pos(',account=',TempStr),length(TempStr));
    StatusResponse.transdate:=TempStr;
    delete(responce_string,1,length(TempStr)+9);

    TempStr:=responce_string;
    delete(TempStr,pos(',acctype=',TempStr),length(TempStr));
    StatusResponse.account:=TempStr;
    delete(responce_string,1,length(TempStr)+9);

    TempStr:=responce_string;
    delete(TempStr,pos(',service={id=',TempStr),length(TempStr));
    StatusResponse.acctype:=TempStr;
    delete(responce_string,1,length(TempStr)+13);

    TempStr:=responce_string;
    delete(TempStr,pos(',name=',TempStr),length(TempStr));
    StatusResponse.service.id:=TempStr;
    delete(responce_string,1,length(TempStr)+6);

    TempStr:=responce_string;
    delete(TempStr,pos('}',TempStr),length(TempStr));
    StatusResponse.service.name:=TempStr;
    delete(responce_string,1,length(TempStr)+1);
  end;
end;

procedure TReplPhoneAccountF.SaveTransferToDB(CP:TChekPos);
var
  i: integer;
  status_abr: string;
  status_description: string;
  status_code: integer;
  order_id: integer;
  create_date: string;
  trans_date: string;
  pay_id: integer;
  amount: double;
  fee: Double;
  servicename: string;
  account: string;
  acctype: string;
  currency_id: integer;
  currency_name: string;
  ErrorFileName: string;
begin
{
 row_id int IDENTITY(1,1) NOT NULL,    -- номер записи
 unique_num_check binary(16) not null, -- уникальный номер (GUID) чека
 dt datetime not null,                 -- дата/время чека
 id_kassa smallint null,               -- номер кассы на ТТ
 kassa_num smallint null,              -- вид оплаты. для наличных = 1
 id_gamma int null,                     -- код пользователя (глобальный, Prm.ID_Gamma
 vzh numeric(10,0) null,               -- заводской номер кассового аппарата
 f_nds smallint null,                  -- ставка НДС 1 - 20%, 2 - 7%. по умолчанию = 1
 status_abr varchar(10) null,          -- статус платежа: " " или "E" или "R" - ошибка; "W" - в процессе; "C" - удачный платеж
 status_description varchar(150) null, -- описание статуса
 status_code int null,                 -- код статуса
 order_id int null,                    -- ID платежа (удаленный сервис)
 create_date varchar(23) null,         -- дата создания платежа
 trans_date varchar(23) null,          -- дата проведения платежа
 pay_id int null,                      -- ID платежа поставщика
 amount numeric(12,2) null,            -- сумма платежа в копейках
 fee numeric(12,2) null,               -- комиссия в копейках
 service_id varchar(10) null,          -- ID услуги
 servicename varchar(50) null,         -- название услуги
 account varchar(25) null,             -- аккаунт (номер пополнения)
 acctype varchar(5) null,              -- тип аккаунта (P - номер; A - счет)
 currency_id varchar(5) null,          -- идентификатор валюты (=980 - гривна)
 currency_name varchar(15) null        -- название валюты (гривна)
}
  with Self.qSaveReplenishment do
  begin
    if (LowerCase(OrderResponse.status) = 'c') then
    begin
      status_abr:=OrderResponse.status;
      status_description:=OrderResponse.description;
      status_code:=OrderResponse.code;
      order_id:=OrderResponse.orderid;
      create_date:=OrderResponse.createdate;
      trans_date:=OrderResponse.transdate;
      pay_id:=OrderResponse.payid;
      amount:=OrderResponse.amount;
      fee:=OrderResponse.fee;
      for i:=0 to length(ServiceResponse.Data)-1 do
      begin
        if (ServiceResponse.Data[i].ServiceType.id = IntToStr(OrderResponse.service.id)) then servicename:=ServiceResponse.Data[i].ServiceType.name;
        Break;
      end;
      account:=StatusResponse.account;
      acctype:=OrderResponse.acctype;
      for i:=0 to length(BalanceResponse.portfolios)-1 do
      begin
        if (LowerCase(StatusResponse.status)='w')or(LowerCase(StatusResponse.status)='c') then
        begin
          currency_id:=StrToInt(StatusResponse.currency);
          if StatusResponse.currency =  BalanceResponse.portfolios[i].currency.id then
          begin
            currency_id:=StrToInt(BalanceResponse.portfolios[i].currency.id);
            currency_name:=BalanceResponse.portfolios[i].currency.name;
            Break;
          end;
        end;
      end;
    end
    else
    begin
      if (LowerCase(OrderResponse.status) = 'w') then
        if (LowerCase(StatusResponse.status)='w')or(LowerCase(StatusResponse.status)='c') then
        begin
          status_abr:=StatusResponse.status;
          status_description:=StatusResponse.description;
          status_code:=StatusResponse.code;
          order_id:=StatusResponse.orderid;
          create_date:=StatusResponse.createdate;
          trans_date:=StatusResponse.transdate;
          pay_id:=StatusResponse.payid;
          amount:=StatusResponse.amount;
          fee:=StatusResponse.fee;
          for i:=0 to length(ServiceResponse.Data) do
          begin
            if (ServiceResponse.Data[i].ServiceType.id = StatusResponse.service.id) then servicename:=ServiceResponse.Data[i].ServiceType.name;
            Break;
          end;
          account:=OrderResponse.account;
          acctype:=StatusResponse.acctype;
          for i:=0 to length(BalanceResponse.portfolios)-1 do
          begin
            currency_id:=StrToInt(StatusResponse.currency);
            if StatusResponse.currency =  BalanceResponse.portfolios[i].currency.id then
            begin
              currency_id:=StrToInt(BalanceResponse.portfolios[i].currency.id);
              currency_name:=BalanceResponse.portfolios[i].currency.name;
              Break;
            end;
          end;
        end;
    end;

    try
      Close;
      SQL.Clear;
      SQL.Text:=SQL.Text+'update ';
      SQL.Text:=SQL.Text+'  arh_replenishments ';
      SQL.Text:=SQL.Text+'set';
      SQL.Text:=SQL.Text+'  status_abr = '''+status_abr+''', '; //status_abr varchar(10) null,          -- статус платежа: " " или "E" или "R" - ошибка; "W" - в процессе; "C" - удачный платеж
      SQL.Text:=SQL.Text+'  status_description = '''+status_description+''', '; //status_description varchar(150) null, -- описание статуса
      SQL.Text:=SQL.Text+'  status_code = '+IntToStr(status_code)+', '; //status_code int null,                 -- код статуса
      SQL.Text:=SQL.Text+'  order_id = '+IntToStr(order_id)+', '; //order_id int null,                    -- ID платежа (удаленный сервис)
      SQL.Text:=SQL.Text+'  create_date = '''+create_date+''', '; //create_date varchar(23) null,         -- дата создания платежа
      SQL.Text:=SQL.Text+'  trans_date = '''+trans_date+''','; //trans_date varchar(23) null,          -- дата проведения платежа
      SQL.Text:=SQL.Text+'  pay_id = '+IntToStr(pay_id)+', '; //pay_id int null,                      -- ID платежа поставщик
      SQL.Text:=SQL.Text+'  service_id = '''+Colibry.pService+''', '; //service_id varchar(10) null,          -- ID услуги
      SQL.Text:=SQL.Text+'  servicename = '''+servicename+''', '; //servicename varchar(50) null,         -- название услуги
      SQL.Text:=SQL.Text+'  account = '''+account+''', '; //account varchar(25) null,             -- аккаунт (номер пополнения)
      SQL.Text:=SQL.Text+'  acctype = '''+acctype+''', '; //acctype varchar(5) null,              -- тип аккаунта (P - номер; A - счет)
      SQL.Text:=SQL.Text+'  currency_id = '''+IntToStr(currency_id)+''', '; //currency_id varchar(5) null,          -- идентификатор валюты (=980 - гривна)
      SQL.Text:=SQL.Text+'  currency_name = '''+currency_name+''''; //currency_name varchar(15) null        -- название валюты (гривна)
      SQL.Text:=SQL.Text+'where ';
      SQL.Text:=SQL.Text+'  row_id = '+IntToStr(CP.Row_id);

      ExecSQL;
    except
      on Exception do
      begin
        ErrorFileName:='pc_col_'+FormatDateTime('YYYY-MM-DD_HH-MM-SS',Date())+'.pce';
        MainF.MessBox('Информация о платеже не была сохранена в БД!'+#13+
                      'Запрос на запись в БД: '+Self.qSaveReplenishment.SQL.Text+#13+
                      'Обратитесь в IT-отдел!',16);
      end;
    end;
  end;
end;
(*----------------------------------------------------------------------------*)

procedure TReplPhoneAccountF.btAccountKeyDown(Sender:TObject;
  var Key:Word;Shift:TShiftState);
begin
  if Key=VK_RETURN then
  begin
    if edSum.Visible then btOK.SetFocus
  end
  else if Key=VK_ESCAPE then
    btCancelClick(sender);
end;

procedure TReplPhoneAccountF.FormShow(Sender: TObject);
begin
  try
    //1. Проверить заполнение полей UserKey, UserName, Password, BaseURL
    //2. Если одно из полей UserName, Password, BaseURL пустое - предложить заполнить значения. Для UserKey - сгенерировать новый ключ
    if not CreateColibry then
      Self.Close;
  finally
    edAccount.SetFocus;
  end;
end;

function TReplPhoneAccountF.GetAmountSum: Currency;
begin
  Result := StrToCurrDef(edAmount.Text,0);
end;

function TReplPhoneAccountF.GetFeeSum: Currency;
begin
  Result := StrToCurrDef(edFee.Text,0);
end;

procedure TReplPhoneAccountF.SetAmountSum(const Value: Currency);
begin
  edAmount.Text := CurrToStr(Value);
end;

procedure TReplPhoneAccountF.Clear;
begin
  AmountSum := 0;
end;

function TReplPhoneAccountF.GetCustomerSum: Currency;
begin
  Result := StrToCurrDef(edSum.Text,0);
end;

procedure TReplPhoneAccountF.SetCustomerSum(const Value: Currency);
begin
  edSum.Text := CurrToStr(Value);
end;

procedure TReplPhoneAccountF.edPaySumChange(Sender: TObject);
begin
  if Assigned(fOnChangePaySum) then
    fOnChangePaySum(PaySum);
end;

function TReplPhoneAccountF.GetPaySum: Currency;
begin
  result := StrToCurrDef(edPaySum.Text,0);
end;

class function TReplPhoneAccountF.CheckAccess: boolean;
var
  SettingsExists : Boolean;
begin
  // все условия соблюдены, можно пополнять мобильный
  Result := Prm.ReadyToChargePhone
            AND CheckConnection(Prm.baseurl);
end;

end.
