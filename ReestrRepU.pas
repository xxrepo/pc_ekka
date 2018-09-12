unit ReestrRepU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ComCtrls, Buttons, PrintReport, Util;

type
  TReestrRepF = class(TForm)
    Label1: TLabel;
    dtStart: TDateTimePicker;
    Label2: TLabel;
    dtEnd: TDateTimePicker;
    ComboBox1: TComboBox;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label8: TLabel;
    ComboBox2: TComboBox;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    ComboBox3: TComboBox;
    
    procedure FormCreate(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure ComboBox2Change(Sender:TObject);
    procedure BitBtn3Click(Sender: TObject);

  private

  public

  end;

var ReestrRepF: TReestrRepF;

implementation

uses MainU, DataModuleU, DB;

{$R *.dfm}

procedure TReestrRepF.FormCreate(Sender: TObject);
var i:Integer;
 begin
  Caption:=MFC;

  ComboBox2.ItemIndex:=StrToInt(FormatDateTime('mm',Date()))-1;
  ComboBox2Change(ComboBox2);
  dtEnd.Date:=Date;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select MedName from SprMED order by MedName ';
  DM.QrEx.Open;

  ComboBox1.Clear;
  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    ComboBox1.Items.Add(DM.QrEx.FieldByName('MedName').AsString);
   end;
  ComboBox1.ItemIndex:=-1;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select Descr from SprMnnDL group by Descr order by Descr ';
  DM.QrEx.Open;

  ComboBox3.Clear;
  ComboBox3.Items.Add('Все');
  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    ComboBox3.Items.Add(DM.QrEx.FieldByName('Descr').AsString);
   end;
  ComboBox3.ItemIndex:=0;
 end;

procedure TReestrRepF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TReestrRepF.BitBtn2Click(Sender: TObject);
var Tb:TTableObj;
    Rc,i,j:Integer;
    SummAll,SumNDS:Currency;
    ss,s1,MedNameRep:String;
 begin
  if ComboBox1.Text='' then
   begin
    MainF.MessBox('Выберите поликлинику!');
    Exit;
   end;

  if CheckBox1.Checked then ss:='0' else ss:='1';

  if ComboBox3.ItemIndex<=0 then s1:='' else s1:=ComboBox3.Text;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select top 1 MedNameRep from SprMed where MedName='''+CorrSQLString1(ComboBox1.Text)+'''';
  DM.QrEx.Open;
  MedNameRep:=DM.QrEx.FieldByName('MedNameRep').AsString;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='exec spY_ReestrRep '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''','''+CorrSQLString1(ComboBox1.Text)+''',1,'+ss+','''+s1+'''';
//  DM.QrEx.SQL.SaveToFile('c:\log\Reestr.txt');
  DM.QrEx.Open;

  Rc:=DM.QrEx.RecordCount;

  With PrintRep do
   begin
    Clear;
    SetDefault;
    Orientation:=O_LANDS;
    Font.Size:=5;
    Align:=AL_CENTER;
    AddTable(2,6);
    Tb:=LastTable;
    Tb.SetWidths('17000,10000');

    Tb.Cell[2,1].AddText('Додаток');
    Tb.Cell[2,2].AddText('до Порядку відшкодування вартості лікарських');
    Tb.Cell[2,3].AddText('засобів для лікування серцево-судинних');
    Tb.Cell[2,4].AddText('захворювань, цукрового діабету II типу,');
    Tb.Cell[2,5].AddText('бронхіальної астми та визначення розміру');
    Tb.Cell[2,6].AddText('відшкодування вартості таких лікарських засобів');

    Tb.SetBorders(1,1,2,6,EMPTY_BORDER);
    AddText(#10#10);
    if ComboBox1.Text='КЗОЗ "Харківська міська поліклініка №22"' then
     AddText('ЗВІТ (РЕЄСТР) від 07.06.17 р.'#10)
    else
     AddText('ЗВІТ'#10);

    AddText('за період з '+DateToStr(dtStart.Date)+' по '+DateToStr(dtEnd.Date)+#10);
    AddText(Prm.FirmNameUA+' '+MainF.Address+ #10);
    AddText('про відпущені лікарські засоби, вартість яких підлягає повному або частковому відшкодуванню,'#10);
    AddText('за рецептами '+MedNameRep+#10);
    if ComboBox1.Text='КЗОЗ "Харківська міська поліклініка №22"' then
     begin
      Case Prm.FirmID of
       1:AddText('відповідно до договору №5/ДЛ від 15.05.17 р.'#10#10);
       6:AddText('відповідно до договору №4/ДЛ від 15.05.17 р.'#10#10);
      end
     end else AddText('відповідно до договору _____________________________________'#10#10);

    Font.Size:=4;
    AddTable(13,Rc+5);
    Tb:=LastTable;
    Tb.SetWidths('150,175,165,420,350,150,290,200,200,200,300,200,400');

    Tb.Cell[1,1].AddText('Поряд- ковий номер');
    Tb.Cell[2,1].AddText('Дата відпуску');
    Tb.Cell[3,1].AddText('Номер рецепта');
    Tb.Cell[4,1].AddText('Міжнародна непатенто- вана назва лікарського засобу');
    Tb.Cell[5,1].AddText('Торгова назва лікарського засобу');
    Tb.Cell[6,1].AddText('Сила дії (дозу- вання)');
    Tb.Cell[7,1].AddText('Форма випуску');
    Tb.Cell[8,1].AddText('Кількість одиниць лікарської форми відповід- ної дози в упаковці');
    Tb.Cell[9,1].AddText('Кількість відпу- щених упаковок');
    Tb.Cell[10,1].AddText('Фактична роздрібна ціна реалізації упаковки');
    Tb.Cell[11,1].AddText('Розмір відшкодування вартості лікарського засобу за упаковку');
    Tb.Cell[12,1].AddText('Сума відшко- дування');
    Tb.Cell[13,1].AddText('Лікар, що виписав рецепт');

    for i:=1 to 13 do
     begin
      Tb.Cell[i,2].Align:=AL_CENTER;
      Tb.Cell[i,2].AddText(IntToStr(i));
     end;
     
    SummAll:=0;
    for i:=1 to Rc do
     begin
      if i=1 then DM.QrEx.First else DM.QrEx.Next;
      Tb.Cell[1,i+2].AddText(IntToStr(i));

      Tb.Cell[2,i+2].AddText(DM.QrEx.FieldByName('date_chek').AsString);
      Tb.Cell[3,i+2].AddText(DM.QrEx.FieldByName('NumRecipt').AsString);
      Tb.Cell[4,i+2].AddText(DM.QrEx.FieldByName('mnn').AsString);
      Tb.Cell[5,i+2].AddText(DM.QrEx.FieldByName('mtn').AsString);
      Tb.Cell[6,i+2].AddText(DM.QrEx.FieldByName('sostav').AsString);
      Tb.Cell[7,i+2].AddText(DM.QrEx.FieldByName('FormaEN').AsString);
      Tb.Cell[8,i+2].AddText(DM.QrEx.FieldByName('upak').AsString);
      Tb.Cell[9,i+2].AddText(DM.QrEx.FieldByName('KolUp').AsString);
      Tb.Cell[10,i+2].AddText(DM.QrEx.FieldByName('CenaUp').AsString);
      Tb.Cell[11,i+2].AddText(DM.QrEx.FieldByName('Sum_Compens').AsString);
      Tb.Cell[12,i+2].AddText(DM.QrEx.FieldByName('Sum2').AsString);
      Tb.Cell[13,i+2].AddText(DM.QrEx.FieldByName('FIODoctor').AsString);

      SummAll:=SummAll+DM.QrEx.FieldByName('Sum2').AsCurrency;
     end;
    SumNDS:=SummAll/(107/7);
    Tb.Cell[11,Rc+3].Align:=AL_LEFT; Tb.Cell[11,Rc+3].AddText('Сума без ПДВ'); Tb.Cell[12,Rc+3].Font.Style:=[fsBold]; Tb.Cell[12,Rc+3].AddText(CurrToStrF(SummAll-SumNDS,ffFixed,2));
    Tb.Cell[11,Rc+4].Align:=AL_LEFT; Tb.Cell[11,Rc+4].AddText('ПДВ 7%');       Tb.Cell[12,Rc+4].Font.Style:=[fsBold]; Tb.Cell[12,Rc+4].AddText(CurrToStrF(SumNDS,ffFixed,2));
    Tb.Cell[11,Rc+5].Align:=AL_LEFT; Tb.Cell[11,Rc+5].AddText('Сумма з ПДВ');  Tb.Cell[12,Rc+5].Font.Style:=[fsBold]; Tb.Cell[12,Rc+5].AddText(CurrToStrF(SummAll,ffFixed,2));

    for i:=1 to 13 do
     begin
      Tb.Cell[i,Rc+3].LeftBorder:=EMPTY_BORDER; Tb.Cell[i,Rc+3].BottomBorder:=EMPTY_BORDER;
      Tb.Cell[i,Rc+4].LeftBorder:=EMPTY_BORDER; Tb.Cell[i,Rc+4].BottomBorder:=EMPTY_BORDER;
      Tb.Cell[i,Rc+5].LeftBorder:=EMPTY_BORDER; Tb.Cell[i,Rc+5].BottomBorder:=EMPTY_BORDER;
     end;

    Tb.Cell[13,Rc+3].RightBorder:=EMPTY_BORDER;
    Tb.Cell[13,Rc+4].RightBorder:=EMPTY_BORDER;
    Tb.Cell[13,Rc+5].RightBorder:=EMPTY_BORDER;

    AddText(#10);

    Align:=AL_LEFT;
    Font.Size:=5;
    AddText('Сума відшкодування: '+CurrToWordsUA(SummAll,0)+#10);

    AddTable(2,1);
    Tb:=LastTable;
    Tb.SetWidths('10000,10000');
//    Tb.Cell[1,1].AddText(Prm.FirmNameUA+#10#10);
    Tb.Cell[1,1].AddText(#10#10+'Завідувач аптеки '+Prm.ZavApteki);

{
    Tb.Cell[1,1].AddText('Головний бухгалтер ___________________________ '#10#10);
    Tb.Cell[1,1].AddText('Директор___________________________'#10);
}
 {
    Tb.Cell[2,1].AddText(ComboBox1.Text+#10#10);
    Tb.Cell[2,1].AddText('Головний бухгалтер___________________________'#10#10);
    Tb.Cell[2,1].AddText('Головний лiкар ___________________________ '#10);
 }
    Tb.SetBorders(1,1,2,1,EMPTY_BORDER);
    PreView;
   end;
 end;

procedure TReestrRepF.ComboBox2Change(Sender: TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    dtStart.Date:=D1;
    dtEnd.Date:=D31;
   end;
 end;

procedure TReestrRepF.BitBtn3Click(Sender: TObject);
var ss:String;
 begin
  if ComboBox1.Text='' then
   begin
    MainF.MessBox('Выберите поликлинику!');
    Exit;
   end;

  if CheckBox1.Checked then ss:='0' else ss:='1';

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='exec spY_ReestrRep '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''','''+CorrSQLString1(ComboBox1.Text)+''',2,'+ss;
  DM.QrEx.Open;

  With PrintRep do
   begin
    Clear;
    SetDefault;
//    Orientation:=O_LANDS;
    Font.Name:='Arial';
    Font.Size:=4;
    Align:=AL_LEFT;
    AddText(ComboBox1.Text+#10);
    AddText('за період з '+DateToStr(dtStart.Date)+' по '+DateToStr(dtEnd.Date)+#10#10);
    Qr:=DM.QrEx;
    PrintTable(False,0,0);
    PreView;
   end;
 end;

end.

{
procedure TTovRepF.BitBtn28Click(Sender:TObject);
var Exl:Variant;
    q,q1,i,j:Integer;
    sA:String;
    SummAll,SumNDS:Currency;
 begin

  if (edApteka.Tag=0) and (CheckBox6.Checked) then
   begin
    MainF.MessBox('Аптека не выбрана!');
    Exit;
   end;

  if ComboBox5.Text='' then
   begin
    MainF.MessBox('Поликлиника не выбрана!');
    Exit;
   end;

  q:=15;

  if CheckBox6.Checked then sA:=IntToStr(edApteka.Tag) else sA:='0';

  DM.Qr.Close;
//  DM.Qr.SQL.Text:='exec spY_ReestrRep '+IntToStr(edApteka.Tag)+','''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''',''''+ComboBox5.Text+'''';
  DM.Qr.SQL.Text:='exec spY_ReestrRep '+sA+','''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''','''+ComboBox5.Text+''','+IntToStr(ComboBox6.ItemIndex);
  DM.Qr.Open;

//  if DM.Qr.IsEmpty then Exit;

  Exl:=CreateOleObject('Excel.Application');
  try
   Exl.Visible:=True;
   Exl.DisplayAlerts:=False;
   Exl.Workbooks.Add;
   Exl.WorkBooks[1].Sheets[1].Activate;

   Exl.WorkBooks[1].Sheets[1].Range['I1:M6'].HorizontalAlignment:=xlCenter;

   Exl.WorkBooks[1].Sheets[1].Range['I1:M1'].Merge;
   Exl.WorkBooks[1].Sheets[1].Range['I2:M2'].Merge;
   Exl.WorkBooks[1].Sheets[1].Range['I3:M3'].Merge;
   Exl.WorkBooks[1].Sheets[1].Range['I4:M4'].Merge;
   Exl.WorkBooks[1].Sheets[1].Range['I5:M5'].Merge;
   Exl.WorkBooks[1].Sheets[1].Range['I6:M6'].Merge;

   Exl.WorkBooks[1].Sheets[1].Cells[1,9]:='Додаток';
   Exl.WorkBooks[1].Sheets[1].Cells[2,9]:='до Порядку відшкодування вартості лікарських';
   Exl.WorkBooks[1].Sheets[1].Cells[3,9]:='засобів для лікування серцево-судинних';
   Exl.WorkBooks[1].Sheets[1].Cells[4,9]:='захворювань, цукрового діабету II типу,';
   Exl.WorkBooks[1].Sheets[1].Cells[5,9]:='бронхіальної астми та визначення розміру';
   Exl.WorkBooks[1].Sheets[1].Cells[6,9]:='відшкодування вартості таких лікарських засобів';

   Exl.WorkBooks[1].Sheets[1].Range['A8:M13'].HorizontalAlignment:=xlCenter;
   Exl.WorkBooks[1].Sheets[1].Range['A1:M13'].Font.Name:='Times New Roman';

   Exl.WorkBooks[1].Sheets[1].Range['A8:M8'].Merge;
   Exl.WorkBooks[1].Sheets[1].Range['A9:M9'].Merge;
   Exl.WorkBooks[1].Sheets[1].Range['A10:M10'].Merge;
   Exl.WorkBooks[1].Sheets[1].Range['A11:M11'].Merge;
   Exl.WorkBooks[1].Sheets[1].Range['A12:M12'].Merge;
   Exl.WorkBooks[1].Sheets[1].Range['A13:M13'].Merge;

   Exl.WorkBooks[1].Sheets[1].Cells[8,1]:='ЗВІТ';
   Exl.WorkBooks[1].Sheets[1].Cells[9,1]:='за період с '+DateToStr(dtStart.Date)+' по '+DateToStr(dtEnd.Date);
   Exl.WorkBooks[1].Sheets[1].Cells[10,1]:=Prm.FOP;

   Exl.WorkBooks[1].Sheets[1].Cells[11,1]:='про відпущені лікарські засоби, вартість яких підлягає повному або частковому відшкодуванню,';
   Exl.WorkBooks[1].Sheets[1].Cells[12,1]:='за рецептами '+ComboBox5.Text;
   Exl.WorkBooks[1].Sheets[1].Cells[13,1]:='відповідно до договору '+Prm.NDogovor;


   Exl.WorkBooks[1].Sheets[1].Rows[IntToStr(q)+':'+IntToStr(q)].RowHeight:=95;
   Exl.WorkBooks[1].Sheets[1].Range['A'+IntToStr(q)+':M'+IntToStr(q)].VerticalAlignment:=xlCenter;
   Exl.WorkBooks[1].Sheets[1].Range['A'+IntToStr(q)+':M'+IntToStr(q)].HorizontalAlignment:=xlCenter;
   Exl.WorkBooks[1].Sheets[1].Range['A'+IntToStr(q)+':M'+IntToStr(q)].WrapText:=True;
   Exl.WorkBooks[1].Sheets[1].Range['A'+IntToStr(q)+':M'+IntToStr(q)].Font.Name:='Times New Roman';
   Exl.WorkBooks[1].Sheets[1].Range['A'+IntToStr(q)+':M'+IntToStr(q)].Font.Size:=10;

   Exl.WorkBooks[1].Sheets[1].Cells[q,1]:='Порядковий номер';
   Exl.WorkBooks[1].Sheets[1].Cells[q,2]:='Дата відпуску';
   Exl.WorkBooks[1].Sheets[1].Cells[q,3]:='Номер рецепта';
   Exl.WorkBooks[1].Sheets[1].Cells[q,4]:='Міжнародна непатенто- вана назва лікарського засобу';
   Exl.WorkBooks[1].Sheets[1].Cells[q,5]:='Торгова назва лікарського засобу';
   Exl.WorkBooks[1].Sheets[1].Cells[q,6]:='Сила дії (дозу- вання)';
   Exl.WorkBooks[1].Sheets[1].Cells[q,7]:='Форма випуску';
   Exl.WorkBooks[1].Sheets[1].Cells[q,8]:='Кількість одиниць лікарської форми відповід- ної дози в упаковці';
   Exl.WorkBooks[1].Sheets[1].Cells[q,9]:='Кількість відпу- щених упаковок';
   Exl.WorkBooks[1].Sheets[1].Cells[q,10]:='Фактична роздрібна ціна реалізації упаковки';
   Exl.WorkBooks[1].Sheets[1].Cells[q,11]:='Розмір відшкодування вартості лікарського засобу за упаковку';
   Exl.WorkBooks[1].Sheets[1].Cells[q,12]:='Сума відшко- дування';
   Exl.WorkBooks[1].Sheets[1].Cells[q,13]:='Лікар, що виписав рецепт';

   SummAll:=0;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     Exl.WorkBooks[1].Sheets[1].Cells[q+i,1]:=IntToStr(i);

     for j:=1 to 12 do
      Exl.WorkBooks[1].Sheets[1].Cells[q+i,j+1]:=DM.Qr.Fields[j-1].AsString;
     SummAll:=SummAll+DM.Qr.FieldByName('SumCompens').AsCurrency;
    end;

   q1:=q+DM.Qr.RecordCount;

   Exl.WorkBooks[1].Sheets[1].Columns['A:M'].EntireColumn.AutoFit;
   Exl.WorkBooks[1].Sheets[1].Range['A'+IntToStr(q)+':M'+IntToStr(q1)].Borders.LineStyle:=1;
   Exl.WorkBooks[1].Sheets[1].Range['A'+IntToStr(q)+':M'+IntToStr(q1)].Borders.Weight:=2;
   Exl.WorkBooks[1].Sheets[1].Range['A'+IntToStr(q)+':M'+IntToStr(q1)].Borders.ColorIndex:=1;

   if CheckBox6.Checked then
    Exl.WorkBooks[1].Sheets[1].Cells[1,1]:=edApteka.Text;


   Exl.WorkBooks[1].Sheets[1].Cells[q1+1,10]:='Сумма з ПДВ';
   Exl.WorkBooks[1].Sheets[1].Cells[q1+2,10]:='ПДВ 7%';
   Exl.WorkBooks[1].Sheets[1].Cells[q1+3,10]:='Сума без ПДВ';


   SumNDS:=SummAll/(107/7);
   Exl.WorkBooks[1].Sheets[1].Cells[q1+1,12]:=CurrToStrF(SummAll,ffFixed,2);
   Exl.WorkBooks[1].Sheets[1].Cells[q1+2,12]:=CurrToStrF(SumNDS,ffFixed,2);
   Exl.WorkBooks[1].Sheets[1].Cells[q1+3,12]:=CurrToStrF(SummAll-SumNDS,ffFixed,2);

   Exl.WorkBooks[1].Sheets[1].Cells[q1+5,1]:='Сума відшкодування: '+CurrToWordsUA(SummAll,0);

   Exl.WorkBooks[1].Sheets[1].Cells[q1+9,1]:='Директор';
   Exl.WorkBooks[1].Sheets[1].Cells[q1+9,3]:='_________________________________';
   Exl.WorkBooks[1].Sheets[1].Cells[q1+9,5]:='Ракута C.М.';

//      Exl.WorkBooks[1].Sheets[1].Columns['A:J'].EntireColumn.AutoFit;
   Exl.WorkBooks[1].ActiveSheet.PageSetup.LeftMargin:=30;
   Exl.WorkBooks[1].ActiveSheet.PageSetup.RightMargin:=40;

   Exl.WorkBooks[1].ActiveSheet.PageSetup.TopMargin:=30;
   Exl.WorkBooks[1].ActiveSheet.PageSetup.BottomMargin:=30;

   Exl.WorkBooks[1].ActiveSheet.PageSetup.Orientation:=xlLandscape;
   Exl.WorkBooks[1].ActiveSheet.PageSetup.FitToPagesWide:=1;
   Exl.WorkBooks[1].ActiveSheet.PageSetup.FitToPagesTall:=1000;
   Exl.WorkBooks[1].ActiveSheet.PageSetup.Zoom:=False;

  except
   Exl.WorkBooks.Close;
  end;
 end;

}
