unit ShowATCU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
     ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, DBCtrls, JPEG, ADODB, DB, OpenLib, ComCtrls;

type

  TWCtrl2=class(TWinControl);

  TShowATCF = class(TForm)
    Panel5: TPanel;
    lbName: TLabel;
    Label12: TLabel;
    DBText6: TDBText;
    Label13: TLabel;
    DBText7: TDBText;
    Image1: TImage;
    lbTerap: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    imA: TImage;
    Image3: TImage;
    Image4: TImage;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image5: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    pn1: TPanel;
    im1: TImage;
    cb1: TCheckBox;
    lb1: TLabel;
    dbg1: TDBGrid;
    pn2: TPanel;
    im2: TImage;
    lb2: TLabel;
    cb2: TCheckBox;
    dbg2: TDBGrid;
    pn3: TPanel;
    Im3: TImage;
    lb3: TLabel;
    cb3: TCheckBox;
    dbg3: TDBGrid;
    Bevel1: TBevel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Image6: TImage;
    Label1: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    pnv1: TPanel;
    DBGrid2: TDBGrid;
    Label18: TLabel;
    Label19: TLabel;
    DBText5: TDBText;
    DBText8: TDBText;
    pnv2: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    DBText9: TDBText;
    DBText10: TDBText;
    DBGrid3: TDBGrid;
    pnv3: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    DBText11: TDBText;
    DBText12: TDBText;
    DBGrid4: TDBGrid;

    procedure FormCreate(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
    procedure dbg1TitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure dbg1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbg1KeyPress(Sender: TObject; var Key: Char);
    procedure dbg1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbg1DblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure lbTerapClick(Sender: TObject);
    procedure lbTerapMouseEnter(Sender: TObject);
    procedure lbTerapMouseLeave(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure cb1Click(Sender: TObject);

  private

    FSr:String;
    FIsFind:Boolean;
    FArt_Code:Integer;

    procedure ShowPict(AC: Integer);
    procedure srDataChange(Sender: TObject; Field: TField);

    function GetqrA: TADOQuery;

  public

    property IsFind:Boolean read FIsFind write FIsFind;

    procedure ReOpen(Ord: String);

    property qrA:TADOQuery read GetqrA;
    property Art_Code:Integer read FArt_Code write FArt_Code;

  end;

var ShowATCF:TShowATCF;

implementation

uses MainU, DataModuleU, ShowPictU;

{$R *.dfm}

procedure TShowATCF.FormCreate(Sender:TObject);
 begin
  Caption:='Препараты, входящие в одну классификационную группу АТС';
  FSr:='';
  IsFind:=False;
//  TWCtrl2(dbgATC).BevelKind:=bkFlat;
  if MainF.FullSprTov=True then
   begin
    dbg1.Columns[2].Visible:=False;
    dbg1.Columns[3].Visible:=False;
    dbg1.Columns[4].Visible:=False;
    dbg1.Columns[1].Width:=672;
   end;
  CopyImageTransp(imA,MainF.imAnnot);
  DrawRectBlue(Image5);
  DrawRectBlue(Image6);

  MakeGradientWidthI(im1,clGreen,$00C1EFAD);
  MakeGradientWidthI(im2,clGreen,$00C1EFAD);
  MakeGradientWidthI(im3,clGreen,$00C1EFAD);

  DM.srA1.OnDataChange:=srDataChange;
  DM.srA2.OnDataChange:=srDataChange;
  DM.srA3.OnDataChange:=srDataChange;
 end;

procedure TShowATCF.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TShowATCF.ReOpen(Ord:String);

 procedure ShowA(Qr:TADOQuery; P:Byte);
  begin

   Qr.Close;
   Qr.Parameters.ParamByName('art').Value:=lbName.Tag;
   Qr.Parameters.ParamByName('param').Value:=P;
   Qr.Open;

   if Qr.IsEmpty then Exit;

   TCheckBox(FindComponent('cb'+IntToStr(P))).Checked:=True;
   cb1Click(FindComponent('cb'+IntToStr(P)));

  end;

 begin
  try

   DM.qrVeshestva.Close;
   DM.qrVeshestva.Parameters.ParamByName('art').Value:=lbName.Tag;
   DM.qrVeshestva.Open;

   ShowA(DM.qrA1,1);
   ShowA(DM.qrA2,2);
   ShowA(DM.qrA3,3);

   if DM.qrA1.IsEmpty=False then dbg1.SetFocus else
   if DM.qrA2.IsEmpty=False then dbg2.SetFocus else
   if DM.qrA3.IsEmpty=False then dbg3.SetFocus;


   DM.qrATCDop.Close;
   DM.qrATCDop.SQL.Text:='select top 1 * from Inform..SprFormV where art_code='+IntToStr(lbName.Tag);
   DM.qrATCDop.Open;

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select p.art_code,p.Chp,t.Descr from Plist p, TovSubGroup t where t.art_code=p.art_code and p.art_code='+IntToStr(lbName.Tag);
   DM.Qr.Open;
   if DM.Qr.FieldByName('Chp').AsBoolean=True then
    begin
     Label14.Caption:='Позиции входящие в одну товарную подгруппу';
     lb3.Caption:=DM.Qr.FieldByName('Descr').AsString;
     DM.Qr.Close;
     DM.Qr.SQL.Text:='select top 1 * from Inform..SprATCDescr where atc='''+IntToStr(lbName.Tag)+'''';
     DM.Qr.Open;
    end else begin
              DM.Qr.Close;
              DM.Qr.SQL.Text:='select top 1 * from Inform..SprATCDescr where atc in (select itc from SprITC where art_code='+IntToStr(lbName.Tag)+')';
              DM.Qr.Open;
             end;

   Label2.Caption:=DM.Qr.FieldByName('ATC1').AsString;
   Label3.Caption:=DM.Qr.FieldByName('ATC2').AsString;
   Label4.Caption:=DM.Qr.FieldByName('ATC3').AsString;
   Label5.Caption:=DM.Qr.FieldByName('ATC4').AsString;
   Label6.Caption:=DM.Qr.FieldByName('ATC5').AsString;
  except
   MainF.MessBox('Ошибка доступа к справочнику "АТС"');
  end;
 end;

procedure TShowATCF.dbg1TitleClick(Column: TColumn);
 begin
{  if Column=dbgATC.Columns[1] then
   begin
    ReOpen('a.Names');
    dbgATC.Columns[1].Font.Color:=clBlue;
    dbgATC.Columns[3].Font.Color:=clBlack;
    dbgATC.Columns[1].Title.Font.Color:=clRed;
    dbgATC.Columns[3].Title.Font.Color:=clBlack;
   end else
  if Column=dbgATC.Columns[3] then
   begin
    ReOpen('Max(a.cena) desc');
    dbgATC.Columns[3].Font.Color:=clBlue;
    dbgATC.Columns[1].Font.Color:=clBlack;
    dbgATC.Columns[3].Title.Font.Color:=clRed;
    dbgATC.Columns[1].Title.Font.Color:=clBlack;
   end;
}
 end;

procedure TShowATCF.FormActivate(Sender: TObject);
 begin
  Reopen('');

  dbg1TitleClick(dbg1.Columns[1]);

  cb1Click(cb1);
  cb1Click(cb2);
  cb1Click(cb3);
 end;

procedure TShowATCF.dbg1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if db.DataSource.DataSet.FieldByName('KOL').AsString<>'' then
   begin
    if db.DataSource.DataSet.FieldByName('KOL').AsInteger<=0 then db.Canvas.Brush.Color:=$00FFCB5E;
    if gdSelected in State then
     begin
      db.Canvas.Brush.Color:=clNavy;
      db.Canvas.Font.Color:=clWhite;
     end;
   end;
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure TShowATCF.dbg1KeyPress(Sender:TObject; var Key:Char);
var db:TDBGrid;
    Zr,NC:Integer;
    IsFind:Boolean;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  NC:=db.SelectedIndex;
  Zr:=0;
  if NC>1 then NC:=1;
  MainF.dbGKeyPress(db,Key,FSr,NC,SC_FIND,Zr,IsFind);
 end;              

procedure TShowATCF.dbg1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key in K_ARROW_KEYS then FSr:='';
  if Key=VK_RETURN then dbg1DblClick(Sender);
 end;

procedure TShowATCF.dbg1DblClick(Sender:TObject);
 begin
  if qrA.IsEmpty then Exit;
  Art_Code:=qrA.FieldByName('Art_Code').AsInteger;
  IsFind:=True;
  DM.Qr.Close;
  DM.Qr.SQL.Text:='insert into F8Log(dt,done,id_user,art_code,art_new) values(getdate(),2,'+IntToStr(Prm.UserID)+','+IntToStr(ShowATCF.lbName.Tag)+','+IntToStr(Art_Code)+')';
  DM.Qr.ExecSQL;
  Close;
 end;

procedure TShowATCF.ShowPict(AC:Integer);
var jpg:TJPEGImage;
    Blob:TMemoryStream;
 begin
  jpg:=nil; Blob:=nil;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select top 1 im from Work_Gif..tbl_tmp where art_code='+IntToStr(AC);
   DM.QrEx.Open;
   if DM.QrEx.IsEmpty then Abort;

   ShowPictF:=TShowPictF.Create(Self);
   jpg:=TJPEGImage.Create;
   Blob:=TADOBlobStream.Create(TBlobField(DM.QrEx.FieldByName('im')),bmRead);
   try

    jpg.LoadFromStream(Blob);
    if (jpg.Width>ShowPictF.imPict.Width) or (jpg.Height>ShowPictF.imPict.Height) then ShowPictF.imPict.Stretch:=True;
    ShowPictF.imPict.Picture.Assign(jpg);

    Application.ProcessMessages;
    ShowPictF.ShowModal;
   finally
    if Assigned(Blob) then Blob.Free;
    if Assigned(jpg) then jpg.Free;
    ShowPictF.Free;
   end;
  except
   MainF.MessBox('На данный препарат нет фотографии!');
//   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику фотографий препаратов: '+E.Message);
  end;
 end;

procedure TShowATCF.BitBtn5Click(Sender: TObject);
 begin
  if qrA.IsEmpty then Exit;
  ShowPict(qrA.FieldByName('Art_Code').AsInteger);
 end;

procedure TShowATCF.lbTerapClick(Sender: TObject);
 begin
  if qrA.IsEmpty then Exit;
  MainF.ShowTeramChange(qrA.FieldByName('Art_Code').AsInteger,qrA.FieldByName('Names').AsString);
 end;

procedure TShowATCF.lbTerapMouseEnter(Sender: TObject);
 begin
  TLabel(Sender).Font.Style:=[fsUnderline];
 end;

procedure TShowATCF.lbTerapMouseLeave(Sender: TObject);
 begin
  TLabel(Sender).Font.Style:=[];
 end;

procedure TShowATCF.Label16Click(Sender: TObject);
 begin
  if qrA.IsEmpty then Exit;
  MainF.ShowAnnotation(qrA.FieldByName('Art_Code').AsInteger);
 end;

procedure TShowATCF.Label15Click(Sender: TObject);
 begin
  if qrA.IsEmpty then Exit;
  MainF.PrintSertif(qrA.FieldByName('Art_Code').AsInteger);
 end;

procedure TShowATCF.SpeedButton4Click(Sender: TObject);
 begin
  MainF.ShowTeramChange(lbName.Tag,lbName.Caption);
 end;

procedure TShowATCF.SpeedButton5Click(Sender: TObject);
 begin
  MainF.ShowAnnotation(lbName.Tag);
 end;

procedure TShowATCF.SpeedButton3Click(Sender: TObject);
 begin
  MainF.PrintSertif(lbName.Tag);
 end;

procedure TShowATCF.SpeedButton2Click(Sender: TObject);
 begin
  ShowPict(lbName.Tag);
 end;

procedure TShowATCF.cb1Click(Sender:TObject);
var dy,Tg:Integer;
    Chk:Boolean;
    pn:TPanel;
    H:Array[1..3] of Integer;

 begin

  if Not Assigned(Sender) then Exit;
  Tg:=TCheckBox(Sender).Tag;
  Chk:=TCheckBox(Sender).Checked;
  Pn:=TPanel(FindComponent('pn'+IntToStr(Tg)));

  H[1]:=130;
  H[2]:=150;
  H[3]:=170;

  if Chk then pn.Height:=H[Tg]
         else pn.Height:=26;

  if cb1.Checked then
   begin
    pn2.Top:=pn1.Top+pn1.Height+2;
   end else pn2.Top:=pn1.Top+im1.Height;

  if cb2.Checked then pn3.Top:=pn2.Top+pn2.Height+2
                 else pn3.Top:=pn2.Top+im2.Height;

  TPanel(FindComponent('pnv'+IntToStr(Tg))).Visible:=Chk;

  pnv1.Top:=pn1.Top;
  pnv2.Top:=pn2.Top;
  pnv3.Top:=pn3.Top;

  pnv1.Height:=H[1];
  pnv2.Height:=H[2];
  pnv3.Height:=H[3];

  dy:=719;
  if cb1.Checked=False then Dec(dy,H[1]-26);
  if cb2.Checked=False then Dec(dy,H[2]-26);
  if cb3.Checked=False then Dec(dy,H[3]-26);
  Height:=dy;

//  Top:=(Screen.Height-Height) div 2;
 end;

function TShowATCF.GetqrA:TADOQuery;
 begin
  if dbg2.Focused then Result:=DM.qrA2 else
  if dbg3.Focused then Result:=DM.qrA3
                  else Result:=DM.qrA1;
 end;

procedure TShowATCF.srDataChange(Sender:TObject; Field:TField);
var Qr:TADOQuery;

 begin
  if Not Assigned(Sender) then Exit;
  if Sender=DM.srA1 then Qr:=DM.qrvA1 else
  if Sender=DM.srA2 then Qr:=DM.qrvA2 else
  if Sender=DM.srA3 then Qr:=DM.qrvA3 else Exit;

  Qr.Close;
  Qr.Parameters.ParamByName('art').Value:=TDataSource(Sender).DataSet.FieldByName('art_code').AsInteger;
  Qr.Open;
 end;

END.

