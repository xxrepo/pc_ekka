unit FarmZamAndSoputstvU;

interface

uses
  Forms, Classes, Controls, StdCtrls, ComCtrls, DateUtils, Grids, DBGrids,
  SysUtils;
//  Windows, Messages, Variants, Graphics, Dialogs;

type
  TFarmZamAndSoputstvF = class(TForm)
    lbDateFrom: TLabel;
    lbDateTo: TLabel;
    dtDateFrom: TDateTimePicker;
    dtDateTo: TDateTimePicker;
    lbByMonth: TLabel;
    cbByMonth: TComboBox;
    btGetStatistics: TButton;
    dgFarmZamCount: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cbByMonthChange(Sender: TObject);
    procedure btGetStatisticsClick(Sender: TObject);
  private
    procedure fillGridHeader;
  public
    { Public declarations }
  end;

var
  FarmZamAndSoputstvF: TFarmZamAndSoputstvF;

const
  LEFT_INDENT = 12;
  TOP_INDENT = 12;
  SPACE_INDENT = 12;
  CONNECTED_SPACE_INDENT = 4;

  MIN_WIDTH = 640;
  MIN_HEIGHT = 480;

  countNames: array[0..5] of string =     ('id_gamma',       'USERS',       'Dolgn',    'countShowing',         'countPrinting',  'countClosed');
  countTitles: array[0..5] of string =    ('ID пользователя','Пользователь','Должность','Предложена фармзамена','Добавлено в чек','Закрыто');
  countVisible: array[0..5] of boolean =  (true,             true,          true,       true,                   true,             true);
  countWidth: array[0..5] of integer =    (60,               200,           200,        100,                    100,              100);

implementation

{$R *.dfm}

uses
  DataModuleU, ADODB, DB;

procedure TFarmZamAndSoputstvF.FormCreate(Sender: TObject);
begin
  cbByMonth.Text:='';
  cbByMonth.ItemIndex:=MonthOf(Date())-1;
  cbByMonth.Style:=csDropDownList;
  dtDateFrom.Date:=EncodeDate(YearOf(date()),cbByMonth.ItemIndex+1,1);
  dtDateTo.Date:=EncodeDate(YearOf(Date()),cbByMonth.ItemIndex+1,DaysInMonth(dtDateFrom.Date));
  fillGridHeader;
end;

procedure TFarmZamAndSoputstvF.FormActivate(Sender: TObject);
begin
  with FarmZamAndSoputstvF do
  begin
    Constraints.MinWidth:=MIN_WIDTH;
    Constraints.MinHeight:=MIN_HEIGHT;
    if (Screen.Width > MIN_WIDTH * 2) and (Screen.Height > MIN_HEIGHT * 2) then
    begin
      ClientWidth:=trunc(Screen.Width*0.5);
      ClientHeight:=trunc(Screen.Height*0.5);
    end
    else
    begin
      ClientWidth:=trunc(Screen.Width*0.75);
      ClientHeight:=trunc(Screen.Height*0.75);
    end;
    Position:=poMainFormCenter;
  end;
end;

procedure TFarmZamAndSoputstvF.FormResize(Sender: TObject);
begin
  with FarmZamAndSoputstvF do
  begin
    btGetStatistics.Left:=ClientWidth-LEFT_INDENT-btGetStatistics.Width;
    btGetStatistics.Top:=TOP_INDENT;

    lbDateFrom.Left:=LEFT_INDENT;
    lbDateFrom.Top:=TOP_INDENT;
    dtDateFrom.Left:=lbDateFrom.Left+lbDateFrom.Width+CONNECTED_SPACE_INDENT;
    dtDateFrom.Top:=lbDateFrom.Top;
    dtDateFrom.Width:=trunc(btGetStatistics.Left/3)-dtDateFrom.Left;
    lbDateTo.Left:=dtDateFrom.Left+dtDateFrom.Width+SPACE_INDENT;
    lbDateTo.Top:=dtDateFrom.Top;
    dtDateTo.Left:=lbDateTo.Left+lbDateTo.Width+CONNECTED_SPACE_INDENT;
    dtDateTo.Top:=lbDateTo.Top;
    dtDateTo.Width:=trunc(btGetStatistics.Left/3*2)-dtDateTo.Left;
    lbByMonth.Left:=dtDateTo.Left+dtDateTo.Width+SPACE_INDENT;
    lbByMonth.Top:=dtDateTo.Top;
    cbByMonth.Left:=lbByMonth.Left+lbByMonth.Width+CONNECTED_SPACE_INDENT;
    cbByMonth.Top:=lbByMonth.Top;
    cbByMonth.Width:=btGetStatistics.Left-cbByMonth.Left-LEFT_INDENT;
    dgFarmZamCount.Left:=LEFT_INDENT;
    dgFarmZamCount.Top:=btGetStatistics.Top+btGetStatistics.Height+SPACE_INDENT;
    dgFarmZamCount.Width:=ClientWidth-dgFarmZamCount.Left-LEFT_INDENT;
    dgFarmZamCount.Height:=ClientHeight-dgFarmZamCount.Top-TOP_INDENT;
  end;
