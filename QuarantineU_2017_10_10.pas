unit QuarantineU;

interface

uses
  Forms, DB, ADODB, ComCtrls, StdCtrls, Buttons, ExtCtrls, Controls, Grids,
  DBGrids, Classes, SysUtils, DateUtils, Dialogs;

type
  TQuarantineF = class(TForm)
    qTemp: TADOQuery;
    pnlReturnOrders: TPanel;
    Label6: TLabel;
    Splitter1: TSplitter;
    lbToStockNotification: TLabel;
    dgReturnOrders: TDBGrid;
    qReturnOrders: TADOQuery;
    dsReturnOrders: TDataSource;
    pnlQuarantine: TPanel;
    pnlControlQuarantine: TPanel;
    btCloseQuarantine: TBitBtn;
    pnlFilterQuarantine: TPanel;
    lbDateFrom: TLabel;
    lbDateTo: TLabel;
    dtDateFrom: TDateTimePicker;
    dtDateTo: TDateTimePicker;
    dgQuarantine: TDBGrid;
    btUpdateQuarantine: TBitBtn;
    btEditQuarantine: TBitBtn;
    btReturn: TBitBtn;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btCloseQuarantineClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btUpdateQuarantineClick(Sender: TObject);
    procedure btEditQuarantineClick(Sender: TObject);
    procedure btReturnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtDateFromChange(Sender: TObject);
    procedure dtDateToChange(Sender: TObject);

  private
    FPriorIDDOC: integer;
    FLastIDDOCs: integer;
    FIsQuarantine: boolean;
    F_id_record: string;

    procedure Resize(Sender: TObject);
    procedure CloseQuarantine;
    procedure UpdateQuarantine;
    procedure EnableControls;
    procedure DisableControls;
    procedure ChangeDateQuarantine;
    function GetEmptySeriaCount: integer;
    procedure EditQuarantine;
    procedure SaveQuarantine;

    property id_record: string read F_id_record write F_id_record;

  public
    property PriorIDDOC: integer read FPriorIDDOC write FPriorIDDOC; //номер последней возвратной накладной до формирования возврата по Ф.И.
    property LastIDDOCs: integer read FLastIDDOCs write FLastIDDOCs; //номер последней возвратной накладной после формирования возврата по Ф.И.
    property IsQuarantine: boolean read FIsQuarantine write FIsQuarantine; //показывать или не показывать перечень сформированых возвратных накладных
  end;

var
  QuarantineF:TQuarantineF;

const
  ORDERS_FOR_RETURN_TO_STOCK = 'Товары по этим накладным необходимо вернуть на склад!!!'+#13+
                           'Накладные можно посмотреть через меню "Накладные" - "История накладных"';
  LEFT_INDENT = 12;

implementation

uses
  MainU, DataModuleU, ReturnToProviderU, QuarantineEditU;

{$R *.dfm}

procedure TQuarantineF.Resize(Sender: TObject);
begin
  with QuarantineF do
  begin
    with dgReturnOrders do
    begin
      Columns[0].Width:=trunc(Width/2)-20;
      Columns[1].Width:=trunc(Width/2)-20;
    end;
    btCloseQuarantine.Left:=trunc(ClientWidth-btCloseQuarantine.Width-LEFT_INDENT);

    with dgQuarantine do
    begin
      Columns[0].Width:=65; //kod_name
      Columns[1].Width:=65; //art_code
      Columns[2].Width:=trunc((QuarantineF.Width-(65*6)-50)/2)-7; //names
      Columns[3].Width:=65; //kol
      Columns[4].Width:=65; //cena
      Columns[5].Width:=65; //f_nds
      Columns[6].Width:=trunc((QuarantineF.Width-(65*6)-50)/2)-7; //seria
      Columns[7].Width:=65; //dt_seria
    end;
  end;
end;

procedure TQuarantineF.CloseQuarantine;
begin
  QuarantineF.Close;
end;

procedure TQuarantineF.UpdateQuarantine;
begin
  with DM.qrQuarantine do
  begin
    Close;
    SQL.Text:='exec spY_Quarantine '''+FormatDateTime('YYYY-MM-DD',dtDateFrom.Date)+''', '''+FormatDateTime('YYYY-MM-DD',dtDateTo.Date)+' 23:59:59''';
    Open;
  end;
  EnableControls;
  dgQuarantine.SetFocus;
end;

procedure TQuarantineF.EnableControls;
begin
  dgReturnOrders.Enabled:=true;
  dtDateFrom.Enabled:=true;
  dtDateTo.Enabled:=true;
  dgQuarantine.Enabled:=true;
  btEditQuarantine.Enabled:=true;
  btUpdateQuarantine.Enabled:=true;
  btReturn.Enabled:=true;
  btCloseQuarantine.Enabled:=true;
  Application.ProcessMessages;
