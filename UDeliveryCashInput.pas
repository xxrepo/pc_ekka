unit UDeliveryCashInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Util, EKKAU, ShareU;

type

  TDeliveryCashInputF = class(TForm)
    ed_summ: TEdit;
    BitBtn_CashInput: TBitBtn;
    lbl_Summ: TLabel;
    BitBtn_Exit: TBitBtn;
    procedure BitBtn_CashInputClick(Sender: TObject);
    procedure ed_summKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn_ExitClick(Sender: TObject);

  private

  public

  end;

var DeliveryCashInputF:TDeliveryCashInputF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TDeliveryCashInputF.BitBtn_CashInputClick(Sender: TObject);
var Sum:Currency;
  ss: string;
 begin
  if Opt.EKKAAsPrinter then
   begin
    MainF.MessBox('В данном режиме невозможна функция "Внесение"!');
    Exit;
   end;

  ed_summ.Text:=CorrFloatNum(ed_summ.Text);
  Sum:=StrToCurr(ed_summ.Text);
  if Not IsFloat(ed_summ,'Введите денежное значение!',MFC) then Exit;
  if MainF.MessBox('Вы действительно хотите внести сумму '+ed_summ.Text+' грн. ?',52)<>ID_YES then Exit;

  MainF.ShowErrorEKKA(EKKA.fpCashInput(Sum));
  if EKKA.LastError<>'' then Exit;
  TryWriteToJournal;
  if EKKA.EmulEKKA=False then
   try
    ss:=CurrToStrF(Sum,ffFixed,2);
    if Pos(',',ss)>0 then ss:=StringReplace(ss,',','.',[rfReplaceAll]);
    DM.QrEx.Close;
    DM.QrEx.SQL.Clear;
    DM.QrEx.SQL.Add('insert into CashOutPutLog(Dt,         Summa, vzh,                      id_kassa,                 id_user,               Cash, IsPrint,InOut,TypeO)');
    DM.QrEx.SQL.Add('                   values(getdate(),'+ss+','+IntToStr(EKKA.VzhNum)+','+IntToStr(Opt.KassaID)+','+IntToStr(Prm.UserID)+',0,    0,      1,    2)');
//    DM.QrEx.SQL.Add('                   values(getdate(),'+CurrToStrF(Sum,ffFixed,2)+','+IntToStr(EKKA.VzhNum)+','+IntToStr(Opt.KassaID)+','+IntToStr(Prm.UserID)+',0,    0,      1)');
    DM.QrEx.ExecSQL;
   except
    on E:EXception do MainF.MessBox('Ошибка записи в журнал выдач: '+E.Message);
   end;

end;

procedure TDeliveryCashInputF.ed_summKeyPress(Sender: TObject;
  var Key: Char);
 var
  s, s1: string;
  i: integer;
  ttt : set of char;
begin
   ttt := ['1','2','3','4','5','6','7','8','9','0','.'];
//   if length( ed_summa.Text) >2 then
//    begin
//      key := Char(nil);
//      exit;
//    end;  

try
 If key = ',' then key := '.';
 If  (key <> char(8)) then
  begin
   if key  in ttt then
     begin
      if (pos('.',(Sender as Tedit).text)>0) and (key='.') then key := char(nil);
     end
    else key := Char(nil);

   end;
  except
   ShowMessage('Не привильный формат ввода');
 end;


end;

procedure TDeliveryCashInputF.BitBtn_ExitClick(Sender: TObject);
begin
    DeliveryCashInputF.Close;
end;

end.
