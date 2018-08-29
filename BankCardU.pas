unit BankCardU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, Buttons, ComObj, MainU, Util, EnterValueU, ShowTextU;

type

  TBankCardF = class(TForm)

    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    CheckBox1:TCheckBox;
    ComboBox1:TComboBox;

    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
    procedure FormCreate(Sender:TObject);
    procedure BitBtn3Click(Sender:TObject);
    procedure FormActivate(Sender:TObject);
    procedure CheckBox1Click(Sender:TObject);

  private

    FFlag:Integer;

  public

    CP:TChekPos;

    property Flag:Integer read FFlag write FFlag;

  end;

var BankCardF:TBankCardF;
    StartTerminal:Boolean;

implementation

uses DataModuleU, DialogU;

{$R *.dfm}

procedure TBankCardF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TBankCardF.BitBtn1Click(Sender:TObject);
 begin

{  if edCard.Text='' then
   begin
    MainF.MessBox('Введите номер банковской карточки!');
    edCard.SetFocus;
   end else
 }
{  if Not ((Prm.AptekaID=21) and (Opt.KassaID=1)) and (CP.IsTerminal=False) and (Opt.UseTerminal=True) and
    ((Prm.AptekaID in [203,155,41,142,43,20,182,4,173,17,120,217,16,92,179,136,172,21,141,186,195,200,211,154,224,238,158,150,140,174,222,185,159,196,234,189,216,44,57,77,226,160,66,202,156,
                       47,170,49,40,53,127,144,51,89,88,194,10,5,149,165,59,225,135,213,232,99,218,163,100,8,121,52,28,112,6,82,80,162,131,184,67,58,56,1,71,230,46,113,39,26]) or
                       (Prm.AptekaID=257)) then

   begin
   // MainF.MessBox('Оплата по терминалу успешно не проведена по кнопке "Оплатить по терминалу"');
    FlagD:=0;
    DialogF:=TDialogF.Create(Self);
    try

     DialogF.Label1.Caption:= 'Оплата по терминалу успешно не проведена по кнопке "Оплатить по терминалу"';
     DialogF.BitBtn2.Caption:='Пароль...';

     DM.Qr7.Close;
     DM.Qr7.SQL.Text:='select Value from Spr_Const where Descr=''PasswTerminal'' ';
     DM.Qr7.Open;

     if DM.Qr7.IsEmpty then DialogF.Passw:='0523574825'
                       else DialogF.Passw:=DM.Qr7.FieldByName('Value').AsString;

     Application.ProcessMessages;
     DialogF.ShowModal;
     if FlagD=1 then
      begin
       Flag:=1;
       Close;
      end;
    finally
     DialogF.Free;
    end;
   end else begin
             Flag:=1;
             Close;
            end;
 }
  if (CP.IsTerminal=False) and (Not (CP.TypeOplatBS in [DO_BEZGOT1,DO_BEZGOT3])) then
   begin
    if ShowTextQ('Если вы уверены, что оплата по терминалу прошла успешно (терминал рапечатал 2 чека), Нажмите "ДА"'+#10#10+
                 'Если сомневаетесь, в том что оплата прошла успешно, нажмите "НЕТ"!'+#10+
                 'Узнать успешно ли прошла оплата по терминалу, можно по телефону 3700 (звонки с мобильных и стационарных телефонов бесплатные)!',52) then
     begin
      Flag:=1;
      Close;
     end;
   end else begin
             Flag:=1;
             Close;
            end;
 end;

procedure TBankCardF.FormCreate(Sender: TObject);
 begin
  Flag:=0;
  Caption:=MFC;
  StartTerminal:=False;
 end;

