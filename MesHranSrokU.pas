unit MesHranSrokU;

interface

uses
  Forms, Controls, Grids, DBGrids, Classes, StdCtrls, Graphics, Windows,
  SysUtils;

type
  TMesHranSrokF = class(TForm)
    btFillPlaces: TButton;
    dgMesHranSrok: TDBGrid;
    btClose: TButton;
    lbBigCaption: TLabel;
    dgSrokHranWOPlases: TDBGrid;
    btAddToList: TButton;
    btRemoveFromList: TButton;
    chMoreThanZerro: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btFillPlacesClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure dgSrokHranWOPlasesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btAddToListClick(Sender: TObject);
    procedure btRemoveFromListClick(Sender: TObject);
  private
    procedure getSrokHranWOPlases(Sender: TObject);
    procedure getPreparedData;
    procedure fillTableHeaders;
  end;

const
  MIN_WIDTH = 640;
  MIN_HEIGHT = 480;

  TOP_INDENT = 12;
  LEFT_INDENT = 12;
  SPACE_INDENT = 12;
  CONNECTED_SPACE_INDENT = 4;

  srokHranNames: array[0..8] of string =     ('ArtCodeSprTov','Names',       'MakeFromSprTov','MakeFromPList','ostat',  'ArtCodeSprReg','P1',    'P2',     'P3');
  srokHranTitles: array[0..8] of string =    ('Арткод',       'Наименование','',              '',             'Остаток','',             '№ осн.','№ витр.','№ скл.');
  srokHranVisible: array[0..8] of boolean =  (true,           true,          false,           false,          true,     false,          true,    true,     true);
  srokHranWidth: array[0..8] of integer =    (60,             300,           10,              10,             50,       10,             50,      50,       50);

  prepNames: array[0..3] of string =     ('ArtCode','Names',       'USERS',       'CompName');
  prepTitles: array[0..3] of string =    ('Арткод', 'Наименование','Пользователь','Компьютер');
  prepVisible: array[0..3] of boolean =  (true,     true,          false,         false);
  prepWidth: array[0..3] of integer =    (60,       300,           10,            10);

var
  MesHranSrokF: TMesHranSrokF;

implementation

uses
  MainU, DataModuleU, ADODB, DB;

{$R *.dfm}

procedure TMesHranSrokF.FormCreate(Sender: TObject);
begin
  Caption:=MFC;
  chMoreThanZerro.Checked:=true;
  fillTableHeaders;
  getSrokHranWOPlases(self);
  getPreparedData;
  btFillPlaces.Enabled:=not DM.qrPrepStorage.IsEmpty;
  btRemoveFromList.Enabled:=btFillPlaces.Enabled;
  btAddToList.Enabled:=not DM.qrSrokHranWOPlases.IsEmpty;
end;

procedure TMesHranSrokF.FormActivate(Sender: TObject);
begin
  with MesHranSrokF do
  begin
    Constraints.MinWidth:=MIN_WIDTH;
    Constraints.MinHeight:=MIN_HEIGHT;
    if (Screen.Width > MIN_WIDTH * 2) and (Screen.Height > MIN_HEIGHT * 2) then
    begin
      ClientWidth:=trunc(Screen.Width*0.5);
      ClientHeight:=trunc(Screen.Height*0.5);
    end
    else
    begin
      ClientWidth:=trunc(Screen.Width*0.75);
      ClientHeight:=trunc(Screen.Height*0.75);
    end;
  end;
  chMoreThanZerro.OnClick:=getSrokHranWOPlases;
  Position:=poMainFormCenter;
end;

