unit TabelU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ComCtrls, Buttons, Util, DateUtils, PrintReport;

type
  TTabelF = class(TForm)
    Label1: TLabel;
    ComboBox2:TComboBox;
    Edit1:TEdit;
    Label2:TLabel;
    UpDown1:TUpDown;
    BitBtn4:TBitBtn;
    BitBtn2:TBitBtn;
    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn4Click(Sender:TObject);

  private

  public

  end;

var TabelF:TTabelF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TTabelF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  UpDown1.Position:=StrToInt(FormatDateTime('yyyy',Date));
  ComboBOx2.ItemIndex:=StrToInt(FormatDateTime('mm',Date))-1;
 end;

procedure TTabelF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TTabelF.BitBtn4Click(Sender: TObject);
var D1,D2:TDateTime;
    i:Integer;
 begin
  try
   if ComboBox2.ItemIndex=-1 then Exit;
   D1:=StrToDateTime('01.'+LeadZero(ComboBox2.ItemIndex+1)+'.'+IntToStr(UpDown1.Position)+' 00:00:00');
   D2:=EndOfTheMonth(D1);

   DM.Qr6.Close;
   DM.Qr6.SQL.Clear;
   DM.Qr6.SQL.Add('set dateformat ymd ');
   DM.Qr6.SQL.Add('set datefirst 1 ');
   DM.Qr6.SQL.Add('declare @dt1 datetime, @dt2 datetime, @dtS datetime, @dtE datetime, @dw1 int, @dw2 int, @sql varchar(5000), @sql1 varchar(5000), @dw int, @i int, @dt datetime, @s varchar(10) ');
   DM.Qr6.SQL.Add('set @dt1='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00''        ');
   DM.Qr6.SQL.Add('set @dt2='''+FormatDateTime('yyyy-mm-dd',D2)+' 23:59:59''        ');
   DM.Qr6.SQL.Add('                                        ');
   DM.Qr6.SQL.Add('set @dw1=DatePart(dw,@dt1)              ');
   DM.Qr6.SQL.Add('set @dw2=DatePart(dw,@dt2)              ');

//   DM.Qr6.SQL.Add('if @dw1=1 set @dw1=7 else set @dw1=@dw1-1               ');
//   DM.Qr6.SQL.Add('if @dw2=1 set @dw2=7 else set @dw2=@dw2-1               ');

   DM.Qr6.SQL.Add('                                                        ');
   DM.Qr6.SQL.Add('set @DtS=IsNull((select Max(DtStart) from Inform..DhGrafik where DtStart<=@dt1 and DtEnd>=@dt1),@dt1)');
   DM.Qr6.SQL.Add('set @DtE=IsNull((select Max(DtEnd) from Inform..DhGrafik where DtStart<=@dt2 and DtEnd>=@dt2),@dt2)  ');
   DM.Qr6.SQL.Add('                                                                                             ');
   DM.Qr6.SQL.Add('if Object_ID(N''tempdb..#tTab'') is not null drop table #tTab                                ');
   DM.Qr6.SQL.Add('select h.DtStart,h.DtEnd,t.id_user,t.id_type,                                                ');
   DM.Qr6.SQL.Add('       apteka_net.dbo.GetHours(D11) as H11,apteka_net.dbo.GetHours(D12) as H12,              ');
   DM.Qr6.SQL.Add('       apteka_net.dbo.GetHours(D21) as H21,apteka_net.dbo.GetHours(D22) as H22,              ');
   DM.Qr6.SQL.Add('       apteka_net.dbo.GetHours(D31) as H31,apteka_net.dbo.GetHours(D32) as H32,              ');
   DM.Qr6.SQL.Add('       apteka_net.dbo.GetHours(D41) as H41,apteka_net.dbo.GetHours(D42) as H42,              ');
   DM.Qr6.SQL.Add('       apteka_net.dbo.GetHours(D51) as H51,apteka_net.dbo.GetHours(D52) as H52,              ');
   DM.Qr6.SQL.Add('       apteka_net.dbo.GetHours(D61) as H61,apteka_net.dbo.GetHours(D62) as H62,              ');
   DM.Qr6.SQL.Add('       apteka_net.dbo.GetHours(D71) as H71,apteka_net.dbo.GetHours(D72) as H72               ');
   DM.Qr6.SQL.Add('into #tTab                                                                                   ');
   DM.Qr6.SQL.Add('from inform..DhGrafik h,                                                                     ');
   DM.Qr6.SQL.Add('     inform..DtGrafik t                                                                      ');
   DM.Qr6.SQL.Add('where h.DtStart>=@DtS and h.DtEnd<=@DtE and                                                  ');
   DM.Qr6.SQL.Add('      h.idtab=t.idtab and IsNull(t.IsDeleted,0)=0                                         ');
   DM.Qr6.SQL.Add('                                                                                             ');
   DM.Qr6.SQL.Add('set @i=1                                                                                     ');
   DM.Qr6.SQL.Add('while @i<@dw1 begin set @sql=''update #tTab set H''+convert(varchar(1),@i)+''1=0,H''+convert(varchar(1),@i)+''2=0 where DtStart<''''''+convert(varchar,@dt1,20)+'''''''' exec(@sql) set @i=@i+1 end ');
   DM.Qr6.SQL.Add('                                                                                                                                                                                                    ');
   DM.Qr6.SQL.Add('set @i=7                                                                                                                                                                                            ');
   DM.Qr6.SQL.Add('while @i>@dw2 begin set @sql=''update #tTab set H''+convert(varchar(1),@i)+''1=0,H''+convert(varchar(1),@i)+''2=0 where DtEnd>''''''+convert(varchar,@dt2,20)+'''''''' exec(@sql) set @i=@i-1 end   ');
   DM.Qr6.SQL.Add('                                                                                                                                                                                                    ');
   DM.Qr6.SQL.Add('if Object_ID(N''tempdb..#Tab'') is not null drop table #Tab                      ');
   DM.Qr6.SQL.Add('select 1 as ord,s.id_gamma,s.id as id_user,s.users,u.descr,t.id_type,s.id_role,s.IsZam    ');
   DM.Qr6.SQL.Add('into #Tab                                                                        ');
   DM.Qr6.SQL.Add('from #tTab t,                                                                    ');
   DM.Qr6.SQL.Add('     apteka_net..SprUser s,                                                      ');
   DM.Qr6.SQL.Add('     apteka_net..SprTypeUser u                                                   ');
   DM.Qr6.SQL.Add('where t.id_user=s.id and                                                         ');
   DM.Qr6.SQL.Add('      t.id_type=u.id_type                                                        ');
   DM.Qr6.SQL.Add('group by s.id_gamma,s.id,s.users,u.descr,t.id_type,s.id_role,s.IsZam             ');
   DM.Qr6.SQL.Add('                                                                                 ');
   DM.Qr6.SQL.Add('set @i=DatePart(dd,@dt1)                                                         ');
   DM.Qr6.SQL.Add('while @i<=DatePart(dd,@dt2)                                                      ');
   DM.Qr6.SQL.Add(' begin                                                                           ');
   DM.Qr6.SQL.Add('  if @i<10 set @s=''D0''+convert(varchar(2),@i) else set @s=''D''+convert(varchar(2),@i)         ');
   DM.Qr6.SQL.Add('  set @sql=''alter table #Tab add ''+@s+'' numeric(8,2)''                                        ');
   DM.Qr6.SQL.Add('  exec(@sql)                                                                                     ');
   DM.Qr6.SQL.Add('  set @i=@i+1                                                                                    ');
   DM.Qr6.SQL.Add(' end                                                                                             ');
   DM.Qr6.SQL.Add('set @sql=''alter table #Tab add Sm numeric(12,2)''                                               ');
   DM.Qr6.SQL.Add('exec(@sql)                                                                                       ');
   DM.Qr6.SQL.Add('set @sql=''alter table #Tab add SmP numeric(12,2)''                                               ');
   DM.Qr6.SQL.Add('exec(@sql)                                                                                       ');
   DM.Qr6.SQL.Add('                                                                                                 ');
   DM.Qr6.SQL.Add('set @i=DatePart(dd,@dt1)                                                                         ');
   DM.Qr6.SQL.Add('while @i<=DatePart(dd,@dt2)                                                                      ');
   DM.Qr6.SQL.Add(' begin                                                                                           ');
   DM.Qr6.SQL.Add('  if @i<10 set @s=''0''+convert(varchar(2),@i) else set @s=convert(varchar(2),@i)                ');
   DM.Qr6.SQL.Add('  set @dt=@dt1+@i-1                                                                              ');
   DM.Qr6.SQL.Add('  set @dw=DatePart(dw,@dt)                                                                       ');
//   DM.Qr6.SQL.Add('  if @dw=1 set @dw=7 else set @dw=@dw-1                                                          ');
   DM.Qr6.SQL.Add('                                                                                                 ');
   DM.Qr6.SQL.Add('  set @sql=''update #Tab set D''+@s+''=IsNull((select Sum(H''+convert(varchar,@dw)+''1+H''+convert(varchar,@dw)+''2) from #tTab t where t.id_type=#Tab.id_type and t.id_user=#Tab.id_user ');
   DM.Qr6.SQL.Add('           and DtStart<=''''''+convert(varchar,@dt,20)+'''''' and DtEnd>=''''''+convert(varchar,@dt,20)+''''''),0)''  ');
   DM.Qr6.SQL.Add('  exec(@sql)');
   DM.Qr6.SQL.Add('  set @i=@i+1               ');
   DM.Qr6.SQL.Add(' end                        ');
   DM.Qr6.SQL.Add('declare @sql123 varchar(7000)                            ');
   DM.Qr6.SQL.Add('set @sql123=''''               ');
   DM.Qr6.SQL.Add('set @sql=''''               ');
   DM.Qr6.SQL.Add('set @i=DatePart(dd,@dt1)    ');
   DM.Qr6.SQL.Add('while @i<=DatePart(dd,@dt2) ');
   DM.Qr6.SQL.Add(' begin                      ');
   DM.Qr6.SQL.Add('  if @i<10 set @s=''D0''+convert(varchar(2),@i) else set @s=''D''+convert(varchar(2),@i) ');
   DM.Qr6.SQL.Add('  set @sql=@sql+@s                                                                       ');
   DM.Qr6.SQL.Add('  set @sql123=@sql123+''convert(numeric(12,2),0.1111*''+@s+'')''                                                       ');
   DM.Qr6.SQL.Add('  if @i<DatePart(dd,@dt2) begin set @sql=@sql+''+'' set @sql123=@sql123+''+'' end        ');
   DM.Qr6.SQL.Add('  set @i=@i+1                                                                            ');
   DM.Qr6.SQL.Add(' end                                                                                     ');
   DM.Qr6.SQL.Add('exec(''update #Tab set Sm=''+@sql)                                                       ');
   DM.Qr6.SQL.Add('exec(''update #Tab set SmP=''+@sql123)                                                       ');
//   DM.Qr6.SQL.Add('exec(''update #Tab set SmP=Sm*0.1111 '')                                     ');
   DM.Qr6.SQL.Add('exec(''declare @ida int select @ida=IsNull(Value,0) from Spr_Const where descr=''''ID_APTEKA''''  update #Tab set SmP=0 where id_type in (1,8) or (id_type=4 and @ida=4)'')                                                  ');
//   DM.Qr6.SQL.Add('exec(''update #Tab set SmP=(Sm/2)*0.25'')                                                  ');
   DM.Qr6.SQL.Add('set @sql1=''''                                                                                         ');
   DM.Qr6.SQL.Add('set @i=DatePart(dd,@dt1)                                                                         ');
   DM.Qr6.SQL.Add('while @i<=DatePart(dd,@dt2)                                                                      ');
   DM.Qr6.SQL.Add(' begin                                                                                           ');
   DM.Qr6.SQL.Add('  if @i<10 set @s=''0''+convert(varchar(2),@i) else set @s=convert(varchar(2),@i)                ');
   DM.Qr6.SQL.Add('  set @sql=''update #Tab set D''+@s+''=null where D''+@s+''=0'' ');
   DM.Qr6.SQL.Add('  set @sql1=@sql1+''Sum(D''+@s+''),'' ');
   DM.Qr6.SQL.Add('  exec(@sql) ');
   DM.Qr6.SQL.Add('  set @i=@i+1               ');
   DM.Qr6.SQL.Add(' end                        ');
   DM.Qr6.SQL.Add('set @sql=''insert into #Tab select 2,0,0,''''Итого'''','''''''',id_type,0,0,''+@sql1+''Sum(Sm),Sum(SmP) from #Tab group by id_type'' ');
   DM.Qr6.SQL.Add('exec(@sql)                                                                                                                   ');
   DM.Qr6.SQL.Add('delete from #Tab where IsNull(Sm,0)=0 or id_type=3');
//   DM.Qr6.SQL.SaveToFile('C:\Log\123444.txt');
   DM.Qr6.ExecSQL;

   PrintRep.Clear;
   PrintRep.SetDefault;
   PixperI:=500;
   PrintRep.Orientation:=O_LANDS;
   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Size:=3;
   PrintRep.AddText(DateTimeToStr(Now)+#10);

   PrintRep.Align:=AL_CENTER;
   PrintRep.Font.Size:=5;
   PrintRep.AddText('Табель учета рабочего времени'+#10+'сотрудников торговой точки '+Prm.AptekaNameRU+#10);
   PrintRep.AddText('c '+DateToStr(D1)+' по '+DateToStr(D2)+#10);

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select * from SprTypeUser where id_type in (select id_type from #Tab) order by id_type';
   DM.QrEx.Open;
   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;

     PrintRep.Align:=AL_CENTER;
     PrintRep.Font.Size:=5;
     PrintRep.Font.Style:=[fsBold];
     PrintRep.AddText(#10+DM.QrEx.FieldByName('Descr').AsString+#10);

     PrintRep.Align:=AL_Left;
     PrintRep.Font.Size:=4;
     PrintRep.Font.Style:=[];

     DM.Qr6.Close;
     DM.Qr6.SQL.Clear;
     DM.Qr6.SQL.Add('');
     DM.Qr6.SQL.Add('declare @dt1 datetime, @dt2 datetime, @sql varchar(5000), @i int, @dt datetime, @s varchar(10) ');
     DM.Qr6.SQL.Add('set @dt1='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00''        ');
     DM.Qr6.SQL.Add('set @dt2='''+FormatDateTime('yyyy-mm-dd',D2)+' 23:59:59''        ');

     DM.Qr6.SQL.Add('set @sql=''''               ');
     DM.Qr6.SQL.Add('set @i=DatePart(dd,@dt1)    ');
     DM.Qr6.SQL.Add('while @i<=DatePart(dd,@dt2) ');
     DM.Qr6.SQL.Add(' begin                      ');
     DM.Qr6.SQL.Add('  if @i<10 set @s=''D0''+convert(varchar(2),@i) else set @s=''D''+convert(varchar(2),@i) ');
     DM.Qr6.SQL.Add('  set @sql=@sql+@s+'' as [''+convert(varchar(2),@i)+''_S_500]''                          ');
     DM.Qr6.SQL.Add('  if @i<DatePart(dd,@dt2) set @sql=@sql+'',''                                          ');
     DM.Qr6.SQL.Add('  set @i=@i+1                                                                        ');
     DM.Qr6.SQL.Add(' end                                                                                 ');
     DM.Qr6.SQL.Add('exec(''select Users as [ФИО_S_3000],''+@Sql+'', Sm as [За период_N_1500], Sm-SmP as [Без перер._N_1500], '''''''' as [Подп_S_800] from #Tab where id_type='+DM.QrEx.FieldByName('id_type').AsString+' order by ord,users,id_role,iszam'')');
     DM.Qr6.Open;
     PrintRep.Qr:=DM.Qr6;
     PrintRep.PrintTable(False,0,0);
     PrintRep.AddInterv(4);
    end;
   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования табеля: '+E.Message);
  end;
 end;

end.
