unit JSONSerialize;

interface
uses
  Classes, Contnrs, TypInfo, uJSONForOptima, dialogs;

const
  JSON_PREFIX = 'JSON_';

type
  TJSONSerializer = class;

  TJSONSerializable = class(TComponent)
  private
    fJSONProps: TObjectList;
    fLoading : Boolean;
    oSerialiser : TJSONSerializer;
    function GetJSONProps: TObjectList;
  protected
    fJSonObj : TJSONObject;
    property JSONProps: TObjectList read GetJSONProps;
    function setISOtoDateTime(strDT: string) : TDateTime;
    function setDateTimeToStrISO(aDT : TDateTime) : string;
  public
    procedure LoadJSONToObject(aJSonString : string); virtual;
    function ObjectToJsonString : string; virtual;
    function ObjectToJsonObject : TJSONObject; virtual;
    constructor Create(aOwner : TComponent); reintroduce;
    destructor Destroy; override;
  end;

  TJSONSerializer = class
    FLoading : Boolean;
  public
    AObject : TJSONSerializable;
    procedure LoadJSToObject(aJSONString : String);
    function GetJSONFromObject : TJSONObject;
    constructor Create(aObject : TJSONSerializable);
    destructor Destroy;override;
  end;

implementation
uses
  SysUtils, XSBuiltIns, Variants;

constructor TJSONSerializable.Create;
begin
  inherited Create(aOwner);
  oSerialiser := TJSONSerializer.Create(Self);
end;

destructor TJSONSerializable.Destroy;
begin
  if Assigned(oSerialiser) then
  oSerialiser.Free;
  inherited;
end;

function TJSONSerializable.GetJSONProps: TObjectList;
begin
  if not Assigned(fJSONProps) then
    fJSONProps := TObjectList.Create;
  Result := fJSONProps;
end;


procedure TJSONSerializable.LoadJSONToObject(aJSonString: string);
begin
  if Assigned(oSerialiser) then
    oSerialiser.LoadJSToObject(aJSonString);
end;

function TJSONSerializable.ObjectToJsonObject: TJSONObject;
var
  oJson : TJSONObject;
begin
  Result := nil;
  if Assigned(oSerialiser) then
    oJson := oSerialiser.GetJSONFromObject();
  if oJson <> nil then
    Result  := oJson;
  oJson := nil;
end;

function TJSONSerializable.ObjectToJSONString: string;
begin
  Result := '';
  if Assigned(oSerialiser) then
    fJSonObj := oSerialiser.GetJSONFromObject();
  if fJSonObj <> nil then
    Result  := fJSonObj.toString;
end;

{ TJSONSerializer }

constructor TJSONSerializer.Create(aObject : TJSONSerializable);
begin
  Self.aObject := aObject;
end;

destructor TJSONSerializer.Destroy;
begin

  inherited;
end;

function TJSONSerializer.GetJSONFromObject: TJSONObject;
var
  oJSon : TJSONObject;
  i: Integer;
  _PropList: PPropList;
  _PropInfo : PPropInfo;
  _Count: Integer;
  _PropName : string;
  _varValue: Variant;
  _strValue : string;
begin
  if not Assigned(aObject) then
    Exit;

  oJSon :=  TJSONObject.Create;
  Result := nil;
  if not Assigned(oJSon) or (oJSon = nil) then
    Exit;
  _PropList := nil;
  FLoading := True;;
  try
    _Count := GetPropList(aObject, _PropList);
    try
      for i := 0 to _Count - 1 do
      begin
        if (Copy(_PropList^[i].Name,0, Length(JSON_PREFIX)) = JSON_PREFIX) then
        begin
          _PropName := Copy(_PropList^[i].Name,Length(JSON_PREFIX)+1, Length(_PropList^[i].Name)-Length(JSON_PREFIX)+1);
           _PropInfo := _PropList^[i];
          case _PropList^[i]^.PropType^.Kind of
            tkLString :
              begin
                _strValue := GetStrProp(aObject,_PropInfo);
                if (_strValue <> '')then
                  oJSon.put(_PropName, _strValue);
              end;
            tkInt64,
            tkInteger:
              begin
                oJSon.put(_PropName, GetOrdProp(AObject,_Propinfo));
              end;
            tkVariant:
              begin
                _varValue := GetVariantProp(aObject,_Propinfo);
                if VarType(_varValue) = varBoolean then
                  oJson.Put(_PropName, Boolean(_varValue))
                else if VarType(_varValue) = varCurrency then
                  oJson.Put(_PropName, double(_varValue));

              end;
          end;
        end;
      end;
    finally
      FreeMem(_PropList);
    end;
    Result := oJSon;
  finally
    FLoading := False;
  end;

