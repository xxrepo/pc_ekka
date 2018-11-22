unit ViewNaklU;

interface

uses Forms, Menus, DBCtrls, Controls, StdCtrls, Graphics, ExtCtrls, Grids,
     DBGrids, Buttons, ComCtrls, Classes, DB, Windows, SysUtils, PrintReport,
     Util, ShowTextU, ADODB, Dialogs, Math, ShareU;

type

  TViewNaklF = class(TForm)
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btDel: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    pmPrnReg: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    BitBtn8: TBitBtn;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Label9: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    BitBtn9: TBitBtn;
    PopupMenu1: TPopupMenu;
    pm11: TMenuItem;
    bbCloseBox: TBitBtn;
    BitBtn10: TBitBtn;
    imChp: TImage;
    Label10: TLabel;
    pmCancel: TPopupMenu;
    N3: TMenuItem;
    bbVzr: TBitBtn;
    BitBtn11: TBitBtn;
    CheckBox4: TCheckBox;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    rbPr: TRadioButton;
    rbVz: TRadioButton;
    BitBtn5: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    CheckBox1: TCheckBox;
    Panel8: TPanel;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label6: TLabel;
    DBText4: TDBText;
    Label11: TLabel;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    BitBtn15: TBitBtn;
    Label7: TLabel;
    DBText5: TDBText;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    lblPostavschik: TLabel;
    lblNaklNomber: TLabel;
    lblNaklDate: TLabel;
    aTmp: TADOQuery;
    pn2: TPanel;
    Label16: TLabel;
    N4: TMenuItem;
    N5: TMenuItem;
    CheckBox5: TCheckBox;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    pmPrintAkt: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);

    procedure DSrc1DataChange(Sender:TObject; Field:TField);

    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure rbPrClick(Sender: TObject);
    procedure rbVzClick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure pm11Click(Sender: TObject);
    procedure bbCloseBoxClick(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure bbVzrClick(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ReturnList(frm: TForm; qr: TADOQuery);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);

  private

    P:Byte;
    FSr:String;

    function  CheckMarked:Boolean;

    procedure DrawGridCheckBox(Canvas:TCanvas; Rect:TRect; Checked:Boolean);
    procedure SelectNakls(ColName:String; All:Boolean; Value:Boolean);
    procedure PrintCen(Param:Byte);
    procedure NaklList(Refresh:Integer);
    procedure ShowNakl;
    procedure EnterKol(AC:Integer; P:Byte);

    procedure IncomingNakl;

    procedure NaklAfterScroll(DataSet: TDataSet);

    procedure PrintActOfNonConformity;
    procedure PrintAkt(NumDriver:Byte);

  public

  end;

var
  ViewNaklF:TViewNaklF;
  sp_Temp: TADOStoredProc;

implementation

uses
  MainU, DataModuleU, PrintMarkBoxU, RegPredstU, EnterKolScanU,
  VozrPartU, ReturnToProviderU, ListBackPartU, ScanPosInfoU;

{$R *.dfm}

procedure TViewNaklF.ReturnList(frm: TForm; qr: TADOQuery);
begin
    with (frm as TForm) do
    begin
      with (qr as TADOQuery) do
      begin
        SQL.Clear;
        //SQL.Add('declare @iddoc int set @iddoc = :iddoc');
        SQL.Add('declare @iddoc int set @iddoc = ' + DM.spY_NaklList.FieldByName('iddoc').AsString);
        SQL.Add('select');
        SQL.Add('  j.iddoc, j.nn_nakl, j.date_nakl, s.art_code,');
        SQL.Add('  case j.F_NDS when 1 then ''20%'' when 2 then ''7%'' end as NDS, j.f_nds,');
        SQL.Add('  convert(uniqueidentifier,j.id_postav) as id_postav, j.nn_prih, j.dt_prih,');
        SQL.Add('  apteka_net.dbo.GetNamesUpak(p.names) as Names, p.koef, p.manufacturer,');
        SQL.Add('  sum(r.kol) as kol, max(s.CENA) as Cena, max(s.CenaZakup) as CenaZakup,');
        SQL.Add('  r.pr_vz_post, post.descr, post.adres, i.numseriya, i.SrokGodn,');
        SQL.Add('  vz.descr as vz_descr, r.VzDescr,');
        SQL.Add('  j.id_AgrKontrag, kontr.Address as kontrAddress');
        SQL.Add('');
        SQL.Add('from');
        SQL.Add('  jmoves j with (nolock)');
        SQL.Add('  left join rtovar r with (nolock) on r.iddoc=j.iddoc');
        SQL.Add('  inner join sprtov s with (nolock) on s.kod_name=r.kod_name');
        SQL.Add('  left join PList p with (nolock) on p.art_code=s.art_code');
        SQL.Add('  left join serii i with (nolock) on i.id_part8=s.id_part8');
        SQL.Add('  left join SPRPOSTAV post with (nolock) on post.id=j.id_postav');
        SQL.Add('  left join SPRPRVOZR vz with (nolock) on vz.id = r.pr_vz_post and not r.pr_vz_post is null');
        SQL.Add('  left join SprAgrKontrag kontr with (nolock) on kontr.ID = j.id_AgrKontrag');
        SQL.Add('');
        SQL.Add('where');
        SQL.Add('  j.iddoc = @iddoc');
        SQL.Add('group by');
        SQL.Add('  j.iddoc, j.nn_nakl, j.date_nakl, s.art_code, j.f_nds, j.id_postav, j.nn_prih,');
        SQL.Add('  j.dt_prih, p.names, p.koef, p.manufacturer, r.pr_vz_post, post.descr,');
        SQL.Add('  post.adres, i.numseriya, i.SrokGodn, vz.descr, r.VzDescr,');
        SQL.Add('  j.id_AgrKontrag, kontr.Address');
        SQL.Add('');
        SQL.Add('order by');
        SQL.Add('  j.iddoc, j.nn_nakl');
        SQL.Add('');
        //sql.SaveToFile('1234');
        //Parameters.Clear;
        //Parameters.CreateParameter('iddoc',ftInteger,pdInput,10,DM.spY_NaklList.FieldByName('iddoc').Value);
        Open;
      end;
    end;
end;

procedure TViewNaklF.IncomingNakl;
begin
  with ADOQuery2 do
  begin
    SQL.Clear;
    SQL.Add('declare @f_nds smallint set @f_nds=convert(int,:f_nds)');
    SQL.Add('declare @idpostav uniqueidentifier set @idpostav=convert(binary(16),:idpostav)');
    SQL.Add('declare @nn_prih varchar(50) set @nn_prih=:nn_prih');
    SQL.Add('declare @dt_prih datetime set @dt_prih=convert(datetime,:dt_prih)');
    SQL.Add('declare @cena numeric(8,2) set @cena=convert(numeric(8,2),:cena)');
    SQL.Add('declare @art_code int set @art_code = convert(int,:art_code)');
    SQL.Add('select');
//    SQL.Add('  j.type_nakl, s.art_code, j.F_NDS, j.id_postav, j.nn_prih, j.dt_prih, j.iddoc, sum(r.kol) as kol, max(s.CenaZakup) as CenaZakup, max(s.Cena) as Cena, j.sum_prih');
    SQL.Add('  j.type_nakl, s.art_code, j.F_NDS, j.id_postav, j.nn_prih, j.dt_prih, j.iddoc, isnull(sum(r.kol),0) as kol, max(s.CenaZakup) as CenaZakup, max(s.Cena) as Cena, j.sum_prih');
    SQL.Add('from');
    SQL.Add('  jmoves j with (nolock)');
    SQL.Add('  left join rtovar r with (nolock) on convert(int,r.iddoc) = convert(int,j.iddoc)');
    SQL.Add('  inner join sprtov s with (nolock) on convert(int,s.kod_name) = convert(int,r.kod_name)');
    SQL.Add('where');
    SQL.Add('  convert(int,j.type_nakl) in (1)');
    SQL.Add('  and convert(int,s.art_code) = convert(int,@art_code)');
    SQL.Add('  and j.F_NDS=@f_nds');
    SQL.Add('  and convert(binary(16),j.id_postav)=convert(binary(16),@idpostav)');
    SQL.Add('  and j.nn_prih=@nn_prih');
    SQL.Add('  and j.dt_prih=@dt_prih');
    SQL.Add('  and s.Cena=@cena');
    SQL.Add('group by');
    SQL.Add('  j.type_nakl, s.art_code, j.F_NDS, j.id_postav, j.nn_prih, j.dt_prih, j.iddoc, j.sum_prih');
    Parameters.Clear;
    Parameters.CreateParameter('f_nds',ftSmallint,pdInput,5,ADOQuery1.FieldByName('f_nds').Value);
    Parameters.CreateParameter('idpostav',ftGuid,pdInput,0,ADOQuery1.FieldByName('id_postav').Value);
    Parameters.CreateParameter('nn_prih',ftString,pdInput,50,ADOQuery1.FieldByName('nn_prih').Value);
    Parameters.CreateParameter('dt_prih',ftDateTime,pdInput,23,ADOQuery1.FieldByName('dt_prih').Value);
    Parameters.CreateParameter('cena',ftFloat,pdInput,11,ADOQuery1.FieldByName('cena').Value);
    Parameters.CreateParameter('art_code',ftInteger,pdInput,10,ADOQuery1.FieldByName('art_code').Value);
    Open;
  end;
end;

procedure TViewNaklF.FormCreate(Sender: TObject);
begin
  sp_Temp:=TADOStoredProc.Create(self);
  sp_Temp.AfterScroll:=DM.spY_NaklList.AfterScroll;
  DM.spY_NaklList.AfterScroll:=NaklAfterScroll;

  P:=0;
  Caption:=MFC;
  dtStart.Date:=Date;
  dtEnd.Date:=Date;
  DBGrid1.DataSource.OnDataChange:=DSrc1DataChange;
  btDel.Enabled:=MainF.IsPermit([],P_SILENT);

  BitBtn5Click(BitBtn5);
  FSr:='';
end;

procedure TViewNaklF.BitBtn4Click(Sender:TObject);
begin
  Close;
end;

procedure TViewNaklF.NaklList(Refresh: Integer);
var
  tn:String;
  ID:Integer;
  ref: integer;
begin
  ref:=Refresh;
  try
    BitBtn3.Enabled:=rbVz.Checked;
    BitBtn7.Enabled:=rbVz.Checked;
    Label6.Visible:=rbVz.Checked;
    Label7.Visible:=rbVz.Checked;
    DBText4.Visible:=rbVz.Checked;
    DBText5.Visible:=rbVz.Checked;
    bbCloseBox.Enabled:=rbVz.Checked;

    if Prm.AptekaID=138 then
    begin
      bbVzr.Visible:=True;
      bbVzr.Enabled:=rbPr.Checked;
    end;

    if rbPr.Checked then
      tn:=IntToStr(DC_INCOME)
    else
      tn:=IntToStr(DC_BACK);

    if DM.spY_NaklList.Active then ID:=DM.spY_NaklList.FieldByName('iddoc').AsInteger;
    DM.spY_NaklList.Close;
    with DM.spY_NaklList do
    begin
      Parameters.Clear;
      Parameters.CreateParameter('@dt1',ftDate,pdInput,23,StrToDate(DateToStr(dtStart.Date)));
      Parameters.CreateParameter('@dt2',ftDate,pdInput,23,StrToDate(DateToStr(dtEnd.Date+1)));
      Parameters.CreateParameter('@tn',ftInteger,pdInput,10,tn);
      Parameters.CreateParameter('@piduser',ftInteger,pdInput,10,Prm.UserID);
      Parameters.CreateParameter('@refresh',ftInteger,pdInput,10,ref);
      if CheckBox4.Checked then //если накладные от поставщика
      begin
        if rbVz.Checked then //если накладные от поставщика возвратные
          Parameters.CreateParameter('@p_only_vz_provider',ftSmallint,pdInput,1,1)
        else  //иначе накладные от поставщика приходные
          Parameters.CreateParameter('@p_only_vz_provider',ftSmallint,pdInput,1,2);
      end
      else  //все накладные приходные и возвратные
        Parameters.CreateParameter('@p_only_vz_provider',ftSmallint,pdInput,1,0)
    end;
    DBGrid1.DataSource.OnDataChange:=nil;
    DM.spY_NaklList.Open;
    DBGrid1.DataSource.OnDataChange:=DSrc1DataChange;
    DM.spY_NaklList.Locate('iddoc',id,[]);
  except
    on E:Exception do MainF.MessBox('Ошибка формирования списка накладных: '+E.Message);
  end;
end;

procedure TViewNaklF.BitBtn5Click(Sender:TObject);
begin
  NaklList(0);
  ShowNakl;
//  if DM.spY_NaklList.RecordCount<=0 then BitBtn11.Enabled:=false;
  if DM.spY_NaklList.IsEmpty then
  begin
    BitBtn11.Enabled:=false;
    lblPostavschik.Caption:='';
    lblNaklNomber.Caption:='';
    lblNaklDate.Caption:='';
  end;
end;

procedure TViewNaklF.DSrc1DataChange(Sender:TObject; Field:TField);
begin
  ShowNakl;
end;

procedure TViewNaklF.ShowNakl;
var
  AC:Integer;
begin

  AC:=-1;
  if DM.qrShowNakl.Active then AC:=DM.qrShowNakl.FieldByName('Art_code').AsInteger;
  DM.qrShowNakl.Close;
  if DM.spY_NaklList.IsEmpty then Exit;

  DM.qrShowNakl.SQL.Text:='exec spY_ShowNakl :iddoc, :obl';
  DM.qrShowNakl.Parameters.ParamByName('iddoc').Value:=DM.spY_NaklList.FieldByName('iddoc').AsInteger;
  DM.qrShowNakl.Parameters.ParamByName('obl').Value:=DM.spY_NaklList.FieldByName('obl').AsInteger;
  DM.qrShowNakl.Open;
  DM.qrShowNakl.Locate('Art_Code',AC,[]);

  if MainF.Design=False then
  begin
    if DM.qrShowNakl.FieldByName('priznak').AsInteger = 27 then
    begin
      BitBtn1.Enabled:=false;
      BitBtn2.Enabled:=false;
      BitBtn3.Enabled:=false;
      BitBtn7.Enabled:=false;
      BitBtn6.Enabled:=false;
      BitBtn8.Enabled:=false;
      BitBtn9.Enabled:=false;
      BitBtn10.Enabled:=false;
      bbCloseBox.Enabled:=false;
      bbVzr.Enabled:=false;
    end
    else
    begin
      BitBtn1.Enabled:=true;
      BitBtn2.Enabled:=true;
      BitBtn3.Enabled:=true;
      BitBtn7.Enabled:=true;
      BitBtn6.Enabled:=true;
      BitBtn8.Enabled:=true;
      BitBtn9.Enabled:=true;
      BitBtn10.Enabled:=true;
      bbCloseBox.Enabled:=true;
      bbVzr.Enabled:=true;
    end;
  end;

  if DM.spY_NaklList.FieldByName('DeliveryDate').AsDateTime=0 then Label11.Visible:=False else
   begin
    Label11.Caption:='Дата доставки посылки: '+DM.spY_NaklList.FieldByName('DeliveryDate').AsString;
    Label11.Visible:=True;
   end;
end;

procedure TViewNaklF.BitBtn2Click(Sender:TObject);
var dx,dy:Integer;
    Com:TControl;
begin
  if Sender=nil then Exit;
  dx:=Left+3; dy:=Top+TControl(Sender).Height+23;
  Com:=TControl(Sender);
  P:=Com.Tag;
  While Com<>Self do
  begin
    Inc(dx,Com.Left);
    Inc(dy,Com.Top);
    Com:=Com.Parent;
  end;
  pmPrnReg.Popup(dx,dy);
end;

procedure TViewNaklF.PrintCen(Param:Byte);
var Skd:Integer;
    ss,ss1:String;
begin
  try
   if DM.qrShowNakl.IsEmpty then Exit;

   ss:=''; ss1:=' 1 as koef,';
   if CheckBox3.Checked then
    begin
     ss:='*dbo.GetKoef(b.art_code)';
     ss1:=' dbo.GetKoef(b.art_code) as koef,';
    end;
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   Case P Of
    0:begin
       DM.Qr.SQL.Add('select b.Art_code,(case when Max(b.f_nds)>2 then IsNull((select top 1 s.Names from SprCHPNames s where s.art_code=b.art_code),b.Names) else b.Names end) as Names, ');
       DM.Qr.SQL.Add('IsNull((select Max(ss.cena) from SprTov ss (nolock) where ostat>0 and ss.art_code=b.art_code),Max(b.cena))'+ss+' as Cena, '+ss1);

       DM.Qr.SQL.Add('IsNull((select Max(ean13) from SprEan where art_code=b.art_code),'''') as Ean13,c.P1,c.P2,c.P3,');

       if MainF.MaxSkd>0 then
        DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where type_skd=4 and art_code=b.art_code),IsNull((select Max(skd) from Skd where type_skd=1),0)) as Skd, ') else
       if MainF.MaxSkd<=-3 then
        DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where skd<3 and type_skd=4 and art_code=b.art_code),'+IntToStr(Abs(Round(MainF.MaxSkd)))+') as Skd, ')
       else
        DM.Qr.SQL.Add('0 as Skd, ');


       DM.Qr.SQL.Add('IsNull(Max(s.cenap'+ss+'),0) as CenaP, ');
       DM.Qr.SQL.Add('dbo.GetCenaOpt(b.art_code)'+ss+' as CenaOpt,Max(l.art_code) as Skd3  ');
       DM.Qr.SQL.Add('from JMoves j, rTovar a, SprTovar s left join SkdLimit0 l on s.art_code=l.art_code, SprTov b left join Inform..SprReg c on b.art_code=c.art_code');
       DM.Qr.SQL.Add('where j.iddoc=a.iddoc and b.art_code=s.art_code and a.kod_name=b.kod_name and ');
       DM.Qr.SQL.Add('      j.date_nakl='''+FormatDateTime('yyyy-mm-dd',DBText2.Field.AsDateTime)+' 00:00:00'' and');
       DM.Qr.SQL.Add('      j.nn_nakl='''+DBText3.Field.AsString+''' ');

       if CheckBox5.Checked then
        DM.Qr.SQL.Add(' and (c.P2>0 or IsNull(c.L2,'''')<>'''') ');
      end;
    1:begin
       DM.Qr.SQL.Add('if Object_ID(N''tempdb..#tmps'') is not null drop table #tmps');
       DM.Qr.SQL.Add('select b.art_code,Max(j.time_nakl) as time_nakl,(case when Max(b.f_nds)>2 then IsNull((select top 1 s.Names from SprCHPNames s where s.art_code=b.art_code),b.Names) else b.Names end) as Names,b.f_nds,Sum(a.kol) as kol,');
       DM.Qr.SQL.Add('IsNull((select Max(ss.cena) from SprTov ss (nolock) where ostat>0 and ss.art_code=b.art_code),Max(b.cena)) as cena, ');
       DM.Qr.SQL.Add('convert(int,0) as ostat  ');
       DM.Qr.SQL.Add('into #tmps                                                                         ');
       DM.Qr.SQL.Add('from rTovar a, SprTov b, Jmoves j                                                   ');
       DM.Qr.SQL.Add('where a.kod_name=b.kod_name and a.iddoc=j.iddoc and                               ');
       DM.Qr.SQL.Add('      j.date_nakl>='''+FormatDateTime('yyyy-mm-dd',DBText2.Field.AsDateTime)+' 00:00:00'' and ');
       DM.Qr.SQL.Add('      j.Type_Nakl=1 and j.reoc=0                                  ');
       DM.Qr.SQL.Add('group by b.art_code,b.names,b.f_nds                                         ');
       DM.Qr.SQL.Add('                                                                                   ');

       DM.Qr.SQL.Add('update #tmps set ostat= IsNull((select Sum(ostat) from SprTov s where s.art_code=#tmps.art_code ),0) ');
       DM.Qr.SQL.Add('                       +IsNull((select Sum(kol) from ArhCheks a, SprTov b where a.kod_name=b.kod_name and b.art_code=#tmps.art_code and a.date_chek>#tmps.time_nakl),0)  ');
       DM.Qr.SQL.Add('                       -IsNull((select Sum(a.kol) from rTovar a, SprTov b, JMoves j where j.Type_Nakl=1 and j.reoc=0 and j.iddoc=a.iddoc and a.kod_name=b.kod_name and b.art_code=#tmps.art_code and j.time_nakl>=#tmps.time_nakl),0)   ');
       DM.Qr.SQL.Add('                       +IsNull((select Sum(a.kol) from rTovar a, SprTov b, JMoves j where j.Type_Nakl=2 and j.reoc=0 and j.iddoc=a.iddoc and a.kod_name=b.kod_name and b.art_code=#tmps.art_code and j.time_nakl>=#tmps.time_nakl),0) ');

       DM.Qr.SQL.Add('select b.Art_code,b.Names,Max(b.Cena)'+ss+' as Cena,'+ss1+' IsNull(Max(s.CenaP),0)'+ss+' as CenaP, dbo.GetCenaOpt(b.art_code)'+ss+' as CenaOpt,Max(l.art_code) as Skd3,            ');

       if MainF.MaxSkd>0 then
        DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where type_skd=4 and art_code=b.art_code),IsNull((select Max(skd) from Skd where type_skd=1),0)) as Skd, ') else
       if MainF.MaxSkd<=-3 then
        DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where skd<3 and type_skd=4 and art_code=b.art_code),'+IntToStr(Abs(Round(MainF.MaxSkd)))+') as Skd, ')
       else
        DM.Qr.SQL.Add('0 as Skd, ');

       DM.Qr.SQL.Add('       IsNull((select Max(ean13) from SprEan where art_code=b.art_code),'''') as Ean13,c.P1,c.P2,c.P3');
       DM.Qr.SQL.Add(' from SprTovar s  left join SkdLimit0 l on s.art_code=l.art_code, #tmps b left join Inform..SprReg c on b.art_code=c.art_code                   ');
       DM.Qr.SQL.Add(' where s.art_code=b.art_code and b.ostat<=0 ');
       if CheckBox5.Checked then
        DM.Qr.SQL.Add(' and (c.P2>0 or IsNull(c.L2,'''')<>'''') ');
      end;
   end;
   DM.Qr.SQL.Add('group by b.Art_code,b.Names,c.P1,c.P2,c.P3');

   Case Param of
    1:DM.Qr.SQL.Add('order by b.Names');
    2:DM.Qr.SQL.Add('order by c.P1,c.P2,c.P3,b.Names');
   end;
   DM.Qr.Open;

   // if CheckBox2.Checked then PrintRep.PrintStiker else

   PrintCennikListExt(DM.Qr,W_CENNIK,CheckBox3.Checked,CheckBox2.Checked,False,Param);
  except
   on E:Exception do MainF.MessBox('Ошибка формирования списка ценников: '+E.Message);
  end;
end;

procedure TViewNaklF.DrawGridCheckBox(Canvas:TCanvas; Rect:TRect; Checked:boolean);
var DrawFlags:Integer;
begin
  Canvas.TextRect(Rect,Rect.Left+1,Rect.Top+1,' ');
  DrawFrameControl(Canvas.Handle, Rect, DFC_BUTTON, DFCS_BUTTONPUSH or DFCS_ADJUSTRECT);
  DrawFlags:=DFCS_BUTTONCHECK or DFCS_ADJUSTRECT;// DFCS_BUTTONCHECK
  if Checked then DrawFlags:=DrawFlags or DFCS_CHECKED;
  DrawFrameControl(Canvas.Handle,Rect,DFC_BUTTON,DrawFlags);
end;

procedure TViewNaklF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
    dR,sR,R:TRect;
    Pr,Kol,i,j:Integer;
    C,C1:TColor;
begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if Copy(db.DataSource.DataSet.FieldByName('NN_NAKL').AsString,2,3)='пр-' then db.Canvas.Font.Color:=$00858ECD else
  if DataCol=1 then
   begin
    Pr:=db.DataSource.DataSet.FieldByName('NumScan').AsInteger;
    Kol:=db.DataSource.DataSet.FieldByName('Cnt').AsInteger;
    if Pr>0 then
     begin
      if Kol=Pr then db.Canvas.Brush.Color:=clLime else
      if Pr<Kol then db.Canvas.Brush.Color:=clYellow
                else db.Canvas.Brush.Color:=$008080FF;
     end;

   end;

  if (DataCol=0) and (db.DataSource.DataSet.FieldByName('EANDriver').AsString<>'') then
   db.Canvas.Brush.Color:=$00C08000;

  if gdSelected in State then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if Column=db.Columns[2] then
   begin
    R.Left:=Rect.Left;
    R.Top:=Rect.Top;
    R.Right:=Rect.Right;
    R.Bottom:=Rect.Bottom+1;
    DrawGridCheckBox(db.Canvas,R,db.DataSource.DataSet.FieldByName('f').AsInteger=1);
   end;

  if (db.DataSource.DataSet.FieldByName('Marked').AsInteger=1) and (DataCol=0) then
   begin
    dr:=Rect;
    dr.Left:=dr.Left+2; dr.Top:=dr.Top+1;
    dr.Right:=dR.Left+imChp.Width; dr.Bottom:=dR.Top+imChp.Height;

    db.Canvas.FillRect(Rect);
    db.Canvas.TextOut(Rect.Left+imChp.Width+6, Rect.Top+1,db.DataSource.DataSet.FieldByName('Date_Nakl').AsString);

    C1:=imChp.Canvas.Pixels[0,0];
    C:=$00DFE2EC;
    for i:=0 to imChp.Width-1 do
     for j:=0 to imChp.Height-1 do
      if imChp.Canvas.Pixels[i,j]=C1 then imChp.Canvas.Pixels[i,j]:=C;
    sR.Left:=0; sR.Top:=0; sR.Right:=imChp.Width; sR.Bottom:=imChp.Height;
    db.Canvas.CopyRect(dR,imChp.Canvas,sR);
   end;
end;


procedure TViewNaklF.BitBtn1Click(Sender: TObject);
var
  IdBaseApteka: integer;
  F_NDS, Tn, It, Kol, i: integer;
  AptekaName, FirmName, S: string;
  NDS: Boolean;
  Tb: TTableObj;
{
  VzDescr, : String;
}
begin
  It:=0;
  Tb:=nil;
  if DM.spY_NaklList.IsEmpty then Exit;
  if DM.qrShowNakl.IsEmpty then Exit;
  with aTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select ');
    SQL.Add('  isnull(id_base_apteka,-1) as id_base_apteka');
    SQL.Add('from ');
    SQL.Add('  APTEKA_NET.dbo.APTEKS');
    SQL.Add('where');
    SQL.Add('  id_apteka = '+IntToStr(Prm.AptekaID));
    SQL.Add('');
    Open;
    Last;
  end;
  IdBaseApteka:=aTmp.FieldByName('id_base_apteka').AsInteger;

  if DM.spY_NaklList.FieldByName('obl').AsInteger=2 then // Печать накладной на ТМЦ
  begin
    try
      PrintRep.Clear;
      PrintRep.SetDefault;
      PrintRep.Font.Size:=6;

      PrintRep.AddText('Накладная ТМЦ № '+DM.spY_NaklList.FieldByName('NN_Nakl').AsString+'от '+DateToStrRU(DM.spY_NaklList.FieldByName('Date_Nakl').AsDateTime)+#10);
      PrintRep.AddText('От кого: '+Prm.AptekaNameRU+#10#10);
      PrintRep.Font.Size:=4;
      PrintRep.Align:=AL_LEFT;

      DM.Qr.Close;
      if rbPr.Checked then
        DM.Qr.SQL.Text:='exec spY_NaklListTMC '+DM.spY_NaklList.FieldByName('iddoc').AsString+',1'
      else
        DM.Qr.SQL.Text:='exec spY_NaklListTMC '+DM.spY_NaklList.FieldByName('iddoc').AsString+',2';

      DM.Qr.Open;

      PrintRep.Qr:=DM.Qr;
      PrintRep.PrintTable(False,0,0);
      PrintRep.PreView;
    except
      on E:Exception do MainF.MessBox('Ошибка печати накладной ТМЦ:'+E.Message);
    end;
    Exit;
  end;

  try
    F_NDS:=DM.qrShowNakl.FieldByName('F_NDS').AsInteger;
    if F_NDS<=2 then
    begin
      if Prm.AptekaNameLic<>Prm.AptekaNameRU then
        AptekaName:=Prm.AptekaNameLic+' ('+Prm.FirmNameUA+')'
//        AptekaName:=Prm.AptekaNameLic+' ('+Prm.AptekaNameRU+')'
      else
        AptekaName:=Prm.AptekaNameLic;
      FirmName:=Prm.FirmNameRU;
    end
    else
    begin
      AptekaName:=Opt.CHPAddr;
      FirmName:=Opt.CHPName;
    end;
    Tn:=DM.spY_NaklList.FieldByName('DebCrd').AsInteger;
    PrintRep.Clear;
    PrintRep.SetDefault;
    PrintRep.Font.Name:='Arial';
    PrintRep.Font.Size:=4;
    if IdBaseApteka>-1 then
    begin
      PrintRep.AddTable(2,1);
      Tb:=PrintRep.LastTable;
      Tb.Cell[1,1].AddText(Prm.FirmNameUA+#10);
      Tb.Cell[2,1].Align:=AL_RIGHT;
      Tb.Cell[2,1].AddText(FormatDateTime('DD MMMM YYYY',Date)+#10+#10);
      Tb.SetBorders(1,1,2,1,EMPTY_BORDER);
//      PrintRep.AddText(Prm.FirmNameUA+#10+#10);
    end;
    Case Tn of
      DC_INCOME:
        begin
          if IdBaseApteka > -1 then
          begin
            //тут печать шапки накладной на внутреннее перемещение
            PrintRep.AddTable(3,1);
            Tb:=PrintRep.LastTable;
            Tb.SetWidths('1500, 1500, 1500');
            Tb.SetBorders(1,1,3,1,EMPTY_BORDER);
            Tb.Cell[1,1].Align:=AL_LEFT;
            Tb.Cell[1,1].AddText('Накладна № '+DM.spY_NaklList.FieldByName('NN_Nakl').AsString+#10);
            Tb.Cell[2,1].Align:=AL_CENTER;
            Tb.Cell[2,1].Font.Style:=[fsBold];
            Tb.Cell[2,1].AddText('накладна на переміщення'+#10+#10);
            PrintRep.AddText('Кому: '+AptekaName+#10)
          end
          else
          begin
            PrintRep.AddTable(4,5);
            Tb:=PrintRep.LastTable;
            Tb.SetWidths('1200,1400,2600,1400');
            Tb.MergeCells(1,1,3,1);
            Tb.MergeCells(1,5,3,5);
            for i:=1 to 3 do Tb.Cell[4,i].Align:=AL_CENTER;
            Tb.SetBorders(1,1,4,5,EMPTY_BORDER);
            if Prm.FirmID<>5 then
            begin
              Tb.SetBorders(4,1,4,3,Border(clBlack,5,psSolid));

              Tb.Cell[4,1].AddText(Prm.FirmNameUA);
              Tb.Cell[4,2].Font.Size:=3;
              Tb.Cell[4,2].AddText('ВХОДНОЙ КОНТРОЛЬ');
              Tb.Cell[4,3].AddText('ПРОВИЗОР___________');

              Tb.Cell[4,2].TopBorder:=EMPTY_BORDER;
              Tb.Cell[4,3].TopBorder:=EMPTY_BORDER;
            end;

            Tb.Cell[1,1].Font.Style:=[fsBold];
            Tb.Cell[1,5].Font.Style:=[fsBold];
            Tb.Cell[1,1].AddText(FirmName);
            Tb.Cell[1,1].Font.Style:=[];
            Tb.Cell[1,1].AddText(' ('+Prm.SkladAdress+')');

            Tb.Cell[1,4].AddText('на отпуск товара');
            Tb.Cell[1,5].AddText('Кому: '+AptekaName);
            if Prm.FirmID<>5 then
              Tb.Cell[4,5].AddText(FormatDateTime('dd.mm.yyyy hh:nn:ss',Now));

            Tb.Cell[2,2].AddInterv(2);
            Tb.Cell[1,2].Font.Style:=[fsBold];
            Tb.Cell[1,2].AddText(DateToStrRU(DM.spY_NaklList.FieldByName('Date_Nakl').AsDateTime));
            Tb.Cell[1,3].Font.Style:=[fsBold];
            Tb.Cell[1,3].AddText('Накладная №');
            Tb.SetBorders(2,3,2,3,Border(clBlack,4,psSolid));
            Tb.Cell[2,3].AddText(DM.spY_NaklList.FieldByName('NN_Nakl').AsString);
          end;
        end;
      DC_BACK:
        begin
          PrintRep.Font.Size:=6;
          PrintRep.Font.Style:=[fsBold];
          PrintRep.Align:=AL_CENTER;
          PrintRep.AddText('Накладная № '+DM.spY_NaklList.FieldByName('NN_Nakl').AsString+#10);
          PrintRep.Font.Size:=5;
          PrintRep.AddText('на возврат товара из розницы'+#10);
          PrintRep.AddText('от '+DateToStrRU(DM.spY_NaklList.FieldByName('Date_Nakl').AsDateTime)+#10#10);
          PrintRep.Font.Size:=4;
          PrintRep.Align:=AL_LEFT;

          PrintRep.AddText('От кого: '+AptekaName+#10);

          DM.QrEx3.Close;
          DM.QrEx3.SQL.Text:='select priznak from JMoves where iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString;
          DM.QrEx3.Open;

          Case DM.QrEx3.FieldByName('priznak').AsInteger of
            1: PrintRep.AddText('Основание: Другая причина'+#10);
            7: PrintRep.AddText('Основание: АВС ручной'+#10);
            12: PrintRep.AddText('Основание: АВС - анализ'+#10) else PrintRep.AddText('Основание: '+DBText4.Caption+#10);
          end;

          PrintRep.AddText('в фармотдел (отдел возвратов)'+#10#10);

          PrintRep.AddText('Кому: '+FirmName);
        end;
    end;

    PrintRep.AddInterv(4);
    if DM.spY_NaklList.FieldByName('f_nds').AsInteger=1 then NDS:=True else NDS:=False;
    DM.Qr.Close;
    DM.Qr.SQL.Clear;
    Kol:=4;
    Case Tn of
      DC_INCOME:
        begin
          if IdBaseApteka > -1 then
          begin
            if NDS then
            begin
              DM.Qr.SQL.Add('select ''NumS'' as [№№_S_1150],');
              DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Найменування_S_7800,');
              DM.Qr.SQL.Add('       ''Уп.'' as [Од. вим_S_1150],');
              DM.Qr.SQL.Add('       Sum(a.Kol) as [Кіл-ть_I_1500],');
              DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)/6. as [Ціна без ПДВ_N_1700],');
              DM.Qr.SQL.Add('Max(a.Cena)/6. as [ПДВ на од_N_1500],');
              DM.Qr.SQL.Add('Max(a.Cena) as [Ціна з ПДВ_N_1500],');
              DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сума_N_1900]');
              It:=8;
            end
            else
            begin
              DM.Qr.SQL.Add('select ''NumS'' as [№№_S_1150],');
              DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Найменування_S_7800,');
              DM.Qr.SQL.Add('       ''Уп.'' as [Од. вим_S_1150],');
              DM.Qr.SQL.Add('       Sum(a.Kol) as [Кіл-ть_I_1500],');
              DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)*(7./107.) as [Ціна без ПДВ_N_1700],');
              DM.Qr.SQL.Add('Max(a.Cena)*(7./107.) as [ПДВ на од_N_1500],');
              DM.Qr.SQL.Add('Max(a.Cena) as [Ціна з ПДВ_N_1500],');
              DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сума_N_1900]');
              It:=8;
            end;
            DM.Qr.SQL.Add('from Moves a, SprTov b where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('IDDOC').AsString);
            DM.Qr.SQL.Add('group by b.art_code,b.Names,b.f_nds');
            DM.Qr.SQL.Add('order by b.Names');
          end
          else
          begin
            PrintRep.Font.Size:=5;
            PrintRep.Font.Style:=[fsBold];
            PrintRep.Indent:=0;
            PrintRep.AddText(#10+'Второй экземпляр накладной обязательно вернуть в бухгалтерию'+#10);
            PrintRep.AddInterv(1);
            PrintRep.Font.Style:=[];
            PrintRep.Font.Size:=4;
            if NDS then
            begin
              DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1150],');
              DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
              DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
              DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
              DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)/6. as [Цена без НДС_N_1700],');
              DM.Qr.SQL.Add('Max(a.Cena)/6. as [НДС на ед_N_1500],');
              DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
              DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
              It:=8;
            end
            else
            begin
              DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1150],');
              DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
              DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
              DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
              DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)*(7./107.) as [Цена без НДС_N_1700],');
              DM.Qr.SQL.Add('Max(a.Cena)*(7./107.) as [НДС на ед_N_1500],');
              DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
              DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
              It:=8;
            end;
            DM.Qr.SQL.Add('from rTovar a, SprTov b where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('IDDOC').AsString);
            DM.Qr.SQL.Add('group by b.art_code,b.Names,b.f_nds');
            DM.Qr.SQL.Add('order by b.Names');
          end;
        end;
      DC_BACK:
        begin
          if NDS then
          begin
            DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1050],');
            DM.Qr.SQL.Add('       b.art_code as Код_S_1100,');
            DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
            DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
            DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
            DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)/6. as [Цена без НДС_N_1700],');
            DM.Qr.SQL.Add('Max(a.Cena)/6. as [НДС на ед_N_1500],');
            DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
            DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
            It:=9;
          end
          else
          begin
            DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1050],');
            DM.Qr.SQL.Add('       b.art_code as Код_S_1100,');
            DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
            DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
            DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
            DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)*(7./107.) as [Цена без НДС_N_1700],');
            DM.Qr.SQL.Add('Max(a.Cena)*(7./107.) as [НДС на ед_N_1500],');
            DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
            DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
            It:=9;
          end;

          DM.Qr.SQL.Add('from rTovar a, SprTov b where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('IDDOC').AsString);
          DM.Qr.SQL.Add('group by b.art_code,b.Names,b.f_nds');
          DM.Qr.SQL.Add('order by b.Names');
        end;
    end;
    DM.Qr.Open;

    PrintRep.Qr:=DM.Qr;
    if IdBaseApteka > -1 then
      PrintRep.PrintTable(Nds,It,Kol, false, true)
    else
      PrintRep.PrintTable(Nds,It,Kol);

    Case Tn of
      DC_INCOME:
        begin
          if IdBaseApteka > -1 then
          begin
            //печать "подвала" накладной
            S:='______________/                             /';
            PrintRep.Font.Size:=4;
            PrintRep.Font.Style:=[fsBold];
            PrintRep.Font.Size:=3;
            PrintRep.Font.Style:=[];

            PrintRep.Font.Size:=4;
            PrintRep.Font.Style:=[fsBold];

            if Copy(DM.spY_NaklList.FieldByName('NN_Nakl').AsString,1,3)<>'Ппр' then
            begin
              PrintRep.AddText(#10#10+'Відпустив:'+S+'     Одержав:_____________    __________    _____________ ');
              PrintRep.Font.Size:=3;
              PrintRep.Font.Style:=[];
              PrintRep.AddText(#10+'                                                                                                 '
                                  +'                                     (посада)                 (підпис)                      (ПІБ)');
            end
            else
            begin
              PrintRep.AddText(#10#10+'Одержав:_____________    __________    _____________ ');
              PrintRep.Font.Size:=3;
              PrintRep.Font.Style:=[];
              PrintRep.AddText(#10+'                        (посада)                 (підпис)                      (ПІБ)');
            end;

            PrintRep.Font.Size:=4;
            PrintRep.AddText(#10+#10+'                     МП                                                                          МП'+#10+#10);

            PrintRep.Font.Size:=3;
            PrintRep.AddTable(2,1);
            Tb:=PrintRep.LastTable;
            Tb.SetWidths('2500,2500');
            Tb.Cell[1,1].AddText(#10+'Дозвіл:');
            Tb.Cell[1,1].AddText(#10+'Відпуск перелічених лікарських засобів до інших суб''єктів аптеки');
            Tb.Cell[1,1].AddText(#10+'Уповноважена особа аптеки');
            Tb.Cell[1,1].AddText(#10+#10+'___________________________________________________________________');
            Tb.Cell[1,1].AddText('                            (П.І.Б., підпис)');
            Tb.Cell[1,1].AddText(#10);
            Tb.Cell[1,1].AddText(#10+'___________________________________________________________________');
            Tb.Cell[1,1].AddText('                    (дата проведення вхідного контролю)');
            Tb.SetBorders(2,1,2,1,EMPTY_BORDER);
            Tb.SetBorders(1,1,1,1,Border(clBlack,5,psSolid));
          end
          else
          begin
            S:='______________/                             /';
            PrintRep.Font.Size:=4;
            PrintRep.Font.Style:=[fsBold];
            PrintRep.AddText(#10#10+'Отпуск разрешил:'+S+'         ');
            PrintRep.Font.Size:=3;
            PrintRep.Font.Style:=[];

            PrintRep.Font.Size:=4;
            PrintRep.Font.Style:=[fsBold];

            if Copy(DM.spY_NaklList.FieldByName('NN_Nakl').AsString,1,3)<>'Ппр' then
            begin
              PrintRep.AddText(#10#10+'Отпустил:'+S+'     Получил:_____________    __________    _____________ ');
              PrintRep.Font.Size:=3;
              PrintRep.Font.Style:=[];
              PrintRep.AddText(#10+'                                                                                                 '
                                  +'                                     (должность)                 (подпись)                      (фио)');
            end
            else
            begin
              PrintRep.AddText(#10#10+'Получил:_____________    __________    _____________ ');
              PrintRep.Font.Size:=3;
              PrintRep.Font.Style:=[];
              PrintRep.AddText(#10+'                        (должность)                 (подпись)                      (фио)');
            end;

            PrintRep.Font.Size:=4;
            PrintRep.AddText(#10+#10+'                     МП                                                                          МП'+#10+#10);

//            PrintRep.Font.Size:=3;
//            PrintRep.AddTable(2,1);
//            Tb:=PrintRep.LastTable;
//            Tb.SetWidths('2500,2500');
//            Tb.Cell[1,1].AddText(#10+'Разрешение:');
//            Tb.Cell[1,1].AddText(#10+'Отпуск перечисленых лекарственных средств к другим субъектов аптеки');
//            Tb.Cell[1,1].AddText(#10+'Ответственное лицо аптечного склада');
//            Tb.Cell[1,1].AddText(#10+#10+'___________________________________________________________________');
//            Tb.Cell[1,1].AddText('                            (Ф.И.О. подпись)');
//            Tb.Cell[1,1].AddText(#10);
//            Tb.Cell[1,1].AddText(#10+'___________________________________________________________________');
//            Tb.Cell[1,1].AddText('                    (дата проведения входного контроля)');
//            Tb.SetBorders(2,1,2,1,EMPTY_BORDER);
//            Tb.SetBorders(1,1,1,1,Border(clBlack,5,psSolid));
          end;
        end;
      DC_BACK:  PrintRep.AddText(#10#10+'Отпустил:_______________________           Получил:_________________________'+#10);
    end;

    PrintRep.PreView;
  except
    on E:Exception do MainF.MessBox('Ошибка формирования печатной формы накладной: '+E.Message);
  end;


(*
var Tb:TTableObj;
    i,F_NDS,It,Kol,Tn:Integer;
    NDS:Boolean;
    VzDescr,FirmName,AptekaName,S:String;
begin
{
  It:=0;
  Tb:=nil;
  if DM.spY_NaklList.IsEmpty then Exit;
  if DM.qrShowNakl.IsEmpty then Exit;

  if DM.spY_NaklList.FieldByName('obl').AsInteger=2 then // Печать накладной на ТМЦ
   begin
    try
     PrintRep.Clear;
     PrintRep.SetDefault;
     PrintRep.Font.Size:=6;

     PrintRep.AddText('Накладная ТМЦ № '+DM.spY_NaklList.FieldByName('NN_Nakl').AsString+'от '+DateToStrRU(DM.spY_NaklList.FieldByName('Date_Nakl').AsDateTime)+#10);
     PrintRep.AddText('От кого: '+Prm.AptekaNameRU+#10#10);
     PrintRep.Font.Size:=4;
     PrintRep.Align:=AL_LEFT;

     DM.Qr.Close;
     if rbPr.Checked then
      DM.Qr.SQL.Text:='exec spY_NaklListTMC '+DM.spY_NaklList.FieldByName('iddoc').AsString+',1'
     else
      DM.Qr.SQL.Text:='exec spY_NaklListTMC '+DM.spY_NaklList.FieldByName('iddoc').AsString+',2';

     DM.Qr.Open;

     PrintRep.Qr:=DM.Qr;
     PrintRep.PrintTable(False,0,0);
     PrintRep.PreView;
    except
     on E:Exception do MainF.MessBox('Ошибка печати накладной ТМЦ:'+E.Message);
    end;
    Exit;
   end;

  try
   F_NDS:=DM.qrShowNakl.FieldByName('F_NDS').AsInteger;
   if F_NDS<=2 then
    begin
     if Prm.AptekaNameLic<>Prm.AptekaNameRU then AptekaName:=Prm.AptekaNameLic+' ('+Prm.AptekaNameRU+')'
                                            else AptekaName:=Prm.AptekaNameLic;

     FirmName:=Prm.FirmNameRU;
    end else begin
              AptekaName:=Opt.CHPAddr;
              FirmName:=Opt.CHPName;
             end;
   Tn:=DM.spY_NaklList.FieldByName('DebCrd').AsInteger;
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=4;
   PrintRep.AddText(Prm.FirmNameUA+#10+#10);
   Case Tn of
    DC_INCOME:begin
               PrintRep.AddTable(4,5);
               Tb:=PrintRep.LastTable;
               Tb.SetWidths('1200,1400,2600,1400');
               Tb.MergeCells(1,1,3,1);
               Tb.MergeCells(1,5,3,5);
               for i:=1 to 3 do Tb.Cell[4,i].Align:=AL_CENTER;
               Tb.SetBorders(1,1,4,5,EMPTY_BORDER);
               if Prm.FirmID<>5 then
                begin
                 Tb.SetBorders(4,1,4,3,Border(clBlack,5,psSolid));

                 Tb.Cell[4,1].AddText(Prm.FirmNameUA);
                 Tb.Cell[4,2].Font.Size:=3;
                 Tb.Cell[4,2].AddText('ВХОДНОЙ КОНТРОЛЬ');
                 Tb.Cell[4,3].AddText('ПРОВИЗОР___________');

                 Tb.Cell[4,2].TopBorder:=EMPTY_BORDER;
                 Tb.Cell[4,3].TopBorder:=EMPTY_BORDER;
                end;

               Tb.Cell[1,1].Font.Style:=[fsBold];
               Tb.Cell[1,5].Font.Style:=[fsBold];
               Tb.Cell[1,1].AddText(FirmName);
               Tb.Cell[1,1].Font.Style:=[];
               Tb.Cell[1,1].AddText(' ('+Prm.SkladAdress+')');

               Tb.Cell[1,4].AddText('на отпуск товара');
               Tb.Cell[1,5].AddText('Кому: '+AptekaName);
               if Prm.FirmID<>5 then
                Tb.Cell[4,5].AddText(FormatDateTime('dd.mm.yyyy hh:nn:ss',Now));

               Tb.Cell[2,2].AddInterv(2);
               Tb.Cell[1,2].Font.Style:=[fsBold];
               Tb.Cell[1,2].AddText(DateToStrRU(DM.spY_NaklList.FieldByName('Date_Nakl').AsDateTime));
               Tb.Cell[1,3].Font.Style:=[fsBold];
               Tb.Cell[1,3].AddText('Накладная №');
               Tb.SetBorders(2,3,2,3,Border(clBlack,4,psSolid));
               Tb.Cell[2,3].AddText(DM.spY_NaklList.FieldByName('NN_Nakl').AsString);
              end;
    DC_BACK:  begin

               PrintRep.Font.Size:=6;
               PrintRep.Font.Style:=[fsBold];
               PrintRep.Align:=AL_CENTER;
               PrintRep.AddText('Накладная № '+DM.spY_NaklList.FieldByName('NN_Nakl').AsString+#10);
               PrintRep.Font.Size:=5;
               PrintRep.AddText('на возврат товара из розницы'+#10);
               PrintRep.AddText('от '+DateToStrRU(DM.spY_NaklList.FieldByName('Date_Nakl').AsDateTime)+#10#10);
               PrintRep.Font.Size:=4;
               PrintRep.Align:=AL_LEFT;

               PrintRep.AddText('От кого: '+AptekaName+#10);

               DM.QrEx3.Close;
               DM.QrEx3.SQL.Text:='select priznak from JMoves where iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString;
               DM.QrEx3.Open;

               Case DM.QrEx3.FieldByName('priznak').AsInteger of
                 1:PrintRep.AddText('Основание: Другая причина'+#10);
                 7:PrintRep.AddText('Основание: АВС ручной'+#10);
                12:PrintRep.AddText('Основание: АВС - анализ'+#10) else PrintRep.AddText('Основание: '+DBText4.Caption+#10);
               end;

               PrintRep.AddText('в фармотдел (отдел возвратов)'+#10#10);

               PrintRep.AddText('Кому: '+FirmName);
              end;
   end;


   PrintRep.AddInterv(4);
   if DM.spY_NaklList.FieldByName('f_nds').AsInteger=1 then NDS:=True else NDS:=False;
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   Kol:=4;
   Case Tn of
    DC_INCOME:begin
               PrintRep.Font.Size:=5;
               PrintRep.Font.Style:=[fsBold];
               PrintRep.Indent:=0;
               PrintRep.AddText(#10+'Второй экземпляр накладной обязательно вернуть в бухгалтерию'+#10);
               PrintRep.AddInterv(1);
               PrintRep.Font.Style:=[];
               PrintRep.Font.Size:=4;
               if NDS then
                begin
                 DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1150],');
                 DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
                 DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
                 DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
                 DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)/6. as [Цена без НДС_N_1700],');
                 DM.Qr.SQL.Add('Max(a.Cena)/6. as [НДС на ед_N_1500],');
                 DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
                 DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
                 It:=8;
                end else begin
                          DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1150],');
                          DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
                          DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
                          DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
                          DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)*(7./107.) as [Цена без НДС_N_1700],');
                          DM.Qr.SQL.Add('Max(a.Cena)*(7./107.) as [НДС на ед_N_1500],');
                          DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
                          DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
                          It:=8;
                         end;
               DM.Qr.SQL.Add('from Moves a, SprTov b where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('IDDOC').AsString);
               DM.Qr.SQL.Add('group by b.art_code,b.Names,b.f_nds');
               DM.Qr.SQL.Add('order by b.Names');
              end;
    DC_BACK:  begin
               if NDS then
                begin
                 DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1050],');
                 DM.Qr.SQL.Add('       b.art_code as Код_S_1100,');
                 DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
                 DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
                 DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
                 DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)/6. as [Цена без НДС_N_1700],');
                 DM.Qr.SQL.Add('Max(a.Cena)/6. as [НДС на ед_N_1500],');
                 DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
                 DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
                 It:=9;
                end else begin
                          DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1050],');
                          DM.Qr.SQL.Add('       b.art_code as Код_S_1100,');
                          DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
                          DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
                          DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
                          DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)*(7./107.) as [Цена без НДС_N_1700],');
                          DM.Qr.SQL.Add('Max(a.Cena)*(7./107.) as [НДС на ед_N_1500],');
                          DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
                          DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
                          It:=9;
                         end;

               DM.Qr.SQL.Add('from Moves a, SprTov b where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('IDDOC').AsString);
               DM.Qr.SQL.Add('group by b.art_code,b.Names,b.f_nds');
               DM.Qr.SQL.Add('order by b.Names');
              end;
   end;
   DM.Qr.Open;
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(Nds,It,Kol);

   Case Tn of
    DC_INCOME:begin
               S:='______________/                             /';
               PrintRep.Font.Size:=4;
               PrintRep.Font.Style:=[fsBold];
               //PrintRep.AddText(#10#10+'Отпуск разрешил:'+S+'         ');
               PrintRep.Font.Size:=3;
               PrintRep.Font.Style:=[];

               PrintRep.Font.Size:=4;
               PrintRep.Font.Style:=[fsBold];

               if Copy(DM.spY_NaklList.FieldByName('NN_Nakl').AsString,1,3)<>'Ппр' then
                begin
                 PrintRep.AddText(#10#10+'Отпустил:'+S+'     Получил:_____________    __________    _____________ ');
                 PrintRep.Font.Size:=3;
                 PrintRep.Font.Style:=[];
                 PrintRep.AddText(#10+'                                                                                                 '
                                     +'                                     (должность)                 (подпись)                      (фио)');
//                                     +'                                                                     (должность)                 (подпись)                      (фио)');
                end else begin
                          PrintRep.AddText(#10#10+'Получил:_____________    __________    _____________ ');
                          PrintRep.Font.Size:=3;
                          PrintRep.Font.Style:=[];
                          PrintRep.AddText(#10+'                        (должность)                 (подпись)                      (фио)');
                         end;

               PrintRep.Font.Size:=4;
               PrintRep.AddText(#10+#10+'                     МП                                                                          МП'+#10+#10);

               PrintRep.Font.Size:=3;
               PrintRep.AddTable(2,1);
               Tb:=PrintRep.LastTable;
               Tb.SetWidths('2500,2500');
               Tb.Cell[1,1].AddText(#10+'Разрешение:');
               Tb.Cell[1,1].AddText(#10+'Отпуск перечисленых лекарственных средств к другим субъектов аптеки');
               Tb.Cell[1,1].AddText(#10+'Ответственное лицо аптечного склада');
               Tb.Cell[1,1].AddText(#10+#10+'___________________________________________________________________');
               Tb.Cell[1,1].AddText('                            (Ф.И.О. подпись)');
               Tb.Cell[1,1].AddText(#10);
               Tb.Cell[1,1].AddText(#10+'___________________________________________________________________');
               Tb.Cell[1,1].AddText('                    (дата проведения входного контроля)');
               Tb.SetBorders(2,1,2,1,EMPTY_BORDER);
               Tb.SetBorders(1,1,1,1,Border(clBlack,5,psSolid));
              end;
    DC_BACK:  PrintRep.AddText(#10#10+'Отпустил:_______________________           Получил:_________________________'+#10);
   end;

   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования печатной формы накладной: '+E.Message);
  end;
}
  It:=0;
  Tb:=nil;
  if DM.spY_NaklList.IsEmpty then Exit;
  if DM.qrShowNakl.IsEmpty then Exit;

  if DM.spY_NaklList.FieldByName('obl').AsInteger=2 then // Печать накладной на ТМЦ
   begin
    try
     PrintRep.Clear;
     PrintRep.SetDefault;
     PrintRep.Font.Size:=6;
 
     PrintRep.AddText('Накладная ТМЦ № '+DM.spY_NaklList.FieldByName('NN_Nakl').AsString+'от '+DateToStrRU(DM.spY_NaklList.FieldByName('Date_Nakl').AsDateTime)+#10);
     PrintRep.AddText('От кого: '+Prm.AptekaNameRU+#10#10);
     PrintRep.Font.Size:=4;
     PrintRep.Align:=AL_LEFT;

     DM.Qr.Close;
     if rbPr.Checked then
      DM.Qr.SQL.Text:='exec spY_NaklListTMC '+DM.spY_NaklList.FieldByName('iddoc').AsString+',1'
     else
      DM.Qr.SQL.Text:='exec spY_NaklListTMC '+DM.spY_NaklList.FieldByName('iddoc').AsString+',2';

     DM.Qr.Open;

     PrintRep.Qr:=DM.Qr;
     PrintRep.PrintTable(False,0,0);
     PrintRep.PreView;
    except
     on E:Exception do MainF.MessBox('Ошибка печати накладной ТМЦ:'+E.Message);
    end;
    Exit;
   end;

  try
   F_NDS:=DM.qrShowNakl.FieldByName('F_NDS').AsInteger;
   if F_NDS<=2 then
    begin
     if Prm.AptekaNameLic<>Prm.AptekaNameRU then AptekaName:=Prm.AptekaNameLic+' ('+Prm.AptekaNameRU+')'
                                            else AptekaName:=Prm.AptekaNameLic;

     FirmName:=Prm.FirmNameRU;
    end else begin
              AptekaName:=Opt.CHPAddr;
              FirmName:=Opt.CHPName;
             end;
   Tn:=DM.spY_NaklList.FieldByName('DebCrd').AsInteger;
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=4;
   Case Tn of
    DC_INCOME:begin
               PrintRep.AddTable(4,5);
               Tb:=PrintRep.LastTable;
               Tb.SetWidths('1200,1400,2600,1400');
               Tb.MergeCells(1,1,3,1);
               Tb.MergeCells(1,5,3,5);
               for i:=1 to 3 do Tb.Cell[4,i].Align:=AL_CENTER;
               Tb.SetBorders(1,1,4,5,EMPTY_BORDER);
               if Prm.FirmID<>5 then
                begin
                 Tb.SetBorders(4,1,4,3,Border(clBlack,5,psSolid));

                 Tb.Cell[4,1].AddText(Prm.FirmNameUA);
                 Tb.Cell[4,2].Font.Size:=3;
                 Tb.Cell[4,2].AddText('ВХОДНОЙ КОНТРОЛЬ');
                 Tb.Cell[4,3].AddText('ПРОВИЗОР___________');

                 Tb.Cell[4,2].TopBorder:=EMPTY_BORDER;
                 Tb.Cell[4,3].TopBorder:=EMPTY_BORDER;
                end;

               Tb.Cell[1,1].Font.Style:=[fsBold];
               Tb.Cell[1,5].Font.Style:=[fsBold];
               Tb.Cell[1,1].AddText(FirmName);
               Tb.Cell[1,1].Font.Style:=[];
               Tb.Cell[1,1].AddText(' ('+Prm.SkladAdress+')');

               Tb.Cell[1,4].AddText('на отпуск товара');
               Tb.Cell[1,5].AddText('Кому: '+AptekaName);
               if Prm.FirmID<>5 then
                Tb.Cell[4,5].AddText(FormatDateTime('dd.mm.yyyy hh:nn:ss',Now));

               Tb.Cell[2,2].AddInterv(2);
               Tb.Cell[1,2].Font.Style:=[fsBold];
               Tb.Cell[1,2].AddText(DateToStrRU(DM.spY_NaklList.FieldByName('Date_Nakl').AsDateTime));
               Tb.Cell[1,3].Font.Style:=[fsBold];
               Tb.Cell[1,3].AddText('Накладная №');
               Tb.SetBorders(2,3,2,3,Border(clBlack,4,psSolid));
               Tb.Cell[2,3].AddText(DM.spY_NaklList.FieldByName('NN_Nakl').AsString);
              end;
    DC_BACK:  begin

               PrintRep.Font.Size:=6;
               PrintRep.Font.Style:=[fsBold];
               PrintRep.Align:=AL_CENTER;
               PrintRep.AddText('Накладная № '+DM.spY_NaklList.FieldByName('NN_Nakl').AsString+#10);
               PrintRep.Font.Size:=5;
               PrintRep.AddText('на возврат товара из розницы'+#10);
               PrintRep.AddText('от '+DateToStrRU(DM.spY_NaklList.FieldByName('Date_Nakl').AsDateTime)+#10#10);
               PrintRep.Font.Size:=4;
               PrintRep.Align:=AL_LEFT;

               PrintRep.AddText('От кого: '+AptekaName+#10);

               DM.QrEx3.Close;
               DM.QrEx3.SQL.Text:='select priznak from JMoves where iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString;
               DM.QrEx3.Open;

               Case DM.QrEx3.FieldByName('priznak').AsInteger of
                 1:PrintRep.AddText('Основание: Другая причина'+#10);
                 7:PrintRep.AddText('Основание: АВС ручной'+#10);
                12:PrintRep.AddText('Основание: АВС - анализ'+#10) else PrintRep.AddText('Основание: '+DBText4.Caption+#10);
               end;

               PrintRep.AddText('в фармотдел (отдел возвратов)'+#10#10);

               PrintRep.AddText('Кому: '+FirmName);
              end;
   end;


   PrintRep.AddInterv(4);
   if DM.spY_NaklList.FieldByName('f_nds').AsInteger=1 then NDS:=True else NDS:=False;
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   Kol:=4;
   Case Tn of
    DC_INCOME:begin
               PrintRep.Font.Size:=5;
               PrintRep.Font.Style:=[fsBold];
               PrintRep.Indent:=0;
               PrintRep.AddText(#10+'Второй экземпляр накладной обязательно вернуть в бухгалтерию'+#10);
               PrintRep.AddInterv(1);
               PrintRep.Font.Style:=[];
               PrintRep.Font.Size:=4;
               if NDS then
                begin
                 DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1150],');
                 DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
                 DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
                 DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
                 DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)/6. as [Цена без НДС_N_1700],');
                 DM.Qr.SQL.Add('Max(a.Cena)/6. as [НДС на ед_N_1500],');
                 DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
                 DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
                 It:=8;
                end else begin
                          DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1150],');
                          DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
                          DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
                          DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
                          DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)*(7./107.) as [Цена без НДС_N_1700],');
                          DM.Qr.SQL.Add('Max(a.Cena)*(7./107.) as [НДС на ед_N_1500],');
                          DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
                          DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
                          It:=8;
                         end;
               DM.Qr.SQL.Add('from Moves a, SprTov b where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('IDDOC').AsString);
               DM.Qr.SQL.Add('group by b.art_code,b.Names,b.f_nds');
               DM.Qr.SQL.Add('order by b.Names');
              end;
    DC_BACK:  begin
               if NDS then
                begin
                 DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1050],');
                 DM.Qr.SQL.Add('       b.art_code as Код_S_1100,');
                 DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
                 DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
                 DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
                 DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)/6. as [Цена без НДС_N_1700],');
                 DM.Qr.SQL.Add('Max(a.Cena)/6. as [НДС на ед_N_1500],');
                 DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
                 DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
                 It:=9;
                end else begin
                          DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1050],');
                          DM.Qr.SQL.Add('       b.art_code as Код_S_1100,');
                          DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
                          DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
                          DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
                          DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)*(7./107.) as [Цена без НДС_N_1700],');
                          DM.Qr.SQL.Add('Max(a.Cena)*(7./107.) as [НДС на ед_N_1500],');
                          DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
                          DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
                          It:=9;
                         end;

               DM.Qr.SQL.Add('from Moves a, SprTov b where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('IDDOC').AsString);
               DM.Qr.SQL.Add('group by b.art_code,b.Names,b.f_nds');
               DM.Qr.SQL.Add('order by b.Names');
              end;
   end;
   DM.Qr.Open;
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(Nds,It,Kol);

   Case Tn of
    DC_INCOME:begin
               S:='______________/                             /';
               PrintRep.Font.Size:=4;
               PrintRep.Font.Style:=[fsBold];
               PrintRep.AddText(#10#10+'Отпуск разрешил:'+S+'         ');
               PrintRep.Font.Size:=3;
               PrintRep.Font.Style:=[];

               PrintRep.Font.Size:=4;
               PrintRep.Font.Style:=[fsBold];

               if Copy(DM.spY_NaklList.FieldByName('NN_Nakl').AsString,1,3)<>'Ппр' then
                begin
                 PrintRep.AddText(#10#10+'Отпустил:'+S+'     Получил:_____________    __________    _____________ ');
                 PrintRep.Font.Size:=3;
                 PrintRep.Font.Style:=[];
                 PrintRep.AddText(#10+'                                                                                                 '
                                     +'                                                                     (должность)                 (подпись)                      (фио)');
                end else begin
                          PrintRep.AddText(#10#10+'Получил:_____________    __________    _____________ ');
                          PrintRep.Font.Size:=3;
                          PrintRep.Font.Style:=[];
                          PrintRep.AddText(#10+'                        (должность)                 (подпись)                      (фио)');
                         end;
              end;
    DC_BACK:  PrintRep.AddText(#10#10+'Отпустил:_______________________           Получил:_________________________'+#10);
   end;

   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования печатной формы накладной: '+E.Message);
  end;
*)
 end;

procedure TViewNaklF.rbPrClick(Sender:TObject);
begin
  rbVz.Checked:=false;
  BitBtn11.Enabled:=true;
  BitBtn12.Enabled:=false;
  BitBtn13.Enabled:=false;
  BitBtn15.Enabled:=false;
  BitBtn14.Enabled:=false;

  CheckBox4.Caption:='Накладные от поставщика';
//  if DM.spY_NaklList.RecordCount<=0 then BitBtn11.Enabled:=false;
  if DM.spY_NaklList.IsEmpty then
  begin
    BitBtn11.Enabled:=false;
    lblPostavschik.Caption:='';
    lblNaklNomber.Caption:='';
    lblNaklDate.Caption:='';
  end;

  BitBtn5Click(BitBtn5);
  BitBtn5Click(BitBtn5);
  N3.Enabled:=rbVz.Checked;
end;

procedure TViewNaklF.rbVzClick(Sender:TObject);
begin
  rbPr.Checked:=false;
  BitBtn11.Enabled:=false;
  BitBtn12.Enabled:=true;
  BitBtn13.Enabled:=true;
  BitBtn15.Enabled:=true;
  BitBtn14.Enabled:=true;

  CheckBox4.Caption:='Накладные к поставщику';
//  if DM.spY_NaklList.RecordCount<=0 then
  if DM.spY_NaklList.IsEmpty then
  begin
    BitBtn11.Enabled:=false;
    lblPostavschik.Caption:='';
    lblNaklNomber.Caption:='';
    lblNaklDate.Caption:='';
  end;

  BitBtn5Click(BitBtn5);
  BitBtn5Click(BitBtn5);
  N3.Enabled:=rbVz.Checked;
end;

procedure TViewNaklF.btDelClick(Sender:TObject);
var
  iddoc:Integer;
begin
  if Not MainF.CheckPassword('0523574825') then Exit;
  if DM.spY_NaklList.IsEmpty then Exit;
  if MainF.MessBox('Удалить накладную: '+DM.spY_NaklList.FieldByName('nn_nakl').AsString+' ?',52)<>ID_YES then Exit;
  iddoc:=DM.spY_NaklList.FieldByName('iddoc').AsInteger;
  try
    DM.Qr.Close;
    DM.Qr.SQL.Text:='exec spY_DeleteNakl '+IntToStr(iddoc)+' select 999 as Res';
    DM.Qr.Open;

    BitBtn5Click(BitBtn5);
    if MainF.Design=False then MainF.FilterSklad;
  except
    MainF.MessBox('Ошибка удаления накладной: '+DM.spY_NaklList.FieldByName('nn_nakl').AsString+'.');
  end;
end;

procedure TViewNaklF.SelectNakls(ColName:String; All:Boolean; Value:Boolean);
var V,RID:Integer;
 begin
  if DM.spY_NaklList.IsEmpty then Exit;
  if ColName='f' then
   try
    RID:=DM.spY_NaklList.FieldByName('ROW_ID').AsInteger;
    DM.Qr.Close;
    if Value then V:=1 else V:=0;
    DM.Qr.SQL.Clear;
    if Not All then
     DM.Qr.SQL.Add('Update ##nakllist set F=1-F where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and row_id='+DM.spY_NaklList.FieldByName('row_id').AsString)
    else begin
          DM.Qr.SQL.Add('Update ##nakllist set F='+IntToStr(V)+' where nn_nakl not like ''%пр-%'' and priznak not in (select Descr from SPRPRVOZR where id in (9,10)) and compname=host_name() and id_user='+IntToStr(Prm.UserID));
         end;
    DM.Qr.SQL.Add('Update ##nakllist set F=0 where priznak in (select Descr from SPRPRVOZR where id in (9,10))');
    DM.Qr.ExecSQL;
    NaklList(1);
    DM.spY_NaklList.Locate('ROW_ID',RID,[]);
   except
   end;
 end;

procedure TViewNaklF.DBGrid1CellClick(Column:TColumn);
begin
  SelectNakls(Column.FieldName,False,False);
end;

procedure TViewNaklF.CheckBox1Click(Sender:TObject);
begin
  SelectNakls('f',True,CheckBox1.Checked);
end;

procedure TViewNaklF.BitBtn3Click(Sender:TObject);
var dx,dy:Integer;
    Com:TControl;
 begin
  if Sender=nil then Exit;
  dx:=Left+3; dy:=Top+TControl(Sender).Height+23;
  Com:=TControl(Sender);
  P:=Com.Tag;
  While Com<>Self do
   begin
    Inc(dx,Com.Left);
    Inc(dy,Com.Top);
    Com:=Com.Parent;
   end;
  pmPrintAkt.Popup(dx,dy);
 end;

procedure TViewNaklF.PrintAkt(NumDriver:Byte);
var i,iii:Integer;
    EAN13,S,s1:String;
begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('if Object_ID(N''tempdb..#tmpnspis'') is not null drop table #tmpnspis ');
   DM.Qr.SQL.Add('select j.iddoc,j.nn_nakl ');
   DM.Qr.SQL.Add('into #tmpnspis ');
   DM.Qr.SQL.Add('from Jmoves j (nolock) inner join rTovar r (nolock) on r.iddoc=j.iddoc ');
   DM.Qr.SQL.Add('where IsNull(r.IsScan,0)>0 and IsNull(r.Shtrih,0)=0 ');
   DM.Qr.SQL.Add('      and r.iddoc in (select iddoc from ##nakllist where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 )');
   DM.Qr.SQL.Add('group by j.iddoc,j.nn_nakl ');

   DM.Qr.SQL.Add('select * from #tmpnspis ');
   DM.Qr.SQL.Add('order by 2');
   DM.Qr.Open;
   if DM.Qr.IsEmpty=False then
    begin
     S:='';
     for i:=1 to DM.Qr.RecordCount do
      begin
       if i=1 then DM.Qr.First else DM.Qr.Next;
       S:=S+'      '+DM.Qr.FieldByName('nn_nakl').AsString+#10;
     end;
     ShowText('Для следующих накладных невозможно напечатать акт приема-передачи, так как не все ящики закрыты: '#10+S);
    end;

//   if (Prm.UserRole<>R_ADMIN) then
    begin
     RegPredstF:=TRegPredstF.Create(Self);
     try

      RegPredstF.crPref:=CR_DRIVER;
      RegPredstF.OnlyScan:=True;
      RegPredstF.Cap:='водителя';
      RegPredstF.Tab:='RegDrivers';
      Application.ProcessMessages;
      RegPredstF.ShowModal;

      if RegPredstF.Flag=False then Exit;
      EAN13:=RegPredstF.EAN13;
      try
       if Length(EAN13)<>13 then Abort;

       s1:='';
       if NumDriver=2 then s1:='2';
       DM.QrEx.Close;
       DM.QrEx.SQL.Clear;
       DM.QrEx.SQL.Add('update JMoves set Date_Close'+s1+'=getdate(), EANDriver'+s1+'='''+EAN13+''' where iddoc in (select iddoc from ##nakllist where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) group by iddoc)');
       DM.QrEx.SQL.Add('select top 1 EANDriver'+s1+' from JMoves where IsNull(EANDriver'+s1+','''')='''' and iddoc in (select iddoc from ##nakllist where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) group by iddoc) ');
       DM.QrEx.Open;

       if DM.QrEx.IsEmpty=False then Abort;
      except
       MainF.MessBox('Штрих-код водителя некорректный! Просканируйте еще раз!');
       Exit;
      end;
     finally
      RegPredstF.Free;
     end;
    end;

   if NumDriver=2 then Exit;
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=3;

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select id_p from ##nakllist where id_p>0 and id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) group by id_p';
   DM.QrEx.Open;

   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;
     for iii:=1 to 2 do
      begin
       PrintRep.Align:=AL_LEFT;

       DM.Qr.Close;
       DM.Qr.SQL.Clear;
       DM.Qr.SQL.Add('select nn_nakl+''-'+IntToStr(Prm.AptekaID)+''' +case Priznak when 19 then ''     ЯЩИКИ'' else ''''      end as [Номера накладных_S_600], ');
       DM.Qr.SQL.Add('       date_nakl as [Дата_S_400], ');
       DM.Qr.SQL.Add('       Summa as [Сумма_N_300] ');
       DM.Qr.SQL.Add('from JMoves ');
       DM.Qr.SQL.Add('where iddoc in (select iddoc from ##nakllist where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) and id_p='+DM.QrEx.FieldByName('id_p').AsString+')');
       DM.Qr.Open;

       PrintRep.AddTable(2,1);
       PrintRep.LastTable.SetWidths('7000,3000');
       PrintRep.LastTable.SetBorders(1,1,2,1,EMPTY_BORDER);

       PrintRep.LastTable.Cell[1,1].AddText('Приложение №2');

       PrintRep.LastTable.Cell[2,1].AddText('Приложение №2');
       PrintRep.Font.Size:=3;

       PrintRep.Align:=AL_CENTER;
       PrintRep.AddText(#10+'Акт'+#10);
       PrintRep.AddText('приема-передачи товара'+#10);
       PrintRep.AddTable(2,1);
       PrintRep.LastTable.SetBorders(1,1,2,1,EMPTY_BORDER);
       PrintRep.LastTable.Cell[1,1].Align:=AL_LEFT;
       PrintRep.LastTable.Cell[1,1].AddText('г.Харьков');
       PrintRep.LastTable.Cell[2,1].Align:=AL_RIGHT;
       PrintRep.LastTable.Cell[2,1].AddText(DateToStr(Date));
       PrintRep.Align:=AL_JUST;

       PrintRep.Indent:=15;
       PrintRep.AddText(#10+'Заведующая (зам. заведующей) аптеки "'+Prm.AptekaNameRU+' '+Prm.FirmNameRU+' ______________/ФИО/, ');
       PrintRep.AddText('передал товар в нижеуказанном количестве ящиков (кульков), которые опечатаны и не имеют видимых повреждений, а водитель');
       PrintRep.AddText('(экспедитор) __________/ФИО/ принял указанный товар  для последующей доставки поставщику ПФ "Гамма 55"');
       PrintRep.AddText(#10#10);
       PrintRep.AddText('Количество ящиков (кульков) без видимых повреждений ___________________');
       PrintRep.AddText(#10);

       PrintRep.Qr:=DM.Qr;
       PrintRep.PrintTable(False,0,0);
       PrintRep.AddText(#10+'Накладных '+IntToStr(DM.Qr.RecordCount)+' на сумму ');
       DM.Qr.Close;
       DM.Qr.SQL.Text:='select Sum(Summa) as Summa from ##nakllist where  id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) and id_p='+DM.QrEx.FieldByName('id_p').AsString;
       DM.Qr.Open;
       PrintRep.AddText(CurrToStrF(DM.Qr.FieldByName('Summa').AsFloat,ffFixed,2)+' грн. '#10);

       DM.Qr.Close;
       DM.Qr.SQL.Clear;
       DM.Qr.SQL.Add('select b.art_code');
       DM.Qr.SQL.Add('from  rTovar a, SprTov b');
       DM.Qr.SQL.Add('where a.kod_name=b.kod_name ');
       DM.Qr.SQL.Add('      and iddoc in (select iddoc from ##nakllist where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) and id_p='+DM.QrEx.FieldByName('id_p').AsString+')');
       DM.Qr.SQL.Add('group by art_code');
       DM.Qr.Open;
       PrintRep.AddText('Количество наименований: '+IntToStr(DM.Qr.RecordCount)+'   ');

       DM.Qr.Close;
       DM.Qr.SQL.Clear;
       DM.Qr.SQL.Add('select Sum(kol) as kol');
       DM.Qr.SQL.Add('from rTovar ');
       DM.Qr.SQL.Add('where iddoc in (select iddoc from ##nakllist where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) and id_p='+DM.QrEx.FieldByName('id_p').AsString+')');
       DM.Qr.Open;
       PrintRep.AddText('Количество штук: '+DM.Qr.FieldByName('kol').AsString+#10);
       PrintRep.AddText('Акт сформирован: '+FormatDateTime('dd.mm.yyyy hh:nn:ss',Now)+#10#10);

       PrintRep.Font.Size:=3;
       PrintRep.AddTable(2,1);
       PrintRep.LastTable.SetWidths('2000,1300');
       PrintRep.LastTable.SetBorders(1,1,2,1,EMPTY_BORDER);
       PrintRep.LastTable.Cell[1,1].Align:=AL_LEFT;
       PrintRep.LastTable.Cell[1,1].AddText('Отпустил товар с аптеки'+#10#10+'_____________________________');

       PrintRep.LastTable.Cell[2,1].Align:=AL_LEFT;
       PrintRep.LastTable.Cell[2,1].AddText('Принял экспедитор (водитель)'+#10#10+'_____________________________'+#10#10);
       PrintRep.LastTable.Cell[2,1].AddText('Принял товар '+#10+'_____________________________');

       DM.Qr1.Close;
       DM.Qr1.SQL.Clear;
       DM.Qr1.SQL.Add('select j.nn_nakl as [№ Накл._S_2500],j.date_nakl as [Дата накл._S_1800], b.art_code as [Код_I_1500],b.names as [Наименование_S_7000],Sum(a.kol) as [Кол. накл._I_1500],Sum(IsNull(IsScan,0)) as [Кол. скан._I_1500], ');
       DM.Qr1.SQL.Add('       Sum(a.kol)-Sum(IsNull(IsScan,0)) as [Недостача._I_2000]');
       DM.Qr1.SQL.Add('from JMoves j (nolock), rTovar a (nolock), SprTov b (nolock) ');
       DM.Qr1.SQL.Add('where j.iddoc=a.iddoc and IsNull(a.IsScan,0)>0 and IsNull(a.Shtrih,0)=0 and j.date_nakl>=''2014-02-25'' and a.kod_name=b.kod_name and a.iddoc in (select iddoc from ##nakllist where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) and id_p='+DM.QrEx.FieldByName('id_p').AsString+')');
       DM.Qr1.SQL.Add('group by j.nn_nakl,j.date_nakl,b.art_code,b.names ');
       DM.Qr1.SQL.Add('having Sum(a.kol)>Sum(Isnull(IsScan,0)) ');
       DM.Qr1.SQL.Add('order by 2 ');
       DM.Qr1.Open;

       if DM.Qr1.IsEmpty=False then
        begin
         PrintRep.AddText(#10#10'Данный неотсканированный товар будет считаться как недостача');
         PrintRep.Qr:=DM.Qr1;
         PrintRep.PrintTable(False,0,0);
        end;

       if iii=1 then PrintRep.AddInterv(12);

      end;
     PrintRep.AddText(#12);
    end;

   PrintRep.PreView;
  except
   on E:Exception do
    MainF.MessBox('Ошибка формирования данных для акта: '+E.Message);
  end;
 end;

procedure TViewNaklF.BitBtn6Click(Sender: TObject);
 begin
  try
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=5;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.AddText('Список препаратов накладной по местам хранения'+#10#10);
   PrintRep.AddText('Торговая точка: '+Prm.AptekaNameRU+#10);
   PrintRep.AddText('Накладная №: '+DM.spY_NaklList.FieldByName('nn_nakl').AsString+#10);
   PrintRep.AddText('Дата : '+DM.spY_NaklList.FieldByName('date_nakl').AsString+#10#10);
   PrintRep.Orientation:=O_LANDS;
   PrintRep.Font.Size:=4;
   PrintRep.Font.Style:=[];

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select b.Art_Code as Код_I_1400,');
   DM.Qr.SQL.Add('       b.Names as Наименование_S_11000,');
   DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1000],');
   DM.Qr.SQL.Add('       convert(varchar(10),case Min(p.t1) when -999 then null else Min(p.t1) end)+char(176) as [Темп. реж. '#10'с_C_1200],');
   DM.Qr.SQL.Add('       convert(varchar(10),case Min(p.t2) when -999 then null else Min(p.t2) end)+char(176) as [Темп. реж. по_C_1200],');
   DM.Qr.SQL.Add('       (case Max(p.Svet) when 2 then ''Да'' when 1 then ''Нет'' else '''' end) as [Светочувств._S_1200],');
   DM.Qr.SQL.Add('       (case when n.art_code is null then ''Рецепт.'' else '''' end) as [Рецепт._S_1700],');
   DM.Qr.SQL.Add('       (case Max(p.in_out) when 0 then ''Внутр.'' when 1 then ''Наружн.'' else ''Прочее'' end) as [Приме- нение_S_1700],');
   DM.Qr.SQL.Add('       (case Max(p.Nds) when 3 then ''ДП'' else '''' end) as [Детское питание_S_1700],');
   DM.Qr.SQL.Add('       Max(p.KategMorion) as [Категория_S_1700],');
   DM.Qr.SQL.Add('       IsNull(convert(varchar(10),c.P1),'''')+IsNull(c.L1,'''') as [Осн_S_1000],');
   DM.Qr.SQL.Add('       IsNull(convert(varchar(10),c.P2),'''')+IsNull(c.L2,'''') as [Витр_S_1000],');
   DM.Qr.SQL.Add('       IsNull(convert(varchar(10),c.P3),'''')+IsNull(c.L3,'''') as [Скл_S_1000]');
   DM.Qr.SQL.Add('from rTovar a, ');
   DM.Qr.SQL.Add('     SprTov b ');
   DM.Qr.SQL.Add('      left join ');
   DM.Qr.SQL.Add('     Inform..SprReg c on b.art_code=c.art_code ');
   DM.Qr.SQL.Add('      left join ');
   DM.Qr.SQL.Add('     Plist p on b.art_code=p.art_code ');
   DM.Qr.SQL.Add('      left join ');
   DM.Qr.SQL.Add('     SprNoRecipt n on b.art_code=n.art_code');
   DM.Qr.SQL.Add('where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('IDDOC').AsString);
   DM.Qr.SQL.Add('group by b.art_code,n.art_code,b.Names,c.P1,c.P2,c.P3,c.L1,c.L2,c.L3');
   DM.Qr.SQL.Add('order by b.Names');
   DM.Qr.Open;
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(False,0,0);
   PrintRep.PreView;

{
 2-прочее
 1-наружн.
 0-внутр.
}
  except
   on E:Exception do MainF.MessBox('Ошибка формирования печатной формы накладной: '+E.Message);
  end;
 end;

procedure TViewNaklF.BitBtn7Click(Sender:TObject);
var Ex:Boolean;
 begin
  try
   PrintMarkBoxF:=TPrintMarkBoxF.Create(Self);
   try
    PrintMarkBoxF.Flag:=1;
    PrintMarkBoxF.CreateList(Ex);
    Application.ProcessMessages;
    if Ex=False then PrintMarkBoxF.ShowModal;
   finally
    PrintMarkBoxF.Free;
   end;
  except
   MainF.MessBox(ER_CR_FORM);
  end;
 end;

procedure TViewNaklF.N1Click(Sender: TObject);
 begin
  if Sender=nil then Exit;
  if DM.qrShowNakl.IsEmpty then Exit;
  PrintCen(TControl(Sender).Tag);
 end;

procedure TViewNaklF.CheckBox2Click(Sender: TObject);
 begin
  if CheckBox2.Checked=False then
   begin
    BitBtn2.Caption:='Печать ценников';
    BitBtn8.Caption:='Печать ценников по новому приходу';
   end else begin
             BitBtn2.Caption:='Печать стикеров';
             BitBtn8.Caption:='Печать стикеров по новому приходу';
            end;
 end;

procedure TViewNaklF.BitBtn9Click(Sender: TObject);
var Tb:TTableObj;
begin
  if DM.spY_NaklList.IsEmpty then Exit;
  try
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=5;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.Align:=AL_CENTER;
   PrintRep.AddText('Акт о несоответствии принимаемого товара'#10);
   PrintRep.AddText(Prm.FirmNameRU+'                    от '+DateToStr(Date)+#10);
   PrintRep.AddText('во время передачи товаров представителями торговой точки '+Prm.AptekaNameRU+#10);
   PrintRep.AddText('установили следующие несоответсвия передаваемого товара с данными по накладной '+DM.spY_NaklList.FieldByName('nn_nakl').AsString+' от '+DM.spY_NaklList.FieldByName('date_nakl').AsString+#10#10);
   PrintRep.Align:=AL_LEFT;

   PrintRep.AddText('Излишек'#10);
   PrintRep.Font.Size:=4;
   PrintRep.Font.Style:=[];
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('if Object_ID(N''tempdb..#akt'') is not null drop table #akt');
   DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_700],');
   DM.Qr.SQL.Add('       a.art_code as [Код_I_1300],');
   DM.Qr.SQL.Add('       a.names as [Наименование_S_6000],');
   DM.Qr.SQL.Add('       a.kol as [Кол-во_I_1300],');
   DM.Qr.SQL.Add('       b.kolscan as [Отскан_I_1300],');
   DM.Qr.SQL.Add('       Abs(a.kol-IsNull(b.kolscan,0)) as [Разн_I_1300],');
   DM.Qr.SQL.Add('       a.cena as [Цена_N_1300],');
   DM.Qr.SQL.Add('       a.cena*Abs(a.kol-IsNull(b.kolscan,0)) as [Сумма_N_1300],');
   DM.Qr.SQL.Add('       c.Users as [Приемщик_S_4000]');
   DM.Qr.SQL.Add('into #akt');
   DM.Qr.SQL.Add('from  (select m.nn_nakl,m.date_nakl,s.art_code,s.names,Sum(m.kol) as kol,m.cena from Moves m, SprTov s where m.kod_name=s.kod_name and m.nn_nakl='''+DM.spY_NaklList.FieldByName('nn_nakl').AsString+''' and m.date_nakl='''+FormatDateTime('yyyy-mm-dd',DM.spY_NaklList.FieldByName('date_nakl').AsDateTime)+' 00:00:00'' group by m.nn_nakl,m.date_nakl,s.art_code,s.names,m.cena) a ');
   DM.Qr.SQL.Add('      left join ScanNakl b on a.art_code=b.art_code and a.nn_nakl=b.nn_nakl and a.date_nakl=b.date_nakl left join SprUser c on b.id_user=c.id');
   DM.Qr.SQL.Add('where a.kol<IsNull(b.kolscan,0)');
   DM.Qr.SQL.Add('order by 3');

   DM.Qr.SQL.Add('if (select Count(*) from #akt)>0');
   DM.Qr.SQL.Add(' insert into #akt([№ пп._S_700],[Наименование_S_6000],[Сумма_N_1300]) ');
   DM.Qr.SQL.Add(' select '''',''Итого'',Sum(a.cena*Abs(a.kol-IsNull(b.kolscan,0))) ');
   DM.Qr.SQL.Add(' from  (select m.nn_nakl,m.date_nakl,s.art_code,s.names,Sum(m.kol) as kol,m.cena from Moves m, SprTov s where m.kod_name=s.kod_name and m.nn_nakl='''+DM.spY_NaklList.FieldByName('nn_nakl').AsString+''' and m.date_nakl='''+FormatDateTime('yyyy-mm-dd',DM.spY_NaklList.FieldByName('date_nakl').AsDateTime)+' 00:00:00'' group by m.nn_nakl,m.date_nakl,s.art_code,s.names,m.cena) a ');
   DM.Qr.SQL.Add('       left join ScanNakl b on a.art_code=b.art_code and a.nn_nakl=b.nn_nakl and a.date_nakl=b.date_nakl left join SprUser c on b.id_user=c.id');
   DM.Qr.SQL.Add(' where a.kol<IsNull(b.kolscan,0)');
   DM.Qr.SQL.Add('select * from #akt order by 1 desc,3');
   DM.Qr.Open;

   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(False,0,0);

   PrintRep.Font.Size:=5;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.AddText(#10#10'Недостача'#10);
   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Size:=4;
   PrintRep.Font.Style:=[];

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('if Object_ID(N''tempdb..#akt'') is not null drop table #akt');
   DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_700],');
   DM.Qr.SQL.Add('       a.art_code as [Код_I_1300],');
   DM.Qr.SQL.Add('       a.names as [Наименование_S_6000],');
   DM.Qr.SQL.Add('       a.kol as [Кол-во_I_1300],');
   DM.Qr.SQL.Add('       b.kolscan as [Отскан_I_1300],');
   DM.Qr.SQL.Add('       Abs(a.kol-IsNull(b.kolscan,0)) as [Разн_I_1300],');
   DM.Qr.SQL.Add('       a.cena as [Цена_N_1300],');
   DM.Qr.SQL.Add('       a.cena*Abs(a.kol-IsNull(b.kolscan,0)) as [Сумма_N_1300],');
   DM.Qr.SQL.Add('       c.Users as [Приемщик_S_4000]');
   DM.Qr.SQL.Add('into #akt');
   DM.Qr.SQL.Add('from  (select m.nn_nakl,m.date_nakl,s.art_code,s.names,Sum(m.kol) as kol,m.cena from Moves m, SprTov s where m.kod_name=s.kod_name and m.nn_nakl='''+DM.spY_NaklList.FieldByName('nn_nakl').AsString+''' and m.date_nakl='''+FormatDateTime('yyyy-mm-dd',DM.spY_NaklList.FieldByName('date_nakl').AsDateTime)+' 00:00:00'' group by m.nn_nakl,m.date_nakl,s.art_code,s.names,m.cena) a ');
   DM.Qr.SQL.Add('      left join ScanNakl b on a.art_code=b.art_code and a.nn_nakl=b.nn_nakl and a.date_nakl=b.date_nakl left join SprUser c on b.id_user=c.id');
   DM.Qr.SQL.Add('where a.kol>IsNull(b.kolscan,0)');
   DM.Qr.SQL.Add('order by 3');

   DM.Qr.SQL.Add('if (select Count(*) from #akt)>0');
   DM.Qr.SQL.Add(' insert into #akt([№ пп._S_700],[Наименование_S_6000],[Сумма_N_1300]) ');
   DM.Qr.SQL.Add(' select '''',''Итого'',Sum(a.cena*Abs(a.kol-IsNull(b.kolscan,0))) ');
   DM.Qr.SQL.Add(' from  (select m.nn_nakl,m.date_nakl,s.art_code,s.names,Sum(m.kol) as kol,m.cena from Moves m, SprTov s where m.kod_name=s.kod_name and m.nn_nakl='''+DM.spY_NaklList.FieldByName('nn_nakl').AsString+''' and m.date_nakl='''+FormatDateTime('yyyy-mm-dd',DM.spY_NaklList.FieldByName('date_nakl').AsDateTime)+' 00:00:00'' group by m.nn_nakl,m.date_nakl,s.art_code,s.names,m.cena) a ');
   DM.Qr.SQL.Add('       left join ScanNakl b on a.art_code=b.art_code and a.nn_nakl=b.nn_nakl and a.date_nakl=b.date_nakl left join SprUser c on b.id_user=c.id');
   DM.Qr.SQL.Add(' where a.kol>IsNull(b.kolscan,0)');
   DM.Qr.SQL.Add('select * from #akt order by 1 desc,3');
   DM.Qr.Open;

   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(False,0,0);

   PrintRep.Font.Size:=5;
   PrintRep.AddText(#10#10'Представитель торговой точки '+Prm.UserName+#10);

   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования печатной формы: '+E.Message);
  end;
end;

procedure TViewNaklF.DBGrid2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key in K_ARROW_KEYS then FSr:='';
  if Key=VK_RETURN then DBGrid2DblClick(Sender);
 end;

procedure TViewNaklF.DBGrid2KeyPress(Sender: TObject; var Key: Char);
var db:TDBGrid;
    NC:Integer;
    IsFind:Boolean;
begin
  if Sender=nil then Exit;
  if DM.spY_NaklList.IsEmpty then Exit;
  if DM.qrShowNakl.IsEmpty then Exit;
  if Copy(DM.spY_NaklList.FieldByName('nn_nakl').AsString,2,3)='пр-' then Exit;
  if Key in CH_DIGIT then
   begin
    FSr:=FSr+Key;
    FSr:=MainF.FindEAN13(TDBGrid(Sender),FSr,SC_MOVES,1,IsFind,DM.spY_NaklList.FieldByName('iddoc').AsInteger);
    if isFind then EnterKol(DM.qrShowNakl.FieldByName('art_code').AsInteger,0);
   end;
end;

procedure TViewNaklF.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var Kol,Pr:Integer;
    db:TDBGrid;
begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  Kol:=db.DataSource.DataSet.FieldByName('Kol').AsInteger;
  pr:=db.DataSource.DataSet.FieldByName('IsScan').AsInteger;
  if pr<>0 then
   begin
    if (gdSelected in State) and (DataCol=2) then
     begin
      db.Canvas.Brush.Color:=clNavy;
      db.Canvas.Font.Color:=clWhite;
     end else begin
               if Kol=Pr then db.Canvas.Brush.Color:=clLime else
               if Pr<Kol then db.Canvas.Brush.Color:=clYellow
                         else db.Canvas.Brush.Color:=$008080FF;
               db.Canvas.Font.Color:=clBlack;
              end;
    db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
   end;
end;

procedure TViewNaklF.DBGrid2DblClick(Sender: TObject);
begin
  try
   if DM.qrShowNakl.IsEmpty then Exit;
   EnterKol(DM.qrShowNakl.FieldByName('Art_Code').AsInteger,1);
  except
   on E:Exception do MainF.MessBox('Ошибка записи в журнал сканирования накладных: '+E.Message);
  end;
end;

procedure TViewNaklF.EnterKol(AC:Integer; P:Byte);
var Kol,Kol1,TP:Integer;
    IsOne:Boolean;
    nn_nakl:String;
    datenakl:TDateTime;
begin

  if DM.qrShowNakl.IsEmpty then Exit;
  if CheckMarked=False then Exit;

  DM.Qr6.Close;
  DM.Qr6.SQL.Text:='select dbo.GetKoefUpak('+IntToStr(AC)+') as Koef';
  DM.Qr6.Open;

  IsOne:=DM.qrShowNakl.FieldByName('Priznak').AsInteger=18;

  EnterKolScanF:=TEnterKolScanF.Create(Self);
  try
   Kol:=DM.Qr6.FieldByName('Koef').AsInteger;
   EnterKolScanF.Label2.Caption:=DM.qrShowNakl.FieldByName('Names').AsString;
   Kol1:=DM.qrShowNakl.FieldByName('Kol').AsInteger-DM.qrShowNakl.FieldByName('IsScan').AsInteger;
   if Kol1<0 then Kol1:=0;

   if IsOne then
    begin
     EnterKolScanF.edKol.Text:='1';
     EnterKolScanF.edKol.Enabled:=False;
    end else begin
              if Kol<Kol1 then
               EnterKolScanF.edKol.Text:=IntToStr(Kol)
              else
               EnterKolScanF.edKol.Text:=IntToStr(Kol1);
             end;

   if P=1 then
    begin
     EnterKolScanF.cbHand.Checked:=True;
     EnterKolScanF.cbHand.Enabled:=False;
    end;

   Application.ProcessMessages;
   EnterKolScanF.ShowModal;
   if EnterKolScanF.Flag<>1 then Exit;

   Kol:=StrToInt(EnterKolScanF.edKol.Text);
   if P=1 then TP:=3 else
    begin
     TP:=1;
     if EnterKolScanF.cbHand.Checked then TP:=2;
    end;

   DM.Qr6.Close;
   DM.Qr6.SQL.Clear;

   if rbPr.Checked=False then
    begin
     DM.Qr6.SQL.Add('declare @rowid int, @kol int');

     DM.Qr6.SQL.Add('set @kol=IsNull((select Sum(IsScan)');
     DM.Qr6.SQL.Add('from rTovar a ');
     DM.Qr6.SQL.Add('      inner join ');
     DM.Qr6.SQL.Add('     SprTov b on a.kod_name=b.kod_name ');
     DM.Qr6.SQL.Add('where b.art_Code='+DM.qrShowNakl.FieldByName('Art_Code').AsString);
     DM.Qr6.SQL.Add('      and a.iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString+'),0)');

     DM.Qr6.SQL.Add('update a set IsScan=0');
     DM.Qr6.SQL.Add('from rTovar a, SprTov b');
     DM.Qr6.SQL.Add('where a.kod_name=b.kod_name and b.art_Code='+DM.qrShowNakl.FieldByName('Art_Code').AsString);
     DM.Qr6.SQL.Add('      and a.iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString);

     DM.Qr6.SQL.Add('set @rowid=(select top 1 a.id from rTovar a, SprTov b ');
     DM.Qr6.SQL.Add('where a.kod_name=b.kod_name and b.art_Code='+DM.qrShowNakl.FieldByName('Art_Code').AsString);
     DM.Qr6.SQL.Add('      and a.iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString+')');
     DM.Qr6.SQL.Add('');
     DM.Qr6.SQL.Add(' update rTovar set IsScan=@kol+'+IntToStr(Kol)+' where id=@rowid');
     DM.Qr6.SQL.Add(' update rTovar set DateScan=getdate(),id_user='+IntToStr(Prm.UserID)+',prscan='+IntToStr(TP));
     DM.Qr6.SQL.Add(' where iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString+' and kod_name in (select kod_name from SprTov (nolock) where art_code='+DM.qrShowNakl.FieldByName('Art_Code').AsString+')');

    end else begin
              nn_nakl:=DM.spY_NaklList.FieldByName('nn_nakl').AsString;
              datenakl:=DM.spY_NaklList.FieldByName('date_nakl').AsDateTime;
              DM.Qr6.SQL.Add('declare @ks int');
              DM.Qr6.SQL.Add('set @ks=IsNull((select Sum(KolScan) from ScanNakl where nn_nakl='''+nn_nakl+''' and date_nakl='''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'' and art_code='+IntToStr(AC)+'),0)');
              DM.Qr6.SQL.Add('delete from ScanNakl where nn_nakl='''+nn_nakl+''' and date_nakl='''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'' and art_code='+IntToStr(AC));
              DM.Qr6.SQL.Add('insert into ScanNakl(nn_nakl,date_nakl,art_code,kolscan,typescan,id_user) values(');
              DM.Qr6.SQL.Add(''''+nn_nakl+''',');
              DM.Qr6.SQL.Add(''''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'',');
              DM.Qr6.SQL.Add(IntToStr(AC)+',');
              DM.Qr6.SQL.Add(IntToStr(Kol)+'+@ks,');
              DM.Qr6.SQL.Add(IntToStr(TP)+',');
              DM.Qr6.SQL.Add(IntToStr(Prm.UserID)+')');
              //   DM.Qr6.SQL.SaveToFile('c:\scan.txt');
    end;
   DM.Qr6.ExecSQL;

  finally
   FSr:='';
   EnterKolScanF.Free;
   NaklList(0);
  end;
end;

procedure TViewNaklF.pm11Click(Sender: TObject);
begin
  if DM.qrShowNakl.IsEmpty then Exit;
  if CheckMarked=False then Exit;

  if MainF.MessBox('Вы действительно хотите очистить строку?',52)<>ID_YES then Exit;
  try
   DM.Qr6.Close;
   DM.Qr6.SQL.Clear;
   if rbPr.Checked=False then
    begin
     DM.Qr6.SQL.Add('update a set IsScan=0, Shtrih=null ');
     DM.Qr6.SQL.Add('from rTovar a, SprTov b ');
     DM.Qr6.SQL.Add('where a.kod_name=b.kod_name and b.art_Code='+DM.qrShowNakl.FieldByName('Art_Code').AsString);
     DM.Qr6.SQL.Add('      and a.iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString);
    end else begin
              DM.Qr6.SQL.Add('delete from ScanNakl');
              DM.Qr6.SQL.Add('where flag is null and art_Code='+DM.qrShowNakl.FieldByName('Art_Code').AsString);
              DM.Qr6.SQL.Add('      and nn_nakl='''+DM.spY_NaklList.FieldByName('nn_nakl').AsString+''' ');
              DM.Qr6.SQL.Add('      and date_nakl='''+FormatDateTime('yyyy-mm-dd',DM.spY_NaklList.FieldByName('date_nakl').AsDateTime)+''' ');
             end;
   DM.Qr6.ExecSQL;
   NaklList(0);
  except
   on E:Exception do MainF.MessBox('Ошибка очистки строки: '+E.Message);
  end;
end;

function TViewNaklF.CheckMarked:Boolean;
begin
  Result:=False;
  if Not (DM.spY_NaklList.FieldByName('idpriznak').AsInteger in [4,5,6]) then
   begin
    Result:=True;
    Exit;
   end;

  if DM.spY_NaklList.FieldByName('Marked').AsInteger=1 then
   begin
    MainF.MessBox('Возврат уже помечен как отсканированный. Любые операции по пересканировке и перезакрытию ящиков запрещены!');
    Result:=False;
   end else Result:=True;
end;

procedure TViewNaklF.bbCloseBoxClick(Sender:TObject);
var Num,NumBox:String;
begin
  try
   if DM.spY_NaklList.IsEmpty then Exit;
   if CheckMarked=False then Exit;

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select top 1 shtrih from Moves where IsNull(IsScan,0)>0 and IsNull(Shtrih,0)=0 and iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString;
   DM.Qr.Open;

   if DM.Qr.IsEmpty then begin MainF.MessBox('Нет незакрытых ящиков!'); Exit; end;
   if MainF.MessBox('Вы действительно хотите закрыть ящик?',52)<>ID_YES then Exit;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('declare @ida varchar(5), @num bigint, @numfull varchar(20) ');
   DM.Qr.SQL.Add('set @ida=(select Value from Spr_const where Descr=''ID_APTEKA'') ');
   DM.Qr.SQL.Add('set @num=IsNull((select convert(bigint,Value) from Spr_const where Descr=''NumBox''),0)+1 ');
   DM.Qr.SQL.Add('select ''2''+replicate(''0'',6-len(convert(varchar,@num)))+convert(varchar,@num)+replicate(''0'',3-len(convert(varchar(3),@ida)))+@ida+''01'' as NumBox, @num as  Num');
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Abort;

   Num:=DM.Qr.FieldByName('Num').AsString;
   NumBox:=DM.Qr.FieldByName('NumBox').AsString;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('update rTovar set shtrih='+NumBox+' where IsNull(IsScan,0)>0 and IsNull(Shtrih,0)=0 and iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString);
   DM.Qr.SQL.Add('update rTovar set shtrih=(select Max(shtrih) from rTovar m (nolock), SprTov s (nolock) where m.iddoc=a.iddoc and IsNull(Shtrih,0)>0 and m.kod_name=s.kod_name and s.art_code=b.art_code) ');
   DM.Qr.SQL.Add('from rTovar a (nolock), SprTov b (nolock) ');
   DM.Qr.SQL.Add('where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString);

   DM.Qr.SQL.Add('delete from Spr_Const where Descr=''NumBox'' ');
   DM.Qr.SQL.Add('insert into Spr_Const(Descr,Value) values(''NumBox'','''+Num+''') ');

   DM.Qr.ExecSQL;
   NaklList(0);

  except
   on E:Exception do MainF.MessBox('Ошибка закрытия ящика: '+E.Message);
  end;
end;

procedure TViewNaklF.BitBtn10Click(Sender: TObject);
var Res:String;
begin
  if DM.spY_NaklList.IsEmpty then Exit;

  DM.Qr.Close;
  DM.Qr.SQL.Text:='select top 1 shtrih from Moves where IsNull(IsScan,0)>0 and IsNull(Shtrih,0)=0 and iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString;
  DM.Qr.Open;
  if DM.Qr.IsEmpty=False then begin MainF.MessBox('Сначала нужно закрыть ящик!'); Exit; end;

  if MainF.MessBox('Вы действительно хотите пометить накладную "'+DM.spY_NaklList.FieldByName('nn_nakl').AsString+'" как отсканированную?'#10#10+
                   'Эту кнопку нужно нажимать после того как вы отсканировали накладную и закрыли все ящики!!!',
                   52,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res)<>ID_YES then Exit;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('update JMoves set Marked=1 where iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString);
   DM.Qr.ExecSQL;

   NaklList(0);
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику накладных: '+E.Message);
  end;

end;

procedure TViewNaklF.N3Click(Sender: TObject);
begin
  if DM.spY_NaklList.IsEmpty then Exit;
  if Not MainF.CheckPassword('2726011013') then Exit;
  DM.Qr.Close;
  DM.Qr.SQL.Text:='update Jmoves set Marked=null where iddoc=:iddoc';
  DM.Qr.Parameters.ParamByName('iddoc').Value:=DM.spY_NaklList.FieldByName('iddoc').AsInteger;
  DM.Qr.ExecSQL;
  BitBtn5Click(BitBtn5);
end;

procedure TViewNaklF.bbVzrClick(Sender: TObject);
begin
  if DM.spY_NaklList.IsEmpty then Exit;
  VozrPartF:=TVozrPartF.Create(Self);
  try
   VozrPartF.iddoc:=DM.spY_NaklList.FieldByName('iddoc').AsInteger;
   VozrPartF.ShowModal;
  finally
   VozrPartF.Free;
  end;
end;

procedure TViewNaklF.BitBtn11Click(Sender: TObject);
//var
//  psw: string;
begin
//  psw:='';
////  if (DM.spY_NaklList.Active) and (DM.spY_NaklList.FieldByName('Date_Nakl').Value < Date() - 3) then
////  begin
//    with aTmp do
//    begin
//      SQL.Clear;
//      SQL.Add('select passw,dtend from sprprvozr where id=27');
//      Open;
//    end;
//    if aTmp.FieldByName('dtend').Value>date() then psw:=aTmp.FieldByName('passw').Value;
//    if Not MainF.CheckPassword(psw) then Exit;
////  end;


  if (not rbPr.Checked)and(DM.spY_NaklList.RecordCount<=0) then exit;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='exec spY_CheckNaklSklad '+DM.spY_NaklList.FieldByName('iddoc').AsString;
  DM.QrEx.Open;
  if DM.QrEx.FieldByName('Res').AsInteger=0 then
   begin
    MainF.MessBox('По данной накладной возврат поставщику делать нельзя!');
    Exit;
   end;

  ReturnToProviderF:=TReturnToProviderF.Create(self);
  try
//    ReturnToProviderF.Position:=poMainFormCenter;
//
    if not ViewNaklF.ADOQuery1.FieldByName('nn_nakl').IsNull then ReturnToProviderF.lbIntern_NN_Nakl.Caption:=ViewNaklF.ADOQuery1.FieldByName('nn_nakl').AsString else ReturnToProviderF.lbIntern_NN_Nakl.Caption:='';
    if not ViewNaklF.ADOQuery1.FieldByName('date_nakl').IsNull then ReturnToProviderF.lbIntern_Date_Nakl.Caption:=ViewNaklF.ADOQuery1.FieldByName('date_nakl').AsString else ReturnToProviderF.lbIntern_Date_Nakl.Caption:='';
    if not ViewNaklF.ADOQuery1.FieldByName('descr').IsNull then ReturnToProviderF.lbProviderName.Caption:=ViewNaklF.ADOQuery1.FieldByName('descr').AsString else ReturnToProviderF.lbProviderName.Caption:='';
    if not ViewNaklF.ADOQuery1.FieldByName('nn_prih').IsNull then ReturnToProviderF.lbProviderOrderNumb.Caption:=ViewNaklF.ADOQuery1.FieldByName('nn_prih').AsString else ReturnToProviderF.lbProviderOrderNumb.Caption:='';
    if not ViewNaklF.ADOQuery1.FieldByName('dt_prih').IsNull then ReturnToProviderF.lbProviderOrderDate.Caption:=ViewNaklF.ADOQuery1.FieldByName('dt_prih').AsString else ReturnToProviderF.lbProviderOrderDate.Caption:='';
    if not ViewNaklF.ADOQuery1.FieldByName('iddoc').IsNull then ReturnToProviderF.IDDoc:=ViewNaklF.ADOQuery1.FieldByName('iddoc').AsInteger else ReturnToProviderF.IDDoc:=0;

    ReturnToProviderF.ShowModal;
  finally
    ReturnToProviderF.Free;
  end;
end;

procedure TViewNaklF.CheckBox4Click(Sender: TObject);
 begin
  BitBtn5Click(Sender);
 end;

procedure TViewNaklF.BitBtn12Click(Sender: TObject);
var
  Tb:TTableObj;
  code_name: integer;
  rec_count: integer;
  i: integer;
  p_nds: double;
  summa_vozvrata: double;
  summa_nds: double;
  kol_naim: Integer;
  kol_upak: double;
  str: string;

const
  underlines = '_____________________';
  Guaranie = 'Гарантуємо, що усі лікарскі засоби, що вказані в цій накладній упродовж усього періоду знаходження в аптеці зберігалися у відповідності з умовами зберігання, затвердженими виробником.';
  responsible='Уповноважена особа:';
  sign1 = '(П.І.Б.)';
  sign = 'Підпис:';
  releaser = 'Відпустив:';
  goter = 'Прийняв:';
  white_spaces='                               ';
begin
  try
    PrintRep.Clear;
    PrintRep.SetDefault;
    PrintRep.Font.Name:='Arial'; PrintRep.Font.Size:=4; PrintRep.Font.Style:=[];
    PrintRep.Orientation:=O_PORTR; PrintRep.PageSize:=PF_A4; PrintRep.Align:=AL_LEFT;

    PrintRep.Font.Size:=7; PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(Prm.FirmNameUA+#10);
    PrintRep.AddText('______________________________________________________'+#10);

    PrintRep.Font.Size:=4; PrintRep.Font.Style:=[]; PrintRep.Align:=AL_LEFT;

    PrintRep.AddText(#10);
    PrintRep.AddTable(2,4);
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('700,1500'); Tb.SetBorders(1,1,2,4,EMPTY_BORDER);

    with ADOQuery2 do
    begin
      SQL.Clear;
      SQL.Add('declare @id_firm int set @id_firm = :id_firm');
      SQL.Add('select * from SPRFIRMS (nolock) where id_firm=@id_firm');
      Parameters.Clear;
      Parameters.CreateParameter('id_firm',ftInteger,pdInput,10,Prm.FirmID);
      Open;
    end;

    Tb.Cell[2,1].Font.Style:=[]; Tb.Cell[2,1].AddText('р/р ');
    Tb.Cell[2,1].Font.Style:=[fsBold,fsUnderline];
    if not ADOQuery2.FieldByName('r_r').IsNull then Tb.Cell[2,1].AddText(ADOQuery2.FieldByName('r_r').Value+' ') else Tb.Cell[2,1].AddText(underlines+' ');

    Tb.Cell[2,1].Font.Style:=[fsBold,fsUnderline];
    if not ADOQuery2.FieldByName('bank').IsNull then Tb.Cell[2,1].AddText(ADOQuery2.FieldByName('bank').Value+'; ') else Tb.Cell[2,1].AddText(underlines+'; ');

    Tb.Cell[2,1].Font.Style:=[]; Tb.Cell[2,1].AddText('МФО ');
    Tb.Cell[2,1].Font.Style:=[fsBold,fsUnderline];
    if not ADOQuery2.FieldByName('mfo').IsNull then Tb.Cell[2,1].AddText(ADOQuery2.FieldByName('mfo').Value+'; ') else Tb.Cell[2,1].AddText(underlines+'; ');

    Tb.Cell[2,1].Font.Style:=[]; Tb.Cell[2,1].AddText('Код ОКПО ');
    Tb.Cell[2,1].Font.Style:=[fsBold,fsUnderline];
    if not ADOQuery2.FieldByName('okpo').IsNull then Tb.Cell[2,1].AddText(ADOQuery2.FieldByName('okpo').Value+#10) else Tb.Cell[2,1].AddText(underlines+#10);

    with ADOQuery1 do
    begin
      SQL.Clear;
      SQL.Add('select * from SPRFIRMS (nolock) where DescrUA=:firm');
      Parameters.Clear;
      Parameters.CreateParameter('firm',ftString,pdInput,100,Prm.FirmNameUA);
      Open;
    end;

    Tb.Cell[2,2].AddText('Юридична адреса: '+ADOQuery1.FieldByName('SkladAdress').Value+#10);
    Tb.Cell[2,3].AddText('Фактична адреса: '+Prm.aAdress+#10);
//    Tb.Cell[2,4].AddText('Телефон: '+underlines+#10);

//    PrintRep.AddText(#10+'Накладна на повернення № '); PrintRep.Font.Style:=[fsUnderline]; PrintRep.AddText(' '+DM.spY_NaklList.FieldByName('nn_nakl').Value+' '+#10);
    PrintRep.AddText(#10+'Накладна на повернення № '); PrintRep.Font.Style:=[fsUnderline]; PrintRep.AddText(' '+DM.spY_NaklList.FieldByName('nn_nakl').Value+'-'+IntToStr(Prm.AptekaID)+' '+#10);
//    PrintRep.Font.Style:=[]; PrintRep.AddText('від '+underlines+#10);

    if (assigned(ViewNaklF))and(ViewNaklF.Showing) then
      ReturnList(ViewNaklF,ADOQuery1);
    ADOQuery1.First;

    PrintRep.Align:=AL_CENTER;
    PrintRep.AddText(#10+'за накладною № ');
    if not ADOQuery1.FieldByName('id_postav').IsNull then
    begin
      if not ADOQuery1.FieldByName('nn_prih').IsNull then
      begin
        PrintRep.Font.Style:=[fsUnderline];
        PrintRep.AddText(' '+ADOQuery1.FieldByName('nn_prih').Value+' ');
      end
      else
        PrintRep.AddText(' '+underlines+' ');
      PrintRep.Font.Style:=[]; PrintRep.AddText(' від '); PrintRep.Font.Style:=[fsUnderline];
      if not ADOQuery1.FieldByName('dt_prih').IsNull then
        PrintRep.AddText(' '+FormatDateTime('DD.MM.YYYY',ADOQuery1.FieldByName('dt_prih').Value)+' '+#10+#10)
      else
        PrintRep.AddText(' '+underlines+' '+#10+#10)
    end
    else
    begin
      PrintRep.Font.Style:=[]; PrintRep.AddText(' '+underlines+'  від  '+underlines+' '+#10+#10);
    end;

    PrintRep.Align:=AL_LEFT;
    PrintRep.Font.Style:=[]; PrintRep.AddText('Від кого: '); PrintRep.Font.Style:=[fsBold,fsUnderline]; PrintRep.AddText(' '+Prm.FirmNameUA+' '+#10);
    PrintRep.Font.Style:=[]; PrintRep.AddText('Кому: '); PrintRep.Font.Style:=[fsBold,fsUnderline];
    if not ADOQuery1.FieldByName('descr').IsNull then PrintRep.AddText(ADOQuery1.FieldByName('descr').Value+#10) else PrintRep.AddText(underlines+#10);
    PrintRep.Font.Style:=[]; PrintRep.AddText('Адреса: '); PrintRep.Font.Style:=[fsBold,fsUnderline];

//    if not ADOQuery1.FieldByName('Address').IsNull then PrintRep.AddText(ADOQuery1.FieldByName('Address').Value+#10) else PrintRep.AddText(underlines+#10); //строка будет возвращена после сопоставления ТТ с контрагентом (поставщиком)
    if not ADOQuery1.FieldByName('kontrAddress').IsNull then PrintRep.AddText(ADOQuery1.FieldByName('kontrAddress').Value+#10) else PrintRep.AddText(underlines+#10); //строка будет возвращена после сопоставления ТТ с контрагентом (поставщиком)
    //if not ADOQuery1.FieldByName('adres').IsNull then PrintRep.AddText(ADOQuery1.FieldByName('adres').Value+#10) else PrintRep.AddText(underlines+#10); //строка будет возвращена после сопоставления ТТ с контрагентом (поставщиком)
//    PrintRep.AddText(underlines+#10); //строка будет удалена  и заменена предыдущей после сопоставления ТТ с контрагентом (поставщиком)

    PrintRep.Font.Style:=[];
    PrintRep.AddText('Через кого: '+ADOQuery1.FieldByName('kontrAddress').AsString+#10);
    PrintRep.AddText('Довіреність № '+underlines+' серія '+underlines+' від '+underlines+#10);
    PrintRep.AddText('Згідно з договором '+#10+#10);

    //печать списка товаров к возврату
    rec_count:=0;

    rec_count:=ADOQuery1.RecordCount+1;
    PrintRep.AddTable(9,rec_count);
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('150,1200,225,375,375,375,375,375,600');
    Tb.SetBorders(1,1,9,1,Border(clBlack,4,psInsideFrame));
    Tb.Cell[1,1].Font.Style:=[fsBold]; Tb.Cell[1,1].Align:=AL_CENTER; Tb.Cell[1,1].AddText('№№');
    Tb.Cell[2,1].Font.Style:=[fsBold]; Tb.Cell[2,1].Align:=AL_CENTER; Tb.Cell[2,1].AddText('Найменування товару');
    Tb.Cell[3,1].Font.Style:=[fsBold]; Tb.Cell[3,1].Align:=AL_CENTER; Tb.Cell[3,1].AddText('Од.');
    Tb.Cell[4,1].Font.Style:=[fsBold]; Tb.Cell[4,1].Align:=AL_CENTER; Tb.Cell[4,1].AddText('Кількість упаковок');
    Tb.Cell[5,1].Font.Style:=[fsBold]; Tb.Cell[5,1].Align:=AL_CENTER; Tb.Cell[5,1].AddText('Ціна без ПДВ');
    Tb.Cell[6,1].Font.Style:=[fsBold]; Tb.Cell[6,1].Align:=AL_CENTER; Tb.Cell[6,1].AddText('Сума без ПДВ');
    Tb.Cell[7,1].Font.Style:=[fsBold]; Tb.Cell[7,1].Align:=AL_CENTER; Tb.Cell[7,1].AddText('Серія');
    Tb.Cell[8,1].Font.Style:=[fsBold]; Tb.Cell[8,1].Align:=AL_CENTER; Tb.Cell[8,1].AddText('Термін');
    Tb.Cell[9,1].Font.Style:=[fsBold]; Tb.Cell[9,1].Align:=AL_CENTER; Tb.Cell[9,1].AddText('Виробник');

    //вывод накладной
    i:=2;
    summa_vozvrata:=0;
    summa_nds:=0;
    kol_naim:=0;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
      //номер записи в накладной
      Tb.Cell[1,i].Align:=AL_RIGHT; Tb.Cell[1,i].AddText(IntToStr(i-1));
      //название возвращаемого препарата
      Tb.Cell[2,i].Align:=AL_CENTER; Tb.Cell[2,i].AddText(ADOQuery1.FieldByName('Names').Value);
      //единица измерения
//      Tb.Cell[3,i].Align:=AL_CENTER; Tb.Cell[3,i].AddText(ADOQuery1.FieldByName('EdName').Value);
      Tb.Cell[3,i].Align:=AL_CENTER; Tb.Cell[3,i].AddText('упак.');
      //количество упаковок. может быть дробным: количество возврата в накладной / коэффициент(количество единиц в упаковке)
      Tb.Cell[4,i].Align:=AL_CENTER; Tb.Cell[4,i].AddText(FloatToStr(StrToFloat(FloatToStrF(ADOQuery1.FieldByName('kol').Value/ADOQuery1.FieldByName('koef').Value,10,3))));
      //цена без ндс за единицу (не упаковка)
      case ADOQuery1.FieldByName('f_nds').Value of
        1: p_nds:=0.2;
        2: p_nds:=0.07;
      end;
      Tb.Cell[5,i].Align:=AL_CENTER; Tb.Cell[5,i].
      AddText(FloatToStr(RoundCurr(ADOQuery1.FieldByName('koef').Value*ADOQuery1.FieldByName('cenazakup').Value)));
//      AddText(FloatToStr(RoundCurr(ADOQuery1.FieldByName('koef').Value*ADOQuery1.FieldByName('cenazakup').Value*(1-p_nds))));
//      AddText(FloatToStr(RoundCurr(ADOQuery1.FieldByName('koef').Value*ADOQuery1.FieldByName('cena').Value*(1-p_nds))));
//      AddText(FloatToStr(RoundCurr(ADOQuery1.FieldByName('kol').Value/ADOQuery1.FieldByName('koef').Value*ADOQuery1.FieldByName('cena').Value*(1-p_nds))));
      //общая цена возвращаемого товара без НДС: количество единиц * цену без НДС за единицу
      Tb.Cell[6,i].Align:=AL_CENTER;
      Tb.Cell[6,i].AddText(CurrToStr(RoundCurr(ADOQuery1.FieldByName('kol').Value*(ADOQuery1.FieldByName('cenazakup').Value))));
//      Tb.Cell[6,i].AddText(CurrToStr(RoundCurr(ADOQuery1.FieldByName('kol').Value*(ADOQuery1.FieldByName('cenazakup').Value*(1-p_nds)))));
//      Tb.Cell[6,i].AddText(CurrToStr(RoundCurr(ADOQuery1.FieldByName('kol').Value*(ADOQuery1.FieldByName('cena').Value*(1-p_nds)))));

      Tb.Cell[7,i].Align:=AL_CENTER;
      if not ADOQuery1.FieldByName('NumSeriya').IsNull then Tb.Cell[7,i].AddText(ADOQuery1.FieldByName('NumSeriya').Value);
      Tb.Cell[8,i].Align:=AL_CENTER;
      if not ADOQuery1.FieldByName('SrokGodn').IsNull then Tb.Cell[8,i].AddText(FormatDateTime('DD/MM/YYYY',ADOQuery1.FieldByName('SrokGodn').Value));
      Tb.Cell[9,i].Align:=AL_CENTER;
      Tb.Cell[9,i].Font.Size:=3;
      Tb.Cell[9,i].AddText(ADOQuery1.FieldByName('Manufacturer').Value);
      //сумма возврата без НДС
      summa_vozvrata:=summa_vozvrata+ADOQuery1.FieldByName('kol').Value*(ADOQuery1.FieldByName('cenazakup').Value);
//      summa_vozvrata:=summa_vozvrata+ADOQuery1.FieldByName('kol').Value*(ADOQuery1.FieldByName('cenazakup').Value*(1-p_nds));
//      summa_vozvrata:=summa_vozvrata+ADOQuery1.FieldByName('kol').Value*(ADOQuery1.FieldByName('cena').Value*(1-p_nds));
      summa_nds:=summa_nds+ADOQuery1.FieldByName('kol').Value*(ADOQuery1.FieldByName('cenazakup').Value*p_nds);
//      summa_nds:=summa_nds+ADOQuery1.FieldByName('kol').Value*(ADOQuery1.FieldByName('cena').Value*p_nds);
      //количество наименований и количество упаковок
      kol_naim:=kol_naim+1;
      kol_upak:=kol_upak+ADOQuery1.FieldByName('kol').Value/ADOQuery1.FieldByName('koef').Value;

      i:=i+1;
      ADOQuery1.Next;
    end;

    PrintRep.AddText(#10);
    PrintRep.AddTable(3,5);
    PrintRep.Font.Style:=[fsBold];
    PrintRep.Align:=AL_RIGHT;
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('2325,375,1275');
    Tb.SetBorders(1,1,3,5,EMPTY_BORDER);//Border(clBlack,4,psSolid)
    Tb.Cell[1,1].Align:=AL_RIGHT; Tb.Cell[1,1].AddText('Сума без ПДВ '); Tb.Cell[2,1].Align:=AL_RIGHT; Tb.Cell[2,1].AddText(CurrToStr(RoundCurr(summa_vozvrata)));
    Tb.Cell[1,3].Align:=AL_RIGHT; Tb.Cell[1,3].AddText('Сума ПДВ '); Tb.Cell[2,3].Align:=AL_RIGHT; Tb.Cell[2,3].AddText(CurrToStr(RoundCurr(summa_nds)));
    Tb.Cell[1,5].Align:=AL_RIGHT; Tb.Cell[1,5].AddText('Сума з урахуванням ПДВ '); Tb.Cell[2,5].Align:=AL_RIGHT; Tb.Cell[2,5].AddText(CurrToStr(RoundCurr(summa_vozvrata+summa_nds)));

    PrintRep.Align:=AL_LEFT;
    PrintRep.Font.Style:=[]; PrintRep.AddText(#10+'Усього найменувань ');
    PrintRep.Font.Style:=[fsBold,fsUnderline]; PrintRep.AddText(IntToWordsUA(kol_naim,0)+#10);

    str:='';
    PrintRep.Font.Style:=[]; PrintRep.AddText('Загальна кількість ');
    PrintRep.Font.Style:=[fsBold,fsUnderline];
    str:=FloatToWordsUA(kol_upak,10,3);
    PrintRep.AddText(str); PrintRep.Font.Style:=[]; PrintRep.AddText(' упаковок(и)'+#10);

    PrintRep.AddText('На суму '); PrintRep.Font.Style:=[fsBold,fsUnderline];
    PrintRep.AddText(CurrToWordsUA(summa_vozvrata,1));
    PrintRep.Font.Style:=[]; PrintRep.AddText(' без ПДВ'+#10);

    PrintRep.AddText('ПДВ '); PrintRep.Font.Style:=[fsBold,fsUnderline]; PrintRep.AddText(CurrToWordsUA(summa_nds,1)+#10);

    PrintRep.Font.Style:=[]; PrintRep.AddText('На сумму '); PrintRep.Font.Style:=[fsBold,fsUnderline];
    PrintRep.AddText(CurrToWordsUA((summa_vozvrata+summa_nds),1));
    PrintRep.Font.Style:=[]; PrintRep.AddText(' з урахуванням ПДВ'+#10);

    //гарантия хранения
    PrintRep.Font.Style:=[fsBold]; PrintRep.AddText(#10+#10+Guaranie+#10);

    //подписи
    PrintRep.Font.Size:=4;
    PrintRep.Font.Style:=[];
    PrintRep.AddText(#10+responsible+' '+underlines+' '+' '+sign1+#10);
    PrintRep.AddText(#10+sign+underlines+#10);
    PrintRep.AddText(#10+#10+releaser+underlines+'(посада, П.І.Б.)'+white_spaces+goter+underlines+'(посада, П.І.Б.)'+#10);
    PrintRep.AddText(#10+sign+underlines+#10);
    PrintRep.AddText('                                                  Місце печатки');

    PrintRep.PreView;
  except
    on E:Exception do MainF.MessBox('Ошибка формирования печатной формы накладной: '+E.Message);
  end;
end;

procedure TViewNaklF.BitBtn14Click(Sender: TObject);
var
  Tb: TTableObj;
const
  underlines = '_____________________';
begin
  try
    PrintRep.Clear;
    PrintRep.SetDefault;
    PrintRep.Font.Name:='Arial'; PrintRep.Font.Size:=6; PrintRep.Font.Style:=[];
    PrintRep.PageSize:=PF_A4; PrintRep.Orientation:=O_PORTR; PrintRep.Align:=AL_LEFT;

    if (assigned(ViewNaklF))and(ViewNaklF.Showing) then
      ReturnList(ViewNaklF,ADOQuery1);
    PrintRep.AddTable(1,6);
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('2500');
    Tb.SetBorders(1,1,6,1,DEFAULT_BORDER);
    Tb.Cell[1,1].AddText('Возврат поставщику ');
    if not ADOQuery1.FieldByName('descr').IsNull then Tb.Cell[1,1].AddText(' '+ADOQuery1.FieldByName('descr').Value) else Tb.Cell[1,1].AddText(' '+underlines);
    if not ADOQuery1.FieldByName('kontrAddress').IsNull then Tb.Cell[1,1].AddText(' '+ADOQuery1.FieldByName('kontrAddress').Value+' '+#10) else Tb.Cell[1,1].AddText(' '+underlines+underlines+' '+#10);
    //if not ADOQuery1.FieldByName('adres').IsNull then Tb.Cell[1,1].AddText(' '+ADOQuery1.FieldByName('adres').Value+' '+#10) else Tb.Cell[1,1].AddText(' '+underlines+underlines+' '+#10);
    Tb.Cell[1,2].AddText('от '+Prm.FirmNameRU);
    Tb.Cell[1,3].AddText(Prm.AptekaNameRU);
    Tb.Cell[1,4].AddText('адрес: '+Prm.aAdress);
    Tb.Cell[1,5].AddText(ADOQuery1.FieldByName('nn_nakl').Value);
    Tb.Cell[1,6].AddText('признак: Возврат поставщику');
    PrintRep.AddText(#10);
    PrintRep.Font.Size:=8; PrintRep.Font.Style:=[fsBold]; PrintRep.Align:=AL_CENTER;
    PrintRep.AddText('ТОВАР НА СКЛАД НЕ ВОЗВРАЩАТЬ'+#10);
    PrintRep.Font.Size:=3; PrintRep.Font.Style:=[fsBold]; PrintRep.Align:=AL_LEFT; PrintRep.LeftIndent:=0; PrintRep.AddText(underlines+underlines+underlines+underlines+underlines+underlines+#10);

    PrintRep.PreView;
  except
    on E:Exception do MainF.MessBox('Ошибка формирования печатной формы накладной: '+E.Message);
  end;
end;

procedure TViewNaklF.BitBtn15Click(Sender: TObject);
var
  Tb: TTableObj;
  Rec_Count: integer;
  rec_no: integer;
  kol_return: double;
const
  underlines = '_____________________';
begin
  try
    PrintRep.Clear;
    PrintRep.SetDefault;
    PrintRep.Font.Name:='Arial'; PrintRep.Font.Size:=4; PrintRep.Font.Style:=[];
    PrintRep.PageSize:=PF_A4; PrintRep.Orientation:=O_PORTR; PrintRep.Align:=AL_LEFT;

    PrintRep.AddTable(2,1);
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('1000,1500');
    Tb.SetBorders(1,1,2,1,EMPTY_BORDER);

    if (assigned(ViewNaklF))and(ViewNaklF.Showing) then
      ReturnList(ViewNaklF,ADOQuery1);
    Tb.Cell[2,1].AddText('Завідувачу аптечним складом'+#10);
    if not ADOQuery1.FieldByName('descr').IsNull then Tb.Cell[2,1].AddText(ADOQuery1.FieldByName('descr').Value+#10) else Tb.Cell[2,1].AddText('№ '+underlines+#10+#10);
    if not ADOQuery1.FieldByName('kontrAddress').IsNull then Tb.Cell[2,1].AddText(' '+ADOQuery1.FieldByName('kontrAddress').Value+' '+#10) else Tb.Cell[2,1].AddText(' '+underlines+underlines+' '+#10);
    //if not ADOQuery1.FieldByName('adres').IsNull then Tb.Cell[2,1].AddText(' '+ADOQuery1.FieldByName('adres').Value+' '+#10) else Tb.Cell[2,1].AddText(' '+underlines+underlines+' '+#10);
//    if not ADOQuery1.FieldByName('Address').IsNull then Tb.Cell[2,1].AddText(' '+ADOQuery1.FieldByName('Address').Value+' '+#10) else Tb.Cell[2,1].AddText(' '+underlines+underlines+' '+#10);
    Tb.Cell[2,1].AddText(#10+underlines+underlines+#10);

    PrintRep.Align:=AL_CENTER;
    PrintRep.AddText(#10+#10+#10+'Гарантійний лист'+#10+#10);

    PrintRep.Align:=AL_LEFT;
    PrintRep.AddText('Цим листом я, '+underlines+underlines+' (П.І.Б.) '+underlines+' (посада) ');
    PrintRep.Font.Style:=[fsBold,fsUnderline]; PrintRep.AddText(Prm.AptekaNameUA+' '+Prm.aAdress);
    PrintRep.Font.Style:=[]; PrintRep.AddText(' (назва установи) ');
    PrintRep.AddText('підтверджую, що продукція, отримана згідно накладної № ');
    PrintRep.Font.Style:=[fsBold,fsUnderline];
    if not ADOQuery1.FieldByName('nn_prih').IsNull then PrintRep.AddText(ADOQuery1.FieldByName('nn_prih').Value) else PrintRep.AddText(underlines);
    PrintRep.Font.Style:=[];
    PrintRep.AddText(' від ');
    PrintRep.Font.Style:=[fsBold,fsUnderline];
    if not ADOQuery1.FieldByName('dt_prih').IsNull then PrintRep.AddText(FormatDateTime('DD.MM.YYYY',ADOQuery1.FieldByName('dt_prih').Value)+#10) else PrintRep.AddText(underlines+#10);
    PrintRep.AddText(#10);

    //список возврата поставщику (таблица)
    if (assigned(ViewNaklF))and(ViewNaklF.Showing) then
      ReturnList(ViewNaklF,ADOQuery1);
    Rec_Count:=ADOQuery1.RecordCount+1;
    PrintRep.Font.Style:=[];
    PrintRep.Align:=AL_CENTER;
    PrintRep.AddTable(4,Rec_Count);
    PrintRep.Font.Size:=4;
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('1000,1500,700,500');
    Tb.SetBorders(1,1,4,1,Border(clBlack,4,psInsideFrame));
    Tb.Cell[1,1].AddText('№ видаткової накладної');
    Tb.Cell[2,1].AddText('Найменування продукції');
    Tb.Cell[3,1].AddText('Серія');
    Tb.Cell[4,1].AddText('Термін придатності');
    Tb.SetBorders(1,2,4,Rec_Count,DEFAULT_BORDER);
    Tb.SetBorders(1,1,4,1,Border(clBlack,4,psInsideFrame));

    kol_return:=0;
    rec_no:=2;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin //nn_prih, dt_prih numseriya,SrokGodn
      if not ADOQuery1.FieldByName('nn_prih').IsNull then Tb.Cell[1,rec_no].AddText(ADOQuery1.FieldByName('nn_prih').Value);
      if not ADOQuery1.FieldByName('dt_prih').IsNull then Tb.Cell[1,rec_no].AddText(' від '+FormatDateTime('DD.MM.YYYY',ADOQuery1.FieldByName('dt_prih').Value));
      Tb.Cell[2,rec_no].AddText(ADOQuery1.FieldByName('names').Value);
      if not ADOQuery1.FieldByName('numseriya').IsNull then Tb.Cell[3,rec_no].AddText(ADOQuery1.FieldByName('numseriya').Value);
      if not ADOQuery1.FieldByName('SrokGodn').IsNull then Tb.Cell[4,rec_no].AddText(FormatDateTime('DD.MM.YYYY',ADOQuery1.FieldByName('SrokGodn').Value));
      kol_return:=kol_return+ADOQuery1.FieldByName('kol').Value/ADOQuery1.FieldByName('koef').Value;
      inc(rec_no);
      ADOQuery1.Next;
    end;

    PrintRep.Font.Style:=[];
    PrintRep.Align:=AL_LEFT;
    PrintRep.AddText(#10+' до моменту відправлення повернення згідно накладної № ');
    PrintRep.Font.Style:=[fsBold,fsUnderline];
//    PrintRep.AddText(ADOQuery1.FieldByName('nn_nakl').Value+' (№ накладної) ');
    PrintRep.AddText(ADOQuery1.FieldByName('nn_nakl').Value+'-'+IntToStr(Prm.AptekaID)+' (№ накладної) ');
    PrintRep.Font.Style:=[];
//    PrintRep.AddText(' від ');
//    PrintRep.Font.Style:=[fsBold,fsUnderline];
//    PrintRep.AddText(underlines);
//    PrintRep.Font.Style:=[];
//    PrintRep.AddText(' (дата накладної) ');
    PrintRep.AddText(' зберігалися при відповідній температурі та відносній вологості, що визначені виробником та зазначені на упаковці та в інструкції для медичного застосування.'+#10);
    PrintRep.AddText('Зазначену продукцію повертаю в кількості ');
    PrintRep.Font.Style:=[fsBold,fsItalic];
//    PrintRep.AddText(FloatToStr(StrToFloat(FloatToStrF(kol_return,10,3)))+' ('+FloatToWordsUA(kol_return,10,3)+') '+#10+#10+#10);
    PrintRep.AddText( FloatToStrF( kol_return,10,3 ) + ' (' + FloatToWordsUA( kol_return, 10, 3)+') '+#10+#10+#10 );

    PrintRep.Font.Style:=[];
    PrintRep.Align:=AL_CENTER;
    PrintRep.AddTable(3,1);
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('750,1500,750');
    Tb.SetBorders(1,1,3,1,EMPTY_BORDER);

//    Tb.Cell[1,1].Font.Size:=4;
//    Tb.Cell[1,1].AddText(underlines+#10);
//    Tb.Cell[1,1].Font.Size:=3;
//    Tb.Cell[1,1].AddText('(дата)');

    Tb.Cell[2,1].Font.Size:=4;
    Tb.Cell[2,1].AddText(underlines+#10);
    Tb.Cell[2,1].Font.Size:=3;
    Tb.Cell[2,1].AddText('(П.І.Б)');

    Tb.Cell[3,1].Font.Size:=4;
    Tb.Cell[3,1].AddText(underlines+#10);
    Tb.Cell[3,1].Font.Size:=3;
    Tb.Cell[3,1].AddText('(підпис)'+#10);
    Tb.Cell[3,1].Align:=AL_RIGHT;
    Tb.Cell[3,1].Font.Size:=4;
    Tb.Cell[3,1].AddText('Місце печатки');

    PrintRep.PreView;
  except
    on E:Exception do MainF.MessBox('Ошибка формирования печатной формы накладной: '+E.Message);
  end;
end;

procedure TViewNaklF.FormActivate(Sender: TObject);
begin
  rbPr.Checked:=true;
  rbVz.Checked:=false;
  BitBtn11.Enabled:=true;
  BitBtn12.Enabled:=false;
  BitBtn13.Enabled:=false;
  BitBtn15.Enabled:=false;
  BitBtn14.Enabled:=false;
  lblPostavschik.Caption:='';
  lblNaklNomber.Caption:='';
  lblNaklDate.Caption:='';

  if rbPr.Checked then
    CheckBox4.Caption:='Накладные от поставщика'
  else
    if rbVz.Checked then
      CheckBox4.Caption:='Накладные к поставщику';

    if DM.spY_NaklList.RecordCount<=0 then BitBtn11.Enabled:=false;

  CheckBox4Click(sender);
end;

procedure TViewNaklF.NaklAfterScroll(DataSet: TDataSet);
begin
  if (Assigned(ViewNaklF))and(ViewNaklF.Showing) then
  begin
    if (assigned(ViewNaklF))and(ViewNaklF.Showing) then
      ReturnList(ViewNaklF,ADOQuery1);
    if not ADOQuery1.FieldByName('descr').IsNull then lblPostavschik.Caption:=ADOQuery1.FieldByName('descr').Value else lblPostavschik.Caption:='';
    if not ADOQuery1.FieldByName('nn_prih').IsNull then lblNaklNomber.Caption:=ADOQuery1.FieldByName('nn_prih').Value else lblNaklNomber.Caption:='';
    if not ADOQuery1.FieldByName('dt_prih').IsNull then lblNaklDate.Caption:=ADOQuery1.FieldByName('dt_prih').Value else lblNaklDate.Caption:='';

    if not ADOQuery1.FieldByName('id_postav').IsNull then BitBtn11.Enabled:=true else BitBtn11.Enabled:=false;

    if rbVz.Checked then
      if ((DM.spY_NaklList.FieldByName('priznakI').AsInteger=27)or(DM.spY_NaklList.FieldByName('priznakI').AsInteger=5)) and (not ADOQuery1.FieldByName('id_postav').IsNull) then
//      if (DM.spY_NaklList.FieldByName('priznakI').AsInteger=27) then
      begin
        BitBtn12.Enabled:=true;
        BitBtn13.Enabled:=true;
        BitBtn15.Enabled:=true;
        BitBtn14.Enabled:=true;
      end
      else
      begin
        BitBtn12.Enabled:=false;
        BitBtn13.Enabled:=false;
        BitBtn15.Enabled:=false;
        BitBtn14.Enabled:=false;
      end;
  end;
end;

procedure TViewNaklF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.spY_NaklList.AfterScroll:=sp_Temp.AfterScroll;
  sp_Temp.Free;
end;

procedure TViewNaklF.N5Click(Sender: TObject);
begin
  if Not MainF.CheckPassword('0523574825') then Exit;
  if DM.qrShowNakl.IsEmpty then Exit;
  ListBackPartF:=TListBackPartF.Create(Self);
  try
    ListBackPartF.ShowModal;
    if ListBackPartF.Flag=1 then BitBtn5Click(BitBtn5);
  finally
    ListBackPartF.Free;
  end;
end;

procedure TViewNaklF.BitBtn13Click(Sender: TObject);
begin
  PrintActOfNonConformity;
end;

procedure TViewNaklF.PrintActOfNonConformity;
var
  Tb: TTableObj;
  iddoc: integer;
  f_nds: double;
  rec_count: integer;  //количество строк в таблице
  col_count: integer;  //количество колонок в таблице
  i, j: integer;
  row_no: integer; //номер строки в таблице возврата
  kol_return: string;//количество единиц каждой номенклатуры к возврату для отображения в соответствующей колонке причина возврата таблицы возвратов
  kol: array of double; //массив значений для строки ВСЕГО, ШТ.
  sum: array of currency; //массив значений для строки ВСЕГО, ГРН.
  sum_nds: array of currency;  //массив значений для строки ВСЕГО С НДС, ГРН.
  vz_deskr: string;
  kol_all: double;
  sum_all, sum_nds_all: currency;
const
  WHITE_SPACES='               ';
  UNDERLINES = '_____________________';
  GARANTIE = 'Гарантирую, что все лекарственные средства, указанные в этой накладной, на протяжении всего периода нахождения в аптеке хранились в соответствии с условиями хранения, утвержденными производителем.';
  FIXED_COLUMN_COUNT = 11;
  FIXED_RECORD_COUNT = 5;
  TABLE_HEADER: array[0..10] of string = ('№ п/п','Арткод','Наименование товара','Ед.','Серия','Цена (грн.)','Количество по накладной','Фактическое количество принятого товара','Количество брака','Причина возврата','Примечание');
begin
  Tb:=nil;

  try
    PrintRep.Clear;
    PrintRep.SetDefault;
    PrintRep.Font.Name:='Arial'; PrintRep.Font.Size:=4; PrintRep.Font.Style:=[];
    PrintRep.PageSize:=PF_A4; PrintRep.Orientation:=O_PORTR; PrintRep.Align:=AL_CENTER;

    PrintRep.Font.Style:=[fsBold]; PrintRep.AddText('АКТ'+#10);
    PrintRep.AddText('несоответствия принимаемого товара'+#10);

    PrintRep.AddTable(2,1);
    Tb:=PrintRep.LastTable;
    Tb.SetBorders(1,1,2,1,EMPTY_BORDER);
    Tb.Cell[1,1].Font.Style:=[]; Tb.Cell[1,1].Align:=AL_LEFT; Tb.Cell[1,1].AddText(#10+'г.Харьков');
    PrintRep.Align:=AL_CENTER; PrintRep.Font.Style:=[fsBold]; PrintRep.AddText(Prm.FirmNameRU+#10+#10);

    if (assigned(ViewNaklF))and(ViewNaklF.Showing) then
      ReturnList(ViewNaklF,ADOQuery1);
    ADOQuery1.First;

    PrintRep.Align:=AL_JUST;
    PrintRep.Font.Style:=[];
    PrintRep.AddText('во время приема товарно-материальных ценностей по накладной № ');
    PrintRep.Font.Style:=[fsUnderline,fsBold];
//    if not ADOQuery1.FieldByName('nn_prih').IsNull then PrintRep.AddText(' '+ADOQuery1.FieldByName('nn_prih').Value+' ') else PrintRep.AddText(WHITE_SPACES);
    if not ADOQuery1.FieldByName('nn_prih').IsNull then PrintRep.AddText(' '+ADOQuery1.FieldByName('nn_prih').AsString+' ') else PrintRep.AddText(WHITE_SPACES);
    PrintRep.Font.Style:=[];
    PrintRep.AddText(' от ');
    PrintRep.Font.Style:=[fsUnderline,fsBold];
//    if not ADOQuery1.FieldByName('dt_prih').IsNull then PrintRep.AddText(' '+FormatDateTime('DD.MM.YYYY',ADOQuery1.FieldByName('dt_prih').Value)+' ') else PrintRep.AddText(WHITE_SPACES);
    if not ADOQuery1.FieldByName('dt_prih').IsNull then PrintRep.AddText(' '+FormatDateTime('DD.MM.YYYY',ADOQuery1.FieldByName('dt_prih').AsDateTime)+' ') else PrintRep.AddText(WHITE_SPACES);
    PrintRep.Font.Style:=[];
    PrintRep.AddText(' установлено несоответствие поступившего товара с данными сопроводительных документов по количеству и качеству:'+#10+#10);

    //печать списка товаров к возврату
    rec_count:=FIXED_RECORD_COUNT;  //количество строк
    col_count:=FIXED_COLUMN_COUNT;  //количество колонок
    ADOQuery1.Last;
    rec_count:=rec_count+ADOQuery1.RecordCount;

    //отображение шаблона таблицы возвратов для заполнения
    PrintRep.AddTable(col_count,rec_count);
    Tb:=PrintRep.LastTable;
    Tb.SetBorders(1,1,col_count,1,Border(clBlack,4,psInsideFrame));
    Tb.SetBorders(1,rec_count-3,col_count,rec_count,EMPTY_BORDER);
    Tb.SetBorders(1,rec_count-4,col_count,rec_count-4,DEFAULT_BORDER);
    for i:=1 to col_count do
    begin
      Tb.Cell[i,1].Font.Style:=[fsBold];
      Tb.Cell[i,1].Align:=AL_CENTER;
    end;

    for i:=0 to FIXED_COLUMN_COUNT-1 do Tb.Cell[i+1,1].AddText(TABLE_HEADER[i]+#10);
                //№   Арткод Наименование Ед. Серия Цена   Количество Фактическое Количество Причина  Примечание
                //п/п        товара                 (грн.) по         количество  брака      возврата
                //                                         накладной  принятого
                //                                                    товара
    Tb.SetWidths('250,250,   1000,        250,500,  250,   250,       250,        250,       500,     500');

    for i:=rec_count-3 to rec_count do
    begin
      Tb.MergeCells(1,i,8,i);
      Tb.Cell[1,i].Align:=AL_RIGHT;
      Tb.MergeCells(9,i,FIXED_COLUMN_COUNT,i);
      Tb.Cell[9,i].Align:=AL_RIGHT;
    end; //MergeCells
    Tb.Cell[1,rec_count-3].AddText('Всего, шт.');
    Tb.Cell[1,rec_count-2].AddText('Всего, грн.');
    Tb.Cell[1,rec_count-1].AddText('НДС, грн.');
    Tb.Cell[1,rec_count].AddText('Всего с НДС, грн.');

    Tb.SetBorders(9,rec_count-4,col_count,rec_count,DEFAULT_BORDER);

    //список товара к возврату
    ADOQuery1.Last;
    SetLength(kol,ADOQuery1.RecordCount); //массив значений для строки ВСЕГО, ШТ.
    SetLength(sum,ADOQuery1.RecordCount); //массив значений для строки ВСЕГО, ГРН.
    SetLength(sum_nds,ADOQuery1.RecordCount); //массив значений для строки ВСЕГО С НДС, ГРН.
    for i:=0 to ADOQuery1.RecordCount-1 do
    begin
      kol[i]:=0;
      sum[i]:=0;
      sum_nds[i]:=0;
    end;

    row_no:=2;
    j:=0;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
      Tb.Cell[1,row_no].Align:=AL_CENTER; Tb.Cell[1,row_no].AddText(IntToStr(row_no-1)); //№ п/п
//      Tb.Cell[2,row_no].Align:=AL_CENTER; Tb.Cell[2,row_no].AddText(ADOQuery1.FieldByName('art_code').Value); //арткод
      Tb.Cell[2,row_no].Align:=AL_CENTER; Tb.Cell[2,row_no].AddText(ADOQuery1.FieldByName('art_code').AsString); //арткод
//      Tb.Cell[3,row_no].Align:=AL_CENTER; Tb.Cell[3,row_no].AddText(ADOQuery1.FieldByName('names').Value); //Наименование товара
      Tb.Cell[3,row_no].Align:=AL_CENTER; Tb.Cell[3,row_no].AddText(ADOQuery1.FieldByName('names').AsString); //Наименование товара
      Tb.Cell[4,row_no].Align:=AL_CENTER; Tb.Cell[4,row_no].AddText('упак.'); //Единица измерения
//      Tb.Cell[5,row_no].Align:=AL_CENTER; if not ADOQuery1.FieldByName('numseriya').IsNull then Tb.Cell[5,row_no].AddText(ADOQuery1.FieldByName('numseriya').Value); //Серия
      Tb.Cell[5,row_no].Align:=AL_CENTER; if not ADOQuery1.FieldByName('numseriya').IsNull then Tb.Cell[5,row_no].AddText(ADOQuery1.FieldByName('numseriya').AsString); //Серия
//      Tb.Cell[6,row_no].Align:=AL_CENTER; Tb.Cell[6,row_no].AddText( CurrToStr( RoundCurr(ADOQuery1.FieldByName('cenazakup').Value * ADOQuery1.FieldByName('koef').Value) )); //Цена (грн.)
      Tb.Cell[6,row_no].Align:=AL_CENTER; Tb.Cell[6,row_no].AddText( CurrToStr( RoundCurr(ADOQuery1.FieldByName('cenazakup').AsCurrency * ADOQuery1.FieldByName('koef').AsCurrency) )); //Цена (грн.)

      vz_deskr:='';
      //Количество по накладной
      IncomingNakl;
//      Tb.Cell[7,row_no].Align:=AL_CENTER; Tb.Cell[7,row_no].AddText( FloatToStr(StrToFloat(FloatToStrF( ADOQuery2.FieldByName('kol').Value / ADOQuery1.FieldByName('koef').Value,10,3 ))));
      Tb.Cell[7,row_no].Align:=AL_CENTER; Tb.Cell[7,row_no].AddText( FloatToStr(StrToFloat(FloatToStrF( ADOQuery2.FieldByName('kol').AsInteger / ADOQuery1.FieldByName('koef').AsInteger,10,3 ))));
      //Фактическое количество принятого товара
//      Tb.Cell[8,row_no].Align:=AL_CENTER; Tb.Cell[8,row_no].AddText(FloatToStr(StrToFloat(FloatToStrF(ADOQuery2.FieldByName('kol').Value/ADOQuery1.FieldByName('koef').Value-ADOQuery1.FieldByName('kol').Value/ADOQuery1.FieldByName('koef').Value,10,3))));
      Tb.Cell[8,row_no].Align:=AL_CENTER; Tb.Cell[8,row_no].AddText(FloatToStr(StrToFloat(FloatToStrF(ADOQuery2.FieldByName('kol').AsInteger/ADOQuery1.FieldByName('koef').AsInteger-ADOQuery1.FieldByName('kol').AsInteger/ADOQuery1.FieldByName('koef').AsInteger,10,3))));

      //Недовоз или Брак или Товар не заказан или Инструкции или Фарминспекция или Серия или Срок годности
//      kol_return:=FloatToStr(StrToFloat(FloatToStrF(ADOQuery1.FieldByName('kol').Value/ADOQuery1.FieldByName('koef').Value,10,3)));
      kol_return:=FloatToStr(StrToFloat(FloatToStrF(ADOQuery1.FieldByName('kol').AsInteger/ADOQuery1.FieldByName('koef').AsInteger,10,3)));
//      if not ADOQuery1.FieldByName('VzDescr').IsNull then vz_deskr:=ADOQuery1.FieldByName('VzDescr').Value;
      if not ADOQuery1.FieldByName('VzDescr').IsNull then vz_deskr:=ADOQuery1.FieldByName('VzDescr').AsString;
      for i:=FIXED_COLUMN_COUNT to col_count do Tb.Cell[i,row_no].Align:=AL_CENTER;

      f_nds:=0;
//      case ADOQuery1.FieldByName('f_nds').Value of
      case ADOQuery1.FieldByName('f_nds').AsInteger of
        1: f_nds:=0.2;
        2: f_nds:=0.07;
      end;

//      kol[j]:=(ADOQuery1.FieldByName('kol').Value/ADOQuery1.FieldByName('koef').Value);
      kol[j]:=(ADOQuery1.FieldByName('kol').AsInteger/ADOQuery1.FieldByName('koef').AsInteger);
//      sum[j]:=(ADOQuery1.FieldByName('kol').Value*ADOQuery1.FieldByName('cenazakup').Value);
      sum[j]:=(ADOQuery1.FieldByName('kol').AsInteger*ADOQuery1.FieldByName('cenazakup').AsCurrency);
//      sum_nds[j]:=(ADOQuery1.FieldByName('kol').Value*ADOQuery1.FieldByName('cenazakup').Value*f_nds);
      sum_nds[j]:=(ADOQuery1.FieldByName('kol').AsInteger*ADOQuery1.FieldByName('cenazakup').AsCurrency*f_nds);

      Tb.Cell[9,row_no].AddText(kol_return);
      if Length(Trim(ADOQuery1.FieldByName('vz_descr').AsString))>=0 then Tb.Cell[10,row_no].AddText(ADOQuery1.FieldByName('vz_descr').AsString);
      if Length(Trim(vz_deskr))>=0 then Tb.Cell[11,row_no].AddText(vz_deskr);

      row_no:=row_no+1;
      inc(j);
      ADOQuery1.Next;
    end;

    //заполнение массивов для вывода суммарной информации по возврату
    sum_all:=0;
    kol_all:=0;
    sum_nds_all:=0;
    for i:=0 to length(kol)-1 do
    begin
      kol_all:=kol_all+kol[i];
      sum_all:=sum_all+sum[i];
      sum_nds_all:=sum_nds_all+sum_nds[i];
    end;

    Tb.Cell[9,rec_count-3].Align:=AL_RIGHT; Tb.Cell[9,rec_count-3].AddText(FloatToStr(StrToFloat(FloatToStrF(kol_all,10,3)))); //Всего, шт.
    Tb.Cell[9,rec_count-2].Align:=AL_RIGHT; Tb.Cell[9,rec_count-2].AddText(CurrToStr(RoundCurr(sum_all))); //Всего, грн.
    Tb.Cell[9,rec_count-1].Align:=AL_RIGHT; Tb.Cell[9,rec_count-1].AddText(CurrToStr(RoundCurr(sum_nds_all))); //НДС, грн.
    Tb.Cell[9,rec_count].Align:=AL_RIGHT; Tb.Cell[9,rec_count].AddText(CurrToStr(RoundCurr(sum_all+sum_nds_all))); //Всего с НДС, грн.

    with PrintRep do
    begin
      Font.Style:=[fsBold];
      AddText(#10+'Итого, при проверке фактически поставленного товара, выявлено несоответствие данных, указаных в накладной, всего в количестве ');
      Font.Style:=[fsBold,fsUnderline];
      AddText(FloatToStr(StrToFloat(FloatToStrF(kol_all,10,3)))+' ('+FloatToWordsRU(kol_all,10,3)+') ');
      Font.Style:=[fsBold]; AddText(' шт. на общую сумму ');
      Font.Style:=[fsBold,fsUnderline];
      AddText(CurrToWordsRU(sum_all,0));
      Font.Style:=[];
      AddText(#10+#10+'Несоответствие: '+#10+#10);
      AddText('В результате выявленых несоответствий по накладной № ');
      Font.Style:=[fsBold,fsUnderline];
      if not ADOQuery1.FieldByName('nn_prih').IsNull then PrintRep.AddText(' '+ADOQuery1.FieldByName('nn_prih').Value+' ') else PrintRep.AddText(WHITE_SPACES);
      Font.Style:=[];
      AddText(' от ');
      Font.Style:=[fsBold,fsUnderline];
      if not ADOQuery1.FieldByName('dt_prih').IsNull then PrintRep.AddText(' '+FormatDateTime('DD.MM.YYYY',ADOQuery1.FieldByName('dt_prih').Value)+' ') else PrintRep.AddText(WHITE_SPACES);
      Font.Style:=[];
      AddText(' года на сумму оприходованого товара по накладной составляет без НДС ');

      //количество и сумма по приходной накладной
      IncomingNakl;
      ADOQuery2.First;
//      iddoc:=ADOQuery2.FieldByName('iddoc').Value;
      iddoc:=ADOQuery2.FieldByName('iddoc').AsInteger;

      with ADOQuery2 do
      begin
        SQL.Clear;
        SQL.Add('declare @iddoc int set @iddoc = :iddoc');
        SQL.Add('select ');
        SQL.Add('  top 1 j.sum_prih, j.F_NDS');
        SQL.Add('from');
        SQL.Add('  jmoves j (nolock)');
        SQL.Add('  left join rtovar r (nolock) on r.iddoc=j.iddoc');
        SQL.Add('  inner join sprtov s (nolock) on s.kod_name=r.kod_name');
        SQL.Add('  left join PList p (nolock) on p.art_code=s.art_code');
        SQL.Add('where');
        SQL.Add('  j.type_nakl = 1');
        SQL.Add('  and j.reoc=0 and j.obl in (0, 1)');
        SQL.Add('  and not j.id_postav is null');
        SQL.Add('  and j.iddoc = @iddoc');
        SQL.Add('order by');
        SQL.Add('  j.iddoc, j.nn_nakl');
        Parameters.Clear;
        Parameters.CreateParameter('iddoc',ftInteger,pdInput,10,iddoc);
        Open;
        First;
      end;

      f_nds:=0;
//      case ADOQuery2.FieldByName('f_nds').Value of
      case ADOQuery2.FieldByName('f_nds').AsInteger of
        1: f_nds:=0.2;
        2: f_nds:=0.07;
      end;

      Font.Style:=[fsBold,fsUnderline];
//      if (not ADOQuery2.FieldByName('sum_prih').IsNull)and(f_nds > 0) then AddText(CurrencyToStr(RoundCurr(ADOQuery2.FieldByName('sum_prih').Value / (1+f_nds)))+' грн. ') else AddText(WHITE_SPACES);
      if (not ADOQuery2.FieldByName('sum_prih').IsNull)and(f_nds > 0) then AddText(CurrencyToStr(RoundCurr(ADOQuery2.FieldByName('sum_prih').AsCurrency / (1+f_nds)))+' грн. ') else AddText(WHITE_SPACES);
      Font.Style:=[];
      AddText(', НДС ');
      Font.Style:=[fsBold,fsUnderline];
//      if (not ADOQuery2.FieldByName('sum_prih').IsNull)and(f_nds > 0) then AddText(CurrencyToStr(RoundCurr(ADOQuery2.FieldByName('sum_prih').Value - ADOQuery2.FieldByName('sum_prih').Value / (1+f_nds)))+' грн. ') else AddText(WHITE_SPACES);
      if (not ADOQuery2.FieldByName('sum_prih').IsNull)and(f_nds > 0) then AddText(CurrencyToStr(RoundCurr(ADOQuery2.FieldByName('sum_prih').AsCurrency - ADOQuery2.FieldByName('sum_prih').AsCurrency / (1+f_nds)))+' грн. ') else AddText(WHITE_SPACES);
      Font.Style:=[];
      AddText(', сумма с НДС ');
      Font.Style:=[fsBold,fsUnderline];
//      if not ADOQuery2.FieldByName('sum_prih').IsNull then AddText(CurrencyToStr(RoundCurr(ADOQuery2.FieldByName('sum_prih').Value))+' грн. ('+CurrToWordsRU(RoundCurr(ADOQuery2.FieldByName('sum_prih').Value),0)+').') else AddText(WHITE_SPACES);
      if not ADOQuery2.FieldByName('sum_prih').IsNull then AddText(CurrencyToStr(RoundCurr(ADOQuery2.FieldByName('sum_prih').AsCurrency))+' грн. ('+CurrToWordsRU(RoundCurr(ADOQuery2.FieldByName('sum_prih').AsCurrency),0)+').') else AddText(WHITE_SPACES);
      Font.Style:=[];
      AddText(#10+#10+'Акт получил водитель-экспедитор '+UNDERLINES+' '+UNDERLINES+' /ФИО/'+#10+#10);
      AddText('Товары согласно Акта получил водитель-экспедитор '+UNDERLINES+' '+UNDERLINES+' /ФИО/'+#10+#10);
      Font.Style:=[fsBold];
      AddText(#10+#10+GARANTIE+#10+#10);
    end;

    PrintRep.AddTable(3,1);
    PrintRep.Font.Style:=[fsBold];
    Tb:=PrintRep.LastTable;
    Tb.SetBorders(1,1,3,1,EMPTY_BORDER);
    Tb.SetWidths('1000,200,1000');
    Tb.Cell[1,1].Font.Style:=[];
    Tb.Cell[2,1].Font.Style:=[];
    Tb.Cell[3,1].Font.Style:=[];

    Tb.Cell[1,1].Font.Size:=4;
    Tb.Cell[1,1].AddText('Уполномоченое лицо '+UNDERLINES+#10);
    Tb.Cell[1,1].Font.Size:=3;
    Tb.Cell[1,1].AddText('                                                  (Ф.И.О., подпись)'+#10);
    Tb.Cell[1,1].Font.Size:=4;
    Tb.Cell[1,1].AddText(#10+#10);
    Tb.Cell[1,1].AddText('отпустил '+UNDERLINES+#10);
    Tb.Cell[1,1].Font.Size:=3;
    Tb.Cell[1,1].AddText('                                   (Ф.И.О., подпись)');
    Tb.Cell[1,1].Font.Size:=4;
    Tb.Cell[1,1].Align:=AL_RIGHT;
    Tb.Cell[1,1].AddText(#10+#10+#10+#10+#10+#10+'Место печати');

    Tb.Cell[3,1].AddText('Поставщик ');
    Tb.Cell[3,1].Font.Style:=[fsBold];
//    if not ADOQuery1.FieldByName('descr').IsNull then Tb.Cell[3,1].AddText(' '+ADOQuery1.FieldByName('descr').Value+' '+#10) else Tb.Cell[3,1].AddText(' '+UNDERLINES+UNDERLINES+' '+#10);
    if not ADOQuery1.FieldByName('descr').IsNull then Tb.Cell[3,1].AddText(' '+ADOQuery1.FieldByName('descr').AsString+' '+#10) else Tb.Cell[3,1].AddText(' '+UNDERLINES+UNDERLINES+' '+#10);
    Tb.Cell[3,1].Font.Style:=[];
    Tb.Cell[3,1].AddText(UNDERLINES+UNDERLINES+#10);
    Tb.Cell[3,1].AddText(UNDERLINES+UNDERLINES+#10);
    Tb.Cell[3,1].AddText(UNDERLINES+UNDERLINES+#10);
    Tb.Cell[3,1].AddText(UNDERLINES+UNDERLINES+#10);
    Tb.Cell[3,1].AddText(UNDERLINES+UNDERLINES+#10);
    Tb.Cell[3,1].AddText(UNDERLINES+UNDERLINES+#10);
    Tb.Cell[3,1].AddText(UNDERLINES+UNDERLINES+#10);
    Tb.Cell[3,1].AddText(UNDERLINES+UNDERLINES+#10+#10);
    Tb.Cell[3,1].Align:=AL_RIGHT;
    Tb.Cell[3,1].AddText('Место печати');

    PrintRep.PreView;
  except
    on E:Exception do MainF.MessBox('Ошибка формирования печатной формы накладной: '+E.Message);
  end;
end;

procedure TViewNaklF.N7Click(Sender: TObject);
 begin
  ScanPosInfoF:=TScanPosInfoF.Create(Self);
  try
   ScanPosInfoF.ShowModal;
  finally
   ScanPosInfoF.Free;
  end;
 end;

procedure TViewNaklF.N9Click(Sender: TObject);
 begin
  if DM.spY_NaklList.IsEmpty then Exit;
  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select j.time_nakl,u.users from Jmoves j inner join SprUser u on j.id_user=u.id where j.iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString;
  DM.QrEx.Open;
  MainF.MessBox('Дата загрузки накладной: '+DM.QrEx.FieldByName('time_nakl').AsString+#10+
                'Загружена сотрудником: '+DM.QrEx.FieldByName('users').AsString);
 end;

procedure TViewNaklF.MenuItem1Click(Sender: TObject);
 begin
  if Sender=nil then Exit;
  PrintAkt(TControl(Sender).Tag);
 end;

end.


