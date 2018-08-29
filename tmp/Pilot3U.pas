unit Pilot3U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB;

type

  TPilot3F=class(TForm)
    Label1: TLabel;
    ComboBox1:TComboBox;
    Label2:TLabel;
    DBGrid1:TDBGrid;
    Label3:TLabel;
    Label4:TLabel;
    Label5:TLabel;
    DBGrid2:TDBGrid;
    BitBtn3:TBitBtn;
    BitBtn2:TBitBtn;
    Label6:TLabel;
    Edit1:TEdit;
    BitBtn1: TBitBtn;
    Label8: TLabel;
    Edit3: TEdit;
    Label9: TLabel;
    Edit4: TEdit;

    procedure FormCreate(Sender:TObject);
    procedure DBGrid1DblClick(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn3Click(Sender:TObject);
    procedure FormActivate(Sender:TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
    procedure DBGrid2TitleClick(Column:TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);

  private

  public

    Flag:Integer;

  end;

var Pilot3F:TPilot3F;

implementation

uses MainU, DataModuleU, Pilot2U, VSostU;

{$R *.dfm}

procedure TPilot3F.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  DM.qrMnn.Close;
  DM.qrMnn.Open;
  DM.qrMnnList.SQL.Text:='';
  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select medname from Apteks271 where id_apteka='+IntToStr(Prm.AptekaID);
  DM.QrEx.Open;
  if DM.QrEx.IsEmpty=False then
   begin
    ComboBox1.Clear;
    ComboBox1.Items.Add(DM.QrEx.FieldByName('medname').AsString);
    ComboBox1.ItemIndex:=0;
   end;
 end;

procedure TPilot3F.DBGrid1DblClick(Sender:TObject);
var i:Integer;
    S,F:String;
 begin
  try
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

   DBGrid1.Repaint;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику цен по пилотному проекту: '+E.Message);
  end;
 end;

procedure TPilot3F.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TPilot3F.BitBtn3Click(Sender:TObject);
 begin
  if DM.qrMnnList.IsEmpty then MainF.MessBox('Ничего не выбрано!') else
  if ComboBox1.Text='' then MainF.MessBox('Выберите поликлинику!') else
  if Edit1.Text='' then begin MainF.MessBox('Введите ФИО пациента!'); Edit1.SetFocus; end else
   begin
    ShowQ('Количество препаратов необходимо вводить строго то, которое указано в рецепте!',0,True);
    Flag:=1;
    Close;
   end;
 end;

procedure TPilot3F.FormActivate(Sender:TObject);
 begin
  if DM.qrMNNList.SQL.Text<>'' then
   begin
    DM.qrMNNList.Close;
    DM.qrMNNList.Open;
   end;
  Edit1.SetFocus;
 end;

procedure TPilot3F.DBGrid2DblClick(Sender:TObject);
 begin
  BitBtn3Click(BitBtn3);
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

procedure TPilot3F.DBGrid2TitleClick(Column: TColumn);
var ss,S:String;
 begin
  if DM.qrMnnList.SQL.Text='' then Exit;
  ss:=DM.qrMnnList.SQL.Text;
  if Column=DBGrid2.Columns[3] then
   begin
    S:=StringReplace(DM.qrMnnList.SQL.Text,'order by 2','order by 4',[rfReplaceAll, rfIgnoreCase]);
    if S<>ss then
     begin
      DM.qrMnnList.Close; DM.qrMnnList.SQL.Text:=S; DM.qrMnnList.Open;
      DBGrid2.Columns[3].Title.Font.Color:=clRed;
      DBGrid2.Columns[1].Title.Font.Color:=clMaroon;
     end;
   end else
  if Column=DBGrid2.Columns[1] then
   begin
    S:=StringReplace(DM.qrMnnList.SQL.Text,'order by 4','order by 2',[rfReplaceAll, rfIgnoreCase]);
    if S<>ss then
     begin
      DM.qrMnnList.Close; DM.qrMnnList.SQL.Text:=S; DM.qrMnnList.Open;
      DBGrid2.Columns[1].Title.Font.Color:=clRed;
      DBGrid2.Columns[3].Title.Font.Color:=clMaroon;
     end;
   end;
 end;

procedure TPilot3F.BitBtn1Click(Sender:TObject);
 begin
{
  if ComboBox1.Text='' then MainF.MessBox('Выберите поликлинику!') else
  if Edit1.Text='' then begin MainF.MessBox('Введите ФИО пациента!'); Edit1.SetFocus; end else
  if Edit2.Text='' then begin MainF.MessBox('Введите адрес пациента!'); Edit2.SetFocus; end else
  if Edit3.Text='' then begin MainF.MessBox('Введите номер рецепта!'); Edit3.SetFocus; end else
  if Edit4.Text='' then begin MainF.MessBox('Введите ФИО врача!'); Edit4.SetFocus; end else
}
   begin
    Flag:=1;
    Close;
   end;
 end;

procedure TPilot3F.Edit3KeyPress(Sender: TObject; var Key: Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

end.
































