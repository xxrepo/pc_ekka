unit ReturnToProviderU;

interface

uses
  Forms, DB, ADODB, StdCtrls, Grids, DBGrids, Controls, Classes, ExtCtrls,
  Graphics, SysUtils, Windows;

type
  TRemainder = record
    kod_name: integer; //код партии
    art_code: integer; //арткод товара
    kol: double; //количество товара к возврату
    ostat: double; //остаток товара в партии
  end;

type
  TReturnToProviderF = class(TForm)
    pnlNakl: TPanel;
    lbInternalOrder: TLabel;
    lbInternalOrderNumb: TLabel;
    lbProvider: TLabel;
    lbProviderOrderN: TLabel;
    lbInternalOrderDate: TLabel;
    lbProviderOrderD: TLabel;
    lbIntern_NN_Nakl: TLabel;
    lbIntern_Date_Nakl: TLabel;
    lbProviderName: TLabel;
    lbProviderOrderNumb: TLabel;
    lbProviderOrderDate: TLabel;
    lbProviderInfo: TLabel;
    pnlInternalNakl: TPanel;
    pnlPreparedOrder: TPanel;
    dgInternalNakl: TDBGrid;
    btAddToReturn: TButton;
    btCancelReturn: TButton;
    btClearReturn: TButton;
    btUpdateReturn: TButton;
    dgPreparedOrder: TDBGrid;
    btCreateOrder: TButton;
    btCreateClaim: TButton;
    btClose: TButton;
    dsPreparedOrder: TDataSource;
    qPreparedOrder: TADOQuery;
    dsInternalNakl: TDataSource;
    qInternalNakl: TADOQuery;
    lbWarning: TLabel;
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btAddToReturnClick(Sender: TObject);
    procedure btCancelReturnClick(Sender: TObject);
    procedure btClearReturnClick(Sender: TObject);
    procedure btUpdateReturnClick(Sender: TObject);
    procedure btCreateOrderClick(Sender: TObject);
    procedure btCreateClaimClick(Sender: TObject);
    procedure dgInternalNaklTitleClick(Column: TColumn);
    procedure dgInternalNaklKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dgInternalNaklKeyPress(Sender: TObject; var Key: Char);
  private
    FOrder: string;
    FReturnType: integer;
    FIsChekOpened: boolean;
    FIsOrderOpened: boolean;
    FIDDoc: integer;


    ReminderBefore, ReminderAfter: array of TRemainder;
    function GetRemainderByPart(arr_elem: integer): TRemainder;
    function CompareRemainders(Before, After: array of TRemainder): boolean;
  public
//    ord: string;
    procedure OpenNakl;
    procedure OpenCheck;

    property Order: string read FOrder write FOrder;
    property ReturnType: integer read FReturnType write FReturnType; // 0 - возврат поставщику по накладной
                                                                     // 1 - позврат поставщику по карантину
    property IsChekOpened: boolean read FIsChekOpened write FIsChekOpened;
    property IsOrderOpened: boolean read FIsOrderOpened write FIsOrderOpened;
    property IDDoc: integer read FIDDoc write FIDDoc;
  end;

var
  ReturnToProviderF: TReturnToProviderF;
  fY: string;

const
  MIN_FORM_WIDTH = 640;
  MIN_FORM_HEIGHT=480;

  LEFT_INDENT = 12;
  TOP_INDENT = 12;
  SPACE_INDENT = 12;
  CONNECTED_SPACE_INDENT = 4;

  DEFAULT_ORDER_FIELD = 'names';

  FC_FIELD_TITLE_COLOR = clWindowText;
  FC_ORDERED_FIELD_TITLE_COLOR = clRed;

  INTERNAL_ORDER_CAPTION: array[0..9] of string = ('Код',     'Наименование','Кол-во','Остаток','Кол. скан.','Цена','Закупка',  'НДС','Серия',    'Срок годн.');
  INTERNAL_ORDER_FIELDS: array[0..9] of string =  ('art_code','names',       'kol',   'ostat',  'isscan',    'cena','CenaZakup','nds','NumSeriya','SrokGodn');
  INTERNAL_ORDER_WIDTH: array[0..9] of integer =  (65,        0,             45,      55,       65,          50,    60,         40,   65,         65);

  PREPARE_ORDER_CAPTION: array[0..9] of string = ('Арткод',  'Наименование','Кол-во','Цена','Закуп.',    'НДС','Примечание','Пр.возр.','Серия',    'Срок годн.');
  PREPARE_ORDER_FIELDS: array[0..9] of string =  ('Art_code','names',       'kol',   'cena','cena_zakup','nds','vzdescr',   'pr_vz',   'NumSeriya','SrokGodn');
  PREPARE_ORDER_WIDTH: array[0..9] of integer =  (50,        0,             45,      40,    45,          30,   200,         75,        55,         65);

  T_WARNING_NOTIFICATION = 'Внимание!'+#10+
                           'В верхней таблице отображаются позиции накладной остаток по которым не нулевой.'+#10+
                           'Если остаток нулевой позиция из накладной отображаться не будет!';

