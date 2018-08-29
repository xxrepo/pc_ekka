unit ViewVzResU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ComCtrls, DateUtils, Util, Grids, DBGrids, DB, DBCtrls, ExtCtrls;

type
  TViewVzResF = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    dtStart: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dtEnd: TDateTimePicker;
    Label8: TLabel;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    dsDate: TDataSource;
    dsVzRes: TDataSource;
    BitBtn2: TBitBtn;
    DBText1: TDBText;
    Label4: TLabel;
    BitBtn3: TBitBtn;

    procedure FormCreate(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
    procedure ComboBox2Change(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure dsDateDataChange(Sender:TObject; Field:TField);
    procedure DBGrid2KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private

    procedure ShowDates;

  public

    procedure ShowVzRes;

  end;

var ViewVzResF:TViewVzResF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TViewVzResF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  ComboBox2.ItemIndex:=StrToInt(FormatDateTime('mm',Date()))-1;
  ComboBox2Change(ComboBox2);
  dtEnd.Date:=Date;
  ShowDates;
 end;

procedure TViewVzResF.ShowDates;
var id:Integer;
 begin
  try
   if DM.qrDateZP.Active then ID:=DM.qrDateVZ.FieldByName('iddoc').AsInteger;
   DM.qrDateVZ.Close;
   DM.qrDateVZ.SQL.Clear;
   DM.qrDateVZ.SQL.Add('select * from DhVz ');
   DM.qrDateVZ.SQL.Add('where IsNull(Closed,0)<2 and date_nakl between '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtStart.Date)+''' and ');
   DM.qrDateVZ.SQL.Add(' '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+'''  ');
   DM.qrDateVZ.SQL.Add('order by nn_nakl');
   DM.qrDateVZ.Open;
   DM.qrDateVZ.Locate('iddoc',id,[]);
   ShowVzRes;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к заказам: '+E.Message);
  end;
 end;

procedure TViewVzResF.ShowVzRes;
var AC:Integer;
 begin
  DM.Qr.SQL.Text:='select KolEdit from DtVz where KolEdit>Kol and iddoc='+DM.qrDateVZ.FieldByName('iddoc').AsString;

  if DM.qrVzRes.Active then AC:=DM.qrVzRes.FieldByName('Art_code').AsInteger;
  DM.qrVzRes.Close;
  if DM.qrDateVZ.IsEmpty then Exit;
  DM.qrVzRes.SQL.Clear;

  DM.Qr.Close;
  DM.Qr.SQL.Clear;
  DM.Qr.SQL.Add('update DtVz set KolEdit=Kol where KolEdit>Kol and iddoc='+DM.qrDateVZ.FieldByName('iddoc').AsString);
  DM.Qr.SQL.Add('update DtVz set KolEdit=0 where KolEdit<0 and iddoc='+DM.qrDateVZ.FieldByName('iddoc').AsString);
  DM.Qr.ExecSQL;

  DM.qrVzRes.SQL.Add('select t.art_code,t.names,t.kol,t.koledit,t.cena,u.users');
  DM.qrVzRes.SQL.Add('from DhVz h, DtVz t, SprUser u                          ');
  DM.qrVzRes.SQL.Add('where h.iddoc=t.iddoc and u.id=h.id_user and            ');
  DM.qrVzRes.SQL.Add('      h.iddoc='+DM.qrDateVZ.FieldByName('iddoc').AsString);
  DM.qrVzRes.SQL.Add('order by 2');
  DM.qrVzRes.SQL.SaveToFile('C:\ZakazP.txt');
  DM.qrVzRes.Open;
  DM.qrVzRes.Locate('art_code',AC,[]);

  DBGrid2.ReadOnly:=DM.qrDateVZ.FieldByName('Closed').AsInteger=1;
  BitBtn3.Enabled:=DM.qrDateVZ.FieldByName('Closed').AsInteger=0;
 end;

procedure TViewVzResF.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TViewVzResF.ComboBox2Change(Sender:TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    dtStart.Date:=D1;
    dtEnd.Date:=D31;
   end;
 end;

procedure TViewVzResF.BitBtn2Click(Sender: TObject);
 begin
  ShowDates;
 end;

procedure TViewVzResF.dsDateDataChange(Sender: TObject; Field: TField);
 begin
  ShowVzRes;
 end;

procedure TViewVzResF.DBGrid2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key=VK_RETURN then
   if DM.qrVzRes.State in [dsEdit] then DM.qrVzRes.Post;
 end;

procedure TViewVzResF.BitBtn3Click(Sender:TObject);
var B:Boolean;
 begin
  if DM.qrDateVZ.IsEmpty then Exit;
  if DM.qrDateVZ.FieldByName('Closed').AsInteger<>0 then Exit;
  if MainF.MessBox('После фиксирования данных, вы не сможете больше вносить изменения по кол-ву недостачи!'#10'Вы уверены, что хотите произвести фиксацию данных?',52)<>ID_YES then Exit;

  if DM.qrVzRes.State in [dsEdit] then DM.qrVzRes.Post;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select top 1 art_code,koledit from DtVz where KolEdit>0 and iddoc='+DM.qrDateVZ.FieldByName('iddoc').AsString;
  DM.QrEx.Open;
  B:=DM.QrEx.IsEmpty;

  DM.QrEx.Close;
  DM.QrEx.SQL.Add('update DhVz set Closed=1 where Closed=0 and iddoc='+DM.qrDateVZ.FieldByName('iddoc').AsString);
  DM.QrEx.SQL.Add('declare @art int, @kol int                                         ');
  DM.QrEx.SQL.Add('declare Cur cursor local for select art_code,koledit from DtVz where KolEdit>0 and iddoc='+DM.qrDateVZ.FieldByName('iddoc').AsString);
  DM.QrEx.SQL.Add('open Cur                                                                              ');
  DM.QrEx.SQL.Add('fetch Cur into @art,@kol                                                              ');
  DM.QrEx.SQL.Add('while @@Fetch_Status = 0                                                              ');
  DM.QrEx.SQL.Add(' begin                                                                                ');
  DM.QrEx.SQL.Add('  exec spY_EnterKol @art,@kol,'+IntToStr(Prm.UserID)+',1,@art,0,1,0,0,''''            ');
  DM.QrEx.SQL.Add('  fetch Cur into @art,@kol                                                            ');
  DM.QrEx.SQL.Add(' end                                                                                  ');
  DM.QrEx.SQL.Add('close Cur                                                                             ');
  DM.QrEx.SQL.Add('deallocate Cur                                                                        ');
  DM.QrEx.SQL.Add('exec spY_WriteChek '+IntToStr(Prm.UserID)+',0,99,1,1,'''+FormatDateTime('yyyy-mm-dd',Date)+' 00:00:00'',0,''$autovozvrat$'',0,0                      ');

  DM.ADOCo.BeginTrans;
  try
   DM.QrEx.ExecSQL;
   DM.ADOCo.CommitTrans;
   if B=False then MainF.MessBox('По некоторым позициям был сформирован возврат по недостаче. Для просмотра возврата зайдите в историю накладных!')
              else MainF.MessBox('Фиксация данных прошла успешно.',64);

  except
   on E:Exception do
    begin
     DM.ADOCo.RollbackTrans;
     MainF.MessBox('Ошибка фиксации данных: '+E.Message);
    end;
  end;

  ShowDates;
 end;

procedure TViewVzResF.DBGrid1DrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if db.DataSource.DataSet.FieldByName('Closed').AsInteger=1 then db.Canvas.Font.Style:=[fsBold];
   db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure TViewVzResF.DBGrid2DrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if db.DataSource.DataSet.FieldByName('KolEdit').AsInteger=0 then db.Canvas.Brush.Color:=clRed else
  if db.DataSource.DataSet.FieldByName('KolEdit').AsInteger<>db.DataSource.DataSet.FieldByName('Kol').AsInteger then db.Canvas.Brush.Color:=clYellow;
  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

end.
