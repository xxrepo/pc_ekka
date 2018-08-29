unit ReplPhoneAccountU;

interface

uses
  Forms, Classes, Controls, StdCtrls, Buttons, Dialogs, SysUtils, Util, Windows,
  DB, ADODB, Graphics;
//  , Messages, Variants, ExtCtrls, Buttons, Grids, DBGrids,

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
    group: TGr_prov_type;
    provider: TGr_prov_type;
    ServiceType: TGr_prov_type;
    ImagePath: string;
    acctype: string;
    extratype: string;
    mask: string;
    minamount: double;
    maxamount: double;
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
    pAccount: string;
    pObject: string;
    pService: string;
    pAccType: string;
    pAmount: string;
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
  TReplPhoneAccountF = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    edAccount: TEdit;
    edAmount: TEdit;
    btOK: TBitBtn;
    btCancel: TBitBtn;
    lbSum: TLabel;
    lbSurrender: TLabel;
    edSurrender: TEdit;
    lbPaySum: TLabel;
    edPaySum: TEdit;
    edSum: TEdit;
    qSaveReplenishment: TADOQuery;
    lbFee: TLabel;
    edFee: TEdit;
    Label5: TLabel;
    lbService: TLabel;
    btAccount: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure edAccountEnter(Sender: TObject);
    procedure edAccountKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edAccountKeyPress(Sender: TObject; var Key: Char);
    procedure edAccountKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btCancelClick(Sender: TObject);
    procedure edAmountKeyPress(Sender: TObject; var Key: Char);
    procedure edAmountKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edAmountExit(Sender: TObject);
    procedure edAmountEnter(Sender: TObject);
    procedure edAmountChange(Sender: TObject);
    procedure edSumChange(Sender: TObject);
    procedure edSumKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edSumKeyPress(Sender: TObject; var Key: Char);
    procedure edAccountExit(Sender: TObject);
    procedure edAccountChange(Sender: TObject);
    procedure btAccountClick(Sender: TObject);
  end;

type
  TPhoneCodes_To_ServiceID = record
    PhoneCode: string;
    ServiceID: string;
    ProviderName: string;
    Color: TColor;
  end;

var
  ReplPhoneAccountF: TReplPhoneAccountF;
  Colibry: TColibry;
  AuthResponse: TAuthResponse;
  ServiceResponse: TServiceResponse;
  AccountResponse: TAccountResponse;
  BalanceResponse: TBalanceResponse;
  OrderResponse: TOrderResponse;
  StatusResponse: TStatusResponse;
  ChekOnly:Boolean;

