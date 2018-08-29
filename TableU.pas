unit TableU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ExtCtrls, Grids, DBGrids, Util, Buttons, PrintReport, Menus, DateUtils, MMSystem;

type

  TTableF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbStart: TLabel;
    lbEnd: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    dbgTab: TDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    pnd1: TPanel;
    Panel6: TPanel;
    pnd2: TPanel;
    pnd3: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    pnd4: TPanel;
    Panel15: TPanel;
    pnd5: TPanel;
    pnd6: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    pnd7: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Label7: TLabel;
    Label3: TLabel;
    pn1: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Label2: TLabel;
    Panel29: TPanel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    pmGr: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel5: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Panel9: TPanel;
    Label8: TLabel;
    Panel10: TPanel;
    Label9: TLabel;
    Panel14: TPanel;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Panel16: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel17: TPanel;
    Label12: TLabel;
    Panel22: TPanel;
    Label13: TLabel;
    Panel30: TPanel;
    Label14: TLabel;
    N8: TMenuItem;
    Panel31: TPanel;
    Label15: TLabel;
    Panel32: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Panel33: TPanel;
    Panel34: TPanel;
    Label18: TLabel;
    BitBtn5: TBitBtn;
    Panel35: TPanel;
    Label19: TLabel;
    N9: TMenuItem;
    N10: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgTabDrawColumnCell(Sender: TObject; const Rect: TRect;  DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgTabDblClick(Sender: TObject);
    procedure dbgTabKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N1Click(Sender:TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure pmGrPopup(Sender: TObject);
    procedure N10Click(Sender: TObject);

  private

    FShowOnly:Integer;
    FIDTAB:Integer;
    DtStart:TDateTime;
    DtEnd:TDateTime;

    procedure SetValue;
    procedure N8Click(Sender:TObject);

    function  SetPhoneUser:Boolean;
    function  CheckMesh(DtMesh:TDateTime):Boolean;

  public

    arKassa:Array of Integer;
    SumHClMn,SumHClAll:Currency;

    procedure ShowTab;

    property ShowOnly:Integer read FShowOnly write FShowOnly;
    property IDTAB:Integer read FIDTAB write FIDTAB;

  end;

var TableF:TTableF;

implementation

uses DataModuleU, MainU, AETabU, ShareU, SetPhoneU, WorkTimeU, GrafikInfoU, AETabNewU, DB;

{$R *.dfm}

procedure TTableF.FormCreate(Sender:TObject);
var NewItem:TMenuItem;
    i:Integer;
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select id_kassa from ArhCheks group by id_kassa order by id_kassa';
   DM.Qr.Open;
   SetLength(arKassa,0);
   SetLength(arKassa,DM.Qr.RecordCount);
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     arKassa[i-1]:=DM.Qr.FieldByName('id_kassa').AsInteger;
    end;

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from SprTypeUser where id_type<=100 order by id_type';
   DM.Qr.Open;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;

     NewItem:=TMenuItem.Create(N1);
     N1.Add(NewItem);
     NewItem.Caption:=DM.Qr.FieldByName('Descr').AsString;
     NewItem.Tag:=DM.Qr.FieldByName('ID_Type').AsInteger;
     NewItem.OnClick:=N1Click;

     NewItem:=TMenuItem.Create(N8);
     N8.Add(NewItem);
     NewItem.Caption:=DM.Qr.FieldByName('Descr').AsString;
     NewItem.Tag:=DM.Qr.FieldByName('ID_Type').AsInteger;
     NewItem.OnClick:=N8Click;
   end;
  except
  end;
  Caption:=MFC;
 end;

procedure TTableF.N1Click(Sender:TObject);
var mi:TMenuItem;
 begin
  if DM.qrTab.IsEmpty then Exit;

  if Sender=nil then Exit;
  try
   mi:=TMenuItem(Sender);

   if (mi.Tag=7) and (DM.qrTab.FieldByName('id_role').AsInteger=4) then
    begin
     MainF.MessBox('Нельзя добавить строку "Старшинство" для заведующего или зам. зав. !');
     Exit;
    end;

   if (mi.Tag=1) and (DM.qrTab.FieldByName('id_type').AsInteger in [20,10]) then
    begin
     MainF.MessBox('Администраторов по товару и Комплектовщиков интернет-заказов нельзя ставить в ночную смену!');
     Exit;
    end;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('if (select Count(*) from Inform..DtGrafik where idtab='+DM.qrTab.FieldByName('idtab').AsString);
   DM.Qr.SQL.Add('                    and id_user='+DM.qrTab.FieldByName('id_user').AsString);
   DM.Qr.SQL.Add('                    and IsDop=1 and id_type='+IntToStr(mi.Tag)+')<=0');
   DM.Qr.SQL.Add(' Insert into Inform..DtGrafik(idtab,id_user,id_type,IsDop,id_role,iszam,dt_begin,dt_end,dolgn)');
   DM.Qr.SQL.Add(' select idtab,id_user,'+IntToStr(mi.Tag)+',1,id_role,iszam,dt_begin,dt_end,dolgn');
   DM.Qr.SQL.Add(' from Inform..DtGrafik where row_id='+DM.qrTab.FieldByName('row_id').AsString);
//   DM.Qr.SQL.SaveToFile('C:\AddGr.txt');
   DM.Qr.ExecSQL;
   ShowTab;

  except
   on E:Exception do MainF.MessBox('Ошибка записи в таблицу "Графики работы сотрудников": '+E.Message);
  end;
 end;

procedure TTableF.N8Click(Sender:TObject);
var mi:TMenuItem;
 begin
  if DM.qrTab.IsEmpty then Exit;
  if DtEnd<Date then begin MainF.MessBox('Нельзя менять график за прошедшие недели!'); Exit; end;
  if DM.qrTab.FieldByName('IsDop').AsInteger<>1 then
   begin
    MainF.MessBox('Устанавливать признаки можно только на позиции добавленные вручную!');
    Exit;
   end;

  if Sender=nil then Exit;
  try
   mi:=TMenuItem(Sender);
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('declare @descr varchar(500) ');
   DM.Qr.SQL.Add('set @Descr=(select top 1 Descr from SprTypeUser where id_type='+IntToStr(mi.Tag)+') ');
   DM.Qr.SQL.Add('if (select Count(*) from Inform..DtGrafik t (nolock), Inform..DhGrafik h (nolock) where t.idtab=h.idtab and h.dtstart='''+FormatDateTime('yyyy-mm-dd',DtStart)+''' and t.id_type='+IntToStr(mi.Tag)+' and t.id_user='+DM.qrTab.FieldByName('id_user').AsString+')<=0 ');
   DM.Qr.SQL.Add(' begin ');
   DM.Qr.SQL.Add('  update Inform..DtGrafik set id_type='+IntToStr(mi.Tag)+' where IsDop=1 and ROW_ID='+DM.qrTab.FieldByName('row_id').AsString);
   DM.Qr.SQL.Add('  select 885 as Res,@Descr as Descr ');
   DM.Qr.SQL.Add(' end else select 777 as Res,@Descr as Descr');
   DM.Qr.Open;
   if DM.Qr.FieldByName('Res').AsInteger=777 then
    MainF.MessBox('Строка с признаком '+DM.Qr.FieldByName('Descr').AsString+' у сотрудника '+DM.qrTab.FieldByName('users').AsString+' уже есть в графике!');
   ShowTab;
  except
   MainF.MessBox('Ошибка записи в таблицу "Графики работы сотрудников"');
  end;
 end;

procedure TTableF.FormActivate(Sender:TObject);
var i:Integer;
    Pn:TPanel;
    Dt:TDateTime;
 begin
  try
   lbStart.Caption:='';
   lbEnd.Caption:='';
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from Inform..DHGRAFIK where idtab='+IntToStr(IDTAB);
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Abort;
   DtStart:=DM.Qr.FieldByName('dtStart').AsDateTime;
   DtEnd:=DM.Qr.FieldByName('dtEnd').AsDateTime;
   lbStart.Caption:=FormatDateTime('dd.mm.yyyy',DM.Qr.FieldByName('dtStart').AsDateTime);
   lbEnd.Caption:=FormatDateTime('dd.mm.yyyy',DM.Qr.FieldByName('dtEnd').AsDateTime);
   Dt:=DM.Qr.FieldByName('dtStart').AsDateTime;
   for i:=0 to 6 do
    begin
     Pn:=TPanel(FindComponent('pnd'+IntToStr(i+1)));
     Pn.Caption:=Copy(Pn.Caption,1,3)+' ('+FormatDateTime('dd.mm',Dt+i)+')';
    end;
   ShowTab;
   BitBtn5Click(BitBtn5);
  except
   MainF.MessBox('Ошибка доступа к таблице "График работы сотрудников"');
  end;
 end;

procedure TTableF.ShowTab;
var Col,Rd:Integer;
    Dt,Dt1:TDateTime;
 begin
  try
   Rd:=-1;
   Col:=dbgTab.SelectedIndex;
   if Not DM.qrTab.IsEmpty then  Rd:=DM.qrTab.FieldByName('ROW_ID').AsInteger;
   DM.qrTab.Close;
   DM.qrTab.SQL.Clear;

//   if DtEnd>EndOfTheMonth(Date) then Dt:=EndOfTheMonth(Date) else Dt:=DtEnd;
//   if EndOfTheMonth(DtStart)<>EndOfTheMonth(DtEnd) then Dt:=EndOfTheMonth(Date) else Dt:=DtEnd;
   Dt1:=StartOfTheMonth(DtStart);
   Dt:=EndOfTheMonth(DtStart);
   DM.qrTab.SQL.Add('set datefirst 1    declare @dt1 datetime, @dt2 datetime, @d1 int, @d2 int                                                                  ');
//   DM.qrTab.SQL.Add('set @dt1=convert(datetime,substring(convert(varchar,getdate(),23),1,8)+''01 00:00:00'')                                 ');
   DM.qrTab.SQL.Add('set @dt1=convert(datetime,'''+FormatDateTime('yyyy-mm-dd',Dt1)+' 00:00:00'')                    ');
   DM.qrTab.SQL.Add('set @dt2=convert(datetime,'''+FormatDateTime('yyyy-mm-dd',Dt)+' 00:00:00'')                    ');
   DM.qrTab.SQL.Add('if Object_ID(N''tempdb..#tmp_g'') is not null drop table #tmp_g                                                         ');

   DM.qrTab.SQL.Add('set @d1=DatePart(w,@dt1)                                                                                                ');
   DM.qrTab.SQL.Add('set @d2=DatePart(w,@dt2)                                                                                                ');
   DM.qrTab.SQL.Add('                                                                                                                        ');

//   DM.qrTab.SQL.Add('if @d1>1 set @d1=@d1-1 else set @d1=7                                                                                   ');
//   DM.qrTab.SQL.Add('if @d2>1 set @d2=@d2-1 else set @d2=7                                                                                   ');

   DM.qrTab.SQL.Add('                                                                                                                        ');
   DM.qrTab.SQL.Add('                                                                                                                        ');
   DM.qrTab.SQL.Add('select id_user,id_type,id_role,iszam,Sum(apteka_net.dbo.GetHours(D11))+                                                               ');
   DM.qrTab.SQL.Add('               Sum(apteka_net.dbo.GetHours(D12))+                                                                       ');
   DM.qrTab.SQL.Add('               Sum(apteka_net.dbo.GetHours(D21))+                                                                       ');
   DM.qrTab.SQL.Add('               Sum(apteka_net.dbo.GetHours(D22))+                                                                       ');
   DM.qrTab.SQL.Add('               Sum(apteka_net.dbo.GetHours(D31))+                                                                       ');
   DM.qrTab.SQL.Add('               Sum(apteka_net.dbo.GetHours(D32))+                                                                       ');
   DM.qrTab.SQL.Add('               Sum(apteka_net.dbo.GetHours(D41))+                                                                       ');
   DM.qrTab.SQL.Add('               Sum(apteka_net.dbo.GetHours(D42))+                                                                       ');
   DM.qrTab.SQL.Add('               Sum(apteka_net.dbo.GetHours(D51))+                                                                       ');
   DM.qrTab.SQL.Add('               Sum(apteka_net.dbo.GetHours(D52))+                                                                       ');
   DM.qrTab.SQL.Add('               Sum(apteka_net.dbo.GetHours(D61))+                                                                       ');
   DM.qrTab.SQL.Add('               Sum(apteka_net.dbo.GetHours(D62))+                                                                       ');
   DM.qrTab.SQL.Add('               Sum(apteka_net.dbo.GetHours(D71))+                                                                       ');
   DM.qrTab.SQL.Add('               Sum(apteka_net.dbo.GetHours(D72)) as Hours                                                               ');
   DM.qrTab.SQL.Add('into #tmp_g from                                                                                                        ');
   DM.qrTab.SQL.Add('(select b.id_user,b.idtab,b.id_type,b.id_role,b.iszam,case when 1<@d1 then null else b.D11 end as D11,case when 1<@d1 then null else b.D12 end as D12, ');
   DM.qrTab.SQL.Add('                          case when 2<@d1 then null else b.D21 end as D21,case when 2<@d1 then null else b.D22 end as D22,           ');
   DM.qrTab.SQL.Add('                          case when 3<@d1 then null else b.D31 end as D31,case when 3<@d1 then null else b.D32 end as D32,           ');
   DM.qrTab.SQL.Add('                          case when 4<@d1 then null else b.D41 end as D41,case when 4<@d1 then null else b.D42 end as D42,           ');
   DM.qrTab.SQL.Add('                          case when 5<@d1 then null else b.D51 end as D51,case when 5<@d1 then null else b.D52 end as D52,           ');
   DM.qrTab.SQL.Add('                          case when 6<@d1 then null else b.D61 end as D61,case when 6<@d1 then null else b.D62 end as D62,           ');
   DM.qrTab.SQL.Add('                          b.D71,b.D72                                                                                                ');
   DM.qrTab.SQL.Add('from Inform..DtGrafik b, Inform..DhGrafik a where b.IsDeleted is null and a.idtab=b.idtab and DtStart<=@dt1 and DtEnd>=@dt1                                  ');
   DM.qrTab.SQL.Add('union                                                                                                                                ');
   DM.qrTab.SQL.Add('select b.id_user,b.idtab,b.id_type,b.id_role,b.iszam,b.D11,b.D12,b.D21,b.D22,b.D31,b.D32,b.D41,b.D42,b.D51,b.D52,b.D61,b.D62,b.D71,b.D72 from Inform..DtGrafik b, Inform..DhGrafik a where b.IsDeleted is null and '+' a.idtab=b.idtab and DtStart>@dt1 and DtEnd<@dt2 ');
   DM.qrTab.SQL.Add('union                                                                                                                                                 ');
   DM.qrTab.SQL.Add('select b.id_user,b.idtab,b.id_type,b.id_role,b.iszam,b.D11,b.D12,                                                                                                       ');
   DM.qrTab.SQL.Add('                         case when 2>@d2 then null else b.D21 end as D21,case when 2>@d2 then null else b.D22 end as D22,                             ');
   DM.qrTab.SQL.Add('                         case when 3>@d2 then null else b.D31 end as D31,case when 3>@d2 then null else b.D32 end as D32,                             ');
   DM.qrTab.SQL.Add('                         case when 4>@d2 then null else b.D41 end as D41,case when 4>@d2 then null else b.D42 end as D42,                             ');
   DM.qrTab.SQL.Add('                         case when 5>@d2 then null else b.D51 end as D51,case when 5>@d2 then null else b.D52 end as D52,                             ');
   DM.qrTab.SQL.Add('                         case when 6>@d2 then null else b.D61 end as D61,case when 6>@d2 then null else b.D62 end as D62,                             ');
   DM.qrTab.SQL.Add('                         case when 7>@d2 then null else b.D71 end as D71,case when 7>@d2 then null else b.D72 end as D72                              ');
   DM.qrTab.SQL.Add('from Inform..DtGrafik b, Inform..DhGrafik a where b.IsDeleted is null and a.idtab=b.idtab and DtStart<=@dt2 and DtEnd>=@dt2) a                                                ');
   DM.qrTab.SQL.Add('group by id_user,id_type,id_role,iszam                                                                                                                              ');
   DM.qrTab.SQL.Add('                                                                                                                                                      ');
   DM.qrTab.SQL.Add('if Object_ID(N''tempdb..#tmp_zv'') is not null drop table #tmp_zv                                                                                     ');
   DM.qrTab.SQL.Add('                                                                                                                                                      ');
   DM.qrTab.SQL.Add('select a.row_id,a.id_role,a.idtab,a.id_user,a.iszam,users,a.dolgn,                                                                                        ');
   DM.qrTab.SQL.Add('   a.id_type,d11,d12,d21,d22,d31,d32,d41,d42,d51,d52,d61,d62,d71,d72                                                                                  ');
   DM.qrTab.SQL.Add('into #tmp_zv                                                                                                                                          ');
   DM.qrTab.SQL.Add('from Inform..DtGrafik a, SprUser b                                                                                                                    ');
   DM.qrTab.SQL.Add('where a.IsDeleted is null and a.id_user=b.id and a.id_role<>5 and a.id_role<>0 and a.id_user=b.id and a.idtab='+IntToStr(IDTAB)+' and (a.id_role=4 or a.id_type=7) and a.id_type in (0,7)                            ');
   DM.qrTab.SQL.Add('order by a.id_type,b.id_role desc,b.IsZam,b.users                                                                                                     ');
   DM.qrTab.SQL.Add('                                                                                                                                                      ');
   DM.qrTab.SQL.Add('declare @i int, @sql varchar(5000)                                                                                                                    ');
   DM.qrTab.SQL.Add('set @i=1                                                                                                                                              ');
   DM.qrTab.SQL.Add('while @i<=7                                                                                                                                           ');
   DM.qrTab.SQL.Add(' begin                                                                                                                                                ');
   DM.qrTab.SQL.Add('  set @sql=''update #tmp_zv set d''+convert(varchar,@i)+''1=apteka_net.dbo.GetHours(d''+convert(varchar,@i)+''1), d''+convert(varchar,@i)+''2=apteka_net.dbo.GetHours(d''+convert(varchar,@i)+''2) ''  ');
   DM.qrTab.SQL.Add('  exec(@sql)                                                                                                                                                                                           ');
   DM.qrTab.SQL.Add('  set @sql=''if IsNull((select Sum(convert(numeric(8,2),d''+convert(varchar,@i)+''1)) from #tmp_zv where id_role=4 and iszam=0),0)>0                                                                   ');
   DM.qrTab.SQL.Add('             update #tmp_zv set d''+convert(varchar,@i)+''1=''''0.00'''' where not (id_role=4 and iszam=0) ''                                                                                          ');
   DM.qrTab.SQL.Add('  exec(@sql)                                                                                                                                                                                           ');
   DM.qrTab.SQL.Add('  set @sql=''if IsNull((select Sum(convert(numeric(8,2),d''+convert(varchar,@i)+''2)) from #tmp_zv where id_role=4 and iszam=0),0)>0                                                                   ');
   DM.qrTab.SQL.Add('             update #tmp_zv set d''+convert(varchar,@i)+''2=''''0.00'''' where not (id_role=4 and iszam=0) ''                                                                                          ');
   DM.qrTab.SQL.Add('  exec(@sql)                                                                                                                                                                                           ');
   DM.qrTab.SQL.Add('                                                                                                                                                                                                       ');
   DM.qrTab.SQL.Add('  set @sql=''declare @cnt int                                                                                                                                                                          ');
   DM.qrTab.SQL.Add('            set @cnt=(select Count(*) from #tmp_zv where iszam=1 and convert(numeric(8,2),d''+convert(varchar,@i)+''1)>0)                                                                              ');
   DM.qrTab.SQL.Add('            if @cnt>0                                                                                                                                                                                  ');
   DM.qrTab.SQL.Add('             update #tmp_zv set d''+convert(varchar,@i)+''1=convert(varchar,convert(numeric(8,2),(convert(numeric(8,2),d''+convert(varchar,@i)+''1)/@cnt))) where iszam=1 ''                           ');
   DM.qrTab.SQL.Add('  exec(@sql)                                                                                                                                                                                           ');
   DM.qrTab.SQL.Add('                                                                                                                                                                                      ');
   DM.qrTab.SQL.Add('  set @sql=''declare @cnt int                                                                                                                                                         ');
   DM.qrTab.SQL.Add('            set @cnt=(select Count(*) from #tmp_zv where iszam=1 and convert(numeric(8,2),d''+convert(varchar,@i)+''2)>0)                                                             ');
   DM.qrTab.SQL.Add('            if @cnt>0                                                                                                                                                                 ');
   DM.qrTab.SQL.Add('             update #tmp_zv set d''+convert(varchar,@i)+''2=convert(varchar,convert(numeric(8,2),(convert(numeric(8,2),d''+convert(varchar,@i)+''2)/@cnt))) where iszam=1 ''          ');
   DM.qrTab.SQL.Add('  exec(@sql)                                                                                                                                                                          ');

   DM.qrTab.SQL.Add('  set @sql=''update #tmp_zv set d''+convert(varchar,@i)+''1='''''''' where d''+convert(varchar,@i)+''1=''''0.00'''' ''          ');
   DM.qrTab.SQL.Add('  exec(@sql)                                                                                                                                                                          ');
   DM.qrTab.SQL.Add('  set @sql=''update #tmp_zv set d''+convert(varchar,@i)+''2='''''''' where d''+convert(varchar,@i)+''2=''''0.00'''' ''          ');
   DM.qrTab.SQL.Add('  exec(@sql)                                                                                                                                                                          ');
   DM.qrTab.SQL.Add('  set @i=@i+1                                                                                                                                                                         ');
   DM.qrTab.SQL.Add(' end                                                                                                                                                                                  ');
   DM.qrTab.SQL.Add('                                                                                                                                                                                      ');
   DM.qrTab.SQL.Add('select a.row_id,a.id_role,a.idtab,a.id_user,a.iszam,b.users,a.dolgn,                                                                                                                  ');
   DM.qrTab.SQL.Add('   a.id_type,d11,d12,d21,d22,d31,d32,d41,d42,d51,d52,d61,d62,d71,d72,                        ');
   DM.qrTab.SQL.Add('  (select top 1 g.Hours from #tmp_g g where g.id_user=a.id_user and g.id_type=a.id_type and g.id_role=a.id_role and a.iszam=g.iszam) as Hours,a.IsDop,a.Dt_Begin,IsNull(a.Dt_End,getdate()+40000) as Dt_End ');
   DM.qrTab.SQL.Add('from Inform..DtGrafik a, SprUser b                                                                                                                                                    ');
   DM.qrTab.SQL.Add('                                                                                                                                                                                      ');
   DM.qrTab.SQL.Add('where a.IsDeleted is null and a.id_role not in (0,2) and a.id_user=b.id and a.idtab='+IntToStr(IDTAB)+'                                                                                                                ');

{
   DM.qrTab.SQL.Add('and (b.reserve=0 or IsNull(d11,'''')<>'''' or IsNull(d12,'''')<>'''' or IsNull(d21,'''')<>'''' or IsNull(d22,'''')<>'''' or IsNull(d31,'''')<>'''' or                                 ');
   DM.qrTab.SQL.Add('    IsNull(d32,'''')<>'''' or IsNull(d41,'''')<>'''' or IsNull(d42,'''')<>'''' or IsNull(d51,'''')<>'''' or IsNull(d52,'''')<>'''' or IsNull(d61,'''')<>'''' or                       ');
   DM.qrTab.SQL.Add('    IsNull(d62,'''')<>'''' or IsNull(d71,'''')<>'''' or IsNull(d72,'''')<>'''' )                                                                                                      ');
}
   DM.qrTab.SQL.Add('union all                                                                                                                                                                             ');
   DM.qrTab.SQL.Add('select a.row_id,a.id_role,a.idtab,a.id_user,a.iszam,users,a.dolgn,                                                                                                                        ');
   DM.qrTab.SQL.Add('   9,d11,d12,d21,d22,d31,d32,d41,d42,d51,d52,d61,d62,d71,d72,                                                                                                                         ');
   DM.qrTab.SQL.Add('   convert(numeric(8,2),IsNull(NullIf(d11,''''),0))+convert(numeric(8,2),IsNull(NullIf(d12,''''),0))+              ');
   DM.qrTab.SQL.Add('   convert(numeric(8,2),IsNull(NullIf(d21,''''),0))+convert(numeric(8,2),IsNull(NullIf(d22,''''),0))+              ');
   DM.qrTab.SQL.Add('   convert(numeric(8,2),IsNull(NullIf(d31,''''),0))+convert(numeric(8,2),IsNull(NullIf(d32,''''),0))+              ');
   DM.qrTab.SQL.Add('   convert(numeric(8,2),IsNull(NullIf(d41,''''),0))+convert(numeric(8,2),IsNull(NullIf(d42,''''),0))+              ');
   DM.qrTab.SQL.Add('   convert(numeric(8,2),IsNull(NullIf(d51,''''),0))+convert(numeric(8,2),IsNull(NullIf(d52,''''),0))+              ');
   DM.qrTab.SQL.Add('   convert(numeric(8,2),IsNull(NullIf(d61,''''),0))+convert(numeric(8,2),IsNull(NullIf(d62,''''),0))+              ');
   DM.qrTab.SQL.Add('   convert(numeric(8,2),IsNull(NullIf(d71,''''),0))+convert(numeric(8,2),IsNull(NullIf(d72,''''),0)) as Hours,0,null,null      ');
   DM.qrTab.SQL.Add('from #tmp_zv a                                                                                                                                                                        ');
   DM.qrTab.SQL.Add('order by a.id_type,a.id_role desc,a.IsZam,b.users                                                                                                                                     ');

//   DM.qrTab.SQL.SaveToFile('C:\Grafik.sql');
   DM.qrTab.Open;
   DM.qrTab.Locate('ROW_ID',Rd,[]);
   dbgTab.SelectedIndex:=Col;

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select top 1 id_type from Inform..DtGrafik where id_type=7 and idtab='+IntToStr(IdTab);
   DM.QrEx.Open;
   BitBtn2.Enabled:=Not DM.QrEx.IsEmpty;

  except
   on E:Exception do MainF.MessBox('Ошибка доступа к таблице "Графики работы сотрудников": '+E.Message);
  end;
 end;



function TTableF.CheckMesh(DtMesh:TDateTime):Boolean;
var Dt_1:TDateTime;
 begin

  if Pos(AnsiLowerCase('Переучет'),AnsiLowerCase(dbgTab.SelectedField.AsString))<>0 then Dt_1:=Date-1 else Dt_1:=Date;
  Result:=Not ((DM.qrTab.FieldByName('id_type').AsInteger=9) or
               ((StrToDate(DateToStr(DtMesh))<StrToDate(DateToStr(DM.qrTab.FieldByName('dt_begin').AsDateTime))) or (StrToDate(DateToStr(DtMesh))>StrToDate(DateToStr(DM.qrTab.FieldByName('dt_end').AsDateTime)))) or
               (DtMesh<Dt_1) );
 end;

procedure TTableF.dbgTabDrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
var db:TDBGrid;
    Dolgn,Tx,ss,ks:String;
    Gt:TGrafTime;
    P1,k,dy,dx,P:Integer;
    PColor,BColor:TColor;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  Case db.DataSource.DataSet.FieldByName('ID_TYPE').AsInteger of
   1:db.Canvas.Brush.Color:=clYellow;
   2:db.Canvas.Brush.Color:=clAqua;
   3:db.Canvas.Brush.Color:=clLime;
   4:db.Canvas.Brush.Color:=clFuchsia;
   5:db.Canvas.Brush.Color:=clMoneyGreen;
   6:db.Canvas.Brush.Color:=$00BBBB00;
   7:db.Canvas.Brush.Color:=$0000B3B3;
   8:db.Canvas.Brush.Color:=clSilver;
   9:db.Canvas.Brush.Color:=$00FF9BCD;
   10:db.Canvas.Brush.Color:=$000080FF;
   11:db.Canvas.Brush.Color:=$00C08000;
   12:db.Canvas.Brush.Color:=$00FF9191;
   13:db.Canvas.Brush.Color:=$0052A400;
   18:db.Canvas.Brush.Color:=$00BFFFFF;
  end;

  if DataCol in [6,8,10,12,14,16,18] then db.Canvas.Brush.Color:=$00EFEFEF;
  if gdSelected in State then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;
  Tx:=db.DataSource.DataSet.FieldByName(Column.Field.FieldName).AsString;
  Dolgn:=db.DataSource.DataSet.FieldByName('Dolgn').AsString;
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);

  if (DataCol in [3]) then
   begin
    db.Canvas.FillRect(Rect);
    P1:=Pos(' ',Tx);
    db.Canvas.TextOut(Rect.Left+1,Rect.Top+1,Copy(Tx,1,P1-1));
    db.Canvas.TextOut(Rect.Left+1,Rect.Top+17,Copy(Tx,P1+1,Length(Tx)));
    if Dolgn<>'' then
     begin
      db.Canvas.Font.Style:=[];
      db.Canvas.Font.Name:='Arial';
      db.Canvas.Font.Size:=8;
      db.Canvas.TextOut(Rect.Left+1,Rect.Top+32,Dolgn);
     end;

   end else
  if (DataCol in [5..18]) and (Tx<>'') and (db.DataSource.DataSet.FieldByName('id_type').AsInteger<>9) then
   try
    db.Canvas.FillRect(Rect);
    Gt:=StrToGrafTime(Tx);
//    k:=GetRole(Gt.Descr);
//    if K in [4,41] then
    if db.DataSource.DataSet.FieldByName('id_role').AsInteger=4 then
     begin
      Case db.DataSource.DataSet.FieldByName('iszam').AsInteger of
       0:db.Canvas.Brush.Color:=$009B9BFF;
       1:db.Canvas.Brush.Color:=$00D9D9FF;
      end;
      if gdSelected in State then
       begin
        db.Canvas.Brush.Color:=clNavy;
        db.Canvas.Font.Color:=clWhite;
       end;
      db.Canvas.FillRect(Rect);
     end;
    if (Gt.tStart<>0) or (Gt.tEnd<>0) then
     begin
      if Gt.Descr<>'' then dy:=2 else dy:=(Abs(Rect.Top-Rect.Bottom)-12) div 2;
      ss:=IntToStr(Gt.tStart);
      dx:=0;
      db.Canvas.Font.Name:='MS Sans Serif';
      db.Canvas.Font.Size:=8;
      db.Canvas.TextOut(Rect.Left+dx,Rect.Top+dy+2,ss);
      Inc(dx,db.Canvas.TextWidth(ss)+1);

      ss:=IntToStrF(Gt.tStMin,2);
      db.Canvas.Font.Name:='Arial';
      db.Canvas.Font.Size:=8;
      db.Canvas.TextOut(Rect.Left+dx,Rect.Top+dy-2,ss);
      Inc(dx,db.Canvas.TextWidth(ss));

      ss:='-';
      db.Canvas.Font.Name:='MS Sans Serif';
      db.Canvas.Font.Size:=8;
      db.Canvas.TextOut(Rect.Left+dx,Rect.Top+dy+2,ss);
      Inc(dx,db.Canvas.TextWidth(ss));

      ss:=IntToStrF(Gt.tEnd,2);
      db.Canvas.TextOut(Rect.Left+dx,Rect.Top+dy+2,ss);
      Inc(dx,db.Canvas.TextWidth(ss)+1);

      ss:=IntToStrF(Gt.tEndMin,2);
      db.Canvas.Font.Name:='Arial';
      db.Canvas.Font.Size:=8;
      db.Canvas.TextOut(Rect.Left+dx,Rect.Top+dy-2,ss);
      P:=Pos('H',Gt.Descr);
      ks:=' касса';
      if P<>0 then ks:='к. Зв '+Copy(Gt.Descr,P+1,Length(Gt.Descr)-P);
      if (GetKassa(Gt.Descr)<>'0') and (GetKassa(Gt.Descr)<>'') then
       db.Canvas.TextOut(Rect.Left+1,Rect.Top+dy+16,GetKassa(Gt.Descr)+ks);


      db.Canvas.TextOut(Rect.Left+1,Rect.Top+dy+28,GetDescr(Gt.Descr));
     end else begin
               ss:=GetDescr(Gt.Descr);
               db.Canvas.Font.Name:='MS Sans Serif';
               db.Canvas.Font.Size:=8;
               dx:=(Abs(Rect.Left-Rect.Right)-db.Canvas.TextWidth(ss)) div 2;
               dy:=(Abs(Rect.Top-Rect.Bottom)-db.Canvas.TextHeight(ss)) div 2;
               db.Canvas.TextOut(Rect.Left+dx,Rect.Top+dy,ss);
              end;
   except
   end else
  if (DataCol in [5..18]) and (Tx='') then
   begin

    if CheckMesh(DtStart+(DataCol-5) div 2)=False then
     begin
      PColor:=db.Canvas.Pen.Color;
      BColor:=db.Canvas.Brush.Color;
      db.Canvas.Pen.Color:=db.Canvas.Brush.Color;
      db.Canvas.Brush.Color:=clBlack;
      db.Canvas.Brush.Style:=bsBDiagonal;
      db.Canvas.Rectangle(Rect);
      db.Canvas.Brush.Style:=bsSolid;
      db.Canvas.Pen.Color:=PColor;
      db.Canvas.Brush.Color:=BColor;
     end;
     // db.Canvas.TextOut(Rect.Left+1,Rect.Top+3,DateToStr(DtStart+(DataCol-5) div 2));
   end else
  if (DataCol=19) and (Tx='0') then
   begin
    db.Canvas.FillRect(Rect);
   end;
 end;

function TTableF.SetPhoneUser:Boolean;
 begin
  try
   DM.Qr1.Close;
   DM.Qr1.SQl.Text:='select ID,Users,IsNull(Phone,'''') as Phone from SprUser where id='+DM.qrTab.FieldByName('ID_User').AsString;
   DM.Qr1.Open;
   if DM.Qr1.FieldByName('Phone').AsString<>'' then begin Result:=True; Exit; end;
   SetPhoneF:=TSetPhoneF.Create(Self);
   try
    SetPhoneF.lbFIO.Caption:=DM.Qr1.FieldByName('Users').AsString;
    SetPhoneF.ID_User:=DM.Qr1.FieldByName('ID').AsInteger;
    Application.ProcessMessages;
    SetPhoneF.ShowModal;
    if SetPhoneF.Flag<>1 then
     begin
      MainF.MessBox('Необходимо обязательно ввести телефон сотрудника: '+ SetPhoneF.lbFIO.Caption);
      Abort;
     end;
   finally
    SetPhoneF.Free;
   end;
   Result:=True;
  except
   Result:=False;
  end;
 end;


procedure TTableF.SetValue;
var ID_USER,IDTAB,ROW_ID,Smena,Tu,nDay:Integer;
    Dt_1,DtMesh:TDateTime;
    Users,Res,Col2,ColV2,D1,D2:String;
    B:Boolean;

 function DateTStrG(D1,D2:TDateTime):String;
  begin
   Result:=FormatDateTime('h',D1)+':'+FormatDateTime('n',D1)+'-'+
           FormatDateTime('h',D2)+':'+FormatDateTime('n',D2);
  end;

 Begin

  if (ShowOnly<>0) and (Prm.UserRole<>R_ADMIN) then
   begin
    MainF.MessBox('Чтобы изменять график, нужно зайти в программу под заведующим или зам. заведующего!');
    Exit;
   end;

  if DM.qrTab.IsEmpty then Close;
  if Not (dbgTab.SelectedIndex in [5..18]) then Exit;
  if DM.qrTab.FieldByName('id_type').AsInteger=9 then Exit;

 {
  if WeekOf(DtStart)<WeekOf(Date) then Exit;
   if (Date>=DtStart) and (Date<=DtEnd) and (StrToDate(DateToStr(Date))>StrToDate(DateToStr(EndOfTheMonth(Date)))-2) and
      (StrToDate(DateToStr(DtStart+StrToInt(Copy(dbgTab.SelectedField.FieldName,2,1))))-1<=StrToDate(DateToStr(EndOfTheMonth(Date))))  then Exit;
 }

  ROW_ID:=DM.qrTab.FieldByName('row_id').AsInteger;
  IDTAB:=DM.qrTab.FieldByName('idtab').AsInteger;
  ID_User:=DM.qrTab.FieldByName('id_user').AsInteger;
  Users:=DM.qrTab.FieldByName('users').AsString;

  if Prm.GrafikUpdateNew then
   begin
    Dt_1:=StartOfTheWeek(EndOfTheWeek(Date)+1);
   end else begin
             if Pos(AnsiLowerCase('Переучет'),AnsiLowerCase(dbgTab.SelectedField.AsString))<>0 then Dt_1:=Date-1 else Dt_1:=Date;
            end;

  DtMesh:=StrToDate(DateToStr(DtStart+StrToInt(Copy(dbgTab.SelectedField.FieldName,2,1))))-1;

  if (Prm.UserRole<>R_ADMIN) or ((Prm.UserRole=R_ADMIN) and (MainF.Design=False)) then
   begin

    if (DtMesh<StrToDate(DateToStr(Dt_1)))  then
     begin
      if Prm.GrafikUpdateNew then MainF.MessBox('За прошлые даты и на текущую неделю нельзя изменять график!')
                             else MainF.MessBox('За прошлые даты нельзя изменять график!');
      Exit;
     end;

    if CheckMesh(DtMesh)=False then
     begin
      if MainF.MessBox('В заштрихованных ячейках нельзя устанавливать время по графику! Можно только ее очистить!'#10#10'Чтобы очистить ячейку нажмите "ДА".',52)<>ID_YES then Exit;
      DM.Qr1.Close;
      DM.Qr1.SQL.Text:='update Inform..DtGrafik set '+dbgTab.SelectedField.FieldName+'=null where row_id='+DM.qrTab.FieldByName('row_id').AsString;
      DM.Qr1.ExecSQL;
      TableF.ShowTab;
      Exit;
     end;
   end;

//  if Not SetPhoneUser then Exit;

  Tu:=DM.qrTab.FieldByName('id_type').AsInteger;

  if Prm.GrafikUpdateNew=False then
   if (Tu=1) and (dbgTab.SelectedIndex in [6,8,10,12,14,16,18]) then
    begin
     MainF.MessBox('Для ночной смены время необходимо вводить в графу "I-я смена"');
     Exit;
    end;

  // Проверяем, чтобы не было ночных смен по сотруднику одновременно в строке "Ночная смена" и "Администратор зала"

  if dbgTab.SelectedIndex mod 2<>0 then
   begin
    ColV2:=dbgTab.Fields[dbgTab.SelectedIndex+1].AsString;
    Col2:=dbgTab.Fields[dbgTab.SelectedIndex+1].FieldName;
    Smena:=1;
   end else begin
             ColV2:=dbgTab.Fields[dbgTab.SelectedIndex-1].AsString;
             Col2:=dbgTab.Fields[dbgTab.SelectedIndex-1].FieldName;
             Smena:=2;
            end;

  // Установка смены в строке старшинство
  if Tu=7 then
   try
    B:=False;

    DM.Qr1.Close;
    DM.Qr1.SQL.Clear;

    DM.Qr1.SQL.Add('declare @B smallint, @B1 smallint, @d1 varchar(50), @d2 varchar(50) ');
    DM.Qr1.SQL.Add('set @B=(select Count(*) ');
    DM.Qr1.SQL.Add('        from Inform..DtGrafik ');
    DM.Qr1.SQL.Add('        where idtab='+IntToStr(idtab)+' and ');
    DM.Qr1.SQL.Add('              id_role=4 and id_type=0 and IsNull(IsDeleted,0)=0 and ' );
    DM.Qr1.SQL.Add('              (IsNull(NullIf('+dbgTab.SelectedField.FieldName+',''''),''0:0-0:0'') not like ''0:0-0:0%'' or  IsNull(NullIf('+Col2+',''''),''0:0-0:0'') not like ''0:0-0:0%'' ))');
    DM.Qr1.SQL.Add('select @d1='+dbgTab.SelectedField.FieldName+',@d2='+Col2+' ');
    DM.Qr1.SQL.Add('from Inform..DtGrafik ');
    DM.Qr1.SQL.Add('where idtab='+IntToStr(idtab)+' and ');
    DM.Qr1.SQL.Add('      id_type=0 and ');
    DM.Qr1.SQL.Add('      id_user='+IntToStr(id_user)+' and IsNull(IsDeleted,0)=0 and ');
    DM.Qr1.SQL.Add('      (IsNull(NullIf('+dbgTab.SelectedField.FieldName+',''''),''0:0-0:0'') not like ''0:0-0:0%'' or  IsNull(NullIf('+Col2+',''''),''0:0-0:0'') not like ''0:0-0:0%'' ) ');
    DM.Qr1.SQL.Add('set @B1=@@rowcount ');
    DM.Qr1.SQL.Add('select @B as B,  @B1 as B1, @d1 as d1 ,@d2 as d2 ');

//   DM.Qr1.SQL.SaveToFile('C:\Grafik_.txt');
    DM.Qr1.Open;

    if DM.Qr1.FieldByName('B').AsInteger>0 then
     begin

      DM.QrEx.Close;
      DM.QrEx.SQL.Text:='exec spY_GetSmenaStarsh '+IntToStr(idtab)+','+Copy(dbgTab.SelectedField.FieldName,2,1);
      DM.QrEx.Open;
      if DM.QrEx.FieldByName('B').AsInteger=1 then
       MainF.MessBox('Нельзя выставлять часы старшинства, если есть смены заведующего или зам. зав. !',
                      48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res)
      else begin  // Смены зав или зам неполные

            if DM.QrEx.FieldByName('d1').AsInteger=0 then
             d1:=''
            else
             d1:=DateTStrG(DM.QrEx.FieldByName('d1b').AsDateTime,DM.QrEx.FieldByName('d1e').AsDateTime)+'_#$1';

            if DM.QrEx.FieldByName('d2').AsInteger=0 then
             d2:=''
            else
             d2:=DateTStrG(DM.QrEx.FieldByName('d2b').AsDateTime,DM.QrEx.FieldByName('d2e').AsDateTime)+'_#$1';

            B:=True;
           end;

     end else
    if DM.Qr1.FieldByName('B1').AsInteger<=0 then
     begin
      MainF.MessBox('Для того чтобы выставить часы старшинста у cотрудника '+Users+' должны быть выставлены часы дневной смены !',
                     48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
     end else begin

               d1:=DM.Qr1.FieldByName('d1').AsString;
               d2:=DM.Qr1.FieldByName('d2').AsString;

               if Not ((d1='') or (Copy(d1,1,7)='0:0-0:0')) then d1:=Copy(d1,1,Pos('_',d1)-1)+'_#$1';
               if Not ((d2='') or (Copy(d2,1,7)='0:0-0:0')) then d2:=Copy(d2,1,Pos('_',d2)-1)+'_#$1';
               B:=True;

              end;

    if B then
     begin
      if (dbgTab.SelectedField.AsString='') or (Copy(dbgTab.SelectedField.AsString,1,7)='0:0-0:0') then
       begin
        if MainF.MessBox('Установить часы старшинства?',52)<>ID_YES then Exit;

        DM.Qr1.Close;
        DM.Qr1.SQL.Clear;
        DM.Qr1.SQL.Add('update Inform..DtGrafik set '+dbgTab.SelectedField.FieldName+'='''+d1+''','+Col2+'='''+d2+''' ');

       end else begin
                 if MainF.MessBox('Удалить часы старшинства?',52)<>ID_YES then Exit;

                 DM.Qr1.Close;
                 DM.Qr1.SQL.Clear;
                 DM.Qr1.SQL.Add('update Inform..DtGrafik set '+dbgTab.SelectedField.FieldName+'=null,'+Col2+'=null ');
                end;

      DM.Qr1.SQL.Add('where row_id='+IntToStr(row_id));
      DM.Qr1.ExecSQL;
      ShowTab;
     end;
    Exit;
   except
    on E:Exception do
     begin
      MainF.MessBox('Ошибка установки смены старшинства: '+E.Message);
      Exit;
     end;
   end;

//  if Prm.NewGrafik then
  if Prm.GrafikUpdateNew then
   begin
    DM.qrWorkPos.Close;

{
    DM.qrWorkPos.Parameters.ParamByName('idtype').Value:=Tu;
    DM.qrWorkPos.Parameters.ParamByName('idrole').Value:=DM.qrTab.FieldByName('id_role').AsInteger;
    DM.qrWorkPos.Parameters.ParamByName('iszam').Value:=DM.qrTab.FieldByName('IsZam').AsInteger;
}

    if dbgTab.SelectedIndex mod 2<>0 then nDay:=((dbgTab.SelectedIndex-3) div 2)
                                     else nDay:=(dbgTab.SelectedIndex-5) div 2;

    DM.qrWorkPos.Parameters.ParamByName('iday').Value:=nDay;
    DM.qrWorkPos.Open;
   end;

  if Prm.GrafikUpdateNew=False then
   try
    DM.QrEx.Close;
    DM.QrEx.SQL.Text:='exec spY_GetHoursCleaning '''+FormatDateTime('yyyy-mm-dd',DtMesh)+'''';
    DM.QrEx.Open;

    SumHClMn:=DM.QrEx.FieldByName('SumHMn').AsCurrency;
    SumHClAll:=DM.QrEx.FieldByName('SumHAll').AsCurrency;

    AETabF:=TAETabF.Create(Self);
    try
     AETabF.Col:=dbgTab.SelectedField.FieldName;

     AETabF.StrTimeOther:=ColV2;
     AETabF.Col2:=Col2;
     AETabF.Smena:=Smena;
     AETabF.idtab:=idtab;
     AETabF.NumDay:=StrToInt(Copy(dbgTab.SelectedField.FieldName,2,1));
     AETabF.ID_User:=ID_User;

//    AETabF.NewGrafik:=(Prm.NewGrafik) and (DM.qrWorkPos.IsEmpty=False);

     AETabF.StrTime:=DM.qrTab.FieldByName(AETabF.Col).AsString;

     AETabF.Row:=ROW_ID;
     AETabF.ID_Role:=DM.qrTab.FieldByName('id_role').AsInteger;
     AETabF.IsNight:=False;
     AETabF.ID_Type:=Tu;

     AETabF.RadioButton6.Checked:=True;
     if dbgTab.SelectedIndex in [5,7,9,11,13,15,17] then
      begin
       if Not (Tu in [1]) then
        begin
         if Tu in [2,13,3,10,11] then AETabF.Oklad:=True;
         AETabF.RadioButton1.Checked:=True;
         AETabF.RadioButton1Click(AETabF.RadioButton1);
        end else begin
                  AETabF.IsNight:=True;
                  AETabF.RadioButton3.Checked:=True;
//                                AETabF.RadioButton3Click(AETabF.RadioButton3);
                 end;
       end else begin
                 AETabF.RadioButton2.Checked:=True;
//                AETabF.RadioButton2Click(AETabF.RadioButton2);
               end;

{
    AETabF.Label5.Enabled:=DM.qrTab.FieldByName('id_role').AsInteger=4;
    AETabF.Edit1.Enabled:=DM.qrTab.FieldByName('id_role').AsInteger=4;
}
     Application.ProcessMessages;
     AETabF.ShowModal;
    finally
     AETabF.Free;
    end;
   except
    on E:Exception do MainF.MessBox('Ошибка редактирования ячейки графика: '+E.Message);
   end else try // График по новому
             AETabNewF:=TAETabNewF.Create(Self);
             try
              AETabNewF.ShowModal;
             finally
              AETabNewF.Free;
             end;
            except
             on E:Exception do MainF.MessBox('Ошибка редактирования ячейки графика: '+E.Message);
            end;
 End;

procedure TTableF.dbgTabDblClick(Sender:TObject);
 begin
  SetValue;
 end;

procedure TTableF.dbgTabKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key=VK_RETURN then SetValue;
 end;

procedure TTableF.BitBtn4Click(Sender: TObject);
 begin
  Close;
 end;

procedure TTableF.BitBtn1Click(Sender: TObject);
var i:Integer;

 procedure AddTab(Caption:String; ID_TYPE:Integer);
 var i,j,Rc,P:Integer;
     Tb:TTableObj;
     Tx,S,ss,ks:String;
     Gt:TGrafTime;
  begin
   DM.Qr.Close;
   DM.Qr.SQL.Clear;

   if ID_TYPE<>9 then
    begin
     DM.Qr.SQL.Add('select a.row_id,a.id_role,a.idtab,a.id_user,users,                                                                                                ');
     DM.Qr.SQL.Add('       a.id_type,d11,d12,d21,d22,d31,d32,d41,d42,d51,d52,d61,d62,d71,d72, ');
     DM.Qr.SQL.Add('       (select top 1 g.Hours from #tmp_g g where g.id_user=a.id_user and g.id_type=a.id_type and g.id_role=a.id_role and g.iszam=a.iszam) as Hours');
     DM.Qr.SQL.Add('from Inform..DtGrafik a, SprUser b                                                                                                          ');
     DM.Qr.SQL.Add('                                                                                                                                                                  ');
     DM.Qr.SQL.Add('where a.IsDeleted is null and a.id_type='+IntToStr(id_type)+' and a.id_role not in (0,2) and a.id_user=b.id and a.idtab='+IntToStr(IdTab)                               );

{     DM.Qr.SQL.Add('and (b.reserve=0 or IsNull(d11,'''')<>'''' or IsNull(d12,'''')<>'''' or IsNull(d21,'''')<>'''' or IsNull(d22,'''')<>'''' or IsNull(d31,'''')<>'''' or             ');
     DM.Qr.SQL.Add('    IsNull(d32,'''')<>'''' or IsNull(d41,'''')<>'''' or IsNull(d42,'''')<>'''' or IsNull(d51,'''')<>'''' or IsNull(d52,'''')<>'''' or IsNull(d61,'''')<>'''' or   ');
     DM.Qr.SQL.Add('    IsNull(d62,'''')<>'''' or IsNull(d71,'''')<>'''' or IsNull(d72,'''')<>'''' ) and a.id_type='+IntToStr(ID_TYPE));
}
     DM.Qr.SQL.Add('order by a.id_type,a.id_role desc,a.IsZam,b.users                                                                                                                                     ');
    end else
   if ID_TYPE=9 then
    begin
//   DM.Qr.SQL.Add('union all                                                                                                                                                                             ');
     DM.Qr.SQL.Add('select a.row_id,a.id_role,a.idtab,a.id_user,a.users,                                                                                                                        ');
     DM.Qr.SQL.Add('   9 as id_type,d11,d12,d21,d22,d31,d32,d41,d42,d51,d52,d61,d62,d71,d72,                                                                                                                         ');
     DM.qr.SQL.Add('   convert(numeric(8,2),IsNull(NullIf(d11,''''),0))+convert(numeric(8,2),IsNull(NullIf(d12,''''),0))+              ');
     DM.qr.SQL.Add('   convert(numeric(8,2),IsNull(NullIf(d21,''''),0))+convert(numeric(8,2),IsNull(NullIf(d22,''''),0))+              ');
     DM.qr.SQL.Add('   convert(numeric(8,2),IsNull(NullIf(d31,''''),0))+convert(numeric(8,2),IsNull(NullIf(d32,''''),0))+              ');
     DM.qr.SQL.Add('   convert(numeric(8,2),IsNull(NullIf(d41,''''),0))+convert(numeric(8,2),IsNull(NullIf(d42,''''),0))+              ');
     DM.qr.SQL.Add('   convert(numeric(8,2),IsNull(NullIf(d51,''''),0))+convert(numeric(8,2),IsNull(NullIf(d52,''''),0))+              ');
     DM.qr.SQL.Add('   convert(numeric(8,2),IsNull(NullIf(d61,''''),0))+convert(numeric(8,2),IsNull(NullIf(d62,''''),0))+              ');
     DM.qr.SQL.Add('   convert(numeric(8,2),IsNull(NullIf(d71,''''),0))+convert(numeric(8,2),IsNull(NullIf(d72,''''),0)) as Hours      ');
     DM.Qr.SQL.Add('from #tmp_zv a                                                                                                                                                                        ');
     DM.Qr.SQL.Add('order by a.id_type,a.id_role desc,a.IsZam,a.users                                                                                                                                     ');
    end;
{
   DM.Qr.SQL.Add('select row_id,id_role,idtab,id_user,users,a.id_type,d11,d12,d21,d22,d31,d32,d41,d42,d51,d52,d61,d62,d71,d72, ');
   DM.Qr.SQL.Add('       dbo.GetHours(D11)+dbo.GetHours(D12)+dbo.GetHours(D21)+dbo.GetHours(D22)+dbo.GetHours(D31)+dbo.GetHours(D32)+ ');
   DM.Qr.SQL.Add('       dbo.GetHours(D41)+dbo.GetHours(D42)+dbo.GetHours(D51)+dbo.GetHours(D52)+dbo.GetHours(D61)+dbo.GetHours(D62)+ ');
   DM.Qr.SQL.Add('       dbo.GetHours(D71)+dbo.GetHours(D72) as Hours                                                                 ');
   DM.Qr.SQL.Add('from Inform..DtGrafik a, SprUser b                                                                  ');
   DM.Qr.SQL.Add('where a.id_user=b.id and b.reserve=0 and idtab='+IntToStr(IdTab)                                     );
   DM.Qr.SQL.Add(' and b.id_role<>5 and b.id_role<>5 and a.id_type='+IntToStr(ID_TYPE));
   DM.Qr.SQL.Add('order by b.id_type,b.id_role desc,b.IsZam,b.users                                                                          ');
}
//   DM.Qr.SQL.SaveToFile('C:\23423.txt');
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Exit;
   Rc:=DM.Qr.RecordCount+2;
   PrintRep.Font.Size:=4;
   PrintRep.AddText(Caption);
   PrintRep.AddTable(18,Rc);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('500,4000,1570,1570,1570,1570,1570,1570,1570,1570,1570,1570,1570,1570,1570,1570,1000,1300');

   Tb.Cell[1,1].Font.Size:=4;;
   Tb.Cell[1,1].AddText('№');

   Tb.Cell[2,1].Font.Size:=4;;
   Tb.Cell[2,1].Align:=AL_RIGHT;
   Tb.Cell[2,1].AddText('Дата');

   Tb.Cell[2,2].Font.Size:=4;;
   Tb.Cell[2,2].AddText('Ф.И.О.');

   Tb.Cell[17,1].Font.Size:=4;
   Tb.MergeCells(17,1,17,2);
   Tb.Cell[17,1].AddText('К.ч.');

   Tb.Cell[18,1].Font.Size:=4;
   Tb.MergeCells(18,1,18,2);
   Tb.Cell[18,1].AddText('Подп.');


   for i:=1 to 7 do
    begin
     Tb.MergeCells(i*2+1,1,i*2+2,1);
     Tb.Cell[i*2+1,1].AddText(TPanel(FindComponent('pnd'+IntToStr(i))).Caption);
     Tb.Cell[i*2+1,2].AddText('I см.');
     Tb.Cell[i*2+2,2].AddText('II см.');
    end;

   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     Tb.Cell[1,i+2].Align:=AL_LEFT;
     Tb.Cell[1,i+2].AddText(IntToStr(i));

     Tb.Cell[2,i+2].Align:=AL_LEFT;
     Tb.Cell[2,i+2].AddText(DM.Qr.FieldByName('Users').AsString);

     Tb.Cell[17,i+2].Align:=AL_RIGHT;
     Tb.Cell[17,i+2].AddText(DM.Qr.FieldByName('Hours').AsString);

     for j:=1 to 14 do
      begin
       Tx:=DM.Qr.Fields[j+5].AsString;
       Tb.Cell[j+2,i+2].Font.Size:=3;
       Tb.Cell[j+2,i+2].Font.Style:=[];
       if (Tx<>'') and (ID_TYPE<>9) then
        begin
         Gt:=StrToGrafTime(Tx);
         P:=Pos('H',Gt.Descr);
         ks:=' касса';
         if P<>0 then ks:='кас. Зв '+Copy(Gt.Descr,P+1,Length(Gt.Descr)-P);
         if (GetKassa(Gt.Descr)<>'0') and (GetKassa(Gt.Descr)<>'') then ss:=GetKassa(Gt.Descr)+ks+#10
                                    else ss:='';
         if (Gt.tStart=0) and (Gt.tEnd=0) then S:=GetDescr(Gt.Descr)
                                          else S:=IntToStr(Gt.tStart)+':'+IntToStrF(Gt.tStMin,2)+'-'+
                                                  IntToStr(Gt.tEnd)+':'+IntToStrF(Gt.tEndMin,2)+#10+
                                                  ss+GetDescr(Gt.Descr);
         Tb.Cell[j+2,i+2].AddText(S);
        end else
       if (Tx<>'') and (ID_TYPE=9) then Tb.Cell[j+2,i+2].AddText(Tx);

      end;
    end;
   PrintRep.AddText(#10#10);
  end;

 Begin
  try
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Orientation:=O_LANDS;
   PrintRep.Font.Size:=5;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.Align:=AL_CENTER;

   PrintRep.LeftMargin:=100;
   PrintRep.RightMargin:=100;
   PrintRep.TopMargin:=50;
   PrintRep.BottomMargin:=50;

   PrintRep.AddText('График работы сотрудников'+#10);
   PrintRep.Font.Style:=[fsUnderLine,fsBold];
   PrintRep.AddText(Prm.AptekaNameRU+#10);
   PrintRep.Font.Style:=[fsBold];
   PrintRep.AddText('с '+lbStart.Caption+' по '+lbEnd.Caption+#10#10);

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select id_type,Descr from SprTypeUser where id_type<=100 union all select 9 as id_type,''Часы заведования'' as descr order by 1';
   DM.QrEx.Open;

   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;
     AddTab(DM.QrEx.FieldByName('Descr').AsString,DM.QrEx.FieldByName('ID_TYPE').AsInteger);
    end;
   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к таблице "Графики работы сотрудников":'+E.Message);
  end;
 end;

procedure TTableF.N2Click(Sender:TObject);
var i,j:Integer;
    Gt:TGrafTime;
    B:Boolean;
    Tx:String;
 begin
  if ShowOnly<>0 then Exit;
  if DtEnd<Date then begin MainF.MessBox('Нельзя удалят строки за прошедшие недели!'); Exit; end;

  if DM.qrTab.IsEmpty then Exit;
  if DM.qrTab.FieldByName('id_type').AsInteger=9 then
   begin
    MainF.MessBox('Строка с признаком "Часы заведования" является расчетной и ее нельзя удалить!');
    Exit;
   end;
  try

   if DM.qrTab.FieldByName('IsDop').AsInteger=1 then // если пытаемся удалить строку которая добавлена вручную
    begin
     if MainF.MessBox('Удалить строку?',52)<>ID_YES then Exit;
     if (Date>=DtStart) and (Date<DtEnd+1) then
      begin
       B:=True;
       for i:=1 to DayOfTheWeek(Date)-1 do
        begin
         for j:=1 to 2 do
          begin
           Tx:=DM.qrTab.FieldByName('D'+IntToStr(i)+IntToStr(j)).AsString;
           if Tx='' then Continue;
           Gt:=StrToGrafTime(Tx);
           if (Gt.tStart<>0) or (Gt.tEnd<>0) then begin B:=False; Break; end;
          end;
         if B=False then Break;
        end;
      end else B:=True;
     if B=False then
      begin
       MainF.MessBox('В строке есть данные за прошедшие дни, поэтому ее нельзя удалить и можно только поменять признак сотрудника на другой.'+
                     'Для этого нужно правой кнопкой мыши нажать на нужного сотрудника и выбрать пункт меню "Установить признак пользователя" и выбрать правильный признак!');
       Exit;
      end;
     try
      DM.Qr.Close;
      DM.Qr.SQL.Text:='delete from Inform..DtGrafik where IsDop=1 and row_id='+DM.qrTab.FieldByName('row_id').AsString;
      DM.Qr.ExecSQL;
      ShowTab;
     except
      on E:Exception do MainF.MessBox('Ошибка удаления строки: '+E.Message);
     end;
    end else begin
              MainF.MessBox('Удалять можно только строки добавленные вручную!');

             {
              DM.Qr.Close;
              DM.Qr.SQL.Clear;
              DM.Qr.SQL.Add('declare @rd int');
              DM.Qr.SQL.Add('set @rd='+DM.qrTab.FieldByName('row_id').AsString);

              DM.Qr.SQL.Add('if (select Count(*) from Inform..DtGrafik k, SprUser s where k.row_id=@rd and k.id_user=s.id and s.id_gamma not in ');
              DM.Qr.SQL.Add('     (select id_gamma from SprUser  ');
              DM.Qr.SQL.Add('      where (id_type<=100 or id_role=0) and ');
              DM.Qr.SQL.Add('      id_gamma in (select b.id_employee from Inform..d_dept a,Inform..l_employee_dplace b ');
              DM.Qr.SQL.Add('                   where a.id_apteka=(select convert(int,Value) from Spr_const where Descr=''ID_APTEKA'') and a.id=b.id_dept and ');
              DM.Qr.SQL.Add('                         date_begin<=getdate() and (date_end is null or (date_end  is not null and convert(datetime,substring(convert(varchar,'''+FormatDateTime('yyyy-mm-dd',DtStart)+''',23),1,7)+''-01'')>convert(datetime,substring(convert(varchar,date_end,23),1,7)+''-01'') ');
              DM.Qr.SQL.Add('                         ))))  ');

              DM.Qr.SQL.Add('   )>0 begin delete from Inform..DtGrafik where row_id=@rd  select 999 as Res end else select -999 as Res');
           //   DM.Qr.SQL.SaveToFile('C:\DelG.txt');
              DM.Qr.Open;
              if DM.Qr.FieldByName('Res').AsInteger<>999 then
               begin
                MainF.MessBox('Данного сотрудника еще нельзя удалять из графика!');
               end else ShowTab;
             }
              end;
  except
   MainF.MessBox('Ошибка удаления строки!');
  end;
 end;

procedure TTableF.N5Click(Sender: TObject);
var S:String;
    K,P:Integer;
 begin
  if ShowOnly<>0 then Exit;
  if DM.qrTab.IsEmpty then Exit;
  if dbgTab.SelectedIndex<5 then Exit;
  K:=TMenuItem(Sender).Tag;
  S:=dbgTab.Fields[dbgTab.SelectedIndex].AsString;
  if S='' then Exit;
  P:=Pos('$',S);
  if P=0 then S:=S+'$'+IntToStr(K) else S:=Copy(S,1,P-1)+'$'+IntToStr(K);
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Add('Update Inform..DtGrafik set '+dbgTab.SelectedField.FieldName+'='''+Copy(S,1,40)+''' where row_id='+DM.qrTab.FieldByName('ROW_ID').AsString);
   DM.QrEx.ExecSQL;
   ShowTab;
  except
   MainF.MessBox('Ошибка записи в таблицу "Графики"!');
  end;
 end;

procedure TTableF.BitBtn2Click(Sender: TObject);
var Tb:TTableObj;
    S:String;
    i:Integer;

 function CheckTime(S:String):Boolean;
  begin
   Result:=Not((S='') or (Copy(S,1,7)='0:0-0:0'));
  end;

 Begin
  if Not MainF.IsPermit([R_SUPER],P_ALERT) then Exit;
  try
 {  DM.QrEx1.Close;
   DM.QrEx1.SQL.Text:='select a.*,b.users from Inform..DtGrafik a, SprUser b where a.id_user=b.id and a.id_type=7 and a.idtab='+IntToStr(IDTAB);
   DM.QrEx1.Open;
   if DM.QrEx.RecordCount<>1 then
    begin
     MainF.MessBox('В графике сотрудников с признаком "Старшинство" больше одно либо нет совсем! Формирование заявления невозможно!');
     Exit;
    end;
 }
   if DM.qrTab.FieldByName('id_type').AsInteger<>7 then
    begin
     MainF.MessBox('Выбранный сотрудник не является старшим!');
     Exit;
    end;

   S:='';
   for i:=1 to 7 do
    if (CheckTime(DM.qrTab.FieldByName('D'+IntToStr(i)+'1').AsString) or CheckTime(DM.qrTab.FieldByName('D'+IntToStr(i)+'2').AsString)) then
     S:=S+FormatDateTime('dd.mm.yyyy',DtStart+i-1)+', ';

   if S='' then
    begin
     MainF.MessBox('График на старшинство не заполнен! Формирование заявления невозможно!');
     Exit;
    end;
    
   S:=Copy(S,1,Length(S)-2);

   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=6;

   PrintRep.AddTable(2,3);

   Tb:=PrintRep.LastTable;
   Tb.SetWidths('6000,4000');
   Tb.SetBorders(1,1,2,3,EMPTY_BORDER);
   Tb.Cell[2,1].AddText('Директору '+Prm.FirmNameRU+' '+Prm.BossRod);

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select IsZam from SprUser where id='+IntToStr(Prm.UserID);
   DM.QrEx.Open;

   if DM.QrEx.FieldByName('IsZam').AsInteger=1 then Tb.Cell[2,2].AddText('Зам. зав. аптекой')
                                               else Tb.Cell[2,2].AddText('Зав. аптекой');

   Tb.Cell[2,3].AddText(Prm.UserName);

   PrintRep.Align:=AL_CENTER;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.AddText(#10#10'Заявление'#10#10);

   PrintRep.Align:=AL_JUST;
   PrintRep.Font.Style:=[];

   PrintRep.AddText('Прошу на период моего отсутствия ('+S+') назначить исполняющим обязанности заведующего аптекой следующего работника '+DM.qrTab.FieldByName('Users').AsString+'.'#10);
   PrintRep.AddText('Права и обязанности в соответствии с должностной инструкцией заведующего аптекой разъяснены.'#10#10);

   PrintRep.AddText(DateToStrRu(Date)+'              ________ '+Prm.UserName);

   PrintRep.AddText(#10#10'С назначением на период ('+S+') согласен (-на).'#10);
   PrintRep.AddText('С должностными обязанностями ознакомлен (-на) и обязуюсь выполнять.'#10);
   PrintRep.AddText('С Графиком работы на период ('+S+') ознакомлен (-на) и согласен (-на).'#10#10#10);

   PrintRep.AddText(DateToStrRu(Date)+'              ________ '+DM.qrTab.FieldByName('Users').AsString+#10);

   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования заявления: '+E.Message);
  end;
 End;

procedure TTableF.BitBtn3Click(Sender: TObject);
 begin
  try
   WorkTimeF:=TWorkTimeF.Create(Self);
   try
    Application.ProcessMessages;
    WorkTimeF.ShowModal;
   finally
    WorkTimeF.Free;
   end;
  except
  end;
 end;

procedure TTableF.BitBtn5Click(Sender: TObject);
 begin
  GrafikInfoF:=TGrafikInfoF.Create(Self);
  try
   Application.ProcessMessages;
   GrafikInfoF.ShowModal;
  finally
   GrafikInfoF.Free;
  end;
 end;

procedure TTableF.pmGrPopup(Sender: TObject);
 begin
  N1.Enabled:=DM.qrTab.FieldByName('id_type').AsInteger<>2;
  N8.Enabled:=DM.qrTab.FieldByName('id_type').AsInteger<>2;
 end;

procedure TTableF.N10Click(Sender: TObject);
var DtMesh:TDateTime;
    Col,ColV:String;
 begin
  if DM.qrTab.IsEmpty then Exit;
  if Not (dbgTab.SelectedIndex in [5..18]) then Exit;
  if MainF.MessBox('Вы действительно хотите очистить ячейку?',52)<>ID_YES then Exit;

  DtMesh:=StrToDate(DateToStr(DtStart+StrToInt(Copy(dbgTab.SelectedField.FieldName,2,1))))-1;

  if Prm.UserRole<>R_ADMIN then
   begin
    if (DtMesh<StrToDate(DateToStr(Date))) then
     begin
      MainF.MessBox('За прошлые даты нельзя изменять график!');
      Exit;
     end;
   end;

  Col:=dbgTab.Fields[dbgTab.SelectedIndex].FieldName;

  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='update Inform..DtGrafik set '+Col+'=null where row_id='+DM.qrTab.FieldByName('row_id').AsString+'  select 9999 as Res';
   DM.QrEx.Open;
   ShowTab;
  except
   on E:Exception do MainF.RegisterError('Очистка ячейки графика',E.Message);
  end

 end;

end.


declare @SumHAll numeric(12,2),
        @SumHMn numeric(12,2)

set @SumHMn=IsNull((select Sum(Hours) from #tmp_g where id_type=8),0)

set @SumHAll=IsNull((select top 1 NormHourCleaning from Apteks where id_apteka='+IntToStr(Prm.AptekaID)+'),0)
select @SumHMn as SumHMn, @SumHAll as SumHAll

   SumHClMn:=DM.QrEx.FieldByName('SumHMn').AsCurrency;
   SumHClAll:=DM.QrEx.FieldByName('SumHAll').AsCurrency;


