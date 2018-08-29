UNIT EKKAU;

INTERFACE

Uses Windows, Dialogs, Messages, SysUtils, Classes, Marry301U, Util;

Type RetData=Record
              Count:Integer;
              CmdCode:Integer;
              UserData:Integer;
              Status:Integer;
              CmdName:PChar;
              SendStr:PChar;
              Whole:PChar;
              RetItem:Array[1..20] of PChar;
              OrigStat:Array[1..6] of Byte;
             end;

     n1RetData=Array[1..10] of Byte;
     nRetData=^n1RetData;

     TMathFunc=procedure(const rt:RetData)stdcall;

     TEKKA=class(TMarry301)

     private

       FTypeEKKA:Byte;
       FKassaID:Byte;
       FNumVoidChek:String;
       FIsConnected:Boolean;

       function ReConnect:Boolean;
       function CancelFiscalReceipt:Boolean;

       procedure SetTypeEKKA(const Value: Byte);

     protected

       function GetReceiptNumber:Integer; override;

     public

       IsAbort:Boolean;
       Passw:Array[1..16] of String;

       constructor Create(AOwner:TComponent); override;
       destructor Destroy; override;

       procedure Gh;

       procedure fpClosePort; override;                            // Закрыть СОМ порт

       function  ErrorDescr(Code:String):String; override;         // Строковое сообщение по коду ошибки

       { --- Установка связи с ЕККА --- }
       function  fpConnect:Boolean; override;                      // Установка связи с ЕККА

       { --- Настройка рабочей среды ---}
       function  fpSetTime(T:TDateTime):Boolean; override;         // Установка времени EKKA
       function  fpActiveLogo(P:Byte):Boolean; override;           // Активизация печати графического образа (0 не печатать, 1 - печатать)

       { --- Реализация и возврат товаров и услуг --- }
       function  fpOpenFiscalReceipt(Param:Byte=1):Boolean; override;  // Открытие нового Чека
       function  fpCancelFiscalReceipt:Boolean; override;              // Отмена чека
       function  fpAddSale(Name:String;                              // Регистрация продажи одной позиции
                           Kol:Integer;
                           Cena:Currency;
                           Divis:Byte;
                           Artic:Integer;
                           Nalog:Byte;
                           DiscSum:Currency;
                           DiscDescr:String
                          ):Boolean;  override;

       function  fpAddBack(Name:String;                             // Регистрация позиции возврата
                           Kol:Integer;
                           Cena:Currency;
                           Divis:Byte;
                           Nalog:Byte;
                           DiscSum:Currency;
                           DiscDescr:String
                          ):Boolean; override;

       function  fpSetBackReceipt(S:String):Boolean; override;      // Определение номера возвратного чека
       function  fpServiceText(TextPos:Integer;                     // Регистрация служебной строки в чеке
                               Print2:Integer;
                               FontHeight:Integer;
                               S:String
                              ):Boolean; override;

       function  fpCloseFiscalReceipt(TakedSumm:Currency;           // Закрытие чека
                                      TypeOplat:Integer;
                                      SumCheck:Currency=0
                                      ):Boolean; override;
       function  fpCheckCopy:Boolean; override;                      // Печать копии чека

       { --- Служебное внесение/изьятие денежных средств --- }
       function  fpCashInput(C:Currency):Boolean; override;         // Внесение денежных средств
       function  fpCashOutput(C:Currency):Boolean; override;        // Изьятие денежных средств

       { --- Фискальные отчеты --- }
       function  fpXRep:Boolean; override;                         // X-отчет
       function  fpZRep:Boolean; override;                         // Z-отчет
       function  fpPerFullRepD(D1,D2:TDateTime):Boolean; override; // Полный периодический отчет по датам
       function  fpPerShortRepD(D1,D2:TDateTime):Boolean; override;// Сокращенный периодический отчет по датам
       function  fpPerFullRepN(N1,N2:Integer):Boolean; override;   // Полный периодический отчет по номерам Z-отчетов
       function  fpPerShortRepN(N1,N2:Integer):Boolean; override;  // Сокращенный периодический отчет по датам Z-отчетов

       { --- Аналитичесике и служедные отчеты --- }
       function  fpZeroCheck:Boolean; override;                     // Нулевой чек

       { --- Получение консолидированной информации о состоянии ЕККА --- }
       function  fpGetStatus:Boolean; override;                    // Получение внутреннего состояния EKKA
       function  fpCashState(P:Integer):Boolean; override;         // Запрос информации о движении средств по кассе (0 - по текущей смене, 1 - по прошлой)
       function  fpFiscState:Boolean; override;                    // Запрос текущего состояния дневных фискальных регистров

       { --- Дополнительные функции ---}
       function  KeyPosition(Key:Byte):Boolean; override;          // Проверка положение ключа
       function  fpIsNonClosedReceipt:Boolean;

       property  TypeEKKA:Byte read FTypeEKKA write SetTypeEKKA;   // Тип ЕККА
       property  KassaID:Byte read FKassaID write FKassaID;        // Номер кассы

     end;

