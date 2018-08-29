unit SentMessU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, ComCtrls, Util, PrintReport;

type
  TSentMessF = class(TForm)
    DBGrid2: TDBGrid;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    pn1: TPanel;
    Label7: TLabel;
    Panel27: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    Label5: TLabel;
    ComboBox2: TComboBox;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);

  private

  public

    procedure FilterMess;

  end;

var SentMessF:TSentMessF;

implementation

uses MainU, DataModuleU, ShowJMessU;

{$R *.dfm}

procedure TSentMessF.FormCreate(Sender:TObject);
 begin

  Caption:=MFC;
  dtStart.Date:=Date-10;
  dtEnd.Date:=Date;

 {
  if MainF.IsPermit([R_SUPER],P_SILENT) then
   begin
    DBGrid2.Top:=55;
    DBGrid2.Height:=205;
   end else begin
             DBGrid2.Top:=25;
             DBGrid2.Height:=235;
            end;
 }

 end;

procedure TSentMessF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TSentMessF.FilterMess;
 begin
  try
   DM.qrSentM.Close;
   DM.qrSentM.SQL.Clear;
   DM.qrSentM.SQL.Add('select *, (select top 1 Users from SprUser s where s.id_gamma=m.id_from) as FromU');
   DM.qrSentM.SQL.Add('from Inform..MessFromApteks m ');

{   if MainF.IsPermit([R_SUPER],P_SILENT) then
    begin
     DM.qrSentM.SQL.Add('where DateM between '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+'''');
    end else}
   DM.qrSentM.SQL.Add('where datem between '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' ');

   if Not (Prm.UserRole in [R_ADMIN,R_SUPER]) then
    DM.qrSentM.SQL.Add(' and id_from='+IntToStr(Label1.Tag));

   DM.qrSentM.SQL.Add('order by datem desc');
   DM.qrSentM.Open;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа '+E.Message,48);
  end;
 end;

procedure TSentMessF.DBGrid2DblClick(Sender: TObject);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if db.DataSource.DataSet.IsEmpty then Exit;
  ShowMessFull(db.DataSource.DataSet.FieldByName('Mess').AsString);
 end;

procedure TSentMessF.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  if DataCol=3 then
   begin
    if db.DataSource.DataSet.FieldByName('DateRead').AsString='' then db.Canvas.Brush.Color:=clYellow
                                                                 else db.Canvas.Brush.Color:=clLime;
   end;
  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure TSentMessF.ComboBox2Change(Sender: TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    dtStart.Date:=D1;
    dtEnd.Date:=D31;
   end;
 end;

procedure TSentMessF.BitBtn1Click(Sender: TObject);
 begin
  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.AddText('Дата сообщения: '+DM.qrSentM.FieldByName('DateM').AsString+#10);
  PrintRep.AddText('Дата отправки в офис: '+DM.qrSentM.FieldByName('DateRead').AsString+#10);
  PrintRep.AddText('От кого: '+DM.qrSentM.FieldByName('FromU').AsString+#10#10);
  PrintRep.Align:=AL_CENTER;
  PrintRep.AddText('Текст сообщения'#10#10);
  PrintRep.Align:=AL_JUST;
  PrintRep.AddText(DM.qrSentM.FieldByName('Mess').AsString+#10);
  PrintRep.PreView;
 end;

procedure TSentMessF.BitBtn3Click(Sender: TObject);
 begin
  FilterMess;
 end;

end.
