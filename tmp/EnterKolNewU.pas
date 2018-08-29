unit EnterKolNewU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, OpenLib, Util, Buttons, Grids, DBGrids, DateUtils;

type

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
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
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
    Label54: TLabel;
    Label60: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;

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

  private

    FFlag:Integer;
    FParam:Integer;
    FIsFirst:Boolean;
    Fid_akcii:Integer;
    Fid_prior:Integer;

  public

    procedure MoveForms;

    property  Flag:Integer read FFlag;
    property  Param:Integer read FParam write FParam;
    property  id_akcii:Integer read Fid_akcii write Fid_akcii;
    property  id_prior:Integer read Fid_prior write Fid_prior;

  end;

var EnterKolNewF:TEnterKolNewF;

implementation

{$R *.dfm}

uses MainU, hSosputstvU, hPokupStatU, DataModuleU, PiggyBankU, ShareU;

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

  MakeGradientHeightI(ImL,clWhite,$00E4E4F0,0,0,imL.Width,imL.Height);
  MakeGradientHeightI(ImR,clWhite,$00E4E4F0,0,0,imR.Width,imR.Height);

  Label2.Caption:=Prm.UserName;

 end;

procedure TEnterKolNewF.edKolKeyPress(Sender:TObject; var Key:Char);
var P:Integer;
 begin
  if Key<>#8 then
   begin
    if Not (Key in ['0'..'9']) then Key:=#0;
   end;

 {  if Key<>#8 then
   begin
    if Not (Key in CH_DIGIT) then Key:=#0;
   end else begin
             Key:=#0;
             TEdit(Sender).SelectAll;
            end;
}
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
 begin
  hSoputstvF.Left:=Left-100;
  hSoputstvF.Top:=Top-hSoputstvF.Height-2;
  hPokupStatF.Top:=Top+8;
  hPokupStatF.Left:=Left-hPokupStatF.Width-5;
 end;

procedure TEnterKolNewF.FormConstrainedResize(Sender:TObject; var MinWidth,MinHeight,MaxWidth,MaxHeight:Integer);
 begin
  MoveForms;
 end;

procedure TEnterKolNewF.FormActivate(Sender:TObject);
var Param,idz,i:Integer;
    SumBAll:Currency;
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
     DM.qrSpis.SQL.Text:='exec spY_PlanSale '+IntToStr(lbArt.Tag)+' null,null,0 ';
     DM.qrSpis.Open;
     if DM.qrSpis.IsEmpty=False then Param:=2 else
      begin
       DM.qrSpis.Close;
       DM.qrSpis.SQL.Clear;
       DM.qrSpis.SQL.Text:='exec spY_PlanSale '+IntToStr(lbArt.Tag)+' null,null,1 ';
       DM.qrSpis.Open;
       if DM.qrSpis.IsEmpty=False then Param:=3;
      end
    end;

   if Param=0 then Abort;

   DM.QrEx.Close;
