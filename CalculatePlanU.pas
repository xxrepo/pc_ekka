unit CalculatePlanU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ComCtrls, ExtCtrls, DateUtils, Grids, DBGrids,
  Buttons;

type

  TCalculatePlanF=class(TForm)
    Label1: TLabel;
    dtDate: TDateTimePicker;
    Bevel1: TBevel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BitBtn2: TBitBtn;

    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);

  private

    procedure ShowList;

  public

  end;

var CalculatePlanF:TCalculatePlanF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TCalculatePlanF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  dtDate.Date:=StartOfTheMonth(StartOfTheMonth(Date));
  ShowList;
 end;

procedure TCalculatePlanF.ShowList;
 begin
  DM.qrCalcPlan.Close;
  DM.qrCalcPlan.SQL.Text:='exec p_month_sum '''+FormatDateTime('yyyy-mm-dd',dtDate.Date)+''',0';
  DM.qrCalcPlan.Open;

  DM.qrCalcPlan1.Close;
  DM.qrCalcPlan1.SQL.Text:='exec p_month_sum '''+FormatDateTime('yyyy-mm-dd',dtDate.Date)+''',1';
  DM.qrCalcPlan1.Open;
 end;

procedure TCalculatePlanF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

end.
