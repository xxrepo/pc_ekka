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
        //������ ������ � ������� �����
        SQL.Clear;
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
        SQL.Add('');
        SQL.Add('');
        SQL.Add('insert into chk_vozr (');
        SQL.Add('    KOD_NAME,   NAMES,     KOL,   CENA,   F_NDS,   TYPE_TOV, ');
        SQL.Add('    ID_USER,   ART_CODE,   ART_NAME,   DATEINS,   PR1, CompName,');
        SQL.Add('    SKLAD,   shtrih,   prvozr, CenaP,   skladv, pr_vz_post,  id_postav, ');
        SQL.Add('    nn_prih,   dt_prih,   VzDescr,  pr_vz,  id_part8,   NumSeriya, ');
        SQL.Add('    SrokGodn,   cena_zakup)');
        SQL.Add('  select');
        SQL.Add('    s.KOD_NAME, s.NAMES, r.KOL, s.cena, s.F_NDS, j.Type_Tov, ');
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
        ExecSQL;
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
        //������ ������ � ������� �����
        Connection:=DM.ADOCo;
        SQL.Clear;
        SQL.Add('update');
        SQL.Add('  chk_vozr ');
        SQL.Add('set');
        SQL.Add(' KOL = '+IntToStr(count_check+StrToInt(AddToReturnF.edKol.Text))+',');
        if length(trim(AddToReturnF.Edit1.Text))>0 then
          SQL.Add('  VzDescr = '+trim(AddToReturnF.Edit1.Text)+',');
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
  //���������� � ���������� ���������
  if Edit1.Enabled then
  begin
    if trim(Edit1.Text)='' then
    begin
      Edit1.Text:='';
      Edit1.SetFocus;
      exit;
    end;
  end;

  //������� �������� �������?
  if (ComboBox1.ItemIndex=-1)and(ComboBox1.Visible) then
  begin
    ComboBox1.SetFocus;
    ComboBox1.DroppedDown:=true;
    Exit;
  end;

  //���������� ������������� ������
  if edKol.Visible then
  begin
    count_available:=0;  //���������� ������� �� kod_name � rtovar
    count_check:=0;  //���������� ������ �������������� � �������� ���������� kod_name � chek

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

        count_available:=ReturnToProviderF.qInternalNakl.FieldByName('KOL').AsInteger;  //���������� ������� �� kod_name � rtovar
        if IsEmpty then count_check:=FieldByName('KOL').AsInteger;  //���������� ������ �������������� � �������� ���������� kod_name � chek

        //���������� �������?
        if trim(edKol.Text)='' then
        begin
          edKol.Text:=IntToStr(count_available-count_check);
          exit;
        end;
        //���������� - ����� �����?
        try
          StrToInt(trim(edKol.Text));
        except
          edKol.Text:=IntToStr(count_available-count_check);
        end;

        //���������� - ������ ��� ����� ������� �� ������
        if not IsEmpty then
          if StrToInt(edKol.Text)+count_check > count_available then
          begin
            edKol.Text:=IntToStr(count_available-count_check);
            exit;
          end;

          //�������� ���������� ��������� � ������� �����
          if IsEmpty then
          begin
            //�������� ����� � �������� � ���
            AddTovarToCheck;
            ReturnToProviderF.OpenCheck;
            AddToReturnF.Close;
          end
          else
          begin
            //������ ����������, �������� ������ � ����
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