procedure TMesHranSrokF.FormResize(Sender: TObject);
begin
  lbBigCaption.Left:=trunc((ClientWidth-lbBigCaption.Width)/2);
  lbBigCaption.Top:=TOP_INDENT;
  chMoreThanZerro.Left:=ClientWidth-chMoreThanZerro.Width-LEFT_INDENT;
  chMoreThanZerro.Top:=lbBigCaption.Top+lbBigCaption.Height+SPACE_INDENT;
  dgSrokHranWOPlases.Left:=LEFT_INDENT;
  dgSrokHranWOPlases.Top:=chMoreThanZerro.Top+chMoreThanZerro.Height+SPACE_INDENT;
  dgSrokHranWOPlases.Width:=ClientWidth-dgSrokHranWOPlases.Left-LEFT_INDENT;
  dgSrokHranWOPlases.Height:=trunc((ClientHeight-dgSrokHranWOPlases.Top-btFillPlaces.Height-SPACE_INDENT*2-TOP_INDENT)*0.5);
  dgMesHranSrok.Left:=LEFT_INDENT;
  dgMesHranSrok.Top:=dgSrokHranWOPlases.Top+dgSrokHranWOPlases.Height+SPACE_INDENT;
  dgMesHranSrok.Width:=ClientWidth-dgMesHranSrok.Left-LEFT_INDENT;
  dgMesHranSrok.Height:=ClientHeight-dgMesHranSrok.Top-btFillPlaces.Height-SPACE_INDENT-TOP_INDENT;
  btFillPlaces.Left:=LEFT_INDENT;
  btFillPlaces.Top:=dgMesHranSrok.Top+dgMesHranSrok.Height+SPACE_INDENT;
  btAddToList.Left:=btFillPlaces.Left+btFillPlaces.Width+SPACE_INDENT;
  btAddToList.Top:=btFillPlaces.Top;
  btRemoveFromList.Left:=btAddToList.Left+btAddToList.Width+SPACE_INDENT;
  btRemoveFromList.Top:=btAddToList.Top;
  btClose.Left:=ClientWidth-btClose.Width-LEFT_INDENT;
  btClose.Top:=btFillPlaces.Top;
end;

procedure TMesHranSrokF.btFillPlacesClick(Sender: TObject);
var
  cr: TCursor;
begin
  cr:=Screen.Cursor;
  try
    try
      with DM.QrEx do
      begin
        SQL.Clear;
        SQL.Add('insert into');
        SQL.Add('  INFORM.dbo.SPRREG (');
        SQL.Add('    ART_CODE');
        SQL.Add('  )');
        SQL.Add('    select');
        SQL.Add('      ArtCode');
        SQL.Add('    from');
        SQL.Add('      APTEKA_NET.dbo.PrepStorage');
        SQL.Add('    where');
        SQL.Add('      not ArtCode in (');
        SQL.Add('        select ART_CODE from INFORM.dbo.SPRREG');
        SQL.Add('      )');
        SQL.Add('');
        ExecSQL;

        SQL.Clear;
        SQL.Add('delete from');
        SQL.Add('  APTEKA_NET.dbo.PrepStorage');
        SQL.Add('');
        ExecSQL;
      end;
    except
      on E:Exception do
        MainF.MessBox('Ошибка!'+#13+
          'Во время добавления товара в список произошла ошибка.'+#13+
          'Повторите попытку формирования'+#13+
          'Если ошибка будет повторяться обратитесь в IT-отдел'+#13+
          ''+#13+
          'Ошибка: '+E.Message,16);
    end;
  finally
    getSrokHranWOPlases(self);
    getPreparedData;
    btFillPlaces.Enabled:=not DM.qrPrepStorage.IsEmpty;
    btRemoveFromList.Enabled:=btFillPlaces.Enabled;
    btAddToList.Enabled:=not DM.qrSrokHranWOPlases.IsEmpty;
    Screen.Cursor:=cr;
    MainF.MessBox('Сроковые товары подготовлены!'+#13+
      'Заполните места хранения!',64);
  end;
  MesHranSrokF.Close;
end;

procedure TMesHranSrokF.btCloseClick(Sender: TObject);
begin
  MesHranSrokF.Close;
end;

procedure TMesHranSrokF.getSrokHranWOPlases(Sender: TObject);
var
  oldArtCode: integer;
  cr: TCursor;
