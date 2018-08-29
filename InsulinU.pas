unit InsulinU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB, ADODB, ComCtrls;

type

  TInsulinF=class(TForm)
    Label1: TLabel;
    ComboBox1:TComboBox;
    Label2:TLabel;
    Label4:TLabel;
    BitBtn3:TBitBtn;
    BitBtn2:TBitBtn;
    Label6:TLabel;
    Label8: TLabel;
    Edit3: TEdit;
    Label9: TLabel;
    DBGrid2: TDBGrid;
    Edit4: TComboBox;
    Edit1: TComboBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label5: TLabel;
    dtpRecipt: TDateTimePicker;

    procedure FormCreate(Sender:TObject);
    procedure DBGrid1DblClick(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn3Click(Sender:TObject);
    procedure FormActivate(Sender:TObject);
    procedure DBGrid1DrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2CloseUp(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
    procedure dsMnnListDataChange(Sender:TObject; Field:TField);

  private

    procedure FilterSpis;
    procedure Dch;

  public

    Flag:Integer;

  end;

var InsulinF:TInsulinF;

implementation

uses MainU, DataModuleU, Pilot2U, VSostU;

{$R *.dfm}

procedure TInsulinF.FormCreate(Sender:TObject);
var i:Integer;
 begin
  Caption:=MFC;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select MedName from SprMED order by MedName ';
  DM.QrEx.Open;

  dtpRecipt.Date:=Date-35;

  ComboBox1.Clear;
  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    ComboBox1.Items.Add(DM.QrEx.FieldByName('MedName').AsString);
   end;
  ComboBox1.ItemIndex:=-1;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select FIO from SprDLDoctors order by FIO ';
  DM.QrEx.Open;

  Edit4.Clear;
  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    Edit4.Items.Add(DM.QrEx.FieldByName('FIO').AsString);
   end;
  Edit4.ItemIndex:=-1;

  DM.QrEx.Close;
  DM.QrEx.SQL.Clear;

  DM.QrEx.Close;
  DM.QrEx.SQL.Clear;
  DM.QrEx.SQL.Add(' select distinct Descr as Pacient ');
  DM.QrEx.SQL.Add(' from SprPacientDL ');
  DM.QrEx.SQL.Add(' order by 1 ');
  DM.QrEx.Open;

  Edit1.Clear;
  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    Edit1.Items.Add(DM.QrEx.FieldByName('Pacient').AsString);
   end;
  Edit1.ItemIndex:=-1;

  FilterSpis;
 end;

procedure TInsulinF.Dch;
 begin
  try
   RadioButton1.Checked:=False;
   RadioButton2.Checked:=False;
   if DM.qrMnnList.IsEmpty then Exit;
   if DM.qrMnnList.FieldByName('IsDopl').AsInteger=1 then
    begin
     RadioButton1.Enabled:=True;
     RadioButton2.Enabled:=True;
    end else begin
              RadioButton2.Checked:=True;
              RadioButton1.Enabled:=False;
              RadioButton2.Enabled:=False;
             end;
  except
  end;
 end;

procedure TInsulinF.dsMnnListDataChange(Sender:TObject; Field:TField);
 begin
  DCh;
 end;

procedure TInsulinF.DBGrid1DblClick(Sender:TObject);
var i:Integer;
    S,F:String;
 begin
{  try
   Label4.Caption:=DM.qrMNN.FieldByName('MNN').AsString;
   VSostF:=TVSostF.Create(Self);
   try
    S:='';
    F:='';

    DM.QrEx.Close;
    DM.QrEx.SQL.Text:='select sostav from Inform..SprFormV where art_code in (select art_code from SprPilot where mnn='''+DM.qrMNN.FieldByName('MNN').AsString+''') group by sostav order by 1';
    DM.QrEx.Open;
    VSostF.ComboBox1.Clear;
    for i:=1 to DM.QrEx.RecordCount do
     begin
      if i=1 then DM.QrEx.First else DM.QrEx.Next;
      VSostF.ComboBox1.Items.Add(DM.QrEx.FieldByName('Sostav').AsString);
     end;

    DM.QrEx.Close;
    DM.QrEx.SQL.Text:='select formaen from Inform..SprFormV where art_code in (select art_code from SprPilot where mnn='''+DM.qrMNN.FieldByName('MNN').AsString+''') group by formaen order by 1';
    DM.QrEx.Open;
    VSostF.ComboBox2.Clear;
    for i:=1 to DM.QrEx.RecordCount do
     begin
      if i=1 then DM.QrEx.First else DM.QrEx.Next;
      VSostF.ComboBox2.Items.Add(DM.QrEx.FieldByName('formaen').AsString);
     end;
    Application.ProcessMessages;
    VSostF.ShowModal;
    if VSostF.Flag=1 then
     begin
      S:=VSostF.ComboBox1.Text;
      F:=VSostF.ComboBox2.Text;
     end;
   finally
    VSostF.Free;
   end;

   DM.qrMnnList.Close;
   DM.qrMnnList.SQL.Clear;
   DM.qrMnnList.SQL.Add('select a.art_code,a.names,Sum(a.ostat) as ostat,(a.cena-b.cena) as cena,a.type_tov');
   DM.qrMnnList.SQL.Add('from SprTov a, SprPilot b');
   DM.qrMnnList.SQL.Add('where b.Active=1 and a.cena>b.cena and a.art_code=b.art_code and b.mnn='''+DM.qrMNN.FieldByName('MNN').AsString+'''');
   DM.qrMnnList.SQL.Add('      and a.ostat>0 ');
   if S<>'' then
    DM.qrMnnList.SQL.Add('      and a.art_code in (select art_code from Inform..SprFormV where sostav='''+S+''' )');

   if F<>'' then
    DM.qrMnnList.SQL.Add('      and a.art_code in (select art_code from Inform..SprFormV where formaen='''+F+''' )');

   DM.qrMnnList.SQL.Add('group by a.art_code,a.names,a.cena-b.cena,a.type_tov');
   DM.qrMnnList.SQL.Add('order by 2');
   DM.qrMnnList.Open;

  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику цен по пилотному проекту: '+E.Message);
  end;
}
 end;

procedure TInsulinF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TInsulinF.BitBtn3Click(Sender:TObject);
 begin
  if Edit1.Text='' then begin MainF.MessBox('Введите ФИО пациента!'); Edit1.SetFocus; end else
  if ComboBox1.Text='' then begin MainF.MessBox('Выберите поликлинику!'); ComboBox1.SetFocus; end else
  if Edit3.Text='' then begin MainF.MessBox('Введите номер рецепта!'); Edit3.SetFocus; end else
  if Date-dtpRecipt.Date>31 then
   begin
    MainF.MessBox('Выберите дату рецепта!');
    Edit4.SetFocus;
   end else
  if DM.qrMnnList.IsEmpty then begin MainF.MessBox('Список препаратов пуст!'); end else
  if (RadioButton1.Checked=False) and (RadioButton2.Checked=False) then begin MainF.MessBox('Необходимо выбрать тип рецепта "С доплатой" или "Без доплаты"'); end else
   begin

{
    if DM.qrMnnList.FieldByName('Ostat').AsCurrency<1 then
     begin
      ShowQ('Внимание! Неполная упаковка выбранного препарата. Можно отпустить только обычным чеком за полную стоимость по розничной цене!',0,True);
      Exit;
     end;
}
    if ShowQ('В рецепте допускается только одно наименование лекарственного препарата! Если рецепт оформлен на несколько наименований, необходимо вернуть рецепт пациенту и объяснить причину!',0) then
     begin
      Flag:=1;
      Close;
     end; 
   end;

  //сохранение сведений о враче в таблицу БД 
  if Edit4.Items.IndexOf(Edit4.Text) < 0 then
  begin
    try
      with TADOQuery.Create(self) do
      begin
        try
          Connection:=DM.ADOCo;
          SQL.Clear;
          SQL.Add('declare @doctor_name varchar(240)');
          SQL.Add('set @doctor_name = '''+InsulinF.Edit4.Text+'''');
          SQL.Add('select FIO from SprDLDoctors where FIO = @doctor_name');
          Open;
          if IsEmpty then
          begin
            SQL.Clear;
            SQL.Add('declare @doctor_name varchar(240)');
            SQL.Add('set @doctor_name = '''+InsulinF.Edit4.Text+'''');
            SQL.Add('declare @max_id int');
            SQL.Add('set @max_id = (select isnull(max(ID),0)+1 from SprDLDoctors)');
            SQL.Add('insert into SprDLDoctors (ID,FIO) values (');
            SQL.Add('  @max_id, @doctor_name)');
            //SQL.Add('  (select isnull(max(ID),1)+1 from SprDLDoctors), @doctor_name)');
            SQL.Add('');
            ExecSQL;
          end
          else
            raise Exception.Create('Доктор '''+InsulinF.Edit4.Text +''' уже есть в справочнике врачей!');
        finally
          Close;
          Free;
        end;
      end;
    except
      on E:Exception do
        MainF.MessBox('Ошибка!'+#13+
                      'При проверке врачей или добавлении врача возникла ошибка'+#13+
                      E.Message+#13+
                      'Сведения о враче сохранены не были!')
    end;
  end;
 end;

procedure TInsulinF.FormActivate(Sender:TObject);
 begin
{  if DM.qrMNNList.SQL.Text<>'' then
   begin
    DM.qrMNNList.Close;
    DM.qrMNNList.Open;
   end;
}
  DBGrid2.DataSource.OnDataChange:=dsMnnListDataChange;
  Dch;
  Edit1.SetFocus;
 end;

procedure TInsulinF.DBGrid1DrawColumnCell(Sender:TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBgrid;
 begin
  db:=TDBGrid(Sender);
  if db.DataSource.DataSet.FieldByName('MNN').AsString=Label4.Caption then db.Canvas.Brush.Color:=$00FFB720;
  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure TInsulinF.Edit3KeyPress(Sender:TObject; var Key:Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

procedure TInsulinF.ComboBox2CloseUp(Sender: TObject);
 begin
  FilterSpis;
 end;

procedure TInsulinF.FilterSpis;
 begin
  DM.qrMnnList.Close;
  DM.qrMnnList.SQL.Text:='exec spY_ListInsulin ';
  DM.qrMnnList.Open;
 end;

procedure TInsulinF.DBGrid2DrawColumnCell(Sender:TObject; const Rect:TRect; DataCol: Integer; Column:TColumn; State:TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if db.DataSource.DataSet.FieldByName('ostat').AsCurrency<1 then
   begin
//    db.Canvas.Brush.Color:=clBlue;
    db.Canvas.Font.Color:=clGray;
   end;
  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

end.




