unit ShowTerapU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ExtCtrls, Grids, DBGrids, ComCtrls;

type
  TShowTerapF = class(TForm)
    Panel1:TPanel;
    lbName:TLabel;
    Label1: TLabel;
    ScrollBox1: TScrollBox;
    GroupBox1: TGroupBox;
    dbgATC: TDBGrid;
    procedure FormCreate(Sender:TObject);
    procedure dbgATCDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure dbgATCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgATCDblClick(Sender: TObject);

  private

    aLB:Array of TLabel;
    FIsFind:Boolean;

    procedure ClearList;
    procedure MarkTerap(ID,ID_Gr:Integer);
    procedure Label1MouseEnter(Sender:TObject);
    procedure Label1MouseLeave(Sender:TObject);
    procedure Label1Click(Sender:TObject);

  public

    procedure MakeList;
    procedure ReOpen(ID_Gr:Integer=-1);

    property IsFind:Boolean read FIsFind write FIsFind;

  end;

var ShowTerapF:TShowTerapF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TShowTerapF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  IsFind:=False;
 end;

procedure TShowTerapF.Label1MouseEnter(Sender:TObject);
var i:Integer;
    FS:TFontStyles;
 begin
  if Sender=nil then Exit;
  Label1MouseLeave(Sender);
  FS:=TLabel(Sender).Font.Style;
  Include(FS,fsUnderLine);
  TLabel(Sender).Font.Style:=FS;
 end;

procedure TShowTerapF.Label1MouseLeave(Sender:TObject);
var i:Integer;
    FS:TFontStyles;
 begin
  for i:=Low(aLB) to High(aLB) do
   begin
    FS:=aLB[i].Font.Style;
    Exclude(FS,fsUnderLine);
    aLB[i].Font.Style:=FS;
   end;
 end;

procedure TShowTerapF.Label1Click(Sender:TObject);
 begin
  if Sender=nil then Exit;
  ReOpen(StrToInt(TLabel(Sender).Hint));
 end;

procedure TShowTerapF.ClearList;
var i:Integer;
 begin
  for i:=Low(aLB) to High(aLB) do aLB[i].Free;
  SetLength(aLB,0)
 end;

procedure TShowTerapF.MakeList;
var dy,CA,i:Integer;
 begin
  ClearList;
  DM.Qr.Close;
  DM.Qr.SQL.Clear;
  DM.Qr.SQL.Add('select * ');
  DM.Qr.SQL.Add('from Inform..DhTerap ');
  DM.Qr.SQL.Add('where id in (select id from Inform..DtTerap where art_code='+IntToStr(lbName.Tag)+') order by id_gr ');
  DM.Qr.Open;
  ScrollBox1.VertScrollBar.Position:=0;
  ScrollBox1.HorzScrollBar.Position:=0;
  dy:=18;
  for i:=1 to DM.Qr.RecordCount do
   begin
    if i=1 then DM.Qr.First else DM.Qr.Next;
    CA:=High(aLB)+1; SetLength(aLB,CA+1);
    aLB[CA]:=TLabel.Create(Self);
    aLB[CA].Parent:=ScrollBox1;
    aLB[CA].Font.Size:=10;
    aLB[CA].Caption:=DM.Qr.FieldByName('Descr').AsString;
    aLB[CA].Left:=10;
    aLB[CA].Top:=5+dy*(i-1);
    aLB[CA].Tag:=DM.Qr.FieldByName('id').AsInteger;
    aLB[CA].Hint:=DM.Qr.FieldByName('id_gr').AsString;
    aLB[CA].OnMouseEnter:=Label1MouseEnter;
    aLB[CA].OnMouseLeave:=Label1MouseLeave;
    aLB[CA].OnClick:=Label1Click;
    if DM.Qr.FieldByName('id_gr').AsInteger=0 then
     begin
      GroupBox1.Caption:=' '+DM.Qr.FieldByName('Descr').AsString+' ';
      aLB[CA].Font.Color:=clBlue;
      aLB[CA].Font.Style:=[fsBold];
     end else aLB[CA].Font.Color:=clMaroon;
   end;
  ScrollBox1.Height:=(CA+1)*dy+10;
  GroupBox1.Top:=ScrollBox1.Top+ScrollBox1.Height+4;
  GroupBox1.Height:=ClientHeight-Panel1.Height-ScrollBox1.Height-8;
 end;

procedure TShowTerapF.MarkTerap(ID,ID_Gr:Integer);
var i:Integer;
 begin
  GroupBox1.Caption:='';
  for i:=Low(aLB) to High(aLB) do
   if (aLB[i].Tag=ID) and (aLB[i].Hint=IntToStr(ID_Gr)) then
    begin
     GroupBox1.Caption:=' '+aLB[i].Caption+' ';
     aLB[i].Font.Color:=clBlue;
     aLB[i].Font.Style:=[fsBold];
    end else begin
              aLB[i].Font.Color:=clMaroon;
              aLB[i].Font.Style:=[];
             end;
 end;

procedure TShowTerapF.ReOpen(ID_Gr:Integer=-1);
 begin
  try
   DM.qrTerap.Close;
   DM.qrTerap.SQL.Clear;
   DM.qrTerap.SQL.Add('select a.id,a.id_gr,c.type_tov,c.Art_Code,c.Names,Sum(c.ostat) as kol,Max(c.cena) as cena        ');
   DM.qrTerap.SQL.Add('from Inform..DtTerap a, SprTov c                                         ');
   DM.qrTerap.SQL.Add('where c.ostat>0 and a.art_code=c.art_code and a.art_code<>'+IntToStr(lbName.Tag)+' and ');
   DM.qrTerap.SQL.Add('      exists (select b.id,b.id_gr                                        ');
   DM.qrTerap.SQL.Add('              from Inform..DtTerap b                                     ');
   if ID_Gr<0 then
    DM.qrTerap.SQL.Add('              where a.id=b.id and a.id_gr=b.id_gr and b.art_code='+IntToStr(lbName.Tag)+') ')
   else
    DM.qrTerap.SQL.Add('              where a.id=b.id and a.id_gr='+IntToStr(ID_Gr)+' and b.art_code='+IntToStr(lbName.Tag)+') ');

   DM.qrTerap.SQL.Add('group by a.id,a.id_gr,c.type_tov,c.Art_Code,c.Names                              ');
   DM.qrTerap.SQL.Add('order by c.Names ');
   DM.qrTerap.Open;
   if ID_Gr<0 then
    MarkTerap(DM.qrTerap.FieldByName('ID').AsInteger,DM.qrTerap.FieldByName('id_gr').AsInteger)
   else
    MarkTerap(DM.qrTerap.FieldByName('ID').AsInteger,ID_Gr);
  except
   MainF.MessBox('Ошибка доступа к справочнику "Терапевтическая замена"');
  end;
 end;

procedure TShowTerapF.dbgATCDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if db.DataSource.DataSet.FieldByName('KOL').AsInteger<=0 then
   begin
    db.Canvas.Brush.Color:=clRed;
    db.Canvas.Font.Color:=clWhite;
   end;
  if gdSelected in State then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure TShowTerapF.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  ClearList;
 end;

procedure TShowTerapF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

procedure TShowTerapF.dbgATCKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key=VK_RETURN then dbgATCDblClick(Sender);
 end;

procedure TShowTerapF.dbgATCDblClick(Sender:TObject);
 begin
  if DM.qrTerap.IsEmpty then Exit;
  IsFind:=True;
  Close;
 end;

end.
