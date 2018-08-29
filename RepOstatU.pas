unit RepOstatU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Buttons, PrintReport, Menus, Util, ComObj,  Excel97 ;

type TRepOstatF = class(TForm)
       Panel1: TPanel;
       BitBtn1: TBitBtn;
       rb1: TRadioButton;
       rb2: TRadioButton;
       Label1: TLabel;
       Edit1: TEdit;
       Edit2: TEdit;
       BitBtn2: TBitBtn;
       cbSrok: TCheckBox;
       cbOst: TCheckBox;
       edFiltr: TEdit;
       Label2: TLabel;
       pmPrnReg: TPopupMenu;
       N1: TMenuItem;
       N2: TMenuItem;
       cbBU: TCheckBox;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
       procedure FormCreate(Sender: TObject);
       procedure BitBtn1Click(Sender: TObject);
       procedure rb2Click(Sender: TObject);
       procedure BitBtn2Click(Sender: TObject);
       procedure N1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);

     private

       procedure PrintOst(P:Byte);

     public

     end;

var RepOstatF:TRepOstatF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TRepOstatF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  BitBtn3.Enabled:=Prm.FirmID=5;
 end;

procedure TRepOstatF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TRepOstatF.rb2Click(Sender: TObject);
 begin
  Label1.Enabled:=rb2.Checked;
  Edit1.Enabled:=rb2.Checked;
  Edit2.Enabled:=rb2.Checked;
 end;


procedure TRepOstatF.BitBtn2Click(Sender:TObject);
var dx,dy:Integer;
    Com:TControl;
 begin
  if Sender=nil then Exit;
  dx:=Left+3; dy:=Top+TControl(Sender).Height+23;
  Com:=TControl(Sender);
  While Com<>Self do
   begin
    Inc(dx,Com.Left);
    Inc(dy,Com.Top);
    Com:=Com.Parent;
   end;
  pmPrnReg.Popup(dx,dy);
 end;

