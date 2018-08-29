unit RepKassirSummU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Util, Grids, DBGrids;

type
  TRepKassirSummF = class(TForm)
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
    CheckBox2: TCheckBox;
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

var RepKassirSummF:TRepKassirSummF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TRepKassirSummF.FormCreate(Sender:TObject);
var i:Integer;
 begin
  Caption:=MFC;
  ComboBox2.ItemIndex:=StrToInt(FormatDateTime('mm',Date()))-1;
  ComboBox2Change(ComboBox2);
  dtEnd.Date:=Date;
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

  bbRefreshClick(bbRefresh);
 end;

procedure TRepKassirSummF.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TRepKassirSummF.ComboBox2Change(Sender:TObject);
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

procedure TRepKassirSummF.bbRefreshClick(Sender:TObject);
 begin
  try

   DM.QrKSumm.Close;
   DM.QrKSumm.SQl.Text:='exec spY_CalcViruch '+IntToStr(Prm.ID_Gamma)+','''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+'''';
   DM.QrKSumm.Open;

{
   if (dtStart.Date<Date-xM) and (Prm.UserRole<>R_ADMIN) then
    begin
     dtStart.Date:=StrToDate(DateToStr(Date-xM));
     MainF.MessBox('Вы не можете выбрать дату меньше чем '+DateToStr(Date-xM));
     Exit;
    end;

   DM.QrKSumm.SQL.Clear;
   DM.QrKSumm.SQL.Add('select Users,Sum(a.kol*a.cena)-IsNull(Sum(a.SumSkd),0) as Summa,b.cnt ');
   DM.QrKSumm.SQL.Add('from SprUser s,ArhCheks a,                                                                     ');
   DM.QrKSumm.SQL.Add('     (select id_user,Count(*) as cnt from           ');
   DM.QrKSumm.SQL.Add('     (select id_user,numb_chek,id_kassa             ');
   DM.QrKSumm.SQL.Add('      from ArhCheks                                 ');
   DM.QrKSumm.SQL.Add('      where date_chek>='''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+' 00:00:00'' and    ');
   DM.QrKSumm.SQL.Add('            date_chek<='''+FormatDateTime('yyyy-mm-dd',dtEnd.Date)+' 23:59:59''        ');
   DM.QrKSumm.SQL.Add('      group by id_user,numb_chek,id_kassa) aa       ');
   DM.QrKSumm.SQL.Add('     group by id_user) b                            ');

   DM.QrKSumm.SQL.Add('where s.id=a.id_user and                                                                      ');
   DM.QrKSumm.SQL.Add('      a.date_chek>='''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+' 00:00:00'' and             ');
   DM.QrKSumm.SQL.Add('      a.date_chek<='''+FormatDateTime('yyyy-mm-dd',dtEnd.Date)+' 23:59:59'' and a.id_user=b.id_user ');

   if CheckBox1.Checked then
    begin
     DM.QrKSumm.SQL.Add(' and (convert(varchar,a.date_chek,8)>=''21:00:00'' or    ');
     DM.QrKSumm.SQL.Add('      convert(varchar,a.date_chek,8)<=''08:00:00''   )   ');
    end else begin
              if tmStart.Time>tmEnd.Time then
               begin
                DM.QrKSumm.SQL.Add(' and (convert(varchar,a.date_chek,8)>='''+FormatDateTime('hh:nn:ss',tmStart.Date)+''' or    ');
                DM.QrKSumm.SQL.Add('      convert(varchar,a.date_chek,8)<='''+FormatDateTime('hh:nn:ss',tmEnd.Date)+'''   )   ');
               end else begin
                         DM.QrKSumm.SQL.Add(' and (convert(varchar,a.date_chek,8)>='''+FormatDateTime('hh:nn:ss',tmStart.Date)+''' and    ');
                         DM.QrKSumm.SQL.Add('      convert(varchar,a.date_chek,8)<='''+FormatDateTime('hh:nn:ss',tmEnd.Date)+'''   )   ');
                        end;
             end;

   if CheckBox2.Checked then
    begin
     DM.QrKSumm.SQL.Add(' and a.kod_name not in (select kod_name from SprTov ss, SprTer st where ss.art_code=st.art_code and IsNull(st.vip,0)=1 group by kod_name)   ');
    end;

   if CheckBox3.Checked then
    begin
     DM.QrKSumm.SQL.Add(' and a.kol>0   ');
    end;

   if cbKassa.ItemIndex>0 then
    DM.QrKSumm.SQL.Add(' and a.id_kassa='+cbKassa.Text);

   DM.QrKSumm.SQL.Add('group by Users,b.cnt                                                                                ');
   DM.QrKSumm.SQL.Add('order by 2                                                                                    ');
   DM.QrKSumm.Open;
   }
  except
   on E:Exception do
    begin
     MainF.MessBox('Ошибка выполнения запроса: '+E.Message);
    end; 
  end;
 end;

procedure TRepKassirSummF.cbKassaCloseUp(Sender: TObject);
 begin
  bbRefreshClick(bbRefresh);
 end;

end.
