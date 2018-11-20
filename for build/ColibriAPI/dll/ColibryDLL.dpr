library ColibryDLL;

uses
  System.SysUtils,
  System.Classes,
  IdHashMessageDigest,
  HMAC,
  HMACSHA2,
  Hash,
  Mem_Util,
  Vcl.StdCtrls,
  ComObj,
  System.JSON,
  Vcl.Dialogs,
  Vcl.Forms;

//==============================================================================

type
  TErrorResponse = record
    code: ANSIstring;
    error: ANSIstring;
  end;

//==============================================================================

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

//==============================================================================

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

//==============================================================================

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

//==============================================================================

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

//==============================================================================

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

//==============================================================================

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

//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================

type
  TColibryAPI = class
  private
    FUserKey: ANSIString;
    FUserName: ANSIString;
    FPassword: ANSIString;
    FBaseURL: ANSIString;

    Req: OleVariant;

    ErrorResponse: TErrorResponse;

    function GenerateUserKey(f_name: ANSIString): ANSIstring;
    function GetUserName(f_name: ANSIString): ANSIstring;
    function GetPassword(f_name: ANSIString): ANSIstring;
    function GetBaseURL(f_name: ANSIString): ANSIstring;
    function Smart2Float( s: string; xDefault: double = 0 ) : double;

    function CreateRequestParams(Act, u_Name, u_Passw: ANSIString): ANSIString; overload;
    function CreateRequestParams(Act, u_Name, u_Passw, aObject: ANSIString): ANSIString; overload;
    function CreateRequestParams(Act, u_Name, u_Passw, aObject, aAccount, aAccType, aAmount, aService, aOrderGUID: ANSIString): ANSIString; overload;
    function CreateRequestParams(Act, u_Name, u_Passw, aObject, aOrderGUID: ANSIString): ANSIString; overload;
    function GetSign(PParms: ANSIString): ANSIString;
    function GetMD5(pasw: ANSIstring): ANSIstring;
    function GetHMAC_SHA256(AKey, AStr: ANSIString): ANSIString;
    function POSTRequest(_URL: ANSIString; Params: ANSIString; out js: ANSIstring): ANSIString;
    function POSTHttp(URL: string; s: ANSIString): ANSIString;

    procedure ErrorResponseNotification(ErrCode, ErrMess: ANSIstring);

    procedure ParseAUTHResponse(js: ANSIstring);
    procedure ParseSERVICEResponse(js: ansistring);
    procedure ParseACCOUNTResponse(js: ansistring);
    procedure ParseBALANSEResponse(js: ansistring);
    procedure ParseORDERResponse(js: ansistring);
    procedure ParseSTATUSResponse(js: ansistring);
  public
    IsErrorResponse: boolean;

    AuthResponse: TAuthResponse;
    ServiceResponse: TServiceResponse;
    AccountResponse: TAccountResponse;
    BalanceResponse: TBalanceResponse;
    OrderResponse: TOrderResponse;
    StatusResponse: TStatusResponse;

    property UserKey: ANSIString read FUserKey write FUserKey;
    property UserName: ANSIString read FUserName write FUserName;
    property Password: ANSIString read FPassword write FPassword;
    property BaseURL: ANSIString read FBaseURL write FBaseURL;

    constructor Create;
    destructor Destroy;
  end;

//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================

const
  aAuth = 'auth';
  aService = 'service';
  aAccount = 'account';
  aBalance = 'balance';
  aOrder = 'order';
  aStatus = 'status';

  ErrorCodes: array[0..21] of TErrorResponse = ((code:'101';error:'Платеж не найден'),
                                                (code:'102';error:'Платеж с данным идентификатором уже существует'),
                                                (code:'103';error:'Платеж не найден в БД'),
                                                (code:'111';error:'Не верный номер абонента'),
                                                (code:'112';error:'Абонент не может осуществлять пополнение своего счета'),
                                                (code:'113';error:'Не достаточное количество кодов на складе'),
                                                (code:'114';error:'Не верно указана сумма'),
                                                (code:'115';error:'Не возможно отменить данный платеж'),
                                                (code:'121';error:'Не достаточно средств на счету'),
                                                (code:'122';error:'Превышен дневной лимит продаж'),
                                                (code:'124';error:'Превышена максимальная сумма платежа'),
                                                (code:'125';error:'органичение интервала времени работы объекта'),
                                                (code:'201';error:'Передан не верный параметр'),
                                                (code:'202';error:'Не верная подпись'),
                                                (code:'203';error:'Авторизация не пройдена'),
                                                (code:'204';error:'Нет права продажи'),
                                                (code:'205';error:'Не верный идентификатор услуги'),
                                                (code:'206';error:'Нет права продажи данной услуги'),
                                                (code:'207';error:'Не корректная цена услуги'),
                                                (code:'222';error:'Ошибка сервера'),
                                                (code:'223';error:'Ошибка у поставщика'),
                                                (code:'224';error:'Услуга временно не доступна, повторите попытку позже'));

//==============================================================================

var
  ColibryAPI: TColibryAPI;

//==============================================================================

{$R *.res}

//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================

function TColibryAPI.Smart2Float( s: string; xDefault: double = 0 ) : double;
var i: integer;
begin
   i:= pos( ',', s ); if i <> 0 then s[i] := '.';
   Val( s, Result, i );
   if i <> 0 then {ошибка преобразования} Result:= xDefault; // или Raise Exception...
end;

//==============================================================================

constructor TColibryAPI.Create;
begin
  UserKey:=GenerateUserKey('userkey');
  UserName:=GetUserName('username');
  Password:=GetPassword('userpass');
  BaseURL:=GetBaseURL('baseurl');
end;

//==============================================================================

destructor TColibryAPI.Destroy;
begin
  Free;
end;

//==============================================================================

function TColibryAPI.GenerateUserKey(f_name: ANSIString): ANSIstring;
var
  u_k: TGUID;
  s: String;
  f: TextFile;
begin
  AssignFile(f,ExtractFilePath(Application.Exename)+f_name);
  if not FileExists(ExtractFilePath(Application.Exename)+f_name) then
  begin
    Rewrite(f);
    CloseFile(f);
    CreateGUID(u_k);
    s:=GUIDToString(u_k);
    Append(f);
    Writeln(f,s);
    CloseFile(f);
  end
  else
  begin
    Reset(f);
    Readln(f,s);
    CloseFile(f);
  end;
  Result:=PChar(s);
end;

//==============================================================================

function TColibryAPI.GetUserName(f_name: ANSIString): ANSIstring;
var
  s: String;
  f: TextFile;
begin
  AssignFile(f,ExtractFilePath(Application.Exename)+f_name);
  if FileExists(ExtractFilePath(Application.Exename)+f_name) then
  begin
    Reset(f);
    Readln(f,s);
    CloseFile(f);
  end;
  UserName:=PChar(s);
  Result:=UserName;
end;

//==============================================================================

function TColibryAPI.GetPassword(f_name: ANSIString): ANSIstring;
var
  s: String;
  f: TextFile;
begin
  AssignFile(f,ExtractFilePath(Application.Exename)+f_name);
  if FileExists(ExtractFilePath(Application.Exename)+f_name) then
  begin
    Reset(f);
    Readln(f,s);
    CloseFile(f);
  end;
  Password:=PChar(s);
  Result:=Password;
end;

//==============================================================================

function TColibryAPI.GetBaseURL(f_name: ANSIString): ANSIstring;
var
  s: String;
  f: TextFile;
begin
  AssignFile(f,ExtractFilePath(Application.Exename)+f_name);
  if FileExists(ExtractFilePath(Application.Exename)+f_name) then
  begin
    Reset(f);
    Readln(f,s);
    CloseFile(f);
  end;
  BaseURL:=PChar(s);
  Result:=BaseURL;
end;

//==============================================================================

function TColibryAPI.GetSign(PParms: ANSIString): ANSIString;
var
  prm: TStringList;
  pasw: ANSIstring;
  i: integer;
  s: ANSIstring;
  Params: ANSIstring;
  hashPass: ANSIstring;
begin
  prm:=TStringList.Create;
  prm.Text:=PParms;
  if not Assigned(prm) then exit;
  try
    //удаляем подпись, если она есть в параметрах
    if prm.IndexOf('sign') > -1 then prm.Delete(prm.IndexOf('sign'));
    if prm.IndexOfName('password') > -1 then
    begin
      pasw:=prm.Values['password'];
      prm.Delete(prm.IndexOfName('password'));
    end;
    //сортировка всех параметров
    prm.Sort;
    Params:='';
    //конкатенация пар
    for i:=0 to prm.Count-1 do
    begin
      s:=prm[i];
      Delete(s,1,Pos('=',s));
      Params:=Params+s;
    end;
    //рассчитываем md5 пароля
    hashPass:=getMD5(pasw);
    //рассчитываем hmac_sha256 всей подписи и записываем ее в параметры
    Result:=ansistring(GetHMAC_SHA256(hashPass,Params));
  finally
    FreeAndNil(prm);
  end;
end;

//==============================================================================

function TColibryAPI.GetMD5(pasw: ANSIstring): ANSIstring;
begin
  with TIdHashMessageDigest5.Create do
    try
      Result:=ansilowercase(HashStringAsHex(pasw));
    finally
      free;
    end;
end;

