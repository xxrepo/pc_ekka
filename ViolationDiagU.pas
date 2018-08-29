unit ViolationDiagU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids, Util, DateUtils, Buttons, DB;


type
  TViolationDiagF = class(TForm)
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    Label2: TLabel;
    Label8: TLabel;
    ComboBox2: TComboBox;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    bbView: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure bbViewClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private

    procedure ShowList;
    procedure srViolationListDataChange(Sender: TObject; Field: TField);

  public

  end;

var ViolationDiagF:TViolationDiagF;

implementation

uses MainU, DataModuleU, ShowSimpTextU;

{$R *.dfm}

procedure TViolationDiagF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  dtStart.Date:=StartOfTheMonth(Date);
  dtEnd.Date:=Date;
  ShowList;
  DM.srViolationList.OnDataChange:=nil; 
 end;

procedure TViolationDiagF.ShowList;
 begin
  DM.qrViolationList.Close;
  DM.qrViolationList.SQL.Text:='exec spY_ListViolations '+IntToStr(Prm.ID_Gamma)+','''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''','+IntToStr(BoolToInt(Not CheckBox1.Checked));
  DM.qrViolationList.Open;
 end;

procedure TViolationDiagF.ComboBox2Change(Sender: TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    dtStart.Date:=D1;
    dtEnd.Date:=D31;
   end;
 end;

procedure TViolationDiagF.CheckBox1Click(Sender: TObject);
 begin
  ShowList;
 end;

procedure TViolationDiagF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  Case db.DataSource.DataSet.FieldByName('Done').AsInteger of
   0:db.Canvas.Font.Style:=[fsBold];
   1:db.Canvas.Font.Color:=clBlue;
   2:db.Canvas.Font.Color:=clRed;
  end;

  if gdSelected in State then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end; 

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure TViolationDiagF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TViolationDiagF.bbViewClick(Sender: TObject);
 begin
  if DM.qrViolationList.IsEmpty then Exit;
  ShowSimpTextF:=TShowSimpTextF.Create(Self);
  try
   ShowSimpTextF.DBMemo1.DataSource:=DM.srViolationList;
   Application.ProcessMessages;
   ShowSimpTextF.ShowModal;
  finally
   ShowSimpTextF.Free;
  end;
 end;

procedure TViolationDiagF.srViolationListDataChange(Sender:TObject; Field:TField);
 begin
  RadioButton1.Checked:=False;
  RadioButton2.Checked:=False;
  Edit1.ReadOnly:=True;

  Edit1.Text:=DM.qrViolationList.FieldByName('Comment').AsString;

  RadioButton1.Visible:=False;
  RadioButton2.Visible:=False;
  BitBtn1.Visible:=False;
  if DM.qrViolationList.IsEmpty then Exit;
  if DM.qrViolationList.FieldByName('Done').AsInteger=0 then
   begin
    RadioButton1.Visible:=True;
    RadioButton2.Visible:=True;
    BitBtn1.Visible:=True;
    Edit1.Text:='';
    Edit1.ReadOnly:=False;
   end;
 end;

procedure TViolationDiagF.BitBtn1Click(Sender: TObject);
var sDone:String;
 begin
  if MainF.MessBox('Вы действительно хотите ответить на замечание?',52)<>ID_YES then Exit;

  if (RadioButton1.Checked=False) and (RadioButton2.Checked=False) then
   begin
    MainF.MessBox('Выберите вариант ответа!');
    Exit;
   end;

  try

   if RadioButton1.Checked then sDone:='1' else sDone:='2';

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spY_AnswerViolation '+DM.qrViolationList.FieldByName('id_gamma').AsString+
                                               ','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DM.qrViolationList.FieldByName('dt').AsDateTime)+''','+
                                               DM.qrViolationList.FieldByName('id_apteka').AsString+','+
                                               ''''+DM.qrViolationList.FieldByName('id_v').AsString+''','+sDone+','''+Edit1.Text+''' select 999 as Res';

   DM.QrEx.Open;

   ShowList;
  except
   on E:Exception do
    MainF.RegisterError('Ответ на замечание',E.Message,False);
  end;
 end;

procedure TViolationDiagF.FormActivate(Sender: TObject);
 begin
  DM.srViolationList.OnDataChange:=srViolationListDataChange;
 end;

procedure TViolationDiagF.FormDestroy(Sender: TObject);
 begin
  DM.srViolationList.OnDataChange:=nil;
 end;

end.


