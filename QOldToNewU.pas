unit QOldToNewU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, Buttons, Util;

type

  TQOldToNewF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);

  private

  public

    PSkd:Integer;
    Flag:Integer;
    AccumSum:Currency;

  end;

var QOldToNewF:TQOldToNewF;

implementation

uses MainU;

{$R *.dfm}

procedure TQOldToNewF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Flag:=0;
  if Prm.AptekaID=163 then BitBtn2.Enabled:=False;
 end;

procedure TQOldToNewF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TQOldToNewF.BitBtn1Click(Sender: TObject);
var Res:String;
 begin
  if Prm.AptekaID=163 then
   begin
    Flag:=1;
    Close;
    Exit;
   end;
  if MainF.MessBox('Вы действительно уверены, что покупатель хочет перейти на новую дисконтную программу?'+#10#10+
                   'После перехода на новую программу, переход к старой будет НЕВОЗМОЖЕН!',52,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res)=ID_YES then
   begin
    Flag:=1;
    Close;
   end;
 end;

procedure TQOldToNewF.FormCloseQuery(Sender:TObject; var CanClose:Boolean);
var S:String;
    Res:String;
 begin
  CanClose:=False;
  if Flag=0 then
   begin
    if Prm.AptekaID<>163 then
     begin
      if Pskd=1 then S:='После перехода на новую программу, покупатель получит преимущество в качестве дополнительный '+IntToStr(PSkd)+'-x % скидки!'
                else S:='После перехода на новую программу, покупатель получит преимущество в качестве дополнительных '+IntToStr(PSkd)+'-x % скидки!';

      if MainF.MessBox('Вы действительно уверены, что покупатель не хочет переходить на новую дисконтную программу?'+#10#10+
                         S,52,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res)=ID_YES then CanClose:=True;
     end;
   end else CanClose:=True;
 end;

procedure TQOldToNewF.FormActivate(Sender:TObject);
 begin
  if PSkd=1 then
   Label2.Caption:='Предложите покупателю перейти на НОВУЮ дисконтную программу и получить дополнительный '+IntToStr(PSkd)+'% к текущей скидке !!!'
  else
   Label2.Caption:='Предложите покупателю перейти на НОВУЮ дисконтную программу и получить дополнительных '+IntToStr(PSkd)+'% к текущей скидке !!!';

  Label3.Visible:=Prm.AptekaID<>163;

{  if (Prm.AptekaID=58) and (AccumSum>0) then
   begin
    Label4.Visible:=True;
    Label4.Caption:='Накопления на карте: '+CurrToStrF(AccumSum,ffFixed,2)+' грн.';
   end;
}
 end;

end.
