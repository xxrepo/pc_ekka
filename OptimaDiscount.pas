unit OptimaDiscount;

interface
uses
  Classes, SysUtils,
  DiscountRequest, JSONSerialize,JSonObjForNPH, JSonChekNPH;

const
  OPTIMA_TYPE_SKD = 9;

type

  CloseOptimaVoucherException = class(Exception);

  TOptimaDiscount = class
  private
    fToken            : string;
    fOnGetToken       : TNotifyEvent;
    fDiscountReq      : TDiscountRequest; // запрос на сервис
    fCloseChekReq     : TDiscountRequest; // запрос на закрытие чека
    FAddressID        : string;
    fUserID: Integer;
    fNeedRefresh : boolean;
    function InitDiscountReq : boolean;
    function getAddressIDCache: integer;
    procedure CreateTempTable_SkdLimit;
    procedure Fill_SkdLimit(aVoucherCheck : TVoucherChek);
    procedure UpdateSkd;
  protected
    function GetChekNumber    : string;
    function GetVouchertype   : Integer; //Тип чека (100 - новый; 200 - измененный; 500 - оплачен)
    function GetChekDate      : TDateTime;
    function GetOperationDate : TDateTime;
    function GetCheckNumber : integer;
    procedure ClearPositions;
  public
    OptimaUserLogin     :  string;
    OptimaUserPassword  :  string;
    OptimaCustomerCard  :  string;
    FCloseReady         :  Boolean;
    // aArtCode (string, optional): Код товара ,
    // lineID (integer, optional): Номер по порядку ,
    // series (string, optional): Серия ,
    // aQuantity  - Количество
    // aPrice - цена
    // CodeType  Тип кода товара (PRC - Проектный; APT - Аптека; MOR - Морион; OPT - Оптима;) ,
    procedure AddChekPosition(aVoucherRequest : TDiscountRequest;
                              aVoucherId,
                              aArtCode,
                              aArtName     :  string;
                              aLineId      :  Int64;
                              aSeries      :  string;
                              aQuantity    :  Integer;
                              aPrice       :  Currency;
                              aSourcePrice :  Currency;
                              aCodeType    :  string = 'APT');
    // делает запрос к сервису, получает дисконт (если он есть) проставляет в чеке дисконтную цену
    procedure SetDiscount;
    // делает отправку сообщения на  сервер о том, что чек оплачен
    procedure CloseChek;
    // візівается перед закроітием чека. для иницииализации отправки на Optima сообщение о закрітии чека
    function InitCloseChekReq : Boolean;
    // конструктор
    constructor Create;
    destructor Destroy; override;
    procedure Authorize;
    class procedure DropTempTable_SkdLimit;
    class function ArtCodeInOptima(ArtCode : integer) : boolean;
    // срабатівает при получении токена
    property OnGetToken : TNotifyEvent read FOnGetToken write FOnGetToken;
    property AddressID  : integer read getAddressIDCache;
    property USERID : Integer read fUserID write fUserID;
    property NeedRefresh : boolean read fNeedRefresh;
  end;

implementation
uses
  ShareU, DataModuleU, DB, ADODB, MainU,WinHttpRequest;
{ TOptimaDiscount }

{============================================
|  Добавляет товар  в запрос                 |
 ============================================}
procedure TOptimaDiscount.AddChekPosition(aVoucherRequest : TDiscountRequest;
                                          aVoucherId,             // aVoucherId
                                          aArtCode,               // aArtCode (string, optional): Код товара ,
                                          aArtName : string;      // Название товара
                                          aLineId: Int64;         // lineID (integer, optional): Номер по порядку ,
                                          aSeries: string;        // series (string, optional): Серия ,
                                          aQuantity: Integer;     // aQuantity  - Количество
                                          aPrice: Currency;       // aPrice - цена
                                          aSourcePrice: Currency; // aSourcePrice - цена до скидки
                                          aCodeType: string);     // CodeType  Тип кода товара (PRC - Проектный; APT - Аптека; MOR - Морион; OPT - Оптима;)
var
  oVoucher : TCashVaucher;
begin
  if not Assigned(aVoucherRequest) then
    Exit;
  //
  //TODO: проверить если уже есть код товара и серия в позиции, тогда удаляем его.
  //
  oVoucher := aVoucherRequest.ChekRequest.AddVoucher(TCashVaucher.Create(nil));
  if Assigned(oVoucher) then
  begin
    with oVoucher do
    begin
      CashVoucherID := aVoucherId;
      Code        :=  aArtCode;
      LineID      :=  aLineId;
      aCodeType   :=  'APT';
      ProductName :=  aArtName;
      Series      :=  aSeries;
      Quantity    :=  aQuantity;
      Price       :=  aPrice;
      SourcePrice :=  aSourcePrice;
      Amount      :=  aQuantity * aPrice;
    end;
  end;
