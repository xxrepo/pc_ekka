unit NoScanViewU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids;

type
  TNoScanViewF = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);

  private

  public

  end;

var NoScanViewF:TNoScanViewF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TNoScanViewF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
 end;

procedure TNoScanViewF.FormShortCut(var Msg:TWMKey; var Handled:Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

end.
