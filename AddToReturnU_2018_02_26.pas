unit AddToReturnU;

interface

uses
  Forms, Controls, StdCtrls, Buttons, Classes, SysUtils, DB, ADODB;

type
  TAddToReturnF = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edKol: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label5: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure edKolExit(Sender: TObject);
  end;

var
  AddToReturnF: TAddToReturnF;

implementation

uses
  ReturnToProviderU, MainU, DataModuleU;

{$R *.dfm}

procedure TAddToReturnF.BitBtn2Click(Sender: TObject);
begin
  AddToReturnF.Close;
end;

procedure TAddToReturnF.BitBtn1Click(Sender: TObject);
var
  count_available, count_check: integer;
  CompName: string;
  procedure AddTovarToCheck;
  var
    i: integer;
    kol_return: integer;
    fl_break: boolean;
  begin
    with TADOQuery.Create(self) do
    begin
      try
        Connection:=DM.ADOCo;
        //запись товара в таблицу чеков
        SQL.Clear;

        SQL.Add('declare @iddoc int set @iddoc = :iddoc');
        SQL.Add('declare @kol int set @kol = :kol');
        SQL.Add('declare @art_code int set @art_code = :art_code');

        //SQL.Add('declare @iddoc int set @iddoc = '+IntToStr(ReturnToProviderF.qInternalNakl.FieldByName('iddoc').AsInteger));
        //SQL.Add('declare @kol int set @kol = '+edKol.Text);
        //SQL.Add('declare @art_code int set @art_code = '+IntToStr(ReturnToProviderF.qInternalNakl.FieldByName('art_code').AsInteger));
        SQL.Add('');
        SQL.Add('if Object_ID(N''tempdb..#tmp_kol'') is not null drop table #tmp_kol');
        SQL.Add('');
        SQL.Add('select');
        SQL.Add('  s.kod_name, s.art_code, sum(r.KOL) as kol, convert(int,0) as kol_new');
        SQL.Add('into #tmp_kol');
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
        SQL.Add('  and ostat > 0');
        SQL.Add('  and s.art_code = @art_code');
        SQL.Add('group by');
        SQL.Add('  s.kod_name, s.id_part8,');
        SQL.Add('  j.iddoc, j.F_NDS, j.Type_Tov, j.ID_USER, j.SKLAD, j.id_postav, j.nn_prih,');
        SQL.Add('  j.dt_prih, j.type_nakl, j.reoc, j.obl, j.date_nakl, j.nn_nakl, r.SHTRIH,');
        SQL.Add('  r.pr_vz_post, r.ISSCAN, s.NAMES, s.ART_CODE, s.ART_NAME, p.koef, i.numseriya,');
        SQL.Add('  i.srokgodn');
        SQL.Add('');
        SQL.Add('declare @c_kod_name int, @c_kol int');
        SQL.Add('declare Cur cursor local for');
        SQL.Add('  select kod_name, kol from #tmp_kol');
        SQL.Add('open Cur');
        SQL.Add('fetch Cur into @c_kod_name,@c_kol');
        SQL.Add('while @@Fetch_Status = 0');
        SQL.Add('begin');
        SQL.Add('  if @kol <= 0 break');
        SQL.Add('  if (@c_kol > @kol)');
        SQL.Add('  begin');
        SQL.Add('    update #tmp_kol set kol_new=@kol where KOD_NAME=@c_kod_name');
        SQL.Add('    set @kol=0');
        SQL.Add('  end');
        SQL.Add('  else');
        SQL.Add('  begin');
        SQL.Add('    update #tmp_kol set kol_new=@c_kol where KOD_NAME=@c_kod_name');
        SQL.Add('    set @kol = @kol-@c_kol');
        SQL.Add('  end');
        SQL.Add('  fetch Cur into @c_kod_name,@c_kol');
        SQL.Add('end');
        SQL.Add('close Cur');
        SQL.Add('deallocate Cur');
        SQL.Add('');

        SQL.Add('declare @pid_user int set @pid_user = :pid_user');
        SQL.Add('declare @pr_vz_post int set @pr_vz_post = :pr_vz_post');
        SQL.Add('declare @VzDescr varchar(500) set @VzDescr = :VzDescr');
        SQL.Add('declare @pr_vz varchar(50) set @pr_vz = :pr_vz');
        SQL.Add('declare @id_postav uniqueidentifier set @id_postav = :id_postav');
        SQL.Add('declare @nn_prih varchar(50) set @nn_prih = :nn_prih');
        SQL.Add('declare @dt_prih datetime set @dt_prih = :dt_prih');
        SQL.Add('declare @date_nakl datetime set @date_nakl = :date_nakl');
        SQL.Add('declare @nn_nakl varchar(15) set @nn_nakl = :nn_nakl');
        SQL.Add('declare @numseriya varchar(50) set @numseriya = :numseriya');
        SQL.Add('declare @srokgodn datetime set @srokgodn = :srokgodn');

        //SQL.Add('declare @pid_user int set @pid_user = '+IntToStr(Prm.UserID));
        //SQL.Add('declare @pr_vz_post int set @pr_vz_post = '+ComboBox2.Items[ComboBox1.ItemIndex]);
        //SQL.Add('declare @VzDescr varchar(500) set @VzDescr = '''+trim(Edit1.Text)+'''');
        //SQL.Add('declare @pr_vz varchar(50) set @pr_vz = '''+ComboBox1.Items[ComboBox1.ItemIndex]+'''');
        //SQL.Add('declare @id_postav uniqueidentifier set @id_postav = '''+ReturnToProviderF.qInternalNakl.FieldByName('id_postav').Value+'''');
        //SQL.Add('declare @nn_prih varchar(50) set @nn_prih = '''+ReturnToProviderF.qInternalNakl.FieldByName('nn_prih').AsString+'''');
        //SQL.Add('declare @dt_prih datetime set @dt_prih = '''+FormatDateTime('YYYY-MM-DD HH:MM:SS',ReturnToProviderF.qInternalNakl.FieldByName('dt_prih').AsDateTime)+'''');
        //SQL.Add('declare @date_nakl datetime set @date_nakl = '''+FormatDateTime('YYYY-MM-DD HH:MM:SS',ReturnToProviderF.qInternalNakl.FieldByName('date_nakl').AsDateTime)+'''');
        //SQL.Add('declare @nn_nakl varchar(15) set @nn_nakl = '''+ReturnToProviderF.qInternalNakl.FieldByName('nn_nakl').AsString+'''');
        //SQL.Add('declare @numseriya varchar(50) set @numseriya = '''+ReturnToProviderF.qInternalNakl.FieldByName('numseriya').AsString+'''');
        //SQL.Add('declare @srokgodn datetime set @srokgodn = '''+FormatDateTime('YYYY-MM-DD HH:MM:SS',ReturnToProviderF.qInternalNakl.FieldByName('srokgodn').AsDateTime)+'''');
        SQL.Add('');
        SQL.Add('insert into chk_vozr (');
        SQL.Add('    KOD_NAME,   NAMES,   KOL,  CENA,   F_NDS,   TYPE_TOV,');
        SQL.Add('    ID_USER,   ART_CODE,   ART_NAME,   DATEINS,   PR1, CompName,');
        SQL.Add('    SKLAD,   shtrih,   prvozr, CenaP,   skladv, pr_vz_post,  id_postav,');
        SQL.Add('    nn_prih,   dt_prih,   VzDescr,  pr_vz,  id_part8,   NumSeriya,');
        SQL.Add('    SrokGodn,   cena_zakup)');
        SQL.Add('  select');
        SQL.Add('    s.KOD_NAME, s.NAMES,');
        SQL.Add('	   sum(t_k.kol_new),');
        SQL.Add('	   s.cena, s.F_NDS, j.Type_Tov,');
        SQL.Add('    @pid_user, s.ART_CODE, s.ART_NAME, getdate(), -1,  host_name(),');
        SQL.Add('    j.SKLAD, r.SHTRIH, 27,     r.CENAP, '''',   @pr_vz_post, j.id_postav,');
        SQL.Add('    j.nn_prih, j.dt_prih, @VzDescr, @pr_vz, i.ID_PART8, i.NumSeriya,');
        SQL.Add('    i.SrokGodn, s.CenaZakup');
        SQL.Add('  from');
        SQL.Add('    JMOVES j (nolock)');
        SQL.Add('    left join rTovar r (nolock) on r.IDDOC=j.IDDOC');
        SQL.Add('    inner join SPRTOV s (nolock) on s.KOD_NAME=r.KOD_NAME');
        SQL.Add('    left join SERII i (nolock) on i.ID_PART8=s.id_part8');
        SQL.Add('	   left join #tmp_kol t_k on t_k.KOD_NAME=s.KOD_NAME');
        SQL.Add('  where');
        SQL.Add('    j.type_nakl = 1');
        SQL.Add('    and j.reoc=0');
        SQL.Add('    and j.obl in (0, 1)');
        SQL.Add('    and not j.id_postav is null');
        SQL.Add('    and j.iddoc = @iddoc');
        SQL.Add('    and j.id_postav=convert(binary(16),@id_postav)');
        SQL.Add('    and j.nn_prih=@nn_prih');
        SQL.Add('    and j.dt_prih=@dt_prih');
        SQL.Add('    and j.DATE_NAKL=@date_nakl');
        SQL.Add('    and j.NN_NAKL=@nn_nakl');
        SQL.Add('    and s.ART_CODE=@art_code');
        SQL.Add('    and i.NumSeriya=@numseriya');
        SQL.Add('    and i.SrokGodn=@srokgodn');
        SQL.Add('	   and t_k.kol_new > 0');
        SQL.Add('  group by');
        SQL.Add('    s.KOD_NAME, s.NAMES, s.cena, s.F_NDS, j.Type_Tov,');
        SQL.Add('    s.ART_CODE, s.ART_NAME, j.SKLAD, r.SHTRIH, r.CENAP, j.id_postav,');
        SQL.Add('    j.nn_prih, j.dt_prih, i.ID_PART8, i.NumSeriya, i.SrokGodn, s.CenaZakup,');
        SQL.Add('    s.ostat, t_k.kol_new');
        SQL.Add('');

        Parameters.Clear;
        Parameters.CreateParameter('iddoc',ftInteger,pdInput,10,ReturnToProviderF.qInternalNakl.FieldByName('iddoc').AsInteger);
        Parameters.CreateParameter('kol', ftInteger, pdInputOutput, 10, StrToInt(edKol.Text));
        Parameters.CreateParameter('art_code',ftInteger,pdInput,10,ReturnToProviderF.qInternalNakl.FieldByName('art_code').AsInteger);
        Parameters.CreateParameter('pid_user',ftSmallint,pdInput,5,Prm.UserID); //ID_USER:smallint; //smallint
        Parameters.CreateParameter('pr_vz_post',ftInteger,pdInputOutput, 10,StrToInt(ComboBox2.Items[ComboBox1.ItemIndex]));
        Parameters.CreateParameter('VzDescr',ftString,pdInputOutput, 500,trim(Edit1.Text));
        Parameters.CreateParameter('pr_vz',ftString, pdInputOutput, 50, ComboBox1.Items[ComboBox1.ItemIndex]);
        Parameters.CreateParameter('id_postav',ftGuid,pdInput,36,ReturnToProviderF.qInternalNakl.FieldByName('id_postav').Value);
        Parameters.CreateParameter('nn_prih',ftString,pdInput,50,ReturnToProviderF.qInternalNakl.FieldByName('nn_prih').AsString);
        Parameters.CreateParameter('dt_prih',ftDateTime,pdInput,23,ReturnToProviderF.qInternalNakl.FieldByName('dt_prih').AsDateTime);
        Parameters.CreateParameter('date_nakl',ftDateTime,pdInput,23,ReturnToProviderF.qInternalNakl.FieldByName('date_nakl').AsDateTime);
        Parameters.CreateParameter('nn_nakl',ftString,pdInput,15,ReturnToProviderF.qInternalNakl.FieldByName('nn_nakl').AsString);
        Parameters.CreateParameter('numseriya',ftString,pdInput,50,ReturnToProviderF.qInternalNakl.FieldByName('numseriya').AsString);
        Parameters.CreateParameter('srokgodn',ftDateTime,pdInput,23,ReturnToProviderF.qInternalNakl.FieldByName('srokgodn').AsDateTime);

        //SQL.SaveToFile('1234');
        ExecSQL;
(*

        SQL.Add('declare @pid_user int set @pid_user = :pid_user');
        SQL.Add('declare @pr_vz_post int set @pr_vz_post = :pr_vz_post');
        SQL.Add('declare @VzDescr varchar(500) set @VzDescr = :VzDescr');
        SQL.Add('declare @pr_vz varchar(50) set @pr_vz = :pr_vz');
        SQL.Add('declare @iddoc int set @iddoc = :iddoc');
        SQL.Add('declare @id_postav uniqueidentifier set @id_postav = convert(uniqueidentifier,:id_postav)');
        SQL.Add('declare @nn_prih varchar(50) set @nn_prih = :nn_prih');
        SQL.Add('declare @dt_prih datetime set @dt_prih = :dt_prih');
        SQL.Add('declare @date_nakl datetime set @date_nakl = :date_nakl');
        SQL.Add('declare @nn_nakl varchar(15) set @nn_nakl = :nn_nakl');
        SQL.Add('declare @art_code int set @art_code = :art_code');
        SQL.Add('declare @numseriya varchar(50) set @numseriya = :numseriya');
        SQL.Add('declare @srokgodn datetime set @srokgodn = :srokgodn');
        SQL.Add('declare @kol int set @kol = :kol');
        SQL.Add('');
        SQL.Add('insert into chk_vozr (');
        SQL.Add('    KOD_NAME,   NAMES,   KOL,  CENA,   F_NDS,   TYPE_TOV, ');
        SQL.Add('    ID_USER,   ART_CODE,   ART_NAME,   DATEINS,   PR1, CompName,');
        SQL.Add('    SKLAD,   shtrih,   prvozr, CenaP,   skladv, pr_vz_post,  id_postav, ');
        SQL.Add('    nn_prih,   dt_prih,   VzDescr,  pr_vz,  id_part8,   NumSeriya, ');
        SQL.Add('    SrokGodn,   cena_zakup)');
        SQL.Add('  select');
        SQL.Add('    s.KOD_NAME, s.NAMES, @kol, s.cena, s.F_NDS, j.Type_Tov, ');
        SQL.Add('    @pid_user, s.ART_CODE, s.ART_NAME, getdate(), -1,  host_name(), ');
        SQL.Add('    j.SKLAD, r.SHTRIH, 27,     r.CENAP, '''',   @pr_vz_post, j.id_postav, ');
        SQL.Add('    j.nn_prih, j.dt_prih, @VzDescr, @pr_vz, i.ID_PART8, i.NumSeriya, ');
        SQL.Add('    i.SrokGodn, s.CenaZakup ');
        SQL.Add('  from');
        SQL.Add('    JMOVES j (nolock)');
        SQL.Add('    left join rTovar r (nolock) on r.IDDOC=j.IDDOC');
        SQL.Add('    inner join SPRTOV s (nolock) on s.KOD_NAME=r.KOD_NAME');
        SQL.Add('    left join SERII i (nolock) on i.ID_PART8=s.id_part8');
        SQL.Add('  where');
        SQL.Add('    j.type_nakl = 1');
        SQL.Add('    and j.reoc=0');
        SQL.Add('    and j.obl in (0, 1)');
        SQL.Add('    and not j.id_postav is null');
        SQL.Add('    and j.iddoc = @iddoc');
        SQL.Add('    and j.id_postav=convert(binary(16),@id_postav)');
        SQL.Add('    and j.nn_prih=@nn_prih');
        SQL.Add('    and j.dt_prih=@dt_prih');
        SQL.Add('    and j.DATE_NAKL=@date_nakl');
        SQL.Add('    and j.NN_NAKL=@nn_nakl');
        SQL.Add('    and s.ART_CODE=@art_code');
        SQL.Add('    and i.NumSeriya=@numseriya');
        SQL.Add('    and i.SrokGodn=@srokgodn');
        SQL.Add('');
        //SQL.SaveToFile('1234');

        Parameters.Clear;
        Parameters.CreateParameter('pid_user',ftSmallint,pdInput,5,Prm.UserID); //ID_USER:smallint; //smallint
        Parameters.CreateParameter('pr_vz_post',ftInteger,pdInputOutput, 10,StrToInt(ComboBox2.Items[ComboBox1.ItemIndex]));
        Parameters.CreateParameter('VzDescr',ftString,pdInputOutput, 500,trim(Edit1.Text));
        Parameters.CreateParameter('pr_vz',ftString, pdInputOutput, 50, ComboBox1.Items[ComboBox1.ItemIndex]);
        Parameters.CreateParameter('iddoc',ftInteger,pdInput,10,ReturnToProviderF.qInternalNakl.FieldByName('iddoc').AsInteger);
        Parameters.CreateParameter('id_postav',ftGuid,pdInput,36,ReturnToProviderF.qInternalNakl.FieldByName('id_postav').Value);
        Parameters.CreateParameter('nn_prih',ftString,pdInput,50,ReturnToProviderF.qInternalNakl.FieldByName('nn_prih').AsString);
        Parameters.CreateParameter('dt_prih',ftDateTime,pdInput,23,ReturnToProviderF.qInternalNakl.FieldByName('dt_prih').AsDateTime);
        Parameters.CreateParameter('date_nakl',ftDateTime,pdInput,23,ReturnToProviderF.qInternalNakl.FieldByName('date_nakl').AsDateTime);
        Parameters.CreateParameter('nn_nakl',ftString,pdInput,15,ReturnToProviderF.qInternalNakl.FieldByName('nn_nakl').AsString);
        Parameters.CreateParameter('art_code',ftInteger,pdInput,10,ReturnToProviderF.qInternalNakl.FieldByName('art_code').AsInteger);
        Parameters.CreateParameter('numseriya',ftString,pdInput,50,ReturnToProviderF.qInternalNakl.FieldByName('numseriya').AsString);
        Parameters.CreateParameter('srokgodn',ftDateTime,pdInput,23,ReturnToProviderF.qInternalNakl.FieldByName('srokgodn').AsDateTime);
        Parameters.CreateParameter('kol', ftInteger, pdInputOutput, 10, StrToInt(edKol.Text));

        ExecSQL;
