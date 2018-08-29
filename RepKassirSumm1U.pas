unit RepKassirSumm1U;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Util, Grids, DBGrids;

type
  TRepKassirSumm1F = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    bbRefresh: TBitBtn;
    DBGrid1: TDBGrid;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    cbKassa: TComboBox;
    CheckBox3: TCheckBox;
    Label4: TLabel;
    tmStart: TDateTimePicker;
    Label5: TLabel;
    tmEnd: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure bbRefreshClick(Sender: TObject);
    procedure cbKassaCloseUp(Sender: TObject);

  private

  public

  end;

var RepKassirSumm1F:TRepKassirSumm1F;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TRepKassirSumm1F.FormCreate(Sender:TObject);
var i:Integer;
 begin
  Caption:=MFC;
  DM.Qr.Close;
  DM.Qr.SQL.Text:='select id_kassa from ArhCheks group by id_kassa order by id_kassa';
  DM.Qr.Open;
  cbKassa.Clear;
  cbKassa.Items.Add('Все');
  for i:=1 to DM.Qr.RecordCount do
   begin
    if i=1 then DM.Qr.First else DM.Qr.Next;
    cbKassa.Items.Add(DM.Qr.FieldByName('id_kassa').AsString);
   end;
  cbKassa.ItemIndex:=0;

  ComboBox2.ItemIndex:=StrToInt(FormatDateTime('mm',Date()))-1;
  ComboBox2Change(ComboBox2);
  dtEnd.Date:=Date;

 //  bbRefreshClick(bbRefresh);
 end;

procedure TRepKassirSumm1F.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TRepKassirSumm1F.ComboBox2Change(Sender:TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    dtStart.Date:=D1;
    dtEnd.Date:=D31;
    bbRefreshClick(bbRefresh);
   end;
 end;

procedure TRepKassirSumm1F.bbRefreshClick(Sender:TObject);
 begin
  try

{
   DM.QrKSumm.Close;
   DM.QrKSumm.SQl.Text:='exec spY_CalcViruch '+IntToStr(Prm.ID_Gamma)+','''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+'''';
   DM.QrKSumm.Open;
}

   if (dtStart.Date<Date-xM) and (Prm.UserRole<>R_ADMIN) then
    begin
     dtStart.Date:=StrToDate(DateToStr(Date-xM));
     MainF.MessBox('Вы не можете выбрать дату меньше чем '+DateToStr(Date-xM));
     Exit;
    end;

   DM.QrKSumm1.SQL.Clear;
   DM.QrKSumm1.SQL.Add('declare @DtStart datetime, ');
   DM.QrKSumm1.SQL.Add('        @DtEnd datetime ');

   DM.QrKSumm1.SQL.Add('set @DtStart='''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+' 00:00:00'' ');
   DM.QrKSumm1.SQL.Add('set @DtEnd='''+FormatDateTime('yyyy-mm-dd',dtEnd.Date)+' 23:59:59'' ');

   DM.QrKSumm1.SQL.Add('select Users,Sum(a.kol*a.cena)-IsNull(Sum(a.SumSkd),0) as Summa,Count(distinct a.guid) as Cnt  ');
   DM.QrKSumm1.SQL.Add('from ArhCheks a (nolock) ');
   DM.QrKSumm1.SQL.Add('      inner join ');
   DM.QrKSumm1.SQL.Add('     SprUser s (nolock) on s.id=a.id_user ');

   DM.QrKSumm1.SQL.Add('where a.date_chek between @DtStart and @DtEnd  ');

   if CheckBox1.Checked then
    begin
     DM.QrKSumm1.SQL.Add(' and (convert(varchar,a.date_chek,8)>=''21:00:00'' or    ');
     DM.QrKSumm1.SQL.Add('      convert(varchar,a.date_chek,8)<=''08:00:00''   )   ');
    end else begin
              if tmStart.Time>tmEnd.Time then
               begin
                DM.QrKSumm1.SQL.Add(' and (convert(varchar,a.date_chek,8)>='''+FormatDateTime('hh:nn:ss',tmStart.Date)+''' or    ');
                DM.QrKSumm1.SQL.Add('      convert(varchar,a.date_chek,8)<='''+FormatDateTime('hh:nn:ss',tmEnd.Date)+'''   )   ');
               end else begin
                         DM.QrKSumm1.SQL.Add(' and (convert(varchar,a.date_chek,8)>='''+FormatDateTime('hh:nn:ss',tmStart.Date)+''' and    ');
                         DM.QrKSumm1.SQL.Add('      convert(varchar,a.date_chek,8)<='''+FormatDateTime('hh:nn:ss',tmEnd.Date)+'''   )   ');
                        end;
             end;

   if CheckBox3.Checked then
    begin
     DM.QrKSumm1.SQL.Add(' and a.kol>0   ');
    end;

   if cbKassa.ItemIndex>0 then
    DM.QrKSumm1.SQL.Add(' and a.id_kassa='+cbKassa.Text);

   DM.QrKSumm1.SQL.Add('group by Users ');
   DM.QrKSumm1.SQL.Add('order by 2 ');
//   DM.QrKSumm1.SQL.SaveToFile('C:\log\RepKass.txt');
   DM.QrKSumm1.Open;

  except
   on E:Exception do
    begin
     MainF.MessBox('Ошибка выполнения запроса: '+E.Message);
    end;
  end;
 end;

procedure TRepKassirSumm1F.cbKassaCloseUp(Sender: TObject);
 begin
  bbRefreshClick(bbRefresh);
 end;

end.
