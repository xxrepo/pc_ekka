Unit ShareU;

Interface

uses Windows, {Messages, }SysUtils, {Variants, }Classes, Graphics, Controls, Forms,
     {Dialogs, }Menus, ExtCtrls, ComCtrls, {StdCtrls, }Util, {Grids, }EKKAU, MainU,
     DataModuleU, MarryFont, FileCtrl, PrintReport, MMSystem, DB, DBGrids, ADODB,
     Printers, ComObj, Math, IniFiles, DateUtils, {MPlayer, }ShellApi;

type

  TIniPos=Record
           Descr:String;
           ExeName:String;
           Path:String;
           Caption:String;
           Hint:String;
           Params:String;
           IsOne:Boolean;
           ShortCut:Byte;
           Qr:TADOQuery;
          end;

  TCopyFiles=Record
              Descr:String;
              PathFrom:String;
              PathTo:String;
              Qr:TADOQuery;
             end;

  TPlayMp3 = class(TThread)
  private

  protected

    FileName:String;

    procedure Execute; override;

  end;

Function  CheckSerN(P:Byte):Boolean;

// Запись регистров кассового аппарата после Z-отчета в журнал
//Procedure WriteToJournZ(Smena:Integer; SumA,SumB,SumBA,SumBB:Real);

// Выгрузка базы
Function UnLoadBase(Qr:TADOQuery; Path:String; IsArh:Boolean; Prefix:String=''):Boolean;

// Определяет не сервер ли данный компьютер
Function IsServer:Boolean;

// Записывает строку в лог-файл
Procedure WriteLog(S:String);

// Комбиноированная печать отказов
Procedure PrintOtkaz(DT:TDateTime; Pr:Integer);

// Проигрывание звукового файла Wav в асинхронном режиме
Procedure PlayWavFile(FName:String);

// Проигрывание звукового файла MP3 в асинхронном режиме
procedure PlayMP3;

procedure AddFileToQ(FName:String);

// Проигрывание специфических звуков
Procedure PlayWav(TypeWav,Param:Integer);

// Проверка правильности введеного действительного числа
Function CheckReal(S:String):Boolean;

// Проверка правильности введеного целого числа
Function CheckInteger(S:String):Boolean;

// Ресайз клонок в DBGrid;
Procedure RisizeDBGrid(db:TDBGrid; dx:Integer);

// Универсальный поиск в любом DBGrid
Procedure FindInDBG(db:TDBGrid; var FSr:String; Key:Char);

// Генерация исключительной ситуации с сообщением
Procedure AbortM(Mes:String);

// Возвращает сообщение об ошибке
Function ExceptMessage(E:Exception):String;

// Вывод сообщения об ошибке на экран если такое было
Procedure ShowExceptMessage(E:Exception);

// Принудительное закрытие чека (только для датекса)
Procedure ForceCloseReceipt(TypeOplat:Integer);

// Пробивка чека по ЕККА по заранее подготовленому Qr
function FiscalChek(Qr:TADOQuery; CheckOnly:Boolean; var CP:TChekPos; IsLog:Boolean):Boolean;

// Определение нового номера чека (с отрицательным значением)
Function GetNewNumbChek(Param:Byte=0):Integer;

// Выгрузка текстового лога чеков в табличку
Function LoadTextLog(FName:String):String;

// Убирает из номера телефона нецифровые символы
Function CorrPhoneNumber(S:String):String;

Function GrafTimeToTime(G:TGrafTime; P:Byte):TDateTime;

// Строку в время в графике
Function StrToGrafTime(S:String):TGrafTime;

//Время в графике в строку
Function GrafTimeToStr(T:TGrafTime):String;

// Проверяет наименование на предмет срокового
Function IsSrok(S:String; var Srok:TDatetime):Boolean;

// Выполняет SQL скрипт
Function ExecScript(FName:String):Boolean;

// Выбирает значение коефициента из двух заданых
Function GetKoef(Koef,Upak:Integer):Integer;

// Отделяет поле примечение в графике
Function GetDescr(S:String):String;

// Отделяет поле касса в графике
Function GetKassa(S:String):String;

// Отделяет поле роль в графике
Function GetRole(S:String):Integer;

// ФОрмирует товарный отчет
Procedure MakeTovRep(D1,D2:TDateTime; Param:Byte);

// Печать заполненного бланка для возврата от покупателя
Function PrintBlankForBack(VF:TVozrForm; Dt:TDateTime):Boolean;

// Инициировать выгрузку
Procedure InitiateUnLoading(Qr:TADOQuery);

Function PrintStiker(Num:String; PrVozr:Byte):Boolean;

// Завершение или отмена закрытия чека по базе
Procedure DoneCheck(CP:TChekPos; P:Byte; Param:Byte=ST_CHECK; Silent:Boolean=False);

// Чтение состояния фискальных регистров
Function ReadCashState(var CP:TChekPos; Smena:Byte):Boolean;

// Рамка закругленная
Procedure DrawRoundRect(Im:TImage; Down:Boolean; Ct:TControl);
procedure DrawRoundRect1(Im:TImage; R:Integer; Cl:TColor);


// Определние пробился чек по кассовому аппарату или нет
Function CheckStatusCheck(var CP:TChekPos; P:Byte=0; P1:Byte=0):Integer;

Procedure TryWriteToJournal;

Function PrintSrokSkd(P:Byte):Boolean;

procedure NewPrintChek(CP:TChekPos; NCh:Integer=0);

function SetNewIniPosition(IniPos:TIniPos):Boolean;

procedure AddNewIniPos(IniPos:TIniPos);

procedure CopyFiles(CF:TCopyFiles);

procedure Write7hourStat;

procedure PrintBlankForNewDiscontSystem;

procedure UpdateCardInfo(N:Int64; var IsLink:Boolean; var IsBirth:Byte);

procedure PlaySumm(Sum:Currency);

procedure PlayFraz(P:Integer; Sum:Currency=0);

// Получаем значение из Spr_Const
function GetValueSC(Qr:TADOQuery; Descr:String):String;

function GetUserSpicPassw:String;

procedure ShowTimerZ;

procedure ShowSite(NameSite:String; P:Byte=0);

// Корректировка локального времени по серверу
procedure CorrLocalDate;

procedure ShowPiggyBank;

//function PrintCennikListExt(qrL:TADOQuery; Flag:Integer; IsUpak:Boolean; IsStiker:Boolean; IsVitrOnly:Boolean):Boolean;
function PrintCennikListExt(qrL:TADOQuery; Flag:Integer; IsUpak:Boolean; IsStiker:Boolean; IsVitrOnly:Boolean; const param: integer = 1):Boolean;

procedure PrintCennikList(qrL:TADOQuery; Flag:Integer; FUserID:Integer; IsUpak:Boolean; IsStiker:Boolean; IsVitrOnly:Boolean);

const

WV_CANCEL=1; // Звук "Отмена чека"
WV_SKD=2;    // Звук "Ваша скидка..."
WV_SPIS=3;   // Звук "Произошло списание..."

EXC_HEAD='SERGIO_EXCEPTION_HEAD_'; // Заголовок моих сообщений в исключительных ситуациях

Implementation

uses
  ThPrintChpU, ShowTextU, TimerZU, WebGeptralU, PiggyBankU, MicroHelpN707;

function CheckSerN(P:Byte):Boolean;
var VolL,SerN,FileSys,DirPart,FilePart:String;
    Drive:Char;
 begin
  Result:=False;
  ProcessPath(GetSystemDir,Drive,DirPart,FilePart);
  GetDriveInfo(Drive+':\',VolL,SerN,FileSys);
  try
   DM.Qr.SQL.Text:='select * from SNUM where SerN='''+SerN+'''';
   DM.Qr.Open;
   if Not DM.Qr.IsEmpty then Result:=True else Abort;
  except
   Result:=False;
   if P=1 then raise EAbort.Create('Ошибка лицензирования!') else
    begin
     ErrMess:='Ошибка лицензирования!';
     Abort;
    end;
  end;
//  Result:=True;
 end; {CheckSerN}

// Записть в журнал Z-отчетов состояния дневных регистров прошлой смены
(*Procedure WriteToJournZ(Smena:Integer; SumA,SumB,SumBA,SumBB:Real);
var dx,i,NumZ:Integer;
    Fn,dt:String;
    ddt:TDateTime;
 begin
  try
   if Not(EKKA.UseEKKA) then Exit;
   if Not (EKKA.fpGetStatus) then Exit;
   dx:=0;
   Case Ord(EKKA.RD_Item[9][1]) of
    0:dx:=-1;
    1:dx:= 0;
   end;
   NumZ:=StrToInt(EKKA.RD_Item[10])+dx;
   Fn:=EKKA.RD_Item[1];
   if (NumZ=0) and (EKKA.TypeEKKA=EKKA_MARRY301MTM) then Exit;
   if Not EKKA.fpCashState(1) then Exit;
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from JournZ where NumZ='+IntToStr(NumZ)+' and Vzh='+IntToStr(MainF.VzhNum);
   DM.Qr.Open;
   if Not (DM.Qr.IsEmpty) then Exit;
   dt:=FormatDateTime('yyyy-mm-dd h:nn:ss',Now);
   ddt:=Now;
   if Smena<>1 then
    begin
     SumA:=0; SumB:=0;
     DM.Qr.Close;
     DM.Qr.SQL.Text:='select * from JournZ where NumZ='+IntToStr(NumZ-1)+' and id_kassa='+IntToStr(Opt.KassaID);
     DM.Qr.Open;
     if DM.Qr.IsEmpty then dt:=FormatDateTime('yyyy-mm-dd hh:nn:ss',Now) else
      if DM.Qr.FieldByName('DateZ').AsDateTime<StrToDateTime(DateToStr(Date-1)+' 23:59:59') then
       begin
        dt:=FormatDateTime('yyyy-mm-dd',Date-1)+' 23:59:59';
        ddt:=StrToDateTime(DateToStr(Date-1)+' 23:59:59');
       end;
    end;
{
   try
    DM.Qr.Close;
    DM.Qr.SQL.Text:='select IsNull(Max(date_chek),''2000-01-01 00:00:00'') as MD from ArhCheks where Vzh='+IntToStr(MainF.VzhNum);
    DM.Qr.Open;
    if Abs(DM.Qr.FieldByName('MD').AsDateTime-ddt)>2 then Exit;
   except
   end;
}
   try
{    DM.Qr.Close;
    DM.Qr.SQL.Clear;
    DM.Qr.SQL.Add('select top 1 Vzh from ArhCheks ');
    DM.Qr.SQL.Add('where id_kassa='+IntToStr(Opt.KassaID)+' and date_chek<'''+dt+''' order by date_chek desc');
    DM.Qr.Open;
    if DM.Qr.FieldByName('Vzh').AsFloat<>MainF.VzhNum then Exit;
}
   except
   end;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('insert into JournZ(DateZ,NumZ,id_kassa,Sum1,Sum2,Sum3,Sum4,Sum5,Sum6,Sum7,Sum8,SumA,SumB,SumBA,SumBB,Vzh,Fn,VzhS) ');
   DM.Qr.SQL.Add('values('''+dt+''','+
                         IntToStr(NumZ)+','+
                         IntToStr(Opt.KassaID));
   for i:=0 to 7 do
    DM.Qr.SQL.Add(','+CurrToStr(StrToInt(EKKA.RD_Item[i])*0.01));
   DM.Qr.SQL.Add(','+CurrToStr(SumA)+','+CurrToStr(SumB));
   DM.Qr.SQL.Add(','+CurrToStr(SumBA)+','+CurrToStr(SumBB));
   DM.Qr.SQL.Add(','+IntToStr(MainF.VzhNum)+','+Fn+','''+EKKA.VzhNumS+''')');
   DM.Qr.ExecSQL;
  except
  end;
 end; {WriteToJournZ}
*) 

function IsServer:Boolean;
{var S:String;
    P:Integer;
}
 begin
{
  P:=Pos('\',Opt.Server);
  if P=0 then S:=Opt.Server
         else S:=Copy(Opt.Server,1,P-1);
}
  Result:=AnsiUpperCase(GetCompName)=AnsiUpperCase(Prm.ServerKompName);
 end;

function UnLoadBase(Qr:TADOQuery; Path:String; IsArh:Boolean; Prefix:String=''):Boolean;
var Db,FN,FNameB,FNameA:String;
 begin
  try
   Application.ProcessMessages;
   FN:=MyFileName(MainF.BaseFileName)+Prefix+ExtractFileExt(MainF.BaseFileName);
   FNameB:=Opt.LogPath+FN;
   FNameA:=Opt.LogPath+MyFileName(MainF.BaseFileName)+'.rar';
   DeleteFile(Path+FN);

   Qr.Close;
   Qr.SQL.Text:='select db_name() as DB';
   Qr.Open;
   Db:=Qr.FieldByName('Db').AsString;
   Qr.Close;
   Qr.SQL.Clear;

   Qr.SQL.Add(' SET NOCOUNT ON                                    ');
   Qr.SQL.Add(' DECLARE @TableName char(64)                       ');
   Qr.SQL.Add(' DECLARE SysCur CURSOR FOR SELECT convert(varchar(100),'''+Db+'..''+name) FROM '+Db+'..sysobjects WHERE type=''U'' ');
   Qr.SQL.Add(' OPEN SysCur                                       ');
   Qr.SQL.Add(' FETCH NEXT FROM SysCur INTO @TableName            ');
   Qr.SQL.Add(' WHILE @@FETCH_STATUS=0 BEGIN                      ');
   Qr.SQL.Add('     DBCC DBREINDEX(@TableName)                    ');
   Qr.SQL.Add('     FETCH NEXT FROM SysCur INTO @TableName        ');
   Qr.SQL.Add(' END                                               ');
   Qr.SQL.Add(' CLOSE SysCur                                      ');
   Qr.SQL.Add(' DEALLOCATE SysCur                                 ');

   Qr.SQL.Add(' backup log ['+Db+'] with truncate_only            ');
   Qr.SQL.Add(' declare @md varchar(100), @ml varchar(100)        ');
   Qr.SQL.Add(' set @md=(select RTrim(Max(name)) from '+Db+'..sysfiles where fileid=1)  ');
   Qr.SQL.Add(' set @ml=(select RTrim(Max(name)) from '+Db+'..sysfiles where fileid=2)  ');
   Qr.SQL.Add(' exec(''use ['+Db+'] DBCC SHRINKFILE (N''''''+@md+'''''')'')             ');
   Qr.SQL.Add(' exec(''use ['+Db+'] DBCC SHRINKFILE (N''''''+@ml+'''''')'')             ');
   Qr.SQL.Add(' DBCC ShrinkDataBase (N'''+Db+''', 0,TRUNCATEONLY)  ');
   Qr.SQL.Add(' DBCC UPDATEUSAGE('+Db+')                           ');
   Qr.SQL.Add(' BACKUP DATABASE ['+Db+'] TO DISK = '''+FNameB+''' WITH  INIT, NOUNLOAD, NAME = N'''+Db+' backup'',  NOSKIP ,  STATS = 10,  NOFORMAT ');

   if IsArh then
    begin
     Qr.SQL.Add(' declare @com varchar(1000)                                       ');
     Qr.SQL.Add(' set @com=''D:\AVA\rar.exe a -ep '+FNameA+' '+FNameB+'''    ');
     Qr.SQL.Add(' exec master..xp_cmdshell @com                                    ');
    end;

   Qr.ExecSQL;
   if Path<>'' then
    begin
     if IsServer then
      CopyFile(PChar(Opt.LogPath+FN),PChar(Path+FN),false)
     else
      CopyFile(PChar(Opt.ServerLogPath+FN),PChar(Path+FN),false);
     if Not FileExists(Path+FN) then Abort;
    end else if Not FileExists(Opt.ServerLogPath+FN) then Abort;
   Result:=True;
  except
   Result:=FAlse;
  end;
 end;

Procedure WriteLog(S:String);
var Path:String;
 begin
  try
   Path:=WorkPath+'\Txt\';
   ForceDirectories(Path);
   AppendStringToFile(Path+'Kassa'+IntToStr(Opt.KassaID)+'_'+FormatDateTime('ddmmyyyy',Date)+'.txt',S);
  except
  end;
 end;

Procedure PrintOtkaz(DT:TDateTime; Pr:Integer);
var Sum1:Real;
    Kol,i:Integer;
 begin
  try
   if Not (Pr in [1,2,3,4]) then Exit;
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   Case Pr of
    1,3:begin
       DM.Qr.SQL.Add('select ''NumS'' as [№ пп_S_1000],');
       DM.Qr.SQL.Add('       b.art_code as [Код_S_1500],');
       DM.Qr.SQL.Add('       IsNull((select rtrim(Max(names)) from Plist s where b.art_code=s.art_code),b.names) as Наименование_S_7000,');
       DM.Qr.SQL.Add('       IsNull((select Sum(ostat) from SprTov ss where ss.art_code=b.art_code),0) as [Остат._I_1500],');
       DM.Qr.SQL.Add('       Max(b.realiz) as [Реализация_I_2200],');
       DM.Qr.SQL.Add('       Count(*) as [Отказано по наличию_I_1800],');
       DM.Qr.SQL.Add('       Sum(b.otkaz) as [Отказано по кол-ву_I_1800],');
       DM.Qr.SQL.Add('       b.Cena as [Цена_N_1700],');
       DM.Qr.SQL.Add('       (select Max(Gr) from SprGroups g where g.art_code=b.art_code) as [Приб._I_1100],');
       DM.Qr.SQL.Add('       '' '' as [Примечания_S_2000]');
       DM.Qr.SQL.Add('from Otkaz b');
       DM.Qr.SQL.Add('where b.Priznak='+IntToStr(Pr)+' and ');
       DM.Qr.SQL.Add('      b.date_otkaz>='''+FormatDateTime('yyyy-mm-dd',DT)+' 00:00:00'' and ');
       DM.Qr.SQL.Add('      b.date_otkaz<='''+FormatDateTime('yyyy-mm-dd',DT)+' 23:59:59'' ');
       DM.Qr.SQL.Add('group by b.art_code,b.names,b.cena');
       DM.Qr.SQL.Add(' union ');
       DM.Qr.SQL.Add('select ''NumS'' as [№ пп_S_1000],');
       DM.Qr.SQL.Add('       art_code as [Код_S_1700],');
       DM.Qr.SQL.Add('       rtrim(names) as Наименование_S_7000,');
       DM.Qr.SQL.Add('       ostat as [Остат._I_1500],');
       DM.Qr.SQL.Add('       realiz as Реализация_I_2200,');
       DM.Qr.SQL.Add('       otkaz as [Отказано по наличию_I_1600],');
       DM.Qr.SQL.Add('       otkaz as [Отказано по кол-ву._I_1600],');
       DM.Qr.SQL.Add('       0 as [Цена_N_1700],');
       DM.Qr.SQL.Add('       (select Max(Gr) from SprGroups g where g.art_code=z.art_code) as [Приб._I_1100],');
       DM.Qr.SQL.Add('       '' '' as Причина_S_2000');
       DM.Qr.SQL.Add('from Zakaz z');
       DM.Qr.SQL.Add('where otkaz>0 and date_zakaz='''+FormatDateTime('yyyy-mm-dd',DT)+' 00:00:00'' ');
       DM.Qr.SQL.Add('order by 2 desc,3');
      end;
    2:begin
       DM.Qr.SQL.Add('select ''NumS'' as [№ пп_S_1000],');
       DM.Qr.SQL.Add('       Max(b.date_otkaz) as [Дата отказа_S_2000],');
       DM.Qr.SQL.Add('       b.art_code as [Код_S_1500],');
       DM.Qr.SQL.Add('       rtrim(Max(a.names)) as Наименование_S_7000,');
       DM.Qr.SQL.Add('       Sum(a.ostat) as [Остат._I_1500],');
       DM.Qr.SQL.Add('       Max(b.realiz) as [Реализа- ция_I_2200],');
       DM.Qr.SQL.Add('       Count(*) as [Отказано_I_1800],');
