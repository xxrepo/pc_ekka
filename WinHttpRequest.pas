unit WinHttpRequest;

interface
uses
  Classes, uJSONforOptima, TypInfo;

const
    HOST_NPH = 'https://api.nph.com.ua';
type
  THttpMethod = (tmPOST = 0, tmGET = 1, tmPUT = 2);


type
  TWinHttpRequest = class(TComponent)
  private
    fHost   : string;
    fToken : string;
    http : OleVariant;
    fMethod : THttpMethod;
    procedure SetToken(const Value: string);

  protected
    procedure Open;
    procedure SaveLog(aServiceType : string;
                      aReqTime : TDateTime;
                      aReqMessage : string;
                      aCode : Integer;
                      aRespTime : TDateTime;
                      aRespText :string;
                      aHost : string;
                      aUserID : Integer
                      );
  public
    function Send(const aMessage : string; out aCode : Integer; out aResponseText : string) : boolean;
    destructor Destroy;
    constructor Create(aOwner : TComponent;
                       const aHost : string;
                       const aMethod : THttpMethod);reintroduce;
    property host : string read fHost write fHost;
    property Token : string read fToken write SetToken;
  end;

var
  MethodName : array[0..2] of string;

implementation
uses
  ComObj, SysUtils, DataModuleU, DB, ADODB;

procedure init;
begin
  MethodName[Ord(tmPost)]  :=  'POST';
  MethodName[Ord(tmGET)]   :=  'GET';
  MethodName[Ord(tmPUT)]   :=  'PUT';
end;
function GetMethodName(aMethod : THttpMethod) : string;
begin
  Result := MethodName[Ord(aMethod)];
end;

{ TWinHttpRequest }

constructor TWinHttpRequest.Create(aOwner : TComponent;
                       const aHost : string;
                       const aMethod : THttpMethod);
var
  sRequest : string;
begin
  inherited Create(aOwner);
  Self.fHost := aHost;
  Self.fMethod := aMethod;
  http := CreateOleObject('WinHttp.WinHttpRequest.5.1');
end;

destructor TWinHttpRequest.Destroy;
begin
  http := 0;
  inherited;
end;

function TWinHttpRequest.Send(const aMessage : string; out aCode : Integer; out aResponseText : string) : boolean;
var
  response_dt, request_dt : TDateTime;
begin
  Result := False;
  Self.Open;
  try
    request_dt := Now;
    http.Send(aMessage);
    http.WaitForResponse;
    response_dt := Now;
    aCode := http.status;
    aResponseText := http.ResponseText;
    try
      case http.status of
        200..299:
        begin
          Result := True;
        end;
      end;
    except on Exception do
      Result := False;
    end;
  finally
     SaveLog('OPTIMA',
             request_dt,
             aMessage,
             aCode,
             response_dt,
             aResponseText,
             host,
             0);
  end;
end;

procedure TWinHttpRequest.Open;
var
  methodName : String;
begin
  methodName := GetMethodName(Self.fMethod);
  http.Open(methodName, fHost, True);
  http.SetRequestHeader('Content-Type','application/json');
  http.SetRequestHeader('Accept','application/json');
  http.SetRequestHeader('Cache-Control','no-cache');
  if FToken <> '' then
    http.SetRequestHeader('Authorization',format('Bearer %s',[fToken]));
end;

procedure TWinHttpRequest.SetToken(const Value: string);
begin
  if (fToken = '')
  then
  begin
    fToken := Value;
  end;
end;


procedure TWinHttpRequest.SaveLog(aServiceType: string;
                                  aReqTime: TDateTime;
                                  aReqMessage: string;
                                  aCode: Integer;
                                  aRespTime: TDateTime;
                                  aRespText, aHost: string;
                                  aUserID: Integer);
var
   Q : TADOStoredProc;
begin
  Q := TADOStoredProc.Create(nil);
  with Q do
  try
    try
      Connection:=DM.ADOCo;
      Parameters.Clear;
      ProcedureName:= 'sprSaveToJournWebService';
//      SQL.Add(' if OBJECT_ID(''sprSaveToJournWebService'') is not null ');
     // SQL.Add(' exec sprSaveToJournWebService :ServiceType, '''+FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz',aReqTime)+''', :ReqMessage, :Code, '''+FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz',aRespTime)+''', :RespText, :Host, :UserID ');
     { SQL.Add(' exec sprSaveToJournWebService '''+aServiceType+''','+
               ''''+FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz',aReqTime) +''','+
               ''''+aReqMessage+''', '+IntToStr(aCode)+', '''+FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz',aRespTime)+ ''''+
               ', '''+aRespText+''', '''+aHost+''', '+IntTostr(aUserID)+' ');
      }

      Parameters.CreateParameter('@service_type',  ftString,   pdInput,   15,    aServiceType);
      Parameters.CreateParameter('@request_time',  ftDateTime, pdInput,   23,    aReqTime);
      Parameters.CreateParameter('@request_data',  ftString,   pdInput,   2000,  aReqMessage);
      Parameters.CreateParameter('@code_operation',ftInteger,  pdInput,   10,    aCode);
      Parameters.CreateParameter('@response_time', ftDateTime, pdInput,   23,    aRespTime);
      Parameters.CreateParameter('@response_text', ftString,   pdInput,   2000,  aRespText);
      Parameters.CreateParameter('@request_host',  ftString,   pdInput,   500,   aHost);
      Parameters.CreateParameter('@user_id',       ftInteger,  pdInput,   10,    aUserID);


      ExecProc;
    except

    end;
  finally
     FreeAndNil(Q);
  end;

end;

initialization
  {инициализация массива сообтветствия номера метода отправки т его имени}
  init;

end.
