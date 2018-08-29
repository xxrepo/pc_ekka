unit OstatCheckU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Util, DB,
  Menus;

type
  TOstatCheckF = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel4: TPanel;
    BitBtn6: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    Silent: TCheckBox;
    pmOst: TPopupMenu;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2lick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private

    FIsOstat:Boolean;
    FIsUpdated:Boolean;

    procedure PrepareSQL; 
    procedure ShowKol;
    procedure DSrc1DataChange(Sender: TObject; Field: TField);

  public
    property IsOstat:Boolean read FIsOstat;
    property IsUpdated:Boolean read FIsUpdated;
  end;

procedure ShowOstatCheckF;  

var OstatCheckF:TOstatCheckF=nil;

implementation

uses MainU, DataModuleU, DiagnosticRepairU;

{$R *.dfm}

procedure ShowOstatCheckF;
 begin
  try
   if OstatCheckF=nil then OstatCheckF:=TOstatCheckF.Create(nil);
   Application.ProcessMessages;
   OstatCheckF.ShowModal;
  except
   OstatCheckF:=nil;
   MainF.MessBox(ER_CR_FORM);
  end;
 end;

procedure TOstatCheckF.FormCreate(Sender: TObject);
 begin
  FIsOstat:=True;
  FIsUpdated:=False;
  Caption:=MFC;
  DBGrid1.DataSource.OnDataChange:=DSrc1DataChange;
 end;

procedure TOstatCheckF.BitBtn2lick(Sender: TObject);
 begin
  Close;
 end;

procedure TOstatCheckF.FormActivate(Sender: TObject);
 begin
  BitBtn1.SetFocus;
  FIsUpdated:=False;
 end;

procedure TOstatCheckF.PrepareSQL;
var sm,sm1,sm2:String;
 begin
