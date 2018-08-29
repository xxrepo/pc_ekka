unit Mess1U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TMess1F = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Mess1F: TMess1F;

implementation

uses MainU;

{$R *.dfm}

procedure TMess1F.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TMess1F.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  BitBtn1.Glyph.Assign(MainF.imStop.Picture);
 end;

end.
