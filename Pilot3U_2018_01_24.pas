unit Pilot3U;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB;

type

  TPilot3F=class(TForm)
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
    Label3: TLabel;
    ComboBox2: TComboBox;
    DBGrid2: TDBGrid;
    Edit4: TComboBox;
    Edit1: TComboBox;

    procedure FormCreate(Sender:TObject);
    procedure DBGrid1DblClick(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn3Click(Sender:TObject);
    procedure FormActivate(Sender:TObject);
    procedure DBGrid1DrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2CloseUp(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);

  private

    procedure FilterSpis;

  public

    Flag:Integer;

  end;

var Pilot3F:TPilot3F;

implementation

uses MainU, DataModuleU, Pilot2U, VSostU;

{$R *.dfm}

procedure TPilot3F.FormCreate(Sender:TObject);
var i:Integer;
 begin
  Caption:=MFC;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select MedName from SprMED order by MedName ';
  DM.QrEx.Open;

  ComboBox1.Clear;
  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    ComboBox1.Items.Add(DM.QrEx.FieldByName('MedName').AsString);
   end;
  ComboBox1.ItemIndex:=-1;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select MNN from vSprPilot group by MNN ';
  DM.QrEx.Open;

  ComboBox2.Clear;
  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    ComboBox2.Items.Add(DM.QrEx.FieldByName('MNN').AsString);
   end;
  ComboBox2.ItemIndex:=-1;

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
  
{  DM.QrEx.SQL.Add('select Distinct Pacient ');
  DM.QrEx.SQL.Add('from(  ');
  DM.QrEx.SQL.Add('     select ');
  DM.QrEx.SQL.Add('            Pacient, ');
  DM.QrEx.SQL.Add('            date_Chek  ');
  DM.QrEx.SQL.Add('     from ArhCheks ');
  DM.QrEx.SQL.Add('     where date_chek>''2017-04-15'' and  ');
  DM.QrEx.SQL.Add('           IsNull(Pacient,'''')<>''''  ');
  DM.QrEx.SQL.Add('     group by Pacient,  ');
  DM.QrEx.SQL.Add('              date_Chek   ');
  DM.QrEx.SQL.Add('       ');
  DM.QrEx.SQL.Add('    ) a   ');
  DM.QrEx.SQL.Add('order by 1 ');
}
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

procedure TPilot3F.DBGrid1DblClick(Sender:TObject);
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

procedure TPilot3F.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TPilot3F.BitBtn3Click(Sender:TObject);
 begin
  if Edit1.Text='' then begin MainF.MessBox('Введите ФИО пациента!'); Edit1.SetFocus; end else
  if ComboBox1.Text='' then begin MainF.MessBox('Выберите поликлинику!'); ComboBox1.SetFocus; end else
  if Edit3.Text='' then begin MainF.MessBox('Введите номер рецепта!'); Edit3.SetFocus; end else
  if Edit4.Text='' then begin MainF.MessBox('Введите ФИО врача!'); Edit4.SetFocus; end else
  if ComboBox2.Text='' then begin MainF.MessBox('Выберите действующее вещество!'); ComboBox2.SetFocus; end else
  if DM.qrMnnList.IsEmpty then begin MainF.MessBox('Список препаратов пуст!'); end else
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
 end;

procedure TPilot3F.FormActivate(Sender:TObject);
 begin
{  if DM.qrMNNList.SQL.Text<>'' then
   begin
    DM.qrMNNList.Close;
    DM.qrMNNList.Open;
   end;
}
  Edit1.SetFocus;
 end;

procedure TPilot3F.DBGrid1DrawColumnCell(Sender:TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TPilot3F.Edit3KeyPress(Sender:TObject; var Key:Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

procedure TPilot3F.ComboBox2CloseUp(Sender: TObject);
 begin
  FilterSpis;
 end;

procedure TPilot3F.FilterSpis;
 begin
  DM.qrMnnList.Close;
  DM.qrMnnList.SQL.Text:='exec spY_ListPilot '''+ComboBox2.Text+'''';
  DM.qrMnnList.Open;
 end;

procedure TPilot3F.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
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