(*
  if CheckBox2.Checked then
   begin
    sm:='kol*cena';
    sm1:='ostat_beg*cena_beg';
    sm2:='ostat*cena';
   end else begin
             sm:='kol';
             sm1:='ostat_beg';
             sm2:='ostat';
            end;
  if DM.qrOstChk.Active then DM.qrOstChk.Close;
  DM.qrOstChk.SQL.Clear;

  DM.qrOstChk.SQL.Add('select art_code,kod_name,art_name,type_tov,f_nds,names,ostat,cena,ostat*cena as summ,IsNull('+sm1+',0)-IsNull((select Sum('+sm+') as Summa from ArhCheks where kod_name=c.kod_name group by Kod_Name),0) ');
  DM.qrOstChk.SQL.Add('                                 +IsNull((select Sum('+sm+') as Summa from Moves where kod_name=c.kod_name and debcrd=1 group by Kod_Name),0)                   ');
  DM.qrOstChk.SQL.Add('                                 -IsNull((select Sum('+sm+') as Summa from Moves where kod_name=c.kod_name and debcrd=2 group by Kod_Name),0)                   ');

  if CheckBox1.Checked then
   DM.qrOstChk.SQL.Add('                                 -IsNull((select Sum('+sm+') as Summa from Chek where kod_name=c.kod_name group by Kod_Name),0)                                ');
  DM.qrOstChk.SQL.Add('                                 -IsNull((select Sum('+sm+') as Summa from Reserve where kod_name=c.kod_name group by Kod_Name),0)                              ');
  DM.qrOstChk.SQL.Add('                                                                                                                                                             ');
  DM.qrOstChk.SQL.Add('as ostat_korr                                                                                                                                                ');
  DM.qrOstChk.SQL.Add('from SprTov c (nolock)                                                                                                                                       ');
  DM.qrOstChk.SQL.Add('where '+sm2+'<>IsNull('+sm1+',0) -IsNull((select Sum('+sm+') as Summa from ArhCheks where kod_name=c.kod_name group by Kod_Name),0)                             ');
  DM.qrOstChk.SQL.Add('                                 +IsNull((select Sum('+sm+') as Summa from Moves where kod_name=c.kod_name and debcrd=1 group by Kod_Name),0)                   ');
  DM.qrOstChk.SQL.Add('                                 -IsNull((select Sum('+sm+') as Summa from Moves where kod_name=c.kod_name and debcrd=2 group by Kod_Name),0)                   ');

  if CheckBox1.Checked then
   DM.qrOstChk.SQL.Add('                                 -IsNull((select Sum('+sm+') as Summa from Chek where kod_name=c.kod_name group by Kod_Name),0)                                ');

  DM.qrOstChk.SQL.Add('                                 -IsNull((select Sum('+sm+') as Summa from Reserve where kod_name=c.kod_name group by Kod_Name),0)                              ');
*)
  if DM.qrOstChk.Active then DM.qrOstChk.Close;
  DM.qrOstChk.SQL.Clear;

  DM.qrOstChk.SQL.Add(' declare @errmsg1234567890_23Qwerty_987654 varchar(max) ');
  DM.qrOstChk.SQL.Add(' begin tran ');
  DM.qrOstChk.SQL.Add(' begin try  ');

  DM.qrOstChk.SQL.Add(' declare @i int ');
  DM.qrOstChk.SQL.Add(' select @i=1 from SprTov with (TABLOCKX HOLDLOCK) where 0=1 ');
  DM.qrOstChk.SQL.Add(' select @i=1 from rTovar with (TABLOCKX HOLDLOCK) where 0=1 ');
  DM.qrOstChk.SQL.Add(' select @i=1 from rReoc with (TABLOCKX HOLDLOCK) where 0=1  ');
  DM.qrOstChk.SQL.Add(' select @i=1 from jMoves with (TABLOCKX HOLDLOCK) where 0=1 ');
  DM.qrOstChk.SQL.Add(' select @i=1 from ArhCheks with (TABLOCKX HOLDLOCK) where 0=1 ');


  if CheckBox2.Checked then
   begin
    if CheckBox1.Checked then sm:='-IsNull(b.summ,0)' else sm:='';
    DM.qrOstChk.SQL.Add('select s.art_code,s.kod_name,s.art_name,s.type_tov,s.f_nds,s.names,s.ostat,s.cena,s.ostat*s.cena as summ,IsNull(s.cena_beg*s.ostat_beg,0)-IsNull(a.summ,0)+IsNull(m.summ,0)'+sm+'-IsNull(r.summ,0) as ostat_korr ');
    DM.qrOstChk.SQL.Add('from SprTov s ');
    DM.qrOstChk.SQL.Add('      left join ');
    DM.qrOstChk.SQL.Add('     (select kod_name,Sum(case when debcrd=1 then cena*kol else -kol*cena end) as summ from Moves group by kod_name) m on s.kod_name=m.kod_name ');
    DM.qrOstChk.SQL.Add('      left join ');
    DM.qrOstChk.SQL.Add('     (select kod_name,Sum(cena*kol) as summ from ArhCheks group by kod_name) a on s.kod_name=a.kod_name ');
    if CheckBox1.Checked then
     begin
      DM.qrOstChk.SQL.Add('      left join ');
      DM.qrOstChk.SQL.Add('     (select kod_name,Sum(cena*kol) as summ from Chek group by kod_name) b on s.kod_name=b.kod_name ');
     end;
    DM.qrOstChk.SQL.Add('      left join ');
    DM.qrOstChk.SQL.Add('     (select kod_name,Sum(cena*kol) as summ from Reserve group by kod_name) r on s.kod_name=r.kod_name ');
    DM.qrOstChk.SQL.Add('where s.art_code not in (3,4,5,6) and s.cena>0 and s.ostat*s.cena<>IsNull(s.cena_beg*s.ostat_beg,0)-IsNull(a.summ,0)+IsNull(m.summ,0)'+sm+'-IsNull(r.summ,0) ');
    DM.qrOstChk.SQL.Add('order by s.names ');
   end else begin
             if CheckBox1.Checked then sm:='-IsNull(b.kol,0)' else sm:='';
             DM.qrOstChk.SQL.Add('select s.art_code,s.kod_name,s.art_name,s.type_tov,s.f_nds,s.names,s.ostat,s.cena,s.ostat*s.cena as summ,IsNull(s.ostat_beg,0)-IsNull(a.kol,0)+IsNull(m.kol,0)'+sm+'-IsNull(r.kol,0) as ostat_korr ');
             DM.qrOstChk.SQL.Add('from SprTov s ');
             DM.qrOstChk.SQL.Add('      left join ');
             DM.qrOstChk.SQL.Add('     (select kod_name,Sum(case when debcrd=1 then kol else -kol end) as kol from Moves group by kod_name) m on s.kod_name=m.kod_name ');
             DM.qrOstChk.SQL.Add('      left join ');
             DM.qrOstChk.SQL.Add('     (select kod_name,Sum(kol) as kol from ArhCheks group by kod_name) a on s.kod_name=a.kod_name ');
             if CheckBox1.Checked then
              begin
               DM.qrOstChk.SQL.Add('      left join ');
               DM.qrOstChk.SQL.Add('     (select kod_name,Sum(kol) as kol from Chek group by kod_name) b on s.kod_name=b.kod_name ');
              end;
             DM.qrOstChk.SQL.Add('      left join ');
             DM.qrOstChk.SQL.Add('     (select kod_name,Sum(kol) as kol from Reserve group by kod_name) r on s.kod_name=r.kod_name ');
             DM.qrOstChk.SQL.Add('where s.art_code not in (3,4,5,6) and s.cena>0 and s.ostat<>IsNull(s.ostat_beg,0)-IsNull(a.kol,0)+IsNull(m.kol,0)'+sm+'-IsNull(r.kol,0) ');
             DM.qrOstChk.SQL.Add('order by s.names ');
            end;
  DM.qrOstChk.SQL.Add(' commit tran ');
  DM.qrOstChk.SQL.Add(' end try     ');
  DM.qrOstChk.SQL.Add(' begin catch ');
  DM.qrOstChk.SQL.Add('  select @errmsg1234567890_23Qwerty_987654=error_message() ');
  DM.qrOstChk.SQL.Add('  raiserror(@errmsg1234567890_23Qwerty_987654, 16, 1)      ');
  DM.qrOstChk.SQL.Add('  rollback ');
  DM.qrOstChk.SQL.Add(' end catch ');
 end;

