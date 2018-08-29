unit MotivationSystemU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, jpeg, ExtCtrls, ExtImage, OpenLib, Buttons, Grids,
     DBGrids, DB, ADODB, Util, DateUtils, DBCtrls, PrintReport;

const dy=40;

type

  TList=Array of Record
                  //Lb1:TLabel;
                  //Lb2:TLabel;
                  ID:Integer;
                  NumP:Integer;
                  Names:String;
                  Im:TExtImage;
                  Active:Boolean;
                  Order:Integer;
                 end;

  TMotivationSystemF = class(TForm)

    lbUser: TLabel;
    Image1: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    sb1: TScrollBox;
    Memo1: TMemo;
    Label2: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    lb1: TLabel;
    imHead1: TImage;
    imHead2: TImage;
    pn4: TPanel;
    Panel5: TPanel;
    im1_4: TImage;
    lb2: TLabel;
    dbg_2: TDBGrid;
    Panel4: TPanel;
    im2_4: TImage;
    Label4: TLabel;
    dbg_1: TDBGrid;
    qr4_1: TADOQuery;
    qr4_2: TADOQuery;
    ds4_1: TDataSource;
    ds4_2: TDataSource;
    Label6: TLabel;
    Image2: TImage;
    lbBonusAll: TLabel;
    Panel6: TPanel;
    DBGrid2: TDBGrid;
    qr3_1: TADOQuery;
    ds3_1: TDataSource;
    pn3: TPanel;
    Panel8: TPanel;
    im1_3: TImage;
    Label8: TLabel;
    dbg_3: TDBGrid;
    lbPeriod: TLabel;
    lbBonus_: TLabel;
    Bevel1: TBevel;
    lbBonus: TLabel;
    qr3_2: TADOQuery;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label48: TLabel;
    Label46: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label47: TLabel;
    Label49: TLabel;
    Label51: TLabel;
    Label50: TLabel;
    Label34: TLabel;
    pn7: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    cbActual: TCheckBox;
    pn5: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Panel9: TPanel;
    im1_5: TImage;
    Label26: TLabel;
    dbg_4: TDBGrid;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    qr5_1: TADOQuery;
    ds5_1: TDataSource;
    qr5_2: TADOQuery;
    lbGrn: TLabel;
    bbStatPlan: TBitBtn;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label60: TLabel;
    qr3_3: TADOQuery;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    qr4_3: TADOQuery;
    Panel7: TPanel;
    Label22: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label31: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label70: TLabel;
    Label69: TLabel;
    qr5_3: TADOQuery;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Shape1: TShape;
    Label79: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label86: TLabel;
    Label83: TLabel;
    Label85: TLabel;
    Label87: TLabel;
    Shape2: TShape;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    pn1: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    Bevel2: TBevel;
    Label41: TLabel;
    Bevel3: TBevel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    pn_8_: TPanel;
    Label58: TLabel;
    qr8_1: TADOQuery;
    Label59: TLabel;
    Bevel4: TBevel;
    qr8_2: TADOQuery;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label20: TLabel;
    bbTotalStat: TBitBtn;
    pn6: TPanel;
    Panel11: TPanel;
    im1_6: TImage;
    Label76: TLabel;
    dbg6_1: TDBGrid;
    Panel12: TPanel;
    im2_6: TImage;
    Label77: TLabel;
    dbg6_2: TDBGrid;
    qr6_1: TADOQuery;
    ds6_1: TDataSource;
    qr6_2: TADOQuery;
    ds6_2: TDataSource;
    Edit1: TEdit;
    Label78: TLabel;
    SpeedButton1: TSpeedButton;
    pn8: TPanel;
    Label80: TLabel;
    Label84: TLabel;
    Label91: TLabel;
    Panel13: TPanel;
    im1_8: TImage;
    Label118: TLabel;
    dbg_8: TDBGrid;
    ds8_1: TDataSource;
    Label92: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label106: TLabel;
    qr8_3: TADOQuery;
    Panel10: TPanel;
    dbg8_2: TDBGrid;
    im2_8: TImage;
    DBText1: TDBText;
    qr8_4: TADOQuery;
    ds8_4: TDataSource;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    BitBtn1: TBitBtn;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure imMouseEnter(Sender: TObject);
    procedure imMouseLeave(Sender: TObject);
    procedure imClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure cbActualClick(Sender: TObject);
    procedure bbStatPlanClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure bbTotalStatClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure lbUserDblClick(Sender: TObject);
    procedure dbg8_2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);

  private

    procedure ClearList;
    procedure CreateList;
    procedure DrawCell(Num:Integer; P:Byte);
    procedure srAkciiListDataChange(Sender: TObject; Field: TField);
    procedure ReopenList(ID: Integer; Param: Byte);
    procedure srDataChange;

  public

    aList:TList;
    Dt:TDatetime;
    CurrentID:Integer;

  end;