Const { --- Типы EKKA --- }
      EKKA_MARRY301MTM=1; // ЕККА Мария 301МТМ T7
      EKKA_DATECS3530T=2; // EKKA Датекс 3530T

      { --- Положение ключа --- }
      KEY_O=0; // Отключен
      KEY_W=1; // Работа
      KEY_X=2; // X-отчет
      KEY_Z=4; // Z-отчет
      KEY_P=8; // Программирование

      { --- Признаки открытия чеков --- }
      CH_SALE=1; // Продажный чек
      CH_BACK=2; // Возвратный чек

procedure PrinterResults(const rt:RetData)stdcall;

function  GetStatus(hWin:HWND; fun:TMathFunc; par:LPARAM; int1: BOOL):integer; stdcall	;external 'fpl.dll' name 'GetStatus';
function  GetDiagnosticInfo(hWin:HWND; fun:TMathFunc; par:LPARAM; Calc: BOOL):integer; stdcall	;external 'fpl.dll' name 'GetDiagnosticInfo';
function  GetDateTime(hWin:HWND; fun:TMathFunc; par:LPARAM):integer; stdcall	;external 'fpl.dll' name 'GetDateTime';
function  GetLastReceipt(hWin:HWND; fun:TMathFunc; par:LPARAM):integer;stdcall;external 'fpl.dll' name 'GetLastReceipt';
function  DayInfo(hWin:HWND; fun:TMathFunc; par:LPARAM):integer;stdcall;external 'fpl.dll' name 'DayInfo';
function  SetDateTime(hWin:HWND; fun:TMathFunc; par:LPARAM; Date:LPSTR; Time:LPSTR):integer;stdcall;external 'fpl.dll' name 'SetDateTime';
function  OpenFiscalReceipt(hWin:HWND; fun:TMathFunc; par:LPARAM;i1: DWORD;i2: LPSTR;i3: DWORD;i4: BOOL):integer;stdcall;external 'fpl.dll' name 'OpenFiscalReceipt';
function  ResetReceipt(hWin:HWND; fun:TMathFunc; par:LPARAM):integer; stdcall	;external 'fpl.dll' name 'ResetReceipt';
function  OpenRepaymentReceipt(hWin:HWND; fun:TMathFunc; par:LPARAM;i1: DWORD;i2: LPSTR;i3: DWORD;i4: BOOL):integer;stdcall;external 'fpl.dll' name 'OpenRepaymentReceipt';
function  RegisterItem(hWin:HWND; fun:TMathFunc; par:LPARAM; n:LPSTR; n1: char; n2:double; n3:double):integer;stdcall;external 'fpl.dll' name 'RegisterItem';
function  InitFPport(int1,int2:integer):integer;stdcall	; external 'fpl.dll' name 'InitFPport';
function  CloseFPport():integer;stdcall	; external 'fpl.dll' name 'CloseFPport';
function  PrintDiagnosticInfo(hWin:HWND; fun:TMathFunc; par:LPARAM):integer; stdcall	;external 'fpl.dll' name 'PrintDiagnosticInfo';
function  SetDecimals(int1:integer):integer;stdcall;external 'fpl.dll' name 'SetDecimals';
function  SubTotal(hWin:HWND; fun:TMathFunc; par:LPARAM; n1:BOOL;n2:BOOL; n3:double; n4:double):integer; stdcall	;external 'fpl.dll' name 'SubTotal';
function  Total(hWin:HWND; fun:TMathFunc; par:LPARAM; n1:LPSTR;n2:char; n3:double):integer; stdcall	;external 'fpl.dll' name 'Total';
function  CloseFiscalReceipt(hWin:HWND; fun:TMathFunc; par:LPARAM):integer; stdcall	;external 'fpl.dll' name 'CloseFiscalReceipt';
function  FiscalClosure(hWin:HWND; fun:TMathFunc; par: LPARAM;n:LPSTR;s:char):integer; stdcall;external 'fpl.dll' name 'FiscalClosure';
function  ServiceInputOutput(hWin:HWND; fun:TMathFunc; par:LPARAM ; sum:Double) :integer; stdcall	;external 'fpl.dll' name 'ServiceInputOutput';
function  PrintFiscalMemoryByNum(hWin:HWND; fun:TMathFunc; par: LPARAM; psw:LPSTR; n1:integer; n2:integer):integer; stdcall;external 'fpl.dll' name 'PrintFiscalMemoryByNum';
function  PrintFiscalMemoryByDate(hWin:HWND; fun:TMathFunc; par: LPARAM; psw:LPSTR; d1:LPSTR; d2:LPSTR):integer; stdcall;external 'fpl.dll' name 'PrintFiscalMemoryByDate';
function  PrintReportByNum(hWin:HWND; fun:TMathFunc; par: LPARAM; psw:LPSTR; n1:integer; n2:integer):integer; stdcall;external 'fpl.dll' name 'PrintReportByNum';
function  PrintReportByDate(hWin:HWND; fun:TMathFunc; par: LPARAM; psw:LPSTR; d1:LPSTR; d2:LPSTR):integer; stdcall;external 'fpl.dll' name 'PrintReportByDate';
function  OpenDrawer(hWin:HWND; fun:TMathFunc; par:LPARAM):integer; stdcall	;external 'fpl.dll' name 'OpenDrawer';
function  PrintFiscalText(hWin:HWND; fun:TMathFunc; par:LPARAM; int1: LPSTR):integer; stdcall	;external 'fpl.dll' name 'PrintFiscalText';
function  SaleArticle(hWin:HWND; fun:TMathFunc; par:LPARAM; sign: Boolean;  numart:integer; qwant,perc,dc:double ):integer; stdcall  ;external 'fpl.dll' name 'SaleArticle';
function  SaleArticleAndDisplay(hWin:HWND; fun:TMathFunc; par:LPARAM; sign: Boolean;  numart:integer; qwant,perc,dc:double ):integer; stdcall  ;external 'fpl.dll' name 'SaleArticleAndDisplay';
function  ProgrammingArticle(hWin:HWND; fun:TMathFunc; par:LPARAM; nal:char; gr:integer; cod:integer; Sena:double; pass:LPSTR; name:LPSTR):integer; stdcall  ;external 'fpl.dll' name 'ProgrammingArticle';
function  DeleteArticle(hWin:HWND; fun:TMathFunc; par:LPARAM; cod:integer; pass:LPSTR):integer; stdcall  ;external 'fpl.dll' name 'DeleteArticle';
function  ChangeArticlePrice(hWin:HWND; fun:TMathFunc; par:LPARAM; cod:integer;sena:Double; pass:LPSTR):integer; stdcall  ;external 'fpl.dll' name 'ChangeArticlePrice';
function  SetOperatorName(hWin:HWND; fun:TMathFunc; par:LPARAM; i1:DWORD; i2:LPSTR; i3:LPSTR):integer;stdcall;external 'fpl.dll' name 'SetOperatorName';
function  GetFiscalClosureStatus(hWin:HWND; fun:TMathFunc; par:LPARAM; i1:BOOL):integer;stdcall;external 'fpl.dll' name 'GetFiscalClosureStatus';
function  MakeReceiptCopy(hWin:HWND; fun:TMathFunc; par:LPARAM; i1:Char):integer;stdcall;external 'fpl.dll' name 'MakeReceiptCopy';
function  SetHeaderFooter(hWin:HWND; fun:TMathFunc; par:LPARAM; i1:Integer; S:LPSTR):integer;stdcall;external 'fpl.dll' name 'SetHeaderFooter';
function  PrintNonfiscalText(hWin:HWND; fun:TMathFunc; par:LPARAM; int1: LPSTR):integer; stdcall	;external 'fpl.dll' name 'PrintNonfiscalText';
function  OperatorsReport(hWin:HWND; fun:TMathFunc; par:LPARAM; ps:LPSTR):integer; stdcall	;external 'fpl.dll' name 'OperatorsReport';
function  GetCurrentTaxes(hWin:HWND; fun:TMathFunc; par:LPARAM; int1:Integer):integer; stdcall	;external 'fpl.dll' name 'GetCurrentTaxes';