//==============================================================================

function TColibryAPI.GetHMAC_SHA256(AKey, AStr: ANSIString): ANSIString;
var
  ctx: THMAC_Context;
  mac: TSHA256Digest;
begin
  hmac_SHA256_init(ctx, @AKey[1], Length(AKey));
  hmac_SHA256_update(ctx, @AStr[1], Length(AStr));
  hmac_SHA256_final(ctx, mac);
  Result:=HexStr(@mac, SizeOf(TSHA256Digest));
end;

//==============================================================================

function TColibryAPI.POSTRequest(_URL: ANSIString; Params: ANSIString;
  out js: ANSIstring): ANSIString;
var
  p: TStringList;
  s: WideString;
  i: integer;
  key,val: string;
begin
  p:=TStringList.Create;
  p.Text:=Params;
  if p.IndexOfName('password') > -1 then p.Delete(p.IndexOfName('password'));
  p.Sort;
  s:='{';
  for i:=0 to p.Count-1 do
  begin
    key:=p.Strings[i];
    Delete(key,pos('=',key),length(key));
    val:=p.Strings[i];
    Delete(val,1,pos('=',val));
    s:=s+'"'+key+'":"'+val+'"';
    if i <> p.Count-1 then s:=s+',';
  end;
  FreeAndNil(p);
  s:=s+'}';
  js:=s;
  Result:=POSTHttp(_URL,ansistring(s));
end;

//==============================================================================

function TColibryAPI.POSTHttp(URL: string; s: ANSIString): ANSIString;
begin
  Req:=CreateOleObject('WinHttp.WinHttpRequest.5.1');
  Req.Open('POST', URL, false);
  Req.setRequestHeader('Content-Type','application/json');
  Req.Send(s);
  Result := ansistring(Req.ResponseText);
end;

//==============================================================================

procedure TColibryAPI.ParseAUTHResponse(js: ANSIstring);
var
  s: TStringList;
  FJSON_AUTHObject: TJSONObject;
  FJSObjects: TJSONArray;
  i: integer;
  jsObject: TJSONObject;
begin
  ErrorResponse.error:='';
  ErrorResponse.code:='';

    FJSON_AUTHObject:=TJSONObject.ParseJSONValue(s.Text) as TJSONObject;
    if not Assigned(FJSON_AUTHObject) then
    begin
      IsErrorResponse:=true;
      exit;
    end;

  s:=TStringList.Create;
  s.Text:=js;

  if Assigned(FJSON_AUTHObject) then
  begin
    if pos('error',FJSON_AUTHObject.ToString)>0 then
    begin
      ErrorResponse.error:=FJSON_AUTHObject.Get('error').JsonValue.ToString;
      if pos('"',ErrorResponse.error)>0 then
      begin
        Delete(ErrorResponse.error,1,1);
        Delete(ErrorResponse.error,length(ErrorResponse.error),1);
      end;

      ErrorResponse.code:=FJSON_AUTHObject.Get('code').JsonValue.ToString;
      if pos('"',ErrorResponse.code)>0 then
      begin
        Delete(ErrorResponse.code,1,1);
        Delete(ErrorResponse.code,length(ErrorResponse.code),1);
      end;

      ErrorResponseNotification(ErrorResponse.code,ErrorResponse.error);
      FreeAndNil(FJSON_AUTHObject);
      IsErrorResponse:=true;
      exit;
    end
    else
    begin
      if Length(Trim(FJSON_AUTHObject.Get('objects').JsonValue.ToString))>0 then
      begin
        FJSObjects:=FJSON_AUTHObject.Get('objects').JsonValue as TJSONArray;
        SetLength(AuthResponse.objects,FJSObjects.Size);
        for i:=0 to FJSObjects.Size-1 do
        begin
          AuthResponse.objects[i].id:=(FJSObjects.Get(i) as TJSONObject).Get('id').JsonValue.ToString;
          AuthResponse.objects[i].code:=(FJSObjects.Get(i) as TJSONObject).Get('code').JsonValue.ToString;
          AuthResponse.objects[i].name:=(FJSObjects.Get(i) as TJSONObject).Get('name').JsonValue.ToString;
          AuthResponse.objects[i].parent_id:=(FJSObjects.Get(i) as TJSONObject).Get('parent_id').JsonValue.ToString;
        end;
        FJSObjects.Free;
      end
      else
        AuthResponse.objects:=nil;

      for i:=0 to Length(AuthResponse.objects)-1 do
      begin
        delete(AuthResponse.objects[i].id,1,1);
        delete(AuthResponse.objects[i].id,length(AuthResponse.objects[i].id),1);

        delete(AuthResponse.objects[i].code,1,1);
        delete(AuthResponse.objects[i].code,length(AuthResponse.objects[i].code),1);

        delete(AuthResponse.objects[i].name,1,1);
        delete(AuthResponse.objects[i].name,length(AuthResponse.objects[i].name),1);

        delete(AuthResponse.objects[i].parent_id,1,1);
        delete(AuthResponse.objects[i].parent_id,length(AuthResponse.objects[i].parent_id),1);
      end;

      if Length(Trim(FJSON_AUTHObject.Get('user').JsonValue.ToString))>0 then
      begin
        jsObject:=FJSON_AUTHObject.Get('user').JsonValue as TJSONObject;
        AuthResponse.user.id:=jsObject.Get('id').JsonValue.ToString;
        AuthResponse.user.userid:=jsObject.Get('userid').JsonValue.ToString;
        AuthResponse.user.name:=jsObject.Get('name').JsonValue.ToString;
        AuthResponse.user.needchangepass:=jsObject.Get('needchangepass').JsonValue.ToString;
        jsObject.Free;
      end;
      Delete(AuthResponse.user.id,1,1);
      Delete(AuthResponse.user.id,length(AuthResponse.user.id),1);
      Delete(AuthResponse.user.userid,1,1);
      Delete(AuthResponse.user.userid,length(AuthResponse.user.userid),1);
      Delete(AuthResponse.user.name,1,1);
      Delete(AuthResponse.user.name,length(AuthResponse.user.name),1);
      if pos('"',AuthResponse.user.needchangepass)>0 then
      begin
        Delete(AuthResponse.user.needchangepass,1,1);
        Delete(AuthResponse.user.needchangepass,length(AuthResponse.user.needchangepass),1);
      end;
    end;
  end;
end;

//==============================================================================

procedure TColibryAPI.ErrorResponseNotification(ErrCode, ErrMess: ANSIstring);
var
  i: integer;
