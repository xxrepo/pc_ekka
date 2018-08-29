unit BonusStateU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TBonusStateF = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var BonusStateF: TBonusStateF;

implementation

uses DataModuleU;

{$R *.dfm}

procedure TBonusStateF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TBonusStateF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  Case db.DataSource.DataSet.FieldByName('Done').AsInteger of
   1:db.Canvas.Brush.Color:=clLime;
   0:db.Canvas.Brush.Color:=clYellow;
  end;

  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);

 end;

end.