//       DM.Qr.SQL.Add('       Sum(b.otkaz) as [Отказано по кол-ву_I_1800],');
       DM.Qr.SQL.Add('       Max(a.Cena) as [Цена прод._N_1300],');
       DM.Qr.SQL.Add('       b.Cena as [Цена поку- пателя_N_1700],');
       DM.Qr.SQL.Add('       (select Max(Gr) from SprGroups g where g.art_code=b.art_code) as [Приб._I_1100],');
       DM.Qr.SQL.Add('       '' '' as [Примеча- ния_S_2000]');
       DM.Qr.SQL.Add('from (select art_code,names,cena,Sum(ostat) as ostat from SprTov group by art_code,names,cena) a, Otkaz b');
       DM.Qr.SQL.Add('where a.art_code=b.art_code and Priznak='+IntToStr(Pr)+' and ');
       DM.Qr.SQL.Add('      b.date_otkaz>='''+FormatDateTime('yyyy-mm-dd',DT)+' 00:00:00'' and ');
       DM.Qr.SQL.Add('      b.date_otkaz<='''+FormatDateTime('yyyy-mm-dd',DT)+' 23:59:59'' ');
       DM.Qr.SQL.Add('group by b.art_code,b.cena');
       DM.Qr.SQL.Add('union ');
       DM.Qr.SQL.Add('select ''NumS'' as [№ пп_S_1000],');
       DM.Qr.SQL.Add('       date_zakaz as [Дата отк._S_2000],');
       DM.Qr.SQL.Add('       art_code as [Код_S_1700],');
       DM.Qr.SQL.Add('       rtrim(names) as Наименование_S_7000,');
       DM.Qr.SQL.Add('       ostat as [Остат._I_1500],');
       DM.Qr.SQL.Add('       realiz as Реализация_I_2200,');
       DM.Qr.SQL.Add('       otkaz as [Отказано по наличию_I_1600],');
//       DM.Qr.SQL.Add('       otkaz as [Отказано по кол-ву._I_1600],');
       DM.Qr.SQL.Add('       0 as Цена_I_1200,');
       DM.Qr.SQL.Add('       0 as Цена_I_1200,');
       DM.Qr.SQL.Add('       (select Max(Gr) from SprGroups g where g.art_code=z.art_code) as [Приб._I_1100],');
       DM.Qr.SQL.Add('       '' '' as Причина_S_2000');
       DM.Qr.SQL.Add('from Zakaz z');
       DM.Qr.SQL.Add('where otkaz>0 and date_zakaz='''+FormatDateTime('yyyy-mm-dd',DT)+' 00:00:00'' ');
       DM.Qr.SQL.Add('order by 3,4');
      end;
    4:begin
       DM.Qr.SQL.Add('select ''NumS'' as [№ пп_S_1000],');
       DM.Qr.SQL.Add('       date_zakaz as [Дата отк._S_2000],');
       DM.Qr.SQL.Add('       art_code as [Код_S_1700],');
       DM.Qr.SQL.Add('       rtrim(names) as Наименование_S_7000,');
       DM.Qr.SQL.Add('       ostat as [Остат._I_1500],');
       DM.Qr.SQL.Add('       realiz as Реализация_I_2200,');
       DM.Qr.SQL.Add('       zakaz as [Заказ_I_1600],');
       DM.Qr.SQL.Add('       Gr as [Приб._I_1100]');
       DM.Qr.SQL.Add('from Zakaz z');
       DM.Qr.SQL.Add('where zakaz>0 and date_zakaz='''+FormatDateTime('yyyy-mm-dd',DT)+' 00:00:00'' ');
       DM.Qr.SQL.Add('order by 4');
      end;
   end;