function  DisplayTextLL(hWin:HWND; fun:TMathFunc; par:LPARAM; S:LPSTR):integer; stdcall; external 'fpl.dll' name 'DisplayTextLL';
function  DisplayTextUL(hWin:HWND; fun:TMathFunc; par:LPARAM; S:LPSTR):integer; stdcall; external 'fpl.dll' name 'DisplayTextUL';

Function EKKA:TEKKA;

IMPLEMENTATION

Var FEKKA:TEKKA=nil;

{ TEKKA }

Function EKKA:TEKKA;
 begin
  if FEKKA=nil then FEKKA:=TEKKA.Create(nil);
  Result:=FEKKA;
 end;

procedure TEKKA.Gh;
var Sum:Real;
 begin
//  PrintNonfiscalText(0,PrinterResults,0,'Бажаемо вам здоров''я!');
  fpFiscState;
//  OperatorsReport(0,PrinterResults,0,'0000');
//  fpActiveLogo(0);
  //CloseFiscalReceipt(0,PrinterResults,0);
{  if ProgrammingArticle(0,PrinterResults,0,'Б',100,1,10.01,PChar(Passw[14]),'Анальгин N10')=0 then
   ShowMessage(FRD_Item[0]);}
 end;

procedure PrinterResults(const rt:RetData) stdcall;
var i:Integer;
 begin
  EKKA.FLastError:='';
  EKKA.FRD_Item.Clear;
  for i:=Low(rt.RetItem) to High(rt.RetItem) do
   EKKA.FRD_Item.Add(rt.RetItem[i]);

  if rt.Status and $00000001=$00000001 then EKKA.FLastError:='SYNTAX_ERROR' else
  if rt.Status and $00000200=$00000200 then EKKA.FLastError:='PAPER_OUT' else
  if rt.Status and $00000002=$00000002 then EKKA.FLastError:='INVALID_CMD' else
  if rt.Status and $00000004=$00000004 then EKKA.FLastError:='INVALID_TIME' else
  if rt.Status and $00000008=$00000008 then EKKA.FLastError:='PRINT_ERROR' else
  if rt.Status and $00000010=$00000010 then EKKA.FLastError:='SUM_OVERFLOW' else
  if rt.Status and $00000020=$00000020 then EKKA.FLastError:='CMD_NOT_ALLOWED' else
  if rt.Status and $00000040=$00000040 then EKKA.FLastError:='RAM_CLEARED' else
  if rt.Status and $00000080=$00000080 then EKKA.FLastError:='PRINT_RESTART' else
  if rt.Status and $00000100=$00000100 then EKKA.FLastError:='RAM_DESTROYED' else
  if rt.Status and $00000400=$00000400 then EKKA.FLastError:='FISCAL_OPEN' else
  if rt.Status and $00000800=$00000800 then EKKA.FLastError:='NONFISCAL_OPEN' else
  if rt.Status and $00002000=$00002000 then EKKA.FLastError:='F_ABSENT' else
  if rt.Status and $00010000=$00010000 then EKKA.FLastError:='F_WRITE_ERROR' else
  if rt.Status and $00020000=$00020000 then EKKA.FLastError:='F_FULL' else
  if rt.Status and $00040000=$00040000 then EKKA.FLastError:='F_READ_ONLY' else
  if rt.Status and $00080000=$00080000 then EKKA.FLastError:='F_CLOSE_ERROR' else
  if rt.Status and $00100000=$00100000 then EKKA.FLastError:='F_LESS_30' else
  if rt.Status and $01000000=$01000000 then EKKA.FLastError:='PROTOCOL_ERROR' else
  if rt.Status and $02000000=$02000000 then EKKA.FLastError:='NACK_RECEIVED' else
  if rt.Status and $04000000=$04000000 then EKKA.FLastError:='TIMEOUT_ERROR' else
  if rt.Status and $08000000=$08000000 then EKKA.FLastError:='COMMON_ERROR';

