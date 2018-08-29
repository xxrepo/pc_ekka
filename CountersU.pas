unit CountersU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGrids;

type
  TCountersF = class(TForm)
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    dtStart: TDateTimePicker;
    Label2: TLabel;
    dtEnd: TDateTimePicker;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BitBtn3: TBitBtn;
    DBGrid2: TDBGrid;
    btn_add_counter: TBitBtn;

    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btn_add_counterClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private

    procedure ShowCounters;

  public

    procedure ShowNums;

  end;

var CountersF:TCountersF;

implementation

uses MainU, DataModuleU, EnterValueU, Uadd_counter;

{$R *.dfm}

procedure TCountersF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  dtStart.Date:=Date;
  dtEnd.Date:=Date;
  ShowCounters;
 end;

procedure TCountersF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TCountersF.BitBtn1Click(Sender: TObject);
 begin
  ShowCounters;
 end;

procedure TCountersF.ShowCounters;
var ID:Integer;
 begin
  try
   if DM.qrCounters.Active then ID:=DM.qrCounters.FieldByName('id_counter').AsInteger else ID:=-1;
   DM.qrCounters.Close;
   DM.qrCounters.SQL.Clear;
//   DM.qrCounters.SQL.Add('select * ');
//   DM.qrCounters.SQL.Add('from DhCounters');
//   DM.qrCounters.SQL.Add('order by descr ');

   DM.qrCounters.SQL.Add('select hc.*, case when tc.DT is null then 0 else 1 end is_entered');
   DM.qrCounters.SQL.Add('from apteka_net..DhCounters hc with(nolock)');
   DM.qrCounters.SQL.Add('	left join apteka_net..DTCOUNTERS tc with(nolock) on (hc.id_counter=tc.ID_COUNTER)');
   DM.qrCounters.SQL.Add('			and(DATEADD(dd, 0, DATEDIFF(dd, 0, tc.DT))=DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE())))');//сравниваем текущую дату с датой показаний
   DM.qrCounters.SQL.Add('order by descr');

{
   DM.qrCounters.SQL.Add('select a.id_counter,a.descr,a.kod,b.dt,b.num');
   DM.qrCounters.SQL.Add('from DhCounters a, DtCounters b');
   DM.qrCounters.SQL.Add('where a.id_counter=b.id_counter and ');
   DM.qrCounters.SQL.Add('      b.dt between '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+'''');
   DM.qrCounters.SQL.Add('order by b.dt,a.descr ');
}
   DM.qrCounters.Open;
   DM.qrCounters.Locate('ID_COUNTER',ID,[]);
   ShowNums;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику счетчиков: '+E.Message);
  end;
 end;

procedure TCountersF.BitBtn3Click(Sender: TObject);
var V:Currency;
 begin
  if DM.qrCounters.IsEmpty then Exit;
  if Not EnterCurrValue(V,'Введите показание счетчика') then Exit;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('delete from DtCounters where dt>=convert(datetime,convert(varchar,getdate(),23)) and id_counter='+DM.qrCounters.FieldByName('id_counter').AsString);
   DM.QrEx.SQL.Add('insert into DtCounters(id_counter,dt,num) ');
   DM.QrEx.SQL.Add('values('+DM.qrCounters.FieldByName('id_counter').AsString+',getdate(),'''+CurrToStr(V)+''')');
   DM.QrEx.ExecSQL;
   ShowNums;
   DM.qrCounters.Close;
   DM.qrCounters.Open;
  except
   on E:Exception do MainF.MessBox('Ошибка записи показания счетчика: '+E.Message);
  end;
 end;

procedure TCountersF.ShowNums;
var Dt:TDateTime;
 begin

  if DM.qrCountNums.Active then Dt:=DM.qrCountNums.FieldByName('dt').AsDateTime else Dt:=0;
  DM.qrCountNums.Close;
  if DM.qrCounters.IsEmpty then Exit;
  DM.qrCountNums.SQL.Clear;
  DM.qrCountNums.SQL.Add('select *');
  DM.qrCountNums.SQL.Add('from DtCounters ');
  DM.qrCountNums.SQL.Add('where id_counter='+DM.qrCounters.FieldByName('id_counter').AsString);
  DM.qrCountNums.SQL.Add('order by dt');
  DM.qrCountNums.Open;
  DM.qrCountNums.Locate('Dt',Dt,[]);

 end;

procedure TCountersF.btn_add_counterClick(Sender: TObject);
begin//добавление счётчика
  try
    Fadd_counter:=TFadd_counter.Create(Self);
   try
//    Application.ProcessMessages;
    Fadd_counter.ShowModal;
   finally
    Fadd_counter.Free;
   end;
  except
//   MessBox(ER_CR_FORM);
  end;

end;

procedure TCountersF.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
 holdColor: TColor;
 curr_font_color:TColor;
 dr , sr : TRect;
 ddr , ssr : TRect;
begin

//    DBG_reestr_aktov.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    holdColor := (Sender as TDBGrid).Canvas.Brush.Color;

    with (Sender as TDBGrid).DataSource.DataSet do
    begin

    if (FieldByName('is_entered').AsCurrency=0) then
        (Sender as TDBGrid).Canvas.Brush.Color := clRed
    else
        (Sender as TDBGrid).Canvas.Brush.Color := clGreen;

    end;//with

    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    (Sender as TDBGrid).Canvas.Brush.Color := holdColor;


end;

end.