procedure TOstatCheckF.ShowKol;
var Art_Code:Integer;
 begin
  try
   Label1.Caption:='';
   Label2.Caption:='';
   if DM.qrOstChk.Active=False then raise EAbort.Create('');
   Art_Code:=DM.qrOstChk.FieldByName('Art_code').AsInteger;
   if Art_Code<=0 then raise EAbort.Create('');
   if OpenADOSQL(DM.Qr,'select Sum(ostat) as Sm from SprTov where art_code='+IntToStr(Art_Code))>0 then
    begin
     Label1.Caption:=IntToStr(Art_Code)+' '+DM.qrOstChk.FieldByName('Names').AsString;
     Label2.Caption:=DM.Qr.FieldByName('Sm').AsString;
    end;
  except
   Label1.Caption:='';
   Label2.Caption:='';
  end;
 end;

procedure TOstatCheckF.BitBtn1Click(Sender:TObject);
var T:TTime;
 begin
  T:=Time;
  try
   try
    PrepareSQL;
    DM.ADOCo.BeginTrans;
    DM.qrOstChk.Open;
    DM.qrOstChk.SQL.SaveToFile('C:\Log\OstCh.txt');
    DM.ADOCo.CommitTrans;
    FIsOstat:=Not CheckBox2.Checked;
   except
    DM.ADOCo.RollBackTrans;
    MainF.MessBox('Ошибка расчета!');
   end;
  finally
   ShowKol;
  end;
  MainF.MessBox('Расчет завершен. Затрачено времени: '+TimeToStr(Abs(T-Time)),MB_OK);
 end;

