unit ZXRepU;

interface

uses
  Forms, Controls, StdCtrls, ComCtrls, Buttons, Classes, ExtCtrls, DB, SysUtils,
  EKKAU, Util, Variants, Windows;
// , Messages, Graphics, Dialogs,

type

  TZXRepF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    BitBtn5: TBitBtn;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn6: TBitBtn;
    Label5: TLabel;
    BitBtn7: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Panel4: TPanel;
    Label6: TLabel;
    BitBtn9: TBitBtn;
    DateTimePicker3: TDateTimePicker;
    BitBtn8: TBitBtn;
    Label8: TLabel;
    ComboBox2: TComboBox;
    BitBtn10: TBitBtn;
    Edit4: TEdit;
    BitBtn11: TBitBtn;

    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);

  private
  public
  end;

var ZXRepF:TZXRepF;

implementation

uses
  MainU, ShareU, DataModuleU;

{$R *.dfm}

procedure TZXRepF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  DateTimePicker3.Time:=Time;
  ComboBox2.ItemIndex:=StrToInt(FormatDateTime('mm',Date()))-1;
  ComboBox2Change(ComboBox2);
  Edit4.Visible:=Prm.UserRole=R_ADMIN;
  BitBtn11.Visible:=Prm.UserRole=R_ADMIN;

  try

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select Value from Spr_Const (nolock) where Descr=''PeriodRep'' ';
   DM.QrEx.Open;
   Prm.PeriodRep:=DM.QrEx.FieldByName('Value').AsInteger=1;

  except
  end;

  Panel3.Visible:=Prm.PeriodRep;
 end;

procedure TZXRepF.BitBtn1Click(Sender:TObject);
 begin
  MainF.ShowErrorEKKA(EKKA.fpZeroCheck);
 end;

procedure TZXRepF.BitBtn2Click(Sender:TObject);
var R:TRep;
 begin
  if Opt.EKKAAsPrinter=False then MainF.ShowErrorEKKA(EKKA.fpXRep);
 end;

procedure TZXRepF.BitBtn3Click(Sender:TObject);
var
  CP:TChekPos;
begin
  if MainF.MessBox('Вы действительно хотите снять Z-отчет',52)<>ID_Yes then Exit;
  Write7hourStat;
  Repeat
    if EKKA.fpXRep then Break;
    if EKKA.LastError='SOFTSLZREP' then
    begin
      if MainF.MessBox('Переведите ключ в положение X. Для отмены снятия X-отчета нажмите "Нет"',52)<>ID_YES then Exit;
    end
    else
    begin
      MainF.MessBox(EKKA.LastErrorDescr);
      Exit;
    end;
  Until False;

  if EKKA.EmulEKKA=False then
  begin
    CheckStatusCheck(CP,ST_ZREP);
    EKKA.fpSetTime(Now);
    if (EKKA.TypeEKKA=EKKA_MARRY301MTM) then
      MainF.ShowErrorEKKA(EKKA.fpZeroCheck);
  end
  else
   begin
    EKKA.fpZRep;
    EKKA.fpZeroCheck;
   end;
  InitiateUnLoading(DM.Qr);
end;

(*
var Res:Boolean;
    SumA,SumB,SumBA,SumBB:Real;
 begin
  if MainF.MessBox('Вы действительно хотите снять Z-отчет',52)<>ID_Yes then Exit;
  Repeat
   if EKKA.fpXRep then Break;
   if EKKA.LastError='SOFTSLZREP' then
    if MainF.MessBox('Переведите ключ в положение X. Для отмены снятия X-отчета нажмите "Нет"',52)<>ID_YES then Exit else
   else begin
         MainF.MessBox(EKKA.LastErrorDescr);
         Exit;
        end;
  Until False;

  SumA:=0; SumB:=0; SumBA:=0; SumBB:=0;
  if EKKA.TypeEKKA=EKKA_MARRY301MTM then WriteToJournZ(0,SumA,SumB,SumBA,SumBB);
  if EKKA.fpFiscState then
   try

    SumA:=StrToInt64(EKKA.RD_Item[1])*0.01;
    SumB:=StrToInt64(EKKA.RD_Item[2])*0.01;
    SumBA:=StrToInt64(EKKA.RD_Item[11])*0.01;
    SumBB:=StrToInt64(EKKA.RD_Item[12])*0.01;

   except
   end;

  Repeat
   { if Not EKKA.KeyPosition(KEY_Z) then
     if MainF.MessBox('Переведите ключ в положение Z. Для отмены снятия Z-отчета нажмите "Нет"',52)<>ID_YES then Exit
                                                                                                            else Continue;
                                                                                                            }
   if EKKA.TypeEKKA<>EKKA_MARRY301MTM then
    begin
     DM.ADOCo.BeginTrans;
     WriteToJournZ(1,SumA,SumB,SumBA,SumBB);
     Res:=EKKA.fpZRep;
     if Res then DM.ADOCo.CommitTrans else DM.ADOCo.RollbackTrans;
    end else Res:=EKKA.fpZRep;

   if Res then
    begin
     EKKA.fpSetTime(Time);
     if EKKA.TypeEKKA=EKKA_MARRY301MTM then
      MainF.ShowErrorEKKA(EKKA.fpZeroCheck);
     Break;
    end else MainF.ShowErrorEKKA(Res);
  Until False;
  if EKKA.TypeEKKA=EKKA_MARRY301MTM then WriteToJournZ(1,SumA,SumB,SumBA,SumBB);

  InitiateUnLoading(DM.Qr);

 end;     *)