//  if rt.Status and $00400000=$00400000 then EKKA.FLastError:='F_FISCALIZED' else
//  if rt.Status and $00004000=$00004000 then EKKA.FLastError:='F_MODULE_NUM' else
//  if rt.Status and $00200000=$00200000 then EKKA.FLastError:='F_FORMATTED' else
//  if rt.Status and $00800000=$00800000 then EKKA.FLastError:='F_SER_NUM' else
 end;

constructor TEKKA.Create;
var i:Byte;
 begin
  inherited;
  IsAbort:=False;
  FIsConnected:=False;
  FKAssaID:=1;
  FNumVoidChek:='';
  TypeEKKA:=EKKA_MARRY301MTM;

  for i:=Low(Passw) to High(Passw) do Passw[i]:='0000';
 end;

destructor TEKKA.Destroy;
 begin
  inherited;
 end;

function TEKKA.ErrorDescr(Code:String):String;
 begin
  Result:=inherited ErrorDescr(Code);
  if Result=Code then
  if Code='SYNTAX_ERROR'    then Result:='Синтаксическая ошибка' else
  if Code='INVALID_CMD'     then Result:='Неверная команда' else
  if Code='INVALID_TIME'    then Result:='Дата и время неверны' else
  if Code='PRINT_ERROR'     then Result:='Ошибка печати' else
  if Code='SUM_OVERFLOW'    then Result:='Арифметическое переполнение' else
  if Code='CMD_NOT_ALLOWED' then Result:='Команда не разрешена' else
  if Code='RAM_CLEARED'     then Result:='Обнуление ОЗУ' else
  if Code='PRINT_RESTART'   then Result:='Открыт чек возврата' else
  if Code='RAM_DESTROYED'   then Result:='Разрушение информации в ОЗУ' else
  if Code='PAPER_OUT'       then Result:='Отсутствует чековая или/и контрольная лента' else
  if Code='FISCAL_OPEN'     then Result:='Открыт фискальный чек' else
  if Code='NONFISCAL_OPEN'  then Result:='Открыт нефискальный чек' else
  if Code='F_ABSENT'        then Result:='Не обнаружен модуль фиск. памяти' else
  if Code='F_WRITE_ERROR'   then Result:='Ошибка записи в фиск. память' else
  if Code='F_FULL'          then Result:='Фиск. память переполнена' else
  if Code='F_READ_ONLY'     then Result:='Запись в фиск. память запрещена' else
  if Code='F_CLOSE_ERROR'   then Result:='Ошибка последнего Z-отчета' else
  if Code='F_LESS_30'       then Result:='В фиск. памяти мало свободного пространства' else
  if Code='PROTOCOL_ERROR'  then Result:='Ошибка протокола' else
  if Code='NACK_RECEIVED'   then Result:='Принят NACK' else
  if Code='TIMEOUT_ERROR'   then Result:='Нет ответа от регистратора' else
  if Code='COMMON_ERROR'    then Result:='Общая ошибка';
 end;

procedure TEKKA.fpClosePort;
 begin
  if Not (UseEKKA) then Exit;
  FIsConnected:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:inherited;
   EKKA_DATECS3530T:CloseFPport;
  end;
 end;

