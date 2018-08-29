UNIT Marry301U;

INTERFACE

Uses Windows, Dialogs, Messages, SysUtils, Classes, CPDrv, Util, IniFiles,Graphics;

Type

 TMarry301 = class (TCommPortDriver)

 private

  FLog:TStrings;
  FIsCRC:Integer;
  FResComm:String;
  FKassir:String;
  FUseEKKA:Boolean;
  FRnd:Char;
  FSumSales:Integer;
  FSumVoids:Integer;
  FLastNumCheck:Integer;
  FIsNewVersion:Boolean;

  procedure SetPortNum(const Value:Integer);
  procedure SetLog(const Value:TStrings);
  procedure SetKassir(Value:String);

  function GetCommName(S:String):String;
  function GetPortNum:Integer;

  function SendCommand(Comm:String; IsRet:Boolean):Boolean;

  function SplitRes(S,P:String; SL:TStrings):Boolean;
  function GetLastErrorDescr: String;
  function SendStringMy(S:String):Boolean;
  function ReadString(var S:String):Boolean;
  function SwapData(Comm: String): Boolean;
  function IntToArt(N:Integer):String;
  function GetCommParams(S:String):String;

 protected

  FArtFile:String;
  FRD_Item:TStringList;
  FVzhNum:Int64;
  FLastError:String;

  function GetReceiptNumber:Integer; virtual;

 public

  constructor Create(AOwner:TComponent); override;
  destructor Destroy; override;

  procedure ClearLog;                                        // Очистка лога
  procedure fpClosePort; virtual;                            // Закрыть СОМ порт

  function  fpSendCommand(var Comm:String):Boolean; virtual; // Выполнение произвольной команды, если были результаты, то они записываються в Comm

  function  fpGetNewArt:String; virtual;
  function  ErrorDescr(Code:String):String; virtual;                 // Строковое сообщение по коду ошибки

  { --- Установка связи с ЕККА --- }
  function  fpConnect:Boolean; virtual;                      // Установка связи с ЕККА

  { --- Настройка рабочей среды ---}
  function  fpSetTime(T:TDateTime):Boolean; virtual;         // Установка времени EKKA
  function  fpLoadLogo(Logo:String; Active:Boolean):Boolean;  overload; virtual; // Загрузка графического образа-логотипа из файла
  function  fpLoadLogo(Logo:TBitMap; Active:Boolean):Boolean; overload; virtual; // Загрузка графического образа-логотипа из BitMap
  function  fpActiveLogo(P:Byte):Boolean; virtual;              // Активизация печати графического образа (0 не печатать, 1 - печатать)
  function  fpCutBeep(C,B,N:Byte):Boolean; overload; virtual;   // Управление работой обрезчика чековой ленты и звуковым сигналом
  function  fpCutBeep(C,B:Byte):Boolean; overload; virtual;     // Управление работой обрезчика чековой ленты и звуковым сигналом
  function  fpSetHead(S:String):Boolean; virtual;               // Установка заголовочной строки

  { --- Управление исполнительными устройствами --- }
  function  fpOpenCashBox:Boolean; virtual;          // Открытие денежного ящика

  { --- Программирование фискальных данных --- }

  { --- Реализация и возврат товаров и услуг --- }
  function  fpOpenFiscalReceipt(Param:Byte=1):Boolean; virtual; // Открытие нового Чека
  function  fpAddSale(Name:String;                              // Регистрация продажи одной позиции
                      Kol:Integer;
                      Cena:Currency;
                      Divis:Byte;
                      Artic:Integer;
                      Nalog:Byte;
                      DiscSum:Currency;
                      DiscDescr:String
                     ):Boolean;  virtual;
  function  fpSetBackReceipt(S:String):Boolean;  virtual;      // Определение номера возвратного чека
  function  fpAddBack(Name:String;                             // Регистрация позиции возврата
                      Kol:Integer;
                      Cena:Currency;
                      Divis:Byte;
                      Nalog:Byte;
                      DiscSum:Currency;
                      DiscDescr:String
                     ):Boolean; virtual;
  function  fpServiceText(TextPos:Integer;                     // Регистрация служебной строки в чеке
                          Print2:Integer;
                          FontHeight:Integer;
                          S:String
                         ):Boolean;  virtual;
  function  fpCloseFiscalReceipt(TakedSumm:Currency;           // Закрытие чека
                                 TypeOplat:Integer;
                                 SumCheck:Currency=0
                                ):Boolean; virtual;
  function  fpCancelFiscalReceipt:Boolean; virtual;            // Отмена чека
  function  fpCheckCopy:Boolean; virtual;                      // Печать копии чека

  { --- Служебное внесение/изьятие денежных средств --- }
  function  fpCashInput(C:Currency):Boolean; virtual;         // Внесение денежных средств
  function  fpCashOutput(C:Currency):Boolean; virtual;        // Изьятие денежных средств

  { --- Получение консолидированной информации о состоянии ЕККА --- }
  function  fpGetStatus:Boolean; virtual;                    // Получение внутреннего состояния EKKA
  function  fpCashState(P:Integer):Boolean; virtual;         // Запрос информации о движении средств по кассе (0 - по текущей смене, 1 - по прошлой)
  function  fpFiscState:Boolean; virtual;                    // Запрос текущего состояния дневных фискальных регистров

  { --- Фискальные отчеты --- }
  function  fpXRep:Boolean; virtual;                         // X-отчет
  function  fpZRep:Boolean; virtual;                         // Z-отчет
  function  fpPerFullRepD(D1,D2:TDateTime):Boolean; virtual; // Полный периодический отчет по датам
  function  fpPerShortRepD(D1,D2:TDateTime):Boolean; virtual;// Сокращенный периодический отчет по датам
  function  fpPerFullRepN(N1,N2:Integer):Boolean; virtual;   // Полный периодический отчет по номерам Z-отчетов
  function  fpPerShortRepN(N1,N2:Integer):Boolean; virtual;  // Сокращенный периодический отчет по датам Z-отчетов

  { --- Аналитичесике и служебные отчеты --- }
  function  fpZeroCheck:Boolean; virtual;                     // Нулевой чек

  { --- Произвольные служебные документы ВУ --- }

  { --- Базовые настройки и установка параметров сервисной организации --- }
  function fpServPassw(P1:String; P2:String=''):Boolean; virtual; // Ввод пароля сервисной организации (заводская установка - 2222222222)
  function fpPrintLimit(P:Integer):Boolean; virtual;              // Ввод количества строк, после которого ЭККА блокируется
  function fpDayLimit(D:Integer):Boolean; virtual;                // Ввод количества дней, после которого ЭККА блокируется
  function fpGetLimitStatus:Boolean; virtual;                    // Запрос лимитированного остатка дней работы и строк печати
  function fpResetUsPassw:Boolean; virtual;                      // Сброс пароля пользователя в заводской - '1111111111'

  { --- Дополнительные функции ---}
  function  KeyPosition(Key:Byte):Boolean; virtual;          // Проверка положение ключа

  { --- Описание свойcтв --- }
  property  Log:TStrings read FLog write SetLog;     // Лог команд (нужен для организации окна терминала)
  property  IsCRC:Integer read FIsCRC write FIsCRC;  // Признак использования контрольной суммы при передаче команд
  property  UseEKKA:Boolean read FUseEKKA write FUseEKKA;     // Флаг активности EKKA
  property  Kassir:String read FKassir write SetKassir;       // Имя кассира для регистрации
  property  PortNum:Integer read GetPortNum write SetPortNum; // Устанавливаем номер Сом порта
  property  LastError:String read FLastError;                 // Последняя ошибка которую возвращает аппарат
  property  LastErrorDescr:String read GetLastErrorDescr;     // Описание последней ошибки которую возвращает аппарат
  property  RD_Item:TStringList read FRD_Item;                // Массив свойств, обновляется после выполнения команд fpGeStatus,
  property  ReceiptNumber:Integer read GetReceiptNumber;      // Номер последнего успешно завершенного чека
  property  Rnd:Char read FRnd write FRnd;                    // Признак округления
  property  IsNewVersion:Boolean read FIsNewVersion write FIsNewVersion; // Признак версии ЕККА (True - T7, False - T3,T4)
  property  VzhNum:Int64 read FVzhNum;                       // Заводской номер кассового аппарата

 end;