//   DM.QrEx.SQL.Text:='exec spY_GetSumBonusAll '+IntToStr(Prm.ID_Gamma)+','''+FormatDateTime('yyyy-mm-dd',StartOfTheMonth(Date))+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',EndOfTheMonth(Date))+'''';
   DM.QrEx.SQL.Text:='exec spY_GetSumBonusAll '+IntToStr(Prm.ID_Gamma)+','''+FormatDateTime('yyyy-mm-dd',StartOfTheMonth(Date))+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',EndOfTheMonth(Date))+'''';
   DM.QrEx.Open;

   SumBAll:=DM.QrEx.FieldByName('SumB').AsCurrency;

   if Param=1 then  // Замны препаратов для сотрудников
    begin

     idz:=DM.qrSpis.FieldByName('id_zam').AsInteger;

     bbChange.Visible:=True;

     Label4.Caption:='Ув. провизоры, замените '#10+lbNames.Caption+#10' на один из списка...';
     Label4.AutoSize:=True;
     Label4.Align:=alTop;

     pn2.Top:=Label4.Top+Label4.Height+3;

     Label5.Top:=pn2.Top+pn2.Height+3;
     Label54.Top:=Label5.Top+Label5.Height+3;

     Label5.Caption:='...и получите '+DM.qrSpis.FieldByName('Prize').AsString+' грн за каждую проданную '+DM.qrSpis.FieldByName('EdName').AsString+' из списка';
     Label54.Caption:='или '+DM.qrSpis.FieldByName('PrizeUp').AsString+' грн за каждую проданную упаковку.';

     if DM.qrSpis.FieldByName('Prize').AsFloat=DM.qrSpis.FieldByName('PrizeUp').AsFloat then
      begin
       Label5.Visible:=False;
       Label54.Top:=Label5.Top;
       Label54.Caption:='...и получите '+DM.qrSpis.FieldByName('PrizeUp').AsString+' грн за каждую проданную упаковку.';
      end;

     Label5.AutoSize:=True;
     Label5.AutoSize:=False;
     Label5.Width:=Panel1.Width;

     DM.QrEx.Close;
     DM.QrEx.SQL.Text:='exec spY_GetSumBonus '+IntToStr(Prm.ID_Gamma)+',4,'+IntToStr(idz)+', '''+FormatDateTime('yyyy-mm-dd',DM.qrSpis.FieldByName('DtStart').AsDateTime)+''','''+FormatDateTime('yyyy-mm-dd',DM.qrSpis.FieldByName('DtEnd').AsDateTime)+'''';
     DM.QrEx.Open;
     Label10.Caption:=CurrToStr(DM.QrEx.FieldByName('SumB').AsCurrency);

     Label12.Caption:=CurrToStr(SumBAll);

     DM.QrEx.Close;
     DM.QrEx.SQL.Text:='exec spY_AckiiStat '+IntToStr(idz)+','+IntToStr(Prm.ID_Gamma)+',4 ';
     DM.QrEx.Open;

//     Label15.Caption:=CurrToStr(DM.QrEx.FieldByName('Plan').AsCurrency);
     Label18.Caption:=CurrToStr(DM.QrEx.FieldByName('Cnt').AsCurrency);
//     Label22.Caption:=CurrToStr(DM.QrEx.FieldByName('Prem').AsCurrency);

     Panel3.Top:=Label54.Top+Label54.Height+10;
     Label8.Caption:=DM.qrSpis.FieldByName('Comment').AsString;

     Height:=Panel1.Top+Panel3.Top+Panel3.Height+Label7.Height+122;
     Top:=(Screen.Height-Height) div 2;

     Panel1.Visible:=True;

     for i:=1 to 4 do TPanel(FindComponent('pnAl'+IntToStr(i))).Visible:=True;

    end else
   if Param in [2,3] then // Планы продаж
    begin

     id_akcii:=DM.qrSpis.FieldByName('id_plan').AsInteger;
     Case Param of
      2:id_prior:=3;
      3:id_prior:=5;
     end; 

     if Param=3 then
      begin
       Label32.Caption:='общая премия для всего коллектив аптеки будет';
       Label46.Caption:='общая премия для всего коллектив аптеки будет';
       Label48.Caption:='общая премия для всего коллектив аптеки будет';

       Label33.Left:=365; Label34.Left:=420;
       Label47.Left:=365; Label50.Left:=420;
       Label49.Left:=365; Label51.Left:=420;

       Label35.Caption:='Коллектив Вашей аптеки уже выполнил';
       Label35.Left:=222; Label36.Left:=275; Label38.Left:=335; Label60.Left:=385;

       Label39.Left:=15; Label39.Top:=230;
       Label40.Left:=225; Label40.Top:=230;
       Label40.Left:=275; Label41.Top:=230;

       Label25.Top:=230; Label26.Top:=230; Label27.Top:=230;
       Label39.Caption:='Лично Вы уже заработали по этой акции';
      end;

     DM.QrEx.Close;
//     DM.QrEx.SQL.Text:='exec spY_GetSumBonus '+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_prior)+','+IntToStr(id_akcii)+', '''+FormatDateTime('yyyy-mm-dd',StartOfTheMonth(Date-300))+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',EndOfTheMonth(Date+300))+'''';
     DM.QrEx.SQL.Text:='exec spY_GetSumBonus '+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_prior)+','+IntToStr(id_akcii)+', '''+FormatDateTime('yyyy-mm-dd',DM.qrSpis.FieldByName('DtStart').AsDateTime)+''','''+FormatDateTime('yyyy-mm-dd',DM.qrSpis.FieldByName('DtEnd').AsDateTime)+'''';
     DM.QrEx.Open;
     Label40.Caption:=CurrToStr(DM.QrEx.FieldByName('SumB').AsCurrency);

     Label26.Caption:=CurrToStr(SumBAll);

     Label29.Caption:=DM.qrSpis.FieldByName('Plan').AsString;

     Label43.Caption:='- '+DM.qrSpis.FieldByName('Prc1').AsString+'% - '+DM.qrSpis.FieldByName('Prc2').AsString+'%';
     Label44.Caption:='- '+DM.qrSpis.FieldByName('Prc2').AsString+'% - '+DM.qrSpis.FieldByName('Prc3').AsString+'%';
     Label45.Caption:='- >'+DM.qrSpis.FieldByName('Prc3').AsString+'%';

     Label31.Caption:='с '+DM.qrSpis.FieldByName('DtStart').AsString+' по '+DM.qrSpis.FieldByName('DtEnd').AsString;

     Label33.Caption:=CurrToStr(DM.qrSpis.FieldByName('Prize1').AsCurrency);
     Label47.Caption:=CurrToStr(DM.qrSpis.FieldByName('Prize2').AsCurrency);
     Label49.Caption:=CurrToStr(DM.qrSpis.FieldByName('Prize3').AsCurrency);

     DM.QrEx.Close;
     DM.QrEx.SQL.Text:='exec spY_AckiiStat '+IntToStr(id_akcii)+','+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_prior);
     DM.QrEx.Open;

     Label36.Caption:=CurrToStr(DM.QrEx.FieldByName('Prc').AsCurrency);
     Label38.Caption:=CurrToStr(DM.QrEx.FieldByName('Kol').AsCurrency);

     Label24.Caption:=DM.qrSpis.FieldByName('FullDescr').AsString;
     Case param of
      2:Height:=483;
      3:Height:=497;
     end;
     Panel4.Visible:=True;
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

end.