var MotivationSystemF: TMotivationSystemF;


implementation

uses DataModuleU, MainU, PiggyBankU, ShareU, ShowStatPlanAptU, TotalStatU;

{$R *.dfm}

procedure TMotivationSystemF.ClearList;
var i:Integer;
 begin
  for i:=Low(aList) to High(aList) do aList[i].Im.Free;
  SetLength(AList,0);
 end;

procedure TMotivationSystemF.DrawCell(Num:Integer; P:Byte);
var im:TExtImage;
 begin

  im:=aList[Num].Im;

  Case P of
   0:im.Canvas.Brush.Color:=$00E0ECDF;
   1:im.Canvas.Brush.Color:=$009FC59C;
  end;

  im.Canvas.FillRect(Rect(0,0,im.Width,im.Height));
  if aList[Num].Active=False then
   begin
    im.Canvas.Font.Color:=clBlack;
    im.Canvas.Font.Style:=[fsBold];
   end else begin
             im.Canvas.Font.Color:=clMaroon;
             im.Canvas.Font.Style:=[fsUnderline,fsBold];
            end;

  im.Canvas.TextOut(5,5,'Приоритет № -'+IntToStr(aList[Num].Order));

  im.Canvas.Font.Style:=[];

  DrawWrapedText(im.Canvas,Memo1,Rect(111,5,331,Im.Height),aList[Num].Names);

 end;

procedure TMotivationSystemF.srAkciiListDataChange(Sender:TObject; Field:TField);
 begin
  srDataChange;
 end;

procedure TMotivationSystemF.srDataChange;
var qr:TADOQuery;
    ID:Integer;
    KolPlan,KolRest,KolRestApt:Currency;
 begin

  lb1.Caption:='';
  lbPeriod.Caption:='';
  lbBonus_.Caption:='';
  lbBonus.Caption:='';
  lbGrn.Visible:=False;
  bbStatPlan.Visible:=False;
  Panel10.Visible:=False;

  if DM.qrAkciiList.IsEmpty then Exit;

  lb1.Caption:=DM.qrAkciiList.FieldByName('FullDescr').AsString;

  try
   ID:=DM.qrAkciiList.FieldByName('ID').AsInteger;
   Case ID of
    3:begin // План продаж на сотрудника
       im1_3.Picture:=nil;
       MakeGradientWidthI(im1_3,clGreen,$00C1EFAD);

       qr3_1.Close;
       qr3_1.SQL.Text:='exec spY_PlanSaleList '+DM.qrAkciiList.FieldByName('IDP').AsString+
                       ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''''+
                       ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+''',0';
       qr3_1.Open;

       qr:=qr3_1;

       Label29.Caption:='0';
       Label42.Visible:=False;
       Label43.Visible:=False;
       Label44.Visible:=False;
       Label45.Visible:=False;

       Label33.Visible:=False;
       Label47.Visible:=False;
       Label49.Visible:=False;

       if qr3_1.IsEmpty=False then
        begin

         qr3_2.Close;
         qr3_2.SQL.Clear;
         qr3_2.SQL.Text:='exec spY_PlanSale '+qr3_1.FieldByName('art_code').AsString+
                         ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''''+
                         ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+''',0';
         qr3_2.Open;

         Label29.Caption:=qr3_2.FieldByName('Plan').AsString;
         KolPlan:=qr3_2.FieldByName('Plan').AsInteger;

         Label43.Caption:='- '+qr3_2.FieldByName('Prc1').AsString+'% - '+qr3_2.FieldByName('Prc2').AsString+'%';
         Label44.Caption:='- '+qr3_2.FieldByName('Prc2').AsString+'% - '+qr3_2.FieldByName('Prc3').AsString+'%';
         Label45.Caption:='- >'+qr3_2.FieldByName('Prc3').AsString+'%';

         Label33.Caption:=CurrToStr(qr3_2.FieldByName('Prize1').AsCurrency);
         Label47.Caption:=CurrToStr(qr3_2.FieldByName('Prize2').AsCurrency);
         Label49.Caption:=CurrToStr(qr3_2.FieldByName('Prize3').AsCurrency);

         Label34.Caption:=BonusStr(qr3_2.FieldByName('Prize1').AsCurrency,'.');
         Label50.Caption:=BonusStr(qr3_2.FieldByName('Prize2').AsCurrency,'.');
         Label51.Caption:=BonusStr(qr3_2.FieldByName('Prize3').AsCurrency,'.');

         Label16.Visible:=False;
         Label17.Visible:=False;
         Label18.Visible:=False;
         Label19.Visible:=False;
         Label20.Visible:=False;
         if qr3_2.FieldByName('AfterOver').AsCurrency>0 then
          begin
           Label16.Visible:=True;
           Label17.Visible:=True;
           Label18.Visible:=True;
           Label19.Visible:=True;
           Label20.Visible:=True;
