unit SumZU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Util;

type
  TSumZF = class(TForm)
    Panel1:TPanel;
    Label1:TLabel;
    dtZ:TDateTimePicker;
    Label2:TLabel;
    Label3:TLabel;
    dtStart:TDateTimePicker;
    dtEnd:TDateTimePicker;
    Panel2:TPanel;
    Label4:TLabel;
    Label5:TLabel;
    Label6:TLabel;
    lbAll:TLabel;
    lbSkd:TLabel;
    lbItog: TLabel;
    Bevel1: TBevel;
    Panel3: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    lbTerm: TLabel;
    lbVozPok: TLabel;
    Panel4: TPanel;
    Label11: TLabel;
    lbKolCh: TLabel;
    Label13: TLabel;
    cbKassa: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    lbPrep: TLabel;
    Label10: TLabel;
    sbCHP: TSpeedButton;
    Label9: TLabel;
    lbSkd50: TLabel;
    Label12: TLabel;
    dtZ1: TDateTimePicker;
    Label14: TLabel;
    lbKolNaim: TLabel;
    Label15: TLabel;
    lbSkd50B: TLabel;
    Label16: TLabel;
    lbSumStretch: TLabel;
    Label17: TLabel;
    lbBezgot1: TLabel;
    Label18: TLabel;
    lbAmount: TLabel;
    procedure FormCreate(Sender:TObject);
    procedure BitBtn3Click(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure sbCHPClick(Sender: TObject);
  private
  public
  end;

var SumZF:TSumZF=nil;

procedure ShowSumZ;

Implementation

uses MainU, DataModuleU, SumZPerU;

{$R *.dfm}

procedure ShowSumZ;
 begin
  try
   if SumZF=Nil then SumZF:=TSumZF.Create(nil);
   Application.ProcessMessages;
   SumZF.ShowModal;
  except
   SumZF:=nil;
   MainF.MessBox(ER_CR_FORM);
  end;
 end;

procedure TSumZF.FormCreate(Sender:TObject);
var i:Integer;
 begin
  Caption:=MFC;
  dtZ.Date:=Date;
  dtZ1.Date:=Date;
  dtStart.Time:=0;
//  dtEnd.Time:=Opt.TimeZ;
  cbKassa.Clear;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select Value from Spr_Const where Descr=''Skd50''';
   DM.Qr.Open;
   if (DM.Qr.FieldByName('Value').AsFloat>0) or (MainF.IsKiosk) then
    begin
     lbSkd50.Visible:=True;
     Label9.Visible:=True;
     lbSkd50B.Visible:=True;
     Label15.Visible:=True;
    end;
  except
  end;

  try
   cbKassa.Items.Add('Все');
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select id_kassa from ArhCheks group by id_kassa order by id_kassa';
   DM.Qr.Open;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     cbKassa.Items.Add('Касса '+DM.Qr.FieldByName('id_kassa').AsString);
    end;
  except
  end; 
  cbKassa.ItemIndex:=0;
  sbCHP.Visible:=Prm.UserRole=R_ADMIN;
  if Not sbCHP.Visible then dtStart.Width:=106;
 end;

procedure TSumZF.BitBtn3Click(Sender:TObject);
 begin
  Close;
 end;

procedure TSumZF.BitBtn1Click(Sender:TObject);
var ID_Kassa:Integer;
 begin
  try
   if cbKassa.ItemIndex<=0 then Abort;
   ID_Kassa:=StrToInt(Copy(cbKassa.Text,7,1));
  except
   ID_Kassa:=0;
  end;
  try
   DM.spY_CalcRealiz.Close;

   if (dtZ.Date<Date-xM) and (Prm.UserRole<>R_ADMIN) then
    begin
     dtZ.Date:=StrToDate(DateToStr(Date-xM));
     MainF.MessBox('Вы не можете выбрать дату меньше чем '+DateToStr(Date-xM));
     lbAll.Caption:='0.00';
     lbPrep.Caption:='0.00';
     lbSkd.Caption:='0.00';
     lbSkd50.Caption:='0.00';
     lbSkd50B.Caption:='0.00';
     lbItog.Caption:='0.00';
     lbTerm.Caption:='0.00';
     lbVozPok.Caption:='0.00';
     lbKolCh.Caption:='0';
     lbSumStretch.Caption:='0.00';
     Exit;
    end;

   DM.spY_CalcRealiz.Parameters.ParamValues['@pidkassa']:=ID_Kassa;
   DM.spY_CalcRealiz.Parameters.ParamValues['@pdt1']:=StrToDate(DateToStr(dtZ.Date))+StrToTime(TimeToStr(dtStart.Time));
   DM.spY_CalcRealiz.Parameters.ParamValues['@pdt2']:=StrToDate(DateToStr(dtZ1.Date))+StrToTime(TimeToStr(dtEnd.Time));
   DM.spY_CalcRealiz.Open;

   lbAll.Caption:=CurrToStrF(DM.spY_CalcRealiz.FieldByName('Sm').AsCurrency,ffFixed,2);
   lbPrep.Caption:=CurrToStrF(DM.spY_CalcRealiz.FieldByName('Prep').AsCurrency,ffFixed,2);
   lbSkd.Caption:=CurrToStrF(DM.spY_CalcRealiz.FieldByName('SmSkd').AsCurrency,ffFixed,2);
   lbSkd50.Caption:=CurrToStrF(DM.spY_CalcRealiz.FieldByName('SumSkdK').AsCurrency,ffFixed,2);
   lbSkd50B.Caption:=CurrToStrF(DM.spY_CalcRealiz.FieldByName('SumSkdKB').AsCurrency,ffFixed,2);
   lbItog.Caption:=CurrToStrF(DM.spY_CalcRealiz.FieldByName('SmItog').AsCurrency,ffFixed,2);

   lbTerm.Caption:=CurrToStrF(DM.spY_CalcRealiz.FieldByName('Terminal').AsCurrency,ffFixed,2);
   lbBezgot1.Caption:=CurrToStrF(DM.spY_CalcRealiz.FieldByName('Beznal1').AsCurrency,ffFixed,2);

   lbVozPok.Caption:=CurrToStrF(DM.spY_CalcRealiz.FieldByName('Vozpokup').AsCurrency,ffFixed,2);
   lbKolCh.Caption:=IntToStr(DM.spY_CalcRealiz.FieldByName('KolChek').AsInteger);
   lbKolNaim.Caption:=IntToStr(DM.spY_CalcRealiz.FieldByName('KolNaim').AsInteger);
   lbSumStretch.Caption:=CurrToStrF(DM.spY_CalcRealiz.FieldByName('SumStretch').AsCurrency,ffFixed,2);
   lbAmount.Caption:=CurrToStrF(DM.spY_CalcRealiz.FieldByName('Amount').AsCurrency,ffFixed,2);
  except
   on E:Exception do MainF.MessBox('Ошибка расчета сумм: '+E.Message)
  end;
 end;

procedure TSumZF.BitBtn2Click(Sender:TObject);
 begin
  ShowSumZPer;
 end;

procedure TSumZF.sbCHPClick(Sender:TObject);
var Res:Integer;
    Sum:Real;
 begin
  try
   DM.spY_RealizCHP.Close;
   DM.spY_RealizCHP.Parameters.ParamValues['@d1']:=StrToDate(DateToStr(dtZ.Date-1))+StrToTime('20:30:30');
   DM.spY_RealizCHP.Parameters.ParamValues['@d2']:=StrToDate(DateToStr(dtZ.Date))+StrToTime('20:30:30');
   DM.spY_RealizCHP.Open;
   Sum:=DM.spY_RealizCHP.FieldByName('Summa').AsFloat;
   Res:=DM.spY_RealizCHP.Parameters.ParamValues['@RETURN_VALUE'];
   if Res=-1 then MainF.MessBox('За данный период уже была записана сумма по ЧП: '+CurrToStrF(Sum,ffFixed,2)+' грн.') else
   if Res=1 then MainF.MessBox('Записана сумма по ЧП: '+CurrToStrF(Sum,ffFixed,2)+' грн.',64) else Abort;
  except
   on E:Exception do
    MainF.MessBox('Ошибка записи суммы по ЧП! '+#10#10+E.Message);
  end;
 end;

Initialization

Finalization

 if SumZF<>nil then SumZF.Free;

End.
