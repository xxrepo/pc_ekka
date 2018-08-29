unit ZPU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ComCtrls, DateUtils, Math, Util;

type

  TZpF = class(TForm)

    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    lbSum: TLabel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    dtDate: TDateTimePicker;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1CloseUp(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private

  public

    SumV:Currency;
    Flag:Integer;

  end;

var ZpF:TZpF;

implementation

uses MainU, DataModuleU, EKKAU, ShareU;

{$R *.dfm}

procedure TZpF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;

  SumV:=0;

  Flag:=0;
 end;

procedure TZpF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TZpF.ComboBox1CloseUp(Sender: TObject);
 begin
  SumV:=0;
  lbSum.Caption:='0.00';

  if ComboBox1.Text='' then Exit;

  ComboBox2.ItemIndex:=ComboBox1.ItemIndex;

  DM.QrEx.Close;
  if Flag in [0,3] then
   DM.QrEx.SQL.Text:='exec spY_GetSumV '''+FormatDateTime('yyyy-mm-dd',StartOfTheMonth(dtDate.Date))+''' , '+ComboBox2.Text+','+IntToStr(Flag) else
  if Flag=2 then
   DM.QrEx.SQL.Text:='exec spY_GetSumV '''+FormatDateTime('yyyy-mm-dd',StartOfTheMonth(dtDate.Date))+''' , '+ComboBox2.Text+' , 2'
  else
   DM.QrEx.SQL.Text:='exec spY_GetSumV_UV '''+FormatDateTime('yyyy-mm-dd',StartOfTheMonth(dtDate.Date))+''' , '+ComboBox2.Text;

  DM.QrEx.Open;

  if DM.QrEx.FieldByName('Res').AsInteger=-1 then
   begin

    MainF.MessBox('Вы уже делали выдачу за этот месяц.');

{

    if (DM.QrEx.FieldByName('SumV=0').AsCurrency) then MainF.MessBox('Вы уже делали выдачу за этот месяц.')
                                                  else MainF.MessBox('Сумма удержаний больше суммы выплат. Обращайтесь в "Сектор заработной платы"');

}
    Exit;
   end;

  SumV:=DM.QrEx.FieldByName('SumV').AsCurrency;

  if SumV<=0 then
   begin
    MainF.MessBox('Неверная сумма выдачи');
    Exit;
   end;

  lbSum.Caption:=CurrToStrF(SumV,ffFixed,2);
  BitBtn5.Enabled:=True;
  
 end;

procedure TZpF.BitBtn5Click(Sender: TObject);
var SumOst,SumOst1:Currency;

 function GetSumOst(var SumOst:Currency):Boolean;
 var CP:TChekPos;
  begin
   Result:=False;
   if ((EKKA.EmulEKKA=False) and (ReadCashState(CP,0)=False)) or
      ((EKKA.EmulEKKA=True ) and (EKKA.fpCashState(0)=False)) then
    begin
     MainF.MessBox('Ошибка чтения сумм РРО: '+EKKA.LastErrorDescr);
     Exit;
    end else begin
              if EKKA.EmulEKKA=False then SumOst:=CP.Sums[5]
                                     else SumOst:=StrToInt(EKKA.RD_Item[5])*0.01;
              Result:=True;
             end;
  end;

 Begin
  try
{
   ShowMessage(IntToStr(Flag));
   Exit;
}
   EKKA.fpGetStatus;
   if EKKA.LastError<>'' then Abort;

   if Ord(EKKA.RD_Item[9][1])=1 then
    begin
     MainF.MessBox('Смена на кассовом аппарате не открыта (не было продаж после последнего Z-отчета).');
     Exit;
    end;

   BitBtn5.Enabled:=False;
   Application.ProcessMessages;
   if SumV<=0 then Exit;

   if MainF.MessBox('Вы действительно хотите выдать сумму '+lbSum.Caption+' грн. ?',52)<>ID_YES then Exit;

   if Not GetSumOst(SumOst) then Exit;

   if SumOst<SumV then
    begin
     MainF.MessBox('В кассовом аппарате недостаточно средств, чтобы сделать выдачу.');
     Exit;
    end;

   try

    EKKA.fpCashOutput(SumV,1);

    Repeat

     if Not GetSumOst(SumOst1) then Continue;

     if RoundTo(SumOst-SumV,-2)<>RoundTo(SumOst1,-2) then raise EAbort.Create('Выдача не сделана!');
     try
      DM.QrEx.Close;
      DM.QrEx.SQL.Clear;
      DM.QrEx.SQL.Add('exec spY_SaveSumV '''+FormatDateTime('yyyy-mm-dd',StartOfTheMonth(dtDate.Date))+''',');
      DM.QrEx.SQL.Add(ComboBox2.Text+','+CorrCurr(CurrToStrF(SumV,ffFixed,2))+','+IntToStr(MainF.VzhNum)+','+IntToStr(Opt.KassaID)+','+CorrCurr(CurrToStrF(SumOst,ffFixed,2))+','+IntToStr(Flag));
      DM.QrEx.Open;
      if DM.QrEx.FieldByName('Res').AsInteger<>9994 then raise EAbort.Create('Ошибка записи выдачи!');
      ComboBox1.ItemIndex:=-1;
      ComboBox2.ItemIndex:=-1;
      Break;
     except
      on E:Exception do
       begin
        MainF.RegisterError('Служебная выдача_',E.Message,False);
        raise;
       end;
     end;
    Until False;

   except
    on E:Exception do
     begin
      MainF.RegisterError('Служебная выдача',E.Message,False);
     end;
   end;

  finally
//   BitBtn5.Enabled:=True;
  end;
 End;

procedure TZpF.FormActivate(Sender: TObject);
var i:Integer;
 begin
  dtDate.Date:=StartOfTheMonth(StartOfTheMonth(Date)-1);

  ComboBox1.Clear;
  ComboBox2.Clear;

  if Flag in [0,3] then
   begin
    ComboBox1.Items.Add(Prm.UserName);
    ComboBox2.Items.Add(IntToStr(Prm.ID_Gamma));
   end; 

  if (Prm.UserRole=R_SUPER) or (Prm.UserRole=R_ADMIN) then
   begin

    DM.QrEx.Close;

{
    DM.QrEx.SQL.Clear;
    DM.QrEx.SQL.Add('select id_gamma,users ');
    DM.QrEx.SQL.Add('from SprUser s (nolock)'1);
    DM.QrEx.SQL.Add('where reserve=0 and (id_gamma in (select id_gamma from SpisRL) ) ');
    DM.QrEx.SQL.Add('order by 2 ');
}

    DM.QrEx.SQL.Text:='exec spY_GetSpisEmployeeForZP '''+FormatDateTime('yyyy-mm-dd',dtDate.Date)+''','+IntToStr(Flag);
    DM.QrEx.Open;


    for i:=1 to DM.QrEx.RecordCount do
     begin
      if i=1 then DM.QrEx.First else DM.QrEx.Next;

      ComboBox1.Items.Add(DM.QrEx.FieldByName('users').AsString);
      ComboBox2.Items.Add(DM.QrEx.FieldByName('id_gamma').AsString);

     end;
   end;

  ComboBox1.ItemIndex:=-1;
  ComboBox2.ItemIndex:=-1;
//  ComboBox1CloseUp(ComboBox1);

 end;

end.

