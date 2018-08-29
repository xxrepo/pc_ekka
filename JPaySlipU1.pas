unit JPaySlipU1;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Buttons, DateUtils,
     PrintReport, Util;

type

  TJPaySlipF1 = class(TForm)

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

var JPaySlipF1:TJPaySlipF1;

implementation

uses MainU, DataModuleU, DB;

{$R *.dfm}

procedure TJPaySlipF1.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  dtStart.Date:=StartOfTheMonth(Date);
  dtEnd.Date:=EndOfTheMonth(Date);
  FilterSpis;
 end;

procedure TJPaySlipF1.BitBtn4Click(Sender: TObject);
 begin
  Close;
 end;

procedure TJPaySlipF1.FilterSpis;
 begin
  try

   DM.qrJPaySlip1.Close;
   DM.qrJPaySlip1.SQL.Clear;

   DM.qrJPaySlip1.SQL.Add('select аптека,_period as dt ');
   DM.qrJPaySlip1.SQL.Add('from ZPLIST_VIEW (nolock) ');
   DM.qrJPaySlip1.SQL.Add('where _period between '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd',dtEnd.Date)+''' ');

   DM.qrJPaySlip1.SQL.Add(' and [ИД]='+IntToStr(Prm.ID_Gamma));

   DM.qrJPaySlip1.SQL.Add('group by аптека,_period ');
   DM.qrJPaySlip1.SQL.Add('order by аптека,_period ');

{
   DM.qrJPaySlip.SQL.Add('select cast(id_payslip as uniqueidentifier) as id_payslip,Max(dt_begin) as dt_begin,Max(dt_end) as dt_end ');
   DM.qrJPaySlip.SQL.Add('from PaySlip (nolock) ');
   DM.qrJPaySlip.SQL.Add('where dt_begin>='''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and dt_end+1<='''+FormatDateTime('yyyy-mm-dd',dtEnd.Date)+''' ');

   if Prm.UserRole=R_SUPER then
    DM.qrJPaySlip.SQL.Add(' and ')
   else
    DM.qrJPaySlip.SQL.Add(' and id_gamma='+IntToStr(Prm.ID_Gamma));

   DM.qrJPaySlip.SQL.Add(' and id_apteka='+IntToStr(Prm.AptekaID));
   DM.qrJPaySlip.SQL.Add('group by cast(id_payslip as uniqueidentifier) ');
}

   DM.qrJPaySlip1.Open;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к расчетным листам: '+E.Message);
  end;

 end;

procedure TJPaySlipF1.BitBtn1Click(Sender:TObject);
 begin
  FilterSpis;
 end;

procedure TJPaySlipF1.DBGrid1DblClick(Sender:TObject);
 begin
  BitBtn2Click(BitBtn2);
 end;

(*
procedure TJPaySlipF1.BitBtn2Click(Sender: TObject);
var i,j,q,y:Integer;
    Tb:TTableObj;
    Sum1,Sum2:Currency;
 begin

  if DM.qrJPaySlip1.IsEmpty then Exit;
  DM.Qr.SQL.Clear;
  DM.Qr.SQL.Add('select * ');
  DM.Qr.SQL.Add('from vZPLIST_VIEW (nolock) ');
  DM.Qr.SQL.Add('where [ИД]='+IntToStr(Prm.ID_Gamma));
  DM.Qr.SQL.Add('      and _period='''+FormatDateTime('yyyy-mm-dd',DM.qrJPaySlip1.FieldByname('dt').AsDateTime)+''' ');
  DM.Qr.Open;
  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Font.Name:='Arial';

  Sum1:=0; Sum2:=0;
  for i:=1 to DM.Qr.RecordCount do
   begin
    if i=1 then DM.Qr.First else DM.Qr.Next;
    PrintRep.Font.Size:=5;
    PrintRep.AddText('Период: '+DM.Qr.FieldByName('_period').AsString+#10);
    PrintRep.AddText('Аптека: '+DM.Qr.FieldByName('Организция').AsString+' '+DM.Qr.FieldByname('Аптека').AsString+#10#10);
//    PrintRep.AddText('ФИО: '+DM.Qr.FieldByname('ФИО').AsString+#10#10);

    PrintRep.Font.Size:=4;
    q:=0;
    for j:=7 to DM.Qr.FieldCount-3 do
     if (DM.Qr.Fields[j].AsString<>'0') and (DM.Qr.Fields[j].AsString<>'') then Inc(q);

    PrintRep.AddTable(2,q);
    Tb:=PrintRep.LastTable;

    y:=0;
    for j:=7 to DM.Qr.FieldCount-3 do
     if (DM.Qr.Fields[j].AsString<>'0') and (DM.Qr.Fields[j].AsString<>'') then
      begin
       Inc(y);
       Tb.Cell[1,y].AddText(DM.Qr.Fields[j].FieldName);
       Tb.Cell[2,y].Align:=AL_RIGHT;
       Tb.Cell[2,y].AddText(DM.Qr.Fields[j].AsString);
      end;

    PrintRep.AddInterv(10);

    Sum1:=Sum1+DM.Qr.FieldByName('Удержания итого').AsCurrency;
    Sum2:=Sum2+DM.Qr.FieldByName('Зарплата ИТОГО').AsCurrency;

   end;

  PrintRep.Indent:=0;
  PrintRep.Font.Size:=5;
  PrintRep.AddText(#10);
  PrintRep.AddText('Удержания итого: '+CurrToStrF(Sum1,ffFixed,2)+#10);
  PrintRep.AddText('Зарплата итого: '+CurrToStrF(Sum2,ffFixed,2));

  PrintRep.PreView;
 end;    *)

procedure TJPaySlipF1.BitBtn2Click(Sender: TObject);
var r1,r2,r3,r4,r5,r5_1,r6,r7,ind,CA,i,j,q,y,rn1,rn2,rn3,rn4,rn5,rn6,rn7,rn8,r8,r2_,r2__,r9,rn9,rn10,r2_1,r2_2,rn11,rn12:Integer;
    Tb:TTableObj;
    SumPPM,Sm,Sum1,Sum2,Sum3,SumN1,SumN2,SumN3,SumN4,SumN4_,SumN5,SumN6,SumH,SumH_,SumDN,SumV,SumD,SumR,SumN_1,SumN_2,SumN_3,SumN_4,SumN_5,SumN_8,SumN_9,SumN_10,SumN_11,SumN_12:Currency;
    SumStar,SumStarsh,SumStarsh1,SumAll,SumPrem,SumBonus:Currency;
    Razn,SumP1,SumP2,SumP3,SumP4,SumP5,SmP:Currency;
    c3,c3_,rp1,rp2,rp3,rp4,rp5,ii,RcB:Integer;

    A:Array of Integer;
    aSum:Array[1..9] of Currency;
    Ch:Char;
    B:Boolean;
    s1:String;
 begin

  c3:=3; c3_:=2;
  if DM.qrJPaySlip1.IsEmpty then Exit;
  DM.Qr.SQL.Clear;
  DM.Qr.SQL.Add('select Sum([Привлечение сотрудников]) as SumB ');
  DM.Qr.SQL.Add('from ZPLIST_VIEW (nolock) ');
  DM.Qr.SQL.Add('where [ИД]='+IntToStr(Prm.ID_Gamma));
  DM.Qr.SQL.Add('      and _period='''+FormatDateTime('yyyy-mm-dd',DM.qrJPaySlip1.FieldByname('dt').AsDateTime)+''' ');
  DM.Qr.Open;
  SumBonus:=DM.Qr.FieldByName('SumB').AsCurrency;

  DM.Qr.SQL.Clear;
  DM.Qr.SQL.Add('select * ');
  DM.Qr.SQL.Add('from vZPLIST_VIEW (nolock) ');
  DM.Qr.SQL.Add('where [ИД]='+IntToStr(Prm.ID_Gamma));
  DM.Qr.SQL.Add('      and _period='''+FormatDateTime('yyyy-mm-dd',DM.qrJPaySlip1.FieldByname('dt').AsDateTime)+''' ');
  DM.Qr.Open;
  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Font.Name:='Arial';

  SetLength(A,0);

  s1:='Заработная плата';
  for j:=6 to DM.Qr.FieldCount-1 do
   begin
    B:=False;
    for i:=1 to DM.Qr.RecordCount do
     begin
      if i=1 then DM.Qr.First else DM.Qr.Next;
      if ((DM.Qr.Fields[j].AsString<>'0') and (DM.Qr.Fields[j].AsString<>''))
          or
         (AnsiUpperCase(DM.Qr.Fields[j].FieldName)=AnsiUpperCase('Премия'))
          or
         (Pos(AnsiUpperCase('Из них ('),AnsiUpperCase(DM.Qr.Fields[j].FieldName))>0)
          or
         (Pos(AnsiUpperCase('(копилка)'),AnsiUpperCase(DM.Qr.Fields[j].FieldName))>0) then
       begin
        if DM.Qr.Fields[j].FieldName='Пересчет предыдущего месяца' then s1:=DM.Qr.Fields[j].FieldName;
        q:=j;
        B:=True;
        Break;
       end;
     end;
    if B then
     begin
      CA:=High(A)+1;
      SetLength(A,CA+1);
      A[CA]:=q;
     end;
   end;

  PrintRep.Font.Size:=5;

  PrintRep.AddText(IntToStr(Prm.ID_Gamma)+#10#10);
//  PrintRep.AddText('Аптека: '+DM.Qr.FieldByName('Организция').AsString+' '+DM.Qr.FieldByname('Аптека').AsString+#10#10);

  PrintRep.Font.Size:=3;
  PrintRep.AddTable(DM.Qr.RecordCount+c3-1,High(A)+3+4+3);

  Tb:=PrintRep.LastTable;
  Tb.ColWidths[1]:=150;
  Tb.ColWidths[2]:=500;
//  Tb.ColWidths[3]:=200;
  y:=0; ind:=0;

  Tb.Cell[1,1].Font.Size:=4; Tb.Cell[1,1].Align:=AL_CENTER; Tb.Cell[1,1].AddText('№ п/п');
  Tb.Cell[2,1].Font.Size:=4; Tb.Cell[2,1].Align:=AL_CENTER; Tb.Cell[2,1].AddText('Наименование показателя');
//  Tb.Cell[3,1].Font.Size:=4; Tb.Cell[3,1].Align:=AL_CENTER; Tb.Cell[3,1].AddText('Методика расчета');

  Tb.MergeCells(c3,1,3+DM.Qr.RecordCount,1);
  Tb.Cell[c3,1].Font.Size:=5; Tb.Cell[c3,1].Align:=AL_CENTER; Tb.Cell[c3,1].AddText('Период: '+Trim(DM.Qr.FieldByName('_period').AsString));

  r1:=-1; r2:=-1; r3:=-1; r4:=-1; r5:=-1; r2_:=-1; r2__:=-1; r2_1:=-1; r2_2:=-1; r5_1:=-1; rn12:=-1;
  r7:=-1; r6:=-1;   rn1:=-1; rn2:=-1; rn3:=-1; rn4:=-1; rn5:=-1; rn6:=-1; rn7:=-1; rn8:=-1; r8:=-1; rn10:=-1; rn11:=-1;
  rp1:=-1; rp2:=-1; rp3:=-1; rp4:=-1; rp5:=-1; r9:=-1; rn9:=-1;

  for j:=Low(A) to High(A) do
   begin

    Inc(y);
    Inc(ind);
    Tb.Cell[2,y+1].Align:=AL_CENTER;

    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Отработанные часы всего') then
     begin
      r5:=y+1;
      Tb.Cell[2,y+1].Font.Style:=[fsBold];
     end;

    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('в т. ч. свыше нормы') then
     begin
      r5_1:=y+1;
//      Tb.Cell[2,y+1].Font.Style:=[fsBold];
     end;

    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Доплата за часы свыше нормы') then
     begin
      rn12:=y+1;
//      Tb.Cell[2,y+1].Font.Style:=[fsBold];
     end;

    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('ВЫРУЧКА ВСЕГО') then
     begin
      r4:=y+1;
      Tb.Cell[2,y+1].Font.Style:=[fsBold];
     end;

    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Премия по выручке') then
     begin
      r2_:=y+1;
     end;

{    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Премия по выручке') then
     begin
      r2_1:=y+1;
     end;
}
    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Доплата за категорию') then
     begin
      r2_2:=y+1;
     end;

    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Премия') then
     begin
      r2__:=y+1;
     end;

//    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Корректировка окладной части') then
    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Карточка') then
     begin
      r9:=y+1;
     end;

    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('ВСЕГО') then
     begin
      r2:=y+1;
      Tb.Cell[2,y+1].Font.Style:=[fsBold];
     end;

    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Доплата за заведование') then
     begin
      r8:=y+1;
     end;

//    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Премия') then  r6:=y+1;
//    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Региональная доплата') then  r7:=y+1;


    Tb.Cell[2,y+1].Align:=AL_CENTER;
   (* if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase(s1) then
     begin
      Tb.Cell[2,y].AddText(s1);
//      Tb.Cell[2,y+1].AddText('Заработная плата ИТОГО');
     end else
     *)


    Tb.Cell[1,y+1].Align:=AL_RIGHT;
    Tb.Cell[1,y+1].AddText(IntToStr(ind));

    Tb.Cell[3,y+1].Align:=AL_CENTER;


    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('ВСЕГО') then Inc(y);
    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('ВЫРУЧКА ВСЕГО') then Inc(y);

    {
    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Удержания итого') then
     begin
      r3:=y+1;
     end;
    }

    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Премия') then rp1:=y+1;

    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Региональная доплата') then rp2:=y+1;

    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Премия по выручке') then rp3:=y+1;
    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Премия за коллективную ответственность') then rp4:=y+1;
    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Премия за функционал') then rp5:=y+1;

    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Уменьшение премии за несохранность ТМЦ') then begin rn1:=y+1; Tb.Cell[c3,y+1].Align:=AL_CENTER; end;
    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Уменьшение премии за невыполнение функц. обязаностей') then begin  rn2:=y+1;  Tb.Cell[c3,y+1].Align:=AL_CENTER; end;
    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Уменьшение премии за невыполнение правил коллект. ответств.') then begin  rn3:=y+1;  Tb.Cell[c3,y+1].Align:=AL_CENTER; end;
    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Уменьшение премии за наруш. Правил Внутрен. Труд. Распоряд для работников') then begin  rn4:=y+1;  Tb.Cell[c3,y+1].Align:=AL_CENTER; end;
    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Ссуды') then rn5:=y+1;
    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Уменьшение премии за нарушение правил трудовой дисциплины') then rn6:=y+1;
    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Бонус к накоплению') then rn7:=y+1;
    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Депонент предыдущ. периода') then rn10:=y+1;
    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Налоги') then begin rn8:=y+1; Tb.Cell[c3,y+1].Align:=AL_CENTER; end;
    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Получен аванс') then begin rn11:=y+1; Tb.Cell[c3,y+1].Align:=AL_CENTER; end;

    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Курсы') then begin rn9:=y+1; Tb.Cell[c3,y+1].Align:=AL_CENTER; end;

    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Доплата за интенсивность торговли') then begin Tb.Cell[c3,y+1].Align:=AL_CENTER; end;

    if (y+1<>rn7) and (y+1<>rn10) then
     Tb.Cell[2,y+1].AddText(DM.Qr.Fields[A[j]].FieldName);

    if AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Процент по выручке (базовый).') then
     Tb.Cell[2,y+1].AddText(#10+'Текущий % указан в доп. пункте "Выполнение планов за прошлый месяц"');

   end;

//  Tb.MergeCells(2,r1,2,r1+1);
  if r1<>-1 then Tb.MergeCells(c3,r1+1,3+DM.Qr.RecordCount,r1+1);

  if r2_<>-1 then
   begin
    Tb.MergeCells(c3,r2_,3+DM.Qr.RecordCount,r2_);
    Tb.Cell[c3,r2_].Align:=AL_CENTER;
   end;

  if r2__<>-1 then
   begin
    Tb.MergeCells(c3,r2__,3+DM.Qr.RecordCount,r2__);
    Tb.Cell[c3,r2__].Align:=AL_CENTER;
   end;

  if r2<>-1 then Tb.MergeCells(c3,r2,3+DM.Qr.RecordCount,r2);
  if r2<>-1 then Tb.MergeCells(1,r2+1,3+DM.Qr.RecordCount,r2+1);
  if r3<>-1 then Tb.MergeCells(c3,r3,3+DM.Qr.RecordCount,r3);

  if r4<>-1 then Tb.MergeCells(c3,r4,3+DM.Qr.RecordCount,r4);
  if r4<>-1 then Tb.MergeCells(1,r4+1,3+DM.Qr.RecordCount,r4+1);

  if r5<>-1 then Tb.MergeCells(c3,r5,3+DM.Qr.RecordCount,r5);
  if r5_1<>-1 then Tb.MergeCells(c3,r5_1,3+DM.Qr.RecordCount,r5_1);
  if rn12<>-1 then Tb.MergeCells(c3,rn12,3+DM.Qr.RecordCount,rn12);

  if r6<>-1 then Tb.MergeCells(c3,r6,3+DM.Qr.RecordCount,r6);
  if r7<>-1 then Tb.MergeCells(c3,r7,3+DM.Qr.RecordCount,r7);

  if r8<>-1 then Tb.MergeCells(c3,r8,3+DM.Qr.RecordCount,r8);

  if r9<>-1 then Tb.MergeCells(c3,r9,3+DM.Qr.RecordCount,r9);

  if rp2<>-1 then Tb.MergeCells(c3,rp2,3+DM.Qr.RecordCount,rp2);

  if rn1<>-1 then Tb.MergeCells(c3,rn1,3+DM.Qr.RecordCount,rn1);
  if rn2<>-1 then Tb.MergeCells(c3,rn2,3+DM.Qr.RecordCount,rn2);
  if rn3<>-1 then Tb.MergeCells(c3,rn3,3+DM.Qr.RecordCount,rn3);
  if rn4<>-1 then Tb.MergeCells(c3,rn4,3+DM.Qr.RecordCount,rn4);
//  if rn7<>-1 then Tb.MergeCells(c3,rn7,3+DM.Qr.RecordCount,rn7);
  if rn8<>-1 then Tb.MergeCells(c3,rn8,3+DM.Qr.RecordCount,rn8);

  if rn9<>-1 then Tb.MergeCells(c3,rn9,3+DM.Qr.RecordCount,rn9);

  if rn11<>-1 then Tb.MergeCells(c3,rn11,3+DM.Qr.RecordCount,rn11);

  Sum1:=0; Sum2:=0; Sum3:=0; SumH:=0; SumH_:=0; SumV:=0; SumD:=0; SumN5:=0; SumDN:=0;
  SumN_1:=0; SumN_2:=0; SumN_3:=0; SumN_4:=0; SumN_5:=0; SumN_8:=0; SumN_9:=0; SumN_11:=0; SumN_12:=0;
  SumN_10:=0;
  SumPPM:=0; SumStar:=0; SumPrem:=0;
  SumP1:=0; SumP2:=0; SumP3:=0; SumP4:=0; SumP5:=0;

  for i:=1 to DM.Qr.RecordCount do
   begin
    if i=1 then DM.Qr.First else DM.Qr.Next;
//    PrintRep.AddText('ФИО: '+DM.Qr.FieldByname('ФИО').AsString+#10#10);

    y:=0;
    for j:=Low(A) to High(A) do
     begin
      Inc(y);
      Tb.Cell[i+c3_,y+1].Align:=AL_RIGHT;

      if (y+1=rn1) or (y+1=rn2) or (y+1=rn3) or (y+1=rn4) or (y+1=rn5) or (y+1=rn6) or (y+1=rn7) or (y+1=rn8) or (y+1=rn9) or (y+1=rn11) or (y+1=r2_) or (y+1=r2__) or (y+1=r8) or (y+1=rp2) or (y+1=r9) then
       Tb.Cell[i+c3_,y+1].Align:=AL_CENTER;

      if (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)=AnsiLowerCase('Пересчет предыдущего месяца')) then
       begin
        SumPPM:=SumPPM+DM.Qr.Fields[A[j]].AsCurrency;
        Tb.Cell[i+c3_,y+1].AddText(CurrToStrF(-DM.Qr.Fields[A[j]].AsCurrency,ffFixed,2));

       end else

      if (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Удержания итого')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('ВСЕГО')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('ВЫРУЧКА ВСЕГО')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Премия')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Отработанные часы всего')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('в т. ч. свыше нормы')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Доплата за часы свыше нормы')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Уменьшение премии за несохранность ТМЦ')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Уменьшение премии за невыполнение функц. обязаностей')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Уменьшение премии за невыполнение правил коллект. ответств.')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Уменьшение премии за наруш. Правил Внутрен. Труд. Распоряд для работников')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Бонус к накоплению')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Региональная доплата')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Доплата за заведование')) and

         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Премия')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Региональная доплата')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Премия по выручке')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Премия за коллективную ответственность')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Премия за функционал')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Налоги')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Получен аванс')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Курсы')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Карточка')) and
         (AnsiLowerCase(DM.Qr.Fields[A[j]].FieldName)<>AnsiLowerCase('Депонент предыдущ. периода'))

         then
       if (DM.Qr.Fields[A[j]].AsString<>'') and (DM.Qr.Fields[A[j]].AsString<>'0') then
        Tb.Cell[i+c3_,y+1].AddText(DM.Qr.Fields[A[j]].AsString) else
       if ((Pos(AnsiUpperCase('Из них ('),AnsiUpperCase(DM.Qr.Fields[A[j]].FieldName))>0) or (Pos(AnsiUpperCase('(копилка)'),AnsiUpperCase(DM.Qr.Fields[A[j]].FieldName))>0)) and
          ((DM.Qr.Fields[A[j]].AsString='') or (DM.Qr.Fields[A[j]].AsString='0')) then
        Tb.Cell[i+c3_,y+1].AddText('0');

      if y+1=r1 then Inc(y);
      if y+1=r2 then Inc(y);
      if y+1=r4 then Inc(y);
     end;

    SumP1:=SumP1+DM.Qr.FieldByName('Премия').AsCurrency;
    SumP2:=SumP2+DM.Qr.FieldByName('Региональная доплата').AsCurrency;
    SumP3:=SumP3+DM.Qr.FieldByName('Премия по выручке').AsCurrency;
    SumP4:=SumP4+DM.Qr.FieldByName('Премия за коллективную ответственность').AsCurrency;
    SumP5:=SumP5+DM.Qr.FieldByName('Премия за функционал').AsCurrency;

    Sum1:=Sum1+DM.Qr.FieldByName('Уменьшение премии за несохранность ТМЦ').AsCurrency+
               DM.Qr.FieldByName('Уменьшение премии за невыполнение функц. обязаностей').AsCurrency+
               DM.Qr.FieldByName('Уменьшение премии за невыполнение правил коллект. ответств.').AsCurrency+
               DM.Qr.FieldByName('Уменьшение премии за наруш. Правил Внутрен. Труд. Распоряд для работников').AsCurrency+
//               DM.Qr.FieldByName('Бонус к накоплению').AsCurrency+
//               DM.Qr.FieldByName('Получен аванс').AsCurrency+
               DM.Qr.FieldByName('Ссуды').AsCurrency+
               DM.Qr.FieldByName('Уменьшение премии за нарушение правил трудовой дисциплины').AsCurrency;

    Sum2:=Sum2+DM.Qr.FieldByName('ВСЕГО').AsCurrency;
//    Sum3:=Sum3+DM.Qr.FieldByName('Заработная плата').AsCurrency;

    SumH:=SumH+DM.Qr.FieldByName('Отработанные часы всего').AsCurrency;
    SumH_:=SumH_+DM.Qr.FieldByName('в т. ч. свыше нормы').AsCurrency;
    SumDN:=SumDN+DM.Qr.FieldByName('Доплата за часы свыше нормы').AsCurrency;
    SumV:=SumV+DM.Qr.FieldByName('Выручка сотрудника за период').AsCurrency;
    SumD:=SumD+DM.Qr.FieldByName('Премия').AsCurrency;
    SumR:=SumR+DM.Qr.FieldByName('Региональная доплата').AsCurrency;

    SumN_1:=SumN_1+DM.Qr.FieldByName('Уменьшение премии за несохранность ТМЦ').AsCurrency;
    SumN_2:=SumN_2+DM.Qr.FieldByName('Уменьшение премии за невыполнение функц. обязаностей').AsCurrency;
    SumN_3:=SumN_3+DM.Qr.FieldByName('Уменьшение премии за невыполнение правил коллект. ответств.').AsCurrency;
    SumN_4:=SumN_4+DM.Qr.FieldByName('Уменьшение премии за наруш. Правил Внутрен. Труд. Распоряд для работников').AsCurrency;

    SumN_5:=SumN_5+DM.Qr.FieldByName('Бонус к накоплению').AsCurrency;

    SumN_10:=SumN_10+DM.Qr.FieldByName('Депонент предыдущ. периода').AsCurrency;

    SumN_8:=SumN_8+DM.Qr.FieldByName('Налоги').AsCurrency;
    SumN_9:=SumN_9+DM.Qr.FieldByName('Курсы').AsCurrency;
    SumN_11:=SumN_11+DM.Qr.FieldByName('Получен аванс').AsCurrency;
    SumN_12:=SumN_12+DM.Qr.FieldByName('Карточка').AsCurrency;


    SumStar:=SumStar+DM.Qr.FieldByName('Доплата за заведование').AsCurrency;

    SumPrem:=SumPrem+DM.Qr.FieldByName('Премия за коллективную ответственность').AsCurrency+
                    +DM.Qr.FieldByName('Премия за функционал').AsCurrency+
                    +DM.Qr.FieldByName('Премия по выручке').AsCurrency+
                    +DM.Qr.FieldByName('Премия за ночные смены').AsCurrency+
                    +DM.Qr.FieldByName('Премия за прирост').AsCurrency+
                    +DM.Qr.FieldByName('Доплата за категорию').AsCurrency+
                    +DM.Qr.FieldByName('Доплата за уборку').AsCurrency+
                    +SumBonus //DM.Qr.FieldByName('Бонус (копилка)').AsCurrency+
                    +DM.Qr.FieldByName('Премия за привлечение сотрудников').AsCurrency+
                    +DM.Qr.FieldByName('Премия за открытие аптеки').AsCurrency+
                    +DM.Qr.FieldByName('Премия').AsCurrency+
                    +DM.Qr.FieldByName('Региональная доплата').AsCurrency
                    -DM.Qr.FieldByName('Пересчет предыдущего месяца').AsCurrency;

   end;


//  Tb.Cell[c3,r1+1].Align:=AL_CENTER; Tb.Cell[c3,r1+1].Font.Style:=[fsBold]; Tb.Cell[c3,r1+1].AddText(CurrToStrF(Sum3-SumPPM,ffFixed,2));


  Tb.Cell[c3,r5].Align:=AL_CENTER; Tb.Cell[c3,r5].Font.Style:=[fsBold]; Tb.Cell[c3,r5].AddText(CurrToStrF(SumH,ffFixed,2));

  Tb.Cell[c3,r5_1].Align:=AL_CENTER; Tb.Cell[c3,r5_1].AddText(CurrToStrF(SumH_,ffFixed,2));
  Tb.Cell[c3,rn12].Align:=AL_CENTER; Tb.Cell[c3,rn12].AddText(CurrToStrF(SumDN,ffFixed,2));

  Tb.Cell[c3,r4].Align:=AL_CENTER; Tb.Cell[c3,r4].Font.Style:=[fsBold]; Tb.Cell[c3,r4].AddText(CurrToStrF(SumV,ffFixed,2));

  if rn1<>-1 then begin Tb.Cell[c3,rn1].Align:=AL_CENTER; Tb.Cell[c3,rn1].AddText(CurrToStrF(SumN_1,ffFixed,2)); end;
  if rn2<>-1 then begin Tb.Cell[c3,rn2].Align:=AL_CENTER; Tb.Cell[c3,rn2].AddText(CurrToStrF(SumN_2,ffFixed,2)); end;
  if rn3<>-1 then begin Tb.Cell[c3,rn3].Align:=AL_CENTER; Tb.Cell[c3,rn3].AddText(CurrToStrF(SumN_3,ffFixed,2)); end;
  if rn4<>-1 then begin Tb.Cell[c3,rn4].Align:=AL_CENTER; Tb.Cell[c3,rn4].AddText(CurrToStrF(SumN_4,ffFixed,2)); end;

//  if rn7<>-1 then begin Tb.Cell[c3,rn7].Align:=AL_CENTER; Tb.Cell[c3,rn7].AddText(CurrToStrF(SumN_5,ffFixed,2)); end;

  if rn8<>-1 then begin Tb.Cell[c3,rn8].Align:=AL_CENTER; Tb.Cell[c3,rn8].AddText(CurrToStrF(SumN_8,ffFixed,2)); end;
  if rn9<>-1 then begin Tb.Cell[c3,rn9].Align:=AL_CENTER; Tb.Cell[c3,rn9].AddText(CurrToStrF(SumN_9,ffFixed,2)); end;
  if rn11<>-1 then begin Tb.Cell[c3,rn11].Align:=AL_CENTER; Tb.Cell[c3,rn11].AddText(CurrToStrF(SumN_11,ffFixed,2)); end;

  if r9<>-1 then begin Tb.Cell[c3,r9].Align:=AL_CENTER; Tb.Cell[c3,r9].AddText(CurrToStrF(SumN_12,ffFixed,2)); end;

  if r6<>-1 then
   begin
    Tb.Cell[c3,r6].Align:=AL_CENTER; Tb.Cell[c3,r6].AddText(CurrToStrF(SumD,ffFixed,2));
   end;

  if r7<>-1 then
   begin
    Tb.Cell[c3,r7].Align:=AL_CENTER; Tb.Cell[c3,r7].AddText(CurrToStrF(SumR,ffFixed,2));
   end;

//  Tb.Cell[c3,r3].Align:=AL_CENTER;   Tb.Cell[c3,r3].AddText(CurrToStrF(Sum1,ffFixed,2));


  {-- Удержания из первых расчетных листов ---------------------------------------------------------------------------------------------------------------------------------------}
  DM.qrJPaySlip.Close;
  DM.qrJPaySlip.SQL.Clear;
  // Добавлено top 0 10.02.2017
  DM.qrJPaySlip.SQL.Add('select top 0 cast(id_payslip as uniqueidentifier) as id_payslip,Max(dt_begin) as dt_begin,Max(dt_end) as dt_end ');
  DM.qrJPaySlip.SQL.Add('from PaySlip (nolock) ');
  DM.qrJPaySlip.SQL.Add('where dt_begin>='''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and dt_end<='''+FormatDateTime('yyyy-mm-dd',dtEnd.Date)+''' ');

  DM.qrJPaySlip.SQL.Add(' and id_gamma='+IntToStr(Prm.ID_Gamma));

  Ch:=Chr(160);
//  qrJPaySlip.SQL.Add(' and id_apteka='+IntToStr(Prm.AptekaID));
  DM.qrJPaySlip.SQL.Add('group by cast(id_payslip as uniqueidentifier) ');
  DM.qrJPaySlip.Open;

  SumN1:=0; SumN2:=0; SumN3:=0; SumN4:=0; SumN6:=0; SumN4_:=0; SumStarsh:=0; SumStarsh1:=0;
  for i:=1 to DM.qrJPaySlip.RecordCount do
   begin
    if i=1 then DM.qrJPaySlip.First else DM.qrJPaySlip.Next;

    DM.Qr.SQL.Clear;
    DM.Qr.SQL.Add('select * ');
    DM.Qr.SQL.Add('from PAYSLIP (nolock) ');
    DM.Qr.SQL.Add('where cast(id_payslip as uniqueidentifier)= '''+DM.qrJPaySlip.FieldByName('id_payslip').AsString+''' ');
    DM.Qr.SQL.Add('      and Section=''НачисленоУдержано'' and Param in (6,8) ');
    DM.Qr.SQL.Add('order by numstr,param ');
    DM.Qr.Open;

    //Sm:=StrToFloat(StringReplace(DM.Qr.FieldByName('Value').AsString,',','.',[rfReplaceAll, rfIgnoreCase]));
    if DM.Qr.Locate('Value','Компенсация неиспользованного отпуска',[]) then begin DM.Qr.Next; SumN6:=SumN6+StrToFloat(StringReplace(StringReplace(DM.Qr.FieldByName('Value').AsString,',','.',[rfReplaceAll, rfIgnoreCase]),Ch,'',[rfReplaceAll, rfIgnoreCase])); end;

    if DM.Qr.Locate('Value','ПДФО',[]) then begin DM.Qr.Next; SumN1:=SumN1+StrToFloat(StringReplace(StringReplace(DM.Qr.FieldByName('Value').AsString,',','.',[rfReplaceAll, rfIgnoreCase]),Ch,'',[rfReplaceAll, rfIgnoreCase])); end;

    if DM.Qr.Locate('Value','Удержание ЕСВ с сотрудников (3,6 %)',[]) then begin DM.Qr.Next; SumN2:=SumN2+StrToFloat(StringReplace(StringReplace(DM.Qr.FieldByName('Value').AsString,',','.',[rfReplaceAll, rfIgnoreCase]),Ch,'',[rfReplaceAll, rfIgnoreCase])); end;
    if DM.Qr.Locate('Value','Военный сбор',[]) then begin DM.Qr.Next; SumN3:=SumN3+StrToFloat(StringReplace(StringReplace(DM.Qr.FieldByName('Value').AsString,',','.',[rfReplaceAll, rfIgnoreCase]),Ch,'',[rfReplaceAll, rfIgnoreCase])); end;

    if DM.Qr.Locate('Value','Удержание ЕСВ по больничным листам (2 %)',[]) then begin DM.Qr.Next; SumN5:=SumN5+StrToFloat(StringReplace(StringReplace(DM.Qr.FieldByName('Value').AsString,',','.',[rfReplaceAll, rfIgnoreCase]),Ch,'',[rfReplaceAll, rfIgnoreCase])); end;


    if DM.Qr.Locate('Value','Профсоюзные взносы 0,35%',[]) then begin DM.Qr.Next; SumN4:=SumN4+StrToFloat(StringReplace(StringReplace(DM.Qr.FieldByName('Value').AsString,',','.',[rfReplaceAll, rfIgnoreCase]),Ch,'',[rfReplaceAll, rfIgnoreCase])); end;
    if DM.Qr.Locate('Value','Профсоюзные взносы 0,65%',[]) then begin DM.Qr.Next; SumN4:=SumN4+StrToFloat(StringReplace(StringReplace(DM.Qr.FieldByName('Value').AsString,',','.',[rfReplaceAll, rfIgnoreCase]),Ch,'',[rfReplaceAll, rfIgnoreCase])); end;

    if DM.Qr.Locate('Value','Погашение займа',[]) then begin DM.Qr.Next; SumN4_:=SumN4_+StrToFloat(StringReplace(StringReplace(DM.Qr.FieldByName('Value').AsString,',','.',[rfReplaceAll, rfIgnoreCase]),Ch,'',[rfReplaceAll, rfIgnoreCase])); end;

    DM.Qr.SQL.Clear;
    DM.Qr.SQL.Add('select * ');
    DM.Qr.SQL.Add('from PAYSLIP (nolock) ');
    DM.Qr.SQL.Add('where cast(id_payslip as uniqueidentifier)= '''+DM.qrJPaySlip.FieldByName('id_payslip').AsString+''' ');
    DM.Qr.SQL.Add('      and Section=''НачисленоУдержано'' and Param in (0,5) ');
    DM.Qr.SQL.Add('order by numstr,param ');
    DM.Qr.Open;

    for ii:=1 to DM.Qr.RecordCount do
     begin
      if ii=1 then DM.Qr.First else DM.Qr.Next;
      if DM.Qr.FieldByName('Value').AsString='Надбавка за старшинство' then
       begin
        DM.Qr.Next;
        SumStarsh:=SumStarsh+StrToFloat(StringReplace(StringReplace(DM.Qr.FieldByName('Value').AsString,',','.',[rfReplaceAll, rfIgnoreCase]),Ch,'',[rfReplaceAll, rfIgnoreCase]));
        DM.Qr.Prior;
       end;
      if DM.Qr.FieldByName('Value').AsString='Надбавка за старшинство (по внутр. совмест-ву)' then
       begin
        DM.Qr.Next;
        SumStarsh1:=SumStarsh1+StrToFloat(StringReplace(StringReplace(DM.Qr.FieldByName('Value').AsString,',','.',[rfReplaceAll, rfIgnoreCase]),Ch,'',[rfReplaceAll, rfIgnoreCase]));
        DM.Qr.Prior;
       end;
     end;

{
    if DM.Qr.Locate('Value','Надбавка за старшинство',[]) then begin DM.Qr.Next; SumStarsh:=SumStarsh+StrToFloat(StringReplace(StringReplace(DM.Qr.FieldByName('Value').AsString,',','.',[rfReplaceAll, rfIgnoreCase]),Ch,'',[rfReplaceAll, rfIgnoreCase]));       end;
    if DM.Qr.Locate('Value','Надбавка за старшинство (по внутр. совмест-ву)',[]) then begin DM.Qr.Next; SumStarsh1:=SumStarsh1+StrToFloat(StringReplace(StringReplace(DM.Qr.FieldByName('Value').AsString,',','.',[rfReplaceAll, rfIgnoreCase]),Ch,'',[rfReplaceAll, rfIgnoreCase])); end;
}
   end;

  if SumStar-SumStarsh-SumStarsh1>0 then SumStar:=SumStar-SumStarsh-SumStarsh1 else SumStar:=0;

  SumPrem:=SumPrem+SumStar;

  if r8<>-1 then
   begin
    Tb.Cell[c3,r8].AddText(CurrToStrF(SumStar,ffFixed,2));
   end;


  DM.QrEx.Close;
  DM.QrEx.SQl.Clear;
  DM.QrEx.SQL.Add('select value ');
  DM.QrEx.SQL.Add('from PaySlip ');
  DM.QrEx.SQL.Add('where id_gamma='+IntToStr(Prm.Id_Gamma)+' and ');
  DM.QrEx.SQL.Add('      dt_begin>='''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and dt_end<='''+FormatDateTime('yyyy-mm-dd',dtEnd.Date)+''' ');
  DM.QrEx.SQL.Add('      and [Section]=''Всего'' and Param=0 ');
  DM.QrEx.Open;

  SumAll:=0;
  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    SumAll:=SumAll+StrToFloat(StringReplace(StringReplace(DM.QrEx.FieldByName('Value').AsString,',','.',[rfReplaceAll, rfIgnoreCase]),Ch,'',[rfReplaceAll, rfIgnoreCase]));
   end;

  {Tb.Cell[c3,r2].Font.Size:=5;}
  Sum2:=Sum2; {-SumAll}
  if r2<>-1 then
   begin
    Tb.Cell[2,r2].AddText('ВСЕГО');
    Tb.Cell[c3,r2].Align:=AL_CENTER; Tb.Cell[c3,r2].Font.Style:=[fsBold];  Tb.Cell[c3,r2].AddText(CurrToStrF(Sum2,ffFixed,2));
   end;

  Razn:=Sum2-SumPrem;

{

  -- Закоментировано 17.03.2016
  if Razn>0 then
   begin
    if rp1<>-1 then Tb.Cell[c3,rp1].AddText(CurrToStrF(SumP1+Razn,ffFixed,2));
   end else begin
             Razn:=Abs(Razn);
             if Razn>SumP1 then begin Razn:=Razn-SumP1; SumP1:=0; end else begin SumP1:=SumP1-Razn; Razn:=0; end;
             if Razn>SumP2 then begin Razn:=Razn-SumP2; SumP2:=0; end else begin SumP2:=SumP2-Razn; Razn:=0; end;
             if Razn>SumP3 then begin Razn:=Razn-SumP3; SumP3:=0; end else begin SumP3:=SumP3-Razn; Razn:=0; end;
             if Razn>SumP4 then begin Razn:=Razn-SumP4; SumP4:=0; end else begin SumP4:=SumP4-Razn; Razn:=0; end;
             if Razn>SumP5 then begin Razn:=Razn-SumP5; SumP5:=0; end else begin SumP5:=SumP5-Razn; Razn:=0; end;
             if rp1<>-1 then Tb.Cell[c3,rp1].AddText(CurrToStrF(SumP1,ffFixed,2));
            end;
}
  if rp1<>-1 then Tb.Cell[c3,rp1].AddText(CurrToStrF(SumP1,ffFixed,2));

  if rp2<>-1 then Tb.Cell[c3,rp2].AddText(CurrToStrF(SumP2,ffFixed,2));
  if rp3<>-1 then Tb.Cell[c3,rp3].AddText(CurrToStrF(SumP3,ffFixed,2));
  if rp4<>-1 then Tb.Cell[c3,rp4].AddText(CurrToStrF(SumP4,ffFixed,2));
  if rp5<>-1 then Tb.Cell[c3,rp5].AddText(CurrToStrF(SumP5,ffFixed,2));

//  if Razn<>0 then Tb.Cell[c3,r9].AddText(CurrToStrF(Razn,ffFixed,2));

  Inc(y,1);
  Dec(y,5);
{
  Inc(ind); Tb.Cell[1,y+1].Align:=AL_RIGHT; Tb.Cell[1,y+1].AddText(IntToStr(ind)); Tb.Cell[2,y+1].AddText('Подоходный налог (НДФЛ 15%)');
  Tb.Cell[c3,y+1].Align:=AL_CENTER; Tb.Cell[c3,y+1].AddText(CurrToStrF(SumN1,ffFixed,2)); Tb.Cell[3,y+1].AddText('Закон Украины');

  Tb.MergeCells(4,y+1,3+DM.Qr.RecordCount,y+1);

  Inc(ind); Tb.Cell[1,y+2].Align:=AL_RIGHT; Tb.Cell[1,y+2].AddText(IntToStr(ind)); Tb.Cell[2,y+2].AddText('Пенсионный фонд (ЕСВ 3.6%)');
  Tb.Cell[c3,y+2].Align:=AL_CENTER; Tb.Cell[c3,y+2].AddText(CurrToStrF(SumN2,ffFixed,2)); Tb.Cell[3,y+2].AddText('Закон Украины');
  Tb.MergeCells(4,y+2,3+DM.Qr.RecordCount,y+2);

  Inc(ind); Tb.Cell[1,y+3].Align:=AL_RIGHT; Tb.Cell[1,y+3].AddText(IntToStr(ind)); Tb.Cell[2,y+3].AddText('Военный сбор (1.5%)');
  Tb.Cell[c3,y+3].Align:=AL_CENTER; Tb.Cell[c3,y+3].AddText(CurrToStrF(SumN3,ffFixed,2)); Tb.Cell[3,y+3].AddText('Закон Украины');
  Tb.MergeCells(4,y+3,3+DM.Qr.RecordCount,y+3);

  Inc(ind); Tb.Cell[1,y+4].Align:=AL_RIGHT; Tb.Cell[1,y+4].AddText(IntToStr(ind)); Tb.Cell[2,y+4].AddText('Удержание по больн. листам (ЕСВ 2%)');
  Tb.Cell[c3,y+4].Align:=AL_CENTER; Tb.Cell[c3,y+4].AddText(CurrToStrF(SumN5,ffFixed,2));
  Tb.MergeCells(4,y+4,3+DM.Qr.RecordCount,y+4); Tb.Cell[3,y+4].AddText('Закон Украины');


  Inc(ind); Tb.Cell[1,y+5].Align:=AL_RIGHT; Tb.Cell[1,y+5].AddText(IntToStr(ind)); Tb.Cell[2,y+5].AddText('Профсоюзный взнос (1%)');
  Tb.Cell[c3,y+5].Align:=AL_CENTER; Tb.Cell[c3,y+5].AddText(CurrToStrF(SumN4,ffFixed,2));
  Tb.MergeCells(4,y+5,3+DM.Qr.RecordCount,y+5);
}
  Dec(y,1);
//  if rn7<>-1 then Dec(y,1);
{
  Inc(ind); Tb.Cell[1,y+6].Align:=AL_RIGHT; Tb.Cell[1,y+6].AddText(IntToStr(ind)); Tb.Cell[2,y+6].AddText('Погашение займа');
  Tb.Cell[c3,y+6].Align:=AL_CENTER; Tb.Cell[c3,y+6].AddText(CurrToStrF(SumN4_,ffFixed,2));
  Tb.MergeCells(4,y+6,3+DM.Qr.RecordCount,y+6);
}
  {
  Inc(ind); Tb.Cell[1,y+7].Align:=AL_RIGHT; Tb.Cell[1,y+7].AddText(IntToStr(ind)); Tb.Cell[2,y+7].AddText('Компенсация неиспользованного отпуска');
  Tb.Cell[c3,y+7].Align:=AL_CENTER; Tb.Cell[c3,y+7].AddText(CurrToStrF(SumN6,ffFixed,2));
  Tb.MergeCells(4,y+7,3+DM.Qr.RecordCount,y+7);
}
  Dec(y);

  if rn7=-1 then
   begin
    Inc(ind); Tb.Cell[1,y+8].Align:=AL_RIGHT; Tb.Cell[1,y+8].AddText(IntToStr(ind));
   end;
  Tb.Cell[2,y+8].Font.Style:=[fsBold]; Tb.Cell[2,y+8].AddText('ВСЕГО');
  Tb.MergeCells(c3,y+8,3+DM.Qr.RecordCount,y+8);


  // Всего удержано вывод суммы
  Tb.Cell[c3,y+8].Align:=AL_CENTER;
  Tb.Cell[c3,y+8].Font.Style:=[fsBold];
//  Tb.Cell[c3,y+8].AddText(CurrToStrF({Sum1+SumN1+SumN2+SumN3+SumN4+SumN5+SumN6+}SumN4_,ffFixed,2));
//  ShowMessage(CurrToStrF(Sum1+SumN_8+SumN_9+SumN_11+SumN_12,ffFixed,2));
  Tb.Cell[c3,y+8].AddText(CurrToStrF(Sum1+SumN_8+SumN_9+SumN_11+SumN_12,ffFixed,2));

  Tb.MergeCells(1,y+9,3+DM.Qr.RecordCount,y+9);

  if SumN_10>0 then
   begin
    Inc(ind); Tb.Cell[1,y+10].Align:=AL_RIGHT; Tb.Cell[1,y+10].AddText(IntToStr(ind)); Tb.Cell[2,y+10].Font.Style:=[fsBold]; Tb.Cell[2,y+10].AddText('К выплате');
    // К выплате (без учето депонента)
    Tb.Cell[c3,y+10].Align:=AL_CENTER;
    Tb.Cell[c3,y+10].Font.Style:=[fsBold];
    Tb.Cell[c3,y+10].AddText(CurrToStrF(Sum2-(Sum1+SumN_8+SumN_9{+SumN_5}+SumN_11+SumN_12),ffFixed,0));
    Inc(y);

    Inc(ind);
    Tb.Cell[1,y+10].Align:=AL_RIGHT; Tb.Cell[1,y+10].AddText(IntToStr(ind)); Tb.Cell[2,y+10].AddText('Депонент предыдущего периода');
    Tb.Cell[c3,y+10].Align:=AL_CENTER;
    Tb.Cell[c3,y+10].AddText(CurrToStrF(SumN_10,ffFixed,0));
    Inc(y);
   end;

  Inc(ind); Tb.Cell[1,y+10].Align:=AL_RIGHT; Tb.Cell[1,y+10].AddText(IntToStr(ind)); Tb.Cell[2,y+10].Font.Style:=[fsBold]; Tb.Cell[2,y+10].AddText('К выплате всего');

  Tb.MergeCells(c3,y+10,3+DM.Qr.RecordCount,y+10);

  // К выплате всего
  Tb.Cell[c3,y+10].Align:=AL_CENTER;
  Tb.Cell[c3,y+10].Font.Style:=[fsBold];
  Tb.Cell[c3,y+10].AddText(CurrToStrF(Sum2-(Sum1+SumN_8+SumN_9+SumN_5-SumN_10+SumN_11+SumN_12+0.01),ffFixed,0));

  // Вывод Бонус к накоплению
  Inc(y);
  if rn7<>-1 then
   begin
    Tb.MergeCells(c3,y+10,3+DM.Qr.RecordCount,y+10);
    Inc(ind);
    Tb.Cell[1,y+10].Align:=AL_RIGHT;
    Tb.Cell[1,y+10].AddText(IntToStr(ind));
    Tb.Cell[2,y+10].Font.Style:=[fsBold];
    Tb.Cell[2,y+10].AddText('Бонус к накоплению');

    Tb.Cell[c3,y+10].Align:=AL_CENTER;
    Tb.Cell[c3,y+10].AddText(CurrToStrF(SumN_5,ffFixed,0));
   end;

{
  PrintRep.Indent:=0;
  PrintRep.Font.Size:=5;
  PrintRep.AddText(#10);
  PrintRep.AddText('Удержания итого: '+CurrToStrF(Sum1,ffFixed,2)+#10);
  PrintRep.AddText('Зарплата итого: '+CurrToStrF(Sum2,ffFixed,2));
}
  SmP:=0;
  if FormatDateTime('yyyy-mm-dd',DM.qrJPaySlip1.FieldByname('dt').AsDateTime)='2017-11-01' then
   begin
    DM.Qr.Close;
    DM.Qr.SQL.Text:='select Sum(Summ) as Sm from Prior8_11_2017 where id_gamma='+IntToStr(Prm.ID_Gamma);
    DM.Qr.Open;
    SmP:=DM.Qr.FieldByName('Sm').AsCurrency;
   end;

  DM.Qr.SQL.Clear;
  DM.Qr.SQL.Add('select Аптека,');
  DM.Qr.SQL.Add(' Sum([Привлечение сотрудников]) as [Бонус (копилка)], ');
  DM.Qr.SQL.Add(' Sum([Бонус_ФармЗамена]) as [Из них (фармзамена)], ');
  DM.Qr.SQL.Add(' Sum([Бонус_ПланПродаж]) as [Из них (план продаж)], ');
  DM.Qr.SQL.Add(' Sum([Бонус_ПланНаАптеку]) as [Из них (план на аптеку)], ');
  DM.Qr.SQL.Add(' Sum([Бонус_Тестирование]) as [Из них (тестирование)], ');
  DM.Qr.SQL.Add(' Sum([Бонус_БроньСАптекиНаАптеку]) as [Из них (бронь с аптеки на аптеку)], ');
  DM.Qr.SQL.Add(' Sum([Бонус_БроньЗаказПодКлиента]) as [Из них (заказ под клиента)], ');
  DM.Qr.SQL.Add(' Sum([Бонус_ПредложениеСопутствующих]) as [Из них (предложение сопутствующих)], ');
  DM.Qr.SQL.Add(' Sum([Бонус_ПланПродажТотал]) as [Из них (план на аптеку комплексный)] ');
  DM.Qr.SQL.Add('from ZPLIST_VIEW  (nolock) ');
  DM.Qr.SQL.Add('where [ИД]='+IntToStr(Prm.ID_Gamma));
  DM.Qr.SQL.Add('      and _period='''+FormatDateTime('yyyy-mm-dd',DM.qrJPaySlip1.FieldByname('dt').AsDateTime)+''' ');
  DM.Qr.SQL.Add('group by Аптека ');
  DM.Qr.Open;
  RcB:=DM.Qr.RecordCount;
  PrintRep.AddInterv(5);

{
  if SmP>0 then
   PrintRep.AddTable(2+RcB,10)
  else
   PrintRep.AddTable(2+RcB,9);
}
  PrintRep.AddTable(2+RcB,10);
  PrintRep.LastTable.SetWidths('600,300');
  PrintRep.LastTable.Cell[1,1].Font.Style:=[fsBold];
  PrintRep.LastTable.Cell[2,1].Font.Style:=[fsBold];

  for i:=1 to 9 do
   PrintRep.LastTable.Cell[2,i].Align:=AL_CENTER;

{  if SmP>0 then
   begin
    PrintRep.LastTable.Cell[1,1].AddText('Бонус (копилка)'); PrintRep.LastTable.Cell[2,1].AddText(CurrToStrF(DM.Qr.FieldByName('Бонус (копилка)').AsCurrency-SmP,ffFixed,2))
   end else begin
            end;
}
  PrintRep.LastTable.Cell[1,1].AddText('Виды бонусов');
  PrintRep.LastTable.Cell[1,2].AddText('Бонус (копилка) (ВСЕГО)'); //PrintRep.LastTable.Cell[2,1].AddText(DM.Qr.FieldByName('Бонус (копилка)').AsString);
  PrintRep.LastTable.Cell[1,3].AddText('Из них (фармзамена)');
  PrintRep.LastTable.Cell[1,4].AddText('Из них (план продаж)');
  PrintRep.LastTable.Cell[1,5].AddText('Из них (план на аптеку)');
  PrintRep.LastTable.Cell[1,6].AddText('Из них (тестирование)');
  PrintRep.LastTable.Cell[1,7].AddText('Из них (бронь с аптеки на аптеку)');
  PrintRep.LastTable.Cell[1,8].AddText('Из них (заказ под клиента)');
  PrintRep.LastTable.Cell[1,9].AddText('Из них (предложение сопутствующих)');
  PrintRep.LastTable.Cell[1,10].AddText('Из них (план на аптеку комплексный)');

  for i:=Low(aSum) to High(aSum) do aSum[i]:=0;

  for i:=1 to RcB do
   begin
    if i=1 then DM.Qr.First else DM.Qr.Next;
    PrintRep.LastTable.Cell[2+i,1].Align:=AL_CENTER;
    PrintRep.LastTable.Cell[2+i,1].Font.Style:=[fsBold];
    PrintRep.LastTable.Cell[2+i,1].AddText(DM.Qr.FieldByName('Аптека').AsString);

    PrintRep.LastTable.Cell[2+i,2].Align:=AL_CENTER;
    PrintRep.LastTable.Cell[2+i,2].Font.Style:=[fsBold];
    aSum[1]:=aSum[1]+DM.Qr.FieldByName('Бонус (копилка)').AsCurrency; PrintRep.LastTable.Cell[2+i,2].AddText(DM.Qr.FieldByName('Бонус (копилка)').AsString);

    aSum[2]:=aSum[2]+DM.Qr.FieldByName('Из них (фармзамена)').AsCurrency;                 PrintRep.LastTable.Cell[2+i,3].Align:=AL_CENTER;  PrintRep.LastTable.Cell[2+i,3].AddText(DM.Qr.FieldByName('Из них (фармзамена)').AsString);
    aSum[3]:=aSum[3]+DM.Qr.FieldByName('Из них (план продаж)').AsCurrency;                PrintRep.LastTable.Cell[2+i,4].Align:=AL_CENTER;  PrintRep.LastTable.Cell[2+i,4].AddText(DM.Qr.FieldByName('Из них (план продаж)').AsString);
    aSum[4]:=aSum[4]+DM.Qr.FieldByName('Из них (план на аптеку)').AsCurrency;             PrintRep.LastTable.Cell[2+i,5].Align:=AL_CENTER;  PrintRep.LastTable.Cell[2+i,5].AddText(DM.Qr.FieldByName('Из них (план на аптеку)').AsString);
    aSum[5]:=aSum[5]+DM.Qr.FieldByName('Из них (тестирование)').AsCurrency;               PrintRep.LastTable.Cell[2+i,6].Align:=AL_CENTER;  PrintRep.LastTable.Cell[2+i,6].AddText(DM.Qr.FieldByName('Из них (тестирование)').AsString);
    aSum[6]:=aSum[6]+DM.Qr.FieldByName('Из них (бронь с аптеки на аптеку)').AsCurrency;   PrintRep.LastTable.Cell[2+i,7].Align:=AL_CENTER;  PrintRep.LastTable.Cell[2+i,7].AddText(DM.Qr.FieldByName('Из них (бронь с аптеки на аптеку)').AsString);
    aSum[7]:=aSum[7]+DM.Qr.FieldByName('Из них (заказ под клиента)').AsCurrency;          PrintRep.LastTable.Cell[2+i,8].Align:=AL_CENTER;  PrintRep.LastTable.Cell[2+i,8].AddText(DM.Qr.FieldByName('Из них (заказ под клиента)').AsString);
    aSum[8]:=aSum[8]+DM.Qr.FieldByName('Из них (предложение сопутствующих)').AsCurrency;  PrintRep.LastTable.Cell[2+i,9].Align:=AL_CENTER;  PrintRep.LastTable.Cell[2+i,9].AddText(DM.Qr.FieldByName('Из них (предложение сопутствующих)').AsString);
    aSum[9]:=aSum[9]+DM.Qr.FieldByName('Из них (план на аптеку комплексный)').AsCurrency; PrintRep.LastTable.Cell[2+i,10].Align:=AL_CENTER; PrintRep.LastTable.Cell[2+i,10].AddText(DM.Qr.FieldByName('Из них (план на аптеку комплексный)').AsString);
   end;

  PrintRep.LastTable.Cell[2,1].Align:=AL_CENTER;
  PrintRep.LastTable.Cell[2,1].Font.Style:=[fsBold];
  PrintRep.LastTable.Cell[2,1].AddText('Всего');
  for i:=Low(aSum) to High(aSum) do
   begin
    PrintRep.LastTable.Cell[2,1+i].Align:=AL_CENTER;
    PrintRep.LastTable.Cell[2,1+i].Font.Style:=[fsBold];
    PrintRep.LastTable.Cell[2,1+i].AddText(CurrToStrF(aSum[i],ffFixed,2));
   end;

 {
  if SmP>0 then
   begin
    PrintRep.LastTable.Cell[2,10].Align:=AL_CENTER;
    PrintRep.LastTable.Cell[1,10].AddText('Из них (план на аптеку комплексный) уже выплачено'); PrintRep.LastTable.Cell[2,10].AddText(CurrToStrF(-SmP,ffFixed,2));
   end;
 }
  PrintRep.PreView;
 end;

procedure TJPaySlipF1.ComboBox2Change(Sender: TObject);
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

