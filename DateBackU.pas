unit DateBackU;

interface

uses
  {Windows, Messages, }SysUtils, Variants, Classes, Graphics, Controls, Forms,
  {Dialogs, }ComCtrls, StdCtrls, Buttons, ExtCtrls, {Util, }Grids, DBGrids,
  DBCtrls, DateUtils, Types;

type
  TDateBackF = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label2:TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    ComboBox1: TComboBox;
    edDescr: TMemo;
    Label5: TLabel;
    Panel3: TPanel;
    Label6: TLabel;
    dtNakl: TDateTimePicker;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    lbNakl: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox2: TComboBox;
    Label10: TLabel;
    DBGrid2: TDBGrid;
    DBMemo1: TDBMemo;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
    procedure dtNaklCloseUp(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);

  private

    FIO1,FIO2:String;
    procedure RadioButtonClick(Sender:TObject);
    function GetPaAsswV: Int64;

  public

    FRb:Array of TRadioButton;

    Flag:Integer;
    Ex:Boolean;

    property PasswV:Int64 read GetPaAsswV;

  end;

var DateBackF:TDateBackF;

implementation

uses
  MainU, DataModuleU, WorkSprU;

{$R *.dfm}

// Create формы
procedure TDateBackF.FormCreate(Sender:TObject);
var i,CA:Integer;
 begin
  Ex:=True;
  Caption:=MFC;
  Flag:=-1;
  dtNakl.Date:=Date;
  dtNaklCloseUp(dtNakl);
  try
   SetLength(FRb,0);
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from SprPrVozr where Vis=1 order by id';
   DM.Qr.Open;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     CA:=High(FRb)+1; SetLength(FRb,CA+1);
     FRb[CA]:=TRadiobutton.Create(Self);
     FRb[CA].Parent:=Panel2;
     FRb[CA].Width:=170;
     FRb[CA].Caption:=DM.Qr.FieldByName('Descr').AsString;
     FRb[CA].Tag:=DM.Qr.FieldByName('ID').AsInteger;
     FRb[CA].Left:=15;
     FRb[CA].Top:=(i-1)*18+25;
     FRb[CA].Enabled:=False;
     FRb[CA].OnClick:=RadioButtonClick;
    end;

   DM.qrMess1.Close;
   DM.qrMess1.SQL.Text:='select id,Mess,DateM ,(select top 1 Users from SprUser s where s.id_gamma=j.id_from) as users from Inform..JMess j where (IsNull(id_dest,-1) in (-1,-2,'+IntToStr(Prm.ID_Gamma)+') ) order by DateM desc';
   DM.qrMess1.Open;

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from SprFIOVozr order by Tp,FIO';
   DM.Qr.Open;

   FIO1:=' '; FIO2:=' ';
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     if DM.Qr.FieldByName('Tp').AsInteger=1 then FIO1:=FIO1+#10+DM.Qr.FieldByName('fio').AsString else
     if DM.Qr.FieldByName('Tp').AsInteger=2 then FIO2:=FIO2+#10+DM.Qr.FieldByName('fio').AsString;
    end;

  except
   on E:Exception do MainF.MessBox('Ошибка формирования списка причин возвратов: '+E.Message);
  end;
 end; {FormCreate}

// Кнопка Отмена
procedure TDateBackF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end; {BitBtn2Click}