//           Label16.Caption:='При перевыполнении плана (более чем на '+qr3_2.FieldByName('Prc_').AsString+'%)  за каждую упаковку будет';
           Label18.Caption:=qr3_2.FieldByName('AfterOver').AsString;
           Label19.Caption:=BonusStr(qr3_2.FieldByName('AfterOver').AsCurrency,'');
          end;

         Label42.Visible:=True;
         Label43.Visible:=True;
         Label44.Visible:=True;
         Label45.Visible:=True;

         Label33.Visible:=True;
         Label47.Visible:=True;
         Label49.Visible:=True;

         qr3_3.Close;
         qr3_3.SQL.Text:='exec spY_AckiiStat '+DM.qrAkciiList.FieldByName('IDP').AsString+','+IntToStr(Prm.ID_Gamma)+',3,'+
                         ''''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''','''+
                         FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+'''';
         qr3_3.Open;

         Label36.Caption:=CurrToStr(qr3_3.FieldByName('Prc').AsCurrency);
         Label38.Caption:=CurrToStr(qr3_3.FieldByName('Kol').AsCurrency);

         KolRest:=KolPlan-qr3_3.FieldByName('Kol').AsCurrency;
         if KolRest<0 then KolRest:=0;
         Label89.Caption:=CurrToStr(KolRest);

        end;

      end;
    4:begin  // Фармзамены
       im1_4.Picture:=nil;
       im2_4.Picture:=nil;
       MakeGradientWidthI(im1_4,clGreen,$00C1EFAD);
       MakeGradientWidthI(im2_4,clGreen,$00C1EFAD);


       qr4_1.Close;
       qr4_1.SQL.Text:='exec spY_ArtZamenaList '+DM.qrAkciiList.FieldByName('IDP').AsString+',1'+
                       ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''''+
                       ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+'''';
       qr4_1.Open;

       qr:=qr4_1;

       qr4_2.Close;
       qr4_2.SQL.Text:='exec spY_ArtZamenaList '+DM.qrAkciiList.FieldByName('IDP').AsString+',2';
       qr4_2.Open;

       Panel7.Visible:=False;
       Panel4.Height:=256;
       if Screen.Width>1200 then
        begin
         dbg_1.Columns[1].Width:=572;
         Panel4.Width:=836;
        end;

       if DM.qrAkciiList.FieldByName('id_plan').AsInteger>0 then
        begin
         Panel4.Height:=192;
         qr4_3.Close;
         qr4_3.SQL.Text:='exec spY_PlanSale '+DM.qrAkciiList.FieldByName('art_code').AsString+
                         ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''''+
                         ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+''',0';
         qr4_3.Open;
         Label21.Caption:='Действует вместе с планом продаж по акции "'+qr4_3.FieldByName('Descr').AsString+'"';
         Label23.Caption:=qr4_3.FieldByName('Plan').AsString;
         KolPlan:=qr4_3.FieldByName('Plan').AsCurrency;

         qr4_3.Close;
         qr4_3.SQL.Text:='exec spY_AckiiStat '+DM.qrAkciiList.FieldByName('id_plan').AsString+','+IntToStr(Prm.ID_Gamma)+',3,'+
                         ''''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''','''+
                         FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+'''';
         qr4_3.Open;
         KolRest:=KolPlan-qr4_3.FieldByName('Kol').AsCurrency;
         if KolRest<0 then KolRest:=0;
         Label27.Caption:=CurrToStr(KolRest);

         Panel7.Visible:=True;
        end;
      end;
    5:begin // План продаж на аптеку
       im1_5.Picture:=nil;
       MakeGradientWidthI(im1_5,clGreen,$00C1EFAD);

       qr5_1.Close;
       qr5_1.SQL.Text:='exec spY_PlanSaleList '+DM.qrAkciiList.FieldByName('IDP').AsString+
                       ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''''+
                       ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+''',1';
       qr5_1.Open;

       qr:=qr5_1;
       if qr5_1.IsEmpty=False then
        begin

         qr5_2.Close;
         qr5_2.SQL.Clear;
         qr5_2.SQL.Text:='exec spY_PlanSale '+qr5_1.FieldByName('art_code').AsString+
                         ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''''+
                         ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+''',1';
         qr5_2.Open;

         Label11.Caption:=qr5_2.FieldByName('Plan').AsString;
         Label14.Caption:=qr5_2.FieldByName('FondZav').AsString;
         KolPlan:=qr5_2.FieldByName('Plan').AsCurrency;

         Label53.Visible:=False;
         Label54.Visible:=False;
         Label55.Visible:=False;
         Label56.Visible:=False;
         Label57.Visible:=False;
         if qr5_2.FieldByName('AfterOver').AsCurrency>0 then
          begin
           Label53.Visible:=True;
           Label54.Visible:=True;
           Label55.Visible:=True;
           Label56.Visible:=True;
           Label57.Visible:=True;