const C_UNSAFE=0;  // Работа без контрольной суммы
      C_CRC=1;     // Работа с контрольной суммой
      TIME_OUT=6;  // Время ожидания результатов команды в секундах

      // Положение ключа
      KEY_O=0; // Отключен
      KEY_W=1; // Работа
      KEY_X=2; // X-отчет
      KEY_Z=4; // Z-отчет
      KEY_P=8; // Программирование

      RND_MATH='0'; // По правилам окгругления
      RND_MAX ='1'; // До ближайшего большего
      RND_MIN ='2'; // До ближайшего меньшего

Function Marry301:TMarry301;

IMPLEMENTATION

Var FMarry301:TMarry301=nil;
    Arr:Array of Integer;

Function Marry301:TMarry301;
 begin
  if FMarry301=nil then FMarry301:=TMarry301.Create(nil);
  Result:=FMarry301;
 end;

constructor TMarry301.Create(AOwner:TComponent);
 begin
  inherited Create(AOwner);
  FRD_Item:=TStringList.Create;
  FLog:=nil;
  FBaudRate:=br115200;
  FBaudRateValue:=115200;
  FParity:=ptEVEN;
  FPort:=pnCOM1;
  FPortName:='\\.\COM1';
  FStopBits:=sb2BITS;
  FInputTimeOut:=50;
  FOutPutTimeOut:=1000;
  FPollingDelay:=100;

  FLastError:='';
  FIsCRC:=C_UNSAFE;
  FIsNewVersion:=True;
  Kassir:='';
  FUseEKKA:=True;
  FArtFile:=PrPath+'\$Marry301$.txt';
  FRnd:=RND_MATH;
  FSumSales:=0;
  FSumVoids:=0;
  FVzhNum:=0;
 end;

destructor TMarry301.Destroy;
 begin
  FRD_Item.Free;
  inherited Destroy;
 end;

//function TMarry301.CustomConnect(Ksr:String):Integer;
function TMarry301.fpConnect:Boolean;
var i:Integer;
    S:String;
    B:Boolean;
 begin
  if Not (FUseEKKA) then begin Result:=True; Exit; end;
  try
   if inherited Connect=false then AbortS('ERP_9998');
   B:=False;
   for i:=1 to 5 do
    begin
     SendChar('U');
     Delay(0.2);
     SendChar('U');
     if ReadString(S) then
      if Pos('READY',S)<>0 then
       begin
        SwapData('UPAS1111111111'+'01');
        if FLastError='SOFTUPAS' then AbortS(FLastError);
        SwapData('CONF');
        if Length(Copy(FResComm,1,10))<>10 then AbortS(FLastError) else
         begin
          try
           FVzhNum:=StrToInt64(Copy(FResComm,1,10));
          except
           AbortS('ERP_9993');
          end;
          B:=True;
          Break;
         end;
       end;
    end;
   if Not (B) then AbortS('ERP_9993');
   Result:=True;
  except
   on E:Exception do
    begin
     Result:=False;
     Disconnect;
     if FLastError='' then FLastError:=E.Message;
     if FLastError='' then FLastError:='ERP_9999';
    end;
  end;
 end;