//   DM.Qr.SQL.SaveToFile('c:\otkaz.txt');
   DM.Qr.Open;

   if Pr in [1,3] then
    begin
     Sum1:=0;
     for i:=1 to DM.Qr.RecordCount do
      begin
       if i=1 then DM.Qr.First else DM.Qr.Next;
       Kol:=DM.Qr.FieldByName('Отказано по кол-ву_I_1800').AsInteger;
       if Kol<=0 then Kol:=1;
       Sum1:=Sum1+Kol*DM.Qr.FieldByName('Цена_N_1700').AsFloat;
      end;
    end;

   DM.Qr.First;
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Orientation:=O_LANDS;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=6;
   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Style:=[fsItalic,fsBold,fsUnderLine];

   Case Pr Of
    1:PrintRep.AddText('Отказы по наличию'+#10);
    2:PrintRep.AddText('Отказы по цене'+#10);
    3:PrintRep.AddText('Срочные отказы'+#10);
    4:PrintRep.AddText('Заявка'+#10);
   end;

   PrintRep.Font.Style:=[fsItalic,fsBold];
   PrintRep.AddText(Prm.AptekaNameRU+#10);
   PrintRep.AddText('Дата составления '+FormatDateTime('dd.mm.yyyy',DT)+#10#10#10);
   if Pr=4 then PrintRep.Font.Size:=4
           else PrintRep.Font.Size:=5;
   PrintRep.Font.Style:=[];
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(False,0,0);
   if Pr<>4 then PrintRep.AddRows(10);
   if Pr in [1,3] then
    PrintRep.AddText(#10#10+'Сумма по отказам: '+CurrToStrF(Sum1,ffFixed,2));
   PrintRep.PreView;
   DM.Qr.Close;

  except
  end;
 end;

procedure PlayWavFile(FName:String);
 begin
  try
   //if Pos('otmena.wav',AnsiLowerCase(FName))<>0 then
    sndPlaySound(PChar(FName),SND_ASYNC);
  except
  end;
 end;

procedure PlayWav(TypeWav,Param:Integer);
var Wav,Path:String;
 begin
//  if { (MainF.TypeCardNew=1) and }(TypeWav=WV_SKD) then Exit;

  if Opt.PlayRolik=True then Exit;

  Path:=WorkPath+'\Wav\';
  Wav:='';
  Case TypeWav of

   WV_SPIS:Wav:=Path+'Spisanie1.exe';
   WV_CANCEL:Wav:=Path+'otmena.wav';
 //  WV_SKD   :Wav:=Path+'skd'+IntToStr(Param)+'.wav';
  end;
//  ShowMessage(Wav);
  if FileExists(Wav) then PlayWavFile(Wav);

 end;

function CheckReal(S:String):Boolean;
 begin
   try
    StrToFloat(S); Result:=True;
   except
    Result:=False;
   end;
 end;

function CheckInteger(S:String):Boolean;
 begin
  try
   StrToInt(S); Result:=True;
  except
   Result:=False;
  end;
 end;

procedure RisizeDBGrid(db:TDBGrid; dx:Integer);
var LastCol,Sum,Sum1,i:Integer;
    Koef:Real;

 begin
  Sum:=0;
  for i:=0 to db.Columns.Count-1 do
   if db.Columns[i].Width>0 then
    Inc(Sum,db.Columns[i].Width);
  Koef:=(db.Width-dx)/Sum;
  Sum1:=0;
  for i:=0 to db.Columns.Count-1 do
   if db.Columns[i].Width>0 then
    begin
     db.Columns[i].Width:=Round(db.Columns[i].Width*Koef);
     Inc(Sum1,db.Columns[i].Width);
     LastCol:=i;
    end;
  db.Columns[LastCol].Width:=db.Width-dx-(Sum1-db.Columns[LastCol].Width);
 end;

procedure FindInDBG(db:TDBGrid; var FSr:String; Key:Char);
var Ind:Integer;
    ColName:String;
 begin
  if db.DataSource=Nil then Exit;
  Ind:=db.SelectedIndex;
  ColName:=db.Columns[Ind].FieldName;
  if db.DataSource.DataSet.FieldByName(ColName).DataType=ftFloat then
   if Key in [',','.'] then Key:=GetDivPoint;
  FSr:=FSr+Key;
  db.DataSource.DataSet.Locate(ColName,FSr,[loCaseInsensitive,loPartialKey]);
 end;

procedure AbortM(Mes:String);
 begin
  raise EAbort.Create(EXC_HEAD+Mes);
 end;

function ExceptMessage(E:Exception):String;
 begin
  if Copy(E.Message,1,Length(EXC_HEAD))=EXC_HEAD then
   Result:=Copy(E.Message,Length(EXC_HEAD)+1,Length(E.Message)-Length(EXC_HEAD))
  else
   Result:=E.Message;
 end;

procedure ShowExceptMessage(E:Exception);
 begin
  if (E.Message<>'') and (E.Message<>EXC_HEAD) then
   Application.MessageBox(PChar(ExceptMessage(E)),PChar(MFC),48);
 end;

procedure ForceCloseReceipt(TypeOplat:Integer);
var Ty:Integer;
 begin
  if EKKA.TypeEKKA<>EKKA_DATECS3530T then Exit;
  try
   Ty:=0;
   Case TypeOplat of
    TO_CASH:Ty:=4;
    TO_CHEK:Ty:=2 else AbortM('Неизвестный тип оплаты!');
   end;
   if Not EKKA.fpCloseFiscalReceipt(0,Ty,0) then AbortM(EKKA.LastErrorDescr);
  except
   on E:Exception do AbortM('Ошибка пробивки чека по ЕККА: '+ExceptMessage(E));
  end;
 end;

procedure PrintStrings(Strings:TStrings);
{var Prn: TextFile; i: word;}
begin
 PrintRep.Clear;
 PrintRep.SetDefault;
 PrintRep.Font.Name:='Arial';
 PrintRep.Font.Size:=3;
 PrintRep.AddText(Strings.Text);
 PrintRep.Print;

{  AssignPrn(Prn);
  try
    Rewrite(Prn);
    try
     for i := 0 to Strings.Count - 1 do
      writeln(Prn, Strings.Strings[i]);
    finally
      CloseFile(Prn);
    end;
  except
    on EInOutError do
      MessageDlg('Error Printing text.', mtError, [mbOk], 0);
  end;

}
end;

procedure DoneCheck(CP:TChekPos; P:Byte; Param:Byte=ST_CHECK; Silent:Boolean=False);
var q:Integer;
    ErrMes,FList:String;
    NeedReopen:Boolean;
    tmpVzh:Int64;
 Begin
  if EKKA.UseEKKA=False then Exit;
  q:=0;
  NeedReopen:=False;
  Repeat
   try
    Inc(q);

    DM.QrEx1.Close;
    DM.QrEx1.SQL.Text:='select 1 as Res';
    DM.QrEx1.Open;

    if NeedReopen then
     begin
      DM.spY_FilterSklad.Close;
      DM.spY_FilterSklad.Open;
      DM.qrChek.Close;
      DM.qrChek.Open;
      NeedReopen:=False;
     end;

    DM.ADOCo.BeginTrans;
    try
     Case Param of
      ST_CHECK:begin
                if P>=1 then try
                              tmpVzh:=CP.Vzh;
                              CP.Vzh:=CP.VzhSafe;
                              DM.WriteChek(CP);
                             finally
                              CP.Vzh:=tmpVzh;
                             end
                        else begin
                              DM.QrEx1.Close;
                              DM.QrEx1.SQL.Clear;
                              DM.QrEx1.SQL.Add('declare @sm numeric(12,2), @nch int, @vzh bigint, @idu smallint ');
                              DM.QrEx1.SQL.Add('set @nch='+IntToStr(CP.NumbChek));
                              DM.QrEx1.SQL.Add('set @vzh='+IntToStr(CP.Vzh));
                              DM.QrEx1.SQL.Add('set @idu='+IntToStr(CP.ID_User));
                              DM.QrEx1.SQL.Add('delete from ChekParams from ChekParams b, Chek a where a.id_user=@idu and compname=host_name() and a.vzh=b.vzh and a.numb_chek=b.numb_chek and a.id_user=b.id_user ');
                              DM.QrEx1.SQL.Add('update Chek set ID_User='+IntToStr(Prm.UserID)+', VZH=null, numb_chek=null where id_user=@idu and compname=host_name() ');
                              DM.QrEx1.SQL.Add('select Count(*) as Cnt from ChekParams b, Chek a where a.id_user=@idu and compname=host_name() and a.vzh=b.vzh and a.numb_chek=b.numb_chek and a.id_user=b.id_user ');
                              DM.QrEx1.Open;
                              if DM.QrEx1.FieldByName('Cnt').AsInteger>0 then raise EAbort.Create('Ошибка очистки временного чека!');
                             end;
               end;
      ST_ZREP:begin
               DM.WriteToJournZ(CP);
              end;
     end;
     DM.ADOCo.CommitTrans;
     Break;
    except
     DM.ADOCo.RollBackTrans;
     raise;
    end;
   except
    on E:Exception do
     try
      if (E is EOleException) and (EOleException(E).ErrorCode=-2147467259) then
       begin
        NeedReopen:=True;
        try
         DM.ADOCo.Connected:=False;
         DM.ADOCo.Connected:=True;
        except
         raise EAbort.Create('ErRorConnectioN');
        end
       end else raise EAbort.Create(E.Message);
     except
      on E:Exception do
       begin

        if E.Message='ErRorConnectioN' then ErrMes:='Нет соединения с сервером. Для повторного подключения нажмите '
                                       else ErrMes:='Ошибка записи чека: '+E.Message+' Для повторной записи чека нажмите ';

        if (Silent=True) and (q>1) then Exit;
        if q>1 then
         begin
          ErrMes:=ErrMes+'"ОК", чтобы попытаться закрыть чек, "Отмена" - закрыть программу, набранный чек при этом, сохранится и будет открыт при следующем успешном входе в программу!';
          if ShowTextQ(ErrMes) then Continue else Halt(1);
         end else begin
                   ErrMes:=ErrMes+'"Закрыть", чтобы попытаться закрыть чек еще раз.';
                   ShowText(ErrMes);
                   Continue;
                  end;
       end
     end;
   end;
  Until False;
 end;

function ReadCashState(var CP:TChekPos; Smena:Byte):Boolean;
var i:Integer;
 begin
  try
   if EKKA.TypeEKKA=EKKA_DATECS3530T then EKKA.fpCashState(0)
                                     else EKKA.fpCashState(Smena);
   if EKKA.LastError<>'' then Abort;
//   ShowMessage(EKKA.RD_Item.Text);
   for i:=0 to 7 do CP.Sums[i]:=StrToInt64(EKKA.RD_Item[i])*0.01;

   EKKA.fpFiscState;
   if EKKA.LastError<>'' then Abort;

   CP.Sums[8] :=StrToInt64(EKKA.RD_Item[1])*0.01;   // Продажи по ставке А20%
   CP.Sums[9] :=StrToInt64(EKKA.RD_Item[2])*0.01;   // Продажи по ставке Б7%
   CP.Sums[10]:=StrToInt64(EKKA.RD_Item[11])*0.01;  // Возвраты от покупателей по ставке А20%
   CP.Sums[11]:=StrToInt64(EKKA.RD_Item[12])*0.01;  // Возвраты от покупателей по ставке Б7%

   CP.Vzh:=EKKA.VzhNum;
   CP.VzhSafe:=CP.Vzh;
   CP.VzhS:=EKKA.VzhNumS;
   CP.Fn:=EKKA.Fn;
   CP.TypeEKKA:=EKKA.TypeEKKA;

   EKKA.fpGetStatus;
   if EKKA.LastError<>'' then Abort;
   CP.DateK:=StrToDateTime(JDateToStr(EKKA.RD_Item[3])+' '+JTimeToStr(EKKA.RD_Item[4]));

   Result:=True;
  except
   Result:=False;
  end;
 end;

function CheckStatusCheck(var CP:TChekPos; P:Byte=0; P1:Byte=0):Integer;
var q,i:Integer;
    ErrMes:String;
    Iter,NCh:Integer;
    Sl:TStringList;

    GtCshStt, ErrCode, ErrDescription: string;
    ri: TStringList;
    in_out_final_balance: Currency;
    mssg: string;
 Begin
  Result:=0;
  q:=0;
  Iter:=0;
  CP.NumZ:=-1;
  Repeat
   try
    Inc(q);
    EKKA.fpCancelFiscalReceipt;
    if EKKA.LastError<>'' then Abort;

    Case P of
     ST_CHECK:begin

               if Not ReadCashState(CP,0) then Abort;
               SL:=TStringList.Create;
               SL.Add(CurrToStr(RoundTo(CP.RealizDay,-2))+' - '+CurrToStr(RoundTo(CP.SumChek,-2))+' - '+CurrToStr(RoundTo(CP.Sums[3]-CP.Sums[4]+CP.Sums[6]-CP.Sums[7],-2))  );
               try
                SL.SaveToFile('C:\Log\Sums.txt');
               except
               end; 
               if RoundTo(CP.RealizDay,-2)=RoundTo(CP.Sums[3]-CP.Sums[4]+CP.Sums[6]-CP.Sums[7],-2) then
                begin
                 Result:=-1;
                 Exit;
                end else
               if RoundTo(CP.RealizDay+CP.SumChek,-2)=RoundTo(CP.Sums[3]-CP.Sums[4]+CP.Sums[6]-CP.Sums[7],-2) then
                begin
                 Result:=1;
                 Exit;
                end else begin
                          if
                             (Prm.AptekaID=10001) or
                             (Prm.AptekaID=10002) or

                             (Prm.AptekaID=269) or
                             (Prm.AptekaID=273) or
                             (Prm.AptekaID=266) or
                             (Prm.AptekaID=283) or
                             (Prm.AptekaID=283) or
                             (Prm.AptekaID=277) or
                             (Prm.AptekaID=281) or
                             (Prm.AptekaID=292) or
                             (Prm.AptekaID=279) then begin Result:=1; Exit; end; // !!!!!!!!!!!!!!!!!! В будущем обязательно убрать. 
                          raise EAbort.Create('Не совпадают суммы по базе с суммами по кассовому аппарату');
                         end;

             end;
     ST_ZREP:begin

              EKKA.fpGetStatus;
              if EKKA.LastError<>'' then Abort;

              if Ord(EKKA.RD_Item[9][1])=1 then // Z-отчет снят
               begin
                CP.NumZ:=StrToInt(EKKA.RD_Item[10]);
                if CP.NumZ<=0 then raise EAbort.Create('Ошибка определения номера Z-отчета');
                if Not ReadCashState(CP,1) then Abort;
                if P1=0 then DoneCheck(CP,0,ST_ZREP,True)
                        else DoneCheck(CP,0,ST_ZREP);
                if Iter>0 then
                 begin
                  Result:=1;
                  Exit;
                 end;
               end else
              if P1=0 then
               begin

                if EKKA.TypeEKKA=EKKA_N707 then CP.NumZ:=StrToInt(EKKA.RD_Item[10]);

                if Not ReadCashState(CP,0) then Abort;
                DoneCheck(CP,0,ST_ZREP,True);

                if (Iter>0)and(EKKA.TypeEKKA <> EKKA_N707) then
                  raise EAbort.Create('Z-отчет не снят!')
                else
                  if (Iter = 1) and (EKKA.TypeEKKA=EKKA_N707) then
                    Break;

               end else Exit;

              if ((EKKA.TypeEKKA=EKKA_MARRY301MTM) or ((EKKA.TypeEKKA=EKKA_N707)) or (CP.NumZ=-1)) and (P1=0) then
               begin
                 if EKKA.TypeEKKA=EKKA_N707 then
                 begin
                   //получение движения средств по кассе
                     try
                       ri:=TStringList.Create;
                       ri.Clear;
                       GtCshStt:='';
                       GetCashState(GtCshStt, ErrCode, ErrDescription, Opt.IPAddrEKKA);
                       ri.Text:=GtCshStt;
                       //служебное изъятие перед снятием z-отчета для MicroHelp MG N707TS (5 - конечный остаток)
                       try
                         in_out_final_balance:=StrToCurr(ri[5])*0.01;
                       except
                         in_out_final_balance:=0;
                       end;
                       EKKA.fpCashOutput(in_out_final_balance);
                     finally
                       ri.Free;
                     end;

                     //записать результаты z-отчета в таблицу APTEKA_NET.dbo.journ_insertion для N707TS
                     try
                       with DM.qrZ_insertion do
                       begin
                         Close;
                         SQL.Clear;
                         SQL.Add('exec spY_Z_insertion 1, '''+FormatDateTime('YYYY-MM-DD HH:MM:SS',Now())+''', '+IntToStr(CP.NumZ)+', '+IntToStr(Opt.KassaID)+', '+IntToStr(abs(CP.Vzh))+', '+IntToStr(CP.Fn)+', '+CurrToStr(in_out_final_balance));
                         ExecSQL;
                       end;
                     except
                       on E:Exception do MainF.MessBox('Не могу сохранить значение изъятой суммы. Получена ошибка от сервера: '+E.Message);
                     end;

                 end;
                EKKA.fpZRep;
                if EKKA.LastError<>'' then Abort;
               end;
             end;
    end;
   except
    on E:Exception do
     begin
       mssg:=trim(EKKA.LastError);
       if (EKKA.TypeEKKA = EKKA_N707)and((length(trim(mssg))>0)and(mssg[1]='5'))and(Iter > 0) then
         exit;
      if P1=1 then Exit;
      if EKKA.LinkOut then ErrMes:='Невозможно подключиться к кассовому аппарату. Проверьте провода сзади кассового аппарата и нажмите ' else
      if EKKA.PaperOut then ErrMes:='Закончилась чековая или контрольная лента. Вставте ленту и нажмите ' else
      if EKKA.LastError<>'' then ErrMes:=EKKA.LastErrorDescr+'. Нажмите '
                            else ErrMes:=E.Message+'. Нажмите ';

      if q>1 then
       begin
        Case P of
         ST_CHECK:ErrMes:=ErrMess+'"ОК", чтобы попытаться закрыть чек, "Отмена" - прекратить попытку закрыть чек!';
         ST_ZREP: ErrMes:=ErrMess+'"ОК", чтобы попытаться снять Z-отчет, "Отмена" - прекратить попытку снять Z-отчет!';
        end;

        if ShowTextQ(ErrMes) then Continue else begin Exit; end;
       end else begin
                 Case P of
                  ST_CHECK:ErrMes:=ErrMes+'"Закрыть", чтобы попытаться закрыть чек еще раз.';
                  ST_ZREP:ErrMes:=ErrMes+'"Закрыть", чтобы попытаться снять Z-отчет еще раз.';
                 end;
                 ShowText(ErrMes);
                 if (q=3) and (P=ST_ZREP) and (P1=0) then Exit;
                 Continue;
                end;
     end;
   end;
   Inc(Iter);
  Until False;
 end;

procedure TryWriteToJournal;
var CP:TChekPos;
 begin
  if EKKA.UseEKKA=False then Exit;
  CP.NumZ:=-1;
  if ReadCashState(CP,0) then DM.WriteToJournZ(CP);
 end;

procedure PrintHead;
var Tb:TTableObj;
    i:Integer;
 begin

  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Indent:=0;
  PrintRep.Font.Name:='Arial Narrow';
  PrintRep.Font.Size:=4;
  PrintRep.LeftMargin:=50;
  PrintRep.TopMargin:=0;
  PrintRep.BottomMargin:=0;
  PrintRep.AddTable(1,1);
  Tb:=PrintRep.LastTable;
  Tb.SetWidths('480');

  Tb.Cell[1,1].Align:=AL_CENTER;

  if Prm.AptekaID in [240,227] then Tb.Cell[1,1].AddText('ФЛП Симонян Х.С.'+#10)
                               else Tb.Cell[1,1].AddText(Prm.FirmNameUA+#10);

  Tb.Cell[1,1].LeftIndent:=0;
  Tb.Cell[1,1].LeftMargin:=0;
  Tb.Cell[1,1].RightMargin:=0;

  for i:=1 to 4 do
   begin
    DM.Qr3.Close;
    DM.Qr3.SQL.Text:='select Value from Spr_Const where Descr=''eStr'+IntToStr(i)+'''';
    DM.Qr3.Open;
    if DM.Qr3.FieldByName('Value').AsString<>'' then  Tb.Cell[1,1].AddText(DM.Qr3.FieldByName('Value').AsString+#10);
   end;
  Tb.Cell[1,1].Font.Size:=3;

  Tb.Cell[1,1].Align:=AL_CENTER;
  Tb.Cell[1,1].Font.Size:=5;
  Tb.Cell[1,1].Font.Name:='Times New Roman';

  if Prm.AptekaID<>240 then
   begin
    Tb.Cell[1,1].AddText('*******************'#10);
    Tb.Cell[1,1].AddText('* УКРАЇНА ЄДИНА *'#10);
    Tb.Cell[1,1].AddText('*******************'#10);
   end;
 end;

procedure PrintFooter(Param:Byte);
var Tb:TTableObj;
    tmpPr,i:Integer;
{

 Param: 1 -чек,  2 - отчет,  3 - служебный документ

}
 begin
  Tb:=PrintRep.LastTable;
  Tb.Cell[1,1].Align:=AL_LEFT;
  Tb.Cell[1,1].AddText('ДЧ '+FormatDateTime('dd',Now)+'/'+FormatDateTime('mm',Now)+'/'+FormatDateTime('yy',Now)+'   '+FormatDateTime('hh:nn',Now)+#10);
  Tb.Cell[1,1].Align:=AL_CENTER;
  Tb.Cell[1,1].Font.Size:=4;
  Case param of
   1:begin
      if Prm.IsKurier then
       Tb.Cell[1,1].AddText('НЕ ФIСКАЛЬНИЙ ЧЕК'+#10#10#10);
     end;
  end;

  Tb.SetBorders(1,1,1,1,EMPTY_BORDER);
  if MainF.Design then PrintRep.PreView else
  try
   tmpPr:=Printer.PrinterIndex;
   for i:=0 to Printer.Printers.Count-1 do
    if Pos('ZONERICH',AnsiUpperCase(Printer.Printers[i]))>0 then
     begin
      Printer.PrinterIndex:=i;
      Printer.Copies:=1;
      Break;
     end;
   PrintRep.Print;
  finally
   Printer.PrinterIndex:=tmpPr;
  end;
 end;

procedure NewPrintChek(Cp:TChekPos; NCh:Integer=0);
var Tb,Tb1:TTableObj;
    i:Integer;
    S:String;

 begin
  PrintHead;
  Tb:=PrintRep.LastTable;
  Tb.Cell[1,1].Align:=AL_LEFT;
  Tb.Cell[1,1].Font.Name:='Arial';
  Tb.Cell[1,1].Font.Style:=[fsBold];
  Tb.Cell[1,1].Font.Size:=5;
  S:='';

  if NCh>0 then S:='.'+IntToStr(NCh);
  Tb.Cell[1,1].AddText('ЧЕК №   '+IntToStr(Abs(CP.NumbChek))+S+#10);
  Tb.Cell[1,1].Font.Name:='Arial Narrow';
  Tb.Cell[1,1].Font.Style:=[];
  Tb.Cell[1,1].Font.Size:=4;

  if Prm.IsKurier=False then
   begin
    Tb.Cell[1,1].AddText('КАСИР '+IntToStr(Prm.ID_Gamma)+#10);
    Tb.Cell[1,1].AddText('ВIДД. 1'#10);
   end;

  Tb.SetBorders(1,1,1,1,EMPTY_BORDER);

 end;

procedure WriteCopyChek(S:String);
 begin
  try
   if S='' then Exit;
   ForceDirectories(WorkPath+'\Cheks');
   AppendStringToFile(WorkPath+'\Cheks'+'\K_'+IntToStr(Opt.KassaID)+'_'+FormatDateTime('ddmmyyyy',Date)+'.txt',S);
  except
  end;
 end;

function FiscalChek(Qr:TADOQuery; CheckOnly:Boolean; var CP:TChekPos; IsLog:Boolean):Boolean;
var NCh,Ac,Ty,RC,i,Nds,q:Integer;
    fPodar:Boolean;
    tmpPr,tmpR,Res:Integer;
    oSumSkd,oCena,SumChek,SumSkdS,SumShiftSkd,Sk,Summa,Sm,SumSkd,SumSkPos,SumSkdPos,Sm1:Real;
    PrintCHP:TPrintCHP;
    dx,Razn,TS:Currency;
    K:Integer;
    sss,S,s1,Nm:String;
    pSummA,pSumB,pSm,pSumSkd,pSumA,SumSpis:Real;
    pA,pB,IsDnepr:Boolean;
    sSkd,sNalog:String;
    Tb:TTableObj;
    iii:Integer;
    sNum:String;

 function Popravka(Sum:Real):Real;
  begin
   Result:=Sum;
   {
   if EKKA.TypeEKKA=EKKA_DATECS3530T then begin Result:=Sum; Exit; end;
   try
    if (CP.TypeOplat<>TO_CHEK) or (CP.PSkd<>5) then Abort;
    Repeat
     if (Sum<0.01) or (K=0) then Break;
     Sum:=Sum-dx; Dec(K);
    Until False;
    Result:=Sum;
   except
    Result:=Sum;
   end;
   }
  end;

 Begin
  Result:=True;
  Res:=0;
  try
   try
    if CheckOnly then Exit;
    if Not (CP.TypeOplat in [TO_CHP,TO_CASH,TO_CHEK]) then Exit;

    if (CP.TypeOplat=TO_CHEK) and (CP.PSkd=5) then
     begin
      Sk:=MainF.SumChek-MainF.SumChek*(CP.PSkd/100);
      Str(Sk:10:2,S);
      Razn:=MainF.SumChekFull-StrToFloat(S);
      if Razn>0 then dx:=-0.01 else dx:=0.01;
      K:=Round(Abs(Razn/0.01));
     end else K:=0;

    NCh:=0;
    RC:=Qr.RecordCount;
    if Opt.EKKAAsPrinter then  NewPrintChek(CP) else

    if CP.TypeOplat in [TO_CHP,TO_CHPBEZNAL] then
     begin
      MainF.CHPChek.Clear;
      MainF.CHPChek.Add('');
      MainF.CHPChek.Add('СПДФЛ '+Opt.CHPName);
      MainF.CHPChek.Add('Инд. № '+Opt.CHPIndN);
      MainF.CHPChek.Add(Opt.CHPAddr);
      MainF.CHPChek.Add('');
      MainF.CHPChek.Add('Чек №'+IntToStr(Abs(CP.NumbChek)));
      MainF.CHPChek.Add('');
     end;

   Summa:=0; SumSkd:=0; SumShiftSkd:=0; SumSkdS:=0; SumChek:=0; SumSpis:=0;
   fPodar:=False; pSumA:=0; pSumB:=0;
   pSumma:=0; pSumSkd:=0;

   if Opt.EKKAAsPrinter then
    begin
     PrintRep.AddTable(1,RC);
     Tb:=PrintRep.LastTable;
     Tb.SetWidths('480');
     Tb.SetBorders(1,1,1,RC,EMPTY_BORDER);

    {
     Tb.Cell[1,1].Align:=AL_CENTER;
     Tb.Cell[1,1].AddText('+38057-344-0-344'#10);

     if Prm.AptekaSklad=False then
      Tb.Cell[1,1].AddText('www.apteka911.com.ua'#10);
     Tb.Cell[1,1].Align:=AL_LEFT;
    }

    end else begin
             {
              EKKA.fpServiceText(0,1,0,CenterStr('+38057-344-0-344',30));
              if Prm.AptekaSklad=False then
               EKKA.fpServiceText(0,1,0,CenterStr('www.apteka911.com.ua',30));
             }
             end;
   for i:=1 to RC do
    begin
     if i=1 then Qr.First else Qr.Next;
     if Qr.FieldByName('Type_Tov').AsInteger=99 then Continue;
     if (MainF.IsKiosk) and (CP.TypeOplat=TO_CASH) and (CP.PrPayRecipt<>0) then
      begin
       Case Cp.Iter of
        1:if MainF.FArtCodeList[Qr.FieldByName('Art_code').AsInteger].Recipt=1 then Continue;
        2:if MainF.FArtCodeList[Qr.FieldByName('Art_code').AsInteger].Recipt=0 then Continue;
       end;
      end;

     SumSkdS:=SumSkdS+Qr.FieldByName('SumSkd').AsCurrency;
     SumSkPos:=Abs(Qr.FieldByName('SumSkd').AsCurrency+Qr.FieldByName('SumSkdK').AsCurrency);

     //SumChek:=SumChek+Qr.FieldByName('Kol').AsInteger*Qr.FieldByName('Cena').AsCurrency;
     SumSkdPos:=Popravka(SumSkPos);

     SumSkd:=SumSkd+SumSkdPos;
     SumShiftSkd:=SumShiftSkd+(SumSkdPos-SumSkPos);

     SumSpis:=SumSpis+Qr.FieldByName('SumSpis').AsCurrency;

{
     if ((Prm.AptekaSklad) and (Prm.Dobraia=False)) or (Cp.IsIApteka=True) or (Cp.IsStrah=True) or (Cp.IsPayMaster=True) or (Prm.IsNightCena=True) or (Cp.IdRes<>-1) then
      SumChek:=SumChek+Qr.FieldByName('CenaP').AsCurrency*Qr.FieldByName('Kol').AsInteger-Qr.FieldByName('SumSkdP').AsCurrency
     else
      SumChek:=SumChek+Qr.FieldByName('Cena').AsCurrency*Qr.FieldByName('Kol').AsInteger-SumSkdPos;
}
     SumChek:=SumChek+Qr.FieldByName('CenaP').AsCurrency*Qr.FieldByName('Kol').AsInteger-Qr.FieldByName('SumSkdP').AsCurrency;

     if Not (CP.TypeOplat in [TO_CHP,TO_CHPBEZNAL]) then
      begin
       Nds:=Qr.FieldByName('F_NDS').AsInteger;

//       if Prm.AptekaID in [3,68,69,70,71,72,73,75,76] then Nds:=2;

       if Prm.NDS=False then Nds:=2;

       if (Nds=1) and (Opt.EKKAAsPrinter=False) then
        begin
         Sm1:=(1/6)*Qr.FieldByName('Kol').AsInteger*Qr.FieldByName('Cena').AsCurrency;
         s1:=AddStr('ПДВ - *А20.00%=',CurrToStrF(Sm1,ffFixed,2),30)+AddStr('Сумма без ПДВ=',CurrToStrF(Qr.FieldByName('Kol').AsInteger*Qr.FieldByName('Cena').AsFloat-Sm1,ffFixed,2),30);
         if Not EKKA.fpAddFinStr(s1) then Exit;
        end;

       Nm:=Qr.FieldByName('Names').AsString;

       if EKKA.TypeEKKA in [EKKA_EXELLIO,EKKA_FP2000,EKKA_N707] then Ac:=Qr.FieldByName('Art_Code').AsInteger else Ac:=0;
       if (Qr.FieldByName('Art_Code').AsInteger=53537) then Nm:='Тера Флю Лар табл. №5';
       if AnsiUpperCase(Qr.FieldByName('art_name').AsString)=AnsiUpperCase('ПОДАРУНОК') then begin Nm:='Подарунок'; fPodar:=True; end;

       sss:='';
       if (CP.TypeCardNew=1) and (CP.Type_Skd=SK_CARD) and (CP.PSkd>Qr.FieldByName('SkdNew').AsFloat) and (Qr.FieldByName('Art_Code').AsInteger<>3) then sss:='* ';

{
       if ((Prm.AptekaSklad) and (Prm.Dobraia=False)) or (Cp.IsIApteka=True) or (Cp.IsStrah=True) or (Cp.IsPayMaster=True) or (Prm.IsNightCena=True) or (Cp.IdRes<>-1) then
        begin
         oCena:=Qr.FieldByName('CenaP').AsCurrency;
         oSumSkd:=Qr.FieldByName('SumSkdP').AsCurrency;
        end else begin
                  oCena:=Qr.FieldByName('Cena').AsCurrency;
                  oSumSkd:=SumSkdPos;
                 end;
}
       oCena:=Qr.FieldByName('CenaP').AsCurrency;
       oSumSkd:=Qr.FieldByName('SumSkdP').AsCurrency;

       if RoundTo(Qr.FieldByName('Cena').AsCurrency,-2)>0 then
        begin
         if Opt.EKKAAsPrinter=False then
          begin
           if Qr.FieldByName('Art_Code').AsInteger in [1,2,7] then Nm:='Приєднання до дисконтної програми' else
           if Qr.FieldByName('Art_Code').AsInteger=4 then Nm:='Обслуговування' else Nm:=Copy(sss+Nm,1,30);
           if (Qr.FieldByName('Art_Code').AsInteger=129870) and (Prm.IsKurDostavka=True) then CP.SumKurDost:=CP.SumKurDost+Qr.FieldByName('Kol').AsInteger*oCena;
           if Not EKKA.fpAddSale(Nm,
                                 Qr.FieldByName('Kol').AsInteger,
                                 oCena,
                                 1,
                                 Ac,
                                 Nds,
                                 -oSumSkd,
                                 ''
                                ) then Exit;
          end else begin
{
         oCena:=Qr.FieldByName('CenaP').AsCurrency;
         oSumSkd:=Qr.FieldByName('SumSkdP').AsCurrency;
}
{
                    if ((Prm.AptekaSklad) and (Prm.Dobraia=False)) or (Cp.IsIApteka=True) or (Cp.IsStrah=True) or (Cp.IsPayMaster=True) or (Prm.IsNightCena=True) or (Cp.IdRes<>-1) then
                     begin
                      pSumSkd:=pSumSkd+Qr.FieldByName('SumSkdP').AsCurrency;
                      pSm:=Qr.FieldByName('Kol').AsInteger*Qr.FieldByName('CenaP').AsCurrency;
                     end else begin
                               pSumSkd:=pSumSkd+Qr.FieldByName('SumSkd').AsCurrency;
                               pSm:=Qr.FieldByName('Kol').AsInteger*Qr.FieldByName('Cena').AsCurrency
                              end;
}

                    pSumSkd:=pSumSkd+Qr.FieldByName('SumSkdP').AsCurrency;
                    pSm:=Qr.FieldByName('Kol').AsInteger*Qr.FieldByName('CenaP').AsCurrency;

                    if Qr.FieldByName('F_NDS').AsInteger in [2,4] then
                     begin
                      pB:=True;
                      sNalog:='Б';
                      pSumB:=pSumB+(pSm-Qr.FieldByName('SumSkd').AsCurrency)/(107/7);
                     end else begin
                               pA:=True;
                               sNalog:='А';
                               pSumA:=pSumA+(pSm-Qr.FieldByName('SumSkd').AsCurrency)/6;
                              end;

                    pSumma:=pSumma+pSm;

                    Tb:=PrintRep.LastTable;

                    Tb.Cell[1,i].AddText(sss+Qr.FieldByName('Art_Code').AsString+' '+Qr.FieldByName('Names').AsString+#10);
                    Tb.Cell[1,i].AddText('     '+Qr.FieldByName('Kol').AsString+'*'+CurrToStrF(Qr.FieldByName('Cena').AsCurrency,ffFixed,2)+' = '+
                                         CurrToStrF(Qr.FieldByName('Kol').AsInteger*Qr.FieldByName('Cena').AsCurrency,ffFixed,2)+'-'+sNalog+#10);
                   if Not ((Prm.AptekaSklad) and (Prm.Dobraia=False)) then
                    begin
                     if Qr.FieldByName('SumSkd').AsCurrency>0 then
                      Tb.Cell[1,i].AddText('ЗНИЖКА -     '+CurrToStrF(Qr.FieldByName('SumSkd').AsCurrency,ffFixed,2)+#10);
                    end;

                    {
                    if (i<RC) and (RC mod 10=0) then
                     begin
                      EndPrintChek;
                      Inc(NCh);
                      NewPrintChek(CP,NCh);

                      Summa:=0; SumSkd:=0; SumShiftSkd:=0; SumSkdS:=0; SumChek:=0;
                      pSumA:=0; pSumB:=0; pSumma:=0; pSumSkd:=0;
                     end;
                    }
                   end;
        end
       end
     else try
           Sm:=Qr.FieldByName('Kol').AsInteger*Qr.FieldByName('Cena').AsCurrency;
           Summa:=Summa+Sm;
           MainF.CHPChek.Add(CopyStrR(IntToStr(i)+'. ',4)+
                             CopyStrF(Qr.FieldByName('Art_Code').AsString+' '+
                             Trim(Qr.FieldByName('Names').AsString),43)+' '+
                             CopyStrR(Qr.FieldByName('Kol').AsString,3)+' x'+
                             CopyStrR(CurrToStrF(Qr.FieldByName('Cena').AsCurrency,ffFixed,2),9)+' ='+
                             CopyStrR(CurrToStrF(Sm,ffFixed,2),9)
                             );
          except
          end;
     sSkd:='0';
     if CP.Skd>0 then sSkd:=CurrToStrF(CP.Skd,ffFixed,2);
     if IsLog then
      WriteLog(FormatDateTime('dd.mm.yy hh:nn:ss',Now)+'|'+
               Qr.FieldByName('Art_Code').AsString+'|'+
               Qr.FieldByName('Names').AsString+'|'+
               Qr.FieldByName('Kol').AsString+'|'+
               CurrToStrF(oCena,ffFixed,2)+'|'+
               CurrToStrF(oSumSkd,ffFixed,2)+'|'+
               sSkd+'|'+
               IntToStr(CP.NumCard)+'|'+
               CurrToStrF(CP.AccumSumChek-CP.SumCashToCard,ffFixed,2)+'|'+
               CurrToStrF(SumSpis,ffFixed,2)+'|'+
               CurrToStrF(CP.SumCashToCard,ffFixed,2));
    end;
{   if CP.SumCashToCard>0 then // Пробиваем сдачу оставленную на карту
    begin
      if EKKA.TypeEKKA in [EKKA_EXELLIO,EKKA_FP2000] then Ac:=1 else Ac:=0;
      if Not EKKA.fpAddSale('Сумма к предоплате',
                           1,
                           CP.SumCashToCard,
                           1,
                           Ac,
                           1,
                           0,
                           ''
                          ) then Exit;
    end;}

{
   if (CP.TypeOplat=TO_CHEK) and (CP.PSkd=5) and (Abs(SumShiftSkd)>0) then
    begin
     DM.QrEx1.Close;
     DM.QrEx1.SQL.Clear;
     DM.QrEx1.SQL.Add('declare @ri int');
     DM.QrEx1.SQL.Add('set @ri=IsNull((select top 1 row_id from ArhCheks where numb_chek='+IntToStr(CP.NumbChek)+' and Vzh='+IntToStr(CP.Vzh)+'),-1)');
     DM.QrEx1.SQL.Add('if @ri>0');
     DM.QrEx1.SQL.Add('update ArhCheks set ShiftSkd='+CurrToStr(SumShiftSkd)+' where row_id=@ri');
     DM.QrEx1.ExecSQL;
    end;
}
   if CP.TypeOplat in [TO_CHP,TO_CHPBEZNAL] then
    try
     MainF.CHPChek.Add('');
     MainF.CHPChek.Add('');
     if SumSkd>0 then
      begin
       MainF.CHPChek.Add('  '+CopyStrF('Сумма',9)+':  '+CopyStrR(CurrToStrF(Summa,ffFixed,2),12));
       MainF.CHPChek.Add('  '+CopyStrF('Скидка',9)+':  '+CopyStrR(CurrToStrF(SumSkd,ffFixed,2),12));
      end;
     MainF.CHPChek.Add('  '+CopyStrF('К оплате',9)+':  '+CopyStrR(CurrToStrF(Summa-SumSkd,ffFixed,2),12));
     MainF.CHPChek.Add('');
     MainF.CHPChek.Add('');
     MainF.CHPChek.Add('__________________ подпись');
     MainF.CHPChek.Add(DateTimeToStr(Now)+#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13);
     if MainF.MessBox('Печатать чек для покупателя?',52)=ID_YES then PrintStrings(MainF.CHPChek);
{     PrintCHP:=TPrintCHP.Create(True);
     if PrintCHP.Suspended then PrintCHP.Resume;
}
    except
    end;

   if Opt.EKKAasPrinter then
    begin
     PrintRep.AddTable(1,1);
     Tb:=PrintRep.LastTable;
     Tb.SetWidths('480');

     if RC>1 then
      begin
       Tb.Cell[1,1].Font.Name:='Arial';
       Tb.Cell[1,1].Font.Style:=[];
       Tb.Cell[1,1].Font.Size:=5;
       Tb.Cell[1,1].Align:=AL_CENTER;
       Tb.Cell[1,1].AddText('- - РАЗОМ ПО ЧЕКУ - -'#10);

      if Not ((Prm.AptekaSklad) and (Prm.Dobraia=False)) then
       begin
        if pSumSkd>0 then
         begin
          Tb.Cell[1,1].Align:=AL_LEFT;
          Tb.Cell[1,1].Font.Name:='Arial Narrow';
          Tb.Cell[1,1].Font.Style:=[];
          Tb.Cell[1,1].Font.Size:=4;
          Tb.Cell[1,1].AddText('ЗНИЖКА -     '+CurrToStrF(pSumSkd,ffFixed,2)+#10);
         end;
       end;
      end;

     Tb.Cell[1,1].Font.Name:='Arial Narrow';
     Tb.Cell[1,1].Font.Style:=[fsBold];
     Tb.Cell[1,1].Font.Size:=6;
     Tb.Cell[1,1].Align:=AL_CENTER;

     if (Prm.AptekaSklad) and (Prm.Dobraia=False) then
      begin
       Tb.Cell[1,1].AddText('СУМА '+CurrToStrF(pSumma,ffFixed,2)+' ГРН'#10);
      end else  Tb.Cell[1,1].AddText('СУМА '+CurrToStrF(pSumma-pSumSkd,ffFixed,2)+' ГРН'#10);


     Tb.Cell[1,1].Font.Name:='Arial Narrow';
     Tb.Cell[1,1].Font.Style:=[];
     Tb.Cell[1,1].Font.Size:=4;
     Tb.Cell[1,1].Align:=AL_RIGHT;
     if pA then Tb.Cell[1,1].AddText('*А 20.00%    '+CurrToStrF(pSumA,ffFixed,2)+#10);
     if pB then Tb.Cell[1,1].AddText('*Б  7.00%    '+CurrToStrF(pSumB,ffFixed,2)+#10);
     Tb.Cell[1,1].Align:=AL_CENTER;
     Tb.Cell[1,1].AddText('- - - - Службова iнформацiя - - - -'#10);
     Tb.Cell[1,1].Align:=AL_LEFT;
    end;

   if (Not EKKA.UseEKKA) and (Opt.EKKAasPrinter=False) and (EKKA.EmulEKKA=False) then Exit;

//   ShowMessage(IntToStr(Ty));

//   if MainF.SumSkd<>SumSkdS then Abort;
{   if CP.PSkd>0 then
    begin
     if SumSkd>0 then EKKA.fpServiceText(1,1,1,'Знижка: '+IntToStr(Round(CP.PSkd))+'%');
    end;
}
   if MainF.TypeChek=TC_KURER then
    if Opt.EKKAasPrinter then Tb.Cell[1,1].AddText('А'#10)
                         else EKKA.fpServiceText(1,1,0,'А');

   if CP.TypeOplat=TO_CHEK then
    if Opt.EKKAasPrinter then
     begin

      if (CP.SumSkd>SumSpis) and (SumSpis>0) then
       begin
        Tb.Cell[1,1].AddText('Знижка по списанню '+CurrToStrF(SumSpis,ffFixed,2)+' грн.'#10);
        Tb.Cell[1,1].AddText('Знижка по термiналу '+CurrToStrF(CP.SumSkd-SumSpis,ffFixed,2)+' грн.'+#10);
       end;

      //Tb.Cell[1,1].AddText('ПК '+CP.BCard+#10);
      if CP.BFIO<>'' then Tb.Cell[1,1].AddText(CP.BFIO+#10);
     end else begin
               //EKKA.fpServiceText(1,1,0,'ПК '+CP.BCard);
               if (CP.SumSkd>SumSpis) and (SumSpis>0) then
                begin
                  if EKKA.TypeEKKA<>EKKA_N707 then
                  begin
                    EKKA.fpServiceText(1,1,0,'Знижка по списанню '+CurrToStrF(SumSpis,ffFixed,2)+' грн.'+CP.BCard);
                    EKKA.fpServiceText(1,1,0,'Знижка по термiналу '+CurrToStrF(CP.SumSkd-SumSpis,ffFixed,2)+' грн.');
                  end
                  else
                  begin
                    EKKA.fpServiceText(1,1,0,'Знижка по списанню ');
                    EKKA.fpServiceText(1,1,0,CurrToStrF(SumSpis,ffFixed,2)+' грн.'+CP.BCard);
                    EKKA.fpServiceText(1,1,0,'Знижка по термiналу ');
                    EKKA.fpServiceText(1,1,0,CurrToStrF(CP.SumSkd-SumSpis,ffFixed,2)+' грн.');
                  end;
                end;
               if CP.BFIO<>'' then EKKA.fpServiceText(1,1,0,CP.BFIO);
              end;

{   if CP.Bonus>0 then
    if Opt.EKKAasPrinter then Tb.Cell[1,1].AddText('Сумма Бонусов: +'+CurrToStrF(CP.Bonus,ffFixed,2)+' = '+CurrToStrF(CP.BonusAll,ffFixed,2)+#10'- - - - - - - - - - - - - - - - - - - - '#10) else
     begin
      EKKA.fpServiceText(1,1,0,'Сумма Бонусов: +'+CurrToStrF(CP.Bonus,ffFixed,2)+' = '+CurrToStrF(CP.BonusAll,ffFixed,2));
      EKKA.fpServiceText(1,1,0,'- - - - - - - - - - - - - - - - - - - - ');
     end;
     }

   if fPodar then
    if Opt.EKKAasPrinter then Tb.Cell[1,1].AddText('Вам должны дать подарок!'#10'- - - - - - - - - - - - - - - - - - - - '#10) else
     begin
      if EKKA.TypeEKKA <> EKKA_N707 then
      begin
        EKKA.fpServiceText(1,1,0,'Вам должны дать подарок!');
        EKKA.fpServiceText(1,1,0,'- - - - - - - - - - - - - - - - - - - - ');
      end
      else
      begin
        EKKA.fpServiceText(1,1,0,'Вам дадут подарок!');
        EKKA.fpServiceText(1,1,0,'- - - - - - - - - -');
      end;
     end;

   if MainF.FIsChSeria=False then
    begin
     if Opt.EKKAasPrinter then
      begin
 {
       Tb.Cell[1,1].Font.Style:=[fsBold];
       Tb.Cell[1,1].Font.Size:=5;
       Tb.Cell[1,1].AddText('Проверь родинку!'#10'т.057-750-9-111'#10'- - - - - - - - - - - - - - - - - - - - '#10);
 }
{
       Tb.Cell[1,1].AddText('***************'#10);
       Tb.Cell[1,1].AddText('*ЄДИНА  КРАЇНА*'#10);
       Tb.Cell[1,1].AddText('***************'#10);
}

       Tb.Cell[1,1].Font.Style:=[];
       Tb.Cell[1,1].Font.Size:=4;
       Tb.Cell[1,1].AddText('Смена 3 '+#10'- - - - - - - - - - - - - - - - - - - - '#10);

       if (CP.TypeCardNew=1) and (CP.Type_Skd=SK_CARD) then
        begin
         if MainF.IsOgrSkd then
          begin
           Tb.Cell[1,1].AddText('В чеке есть позиции с меньшим');
           Tb.Cell[1,1].AddText('% накопления чем на карточке');
          end;
         Tb.Cell[1,1].AddInterv(4);
         Tb.Cell[1,1].AddInterv(4);
         Tb.Cell[1,1].AddText(CenterStr('Ваш % по карте ='+IntToStr(Round(CP.SkdNew))+'%',30)+#10);

         CP.SkdMonth:=Floor(CP.SumChek/CP.SumAddPerc);

         if (CP.SkdMonth>0) and (Round(CP.SkdNew+CP.SkdMonth)<25) then
          begin
           Tb.Cell[1,1].AddText('На последующие покупки Ваш %'#10);
           Tb.Cell[1,1].AddText('будет (до '+FormatDateTime('dd.mm.yy',EndOfTheMonth(Date))+') '+IntToStr(Round(CP.SkdNew))+'+'+IntToStr(Round(CP.SkdMonth))+'='+IntToStr(Round(CP.SkdNew+CP.SkdMonth))+'%'+#10 );
          end;
         Tb.Cell[1,1].AddText('- - - - - - - - - - - - - - - - - - - - - - - -'#10);

         Tb.Cell[1,1].AddText(CenterStr('Баланс накопичених грошей',30)+#10);
         Tb.Cell[1,1].AddText(CenterStr('по карті №'+IntToStr(CP.NumCard),30)+#10);
         Tb.Cell[1,1].AddText('- - - - - - - - - - - - - - - - - - - - - - - -'+#10);

         Tb.Cell[1,1].AddText('   Було:       '+CurrToStrF(CP.AccumSum,ffFixed,2)+' грн.'+#10);

         Tb.Cell[1,1].AddText('   Нараховано:+'+CurrToStrF(CP.AccumSumChek-CP.SumCashToCard,ffFixed,2)+' грн.'#10);
         if CP.SumCashToCard>0 then
         Tb.Cell[1,1].AddText('   Решта:     +'+CurrToStrF(CP.SumCashToCard,ffFixed,2)+' грн.'#10);
         if SumSpis>0 then
          Tb.Cell[1,1].AddText('   Списано:   -'+CurrToStrF(SumSpis,ffFixed,2)+' грн.'#10);
         Tb.Cell[1,1].AddText('   ----------------------------------- '#10);

         Tb.Cell[1,1].AddText('   Залишок:    '+CurrToStrF(CP.AccumSum+CP.AccumSumChek-SumSpis,ffFixed,2)+' грн.'#10);
         Tb.Cell[1,1].AddText('- - - - - - - - - - - - - - - - - - - - - - - -'#10);
         Tb.Cell[1,1].AddInterv(4);
         Tb.Cell[1,1].AddInterv(4);
        end;

       Tb.Cell[1,1].Align:=AL_JUST;
      end else begin
//                EKKA.fpServiceText(1,1,1,'Проверь родинку!');
//                EKKA.fpServiceText(1,1,1,'т.057-750-9-111');
{                EKKA.fpServiceText(1,1,0,'               ');
                EKKA.fpServiceText(1,1,1,'***************');
                EKKA.fpServiceText(1,1,1,'*ЄДИНА  КРАЇНА*');
                EKKA.fpServiceText(1,1,1,'***************');
}
                if EKKA.TypeEKKA<>EKKA_MARRY301MTM then
                 begin
                  if EKKA.TypeEKKA = EKKA_N707 then
                  begin
                    EKKA.fpServiceText(1,1,0,Copy(Prm.ZavApteki,1,Pos(' ',Prm.ZavApteki)-1));
                    EKKA.fpServiceText(1,1,0,'- - - - - - - - - -');
                  end
                  else
                  begin
                    EKKA.fpServiceText(1,1,0,Copy(Prm.ZavApteki,1,Pos(' ',Prm.ZavApteki)-1));
                    EKKA.fpServiceText(1,1,0,'- - - - - - - - - - - - - - - - - - - - ');
                  end;
                 end;

                if (CP.TypeCardNew=1) and (CP.Type_Skd=SK_CARD) then
                 if MainF.IsOgrSkd then
                  begin
                   if EKKA.TypeEKKA <> EKKA_N707 then
                   begin
                     EKKA.fpServiceText(1,1,0,'В чеке есть позиции с меньшим');
                     EKKA.fpServiceText(1,1,0,'% накопления чем на карточке');
                   end
                   else
                   begin
                     EKKA.fpServiceText(1,1,0,'В чеке есть позиции ');
                     EKKA.fpServiceText(1,1,0,'с меньшим % накопле-');
                     EKKA.fpServiceText(1,1,0,'ния чем на карточке');
                   end;
                  end;

                if EKKA.TypeEKKA <> EKKA_N707 then
                  EKKA.fpServiceText(1,1,0,'-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*')
                else
                  EKKA.fpServiceText(1,1,0,'-*-*-*-*-*-*-*-*-*-*');

                if Prm.Dobraia=False then
                 begin
                  if Prm.Region<2 then
                   begin

                    if EKKA.TypeEKKA<>EKKA_N707 then
                    begin
                      EKKA.fpServiceText(1,1,0,'Поиск и резервирование лек-ств');
                      EKKA.fpServiceText(1,1,1,'0-800-505-911');
                    end
                    else
                    begin
                      EKKA.fpServiceText(1,1,0,'Поиск и резервирова-');
                      EKKA.fpServiceText(1,1,1,'ние лек-ств');
                      EKKA.fpServiceText(1,1,1,'0-800-505-911');
                    end;

                    if Not ((Prm.Region=1) and (Prm.AptekaSklad=True)) then
                     EKKA.fpServiceText(1,1,0,CenterStr('www.apteka911.com.ua',30));

                    {
                    if EKKA.IsFLP=False then
                     begin
                      if EKKA.TypeEKKA <> EKKA_N707 then
                      begin
                        EKKA.fpServiceText(1,1,0,'Для замечаний и предложений');
                        EKKA.fpServiceText(1,1,1,'0-800-500-488');
                      end
                      else
                      begin
                        EKKA.fpServiceText(1,1,0,'Для замечаний и пред-');
                        EKKA.fpServiceText(1,1,1,'ложений 0-800-500-488');
                      end;
                     end;
                    }
                   end else begin
                             if EKKA.TypeEKKA <> EKKA_N707 then
                             begin
                               EKKA.fpServiceText(1,1,0,'Пошук та резервування лiкiв');
                               EKKA.fpServiceText(1,1,1,'0-800-505-911');
                               EKKA.fpServiceText(1,1,0,CenterStr('www.apteka911.com.ua',30));
                               {
                               if EKKA.IsFLP=False then
                                begin
                                 EKKA.fpServiceText(1,1,0,'Для зауважень та пропозицiй');
                                 EKKA.fpServiceText(1,1,1,'0-800-500-488');
                                end;
                               }
                             end
                             else
                             begin
                               EKKA.fpServiceText(1,1,0,'Пошук та резервування');
                               EKKA.fpServiceText(1,1,1,'лiкiв 0-800-505-911');
                               EKKA.fpServiceText(1,1,0,CenterStr('www.apteka911.com.ua',20));
                               {
                               if EKKA.IsFLP=False then
                                begin
                                 EKKA.fpServiceText(1,1,0,'Для зауважень та про-');
                                 EKKA.fpServiceText(1,1,1,'позицiй 0-800-500-488');
                                end;
                               }
                             end;
                            end;
                 end;

                if (CP.TypeCardNew=1) and (CP.Type_Skd=SK_CARD) then
                 begin

                  if Prm.AptekaSklad=False then
                    EKKA.fpServiceText(1,1,0,CenterStr('Ваш % по карті ='+IntToStr(Round(CP.SkdNew))+'%',30));

                  CP.SkdMonth:=Floor(CP.SumChek/CP.SumAddPerc);

                  if (CP.SkdMonth>0) and (Round(CP.SkdNew+CP.SkdMonth)<25) then
                   begin
                     if EKKA.TypeEKKA<>EKKA_N707 then
                     begin
                       EKKA.fpServiceText(1,1,0,'На последующие покупки Ваш %');
                       EKKA.fpServiceText(1,1,0,'будет (до '+FormatDateTime('dd.mm.yy',EndOfTheMonth(Date))+') '+IntToStr(Round(CP.SkdNew))+'+'+IntToStr(Round(CP.SkdMonth))+'='+IntToStr(Round(CP.SkdNew+CP.SkdMonth))+'%' );
                     end
                     else
                     begin
                       EKKA.fpServiceText(1,1,0,'На последующие покупки');
                       EKKA.fpServiceText(1,1,0,'Ваш % будет ');
                       EKKA.fpServiceText(1,1,0,'(до '+FormatDateTime('dd.mm.yy',EndOfTheMonth(Date))+') '+IntToStr(Round(CP.SkdNew))+'+'+IntToStr(Round(CP.SkdMonth))+'='+IntToStr(Round(CP.SkdNew+CP.SkdMonth))+'%' );
                     end;
                   end;

                  if EKKA.TypeEKKA <> EKKA_N707 then
                  begin
                    EKKA.fpServiceText(1,1,0,'- - - - - - - - - - - - - - - - - - - - ');
                    EKKA.fpServiceText(1,1,0,CenterStr('Баланс накопичених грошей',30));
                    EKKA.fpServiceText(1,1,0,CenterStr('по карті №'+IntToStr(CP.NumCard),30));
                    EKKA.fpServiceText(1,1,0,'- - - - - - - - - - - - - - - - - - - - ');

                    EKKA.fpServiceText(1,1,0,'   Було:       '+CurrToStrF(CP.AccumSum,ffFixed,2)+' грн.');
//                    EKKA.fpServiceText(1,1,0,'- - - - - - - - - - - - - - - - - - - - ');

                    EKKA.fpServiceText(1,1,0,'   Нараховано:+'+CurrToStrF(CP.AccumSumChek-CP.SumCashToCard,ffFixed,2)+' грн.');
                    if CP.SumCashToCard>0 then
                      EKKA.fpServiceText(1,1,0,'   Решта:     +'+CurrToStrF(CP.SumCashToCard,ffFixed,2)+' грн.');

                    if SumSpis>0 then
                       EKKA.fpServiceText(1,1,0,'   Списано:   -'+CurrToStrF(SumSpis,ffFixed,2)+' грн.');
                    EKKA.fpServiceText(1,1,0,'   --------------------------------------------------- ');

                    EKKA.fpServiceText(1,1,0,'   Залишок:    '+CurrToStrF(CP.AccumSum+CP.AccumSumChek-SumSpis,ffFixed,2)+' грн.');
                    EKKA.fpServiceText(1,1,0,'-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
                  end
                  else
                  begin
                    EKKA.fpServiceText(1,1,0,'- - - - - - - - - -');
                    EKKA.fpServiceText(1,1,0,CenterStr('Баланс накопичених ',20));
                    EKKA.fpServiceText(1,1,0,CenterStr('грошей по карті',20));
                    EKKA.fpServiceText(1,1,0,CenterStr('№ '+IntToStr(CP.NumCard),20));
                    EKKA.fpServiceText(1,1,0,'- - - - - - - - - -');

                    EKKA.fpServiceText(1,1,0,'  Було:       '+CurrToStrF(CP.AccumSum,ffFixed,2)+' грн.');
//                    EKKA.fpServiceText(1,1,0,'- - - - - - - - - - - - - - - - - - - - ');

                    EKKA.fpServiceText(1,1,0,'  Нараховано:+'+CurrToStrF(CP.AccumSumChek-CP.SumCashToCard,ffFixed,2)+' грн.');
                    if CP.SumCashToCard>0 then
                      EKKA.fpServiceText(1,1,0,'  Решта:     +'+CurrToStrF(CP.SumCashToCard,ffFixed,2)+' грн.');

                    if SumSpis>0 then
                       EKKA.fpServiceText(1,1,0,'  Списано:   -'+CurrToStrF(SumSpis,ffFixed,2)+' грн.');
                    EKKA.fpServiceText(1,1,0,'  -------------------');

                    EKKA.fpServiceText(1,1,0,'  Залишок:    '+CurrToStrF(CP.AccumSum+CP.AccumSumChek-SumSpis,ffFixed,2)+' грн.');
                    EKKA.fpServiceText(1,1,0,'-*-*-*-*-*-*-*-*-*-*');
                  end;
                 end;

            {
             EKKA.fpServiceText(1,1,0,CenterStr('* * *',30));
             if CP.IsPromo=True then
             begin
              for iii:=Low(CP.PromoStr) to High(CP.PromoStr) do
               if CP.PromoStr[iii]<>'' then EKKA.fpServiceText(1,1,StrToInt(Copy(CP.PromoStr[iii],1,1)),Copy(CP.PromoStr[iii],2,Length(CP.PromoStr[iii])));
              EKKA.fpServiceText(1,1,0,CenterStr('* * *',30));
             end;
             EKKA.fpServiceText(1,1,0,'Отримуй знижку 5% при реєстра-');
             EKKA.fpServiceText(1,1,0,'ції на сайті apteka911.com.ua');
             EKKA.fpServiceText(1,1,0,CenterStr('* * *',30));
            }
           end;
    end;

   // Печатаем уникальный идентификатор чека
   EKKA.fpServiceText(1,1,0,'- - - - - - - - - - - - - - - - - - - - ');

//   EKKA.fpServiceText(1,1,0,'Отримуйте подарунок на сайті');
//   EKKA.fpServiceText(1,1,0,'apteka911.com.ua за номером:');

   sNum:=FormatDateTime('ddmmyyhhnn',Now())+IntToStrF(CP.NumbChek,6)+IntToStrF(Prm.AptekaID,3)+IntToStrF(Opt.KassaID,2)+IntToStrF(Prm.ID_Gamma,6);
   System.Insert('-',sNum,8);
   System.Insert('-',sNum,16);
   System.Insert('-',sNum,24);
   EKKA.fpServiceText(1,1,0,sNum);
   EKKA.fpServiceText(1,1,0,'- - - - - - - - - - - - - - - - - - - - ');

   if (CP.id_strah>0) and (CP.name_strah<>'') then
    begin
      if EKKA.TypeEKKA<>EKKA_N707 then
      begin
        EKKA.fpServiceText(1,1,0,'- - - - - - - - - - - - - - - - - - - - ');
        EKKA.fpServiceText(1,1,0,CP.name_strah);
        EKKA.fpServiceText(1,1,0,'- - - - - - - - - - - - - - - - - - - - ');
      end
      else
      begin
        EKKA.fpServiceText(1,1,0,'- - - - - - - - - -');
        EKKA.fpServiceText(1,1,0,CP.name_strah);
        EKKA.fpServiceText(1,1,0,'- - - - - - - - - -');
      end;
    end;


   Ty:=0;

   {

    Типы оплат:

     1 - Безнал 3
     2 - Безнал 2
     3 - Безнал 1
     4 - Наличные

   }

   Case CP.TypeOplat of
    TO_CASH:begin
             Ty:=4;
             if Opt.EKKAasPrinter then Tb.Cell[1,1].AddText('ГОТIВКА '+CurrToStrF(pSumma-pSumSkd,ffFixed,2)+#10);
            end;
    TO_CHEK:begin
             if (Cp.IsIAptekaCredit=True) or (Cp.IsPayMaster=True) then Ty:=1 else
             if (CP.B1) or (CP.TypeOplatKur=DO_BEZGOT1) then Ty:=3 else
             if (Prm.IsKurier) and (CP.TypeOplata240=0) then Ty:=1
                                                        else Ty:=2;

             if Opt.EKKAasPrinter then
              begin
               if CP.B1 then Tb.Cell[1,1].AddText('БЕЗГОТIВКОВА 1 '+CurrToStrF(pSumma-pSumSkd,ffFixed,2)+#10)
                        else Tb.Cell[1,1].AddText('БЕЗГОТIВКОВА 2 '+CurrToStrF(pSumma-pSumSkd,ffFixed,2)+#10);
              end

            end else raise EAbort.Create('Неизвестный тип оплаты!');
   end;


   if Opt.EKKAAsPrinter then
    begin
     PrintFooter(1);
    end;

   if (Not EKKA.UseEKKA) and (EKKA.EmulEKKA=False) then Exit;

//   if MainF.CheckBox2.Checked then EKKA.fpCancelFiscalReceipt else
    begin
     TS:=0;
     if (CP.TypeChek in [TC_PILOT,TC_INSULIN]) {and (CP.Fransh>0)} and (CP.SumChek-CP.SumDopl>0) then
      begin
       EKKA.fpCloseFiscalReceipt(CP.SumDopl,Ty,SumChek,SumChek-CP.SumDopl,False);
      end else
     if (CP.IsStrah=True) {and (CP.Fransh>0)} and (CP.SumChek-CP.Fransh>0) then
      begin
       EKKA.fpCloseFiscalReceipt(CP.Fransh,Ty,SumChek,SumChek-CP.Fransh,False);
      end else
     if MainF.TypeChek=TC_RECIPT_PL then
      begin
//       ShowMessage(IntToStr(Ty)+' - '+CurrToStr(SumChek)+' - '+CurrToStr(CP.SumChekRecipt));
       EKKA.fpCloseFiscalReceipt(TS,Ty,SumChek,CP.SumChekRecipt,True);

      end else
     if MainF.TypeChek in [TC_SERTIF,TC_STRETCH] then
      begin
       if CP.TakedSum=SumChek then TS:=CP.TakedSum-CP.SumSertif else TS:=CP.TakedSum;

       if CP.NumCardDnepr<>-1 then IsDnepr:=True else IsDnepr:=False;

       if CP.SumChek>CP.SumSertif then EKKA.fpCloseFiscalReceipt(TS,Ty,SumChek,CP.SumSertif,IsDnepr)
                                  else EKKA.fpCloseFiscalReceipt(0,Ty,SumChek,CP.SumSertif,IsDnepr);
      end else begin
                if CP.TypeOplat=TO_CHEK then EKKA.fpCloseFiscalReceipt(SumChek,Ty,SumChek)
                                        else EKKA.fpCloseFiscalReceipt(CP.TakedSum,Ty,SumChek);
               end;
    end;
   finally
    if EKKA.UseEKKA then
     begin

      if EKKA.LastError<>'' then MainF.MessBox(EKKA.LastErrorDescr);

      Res:=CheckStatusCheck(CP);

      if Res=1 then
       begin

        if MainF.TypeChek in [TC_KURER,TC_SERTIF] then EKKA.fpCheckCopy;
        if (MainF.TypeChek in [TC_STRETCH]) and (MainF.CopyChek) then EKKA.fpCheckCopy;

        MainF.PayCount:=MainF.PayCount+1;
        WriteCopyChek(EKKA.fpGetCheckCopyText);

        if IsLog then WriteLog('ФИСКАЛЬНЫЙ ЧЕК '+IntToStr(CP.TypeOplat))
       end else
      if Res=-1 then
       begin
        if IsLog then WriteLog('НЕ ДЕЙСТВИТЕЛЬНЫЙ ЧЕК '+IntToStr(CP.TypeOplat));
        raise EAbort.Create('Чек не пробит ни по компьютеру, ни по кассовому аппарату. Попробуйте закрыть чек еще раз либо отменить его: '#10+EKKA.LastErrorDescr);
       end else Result:=False;
     end;
   end;
  except
   on E:Exception do
    if Res=-1 then raise EAbort.Create('Ошибка пробивки чека по ЕККА: '+E.Message);
  end;
 End;

function GetNewNumbChek(Param:Byte=0):Integer;
 begin
  try
   DM.Qr.Close;
   Case Param of
    0:DM.Qr.SQL.Text:='select IsNull(Min(numb_chek),0)-1 as Mx from ArhCheks where id_kassa='+IntToStr(Opt.KassaID);
    1:DM.Qr.SQL.Text:='select IsNull(Max(numb_chek),10000000)+1 as Mx from ArhCheks where numb_chek>10000000 and numb_chek<100000000 and id_kassa='+IntToStr(Opt.KassaID);
   end;
   DM.Qr.Open;

   if (Param=0) and (DM.Qr.FieldByName('Mx').AsInteger>=0) then Result:=-1 else Result:=DM.Qr.FieldByName('Mx').AsInteger;
  except
   Result:=0;
  end;
 end;

function LoadTextLog(FName:String):String;
var NumStr,NewChek:Integer;
    nm:String;
    F:Text;
    B:Boolean;
    S:String;
    CP:TChekPos;

 function GetTypeOplat(S:String; N:Integer):Integer;
  begin
   try
    Result:=StrToInt(Copy(S,N+1,1))+1;
   except
    Result:=1;
   end;
  end;

 function WritePos(S:String):String;
 var A:TStrArray;
  begin
   try
    GetStrArray(S,A,['|']);
//    if High(A)<>5 then Abort;
    CP.Date:=StrToDateTime(A[0]);
    CP.Art_Code:=StrToInt(A[1]);
    CP.ArtName:=A[2];
    CP.Kol:=StrToInt(A[3]);
    CP.Cena:=StrToFloat(A[4]);
    CP.Skd:=StrToFloat(A[5]);
    DM.QrL.Close;
    DM.QrL.SQL.Clear;
    DM.QrL.SQL.Add('Insert into TextLog(NUMB_CHEK,DATE_CHEK,ART_CODE,NAMES,KOL,CENA,SUMSKD,ID_KASSA,KASSA_NUM,PRIZNAK)');
    DM.QrL.SQL.Add('Values('+IntToStr(CP.NumbChek)+','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',CP.Date)+''',');
    DM.QrL.SQL.Add(IntToStr(CP.Art_Code)+','''+Copy(CP.ArtName,1,70)+''',');
    DM.QrL.SQL.Add(IntToStr(CP.Kol)+','+CurrToStr(CP.Cena)+',');
    DM.QrL.SQL.Add(CurrToStr(CP.Skd)+','+IntToStr(CP.ID_Kassa)+',0,0)');
    DM.QrL.ExecSQL;
    Result:='';
   except
    on E:Exception do
     Result:='Ошибка записи позиции: '+E.Message+' Строка: '+IntToStr(NumStr);
   end;
  end;

 function CloseChek(CP:TChekPos):String;
  begin
   try
    DM.QrL.Close;
    DM.QrL.SQL.Clear;
    DM.QrL.SQL.Add('Update TextLog set Priznak='+IntToStr(CP.Priznak)+', kassa_num='+IntToStr(CP.TypeOplat));
    DM.QrL.SQL.Add('where numb_chek='+IntToStr(CP.NumbChek)+' and id_kassa='+IntToStr(CP.ID_Kassa)+' and ');
    DM.QrL.SQL.Add('      date_chek='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',CP.Date)+'''');
    DM.QrL.ExecSQL;
    Result:='';
   except
    Result:='Ошибка фиксации чека №'+IntToStr(CP.NumbChek);
   end;
  end;

 Begin
  Result:='';
  B:=False;
  NewChek:=0;
  CP.NumbChek:=0;
  NumStr:=0;
  try
   if Not FileExists(FName) then raise EAbort.Create('Файл '+FName+' не найден!');
   nm:=ExtractFileName(FName);
   try
    CP.ID_Kassa:=StrToInt(Copy(nm,6,Pos('_',nm)-6));
   except
    raise EAbort.Create('Неверный формат файла!');
   end;
   Assign(F,FName); Reset(F); B:=True;
   While Not Eof(F) do
    begin
     ReadLn(F,S);
     Inc(NumStr);
     if Copy(S,1,6)='Чек: №' then
      begin
       try
        CP.NumbChek:=StrToInt(Copy(S,7,Length(S)-6));
       except
        Dec(NewChek);
        CP.NumbChek:=NewChek;
       end;
      end else
     if Copy(S,1,10)='ФИСКАЛЬНЫЙ' then
      begin
       CP.TypeOplat:=GetTypeOplat(S,15);
       CP.Priznak:=1;
       CloseChek(CP);
      end else
     if Copy(S,1,10)='НЕ ДЕЙСТВИ' then
      begin
       CP.TypeOplat:=GetTypeOplat(S,22);
       CP.Priznak:=2;
       CloseChek(CP);
      end else WritePos(S);
    end;
   Close(F);
   B:=False;
   Result:='';
  except
   on E:Exception do
    begin
     if B then Close(F);
     Result:=E.Message;
    end;
  end;
 End;

function CorrPhoneNumber(S:String):String;
var i:Integer;
 begin
  Result:='';
  for i:=1 to Length(S) do
   begin
    if S[i] in CH_DIGIT then Result:=Result+S[i];
   end;
  if Result='' then Result:=S; 
 end; 

function GrafTimeToTime(G:TGrafTime; P:Byte):TDateTime;
 begin
  Case P of
   0:Result:=StrToTime(IntToStr(G.tStart)+':'+IntToStr(G.tStMin));
   1:Result:=StrToTime(IntToStr(G.tEnd)+':'+IntToStr(G.tEndMin));
  end;
 end;

function StrToGrafTime(S:String):TGrafTime;
var P:Integer;

 begin
  P:=Pos(':',S);
  Result.tStart:=StrToInt(Copy(S,1,P-1));
  System.Delete(S,1,P);

  P:=Pos('-',S);
  Result.tStMin:=StrToInt(Copy(S,1,P-1));
  System.Delete(S,1,P);

  P:=Pos(':',S);
  Result.tEnd:=StrToInt(Copy(S,1,P-1));
  System.Delete(S,1,P);

  P:=Pos('_',S);
  Result.tEndMin:=StrToInt(Copy(S,1,P-1));
  System.Delete(S,1,P);

  Result.Descr:=S;
 end;

function GrafTimeToStr(T:TGrafTime):String;
 begin
  Result:=IntToStr(T.tStart)+':'+IntToStr(T.tStMin)+'-'+IntToStr(T.tEnd)+':'+IntToStr(T.tEndMin)+'_'+T.Descr;
 end;

function GetDescr(S:String):String;
var P:Integer;
 begin
  P:=Pos('#',S);
  if P=0 then Result:=S else Result:=Copy(S,1,P-1);
 end;

function GetKassa(S:String):String;
var P,P1:Integer;
 begin
  try
   P:=Pos('#',S);
   P1:=Pos('$',S);
   if P=0 then Result:='' else
    begin
     if P1<P then Result:=Copy(S,P+1,Length(S)-P)
             else Result:=Copy(S,P+1,P1-P-1);
    end; 
  except
   Result:='';
  end; 
 end;

function GetRole(S:String):Integer;
var P,i:Integer;
    ss:String;
 begin
  try
   P:=Pos('$',S);
   if P=0 then Result:=1 else
    begin
     ss:='';
     for i:=P+1 to Length(S) do
      if S[i]<>'H' then ss:=ss+S[i] else Break;
    end;
   Result:=StrToInt(ss);
  except
   Result:=1;
  end;
 end;

function IsSrok(S:String; var Srok:TDateTime):Boolean;
var i:Integer;
 begin
  Result:=False;
  Srok:=0;
  try
   if Pos('(',S)=0 then Abort;
   for i:=1 to Length(S)-6 do
    begin
     if S[i]='(' then
      if (S[i+1] in CH_DIGIT) and (S[i+2] in CH_DIGIT) and
         (S[i+3]='.') and (S[i+4] in CH_DIGIT) and
         (S[i+5] in CH_DIGIT) and (S[i+6]=')') then
        begin
         try
          Srok:=StrToDate('01.'+S[i+1]+S[i+2]+'.'+S[i+4]+S[i+5]);
         except
         end;
         Result:=True;
         Break;
        end;
    end;
  except
   Result:=False;
  end;
 end;

function ExecScript(FName:String):Boolean;
 begin
  try
   Result:=True;
   if Not FileExists(FName) then Exit;
   DM.ADOCo.BeginTrans;
   try
    DM.qrScript.Close;
    DM.qrScript.SQL.LoadFromFile(FName);
    DM.qrScript.Open;
    if DM.qrScript.FieldByName('Res').AsInteger<>9999 then Abort;
    DM.ADOCo.CommitTrans;
    DeleteFile(FName);
   except
    DM.ADOCo.RollbackTrans;
    raise
   end;
  except
   Result:=False;
  end;
 end;

function GetKoef(Koef,Upak:Integer):Integer;
 begin
  Result:=1;
  if (Koef>1) or (Upak>1) then
   begin
    if (Koef=1) and (Upak>1) then Result:=Upak else Result:=Koef;
   end;
  if Result<=0 then Result:=1;
 end;


procedure MakeTovRep(D1,D2:TDateTime; Param:Byte);
 begin
  DM.spY_TovRep.Close;
  DM.spY_TovRep.Parameters.ParamValues['@dt1']:=StrToDateTime(DateToStr(D1)+' 00:00:00');
  DM.spY_TovRep.Parameters.ParamValues['@dt2']:=StrToDateTime(DateToStr(D2)+' 23:59:59');
  DM.spY_TovRep.Parameters.ParamValues['@calconly']:=1;
  DM.spY_TovRep.Parameters.ParamValues['@param']:=Param;
  DM.spY_TovRep.ExecProc;
  if DM.spY_TovRep.Parameters.ParamValues['@RETURN_VALUE']<>1 then Abort;
 end;

function PrintBlankForBack(VF:TVozrForm; Dt:TDateTime):Boolean;
var Adr:String;
    i:Integer;
    Lt:TTableObj;

 begin
  if DM.qrBack.IsEmpty then Exit;
  try
   PixperI:=560;
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial Narrow';
   PrintRep.Indent:=0;
   PrintRep.Align:=AL_CENTER;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.Font.Size:=8;
   PrintRep.AddText('ЗАЯВЛЕНИЕ'#10);
   PrintRep.Font.Style:=[];
   PrintRep.Indent:=120;
   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Size:=6;
   PrintRep.AddText('Директору '+Prm.FirmNameRU+#10+Prm.BossRod+#10);
   PrintRep.Indent:=0;
   PrintRep.Font.Size:=5;
   PrintRep.Align:=AL_JUST;
   PrintRep.Font.Style:=[];
   PrintRep.AddText('от покупателя '+VF.F+' '+VF.N+' '+VF.O);

   if VF.IsSimpl=False then
    begin
     PrintRep.AddText('проживающего по адресу '+VF.A+#10);
     if Prm.aCity='Харьков' then Adr:='г. '+Prm.aCity+', '+Prm.aAdress
                            else Adr:=Prm.aObl+' обл., '+Prm.aRegion+' р-н., г.'+Prm.aCity+', '+Prm.aAdress;
    end;
   PrintRep.AddText(DateToStrRU(DM.qrBack.FieldByName('Date_Chek').AsDateTime)+' в Вашей торговой точке, расположенной по адресу '+Adr+' ');
   PrintRep.AddText('мною был куплен следующий товар:'#10);

   for i:=1 to DM.qrBack.RecordCount do
    begin
     if i=1 then DM.qrBack.First else DM.qrBack.Next;
     PrintRep.AddText('    '+IntToStr(i)+'. '+DM.qrBack.FieldByName('Names').AsString+' количество ');
     PrintRep.AddText(DM.qrBack.FieldByName('kol').AsString+' на сумму '+CurrToStrF(DM.qrBack.FieldByName('cena').AsFloat*DM.qrBack.FieldByName('kol').AsFloat-DM.qrBack.FieldByName('sumskd').AsFloat,ffFixed,2)+' грн.'#10);
    end;

   PrintRep.Font.Style:=[fsBold];
   PrintRep.AddText(#10'Прошу Вас принять от меня этот товар и возвратить мне его стоимость. Чек о покупке предоставляю.'#10);

   if VF.IsSimpl=False then PrintRep.AddText('Причина возврата '+VF.Pr+#10#10)
                       else PrintRep.AddText(#10#10);

   PrintRep.Font.Style:=[];
   PrintRep.AddText(DateToStrRU(Dt)+'                                                                                                                       ______________________'#10);
//   PrintRep.AddText('17 сентября 2014  г.                                                                                                                      ______________________'#10);
   PrintRep.Font.Size:=3;
   PrintRep.Font.Style:=[fsItalic];
   PrintRep.AddText('                                                                                                                                                                      ');
   PrintRep.AddText('                                                                                                                         (подпись покупателя)'#10#10#10);
   PrintRep.Font.Size:=7;
   PrintRep.Font.Style:=[];
   PrintRep.Align:=AL_CENTER;
   PrintRep.AddText('АКТ ВЫДАЧИ ДЕНЕЖНЫХ СРЕДСТВ И ВОЗВРАТА ТОВАРА'#10);
   PrintRep.Align:=AL_JUST;
   PrintRep.Font.Size:=5;

   PrintRep.AddText('Мною, заведующим /заместителем торговой точки '+Prm.AptekaNameLic+' '+VF.Z+' выданы денежные средства за возвращенный товар:'+#10);

   for i:=1 to DM.qrBack.RecordCount do
    begin
     if i=1 then DM.qrBack.First else DM.qrBack.Next;
     PrintRep.AddText('    '+IntToStr(i)+'. '+DM.qrBack.FieldByName('Names').AsString+' количество ');
     PrintRep.AddText(DM.qrBack.FieldByName('kol').AsString+' на сумму '+CurrToStrF(DM.qrBack.FieldByName('cena').AsFloat*DM.qrBack.FieldByName('kol').AsFloat-DM.qrBack.FieldByName('sumskd').AsFloat,ffFixed,2)+' грн.'#10);
    end;

   PrintRep.AddText(#10'покупателю '+VF.F+' '+VF.N+' '+VF.O+' ');

   if VF.IsSimpl=False then
    begin
     PrintRep.AddText('(документ, который устанавливает личность покупателя: '+VF.PaspT+' серия '+VF.PaspS+' номер '+VF.PaspN);

     PrintRep.AddText(' выдан '+DateToStrRU(VF.PaspD)+' '+VF.PaspV+')'+#10);
    end;

   PrintRep.AddText('в сумме '+CurrToWordsRU(Abs(VF.Summ),0)+#10#10);

   PrintRep.AddText('Дата и время выдачи чека, подтверждающего покупку товара:   '+DateToStrRU(DM.qrBack.FieldByName('Date_Chek').AsDateTime)+' '+TimeToStr(DM.qrBack.FieldByName('Date_Chek').AsDateTime)+#10);
   PrintRep.AddText('Номер чека, подтверждающего покупку товара:                            № '+IntToStr(VF.NumbChek)+#10#10);


   PrintRep.AddTable(3,2);
   Lt:=PrintRep.LastTable;
   Lt.SetWidths('8000,2000,8000');
   Lt.Cell[1,1].Align:=AL_CENTER;
   Lt.Cell[1,1].AddText('(                        ) /'+VF.Z+'/');

   Lt.Cell[1,2].Align:=AL_CENTER;
   Lt.Cell[1,2].Font.Size:=3;
   Lt.Cell[1,2].AddText('(подпись, фамилия заведующего/ заместителя торговой точки)');

   Lt.Cell[3,1].Align:=AL_CENTER;
   Lt.Cell[3,1].AddText('(                        ) /'+VF.F+' '+Copy(VF.N,1,1)+'. '+Copy(VF.O,1,1)+'./');

   Lt.Cell[3,2].Align:=AL_CENTER;
   Lt.Cell[3,2].Font.Size:=3;
   Lt.Cell[3,2].AddText('(подпись, фамилия покупателя)');

   for i:= 1 to 3 do
    begin
     Lt.Cell[i,1].TopBorder:=EMPTY_BORDER;
     Lt.Cell[i,2].BottomBorder:=EMPTY_BORDER;

     Lt.Cell[i,1].LeftBorder:=EMPTY_BORDER;
     Lt.Cell[i,2].LeftBorder:=EMPTY_BORDER;

    end;
   Lt.Cell[2,1].BottomBorder:=EMPTY_BORDER;
   Lt.Cell[3,1].RightBorder:=EMPTY_BORDER;
   Lt.Cell[3,2].RightBorder:=EMPTY_BORDER;
   PrintRep.AddInterv(7);
   PrintRep.AddTable(5,1);
   Lt:=PrintRep.LastTable;
   Lt.SetWidths('1500,5500,5000,5500,1500');
   Lt.Cell[2,1].Align:=AL_CENTER;
   Lt.Cell[4,1].Align:=AL_CENTER;

   Lt.Cell[2,1].AddText(#10#10#10#10+'место'#10+'приклеивания'#10+'фискального чека'#10+'покупателя,'+#10+'подтверждающего покупку'+#10#10#10);
   Lt.Cell[4,1].AddText(#10#10#10#10+'место'#10+'приклеивания'#10+'КОПИИ возвратного фискального'#10+'чека'+#10#10#10#10#10);

   Lt.Cell[3,1].TopBorder:=EMPTY_BORDER;
   Lt.Cell[3,1].BottomBorder:=EMPTY_BORDER;

   Lt.Cell[1,1].TopBorder:=EMPTY_BORDER;
   Lt.Cell[1,1].BottomBorder:=EMPTY_BORDER;

   Lt.Cell[5,1].TopBorder:=EMPTY_BORDER;
   Lt.Cell[5,1].BottomBorder:=EMPTY_BORDER;

   Lt.Cell[1,1].LeftBorder:=EMPTY_BORDER;
   Lt.Cell[5,1].RightBorder:=EMPTY_BORDER;

   PrintRep.AddInterv(7);
   PrintRep.Align:=AL_LEFT;
//   PrintRep.AddText('17 сентября 2014 г.'+#10);
   PrintRep.AddText(DateToStrRU(Dt)+'                                       C операцией ознакомлен ________________________');
   Result:=PrintRep.PreView;
  except
   on E:Exception do
    begin
     MainF.MessBox('Ошибка формирования печатной формы заявления: '+E.Message);
     Result:=False;
    end;
  end;
 end;

procedure InitiateUnLoading(Qr:TADOQuery);
 begin
  try
   Qr.Close;
   Qr.SQL.Clear;
   Qr.SQL.Add('declare @sql varchar(5000) ');
   Qr.SQL.Add('set @sql=''del D:\EKKA_NET\WORK\ARH\''+convert(varchar,getdate(),4)+''.zip /Q'' ');
   Qr.SQL.Add('exec master..xp_cmdshell @sql                                                   ');
   Qr.SQL.Add('set @sql=''del D:\EKKA_NET\WORK\ARH\''+convert(varchar,getdate(),4)+''\* /Q''   ');
   Qr.SQL.Add('exec master..xp_cmdshell @sql                                                   ');
   Qr.SQL.Add('set @sql=''rd D:\EKKA_NET\WORK\ARH\''+convert(varchar,getdate(),4)+'' /Q''      ');
   Qr.SQL.Add('exec master..xp_cmdshell @sql                                                   ');
   Qr.SQL.Add('delete from JUnload where date_un=convert(datetime,convert(varchar,getdate(),23)) and ToOffice=1 ');
   Qr.ExecSQL;
  except
  end;
 end;

function PrintStiker(Num:String; PrVozr:Byte):Boolean;
var Tb:TTableObj;
    ss:String;
 begin
  try
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Size:=7;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.AddTable(3,1);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('10000,30000,30000');
{   Tb.Cell[1,1].Font.Size:=11;
   Tb.Cell[1,1].AddText(#10+'    '+IntToStr(j)+'.');
   Tb.Cell[1,1].Font.Size:=8;
   Tb.Cell[1,1].AddText(#10#10'Накладная: '+Arr[i].LB.Caption+#10#10);
}
   ss:='';
   if PrVozr in [5,8,12] then ss:='БЕЛОСТОЦКИЙ!' else
   if PrVozr in [0,4,6,7] then ss:='МОСКОВСКИЙ!';

   Tb.Cell[2,1].AddText(ss+#10+Prm.AptekaNameRU+#10#10);

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select Descr from SprPrVozr where id='+IntToStr(PrVozr);
   DM.QrEx.Open;
   Tb.Cell[2,1].AddText('Причина: '+DM.QrEx.FieldByName('Descr').AsString+#10);
   Tb.Cell[2,1].AddInterv(3);

   Tb.Cell[2,1].Font.Style:=[];
   Tb.Cell[2,1].Font.Name:='EanBwrP36Tt';
   Tb.Cell[2,1].Font.CharSet:=ANSI_CHARSET;

   Tb.Cell[2,1].Font.Size:=16;
   Tb.Cell[2,1].AddText(GenEAN13(Num));

   Tb.Cell[3,1].Font.Size:=6;
   Tb.Cell[3,1].Align:=AL_RIGHT;
   Tb.Cell[3,1].AddText(#10'Дата: '+FormatDateTime('dd.mm.yyyy hh:nn:ss',Now));

   Tb.Cell[3,1].Font.Size:=7;
   Tb.Cell[3,1].Align:=AL_LEFT;
   Tb.Cell[3,1].AddText(#10#10#10#10'Фамилия собравшего'+#10+'возврат______________'#10);

   Tb.Cell[1,1].RightBorder:=EMPTY_BORDER;

   Tb.Cell[2,1].RightBorder:=EMPTY_BORDER;


   Result:=PrintRep.PreView;
  except
   Result:=False;
  end;
 end;

procedure DrawRoundRect(Im:TImage; Down:Boolean; Ct:TControl);
var r,dy,dx:Integer;
    clW,clG:TColor;
 begin
  Im.Picture:=nil;
  r:=4;

  if Down=False then
   begin
    clW:=clWhite;
    clG:=clGray;
   end else begin
             clG:=clWhite;
             clW:=clGray;
            end;

  Im.Canvas.Pen.Color:=clBtnFace;
  Im.Canvas.Brush.Color:=clBtnFace;
  Im.Canvas.FillRect(Rect(0,0,Im.Width,Im.Height));

  Im.Canvas.Pen.Color:=clG;

  Im.Canvas.Brush.Color:=clSilver;
  Im.Canvas.RoundRect(0,0,Im.Width,Im.Height,r*2+1,r*2+1);

  Im.Canvas.Pen.Color:=clW;
  Im.Canvas.MoveTo(r,0); Im.Canvas.LineTo(Im.Width-r,0);
  Im.Canvas.MoveTo(0,r); Im.Canvas.LineTo(0,Im.Height-r);
  Im.Canvas.MoveTo(1,2); Im.Canvas.LineTo(1,4);
  Im.Canvas.MoveTo(2,1); Im.Canvas.LineTo(4,1);
  Im.Canvas.MoveTo(1,Im.Height-4); Im.Canvas.LineTo(1,Im.Height-2);
  Im.Canvas.MoveTo(Im.Width-4,1);  Im.Canvas.LineTo(Im.Width-2,1);

  if Ct=nil then Exit;
  dx:=Im.Left;
  dy:=Im.Top;
  Im.Canvas.Pen.Color:=$0091E8FF;
  Im.Canvas.MoveTo(Ct.Left-dx,Ct.Top-1-dy); Im.Canvas.LineTo(Ct.Left-1-dx+Ct.Width+1,Ct.Top-1-dy);

  Im.Canvas.Pen.Color:=$008FE6FF;
  Im.Canvas.MoveTo(Ct.Left-1-dx,Ct.Top-dy); Im.Canvas.LineTo(Ct.Left-1-dx,Ct.Top-dy+Ct.Height);

{
  Im.Canvas.Pen.Color:=$00BCEFFF;
  Im.Canvas.MoveTo(Ct.Left-1-dx,Ct.Top-2-dy); Im.Canvas.LineTo(Ct.Left-1-dx+Ct.Width+1,Ct.Top-2-dy);
  Im.Canvas.MoveTo(Ct.Left-2-dx,Ct.Top-1-dy); Im.Canvas.LineTo(Ct.Left-2-dx,Ct.Top-1-dy+Ct.Height+1);
}
  Im.Canvas.Pen.Color:=$00A5ECFF;
  Im.Canvas.MoveTo(Ct.Left-dx,Ct.Top-dy+Ct.Height); Im.Canvas.LineTo(Ct.Left-dx+Ct.Width,Ct.Top-dy+Ct.Height);

  Im.Canvas.MoveTo(Ct.Left-dx+Ct.Width,Ct.Top-dy); Im.Canvas.LineTo(Ct.Left-dx+Ct.Width,Ct.Top-dy+Ct.Height);
 end;

procedure DrawRoundRect1(Im:TImage; R:Integer; Cl:TColor);
 begin
  Im.Canvas.Pen.Color:=clBtnFace;
  Im.Canvas.Brush.Color:=clBtnFace;
  Im.Canvas.FillRect(Rect(0,0,Im.Width,Im.Height));
  Im.Canvas.Brush.Color:=clSilver;
  Im.Canvas.Pen.Color:=Cl;
  Im.Canvas.RoundRect(0,0,Im.Width,Im.Height,r*2+1,r*2+1);
 end;

function PrintSrokSkd(P:Byte):Boolean;
var Tb:TTableObj;
    i,dy1,dy:Integer;
    B:Boolean;
    Res:String;
  //  Bm:TBitMap;
 begin
  Result:=True;
  try

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select top 1 * from AddSkd where skd in (20,30,50) and art_code in (select art_code from SprTovar (nolock) where ostat_>0 and names like ''%([0-9][0-9].[0-9][0-9])%'')';
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Exit;

   B:=False;
   if P=0 then
    begin
     DM.Qr.Close;
     DM.Qr.SQL.Text:='exec spY_CheckChangingUniqueSrok 0';
     DM.Qr.Open;
     if DM.Qr.FieldByName('Cnt').AsInteger>0 then B:=True;
    end else B:=True;

   if B then
    begin

     MainF.MessBox('ВНИМАНИЕ!!!'#10#10'После нажатия "ОК" вам будет показан список сроковых прапаратов, который необходимо распечатать и развесить на кассовом окне для покупателей!',
                    48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);

     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Text:='exec spY_UniqueSrokList';
     DM.Qr.Open;

     PrintRep.Clear;
     PrintRep.SetDefault;
     if Prm.IsOneTabInPage=False then PrintRep.Orientation:=O_LANDS;

     PrintRep.Font.Name:='Times New Roman';
     PrintRep.Font.Size:=5;
     PrintRep.Font.Style:=[fsBold];
     PrintRep.Align:=AL_CENTER;

     if Prm.IsOneTabInPage=False then
      begin
       PrintRep.AddTable(7,DM.Qr.RecordCount+2);
       PrintRep.LastTable.SetWidths('8000,1800,2000,600,8000,1800,2000')
      end else begin
                PrintRep.AddTable(3,DM.Qr.RecordCount+2);
                PrintRep.LastTable.SetWidths('8000,1800,2000');
               end;

     Tb:=PrintRep.LastTable;
     Tb.FixRows(1,2);

     if Prm.IsOneTabInPage=False then
      begin
       Tb.Cell[4,1].TopBorder:=EMPTY_BORDER;
       Tb.Cell[4,2].TopBorder:=EMPTY_BORDER;
       Tb.Cell[4,3].TopBorder:=EMPTY_BORDER;
      end;

     Tb.MergeCells(1,1,3,1);
     Tb.Cell[1,1].Font.Size:=13; Tb.Cell[1,1].AddText('Унiкальна пропозицiя!'#10#10);

     if Prm.IsOneTabInPage=False then
      begin
       Tb.MergeCells(5,1,7,1);
       Tb.Cell[5,1].Font.Size:=13; Tb.Cell[5,1].AddText('Унiкальна пропозицiя!'#10#10);
      end; 

     Tb.Cell[1,2].Font.Style:=[fsBold]; Tb.Cell[1,2].AddText('Найменування');
     Tb.Cell[2,2].Font.Style:=[fsBold]; Tb.Cell[2,2].AddText('Знижка');
     Tb.Cell[3,2].Font.Style:=[fsBold]; Tb.Cell[3,2].AddText('Цiна зi знижкою');

     if Prm.IsOneTabInPage=False then
      begin
       Tb.Cell[5,2].Align:=AL_LEFT;
       Tb.Cell[5,2].Font.Style:=[fsBold]; Tb.Cell[5,2].AddText('Найменування');
       Tb.Cell[6,2].Font.Style:=[fsBold]; Tb.Cell[6,2].AddText('Знижка');
       Tb.Cell[7,2].Font.Style:=[fsBold]; Tb.Cell[7,2].AddText('Цiна зi знижкою');
       Tb.Cell[4,1].Align:=AL_CENTER;
       Tb.Cell[4,1].Font.Style:=[fsBold];
       Tb.Cell[4,1].Font.Size:=3;
      end;


     dy:=0; dy1:=0;
     for i:=1 to DM.Qr.RecordCount do
      begin
       if i=1 then DM.Qr.First else DM.Qr.Next;

       if Prm.IsNewSrok then
        begin
         if DM.Qr.FieldByName('percskd').AsInteger=50 then begin dy1:=0;  dy:=1;  end else
         if DM.Qr.FieldByName('percskd').AsInteger=30 then begin dy1:=0;  dy:=0;  end else
         if DM.Qr.FieldByName('percskd').AsInteger=20 then begin dy1:=-1; dy:=-1; end;
        end;

       Tb.Cell[1,i+2].Align:=AL_LEFT;   Tb.Cell[1,i+2].Font.Size:=6; Tb.Cell[1,i+2].AddText(DM.Qr.FieldByName('names').AsString);
       Tb.Cell[2,i+2].Font.Size:=5+dy;  Tb.Cell[2,i+2].AddText('-'+DM.Qr.FieldByName('skdsum').AsString);
       Tb.Cell[2,i+2].Font.Size:=4+dy;  Tb.Cell[2,i+2].AddText(DM.Qr.FieldByName('SkdDescr').AsString);
       Tb.Cell[2,i+2].Font.Size:=5+dy1; Tb.Cell[2,i+2].AddText(' знижки');
       Tb.Cell[3,i+2].Font.Size:=7+dy;
       if DM.Qr.FieldByName('percskd').AsInteger=50 then
        Tb.Cell[3,i+2].AddText(CurrToStr(DM.Qr.FieldByName('cenaskd').AsCurrency)+#10)
       else
        Tb.Cell[3,i+2].AddText(CurrToStrF(DM.Qr.FieldByName('cenaskd').AsCurrency,ffFixed,2)+#10);

       Tb.Cell[3,i+2].Font.Size:=4+dy;  Tb.Cell[3,i+2].AddText('грн.');

       if Prm.IsOneTabInPage=False then
        begin
         Tb.Cell[5,i+2].Align:=AL_LEFT;   Tb.Cell[5,i+2].Font.Size:=6; Tb.Cell[5,i+2].AddText(DM.Qr.FieldByName('names').AsString);
         Tb.Cell[6,i+2].Font.Size:=5+dy;  Tb.Cell[6,i+2].AddText('-'+DM.Qr.FieldByName('skdsum').AsString);
         Tb.Cell[7,i+2].Font.Size:=4+dy;  Tb.Cell[6,i+2].AddText(DM.Qr.FieldByName('SkdDescr').AsString);
         Tb.Cell[6,i+2].Font.Size:=5+dy1; Tb.Cell[6,i+2].AddText(' знижки');

         Tb.Cell[7,i+2].Font.Size:=7+dy;
         if DM.Qr.FieldByName('percskd').AsInteger=50 then
          Tb.Cell[7,i+2].AddText(CurrToStr(DM.Qr.FieldByName('cenaskd').AsCurrency)+#10)
         else
          Tb.Cell[7,i+2].AddText(CurrToStrF(DM.Qr.FieldByName('cenaskd').AsCurrency,ffFixed,2)+#10);

         Tb.Cell[7,i+2].Font.Size:=4+dy;  Tb.Cell[7,i+2].AddText('грн.');

         Tb.Cell[4,i+2].BottomBorder:=EMPTY_BORDER;
         Tb.Cell[4,i+2].TopBorder:=EMPTY_BORDER;

         Tb.Cell[4,i+2].Align:=AL_CENTER;
         Tb.Cell[4,i+2].Font.Style:=[fsBold];
         Tb.Cell[4,i+2].Font.Size:=3;
         Tb.Cell[4,i+2].AddText('|'+#10#10+'|');
        end;
      end;

     PrintRep.Align:=AL_LEFT;
     PrintRep.Font.Size:=4;
     PrintRep.Font.Style:=[];
     PrintRep.AddText(#10#10'Дата друку: '+DateTimeToStr(Now));

    {
     Bm:=TBitMap.Create;
     try
      Bm.Assign(MainF.imNozhn.Picture);

     finally
      Bm.Free;
     end;
    }
     if PrintRep.PreView then
      begin
       DM.Qr.Close;
       DM.Qr.SQL.Text:='exec spY_CheckChangingUniqueSrok 1';
       DM.Qr.Open;
      end;
    end;
  except
   Result:=True;
  end;
 end;

function SetNewIniPosition(IniPos:TIniPos):Boolean;
var FName:String;
    IniF:TIniFile;
    q,i:Integer;
    B:Boolean;

 begin
  Result:=False;
  FName:='D:\AVA\ExplorerSV.ini';
  CopyFile(PChar(FName),'D:\AVA\ExplorerSV_old.ini',false);
  IniF:=TIniFile.Create(FName);
  try
   B:=True;
   for i:=1 to 50 do
    if IniF.ReadString('EXPLORER','ExeName'+IntToStr(i),'')<>'' then
     begin
      q:=i;
      if SameText(IniF.ReadString('EXPLORER','ExeName'+IntToStr(i),''),IniPos.ExeName) then
       begin
        IniF.WriteString('EXPLORER','ExeName'+IntToStr(i),IniPos.ExeName);
        IniF.WriteString('EXPLORER','Path'+IntToStr(i),IniPos.Path);
        IniF.WriteString('EXPLORER','Hint'+IntToStr(i),IniPos.Hint);
        IniF.WriteString('EXPLORER','Caption'+IntToStr(i),IniPos.Caption);
        IniF.WriteString('EXPLORER','Params'+IntToStr(i),IniPos.Params);
        IniF.WriteInteger('EXPLORER','IsOne'+IntToStr(i),BoolToInt(IniPos.IsOne));
        IniF.WriteInteger('EXPLORER','ShortCut'+IntToStr(i),IniPos.ShortCut);

        B:=False;
        Break;
       end;
     end;
   if B then
    begin
     IniF.WriteString('EXPLORER','ExeName'+IntToStr(q+1),IniPos.ExeName);
     IniF.WriteString('EXPLORER','Path'+IntToStr(q+1),IniPos.Path);
     IniF.WriteString('EXPLORER','Hint'+IntToStr(q+1),IniPos.Hint);
     IniF.WriteString('EXPLORER','Caption'+IntToStr(q+1),IniPos.Caption);
     IniF.WriteString('EXPLORER','Params'+IntToStr(q+1),IniPos.Params);
     IniF.WriteInteger('EXPLORER','IsOne'+IntToStr(q+1),BoolToInt(IniPos.IsOne));
     IniF.WriteInteger('EXPLORER','ShortCut'+IntToStr(q+1),IniPos.ShortCut);
    end;
  finally
   IniF.Free;
  end;
  Result:=True;
 end;

procedure AddNewIniPos(IniPos:TIniPos);
 begin
  try
   IniPos.Qr.Close;
   IniPos.Qr.SQL.Text:='select Value from Spr_Const (nolock) where Descr='''+IniPos.Descr+IntToStr(Opt.KassaID)+''' ';
   IniPos.Qr.Open;
   if IniPos.Qr.IsEmpty=False then Abort;
   if SetNewIniPosition(IniPos) then
    begin
     IniPos.Qr.Close;
     IniPos.Qr.SQL.Text:='insert into Spr_Const(Descr,Value) values('''+IniPos.Descr+IntToStr(Opt.KassaID)+''',''1'') ';
     IniPos.Qr.ExecSQL;
    end;
  except
  end;
 end;

procedure CopyFiles(CF:TCopyFiles);
 begin
  try
   CF.Qr.Close;
   CF.Qr.SQL.Text:='select Value from Spr_Const (nolock) where Descr='''+CF.Descr+IntToStr(Opt.KassaID)+''' ';
   CF.Qr.Open;
   if CF.Qr.IsEmpty=False then Abort;

   CopyDir(CF.PathFrom,CF.PathTo);

   CF.Qr.Close;
   CF.Qr.SQL.Text:='insert into Spr_Const(Descr,Value) values('''+CF.Descr+IntToStr(Opt.KassaID)+''',''1'') ';
   CF.Qr.ExecSQL;

  except
  end;
 end;

procedure Write7hourStat;
var Res,Comm:String;

 begin
{
MDMD
4816000000003230313430353136313135333136
                                        E1D40300
                                                D409
MDMD
473200000000000000000000000000000000C0F2FCFF5C8A3700000000003230313331323130313035373038
                                                                                        94FE35FF

}
  try
   if EKKA.UseEKKA=False then Exit;
   if EKKA.TypeEKKA<>EKKA_MARRY301MTM then Exit;
   Comm:='MDMD2801FF';
   EKKA.fpSendCommand(Comm);
   if EKKA.LastError<>'' then Abort;
   if Copy(Comm,1,2)='48' then
    begin
     Res:=Copy(Comm,47,2)+Copy(Comm,45,2)+Copy(Comm,43,2)+Copy(Comm,41,2);
    end else begin
              Comm:='MDMD270100';
              EKKA.fpSendCommand(Comm);
              if EKKA.LastError<>'' then Abort;
              if Copy(Comm,1,2)='47' then
               Res:=Copy(Comm,95,2)+Copy(Comm,93,2)+Copy(Comm,91,2)+Copy(Comm,89,2);
         end;
   DM.QrEx1.Close;
   DM.QrEx1.SQL.Clear;
   DM.QrEx1.SQL.Add('if (select Count(*) from Blocking72Hour where Vzh='''+EKKA.VzhNumS+''')<=0 ');
   DM.QrEx1.SQL.Add(' insert into Blocking72Hour(Vzh,TimeOut,Dt,IsUnload,IP) values(');
   DM.QrEx1.SQL.Add(''''+EKKA.VzhNumS+''',cast(0x'+Res+' as int),getdate(),0,'''+MainF.IP+''') ');
   DM.QrEx1.SQL.Add('else ');
   DM.QrEx1.SQL.Add(' update Blocking72Hour set IsUnload=0, Dt=getdate(),TimeOut=cast(0x'+Res+' as int),IP='''+MainF.IP+''' where Vzh='''+EKKA.VzhNumS+'''');
   DM.QrEx1.ExecSQL;
  except
  end;
 end;

procedure PrintBlankForNewDiscontSystem;
var Tb:TTableObj;
    i:Integer;

 procedure TextToCell(C:TCell);
 var Tb:TTableObj;
     i:Integer;
  begin
   With C do
    begin
     Align:=AL_CENTER;
     AddText('Накопительная дисконтная система'#10#10);

     Align:=AL_JUST;
     Indent:=0;
     AddText('Данная карта предоставляет Вам начальные 5% накопления, которые увеличиваются  до ');
     Font.Size:=6; Font.Style:=[fsBold];
     AddText('-9%');
     Font.Size:=5; Font.Style:=[];
     AddText(' в зависимости от суммы Ваших покупок.'#10#10'Шкала повышения процента накопления денежных средств на карту:'#10);

     Align:=AL_LEFT;
     AddTable(3,6);
     Tb:=LastTable;
     Tb.SetWidths('100,500,300');
     Tb.Cell[2,1].Align:=AL_CENTER;
     for i:=1 to 6 do
      begin
       Tb.Cell[1,i].Align:=AL_CENTER;
       Tb.Cell[3,i].Align:=AL_CENTER;

       if i>1 then
        begin
         Tb.Cell[1,i].AddText(IntToStr(i-1));
         Tb.Cell[3,i].AddText(IntToStr(i+3));
        end;
      end;
     Align:=AL_JUST;

     Tb.Cell[1,1].AddText('№пп');
     Tb.Cell[2,1].AddText('Сумма покупок (грн.)');
     Tb.Cell[3,1].AddText('% накопления');

{
     Tb.Cell[2,2].AddText('До 500 грн.');
     Tb.Cell[2,3].AddText('От 500 грн. до 800 грн.');
     Tb.Cell[2,4].AddText('От 800 грн. до 1200 грн.');
     Tb.Cell[2,5].AddText('От 1200 грн. до 1700 грн.');
     Tb.Cell[2,6].AddText('От 1700 грн.');
}

     Tb.Cell[2,2].AddText('До 2000 грн.');
     Tb.Cell[2,3].AddText('От 2000 грн. до 3200 грн.');
     Tb.Cell[2,4].AddText('От 3200 грн. до 4800 грн.');
     Tb.Cell[2,5].AddText('От 4800 грн. до 6800 грн.');
     Tb.Cell[2,6].AddText('От 6800 грн.');


     Indent:=10;
     AddText(#10#10'Плюс за каждые 5000 грн покупок в течение одного календарного месяца - Вы получаете +1% к проценту накоплений дополнительно на последующие покупки в течение этого же календарного месяца. Так Вы можете увеличить скидку до ');
     Font.Size:=6; Font.Style:=[fsBold];
     AddText('-25%.*'#10#10);
     Font.Size:=5; Font.Style:=[];

     AddText('Все накопленные деньги, которые находятся на вашей карте, вы можете потратить  в наших аптеках на любые товары (1 накопленная гривна = 1 гривне покупки).'#10#10);
     AddText('Баланс Ваших накоплений всегда можно посмотреть в нижней части чека при каждой покупке или  уточнить у провизора аптеки аптечной сети "9-1-1". Во избежание недоразумений проверяйте правильность списания накопленных денежных средств, не отходя от кассы.'#10#10);

     Indent:=0;

     AddText('Наш сайт ');
     Font.Style:=[fsUnderline];
     Font.Color:=clBlue;
     AddText('www.apteka911.com.ua'#10#10#10#10);

     Font.Style:=[];
     Font.Color:=clBlack;

     Font.Size:=4;
     AddText('* С нового календарного месяца накопительная скидка вернется на ваш стандартный накопленный процент согласно шкалы.'#10);
     AddText('** Важно! На некоторые товары скидка может не распространяться или быть меньше указанной (акционные предложения и препараты с ограниченной наценкой, согласно действующего законодательства).'#10);
    end;
  end;

 Begin
  try
   if Prm.IsNewDiscOpt then Exit;

   PrintRep(1).Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Times New Roman';
   if Prm.MaxSkd=7 then
    begin
     PrintRep.Font.Size:=5;
     PrintRep.Orientation:=O_LANDS;
     PrintRep.LeftMargin:=70;
     PrintRep.RightMargin:=70;

     PrintRep.AddTable(2,1);
     Tb:=PrintRep.LastTable;
     Tb.SetWidths('8000,8000');
     Tb.SetBorders(1,1,2,1,EMPTY_BORDER);
     Tb.Cell[1,1].RightMargin:=50;
     Tb.Cell[2,1].LeftMargin:=50;
     TextToCell(Tb.Cell[1,1]);
     TextToCell(Tb.Cell[2,1]);
    end else
   if (Prm.MaxSkd>7) then
    begin
     With PrintRep do
      begin
//       PixPerI:=1200;
       try
        PrintRep.Font.Size:=4;
        Align:=AL_CENTER;
        AddText('Накопительная дисконтная система'#10);

        Align:=AL_JUST;
        Indent:=0;
        if Prm.MaxSkd<>Prm.MinSkd then
         begin
          AddText('Данная карта предоставляет Вам начальные '+IntToStr(Prm.MinSkd+1)+'% накопления, которые увеличиваются  до ');
          Font.Size:=5; Font.Style:=[fsBold];
          AddText('-'+IntToStr(Prm.MaxSkd+1)+'% *');
          Font.Size:=4; Font.Style:=[];
          AddText(' в зависимости от суммы Ваших покупок.'#10#10'Шкала повышения процента накопления денежных средств на карту:'#10);


          Align:=AL_LEFT;
          AddTable(3,6);
          Tb:=LastTable;
          Tb.SetWidths('100,500,300');
          Tb.Cell[2,1].Align:=AL_CENTER;
          for i:=1 to 6 do
           begin
            Tb.Cell[1,i].Align:=AL_CENTER;
            Tb.Cell[3,i].Align:=AL_CENTER;

            if i>1 then
             begin
              Tb.Cell[1,i].AddText(IntToStr(i-1));
              Tb.Cell[3,i].AddText(IntToStr(i+Prm.MinSkd-1));
             end;
           end;
          Align:=AL_JUST;

          Tb.Cell[1,1].AddText('№пп');
          Tb.Cell[2,1].AddText('Сумма покупок (грн.)');
          Tb.Cell[3,1].AddText('% накопления');
{
          Tb.Cell[2,2].AddText('До 1000 грн.');
          Tb.Cell[2,3].AddText('От 1000 грн. до 1600 грн.');
          Tb.Cell[2,4].AddText('От 1600 грн. до 2400 грн.');
          Tb.Cell[2,5].AddText('От 2400 грн. до 3700 грн.');
          Tb.Cell[2,6].AddText('От 3400 грн.');
}

          Tb.Cell[2,2].AddText('До 2000 грн.');
          Tb.Cell[2,3].AddText('От 2000 грн. до 3200 грн.');
          Tb.Cell[2,4].AddText('От 3200 грн. до 4800 грн.');
          Tb.Cell[2,5].AddText('От 4800 грн. до 6800 грн.');
          Tb.Cell[2,6].AddText('От 6800 грн.');

         end else begin
                   AddText('Данная карта предоставляет Вам процент накоплений ');
                   Font.Size:=5; Font.Style:=[fsBold];
                   AddText('-13% *');
                   Font.Size:=4; Font.Style:=[];
                  end;

        Indent:=10;
        AddText('Плюс за каждые 5000 грн покупок в течение одного календарного месяца - Вы получаете +1% к проценту накоплений дополнительно на последующие покупки в течение этого же календарного месяца. Так Вы можете увеличить скидку до ');
        Font.Size:=5; Font.Style:=[fsBold];
        AddText('-25%.*'#10);
        Font.Size:=4; Font.Style:=[];

        AddText('Все накопленные деньги, которые находятся на вашей карте, вы можете потратить  в наших аптеках на любые товары (1 накопленная гривна = 1 гривне покупки).'#10);
        AddText('Баланс Ваших накоплений всегда можно посмотреть в нижней части чека при каждой покупке или  уточнить у провизора аптеки аптечной сети "9-1-1". Во избежание недоразумений проверяйте правильность списания накопленных денежных средств, не отходя от кассы.'#10);

        Indent:=0;

        AddText('Наш сайт ');
        Font.Style:=[fsUnderline];
        Font.Color:=clBlue;
        AddText('www.apteka911.com.ua'#10);

        Font.Style:=[];
        Font.Color:=clBlack;

//        Font.Size:=4;
        AddText('* Данный процент накопления действует в аптеках по адресам: '#10);
        AddText('        9% доступно в аптеках по адресам:'#10);
        AddText('        - Харківська обл., м. Балаклія, вул. Жовтнева,41'#10);
        AddText('        - Харківська обл. Балаклійський р-н, смт.Червоний Донець, вул. Леніна,11'#10);
        AddText('        - Харківська обл. м. Лозова, вул. Люксембург Рози, 37'#10);
        AddText('        - Харківська обл. м. Лозова, мкр-н 2 , 16а'#10);
        AddText('        - м. Київ, вул. Вишгородська, 56/2'#10);
        AddText('        - м. Київ, вул. Червоноармійська, б.138'#10);
        AddText('        - м. Полтава, вул. Чураевни, буд. 3/2'#10);
        AddText('        - м. Полтава, вул. Великотирнівська, 35/2'#10);
        AddText('        - Чернігівська обл., м. Ніжин, вул. Гоголя, 2а'#10);
        AddText('        - м. Суми, вул. Набережна ріки Стрілки, 6'#10);
        AddText('        - м. Суми, вул. пр-т Лушпи Михайла, 22'#10);
        AddText('        От 9% до 13% доступно в аптеках по адресам:'#10);
        AddText('        - м. Харків, вул. Гвардійців Широніців, 108'#10);
        AddText('        - м. Харків, вул. Золочівська, 19'#10);
        AddText('        - м. Харків, вул. Вальтера, 14'#10);
        AddText('        - м. Харків, пр. Гагаріна, 244'#10);
        AddText('        - м. Харків, пр. Героїв Сталінграду, 23/1'#10);
        AddText('        - Харківска обл., смт. Нова Водолага, площа Кооперативна, 15'#10);
        AddText('        11% доступно в аптеках по адресам:'#10);
        AddText('        - м. Харків, вул. Гв. Широнінців, 50/29'#10);
        AddText('        - м. Харків, вул. Героїв Праці, 20/321'#10);
        AddText('        От 11% до 13%:'#10);
        AddText('        - м. Харків, вул. Галана, 5'#10);
        AddText('        - м. Харків, пр. 50 річчя ВЛКСМ, 74'#10);
        AddText('        От 11% до 15%:'#10);
        AddText('        - м. Харків, вул. проїзд Стадіонний, 11/2'#10);
        AddText('        - м. Харків, вул. Полтавський Шлях, 119'#10);
        AddText('        - м. вул. Академіка Проскури, 5'#10);
        AddText('        - Харьковская обл. Харьковский р-н, г. Люботин, ул. Шевченко, 98'#10);
        AddText('        13% доступно в аптеках по адресам:'#10);
        AddText('        - м. Харків, вул. Корчагінців, 27'#10);
        AddText('        - м. Харків, пр. 50 лет ВЛКСМ,57/106'#10);
        AddText('        - Харьковская область,  г. Первомайский, Микрорайон 1/2, 48'#10);
        AddText('        В других аптеках Аптечной сети  "9-1-1" процент накопления будет действовать от 5% до 9%'#10);

        AddText('** С нового календарного месяца накопительная скидка вернется на ваш стандартный накопленный процент согласно шкалы.'#10);
        AddText('*** Важно! На некоторые товары скидка может не распространяться или быть меньше указанной (акционные предложения и препараты с ограниченной наценкой, согласно действующего законодательства).'#10);
      finally
//       PixPerI:=600;
      end;
     end;
    end;
   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования бланка: '+E.Message);
  end;
 End;


procedure UpdateCardInfo(N:Int64; var IsLink:Boolean; var IsBirth:Byte);
var T:TDateTime;
 begin
  try
   IsLink:=False;
   IsBirth:=0;
   DM.QrC.Close;
   DM.QrC.SQL.Clear;
   DM.QrC.SQL.Add('if (select Count(*) from LinkState)=0 select 1 as Res else ');
   DM.QrC.SQL.Add('if (select top 1 getdate()-DtLink from LinkState )<'''+Prm.TimeOutReadCard+''' ');
   DM.QrC.SQL.Add(' select 1 as Res ');
   DM.QrC.SQL.Add('else ');
   DM.QrC.SQL.Add(' select 0 as Res ');
//   DM.QrC.SQL.SaveToFile('C:\log\Link.txt');
   DM.QrC.Open;
   if DM.QrC.FieldByName('Res').AsInteger=0 then Exit;

   DM.QrX.Close;
   DM.QrX.SQL.Clear;
   DM.QrX.SQL.Add(' exec ['+Prm.ServerDB+'].datafromapteks.dbo.spY_CardInfo '+IntToStr(N));
   T:=Time;
   try
    DM.QrX.Open;
    IsBirth:=DM.QrX.FieldByName('IsBirth').AsInteger;
    IsLink:=True;
   finally
{
    Application.ProcessMessages;
    ShowMessage(TimeToStr(Time-T));
}
   end;

   if (DM.QrX.IsEmpty) or (DM.QrX.FieldByName('NumCard').AsInteger=-1) then Exit;

   DM.QrC.Close;
   DM.QrC.SQL.Clear;

   DM.QrC.SQL.Add('BEGIN TRANSACTION');
   DM.QrC.SQL.Add('declare @vSumma numeric(8,2),@vAccumSum numeric(8,2),@vSumMonth numeric(8,2), @vTypeCard int');

   DM.QrC.SQL.Add('select @vSumma=IsNull(Sum(Summa),0),  ');
   DM.QrC.SQL.Add('       @vTypeCard=(select top 1 TypeCard from CardsLog (nolock) where NumCard=:ncard5 order by date_chek desc), ');
   DM.QrC.SQL.Add('       @vAccumSum=IsNull(Sum(AccumSum),0),  ');
   DM.QrC.SQL.Add('       @vSumMonth=IsNull(Sum(case when DatePart(mm,date_Chek)=DatePart(mm,getdate()) and DatePart(yy,date_Chek)=DatePart(yy,getdate()) then SumChek else 0 end),0) ');
   DM.QrC.SQL.Add('from CardsLog (nolock) ');
   DM.QrC.SQL.Add('where numcard=:ncard4 and ');
   DM.QrC.SQL.Add('      date_chek>DateAdd(s,2,:dch)       ');
   DM.QrC.SQL.Add('');

   DM.QrC.SQL.Add('if (select Count(*) from Cards (nolock) where NumCard=:ncard)<=0');
   DM.QrC.SQL.Add(' insert into Cards(NumCard,Summa,TypeCard,AccumSum,SumMonth) ');
   DM.QrC.SQL.Add(' values(:ncard1,IsNull(@vSumma,0)+:summa,IsNull(@vTypeCard,:typecard),IsNull(@vAccumSum,0)+:accumsum,IsNull(@vSumMonth,0)+:summonth) ');
   DM.QrC.SQL.Add('else ');
   DM.QrC.SQL.Add(' update Cards set Summa=IsNull(@vSumma,0)+:summa1, TypeCard=IsNull(@vTypeCard,:typecard1), AccumSum=IsNull(@vAccumSum,0)+:accumsum1, SumMonth=IsNull(@vSumMonth,0)+:summonth1 ');
   DM.QrC.SQL.Add(' where NumCard=:ncard2 ');

   DM.QrC.SQL.Add('if @@error<>0 ');
   DM.QrC.SQL.Add(' begin');
   DM.QrC.SQL.Add('  ROLLBACK TRANSACTION');
   DM.QrC.SQL.Add('  raiserror(''Ошибка записи информации по карте'',16,1)');
   DM.QrC.SQL.Add(' end ');
   DM.QrC.SQL.Add(' delete from CardsNeedUpdate where NumCard=:ncard3');

   DM.QrC.SQL.Add('COMMIT TRANSACTION');

   DM.QrC.Parameters.ParamByName('ncard').Value:=N;
   DM.QrC.Parameters.ParamByName('ncard1').Value:=N;
   DM.QrC.Parameters.ParamByName('ncard2').Value:=N;
   DM.QrC.Parameters.ParamByName('ncard3').Value:=N;
   DM.QrC.Parameters.ParamByName('ncard4').Value:=N;
   DM.QrC.Parameters.ParamByName('ncard5').Value:=N;

   DM.QrC.Parameters.ParamByName('Summa').Value:=DM.QrX.FieldByName('Summa').AsCurrency;
   DM.QrC.Parameters.ParamByName('Summa1').Value:=DM.QrX.FieldByName('Summa').AsCurrency;

   DM.QrC.Parameters.ParamByName('TypeCard').Value:=DM.QrX.FieldByName('TypeCard').AsInteger;
   DM.QrC.Parameters.ParamByName('TypeCard1').Value:=DM.QrX.FieldByName('TypeCard').AsInteger;

   DM.QrC.Parameters.ParamByName('AccumSum').Value:=DM.QrX.FieldByName('AccumSum').AsCurrency;
   DM.QrC.Parameters.ParamByName('AccumSum1').Value:=DM.QrX.FieldByName('AccumSum').AsCurrency;

   DM.QrC.Parameters.ParamByName('SumMonth').Value:=DM.QrX.FieldByName('SumMonth').AsCurrency;
   DM.QrC.Parameters.ParamByName('SumMonth1').Value:=DM.QrX.FieldByName('SumMonth').AsCurrency;

   DM.QrC.Parameters.ParamByName('DCh').Value:=DM.QrX.FieldByName('Date_Chek').AsDateTime;

   DM.QrC.ExecSQL;

  except
   try
    DM.QrC.Close;
    DM.QrC.SQL.Clear;
    DM.QrC.SQL.Add('delete from CardsNeedUpdate where NumCard=:ncard');
    DM.QrC.SQL.Add('insert into CardsNeedUpdate(NumCard) values(:ncard1)');
    DM.QrC.Parameters.ParamByName('ncard').Value:=N;
    DM.QrC.Parameters.ParamByName('ncard1').Value:=N;
    DM.QrC.ExecSQL;
   except
   end;
  end;
 end;

procedure PlayMP3;
 begin
{  try
   if Assigned(MainF)=False then begin SetLength(qPlay,0); Exit; end;
   if High(qPlay)<0 then Exit;
//   if Not ((SameText(qPlay[0].FName,FName)) and (qPlay[0].Done=0)) then Exit;
   MainF.mpMain.Close;
   if Not FileExists(qPlay[0].FName) then
    begin
     qPlay[0].Done:=2;
     Exit;
    end;
   MainF.mpMain.FileName:=qPlay[0].FName;
   MainF.mpMain.Open;
   MainF.mpMain.Play;
   qPlay[0].Done:=1;
  except
  end;
}
 end;

procedure AddFileToQ(FName:String);
var CA:Integer;
 begin
  try
   CA:=High(qPlay)+1;
   SetLength(qPlay,CA+1);
   qPlay[CA].Done:=0;
   qPlay[CA].FName:=FName;
  except
  end;
 end;

procedure PlaySumm(Sum:Currency);
var S:String;
    P:Integer;
 begin
  if Sum>999.99 then Exit;
  S:=StringReplace(CurrToStrF(Sum,ffFixed,2),',','.',[rfReplaceAll]);
  P:=Pos('.',S);
  if P=2 then begin S:='0'+S; Inc(P); end;
  AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\'+Copy(S,1,P-1)+' грн.mp3');
  AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\'+Copy(S,P+1,2)+' коп.mp3');
 end;

procedure PlayFraz(P:Integer; Sum:Currency=0);
 begin
  Case P of
//   1:AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\У Вас есть дисконтная карта аптечной сети 911.mp3');
//   2:AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\Давайте оформить карты Она реально позволяет экономить.mp3');
 {  3:begin
      AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\У вас на карточке накоплено.mp3');
      PlaySumm(Sum);
      AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\Желаете их списать сейчас или будете накапливать дальше.mp3');
     end;
  }
//   4:AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\Вам пакет нужен.mp3');
 {  5:begin
      AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\Сумма вашей покупки.mp3');
      PlaySumm(Sum);
     end;
   6:begin
      AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\У вас на карточке накоплено.mp3');
      PlaySumm(Sum);
      AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\Желаете их списать сейчас или будете накапливать дальше.mp3');
     end;
   7:begin
      AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\Желаете сдачу в сумме.mp3');
      PlaySumm(Sum);
      AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\Зачислить на свою карточку.mp3');
      AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\Вы их сможете использовать в дальнейших покупках.mp3');
     end;
   8:begin
      AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\Пожалуйста ваш чек ваша сдача.mp3');
      PlaySumm(Sum);
      AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\и дисконтная карта.mp3');
     end;
   9:begin
      AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\Пожалуйста ваш чек ваша сдача.mp3');
      PlaySumm(Sum);
     end;
   10:begin
       AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\Пожалуйста Ваш чек и дисконтная карта.mp3');
      end;
   11:begin
       AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\Пожалуйста Ваш чек.mp3');
      end;
   12:begin
       AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\Будте здоровы.mp3');
      end;
  }
   13:begin
       AddFileToQ(WorkPath+'\'+Prm.PathMp3+'\С вашей карты произошло списание.mp3');
       PlaySumm(Sum);
      end;
  end
 end;

function GetValueSC(Qr:TADOQuery; Descr:String):String;
 begin
  Qr.Close;
  Qr.SQL.Text:='select Value from apteka_net..Spr_Const where Descr='''+Descr+'''';
  Qr.Open;
  Result:=Qr.FieldByName('Value').AsString;
 end;

{ TPlayMp3 }

procedure TPlayMp3.Execute;
 begin
  FreeOnTerminate:=True;
{
  try
   Repeat
    if MainF.mpMain.Mode=mpPlaying then Continue;
    MainF.mpMain.Close;
    if Not FileExists(FileName) then Break;
    MainF.mpMain.FileName:=FileName;
    MainF.mpMain.Open;
    MainF.mpMain.Play;
    Break;
   Until False;
  except
  end;
}
 end;

function GetUserSpicPassw:String;
 begin
  Result:=IntToStrF(Abs(11111111111111*StrToInt(Copy(FormatDateTime('dd',Date),2,1))-StrToInt64(IntToStrF(Prm.AptekaID,3)+IntToStrF(Prm.ID_Gamma,5)+FormatDateTime('ddmmyy',Date))),14);
 end;

procedure ShowTimerZ;
var tm1,tm2,tmZ,dt1,dt2,dtZ:TDateTime;
 begin

  if Prm.IsAutoZ=False then Exit;
  if Opt.IsAutoZ=False then Exit;

  if EKKA.UseEKKA=False then Exit;

  if EKKA.TypeEKKA<>EKKA_MARRY301MTM then Exit;

  tm1:=StrToTime('23:55:00');
  tm2:=StrToTime('00:03:00');
  tmZ:=StrToTime('23:57:00');

{
  tm1:=StrToTime('16:05:00');
  tm2:=StrToTime('18:03:00');
  tmZ:=StrToTime('16:07:00');
}

  if tm1<tm2 then
   begin
    dt1:=StrToDate(DateToStr(Date))+tm1;
    dt2:=StrToDate(DateToStr(Date))+tm2;
    dtZ:=StrToDate(DateToStr(Date))+tmZ;
   end else begin
             if StrToTime(TimeToStr((Now)))>tm1 then
              begin
               dt1:=StrToDate(DateToStr(Date))+tm1;
               dt2:=StrToDate(DateToStr(Date))+tm2+1;
               dtZ:=StrToDate(DateToStr(Date))+tmZ;
              end else begin
                        dt1:=StrToDate(DateToStr(Date))+tm1-1;
                        dt2:=StrToDate(DateToStr(Date))+tm2;
                        dtZ:=StrToDate(DateToStr(Date))+tmZ-1;
                       end;
            end;

  if Not ((Now>=dt1) and (Now<=dt2)) then Exit;

  AppendStringToFile('D:\AVA\ZRepLog.txt', DateTimeToStr(Now)+': Показ окна для автоматического снятия Z-отчетов');

  try
   TimerZF:=TTimerZF.Create(nil);
   try
    TimerZF.dt1:=dt1;
    TimerZF.dt2:=dt2;
    TimerZF.dtZ:=dtZ;

    TimerZF.ShowModal;
   finally
    TimerZF.Free;
   end;
  except
   on E:Exception do
    MainF.RegisterError('Автоматическое снятие Z-отчета. Открытие окна',E.Message,True);
  end;

 end;

procedure ShowSite(NameSite:String; P:Byte=0);
var url:String;
    Res:Integer;
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select Value from Spr_Const where Descr='''+NameSite+''' ';
   DM.Qr.Open;

   url:=DM.Qr.FieldByName('Value').AsString;

   if P=1 then
    begin
     DM.Qr.Close;
     DM.Qr.SQL.Text:='select Value from Spr_Const where Descr=''PathSite911'' ';
     DM.Qr.Open;

     if DM.Qr.IsEmpty then
      begin
       MainF.MessBox('Браузер не найден. Обращайтесь в IT-отдел!');
       Exit;
      end;

     Res:=ShellExecute(0,'open',PChar(DM.Qr.FieldByName('Value').AsString),PChar(url),nil,SW_SHOWNORMAL);
     if Res<32 then
      WinExec(PChar(DM.Qr.FieldByName('Value').AsString+' '+url),SW_SHOW);

     Exit;
    end;

   WebGeptralF:=TWebGeptralF.Create(nil);
   try

    WebGeptralF.Url:=DM.Qr.FieldByName('Value').AsString;
    Application.ProcessMessages;
    WebGeptralF.ShowModal;

   finally
    WebGeptralF.Free;
   end;

  except
  end;
 end;

procedure CorrLocalDate;
 begin
  if Not IsServer and (AnsiUpperCase(GetCompName)<>AnsiUpperCase('SERGEY')) then SetTime(DM.GetServerDate);
 end;

procedure ShowPiggyBank;
 begin
  PiggyBankF:=TPiggyBankF.Create(nil);
  try
   PiggyBankF.ShowModal;
  finally
   PiggyBankF.Free;
  end;
 end;

//function PrintCennikListExt(qrL:TADOQuery; Flag:Integer; IsUpak:Boolean; IsStiker:Boolean; IsVitrOnly:Boolean):Boolean;
function PrintCennikListExt(qrL:TADOQuery; Flag:Integer; IsUpak:Boolean; IsStiker:Boolean; IsVitrOnly:Boolean; const Param:integer=1):Boolean;
var i,j,k,Cnt,CntMax:Integer;
    B:Boolean;
 begin
  try

   B:=False;

   for i:=0 to qrL.FieldCount-1 do
    if AnsiUpperCase(qrL.Fields[i].FieldName)='KOL' then
     begin
      B:=True;
      Break;
     end;

   DM.QrExC.Close;
   DM.QrExC.SQL.Clear;
   DM.QrExC.SQL.Add('delete from TmpCennik where compname=host_name() and id_user='+IntToStr(Prm.UserID));
   for i:=1 to qrL.RecordCount do
    begin
     if i=1 then qrL.First else qrL.Next;

     if (IsVitrOnly) or (B=False) then Cnt:=1 else
      begin

       Cnt:=qrL.FieldByName('Kol').AsInteger;
       if IsStiker then CntMax:=100 else CntMax:=20;
       if Cnt>CntMax then Cnt:=CntMax;

      end;

     for k:=1 to Cnt do
      DM.QrExC.SQL.Add('insert into TmpCennik(order_,art_code,id_user,compname) values('+IntToStr(i)+','+qrL.FieldByName('art_code').AsString+','+IntToStr(Prm.UserID)+',host_name())');

    end;
{
   DM.QrExC.SQL.Add('insert into TmpCennik(order_,art_code,id_user,compname)');
   DM.QrExC.SQL.Add('select Max(order_),art_code,id_user,compname ');
   DM.QrExC.SQL.Add('from #spisc ');
   DM.QrExC.SQL.Add('group by art_code,id_user,compname ');

   DM.QrExC.SQL.Add('if Object_ID(''tempdb..#spisc'') is not null drop table #spisc ');
   DM.QrExC.SQL.Add('select top 0 * into #spisc from TmpCennik ');
}
//   DM.QrExC.SQL.Add('insert into TmpCennik(order_,art_code,id_user,compname) values('+IntToStr(i)+','+qrL.FieldByName('art_code').AsString+','+IntToStr(Prm.UserID)+',host_name())');
   DM.QrExC.SQL.Add('select 9999 as Res ');
   DM.QrExC.Open;

   PrintRep(1).Clear;
   PrintRep.SetDefault;

   for j:=1 downto 0 do
    begin
     DM.QrExC.Close;

     case param of
       1: DM.QrExC.SQL.Text:='exec spY_PrepareCennikList '+IntToStr(Prm.UserID)+','+IntToStr(BoolToInt(IsUpak))+','+IntToStr(BoolToInt(IsVitrOnly))+','+IntToStr(j);
       2: DM.QrExC.SQL.Text:='exec spY_PrepareCennikList_P '+IntToStr(Prm.UserID)+','+IntToStr(BoolToInt(IsUpak))+','+IntToStr(BoolToInt(IsVitrOnly))+','+IntToStr(j);
     end;
     DM.QrExC.Open;

     if DM.QrExC.IsEmpty then Continue;

     PrintRep.Qr:=DM.QrExC;

     if IsStiker then PrintRep.PrintStiker
                 else PrintRep.PrintCennikExt;

     if j=1 then PrintRep.AddText(#12);
    end;
   Result:=PrintRep.PreView;
  except
   on E:Exception do
    MainF.RegisterError('Ценники','Ошибка формирования списка ценников: '+E.Message,False);
  end;
 end;

procedure PrintCennikList(qrL:TADOQuery; Flag:Integer; FUserID:Integer; IsUpak:Boolean; IsStiker:Boolean; IsVitrOnly:Boolean);
var Cnt,i,k,j,SkdSrok:Integer;
    ss,ss1:String;
 begin
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('select (Case when b.f_nds<=2 then 1 else 2 end) as F_NDS       ');
   DM.QrEx.SQL.Add('from Inform..TMP_SPIS a, SprTov b');
   DM.QrEx.SQL.Add('where a.art_code=b.art_code and a.priznak='+IntToStr(Flag)+' and a.compname=host_name() and a.id_user='+IntToStr(FUserID));
   DM.QrEx.SQL.Add('group by (Case when b.f_nds<=2 then 1 else 2 end)              ');
   DM.QrEx.Open;
   PrintRep(1).Clear;
   PrintRep.SetDefault;
   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('declare @ean13 varchar(13), @SkdSrok numeric(8,2), @CenaP numeric(8,2), @CenaOpt numeric(8,2), @Cena numeric(8,2) ');
     DM.Qr.SQL.Add('set @SkdSrok=0');
     DM.Qr.SQL.Add('if Object_ID(N''tempdb..#cennik'') is not null drop table #cennik');
     DM.Qr.SQL.Add('select top 0 convert(int,1) as art_code,convert(varchar(200),'' '') as names,convert(numeric(8,2),1.01) as cena, convert(varchar(13),'' '') as EAN13, convert(numeric(8,2),0) SkdSrok, '+'convert(numeric(8,2),1.01) as cenap, convert(numeric(8,2),1.01) as cenaopt into #cennik');
     for j:=1 to qrL.RecordCount do
      begin
       if j=1 then qrL.First else qrL.Next;
       Cnt:=qrL.FieldByName('Kol').AsInteger;
       if Cnt>50 then Cnt:=50;
       for k:=1 to Cnt do
        begin

         DM.Qr.SQL.Add('set @ean13=IsNull((select Max(ean13) from SprEAN where art_code='+qrL.FieldByName('Art_Code').AsString+' ),'''')');
         if Flag=W_CENNIKSROK then
          DM.Qr.SQL.Add('set @SkdSrok=IsNull((select Max(skd) from AddSkd where art_code='+qrL.FieldByName('Art_Code').AsString+' and getdate() between DtStart and DtEnd ),0) ');
         DM.Qr.SQL.Add('set @CenaP=IsNull((select Max(cenap) from SprTovar where art_code='+qrL.FieldByName('Art_Code').AsString+'),0) ');

//         DM.Qr.SQL.Add('set @CenaOpt=IsNull((select Max(cenaopt) from SprTovar where art_code='+qrL.FieldByName('Art_Code').AsString+'),0) ');
         DM.Qr.SQL.Add('set @CenaOpt=dbo.GetCenaOpt('+qrL.FieldByName('Art_Code').AsString+') ');

         DM.Qr.SQL.Add('set @Cena=IsNull((select Max(cena) from SprTov (nolock) where ostat>0 and art_code='+qrL.FieldByName('Art_Code').AsString+'),(select Max(cena) from SprTov (nolock) where art_code='+qrL.FieldByName('Art_Code').AsString+')) ');

         DM.Qr.SQL.Add('Insert into #cennik(art_code,names,cena,ean13,SkdSrok,cenap,cenaopt)');
         DM.Qr.SQL.Add('Values('+qrL.FieldByName('Art_Code').AsString+',');
         DM.Qr.SQL.Add(''''+qrL.FieldByName('Names').AsString+''',');
         DM.Qr.SQL.Add(' @cena, @ean13, @SkdSrok, @cenap, @cenaopt) ');

        end;
      end;
     ss:=''; ss1:=' 1 as Koef, ';

     if IsUpak then
      begin
       ss:='*dbo.GetKoef(a.art_code) ';
       ss1:=' dbo.GetKoef(a.art_code) as koef, ';
      end;

     DM.Qr.SQL.Add('select a.art_code,a.names,a.cena'+ss+' as cena,'+ss1+' a.ean13,a.skdsrok,a.cenap'+ss+' as cenap,dbo.GetCenaOpt(a.art_code)'+ss+' as cenaopt,l.art_code as skd3, c.*,');

     if MainF.MaxSkd>0 then
      DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where type_skd=4 and art_code=a.art_code),IsNull((select Max(skd) from Skd where type_skd=1),0)) as Skd ') else

     if MainF.MaxSkd<=-3 then
      DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where skd<3 and type_skd=4 and art_code=a.art_code),'+IntToStr(Abs(Round(MainF.MaxSkd)))+') as Skd ')
     else DM.Qr.SQL.Add(' 0 as Skd ');

     DM.Qr.SQL.Add('from #cennik a left join SkdLimit0 l (nolock) on a.art_code=l.art_code left join Inform..SprReg c (nolock) on a.art_code=c.art_code  ');

     if IsVitrOnly=True then
      DM.Qr.SQL.Add('where (c.P2>0 or IsNull(c.L2,'''')<>'''') ');

     DM.Qr.SQL.Add('order by c.P1,c.P2,c.P3,a.names ');

//     DM.Qr.SQL.SaveToFile('C:\Cennik1.txt');

     DM.Qr.Open;

     PrintRep.Qr:=DM.Qr;
     if Flag=W_CENNIKSROK then SkdSrok:=1 else SkdSrok:=0;

     if IsStiker then PrintRep.PrintStiker
                 else PrintRep.PrintCennik(Prm.FirmNameUA,MainF.MaxSkd,DM.QrCen,Prm.AptekaID,MainF.PercForPrice,0,Prm.RealizMinus,SkdSrok);

     PrintRep.AddText(#12);
    end;
   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования списка ценников: '+E.Message);
  end;
 end;

End.





