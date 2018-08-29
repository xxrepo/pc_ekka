unit ClaimesU;

interface

uses
  Forms, Grids, DBGrids, Classes, Controls, ExtCtrls, DB, ADODB, ComCtrls,
  StdCtrls, SysUtils, Graphics, Windows;
//  , Messages, Variants, Dialogs, ;

type
  TClaimesF = class(TForm)
    pnlFilter: TPanel;
    dgClaimes: TDBGrid;
    _dsClaimes: TDataSource;
    _qClaimes: TADOQuery;
    lbDateFrom: TLabel;
    dtDateFrom: TDateTimePicker;
    lbDateTo: TLabel;
    dtDateTo: TDateTimePicker;
    btSendToRemainder: TButton;
    btUpdate: TButton;
    qTemp: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btUpdateClick(Sender: TObject);
    procedure dtDateFromExit(Sender: TObject);
    procedure dtDateToExit(Sender: TObject);
    procedure dgClaimesTitleClick(Column: TColumn);
    procedure btSendToRemainderClick(Sender: TObject);
  private
    Frecord_id: string;
    FOrder: string;

    procedure GetClaimes;
    procedure Resize;
    procedure DisableControls;
    procedure EnableControls;

    property record_id: string read Frecord_id write Frecord_id;
    property Order: string read FOrder write FOrder;
  public
    { Public declarations }
  end;

var
  ClaimesF: TClaimesF;

const
  TOP_INDENT = 12;
  LEFT_INDENT = 12;
  SPACE_INDENT = 12;
  
implementation

uses
  MainU, DataModuleU;

{$R *.dfm}

