unit EnterNDocU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TEnterNDocF = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);

  private

  public

    Flag:Integer;

  end;

var EnterNDocF:TEnterNDocF;

implementation

uses MainU;

{$R *.dfm}

procedure TEnterNDocF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TEnterNDocF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TEnterNDocF.BitBtn1Click(Sender: TObject);
 begin
  if Length(Edit1.Text)<>3 then
   begin
    MainF.MessBox('Введите 3-х символьное значение "Серии"');
    Edit1.SetFocus;
   end else
  if Length(Edit2.Text)<>6 then
   begin
    MainF.MessBox('Введите 6-х символьное цифровое значение "Номера"');
    Edit1.SetFocus;
   end else begin
             Flag:=1;
             Close;
            end; 
 end;

procedure TEnterNDocF.Edit2KeyPress(Sender: TObject; var Key: Char);
 begin
  if Key<>#8 then
   begin
    if Length(Edit2.Text)>=6 then Key:=#0;
    if Not (Key in CH_DIGIT) then Key:=#0;
   end;
 end;

procedure TEnterNDocF.Edit1KeyPress(Sender: TObject; var Key: Char);
 begin
  if Key<>#8 then
   begin
    if Length(Edit1.Text)>=3 then Key:=#0;
    if Not (Key in ['A'..'Z','a'..'z','Ё','ё','А'..'я']) then Key:=#0 else Key:=AnsiUpperCase(Key)[1];
   end; 
 end;

end.
