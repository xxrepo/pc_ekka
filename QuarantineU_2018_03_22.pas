unit QuarantineU;

interface

uses
  Forms, StdCtrls, Buttons, ComCtrls, DB, ADODB, Grids, DBGrids, Controls,
  Classes, ExtCtrls, SysUtils, Windows;

type
  TQuarantineF = class(TForm)
    pnlReturnOrders: TPanel;
    Label6: TLabel;
    lbToStockNotification: TLabel;
    dgReturnOrders: TDBGrid;
    qReturnOrders: TADOQuery;
    dsReturnOrders: TDataSource;
    pnlQuarantine: TPanel;
    dgQuarantine: TDBGrid;
    Label2: TLabel;
    lbNotificationReturnToProvider: TLabel;
    dgOrderDetail: TDBGrid;
    dsOrderDetail: TDataSource;
    qOrderDetail: TADOQuery;
    lbDateFrom: TLabel;
    dtDateFrom: TDateTimePicker;
    lbDateTo: TLabel;
    dtDateTo: TDateTimePicker;
    btEditQuarantine: TBitBtn;
    btUpdateQuarantine: TBitBtn;
    btReturn: TBitBtn;
    btCloseQuarantine: TBitBtn;
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
    procedure dgReturnOrdersDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);

  private
    FPriorIDDOC: integer;
    FLastIDDOCs: integer;
    FIsQuarantine: boolean;
    F_id_record: string;

    procedure Resize(Sender: TObject);
    procedure CloseQuarantine;
    procedure UpdateQuarantine;
    procedure ChangeDateQuarantine;
    function GetEmptySeriaCount: integer;
    procedure EditQuarantine;
    procedure SaveQuarantine;
    procedure GetOrder;

    property id_record: string read F_id_record write F_id_record;
  public
    property PriorIDDOC: integer read FPriorIDDOC write FPriorIDDOC; //номер последней возвратной накладной до формирования возврата по Ф.И.
    property LastIDDOCs: integer read FLastIDDOCs write FLastIDDOCs; //номер последней возвратной накладной после формирования возврата по Ф.И.
    property IsQuarantine: boolean read FIsQuarantine write FIsQuarantine; //показывать или не показывать перечень сформированых возвратных накладных
  end;

var
  QuarantineF:TQuarantineF;

const
  ORDERS_FOR_RETURN_TO_STOCK = 'Товары по нижеуказаным накладным необходимо вернуть на склад!!!'+#13+
                           'Накладные можно посмотреть через меню "Накладные" - "История накладных"';
  NOTIFICATION_RETURN_TO_PROVIDER = 'Если товары необходимо вернуть - нажмите кнопку "Вернуть поставщику"';
  SERIA_IS_ABSENT = 'Серия отсутствует на остатке';
  SERIA_IS_ABSENT_DATE = '01.01.1900';
  DATE_FORMAT = 'dd.mm.yyyy';

  LEFT_INDENT = 12;
  TOP_INDENT = 12;
  SPACE_INDENT = 12;
  CONNECTED_SPACE_INDENT = 4;

  MIN_WIDTH = 640;
  MIN_HEIGHT = 480;

  EDIT_CLIENT_WIDTH = 400;

implementation

uses
  MainU, DataModuleU, ReturnToProviderU, QuarantineEditU;

{$R *.dfm}

procedure TQuarantineF.GetOrder;
begin
  with qOrderDetail do
  begin
    if qReturnOrders.RecordCount > 0 then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select');
      SQL.Add('  s.ART_CODE, max(s.NAMES) as NAMES, sum(r.KOL) as KOL, max(r.CENA) as CENA,');
      SQL.Add('  max(s.F_NDS) as F_NDS, ');
      SQL.Add('  (case when s.F_NDS=1 then ''20%'' when s.F_NDS=2 then ''7%'' end) as NDS');
      SQL.Add('from');
      SQL.Add('  rTovar r (nolock)');
      SQL.Add('  left join SPRTOV s (nolock) on s.KOD_NAME=r.KOD_NAME');
      SQL.Add('where');
      SQL.Add('  r.IDDOC = '+qReturnOrders.FieldByName('IDDOC').AsString);
      SQL.Add('group by');
      SQL.Add('  s.ART_CODE, s.F_NDS');
      SQL.Add('');
      Open;
    end;
  end;
