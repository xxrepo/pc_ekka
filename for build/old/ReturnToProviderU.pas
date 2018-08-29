unit ReturnToProviderU;

interface

uses
  Forms, DB, ADODB, Controls, ExtCtrls, Classes, Grids, DBGrids, StdCtrls,
  Buttons, DBCtrls, Dialogs, ComCtrls, PrintReport, SysUtils, ShareU, Util,
  Graphics;

type
  TRemainder = record
    kod_name: integer; //код партии
    art_code: integer; //арткод товара
    kol: double; //количество товара к возврату
    ostat: double; //остаток товара в партии
  end;

type
  TReturnToProviderF = class(TForm)
    Splitter1: TSplitter;
    Panel2: TPanel;
    bbClose: TBitBtn;
    bbCreateOrder: TBitBtn;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    Panel4: TPanel;
    DataSource3: TDataSource;
    ADOQuery3: TADOQuery;
    DBGrid3: TDBGrid;
    ADOQuery4: TADOQuery;
    ADOStoredProc1: TADOStoredProc;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    Panel1: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    lblPostavschik: TLabel;
    Label14: TLabel;
    lblNaklNomber: TLabel;
    Label15: TLabel;
    lblNaklDate: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lblnn_nakl: TLabel;
    Label4: TLabel;
    lbldt_nakl: TLabel;
    procedure bbCloseClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure bbCreateOrderClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    CommentForReturnBill: string;
  private
    ReminderBefore, ReminderAfter: array of TRemainder;
    function GetRemainderByPart: TRemainder;
    function CompareRemainders(Before, After: array of TRemainder): boolean;
  end;

var
  ReturnToProviderF: TReturnToProviderF;

implementation

uses
  DataModuleU, ViewNaklU, AddToReturnU, MainU;

{$R *.dfm}

procedure TReturnToProviderF.bbCloseClick(Sender: TObject);
begin
  ReturnToProviderF.Close;
end;

procedure TReturnToProviderF.FormResize(Sender: TObject);
begin
  bbClose.Left:=ReturnToProviderF.Width-bbClose.Width-25;
end;

procedure TReturnToProviderF.FormActivate(Sender: TObject);
var
  id_user: integer;
begin
  id_user:=Prm.UserID;
  with ADOQuery3 do
  begin
    SQL.Clear;
    SQL.Add('select * from ##check (nolock)');
    SQL.Add('where id_user = :pid_user and compname=host_name()');
    Parameters.Clear;
    Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
    Open;
  end;
  bbCreateOrder.Enabled:=false;

  if not ViewNaklF.ADOQuery1.FieldByName('nn_nakl').IsNull then lblnn_nakl.Caption:=ViewNaklF.ADOQuery1.FieldByName('nn_nakl').Value else lblnn_nakl.Caption:='';
  if not ViewNaklF.ADOQuery1.FieldByName('date_nakl').IsNull then lbldt_nakl.Caption:=ViewNaklF.ADOQuery1.FieldByName('date_nakl').Value else lbldt_nakl.Caption:='';

  if not ViewNaklF.ADOQuery1.FieldByName('descr').IsNull then lblPostavschik.Caption:=ViewNaklF.ADOQuery1.FieldByName('descr').Value else lblPostavschik.Caption:='';
  if not ViewNaklF.ADOQuery1.FieldByName('nn_prih').IsNull then lblNaklNomber.Caption:=ViewNaklF.ADOQuery1.FieldByName('nn_prih').Value else lblNaklNomber.Caption:='';
  if not ViewNaklF.ADOQuery1.FieldByName('dt_prih').IsNull then lblNaklDate.Caption:=ViewNaklF.ADOQuery1.FieldByName('dt_prih').Value else lblNaklDate.Caption:='';
end;

