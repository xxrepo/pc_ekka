unit JSonChekNPH;

interface
uses
  Classes, JSonObjForNPH, JSONSerialize, WinHttpRequest, uJSONforOptima;

type
  TDiscount = class(TJSONSerializable)
  private
     fCode : string;
     fQuantity : Integer;
     fPrice : Currency;
    fjPrice: integer;
    function getjPrice: Variant;
    procedure setjPrice(const Value: VAriant);
  published
    property JSON_code     : string  read fCode write fCode;
    property JSON_quantity : integer read fQuantity write fQuantity;
    property JSON_price    : Variant read getjPrice write setjPrice;
  public
    property Code     : string  read fCode write fCode;
    property Quantity : integer read fQuantity write fQuantity;
    property Price    : Currency read fPrice write fPrice;
  end;

  TCashVaucher = class(TJSONSerializable)
  private
    fCode        : string;
    fLineID      : Int64;
    fCodeType    : string;
    fProductName : string;
    fSeries      : string;
    fQuantity    : Integer;
    fPrice       : Currency;
    fAmount      : Currency;
    fSourcePrice : Currency;
    fUOM         : string;
    fDiscount    : Currency;
    fCashVoucherID : string;
    function getPrice: Currency;
    procedure setPrice(const Value: Currency);
    function getAmount: Currency;
    function getDiscount: Currency;
    procedure setAmount(const Value: Currency);
    procedure setDiscount(const Value: Currency);
    function getjPrice: Variant;
    procedure setjPrice(const Value: Variant);
    function getjAmount: Variant;
    procedure setjAmount(const Value: Variant);
    function getjDiscount: Variant;
    procedure setjDiscount(const Value: Variant);
    function getProductName: string;
    procedure setProductName(const Value: string);
    function getjfProductName: UTF8String;
    procedure setjProductName(const Value: UTF8String);
    function getjSourcePrice: Variant;
    function getSourcePrice: Currency;
    procedure setjSourcePrice(const Value: Variant);
    procedure setSourcePrice(const Value: Currency);
  published
    property JSON_cashVoucherID:string read fCashVoucherID write fCashVoucherID;
    property JSON_code        : string read fCode write fCode;
    property JSON_lineID      : Int64 read fLineId write fLineID;
    property JSON_codeType    : string read fCodeType write fCodeType;
    property JSON_productName : string read fProductName write fProductName;
    property JSON_series      : string read fSeries write fSeries;
    property JSON_quantity    : Integer read fQuantity write fQuantity;
    property JSON_price       : Variant read getjPrice write setjPrice;
    property JSON_SourcePrice : Variant read getjSourcePrice write setjSourcePrice;
    property JSON_amount      : Variant read getjAmount write setjAmount;
    property JSON_uom         : string read fUOM write fUOM;
    property JSON_discountAmount : Variant read getjDiscount write setjDiscount;
  public
    property CashVoucherID  : string read fCashVoucherID write fCashVoucherID;
    property Code           : string read fCode write fCode;
    property LineID         : Int64 read fLineId write fLineID;
    property CodeType       : string read fCodeType write fCodeType;
    property ProductName    : string read getProductName write setProductName;
    property Series         : string read fSeries write fSeries;
    property Quantity       : Integer read fQuantity write fQuantity;
    property Price          : Currency read getPrice write setPrice;
    property SourcePrice    : Currency read getSourcePrice write setSourcePrice;
    property Amount         : Currency read getAmount write setAmount;
    property UOM            : string read fUOM write fUOM;
    property DiscountAmount : Currency read getDiscount write setDiscount;
    constructor Create(aOwner : TComponent); reintroduce;
  end;
type
  TCashVauchers = array of TCashVaucher;
  TDiscounts    = array of TDiscount;