function TMarry301.ReadString(var S:String):Boolean;
var i:Integer;
    B:Boolean;
    Ch:Byte;
 begin
  B:=False;
  S:='';
  Ch:=0;
  ReadByte(Ch);
  if Ch=253 then
   begin
    S:=S+OemToChar(Ch);
    for i:=0 to 255 do
     begin
      if ReadByte(Ch) then S:=S+OemToChar(Ch);
      if Ch=254 then begin B:=True; Break; end;
     end;
   end;
  if Not B then S:='ERROR';
  Result:=B;
 end;

function TMarry301.SwapData(Comm:String):Boolean;
var T:TDateTime;
    Res,ss1,RS:String;
 begin
  Result:=False;
  FLastError:='';
  FResComm:='';
  if SendStringMy(Comm)=False then begin FLastError:='ERP_9993'; Exit; end;
  T:=Time;
  Repeat
   if ReadString(RS) then
    begin
     Res:=GetCommName(RS);
     if Not ((Res='WAIT') or (Res='READY') or (Res='DONE') or (Res='PRN') or (Res='WRK')) then
      if FLog<>nil then FLog.Add(Res);
     ss1:=Copy(Res,1,4);
     if (ss1='SOFT') or (ss1='HARD') or (ss1='MEM_') or (ss1='RTC_') or (ss1='ERRO') then FLastError:=Res else
     if ss1=Copy(Comm,1,4) then FResComm:=Copy(Res,5,Length(Res)-4) else
     if Res='DONE' then Result:=True else
     if Res='READY' then Break;
     T:=Time;
    end;
   if Abs(Time-T)*100000>=TIME_OUT then begin FLastError:='ERP_9993'; Break; end;
  Until False;
 end;

function TMarry301.SendCommand(Comm:String; IsRet:Boolean):Boolean;
var Rc,Lr:String;

 function ReConnect:Boolean;
  begin
   Result:=False;
   if FLastError<>'ERP_9993' then Exit;
   Result:=True;
   try
    if SwapData('GGG') then Exit;
    fpClosePort;
    if Not fpConnect then Abort;
   except
    FLastError:='ERP_9993';
    Result:=False;
   end;
  end;

 Begin
  if Not (FUseEKKA) then begin Result:=True; Exit; end;
  Result:=True;
  try
   SwapData('SYNC123');
   if FResComm<>'123' then
    if Not ReConnect then Abort;
   if Not SwapData(Comm) then
    begin
     Lr:=FLastError;
     Rc:=FResComm;
     try
      if Not ReConnect then Abort;
      SwapData('CONF');
      if Copy(FResComm,103,4)<>Copy(Comm,1,4) then Abort else Exit;
     finally
      FLastError:=Lr;
      FResComm:=Rc;
     end;
    end else Exit;
   if FLastError<>'' then AbortS(FLastError);
   if (IsRet) and (FResComm='') then AbortS('ERP_9995');
  except
   on E:Exception do
    begin
     Result:=False;
     if FLastError='' then FLastError:=E.Message;
     if FLastError='' then FLastError:='ERP_9999';
    end;
  end;
 End;

