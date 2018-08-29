unit SpisUserU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids;

type
  TSpisUserF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    tmWait: TTimer;
    tmFlash: TTimer;
    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
    procedure DBGrid1DblClick(Sender:TObject);
    procedure DBGrid1DrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
    procedure tmWaitTimer(Sender:TObject);
    procedure tmFlashTimer(Sender: TObject);

  private

    FFlash:Boolean;
    FFlag:Integer;

    procedure ShowSpisUser;

  public

    property Flag:Integer read FFlag;

  end;

var SpisUserF:TSpisUserF;

implementation

uses MainU,DataModuleU;

{$R *.dfm}

procedure TSpisUserF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  FFlag:=0;
  ShowSpisUser;
  FFlash:=False;
 end;

procedure TSpisUserF.ShowSpisUser;
var ID:Integer;
 begin
  try
   ID:=-1;
   if DM.qrSpisUser.Active then ID:=DM.qrSpisUser.FieldByName('id').AsInteger;
   DM.qrSpisUser.Close;
   DM.qrSpisUser.SQL.Clear;
   DM.qrSpisUser.SQL.Add('select * ');
   DM.qrSpisUser.SQL.Add('from SprUser b ');
   DM.qrSpisUser.SQL.Add('where id_type>100 and id_type<=200 and');
   DM.qrSpisUser.SQL.Add('      id<>'+IntToStr(Prm.UserID) );
   DM.qrSpisUser.SQL.Add('');
   DM.qrSpisUser.SQL.Add('');
   DM.qrSpisUser.SQL.Add('order by users');
   DM.qrSpisUser.Open;
   DM.qrSpisUser.Locate('ID',ID,[]);
  except
  // MainF.MessBox('Ошибка формирования списка контактов!');
  end;
 end;

procedure TSpisUserF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TSpisUserF.BitBtn1Click(Sender:TObject);
 begin
  FFlag:=1;
  Close;
 end;

procedure TSpisUserF.DBGrid1DblClick(Sender: TObject);
 begin
  BitBtn1Click(BitBtn1);
 end;

procedure TSpisUserF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
    dR,sR:TRect;
    i,j:Integer;
    C:TColor;

 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
{
  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  if (db.DataSource.DataSet.FieldByName('Done').AsInteger=0) then db.Canvas.Font.Style:=[fsBold];

  if DataCol=0 then db.Canvas.Font.Color:=db.Canvas.Brush.Color;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);

  if (db.DataSource.DataSet.FieldByName('Done').AsInteger=0) and (DataCol=0) and FFlash then
   begin
    dR:=Rect;
    dr.Left:=dr.Left+8; dr.Top:=dr.Top;
    dr.Right:=dR.Left+MainF.imFlashMail.Width; dr.Bottom:=dR.Top+MainF.imFlashMail.Height;
    sR.Left:=0; sR.Top:=0;
    sR.Right:=MainF.imFlashMail.Width; sR.Bottom:=MainF.imFlashMail.Height;
    db.Canvas.CopyRect(dR,MainF.imFlashMail.Canvas,sR);
    C:=db.Canvas.Pixels[dr.Left,dr.Top];
    for j:=dr.Top to dr.Bottom do
     for i:=dr.Left to dr.Right do
      if db.Canvas.Pixels[i,j]=C then
       db.Canvas.Pixels[i,j]:=db.Canvas.Brush.Color;
   end;
}
 end;

procedure TSpisUserF.tmWaitTimer(Sender: TObject);
 begin
  tmWait.Enabled:=False;
  try
   ShowSpisUser
  finally
   tmWait.Enabled:=True;
  end;
 end;

procedure TSpisUserF.tmFlashTimer(Sender: TObject);
 begin
  FFlash:=Not FFLash;
  DBGrid1.Repaint;
 end;

end.
