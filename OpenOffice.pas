unit OpenOffice;

interface

uses Windows, Messages, SysUtils, Variants, Classes,ComObj;

type
  TOpenOffice = class
      function Connect: boolean;
      procedure Disconnect;
      function CreateDocument: boolean;
      function OpenDocument(const aFileUrl:string): boolean;
      procedure SaveDocument(const aFileUrl:string);
      procedure InsertTextToCell(Col,Row:Integer; const aText:String);
      procedure CloseDocument;
   private
      StarOffice: Variant;
      Document: Variant;
      function MakePropertyValue(PropName, PropValue:variant):variant;
      function FileNameToURL(FileName:string): string;
   end;



implementation

function TOpenOffice.Connect: boolean;
begin
   if VarIsEmpty(StarOffice) then
      StarOffice := CreateOleObject('com.sun.star.ServiceManager');
   Result := not (VarIsEmpty(StarOffice) or VarIsNull(StarOffice));
end;

procedure TOpenOffice.Disconnect;
 begin
  StarOffice := Unassigned;
 end;

procedure TOpenOffice.CloseDocument;
 begin
  Document.Close(True);
  Document:=Unassigned;
 end;

function TOpenOffice.CreateDocument:Boolean;
var StarDesktop:Variant;
    VariantArr: variant;
 begin
  StarDesktop:=StarOffice.createInstance('com.sun.star.frame.Desktop');
  VariantArr:=VarArrayCreate([0, 0], varVariant);
  VariantArr[0]:=MakePropertyValue('Hidden', True);

  Document:=StarDesktop.LoadComponentFromURL('private:factory/scalc', '_blank', 0,VariantArr);
  Result:=not (VarIsEmpty(Document) or VarIsNull(Document));
 end;

function TOpenOffice.MakePropertyValue(PropName, PropValue:variant):variant;
var Struct: variant;
 begin
  Struct:=StarOffice.Bridge_GetStruct('com.sun.star.beans.PropertyValue');
  Struct.Name:=PropName;
  Struct.Value:=PropValue;
  Result:=Struct;
 end;

function TOpenOffice.OpenDocument(const aFileUrl:string): boolean;
var StarDesktop:Variant;
    VariantArr:variant;
 begin
  StarDesktop:=StarOffice.CreateInstance('com.sun.star.frame.Desktop');
  VariantArr:=VarArrayCreate([0,0],varVariant);
  VariantArr[0]:= MakePropertyValue('FilterName','MS Word 97');
  Document:=StarDesktop.LoadComponentFromURL(FileNameToURL(aFileUrl),'_blank',0,VariantArr);
  Result:= not (VarIsEmpty(Document) or VarIsNull(Document));
 end;

function TOpenOffice.FileNameToURL(FileName: string): string;
begin
  result:= '';
  if LowerCase(copy(FileName,1,8))<>'file:///' then
    result:= 'file:///';
  result:= result + StringReplace(FileName, '\', '/', [rfReplaceAll, rfIgnoreCase]);
end;

procedure TOpenOffice.SaveDocument(const aFileUrl:string);
var StarDesktop: Variant;
    VariantArr: variant;

 begin
  StarDesktop := StarOffice.createInstance('com.sun.star.frame.Desktop');
  VariantArr := VarArrayCreate([0, 0], varVariant);
  VariantArr[0] := MakePropertyValue('FilterName', 'MS Excel 97');
//VariantArr[0] := MakePropertyValue('FilterName', 'Rich Text Format'); anee eiio-oi iiiaaiaeony ;-)
  Document.StoreToURL(FileNameToURL(aFileUrl), VariantArr);
 end;

procedure TOpenOffice.InsertTextToCell(Col,Row:Integer; const aText:String);
var Sheets,Sheet, Cell:Variant;
 begin
  Sheets:=Document.GetSheets;
  Sheet:=Sheets.getByIndex(0);
  Cell:=Sheet.getCellByPosition(Col,Row);
  Cell.setString(aText);
{
  oText := Document.GetText;
  oCursor := oText.CreateTextCursor;
  oCursor.SetPropertyValue('CharColor', 255);
  oCursor.SetPropertyValue('CharShadowed', True);
  oText.InsertString(oCursor, aText, false);
  oText.InsertControlCharacter(oCursor, 0, false);
  Document.Sheets[0].CellByName['B1'].AsText:=aText;
 }

end;



end.
