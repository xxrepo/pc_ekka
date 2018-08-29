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
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    Panel4: TPanel;
    DataSource3: TDataSource;
    ADOQuery3: TADOQuery;
    DBGrid3: TDBGrid;
    aTmp: TADOQuery;
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
    BitBtn3: TBitBtn;
    bbCreateClaime: TBitBtn;
    procedure bbCloseClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbCreateOrderClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure bbCreateClaimeClick(Sender: TObject);
  private
    FReturnType: integer;
    FIDDoc: integer;
    ReminderBefore, ReminderAfter: array of TRemainder;
    function GetRemainderByPart(arr_elem: integer): TRemainder;
    function CompareRemainders(Before, After: array of TRemainder): boolean;
  public
    ord: string;
    procedure OpenNakl(order: string);
    procedure OpenCheck;
    property ReturnType: integer read FReturnType write FReturnType; // 0 - возврат поставщику по накладной
                                                                     // 1 - позврат поставщику по карантину
    property IDDoc: integer read FIDDoc write FIDDoc;
  end;

var
  ReturnToProviderF: TReturnToProviderF;
  fY: string;

implementation

uses
  DataModuleU, ViewNaklU, AddToReturnU, MainU;

{$R *.dfm}

procedure TReturnToProviderF.OpenCheck;
var
  id_user: integer;
begin
  id_user:=Prm.UserID;
  with ADOQuery3 do
  begin
    SQL.Clear;
    SQL.Add('select * from chk_vozr (nolock)');
    SQL.Add('where id_user = :pid_user and compname = host_name()');
    Parameters.Clear;
    Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
    Open;
  end;
end;

procedure TReturnToProviderF.OpenNakl(order: string);
begin
  with ReturnToProviderF do
  begin
    with ADOQuery2 do
    begin
      SQL.Clear;
      SQL.Add('declare @iddoc int set @iddoc = :iddoc');
      SQL.Add('select');
      SQL.Add('  j.iddoc as iddoc, case j.F_NDS when 1 then ''20%'' when 2 then ''7%'' end as NDS,');
      SQL.Add('  j.F_NDS, j.Type_Tov as Type_Tov, j.ID_USER as ID_USER, j.SKLAD as SKLAD,');
      SQL.Add('  convert(uniqueidentifier,j.id_postav) as id_postav, j.nn_prih as nn_prih,');
      SQL.Add('  j.dt_prih as dt_prih, j.type_nakl as type_nakl, j.reoc as reoc, j.obl as obl,');
      SQL.Add('  j.date_nakl as date_nakl, j.nn_nakl as nn_nakl, sum(r.KOL) as kol,');
      SQL.Add('  max(s.CENA) as Cena, max(s.CenaZakup) as CenaZakup, r.SHTRIH as SHTRIH,');
      SQL.Add('  max(r.CENAP) as cenap, r.pr_vz_post as pr_vz_post, r.ISSCAN as ISSCAN,');
      SQL.Add('  s.NAMES as names, s.ART_CODE as art_code, s.ART_NAME as ART_NAME,');
      SQL.Add('  sum(s.ostat) as ostat, p.koef as koef, i.numseriya as numseriya,');
      SQL.Add('  i.srokgodn as srokgodn');
      SQL.Add('from');
      SQL.Add('  jmoves j (nolock)');
      SQL.Add('  left join rtovar r (nolock) on r.iddoc=j.iddoc');
      SQL.Add('  inner join sprtov s (nolock) on s.kod_name=r.kod_name');
      SQL.Add('  left join PList p (nolock) on p.art_code=s.art_code');
      SQL.Add('  left join serii i (nolock) on convert(uniqueidentifier,i.id_part8)=convert(uniqueidentifier,s.id_part8)');
      SQL.Add('where');
      SQL.Add('  j.type_nakl = 1');
      SQL.Add('  and j.reoc=0 and j.obl in (0, 1)');
      SQL.Add('  and not j.id_postav is null');
      SQL.Add('  and j.iddoc = @iddoc');
      SQL.Add('group by');
      SQL.Add('  j.iddoc, j.F_NDS, j.Type_Tov, j.ID_USER, j.SKLAD, j.id_postav, j.nn_prih,');
      SQL.Add('  j.dt_prih, j.type_nakl, j.reoc, j.obl, j.date_nakl, j.nn_nakl, r.SHTRIH,');
      SQL.Add('  r.pr_vz_post, r.ISSCAN, s.NAMES, s.ART_CODE, s.ART_NAME, p.koef, i.numseriya,');
      SQL.Add('  i.srokgodn');
      SQL.Add('order by '+order);
      SQL.Add('');
      Parameters.Clear;