procedure TZXRepF.BitBtn4Click(Sender:TObject);
var Sum:Currency;
    ss:String;
 begin
  if Opt.EKKAAsPrinter then
   begin
    MainF.MessBox('В данном режиме невозможна функция "Внесение"!');
    Exit;
   end;
  Edit1.Text:=CorrFloatNum(Edit1.Text);
  Sum:=StrToCurr(Edit1.Text);
  if Not IsFloat(Edit1,'Введите денежное значение!',MFC) then Exit;
  if MainF.MessBox('Вы действительно хотите внести сумму '+Edit1.Text+' грн. ?',52)<>ID_YES then Exit;

  MainF.ShowErrorEKKA(EKKA.fpCashInput(Sum));
  if EKKA.LastError<>'' then Exit;
  TryWriteToJournal;
  if EKKA.EmulEKKA=False then
   try
    ss:=CurrToStrF(Sum,ffFixed,2);
    if Pos(',',ss)>0 then ss:=StringReplace(ss,',','.',[rfReplaceAll]);
    DM.QrEx.Close;
    DM.QrEx.SQL.Clear;
    DM.QrEx.SQL.Add('insert into CashOutPutLog(Dt,         Summa, vzh,                      id_kassa,                 id_user,               Cash, IsPrint,InOut)');
    DM.QrEx.SQL.Add('                   values(getdate(),'+ss+','+IntToStr(EKKA.VzhNum)+','+IntToStr(Opt.KassaID)+','+IntToStr(Prm.UserID)+',0,    0,      1)');
//    DM.QrEx.SQL.Add('                   values(getdate(),'+CurrToStrF(Sum,ffFixed,2)+','+IntToStr(EKKA.VzhNum)+','+IntToStr(Opt.KassaID)+','+IntToStr(Prm.UserID)+',0,    0,      1)');
    DM.QrEx.ExecSQL;
   except
    on E:EXception do MainF.MessBox('Ошибка записи в журнал выдач: '+E.Message);
   end;
 end;

procedure TZXRepF.BitBtn5Click(Sender: TObject);
var sVzh,sP:String;
    SumOst,SumCash,Sum:Currency;
    CP:TChekPos;
    B:Boolean;
    ss, ss1: string;

 begin

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select top 1 * from spr_const (nolock)';
  try
   DM.QrEx.Open;
  except
   DM.ADOCo.Connected:=False;
   DM.ADOCo.Connected:=True;
   try
    DM.QrEx.Open;
   except
    on E:Exception do
     begin
      MainF.MessBox('Нет подключения к главному компьютеру (серверу). Попробуйте перезагрузить компьютер! Если не поможет - обращайтесь в IT-отдел.');
      Exit;
     end; 
   end;
  end;

  EKKA.fpGetStatus;
  if EKKA.LastError<>'' then Abort;

  if Ord(EKKA.RD_Item[9][1])=1 then
   begin
    MainF.MessBox('Смена на кассовом аппарате не открыта (не было продаж после последнего Z-отчета).');
    Exit;
   end;

  SumCash:=0;

  try

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select Value from Spr_Const (nolock) where Descr=''MaxCashSum'' ';
   DM.QrEx.Open;
   Prm.MaxCashSum:=DM.QrEx.FieldByName('Value').AsCurrency;

  except
  end;

  Edit1.Text:=CorrFloatNum(Edit1.Text);
  if Not IsFloat(Edit1,'Введите денежное значение!',MFC) then Exit;
  Sum:=StrToCurr(Edit1.Text);
  if Sum<=0 then Exit;
  if MainF.MessBox('Вы действительно хотите выдать сумму '+Edit1.Text+' грн. ?',52)<>ID_YES then Exit;

  if (Opt.EKKAAsPrinter=False) or (EKKA.EmulEKKA) then
   begin
    if ((EKKA.EmulEKKA=False) and (ReadCashState(CP,0)=False)) or
       ((EKKA.EmulEKKA=True ) and (EKKA.fpCashState(0)=False)) then
     begin
      MainF.MessBox('Ошибка чтения сумм РРО: '+EKKA.LastErrorDescr);
      Exit;
     end else begin
               if EKKA.EmulEKKA=False then SumOst:=CP.Sums[5]
                                      else SumOst:=StrToInt(EKKA.RD_Item[5])*0.01;
              end;

    SumCash:=SumOst-Sum;

    if SumOst-Sum>Prm.MaxCashSum then
     begin
      MainF.MessBox('Минимальная сумма выдачи '+CurrToStrF(SumOst-Prm.MaxCashSum,ffFixed,2)+' грн., так как остаток денег в кассе после выдачи не должен превышать '+CurrToStrF(Prm.MaxCashSum,ffFixed,2)+' грн.');
      Exit;
     end;
    MainF.ShowErrorEKKA(EKKA.fpCashOutput(Sum));
   end;

  if (EKKA.LastError<>'') {and (AnsiUpperCase(EKKA.LastError)<>'HARDCUTTER')} then
   MainF.RegisterError('Ошибка выдачи',EKKA.LastError,True);

  if (EKKA.LastError='') or (Opt.EKKAAsPrinter=True) then
   try

    if Opt.EKKAAsPrinter=False then
     begin

      EKKA.fpOpenCashBox;
      sVzh:=IntToStr(EKKA.VzhNum);
      sP:='0';
      TryWriteToJournal;
     end else begin
               sP:='1';
               sVzh:=IntToStr(Opt.KassaID);
               DM.QrEx.Close;
               DM.QrEx.SQL.Text:='exec spY_GetCashPrint '+sVzh;
               DM.QrEx.Open;

               if DM.QrEx.FieldByName('Sm').AsCurrency<Sum then
                begin
                 MainF.MessBox('Вы можете выдать сумму не более '+CurrToStrF(DM.QrEx.FieldByName('Sm').AsCurrency,ffFixed,2)+' грн. !');
                 Exit;
                end else
               if DM.QrEx.FieldByName('Sm').AsCurrency-Sum>Prm.MaxCashSum then
                begin
                 MainF.MessBox('Минимальная сумма выдачи '+CurrToStrF(DM.QrEx.FieldByName('Sm').AsCurrency-Prm.MaxCashSum,ffFixed,2)+' грн.');
                 Exit;
                end;

               SumCash:=DM.QrEx.FieldByName('Sm').AsCurrency-Sum;
              end;

   if EKKA.EmulEKKA=False then
    begin
     DM.QrEx.Close;

     ss:=Edit1.Text;
     if Pos(',',ss)>0 then ss:=StringReplace(ss,',','.',[rfReplaceAll]);

     ss1:=CurrToStrF(SumCash,ffFixed,2);
     if Pos(',',ss1)>0 then ss1:=StringReplace(ss1,',','.',[rfReplaceAll]);

     DM.QrEx.SQL.Clear;
     DM.QrEx.SQL.Add(' insert into CashOutPutLog(Dt,         Summa, vzh,     id_kassa,                 id_user,                 Cash,   IsPrint,InOut)');
     DM.QrEx.SQL.Add('                    values(getdate(),'+CorrCurr(ss)+','+sVzh+','+IntToStr(Opt.KassaID)+','+IntToStr(Prm.UserID)+','+CorrCurr(ss1)+','+sP+',   -1)');
