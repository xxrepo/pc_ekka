unit AddToReturnU;

interface

uses
  Forms, StdCtrls, Buttons, Controls, Classes, ADODB, DB, DateUtils, SysUtils,
  Dialogs;

type
  TAddToReturnF = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edKol: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbHand: TCheckBox;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  end;

var
  AddToReturnF: TAddToReturnF;

implementation

uses
  ReturnToProviderU, MainU;

{$R *.dfm}

procedure TAddToReturnF.BitBtn2Click(Sender: TObject);
begin
  AddToReturnF.Close;
end;

procedure TAddToReturnF.BitBtn1Click(Sender: TObject);
var
  id_user: integer;
  count_available, count_check: integer;
  id_part8: string;
  CompName: string;

  procedure AddTovarToCheck;
  type
    TCheck = record
      KOD_NAME: integer; //int
      NAMES: string[200]; //varchar(200)
      KOL: integer; //int
      CENA: double; //numeric(8, 2)
      F_NDS: integer; //smallint
      TYPE_TOV: smallint; //smallint
      ID_USER:smallint; //smallint
      ART_CODE: integer; //int
      ART_NAME: string[16]; //varchar(16)
      DATEINS: TDateTime; //datetime
      PR1: smallint; //smallint
      CompName: string[50]; //varchar(50)
      SKLAD: string[9]; //varchar(9)
      shtrih: Longint; //bigint
      prvozr: smallint; //smallint
      CenaP: double; //numeric(8, 2)
      skladv: string[15]; //varchar(15)
      pr_vz_post: integer; //int
      id_postav: string[40]; //GUID - binary(16)
      nn_prih: string[50]; //varchar(50)
      dt_prih: TDateTime; //datetime
      VzDescr: string; //varchar(500)
      pr_vz: string[50]; //varchar(50)
      id_part8: string[40]; //GUID - binary(16)
      NumSeriya: string[50]; //varchar(50)
      SrokGodn: TDateTime; //datetime
      cena_zakup: double; //numeric(8, 2)
    end;
  var
    check: array of TCheck;
    i: integer;
    kol_return: integer;
    fl_break: boolean;
  begin
    with ReturnToProviderF.aTmp do
    begin
      //запись товара в таблицу чеков
      SQL.Clear;
      SQL.Add('declare @CompName varchar(50) set @CompName = host_name()');
      SQL.Add('select @CompName as comp_na');
      Open;
      CompName:=FieldByName('comp_na').asString;

      SQL.Clear;
      SQL.Add('declare @iddoc int set @iddoc = :iddoc');
      SQL.Add('declare @id_postav uniqueidentifier set @id_postav = convert(uniqueidentifier,:id_postav)');
      SQL.Add('declare @nn_prih varchar(50) set @nn_prih = :nn_prih');
      SQL.Add('declare @dt_prih datetime set @dt_prih = :dt_prih');
      SQL.Add('declare @date_nakl datetime set @date_nakl = :date_nakl');
      SQL.Add('declare @nn_nakl varchar(15) set @nn_nakl = :nn_nakl');
      SQL.Add('declare @art_code int set @art_code = :art_code');
      SQL.Add('declare @numseriya varchar(50) set @numseriya = :numseriya');
      SQL.Add('declare @srokgodn datetime set @srokgodn = :srokgodn');
      SQL.Add('select');
      SQL.Add('  j.Type_Tov, j.SKLAD, j.nn_prih, convert(uniqueidentifier,j.id_postav) as id_postav, j.dt_prih,');
      SQL.Add('  r.KOL, r.CENAP, r.SHTRIH,');
      SQL.Add('  s.KOD_NAME, s.ART_CODE, s.NAMES, s.CenaZakup as cena_zakup, s.cena as CENA, s.F_NDS, s.ART_NAME,');
      SQL.Add('  convert(uniqueidentifier,i.ID_PART8) as id_part8, i.SrokGodn, i.NumSeriya');
      SQL.Add('from');
      SQL.Add('  JMOVES j (nolock)');
      SQL.Add('  left join rTovar r (nolock) on r.IDDOC=j.IDDOC');
      SQL.Add('  inner join SPRTOV s (nolock) on s.KOD_NAME=r.KOD_NAME');
      SQL.Add('  left join SERII i (nolock) on i.ID_PART8=s.id_part8');
      SQL.Add('where');
      SQL.Add('  j.type_nakl = 1');
      SQL.Add('  and j.reoc=0 and j.obl in (0, 1)');
      SQL.Add('  and not j.id_postav is null');
      SQL.Add('  and j.iddoc = @iddoc');
      SQL.Add('  and j.id_postav=convert(binary(16),@id_postav)');
      SQL.Add('  and j.nn_prih=@nn_prih');
      SQL.Add('  and j.dt_prih=@dt_prih');
      SQL.Add('  and j.DATE_NAKL=@date_nakl');
      SQL.Add('  and j.NN_NAKL=@nn_nakl');
      SQL.Add('  and s.ART_CODE=@art_code');
      SQL.Add('  and i.NumSeriya=@numseriya');
      SQL.Add('  and i.SrokGodn=@srokgodn');
      Parameters.Clear;
      if not ReturnToProviderF.ADOQuery2.FieldByName('iddoc').IsNull then Parameters.CreateParameter('iddoc',ftInteger,pdInput,10,ReturnToProviderF.ADOQuery2.FieldByName('iddoc').Value) else Parameters.CreateParameter('iddoc',ftInteger,pdInput,10,-1);
      if not ReturnToProviderF.ADOQuery2.FieldByName('id_postav').IsNull then Parameters.CreateParameter('id_postav',ftGuid,pdInput,36,ReturnToProviderF.ADOQuery2.FieldByName('id_postav').Value) else Parameters.CreateParameter('id_postav',ftGuid,pdInput,36,'00000000-0000-0000-0000-000000000000');
      if not ReturnToProviderF.ADOQuery2.FieldByName('nn_prih').IsNull then Parameters.CreateParameter('nn_prih',ftString,pdInput,50,ReturnToProviderF.ADOQuery2.FieldByName('nn_prih').Value) else Parameters.CreateParameter('nn_prih',ftString,pdInput,50,'');
      if not ReturnToProviderF.ADOQuery2.FieldByName('dt_prih').IsNull then Parameters.CreateParameter('dt_prih',ftDateTime,pdInput,23,ReturnToProviderF.ADOQuery2.FieldByName('dt_prih').Value) else Parameters.CreateParameter('dt_prih',ftDateTime,pdInput,23,'1970-01-01');
      if not ReturnToProviderF.ADOQuery2.FieldByName('date_nakl').IsNull then Parameters.CreateParameter('date_nakl',ftDateTime,pdInput,23,ReturnToProviderF.ADOQuery2.FieldByName('date_nakl').Value) else Parameters.CreateParameter('date_nakl',ftDateTime,pdInput,23,'1970-01-01');
      if not ReturnToProviderF.ADOQuery2.FieldByName('nn_nakl').IsNull then Parameters.CreateParameter('nn_nakl',ftString,pdInput,15,ReturnToProviderF.ADOQuery2.FieldByName('nn_nakl').Value) else Parameters.CreateParameter('nn_nakl',ftString,pdInput,15,'');
      if not ReturnToProviderF.ADOQuery2.FieldByName('art_code').IsNull then Parameters.CreateParameter('art_code',ftInteger,pdInput,10,ReturnToProviderF.ADOQuery2.FieldByName('art_code').Value) else Parameters.CreateParameter('art_code',ftInteger,pdInput,10,-1);
      if not ReturnToProviderF.ADOQuery2.FieldByName('numseriya').IsNull then Parameters.CreateParameter('numseriya',ftString,pdInput,50,ReturnToProviderF.ADOQuery2.FieldByName('numseriya').Value) else Parameters.CreateParameter('numseriya',ftString,pdInput,50,'');
      if not ReturnToProviderF.ADOQuery2.FieldByName('srokgodn').IsNull then Parameters.CreateParameter('srokgodn',ftDateTime,pdInput,23,ReturnToProviderF.ADOQuery2.FieldByName('srokgodn').Value) else Parameters.CreateParameter('srokgodn',ftDateTime,pdInput,23,'1970-01-01');
      Open;

      ReturnToProviderF.aTmp.Last;
      SetLength(check,ReturnToProviderF.aTmp.RecordCount);
      ReturnToProviderF.aTmp.First;
      i:=0;
      while not ReturnToProviderF.aTmp.Eof do
      begin
        check[i].KOD_NAME:=ReturnToProviderF.aTmp.FieldByName('KOD_NAME').AsInteger;
        if not ReturnToProviderF.aTmp.FieldByName('NAMES').IsNull then check[i].NAMES:=ReturnToProviderF.aTmp.FieldByName('NAMES').AsString else check[i].NAMES:='';
        check[i].KOL:=ReturnToProviderF.aTmp.FieldByName('KOL').AsInteger;
        if not ReturnToProviderF.aTmp.FieldByName('CENA').IsNull then check[i].CENA:=ReturnToProviderF.aTmp.FieldByName('CENA').AsFloat else check[i].CENA:=0;
        if not ReturnToProviderF.aTmp.FieldByName('F_NDS').IsNull then check[i].F_NDS:=ReturnToProviderF.aTmp.FieldByName('F_NDS').AsInteger else check[i].F_NDS:=-1;
        if not ReturnToProviderF.aTmp.FieldByName('TYPE_TOV').IsNull then check[i].TYPE_TOV:=ReturnToProviderF.aTmp.FieldByName('TYPE_TOV').AsInteger else check[i].TYPE_TOV:=-1;
        check[i].ID_USER:=Prm.UserID;
        if not ReturnToProviderF.aTmp.FieldByName('ART_CODE').IsNull then check[i].ART_CODE:=ReturnToProviderF.aTmp.FieldByName('ART_CODE').AsInteger else check[i].ART_CODE:=-1;
        if not ReturnToProviderF.aTmp.FieldByName('ART_NAME').IsNull then check[i].ART_NAME:=ReturnToProviderF.aTmp.FieldByName('ART_NAME').AsString else check[i].ART_NAME:='';
        check[i].DATEINS:=Date();
        check[i].PR1:=-1;
        check[i].CompName:=CompName;
        if not ReturnToProviderF.aTmp.FieldByName('shtrih').IsNull then check[i].shtrih:=ReturnToProviderF.aTmp.FieldByName('shtrih').AsInteger else check[i].shtrih:=-1;
        check[i].prvozr:=27;
        if not ReturnToProviderF.aTmp.FieldByName('CenaP').IsNull then check[i].CenaP:=ReturnToProviderF.aTmp.FieldByName('CenaP').AsFloat else check[i].CenaP:=0;
        check[i].skladv:='';
        check[i].pr_vz_post:=StrToInt(ComboBox2.Items[ComboBox1.ItemIndex]);
        if not ReturnToProviderF.aTmp.FieldByName('id_postav').IsNull then check[i].id_postav:=ReturnToProviderF.aTmp.FieldByName('id_postav').AsString else check[i].id_postav:='00000000-0000-0000-0000-000000000000';
        if not ReturnToProviderF.aTmp.FieldByName('nn_prih').IsNull then check[i].nn_prih:=ReturnToProviderF.aTmp.FieldByName('nn_prih').AsString else check[i].nn_prih:='';
        if not ReturnToProviderF.aTmp.FieldByName('dt_prih').IsNull then check[i].dt_prih:=ReturnToProviderF.aTmp.FieldByName('dt_prih').AsDateTime else check[i].dt_prih:=StrToDate('1970-01-01');
        if trim(Edit1.Text)<>'' then check[i].VzDescr:=Edit1.Text else check[i].VzDescr:='';
        check[i].pr_vz:=ComboBox1.Items[ComboBox1.ItemIndex];
        if not ReturnToProviderF.aTmp.FieldByName('id_part8').IsNull then check[i].id_part8:=ReturnToProviderF.aTmp.FieldByName('id_part8').AsString else check[i].id_part8:='00000000-0000-0000-0000-000000000000';
        if not ReturnToProviderF.aTmp.FieldByName('NumSeriya').IsNull then check[i].NumSeriya:=ReturnToProviderF.aTmp.FieldByName('NumSeriya').AsString else check[i].NumSeriya:='';
        if not ReturnToProviderF.aTmp.FieldByName('SrokGodn').IsNull then check[i].SrokGodn:=ReturnToProviderF.aTmp.FieldByName('SrokGodn').AsDateTime else check[i].SrokGodn:=StrToDate('1970-01-01');
        if not ReturnToProviderF.aTmp.FieldByName('cena_zakup').IsNull then check[i].cena_zakup:=ReturnToProviderF.aTmp.FieldByName('cena_zakup').AsFloat else check[i].cena_zakup:=0;
        inc(i);
        ReturnToProviderF.aTmp.Next;
      end;

      fl_break:=false;
      i:=0;
      kol_return:=StrToInt(AddToReturnF.edKol.Text);
      repeat
        if kol_return < check[i].KOL then
        begin
          check[i].KOL:=kol_return;
          fl_break:=true;
        end
        else
          kol_return:=kol_return - check[i].KOL;

        SQL.Clear;
        SQL.Add('declare @KOD_NAME int set @KOD_NAME=:KOD_NAME'); //KOD_NAME: integer; //int
        SQL.Add('declare @NAMES varchar(200) set @NAMES=:NAMES'); //NAMES: string[200]; //varchar(200)
        SQL.Add('declare @KOL int set @KOL=:KOL'); //KOL: integer; //int
        SQL.Add('declare @CENA numeric(8,2) set @CENA=:CENA'); //CENA: double; //numeric(8, 2)
        SQL.Add('declare @F_NDS smallint set @F_NDS=:F_NDS'); //F_NDS: integer; //smallint
        SQL.Add('declare @TYPE_TOV smallint set @TYPE_TOV=:TYPE_TOV'); //TYPE_TOV: smallint; //smallint
        SQL.Add('declare @ID_USER smallint set @ID_USER=:ID_USER'); //ID_USER:smallint; //smallint
        SQL.Add('declare @ART_CODE int set @ART_CODE=:ART_CODE'); //ART_CODE: integer; //int
        SQL.Add('declare @ART_NAME varchar(16) set @ART_NAME=:ART_NAME'); //ART_NAME: string[16]; //varchar(16)
        SQL.Add('declare @DATEINS datetime set @DATEINS=convert(datetime,:DATEINS)'); //DATEINS: TDateTime; //datetime
        SQL.Add('declare @PR1 smallint set @PR1=:PR1'); //PR1: smallint; //smallint
        SQL.Add('declare @CompName varchar(50) set @CompName=:CompName'); //CompName: string[50]; //varchar(50)
        SQL.Add('declare @SKLAD varchar(9) set @SKLAD=:SKLAD'); //SKLAD: string[9]; //varchar(9)
        SQL.Add('declare @shtrih bigint set @shtrih=:shtrih'); //shtrih: Longint; //bigint
        SQL.Add('declare @prvozr smallint set @prvozr=:prvozr'); //prvozr: smallint; //smallint
        SQL.Add('declare @CenaP numeric(8,2) set @CenaP=:CenaP'); //CenaP: double; //numeric(8, 2)
        SQL.Add('declare @skladv varchar(15) set @skladv=:skladv'); //skladv: string[15]; //varchar(15)
        SQL.Add('declare @pr_vz_post int set @pr_vz_post=:pr_vz_post'); //pr_vz_post: integer; //int
        SQL.Add('declare @id_postav uniqueidentifier set @id_postav = convert(uniqueidentifier,:id_postav)'); //id_postav: string[40]; //GUID - binary(16)
        SQL.Add('declare @nn_prih varchar(50) set @nn_prih=:nn_prih'); //nn_prih: string[50]; //varchar(50)
        SQL.Add('declare @dt_prih datetime set @dt_prih = convert(datetime,:dt_prih)'); //dt_prih: TDateTime; //datetime
        SQL.Add('declare @VzDescr varchar(500) set @VzDescr=:VzDescr'); //VzDescr: string; //varchar(500)
        SQL.Add('declare @pr_vz varchar(50) set @pr_vz=:pr_vz'); //pr_vz: string[50]; //varchar(50)
        SQL.Add('declare @id_part8 uniqueidentifier set @id_part8=convert(uniqueidentifier,:id_part8)'); //id_part8: string[40]; //GUID - binary(16)
        SQL.Add('declare @NumSeriya varchar(50) set @NumSeriya=:NumSeriya'); //NumSeriya: string[50]; //varchar(50)
        SQL.Add('declare @SrokGodn datetime set @SrokGodn=convert(datetime,:SrokGodn)'); //SrokGodn: TDateTime; //datetime
        SQL.Add('declare @cena_zakup numeric(8,2) set @cena_zakup=:cena_zakup'); //cena_zakup numeric(8, 2) NULL
        SQL.Add('insert into chk_vozr (');
        SQL.Add('  KOD_NAME, NAMES, KOL, CENA, F_NDS, TYPE_TOV, ID_USER, ART_CODE, ');
        SQL.Add('  ART_NAME, DATEINS, PR1, CompName, SKLAD, shtrih, prvozr, CenaP, ');
        SQL.Add('  skladv, pr_vz_post, id_postav, nn_prih, dt_prih, VzDescr, ');
        SQL.Add('  pr_vz, id_part8, NumSeriya, SrokGodn, cena_zakup ');
        SQL.Add(') values (');
        SQL.Add('  @KOD_NAME, @NAMES, @KOL, @CENA, @F_NDS, @TYPE_TOV, @ID_USER, '); //KOD_NAME //NAMES //KOL //CENA //F_NDS //TYPE_TOV //ID_USER
        SQL.Add('  @ART_CODE, @ART_NAME, convert(datetime,@DATEINS), @PR1, '); //ART_CODE //ART_NAME //DATEINS //PR1
        SQL.Add('  @CompName, @SKLAD, @shtrih, @prvozr, @CenaP, '); //CompName //SKLAD //shtrih //prvozr //CenaP
        SQL.Add('  @skladv, @pr_vz_post, convert(uniqueidentifier,@id_postav), '); //skladv //pr_vz_post //id_postav
        SQL.Add('  @nn_prih, convert(datetime,@dt_prih), @VzDescr, @pr_vz, '); //nn_prih //dt_prih //VzDescr //pr_vz
        SQL.Add('  convert(uniqueidentifier,@id_part8), @NumSeriya, convert(datetime,@SrokGodn), @cena_zakup'); //id_part8 //NumSeriya //SrokGodn //cena_zakup
        SQL.Add(')');
        Parameters.Clear;
        Parameters.CreateParameter('KOD_NAME',ftInteger,pdInput,10,check[i].KOD_NAME); //KOD_NAME: integer; //int
        Parameters.CreateParameter('NAMES',ftString,pdInput,200,check[i].NAMES); //NAMES: string[200]; //varchar(200)
        Parameters.CreateParameter('KOL',ftInteger,pdInput,10,check[i].KOL); //KOL: integer; //int
        Parameters.CreateParameter('CENA',ftFloat,pdInput,11,check[i].CENA); //CENA: double; //numeric(8, 2)
        Parameters.CreateParameter('F_NDS',ftSmallint,pdInput,5,check[i].F_NDS); //F_NDS: integer; //smallint
        Parameters.CreateParameter('TYPE_TOV',ftSmallint,pdInput,5,check[i].TYPE_TOV); //TYPE_TOV: smallint; //smallint
        Parameters.CreateParameter('ID_USER',ftSmallint,pdInput,5,check[i].ID_USER); //ID_USER:smallint; //smallint
        Parameters.CreateParameter('ART_CODE',ftInteger,pdInput,10,check[i].ART_CODE); //ART_CODE: integer; //int
        Parameters.CreateParameter('ART_NAME',ftString,pdInput,16,check[i].ART_NAME); //ART_NAME: string[16]; //varchar(16)
        Parameters.CreateParameter('DATEINS',ftDateTime,pdInput,23,check[i].DATEINS); //DATEINS: TDateTime; //datetime
        Parameters.CreateParameter('PR1',ftSmallint,pdInput,5,check[i].PR1); //PR1: smallint; //smallint
        Parameters.CreateParameter('CompName',ftString,pdInput,50,check[i].CompName); //CompName: string[50]; //varchar(50)
        Parameters.CreateParameter('SKLAD',ftString,pdInput,9,check[i].SKLAD); //SKLAD: string[9]; //varchar(9)
        Parameters.CreateParameter('shtrih',ftLargeint,pdInput,20,check[i].shtrih); //shtrih: Longint; //bigint
        Parameters.CreateParameter('prvozr',ftSmallint,pdInput,5,check[i].prvozr); //prvozr: smallint; //smallint
        Parameters.CreateParameter('CenaP',ftFloat,pdInput,11,check[i].CenaP); //CenaP: double; //numeric(8, 2)
        Parameters.CreateParameter('skladv',ftString,pdInput,15,check[i].skladv); //skladv: string[15]; //varchar(15)
        Parameters.CreateParameter('pr_vz_post',ftInteger,pdInput,10,check[i].pr_vz_post); //pr_vz_post: integer; //int
        Parameters.CreateParameter('id_postav',ftGuid,pdInput,40,check[i].id_postav); //id_postav: string[40]; //GUID - binary(16)
        Parameters.CreateParameter('nn_prih',ftString,pdInput,50,check[i].nn_prih); //nn_prih: string[50]; //varchar(50)
        Parameters.CreateParameter('dt_prih',ftDateTime,pdInput,23,check[i].dt_prih); //dt_prih: TDateTime; //datetime
        Parameters.CreateParameter('vzdescr',ftString,pdInput,500,check[i].VzDescr); //VzDescr: string; //varchar(500)
        Parameters.CreateParameter('pr_vz',ftString,pdInput,50,check[i].pr_vz); //pr_vz: string[50]; //varchar(50)
        Parameters.CreateParameter('id_part8',ftGuid,pdInput,40,check[i].id_part8); //id_part8: string[40]; //GUID - binary(16)
        Parameters.CreateParameter('NumSeriya',ftString,pdInput,50,check[i].NumSeriya); //NumSeriya: string[50]; //varchar(50)
        Parameters.CreateParameter('SrokGodn',ftDateTime,pdInput,23,check[i].SrokGodn); //SrokGodn: TDateTime; //datetime
        Parameters.CreateParameter('cena_zakup',ftFloat,pdInput,11,check[i].cena_zakup);

        ExecSQL;
        if fl_break then Break;
        inc(i);
      until i=Length(check);
    end;
  end;

  procedure UpdateTovarInCheck;
  begin
    with ReturnToProviderF.aTmp do
    begin
      //запись товара в таблицу чеков
      SQL.Clear;
      SQL.Add('update chk_vozr ');
      SQL.Add('set KOL = :kol,');
      if trim(Edit1.Text)<>'' then SQL.Add('  VzDescr = :vzdescr');
      SQL.Add('  pr_vz_post = :pr_vz_post');
      SQL.Add('  pr_vz = :pr_vz');
      SQL.Add('where KOD_NAME = :KOD_NAME');
      Parameters.Clear;
      Parameters.CreateParameter('kol',ftInteger,pdInput,10,count_check+StrToInt(AddToReturnF.edKol.Text));
      Parameters.CreateParameter('KOD_NAME', ftInteger, pdInputOutput, 10, ReturnToProviderF.ADOQuery3.FieldByName('KOD_NAME').Value);
      if trim(Edit1.Text)<>'' then Parameters.CreateParameter('vzdescr',ftString,pdInput,500,trim(Edit1.Text));
      Parameters.CreateParameter('pr_vz_post',ftInteger,pdInputOutput,10,StrToInt(ComboBox2.Items[ComboBox1.ItemIndex]));
      Parameters.CreateParameter('pr_vz',ftString,pdInputOutput,50,ComboBox1.Items[ComboBox1.ItemIndex]);
      ExecSQL;
    end;
  end;

