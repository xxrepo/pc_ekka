unit ClDiagU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TClDiagF = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

    Flag:Integer;

  end;

var ClDiagF: TClDiagF;

implementation

uses MainU;

{$R *.dfm}

procedure TClDiagF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TClDiagF.BitBtn1Click(Sender: TObject);
 begin
  if (RadioButton1.Checked=False) and (RadioButton2.Checked=False) then MainF.MessBox('Выберите тип закрытия окна!') else
   begin
    Flag:=1;
    Close;
   end; 
 end;

procedure TClDiagF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Flag:=0;
 end;

end.