implementation

uses
  DataModuleU, ViewNaklU, AddToReturnU, MainU;

{$R *.dfm}

procedure TReturnToProviderF.FormCreate(Sender: TObject);
begin
  Order:=DEFAULT_ORDER_FIELD;
  ReturnType:=0; //возврат поставщику по накладной
  IsChekOpened:=false;
  IsOrderOpened:=false;
  pnlNakl.Caption:='';
  pnlInternalNakl.Caption:='';
  pnlPreparedOrder.Caption:='';
  Caption:=MFC;
  IDDoc:=0;
  lbWarning.Caption:=T_WARNING_NOTIFICATION;
end;

procedure TReturnToProviderF.FormActivate(Sender: TObject);
begin
  with ReturnToProviderF do
  begin
    Constraints.MinWidth:=MIN_FORM_WIDTH;
    Constraints.MinHeight:=MIN_FORM_HEIGHT;
    ClientWidth:=trunc(Screen.Width*0.75);
    ClientHeight:=trunc(Screen.Height*0.75);
    Position:=poMainFormCenter;
  end;
  case ReturnType of
    0: // 0 - возврат поставщику по накладной
      begin
        OpenCheck;
        btCreateOrder.Enabled:=false;
        btCreateClaim.Enabled:=false;
        OpenNakl;
      end;
    1: // 1 - позврат поставщику по карантину
      begin
        ReturnToProviderF.Close;
      end;
  end;
  if not ReturnToProviderF.qPreparedOrder.IsEmpty then
  begin
    btCreateOrder.Enabled:=true;
    btCreateClaim.Enabled:=true;
  end
  else
  begin
    btCreateOrder.Enabled:=false;
    btCreateClaim.Enabled:=false;
  end;
end;

procedure TReturnToProviderF.FormResize(Sender: TObject);
var
  i: integer;
  FieldsWidth: integer;