begin
  cr:=Screen.Cursor;
  try
    Screen.Cursor:=crHourGlass;
    if DM.qrSrokHranWOPlases.Active then
      oldArtCode:=DM.qrSrokHranWOPlases.FieldByName('ArtCodeSprTov').AsInteger
    else
      oldArtCode:=0;
    with DM.qrSrokHranWOPlases do
    begin
      SQL.Clear;
      SQL.Add('select');
      SQL.Add('  s.art_code as ArtCodeSprTov, s.Names, s.MakeFrom as MakeFromSprTov, ');
      SQL.Add('  p.MakeFrom as MakeFromPList, isnull(s.ostat_,0) as ostat, ');
      SQL.Add('  sr.ART_CODE as ArtCodeSprReg, sr.P1, sr.P2, sr.P3');
      SQL.Add('from');
      SQL.Add('  APTEKA_NET.dbo.SPRTOVAR s (nolock)');
      SQL.Add('  left join APTEKA_NET.dbo.PLIST p (nolock) ');
      SQL.Add('    on p.ART_CODE = s.art_code');
      SQL.Add('  inner join INFORM.dbo.SPRREG sr (nolock) ');
      SQL.Add('    on (sr.ART_CODE = s.MakeFrom) or (sr.ART_CODE = p.MakeFrom)');
      SQL.Add('where');
      SQL.Add('  s.Names like ''%[0-9][0-9].[0-9][0-9]%''');
      SQL.Add('  and s.Names like ''%б/уп%''');
      SQL.Add('  and (sr.P1 is null and sr.P2 is null and sr.P3 is null)');
      if chMoreThanZerro.Checked then
        SQL.Add('  and s.ostat_ > 0');
      SQL.Add('');
      Open;
    end;
    if oldArtCode=0 then
      DM.qrSrokHranWOPlases.First
    else
      DM.qrSrokHranWOPlases.Locate('ArtCodeSprTov',oldArtCode,[]);
  finally
    Screen.Cursor:=cr;
  end;
end;

procedure TMesHranSrokF.dgSrokHranWOPlasesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Sender as TDBGrid).DataSource.DataSet.FieldByName('ostat').AsInteger = 0 then
  begin
    with (Sender as TDBGrid).Canvas do
    begin
  	  Brush.Color:=clRed;
      Font.Color:=clWindow;
      Font.Style:=[fsBold];
    end;
  end;

  (Sender as TDBGrid).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TMesHranSrokF.getPreparedData;
var
  cr: TCursor;
begin
  cr:=Screen.Cursor;
  try
    Screen.Cursor:=crHourGlass;
    with DM.QrEx do
    begin
      try
        SQL.Clear;
        SQL.Add('select top 0 * from APTEKA_NET.dbo.PrepStorage');
        Open;
      except
        try
          SQL.Clear;
          SQL.Add('use APTEKA_NET');
          SQL.Add('');
          SQL.Add('create table ');
          SQL.Add('  dbo.PrepStorage (');
          SQL.Add('    ArtCode int not null, ');
          SQL.Add('    id_gamma int null, ');
          SQL.Add('    CompName varchar(50) null ');
          SQL.Add('  )');
          SQL.Add('');
          ExecSQL;
        except
          on E:Exception do
            MainF.MessBox('Ошибка!'+#13+
              'При попытке зарегистрировать таблицу произошла ошибка.'+#13+
              'Повторите попытку!'+#13+
              'Если ошибка будет повторяться обратитесь в IT-отдел.'+#13+
              ''+#13+
              'Ошибка: '+E.Message,16);
        end;
      end;
    end;
  finally;
    with DM.qrPrepStorage do
    begin
      SQL.Clear;
      SQL.Add('select ');
      SQL.Add('  ps.ArtCode, st.Names, su.USERS, ps.CompName');
      SQL.Add('from');
      SQL.Add('  APTEKA_NET.dbo.PrepStorage ps');
      SQL.Add('  left join APTEKA_NET.dbo.SPRUSER su (nolock) ');
      SQL.Add('    on su.id_gamma = ps.id_gamma');
      SQL.Add('  inner join APTEKA_NET.dbo.SPRTOVAR st (nolock) ');
      SQL.Add('    on st.art_code=ps.ArtCode');
      SQL.Add('');
      Open;
    end;
    Screen.Cursor:=cr;
  end;
end;

procedure TMesHranSrokF.btAddToListClick(Sender: TObject);
var
  cr: TCursor;