end;

procedure TOptimaDiscount.Authorize;
var
  sobj : TAuthRequest;
begin
   sObj :=  TAuthRequest.Create(OptimaUserLogin, OptimaUserPassword);
   try
     try
       if sObj.SendRequest then
       begin
         fToken := sObj.getTokenStr;
         if Assigned(FOnGetToken) then
       end;
     finally
       sObj.Free;
     end;
   except on Exception do

   end;
end;

constructor TOptimaDiscount.Create;
begin
  OptimaCustomerCard := '9939000000011'; // карта клиента
  fToken := '';
  FCloseReady := False;
  OptimaUserLogin := GetValueSC(DM.QREx,'OptimaUserLogin'); //'user';
  OptimaUserPassword := GetValueSC(DM.QREx,'OptimaUserPassword'); //'12345';
  FAddressID := GetValueSC(DM.QREx,'OptimaAddressID');
  Authorize;
end;

function TOptimaDiscount.InitDiscountReq : boolean;
begin
  try
    if Assigned(fDiscountReq) then
       FreeAndNil(fDiscountReq);
    if (fToken <> '' ) then
    begin
      fDiscountReq := TDiscountRequest.Create(fToken,'CashVouchers',tmPOST);
      with fDiscountReq.ChekRequest do
      begin
        Address_ID := AddressID;   // ИД аптеки зарегистрированной в сиситеме
        Number := IntToStr(GetCheckNumber);       // Номер чека
        VaucherType := GetVouchertype;  // Тип чека 100 - новій
        CardNumber := OptimaCustomerCard; // номер карті пациента
        Confirmed := False;               // Это поле не нужно заполнять, для отправки запроса.
        SalesDate := GetChekDate;// Дата Чека
        OperationDate := GetOperationDate;   // Дата действия   - Now
      end;
    end;
  finally
    Result := Assigned(fDiscountReq);
  end;
end;

function TOptimaDiscount.GetChekDate: TDateTime;
begin
  Result := Now;
end;

function TOptimaDiscount.GetChekNumber: string;
begin
  Result := '1';
end;

function TOptimaDiscount.GetOperationDate: TDateTime;
begin
  Result := Now;
end;

function TOptimaDiscount.GetVouchertype: Integer;
begin
//Тип чека (100 - новый; 200 - измененный; 500 - оплачен) ,
  Result  := 100;
end;

function TOptimaDiscount.GetCheckNumber: integer;
begin
  result := 1;
end;

function TOptimaDiscount.getAddressIDCache: integer;
begin
   Result := StrToIntDef(FAddressID,0);
end;

procedure TOptimaDiscount.SetDiscount;
var
  i : integer;
begin
  FNeedRefresh := false;
  FCloseReady := False;
  i := 1;
  if not InitDiscountReq then
    Exit;
  DropTempTable_SkdLimit;
  ClearPositions;
  with TADOQuery.Create(nil) do
  try
    try
      Close;
      Connection:=DM.ADOCo;
      SQL.Clear;
      SQL.Text := ' SELECT  ROW_NUMBER() over(ORDER BY c.ART_CODE) AS LineID, '+
                  ' c.ART_CODE AS ARTCODE, '+
                  ' c.names AS ARTNAME, '+
                  ' FLOOR((SUM(c.KOL)*1.0)/(SELECT TOP 1 s.Upak FROM sprtov s WHERE s.art_code = c.art_code))  AS QUANTITY, '+
                  ' c.cena * (SELECT TOP 1 s.Upak FROM sprtov s WHERE s.art_code = c.art_code) AS SOURCEPRICE, '+
                  ' MIN(sii.NumSeriya) as [SERIYA] '+
                  ' FROM Chek c (nolock) '+
                  ' JOIN OptimaArtCodes b (nolock) on c.art_code=b.artcode '+
                  ' JOIN SprTov spt on spt.ART_CODE = c.ART_CODE and spt.KOD_NAME = c.KOD_NAME '+
                  ' LEFT JOIN SERII sii on spt.id_part8 = sii.ID_PART8 '+
                  ' WHERE c.compname = HOST_NAME() '+
                  ' AND c.id_user = :UserID '+
                  ' GROUP BY c.art_code,c.names,c.cena'+
                  ' HAVING SUM(c.KOL) >= (SELECT TOP 1 s.Upak FROM sprtov s WHERE s.art_code = c.art_code) '+
                  ' ORDER BY c.ART_CODE ';

      Parameters.Clear;
      Parameters.CreateParameter('UserID',ftInteger, pdInput, 10, fUserID);
      Open;
      First;
      // Добавление позиций в чеке в запрос на дисконт
      While not Eof do
      begin
        AddChekPosition( fDiscountReq,
                         '',
                         FieldByName('ARTCODE').AsString,
                         FieldByName('ARTNAME').AsString,
                         FieldByName('LINEID').Value,
                         FieldByName('SERIYA').AsString,
                         FieldByName('QUANTITY').AsInteger,
                         FieldByName('SOURCEPRICE').AsCurrency,
                         FieldByName('SOURCEPRICE').AsCurrency);
        Inc(i);
        Next;
      end;
      {Если пришел ответ, тогда заполняем временную таблицу с дисконтами  }
      First;
      if not Eof and
         fDiscountReq.SendRequest then
      begin
         if Assigned(fDiscountReq.ChekResponse) then
         begin
           if fDiscountReq.ChekResponse.Description <> '' then
            begin
              MainF.MessBox(fDiscountReq.ChekResponse.Description);
            end;
           Fill_SkdLimit(fDiscountReq.ChekResponse);
           UpdateSkd;
         end;
      end;
    except on Exception do
      begin

      end;
    end;
  finally
    Free;
  end;
