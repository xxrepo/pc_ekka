unit ReklamaOnU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ActnList, ExtCtrls, StdCtrls, Buttons, Util;

type
  TReklamaOnF = class(TForm)
    ActionList1: TActionList;
    Action1: TAction;
    bbClose: TBitBtn;
    tmrWait: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    procedure Action1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrWaitTimer(Sender: TObject);
    procedure bbCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private

    Flag:Integer;
    FIncr:Integer;
    FMaxIncr:Integer;
    procedure SetMaxIncr(const Value: Integer);

  public

    property MaxIncr:Integer read FMaxIncr write SetMaxIncr;
    property Incr:Integer read FIncr write FIncr;


  end;

var ReklamaOnF:TReklamaOnF;

implementation

uses MainU, SimpleMessU, MessThemsU;

{$R *.dfm}

procedure TReklamaOnF.Action1Execute(Sender: TObject);
 begin
  //
 end;

procedure TReklamaOnF.FormCreate(Sender: TObject);
 begin

  Caption:=MFC;
  FIncr:=0;
  Label1.Caption:='Внимание сотрудники аптеки!'#10+
                  'Включите рекламу!!!'#10+
                  'Проверьте состояние вывески!!!!!'#10+
                  'Напишите сообщение на Call-центр!!!!!';

  Label2.Caption:='Заведующие аптеки, не выполняющие данное '#10+
                  'требование, будут депремированы !!!!';
  Flag:=0;
 end;

procedure TReklamaOnF.tmrWaitTimer(Sender: TObject);
 begin
  Inc(FIncr);
  if FIncr<FMaxIncr then
   bbClose.Caption:='Закрыть ('+IntToStr(FMaxIncr-FIncr)+')'
  else
   bbClose.Caption:='Я прочитал(а) сообщение';
 end;

procedure TReklamaOnF.bbCloseClick(Sender: TObject);
 begin
  if Flag=0 then
   try
    SimpleMessF.reW.Text:='';
    SimpleMessF.Tem:=33;
    SimpleMessF.ID_Dest:=6711;
    SimpleMessF.Label2.Caption:='Колцентр Оператор Чтение';
    Application.ProcessMessages;
    SimpleMessF.IsNeedSend:=True;
    try
     if SimpleMessF.Visible=False then SimpleMessF.ShowModal;
    except
    end;
   finally
    Flag:=1;
   end;
  Close;
 end;

procedure TReklamaOnF.SetMaxIncr(const Value:Integer);
 begin
  FMaxIncr:=Value;
  bbClose.Caption:='Закрыть ('+IntToStr(Value)+')';
 end;

procedure TReklamaOnF.FormActivate(Sender: TObject);
 begin
  AppendStringToFile('D:\AVA\ReklamaOn.txt',DateTimeToStr(Now));
 end;

end.