begin
  with ReturnToProviderF do
  begin
    pnlNakl.Left:=LEFT_INDENT;
    pnlNakl.Top:=TOP_INDENT;
    pnlNakl.Width:=ClientWidth-pnlNakl.Left-LEFT_INDENT;
    lbInternalOrder.Left:=LEFT_INDENT;
    lbInternalOrder.Top:=TOP_INDENT;
    lbInternalOrderNumb.Left:=LEFT_INDENT;
    lbInternalOrderNumb.Top:=lbInternalOrder.Top+lbInternalOrder.Height+CONNECTED_SPACE_INDENT;
    lbIntern_NN_Nakl.Left:=lbInternalOrderNumb.Left+lbInternalOrderNumb.Width+CONNECTED_SPACE_INDENT;
    lbIntern_NN_Nakl.Top:=lbInternalOrderNumb.Top;
    lbIntern_NN_Nakl.AutoSize:=false;
    lbIntern_NN_Nakl.Width:=trunc(pnlNakl.Width/2)-lbIntern_NN_Nakl.Left;
    lbInternalOrderDate.Left:=lbIntern_NN_Nakl.Left+lbIntern_NN_Nakl.Width+CONNECTED_SPACE_INDENT;
    lbInternalOrderDate.Top:=lbInternalOrderNumb.Top;
    lbIntern_Date_Nakl.Left:=lbInternalOrderDate.Left+lbInternalOrderDate.Width+CONNECTED_SPACE_INDENT;
    lbIntern_Date_Nakl.Top:=lbInternalOrderNumb.Top;
    lbIntern_Date_Nakl.AutoSize:=False;
    lbIntern_Date_Nakl.Width:=pnlNakl.Width-lbIntern_Date_Nakl.Left-LEFT_INDENT;
    lbProviderInfo.Left:=LEFT_INDENT;
    lbProviderInfo.Top:=lbIntern_Date_Nakl.Top+lbIntern_Date_Nakl.Height+SPACE_INDENT;
    lbProvider.Left:=LEFT_INDENT;
    lbProvider.Top:=lbProviderInfo.Top+lbProviderInfo.Height+CONNECTED_SPACE_INDENT;
    lbProviderName.Left:=lbProvider.Left+lbProvider.Width+CONNECTED_SPACE_INDENT;
    lbProviderName.Top:=lbProvider.Top;
    lbProviderName.AutoSize:=false;
    lbProviderName.Width:=pnlNakl.Width-lbProviderName.Left-LEFT_INDENT;
    lbProviderOrderN.Left:=LEFT_INDENT;
    lbProviderOrderN.Top:=lbProvider.Top+lbProvider.Height+CONNECTED_SPACE_INDENT;
    lbProviderOrderNumb.Left:=lbProviderOrderN.Left+lbProviderOrderN.Width+CONNECTED_SPACE_INDENT;
    lbProviderOrderNumb.Top:=lbProviderOrderN.Top;
    lbProviderOrderNumb.AutoSize:=false;
    lbProviderOrderNumb.Width:=trunc(pnlNakl.Width/2)-lbProviderOrderNumb.Left;
    lbProviderOrderD.Left:=lbProviderOrderNumb.Left+lbProviderOrderNumb.Width+CONNECTED_SPACE_INDENT;
    lbProviderOrderD.Top:=lbProviderOrderN.Top;
    lbProviderOrderDate.Left:=lbProviderOrderD.Left+lbProviderOrderD.Width+CONNECTED_SPACE_INDENT;
    lbProviderOrderDate.Top:=lbProviderOrderN.Top;
    lbProviderOrderDate.AutoSize:=False;
    lbProviderOrderDate.Width:=pnlNakl.Width-lbProviderOrderDate.Left-LEFT_INDENT;

    lbWarning.Left:=LEFT_INDENT;
    lbWarning.Top:=lbProviderOrderDate.Top+lbProviderOrderDate.Height+SPACE_INDENT;
    lbWarning.AutoSize:=true;
    lbWarning.AutoSize:=false;
    lbWarning.Width:=pnlNakl.Width-lbWarning.Left-LEFT_INDENT;

    pnlNakl.Height:=lbWarning.Top+lbWarning.Height+TOP_INDENT;

    pnlInternalNakl.Left:=LEFT_INDENT;
    pnlInternalNakl.Top:=pnlNakl.Top+pnlNakl.Height+SPACE_INDENT;
    pnlInternalNakl.Width:=ClientWidth-pnlInternalNakl.Left-LEFT_INDENT;
    pnlInternalNakl.Height:=trunc((ClientHeight-pnlInternalNakl.Top)/2);
    dgInternalNakl.Left:=LEFT_INDENT;
    dgInternalNakl.Top:=TOP_INDENT;
    dgInternalNakl.Width:=pnlInternalNakl.Width-dgInternalNakl.Left-LEFT_INDENT;
    dgInternalNakl.Height:=pnlInternalNakl.Height-dgInternalNakl.Top-btUpdateReturn.Height-SPACE_INDENT-TOP_INDENT;
    btAddToReturn.Left:=LEFT_INDENT;
    btAddToReturn.Top:=pnlInternalNakl.Height-btAddToReturn.Height-TOP_INDENT;
    btCancelReturn.Left:=btAddToReturn.Left+btAddToReturn.Width+SPACE_INDENT;
    btCancelReturn.Top:=btAddToReturn.Top;
    btClearReturn.Left:=btCancelReturn.Left+btCancelReturn.Width+SPACE_INDENT;
    btClearReturn.Top:=btCancelReturn.Top;
    btUpdateReturn.Left:=btClearReturn.Left+btClearReturn.Width+SPACE_INDENT;
    btUpdateReturn.Top:=btClearReturn.Top;

    pnlPreparedOrder.Left:=LEFT_INDENT;
    pnlPreparedOrder.Top:=pnlInternalNakl.Top+pnlInternalNakl.Height+SPACE_INDENT;
    pnlPreparedOrder.Width:=ClientWidth-pnlPreparedOrder.Left-LEFT_INDENT;
    pnlPreparedOrder.Height:=ClientHeight-pnlPreparedOrder.Top-TOP_INDENT;
    dgPreparedOrder.Left:=LEFT_INDENT;
    dgPreparedOrder.Top:=TOP_INDENT;
    dgPreparedOrder.Width:=pnlPreparedOrder.Width-dgPreparedOrder.Left-LEFT_INDENT;
    dgPreparedOrder.Height:=pnlPreparedOrder.Height-dgPreparedOrder.Top-btClose.Height-SPACE_INDENT-TOP_INDENT;
    btCreateOrder.Left:=LEFT_INDENT;
    btCreateOrder.Top:=dgPreparedOrder.Top+dgPreparedOrder.Height+SPACE_INDENT;
    btCreateClaim.Left:=btCreateOrder.Left+btCreateOrder.Width+SPACE_INDENT;
    btCreateClaim.Top:=btCreateOrder.Top;
    btClose.Left:=pnlPreparedOrder.Width-btClose.Width-LEFT_INDENT;
    btClose.Top:=btCreateClaim.Top;

    FieldsWidth:=0;
    for i:=0 to length(PREPARE_ORDER_WIDTH)-1 do
      FieldsWidth:=FieldsWidth+PREPARE_ORDER_WIDTH[i];
    if IsChekOpened then
      for i:=0 to dgPreparedOrder.Columns.Count-1 do
        if PREPARE_ORDER_WIDTH[i] <= 0 then
          dgPreparedOrder.Columns[i].Width:=dgPreparedOrder.Width-FieldsWidth-45;

    FieldsWidth:=0;
    for i:=0 to length(INTERNAL_ORDER_WIDTH)-1 do
      FieldsWidth:=FieldsWidth+INTERNAL_ORDER_WIDTH[i];
    if IsOrderOpened then
      for i:=0 to dgInternalNakl.Columns.Count-1 do
        if INTERNAL_ORDER_WIDTH[i] <= 0 then
          dgInternalNakl.Columns[i].Width:=dgInternalNakl.Width-FieldsWidth-45;
  end;