procedure TReturnToProviderF.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  with ReturnToProviderF do
  begin
    with ADOQuery2 do
    begin
      if ADOQuery1.Active then
      begin
        //Close;
        SQL.Clear;
        SQL.Add('declare @dt1 datetime set @dt1 = convert(datetime,:dt1)');
        SQL.Add('declare @dt2 datetime set @dt2 = convert(datetime,:dt2)');
        SQL.Add('declare @iddoc int set @iddoc = :iddoc');
        SQL.Add('select');
        SQL.Add('  j.iddoc, j.F_NDS, j.Type_Tov, j.ID_USER, j.SKLAD, convert(uniqueidentifier,j.id_postav) as id_postav, j.nn_prih, j.dt_prih, j.type_nakl, j.reoc, j.obl, j.date_nakl, j.nn_nakl,');
        SQL.Add('  r.KOD_NAME, r.KOL, r.CENA, r.SHTRIH, r.CENAP, r.pr_vz_post, r.ISSCAN,');
        SQL.Add('  s.NAMES, s.ART_CODE, s.ART_NAME, convert(uniqueidentifier,s.id_part8) as id_part8,');
        SQL.Add('  p.koef, p.edname,i.numseriya,i.srokgodn');
        SQL.Add('from');
        SQL.Add('  jmoves j (nolock) ');
        SQL.Add('  left join rtovar r (nolock) on r.iddoc=j.iddoc');
        SQL.Add('  inner join sprtov s (nolock) on s.kod_name=r.kod_name');
        SQL.Add('  left join PList p (nolock) on p.art_code=s.art_code');
        SQL.Add('  left join serii i (nolock) on convert(uniqueidentifier,i.id_part8)=convert(uniqueidentifier,s.id_part8)');
        SQL.Add('where');
        SQL.Add('  j.date_nakl >= @dt1 and j.date_nakl <= @dt2 and j.type_nakl = 1');
        SQL.Add('  and j.reoc=0 and j.obl in (0, 1)');
        SQL.Add('  and not j.id_postav is null');
        SQL.Add('  and j.iddoc = @iddoc');
        SQL.Add('order by');
        SQL.Add('  j.iddoc, j.nn_nakl');
        Parameters.Clear;
        Parameters.CreateParameter('dt1',ftDateTime, pdInput,23,ViewNaklF.dtStart.Date);
        Parameters.CreateParameter('dt2',ftDateTime, pdInput,23,ViewNaklF.dtEnd.Date);
        Parameters.CreateParameter('iddoc',ftInteger,pdInput,10,ADOQuery1.FieldByName('IDDOC').Value);
        Open;
      end;
    end;
  end;
end;

procedure TReturnToProviderF.bbCreateOrderClick(Sender: TObject);
var
  id_user: integer;
  i: integer;