function TEKKA.ReConnect:Boolean;
 begin
  if FLastError='TIMEOUT_ERROR' then
   begin
    fpClosePort;
    Result:=fpConnect;
   end else Result:=True;
 end;

function TEKKA.fpConnect:Boolean;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpConnect;
   EKKA_DATECS3530T:begin
                     Result:=InitFPport(PortNum,19200)>0;
                     try
                      if Not Result then Abort;
                      CancelFiscalReceipt;
                      Result:=fpGetStatus;
                      if Not Result then Exit;
                      if Length(FRD_Item[0])<>10 then Abort;
                      FVZhNum:=StrToInt64(FRD_Item[0]);
                      Result:=(SetOperatorName(0,PrinterResults,0,1,PChar(Passw[1]),PChar(Copy(Kassir,1,24)))=0) and (FLastError='');
                      if Not Result then Abort;
                      FIsConnected:=True;
                     except
                      FIsConnected:=False;
                      if FLastError='' then FLastError:='TIMEOUT_ERROR';
                     end;
                    end;
  end;
 end;

function TEKKA.fpGetStatus:Boolean;
var ri:TStringList;
    DatePO,Ver,S:String;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpGetStatus;
   EKKA_DATECS3530T:begin
                     try
                      Result:=(GetDiagnosticInfo(0,PrinterResults,0,False)=0) and (FLastError='');
                      if Not Result then Abort;
                      ri:=TStringList.Create;
                      try
                       Ver:=FRD_Item[0];
                       DatePO:=FRD_Item[1];
                       ri.Clear;
                       ri.Add(FRD_Item[7]); // Зав номер (Реально фискальный)
                       ri.Add(FRD_Item[7]); // Фискальный номер
                       ri.Add('');          // Наименование и адрес предприятия (всегда пусто)
                       Result:=(GetDateTime(0,PrinterResults,0)=0) and (FLastError='');
                       if Not Result then Abort;
                       S:=FRD_Item[0];
                       ri.Add('20'+Copy(S,7,2)+Copy(S,4,2)+Copy(S,1,2));
                       S:=FRD_Item[1];
                       if Length(S)>=8 then ri.Add(Copy(S,1,2)+Copy(S,4,2)+Copy(S,7,2))
                                       else ri.Add(Copy(S,1,2)+Copy(S,4,2)+'00');
                       ri.Add('1'); // Положение системного ключа (всегда 1)
                       ri.Add('1'); // Признак ожидаемо команды (всегда 1)
                       ri.Add('1'); // Признак зарегистрированного кассира (всегда 1)
                       ri.Add('    ');
                       Result:=(DayInfo(0,PrinterResults,0)=0) and (FLastError='');
                       if Not Result then Abort;
                       if RD_Item[5]='0' then ri.Add('1') else ri.Add('0');
                       ri.Add(RD_Item[4]); // Номер последнего Z-отчета
                       Result:=(GetLastReceipt(0,PrinterResults,0)=0) and (FLastError='');
                       if Not Result then Abort;
                       ri.Add(RD_Item[0]); // Номер последнего фискального чека
                       ri.Add('    ');
                       ri.Add(Ver);
                       ri.Add(DatePO);
                       ri.Add('');
                       ri.Add(DatePO);
                       ri.Add('2');
                       ri.Add('грн');
                       FRD_Item.Text:=ri.Text;
                      finally
                       ri.Free;
                      end;
                     except
                      Result:=False;
                      if FLastError='' then FLastError:='ERP_9995';
                     end;
                    end;
  end;
 end;

function TEKKA.fpSetTime(T:TDateTime):Boolean;
var D:String;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpSetTime(T);
   EKKA_DATECS3530T:begin
                     Result:=ReConnect; if Not Result then Exit;
                     Result:=(GetDateTime(0,PrinterResults,0)=0) and (FLastError='');
                     if Not Result then Exit;
                     D:=FRD_Item[0];
                     Result:=(SetDateTime(0,PrinterResults,0,PChar(D),PChar(FormatDateTime('hh:nn:ss',T)))=0) and (FLastError='');
                    end;
  end;
 end;

function TEKKA.fpXRep:Boolean;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpXRep;
   EKKA_DATECS3530T:begin
                     Result:=ReConnect; if Not Result then Exit;
                     Result:=(FiscalClosure(0,PrinterResults,0,PChar(Passw[15]),'2')=0) and (FLastError='');
                    end;
  end;
 end;

function TEKKA.fpZRep:Boolean;
var B:Boolean;
    Sum:Currency;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpZRep;
   EKKA_DATECS3530T:begin
                     Result:=ReConnect; if Not Result then Exit;
                     Result:=(ServiceInputOutput(0,PrinterResults,0,0)=0) and (FLastError='');
                     Sum:=StrToInt(FRD_Item[0])*0.01;
                     //Result:=(FiscalClosure(0,PrinterResults,0,PChar(Passw[15]),'2')=0) and (FLastError='');
                     Result:=(ServiceInputOutput(0,PrinterResults,0,-Sum)=0) and (FLastError='');
                     Result:=(FiscalClosure(0,PrinterResults,0,PChar(Passw[15]),'0')=0) and (FLastError='');
                     if Not Result then Exit;
                     DeleteArticle(0,PrinterResults,0,0,PChar(Passw[14]));
                     DeleteFile(FArtFile);
                     ServiceInputOutput(0,PrinterResults,0,Sum);
                    end;
  end;
 end;