procedure TClaimesF.GetClaimes;
begin
  try
    with DM do
    begin
      with qrClaimes do
      begin
        Close;
        SQL.Clear;
{
        SQL.Add('select');
        SQL.Add('  convert(uniqueidentifier,cl.record_id) as record_id, ');
        SQL.Add('  cl.claime_date, cl.Apotheka, ');
        SQL.Add('  convert(uniqueidentifier,cl.id_postav) as id_postav, ');
        SQL.Add('  cl.nn_prih, cl.dt_prih, ');
        SQL.Add('  convert(uniqueidentifier,cl.id_part8) as id_part8, ');
        SQL.Add('  cl.kod_name, cl.art_code, cl.names, cl.art_name, cl.kol, ');
        SQL.Add('  cl.cena, cl.cena_zakup, cl.pr_vz, cl.VzDescr, cl.NumSeriya, ');
        SQL.Add('  cl.SrokGodn, cl.CompName, cl.ID_Gamma, cl.F_NDS, ');
        SQL.Add('  (case');
        SQL.Add('    when cl.F_NDS=1 then ''20%''');
        SQL.Add('    when cl.F_NDS=2 then ''7%''');
        SQL.Add('  end) as NDS,');
        SQL.Add('  (case  ');
        SQL.Add('    when isnull(cl.IsUnload,0) = 0 then ''Нет'' ');
        SQL.Add('    when isnull(cl.IsUnload,0) = 1 then ''Да''');
        SQL.Add('  end) as Unloaded,');
        SQL.Add('  cl.IsUnload, u.USERS,');
        SQL.Add('  (case  ');
        SQL.Add('    when cl.F_NDS=1 then convert(numeric(12,2),cl.cena_zakup*1.2 ');
        SQL.Add('    when cl.F_NDS=2 then convert(numeric(12,2),cl.cena_zakup*1.07)');
        SQL.Add('  end) as cena_zakup_with_nds,');
        SQL.Add('  (case  ');
        SQL.Add('    when cl.F_NDS=1 then convert(numeric(12,2),cl.cena*1.2) ');
        SQL.Add('    when cl.F_NDS=2 then convert(numeric(12,2),cl.cena*1.07)');
        SQL.Add('  end) as cena_with_nds,');
        SQL.Add('  (cl.cena*cl.kol) as summa_wo_nds,');
        SQL.Add('  (cl.cena_zakup*cl.kol) as summa_zakup_wo_nds,');
        SQL.Add('  (case  ');
        SQL.Add('    when cl.F_NDS=1 then convert(numeric(12,2),cl.cena*cl.kol*1.2) ');
        SQL.Add('    when cl.F_NDS=2 then convert(numeric(12,2),cl.cena*cl.kol*1.07)');
        SQL.Add('  end) as summa_with_nds,');
        SQL.Add('  (case ');
        SQL.Add('    when cl.F_NDS=1 then convert(numeric(12,2),cl.cena_zakup*cl.kol*1.2) ');
        SQL.Add('    when cl.F_NDS=2 then convert(numeric(12,2),cl.cena_zakup*cl.kol*1.07) ');
        SQL.Add('  end) as summa_zakup_with_nds, ');
        SQL.Add('  (case ');
        SQL.Add('    when isnull(cl.IsSentToProvider,0)=0 then ''Нет'' ');
        SQL.Add('    when isnull(cl.IsSentToProvider,0)=1 then ''Да'' ');
        SQL.Add('  end)as IsSend, ');
        SQL.Add('  cl.IsSentToProvider, cl.DateSendToProvider');
        SQL.Add('');
}
        SQL.Add('select');
        SQL.Add('  convert(uniqueidentifier,cl.record_id) as record_id,');
        SQL.Add('  cl.claime_date, cl.nn_prih, cl.dt_prih, cl.art_code, cl.names, cl.F_NDS,');
        SQL.Add('  (case');
        SQL.Add('    when cl.F_NDS=1 then ''20%''');
        SQL.Add('    when cl.F_NDS=2 then ''7%''');
        SQL.Add('  end) as NDS,');
        SQL.Add('  cl.kol, cl.cena,');
        SQL.Add('  (case');
        SQL.Add('    when cl.F_NDS=1 then convert(numeric(12,2),cl.cena*1.2)');
        SQL.Add('    when cl.F_NDS=2 then convert(numeric(12,2),cl.cena*1.07)');
        SQL.Add('  end) as cena_with_nds,');
        SQL.Add('  (cl.cena*cl.kol) as summa,');
        SQL.Add('  (case');
        SQL.Add('    when cl.F_NDS=1 then convert(numeric(12,2),cl.cena*cl.kol*1.2)');
        SQL.Add('    when cl.F_NDS=2 then convert(numeric(12,2),cl.cena*cl.kol*1.07)');
        SQL.Add('  end) as summa_with_nds,');
        SQL.Add('  cl.cena_zakup,');
        SQL.Add('  (case');
        SQL.Add('    when cl.F_NDS=1 then convert(numeric(12,2),cl.cena_zakup*1.2)');
        SQL.Add('    when cl.F_NDS=2 then convert(numeric(12,2),cl.cena_zakup*1.07)');
        SQL.Add('  end) as cena_zakup_with_nds,');
        SQL.Add('  (cl.cena_zakup*cl.kol) as summa_zakup,');
        SQL.Add('  (case');
        SQL.Add('    when cl.F_NDS=1 then convert(numeric(12,2),cl.cena_zakup*cl.kol*1.2)');
        SQL.Add('    when cl.F_NDS=2 then convert(numeric(12,2),cl.cena_zakup*cl.kol*1.07)');
        SQL.Add('  end) as summa_zakup_with_nds,');
        SQL.Add('  cl.pr_vz, cl.VzDescr, cl.NumSeriya, cl.SrokGodn, u.USERS,');
        SQL.Add('  (case');
        SQL.Add('    when isnull(cl.IsUnload,0) = 0 then ''Нет''');
        SQL.Add('    when isnull(cl.IsUnload,0) = 1 then ''Да''');
        SQL.Add('  end) as Unloaded,');
        SQL.Add('  cl.IsSentToProvider,');
        SQL.Add('  (case');
        SQL.Add('    when isnull(cl.IsSentToProvider,0)=0 then ''Нет''');
        SQL.Add('    when isnull(cl.IsSentToProvider,0)=1 then ''Да''');
        SQL.Add('  end)as IsSend,');
        SQL.Add('  cl.DateSendToProvider');
        SQL.Add('');
        SQL.Add('from');
        SQL.Add('  claims cl (nolock)');
        SQL.Add('  left join SPRUSER u (nolock) on u.id_gamma = cl.ID_Gamma');
        SQL.Add('where');
        SQL.Add('  cl.claime_date > '''+FormatDateTime('YYYY-MM-DD',dtDateFrom.Date)+' 00:00:00''');
        SQL.Add('  and cl.claime_date <= '''+FormatDateTime('YYYY-MM-DD',dtDateTo.Date)+' 23:59:59''');
        SQL.Add('order by');
        SQL.Add('  '+Order);
        Open;
      end;
    end;
  except
    on E:Exception do
    begin
      MainF.MessBox('При получении данных получена ошибка '+E.Message,16)
    end;
  end;