end;

procedure TQuarantineF.DisableControls;
begin
  dgReturnOrders.Enabled:=false;
  dtDateFrom.Enabled:=false;
  dtDateTo.Enabled:=false;
  dgQuarantine.Enabled:=false;
  btEditQuarantine.Enabled:=false;
  btUpdateQuarantine.Enabled:=false;
  btReturn.Enabled:=false;
  btCloseQuarantine.Enabled:=false;
  Application.ProcessMessages;
end;

procedure TQuarantineF.ChangeDateQuarantine;
begin
  if dtDateFrom.DateTime > dtDateTo.DateTime then
  begin
    dtDateFrom.DateTime:=Now();
    dtDateTo.DateTime:=Now();
    Application.ProcessMessages;
  end;
  UpdateQuarantine;
end;

function TQuarantineF.GetEmptySeriaCount: integer;
begin
  Result:=0;
  try
    with qTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ');
      SQL.Add('  count(*) as CountOfEmptySeria ');
      SQL.Add('from ');
      SQL.Add('  quarantine ');
      SQL.Add('where ');
      SQL.Add('  isnull(seria,'''')=''''');
      SQL.Add('  or isnull(dt_seria,''1900-01-01 00:00:00'')=''1900-01-01 00:00:00''');
      SQL.Add('');
      Open;
      Result:=FieldByName('CountOfEmptySeria').AsInteger;
    end;
  except
    Result:=1000000;
  end;
end;

procedure TQuarantineF.EditQuarantine;
begin
  if DM.qrQuarantine.RecordCount <=0 then exit;
  try
    QuarantineEditF:=TQuarantineEditF.Create(self);
    with QuarantineEditF do
    begin
      Caption:=MFC;
      
      lb_art_code1.Left:=trunc(ClientWidth/2);
      lb_art_code.Left:=lb_art_code1.Left+lb_art_code1.Width;
      lb_art_code.AutoSize:=false;
      lb_art_code.Width:=ClientWidth-lb_art_code.Left-LEFT_INDENT;

      lb_kod_name1.Left:=LEFT_INDENT;
      lb_kod_name.Left:=lb_kod_name1.Left+lb_kod_name1.Width;
      lb_kod_name.AutoSize:=false;
      lb_kod_name.Width:=lb_art_code1.Left-lb_kod_name1.Width-lb_kod_name1.Left-LEFT_INDENT;

      lb_names1.Left:=LEFT_INDENT;
      lb_names.Left:=lb_names1.Left+lb_names1.Width;
      lb_names.AutoSize:=false;
      lb_names.Width:=ClientWidth-lb_names.Left-LEFT_INDENT;

      lb_f_nds1.Left:=trunc(ClientWidth/3*2);
      lb_f_nds.Left:=lb_f_nds1.Left+lb_f_nds1.Width;
      lb_f_nds.AutoSize:=false;
      lb_f_nds.Width:=ClientWidth-lb_f_nds.Left-LEFT_INDENT;

      lb_cena1.Left:=trunc(ClientWidth/3);
      lb_cena.Left:=lb_cena1.Left+lb_cena1.Width;
      lb_cena.AutoSize:=false;
      lb_cena.Width:=lb_f_nds1.Left-lb_cena.Left-LEFT_INDENT;

      lb_kol1.Left:=LEFT_INDENT;
      lb_kol.Left:=lb_kol1.Left+lb_kol1.Width;
      lb_kol.AutoSize:=false;
      lb_kol.Width:=lb_cena1.Left-lb_kol.Left-LEFT_INDENT;

      dt_seria.Left:=ClientWidth-dt_seria.Width-LEFT_INDENT;
      lb_date_seria.Left:=dt_seria.Left-lb_date_seria.Width;

      lb_seria.Left:=LEFT_INDENT;
      ed_seria.Left:=lb_seria.Left+lb_seria.Width;
      ed_seria.Width:=lb_date_seria.Left-ed_seria.Left-LEFT_INDENT;
    end;

    with DM.qrQuarantine do
    begin
      if not FieldByName('kod_name').IsNull then QuarantineEditF.lb_kod_name.Caption:=FieldByName('kod_name').AsString else QuarantineEditF.lb_kod_name.Caption:='';
      if not FieldByName('art_code').IsNull then QuarantineEditF.lb_art_code.Caption:=FieldByName('art_code').AsString else QuarantineEditF.lb_art_code.Caption:='';
      if not FieldByName('names').IsNull then
      begin
        QuarantineEditF.lb_names.Caption:=FieldByName('names').AsString;
        QuarantineEditF.lb_names.Hint:=FieldByName('names').AsString;
      end
      else
      begin
        QuarantineEditF.lb_names.Caption:='';
        QuarantineEditF.lb_names.Hint:='';
      end;
      if not FieldByName('kol').IsNull then QuarantineEditF.lb_kol.Caption:=FieldByName('kol').AsString else QuarantineEditF.lb_kol.Caption:='';
      if not FieldByName('cena').IsNull then QuarantineEditF.lb_cena.Caption:=FieldByName('cena').AsString else QuarantineEditF.lb_cena.Caption:='';
      if not FieldByName('f_nds').IsNull then QuarantineEditF.lb_f_nds.Caption:=FieldByName('f_nds').AsString else QuarantineEditF.lb_f_nds.Caption:='';
      if not FieldByName('seria').IsNull then QuarantineEditF.ed_seria.Text:=FieldByName('seria').AsString else QuarantineEditF.ed_seria.Text:='';
      if not FieldByName('dt_seria').IsNull then QuarantineEditF.dt_seria.DateTime:=FieldByName('dt_seria').AsDateTime else QuarantineEditF.dt_seria.DateTime:=Now();
    end;

    id_record:=DM.qrQuarantine.FieldByName('id_record').AsString;
    QuarantineEditF.ShowModal;
    if QuarantineEditF.fl_editing then SaveQuarantine;
  finally
    QuarantineEditF.Free;
  end;