function TMarry301.ErrorDescr(Code:String):String;
 begin
  { --- Ошибки программного уровня --- }
  if Code='ERP_9988' then Result:='Ошибка загрузки графического образа!' else
  if Code='ERP_9989' then Result:='Ошибка снятия Z-отчета!' else
  if Code='ERP_9990' then Result:='Ошибка открытия Чека!' else
  if Code='ERP_9991' then Result:='Ошибка пробивки чека!' else
  if Code='ERP_9992' then Result:='Неправильные параметры команды!' else
  if Code='ERP_9993' then Result:='Нет ответа от регистратора!' else
  if Code='ERP_9994' then Result:='При выполнении команды, аппарат вернул сообщение об ошибке!' else
  if Code='ERP_9995' then Result:='Ошибка результата выполнения команды!' else
  if Code='ERP_9996' then Result:='Нет ответа от регистратора!' else
  if Code='ERP_9997' then Result:='Ошибка отсылки команды!' else
  if Code='ERP_9998' then Result:='Не выполнилось подключение к порту!' else
  if Code='ERP_9999' then Result:='Неизвестная ошибка!' else

  { --- Ошибки аппаратного уровня --- }
  if Code='HARDPAPER'	 then Result:='Отсутствует чековая или/и контрольная лента' else
  if Code='HARDSENSOR' then Result:='Недопустимый температурный режим печатающей головки.' else
  if Code='HARDPOINT'	 then Result:='Отсутствует напряжение питания нагревательных элементов печатающей головки.' else
  if Code='HARDTXD'		 then Result:='Ошибки канала связи: контроль по четности' else
  if Code='HARDTIMER'	 then Result:='Ошибки обработки данных системных часов реального времени (сопровождает сообщение ''SHUTDOWN'')' else
  if Code='HARDMEMORY' then Result:='Ошибки контроля данных в фискальной памяти (сопровождает сообщение ''SHUTDOWN'')' else
  if Code='HARDLCD'		 then Result:='Неисправность встроенного дисплея покупателя' else
  if Code='HARDUCCLOW' then Result:='Низкое напряжение питания (сопровождает сообщение ''SHUTDOWN'')' else
  if Code='HARDCUTTER' then Result:='Неисправность обрезчика чековой ленты' else
  if Code='HARDBADHSET'then Result:='Применяемая команда управления периферийным оборудованием не соответствует настройкам этого оборудования.' else
  if Code='HARDEXTDISP'then Result:='Неисправность выносного дисплея покупателя - устройство отключено (неисправность коммуникационного кабеля, нет питания).' else
  if Code='SHUTDOWN'	 then Result:='ЭККР блокирован по техническим причинам: неисправность часов реального времени, ошибки при работе с фискальной памятью или падение напряжения питания ниже допустимого предела.' else

  { --- Ошибки логического уровня --- }
  if Code='SOFTBLOCK'	 then Result:='Превышена допустимая длина команды (SOFTBLOCK)' else
  if Code='SOFTNREP'	 then Result:='Для дальнейшей работы необходимо снять Z-отчет (SOFTNREP)'else
  if Code='SOFTSYSLOCK'then Result:='Неправильное положение системного ключа (SOFTSYSLOCK)' else
  if Code='SOFTCOMMAN' then Result:='Недопустимая команда (SOFTCOMMAN)' else
  if Code='SOFTPROTOC' then Result:='Неверная последовательность команд или необходимо снять Z-отчет либо завершить раннее открытый документ (SOFTPROTOC)' else
  if Code='SOFTZREPOR' then Result:='Z-отчет не сформирован из-за ошибок или аварии (SOFTZREPOR)' else
  if Code='SOFTFMFULL' then Result:='Переполнение фискальной памяти (SOFTFMFULL)' else
  if Code='SOFTPARAM'	 then Result:='Тип, количество или значение параметров команды неверно (SOFTPARAM)' else
  if Code='SOFTUPAS'	 then Result:='Требуется парольный вход и регистрация кассира либо сервиса (SOFTUPAS)' else
  if Code='SOFTCHECK'	 then Result:='Не выполнены соотношения между параметрами команды или их значения не равны расчетным (SOFTCHECK)' else
  if Code='SOFTSLWORK' then Result:='Переведите ключ в положение "РАБОТА "(Р)' else
  if Code='SOFTSLPROG' then Result:='Переведите ключ в положение "ПРОГРАММИРОВАНИЕ" (П)' else
  if Code='SOFTSLZREP' then Result:='Переведите ключ в положение "X-ОТЧЕТ" (Х)' else
  if Code='SOFTSLNREP' then Result:='Переведите ключ в положение "Z-ОТЧЕТ" (Z)' else
  if Code='SOFTREPL'	 then Result:='Программируемое значение уже есть в ФП (SOFTREPL)' else
  if Code='SOFTREGIST' then Result:='В ФП отсутствует регистрационная информация (SOFTREGIST)' else
  if Code='SOFTOVER' 	 then Result:='Переполнение учетных регистров или превышено максимальное количество загружаемых строк (SOFTOVER)' else
  if Code='SOFTNEED'   then Result:='Недопустимый отрицательный результат операции вычитания при корректировке исходящего остатка средств в кассе (SOFTNEED)' else
  if Code='SOFT24HOUR' then Result:='Работа продолжается более 24-х часов. Необходимо снять Z-отчет' else
  if Code='SOFTDIFART' then Result:='Обнаружено изменение наименования или схем налогообложения или признака делимости. Необходимо снять Z-отчет (SOFTDIFART)' else
  if Code='SOFTBADART' then Result:='Номер артикула выходит за границы диапазона (SOFTBADART)' else
  if Code='SOFTCOPY'   then Result:='Переполнение буфера копирования. В чеке более 300 строк (SOFTCOPY)' else
  if Code='SOFTOVART'	 then Result:='Превышено максимальное количество позций в чеке - более 720 (SOFTOVART)' else
  if Code='SOFTBADDISC'then Result:='Сума скидки больше суммы оборота по соответствующей фискаль-ной позиции (SOFTBADDISC)' else
  if Code='SOFTBADCS'	 then Result:='Несоответствие контрольных сумм (SOFTBADCS)' else
  if Code='SOFTARTMODE'then Result:='Используется неверная артикульная таблица (SOFTARTMODE)' else
  if Code='SOFTPAPER'  then Result:='Заканчивается чековая леннта в кассовом аппарате' else
  if Code='SOFTTXTOUT' then Result:='Превышено время ожидания приема команды - более 2-х секунд (SOFTTXTOUT)' else

  { --- Сообщение ЕККР при блокировке  --- }
  if Code='MEM_ERROR_CODE_01'	then Result:='Ошибки записи в ФП: данные не могут быть записаны' else
  if Code='MEM_ERROR_CODE_02'	then Result:='Ошибки записи в ФП: контроль чтением после записи не прошел' else
  if Code='MEM_ERROR_CODE_05'	then Result:='Отсутствует или искажен заводской номер, записанный в ФП' else
  if Code='MEM_ERROR_CODE_06'	then Result:='Отсутствует запись о валюте учета' else
  if Code='MEM_ERROR_CODE_07'	then Result:='Номер последнего Z-отчета, записанного в ФП, больше номера текущего Z-отчета' else
  if Code='MEM_ERROR_CODE_08'	then Result:='Номер текущего Z-отчета более чем на единицу отличает-ся от номера последнего Z-отчета, записанного в ФП' else
  if Code='MEM_ERROR_CODE_10'	then Result:='Неверное физическое размещение записи о Z-отчете' else
  if Code='MEM_ERROR_CODE_11'	then Result:='Неверное физическое размещение записи о налоге' else
  if Code='MEM_ERROR_CODE_12'	then Result:='Неверное физическое размещение записи о регистрации' else
  if Code='MEM_ERROR_CODE_13'	then Result:='Неверное физическое размещение записи о валюте учета' else
  if Code='MEM_ERROR_CODE_14'	then Result:='Нарушена последовательность номеров Z-отчетов при фор-мировании отчета за период' else
  if Code='MEM_ERROR_CODE_19'	then Result:='Превышено допустимое количество обнуления  оперативной памяти (после ремонтов ЭККР в сервисном центре)' else
  if Code='MEM_ERROR_CODE_20'	then Result:='Неверное физическое размещение записи об обнулении оперативной памяти' else
  if Code='MEM_ERROR_CODE_21'	then Result:='Искажение данных фискальной памяти в области записей о регистрации' else
  if Code='MEM_ERROR_CODE_22'	then Result:='Искажение данных фискальной памяти в области записей о налогах' else
  if Code='MEM_ERROR_CODE_23'	then Result:='Искажение данных фискальной памяти в области записей о валюте учета' else
  if Code='MEM_ERROR_CODE_25'	then Result:='Искажение данных фискальной памяти в области записей о дневных фискальных отчетах' else
  if Code='MEM_ERROR_CODE_27'	then Result:='Искажение дневных фискальных данных в ОП' else
  if Code='MEM_ERROR_CODE_28'	then Result:='Отсутствуют идентификационные данные в ФП' else

  { --- 	Контроль данных часов реального времени  --- }
  if Code='RTC_ERROR_CODE_01'	then Result:='Системные часы реального времени остановлены' else
  if Code='RTC_ERROR_CODE_02'	then Result:='Дата последнего Z-отчета, записанного в ФП, больше текущей даты в системных часах реального времени' else
  if Code='RTC_ERROR_CODE_03'	then Result:='Неверное время в системных часах реального времени' else
  if Code='RTC_ERROR_CODE_04'	then Result:='Неверная дата в системных часах реального времени' else
  if Code='RTC_ERROR_CODE_05'	then Result:='Неисправность микросхемы часов реального времени или канала связи процессор-часы'
                              else Result:=Code;
 end;