end;

procedure TClaimesF.Resize;
var
  i: integer;
begin
  with ClaimesF do
  begin
    pnlFilter.Left:=LEFT_INDENT;
    pnlFilter.Top:=TOP_INDENT;
    pnlFilter.Width:=ClientWidth-pnlFilter.Left-LEFT_INDENT;

    lbDateFrom.Left:=LEFT_INDENT;
    lbDateFrom.Top:=TOP_INDENT;
    dtDateFrom.Left:=lbDateFrom.Left+lbDateFrom.Width;
    dtDateFrom.Top:=TOP_INDENT;
    lbDateTo.Left:=dtDateFrom.Left+dtDateFrom.Width;
    lbDateTo.Top:=TOP_INDENT;
    dtDateTo.Left:=lbDateTo.Left+lbDateTo.Width;
    dtDateTo.Top:=TOP_INDENT;

    btSendToRemainder.Left:=LEFT_INDENT;
    btSendToRemainder.Top:=dtDateFrom.Top+dtDateFrom.Height+SPACE_INDENT;
    btUpdate.Left:=pnlFilter.Width-btUpdate.Width-LEFT_INDENT;
    btUpdate.Top:=btSendToRemainder.Top;

    pnlFilter.Height:=btSendToRemainder.Top+btSendToRemainder.Height+TOP_INDENT;

    dgClaimes.Left:=LEFT_INDENT;
    dgClaimes.Top:=pnlFilter.Top+pnlFilter.Height+SPACE_INDENT;
    dgClaimes.Width:=ClientWidth-dgClaimes.Left-LEFT_INDENT;
    dgClaimes.Height:=ClientHeight-dgClaimes.Top-TOP_INDENT;

    with dgClaimes do
    begin
      for i:=0 to Columns.Count-1 do
      begin
        Columns[i].Title.Font.Style:=[fsBold];
        if Columns[i].FieldName=Order then Columns[i].Title.Font.Color:=clRed else Columns[i].Title.Font.Color:=clWindowText;
      end;
      Columns[0].Width:=100;
      Columns[1].Width:=120;
      Columns[2].Width:=140;
      Columns[3].Width:=160;
      Columns[4].Width:=370;
      Columns[5].Width:=40;
      Columns[6].Width:=75;
      Columns[7].Width:=75;
      Columns[8].Width:=75;
      Columns[9].Width:=85;
      Columns[10].Width:=85;
      Columns[11].Width:=85;
      Columns[12].Width:=125;
      Columns[13].Width:=125;
      Columns[14].Width:=125;
      Columns[15].Width:=100;
      Columns[16].Width:=150;
      Columns[17].Width:=80;
      Columns[18].Width:=80;
      Columns[19].Width:=130;
      Columns[20].Width:=110;
    end;
  end;
end;

procedure TClaimesF.DisableControls;
begin
  with ClaimesF do
  begin
    dtDateFrom.Enabled:=false;
    dtDateTo.Enabled:=false;
    btSendToRemainder.Enabled:=false;
    btUpdate.Enabled:=false;
    dgClaimes.Enabled:=false;
  end;
end;

procedure TClaimesF.EnableControls;
begin
  with ClaimesF do
  begin
    dtDateFrom.Enabled:=true;
    dtDateTo.Enabled:=true;
    btSendToRemainder.Enabled:=true;
    btUpdate.Enabled:=true;
    dgClaimes.Enabled:=true;
    dgClaimes.SetFocus;
  end;
end;

