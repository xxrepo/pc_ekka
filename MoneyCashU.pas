unit MoneyCashU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Buttons, Math, MainU, ShareU, Util, ActnList;

type

  TCntrEdit = class(TEdit)
  protected

   procedure CreateParams(var Params: TCreateParams); override;

  end;

  TMoneyCashF = class(TForm)

    Panel1: TPanel;
    Label1: TLabel;
    StaticText1: TStaticText;
    Label2: TLabel;
    StaticText2: TStaticText;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbaAll: TLabel;
    lbaOst: TLabel;
    Label8: TLabel;
    lbaChek: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Memo1: TEdit;
    Memo2: TEdit;
    Memo3: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ActionList1: TActionList;
    NotAltF4: TAction;
    Label14: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Memo2Change(Sender: TObject);
    procedure Memo3Change(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure NotAltF4Execute(Sender: TObject);

  private

    FSumChek:Currency;
    FSumCash:Currency;
    FFLag:Integer;
    FSumChekSafe: Currency;
    FMaxAccumSum: Currency;
    FSumSkd: Currency;
    FAccumSum: Currency;
    FSumSpis: Currency;
    FSumCashToCard:Currency;
    FCloseOnly:Boolean;
    FIsSdacha:Boolean;
    FSafeSumSpis:Currency;

    procedure SetSumChek(const Value:Currency);
    procedure SetSumCash(Value:Currency);
    procedure SetSumCashToCard(Value: Currency);
    function  GetSumCashFull: Currency;
    procedure SetMaxAccumSum(const Value: Currency);

  public

    Cp:TChekPos;

    property MaxAccumSum:Currency read FMaxAccumSum write SetMaxAccumSum;
    property AccumSum:Currency read FAccumSum write FAccumSum;
    property SumChekSafe:Currency read FSumChekSafe write FSumChekSafe;
    property SumChek:Currency read FSumChek write SetSumChek;
    property SumSkd:Currency read FSumSkd write FSumSkd;
    property SumCash:Currency read FSumCash write SetSumCash;
    property SumCashToCard:Currency read FSumCashToCard write SetSumCashToCard;
    property Flag:Integer read FFlag write FFlag;
    property SumSpis:Currency read FSumSpis;
    property SumCashFull:Currency read GetSumCashFull;
    property SafeSumSpis:Currency read FSafeSumSpis write FSafeSumSpis;

  end;

var MoneyCashF:TMoneyCashF;

implementation

uses DataModuleU;

{$R *.dfm}

procedure TMoneyCashF.FormCreate(Sender:TObject);
 begin
  FFlag:=0;
  FCloseOnly:=False;
  FIsSdacha:=False;
  FSumSpis:=0;
  FSumCashToCard:=0;

  Caption:=MFC;

  BitBtn1.Glyph.Assign(MainF.imStar.Picture);

  pPointer(Memo1)^:=TCntrEdit;
  TCntrEdit(Memo1).RecreateWnd;

  pPointer(Memo2)^:=TCntrEdit;
  TCntrEdit(Memo2).RecreateWnd;

  pPointer(Memo3)^:=TCntrEdit;
  TCntrEdit(Memo3).RecreateWnd;
 end;

procedure TMoneyCashF.Memo1KeyPress(Sender:TObject; var Key:Char);
var P:Integer;
 begin
  if Key=',' then Key:='.';
  if Key<>#8 then
   begin
    if Not (Key in ['0'..'9']+['.']) then Key:=#0;
    P:=Pos('.',TEdit(Sender).Text);
    if P<>0 then
     begin
      if (Key='.') or ((Length(TEdit(Sender).Text)>P+1) and (TEdit(Sender).SelStart>=P)) then Key:=#0;
     end;
   end;
 end;

procedure TMoneyCashF.FormActivate(Sender: TObject);
var Sdacha:Currency;
    Res:String;
 begin
//  Memo1.SelectAll;
  if Memo1.Enabled then Memo1.SetFocus;
//  if StrToCurr(Memo2.Text)>0 then CheckBox1.Checked:=True;
  if FSafeSumSpis>0 then
   begin
    CheckBox1.Checked:=True;

    Memo2.Text:=CurrToStrF(FSafeSumSpis,ffFixed,2);
   end;

{
 if MainF.AccumSum>0 then
   MainF.MessBox('Озвучьте фразу: '#10#10+
                 '- "У Вас на карточке накоплено '+CurrToWordsRU(MainF.AccumSum,0)+', желаете их списать сейчас или будете накапливать дальше?"',48,12,clBlue,[fsBold]);
}
  if Prm.FirmID<>5 then
   try
    if StrToCurr(Memo1.Text)>0 then
    MainF.MessBox('- "Спасибо, Вы дали '+CurrToStrF(StrToCurr(Memo1.Text),ffFixed,2)+' грн. "',48,GetFont('Times New Roman',22,$00006600,[fsBold]),0,Res,False,'Озвучьте фразу:');
   except
   end;

   PlayFraz(5,FSumChek+FSumCashToCard);
 end;

procedure TMoneyCashF.SetSumChek(const Value: Currency);
 begin
  FSumChek:=Value;
  StaticText1.Caption:=CurrToStrF(Value+FSumCashToCard,ffFixed,2);
 end;

procedure TMoneyCashF.SetSumCash(Value:Currency);
 begin
  if Value<0 then Value:=0;
  FSumCash:=Value;
  StaticText2.Caption:=CurrToStrF(Value,ffFixed,2);
 end;

procedure TMoneyCashF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TMoneyCashF.BitBtn1Click(Sender:TObject);
var Sdacha,SSpis,Sum:Currency;
    B,BSkd:Boolean;
    Res:String;

 begin

  if FCloseOnly then
   begin
    Flag:=1;
    Close;
    Exit;
   end;

  if (MaxAccumSum>0) and (CheckBox1.Checked=False) then
   begin
    PlayFraZ(6,FAccumSum);
    if MainF.MessBox('- "У Вас на карточке накоплено '+CurrToStrF(FAccumSum,ffFixed,2)+' грн. Желаете их списать сейчас или будете накапливать дальше?"',
                     52,GetFont('Times New Roman',22,$00006600,[fsBold]),0,Res,False,'Озвучьте фразу:')=ID_YES then
     begin
      CheckBox1.Checked:=True;
      Exit;
     end;
   end;

  if (CP.Type_Skd=SK_CARD) and (CP.TypeCardNew=1) and (Prm.FirmID<>5) then
  try
   Sdacha:=StrToCurr(StaticText2.Caption)-Floor(StrToCurr(StaticText2.Caption));
   if (RoundTo(FSumCashToCard,-2)=0) and (Sdacha>0) and (FIsSdacha=False) then
    begin
     PlayFraz(7,Sdacha);
     if MainF.MessBox('- "Желаете сдачу в сумме '+IntToStr(Round(Sdacha*100))+' копеек зачислить на свою карточку? Вы их сможете использовать в дальнейших покупках."',52,GetFont('Times New Roman',22,$00006600,[fsBold]),0,Res,False,'Озвучьте фразу:')=ID_YES then
      begin
//      SumCashToCard:=Sdacha;
       Memo3.Text:=CurrToStrF(Sdacha,ffFixed,2);
       FIsSdacha:=True;
       Exit;
      end;
    end;
  except
  end;

  if Prm.ForceEnterCash=True then
   if (CP.TypeOplat=TO_CASH) and (SumChek>0) then
    begin
     if RoundTo(StrToCurr(Memo1.Text),-2)=0 then
      begin
       MainF.MessBox('Необходимо ввести сумму наличных денег полученную от покупателя!',48,GetFont('MS Sans Serif',12,clMaroon,[fsBold]),0,Res);
       Memo1.SetFocus;
       Exit;
      end else
     if RoundTo(StrToCurr(Memo1.Text),-2)<RoundTo(SumChek,-2) then
      begin
       MainF.MessBox('Сумма наличных денег полученная от покупателя меньше суммы чека!',48,GetFont('MS Sans Serif',12,clMaroon,[fsBold]),0,Res);
       Memo1.SetFocus;
       Exit;
      end;
    end;

  try
   if CheckBox1.Checked then
    begin
     if Trim(Memo2.Text)='' then FSumSpis:=0
                            else FSumSpis:=RoundTo(StrToCurr(Memo2.Text),-2);
     if SumSpis>MaxAccumSum then
      begin
//       MainF.MessBox('Максимальная сумма списания не может превышать: '+CurrToStrF(MaxAccumSum,ffFixed,2)+' грн.');
       Memo2.Text:=CurrToStrF(MaxAccumSum,ffFixed,2);
       Memo2.SetFocus;
       Exit;
      end
    end;

{  if MainF.IsQCard=False then
    if Not MainF.CheckCardPokup then Exit else } MainF.IsQCard:=True;

   MainF.SumCashToCard:=SumCashToCard;
   BSkd:=False;
   if CP.id_strah<>0 then CP.SumOplata:=CP.Fransh else
   if CP.TypeChek in TC_DL then CP.SumOplata:=CP.SumDopl
                           else CP.SumOplata:=SumChek;

   if (CP.SumOplata>0) then
    if Not MainF.CheckBankCard(CP) then Exit;

   B:=False;
   Sum:=0;
   if (CheckBox1.Checked) and (SumSpis>0) then
    begin
     Sum:=SumSpis;
     Repeat
      SSpis:=MainF.CalcSkdOnly(Sum,SumCashToCard,BSkd,1);
      Sum:=Sum-0.01;
     Until SSpis<=SumSpis;
     if RoundTo(FSumSpis,-2)=RoundTo(SSpis,-2) then FCloseOnly:=True else B:=True;
     FSumSpis:=SSpis;
     Memo2.Text:=CurrToStrF(SSpis,ffFixed,2);
    end else
   if (SumCashToCard>0) or (BSkd=True) then
    MainF.CalcSkdOnly(Sum,SumCashToCard,BSkd,1);

   if ((BSkd=True) and (RoundTo(SumChek,-2)<>RoundTo(MainF.SumChekFull,-2))) or (B=True)  then
    begin
     SumChek:=MainF.SumChekFull;
     CheckBox1.Enabled:=False;
     Memo2.Enabled:=False;
     Memo3.Enabled:=False;
     Memo1.Enabled:=False;
     Label4.Enabled:=False;
     FCloseOnly:=False;
     BitBtn2.Enabled:=False;
    end else FCloseOnly:=True;

   if FCloseOnly then
    begin
     Flag:=1;
     if (CheckBox1.Checked) and (SumSpis>0) then {PlayFraz(13,SSpis);} PlayWav(WV_SPIS,0);
     Close;
    end else FCloseOnly:=True;
  except
   MainF.MessBox('Введена некорректная сумма списания!');
   if Memo2.Enabled then Memo2.SetFocus;
  end;
 end;

procedure TMoneyCashF.CheckBox1Click(Sender: TObject);
 begin
  Memo2.Enabled:=CheckBox1.Checked;
  if CheckBox1.Checked then Memo2.SetFocus;
  Memo2Change(Memo2);
 end;
      
(*
procedure TMoneyCashF.CheckBox1Click(Sender: TObject);
var Sum:Currency;
 begin
  try
   Memo2.Enabled:=CheckBox1.Checked;
   if CheckBox1.Checked then
    begin
     Sum:=RoundTo(StrToCurr(Memo2.Text),-2);
     if Sum>RoundTo(MaxAccumSum,-2) then
      begin
//       MainF.MessBox('Вы не можете использовать накопленную сумму для оплаты чека больше чем '+CurrToStrF(MaxAccumSum,ffFixed,2)+' грн.');
       SumChek:=0;

//       Memo2.Text:=CurrToStrF(MoneyCashF.MaxAccumSum,ffFixed,2);
      end else SumChek:=SumChekSafe-StrToCurr(Memo2.Text);

{
    DM.Qr3.Close;
    DM.Qr3.SQL.Clear;
    DM.Qr3.SQL.Add('declare @sm numeric(8,2) ');
    DM.Qr3.SQL.Add('set @sm='+CurrToStrF(Sum,ffFixed,2));
    DM.Qr3.SQL.Add('update Chek set SumSkdNew=0 where compname=host_name() and id_user='+IntToStr(Prm.UserID));
    DM.Qr3.SQL.Add('update Chek set @sm=SumSkdNew=@sm-(kol*cena-kol*0.01)  ');
    DM.Qr3.SQL.Add('update Chek set SumSkdNew=(case when SumSkdNew+(kol*cena-kol*0.01)>(kol*cena-kol*0.01) then (kol*cena-kol*0.01)  ');
    DM.Qr3.SQL.Add('                                when SumSkdNew+(kol*cena-kol*0.01)>0 then SumSkdNew+(kol*cena-kol*0.01) else 0 end)  ');
    DM.Qr3.SQL.Add('where compname=host_name() and id_user='+IntToStr(Prm.UserID));
    DM.Qr3.ExecSQL;
}
    end else SumChek:=SumChekSafe;
   Memo1Change(Memo1);
  except
   SumChek:=SumChekSafe;
   Memo2.Text:=CurrToStrF(MoneyCashF.MaxAccumSum,ffFixed,2);
  end;
 end;
*)

procedure TMoneyCashF.Memo2Change(Sender:TObject);
 begin
  try
   if TEdit(Sender).Text='' then 
    begin
     TEdit(Sender).Text:='0';
     TEdit(Sender).SelectAll;
    end; 
   Memo2.Enabled:=CheckBox1.Checked;
   if CheckBox1.Checked then
    begin
     if RoundTo(StrToCurr(Memo2.Text),-2)>RoundTo(MaxAccumSum,-2) then Abort;

     SumChek:=SumChekSafe-StrToCurr(Memo2.Text);
     lbaOst.Caption:=CurrToStrF(AccumSum+SumCashToCard+SumSkd-RoundTo(StrToCurr(Memo2.Text),-2),ffFixed,2)+' грн.';

    end else Abort;
   Memo1Change(Memo1);
  except
//   Memo2.Text:='0';
   SumChek:=SumChekSafe;
   lbaOst.Caption:=CurrToStrF(AccumSum+SumCashToCard+SumSkd,ffFixed,2)+' грн.';
   Memo1Change(Memo1);
  end;
 end;

procedure TMoneyCashF.Memo3Change(Sender: TObject);
 begin
  try
   try
    if TEdit(Sender).Text='' then Abort;
    if RoundTo(StrToCurr(TEdit(Sender).Text),-2)>RoundTo(SumCashFull,-2) then Abort;
    FSumCashToCard:=RoundTo(StrToCurr(TEdit(Sender).Text),-2);
    Memo2Change(Memo2);
   except
    TEdit(Sender).Text:='0';
    TEdit(Sender).SelectAll;
   end;
  finally
   FSumCashToCard:=RoundTo(StrToCurr(TEdit(Sender).Text),-2);
   Memo2Change(Memo2);
  end;
 end;

procedure TMoneyCashF.Memo1Change(Sender: TObject);
 begin
  try
   if TEdit(Sender).Text='' then
    begin
     TEdit(Sender).Text:='0';
     TEdit(Sender).SelectAll;
    end;
   if RoundTo(RoundTo(StrToCurr(Memo1.Text),-2)-RoundTo(SumChek,-2)-RoundTo(SumCashToCard,-2),-2)<0 then Abort;
   SumCash:=StrToCurr(Memo1.Text)-SumChek-RoundTo(SumCashToCard,-2);
  except
   SumCash:=0;
   SumCashToCard:=0;
  end;
 end;

{ TCntrEdit }

procedure TCntrEdit.CreateParams(var Params: TCreateParams);
 begin
  inherited CreateParams(Params);
  Params.Style:=Params.Style or ES_RIGHT;
 end;

procedure TMoneyCashF.SetSumCashToCard(Value:Currency);
 begin
  if Value<0 then Value:=0;
  FSumCashToCard:=Value;
  Memo3.Text:=CurrToStrF(Value,ffFixed,2);
 end;

function TMoneyCashF.GetSumCashFull:Currency;
 begin
  try
   if RoundTo(StrToCurr(Memo1.Text),-2)<RoundTo(SumChek,-2) then Abort;
   Result:=StrToCurr(Memo1.Text)-SumChek;

  except
   Result:=0;
  end
 end;

procedure TMoneyCashF.NotAltF4Execute(Sender: TObject);
 begin
  //
 end;

procedure TMoneyCashF.SetMaxAccumSum(const Value: Currency);
 begin
  FMaxAccumSum:=Value;
  Label14.Caption:='Максимальная сумма списания '#10' на данный чек: '+CurrToStrF(Value,ffFixed,2)+' грн.'
 end;

end.
