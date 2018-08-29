unit ShowAkciiU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons;

type
  TShowAkciiF = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private

  public

  end;

var ShowAkciiF:TShowAkciiF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TShowAkciiF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TShowAkciiF.BitBtn1Click(Sender: TObject);
 begin
  Close
 end;

procedure TShowAkciiF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
    pr:Integer;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  db.Canvas.Brush.Color:=clBtnFace;
  db.Canvas.Font.Color:=clBlack;
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

end.