//     DM.QrEx.SQL.Add('                    values(getdate(),'+Edit1.Text+','+sVzh+','+IntToStr(Opt.KassaID)+','+IntToStr(Prm.UserID)+','+CurrToStrF(SumCash,ffFixed,2)+','+sP+',   -1)');
     DM.QrEx.SQL.Add(' select 999 as Res');
//     DM.QrEx.SQL.SaveToFile('123');
     DM.QrEx.Open;
    end;
   except
    on E:EXception do MainF.RegisterError('Ошибка записи в журнал выдач',E.Message,False);
   end;
 end;

procedure TZXRepF.BitBtn7Click(Sender:TObject);
 begin
  MainF.ShowErrorEKKA(EKKA.fpPerFullRepD(DateTimePicker1.Date,DateTimePicker2.Date));
 end;

procedure TZXRepF.BitBtn6Click(Sender:TObject);
 begin
  if Edit2.Text='' then Edit2.Text:='0';
  if Edit3.Text='' then Edit3.Text:='0';
  if IsInt(Edit2,'Введите числовое значение номера Z-отчета',MFC) then
   if IsInt(Edit3,'Введите числовое значение номера Z-отчета',MFC) then
    MainF.ShowErrorEKKA(EKKA.fpPerFullRepN(StrToInt(Edit2.Text),StrToInt(Edit3.Text)));
 end;

procedure TZXRepF.BitBtn8Click(Sender: TObject);
 begin
  Close;
 end;

procedure TZXRepF.BitBtn9Click(Sender:TObject);
 begin
  DateTimePicker3.Date:=Date();
  MainF.ShowErrorEKKA(EKKA.fpSetTime(DateTimePicker3.Time));
 end;

procedure TZXRepF.ComboBox2Change(Sender:TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    DateTimePicker1.Date:=D1;
    DateTimePicker2.Date:=D31;
   end;
 end;

procedure TZXRepF.BitBtn10Click(Sender: TObject);
 begin
  MainF.ShowErrorEKKA(EKKA.fpDiscRep);
 end;

procedure TZXRepF.Edit1DblClick(Sender: TObject);
 begin
  if (MainF.Design) or (Prm.UserRole=R_ADMIN) then
   begin
    EKKA.fpCashState(0);
    Edit1.Text:=CurrToStr(StrToInt(EKKA.RD_Item[5])*0.01);
   end;
 end;

procedure TZXRepF.BitBtn11Click(Sender:TObject);
 begin
  EKKA.bPrintRep(1,StrToInt(Edit4.Text));
 end;

end.