end;

procedure TQuarantineF.SaveQuarantine;
begin
  try
    with qTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update ');
      SQL.Add('  Quarantine ');
      SQL.Add('set ');
      SQL.Add('  seria=:seria,');
      SQL.Add('  dt_seria=:dt_seria,');
      SQL.Add('  id_gamma1=:id_gamma,');
      SQL.Add('  dt_gamma1=:dt_gamma, ');
      SQL.Add('  IsUnload=null  ');
      SQL.Add('where ');
      SQL.Add('  id_record=:id_record');
      Parameters.Clear;
      Parameters.CreateParameter('seria',ftString,pdInputOutput,50,trim(QuarantineEditF.ed_seria.Text));
      Parameters.CreateParameter('dt_seria',ftDateTime,pdInputOutput,23,FormatDateTime('YYYY-MM-DD',QuarantineEditF.dt_seria.DateTime));
      Parameters.CreateParameter('id_gamma',ftInteger,pdInputOutput,10,Prm.ID_Gamma);
      Parameters.CreateParameter('dt_gamma',ftDateTime,pdInputOutput,23,FormatDateTime('YYYY-MM-DD HH:MM:SS',now()));
      Parameters.CreateParameter('id_record',ftGuid,pdInputOutput,40,DM.qrQuarantine.FieldByName('id_record').Value);
      ExecSQL;
    end;
  except
    on E:Exception do MainF.MessBox('Не могу сохранить изменения. Получена ошибка от сервера: '+E.Message);
  end;
  UpdateQuarantine;
  DM.qrQuarantine.Locate('id_record',id_record,[]);
end;

