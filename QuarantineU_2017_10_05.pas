unit QuarantineU;

interface

uses
  Forms, Classes, Controls, ExtCtrls, Grids, DBGrids, Graphics, StdCtrls,
  SysUtils, ComCtrls, Buttons, DB, ADODB, DateUtils, Math, Windows, Dialogs;

type
  TQuarantineF = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    btEdit: TBitBtn;
    btClose: TBitBtn;
    btSave: TBitBtn;
    btCancel: TBitBtn;
    Label1: TLabel;
    lb_kod_name: TLabel;
    Label3: TLabel;
    lb_art_code: TLabel;
    Label5: TLabel;
    lb_names: TLabel;
    Label7: TLabel;
    lb_kol: TLabel;
    Label9: TLabel;
    lb_cena: TLabel;
    Label11: TLabel;
    lb_f_nds: TLabel;
    Label13: TLabel;
    ed_seria: TEdit;
    Label14: TLabel;
    dt_seria: TDateTimePicker;
    qTemp: TADOQuery;
    btUpdate: TBitBtn;
    Panel3: TPanel;
    dt_from: TDateTimePicker;
    dt_to: TDateTimePicker;
    Label2: TLabel;
    Label4: TLabel;
    btExtractFromQuarantine: TBitBtn;
    btReturnToProvider: TBitBtn;

    procedure FormActivate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift:TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure ed_seriaChange(Sender: TObject);
    procedure dt_seriaChange(Sender: TObject);
    procedure ed_seriaExit(Sender: TObject);
    procedure dt_seriaExit(Sender: TObject);
    procedure btUpdateClick(Sender: TObject);
    procedure ed_seriaKeyDown(Sender: TObject; var Key: Word; Shift:TShiftState);
    procedure dt_seriaKeyDown(Sender: TObject; var Key: Word; Shift:TShiftState);
    procedure dt_fromChange(Sender: TObject);
    procedure dt_toChange(Sender: TObject);
    procedure btExtractFromQuarantineClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btReturnToProviderClick(Sender: TObject);

  private

    is_edited: boolean;
    old_seria: string;
    old_dt_seria: TDateTime;
    F_id_record: string; 

    procedure EnableControls;
    procedure DisableControls;
    procedure EditQuarantine;
    procedure UpdateQuarantine;
    procedure CloseQuarantine;
    procedure SaveQuarantine;
    procedure CancelQuarantine;
    procedure ChangeDateQuarantine;
    procedure WhatIsKeyDown(var Key: Word; Shift: TShiftState);
    procedure ResizeQuarantineF;
    function GetEmptySeriaCount: integer;

    property id_record: string read F_id_record write F_id_record;

  end;

var QuarantineF:TQuarantineF;

implementation

uses
  MainU,DataModuleU, ReturnToProviderU;

{$R *.dfm}

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
      SQL.Add('   or isnull(dt_seria,''1900-01-01 00:00:00'')=''1900-01-01 00:00:00''');
      SQL.Add('');
      Open;
      Result:=FieldByName('CountOfEmptySeria').AsInteger;
    end;
  except
    Result:=1000000;
  end;
end;

procedure TQuarantineF.ResizeQuarantineF;
var
  lb_width: integer;
begin
  with DBGrid1 do
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

  btEdit.Left:=12;
  btExtractFromQuarantine.Left:=btEdit.Left+btEdit.Width+btEdit.Left;
  btUpdate.Left:=btExtractFromQuarantine.Left+btExtractFromQuarantine.Width+btEdit.Left;
  btReturnToProvider.Left:=btUpdate.Left+btUpdate.Width+btEdit.Left;
  btClose.Left:=QuarantineF.Width-btClose.Width-40;
  btCancel.Left:=QuarantineF.Width-btCancel.Width-30;
  btSave.Left:=QuarantineF.Width-btCancel.Width-btSave.Width-40;

  lb_names.Width:=Panel1.Width-lb_names.Left-20;

  lb_width:=trunc(((Panel2.Width-Label7.Width-Label9.Width-Label11.Width-116)/3));
  Label7.Left:=8; //количество
  lb_kol.Left:=Label7.Left+Label7.Width+12;
  lb_kol.Width:=lb_width;
  Label9.Left:=lb_kol.Left+lb_kol.Width+24; //цена
  lb_cena.Left:=Label9.Left+Label9.Width+24;
  lb_cena.Width:=lb_width;
  Label11.Left:=lb_cena.Left+lb_cena.Width+24; //ндс
  lb_f_nds.Left:=Label11.Left+Label11.Width+12;
  lb_f_nds.Width:=lb_width;

  Label13.Left:=8;
  ed_seria.Left:=Label13.Left+Label13.Width+12;
  ed_seria.Width:=Panel2.Width-Label13.Width-Label14.Width-dt_seria.Width-80;
  dt_seria.Left:=Panel2.Width-dt_seria.Width-24;
  Label14.Left:=dt_seria.Left-Label14.Width-12;