begin
  if Length(trim(ErrMess))<0 then
  begin
    for i:=0 to length(ErrorCodes)-1 do
      if ErrorCodes[i].code=ErrCode then
      begin
        MessageDlg(ErrorCodes[i].error+#13+'Код ошибки: '+ErrorCodes[i].code,mtError,[mbOK],0);
        exit;
      end;
  end
  else
  begin
    MessageDlg(ErrMess+#13+'Код ошибки: '+ErrCode,mtError,[mbOK],0);
  end;
end;

//==============================================================================

procedure TColibryAPI.ParseSERVICEResponse(js: ansistring);
var
  s: TStringList;
  FJSON_SERVICEObject: TJSONObject;
  FJSObjects: TJSONArray;
  i: integer;
  JSGroup, JSGroup1, JSGroup2: TJSONObject;
begin
  ErrorResponse.error:='';
  ErrorResponse.code:='';
  s:=TStringList.Create;
  s.Text:=js;
  try
    FJSON_SERVICEObject:=TJSONObject.ParseJSONValue(s.Text) as TJSONObject;
    if not Assigned(FJSON_SERVICEObject) then
    begin
      raise Exception.Create('Ответ не содержит JSON-данные');
      IsErrorResponse:=true;
      exit;
    end;
  finally
    s.Free;
  end;

  if Assigned(FJSON_SERVICEObject) then
  begin
    if pos('error',FJSON_SERVICEObject.ToString)>0 then
    begin
      ErrorResponse.error:=FJSON_SERVICEObject.Get('error').JsonValue.ToString;
      if pos('"',ErrorResponse.error)>0 then
      begin
        Delete(ErrorResponse.error,1,1);
        Delete(ErrorResponse.error,length(ErrorResponse.error),1);
      end;

      ErrorResponse.code:=FJSON_SERVICEObject.Get('code').JsonValue.ToString;
      if pos('"',ErrorResponse.code)>0 then
      begin
        Delete(ErrorResponse.code,1,1);
        Delete(ErrorResponse.code,length(ErrorResponse.code),1);
      end;

      ErrorResponseNotification(ErrorResponse.code,ErrorResponse.error);
      FreeAndNil(FJSON_SERVICEObject);
      IsErrorResponse:=true;
      exit;
    end
    else
    begin
      if Length(Trim(FJSON_SERVICEObject.Get('data').JsonValue.ToString))>0 then
      begin
        FJSObjects:=FJSON_SERVICEObject.Get('data').JsonValue as TJSONArray;
        SetLength(ServiceResponse.Data,FJSObjects.Size+1);
        for i:=0 to FJSObjects.Size-1 do
        begin
          ServiceResponse.Data[i].id:=Integer(StrToInt((FJSObjects.Get(i) as TJSONObject).Get('id').JsonValue.ToString)); //-1
          ServiceResponse.Data[i].name:=ansiString((FJSObjects.Get(i) as TJSONObject).Get('name').JsonValue.ToString);
          if pos('"',ServiceResponse.Data[i].name)>0 then
          begin
            Delete(ServiceResponse.Data[i].name,1,1);
            Delete(ServiceResponse.Data[i].name,length(ServiceResponse.Data[i].name),1);
          end;

          ServiceResponse.Data[i].code:=ansistring((FJSObjects.Get(i) as TJSONObject).Get('code').JsonValue.ToString);
          if pos('"',ServiceResponse.Data[i].code)>0 then
          begin
            Delete(ServiceResponse.Data[i].code,1,1);
            Delete(ServiceResponse.Data[i].code,length(ServiceResponse.Data[i].code),1);
          end;

          ServiceResponse.Data[i].mark:=ansistring((FJSObjects.Get(i) as TJSONObject).Get('mark').JsonValue.ToString);
          if pos('"',ServiceResponse.Data[i].mark)>0 then
          begin
            Delete(ServiceResponse.Data[i].mark,1,1);
            Delete(ServiceResponse.Data[i].mark,length(ServiceResponse.Data[i].mark),1);
          end;

          ServiceResponse.Data[i].DefaultAmount:=Smart2Float((FJSObjects.Get(i) as TJSONObject).Get('defaultamount').JsonValue.ToString); //0.00;

          ServiceResponse.Data[i].UpdateDate:=ansistring((FJSObjects.Get(i) as TJSONObject).Get('updatedate').JsonValue.ToString);
          if pos('"',ServiceResponse.Data[i].UpdateDate)>0 then
          begin
            Delete(ServiceResponse.Data[i].UpdateDate,1,1);
            Delete(ServiceResponse.Data[i].UpdateDate,length(ServiceResponse.Data[i].UpdateDate),1);
          end;

          if
            ((FJSObjects.Get(i) as TJSONObject).Get('isdirectpay').JsonValue.ToString = '1')or
            (LowerCase((FJSObjects.Get(i) as TJSONObject).Get('isdirectpay').JsonValue.ToString) = 'true')or
            (LowerCase((FJSObjects.Get(i) as TJSONObject).Get('isdirectpay').JsonValue.ToString) = 't')
          then
            ServiceResponse.Data[i].IsDirectPay:=true
          else
            if
              ((FJSObjects.Get(i) as TJSONObject).Get('isdirectpay').JsonValue.ToString = '0')or
              (LowerCase((FJSObjects.Get(i) as TJSONObject).Get('isdirectpay').JsonValue.ToString) = 'false')or
              (LowerCase((FJSObjects.Get(i) as TJSONObject).Get('isdirectpay').JsonValue.ToString) = 'f')
            then
              ServiceResponse.Data[i].IsDirectPay:=false;

          ServiceResponse.Data[i].ImagePath:=ansistring((FJSObjects.Get(i) as TJSONObject).Get('imagePath').JsonValue.ToString);
          if pos('"',ServiceResponse.Data[i].ImagePath)>0 then
          begin
            Delete(ServiceResponse.Data[i].ImagePath,1,1);
            Delete(ServiceResponse.Data[i].ImagePath,length(ServiceResponse.Data[i].ImagePath),1);
          end;

          ServiceResponse.Data[i].acctype:=ansistring((FJSObjects.Get(i) as TJSONObject).Get('acctype').JsonValue.ToString);
          if pos('"',ServiceResponse.Data[i].acctype)>0 then
          begin
            Delete(ServiceResponse.Data[i].acctype,1,1);
            Delete(ServiceResponse.Data[i].acctype,length(ServiceResponse.Data[i].acctype),1);
          end;

          ServiceResponse.Data[i].extratype:=ansistring((FJSObjects.Get(i) as TJSONObject).Get('extratype').JsonValue.ToString);
          if pos('"',ServiceResponse.Data[i].extratype)>0 then
          begin
            Delete(ServiceResponse.Data[i].extratype,1,1);
            Delete(ServiceResponse.Data[i].extratype,length(ServiceResponse.Data[i].extratype),1);
          end;

          ServiceResponse.Data[i].mask:=ansistring((FJSObjects.Get(i) as TJSONObject).Get('mask').JsonValue.ToString);
          if pos('"',ServiceResponse.Data[i].mask)>0 then
          begin
            Delete(ServiceResponse.Data[i].mask,1,1);
            Delete(ServiceResponse.Data[i].mask,length(ServiceResponse.Data[i].mask),1);
          end;

          ServiceResponse.Data[i].minamount:= Smart2Float((FJSObjects.Get(i) as TJSONObject).Get('minamount').JsonValue.ToString,0);
          ServiceResponse.Data[i].maxamount:= Smart2Float((FJSObjects.Get(i) as TJSONObject).Get('maxamount').JsonValue.ToString,0);
          if pos('"image":"',(FJSObjects.Get(i) as TJSONObject).ToString)>0 then
            ServiceResponse.Data[i].image:=ansistring((FJSObjects.Get(i) as TJSONObject).Get('image').JsonValue.ToString);
          if pos('"',ServiceResponse.Data[i].image)>0 then
          begin
            Delete(ServiceResponse.Data[i].image,1,1);
            Delete(ServiceResponse.Data[i].image,length(ServiceResponse.Data[i].image),1);
          end;

          JSGroup:=(FJSObjects.Get(i) as TJSONObject).Get('group').JsonValue as TJSONObject;
          ServiceResponse.Data[i].group.id:=ansistring(JSGroup.Get('id').JsonValue.ToString);
          if pos('"',ServiceResponse.Data[i].group.id)>0 then
          begin
            Delete(ServiceResponse.Data[i].group.id,1,1);
            Delete(ServiceResponse.Data[i].group.id,length(ServiceResponse.Data[i].group.id),1);
          end;

          ServiceResponse.Data[i].group.name:=ansistring(JSGroup.Get('name').JsonValue.ToString);
          if pos('"',ServiceResponse.Data[i].group.name)>0 then
          begin
            Delete(ServiceResponse.Data[i].group.name,1,1);
            Delete(ServiceResponse.Data[i].group.name,length(ServiceResponse.Data[i].group.name),1);
          end;
          JSGroup.Free;

          JSGroup1:=(FJSObjects.Get(i) as TJSONObject).Get('provider').JsonValue as TJSONObject;
          ServiceResponse.Data[i].provider.id:=ansistring(JSGroup1.Get('id').JsonValue.ToString);
          if pos('"',ServiceResponse.Data[i].provider.id)>0 then
          begin
            Delete(ServiceResponse.Data[i].provider.id,1,1);
            Delete(ServiceResponse.Data[i].provider.id,length(ServiceResponse.Data[i].provider.id),1);
          end;

          ServiceResponse.Data[i].provider.name:=ansistring(JSGroup1.Get('name').JsonValue.ToString);
          if pos('"',ServiceResponse.Data[i].provider.name)>0 then
          begin
            Delete(ServiceResponse.Data[i].provider.name,1,1);
            Delete(ServiceResponse.Data[i].provider.name,length(ServiceResponse.Data[i].provider.name),1);
          end;
          JSGroup1.Free;

          JSGroup2:=(FJSObjects.Get(i) as TJSONObject).Get('type').JsonValue as TJSONObject;
          ServiceResponse.Data[i].ServiceType.id:=ansistring(JSGroup2.Get('id').JsonValue.ToString);
          if pos('"',ServiceResponse.Data[i].ServiceType.id)>0 then
          begin
            Delete(ServiceResponse.Data[i].ServiceType.id,1,1);
            Delete(ServiceResponse.Data[i].ServiceType.id,length(ServiceResponse.Data[i].ServiceType.id),1);
          end;

          ServiceResponse.Data[i].ServiceType.name:=ansistring(JSGroup2.Get('name').JsonValue.ToString);
          if pos('"',ServiceResponse.Data[i].ServiceType.name)>0 then
          begin
            Delete(ServiceResponse.Data[i].ServiceType.name,1,1);
            Delete(ServiceResponse.Data[i].ServiceType.name,length(ServiceResponse.Data[i].ServiceType.name),1);
          end;
          JSGroup2.Free;
        end;
      end;
    end;
  end;
end;

//==============================================================================

procedure TColibryAPI.ParseACCOUNTResponse(js: ansistring);
var
  FJSON_ACCOUNTObject: TJSONObject;
  s: TStringList;
begin
  ErrorResponse.error:='';
  ErrorResponse.code:='';
  s:=TStringList.Create;
  s.Text:=js;
  try
    FJSON_ACCOUNTObject:=TJSONObject.ParseJSONValue(s.Text) as TJSONObject;
    if not Assigned(FJSON_ACCOUNTObject) then
    begin
      raise Exception.Create('Ответ не содержит JSON-данные');
      IsErrorResponse:=true;
      exit;
    end;
  finally
    s.Free;
  end;

  if Assigned(FJSON_ACCOUNTObject) then
  begin
    if pos('error',FJSON_ACCOUNTObject.ToString)>0 then
    begin
      ErrorResponse.error:=FJSON_ACCOUNTObject.Get('error').JsonValue.ToString;
      if pos('"',ErrorResponse.error)>0 then
      begin
        Delete(ErrorResponse.error,1,1);
        Delete(ErrorResponse.error,length(ErrorResponse.error),1);
      end;

      ErrorResponse.code:=FJSON_ACCOUNTObject.Get('code').JsonValue.ToString;
      if pos('"',ErrorResponse.code)>0 then
      begin
        Delete(ErrorResponse.code,1,1);
        Delete(ErrorResponse.code,length(ErrorResponse.code),1);
      end;

      ErrorResponseNotification(ErrorResponse.code,ErrorResponse.error);
      FreeAndNil(FJSON_ACCOUNTObject);
      IsErrorResponse:=true;
      exit;
    end
    else
    begin
      AccountResponse.status:=FJSON_ACCOUNTObject.Get('status').JsonValue.ToString;
      if pos('"',AccountResponse.status)>0 then
      begin
        Delete(AccountResponse.status,1,1);
        Delete(AccountResponse.status,length(AccountResponse.status),1);
      end;
      if LowerCase(AccountResponse.status)='e' then
      begin
        AccountResponse.description:=FJSON_ACCOUNTObject.Get('description').JsonValue.ToString;
        if pos('"',AccountResponse.description)>0 then
        begin
          Delete(AccountResponse.description,1,1);
          Delete(AccountResponse.description,length(AccountResponse.description),1);
        end;
        AccountResponse.code:=StrToInt(FJSON_ACCOUNTObject.Get('code').JsonValue.ToString);
        ErrorResponseNotification(IntToStr(AccountResponse.code),AccountResponse.description);
        IsErrorResponse:=true;
        Exit;
      end;

      AccountResponse.description:=FJSON_ACCOUNTObject.Get('description').JsonValue.ToString;
      if pos('"',AccountResponse.description)>0 then
      begin
        Delete(AccountResponse.description,1,1);
        Delete(AccountResponse.description,length(AccountResponse.description),1);
      end;

      AccountResponse.providercode:=StrToInt(FJSON_ACCOUNTObject.Get('providercode').JsonValue.ToString);
      AccountResponse.code:=StrToInt(FJSON_ACCOUNTObject.Get('code').JsonValue.ToString);
      AccountResponse.service:=FJSON_ACCOUNTObject.Get('service').JsonValue.ToString;
      if pos('"',AccountResponse.service)>0 then
      begin
        Delete(AccountResponse.service,1,1);
        Delete(AccountResponse.service,length(AccountResponse.service),1);
      end;

      AccountResponse.limit:=Smart2Float(FJSON_ACCOUNTObject.Get('limit').JsonValue.ToString,0);
      AccountResponse.fee:=Smart2Float(FJSON_ACCOUNTObject.Get('fee').JsonValue.ToString,0);
      AccountResponse.currency:=FJSON_ACCOUNTObject.Get('currency').JsonValue.ToString;
      if pos('"',AccountResponse.currency)>0 then
      begin
        Delete(AccountResponse.currency,1,1);
        Delete(AccountResponse.currency,length(AccountResponse.currency),1);
      end;

      AccountResponse.dpamount:=FJSON_ACCOUNTObject.Get('dpamount').JsonValue.ToString;
      if pos('"',AccountResponse.dpamount)>0 then
      begin
        Delete(AccountResponse.dpamount,1,1);
        Delete(AccountResponse.dpamount,length(AccountResponse.dpamount),1);
      end;

      AccountResponse.dpcurrency:=FJSON_ACCOUNTObject.Get('dpcurrency').JsonValue.ToString;
      if pos('"',AccountResponse.dpcurrency)>0 then
      begin
        Delete(AccountResponse.dpcurrency,1,1);
        Delete(AccountResponse.dpcurrency,length(AccountResponse.dpcurrency),1);
      end;

      if pos('providerid',FJSON_ACCOUNTObject.ToString)>0 then
        AccountResponse.providerid:=StrToInt(FJSON_ACCOUNTObject.Get('providerid').JsonValue.ToString)
      else
        AccountResponse.providerid:=-100500;
    end;
  end;
end;

//==============================================================================

procedure TColibryAPI.ParseBALANSEResponse(js: ansistring);
var
  s: TStringList;
  FJSON_BALANSEObject: TJSONObject;
  FJSObjects: TJSONArray;
  i: integer;
  JSGroup: TJSONObject;
begin
  ErrorResponse.error:='';
  ErrorResponse.code:='';
  s:=TStringList.Create;
  s.Text:=js;

  try
    FJSON_BALANSEObject:=TJSONObject.ParseJSONValue(s.Text) as TJSONObject;
    if not Assigned(FJSON_BALANSEObject) then
    begin
      raise Exception.Create('Ответ не содержит JSON-данные');
      IsErrorResponse:=true;
      exit;
    end;
  finally
    s.Free;
  end;

  if Assigned(FJSON_BALANSEObject) then
  begin
    if pos('error',FJSON_BALANSEObject.ToString)>0 then
    begin
      ErrorResponse.error:=FJSON_BALANSEObject.Get('error').JsonValue.ToString;
      if pos('"',ErrorResponse.error)>0 then
      begin
        Delete(ErrorResponse.error,1,1);
        Delete(ErrorResponse.error,length(ErrorResponse.error),1);
      end;

      ErrorResponse.code:=FJSON_BALANSEObject.Get('code').JsonValue.ToString;
      if pos('"',ErrorResponse.code)>0 then
      begin
        Delete(ErrorResponse.code,1,1);
        Delete(ErrorResponse.code,length(ErrorResponse.code),1);
      end;

      ErrorResponseNotification(ErrorResponse.code,ErrorResponse.error);
      FreeAndNil(FJSON_BALANSEObject);
      IsErrorResponse:=true;
      exit;
    end
    else
    begin
      if Length(Trim(FJSON_BALANSEObject.Get('portfolios').JsonValue.ToString))>0 then
      begin
        FJSObjects:=FJSON_BALANSEObject.Get('portfolios').JsonValue as TJSONArray;
        SetLength(BalanceResponse.portfolios,FJSObjects.Size);
        for i:=0 to FJSObjects.Size-1 do
        begin
          BalanceResponse.portfolios[i].amount:=StrToInt((FJSObjects.Get(i) as TJSONObject).Get('amount').JsonValue.ToString);
          BalanceResponse.portfolios[i].limit:=StrToInt((FJSObjects.Get(i) as TJSONObject).Get('limit').JsonValue.ToString);

          JSGroup:=(FJSObjects.Get(i) as TJSONObject).Get('currency').JsonValue as TJSONObject;
          BalanceResponse.portfolios[i].currency.id:=JSGroup.Get('id').JsonValue.ToString;
          if pos('"',BalanceResponse.portfolios[i].currency.id)>0 then
          begin
            Delete(BalanceResponse.portfolios[i].currency.id,1,1);
            Delete(BalanceResponse.portfolios[i].currency.id,length(BalanceResponse.portfolios[i].currency.id),1);
          end;

          BalanceResponse.portfolios[i].currency.name:=JSGroup.Get('name').JsonValue.ToString;
          if pos('"',BalanceResponse.portfolios[i].currency.name)>0 then
          begin
            Delete(BalanceResponse.portfolios[i].currency.name,1,1);
            Delete(BalanceResponse.portfolios[i].currency.name,length(BalanceResponse.portfolios[i].currency.name),1);
          end;

          BalanceResponse.portfolios[i].currency.short:=JSGroup.Get('short').JsonValue.ToString;
          JSGroup.Free;
          if pos('"',BalanceResponse.portfolios[i].currency.short)>0 then
          begin
            Delete(BalanceResponse.portfolios[i].currency.short,1,1);
            Delete(BalanceResponse.portfolios[i].currency.short,length(BalanceResponse.portfolios[i].currency.short),1);
          end;
        end;
      end;
    end;
  end;
end;

//==============================================================================

procedure TColibryAPI.ParseORDERResponse(js: ansistring);
var
  s: TStringList;
  FJSON_ORDERObject: TJSONObject;
  JSGroup: TJSONObject;
begin
  ErrorResponse.error:='';
  ErrorResponse.code:='';
  s:=TStringList.Create;
  s.Text:=js;
  try
    FJSON_ORDERObject:=TJSONObject.ParseJSONValue(s.Text) as TJSONObject;
    if not Assigned(FJSON_ORDERObject) then
    begin
      raise Exception.Create('Ответ не содержит JSON-данные');
      IsErrorResponse:=true;
      exit;
    end;
  finally
    s.Free;
  end;

  if Assigned(FJSON_ORDERObject) then
  begin
    if pos('error',FJSON_ORDERObject.ToString)>0 then
    begin
      ErrorResponse.error:=FJSON_ORDERObject.Get('error').JsonValue.ToString;
      if pos('"',ErrorResponse.error)>0 then
      begin
        Delete(ErrorResponse.error,1,1);
        Delete(ErrorResponse.error,length(ErrorResponse.error),1);
      end;

      ErrorResponse.code:=FJSON_ORDERObject.Get('code').JsonValue.ToString;
      if pos('"',ErrorResponse.code)>0 then
      begin
        Delete(ErrorResponse.code,1,1);
        Delete(ErrorResponse.code,length(ErrorResponse.code),1);
      end;

      ErrorResponseNotification(ErrorResponse.code,ErrorResponse.error);
      FreeAndNil(FJSON_ORDERObject);
      IsErrorResponse:=true;
      exit;
    end
    else
    begin
      OrderResponse.status:=FJSON_ORDERObject.Get('status').JsonValue.ToString;
      if pos('"',OrderResponse.status)>0 then
      begin
        Delete(OrderResponse.status,1,1);
        Delete(OrderResponse.status,length(OrderResponse.status),1);
      end;

      if (LowerCase(OrderResponse.status)='e')or(LowerCase(OrderResponse.status)='r')or(trim(OrderResponse.status)='') then
      begin
        OrderResponse.description:=FJSON_ORDERObject.Get('description').JsonValue.ToString;
        if pos('"',OrderResponse.description)>0 then
        begin
          Delete(OrderResponse.description,1,1);
          Delete(OrderResponse.description,length(OrderResponse.description),1);
        end;

        OrderResponse.code:=StrToInt(FJSON_ORDERObject.Get('code').JsonValue.ToString);
        ErrorResponseNotification(IntToStr(OrderResponse.code),OrderResponse.description);
        IsErrorResponse:=true;
        Exit;
      end;

      OrderResponse.description:=FJSON_ORDERObject.Get('description').JsonValue.ToString;
      if pos('"',OrderResponse.description)>0 then
      begin
        Delete(OrderResponse.description,1,1);
        Delete(OrderResponse.description,length(OrderResponse.description),1);
      end;

      OrderResponse.code:=StrToInt(FJSON_ORDERObject.Get('code').JsonValue.ToString);
      OrderResponse.orderid:=StrToInt(FJSON_ORDERObject.Get('orderid').JsonValue.ToString);
      OrderResponse.createdate:=FJSON_ORDERObject.Get('createdate').JsonValue.ToString;
      if pos('"',OrderResponse.createdate)>0 then
      begin
        Delete(OrderResponse.createdate,1,1);
        Delete(OrderResponse.createdate,length(OrderResponse.createdate),1);
      end;

      OrderResponse.transdate:=FJSON_ORDERObject.Get('transdate').JsonValue.ToString;
      if pos('"',OrderResponse.transdate)>0 then
      begin
        Delete(OrderResponse.transdate,1,1);
        Delete(OrderResponse.transdate,length(OrderResponse.transdate),1);
      end;

      OrderResponse.payid:=StrToInt(FJSON_ORDERObject.Get('payid').JsonValue.ToString);
      OrderResponse.amount:=Smart2Float(FJSON_ORDERObject.Get('amount').JsonValue.ToString,0);
      OrderResponse.fee:=Smart2Float(FJSON_ORDERObject.Get('fee').JsonValue.ToString);
      OrderResponse.account:=FJSON_ORDERObject.Get('account').JsonValue.ToString;
      if pos('"',OrderResponse.account)>0 then
      begin
        Delete(OrderResponse.account,1,1);
        Delete(OrderResponse.account,length(OrderResponse.account),1);
      end;

      OrderResponse.acctype:=FJSON_ORDERObject.Get('acctype').JsonValue.ToString;
      if pos('"',OrderResponse.acctype)>0 then
      begin
        Delete(OrderResponse.acctype,1,1);
        Delete(OrderResponse.acctype,length(OrderResponse.acctype),1);
      end;

      OrderResponse.name:=FJSON_ORDERObject.Get('name').JsonValue.ToString;
      if pos('"',OrderResponse.name)>0 then
      begin
        Delete(OrderResponse.name,1,1);
        Delete(OrderResponse.name,length(OrderResponse.name),1);
      end;

      JSGroup:=FJSON_ORDERObject.Get('service').JsonValue as TJSONObject;
      OrderResponse.service.id:=StrToInt(JSGroup.Get('id').JsonValue.ToString);
      JSGroup.Free;
    end;
  end;
end;

//==============================================================================

procedure TColibryAPI.ParseSTATUSResponse(js: ansistring);
var
  s: TStringList;
  FJSON_STATUSObject: TJSONObject;
  JSGroup: TJSONObject;
begin
  ErrorResponse.error:='';
  ErrorResponse.code:='';
  s:=TStringList.Create;
  s.Text:=js;
  try
    FJSON_STATUSObject:=TJSONObject.ParseJSONValue(s.Text) as TJSONObject;
    if not Assigned(FJSON_STATUSObject) then
    begin
      raise Exception.Create('Ответ не содержит JSON-данные');
      IsErrorResponse:=true;
      exit;
    end;
  finally
    s.Free;
  end;

  if Assigned(FJSON_STATUSObject) then
  begin
    if pos('error',FJSON_STATUSObject.ToString)>0 then
    begin
      ErrorResponse.error:=FJSON_STATUSObject.Get('error').JsonValue.ToString;
      if pos('"',ErrorResponse.error)>0 then
      begin
        Delete(ErrorResponse.error,1,1);
        Delete(ErrorResponse.error,length(ErrorResponse.error),1);
      end;

      ErrorResponse.code:=FJSON_STATUSObject.Get('code').JsonValue.ToString;
      if pos('"',ErrorResponse.code)>0 then
      begin
        Delete(ErrorResponse.code,1,1);
        Delete(ErrorResponse.code,length(ErrorResponse.code),1);
      end;

      ErrorResponseNotification(ErrorResponse.code,ErrorResponse.error);
      FreeAndNil(FJSON_STATUSObject);
      IsErrorResponse:=true;
      exit;
    end
    else
    begin
      StatusResponse.status:=FJSON_STATUSObject.Get('status').JsonValue.ToString;
      if pos('"',StatusResponse.status)>0 then
      begin
        Delete(StatusResponse.status,1,1);
        Delete(StatusResponse.status,length(StatusResponse.status),1);
      end;

      if (LowerCase(StatusResponse.status)='e')or(LowerCase(StatusResponse.status)='r')or(trim(StatusResponse.status)='') then
      begin
        StatusResponse.description:=FJSON_STATUSObject.Get('description').JsonValue.ToString;
        if pos('"',StatusResponse.description)>0 then
        begin
          Delete(StatusResponse.description,1,1);
          Delete(StatusResponse.description,length(StatusResponse.description),1);
        end;

        StatusResponse.code:=StrToInt(FJSON_STATUSObject.Get('code').JsonValue.ToString);
        ErrorResponseNotification(IntToStr(StatusResponse.code),StatusResponse.description);
        IsErrorResponse:=true;
        Exit;
      end;

      StatusResponse.description:=FJSON_STATUSObject.Get('description').JsonValue.ToString;
      if pos('"',StatusResponse.description)>0 then
      begin
        Delete(StatusResponse.description,1,1);
        Delete(StatusResponse.description,length(StatusResponse.description),1);
      end;

      StatusResponse.code:=StrToInt(FJSON_STATUSObject.Get('code').JsonValue.ToString);
      StatusResponse.orderid:=StrToInt(FJSON_STATUSObject.Get('orderid').JsonValue.ToString);
      StatusResponse.payid:=StrToInt(FJSON_STATUSObject.Get('payid').JsonValue.ToString);
      StatusResponse.receipt:=StrToInt(FJSON_STATUSObject.Get('receipt').JsonValue.ToString);
      StatusResponse.amount:=Smart2Float(FJSON_STATUSObject.Get('amount').JsonValue.ToString,0);
      StatusResponse.currency:=FJSON_STATUSObject.Get('currency').JsonValue.ToString;
      if pos('"',StatusResponse.currency)>0 then
      begin
        Delete(StatusResponse.currency,1,1);
        Delete(StatusResponse.currency,length(StatusResponse.currency),1);
      end;

      StatusResponse.dpamount:=Smart2Float(FJSON_STATUSObject.Get('dpamount').JsonValue.ToString,0);
      StatusResponse.dpcurrency:=FJSON_STATUSObject.Get('dpcurrency').JsonValue.ToString;
      if pos('"',StatusResponse.dpcurrency)>0 then
      begin
        Delete(StatusResponse.dpcurrency,1,1);
        Delete(StatusResponse.dpcurrency,length(StatusResponse.dpcurrency),1);
      end;

      StatusResponse.fee:=Smart2Float(FJSON_STATUSObject.Get('fee').JsonValue.ToString,0);
      StatusResponse.createdate:=FJSON_STATUSObject.Get('createdate').JsonValue.ToString;
      if pos('"',StatusResponse.createdate)>0 then
      begin
        Delete(StatusResponse.createdate,1,1);
        Delete(StatusResponse.createdate,length(StatusResponse.createdate),1);
      end;

      StatusResponse.transdate:=FJSON_STATUSObject.Get('transdate').JsonValue.ToString;
      if pos('"',StatusResponse.transdate)>0 then
      begin
        Delete(StatusResponse.transdate,1,1);
        Delete(StatusResponse.transdate,length(StatusResponse.transdate),1);
      end;

      StatusResponse.account:=FJSON_STATUSObject.Get('account').JsonValue.ToString;
      if pos('"',StatusResponse.account)>0 then
      begin
        Delete(StatusResponse.account,1,1);
        Delete(StatusResponse.account,length(StatusResponse.account),1);
      end;

      StatusResponse.acctype:=FJSON_STATUSObject.Get('acctype').JsonValue.ToString;
      if pos('"',StatusResponse.acctype)>0 then
      begin
        Delete(StatusResponse.acctype,1,1);
        Delete(StatusResponse.acctype,length(StatusResponse.acctype),1);
      end;

      JSGroup:=FJSON_STATUSObject.Get('service').JsonValue as TJSONObject;
      StatusResponse.service.id:=JSGroup.Get('id').JsonValue.ToString;
      if pos('"',StatusResponse.service.id)>0 then
      begin
        Delete(StatusResponse.service.id,1,1);
        Delete(StatusResponse.service.id,length(StatusResponse.service.id),1);
      end;

      StatusResponse.service.name:=JSGroup.Get('name').JsonValue.ToString;
      if pos('"',StatusResponse.service.name)>0 then
      begin
        Delete(StatusResponse.service.name,1,1);
        Delete(StatusResponse.service.name,length(StatusResponse.service.name),1);
      end;
      JSGroup.Free;
    end;
  end;
end;

//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================

function TColibryAPI.CreateRequestParams(Act, u_Name, u_Passw: ANSIString): ANSIString;
var
  prm: TStringList;
  res: ANSIString;
  sign: ANSIString;
begin
  prm:=TStringList.Create;
  if Assigned(prm) then
  begin
    prm.Add('a='+Act);
    prm.Add('user='+u_Name);
    prm.Add('password='+u_Passw);
    res:=prm.Text;

    try
      sign:=GetSign(res);
    except
      raise Exception.Create('Не могу получить подпись!');
    end;
    prm.Add('sign='+sign);
  end;
  Result:=prm.Text;
end;

//==============================================================================

function TColibryAPI.CreateRequestParams(Act, u_Name, u_Passw, aObject: ANSIString): ANSIString;
var
  prm: TStringList;
  res: ANSIString;
  sign: ANSIString;
begin
  prm:=TStringList.Create;
  if Assigned(prm) then
  begin
    prm.Add('a='+Act);
    prm.Add('user='+u_Name);
    prm.Add('password='+u_Passw);
    prm.Add('object='+aObject);
    res:=prm.Text;

    try
      sign:=GetSign(res);
    except
      raise Exception.Create('Не могу получить подпись!');
    end;
    prm.Add('sign='+sign);
  end;
  Result:=prm.Text;
end;

//==============================================================================

function TColibryAPI.CreateRequestParams(Act, u_Name, u_Passw, aObject, aAccount, aAccType, aAmount, aService, aOrderGUID: ANSIString): ANSIString;
var
  prm: TStringList;
  res: ANSIString;
  sign: ANSIString;
begin
  prm:=TStringList.Create;
  if Assigned(prm) then
  begin
    prm.Add('a='+Act);
    prm.Add('user='+u_Name);
    prm.Add('password='+u_Passw);
    prm.Add('object='+aObject);
    prm.Add('account='+aAccount);
    prm.Add('acctype='+aAccType);
    prm.Add('amount='+aAmount);
    prm.Add('service='+aService);
    prm.Add('orderguid='+aOrderGUID);
    res:=prm.Text;

    try
      sign:=GetSign(res);
    except
      raise Exception.Create('Не могу получить подпись!');
    end;
    prm.Add('sign='+sign);
  end;
  Result:=prm.Text;
end;

//==============================================================================

function TColibryAPI.CreateRequestParams(Act, u_Name, u_Passw, aObject, aOrderGUID: ANSIString): ANSIString;
var
  prm: TStringList;
  res: ANSIString;
  sign: ANSIString;
begin
  prm:=TStringList.Create;
  if Assigned(prm) then
  begin
    prm.Add('a='+Act);
    prm.Add('user='+u_Name);
    prm.Add('password='+u_Passw);
    prm.Add('object='+aObject);
    prm.Add('orderguid='+aOrderGUID);
    res:=prm.Text;

    try
      sign:=GetSign(res);
    except
      raise Exception.Create('Не могу получить подпись!');
    end;
    prm.Add('sign='+sign);
  end;
  Result:=prm.Text;
end;

//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================

procedure STATUS_Request(pUserKey: widestring; pUserName: widestring;
  pPassword: widestring; pObject: widestring; pBaseURL: widestring;
  pOrderGUID: ansistring; TmpPath: ansistring; TmpFile: ansistring;
  TmpPathLen: LongInt; TmpFileLen: LongInt; IsError: boolean = false); stdcall;
var
  params: ANSIString;
  mResponse: TMemo;
  request: ANSIString;
  s: TStringList;
  res: ansistring;
  PathTemp, FileTemp: AnsiString;
  tmpF: Text;
begin
  SetLength(PathTemp,TmpPathLen);
  PathTemp:=PAnsiChar(TmpPath);
  SetLength(FileTemp,TmpFileLen);
  FileTemp:=PAnsiChar(TmpFile);

  try
    params:=ColibryAPI.CreateRequestParams(aStatus,pUserName,pPassword,pObject,pOrderGUID);
    mResponse:=TMemo.Create(nil);
    mResponse.Text:=ColibryAPI.POSTRequest(pBaseURL,params,request);
  except
    raise Exception.Create('Ошибка проверки статуса платежа!'+#13+'Запрос: URL - '+pBaseURL+' '+request+#13+'Ответ: '+mResponse.Text);
    IsError:=true;
    exit;
  end;

  s:=TStringList.Create;
  s.Text:=mResponse.Text;
  ColibryAPI.ParseSTATUSResponse(s.Text);
  s.Free;

  if ColibryAPI.IsErrorResponse then
  begin
    raise Exception.Create('Ошибка проверки статуса платежа!'+#13+'Запрос: URL - '+pBaseURL+' '+request+#13+'Ответ: '+mResponse.Text);
    mResponse.Free;
    IsError:=true;
    exit;
  end;

  res:='[';
  res:=res+'status='+ColibryAPI.StatusResponse.status+',';
  res:=res+'description='+ColibryAPI.StatusResponse.description+',';
  res:=res+'code='+IntToStr(ColibryAPI.StatusResponse.code);//+',';
  if (trim(ColibryAPI.StatusResponse.status)='')or(LowerCase(ColibryAPI.StatusResponse.status)='e')or(LowerCase(ColibryAPI.StatusResponse.status)='r') then
    res:=res+']'
  else
  begin
    res:=res+',';
    res:=res+'orderid='+IntToStr(ColibryAPI.StatusResponse.orderid)+',';
    res:=res+'payid='+IntToStr(ColibryAPI.StatusResponse.payid)+',';
    res:=res+'receipt='+IntToStr(ColibryAPI.StatusResponse.receipt)+',';
    res:=res+'amount='+FloatToStr(ColibryAPI.StatusResponse.amount)+',';
    res:=res+'currency='+ColibryAPI.StatusResponse.currency+',';
    res:=res+'dpamount='+FloatToStr(ColibryAPI.StatusResponse.dpamount)+',';
    res:=res+'dpcurrency='+ColibryAPI.StatusResponse.dpcurrency+',';
    res:=res+'fee='+FloatToStr(ColibryAPI.StatusResponse.fee)+',';
    res:=res+'createdate='+ColibryAPI.StatusResponse.createdate+',';
    res:=res+'transdate='+ColibryAPI.StatusResponse.transdate+',';
    res:=res+'account='+ColibryAPI.StatusResponse.account+',';
    res:=res+'acctype='+ColibryAPI.StatusResponse.acctype+',';
    res:=res+'service={id='+ColibryAPI.StatusResponse.service.id+',';
    res:=res+'name='+ColibryAPI.StatusResponse.service.name+'}';
    res:=res+']';
  end;

  if ColibryAPI.IsErrorResponse then IsError:=true;

  if FileExists(FileTemp) then
  begin
    AssignFile(tmpF,FileTemp);
    Rewrite(tmpF);
    Write(tmpF,res);
    CloseFile(tmpF);
  end;
end;

//==============================================================================

procedure ORDER_Request(pUserKey: WideString; pUserName: WideString;
  pPassword: WideString; pObject: WideString; pBaseURL: WideString;
  pAccount: WideString; pAccType: WideString; pAmount: WideString;
  pService: WideString; pOrderGuid: ansistring; TmpPath: ansistring;
  TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt; IsError: boolean = false); stdcall;
var
  params: ANSIString;
  mResponse: TMemo;
  request: ANSIString;
  s: TStringList;
  PathTemp, FileTemp: AnsiString;
  tmpF: Text;
    res: ansistring;
begin
  SetLength(PathTemp,TmpPathLen);
  PathTemp:=PAnsiChar(TmpPath);
  SetLength(FileTemp,TmpFileLen);
  FileTemp:=PAnsiChar(TmpFile);

  try
    params:=ColibryAPI.CreateRequestParams(aOrder,pUserName,pPassword,pObject,pAccount,pAccType,pAmount,pService,pOrderGuid);
    mResponse:=TMemo.Create(nil);
    mResponse.Text:=ColibryAPI.POSTRequest(pBaseURL,params,request);
  except
    raise Exception.Create('Ошибка проведения платежа!'+#13+'Запрос: URL - '+pBaseURL+' '+request+#13+'Ответ: '+mResponse.Text);
    IsError:=true;
    exit;
  end;

  s:=TStringList.Create;
  s.Text:=mResponse.Text;
  ColibryAPI.ParseORDERResponse(s.Text);
  s.Free;

  if ColibryAPI.IsErrorResponse then
  begin
    raise Exception.Create('Ошибка проведения платежа!'+#13+'Запрос: URL - '+pBaseURL+' '+request+#13+'Ответ: '+mResponse.Text);
    IsError:=true;
    mResponse.Free;
    exit;
  end;

  res:='[';
  res:=res+'status='+ColibryAPI.OrderResponse.status+',';
  res:=res+'description='+ColibryAPI.OrderResponse.description+',';
  res:=res+'code='+IntToStr(ColibryAPI.OrderResponse.code)+',';
  res:=res+'orderid='+IntToStr(ColibryAPI.OrderResponse.orderid)+',';
  res:=res+'createdate='+ColibryAPI.OrderResponse.createdate+',';
  res:=res+'transdate='+ColibryAPI.OrderResponse.transdate+',';
  res:=res+'payid='+IntToStr(ColibryAPI.OrderResponse.payid)+',';
  res:=res+'amount='+FloatToStr(ColibryAPI.OrderResponse.amount)+',';
  res:=res+'fee='+FloatToStr(ColibryAPI.OrderResponse.fee)+',';
  res:=res+'account='+ColibryAPI.OrderResponse.account+',';
  res:=res+'acctype='+ColibryAPI.OrderResponse.acctype+',';
  res:=res+'name='+ColibryAPI.OrderResponse.name+',';
  res:=res+'service={id='+IntToStr(ColibryAPI.OrderResponse.service.id)+'}';
  res:=res+']';

  if ColibryAPI.IsErrorResponse then IsError:=true;

  if FileExists(FileTemp) then
  begin
    AssignFile(tmpF,FileTemp);
    Rewrite(tmpF);
    Write(tmpF,res);
    CloseFile(tmpF);
  end;
end;

//==============================================================================

procedure GenerateOrderGUID(TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt); stdcall;
var
  u_k: TGUID;
  res: string;
  PathTemp, FileTemp: AnsiString;
  tmpF: Text;
begin
  SetLength(PathTemp,TmpPathLen);
  PathTemp:=PAnsiChar(TmpPath);
  SetLength(FileTemp,TmpFileLen);
  FileTemp:=PAnsiChar(TmpFile);

  CreateGUID(u_k);
  res:=GUIDToString(u_k);
  res:=StringReplace(res,'{','',[rfReplaceAll,rfIgnoreCase]);
  res:=StringReplace(res,'}','',[rfReplaceAll,rfIgnoreCase]);

  if FileExists(FileTemp) then
  begin
    AssignFile(tmpF,FileTemp);
    Rewrite(tmpF);
    Write(tmpF,res);
    CloseFile(tmpF);
  end;
end;

//==============================================================================

procedure ACCOUNT_Request(pUserKey: WideString; pUserName: WideString;
  pPassword: WideString; pObject: WideString; pBaseURL: WideString;
  pAccount: WideString; pAccType: WideString; pAmount: WideString;
  pService: WideString; pOrderGuid: ansistring; TmpPath: ansistring;
  TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt; IsError: boolean = false); stdcall;
var
  params: ANSIString;
  mResponse: TMemo;
  request: ANSIString;
  s: TStringList;
    res: ansistring;
  PathTemp, FileTemp: AnsiString;
  tmpF: Text;
begin
  SetLength(PathTemp,TmpPathLen);
  PathTemp:=PAnsiChar(TmpPath);
  SetLength(FileTemp,TmpFileLen);
  FileTemp:=PAnsiChar(TmpFile);

  try
    params:=ColibryAPI.CreateRequestParams(aAccount,pUserName,pPassword,pObject,pAccount,pAccType,pAmount,pService,pOrderGuid);
    mResponse:=TMemo.Create(nil);
    mResponse.Text:=ColibryAPI.POSTRequest(pBaseURL,params,request);
  except
//    raise Exception.Create('Ошибка получения доступных услуг!'+#13+'Запрос: URL - '+pBaseURL+' '+request+#13+'Ответ: '+mResponse.Text);
    IsError:=true;
    exit;
  end;

  s:=TStringList.Create;
  s.Text:=mResponse.Text;
  ColibryAPI.ParseACCOUNTResponse(s.Text);
  s.Free;

  if ColibryAPI.IsErrorResponse then
  begin
    raise Exception.Create('Ошибка получения доступных услуг!'+#13+'Запрос: URL - '+pBaseURL+' '+request+#13+'Ответ: '+mResponse.Text);
    IsError:=true;
    mResponse.Free;
    exit;
  end;

  res:='[';
  res:=res+'status='+ColibryAPI.AccountResponse.status+',';
  res:=res+'description='+ColibryAPI.AccountResponse.description+',';
  res:=res+'providercode='+IntToStr(ColibryAPI.AccountResponse.providercode)+',';
  res:=res+'code='+IntToStr(ColibryAPI.AccountResponse.code)+',';
  res:=res+'service='+ColibryAPI.AccountResponse.service+',';
  res:=res+'limit='+FloatToStr(ColibryAPI.AccountResponse.limit)+',';
  res:=res+'fee='+FloatToStr(ColibryAPI.AccountResponse.fee)+',';
  res:=res+'currency='+ColibryAPI.AccountResponse.currency+',';
  res:=res+'dpamount='+ColibryAPI.AccountResponse.dpamount+',';
  res:=res+'dpcurrency='+ColibryAPI.AccountResponse.dpcurrency;
  if length(trim(ColibryAPI.AccountResponse.OrderGUID)) > 0 then res:=res+',orderguid='+ColibryAPI.AccountResponse.OrderGUID;
  if length(IntToStr(ColibryAPI.AccountResponse.providerid)) > 0 then res:=res+',providerid='+IntToStr(ColibryAPI.AccountResponse.providerid);
  res:=res+']';

  if ColibryAPI.IsErrorResponse then IsError:=true;
  
  if FileExists(FileTemp) then
  begin
    AssignFile(tmpF,FileTemp);
    Rewrite(tmpF);
    Write(tmpF,res);
    CloseFile(tmpF);
  end;
end;

//==============================================================================

procedure BALANCE_Request(pUserKey: widestring; pUserName: widestring;
  pPassword: widestring; pObject: widestring; pBaseURL: widestring;
  TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt;
  TmpFileLen: LongInt; IsError: boolean = false); stdcall;
var
  params: ANSIString;
  mResponse: TMemo;
  request: ANSIString;
  s: TStringList;
  res: ansistring;
  i: integer;
  PathTemp, FileTemp: AnsiString;
  tmpF: Text;
begin
  SetLength(PathTemp,TmpPathLen);
  PathTemp:=PAnsiChar(TmpPath);
  SetLength(FileTemp,TmpFileLen);
  FileTemp:=PAnsiChar(TmpFile);

  try
    params:=ColibryAPI.CreateRequestParams(aBalance,pUserName,pPassword,pObject);

    mResponse:=TMemo.Create(nil);
    mResponse.Text:=ColibryAPI.POSTRequest(pBaseURL,params,request);
  except
    raise Exception.Create('Ошибка проверки баланса!'+#13+'Запрос: URL - '+pBaseURL+' '+request+#13+'Ответ: '+mResponse.Text);
    IsError:=true;
    exit;
  end;

  s:=TStringList.Create;
  s.Text:=mResponse.Text;
  ColibryAPI.ParseBALANSEResponse(s.Text);
  s.Free;

  if ColibryAPI.IsErrorResponse then
  begin
    raise Exception.Create('Ошибка проверки баланса!'+#13+'Запрос: URL - '+pBaseURL+' '+request+#13+'Ответ: '+mResponse.Text);
    mResponse.Free;
    IsError:=true;
    exit;
  end;

  res:='';
  if length(ColibryAPI.BalanceResponse.portfolios)>0 then
  begin
    res:='portfolios=[';
    for i:=0 to Length(ColibryAPI.BalanceResponse.portfolios)-1 do
    begin
      res:=res+'amount_'+IntToStr(i)+'='+IntToStr(ColibryAPI.BalanceResponse.portfolios[i].amount)+',';
      res:=res+'limit_'+IntToStr(i)+'='+IntToStr(ColibryAPI.BalanceResponse.portfolios[i].limit)+',';
      res:=res+'currency_'+IntToStr(i)+'={id='+ColibryAPI.BalanceResponse.portfolios[i].currency.id+',name='+ColibryAPI.BalanceResponse.portfolios[i].currency.name+',short='+ColibryAPI.BalanceResponse.portfolios[i].currency.short+'}';
      if i < length(ColibryAPI.BalanceResponse.portfolios)-1 then
        res:=res+';'
      else
        res:=res+']';
    end;
  end;

  if ColibryAPI.IsErrorResponse then IsError:=true;
  
  if FileExists(FileTemp) then
  begin
    AssignFile(tmpF,FileTemp);
    Rewrite(tmpF);
    Write(tmpF,res);
    CloseFile(tmpF);
  end;
end;

//==============================================================================

procedure SERVICE_Request(pUserKey: widestring; pUserName: widestring;
  pPassword: widestring; pObject: widestring; pBaseURL: widestring;
  TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt;
  TmpFileLen: LongInt; IsError: boolean = false); stdcall;
var
  params: ANSIString;
  mResponse: TMemo;
  request: ANSIString;
  s: TStringList;
    res: ansistring;
    i: integer;
  PathTemp, FileTemp: AnsiString;
  tmpF: Text;
begin
  SetLength(PathTemp,TmpPathLen);
  PathTemp:=PAnsiChar(TmpPath);
  SetLength(FileTemp,TmpFileLen);
  FileTemp:=PAnsiChar(TmpFile);

  try
    params:=ColibryAPI.CreateRequestParams(aService,pUserName,pPassword,pObject);
    mResponse:=TMemo.Create(nil);
    mResponse.Text:=ColibryAPI.POSTRequest(pBaseURL,params,request);
  except
    raise Exception.Create('Ошибка получения доступных услуг!'+#13+'Запрос: URL - '+pBaseURL+' '+request+#13+'Ответ: '+mResponse.Text);
    IsError:=true;
    exit;
  end;

  s:=TStringList.Create;
  s.Text:=mResponse.Text;
  ColibryAPI.ParseSERVICEResponse(s.Text);
  s.Free;

  if ColibryAPI.IsErrorResponse then
  begin
    raise Exception.Create('Ошибка получения доступных услуг!'+#13+'Запрос: URL - '+pBaseURL+' '+request+#13+'Ответ: '+mResponse.Text);
    mResponse.Free;
    IsError:=true;
    exit;
  end;

  res:='';
  if length(ColibryAPI.ServiceResponse.Data)>0 then
  begin
    res:='data=[';
    for i:=0 to Length(ColibryAPI.ServiceResponse.Data)-1 do
    begin
      res:=res+'id_'+IntToStr(i)+'='+IntToStr(ColibryAPI.ServiceResponse.Data[i].id)+',';
      res:=res+'name_'+IntToStr(i)+'='+ColibryAPI.ServiceResponse.Data[i].name+',';
      res:=res+'code_'+IntToStr(i)+'='+ColibryAPI.ServiceResponse.Data[i].code+',';
      res:=res+'mark_'+IntToStr(i)+'='+ColibryAPI.ServiceResponse.Data[i].mark+',';
      res:=res+'defaultamount_'+IntToStr(i)+'='+FloatToStr(ColibryAPI.ServiceResponse.Data[i].DefaultAmount)+',';
      res:=res+'updatedate_'+IntToStr(i)+'='+ColibryAPI.ServiceResponse.Data[i].UpdateDate+',';

      if ColibryAPI.ServiceResponse.Data[i].IsDirectPay then
        res:=res+'isdirectpay_'+IntToStr(i)+'=true,'
      else
        res:=res+'isdirectpay_'+IntToStr(i)+'=false,';

      res:=res+'group_'+IntToStr(i)+'={id='+ColibryAPI.ServiceResponse.Data[i].group.id+',name='+ColibryAPI.ServiceResponse.Data[i].group.name+'},';
      res:=res+'provider_'+IntToStr(i)+'={id='+ColibryAPI.ServiceResponse.Data[i].provider.id+',name='+ColibryAPI.ServiceResponse.Data[i].provider.name+'},';
      res:=res+'type_'+IntToStr(i)+'={id='+ColibryAPI.ServiceResponse.Data[i].ServiceType.id+',name='+ColibryAPI.ServiceResponse.Data[i].ServiceType.name+'},';
      res:=res+'imagePath_'+IntToStr(i)+'='+ColibryAPI.ServiceResponse.Data[i].ImagePath+',';
      res:=res+'acctype_'+IntToStr(i)+'='+ColibryAPI.ServiceResponse.Data[i].acctype+',';
      res:=res+'extratype_'+IntToStr(i)+'='+ColibryAPI.ServiceResponse.Data[i].extratype+',';
      res:=res+'mask_'+IntToStr(i)+'='+ColibryAPI.ServiceResponse.Data[i].mask+',';
      res:=res+'minamount_'+IntToStr(i)+'='+FloatToStr(ColibryAPI.ServiceResponse.Data[i].minamount)+',';
      res:=res+'maxamount_'+IntToStr(i)+'='+FloatToStr(ColibryAPI.ServiceResponse.Data[i].maxamount)+',';
      res:=res+'image_'+IntToStr(i)+'='+ColibryAPI.ServiceResponse.Data[i].image;

      if i < length(ColibryAPI.ServiceResponse.Data)-1 then
        res:=res+';'
      else
        res:=res+']';
    end;
  end;

  if ColibryAPI.IsErrorResponse then IsError:=true;
  
  if FileExists(FileTemp) then
  begin
    AssignFile(tmpF,FileTemp);
    Rewrite(tmpF);
    Write(tmpF,res);
    CloseFile(tmpF);
  end;
end;

//==============================================================================

procedure AUTH_Request(pUserKey: widestring; pUserName: widestring;
  pPassword: widestring; pBaseURL: widestring; TmpPath: ansistring;
  TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt;
  IsError: boolean = false); stdcall;
var
  params: ANSIString;
  mResponse: TMemo;
  request: ANSIString;
  s: TStringList;
  i: integer;
  res: ansistring;
  PathTemp, FileTemp: AnsiString;
  tmpF: Text;
begin
  SetLength(PathTemp,TmpPathLen);
  PathTemp:=PAnsiChar(TmpPath);
  SetLength(FileTemp,TmpFileLen);
  FileTemp:=PAnsiChar(TmpFile);

  try
    params:=ColibryAPI.CreateRequestParams(aAuth,pUserName,pPassword);
    mResponse:=TMemo.Create(nil);
    mResponse.Text:=ColibryAPI.POSTRequest(pBaseURL,params,request);
  except
    raise Exception.Create('Ошибка авторизации!'+#13+'Запрос: URL - '+pBaseURL+' '+request+#13+'Ответ: '+mResponse.Text);
    IsError:=true;
    exit;
  end;

  s:=TStringList.Create;
  s.Text:=mResponse.Text;
  ColibryAPI.ParseAUTHResponse(s.Text);
  s.Free;

  if ColibryAPI.IsErrorResponse then
  begin
    raise Exception.Create('Ошибка авторизации!'+#13+'Запрос: URL - '+pBaseURL+' '+request+#13+'Ответ: '+mResponse.Text);
    IsError:=true;
    mResponse.Free;
    exit;
  end;

  res:='';
  if length(ColibryAPI.AuthResponse.objects)>0 then
  begin
    res:='objects=[';
    for i:=0 to Length(ColibryAPI.AuthResponse.objects)-1 do
    begin
      res:=res+'id_'+IntToStr(i)+'='+ColibryAPI.AuthResponse.objects[i].id+',';
      res:=res+'code_'+IntToStr(i)+'='+ColibryAPI.AuthResponse.objects[i].code+',';
      res:=res+'name_'+IntToStr(i)+'='+ColibryAPI.AuthResponse.objects[i].name+',';
      res:=res+'parent_'+IntToStr(i)+'='+ColibryAPI.AuthResponse.objects[i].parent_id;
      if i < length(ColibryAPI.AuthResponse.objects)-1 then
        res:=res+';'
      else
        res:=res+'];';
    end;
  end;
  res:=res+'user=[';
  res:=res+'id='+ColibryAPI.AuthResponse.user.id+',';
  res:=res+'userid='+ColibryAPI.AuthResponse.user.userid+',';
  res:=res+'name='+ColibryAPI.AuthResponse.user.name+',';
  res:=res+'needchangepass='+ColibryAPI.AuthResponse.user.needchangepass;
  res:=res+']';

  if ColibryAPI.IsErrorResponse then IsError:=true;
  
  if FileExists(FileTemp) then
  begin
    AssignFile(tmpF,FileTemp);
    Rewrite(tmpF);
    Write(tmpF,res);
    CloseFile(tmpF);
  end;
end;

//==============================================================================

procedure CreateColibryAPI(TmpPath: ansistring; TmpFile: ansistring; TmpPathLen: LongInt; TmpFileLen: LongInt); stdcall;
var
  PathTemp, FileTemp: AnsiString;
  tmpF: Text;
  pUserKey: String;
  pUserName: String;
  pPassword: String;
  pBaseURL: String;
begin
  ColibryAPI:=TColibryAPI.Create;
  pUserKey:=ColibryAPI.UserKey;
  pUserName:=ColibryAPI.UserName;
  pPassword:=ColibryAPI.Password;
  pBaseURL:=ColibryAPI.BaseURL;

  SetLength(PathTemp,TmpPathLen);
  PathTemp:=PAnsiChar(TmpPath);
  SetLength(FileTemp,TmpFileLen);
  FileTemp:=PAnsiChar(TmpFile);

  if FileExists(FileTemp) then
  begin
    AssignFile(tmpF,FileTemp);
    Rewrite(tmpF);
    Writeln(tmpF,'pUserKey='+ColibryAPI.UserKey
                +',pUserName='+ColibryAPI.UserName
                +',pPassword='+ColibryAPI.Password
                +',pBaseURL='+ColibryAPI.BaseURL);
    CloseFile(tmpF);
  end;
end;

//==============================================================================

function MD5(pasw: ANSIstring): ANSIstring; stdcall;
begin
  with TIdHashMessageDigest5.Create do
    try
      Result:=ansilowercase(HashStringAsHex(pasw));
    finally
      free;
    end;
end;

//==============================================================================

exports
  CreateColibryAPI,
  AUTH_Request,
  SERVICE_Request,
  BALANCE_Request,
  ACCOUNT_Request,
  ORDER_Request,
  STATUS_Request,
  GenerateOrderGUID,
  MD5;

begin
end.