procedure TQuarantineF.FormActivate(Sender: TObject);
begin
  DisableControls;
  with QuarantineF do
  begin
    Width:=trunc(Screen.Width*0.75);
    Height:=trunc(Screen.Height*0.75);
    Caption:='Карантин по результатам фарминспекции';
    Position:=poMainFormCenter;
    BorderStyle:=bsSizeable;
    pnlReturnOrders.Align:=alTop;
    pnlReturnOrders.Height:=trunc(ClientHeight/2);
    pnlReturnOrders.Caption:='';
    lbToStockNotification.Caption:=ORDERS_FOR_RETURN_TO_STOCK;
    dgReturnOrders.Align:=alClient;
    with qReturnOrders do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ');
      SQL.Add('  IDDOC,NN_NAKL,DATE_NAKL,TIME_NAKL ');
      SQL.Add('from ');
      SQL.Add('  JMOVES (nolock) ');
      SQL.Add('where ');
      SQL.Add('  TYPE_NAKL = 2');
      SQL.Add('  and IDDOC > '+IntToStr(PriorIDDOC));
      SQL.Add('  and IDDOC <= '+IntToStr(LastIDDOCs));
      SQL.Add('order by');
      SQL.Add('  NN_NAKL');
      Open;
    end;
    Resize(sender);
    Application.ProcessMessages;
    dgQuarantine.Align:=alClient;
    if IsQuarantine then
    begin
      pnlReturnOrders.Visible:=true;
      Splitter1.Visible:=true;
    end
    else
    begin
      pnlReturnOrders.Visible:=false;
      Splitter1.Visible:=false;
    end;

    pnlQuarantine.Align:=alClient;
    pnlQuarantine.Caption:='';
    Resize(sender);
    Application.ProcessMessages;

    pnlFilterQuarantine.Align:=alTop;
    pnlFilterQuarantine.Caption:='';
    pnlFilterQuarantine.AutoSize:=true;
    lbDateFrom.Left:=LEFT_INDENT;
    dtDateFrom.Left:=lbDateFrom.Left+lbDateFrom.Width;
    lbDateTo.Left:=dtDateFrom.Left+dtDateFrom.Width;
    dtDateTo.Left:=lbDateTo.Left+lbDateTo.Width;
    dtDateTo.Date:=Now();
    with qTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select');
      SQL.Add('  min(dt_record) as MinRecordDate ');
      SQL.Add('from ');
      SQL.Add('  quarantine (nolock)');
      SQL.Add('where ');
      SQL.Add('  id_gamma_restore is null ');
      SQL.Add('  and dt_restore is null');
      Open;
      if FieldByName('MinRecordDate').IsNull then dtDateFrom.Date:=Now() else dtDateFrom.Date:=FieldByName('MinRecordDate').AsDateTime;
    end;
    Resize(sender);
    Application.ProcessMessages;

    pnlControlQuarantine.Align:=alBottom;
    pnlControlQuarantine.Caption:='';
    pnlControlQuarantine.AutoSize:=true;
    btEditQuarantine.Left:=LEFT_INDENT;
    btUpdateQuarantine.Left:=btEditQuarantine.Left+btEditQuarantine.Width+LEFT_INDENT;
    btReturn.Left:=btUpdateQuarantine.Left+btUpdateQuarantine.Width+LEFT_INDENT;
    Resize(sender);
    Application.ProcessMessages;
    UpdateQuarantine;
    Application.ProcessMessages;
  end;

  EnableControls;
  QuarantineF.dgQuarantine.SetFocus;
end;

procedure TQuarantineF.FormCreate(Sender: TObject);
begin
  PriorIDDOC:=0;
  LastIDDOCs:=0;
  IsQuarantine:=false;
  id_record:='';
end;

procedure TQuarantineF.btCloseQuarantineClick(Sender: TObject);
begin
  QuarantineF.CloseQuarantine;
end;

procedure TQuarantineF.FormResize(Sender: TObject);
begin
  DisableControls;
  QuarantineF.Resize(sender);
  EnableControls;
end;

procedure TQuarantineF.btUpdateQuarantineClick(Sender: TObject);
begin
  DisableControls;
  UpdateQuarantine;
  EnableControls;
end;

procedure TQuarantineF.btEditQuarantineClick(Sender: TObject);
begin
  QuarantineF.EditQuarantine;
end;

procedure TQuarantineF.btReturnClick(Sender: TObject);
var
  psw: string;