end;

procedure TReturnToProviderF.OpenCheck;
var
  i: integer;
  count_vozr_all, count_vozr_curr: integer;
begin
  IsChekOpened:=false;
  dgPreparedOrder.Columns.Clear;
  for i:=0 to length(PREPARE_ORDER_CAPTION)-1 do
  begin
    dgPreparedOrder.Columns.Add;
    dgPreparedOrder.Columns[i].Width:=PREPARE_ORDER_WIDTH[i];
    dgPreparedOrder.Columns[i].FieldName:=PREPARE_ORDER_FIELDS[i];
    dgPreparedOrder.Columns[i].Title.Caption:=PREPARE_ORDER_CAPTION[i];
    dgPreparedOrder.Columns[i].Title.Font.Style:=[fsBold];
    dgPreparedOrder.Columns[i].Title.Font.Color:=FC_FIELD_TITLE_COLOR;
  end;
  IsChekOpened:=true;
  FormResize(nil);

  with TADOQuery.Create(self) do
  begin
    try
      Connection:=DM.ADOCo;
      Close;
      SQL.Clear;
      SQL.Add('select count(art_code) as count_vozr_all from chk_vozr (nolock)');
      SQL.Add('');
      Open;
      count_vozr_all:=FieldByName('count_vozr_all').AsInteger;
      Close;
      SQL.Clear;
      SQL.Add('select count(art_code) as count_vozr_curr from chk_vozr (nolock) where id_user = '+IntToStr(Prm.UserID)+'and compname = host_name()');
      SQL.Add('');
      Open;
      count_vozr_curr:=FieldByName('count_vozr_curr').AsInteger;
      if count_vozr_all>count_vozr_curr then
        if MainF.MessBox('В таблице возвратов есть товары '+#13+
                         'подготовленные к возврату другим пользователем.'+#13+
                         'Убедитесь, что другие пользователи '+#13+
                         'не подготавливают товары к возврату.'+#13+
                         'Если Вы уверены, что другие пользователи '+#13+
                         'не подготавливают возврат, '+#13+
                         'нажмите "ДА" для обновления и отображения'+#13+
                         'подготовленных товаров.'+#13+
                         'За помощью обратитесь в IT-отдел',36)=ID_YES then
        begin
          Close;
          SQL.Clear;
          SQL.Add('update chk_vozr set id_user = '+IntToStr(Prm.UserID)+', compname = host_name()');
          SQL.Add('');
          ExecSQL;
        end;
    finally
      Free;
    end;
  end;

  qPreparedOrder.Close;
  qPreparedOrder.SQL.Clear;
  qPreparedOrder.SQL.Add('declare @pid_user int');
  qPreparedOrder.SQL.Add('set @pid_user = :pid_user');
  qPreparedOrder.SQL.Add('');
  qPreparedOrder.SQL.Add('select');
  qPreparedOrder.SQL.Add('  *');
  qPreparedOrder.SQL.Add('from');
  qPreparedOrder.SQL.Add('  chk_vozr (nolock)');
  qPreparedOrder.SQL.Add('where');
  qPreparedOrder.SQL.Add('  id_user = @pid_user');
  qPreparedOrder.SQL.Add('  and compname = host_name()');
  qPreparedOrder.SQL.Add('');
  qPreparedOrder.Parameters.Clear;
  qPreparedOrder.Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,Prm.UserID);
  qPreparedOrder.Open;
  if not qPreparedOrder.IsEmpty then
  begin
    btCreateOrder.Enabled:=true;
    btCreateClaim.Enabled:=true;
  end
  else
  begin
    btCreateOrder.Enabled:=false;
    btCreateClaim.Enabled:=false;
  end;