type
  TVoucherChek = class(TJSONSerializable)
  private
    fID               : string;
    fAddressID        : Integer;
    fNumber           : string;
    fVaucherType      : Integer;
    fCardNumber       : string;
    fConfirmed        : Variant;
    fSalesDate        : string;
    fOperationDate    : string;
    fDescription      : string;
    fCashVaucherItems : TCashVauchers;
    fDiscounts        : TDiscounts;
    procedure SetFOperationDate(const Value: string);
    procedure SetfSalesDate(const Value: string);
    function getSalesDate: TDateTime;
    procedure setSalesDate(const Value: TDateTime);
    function getOperationDate: TDateTime;
    procedure setOperationDate(const Value: TDateTime);
  published
    property JSON_id          : string read fID write fID;
    property JSON_address_ID  : Integer read fAddressID write fAddressID;
    property JSON_number      : string read fNumber write fNumber;
    property JSON_type        : Integer read fVaucherType write fVaucherType;
    property JSON_cardNumber  : string read fCardNumber write fCardNumber;
    property JSON_confirmed   : Variant read fConfirmed write fConfirmed;
    property JSON_salesDate   : string read fSalesDate write SetfSalesDate;
    property JSON_operationDate : string read fOperationDate write SetFOperationDate;
    property JSON_description : string read fDescription write fDescription;
  public
    property ID               : string read fID write fID;
    property CashVaucherItems : TCashVauchers read fCashVaucherItems write fCashVaucherItems;
    property DiscountItems    : TDiscounts read fDiscounts write fDiscounts;
    property Address_ID       : Integer read fAddressID write fAddressID;
    property Number           : string read fNumber write fNumber;
    property VaucherType      : Integer read fVaucherType write fVaucherType;
    property CardNumber       : string read fCardNumber write fCardNumber;
    property Confirmed        : Variant read fConfirmed write fConfirmed;
    property SalesDate        : TDateTime read getSalesDate write setSalesDate;
    property Description      : string read fDescription write fDescription;
    property OperationDate    : TDateTime read getOperationDate write setOperationDate;
    function AddVoucher(aVoucher : TCashVaucher) : TCashVaucher;
    function ObjectToJSONString : string; override;
    function ObjectToJsonObject : TJSONObject; override;
    procedure LoadJSONToObject(aJSonString : string); override;
    procedure ClearVouchers;
    constructor Create(aOwner : TComponent); reintroduce;
  end;


implementation
uses
  SysUtils, DateUtils;

{ TVoucherChek }

constructor TVoucherChek.Create(aOwner: TComponent);
begin
  inherited;
  fConfirmed := False;
end;

procedure TVoucherChek.SetFOperationDate(const Value: string);
begin
  fOperationDate := StringReplace(Value,'\u003A',':',[rfReplaceAll]);
end;

procedure TVoucherChek.SetfSalesDate(const Value: string);
begin
  fSalesDate := StringReplace(Value,'\u003A',':',[rfReplaceAll]);
end;

function TVoucherChek.ObjectToJSONString: string;
begin
   Result := ObjectToJsonObject.toString;
   Result := StringReplace(Result, '\u003A',':',[rfReplaceAll,rfIgnoreCase]);
end;

procedure TVoucherChek.LoadJSONToObject(aJSonString: string);
var
  oJsonArray : TJSONArray;
  oJsonObject :TJSONObject;
  i : Integer;
begin
  inherited;
  oJsonObject := TJSONObject.create(aJSonString);
  try
    try
      oJsonArray  := oJsonObject.getJSONArray('cashVoucherItems');
      if Assigned(oJsonArray) then
      begin
        SetLength(fCashVaucherItems,oJsonArray.length);
        for i := 0 to oJsonArray.length-1 do
        begin
          fCashVaucherItems[i] := TCashVaucher.Create(self);
          fCashVaucherItems[i].LoadJSONToObject(oJsonArray.getJSONObject(i).toString);
        end;
      end;
    except
      on NoSuchElementException do
    end;
    try
      oJsonArray  := oJsonObject.getJSONArray('discountItems');
      if Assigned(oJsonArray) then
      begin
        SetLength(fDiscounts,oJsonArray.length);
        for i := 0 to oJsonArray.length-1 do
        begin
          fDiscounts[i] := TDiscount.Create(self);
          fDiscounts[i].LoadJSONToObject(oJsonArray.getJSONObject(i).toString);
        end;
      end;
    except
      on NoSuchElementException do
    end;

  finally
    oJsonArray := nil;
    if Assigned(oJsonObject) then
    oJsonObject.Free;
  end;
end;


function TVoucherChek.ObjectToJsonObject: TJSONObject;
var
  oJson : TJSONObject;
  oJsonArr : TJSONArray;
  i : Integer;
  jsonItemObject : TJSONObject;
