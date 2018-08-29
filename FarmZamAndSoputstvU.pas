unit FarmZamAndSoputstvU;

interface

uses
  Forms, Classes, Controls, StdCtrls, ComCtrls, DateUtils, Grids, DBGrids,
  SysUtils, ADODB, DB;

type
  TFarmZamAndSoputstvF = class(TForm)
    lbDateFrom: TLabel;
    lbDateTo: TLabel;
    dtDateFrom: TDateTimePicker;
    dtDateTo: TDateTimePicker;
    lbByMonth: TLabel;
    cbByMonth: TComboBox;
    btGetStatistics: TButton;
    pcFarmZamAndSoputstv: TPageControl;
    tsFarmZam: TTabSheet;
    tsSoputstv: TTabSheet;
    dgFarmZamCount: TDBGrid;
    dgSoputstvCount: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cbByMonthChange(Sender: TObject);
    procedure btGetStatisticsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure fillGridHeaderFarmZam;
    procedure fillGridHeaderSoputstv;
    procedure getFarmZam;
    procedure getSoputstv;
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

  countNamesFarmZam: array[0..5] of string =     ('id_gamma',       'USERS',       'Dolgn',    'countShowing',         'countPrinting',  'countClosed');
  countTitlesFarmZam: array[0..5] of string =    ('ID пользователя','Пользователь','Должность','Предложена фармзамена','Добавлено в чек','Закрыто');
  countVisibleFarmZam: array[0..5] of boolean =  (true,             true,          true,       true,                   true,             true);
  countWidthFarmZam: array[0..5] of integer =    (60,               200,           200,        100,                    100,              100);

  countNamesSoputstv: array[0..5] of string =     ('id_gamma',       'USERS',       'Dolgn',    'countShowing',            'countAdded',     'countClosed');
  countTitlesSoputstv: array[0..5] of string =    ('ID пользователя','Пользователь','Должность','Предложены сопутствующие','Добавлено в чек','Закрыто');
  countVisibleSoputstv: array[0..5] of boolean =  (true,             true,          true,       true,                      true,             true);
  countWidthSoputstv: array[0..5] of integer =    (60,               200,           200,        100,                       100,              100);

implementation

{$R *.dfm}

uses
  DataModuleU;

procedure TFarmZamAndSoputstvF.FormCreate(Sender: TObject);
begin
  cbByMonth.Text:='';
  cbByMonth.ItemIndex:=MonthOf(Date())-1;
  cbByMonth.Style:=csDropDownList;
  dtDateFrom.Date:=EncodeDate(YearOf(date()),cbByMonth.ItemIndex+1,1);
  dtDateTo.Date:=EncodeDate(YearOf(Date()),cbByMonth.ItemIndex+1,DaysInMonth(dtDateFrom.Date));
  fillGridHeaderFarmZam;
  fillGridHeaderSoputstv;
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
    pcFarmZamAndSoputstv.ActivePage:=tsFarmZam;
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

    pcFarmZamAndSoputstv.Left:=LEFT_INDENT;
    pcFarmZamAndSoputstv.Top:=btGetStatistics.Top+btGetStatistics.Height+SPACE_INDENT;
    pcFarmZamAndSoputstv.Width:=ClientWidth-pcFarmZamAndSoputstv.Left-LEFT_INDENT;
    pcFarmZamAndSoputstv.Height:=ClientHeight-pcFarmZamAndSoputstv.Top-TOP_INDENT;

    dgFarmZamCount.Left:=LEFT_INDENT;
    dgFarmZamCount.Top:=TOP_INDENT;
    dgFarmZamCount.Width:=tsFarmZam.Width-dgFarmZamCount.Left-LEFT_INDENT;
    dgFarmZamCount.Height:=tsFarmZam.Height-dgFarmZamCount.Top-TOP_INDENT;

    dgSoputstvCount.Left:=LEFT_INDENT;
    dgSoputstvCount.Top:=TOP_INDENT;
    dgSoputstvCount.Width:=tsSoputstv.Width-dgSoputstvCount.Left-LEFT_INDENT;
    dgSoputstvCount.Height:=tsSoputstv.Height-dgSoputstvCount.Top-TOP_INDENT;
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
    getFarmZam;
    getSoputstv;
  finally
    Screen.Cursor:=cr;
  end;
end;

procedure TFarmZamAndSoputstvF.fillGridHeaderFarmZam;
var
  i: integer;
begin
  dgFarmZamCount.Columns.Clear;
  for i:=0 to length(countNamesFarmZam)-1 do
  begin
    dgFarmZamCount.Columns.Add;
    dgFarmZamCount.Columns[i].FieldName:=countNamesFarmZam[i];
    dgFarmZamCount.Columns[i].Title.Caption:=countTitlesFarmZam[i];
    dgFarmZamCount.Columns[i].Visible:=countVisibleFarmZam[i];
    dgFarmZamCount.Columns[i].Width:=countWidthFarmZam[i];
  end;
  dgFarmZamCount.Refresh;
end;

procedure TFarmZamAndSoputstvF.fillGridHeaderSoputstv;
var
  i: integer;
