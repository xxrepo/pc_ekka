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

  procedure AddTovarToCheck;
  begin
    with ReturnToProviderF.ADOQuery4 do
    begin
      //запись товара в таблицу чеков
      SQL.Clear;
      SQL.Add('declare @KOD_NAME int set @KOD_NAME = :KOD_NAME');
      SQL.Add('declare @NAMES varchar(200) set @NAMES = :NAMES');
      SQL.Add('declare @KOL int set @KOL = :KOL');
      SQL.Add('declare @CENA numeric(8,2) set @CENA = :CENA');
      SQL.Add('declare @F_NDS smallint set @F_NDS = :F_NDS');
      SQL.Add('declare @TYPE_TOV smallint set @TYPE_TOV = :TYPE_TOV');
      SQL.Add('declare @ID_USER smallint set @ID_USER = :ID_USER');
      SQL.Add('declare @ART_CODE int set @ART_CODE = :ART_CODE');
      SQL.Add('declare @ART_NAME varchar(16) set @ART_NAME = :ART_NAME');
      SQL.Add('declare @SKLAD varchar(15) set @SKLAD = :SKLAD');
      SQL.Add('declare @shtrih bigint set @shtrih = :shtrih');
      SQL.Add('declare @prvozr smallint set @prvozr = :prvozr');
      SQL.Add('declare @CenaP numeric(8,2) set @CenaP = :CenaP');
      SQL.Add('declare @pr_vz_post int set @pr_vz_post = :pr_vz_post');