end;

procedure TOptimaDiscount.ClearPositions;
begin
  fDiscountReq.ChekRequest.ClearVouchers;
end;

procedure TOptimaDiscount.Fill_SkdLimit(aVoucherCheck: TVoucherChek);
var
  i : integer;
  oVoucher : TCashVaucher;
  Q : TADOQuery;
  strQuery : String;
begin
  CreateTempTable_SkdLimit;
  for i := Low(aVoucherCheck.CashVaucherItems) to High(aVoucherCheck.CashVaucherItems) do
  begin
    oVoucher := aVoucherCheck.CashVaucherItems[i];
    if not Assigned(oVoucher) then
       continue;
    if oVoucher.DiscountAmount = 0 then
      continue;
    Q :=  TADOQuery.Create(nil);
    with Q do
    try
      Close;
      Connection:=DM.ADOCo;
      SQL.Clear;
      SQL.Add(' insert into #Skd_Optima(VoucherID, CardNum, ArtCode, Names, SourcePrice, Price, Quantity) ');
      strQuery := Format(' VALUES(''%S'',''%S'', %S, ''%S'', %S, %S, %S)',
                        [oVoucher.CashVoucherID,
                        OptimaCustomerCard,
                        oVoucher.Code,
                        oVoucher.ProductName,
                        CurrToStr(oVoucher.SourcePrice),
                        CurrToStr(oVoucher.price),
                        IntToStr(oVoucher.Quantity)]);
      SQL.ADD(strQuery);
     ExecSQL;
     FNeedRefresh := True;
    finally
      Free;
    end;
  end;
end;

procedure TOptimaDiscount.CreateTempTable_SkdLimit;
var
   Q : TADOQuery;
begin
  Q :=  TADOQuery.Create(nil);
  with Q do
  try
    Close;
    Connection:=DM.ADOCo;
    SQL.Clear;
    SQL.Text := ' if object_id(''tempdb..#Skd_Optima'')  is null  '+
                ' create table #Skd_Optima(  '+
                ' VoucherID VARCHAR(36),  '+
                ' CardNum varchar(13) not null, '+
                ' ArtCode int NOT NULL, '+
                ' Names NVARCHAR(200),  '+
                ' SourcePrice MONEY, '+
                ' Price [numeric](8, 2), '+
                ' Quantity INT) ';
    ExecSQL;

  finally
    Free;
  end;

end;

class procedure TOptimaDiscount.DropTempTable_SkdLimit;
var
   Q : TADOQuery;
begin
  Q :=  TADOQuery.Create(nil);
  with Q do
  try
    Close;
    Connection:=DM.ADOCo;
    SQL.Clear;
    SQL.Text := ' if object_id(''tempdb..#Skd_Optima'')  is not null '+
                ' drop table #Skd_Optima  ';

    ExecSQL;
  finally
    Free;
  end;
end;

destructor TOptimaDiscount.Destroy;
begin
  DropTempTable_SkdLimit;

  if Assigned(fDiscountReq) then
    FreeAndNil(fDiscountReq);

  if Assigned(fCloseChekReq) then
    FreeAndNil(fCloseChekReq);
  inherited;
end;


procedure TOptimaDiscount.UpdateSkd;
begin
  DM.spY_CalcSKD.Close;
  DM.spY_CalcSKD.Parameters.ParamValues['@pid_user']:= UserID;
  DM.spY_CalcSKD.Parameters.ParamValues['@t_s']:= OPTIMA_TYPE_SKD;
  DM.spY_CalcSKD.Open;
  DM.spY_CalcSKD.Close;
end;

class function TOptimaDiscount.ArtCodeInOptima(ArtCode: integer): boolean;
var
   Q : TADOQuery;