begin
  dgSoputstvCount.Columns.Clear;
  for i:=0 to length(countNamesSoputstv)-1 do
  begin
    dgSoputstvCount.Columns.Add;
    dgSoputstvCount.Columns[i].FieldName:=countNamesSoputstv[i];
    dgSoputstvCount.Columns[i].Title.Caption:=countTitlesSoputstv[i];
    dgSoputstvCount.Columns[i].Visible:=countVisibleSoputstv[i];
    dgSoputstvCount.Columns[i].Width:=countWidthSoputstv[i];
  end;
  dgSoputstvCount.Refresh;
end;

procedure TFarmZamAndSoputstvF.getFarmZam;
begin
  DM.qrFarmZamCount.SQL.Clear;
  DM.qrFarmZamCount.SQL.Text:='exec spY_FarmZamCount '''+FormatDateTime('YYYY-MM-DD',dtDateFrom.Date)+' 00:00:00'','''+FormatDateTime('YYYY-MM-DD',dtDateTo.Date)+' 23:59:59''';
  DM.qrFarmZamCount.Open;
end;

procedure TFarmZamAndSoputstvF.getSoputstv;
begin
  DM.qrSoputstvCount.SQL.Clear;
  DM.qrSoputstvCount.SQL.Text:='exec spY_SoputstvCount '''+FormatDateTime('YYYY-MM-DD',dtDateFrom.Date)+' 00:00:00'','''+FormatDateTime('YYYY-MM-DD',dtDateTo.Date)+' 23:59:59''';
  DM.qrSoputstvCount.Open;
{
  with DM.qrSoputstvCount do
  begin
    SQL.Clear;
    SQL.Add('declare @dateFrom datetime set @dateFrom = '''+FormatDateTime('YYYY-MM-DD',dtDateFrom.Date)+' 00:00:00''');
    SQL.Add('declare @dateTo datetime set @dateTo = '''+FormatDateTime('YYYY-MM-DD',dtDateTo.Date)+' 23:59:59''');
    SQL.Add('');
    SQL.Add('select');
    SQL.Add('  su.id_gamma, su.USERS, su.Dolgn,');
    SQL.Add('  isnull(cs.countShowing,0) as countShowing,');
    SQL.Add('  isnull(cp.countAdded,0) as countAdded,');
    SQL.Add('  isnull(cc.countClosed,0) as countClosed');
    SQL.Add('from');
    SQL.Add('  APTEKA_NET.dbo.SPRUSER su');
    SQL.Add('  left join (');
    SQL.Add('    select');
    SQL.Add('      cr.ID_GAMMA, cr.STATUS,');
    SQL.Add('      case when cr.STATUS=0 then isnull(count(cr.STATUS),0) end as countShowing');
    SQL.Add('    from');
    SQL.Add('      REPORT.dbo.ConcomitReg cr');
    SQL.Add('    where');
    SQL.Add('      cr.DT > @dateFrom');
    SQL.Add('      and cr.dt <= @dateTo');
    SQL.Add('      and  cr.STATUS=0');
    SQL.Add('    group by');
    SQL.Add('      cr.ID_GAMMA, cr.STATUS');
    SQL.Add('  ) as cs on cs.ID_GAMMA=su.id_gamma');
    SQL.Add('  left join (');
    SQL.Add('    select');
    SQL.Add('      cr.ID_GAMMA, cr.STATUS,');
    SQL.Add('      case when cr.STATUS=1 then isnull(count(cr.STATUS),0) end as countAdded');
    SQL.Add('    from');
    SQL.Add('      REPORT.dbo.ConcomitReg cr');
    SQL.Add('    where');
    SQL.Add('      cr.DT > @dateFrom');
    SQL.Add('      and cr.dt <= @dateTo');
    SQL.Add('      and  cr.STATUS=1');
    SQL.Add('    group by');
    SQL.Add('      cr.ID_GAMMA, cr.STATUS');
    SQL.Add('  ) as cp on cp.ID_GAMMA=su.id_gamma');
    SQL.Add('  left join (');
    SQL.Add('    select');
    SQL.Add('      t.ID_GAMMA, sum(t.countClosed) as countClosed');
    SQL.Add('    from');
    SQL.Add('      (select');
    SQL.Add('        cl.ID_GAMMA, count(cl.ART_CODE) as countClosed');
    SQL.Add('      from');
    SQL.Add('        ConcomitLog cl');
    SQL.Add('      where');
    SQL.Add('        cl.DT > @dateFrom');
    SQL.Add('        and cl.DT <= @dateTo');
    SQL.Add('      group by');
    SQL.Add('        cl.ID_GAMMA, cl.ART_CODE) t');
    SQL.Add('    group by');
    SQL.Add('      t.ID_GAMMA, t.countClosed');
    SQL.Add('  ) as cc on cc.ID_GAMMA=su.id_gamma');
    SQL.Add('where');
    SQL.Add('  su.reserve = 0');
    SQL.Add('  and (cs.countShowing != 0');
    SQL.Add('  or cp.countAdded != 0');
    SQL.Add('  or cc.countClosed != 0');
    SQL.Add('  )');
    SQL.Add('order by');
    SQL.Add('  su.USERS');
    SQL.Add('');
    Open;
  end;
}
end;

procedure TFarmZamAndSoputstvF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM.qrFarmZamCount.Active then DM.qrFarmZamCount.Close;
  if DM.qrFarmZamCount.Active then DM.qrSoputstvCount.Close;
end;

end.