end;

procedure TQuarantineF.EnableControls;
begin
  btEdit.Enabled:=true;
  btExtractFromQuarantine.Enabled:=false;
  btUpdate.Enabled:=true;
  btReturnToProvider.Enabled:=true;
  btClose.Enabled:=true;
  dt_from.Enabled:=true;
  dt_to.Enabled:=true;
  DBGrid1.Enabled:=true;
  Application.ProcessMessages;
end;

procedure TQuarantineF.DisableControls;
begin
  btEdit.Enabled:=false;
  btExtractFromQuarantine.Enabled:=false;
  btUpdate.Enabled:=false;
  btReturnToProvider.Enabled:=false;
  btClose.Enabled:=false;
  dt_from.Enabled:=false;
  dt_to.Enabled:=false;
  DBGrid1.Enabled:=false;
  Application.ProcessMessages;
end;

procedure TQuarantineF.EditQuarantine;
begin
  if DM.qrQuarantine.RecordCount <=0 then exit;
  Panel2.Visible:=true;
  DisableControls;

  with DM.qrQuarantine do
  begin
    if not FieldByName('kod_name').IsNull then QuarantineF.lb_kod_name.Caption:=IntToStr(FieldByName('kod_name').Value) else QuarantineF.lb_kod_name.Caption:='';
    if not FieldByName('art_code').IsNull then QuarantineF.lb_art_code.Caption:=IntToStr(FieldByName('art_code').Value) else QuarantineF.lb_art_code.Caption:='';
    if not FieldByName('names').IsNull then QuarantineF.lb_names.Caption:=FieldByName('names').Value else QuarantineF.lb_names.Caption:='';
    if not FieldByName('kol').IsNull then QuarantineF.lb_kol.Caption:=IntToStr(FieldByName('kol').Value) else QuarantineF.lb_kol.Caption:='';
    if not FieldByName('cena').IsNull then QuarantineF.lb_cena.Caption:=CurrToStr(FieldByName('cena').Value) else QuarantineF.lb_cena.Caption:='';
    if not FieldByName('f_nds').IsNull then QuarantineF.lb_f_nds.Caption:=FieldByName('f_nds').Value else QuarantineF.lb_f_nds.Caption:='';
    if not FieldByName('seria').IsNull then QuarantineF.ed_seria.Text:=FieldByName('seria').Value else QuarantineF.ed_seria.Text:='';
    if not FieldByName('dt_seria').IsNull then QuarantineF.dt_seria.DateTime:=FieldByName('dt_seria').AsDateTime else QuarantineF.dt_seria.DateTime:=now();
  end;

  old_seria:=ed_seria.Text;
  old_dt_seria:=dt_seria.DateTime;
  is_edited:=false;
  id_record:=DM.qrQuarantine.FieldByName('id_record').AsString;
  
  ed_seria.SetFocus;
end;

procedure TQuarantineF.UpdateQuarantine;
begin
  with DM.qrQuarantine do
  begin
    Close;
    SQL.Text:='exec spY_Quarantine '''+FormatDateTime('YYYY-MM-DD',dt_from.Date)+''', '''+FormatDateTime('YYYY-MM-DD',dt_to.Date)+' 23:59:59''';
    Open;
  end;
  EnableControls;
  DBGrid1.SetFocus;
end;