// Кнопка ОК
procedure TDateBackF.BitBtn1Click(Sender: TObject);
var i:Integer;
 begin
  Flag:=-1;

  for i:=Low(FRb) to High(FRb) do
   if FRb[i].Checked then
    begin
     if FRb[i].Tag=9 then
      if Not MainF.IsPermit([R_PROVIZ],P_ALERT) then Exit;

     if (FRb[i].Tag in [3]) and (edDescr.Lines.Text='') then
      begin
       MainF.MessBox('Для типа возрата "Брак" необходимо заполнить поле "Основание для возврата"');
       edDescr.SetFocus;
       Exit;
      end else
     if (FRb[i].Tag in [18]) and (edDescr.Lines.Text='') then
      begin
       MainF.MessBox('Для типа возрата "Курьер" необходимо заполнить поле "Основание для возврата"');
       edDescr.SetFocus;
       Exit;
      end else
     if (FRb[i].Tag in [1]) and (Edit1.Text='') then
      begin
       MainF.MessBox('Для типа возрата "Дефектура" необходимо заполнить поле "По чьему звонку сделан возврат"');
       Edit1.SetFocus;
       Exit;
      end else
     if (FRb[i].Tag in [0,1,3,4,5,6,7,8]) and (ComboBox1.Text='') then
      begin
       MainF.MessBox('Для типа возрата "'+FRb[i].Caption+'" необходимо заполнить поле "По чему распоряжению сделан возврат"');
       ComboBox1.SetFocus;
       Exit;
      end else
     if (FRb[i].Tag in [4,5,6,7,8]) and (Label12.Caption='') and (Prm.IsKurier=False) then
      begin
       MainF.MessBox('Для типа возрата "'+FRb[i].Caption+'" необходимо выбрать сообщение по которому делался возврат!');
       DBGrid2.SetFocus;
       Exit;
      end else
     if (FRb[i].Tag in [0]) and (lbNakl.Caption='') then
      begin
       MainF.MessBox('Для типа возрата "По акту" необходимо выбрать дату накладной и двойным щелчком мыши выбрать номер накладной из списка накладных!');
       DBGrid1.SetFocus;
       Exit;
      end else
     if (FRb[i].Tag in [0]) and (ComboBox2.Text='') then
      begin
       MainF.MessBox('Для типа возрата "По акту" необходимо выбрать есть или нет акт несоответсвия со склада!');
       ComboBox2.SetFocus;
       Exit;
      end else
     if FRb[i].Tag=2 then
      try
       DM.QrEx1.Close;
       DM.QrEx1.SQL.Clear;
       DM.QrEx1.SQL.Add('if Object_ID(N''tempdb..#tmp_c'') is not null drop table #tmp_c');
       DM.QrEx1.SQL.Add('select art_code,names into #tmp_c from Chek where compname=host_name() and id_user='+IntToStr(Prm.UserID)+' and ');
       DM.QrEx1.SQL.Add('art_code in     (select art_code from Moves a, SprTov b where a.kod_name=b.kod_name and a.debcrd=1 and a.nn_nakl not like ''%пр-%'' and a.date_nakl>getdate()-30 ) and');
       DM.QrEx1.SQL.Add('art_code not in (select art_code from ArhCheks a, SprTov b where a.kod_name=b.kod_name and a.date_chek>getdate()-30)');
       DM.QrEx1.SQL.Add('group by art_code,names');
       DM.QrEx1.SQL.Add('order by names');
       DM.QrEx1.SQL.Add('update Chek set printing=printing+10 where printing<2 and art_code in (select art_code from #tmp_c)');
       DM.QrEx1.SQL.Add('select * from #tmp_c');
       DM.QrEx1.Open;
       if Not DM.QrEx1.IsEmpty then
        begin
         Flag:=-2;
         Close;
         Exit;
        end;
      except
       MainF.MessBox('Ошибка проверки параметров возврата!');
       Exit;
      end;

     if Not (FRb[i].Tag in [0,1,3,18,19,20]) then  // Типы возвратов, для которых не нужен пароль
      begin
       if Not MainF.CheckPassword(IntToStr(PasswV)) then Exit else
        begin
         DM.QrEx1.Close;
         DM.QrEx1.SQL.Text:='select IsNull(DtEnd,getdate()+100) as DtEnd from SprPrVozr where id='+IntToStr(FRb[i].Tag);
         DM.QrEx1.Open;

         if Date>EndOfTheDay(DM.QrEx1.FieldByName('DtEnd').AsDateTime) then
          begin
           MainF.MessBox('Срок действия пароля истек!');
           Exit;
          end;

        end;
      end;

     Ex:=False;
     Flag:=WorkSprF.PrVozr;
     Close;
     Break;
    end;
  if Flag=-1 then MainF.MessBox('Выберите причину возврата!')
 end; {BitBtn1Click}

procedure TDateBackF.RadioButtonClick(Sender:TObject);
 begin
  Label12.Tag:=-1;
  Label12.Caption:='';
  Label13.Caption:='';


  Label3.Enabled:=TRadioButton(Sender).Tag=1;
  Edit1.Enabled:=TRadioButton(Sender).Tag=1;

  Label4.Enabled:=TRadioButton(Sender).Tag in [0,1,3,4,5,6,7,8];
  ComboBox1.Enabled:=TRadioButton(Sender).Tag in [0,1,3,4,5,6,7,8];

  Label5.Visible:=TRadioButton(Sender).Tag=3;