function TMarry301.GetCommName(S:String):String;
var i,q:Integer;
    B:Boolean;
 begin
  try
   if S='' then raise EAbort.Create('');
   B:=False; q:=0;
   for i:=Length(S) downto 1 do
    if S[i]=Chr(254) then begin q:=i; B:=True; Break; end;
   if Not (B) then EAbort.Create('');
   Result:=Copy(S,2,Ord(S[q-1])-1);
  except
   Result:='';
  end;
 end;

procedure TMarry301.ClearLog;
 begin
  if FLog<>nil then FLog.Clear;
 end;

function TMarry301.GetPortNum:Integer;
 begin
  try
   Result:=StrToInt(Copy(PortName,8,1));
  except
   Result:=0;
  end;
 end;

procedure TMarry301.SetPortNum(const Value:Integer);
 begin
  PortName:='\\.\COM'+IntToStr(Value);
 end;

procedure TMarry301.SetLog(const Value: TStrings);
 begin
  FLog:=Value;
 end;

procedure TMarry301.fpClosePort;
 begin
  Disconnect;
 end;

function TMarry301.fpGetStatus:Boolean;
 begin
  if Not (FUseEKKA) then begin Result:=True; Exit; end;
  SendCommand('CONF',True);
  Result:=SplitRes(FResComm,'10,10,36,8,6,1,1,1,4,1,12,12,4,4,8,18,8,1,3',FRD_Item);
 end;

function TMarry301.fpCashState(P:Integer):Boolean;
 begin
  if Not (FUseEKKA) then begin Result:=True; Exit; end;
  Result:=SendCommand('CCAS'+IntToStr(P),True);
  if Not Result then Exit;
  Result:=SplitRes(FResComm,'11,11,11,11,11,11,11,11',FRD_Item);
 end;

function TMarry301.fpSendCommand(var Comm:String):Boolean;
 begin
  if Not (FUseEKKA) then begin Result:=True; Exit; end;
  Result:=SendCommand(Comm,True);
  SplitRes(FResComm,GetCommParams(Copy(Comm,1,4)+FResComm),FRD_Item);
  Comm:=FResComm;
  if FLastError='ERP_9995' then begin FLastError:=''; Result:=True; end;
 end;

function TMarry301.SendStringMy(S:String):Boolean;
var i:Integer;
 begin
  try
   if Not (SendByte(253)) then Abort;
   if S<>'CON' then
    begin
     for i:=1 to Length(S) do  if Not (SendByte(CharToOem(S[i]))) then Abort;
     if Not (SendByte(Length(S)+1)) then Abort;
    end else begin
              if Not (SendByte(253)) then Abort;
              for i:=1 to 3 do if Not (SendByte(254)) then Abort;
             end;
   if Not (SendByte(254)) then Abort;
   Result:=True;
  except
   Result:=False;
  end;
 end;

function TMarry301.fpXRep:Boolean;
 begin
  Result:=SendCommand('ZREP',False);
 end;