procedure TRepOstatF.PrintOst(P:Byte);
var S:String;
    Nds:Boolean;
    i:Integer;
    sNDS:String;
 begin
  if DM.spY_FilterSklad.IsEmpty then Exit;
  try
   PrintRep.Clear;
   PrintRep.SetDefault;

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select f_nds from SprTovar (nolock) group by f_nds order by 1';
   DM.QrEx.Open;
   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;
     Case DM.QrEx.FieldByName('F_NDS').AsInteger of
      1:begin NDS:=True; S:='НДС 20%'; sNDS:='convert(numeric(8,2),Max(a.cena)/6.) as НДС_N_1000, ' end;
      2:begin NDS:=False; S:='НДС 7%'; sNDS:='convert(numeric(8,2),Max(a.cena)*(7/107.)) as НДС_N_1000, ' end;
     end;

     PrintRep.Font.Size:=5;
     PrintRep.Font.Name:='Arial';
     PrintRep.Align:=AL_CENTER;

     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('select a.Art_Code as Код_I_1500,');
     DM.Qr.SQL.Add('       a.Names as Наименование_S_7500,');
     DM.Qr.SQL.Add('       Sum(a.Ostat) as Остаток_I_1000,');
     DM.Qr.SQL.Add('       Max(a.Cena) as Цена_N_1000,'+sNDS);
     DM.Qr.SQL.Add('       b.P1 as [Осн._S_1000],');
     DM.Qr.SQL.Add('       b.P2 as [Витр._S_1000],');
     DM.Qr.SQL.Add('       b.P3 as [Скл._S_1000]');
     DM.Qr.SQL.Add('from SprTov a (nolock) left join Inform..SprReg b (nolock) on a.art_code=b.art_code where a.art_code>10 and ');
  
     DM.Qr.SQL.Add(' a.f_nds='+DM.QrEx.FieldByName('F_NDS').AsString );
  
     if rb2.Checked then
      DM.Qr.SQL.Add(' and substring(a.names,1,1)>='''+Copy(Edit1.Text,1,1)+''' and substring(a.names,1,1)<='''+Copy(Edit2.Text,1,1)+'''');
     if cbSrok.Checked then
      DM.Qr.SQL.Add(' and a.names like ''%(__.__)%''');
     if edFiltr.Text<>'' then
      DM.Qr.SQL.Add(' and a.names like ''%'+edFiltr.Text+'%''');
     if cbOst.Checked then
      DM.Qr.SQL.Add(' and a.ostat>0');
     if cbBU.Checked then
      DM.Qr.SQL.Add(' and a.names like ''%(б/уп)%''');
     DM.Qr.SQL.Add('group by a.Art_Code,a.Names,b.P1,b.P2,b.P3');
     Case P of
      1:DM.Qr.SQL.Add('order by a.Names');
      2:DM.Qr.SQL.Add('order by b.P1,b.P2,b.P3');
     end;
  //   DM.Qr.SQL.SaveToFile('C:\144.txt');
     DM.Qr.Open;
     DM.Qr.First;
  
     if cbSrok.Checked then
      PrintRep.AddText('Остатки срокового товара  по '+Prm.AptekaNameRU+#10)
     else
      PrintRep.AddText('Остатки товара '+S+' по '+Prm.AptekaNameRU+#10);
     PrintRep.AddText('на '+FormatDateTime('dd.mm.yyyy hh:nn:ss',Now)+#10#10#10);
     PrintRep.Align:=AL_LEFT;
     PrintRep.Font.Size:=4;
     PrintRep.UpKolontit.Align:=AL_CENTER;
     PrintRep.UpKolontit.Font.Name:='Arial';
     PrintRep.UpKolontit.Font.Size:=4;
     PrintRep.UpKolontit.Text:='- Стр. &NumP& -';
     PrintRep.Qr:=DM.Qr;
     PrintRep.PrintTable(NDS,0,0);
     if i<DM.QrEx.RecordCount then PrintRep.AddText(#12);
    end;
   PrintRep.PreView;
  except
   MainF.MessBox('Ошибка доступа к справочнику товаров!');
  end;
 end;

procedure TRepOstatF.N1Click(Sender: TObject);
 begin
  if Sender=nil then Exit;
  PrintOst(TControl(Sender).Tag);
 end;

procedure TRepOstatF.BitBtn3Click(Sender: TObject);
var Rc,i:Integer;
    Sum:Real;
    Tb:TTableObj;
    Exl:Variant;
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Text:='select Sum(ostat*cena) as Summa from SprTov where ostat>0';
   DM.Qr.Open;
   Sum:=DM.Qr.FieldByName('Summa').AsFloat;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select names,Sum(ostat) as kol,cena,Sum(ostat*cena) as Summa');
   DM.Qr.SQL.Add('from SprTov');
   DM.Qr.SQL.Add('where ostat>0');
   DM.Qr.SQL.Add('group by names,cena');
   DM.Qr.SQL.Add('order by 1');
   DM.Qr.Open;
   Rc:=DM.Qr.RecordCount;
//   Rc:=5;

   if CheckBox1.Checked then
    begin
     Exl:=CreateOleObject('Excel.Application');
     try
      Exl.Visible:=True;
      Exl.DisplayAlerts:=False;
      Exl.Workbooks.Add;
      Exl.WorkBooks[1].Sheets[1].Activate;

      for i:=1 to 13 do
       Exl.WorkBooks[1].Sheets[1].Range['B'+IntToStr(i)+':K'+IntToStr(i)].Merge;

      for i:=14 to 16 do
       Exl.WorkBooks[1].Sheets[1].Range['C'+IntToStr(i)+':K'+IntToStr(i)].Merge;

      Exl.WorkBooks[1].Sheets[1].Cells[1,2]:='Фiрма';
      Exl.WorkBooks[1].Sheets[1].Cells[2,2]:='Комунальне підприємство охорони здоров"я Міжлікарняна аптека №271';
      Exl.WorkBooks[1].Sheets[1].Cells[4,3]:='Інвентаризаційний опис';
      Exl.WorkBooks[1].Sheets[1].Cells[6,2]:='контрольної перевірки інвентаризації цінностей на ___________________________ '+DateToStrUA(Date);
      Exl.WorkBooks[1].Sheets[1].Cells[7,2]:='Інвентаризація проводилась на                           '+DateToStrUA(Date);
      Exl.WorkBooks[1].Sheets[1].Cells[8,2]:='Комісією в складі:';
      Exl.WorkBooks[1].Sheets[1].Cells[9,2]:='Голова ';
      Exl.WorkBooks[1].Sheets[1].Cells[10,2]:='Члени комісії ';

      Exl.WorkBooks[1].Sheets[1].Cells[13,2]:='Контрольною перевіркою, проведено ';
      Exl.WorkBooks[1].Sheets[1].Cells[14,2]:='Встановлено:';

      Exl.WorkBooks[1].Sheets[1].Cells[14,3]:='І. Згідно з інвентаризаційним описом значится в наявності '+IntToStr(Rc)+' найменувань цінностей на суму';
      Exl.WorkBooks[1].Sheets[1].Cells[15,3]:=CurrToWordsUA(Sum,0);
      Exl.WorkBooks[1].Sheets[1].Cells[16,3]:='ІІ. Результати перевірки:';

      Exl.WorkBooks[1].Sheets[1].Range['A17:A18'].Merge;
      Exl.WorkBooks[1].Sheets[1].Range['B17:C18'].Merge;

      Exl.WorkBooks[1].Sheets[1].Range['D17:F17'].Merge;
      Exl.WorkBooks[1].Sheets[1].Range['G17:I17'].Merge;
      Exl.WorkBooks[1].Sheets[1].Range['J17:L17'].Merge;

      Exl.WorkBooks[1].Sheets[1].Cells[17,1]:='№ за описом';
      Exl.WorkBooks[1].Sheets[1].Cells[17,2]:='Найменування цінностей, які контрольно перевірені';

      Exl.WorkBooks[1].Sheets[1].Cells[17,4]:='Значиться в інвентаризаційному описі';
      Exl.WorkBooks[1].Sheets[1].Cells[17,7]:='Фактично виявлено контрольною перевіркою';
      Exl.WorkBooks[1].Sheets[1].Cells[17,10]:='Результати перевірки (+ більше, - менше)';

      Exl.WorkBooks[1].Sheets[1].Cells[18,4]:='Кількість';
      Exl.WorkBooks[1].Sheets[1].Cells[18,5]:='Ціна';
      Exl.WorkBooks[1].Sheets[1].Cells[18,6]:='Сума';

      Exl.WorkBooks[1].Sheets[1].Cells[18,7]:='Кількість';
      Exl.WorkBooks[1].Sheets[1].Cells[18,8]:='Ціна';
      Exl.WorkBooks[1].Sheets[1].Cells[18,9]:='Сума';

      Exl.WorkBooks[1].Sheets[1].Cells[18,10]:='Кількість';
      Exl.WorkBooks[1].Sheets[1].Cells[18,11]:='Ціна';
      Exl.WorkBooks[1].Sheets[1].Cells[18,12]:='Сума';

      for i:=1 to Rc do
       begin
        if i=1 then DM.Qr.First else DM.Qr.Next;
        Exl.WorkBooks[1].Sheets[1].Range['B'+IntToStr(i+18)+':C'+IntToStr(i+18)].Merge;

        Exl.WorkBooks[1].Sheets[1].Cells[18+i,1]:=IntToStr(i);
        Exl.WorkBooks[1].Sheets[1].Cells[18+i,2]:=DM.Qr.FieldByName('names').AsString;
        Exl.WorkBooks[1].Sheets[1].Cells[18+i,4]:=DM.Qr.FieldByName('kol').AsString;
        Exl.WorkBooks[1].Sheets[1].Cells[18+i,5]:=DM.Qr.FieldByName('Cena').AsString;
        Exl.WorkBooks[1].Sheets[1].Cells[18+i,6]:=DM.Qr.FieldByName('Summa').AsString;

       end;

      Exl.WorkBooks[1].Sheets[1].Cells[19+Rc,3]:='Усього';
      Exl.WorkBooks[1].Sheets[1].Cells[19+Rc,4]:='X';
      Exl.WorkBooks[1].Sheets[1].Cells[19+Rc,5]:='X';
      Exl.WorkBooks[1].Sheets[1].Cells[19+Rc,6]:=CurrToStrF(Sum,ffFixed,2);

      Exl.WorkBooks[1].Sheets[1].Cells[19+Rc,7]:='X';
      Exl.WorkBooks[1].Sheets[1].Cells[19+Rc,8]:='X';

      Exl.WorkBooks[1].Sheets[1].Cells[19+Rc,10]:='X';
      Exl.WorkBooks[1].Sheets[1].Cells[19+Rc,11]:='X';


      Exl.WorkBooks[1].Sheets[1].Columns['A:M'].EntireColumn.AutoFit;

      Exl.WorkBooks[1].Sheets[1].Cells[21+Rc,2]:='Підписи:';

      Exl.WorkBooks[1].Sheets[1].Cells[22+Rc,2]:='особа, яка проводила контрольну перевірку:';
      Exl.WorkBooks[1].Sheets[1].Cells[22+Rc,4]:='_____________________________________________';

      Exl.WorkBooks[1].Sheets[1].Cells[24+Rc,2]:='голова інвентаризаційної комісії:';
      Exl.WorkBooks[1].Sheets[1].Cells[24+Rc,4]:='_____________________________________________';

      Exl.WorkBooks[1].Sheets[1].Cells[26+Rc,2]:='члени інвентаризаційної комісії:';
      Exl.WorkBooks[1].Sheets[1].Cells[26+Rc,4]:='_____________________________________________';

      Exl.WorkBooks[1].Sheets[1].Cells[28+Rc,4]:='_____________________________________________';
      Exl.WorkBooks[1].Sheets[1].Cells[30+Rc,4]:='_____________________________________________';


      Exl.WorkBooks[1].Sheets[1].Range['A'+IntToStr(17)+':L'+IntToStr(Rc+18)].Borders.LineStyle:=1;
      Exl.WorkBooks[1].WorkSheets[1].Range['A'+IntToStr(17)+':L'+IntToStr(Rc+18)].Borders.Weight:=2;
      Exl.WorkBooks[1].WorkSheets[1].Range['A'+IntToStr(17)+':L'+IntToStr(Rc+18)].Borders.ColorIndex:=1;

      Exl.WorkBooks[1].Sheets[1].Columns['B:B'].EntireColumn.AutoFit;

     except
      Exl.WorkBooks.Close;
     end;
     Exit;
    end;

   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Orientation:=O_LANDS;

   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=4;
   PrintRep.AddText('Фiрма'#10);
   PrintRep.Font.Style:=[fsUnderline,fsBold];

   PrintRep.AddText('Комунальне підприємство охорони здоров"я Міжлікарняна аптека №271'#10#10);

   PrintRep.Font.Size:=5;
   PrintRep.Align:=AL_CENTER;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.AddText('Інвентаризаційний опис'#10#10);

   PrintRep.Font.Style:=[];
   PrintRep.Font.Size:=4;
   PrintRep.Align:=AL_LEFT;
   PrintRep.AddText('контрольної перевірки інвентаризації цінностей на ___________________________ '+DateToStrUA(Date)+#10);

   PrintRep.AddText('Інвентаризація проводилась на                           '+DateToStrUA(Date)+#10);
   PrintRep.AddText('Комісією в складі: '#10);
   PrintRep.AddText('Голова '#10);
   PrintRep.AddText('Члени комісії '#10#10#10);

   PrintRep.AddText('Контрольною перевіркою, проведено '#10);
   PrintRep.AddText('Встановлено:                  І. Згідно з інвентаризаційним описом значится в наявності '+IntToStr(Rc)+' найменувань цінностей на суму'+#10);
   PrintRep.AddText('                                        '+CurrToWordsUA(Sum,0)+#10);
   PrintRep.AddText('                                         ІІ. Результати перевірки: '+#10);

   PrintRep.Font.Size:=4;
   PrintRep.Align:=AL_CENTER;
   PrintRep.Font.Style:=[fsBold];

   PrintRep.AddTable(11,Rc+3);
   Tb:=PrintRep.LastTable;
   Tb.FixRows(1,2);
   Tb.SetWidths('1000,7500,1500,1500,1700,1500,1500,1700,1500,1500,1700');
//   Tb.MergeCells(1,1,1,2);
   Tb.MergeCells(2,1,2,2);
   Tb.MergeCells(3,1,5,1);
   Tb.MergeCells(6,1,8,1);
   Tb.MergeCells(9,1,11,1);
   Tb.Cell[1,1].AddText('№ за опи- сом');
   Tb.Cell[2,1].AddText(#10'Найменування цінностей, які контрольно перевірені');
   Tb.Cell[3,1].AddText('Значиться в інвентаризаційному описі');
   Tb.Cell[6,1].AddText('Фактично виявлено контрольною перевіркою');
   Tb.Cell[9,1].AddText('Результати перевірки (+ більше, - менше)');

   Tb.Cell[3,2].AddText('Кількість'); Tb.Cell[4,2].AddText('Ціна'); Tb.Cell[5,2].AddText('Сума');
   Tb.Cell[6,2].AddText('Кількість'); Tb.Cell[7,2].AddText('Ціна'); Tb.Cell[8,
   2].AddText('Сума');
   Tb.Cell[9,2].AddText('Кількість'); Tb.Cell[10,2].AddText('Ціна'); Tb.Cell[11,2].AddText('Сума');


   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     Tb.Cell[1,i+2].Font.Style:=[];
     Tb.Cell[1,i+2].Align:=AL_LEFT;
     Tb.Cell[1,i+2].AddText(IntToStr(i));

     Tb.Cell[2,i+2].Font.Style:=[];
     Tb.Cell[2,i+2].Align:=AL_LEFT;
     Tb.Cell[2,i+2].AddText(DM.Qr.FieldByName('names').AsString);

     Tb.Cell[3,i+2].Font.Style:=[];
     Tb.Cell[3,i+2].Align:=AL_RIGHT;
     Tb.Cell[3,i+2].AddText(DM.Qr.FieldByName('kol').AsString);

     Tb.Cell[4,i+2].Font.Style:=[];
     Tb.Cell[4,i+2].Align:=AL_RIGHT;
     Tb.Cell[4,i+2].AddText(CurrToStrF(DM.Qr.FieldByName('cena').AsFloat,ffFixed,2));

     Tb.Cell[5,i+2].Font.Style:=[];
     Tb.Cell[5,i+2].Align:=AL_RIGHT;
     Tb.Cell[5,i+2].AddText(CurrToStrF(DM.Qr.FieldByName('summa').AsFloat,ffFixed,2));
    end;

   Tb.Cell[2,Rc+3].Align:=AL_RIGHT;
   Tb.Cell[2,Rc+3].AddText('Усього:');

   Tb.Cell[3,Rc+3].AddText('X');
   Tb.Cell[4,Rc+3].AddText('X');

   Tb.Cell[5,Rc+3].Align:=AL_RIGHT;
   Tb.Cell[5,Rc+3].AddText(CurrToStrF(Sum,ffFixed,2));

   Tb.Cell[6,Rc+3].AddText('X');
   Tb.Cell[7,Rc+3].AddText('X');

   Tb.Cell[9,Rc+3].AddText('X');
   Tb.Cell[10,Rc+3].AddText('X');

   Tb.Cell[1,1].BottomBorder:=EMPTY_BORDER;
   Tb.Cell[1,Rc+3].LeftBorder:=EMPTY_BORDER;
   for i:=1 to 11 do
    begin
     Tb.Cell[i,Rc+3].BottomBorder:=EMPTY_BORDER;
     Tb.Cell[i,Rc+3].RightBorder:=EMPTY_BORDER;
    end;

   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Style:=[];
   PrintRep.AddInterv(4);
   PrintRep.AddText('Підписи:'#10);
   PrintRep.AddText('особа, яка проводила контрольну перевірку:     ___________________________________________________________________________'#10#10);
   PrintRep.AddText('голова інвентаризаційної комісії:                        ___________________________________________________________________________'#10#10);
   PrintRep.AddText('члени інвентаризаційної комісії :                        ___________________________________________________________________________'#10#10);
   PrintRep.AddText('                                                                              ___________________________________________________________________________'#10#10);
   PrintRep.AddText('                                                                              ___________________________________________________________________________'#10#10);
   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования печатной формы :'+E.Message);
  end;
 end;

end.