end;

procedure TReturnToProviderF.OpenNakl;
var
  i: integer;
begin
  IsOrderOpened:=false;
  with ReturnToProviderF do
  begin
    dgInternalNakl.Columns.Clear;
    for i:=0 to length(INTERNAL_ORDER_CAPTION)-1 do
    begin
      dgInternalNakl.Columns.Add;
      dgInternalNakl.Columns[i].Width:=INTERNAL_ORDER_WIDTH[i];
      dgInternalNakl.Columns[i].FieldName:=INTERNAL_ORDER_FIELDS[i];
      dgInternalNakl.Columns[i].Title.Caption:=INTERNAL_ORDER_CAPTION[i];
      dgInternalNakl.Columns[i].Title.Font.Style:=[fsBold];
      dgPreparedOrder.Columns[i].Title.Font.Color:=FC_FIELD_TITLE_COLOR;
    end;
    IsOrderOpened:=true;
    FormResize(nil);

    with qInternalNakl do
    begin
      Close;
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
      SQL.Add('  and ostat > 0');
      SQL.Add('group by');
      SQL.Add('  j.iddoc, j.F_NDS, j.Type_Tov, j.ID_USER, j.SKLAD, j.id_postav, j.nn_prih,');
      SQL.Add('  j.dt_prih, j.type_nakl, j.reoc, j.obl, j.date_nakl, j.nn_nakl, r.SHTRIH,');
      SQL.Add('  r.pr_vz_post, r.ISSCAN, s.NAMES, s.ART_CODE, s.ART_NAME, p.koef, i.numseriya,');
      SQL.Add('  i.srokgodn');
      SQL.Add('order by '+Order);
      SQL.Add('');
      Parameters.Clear;
      Parameters.CreateParameter('iddoc',ftInteger,pdInput,10,IDDoc);
      Open;
    end;
  end;
end;

procedure TReturnToProviderF.btAddToReturnClick(Sender: TObject);
var
  count_available: integer;
  count_check: integer;