begin
  cr:=Screen.Cursor;
  try
    try
      with DM.QrEx do
      begin
        SQL.Clear;
        SQL.Add('select');
        SQL.Add('  ArtCode ');
        SQL.Add('from ');
        SQL.Add('  APTEKA_NET.dbo.PrepStorage');
        SQL.Add('where');
        SQL.Add('  ArtCode = '+DM.qrSrokHranWOPlases.FieldByName('ArtCodeSprTov').AsString);
        SQL.Add('--  and ArtCode in (select ART_CODE from INFORM.dbo.SPRREG)');
        SQL.Add('');
        Open;

        if IsEmpty then
        begin
          SQL.Clear;
          SQL.Add('insert into ');
          SQL.Add('  APTEKA_NET.dbo.PrepStorage (');
          SQL.Add('    ArtCode, id_gamma, CompName');
          SQL.Add('  ) values (');
          SQL.Add('    '+DM.qrSrokHranWOPlases.FieldByName('ArtCodeSprTov').AsString+', '+IntToStr(Prm.ID_Gamma)+', host_name()');
          SQL.Add('  )');
          SQL.Add('');
          ExecSQL;
        end
        else
          MainF.MessBox('Товар уже был добавлен',64);
      end;
    except
      on E:Exception do
        MainF.MessBox('Ошибка!'+#13+
          'При подготовке данных возникла ошибк!'+#13+
          'Повторите попытку'+#13+
          'Если ошибка будет повторяться обратитесь в IT-отдел.'+#13+
          ''+#13+
          'Ошибка: '+E.Message,16);
    end;
  finally
    getPreparedData;
    btFillPlaces.Enabled:=not DM.qrPrepStorage.IsEmpty;
    btRemoveFromList.Enabled:=btFillPlaces.Enabled;
    btAddToList.Enabled:=not DM.qrSrokHranWOPlases.IsEmpty;
    Screen.Cursor:=cr;
  end;
end;

procedure TMesHranSrokF.btRemoveFromListClick(Sender: TObject);
var
  cr: TCursor;
begin
  cr:=Screen.Cursor;
  try
    try
      with DM.QrEx do
      begin
        SQL.Clear;
        SQL.Add('delete from');
        SQL.Add('  APTEKA_NET.dbo.PrepStorage');
        SQL.Add('where');
        SQL.Add('  ArtCode = '+DM.qrPrepStorage.FieldByName('ArtCode').AsString);
        SQL.Add('');
        ExecSQL;
      end;
    except
      on E:Exception do
        MainF.MessBox('Ошибка!'+#13+
          'При удалении подготовленой записи возникла ошибка.'+#13+
          'Попробуйте повторить удаление строки.'+#13+
          'Если ошибка будет повторяться обратитесь в IT-отдел.'+#13+
          ''+#13+
          'Ошибка: '+E.Message,16);
    end;
  finally
    getPreparedData;
    btFillPlaces.Enabled:=not DM.qrPrepStorage.IsEmpty;
    btRemoveFromList.Enabled:=btFillPlaces.Enabled;
    btAddToList.Enabled:=not DM.qrSrokHranWOPlases.IsEmpty;
    Screen.Cursor:=cr;
  end;
end;

procedure TMesHranSrokF.fillTableHeaders;
var
  i: integer;
begin
  dgSrokHranWOPlases.Columns.Clear;
  for i:=0 to length(srokHranNames)-1 do
  begin
    dgSrokHranWOPlases.Columns.Add;
    dgSrokHranWOPlases.Columns[i].FieldName:=srokHranNames[i];
    dgSrokHranWOPlases.Columns[i].Title.Caption:=srokHranTitles[i];
    dgSrokHranWOPlases.Columns[i].Visible:=srokHranVisible[i];
    dgSrokHranWOPlases.Columns[i].Width:=srokHranWidth[i];
  end;

  dgMesHranSrok.Columns.Clear;
  for i:=0 to length(prepNames)-1 do
  begin
    dgMesHranSrok.Columns.Add;
    dgMesHranSrok.Columns[i].FieldName:=prepNames[i];
    dgMesHranSrok.Columns[i].Title.Caption:=prepTitles[i];
    dgMesHranSrok.Columns[i].Visible:=prepVisible[i];
    dgMesHranSrok.Columns[i].Width:=prepWidth[i];
  end;
end;

end.
