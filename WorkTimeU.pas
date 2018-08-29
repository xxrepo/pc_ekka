unit WorkTimeU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Grids, DBGrids, DBCtrls;

type

  TWorkTimeF = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    DBGrid2: TDBGrid;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);

  private

    procedure ShowWorkTime;

  public

  end;

var WorkTimeF: TWorkTimeF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TWorkTimeF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Label1.Caption:='Режим работы подразделения: '+Prm.AptekaNameRU;
  ShowWorkTime;
 end;

procedure TWorkTimeF.ShowWorkTime;
var idc:String;
 begin
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('declare @io int, @idc binary(16) ');
   DM.QrEx.SQL.Add('set @io=(select id from inform..d_dept where id_apteka=(select top 1 convert(int,Value) from Spr_Const where Descr=''ID_APTEKA'')) ');
   DM.QrEx.SQL.Add('set @idc=(select top 1 id from inform..e_worktime_card_head ');
   DM.QrEx.SQL.Add('where id_object=@io /*and getdate()>date_beg and (date_end is null or date_end>getdate()) */ ');
   DM.QrEx.SQL.Add('order by is_temporary desc,personal_days desc)  ');
   DM.QrEx.SQL.Add('select cast(@idc as uniqueidentifier) as id_card ');

//   DM.QrEx.SQL.SaveToFile('Q1.txt');

   DM.QrEx.Open;

   if DM.QrEx.FieldByName('id_card').AsString='' then
    begin
     MainF.MessBox('Нет информации о режиме работы данной аптеки!');
     Exit;
    end;
   idc:=DM.QrEx.FieldByName('id_card').AsString;

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select * from inform..e_worktime_card_head where id=cast(cast('''+idc+''' as uniqueidentifier) as binary(16))';
   DM.QrEx.Open;

   Label2.Caption:='Период действия режима с :  '+DM.QrEx.FieldByName('date_beg').AsString;
   if DM.QrEx.FieldByName('date_end').AsString<>'' then Label2.Caption:=Label2.Caption+' по '+DM.QrEx.FieldByName('date_end').AsString;

   if DM.QrEx.FieldByName('is_temporary').AsInteger=0 then Label3.Caption:='Режим действует: постоянно'
                                                      else Label3.Caption:='Режим действует: временно';

   DM.qrWorkTimeK.Close;
   DM.qrWorkTimeK.SQL.Clear;

   DM.qrWorkTimeK.SQL.Add('select e.id_card,(case e.id_day when 1 then ''Понедельник''  ');
   DM.qrWorkTimeK.SQL.Add('                                when 2 then ''Вторник''      ');
   DM.qrWorkTimeK.SQL.Add('                                when 3 then ''Среда''        ');
   DM.qrWorkTimeK.SQL.Add('                                when 4 then ''Четверг''      ');
   DM.qrWorkTimeK.SQL.Add('                                when 5 then ''Пятница''      ');
   DM.qrWorkTimeK.SQL.Add('                                when 6 then ''Суббота''      ');
   DM.qrWorkTimeK.SQL.Add('                                when 7 then ''Воскресенье'' end) as SDay,           ');
   DM.qrWorkTimeK.SQL.Add('       convert(varchar,convert(smalldatetime,convert(numeric(15,5),e.time_beg)/86400.),8) as time_beg, ');
   DM.qrWorkTimeK.SQL.Add('       convert(varchar,convert(smalldatetime,convert(numeric(15,5),e.time_end)/86400.),8) as time_end, ');
   DM.qrWorkTimeK.SQL.Add('       d.worktime_position_name,                                  ');
   DM.qrWorkTimeK.SQL.Add('       d.worktime_position_description                            ');
   DM.qrWorkTimeK.SQL.Add('from inform..e_worktime_position e,                               ');
   DM.qrWorkTimeK.SQL.Add('     inform..d_worktime_position d                                ');
   DM.qrWorkTimeK.SQL.Add('where id_card=cast(cast('''+idc+''' as uniqueidentifier) as binary(16)) and e.id_worktime_position=d.id   ');
   DM.qrWorkTimeK.SQL.Add('order by e.id_day ');
//   DM.qrWorkTimeK.SQL.SaveToFile('Q11.txt');
   DM.qrWorkTimeK.Open;
{
   DM.qrWorkTimeP.Close;
   DM.qrWorkTimeP.SQL.Clear;
   DM.qrWorkTimeP.SQL.Add('');
   DM.qrWorkTimeP.SQL.Add('select (case d.id_param_type when 5 then           ');
   DM.qrWorkTimeP.SQL.Add('                              (case when convert(numeric(15,5),e.parameter_value)>=86400 then convert(varchar,convert(int,e.parameter_value)/86400)+''C+'' else '''' end)+ ');
   DM.qrWorkTimeP.SQL.Add('                              convert(varchar,convert(smalldatetime,convert(numeric(15,5),e.parameter_value)/86400.),8)                         ');
   DM.qrWorkTimeP.SQL.Add('                                                                                                                                                ');
   DM.qrWorkTimeP.SQL.Add('                             when 2 then convert(varchar,convert(datetime,e.parameter_value),4) else e.parameter_value end) as param_value,     ');
   DM.qrWorkTimeP.SQL.Add('       param_descr                                                                                                                              ');
   DM.qrWorkTimeP.SQL.Add('from inform..e_worktime_parameters e,                                                                                                           ');
   DM.qrWorkTimeP.SQL.Add('     inform..d_worktime_parameters d                                                                                                            ');
   DM.qrWorkTimeP.SQL.Add('where id_card='+IntToStr(idc)+' and e.id_parameter=d.id and d.trash=0                                                                                        ');
   DM.qrWorkTimeP.SQL.Add('order by 2     ');

//   DM.qrWorkTimeP.SQL.SaveToFile('Q2.txt');

   DM.qrWorkTimeP.Open;
}
  except
   on E:Exception do MainF.MessBox('Ошибка формирования отчета по режиму аптеки: '+E.Message);
  end;
 end;

end.



declare @io int, @idc binary(16)
set @io=(select id from inform..d_dept where id_apteka=(select top 1 convert(int,Value) from Spr_Const where Descr=''ID_APTEKA''))
set @idc=(select top 1 id from inform..e_worktime_card_head
where id_object=@io /*and getdate()>date_beg and (date_end is null or date_end>getdate()) */
order by is_temporary desc,personal_days desc)
select cast(@idc as uniqueidentifier) as id_card