*)
      finally
        Free;
      end;
    end;
  end;

  procedure UpdateTovarInCheck;
  begin
    with TADOQuery.Create(self) do
    begin
      try
        //запись товара в таблицу чеков
        Connection:=DM.ADOCo;
        SQL.Clear;
        SQL.Add('update');
        SQL.Add('  chk_vozr ');
        SQL.Add('set');
        SQL.Add(' KOL = '+IntToStr(count_check+StrToInt(AddToReturnF.edKol.Text))+',');
        if length(trim(AddToReturnF.Edit1.Text))>0 then
          SQL.Add('  VzDescr = '''+trim(AddToReturnF.Edit1.Text)+''',');
        SQL.Add('  pr_vz_post = '+AddToReturnF.ComboBox2.Items[AddToReturnF.ComboBox1.ItemIndex]+',');
        SQL.Add('  pr_vz = '''+AddToReturnF.ComboBox1.Items[AddToReturnF.ComboBox1.ItemIndex]+''',');
        SQL.Add('  CompName = host_name(),');
        SQL.Add('  ID_USER = '+IntToStr(Prm.UserID));
        SQL.Add('');
        SQL.Add('where ART_CODE = '+ReturnToProviderF.qInternalNakl.FieldByName('ART_CODE').AsString);
        ExecSQL;
      finally
        Free;
      end;
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

    with TADOQuery.Create(self) do
    begin
      try
        Connection:=DM.ADOCo;
        SQL.Clear;
        SQL.Add('declare @art_code int');
        SQL.Add('set @art_code = :art_code');
        SQL.Add('');
        SQL.Add('select');
        SQL.Add('  *');
        SQL.Add('from');
        SQL.Add('  APTEKA_NET.dbo.chk_vozr (nolock)');
        SQL.Add('where');
        SQL.Add('  art_code = @art_code');
        SQL.Add('');
        Parameters.Clear;
        Parameters.CreateParameter('art_code',ftInteger,pdInputOutput,10,ReturnToProviderF.qInternalNakl.FieldByName('art_code').AsInteger);
        Open;

        count_available:=ReturnToProviderF.qInternalNakl.FieldByName('KOL').AsInteger;  //количество позиций по kod_name в rtovar
        if IsEmpty then count_check:=FieldByName('KOL').AsInteger;  //количество товара подготовленого к возврату поставщику kod_name в chek

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
        if not IsEmpty then
          if StrToInt(edKol.Text)+count_check > count_available then
          begin
            edKol.Text:=IntToStr(count_available-count_check);
            exit;
          end;

          //добавить возвратные накладные в таблицу чеков
          if IsEmpty then
          begin
            //добавить товар к возврату в чек
            AddTovarToCheck;
            ReturnToProviderF.OpenCheck;
            AddToReturnF.Close;
          end
          else
          begin
            //запись существует, обновить запись в чеке
            UpdateTovarInCheck;
            ReturnToProviderF.OpenCheck;
            AddToReturnF.Close;
          end;
      finally
        Free;
      end;
    end;
  end;
end;

procedure TAddToReturnF.ComboBox1Change(Sender: TObject);
begin
//  if ComboBox2.Items[ComboBox1.ItemIndex]='3' then
//  begin
//    Label3.Enabled:=true;
//    Edit1.Enabled:=true;
//  end
//  else
//  begin
//    Label3.Enabled:=False;
//    Edit1.Enabled:=False;
//    Edit1.Text:='';
//  end;
end;

procedure TAddToReturnF.edKolExit(Sender: TObject);
var
  kol: integer;
begin
  try
    try
      StrToInt(edKol.Text);
    finally
      kol:=StrToInt(edKol.Text);
//      if (kol mod ReturnToProviderF.ADOQuery2.FieldByName('koef').AsInteger) > 0 then
//      begin
//        if (kol div ReturnToProviderF.ADOQuery2.FieldByName('koef').AsInteger) * ReturnToProviderF.ADOQuery2.FieldByName('koef').AsInteger + ReturnToProviderF.ADOQuery2.FieldByName('koef').AsInteger > ReturnToProviderF.ADOQuery2.FieldByName('ostat').AsInteger then
//          kol:= (kol div ReturnToProviderF.ADOQuery2.FieldByName('koef').AsInteger) * ReturnToProviderF.ADOQuery2.FieldByName('koef').AsInteger
//        else
//          kol:= (kol div ReturnToProviderF.ADOQuery2.FieldByName('koef').AsInteger) * ReturnToProviderF.ADOQuery2.FieldByName('koef').AsInteger + ReturnToProviderF.ADOQuery2.FieldByName('koef').AsInteger;
//        edKol.Text:=IntToStr(kol);
//      end;
    end;
  except
    edKol.Text:='0';
  end;
end;

end.
