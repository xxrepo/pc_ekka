unit PiggyBankRepU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Util, PrintReport;

type
  TPiggyBankRepF = class(TForm)
    Label1: TLabel;
    cbRepList: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label8: TLabel;
    dtStart: TDateTimePicker;
    Label2: TLabel;
    dtEnd: TDateTimePicker;
    ComboBox2: TComboBox;
    Label3: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    cbPrior: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure cbRepListCloseUp(Sender: TObject);

  private

  public

  end;

var
  PiggyBankRepF: TPiggyBankRepF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TPiggyBankRepF.FormCreate(Sender: TObject);
var i:Integer;
 begin
  Caption:=MFC;
  ComboBox2.ItemIndex:=StrToInt(FormatDateTime('mm',Date()))-1;
  ComboBox2Change(ComboBox2);
 end;

procedure TPiggyBankRepF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TPiggyBankRepF.ComboBox2Change(Sender: TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    dtStart.Date:=D1;
    dtEnd.Date:=D31;
   end;
 end;

procedure TPiggyBankRepF.cbRepListCloseUp(Sender: TObject);
 begin

  Panel1.Visible:=False;
  Panel2.Visible:=False;
  if cbRepList.ItemIndex in [0,2,3] then Panel1.Visible:=True;

  if cbRepList.ItemIndex=3 then Panel2.Visible:=True;

 end;

procedure TPiggyBankRepF.BitBtn1Click(Sender: TObject);
 begin
  if cbRepList.ItemIndex=-1 then
   begin
    MainF.MessBox('Âûבונטעו מעקוע?');
    Exit;
   end;

  DM.qrPRep.Close;

  Case cbRepList.ItemIndex of
   0:DM.qrPRep.SQL.Text:='exec spY_PiggyBankRep 0,'+IntToStr(Prm.ID_Gamma)+','''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' ';
   1:DM.qrPRep.SQL.Text:='exec spY_PiggyBankRep 1,'+IntToStr(Prm.ID_Gamma);
   2:DM.qrPRep.SQL.Text:='exec spY_PiggyBankRep 2,'+IntToStr(Prm.ID_Gamma)+','''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' ';
  end;

  DM.qrPRep.Open;

  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Font.Size:=4;
  PrintRep.Font.Name:='Arial';
  PrintRep.Align:=AL_CENTER;
  PrintRep.Align:=AL_LEFT;

  if cbRepList.ItemIndex in [0] then PrintRep.Orientation:=O_LANDS;

  PrintRep.AddText(Copy(cbRepList.Text,4,Length(cbRepList.Text))+#10);
  PrintRep.AddText('ןונטמה ס '+DateToStr(dtStart.Date)+' ןמ '+DateToStr(dtEnd.Date)+#10#10);

  PrintRep.Font.Size:=3;

  PrintRep.Qr:=DM.qrPRep;
  PrintRep.PrintTable(False,0,0);
  PrintRep.PreView;
 end;

end.