//      SQL.Add('declare @id_postav uniqueidentifier set @id_postav = convert(varchar(36),:id_postav)');
      SQL.Add('declare @id_postav uniqueidentifier set @id_postav = convert(uniqueidentifier,:id_postav)');
      SQL.Add('declare @nn_prih varchar(50) set @nn_prih = :nn_prih');
      SQL.Add('declare @dt_prih datetime set @dt_prih = :dt_prih');
      SQL.Add('declare @vzdescr varchar(500) set @vzdescr = :vzdescr');
      SQL.Add('insert into ##check');
      SQL.Add('  (KOD_NAME,  NAMES,  KOL,  CENA,  F_NDS,  TYPE_TOV,  ID_USER,  ART_CODE,  ART_NAME,  DATEINS,   CompName,    SKLAD,  shtrih,  ');
      SQL.Add('  prvozr,  CenaP,  pr_vz_post,  id_postav,                      nn_prih,  dt_prih,                    VzDescr)');
      SQL.Add('values');
      SQL.Add('  (@KOD_NAME, @NAMES, @KOL, @CENA, @F_NDS, @TYPE_TOV, @ID_USER, @ART_CODE, @ART_NAME, getdate(), host_name(), @SKLAD, (case when not @shtrih is null then @shtrih end), ');
      SQL.Add('  @prvozr, @CenaP, @pr_vz_post, convert(binary(16),@id_postav), @nn_prih, convert(datetime,@dt_prih), @vzdescr)');
      Parameters.Clear;
      if not ReturnToProviderF.ADOQuery2.FieldByName('KOD_NAME').IsNull then Parameters.CreateParameter('KOD_NAME', ftInteger, pdInputOutput, 10, ReturnToProviderF.ADOQuery2.FieldByName('KOD_NAME').Value);
      if not ReturnToProviderF.ADOQuery2.FieldByName('NAMES').IsNull then Parameters.CreateParameter('NAMES',ftString,pdInputOutput,200, ReturnToProviderF.ADOQuery2.FieldByName('NAMES').Value);
      Parameters.CreateParameter('KOL',ftInteger,pdInputOutput,10,StrToInt(AddToReturnF.edKol.Text));
      if not ReturnToProviderF.ADOQuery2.FieldByName('CENA').IsNull then Parameters.CreateParameter('CENA',ftFloat,pdInputOutput,11,ReturnToProviderF.ADOQuery2.FieldByName('CENA').Value);
      if not ReturnToProviderF.ADOQuery2.FieldByName('F_NDS').IsNull then Parameters.CreateParameter('F_NDS',ftSmallint,pdInputOutput,5,ReturnToProviderF.ADOQuery2.FieldByName('F_NDS').Value);
      if not ReturnToProviderF.ADOQuery2.FieldByName('TYPE_TOV').IsNull then Parameters.CreateParameter('TYPE_TOV',ftSmallint,pdInputOutput,5,ReturnToProviderF.ADOQuery2.FieldByName('TYPE_TOV').Value);
      Parameters.CreateParameter('ID_USER',ftSmallint,pdInputOutput,10,id_user);
      if not ReturnToProviderF.ADOQuery2.FieldByName('ART_CODE').IsNull then Parameters.CreateParameter('ART_CODE',ftInteger,pdInputOutput,10,ReturnToProviderF.ADOQuery2.FieldByName('ART_CODE').Value);
      if not ReturnToProviderF.ADOQuery2.FieldByName('ART_NAME').IsNull then Parameters.CreateParameter('ART_NAME',ftString,pdInputOutput,16,ReturnToProviderF.ADOQuery2.FieldByName('ART_NAME').Value);
      if not ReturnToProviderF.ADOQuery2.FieldByName('SKLAD').IsNull then Parameters.CreateParameter('SKLAD',ftString,pdInputOutput,15,ReturnToProviderF.ADOQuery2.FieldByName('SKLAD').Value);
      if not ReturnToProviderF.ADOQuery2.FieldByName('shtrih').IsNull then Parameters.CreateParameter('shtrih',ftLargeint,pdInputOutput,20,ReturnToProviderF.ADOQuery2.FieldByName('shtrih').Value) else Parameters.CreateParameter('shtrih',ftLargeint,pdInputOutput,20,-1);
      Parameters.CreateParameter('prvozr',ftSmallint,pdInputOutput,5,27);
      if not ReturnToProviderF.ADOQuery2.FieldByName('CenaP').IsNull then Parameters.CreateParameter('CenaP',ftFloat,pdInputOutput,11,ReturnToProviderF.ADOQuery2.FieldByName('CenaP').Value);
      Parameters.CreateParameter('pr_vz_post',ftInteger,pdInputOutput,10,StrToInt(ComboBox2.Items[ComboBox1.ItemIndex]));
      if not ReturnToProviderF.ADOQuery2.FieldByName('id_postav').IsNull then Parameters.CreateParameter('id_postav',ftGuid,pdInputOutput,16,ReturnToProviderF.ADOQuery2.FieldByName('id_postav').Value);
      if not ReturnToProviderF.ADOQuery2.FieldByName('nn_prih').IsNull then Parameters.CreateParameter('nn_prih',ftString,pdInputOutput,50,ReturnToProviderF.ADOQuery2.FieldByName('nn_prih').Value);
      if not ReturnToProviderF.ADOQuery2.FieldByName('dt_prih').IsNull then Parameters.CreateParameter('dt_prih',ftDateTime,pdInputOutput,23,FormatDateTime('YYYY-MM-DD', ReturnToProviderF.ADOQuery2.FieldByName('dt_prih').Value));
      Parameters.CreateParameter('vzdescr',ftString,pdInput,500,Trim(Edit1.Text));
      ExecSQL;
    end;
  end;

  procedure UpdateTovarInCheck;
  begin
    with ReturnToProviderF.ADOQuery4 do
    begin
      //запись товара в таблицу чеков
      SQL.Clear;
      SQL.Add('update ##check ');
      SQL.Add('set KOL = :kol,');
      SQL.Add('  VzDescr = :vzdescr');
      if trim(Edit1.Text)<>'' then
        SQL.Add('  pr_vz_post = :pr_vz_post');
      SQL.Add('where KOD_NAME = :KOD_NAME');
      Parameters.Clear;
      Parameters.CreateParameter('kol',ftInteger,pdInput,10,count_check+StrToInt(AddToReturnF.edKol.Text));
      Parameters.CreateParameter('KOD_NAME', ftInteger, pdInputOutput, 10, ReturnToProviderF.ADOQuery3.FieldByName('KOD_NAME').Value);
      if trim(Edit1.Text)<>'' then
        Parameters.CreateParameter('vzdescr',ftString,pdInput,500,trim(Edit1.Text));
      Parameters.CreateParameter('pr_vz_post',ftInteger,pdInputOutput,10,StrToInt(ComboBox2.Items[ComboBox1.ItemIndex]));
      ExecSQL;
    end;
  end;

  procedure UpdateCheck;
  begin
    with ReturnToProviderF.ADOQuery3 do
    begin
      SQL.Clear;
      SQL.Add('select * from ##check (nolock)');
      SQL.Add('where id_user = :pid_user and compname=host_name()');
      Parameters.Clear;
      Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,id_user);
      Open;
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
//    ReturnToProviderF.CommentForReturnBill:=trim(Edit1.Text);
//    AddToReturnF.Close;
//    exit;
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
    with ReturnToProviderF.ADOQuery4 do
    begin
      SQL.Clear;
      SQL.Add('select * from ##Check (nolock) where KOD_NAME = :KOD_NAME');
      Parameters.Clear;
      Parameters.CreateParameter('KOD_NAME',ftInteger,pdInputOutput,10,ReturnToProviderF.ADOQuery2.FieldByName('KOD_NAME').Value);
      Open;
    end;
    count_available:=ReturnToProviderF.ADOQuery2.FieldByName('KOL').Value;  //количество позиций по kod_name в rtovar
    if ReturnToProviderF.ADOQuery4.RecordCount > 0 then count_check:=ReturnToProviderF.ADOQuery4.FieldByName('KOL').Value;  //количество товара подготовленого к возврату поставщику kod_name в chek

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
    //количество - меньше или равно остатоку на складе
    if (ReturnToProviderF.ADOQuery4.RecordCount > 0) then
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
      if ADOQuery4.RecordCount <= 0 then
      begin
        //добавить товар к возврату в чек
        AddTovarToCheck;
        UpdateCheck;
        AddToReturnF.Close;
        exit;
      end
      else
      begin
        //запись существует, обновить запись в чеке
        UpdateTovarInCheck;
        UpdateCheck;
        AddToReturnF.Close;
        exit;
      end;
    end;
    exit;
  end;
{
//jmoves
  iddoc NN_NAKL DATE_NAKL SUMMA TYPE_NAKL PRIZNAK TIME_NAKL ID_USER VzDescr
  NumBox  OBL SKLAD id_mess EANDriver guid  F_NDS Type_Tov  Reoc  stamp Marked
  Vis ReocEndReg  _Version  DeliveryDate  NotShowInStart  Date_Close  IsPrintCen
  IsPrintAct  idres id_postav nn_prih dt_prih sum_prih

//rTovar
  KOD_NAME  KOL CENA  CENAP NN_POSTAV SHTRIH  ISSCAN  DATESCAN  PRSCAN  id_postav_

//SprTov
  ART_CODE  ID_PART NAMES ART_NAME  OSTAT OSTAT_BEG CENA_BEG  Upak  id_part8
  IsLgot  CenaOpt
}
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