begin
  //коментарий к возвратной накладной
  if Edit1.Enabled then
  begin
    if trim(Edit1.Text)='' then
    begin
      Edit1.Text:='';
      Edit1.SetFocus;
      exit;
    end;
  end;

  //причина возврата указана?
  if (ComboBox1.ItemIndex=-1)and(ComboBox1.Visible) then
  begin
    ComboBox1.SetFocus;
    ComboBox1.DroppedDown:=true;
    Exit;
  end;

  //количество возвращаемого товара
  if edKol.Visible then
  begin
    count_available:=0;  //количество позиций по kod_name в rtovar
    count_check:=0;  //количество товара подготовленого к возврату поставщику kod_name в chek
    with ReturnToProviderF.aTmp do
    begin
      SQL.Clear;
      SQL.Add('select * from chk_vozr (nolock) where art_code = :art_code');
      Parameters.Clear;
      Parameters.CreateParameter('art_code',ftInteger,pdInputOutput,10,ReturnToProviderF.ADOQuery2.FieldByName('art_code').Value);
      Open;
    end;
    count_available:=ReturnToProviderF.ADOQuery2.FieldByName('KOL').Value;  //количество позиций по kod_name в rtovar
    if ReturnToProviderF.aTmp.RecordCount > 0 then count_check:=ReturnToProviderF.aTmp.FieldByName('KOL').Value;  //количество товара подготовленого к возврату поставщику kod_name в chek

    //количество введено?
    if trim(edKol.Text)='' then
    begin
      edKol.Text:=IntToStr(count_available-count_check);
      exit;
    end;
    //количество - целое число?
    try
      StrToInt(trim(edKol.Text));
    except
      edKol.Text:=IntToStr(count_available-count_check);
    end;
    //количество - меньше или равно остатку на складе
    if (ReturnToProviderF.aTmp.RecordCount > 0) then
    begin
      if StrToInt(edKol.Text)+count_check > count_available then
      begin
        edKol.Text:=IntToStr(count_available-count_check);
        exit;
      end;
    end;

    //добавить возвратные накладные в таблицу чеков
    id_user:=Prm.UserID;
    with ReturnToProviderF do
    begin
      if aTmp.RecordCount <= 0 then
      begin
        //добавить товар к возврату в чек
        AddTovarToCheck;
        ReturnToProviderF.OpenCheck;
        AddToReturnF.Close;
        exit;
      end
      else
      begin
        //запись существует, обновить запись в чеке
        UpdateTovarInCheck;
        ReturnToProviderF.OpenCheck;
//        UpdateCheck;
        AddToReturnF.Close;
        exit;
      end;
    end;
    exit;
  end;
end;

procedure TAddToReturnF.ComboBox1Change(Sender: TObject);
begin
  if ComboBox2.Items[ComboBox1.ItemIndex]='3' then
  begin
    Label3.Enabled:=true;
    Edit1.Enabled:=true;
  end
  else
  begin
    Label3.Enabled:=False;
    Edit1.Enabled:=False;
    Edit1.Text:='';
  end;
end;

end.