// Кнопка "Поставить позицию на остатки"
procedure TOstatCheckF.BitBtn3Click(Sender: TObject);
var Rasn:Integer;
    ss:String;
 begin
  if Not (MainF.IsPermit([],P_ALERT)) then Exit;
  if Not (IsOstat) then begin MainF.MessBox('В режиме расчета по суммам, нельзя корректировать справочник товаров!'); Exit; end;
  if DM.qrOstChk.IsEmpty then begin MainF.MessBox('Расхождений нет!'); Exit; end;

  Rasn:=DM.qrOstChk.FieldByName('ostat').AsInteger-DM.qrOstChk.FieldByName('ostat_korr').AsInteger;
  if Rasn>=0 then ss:='Будет снято с остатков позиций: '+IntToStr(Abs(Rasn))
             else ss:='Будет поставлено на остатки позиций: '+IntToStr(Abs(Rasn));
  if MainF.MessBox(ss,52)<>ID_YES then Exit;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='update sprtov set ostat=ostat-('+IntToStr(Rasn)+') '
                   +' where kod_name='+DM.qrOstChk.FieldByName('kod_name').AsString;
   DM.Qr.ExecSQL;
   FIsUpdated:=True;
  except
   MainF.MessBox('Ошибка доступа к справочнику товаров!');
  end;
  BitBtn1Click(nil);
 end; {BitBtn3Click}

// Кнопка "Поставить все позиции на остатки"
procedure TOstatCheckF.BitBtn2Click(Sender: TObject);
var i:Integer;
    ErMess:String;
 begin
  if Not (MainF.IsPermit([],P_ALERT)) then Exit;
  if Not (IsOstat) then begin MainF.MessBox('В режиме расчета по суммам, нельзя корректировать справочник товаров!'); Exit; end;
  if DM.qrOstChk.IsEmpty then begin MainF.MessBox('Расхождений нет!'); Exit; end;
  if MainF.MessBox('Вы действительно хотите записать расчетные остатки?',52)<>ID_YES then Exit;
  ErMess:='';
  try
   for i:=1 to DM.qrOstChk.RecordCount do
    begin
     if i=1 then DM.qrOstChk.First else DM.qrOstChk.Next;
     try
      DM.Qr.Close;
      DM.Qr.SQL.Text:='update sprtov set ostat=ostat-('+IntToStr(DM.qrOstChk.FieldByName('ostat').AsInteger-DM.qrOstChk.FieldByName('ostat_korr').AsInteger)+') '
                      +' where kod_name='+DM.qrOstChk.FieldByName('kod_name').AsString;
      DM.Qr.ExecSQL;
      FIsUpdated:=True;
     except
      ErMess:='Ошибка доступа к спрaвочнику товаров!';
     end;
    end; 
  finally
   BitBtn1Click(nil);
   if ErMess<>'' then MainF.MessBox(ErMess);
  end;
 end; {BitBtn2Click}

