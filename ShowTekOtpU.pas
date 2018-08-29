unit ShowTekOtpU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids;

type
  TShowTekOtpF = class(TForm)
    Panel1: TPanel;
    lb1: TLabel;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShowTekOtpF: TShowTekOtpF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TShowTekOtpF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TShowTekOtpF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

procedure TShowTekOtpF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
    pr:Integer;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  db.Canvas.Brush.Color:=clWhite;
  db.Canvas.Font.Color:=DBGrid1.Columns[DataCol].Font.Color;

  if (db.DataSource.DataSet.FieldByName('NReady').AsInteger=0) and (DataCol=2) then db.Canvas.Font.Color:=clRed;
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);

 end;

end.
