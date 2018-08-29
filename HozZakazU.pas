unit HozZakazU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB;

type
  THozZakazF = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label4: TLabel;
    dtZakaz: TDateTimePicker;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;

    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);

  private
    procedure ShowHZakaz;

  public

  end;

var HozZakazF:THozZakazF;

implementation

uses DataModuleU, MainU;

{$R *.dfm}

procedure THozZakazF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  dtZakaz.Date:=Date;
  ShowHZakaz;
 end;

procedure THozZakazF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure THozZakazF.ShowHZakaz;
var ID:Integer;
 begin
  try
   ID:=-1;
   if DM.qrHozZak.Active then ID:=DM.qrHozZak.FieldByName('ID').AsInteger;
   DM.qrHozZak.Close;
   DM.qrHozZak.SQL.Clear;
   DM.qrHozZak.SQL.Add('select b.id,a.descr,a.ed,b.kol');
   DM.qrHozZak.SQL.Add('from SprHozTov a, HozZakaz b');
   DM.qrHozZak.SQL.Add('where a.code=b.code and date_zakaz='''+FormatDateTime('yyyy-mm-dd',dtZakaz.Date)+''' order by 2');
//   DM.qrHozZak.SQL.SaveToFile('C:\HZak.txt');
   DM.qrHozZak.Open;
   DM.qrHozZak.Locate('ID',ID,[]);
  except
   on E:Exception do MainF.MessBox('Ошибка открытия хоззаявки: '+E.Message);
  end;
 end;

procedure THozZakazF.BitBtn3Click(Sender:TObject);
 begin
  ShowHZakaz;
 end;

procedure THozZakazF.BitBtn4Click(Sender:TObject);
 begin
  DM.Qr.Close;
  DM.Qr.SQL.Text:='select IsNull(Max(date_zakaz),convert(datetime,convert(varchar,getdate(),23))) as DZ from HozZakaz';
  DM.Qr.Open;
  dtZakaz.Date:=DM.Qr.FieldByName('DZ').AsDateTime;
  ShowHZakaz;
 end;

procedure THozZakazF.BitBtn1Click(Sender: TObject);
 begin

  if dtZakaz.Date<>StrToDate(DateToStr(Date)) then
   begin
    MainF.MessBox('Хоззаявку можно формировать только за сегодняшнее число!');
    Exit;
   end;

  try

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select top 1 * from HozZakaz where kol>0 and date_zakaz='''+FormatDateTime('yyyy-mm-dd',dtZakaz.Date)+'''';
   DM.Qr.Open;

   if DM.Qr.IsEmpty=False then
    if MainF.MessBox('За сегодня хоззаявка уже сформирована. Перерасчитать ее?',52)<>ID_YES then Exit;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('delete from HozZakaz where date_zakaz=convert(varchar,getdate(),23)');
   DM.Qr.SQL.Add('insert into HozZakaz(code,date_zakaz,kol)   ');
   DM.Qr.SQL.Add('select code,convert(varchar,getdate(),23),0 ');
   DM.Qr.SQL.Add('from SprHozTov                              ');
   DM.Qr.ExecSQL;

   ShowHZakaz;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования хоззаявки: '+E.Message);
  end;
 end;

procedure THozZakazF.DBGrid1DrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  if db.DataSource.DataSet.FieldByName('Kol').AsInteger>0 then
   begin
    db.Canvas.Font.Color:=clWhite;
    db.Canvas.Brush.Color:=clGreen;
   end;

  if gdSelected in State then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure THozZakazF.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key=VK_RETURN then
   if DM.qrHozZak.State in [dsEdit] then DM.qrHozZak.Post;
 end;

procedure THozZakazF.DBGrid1KeyPress(Sender: TObject; var Key: Char);
 begin
  if Key=',' then Key:='.';
 end;

end.