function TMarry301.fpZRep:Boolean;
 begin
  if Not (FUseEKKA) then begin Result:=True; Exit; end;
  Result:=SendCommand('NREP',False);
  if Result then
   if fpGetStatus then
    if Ord(RD_Item[9][1])=1 then
     begin
      DeleteFile(FArtFile);
      Result:=True;
     end else begin
               FLastError:='ERP_9989';
               Result:=False;
              end; 
 end;

function TMarry301.fpZeroCheck:Boolean;
 begin
  Result:=SendCommand('NULL',False);
 end;

function TMarry301.SplitRes(S,P:String; SL:TStrings):Boolean;
var A:TIntArray;
    i:Integer;
    ss:String;
 begin
  if Not (FUseEKKA) then begin Result:=True; Exit; end;
  try
   GetIntArray(P,A,[',']);
   SL.Text:='';
   for i:=Low(A) to High(A) do
    begin
     ss:=Copy(S,1,A[i]);
     if Length(ss)<>A[i] then Abort;
     SL.Add(ss);
     Delete(S,1,A[i]);
    end;
   Result:=True;
  except
   SL.Text:='';
   Result:=False;
   FLastError:='ERP_9995';
  end;
 end;

function TMarry301.fpPerFullRepD(D1,D2:TDateTime):Boolean;
 begin
  Result:=SendCommand('FIRP'+FormatDateTime('yyyymmdd',D1)+FormatDateTime('yyyymmdd',D2),False);
 end;

function TMarry301.fpPerFullRepN(N1,N2:Integer):Boolean;
 begin
  Result:=SendCommand('FIRN'+IntToStrF(N1,4)+IntToStrF(N2,4),False);
 end;

function TMarry301.fpPerShortRepD(D1,D2:TDateTime):Boolean;
 begin
  Result:=SendCommand('IREP'+FormatDateTime('yyyymmdd',D1)+FormatDateTime('yyyymmdd',D2),False);
 end;

function TMarry301.fpPerShortRepN(N1,N2:Integer):Boolean;
 begin
  Result:=SendCommand('IREN'+IntToStrF(N1,4)+IntToStrF(N2,4),False);
 end;

procedure TMarry301.SetKassir(Value:String);
 begin
  if Value='' then Value:='KASSIR';
  FKassir:=Value;
 end;

function TMarry301.GetReceiptNumber:Integer;
var S:String;
 begin
  try
   if Not UseEKKA then Abort;
   if Not SendCommand('CONf',True) then Abort;
   S:=Copy(FResComm,91,12);
   if Length(S)<>12 then Abort;
   Result:=StrToInt(S);
  except
   Result:=-1;
  end;
 end;

function TMarry301.fpOpenFiscalReceipt(Param:Byte=1):Boolean;
 begin
  if Not (FUseEKKA) then begin Result:=True; Exit; end;
  try
   FSumSales:=0;
   FSumVoids:=0;
   Result:=fpCancelFiscalReceipt;
   if Not Result then Exit;
   FLastNumCheck:=GetReceiptNumber;
   if FLastNumCheck=-1 then Abort;
   Result:=SendCommand('PREP1',False);
  except
   FLastError:='ERP_9990';
   Result:=False;
  end;
 end;

function TMarry301.GetLastErrorDescr:String;
 begin
  Result:=ErrorDescr(FLastError);
 end;

function TMarry301.fpCashInput(C:Currency):Boolean;
 begin
  Result:=SendCommand('CAIOI'+CurrToStr2(C,10),False);
 end;

function TMarry301.fpCashOutput(C:Currency):Boolean;
 begin
  Result:=SendCommand('CAIOO'+CurrToStr2(C,10),False);
 end;

function TMarry301.fpSetTime(T:TDateTime):Boolean;
 begin
  Result:=SendCommand('CTIM'+FormatDateTime('hhnnss',T),False);
 end;

function TMarry301.IntToArt(N:Integer):String;
 begin
  if (N<10000) or (N>20688) then Result:=IntToStrF(N,4)
                            else Result:=Chr(StrToInt(Copy(IntToStr(N),1,2))+55)+IntToStrF(N,3);
 end;

function TMarry301.fpGetNewArt:String;
var IniF:TIniFile;
    Num:Integer;
 Begin
  try
   if Not (FUseEKKA) then Abort;
   IniF:=TIniFile.Create(FArtFile);
   try
    Num:=IniF.ReadInteger('EKKA','Articul',4)+1;
    Result:=IntToArt(Num);
    IniF.WriteInteger('EKKA','Articul',Num);
   finally
    IniF.Free;
   end;
  except
   Result:=IntToArt(0);
  end;
 End;

function TMarry301.fpAddSale(Name:String;
                             Kol:Integer;
                             Cena:Currency;
                             Divis:Byte;
                             Artic:Integer;
                             Nalog:Byte;
                             DiscSum:Currency;
                             DiscDescr:String
                            ):Boolean;

