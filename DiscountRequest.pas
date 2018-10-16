unit DiscountRequest;

interface
uses
  JSonChekNPH, WinHttpRequest;
type

  TDiscountRequest = class
  private
    fChekRequest  : TVoucherChek;
    fChekResponse : TVoucherChek;
    fHttp : TWinHttpRequest;
  public

    function SendRequest : boolean;
    property ChekRequest : TVoucherChek read fChekRequest write fChekRequest ;
    property ChekResponse : TVoucherChek read fChekResponse write fChekResponse;
    constructor Create(aToken, aService : string; aMethodType : THttpMethod);
    destructor Destroy;
  end;
implementation

{ TDiscountRequest }

constructor TDiscountRequest.Create(aToken, aService : string; aMethodType : THttpMethod);
begin
  fChekRequest  := TVoucherChek.Create(nil);
  fChekResponse := TVoucherChek.Create(nil);
  fHttp := TWinHttpRequest.Create(nil,HOST_NPH + '/' +aService ,aMethodType);
  fHttp.Token := aToken;
end;

destructor TDiscountRequest.Destroy;
begin
  fChekRequest.Free;
  fChekResponse.Free;
  fHttp.Free;
end;

function TDiscountRequest.SendRequest: boolean;
var
  sRequest  : string;
  sResponse : string;
  iCode : Integer;
begin
  Result := False;
  sRequest := fChekRequest.ObjectToJSONString;
  if (fHttp.Send(sRequest, iCode, sResponse)) then
  begin
     fChekResponse.LoadJSONToObject(sResponse);
     Result := True;
  end;
end;

end.

