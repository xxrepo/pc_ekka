unit NoScanU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGrids;

type
  TNoScanF = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    imNoScan: TImage;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    cbUsers: TComboBox;
    Label4: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtStartChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var NoScanF:TNoScanF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TNoScanF.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TNoScanF.FormCreate(Sender:TObject);
var i:Integer;
 begin
  Caption:=MFC;
  dtStart.Date:=Date;
  dtEnd.Date:=Date;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from SprUser where reserve=0 order by Users';
   DM.Qr.Open;
   cbUsers.Clear;
   cbUsers.Items.Add('Все');
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     cbUsers.Items.Add(DM.Qr.FieldByName('Users').AsString);
    end;
   cbUsers.ItemIndex:=0;
  except
  end;

  dtStartChange(nil);
 end;

procedure TNoScanF.dtStartChange(Sender: TObject);
 begin
  try
   DM.qrNoScan.Close;
   DM.qrNoScan.SQL.Clear;
   DM.qrNoScan.SQL.Add('select a.dt as DateS,                                                                   ');
   DM.qrNoScan.SQL.Add('       b.names as fullname,                                                                      ');
   DM.qrNoScan.SQL.Add('       a.id_user,                                                                       ');
   DM.qrNoScan.SQL.Add('       c.ean13                                                                          ');
   DM.qrNoScan.SQL.Add('from ScanLog a,                                                                         ');
   DM.qrNoScan.SQL.Add('     SprTov b left join SprEAN c on b.art_code=c.art_code                               ');
   DM.qrNoScan.SQL.Add('where a.kod_name=b.kod_name and                                                         ');
   DM.qrNoScan.SQL.Add('      a.dt>='''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+' 00:00:00'' and           ');
   DM.qrNoScan.SQL.Add('      a.dt<='''+FormatDateTime('yyyy-mm-dd',dtEnd. Date)+' 23:59:59''                 ');

   if cbUsers.ItemIndex>0 then
    DM.qrNoScan.SQL.Add('     and a.id_user='''+cbUsers.Text+'''                 ');

   if Edit1.Text<>'' then
    DM.qrNoScan.SQL.Add('     and b.names like ''%'+Edit1.Text+'%''                 ');

   DM.qrNoScan.SQL.Add('order by a.dt                                                                           ');
   DM.qrNoScan.Open;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к таблие неотсканированных:'+E.Message);
  end;
 end;

end.
