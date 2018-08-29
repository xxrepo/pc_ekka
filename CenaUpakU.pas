unit CenaUpakU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TCenaUpakF = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    cbPerc: TComboBox;

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cbPercChange(Sender: TObject);
    procedure cbPercKeyPress(Sender: TObject; var Key: Char);

  private

    FKol:Integer;
    FCena:Real;
    FNames:String;

    procedure SetCena;

  public

    property Kol:Integer read FKol write FKol;
    property Cena:Real read FCena write FCena;
    property Names:String read FNames write FNames;

  end;

var
  CenaUpakF: TCenaUpakF;

implementation

uses MainU;

{$R *.dfm}

procedure TCenaUpakF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TCenaUpakF.SetCena;
var Skd:Integer;
 begin
  try
   Skd:=StrToInt(cbPerc.Text);
  except
   Skd:=0;
  end;
  Label2.Caption:=CurrToStrF(Cena*Kol*((100-Skd)/100),ffFixed,2)+' грн. ';
 end;

procedure TCenaUpakF.FormActivate(Sender: TObject);
 begin
  Label1.Caption:='Цена за упаковку препарата "'+Names+'": ';
  SetCena;
 end;

procedure TCenaUpakF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TCenaUpakF.cbPercChange(Sender: TObject);
 begin
  SetCena;
 end;

procedure TCenaUpakF.cbPercKeyPress(Sender: TObject; var Key: Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

end.