//           Label53.Caption:='При перевыполнении плана (более чем на '+qr5_2.FieldByName('Prc_').AsString+'%)  за каждую упаковку будет';
           Label55.Caption:=qr5_2.FieldByName('AfterOver').AsString;
           Label56.Caption:=BonusStr(qr5_2.FieldByName('AfterOver').AsCurrency,'');
          end;

         qr5_3.Close;
         qr5_3.SQL.Text:='exec spY_AckiiStat '+DM.qrAkciiList.FieldByName('IDP').AsString+','+IntToStr(Prm.ID_Gamma)+',5,'+
                         ''''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''','''+
                         FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+'''';
//         qr5_3.SQL.SaveToFile('C:\akc.txt');
         qr5_3.Open;

         Label67.Caption:=CurrToStr(qr5_3.FieldByName('PrcApt').AsCurrency);
         Label70.Caption:=CurrToStr(qr5_3.FieldByName('KolApt').AsCurrency);

         Label72.Caption:=CurrToStr(qr5_3.FieldByName('Prc').AsCurrency);
         Label74.Caption:=CurrToStr(qr5_3.FieldByName('Kol').AsCurrency);

         KolRest:=   KolPlan-qr5_3.FieldByName('Kol').AsCurrency;
         KolRestApt:=KolPlan-qr5_3.FieldByName('KolApt').AsCurrency;

         if KolRest<0 then KolRest:=0;
         if KolRestApt<0 then KolRestApt:=0;

         Label83.Caption:=CurrToStr(KolRestApt);
         Label86.Caption:=CurrToStr(KolRest);

        end;
      end;
    6:begin
       im1_6.Picture:=nil;
       im2_6.Picture:=nil;
       MakeGradientWidthI(im1_6,clGreen,$00C1EFAD);
       MakeGradientWidthI(im2_6,clGreen,$00C1EFAD);


       qr6_1.Close;
       qr6_1.SQL.Text:='exec spY_ConcomitList '+DM.qrAkciiList.FieldByName('IDP').AsString+',1'+
                       ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''''+
                       ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+'''';
       qr6_1.Open;

       qr:=qr6_1;

       qr6_2.Close;
       qr6_2.SQL.Text:='exec spY_ConcomitList '+DM.qrAkciiList.FieldByName('IDP').AsString+',2'+
                       ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''''+
                       ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+'''';
       qr6_2.Open;
      end;
   (*
    8:begin  // План по сбору сдачи (если внедрять изменить номер на другой)
       qr8_1.Close;
       qr8_1.SQL.Text:='exec spY_PlanSaleList '+DM.qrAkciiList.FieldByName('IDP').AsString+
                       ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''''+
                       ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+''',2';
       qr8_1.Open;

       qr:=qr8_1;

       qr8_2.Close;
       qr8_2.SQL.Text:='exec spY_PlanCash '+DM.qrAkciiList.FieldByName('IDP').AsString;
       qr8_2.Open;
       pn8.Visible:=False;
       if qr8_2.FieldByName('Plan').AsCurrency>0 then
        begin
         pn8.Visible:=True;
         Label59.Visible:=True;
         Label58.Caption:='При выполнении плана по сбору сдачи на '+qr8_2.FieldByName('Plan').AsString+
                          ' грн за месяц вы получите '+qr8_2.FieldByName('Prc').AsString+
                          '%('+qr8_2.FieldByName('Summ').AsString+' грн) от данной суммы';

         qr8_2.Close;
         qr8_2.SQL.Text:='exec spY_AckiiStat '+DM.qrAkciiList.FieldByName('IDP').AsString+','+IntToStr(Prm.ID_Gamma)+',8,'+
                         ''''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''','''+
                         FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+'''';
//         qr8_2.SQL.SaveToFile('c:\log\ac.txt');
         qr8_2.Open;

         Label62.Caption:=CurrToStr(qr8_2.FieldByName('Prc').AsCurrency);
         Label64.Caption:=CurrToStr(qr8_2.FieldByName('Summ').AsCurrency);
        end;
      end;
     *)
    8:begin
       im1_8.Picture:=nil;
       MakeGradientWidthI(im1_8,clGreen,$00C1EFAD);

       qr8_1.Close;
       qr8_1.SQL.Text:='exec spY_PlanSaleList '+DM.qrAkciiList.FieldByName('IDP').AsString+
                       ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''''+
                       ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+''',3';
       qr8_1.Open;

       qr:=qr8_1;
       Label84.Caption:='0';

       qr8_4.Close;
       qr8_4.SQL.Text:='exec spY_GetSumBonus '+IntToStr(Prm.ID_Gamma)+',8,'
                                              +DM.qrAkciiList.FieldByName('IDP').AsString+', '''
                                              +FormatDateTime('yyyy-mm-dd',qr.FieldByName('DtStart').AsDateTime)+''','''
                                              +FormatDateTime('yyyy-mm-dd',qr.FieldByName('DtEnd').AsDateTime)+''',1';
       qr8_4.Open;

       if qr8_4.IsEmpty=False then
        begin
         dbg8_2.Columns[2].Title.Caption:=qr8_4.FieldByName('Prc1').AsString+'%';
         dbg8_2.Columns[3].Title.Caption:=qr8_4.FieldByName('Prc2').AsString+'%';
         dbg8_2.Columns[4].Title.Caption:=qr8_4.FieldByName('Prc3').AsString+'%';
         dbg8_2.Columns[5].Title.Caption:=qr8_4.FieldByName('Prc4').AsString+'%';

         Panel10.Visible:=True;
        end;

       if qr8_1.IsEmpty=False then
        begin

         qr8_2.Close;
         qr8_2.SQL.Clear;
         qr8_2.SQL.Text:='exec spY_PlanSale '+qr8_1.FieldByName('art_code').AsString+
                         ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''''+
                         ','''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+''',2';
         qr8_2.Open;

         Label84.Caption:=qr8_2.FieldByName('PlanTotal').AsString;

         qr8_3.Close;
         qr8_3.SQL.Text:='exec spY_AckiiStat '+DM.qrAkciiList.FieldByName('IDP').AsString+','+IntToStr(Prm.ID_Gamma)+',8,'+
                         ''''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''','''+
                         FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+'''';
         qr8_3.Open;

         Label106.Caption:=CurrToStr(qr8_3.FieldByName('Prc').AsCurrency);
         Label108.Caption:=CurrToStr(qr8_3.FieldByName('Kol').AsCurrency);