begin
  count_available:=0;
  count_check:=0;
  try
    AddToReturnF:=TAddToReturnF.Create(self);
    try
      //проверить, есть ли уже запись в чеке с этим товаром
      with TADOQuery.Create(self) do
      begin
        try
          Connection:=DM.ADOCo;
          SQL.Clear;
          SQL.Add('declare @art_code int');
          SQL.Add('set @art_code = :art_code');
          SQL.Add('declare @pid_user int');
          SQL.Add('set @pid_user = :pid_user');
          SQL.Add('');
          SQL.Add('select');
          SQL.Add('  *');
          SQL.Add('from');
          SQL.Add('  chk_vozr (nolock)');
          SQL.Add('where');
          SQL.Add('  art_code = @art_code');
          SQL.Add('  and id_user = @pid_user');
          SQL.Add('  and compname=host_name()');
          SQL.Add('');
          Parameters.Clear;
          Parameters.CreateParameter('art_code', ftInteger, pdInputOutput, 10, ReturnToProviderF.qInternalNakl.FieldByName('art_code').AsInteger);
          Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,Prm.UserID);
          Open;

          if not IsEmpty then count_check:=FieldByName('KOL').AsInteger;  //количество товара подготовленого к возврату поставщику kod_name в chek
          if not ReturnToProviderF.qInternalNakl.IsEmpty then count_available:=ReturnToProviderF.qInternalNakl.FieldByName('ostat').AsInteger;  //количество позиций по kod_name в rtovar
        finally
          Free;
        end;
      end;
      //показать окно с максимальным количеством выбраного товара к возврату
      AddToReturnF.Label2.Visible:=True;
      AddToReturnF.Label1.Visible:=True;
      AddToReturnF.edKol.Visible:=True;
      AddToReturnF.Label4.Visible:=true;
      AddToReturnF.ComboBox1.Visible:=true;
      AddToReturnF.Label3.Enabled:=true;
      AddToReturnF.Edit1.Enabled:=true;
      AddToReturnF.Edit1.Text:='';

      with TADOQuery.Create(self) do
      begin
        try
          Connection:=DM.ADOCo;
          SQL.Clear;
          SQL.Add('select ');
          SQL.Add('  *');
          SQL.Add('from');
          SQL.Add('  SPRPRVOZR (nolock)');
          SQL.Add('where');
          SQL.Add('  vis_vz_post=1');
          SQL.Add('order by');
          SQL.Add('  descr');
          SQL.Add('');
          Open;

          AddToReturnF.ComboBox1.Items.Clear;
          AddToReturnF.ComboBox1.Text:='';
          AddToReturnF.ComboBox1.Style:=csDropDownList;
          AddToReturnF.ComboBox2.Items.Clear;
          AddToReturnF.ComboBox2.Text:='';
          while not Eof do
          begin
            AddToReturnF.ComboBox1.Items.Add(FieldByName('descr').AsString);
            AddToReturnF.ComboBox2.Items.Add(FieldByName('id').AsString);
            Next;
          end;
        finally
          Free;
        end;
      end;
      AddToReturnF.ComboBox1.ItemIndex:=-1;
      AddToReturnF.Caption:='Количество';
      AddToReturnF.Position:=poMainFormCenter;
      AddToReturnF.Label2.Caption:=ReturnToProviderF.qInternalNakl.FieldByName('names').AsString;
      if count_available-count_check > 0 then AddToReturnF.edKol.Text:=IntToStr(count_available-count_check) else exit;

      AddToReturnF.ShowModal;
    finally
      AddToReturnF.Free;
    end;
  except
    on E:Exception do
      MainF.MessBox('При подготовке товара к позврату произошла ошибка '+E.Message,16);
  end;
  OpenCheck;
end;

procedure TReturnToProviderF.btCancelReturnClick(Sender: TObject);
begin
  if not qPreparedOrder.IsEmpty then
  begin
    with TADOQuery.Create(self) do
    begin
      try
        Connection:=DM.ADOCo;
        SQL.Clear;
        SQL.Add('declare @KOD_NAME int');
        SQL.Add('set @KOD_NAME = :KOD_NAME');
        SQL.Add('declare @pid_user int');
        SQL.Add('set @pid_user = :pid_user');
        SQL.Add('');
        SQL.Add('delete from');
        SQL.Add('  chk_vozr ');
        SQL.Add('where');
        SQL.Add('  KOD_NAME = @KOD_NAME');
        SQL.Add('  and id_user = @pid_user ');
        SQL.Add('  and compname=host_name()');
        SQL.Add('');
        Parameters.Clear;
        Parameters.CreateParameter('KOD_NAME', ftInteger, pdInputOutput, 10, ReturnToProviderF.qPreparedOrder.FieldByName('KOD_NAME').AsInteger);
        Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,Prm.UserID);
        ExecSQL;
      finally
        Free;
      end;
    end;
  end;
  OpenCheck;
end;

