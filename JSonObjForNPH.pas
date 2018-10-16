unit JSonObjForNPH;

interface
Uses
 JSONSerialize, WinHttpRequest;


type

  TJSONAuthorize = class(TJSONSerializable)
  private
    fLogin : string;
    fPassword : string;
  published
    property JSON_login: string read fLogin write fLogin;
    property JSON_password : string read fPassword write fPassword;
  public
    property Login : string read fLogin write fLogin;
    property Password : string read fPassword write fPassword;
  end;

  TJSONToken = class(TJSONSerializable)
  private
    fToken : string;
    fExpires : string;
    function GetExpires: TDateTime;
    procedure SetExpires(const Value: TDateTime);
  published
    property JSON_access_token : string read fToken write fToken;
    property JSON_expires : string read fExpires write fExpires;
  public
    property Token : string read fToken write fToken;
    property Expires : TDateTime read GetExpires write SetExpires;
  end;

  TAuthRequest = class
  private
    fLogin,
    fPassword : string;
  protected
    fRequest : TJSONAuthorize;
    fResponce: TJSONToken;
    fHttp : TWinHttpRequest;
  public
    function getTokenObj : TJSONToken;
    function getTokenStr : string;
    function SendRequest : boolean;
    constructor Create(aLogin, aPassword : string);
    destructor Destroy;
  end;
implementation

{ TJSONTokenRequest }

function TJSONToken.GetExpires: TDateTime;
begin
  Result := setISOtoDateTime(fExpires);
end;

procedure TJSONToken.SetExpires(const Value: TDateTime);
begin
   fExpires := setDateTimeToStrISO(Value);
end;

{ TAuthRequest }

constructor TAuthRequest.Create(aLogin, aPassword: string);
begin
  Self.fLogin := aLogin;
  Self.fPassword := aPassword;
  fHttp := TWinHttpRequest.Create(nil, HOST_NPH + '/Token', tmPOST);
  fRequest := TJSONAuthorize.Create(nil);
  fResponce := TJSONToken.Create(nil);
end;

destructor TAuthRequest.Destroy;
begin
  fRequest.Free;
  fResponce.Free;
  fHttp.Free;
end;

function TAuthRequest.getTokenObj: TJSONToken;
var
  oToken : TJSONToken;
begin
   oToken := TJSONToken.Create(nil);
   oToken.Token := fResponce.Token;
   oToken.Expires := fResponce.Expires;
   Result := oToken;
end;

function TAuthRequest.getTokenStr: string;
begin
  Result := fResponce.Token;
end;

function TAuthRequest.SendRequest : boolean;
var
  sResponce : string;
  iCode : Integer;
begin
  Result := False;
  fRequest.Login := fLogin;
  fRequest.Password := fPassword;
  if (fHttp.Send(fRequest.ObjectToJSONString, iCode, sResponce)) then
  begin
     fResponce.LoadJSONToObject(sResponce);
     Result := True;
  end;
end;

end.