//      Parameters.CreateParameter('iddoc',ftInteger,pdInput,10,StrToInt(lblIDDoc.Caption));
      Parameters.CreateParameter('iddoc',ftInteger,pdInput,10,IDDoc);
      Open;
    end;
  end;
end;

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
  ord:='names';
  case ReturnType of
    0: // 0 - возврат поставщику по накладной
      begin
        OpenCheck;

        bbCreateOrder.Enabled:=false;
        bbCreateClaime.Enabled:=false;
        OpenNakl(ord);
      end;
    1: // 1 - позврат поставщику по карантину
      begin
//        OpenCheck;
//        if ADOQuery3.RecordCount > 0 then BitBtn4Click(sender);
        ReturnToProviderF.Close;
      end;
  end;
  if ReturnToProviderF.ADOQuery3.RecordCount > 0 then
  begin
    bbCreateOrder.Enabled:=true;
    bbCreateClaime.Enabled:=true;
  end;
end;

procedure TReturnToProviderF.bbCreateOrderClick(Sender: TObject);
var
  id_user: integer;
  i: integer;
  psw: string;
begin
    psw:='';
    with aTmp do
    begin
      SQL.Clear;
      SQL.Add('select passw,dtend from sprprvozr where id=27');
      Open;
    end;
    if aTmp.FieldByName('dtend').Value>date() then psw:=aTmp.FieldByName('passw').Value;
    if Not MainF.CheckPassword(psw) then Exit;

  if (ADOQuery3.Active)and(ADOQuery3.RecordCount<=0) then exit;
  id_user:=Prm.UserID;

  if ADOQuery3.RecordCount < 2 then
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
    try
      ReminderBefore[i]:=GetRemainderByPart(i);
    except
      on E:Exception do
      begin
        MainF.MessBox('При формировании возвратной накладной произошла ошибка.'+#13+
                      'Вероятнее все Вы пытаетесь вернуть товар с нулевым остатком.'+#13+
                      'Если возвращаемый товар есть на складе, но при формировании возвратной накладной происходит ошибка'+#13+
                      'обратитесь в отдел закупки!'+#13+
                      'Ошибка: '+E.Message,16);
        exit;
      end;
    end;
    inc(i);
    ADOQuery3.Next;
  end;

  try
    try
      with aTmp do
      begin
        SQL.Clear;
        SQL.Add(' exec spY_WriteVozvrat @pid_user = ' + IntToStr(id_user) +
                                      ', @dat = ' + ''''+FormatDateTime('YYYY-MM-DD', Date()) +
                                      ''', @priznak = 27 ');
        ExecSQL;
      end;
    except
      on E:Exception do
      begin
//        MessageDlg('Убедитесь, что все товары к возврату подготовлены '+#13+'и повторите формирование возвратной накладной!'+#13+'Ошибка сервера: '+E.Message,mtError,[mbOK],0);
        MainF.MessBox('При формировании возвратной накладной произошла ошибка.'+#13+
                      'Вероятнее все Вы пытаетесь вернуть товар с нулевым остатком.'+#13+
                      'Если возвращаемый товар есть на складе, но при формировании возвратной накладной происходит ошибка'+#13+
                      'обратитесь в отдел закупки!'+#13+
                      'Ошибка: '+E.Message,16);
        ReturnToProviderF.Close;
        exit;
      end;
    end;

    i:=0;
    ADOQuery3.First;
    while not ADOQuery3.Eof do
    begin
      try
        ReminderAfter[i]:=GetRemainderByPart(i);
      except
        on E:Exception do
        begin
          MainF.MessBox('При формировании возвратной накладной произошла ошибка.'+#13+
                        'Вероятнее все Вы пытаетесь вернуть товар с нулевым остатком.'+#13+
                        'Если возвращаемый товар есть на складе, но при формировании возвратной накладной происходит ошибка'+#13+
                        'обратитесь в отдел закупки!'+#13+
                        'Ошибка: '+E.Message,16);
          exit;
        end;
      end;
      inc(i);
      ADOQuery3.Next;
    end;

    try
      if not CompareRemainders(ReminderBefore,ReminderAfter) then
      begin
        raise Exception.Create('Убедитесь, что все товары к возврату подготовлены '+#13+'и повторите формирование возвратной накладной!');
//        MessageDlg('Убедитесь, что все товары к возврату подготовлены '+#13+'и повторите формирование возвратной накладной!',mtError,[mbOK],0);
        ReturnToProviderF.Close;
        exit;
      end;
    except
      on E:Exception do
      begin
        MainF.MessBox('При формировании возвратной накладной произошла ошибка.'+#13+
                      'Вероятнее все Вы пытаетесь вернуть товар с нулевым остатком.'+#13+
                      'Если возвращаемый товар есть на складе, но при формировании возвратной накладной происходит ошибка'+#13+
                      'обратитесь в отдел закупки!'+#13+
                      'Ошибка: '+E.Message,16);
        exit;
      end;
    end;

    with ReturnToProviderF do
    begin
      with aTmp do
      begin
        SQL.Clear;
        SQL.Add('delete from chk_vozr ');
        SQL.Add('where id_user = :pid_user and compname=host_name()');
        Parameters.Clear;
        Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
        ExecSQL;
      end;

      with ADOQuery3 do
      begin
        SQL.Clear;
        SQL.Add('select * from chk_vozr (nolock)');
        SQL.Add('where id_user = :pid_user and compname=host_name()');
        Parameters.Clear;
        Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
        Open;
      end;
      bbCreateOrder.Enabled:=false;
      bbCreateClaime.Enabled:=false;
    end;
//    MessageDlg('Накладная на возврат поставщику сформирована.',mtInformation,[mbOK],0);
    MainF.MessBox('Накладная на возврат поставщику сформирована.',64);
    ReturnToProviderF.Close;
  except
    on E:Exception do
      MainF.MessBox('При формировании возвратной накладной произошла ошибка.'+#13+
                    'Вероятнее все Вы пытаетесь вернуть товар с нулевым остатком.'+#13+
                    'Если возвращаемый товар есть на складе, но при формировании возвратной накладной происходит ошибка'+#13+
                    'обратитесь в отдел закупки!'+#13+
                    'Ошибка: '+E.Message,16);
//    MessageDlg('Убедитесь, что все товары к возврату подготовлены '+#13+'и повторите формирование возвратной накладной!'+#13+'Ошибка сервера: '+E.Message,mtError,[mbOK],0);
  end;
end;

function TReturnToProviderF.GetRemainderByPart(arr_elem: integer): TRemainder;
var
  rec_count: integer;
  res: array of TRemainder;
  i: Integer;
begin
  with aTmp do
  begin
    SQL.Clear;
    SQL.Add('declare @id_user int set @id_user=:id_user');
    SQL.Add('select c.kod_name,c.art_code,c.kol,s.ostat ');
    SQL.Add('from');
    SQL.Add('  chk_vozr c');
    SQL.Add('  left join sprtov s on s.kod_name=c.kod_name');
    SQL.Add('where');
    SQL.Add('  c.compname=host_name() and c.id_user=@id_user');
    Parameters.Clear;
    Parameters.CreateParameter('id_user',ftInteger,pdInput,10,Prm.UserID);
    Open;
  end;

  aTmp.Last;
  rec_count:=aTmp.RecordCount;
  aTmp.First;
  SetLength(res,rec_count);

  i:=arr_elem;
  repeat
    res[i].kod_name:=aTmp.FieldByName('kod_name').AsInteger;
    res[i].art_code:=aTmp.FieldByName('art_code').AsInteger;
    res[i].kol:=aTmp.FieldByName('kol').AsFloat;
    res[i].ostat:=aTmp.FieldByName('ostat').AsFloat;
    Result:=res[i];

    aTmp.Next;
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

  kod_N_Before:=0;
  kod_N_After:=0;
  art_C_Before:=0;
  art_C_After:=0;
  kol_Before:=0;
  kol_After:=0;
  ost_Before:=0;
  ost_After:=0;

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

    j:=0;
    repeat
      if Before[i].kod_name=After[j].kod_name then
      begin
        kod_N_After:=After[i].kod_name;
        art_C_After:=After[i].art_code;
        kol_After:=After[i].kol;
        ost_After:=After[i].ostat;
        Break;
      end;
      inc(j);
    until j = Length(After);

    if ost_Before <> ost_After + kol_Before then
    begin
      Result:=false;
      exit;
    end;
    inc(i);
  until i=Length(Before);
end;

procedure TReturnToProviderF.BitBtn1Click(Sender: TObject);
var
  count_available, count_check: integer;
  id_user: integer;
begin
  id_user:=Prm.UserID;
  count_available:=0;
  count_check:=0;
  try
    AddToReturnF:=TAddToReturnF.Create(self);
    try
      //проверить, есть ли уже запись в чеке с этим товаром
      ReturnToProviderF.aTmp.SQL.Clear;
      ReturnToProviderF.aTmp.SQL.Add('select * from chk_vozr (nolock)');
      ReturnToProviderF.aTmp.SQL.Add('where art_code = :art_code');
      ReturnToProviderF.aTmp.SQL.Add('and id_user = :pid_user and compname=host_name()');
      ReturnToProviderF.aTmp.Parameters.Clear;
      ReturnToProviderF.aTmp.Parameters.CreateParameter('art_code', ftInteger, pdInputOutput, 10, ReturnToProviderF.ADOQuery2.FieldByName('art_code').Value);
      ReturnToProviderF.aTmp.Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
      ReturnToProviderF.aTmp.Open;

      if ReturnToProviderF.aTmp.RecordCount > 0 then count_check:=ReturnToProviderF.aTmp.FieldByName('KOL').Value;  //количество товара подготовленого к возврату поставщику kod_name в chek
      count_available:=ADOQuery2.FieldByName('ostat').Value;  //количество позиций по kod_name в rtovar

      //показать окно с максимальным количеством выбраного товара к возврату
      AddToReturnF.Label2.Visible:=True;
      AddToReturnF.Label1.Visible:=True;
      AddToReturnF.edKol.Visible:=True;
      AddToReturnF.Label4.Visible:=true;
      AddToReturnF.ComboBox1.Visible:=true;
      AddToReturnF.Label3.Enabled:=False;
      AddToReturnF.Edit1.Enabled:=False;
      AddToReturnF.Edit1.Text:='';

      ReturnToProviderF.aTmp.SQL.Clear;
      ReturnToProviderF.aTmp.SQL.Add('select * from SPRPRVOZR (nolock) where vis_vz_post=1 order by descr');
      ReturnToProviderF.aTmp.Open;
      ReturnToProviderF.aTmp.First;

      AddToReturnF.ComboBox1.Items.Clear;
      AddToReturnF.ComboBox1.Text:='';
      AddToReturnF.ComboBox2.Items.Clear;
      AddToReturnF.ComboBox2.Text:='';
      while not ReturnToProviderF.aTmp.Eof do
      begin
        AddToReturnF.ComboBox1.Items.Add(ReturnToProviderF.aTmp.FieldByName('descr').Value);
        AddToReturnF.ComboBox2.Items.Add(IntToStr(ReturnToProviderF.aTmp.FieldByName('id').Value));
        ReturnToProviderF.aTmp.Next;
      end;
      AddToReturnF.ComboBox1.ItemIndex:=-1;
      AddToReturnF.ComboBox2.ItemIndex:=-1;
      AddToReturnF.Caption:='Количество';
      AddToReturnF.Position:=poMainFormCenter;
      AddToReturnF.Label2.Caption:=ReturnToProviderF.ADOQuery2.FieldByName('names').Value;
      if count_available-count_check > 0 then AddToReturnF.edKol.Text:=IntToStr(count_available-count_check) else exit;

      AddToReturnF.ShowModal;
    finally
      AddToReturnF.Free;
    end;
  except
    ShowMessage('Что-то пошло не так. Попробуйте повторить!');
  end;
  bbCreateOrder.Enabled:=true;
  bbCreateClaime.Enabled:=true;
end;

procedure TReturnToProviderF.BitBtn2Click(Sender: TObject);
var
  id_user: integer;
begin
  id_user:=Prm.UserID;
  if ADOQuery3.RecordCount>0 then
  begin
    with aTmp do
    begin
      SQL.Clear;
      SQL.Clear;
      SQL.Add('delete from chk_vozr ');
      SQL.Add('where KOD_NAME = :KOD_NAME');
      SQL.Add('and id_user = :pid_user and compname=host_name()');
      Parameters.Clear;
      Parameters.CreateParameter('KOD_NAME', ftInteger, pdInputOutput, 10, ReturnToProviderF.ADOQuery3.FieldByName('KOD_NAME').Value);
      Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
      ExecSQL;
    end;
    with ReturnToProviderF.ADOQuery3 do
    begin
      SQL.Clear;
      SQL.Add('select * from chk_vozr (nolock) ');
      SQL.Add('where id_user = :pid_user and compname=host_name()');
      Parameters.Clear;
      Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
      Open;
    end;
  end;
  if ADOQuery3.RecordCount > 0 then
  begin
    bbCreateOrder.Enabled:=true;
    bbCreateClaime.Enabled:=true;
  end
  else
  begin
    bbCreateOrder.Enabled:=false;
    bbCreateClaime.Enabled:=false;
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
      SQL.Add('delete from chk_vozr ');
      SQL.Add('where id_user = :pid_user and compname=host_name()');
      Parameters.Clear;
      Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
      ExecSQL;

      SQL.Clear;
      SQL.Add('select * from chk_vozr (nolock)');
      SQL.Add('where id_user = :pid_user and compname=host_name()');
      Parameters.Clear;
      Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
      Open;
    end;
    if ADOQuery3.RecordCount > 0 then
    begin
      bbCreateOrder.Enabled:=true;
      bbCreateClaime.Enabled:=true;
    end
    else
    begin
      bbCreateOrder.Enabled:=false;
      bbCreateClaime.Enabled:=false;
    end;
  end;
end;

procedure TReturnToProviderF.FormCreate(Sender: TObject);
var
  id_user: integer;
begin
  ord:='names';
  ReturnType:=0; //возврат поставщику по накладной
  Caption:=MFC;
  DBGrid2.Columns[1].Title.Font.Color:=clRed;
  id_user:=Prm.UserID;
end;

procedure TReturnToProviderF.DBGrid2TitleClick(Column: TColumn);
var
  i: integer;
begin
  ord := Column.FieldName;
  for i:=0 to DBGrid2.Columns.Count-1 do
    DBGrid2.Columns[i].Title.Font.Color := clBlack;
  OpenNakl(ord);
  Column.Title.Font.Color := clred;
end;

procedure TReturnToProviderF.DBGrid2KeyPress(Sender: TObject;
  var Key: Char);
type
  IntSet = set of '0'..'9';
var
  y: String;
  symbol: IntSet;
begin
  symbol := ['0'..'9'];
  Case Key of
    Char(27): fY := '';
  else
    if DBGrid2.SelectedIndex = 1 then
    begin
      y := fY + Key;
      ADOQuery2.Filter := '[names] = '''+TrimRight(Y)+'''';

      If (Sender as TDBGrid).DataSource.DataSet.Locate('names',TrimRight(Y),[loCaseInsensitive, loPartialKey]) then
      begin
        fY := Y;
        DBGrid2.Refresh;
      end//if locate
      else
        Beep;
    End;// else
  end;

  if (DBGrid2.SelectedIndex = 0) and (key in symbol) then
  begin
    y := fY + Key;
    If ADOQuery2.Locate('art_code',TrimRight(Y),[]) then
    begin
      fY := Y;
      DBGrid2.Refresh;
    end//if locate
    else
      fY := Y;
    Beep;
  end;
end;

procedure TReturnToProviderF.DBGrid2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key >= 37) and (key <= 40) then fY := '';
end;

procedure TReturnToProviderF.BitBtn3Click(Sender: TObject);
begin
  OpenCheck;
  if ADOQuery3.RecordCount > 0 then bbCreateOrder.Enabled:=true else bbCreateOrder.Enabled:=false;
end;

procedure TReturnToProviderF.bbCreateClaimeClick(Sender: TObject);
var
  id_user: integer;
{
  i: integer;
}
begin
  if Not MainF.CheckPassword(MainF.GetPasswRep) then Exit;
  if (ADOQuery3.Active)and(ADOQuery3.RecordCount<=0) then exit;
  id_user:=Prm.ID_Gamma;

  try
    try
      with ReturnToProviderF do
      begin
        with aTmp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('insert into Claims (record_id, claime_date, Apotheka, ');
          SQL.Add('    id_postav, nn_prih, dt_prih, id_part8, kod_name, art_code,');
          SQL.Add('    names, art_name, kol, cena, cena_zakup, pr_vz, VzDescr,');
          SQL.Add('    NumSeriya, SrokGodn, CompName, ID_Gamma, ');
          SQL.Add('    F_NDS');
          SQL.Add('  )');
          SQL.Add('  select');
          SQL.Add('    newid(),   getdate(),   '+IntToStr(Prm.AptekaID)+', ');
          SQL.Add('    id_postav, nn_prih, dt_prih, id_part8, KOD_NAME, ART_CODE,');
          SQL.Add('    NAMES, ART_NAME, KOL, CENA, cena_zakup, pr_vz, VzDescr, ');
          SQL.Add('    NumSeriya, SrokGodn, host_name(), '+IntToStr(Prm.ID_Gamma)+', ');
          SQL.Add('    F_NDS');
          SQL.Add('  from');
          SQL.Add('    chk_vozr');
          SQL.Add('  where');
          SQL.Add('    CompName = HOST_NAME()');
          SQL.Add('    and ID_USER = '+IntToStr(Prm.UserID));
          SQL.Add('');
          SQL.Add('delete from');
          SQL.Add('  chk_vozr');
          SQL.Add('where');
          SQL.Add('  CompName = HOST_NAME()');
          SQL.Add('  and ID_USER = '+IntToStr(Prm.UserID));
          ExecSQL;
        end;
      end;
{
  if ADOQuery3.RecordCount < 2 then
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
    ReminderBefore[i]:=GetRemainderByPart(i);
    inc(i);
    ADOQuery3.Next;
  end;
  try
    try
      with aTmp do
      begin
        SQL.Clear;
        SQL.Add(' exec spY_WriteVozvrat @pid_user = ' + IntToStr(id_user) +
                                      ', @dat = ' + ''''+FormatDateTime('YYYY-MM-DD', Date()) +
                                      ''', @priznak = 27 ');
        ExecSQL;
      end;
    except
      on E:Exception do
      begin
        MessageDlg('Убедитесь, что все товары к возврату подготовлены '+#13+'и повторите формирование возвратной накладной!'+#13+'Ошибка сервера: '+E.Message,mtError,[mbOK],0);
        ReturnToProviderF.Close;
        exit;
      end;
    end;

    i:=0;
    ADOQuery3.First;
    while not ADOQuery3.Eof do
    begin
      ReminderAfter[i]:=GetRemainderByPart(i);
      inc(i);
      ADOQuery3.Next;
    end;

    if not CompareRemainders(ReminderBefore,ReminderAfter) then
    begin
      MessageDlg('Убедитесь, что все товары к возврату подготовлены '+#13+'и повторите формирование возвратной накладной!',mtError,[mbOK],0);
      ReturnToProviderF.Close;
      exit;
    end;

    with ReturnToProviderF do
    begin
      with aTmp do
      begin
        SQL.Clear;
        SQL.Add('delete from chk_vozr ');
        SQL.Add('where id_user = :pid_user and compname=host_name()');
        Parameters.Clear;
        Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
        ExecSQL;
      end;

      with ADOQuery3 do
      begin
        SQL.Clear;
        SQL.Add('select * from chk_vozr (nolock)');
        SQL.Add('where id_user = :pid_user and compname=host_name()');
        Parameters.Clear;
        Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
        Open;
      end;
      bbCreateOrder.Enabled:=false;
    end;
    MessageDlg('Накладная на возврат поставщику сформирована.',mtInformation,[mbOK],0);
    ReturnToProviderF.Close;
  except
    on E:Exception do
    MessageDlg('Убедитесь, что все товары к возврату подготовлены '+#13+'и повторите формирование возвратной накладной!'+#13+'Ошибка сервера: '+E.Message,mtError,[mbOK],0);
  end;
}
      with ReturnToProviderF do
      begin
        with aTmp do
        begin
          SQL.Clear;
          SQL.Add('delete from chk_vozr ');
          SQL.Add('where id_user = :pid_user and compname=host_name()');
          Parameters.Clear;
          Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
          ExecSQL;
        end;

        with ADOQuery3 do
        begin
          SQL.Clear;
          SQL.Add('select * from chk_vozr (nolock)');
          SQL.Add('where id_user = :pid_user and compname=host_name()');
          Parameters.Clear;
          Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
          Open;
        end;
        bbCreateOrder.Enabled:=false;
        bbCreateClaime.Enabled:=false;
      end;
    finally
//      MessageDlg('Претензия поставщику сформирована!',mtInformation,[mbOK],0);
      MainF.MessBox('Претензия поставщику сформирована!',64)
    end;
  except
    on E:Exception do MessageDlg('Во время формирования претензии возникла ошибка: '+E.Message,mtError,[mbOK],0);
  end;
end;

end.