function TEKKA.GetReceiptNumber:Integer;
 begin
  if Not (UseEKKA) then begin Result:=-1; Exit; end;
  Result:=-1;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited GetReceiptNumber;
   EKKA_DATECS3530T:try
                     if Not ReConnect then Abort;
                     if GetLastReceipt(0,PrinterResults,0)<>0 then Abort;
                     Result:=StrToInt(FRD_Item[0]);
                    except
                     Result:=-1;
                    end;
  end;
 end;

function TEKKA.KeyPosition(Key:Byte):Boolean;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited KeyPosition(Key);
   EKKA_DATECS3530T:Result:=True;
  end;
 end;

function TEKKA.fpOpenFiscalReceipt(Param:Byte=1):Boolean;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpOpenFiscalReceipt;
   EKKA_DATECS3530T:begin
                     Result:=ReConnect; if Not Result then Exit;
                     Case Param of
                      CH_SALE:Result:=(OpenFiscalReceipt(0,PrinterResults,0,1,PChar(Passw[1]),KassaID,True)=0) and (FLastError='FISCAL_OPEN');
                      CH_BACK:begin
                               Result:=(OpenRepaymentReceipt(0,PrinterResults,0,1,PChar(Passw[1]),KassaID,True)=0) and ((FLastError='FISCAL_OPEN') or (FLastError='PRINT_RESTART'));
                               if Not Result then Exit;
                               Result:=(PrintFiscalText(0,PrinterResults,0,PChar(FNumVoidChek))=0) and ((FLastError='FISCAL_OPEN') or (FLastError='PRINT_RESTART'));
                              end;
                     end;
                    end;
  end;
 end;

function TEKKA.fpIsNonClosedReceipt:Boolean;
var Res:Boolean;
 begin
  if Not (UseEKKA) then begin Result:=False; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=False;
   EKKA_DATECS3530T:try
                     if Not ReConnect then Abort;
                     GetFiscalClosureStatus(0,PrinterResults,0,True);
                     if ((FLastError='FISCAL_OPEN') or (FLastError='PRINT_RESTART')) then
                      begin
                       Result:=Not CancelFiscalReceipt;
                      end else Exit;
                     FLastError:='';
                    except
                     Result:=True;
                     FLastError:='ERP_9993';
                    end;
  end;
 end;

function TEKKA.CancelFiscalReceipt:Boolean;
 begin
  try
   Result:=(GetFiscalClosureStatus(0,PrinterResults,0,False)=0) and (FLastError='');
   if Not Result then Abort;
   if StrToInt(FRD_Item[0])=1 then Abort else Result:=True;
  except
   Result:=(ResetReceipt(0,PrinterResults,0)=0) and (FLastError='');
  end;
 end;

function TEKKA.fpCancelFiscalReceipt:Boolean;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpCancelFiscalReceipt;
   EKKA_DATECS3530T:begin
                     Result:=ReConnect; if Not Result then Exit;
                     Result:=CancelFiscalReceipt;
                    end;
  end;

 end;

function TEKKA.fpAddSale(Name:String;
                         Kol:Integer;
                         Cena:Currency;
                         Divis:Byte;
                         Artic:Integer;
                         Nalog:Byte;
                         DiscSum:Currency;
                         DiscDescr:String):Boolean;
