unit ReestrU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, Util, PrintReport;

type

  TReestrF = class(TForm)

    DBGrid1: TDBGrid;
    Label2: TLabel;
    dtStart: TDateTimePicker;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;

    procedure FormCreate  (Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private

    procedure ShowReestr;

  public

  end;

var ReestrF:TReestrF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TReestrF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  dtStart.Date:=Date;
  DM.qrReestr.Close;
 end;

procedure TReestrF.BitBtn1Click(Sender: TObject);
 begin
  ShowReestr;
 end;

procedure TReestrF.ShowReestr;
 begin
  DM.qrReestr.Close;
  DM.qrReestr.SQL.Text:='exec spY_ShowReestr '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''','''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+'''';
  DM.qrReestr.Open;
 end;

procedure TReestrF.BitBtn3Click(Sender: TObject);
 begin

  if DM.qrReestr.IsEmpty then Exit;
  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Orientation:=O_LANDS;
  PrintRep.Font.Name:='Arial';
  PrintRep.Font.Size:=3;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='exec spY_ShowReestr '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''','''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+'''';
  DM.QrEx.Open;

  PrintRep.AddText('Реєстр лікарських засобів, які надiйшли до суб''єкта господарювання '+Prm.FirmNameUA+' з '+DateToStr(dtStart.Date)+' по '+DateToStr(dtStart.Date)+#10#10#10);
  PrintRep.Qr:=DM.QrEx;
  PrintRep.PrintTable(False,0,0);

  PrintRep.PreView;

 end;

procedure TReestrF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

end.