const
  AccountPlaceHolder='+38 (___) ___-__-__';
  TmpFilePrefix = '~Ek'#0;
  btOK_BeforeAccount = 'Проверить возможность';
  btOK_BeforeOrder = 'Пополнить';
  PhoneCodes_To_ServiceID: array[1..13] of TPhoneCodes_To_ServiceID = ((PhoneCode:'050';ServiceID:'927';ProviderName:'Vodafone';Color:clRed),//mts
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
//  Intertelecom_Array: string[4] = '094';
//  PeopleNet_Array: string[4] = '092';
//  TriMob_Utel_Array: string[4] = '091';

implementation

uses
  MainU, ReplConnectionEditU, DataModuleU, EKKAU, ShareU;
{
uses Marry301U, MainU, DataModuleU, ShowTextU;
}

procedure CreateColibryAPI(TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt); stdcall; external 'ColibryDLL.dll';
procedure AUTH_Request(pUserKey: widestring; pUserName: widestring; pPassword: widestring; pBaseURL: widestring; TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt; IsError: boolean = false); stdcall; external 'ColibryDLL.dll';
procedure SERVICE_Request(pUserKey: widestring; pUserName: widestring; pPassword: widestring; pObject: widestring; pBaseURL: widestring; TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt; IsError: boolean = false); stdcall; external 'ColibryDLL.dll';
procedure BALANCE_Request(pUserKey: widestring; pUserName: widestring; pPassword: widestring; pObject: widestring; pBaseURL: widestring; TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt; IsError: boolean = false); stdcall; external 'ColibryDLL.dll';
procedure ACCOUNT_Request(pUserKey: WideString; pUserName: WideString; pPassword: WideString; pObject: WideString; pBaseURL: WideString; pAccount: WideString; pAccType: WideString; pAmount: WideString; pService: WideString; pOrderGuid: ansistring; TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt; IsError: boolean = false); stdcall; external 'ColibryDLL.dll';
procedure GenerateOrderGUID(TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt); stdcall; external 'ColibryDLL.dll';
procedure ORDER_Request(pUserKey: WideString; pUserName: WideString; pPassword: WideString; pObject: WideString; pBaseURL: WideString; pAccount: WideString; pAccType: WideString; pAmount: WideString; pService: WideString; pOrderGuid: ansistring; TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt; IsError: boolean = false); stdcall; external 'ColibryDLL.dll';
procedure STATUS_Request(pUserKey: widestring; pUserName: widestring; pPassword: widestring; pObject: widestring; pBaseURL: widestring; pOrderGUID: ansistring; TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt; IsError: boolean = false); stdcall; external 'ColibryDLL.dll';

{$R *.dfm}

procedure DisableControls;
begin
  with ReplPhoneAccountF do
  begin
    edAccount.Enabled:=false;
    edAmount.Enabled:=false;
    btAccount.Enabled:=false;
    edAccount.Enabled:=false;
    edFee.Enabled:=false;
    edPaySum.Enabled:=false;
    edSum.Enabled:=false;
    edSurrender.Enabled:=false;
    btOK.Enabled:=false;
    btCancel.Enabled:=false;
  end;
end;

procedure EnableControls;
begin
  with ReplPhoneAccountF do
  begin
    edAccount.Enabled:=true;
    edAmount.Enabled:=true;
    btAccount.Enabled:=true;
    edAccount.Enabled:=true;
    edFee.Enabled:=true;
    edPaySum.Enabled:=true;
    edSum.Enabled:=true;
    edSurrender.Enabled:=true;
    btOK.Enabled:=true;
    btCancel.Enabled:=true;
  end;
end;

function CreateColibry: boolean;
var
  TmpPathLength, TmpFileLength: cardinal;
  TmpPath, TmpFile: ansistring;
  TmpPathLen,TmpFileLen: LongInt;
  tmpF: TextFile;
  APIRslt: ansistring;
begin
  Result:=false;
  TmpPathLength:= GetTempPath(0, PAnsiChar(TmpPath));
  SetLength(TmpPath, TmpPathLength);
  GetTempPath(TmpPathLength, PAnsiChar(TmpPath));
  SetLength(TmpFile, TmpPathLength+10);
  GetTempFileName(PAnsiChar(TmpPath), PAnsiChar(TmpFilePrefix), 0, PAnsiChar(TmpFile));
  TmpPathLen:= length(TmpPath);
  TmpFileLen:= length(TmpFile);

  CreateColibryAPI(TmpPath,TmpFile,TmpPathLen,TmpFileLen);

  if FileExists(TmpFile) then
  begin
    AssignFile(tmpF,TmpFile);
    Reset(tmpF);
    Read(tmpF,APIRslt);
    CloseFile(tmpF);
  end;

  Colibry.UserKey:=APIRslt;
  delete(Colibry.UserKey,1,9);
  delete(Colibry.UserKey,pos(',pUserName=',Colibry.UserKey),length(Colibry.UserKey));
  delete(APIRslt,1,9+length(Colibry.UserKey));
  Colibry.UserName:=APIRslt;
  delete(Colibry.UserName,1,11);
  delete(Colibry.UserName,pos(',pPassword=',Colibry.UserName),length(Colibry.UserName));
  delete(APIRslt,1,11+length(Colibry.UserName));
  Colibry.Password:=APIRslt;
  delete(Colibry.Password,1,11);
  delete(Colibry.Password,pos(',pBaseURL=',Colibry.Password),length(Colibry.Password));
  delete(APIRslt,1,11+length(Colibry.Password));
  Colibry.BaseURL:=APIRslt;
  delete(Colibry.BaseURL,1,10);
  
  if (trim(Colibry.UserKey)='')or(trim(Colibry.UserName)='')or(trim(Colibry.Password)='')or(trim(Colibry.BaseURL)='') then
  begin
    if MessageDlg('Вы не можете подключиться к удаленному сервису пополнения!'+#13+'Вы хотите заполнить параметры для подключения к сервису пополнения?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      showmessage('Реализовать форму заполнения параметров подключения к сервису.'+#13+'Для UserKey открыть форму редактирования параметров и сгенерировать GUID приложения'+#13+'форма ReplConnectionEditF'+#13+'вызов из function CreateColibry: boolean;');
    end
    else
    begin
      MessageDlg('Вы не можете осуществлять услугу '+#13+'пополнения счета мобильных телефонов!'+#13+'Для активации услуги пополнения '+#13+'заполните параметры подключения к сервису пополнения.'+#13+'За дополнительными параметрами обратитесь в IT-отдел'+#13+'по телефону горячей линии.',mtError,[mbOK],0);
      ReplPhoneAccountF.Close;
      Result:=false;
      Exit;
    end;
  end;
  Result:=true;
  DeleteFile(PAnsiChar(TmpFile));
end;

function Smart2Float( s: string; xDefault: double = 0 ) : double;
var i: integer;
begin
   i:= pos( ',', s ); if i <> 0 then s[i] := '.';
   Val( s, Result, i );
   if i <> 0 then {ошибка преобразования} Result:= xDefault; // или Raise Exception...
end;

procedure TReplPhoneAccountF.FormCreate(Sender: TObject);
var
  prmF: TextFile;
begin
  ChekOnly:=False;

  //1. Проверить наличие файликов с параметрами подключения, при необходимости создать
  if not FileExists('baseurl') then
  begin
    AssignFile(prmF,ExtractFilePath(Application.ExeName)+'baseurl');
    Rewrite(prmF);
    CloseFile(prmF);
    Append(prmF);
    writeln(prmF,Prm.baseurl);
    CloseFile(prmF);
  end;

  if not FileExists('userkey') then
  begin
    AssignFile(prmF,ExtractFilePath(Application.ExeName)+'userkey');
    Rewrite(prmF);
    CloseFile(prmF);
    Append(prmF);

    Prm.userkey:='{BB3903E3-E395-42C7-87F0-06BFC8E5D3EC}';
    writeln(prmF,prm.userkey);
    CloseFile(prmF);
  end;

  if not FileExists('username') then
  begin
    AssignFile(prmF,ExtractFilePath(Application.ExeName)+'username');
    Rewrite(prmF);
    CloseFile(prmF);
    Append(prmF);

    writeln(prmF,prm.c_username);
    CloseFile(prmF);
  end;

  if not FileExists('userpass') then
  begin
    AssignFile(prmF,ExtractFilePath(Application.ExeName)+'userpass');
    Rewrite(prmF);
    CloseFile(prmF);
    Append(prmF);

    writeln(prmF,prm.c_userpass);
    CloseFile(prmF);
  end;

  //3. Проверить возможность авторизации на сервисе Colibry
  //4. При удачной авторизации заполнить справочник доступных объектов (терминалов)
  //5. Получить список доступных услуг (сервисов)
  //6. Проверить наличие справочников в БД. При необходимости создать необходимые таблицы
  //7. Проверить заполнение справочников услуг (сервисов), при необходимости дополнить или обновить
end;

procedure TReplPhoneAccountF.FormActivate(Sender: TObject);
begin
//1. Подготовить редактируемые поля:
//1.1. Очистить поля редактирования либо выставить дефолтные значения
//1.2. Заполнить справочники, установить дефолтные значения

  DisableControls;
  with ReplPhoneAccountF do
  begin
    Caption:=MFC;
    Position:=poMainFormCenter;
    BorderStyle:=bsDialog;
    Application.ProcessMessages;

    edAccount.Text:=AccountPlaceHolder;
    edAccount.Hint:='';
    lbService.Caption:='';
    lbService.Font.Color:=clWindowText;
    lbService.Color:=clWhite;
    edFee.Text:='0';
    edAmount.Text:='0';
    edPaySum.Text:='0';
    edSum.Text:='0';
    edSurrender.Text:='0';
    Application.ProcessMessages;

    lbFee.Visible:=false;
    edFee.Visible:=false;
    lbPaySum.Visible:=false;
    edPaySum.Visible:=false;
    lbSum.Visible:=false;
    edSum.Visible:=false;
    lbSurrender.Visible:=false;
    edSurrender.Visible:=false;
    btOK.Visible:=false;
    Application.ProcessMessages;
  end;
  EnableControls;
  edAccount.SetFocus;

  //1. Проверить заполнение полей UserKey, UserName, Password, BaseURL
  //2. Если одно из полей UserName, Password, BaseURL пустое - предложить заполнить значения. Для UserKey - сгенерировать новый ключ
  if not CreateColibry then
  begin
    ReplPhoneAccountF.Close;
    exit;
  end;
end;

function CheckAndTrimAccount(Account: string): string;
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

procedure FillAuthResponse(auth_res: ansistring);
var
  user_string, objects_string: widestring;
  i: integer;
  MaxArray: integer;
begin
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
    Colibry.pObject:=AuthResponse.objects[0].code;
end;

procedure auth(var err: boolean);
var
  TmpPathLength, TmpFileLength: cardinal;
  TmpPath, TmpFile: ansistring;
  TmpPathLen,TmpFileLen: LongInt;
  tmpF: TextFile;
  AuthRslt: AnsiString;
begin
  err:=false;

  TmpPathLength:= GetTempPath(0, PAnsiChar(TmpPath));
  SetLength(TmpPath, TmpPathLength);
  GetTempPath(TmpPathLength, PAnsiChar(TmpPath));
  SetLength(TmpFile, TmpPathLength+10);
  GetTempFileName(PAnsiChar(TmpPath), PAnsiChar(TmpFilePrefix), 0, PAnsiChar(TmpFile));
  TmpPathLen:= length(TmpPath);
  TmpFileLen:= length(TmpFile);

  AUTH_Request(Colibry.UserKey,Colibry.UserName,Colibry.Password,Colibry.BaseURL,TmpPath,TmpFile,TmpPathLen,TmpFileLen,err);
  if err then
  begin
    MessageDlg('Пополнение не возможно!'+#13+'Проверьте параметры подключения к сервису пополнения!'+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
    ReplPhoneAccountF.Close;
    exit;
  end;

  if FileExists(TmpFile) then
  begin
    AssignFile(tmpF,TmpFile);
    Reset(tmpF);
    Read(tmpF,AuthRslt);
    CloseFile(tmpF);
  end;
  if not err then FillAuthResponse(AuthRslt);
  DeleteFile(PAnsiChar(TmpFile));
end;

procedure FillServiceResponse(service_resp: ansistring);
var
  data_string: widestring;
  MaxArray: integer;
  i: integer;
  DataArray: array of string;
  TempStr: string;
begin
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
end;

procedure service(var err: boolean);
var
  TmpPathLength, TmpFileLength: cardinal;
  TmpPath, TmpFile: ansistring;
  TmpPathLen,TmpFileLen: LongInt;
  tmpF: TextFile;
  ServiceRslt: AnsiString;
begin
  err:=false;
  TmpPathLength:= GetTempPath(0, PAnsiChar(TmpPath));
  SetLength(TmpPath, TmpPathLength);
  GetTempPath(TmpPathLength, PAnsiChar(TmpPath));
  SetLength(TmpFile, TmpPathLength+10);
  GetTempFileName(PAnsiChar(TmpPath), PAnsiChar(TmpFilePrefix), 0, PAnsiChar(TmpFile));
  TmpPathLen:= length(TmpPath);
  TmpFileLen:= length(TmpFile);

  SERVICE_Request(Colibry.UserKey,Colibry.UserName,Colibry.Password,Colibry.pObject,Colibry.BaseURL,TmpPath,TmpFile,TmpPathLen,TmpFileLen,err);
  if err then
  begin
    MessageDlg('Пополнение не возможно!'+#13+'Проверьте параметры подключения к сервису пополнения!'+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
    ReplPhoneAccountF.Close;
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
end;

procedure FillAccountResponce(Acc_responce: ansistring);
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

procedure account(var err: boolean);
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
  GetTempFileName(PAnsiChar(TmpPath), PAnsiChar(TmpFilePrefix), 0, PAnsiChar(TmpFile));
  TmpPathLen:= length(TmpPath);
  TmpFileLen:= length(TmpFile);

  ACCOUNT_Request(Colibry.UserKey,Colibry.UserName,Colibry.Password,Colibry.pObject,Colibry.BaseURL,Colibry.pAccount,Colibry.pAccType,Colibry.pAmount,Colibry.pService, Colibry.pOrderGuid,TmpPath,TmpFile,TmpPathLen,TmpFileLen,err);
  if err then
  begin
    MessageDlg('Пополнение не возможно!'+#13+'Проверьте параметры подключения к сервису пополнения!'+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
    ReplPhoneAccountF.Close;
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

procedure FillOrderResponse(ord_responce: ansistring);
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

procedure order(var err: boolean);
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
  GetTempFileName(PAnsiChar(TmpPath), PAnsiChar(TmpFilePrefix), 0, PAnsiChar(TmpFile));
  TmpPathLen:= length(TmpPath);
  TmpFileLen:= length(TmpFile);

  ORDER_Request(Colibry.UserKey,Colibry.UserName,Colibry.Password,Colibry.pObject,Colibry.BaseURL,Colibry.pAccount,Colibry.pAccType,Colibry.pAmount,Colibry.pService,Colibry.pOrderGuid,TmpPath,TmpFile,TmpPathLen,TmpFileLen,err);
  if err then
  begin
    MessageDlg('Пополнение не возможно!'+#13+'Проверьте параметры подключения к сервису пополнения!'+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
    ReplPhoneAccountF.Close;
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

procedure FillBalanceResponse(balance_responce: ansistring);
var
  portfolio_string: widestring;
  i: integer;
  MaxArray: integer;
  PortfoliosArray: array of string;
  TempStr: string;
begin
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
end;

procedure balance(var err: boolean);
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
  GetTempFileName(PAnsiChar(TmpPath), PAnsiChar(TmpFilePrefix), 0, PAnsiChar(TmpFile));
  TmpPathLen:= length(TmpPath);
  TmpFileLen:= length(TmpFile);

  BALANCE_Request(Colibry.UserKey,Colibry.UserName,Colibry.Password,Colibry.pObject,Colibry.BaseURL,TmpPath,TmpFile,TmpPathLen,TmpFileLen,err);
  if err then
  begin
    MessageDlg('Пополнение не возможно!'+#13+'Проверьте параметры подключения к сервису пополнения!'+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
    ReplPhoneAccountF.Close;
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

procedure FillStatusResponse(stat_responce: ansistring);
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

procedure status(var err: boolean);
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
  GetTempFileName(PAnsiChar(TmpPath), PAnsiChar(TmpFilePrefix), 0, PAnsiChar(TmpFile));
  TmpPathLen:= length(TmpPath);
  TmpFileLen:= length(TmpFile);

  STATUS_Request(Colibry.UserKey,Colibry.UserName,Colibry.Password,Colibry.pObject,Colibry.BaseURL,Colibry.pOrderGuid,TmpPath,TmpFile,TmpPathLen,TmpFileLen,err);
  if err then
  begin
    MessageDlg('Пополнение не возможно!'+#13+'Проверьте параметры подключения к сервису пополнения!'+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
    ReplPhoneAccountF.Close;
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

function GetService(Account: string; out pType: string): string;
//определение параметра SERVICE
var
  serv: string;
  i: integer;
begin
  Result:='';
  i:=0;
  serv:=Account;
  Delete(serv,1,5);
  Delete(serv,4,Length(serv));

  //получение сервиса для запроса
  for i:=1 to length(PhoneCodes_To_ServiceID) do
    if PhoneCodes_To_ServiceID[i].PhoneCode = serv then
    begin
      Colibry.pService:=PhoneCodes_To_ServiceID[i].ServiceID;
      ReplPhoneAccountF.lbService.Caption:=PhoneCodes_To_ServiceID[i].ProviderName;
      ReplPhoneAccountF.lbService.Font.Color:=PhoneCodes_To_ServiceID[i].Color;
      Break;
    end;

  //получение типа аккаунта: Р - по номеру телефона; А - по номеру счета
  for i:=0 to length(ServiceResponse.Data)-1 do
  begin
    if Colibry.pService=IntToStr(ServiceResponse.Data[i].id) then
    begin
      if (trim(ServiceResponse.Data[i].acctype)='')or(LowerCase(ServiceResponse.Data[i].acctype)='p') then
        Colibry.pAccType:='P'
      else
        Colibry.pAccType:='A';
      Break
    end;
  end;
  pType:=Colibry.pAccType;
  Result:=Colibry.pService;
end;

procedure TReplPhoneAccountF.edAccountEnter(Sender: TObject);
begin
  EditEnter(Sender);
  edFee.Text:='0';
  edPaySum.Text:='0';
end;

procedure TReplPhoneAccountF.edAccountKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  EditKeyUp(Sender,Key,Shift);
  if key=13then edAmount.SetFocus;
end;

procedure TReplPhoneAccountF.edAccountKeyPress(Sender: TObject;
  var Key: Char);
begin
  EditKeyPress(Sender,Key);
end;

procedure TReplPhoneAccountF.edAccountKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  EditKeyUp(Sender,Key,Shift);
end;

procedure TReplPhoneAccountF.btCancelClick(Sender: TObject);
begin
  ReplPhoneAccountF.Close;
end;

procedure TReplPhoneAccountF.edAmountKeyPress(Sender: TObject;
  var Key: Char);
var
  P:Integer;
begin
  if Key=',' then Key:='.';
  if Key<>#8 then
  begin
    if Not (Key in ['0'..'9']+['.']) then Key:=#0;
    P:=Pos('.',TEdit(Sender).Text);
    if P<>0 then
    begin
      if (Key='.') or ((Length(TEdit(Sender).Text)>P+1) and (TEdit(Sender).SelStart>=P)) then Key:=#0;
    end;
  end;
end;

procedure TReplPhoneAccountF.edAmountKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
  if (key=13)and(edPaySum.Visible) then edPaySum.SetFocus;// else btAccount.SetFocus;
end;

procedure genorderguid;
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
  GetTempFileName(PAnsiChar(TmpPath), PAnsiChar(TmpFilePrefix), 0, PAnsiChar(TmpFile));
  TmpPathLen:= length(TmpPath);
  TmpFileLen:= length(TmpFile);

  GenerateOrderGUID(TmpPath,TmpFile,TmpPathLen,TmpFileLen);

  if FileExists(TmpFile) then
  begin
    AssignFile(tmpF,TmpFile);
    Reset(tmpF);
    Read(tmpF,Colibry.pOrderGuid);
    CloseFile(tmpF);
  end;
  DeleteFile(PAnsiChar(TmpFile));
end;

function ChkAccount(account: string): boolean;
var
  str: string;
  i: integer;
begin
  Result:=false;
  str:=account;
  delete(str,1,5);
  delete(str,4, length(str));
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

procedure TReplPhoneAccountF.edAmountExit(Sender: TObject);
{
var
  i: integer;
  amount: double;
  F_Error: boolean;
  BalanceCurrency, BalanceValue: string;
}
begin
{
  if btCancel.Focused then
  begin
    ReplPhoneAccountF.Close;
    exit;
  end;
  if
    (trim(edAmount.Text)='0')
    or(trim(edAmount.Text)='')
    or(edAccount.Focused)
    or(edFee.Focused)
//    or(edPaySum.Focused)
    or(edSum.Focused)
    or(edSurrender.Focused)
    or(btOK.Focused)
    or(btCancel.Focused)
    or(not ChkAccount(edAccount.Text))
  then
    exit;

  try
    StrToFloat(edAmount.Text);
  except
    edAmount.SetFocus;
    edAmount.Text:='0';
    exit;
  end;

  DisableControls;

  //III Пополнение счета
  //1. Проверить возможность авторизации и получить список доступных объектов (auth)
  auth(F_Error);
  if F_Error then
  begin
    EnableControls;
    edAccount.SetFocus;
    MessageDlg('Не настроены параметры подключения!'+#13+'Настройте параметры подключения'+#13+'и повторите попытку пополнения!'+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
    exit;
  end;

  //2. Получить список услуг (service)
  service(F_Error);
  if F_Error then
  begin
    EnableControls;
    edAccount.SetFocus;
    MessageDlg('Не настроены параметры подключения!'+#13+'Настройте параметры подключения'+#13+'и повторите попытку пополнения!'+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
    exit;
  end;

  //3. Проверить правильность ввода номера абонента
  Colibry.pAccount:=CheckAndTrimAccount(edAccount.Text);
  if Length(Trim(Colibry.pAccount)) <> 10 then
  begin
    EnableControls;
    edAccount.Text:=AccountPlaceHolder;
    edAccount.Hint:='';
    lbService.Caption:='';
    lbService.Font.Color:=clWindowText;
    MessageDlg('Номер телефона для пополнения введен не верно!'+#13+'Проверьте правильность ввода номера телефона!',mtError,[mbOK],0);
    edAccount.SetFocus;
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
    EnableControls;
    edAmount.Text:='0';
    edFee.Text:='0';
    edAccount.SetFocus;
    edAmount.SetFocus;
    edAmount.SelectAll;
    exit;
  end;
  if edAmount.Text='0' then
  begin
    EnableControls;
    edAmount.Text:='0';
    edFee.Text:='0';
    edAccount.SetFocus;
    edAmount.SetFocus;
    edAmount.SelectAll;
    exit;
  end;
  Colibry.pAmount:=CurrToStr(StrToCurr(edAmount.Text)*100);

  //6. Проверить баланс портфеля
  balance(F_Error);
  if F_Error then
  begin
    EnableControls;
    edAccount.SetFocus;
    MessageDlg('Не настроены параметры подключения!'+#13+'Настройте параметры подключения'+#13+'и повторите попытку пополнения!'+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
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
        MessageDlg('Досутпный баланс для пополнения '+FloatToStr(BalanceResponse.portfolios[i].limit/100)+' '+BalanceResponse.portfolios[i].currency.short
              +#13+'Сумма, на которую Вы хотите пополнить счет'
              +#13+'больше доступного баланса!'
              +#13+'Уменьшите сумму пополнения и повторите попытку!'
              +#13+'При повторной ошибке обратитесь в IT-отдел за консультацией!',mtError,[mbOK],0);
        EnableControls;
        edAmount.Text:=FloatToStr(BalanceResponse.portfolios[i].limit/100);
        edAccount.SetFocus;
        edAmount.SetFocus;
        edAmount.SelectAll;
        exit;
      end;
    end
  end;

  //7.3. Отправить запрос проверки возможности пополнения
  account(F_Error);
  if F_Error then
  begin
    EnableControls;
    edAccount.SetFocus;
    MessageDlg('Не настроены параметры подключения!'+#13+'Настройте параметры подключения'+#13+'и повторите попытку пополнения!'+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
    exit;
  end;

  //7.4. При положительном ответе от сервиса - уведомить, что пополнение возможно и указать сумму к оплате
  //7.5. При отрицательном ответе от сервиса - уведомление о не возможности пополнить на весь экран!
  if LowerCase(AccountResponse.status) = 'o' then
  begin
    edPaySum.Text:=FloatToStr((StrToFloat(AccountResponse.dpamount)+AccountResponse.fee)/100);
    EnableControls;
    edSum.Text:=edPaySum.Text;
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
        MessageDlg('Пополнение возможно!'+#13+'Номер для пополнения: '+edAccount.Text+#13+'Сумма пополнения: '+edAmount.Text+' '+BalanceCurrency+#13+'Введите сумму полученную от покупателя и выполните пополнение!',mtInformation,[mbOK],0);
      end
      else
        MessageDlg('Пополнение возможно!'+#13+'Номер для пополнения: '+edAccount.Text+#13+'Сумма пополнения: '+edAmount.Text+#13+'Введите сумму полученную от покупателя и выполните пополнение!',mtInformation,[mbOK],0);
    edSum.Text:=edPaySum.Text;
    edSum.SetFocus;
    Application.ProcessMessages;
  end
  else
  begin
    EnableControls;
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
        MessageDlg('Пополнение не возможно!'+#13+'Номер для пополнения: '+edAccount.Text+#13+'Сумма пополнения: '+edAmount.Text+' '+BalanceCurrency+#13+'Доступный баланс: '+BalanceValue+' '+BalanceCurrency+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
      end
      else
        MessageDlg('Пополнение не возможно!'+#13+'Номер для пополнения: '+edAccount.Text+#13+'Сумма пополнения: '+edAmount.Text+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
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
        MessageDlg('Пополнение возможно!'+#13+'Номер для пополнения: '+edAccount.Text+#13+'Сумма пополнения: '+edAmount.Text+' '+BalanceCurrency+#13+'Введите сумму полученную от покупателя и выполните пополнение!',mtInformation,[mbOK],0);
      end
      else
        MessageDlg('Пополнение возможно!'+#13+'Номер для пополнения: '+edAccount.Text+#13+'Сумма пополнения: '+edAmount.Text+#13+'Введите сумму полученную от покупателя и выполните пополнение!',mtInformation,[mbOK],0);
    end;
  end;
}
end;

procedure TReplPhoneAccountF.edAmountEnter(Sender: TObject);
begin
  edPaySum.Text:='0';
  edFee.Text:='0';
end;

procedure TReplPhoneAccountF.edAmountChange(Sender: TObject);
begin
  with ReplPhoneAccountF do
  begin
    edPaySum.Text:='0';
    edFee.Text:='0';
    edSum.Text:='0';

    lbFee.Visible:=false;
    edFee.Visible:=false;
    lbPaySum.Visible:=false;
    edPaySum.Visible:=false;
    lbSum.Visible:=false;
    edSum.Visible:=false;
    lbSurrender.Visible:=false;
    edSurrender.Visible:=false;
    btOK.Visible:=false;
    Application.ProcessMessages;
  end;
end;

procedure TReplPhoneAccountF.edSumChange(Sender: TObject);
begin
  edSurrender.Text:=FloatToStr(StrToFloat(edSum.Text)-StrToFloat(edPaySum.Text));
end;

procedure TReplPhoneAccountF.edSumKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then btOK.SetFocus;
end;

procedure TReplPhoneAccountF.edSumKeyPress(Sender: TObject; var Key: Char);
var
  P:Integer;
begin
  if Key=',' then Key:='.';
  if Key<>#8 then
  begin
    if Not (Key in ['0'..'9']+['.']) then Key:=#0;
    P:=Pos('.',TEdit(Sender).Text);
    if P<>0 then
    begin
      if (Key='.') or ((Length(TEdit(Sender).Text)>P+1) and (TEdit(Sender).SelStart>=P)) then Key:=#0;
    end;
  end;
end;

procedure SaveErrorToFile(f_name: string);
begin
//MessageDlg('Информация о платеже не была сохранена в БД!'+#13+'Запрос на запись в БД: '+ReplPhoneAccountF.qSaveReplenishment.SQL.Text+#13+'Подробности ошибки сохранены в файле '+ExtractFilePath(Application.ExeName)+ErrorFileName+#13+'За деталями обратитесь в IT-отдел!',mtError, [mbOK],0);
{
    AssignFile(prmF,ExtractFilePath(Application.ExeName)+'baseurl');
    Rewrite(prmF);
    CloseFile(prmF);
    Append(prmF);
    writeln(prmF,Prm.baseurl);
    CloseFile(prmF);
}
end;

procedure SaveTransferToDB;
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
  with ReplPhoneAccountF.qSaveReplenishment do
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
//      SQL.Add('declare @id_kassa int set @id_kassa=:id_kassa');
//      SQL.Add('declare @kassa_num int set @kassa_num=:kassa_num');
//      SQL.Add('declare @id_gamma int set @id_gamma=:id_gamma');
//      SQL.Add('declare @vzh numeric(10,0) set @vzh=:vzh');
//      SQL.Add('declare @f_nds smallin set @f_nds=:f_nds');
//      SQL.Add('declare @status_abr varchar(10) set @status_abr=:status_abr');
//      SQL.Add('declare @status_description varchar(150) set @status_description=:status_description');
//      SQL.Add('declare @status_code int set @status_code=:status_code');
//      SQL.Add('declare @order_id int set @order_id=:order_id');
//      SQL.Add('declare @create_date varchar(23) set @create_date=:create_date');
//      SQL.Add('declare @trans_date varchar(23) set @trans_date=:trans_date');
//      SQL.Add('declare @pay_id int set @pay_id=:pay_id');
//      SQL.Add('declare @amount numeric(12,2) set @amount=:amount');
//      SQL.Add('declare @fee numeric(12,2) set @fee=:fee');
//      SQL.Add('declare @service_id varchar(10) set @service_id=:service_id');
//      SQL.Add('declare @servicename1 varchar(50) set @servicename1=:servicename1');
//      SQL.Add('declare @account1 varchar(25) set @account1=:account1');
//      SQL.Add('declare @acctype1 varchar(5) set @acctype1=:acctype1');
//      SQL.Add('declare @currency_id1 varchar(5) set @currency_id1=:currency_id1');
//      SQL.Add('declare @currency_name1 varchar(15) set @currency_name1=:currency_name1');

      sql.Text:=SQL.Text+'insert into arh_replenishments ( ';
      sql.Text:=SQL.Text+'  unique_num_check,'; //binary(16) not null, -- уникальный номер (GUID) чека
      sql.Text:=SQL.Text+'  dt,'; //datetime not null,                 -- дата/время чека
      sql.Text:=SQL.Text+'  id_kassa,'; //smallint null,               -- номер кассы на ТТ
      sql.Text:=SQL.Text+'  kassa_num,'; //smallint null,              -- вид оплаты. для наличных = 1
      sql.Text:=SQL.Text+'  id_gamma,'; //int null,                     -- код пользователя (глобальный, Prm.ID_Gamma
      sql.Text:=SQL.Text+'  vzh,'; //numeric(10,0) null,               -- заводской номер кассового аппарата
      sql.Text:=SQL.Text+'  f_nds,'; //smallint null,                  -- ставка НДС 1 - 20%, 2 - 7%. по умолчанию = 1
      sql.Text:=SQL.Text+'  status_abr,'; //varchar(10) null,          -- статус платежа: " " или "E" или "R" - ошибка; "W" - в процессе; "C" - удачный платеж
      sql.Text:=SQL.Text+'  status_description,'; //varchar(150) null, -- описание статуса
      sql.Text:=SQL.Text+'  status_code,'; //int null,                 -- код статуса
      sql.Text:=SQL.Text+'  order_id,'; //int null,                    -- ID платежа (удаленный сервис)
      sql.Text:=SQL.Text+'  create_date,'; //varchar(23) null,         -- дата создания платежа
      sql.Text:=SQL.Text+'  trans_date,'; //varchar(23) null,          -- дата проведения платежа
      sql.Text:=SQL.Text+'  pay_id,'; //int null,                      -- ID платежа поставщика
      sql.Text:=SQL.Text+'  amount,'; //numeric(12,2) null,            -- сумма платежа в копейках
      sql.Text:=SQL.Text+'  fee,'; //numeric(12,2) null,               -- комиссия в копейках
      sql.Text:=SQL.Text+'  service_id,'; //varchar(10) null,          -- ID услуги
      sql.Text:=SQL.Text+'  servicename,'; //varchar(50) null,         -- название услуги
      sql.Text:=SQL.Text+'  account,'; //varchar(25) null,             -- аккаунт (номер пополнения)
      sql.Text:=SQL.Text+'  acctype,'; //varchar(5) null,              -- тип аккаунта (P - номер; A - счет)
      sql.Text:=SQL.Text+'  currency_id,'; //varchar(5) null,          -- идентификатор валюты (=980 - гривна)
      sql.Text:=SQL.Text+'  currency_name'; //varchar(15) null        -- название валюты (гривна)
      sql.Text:=SQL.Text+') values (';

      sql.Text:=SQL.Text+'  convert(binary(16),newid()),'; // unique_num_check binary(16) not null, -- уникальный номер (GUID) чека
      sql.Text:=SQL.Text+'  getdate(), '; //dt datetime not null,                 -- дата/время чека
      sql.Text:=SQL.Text+IntToStr(Opt.KassaID)+', '; //id_kassa smallint null,               -- номер кассы на ТТ
      sql.Text:=SQL.Text+'  1, '; //kassa_num smallint null,              -- вид оплаты. для наличных = 1
      sql.Text:=SQL.Text+IntToStr(Prm.ID_Gamma)+', '; //id_gamma int null,                     -- код пользователя (глобальный, Prm.ID_Gamma
      sql.Text:=SQL.Text+IntToStr(MainF.VzhNum)+', '; //vzh numeric(10,0) null,               -- заводской номер кассового аппарата
      sql.Text:=SQL.Text+'  1, '; //f_nds smallint null,                  -- ставка НДС 1 - 20%, 2 - 7%. по умолчанию = 1
      sql.Text:=SQL.Text+''''+status_abr+''', '; //status_abr varchar(10) null,          -- статус платежа: " " или "E" или "R" - ошибка; "W" - в процессе; "C" - удачный платеж
      sql.Text:=SQL.Text+''''+status_description+''', '; //status_description varchar(150) null, -- описание статуса
      sql.Text:=SQL.Text+IntToStr(status_code)+', '; //status_code int null,                 -- код статуса
      sql.Text:=SQL.Text+IntToStr(order_id)+', '; //order_id int null,                    -- ID платежа (удаленный сервис)
      sql.Text:=SQL.Text+''''+create_date+''', '; //create_date varchar(23) null,         -- дата создания платежа
      sql.Text:=SQL.Text+''''+trans_date+''','; //trans_date varchar(23) null,          -- дата проведения платежа
      sql.Text:=SQL.Text+IntToStr(pay_id)+', '; //pay_id int null,                      -- ID платежа поставщика
      sql.Text:=SQL.Text+'convert(numeric(12,2),'+FloatToStr(amount/100)+'), '; //amount numeric(12,2) null,            -- сумма платежа в копейках
      sql.Text:=SQL.Text+'convert(numeric(12,2),'+FloatToStr(fee/100)+'), '; //fee numeric(12,2) null,               -- комиссия в копейках
      sql.Text:=SQL.Text+''''+Colibry.pService+''', '; //service_id varchar(10) null,          -- ID услуги
      sql.Text:=SQL.Text+''''+servicename+''', '; //servicename varchar(50) null,         -- название услуги
      sql.Text:=SQL.Text+''''+account+''', '; //account varchar(25) null,             -- аккаунт (номер пополнения)
      sql.Text:=SQL.Text+''''+acctype+''', '; //acctype varchar(5) null,              -- тип аккаунта (P - номер; A - счет)
      sql.Text:=SQL.Text+''''+IntToStr(currency_id)+''', '; //currency_id varchar(5) null,          -- идентификатор валюты (=980 - гривна)
      sql.Text:=SQL.Text+''''+currency_name+''''; //currency_name varchar(15) null        -- название валюты (гривна)
      sql.Text:=SQL.Text+')';

//      ShowMessage(SQL.Text);
      ExecSQL;
      //SQL.SaveToFile('insert.sql');
    except
      on Exception do
      begin
        ErrorFileName:='pc_col_'+FormatDateTime('YYYY-MM-DD_HH-MM-SS',Date())+'.pce';
        MessageDlg('Информация о платеже не была сохранена в БД!'+#13+'Запрос на запись в БД: '+ReplPhoneAccountF.qSaveReplenishment.SQL.Text+#13+'Подробности ошибки сохранены в файле '+ExtractFilePath(Application.ExeName)+ErrorFileName+#13+'За деталями обратитесь в IT-отдел!',mtError, [mbOK],0);
        EnableControls;
        SaveErrorToFile(ErrorFileName);
      end;
    end;
  end;
end;

function PrintChek:Boolean;
var
  Mess, Nm: string;
  F_NDS: integer;
  Sum: real;
  CP: TChekPos;
//  i: Integer;
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

  if Not CheckReal(ReplPhoneAccountF.edPaySum.Text) then
  begin
    MainF.MessBox('Проверьте правильность ввода номера абонента и суммы пополнения!');
    ReplPhoneAccountF.edAmount.SetFocus;
    Exit;
  end
  else
    Sum:=StrToCurr(CurrToStrF(StrToCurr(ReplPhoneAccountF.edPaySum.Text),ffFixed,2));
  F_NDS:=1;
  Nm:='Поповнення рахунку';

  try
    if Not EKKA.fpGetStatus then AbortM(EKKA.LastErrorDescr);

    EKKA.fpCancelFiscalReceipt;

    if EKKA.ReceiptNumber<0 then AbortM('Ошибка определения номера чека');
    CP.NumbChek:=EKKA.ReceiptNumber+1;

    if Not EKKA.fpOpenFiscalReceipt then AbortM('Ошибка открытия чека: '+EKKA.LastErrorDescr);
    if Not EKKA.fpAddFinStr(StatusResponse.service.name) then AbortM('Ошибка добавления строк: '+EKKA.LastErrorDescr);
    if Not EKKA.fpAddSale(Nm, 1, Sum, 1, 0, F_NDS, 0, '') then AbortM('Ошибка пробития позиции чека: '+EKKA.LastErrorDescr);
    if Not EKKA.fpCloseFiscalReceipt(StrToCurr(ReplPhoneAccountF.edPaySum.Text),4,StrToCurr(ReplPhoneAccountF.edPaySum.Text)) then AbortM('Ошибка закрытия чека: '+EKKA.LastErrorDescr);
    Result:=True;

    CP.ID_User:=Prm.ID_Gamma;
    CP.ID_Kassa:=Opt.KassaID;
    CP.PSkd:=0;
    CP.NumCard:=-1;
    CP.TypeOplat:=TO_CASH;
    CP.ArtName:=Copy(Nm,1,16);
    CP.Kod_Name:=0;
    CP.Kol:=0;
    CP.Cena:=Sum;
    CP.Type_Tov:=1;
    CP.Date:=DM.GetServerDate;
    CP.Vzh:=MainF.VzhNum;
    CP.VzhSafe:=CP.Vzh;

    TryWriteToJournal;
  except
    on E:Exception do
    begin
      EKKA.fpCancelFiscalReceipt;
      if E.Message<>'' then MainF.MessBox(E.Message) else MainF.MessBox('Ошибка пробивки суммы!');
    end;
  end;
end;

procedure TReplPhoneAccountF.btOKClick(Sender: TObject);
var
  F_Error: boolean;
begin
  //7. При положительном результате проверки пополнения счета (аккаунта)
  //7.1. проверить, что полученая сумма больше или равна сумме к оплате
  DisableControls;

  //проверить правильность ввода номера телефона для пополнения
  if not ChkAccount(edAccount.Text) then
  begin
    EnableControls;
    edAccount.SetFocus;
    edAccount.Text:=AccountPlaceHolder;
    edAccount.Hint:='';
    lbFee.Visible:=false;
    edFee.Visible:=false;
    lbPaySum.Visible:=false;
    edPaySum.Visible:=false;
    lbSum.Visible:=false;
    edSum.Visible:=false;
    lbSurrender.Visible:=false;
    edSurrender.Visible:=false;
    btOK.Visible:=false;
    Application.ProcessMessages;
    exit;
  end;

  if ChekOnly then
  begin
    if PrintChek then Close;
    EnableControls;
    Exit;
  end;

  F_Error:=false;

  if StrToFloat(edSum.Text) < StrToFloat(edPaySum.Text) then
  begin
    MessageDlg('Сумма, полученая от покупателя'
           +#13'меньше суммы пополнения с учетом комиссий!'
           +#13+'Проверьте, что сумма полученая от покупателя'
           +#13+'больше или равна сумме к оплате'
           +#13+'и повторите попытку!'
           +#13+'За дополнительной, при необходимости, информацией обратитесь в IT-отдел',mtError,[mbOK],0);
    EnableControls;
    edSum.SetFocus;
    edSum.SelectAll;
    Exit;
  end;

  //7.10. Распечатать чек
  if PrintChek=False then
  begin
    ChekOnly:=True;
    EnableControls;
    Exit;
  end;

  //7.2. пополнить счет без дополнительных вопросов пользователю
  order(F_Error);
  if F_Error then
  begin
    EnableControls;
    edAccount.SetFocus;
    MessageDlg('Не настроены параметры подключения!'+#13+'Настройте параметры подключения'+#13+'и повторите попытку пополнения!'+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
    //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
    lbFee.Visible:=false;
    edFee.Visible:=false;
    lbPaySum.Visible:=false;
    edPaySum.Visible:=false;
    lbSum.Visible:=false;
    edSum.Visible:=false;
    lbSurrender.Visible:=false;
    edSurrender.Visible:=false;
    btOK.Visible:=false;
    Application.ProcessMessages;
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
      EnableControls;
      edAmount.SetFocus;
      exit;
    end
    else
    begin
      //добавить проверку пополнения счета и при отрицательном ответе показать ошибку
      status(F_Error);
      if F_Error then
      begin
        MessageDlg('Транзакция отменена!'+#13+'Счет пополнен не был!',mtWarning,[mbOK],0);
        //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
        lbFee.Visible:=false;
        edFee.Visible:=false;
        lbPaySum.Visible:=false;
        edPaySum.Visible:=false;
        lbSum.Visible:=false;
        edSum.Visible:=false;
        lbSurrender.Visible:=false;
        edSurrender.Visible:=false;
        btOK.Visible:=false;
        Application.ProcessMessages;
      end;
    end;
  end;

  //7.4. если ответ от сервера - платеж в процессе проведения (status = "W") - проверить статус пополнения
  if LowerCase(OrderResponse.status)='w' then
  begin
    status(F_Error);
    if F_Error then
    begin
      MessageDlg('Транзакция отменена!'+#13+'Счет пополнен не был!',mtWarning,[mbOK],0);
      //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
      lbFee.Visible:=false;
      edFee.Visible:=false;
      lbPaySum.Visible:=false;
      edPaySum.Visible:=false;
      lbSum.Visible:=false;
      edSum.Visible:=false;
      lbSurrender.Visible:=false;
      edSurrender.Visible:=false;
      btOK.Visible:=false;
      Application.ProcessMessages;
    end;
  end;

  //7.5. При положительном ответе (удачном пополнении, status = "C") - уведомить, что пополнение прошло успешно
  if (LowerCase(OrderResponse.status)='c')or(LowerCase(StatusResponse.status)='c') then
  begin
    //7.9. Записать данные о трансфере в БД
    SaveTransferToDB;
//    //7.10. Распечатать чек
//    if PrintChek=False then
//     begin
//      ChekOnly:=True;
//      EnableControls;
//      Exit;
//     end;
    if MessageDlg('Счет успешно пополнен!'
             +#13+'Вы хотите пополнить еще один номер телефона?'
             +#13+'(нажатие на кнопку "[NO]" или "[НЕТ]" закроет окно для пополнения).',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      EnableControls;
      with ReplPhoneAccountF do
      begin
        ChekOnly:=False;
        edAccount.Text:=AccountPlaceHolder;
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
        lbFee.Visible:=false;
        edFee.Visible:=false;
        lbPaySum.Visible:=false;
        edPaySum.Visible:=false;
        lbSum.Visible:=false;
        edSum.Visible:=false;
        lbSurrender.Visible:=false;
        edSurrender.Visible:=false;
        btOK.Visible:=false;
        Application.ProcessMessages;
      end;
      edAccount.SetFocus;
    end
    else
      ReplPhoneAccountF.Close;
  end;

//7.6. При отсутствии ответа от сервера или по таймауту - запросить статус пополнения (F_Error)
//     при отрицательном ответе на проверку статуса (счет не был пополнен) - предложить повторить операцию
  if F_Error then
  begin
    status(F_Error);

    if LowerCase(StatusResponse.status)='e' then
    begin
      MessageDlg('Счет не был пополнен!'+#13+'Ошибка: '+IntToStr(StatusResponse.code)+' '+StatusResponse.description,mtError,[mbOK],0);
    end
    else
    begin
      if LowerCase(StatusResponse.status)='r' then
        MessageDlg('Транзакция аннулирована!'+#13+'Ответ: '+IntToStr(StatusResponse.code)+' '+StatusResponse.description,mtError,[mbOK],0)
      else
      begin
        if trim(StatusResponse.status)='' then
          MessageDlg('Платеж отменен или не найден!'+#13+'Ответ: '+IntToStr(StatusResponse.code)+' '+StatusResponse.description,mtError,[mbOK],0)
        else
        begin
          if LowerCase(StatusResponse.status)='w' then
            MessageDlg('Платеж в процессе проведения!'+#13+'Ответ: '+IntToStr(StatusResponse.code)+' '+StatusResponse.description,mtInformation,[mbOK],0)
          else
          begin
            if LowerCase(StatusResponse.status)='c' then
              MessageDlg('Платеж успешно проведен!'+#13+'Ответ: '+IntToStr(StatusResponse.code)+' '+StatusResponse.description,mtInformation,[mbOK],0);
          end;
        end;
      end;
    end;
  end;

//  //7.9. Записать данные о трансфере в БД
//  SaveTransferToDB;
//
//  //7.10. Распечатать чек
//  PrintChek;

  EnableControls;
end;

procedure TReplPhoneAccountF.edAccountExit(Sender: TObject);
begin
  //проверить правильность ввода номера телефона для пополнения
  if not ChkAccount(edAccount.Text) then
  begin
    EnableControls;
    edAccount.SetFocus;
    edAccount.Text:=AccountPlaceHolder;
    edAccount.Hint:='';
    exit;
  end;

  //5. Попытаться определить тип пополнения. При не возможности определить тип пополнения - предложить указать вручную
  Colibry.pService:=GetService(edAccount.Text,Colibry.pAccType);
end;

procedure TReplPhoneAccountF.edAccountChange(Sender: TObject);
begin
  with ReplPhoneAccountF do
  begin
//    edAccount.Text:=AccountPlaceHolder;
//    edAccount.Hint:='';
    lbService.Caption:='';
    lbService.Font.Color:=clWindowText;
    lbService.Color:=clWhite;
    edFee.Text:='0';
    edAmount.Text:='0';
    edPaySum.Text:='0';
    Application.ProcessMessages;

    lbFee.Visible:=false;
    edFee.Visible:=false;
    lbPaySum.Visible:=false;
    edPaySum.Visible:=false;
    lbSum.Visible:=false;
    edSum.Visible:=false;
    lbSurrender.Visible:=false;
    edSurrender.Visible:=false;
    btOK.Visible:=false;
    Application.ProcessMessages;
  end;
end;

procedure TReplPhoneAccountF.btAccountClick(Sender: TObject);
var
  F_Error: boolean;
  amount: double;
  i: integer;
  BalanceCurrency, BalanceValue: string;
begin
//  if btCancel.Focused then
//  begin
//    ReplPhoneAccountF.Close;
//    exit;
//  end;
//  if
//    (trim(edAmount.Text)='0')
//    or(trim(edAmount.Text)='')
//    or(edAccount.Focused)
//    or(edFee.Focused)
////    or(edPaySum.Focused)
//    or(edSum.Focused)
//    or(edSurrender.Focused)
//    or(btOK.Focused)
//    or(btCancel.Focused)
//    or(not ChkAccount(edAccount.Text))
//  then
//    exit;

  try
    StrToFloat(edAmount.Text);
  except
    edAmount.SetFocus;
    edAmount.Text:='0';
    exit;
  end;

  DisableControls;

  //III Пополнение счета
  //1. Проверить возможность авторизации и получить список доступных объектов (auth)
  auth(F_Error);
  if F_Error then
  begin
    EnableControls;
    edAccount.SetFocus;
    MessageDlg('Не настроены параметры подключения!'+#13+'Настройте параметры подключения'+#13+'и повторите попытку пополнения!'+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
    //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
    lbFee.Visible:=false;
    edFee.Visible:=false;
    lbPaySum.Visible:=false;
    edPaySum.Visible:=false;
    lbSum.Visible:=false;
    edSum.Visible:=false;
    lbSurrender.Visible:=false;
    edSurrender.Visible:=false;
    btOK.Visible:=false;
    Application.ProcessMessages;
    exit;
  end;

  //2. Получить список услуг (service)
  service(F_Error);
  if F_Error then
  begin
    EnableControls;
    edAccount.SetFocus;
    MessageDlg('Не настроены параметры подключения!'+#13+'Настройте параметры подключения'+#13+'и повторите попытку пополнения!'+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
    //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
    lbFee.Visible:=false;
    edFee.Visible:=false;
    lbPaySum.Visible:=false;
    edPaySum.Visible:=false;
    lbSum.Visible:=false;
    edSum.Visible:=false;
    lbSurrender.Visible:=false;
    edSurrender.Visible:=false;
    btOK.Visible:=false;
    Application.ProcessMessages;
    exit;
  end;

  //3. Проверить правильность ввода номера абонента
  Colibry.pAccount:=CheckAndTrimAccount(edAccount.Text);
  if Length(Trim(Colibry.pAccount)) <> 10 then
  begin
    EnableControls;
    edAccount.Text:=AccountPlaceHolder;
    edAccount.Hint:='';
    lbService.Caption:='';
    lbService.Font.Color:=clWindowText;
    MessageDlg('Номер телефона для пополнения введен не верно!'+#13+'Проверьте правильность ввода номера телефона!',mtError,[mbOK],0);
    edAccount.SetFocus;
    //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
    lbFee.Visible:=false;
    edFee.Visible:=false;
    lbPaySum.Visible:=false;
    edPaySum.Visible:=false;
    lbSum.Visible:=false;
    edSum.Visible:=false;
    lbSurrender.Visible:=false;
    edSurrender.Visible:=false;
    btOK.Visible:=false;
    Application.ProcessMessages;
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
    EnableControls;
    edAmount.Text:='0';
    edFee.Text:='0';
    edAccount.SetFocus;
    edAmount.SetFocus;
    edAmount.SelectAll;
    //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
    lbFee.Visible:=false;
    edFee.Visible:=false;
    lbPaySum.Visible:=false;
    edPaySum.Visible:=false;
    lbSum.Visible:=false;
    edSum.Visible:=false;
    lbSurrender.Visible:=false;
    edSurrender.Visible:=false;
    btOK.Visible:=false;
    Application.ProcessMessages;
    exit;
  end;

  if edAmount.Text='0' then
  begin
    EnableControls;
    edAmount.Text:='0';
    edFee.Text:='0';
    edAccount.SetFocus;
    edAmount.SetFocus;
    edAmount.SelectAll;
    //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
    lbFee.Visible:=false;
    edFee.Visible:=false;
    lbPaySum.Visible:=false;
    edPaySum.Visible:=false;
    lbSum.Visible:=false;
    edSum.Visible:=false;
    lbSurrender.Visible:=false;
    edSurrender.Visible:=false;
    btOK.Visible:=false;
    Application.ProcessMessages;
    exit;
  end;
  Colibry.pAmount:=CurrToStr(StrToCurr(edAmount.Text)*100);

  //6. Проверить баланс портфеля
  balance(F_Error);
  if F_Error then
  begin
    EnableControls;
    edAccount.SetFocus;
    MessageDlg('Не настроены параметры подключения!'+#13+'Настройте параметры подключения'+#13+'и повторите попытку пополнения!'+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
    //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
    lbFee.Visible:=false;
    edFee.Visible:=false;
    lbPaySum.Visible:=false;
    edPaySum.Visible:=false;
    lbSum.Visible:=false;
    edSum.Visible:=false;
    lbSurrender.Visible:=false;
    edSurrender.Visible:=false;
    btOK.Visible:=false;
    Application.ProcessMessages;
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
        MessageDlg('Досутпный баланс для пополнения '+FloatToStr(BalanceResponse.portfolios[i].limit/100)+' '+BalanceResponse.portfolios[i].currency.short
              +#13+'Сумма, на которую Вы хотите пополнить счет'
              +#13+'больше доступного баланса!'
              +#13+'Уменьшите сумму пополнения и повторите попытку!'
              +#13+'При повторной ошибке обратитесь в IT-отдел за консультацией!',mtError,[mbOK],0);
        EnableControls;
        edAmount.Text:=FloatToStr(BalanceResponse.portfolios[i].limit/100);
        edAccount.SetFocus;
        edAmount.SetFocus;
        edAmount.SelectAll;
        //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
        lbFee.Visible:=false;
        edFee.Visible:=false;
        lbPaySum.Visible:=false;
        edPaySum.Visible:=false;
        lbSum.Visible:=false;
        edSum.Visible:=false;
        lbSurrender.Visible:=false;
        edSurrender.Visible:=false;
        btOK.Visible:=false;
        Application.ProcessMessages;
        exit;
      end;
    end
  end;

  //7.3. Отправить запрос проверки возможности пополнения
  account(F_Error);
  if F_Error then
  begin
    EnableControls;
    edAccount.SetFocus;
    MessageDlg('Не настроены параметры подключения!'+#13+'Настройте параметры подключения'+#13+'и повторите попытку пополнения!'+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
    //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
    lbFee.Visible:=false;
    edFee.Visible:=false;
    lbPaySum.Visible:=false;
    edPaySum.Visible:=false;
    lbSum.Visible:=false;
    edSum.Visible:=false;
    lbSurrender.Visible:=false;
    edSurrender.Visible:=false;
    btOK.Visible:=false;
    Application.ProcessMessages;
    exit;
  end;

  //7.4. При положительном ответе от сервиса - уведомить, что пополнение возможно и указать сумму к оплате
  //7.5. При отрицательном ответе от сервиса - уведомление о не возможности пополнить на весь экран!
  if LowerCase(AccountResponse.status) = 'o' then
  begin
    edPaySum.Text:=FloatToStr((StrToFloat(AccountResponse.dpamount)+AccountResponse.fee)/100);
    EnableControls;
    edSum.Text:=edPaySum.Text;

    //показать комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
    lbFee.Visible:=true;
    edFee.Visible:=true;
    lbPaySum.Visible:=true;
    edPaySum.Visible:=true;
    lbSum.Visible:=true;
    edSum.Visible:=true;
    lbSurrender.Visible:=true;
    edSurrender.Visible:=true;
    btOK.Visible:=true;
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
      MessageDlg('Пополнение возможно!'+#13+'Номер для пополнения: '+edAccount.Text+#13+'Сумма пополнения: '+edAmount.Text+' '+BalanceCurrency+#13+'Введите сумму полученную от покупателя и выполните пополнение!',mtInformation,[mbOK],0);
    end
    else
      MessageDlg('Пополнение возможно!'+#13+'Номер для пополнения: '+edAccount.Text+#13+'Сумма пополнения: '+edAmount.Text+#13+'Введите сумму полученную от покупателя и выполните пополнение!',mtInformation,[mbOK],0);
    edSum.Text:=edPaySum.Text;
    edSum.SetFocus;
    Application.ProcessMessages;
  end
  else
  begin
    EnableControls;
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
        MessageDlg('Пополнение не возможно!'+#13+'Номер для пополнения: '+edAccount.Text+#13+'Сумма пополнения: '+edAmount.Text+' '+BalanceCurrency+#13+'Доступный баланс: '+BalanceValue+' '+BalanceCurrency+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
      end
      else
        MessageDlg('Пополнение не возможно!'+#13+'Номер для пополнения: '+edAccount.Text+#13+'Сумма пополнения: '+edAmount.Text+#13+'За дополнительной информацией обратитесь в IT-отдел!',mtError,[mbOK],0);
      //скрыть комиссию / сумму к оплате / получено от покупателя / сдачу / возможность пополнения
      lbFee.Visible:=false;
      edFee.Visible:=false;
      lbPaySum.Visible:=false;
      edPaySum.Visible:=false;
      lbSum.Visible:=false;
      edSum.Visible:=false;
      lbSurrender.Visible:=false;
      edSurrender.Visible:=false;
      btOK.Visible:=false;
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
        MessageDlg('Пополнение возможно!'+#13+'Номер для пополнения: '+edAccount.Text+#13+'Сумма пополнения: '+edAmount.Text+' '+BalanceCurrency+#13+'Введите сумму полученную от покупателя и выполните пополнение!',mtInformation,[mbOK],0);
      end
      else
        MessageDlg('Пополнение возможно!'+#13+'Номер для пополнения: '+edAccount.Text+#13+'Сумма пополнения: '+edAmount.Text+#13+'Введите сумму полученную от покупателя и выполните пополнение!',mtInformation,[mbOK],0);
    end;
  end;
end;

end.
