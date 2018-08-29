  unit CancelViewU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, Buttons, PrintReport;

type
  TCancelViewF = class(TForm)
    Label3: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    cbUsers: TComboBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    cbPriznak: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure cbUsersChange(Sender: TObject);
    procedure cbPriznakChange(Sender: TObject);
  private

    procedure ShowCancel;

  public


  end;

var CancelViewF:TCancelViewF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TCancelViewF.FormCreate(Sender: TObject);
var i:Integer;
 begin
  Caption:=MFC;
  dtStart.DateTime:=Date;
  dtEnd.DateTime:=Date;
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
  ShowCancel;
 end;

procedure TCancelViewF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TCancelViewF.ShowCancel;
 begin
  try
   DM.qrCancel.Close;
   DM.qrCancel.SQL.Clear;
   DM.qrCancel.SQL.Add('select a.dt,b.art_code,b.names as nm_s,a.kol,a.cena,a.kassa,');
   DM.qrCancel.SQL.Add('(select Max(users) from SprUser where id=id_user) as UserName');
   DM.qrCancel.SQL.Add('from CancelCheck a, SprTov b where a.kod_name=b.kod_name and dt>='''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+' 00:00:00'' ');
   DM.qrCancel.SQL.Add('and b.names like '''+Edit1.Text+'%'' ');
   DM.qrCancel.SQL.Add('and a.dt<='''+FormatDateTime('yyyy-mm-dd',dtEnd.Date)+' 23:59:59'' ');
   if cbUsers.Text<>'Все' then
    DM.qrCancel.SQL.Add('and a.id_user=(select Max(id) from SprUser where Users='''+cbUsers.Text+''' and reserve=0)');
   if cbPriznak.Text<>'Все' then
    DM.qrCancel.SQL.Add('and a.priznak='+IntToStr(cbPriznak.ItemIndex));
   DM.qrCancel.SQL.Add('order by a.dt');
//   ShowMessage(DM.qrCancel.SQL.Text);
   DM.qrCancel.Open;
  except
   MainF.MessBox('Ошибка доступа с таблице отмененных чеков!');
  end;
 end;

procedure TCancelViewF.BitBtn2Click(Sender: TObject);
 begin
  ShowCancel;
 end;

procedure TCancelViewF.BitBtn3Click(Sender: TObject);
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:=DM.qrCancel.SQL.Text;
   DM.Qr.SQL[0]:='select a.dt as [Дата_S_1500],b.names as [Наименование_S_3230],a.kol as [Кол_I_550],a.cena as [Цена_N_570],a.kassa as [Касса_I_500],';
   DM.Qr.SQL[1]:='(select Max(users) from SprUser s where s.id=a.id_user) as [Кассир_S_1010]';
   DM.Qr.Open;

   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.Font.Size:=5;
   PrintRep.Font.Name:='Arial';
   PrintRep.Align:=AL_CENTER;
   PrintRep.AddText('Отмененные чеки '+#10#10);
   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Size:=4;
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(False,0,0);
   PrintRep.PreView;

  except
   on E:Exception do
    MainF.MessBox('Ошибка доступа к таблице отмененных чеков: '+E.Message);
  end;
 end;

procedure TCancelViewF.cbUsersChange(Sender: TObject);
 begin
  ShowCancel;
 end;

procedure TCancelViewF.cbPriznakChange(Sender: TObject);
 begin
  ShowCancel;
 end;

end.