end;

procedure TJSONSerializer.LoadJSToObject(aJSONString : String);
var
  i: Integer;
  _PropList: PPropList;
  _PropInfo : PPropInfo;
  _Count: Integer;
  _PropName : string;
  iValue : Integer;
  dValue : Double;
  sValue : string;
  oJSon : TJSONObject;
  bValue : Boolean;
  _varValue : Variant;
begin
  if not Assigned(aObject) then
    Exit;

  oJSon :=  TJSONObject.create(aJSONString);
  if not Assigned(oJSon) or (oJSon = nil) then
    Exit;

  _PropList := nil;
  FLoading := True;;
  try
    _Count := GetPropList(aObject, _PropList);
    try
      for i := 0 to _Count - 1 do
      begin
        if (Copy(_PropList^[i].Name,0, Length(JSON_PREFIX)) = JSON_PREFIX) then
        begin
          _PropName := Copy(_PropList^[i].Name,Length(JSON_PREFIX)+1, Length(_PropList^[i].Name)-Length(JSON_PREFIX)+1);
          _PropInfo := _PropList^[i];
//          if Integer(oJSon.FieldAddress(_PropName)) = 0 then
//            Continue;
          case _PropList^[i]^.PropType^.Kind of
            tkLString :
              begin
                try
                  sValue := oJSon.getString(_PropName);
                  SetStrProp(aObject, _PropInfo, sValue);
                except
                  on NoSuchElementException do
                    Continue;
                end;
              end;
            tkInt64:
              begin
                try
                  iValue := oJSon.getInt64(_PropName);
                  SetOrdProp(aObject, _PropInfo, iValue);
                except
                  on NoSuchElementException do
                    Continue;
                end;
              end;

            tkInteger :
              begin
                try
                  iValue := oJSon.getInt(_PropName);
                  SetOrdProp(aObject, _PropInfo, iValue);
                except
                  on NoSuchElementException do
                    Continue;
                end;
              end;
            tkFloat:
              begin
                try
                  dValue := oJson.getDouble(_PropName);
                  SetFloatProp(aObject, _PropInfo, dValue);
                except
                  on NoSuchElementException do
                    Continue;
                end;
              end;
            tkVariant:
              begin
                try
                  if (oJSon.get(_PropName) is _Boolean) then
                  begin
                    bValue := oJSon.getBoolean(_PropName);
                    if (VarType(bValue) = varBoolean) then
                    SetVariantProp(aObject, _PropInfo, bValue);
                  end;
                  _varValue := GetVariantProp(aObject,_Propinfo);
                  if VarType(_varValue) = varCurrency then
                  begin
                    _varValue := oJSon.getDouble(_PropName);
                    SetVariantProp(aObject, _PropInfo, _varValue);
                  end;
                except
                  on NoSuchElementException do
                    Continue;
                end;
              end;
            tkClass:
              begin

              end;
          end;
        end;
      end;
    finally
      FreeMem(_PropList);
    end;
  finally
    FLoading := False;
  end;
end;
function TJSONSerializable.setDateTimeToStrISO(aDT: TDateTime): string;
begin
  Result := DateTimeToXMLTime(aDT);
end;

function TJSONSerializable.setISOtoDateTime(strDT: string) : TDateTime;
var
  oStrDateTime : WideString;
begin
  oStrDateTime := strDT;
  Result := XMLTimeToDateTime(oStrDateTime);
end;
end.
