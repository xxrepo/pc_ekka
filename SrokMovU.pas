unit SrokMovU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Util, Buttons, PrintReport,
  Menus;

type
  TSrokMovF = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label2: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    ComboBox2: TComboBox;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    grAll: TCheckBox;
    gr1: TCheckBox;
    gr2: TCheckBox;
    gr3: TCheckBox;
    gr4: TCheckBox;
    gr5: TCheckBox;
    gr6: TCheckBox;
    gr7: TCheckBox;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure grAllClick(Sender: TObject);
    procedure gr1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    procedure FilterSpis;
    { Private declarations }
  public
    { Public declarations }
  end;

var SrokMovF:TSrokMovF;

implementation

uses MainU, DataModuleU, ADODB;

{$R *.dfm}

procedure TSrokMovF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  dtStart.Date:=Date;
  dtEnd.Date:=Date;
 end;

procedure TSrokMovF.ComboBox2Change(Sender: TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    dtStart.Date:=D1;
    dtEnd.Date:=D31;
   end;
 end;

procedure TSrokMovF.grAllClick(Sender: TObject);
var i:Integer;
 begin
  if grAll.Checked then
   for i:=1 to 7 do
    TCheckBox(FindComponent('gr'+IntToStr(i))).Checked:=True;
 end;

procedure TSrokMovF.gr1Click(Sender: TObject);
 begin
  if TCheckBox(Sender).Checked=False then grAll.Checked:=False;
 end;

procedure TSrokMovF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TSrokMovF.FilterSpis;
var i,AC:Integer;
    S:String;
 begin
  if DM.qrSrokMov.Active then AC:=DM.qrSrokMov.FieldByName('Код_I_720').AsInteger;
  S:='';
  for i:=1 to 7 do
   if TCheckBox(FindComponent('gr'+IntToStr(i))).Checked then S:=S+IntToStr(i);
  if S='' then S:='1234567';

  DM.qrSrokMov.Close;
  DM.qrSrokMov.Parameters.ParamByName('pNames').Value:='%'+Edit1.Text+'%';
  DM.qrSrokMov.Parameters.ParamByName('pdt1').Value:=dtStart.DateTime;
  DM.qrSrokMov.Parameters.ParamByName('pdt2').Value:=dtEnd.DateTime;
  DM.qrSrokMov.Parameters.ParamByName('pGr').Value:=S;

  if ComboBox1.ItemIndex<1 then DM.qrSrokMov.Parameters.ParamByName('pMn').Value:=100000
                           else DM.qrSrokMov.Parameters.ParamByName('pMn').Value:=ComboBox1.ItemIndex;

  DM.qrSrokMov.Open;
  DM.qrSrokMov.Locate('Код_I_720',AC,[]);
 end;

procedure TSrokMovF.SpeedButton1Click(Sender: TObject);
 begin
  FilterSpis;
 end;

procedure TSrokMovF.BitBtn2Click(Sender:TObject);
 begin
  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Font.Name:='Arial';

  try
   DBGrid1.Visible:=False;
   PrintRep.AddText('Движение срокового товара за период с '+DateToStr(dtStart.Date)+' по '+DateToStr(dtEnd.Date)+#10+Prm.AptekaNameRU+#10#10);
   PrintRep.Font.Size:=3;
   PrintRep.Orientation:=O_LANDS;
   PrintRep.Qr:=DM.qrSrokMov;
   PrintRep.PrintTable(False,0,0);
   PrintRep.PreView;
  finally
   DBGrid1.Visible:=True;
  end;
 end;

procedure TSrokMovF.N1Click(Sender: TObject);
 begin
  MainF.ShowMovTov(DM.qrSrokMov.FieldByName('Код_I_720').AsInteger,'Движение товара - '+DM.qrSrokMov.FieldByName('Наименование_S_4880').AsString);
 end;

end.