begin
  DisableControls;
  if DM.qrQuarantine.FieldByName('IsReturned').AsInteger=1 then
  begin
    MainF.MessBox('Возвратная накладная по этому товару уже была сформирована!'+#13+
                  'Просмотреть накладную и, при необходимости, '+#13+
                  'распечатать сопроводительную документацию можно из "Истории накладных"'+#13+
                  '(Меню "Накладные" - "История накладных", выбрать "Возвратные накладные"'+#13+
                  'дополнительно выбрав фильтр "Накладные от/к поставщику".');
    EnableControls;
    Exit;
  end;

  if GetEmptySeriaCount > 0 then
  begin
    MainF.MessBox('Вы не можете вернуть товар поставщику до тех пор, '+#13+'пока не будут указаны серии и сроки годности всех препаратов!');
    EnableControls;
    Exit;
  end;

  if DM.qrQuarantine.RecordCount = 0 then
  begin
    EnableControls;
    exit;
  end;

  psw:='';
  with qTemp do
  begin
    SQL.Clear;
    SQL.Add('select passw,dtend from sprprvozr where id=27');
    Open;
    if FieldByName('dtend').Value > date() then psw:=FieldByName('passw').Value;
  end;
  if Not MainF.CheckPassword(psw) then
  begin
    EnableControls;
    Exit;
  end;

  try
    with qTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('declare @kod_name int set @kod_name='+DM.qrQuarantine.FieldByName('kod_name').AsString);
      SQL.Add('declare @id_user int set @id_user='+IntToStr(Prm.UserID));
      SQL.Add('');
      SQL.Add('insert into chk_vozr (');
      SQL.Add('  KOD_NAME,   NAMES,   KOL,   CENA,   F_NDS,   TYPE_TOV,   ID_USER,  ART_CODE, ');
      SQL.Add('    ART_NAME/*,   DATEINS, PR1*/, CompName,    SKLAD,   shtrih,   prvozr, CenaP/*,   skladv*/, pr_vz_post, ');
      SQL.Add('      id_postav,   nn_prih,   dt_prih,   VzDescr, pr_vz,             id_part8,   NumSeriya, SrokGodn,   cena_zakup)');
      SQL.Add('');
      SQL.Add('select');
      SQL.Add('  s.KOD_NAME, s.NAMES, q.kol, q.cena, q.f_nds, s.TYPE_TOV, @id_user, q.art_code, ');
      SQL.Add('    s.ART_NAME/*, DATEINS, PR1*/, host_name(), j.SKLAD, r.SHTRIH, 27,     r.CenaP/*, skladv*/, 5,');
      SQL.Add('      j.ID_POSTAV, j.nn_prih, j.dt_prih, '''',    ''Фарминспекция'', s.id_part8, q.seria,   q.dt_seria, s.CenaZakup');
      SQL.Add('from');
      SQL.Add('  SPRTOV s (nolock)');
      SQL.Add('  left join quarantine q (nolock) on q.kod_name=s.KOD_NAME');
      SQL.Add('  left join rTovar r (nolock) on r.KOD_NAME=s.KOD_NAME');
      SQL.Add('  left join JMOVES j (nolock) on j.IDDOC=r.IDDOC');
      SQL.Add('where');
      SQL.Add('  s.KOD_NAME=@kod_name');
      SQL.Add('');
      SQL.Add('select count(*) as count_vozr from chk_vozr');
      Open;
    end;
  except
    on E:Exception do
    begin
      MessageDlg('Ошибка!'+#13+
                 'Не могу подготовить данные для формирования возвратной накладной!'+#13+
                 'От сервера получена ошибка: '+E.Message,mtError,[mbOK],0);
      EnableControls;
      exit;
    end;
  end;

  if qTemp.FieldByName('count_vozr').AsInteger <= 0 then exit;

  try
    try
      try
        with qTemp do
        begin
          SQL.Clear;
          SQL.Text:='exec spY_WriteVozvrat @pid_user = ' + IntToStr(Prm.UserID) +', @dat = ' + ''''+FormatDateTime('YYYY-MM-DD', Date()) + ''', @priznak = 27 ';
          ExecSQL;
        end;
      except
        on E:Exception do
        begin
          MessageDlg('Ошибка!'+#13+
                     'Не могу сформировать возвратную накладную!'+#13+
                     'От сервера получена ошибка: '+E.Message,mtError,[mbOK],0);
          EnableControls;
          exit;
        end;
      end;
    finally
      with qTemp do
      begin
        SQL.Clear;
        SQL.Add('update');
        SQL.Add('  quarantine ');
        SQL.Add('set ');
        SQL.Add('  dt_restore = '''+FormatDateTime('YYYY-MM-DD HH:SS:MM',Now())+''', ');
        SQL.Add('  id_gamma_restore = '+IntToStr(Prm.ID_Gamma)+', ');
        SQL.Add('  IsReturned = 1');
        SQL.Add('where');
        SQL.Add('  convert(uniqueidentifier,id_record) = '''+DM.qrQuarantine.FieldByName('id_record').AsString+'''');
        SQL.Add('');
        SQL.Add('delete from  ');
        SQL.Add('  chk_vozr');
        SQL.Add('where ');
        SQL.Add('  id_user = '+IntToStr(Prm.UserID));
        SQL.Add('  and compname=host_name()');
        ExecSQL;
      end;
      MessageDlg('Накладная на возврат поставщику сформирована.',mtInformation,[mbOK],0);
    end;
  except
    on E:Exception do
      MessageDlg('Убедитесь, что все товары к возврату подготовлены '+#13+
                 'и повторите формирование возвратной накладной!'+#13+
                 'Ошибка сервера: '+E.Message,mtError,[mbOK],0);
  end;

  EnableControls;
  UpdateQuarantine;
end;

procedure TQuarantineF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if GetEmptySeriaCount > 0 then
  begin
    MainF.MessBox('Вы не можете выйти из карантина до тех пор, '+#13+'пока не будут указаны серии и сроки годности всех препаратов!');
    Action:=caNone;
  end;
end;

procedure TQuarantineF.dtDateFromChange(Sender: TObject);
begin
  ChangeDateQuarantine;
end;

procedure TQuarantineF.dtDateToChange(Sender: TObject);
begin
  ChangeDateQuarantine;
end;

end.