procedure TBankCardF.BitBtn3Click(Sender:TObject);
var i,nC,eI,rSum,Sum:Integer;
    S1,ss,eS,S:String;
    IsTerminate:Boolean;

 procedure tWait;
 var Res:Integer;
     T:TDateTime;
  begin
   Label5.Visible:=True;
   T:=Time;
   Repeat
    Res:=Terminal.LastResult;
    if Time-T>StrToTime('00:03:00') then
     begin
      StartTerminal:=False;
      IsTerminate:=True;
     end;
    if (Res<>2) or (StartTerminal=False) then Break;
    Application.ProcessMessages;
   Until False;
   if StartTerminal=False then Terminal.Cancel;
   Label5.Visible:=False;
  end;

 begin

  if BitBtn3.Tag=2 then
   begin
    if MainF.MessBox('Вы действительно хотите прервать оплату по терминалу?',52)<>ID_YES then Exit;
    StartTerminal:=False;
    Exit;
   end;

  if MainF.MessBox('Вы действительно хотите совершить оплату по терминалу?',52)<>ID_YES then Exit;
  try
   try
    StartTerminal:=True;
    BitBtn3.Tag:=2;
    BitBtn3.Caption:='Прервать оплату по терминалу';
    for i:=1 to 2 do
     begin

      if StartTerminal=True then
       begin
        Sum:=Round(CP.SumOplata*100);
        Terminal.Purchase(Sum,0,1);
       end;
      IsTerminate:=False;
      tWait;

      if IsTerminate then
       begin
        if ShowTextQ('Время ожидания от терминала истекло! '+
                     'Если вы уверены, что оплата по терминалу прошла успешно (терминал напечатал 2 чека), Нажмите "ДА"'+#10#10+
                     'Если сомневаетесь, в том что оплата прошла успешно, нажмите "НЕТ"!'+#10+
                     'Узнать успешно ли прошла оплата по терминалу, можно по телефону 3700 (звонки с мобильных и стационарных телефонов бесплатные)!',52) then
         begin
          BitBtn1Click(BitBtn1);
          Exit;
         end else Exit;
       end;

      if (Terminal.LastResult=1) or (StartTerminal=False)  then
       begin
        if Terminal.LastResult=1 then
         begin
          eI:=Terminal.LastErrorCode;
          eS:=Terminal.LastErrorDescription;
          eS:='Ошибка: '+IntToStr(eI)+' - '+eS;
         end;
        if Pos(AnsiUpperCase('Device was disconnected'),AnsiUpperCase(eS))<>0 then
         begin
          MainF.InitTerminal;
          Continue;
         end else
        if (Pos(AnsiUpperCase('Com port error'),AnsiUpperCase(eS))<>0) or (Pos(AnsiUpperCase('Error sending message'),AnsiUpperCase(eS))<>0) then
         begin
          if MainF.InitPortTerminal then Continue;
         end;
        MainF.MessBox('Оплата прервана.'+eS);

        DM.QrEx.Close;
        DM.QrEx.SQL.Clear;
        DM.QrEx.SQL.Add('insert into TerminalLog(mess,dt,id_user)');
        DM.QrEx.SQL.Add('values('''+eS+''',getdate(),'+IntToStr(Prm.UserID)+')');
        DM.QrEx.SQL.Add('select 9999 as Res ');
        DM.QrEx.Open;

        Break;
       end else begin
                 CP.SumOplata:=0.01*Terminal.getTotalAmount;
                 CP.IsTerminal:=True;
                 MainF.IsTerminal:=CP.IsTerminal;
                 AppendStringToFile('D:\AVA\TerminalLog.txt',CurrToStrF(Sum/100,ffFixed,2)+' - '+CurrToStrF(CP.SumOplata,ffFixed,2));
                 //MainF.MessBox('Оплата по терминалу прошла успешно. Убедитесь по чекам, которые выдал терминал прошла оплата или нет!',64);
                 MainF.MessBox('Оплата по терминалу прошла успешно!',64);
                 BitBtn3.Enabled:=False;

                 Cp.InvoiceNum:=Terminal.getInvoiceNum;
                 CP.Merchant:=Terminal.getExtraMerchName;

{                 if edCard.Text='' then
                  Repeat
                   if EnterIntValue(nC,'Введите 4 последних цифры номера банковской карточки!') then
                    begin
                     edCard.Text:=IntToStr(nC);
                     Break;
                    end;
                  Until False;
}
                 BitBtn1Click(BitBtn1);
                 Break;
                end;
     end;
   finally
    BitBtn3.Caption:='Оплатить по терминалу';
    StartTerminal:=False;
    BitBtn3.Tag:=1;
   end;
  except
   on E:Exception do MainF.MessBox('Ошибка оплаты по терминалу: '+E.Message);
  end;
 end;

procedure TBankCardF.FormActivate(Sender: TObject);
 begin
  if CP.TypeOplatBS in [DO_BEZGOT1,DO_BEZGOT3] then BitBtn3.Enabled:=False;
 end;

procedure TBankCardF.CheckBox1Click(Sender: TObject);
 begin
  ComboBox1.Enabled:=CheckBox1.Checked;
 end;

end.

// ,



