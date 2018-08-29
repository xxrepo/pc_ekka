unit JReocU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, Util, PrintReport, Menus, ShareU;

type
  TJReocF = class(TForm)
    Panel1: TPanel;
    Label8: TLabel;
    ComboBox2: TComboBox;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    pmPrnReg: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ComboBox1: TComboBox;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label1: TLabel;
    Panel4: TPanel;
    Label2: TLabel;
    Panel5: TPanel;
    Label4: TLabel;


    procedure ComboBox2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bbPrnActReoc(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private

    procedure ShowActReoc(P:Byte=0);
    procedure PrintCen(Param:Byte);

  public

  end;

var JReocF:TJReocF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TJReocF.ComboBox2Change(Sender: TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    dtStart.Date:=D1;
    dtEnd.Date:=D31;
    ShowActReoc;
   end;
 end;

procedure TJReocF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  dtStart.Date:=Date;
  dtEnd.Date:=Date;
  ShowActReoc;
 end;

procedure TJReocF.ShowActReoc(P:Byte=0);
var id:Integer;
 begin
  try
   if DM.qrActReoc.Active then ID:=DM.qrActReoc.FieldByName('iddoc').AsInteger;
   DM.qrActReoc.Close;
   DM.qrActReoc.SQL.Clear;

   if P=0 then
    DM.qrActReoc.SQL.Add('delete from ReocForPrint where compname=host_name() and id_user='+IntToStr(Prm.UserID) );

   DM.qrActReoc.SQL.Add('select o.iddoc,o.idvzr,o.idprc,o.nn_reoc,o.date_reoc,o.sumvzr,o.sumprc,o.IsPrintCen,o.IsPrintAct,case when p.id is not null then ''Да'' else null end as FORPRINT ');
   DM.qrActReoc.SQL.Add('from JActReoc o ');
   DM.qrActReoc.SQL.Add('      left join ');
   DM.qrActReoc.SQL.Add('     ReocForPrint p on p.typereoc=1 and o.iddoc=p.iddoc and p.compname=host_name() and p.id_user='+IntToStr(Prm.UserID));
   DM.qrActReoc.SQL.Add(' ');
   DM.qrActReoc.SQL.Add('where o.date_reoc>='''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+' 00:00:00'' and ');
   DM.qrActReoc.SQL.Add('date_reoc<='''+FormatDateTime('yyyy-mm-dd',dtEnd.Date)+' 00:00:00'' and (SumVzr>0 or SumPrc<>0) ');

   if (Prm.AptekaSklad) and (Prm.Dobraia=False) then
    begin
     DM.qrActReoc.SQL.Add(' union all ');
     DM.qrActReoc.SQL.Add('select Max(o.id),-1,-1,''Оптовая'',o.dt,null,null,Max(o.IsPrintCen),1 as IsPrintAct,case when Max(p.id) is not null then ''Да'' else null end as FORPRINT ');
     DM.qrActReoc.SQL.Add('from JReocOpt o ');
     DM.qrActReoc.SQL.Add('      left join ');
     DM.qrActReoc.SQL.Add('     ReocForPrint p on p.typereoc=2 and o.id=p.iddoc and p.compname=host_name() and p.id_user='+IntToStr(Prm.UserID));
     DM.qrActReoc.SQL.Add('where o.dt>='''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+' 00:00:00'' and o.dt<='''+FormatDateTime('yyyy-mm-dd',dtEnd.Date)+' 23:59:59'' ');
     DM.qrActReoc.SQL.Add('group by o.dt ');
    end;
   DM.qrActReoc.SQL.Add('order by 5 ');
//   DM.qrActReoc.SQL.SaveToFile('C:\ReocList.txt');

   DM.qrActReoc.Open;
   DM.qrActReoc.Locate('iddoc',id,[])
  except
  end;
 end;

procedure TJReocF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TJReocF.BitBtn1Click(Sender: TObject);
 begin
  ShowActReoc;
 end;

procedure TJReocF.DBGrid1DblClick(Sender:TObject);
 begin
  bbPrnActReoc(Sender);
 end;

procedure TJReocF.bbPrnActReoc(Sender:TObject);
var i,Rc,Kol:Integer;
    Tb:TTableObj;
    Dt:TDateTime;
    CenaV,CenaP,SumV,SumP:Currency;
    SumK:Integer;
    Sg:String;
 begin
  if DM.qrActReoc.IsEmpty then Exit;
  if DM.qrActReoc.FieldByName('idvzr').AsInteger=-1 then
   begin
    MainF.MessBox('Печать актов отповых переоценок невозможна. Можно только напечатать ценники.');
    Exit;
   end;
//  if (DM.qrActReoc.FieldByName('SumVzr').AsFloat=0) or (DM.qrActReoc.FieldByName('SumPrc').AsFloat=0) then Exit;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;

{
   DM.Qr.SQL.Add('if Object_ID(N''tempdb..#tmpn'') is not null drop table #tmpn');
   DM.Qr.SQL.Add('select b.art_code,a.f_nds,a.kod_name,a.kol,a.cena as cenav,convert(numeric(8,2),0.0) as cenap,b.names into #tmpn from Moves a, SprTov b');
   DM.Qr.SQL.Add('where a.kod_name=b.kod_name and a.kol>0 and ');
   DM.Qr.SQL.Add('a.iddoc='+DM.qrActReoc.FieldByName('idvzr').AsString);
   DM.Qr.SQL.Add('update #tmpn set cenap=a.cena');
   DM.Qr.SQL.Add('from Moves a, #tmpn b');
   DM.Qr.SQL.Add('where a.kod_name=b.kod_name and ');
   DM.Qr.SQL.Add('a.iddoc='+DM.qrActReoc.FieldByName('idprc').AsString);
   DM.Qr.SQL.Add('select art_code,f_nds,names,Sum(kol) as kol,cenav,cenap from #tmpn group by art_code,f_nds,names,cenav,cenap order by names');
}

   DM.Qr.SQL.Add('select s.art_code,j.f_nds,s.names,Sum(r.kol) as kol,r.cena_old as cenav,r.cena_new as cenap ');
   DM.Qr.SQL.Add('from rReoc r (nolock), ');
   DM.Qr.SQL.Add('     JMoves j (nolock), ');
   DM.Qr.SQL.Add('     SprTov s (nolock) ');
   DM.Qr.SQL.Add('where r.iddoc=j.iddoc and j.iddoc='+DM.qrActReoc.FieldByName('idvzr').AsString+' and s.kod_name=r.kod_name ');
   DM.Qr.SQL.Add('group by s.art_code,j.f_nds,s.names,r.cena_old,r.cena_new  ');
   DM.Qr.SQL.Add('having Sum(r.kol)>0  ');
   DM.Qr.SQL.Add('order by s.names  ');

//   DM.Qr.SQL.SaveToFile('C:\AktR.txt');
   DM.Qr.Open;

   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Size:=5;
   if DM.Qr.FieldByName('f_nds').AsInteger>2 then
    PrintRep.AddText(Opt.CHPName+#10)
   else
    PrintRep.AddText(Prm.FirmNameUA+#10);

   Dt:=DM.qrActReoc.FieldByName('Date_Reoc').AsDateTime;
   PrintRep.AddText('Дата установления / изменения цен на '+FormatDateTime('dd.mm.yyyy',Dt)+' г.');
   PrintRep.Align:=AL_CENTER;
   PrintRep.Font.Style:=[fsBold];
   if DM.Qr.FieldByName('f_nds').AsInteger>2 then
    PrintRep.AddText(#10#10#10+'Акт переоценки розничных цен на товары, реализуемых в '+Opt.CHPAddr+#10)
   else
    PrintRep.AddText(#10#10#10+'Акт переоценки розничных цен на товары, реализуемых в '+Prm.AptekaNameRU+#10);
   PrintRep.Font.Style:=[];

   SumK:=0; SumV:=0; SumP:=0;
   Rc:=DM.Qr.RecordCount;
   PrintRep.Font.Size:=4;
   PrintRep.AddTable(8,Rc+2);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('270,3200,250,800,800,800,800,800');
   Tb.Cell[1,1].AddText('№ з/п');
   Tb.Cell[2,1].AddText('Название товара');
   Tb.Cell[3,1].AddText('Ед изм.');
   Tb.Cell[4,1].AddText('Кол-во по состоянию на '+FormatDateTime('dd.mm.yy',Dt-1));
   Tb.Cell[5,1].AddText('Цена реализации до '+FormatDateTime('dd.mm.yy',Dt)+', в грн.');
   Tb.Cell[6,1].AddText('Сумма ТМЦ на '+FormatDateTime('dd.mm.yy',Dt-1)+', в грн.');
   Tb.Cell[7,1].AddText('Цена реализации с '+FormatDateTime('dd.mm.yy',Dt)+', в грн.');
   Tb.Cell[8,1].AddText('Сумма ТМЦ с '+FormatDateTime('dd.mm.yy',Dt)+', в грн.');
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;

     Tb.Cell[1,i+1].AddText(IntToStr(i));
     Tb.Cell[2,i+1].Align:=AL_LEFT;
     Tb.Cell[2,i+1].AddText(DM.Qr.FieldByName('Names').AsString);
     Tb.Cell[3,i+1].AddText('шт');
     Kol:=DM.Qr.FieldByName('Kol').AsInteger;
     Inc(SumK,Kol);
     Tb.Cell[4,i+1].AddText(IntToStr(Kol));
     CenaV:=DM.Qr.FieldByName('CenaV').AsFloat;
     Tb.Cell[5,i+1].AddText(CurrToStrF(CenaV,ffFixed,2));
     Tb.Cell[6,i+1].AddText(CurrToStrF(CenaV*Kol,ffFixed,2));

     CenaP:=DM.Qr.FieldByName('CenaP').AsFloat;
     Tb.Cell[7,i+1].AddText(CurrToStrF(CenaP,ffFixed,2));
     Tb.Cell[8,i+1].AddText(CurrToStrF(CenaP*Kol,ffFixed,2));
     SumV:=SumV+Kol*CenaV;
     SumP:=SumP+Kol*CenaP;
    end;
   Tb.Cell[2,Rc+2].Align:=AL_LEFT;
   Tb.Cell[2,Rc+2].Font.Style:=[fsBold];
   Tb.Cell[2,Rc+2].AddText('ИТОГО:');

   Tb.Cell[4,Rc+2].Font.Style:=[fsBold];
   Tb.Cell[4,Rc+2].AddText(IntToStr(SumK));

   Tb.Cell[6,Rc+2].Font.Style:=[fsBold];
   Tb.Cell[6,Rc+2].AddText(CurrToStrF(SumV,ffFixed,2));

   Tb.Cell[8,Rc+2].Font.Style:=[fsBold];
   Tb.Cell[8,Rc+2].AddText(CurrToStrF(SumP,ffFixed,2));
   if SumP-SumV<0 then Sg:='-' else Sg:='';
   PrintRep.Font.Size:=6;
   PrintRep.Align:=AL_LEFT;
   PrintRep.AddText(#10#10+'Сумма переоценки составляет: '+Sg+' '+CurrToWordsRU(Abs(SumP-SumV),0)+' ');
   PrintRep.AddText('('+CurrToStrF(SumP-SumV,ffFixed,2)+')');

   if Prm.AptekaID=123 then
    PrintRep.AddText(#10#10#10'Зав. магазином________________________')
   else
    PrintRep.AddText(#10#10#10'Зав. аптекой(киоском)________________________');

   if PrintRep.PreView then
    begin
     DM.Qr.Close;
     DM.Qr.SQL.Clear;

     if CheckBox1.Checked=False then
      begin
       if DM.qrActReoc.FieldByName('idvzr').AsInteger<>-1 then
        DM.Qr.SQL.Add('update JMoves set IsPrintAct=1 where iddoc='+DM.qrActReoc.FieldByName('iddoc').AsString);
      end else
     if (CheckBox1.Checked=True) and (CheckBox3.Checked=False) then
      begin
       DM.Qr.SQL.Add('update JMoves set IsPrintAct=1 where vis is null and reoc=1 and date_nakl between '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' ');
      end else
     if (CheckBox3.Checked=True) then
      begin
       DM.Qr.SQL.Add('update JMoves set IsPrintAct=1 where vis is null and reoc=1   ');
       DM.Qr.SQL.Add(' and iddoc in (select iddoc from ReocForPrint where compname=host_name() and typereoc=1 and id_user='+IntToStr(Prm.UserID)+' )  ');
      end;

     DM.Qr.SQL.Add('select 9999 as Res');
     DM.Qr.Open;
     ShowActReoc;
    end;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования акта переоценки: '+E.Message);
  end;
 end;

procedure TJReocF.BitBtn4Click(Sender: TObject);
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

procedure TJReocF.PrintCen(Param:Byte);
var Skd:Integer;
 begin
  try
   if DM.qrActReoc.IsEmpty then Exit;
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('if Object_ID(N''tempdb..#tmpcen'') is not null drop table #tmpcen');
     DM.Qr.SQL.Add('select top 0 convert(int,null) as iddoc, convert(tinyint,null) as Pr into #tmpcen');

     if CheckBox1.Checked then
      begin
       DM.Qr.SQL.Add('select b.Art_code,b.Names,Max(b.Cena)*dbo.GetKoef(b.Art_code) as Cena, IsNull(Max(s.CenaP)*dbo.GetKoef(b.Art_code),0) as CenaP,dbo.GetKoef(b.Art_code) as koef, dbo.GetCenaOpt(b.art_code)*dbo.GetKoef(b.Art_code) as CenaOpt, Max(l.art_code) as Skd3, ');

       if MainF.MaxSkd>0 then
        DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where type_skd=4 and art_code=b.art_code),IsNull((select Max(skd) from Skd where type_skd=1),0)) as Skd, ') else
       if MainF.MaxSkd<=-3 then
        DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where skd<3 and type_skd=4 and art_code=b.art_code),'+IntToStr(Abs(Round(MainF.MaxSkd)))+') as Skd, ')
       else
        DM.Qr.SQL.Add('0 as Skd, ');

       DM.Qr.SQL.Add('IsNull((select Max(ean13) from SprEan where art_code=b.art_code),'''') as Ean13,c.P1,c.P2,c.P3');
       DM.Qr.SQL.Add('from rReoc a (nolock), JMoves j (nolock), SprTovar s (nolock) left join SkdLimit0 l (nolock) on s.art_code=l.art_code, SprTov b (nolock) left join Inform..SprReg c on b.art_code=c.art_code');
       DM.Qr.SQL.Add('where j.reoc=1 and a.iddoc=j.iddoc and a.kod_name=b.kod_name and b.ostat>0 and  ');
       DM.Qr.SQL.Add('      s.art_code=b.art_code and j.date_nakl between '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' ');

       if CheckBox2.Checked then
        begin
         DM.Qr.SQL.Add(' and b.art_code not in (select s1.art_code from rTovar r1 (nolock), JMoves j1 (nolock), SprTov s1 (nolock) ');
         DM.Qr.SQL.Add('                        where r1.iddoc=j1.iddoc and r1.kod_name=s1.kod_name and  ');
         DM.Qr.SQL.Add('                              j1.date_nakl between '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' ');
         DM.Qr.SQL.Add('                        group by s1.art_code) ');
        end;

       if RadioButton2.Checked then DM.Qr.SQL.Add(' and c.P2>0 ') else
       if RadioButton3.Checked then DM.Qr.SQL.Add(' and IsNull(c.P1,0)=0 ');

       if CheckBox3.Checked then DM.Qr.SQL.Add(' and j.iddoc in (select iddoc from ReocForPrint where compname=host_name() and typereoc=1 and id_user='+IntToStr(Prm.UserID)+' ) ');

       DM.Qr.SQL.Add('group by b.Art_code,b.Names,c.P1,c.P2,c.P3 ');

{
       DM.Qr.SQL.Add('insert into #tmpcen ');
       DM.Qr.SQL.Add('select iddoc,1 from jMoves (nolock)');
       DM.Qr.SQL.Add('where date_nakl between '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' and ');
       DM.Qr.SQL.Add('      reoc=1 ');
       if CheckBox3.Checked then DM.Qr.SQL.Add(' and iddoc in (select iddoc from ReocForPrint where compname=host_name() and typereoc=1 and id_user='+IntToStr(Prm.UserID)+' ) ');
}

       if Prm.AptekaSklad then
        begin
         DM.Qr.SQL.Add(' union ');

         DM.Qr.SQL.Add('select b.art_code,b.names,Max(b.Cena)*dbo.GetKoef(b.Art_code) as Cena, IsNull(Max(s.CenaP)*dbo.GetKoef(b.Art_code),0) as CenaP,dbo.GetKoef(b.Art_code) as koef, dbo.GetCenaOpt(b.art_code)*dbo.GetKoef(b.Art_code) as CenaOpt,Max(l.art_code) as Skd3,');
         if MainF.MaxSkd>0 then
          DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where type_skd=4 and art_code=b.art_code),IsNull((select Max(skd) from Skd where type_skd=1),0)) as Skd, ') else
         if MainF.MaxSkd<=-3 then
          DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where skd<3 and type_skd=4 and art_code=b.art_code),'+IntToStr(Abs(Round(MainF.MaxSkd)))+') as Skd, ')
         else
          DM.Qr.SQL.Add('0 as Skd, ');

         DM.Qr.SQL.Add('IsNull((select Max(ean13) from SprEan where art_code=b.art_code),'''') as Ean13,c.P1,c.P2,c.P3');

         DM.Qr.SQL.Add('from JReocOpt o (nolock), SprTovar s (nolock) left join SkdLimit0 l (nolock) on s.art_code=l.art_code, SprTov b (nolock) left join Inform..SprReg c on b.art_code=c.art_code ');
         DM.Qr.SQL.Add('where b.ostat>0 and');
         DM.Qr.SQL.Add('      o.art_code=s.art_code and ');
         DM.Qr.SQL.Add('      s.art_code=b.art_code and IsNull(o.Cena_Old,0)<>o.Cena_New and IsNull(o.Cena_New,0)>0 ');
         DM.Qr.SQL.Add('      and o.dt between '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' ');

         if CheckBox2.Checked then
          begin
           DM.Qr.SQL.Add(' and b.art_code not in (select s1.art_code from rTovar r1 (nolock), JMoves j1 (nolock), SprTov s1 (nolock) ');
           DM.Qr.SQL.Add('                        where r1.iddoc=j1.iddoc and r1.kod_name=s1.kod_name and  ');
           DM.Qr.SQL.Add('                              j1.date_nakl between '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' ');
           DM.Qr.SQL.Add('                        group by s1.art_code) ');
          end;

         if RadioButton2.Checked then DM.Qr.SQL.Add(' and c.P2>0 ') else
         if RadioButton3.Checked then DM.Qr.SQL.Add(' and IsNull(c.P1,0)=0 ');

         if CheckBox3.Checked then DM.Qr.SQL.Add(' and convert(varchar,o.dt,20) in (select convert(varchar,dtreoc,20) from ReocForPrint where compname=host_name() and typereoc=2 and id_user='+IntToStr(Prm.UserID)+' ) ');

         DM.Qr.SQL.Add('group by b.Art_code,b.Names,c.P1,c.P2,c.P3 ');

{
         DM.Qr.SQL.Add('insert into #tmpcen ');
         DM.Qr.SQL.Add('select iddoc,1 from JReocOpt (nolock)');
         DM.Qr.SQL.Add('where date_nakl between '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' and ');
         DM.Qr.SQL.Add('      reoc=1 ');
         if CheckBox3.Checked then DM.Qr.SQL.Add(' and iddoc in (select iddoc from ReocForPrint where compname=host_name() and typereoc=1 and id_user='+IntToStr(Prm.UserID)+' ) ');
}
        end;
      end else
     if DM.qrActReoc.FieldByName('idvzr').AsInteger<>-1 then
      begin
       DM.Qr.SQL.Add('select b.Art_code,b.Names,Max(b.Cena)*dbo.GetKoef(b.Art_code) as Cena, IsNull(Max(s.CenaP)*dbo.GetKoef(b.Art_code),0) as CenaP,dbo.GetKoef(b.Art_code) as koef, dbo.GetCenaOpt(b.art_code)*dbo.GetKoef(b.Art_code) as CenaOpt, Max(l.art_code) as Skd3, ');

       if MainF.MaxSkd>0 then
        DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where type_skd=4 and art_code=b.art_code),IsNull((select Max(skd) from Skd where type_skd=1),0)) as Skd, ') else
       if MainF.MaxSkd<=-3 then
        DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where skd<3 and type_skd=4 and art_code=b.art_code),'+IntToStr(Abs(Round(MainF.MaxSkd)))+') as Skd, ')
       else
        DM.Qr.SQL.Add('0 as Skd, ');

       DM.Qr.SQL.Add('IsNull((select Max(ean13) from SprEan where art_code=b.art_code),'''') as Ean13,c.P1,c.P2,c.P3');
       DM.Qr.SQL.Add('from Moves a (nolock), SprTovar s (nolock) left join SkdLimit0 l (nolock) on s.art_code=l.art_code, SprTov b (nolock) left join Inform..SprReg c on b.art_code=c.art_code');
       DM.Qr.SQL.Add('where a.kod_name=b.kod_name and a.kol>0 and ');
       DM.Qr.SQL.Add('      s.art_code=b.art_code and a.iddoc='+DM.qrActReoc.FieldByName('idprc').AsString);

       if RadioButton2.Checked then DM.Qr.SQL.Add(' and c.P2>0 ') else
       if RadioButton3.Checked then DM.Qr.SQL.Add(' and IsNull(c.P1,0)=0 ');

       DM.Qr.SQL.Add('group by b.Art_code,b.Names,c.P1,c.P2,c.P3 ');
      end else begin
                DM.Qr.SQL.Add('select b.art_code,b.names,Max(b.Cena)*dbo.GetKoef(b.Art_code) as Cena, IsNull(Max(s.CenaP)*dbo.GetKoef(b.Art_code),0) as CenaP, dbo.GetKoef(b.Art_code) as koef,dbo.GetCenaOpt(b.art_code)*dbo.GetKoef(b.Art_code) as CenaOpt, Max(l.art_code) as Skd3 ,');
                if MainF.MaxSkd>0 then
                 DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where type_skd=4 and art_code=b.art_code),IsNull((select Max(skd) from Skd where type_skd=1),0)) as Skd, ') else
                if MainF.MaxSkd<=-3 then
                 DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where skd<3 and type_skd=4 and art_code=b.art_code),'+IntToStr(Abs(Round(MainF.MaxSkd)))+') as Skd, ')
                else
                 DM.Qr.SQL.Add('0 as Skd, ');

                DM.Qr.SQL.Add('IsNull((select Max(ean13) from SprEan where art_code=b.art_code),'''') as Ean13,c.P1,c.P2,c.P3');

                DM.Qr.SQL.Add('from JReocOpt o (nolock), SprTovar s (nolock) left join SkdLimit0 l (nolock) on s.art_code=l.art_code, SprTov b (nolock) left join Inform..SprReg c on b.art_code=c.art_code ');
                DM.Qr.SQL.Add('where  ');
                DM.Qr.SQL.Add('      o.art_code=s.art_code and ');
                DM.Qr.SQL.Add('      s.art_code=b.art_code and IsNull(o.Cena_Old,0)<>o.Cena_New and IsNull(o.Cena_New,0)>0 ');
                DM.Qr.SQL.Add('      and convert(varchar,o.dt,20)='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DM.qrActReoc.FieldByName('date_reoc').AsDateTime)+'''');

                if RadioButton2.Checked then DM.Qr.SQL.Add(' and c.P2>0 ') else
                if RadioButton3.Checked then DM.Qr.SQL.Add(' and IsNull(c.P1,0)=0 ');

                DM.Qr.SQL.Add('group by b.Art_code,b.Names,c.P1,c.P2,c.P3 ');
               end;

     Case Param of
      1:DM.Qr.SQL.Add('order by b.Names');
      2:DM.Qr.SQL.Add('order by c.P1,c.P2,c.P3,b.Names');
     end;

//     DM.Qr.SQL.SaveToFile('C:\Cen.txt');

     DM.Qr.Open;

//           if PrintCennikListExt(DM.Qr,W_CENNIK,True,False,False) then
           if PrintCennikListExt(DM.Qr,W_CENNIK,True,False,False,Param) then
    begin
     DM.Qr.Close;
     DM.Qr.SQL.Clear;

     if CheckBox1.Checked=False then
      begin
       if DM.qrActReoc.FieldByName('idvzr').AsInteger<>-1 then
        DM.Qr.SQL.Add('update JMoves set IsPrintCen=1 where iddoc='+DM.qrActReoc.FieldByName('iddoc').AsString)
       else
        DM.Qr.SQL.Add('update JReocOpt set IsPrintCen=1 where iddoc='+DM.qrActReoc.FieldByName('iddoc').AsString);
      end else
     if (CheckBox1.Checked=True) and (CheckBox3.Checked=False) then
      begin
       DM.Qr.SQL.Add('update JMoves set IsPrintCen=1 where vis is null and reoc=1 and date_nakl between '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' ');
       if Prm.AptekaSklad then
        DM.Qr.SQL.Add('update JReocOpt set IsPrintCen=1 where dt between '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' ');
      end else
     if (CheckBox3.Checked=True) then
      begin
       DM.Qr.SQL.Add('update JMoves set IsPrintCen=1 where vis is null and reoc=1   ');
       DM.Qr.SQL.Add(' and iddoc in (select iddoc from ReocForPrint where compname=host_name() and typereoc=1 and id_user='+IntToStr(Prm.UserID)+' )  ');
       if Prm.AptekaSklad then
        DM.Qr.SQL.Add('update JReocOpt set IsPrintCen=1 where convert(varchar,dt,20) in (select convert(varchar,dtreoc,20) from ReocForPrint where compname=host_name() and typereoc=2 and id_user='+IntToStr(Prm.UserID)+' )');
      end;

     DM.Qr.SQL.Add('select 9999 as Res');
     DM.Qr.Open;
     ShowActReoc;
    end;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования списка ценников: '+E.Message);
  end;
 end;

procedure TJReocF.N1Click(Sender:TObject);
 begin
  if Sender=nil then Exit;
  if DM.qrActReoc.IsEmpty then Exit;
  PrintCen(TControl(Sender).Tag);
 end;

procedure TJReocF.FormActivate(Sender:TObject);
 begin
  ComboBox1.Enabled:=(Prm.AptekaID=4) or MainF.Design;
  CheckBox2.Visible:=Prm.AptekaSklad;
 end;

procedure TJReocF.DBGrid1CellClick(Column: TColumn);
var Tr:Integer;
 begin
  if Not CheckBox3.Checked then Exit;
  if DM.qrActReoc.IsEmpty then Exit;
  if Column=DBGrid1.Columns[4] then
   try
    Tr:=1;
    if DM.qrActReoc.FieldByName('idvzr').AsInteger=-1 then Tr:=2;
    DM.QrEx.Close;
    DM.QrEx.SQL.Clear;
    DM.QrEx.SQL.Add('if (select Count(*) from ReocForPrint where compname=host_name() and id_user='+IntToStr(Prm.UserID)+' and TypeReoc='+IntToStr(Tr)+' and iddoc='+DM.qrActReoc.FieldByName('iddoc').AsString+')>0 ');
    DM.QrEx.SQL.Add(' delete from ReocForPrint where compname=host_name() and id_user='+IntToStr(Prm.UserID)+' and TypeReoc='+IntToStr(Tr)+' and iddoc='+DM.qrActReoc.FieldByName('iddoc').AsString);
    DM.QrEx.SQL.Add('else');

    Case Tr of
     1:begin
        DM.QrEx.SQL.Add(' Insert into ReocForPrint(iddoc,typereoc,compname,id_user)');
        DM.QrEx.SQL.Add(' Values('+DM.qrActReoc.FieldByName('iddoc').AsString+','+IntToStr(Tr)+',host_name(),'+IntToStr(Prm.UserID)+')');
       end;
     2:begin
        DM.QrEx.SQL.Add(' Insert into ReocForPrint(iddoc,dtreoc,typereoc,compname,id_user)');
        DM.QrEx.SQL.Add(' Values('+DM.qrActReoc.FieldByName('iddoc').AsString+','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DM.qrActReoc.FieldByName('DATE_REOC').AsDateTime)+''','+IntToStr(Tr)+',host_name(),'+IntToStr(Prm.UserID)+')');
       end;
    end;

    DM.QrEx.ExecSQL;
    ShowActReoc(1);
   except
    on E:Exception do MainF.MessBox('Ошибка выбора переоценки: '+E.Message);
   end;
 end;

procedure TJReocF.CheckBox1Click(Sender: TObject);
 begin
  if CheckBox1.Checked then
   begin
    CheckBox3.Enabled:=True;
   end else begin
             CheckBox3.Checked:=False;
             CheckBox3.Enabled:=False;
             ShowActReoc;
            end;
 end;

procedure TJReocF.CheckBox3Click(Sender: TObject);
 begin
  if Not CheckBox3.Checked then ShowActReoc;
 end;

procedure TJReocF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
    pr:Integer;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  if (DataCol in [0,1]) and (db.DataSource.DataSet.FieldByName('IsPrintAct').AsInteger=1) then db.Canvas.Brush.Color:=clYellow;
  if (DataCol in [2,3]) and (db.DataSource.DataSet.FieldByName('IsPrintCen').AsInteger=1) then db.Canvas.Brush.Color:=clLime;


  if (gdSelected in State)  then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

end.
