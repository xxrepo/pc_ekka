unit RegPredstU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TRegPredstF = class(TForm)

    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Button1: TButton;

    procedure FormCreate(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private

//    sSr:String;
    FOnlyScan:Boolean;
    FFlag:Boolean;
    FEAN13: String;

  public

    sSr:String;
    Tab,Cap,crPref:String;

    property OnlyScan:Boolean read FOnlyScan write FOnlyScan; //True -возвращает только штрихкод без регистрации данных в таблицах
    property Flag:Boolean read FFlag write FFlag;
    property EAN13:String read FEAN13 write FEAN13;

  end;

var RegPredstF:TRegPredstF;

implementation

uses MainU, DataModuleU, DailyOperationSelection;

{$R *.dfm}

procedure TRegPredstF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  FOnlyScan:=False;
  FFlag:=False;
  FEAN13:='';
  sSr:='';
 end;

procedure TRegPredstF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

procedure TRegPredstF.FormKeyPress(Sender: TObject; var Key: Char);
var F:Integer;
 begin
  if Key in CH_DIGIT then
   begin
    sSr:=sSr+Key;
    if Length(sSr)=13 then
     try
      try
       if Copy(sSr,1,3)<>crPref then begin  MainF.MessBox('Карточка '+sSr+' не является карточкой '+Cap+'!'); Exit; end;

       if crPref=CR_PREDST then
        begin
         DM.Qr3.Close;
         DM.Qr3.SQL.Text:='select * from SprPredst where id_p='+sSr;
         DM.Qr3.Open;
         if DM.Qr3.IsEmpty then begin MainF.MessBox('Карточка медпредставителя № '+sSr+' заблокирована!'); Exit; end;
        end else

       {
        if crPref=CR_DRIVER then
        begin
         DM.Qr3.Close;
         DM.Qr3.SQL.Text:='select * from SprDrivers where id_d='+Copy(sSr,1,12);
         DM.Qr3.Open;
         if DM.Qr3.IsEmpty then begin MainF.MessBox('Карточка водителя № '+sSr+' заблокирована!'); Exit; end;
        end;
       }
       if crPref=CR_DRIVER {CR_EMPLO} then
        begin
         DM.Qr3.Close;
         DM.Qr3.SQL.Text:='select * from SPREmplo where id_d='+Copy(sSr,1,12);
         DM.Qr3.Open;

         if DM.Qr3.IsEmpty then begin MainF.MessBox('Карточка сотрудника № '+sSr+' заблокирована!'); Exit; end;

         //регистрация приходов/уходов
         if OnlyScan=False then
          begin
           FormDailyOperationSelection:=TFormDailyOperationSelection.Create(self);
           try
            FormDailyOperationSelection.EmployeeID:=DM.Qr3.FieldByName('id_employee').AsVariant;
            Application.ProcessMessages;
            FormDailyOperationSelection.ShowModal;
           finally
            FormDailyOperationSelection.Free;
           end;
          end;
        end;

       if OnlyScan=False then
        begin
         DM.Qr3.Close;
         DM.Qr3.SQL.Text:='select top 1 * from '+Tab+' where id_p='+sSr+' order by dt desc, flag desc';
         DM.Qr3.Open;

         F:=2;
         if DM.Qr3.IsEmpty or (DM.Qr3.FieldByName('Flag').AsInteger=2) then F:=1;

         DM.Qr3.Close;
         DM.Qr3.SQL.Text:='insert into '+Tab+'(id_p,dt,Flag) values('+sSr+',getdate(),'+IntToStr(F)+')';
         DM.Qr3.ExecSQL;

         if crPref<>CR_DRIVER then
          Case F of
           1:MainF.MessBox('Приход '+Cap+' с карточкой №'+sSr+' зарегистрирован успешно!',64);
           2:MainF.MessBox('Уход '+Cap+' с карточкой №'+sSr+' зарегистрирован успешно!',64);
          end;
        end else begin
                  EAN13:=sSr;
                  Flag:=True;
                 end;
       Close;
      except
       on E:Exception do MainF.MessBox('Ошибка регистрации карточки '+Cap+': '+E.Message);
      end;
     finally
      sSr:='';
     end;
   end;
 end;

procedure TRegPredstF.FormKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key in K_ARROW_KEYS then sSr:='';
 end;

procedure TRegPredstF.SpeedButton1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TRegPredstF.FormActivate(Sender: TObject);
 begin
  Label1.Caption:='Проведите карточку '+Cap+' через сканер...';
 end;

procedure TRegPredstF.Button1Click(Sender: TObject);
begin
  RegPredstF.ActiveControl:=nil;
{2710000202829}
  keybd_event(ord('2'),0,0,0);
  keybd_event(ord('2'),0,KEYEVENTF_KEYUP,0);
  Application.ProcessMessages;
//  Sleep(1000);

  keybd_event(ord('7'),0,0,0);
  keybd_event(ord('7'),0,KEYEVENTF_KEYUP,0);
  Application.ProcessMessages;
//  Sleep(1000);

  keybd_event(ord('1'),0,0,0);
  keybd_event(ord('1'),0,KEYEVENTF_KEYUP,0);
  Application.ProcessMessages;
//  Sleep(1000);

  keybd_event(ord('0'),0,0,0);
  keybd_event(ord('0'),0,KEYEVENTF_KEYUP,0);
  Application.ProcessMessages;
//  Sleep(1000);

  keybd_event(ord('0'),0,0,0);
  keybd_event(ord('0'),0,KEYEVENTF_KEYUP,0);
  Application.ProcessMessages;
//  Sleep(1000);

  keybd_event(ord('0'),0,0,0);
  keybd_event(ord('0'),0,KEYEVENTF_KEYUP,0);
  Application.ProcessMessages;
//  Sleep(1000);

  keybd_event(ord('0'),0,0,0);
  keybd_event(ord('0'),0,KEYEVENTF_KEYUP,0);
  Application.ProcessMessages;
//  Sleep(1000);

  keybd_event(ord('2'),0,0,0);
  keybd_event(ord('2'),0,KEYEVENTF_KEYUP,0);
  Application.ProcessMessages;
//  Sleep(1000);

  keybd_event(ord('0'),0,0,0);
  keybd_event(ord('0'),0,KEYEVENTF_KEYUP,0);
  Application.ProcessMessages;
//  Sleep(1000);

  keybd_event(ord('2'),0,0,0);
  keybd_event(ord('2'),0,KEYEVENTF_KEYUP,0);
  Application.ProcessMessages;
//  Sleep(1000);

  keybd_event(ord('8'),0,0,0);
  keybd_event(ord('8'),0,KEYEVENTF_KEYUP,0);
  Application.ProcessMessages;
//  Sleep(1000);

  keybd_event(ord('2'),0,0,0);
  keybd_event(ord('2'),0,KEYEVENTF_KEYUP,0);
  Application.ProcessMessages;
//  Sleep(1000);

  keybd_event(ord('9'),0,0,0);
  keybd_event(ord('9'),0,KEYEVENTF_KEYUP,0);
  Application.ProcessMessages;
//  Sleep(1000);

end;

end.
