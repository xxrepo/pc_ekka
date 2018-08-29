unit SpisArtCenaU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TSpisArtCenaF = class(TForm)
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure BitBtn2Click(Sender: TObject);

  private

  public

  end;

var SpisArtCenaF: TSpisArtCenaF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TSpisArtCenaF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TSpisArtCenaF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

procedure TSpisArtCenaF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

end.