procedure TClaimesF.FormCreate(Sender: TObject);
begin
  if (Screen.Width < 640) or (Screen.Height < 480) then
  begin
    MainF.MessBox('Ошибка!'+#13+'Разрешение экрана ниже минимально допустимого!'+#13+'Обратитесь в IT-отдел.',16);
    exit;
  end;
  record_id:='';
  Order:='claime_date';

  GetClaimes;
end;

procedure TClaimesF.FormActivate(Sender: TObject);
begin
  with ClaimesF do
  begin
    Constraints.MinWidth:=640;
    Constraints.MinHeight:=480;
    ClientWidth:=trunc(Screen.Width*0.75);
    ClientHeight:=trunc(Screen.Height*0.75);
    Position:=poMainFormCenter;

    Caption:=MFC+' [Претензии поставщику]';

    dtDateFrom.Date:=Date();
    dtDateTo.Date:=Date();

    pnlFilter.Caption:='';

    Resize;
    GetClaimes;
  end;
end;

procedure TClaimesF.FormResize(Sender: TObject);
begin
  Resize;
end;

procedure TClaimesF.btUpdateClick(Sender: TObject);
var
  cur_rec: string;
begin
  try
    cur_rec:=DM.qrClaimes.FieldByName('record_id').AsString;
    DisableControls;
    GetClaimes;
  finally
    DM.qrClaimes.Locate('record_id',record_id,[]);
    EnableControls;
  end;
end;

procedure TClaimesF.dtDateFromExit(Sender: TObject);
var
  cur_rec: string;
begin
  try
    cur_rec:=DM.qrClaimes.FieldByName('record_id').AsString;
    DisableControls;
    GetClaimes;
  finally
    DM.qrClaimes.Locate('record_id',record_id,[]);
    EnableControls;
  end;
end;

procedure TClaimesF.dtDateToExit(Sender: TObject);
var
  cur_rec: string;
begin
  try
    cur_rec:=DM.qrClaimes.FieldByName('record_id').AsString;
    DisableControls;
    GetClaimes;
  finally
    DM.qrClaimes.Locate('record_id',record_id,[]);
    EnableControls;
  end;
end;

procedure TClaimesF.dgClaimesTitleClick(Column: TColumn);
var
  cur_rec: string;
  i: integer;
begin
  Order:=Column.FieldName;
  try
    cur_rec:=DM.qrClaimes.FieldByName('record_id').AsString;
    DisableControls;
    Resize;
  finally
    DM.qrClaimes.Locate('record_id',record_id,[]);
    EnableControls;
  end;
end;

procedure TClaimesF.btSendToRemainderClick(Sender: TObject);
var
  cur_rec: string;
begin
  if (not DM.qrClaimes.FieldByName('IsSentToProvider').IsNull)or(not DM.qrClaimes.FieldByName('DateSendToProvider').IsNull) then exit;
  if MainF.MessBox('Вы точно вернули поставщику товар '+#13+DM.qrClaimes.FieldByName('art_code').AsString+' "'+DM.qrClaimes.FieldByName('names').AsString+'"',36) <> ID_YES then exit;

  try
    cur_rec:=DM.qrClaimes.FieldByName('record_id').AsString;
    try
      with ClaimesF do
      begin
        with qTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('update ');
          SQL.Add('  Claims');
          SQL.Add('set ');
          SQL.Add('  IsSentToProvider = 1,');
          SQL.Add('  DateSendToProvider = '''+FormatDateTime('YYYY-MM-DD HH:SS:MM',Now())+''',');
          SQL.Add('  IsUnload = 0');
          SQL.Add('where ');
          SQL.Add('  convert(uniqueidentifier,record_id) = '''+DM.qrClaimes.FieldByName('record_id').AsString+'''');
          SQL.Add('');
          ExecSQL;
        end;
      end;
    except
      on E:Exception do MainF.MessBox('Ошибка!'+#13+
                                      'Во время изменения статуса отправки произошла ошибка '+E.Message+#13+
                                      'Повторно поставте отметку о возврате поставщику!'+#13+
                                      'За дополнительной информацией обратитесь в отдел розницы',16);
    end;
  finally
    GetClaimes;
    DM.qrClaimes.Locate('record_id',record_id,[]);
  end;
end;

end.
