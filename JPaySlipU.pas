unit JPaySlipU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Buttons, DateUtils,
     PrintReport, Util;

type

  TJPaySlipF = class(TForm)

    Panel1: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    Label8: TLabel;
    ComboBox2: TComboBox;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);

  private

    procedure FilterSpis;

  public

  end;

var JPaySlipF: TJPaySlipF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TJPaySlipF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  dtStart.Date:=StartOfTheMonth(Date);
  dtEnd.Date:=EndOfTheMonth(Date);
  FilterSpis;
 end;

procedure TJPaySlipF.BitBtn4Click(Sender:TObject);
 begin
  Close;
 end;

procedure TJPaySlipF.FilterSpis;
 begin
  try

   DM.qrJPaySlip.Close;
   DM.qrJPaySlip.SQL.Clear;
   DM.qrJPaySlip.SQL.Add('select (select top 1 users from SprUser u where u.id_gamma=p.id_gamma) as users, cast(id_payslip as uniqueidentifier) as id_payslip,Max(dt_begin) as dt_begin,Max(dt_end) as dt_end ');
   DM.qrJPaySlip.SQL.Add('from PaySlip p (nolock) ');
   DM.qrJPaySlip.SQL.Add('where dt_begin>='''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and dt_end<='''+FormatDateTime('yyyy-mm-dd',dtEnd.Date)+''' ');

   if Prm.UserRole in [R_SUPER,R_ADMIN] then
    DM.qrJPaySlip.SQL.Add(' and (p.id_gamma='+IntToStr(Prm.ID_Gamma)+' or p.id_gamma in  (select id_gamma from SpisRL ) )')
   else
    DM.qrJPaySlip.SQL.Add(' and p.id_gamma='+IntToStr(Prm.ID_Gamma));

//   DM.qrJPaySlip.SQL.Add(' and id_apteka='+IntToStr(Prm.AptekaID));
   DM.qrJPaySlip.SQL.Add('group by p.id_gamma,cast(id_payslip as uniqueidentifier) ');
   DM.qrJPaySlip.SQL.Add('order by 1 ');
//   DM.qrJPaySlip.SQL.SaveToFile('C:\Log\PaySlip.txt');
   DM.qrJPaySlip.Open;

  except
   on E:Exception do MainF.MessBox('Ошибка доступа к расчетным листам: '+E.Message);
  end;
 end;

procedure TJPaySlipF.BitBtn1Click(Sender: TObject);
 begin
  FilterSpis;
 end;

procedure TJPaySlipF.DBGrid1DblClick(Sender: TObject);
 begin
  BitBtn2Click(BitBtn2);
 end;

procedure TJPaySlipF.BitBtn2Click(Sender: TObject);
var Tb1,Tb:TTableObj;
    x,y,i,cntR:Integer;
 begin
  if DM.qrJPaySlip.IsEmpty then Exit;
  try

   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Verdana';
   PrintRep.Font.Size:=3;

{
   DM.Qr.Close;
   DM.Qr.SQL.Clear;

   DM.Qr.SQL.Add('select Max(nCol) as nCol,Sum(nRow) as nRow  ');
   DM.Qr.SQL.Add('from ( ');
   DM.Qr.SQL.Add('      select Count(param)/Count(distinct param) nCol,Count(distinct param) as nRow ');
   DM.Qr.SQL.Add('      from PAYSLIP (nolock) ');
   DM.Qr.SQL.Add('      where cast(id_payslip as uniqueidentifier)= '''+DM.qrJPaySlip.FieldByName('id_payslip').AsString+'''');
   DM.Qr.SQL.Add('      group by NumSection,Section ');
   DM.Qr.SQL.Add('     ) a ');
   DM.Qr.Open;

   PrintRep.AddTable(DM.Qr.FieldByName('nCol').AsInteger,DM.Qr.FieldByName('nRow').AsInteger);
}

   PrintRep.AddTable(9,13);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('4200,1900,1400,1300,1900,2900,700,1900,1900');
   Tb.MergeCells(1,1,9,1);
   Tb.MergeCells(1,2,9,2);

   for i:=3 to 6 do
    begin
     Tb.MergeCells(1,i,5,i);
     Tb.MergeCells(6,i,9,i);
    end;

   Tb.MergeCells(6,7,7,7);
   Tb.MergeCells(6,8,7,8);


   Tb.MergeCells(1,9,4,9);
   Tb.MergeCells(1,10,4,10);
   Tb.MergeCells(1,11,5,11);
   Tb.MergeCells(1,13,8,13);
   Tb.MergeCells(1,8,9,8);

   Tb.MergeCells(6,9,8,9);
   Tb.MergeCells(6,10,9,10);

   Tb.MergeCells(7,11,8,11);
   Tb.MergeCells(1,12,9,12);

   Tb.Cell[1,6].Align:=AL_CENTER; Tb.Cell[1,6].Font.Style:=[fsBold]; Tb.Cell[1,6].AddText('Начисление');
   Tb.Cell[6,6].Align:=AL_CENTER; Tb.Cell[6,6].Font.Style:=[fsBold]; Tb.Cell[6,6].AddText('Удержание');

   Tb.Cell[1,9].Align:=AL_RIGHT; Tb.Cell[1,9].Font.Style:=[fsBold]; Tb.Cell[1,9].AddText('Всего начислено:');
   Tb.Cell[6,9].Align:=AL_RIGHT; Tb.Cell[6,9].Font.Style:=[fsBold]; Tb.Cell[6,9].AddText('Всего начислено:');

   Tb.Cell[1,13].Align:=AL_RIGHT; Tb.Cell[1,13].Font.Style:=[fsBold]; Tb.Cell[1,13].AddText('Всего выплачено:');

   Tb.Cell[1,10].Font.Style:=[fsBold]; Tb.Cell[1,10].AddText('К выплате:');

   Tb.Cell[1,7].Align:=AL_CENTER; Tb.Cell[1,7].AddText('Вид');
   Tb.Cell[2,7].Align:=AL_CENTER; Tb.Cell[2,7].AddText('Период');
   Tb.Cell[3,7].Align:=AL_CENTER; Tb.Cell[3,7].AddText('Дни');
   Tb.Cell[4,7].Align:=AL_CENTER; Tb.Cell[4,7].AddText('Часы');
   Tb.Cell[5,7].Align:=AL_CENTER; Tb.Cell[5,7].AddText('Сумма');
   Tb.Cell[6,7].Align:=AL_CENTER; Tb.Cell[6,7].AddText('Вид');
   Tb.Cell[8,7].Align:=AL_CENTER; Tb.Cell[8,7].AddText('Период');
   Tb.Cell[9,7].Align:=AL_CENTER; Tb.Cell[9,7].AddText('Сумма');

   Tb.Cell[1,1].BottomBorder:=Border(clBlack,1,psDot);
   Tb.Cell[1,2].BottomBorder:=Border(clBlack,1,psDot);
   Tb.Cell[1,3].BottomBorder:=Border(clBlack,1,psDot); Tb.Cell[6,3].BottomBorder:=Border(clBlack,1,psDot); Tb.Cell[1,3].RightBorder:=Border(clBlack,1,psDot);
   Tb.Cell[1,4].BottomBorder:=Border(clBlack,1,psDot); Tb.Cell[6,4].BottomBorder:=Border(clBlack,1,psDot); Tb.Cell[1,4].RightBorder:=Border(clBlack,1,psDot);
   Tb.Cell[1,5].RightBorder:=Border(clBlack,1,psDot);

   Tb.Cell[1,9].RightBorder:=Border(clBlack,1,psDot);
   Tb.Cell[8,9].RightBorder:=Border(clBlack,1,psDot);
   Tb.Cell[9,9].BottomBorder:=Border(clBlack,1,psDot);

   for i:=6 to 8 do Tb.Cell[i,9].BottomBorder:=EMPTY_BORDER;

   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select * ');
   DM.Qr.SQL.Add('from PAYSLIP (nolock) ');
   DM.Qr.SQL.Add('where cast(id_payslip as uniqueidentifier)= '''+DM.qrJPaySlip.FieldByName('id_payslip').AsString+''' ');
   DM.Qr.SQL.Add('      and Section=''Шапка'' ');
   DM.Qr.SQL.Add('order by param ');
   DM.Qr.Open;
   DM.Qr.First;

   Tb.Cell[1,1].Font.Size:=4;
   Tb.Cell[1,1].Font.Style:=[fsBold];
   Tb.Cell[1,1].AddText(DM.Qr.FieldByName('Value').AsString+#10);

   DM.Qr.Next;
   Tb.Cell[1,1].Align:=AL_CENTER;
   Tb.Cell[1,1].AddText(DM.Qr.FieldByName('Value').AsString);

   DM.Qr.Next;
   Tb.Cell[1,2].AddText(DM.Qr.FieldByName('Value').AsString);

   //Секция НачисленоУдержано

   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select * ');
   DM.Qr.SQL.Add('from PAYSLIP (nolock) ');
   DM.Qr.SQL.Add('where cast(id_payslip as uniqueidentifier)= '''+DM.qrJPaySlip.FieldByName('id_payslip').AsString+''' ');
   DM.Qr.SQL.Add('      and Section=''ДопИнформация'' and Param not in (1,6) ');
   DM.Qr.SQL.Add('order by param ');
   DM.Qr.Open;
   DM.Qr.First;

   Tb.Cell[1,3].AddText(DM.Qr.FieldByName('Value').AsString);
   DM.Qr.Next;

   Tb.Cell[6,3].AddText(DM.Qr.FieldByName('Value').AsString);
   DM.Qr.Next;

   Tb.Cell[1,4].AddText(DM.Qr.FieldByName('Value').AsString);
   DM.Qr.Next;

   Tb.Cell[1,5].AddText(DM.Qr.FieldByName('Value').AsString);
   DM.Qr.Next;

   Tb.Cell[6,5].AddText(DM.Qr.FieldByName('Value').AsString);
   DM.Qr.Next;

   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select Count(*) as Cnt ');
   DM.Qr.SQL.Add('from PAYSLIP (nolock) ');
   DM.Qr.SQL.Add('where cast(id_payslip as uniqueidentifier)= '''+DM.qrJPaySlip.FieldByName('id_payslip').AsString+''' ');
   DM.Qr.SQL.Add('      and Section=''НачисленоУдержано'' and Param=0 ');
   DM.Qr.Open;
   cntR:=DM.Qr.FieldByName('Cnt').AsInteger;

   Tb.Cell[1,8].AddTable(8,cntR);
   Tb.Cell[1,8].LeftMargin:=0;
   Tb.Cell[1,8].RightMargin:=0;
   Tb.Cell[1,8].TopMargin:=0;
   Tb.Cell[1,8].BottomMargin:=0;
   Tb1:=Tb;
   Tb:=Tb.Cell[1,8].LastTable;
   Tb.SetWidths('4200,1900,1400,1300,1900,3600,1900,1900');

   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select * ');
   DM.Qr.SQL.Add('from PAYSLIP (nolock) ');
   DM.Qr.SQL.Add('where cast(id_payslip as uniqueidentifier)= '''+DM.qrJPaySlip.FieldByName('id_payslip').AsString+''' ');
   DM.Qr.SQL.Add('      and Section=''НачисленоУдержано'' and Param<>1 ');
   DM.Qr.SQL.Add('order by numstr,param ');
   DM.Qr.Open;

   x:=0; y:=0;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     if DM.Qr.FieldByname('Param').AsInteger=0 then begin x:=1; Inc(y); end;

     if x in [2,7] then Tb.Cell[x,y].Align:=AL_CENTER;
     if x in [3,4,5,8] then Tb.Cell[x,y].Align:=AL_RIGHT;

     Tb.Cell[x,y].AddText(DM.Qr.FieldByname('Value').AsString);

     Tb.Cell[x,y].TopBorder:=EMPTY_BORDER;
     Tb.Cell[x,y].BottomBorder:=EMPTY_BORDER;
     if x=9 then Tb.Cell[x,y].RightBorder:=EMPTY_BORDER;

     if x in [1,2,3,4,6,7] then Tb.Cell[x,y].RightBorder:=Border(clBlack,1,psDot);

     Inc(x);
    end;

   // Секция Выплата

   Tb:=Tb1;

   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select * ');
   DM.Qr.SQL.Add('from PAYSLIP (nolock) ');
   DM.Qr.SQL.Add('where cast(id_payslip as uniqueidentifier)= '''+DM.qrJPaySlip.FieldByName('id_payslip').AsString+''' ');
   DM.Qr.SQL.Add('      and Section=''Всего'' ');
   DM.Qr.SQL.Add('order by numstr,param ');
   DM.Qr.Open;

   Tb.Cell[5,9].Align:=AL_RIGHT; Tb.Cell[5,9].Font.Style:=[fsBold]; Tb.Cell[5,9].AddText(DM.Qr.FieldByName('Value').AsString);
   DM.Qr.Next;

   Tb.Cell[9,9].Align:=AL_RIGHT; Tb.Cell[9,9].Font.Style:=[fsBold]; Tb.Cell[9,9].AddText(DM.Qr.FieldByName('Value').AsString);
   DM.Qr.Next;

   Tb.Cell[5,10].Align:=AL_RIGHT; Tb.Cell[5,10].Font.Style:=[fsBold]; Tb.Cell[5,10].AddText(DM.Qr.FieldByName('Value').AsString);
   DM.Qr.Next;

   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select Count(*) as Cnt ');
   DM.Qr.SQL.Add('from PAYSLIP (nolock) ');
   DM.Qr.SQL.Add('where cast(id_payslip as uniqueidentifier)= '''+DM.qrJPaySlip.FieldByName('id_payslip').AsString+''' ');
   DM.Qr.SQL.Add('      and Section=''Выплата'' and Param=0 ');
   DM.Qr.Open;
   cntR:=DM.Qr.FieldByName('Cnt').AsInteger;

   Tb.Cell[1,12].AddTable(4,cntR);
   Tb.Cell[1,12].LeftMargin:=0;
   Tb.Cell[1,12].RightMargin:=0;
   Tb.Cell[1,12].TopMargin:=0;
   Tb.Cell[1,12].BottomMargin:=0;
   Tb1:=Tb;
   Tb:=Tb.Cell[1,12].LastTable;
   Tb.SetWidths('10700,2900,2600,1900');

   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select * ');
   DM.Qr.SQL.Add('from PAYSLIP (nolock) ');
   DM.Qr.SQL.Add('where cast(id_payslip as uniqueidentifier)= '''+DM.qrJPaySlip.FieldByName('id_payslip').AsString+''' ');
   DM.Qr.SQL.Add('      and Section=''Выплата'' and Param<>1 ');
   DM.Qr.SQL.Add('order by numstr,param ');
   DM.Qr.Open;

   Tb.SetBorders(1,1,4,cntR,EMPTY_BORDER);
   x:=0; y:=0;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     if DM.Qr.FieldByname('Param').AsInteger=0 then begin x:=1; Inc(y); end;

     if x in [2,3] then Tb.Cell[x,y].Align:=AL_CENTER;
     if x in [4] then Tb.Cell[x,y].Align:=AL_RIGHT;

     Tb.Cell[x,y].AddText(DM.Qr.FieldByname('Value').AsString);

     if x in [2,3] then Tb.Cell[x,y].RightBorder:=Border(clBlack,1,psDot);
     if x in [1] then Tb.Cell[x,y].RightBorder:=Border(clBlack,1,psSolid);

     Inc(x);
    end;

   Tb:=Tb1;
   for i:=1 to 9 do Tb.Cell[i,12].BottomBorder:=Border(clBlack,1,psDot);

   Tb.Cell[8,13].RightBorder:=Border(clBlack,1,psDot);

   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select * ');
   DM.Qr.SQL.Add('from PAYSLIP (nolock) ');
   DM.Qr.SQL.Add('where cast(id_payslip as uniqueidentifier)= '''+DM.qrJPaySlip.FieldByName('id_payslip').AsString+''' ');
   DM.Qr.SQL.Add('      and Section=''ВсегоВыплата'' and Param=0 ');
   DM.Qr.SQL.Add('order by param ');
   DM.Qr.Open;

   Tb.Cell[9,13].Align:=AL_RIGHT; Tb.Cell[9,13].Font.Style:=[fsBold]; Tb.Cell[9,13].AddText(DM.Qr.FieldByName('Value').AsString);

   Tb.Cell[1,11].Align:=AL_CENTER; Tb.Cell[1,11].AddText('Выплаты');
   Tb.Cell[6,11].Align:=AL_CENTER; Tb.Cell[6,11].AddText('Дата выплаты');
   Tb.Cell[7,11].Align:=AL_CENTER; Tb.Cell[7,11].AddText('За период');
   Tb.Cell[9,11].Align:=AL_CENTER; Tb.Cell[9,11].AddText('Сумма');

   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формироваия печатной формы: '+E.Message);
  end;
 end;

procedure TJPaySlipF.ComboBox2Change(Sender: TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    dtStart.Date:=D1;
    dtEnd.Date:=D31;
   end;
 end;

end.
