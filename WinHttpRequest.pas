unit WinHttpRequest;

interface
uses
  Classes, uJSON, TypInfo;

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
  ComObj, SysUtils;

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
begin
  Result := False;
  Self.Open;
  try
    http.Send(aMessage);
    http.WaitForResponse;
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

  end;
end;

procedure TWinHttpRequest.Open;
begin
  http.Open('POST', fHost, True);
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

initialization
  {инициализация массива сообтветствия номера метода отправки т его имени}
  init;

end.
