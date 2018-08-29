unit ChoosePayU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TChoosePayF = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);

  private

  public

    Flag:Integer;

  end;

var ChoosePayF: TChoosePayF;

implementation

uses MainU;

{$R *.dfm}

procedure TChoosePayF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  if Prm.IsKurier then
   begin
    Height:=508;
    BitBtn4.Visible:=True;
    BitBtn5.Visible:=True;
    BitBtn6.Visible:=True;
    BitBtn2.Top:=280;

    BitBtn5.Caption:='Банковский чек (Безнал 2)';
    BitBtn2.Caption:='Чек по терминалу (Безнал 3)';

   end else
{
  if MainF.ID_Doctor>0 then
   begin
    BitBtn6.Visible:=True;
    Height:=351;
    BitBtn2.Top:=115;
    BitBtn6.Top:=198;
   end else} begin
             Height:=268;
             BitBtn2.Top:=115;
            end;
  Flag:=0;
 end;

procedure TChoosePayF.BitBtn3Click(Sender: TObject);
 begin
  Close;
 end;

procedure TChoosePayF.BitBtn1Click(Sender: TObject);
 begin
  Flag:=1;
  Close;
 end;

procedure TChoosePayF.BitBtn2Click(Sender: TObject);
 begin
  Flag:=2;
  Close;
 end;

procedure TChoosePayF.BitBtn4Click(Sender: TObject);
 begin
  Flag:=3;
  Close;
 end;

procedure TChoosePayF.BitBtn5Click(Sender: TObject);
 begin
  Flag:=4;
  Close;
 end;

procedure TChoosePayF.BitBtn6Click(Sender: TObject);
 begin
  Flag:=5;
  Close;
 end;

end.
