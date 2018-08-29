unit ShowZpMessU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TShowZpMessF = class(TForm)
    Panel1: TPanel;
    mmMess: TMemo;
    bbClose: TBitBtn;
    Timer1: TTimer;
    procedure bbCloseClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private

    FIncr:Integer;

  public
  end;

var
  ShowZpMessF: TShowZpMessF;

implementation

uses MainU;

{$R *.dfm}

procedure TShowZpMessF.bbCloseClick(Sender: TObject);
 begin
  if FIncr>=5 then Close;
 end;

procedure TShowZpMessF.Timer1Timer(Sender: TObject);
 begin
  Inc(FIncr);
  if FIncr<5 then
   bbClose.Caption:='Закрыть ('+IntToStr(5-FIncr)+')'
  else
   bbClose.Caption:='Я прочитал(а) сообщение';
 end;

procedure TShowZpMessF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  FIncr:=0;
 end;

end.