begin
  Q :=  TADOQuery.Create(nil);
  Result := False;
  with Q do
  try
    Close;
    Connection:=DM.ADOCo;
    SQL.Clear;
    SQL.Text := ' select top 1 * from OptimaArtCodes WHERE artcode = ' + IntToStr(artCode);
    Open;
    First;
    Result := not EOF;
  finally
    Free;
  end;
end;

procedure TOptimaDiscount.CloseChek;
var
  i : integer;
begin
  FNeedRefresh := false;
  i := 0;
  if not FCloseReady then
    Exit;

  while ((i < 3) and not fCloseChekReq.SendRequest) do
  begin
    Sleep(300);
    Inc(i);
  end;
  if i > 2 then
  begin
    raise CloseOptimaVoucherException.Create('Ошибка отправки реализации в сервис Виста.');
  end;
end;

function TOptimaDiscount.InitCloseChekReq: Boolean;
begin
  Result := False;
  if not Assigned(fDiscountReq) OR
    ((fToken) = '') then
    Exit;
  FCloseReady := False;
  fCloseChekReq := TDiscountRequest.Create(fToken,'CashVouchers'+'/'+fDiscountReq.ChekResponse.ID,tmPUT);
  fCloseChekReq.ChekRequest.ID :=  fDiscountReq.ChekResponse.ID;
  fCloseChekReq.ChekRequest.Address_ID := fDiscountReq.ChekResponse.Address_ID;
  fCloseChekReq.ChekRequest.Number := fDiscountReq.ChekResponse.Number;
  fCloseChekReq.ChekRequest.VaucherType := 500; // Тип оплаченного чека
  fCloseChekReq.ChekRequest.CardNumber := fDiscountReq.ChekResponse.CardNumber;
  fCloseChekReq.ChekRequest.SalesDate := fDiscountReq.ChekResponse.SalesDate;
  fCloseChekReq.ChekRequest.OperationDate := Now;

  with TADOQuery.Create(nil) do
  try
    try
      Close;
      Connection:=DM.ADOCo;
      SQL.Clear;
      SQL.Text := ' SELECT  ROW_NUMBER() over(ORDER BY c.ART_CODE) AS LineID, '+
                  ' c.ART_CODE AS ARTCODE, '+
                  ' c.names AS ARTNAME, '+
                  ' FLOOR((SUM(c.KOL)*1.0)/(SELECT TOP 1 s.Upak FROM sprtov s WHERE s.art_code = c.art_code))  AS QUANTITY, '+
                  ' c.cena * (SELECT TOP 1 s.Upak FROM sprtov s WHERE s.art_code = c.art_code) AS SOURCEPRICE, '+
                  ' MIN(sii.NumSeriya) as [SERIYA], '+
                  ' c.OptimaPrice AS OPTIMAPRICE, '+
                  ' c.OptimaChekId AS OPTIMACHEKID '+
                  ' FROM Chek c (nolock) '+
                  ' JOIN OptimaArtCodes b (nolock) on c.art_code=b.artcode '+
                  ' JOIN SprTov spt on spt.ART_CODE = c.ART_CODE and spt.KOD_NAME = c.KOD_NAME '+
                  ' LEFT JOIN SERII sii on spt.id_part8 = sii.ID_PART8 '+
                  ' WHERE c.compname = HOST_NAME() '+
                  ' AND c.id_user = :UserID '+
                  ' GROUP BY c.art_code,c.names,c.cena,c.OptimaChekId, c.OptimaPrice'+
                  ' HAVING SUM(c.KOL) >= (SELECT TOP 1 s.Upak FROM sprtov s WHERE s.art_code = c.art_code) '+
                  ' ORDER BY c.ART_CODE ';

      Parameters.Clear;
      Parameters.CreateParameter('UserID',ftInteger, pdInput, 10, fUserID);
      Open;
      First;
      // Добавление позиций в чеке в запрос на дисконт
      While not Eof do
      begin
        AddChekPosition( fCloseChekReq,
                         FieldByName('OPTIMACHEKID').AsString,
                         FieldByName('ARTCODE').AsString,
                         FieldByName('ARTNAME').AsString,
                         FieldByName('LINEID').Value,
                         FieldByName('SERIYA').AsString,
                         FieldByName('QUANTITY').AsInteger,
                         FieldByName('OPTIMAPRICE').AsCurrency,
                         FieldByName('SOURCEPRICE').AsCurrency);
        Next;
      end;
      {Если пришел ответ, тогда заполняем временную таблицу с дисконтами  }
      First;
    except
    end;
  finally
     Free;
     FCloseReady := Length(fCloseChekReq.ChekRequest.CashVaucherItems) > 0;
  end

end;

end.
