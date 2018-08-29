unit MessThemsU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type

  TMessThemsF = class(TForm)
    RadioButton1: TRadioButton;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    RadioButton2: TRadioButton;
    Panel2: TPanel;
    Label3: TLabel;
    RadioButton3: TRadioButton;
    Panel3: TPanel;
    Label4: TLabel;
    RadioButton4: TRadioButton;
    Panel4: TPanel;
    Label5: TLabel;
    Panel5: TPanel;
    Label6: TLabel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    RadioButton7: TRadioButton;
    Panel6: TPanel;
    Label7: TLabel;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private

  public

    Flag:Integer;

  end;

var MessThemsF: TMessThemsF;

implementation

uses MainU;

{$R *.dfm}

procedure TMessThemsF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Flag:=-1;
  BitBtn2.Glyph.Assign(MainF.imStar.Picture);
  BitBtn1.Glyph.Assign(MainF.imStop.Picture);
 end;

procedure TMessThemsF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TMessThemsF.BitBtn2Click(Sender: TObject);
 begin
  Flag:=-1;
  if RadioButton1.Checked then Flag:=1 else
  if RadioButton2.Checked then Flag:=10 else
  if RadioButton3.Checked then Flag:=14 else
  if RadioButton4.Checked then Flag:=38 else
  if RadioButton5.Checked then Flag:=41 else
  if RadioButton7.Checked then Flag:=99 else
  if RadioButton8.Checked then Flag:=48 else
  if RadioButton6.Checked then Flag:=31 else
  if RadioButton9.Checked then Flag:=82 else
  if RadioButton10.Checked then Flag:=81 else
   begin
    MainF.MessBox('Ни одна из тем не выбрана');
    Exit;
   end;
  if Flag<>-1 then Close;
 end;

end.
