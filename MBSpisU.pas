unit MBSpisU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TMBSpisF = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MBSpisF:TMBSpisF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TMBSpisF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  DM.qrMBSpis.Close;
  DM.qrMBSpis.Open;
  BitBtn2.Glyph.Assign(MainF.imStop.Picture);
 end;

procedure TMBSpisF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

end.