var Art,i:Integer;
    Sh:Char;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpAddSale(Name,Kol,Cena,Divis,Artic,Nalog,DiscSum,DiscDescr);
   EKKA_DATECS3530T:try
                     Result:=ReConnect; if Not Result then Exit;
                     Sh:=#0;
                     Case Nalog of
                      1:Sh:='А';
                      2:Sh:='Б' else Abort;
                     end;
                     for i:=1 to 30 do
                      begin
                       if (Artic=0) or (Artic=99999) then Art:=StrToInt(fpGetNewArt) else Art:=Artic;
                       if (ProgrammingArticle(0,PrinterResults,0,Sh,Art,1,Cena,
                                             PChar(Passw[14]),
                                             PChar(Copy(Name,1,24)+#09+Copy(Name,25,24)))<>0) or ((FLastError<>'FISCAL_OPEN') and (FLastError<>'PRINT_RESTART')) then Abort;
                       if FRD_Item[0]<>'P' then
                        begin
                         if Artic=0 then Abort;
                        end else Break;
                      end;
                     Result:=(SaleArticle(0,PrinterResults,0,True,Art,Kol,0,DiscSum)=0) and ((FLastError='FISCAL_OPEN') or (FLastError='PRINT_RESTART'));
                    except
                     Result:=False;
                     if FLastError='' then FLastError:='ERP_9992';
                    end;
  end;
 end;

function TEKKA.fpAddBack(Name:String;
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

function TEKKA.fpSetBackReceipt(S:String):Boolean;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpSetBackReceipt(S);
   EKKA_DATECS3530T:begin
                     FNumVoidChek:='ПОВ. ПО ЧЕКУ№ '+S;
                     Result:=True;
                    end;
  end;
 end;

function TEKKA.fpCloseFiscalReceipt(TakedSumm:Currency; TypeOplat:Integer; SumCheck:Currency=0):Boolean;
var PaidCode:Char;
    Sum,SumItog,SumOplat:Currency;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpCloseFiscalReceipt(TakedSumm,TypeOplat);
   EKKA_DATECS3530T:try
                     Result:=ReConnect; if Not Result then Exit;
                     PaidCode:=#0;
                     Case TypeOplat of
                      1:PaidCode:='N';
                      2:PaidCode:='D';
                      3:PaidCode:='C';
                      4:PaidCode:='P' else Abort;
                     end;
                     Result:=(GetFiscalClosureStatus(0,PrinterResults,0,True)=0) and ((FLastError='FISCAL_OPEN') or (FLastError='PRINT_RESTART'));
                     if Not Result then Abort;
                     SumItog:=StrToInt64(FRD_Item[2])*0.01;
                     SumOplat:=StrToInt64(FRD_Item[3])*0.01;
                     if TakedSumm<>0 then
                      begin
                       if CurrToStrF(SumItog,ffFixed,2)<>CurrToStrF(SumCheck,ffFixed,2) then
                        begin
                         FLastError:='SOFTBADCS';
                         Abort;
                        end;
                       Sum:=TakedSumm;
                      end else begin
                                Sum:=SumItog-SumOplat;
                               end;
                     if (Sum<>0) or ((Sum=0) and (SumItog=0)) then
                      begin
                       Result:=(Total(0,PrinterResults,0,'',PaidCode,Sum)=0) and ((FLastError='FISCAL_OPEN') or (FLastError='PRINT_RESTART'));
                       if Not Result then Abort;
                      end; 
                     if IsAbort then Abort;
                     PrintFiscalText(0,PrinterResults,0,PChar('* * * * * * * * * *'));
                     Result:=(CloseFiscalReceipt(0,PrinterResults,0)=0) and (FLastError='');
                     if Not Result then Abort;
                     FNumVoidChek:='';
                    except
                     Result:=False;
                     if FLastError='' then FLastError:='ERP_9991';
                    end;
  end;
 end;

function TEKKA.fpCheckCopy:Boolean;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpCheckCopy;
   EKKA_DATECS3530T:begin
                     Result:=ReConnect; if Not Result then Exit;
                     Result:=(MakeReceiptCopy(0,PrinterResults,0,'1')=0) and (FLastError='');
                    end;
  end;
 end;

function TEKKA.fpServiceText(TextPos,Print2,FontHeight:Integer; S:String):Boolean;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpServiceText(TextPos,Print2,FontHeight,S);
   EKKA_DATECS3530T:begin
                     Result:=ReConnect; if Not Result then Exit;
                     Result:=(PrintFiscalText(0,PrinterResults,0,PChar(S))=0) and (FLastError='');
                    end;
  end;
 end;


function TEKKA.fpCashInput(C:Currency):Boolean;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpCashInput(C);
   EKKA_DATECS3530T:begin
                     Result:=ReConnect; if Not Result then Exit;
                     Result:=(ServiceInputOutput(0,PrinterResults,0,Abs(C))=0) and (FLastError='');
                    end;
  end;
 end;

function TEKKA.fpCashOutput(C:Currency):Boolean;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpCashOutput(C);
   EKKA_DATECS3530T:begin
                     Result:=ReConnect; if Not Result then Exit;
                     Result:=(ServiceInputOutput(0,PrinterResults,0,-Abs(C))=0) and (FLastError='');
                    end;
  end;
 end;

function TEKKA.fpActiveLogo(P:Byte):Boolean;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpActiveLogo(P);
   EKKA_DATECS3530T:begin
                     if Not (P in [0,1]) then begin FLastError:='ERP_9992'; Exit; end;
                     Result:=ReConnect; if Not Result then Exit;
                     Result:=(SetHeaderFooter(0,PrinterResults,0,1,PChar(IntToStr(P)[1]))=0) and (FLastError='');
                     ShowMessage(FLastError);
                    end;
  end;
 end;

function TEKKA.fpZeroCheck:Boolean;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpZeroCheck;
   EKKA_DATECS3530T:begin
                     Result:=ReConnect; if Not Result then Exit;
                     Result:=fpCancelFiscalReceipt;
                     if Not Result then Exit;
                     Result:=fpOpenFiscalReceipt;
                     if Not Result then Exit;
                     Result:=fpCloseFiscalReceipt(0,4);
                    end;
  end;
 end;

function TEKKA.fpPerFullRepD(D1,D2:TDateTime):Boolean;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpPerFullRepD(D1,D2);
   EKKA_DATECS3530T:begin
                     Result:=ReConnect; if Not Result then Exit;
                     Result:=(PrintReportByDate(0,PrinterResults,0,PChar(Passw[15]),PChar(FormatDateTime('ddmmyy',D1)),PChar(FormatDateTime('ddmmyy',D2)))=0) and (FLastError='');
                    end;
  end;
 end;

function TEKKA.fpPerFullRepN(N1, N2: Integer): Boolean;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpPerFullRepN(N1,N2);
   EKKA_DATECS3530T:begin
                     Result:=ReConnect; if Not Result then Exit;
                     Result:=(PrintReportByNum(0,PrinterResults,0,PChar(Passw[15]),N1,N2)=0) and (FLastError='');
                    end;
  end;
 end;

function TEKKA.fpPerShortRepD(D1,D2:TDateTime):Boolean;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpPerShortRepD(D1,D2);
   EKKA_DATECS3530T:begin
                     Result:=ReConnect; if Not Result then Exit;
                    end;
  end;
 end;

function TEKKA.fpPerShortRepN(N1,N2:Integer):Boolean;
 begin
  if Not (UseEKKA) then begin Result:=True; Exit; end;
  Result:=False;
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpPerShortRepN(N1,N2);
   EKKA_DATECS3530T:begin
                     Result:=ReConnect; if Not Result then Exit;
                    end;
  end;
 end;

procedure TEKKA.SetTypeEKKA(const Value:Byte);
 begin
  FTypeEKKA:=Value;
  Case TypeEKKA of
   EKKA_MARRY301MTM:FArtFile:=PrPath+'\$Marry301$.txt';
   EKKA_DATECS3530T:FArtFile:=PrPath+'\$Datecs3530T$.txt';
  end;
 end;

function TEKKA.fpCashState(P:Integer):Boolean;
var ri:TStringList;
    i:Integer;
    A:Array[0..7] of Currency;

 function GetSumm:Currency;
 var i:Integer;
  begin
   Result:=0;
   try
    for i:=0 to 4 do
     Result:=Result+StrToInt64(FRD_Item[i]);
    Result:=Result*0.01;
   except
    Result:=0;
   end;
  end;

 Begin
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpCashState(P);
   EKKA_DATECS3530T:begin
                     Result:=ReConnect; if Not Result then Exit;
                     Result:=(ServiceInputOutput(0,PrinterResults,0,0)=0) and (FLastError='');
                     if Not Result then Exit;
                     try
                      ri:=TStringList.Create;
                      try
                       for i:=Low(A) to High(A) do A[i]:=0;
                       if P<>0 then Exit;
                       A[1]:=StrToInt64(FRD_Item[1])*0.01;
                       A[2]:=StrToInt64(FRD_Item[2])*0.01;
                       A[5]:=StrToInt64(FRD_Item[0])*0.01;

                       Result:=(DayInfo(0,PrinterResults,0)=0) and (FLastError='');
                       if Not Result then Exit;
                       A[3]:=StrToCurr(FRD_Item[0]);
                       A[6]:=StrToCurr(FRD_Item[2]);

                       Result:=(GetCurrentTaxes(0,PrinterResults,0,1)=0) and (FLastError='');
                       if Not Result then Exit;
                       A[4]:=GetSumm;
                       ri.Clear;
                       for i:=Low(A) to High(A) do ri.Add(IntToStr(Round(A[i]*100)));
                       FRD_Item.Text:=ri.Text;
                      finally
                       ri.Free;
                      end;
                     except
                      Result:=False;
                      if FLastError='' then FLastError:='ERP_9995';
                     end;
                    end;
  end;
 End;

function TEKKA.fpFiscState:Boolean;
var A:Array[1..20] of Currency;
    j,i:Integer;
    Sum:Currency;
    ri:TStringList;
 begin
  Case TypeEKKA of
   EKKA_MARRY301MTM:Result:=inherited fpFiscState;
   EKKA_DATECS3530T:begin
                     Result:=ReConnect; if Not Result then Exit;
                     try
                      ri:=TStringList.Create;
                      try
                       for i:=Low(A) to High(A) do A[i]:=0;

                       Result:=(GetCurrentTaxes(0,PrinterResults,0,0)=0) and (FLastError='');
                       if Not Result then Exit;

                       Sum:=0;
                       for j:=0 to 4 do
                        begin
                         A[1+j]:=StrToInt64(FRD_Item[j])*0.01;
                         Sum:=Sum+A[1+j];
                        end;
                       A[1]:=Sum;
                       Result:=(GetCurrentTaxes(0,PrinterResults,0,1)=0) and (FLastError='');
                       Sum:=0;
                       if Not Result then Exit;
                       for j:=0 to 4 do
                        begin
                         A[12+j]:=StrToInt64(FRD_Item[j])*0.01;
                         Sum:=Sum+A[1+j];
                        end;
                       A[11]:=Sum;
                       ri.Clear;
                       for i:=Low(A) to High(A) do ri.Add(IntToStr(Round(A[i]*100)));
                       FRD_Item.Text:=ri.Text;
                       //ShowMessage(ri.Text);
                      finally
                       ri.Free;
                      end;
                     except
                      Result:=False;
                      if FLastError='' then FLastError:='ERP_9995';
                     end;
                    end;
  end;
 end;

Initialization

Finalization

 if FEKKA<>nil then FEKKA.Free;

END.