var S,Nm,Nm1,Sh:String;
    Pl:Char;
    SS,DS:String;
    K:Integer;
    Com,Art:String;
 begin
  if Not (FUseEKKA) then begin Result:=True; Exit; end;
  try
   Nm:=CopyStrF(Name,12);
   Nm1:=Copy(Name,13,31);
   SS:=CurrToStr2(Kol*Cena,9);
   if DiscSum<0 then Pl:='-' else
   if DiscSum>0 then Pl:='+' else Pl:='0';
   K:=StrToInt(Pl+'1')*1;
   DS:=CurrToStr2(Abs(DiscSum),9);
   if Artic=0 then Art:=fpGetNewArt else
   if Artic=99999 then Art:='1111'
                  else Art:=IntToArt(Artic);

   if Artic=99999 then
    begin
     Com:='BFIS';
     FSumVoids:=FSumVoids+StrToInt(SS)+K*StrToInt(DS)
    end else begin
              Com:='FISC';
              FSumSales:=FSumSales+StrToInt(SS)+K*StrToInt(DS);
             end;
   Case Nalog of
    1:Sh:='А02000'+'000000';
    2:Sh:='000000'+'Б00000' else Abort;
   end;
   if Not (Divis in [0,1]) then Abort;
   Sh:=Sh+'000000'+'000000'+'000000'+'000000'+'000000'+'000000';
   S:=Com+
      Nm+
      SS+
      CurrToStr2(Cena,9)+
      IntToStrF(Kol,5)+
      IntToStrF(Divis,1)+
      Rnd+
      Sh+
      Art+
      Pl+
      CopyStrF(DiscDescr,13)+
      DS+
      Nm1;
    Result:=SendCommand(S,False);
  except
   Result:=False;
   FLastError:='ERP_9992';
  end;
 end;

function TMarry301.fpAddBack(Name:String;
                             Kol:Integer;
                             Cena:Currency;
                             Divis:Byte;
                             Nalog:Byte;
                             DiscSum:Currency;
                             DiscDescr:String
                            ):Boolean;
 begin
  Result:=fpAddSale(Name,Kol,Cena,Divis,99999,Nalog,DiscSum,DiscDescr);
 end;

function TMarry301.fpCancelFiscalReceipt:Boolean;
 begin
  if Not (FUseEKKA) then begin Result:=True; Exit; end;
  Result:=SendCommand('CANC',False);
  if Not Result then Exit;
  Result:=fpGetStatus;
  if Not Result then Exit;
  if Ord(RD_Item[6][1])<>3 then Result:=False;
 end;

function TMarry301.fpCloseFiscalReceipt(TakedSumm:Currency; TypeOplat:Integer; SumCheck:Currency=0):Boolean;
var S:String;
    TOpl,Sm:String;
    T:TDateTime;
    B:Boolean;
 begin
  Result:=True;
  if Not (FUseEKKA) then Exit;
  Result:=False;
  try
   if Round(TakedSumm*100)<FSumSales then TakedSumm:=FSumSales/100;
   if TypeOplat=4 then
    begin
     if FSumVoids>0 then Sm:=CurrToStr2(0,10) else Sm:=CurrToStr2(TakedSumm,10);
    end else Sm:=IntToStrF(Abs(FSumSales-FSumVoids),10);
   Case TypeOplat of
    1:TOpl:=Sm+'0000000000'+'0000000000'+'0000000000';
    2:TOpl:='0000000000'+Sm+'0000000000'+'0000000000';
    3:TOpl:='0000000000'+'0000000000'+Sm+'0000000000';
    4:TOpl:='0000000000'+'0000000000'+'0000000000'+Sm else AbortS('ERT_9992');
   end;
   if (LastError<>'') then Abort;
   S:='COMP'+
      IntToStrF(FSumSales,10)+
      IntToStrF(FSumVoids,10)+
      TOpl;
   fpServiceText(1,1,0,'Касир: '+Kassir);
   if Not (SendCommand(S,False)) then
    begin
     T:=Time;
     B:=False;
     Repeat
      if fpGetStatus then
       if Ord(RD_Item[6][1])=3 then begin B:=True; Break; end;
      if Abs(Time-T)*100000>=2 then Abort;
     Until False;
     if Not B then AbortS('ERP_9991');
     if GetReceiptNumber-FLastNumCheck=1 then Result:=True else AbortS('ERP_9991');
    end else Result:=True;
    SendCommand('CANC',False);
  except
   on E:Exception do
    begin
     Result:=False;
     T:=Time;
     Repeat
      SendCommand('CANC',False);
      if fpGetStatus then
       if Ord(RD_Item[6][1])=3 then Break;
      if Abs(Time-T)*100000>=2 then Break;
     Until False;
     if FLastError='' then FLastError:=E.Message;
     if FLastError='' then FLastError:='ERP_9999';
    end;
  end;
 end;

function TMarry301.fpOpenCashBox:Boolean;
 begin
  Result:=SendCommand('KASS',False);
 end;

function TMarry301.fpServiceText(TextPos,Print2,FontHeight:Integer; S:String):Boolean;
var ss:String;
 begin
  if Not (FUseEKKA) then begin Result:=True; Exit; end;
  try
   if Not (TextPos in [0,1]) then Abort;
   if Not (Print2 in [0,1]) then Abort;
   if Not (FontHeight in [0..3]) then Abort;
   ss:='TEXT'+
      IntToStr(TextPos)+
      IntToStr(Print2)+
      IntToStr(FontHeight)+
      Copy(S,1,43);
   Result:=SendCommand(ss,False);
  except
   Result:=False;
   FLastError:='ERP_9992';
  end;
 end;

function TMarry301.fpSetBackReceipt(S:String):Boolean;
 begin
  Result:=SendCommand('BCHN'+Copy(S,1,86),False);
 end;