end;

procedure TQuarantineF.CloseQuarantine;
begin
  QuarantineF.Close;
end;

procedure TQuarantineF.UpdateQuarantine;
var
  cr: TCursor;
begin
  cr:=Screen.Cursor;
  try
    with DM.qrQuarantine do
    begin
      Close;
      SQL.Text:='exec spY_Quarantine '''+FormatDateTime('YYYY-MM-DD',dtDateFrom.Date)+''', '''+FormatDateTime('YYYY-MM-DD',dtDateTo.Date)+' 23:59:59''';
      Open;
    end;
  finally
    Screen.Cursor:=cr;
  end;
  dgQuarantine.SetFocus;
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
    with TADOQuery.Create(self) do
    begin
      try
        Connection:=DM.ADOCo;
        SQL.Clear;
        SQL.Add('select ');
        SQL.Add('  count(*) as CountOfEmptySeria ');
        SQL.Add('from ');
        SQL.Add('  quarantine ');
        SQL.Add('where ');
        SQL.Add('  isnull(seria,'''')=''''');
        SQL.Add('  --or isnull(dt_seria,''1900-01-01 00:00:00'')=''1900-01-01 00:00:00''');
        SQL.Add('');
        Open;
        Result:=FieldByName('CountOfEmptySeria').AsInteger;
      finally
        Free;
      end;
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

      ClientWidth:=EDIT_CLIENT_WIDTH;

      lb_kod_name1.Left:=LEFT_INDENT;
      lb_kod_name1.Top:=TOP_INDENT;
      lb_kod_name.Left:=lb_kod_name1.Left+lb_kod_name1.Width+CONNECTED_SPACE_INDENT;
      lb_kod_name.Top:=lb_kod_name1.Top;
      lb_kod_name.AutoSize:=false;
      lb_kod_name.Width:=trunc(ClientWidth/2)-lb_kod_name.Left-SPACE_INDENT;

      lb_art_code1.Left:=trunc(ClientWidth/2);
      lb_art_code1.Top:=lb_kod_name.Top;
      lb_art_code.Left:=lb_art_code1.Left+lb_art_code1.Width+CONNECTED_SPACE_INDENT;
      lb_art_code.Top:=lb_art_code1.Top;
      lb_art_code.AutoSize:=false;
      lb_art_code.Width:=ClientWidth-lb_art_code.Left-LEFT_INDENT;

      lb_names1.Left:=LEFT_INDENT;
      lb_names1.Top:=lb_art_code.Top+lb_art_code.Height+SPACE_INDENT;
      lb_names.Left:=lb_names1.Left+lb_names1.Width+CONNECTED_SPACE_INDENT;
      lb_names.Top:=lb_names1.Top;
      lb_names.AutoSize:=false;
      lb_names.Width:=ClientWidth-lb_names.Left-LEFT_INDENT;

      lb_kol1.Left:=LEFT_INDENT;
      lb_kol1.Top:=lb_names.Top+lb_names.Height+SPACE_INDENT;
      lb_kol.Left:=lb_kol1.Left+lb_kol1.Width+CONNECTED_SPACE_INDENT;
      lb_kol.Top:=lb_kol1.Top;
      lb_kol.AutoSize:=false;
      lb_kol.Width:=trunc(ClientWidth/3)-lb_kol.Left-SPACE_INDENT;

      lb_cena1.Left:=trunc(ClientWidth/3);
      lb_cena1.Top:=lb_kol.Top;
      lb_cena.Left:=lb_cena1.Left+lb_cena1.Width+CONNECTED_SPACE_INDENT;
      lb_cena.Top:=lb_cena1.Top;
      lb_cena.AutoSize:=false;
      lb_cena.Width:=trunc(ClientWidth/3*2)-lb_cena.Left-SPACE_INDENT;

      lb_f_nds1.Left:=lb_cena.Left+lb_cena.Width+SPACE_INDENT;
      lb_f_nds1.Top:=lb_cena.Top;
      lb_f_nds.Left:=lb_f_nds1.Left+lb_f_nds1.Width+CONNECTED_SPACE_INDENT;
      lb_f_nds.Top:=lb_f_nds1.Top;
      lb_f_nds.AutoSize:=false;
      lb_f_nds.Width:=ClientWidth-lb_f_nds.Left-LEFT_INDENT;

      chSeriaIsAbsent.Left:=LEFT_INDENT;
      chSeriaIsAbsent.Top:=lb_f_nds.Top+lb_f_nds.Height+SPACE_INDENT;
      chSeriaIsAbsent.Width:=ClientWidth-chSeriaIsAbsent.Left-LEFT_INDENT;
      chSeriaIsAbsent.Caption:=SERIA_IS_ABSENT;

      lb_seria.Left:=LEFT_INDENT;
      lb_seria.Top:=chSeriaIsAbsent.Top+chSeriaIsAbsent.Height+SPACE_INDENT;
      cbSeria.Left:=lb_seria.Left+lb_seria.Width+CONNECTED_SPACE_INDENT;
      cbSeria.Top:=lb_seria.Top;
      cbSeria.Width:=ClientWidth-cbSeria.Left-lb_date_seria.Width-dt_seria.Width-LEFT_INDENT-SPACE_INDENT-CONNECTED_SPACE_INDENT;
      cbSeria.Style:=csDropDown;
      lb_date_seria.Left:=cbSeria.Left+cbSeria.Width+SPACE_INDENT;
      lb_date_seria.Top:=cbSeria.Top;
      dt_seria.Left:=lb_date_seria.Left+lb_date_seria.Width+CONNECTED_SPACE_INDENT;
      dt_seria.Top:=lb_date_seria.Top;

      btSave.Left:=trunc(ClientWidth/2)-btSave.Width-trunc(SPACE_INDENT/2);
      btSave.Top:=dt_seria.Top+dt_seria.Height+SPACE_INDENT;
      btCancel.Left:=trunc(ClientWidth/2)+trunc(SPACE_INDENT/2);
      btCancel.Top:=btSave.Top;

      ClientHeight:=btCancel.Top+btCancel.Height+TOP_INDENT;
      Position:=poMainFormCenter;
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
        QuarantineEditF.lb_names.Caption:=SERIA_IS_ABSENT;
        QuarantineEditF.lb_names.Hint:=SERIA_IS_ABSENT;
      end;
      if not FieldByName('kol').IsNull then QuarantineEditF.lb_kol.Caption:=FieldByName('kol').AsString else QuarantineEditF.lb_kol.Caption:='';
      if not FieldByName('cena').IsNull then QuarantineEditF.lb_cena.Caption:=FieldByName('cena').AsString else QuarantineEditF.lb_cena.Caption:='';
      if not FieldByName('f_nds').IsNull then QuarantineEditF.lb_f_nds.Caption:=FieldByName('f_nds').AsString else QuarantineEditF.lb_f_nds.Caption:='';
    end;

    //заполнение доступных серий
    with QuarantineEditF do
    begin
      cbSeria.Items.Clear;
      cbSeria.ItemIndex:=-1;
      cbSeria_KodName.Items.Clear;
      cbSeria_KodName.ItemIndex:=-1;
      cbSeria_Srok.Items.Clear;
      cbSeria_Srok.ItemIndex:=-1;
      with TADOQuery.Create(self) do
      begin
        try
          Connection:=DM.ADOCo;
          SQL.Clear;
          SQL.Add('declare @art_code int');
          SQL.Add('set @art_code = '+DM.qrQuarantine.FieldByName('art_code').AsString);
          SQL.Add('');
          SQL.Add('select');
          SQL.Add('  s.KOD_NAME, s.ART_CODE, s.NAMES,');
          SQL.Add('  i.NumSeriya, i.SrokGodn');
          SQL.Add('from');
          SQL.Add('  SPRTOV s');
          SQL.Add('  left join SERII i on i.ID_PART8=s.id_part8');
          SQL.Add('where');
          SQL.Add('  s.ART_CODE = @art_code');
          SQL.Add('  and s.OSTAT > 0');
          SQL.Add('order by');
          SQL.Add('  i.NumSeriya');
          SQL.Add('');
          Open;
          if not IsEmpty then
          begin
            while not Eof do
            begin
              QuarantineEditF.cbSeria.Items.Add(FieldByName('NumSeriya').AsString);
              QuarantineEditF.cbSeria_KodName.Items.Add(FieldByName('KOD_NAME').AsString);
              QuarantineEditF.cbSeria_Srok.Items.Add(FormatDateTime(DATE_FORMAT,FieldByName('SrokGodn').AsDateTime));
              Next;
            end;
          end;
        finally
          Free;
        end;
      end;

      if (DM.qrQuarantine.FieldByName('SeriaIsEmpty').IsNull)or(DM.qrQuarantine.FieldByName('SeriaIsEmpty').AsInteger = 0) then
      begin
        QuarantineEditF.chSeriaIsAbsent.Checked:=false;
        QuarantineEditF.chSeriaIsAbsentClick(QuarantineF.btEditQuarantine);
      end
      else
      begin
        if DM.qrQuarantine.FieldByName('SeriaIsEmpty').AsInteger = 1 then
        begin
          QuarantineEditF.chSeriaIsAbsent.Checked:=true;
          QuarantineEditF.chSeriaIsAbsentClick(QuarantineF.btEditQuarantine);
        end;
      end;
      cbSeria.Text:=DM.qrQuarantine.FieldByName('seria').AsString;
      dt_seria.DateTime:=DM.qrQuarantine.FieldByName('dt_seria').AsDateTime;
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
    with TADOQuery.Create(self) do
    begin
     try
        Connection:=DM.ADOCo;
        SQL.Clear;
        SQL.Add('declare @id_gamma int set @id_gamma = '+IntToStr(Prm.ID_Gamma));
        SQL.Add('declare @dt_gamma datetime set @dt_gamma = '''+FormatDateTime('YYYY-MM-DD HH:MM:SS',now())+'''');
        SQL.Add('declare @seria varchar(50) set @seria = '''+trim(QuarantineEditF.cbSeria.Text)+'''');
        SQL.Add('declare @dt_seria datetime set @dt_seria = '''+FormatDateTime('YYYY-MM-DD',QuarantineEditF.dt_seria.DateTime)+'''');
        SQL.Add('declare @id_record uniqueidentifier set @id_record = '''+DM.qrQuarantine.FieldByName('id_record').Value+'''');
        SQL.Add('');
        SQL.Add('update');
        SQL.Add('  Quarantine');
        SQL.Add('set');
        SQL.Add('  id_gamma1=@id_gamma,');
        SQL.Add('  dt_gamma1=@dt_gamma, ');
        SQL.Add('  IsUnload=null,  ');
        SQL.Add('  seria=@seria,');
        SQL.Add('  dt_seria=@dt_seria,');
        if QuarantineEditF.chSeriaIsAbsent.Checked then
          SQL.Add('  SeriaIsEmpty=1,')
        else
          SQL.Add('  SeriaIsEmpty=0,');
        SQL.Add('  kod_name = ' + DM.qrQuarantine.FieldByName('kod_name').AsString);// + QuarantineEditF.cbSeria_KodName.Items[QuarantineEditF.cbSeria.ItemIndex]);
        SQL.Add('');
        SQL.Add('where ');
        SQL.Add('  id_record=@id_record');
        SQL.Add('');
        //sql.SaveToFile('1234');
        ExecSQL;
      finally
        Free;
      end;
    end;
  except
    on E:Exception do MainF.MessBox('Не могу сохранить изменения. Получена ошибка от сервера: '+E.Message);
  end;

  UpdateQuarantine;
  if not DM.qrQuarantine.Locate('id_record',id_record,[]) then DM.qrQuarantine.First;
end;

procedure TQuarantineF.FormActivate(Sender: TObject);
var
  cr: TCursor;
begin
  cr:=Screen.Cursor;
  try
    with QuarantineF do
    begin
      Width:=trunc(Screen.Width*0.75);
      Height:=trunc(Screen.Height*0.75);

      with qReturnOrders do
      begin
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
      if qReturnOrders.RecordCount > 0 then Getorder;
      if IsQuarantine then
        pnlReturnOrders.Visible:=true
      else
        pnlReturnOrders.Visible:=false;

      dtDateTo.Date:=Now();
      with TADOQuery.Create(self) do
      begin
        try
          Connection:=DM.ADOCo;
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
        finally
          Free;
        end;
      end;

      Position:=poMainFormCenter;
      UpdateQuarantine;
    end;
  finally
    Screen.Cursor:=cr;
    QuarantineF.dgQuarantine.SetFocus;
  end;
end;

procedure TQuarantineF.FormCreate(Sender: TObject);
begin
  PriorIDDOC:=0;
  LastIDDOCs:=0;
  IsQuarantine:=false;
  id_record:='';

  Constraints.MinWidth:=MIN_WIDTH;
  Constraints.MinHeight:=MIN_HEIGHT;
  Caption:=MFC+': Карантин по результатам фарминспекции';
  Position:=poMainFormCenter;
  BorderStyle:=bsSizeable;

  lbToStockNotification.Caption:=ORDERS_FOR_RETURN_TO_STOCK;
  lbToStockNotification.AutoSize:=true;
  lbNotificationReturnToProvider.Caption:=NOTIFICATION_RETURN_TO_PROVIDER;
  lbNotificationReturnToProvider.AutoSize:=true;

  pnlReturnOrders.Caption:='';
  pnlQuarantine.Caption:='';
  dgReturnOrders.Width:=240;
  with dgReturnOrders do
  begin
    Columns[0].Width:=100;
    Columns[1].Width:=100;
  end;
end;

procedure TQuarantineF.Resize(Sender: TObject);
begin
  with QuarantineF do
  begin
    pnlReturnOrders.Left:=LEFT_INDENT;
    pnlReturnOrders.Top:=TOP_INDENT;
    pnlReturnOrders.Width:=ClientWidth-pnlReturnOrders.Left-LEFT_INDENT;
    pnlReturnOrders.Height:=trunc(ClientHeight/2);

    Label6.AutoSize:=true;
    Label6.Left:=trunc((pnlReturnOrders.Width-Label6.Width)/2);
    Label6.Top:=TOP_INDENT;

    lbToStockNotification.AutoSize:=true;
    lbToStockNotification.Left:=trunc((pnlReturnOrders.Width-lbToStockNotification.Width)/2);
    lbToStockNotification.Top:=Label6.Top+Label6.Height+CONNECTED_SPACE_INDENT;

    dgReturnOrders.Left:=LEFT_INDENT;
    dgReturnOrders.Top:=lbToStockNotification.Top+lbToStockNotification.Height+CONNECTED_SPACE_INDENT;
    dgReturnOrders.Height:=pnlReturnOrders.Height-dgReturnOrders.Top-TOP_INDENT;

    dgOrderDetail.Left:=dgReturnOrders.Left+dgReturnOrders.Width+CONNECTED_SPACE_INDENT;
    dgOrderDetail.Top:=dgReturnOrders.Top;
    dgOrderDetail.Width:=pnlReturnOrders.Width-dgOrderDetail.Left-LEFT_INDENT;
    dgOrderDetail.Height:=pnlReturnOrders.Height-dgOrderDetail.Top-TOP_INDENT;
    with dgOrderDetail do
    begin
      Columns[0].Width:=65;
      Columns[1].Width:=trunc(dgOrderDetail.Width-65*4)-40;
      Columns[2].Width:=65;
      Columns[3].Width:=65;
      Columns[4].Width:=65;
    end;

    pnlQuarantine.Left:=LEFT_INDENT;
    if IsQuarantine then
      pnlQuarantine.Top:=pnlReturnOrders.Top+pnlReturnOrders.Height+CONNECTED_SPACE_INDENT
    else
      pnlQuarantine.Top:=TOP_INDENT;
    pnlQuarantine.Width:=ClientWidth-pnlQuarantine.Left-LEFT_INDENT;
    pnlQuarantine.Height:=ClientHeight-pnlQuarantine.Top-TOP_INDENT;

    Label2.AutoSize:=true;
    Label2.Left:=trunc((pnlQuarantine.Width-Label2.Width)/2);
    Label2.Top:=TOP_INDENT;

    lbNotificationReturnToProvider.AutoSize:=true;
    lbNotificationReturnToProvider.Left:=trunc((pnlQuarantine.Width-lbNotificationReturnToProvider.Width)/2);
    lbNotificationReturnToProvider.Top:=Label2.Top+Label2.Height+CONNECTED_SPACE_INDENT;

    lbDateFrom.Left:=LEFT_INDENT;
    lbDateFrom.Top:=lbNotificationReturnToProvider.Top+lbNotificationReturnToProvider.Height+SPACE_INDENT;
    dtDateFrom.Left:=lbDateFrom.Left+lbDateFrom.Width+CONNECTED_SPACE_INDENT;
    dtDateFrom.Top:=lbDateFrom.Top;
    lbDateTo.Left:=dtDateFrom.Left+dtDateFrom.Width+CONNECTED_SPACE_INDENT;
    lbDateTo.Top:=dtDateFrom.Top;
    dtDateTo.Left:=lbDateTo.Left+lbDateTo.Width+CONNECTED_SPACE_INDENT;
    dtDateTo.Top:=lbDateTo.Top;

    btEditQuarantine.Left:=LEFT_INDENT;
    btEditQuarantine.Top:=pnlQuarantine.Height-btEditQuarantine.Height-TOP_INDENT;
    btUpdateQuarantine.Left:=btEditQuarantine.Left+btEditQuarantine.Width+SPACE_INDENT;
    btUpdateQuarantine.Top:=btEditQuarantine.Top;
    btReturn.Left:=btUpdateQuarantine.Left+btUpdateQuarantine.Width+SPACE_INDENT;
    btReturn.Top:=btUpdateQuarantine.Top;
    btCloseQuarantine.Left:=pnlQuarantine.Width-btCloseQuarantine.Width-LEFT_INDENT;
    btCloseQuarantine.Top:=btReturn.Top;

    dgQuarantine.Left:=LEFT_INDENT;
    dgQuarantine.Top:=dtDateTo.Top+dtDateTo.Height+SPACE_INDENT;
    dgQuarantine.Width:=pnlQuarantine.Width-dgQuarantine.Left-LEFT_INDENT;
    dgQuarantine.Height:=btCloseQuarantine.Top-dgQuarantine.Top-SPACE_INDENT;

    with dgQuarantine do
    begin
      Columns[0].Width:=90; //dt_record
      Columns[1].Width:=65; //kod_name
      Columns[2].Width:=65; //art_code
      Columns[3].Width:=trunc((QuarantineF.Width-(65*6+90)-50)/2)-7; //names
      Columns[4].Width:=65; //kol
      Columns[5].Width:=65; //cena
      Columns[6].Width:=65; //f_nds
      Columns[7].Width:=trunc((QuarantineF.Width-(65*6+90)-50)/2)-7; //seria
      Columns[8].Width:=65; //dt_seria
    end;
  end;
end;

procedure TQuarantineF.btCloseQuarantineClick(Sender: TObject);
begin
  QuarantineF.CloseQuarantine;
end;

procedure TQuarantineF.FormResize(Sender: TObject);
begin
  QuarantineF.Resize(sender);
end;

procedure TQuarantineF.btUpdateQuarantineClick(Sender: TObject);
begin
  UpdateQuarantine;
end;

procedure TQuarantineF.btEditQuarantineClick(Sender: TObject);
begin
  QuarantineF.EditQuarantine;
end;

procedure TQuarantineF.btReturnClick(Sender: TObject);
var
  psw: string;
  old_cr: TCursor;
begin
  old_cr:=Screen.Cursor;
  try
    Screen.Cursor:=crHourGlass;

    try
      if not DM.qrQuarantine.Active then
      begin
        raise Exception.Create('Таблица карантинов временно не доступна!');
        Exit;
      end;

      if DM.qrQuarantine.IsEmpty then exit;

      if DM.qrQuarantine.FieldByName('IsReturned').AsInteger=1 then
      begin
        raise Exception.Create('Возвратная накладная по этому товару уже была сформирована!'+#13+
                               'Просмотреть накладную и, при необходимости, '+#13+
                               'распечатать сопроводительную документацию можно из "Истории накладных"'+#13+
                               '(Меню "Накладные" - "История накладных", выбрать "Возвратные накладные"'+#13+
                               'дополнительно выбрав фильтр "Накладные от/к поставщику".');
        exit;
      end;

      if (DM.qrQuarantine.FieldByName('SeriaIsEmpty').AsInteger = 1) then
      begin
        raise Exception.Create('Вы не можете вернуть товар'+#13+
                               'серия и срок годности которого'+#13+
                               'не соответствуют фактическим '+#13+
                               'остаткам по программе'+#13+
                               'За дополнительной информацией'+#13+
                               'обратитесь в аналитический отдел');
        exit;
      end;

      if GetEmptySeriaCount > 0 then
      begin
        raise Exception.Create('Вы не можете вернуть товар поставщику до тех пор,'+#13+
                               'пока не будут указаны серии и сроки годности всех препаратов!');
        Exit;
      end;

      psw:='';
      with TADOQuery.Create(self) do
      begin
        try
          Connection:=DM.ADOCo;
          SQL.Clear;
          SQL.Add('select passw,dtend from sprprvozr where id=27');
          Open;
          if FieldByName('dtend').AsDateTime > date() then psw:=FieldByName('passw').AsString;
        finally
          Free;
        end;
      end;
      if Not MainF.CheckPassword(psw) then
      begin
        raise Exception.Create('Не верный пароль!');
        Exit;
      end;

      with TADOQuery.Create(self) do
      begin
        try
          Connection:=DM.ADOCo;
          SQL.Clear;
          SQL.Add('declare @kod_name int set @kod_name='+DM.qrQuarantine.FieldByName('kod_name').AsString);
          SQL.Add('declare @id_user int set @id_user='+IntToStr(Prm.UserID));
          SQL.Add('');
          SQL.Add('insert into chk_vozr (');
          SQL.Add('  KOD_NAME,   NAMES,   KOL,   CENA,   F_NDS,   TYPE_TOV,   ID_USER,  ART_CODE, ');
          SQL.Add('    ART_NAME,   CompName,    SKLAD,   shtrih,   prvozr, CenaP,   pr_vz_post, ');
          SQL.Add('      id_postav,   nn_prih,   dt_prih,   VzDescr, pr_vz,             id_part8,   NumSeriya, SrokGodn,   cena_zakup');
          SQL.Add(')');
          SQL.Add('');
          SQL.Add('select');
          SQL.Add('  s.KOD_NAME, s.NAMES, q.kol, q.cena, q.f_nds, s.TYPE_TOV, @id_user, q.art_code, ');
          SQL.Add('    s.ART_NAME, host_name(), j.SKLAD, r.SHTRIH, 27,     r.CenaP, 5,');
          SQL.Add('      s.ID_POSTAV, j.nn_prih, j.dt_prih, '''',    ''Фарминспекция'', s.id_part8, q.seria,   q.dt_seria, s.CenaZakup');
          SQL.Add('from');
          SQL.Add('  SPRTOV s (nolock)');
          SQL.Add('  inner join quarantine q (nolock) on q.kod_name=s.KOD_NAME');
          SQL.Add('  left join rTovar r (nolock) on r.KOD_NAME=s.KOD_NAME');
          SQL.Add('  left join JMOVES j (nolock) on j.IDDOC=r.IDDOC');
          SQL.Add('where');
          SQL.Add('  s.KOD_NAME=@kod_name');
          SQL.Add('  and q.id_gamma_restore is null');
          SQL.Add('  and q.dt_restore is null');
          SQL.Add('  and q.IsReturned is null');
          SQL.Add('');
          SQL.Add('select count(*) as count_vozr from chk_vozr');
          SQL.Add('');
          Open;

          if IsEmpty then
          begin
            raise Exception.Create('Товары не были подготовлены к возврату');
            exit;
          end
          else
            if FieldByName('count_vozr').AsInteger <= 0 then
            begin
              raise Exception.Create('Товары не были подготовлены к возврату');
              exit;
            end;
        finally
          Free;
        end;
      end;

      with TADOQuery.Create(self) do
      begin
        try
          try
            Connection:=DM.ADOCo;
            SQL.Clear;
            SQL.Text:='exec spY_WriteVozvrat @pid_user = ' + IntToStr(Prm.UserID) +', @dat = ' + ''''+FormatDateTime('YYYY-MM-DD', Date()) + ''', @priznak = 27, @IsQuarantine=1 ';
            ExecSQL;
          except
            raise Exception.Create('Не могу сформировать возвратную накладную!');
            exit;
          end;
        finally
          try
            SQL.Clear;
            SQL.Add('update');
            SQL.Add('  quarantine ');
            SQL.Add('set ');
            SQL.Add('  dt_restore = '''+FormatDateTime('YYYY-MM-DD HH:SS:MM',Now())+''', ');
            SQL.Add('  id_gamma_restore = '+IntToStr(Prm.ID_Gamma)+', ');
            SQL.Add('  IsReturned = 1,');
            SQL.Add('  IsUnload = 0');
            SQL.Add('where');
            SQL.Add('  convert(uniqueidentifier,id_record) = '''+DM.qrQuarantine.FieldByName('id_record').AsString+'''');
            SQL.Add('');
            SQL.Add('delete from  ');
            SQL.Add('  chk_vozr');
            SQL.Add('where ');
            SQL.Add('  id_user = '+IntToStr(Prm.UserID));
            SQL.Add('  and compname=host_name()');
            ExecSQL;
          except
            raise Exception.Create('Не получилось обновить сведения о возврате!'+#13+
                                   'Если возвратная накладная сформирована'+#13+
                                   'удалите накладную и повторите формирование возврата.'+#13+
                                   'За дополнительной информацией обратитесь в аналитический отдел.');
          end;
          Free;
          MainF.MessBox('Накладная на возврат поставщику сформирована.',64)
        end;
      end;

    except
      on E:Exception do
      begin
        MainF.MessBox('При формировании возвратной накладно получена ошибка: '+E.Message,16)
      end;
    end;
  finally
    Screen.Cursor:=old_cr;
    UpdateQuarantine;
  end;
end;

procedure TQuarantineF.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TQuarantineF.dgReturnOrdersDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if IsQuarantine then GetOrder;
end;

end.
