unit PlanMotivationStatU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type TPlanMotivationStatF = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
  private
  public
  end;

var PlanMotivationStatF:TPlanMotivationStatF;

implementation

uses DataModuleU, MainU;

{$R *.dfm}

procedure TPlanMotivationStatF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  DM.qrPMStat.Close;
  DM.qrPMStat.SQL.Text:='exec spY_PlanMotivationStat ';
  DM.qrPMStat.Open;
  DBGrid1.Columns[1].Title.Caption:='План1('+DM.qrPMStat.FieldByName('Prc1').AsString+'%)';
  DBGrid1.Columns[2].Title.Caption:='План2('+DM.qrPMStat.FieldByName('Prc2').AsString+'%)';
  DBGrid1.Columns[3].Title.Caption:='План3('+DM.qrPMStat.FieldByName('Prc3').AsString+'%)';
  DBGrid1.Columns[DM.qrPMStat.FieldByName('NumPrc').AsInteger].Color:=clLime;
 end;

procedure TPlanMotivationStatF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;  State: TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if db.DataSource.DataSet.FieldByName('Num').AsInteger=2 then db.Canvas.Brush.Color:=$0054B15B;
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure TPlanMotivationStatF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

end.

