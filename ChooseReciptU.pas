unit ChooseReciptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TChooseReciptF = class(TForm)
    GroupBox1: TGroupBox;
    rb1: TRadioButton;
    rb2: TRadioButton;
    GroupBox2: TGroupBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    cbMed: TComboBox;
    Label2: TLabel;
    cbZabolev: TComboBox;
    Label3: TLabel;
    edFIO: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private

  public

    Flag:Byte;

  end;

var ChooseReciptF: TChooseReciptF;

implementation

uses MainU;

{$R *.dfm}

procedure TChooseReciptF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TChooseReciptF.BitBtn2Click(Sender: TObject);
 begin
  if (rb1.Checked=False) and (rb2.Checked=False) then
   begin
    MainF.MessBox('Выберите тип рецепта!');
    Exit;
   end else
  if cbMed.Text='' then
   begin
    MainF.MessBox('Выберите или введите учреждение, выдавшее рецепт!');
    cbMed.SetFocus;
    Exit;
   end else
  if cbZabolev.Text='' then
   begin
    MainF.MessBox('Выберите или введите группу заболеваний!');
    cbMed.SetFocus;
    Exit;
   end;

  Flag:=1;
  Close;
 end;

end.
 