unit EnterKolNewU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MainU,
     Dialogs, ExtCtrls, StdCtrls, OpenLib, Util, Buttons, Grids, DBGrids, DateUtils, DB,
     CustomizeDlg, ComCtrls, ExtImage;

type

  TPlanSale=Record
             Art_Code:Integer;
            end;

  TList=Record
         Art_Code:Integer;
         PrizeUp:Currency;
         SumSkdUp:Currency;
         Descr:String;
         lbName:TLabel;
         lbOstat:TLabel;
         lbOstatUp:TLabel;
         lbCena:TLabel;
         lbCenaUp:TLabel;
         lbKol:TLabel;
         edKol:TEdit;
         lbBonus:TLabel;
         cb1:TCheckBox;
         lb1:TLabel;
         im1:TExtImage;
         Active:Boolean;
        end;

  TEnterKolNewF = class(TForm)

    Label3:TLabel;
    edKol:TEdit;
    Label6:TLabel;
    Panel2:TPanel;
    lbNames:TLabel;
    im1:TImage;
    Label1: TLabel;
    lbArt: TLabel;
    bbChek: TBitBtn;
    bbCancel: TBitBtn;
    sbLeft: TSpeedButton;
    sbRight: TSpeedButton;
    imL: TImage;
    imR: TImage;
    Label2: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    pn2: TPanel;
    dbg2: TDBGrid;
    Label5: TLabel;
    Label7: TLabel;
    Panel3: TPanel;
    Label8: TLabel;
    bbChange: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Bevel1: TBevel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    pnAl1: TPanel;
    Label52: TLabel;
    Label53: TLabel;
    pnAl2: TPanel;
    pnAl4: TPanel;
    pnAl3: TPanel;
    Label60: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Panel6: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Bevel2: TBevel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label80: TLabel;
    Panel7: TPanel;
    Label84: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Shape1: TShape;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Shape2: TShape;
    Label21: TLabel;
    Label54: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Panel8: TPanel;
    Label65: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    sbList: TScrollBox;
    HeaderControl1: THeaderControl;
    Panel9: TPanel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    bbComlect: TBitBtn;
    Shape3: TShape;
    Label99: TLabel;
    Label101: TLabel;
    Label100: TLabel;
    Label102: TLabel;
    Shape4: TShape;
    Panel10: TPanel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Bevel3: TBevel;
    Label123: TLabel;
    Label128: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Panel11: TPanel;
    Label145: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure edKolKeyPress(Sender: TObject; var Key: Char);
    procedure bbCancelClick(Sender: TObject);
    procedure bbChekClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight:Integer);
    procedure FormActivate(Sender: TObject);
    procedure sbLeftClick(Sender: TObject);
    procedure edKolChange(Sender: TObject);
    procedure bbChangeClick(Sender: TObject);
    procedure dbg2DblClick(Sender: TObject);
    procedure Label11MouseLeave(Sender: TObject);
    procedure Label11MouseEnter(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label25Click(Sender: TObject);
    procedure bbComlectClick(Sender: TObject);

  private

    FFlag:Integer;
    FParam:Integer;
    FIsFirst:Boolean;
    Fid_akcii:Integer;
    Fid_prior:Integer;
    aList:Array of TList;
    CurrentID:Integer;

    procedure ShowPlanSale(Pl:TPlanSale);
    procedure ShowPlanSaleApt(Pl: TPlanSale);
    procedure srSpisDataChange(Sender: TObject; Field: TField);
    procedure CreateList;
    procedure ClearList;
    procedure imMouseEnter(Sender:TObject);
    procedure imMouseLeave(Sender:TObject);
    procedure imClick(Sender:TObject);
    procedure cbClick(Sender:TObject);
    procedure DrawCell(Num:Integer; P:Byte);

  public

    Ep:TEnterParam;

    procedure MoveForms;

    property  Flag:Integer read FFlag;
    property  Param:Integer read FParam write FParam;
    property  id_akcii:Integer read Fid_akcii write Fid_akcii;
    property  id_prior:Integer read Fid_prior write Fid_prior;

  end;

const dy=50;

var EnterKolNewF:TEnterKolNewF;
    Pl:TPlanSale;

implementation

{$R *.dfm}

uses hSosputstvU, hPokupStatU, DataModuleU, PiggyBankU, ShareU,
     hFarmZamAlertU, hPlanInfoU, hPlanAptInfoU;

procedure TEnterKolNewF.FormCreate(Sender: TObject);
 begin

  FFlag:=0;
  Fid_akcii:=0;
  Fid_prior:=0;
  Fparam:=0;
  FIsFirst:=True;
  Caption:=MFC;
  im1.Canvas.Pen.Color:=clGray;
  im1.Canvas.Rectangle(0,0,im1.Width,im1.Height);
  MakeGradientHeightI(im1,clGreen,clLime,1,1,20,im1.Height-2);
  CurrentID:=-1;

  MakeGradientHeightI(ImL,clWhite,$00E4E4F0,0,0,imL.Width,imL.Height);
  MakeGradientHeightI(ImR,clWhite,$00E4E4F0,0,0,imR.Width,imR.Height);

  Label2.Caption:=Prm.UserName;

  DM.srSpis.OnDataChange:=srSpisDataChange;

 end;

procedure TEnterKolNewF.edKolKeyPress(Sender:TObject; var Key:Char);
var P:Integer;
 begin
  if Key<>#8 then
   begin
    if Not (Key in ['0'..'9']) then Key:=#0;
   end;
 end;

procedure TEnterKolNewF.bbCancelClick(Sender: TObject);
 begin
  Close;
 end;

procedure TEnterKolNewF.bbChekClick(Sender: TObject);
 begin
  FFlag:=1;
  Close;
 end;

procedure TEnterKolNewF.FormShow(Sender: TObject);
 begin
  hSoputstvF.Enabled:=True;
  hPokupStatF.Enabled:=True;
 end;

procedure TEnterKolNewF.MoveForms;
var dy:Integer;
 begin
  dy:=27;

  hSoputstvF.Left:=Left-100;
  hSoputstvF.Top:=Top-hSoputstvF.Height-2;
  hPokupStatF.Top:=Top+8;
  hPokupStatF.Left:=Left-hPokupStatF.Width-5;

  hFarmZamAlertF.Left:=Left-((hFarmZamAlertF.Width-Width) div 2);
  hFarmZamAlertF.Top:=Top-hFarmZamAlertF.Height-2;

  hPlanInfoF.Left:=Left-hPlanInfoF.Width-2;
  hPlanInfoF.Top:=Top+Height-hPlanInfoF.Height+dy;

  if ((Ep.IsPlanSale=False) and (Ep.IsPlanSaleApt=True)) or (Ep.IsPlanSaleApt=False) then hPlanAptInfoF.Left:=-1000 else
   begin
    hPlanAptInfoF.Left:=Left+Width+2;
    hPlanAptInfoF.Top:=Top+Height-hPlanAptInfoF.Height+dy;
   end;
 end;

procedure TEnterKolNewF.FormConstrainedResize(Sender:TObject; var MinWidth,MinHeight,MaxWidth,MaxHeight:Integer);
 begin
  MoveForms;
 end;

procedure TEnterKolNewF.ShowPlanSale(Pl:TPlanSale);
var id_a,id_p:Integer;
    KolRest:Currency;
 begin
  DM.QrEx1.Close;
  DM.QrEx1.SQL.Clear;
  DM.QrEx1.SQL.Text:='exec spY_PlanSale '+IntToStr(Pl.Art_Code)+',null,null,0 ';
  DM.QrEx1.Open;

  hPlanInfoF.Height:=0;
  if DM.QrEx1.IsEmpty then Exit;

  hPlanInfoF.Height:=330;
  MoveForms;

  id_a:=DM.QrEx1.FieldByName('id_plan').AsInteger;
  id_p:=3;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='exec spY_GetSumBonus '+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_p)+','+IntToStr(id_a)+', '''+FormatDateTime('yyyy-mm-dd',DM.QrEx1.FieldByName('DtStart').AsDateTime)+''','''+FormatDateTime('yyyy-mm-dd',DM.QrEx1.FieldByName('DtEnd').AsDateTime)+'''';
  DM.QrEx.Open;

  with hPlanInfoF do
   begin

    Label40.Caption:=CurrToStr(DM.QrEx.FieldByName('SumB').AsCurrency);
    Label41.Caption:=BonusStr(DM.QrEx.FieldByName('SumB').AsCurrency,'.');

    Label29.Caption:=DM.QrEx1.FieldByName('Plan').AsString;
    Label33.Caption:=CurrToStr(DM.QrEx1.FieldByName('Prize1').AsCurrency);
    Label47.Caption:=CurrToStr(DM.QrEx1.FieldByName('Prize2').AsCurrency);
    Label49.Caption:=CurrToStr(DM.QrEx1.FieldByName('Prize3').AsCurrency);

    Label34.Caption:=BonusStr(DM.QrEx1.FieldByName('Prize1').AsCurrency,'.');
    Label50.Caption:=BonusStr(DM.QrEx1.FieldByName('Prize2').AsCurrency,'.');
    Label51.Caption:=BonusStr(DM.QrEx1.FieldByName('Prize3').AsCurrency,'.');

    Label43.Caption:='- '+DM.QrEx1.FieldByName('Prc1').AsString+'% - '+DM.QrEx1.FieldByName('Prc2').AsString+'%';
    Label44.Caption:='- '+DM.QrEx1.FieldByName('Prc2').AsString+'% - '+DM.QrEx1.FieldByName('Prc3').AsString+'%';
    Label45.Caption:='- >'+DM.QrEx1.FieldByName('Prc3').AsString+'%';

    DM.QrEx.Close;
    DM.QrEx.SQL.Text:='exec spY_AckiiStat '+IntToStr(id_a)+','+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_p);
    DM.QrEx.Open;

    Label36.Caption:=CurrToStr(DM.QrEx.FieldByName('Prc').AsCurrency);
    Label38.Caption:=CurrToStr(DM.QrEx.FieldByName('Kol').AsCurrency);

    KolRest:=DM.QrEx1.FieldByName('Plan').AsCurrency-DM.QrEx.FieldByName('Kol').AsCurrency;
    if KolRest<0 then KolRest:=0;
    Label89.Caption:=CurrToStr(KolRest);

   end;
 end;

procedure TEnterKolNewF.ShowPlanSaleApt(Pl:TPlanSale);
var id_a,id_p:Integer;
    KolRest,KolRestApt:Currency;
 begin

  DM.QrEx1.Close;
  DM.QrEx1.SQL.Clear;
  DM.QrEx1.SQL.Text:='exec spY_PlanSale '+IntToStr(Pl.Art_Code)+',null,null,1 ';
  DM.QrEx1.Open;

  hPlanAptInfoF.Height:=0;
  if DM.QrEx1.IsEmpty then Exit;

  hPlanAptInfoF.Height:=330;
  MoveForms;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='exec spY_GetSumBonus '+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_p)+','+IntToStr(id_a)+', '''+FormatDateTime('yyyy-mm-dd',DM.QrEx1.FieldByName('DtStart').AsDateTime)+''','''+FormatDateTime('yyyy-mm-dd',DM.QrEx1.FieldByName('DtEnd').AsDateTime)+'''';
  DM.QrEx.Open;

  id_a:=DM.QrEx1.FieldByName('id_plan').AsInteger;
  id_p:=5;

  with hPlanAptInfoF do
   begin
    Label77.Caption:=CurrToStr(DM.QrEx.FieldByName('SumB').AsCurrency);
    Label78.Caption:=BonusStr(DM.QrEx.FieldByName('SumB').AsCurrency,'.');

    DM.QrEx.Close;
    DM.QrEx.SQL.Text:='exec spY_AckiiStat '+IntToStr(id_a)+','+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_p);
    DM.QrEx.Open;

    Label59.Caption:=DM.QrEx1.FieldByName('Plan').AsString;
    Label64.Caption:=DM.QrEx1.FieldByName('FondZav').AsString;
    Label80.Caption:=BonusStr(DM.QrEx1.FieldByName('FondZav').AsCurrency,'.');

    Label67.Caption:=CurrToStr(DM.QrEx.FieldByName('PrcApt').AsCurrency);
    Label70.Caption:=CurrToStr(DM.QrEx.FieldByName('KolApt').AsCurrency);

    Label72.Caption:=CurrToStr(DM.QrEx.FieldByName('Prc').AsCurrency);
    Label74.Caption:=CurrToStr(DM.QrEx.FieldByName('Kol').AsCurrency);

    KolRest:=   DM.QrEx1.FieldByName('Plan').AsCurrency-DM.QrEx.FieldByName('Kol').AsCurrency;
    KolRestApt:=DM.QrEx1.FieldByName('Plan').AsCurrency-DM.QrEx.FieldByName('KolApt').AsCurrency;

    if KolRest<0 then KolRest:=0;
    if KolRestApt<0 then KolRestApt:=0;

    Label83.Caption:=CurrToStr(KolRestApt);
    Label86.Caption:=CurrToStr(KolRest);
   end;

 end;

procedure TEnterKolNewF.DrawCell(Num:Integer; P:Byte);
var im:TExtImage;
 begin

  im:=aList[Num].im1;

  Case P of
   0:im.Canvas.Brush.Color:=$00D5EFF4;
   1:im.Canvas.Brush.Color:=$0066C6D7;
  end;

  im.Canvas.FillRect(Rect(0,0,im.Width,im.Height));

  if aList[Num].Active=False then
   begin
    aList[Num].lbName.Font.Color:=clNavy;
    aList[Num].lbName.Font.Style:=[fsBold];
   end else begin
             aList[Num].lbName.Font.Color:=clMaroon;
             aList[Num].lbName.Font.Style:=[fsUnderline,fsBold];
            end;

{
  if aList[Num].Active=False then
   begin
    im.Canvas.Font.Color:=clBlack;
    im.Canvas.Font.Style:=[fsBold];
   end else begin
             im.Canvas.Font.Color:=clMaroon;
             im.Canvas.Font.Style:=[fsUnderline,fsBold];
            end;
}
 end;

procedure TEnterKolNewF.imMouseEnter(Sender: TObject);
 begin
  DrawCell(TComponent(Sender).Tag,1);
 end;

procedure TEnterKolNewF.imMouseLeave(Sender:TObject);
 begin
  DrawCell(TComponent(Sender).Tag,0);
 end;

procedure TEnterKolNewF.imClick(Sender:TObject);
var ID,i:Integer;
 begin
  for i:=Low(aList) to High(aList) do
   begin
    aList[i].Active:=False;
    DrawCell(i,0);
   end;

  ID:=TExtImage(Sender).Tag;
  CurrentID:=ID;

  aList[ID].Active:=True;

  DrawCell(ID,1);
  Label98.Caption:=aList[ID].Descr;
  Label102.Caption:=CurrToStrF(aList[ID].PrizeUp,ffFixed,2)+' грн. за 1 уп.';
  if aList[ID].SumSkdUp>0 then
   begin
    Label99.Visible:=True;
    Label101.Visible:=True;
    Label101.Caption:=CurrToStrF(aList[ID].SumSkdUp,ffFixed,2)+' грн. за 1 уп.';
   end;
 end;

procedure TEnterKolNewF.ClearList;
var i:Integer;
 begin
  for i:=Low(aList) to High(aList) do
   begin
    aList[i].lbName.Free;
    aList[i].lbOstat.Free;
    aList[i].lbOstatUp.Free;
    aList[i].lbCena.Free;
    aList[i].lbCenaUp.Free;
    aList[i].lbKol.Free;
    aList[i].edKol.Free;
    aList[i].lbBonus.Free;
    aList[i].cb1.Free;
    aList[i].im1.Free;
   end;
  SetLength(aList,0);
 end;

procedure TEnterKolNewF.CreateList;
var i:Integer;
 begin
  ClearList;
  SetLength(aList,DM.qrSpis.RecordCount);
  for i:=1 to DM.qrSpis.RecordCount do
   begin
    if i=1 then DM.qrSpis.First else DM.qrSpis.Next;
    aList[i-1].Active:=False;
    aList[i-1].Art_Code:=DM.qrSpis.FieldByName('art_code').AsInteger;
    aList[i-1].PrizeUp:=DM.qrSpis.FieldByName('PrizeUp').AsCurrency;
    aList[i-1].SumSkdUp:=DM.qrSpis.FieldByName('SumSkdUp').AsCurrency;
    aList[i-1].Descr:=DM.qrSpis.FieldByName('Descr').AsString;

    aList[i-1].im1:=TExtImage.Create(Self);
    aList[i-1].im1.Parent:=sbList;
    aList[i-1].im1.Left:=0;
    aList[i-1].im1.Width:=sbList.Width-21;
    aList[i-1].im1.Top:=(i-1)*dy;
    aList[i-1].im1.Height:=dy;
    aList[i-1].im1.OnMouseLeave:=imMouseLeave;
    aList[i-1].im1.OnMouseEnter:=imMouseEnter;
    aList[i-1].im1.OnClick:=imClick;
    aList[i-1].im1.Tag:=i-1;

    aList[i-1].lbName:=TLabel.Create(Self);
    aList[i-1].lbName.Parent:=sbList;
    aList[i-1].lbName.Left:=5;
    aList[i-1].lbName.Top:=(i-1)*dy+5;
    aList[i-1].lbName.AutoSize:=False;
    aList[i-1].lbName.Width:=330;
    aList[i-1].lbName.Font.Style:=[fsBold];
    aList[i-1].lbName.Font.Color:=clNavy;
    aList[i-1].lbName.Caption:=DM.qrSpis.FieldByName('art_code').AsString+' '+DM.qrSpis.FieldByName('names').AsString;
    aList[i-1].lbName.Hint:=DM.qrSpis.FieldByName('art_code').AsString+' '+DM.qrSpis.FieldByName('names').AsString;
    aList[i-1].lbName.ShowHint:=True;
    aList[i-1].lbName.Tag:=i-1;
    aList[i-1].lbName.Transparent:=True;
    aList[i-1].lbName.OnMouseLeave:=imMouseLeave;
    aList[i-1].lbName.OnMouseEnter:=imMouseEnter;
    aList[i-1].lbName.OnClick:=imClick;

    aList[i-1].lbOstat:=TLabel.Create(Self);
    aList[i-1].lbOstat.Parent:=sbList;
    aList[i-1].lbOstat.Left:=aList[i-1].lbName.Left+aList[i-1].lbName.Width+1;
    aList[i-1].lbOstat.Top:=(i-1)*dy+5;
    aList[i-1].lbOstat.AutoSize:=False;
    aList[i-1].lbOstat.Width:=47;
    aList[i-1].lbOstat.Font.Style:=[fsBold];
    aList[i-1].lbOstat.Alignment:=taCenter;
    aList[i-1].lbOstat.Caption:=DM.qrSpis.FieldByName('Ostat').AsString;
    aList[i-1].lbOstat.Tag:=i-1;
    aList[i-1].lbOstat.Transparent:=True;
    aList[i-1].lbOstat.OnMouseLeave:=imMouseLeave;
    aList[i-1].lbOstat.OnMouseEnter:=imMouseEnter;
    aList[i-1].lbOstat.OnClick:=imClick;

    aList[i-1].lbOstatUp:=TLabel.Create(Self);
    aList[i-1].lbOstatUp.Parent:=sbList;
    aList[i-1].lbOstatUp.Left:=aList[i-1].lbOstat.Left+aList[i-1].lbOstat.Width+1;
    aList[i-1].lbOstatUp.Top:=(i-1)*dy+5;
    aList[i-1].lbOstatUp.AutoSize:=False;
    aList[i-1].lbOstatUp.Width:=47;
    aList[i-1].lbOstatUp.Font.Style:=[fsBold];
    aList[i-1].lbOstatUp.Alignment:=taCenter;
    aList[i-1].lbOstatUp.Caption:=DM.qrSpis.FieldByName('OstatUp').AsString;
    aList[i-1].lbOstatUp.Tag:=i-1;
    aList[i-1].lbOstatUp.Transparent:=True;
    aList[i-1].lbOstatUp.OnMouseLeave:=imMouseLeave;
    aList[i-1].lbOstatUp.OnMouseEnter:=imMouseEnter;
    aList[i-1].lbOstatUp.OnClick:=imClick;

    aList[i-1].lbCena:=TLabel.Create(Self);
    aList[i-1].lbCena.Parent:=sbList;
    aList[i-1].lbCena.Left:=aList[i-1].lbOstatUp.Left+aList[i-1].lbOstatUp.Width+1;
    aList[i-1].lbCena.Top:=(i-1)*dy+5;
    aList[i-1].lbCena.AutoSize:=False;
    aList[i-1].lbCena.Width:=50;
    aList[i-1].lbCena.Font.Style:=[fsBold];
    aList[i-1].lbCena.Alignment:=taRightJustify;
    aList[i-1].lbCena.Caption:=DM.qrSpis.FieldByName('Cena').AsString;
    aList[i-1].lbCena.Tag:=i-1;
    aList[i-1].lbCena.Transparent:=True;
    aList[i-1].lbCena.OnMouseLeave:=imMouseLeave;
    aList[i-1].lbCena.OnMouseEnter:=imMouseEnter;
    aList[i-1].lbCena.OnClick:=imClick;

    aList[i-1].lbCenaUp:=TLabel.Create(Self);
    aList[i-1].lbCenaUp.Parent:=sbList;
    aList[i-1].lbCenaUp.Left:=aList[i-1].lbCena.Left+aList[i-1].lbCena.Width+1;
    aList[i-1].lbCenaUp.Top:=(i-1)*dy+5;
    aList[i-1].lbCenaUp.AutoSize:=False;
    aList[i-1].lbCenaUp.Width:=53;
    aList[i-1].lbCenaUp.Font.Style:=[fsBold];
    aList[i-1].lbCenaUp.Alignment:=taRightJustify;
    aList[i-1].lbCenaUp.Caption:=DM.qrSpis.FieldByName('CenaUp').AsString;
    aList[i-1].lbCenaUp.Tag:=i-1;
    aList[i-1].lbCenaUp.Transparent:=True;
    aList[i-1].lbCenaUp.OnMouseLeave:=imMouseLeave;
    aList[i-1].lbCenaUp.OnMouseEnter:=imMouseEnter;
    aList[i-1].lbCenaUp.OnClick:=imClick;

    aList[i-1].lbKol:=TLabel.Create(Self);
    aList[i-1].lbKol.Parent:=sbList;
    aList[i-1].lbKol.Left:=20;
    aList[i-1].lbKol.Top:=(i-1)*dy+23;
    aList[i-1].lbKol.Caption:=' оличество';
    aList[i-1].lbKol.Tag:=i-1;
    aList[i-1].lbKol.Transparent:=True;
    aList[i-1].lbKol.OnMouseLeave:=imMouseLeave;
    aList[i-1].lbKol.OnMouseEnter:=imMouseEnter;
    aList[i-1].lbKol.OnClick:=imClick;

    aList[i-1].edKol:=TEdit.Create(Self);
    aList[i-1].edKol.Parent:=sbList;
    aList[i-1].edKol.Left:=aList[i-1].lbKol.Left+aList[i-1].lbKol.Width+5;
    aList[i-1].edKol.Top:=(i-1)*dy+20;
    aList[i-1].edKol.Width:=60;
    aList[i-1].edKol.BevelKind:=bkFlat;
    aList[i-1].edKol.BorderStyle:=bsNone;
    aList[i-1].edKol.OnChange:=edKolChange;
    aList[i-1].edKol.OnKeyPress:=edKolKeyPress;
    aList[i-1].edKol.Text:='1';
    aList[i-1].edKol.Tag:=i-1;
    aList[i-1].edKol.OnExit:=imMouseLeave;
    aList[i-1].edKol.OnEnter:=imMouseEnter;

    aList[i-1].lbBonus:=TLabel.Create(Self);
    aList[i-1].lbBonus.Parent:=sbList;
    aList[i-1].lbBonus.Left:=170;
    aList[i-1].lbBonus.Top:=(i-1)*dy+23;
    aList[i-1].lbBonus.Font.Style:=[fsBold];
    aList[i-1].lbBonus.Font.Color:=clMaroon;
    aList[i-1].lbBonus.Caption:='Ѕонус: '+DM.qrSpis.FieldByName('Prize').AsString+' грн.';
    aList[i-1].lbBonus.Tag:=i-1;
    aList[i-1].lbBonus.Transparent:=True;
    aList[i-1].lbBonus.OnMouseLeave:=imMouseLeave;
    aList[i-1].lbBonus.OnMouseEnter:=imMouseEnter;
    aList[i-1].lbBonus.OnClick:=imClick;

    aList[i-1].cb1:=TCheckBox.Create(Self);
    aList[i-1].cb1.Parent:=sbList;
    aList[i-1].cb1.Height:=13;
    aList[i-1].cb1.Width:=13;
    aList[i-1].cb1.Left:=sbList.Width-125;
    aList[i-1].cb1.Top:=(i-1)*dy+24;
    aList[i-1].cb1.Tag:=i-1;
    aList[i-1].cb1.OnClick:=cbClick;

    aList[i-1].lb1:=TLabel.Create(Self);
    aList[i-1].lb1.Parent:=sbList;
    aList[i-1].lb1.Width:=80;
    aList[i-1].lb1.Caption:='ƒобавить в чек';
    aList[i-1].lb1.Left:=aList[i-1].cb1.Left+17;
    aList[i-1].lb1.Top:=(i-1)*dy+23;
    aList[i-1].lb1.Caption:='ƒобавить в чек';
    aList[i-1].lb1.Tag:=i-1;
    aList[i-1].lb1.Transparent:=True;
    aList[i-1].lb1.OnMouseLeave:=imMouseLeave;
    aList[i-1].lb1.OnMouseEnter:=imMouseEnter;
    aList[i-1].lb1.OnClick:=imClick;

    if i=1 then
     aList[i-1].cb1.Checked:=True;
    aList[i-1].cb1.Alignment:=taLeftJustify;
   end;

 end;

procedure TEnterKolNewF.FormActivate(Sender:TObject);
var
  Param, idz, i, id_p: Integer;
  SumBAll: Currency;
  KolRest, KolRestApt: Currency;
  Pl: TPlanSale;
  sS: String;
begin
  try
    Param:=0;

    DM.qrSpis.Close;
    DM.qrSpis.SQL.Clear;
    DM.qrSpis.SQL.Text:='exec spY_ArtZamena '+IntToStr(lbArt.Tag);
    DM.qrSpis.Open;

    if DM.qrSpis.IsEmpty=False then Param:=1 else
     begin
      DM.qrSpis.Close;
      DM.qrSpis.SQL.Clear;
      DM.qrSpis.SQL.Text:='exec spY_ConComit '+IntToStr(lbArt.Tag)+',null,null ';
      DM.qrSpis.Open;
      if DM.qrSpis.IsEmpty=False then Param:=4 else
       begin
        hPlanInfoF.Height:=0;
        DM.qrSpis.Close;
        DM.qrSpis.SQL.Clear;
        DM.qrSpis.SQL.Text:='exec spY_PlanSale '+IntToStr(lbArt.Tag)+',null,null,0 ';
        DM.qrSpis.Open;
        if DM.qrSpis.IsEmpty=False then Param:=2 else
         begin
          DM.qrSpis.Close;
          DM.qrSpis.SQL.Clear;
          DM.qrSpis.SQL.Text:='exec spY_PlanSale '+IntToStr(lbArt.Tag)+',null,null,1 ';
          DM.qrSpis.Open;
          if DM.qrSpis.IsEmpty=False then Param:=3 else
           begin
            DM.qrSpis.Close;
            DM.qrSpis.SQL.Clear;
            DM.qrSpis.SQL.Text:='exec spY_PlanSale '+IntToStr(lbArt.Tag)+',null,null,2 ';
            DM.qrSpis.Open;
            if DM.qrSpis.IsEmpty=False then Param:=5;
          end
        end;
      end
    end;

   // ѕрава€ дополнительна€ панель "ѕлан продаж на аптеку"
    if ((Ep.IsPlanSaleApt=True) and (Ep.IsArtZam=False) and (Ep.IsPlanSale=True)) then
    begin
      Pl.Art_Code:=lbArt.Tag;
      ShowPlanSaleApt(Pl);
    end;

    {-------------------------------------------------------------------------------------------------------------------------------------------------}
    if Param=0 then Abort;

{
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spY_GetSumBonusAll_End '+IntToStr(Prm.ID_Gamma)+','''+FormatDateTime('yyyy-mm-dd',StartOfTheMonth(Date))+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',EndOfTheMonth(Date))+'''';
   DM.QrEx.Open;

   SumBAll:=DM.QrEx.FieldByName('SumB').AsCurrency+DM.QrEx.FieldByName('SumBActive').AsCurrency;
}
    if Param=1 then  // ‘армзамена
    begin
      if Ep.IsArtZam then
       begin
        Ep.Ra.id_zam:=DM.qrSpis.FieldByName('id_zam').AsInteger;
        Ep.Ra.Art_Code:=lbArt.Tag;
        Ep.Ra.Status:=0;
        MainF.RegArtZamena(Ep);
       end;
      idz:=DM.qrSpis.FieldByName('id_zam').AsInteger;
      id_p:=4;
      bbChange.Visible:=True;

      Label4.Caption:='”в. провизоры, замените '#10+lbNames.Caption+#10' на один из списка...';
      Label4.AutoSize:=True;
      Label4.Align:=alTop;

      pn2.Top:=Label4.Top+Label4.Height+3;

      Label5.Top:=pn2.Top+pn2.Height+3;
//     Label54.Top:=Label5.Top+Label5.Height+3;

      sS:='';
      if DM.qrSpis.FieldByName('IsPlanSale').AsInteger=1 then sS:=' при выполнении плана';

//     Label5.Caption:='...и получите '+DM.qrSpis.FieldByName('Prize').AsString+' '+BonusStr(DM.qrSpis.FieldByName('Prize').AsCurrency,'')+'  за каждую проданную '+DM.qrSpis.FieldByName('EdName').AsString+' из списка';
//     Label54.Caption:='или '+DM.qrSpis.FieldByName('PrizeUp').AsString+' '+BonusStr(DM.qrSpis.FieldByName('PrizeUp').AsCurrency,'')+' за каждую проданную упаковку'+sS+'.';

//     if DM.qrSpis.FieldByName('Prize').AsFloat=DM.qrSpis.FieldByName('PrizeUp').AsFloat then
      if (DM.qrSpis.FieldByName('Upak').AsInteger=1) or (DM.qrSpis.FieldByName('IsPlanSale').AsInteger=1) then
      begin
//       Label5.Visible:=False;
//       Label54.Top:=Label5.Top;
        Label5.Caption:='...и получите '+DM.qrSpis.FieldByName('PrizeUp').AsString+' '+BonusStr(DM.qrSpis.FieldByName('PrizeUp').AsCurrency,'')+' за каждую проданную упаковку'+sS+'.';
      end
      else
        Label5.Caption:='...и получите '+DM.qrSpis.FieldByName('Prize').AsString+' '+BonusStr(DM.qrSpis.FieldByName('Prize').AsCurrency,'')+'  за каждую проданную '+DM.qrSpis.FieldByName('EdName').AsString+' из списка'+
                        ' или '+DM.qrSpis.FieldByName('PrizeUp').AsString+' '+BonusStr(DM.qrSpis.FieldByName('PrizeUp').AsCurrency,'')+' за каждую проданную упаковку'+sS+'.';

      Label5.AutoSize:=True;
      Label5.AutoSize:=False;
      Label5.Width:=Panel1.Width;

      DM.QrEx.Close;
      DM.QrEx.SQL.Text:='exec spY_GetSumBonus '+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_p)+','+IntToStr(idz)+', '''+FormatDateTime('yyyy-mm-dd',DM.qrSpis.FieldByName('DtStart').AsDateTime)+''','''+FormatDateTime('yyyy-mm-dd',DM.qrSpis.FieldByName('DtEnd').AsDateTime)+'''';
//     DM.QrEx.SQL.SaveToFile('c:\bonus.txt');
      DM.QrEx.Open;

      Label10.Caption:=CurrToStr(DM.QrEx.FieldByName('SumB').AsCurrency);
      Label20.Caption:=BonusStr(DM.QrEx.FieldByName('SumB').AsCurrency,'.');

      Label12.Caption:=CurrToStr(SumBAll);
      Label13.Caption:=BonusStr(SumBAll,'.');

      DM.QrEx.Close;
      DM.QrEx.SQL.Text:='exec spY_AckiiStat '+IntToStr(idz)+','+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_p);
      DM.QrEx.Open;

//     Label15.Caption:=CurrToStr(DM.QrEx.FieldByName('Plan').AsCurrency);
      Label18.Caption:=CurrToStr(DM.QrEx.FieldByName('Cnt').AsCurrency);
//     Label22.Caption:=CurrToStr(DM.QrEx.FieldByName('Prem').AsCurrency);

//     Panel3.Top:=Label54.Top+Label54.Height+10;
      Panel3.Top:=Label5.Top+Label5.Height+10;
      Label8.Caption:=DM.qrSpis.FieldByName('Comment').AsString;

      Height:=Panel1.Top+Panel3.Top+Panel3.Height+Label7.Height+122;
      Top:=(Screen.Height-Height) div 2;

      Panel1.Visible:=True;

      for i:=1 to 4 do TPanel(FindComponent('pnAl'+IntToStr(i))).Visible:=True;
    end
    else
      if Param=2 then // ѕланы продаж на сотрудников
      begin
        id_akcii:=DM.qrSpis.FieldByName('id_plan').AsInteger;
        id_prior:=3;

        DM.QrEx.Close;
//       DM.QrEx.SQL.Text:='exec spY_GetSumBonus '+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_prior)+','+IntToStr(id_akcii)+', '''+FormatDateTime('yyyy-mm-dd',StartOfTheMonth(Date-300))+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',EndOfTheMonth(Date+300))+'''';
        DM.QrEx.SQL.Text:='exec spY_GetSumBonus '+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_prior)+','+IntToStr(id_akcii)+', '''+FormatDateTime('yyyy-mm-dd',DM.qrSpis.FieldByName('DtStart').AsDateTime)+''','''+FormatDateTime('yyyy-mm-dd',DM.qrSpis.FieldByName('DtEnd').AsDateTime)+'''';
        DM.QrEx.Open;

        Label40.Caption:=CurrToStr(DM.QrEx.FieldByName('SumB').AsCurrency);
        Label41.Caption:=BonusStr(DM.QrEx.FieldByName('SumB').AsCurrency,'.');

        Label26.Caption:=CurrToStr(SumBAll);
        Label27.Caption:=BonusStr(SumBAll,'.');

        Label29.Caption:=DM.qrSpis.FieldByName('Plan').AsString;

        Label43.Caption:='- '+DM.qrSpis.FieldByName('Prc1').AsString+'% - '+DM.qrSpis.FieldByName('Prc2').AsString+'%';
        Label44.Caption:='- '+DM.qrSpis.FieldByName('Prc2').AsString+'% - '+DM.qrSpis.FieldByName('Prc3').AsString+'%';
        Label45.Caption:='- >'+DM.qrSpis.FieldByName('Prc3').AsString+'%';

        Label31.Caption:='с '+DM.qrSpis.FieldByName('DtStart').AsString+' по '+DM.qrSpis.FieldByName('DtEnd').AsString;

        Label33.Caption:=CurrToStr(DM.qrSpis.FieldByName('Prize1').AsCurrency);
        Label47.Caption:=CurrToStr(DM.qrSpis.FieldByName('Prize2').AsCurrency);
        Label49.Caption:=CurrToStr(DM.qrSpis.FieldByName('Prize3').AsCurrency);

        Label34.Caption:=BonusStr(DM.qrSpis.FieldByName('Prize1').AsCurrency,'.');
        Label50.Caption:=BonusStr(DM.qrSpis.FieldByName('Prize2').AsCurrency,'.');
        Label51.Caption:=BonusStr(DM.qrSpis.FieldByName('Prize3').AsCurrency,'.');

        DM.QrEx.Close;
        DM.QrEx.SQL.Text:='exec spY_AckiiStat '+IntToStr(id_akcii)+','+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_prior);
        DM.QrEx.Open;

        Label36.Caption:=CurrToStr(DM.QrEx.FieldByName('Prc').AsCurrency);
        Label38.Caption:=CurrToStr(DM.QrEx.FieldByName('Kol').AsCurrency);

        KolRest:=DM.qrSpis.FieldByName('Plan').AsCurrency-DM.QrEx.FieldByName('Kol').AsCurrency;
        if KolRest<0 then KolRest:=0;
        Label89.Caption:=CurrToStr(KolRest);

        Label92.Visible:=False;
        Label93.Visible:=False;
        Label94.Visible:=False;
        Label95.Visible:=False;
        Label96.Visible:=False;
        if DM.qrSpis.FieldByName('AfterOver').AsCurrency>0 then
        begin
          Label92.Visible:=True;
          Label93.Visible:=True;
          Label94.Visible:=True;
          Label95.Visible:=True;
          Label96.Visible:=True;
          Label92.Caption:='ѕри перевыполнении плана (более чем на '+DM.qrSpis.FieldByName('Prc_').AsString+'%)  за каждую упаковку будет';
          Label94.Caption:=DM.qrSpis.FieldByName('AfterOver').AsString;
          Label95.Caption:=BonusStr(DM.qrSpis.FieldByName('AfterOver').AsCurrency,'');
        end
        else
        begin
          Label25.Top:=218;
          Label26.Top:=218;
          Label27.Top:=218;
        end;

        Label24.Caption:=DM.qrSpis.FieldByName('FullDescr').AsString;
        Height:=550;
        Top:=(Screen.Height-Height) div 2;
        Panel4.Visible:=True;
      end
      else
        if Param=5 then // ѕланы продаж на сотрудников групповой
        begin
          id_akcii:=DM.qrSpis.FieldByName('id_plan').AsInteger;
          id_prior:=8;

          DM.QrEx.Close;
          DM.QrEx.SQL.Text:='exec spY_GetSumBonus '+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_prior)+','+IntToStr(id_akcii)+', '''+FormatDateTime('yyyy-mm-dd',DM.qrSpis.FieldByName('DtStart').AsDateTime)+''','''+FormatDateTime('yyyy-mm-dd',DM.qrSpis.FieldByName('DtEnd').AsDateTime)+'''';
          DM.QrEx.Open;

          Label135.Caption:=CurrToStr(DM.QrEx.FieldByName('SumB').AsCurrency);
          Label136.Caption:=BonusStr(DM.QrEx.FieldByName('SumB').AsCurrency,'.');

          Label113.Caption:=DM.qrSpis.FieldByName('PlanTotal').AsString;
          Label115.Caption:='с '+DM.qrSpis.FieldByName('DtStart').AsString+' по '+DM.qrSpis.FieldByName('DtEnd').AsString;

          Label118.Caption:=DM.qrSpis.FieldByName('Plan').AsString;

          DM.QrEx.Close;
          DM.QrEx.SQL.Text:='exec spY_AckiiStat '+IntToStr(id_akcii)+','+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_prior);
          DM.QrEx.Open;

          Label128.Caption:=CurrToStr(DM.QrEx.FieldByName('Prc').AsCurrency);
          Label137.Caption:=CurrToStr(DM.QrEx.FieldByName('Kol').AsCurrency);

          Label110.Caption:=CurrToStr(SumBAll);
          Label111.Caption:=BonusStr(SumBAll,'.');

          Label145.Caption:=DM.qrSpis.FieldByName('FullDescr').AsString;
          Panel10.Visible:=True;
        end
        else
          if Param=3 then // ѕланы продаж на аптеку
          begin

            id_akcii:=DM.qrSpis.FieldByName('id_plan').AsInteger;
            id_prior:=5;

            DM.QrEx.Close;
            DM.QrEx.SQL.Text:='exec spY_GetSumBonus '+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_prior)+','+IntToStr(id_akcii)+', '''+FormatDateTime('yyyy-mm-dd',DM.qrSpis.FieldByName('DtStart').AsDateTime)+''','''+FormatDateTime('yyyy-mm-dd',DM.qrSpis.FieldByName('DtEnd').AsDateTime)+'''';
            DM.QrEx.Open;

            Label77.Caption:=CurrToStr(DM.QrEx.FieldByName('SumB').AsCurrency);
            Label78.Caption:=BonusStr(DM.QrEx.FieldByName('SumB').AsCurrency,'.');

            DM.QrEx.Close;
            DM.QrEx.SQL.Text:='exec spY_AckiiStat '+IntToStr(id_akcii)+','+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_prior);
            DM.QrEx.Open;

            Label56.Caption:=CurrToStr(SumBAll);
            Label57.Caption:=BonusStr(SumBAll,'.');

            Label67.Caption:=CurrToStr(DM.QrEx.FieldByName('PrcApt').AsCurrency);
            Label70.Caption:=CurrToStr(DM.QrEx.FieldByName('KolApt').AsCurrency);

            Label72.Caption:=CurrToStr(DM.QrEx.FieldByName('Prc').AsCurrency);
            Label74.Caption:=CurrToStr(DM.QrEx.FieldByName('Kol').AsCurrency);

            Label84.Caption:=DM.qrSpis.FieldByName('FullDescr').AsString;
            Label62.Caption:='с '+DM.qrSpis.FieldByName('DtStart').AsString+' по '+DM.qrSpis.FieldByName('DtEnd').AsString;

            Label59.Caption:=DM.qrSpis.FieldByName('Plan').AsString;
            Label64.Caption:=DM.qrSpis.FieldByName('FondZav').AsString;
            Label80.Caption:=BonusStr(DM.qrSpis.FieldByName('FondZav').AsCurrency,'.');

            KolRest:=   DM.qrSpis.FieldByName('Plan').AsCurrency-DM.QrEx.FieldByName('Kol').AsCurrency;
            KolRestApt:=DM.qrSpis.FieldByName('Plan').AsCurrency-DM.QrEx.FieldByName('KolApt').AsCurrency;

            if KolRest<0 then KolRest:=0;
            if KolRestApt<0 then KolRestApt:=0;

            Label83.Caption:=CurrToStr(KolRestApt);
            Label86.Caption:=CurrToStr(KolRest);

            Label21.Visible:=False;
            Label54.Visible:=False;
            Label22.Visible:=False;
            Label23.Visible:=False;
            Label91.Visible:=False;
            if DM.qrSpis.FieldByName('AfterOver').AsCurrency>0 then
            begin
              Label21.Visible:=True;
              Label54.Visible:=True;
              Label22.Visible:=True;
              Label23.Visible:=True;
              Label91.Visible:=True;
//       Label21.Caption:='ѕри перевыполнении плана (более чем на '+DM.qrSpis.FieldByName('Prc_').AsString+'%)  за каждую упаковку будет';
              Label22.Caption:=DM.qrSpis.FieldByName('AfterOver').AsString;
              Label23.Caption:=BonusStr(DM.qrSpis.FieldByName('AfterOver').AsCurrency,'');
            end
            else
            begin
              Label55.Top:=228;
              Label56.Top:=228;
              Label57.Top:=228;
            end;

            Height:=550;
            Top:=(Screen.Height-Height) div 2;
            Panel6.Visible:=True;
          end
          else
            if Param=4 then //  омплексна€ покупка
            begin
              id_prior:=6;
              id_p:=6;
              id_akcii:=DM.qrSpis.FieldByName('id_concomit').AsInteger;
              Ep.IsConcomit:=true;
              Ep.IsArtZam:=false;
              Ep.IsPlanSale:=false;
              Ep.IsPlanSaleApt:=false;
              Ep.IsPlanSaleTotal:=false;

              if Ep.IsConcomit then
               begin
                Ep.Ra.id_zam:=DM.qrSpis.FieldByName('id_concomit').AsInteger;
                Ep.Ra.Art_Code:=lbArt.Tag;
                Ep.Ra.Status:=0;
                MainF.RegArtZamena(Ep);
               end;

      //idz:=DM.qrSpis.FieldByName('id_concomit').AsInteger;

              Label98.Caption:=DM.qrSpis.FieldByName('FullDescr').AsString;

              CreateList;
              if High(aList)>-1 then imClick(aList[0].im1);

              DM.QrEx.Close;
              DM.QrEx.SQL.Text:='exec spY_GetSumBonus '+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_prior)+','+IntToStr(id_akcii)+', '''+FormatDateTime('yyyy-mm-dd',DM.qrSpis.FieldByName('DtStart').AsDateTime)+''','''+FormatDateTime('yyyy-mm-dd',DM.qrSpis.FieldByName('DtEnd').AsDateTime)+'''';
              DM.QrEx.Open;

              Label104.Caption:=CurrToStr(DM.QrEx.FieldByName('SumB').AsCurrency);
              Label105.Caption:=BonusStr(DM.QrEx.FieldByName('SumB').AsCurrency,'.');

              Label107.Caption:=CurrToStr(SumBAll);
              Label108.Caption:=BonusStr(SumBAll,'.');

              bbComlect.Visible:=True;
              Panel8.Visible:=True;
{
      idz:=DM.qrSpis.FieldByName('id_zam').AsInteger;
      id_p:=4;
      bbChange.Visible:=True;

      Label4.Caption:='”в. провизоры, замените '#10+lbNames.Caption+#10' на один из списка...';
      Label4.AutoSize:=True;
      Label4.Align:=alTop;

      pn2.Top:=Label4.Top+Label4.Height+3;

      Label5.Top:=pn2.Top+pn2.Height+3;

      sS:='';
      if DM.qrSpis.FieldByName('IsPlanSale').AsInteger=1 then sS:=' при выполнении плана';

      if (DM.qrSpis.FieldByName('Upak').AsInteger=1) or (DM.qrSpis.FieldByName('IsPlanSale').AsInteger=1) then
      begin
        Label5.Caption:='...и получите '+DM.qrSpis.FieldByName('PrizeUp').AsString+' '+BonusStr(DM.qrSpis.FieldByName('PrizeUp').AsCurrency,'')+' за каждую проданную упаковку'+sS+'.';
      end else
        Label5.Caption:='...и получите '+DM.qrSpis.FieldByName('Prize').AsString+' '+BonusStr(DM.qrSpis.FieldByName('Prize').AsCurrency,'')+'  за каждую проданную '+DM.qrSpis.FieldByName('EdName').AsString+' из списка'+
                        ' или '+DM.qrSpis.FieldByName('PrizeUp').AsString+' '+BonusStr(DM.qrSpis.FieldByName('PrizeUp').AsCurrency,'')+' за каждую проданную упаковку'+sS+'.';

      Label5.AutoSize:=True;
      Label5.AutoSize:=False;
      Label5.Width:=Panel1.Width;

      DM.QrEx.Close;
      DM.QrEx.SQL.Text:='exec spY_GetSumBonus '+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_p)+','+IntToStr(idz)+', '''+FormatDateTime('yyyy-mm-dd',DM.qrSpis.FieldByName('DtStart').AsDateTime)+''','''+FormatDateTime('yyyy-mm-dd',DM.qrSpis.FieldByName('DtEnd').AsDateTime)+'''';
      DM.QrEx.Open;

      Label10.Caption:=CurrToStr(DM.QrEx.FieldByName('SumB').AsCurrency);
      Label20.Caption:=BonusStr(DM.QrEx.FieldByName('SumB').AsCurrency,'.');

      Label12.Caption:=CurrToStr(SumBAll);
      Label13.Caption:=BonusStr(SumBAll,'.');

      DM.QrEx.Close;
      DM.QrEx.SQL.Text:='exec spY_AckiiStat '+IntToStr(idz)+','+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_p);
      DM.QrEx.Open;

      Label18.Caption:=CurrToStr(DM.QrEx.FieldByName('Cnt').AsCurrency);

      Panel3.Top:=Label5.Top+Label5.Height+10;
      Label8.Caption:=DM.qrSpis.FieldByName('Comment').AsString;

      Height:=Panel1.Top+Panel3.Top+Panel3.Height+Label7.Height+122;
      Top:=(Screen.Height-Height) div 2;

      Panel1.Visible:=True;

      for i:=1 to 4 do TPanel(FindComponent('pnAl'+IntToStr(i))).Visible:=True;
}
            end;

    if (Ep.IsArtZam) or (Ep.IsConcomit) then
    begin
      Top:=Top+45;
      MoveForms;
    end;

  except
    Height:=195;
    Top:=(Screen.Height-Height) div 2;
  end;

  if Param<>0 then Exit;

  sbLeft.Visible:=True;
  sbRight.Visible:=True;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='spY_GetTopArtWith :art';
  DM.QrEx.Parameters.ParamByName('art').Value:=lbArt.Tag;
  DM.QrEx.Open;
  DM.QrEx.First;
  MoveForms;

  if FIsFirst then
  begin
    FIsFirst:=False;

    for i:=1 to 5 do
    begin
      TLabel(hPokupStatF.FindComponent('lbn'+IntToStr(i))).Visible:=False;
      TLabel(hPokupStatF.FindComponent('lbp'+IntToStr(i))).Caption:='';
      TLabel(hPokupStatF.FindComponent('lbp'+IntToStr(i))).Tag:=0;
    end;

    if DM.QrEx.IsEmpty=False then
    begin
      for i:=1 to DM.QrEx.RecordCount do
      begin
        if i=1 then DM.QrEx.First else DM.QrEx.Next;
        TLabel(hPokupStatF.FindComponent('lbp'+IntToStr(i))).Caption:=DM.QrEx.FieldByName('Names').AsString;
        TLabel(hPokupStatF.FindComponent('lbp'+IntToStr(i))).Tag:=DM.QrEx.FieldByName('Art_Code').AsInteger;
        TLabel(hPokupStatF.FindComponent('lbn'+IntToStr(i))).Visible:=True;
      end;
      sbLeft.Down:=True;
      sbLeftClick(sbLeft);
      Show;
    end;
  end;
end;

procedure TEnterKolNewF.sbLeftClick(Sender:TObject);
var i:Integer;
 begin
  if sbLeft.Tag=0 then
   begin
    sbLeft.Tag:=1;
    hPokupStatF.Show;
    MoveForms;
   end else begin
             sbLeft.Tag:=0;
             hPokupStatF.Close;
            end;
 end;

procedure TEnterKolNewF.edKolChange(Sender:TObject);
 begin
  if TEdit(Sender).Text='' then
   begin
    TEdit(Sender).Text:='0';
    TEdit(Sender).SelectAll;
   end;
 end;

procedure TEnterKolNewF.bbChangeClick(Sender:TObject);
begin
  if DM.qrSpis.IsEmpty then Exit;

  Ep.Ra.Art_Map:=DM.qrSpis.FieldByname('Art_Code').AsInteger;
  Ep.Ra.Status:=1;
  MainF.RegArtZamena(Ep);

  lbArt.Tag:=DM.qrSpis.FieldByname('Art_Code').AsInteger;
  id_akcii:=DM.qrSpis.FieldByname('id_zam').AsInteger;
  id_prior:=4;
  FFlag:=1;
  Close;
end;

procedure TEnterKolNewF.dbg2DblClick(Sender:TObject);
 begin
  bbChangeClick(bbChange);
 end;

procedure TEnterKolNewF.Label11MouseLeave(Sender:TObject);
 begin
  TLabel(Sender).Font.Style:=[];
 end;

procedure TEnterKolNewF.Label11MouseEnter(Sender:TObject);
 begin
  TLabel(Sender).Font.Style:=[fsUnderline];
 end;

procedure TEnterKolNewF.Label11Click(Sender:TObject);
 begin
  ShowPiggyBank;
 end;

procedure TEnterKolNewF.Label25Click(Sender:TObject);
 begin
  ShowPiggyBank;
 end;

procedure TEnterKolNewF.srSpisDataChange(Sender: TObject; Field: TField);
var Pl:TPlanSale;
 begin
  if Ep.IsArtZam=False then Exit;
  if DM.qrSpis.IsEmpty then Exit;
  Pl.Art_Code:=DM.qrSpis.FieldByName('art_code').AsInteger;
  ShowPlanSale(Pl);
  ShowPlanSaleApt(Pl);
 end;

procedure TEnterKolNewF.bbComlectClick(Sender: TObject);
var
  i: Integer;
begin
  if DM.qrSpis.IsEmpty then Exit;
  EP.cArtConc:=0;
  for i:=Low(aList) to High(aList) do
  begin
    if (aList[i].cb1.Checked=True) and (StrToInt(aList[i].edKol.Text)>0) then
    begin
      Inc(EP.cArtConc);
      EP.aArtConc[EP.cArtConc].Art_Code:=aList[i].Art_Code;
      EP.aArtConc[EP.cArtConc].Kol:=StrToInt(aList[i].edKol.Text);
    end;
  end;

  if EP.cArtConc=0 then
  begin
    MainF.MessBox('Ќичего не выбрано из сопутствующих товаров, либо введено нулевое количество');
    Exit;
  end;

  id_akcii:=DM.qrSpis.FieldByname('id_concomit').AsInteger;
  id_prior:=6;
  FFlag:=1;
  Close;

  for i:=0 to Ep.cArtConc do
   begin
    if EP.aArtConc[i].Art_Code <> 0 then
     begin
      Ep.Ra.Art_Map:=EP.aArtConc[i].Art_Code;
      Ep.Ra.Status:=1;
      id_akcii:=DM.qrSpis.FieldByname('ID_CONCOMIT').AsInteger;
      MainF.RegArtZamena(Ep);
    end;
  end;
{
  if DM.qrSpis.IsEmpty then Exit;

  Ep.Ra.Art_Map:=DM.qrSpis.FieldByname('Art_Code').AsInteger;
  Ep.Ra.Status:=1;
  MainF.RegArtZamena(Ep);

  lbArt.Tag:=DM.qrSpis.FieldByname('Art_Code').AsInteger;
  id_akcii:=DM.qrSpis.FieldByname('id_zam').AsInteger;
  id_prior:=4;
  FFlag:=1;
  Close;
}
end;

procedure TEnterKolNewF.cbClick(Sender:TObject);
var Kol,ID:Integer;
 begin
  ID:=TCheckBox(Sender).Tag;

  try
   Kol:=StrToInt(aList[ID].edKol.Text);
  except
   Kol:=0;
  end;

  if (TCheckBox(Sender).Checked=True) and (Kol<=0) then
   begin
    aList[ID].edKol.Text:='1';
   end;

 end;

end.

{

delete from skd_limit where type_skd=16

insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(45443 ,33,0.01,1,'2016-12-14','2016-12-23 23:59:59')

}



