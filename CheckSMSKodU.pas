unit CheckSMSKodU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, Util;

type
  TCheckSMSKodF = class(TForm)
    Edit1: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;

    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);

  private

  public

    Flag:Byte;
    Kod:String;

  end;

var CheckSMSKodF:TCheckSMSKodF;

implementation

uses MainU;

{$R *.dfm}

procedure TCheckSMSKodF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  Flag:=0;
 end;

procedure TCheckSMSKodF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TCheckSMSKodF.BitBtn1Click(Sender:TObject);
 begin

  if Not ((Edit1.Text=Kod) or (Edit1.Text=GetKodForEachHour)) then
   begin
    MainF.MessBox('Код введен неверно!');
    Edit1.SetFocus;
    Exit;
   end else begin
             Flag:=1;
             Close;
            end; 
 end;

end.