procedure TQuarantineF.CloseQuarantine;
begin
  QuarantineF.Close;
end;

procedure TQuarantineF.SaveQuarantine;
begin
  if is_edited then
  begin
    if MainF.MessBox('Серия и/или срок годности были изменены!'+#13+'Сохранить изменения?',52) in [ID_YES,ID_OK] then
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
          SQL.Add('');
          Parameters.Clear;
          Parameters.CreateParameter('seria',ftString,pdInputOutput,50,trim(ed_seria.Text));
          Parameters.CreateParameter('dt_seria',ftDateTime,pdInputOutput,23,FormatDateTime('YYYY-MM-DD',dt_seria.DateTime));
          Parameters.CreateParameter('id_gamma',ftInteger,pdInputOutput,10,Prm.ID_Gamma);
          Parameters.CreateParameter('dt_gamma',ftDateTime,pdInputOutput,23,FormatDateTime('YYYY-MM-DD HH:MM:SS',now()));
          Parameters.CreateParameter('id_record',ftGuid,pdInputOutput,40,DM.qrQuarantine.FieldByName('id_record').Value);
          ExecSQL;
        end;
      except
        on E:Exception do MainF.MessBox('Не могу сохранить изменения. Получена ошибка от сервера: '+E.Message);
      end;
      EnableControls;
      UpdateQuarantine;
      DM.qrQuarantine.Locate('id_record',id_record,[]);
    end
  end;

  CancelQuarantine;
end;

procedure TQuarantineF.CancelQuarantine;
begin
  DisableControls;
  Panel2.Visible:=false;
  EnableControls;
  DBGrid1.SetFocus;
end;

procedure TQuarantineF.ChangeDateQuarantine;
begin
  if dt_from.DateTime > dt_to.DateTime then
  begin
    dt_from.DateTime:=Date();
    dt_to.DateTime:=Date();
    Application.ProcessMessages;
  end;
  UpdateQuarantine;
end;

procedure TQuarantineF.WhatIsKeyDown(var Key: Word; Shift: TShiftState);
begin
  if (QuarantineF.ActiveControl = dt_seria)or(QuarantineF.ActiveControl = ed_seria) then
  begin
    case key of
      VK_RETURN: //enter
        begin
          if Panel2.Visible then
            SaveQuarantine
          else
            EditQuarantine;
        end;
      VK_ESCAPE: //esc
        begin
          if Panel2.Visible then
            CancelQuarantine
          else
            CloseQuarantine;
        end;
    end;
  end
  else
    if QuarantineF.ActiveControl = DBGrid1 then
    begin
      case key of
        VK_RETURN: //enter
            if Panel2.Visible then SaveQuarantine else EditQuarantine;
        VK_ESCAPE: //esc
            if Panel2.Visible then CancelQuarantine else CloseQuarantine;
        VK_F5: //F5
            if not Panel2.Visible then UpdateQuarantine;
      end;
    end;
end;

procedure TQuarantineF.FormActivate(Sender: TObject);
begin
  DisableControls;
  dt_from.DateTime:=now();
  dt_to.DateTime:=now();
  UpdateQuarantine;
  with QuarantineF do
  begin
    Width:=800;
    Height:=600;
    BorderStyle:=bsSizeable;
    Caption:='Карантин по результатам фарминспекции';
    Position:=poMainFormCenter;
    BorderStyle:=bsSizeable;
    DBGrid1.Enabled:=true;
  end;

  lb_kod_name.Caption:='';
  lb_art_code.Caption:='';
  lb_names.Caption:='';
  lb_kol.Caption:='';
  lb_cena.Caption:='';
  lb_f_nds.Caption:='';
  ed_seria.Text:='';
  dt_seria.Date:=now();

  Panel1.Visible:=true;
  Panel2.Visible:=false;

  btEdit.Left:=20;

  QuarantineF.ResizeQuarantineF;
  EnableControls;
  QuarantineF.DBGrid1.SetFocus;
end;

procedure TQuarantineF.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  WhatIsKeyDown(Key,Shift);
end;

procedure TQuarantineF.FormResize(Sender: TObject);
begin
  DisableControls;
  QuarantineF.ResizeQuarantineF;
  EnableControls;
end;

procedure TQuarantineF.FormCreate(Sender: TObject);
begin
  DBGrid1.Align:=alClient;
  id_record:='';
end;

procedure TQuarantineF.btCloseClick(Sender: TObject);
begin
  QuarantineF.CloseQuarantine;
end;

procedure TQuarantineF.btEditClick(Sender: TObject);
begin
  QuarantineF.EditQuarantine;
end;

procedure TQuarantineF.btCancelClick(Sender: TObject);
begin
  QuarantineF.CancelQuarantine;
end;

procedure TQuarantineF.btSaveClick(Sender: TObject);
 begin
  QuarantineF.SaveQuarantine;
 end;

procedure TQuarantineF.ed_seriaChange(Sender: TObject);
begin
  is_edited:=true;
end;

procedure TQuarantineF.dt_seriaChange(Sender: TObject);
begin
  is_edited:=true;
end;

procedure TQuarantineF.ed_seriaExit(Sender: TObject);
begin
  if old_seria <> ed_seria.Text then is_edited:=true;
end;

procedure TQuarantineF.dt_seriaExit(Sender: TObject);
begin
  if old_dt_seria <> dt_seria.DateTime then is_edited:=true;
end;

procedure TQuarantineF.btUpdateClick(Sender: TObject);
begin
  UpdateQuarantine;
end;

procedure TQuarantineF.ed_seriaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  WhatIsKeyDown(Key,Shift);
end;

procedure TQuarantineF.dt_seriaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  WhatIsKeyDown(Key,Shift);
end;

procedure TQuarantineF.dt_fromChange(Sender: TObject);
begin
  ChangeDateQuarantine;
end;

procedure TQuarantineF.dt_toChange(Sender: TObject);
begin
  ChangeDateQuarantine;
end;

procedure TQuarantineF.btExtractFromQuarantineClick(Sender: TObject);
begin
  if DM.qrQuarantine.RecordCount <=0 then exit;
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

procedure TQuarantineF.btReturnToProviderClick(Sender: TObject);
var
  psw: string;
begin
  DisableControls;
  if GetEmptySeriaCount > 0 then
  begin
    MainF.MessBox('Вы не можете выйти из карантина до тех пор, '+#13+'пока не будут указаны серии и сроки годности всех препаратов!');
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
      //ExecSQL;
      Open;
    end;
  except
    on E:Exception do
    begin
      MessageDlg('Ошибка!'+#13+
                 'Не могу подготовить данные для формирования возвратной накладной!'+#13+
                 'От сервера получена ошибка: '+E.Message,mtError,[mbOK],0);
      exit;
    end;
  end;

  if qTemp.FieldByName('count_vozr').AsInteger <= 0 then exit;

  try
    try
      with qTemp do
      begin
        SQL.Clear;
//        SQL.Add('exec spY_WriteVozvrat @pid_user = ' + IntToStr(Prm.UserID) +', @dat = ' + ''''+FormatDateTime('YYYY-MM-DD', Date()) + ''', @priznak = 27 ');
        SQL.Text:='exec spY_WriteVozvrat @pid_user = ' + IntToStr(Prm.UserID) +', @dat = ' + ''''+FormatDateTime('YYYY-MM-DD', Date()) + ''', @priznak = 27 ';
        ExecSQL;
      end;
    finally
      with qTemp do
      begin
        SQL.Clear;
        SQL.Add('update');
        SQL.Add('  quarantine ');
        SQL.Add('set ');
        SQL.Add('  dt_restore = '''+FormatDateTime('YYYY-MM-DD HH:SS:MM',Now())+''', ');
        SQL.Add('  id_gamma_restore = '+IntToStr(Prm.ID_Gamma));
        SQL.Add('where');
        SQL.Add('  convert(uniqueidentifier,id_record) = '''+DM.qrQuarantine.FieldByName('id_record').AsString+'''');
        SQL.Add('');
        SQL.Add('delete from chk_vozr ');
        SQL.Add('where id_user = '+IntToStr(Prm.UserID)+' and compname=host_name()');
//        SQL.SaveToFile('1234');
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

end.