end;

procedure TFarmZamAndSoputstvF.cbByMonthChange(Sender: TObject);
begin
  dtDateFrom.Date:=EncodeDate(YearOf(date()),cbByMonth.ItemIndex+1,1);
  dtDateTo.Date:=EncodeDate(YearOf(Date()),cbByMonth.ItemIndex+1,DaysInMonth(dtDateFrom.Date));
end;

procedure TFarmZamAndSoputstvF.btGetStatisticsClick(Sender: TObject);
var
  cr: TCursor;
begin
  cr:=Screen.Cursor;
  try
    Screen.Cursor:=crHourGlass;
    with DM.qrFarmZamCount do
    begin
      SQL.Clear;
      SQL.Add('declare @dateFrom datetime set @dateFrom = '''+FormatDateTime('YYYY-MM-DD',dtDateFrom.Date)+' 00:00:00''');
      SQL.Add('declare @dateTo datetime set @dateTo = '''+FormatDateTime('YYYY-MM-DD',dtDateTo.Date)+' 23:59:59''');
      SQL.Add('');
      SQL.Add('select');
      SQL.Add('  su.id_gamma, su.USERS, su.Dolgn,');
      SQL.Add('  isnull(cs.countShowing,0) as countShowing, ');
      SQL.Add('  isnull(cp.countPrinting,0) as countPrinting, ');
      SQL.Add('  isnull(cc.countClosed,0) as countClosed');
      SQL.Add('from');
      SQL.Add('  APTEKA_NET.dbo.SPRUSER su');
      SQL.Add('  left join (');
      SQL.Add('    select');
      SQL.Add('      az.ID_GAMMA, az.STATUS, az.Done,');
      SQL.Add('      case when az.STATUS=0 and az.Done=0 then isnull(count(az.STATUS),0) end as countShowing');
      SQL.Add('    from');
      SQL.Add('      REPORT.dbo.ArtZamenaReg az');
      SQL.Add('    where');
      SQL.Add('      az.DT > @dateFrom');
      SQL.Add('      and az.dt <= @dateTo');
      SQL.Add('      and  az.STATUS=0');
      SQL.Add('      and az.Done=0');
      SQL.Add('    group by');
      SQL.Add('      az.ID_GAMMA, az.STATUS, az.Done');
      SQL.Add('  ) as cs on cs.ID_GAMMA=su.id_gamma');
      SQL.Add('  left join (');
      SQL.Add('    select');
      SQL.Add('      az.ID_GAMMA, az.STATUS, ');
      SQL.Add('      case when az.STATUS=2 then isnull(count(az.STATUS),0) end as countPrinting');
      SQL.Add('    from');
      SQL.Add('      REPORT.dbo.ArtZamenaReg az');
      SQL.Add('    where');
      SQL.Add('      az.DT > @dateFrom');
      SQL.Add('      and az.dt <= @dateTo');
      SQL.Add('      and  az.STATUS=2');
      SQL.Add('    group by');
      SQL.Add('      az.ID_GAMMA, az.STATUS');
      SQL.Add('  ) as cp on cp.ID_GAMMA=su.id_gamma');
      SQL.Add('  left join (');
      SQL.Add('    select');
      SQL.Add('      t.ID_GAMMA, count(t.Done) as countClosed');
      SQL.Add('    from (');
      SQL.Add('      select');
      SQL.Add('        az.ID_GAMMA, az.ID_PART, az.Done');
      SQL.Add('      from');
      SQL.Add('        REPORT.dbo.ArtZamenaReg az');
      SQL.Add('      where');
      SQL.Add('        az.DT > @dateFrom');
      SQL.Add('        and az.dt <= @dateTo');
      SQL.Add('        and  az.Done=1');
      SQL.Add('      group by');
      SQL.Add('        az.ID_GAMMA, az.ID_PART, az.Done');
      SQL.Add('      ) t');
      SQL.Add('    group by');
      SQL.Add('      ID_GAMMA');
      SQL.Add('  ) as cc on cc.ID_GAMMA=su.id_gamma');
      SQL.Add('where');
      SQL.Add('  su.reserve = 0');
      SQL.Add('  and (cs.countShowing != 0');
      SQL.Add('  or cp.countPrinting != 0');
      SQL.Add('  or cc.countClosed != 0)');
      SQL.Add('order by');
      SQL.Add('  su.USERS');
      SQL.Add('');
      Open;
    end;
  finally
    Screen.Cursor:=cr;
  end;
end;

procedure TFarmZamAndSoputstvF.fillGridHeader;
var
  i: integer;
begin
  dgFarmZamCount.Columns.Clear;
  for i:=0 to length(countNames)-1 do
  begin
    dgFarmZamCount.Columns.Add;
    dgFarmZamCount.Columns[i].FieldName:=countNames[i];
    dgFarmZamCount.Columns[i].Title.Caption:=countTitles[i];
    dgFarmZamCount.Columns[i].Visible:=countVisible[i];
    dgFarmZamCount.Columns[i].Width:=countWidth[i];
  end;
  dgFarmZamCount.Refresh;
end;

end.
 