unit EnterKolScanU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons;

type

  TEnterKolScanF = class(TForm)
    Label1: TLabel;
    edKol: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbHand: TCheckBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edKolKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure cbHandClick(Sender: TObject);

  private

    FFlag:Integer;

  public

    property Flag:Integer read FFlag write FFlag;

  end;

var EnterKolScanF:TEnterKolScanF;

implementation

uses MainU;

{$R *.dfm}

procedure TEnterKolScanF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Flag:=0;
 end;

procedure TEnterKolScanF.edKolKeyPress(Sender: TObject; var Key: Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

procedure TEnterKolScanF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TEnterKolScanF.BitBtn1Click(Sender: TObject);
 begin
  if edKol.Text='' then
   begin
    MainF.MessBox('Введите числовое значение количества!');
    edKol.SetFocus;
   end else begin
             Flag:=1;
             Close;
            end; 
 end;

procedure TEnterKolScanF.FormKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if (Key=VK_SPACE) and (edKol.Enabled) then
   begin
    cbHand.Checked:=True;
    edKol.ReadOnly:=False;
   end;
 end;

procedure TEnterKolScanF.cbHandClick(Sender: TObject);
 begin
  cbHand.Checked:=True;
  edKol.ReadOnly:=False;
 end;

end.