begin
  oJson := inherited ObjectToJsonObject;
  if Assigned(oJson) then
  begin
    oJsonArr := TJSONArray.create;
    try
      for i := Low(fCashVaucherItems) to High(fCashVaucherItems) do
      begin
        jsonItemObject := fCashVaucherItems[i].ObjectToJsonObject;
        oJsonArr.put(jsonItemObject);
      end;
      if (oJsonArr.length > 0) then
         oJson.put('cashVoucherItems',oJsonArr);
    except
    end;
    try
      oJsonArr := TJSONArray.create;
      for i := Low(fDiscounts) to High(fDiscounts) do
      begin
        jsonItemObject := fDiscounts[i].ObjectToJsonObject;
        oJsonArr.put(jsonItemObject);
      end;
      if (oJsonArr.length > 0) then
         oJson.put('discountItems',oJsonArr);
    except
    end;
  end;
  Result := oJson;
  oJsonArr := nil;
  oJson := nil;
end;

function TVoucherChek.AddVoucher(aVoucher: TCashVaucher): TCashVaucher;
begin
  Result := nil;
  if not Assigned(aVoucher) then
    Exit;
  SetLength(fCashVaucherItems,Length(fCashVaucherItems)+1);
  fCashVaucherItems[High(fCashVaucherItems)] := aVoucher;
  Result := fCashVaucherItems[High(fCashVaucherItems)];
end;

function TVoucherChek.getSalesDate: TDateTime;
begin
   Result := setISOtoDateTime(fSalesDate);
end;

procedure TVoucherChek.setSalesDate(const Value: TDateTime);
//var
  //AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word;
begin
//  DecodeDateTime(Value, AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond);
//  fSalesDate := Format('%.4u-%.2u-%.2uT%.2u:%.2u:%.2u.%.3u',[AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond]);
  fSalesDate := setDateTimeToStrISO(value);
end;

function TVoucherChek.getOperationDate: TDateTime;
begin
  Result := setISOtoDateTime(fOperationDate);
end;

procedure TVoucherChek.setOperationDate(const Value: TDateTime);
begin
   fOperationDate := setDateTimeToStrISO(value);
end;

procedure TVoucherChek.ClearVouchers;
var
  i : integer;
  oVoucher : TCashVaucher;
begin
  for i := Low(fCashVaucherItems) to High(fCashVaucherItems) do
  begin
     oVoucher :=  fCashVaucherItems[i];
     if Assigned(oVoucher) then
       oVoucher.Free;
  end;
  SetLength(fCashVaucherItems,0);
end;

{ TCashVaucher }

constructor TCashVaucher.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  Price := 0;
  Amount := 0;

end;

function TCashVaucher.getAmount: Currency;
begin
  Result := fAmount;
end;

function TCashVaucher.getDiscount: Currency;
begin
  Result := fDiscount;
end;

function TCashVaucher.getjAmount: Variant;
begin
  Result := fAmount;
end;

function TCashVaucher.getjDiscount: Variant;
begin
  Result := fDiscount;
end;

function TCashVaucher.getjfProductName: UTF8String;
begin
  Result := AnsiToUtf8(fProductName);
end;

function TCashVaucher.getjPrice: Variant;
begin
  Result := fPrice;
end;

function TCashVaucher.getjSourcePrice: Variant;
begin
  Result := fSourcePrice;
end;

function TCashVaucher.getPrice: Currency;
begin
  Result := fPrice;
end;

function TCashVaucher.getProductName: string;
begin
   Result := fProductName;
end;

function TCashVaucher.getSourcePrice: Currency;
begin
  Result := fSourcePrice;
end;

procedure TCashVaucher.setAmount(const Value: Currency);
begin
   fAmount := value;
end;

procedure TCashVaucher.setDiscount(const Value: Currency);
begin
   fDiscount := value;
end;

procedure TCashVaucher.setjAmount(const Value: Variant);
begin
   fAmount := Value;
end;

procedure TCashVaucher.setjDiscount(const Value: Variant);
begin
  fDiscount := Value;
end;

procedure TCashVaucher.setjPrice(const Value: Variant);
begin
  fPrice := Value;
end;

procedure TCashVaucher.setjProductName(const Value: UTF8String);
begin
  fProductName := Utf8ToAnsi(value);
end;

procedure TCashVaucher.setjSourcePrice(const Value: Variant);
begin
  fSourcePrice := Value;
end;

procedure TCashVaucher.setPrice(const Value: Currency);
begin
  fPrice := value;
end;

procedure TCashVaucher.setProductName(const Value: string);
begin
  fProductName := Value;
end;

procedure TCashVaucher.setSourcePrice(const Value: Currency);
begin
 fSourcePrice := Value;
end;

{ tDiscount }

function tDiscount.getjPrice: Variant;
begin
  Result := fjPrice;
end;

procedure tDiscount.setjPrice(const Value: VAriant);
begin
   fPrice := Value
end;

end.


