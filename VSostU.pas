unit VSostU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TVSostF = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private

  public

    Flag:Integer;

  end;

var VSostF: TVSostF;

implementation

uses MainU;

{$R *.dfm}

procedure TVSostF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Flag:=0;
 end;

procedure TVSostF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TVSostF.BitBtn1Click(Sender: TObject);
 begin
  Flag:=1;
  Close;
 end;

end.