function TMarry301.fpLoadLogo(Logo:TBitMap; Active:Boolean): Boolean;
var i,j,k,dx,dy:Integer;
    ss,S:String;

 function GetPix(C:TColor):Char;
  begin
   if C>$808080 then Result:='0' else Result:='1';
  end;

 function GetHex(S:String):Char;
  begin
   if S='0000' then Result:='0' else
   if S='0001' then Result:='1' else
   if S='0010' then Result:='2' else
   if S='0011' then Result:='3' else
   if S='0100' then Result:='4' else
   if S='0101' then Result:='5' else
   if S='0110' then Result:='6' else
   if S='0111' then Result:='7' else
   if S='1000' then Result:='8' else
   if S='1001' then Result:='9' else
   if S='1010' then Result:='A' else
   if S='1011' then Result:='B' else
   if S='1100' then Result:='C' else
   if S='1101' then Result:='D' else
   if S='1110' then Result:='E' else
   if S='1111' then Result:='F' else Result:='0';
  end;

 Begin
  Result:=True;
  if Not UseEKKA then Exit;
  try
   if Logo=nil then Abort;
   if Logo.Height>192 then dy:=192 else dy:=Logo.Height;
   if Logo.Width>432 then dx:=432 else dx:=Logo.Width;
   for j:=0 to dy-1 do
    begin
     S:=''; for i:=1 to 108 do S:=S+'0';
     for i:=0 to (dx div 4)-1 do
      begin
       ss:='';
       for k:=0 to 3 do  ss:=ss+GetPix(Logo.Canvas.Pixels[4*i+k,j]);
       S[i]:=GetHex(ss);
      end;
     Result:=SendCommand('LUPC'+IntToStrF(j+1,3)+Copy(S,1,108),False);
     if Not Result then Exit;
    end;
   if Active then Result:=fpActiveLogo(dy)
             else Result:=fpActiveLogo(0);
  except
   FLastError:='ERP_9988';
   Result:=False;
  end;
 End;

function TMarry301.fpLoadLogo(Logo:String; Active:Boolean):Boolean;
var Bm:TBitMap;
 begin
  Result:=True;
  if Not UseEKKA then Exit;
  Result:=False;
  if Not (FileExists(Logo)) then FLastError:='Файл с графическим образом отсутствует!' else
   try
    Bm:=TBitMap.Create;
    try
     Bm.LoadFromFile(Logo);
     Result:=fpLoadLogo(Bm,Active);
    finally
     Bm.Free;
    end;
   except
    FLastError:='ERP_9988';
   end;
 end;

function TMarry301.fpActiveLogo(P:Byte):Boolean;
 begin
  if P>192 then P:=192;
  Result:=SendCommand('AUPC'+IntToStrF(P,3),False);
 end;

function TMarry301.fpCutBeep(C,B,N:Byte):Boolean;
 begin
  if Not ((C in [0,1]) or (B in [0,1]) or (N in [0,1])) then
   begin
    FLastError:='ERP_9992';
    Result:=False;
   end else Result:=SendCommand('CUTR'+IntToStrF(C,1)+IntToStrF(B,1)+IntToStrF(N,1),True);
 end;

function TMarry301.fpCutBeep(C,B:Byte):Boolean;
 begin
  if Not ((C in [0,1]) or (B in [0,1])) then
   begin
    FLastError:='ERP_9992';
    Result:=False
   end else Result:=SendCommand('CUTR'+IntToStrF(C,1)+IntToStrF(B,1),True);
 end;

function TMarry301.fpSetHead(S:String):Boolean;
 begin
  Result:=SendCommand('HEAD'+CenterStr(Copy(S,1,43),43),false);
 end;

function TMarry301.fpFiscState:Boolean;
 begin
  if Not (FUseEKKA) then begin Result:=True; Exit; end;
  Result:=SendCommand('CFIS',True);
  if Not Result then Exit;
  Result:=SplitRes(FResComm,'12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12',FRD_Item);
 end;

function TMarry301.fpServPassw(P1:String; P2:String=''):Boolean;
 begin
  Result:=SendCommand('SPAS'+P1+P2,True);
 end;

function TMarry301.fpDayLimit(D:Integer):Boolean;
 begin
  Result:=SendCommand('DLIM'+IntToStr(D),False);
 end;

function TMarry301.fpPrintLimit(P:Integer):Boolean;
 begin
  Result:=SendCommand('PLIM'+IntToStr(P),False);
 end;

function TMarry301.fpGetLimitStatus:Boolean;
 begin
  Result:=SendCommand('CRES',True);
  if Not Result then Exit;
  Result:=SplitRes(FResComm,'10,10,10,10',FRD_Item);
 end;

function TMarry301.fpResetUsPassw: Boolean;
 begin
  Result:=SendCommand('cusp',False);
 end;

function TMarry301.GetCommParams(S:String):String;
 begin
  Result:=Copy(S,5,Length(S)-4);
  S:=Copy(S,1,4);
  if S='CRES' then Result:='10,10,10,10' else
  if (S='CONF') or (S='CONf') then Result:='10,10,36,8,6,1,1,1,4,1,12,12,4,4,8,18,8,1,3' else
  if S='CCAS' then Result:='11,11,11,11,11,11,11,11' else
  if S='CFIS' then Result:='12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12';
 end;

function TMarry301.fpCheckCopy:Boolean;
 begin
  Result:=SendCommand('COPY',False);
 end;

function TMarry301.KeyPosition(Key: Byte):Boolean;
 begin
  try
   if Not UseEKKA then Abort;
   if Not fpGetStatus then Abort;
   Result:=Key=Ord(RD_Item[5][1]);
  except
   Result:=False;
  end;
 end;

Initialization
 SetLength(Arr,0);

Finalization

 if FMarry301<>nil then FMarry301.Free;

END.



