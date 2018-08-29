unit RepPeriodU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Util, PrintReport, ComObj, OpenOffice;

type

  TRepPeriodF = class(TForm)
    BitBtn1:TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    bbCHP: TBitBtn;
    ComboBox2: TComboBox;
    bbTovRep: TBitBtn;
    bbRepApt: TBitBtn;
    bbRepCHP: TBitBtn;
    bbRep99: TBitBtn;
    BitBtn2: TBitBtn;
    SaveDialog1: TSaveDialog;

    procedure FormCreate(Sender:TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure bbCHPClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bbTovRepClick(Sender: TObject);
    procedure bbRep99Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private

    procedure TovRep(Param:Integer);

  public

  end;

var RepPeriodF:TRepPeriodF;
    Ooo:TOpenOffice;

implementation

uses MainU, DataModuleU, ADODB;

{$R *.dfm}

procedure TRepPeriodF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  ComboBox2.ItemIndex:=StrToInt(FormatDateTime('mm',Date()))-1;
  ComboBox2Change(ComboBox2);
  dtEnd.Date:=Date;

  bbCHP.Enabled:=Prm.UserRole=R_ADMIN;
  bbRepCHP.Enabled:=bbCHP.Enabled;
  bbRepApt.Enabled:=bbCHP.Enabled;
  bbRep99.Visible:=Prm.UserRole=R_ADMIN;
 end;

procedure TRepPeriodF.ComboBox2Change(Sender:TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    dtStart.Date:=D1;
    dtEnd.Date:=D31;
   end;
 end;

procedure TRepPeriodF.bbCHPClick(Sender:TObject);
var i,dt:Integer;
    Sum:Real;
    Dat:TDateTime;
    SL:TStringList;

 begin
  try
   if (dtStart.Date<Date-xM) and (Prm.UserRole<>R_ADMIN) then
    begin
     dtStart.Date:=StrToDate(DateToStr(Date-xM));
     MainF.MessBox('Вы не можете выбрать дату меньше чем '+DateToStr(Date-xM));
     Exit;
    end; 

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('if Object_ID(N''tempdb..#achp'') is not null drop table #achp                       ');
   DM.Qr.SQL.Add('select top 0 getdate() as date_chek,convert(numeric(10,2),1.01) as Summa into #achp ');
   DM.Qr.ExecSQL;
   dt:=Round(Abs(dtStart.Date-dtEnd.Date));

   for i:=0 to dt do
    begin
     Dat:=dtStart.Date+i;
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('Insert into #achp(date_chek,Summa)');
     DM.Qr.SQL.Add('select '''+FormatDateTime('yyyy-mm-dd',Dat)+' 00:00:00'' as date_chek,          ');
     DM.Qr.SQL.Add('       Sum(kol*cena) as Summa                                                     ');
     DM.Qr.SQL.Add('from ArhChp                                                                       ');
     DM.Qr.SQL.Add('where Date_Chek>='''+FormatDateTime('yyyy-mm-dd',Dat-1)+' 20:30:30'' and ');
     DM.Qr.SQL.Add('      Date_Chek<='''+FormatDateTime('yyyy-mm-dd',Dat)+' 20:30:30''         ');
     DM.Qr.ExecSQL;
    end;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select date_chek as [Дата_S_1500],');
   DM.Qr.SQL.Add('       Summa as [Сумма_N_1500]     ');
   DM.Qr.SQL.Add('from #AChp                        ');
   DM.Qr.SQL.Add('order by date_chek                ');

//   DM.Qr.SQL.SaveToFile('C:\log\rty.txt');

   DM.Qr.Open;
   DM.Qr.First;
   PrintRep.Clear;
   PrintRep.SetDefault;

   PrintRep.Font.Size:=5;
   PrintRep.Font.Name:='Arial';
   PrintRep.Align:=AL_CENTER;
   PrintRep.AddText('Реализация ЧП с '+DateToStr(dtStart.Date)+' по '+DateToStr(dtEnd.Date)+#10#10);
   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Size:=6;
   Sum:=0;
   try
    SL:=TStringList.Create;

    for i:=1 to DM.Qr.RecordCount do
     begin
      if i=1 then DM.Qr.First else DM.Qr.Next;
      Sum:=Sum+DM.Qr.FieldByName('Сумма_N_1500').AsFloat;
      SL.Add(DM.Qr.FieldByName('Дата_S_1500').AsString+'|'+DM.Qr.FieldByName('Сумма_N_1500').AsString);
     end;

//    SL.SaveToFile('C:\Log\Otchet.txt');
    SL.Free;
   except
   end;
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(False,0,0);
   PrintRep.AddText(#10+'Всего:                         '+CurrToStrF(Sum,ffFixed,2)+' грн.');
   PrintRep.PreView;
  except
   MainF.MessBox('Ошибка доступа к реализации ЧП!')
  end;
 end;

procedure TRepPeriodF.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TRepPeriodF.TovRep(Param:Integer);
var dtE:TDateTime;
 begin
  try
 {
  if (DateToStr(dtEnd.Date+1)=DateToStr(Date)) and (DayOfWeekRu(Date)=1) and
      (TimeToStr(Time)<'11:00:00') and (Prm.UserRole<>R_ADMIN) then
   begin
    MainF.MessBox('Сформировать отчет можно будет после 11:00:00');
    Exit;
   end;
  }
   dtE:=StrToDateTime(DateToStr(dtEnd.Date)+' 23:59:59');
   DM.spY_TovRep.Close;

   if (dtStart.Date<Date-xM) and (Prm.UserRole<>R_ADMIN) then
    begin
     dtStart.Date:=StrToDate(DateToStr(Date-xM));
     MainF.MessBox('Вы не можете выбрать дату меньше чем '+DateToStr(Date-xM));
     Exit;
    end; 

   DM.spY_TovRep.Parameters.ParamValues['@dt1']:=StrToDateTime(DateToStr(dtStart.Date)+' 00:00:00');
   DM.spY_TovRep.Parameters.ParamValues['@dt2']:=dtE;
   DM.spY_TovRep.Parameters.ParamValues['@param']:=Param;
   DM.spY_TovRep.Parameters.ParamValues['@calconly']:=0;
   DM.spY_TovRep.Parameters.ParamValues['@id_user']:=Prm.UserID;
   DM.spY_TovRep.Open;
   if DM.spY_TovRep.Parameters.ParamValues['@RETURN_VALUE']<>1 then Abort;
   PrintRep.Clear;
   PrintRep.SetDefault;
   if (Now<dtE) and (Prm.UserRole<>R_ADMIN) then
    begin
     PrintRep.Align:=AL_CENTER;
     PrintRep.Font.Size:=7;
     PrintRep.Font.Style:=[fsBold];
     PrintRep.AddText('!!!!! Период не полный !!!!!'#10);
    end;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=6;
   PrintRep.BottomMargin:=230;
   PrintRep.AddText('Предприятие: '+Prm.FirmNameUA+#10+'Подразделение: '+Prm.AptekaNameRU+#10);
   PrintRep.Align:=AL_CENTER;
   PrintRep.AddInterv(2);
   PrintRep.Font.Size:=8;
   PrintRep.AddText('Товарный отчёт №________');
   PrintRep.AddInterv(2);
   PrintRep.Font.Size:=6;
   PrintRep.Align:=AL_LEFT;
   PrintRep.AddText(#10+'За период: '+FormatDateTime('dd.mm.yyyy',dtStart.Date)+'г. - '+FormatDateTime('dd.mm.yyyy',dtEnd.Date)+'г.'+#10);
   PrintRep.AddInterv(2);
   PrintRep.AddText('Материально-ответственное лицо_____________________________'+#10);
   PrintRep.Font.Size:=4;

   PrintRep.AddText('Дата формирования отчета: '+FormatDateTime('dd.mm.yyyy hh:nn:ss',Now)+'                                          Ф.И.О. заведующей'+#10#10);
   PrintRep.AddInterv(2);
   PrintRep.AddText('');
   PrintRep.AddText('');
   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Size:=5;
   DM.Qr.Clone(DM.spY_TovRep);
   PrintRep.Qr:=DM.Qr;

   PrintRep.PrintTable(False,0,0);
   PrintRep.Indent:=0;
   PrintRep.AddText(#10#10+'Отчет составил и проверил: ___________________________/_____________________/'+#10);
   if PRm.AptekaID=123 then
    PrintRep.AddText('                                                  Подпись                                     Ф.И.О. заведующей магазином'+#10)
   else
    PrintRep.AddText('                                                  Подпись                                     Ф.И.О. заведующей аптекой'+#10);
   PrintRep.AddText(#10#10+'Отчет проверил: бухгалтер  ___________________________/_____________________/'+#10);
   PrintRep.AddText('                                                  Подпись                                     Ф.И.О. бухгалтер'+#10);

   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования товарного отчета: '+E.Message);
  end;
 end;

procedure TRepPeriodF.bbTovRepClick(Sender:TObject);
 begin
  if Sender=nil then Exit;
  TovRep(TBitBtn(Sender).Tag);
 end;

procedure TRepPeriodF.bbRep99Click(Sender: TObject);
 begin
  try
   DM.QrEx4.Close;
   DM.QrEx4.SQL.Clear;
   DM.QrEx4.SQL.Add('select s.users as [Кассир_S_24000],             ');
   DM.QrEx4.SQL.Add('       a.numcard as [№ Карточки_S_11500],          ');
   DM.QrEx4.SQL.Add('       Sum(a.kol*cena)-IsNull(Sum(SumSkd),0) as [Сумма_N_6000] ');
   DM.QrEx4.SQL.Add('from ArhCheks a,    ');
   DM.QrEx4.SQL.Add('     SprUser s      ');
   DM.QrEx4.SQL.Add('where a.id_user=s.id and           ');
   DM.QrEx4.SQL.Add('      a.numcard>10000000 and substring(convert(varchar(15),a.numcard),1,3)=''990'' and ');
   DM.QrEx4.SQL.Add('      a.date_chek>='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtStart.Date)+''' and ');
   DM.QrEx4.SQL.Add('      a.date_chek<='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+'''     ');
   DM.QrEx4.SQL.Add('group by a.numcard,s.users ');
   DM.QrEx4.SQL.Add('order by 1,2');
   DM.QrEx4.Open;

   if DM.QrEx4.IsEmpty then Exit;
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=4;
   PrintRep.AddText('Отчет по реализации по карточкам врачей по торговой точке '+Prm.AptekaNameRU+#10);
   PrintRep.AddText(Prm.FirmNameUA+#10);
   PrintRep.AddText('За период: '+FormatDateTime('dd.mm.yyyy',dtStart.Date)+'г. - '+FormatDateTime('dd.mm.yyyy',dtEnd.Date)+'г.'+#10#10#10);
   PrintRep.Qr:=DM.QrEx4;
   PrintRep.PrintTable(false,3,0,True);
//   PrintRep.AddText(#10#10+'Сумма:   '+CurrToStrF(SumChek,ffFixed,2)+' грн.'+#10#10);
//   PrintRep.AddText(#10#10+'Провизор_________________');
   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования отчета: '+E.Message);
  end;
 end;

procedure TRepPeriodF.BitBtn2Click(Sender:TObject);
var dy,j,i:Integer;
    FN:String;
    Sm:Real;
 begin
  if SaveDialog1.Execute then FN:=ChangeFileExt(SaveDialog1.FileName,'.xls') else
   begin
    MainF.MessBox('Имя файла не выбрано, формирование отчета невозможно!');
    Exit;
   end;


  try
   Ooo:=TOpenOffice.Create;
   if Not Ooo.Connect then Abort;
   Ooo.CreateDocument;

   dy:=1;
   for j:=1 to 2 do
    begin
     Sm:=0;
     DM.QrEx4.Close;
     DM.QrEx4.SQL.Clear;
     DM.QrEx4.SQL.Add('select s.art_code,             ');
     DM.QrEx4.SQL.Add('       s.names,                ');
     DM.QrEx4.SQL.Add('       Sum(s.ostat) as Ostat,   ');
     DM.QrEx4.SQL.Add('       Max(s.cena) as Cena,    ');
     DM.QrEx4.SQL.Add('       Sum(s.ostat)*Max(s.cena) as SmAll,   ');
     DM.QrEx4.SQL.Add('       (select top 1 date_nakl from Moves m, SprTov s1 where s1.art_code=s.art_code and m.kod_name=s1.kod_name and nn_nakl not like ''%пр-%'' and debcrd=1 order by date_nakl desc) as dtprih, ');
     DM.QrEx4.SQL.Add('       (select top 1 Sum(m.kol*m.cena) from Moves m, SprTov s1 where s1.art_code=s.art_code and m.kod_name=s1.kod_name and nn_nakl not like ''%пр-%'' and debcrd=1 group by date_nakl order by date_nakl desc) as smprih, ');
     DM.QrEx4.SQL.Add('       IsNull((select top 1 ''Матричный'' from SprMatr m where m.art_code=s.art_code),'''') as Matr, ');
     DM.QrEx4.SQL.Add('       (case when Max(IsNull(p.Realiz,0))=1 then ''На реализации'' else '''' end) as Realiz ');
     DM.QrEx4.SQL.Add('       from  SprTov s left join Plist p on s.art_code=p.art_code   ');

     DM.QrEx4.SQL.Add('where s.ostat>0 and s.f_nds in ('+IntToStr(j)+','+IntToStr(j+2)+') and s.art_code not in (select a.art_code from ArhCheks b, SprTov a where a.kod_name=b.kod_name and    ');
     DM.QrEx4.SQL.Add('      date_chek>='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtStart.Date)+''' and ');
     DM.QrEx4.SQL.Add('      date_chek<='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+'''  )   ');
     DM.QrEx4.SQL.Add('group by s.art_code,s.names ');

     DM.QrEx4.SQL.Add('order by 2');
//     DM.QrEx4.SQL.SaveToFile('C:\Tov.txt');
     DM.QrEx4.Open;

     if j=1 then
      Ooo.InsertTextToCell(0,dy,'Отчет по непродаваемому товару НДС по торговой точке '+Prm.AptekaNameRU)
     else
      Ooo.InsertTextToCell(0,dy,'Отчет по непродаваемому товару Без НДС по торговой точке '+Prm.AptekaNameRU);

     Ooo.InsertTextToCell(0,dy+1,Prm.FirmNameUA);
     Ooo.InsertTextToCell(0,dy+2,'За период: '+FormatDateTime('dd.mm.yyyy',dtStart.Date)+'г. - '+FormatDateTime('dd.mm.yyyy',dtEnd.Date)+'г.');

     Ooo.InsertTextToCell(0,dy+3,'Код');
     Ooo.InsertTextToCell(1,dy+3,'Наименование');
     Ooo.InsertTextToCell(2,dy+3,'Остаток');
     Ooo.InsertTextToCell(3,dy+3,'Цена');
     Ooo.InsertTextToCell(4,dy+3,'Дата посл. прих.');
     Ooo.InsertTextToCell(5,dy+3,'Сумма посл. прих.');
     Ooo.InsertTextToCell(6,dy+3,'Матричный');
     Ooo.InsertTextToCell(7,dy+3,'На реализации');
     Ooo.InsertTextToCell(8,dy+3,'Сумма');

     for i:=1 to DM.QrEx4.RecordCount do
      begin
      if i=1 then DM.QrEx4.First else DM.QrEx4.Next;
       Ooo.InsertTextToCell(0,dy+4,DM.QrEx4.FieldByName('art_code').AsString);
       Ooo.InsertTextToCell(1,dy+4,DM.QrEx4.FieldByName('names').AsString);
       Ooo.InsertTextToCell(2,dy+4,DM.QrEx4.FieldByName('ostat').AsString);
       Ooo.InsertTextToCell(3,dy+4,DM.QrEx4.FieldByName('cena').AsString);
       Ooo.InsertTextToCell(4,dy+4,DM.QrEx4.FieldByName('dtprih').AsString);
       Ooo.InsertTextToCell(5,dy+4,DM.QrEx4.FieldByName('smprih').AsString);
       Ooo.InsertTextToCell(6,dy+4,DM.QrEx4.FieldByName('Matr').AsString);
       Ooo.InsertTextToCell(7,dy+4,DM.QrEx4.FieldByName('Realiz').AsString);
       Ooo.InsertTextToCell(8,dy+4,DM.QrEx4.FieldByName('SmAll').AsString);
       Sm:=Sm+DM.QrEx4.FieldByName('SmAll').AsFloat;
       dy:=dy+1;
      end;
  // SetForegroundWindow(Application.Handle) ;
     Ooo.InsertTextToCell(0,dy+4,'Итого ');
     Ooo.InsertTextToCell(8,dy+4,CurrTOStrF(Sm,ffFixed,2));

     dy:=dy+10;
    end;

   Ooo.SaveDocument(FN);
   Ooo.CloseDocument;
   Ooo.Disconnect;
   if FileExists(FN) then MainF.MessBox('Отчет выгружен успешно!',64)
                    else MainF.MessBox('Файл отчета не сохранен!');
  except
   on E:Exception do MainF.MessBox('Ошибка формирования отчета: '+E.Message);
  end;
 end;

end.