//  Panel3.Enabled:=TRadioButton(Sender).Tag=0;

  dtNakl.Enabled:=TRadioButton(Sender).Tag=0;
  DBGrid1.Enabled:=TRadioButton(Sender).Tag=0;
  Label6.Enabled:=TRadioButton(Sender).Tag=0;
  lbNakl.Enabled:=TRadioButton(Sender).Tag=0;
  Label7.Enabled:=TRadioButton(Sender).Tag=0;
  Label8.Enabled:=TRadioButton(Sender).Tag=0;
  Label9.Enabled:=TRadioButton(Sender).Tag=0;

  DBGrid2.Enabled:=TRadioButton(Sender).Tag in [4,5,6,7,8];
  Label10.Enabled:=DBGrid2.Enabled;
  Label11.Enabled:=DBGrid2.Enabled;
  Label12.Enabled:=DBGrid2.Enabled;
  Label13.Enabled:=DBGrid2.Enabled;

  ComboBox1.Clear;
  if TRadioButton(Sender).Tag in [0,3,4,5,6,7,8] then ComboBox1.Items.Text:=FIO2 else
  if TRadioButton(Sender).Tag in [1] then ComboBox1.Items.Text:=FIO1;
{  if TRadioButton(Sender).Tag in [0,3,4,5,6,7,8] then
   begin
    ComboBox1.Items.Add('Николенко Е. В.');
    ComboBox1.Items.Add('Павленко Т. А.');
    ComboBox1.Items.Add('Латышева О. П.');
    ComboBox1.Items.Add('Бондаренко Н. А.');
   end else
  if TRadioButton(Sender).Tag in [1] then
   begin
    ComboBox1.Items.Add('Даниелян А. С.');
    ComboBox1.Items.Add('Даниелян С. А.');
    ComboBox1.Items.Add('Григорян А. А.');
   end;
}
  DBMemo1.Enabled:=DBGrid2.Enabled;
 end;

procedure TDateBackF.dtNaklCloseUp(Sender: TObject);
 begin
  try
   DM.qrN.Close;
   DM.qrN.SQL.Text:='select nn_nakl from Jmoves where type_nakl=1 and nn_nakl not like ''%пр-%'' and date_nakl='''+FormatDateTime('yyyy-mm-dd',dtNakl.Date)+' 00:00:00''';
   DM.qrN.Open;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования списка накладных: '+E.Message);
  end;
 end;

procedure TDateBackF.DBGrid1DblClick(Sender: TObject);
 begin
  if DM.qrN.IsEmpty then Exit;
  lbNakl.Caption:=DM.qrN.FieldByName('nn_nakl').AsString;
 end;

procedure TDateBackF.DBGrid2DblClick(Sender: TObject);
 begin
  Label12.Caption:=' ';
  if DM.qrMess1.IsEmpty then Exit else
   begin
    Label12.Caption:=DM.qrMess1.FieldByName('mess').AsString; Label12.Tag:=DM.qrMess1.FieldByName('id').AsInteger;
    Label13.Caption:='от '+DateTimeToStr(DM.qrMess1.FieldByName('datem').AsDateTime)+' от '+DM.qrMess1.FieldByName('users').AsString;
    DBGrid2.Repaint;
   end;
 end;

procedure TDateBackF.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if gdSelected in State then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end else
  if db.DataSource.DataSet.FieldByName('id').AsInteger=Label12.Tag then db.Canvas.Brush.Color:=$00FFECC4;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

function TDateBackF.GetPaAsswV:Int64;
var Num,i:Integer;

 begin
  try
   Num:=-1;
   for i:=Low(FRb) to High(FRb) do
    if FRb[i].Checked then begin Num:=FRb[i].Tag; Break; end;
   if Num=-1 then Abort;
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select Passw from SprPrVozr where id='+IntToStr(Num);
   DM.QrEx.Open;
   Result:=DM.QrEx.FieldByName('Passw').AsInteger;
{   Case Num of
    0:Result:=1000;
    1:Result:=1111;
    2:Result:=1222;
    3:Result:=1333;
    4:Result:=1444;
    5:Result:=1555;
    6:Result:=1666;
    7:Result:=1777;
    8:Result:=1888;
    9:Result:=1999;
   end;
}
  except
   Result:=0;
  end;
 end;

procedure TDateBackF.FormActivate(Sender: TObject);
var i:Integer;
 begin
  for i:=Low(FRb) to High(FRb) do
   if FRb[i].Tag=WorkSprF.PrVozr then
    begin
     FRb[i].Checked:=True;
     FRb[i].OnClick(FRb[i]);
    end;
 end;

end.