procedure TReturnToProviderF.btClearReturnClick(Sender: TObject);
(*
var
  id_user: integer;
*)
begin
  if qPreparedOrder.IsEmpty then exit;
  with TADOQuery.Create(self) do
  begin
    try
      Connection:=DM.ADOCo;
      SQL.Clear;
      SQL.Add('declare @pid_user int');
      SQL.Add('set @pid_user = :pid_user');
      SQL.Add('');
      SQL.Add('delete from');
      SQL.Add('  chk_vozr');
      SQL.Add('where');
      SQL.Add('  id_user = @pid_user');
      SQL.Add('  and compname=host_name()');
      SQL.Add('');
      Parameters.Clear;
      Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,Prm.UserID);
      ExecSQL;
    finally
      Free;
    end;
  end;
  OpenCheck;
end;

procedure TReturnToProviderF.btUpdateReturnClick(Sender: TObject);
begin
  OpenCheck;
end;

procedure TReturnToProviderF.btCreateOrderClick(Sender: TObject);
var
  psw: string;
  i: integer;
begin
  psw:='';
  with TADOQuery.Create(self) do
  begin
    try
      Connection:=DM.ADOCo;
      SQL.Clear;
      SQL.Add('select passw,dtend from sprprvozr where id=27');
      Open;
      if FieldByName('dtend').Value>date() then psw:=FieldByName('passw').Value;
      if Not MainF.CheckPassword(psw) then Exit;
    finally
      Free;
    end;
  end;
  if (qPreparedOrder.Active)and(qPreparedOrder.RecordCount<=0) then exit;

  if qPreparedOrder.RecordCount < 2 then
  begin
    SetLength(ReminderBefore,qPreparedOrder.RecordCount+1);
    SetLength(ReminderAfter,qPreparedOrder.RecordCount+1);
  end
  else
  begin
    SetLength(ReminderBefore,qPreparedOrder.RecordCount);
    SetLength(ReminderAfter,qPreparedOrder.RecordCount);
  end;

  i:=0;
  qPreparedOrder.First;
  while not qPreparedOrder.Eof do
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
    qPreparedOrder.Next;
  end;

  try
    try
      with TADOQuery.Create(self) do
      begin
        try
          Connection:=DM.ADOCo;
          SQL.Clear;
          SQL.Add('exec spY_WriteVozvrat @pid_user = ' + IntToStr(Prm.UserID) +
                  ', @dat = ' + ''''+FormatDateTime('YYYY-MM-DD', Date()) +
                  ''', @priznak = 27 ');
          ExecSQL;
        finally
          Free;
        end;
      end;
    except
      on E:Exception do
        raise Exception.Create('Ошибка при формировании возвратной накладной '+E.Message);
    end;

    i:=0;
    qPreparedOrder.First;
    while not qPreparedOrder.Eof do
    begin
      try
        ReminderAfter[i]:=GetRemainderByPart(i);
      except
        on E:Exception do
          raise Exception.Create('Ошибка при формировании возвратной накладной '+E.Message);
      end;
      inc(i);
      qPreparedOrder.Next;
    end;

    if not CompareRemainders(ReminderBefore,ReminderAfter) then
    begin
      raise Exception.Create('Убедитесь, что все товары к возврату подготовлены '+#13+'и повторите формирование возвратной накладной!');
      ReturnToProviderF.Close;
      exit;
    end;

    with ReturnToProviderF do
    begin
      with TADOQuery.Create(self) do
      begin
        try
          Connection:=DM.ADOCo;
          SQL.Clear;
          SQL.Add('declare @pid_user int');
          SQL.Add('set @pid_user = :pid_user');
          SQL.Add('');
          SQL.Add('delete from');
          SQL.Add('  chk_vozr ');
          SQL.Add('where');
          SQL.Add('  id_user = @pid_user');
          SQL.Add('  and compname=host_name()');
          SQL.Add('');
          Parameters.Clear;
          Parameters.CreateParameter('pid_user',ftInteger,pdInput,10,Prm.UserID);
          ExecSQL;
        finally
          Free;
        end;
      end;

      OpenCheck;
    end;
    MainF.MessBox('Накладная на возврат поставщику сформирована.',64);
    ReturnToProviderF.Close;
  except
    on E:Exception do
      MainF.MessBox('При формировании возвратной накладной произошла ошибка.'+#13+
                    'Вероятнее все Вы пытаетесь вернуть товар с нулевым остатком.'+#13+
                    'Если возвращаемый товар есть на складе, но при формировании возвратной накладной происходит ошибка'+#13+
                    'обратитесь в отдел закупки!'+#13+
                    'Ошибка: '+E.Message,16);
  end;
end;

procedure TReturnToProviderF.btCreateClaimClick(Sender: TObject);
begin
  if Not MainF.CheckPassword(MainF.GetPasswRep) then Exit;
  if (qPreparedOrder.Active)and(qPreparedOrder.IsEmpty) then exit;

  try
    try
      with TADOQuery.Create(self) do
      begin
        try
          Connection:=DM.ADOCo;
          SQL.Clear;
          SQL.Add('insert into Claims (');
          SQL.Add('  record_id, claime_date, Apotheka, ');
          SQL.Add('  id_postav, nn_prih, dt_prih, id_part8, kod_name, art_code,');
          SQL.Add('  names, art_name, kol, cena, cena_zakup, pr_vz, VzDescr,');
          SQL.Add('  NumSeriya, SrokGodn, CompName, ID_Gamma, F_NDS)');
          SQL.Add('');
          SQL.Add('  select');
          SQL.Add('    newid(),   getdate(),   '+IntToStr(Prm.AptekaID)+', ');
          SQL.Add('    id_postav, nn_prih, dt_prih, id_part8, KOD_NAME, ART_CODE,');
          SQL.Add('    NAMES, ART_NAME, KOL, CENA, cena_zakup, pr_vz, VzDescr, ');
          SQL.Add('    NumSeriya, SrokGodn, host_name(), '+IntToStr(Prm.ID_Gamma)+', F_NDS');
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
          SQL.Add('');
          ExecSQL;
        finally
          Free;
        end;
      end;
      OpenCheck;
    finally
      MainF.MessBox('Претензия поставщику сформирована!',64)
    end;
  except
    on E:Exception do MainF.MessBox('Во время формирования претензии возникла ошибка: '+E.Message, 16);
  end;
end;

procedure TReturnToProviderF.btCloseClick(Sender: TObject);
begin
  ReturnToProviderF.Close;
end;

function TReturnToProviderF.GetRemainderByPart(arr_elem: integer): TRemainder;
var
  rec_count: integer;
  res: array of TRemainder;
  i: Integer;
begin
  with TADOQuery.Create(self) do
  begin
    try
      Connection:=DM.ADOCo;
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

      Last;
      rec_count:=RecordCount;
      First;
      SetLength(res,rec_count);

      i:=arr_elem;
      repeat
        res[i].kod_name:=FieldByName('kod_name').AsInteger;
        res[i].art_code:=FieldByName('art_code').AsInteger;
        res[i].kol:=FieldByName('kol').AsFloat;
        res[i].ostat:=FieldByName('ostat').AsFloat;
        Result:=res[i];

        Next;
        inc(i);
      until i=rec_count;
    finally
      Free;
    end;
  end;
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

procedure TReturnToProviderF.dgInternalNaklTitleClick(Column: TColumn);
var
  i: integer;
begin
  Order := Column.FieldName;
  for i:=0 to dgInternalNakl.Columns.Count-1 do
    dgInternalNakl.Columns[i].Title.Font.Color := FC_FIELD_TITLE_COLOR;
  OpenNakl;
  Column.Title.Font.Color := FC_ORDERED_FIELD_TITLE_COLOR;
end;

procedure TReturnToProviderF.dgInternalNaklKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key=VK_LEFT)or(Key=VK_UP)or(Key=VK_RIGHT)or(Key=VK_DOWN) then fY:='';
end;

procedure TReturnToProviderF.dgInternalNaklKeyPress(Sender: TObject; var Key: Char);
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
    if TDBGrid(Sender).SelectedIndex = 1 then
    begin
      y := fY + Key;
      (Sender as TDBGrid).DataSource.DataSet.Filter:='[names] = '''+TrimRight(Y)+'''';

      If (Sender as TDBGrid).DataSource.DataSet.Locate('names',TrimRight(Y),[loCaseInsensitive, loPartialKey]) then
      begin
        fY := Y;
        (Sender as TDBGrid).Refresh;
      end;//if locate
    end;
  end;

  if ((Sender as TDBGrid).SelectedIndex = 0) and (Key in symbol) then
  begin
    y := fY + Key;
    If (Sender as TDBGrid).DataSource.DataSet.Locate('art_code',TrimRight(Y),[]) then
    begin
      fY := Y;
      (Sender as TDBGrid).Refresh;
    end//if locate
    else
      fY := Y;
  end;
end;

end.