//         Label94.Caption:=CurrToStr(qr8_3.FieldByName('CntFull').AsCurrency)+' ('+CurrToStr(qr8_3.FieldByName('KolUp1').AsCurrency)+' уп.)';
         Label94.Caption:=CurrToStr(qr8_4.FieldByName('CntFull').AsCurrency)+' ('+CurrToStr(qr8_3.FieldByName('KolUp1').AsCurrency)+' уп.)';
         Label96.Caption:=CurrToStr(qr8_3.FieldByName('CntAll').AsCurrency);

        end;
      end;
   end;

   if qr.FieldByName('DtStart').AsDateTime>0 then
    lBPeriod.Caption:='Период действия: с '+qr.FieldByName('DtStart').AsString+' по '+qr.FieldByName('DtEnd').AsString;

   DM.QrEx1.Close;
   DM.QrEx1.SQL.Text:='exec spY_GetSumBonus '+IntToStr(Prm.ID_Gamma)+','
                                             +DM.qrAkciiList.FieldByName('ID').AsString+','
                                             +DM.qrAkciiList.FieldByName('IDP').AsString+', '''
                                             +FormatDateTime('yyyy-mm-dd',qr.FieldByName('DtStart').AsDateTime)+''','''
                                             +FormatDateTime('yyyy-mm-dd',qr.FieldByName('DtEnd').AsDateTime)+'''';

{
   try
    DM.QrEx1.SQL.SaveToFile('C:\Log\SumB.txt');
   except
   end;
}
   DM.QrEx1.Open;
   if ID=5 then
    begin

     lbBonus_.Caption:='Текущий бонус аптеки: ';
     lbGrn.Visible:=True;
     lbBonus.Caption:=CurrToStr(DM.QrEx1.FieldByName('SumB').AsCurrency);
     bbStatPlan.Visible:=True;

    end else begin

              lbGrn.Visible:=True;
              lbBonus_.Caption:='Бонусов за период акции:';
              lbBonus.Caption:=CurrToStr(DM.QrEx1.FieldByName('SumB').AsCurrency);

             end;

   lbBonus.Left:=lbBonus_.Left+lbBonus_.Width+5;
   lbGrn.Left:=lbBonus.Left+lbBonus.Width+5;

  except
   on E:Exception do MainF.RegisterError('Система мотивации: ',E.Message,True);
  end;

 end;

procedure TMotivationSystemF.CreateList;
var i:Integer;

 begin
  try

   DM.QrEx.Close;
//   DM.QrEx.SQL.Text:='select * from SprPrioritet order by Order_ ';
   DM.QrEx.SQL.Text:='exec spY_PrioritetList ';
   DM.QrEx.Open;

   sb1.VertScrollBar.Position:=0;

   ClearList;

   SetLength(aList,DM.QrEx.RecordCount);

   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;

     aList[i-1].Active:=False;
     aList[i-1].ID:=DM.QrEx.FieldByName('ID').AsInteger;
     aList[i-1].NumP:=DM.QrEx.FieldByName('NumPrioritet').AsInteger;
     aList[i-1].Names:=DM.QrEx.FieldByName('Names').AsString;
     aList[i-1].Order:=DM.QrEx.FieldByName('Order_').AsInteger;

     aList[i-1].Im:=TExtImage.Create(nil);

     With aList[i-1].Im do
      begin

       Parent:=sb1;
       Left:=0;
       Top:=(i-1)*dy;
       Height:=dy-1;
       Width:=sb1.Width-16;
       ShowHint:=True;

       OnMouseEnter:=imMouseEnter;
       OnMouseLeave:=imMouseLeave;

       OnClick:=imClick;

       Tag:=i-1;

      end;

     DrawCell(i-1,0);

     DM.srAkciiList.OnDataChange:=srAkciiListDataChange;

{
     aList[i-1].Lb1:=Tlabel.Create(nil);
     With aList[i-1].Lb1 do
      begin
       Parent:=sb1;
       Left:=5;
       Top:=(i-1)*dy+5;
       Font.Style:=[fsBold];
       Caption:='Приоритет № -'+DM.QrEx.FieldByName('NumPrioritet').AsString;
      end;

     aList[i-1].Lb2:=TLabel.Create(nil);
     With aList[i-1].Lb2 do
      begin
       Parent:=sb1;

       Left:=111;
       Top:=(i-1)*dy+5;
       WordWrap:=True;
       Caption:=DM.QrEx.FieldByName('Names').AsString;
       Width:=220;
      end;
}
    end;

  except
   on E:Exception do MainF.MessBox('Ошибка формирования списка: '+E.Message);
  end;
 end;

procedure TMotivationSystemF.FormCreate(Sender: TObject);
var i:Integer;
 begin

  CurrentID:=-1;
  Caption:=MFC;
  CreateList;

  MakeGradientWidthI(imHead1,$0083582E,$00CFA376);
  MakeGradientWidthI(imHead2,$00000380,$000004B9);

  Dt:=Date;

//  Label6.Caption:='Всего бонусов за '+#10+MonthToStrRU(Dt)+' '+FormatDateTime('yyyy',Dt);

  Label6.Caption:='Бонусов накоплено'#10'(невыплаченных)';

  DM.Qr.Close;
  DM.Qr.SQL.Text:='exec spY_GetSumBonusAll_End '+IntToStr(Prm.ID_Gamma)+','''+FormatDateTime('yyyy-mm-dd',StartOfTheMonth(Date))+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',EndOfTheMonth(Date))+'''';
//  DM.Qr.SQL.SaveToFile('c:\log\bonusall.txt');
  try
   DM.Qr.Open;
  except
   DM.ADOCo.Connected:=False;
   DM.ADOCo.Connected:=True;
   DM.Qr.Open;
  end;

  lbBonusAll.Caption:=CurrToStr(DM.Qr.FieldByName('SumB').AsCurrency+DM.Qr.FieldByName('SumBActive').AsCurrency);

  if Screen.Width>1024 then
   begin
    Width:=1200;
    Left:=(Screen.Width-Width) div 2;
    dbg_1.Columns[1].Width:=572;
    dbg_2.Columns[1].Width:=572;
    dbg_3.Columns[1].Width:=572;
    dbg_4.Columns[1].Width:=572;
    dbg_8.Columns[1].Width:=576;

    dbg6_1.Columns[1].Width:=572;
    dbg6_2.Columns[1].Width:=556;
   end;
 end;

procedure TMotivationSystemF.FormActivate(Sender:TObject);
 begin
//  WindowState:=wsMaximized;
  if High(aList)>-1 then imClick(aList[0].Im);
  srDataChange;
 end;

procedure TMotivationSystemF.Label1MouseEnter(Sender:TObject);
 begin
  TLabel(Sender).Font.Style:=[fsUnderline];
 end;

procedure TMotivationSystemF.Label1MouseLeave(Sender:TObject);
 begin
  TLabel(Sender).Font.Style:=[];
 end;

procedure TMotivationSystemF.FormDestroy(Sender:TObject);
 begin
  ClearList;
 end;

procedure TMotivationSystemF.imMouseEnter(Sender: TObject);
 begin
  DrawCell(TExtImage(Sender).Tag,1);
 end;

procedure TMotivationSystemF.imMouseLeave(Sender: TObject);
 begin
  DrawCell(TExtImage(Sender).Tag,0);
 end;

procedure TMotivationSystemF.ReopenList(ID:Integer; Param:Byte);
 begin
  DM.qrAkciiList.Close;
  DM.qrAkciiList.SQL.Text:='exec spY_AkciiList '+IntToStr(aList[ID].ID)+','+IntToStr(Param)+',''%'+Edit1.Text+'%'' ';
//  DM.qrAkciiList.SQL.SaveToFile('C:\AList.txt');
  DM.qrAkciiList.Open;
 end;

procedure TMotivationSystemF.imClick(Sender:TObject);
var ID,i:Integer;
    IsExist:Boolean;
    pn:TPanel;

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

  ReopenList(ID,BoolToInt(cbActual.Checked));

  IsExist:=False;

  for i:=0 to ComponentCount-1 do
   if Copy(Components[i].Name,1,2)='pn' then
    begin
     TPanel(Components[i]).Visible:=False;
     if Components[i].Name='pn'+IntToStr(aList[ID].ID) {DM.qrAkciiList.FieldByName('ID').AsString} then IsExist:=True;
    end;

  if IsExist then
   begin
    pn:=TPanel(FindComponent('pn'+IntToStr(aList[ID].ID){DM.qrAkciiList.FieldByName('ID').AsString}));
    pn.Left:=346;
    pn.Top:=177;
    pn.Visible:=True;
    srDataChange;

{
    DM.qrAkciiList.Next;
    DM.qrAkciiList.Prior;
}
   end;

 {
  lb1.Caption:=aList[ID].Descr;

  IsExist:=False;
  for i:=0 to ComponentCount-1 do
   if Copy(Components[i].Name,1,2)='pn' then
    begin
     TPanel(Components[i]).Visible:=False;
     if Components[i].Name='pn'+IntToStr(aList[ID].ID) then IsExist:=True;
    end;

  if IsExist then
   try
    pn:=TPanel(FindComponent('pn'+IntToStr(aList[ID].ID)));
    pn.Left:=346;
    pn.Top:=116;
    pn.Visible:=True;
    Case aList[ID].ID of
     4:begin
        MakeGradientWidthI(im1_4,clGreen,$00C1EFAD);
        MakeGradientWidthI(im2_4,clGreen,$00C1EFAD);

        qr4_1.Close;
        qr4_1.SQL.Text:='exec spY_ArtZamenaList '+IntToStr(aList[ID].IDP)+',1';
        qr4_1.Open;

        Label5.Caption:='Период действия: с '+qr4_1.FieldByName('DtStart').AsString+' по '+qr4_1.FieldByName('DtEnd').AsString;

        qr4_2.Close;
        qr4_2.SQL.Text:='exec spY_ArtZamenaList '+IntToStr(aList[ID].IDP)+',2';
        qr4_2.Open;

       end;
    end;
   except
   end;
}
 end;

procedure TMotivationSystemF.Label1Click(Sender: TObject);
 begin
  ShowPiggyBank;
 end;

procedure TMotivationSystemF.cbActualClick(Sender:TObject);
 begin
  ReopenList(CurrentID,BoolToInt(cbActual.Checked));
 end;

procedure TMotivationSystemF.bbStatPlanClick(Sender:TObject);
 begin
  if DM.qrAkciiList.IsEmpty then Exit;

  ShowStatPlanAptF:=TShowStatPlanAptF.Create(Self);
  try
   ShowStatPlanAptF.ShowModal;
  finally
   ShowStatPlanAptF.Free;
  end;
 end;

procedure TMotivationSystemF.DBGrid2DblClick(Sender: TObject);
 begin
  if DM.qrAkciiList.IsEmpty then Exit;
  if AnsiUpperCase(GetCompName)='SERGEY' then
   ShowMessage(DM.qrAkciiList.FieldByName('IDP').AsString);
 end;

procedure TMotivationSystemF.bbTotalStatClick(Sender:TObject);
 begin
  TotalStatF:=TTotalStatF.Create(Self);
   try
    TotalStatF.ShowModal;
   finally
    TotalStatF.Free;
   end;
 end;

procedure TMotivationSystemF.SpeedButton1Click(Sender:TObject);
 begin
  Edit1.Text:='';
 end;

procedure TMotivationSystemF.lbUserDblClick(Sender: TObject);
 begin
  ShowMessageI(Prm.ID_Gamma);
 end;

procedure TMotivationSystemF.dbg8_2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
    NP:Integer;
 begin

  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  NP:=db.DataSource.DataSet.FieldByName('NumPrize').AsInteger;

  if (NP>0) and (Np+1=DataCol) then db.Canvas.Brush.Color:=$008080FF;

  if db.DataSource.DataSet.FieldByName('KolUpAll').AsCurrency>=db.DataSource.DataSet.FieldByName('Plan').AsCurrency then db.Canvas.Brush.Color:=clLime;

  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);

 end;

procedure TMotivationSystemF.BitBtn1Click(Sender: TObject);
 begin
  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='exec spY_GetSumBonus '+IntToStr(Prm.ID_Gamma)+',8,'
                                           +DM.qrAkciiList.FieldByName('IDP').AsString+', '''
                                           +FormatDateTime('yyyy-mm-dd',qr8_1.FieldByName('DtStart').AsDateTime)+''','''
                                           +FormatDateTime('yyyy-mm-dd',qr8_1.FieldByName('DtEnd').AsDateTime)+''',2';
  DM.QrEx.Open;

  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Orientation:=O_LANDS;
  PrintRep.Font.Name:='Arial';
  PrintRep.Font.Size:=4;

  PrintRep.AddText(DM.qrAkciiList.FieldByName('Descr').AsString+#10#10);

  PrintRep.Qr:=DM.QrEx;
  PrintRep.PrintTable(False,0,0);
  PrintRep.RightMargin:=120;
  PrintRep.PrintScale:=0.8;
  PrintRep.PreView;
 end;

end.

{
INSERT INTO [ARHCHEKS]
(
[DATE_CHEK],[NUMB_CHEK],[KOD_NAME],[NAMES],[KOL],[CENA],[KASSA_NUM],[TYPE_TOV],[ID_USER],[ID_KASSA],[SKD],[NUMCARD],[VZH]
,[SUMSKDK],[NUMCARDK],[SHIFTSKD],[TypeCard],[ID_AKCII],[BonusSkd],[Bonus],[CardPref],[cena_pilot],[medname],[IsFirstRec],[FIODoctor],[PACIENT],[DT_Begin]
,[guid],[IsPrint],[AccumSum],[SpisSum],[SumSkd],[s1],[s2],[s3],[s4],[s5],[s6],[s7],[s8],[s9],[s10],[s11],[s12],[s13],[s14],[s15],[s16],[Merchant],[InvoiceNum]
,[PacientAdr],[NumRecipt],[NumGeptralCard],[TypeRecipt],[idres_np],[id_doctor],[id_doctor_all],[id_strah],[fransh],[nn_polis],[dt_polis],[FIOStrah],[TypeDostStrah]
,[NumOrder],[s17],[FranshStr],[iddoc],[OrderID]
)
select
getdate(),[NUMB_CHEK],[KOD_NAME],[NAMES],-KOL,[CENA],[KASSA_NUM],[TYPE_TOV],[ID_USER],[ID_KASSA],-SKD,[NUMCARD],[VZH]
,[SUMSKDK],[NUMCARDK],[SHIFTSKD],[TypeCard],[ID_AKCII],[BonusSkd],[Bonus],[CardPref],[cena_pilot],[medname],[IsFirstRec],[FIODoctor],[PACIENT],getdate()
,NewId(),[IsPrint],[AccumSum],[SpisSum],-SumSkd,[s1],[s2],[s3],[s4],[s5],[s6],[s7],[s8],[s9],[s10],[s11],[s12],[s13],[s14],[s15],[s16],[Merchant],[InvoiceNum]
,[PacientAdr],[NumRecipt],[NumGeptralCard],[TypeRecipt],[idres_np],[id_doctor],[id_doctor_all],[id_strah],[fransh],[nn_polis],[dt_polis],[FIOStrah],[TypeDostStrah]
,[NumOrder],[s17],[FranshStr],[iddoc],[OrderID]
from ArhCheks
where row_id=
}