//  reminder_before, reminder_after: double;
begin
  if (ADOQuery3.Active)and(ADOQuery3.RecordCount<=0) then exit;
  id_user:=Prm.UserID;
  CommentForReturnBill:='';

  if ADOQuery3.RecordCount<=1 then
  begin
    SetLength(ReminderBefore,ADOQuery3.RecordCount+1);
    SetLength(ReminderAfter,ADOQuery3.RecordCount+1);
  end
  else
  begin
    SetLength(ReminderBefore,ADOQuery3.RecordCount);
    SetLength(ReminderAfter,ADOQuery3.RecordCount);
  end;
  i:=0;
  ADOQuery3.First;
  while not ADOQuery3.Eof do
  begin
    ReminderBefore[i]:=GetRemainderByPart;
    inc(i);
    ADOQuery3.Next;
  end;

  try
    try
      with ADOStoredProc1 do
      begin
        if Active then Close;
        ProcedureName:='spY_WriteVozvrat';
        Parameters.Clear;
        Parameters.CreateParameter('@pid_user', ftInteger, pdInput, 10, id_user);
        Parameters.CreateParameter('@dat', ftDateTime, pdInput, 23, FormatDateTime('YYYY-MM-DD', Date()));
        Parameters.CreateParameter('@priznak', ftInteger, pdInput, 10, 27);
        Parameters.CreateParameter('@pVzDescr', ftString, pdInput, 500, ADOQuery3.FieldByName('VzDescr').Value);
        ExecProc;
      end;

      i:=0;
      ADOQuery3.First;
      while not ADOQuery3.Eof do
      begin
        ReminderAfter[i]:=GetRemainderByPart;
        inc(i);
        ADOQuery3.Next;
      end;
      if not CompareRemainders(ReminderBefore,ReminderAfter) then
      begin
        MessageDlg('„то-то пошло не так.'+#13+'”бедитесь, что все товары к возврату подготовлены '+#13+'и повторите формирование возвратной накладной!',mtError,[mbOK],0);
        ReturnToProviderF.Close;
        exit;
      end;
    finally
      with ReturnToProviderF do
      begin
        with ADOQuery4 do
        begin
          SQL.Clear;
          SQL.Add('delete from ##check ');
          SQL.Add('where id_user = :pid_user and compname=host_name()');
          Parameters.Clear;
          Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
          ExecSQL;
        end;
        with ADOQuery3 do
        begin
          SQL.Clear;
          SQL.Add('select * from ##check (nolock)');
          SQL.Add('where id_user = :pid_user and compname=host_name()');
          Parameters.Clear;
          Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
          Open;
        end;
        bbCreateOrder.Enabled:=false;
      end;
    end;
    MessageDlg('Ќакладна€ на возврат поставщику сформирована.',mtInformation,[mbOK],0);
    ReturnToProviderF.Close;
  except
    MessageDlg('„то-то пошло не так.'+#13+'”бедитесь, что все товары к возврату подготовлены '+#13+'и повторите формирование возвратной накладной!',mtError,[mbOK],0);
  end;
end;

procedure TReturnToProviderF.BitBtn1Click(Sender: TObject);
var
  count_available, count_check: integer;
begin
  count_available:=0;
  count_check:=0;
  try
    AddToReturnF:=TAddToReturnF.Create(self);
    try
      with AddToReturnF do
      begin
        //проверить, есть ли уже запись в чеке с этим товаром
        with ADOQuery4 do
        begin
          SQL.Clear;
          SQL.Add('select * from ##Check (nolock)');
          SQL.Add('where KOD_NAME = :KOD_NAME');
          Parameters.Clear;
          Parameters.CreateParameter('KOD_NAME',ftInteger,pdInputOutput,10,ADOQuery2.FieldByName('KOD_NAME').Value);
          Open;

          count_available:=ADOQuery2.FieldByName('KOL').Value;  //количество позиций по kod_name в rtovar
          if ADOQuery4.RecordCount > 0 then count_check:=ADOQuery4.FieldByName('KOL').Value;  //количество товара подготовленого к возврату поставщику kod_name в chek
        end;
        //показать окно с максимальным количеством выбраного товара к возврату
        Label2.Visible:=True;
        Label1.Visible:=True;
        edKol.Visible:=True;
        Label4.Visible:=true;
        ComboBox1.Visible:=true;
        Label3.Enabled:=False;
        Edit1.Enabled:=False;
        Edit1.Text:='';

        with ADOQuery4 do
        begin
          SQL.Clear;
          SQL.Add('select * from SPRPRVOZR (nolock) where vis_vz_post=1 order by descr');
          Open;
          First;
        end;
        ComboBox1.Items.Clear;
        ComboBox1.Text:='';
        ComboBox2.Items.Clear;
        ComboBox2.Text:='';
        while not ADOQuery4.Eof do
        begin
          ComboBox1.Items.Add(ADOQuery4.FieldByName('descr').Value);
          ComboBox2.Items.Add(IntToStr(ADOQuery4.FieldByName('id').Value));
          ADOQuery4.Next;
        end;
        ComboBox1.ItemIndex:=-1;
        ComboBox2.ItemIndex:=-1;

        Caption:=' оличество';
        Position:=poMainFormCenter;
        Label2.Caption:=ADOQuery2.FieldByName('names').Value;
        if count_available-count_check > 0 then edKol.Text:=IntToStr(count_available-count_check) else exit;

        ShowModal;
      end;
    finally
      AddToReturnF.Free;
    end;
  except
    ShowMessage('„то-то пошло не так. ѕопробуйте повторить!');
  end;
  bbCreateOrder.Enabled:=true;
end;

procedure TReturnToProviderF.BitBtn2Click(Sender: TObject);
var
  id_user: integer;
begin
  id_user:=Prm.UserID;
  if ADOQuery3.RecordCount>0 then
  begin
    with ADOQuery4 do
    begin
      SQL.Clear;
      SQL.Clear;
      SQL.Add('delete from ##check ');
      SQL.Add('where KOD_NAME = :KOD_NAME');
      Parameters.Clear;
      Parameters.CreateParameter('KOD_NAME', ftInteger, pdInputOutput, 10, ReturnToProviderF.ADOQuery3.FieldByName('KOD_NAME').Value);
      ExecSQL;
    end;
    with ReturnToProviderF.ADOQuery3 do
    begin
      SQL.Clear;
      SQL.Add('select * from ##check (nolock) ');
      SQL.Add('where id_user = :pid_user and compname=host_name()');
      Parameters.Clear;
      Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
      Open;
    end;
  end;
end;

procedure TReturnToProviderF.BitBtn4Click(Sender: TObject);
var
  id_user: integer;
begin
  id_user:=Prm.UserID;
  with ReturnToProviderF do
  begin
    with ADOQuery3 do
    begin
      SQL.Clear;
      SQL.Add('delete from ##check ');
      SQL.Add('where id_user = :pid_user and compname=host_name()');
      Parameters.Clear;
      Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
      ExecSQL;

      SQL.Clear;
      SQL.Add('select * from ##check (nolock)');
      SQL.Add('where id_user = :pid_user and compname=host_name()');
      Parameters.Clear;
      Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
      Open;
    end;
    bbCreateOrder.Enabled:=false;
  end;
end;

procedure TReturnToProviderF.FormCreate(Sender: TObject);
var
  id_user: integer;
begin
  id_user:=Prm.UserID;
  with ADOQuery3 do
  begin
    SQL.Clear;
    SQL.Add('if Object_ID(N''tempdb..##check'') is not null');
    SQL.Add('  drop table ##check');
    SQL.Add('CREATE TABLE ##check(');
    SQL.Add('  KOD_NAME int NULL,');
    SQL.Add('  NAMES varchar(200) NULL,');
    SQL.Add('  KOL int NULL,');
    SQL.Add('  CENA numeric(8, 2) NULL,');
    SQL.Add('  F_NDS smallint NULL,');
    SQL.Add('  TYPE_TOV smallint NULL,');
    SQL.Add('  ID_USER smallint NULL,');
    SQL.Add('  ART_CODE int NULL,');
    SQL.Add('  ART_NAME varchar(16) NULL,');
    SQL.Add('  DATEINS datetime NULL,');
    SQL.Add('  PR1 smallint NULL,');
    SQL.Add('  CompName varchar(50) NULL,');
    SQL.Add('  SKLAD varchar(9) NULL,');
    SQL.Add('  shtrih bigint NULL,');
    SQL.Add('  prvozr smallint NULL,');
    SQL.Add('  CenaP numeric(8, 2) NULL,');
    SQL.Add('  skladv varchar(15) NULL,');
    SQL.Add('  pr_vz_post int null,');

    SQL.Add('  id_postav binary(16) null,');
    SQL.Add('  nn_prih varchar(50) null,');
    SQL.Add('  dt_prih datetime null,');

    SQL.Add('  VzDescr varchar(500) NULL');
    SQL.Add(')');

//    SQL.Add('  PRINTING smallint NULL,');
//    SQL.Add('  SUMSKD numeric(8, 2) NULL,');
//    SQL.Add('  SKD numeric(8, 2) NULL,');
//    SQL.Add('  NUMCARD bigint NULL,');
//    SQL.Add('  SUMSKDK numeric(8, 2) NULL,');
//    SQL.Add('  NUMCARDK int NULL,');
//    SQL.Add('  OLD_ART int NULL,');
//    SQL.Add('  TYPE_MAP smallint NULL,');
//    SQL.Add('  Bonus numeric(8, 2) NULL,');
//    SQL.Add('  TypeCard smallint NULL,');
//    SQL.Add('  id_akcii smallint NULL,');
//    SQL.Add('  BonusSkd numeric(8, 2) NULL,');
//    SQL.Add('  CardPref bigint NULL,');
//    SQL.Add('  SkdM numeric(8, 2) NULL,');
//    SQL.Add('  KolM smallint NULL,');
//    SQL.Add('  cena_pilot numeric(8, 2) NULL,');
//    SQL.Add('  medname varchar(100) NULL,');
//    SQL.Add('  IsFirstRec smallint NULL,');
//    SQL.Add('  MDMSkd numeric(8, 2) NULL,');
//    SQL.Add('  FIODoctor varchar(100) NULL,');
//    SQL.Add('  ISSROK smallint NULL,');
//    SQL.Add('  Numb_Chek int NULL,');
//    SQL.Add('  Vzh bigint NULL,');
//    SQL.Add('  idres int NULL,');
//    SQL.Add('  SumSkdNew numeric(8, 2) NULL,');
//    SQL.Add('  SkdNew numeric(8, 2) NULL,');
//    SQL.Add('  SumSpis numeric(8, 2) NULL,');
//    SQL.Add('  SkdSpis numeric(8, 2) NULL,');
//    SQL.Add('  SkdOpt numeric(8, 2) NULL,');
//    SQL.Add('  s1 bit NULL,');
//    SQL.Add('  s2 bit NULL,');
//    SQL.Add('  s3 bit NULL,');
//    SQL.Add('  s4 bit NULL,');
//    SQL.Add('  s5 bit NULL,');
//    SQL.Add('  s6 bit NULL,');
//    SQL.Add('  s7 bit NULL,');
//    SQL.Add('  s8 bit NULL,');
//    SQL.Add('  s9 bit NULL,');
//    SQL.Add('  s10 bit NULL,');
//    SQL.Add('  s11 bit NULL,');
//    SQL.Add('  s12 bit NULL,');
//    SQL.Add('  s13 bit NULL,');
//    SQL.Add('  s14 bit NULL,');
//    SQL.Add('  s15 bit NULL,');
//    SQL.Add('  s16 bit NULL,');
//    SQL.Add('  NumSeriya varchar(50) NULL,');
//    SQL.Add('  SumRecipt numeric(8, 2) NULL,');
//    SQL.Add('  id_zam int NULL,');
//    SQL.Add('  id_prior smallint NULL,');
//    SQL.Add('  idres_np int NULL,');
//    SQL.Add('  id_part int NULL,');
//    SQL.Add('  id_doctor int NULL,');
//    SQL.Add('  card_doctor varchar(13) NULL,');
//    SQL.Add('  id_doctor_all int NULL,');
//    SQL.Add('  id_strah int NULL,');
//    SQL.Add('  fransh numeric(12, 2) NULL,');
//    SQL.Add('  nn_polis varchar(50) NULL,');
//    SQL.Add('  dt_polis datetime NULL,');
//    SQL.Add('  FIOStrah varchar(240) NULL,');
//    SQL.Add('  TypeDostStrah tinyint NULL,');
//    SQL.Add('  NumOrder varchar(55) NULL');
    ExecSQL;
  end;
end;

function TReturnToProviderF.GetRemainderByPart: TRemainder;
var
  i: Integer;
  rec_count: integer;
  res: array of TRemainder;
begin
  with ADOQuery4 do
  begin
    SQL.Clear;
    SQL.Add('declare @id_user int set @id_user=:id_user');
    SQL.Add('select c.kod_name,c.art_code,c.kol,s.ostat ');
    SQL.Add('from');
    SQL.Add('  ##check c');
    SQL.Add('  left join sprtov s on s.kod_name=c.kod_name');
    SQL.Add('where');
    SQL.Add('  c.compname=host_name() and c.id_user=@id_user');
    Parameters.Clear;
    Parameters.CreateParameter('id_user',ftInteger,pdInput,10,Prm.UserID);
    Open;
  end;
  ADOQuery4.Last;
  rec_count:=ADOQuery4.RecordCount;
  ADOQuery4.First;
  i:=0;
  SetLength(res,rec_count);
  repeat
    res[i].kod_name:=ADOQuery4.FieldByName('kod_name').AsInteger;
    res[i].art_code:=ADOQuery4.FieldByName('art_code').AsInteger;
    res[i].kol:=ADOQuery4.FieldByName('kol').AsFloat;
    res[i].ostat:=ADOQuery4.FieldByName('ostat').AsFloat;
    Result:=res[i];

    ADOQuery4.Next;
    inc(i);
  until i=rec_count;
end;

function TReturnToProviderF.CompareRemainders(Before, After: array of TRemainder): boolean;
var
  i, j: integer;
  kod_N_Before, kod_N_After: integer;
  art_C_Before, art_C_After: integer;
  kol_Before, kol_After: double;
  ost_Before, ost_After: double;
begin
  Result:=true;
  if Length(Before) <> Length(After) then
  begin
    Result:=false;
    Exit;
  end;

  i:=0;
  repeat
    kod_N_Before:=Before[i].kod_name;
    art_C_Before:=Before[i].art_code;
    kol_Before:=Before[i].kol;
    ost_Before:=Before[i].ostat;
    for j:=0 to Length(After) do
    begin
      if Before[i].kod_name=After[j].kod_name then
      begin
        kod_N_After:=After[i].kod_name;
        art_C_After:=After[i].art_code;
        kol_After:=After[i].kol;
        ost_After:=After[i].ostat;
        Break;
      end;
    end;
    if ost_Before <> ost_After + kol_Before then
    begin
      Result:=false;
      exit;
    end;
    inc(i);
  until i=Length(Before);
end;

end.