// Кнопка Скорректировать минус
procedure TOstatCheckF.BitBtn5Click(Sender: TObject);
 begin
  if Not (MainF.IsPermit([],P_ALERT)) then Exit;
  if Not (IsOstat) then begin MainF.MessBox('В режиме расчета по суммам, нельзя корректировать справочник товаров!'); Exit; end;
  if DM.qrOstChk.IsEmpty then begin MainF.MessBox('Расхождений нет!'); Exit; end;
  if (DM.qrOstChk.FieldByName('ostat_korr').AsInteger>=0) and
     (DM.qrOstChk.FieldByName('ostat').AsInteger>=0) then begin MainF.MessBox('В данной строке минусов нет!'); Exit; end;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('declare @kdn int                                                                                 ');
   DM.Qr.SQL.Add('declare @kol int                                                                                 ');
   DM.Qr.SQL.Add('                                                                                                 ');
   DM.Qr.SQL.Add('select @kdn='+DM.qrOstChk.FieldByName('kod_name').AsString                                        );
   DM.Qr.SQL.Add('                                                                                                 ');
   DM.Qr.SQL.Add('select @kol='+IntToStr(Abs(DM.qrOstChk.FieldByName('ostat').AsInteger-DM.qrOstChk.FieldByName('ostat_korr').AsInteger)) );
   DM.Qr.SQL.Add('                                                                                                 ');
   DM.Qr.SQL.Add('declare @art int                                                                                 ');
   DM.Qr.SQL.Add('declare @mink int                                                                                ');
   DM.Qr.SQL.Add('declare @rid int                                                                                 ');
   DM.Qr.SQL.Add('                                                                                                 ');
   DM.Qr.SQL.Add('select @art=IsNull(Max(art_code),-1) from SprTov where kod_name=@kdn                             ');
   DM.Qr.SQL.Add('if @art<>-1                                                                                      ');
   DM.Qr.SQL.Add(' begin                                                                                           ');
   DM.Qr.SQL.Add('  select @mink=IsNull(Min(Kod_Name),-1) from SprTov where art_code=@art and ostat>=@kol          ');
   DM.Qr.SQL.Add('  select @rid=IsNull(Max(row_id),-1) from ArhCheks where kod_name=@kdn and kol=@kol              ');
   DM.Qr.SQL.Add(' if (@mink<>-1 ) and (@rid<>-1)                                                                  ');
   DM.Qr.SQL.Add('   begin                                                                                         ');
   DM.Qr.SQL.Add('    begin tran                                                                                   ');
   DM.Qr.SQL.Add('     update SprTov set Ostat=Ostat-@kol where kod_name=@mink                                     ');
   DM.Qr.SQL.Add('     update ArhCheks set kod_name=@mink where row_id=@rid                                        ');
   DM.Qr.SQL.Add('     select 0 as res                                                                             ');
   DM.Qr.SQL.Add('    commit tran                                                                                  ');
   DM.Qr.SQL.Add('   end else select @mink as res                                                                  ');
   DM.Qr.SQL.Add(' end else select -1 as res                                                                       ');
   DM.Qr.Open;
   if DM.Qr.FieldByName('res').AsInteger<>0 then
    MainF.MessBox('Не удалось скорректировать минус, возможно недостатоно количества товара!');
  except
   MainF.MessBox('Ошибка доступа к справочнику товаров!');
  end;
  BitBtn1Click(nil);
 end; {BitBtn5Click}

procedure TOstatCheckF.BitBtn4Click(Sender: TObject);
 begin
  // TODO: реализовать работу с кодами
  if MainF.IsPermit([R_ADMIN],P_ALERT) then
   begin
   end;
 end;

procedure TOstatCheckF.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  if MainF.Design=False then
   if IsUpdated then MainF.FilterSklad;
 end;

procedure TOstatCheckF.DSrc1DataChange(Sender: TObject; Field: TField);
 begin
  ShowKol;
 end;

procedure TOstatCheckF.BitBtn6Click(Sender: TObject);
 begin
  Close;
 end;


procedure TOstatCheckF.BitBtn7Click(Sender: TObject);
 begin
  if DM.qrOstChk.IsEmpty then Exit;
  if Not (MainF.IsPermit([],P_ALERT)) then Exit;

  if Silent.Checked then
   begin
    DM.QrDiagn.ConnectionString:=Prm.ConStr;
    DM.QrDiagn.Close;
    DM.QrDiagn.SQL.Text:='exec spy_diagnosticrepair '+DM.qrOstChk.FieldByName('kod_name').AsString+', ''K'', 0';
    DM.QrDiagn.Open;
    ShowMessage('Все');
    Exit;
   end;

  try
   DiagnosticRepairF:=TDiagnosticRepairF.Create(Self);
   try
    DiagnosticRepairF.ShowModal;
   finally
    DiagnosticRepairF.Free;
   end;
  except
   on E:Exception do MainF.MessBox(E.Message);
  end;

 end;

procedure TOstatCheckF.N1Click(Sender: TObject);
 begin
  if DM.qrOstChk.IsEmpty then Exit;
  MainF.ShowMovTov(DM.qrOstChk.FieldByName('Art_Code').AsInteger,'Движение товара - '+DM.qrOstChk.FieldByName('Names').AsString);
 end;

Initialization

Finalization

 if OstatCheckF<>nil then OstatCheckF.Free;

end.
