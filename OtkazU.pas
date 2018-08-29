unit OtkazU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGrids,DB;

type
  TOtkazF = class(TForm)
    Panel2: TPanel;
    Label4: TLabel;
    dtOtkaz: TDateTimePicker;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    cbPriznak: TComboBox;
    cbUsers: TComboBox;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dtOtkazChange(Sender: TObject);
    procedure cbPriznakCloseUp(Sender: TObject);
    procedure cbUsersCloseUp(Sender: TObject);

  private

  public

    procedure FilterOtkaz;

  end;

var OtkazF:TOtkazF=nil;


implementation

uses MainU, DataModuleU, ShareU;

{$R *.dfm}

procedure TOtkazF.FormCreate(Sender:TObject);
var i:Integer;
 begin
  Caption:=MFC;
  BitBtn4Click(BitBtn4);
  if Prm.AptekaSklad then cbPriznak.Items.Add('Оптовый');

  DM.Qr.Close;
  DM.Qr.SQL.Text:='select * from SprUser where id in (select id_user from ArhCheks group by id_user) order by Users';
  DM.Qr.Open;
  cbUsers.Clear;
  cbUsers.Items.Add('Все');
  for i:=1 to DM.Qr.RecordCount do
   begin
    if i=1 then DM.Qr.First else DM.Qr.Next;
    cbUsers.Items.Add(DM.Qr.FieldByName('Users').AsString);
   end;
  cbUsers.ItemIndex:=0;



 end;

procedure TOtkazF.FilterOtkaz;
var AC:Integer;

 begin
  try
   AC:=-1;
   if Not(DM.qrOtkaz.IsEmpty) then AC:=DM.qrOtkaz.FieldByName('Art_Code').AsInteger;
   DM.qrOtkaz.Close;
   DM.qrOtkaz.SQL.Clear;

   if cbPriznak.ItemIndex<=2 then
    begin
     DM.qrOtkaz.SQL.Add('select art_code,IsNull(IsNull((select Max(s.Names) from SprTov s where s.art_code=b.art_code),(select Max(p.Names) from Plist p where p.art_code=b.art_code)),b.names) as Names,cena,realiz,otkaz,date_otkaz, ');
     DM.qrOtkaz.SQL.Add('(select top 1 Users from SprUser s (nolock) where s.id=b.id_user) as Users ');

     DM.qrOtkaz.SQL.Add('from Otkaz b');
     DM.qrOtkaz.SQL.Add('where priznak='+IntToStr(cbPriznak.ItemIndex+1)+' and ');
     DM.qrOtkaz.SQL.Add('      date_otkaz>='''+FormatDateTime('yyyy-mm-dd',dtOtkaz.Date)+' 00:00:00'' and ');
     DM.qrOtkaz.SQL.Add('      date_otkaz<='''+FormatDateTime('yyyy-mm-dd',dtOtkaz.Date)+' 23:59:59'' ');

     if cbUsers.ItemIndex>0 then
      DM.qrOtkaz.SQL.Add('      and id_user in (select id from SprUser where Users like ''%'+cbUsers.Text+'%'' ) ');

     DM.qrOtkaz.SQL.Add('order by date_otkaz,2');
    end else
   if cbPriznak.ItemIndex=3 then
    begin

     DM.qrOtkaz.SQL.Add('select art_code,IsNull((select Max(s.Names) from SprTov s where s.art_code=b.art_code),(select Max(p.Names) from Plist p where p.art_code=b.art_code)) as Names,cena,0 as realiz,otkaz,date_otkaz, ');
     DM.qrOtkaz.SQL.Add('(select top 1 Users from SprUser s (nolock) where s.id=b.id_user) as Users');
     DM.qrOtkaz.SQL.Add('from OtkazOpt b ');
     DM.qrOtkaz.SQL.Add('where date_otkaz>='''+FormatDateTime('yyyy-mm-dd',dtOtkaz.Date)+' 00:00:00'' and ');
     DM.qrOtkaz.SQL.Add('      date_otkaz<='''+FormatDateTime('yyyy-mm-dd',dtOtkaz.Date)+' 23:59:59'' ');

     if cbUsers.ItemIndex>0 then
      DM.qrOtkaz.SQL.Add('      and id_user in (select id from SprUser where Users like ''%'+cbUsers.Text+'%'' ) ');

     DM.qrOtkaz.SQL.Add('order by date_otkaz,2');
    end;

//   DM.qrOtkaz.SQL.SaveToFile('C:\otkaz.txt');
   DM.qrOtkaz.Open;
   DM.qrOtkaz.Locate('ART_CODE',AC,[]);
  except
   MainF.MessBox('Ошибка доступа к таблице отказов.');
  end;
 end;

procedure TOtkazF.BitBtn3Click(Sender: TObject);
 begin
  FilterOtkaz;
 end;

procedure TOtkazF.BitBtn4Click(Sender: TObject);
var DT:TDateTime;
 begin
  try
   DM.Qr.Close;

   if cbPriznak.ItemIndex<=2 then DM.Qr.SQL.Text:='select IsNull(Max(Date_Otkaz),getdate()) as dt from Otkaz where Otkaz>0'
                             else DM.Qr.SQL.Text:='select IsNull(Max(Date_Otkaz),getdate()) as dt from OtkazOpt where Otkaz>0';

   DM.Qr.Open;
   DT:=DM.Qr.FieldByName('dt').AsDateTime;
  except
   DT:=Date;
  end;
  dtOtkaz.Date:=StrToDateTime(DateTimeToStr(DT));
  FilterOtkaz;
 end;

procedure TOtkazF.DBGrid1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key=VK_RETURN then
   if DM.qrOtkaz.State in [dsEdit] then DM.qrOtkaz.Post
 end;

procedure TOtkazF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TOtkazF.FormActivate(Sender:TObject);
 begin
  DBGrid1.SelectedIndex:=2;
  cbPriznak.ItemIndex:=0;
  FilterOtkaz;
 end;

procedure TOtkazF.BitBtn1Click(Sender:TObject);
 begin
  if cbPriznak.ItemIndex>=0 then
   PrintOtkaz(dtOtkaz.Date,cbPriznak.ItemIndex+1);
 end;

procedure TOtkazF.dtOtkazChange(Sender:TObject);
 begin
  FilterOtkaz;
 end;

procedure TOtkazF.cbPriznakCloseUp(Sender:TObject);
 begin
  FilterOtkaz;
 end;

procedure TOtkazF.cbUsersCloseUp(Sender:TObject);
 begin
  FilterOtkaz;
 end;

end.
