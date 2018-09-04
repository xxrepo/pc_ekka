Unit MainU;

Interface

Uses OpenLib, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
     Forms, Dialogs, Menus, ExtCtrls, ComCtrls, StdCtrls, Util, Grids, DBGrids,
     ActnList, DB, Buttons, ADODB, Digits, ComObj, EKKAU, IniFiles, PrintReport,
     IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP,
     ClipBrd, VCLZip, jpeg, ShellApi, DBCtrls, Volume, DateUtils,
     SendReceiveXML, SOAPHTTPTrans, OpenOffice, Types,
     svButtons, Math, IdTCPServer, Registry, MPlayer, SHDocVw,
     CPDrv, ImageEn, ExtImage, StrUtils, Printers, uJSON;

Type TFake=class(TCustomGrid);

     TWCtrl=class(TWinControl);

     TByteSet=Set of Byte;  // Тип множество Byte

     TCharSet=Set of Char;  // Тип множество символов

     THackDBGrid = class(TDBGrid)

      property DataLink;
      property UpdateLock;

     end;

     TAbbottStock = (asGeptral = 1, asOrange = 2);
     TAbbottOperation = (aoValidate = 1, aoFix = 2);

     TNlist=Array of Record
                      NN_nakl:String;
                      Date_Nakl:TDatetime;
                     end;

     TRegArtZamena=Record
                    id_zam:Integer;
                    id_part:Integer;
                    Art_Code:Integer;
                    Art_Map:Integer;
                    Status:Integer;
                   end;

     TArtConc=Record
               Art_Code:Integer;
               Kol:Integer;
              end;

     TEnterParam=Record
                  Art_Code:Integer;
                  id_akcii:Integer;
                  id_prior:Integer;
                  IsArtZam:Boolean;        // Фармзамена
                  IsPlanSale:Boolean;      // План продаж на сотрудника
                  IsPlanSaleApt:Boolean;   // План на аптеку
                  IsPlanSaleTotal:Boolean; // План на на сотрудника групповой
                  IsConcomit:Boolean;      // Сопутствующие
                  Ra:TRegArtZamena;
                  id_doctor:Integer;
                  card_doctor:String;
                  aArtConc:Array[1..1000] of TArtConc;
                  cArtConc:Integer;
                 end;

     TForBack=Record
               NumCard:Int64;
               FIO:String;
               DateR:String;
               Dt:TDateTime;
              end;

     TArtCode=Record
               Annot:Byte;
               ArtAdd:Byte;
               Recipt:Byte;
               Color:TColor;
              end;

     TGrafTime=Record
                tStart:Byte;
                tStMin:Byte;
                tEnd:Byte;
                tEndMin:Byte;
                Descr:String;
               end;

     TCardInfo=Record
                NumCard:Int64;
                F:String;
                I:String;
                O:String;
                Addr:String;
                DateR:String;
                ChName1:String;
                ChName2:String;
                ChName3:String;
                ChDateR1:String;
                ChDateR2:String;
                ChDateR3:String;
                EMail:String;
                Phone:String;
               end;

     TVozrForm=Record
                F:String;
                N:String;
                O:String;
                A:String;
                Pr:String;
                DateR:TDateTime;
                PaspD:TDateTime;
                PaspS:String;
                PaspN:String;
                PaspV:String;
                PaspT:String;
                Z:String;
                Summ:Currency;
                NumbChek:Int64;
                IsSimpl:Boolean;
               end;

     TFileOpt=Record               // Структура ini-файла
               SQLProvider:String;    // Провайдер SQL (начиная с SQL2005 он другой чем в 2000)
               Server:String;         // Имя сервера
               Base:String;           // Имя базы
               BaseUser:String;       // Имя пользователя базы данных
               BasePassw:String;      // Пароль базы данных
               Camera:Integer;        // Есть ли камера (1 - есть, 0 - нету)
               WebCamera:Integer;     // Есть ли web-камера (1 - есть, 0 - нету)
               KassaID:Integer;       // Номер кассы
               FlashPath:String;      // Путь выгрузки остатков
               TimeZ:TDateTime;       // Время Выдачи
               LoadNaklPath:String;   // Путь выгрузки накладных
               LogPath:String;        // Локальный путь для загрузки файлов
               ServerLogPath:String;  // Сетевой путь для папки Log
               ServerAVAPath:String;  // Сетевой путь для папки AVA
               ServerWorkPath:String; //
               SMTPHost:String;       // Адрес почтового сервера
               SMTPPort:Integer;      // Порт по которому будет осуществляться подключение
               EMailAddress:String;   // Адрес электронной почты
               CHPName:String;        // Имя ЧП
               CHPIndN:String;        // Идентификационный код ЧП
               CHPAddr:String;        // Адрес ЧП
               PrintPort:String;      // Порт принтера для печати чеков ЧП
               ShowMCash:Boolean;     // Признак видимости окна сдачи
               ShowRegFull:Boolean;   // Показывать / скрыть полки срок карантин
               EKKAAsPrinter:Boolean; // Принтер вместо кассового аппарата

               NumPortTerminal:Integer;     // Номер СОМ-порта для терминала
               UseTerminal:Boolean;         // Обязательно использовать терминал
               BaudRateTerminal:Longint;    //скорость подключения к терминалу по COM-порту
               TcpIpAddressTerminal:string; //TPC-IP-адрес терминала
               TcpIpPortTerminal:integer;   //TCP-IP порт терминала
               TypeTerminal: byte;          //тип банковского терминала: 0: ECRCommX.ECRLibSgn; 1 - ECRCommX.BPOS1Lib/Comm; 2 - ECRCommX.BPOS1Lib/CommAuto; 3 - ECRCommX.BPOS1Lib/TCP-IP

               EmulEKKA:Boolean;
               NumPortEkran:Integer;
               PlayRolik:Boolean;     // Касса, где проигравается рекламный ролик
               VolumeRolik:Integer;   // Уровень громкости проигрывания ролика
               IsAutoZ:Boolean;       // Автоматичекое снятие Z для отдельных касс
               IPAddrEKKA:String;     // IP-адресс для EKKA MG N707TS
               StartFromApteksInfo:Boolean;
              end;

     TClOptions=Record             // Цветовые параметры
                 Order:TColor;        // Фон активной сортировки в справочнике
                 SklFon:TColor;       // Фон справочника
                 ChFon:TColor;        // Фон чека
                 CodeF:TColor;        // Цвет штрифта поля "Код"
                 NamesF:TColor;       // Цвет штрифта поля "Наименование"
                 OstatF:TColor;       // Цвет штрифта поля "Остаток"
                 CenaF:TColor;        // Цвет штрифта поля "Цена"
                 SklFS:Integer;       // Размер шрифта справочника
                 SklFN:String;        // Шрифт справочника
                 IndicFon:TColor;     // Фон индикатора суммы
                 IndicF:TColor;       // Цвет шрифта индикатора
                 IndicFSkd:TColor;    // Цвет шрифта индикатора со скидкой
                 MinSum:Real;         // Минимальная сумма для цифрового индикатора
                 IndicNoScanF:TColor; // Цвет шрифта индикатора неотсканированных
                 CashSumF:TColor;     // Цвет шрифта поля "Сумма сдачи"
                end;

     TPrParams=Record               // Параметры программы

                UserName:String;      // Имя пользователя
                Login:String;         // Логин пользователя
                Passw:String;         // Пароль пользователя
                UserID:Integer;       // ID пользователя
                ID_Gamma:Integer;     // ID пользователя в общем списке
                AptekaID:Integer;     // Номер аптеки
                IsKurier:Boolean;    // Режим работы программы "Курьер" 240 и 505 IDAptek
                AptekaNameUA:String;  // Название аптеки
                AptekaNameRU:String;  // Название аптеки на русском языке
                AptekaNameLic:String; // Название аптеки как в лицензии
                AptekaDescr:String;   // Название аптеки человеческое
                SkladAdress:String;   // Адрес склада
                AptName:String;       // Название аптеки для загрузки накладных
                UserRole:Integer;     // Права пользователя (может временно изменяться)
                IsZav:Boolean;        // Признак заведующего.
                IsKurator:Boolean;    // Признак куратора-провизора
                IsKuratorApt:Boolean; // Признак куратора-провизора конкретной аптеки
                SafeUserRole:Integer; // Копия прав пользователя (устанавливается один раз!!!)
                PrPath:String;        // Путь к программе
                OptFile:String;       // Главный ini-файл настроек
                Prof:String;          // Имя профиля в ини файле
                StartTime:String;     // Начальное время запрета ночных скидок
                EndTime:String;       // Конечное время запрета ночных скидок
                CR_BEGIN:String;      // Префикс основных дисконтных карточек
                ColorFile:String;     // Файл настроек цветовой палитры
                FirmID:Integer;       // ID фирмы из справочника SprFirms
                FirmNameRU:String;    // Название фирмы по русски
                FirmNameUA:String;    // Название фирмы по украински
                FullFirmNameRU:String;// Название фирмы по русски полностью
                Boss:String;          // Директор фирмы
                BossRod:String;       // Директор фирмы в родительном падеже
                NDS:Boolean;          // Если ли ндс или нет
                TimeZRep:String;      // Время снятия Z-отчета
                SumSkd:Real;          // Сумма чека необходимая для регистрации карточки
                SkdFirst:Boolean;     // Карточка с первой покупки или нет
                VSPriznak:Integer;    // Флаг для возрата по списку
                VSDate:TDateTime;     // Дата текущего файла для возрата по списку
                ZavApteki:String;     // Заведующий аптеки по лицензии
                AptekaSklad:Boolean;  // Признак оптовой аптеки
                KoefZakaz:Integer;
                ServerSertif:String;  // Имя хранилища сертификатов
                TimeOutReadCard:String; // TimeOut обновления данных по дисконтной карте

                MinSkd:Integer;
                MaxSkd:Integer;

                {Полный адрес аптеки}
                aObl:String;          // Область
                aRegion:String;       // Район
                aCity:String;         // Город
                aAdress:String;       // Адрес
                MediID:Integer;       // Код аптеки для MediCard
                ServerKompName:String;// Имя компьютера, который сервер
                RealizMinus:Boolean;  // Разрешить реализацию в минус

                Dobraia:Boolean;      // Признак аптека "Добрая"
                NewGrafik:Boolean;    // Признак нового способа составления графика

                PathMp3:String;       // Папка со звуками
                IsScanAll:Boolean;    // Признак обязательной сканировки
                AdvEnterKol:Boolean;  // Обновленный ввод количества

                Region:Byte;

                IsLogo:Boolean;
                OptCena:Boolean;
                TerminalNew:Boolean;
                FilterSklad:Boolean;  // Режим работы программы, когда наименования свернуты по "сделано из"

                IsPL2Perc:Boolean; // Признак разрешения скидки 2 % в аптеках пластик
                IsCenaZak:Boolean; // Режим когда в справочнике отображается максимальная цена, а чек цены попадают в зависимости от закупки в порядке прихода

                ReklamaOn:String;
                ReklamaOff:String;
                IsSoc:Boolean;

                GrafikUpdateNew:Boolean;
                GrafikUpdateNew1:Boolean;

                MaxCashSum:Currency; // Максимальная сумма остатка в кассе, которая может остаться после инкассации

                IsAutoZ:Boolean;

                IsEnterVideoPassw:Boolean; // Признак, что прграмма запущена по паролю видеонаблюдения

                ConStr:String; // Для хранения строки коннекта через sa

                RollMakeFrom:Boolean; // Флаг отображения справочника свернуто по "Сделано из"
                RegCardFromSMS:Boolean; // Регистрация диск карты через смс

                PeriodRep:Boolean;
                IsNewSrok:Boolean; //Сроки по новому
                IsOneTabInPage:Boolean; // Печать "Уникального предложения" 2 (False) или 1 (True) 1 таблица на странице

                LoginWithOutGrafik:Boolean; // Признак, того что сотрудник отсканировал пальцы, но в программу зашел без смен по графику

                IsOwnerPassw:Boolean; // False введен пароль 05235...

                IsNightCena:Boolean; // Действие ночных цен

                KolOpt:Integer; // Количество дополнительных едениц от которых действует оптовая цена

                IsProxy:Boolean; // Включать или выключать прокси
                IsNewDiscOpt:Boolean; // Признак новой дисконтной программы в "АОЦ"

                { Адрес для шапки в кассовом аппарате }
                eStr1:String;
                eStr2:String;
                eStr3:String;
                eStr4:String;

                baseurl:String;
                userkey:String;
                c_code:String;
                c_username:String;
                c_userpass:String;
                IsReplPhone:Boolean;

                AuthorizedFIO:String;
                AuthorizedDT:TDateTime;
                ShowMenuIcons:Boolean;

                IsKurDostavka:Boolean; // Курьерская доставка через выдычу и внесок

                IsBackAll:Boolean; // Признак, что можно возвращать и партии от поставщиков по любому признаку

                ServerDB:String;    // ip-адрес DB
                ServerS2014:String; // ip-адрес S2014

                ConstrDB:String;    // Строка подключения для сообщений в офис на DB
                ConStrS2014:String; // Строка подключения для сообщений в офис на S2014
                save_kyboard_data:boolean;   //сохранять ли ввод с клавиатуры

                ProxyAdr:String;
                IsLogAll:Boolean;

                Deshevo:Boolean;

                Kurator:String; // Текущий куратор

                ForceEnterCash:Boolean; // Призна принудительного ввода полученных денег от покупателя

                SiteGeptralAPI: string;  //расположение сайта АПИ Гептрал
                TokenGeptral: string; //токен доступа к АПИ Гептрал
                PharmCardGeptral: string; //карта аптеки Гептрал

                r_r1:String; // Расчетный счет
                mfo1:String; // МФО банка 
               end;

     TChekPos=Record   // Параметры позиции чека

               NumbChek:Integer;   // Номер чека
               TypeOplat:Integer;  // Тип оплаты 0 - наличные, 1 - безнал, 4 - чп, 99 - возврат на склад
                                   // при записи в ArhCheks записывается значение TypeOplat+1 !!!
               DopTypeOplat:Integer; // Дополнительный тип оплаты (Для новой почты. В базе поле kassa_num=11 )
               TypeOplatKur:Integer; // kassa_num для аптечного курьера для записи в ArhCheks
               Date:TDateTime;     // Дата
               Kol:Integer;        // Количество
               Kod_Name:Integer;   // Kod_Name
               Art_Code:Integer;   // Art_Code
               Cena:Real;          // Цена
               PSkd:Currency;      // % скидки
               Skd:Currency;       // % скидки позиции (временная переменная)
               Type_Skd:Integer;   // Тип скидки
               ArtName:String;     // Короткое наименование для ArhCheks и Номер накладной для Moves
               Type_Tov:Integer;   // Тип товара
               ID_User:Integer;    // ID пользователя
               ID_Kassa:Integer;   // № кассы
               NumCard:Int64;      // Номер дисконтной карточки
               TypeCardNew:Byte;   // Тип дисконтной программы 0 старая 1 новая
               AccumSum:Currency;  // Накопленная сумма на карточке
               AccumSumChek:Currency;  // Накопленная по чеку
               SumCashToCard:Currency; // Сдача на карту
               SumSpis:Currency;   // Сумма списания по чеку
               SkdMonth:Integer;   // Дополнительная скидка месячная
               SkdNew:Currency;
               IsReg:Boolean;      // Необходимость регистрации карточки
               TypeCard:Integer;   // Тип дисконтной карточки
               SumSkd:Real;        // Сумма скидки на одну позицию
               F_NDS:Integer;      // F_NDS нужен для возвратов
               Priznak:Integer;    // Причина возврата
               BCard:String;       // Номер банковской карточки
               BFIO:String;        // Фамилия покупателя по банковской карточке
               BSkd:Real;          // Скидка для приватбанковских карточек
               TakedSum:Real;      // Сумма полученная от покупателя
               SumChek:Real;       // Сумма чека
               SumOplata:Real;     // Сумма чека
               Vzh:Int64;          // Заводской номер кассового аппарата
               VzhSafe:Int64;      // Заводской номер кассового аппарата
               VzDescr:String;     // Примечание для возвратов
               PrPayRecipt:Byte;   // Признак пробития/непробития рецептурных препаратов
               Iter:Byte;          // Номер прохода цикла
               NPrepChek:Integer;  // Номер предоплатного чека
               SPrepChek:Real;     // Сумма предоплатного чека
               SumSertif:Currency; // Сумма сертификата
               IdRes:Integer;      // ID брони
               IsPayMaster:Boolean;// Признак предоплаты за бронь
               Bonus:Real;         // Сумма бонуса
               BonusAll:Real;      // Сумма Бонусов

               NumCardRecipt:Int64;  // Штрихкод на рецепте
               NumCardStretch:Int64; // Штрихкод стретч карты

               NumCardProf:Int64;  // Штрихкод карты профарма
               NumMediCard:Int64;  // Штрихкод карты Медикард
               NumMDMUCard:Int64;  // Штрихкод карты MDMU

               Pacient:String;     // ФИО пациента для льготных рецептов
               MedName:String;     // Учреждение выдавшее рецепт
               FIODOctor:String;   // ФИО врача
               TypeRecipt:Byte;    // Тип рецепта 1 - бесплатный, 2 - 50%
               NRecipt:String;
               FIODoctor1:String;

               PacientAdr:String;  // Адрес пациента
               NumRecipt:Integer;  // Номер рецепта
               IDMess:Integer;     // Код сообщения для возврата
               TypeChek:Integer;
               Sums:Array[0..15] of Real; // Текуще состояние кассового аппарата
               VzhS:String;
               NumZ:Integer;
               Fn:Int64;
               RealizDay:Currency;
               TypeEKKA:Integer;

               IsPrint:Integer;       // 1 - Режим печати чеков через термопринтер
               IsTerminal:Boolean;    // Оплата по терминалу через компьютер
               InvoiceNum:Integer;    // Номер терминального чека
               Merchant:String;       // Идентификатор эквайера
               RRN:string;            // Номер транзакции
               BankCardNum: string;   // Номер банковской карты
               DateK:TDateTime;       // Дата время кассового аппарата
               B1:Boolean;            // Признак пробивки по Безготiвка.1 (Для 271-x)
               SumAddPerc:Integer;    // Сумма от которой в течении месяца добавляется процент накопления
               NumGeptralCard:String; // Номер карты на скидку на гептрал
               NumKsareltoCard:String;

               NumCardDnepr:Int64;
               SumDnepr:Currency;
               SumSpisDnepr:Currency;
               SumChekRecipt:Currency;
               ResBack:Integer;

               TypeOplata240:Byte;    // Для аптечного курьера признак оплаты kassa_num=2
               IsIApteka:Boolean;

               id_doctor:Integer;
               card_doctor:String;
               id_strah:Integer;      // ИД страховой компании
               name_strah:String;
               Fransh:Currency;       // Франшиза для чеков по страховым компаниям
               IsStrah:Boolean;
               nn_polis:String;
               dt_polis:TDateTime;
               dt_dostav:TDateTime;
               TypeOplatBS:Integer;  // Тип оплаты , который записывается в базу , различается от TypeOplat для форм оплат Безготивка1 и Безготивка3
               MaxSpisSum:Currency;
               SumDopl:Currency;
               Row_id:Integer; // ид для пополнения счета
               CardPref:Int64;
               IsMed:Boolean;
               IsIAptekaCredit:Boolean;
               IsPromo:Boolean;
               PromoStr:Array[0..9] of String[31];
               Row_id_arh:Integer;
               SumKurDost:Currency;
               FranshStr:Currency;
               SumB3:Currency;
              end;


     TFileOst=Record  // Параметры выгружаемого файла

               Num:Integer;
               Name:String;
               Descr:String;
               Requir:Boolean;

              end;

     TGroups=Array of TRadioButton; // Тип список типов товаров

     TThArhBase=class(TThread) // Поток для выгрузки базы и архивации базы
     private

     protected

       procedure Execute; override;

     end;

     TClearDisp=class(TThread) // Поток для выгрузки базы и архивации базы
     private

     protected

       procedure Execute; override;

     end;


     TMainF=class(TForm) // Класс главной формы

       mmMain:TMainMenu;
       miFile:TMenuItem;
       miZakaz:TMenuItem;
       miUnloadFlash:TMenuItem;
       miSendMail:TMenuItem;
       miF2:TMenuItem;
       miExit:TMenuItem;
       miF1:TMenuItem;
       miNakl:TMenuItem;
       miHistory:TMenuItem;
       miService:TMenuItem;
       miArhBase: TMenuItem;
       miS2:TMenuItem;
       miCardInfo:TMenuItem;
       miS3:TMenuItem;
       miUsers:TMenuItem;
       miOptions:TMenuItem;
       miMoveMoney:TMenuItem;
       miZX:TMenuItem;
       miS4:TMenuItem;
       stMain:TStatusBar;
       alMain:TActionList;
       SetOrderArt_Code:TAction;
       SetOrderNames:TAction;
       SetGroup1:TAction;
       SetGroup2:TAction;
       SetGroup3:TAction;
       SetGroup4:TAction;
       SetGroup5:TAction;
       tmrFlushPassw:TTimer;
       pmMain:TPopupMenu;
       miOpenChek:TMenuItem;
       miCloseChek:TMenuItem;
       miChek:TMenuItem;
       miCancelChek:TMenuItem;
       CloseChek:TAction;
       miBlockN:TMenuItem;
       miFixSkd:TMenuItem;
       miP1:TMenuItem;
       miCardSkd:TMenuItem;
       miP2:TMenuItem;
       miFindByName:TMenuItem;
       miFindByCode:TMenuItem;
       miFindEx:TMenuItem;
       miEAN13Info:TMenuItem;
       miOptSum:TMenuItem;
       pnFlash:TPanel;
       lbAlertUnloadFlash:TLabel;
       miUnloadBase:TMenuItem;
       miAddOtkaz:TMenuItem;
       pnUnBase:TPanel;
       lbAlertUnLoadBase:TLabel;
       miOtkaz:TMenuItem;
       miNoScan:TMenuItem;
       miATC1:TMenuItem;
       miP3:TMenuItem;
       miReports:TMenuItem;
       miPrintOst:TMenuItem;
       miLoad:TMenuItem;
       miRepRealiz:TMenuItem;
       miCheckDB:TMenuItem;
       miCheckOst:TMenuItem;
       miCheckSumZ:TMenuItem;
       miOper:TMenuItem;
       miPrev:TMenuItem;
       miBack:TMenuItem;
       SMTP:TIdSMTP;
       IdMessage:TIdMessage;
       pmSkdList:TPopupMenu;
       miSkd2:TMenuItem;
       miSkd3:TMenuItem;
       miSkd4:TMenuItem;
       miSkd5:TMenuItem;
       miSkd6:TMenuItem;
       miSkd7:TMenuItem;
       miSkd10:TMenuItem;
       miSkd15:TMenuItem;
       miSkd20:TMenuItem;
       miSkdSplit:TMenuItem;
       miSkdOther:TMenuItem;
       miSumSkd:TMenuItem;
       odLoad:TOpenDialog;
       miRepKassir:TMenuItem;
       miRep:TMenuItem;
       CopyData:TAction;
       tmWaitComm:TTimer;
       miIncomeBlanks:TMenuItem;
       miAnnot:TMenuItem;
       tmrWaitMess:TTimer;
       miEditReg:TMenuItem;
       miLT:TMenuItem;
       miLTJ:TMenuItem;
       miTable:TMenuItem;
       miCancelV:TMenuItem;
       miObnov:TMenuItem;
       miPeresort:TMenuItem;
       miFNDS1:TMenuItem;
       miFNDS2:TMenuItem;
       miCheckBase:TMenuItem;
       miReg:TMenuItem;
       miPeresortPereuchet:TMenuItem;
       miKolProd:TMenuItem;
       miVozvrPis:TMenuItem;
       miJReoc:TMenuItem;
       miFNDS3:TMenuItem;
       miFNDS4:TMenuItem;
       miUpdate:TMenuItem;
       acK1:TAction;
       miSendMess:TMenuItem;
       acNEKKA:TAction;
       miSpec:TMenuItem;
       miKRO:TMenuItem;
       miChekKurier:TMenuItem;
       miZero:TMenuItem;
       miRepAlf:TMenuItem;
       miRepReg:TMenuItem;
       miMoveTov:TMenuItem;
       miInv:TMenuItem;
       miShowMCash:TMenuItem;
       miNewNameOtkaz:TMenuItem;
       miTerap:TMenuItem;
       miUnloadRealiz:TMenuItem;
       miNoTov:TMenuItem;
       miCenaUp:TMenuItem;
       miScanBox:TMenuItem;
       miObnDate: TMenuItem;
       miNDS1: TMenuItem;
       miNDS2: TMenuItem;
       miNDS3: TMenuItem;
       miNDS4: TMenuItem;
       miPrepChek: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
       miPredst: TMenuItem;
       miPredstKRO: TMenuItem;
       miSktretchChek:TMenuItem;
    N8: TMenuItem;
       tmrUpdateVersion:TTimer;
       miBackToSklad: TMenuItem;
       miProfarma: TMenuItem;
    N1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
       miForProvis:TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
       HTTPRR:THTTPReqResp;
       miHotKeyInfo:TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
       miLTM:TMenuItem;
       miPilottmp:TMenuItem;
       EKKA1:TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
       MDMU1:TMenuItem;
       miOstatInBSklad:TMenuItem;
       N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
       miPilotProj:TMenuItem;
       miChekPilot:TMenuItem;
       tmChekWorkTime:TTimer;
    N22: TMenuItem;
    N23: TMenuItem;
    miPrihTov: TMenuItem;
    N24: TMenuItem;
    miPrihWater: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    tmWaterNakl: TTimer;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    miNedSpis: TMenuItem;
    acCtrlD: TAction;
    N42: TMenuItem;
    miSpisSrok: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    miPrintSertif: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    pnHead: TPanel;
    lbNumCard50: TLabel;
    pnSale: TPanel;
    pnMainTop: TPanel;
    pnSklad: TPanel;
    sbSearchClear: TSpeedButton;
    imSearch: TImage;
    imSearch2: TImage;
    pns3: TPanel;
    Label14: TLabel;
    pns2: TPanel;
    edCntxSearch: TEdit;
    dbgSklad: TDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    edVesh: TEdit;
    pnVesh: TPanel;
    imVesh: TImage;
    edDoz: TEdit;
    edForm: TEdit;
    pnDoz: TPanel;
    imDoz: TImage;
    pnForm: TPanel;
    imForm: TImage;
    pnVesh1: TPanel;
    imVesh1: TImage;
    pnDoz1: TPanel;
    imDoz1: TImage;
    pnForm1: TPanel;
    imForm1: TImage;
    pns0: TPanel;
    lbArt: TLabel;
    pns1: TPanel;
    pns4: TPanel;
    lbCenaUpSkd: TLabel;
    pns5: TPanel;
    lbCenaUp: TLabel;
    pns6: TPanel;
    Label17: TLabel;
    pns7: TPanel;
    Label18: TLabel;
    pns8: TPanel;
    Label19: TLabel;
    pns9: TPanel;
    Label20: TLabel;
    pns10: TPanel;
    Label21: TLabel;
    pns11: TPanel;
    Label22: TLabel;
    pns12: TPanel;
    Label23: TLabel;
    pnsI: TPanel;
    pnse: TPanel;
    dbgFi: TDBGrid;
    pnStatus: TPanel;
    lbSearch: TLabel;
    lbFullName: TLabel;
    Label12: TLabel;
    pbUnLoad: TProgressBar;
    cbFind: TComboBox;
    pnControl: TPanel;
    sbRecipt: TSpeedButton;
    lbCheck: TLabel;
    btnOChek: TBitBtn;
    btnCChek: TBitBtn;
    btPrCennik: TBitBtn;
    btPrnChek: TBitBtn;
    btSumChek: TBitBtn;
    bbReserve: TBitBtn;
    pnSkd: TPanel;
    sbFix: TSpeedButton;
    sbCard: TSpeedButton;
    lbSkdTit: TLabel;
    bvSkd: TBevel;
    lbSkidkaTit: TLabel;
    lbSumTit: TLabel;
    bvSumms: TBevel;
    lbNalTit: TLabel;
    lbAllTit: TLabel;
    lbPercSkd: TLabel;
    bvInfoSkd: TBevel;
    lbDSkdTit: TLabel;
    lbNCard: TLabel;
    lbIndNal: TLabel;
    lbIndSkd: TLabel;
    lbIndAll: TLabel;
    lbPrSkd: TLabel;
    lbNCrd: TLabel;
    lbPerc1: TLabel;
    lbPerc2: TLabel;
    sbSumm: TSpeedButton;
    imAnnot: TImage;
    imNoScan: TImage;
    imRecipt: TImage;
    sbProf: TSpeedButton;
    sbBSkd: TSpeedButton;
    sbMag: TSpeedButton;
    imAvto: TImage;
    sbMediCard: TSpeedButton;
    sbMDMU: TSpeedButton;
    lbMB: TLabel;
    lbMBInfo: TLabel;
    sbGoldG: TSpeedButton;
    sbMDMU1: TSpeedButton;
    lbTime: TLabel;
    imFind: TImage;
    Image1: TImage;
    cbFixSkd: TComboBox;
    stPercSkd: TStaticText;
    tmpButton: TButton;
    tmChek: TButton;
    lbDate: TDateTimePicker;
    splMain: TSplitter;
    pnMainBottom: TPanel;
    pnChek: TPanel;
    dbgChek: TDBGrid;
    pnShowSumm: TPanel;
    imCash: TImage;
    pnIndicator: TPanel;
    ImIndicator: TImage;
    lbChek: TStaticText;
    pnCash: TPanel;
    sb1: TSpeedButton;
    sb2: TSpeedButton;
    sb5: TSpeedButton;
    sb10: TSpeedButton;
    sb20: TSpeedButton;
    sb200: TSpeedButton;
    sbClear: TSpeedButton;
    sb50: TSpeedButton;
    sb100: TSpeedButton;
    sb500: TSpeedButton;
    lbOtPOkup: TLabel;
    edCash: TEdit;
    lbSumCash: TStaticText;
    lbCash: TStaticText;
    btnPayCash: TBitBtn;
    pnWrkEKKA: TPanel;
    pnLogEKKA: TPanel;
    lbState: TLabel;
    sbOpenPort: TSpeedButton;
    sbClosePort: TSpeedButton;
    cbEKKA: TCheckBox;
    meEKKA: TMemo;
    pnInfoEKKA: TPanel;
    imEKKA: TImage;
    bbReadEKKA: TBitBtn;
    lbFactoryNum: TStaticText;
    lbRegNom: TStaticText;
    lbFirma: TStaticText;
    lbKassirIsReg: TStaticText;
    lbKeyPos: TStaticText;
    lbIsObnulen: TStaticText;
    lbNomerLastZ: TStaticText;
    lbNomberLastChek: TStaticText;
    lbFiskDate: TStaticText;
    lbFiskTime: TStaticText;
    stFiskTime: TStaticText;
    stFiskDate: TStaticText;
    stNomberLastChek: TStaticText;
    stNomerLastZ: TStaticText;
    stIsObnulen: TStaticText;
    stKeyPos: TStaticText;
    stKassirIsReg: TStaticText;
    stFirma: TStaticText;
    stRegNom: TStaticText;
    stFactoryNum: TStaticText;
    lbVersion: TStaticText;
    lbMoney: TStaticText;
    stMoney: TStaticText;
    stDtVersion: TStaticText;
    stVersion: TStaticText;
       lbDtVersion: TStaticText;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
       pnWrEKKA: TPanel;
       lbLogo: TLabel;
       sbPath: TSpeedButton;
       edLogoEKKA: TEdit;
       pnLogoEKKA: TPanel;
       imLogoEKKA: TImage;
       bbLoadLogo: TBitBtn;
       pnEditEKKA: TPanel;
       lbNumStr: TLabel;
       lbNumDay: TLabel;
       bvServLim: TBevel;
       bbServLim: TBitBtn;
       edKolStr: TEdit;
       edKolDay: TEdit;
       bbTermEKKA: TBitBtn;
       bbForceCloseCash: TBitBtn;
       bbForceCloseChek: TBitBtn;
       btnSetStr: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
       edFN: TEdit;
       edPN: TEdit;
       edID: TEdit;
       edHead: TEdit;
       edStr1: TEdit;
       edStr2: TEdit;
       edStr3: TEdit;
       edStr4: TEdit;
       btnReadStr: TBitBtn;
       edKassaTxt: TEdit;
    BitBtn1: TBitBtn;
       btReadTxt: TButton;
    ProgressBar1: TProgressBar;
       tmpButton2: TButton;
    Button1: TButton;
       imSale: TImage;
       imEK: TImage;
       cbBoxZero: TCheckBox;
       imStop: TImage;
       imStar: TImage;
       imFR: TImage;
       imInf: TImage;
       imBr: TImage;
       imExit: TImage;
       imHist: TImage;
    imIZak: TImage;
    N55: TMenuItem;
    N56: TMenuItem;
       PlServer:TIdTCPServer;
    Pclient: TIdTCPClient;
    N57: TMenuItem;
    tmPlay: TTimer;
    pnBlChek: TPanel;
    Label11: TLabel;
    pnUp: TPanel;
    dbgUp: TDBGrid;
    pnDown: TPanel;
    dbgDown: TDBGrid;
    pnSop: TPanel;
    dbgSop: TDBGrid;
    imSop: TImage;
    Label5: TLabel;
    Label13: TLabel;
    Shape1: TShape;
    imDown: TImage;
    Shape2: TShape;
    imUp: TImage;
    Shape3: TShape;
    Label3: TLabel;
    Label15: TLabel;
    lbPrice: TLabel;
    lbApt: TLabel;
    bbWhereIs: TBitBtn;
    lbSkl: TLabel;
    BitBtn5: TBitBtn;
    sbUp: TSpeedButton;
    sbDown: TSpeedButton;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Button3: TButton;
    Action1: TAction;
    N58: TMenuItem;
    tmStr: TTimer;
    DBText1_: TDBText;
    DBText2: TDBText;
    tmAlarm: TTimer;
    Shape4: TShape;
    N59: TMenuItem;
    N60: TMenuItem;
    miNonCashRecipt: TMenuItem;
    N61: TMenuItem;
    sbFix10: TSpeedButton;
    N62: TMenuItem;
    lbnmCap: TLabel;
    cbExt: TCheckBox;
    pbDown: TPaintBox;
    pbUp: TPaintBox;
    pbSop: TPaintBox;
    N63: TMenuItem;
    BitBtn2: TBitBtn;
    BitBtn8: TBitBtn;
    N64: TMenuItem;
    N210: TMenuItem;
    N65: TMenuItem;
    N66: TMenuItem;
    N67: TMenuItem;
    N68: TMenuItem;
    SpeedButton2: TSpeedButton;
    imCompend: TImage;
    tmFlash: TTimer;
    pns13: TPanel;
    Label16: TLabel;
    N69: TMenuItem;
    N70: TMenuItem;
    btnPayChek: TBitBtn;
    N71: TMenuItem;
    N72: TMenuItem;
    Label25: TLabel;
    lbNextDateTov: TLabel;
    N73: TMenuItem;
    N74: TMenuItem;
    N75: TMenuItem;
    N76: TMenuItem;
    N13: TMenuItem;
    Extempore1: TMenuItem;
    pnExt: TPanel;
    lbExt: TLabel;
    N77: TMenuItem;
    N78: TMenuItem;
    N79: TMenuItem;
    N80: TMenuItem;
    Medicard1: TMenuItem;
    N81: TMenuItem;
    N82: TMenuItem;
    miRolik: TMenuItem;
    N83: TMenuItem;
    N84: TMenuItem;
    AVA1: TMenuItem;
    imSklad: TImage;
    imWait: TImage;
    N85: TMenuItem;
    N86: TMenuItem;
    N87: TMenuItem;
    N88: TMenuItem;
    sbiApt: TSpeedButton;
    lbNamesUA: TLabel;
    N89: TMenuItem;
    sbDoctor: TSpeedButton;
    N90: TMenuItem;
    N91: TMenuItem;
    N92: TMenuItem;
    N93: TMenuItem;
    imNotV: TImage;
    N94: TMenuItem;
    N95: TMenuItem;
    N96: TMenuItem;
    N97: TMenuItem;
    N98: TMenuItem;
    BitBtn9: TBitBtn;
    N99: TMenuItem;
    N100: TMenuItem;
    N101: TMenuItem;
    miInsuranceInformation: TMenuItem;
    N102: TMenuItem;
    miQuarantine: TMenuItem;
    Label26: TLabel;
    lbMaxSumSpis: TLabel;
    cbIsSpisAllOnly: TCheckBox;
    N104: TMenuItem;
    N105: TMenuItem;
    N106: TMenuItem;
    miClaimes: TMenuItem;
    N103: TMenuItem;
    N107: TMenuItem;
    sbBaer: TSpeedButton;
    N108: TMenuItem;
    miFarmZamAndSoputstv: TMenuItem;
    N109: TMenuItem;
    miMesHranSrok: TMenuItem;
    miStickerForBox: TMenuItem;
    N110: TMenuItem;
    N111: TMenuItem;
    BitBtn10: TBitBtn;
    N112: TMenuItem;
    N113: TMenuItem;
    imNPT: TImage;

       procedure FormActivate(Sender:TObject);
       procedure miUsersClick(Sender:TObject);
       procedure FormCreate(Sender:TObject);
       procedure miExitClick(Sender:TObject);
       procedure FormResize(Sender:TObject);
       procedure cbBoxZeroClick(Sender:TObject);
       procedure SetOrderArt_CodeExecute(Sender:TObject);
       procedure SetOrderNamesExecute(Sender:TObject);
       procedure dbgSkladKeyPress(Sender:TObject; var Key:Char);
       procedure dbgSkladKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
       procedure btnOChekClick(Sender:TObject);
       procedure btnCChekClick(Sender:TObject);
       procedure dbgSkladDblClick(Sender:TObject);
       procedure tmrFlushPasswTimer(Sender:TObject);
       procedure FormClose(Sender:TObject; var Action:TCloseAction);
       procedure sbFixClick(Sender:TObject);
       procedure sbCardClick(Sender:TObject);
       procedure cbFixSkdChange(Sender:TObject);
       procedure dbgChekKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
       procedure dbgChekDblClick(Sender:TObject);
       procedure cbEKKAClick(Sender:TObject);
       procedure miCancelChekClick(Sender:TObject);
       procedure miCloseChekClick(Sender:TObject);
       procedure miChekClick(Sender:TObject);
       procedure dbgSkladDrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
       procedure dbgChekDrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
       procedure CloseChekExecute(Sender:TObject);
       procedure miBlockNClick(Sender:TObject);
       procedure miFixSkdClick(Sender:TObject);
       procedure miCardSkdClick(Sender:TObject);
       procedure miOptionsClick(Sender:TObject);
       procedure miMoveTovClick(Sender:TObject);
       procedure miCheckOstClick(Sender:TObject);
       procedure dbgSkladTitleClick(Column: TColumn);
       procedure dbgChekKeyPress(Sender:TObject; var Key:Char);
       procedure edCashChange(Sender:TObject);
       procedure edCashKeyPress(Sender:TObject; var Key:Char);
       procedure sb1Click(Sender:TObject);
       procedure sbClearClick(Sender:TObject);
       procedure miZXClick(Sender:TObject);
       procedure miEAN13InfoClick(Sender:TObject);
       procedure miUnloadFlashClick(Sender:TObject);
       procedure miCheckSumZClick(Sender:TObject);
       procedure miHistoryClick(Sender:TObject);
       procedure cbFindCloseUp(Sender:TObject);
       procedure cbFindEnter(Sender:TObject);
       procedure cbFindExit(Sender:TObject);
       procedure cbFindKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
       procedure miFindExClick(Sender:TObject);
       procedure miOptSumClick(Sender:TObject);
       procedure miUnloadBaseClick(Sender:TObject);
       procedure miZakazClick(Sender:TObject);
       procedure miAddOtkazClick(Sender:TObject);
       procedure miMoveMoneyClick(Sender:TObject);
       procedure miCardInfoClick(Sender:TObject);
       procedure btPrCennikClick(Sender:TObject);
       procedure miOtkazClick(Sender:TObject);
       procedure miNoScanClick(Sender:TObject);
       procedure miATC1Click(Sender:TObject);
       procedure miPrintOstClick(Sender:TObject);
       procedure miLoadClick(Sender:TObject);
       procedure miRepRealizClick(Sender:TObject);
       procedure miPrevClick(Sender:TObject);
       procedure miBackClick(Sender:TObject);
       procedure miSendMailClick(Sender:TObject);
       procedure sbSummClick(Sender:TObject);
       procedure btPrnChekClick(Sender:TObject);
       procedure btSumChekClick(Sender:TObject);
       procedure miSkd2Click(Sender:TObject);
       procedure miSkdOtherClick(Sender:TObject);
       procedure miSumSkdClick(Sender:TObject);
       procedure sbClosePortClick(Sender:TObject);
       procedure sbOpenPortClick(Sender:TObject);
       procedure sbPathClick(Sender:TObject);
       procedure bbLoadLogoClick(Sender:TObject);
       procedure tmpButtonClick(Sender:TObject);
       procedure bbReadEKKAClick(Sender:TObject);
       procedure miRepKassirClick(Sender:TObject);
       procedure miRepClick(Sender:TObject);
       procedure FormDestroy(Sender:TObject);
       procedure CopyDataExecute(Sender:TObject);
       procedure tmWaitCommTimer(Sender:TObject);
       procedure miIncomeBlanksClick(Sender:TObject);
       procedure bbServLimClick(Sender:TObject);
       procedure edKolStrKeyPress(Sender:TObject; var Key:Char);
       procedure bbTermEKKAClick(Sender:TObject);
       procedure miArhBaseClick(Sender:TObject);
       procedure miAnnotClick(Sender:TObject);
       procedure lbHistoryMouseLeave(Sender:TObject);
       procedure lbHistoryMouseEnter(Sender:TObject);
       procedure miEditRegClick(Sender:TObject);
       procedure lbHistoryClick(Sender:TObject);
       procedure miLTClick(Sender:TObject);
       procedure miTableClick(Sender:TObject);
       procedure miCancelVClick(Sender:TObject);
       procedure miPeresortClick(Sender:TObject);
       procedure miFNDS1Click(Sender:TObject);
       procedure miCheckBaseClick(Sender:TObject);
       procedure miRegClick(Sender:TObject);
       procedure miPeresortPereuchetClick(Sender: TObject);
       procedure miKolProdClick(Sender: TObject);
       procedure btReadTxtClick(Sender: TObject);
       procedure FormShow(Sender: TObject);
       procedure miVozvrPisClick(Sender: TObject);
       procedure imHistoryDblClick(Sender: TObject);
       procedure bbForceCloseCashClick(Sender:TObject);
       procedure bbForceCloseChekClick(Sender:TObject);
       procedure CheckBox1Click(Sender: TObject);
       procedure miJReocClick(Sender: TObject);
       procedure miUpdateClick(Sender: TObject);
       procedure acK1Execute(Sender: TObject);
       procedure miSendMessClick(Sender: TObject);
       procedure lbNewMessMouseEnter(Sender: TObject);
       procedure lbNewMessMouseLeave(Sender: TObject);
       procedure lbNewMessClick(Sender: TObject);
       procedure tmpButton2Click(Sender: TObject);
       procedure acNEKKAExecute(Sender: TObject);
       procedure miSpecClick(Sender: TObject);
       procedure miKROClick(Sender: TObject);
       procedure miChekKurierClick(Sender: TObject);
       procedure miRepAlfClick(Sender: TObject);
       procedure miInvClick(Sender: TObject);
       procedure miShowMCashClick(Sender: TObject);
       procedure tmChekClick(Sender: TObject);
       procedure miTerapClick(Sender: TObject);
       procedure miUnloadRealizClick(Sender: TObject);
       procedure miNoTovClick(Sender: TObject);
       procedure sbProfClick(Sender: TObject);
       procedure miCenaUpClick(Sender: TObject);
       procedure miScanBoxClick(Sender: TObject);
       procedure miNDS1Click(Sender: TObject);
       procedure miPrepChekClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
       procedure bbReserveClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
       procedure miPredstClick(Sender: TObject);
       procedure miPredstKROClick(Sender: TObject);
       procedure btnReadStrClick(Sender: TObject);
       procedure btnSetStrClick(Sender: TObject);
       procedure sbMagClick(Sender: TObject);
       procedure sbReciptClick(Sender: TObject);
       procedure miSktretchChekClick(Sender: TObject);
       procedure tmrUpdateVersionTimer(Sender: TObject);
       procedure miBackToSkladClick(Sender: TObject);
       procedure miProfarmaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
       procedure sbMediCardClick(Sender:TObject);
    procedure N1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
       procedure edPercShowChange(Sender:TObject);
    procedure N9Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
       procedure sbMDMUClick(Sender: TObject);
       procedure miHotKeyInfoClick(Sender:TObject);
    procedure N14Click(Sender: TObject);
       procedure sbBSkdClick(Sender:TObject);
       procedure sbGoldGClick(Sender:TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
       procedure miLTMClick(Sender: TObject);
       procedure miPilottmpClick(Sender: TObject);
       procedure EKKA1Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure MDMU1Click(Sender: TObject);
       procedure miOstatInBSkladClick(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
       procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
       procedure miChekPilotClick(Sender: TObject);
       procedure tmChekWorkTimeTimer(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
       procedure miPrihTovClick(Sender: TObject);
    procedure N24Click(Sender: TObject);
       procedure miPrihWaterClick(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
       procedure tmWaterNaklTimer(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
       procedure miNaklClick(Sender: TObject);
       procedure miNedSpisClick(Sender: TObject);
       procedure acCtrlDExecute(Sender: TObject);
    procedure N42Click(Sender: TObject);
       procedure miSpisSrokClick(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
       procedure miLTJClick(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
       procedure edCntxSearchChange(Sender: TObject);
       procedure edCntxSearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
       procedure sbSearchClearClick(Sender: TObject);
       procedure edCntxSearchExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
       procedure miPrintSertifClick(Sender: TObject);
       procedure imFindClick(Sender: TObject);
       procedure imVeshClick(Sender: TObject);
       procedure edVeshEnter(Sender: TObject);
       procedure edVeshExit(Sender: TObject);
       procedure edVeshChange(Sender: TObject);
       procedure dbgFiExit(Sender: TObject);
       procedure edVeshKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
       procedure dbgFiKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
       procedure dbgFiCellClick(Column: TColumn);
       procedure imVesh1Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
      procedure pns2Click(Sender: TObject);
      procedure lbArtClick(Sender: TObject);
    procedure N53Click(Sender: TObject);
    procedure N54Click(Sender: TObject);
    procedure N55Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure PlServerExecute(AThread: TIdPeerThread);
    procedure Button2Click(Sender: TObject);
    procedure PlServerOpenChekCommand(ASender: TIdCommand);
    procedure N57Click(Sender: TObject);
    procedure tmPlayTimer(Sender: TObject);
    procedure dbgSkladKeyUp(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure dbgUpDblClick(Sender: TObject);
    procedure splMainMoved(Sender: TObject);
    procedure dbgSkladCellClick(Column: TColumn);
    procedure BitBtn5Click(Sender: TObject);
    procedure sbUpClick(Sender: TObject);
    procedure sbDownClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure dbgUpDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgUpMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tmStrTimer(Sender: TObject);
    procedure tmAlarmTimer(Sender: TObject);
    procedure N59Click(Sender: TObject);
    procedure N60Click(Sender: TObject);
    procedure miNonCashReciptClick(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure sbFix10Click(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure cbExtClick(Sender: TObject);
    procedure N63Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure N64Click(Sender: TObject);
    procedure N210Click(Sender: TObject);
    procedure N65Click(Sender: TObject);
    procedure N66Click(Sender: TObject);
    procedure N68Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure N70Click(Sender: TObject);
    procedure N71Click(Sender: TObject);
    procedure N72Click(Sender: TObject);
    procedure lbNCrdClick(Sender: TObject);
    procedure N73Click(Sender: TObject);
    procedure N74Click(Sender: TObject);
    procedure btnPayCashClick(Sender: TObject);
    procedure N75Click(Sender: TObject);
    procedure N76Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure miForProvisClick(Sender: TObject);
    procedure Extempore1Click(Sender: TObject);
    procedure dbgChekCellClick(Column: TColumn);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure N77Click(Sender: TObject);
    procedure pnsIClick(Sender: TObject);
    procedure N79Click(Sender: TObject);
    procedure N80Click(Sender: TObject);
    procedure Medicard1Click(Sender: TObject);
    procedure btnPayChekClick(Sender: TObject);
    procedure miRolikClick(Sender: TObject);
    procedure N83Click(Sender: TObject);
    procedure N84Click(Sender: TObject);
    procedure AVA1Click(Sender: TObject);
    procedure N85Click(Sender: TObject);
    procedure N86Click(Sender: TObject);
    procedure N87Click(Sender: TObject);
    procedure N88Click(Sender: TObject);
    procedure sbiAptClick(Sender: TObject);
    procedure N89Click(Sender: TObject);
    procedure N90Click(Sender: TObject);
    procedure N92Click(Sender: TObject);
    procedure N93Click(Sender: TObject);
    procedure N94Click(Sender: TObject);
    procedure N95Click(Sender: TObject);
    procedure N96Click(Sender: TObject);
    procedure N98Click(Sender: TObject);
    procedure N99Click(Sender: TObject);
    procedure N100Click(Sender: TObject);
    procedure miInsuranceInformationClick(Sender: TObject);
    procedure N102Click(Sender: TObject);
    procedure miQuarantineClick(Sender: TObject);
    procedure cbIsSpisAllOnlyClick(Sender: TObject);
    procedure N104Click(Sender: TObject);
    procedure N105Click(Sender: TObject);
    procedure N106Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure miClaimesClick(Sender: TObject);
    procedure N103Click(Sender: TObject);
    procedure N107Click(Sender: TObject);
    procedure sbBaerClick(Sender: TObject);
    procedure miFarmZamAndSoputstvClick(Sender: TObject);
    procedure miMesHranSrokClick(Sender: TObject);
    procedure miStickerForBoxClick(Sender: TObject);
    procedure N110Click(Sender: TObject);
    procedure tmrWaitMessTimer(Sender: TObject);
    procedure N111Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure N113Click(Sender: TObject);

     private

       FEx:Boolean;
       FSprOrder:Integer;
       FChekOpened:Boolean;
       FIsCHP:Boolean;
       FType_Skd:Integer;
       FPercentSkd:Real;
       FSafePercentSkd:Real;
       FSumSkd:Real;          // Сумма скидки по чеку
       FIsOgrSkd:Boolean;     // Есть ограничение на процент скидки в чеке
       FAccumSumChek:Currency;    // Сумма накопления по чеку
       FSumCashToCard:Currency; // Сумма сдачи для зачисления на карточку
       FSumChek:Real;         // Сумма чека БЕЗ скидки
       FNumCard:Int64;
       FTypeCard:Integer;
       FChangeUser:Boolean;
       FLastError:String;
       FPayCount:Integer;
       FPayWork:Boolean;
       FChpChek:TStringList;
       FFlagW:Boolean;
       FCanExecCom:Boolean;
       FApplDateTime:TDateTime;
       FIP:String;
       FDesign:Boolean;
       FMistake:Boolean;
       FMistakes:TByteSet;
       FChekEmpty:Boolean;
       FArtCh:Byte;
       FNonClosed:Boolean;
       FIsStart:Boolean;
       FUseEKKASafe:Boolean;
       FIsSkdDop:Boolean;
       FTypeChek:Integer;
       FIsFozzy:Boolean;
       FIsDop7:Boolean;
       FIsFirstShowMess:Boolean;
       FNPChek:Integer;
       FSumPChek:Real;
       FSumSertif:Currency;
       FSumMomBaby:Currency;
       FMedName:String;
       FDtRecipt:TDateTime;
       FIsDopl:Byte;
       FPacient:String;
       FIDRES:Integer;
       FIsPayMaster:Boolean;
       FIsIAptekaCredit:Boolean;
       FTypeRes:Byte;
       FIsRegCard:Boolean;
       FNumCardMag:Int64;
       FNumCardProf:Int64;
       FNumMediCard:Int64;
       FNumMDMUCard:Int64;
       FNumCardRecipt:Int64;
       FNumCardStretch:Int64;
       FIsOneRegCard:Boolean;
       FIsSkd7:Boolean;
       FIsDay:Boolean;
       FForReserve:Boolean;
       FSkdCalced:Boolean;
       FEnterKol:Boolean;
       mVF:TVozrForm;
       MDMU221TypeCard:Byte;
       FCloseFirst:Byte;
       FNPSvid:String;
       FFlagPilot:Boolean;
       FFlagInsulin:Boolean;
       FCheckOpening:Boolean;
       FNReestrSrok:Byte;
       FNewVersion: Boolean;
       FBlockingChek:Boolean;
       FStartApp:Boolean;
       FIsMaximized:Boolean;
       FStNumCard:Int64;
       FfVesh:String;
       FfForm: String;
       FfDoz: String;
       FIsResize:Boolean;
       FErrConMain:Boolean;
       FSum99:Real;
       FFullSprTov:Boolean;
       DtLogin:TDateTime;
       FTypeCardNew: Byte;
       FAccumSum:Currency;
       FSafeSumCashToCard:Currency;
       FSafeSumSpis:Currency;
       FSkdMonth:Integer;
       FIsQCard:Boolean;
       FMaxIDRES:Integer;
       FGettingPercentSkd:Boolean;
       FIsKeyDown:Boolean;
       FMouseWheeling:Boolean;
       FTopCurrentLine:Integer;
       FCanShowingKonkurHint:Boolean;
       FIsTerminal:Boolean;
       FNumGeptralCard:String;
       FNumKsareltoCard:String;
       FNumZakaz:Integer;
       FPhone:String;
       FNumCardDnepr:Int64;
       FSumDnepr:Currency;
       FFlagProh:Boolean;
       FNRecipt:String;
       FFIODoctor:String;
       FFIODoctor1:String;
       FTypeRecipt:Byte;
       FSumChekRecipt:Currency;
       pnExtemp:TExtPanel;
       pnExtemp1:TPanel;
       lbExtemp:TLabel;
       bbExtemp:TBitBtn;
       FCopyChek:Boolean;
       FarFilter:TStrArray;
       FLastNumbRecipt:Integer;
       FEp:TEnterParam;
       FCntZakaz: Integer;
       Fid_doctor:Integer;
       Fid_doctorAll:Integer;
       Fcard_doctor:String;

       Fid_doctorA:Integer;
       FTypeZakaz:Integer;
       Fcard_doctorA:String;

//       Fid_strah:Integer;
//       FName_Strah:String;
//       Fnn_polis:String;
//       FNumOrder:String;
//       Fdt_polis:TDateTime;
//       Ffransh:Currency;
//       FFIOStrah:String;
//       FPhoneStrah:String;
//       FTypeDostStrah:Byte;
//       FSumFransh:Currency;
       FSumDopl:Currency;
       FMaxSpisSum:Currency;
       FsArt_Code:Integer;
       FsKol1:Integer;
       FsKol2:Integer;
       FIsKurDostMakeOut:Boolean;
       FIDRes_Kur:Integer;
       FOrderID:Integer;
       FIsNumCardSMS:Boolean;
       FIsBirth:Byte;
       FRRN: string;
       FBankCard: string;

       curr_data:AnsiString;    //сохраняем сюда текущий ввод
       date_begin:TDateTime;    //дата и время начала записи текущего ввода(обновляется при пробитии чека)
       FGeptralPatientPrice: double; //цена для продажи после обработки АПИ Гептрал

       //параметры запроса к АПИ Гептрал
       request_DrugCode: string;
       request_Distributor: SmallInt;
       request_PharmPrice: double;
       request_Amount: integer;
       art_code: integer;


       procedure AppMessage(var Msg:TMsg; var Handled:Boolean);
       procedure InitChek;
       procedure InitFixSkd;
       procedure InitEKKA;
       procedure SetOrder(V:Integer);
       procedure RefreshChek;
       procedure SetVisWhenChekOpened(V:Boolean);
       procedure ClearChekFull(Param:Integer);
       procedure PrevEnterKol(Param:Integer; IsFirstRec:Integer; ArtCode:Integer);
       procedure PrevDelKol;
       procedure SetIsCHP;
       procedure SetSumChek(V:Real);
       procedure SetType_Skd(V:Integer);
       procedure SetNumCard(V:Int64);
       procedure SwitchSkd(sb,mi:TObject);
       procedure StartCamera(Param:Integer);
       procedure EscFind;
       procedure UnLoadToFlash(P:Integer);
       procedure PrepareBase;
       procedure InitColors;
       procedure InitPanels;
       procedure CopyArh(Path:String);
       procedure SetPercentSkd(V:Real);
       procedure InitFields;
       procedure InitFonts;
       procedure ShowPKUInfo(Art_Code:Integer; P:Byte=0);
       procedure UnLoadArhBase;
       procedure InitAnnotList;
       procedure InitIP;
       procedure SetVolume;
       procedure SetMistake(const Value:Boolean);
       procedure CopyTextLog(Path:String);
       procedure MakePeresort(P:Byte);
       procedure InitScripts;
       procedure GetNumCardDialog(var NumCard:Int64; var TypeCard:Integer; var TC:Byte; var AccumSum,SpSum:Currency; CheckOnly:Boolean; var IsBirth:Byte);
       procedure CheckTimeZRep;
       procedure SetSkdMag(Sender:TObject; B:Boolean);
       procedure UpdateVersion(Path,FName:String; FDt:TDateTime);
       procedure PrintTodayZeroRep(P:Byte);
       procedure SetMediCardSkd;

//       procedure PrintBlankForRegMBCard(CR:TCardInfo);
       procedure WMHotKey(var Msg:TWMHotKey); message WM_HOTKEY;
       procedure AddToOstat(AC:Integer; Ostat:Integer);
       procedure SaveFilesFromMess;
       procedure SetBlockingChek(V:Boolean);
       procedure PrepareList(CB:TComboBox);
       procedure ActivateFi(ed:TEdit; V:Boolean);
       procedure DoneFi(P:Byte);
       procedure ResizePnFi;
       procedure LoadLogo;
       procedure pnTbClick(Sender:TObject);
       procedure ExitClick(Sender:TObject);
       procedure CheckShowngUpDownAnalogs;
       procedure ShowForATC(qr:TADOQuery; P:Byte; P1:Byte=0; P2:Byte=0);
       procedure ShowZPMess;
       procedure FlashWhenZero;
       procedure FlashImage(Pb: TPaintBox; Cnt: Integer; Caption: String);
       procedure ShowIndic(S:String);
       procedure PrintSertifOld(Art_code: Integer);
       procedure miCompend(Sender: TObject);
       procedure ShowDatePrih;
       procedure CheckRaznCena(ArtCode:Integer);
       procedure pnExtMouseLeave(Sender:TObject);
       procedure bbExtClick(Sender:TObject);
       procedure ShowStartInfo(Silent:Byte=0);
       procedure InitProxy;
       procedure ShowReklamaMess;
       procedure ShowNotMarkedBack(Sender:TObject);
       procedure ShowNotPassedTests(Sender:TObject);
       procedure SetMaxSpisSum(const Value:Currency);
       procedure WaitMessTimer;

       function  CancelChek(P:Byte=0):Boolean;
       function  GetSumChekFull:Real;
       function  CheckStrNum(S:String):Boolean;
       function  CheckScan(var Pers:String):Boolean;
       function  UnLoadFile(P:Integer; Path:String):Boolean;
       function  CheckUnLoad(Path:String):String;
       function  GetBonusPerc(NC:Int64):Real;
       function  GetVzhNum:Int64;
       function  GetPercentSkd:Real;
       function  GetBaseCHP:Boolean;
       function  GetBaseFileName:String;
       function  CheckNightSkdTime:Boolean;
       function  GetBegPeriod:TDateTime;
       function  GetEndPeriod:TDateTime;
       function  CheckOnlyRecipt(Art_Code:Integer; Names:String; Kol:Integer):Boolean;
       function  CheckKolUpak(Kol:Integer; var S:String):Boolean;
       function  GetIsKiosk:Boolean;
       function  GetKolArtAdd(Art_Code:Integer; var KolAdd,ArtAdd:Integer; P:Integer=0):Boolean;
       function  GetPercForPrice:Byte;
       function  UnLoadFor271(D1,D2:TDateTime; Path:String):String;
       function  IsCanRegMomBabyCard:Boolean;
       function  MDMUCheckLogin:Boolean;

       function  PayChek(TypeOplat:Integer; P:Byte=0; Param2:Byte=0):Boolean;

       function  CheckTypeMDMU:Integer;
       function  GetMDMSkd(AC:Integer; Upak:Integer; Kol,Cena:Currency):Real;
       function  MDMUSendRealiz(CP:TChekPos):Boolean;
       function  GetMaxSkd:Real;
       function  GetIsNewPrih:Boolean;
       function  CheckSmena:Boolean;
       function  GetGroupIndex:Integer;
       function  GetFullSprTov:Boolean;
       function  GetIsFiltered:Boolean;
       function  ChooseTov(var Kol,Art_Code:Integer):Boolean;
       function  UnLoad(SQL,FName,FServName:String):String;
       function  GetOstatEd:Integer;

       function  GetKolFromDialogAdv(Names:String; DefKol:Integer; var Ep:TEnterParam; Param:Byte=0):Integer;

       function  GetBrend:Integer;
       function  OtkazZero:Boolean;
       function  ChooseTovFrom(var AC:Integer):Boolean;
       function  GetNmFilter:String;
       function  CheckArtAkciiAdd(Art:Integer; var Ep:TEnterParam):Boolean;
       function  GetAddress:String;
       function  GetNumMediCard(Nm:Int64):String;
       function  MediCardError(err:String):Boolean;

       function GetGeptralChek(Sender: TObject; const request_project_id: byte; const request_operation: byte): boolean;

     public

       Fid_strah:Integer;
       FName_Strah:String;
       Fnn_polis:String;
       FNumOrder:String;
       Fdt_polis:TDateTime;
       Ffransh:Currency;
       FFIOStrah:String;
       FPhoneStrah:String;
       FTypeDostStrah:Byte;
       FSumFransh:Currency;
       FStrahIsReadOnly: boolean;
       FlIsStrah: byte;

       FArtCodeList:Array of TArtCode;
       FIsChSeria:Boolean;
       pnBar1:TsvBar;
       pnBarSale:TsvBar;
       pnBarDop:TsvBar;

       procedure FilterSklad(P:Byte=0);           // Показ товаров из справочника в зависимости от типа и сортировки
       procedure ShowIndicator(Sum:Currency);     // Показ суммы кристалическим шрифтом
       procedure ShowStatus(S:String); overload;  // Показ текста в строке статус в ячейке 3
       procedure ShowStatus(S:String; N:Integer); overload; // Показ текста в строке статус в указанной ячейке
       procedure dbGKeyPress(db:TDBGrid; var Key:Char; var sSr:String; Order,P,Kol:Integer;  var IsFind:Boolean);
       procedure SendMail;
       procedure ShowErrorEKKA(Res:Boolean);
       procedure UnLoadFiles(Path:String);
       procedure ShowEAN13(Source:TDataSet);
       procedure ClearChekOnly(UserID:Integer);
       procedure PrintObnov(F_NDS:Integer; Gr:Integer=-1; dtDate:TDateTime=0);
       procedure PrintObnovDate(F_NDS:Integer);
       procedure MakeVZKarantin(Param:Byte=0);
       procedure ShowAnnotation(Art_code:Integer; Param:Byte=0);
       procedure PrintSertif(Art_code:Integer);
       procedure ShowTovInfo(Art_Code:Integer; Names:String; Upak:Integer; P:Byte; Art_Origin:Integer);
       procedure ClearFilters;
       procedure ShowMovTov(Art_Code: Integer; Names: String);
       procedure ReopenChek;
       procedure srSprTovDataChange(Sender: TObject; Field: TField);
       procedure InitTerminal;
       procedure CheckReocEndReg;
       procedure PrintBlankForRegCard(FB:TForBack);
       procedure dbgSkladSetFocused;
       procedure RegisterError(Caption,EMessage:String; Silent:Boolean=False);
       procedure RegArtZamena(var Ep:TEnterParam);
       procedure OpenChek;
       procedure DeleteKurZakaz(IDRes:Integer);

       function  InitPortTerminal:Boolean;
       function  CheckPereuchet:Boolean;

       function  FindEAN13(db:TDBGrid; EAN13:String; P,Kol:Integer; var IsFind:Boolean; iddoc:Integer=0):String;

       function  MessBox(Mes:String; Btn:Integer; F:TFont; AutoClose:Integer; var Res:String; URes:Boolean=False; Caption:String=''; bBtn:TControl=nil):Integer; overload;

       function  MessBox(Mes:String; Btn:Integer):Integer; overload;
       function  MessBox(Mes:String):Integer; overload;

       function  IsPermit(S:TByteSet; Param:Byte):Boolean; overload;
       function  IsPermit(S:TByteSet; Mes:String; Param:Byte):Boolean; overload;

       function  WriteToIni(FName:String; F:String; V:Variant):Boolean; overload;
       function  WriteToIni(F:String; V:Variant):Boolean; overload;

       function  ReadFromIni(FName:String; F,Def:String):String; overload;
       function  ReadFromIni(F,Def:String):String; overload;
       function  CheckCardPokup:Boolean;

       function  GetKolFromDialog(Nm:String; DefKol:Integer; var Art_Code:Integer;  var id_zam:Integer; P:Byte; Koef:Integer=0; Upak:Integer=0; Cap:String=''; Param:Byte=0):Integer;

       function GetWinVer: string;overload;
       procedure GetWinVer(out majorVersion: integer);overload;

       function  CheckLimitSkd(Nm:Int64):Boolean;
       function  CheckPassword(Psw:String):Boolean;
       function  GetPasswRep(P:Byte=0):String;
       function  GetLoginMDMU:String;
       function  CheckForReoc(NList:TNList):Boolean;
       function  CheckNonClosedCheck:Integer;
       function  ShowTeramChange(Art_Code:Integer; Names:String):Boolean;
       function  ShowATC(Art_Code:Integer; Names:String; P:Byte=0):Byte;
       function  CalcSkdOnly(SumSpis,SumCash:Currency; BSkd:Boolean; Param:Byte):Currency;
       function  CheckBankCard(var Cp:TChekPos):Boolean;
       function  IsMomBabyCard(NumCard:Int64):Boolean;
       function  CheckMakeFromExists(ds:TADOStoredProc; var ArtCode:Integer):Boolean;
       function  IsStudyRoom:Boolean;
       function  MediSendRealiz(CP:TChekPos):Boolean;

       property  Ex:Boolean read FEx write FEx;
       property  GroupIndex:Integer read GetGroupIndex;            // Тип товара
       property  SprOrder:Integer read FSprOrder write SetOrder; // Режим сортировки справочника товаров
       property  ChekOpened:Boolean read FChekOpened;
       property  IsCHP:Boolean read FIsCHP;                      // Тип товара в открытом чеке
       property  Type_Skd:Integer read FType_Skd write SetType_Skd;
       property  PercentSkd:Real read GetPercentSkd write SetPercentSkd;
       property  SumSkd:Real read FSumSkd;
       property  SumChek:Real read FSumChek write SetSumChek;

       property  SumChekRecipt:Currency read FSumChekRecipt write FSumChekRecipt;
       property  SumChekFull:Real read GetSumChekFull;
       property  SumChek99:Real read FSum99 write FSum99;
       property  NumCard:Int64 read FNumCard write SetNumCard;

       property  TypeCard:Integer read FTypeCard write FTypeCard;
       property  TypeCardNew:Byte read FTypeCardNew write FTypeCardNew;
       property  AccumSum:Currency read FAccumSum write FAccumSum;
       property  AccumSumChek:Currency read FAccumSumChek write FAccumSumChek;

       property  LastError:String read FLastError write FLastError;
       property  VzhNum:Int64 read GetVzhNum;
       property  PayCount:Integer read FPayCount write FPayCount;
       property  BaseCHP:Boolean read GetBaseCHP;
       property  CHPChek:TStringList read FCHPChek write FCHPChek;
       property  FlagW:Boolean read FFlagW write FFlagW;
       property  BaseFileName:String read GetBaseFileName;
       property  IP:String read FIP;
       property  Design:Boolean read FDesign;
       property  Mistake:Boolean read FMistake write SetMistake;
       property  Mistakes:TByteSet read FMistakes;
       property  BegPeriod:TDateTime read GetBegPeriod;
       property  EndPeriod:TDateTime read GetEndPeriod;
       property  ChekEmpty:Boolean read FChekEmpty write FChekEmpty;
       property  ArtCh:Byte read FArtCh write FArtCh;
       property  UseEKKASafe:Boolean read FUseEKKASafe;
       property  IsSkdDop:Boolean read FIsSkdDop;
       property  TypeChek:Integer read FTypeChek write FTypeChek;
       property  IsFozzy:Boolean read FIsFozzy write FIsFozzy;
       property  IsDop7:Boolean read FIsDop7 write FIsDop7;
       property  IsKiosk:Boolean read GetIsKiosk;
       property  IsChSeria:Boolean read FIsChSeria write FIsChSeria;
       property  PercForPrice:Byte read GetPercForPrice;
       property  NumCardMag:Int64 read FNumCardMag write FNumCardMag;
       property  NumCardProf:Int64 read FNumCardProf write FNumCardProf;
       property  NumCardRecipt:Int64 read FNumCardRecipt write FNumCardRecipt;
       property  NumCardStretch:Int64 read FNumCardStretch write FNumCardStretch;
       property  NumMediCard:Int64 read FNumMediCard write FNumMediCard;
       property  NumMDMUCard:Int64 read FNumMDMUCard write FNumMDMUCard;
       property  IsRegCard:Boolean read FIsRegCard write FIsRegCard;
       property  IsDay:Boolean read FIsDay write FIsDay;
       property  ForReserve:Boolean read FForReserve write FForReserve;
       property  NPSvid:String read FNPSvid write FNPSvid;
       property  MaxSkd:Real read GetMAxSkd;
       property  IsNewPrih:Boolean read GetIsNewPrih;
       property  CheckOpening:Boolean read FCheckOpening write FCheckOpening;
       property  NReestrSrok:Byte read FNReestrSrok;
       property  NewVersion:Boolean read FNewVersion;
       property  BlockingChek:Boolean read FBlockingChek write SetBlockingChek;
       property  StartApp:Boolean read FStartApp write FStartApp;
       property  StNumCard:Int64 read FStNumCard;
       property  fVesh:String Read FfVesh write FfVesh;
       property  fDoz:String Read FfDoz write FfDoz;
       property  fForm:String Read FfForm write FfForm;
       property  FullSprTov:Boolean read GetFullSprTov;
       property  IsFiltered:Boolean read GetIsFiltered;
       property  IsResize:Boolean read FIsResize write FIsResize;
       property  SumCashToCard:Currency read FSumCashToCard write FSumCashToCard;
       property  IsOgrSkd:Boolean read FIsOgrSkd;
       property  IsQCard:Boolean read FIsQCard write FIsQCard;
       property  MaxIDRES:Integer read FMaxIDRES write FMaxIDRES;
       property  CntZakaz:Integer read FCntZakaz write FCntZakaz;
       property  OstatED:Integer read GetOstatED;
       property  CanShowingKonkurHint:Boolean read FCanShowingKonkurHint write FCanShowingKonkurHint;
       property  IsTerminal:Boolean read FIsTerminal write FIsTerminal;
       property  Brend:Integer read GetBrend;
       property  NumCardDnepr:Int64 read FNumCardDnepr write FNumCardDnepr;
       property  SumDnepr:Currency read FSumDnepr write FSumDnepr;

       property  MedName:String read FMedName write FMedName;
       property  FIODoctor:String read FFIODoctor write FFIODoctor;
       property  Pacient:String read FPacient write FPacient;
       property  TypeRecipt:Byte read FTypeRecipt write FTypeRecipt;
       property  nmFilter:String read GetNmFilter;
       property  arFilter:TStrArray read FarFilter;
       property  CopyChek:Boolean read FCopyChek write FCopyChek;
       property  ID_Doctor:Integer read FID_Doctor;
       property  Address:String read GetAddress;
       property  MaxSpisSum:Currency read FMaxSpisSum write SetMaxSpisSum;
       property  IsNumCardSMS:Boolean read FIsNumCardSMS write FIsNumCardSMS;
       property  RRN: string read FRRN write FRRN;
       property  BankCard: string read FBankCard write FBankCard;

     end;


Const MFC='Регистрация продаж';  // Надпись на главном окне

      ER_CR_FORM='Ошибка создания окна!';

      { --- Права пользователей --- }
      R_ADMIN=0;  // права Администратора
      R_KASSIR=1; // права Кассира
      R_PROVIZ=2; // права Ревизора
      R_DISP=3;   // права Диспетчера (для Курьера)
      R_SUPER=4;  // права Заведующей
      R_OPER=5;   // прaва Каптерщика (запрещено пробивать чеки)

      { --- Признаки проверки прав пользователей --- }
      P_ALERT=0;  // вывести сообщение
      P_SILENT=1; // не выводить сообщение

      { --- Признаки сортировки справочника товаров --- }
      O_ART_CODE=0; // поиск по Art_Code
      O_NAMES=1;    // поиск по Names

      CH_ANSI=['Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J','K','L','Z',
               'X','C','V','B','N','M','q','w','e','r','t','y','u','i','o','p','a','s','d','f',
               'g','h','j','k','l','z','x','c','v','b','n','m','-','_',' ',',','.','\','"','Й',
               'Ц','У','К','Е','Н','Г','Ш','Щ','З','Х','Ъ','Ф','Ы','В','А','П','Р','О','Л','Д',
               'Ж','Э','Я','Ч','С','М','И','Т','Ь','Б','Ю','Ё','й','ц','у','к','е','н','г','ш',
               'щ','з','х','ъ','ф','ы','в','а','п','р','о','л','д','ж','э','я','ч','с','м','и',
               'т','ь','б','ю','ё','0','1','2','3','4','5','6','7','8','9'];

      CH_DIGIT=['0'..'9']; // Цифровые символы

      K_ARROW_KEYS=[37,38,39,40,13]; // Коды стрелок курсора

      // !!!!!!!!! НЕ МЕНЯТЬ ЗНАЧЕНИЯ ЭТИХ КОНСТАНТ !!!!!!!!!!!!!!!!!!!!!
      EK_DIALOG=0; // Ввод товара через диалог
      EK_SCAN=1;   // Ввод через сканер штрих кодов
      EK_CHEK=2;   // Изменение количества в чеке
      EK_SILENT=3; // Ввод по умолчанию одной упаковки

      F_NDS_CHP=[4,3]; // Признаки F_NDS ЧП-шного товара

      { --- Цвет индикатора суммы ---}
      CL_GREEN=clLime;   // Цвет индикатора без скидки
      CL_RED=$0000ECFF;  // Цвет индикатора со скидкой

      { --- Режимы скидок ---}
      SK_NONE=0;   // Режим без скидок
      SK_SUMM=1;   // Суммовая скидка
      SK_FIX= 2;   // Режим фиксированной скидки
      SK_FIX10=3;  // Режим фиксированной скидки на гептралы с запросом номера флаера
      SK_CARD=4;   // Режим скидок по карточкам
      SK_DRCARD=5; // Режим скидок по Леди-кард
      SK_ORANGE=6; // Оранж кард

      { --- Признаки пробития чеков ---}
      NO_ERROR=-1;  // Нет ошибок
      SH_CANC=10;   // Сдвиг-признак отмены чека
      TO_CASH=0;    // Оплата наличными
      TO_CHEK=1;    // Оплата по безналу
      TO_CHP=4;     // Оплата ЧП
      TO_CHPBEZNAL=5;     // Оплата ЧП
      TO_BEZNAL3=7; // Безнал 3 для курьера
      TO_BEZNAL1=8; // Безнал 3 для курьера
      TO_BACK=99;   // Возврат на склад

      {--- Признаки отмена чека ---}
      CC_CANCEL=0; // Полная отмена чека
      CC_END=1;    // Завершение чека (при оплате, возврате)

      {--- Признаки накладных ---}
      DC_INCOME=1; // Признак приходных накладных
      DC_BACK=2;   // Признак возвратных накладных

      MAX_NUMCARD=10000000; // Максимальный номер для "Зеленых" карточек

      { --- Организация поиска в различныз DBGrid ---}
      SC_SKLAD=1;  // В главном справочнике товара
      SC_CHEK=2;   // В Чеке
      SC_FIND=3;   // Просто поиск в DBGrid
      SC_SCNAKL=4; // Сканирование накладных
      SC_TMPSPIS=5;// Сканирование возвратов
      SC_SPIS=6;
      SC_MOVES=7;   // Сканирование накладных прямо в истории накладных
      SC_FINDTMC=8; // Поиск позиций ТМЦ

      { --- Управление камерой --- }
      CM_START=270; // Старт записи
      CM_STOP=271;  // Остановка записи

      { --- Пареметры выгрузки информации на флешку --- }
      UN_ARHO=0; // Выгрузка файлов реализации остатков
      UN_BASE=1; // Выгрузка всей базы

      { --- Переменные для инициализации групп товаров --- }
      GR_ZAKAZ=1; // Если группы для Заявки
      GR_MAIN=2;  // Если группы для Главного справочника товаров

      { --- Режим пробития сумм по ЕККА ---}
      SM_OPT=1;  // Пробитие оптовой сумму
      SM_PREP=2; // Пробитие предоплаты

      { --- Префиксы дисконтных карт --- }
      CR_911  ='911';  // 'Спец.' карточки (5% на старте, а дальше по накопительной)
      CR_STUD ='3597'; // Студенческие карточки (5% на старте, а дальше по накопительной)
      CR_BEGDR='255';  // Карточки врачей
//      CR_NAKLOF='277'; // Карточки врачей Наклофен
      CR_BIOSTR='288'; // Карточки врачей Биострепта
      CR_KARAV='29';   // Карточки супермаркета Караван
      CR_ORANG='88';   // Оранж кард
      CR_DAFI='029';   // Карточки на Дафи
      CR_271='99';     // Карточки для 271 аптек

      CR_DOCT1='231';  // Карточки врачей 10% на все препар

      CR_PREDST='261'; // Карточки медпредставителей
      CR_KRO='251';    // Карточки ревизоров
//      CR_STR241='241'; // Скретч карты (Сертификаты)

      CR_DRIVER='558'; // Карточки водителей

      CR_PROH='216';    // Акция социальный проект  "PROHEPAR CARD".
      CR_PL2PERC='27'; {Буквенный префикс "NU" }  // Карточки 2 % для аптек пластик
      CR_EMPLO='271'; // Сотрудники, которые сканируются карточками

      // 287 - карточка терафлю

      // 221000000001  - 10%
      // 211000000001  - 10%

      // 212000000001  - 2%
      // 213000000001  - 10%
      // 214000000001  - 15%

      // 215000000001  - 20%

      // 216000000001  - %
      // 217000000001  - 20%

      // 218000000001  - 10%
      // 219000000001  - 10%

      // 2220000000017
      // 2240000000017
      // 2250000000013
      // 2260000000013

      // 210 - сотрудники аптек
      // 201 - профарма
      // 223000000001 - 10% , 223000000002 - 20%, 223000000003 - 30%, 223000000004 -15%
      // 227 -
      // 272 - код для медикард так как родной медикар начинается с MD0
      // 228 - карточки 20% Humana чаи
      // 2890000000012 - 10 %
      // 287000000001 1 шт 5% ,2 шт 10 %
      // 229000000020, 229000000030, 229000000050  штрихкоды сроковых препаратов
      // 232000000001
      // 233000000001
      // 234000000001

      // 235000000001 - штрих-коды врачей фермент С6
      // 236000000001 - штрих-код 15 % фиксир
      // 237000000001 - i-аптека
      // 238000000001 - 15% профлекс
      // 239000000001 - гарантийные талоны
      // 245000000001 - профарма
      // 246000000001 -
      // 247000000001
      // 248000000001
      // 249000000001

      // 250000000001
      // 250000000002
      // 250000000003
      // 250000000004
      // 250000000005

      // 251000000001
      // 251000000001
      // 252000000001
      // 253000000001

      // 254000000001
      // 255000000001
      // 256000000001
      // 257000000001 - 257000036000

      // 258000000001
      // 259000000001
      // 260000000001

      // 261000000001
      // 262000000001
      // 263000000001
      // 264000000001
      // 265000000001
      // 266000000001
      // 267000000001
      // 268000000001
      // 269000000001
      // 270000000001
      // 281000000001
      // 282000000001
      // 283000000001
      // 284000000001
      // 285000000001
      // 286000000001
      // 287000000001
      // 288000000001
      // 288000000002
      // 289000000001
      // 290000000001
      // 291000000001
      // 292000000001
      // 293000000001
      // 294000000001
      // 295000000001
      // 296000000001
      // 296000000002
      // 297000000001
      // 298000000001
      // 298000000002
      // 299000000002
      // 301000000001
      // 302000000001
      // 303000000001

      { --- Признаки работы со справочником товара ---}
      W_CENNIK=1;     // Печать ценников
      W_LT=2;         // Формирование лишнего товара
      W_PEREUCHET=3;  // Формирование выборочной инвентаризации
      W_BACK=4;       // Формирование возврата по списку
      W_BACK1=5;      // Формирование возврата вручную
      W_LTM=6;        // Формирование лишнего товара по минусовой реализации
      W_CENNIKSROK=7;  // Печать ценников на сроковые товары
      W_ZAKAZSKL=8;    // Заказ на складе
      W_ZAKAZWAIT=9;   // Бронь ожидаемого товара
      W_QUARANTINE=10; //Перемещение товара в карантин

      { --- Признаки формирования пересорта ---}
      P_MONTH=1;      // Пересорт за месяц
      P_PEREUCHET=2;  // Пересорт по переучету

      { --- Признаки ввода количества ---}
      EN_SIMPLE=0; // Простой ввод
      EN_PODBOR=1; // Ввод с подбором замены

      { --- Признаки формироания списков пользователей ---}
      USERS_ALL=0; // Пользователи не зарегистрированные
      USERS_APT=1; // Пользователи зарегистрированные

      { --- Типы чеков ---}
      TC_MAIN=1;
      TC_KURER=2;
      TC_PREP=3;
      TC_SERTIF=4;
      TC_STRETCH=6;
      TC_BACK=7;
      TC_PROFARMA=8;
      TC_MOMBABY=9;
      TC_PILOT=10;
      TC_SROK=11;
      TC_RECIPT_PL=12;
      TC_OBSL=14;   // Чек на обслуживание только для аптечного курьера
      TC_NAKL=15;
      TC_INSULIN=16;
      TC_PULMOZIM=17;
      TC_SOCSTRAH=18;
      TC_LGOTDP=19;

      TC_DL=[TC_PILOT,TC_INSULIN,TC_PULMOZIM,TC_SOCSTRAH,TC_LGOTDP];

      DO_NEWPOST=6; // Дополнительный признак для новой почты   //Изменено с 10  10.08.2016
      DO_BEZGOT3=7; // Безготiвкова 3
      DO_BEZGOT1=8; // Безготiвкова 1
      DO_KURIER=11; // Признак пробития чека по банковскому терминалу для курьера (kassa_num=2)

      { --- Типы вводимых значений ---}
      INT_VALUE=1;
      STR_VALUE=2;
      CUR_VALUE=3;

      { --- Признаки карточек MDM --- }
      MDM_1='999482';
      MDM_2='482,889';
      id_SnapShot=101;

      {  --- Признаки прихода товара --- }

      PR_TOVAR=1; // Приход товара
      PR_WATER=2; // Приход воды
      PR_SROK=3;  // Список сроковых препаратов

      {  --- Статусы чеков --- }
      ST_CHECK=0; // Проверка статуса торгового чека
      ST_ZREP=1;  // Проверка статуса снятия Z-отчета

      ModeStr:Array[TMPModes] of String = ('Not ready', 'Stopped', 'Playing', 'Recording', 'Seeking', 'Paused', 'Open');

      { --- Признаки брендов ---}
      BR_911=1;  // 911
      BR_OPT=2;  // Аптека оптовых цен
      BR_DOBR=3; // Аптека "Добрая"
      BR_308=4;  // Аптека 308

      { --- Максимально допустимое количество дней за которое можно выбирать дату назад}
      xM=92;

      { --- Признаки отображения списков }
      TP_REOC=1;   // Список переоценки
      TP_STIKER=2; // Список новых стикеров
      TP_UPDC=3;   // Список обновляемых акционных ценников



Var MainF:TMainF=nil;

    FB:TForBack;
    ENLng,RULng:LongWord;
    Opt:TFileOpt;
    Prm:TPrParams;
    CL:TClOptions;
    FlagD:Integer;
//    aFiles:Array of TFileOst;
    ErrMess:String;
    MemCP:TChekPos;

    aOstat:Array of Record
                     Art_Code:Integer;
                     Ostat:Integer;
                    end;

    ActiveFi:TObject;
    ssTime,flTime:TDateTime;
    TerminateFlash,StartFlash:Boolean;
    IsClosed:Boolean;

    qPlay:Array of Record
                    Done:Byte;
                    FName:String;
                   end;

    MaxT:TDateTime;
    MaxTN:Integer;

    aRemind,aRemindP:Array of Record
                               Img:TImage;
                               Txt:String;
                              end;
    //Terminal:Variant;
    Terminal:OleVariant;


Implementation


Uses
  DataModuleU, StartU, AboutU, UsersU, EnterKolU, OstatCheckU, DialogU,
  BlockingU, DateBackU, MoveTovU, RealizRepU, CardReadU, ZXRepU,
  ShowEAN13U, SumZU, ViewNaklU, EnterStrU, ShareU, OptSumU, LoadNaklU,
  ZakazU, MoveMoneyU, ShowTerminalAlertU, ShowCardInfoU, BankCardU,
  OtkazU, NoScanU, ShowATCU, BackClientU, InitCPU, RepKassirSummU,
  RepOstatU, RepPeriodU, InfoPKUU, RepIncomU, TermEKKAU, CutBaseU,
  ShowNewInfoU, EditRegU, HistoryU, WorkSprU, ViewLTU, JTableU,
  CancelViewU, PeresortU, CheckBaseU, RepRegU, KolProdU, SpisU,
  PrOtkazU, ShowMessU, SpisArtAddU, JReocU, AkciiU, SpisUserU, PswU, EnterValueU,
  BlankReciptU, PrintObnovU, MoneyCashU, ShowTerapU, EnterDateU,
  CenaUpakU, Mess1U, ScanBoxU, RegPredstU, SimpleMessU, EnterDate1U,
  SertifIU, AddResU, WorkResU, ScanMagU, AECardsU, ShowAkciiU, ScanStretchU, ChooseVLU,
  MBSpisU, ProvizInfoU, SignInfoU, HotKeyInfoU, TableU, TabelU, FirstRecU,
  CountersU, ShowRecOnlyU, LTMU, FormForVozrU, ReasonNoTovU,
  FirstRecomendU, ShowBackClInstructU, PrihodMDMU, OstatInBSkladU,
  ShowTextU, KoefU, Pilot1U, Pilot2U, Pilot3U, ConfirmZpMessU,
  ChoosePrihU, PrihTovU, PilotU, SpisForVozrU, ChooseVL1U, ScanVozrU,
  ZakazPriceU, HodAkciiU, ViewZakazPriceU, ViewVzResU, HozZakazU, ChMonthU,
  TovInfoU, TovGrafikU, EnterKolAdvU, MessThemsU, SrokMovU, MessBoxU,
  SaveScreenU, DocumentsU, FormHintU, EnterKolNewU, hSosputstvU,
  hPokupStatU, ShowZpMessU, hKonkurHintU, ShowAlarmU, ReestrU,
  ShowAnnotNewU, SpisNeedAktU, WebGeptralU, ArmourInApteksU, CancelResU,
  JPaySlipU, JPaySlipU1, JPaySlipU2, RepKassirSumm1U, MotivationSystemU,
  BackTMCU, ChoosePayU, BankCard_old_U, ShowReciptListU, ListMakeFromU,
  ChooseReciptU, OtkazInfoU, SpisArtCenaU, LgotListU, TimerZU, ZPU,
  AddExtemoroU, PlayRolikU, ChangeMDMCardU, PlayerU, ReklamaOnU,
  hFarmZamAlertU, hPlanInfoU, hPlanAptInfoU, PlanForAptekaU, AddDoctorU,
  AddStrahU, NewReocListU, NeedAktU, ReestrRepU, CalculatePlanU,
  ViolationDiagU, PrintAnnotU, ReplPhoneAccountU, Un_to_chek,
  UGarant_remont, UDeliveryCashInput, QuarantineU, UTmp_change_employee,
  ClaimesU, ViewLessonsU, FarmZamAndSoputstvU, MesHranSrokU,
  StickerForBoxU, InsulinU, DocumentsExtendedU, InsulinRepU, ChangeArticleCount;

{$R *.dfm}

// Create формы
procedure TMainF.FormCreate(Sender:TObject);
var T:TDateTime;
 begin
  lbFullName.Caption:='';
  lbNamesUA.Caption:='';
  lbNamesUA.Hint:='';
  try
   FCloseFirst:=0;
   FLastNumbRecipt:=0;
   FIsStart:=True;
   try
    Application.OnMessage:=AppMessage;
    Ex:=True;

DeleteFile('C:\Log\Create.txt');
    T:=Time;
AppendStringToFile('C:\Log\Create.txt','Start - '+IntToStr(MilliSecondsBetween(T,Time))); T:=Time;
    InitFields;

AppendStringToFile('C:\Log\Create.txt','InitFields - '+IntToStr(MilliSecondsBetween(T,Time))); T:=Time;

    InitIP;
AppendStringToFile('C:\Log\Create.txt','InitIP - '+IntToStr(MilliSecondsBetween(T,Time))); T:=Time;

    InitProxy;
AppendStringToFile('C:\Log\Create.txt','InitProxy - '+IntToStr(MilliSecondsBetween(T,Time))); T:=Time;

    InitFonts;
AppendStringToFile('C:\Log\Create.txt','InitFonts - '+IntToStr(MilliSecondsBetween(T,Time))); T:=Time;

    if Design=False then InitColors;
AppendStringToFile('C:\Log\Create.txt','InitColors - '+IntToStr(MilliSecondsBetween(T,Time))); T:=Time;

    InitPanels;
AppendStringToFile('C:\Log\Create.txt','InitPanels - '+IntToStr(MilliSecondsBetween(T,Time))); T:=Time;

    if Design=False then FilterSklad;
AppendStringToFile('C:\Log\Create.txt','FilterSklad - '+IntToStr(MilliSecondsBetween(T,Time))); T:=Time;

    InitEKKA;
AppendStringToFile('C:\Log\Create.txt','InitEKKA - '+IntToStr(MilliSecondsBetween(T,Time))); T:=Time;

    InitChek;
AppendStringToFile('C:\Log\Create.txt','InitChek - '+IntToStr(MilliSecondsBetween(T,Time))); T:=Time;

    InitFixSkd;
AppendStringToFile('C:\Log\Create.txt','InitFixSkd - '+IntToStr(MilliSecondsBetween(T,Time))); T:=Time;
//    InitAnnotList;

    InitScripts;
AppendStringToFile('C:\Log\Create.txt','InitScripts - '+IntToStr(MilliSecondsBetween(T,Time))); T:=Time;

    SetVolume;
    Ex:=False;

    date_begin:=now();//инициалезируем переменную для хранения времени начала текущего ввода

   finally
    FIsStart:=False;
   end;

  except
   on E:Exception do
    begin
     Ex:=True; ErrMess:='Ошибка инициализации программы! '+E.Message;
    end;
   //on E:EAbort do begin Ex:=True; ErrMess:=E.Message; end else begin Ex:=True; ErrMess:='Ошибка инициализации программы! '+E.Message; end;
  end;
 end; {FormCreate}

// Запуск SQL - запросов
procedure TMainF.InitScripts;
var S:String;
    V:Integer;
 begin
//  Exit;
  try

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('declare @us varchar (100) ');
   DM.Qr.SQL.Add('set @us=''kpp''+ (select top 1 convert(varchar,id) from Inform..d_dept (nolock) where id_apteka=(select convert(int,Value) from Spr_Const (nolock) where Descr=''ID_APTEKA''))+''_1'' ');
   DM.Qr.SQL.Add('select @us as usname,(select Count(*) from master..syslogins (nolock) where name=@us) as Cnt,case when @@version like ''%Microsoft SQL Server  2000%'' then 2000 else 2005 end as SVer ');
   DM.Qr.Open;

   if DM.Qr.FieldByName('Cnt').AsInteger<=0 then
    begin
     S:=DM.Qr.FieldByName('usname').AsString;
     V:=DM.Qr.FieldByName('Sver').AsInteger;
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     if V=2005 then
      begin
       DM.Qr.SQL.Add(' use master ');
       DM.Qr.SQL.Add(' CREATE LOGIN ['+S+'] WITH PASSWORD = '''+S+''' , ');
       DM.Qr.SQL.Add('        DEFAULT_DATABASE = [master], ');
       DM.Qr.SQL.Add('        DEFAULT_LANGUAGE = [English], ');
       DM.Qr.SQL.Add('        CHECK_EXPIRATION = OFF, ');
       DM.Qr.SQL.Add('        CHECK_POLICY = OFF ');
       DM.Qr.SQL.Add(' GRANT CONTROL SERVER TO ['+S+'] ');
       DM.Qr.SQL.Add(' use apteka_net        ');
      end else begin
                DM.Qr.SQL.Add('  exec sp_addlogin '''+S+''', '''+S+''' ');
                DM.Qr.SQL.Add('  exec sp_addsrvrolemember '''+S+''', sysadmin ');
               end;
//   DM.Qr.SQL.SaveToFile('C:\LOG\Login.txt');
     DM.Qr.ExecSQL;
    end;
   except
   end;

//  if Design then Exit;

  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('delete from Inform..JReadMess where id_mess in (select id from Inform..JMess (nolock) where DateM<getdate()-30)');
   DM.Qr.SQL.Add('delete from Inform..JMess where DateM<getdate()-10 ');
   DM.Qr.ExecSQL;
  except
  end;

 end; {InitScripts}

function TMainF.IsStudyRoom:Boolean;
 begin
  Result:=(Prm.AptekaID=10001) or (Prm.AptekaID=10002) or (Prm.AptekaID=10253);
 end;

procedure TMainF.InitProxy;
var Reg:TRegistry;
    IsProxy:Boolean;
 begin

  if (FIP='10.44.4.17') or
     (FIP='10.44.36.21') or
     (AnsiUpperCase(Copy(Opt.Server,1,8))='TEST_SQL') or
     (AnsiUpperCase(Copy(Opt.Server,1,13))='192.168.0.186') or
     (AnsiUpperCase(GetCompName)=AnsiUpperCase('SERGEY')) or
     (AnsiUpperCase(GetCompName)=AnsiUpperCase('AVA1')) or
     (Prm.IsProxy=False) or
     (Design=True)
  then
   IsProxy:=False
  else
   IsProxy:=True;

  try
   Reg:=TRegistry.Create;
   try
    Reg.Access:=$0100 or KEY_ALL_ACCESS;
    Reg.RootKey:=HKEY_CURRENT_USER;

    if Not Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Internet Settings',False) then Abort;
    Reg.WriteInteger('MigrateProxy',1);

    if IsProxy then
     Reg.WriteInteger('ProxyEnable',1)
    else
     Reg.WriteInteger('ProxyEnable',0);

    Reg.WriteInteger('ProxyHttp1.1',0);
    Reg.WriteString('ProxyServer',Prm.ProxyAdr);

    Reg.WriteString('ProxyOverride','<local>');

    Reg.CloseKey;
   finally
    Reg.Free;
   end;
  except
  end;

 end;

// Запись своего IP в справочник IP
procedure TMainF.InitIP;
var Res:String;
 begin

{
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('delete from UpdateReg where id_kassa='+IntToStr(Opt.KassaID));
   DM.Qr.SQL.Add('insert into UpdateReg(ID_KASSA,DATEEXE)');
   DM.Qr.SQL.Add('Values ('+IntToStr(Opt.KassaID)+','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',FApplDateTime)+''')');
   DM.Qr.ExecSQL;
  except
  end;
}

  try
   FIP:=GetLocalIP;
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('declare @dt datetime ');
   DM.Qr.SQL.Add('set @dt=convert(datetime,convert(varchar,getdate())) ');
   DM.Qr.SQL.Add('insert into SprIP(IP,ID_KASSA,ID_USER,VERSION,DT,VZHS,PlayRolik)');
   DM.Qr.SQL.Add('Values ('''+IP+''','+IntToStr(Opt.KassaID)+','+IntToStr(Prm.UserID)+','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',FApplDateTime)+''',@dt,'''+EKKA.VzhNumS+''','+IntTostr(BoolToInt(Opt.PlayRolik))+') ');
   DM.Qr.SQL.Add('select @dt as dt ');
   DM.Qr.Open;
   DtLogin:=DM.Qr.FieldByName('dt').AsDateTime;
  except
  end;

  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('declare @id_p bigint, @dt datetime, @flag smallint ');

   DM.Qr.SQL.Add('select @id_p=id_p,@dt=convert(datetime,convert(varchar,getdate()-1,23)+'' 23:59:59''),@flag=2 ');
   DM.Qr.SQL.Add('from SprPredst s (nolock) ');
   DM.Qr.SQL.Add('where IsNull((select top 1 r.Flag ');
   DM.Qr.SQL.Add('              from RegPredst r (nolock) ');
   DM.Qr.SQL.Add('              where r.dt<convert(datetime,convert(varchar,getdate(),23)) and ');
   DM.Qr.SQL.Add('                    r.id_p=s.id_p ');
   DM.Qr.SQL.Add('              order by dt desc,flag desc),0)=1 ');

   DM.Qr.SQL.Add('insert into RegPredst(id_p,dt,flag) values(@id_p,@dt,@flag) ');
{
   DM.Qr.SQL.Add('insert into RegPredst(id_p,dt,flag) ');
   DM.Qr.SQL.Add('select id_p,convert(datetime,convert(varchar,getdate()-1,23)+'' 23:59:59''),2                       ');
   DM.Qr.SQL.Add('from SprPredst s (nolock)                   ');
   DM.Qr.SQL.Add('where IsNull((select top 1 r.Flag from RegPredst r (nolock) where r.dt<convert(datetime,convert(varchar,getdate(),23)) and r.id_p=s.id_p order by dt desc,flag desc),0)=1 ');
}
//   DM.Qr.SQL.SaveToFile('C:\LOG\RegPr.txt');
   DM.Qr.ExecSQL;
  except
  end;

  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('declare @Res int');
   DM.Qr.SQL.Add('exec spY_CancelChekRes '+IntToStr(Prm.UserID)+', @Res output');
   DM.Qr.SQL.Add('select @Res as Res');
   DM.Qr.Open;
   if DM.Qr.FieldByName('Res').AsInteger=1 then
    begin
     MessBox('Внимание! При входе в программу набранный чек был отменен! Если нужно, необходимо набрать его заново и провести продажу по кассовому аппарату!'#10#10+
             'Если оплата была по терминалу и по терминалу оплата уже прошла, повторно проводить продажу по терминалу не нужно, нужно просто провести чек по кассовому аппарату!',
              48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
    end
  except
  end;

  if (IsStudyRoom=False) and (Prm.ID_Gamma<>1) then
  try
   DM.TimerQr1.Close;
   DM.TimerQr1.SQL.Clear;
//   DM.TimerQr1.SQL.Add('if (select Count(*) from Chek where compname=host_name() and id_user='+IntToStr(Prm.UserID)+')=0 ');
   DM.TimerQr1.SQL.Add(' exec spY_CancelReserve ');
   DM.TimerQr1.Open;
  except
  end;

 end; {InitIP}

// Подгружает список арткодов на которые есть аннотации
procedure TMainF.InitAnnotList;
var i:Integer;
 begin
  if Design then Exit;
  // Инициализация списка арткодов для Аннотаций
  try
   SetLength(FArtCodeList,0);
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select IsNull(Max(art_code),0) as Cnt from SprTov (nolock) where art_code<>99999';
   DM.Qr.Open;
   SetLength(FArtCodeList,DM.Qr.FieldByName('Cnt').AsInteger*2);

   for i:=Low(FArtCodeList) to High(FArtCodeList) do
    begin
     FArtCodeList[i].Annot:=0;
     FArtCodeList[i].ArtAdd:=0;
     FArtCodeList[i].Recipt:=1;
     FArtCodeList[i].Color:=-1;
    end;

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select art_code from Annotacii..Annotaci (nolock) where art_code<>99999 group by art_code order by art_code';
   DM.Qr.Open;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     FArtCodeList[DM.Qr.FieldByName('art_code').AsInteger].Annot:=1;
    end;

  except
  end;

  // Инициализация списка цветовой подсветки
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select art_code,color from SprColor (nolock)');
   DM.Qr.Open;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     FArtCodeList[DM.Qr.FieldByName('art_code').AsInteger].Color:=DM.Qr.FieldByName('color').AsInteger;
    end;
  except
  end;

  // Список безрецептурных препаратов

  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('if Object_ID(N''tempdb..#srok'') is not null drop table #srok     ');
   DM.Qr.SQL.Add('select art_code,rtrim(substring(names,1,len(names)-7)) as names   ');
   DM.Qr.SQL.Add('into #srok                                                        ');
   DM.Qr.SQL.Add('from SprTov (nolock)                                              ');
   DM.Qr.SQL.Add('where Names like ''%(__.__)''                                     ');
   DM.Qr.SQL.Add('group by art_code,rtrim(substring(names,1,len(names)-7))          ');
   DM.Qr.SQL.Add('select a.art_code                                                 ');
   DM.Qr.SQL.Add('from #srok a, SprTov b (nolock), SprNoRecipt c (nolock)           ');
   DM.Qr.SQL.Add('where a.names=b.names and b.art_code=c.art_code                   ');
   DM.Qr.SQL.Add('group by a.art_code                                               ');
   DM.Qr.SQL.Add('union                                                             ');
   DM.Qr.SQL.Add('select art_code from SprNoRecipt (nolock)                         ');
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Abort;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     if i>=High(FArtCodeList) then break;
     FArtCodeList[DM.Qr.FieldByName('art_code').AsInteger].Recipt:=0;
    end;
  except
   for i:=Low(FArtCodeList) to High(FArtCodeList) do FArtCodeList[i].Recipt:=0;
  end;

 end; {InitAnnotList}

// Установка шрифтов "Bookman Old Style"
procedure TMainF.InitFonts;
var i:Integer;
    B1,B2:Boolean;
 begin
  B1:=False; B2:=False;
  if Opt.StartFromApteksInfo=True then Exit;
  if (Design=True) and (AnsiUpperCase(GetCompName)<>'SERGEY') then Exit;

//  ShowMessage('Шрифты');

  try
   for i:=0 to Screen.Fonts.Count-1 do
    begin
     if AnsiUpperCase(Screen.Fonts[i])=AnsiUpperCase('Bookman Old Style') then B1:=True;
     if AnsiUpperCase(Screen.Fonts[i])=AnsiUpperCase('EanBwrP36Tt') then B2:=True;
     if B1 and B2 then Break;
    end;
   if Not B1 then
    begin
     AddFontResource(PChar(WorkPath+'\BOOKOS.TTF'));
     AddFontResource(PChar(WorkPath+'\BOOKOSB.TTF'));
     AddFontResource(PChar(WorkPath+'\BOOKOSBI.TTF'));
     AddFontResource(PChar(WorkPath+'\BOOKOSI.TTF'));
     SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
    end;
   if Not B2 then
    begin
     AddFontResource(PChar(WorkPath+'\V200011_.TTF'));
     SendMessage(HWND_BROADCAST, WM_FONTCHANGE, 0, 0);
    end;
   except
   end;
 end; {InitFonts}

procedure TMainF.InitTerminal;
var
  Res: Boolean;
begin
  if Opt.TypeTerminal <> 3 then
  begin
    if Prm.TerminalNew=False then
    begin
      Terminal:=CreateOleObject('ECRCommX.ECRLibSgn');
      Terminal.SetUserTimeOut(300);
      Terminal.SetCommNum(Opt.NumPortTerminal,115200);
    end
    else
    begin
      Terminal:=CreateOleObject('ECRCommX.BPOS1Lib');
      Terminal.CommClose;
      Terminal.SetErrorLang(2);
      //  Res:=Terminal.CommOpenAuto(115200);
      Res:=Terminal.CommOpen(5,115200);
      //if Not Res then ShowMessage(Terminal.LastErrorDescription);
    end;
  end;
end;

function TMainF.InitPortTerminal:Boolean;
var
  Res, i, Tmp: Integer;

  procedure tWait;
  begin
    Repeat
      if Terminal.GetLastResult<>2 then Break;
    Until False;
  end;

  procedure SavePort(P:Integer);
  var
    IniF: TIniFile;
  begin
    try
      IniF:=TIniFile.Create(Prm.OptFile);
      try
        IniF.WriteInteger(Prm.Prof,'NumPortTerminal',P);
      finally
        IniF.Free;
      end;
    except
    end;
  end;

Begin
  if Opt.TypeTerminal <> 3 then
  begin
    if Prm.TerminalNew then
    begin
      Result:=True;
      Exit;
    end;
    Result:=False;
    Tmp:=Opt.NumPortTerminal;
    Terminal.PosGetInfo;
    tWait;
    Res:=Terminal.GetLastResult;
    //  ShowMessageI(Res);
    if Res=1 then
      for i:=3 to 64 do
      begin
        Terminal.SetCommNum(i,115200);
        Terminal.PosGetInfo;
        tWait;
        if Terminal.GetLastResult=1 then
        begin
           Continue;
        end
        else
        begin
          Opt.NumPortTerminal:=i;
          SavePort(i);
          Result:=True;
          Exit;
        end;
      end
    else
    begin
      Result:=True;
      Exit;
    end;
    Opt.NumPortTerminal:=Tmp;
  end;
End;

// Инициализация полей класса формы
procedure TMainF.InitFields;
var IniPos:TIniPos;
    CF:TCopyFiles;
    ss:String;
 begin
  Randomize;
  FDesign:=FileExists(PrPath+'\PC_EKKA.dsg');
  try
   ForceDirectories('C:\LOG');
   ForceDirectories('D:\AVA');
  except
  end;

  FSprOrder:=O_NAMES;
  FNewVersion:=False;
  FCheckOpening:=False;
  FChpChek:=TStringList.Create;
  sbMag.Hint:='Перечень скидок: '+#10#10+
              '  - Газета по штрихкоду 222хххххххххх 5% или 10%; '+#10+
              '  - "Биона" по штрихкоду 223хххххххххх - 20%; '+#10+
              '  - Стратадерм гель по штрихкоду 7640140190150 - 5%; '+#10+
              '  - Бланки врачей по штрихкоду 231хххххххххх - доп. 3% или фикс. 5%.'+#10;

  FIsFirstShowMess:=True;
  TovInfoF:=nil;
  StartFlash:=False;
  TerminateFlash:=False;

  FSumFransh:=0;
  FSumDopl:=0;

  FNumZakaz:=0;
  FPhone:='';
  FNumCardDnepr:=-1;

  if Prm.RealizMinus then
   begin
    cbBoxZero.Checked:=False;
    cbBoxZero.Enabled:=False;
   end;

  FIsSkd7:=False;

  if Not ((Prm.AptekaID=253) and (Opt.KassaID=4)) then
   try
    PrintRep.ID_Apteka:=Prm.AptekaID;
   except
   end;

  try
   InitTerminal;
  except
  end;

  FCanShowingKonkurHint:=True;
  FIsTerminal:=False;
  FIsKeyDown:=False;
  FIsMaximized:=True;
  MaxIDRES:=0;
  CntZakaz:=0;
  DecimalSeparator:='.';
  ShortDateFormat:='dd.mm.yy';
  ShortTimeFormat:='hh:nn:ss';
  FTypeCardNew:=0;
  FGettingPercentSkd:=False;
  FAccumSum:=0;
  FSumCashToCard:=0;
  FErrConMain:=False;
  FStartApp:=False;
  FBlockingChek:=False;
  FPacient:='';
  FMedName:='';
  FDtRecipt:=0;
  FIsDopl:=0;
  FNRecipt:='';
  FFIODoctor1:='';

  FFlagPilot:=False;
  FFlagInsulin:=False;
  FFlagProh:=False;
  FSkdCalced:=False;
  FEnterKol:=False;
  FNonClosed:=False;
  FFlagW:=False;
  FChekOpened:=False;
  FType_Skd:=0;
  FChangeUser:=False;
  FPayWork:=False;
  FPayCount:=0;
  FIsFozzy:=False;
  FNumGeptralCard:='';
  FNumKsareltoCard:='';
  FOrderID:=0;
  FIsNumCardSMS:=False;

  FApplDateTime:=GetFileDateTime(Application.ExeName);

  Caption:=MFC+' - пользователь: '+Prm.UserName+'    Дата создания: '+DateTimeToStr(FApplDateTime)+'    '+Prm.FirmNameRU+' '+Prm.AptekaNameRU;

  PercentSkd:=0;
  FCanExecCom:=True;
  FIsChSeria:=False;
  FTypeChek:=TC_MAIN;
  Mistake:=False;

  FIDRES:=-1;
  FTypeRes:=1;
  ForReserve:=False;
  FNReestrSrok:=0;
  FNumCardMag:=-1;
  FNumCardProf:=-1;
  FNumCardRecipt:=-1;
  FNumMediCard:=-1;
  FNumMDMUCard:=-1;
  FIsResize:=True;
  FSafePercentSkd:=0;
  miShowMCash.Checked:=Opt.ShowMCash;

  N72.Visible:=False; // (Prm.FirmID in [14,15,16,17]) and (Prm.AptekaID<>78);
//  N74.Visible:=Prm.FirmID in [14,15,16,17];

  N75.Visible:=Prm.AptekaSklad=False;
  N83.Visible:=Prm.AptekaID=4;

  N86.Visible:=Prm.IsKurier;

  // Меню пополнение счета
  N97.Visible:=Prm.IsReplPhone=True;
  N98.Visible:=Prm.IsReplPhone=True;

  N102.Visible:=Prm.IsKurDostavka;

//  N76.Visible:=Design;

  FfVesh:='';
  FfDoz:='';
  FfForm:='';

  ssTime:=Time;


  ShowStatus(Prm.Kurator,2);

  ENLng:=LoadKeyboardLayout('00000409',0);
  RULng:=LoadKeyboardLayout('00000419',KLF_ACTIVATE);

  CorrLocalDate;

  Prm.SumSkd:=0;
  Prm.SkdFirst:=True;

//  Prm.SumSkd:=100000000;
  try

   ss:='0';
   if Prm.IsEnterVideoPassw then ss:='1';
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='insert into UserLog(id_user,id_kassa,dt,flag,type_enter) values('+IntToStr(Prm.UserID)+','+IntToStr(Opt.KassaID)+',getdate(),1,'+ss+')';
   DM.QrEx.ExecSQL;

  except
  end;

  SndRecXML.Variable:='medicard';
  SndRecXML.URL:='http://www.medicard.com.ua/api/api.php';

//  if Prm.AptekaID in [28,12,78] then
   begin
    SndRecXML.HTTP.ProxyParams.ProxyServer:='';
    SndRecXML.HTTP.ProxyParams.ProxyPort:=80;
   end;

//  sbPens.Visible:=Prm.AptekaID in [145..147];
  if Opt.EKKAAsPrinter then miPilotProj.Visible:=False;

  miNonCashRecipt.Visible:=Prm.FirmID=5;

  try
   DM.Qr7.Close;
   DM.Qr7.SQL.Text:='select Value from Spr_Const (nolock) where Descr=''FullSprTov'' ';
   DM.Qr7.Open;
   if DM.Qr7.IsEmpty then Abort;
   FFullSprTov:=DM.Qr7.FieldByName('Value').AsInteger=1;
  except
   FFullSprTov:=False;
  end;

  IniPos.Qr:=DM.Qr7;
  IniPos.Descr:='Scaner';
  IniPos.ExeName:='Scaner.exe';
  IniPos.Path:='D:\AVA\';
  IniPos.Caption:='Проходная';
  IniPos.Hint:='Проходная через сканер пальцев';
  IniPos.Params:='';
  IniPos.IsOne:=True;
  IniPos.ShortCut:=1;
  AddNewIniPos(IniPos);

  IniPos.Qr:=DM.Qr7;
  IniPos.Descr:='Chrome';
  IniPos.ExeName:='ChromePortable.exe';
  IniPos.Path:='D:\AVA\chrome\';
  IniPos.Caption:='Интернет';
  IniPos.Hint:='Сайт сотрудников компании';
  IniPos.Params:='';
  IniPos.IsOne:=True;
  IniPos.ShortCut:=0;
  AddNewIniPos(IniPos);

  if IsServer=False then // Копируем папку Chrome на кассу
   begin
    CF.Descr:='ChromeCopy';
    CF.Qr:=DM.Qr7;
    CF.PathFrom:='\\SERVER\AVA\Chrome';
    CF.PathTo:='D:\AVA\Chrome';
    CopyFiles(CF);
   end;

{
  try
   DM.Qr7.Close;
   DM.Qr7.SQL.Clear;
   DM.Qr7.SQL.Add('if (select Count(*) from sysindexes i, sysobjects o where o.id=i.id and o.name=''SprTov'' and  i.name=''iP'')>0');
   DM.Qr7.SQL.Add(' drop index [dbo].[SprTov].[iP] ');
   DM.Qr7.ExecSQL;
  except
  end;
}

  //Запуск рекламного ролика
  if Opt.PlayRolik then
   try
    PlayRolikF:=TPlayRolikF.Create(Self);
    PlayRolikF.PathAVA:='D:\AVA\';
    PlayRolikF.PathRolik:='D:\AVA\Rolik\';
    PlayRolikF.FNameR:='Ролик.mp3';
    ForceDirectories(PlayRolikF.PathRolik);
    if FileExists(PlayRolikF.PathAVA+PlayRolikF.FNameR) then
     begin
      CopyFile(PChar(PlayRolikF.PathAVA+PlayRolikF.FNameR),PChar(PlayRolikF.PathRolik+PlayRolikF.FNameR),False);
      if CompareFiles(PlayRolikF.PathAVA+PlayRolikF.FNameR,PlayRolikF.PathRolik+PlayRolikF.FNameR) then
       DeleteFile(PlayRolikF.PathAVA+PlayRolikF.FNameR);
     end;

    if FileExists(PlayRolikF.PathRolik+PlayRolikF.FNameR) then
     begin
      PlayRolikF.mpMain.Open;
      PlayRolikF.mpMain.Play;
      PlayRolikF.mpMain.EnabledButtons:=[btStop,btPause];
      PlayRolikF.tbVolume.Position:=Opt.VolumeRolik;
      SetMasterVolumeToValue(Opt.VolumeRolik);
     end;

    miRolik.Visible:=True;
    miS3.Visible:=True;
   except
    on E:Exception do
     MainF.RegisterError('Инициализация рекламного ролика',E.Message,True);
   end;
 end; {InitFields}


procedure TMainF.ExitClick(Sender:TObject);
 begin
  Close;
 end;

procedure TMainF.pnTbClick(Sender:TObject);
 begin
  if Not Assigned(Sender) then Exit;

  Case TsvBtn(Sender).Tag of
   1:begin
      pnSale.Visible:=True;
      pnBarSale.Visible:=True;
      pnWrkEKKA.Visible:=False;
     end;
   2:begin
      pnBarSale.Visible:=False;
      pnSale.Visible:=False;
      pnWrkEKKA.Visible:=True;
     end;
  end;
 end;

// Инициализация цветов главного окна
procedure TMainF.InitColors;
var CA,CAP,i:Integer;
    Brend:String;
    Blob:TMemoryStream;
    jpg:TJPEGImage;
 begin
{
  dbgSklad.Color:=CL.SklFon;
  dbgChek.Color:=CL.ChFon;

  dbgSklad.Columns[0].Font.Color:=CL.CodeF;
  dbgSklad.Columns[2].Font.Color:=CL.NamesF;
  dbgSklad.Columns[3].Font.Color:=CL.OstatF;
  dbgSklad.Columns[4].Font.Color:=CL.CenaF;

  dbgSklad.Font.Size:=CL.SklFS;
  dbgSklad.Font.Name:=CL.SklFN;

  for i:=0 to dbgSklad.Columns.Count-1 do
   begin
    dbgSklad.Columns[i].Font.Size:=CL.SklFS;
    dbgSklad.Columns[i].Font.Name:=CL.SklFN;
   end;

  lbChek.Font.Color:=CL.IndicNoScanF;
  lbSumCash.Font.Color:=CL.CashSumF;
  lbChek.Color:=CL.IndicFon;
  lbSumCash.Color:=CL.IndicFon;
  pnIndicator.Color:=CL.IndicFon;
}
  if Prm.AptekaID in [216,186] then Exit;

  // Инициализация массива для показа памяток
  try
   if Prm.AptekaSklad then Brend:='Склад' else Brend:='911';

   DM.QrEx.Close;

   if Prm.Dobraia then
    DM.QrEx.SQL.Text:='select * from Reminder where id<>22 and Brend='''+Brend+''' order by id'
   else
    DM.QrEx.SQL.Text:='select * from Reminder where Brend='''+Brend+''' order by id';

   DM.QrEx.Open;

   if DM.QrEx.IsEmpty=False then SaveScreenF:=TSaveScreenF.Create(Self);

   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;
     try
      Blob:=TADOBlobStream.Create(TBlobField(DM.QrEx.FieldByName('Img')),bmRead);
      Jpg:=TJPEGImage.Create;
      Jpg.LoadFromStream(Blob);

      if DM.QrEx.FieldByName('Prioritet').AsInteger=1 then
       begin
        CAP:=High(aRemindP)+1;
        SetLength(aRemindP,CAP+1);
        aRemindP[CAP].Txt:=DM.QrEx.FieldByName('Txt').AsString;
        aRemindP[CAP].Img:=TImage.Create(nil);
        aRemindP[CAP].Img.Parent:=SaveScreenF.Panel1;
        aRemindP[CAP].Img.Left:=25;
        aRemindP[CAP].Img.Top:=120;
        aRemindP[CAP].Img.Width:=450;
        aRemindP[CAP].Img.Height:=450;
        aRemindP[CAP].Img.Picture.Assign(jpg);
       end else begin
                 CA:=High(aRemind)+1;
                 SetLength(aRemind,CA+1);
                 aRemind[CA].Txt:=DM.QrEx.FieldByName('Txt').AsString;
                 aRemind[CA].Img:=TImage.Create(nil);
                 aRemind[CA].Img.Parent:=SaveScreenF.Panel1;
                 aRemind[CA].Img.Left:=25;
                 aRemind[CA].Img.Top:=120;
                 aRemind[CA].Img.Width:=450;
                 aRemind[CA].Img.Height:=450;
                 aRemind[CA].Img.Picture.Assign(jpg);
                end;
     finally
      if Assigned(Jpg) then Jpg.Free;
      if Assigned(Blob) then Blob.Free;
     end;
    end;
  except
  end;
 end; {InitColors}

procedure TMainF.CheckShowngUpDownAnalogs;
 begin
{  if ((DM.qrUp.IsEmpty) and (DM.qrDown.IsEmpty) and (DM.qrSop.IsEmpty  and (OstatED>0) )) or (dbgSklad.Height<48) then
   begin
    pnSklad.Height:=pnSkd.Height;
   end else} begin

             dbgUp.Visible:=Not DM.qrUp.IsEmpty;
             dbgDown.Visible:=Not DM.qrDown.IsEmpty;
            {
             sbUp.Visible:=dbgUp.Visible;
             sbDown.Visible:=dbgDown.Visible;

             pnSop.Visible:=Not DM.qrSop.IsEmpty or (OstatED=0);
             if OstatED=0 then dbgSop.Visible:=False
                          else dbgSop.Visible:=True;
             }
             dbgSop.Visible:=False;
             DrawGradientWithRect(imUp,$0000A8A8,clYellow);
             DrawGradientWithRect(imDown,clGreen,clLime);
             DrawGradientWithRect(imSop,clBlue,$00FFAD5B);

             pnSklad.Height:=pnSkd.Height-105;
            end;


//  if (DM.qrSop.IsEmpty=False) or (OstatED=0) then
   begin
    pnUp.Width:=pnSklad.Width div 3;
    pnDown.Width:=pnSklad.Width div 3;
    pnSop.Width:=pnSklad.Width-(pnUp.Width+pnDown.Width);
    pnDown.Left:=pnUp.Width+1;
    pnSop.Left:=pnDown.Width+pnUp.Width+2
   end; { else begin
             pnUp.Width:=pnSklad.Width div 2;
             pnDown.Width:=pnSklad.Width-pnUp.Width;
             pnDown.Left:=pnUp.Width+1;
            end; }
  dbgUp.Columns[1].Width:=dbgUp.Width-131;
  dbgDown.Columns[1].Width:=dbgDown.Width-131;
  dbgSop.Columns[1].Width:=dbgSop.Width-131;

  dbgSklad.Invalidate;
 end;

procedure TMainF.ShowForATC(qr:TADOQuery; P:Byte; P1:Byte=0; P2:Byte=0);
 begin
  try
//   TFake(dbgUp).RowHeights[1]:=30;

{
   dbgUp.DataSource:=nil;
   dbgDown.DataSource:=nil;
}
   qr.Close;
   qr.SQL.Clear;
   qr.SQL.Text:='exec spY_ShowForATC :art, :cena, :param, :atc';
   qr.Parameters.ParamByName('art').Value:=DM.spY_FilterSklad.FieldByName('MakeFrom').AsInteger;
   qr.Parameters.ParamByName('cena').Value:=DM.spY_FilterSklad.FieldByName('cenaup').AsInteger;
   qr.Parameters.ParamByName('param').Value:=P;
   qr.Parameters.ParamByName('atc').Value:=P1;

   qr.Open;
   if P2=1 then
    begin
     if qr=DM.qrUp then
      begin
       dbgUp.Visible:=Not qr.IsEmpty;
//       if qr.IsEmpty=False then TFake(dbgUp).RowHeights[1]:=30;
      end else
     if qr=DM.qrDown then
      begin
       dbgDown.Visible:=Not qr.IsEmpty;
//       if qr.IsEmpty=False then TFake(dbgDown).RowHeights[1]:=30;
      end;
    end;

 {  dbgDown.DataSource:=DM.srDown;
   dbgUp.DataSource:=DM.srUp;
   }
  except
  end;
 end;

procedure TMainF.srSprTovDataChange(Sender:TObject; Field:TField);
var dx,dy:Integer;
//    T:TDateTime;

 Begin
//  T:=Time;
  if DM.spY_FilterSklad.IsEmpty then Exit;

{
  if DBText1.Caption='' then
   begin
    DBText1.Left:=Panel2.Width;
    Panel2.Visible:=False;
    tmStr.Enabled:=False;
   end else begin
             Panel2.Visible:=True;
             tmStr.Enabled:=True;
            end;
}

  DBText1_.Hint:=DBText1_.Caption;
  DBText2.Visible:=DBText1_.Caption<>'';
  Shape4.Visible:=DBText1_.Caption<>'';

  if hKonkurHintF.Visible then hKonkurHintF.Hide;

  FCanShowingKonkurHint:=True;

  try
//  MainF.miNoTov.Enabled:=spY_FilterSklad.FieldByName('Ostat').AsInteger=0;

    lbFullName.Caption:=DM.spY_FilterSklad.FieldByName('Names').AsString;

    lbNamesUA.Caption:=DM.spY_FilterSklad.FieldByName('NamesUA').AsString;
    lbNamesUA.Hint:=DM.spY_FilterSklad.FieldByName('NamesUA').AsString;

    if DM.spY_FilterSklad.FieldByName('NaklBox').AsString<>'' then
     lbFullName.Caption:=lbFullName.Caption+'        № Ящика: '+DM.spY_FilterSklad.FieldByName('NaklBox').AsString;


    // Если курсор стоит на экстемпоральной рецептуре
    if (DM.spY_FilterSklad.FieldByName('TypeTov').AsInteger=2) and (cbExt.Visible=False) then
     begin
      pnUp.Visible:=False;
      pnDown.Visible:=False;
      pnSop.Visible:=False;
      lbExt.Visible:=True;
      Exit;
     end else begin
               pnUp.Visible:=True;
               pnDown.Visible:=True;
               pnSop.Visible:=True;
               lbExt.Visible:=False;
              end;

    lbSkl.Caption:=DM.spY_FilterSklad.FieldByName('OstatSklad').AsString;

    lbApt.Caption:=DM.spY_FilterSklad.FieldByName('OstatAptek').AsString;

    lbPrice.Font.Style:=[fsBold];
    if DM.spY_FilterSklad.FieldByName('InPrice').AsInteger=1 then lbPrice.Caption:='Есть у поставщиков' else
     begin
      lbPrice.Font.Style:=[];
      lbPrice.Caption:='Предположительно дефектура (пробуйте заказать через офис)';
     end;

    bbWhereIs.Enabled:=DM.spY_FilterSklad.FieldByName('OstatAptek').AsInteger>0;
    BitBtn5.Enabled:=DM.spY_FilterSklad.FieldByName('OstatSklad').AsInteger>0;
    BitBtn6.Enabled:=DM.spY_FilterSklad.FieldByName('InPrice').AsInteger=1;

  except
  end;

//  AppendStringToFile('D:\AVA\TimerLog.txt','-----------------------------------------');
//  AppendStringToFile('D:\AVA\TimerLog.txt','1 - '+FormatDateTime('hh:ss:nn.zzz',Time-T)); T:=Time;

  if Design then Exit;
  if (FisKeyDown=False) or (FMouseWheeling) then
   begin
    sbUp.Down:=False;
    ShowForATC(DM.qrUp,0);

//    AppendStringToFile('D:\AVA\TimerLog.txt','2 - '+FormatDateTime('hh:ss:nn.zzz',Time-T)); T:=Time;

    sbDown.Down:=False;
    ShowForATC(DM.qrDown,1);

//    AppendStringToFile('D:\AVA\TimerLog.txt','3 - '+FormatDateTime('hh:ss:nn.zzz',Time-T)); T:=Time;

    try
     DM.qrSop.Close;
     if OstatED>0 then
      begin
       DM.qrSop.SQL.Text:='exec spY_SoputstvSpis :art ';
       DM.qrSop.Parameters.ParamByName('art').Value:=DM.spY_FilterSklad.FieldByName('MakeFrom').AsInteger;
       DM.qrSop.Open;
      end;
    except
    end;

//    AppendStringToFile('D:\AVA\TimerLog.txt','4 - '+FormatDateTime('hh:ss:nn.zzz',Time-T)); T:=Time;

    CheckShowngUpDownAnalogs;
//    AppendStringToFile('D:\AVA\TimerLog.txt','5 - '+FormatDateTime('hh:ss:nn.zzz',Time-T));
//    AppendStringToFile('D:\AVA\TimerLog.txt','-----------------------------------------');
   end;

 End;

// Размещение информационных панелей по центру
procedure TMainF.InitPanels;
var T:TDateTime;
    i:Integer;
 begin
//  miReports.Visible:=Prm.AptekaID<>63;
  T:=Time;

  dbgSklad.DataSource.OnDataChange:=srSprTovDataChange;


  if (Prm.AptekaSklad) and (Prm.Dobraia=False) then
   begin

    lbCenaUpSkd.Caption:='Накопление на карту от 3-x упаковок';
    lbCenaUp.Caption:='Цена за упаковку';
    DM.spY_FilterSkladCenaUp.DisplayFormat:='#0.00';

    dbgChek.Columns[5].Visible:=False;
    dbgChek.Columns[6].Visible:=False;

    {
     lbSkidkaTit.Visible:=False;
     lbIndSkd.Visible:=False;

     lbNalTit.Visible:=False;
     lbIndNal.Visible:=False;
    }
   end else begin
             {if Prm.AptekaID=58 then
              begin
               try
                DM.QrEx.Close;
                DM.QrEx.SQL.Text:='select Min(Skd) as MinSkd,Max(Skd) as MaxSkd from Skd where Type_Skd=1';
                DM.QrEx.Open;
                if DM.QrEx.FieldByName('MinSkd').AsCurrency=DM.QrEx.FieldByName('MaxSkd').AsCurrency then lbCenaUpSkd.Caption:='Цена за упак. с учётом скидки'
                                                                                                     else Abort;
               except
                lbCenaUpSkd.Caption:='Цена за уп. с учётом мин. скидки';
               end;
               //DM.spY_FilterSkladCenaUp.DisplayFormat:='#0 %';
               dbgSklad.Columns[5].Font.Size:=10;
              end else} begin
                        lbCenaUp.Caption:='Цена за упаковку';
                        dbgSklad.Columns[4].Visible:=False;
                        pns4.Width:=0;
                        DM.spY_FilterSkladCenaUp.DisplayFormat:='#0.00';
                       end;
            end;

{
  if Prm.FirmID=5 then
   begin
    btnB1.Left:=157;
   end else begin
             btnPayCash.Width:=109;
             btnPayChek.Left:=120;
             btnPayChek.Width:=90;
            end;
}

  if Prm.FirmID=13 then
   begin
    lbnmCap.Layout:=tlTop;
    cbExt.Visible:=True;
   end;

  if Prm.ShowMenuIcons=False then
   for i:=0 to ComponentCount-1 do
    if Components[i] is TMenuItem then
     begin
      TMenuItem(Components[i]).Bitmap:=nil;
     end;


  pnExt.Left:=675;
  pnExt.Top:=0;

  pnExt.Width:=191;
  pnExt.Height:=226;

  pnFlash.Left:=(Screen.Width-pnFlash.Width) div 2;
  pnFlash.Top:=(Screen.Height-pnFlash.Height) div 2;

  pnUnBase.Left:=(Screen.Width-pnUnBase.Width) div 2;
  pnUnBase.Top:=(Screen.Height-pnUnBase.Height) div 2;

  pnBlChek.Left:=(Screen.Width-pnBlChek.Width) div 2;
  pnBlChek.Top:=85;

  cbBoxZero.Visible:=Not FullSprTov;

  N61.Visible:=Prm.FirmID=13;

 {
  if ((Prm.AptekaSklad) and (Prm.Dobraia=False)) or (Prm.AptekaSklad=False) then N90.Visible:=False
                                                                            else N90.Visible:=True;
 }
 // N90.Visible:=Prm.FirmID=19;

  edLogoEKKA.Text:=Opt.LoadNaklPath+'Logo.bmp';
  tmpButton.Visible:=Design;

  miFNDS1.Visible:=(Prm.UserRole=R_ADMIN);
  miFNDS2.Visible:=(Prm.UserRole=R_ADMIN);

  miFNDS3.Visible:=MainF.BaseCHP and (Prm.UserRole=R_ADMIN);
  miFNDS4.Visible:=MainF.BaseCHP and (Prm.UserRole=R_ADMIN);

  miNDS3.Visible:=MainF.BaseCHP;
  miNDS4.Visible:=MainF.BaseCHP;

  dbgSop.Left:=3; dbgSop.Top:=4;

  if Prm.AptekaSklad then
   begin
    lbPercSkd.Visible:=False;
   end;

  N57.Visible:=((Prm.FirmID=5) and (Opt.EKKAAsPrinter=True)) or (Prm.UserRole=R_ADMIN) ;
//  N57.Visible:=False;

//  Button2.Visible:=Design;
  tmChek.Visible:=Design;
  tmpButton2.Visible:=(Prm.AptekaID in [2,14,18,30..38,54]) or Design;

  ShowStatus('IP-адрес: '+IP,0);
  ShowStatus('Касса '+IntToStr(Opt.KassaID)+' ('+GetCompName+')',1);
  ShowStatus('Сервер: '+Opt.Server,4);
  ShowStatus('Уполн. лицо с '+DateToStr(Prm.AuthorizedDT)+' '+Prm.AuthorizedFIO,5);

//  mpMain.Open;

  if Prm.UserRole=R_DISP then
   begin
    pnMainBottom.Visible:=False;
    pnControl.Visible:=False;
    pnSkd.Visible:=False;
    //pnStatus.Visible:=False;
    cbBoxZero.Checked:=False;
    splMain.Visible:=False;
   end;

  miLTM.Visible:=Prm.RealizMinus;
  bbForceCloseCash.Visible:=EKKA.TypeEKKA=EKKA_DATECS3530T;
  bbForceCloseChek.Visible:=EKKA.TypeEKKA=EKKA_DATECS3530T;
  pnWrEKKA.Visible:=(Prm.UserRole=R_ADMIN) or (Prm.FirmID=1);
  miUnloadRealiz.Visible:=(Prm.FirmID=5) or (Design);
//  CheckBox2.Visible:=Design;


  imFind.Parent:=edCntxSearch;
  imFind.Left:=(edCntxSearch.Width-imFind.Width) div 2;
  imFind.Top:=(edCntxSearch.Height-imFind.Height) div 2;

  DrawRoundRect(imSearch,False,nil);

  imVesh.Top:=0; imVesh.Left:=0;
  imDoz.Top:=0; imDoz.Left:=0;
  imForm.Top:=0; imForm.Left:=0;

  imVesh1.Top:=0; imVesh1.Left:=0;
  imDoz1.Top:=0; imDoz1.Left:=0;
  imForm1.Top:=0; imForm1.Left:=0;

  pnVesh1.Width:=0;
  pnDoz1.Width:=0;
  pnForm1.Width:=0;

  TFake(dbgFi).ScrollBars:=ssNone;
  TWCtrl(dbgFi).BevelKind:=bkTile;
  TWCtrl(dbgFi).BevelInner:=bvLowered;
  TWCtrl(dbgFi).BevelOuter:=bvRaised;

  TWCtrl(dbgUp).BevelKind:=bkFlat;
  TWCtrl(dbgDown).BevelKind:=bkFlat;
  TWCtrl(dbgSop).BevelKind:=bkFlat;

  TFake(dbgDown).ScrollBars:=ssNone;
  TFake(dbgUp).ScrollBars:=ssNone;
  TFake(dbgSop).ScrollBars:=ssNone;

  miCenaUp.Visible:=FullSprTov=False;

  // Меню Extemporo
  pnExtemp:=TExtPanel.Create(Self);
  pnExtemp.Parent:=pnExt;
  pnExtemp.Left:=0;
  pnExtemp.Top:=0;
  pnExtemp.Width:=pnExt.Width;
  pnExtemp.Height:=pnExt.Height;
  pnExtemp.Caption:='';
  pnExtemp.OnMouseLeave:=pnExtMouseLeave;

  pnExtemp1:=TExtPanel.Create(Self);
  pnExtemp1.Parent:=pnExtemp;
  pnExtemp1.BevelOuter:=bvNone;
  pnExtemp1.Left:=7;
  pnExtemp1.Top:=4;
  pnExtemp1.Width:=pnExtemp.Width-14;
  pnExtemp1.Height:=pnExtemp.Height-8;
  pnExtemp1.Caption:='';

  lbExtemp:=TLabel.Create(Self);
  lbExtemp.Parent:=pnExtemp1;
  lbExtemp.AutoSize:=False;
  lbExtemp.WordWrap:=True;
  lbExtemp.Color:=clWhite;
  lbExtemp.Alignment:=taCenter;
  lbExtemp.LayOut:=tlCenter;
  lbExtemp.Font.Style:=[fsBold];
  lbExtemp.Font.Size:=10;
  lbExtemp.Left:=0;
  lbExtemp.Top:=0;
  lbExtemp.Width:=pnExtemp1.Width;
  lbExtemp.Height:=pnExtemp1.Height-27;
  lbExtemp.Caption:='Заказ препаратов по индивидуальным рецептам в аптеке'#10'№1 "Перша",'#10'пл Конституции 20'#10'тел. 093-043-54-78 и '#10'Аптека №308 ул Клочковская 337А'#10'тел. 338-19-92, 773-25-84, 093-043-64-22';

  lbExt.Caption:='Заказ препаратов по индивидуальным рецептам в '#10'Аптеке №1 "Перша",пл Конституции 20 тел. 093-043-54-78 и '#10'Аптека №308 ул Клочковская 337А тел. 338-19-92, 773-25-84, 093-043-64-22';

  bbExtemp:=TBitBtn.Create(Self);
  bbExtemp.Parent:=pnExtemp1;
  bbExtemp.Top:=lbExtemp.Top+lbExtemp.Height+2;
  bbExtemp.Left:=0;
  bbExtemp.Width:=pnExtemp1.Width;
  bbExtemp.Caption:='Заказать';
  bbExtemp.OnClick:=bbExtClick;

  // Панель с кнопками в режиме "Продажи"
  pnBarSale:=TsvBar.Create(Self);
  pnBarSale.Parent:=pnHead;
  pnBarSale.Left:=95;
  pnBarSale.Top:=0;
  pnBarSale.Height:=pnHead.Height;
  pnBarSale.Kind:=brBtns;

  With pnBarSale.Tabs.Add do
   begin
    Btn.Caption:='1-я рек-ция';
    Btn.Hint:='Список первой рекомендации';
    Btn.Tag:=1;
    Btn.ColorDown:=$00DCE1E4;
    Btn.OnClick:=N18Click;
    Btn.Glyph.Assign(imFr.Picture);
   end;

  With pnBarSale.Tabs.Add do
   begin
    Btn.Caption:='Бронь';
    Btn.Hint:='Бронирование препаратов';
    Btn.Tag:=1;
    Btn.ColorDown:=$00DCE1E4;
    Btn.OnClick:=N3Click;
    Btn.Glyph.Assign(imBr.Picture);
   end;

{
  With pnBarSale.Tabs.Add do
   begin
    Btn.Caption:='Справка по товару';
    Btn.Tag:=1;
    Btn.ColorDown:=$00DCE1E4;
    Btn.OnClick:=miNoTovClick;
    Btn.Glyph.Assign(imInf.Picture);
   end;
}

  With pnBarSale.Tabs.Add do
   begin
    Btn.Caption:='Компендиум';
    Btn.Hint:='Сайт компендиум';
    Btn.Tag:=1;
    Btn.ColorDown:=$00DCE1E4;
    Btn.OnClick:=miCompend;
    Btn.Glyph.Assign(imCompend.Picture);
   end;

  With pnBarSale.Tabs.Add do
   begin
//    Btn.Caption:='На складе';
    Btn.Caption:='Заказ под клиента';
    Btn.Hint:='Заказ препаратов на складе';
    Btn.Tag:=1;
    Btn.ColorDown:=$00DCE1E4;
    Btn.OnClick:=N84Click;
    Btn.Glyph.Assign(imSklad.Picture);
   end;

{
  With pnBarSale.Tabs.Add do
   begin
//    Btn.Caption:='На складе';
    Btn.Caption:='Бронь ожидаемого';
    Btn.Hint:='Бронь ожидаемого товара';
    Btn.Tag:=1;
    Btn.ColorDown:=$00DCE1E4;
    Btn.OnClick:=N85Click;
    Btn.Glyph.Assign(imWait.Picture);
   end;
 }
{
  With pnBarSale.Tabs.Add do
   begin
    Btn.Caption:='Приоритеты';
    Btn.Tag:=1;
    Btn.ColorDown:=$00DCE1E4;
    Btn.OnClick:=N68Click;
//    Btn.Glyph.Assign(imPrioritet.Picture);
   end;
}

   pnBar1:=TsvBar.Create(Self);
   pnBar1.Parent:=pnHead;
   pnBar1.Left:=0;
   pnBar1.Top:=0;
   pnBar1.Height:=pnHead.Height;
   With pnBar1.Tabs.Add do
    begin
     Btn.Glyph.Assign(imSale.Picture);
     Btn.Caption:='Продажи';
     Btn.Tag:=1;
//     Btn.ColorUp:=$0093ADCE;
     Btn.ColorDown:=$00DCE1E4;

     Btn.OnClick:=pnTbClick;
     Btn.SelectTab:=True;
    end;
   if Prm.UserRole<>R_DISP then
    With pnBar1.Tabs.Add do
     begin
      Btn.Glyph.Assign(imEK.Picture);
//      Btn.Caption:='Работа с EKKA';
      Btn.Caption:='EKKA';
      Btn.Tag:=2;
//     Btn.ColorUp:=$0093ADCE;
      Btn.ColorDown:=$00DCE1E4;
      Btn.OnClick:=pnTbClick;
     end;

  pnTbClick(pnBar1.Tabs.Items[0].Btn);

  // Дополнительная панель с кнопками
  pnBarDop:=TsvBar.Create(Self);
  pnBarDop.Parent:=pnHead;
  pnBarDop.Top:=0;
  pnBarDop.Height:=pnHead.Height;
  pnBarDop.Kind:=brBtns;

  With pnBarDop.Tabs.Add do
   begin
    Btn.Caption:='          ';
    Btn.ShowHint:=True;
    Btn.Hint:='У Вас есть непройденные тесты';
    Btn.Tag:=4;
    Btn.ColorDown:=$00DCE1E4;
    Btn.OnClick:=ShowNotPassedTests;
    Btn.Visible:=False;
    Btn.Glyph.Assign(imNPT.Picture);
   end;

  With pnBarDop.Tabs.Add do
   begin
    Btn.Caption:='Не собр. в.';
    Btn.Tag:=2;
    Btn.ColorDown:=$00DCE1E4;
    Btn.OnClick:=ShowNotMarkedBack;
    Btn.Visible:=False;
   end;

  With pnBarDop.Tabs.Add do
   begin
    Btn.Caption:='                ';
    Btn.Tag:=2;
    Btn.ColorDown:=$00DCE1E4;
    Btn.OnClick:=N3Click;
    Btn.Visible:=False;
   end;
  With pnBarDop.Tabs.Add do
   begin
    Btn.Caption:='Сообщения';
    Btn.Hint:='История сообщений из офиса';
    Btn.Tag:=2;
    Btn.ColorDown:=$00DCE1E4;
    Btn.OnClick:=lbHistoryClick;
    Btn.Glyph.Assign(imHist.Picture);
   end;
  With pnBarDop.Tabs.Add do
   begin
    Btn.Caption:='Выход';
    Btn.Tag:=3;
    Btn.ColorDown:=$00DCE1E4;
    Btn.OnClick:=ExitClick;
    Btn.Glyph.Assign(imExit.Picture);
   end;
  pnBarDop.Left:=pnHead.Width-pnBarDop.Width-10;
  pnBarDop.Anchors:=[akTop,akBottom,akRight];

  tmWaitComm.Enabled:=True;
  tmFlash.Enabled:=True;

  tmrWaitMessTimer(tmWaterNakl);

//  miOstatInBSklad.Visible:=Prm.AptekaID=138;
 end; {InitPanels}

// Установка прокрутки всех DBGrid колесиком мышки
procedure TMainF.AppMessage(var Msg: TMsg; var Handled:Boolean);
var i:SmallInt;
    vUP,vDown:Boolean;
 begin
  if (Msg.Message=WM_MOUSEWHEEL) or  (Msg.Message=WM_MOUSEMOVE) or (Msg.Message=WM_KEYDOWN) then
   begin
    TerminateFlash:=True;
    ssTime:=Time;
   end;

  if (Msg.Message=WM_KEYDOWN) or (Msg.Message=WM_LBUTTONDOWN) then
   begin
    flTime:=Time;
    TerminateFlash:=True;
   end;

  vUP:=False; vDown:=False;
  if Msg.Message=WM_MOUSEWHEEL then
   begin

    TerminateFlash:=True;

    FMouseWheeling:=True;

    Msg.Message:=WM_KEYDOWN;
    Msg.lParam:=0;
    i:=HiWord(Msg.wParam);
    if i>0 then
     begin
      vUp:=True;
      Msg.wParam:=VK_UP
     end else begin
               vDown:=True;
               Msg.wParam:=VK_DOWN;
              end;

    Handled:=False;

    // Прокрутка в ScrollBox в окне "Информация по аптекам"
    if TovInfoF<>nil then
     try

      if vUp   then TovInfoF.sb1.VertScrollBar.Position:=TovInfoF.sb1.VertScrollBar.Position-50 else
      if vDown then TovInfoF.sb1.VertScrollBar.Position:=TovInfoF.sb1.VertScrollBar.Position+50;

     except
     end;
   end else FMouseWheeling:=False;

 end; {AppMessage}

// Проверка и закрытие незакрытых чеков
function TMainF.CheckNonClosedCheck:Integer;
var CP:TChekPos;
    B1:Boolean;
    B:Integer;
    Vzh:Int64;
 begin
  Result:=1;
  if EKKA.UseEKKA then
   try
    CP.Vzh:=EKKA.VzhNum;
    Vzh:=CP.Vzh;
    CP.VzhSafe:=CP.Vzh;
    CP.VzhS:=EKKA.VzhNumS;
    CP.Fn:=EKKA.Fn;
    CP.ID_Kassa:=Opt.KassaID;
    CP.TypeEKKA:=EKKA.TypeEKKA;

    DM.QrEx.Close;
    DM.QrEx.SQL.Clear;
    DM.QrEx.SQL.Add('declare @RealizDay numeric(12,2), @dt datetime ');
    DM.QrEx.SQL.Add('set @dt=getdate() ');
    DM.QrEx.SQL.Add('exec spY_WriteJournZ @dt,'+IntToStr(CP.Vzh)+','+IntToStr(CP.ID_Kassa)+',1,@RealizDay output ');

    DM.QrEx.SQL.Add('select a.ID_User,a.Numb_Chek,Sum(a.kol*a.cena-a.sumskd) as SumCh, @RealizDay as RealizDay, ');

    DM.QrEx.SQL.Add('       IsNull(Max(b.TypeOpl),0) as TypeOpl, ');
    DM.QrEx.SQL.Add('       IsNull(Max(b.SumSertif),0) as SumSertif, ');
    DM.QrEx.SQL.Add('       IsNull(Max(b.IdRes),-1) as IdRes, ');
    DM.QrEx.SQL.Add('       IsNull(Max(b.ncRecipt),''-1'') as ncRecipt, ');
    DM.QrEx.SQL.Add('       IsNull(Max(b.ncStretch),''-1'') as ncStretch, ');
    DM.QrEx.SQL.Add('       IsNull(Max(b.ncProf),''-1'') as ncProf, ');
    DM.QrEx.SQL.Add('       IsNull(Max(b.Pacient),'''') as Pacient ');

    DM.QrEx.SQL.Add('from Chek a (nolock) left join ChekParams b (nolock) on a.numb_chek=b.numb_chek and a.vzh=b.vzh and a.id_user=b.id_user ');
    DM.QrEx.SQL.Add('where a.type_tov<>99 and a.Numb_Chek is not null and a.Vzh='+IntToStr(CP.Vzh)+' group by a.ID_User,a.Numb_Chek');
//    DM.QrEx.SQL.SaveToFile('C:\Log\ghhhh1.txt');
    DM.QrEx.Open;
    if DM.QrEx.IsEmpty then
     begin
      DM.QrEx.Close;
      DM.QrEx.SQL.Clear;
      DM.QrEx.SQL.Add('declare @RealizDay numeric(12,2), @dt datetime ');
      DM.QrEx.SQL.Add('set @dt=getdate() ');
      DM.QrEx.SQL.Add('exec spY_WriteJournZ @dt,'+IntToStr(CP.Vzh)+','+IntToStr(CP.ID_Kassa)+',1,@RealizDay output ');

      DM.QrEx.SQL.Add('select IsNull(a.Vzh,0) as Vzh,a.ID_User,a.Numb_Chek,Sum(a.kol*a.cena-a.sumskd) as SumCh, @RealizDay as RealizDay, ');
      DM.QrEx.SQL.Add('       IsNull(Max(b.TypeOpl),0) as TypeOpl, ');
      DM.QrEx.SQL.Add('       IsNull(Max(b.SumSertif),0) as SumSertif, ');
      DM.QrEx.SQL.Add('       IsNull(Max(b.IdRes),-1) as IdRes, ');
      DM.QrEx.SQL.Add('       IsNull(Max(b.ncRecipt),''-1'') as ncRecipt, ');
      DM.QrEx.SQL.Add('       IsNull(Max(b.ncStretch),''-1'') as ncStretch, ');
      DM.QrEx.SQL.Add('       IsNull(Max(b.ncProf),''-1'') as ncProf, ');
      DM.QrEx.SQL.Add('       IsNull(Max(b.Pacient),'''') as Pacient ');
      DM.QrEx.SQL.Add('from Chek a (nolock) left join ChekParams b (nolock) on a.numb_chek=b.numb_chek and a.vzh=b.vzh and a.id_user=b.id_user ');
      DM.QrEx.SQL.Add('where a.Numb_Chek is not null and a.dateins>=convert(varchar,getdate(),23) and compname=host_name() group by a.Vzh,a.ID_User,a.Numb_Chek ');
  //     DM.QrEx.SQL.SaveToFile('C:\Log\ghhhh.txt');
      DM.QrEx.Open;
      if DM.QrEx.IsEmpty then Exit;
      Vzh:=Round(DM.QrEx.FieldByName('Vzh').AsFloat);
     end;

//     if ((Prm.AptekaSklad) and (Prm.Dobraia=False)) or (Cp.IsIApteka=True) or (Cp.IsStrah=True) or (Cp.IsPayMaster=True) or (Prm.IsNightCena=True) or (Cp.IdRes<>-1) then SumChek:=SumChek+Qr.FieldByName('CenaP').AsCurrency*Qr.FieldByName('Kol').AsInteger-Qr.FieldByName('SumSkdP').AsCurrency

    CP.ID_User:=DM.QrEx.FieldByName('ID_User').AsInteger;
    CP.NumbChek:=DM.QrEx.FieldByName('Numb_Chek').AsInteger;
    CP.SumChek:=DM.QrEx.FieldByName('SumCh').AsCurrency;

    CP.RealizDay:=DM.QrEx.FieldByName('RealizDay').AsCurrency;

    CP.TypeOplat:=DM.QrEx.FieldByName('TypeOpl').AsInteger;
    CP.SumSertif:=DM.QrEx.FieldByName('SumSertif').AsCurrency;

    CP.IdRes:=DM.QrEx.FieldByName('IdRes').AsInteger;
    FIDRes:=CP.IdRes;

    CP.NumCardRecipt:=StrToInt64(DM.QrEx.FieldByName('ncRecipt').AsString);
    CP.NumCardStretch:=StrToInt64(DM.QrEx.FieldByName('ncStretch').AsString);
    CP.NumCardProf :=StrToInt64(DM.QrEx.FieldByName('ncProf').AsString);
    CP.Pacient:=DM.QrEx.FieldByName('Pacient').AsString;

    CP.TypeChek:=-1;
    CP.IDMess:=0;

    B:=CheckStatusCheck(CP);

{
    DM.QrEx.Close;
    DM.QrEx.SQL.Text:='select * from ChekParams where id_user='+IntToStr(CP.ID_User)+' and Numb_Chek='+IntToStr(CP.NumbChek)+' and Vzh='+IntToStr(CP.Vzh);
    DM.QrEx.Open;
    B1:=DM.QrEx.IsEmpty;

    if B1=False then
     begin
      CP.TypeOplat:=DM.QrEx.FieldByName('TypeOpl').AsInteger;
      CP.SumSertif:=DM.QrEx.FieldByName('SumSertif').AsCurrency;
      CP.IdRes:=DM.QrEx.FieldByName('IdRes').AsInteger;
      CP.NumCardRecipt:=StrToInt64(DM.QrEx.FieldByName('ncRecipt').AsString);
      CP.NumCardStretch:=StrToInt64(DM.QrEx.FieldByName('ncStretch').AsString);
      CP.NumCardProf :=StrToInt64(DM.QrEx.FieldByName('ncProf').AsString);
      CP.Pacient:=DM.QrEx.FieldByName('Pacient').AsString;
      CP.TypeChek:=-1;
      CP.IDMess:=0;
     end;
}

    if B=0 then
     begin
      Result:=0;
      DM.QrEx.Close;
      DM.QrEx.SQL.Clear;
      DM.QrEx.SQL.Add('update Chek set id_user='+IntToStr(Prm.UserID)+' where Numb_Chek is not null and Vzh='+IntToStr(Vzh));
      DM.QrEx.SQL.Add('update ChekParams set id_user='+IntToStr(Prm.UserID)+' where Numb_Chek is not null and Vzh='+IntToStr(Vzh));
      DM.QrEx.ExecSQL;
      CP.ID_User:=Prm.UserID;
      MemCP:=CP;
     end else
    if (B=1) {and (B1=False)} then begin DoneCheck(CP,1) end
                              else begin
                                    DoneCheck(CP,0);
                                    Result:=-1;
                                   end;
   except
    on E:Exception do
     begin
      Result:=-2;
      MainF.MessBox('Ошибка инициализации чека: '+E.Message+#10#10'Попробуйте открыть программу заново!');
      Halt;
     end;
   end;
 end; {CheckNonClosedCheck;}

// Инициализация чека, в частности проверка на непустость чека
procedure TMainF.InitChek;
var B:Integer;
 begin

  B:=CheckNonClosedCheck;
  if B=-2 then Halt;
  FSumSkd:=0;
  FSumChek:=0;
  try

   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;

   DM.QrEx.SQL.Add('delete from Inform..Tmp_Spis where priznak=5 and dateins<convert(varchar,getdate(),23) ');
   DM.QrEx.SQL.Add('exec spY_ClearCheks '+IntToStr(Prm.UserID) );
//   DM.QrEx.SQL.SaveToFile('c:\log\ich.txt');
   DM.QrEx.ExecSQL;

   if DM.qrChek.Active then DM.qrChek.Close;
{
   DM.qrChek.SQL.Clear;
   DM.qrChek.SQL.Add('select a.art_code,a.names,Max(a.art_name) as art_name,Sum(a.kol) as kol,a.cena,a.type_tov,a.f_nds,a.printing,a.skd,Sum(a.kol*a.cena) as SumRow, ');
   DM.qrChek.SQL.Add('       Sum(a.sumskd) as SumSkd, IsNull(Sum(a.SumSkdK),0) as SumSkdK, Sum(a.SumSkdNew) as SumSkdNew, Max(a.SkdNew) as SkdNew, a.CenaP, b.P1,b.P2,b.P3');
   DM.qrChek.SQL.Add('from Chek a (nolock) left join Inform..SprReg b (nolock) on a.art_code=b.art_code                    ');
   DM.qrChek.
   SQL.Add('where a.compname=host_name() and a.id_user='+IntToStr(Prm.UserID) );
   DM.qrChek.SQL.Add('group by a.art_code,a.names,a.CenaP,a.cena,a.f_nds,a.type_tov,a.printing,b.P1,b.P2,b.P3,a.skd ');
   DM.qrChek.SQL.Add('order by a.names                      ');
}

   DM.qrChek.Parameters.ParamByName('pid').Value:=Prm.UserID;
   DM.qrChek.Open;
   if DM.qrChek.IsEmpty then Abort;
   if B=-1 then
    ShowText('Внимание!!!!'#10'Проверьте: нужно ли пробить позиции в данном чеке или нет. Если нет - отмените чек!');

{   try
    StartApp:=True;
    DM.Qr.Close;
    DM.Qr.SQL.Text:='select Max(NumCard) as NumCard from Chek where compname=host_name() and id_user='+IntToStr(Prm.UserID);
    DM.Qr.Open;
    FStNumCard:=DM.Qr.FieldByName('NumCard').AsInteger;
    OpenChek;
   finally
    FStNumCard:=0;
    StartApp:=False;
   end;
 }
   if B=0 then
    begin
     pnBlChek.Visible:=True;
     BlockingChek:=True;
    end;
   OpenChek;
  except
   DM.qrChek.Close;
   FIsCHP:=False;
   SetVisWhenChekOpened(False);
  end;
 end; {InitChek}

// Инициализация фиксированных скидок
procedure TMainF.InitFixSkd;
var i:Integer;
 begin
  try
   if DM.Qr.Active then DM.Qr.Close;
   DM.Qr.SQL.Text:='select skd from Skd (nolock) where Type_Skd=2 order by skd';
   DM.Qr.Open;
   if DM.Qr.IsEmpty then EAbort.Create('Ошибка инициализации фиксированных скидок!');
   cbFixSkd.Clear;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     cbFixSkd.Items.Add(DM.Qr.FieldByName('SKD').AsString);
    end;
   cbFixSkd.ItemIndex:=-1;
  except
   raise EAbort.Create('Ошибка инициализации фиксированных скидок!');
  end;
 end; {InitFixSkd}

procedure TMainF.LoadLogo;
var Bm:TBitMap;
    B:Boolean;
 begin
  try
   B:=True;
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select Value from Spr_Const where Descr=''Logotip'+IntToStr(Opt.KassaID)+''' ';
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Abort;
   if DM.Qr.FieldByName('Value').AsInteger<>1 then Abort;
  except
   B:=False;
  end;
  if B then Exit;
  try
   Bm:=TBitMap.Create;
   try
    Bm.Assign(imLogoEKKA.Picture);
    if Not EKKA.fpLoadLogo(Bm,True) then raise EAbort.Create(EKKA.LastErrorDescr);
    MessBox('Логотип загружен!',64);

    try
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('delete from Spr_Const where Descr=''Logotip'+IntToStr(Opt.KassaID)+''' ');
     DM.Qr.SQL.Add('insert into Spr_Const(Descr,Value) values(''Logotip'+IntToStr(Opt.KassaID)+''',1) ');
     DM.Qr.ExecSQL;
    except
    end;

   finally
    Bm.Free;
   end;
  except
   on E:Exception do MessBox('Ошибка загрузки логотипа: '+E.Message);
  end;
 end;

// Инициализация кассового аппарата
procedure TMainF.InitEKKA;
var Com,S:String;
    B:Boolean;
    i:Integer;

 begin

 {

  MDMDAE021122
  PRSN

 }

  EKKA.EmulEKKA:=Opt.EmulEKKA;
  EKKA.KassaID:=Opt.KassaID;
  EKKA.IP:=FIP;
  EKKA.IPAddr:=Opt.IPAddrEKKA;
  EKKA.ConnectString:=Prm.ConStr;

 // if (Prm.AptekaID=565) then
  EKKA.DiscOnAllSum:=True;

  {if EKKA.EmulEKKA then}
  ShowIndic(CenterStr(FormatDateTime('hh-nn',Now),10));

  EKKA.AptekaID:=Prm.AptekaID;
  EKKA.Qr:=DM.qrEKKA;
  EKKA.QrEx:=DM.qrEKKA1;
  EKKA.Qr1:=DM.qrEKKA2;

  if Prm.IsLogAll=True then EKKA.QrL:=DM.qrRROLog
                       else EKKA.QrL:=nil;

  if Prm.AptekaID in [240] then EKKA.FirmNameUA:='ФЛП Симонян Х.С.'
                           else EKKA.FirmNameUA:=Prm.FirmNameUA;

  EKKA.IsFLP:=Prm.AptekaID=227; // Для Киева 10 спец шапка

  for i:=Low(EKKA.eStr) to High(EKKA.eStr) do EKKA.eStr[i]:=GetValueSC(DM.Qr3,'eStr'+IntToStr(i));

  EKKA.sID:=GetValueSC(DM.Qr3,'eID');
  EKKA.sPN:=GetValueSC(DM.Qr3,'ePN');

  EKKA.sZN:=GetValueSC(DM.Qr3,'bZN'+IntToStr(Opt.KassaID));
  EKKA.sFN:=GetValueSC(DM.Qr3,'bFN'+IntToStr(Opt.KassaID));

  EKKA.Log:=meEKKA.Lines;

{
  if Prm.AptekaSklad=True then EKKA.TypeLogo:=1
                          else EKKA.TypeLogo:=0;

}
  EKKA.TypeLogo:=2;
  EKKA.Kassir:=''; //Copy(Prm.ZavApteki,1,Pos(' ',Prm.ZavApteki)-1);

  if Prm.UserRole=R_ADMIN then EKKA.UseEKKA:=False;
  FUseEKKASafe:=EKKA.UseEKKA;
  cbEKKA.Checked:=Not(EKKA.UseEKKA);
  if EKKA.UseEKKA=False then Exit;
  B:=EKKA.fpConnect;

  ShowErrorEKKA(B);
  if Not B then Exit;

  EKKA.fpCutBeep(1,0,0);

{
  EKKA.fpZeroCheck;
  if EKKA.LastError='HARDCUTTER' then
   begin
    EKKA.fpCutBeep(0,0,0);
   end;
}
  if EKKA.TypeEKKA<>EKKA_MARRY301MTM then Exit;

  EKKA.fpActiveLogo(0);

  Com:='BLFI03';
  EKKA.fpSendCommand(Com);

  // Получаем номер последнего чека
{
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select Max(numb_chek) as NCh from ArhCheks (nolock) where vzh='+IntToStr(EKKA.VzhNum));
   DM.Qr.Open;
   FLastNumbRecipt:=DM.Qr.FieldByName('NCh').AsInteger;
  except
   FLastNumbRecipt:=0;
  end;
}
{
  if Prm.IsLogo=False then
   begin

    EKKA.fpActiveLogo(0);

   end else begin
             LoadLogo;
             if (Prm.AptekaSklad) or (Prm.FirmID=5) then EKKA.fpActiveLogo(96)
            end;
}

  EKKA.fpSetBottomStr('');
  EKKA.fpSetBottomStrEx(CenterStr('БАЖАЄМО ВАМ ЗДОРОВ''Я',21),0,0,3);

  Com:='drel';
  if EKKA.fpSendCommand(Com) then
   if EKKA.fpServPassw('2222222222') then
    begin
     Com:='dset 0100';
     EKKA.fpSendCommand(Com);
     Com:='UPAS1111111111'+EKKA.Kassir;
     EKKA.fpSendCommand(Com);
    end;

  try
   if EKKA.fpGetLimitStatus then
    begin
{
     ShowMessage(EKKA.RD_Item[0]);
     ShowMessage(EKKA.RD_Item[1]);
     ShowMessage(EKKA.RD_Item[2]);
     ShowMessage(EKKA.RD_Item[3]);
}
     if (StrToInt(EKKA.RD_Item[2])-StrToInt(EKKA.RD_Item[3])<30) or
        (StrToInt(EKKA.RD_Item[2])-StrToInt(EKKA.RD_Item[3])<10000)
     then
//     ShowMessage('100');

     if Not EKKA.fpServPassw('2222222222') then raise EAbort.Create(EKKA.LastErrorDescr);
     if Not EKKA.fpPrintLimit(StrToInt(edKolStr.Text)) then raise EAbort.Create(EKKA.LastErrorDescr);
     if Not EKKA.fpDayLimit(StrToInt(edKolDay.Text)) then raise EAbort.Create(EKKA.LastErrorDescr);

     Com:='UPAS1111111111'+EKKA.Kassir;
     EKKA.fpSendCommand(Com);

{
     if EKKA.fpServPassw('2222222222') then
       begin
        EKKA.fpPrintLimit(4500000);
        EKKA.fpDayLimit(548);
        Com:='UPAS1111111111'+EKKA.Kassir;
        EKKA.fpSendCommand(Com);
       end;
}

    end;
  except
//   on E:Exception do MessBox(E.Message);
  end;
//  S:='PPOD1'; EKKA.fpSendCommand(S);
 end;{InitEKKA}

// Вывод настраиваемого окна сообщения
function TMainF.MessBox(Mes:String; Btn:Integer):Integer;
 begin
  Application.ProcessMessages;
  Result:=Application.MessageBox(PChar(Mes),PChar(MFC),Btn);
 end; {MessBox}

// Вывод сообщения с кнопкой OK и типом MB_ICONWARNING
function TMainF.MessBox(Mes:String):Integer;
 begin
  Application.ProcessMessages;
  Result:=Application.MessageBox(PChar(Mes),PChar(MFC),48);
 end; {MessBox}

// Вывод настраиваемого окна сообщения с изменяемым шрифтом
//function TMainF.MessBox(Mes:String; Btn:Integer; FSize:Integer; FColor:TColor; FStyle:TFontStyles; Caption:String=''; bBtn:TBitBtn=nil):Integer;
function TMainF.MessBox(Mes:String; Btn:Integer; F:TFont; AutoClose:Integer; var Res:String; URes:Boolean=False; Caption:String='';  bBtn:TControl=nil):Integer;
 begin
  MessBoxF:=TMessBoxF.Create(Self);
  try
   MessBoxF.Caption:=MFC;
   MessBoxF.Label1.Caption:=Mes;
   MessBoxF.Label1.AutoSize:=True;

   if AutoClose>0 then
   MessBoxF.MaxIncr:=AutoClose;

   if Assigned(F) then
   MessBoxF.Label1.Font:=F;

   MessBoxF.Height:=MessBoxF.Height-(276-MessBoxF.Label1.Height);
   MessBoxF.ledText.Visible:=URes;
   MessBoxF.Label2.Caption:=Caption;
   if Caption<>'' then
    begin
     MessBoxF.Height:=MessBoxF.Height+30;
     MessBoxF.Label1.Top:=MessBoxF.Label1.Top+30;
    end;

   MessBoxF.Top:=Screen.Height-MessBoxF.Height;
   if Btn=52 then MessBoxF.TypeDiag:=1
             else MessBoxF.TypeDiag:=0;

   if Assigned(bBtn) then
    begin
     bBtn.Parent:=MessBoxF.Panel1;
     bBtn.Left:=15;
     bBtn.Top:=15;
    end;

   Application.ProcessMessages;
   MessBoxF.ShowModal;
   if URes then Res:=MessBoxF.ledText.Text;
   if MessBoxF.Flag=1 then Result:=ID_YES else Result:=ID_NO;
  finally
   if Assigned(bBtn) then bBtn.Parent:=nil;
   if Assigned(F) then F.Free;
   MessBoxF.Free;
  end;
//  Result:=Application.MessageBox(PChar(Mes),PChar(MFC),Btn);
 end; {MessBox}

// Проверка прав текущего пользователя из списка указанных прав в множестве S
function TMainF.IsPermit(S:TByteSet; Mes:String; Param:Byte):Boolean;
var ss:TByteSet;
 begin
  try
   Result:=False;
   ss:=[]; Include(ss,R_ADMIN);
   // Права для Сумской 3 , там где нет заведующей

//   if (Prm.AptekaID=152) and (Prm.ID_Gamma=7756) then Include(ss,R_SUPER);

   if Prm.UserRole in (S+ss) then Result:=True else
    begin
     if Param<>P_ALERT then Exit;
     try
      FlagD:=0;
      DialogF:=TDialogF.Create(Self);
      try
       Application.ProcessMessages;
       DialogF.ShowModal;
       if FlagD=0 then Exit;
       if Prm.UserRole in (S+ss) then Result:=True;
      finally
       DialogF.Free;
      end;
     except
      MessBox(Mes,48); Exit;
     end;
    end;

  finally
   Prm.UserRole:=Prm.SafeUserRole;
  end;
 end; {IsPermit}

// Проверка прав текущего пользователя из списка указанных прав в множестве S с фиксированным сообщением
function TMainF.IsPermit(S:TByteSet; Param:Byte):Boolean;
 begin
  Result:=IsPermit(S,'У вас нет прав на эту операцию',Param);
 end; {IsPermit}

procedure TMainF.dbgSkladSetFocused;
 begin
  if (dbgSklad.Enabled) and (dbgSklad.Visible) then dbgSklad.SetFocus;
 end;

// Activate формы
procedure TMainF.FormActivate(Sender:TObject);
 begin
  if (FStartApp=False) and (FIsMaximized) then WindowState:=wsMaximized;
  dbgSklad.Visible:=True;
  dbgSkladSetFocused;
  flTime:=Time;
  ActivateKeyboardLayout(RULng, 0);
  tmrFlushPasswTimer(nil);
//  if EKKA.TypeEKKA=EKKA_MARRY301MTM then WriteToJournZ(0,0,0,0,0);
  if Prm.UserRole=R_DISP then
   begin
    pnSklad.Width:=Screen.Width-10;
    pnSklad.Height:=Screen.Height-163;
    pnStatus.Top:=pnSklad.Top+pnSklad.Height+1;
   end;
//  RegisterHotKey(MainF.Handle,id_SnapShot,0,VK_SNAPSHOT);
  tmPlay.Enabled:=True;
  FIsMaximized:=False;

  Constraints.MaxWidth:=Screen.Width;
  Constraints.MaxHeight:=Screen.Height-55;
 end; {FormActivate}

procedure TMainF.ResizePnFi;
 begin
  pnVesh1.Left:=edVesh.Left+edVesh.Width-pnVesh1.Width-2; pnVesh1.Top:=edVesh.Top+2;
  pnDoz1.Left:= edDoz.Left+ edDoz.Width- pnDoz1.Width -2; pnDoz1.Top:= edDoz.Top+2;
  pnForm1.Left:=edForm.Left+edForm.Width-pnForm1.Width-2; pnForm1.Top:=edForm.Top+2;

  pnVesh.Left:=edVesh.Left+edVesh.Width-pnVesh1.Width-pnVesh.Width-3; pnVesh.Top:=edVesh.Top+2;
  pnDoz.Left:= edDoz.Left+ edDoz.Width- pnDoz1.Width- pnDoz.Width -3; pnDoz.Top:= edDoz.Top+2;
  pnForm.Left:=edForm.Left+edForm.Width-pnForm1.Width-pnForm.Width-3; pnForm.Top:=edForm.Top+2;
 end;

// Resize формы
procedure TMainF.FormResize(Sender:TObject);
var chX,dx,i:Integer;
 begin
  try

   // Равномерное размещение переключателей типов товаров
   if (Opt.ShowRegFull=False) or FullSprTov then
    begin
     dbgSklad.Columns[10].Width:=0;
     dbgSklad.Columns[11].Width:=0;
    end;

   if FullSprTov then
    begin
     dbgSklad.Columns[3].Visible:=False;
     dbgSklad.Columns[4].Visible:=False;
     dbgSklad.Columns[6].Visible:=False;
     dbgSklad.Columns[5].Visible:=False;
    end;

   dx:=0; for i:=0 to dbgSklad.Columns.Count-1 do if i<>2 then Inc(dx,dbgSklad.Columns[i].Width);

   if Prm.UserRole<>R_DISP then dbgSklad.Columns[2].Width:=Width-dx-241
                           else dbgSklad.Columns[2].Width:=Width-dx-61;

   pns2.Width:=dbgSklad.Columns[2].Width+1;

   for i:=3 to dbgSklad.Columns.Count-1 do
    begin
     TPanel(FindComponent('pns'+IntToStr(i))).Width:=dbgSklad.Columns[i].Width+1;
     TPanel(FindComponent('pns'+IntToStr(i))).Left:=TPanel(FindComponent('pns'+IntToStr(i-1))).Left+TPanel(FindComponent('pns'+IntToStr(i-1))).Width;
    end;

   pnse.Left:=pns13.Left+pns13.Width;

   if Width<1280 then bbWhereIs.Caption:='Узнать где'
                 else bbWhereIs.Caption:='Узнать где и забронировать';

  {

   edVesh.Width:=112+Width-1012;
   edDoz.Left:=edVesh.Left+edVesh.Width+14;
   edForm.Left:=edDoz.Left+edDoz.Width+14;

   imSearch2.Width:=edVesh.Width+edDoz.Width+edForm.Width+37;
   Panel3.Left:=imSearch2.Left+imSearch2.Width+3;
   Panel3.Width:=pnSklad.Width-(imSearch2.Left+imSearch2.Width+5);

  }

   if Length(NmFilter)>2 then
    begin
     dbgSklad.DataSource.DataSet.DisableControls;
     TStringGrid(dbgSklad).DefaultRowHeight:=42;
     dbgSklad.DataSource.DataSet.EnableControls;
    end else begin
              dbgSklad.DataSource.DataSet.DisableControls;
              TStringGrid(dbgSklad).DefaultRowHeight:=25;
              dbgSklad.DataSource.DataSet.EnableControls;
             end;

   DrawRoundRect(imSearch2,False,nil);

   // Растяжка колонок dbgChek
   RisizeDBGrid(dbgChek,20);


   CheckShowngUpDownAnalogs;

   Shape4.Left:=pnBarSale.Left+pnBarSale.Width+5;
   Shape4.Width:=pnBarDop.Left-Shape4.Left-5;

   DBText1_.Left:=Shape4.Left+1;
   DBText1_.Width:=Shape4.Width-2;
{
   dbgSklad.DataSource.DataSet.DisableControls;
//   TStringGrid(dbgSklad).DefaultRowHeight := 40;
   TStringGrid(dbgSklad).RowHeights[2]:=60;
   dbgSklad.DataSource.DataSet.EnableControls;
}
  {
   DrawRectBlue(imUp);
   DrawRectBlue(imDown);
  }
  except
  end;
 end; {FormResize}

// Проверка чека на предмет неотсканированных позиций
function TMainF.CheckScan(var Pers:String):Boolean;
var Q1,Q2:Integer;
 begin
  Pers:='Чек не проверен';
  try
   if Not(DM.qrChek.Active) then Abort;
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select art_code from Chek (nolock) where IsNull(PRINTING,0)<>1 and compname=host_name() and ID_USER = '+IntToStr(Prm.UserID)+' group by art_code';
   DM.Qr.Open;
   Q2:=DM.qrChek.RecordCount;
   Q1:=DM.Qr.RecordCount;
   if Q1>0 then
    begin
     Pers:='Чек не проверен на '+IntToStr(Round(100*Q1/Q2))+'%';
    end else Abort;
   Result:=True;
  except
   Result:=False;
  end
 end; {CheckScan}

// Установка видимости/невидимости компонентов в процесе окрытия/закрытия чека
procedure TMainF.SetVisWhenChekOpened(V:Boolean);
var P:String;
 begin
  btnCChek.Enabled:=V;
  btnPayCash.Enabled:=V;
  btPrnChek.Enabled:=V;

  btSumChek.Enabled:=V;
  btnPayChek.Enabled:=V;
  sbRecipt.Enabled:=V;
  sbProf.Enabled:=V;
  if TypeCardNew=1 then sbBskd.Enabled:=False
                   else sbBskd.Enabled:=V;
  sbGoldG.Enabled:=V;
//  btnBack.Enabled:=V;
  sbMag.Enabled:=V;
  sbMediCard.Enabled:=V;
  sbMDMU.Enabled:=V;
  sbMDMU1.Enabled:=V;
  sbIApt.Enabled:=V;
  sbBaer.Enabled:=V;

  if V then
   begin
//    btnBack.Enabled:=TypeChek=TC_BACK;
    btnPayChek.Enabled:=Not (TypeChek=TC_STRETCH) and Not (TypeChek=TC_SERTIF) and  Not (TypeChek=TC_BACK) and Not lbNumCard50.Visible;
    btnPayCash.Enabled:=Not (TypeChek=TC_BACK);

    if FIsKurDostMakeOut=True then btnPayChek.Enabled:=False;

    lbChek.Visible:=CheckScan(P);
    lbChek.Caption:=P;

    bbReserve.Enabled:=btnPayChek.Enabled and (ForReserve=False);
//    ForReserve:=False;
   end else begin
             sbMag.Down:=False;
             sbIApt.Down:=False;
             sbBaer.Down:=False;
             bbReserve.Enabled:=V;
             lbChek.Visible:=V;
             FChekOpened:=False;
             Type_Skd:=SK_NONE;
             if dbgSklad.Visible then dbgSklad.Enabled:=True;
             sbCard.Enabled:=True;
             miCardSkd.Enabled:=True;
             sbIApt.Enabled:=V;
            end;
//  btnB1.Enabled:=btnPayChek.Enabled;

  dbgChek.Visible:=V;
  btnOChek.Enabled:=Not V;
  miPrepChek.Enabled:=Not V;
  miChekKurier.Enabled:=Not V;
  miSktretchChek.Enabled:=Not V;
  miBackToSklad.Enabled:=Not V;
  miPilotTmp.Enabled:=Not V;
  miChekPilot.Enabled:=Not V;

  pnIndicator.Visible:=V;

  if (Prm.AptekaSklad) and (Prm.Dobraia=False) then
   begin

    if (Type_Skd<>SK_CARD) or (Prm.IsNewDiscOpt=False) then
     begin
      lbIndSkd.Visible:=False;
      lbIndNal.Visible:=False;
     end else begin
               lbIndNal.Visible:=V;
               lbIndSkd.Visible:=V;
              end;
    lbPrSkd.Visible:=False;
   end else begin
             lbIndNal.Visible:=V;
             lbIndSkd.Visible:=V;
             lbPrSkd.Visible:=V;
            end;

  lbIndAll.Visible:=V;
  Label26.Visible:=V;
  lbMaxSumSpis.Visible:=V;
  lbNCrd.Visible:=V;
  pnCash.Visible:=V;
  lbCash.Visible:=V;
  lbSumCash.Visible:=V;
  imCash.Visible:=V;
//  lbMB.Visible:=V;
//  lbMBInfo.Visible:=V;
  if V=False then edCash.Text:='0' else
  //if dbgSklad.Visible then dbgSklad.SetFocus;
  dbgSkladSetFocused;
  lbSearch.Caption:='';
  lbCheck.Caption:='';
 end; {SetVisWhenChekOpened}

// Управление камерой
procedure TMainF.StartCamera(Param:Integer);
 begin
  try
   if Opt.Camera<>1 then Exit;
   PostMessage(FindWindow('TMain','BeholdTV'),WM_USER+200,WM_USER+Param,0);
   Application.ProcessMessages;
  except
  end;
 end; {StartCamera}

function TMainF.CheckSmena:Boolean;
 begin
  try

   if IsStudyRoom then begin Result:=True; Exit; end;

   if {Design} (ChekOpened=True) or (Prm.IsEnterVideoPassw=True) then begin Result:=True; Exit; end;

   DM.QrEx1.Close;
   DM.QrEx1.SQL.Clear;
   DM.QrEx1.SQL.Add('declare @dt datetime, @d1 varchar(50), @d2 varchar(50), @idu int');
   DM.QrEx1.SQL.Add('set @dt='''+FormatDateTime('yyyy-mm-dd',StartOfTheWeek(Date))+''' ');
   DM.QrEx1.SQL.Add('set @idu='+IntToStr(Prm.UserID));

   DM.QrEx1.SQL.Add('if (select Count(*) ');
   DM.QrEx1.SQL.Add('from Inform..DhGrafik h (nolock),');
   DM.QrEx1.SQL.Add('     Inform..DtGrafik t (nolock)');

   DM.QrEx1.SQL.Add('where h.idtab=t.idtab and h.dtstart=@dt and ');

   DM.QrEx1.SQL.Add('      ((d'+IntToStr(DayOfTheWeek(Date))+'1 like ''%:%_%:%'' and d'+IntToStr(DayOfTheWeek(Date))+'1 not like  ''0:0-0:0%'') or ');
   DM.QrEx1.SQL.Add('       (d'+IntToStr(DayOfTheWeek(Date))+'2 like ''%:%_%:%'' and d'+IntToStr(DayOfTheWeek(Date))+'2 not like  ''0:0-0:0%'') ) and ');

   DM.QrEx1.SQL.Add('       (dbo.CheckInterv(dtstart+'+IntToStr(DayOfTheWeek(Date)-1)+',d'+IntToStr(DayOfTheWeek(Date))+'1,getdate())=1 or ');
   DM.QrEx1.SQL.Add('        dbo.CheckInterv(dtstart+'+IntToStr(DayOfTheWeek(Date)-1)+',d'+IntToStr(DayOfTheWeek(Date))+'2,getdate())=1  ) and ');
   DM.QrEx1.SQL.Add('      t.id_user=@idu)>0 select 1 as Res else ');

   DM.QrEx1.SQL.Add(' if @dt<convert(datetime,convert(varchar,getdate(),23))');
   DM.QrEx1.SQL.Add('  begin ');
   DM.QrEx1.SQL.Add('   if (select Count(*) ');
   DM.QrEx1.SQL.Add('   from Inform..DhGrafik h (nolock),');
   DM.QrEx1.SQL.Add('        Inform..DtGrafik t (nolock)');
   DM.QrEx1.SQL.Add('   where h.idtab=t.idtab and h.dtstart=@dt and ');

{
   DM.QrEx1.SQL.Add('     ((d'+IntToStr(DayOfTheWeek(Date-1))+'1 like ''%:%_%:%'' and d'+IntToStr(DayOfTheWeek(Date-1))+'1 not like  ''0:0-0:0%'') or ');
   DM.QrEx1.SQL.Add('      (d'+IntToStr(DayOfTheWeek(Date-1))+'2 like ''%:%_%:%'' and d'+IntToStr(DayOfTheWeek(Date-1))+'2 not like  ''0:0-0:0%'') ) and ');
}
   DM.QrEx1.SQL.Add('        dbo.CheckInterv(dtstart+'+IntToStr(DayOfTheWeek(Date-1)-1)+',d'+IntToStr(DayOfTheWeek(Date-1))+'1,getdate())=0 and t.id_type=1 and ');
   DM.QrEx1.SQL.Add('        t.id_user=@idu)>0 select 0 as Res else select 1 as Res');
   DM.QrEx1.SQL.Add('  end else');


   DM.QrEx1.SQL.Add('   if (select Count(*) ');
   DM.QrEx1.SQL.Add('   from Inform..DhGrafik h (nolock),');
   DM.QrEx1.SQL.Add('        Inform..DtGrafik t (nolock)');
   DM.QrEx1.SQL.Add('   where h.idtab=t.idtab and h.dtend=@dt-1 and ');
{   DM.QrEx1.SQL.Add('     ((d'+IntToStr(DayOfTheWeek(Date-1))+'1 like ''%:%_%:%'' and d'+IntToStr(DayOfTheWeek(Date-1))+'1 not like  ''0:0-0:0%'') or ');
   DM.QrEx1.SQL.Add('      (d'+IntToStr(DayOfTheWeek(Date-1))+'2 like ''%:%_%:%'' and d'+IntToStr(DayOfTheWeek(Date-1))+'2 not like  ''0:0-0:0%'') ) and ');
}
   DM.QrEx1.SQL.Add('         dbo.CheckInterv(h.dtend,d71,getdate())=0 and t.id_type=1 and ');
   DM.QrEx1.SQL.Add('         t.id_user=@idu)>0 select 0 as Res else select 1 as Res');

{
   DM.QrEx1.SQL.Add('select dbo.CheckInterv(dtstart+'+IntToStr(DayOfTheWeek(Date)-1)+',d'+IntToStr(DayOfTheWeek(Date)-1)+'1,getdate()), ');
   DM.QrEx1.SQL.Add('       dbo.CheckInterv(dtstart+'+IntToStr(DayOfTheWeek(Date)-1)+',d'+IntToStr(DayOfTheWeek(Date)-1)+'2,getdate()) ');
   DM.QrEx1.SQL.Add('from Inform..DhGrafik h,');
   DM.QrEx1.SQL.Add('     Inform..DtGrafik t ');
   DM.QrEx1.SQL.Add('where h.idtab=t.idtab and h.dtstart=@dt and ');
   DM.QrEx1.SQL.Add('      t.id_user='+IntToStr(Prm.UserID)+' ');
 }

//   DM.QrEx1.SQL.SaveToFile('C:\Smena.txt');

   DM.QrEx1.Open;
   Result:=DM.QrEx1.FieldByName('Res').AsInteger=1;
  except
   Result:=True;
  end;
  if Result=False then
   MessBox('Ваша смена закончилась! Дальнейшая торговля невозможна!');
 end;

// Открывает чек
procedure TMainF.OpenChek;
var NC:Int64;
    S:String;

 procedure ShowCardRead;
 var IsSkd:Boolean;
     tm:TDateTime;

  begin
   if (Prm.IsSoc) and (FTypeChek=TC_STRETCH) then Exit;
   if (Prm.FirmID=13) and (Prm.AptekaID<>180) and (Prm.AptekaID<>330) and (Prm.AptekaID<>462) then Exit;

   if FIsChSeria then Exit;
   if (FIDRES<>-1) and (FTypeRes=1) then Exit;
   tm:=Time;
   IsDay:=True;
   if StrToTime(Prm.StartTime)>StrToTime(Prm.EndTime) then
    begin
     if (tm>StrToTime(Prm.StartTime)) or (tm<StrToTime(Prm.EndTime)) then IsDay:=False;
    end else
     if (tm>StrToTime(Prm.StartTime)) and (tm<StrToTime(Prm.EndTime)) then IsDay:=False;

   if (FIsStart=False) then
    begin
     IsSkd:=True;

     if DM.qrChek.IsEmpty and IsDay and IsSkd and (Prm.SumSkd>0) then
      begin
       FIsOneRegCard:=False;
       SwitchSkd(sbCard,miCardSkd);
      end;

    end else begin
              DM.Qr.Close;
              DM.Qr.SQL.Clear;
              DM.Qr.SQL.Add('declare @nc numeric(13,0) ');
              DM.Qr.SQL.Add('set @nc=IsNull((select top 1 NumCard from Chek (nolock) where compname=host_name() and id_user=:idu),-1)');
              DM.Qr.SQL.Add('select @nc as NumCard,IsNull(AccumSum,0) as AccumSum,IsNull(TypeCard,0) as TypeCard from Cards where NumCard=@nc');
              DM.Qr.Parameters.ParamByName('idu').Value:=Prm.UserID;

//              DM.Qr.SQL.Add('select *,convert(numeric(13,0),numcard) as NumCardN from Chek (nolock) where compname=host_name() and id_user='+IntToStr(Prm.UserID));
              DM.Qr.Open;
              if DM.Qr.IsEmpty then Exit;
              if DM.Qr.FieldByName('NumCard').AsFloat>0 then
               begin
                NumCard:=Round(DM.Qr.FieldByName('NumCard').AsFloat);
                TypeCard:=1;
                TypeCardNew:=DM.Qr.FieldByName('TypeCard').AsInteger;
                AccumSum:=DM.Qr.FieldByName('AccumSum').AsCurrency;
                sbCardClick(sbCard);
                {Type_Skd:=SK_CARD;
                sbCard.Down:=True;}
               end else Type_Skd:=SK_NONE;
             end;
  end;

 function CheckPredopl(var Sum:Real; var NCh:Integer):Boolean;
 var FIO,DateR:String;
     Dt:TDateTime;
     FB:TForBack;
  begin
   try
    Result:=True;
    Sum:=0; NCh:=0;
    if TypeChek<>TC_PREP then Exit;
    if Not EnterIntValue(NCh,'Введите номер предоплатного чека') then Abort;
    DM.Qr3.Close;
    DM.Qr3.SQL.Text:='select IsNull(Sum(cena),0) as Sm from ArhCheks (nolock) where kod_name=0 and Numb_Chek='+IntToStr(NCh)+' and Vzh='+IntToStr(EKKA.VzhNum);
    DM.Qr3.Open;
    if (DM.Qr3.IsEmpty) or (DM.Qr3.FieldByName('Sm').AsFloat<=0) then
     begin
      MessBox('Чек с номером "'+IntToStr(NCh)+'" не найден! '#10' Возможно он пробит на другой кассе или не является предоплатным!');
      Abort;
     end;
    Sum:=DM.Qr3.FieldByName('Sm').AsFloat;

    if { (Prm.AptekaID<>123) and } Not ((Prm.AptekaID=4) and (Opt.KassaID=5)) then
     begin
      {try
     ShowBackClInstructF:=TShowBackClInstructF.Create(Self);
     try
      ShowBackClInstructF.ShowModal;
     finally
      ShowBackClInstructF.Free;
     end;
    except
    end;}

      if MessBox('Напечатать бланк "Согласие на сбор и обработку персональных данных"',52)<>ID_YES then Abort;

      FormForVozrF:=TFormForVozrF.Create(Self);
      try

       FormForVozrF.Edit5.Enabled:=False;
       FormForVozrF.Edit5.Clear;
       FormForVozrF.Edit5.Items.Add('предоплата товара');
       FormForVozrF.Edit5.ItemIndex:=0;

       Application.ProcessMessages;
       FormForVozrF.ShowModal;
       if FormForVozrF.Flag<>1 then  Abort;
       mVF:=FormForVozrF.VF;

      finally
       FormForVozrF.Free;
      end;

     FIO:=mVF.F+' '+mVF.N+' '+mVF.O;

     DateR:=DateToStr(mVF.DateR);

     FB.NumCard:=0;
     FB.FIO:=FIO;
     FB.DateR:=DateToStr(mVF.DateR);
     FB.Dt:=Date;

     PrintBlankForRegCard(FB);

    end;

   except
    Sum:=0; NCh:=0;
    TypeChek:=TC_MAIN;
    Result:=False;
   end;
  end;

 function CheckSertif(var Sum:Currency):Boolean;
 var nc:Int64;
  begin
   try

    Result:=True;
    Sum:=0;
    if Not (TypeChek in [TC_SERTIF,TC_STRETCH,TC_MOMBABY]) then Exit;

    if TypeChek=TC_SERTIF then
     if Not EnterCurrValue(Sum,'Введите сумму сертификата!') then Abort;

    if TypeChek in [TC_STRETCH,TC_MOMBABY] then
     begin
      ScanStretchF:=TScanStretchF.Create(Self);
      try

       ScanStretchF.Param:=TypeChek;
       Application.ProcessMessages;
       ScanStretchF.ShowModal;
       if (ScanStretchF.Flag=0) or (ScanStretchF.Summ<=0) then Abort;
       Sum:=ScanStretchF.Summ;

       if TypeChek=TC_STRETCH then FNumCardStretch:=0;
      finally
       ScanStretchF.Free;
      end;

     end;

   except
    Sum:=0;
    Result:=False;
   end;
  end;

 Begin
//   if not EKKA.fpGetStatus then
//     EKKA.fpGetStatus;

  if EKKA.TypeEKKA=EKKA_N707 then
   begin
    if not EKKA.fpGetStatus then exit;
   end
  else EKKA.fpGetStatus;

  FlagW:=False;
  if (IsPermit([R_SUPER,R_KASSIR,R_OPER,R_PROVIZ],P_SILENT)) then
   if Not (ChekOpened) then
    try

     FSumCashToCard:=0;
     FSafeSumCashToCard:=0;
     FSafeSumSpis:=0;
     FIsQCard:=False;
     FSafePercentSkd:=0;
     FIsTerminal:=False;
     FNumGeptralCard:='';
     FNumKsareltoCard:='';
     FNumCardDnepr:=-1;
     FCopyChek:=False;
     Fid_doctorAll:=0;
     Fid_doctor:=0;
     Fcard_doctor:='';
     FIsBirth:=0;
     dbgChek.Enabled:=True;

     try
      DM.Qr.Close;
      DM.Qr.SQL.Text:='select Value from Spr_Const (nolock) where Descr=''ZavApteki'' ';
      DM.Qr.Open;
      Prm.ZavApteki:=DM.Qr.FieldByName('Value').AsString;
     except
     end;

     if Not CheckSmena then Exit;

     if Prm.AptekaID=4 then AppendStringToFile('D:\AVA\TypeCheks.txt',DateTimeToStr(Now)+' : '+IntToStr(Prm.UserID)+' : '+IntToStr(TypeChek));

     IsDay:=True;
     FNumCardStretch:=-1;
     FNumCardRecipt:=-1;
     lbMBInfo.Caption:='0';
     FAccumSum:=0;

     if Not CheckPredopl(FSumPChek,FNPChek) then Exit;
     Case TypeChek of
      TC_SERTIF:if Not CheckSertif(FSumSertif) then Exit;
      TC_STRETCH:if Not CheckSertif(FSumSertif) then Exit;
      TC_MOMBABY:if Not CheckSertif(FSumMomBaby) then Exit;
      TC_SROK:begin
               NC:=GetEANDiag('229,230','сроковом стикере');
               if NC=-1 then Exit;
               NC:=StrToInt(Copy(IntToStr(NC),11,2));
               if Not (NC in [20,30,50]) then
                begin
                 MessBox('Скидка не опознана!');
                 Exit;
                end;
               Case NC of
                20:FNReestrSrok:=3;
                30:FNReestrSrok:=2;
                50:FNReestrSrok:=1;
               end;
              end;
     end;

     sbBSkd.Down:=False;
     sbGoldG.Down:=False;
     sbRecipt.Down:=False;
     SetSkdMag(nil,False);

     DM.qrChek.Close;
     PayCount:=0;
     FChekOpened:=True;
     FIsOneRegCard:=True;
     FIsSkd7:=False;
{
     if Prm.FirmID<>5 then
      MessBox('- "Добрый день! Чем я могу вам помочь?" ',48,GetFont('Times New Roman',22,$00006600,[fsBold]),'Фраза:');
}

     if Prm.AptekaID=259 then S:='5' else S:='10';
     FIsSkd7:=((Prm.AptekaID=300) or (Prm.AptekaID=259) {or (Prm.AptekaID=315)}) and (MessBox('У покупателя есть флаер на скидку '+S+'% ?',52)=ID_YES);

     try
      ShowCardRead;
     finally
      FIsOneRegCard:=Not sbCard.Down;
     end;

     SetLength(aOstat,0);
     if (NumCardDnepr<>-1) or (FTypeChek=TC_RECIPT_PL) then FilterSklad;
     ReopenChek;
     cbEKKA.Checked:=Not(UseEKKASafe);
     lbNumCard50.Visible:=False;
     StartCamera(CM_START);
     ActivateKeyboardLayout(RULng, 0);

    except
     on E:Exception do
      begin
       TypeChek:=TC_MAIN;
       FChekOpened:=False;
       MessBox('Ошибка открытия чека 1: '+E.Message);
      end;
    end
   else else MessBox('У вас нет прав на эту операцию!');
 End; {OpenChek}

// Только очитска таблицы Chek и корректировка остатков в SprTov
procedure TMainF.ClearChekOnly(UserID:Integer);
 begin

  DM.spY_ClearChek.Close;
  DM.spY_ClearChek.Parameters.ParamValues['@iduser']:=Prm.UserID;
  DM.spY_ClearChek.ExecProc;
  if DM.spY_ClearChek.Parameters.ParamValues['@RETURN_VALUE']<>7654 then Abort;

{
  DM.Qr.SQL.Clear;
  DM.Qr.SQL.Add('update SprTov                                                    ');
  DM.Qr.SQL.Add('set Ostat=Ostat+a.kol                                            ');
  DM.Qr.SQL.Add('from Chek a,SprTov b                                             ');
  DM.Qr.SQL.Add('where a.kod_name=b.kod_name and a.id_user='+IntToStr(UserID)      );
  DM.Qr.SQL.Add('                                                                 ');
  DM.Qr.SQL.Add('delete from chek where id_user='+IntToStr(UserID)                 );
  DM.Qr.SQL.Add('delete from sertiftmp where id_user='+IntToStr(UserID)                 );
  DM.Qr.ExecSQL;
}
 end; {ClearChekOnly}

// Очистка чека
procedure TMainF.ClearChekFull(Param:Integer);

 procedure ShowCancelIndic;
 var i,j:Integer;
     S,ss:String;

  begin
   if Not(DM.qrChek.IsEmpty) then
    begin
     PlayWav(WV_CANCEL,0);
    end;

   TypeChek:=TC_MAIN;
   EKKA.fpStrToDisp('');
  end;

 procedure WriteCancelChek;
  begin
   if IsPermit([],P_SILENT) then Exit;
   try
    DM.Qr.Close;
    DM.Qr.SQL.Clear;
    DM.Qr.SQL.Add('Insert into CancelCheck(dt,kod_name,kol,cena,kassa,id_user,priznak,skd,numcard)');
    DM.Qr.SQL.Add('select getdate(),');
    DM.Qr.SQL.Add('       kod_name,kol,cena,'+IntToStr(Opt.KassaID)+',id_user,1,skd,numcard');
    DM.Qr.SQL.Add('from Chek (nolock) where compname=host_name() and id_user='+IntToStr(Prm.UserID));
    DM.Qr.ExecSQL;
   except
   end;
  end;

 Begin
  try
   EKKA.fpCancelFiscalReceipt;
   FTypeCardNew:=0;
   sbBSkd.Down:=False;
   sbGoldG.Down:=False;
   sbRecipt.Down:=False;
   sbiApt.Down:=False;
   FIDRES:=-1;
   Fid_doctorA:=0;
   Fid_strah:=0;
   FName_Strah:='';
   Ffransh:=0;
   FCard_doctorA:='';
   FPacient:='';
   FNRecipt:='';
   FMedName:='';
   FDtRecipt:=0;
   FFIODOctor1:='';
   FIsDopl:=0;
   FIsKurDostMakeOut:=False;
   FIsNumCardSMS:=False;

   WaitMessTimer;

   DeleteKurZakaz(FIDRes_Kur);
   FIDRes_Kur:=0;
   FOrderID:=0;

   if NumCardDnepr<>-1 then
    begin
     FilterSklad;
     NumCardDnepr:=-1;
    end;

   FNumZakaz:=0;
   FPhone:='';
   ForReserve:=False;
   FIsTerminal:=False;
   FIsPayMaster:=False;
   FIsIAptekaCredit:=False;
   SetSkdMag(nil,False);
   if Param=CC_CANCEL then DM.ADOCo.BeginTrans;
   try
    if Param=CC_CANCEL then
     begin
      ShowCancelIndic;
      WriteCancelChek;
      ClearChekOnly(Prm.UserID);
      DM.ADOCo.CommitTrans;
     end;
    SetVisWhenChekOpened(False);
    DM.qrChek.Close;
   except
    on E:Exception do
     begin
      if Param=CC_CANCEL then DM.ADOCo.RollbackTrans;
      MessBox('Ошибка отмены чека: '+E.Message);
     end;
   end;
  finally
   cbEKKA.Checked:=Not(UseEKKASafe);
   lbNumCard50.Visible:=False;
   StartCamera(CM_STOP);

   dbgSkladSetFocused;
//   if dbgSklad.Enabled then dbgSklad.SetFocus;
   if Param=CC_CANCEL then cbBoxZero.Checked:=False;
   sbSearchClearClick(sbSearchClear);
   FilterSklad;
  end;
 End; {ClearChekFull}

function TMainF.CheckCardPokup:Boolean;
var NC:Int64;
    TC:Integer;
    tcN:Byte;
    sSum,aSum:Currency;
    V:Byte;
 begin

  if (Type_Skd<>SK_CARD) or (DM.qrChek.IsEmpty)  or (Prm.UserRole=R_ADMIN) or (Prm.FirmID=5) or (Prm.IsPL2Perc=True) then
   begin
    Result:=True;
    Exit;
   end;

  try
   GetNumCardDialog(NC,TC,tcN,aSum,sSum,True,V);
   if NC<=0 then
    begin
     MessBox('Карточка покупателя не проведена!');
     Result:=False;
     Exit;
    end;
   Result:=NC=NumCard;
   if Not Result then MessBox('Карточка которую вы провели только что, не является карточкой, которую давал покупатель! Отмена не возможна!');

  except
   Result:=False;
  end;
 end;

// Отменяет чек
function TMainF.CancelChek(P:Byte=0):Boolean;
 begin
  Result:=True;
  if BlockingChek then Exit;
  if (Not (ChekOpened)) then Exit;
  Result:=False;
  // Подтверждаем отмену чека проведением карточки покупателя
  try
   if P=2 then Result:=True else
   if FIsNumCardSMS=True then Result:=True else
   if CheckCardPokup then Result:=True else Abort;

   if (P=1) then
    if MessBox('Вы действительно хотите отменить чек?',52)<>ID_YES then Exit;
   ClearChekFull(CC_CANCEL);
   MainF.FlIsStrah:=0;
  except
   Result:=False;
  end;
 end; {CancelChek}

// Вызов пункта меню "Регистрация пользователя"
procedure TMainF.miUsersClick(Sender:TObject);
var IP:String;
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  if IsPermit([R_SUPER],P_ALERT) then
   begin
    try
     UsersF:=TUsersF.Create(Self);
     try
      Application.ProcessMessages;
      UsersF.ShowModal;
     finally
      UsersF.Free;
     end;
    except
     MessBox(ER_CR_FORM,48);
    end;
   end;
 end; {miUsersClick}

// Установка сортировки справочника товара
procedure TMainF.SetOrder(V:Integer);
 begin
  FSprOrder:=V;
  FilterSklad;
 end; {SetOrder}

// Проверка какой товар находиться в чеке ЧП или обычный
procedure TMainF.SetIsCHP;
 begin
  if DM.qrChek.Active then
   begin
    FIsCHP:=False;
    try
     DM.Qr5.Close;
     DM.Qr5.SQL.Text:='select Count(*) as cnt from Chek (nolock) where f_nds>2 and compname=host_name() and id_user='+IntToStr(Prm.UserID)+' and art_code not in (select art_add from DtAkcii (nolock) group by art_add)';
     DM.Qr5.Open;
     FIsCHP:=DM.Qr5.FieldByName('cnt').AsInteger>0;
{
     if DM.qrChek.RecordCount>0 then
     if DM.qrChek.FieldByName('F_NDS').AsInteger in F_NDS_CHP then FIsCHP:=True;
}
    except
    end
   end;
 end; {SetIsCHP}

function TMainF.IsCanRegMomBabyCard:Boolean;
 begin
  try
   if MaxSkd<>-1 then Abort;
   {
   DM.Qr5.Close;
   DM.Qr5.SQL.Text:='select Sum(kol*cena) as Sm from Chek (nolock) where compname=host_name() and id_user='+IntToStr(Prm.UserID)+' and art_code in (select art_code from Bonuses (nolock)) ';
   DM.Qr5.Open;
   Result:=DM.Qr5.FieldByName('Sm').AsFloat>=50;}
   Result:=True;
  except
   Result:=False;
  end;
 end;

function TMainF.IsMomBabyCard(NumCard:Int64):Boolean;
 begin
  try
   DM.Qr5.Close;
   DM.Qr5.SQL.Text:='select * from MomBabyCards (nolock) where NumCard='+IntToStr(NumCard);
   DM.Qr5.Open;
   Result:=Not DM.Qr5.IsEmpty;
  except
   Result:=False;
  end;
 end;

function TMainF.CalcSkdOnly(SumSpis,SumCash:Currency; BSkd:Boolean; Param:Byte):Currency;
var PercSKD:Real;
 begin
  SetMediCardSkd;

  PercSkd:=PercentSKD;
  DM.spY_CalcSKD.Close;

  DM.spY_CalcSKD.Parameters.ParamValues['@pid_user']:=Prm.UserID;
  DM.spY_CalcSKD.Parameters.ParamValues['@t_s']:=Type_Skd;
  DM.spY_CalcSKD.Parameters.ParamValues['@pskd']:=PercentSKD;

{  if (FIsSkd7) and (FIDRes=-1) then
   begin

    if (Prm.AptekaID=259) or (Prm.AptekaID=28) then
     DM.spY_CalcSKD.Parameters.ParamValues['@pskd7']:=5
    else
     DM.spY_CalcSKD.Parameters.ParamValues['@pskd7']:=10;

   end else} DM.spY_CalcSKD.Parameters.ParamValues['@pskd7']:=0;

  if EKKA.EmulEKKA then DM.spY_CalcSKD.Parameters.ParamValues['@IsKassa']:=1
                   else DM.spY_CalcSKD.Parameters.ParamValues['@IsKassa']:=0;

  if FNumGeptralCard<>'' then DM.spY_CalcSKD.Parameters.ParamValues['@NumGeptralCard']:=30
                         else DM.spY_CalcSKD.Parameters.ParamValues['@NumGeptralCard']:=0;

  if sbFix10.Down then DM.spY_CalcSKD.Parameters.ParamValues['@SumHeptral']:=FGeptralPatientPrice
                  else DM.spY_CalcSKD.Parameters.ParamValues['@SumHeptral']:=0;

  if FNumKsareltoCard<>'' then DM.spY_CalcSKD.Parameters.ParamValues['@NumKsareltoCard']:=1
                          else DM.spY_CalcSKD.Parameters.ParamValues['@NumKsareltoCard']:=0;


  if Type_Skd=SK_CARD then
   DM.spY_CalcSKD.Parameters.ParamValues['@TypeCard']:=TypeCardNew;

{
 if (sbBSkd.Down) or (Bskd=True) then
   DM.spY_CalcSKD.Parameters.ParamValues['@bskd']:=2 else

  if sbGoldG.Down then
   DM.spY_CalcSKD.Parameters.ParamValues['@bskd']:=7
  else
   DM.spY_CalcSKD.Parameters.ParamValues['@bskd']:=0;
}

  DM.spY_CalcSKD.Parameters.ParamValues['@pnumcard']:=NumCard;
  DM.spY_CalcSKD.Parameters.ParamValues['@IsBirth']:=FIsBirth;

  if sbProf.Down then DM.spY_CalcSKD.Parameters.ParamValues['@profarma']:=1
                 else DM.spY_CalcSKD.Parameters.ParamValues['@profarma']:=0;

  if FSumPChek>0 then DM.spY_CalcSKD.Parameters.ParamValues['@SumP']:=FSumPChek
                 else DM.spY_CalcSKD.Parameters.ParamValues['@SumP']:=0;

 if Fid_doctor>0 then
   begin
    DM.spY_CalcSKD.Parameters.ParamValues['@id_doctor']:=Fid_doctor;
    DM.spY_CalcSKD.Parameters.ParamValues['@card_doctor']:=Fcard_doctor;
   end else begin
             if (FIDRes<>-1) and (Fid_doctorA>0) then
              begin
               DM.spY_CalcSKD.Parameters.ParamValues['@id_doctor']:=Fid_doctorA;
               DM.spY_CalcSKD.Parameters.ParamValues['@card_doctor']:=Fcard_doctorA;
              end else begin
                        DM.spY_CalcSKD.Parameters.ParamValues['@id_doctor']:=0;
                        DM.spY_CalcSKD.Parameters.ParamValues['@card_doctor']:='';
                       end;
            end;

  if Fid_doctorAll>0 then
   DM.spY_CalcSKD.Parameters.ParamValues['@id_doctorAll']:=Fid_doctorAll
  else
   DM.spY_CalcSKD.Parameters.ParamValues['@id_doctorAll']:=0;

  if Fid_strah>0 then
   begin
    DM.spY_CalcSKD.Parameters.ParamValues['@id_strah']:=Fid_strah;
    DM.spY_CalcSKD.Parameters.ParamValues['@nn_polis']:=Fnn_polis;
    DM.spY_CalcSKD.Parameters.ParamValues['@dt_polis']:=Fdt_polis;
    DM.spY_CalcSKD.Parameters.ParamValues['@NumOrder']:=FNumOrder;
    if (FIDRes<>-1) then
     begin
      DM.spY_CalcSKD.Parameters.ParamValues['@fransh']:=Ffransh;
      DM.spY_CalcSKD.Parameters.ParamValues['@franshprc']:=0;
      DM.spY_CalcSKD.Parameters.ParamValues['@FIOStrah']:=FFIOStrah;
      DM.spY_CalcSKD.Parameters.ParamValues['@TypeDostStrah']:=0;
     end else begin
               DM.spY_CalcSKD.Parameters.ParamValues['@fransh']:=0;
               DM.spY_CalcSKD.Parameters.ParamValues['@franshprc']:=Ffransh;
               DM.spY_CalcSKD.Parameters.ParamValues['@FIOStrah']:=FFIOStrah;
               DM.spY_CalcSKD.Parameters.ParamValues['@TypeDostStrah']:=FTypeDostStrah;
              end;
   end else begin
             DM.spY_CalcSKD.Parameters.ParamValues['@id_strah']:=0;
             DM.spY_CalcSKD.Parameters.ParamValues['@nn_polis']:='';
             DM.spY_CalcSKD.Parameters.ParamValues['@NumOrder']:='';
//             DM.spY_CalcSKD.Parameters.ParamValues['@dt_polis']:=NULL;
             DM.spY_CalcSKD.Parameters.ParamValues['@dt_polis']:=Variants.Null;// NULL;
             DM.spY_CalcSKD.Parameters.ParamValues['@fransh']:=0;
             DM.spY_CalcSKD.Parameters.ParamValues['@franshprc']:=0;
             DM.spY_CalcSKD.Parameters.ParamValues['@FIOStrah']:='';
             DM.spY_CalcSKD.Parameters.ParamValues['@TypeDostStrah']:=0;
            end;

//  if sbMag.Down  then DM.spY_CalcSKD.Parameters.ParamValues['@ncMag']:=StrToInt(Copy(IntToStr(NumCardMag),1,3)) else
  DM.spY_CalcSKD.Parameters.ParamValues['@SingulArt']:=0;
  DM.spY_CalcSKD.Parameters.ParamValues['@SingulKol1']:=0;
  DM.spY_CalcSKD.Parameters.ParamValues['@SingulKol2']:=0;

  if sbMag.Down  then
   begin
    DM.spY_CalcSKD.Parameters.ParamValues['@ncMag']:=NumCardMag;
    if Copy(IntToStr(NumCardMag),1,3)='252' then // флаер на Сингуляр
     begin
      DM.spY_CalcSKD.Parameters.ParamValues['@SingulArt']:=FsArt_Code;
      DM.spY_CalcSKD.Parameters.ParamValues['@SingulKol1']:=FsKol1;
      DM.spY_CalcSKD.Parameters.ParamValues['@SingulKol2']:=FsKol2;
     end;
   end else

  if sbMediCard.Down then DM.spY_CalcSKD.Parameters.ParamValues['@ncMag']:=NumMediCard else

  if sbMDMU.Down or sbMDMU1.Down then DM.spY_CalcSKD.Parameters.ParamValues['@ncMag']:=NumMDMUCard
                                 else DM.spY_CalcSKD.Parameters.ParamValues['@ncMag']:=-1;

  if (TypeChek=TC_MOMBABY) and (FSumMomBaby>0) then DM.spY_CalcSKD.Parameters.ParamValues['@SumBonus']:=FSumMomBaby
                                               else DM.spY_CalcSKD.Parameters.ParamValues['@SumBonus']:=0;


  if TypeChek in TC_DL then
   begin
    DM.spY_CalcSKD.Parameters.ParamValues['@MedName']:=FMedName;
    DM.spY_CalcSKD.Parameters.ParamValues['@TypeChek']:=TypeChek;
    DM.spY_CalcSKD.Parameters.ParamValues['@IsDopl']:=FIsDopl;
    DM.spY_CalcSKD.Parameters.ParamValues['@DtRecipt']:=FDtRecipt;
   end else begin
             DM.spY_CalcSKD.Parameters.ParamValues['@MedName']:='';
             DM.spY_CalcSKD.Parameters.ParamValues['@TypeChek']:=0;
             DM.spY_CalcSKD.Parameters.ParamValues['@IsDopl']:=0;
             DM.spY_CalcSKD.Parameters.ParamValues['@DtRecipt']:=Variants.Null;
            end;

  DM.spY_CalcSKD.Parameters.ParamValues['@SumSpis']:=SumSpis;
  DM.spY_CalcSKD.Parameters.ParamValues['@SumCash']:=SumCash;

  if TypeChek=TC_RECIPT_PL then DM.spY_CalcSKD.Parameters.ParamValues['@TypeRecipt']:=TypeRecipt
                           else DM.spY_CalcSKD.Parameters.ParamValues['@TypeRecipt']:=0;

  if (Prm.IsKurier) and (FOrderID>0) then DM.spY_CalcSKD.Parameters.ParamValues['@OrderID']:=FOrderID
                                     else DM.spY_CalcSKD.Parameters.ParamValues['@OrderID']:=0;

  DM.spY_CalcSKD.Open;

  // Result:=FSumChek-FSumSkd+FSumCashToCard;

  FAccumSumChek:=DM.spY_CalcSKD.FieldByName('AccumSumChek').AsFloat;
  FSumSkd:=DM.spY_CalcSKD.FieldByName('Skd').AsFloat;
  FIsOgrSkd:=DM.spY_CalcSKD.FieldByName('IsOgrSkd').AsInteger=1;
  SumChek:=DM.spY_CalcSKD.FieldByName('Sm').AsFloat;
  SumChekRecipt:=DM.spY_CalcSKD.FieldByName('SmRecipt').AsFloat;

//  SumChekAll:=DM.spY_CalcSKD.FieldByName('SmAll').AsFloat;

  SumChek99:=DM.spY_CalcSKD.FieldByName('Sum99').AsFloat;
  Result:=DM.spY_CalcSKD.FieldByName('SumSpis').AsCurrency;
  FSumFransh:=DM.spY_CalcSKD.FieldByName('SumFransh').AsCurrency;
  FSumDopl:=DM.spY_CalcSKD.FieldByName('SumDopl').AsCurrency;
  MaxSpisSum:=DM.spY_CalcSKD.FieldByName('MaxSpisSum').AsCurrency;

  DM.spY_CalcSKD.Close;

{  try

   DM.QrLog.Close;
   DM.QrLog.SQL.Clear;
   DM.QrLog.SQL.Add('insert into AccumLog(dt,id_kassa,numcard,Skd,AccumSumChek,SumSkd)');
   DM.QrLog.SQL.Add('values(getdate(),:idk,:numcard,:skd,:AccumSumChek,:sumskd)');

   DM.QrLog.Parameters.ParamByName('numcard').Value:=NumCard;
   DM.QrLog.Parameters.ParamByName('idk').Value:=Opt.KassaID;
   DM.QrLog.Parameters.ParamByName('skd').Value:=PercSkd;
   DM.QrLog.Parameters.ParamByName('AccumSumChek').Value:=FAccumSumChek;
   DM.QrLog.Parameters.ParamByName('sumskd').Value:=FSumSkd;
   DM.QrLog.ExecSQL;

  except
  end;
}
  if Param=1 then
   begin
    DM.qrChek.Close;
    DM.qrChek.Open;
   end;
 end;

// Переоткрытие чека без try except - важно!!!!!!!!!!!!!
procedure TMainF.ReopenChek;
var Art_Code:Integer;

procedure CalcSkd;
 begin
//   if Not (((FEnterKol=True) and (FSkdCalced=False)) or (FEnterKol=False)) then Exit;
  if BlockingChek=False then
   begin

    CalcSkdOnly(0,0,False,0);

   end else begin
             DM.Qr3.Close;
             DM.Qr3.SQL.Clear;
             DM.Qr3.SQL.Add('select IsNull(Sum(Convert(numeric(8,2),kol*cena)),0) as Sm, ');
             DM.Qr3.SQL.Add('        IsNull(Sum(SumSkd),0) as Skd ');
             DM.Qr3.SQL.Add('from Chek (nolock) where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() ');
             DM.Qr3.Open;
             FSumSkd:=DM.Qr3.FieldByName('Skd').AsFloat;
             SumChek:=DM.Qr3.FieldByName('Sm').AsFloat;
            end;
 end;

 Begin
  try
   Art_Code:=-1;
   if DM.qrChek.Active then
    begin
     Art_Code:=DM.qrChek.FieldByName('Art_Code').AsInteger;
     DM.qrChek.Close;
    end;

   CalcSkd;
   if ((Prm.FirmID<>13) or ((Prm.FirmID=13) and ( (Prm.AptekaID=180) or (Prm.AptekaID=330) or (Prm.AptekaID=462) ))) and
      ((SumChek>=Prm.SumSkd) or (IsCanRegMomBabyCard)) and
      (FIsOneRegCard) and
      (BlockingChek=False) and

      ((Prm.AptekaSklad=False) or (Prm.IsNewDiscOpt=True)) and

      ((FIDRes=-1) or ((FIDRes<>-1) and (FTypeRes=2)) ) and
      IsDay=True then

    begin
     FIsOneRegCard:=False;
     try
      sbCard.Tag:=1;
      SwitchSkd(sbCard,miCardSkd);
     finally
      sbCard.Tag:=0;
     end;
     CalcSkd;
    end;
//   if (SumChek<Prm.SumSkd) and (IsRegCard) then FIsOneRegCard:=True;
   DM.qrChek.Open;
   ChekEmpty:=DM.qrChek.IsEmpty;
   lbCheck.Caption:='';
   SetIsCHP;
   if Art_Code<>-1 then DM.qrChek.Locate('Art_Code',Art_Code,[]);
   SetVisWhenChekOpened(True);
  finally
   if Not (DM.qrChek.Active) then Abort;
  end;
 End; {ReopenChek}

// Обновление чека
procedure TMainF.RefreshChek;
 begin
  if CheckOpening then Exit;
  if ChekOpened then
   try
    ReopenChek;
   except
    on E:Exception do
     begin
      btnPayCash.Enabled:=False;
      btnPayChek.Enabled:=False;
      MessBox('Ошибка доступа к чеку: '+E.Message);
     end;
   end;
 end; {RefreshChek}

procedure TMainF.ShowDatePrih;
 begin

  try

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spY_GetNextTovPrihDate ';
   DM.QrEx.Open;

   if DM.QrEx.FieldByName('IsPrih').AsInteger=1 then
    begin

     lbNextDateTov.Caption:=DM.QrEx.FieldByName('Dt').AsString;

    end else lbNextDateTov.Caption:='нового товара нет';

  except
  end;

 end;

// Установка показа товаров согласно выбранного типа и сортировки
procedure TMainF.FilterSklad(P:Byte=0);
var i,sZero:Integer;
    Art_Code,Art_Code1:Integer;
    dz:Real;
    NmF:String;

 begin
  try
   lbSearch.Caption:='';
   lbNamesUA.Caption:='';
   Art_Code:=-1;
   Art_Code1:=-1;
   lbArt.Font.Color:=clNavy;
   pns2.Font.Color:=clNavy;

//   for i:=0 to dbgSklad.Columns.Count-1 do dbgSklad.Columns[i].Title.Font.Color:=clNavy;
   sZero:=-1;
   if (cbBoxZero.Checked) then sZero:=0;
   if Prm.RealizMinus then sZero:=-1000000000;
   if DM.spY_FilterSklad.Active then
    begin
     Art_Code:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;
     DM.spY_FilterSklad.Prior;
     Art_Code1:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;
     DM.spY_FilterSklad.Next;
     DM.spY_FilterSklad.Close;
    end;
//   DM.spY_FilterSklad.Parameters.ParamValues['@ptov']:=GroupIndex;

//   if Prm.AptekaID=276 then DM.spY_FilterSklad.ProcedureName:='spY_FilterSkladSkd_TEST' else
{   if FTypeChek=TC_RECIPT_PL then DM.spY_FilterSklad.ProcedureName:='spY_FilterSkladSkd_PL' else
   if N72.Visible then DM.spY_FilterSklad.ProcedureName:='spY_FilterSkladSkd_PL_All' else
   if FullSprTov then DM.spY_FilterSklad.ProcedureName:='spY_FilterSkladFull' else
   if Prm.FilterSklad then DM.spY_FilterSklad.ProcedureName:='spY_FilterSkladSkd_';

   DM.spY_FilterSklad.Parameters.Clear;

   with DM.spY_FilterSklad.Parameters.AddParameter do begin DataType:=ftInteger; Direction:=pdReturnValue; Name:='@RETURN_VALUE'; Precision:=10; end;
   with DM.spY_FilterSklad.Parameters.AddParameter do begin DataType:=ftInteger; Name:='@ptov'; Precision:=10; end;
   with DM.spY_FilterSklad.Parameters.AddParameter do begin DataType:=ftInteger; Name:='@pzero'; Precision:=10; end;
   with DM.spY_FilterSklad.Parameters.AddParameter do begin DataType:=ftInteger; Name:='@porder'; Precision:=10; end;
   with DM.spY_FilterSklad.Parameters.AddParameter do begin DataType:=ftInteger; Name:='@idu'; Precision:=10; end;
   with DM.spY_FilterSklad.Parameters.AddParameter do begin DataType:=ftString;  Name:='@nmFilter'; Precision:=200; end;
   with DM.spY_FilterSklad.Parameters.AddParameter do begin DataType:=ftString;  Name:='@dvFilter'; Precision:=100; end;
   with DM.spY_FilterSklad.Parameters.AddParameter do begin DataType:=ftBCD;     Name:='@dzFilter'; NumericScale:=4; Precision:=12; end;
   with DM.spY_FilterSklad.Parameters.AddParameter do begin DataType:=ftString;  Name:='@fvFilter'; Precision:=100; end;
   with DM.spY_FilterSklad.Parameters.AddParameter do begin DataType:=ftInteger; Name:='@ext'; Precision:=10; end;
   with DM.spY_FilterSklad.Parameters.AddParameter do begin DataType:=ftInteger; Name:='@Dnepr'; Precision:=10; end;
   with DM.spY_FilterSklad.Parameters.AddParameter do begin DataType:=ftInteger; Name:='@OptCena'; Precision:=10; end;
   with DM.spY_FilterSklad.Parameters.AddParameter do begin DataType:=ftInteger; Name:='@ext1'; Precision:=10; end;
   with DM.spY_FilterSklad.Parameters.AddParameter do begin DataType:=ftInteger; Name:='@RaznOpt'; Precision:=10; end;

//   with DM.spY_FilterSklad.Parameters.AddParameter do begin DataType:=ftInteger; Name:='@IsPilot'; Precision:=10; end;

}
   DM.spY_FilterSklad.Parameters.ParamValues['@ptov']:=0;
   DM.spY_FilterSklad.Parameters.ParamValues['@pzero']:=sZero;
   DM.spY_FilterSklad.Parameters.ParamValues['@porder']:=SprOrder;
   DM.spY_FilterSklad.Parameters.ParamValues['@idu']:=Prm.UserID;

   NmF:=NmFilter;
   DM.spY_FilterSklad.Parameters.ParamValues['@nmFilter']:=NmF;

   if FTypeChek=TC_RECIPT_PL then DM.spY_FilterSklad.Parameters.ParamValues['@Ext']:=1 else
   if (cbExt.Visible) then DM.spY_FilterSklad.Parameters.ParamValues['@Ext']:=BoolToInt(cbExt.Checked)
                      else DM.spY_FilterSklad.Parameters.ParamValues['@Ext']:=0;

   DM.spY_FilterSklad.Parameters.ParamValues['@OptCena']:=BoolToInt(Prm.OptCena);

   if edVesh.Font.Color=clGray then DM.spY_FilterSklad.Parameters.ParamValues['@dvFilter']:=''
                               else DM.spY_FilterSklad.Parameters.ParamValues['@dvFilter']:=fVesh;

   if edDoz.Font.Color=clGray then dz:=0
                              else try
                                    dz:=StrToCurr(fDoz);
                                   except
                                    dz:=0;
                                   end;

   DM.spY_FilterSklad.Parameters.ParamValues['@dzFilter']:=dz;
   if edForm.Font.Color=clGray then DM.spY_FilterSklad.Parameters.ParamValues['@fvFilter']:=''
                               else DM.spY_FilterSklad.Parameters.ParamValues['@fvFilter']:=fForm;

   if NumCardDnepr=-1 then DM.spY_FilterSklad.Parameters.ParamValues['@Dnepr']:=0

                      else DM.spY_FilterSklad.Parameters.ParamValues['@Dnepr']:=1;

   DM.spY_FilterSklad.Parameters.ParamValues['@RaznOpt']:=1;

   if cbIsSpisAllOnly.Checked then DM.spY_FilterSklad.Parameters.ParamValues['@IsSpisAllOnly']:=1
                              else DM.spY_FilterSklad.Parameters.ParamValues['@IsSpisAllOnly']:=0;

   Case SprOrder of
    O_ART_CODE:lbArt.Font.Color:=clRed;
    O_NAMES   :pns2.Font.Color:=clRed;
   end;

{
   Case SprOrder of
    O_ART_CODE:dbgSklad.Columns[0].Title.Font.Color:=clRed;
    O_NAMES   :dbgSklad.Columns[2].Title.Font.Color:=clRed;
   end;
}

   lbFullName.Caption:='';
   DM.spY_FilterSklad.Open;

{
   TFake(dbgSklad).RowHeights[2]:=60;
   TFake(dbgSklad).RowHeights[5]:=60;
}

   if DM.spY_FilterSklad.IsEmpty=False then lbFullName.Caption:=DM.spY_FilterSklad.FieldByName('Names').AsString;

   if FErrConMain then begin FErrConMain:=False; RefreshChek; end;

 //  FormResize(Self);

   // увеличиваем высоту строк при поиске для отображения интернет-названий
   if Length(NmF)>2 then
    begin
     dbgSklad.DataSource.DataSet.DisableControls;
     TStringGrid(dbgSklad).DefaultRowHeight:=42;
     dbgSklad.DataSource.DataSet.EnableControls;
    end else begin
              dbgSklad.DataSource.DataSet.DisableControls;
              TStringGrid(dbgSklad).DefaultRowHeight:=25;
              dbgSklad.DataSource.DataSet.EnableControls;
             end;
   if IsFiltered then
    begin
     pnVesh1.Width:=17;
     pnDoz1.Width:=17;
     pnForm1.Width:=17;
    end else begin
              pnVesh1.Width:=0;
              pnDoz1.Width:=0;
              pnForm1.Width:=0;
             end;

   ResizePnFi;

   SetLength(aOstat,0);

   if Art_Code<>-1 then
    if Not DM.spY_FilterSklad.Locate('Art_Code',Art_Code,[]) then
     DM.spY_FilterSklad.Locate('Art_Code',Art_Code1,[]);

   //ShowDatePrih;
   if (dbgSklad.Visible) and (P=0) then   dbgSkladSetFocused;

  except
   try
    DM.ADOCo.Connected:=False;
    DM.ADOCo.Connected:=True;
    FErrConMain:=False;
    DM.spY_FilterSklad.Close;
    DM.spY_FilterSklad.Open;
   except
    on E:Exception do
     begin
      FErrConMain:=True;
      MessBox('Ошибка доступа к справочнику товаров: '+E.Message);
     end; 
   end;
  end
 end; {FilterSklad}

// Вызов пункта меню "Выход"
procedure TMainF.miExitClick(Sender:TObject); begin Close; end; {miExitClick}

// Вкл/выкл режим > 0
procedure TMainF.cbBoxZeroClick(Sender:TObject); begin FilterSklad; end; {cbBoxZeroClick}


// Реализация событий ActionList1 ----------------------------------------------
procedure TMainF.SetOrderArt_CodeExecute(Sender:TObject); begin SprOrder:=O_ART_CODE; end;
procedure TMainF.SetOrderNamesExecute(Sender:TObject); begin SprOrder:=O_NAMES; end;

procedure TMAinF.ClearFilters;
 begin
  fVesh:=''; edVeshExit(edVesh);
  fDoz:=''; edVeshExit(edDoz);
  fForm:=''; edVeshExit(edForm);
  sbSearchClearClick(sbSearchClear);
 end;

//------------------------------------------------------------------------------

// Поиск препаратов по Штрих-Коду
function TMainF.FindEAN13(db:TDBGrid; EAN13:String; P,Kol:Integer; var IsFind:Boolean; iddoc:Integer=0):String;
var sq:String;
    AC:Integer;
    T,T1:TDateTime;

 procedure FindInSklad(B:Boolean);
  begin
   if IsFiltered then
    begin
     DM.Qr1.Close;
     DM.Qr1.SQL.Text:='select top 1 art_code from SprTovar (nolock) where art_code='+IntToStr(AC);
     DM.Qr1.Open;
     if DM.Qr1.IsEmpty=False then ClearFilters;
    end;

   if db.DataSource.DataSet.Locate('ART_CODE',AnsiUpperCase(IntToStr(AC)),[loCaseInsensitive,loPartialKey]) then
    begin
     if B then
      begin
       PrevEnterKol(EK_SCAN,0,AC);

       try // Регистрируем все, что сканируется
        DM.QrEx5.Close;
        DM.QrEx5.SQL.Text:='exec spY_RegScan '''+EAN13+''','+IntToStr(Prm.ID_Gamma)+','+IntToStr(Opt.KassaID)+',''SKLAD'' ' ;
        DM.QrEx5.ExecSQL;
       except
       end;

      end else IsFind:=True;
    end;
  end;

 procedure FindInChek;
  begin
   if Not (db.DataSource.DataSet.Active) then Exit;
   if db.DataSource.DataSet.RecordCount<=0 then Exit;
   db.Visible:=False;
   try
    DM.Qr1.Close;
    DM.Qr1.SQL.Clear;
    DM.Qr1.SQL.Add('update Chek set printing=1, EAN13='''+EAN13+'''');
    DM.Qr1.SQL.Add('where art_Code='+IntToStr(AC));
    DM.Qr1.SQL.Add(' and compname=host_name() and id_user='+IntToStr(Prm.UserID));
    DM.Qr1.ExecSQL;

    try // Регистрируем все, что сканируется
     DM.QrEx5.Close;
     DM.QrEx5.SQL.Text:='exec spY_RegScan '''+EAN13+''','+IntToStr(Prm.ID_Gamma)+','+IntToStr(Opt.KassaID)+',''CHEK'' ' ;
     DM.QrEx5.ExecSQL;
    except
    end;

   finally
    db.Visible:=True;
    RefreshChek;
    db.DataSource.DataSet.Locate('ART_CODE',AC,[loCaseInsensitive,loPartialKey]);
    db.SetFocus;
   end;
  end;

 procedure FindInMoves;
  begin
{
   if Not (db.DataSource.DataSet.Active) then Exit;
   if db.DataSource.DataSet.RecordCount<=0 then Exit;
   db.Visible:=False;
   try
    DM.Qr1.Close;;
    DM.Qr1.SQL.Clear;
    DM.Qr1.SQL.Add('update Moves set IsScan=IsNull(IsScan,0)+'+IntToStr(ViewNaklF.KolScan)+',DateScan=getdate(),id_user='+IntToStr(Prm.UserID) );
    DM.Qr1.SQL.Add('from Moves a, SprTov b');
    DM.Qr1.SQL.Add('where a.kod_name=b.kod_name and b.art_Code='+DM.QrFnd.FieldByName('Art_Code').AsString);
    DM.Qr1.SQL.Add('      and a.iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString);
    DM.Qr1.ExecSQL;
   finally
    db.Visible:=True;
    db.SetFocus;
    ViewNaklF.NaklList(0);
    ViewNaklF.ShowNakl;
    db.DataSource.DataSet.Locate('ART_CODE',DM.QrFnd.FieldByName('Art_Code').AsInteger,[loCaseInsensitive,loPartialKey])
   end;
 }
  end;

 procedure ScanNakl;
  begin
   IsFind:=db.DataSource.DataSet.Locate('ART_CODE',AC,[loCaseInsensitive,loPartialKey]);
  end;

 Begin
  try
   if P=SC_FINDTMC then Exit;
   IsFind:=False;
   T:=Time;
   if Length(EAN13)>13 then Abort;
{
   if P in [SC_SKLAD,SC_CHEK] then
    if Length(EAN13)=13 then
     if (Copy(EAN13,1,5)='55555') and ((Copy(EAN13,1,12)<>'555550000024') and (Copy(EAN13,1,12)<>'555550000028')) then
      begin

       lbNumCard50.Caption:=Copy(EAN13,6,7);
       IsSkd50:=Not(IsSkd50);
       Exit;
      end;
}

   DM.QrFnd.Close;
   Case P of

    SC_SKLAD:sq:='select art_code from sprtovar (nolock) where ostat_>0 and names not like ''%SHEFER%'' group by art_code';
    SC_FIND:sq:='select art_code from sprtovar (nolock)';  // where ostat>'+IntToStr(Kol-1);

    SC_CHEK:sq:='select b.art_code from sprtov a (nolock), chek b (nolock) where a.kod_name=b.kod_name and b.printing=0 group by b.art_code ';

    SC_SCNAKL:sq:='select art_code from TmpNakl (nolock)';
    SC_TMPSPIS:sq:='select art_code from Inform..Tmp_Spis (nolock) where compname=host_name() and id_user='+IntToStr(Prm.UserID);
    SC_SPIS:sq:='select art_code from SpisVozr (nolock) where DtVz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+'''';
    SC_MOVES:sq:='select a.art_code from sprtov a (nolock), rTovar b (nolock) where a.kod_name=b.kod_name and b.iddoc='+IntToStr(iddoc);

   end;

   DM.QrFnd.SQL.Text:='select IsNull(Max(Art_code),-1) as Art_Code from SprEAN with (index=sprean_indx nolock) where EAN13='''+EAN13+''' and art_code in ('+sq+')';
//   T1:=Time;
   DM.QrFnd.Open;
//   ShowMessage(FormatDateTime('hh:n:ss.zzz',T1-T));
//   ShowMessage(FormatDateTime('hh:n:ss.zzz',Time-T1));
   AC:=DM.QrFnd.FieldByName('Art_Code').AsInteger;
   if AC<>-1 then
    Case P of

     SC_SKLAD:FindInSklad(True);
     SC_FIND:FindInSklad(False);
     SC_CHEK:FindInChek;
     SC_SCNAKL,SC_TMPSPIS,SC_SPIS,SC_MOVES:ScanNakl;

//     SC_MOVES:FindInMoves;
    end;

   if Length(EAN13)=13 then
    begin
     if (AC=-1) and (P=SC_CHEK) then
      begin
       DM.Qr1.Close;
       DM.Qr1.SQL.Clear;
       DM.Qr1.SQL.Add('select top 1 a.art_code ');
       DM.Qr1.SQL.Add('from Chek a (nolock), ');
       DM.Qr1.SQL.Add('     SprEAN s (nolock) ');
       DM.Qr1.SQL.Add('where a.compname=host_name() and a.id_user='+IntToStr(Prm.UserID)+' and ');
       DM.Qr1.SQL.Add('      a.art_code=s.art_code and s.EAN13='''+EAN13+'''');
       DM.Qr1.Open;
       if DM.Qr1.IsEmpty then MessBox('Позиции с штрих-кодом '+EAN13+' в чеке нет!')
                         else begin
                               db.Visible:=False;
                               try
                                RefreshChek;
                               finally
                                db.Visible:=True;
                                db.DataSource.DataSet.Locate('ART_CODE',DM.Qr1.FieldByName('art_code').AsInteger,[loCaseInsensitive,loPartialKey]);
                                db.SetFocus;
                               end;
                              end;

      end else
     if (AC=-1) and (P in [SC_SPIS,SC_MOVES]) then MessBox('Позиция со штрих-кодом '+EAN13+' не найдена либо данного товара нет в списке возврата!');
     Abort;
    end;
   Result:=EAN13;
  except
   Result:='';
  end;
 End; {FindEAN13}

// Проверка строки на наличие хоть одного нецифрового символа
function TMainF.CheckStrNum(S:String):Boolean;
var i:Integer;
 begin
  try
   for i:=1 to Length(S) do
    if Not (S[i] in CH_DIGIT) then Abort;
   Result:=True;
  except
   Result:=False;
  end;
 end; {CheckStrNum}

// Поиск в dbGrid вручную и со сканера
procedure TMainF.dbGKeyPress(db:TDBGrid; var Key:Char; var sSr:String; Order,P,Kol:Integer; var IsFind:Boolean);
var S:String;
 begin
  IsFind:=False;
//  AppendStringToFile('D:\ava\Scan.txt',Key+' - '+IntToStr(Ord(Key)));
  Case Order of
   O_ART_CODE:begin
               sSr:=sSr+Key;
               if Key in CH_DIGIT then
                if Length(sSr)<8 then
                 db.DataSource.DataSet.Locate('ART_CODE',AnsiUpperCase(sSr),[loCaseInsensitive,loPartialKey])
                else
                 sSr:=FindEAN13(db,sSr,P,Kol,IsFind);
              end;
   O_NAMES:begin
            S:=AnsiUpperCase(sSr+Key);
            if Key in CH_ANSI then
             if CheckStrNum(S)=False then
              begin
               if db.DataSource.DataSet.Locate('NAMES',AnsiLowerCase(S),[loCaseInsensitive,loPartialKey]) then
                sSr:=S;
              end else sSr:=FindEAN13(db,S,P,Kol,IsFind);
           end;
  end;
 end; {dbGKeyPress}

// Организация поиска ввводом из клавиатуры или со сканера
procedure TMainF.dbgSkladKeyPress(Sender:TObject; var Key:Char);
var S:String;
    IsFind:Boolean;
 begin

  if Sender=Nil then Exit;
  S:=lbSearch.Caption;
  dbGKeyPress(TDBGrid(Sender),Key,S,SprOrder,SC_SKLAD,1,IsFind);
  lbSearch.Caption:=S;
 end; {dbgSkladKeyPress}

// Обработка нажатий клавиш в окне справочника товаров
procedure TMainF.dbgSkladKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if (Key=VK_SPACE) and (Prm.AptekaID=189) then
   if dbgChek.Enabled and dbgChek.Visible then dbgChek.SetFocus;

  if Key in K_ARROW_KEYS then
   begin
    lbSearch.Caption:='';
//    if hKonkurHintF.Visible then hKonkurHintF.Hide;
//    if hKonkurHintF1.Visible then hKonkurHintF1.Hide;
   end;
  if Key=VK_RETURN then PrevEnterKol(EK_DIALOG,0,dbgSklad.DataSource.DataSet.FieldByName('art_code').AsInteger);
  FIsKeyDown:=True;

  if (Key=VK_UP) and dbgSklad.DataSource.DataSet.Bof then imFindClick(edCntxSearch);

  if Key=VK_ESCAPE then sbSearchClearClick(sbSearchClear);

 end; {dbgSkladKeyDown}

// Отображает информацию о препарате если он находиться на ПКУ
procedure TMainF.ShowPKUInfo(Art_Code:Integer; P:Byte=0);
 begin
  if P=0 then
   try
    DM.Qr.Close;
    DM.Qr.SQL.Text:='select * from SprPKU (nolock) where art_code='+IntToStr(Art_Code);
    DM.Qr.Open;
    if DM.Qr.IsEmpty then Exit;
    DM.Qr1.Close;
    DM.Qr1.SQL.Text:='select names from SprTov (nolock) where art_code='+IntToStr(Art_Code);
    DM.Qr1.Open;
    InfoPKUF:=TInfoPKUF.Create(Self);
    try
     InfoPKUF.lbName.Caption:=DM.Qr1.FieldByName('Names').AsString;
     if DM.Qr.FieldByName('Descr').AsString<>'' then
      begin
       InfoPKUF.lbCap.Visible:=True;
       InfoPKUF.lbKol.Visible:=True;
       InfoPKUF.lbKol.Caption:=DM.Qr.FieldByName('Descr').AsString;
      end else InfoPKUF.Height:=563;
     Application.ProcessMessages;
     InfoPKUF.ShowModal;
    finally
     InfoPKUF.Free;
    end;
   except
   end else
  if P=1 then
   try
    DM.Qr.Close;
    DM.Qr.SQL.Text:='select * from SprRecOnly a (nolock), SprTov b (nolock) where a.art_code=b.art_code and a.art_code='+IntToStr(Art_Code);
    DM.Qr.Open;
    if DM.Qr.IsEmpty then Exit;
    ShowRecOnlyF:=TShowRecOnlyF.Create(Self);
    try
     Application.ProcessMessages;
     ShowRecOnlyF.ShowModal;
    finally
     ShowRecOnlyF.Free;
    end;
   except
   end;
 end; {ShowPKUInfo}

// Определение сопутствующих препаратов
function TMainF.GetKolArtAdd(Art_Code:Integer; var KolAdd,ArtAdd:Integer; P:Integer=0):Boolean;
 begin
  Result:=False;
  try
   DM.qrArtAdd.Close;
   DM.qrArtAdd.SQL.Clear;

   if P=0 then
    begin
     DM.qrArtAdd.SQL.Add('select IsNull((select top 1 Descr from Inform..SprDopDescr c (nolock) where c.id_descr=Max(s.id_descr)),'''') as descr,a.art_code,a.names,Sum(a.Ostat) as Ostat, Max(a.Cena) as Cena,');
     DM.qrArtAdd.SQL.Add('a.art_name ');
     DM.qrArtAdd.SQL.Add('from SprTov a (nolock),  ');
     DM.qrArtAdd.SQL.Add('(select i1.art_code,d.id_descr ');
     DM.qrArtAdd.SQL.Add('from SprForm f (nolock),       ');
     DM.qrArtAdd.SQL.Add('     SprITC i (nolock),        ');
     DM.qrArtAdd.SQL.Add('     Inform..SprDop d (nolock),');
     DM.qrArtAdd.SQL.Add('     SprITC i1 (nolock), ');
     DM.qrArtAdd.SQL.Add('     SprForm f1 (nolock) ');
     DM.qrArtAdd.SQL.Add('where f.art_code='+IntToStr(Art_Code)+' and           ');
     DM.qrArtAdd.SQL.Add('      f.art_code=i.art_code and      ');
     DM.qrArtAdd.SQL.Add('      i.itc=d.art_code and           ');
     DM.qrArtAdd.SQL.Add('      f.forma=d.forma and            ');
     DM.qrArtAdd.SQL.Add('      i1.itc=d.art_map and           ');
     DM.qrArtAdd.SQL.Add('      f1.forma=d.forma_map and       ');
     DM.qrArtAdd.SQL.Add('      f1.art_code=i1.art_code        ');
     DM.qrArtAdd.SQL.Add('group by i1.art_code,d.id_descr) s              ');
     DM.qrArtAdd.SQL.Add('where s.art_code=a.art_code and a.ostat>0       ');
     DM.qrArtAdd.SQL.Add('group by a.art_code,a.names,a.art_name');
     DM.qrArtAdd.SQL.Add('order by a.names');
    end else
   if P=1 then
    begin
     DM.qrArtAdd.SQL.Add('select '''' as descr,t.art_code,t.names,Sum(s.Ostat) as Ostat, Max(s.Cena) as Cena ');
     DM.qrArtAdd.SQL.Add('from SprTov s (nolock), SprTovar t (nolock)');
     DM.qrArtAdd.SQL.Add('where s.art_code=t.art_code and t.names like ''Пакет%'' and s.ostat>0 and '+IntToStr(Art_Code)+' not in (select art_code from Plist (nolock) where names like ''Пакет%'' ) ');
     DM.qrArtAdd.SQL.Add('group by t.art_code,t.names');
    end else
   if P=2 then
    begin
     DM.qrArtAdd.SQL.Add('select '''' as descr,t.art_code,t.names,Sum(s.Ostat) as Ostat, Max(s.Cena) as Cena ');
     DM.qrArtAdd.SQL.Add('from SprTov s (nolock), SprTovar t (nolock)');
     DM.qrArtAdd.SQL.Add('where s.art_code=t.art_code and s.art_code in (select b.art_code from SkdBiseptol b where param=0) and ');
     DM.qrArtAdd.SQL.Add('      '+IntToStr(Art_Code)+' in (select d.art_code from SkdBiseptol d where param=1) and s.ostat>0 ');
     DM.qrArtAdd.SQL.Add('group by t.art_code,t.names');
    end else
   if P=3 then // Дополнительные гарантии к измерителям
    begin
     DM.qrArtAdd.SQL.Add('exec spY_TonomAddSertif '+IntToStr(Prm.UserID));
    end else
   if (P>700000) and (P<799999) then
    begin
     DM.qrArtAdd.SQL.Add('select '''' as descr,b.art_add as art_code,a.names,Sum(a.Ostat) as Ostat, Max(a.Cena) as Cena');
     DM.qrArtAdd.SQL.Add('from SprTov a (nolock), DtAkcii b (nolock)');
     DM.qrArtAdd.SQL.Add('where a.ostat>0 and a.art_code=b.art_add and b.id_akcii='+IntToStr(P-700000));
     DM.qrArtAdd.SQL.Add('group by b.art_add,a.names');
     DM.qrArtAdd.SQL.Add('order by a.names');
    end;
//   DM.qrArtAdd.SQL.SaveToFile('C:\456.sql');
   DM.qrArtAdd.Open;
   if DM.qrArtAdd.IsEmpty then Exit;
   SpisArtAddF:=TSpisArtAddF.Create(Self);
   try
    SpisArtAddF.Param:=P;
    if P=1 then
     begin
      SpisArtAddF.Label1.Visible:=False;
      SpisArtAddF.Label2.Visible:=True;
      SpisArtAddF.Label3.Visible:=True;
      PlayFraz(4);
     end else
    if P=2 then
     begin
      SpisArtAddF.Label1.Visible:=True;
      SpisArtAddF.Label2.Visible:=False;
      SpisArtAddF.Label3.Visible:=False;
      SpisArtAddF.Label1.Caption:='Предложите покупателю нижеперечисленные препараты со скидкой 15% !!!';
     end else
    if P=3 then
     begin
      SpisArtAddF.Label1.Visible:=True;
      SpisArtAddF.Label2.Visible:=False;
      SpisArtAddF.Label3.Visible:=False;
      SpisArtAddF.Label1.Caption:='Ув. провизоры, предложите клиенту купить дополнительную гарантию на измерительную медтехнику из списка!';
     end else
    if (P>700000) and (P<799999) then
     SpisArtAddF.Label1.Caption:='Ув. провизоры, выберите в качестве подарка покупателю любой товар из ниже перечисленного списка' else
    if DM.qrArtAdd.FieldByName('Descr').AsString<>'' then
     SpisArtAddF.Label1.Caption:=StringReplace(DM.qrArtAdd.FieldByName('Descr').AsString,'$$$',DM.qrArtAdd.FieldByName('art_name').AsString,[rfIgnoreCase]);

    if (DM.qrArtAdd.RecordCount>1)  or (P in [0,1,2,3]) or ((P>700000) and (P<799999)) then
     begin
      Application.ProcessMessages;
      SpisArtAddF.ShowModal;
      KolAdd:=SpisArtAddF.Kol;
      ArtAdd:=SpisArtAddF.Art_Code;
      Result:=SpisArtAddF.Flag=1;
     end else begin
               KolAdd:=1;
               ArtAdd:=DM.qrArtAdd.FieldByName('art_code').AsInteger;
               Result:=True;
              end;
   finally
    SpisArtAddF.Free;
   end;
  except
   on E:Exception do
    begin
     Result:=False;
//     MessBox(ER_CR_FORM+': '+E.Message);
    end;
  end;
 end; {GetKolArtAdd}

function TMainF.CheckOnlyRecipt(Art_Code:Integer; Names:String; Kol:Integer):Boolean;
 begin
  Result:=True;
  Exit;
  // Закоментировано 26.07.2016 по звонку фаротдела Николенко Е.В
{  if FIsChSeria then Exit;
  if Not ((Art_code=45889) or (Art_code=39660) or (Art_code=39659)) then Exit;
  try
   Result:=False;
   BlankReciptF:=TBlankReciptF.Create(Self);
   try
    BlankReciptF.Kol:=Kol;
    BlankReciptF.Names:=Names;
    Application.ProcessMessages;
    BlankReciptF.ShowModal;
    if BlankReciptF.Flag<>1 then Abort;
    Result:=True;
   finally
    BlankReciptF.Free;
   end;
  except
   Result:=False;
   MessBox('Необходимо заполнить форму рецепта!');
  end;
 }
 end;

function TMainF.CheckKolUpak(Kol:Integer; var S:String):Boolean;
 begin
  try
   if Kol=200 then
    begin
     S:='В чек можно добавлять только этот перпарат! Очистите чек и наберите данный препарат заново!';
     Abort;
    end else
   if (Kol>200) and (Kol<=299) then
    begin
     S:='                                           Внимание!!!! '+#10#10+
        'Вы можете отпустить покупателю только '+IntToStr(Kol-200)+' упаковк(ки) данного препарата!!!';
     Abort;
    end;
   Result:=True;
  except
   Result:=False;
  end;
 end;

function TMainF.GetMDMSkd(AC:Integer; Upak:Integer; Kol,Cena:Currency):Real;
var ss,s:String;
    sr,sr1:TStringStream;
    ts:Integer;
 begin
  try
   if CheckTypeMDMU<>2 then Abort;

   DM.Qr8.Close;
   DM.Qr8.SQL.Text:='select * from SprMDM221 (nolock) where art_code='+IntToStr(AC);
   DM.Qr8.Open;
   if DM.Qr8.IsEmpty then Exit;

   ts:=DM.Qr8.FieldByName('type_skd').AsInteger;

//   HTTPRR.URL:='https://exim.mdmworld.com/CardService.asmx';
   HTTPRR.URL:=GetValueSC(DM.QrEx,'SiteMDM')+'CardService.asmx';
   s:='<?xml version="1.0" encoding="utf-8"?> '+#10+
      '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> '+#10+
      '  <soap:Body>                                              '+#10+
      '    <checkCardSale xmlns="http://tempuri.org/">            '+#10+
      '      <aSaleList>                                          '+#10+
      '        <CardCheckItem>                                    '+#10+
      '          <MdmCode>'+IntToStr(NumMDMUCard)+'</MdmCode>     '+#10+
      '          <ProductFormCode>'+DM.Qr8.FieldByName('EAN13').AsString+'</ProductFormCode>        '+#10+
      '          <SaleType>1</SaleType>                      '+#10+
      '          <RequestedPrice>'+CurrToStr(Cena*Upak)+'</RequestedPrice>         '+#10+
      '          <RequestedQuantity>'+CurrToStrF(Kol/Upak,ffFixed,4)+'</RequestedQuantity>   '+#10+
      '          <RequestedAmount>'+CurrToStr((Cena*Upak)*StrToCurr(CurrToStrF(Kol/Upak,ffFixed,4)))+'</RequestedAmount>       '+#10+
      '        </CardCheckItem>                                   '+#10+
      '      </aSaleList>                                         '+#10+
      '      <aLoginName>'+GetLoginMDMU+'</aLoginName>           '+#10+
      '      <aLoginPassword>pass</aLoginPassword>              '+#10+
      '    </checkCardSale>                                       '+#10+
      '  </soap:Body>                                             '+#10+
      '</soap:Envelope>                                           ';

   HTTPRR.SoapAction:='http://tempuri.org/checkCardSale';

   sR:=TStringStream.Create(s);
   sR1:=TStringStream.Create('');
   try

    DM.Qr6.SQL.Text:=sR.DataString; DM.Qr6.SQL.SaveToFile('C:\Log\Sr__.txt');
    HTTPRR.Execute(sR,sR1);
    DM.Qr6.SQL.Text:=Utf8ToAnsi(sR1.DataString); DM.Qr6.SQL.SaveToFile('C:\Log\Sr__1.txt');

//     if AnsiUpperCase(ss)<>AnsiUpperCase('ЏрнХажа ХнстсЯна') then raise EAbort.Create('Карточка не существует либо продажа уже совершена!') else MDMU221TypeCard:=1;

    ss:=Utf8ToAnsi(GetValueFromXML('ResultDescription',sR1.DataString));
    if AnsiUpperCase(ss)<>AnsiUpperCase('ЏрнХажа ХнстсЯна') then
     begin
      MessBox(GetValueFromXML('ResultDescription',sR1.DataString));
      Abort;
     end else begin
               //Result:=StrToInt(GetValueFromXML('ResultDiscountPercent',sR1.DataString));
              { DM.Qr8.Close;
               DM.Qr8.SQL.Text:='select 100-convert(numeric(8,2),100*cena/'+CurrToStr(Cena*Upak)+') as skd  from MDMU221 where art_code='+IntToStr(AC)+' and Type_Card='+IntToStr(MDMU221TypeCard);
               DM.Qr8.Open;
               if DM.Qr8.IsEmpty then Abort; }
               Result:=0;
               Case ts of
                0:Result:=StrToFloat(GetValueFromXML('ResultDiscountAmount',sR1.DataString));
                1:Result:=0.01*kol*cena*StrToFloat(GetValueFromXML('ResultDiscountPercent',sR1.DataString));
               end;
              end;
{
 if AnsiLowerCase(ss)='card code doesn''t exist' then raise EAbort.Create('Карточка не существует!');
}
//    Result:=True;
   finally
    sR.Free;
    sR1.Free;
   end;

  except
   Result:=0;
   sbMDMU1.Down:=False;
   NumMDMUCard:=-1;
  end;
 end;

{
  if CheckTypeMDMU=2 then
    begin
     s1:='checkCardResult';
     HTTPRR.URL:='http://exim.demo.mdmworld.com/CardService.asmx';
     s:='<?xml version="1.0" encoding="utf-8"?> '+#10+
        '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> '+#10+
        '  <soap:Body>                                   '+#10+
        '    <checkCard xmlns="http://tempuri.org/">     '+#10+
        '      <aMdmCode>'+IntToStr(NumMDMUCard)+'</aMdmCode>               '+#10+
        '      <aLoginName>'+GetLoginMDM+'</aLoginName>           '+#10+
        '      <aLoginPassword>pass</aLoginPassword>   '+#10+
        '    </checkCard>                                '+#10+
        '  </soap:Body>                                  '+#10+
        '</soap:Envelope>                                ';
     HTTPRR.SoapAction:='http://tempuri.org/checkCard';
    end;

   sR:=TStringStream.Create(s);
   sR1:=TStringStream.Create('');
   try

    DM.Qr6.SQL.Text:=sR.DataString; DM.Qr6.SQL.SaveToFile('C:\Sr_.txt');
    HTTPRR.Execute(sR,sR1);
    DM.Qr6.SQL.Text:=sR1.DataString; DM.Qr6.SQL.SaveToFile('C:\Sr_1.txt');
    ss:=GetValueFromXML(s1,sR1.DataString);
    if AnsiLowerCase(ss)='card code doesn''t exist' then raise EAbort.Create('Карточка не существует!');
    Result:=True;
   finally
    sR.Free;
    sR1.Free;
   end;
}

procedure TMainF.AddToOstat(AC:Integer; Ostat:Integer);
var i,CA:Integer;
    B:Boolean;
 begin
  try

   DM.Qr1.Close;
   DM.Qr1.SQL.Text:='exec spY_GetOstatTov '+IntToStr(AC);
   DM.Qr1.Open;
   Ostat:=DM.Qr1.FieldByName('Ostat').AsInteger;

   B:=False;
   for i:=Low(aOstat) to High(aOstat) do
    if aOstat[i].Art_Code=AC then
     begin
      B:=True;
      aOstat[i].Ostat:=Ostat;
     end;

   if Not B then
    begin
     CA:=High(aOstat)+1;
     SetLength(aOstat,CA+1);
     aOstat[CA].Art_Code:=AC;
     aOstat[CA].Ostat:=Ostat;
    end;
  except
   FilterSklad;
  end
 end;

function TMainF.ChooseTov(var Kol,Art_Code:Integer):Boolean;
 begin
  Kol:=0;
  if FullSprTov=False then begin Result:=True; Exit; end;
  Result:=False;
  EnterkolAdvF:=TEnterkolAdvF.Create(Self);
  try
   EnterkolAdvF.InitTovar(DM.spY_FilterSklad.FieldByName('art_code').AsInteger);
   Application.ProcessMessages;
   EnterkolAdvF.ShowModal;
   if EnterkolAdvF.Flag=1 then
    begin
     Kol:=EnterkolAdvF.Kol;
     Art_Code:=EnterkolAdvF.lbNames.Tag;
     Result:=True;
    end;
  finally
   EnterkolAdvF.Free;
  end;
 end;

// Ввод количества с диалога
function TMainF.GetKolFromDialog(Nm:String; DefKol:Integer; var Art_Code:Integer; var id_zam:Integer; P:Byte; Koef:Integer=0; Upak:Integer=0; Cap:String=''; Param:Byte=0):Integer;
var Kol,K:Integer;
 begin
  try
   DM.qrSpis.Close;
   Result:=-1;
   Kol:=0;
   EnterKolF:=TEnterKolF.Create(Self);
   try

    EnterKolF.Art_Code:=Art_Code;
    EnterKolF.lbName.Caption:=Nm;
    EnterKolF.lbAlert.Visible:=False;
    EnterKolF.Param2:=Param;

    if (Koef>1) or (Upak>1) then
     begin
      if (Koef=1) and (Upak>1) then K:=Upak else K:=Koef;
      EnterKolF.lbAlert.Visible:=True;
      EnterKolF.lbAlert.Caption:='Препарат делится! Будьте внимательны! В уп. - '+IntToStr(K)+' шт.';
     end;

{    DM.Qr7.Close;
    DM.Qr7.SQL.Text:='select kol from SprKol where art_code='+IntToStr(art_code);
    DM.Qr7.Open;
//    EnterKolF.UpDown1.Min:=0;
    if (P<>EN_SIMPLE) and (DM.Qr7.IsEmpty) and Not (Prm.AptekaID in [12,78,72,43,20]) and (Prm.FirmID<>5) then EnterKolF.UpDown1.Min:=DefKol;
}
    EnterKolF.UpDown1.Position:=DefKol;
    EnterKolF.Param:=P;
    if Cap<>'' then EnterKolF.Caption:=Cap;
//    Application.ProcessMessages;
    EnterKolF.ShowModal;
    if EnterKolF.ModalResult<>mrOK then begin Kol:=-1; Exit; end;

    Art_Code:=EnterKolF.Art_Code;
    id_zam:=EnterKolF.id_zam;
    Kol:=EnterKolF.UpDown1.Position;

   finally
    Result:=Kol;
    EnterKolF.Free;
   end;
  except
   on E:Exception do
    begin
     MessBox(E.Message);
     Result:=0;
    end;
  end;
 end; {GetKolFromDialog}

function TMainF.GetKolFromDialogAdv(Names:String; DefKol:Integer; var Ep:TEnterParam; Param:Byte=0):Integer;
 begin
  try
   Result:=-1;
   DM.qrSpis.Close;
   EnterKolNewF:=TEnterKolNewF.Create(Self);
   try
    EnterKolNewF.Param:=Param;
    EnterKolNewF.Ep:=Ep;
    EnterKolNewF.lbNames.Caption:=Names;
    EnterKolNewF.lbNames.Hint:=Names;
    GetOptimalFontSize(EnterKolNewF.lbNames.Caption,EnterKolNewF.lbNames.Font,EnterKolNewF.lbNames.Width,14);

    EnterKolNewF.lbArt.Caption:=IntToStr(Ep.Art_Code);
    EnterKolNewF.lbArt.Tag:=Ep.Art_Code;
    EnterKolNewF.edKol.Text:=IntToStr(DefKol);

    if (DM.qrSop.IsEmpty=False) and (Param=0)  then
     begin
      dbgSop.Visible:=False;
      hSoputstvF.Show;
      hSoputstvF.Enabled:=False;
     end;

    if (Ep.IsArtZam=True) or (Ep.IsConcomit=True) then
     begin

      if Ep.IsArtZam then hFarmZamAlertF.Label1.Caption:='ПРЕДЛОЖИТЕ ФАРМЗАМЕНУ' else
      if Ep.IsConcomit then hFarmZamAlertF.Label1.Caption:='ПРЕДЛОЖИТЕ СОПУТСТВУЮЩИЙ ТОВАР';

      if (Ep.IsConcomit=True) {and (Ep.IsPlanSale=False) and (Ep.IsPlanSaleApt=False) and (Ep.IsPlanSaleTotal=False)} then
       begin
        hFarmZamAlertF.Show;
        hFarmZamAlertF.Enabled:=False;
       end; 
     end;

    hPlanInfoF.Left:=-1000;
    hPlanInfoF.Show;
    hPlanInfoF.Enabled:=False;

    hPlanAptInfoF.Left:=-1000;
    hPlanAptInfoF.Show;
    hPlanAptInfoF.Enabled:=False;
   
    hPokupStatF.Enabled:=False;

    Application.ProcessMessages;
    EnterKolNewF.ShowModal;

    if EnterKolNewF.Flag<>1 then Exit;

    Ep.Art_Code:=EnterKolNewF.lbArt.Tag;
    Ep.id_akcii:=EnterKolNewF.id_akcii;
    Ep.id_prior:=EnterKolNewF.id_prior;
    Ep.aArtConc:=EnterKolNewF.Ep.aArtConc;
    Ep.cArtConc:=EnterKolNewF.Ep.cArtConc;
    Ep.Ra:=EnterKolNewF.Ep.Ra;

    Result:=StrToInt(EnterKolNewF.edKol.Text);

   finally
    //if DM.qrSop.IsEmpty=False then dbgSop.Visible:=True;

    hPlanInfoF.Close;
    hPlanAptInfoF.Close;
    hFarmZamAlertF.Close;
    hSoputstvF.Close;
    hPokupStatF.Close;
    EnterKolNewF.Free;

   end;
  except
   on E:Exception do MessBox('Ошибка ввода количества: '+E.Message,48);
  end;
 end;

function TMainF.OtkazZero:Boolean;
 begin
  Result:=True;
  Exit;
  try

   if DM.spY_FilterSklad.IsEmpty then Exit;
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spY_CheckOstatArt '+DM.spY_FilterSklad.FieldByName('art_code').AsString;
   DM.QrEx.Open;

   if DM.QrEx.FieldByName('Ostat').AsInteger=0 then Result:=False else Exit;

   OtkazInfoF:=TOtkazInfoF.Create(Self);
   try
    OtkazInfoF.Art_Code:=DM.spY_FilterSklad.FieldByName('art_code').AsInteger;
    OtkazInfoF.MakeFrom:=DM.spY_FilterSklad.FieldByName('MakeFrom').AsInteger;
    OtkazInfoF.Upak:=DM.spY_FilterSklad.FieldByName('Upak').AsInteger;

    OtkazInfoF.lbOstApteks.Caption:=DM.spY_FilterSklad.FieldByName('OstatAptek').AsString;
    OtkazInfoF.BitBtn2.Enabled:=DM.spY_FilterSklad.FieldByName('OstatAptek').AsCurrency>0;

    OtkazInfoF.ShowModal;
   finally
    OtkazInfoF.Free;
   end;
  except

  end;
 end;

function TMainF.ChooseTovFrom(var AC:Integer):Boolean;
 begin
  Result:=False;
  if Prm.FilterSklad=False then begin Result:=True; Exit; end;
  try
   DM.spY_MakeFromList.Close;
   DM.spY_MakeFromList.Parameters.ParamValues['@art']:=AC;
   DM.spY_MakeFromList.Parameters.ParamValues['@idu']:=Prm.UserID;
   DM.spY_MakeFromList.Open;

   if DM.spY_MakeFromList.RecordCount<=1 then begin Result:=True; Exit; end;
   ListMakeFromF:=TListMakeFromF.Create(Self);
   try
    ListMakeFromF.ShowModal;
    if ListMakeFromF.Flag=1 then
     begin
      Result:=True;
      AC:=DM.spY_MakeFromList.FieldByName('art_code').AsInteger;
     end;
   finally
    ListMakeFromF.Free;
   end;
  except
   on E:Exception do MessBox('Ошибка выбора позиции: '+E.Message);
  end;
 end;

function TMainF.CheckMakeFromExists(ds:TADOStoredProc; var ArtCode:Integer):Boolean;
var AC:Integer;
    Res,Nm:String;
    Srok:TDateTime;

 begin
  Result:=False;

  AC:=ds.FieldByName('ART_CODE').AsInteger;
  Nm:=ds.FieldByName('Names').AsString;

  if IsSrok(Nm,Srok)=False then
   try
    DM.Qr1.Close;
    DM.Qr1.SQL.Clear;
    DM.Qr1.SQL.Add('select art_code ');
    DM.Qr1.SQL.Add('from SprTov s (nolock) ');
    DM.Qr1.SQL.Add('where ostat>0 and art_code in (select art_code from Plist where makefrom='+ds.FieldByName('ART_CODE').AsString+') ');
    DM.Qr1.Open;

    if DM.Qr1.IsEmpty=False then
     if ds.Locate('art_code',DM.Qr1.FieldByName('ART_CODE').AsInteger,[]) then
      begin
       if MessBox('Для позиции: '#10+nm+#10'есть сроковая или без упаковки позиция: '#10+
                   ds.FieldByName('Names').AsString+#10#10'Добавить в чек сроковую или без упаковки?',
                   52,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res)<>ID_YES
       then Abort
       else begin  ArtCode:=DM.Qr1.FieldByName('ART_CODE').AsInteger; Result:=True; end;
      end else Abort;
   except
    if ds.Locate('art_code',AC,[])=False then Exit;
   end;

 end;

procedure TMainF.CheckRaznCena(ArtCode:Integer);
 begin
  try
   DM.qrSpisArtCena.Close;
   DM.qrSpisArtCena.SQL.Text:='exec spY_SpisArtCodeCena '+IntToStr(ArtCode);
   DM.qrSpisArtCena.Open;
   if DM.qrSpisArtCena.RecordCount<=1 then Exit;
   SpisArtCenaF:=TSpisArtCenaF.Create(Self);
   try
    SpisArtCenaF.ShowModal;
   finally
    SpisArtCenaF.Free;
   end;
  except
  end;
 end;

function TMainF.CheckArtAkciiAdd(Art:Integer; var Ep:TEnterParam):Boolean;
 begin
  try

   Result:=False;

   Ep.IsArtZam:=False;
   Ep.IsPlanSale:=False;
   Ep.IsPlanSaleApt:=False;
   Ep.IsConcomit:=False;

   DM.qrZamZamena.Close;
   DM.qrZamZamena.SQL.Text:='exec spY_ArtZamena '+IntToStr(Art);
   DM.qrZamZamena.Open;

   if DM.qrZamZamena.IsEmpty=False then begin Result:=True; Ep.IsArtZam:=True; end;

   DM.QrEx1.Close;
   DM.QrEx1.SQL.Text:='exec spY_PlanSale '+IntToStr(Art)+',null,null,0';
   DM.QrEx1.Open;

   if DM.QrEx1.IsEmpty=False then begin Result:=True; Ep.IsPlanSale:=True; end;

   DM.QrEx1.Close;
   DM.QrEx1.SQL.Text:='exec spY_PlanSale '+IntToStr(Art)+',null,null,1';
   DM.QrEx1.Open;
   if DM.QrEx1.IsEmpty=False then begin Result:=True; Ep.IsPlanSaleApt:=True; end;

   DM.QrEx1.Close;
   DM.QrEx1.SQL.Text:='exec spY_PlanSale '+IntToStr(Art)+',null,null,2';
   DM.QrEx1.Open;
   if DM.QrEx1.IsEmpty=False then begin Result:=True; Ep.IsPlanSaleTotal:=True; end;

   DM.QrEx1.Close;
   DM.QrEx1.SQL.Text:='exec spY_Concomit '+IntToStr(Art)+',null,null';
   DM.QrEx1.Open;
   if DM.QrEx1.IsEmpty=False then begin Result:=True; Ep.IsConcomit:=True; end;

  except
   Result:=False;
  end
 end;

// Запрос на ввод количества единиц товара со всеми предварительными и пост-проверками
procedure TMainF.PrevEnterKol(Param:Integer; IsFirstRec:Integer; ArtCode:Integer);

var tmp,Ostat,CKol,{AC,} PkolAdd,KolD,i,Upak,Koef,Koef1,Kol,KolAdd,ArtAdd,Art_Code,Art_CodeSafe,Old_Art,F_NDS,Type_Map,i1,i2:Integer;
    Srok,T:TDateTime;
    Res,Nm,erStr,FIODoctor:String;
    B,IsAddSrok,IsGeptral:Boolean;
    Ep:TEnterParam;
    IsShowOpt:Boolean;

 // Определение совместимости товаров ЧП или не ЧП
 function CheckComp:Boolean;
  begin
   if DM.qrChek.IsEmpty then Result:=True else
    begin
     Result:=False;

     if IsCHP then
      begin
       if Not (F_NDS in F_NDS_CHP) then MessBox('Нельзя добавить в чек товар не ЧП!')
                                   else Result:=True;
      end else begin
                if F_NDS in F_NDS_CHP then MessBox('Нельзя добавить в чек товар ЧП!')
                                      else Result:=True;
               end;
    end;
  end;

 function KolArtAdd(P:Integer=0):Boolean;
  begin
   Result:=False;
   if TypeChek=TC_BACK then Exit;
   KolAdd:=0;
   if Kol>0 then Result:=GetKolArtAdd(Art_CodeSafe,KolAdd,ArtAdd,P);
   if Old_Art<>Art_Code then
    try
     Type_Map:=1;
     DM.Qr1.Close;
     DM.Qr1.SQL.Text:='select * from NoScan (nolock) where art_code='+IntToStr(Art_Code);
     DM.Qr1.Open;
     if DM.Qr1.IsEmpty then Abort;
     Param:=1;
    except
     Param:=0;
    end;
  end;

 procedure GetZamPrep(var Art_code:Integer);
  begin
{
  try
    DM.qrZamPrep.Close;
    DM.qrZamPrep.SQL.Clear;
    DM.qrZamPrep.SQL.Add('select z.art_code,s.names,Sum(s.ostat) as kol,s.cena,z.pr                           ');
    DM.qrZamPrep.SQL.Add('from SprZamPrem z,                                                                  ');
    DM.qrZamPrep.SQL.Add('     SprTov s                                                                       ');
    DM.qrZamPrep.SQL.Add('where z.art_code=s.art_code and z.atc in (select itc from SprITC where art_code='+IntToStr(art_code)+') ');
    DM.qrZamPrep.SQL.Add('group by z.art_code,s.names,s.cena,z.pr ');
    DM.qrZamPrep.SQL.Add('order by 2 ');
    DM.qrZamPrep.Open;
    if DM.qrZamPrep.IsEmpty then Exit;
    FirstRecF:=TFirstRecF.Create(Self);
     try
      FirstRecF.ShowModal;
      if FirstRecF.Flag=1 then Art_Code:=DM.qrZamPrep.FieldByName('art_code').AsInteger;
     finally
      FirstRecF.Free;
     end;
   except
   end;
}
  end;

 procedure CheckKodterpin(P:Byte);
 var Res:String;
  begin
{
   DM.Qr1.Close;
   DM.Qr1.SQL.Text:='select top 1 art_code from SprKodeterp (nolock) where art_code='+IntToStr(Art_Code);
   DM.Qr1.Open;
   if DM.Qr1.IsEmpty=False then
    Case P of
     1:if MessBox('Препарат НЕ ОТПУСКАЕТСЯ лицам до 16 лет (только при предъявлении паспорта).'#10' Прежде чем отпустить препарат покупателю. ОБЯЗАТЕЛЬНО озвучить фразу "У Вас есть рецепт?',52)<>ID_YES then raise EAbort.Create('');
     2:if MessBox('Озвучена фраза  "У Вас есть рецепт?" Можете отпустить препарат покупателю',52)<>ID_YES then raise EAbort.Create('');
    end;
 }

  // if AnsiUpperCase(Prm.aCity)<>'ХАРЬКОВ' then Exit;
   DM.Qr1.Close;
   DM.Qr1.SQL.Text:='select top 1 art_code from SprRecipt (nolock) where art_code='+IntToStr(Art_Code);
   DM.Qr1.Open;
   if DM.Qr1.IsEmpty=False then
    MessBox('ДАННЫЙ ПРЕПАРАТ ОТПУСКАЕТСЯ СТРОГО ПО РЕЦЕПТУ'#10+
            'Напоминаем Вам что, согласно "Приказа МОЗ Украины от 19 июля 2015г. № 360" '#10+
            'Рецепты на лекарственные средства, выписанные на рецептурных бланках ф-1, действительны в течение одного месяца со дня выписки. '+
            'На рецептах, при отпуске по ним лекарственных средств, проставляется штамп "Отпущено"   '#10+
            '                и НЕ ВОЗВРАЩАЕТСЯ ПОКУПАТЕЛЮ,'#10+
            '                а остается в аптеке.'#10+
            '                И с первой машиной передается в офис. '#10+
            'Рецепты с уже проставленным штампом "Отпущено" в аптеке             провизором не должны приниматься.',
             48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
  end;

 function CheckRecipt1(AC:Integer):Boolean;
 var S,ss:String;
     i,q:Integer;
  begin
   FIODoctor:='';
   if Not ((AC=89722) or (AC=55679) or (AC=14290) or (AC=94997) or (AC=155157) or (AC=181479) ) then begin Result:=True; Exit; end;
   Result:=False;
   Repeat
    if Not EnterStrValue(FIODoctor,'Введите ФИО врача') then Exit;
    q:=0;
    ss:='';
    FIODoctor:=Trim(FIODoctor);
    for i:=1 to Length(FIODoctor) do
     if (FIODoctor[i]<>' ') or ((FIODoctor[i-1]<>' ') and (FIODoctor[i]=' ')) then ss:=ss+FIODoctor[i];

    FIODoctor:=ss;

    for i:=2 to Length(FIODoctor)-1 do
     if (FIODoctor[i]=' ') and (FIODoctor[i-1]<>' ') and (FIODoctor[i+1]<>' ') then Inc(q);

    if (Length(Trim(FIODoctor))<6) or (q<2) then MessBox('Введите коректно Фамилию, Имя и Отчество врача через пробел полностью!') else
     begin
      Result:=True;
      Break;
     end;
    Until False;
  end;

 Begin
  try
   IsAddSrok:=False;

 //  dbgSklad.Enabled:=False;

   if DM.spY_FilterSklad.IsEmpty then Exit;

   if FPayWork then Exit;
   if CheckSmena=False then Exit;
   if BlockingChek then Exit;
   CheckOpening:=True;

   if ArtCode in [1,2,7] then
    begin
     MessBox('Добавлять в чек дисконтные карты в ручном режиме нельзя!'#10#10'При регистрации дисконтной карты она будет добавлена в чек автоматически!');
     Exit;
    end;

   if (sbFix10.Down=True) then
    begin
     MessBox('Нажата кнопка "Гептрал(РАЗОМ)-30%" добавлять в чек позиции уже нельзя!');
     Exit;
    end;

   if (TypeChek=TC_PILOT) and (FFlagPilot=False) and (Param<>EK_SILENT) then
    begin
     MessBox('В режиме "Доступнi лiки" нельзя добавлять перпараты вручную!');
     Exit;
    end;

   if (TypeChek=TC_INSULIN) and (FFlagInsulin=False) and (Param<>EK_SILENT) then
    begin
     MessBox('В режиме "Инсулин по рецепту" нельзя добавлять перпараты вручную!');
     Exit;
    end;

   if (FIsPayMaster=True) or (FIsIAptekaCredit=True) then
    begin
     MessBox('Данная бронь уже оплачена, поэтому добавлять новые товарные позиции нельзя!');
     Exit;
    end;

   if Prm.UserRole=R_DISP then
    begin
     MessBox('В этом режиме работы программы добавлять в чек позиции нельзя!');
     Exit;
    end;

   if (Copy(IntToStr(NumCardMag),1,3)=CR_PROH) and (FFlagProh=False) and (Param<>EK_SILENT) then
    begin
     MessBox('В этом режиме работы программы добавлять в чек позиции нельзя!');
     Exit;
    end;

   if (Fid_strah>0) and (Fidres<>-1) then
    begin
     MessBox('В режиме чека по страховым вручную добавлять позиции в чек нельзя!');
     Exit;
    end;

   IsGeptral:=False;
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select art_code from Skd_limit (nolock) where type_skd=3 and art_code='+IntToStr(ArtCode);
   DM.QrEx.Open;
   if DM.QrEx.IsEmpty=False then
    if MessBox('Если данную позицию вы будете проводить по акции по кнопке "Гептрал(РАЗОМ)-30%" - нажмите "ДА"',52)=ID_YES then IsGeptral:=True;

   if (Fid_strah>0) then
    begin
     DM.QrEx.Close;
     DM.QrEx.SQL.Text:='exec spY_CheckStrahNDS '+IntToStr(Prm.UserID)+','+DM.spY_FilterSklad.FieldByName('F_NDS').AsString;
     DM.QrEx.Open;
     if DM.QrEx.FieldByName('Res').AsInteger=0 then
      begin
       MessBox('В чеке по страховым могут быть позиции только одинаковой ставки НДС!');
       Exit;
      end;
    end;

   {
    DM.QrEx.Close;
    DM.QrEx.SQL.Text:='select Count(*) as cnt from Chek where IsNull(id_doctor,0)<>0 and id_user='+IntToStr(Prm.UserID)+' and compname=host_name()';
    DM.QrEx.open;
    if DM.QrEx.FieldByName('Cnt').AsInteger>0 then
     begin
      MessBox('В данном режиме нельзя в чек добавлять другие позиции!');
      Exit;
     end;
   }
   // Если в чек добавляется препарат "онкология"

 {
   if Pos('***',DM.spY_FilterSklad.FieldByName('Names').AsString)<>0 then
    begin
     DM.QrEx.Close;
     DM.QrEx.SQL.Text:='select Count(*) as cnt from Chek where names like ''%***%'' and id_user='+IntToStr(Prm.UserID)+' and compname=host_name()';
     DM.QrEx.open;
     if DM.QrEx.FieldByName('cnt').AsInteger=0 then
      begin
       AddDoctorF:=TAddDoctorF.Create(Self);
       try
        AddDoctorF.ShowModal;
        if AddDoctorF.Flag=0 then Exit;
        Ep.id_doctor:=AddDoctorF.aID[AddDoctorF.cbDoctor.ItemIndex].ID;
        Ep.card_doctor:=AddDoctorF.lbNCard.Caption;
       finally
        AddDoctorF.Free;
       end;
      end;
    end;
 }
   IsShowOpt:=False;
   if Not (TypeChek in TC_DL) then
    begin
     if (Prm.OptCena=False) and (FIsSkd7=False) and (Prm.AptekaSklad) and (Prm.Dobraia=False) and (Prm.IsNightCena=False) then IsShowOpt:=True;

     if (Prm.OptCena=False) and (Param<>EK_SILENT) then
      begin
       if (FIsSkd7=False) and (Prm.AptekaSklad) and (Prm.Dobraia=False) and (RoundTo(DM.spY_FilterSklad.FieldByName('OstatUp').AsFloat,-2)>=3) and
          (RoundTo(DM.spY_FilterSklad.FieldByName('Skd').AsFloat,-2)<RoundTo(DM.spY_FilterSklad.FieldByName('CenaUp').AsFloat,-2)) and (Prm.IsNightCena=False) then

        begin

         MainF.MessBox('"У нас при покупке от 3 упаковок одного товара в чеке действует накопление разницы между розничной и оптовой ценой на карту, что очень выгодно.'#10+
                       'Накопление на карту '+CurrToStrF(DM.spY_FilterSklad.FieldByName('Skd').AsFloat,ffFixed,2)+' грн. "'
                       //'Розничная цена '+CurrToStrF(DM.spY_FilterSklad.FieldByName('CenaUp').AsFloat,ffFixed,2)+' грн. "'
                       ,48,GetFont('Times New Roman',22,$00006600,[fsBold]),0,Res,False,'Озвучьте фразу:');
        end;
      end;
    end;

   FEnterKol:=True;
   FSkdCalced:=False;
   T:=Time;
   Type_Map:=0;
   if Not (IsPermit([R_SUPER,R_KASSIR,R_OPER,R_PROVIZ],P_ALERT)) then Exit;


   // Проверка если сроковые на остатке, если пытаемся продать несроковые
   if Not ( (FID_strah>0) or (TypeChek in TC_DL)) then
    IsAddSrok:=CheckMakeFromExists(DM.spY_FilterSklad,ArtCode);

   Art_Code:=ArtCode;
   Art_CodeSafe:=Art_Code;


   // Проверяем если на арткод разные цены высвечиваем сообщение
   CheckRaznCena(Art_Code);

//   DM.spY_FilterSklad.Locate('ART_CODE',ArtCode,[loCaseInsensitive,loPartialKey]);

   if TypeChek=TC_BACK then KolD:=EN_SIMPLE else KolD:=EN_PODBOR;

   if (Param=0) and (GroupIndex=99) and (TypeChek<>TC_BACK) then
    begin
     MessBox('Товары этой группы можно добавлять в чек только путем сканирования!');
     Exit;
    end;

   if Art_Code<=0 then begin MessBox('Нулевой "Код"!'); Exit; end;

   if (Prm.IsKurier=False) { and (Prm.FirmID<>14) and (Prm.FirmID<>15) and (Prm.FirmID<>16) {and (Prm.AptekaID<>322)} then
   if IsSrok(DM.spY_FilterSklad.FieldByName('Names').AsString,Srok) then
    if (Date>Srok) then
     begin
      MessBox('Данный товар является просроченным и не может быть реализован!');
      Exit;
     end;

   // Окошко оформления отказа по позиции с нулевым количеством
   if OtkazZero=False then Exit;

   // Если объединены "сделано из"
   if Not ChooseTovFrom(Art_Code) then Exit;

   F_NDS:=DM.spY_FilterSklad.FieldByName('F_NDS').AsInteger;

{
 AppendStringToFile('C:\111.txt','1. '+IntToStr(MilliSecondsBetween(T,Time)));
 T:=Time;
}

   DM.Qr.Close;
   if CheckComp then
    begin
{
AppendStringToFile('C:\111.txt','2. '+IntToStr(MilliSecondsBetween(T,Time)));
T:=Time;
}
     CheckKodterpin(1);

//     if Not CheckRecipt1(Art_Code) then Abort;

     Ep.id_akcii:=0;
     Old_Art:=Art_Code;
     Koef:=0;
     try
      DM.Qr1.Close;
      DM.Qr1.SQL.Text:='select * from Inform..SprKoef (nolock) where art_code='+IntToStr(Art_Code);
      DM.Qr1.Open;
      if DM.Qr1.IsEmpty then Abort;

      Upak:=DM.Qr1.FieldByName('Upak').AsInteger;
      Koef1:=DM.Qr1.FieldByName('Koef').AsInteger;

//      Kol:=GetKoef(DM.Qr1.FieldByName('Koef').AsInteger,DM.Qr1.FieldByName('Upak').AsInteger);
      Kol:=DM.Qr1.FieldByName('Koef').AsInteger;
      Koef:=Kol;
      if Kol<=1 then Abort;
      if Kol>DM.spY_FilterSklad.FieldByName('OSTAT').AsInteger then Kol:=DM.spY_FilterSklad.FieldByName('OSTAT').AsInteger;

     except
      Kol:=0;
     end;

     if Kol=0 then Kol:=1;

     if Param=EK_SILENT then
      begin
       Kol:=DM.spY_FilterSklad.FieldByName('Upak').AsInteger;
      end else
     if FIsChSeria then
      begin
       Kol:=Random(5)+1;
       if Kol>DM.spY_FilterSklad.FieldByName('OSTAT').AsInteger then Kol:=DM.spY_FilterSklad.FieldByName('OSTAT').AsInteger;
      end else begin
                 Ep.Art_code:=Art_Code;
                 if Not ChooseTov(CKol,Art_Code) then Exit;

                 if CKol<=0 then
                  begin
                   if Prm.AdvEnterKol then Kol:=GetKolFromDialogAdv(DM.spY_FilterSklad.FieldByName('Names').AsString,Kol,Ep,1) else
                   if CheckArtAkciiAdd(Art_Code,Ep) then
                    begin
//                     Kol:=GetKolFromDialog(DM.spY_FilterSklad.FieldByName('Names').AsString,Kol, Art_Code,id_zam,KolD,Koef,DM.Qr1.FieldByName('Upak').AsInteger,'',1);
                     Kol:=GetKolFromDialogAdv(DM.spY_FilterSklad.FieldByName('Names').AsString,Kol,Ep,1);
                     //GetKolFromDialog(DM.spY_FilterSklad.FieldByName('Names').AsString,Kol,Art_Code,1)
//                     if Art_Code<>Old_Art then Type_Map:=3;
                    end else Kol:=GetKolFromDialog(DM.spY_FilterSklad.FieldByName('Names').AsString,Kol,Art_Code,tmp,KolD,Koef,DM.Qr1.FieldByName('Upak').AsInteger);
                  end else Kol:=CKol;
                 Art_code:=Ep.Art_code;
                end;

//     DM.spY_FilterSklad.Locate('ART_CODE',ArtCode,[loCaseInsensitive,loPartialKey]);

     if (Art_code=Old_Art) and (Param<>EK_SILENT) then GetZamPrep(Art_code);

     if Kol<=0 then Exit;

     DM.QrEx.Close;
     DM.QrEx.SQL.Text:='exec spY_CheckKolPresent '+IntToStr(Art_code)+','+IntToStr(Kol)+','+IntToStr(Prm.UserID)+',0';
     DM.QrEx.Open;
     if DM.QrEx.FieldByName('Res').AsInteger<>1 then
      begin
       Case DM.QrEx.FieldByName('Res').AsInteger of
         0:begin
            MessBox('В чеке уже есть достаточное количество подарочных позиций!');
            Exit;
           end;
        -1:MessBox('Из чека будут удалены подарочные позиций, так как вы редактируете неакционные позиции!');
       end;
      end;

     if (Fid_strah=0) and
        (Kol<DM.spY_FilterSklad.FieldByName('Upak').AsInteger) and
        (Kol<>OstatEd ) and
        (DM.spY_FilterSklad.FieldByName('IsAnnot').AsInteger=1) and
        (Ep.id_akcii=0) then
      try
       {
        if MessBox('Предложите клиенту распечатать инструкцию: '#10#10+
                  '  ДА - распечатать инструкцию'#10'  НЕТ - клиент отказался от инструкции.'
                  ,
                  52,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res)=ID_YES then

        ShowAnnotation(DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger,1);
       }
       PrintAnnotF:=TPrintAnnotF.Create(Self);
       try
        PrintAnnotF.ShowModal;
       finally
        PrintAnnotF.Free;
       end;
      except
      end;

     if Art_Code<=0 then begin MessBox('Нулевой "Код"!'); Exit; end;
     if Not CheckOnlyRecipt(Art_Code,DM.spY_FilterSklad.FieldByName('Names').AsString,Kol) then Abort;

{
     ShowPKUInfo(Art_Code);
     ShowPKUInfo(Art_Code,1);
}

     B:=DM.qrChek.IsEmpty;
     if TypeChek=TC_RECIPT_PL then B:=False;
     PkolAdd:=0;
     for i:=1 to 100000 do
      begin
       if i>1 then
        begin
         if (Fid_strah>0) or (TypeChek in TC_DL) or (Param=EK_SILENT) then Break;
         Ep.id_akcii:=0;
         Ep.id_prior:=0;
         if i=2 then
          begin
           if B then
           if Not KolArtAdd(1) then Continue;
          end else
         if i=3 then
          begin
           if Not KolArtAdd(2) then Continue;
          end else
         if i=4 then
          begin
           if Not KolArtAdd(3) then Continue;
          end else
         if Not KolArtAdd(PkolAdd) then Break;

         if KolAdd<=0 then Continue else
          begin
           Type_Map:=2;
           Kol:=KolAdd;
           if i>2 then Old_Art:=Art_CodeSafe;
           Art_code:=ArtAdd;
          end;
        end;

       try

        DM.spY_EnterKol.Parameters.ParamValues['@part_code']:=Art_code;
        DM.spY_EnterKol.Parameters.ParamValues['@pold_art']:=Old_Art;
        DM.spY_EnterKol.Parameters.ParamValues['@pkol']:=Kol;
        DM.spY_EnterKol.Parameters.ParamValues['@piduser']:=Prm.UserID;
        DM.spY_EnterKol.Parameters.ParamValues['@ptm']:=Type_map;
        if IsFirstRec>0 then DM.spY_EnterKol.Parameters.ParamValues['@fr']:=1
                        else DM.spY_EnterKol.Parameters.ParamValues['@fr']:=0;
        DM.spY_EnterKol.Parameters.ParamValues['@MDMSkd']:=GetMDMSkd(Art_code,Koef1,Kol,DM.spY_FilterSklad.FieldByName('Cena').AsFloat);
        DM.spY_EnterKol.Parameters.ParamValues['@FIODoctor']:=FIODoctor;
        DM.spY_EnterKol.Parameters.ParamValues['@idres']:=-1;
        DM.spY_EnterKol.Parameters.ParamValues['@Force']:=0;
        DM.spY_EnterKol.Parameters.ParamValues['@id_zam']:=Ep.id_akcii;
        DM.spY_EnterKol.Parameters.ParamValues['@id_prior']:=Ep.id_prior;
        DM.spY_EnterKol.Parameters.ParamValues['@NumSeriya']:=DM.spY_FilterSklad.FieldByName('NumSeriya').Value;
        DM.spY_EnterKol.Parameters.ParamValues['@id_part']:=Ep.Ra.id_part;
        DM.spY_EnterKol.Parameters.ParamValues['@cena_obsl']:=0;
        DM.spY_EnterKol.Parameters.ParamValues['@idres_np']:=0;
        DM.spY_EnterKol.Parameters.ParamValues['@id_doctor']:=Ep.id_doctor;
        DM.spY_EnterKol.Parameters.ParamValues['@card_doctor']:=Ep.card_doctor;
        DM.spY_EnterKol.Parameters.ParamValues['@IsGeptral']:=BoolToInt(IsGeptral);

        if (FId_strah>0) or
           (Param=EK_SILENT) or
           (FTypeChek in TC_DL) or
           (Fid_doctor>0) or
           (FIsPayMaster=True) or
           (FIsIAptekaCredit=True) then DM.spY_EnterKol.Parameters.ParamValues['@simp']:=1
                                   else DM.spY_EnterKol.Parameters.ParamValues['@simp']:=0;

        if TypeChek=TC_RECIPT_PL then DM.spY_EnterKol.Parameters.ParamValues['@Cena']:=DM.spY_FilterSklad.FieldByName('Cena').Value
                                 else DM.spY_EnterKol.Parameters.ParamValues['@Cena']:=Variants.Null;
//                                 else DM.spY_EnterKol.Parameters.ParamValues['@Cena']:=NULL;

        if TypeChek=TC_SROK then DM.spY_EnterKol.Parameters.ParamValues['@IsSrok']:=NReestrSrok
                            else DM.spY_EnterKol.Parameters.ParamValues['@IsSrok']:=0;

        if (FTypeChek=TC_BACK) or ((PkolAdd>700000) and (PkolAdd<799999))  then
         begin
          DM.spY_EnterKol.Parameters.ParamValues['@simp']:=1;
          PkolAdd:=0;
         end; // else DM.spY_EnterKol.Parameters.ParamValues['@simp']:=0;

        Case i of
         1:begin
            if Param=EK_SILENT then DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=0 else
            if (IsAddSrok) or ((Ep.id_akcii>0) and (Ep.id_prior=4)) then DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=0
             else
            if DM.spY_FilterSklad.FieldByName('IsScan').AsInteger<>0 then
             DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=1
            else
             DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=Param;
           end;
         2:DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=-1;
         3:DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=0;
        end;

       DM.ADOCo.BeginTrans;
        try

         DM.spY_EnterKol.ExecProc;

         if EP.id_prior=6 then // Добавление чек выбранных сопутсвующих
          for i1:=1 to EP.cArtConc do
           begin
            DM.QrEx.Close;
            DM.QrEx.SQL.Text:='exec spY_AddToChek '+IntToStr(EP.aArtConc[i1].Art_Code)+','+IntToStr(EP.aArtConc[i1].Kol)+','+IntToStr(Prm.UserID)+','+IntToStr(Ep.id_akcii)+','+IntToStr(Ep.id_prior)+' select 999 as Res';
            DM.QrEx.Open;
           end;

         if IsFirstRec>0 then
          begin
           DM.QrEx.Close;
           DM.QrEx.SQL.Text:='exec spY_EnterKol '+IntToStr(IsFirstRec)+',1,'+IntToStr(Prm.UserID)+',-1,'+IntToStr(IsFirstRec)+',0,1 select 9999 as Res';
           DM.QrEx.Open;
          end;

      //   Ostat:=DM.spY_EnterKol.FieldByName('ostat').AsInteger;

         if DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']=77 then
          MainF.MessBox('Проверьте ценники на витрине на позицию "'+DM.spY_FilterSklad.FieldByName('Names').AsString+'" и при необходимости замените их!!',
                        48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res) else

         if DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']=45 then
          MainF.MessBox('В чек добавлена "Скретч-карта", не забудте добавить в чек подарок и выдать его покупателю!') else

         if (DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']>700000) and (DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']<799999) then
          PkolAdd:=DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE'] else

         if DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']=21 then
          raise EAbort.Create('Введеное количество превышает остаток склада'+#10+'Или товар забрал другой оператор либо товар находиться в спике забронированных или зарезервированных для возврата!') else

         if DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']=25 then
          raise EAbort.Create('В чеке недостаточное количество "Сертификатов" для ввода данного препарата!');

         if DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']=321 then
          raise EAbort.Create('В реестре сроковых препаратов №'+IntToStr(NReestrSrok)+' недостаточное количество выбранного препарата, либо он не является сроковым!');

         if DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']=20 then
          raise EAbort.Create('Недостаточное количество товара, либо часть товара доступна только для продажи по льготным рецептам!');

         if DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']=547 then
          raise EAbort.Create('В чеке должно быть не более 2 наименваний или 2 штук акционных позиций!');

         if DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']=263 then
          raise EAbort.Create('По данной позиции недостаточное количество партиям одного поставщика! Продажа невозможна!');

         if Not CheckKolUpak(DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE'],erStr) then raise EAbort.Create(erStr);

//         CheckKodterpin(2);
         DM.ADOCo.CommitTrans;
//         dbgSklad.Enabled:=True;
         DM.spY_EnterKol.Parameters.ParamValues['@id_doctor']:=0;
         DM.spY_EnterKol.Parameters.ParamValues['@card_doctor']:='';

         if Not ChekOpened then btnOChekClick(btnOChek);

         FEp:=Ep;
         if Ep.id_prior=4 then
          begin
           Ep.Ra.Status:=2;
           RegArtZamena(Ep);
          end
          else
            if (Ep.id_prior = 6) then
            begin
              for i2:=0 to Ep.cArtConc do
              begin
                if EP.aArtConc[i2].Art_Code <> 0 then
                begin
                  Ep.Ra.Art_Map:=EP.aArtConc[i2].Art_Code;
                  Ep.Ra.Status:=2;
                  MainF.RegArtZamena(Ep);
                end;
              end;
            end;

         AddToOstat(Art_CodeSafe,Ostat);

         if (IsShowOpt=True) and (Type_Skd<>SK_CARD) then
          begin
           DM.QrEx2.Close;
           DM.QrEx2.SQL.Text:='exec spY_CheckOptCena '+IntToStr(Prm.UserID);
//           DM.QrEx2.SQL.SaveToFile('c:\log\opt.txt');
           DM.QrEx2.Open;
           if DM.QrEx2.FieldByName('Res').AsInteger=1 then
            MessBox('При добавлении в чек еще одного или более товаров - будет действовать оптовая цена на все товары в чеке!',
                   48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),5,Res);
          end;

        except
         on E:EAbort do
          begin
           DM.ADOCo.RollbackTrans;
           if E.Message<>'' then MessBox(E.Message);
           Break;
          end else begin
                    DM.ADOCo.RollbackTrans;
                    Break;
                   end;
        end;
      finally
       if (Prm.FirmID=13) or (Prm.OptCena) then FilterSklad;
       CheckOpening:=False;
       RefreshChek;
      end;
     end;
    end;
  finally
//   dbgSklad.Enabled:=True;
   CheckOpening:=False;
   FEnterKol:=False;
   FSkdCalced:=False;
  end;
 End; {PrevEnterKol}

// Ввод количества товара в Чеке
procedure TMainF.PrevDelKol;
var Res,Kol,Art_Code,AC,id_zam:Integer;
    erStr:String;
    B:Boolean;
 begin
  if FPayWork then Exit;
  if BlockingChek then Exit;
  if TypeChek=TC_OBSL then Exit;

  if ChekOpened then
   begin

    if DM.qrChek.FieldByName('art_code').AsInteger in [1,2,7] then
     begin
      MessBox('Удалять дисконтные карты или изменять их количество в чеке нельзя. Можно только отменить полностью чек!');
      Exit;
     end;

   if (sbFix10.Down=True) then
    begin
     MessBox('Нажата кнопка "Гептрал(РАЗОМ)-30%" добавлять в чек позиции уже нельзя!');
     Exit;
    end;

   if TypeChek=TC_PILOT then
    begin
     MessBox('Чек по программе "Доступнi лiки" редактировать нельзя!');
     Exit;
    end;

   if TypeChek=TC_INSULIN then
    begin
     MessBox('В режиме "Инсулин по рецепту" нельзя редактировать чек!');
     Exit;
    end;

   if (Fid_strah>0) and (Fidres<>-1) then
    begin
     MessBox('В режиме чека по страховым вручную редактировать чек нельзя!');
     Exit;
    end;

   if (FIsPayMaster=True) or (FIsIAptekaCredit=True) then
    begin
     MessBox('Данная бронь уже оплачена, поэтому изменять количество нельзя!');
     Exit;
    end;

    if (FTypeRes=1) and (FIDRES<>-1) and (DM.qrChek.FieldByName('idres').AsInteger<>-1) and (DM.qrRes.FieldByName('TypeZakazI').AsInteger<>1) then
     try
      CancelResF:=TCancelResF.Create(Self);
      try

       CancelResF.Label3.Caption:='  Для изменения количества и ассортимента брони введите номер заказа и телефон покупателя';
       CancelResF.PrefixID:=DM.qrRes.FieldByName('PrefixID').AsString;
       CancelResF.NumZakaz:=DM.qrRes.FieldByName('NumZakaz').AsInteger;

       if CancelResF.PrefixID='' then CancelResF.PrefixID:=DM.qrRes.FieldByName('NumZakaz').AsString;

       CancelResF.Phone:=DM.qrRes.FieldByName('Phone').AsString;
       Application.ProcessMessages;
       CancelResF.ShowModal;

       if CancelResF.Flag<>1 then Exit;

      finally
       CancelResF.Free;
      end;
     except
      on E:Exception do
       begin
        MessBox('Ошибка изменения количества: '+E.Message);
        Exit;
       end;
     end;

    B:=False;
    Res:=0;
    AC:=0;
    Art_Code:=DM.qrChek.FieldByName('Art_Code').AsInteger;
    if Art_Code<=0 then begin MessBox('Нулевой "Код"!'); Exit; end;
    if High(FArtCodeList)>Art_code then
     if FArtCodeList[Art_Code].ArtAdd=1 then begin MessBox('Этот препарат в чеке редактировать нельзя!'); Exit; end;


    Kol:=GetKolFromDialog(DM.qrChek.FieldByName('Names').AsString,DM.qrChek.FieldByName('Kol').AsInteger,AC,id_zam,EN_SIMPLE);

    if (Kol=0) and (FIsNumCardSMS=False) then
     if Not CheckCardPokup then Exit;

    if Kol<0 then Exit;

    DM.QrEx.Close;
    DM.QrEx.SQL.Text:='exec spY_CheckKolPresent '+IntToStr(Art_code)+','+IntToStr(Kol)+','+IntToStr(Prm.UserID)+',1';
    DM.QrEx.Open;
    if DM.QrEx.FieldByName('Res').AsInteger<>1 then
     begin
      Case DM.QrEx.FieldByName('Res').AsInteger of
        0:begin
           MessBox('В чеке уже есть достаточное количество подарочных позиций!');
           Exit;
          end; 
       -1:MessBox('Из чека будут удалены подарочные позиций, так как вы редактируете неакционные позиции!');
      end;
     end;


    if (art_code=80237) or (art_code=38526) or (art_code=81858) then B:=True;

    {
     if (Kol=0) and ((art_code=80237) or (art_code=38526) or (art_code=81858)) then
      if MessBox('ОБЯЗАТЕЛЬНО уточните у покупателя нужен ли ему пакет!!!!!!!'#10#10'Контроль покупки пакетов ведет тайный покупатель, если вы не предложите ему пакет - штраф 100 грн.',52)=ID_YES then Exit;
    }

    try
     DM.spY_DelKol.Parameters.ParamValues['@part_code']:=Art_Code;
     DM.spY_DelKol.Parameters.ParamValues['@pkol']:=Kol;
     DM.spY_DelKol.Parameters.ParamValues['@piduser']:=Prm.UserID;
     DM.spY_DelKol.Parameters.ParamValues['@id_kassa']:=Opt.KassaID;
     if TypeChek=TC_SROK then DM.spY_DelKol.Parameters.ParamValues['@IsSrok']:=NReestrSrok
                         else DM.spY_DelKol.Parameters.ParamValues['@IsSrok']:=0;

     if FTypeChek=TC_BACK then DM.spY_DelKol.Parameters.ParamValues['@simp']:=1
                          else DM.spY_DelKol.Parameters.ParamValues['@simp']:=0;

     if FIDRES<>-1 then DM.spY_DelKol.Parameters.ParamValues['@idres']:=FIDRES
                   else DM.spY_DelKol.Parameters.ParamValues['@idres']:=Variants.Null;
//                   else DM.spY_DelKol.Parameters.ParamValues['@idres']:=null;

     DM.ADOCo.BeginTrans;
     try
      DM.spY_DelKol.ExecProc;
      Res:=DM.spY_DelKol.Parameters.ParamValues['@RETURN_VALUE'];

      if Res=19 then
       raise EAbort.Create('Отмените чек полностью и наберите заново!') else

      if Res=21 then
       raise EAbort.Create('Введеное количество превышает остаток склада'+#10+'Или товар забрал другой оператор!') else

      if Res=25 then
       raise EAbort.Create('В чеке недостаточное количество "Сертификатов" для ввода данного препарата!');

      if DM.spY_DelKol.Parameters.ParamValues['@RETURN_VALUE']=321 then
          raise EAbort.Create('В реестре сроковых препаратов №'+IntToStr(NReestrSrok)+' недостаточное количество выбранного перпарата, либо он не является сроковым!');

      if Not CheckKolUpak(Res,erStr) then raise EAbort.Create(erStr);
      DM.ADOCo.CommitTrans;
//    AddToOstat(Art_code);
     except
//      on E:EAbort do
      on E:Exception do
       begin
        DM.ADOCo.RollbackTrans;
        MessBox(E.Message);
       end; //else DM.ADOCo.RollbackTrans;
     end;
    finally
     if Not B then FilterSklad;
     if Res=22 then ClearChekFull(CC_CANCEL) else
      begin
       RefreshChek;
       dbgChek.SetFocus;
      end;
    end;
   end;
 end; {PrevDelKol}

// Нажатие кнопки "Открыть чек"
procedure TMainF.btnOChekClick(Sender:TObject);
 begin
  if Prm.IsKurier then N3Click(N3) else
   begin
    TypeChek:=TC_MAIN;
    OpenChek;
   end;
 end; {btnOChekClick}

// Нажатие кнопки "Отменить чек"
procedure TMainF.btnCChekClick(Sender:TObject); begin CancelChek(1); end; {btnCChekClick}

// Вызов диалога ввода количества двойным щелчком мыши
procedure TMainF.dbgSkladDblClick(Sender:TObject);
 begin
  PrevEnterKol(EK_DIALOG,0,dbgSklad.DataSource.DataSet.FieldByName('art_code').AsInteger);
 end; {dbgSkladDblClick}

// Выгрузка заархивированной базы
procedure TMainF.UnLoadArhBase;
var VCLZip1:TVCLZip;
 begin
  try
   DM.QrTh.Close;
   DM.QrTh.SQL.Text:='update spr_const set Value=''0'' where descr=''ArhBase''';
   DM.QrTh.ExecSQL;
   if UnLoadBase(DM.QrTh,Opt.LoadNaklPath,False) then
    try
     VCLZip1:=TVCLZip.Create(nil);
     try
      VCLZip1.DestDir:=Opt.LoadNaklPath;
      VCLZip1.RootDir:=Opt.LoadNaklPath;
      VCLZip1.FilesList.Clear;
      VCLZip1.FilesList.Add(Opt.LoadNaklPath+BaseFileName);
      VCLZip1.ZipName:=ChangeFileExt(Opt.LoadNaklPath+BaseFileName,'.zip');
      VCLZip1.Zip;
      DeleteFile(Opt.LoadNaklPath+BaseFileName);
     finally
      VCLZip1.Free;
     end;
    except
    end;
  except
  end;
 end; {UnLoadArBase}

// Проверка не пора ли снимать Z-отчет
procedure TMainF.CheckTimeZRep;
var T:TDateTime;
 begin
  if TimeToStr(Time)<'23:45:00' then Exit;
  try
   if EKKA.UseEKKA=False then Exit;
   if Not EKKA.fpGetStatus then Abort;
   T:=StrToTime(JTimeToStr(EKKA.RD_Item[4]));
  except
   T:=Time;
  end;
  try
   if (T=StrToTime(Prm.TimeZRep+':00')) and (FIsFirstShowMess=True) then
    begin
     FIsFirstShowMess:=False;
     Mess1F:=TMess1F.Create(Self);
     try
      Mess1F.Label1.Font.Color:=clRed;
      Mess1F.Label1.Caption:='Пора снимать Z-отчет!';
      PlayWavFile(WorkPath+'\Wav\tada.wav');
      Application.ProcessMessages;
      Mess1F.ShowModal;
     finally
      Mess1F.Free;
     end;
    end;
  except
  end;
 end; {CheckTimeZRep;}

procedure TMainF.tmrFlushPasswTimer(Sender:TObject);
var T:TDateTime;
    ss,Res,Er:String;

 begin
  tmrFlushPassw.Enabled:=False;
  try

   if Design then Exit;
   ShowTimerZ; //Автоматическое снятие Z-отчета

   if Design then Exit;
   // Обновление даты
   lbDate.Date:=Date;

   T:=Time;
   if  ((T>StrToTime(Prm.ReklamaOff)) and (T<StrToTime(Prm.ReklamaOff)+StrToTime('00:00:08'))) then
    begin
     MessBox('Не ЗАБУДЬТЕ выключить рекламу!');
    end else
   if  ((T>StrToTime(Prm.ReklamaOn)) and (T<StrToTime(Prm.ReklamaOn)+StrToTime('00:00:08'))) then
    begin
     MessBox('Включите рекламу!'+#10#10+
             'Сфотографируйте включенную рекламу и внешний вид аптеки'+#10+
             'Отправте фото по программе Telegram 093-043-63-29.'+#10+
             'При отправке фото укажите внутреннее название аптеки.',
             48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
//     ShowReklamaMess;
    end;

//   CheckTimeZRep; // Проверка не пора ли снимать Z-отчет

  finally
   tmrFlushPassw.Enabled:=True;
  end;

  // Инициировать выгрузку
{  tmrFlushPassw.Enabled:=False;
  try
   T:=Time;
   if (T>StrToTime('16:30:00')) and (T<StrToTime('16:30:08')) and (IsServer=True) then
   InitiateUnLoading(DM.TimerQr);
  finally
   tmrFlushPassw.Enabled:=True;
  end;
 }

 end; {tmrFlushPasswTimer}

// Close формы
procedure TMainF.FormClose(Sender:TObject; var Action:TCloseAction);
var v:Byte;
    Res,ss:String;
 begin
  try
   tmrFlushPassw.Enabled:=False;
   try

   {
    DeleteFile(PrPath+'\PC_EKKA.new');

    if Opt.ShowMCash then v:=1 else v:=0;
    WriteToIni('ShowMCash',IntToStr(v));
   }

    if Opt.PlayRolik then
     if Assigned(PlayRolikF) then
      try
       WriteToIni('VolumeRolik',IntToStr(PlayRolikF.tbVolume.Position));
      except
      end;

    if FChangeUser then // Если происходит смена пользователей
     begin
      StartF.ShowLogon:=False;
      StartF.MaskEdit1.Text:='';
      StartF.PrepareUserList(0,0);
      StartF.Show;
      SetAsMainForm(StartF);
      Action:=caFree;
     end;

//    mpMain.Close;
    {if EKKA.EmulEKKA then} ShowIndic('r');

    // Если сотрудник зашел в программу без смен по графику стараемся при выходе зафиксировать уход
    if Prm.LoginWithOutGrafik then
     try
      DM.QrEx.Close;
      DM.QrEx.SQL.Clear;
      DM.QrEx.SQL.Add('declare @Res smallint, @SError varchar(8000) ');
      DM.QrEx.SQL.Add('exec spY_RegisterEnterExit '+IntToStr(Prm.ID_Gamma)+',0,@Res output, @SError output');
      DM.QrEx.SQL.Add('select @Res as Res');
      DM.QrEx.Open;
      if DM.QrEx.FieldByName('Res').AsInteger=1 then
       MessBox('Внимание! Вам ('+Prm.UserName+') автоматически зафиксирован уход. Повторно сканировать палец для ухода не нужно!',
               48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
     except
     end;

    DM.QrEx.Close;
    DM.QrEx.SQL.Clear;
    DM.QrEx.SQL.Add('delete from Spr_Const where Descr=''VSPriznak'+IntToStr(Opt.KassaID)+'''');
    DM.QrEx.SQL.Add('delete from Spr_Const where Descr=''VSDate'+IntToStr(Opt.KassaID)+'''');
    DM.QrEx.SQL.Add('insert into Spr_Const(Descr,Value) values(''VSPriznak'+IntToStr(Opt.KassaID)+''','''+IntToStr(Prm.VSPriznak)+''')');
    DM.QrEx.SQL.Add('insert into Spr_Const(Descr,Value) values(''VSDate'+IntToStr(Opt.KassaID)+''','''+DateTimeToStr(Prm.VSDate)+''')');
    DM.QrEx.ExecSQL;

   finally
    FChangeUser:=False;
    // Освобождает папку пользователя
    ss:='0';
    if Prm.IsEnterVideoPassw then ss:='1';
    ExecADOSQL(DM.TimerQr,'update SprUser set flag_ok=0 where id='+IntToStr(Prm.UserID));
    ExecADOSQL(DM.QrEx,'insert into UserLog(id_user,id_kassa,dt,flag,type_enter) values('+IntToStr(Prm.UserID)+','+IntToStr(Opt.KassaID)+',getdate(),2,'+ss+')');

   end;
  except
  end;
 end; {FormClose}

// Подсчет суммы с учетом скидки
function TMainF.GetSumChekFull:Real;
 begin
  Result:=FSumChek-FSumSkd+FSumCashToCard;
 end; {GetSumChekFull}

// Показ суммы чека везде
procedure TMainF.SetSumChek(V:Real);
 begin

  FSumChek:=V;

  if FTypeCardNew=1 then
   begin
    lbNalTit.Caption:='Накоплено грн:';
    lbSkidkaTit.Caption:='Накопление грн:';
    lbPercSkd.Caption:='% накопления:';
    dbgChek.Columns[5].Title.Caption:='% накопл.';
    dbgChek.Columns[6].Title.Caption:='Сум. накопл.';

    dbgChek.Columns[5].FieldName:='SkdNew';
    dbgChek.Columns[6].FieldName:='SumSkdNew';

    lbIndNal.Caption:=CurrToStrF(AccumSum,ffFixed,2);
    lbIndSkd.Caption:=CurrToStrF(FAccumSumChek,ffFixed,2);
   end else begin
             lbNalTit.Caption:='Без скидки:';
             lbSkidkaTit.Caption:='Скидка:';
             lbPercSkd.Caption:='% скидки:';
             dbgChek.Columns[5].Title.Caption:='% скидки';
             dbgChek.Columns[6].Title.Caption:='Сум. скидки';
             dbgChek.Columns[5].FieldName:='Skd';
             dbgChek.Columns[6].FieldName:='SumSkd';
             lbIndNal.Caption:=CurrToStrF(V,ffFixed,2);
             lbIndSkd.Caption:=CurrToStrF(FSumSkd,ffFixed,2);
            end;

  ShowIndicator(SumChekFull);
 end; {SetSumChek}

// Вывод суммы на индикатор
procedure TMainF.ShowIndicator(Sum:Currency);
var C:TColor;
 begin

 { if EKKA.EmulEKKA then } ShowIndic(CopyStrR(CurrToStrF(Sum,ffFixed,2),10));

  lbIndAll.Caption:=CurrToStrF(Sum,ffFixed,2);
  if Sum<=CL.MinSum then
   begin
    if Type_Skd=0 then C:=CL_GREEN else C:=CL_RED;
    ImIndicator.Visible:=True;
    ShowSumDigit(ImIndicator,Sum,7,6,C,$00000000);
   end else begin
             if Type_Skd=0 then C:=CL.IndicF else C:=CL.IndicFSkd;
             ImIndicator.Visible:=False;
             pnIndicator.Color:=CL.IndicFon;
             pnIndicator.Font.Color:=C;
             pnIndicator.Caption:=CurrToStrF(Sum,ffFixed,2);
            end;
  edCashChange(edCash);
  if Prm.AptekaID=78 then EKKA.fpCurrToDisp(Sum);
 end; {Indicator}

// Устанавливает значение свойства NumCard
procedure TMainF.SetNumCard(V:Int64);
 begin
  FNumCard:=V;
  lbNCrd.Tag:=0;
  if (V>0) and (Copy(IntToStr(V),1,2)<>CR_ORANG) then
   begin
    lbNCrd.Caption:='считана';
//    lbNCrd.Caption:=IntToStr(V);
    lbNCrd.Tag:=V;
   end else lbNCrd.Caption:='';
 end; {SetNumCard}

// Считывает номер карточки
procedure TMainF.GetNumCardDialog(var NumCard:Int64; var TypeCard:Integer; var TC:Byte; var AccumSum,SpSum:Currency; CheckOnly:Boolean; var IsBirth:Byte);
 begin
  Case TypeChek of
   TC_MAIN,TC_PREP,TC_SERTIF{,TC_STRETCH}:
           try
            CardReadF:=TCardReadF.Create(Self);
            try
//             CardReadF.Parent:=Panel2;
//             CardReadF.ManualDock(Panel2);
//            Windows.SetWindowPos(CardReadF.Handle, HWND_TOP, 0, 0,Panel2.ClientWidth, Panel2.ClientHeight, SWP_HIDEWINDOW);

             CardReadF.CheckOnly:=CheckOnly;
             CardReadF.Label1.Caption:='Проведите карточку через устройство чтения.';
             if sbCard.Tag=1 then CardReadF.Label1.Caption:='Предложите оформить клиенту дисконтную карточку.';
             CardReadF.IsMBCard:=IsCanRegMomBabyCard;

             if StartApp=False then
              begin
               Application.ProcessMessages;
               CardReadF.ShowModal;
               {
               IsClosed:=False;
               Repeat
                Application.HandleMessage;
                if IsClosed then Break;
               Until False;
               }

              end else begin
                        StartApp:=False;
                        CardReadF.NumCard:=StNumCard;
                       end;

             NumCard:=CardReadF.NumCard;
             AccumSum:=CardReadF.AccumSum;
             SpSum:=CardReadF.SSum;
             IsBirth:=CardReadF.IsBirth;
             TC:=CardReadF.TypeCard;
             if (NumCard>0) and (CardReadF.IsMBCard) and (CardReadF.IsReg) then
              try
               DM.spY_EnterKol.Parameters.ParamValues['@part_code']:=66671;
               DM.spY_EnterKol.Parameters.ParamValues['@pold_art']:=66671;
               DM.spY_EnterKol.Parameters.ParamValues['@pkol']:=1;
               DM.spY_EnterKol.Parameters.ParamValues['@piduser']:=Prm.UserID;
               DM.spY_EnterKol.Parameters.ParamValues['@ptm']:=1;
               DM.spY_EnterKol.Parameters.ParamValues['@simp']:=1;
               DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=1;
               DM.spY_EnterKol.Parameters.ParamValues['@idres']:=-1;
               DM.spY_EnterKol.ExecProc;
              except
              end;

             if (NumCard>0) then
              try
               DM.QrEx4.Close;
               DM.QrEx4.SQL.Text:='select IsNull(Sum(Bonus),0) as Sm from Cards (nolock) where NumCard='+IntToStr(NumCard);
               DM.QrEx4.Open;
               lbMBInfo.Caption:=CurrToStrF(DM.QrEx4.FieldByName('Sm').AsFloat,ffFixed,2);
              except
              end;
             IsRegCard:=CardReadF.IsReg;
             TypeCard:=CardReadF.KodEAN;
            finally
             CardReadF.Free;
            end;
           except
            IsRegCard:=False;
            NumCard:=0;
            TypeCard:=0;
            TC:=0;
           end;
   TC_KURER:try

             EnterValueF:=TEnterValueF.Create(Self);
             try
              EnterValueF.TypeValue:=INT_VALUE;
              EnterValueF.lbCaption.Caption:='Введите номер карточки';
              EnterValueF.lbCaption.Font.Style:=[fsBold];
              Application.ProcessMessages;
              EnterValueF.ShowModal;
              if EnterValueF.Flag<>1 then Abort;
              NumCard:=StrToInt(EnterValueF.edValue.Text);
              TypeCard:=1;
              // i  f Now>StrToDateTime('05.09.14 21:00:00') then TC:=1 else TC:=0;
              TC:=1;

              DM.QrE.Close;
              DM.QrE.SQL.Clear;
              DM.QrE.SQL.Add('if (select Count(*) from Cards (nolock) where NumCard='+IntToStr(NumCard)+')<=0');
              DM.QrE.SQL.Add(' begin ');
              DM.QrE.SQL.Add('  insert into Cards(NumCard,Summa,TypeCard) Values('+IntToStr(NumCard)+',0,1)');
              DM.QrE.SQL.Add('  insert into CardsLog(NumCard,Summa,IsUnload,TypeCard) Values('+IntToStr(NumCard)+',0,0,1)');
              DM.QrE.SQL.Add('  select 0 as aSum ');
              DM.QrE.SQL.Add(' end else select Sum(AccumSum) as aSum from Cards where NumCard='+IntToStr(NumCard));
              DM.QrE.Open;
              SpSum:=0;
              AccumSum:=DM.QrE.FieldByName('aSum').AsCurrency;
             finally
              EnterValueF.Free;
             end;
            except
             TypeCard:=0;
             NumCard:=0;
             AccumSum:=0;
             SpSum:=0;
             TC:=0;
            end;
  end;
 end; {GetNumCardDialog}

// Получение значения бонусного процента
function TMainF.GetBonusPerc(NC:Int64):Real;
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select IsNull(Skd,-1) as Skd, Vip from BonusCards (nolock) where NumCard='+IntToStr(NC);
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Abort;
   if (CheckNightSkdTime=False) and (DM.Qr.FieldByName('Vip').AsInteger in [0,2]) then Abort;
   Result:=DM.Qr.FieldByName('Skd').AsFloat;
  except
   Result:=-1;
  end;
 end; {GetBonusPerc}

// Изменение типа скидки и, соответственно, пересчет скидки
procedure TMainF.SetType_Skd(V:Integer);
 begin
  try
   if (ChekOpened=False) or ((DM.qrChek.IsEmpty=False) and (V=SK_CARD)) then V:=SK_NONE;
   FType_Skd:=V;
   sbFix.Enabled:=True;
   stPercSkd.Visible:=False;
   cbFixSkd.Visible:=False;
   lbPerc1.Visible:=False;
   lbPerc2.Visible:=False;
   lbSkdTit.Font.Color:=clBlack;
   lbSkdTit.Caption:='Режим скидок: выключен';
   lbPrSkd.Visible:=False;

   Case V of
    SK_NONE:  begin
               lbMBInfo.Caption:='0';
               FNumGeptralCard:='';
               FNumKsareltoCard:='';
               NumCard:=-1;
               IsRegCard:=False;
               cbFixSkd.ItemIndex:=-1;
               PercentSkd:=0;
               sbSumm.Down:=False;
               sbFix.Down:=False;
               sbFix10.Down:=False;
               sbCard.Down:=False;
               miSumSkd.Checked:=False;
               miFixSkd.Checked:=False;
               miCardSkd.Checked:=False;
               sbMag.Enabled:=True;
              end;
    SK_SUMM:  begin
               NumCard:=-1;
               IsRegCard:=False;
               lbPrSkd.Caption:='Акционная';
               NumCard:=0;
//               sbMag.Enabled:=False;
              end;
    SK_FIX:   begin
//               sbMag.Enabled:=False;
               IsRegCard:=False;
               NumCard:=-1;
               cbFixSkd.Visible:=True;
               lbPerc1.Visible:=True;
               lbSkdTit.Font.Color:=clRed;
               lbSkdTit.Caption:='Режим скидок: включен';
               lbPrSkd.Visible:=True;
               PercentSkd:=0;
               if cbFixSKD.ItemIndex>=0 then
                begin
                 PercentSkd:=StrToFloat(cbFixSkd.Text);
                 NumCard:=0;
                end;
              end;
    SK_FIX10:begin
               IsRegCard:=False;
               NumCard:=-1;
              end;
    SK_CARD:  begin
               sbFix.Enabled:=False;
               PercentSkd:=PercentSkd;
               cbFixSkd.Visible:=False;
              end;
    SK_DRCARD:PercentSkd:=5;
    SK_ORANGE:lbPrSkd.Caption:='';
   end;
  finally
   RefreshChek;
  end;
 end; {SetType_Skd}

// Проверка времени недействия ночных скидок
function TMainF.CheckNightSkdTime:Boolean;
var tm:TDateTime;
 begin
  if ChekEmpty=False then begin Result:=True; Exit; end;
  try
   tm:=Time;
   if StrToTime(Prm.StartTime)>StrToTime(Prm.EndTime) then
    begin
     if (tm>StrToTime(Prm.StartTime)) or (tm<StrToTime(Prm.EndTime)) then Abort;
    end else
     if (tm>StrToTime(Prm.StartTime)) and (tm<StrToTime(Prm.EndTime)) then Abort;
   Result:=True;
  except
   Result:=False;
  end;
 end; {CheckNightSkdTime}

// Чтение текущего процента скидки
function TMainF.GetPercentSkd:Real;
var SumChek,SumCh,SumCard:Real;
    Bonus:Real;
    NC:Int64;
    TC:Integer;
    tcN:Byte;
    sSum,aSum:Currency;
    IsMB:Boolean;
    sOld,fSkd,sSkd,sSkd1:String;

 function GetSkdAdd:Integer;
  begin
   if FTypeCardNew=1 then Result:=1 else Result:=0;
  end;

 Begin
  if FGettingPercentSkd=True then begin Result:=FPercentSkd; Exit; end;
  try
   FGettingPercentSkd:=True;

  if Prm.AptekaID=28 then
   begin
    sSkd:='5'
   end else begin
             sSkd:='10';
            end;

  if FType_Skd=SK_CARD then
   begin
    try
//     if (Prm.AptekaID=63) or (FSumPChek>0) then
      begin
       DM.QrEx4.Close;
       DM.QrEx4.SQL.Text:='select Sum(kol*cena) as Sm from Chek (nolock) where compname=host_name() and id_user='+IntToStr(Prm.UserID);
       DM.QrEx4.Open;
       SumCh:=DM.QrEx4.FieldByName('Sm').AsFloat;
      end;

     if NumCard<=0 then
      begin
       GetNumCardDialog(NC,TC,tcN,aSum,sSum,False,FIsBirth);
       EmptyKeyQueue;
       lbSearch.Caption:='';
       NumCard:=NC;
       TypeCard:=TC;
       TypeCardNew:=tcN;
       AccumSum:=aSum;
       FSafeSumSpis:=sSum;
       IsFozzy:=False;
       IsDop7:=False;
       FIsSkd7:=False;
(*       if (TypeCard=1) then
        begin
         if ((Prm.AptekaID in [28{,166}]) or (Prm.AptekaID=346)) and (MessBox('Есть ли у клиента сертификат на скидку '+sSkd+'%?'+#10#10+
                                                    'Если ли есть, нажмите да.',52)=ID_YES) then
          IsFozzy:=True else
//         if ((Prm.AptekaID=300) { or (Prm.AptekaID=315) } ) and (MessBox('Есть ли у клиента флаер на дополнительную скидку 10% ?',52)=ID_YES) then IsDop7:=True;


        end; *)
      end;

     if NumCard<=0 then
      begin
       if ((Prm.AptekaID in [28{,166,190}]) or (Prm.AptekaID=346) ) and (MessBox('Есть ли у клиента флаер на скидку '+sSkd+'%?'+#10#10+
        'Если ли есть, нажмите да и клиент получит скидку до '+sSkd+'%.',52)=ID_YES) then
          FIsSkd7:=True;
       raise EAbort.Create('Карта не считана');
      end;
     Bonus:=GetBonusPerc(NumCard);

     if (Prm.AptekaSklad=True) and (Prm.Dobraia=False) and (Prm.IsNewDiscOpt=True) then // Дисконтная карта АОЦ
      begin
       if Not IsDay then raise Eabort.Create('Ночью скидки не действуют');
       FPercentSkd:=0;
      end else
     if ((Bonus>0) and (Bonus<=10) and (TypeCardNew=0)) or (Bonus>10) then FPercentSkd:=Bonus else
     if  (Copy(IntToStr(NumCard),1,3)<>CR_911) and (Copy(IntToStr(NumCard),1,4)<>CR_STUD) and (TypeCard<>8) and (TypeCard<>1) then
      begin

       if (Copy(IntToStr(NumCard),1,2)=CR_PL2PERC) and (Prm.IsPL2Perc=True) then FPercentSkd:=2 else

       if (Copy(IntToStr(NumCard),1,2)=CR_KARAV) and (Prm.AptekaID=133) then FPercentSkd:=2 else
       if ((Copy(IntToStr(NumCard),1,2)=CR_KARAV) or (Copy(IntToStr(NumCard),1,Length(CR_DAFI))=CR_DAFI)) and (Prm.AptekaID=28) then FPercentSkd:=7 else
       if (Copy(IntToStr(NumCard),1,2)=CR_ORANG) {and (Prm.AptekaID in [4,5,10])} then
        begin
         FType_skd:=SK_ORANGE;
        end else
       if (Copy(IntToStr(NumCard),1,2)=CR_271) and (Prm.AptekaID in [63]) and (NumCard>10000000) then
        begin
         FPercentSkd:=0;
         if SumCh>0 then FPercentSkd:=6;
        end(* else
       if {(Copy(IntToStr(NumCard),1,3)=CR_NAKLOF) or }((Copy(IntToStr(NumCard),1,3)=CR_BIOSTR)) then
        begin
         FType_skd:=SK_DRCARD;
         FPercentSkd:=10;
        end*);
      end else try
//                if Not (CheckNightSkdTime) then Abort;
                if Not IsDay then raise Eabort.Create('Ночью скидки не действуют');

                DM.Qr.Close;
                DM.Qr.SQL.Clear;
                DM.Qr.SQL.Add('select IsNull((select Sum(Summa) from Cards (nolock) where NumCard='+IntToStr(NumCard)+'),0) as SumCr,  ');
                DM.Qr.SQL.Add('       IsNull((select Old from Cards where NumCard='+IntToStr(NumCard)+'),0) as Old,  ');

//                DM.Qr.SQL.Add('       IsNull((select convert(int,Sum(SumMonth)/case IsNull(Max(Old),0) when 0 then 5000 else 200 end ) from Cards where NumCard='+IntToStr(NumCard)+'),0) as SkdMn,  ');

                DM.Qr.SQL.Add('       IsNull((select convert(int,Sum(SumMonth)/5000 ) from Cards where NumCard='+IntToStr(NumCard)+'),0) as SkdMn,  ');

                DM.Qr.SQL.Add('       case when IsNull((select DateReg from CardUser (nolock) where NumCard='+IntToStr(NumCard)+'),getdate()) <''2014-06-19'' then 0 else 1 end as IsNew,  ');
                DM.Qr.SQL.Add('       IsNull((select Sum(kol*cena) from Chek (nolock)                                                         ');
                DM.Qr.SQL.Add('where compname=host_name() and id_user='+IntToStr(Prm.UserID)+' and art_code not in             ');
                DM.Qr.SQL.Add('(select art_code from skd_limit (nolock) where type_skd=4 and skd<=0)),0) as SumCh                      ');
                DM.Qr.Open;

                if DM.Qr.FieldByName('Old').AsInteger=1 then sOld:='' else sOld:='4*';

                FSkdMonth:=DM.Qr.FieldByName('SkdMn').AsInteger;
                SumCard:=DM.Qr.FieldByName('SumCr').AsCurrency;
                SumChek:=DM.Qr.FieldByName('SumCh').AsCurrency;
                if DM.Qr.FieldByName('IsNew').AsInteger=0 then fSkd:='SkdNew' else fSkd:='Skd';
                DM.Qr.Close;
                if TypeCardNew=1 then DM.Qr.SQL.Text:=' select IsNull(Max('+fSkd+'),0)+dbo.GetSkdPlus() as Sk from Skd (nolock) where type_skd=1 and '+sOld+'Summ<'+CurrToStr(SumCard+SumChek)
                                 else DM.Qr.SQL.Text:=' select IsNull(Max('+fSkd+'),0) as Sk from Skd (nolock) where type_skd=1 and Summ<'+CurrToStr(SumCard+SumChek);
//                DM.Qr.SQL.SaveToFile('C:\log\cardss.txt');
                DM.Qr.Open;
                FPercentSkd:=DM.Qr.FieldByName('Sk').AsFloat;

                if TypeCardNew=1 then
                 begin
                  if Bonus<=0 then FPercentSkd:=FPercentSkd+FSkdMonth
                              else FPercentSkd:=Bonus+FSkdMonth;
                 end;

                if Bonus<=0 then
                 begin

                  if IsFozzy then
                   begin

                    if Prm.AptekaID=28 then FPercentSkd:=8+GetSkdAdd
                                       else FPercentSkd:=13+GetSkdAdd;

                   end;

                  if (SumCh*0.9<=FSumPChek) and (FSumPChek>0) then FPercentSkd:=FPercentSkd+3 else
{
                  if (Prm.AptekaID=5) and (DayOfTheWeek(Date)=7) and (IsMomBabyCard(NumCard)=False) then
                   begin
                    if FPercentSkd>7 then FPercentSkd:=FPercentSkd+5
                                     else FPercentSkd:=FPercentSkd+4;
                   end;
}
                  if ((Copy(IntToStr(NumCard),1,3)=CR_911) or
                     (Copy(IntToStr(NumCard),1,4)=CR_STUD) or
                     (TypeCard=8) or
                     ((NumCard>=479000) and (NumCard<=479999))) and (FPercentSkd<5) then FPercentSkd:=5;

                  DM.Qr.Close;
//                if (IsRegCard) and (SumCh<Prm.SumSkd) and (Copy(IntToStr(NumCard),1,4)<>CR_STUD) and  ((IsCanRegMomBabyCard=False) or (IsMomBabyCard(NumCard)=False)) then FPercentSkd:=0;

//                if SumChek<=0 then FPercentSkd:=0;
                 end;
                if FPercentSkd>25 then FPercentSkd:=25;
//                if CheckBox1.Checked then Abort;

                if FPercentSkd<Prm.MinSkd then FPercentSkd:=Prm.MinSkd;
                FSafePercentSkd:=FPercentSkd;
               except
                on E:Exception do
                 begin
//                  AppendStringToFile('D:\AVA\ErCalcSkd.txt',DateTimeToStr(Now)+' : '+IntToStr(Opt.KassaID)+' : '+E.Message);
                  if (Type_SKD=SK_CARD) and (IsDay=True) then
                   begin
                    FPercentSkd:=FSafePercentSkd;
                   end else begin
                             FPercentSkd:=0;
                             raise Eabort.Create('Ошибка определения процента скидки!');
                            end;
                 end;
               end;

      if Prm.AptekaSklad=False then
       begin
        stPercSkd.Visible:=True;
        lbPerc2.Visible:=True;
       end;

      lbSkdTit.Font.Color:=clRed;
      lbSkdTit.Caption:='Режим скидок: включен';
      if Prm.AptekaSklad=False then lbPrSkd.Visible:=True;
      sbCard.Enabled:=True;
      miCardSkd.Enabled:=True;

     except
      on E:Exception do
       begin
//        AppendStringToFile('D:\AVA\ErCalcSkd1.txt',DateTimeToStr(Now)+' : '+IntToStr(Opt.KassaID)+' : '+E.Message);
        FPercentSkd:=0;
        Type_SKD:=SK_NONE;
        sbCard.Down:=False;
       end;
     end;
     SetPercentSkd(FPercentSkd);
    end;
   Result:=FPercentSkd;
  finally
   FGettingPercentSkd:=False;
  end;
 End; {GetPercentSkd}

{ Изменение процента скидки и все что нужно сделать в связи с этим}
procedure TMainF.SetPercentSkd(V:Real);
 begin
  FPercentSkd:=V;
  if FType_skd=SK_ORANGE then
   begin
//    lbPrSkd.Caption:='Оранж кард';
    lbPrSkd.Caption:='';
    stPercSkd.Caption:='';
   end else begin
             lbPrSkd.Caption:=CurrToStr(FPercentSkd);
             stPercSkd.Caption:=CurrToStr(FPercentSkd);
            end;
 end; {SetPercentSkd}

// Нажатие, отжатие кнопки "Суммарная"
procedure TMainF.sbSummClick(Sender:TObject);
 begin
  if TSpeedButton(Sender).Down then Type_Skd:=SK_SUMM else Type_Skd:=SK_NONE;
 end; {sbSummClick}

// Нажатие, отжатие кнопки "Фиксированная"
procedure TMainF.sbFixClick(Sender:TObject);
 begin
  if TSpeedButton(Sender).Down then Type_Skd:=SK_FIX else Type_Skd:=SK_NONE;
 end; {sbFixClick}

// Нажатие, отжатие кнопки "Гептрал 10"
procedure TMainF.sbFix10Click(Sender: TObject);
(*
var Num:String;
    Res:Integer;
    url:String;
*)
var
  Num: String;
  url: String;
  Res: Integer;
  magVer: integer;
  //Geptral: TAbbottStock;
  //op: TAbbottOperation;
begin

  if TSpeedButton(Sender).Down=True then
   begin
    if ChekOpened=False then
     begin
      TSpeedButton(Sender).Down:=False;
      Exit;
     end;

    if EKKA.EmulEKKA then
    begin
      //MainF.MessBox('По акции "Гептрал" на этой кассе чек отпускать нельзя!');
//------------------------------------------------------------------------------
      if TSpeedButton(Sender).Down=True then
        if Not EnterStrValue(Num,'Отсканируйте карту РАЗОМ(Abbott) или введите все символы с штрихкода!') then
          TSpeedButton(Sender).Down:=False
        else
        begin
          if Length(Num)<8 then
          begin
            MainF.MessBox('Количество символов штрихкода должно быть не меньше восьми!');
            TSpeedButton(Sender).Down:=False;
            Exit;
          end;
          FNumGeptralCard:=Num;

          DM.Qr.Close;
          DM.Qr.SQL.Text:='select Value from Spr_Const where Descr=''SiteGeptral'' ';
          DM.Qr.Open;
          if DM.Qr.IsEmpty then
          begin
            MessBox('Сайт не определен. Обращайтесь в дисконтный отдел!');
            TSpeedButton(Sender).Down:=False;
            Exit;
          end;
          url:=DM.Qr.FieldByName('Value').AsString;
          DM.Qr.Close;
          DM.Qr.SQL.Text:='select Value from Spr_Const where Descr=''PathSite911'' ';
          DM.Qr.Open;
          if DM.Qr.IsEmpty then
          begin
            MessBox('Браузер не найден. Обращайтесь в IT-отдел!');
            TSpeedButton(Sender).Down:=False;
            Exit;
          end;
          Res:=ShellExecute(0,'open',PChar(DM.Qr.FieldByName('Value').AsString),PChar(url),nil,SW_SHOWNORMAL);
          if Res<32 then WinExec(PChar(DM.Qr.FieldByName('Value').AsString+' '+url),SW_SHOW);
          if MainF.MessBox('Вы подтверждаете скидку 30%',52)<>ID_YES then TSpeedButton(Sender).Down:=False;
        end;

      if TSpeedButton(Sender).Down then
        Type_Skd:=SK_FIX10
      else
        Type_Skd:=SK_NONE;
//------------------------------------------------------------------------------
      Exit;
    end
    else
    begin
      if TSpeedButton(Sender).Down then
        Type_Skd:=SK_FIX10
      else
        Type_Skd:=SK_NONE;
    end;

    GetWinVer(magVer);
    if magVer < 6 then
     begin
      MainF.MessBox('По акции "Гептрал" на этой кассе чек отпускать нельзя!');
      Exit;
     end;
   end;

  //проверка параметров подключения к АПИ Гептрал
  if (length(trim(Prm.SiteGeptralAPI)) <= 0)or(length(trim(Prm.TokenGeptral)) <= 0)or(length(trim(Prm.PharmCardGeptral)) <= 0) then
  begin
    MessBox('Сайт не определен. Обращайтесь в дисконтный отдел!');
    TSpeedButton(Sender).Down:=False;
    Exit;
  end;

  if TSpeedButton(Sender).Down=True then
    if Not EnterStrValue(Num,'Отсканируйте карту РАЗОМ(Abbott) или введите все символы с штрихкода!') then
      TSpeedButton(Sender).Down:=False
    else
    begin
      if Length(Num)<8 then
      begin
        MainF.MessBox('Количество символов штрихкода должно быть не меньше восьми!');
        TSpeedButton(Sender).Down:=False;
        Exit;
      end;
      FNumGeptralCard:=Num;
    end;
  GetGeptralChek(sender,byte(asGeptral),byte(aoValidate));

(*
  if TSpeedButton(Sender).Down=True then
   if ChekOpened=False then
    begin
     TSpeedButton(Sender).Down:=False;
     Exit;
    end;

  if TSpeedButton(Sender).Down=True then
   if Not EnterStrValue(Num,'Отсканируйте карту РАЗОМ(Abbott) или введите все символы с штрихкода!') then TSpeedButton(Sender).Down:=False
   else begin
         if Length(Num)<8 then
          begin
           MainF.MessBox('Количество символов штрихкода должно быть не меньше восьми!');
           TSpeedButton(Sender).Down:=False;
           Exit;
          end;
         FNumGeptralCard:=Num;

         DM.Qr.Close;
         DM.Qr.SQL.Text:='select Value from Spr_Const where Descr=''SiteGeptral'' ';
         DM.Qr.Open;
         if DM.Qr.IsEmpty then
          begin
           MessBox('Сайт не определен. Обращайтесь в дисконтный отдел!');
           TSpeedButton(Sender).Down:=False;
           Exit;
          end;

         url:=DM.Qr.FieldByName('Value').AsString;

         DM.Qr.Close;
         DM.Qr.SQL.Text:='select Value from Spr_Const where Descr=''PathSite911'' ';
         DM.Qr.Open;

         if DM.Qr.IsEmpty then
          begin
           MessBox('Браузер не найден. Обращайтесь в IT-отдел!');
           TSpeedButton(Sender).Down:=False;
           Exit;
          end;

         Res:=ShellExecute(0,'open',PChar(DM.Qr.FieldByName('Value').AsString),PChar(url),nil,SW_SHOWNORMAL);
         if Res<32 then
           WinExec(PChar(DM.Qr.FieldByName('Value').AsString+' '+url),SW_SHOW);


         if MainF.MessBox('Вы подтверждаете скидку 30%',52)<>ID_YES then TSpeedButton(Sender).Down:=False;

        end;

  if TSpeedButton(Sender).Down then Type_Skd:=SK_FIX10
                               else Type_Skd:=SK_NONE;
*)
end; {sbFix10Click}

// Нажатие, отжатие кнопки "С карточки"
procedure TMainF.sbCardClick(Sender:TObject);
 begin

  if ((Prm.FirmID=13) and (Prm.AptekaID<>180) and (Prm.AptekaID<>330) and (Prm.AptekaID<>462)) {or (Prm.IsSoc and (FTypeChek=TC_STRETCH) ) } then begin TSpeedButton(Sender).Down:=False; Exit; end;

  if (Prm.AptekaSklad=True) and (Prm.Dobraia=False) and (Prm.IsNewDiscOpt=False) then begin TSpeedButton(Sender).Down:=False; Exit; end;

  if TSpeedButton(Sender).Down then Type_Skd:=SK_CARD else
   begin
    if FIsStart then
     begin
      FType_Skd:=SK_CARD;
      TSpeedButton(Sender).Down:=True;
      sbFix.Enabled:=False;
      cbFixSkd.Visible:=False;
      lbPerc1.Visible:=False;
     end else begin
               if MainF.CheckCardPokup then Type_Skd:=SK_NONE else
                begin
                 FType_Skd:=SK_CARD;
                 TSpeedButton(Sender).Down:=True;
                end;
              end;
   end;
 end; {sbCardClick}

// Выбор процента фиксированной скидки
procedure TMainF.cbFixSkdChange(Sender:TObject);
 begin
  Type_Skd:=Type_Skd;
 end; {cbFixSkdChange}

// Нажатие Enter в чеке
procedure TMainF.dbgChekKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if (Key=VK_SPACE) and (Prm.AptekaID=189) then
   if dbgSklad.Enabled and dbgSklad.Visible then dbgSkladSetFocused;

  if Key in K_ARROW_KEYS then lbCheck.Caption:='';
  if Key=VK_RETURN then PrevDelKol;
 end; {dbgChekKeyDown}

// Двойной клик в Чеке
procedure TMainF.dbgChekDblClick(Sender:TObject);
 begin
  PrevDelKol;
 end; {dbgChekDblClick}

// Отобаржение текста в строке статуса в конкретной ячейке
procedure TMainF.ShowStatus(S:String; N:Integer);
 begin
  try
   stMain.Panels[N].Text:=S;
//   Application.ProcessMessages;
  except
  end;
 end; {ShowSatatus}

// Отобаржение текста в строке статуса в ячейке №3
procedure TMainF.ShowStatus(S:String);
 begin
  ShowStatus(S,3);
 end; {ShowSatatus}

procedure TMainF.PrintBlankForRegCard(FB:TForBack);
var Tb:TTableObj;
    S:String;
 begin

  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Font.Name:='Times New Roman';
  PrintRep.Font.Size  :=5;
  PrintRep.Font.Style:=[fsBold];
  if Prm.FirmID<>9 then
   begin
    S:='"Аптечной сети 9-1-1 ';
    if Prm.FirmID=5 then S:='';
    if NumCard>0 then PrintRep.AddText('Номер дисконтной карты: '+IntToStr(NumCard)+#10#10);

    PrintRep.Font.Style:=[];
    PrintRep.AddTable(1,1);
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('10000');
    Tb.Cell[1,1].Indent:=10;
    Tb.Cell[1,1].LeftMargin:=30;
    Tb.Cell[1,1].Align:=AL_CENTER;
    Tb.Cell[1,1].Font.Style:=[fsBold];
    Tb.Cell[1,1].AddText('Согласие'+#10+'на сбор и обработку персональных данных'+#10#10);

    Tb.Cell[1,1].Align:=AL_JUST;
    Tb.Cell[1,1].Font.Style:=[];
    if FB.FIO='' then
     begin
      Tb.Cell[1,1].AddText('Я, ______________________________________________________________________________ ,'+#10);
      Tb.Cell[1,1].Font.Style:=[fsItalic];
      Tb.Cell[1,1].AddText('                    (Указать Ф.И.О.)'+#10);
     end else Tb.Cell[1,1].AddText('Я, '+FB.FIO+' , ');


    Tb.Cell[1,1].Font.Style:=[];

    if FB.DateR='' then Tb.Cell[1,1].AddText('    родился ___________ / ______________ / ____________, подписывая этот документ, предоставляю согласие    владельцу базы персональных  данных ')
                   else Tb.Cell[1,1].AddText('    родился '+FB.DateR+', подписывая этот документ, предоставляю согласие    владельцу базы персональных  данных ');

    Tb.Cell[1,1].Font.Style:=[fsBold,fsUnderLine];
    Tb.Cell[1,1].AddText(Prm.FullFirmNameRU);

    Tb.Cell[1,1].Font.Style:=[];
    Tb.Cell[1,1].AddText('на сбор, обработку и использование моих  персональных  данных с  целью ');

    Tb.Cell[1,1].Font.Style:=[fsUnderLine];
    Tb.Cell[1,1].AddText('выполнения_требований Закона Украины  " О защите персональных данных", ведения хозяйственной деятельности, предоставления скидок покупателям '+S);
    Tb.Cell[1,1].AddText(Prm.FirmNameRu+' и выполнение других требований действующего законодательства.'+#10);

    Tb.Cell[1,1].Font.Style:=[];
    Tb.Cell[1,1].AddText('С этой целью передаю ');

    Tb.Cell[1,1].Font.Style:=[fsBold];
    Tb.Cell[1,1].AddText(Prm.FullFirmNameRU+' ');

    Tb.Cell[1,1].Font.Style:=[];
    Tb.Cell[1,1].AddText('информацию о моих персональных данных таких как: Ф.И.О., дата рождения, контактный телефон и адрес. Подтверждаю, что с Положением о персональных данных ');
    Tb.Cell[1,1].AddText('владельца базы персональных данных, ознакомлен. Персональные данные также могут быть использованы Владельцем или третьими лицами с целью ');

    Tb.Cell[1,1].Font.Style:=[fsUnderLine];
    Tb.Cell[1,1].AddText('предоставления скидок постоянным клиентам, информированием о проводимых акциях, предоставления информации на запросы физических лиц или компетентных органов, и другие цели, не запрещенные действующим законодательством. ');

    Tb.Cell[1,1].Font.Style:=[];
    Tb.Cell[1,1].AddText(Prm.FirmNameRu+' может передавать в обработку другим юридическим лицам (распорядителям) мои персональные данные в порядке, предусмотренном действующим законодательством.'+#10);

    Tb.Cell[1,1].AddText('Владелец обязуется использовать персональные данные справедливо и законно в соответствии с законодательством о защите персональных данных. В случае изменения цели обработки персональных данных Владелец должен сообщить об ');
    Tb.Cell[1,1].AddText('этом субъекту персональных данных и получить согласие на обработку его данных в соответствии с измененной целью.'+#10#10);

    Tb.Cell[1,1].Font.Style:=[fsBold];
    Tb.Cell[1,1].AddText('          Дата '+DateToStr(FB.Dt)+'                                                                  подпись______________'+#10#10);
//    Tb.Cell[1,1].AddText('          Дата 17.09.14                                                                  подпись______________'+#10#10);

    PrintRep.AddInterv(6);

    PrintRep.AddTable(1,1);
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('10000');
    Tb.Cell[1,1].Indent:=10;
    Tb.Cell[1,1].LeftMargin:=30;
    Tb.Cell[1,1].Align:=AL_CENTER;
    Tb.Cell[1,1].Font.Style:=[fsBold];
    Tb.Cell[1,1].AddText('Сообщение о правах'+#10+'в соответствии с Законом Украины "О защите персональных данных"'+#10#10);

    Tb.Cell[1,1].Align:=AL_JUST;
    Tb.Cell[1,1].Font.Style:=[];

    if FB.FIO='' then
     Tb.Cell[1,1].AddText('Я,__________________________________________________________________ удостоверяю, что получил сообщение о внесении информации обо мне в базу персональных данных с целью выполнения ')
    else
     Tb.Cell[1,1].AddText('Я, '+FB.FIO+' удостоверяю, что получил сообщение о внесении информации обо мне в базу персональных данных с целью выполнения ');

    Tb.Cell[1,1].AddText(Prm.FirmNameRu+' требований Закона Украины "О защите персональных данных", ведения хозяйственной деятельности, участия в программах предоставления скидок покупателям '+S);
    Tb.Cell[1,1].AddText(Prm.FirmNameRu+' и выполнение других требований действующего законодательства. Мне также сообщили о третьих лицах, юридических лицах (распорядителях), органах государственной власти и местного самоуправления, ');
    Tb.Cell[1,1].AddText(' которым могут передаваться мои персональные данные в ходе выполнения '+Prm.FirmNameRu+' требований законодательства.'+#10#10);
    Tb.Cell[1,1].AddText('Предоставляя свои персональные данные, я выражаю свое согласие на обработку персональных данных на условиях, изложенных в этом документе.'#10);
    Tb.Cell[1,1].AddText('С положениями Закона Украины "О защите персональных данных" ознакомлен.'+#10#10);

    Tb.Cell[1,1].Font.Style:=[fsBold];
    Tb.Cell[1,1].AddText('Дата '+DateToStr(FB.Dt)+'                                       Ф.И.О./подпись_________________________'+#10#10#10#10);
//    Tb.Cell[1,1].AddText('Дата 17.09.14                                       Ф.И.О./подпись_________________________'+#10#10#10#10);
   end else
  if Prm.FirmID=9 then
   begin
    S:='"Аптечної мережі 9-1-1 ';
    if NumCard>0 then PrintRep.AddText('Номер дисконтної картки: '+IntToStr(NumCard)+#10#10);

    PrintRep.Font.Style:=[];
    PrintRep.AddTable(1,1);
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('10000');
    Tb.Cell[1,1].Indent:=10;
    Tb.Cell[1,1].LeftMargin:=30;
    Tb.Cell[1,1].Align:=AL_CENTER;
    Tb.Cell[1,1].Font.Style:=[fsBold];
    Tb.Cell[1,1].AddText('Згода'+#10+'на збір і обробку персональних даних'+#10#10);

    Tb.Cell[1,1].Align:=AL_JUST;
    Tb.Cell[1,1].Font.Style:=[];
    if FB.FIO='' then
     begin
      Tb.Cell[1,1].AddText('Я, ______________________________________________________________________________ ,'+#10);
      Tb.Cell[1,1].Font.Style:=[fsItalic];
      Tb.Cell[1,1].AddText('                    (Вказати П.І.Б.)'+#10);
     end else Tb.Cell[1,1].AddText('Я, '+FB.FIO+' , ');


    Tb.Cell[1,1].Font.Style:=[];

    if FB.DateR='' then Tb.Cell[1,1].AddText('    народився ___________ / ______________ / ____________, підписуючи цей документ, надаю згоду    власникові бази персональних  даних ')
                   else Tb.Cell[1,1].AddText('    народився '+FB.DateR+', підписуючи цей документ, надаю згоду    власникові бази персональних  даних ');

    Tb.Cell[1,1].Font.Style:=[fsBold,fsUnderLine];
    Tb.Cell[1,1].AddText(Prm.FirmNameUA);

    Tb.Cell[1,1].Font.Style:=[];
    Tb.Cell[1,1].AddText('на збір, обробку і використання моїх  персональних  даних з метою ');

    Tb.Cell[1,1].Font.Style:=[fsUnderLine];
    Tb.Cell[1,1].AddText('виконання вимог Закону України  " Про захист персональних даних", ведення господарської діяльності, надання знижок покупцям '+S);
    Tb.Cell[1,1].AddText(Prm.FirmNameUA+' і виконання інших вимог чинного законодавства.'+#10);

    Tb.Cell[1,1].Font.Style:=[];
    Tb.Cell[1,1].AddText('З цією метою передаю ');

    Tb.Cell[1,1].Font.Style:=[fsBold];
    Tb.Cell[1,1].AddText(Prm.FirmNameUA+' ');

    Tb.Cell[1,1].Font.Style:=[];
    Tb.Cell[1,1].AddText('інформацію про мої персональні дані таких як: П.І.Б., дата народження, контактний телефон і адреса. Підтверджую, що з Положенням про персональні дані ');
    Tb.Cell[1,1].AddText('власника бази персональних даних, ознайомлений. Персональні дані також можуть бути використані Власником або третіми особами з метою ');

    Tb.Cell[1,1].Font.Style:=[fsUnderLine];
    Tb.Cell[1,1].AddText('надання знижок постійним клієнтам, інформуванням про акції, що проводяться, надання інформації на запити фізичних осіб або компетентних органів, і інші цілі, не заборонені чинним законодавством. ');

    Tb.Cell[1,1].Font.Style:=[];
    Tb.Cell[1,1].AddText(Prm.FirmNameRu+' може передавати в обробку іншим юридичним особам (розпорядникам) мої персональні дані в порядку, передбаченому чинним законодавством.'+#10);

    Tb.Cell[1,1].AddText('Власник зобов''язався використовувати персональні дані справедливо і законно відповідно до законодавства про захист персональних даних. В разі зміни меті обробки персональних даних Власник повинен повідомити ');
    Tb.Cell[1,1].AddText('про це суб''єктові персональних даних і отримати згоду на обробку його даних відповідно до зміненої мети.'+#10#10);

    Tb.Cell[1,1].Font.Style:=[fsBold];
    Tb.Cell[1,1].AddText('          Дата '+DateToStr(FB.Dt)+'                                                                  підпис______________'+#10#10);
//    Tb.Cell[1,1].AddText('          Дата 25.11.13                                                                  подпись______________'+#10#10);

    PrintRep.AddInterv(6);

    PrintRep.AddTable(1,1);
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('10000');
    Tb.Cell[1,1].Indent:=10;
    Tb.Cell[1,1].LeftMargin:=30;
    Tb.Cell[1,1].Align:=AL_CENTER;
    Tb.Cell[1,1].Font.Style:=[fsBold];
    Tb.Cell[1,1].AddText('Повідомлення про права'+#10+'відповідно до Закону України "Про захист персональних даних"'+#10#10);

    Tb.Cell[1,1].Align:=AL_JUST;
    Tb.Cell[1,1].Font.Style:=[];

    if FB.FIO='' then
     Tb.Cell[1,1].AddText('Я,__________________________________________________________________ засвідчую, що отримав повідомлення про внесення інформації про мене в базу персональних даних з метою виконання ')
    else
     Tb.Cell[1,1].AddText('Я, '+FB.FIO+' засвідчую, що отримав повідомлення про внесення інформації про мене в базу персональних даних з метою виконання ');

    Tb.Cell[1,1].AddText(Prm.FirmNameUA+' вимог Закону України "Про захист персональних даних", ведення господарської діяльності, участі в програмах надання знижок покупцям '+S);
    Tb.Cell[1,1].AddText(Prm.FirmNameUA+' і виконання інших вимог чинного законодавства. Мене також повідомили про третіх осіб, юридичних осіб (розпорядниках), органи державної влади і місцевої самоврядності, ');

    Tb.Cell[1,1].AddText(' яким можуть передаватися мої персональні дані в ході виконання '+Prm.FirmNameUA+' вимог законодавства.'+#10#10);
    Tb.Cell[1,1].AddText('Надаючи свої персональні дані, я виражаю свою згоду на обробку персональних даних на умовах, викладених в цьому документі.'#10);
    Tb.Cell[1,1].AddText('З положеннями Закону України "Про захист персональних даних" ознайомлений.'+#10#10);

    Tb.Cell[1,1].Font.Style:=[fsBold];
    Tb.Cell[1,1].AddText('Дата '+DateToStr(FB.Dt)+'                                       П.І.Б./ підпис_________________________'+#10#10#10#10);
//    Tb.Cell[1,1].AddText('Дата 25.11.13                                       П.І.Б./ підпис_________________________'+#10#10#10#10);
   end;
  if Not PrintRep.PreView then Abort;
  PrintRep.Clear;
 end;

{
procedure TMainF.PrintBlankForRegMBCard(CR:TCardInfo);
var Tb:TTableObj;
    q:Integer;
    Bm:TBitMap;
 begin
  PixperI:=650;
  PrintRep.Clear;
  PrintRep.SetDefault;

  PrintRep.Indent:=0;
  PrintRep.AddTable(2,1);
  Tb:=PrintRep.LastTable;
  Tb.SetWidths('12000,8000');
  Tb.SetBorders(1,1,2,1,EMPTY_BORDER);
  Tb.Cell[1,1].Font.Name:='Arial';
  Tb.Cell[1,1].Font.Size:=18;
  Tb.Cell[1,1].Font.Style:=[fsBold];
  Tb.Cell[1,1].Align:=AL_CENTER;
  Tb.Cell[1,1].AddText('АНКЕТА');
  Tb.Cell[1,1].Font.Size:=7;
  Tb.Cell[1,1].AddText(#10'участника программы');

  Bm:=TBitMap.Create;
  Bm.Assign(MainF.imMB.Picture);
  Tb.Cell[2,1].Stretch:=True;
  Tb.Cell[2,1].AddImage(Bm,80);
  Bm.Free;

  PrintRep.Font.Size:=4;
  PrintRep.AddText(#10'Фамилия: '+CR.F+#10);
  PrintRep.AddText('Имя: '+CR.I+#10);
  PrintRep.AddText('Отчество: '+CR.O+#10);
  PrintRep.AddText('Дата рождения покупателя: '+CR.DateR+#10);
  PrintRep.AddText('Адрес: '+CR.Addr+#10);
  PrintRep.AddText('Контактные телефоны: '+CR.Phone+#10#10);
  PrintRep.AddText('Дети'+#10);

  PrintRep.AddTable(2,2);
  Tb:=PrintRep.LastTable;
  Tb.SetWidths('5000,3500');
  Tb.SetBorders(1,1,2,2,Border(clBlack,6,psSolid));
  Tb.Cell[1,1].LeftBorder:=EMPTY_BORDER;
  Tb.Cell[1,2].LeftBorder:=EMPTY_BORDER;

  Tb.Cell[2,1].LeftBorder:=EMPTY_BORDER;
  Tb.Cell[2,2].LeftBorder:=EMPTY_BORDER;

  Tb.Cell[2,1].RightBorder:=EMPTY_BORDER;
  Tb.Cell[2,2].RightBorder:=EMPTY_BORDER;
  q:=1;
  if CR.ChName1<>'' then
   begin
    Tb.Cell[1,1].AddText(IntToStr(q)+'. '+CR.ChName1);  Tb.Cell[2,1].AddText(CR.ChDateR1);
    Inc(q);
   end;
  if CR.ChName2<>'' then
   begin
    if q>1 then
     begin
      Tb.Cell[1,1].AddText(#10);
      Tb.Cell[2,1].AddText(#10);
     end;
    Tb.Cell[1,1].AddText(IntToStr(q)+'. '+CR.ChName2);
    Tb.Cell[2,1].AddText(CR.ChDateR2);
    Inc(q);
   end;
  if CR.ChName3<>'' then
   begin
    if q>1 then
     begin
      Tb.Cell[1,1].AddText(#10);
      Tb.Cell[2,1].AddText(#10);
     end;
    Tb.Cell[1,1].AddText(IntToStr(q)+'. '+CR.ChName3);
    Tb.Cell[2,1].AddText(CR.ChDateR3);
    Inc(q);
   end;

  Tb.MergeCells(1,2,2,2);
  if CR.EMail<>'' then Tb.Cell[1,2].AddText('EMail: '+CR.EMail+#10);

  Tb.Cell[1,2].AddText(#10#10+'Откуда вы узнали о программе ___________________________'#10);
  Tb.Cell[1,2].AddText('Хотели бы Вы получать информацию об акциях и скидках в Аптечной сети 911?  Да ___  Нет ____'#10);
  Tb.Cell[1,2].AddText('Выберите удобный для вас вариант получения информации:'#10);
  Tb.Cell[1,2].AddText('Электронная почта ____	по смс рассылке ____	по почте _____'#10);
  Tb.Cell[1,2].AddText('Карта номер: '+IntToStr(CR.NumCard)+#10);
  Tb.Cell[1,2].AddText('Подпись __________________                                             Дата Выдачи: '+DateToStr(Date)+'                                                        ');

  Tb.Cell[1,2].Font.Size:=3;
  Tb.Cell[1,2].AddText(IntToStr(Prm.AptekaID));
  Tb.Cell[1,2].Font.Size:=4;


  PrintRep.Align:=AL_CENTER;
  PrintRep.Font.Style:=[fsBold];
  PrintRep.AddText(#10'Согласие'#10'на сбор и обработку персональных данных'#10#10);

  PrintRep.Align:=AL_JUST;
  PrintRep.Font.Style:=[];
  PrintRep.Indent:=10;
  PrintRep.AddText('Я, '+CR.F+' '+CR.I+' '+CR.O+', родился '+CR.DateR+', подписывая этот документ, предоставляю согласие владельцу базы персональных данных '+Prm.FirmNameRU);
  PrintRep.AddText(' на сбор, обработку и использование моих  персональных  данных с  целью ');
  PrintRep.Font.Style:=[fsUnderLine];
  PrintRep.AddText(' выполнения_требований Закона Украины  " О защите персональных данных", ведения хозяйственной деятельности, предоставления скидок покупателям "Аптечной сети 9-1-1 '+Prm.FirmNameRU+' и выполнение других требований действующего законодательства.'#10);

  PrintRep.Font.Style:=[];
  PrintRep.AddText('С этой целью передаю '+Prm.FirmNameRU+' информацию о моих персональных данных таких как: Ф.И.О., дата рождения, контактный телефон и адрес. Подтверждаю, что с Положением о персональных данных владельца базы персональных данных, ознакомлен. ');
  PrintRep.AddText('Персональные данные также могут быть использованы Владельцем или третьими лицами с целью ');
  PrintRep.Font.Style:=[fsUnderLine];
  PrintRep.AddText('предоставления скидок постоянным клиентам, информированием о проводимых акциях, предоставления информации на запросы физических лиц или компетентных органов, и другие цели, не запрещенные действующим законодательством. ');

  PrintRep.Font.Style:=[];
  PrintRep.AddText(Prm.FirmNameRU+' может передавать в обработку другим юридическим лицам (распорядителям) мои персональные данные в порядке, предусмотренном действующим законодательством. '#10);

  PrintRep.AddText('Владелец обязуется использовать персональные данные справедливо и законно в соответствии с законодательством о защите персональных данных. В случае изменения цели обработки персональных данных'+' Владелец должен сообщить об этом субъекту персональных данных и получить согласие на обработку его данных в соответствии с измененной целью.'#10#10);
  PrintRep.Font.Style:=[fsBold];
  PrintRep.AddText('Дата '+DateToStr(Date)+'                                                                             Подпись______________'#10#10);

  PrintRep.Align:=AL_CENTER;
  PrintRep.AddText('Сообщение о правах'#10'в соответствии с Законом Украины "О защите персональных данных"'#10);
  PrintRep.Align:=AL_JUST;
  PrintRep.Font.Style:=[];

  PrintRep.AddText('Я, '+CR.F+' '+CR.I+' '+CR.O+' удостоверяю, что получил сообщение о внесении информации обо мне в базу персональных данных с целью выполнения '+Prm.FirmNameRU);
  PrintRep.AddText(' требований Закона Украины "О защите персональных данных", ведения хозяйственной деятельности, участия в программах предоставления скидок покупателям "Аптечной сети 9-1-1" '+Prm.FirmNameRU);
  PrintRep.AddText(' и выполнение других требований действующего законодательства. Мне также сообщили о третьих лицах, юридических лицах (распорядителях), органах государственной власти и местного самоуправления,'+' которым могут передаваться мои персональные данные в ходе выполнения '+Prm.FirmNameRU);
  PrintRep.AddText(' требований законодательства.'#10);
  PrintRep.AddText('Предоставляя свои персональные данные, я выражаю свое согласие на обработку персональных данных на условиях, изложенных в этом документе.'#10);
  PrintRep.AddText('С положениями Закона Украины "О защите персональных данных" ознакомлен.'#10);
  PrintRep.Font.Style:=[fsBold];
  PrintRep.AddText('Дата '+DateToStr(Date)+'            '+CR.F+' '+CR.I+' '+CR.O+'               Подпись______________'#10);



  if Not PrintRep.PreView then Abort;
  PrintRep.Clear;
 end;

}
 // Ввод реквизитов банковской карточки
function TMainF.CheckBankCard(var Cp:TChekPos):Boolean;
var V:Boolean;
 begin
  try
   V:=tmWaitComm.Enabled;
   tmWaitComm.Enabled:=False;
   Result:=True;
   if (CP.TypeOplat<>TO_CHEK) then Exit;
   if Prm.TerminalNew then
    try
     BankCardF:=TBankCardF.Create(Self);
     try
      BankCardF.Cp:=Cp;
      BankCardF.Label4.Caption:='Сумма '+CurrToStrF(CP.SumOplata,ffFixed,2)+' грн.';
      BankCardF.BitBtn3.Enabled:=FIsTerminal=False;
      Application.ProcessMessages;
      BankCardF.ShowModal;

      if BankCardF.Flag<>1 then Abort;

      CP.BCard:=''; //BankCardF.edCard.Text;
      CP.BFIO:='';  //BankCardF.edFIO.Text;

      CP.SumOplata:=BankCardF.Cp.SumOplata;
      CP.IsTerminal:=BankCardF.Cp.IsTerminal;
      CP.InvoiceNum:=BankCardF.Cp.InvoiceNum;
      CP.Merchant:=BankCardF.Cp.Merchant;

     finally
      BankCardF.Free;
     end;
    except
     Result:=False;
//     MessBox('Реквизиты банковской карточки не введены! Пробитие чека невозможно!');
    end else
    try
     BankCard_old_F:=TBankCard_old_F.Create(Self);
     try
      BankCard_old_F.Cp:=Cp;
      BankCard_old_F.Label4.Caption:='Сумма '+CurrToStrF(CP.SumOplata,ffFixed,2)+' грн.';
      BankCard_old_F.BitBtn3.Enabled:=FIsTerminal=False;
      Application.ProcessMessages;
      BankCard_old_F.ShowModal;

      if BankCard_old_F.Flag<>1 then Abort;

      CP.BCard:=''; //BankCard_old_F.edCard.Text;
      CP.BFIO:=''; //BankCard_old_F.edFIO.Text;
      CP.SumOplata:=BankCard_old_F.Cp.SumOplata;
      CP.IsTerminal:=BankCard_old_F.Cp.IsTerminal;
      CP.InvoiceNum:=BankCard_old_F.Cp.InvoiceNum;
      CP.Merchant:=BankCard_old_F.Cp.Merchant;

     finally
      BankCard_old_F.Free;
     end;
    except
     Result:=False;
     MessBox('Реквизиты банковской карточки не введены! Пробитие чека невозможно!');
    end

  finally
   tmWaitComm.Enabled:=V;
  end;
 end; {CheckBankCard}

// Оплата чека
function TMainF.PayChek(TypeOplat:Integer; P:Byte=0; Param2:Byte=0):Boolean;
var CP:TChekPos;
    SumCard:Currency;
    CheckOnly,cb_EKKA:Boolean;
    iii:Integer;
    ResFisc,Tran:Boolean;
    vidSumChek:Currency;
    ss:String;
    Tb:TTableObj;

 procedure SetCashSumm;
  begin
   if TypeOplat=TO_CASH then
    try
     CP.TakedSum:=StrToCurr(edCash.Text);
     if CP.TakedSum<SumChekFull then CP.TakedSum:=SumChekFull;
    except
     CP.TakedSum:=0;
    end;

  end; {SetCashSumm}

 // Запоминаем значения, на редкий случай если глобальные переменные изменятся в ходе процесса оплаты чека

 procedure Init;
 var i:Integer;
  begin

   CP.Iter:=1;
   SumCard:=0;
   CP.IdRes:=FIDRes;

   CP.B1:=False;

   CP.CardPref:=0;

   CP.AccumSum:=0;
   CP.SumChek:=0;
   CP.SumSpis:=0;
   CP.SumCashToCard:=0;
   CP.SkdMonth:=FSkdMonth;
   CP.IsTerminal:=FIsTerminal;
   CP.NumGeptralCard:=FNumGeptralCard;
   CP.NumKsareltoCard:=FNumKSareltoCard;
   CP.NumCardDnepr:=NumCardDnepr;
   CP.SumDnepr:=SumDnepr;

   CP.MedName:=MedName;
   CP.Pacient:=Pacient;
   CP.NRecipt:=FNRecipt;
   CP.FIODOctor1:=FFIODOctor1;

   CP.FIODoctor:=FIODOctor;
   CP.TypeRecipt:=TypeRecipt;

   CP.SumKurDost:=0;

   if TypeCard=1 then
    begin
     CP.SkdNew:=FPercentSkd;
     CP.Skd:=0;
    end else begin
              CP.SkdNew:=0;
              CP.Skd:=FPercentSkd;
             end;

   if lbNumCard50.Visible then
    try
     cbEKKA.Checked:=False;
     EKKA.fpCurrToDisp(SumChekFull);
    finally
     cbEKKA.Checked:=True;
    end else EKKA.fpCurrToDisp(SumChekFull);


   cb_EKKA:=cbEKKA.Checked;

   CP.TypeOplat:=TypeOplat;
   CP.TypeOplatBs:=CP.TypeOplat;
   CP.IsPayMaster:=False;
   CP.IsIAptekaCredit:=False;
   if CP.IDRES<>-1 then
    begin
     CP.IsPayMaster:=FIsPayMaster;
     CP.IsIAptekaCredit:=FIsIAptekaCredit;
    end;
   CP.DopTypeOplat:=P;
   CP.TypeOplata240:=Param2;

   if Fid_strah>0 then
    begin
     CP.id_strah:=Fid_strah;
     CP.name_strah:=Fname_strah;
     if FIDRes<>-1 then CP.Fransh:=FFransh
                   else CP.Fransh:=FSumFransh;
     CP.IsStrah:=True;
    end else begin
              CP.id_strah:=0;
              CP.name_strah:='';
              CP.Fransh:=0;
              CP.IsStrah:=False;
             end;

   if CP.IsPayMaster=True then CP.TypeOplatBS:=DO_BEZGOT1;

   if P=DO_BEZGOT1 then
    begin
     CP.TypeOplatBS:=DO_BEZGOT1;
     CP.TypeOplatKur:=DO_BEZGOT1
    end else

   if P=DO_NEWPOST then CP.TypeOplatKur:=DO_NEWPOST else
   if Param2=DO_KURIER then CP.TypeOplatKur:=TO_CHEK else

   if CP.TypeOplat=TO_CHEK then CP.TypeOplatKur:=DO_BEZGOT3
                           else CP.TypeOplatKur:=TO_CASH;

   if (IsCHP) and (TypeOplat<>TO_BACK) then begin if TypeOplat=TO_CASH then CP.TypeOplat:=TO_CHP else CP.TypeOplat:=TO_CHPBEZNAL; end
                                       else TypeOplat:=CP.TypeOplat;
   CP.PrPayRecipt:=0;
   if (IsKiosk) and (CP.TypeOplat=TO_CASH ) then
    begin

     DM.QrEx2.Close;
     DM.QrEx2.SQL.Clear;
     DM.QrEx2.SQL.Add('declare @Cnt int, @cntr int');
     DM.QrEx2.SQL.Add('set @cnt =IsNull((select Count(*) from Chek (nolock) where compname=host_name() and id_user='+IntToStr(Prm.UserID)+'),0)');
     DM.QrEx2.SQL.Add('set @cntr=IsNull((select Count(*) from Chek (nolock) where art_code not in (select IsNull(art_code,0) from SprNoRecipt (nolock)) and compname=host_name() and id_user='+IntToStr(Prm.UserID)+'),0)');
     DM.QrEx2.SQL.Add('if (@cnt=@cntr) select 2 as Res if @cntr=0 select 0 as Res else select 1 as Res');
     DM.QrEx2.Open;

     if DM.QrEx2.FieldByName('Res').AsInteger=2 then CP.PrPayRecipt:=20 else
     if DM.QrEx2.FieldByName('Res').AsInteger=1 then CP.PrPayRecipt:=10
                                                else CP.PrPayRecipt:=0;
    end;

   FSumCashToCard:=0;
   CP.TypeEKKA:=EKKA.TypeEKKA;
   CP.TypeChek:=TypeChek;
   CP.Type_Skd:=Type_Skd;
   CP.TypeCardNew:=TypeCardNew;
   CP.IsReg:=IsRegCard;
   CP.AccumSum:=0;

   //if CP.IsReg and (SumChek<Prm.SumSkd) then CP.NumCard:=-1 else

   CP.NumCard:=NumCard;

   CP.ID_Kassa:=Opt.KassaID;
   CP.PSkd:=PercentSKD;
   CP.Date:=Date;
   CP.MaxSpisSum:=FMaxSpisSum;
   CP.Priznak:=0;
   CP.BCard:='';
   CP.BFIO:='';
   CP.ID_User:=Prm.UserID;
   CP.ID_Kassa:=Opt.KassaID;
   CP.SumSpis:=0;

   CP.Vzh:=MainF.VzhNum;
   CP.VzhSafe:=CP.Vzh;

   CP.TakedSum:=SumChekFull;
   if CP.TypeChek=TC_RECIPT_PL then CP.SumChek:=SumChek
                               else CP.SumChek:=SumChek99;

   CP.SumChekRecipt:=SumChekRecipt;

   CP.NPrepChek:=FNPChek;
   CP.SPrepChek:=FSumPChek;
   CP.SumSertif:=FSumSertif;
   CP.BSkd:=0;
   CP.NumCardRecipt:=NumCardRecipt;
   CP.NumCardStretch:=NumCardStretch;
   CP.NumCardProf:=NumCardProf;
   CP.NumMediCard:=NumMediCard;
//   CP.NumMediCard:=StrToInt64('272'+Copy(IntToStr(NumMediCard),4,10));

   CP.NumMDMUCard:=NumMDMUCard;
   CP.IDMess:=0;
   CP.IsIApteka:=DM.qrChek.FieldByName('IsIApteka').AsInteger=1;

   for i:=0 to 11 do CP.Sums[i]:=0;
   CP.VzhS:=EKKA.VzhNumS;
   CP.NumZ:=-1;
   CP.Fn:=EKKA.Fn;
   CP.IsPrint:=BoolToInt(Opt.EKKAAsPrinter or Opt.EmulEKKA);
   SetCashSumm;

   {

   DM.QrEx2.Close;
   DM.QrEx2.SQL.Text:='select case IsNull(Old,0) when 1 then 200 else 500 end as SumA from Cards where NumCard='+IntToStr(CP.NumCard);
   DM.QrEx2.Open;
   if DM.QrEx2.IsEmpty then CP.SumAddPerc:=500
                       else CP.SumAddPerc:=DM.QrEx2.FieldByName('SumA').AsInteger;
   }

   CP.SumDopl:=0;
   if TypeChek in TC_DL then CP.SumDopl:=FSumDopl;

   CP.SumAddPerc:=FSkdMonth;
  end; {Init}

 // Проверка Чека ограничений на скидку
 function ChekSkdConstraints:Boolean;
  begin
   Result:=True;
   if (CP.Type_Skd in [SK_NONE,SK_SUMM,SK_ORANGE]) or ((CP.TypeOplat=TO_CHEK) and (CP.Type_Skd=SK_FIX) and (CP.PSkd=5)) then Exit;
   try
    DM.spY_CheckSKD.Parameters.ParamValues['@pt_skd']:=CP.Type_Skd;
    DM.spY_CheckSKD.Parameters.ParamValues['@pskd']:=CP.PSkd;
    DM.spY_CheckSKD.Parameters.ParamValues['@piduser']:=Prm.UserID;
    DM.spY_CheckSKD.ExecProc;
    if DM.spY_CheckSKD.Parameters.ParamValues['@RETURN_VALUE']<>1 then Abort;
   except
    Result:=False;
    MessBox('В чеке есть препараты, которые нельзя пробивать по выбранной скидке!'+#10+'В чеке они подсвечены желтым цветом!');
    RefreshChek;
   end;
  end; {ChekSkdConstraints}

 // Проверка на наличие новой версии программы
 function CheckNewVersion:Boolean;
 var F1,F,FNew:String;
  begin
   try
    FNew:=PrPath+'\PC_EKKA_NEW.exe';
    F1:=PrPath+'\PC_EKKA1.exe';
    F:=Application.ExeName;
    if Not CheckCRCFile(FNew) then Abort;
    //if GetFileDateTime(FNew)<=FApplDateTime then Abort;
    DeleteFile(F1);
    if FileExists(F1) then Abort;
    RenameFile(F,F1);
    if FileExists(F) then Abort;
    RenameFile(FNew,F);
    if Not FileExists(F) then
     begin
      RenameFile(F1,F);
      Abort;
     end;
    DeleteFile(PrPath+'\PC_EKKA_NEW.crc');
    Result:=True;
    MessBox('Появилась более новая версия программы, поэтому текущая программа будет закрыта, после чего откройте программу заново!');
    Close;
   except
    Result:=False;
   end;
  end; {CheckNewVersion}

 procedure CheckReciptInChek;
  begin
   if AnsiUpperCase(Prm.aCity)<>'ХАРЬКОВ' then Exit;
   try
    if DM.qrReciptList.IsEmpty then Exit;
    ShowReciptListF:=TShowReciptListF.Create(Self);
    try
     ShowReciptListF.ShowModal;
    finally
     DM.qrReciptList.Close;
    end;
   except
   end;
  end;

 // Завершающие действия по закрытию чека
 procedure EndChek;
 var i,j:Integer;
     Res,S1,S:String;
     tCl:TClearDisp;

  begin
   WaitMessTimer;

   EKKA.fpOpenCashBox;
   if Prm.FirmID<>5 then
    try

     S1:='';
     if (StrToCurr(lbSumCash.Caption)>0) and (CP.Type_Skd=SK_CARD) then //PlayFraz(8,StrToCurr(lbSumCash.Caption))
       S1:=S1+'- "Пожалуйста Ваш чек,'#10' Ваша сдача '+CurrToStrF(StrToCurr(lbSumCash.Caption),ffFixed,2)+' грн. и дисконтная карта.'
      else

     if StrToCurr(lbSumCash.Caption)>0 then //PlayFraz(9,StrToCurr(lbSumCash.Caption))
                                        S1:=S1+'- "Пожалуйста, Ваш чек и'#10' Ваша сдача '+CurrToStrF(StrToCurr(lbSumCash.Caption),ffFixed,2)+' грн.'
                                       else
     if CP.Type_Skd=SK_CARD then {PlayFraz(10)} S1:=S1+'- "Пожалуйста, Ваш чек и дисконтная карта.' else
                                 {PlayFraz(11)} S1:=S1+'- "Пожалуйста, Ваш чек.';
//     PlayFraz(12);
     S1:=S1+#10#10'Будьте здоровы!"';
     MainF.MessBox(S1,48,GetFont('Times New Roman',22,$00006600,[fsBold]),0,Res,False,'Озвучьте фразу:');
    except
    end;

   {
   if FEp.id_prior=4 then
    begin
     FEp.Ra.Status:=3;
     RegArtZamena(FEp);
    end;
   }

   FTypeCardNew:=0;
   FIsTerminal:=False;
   FIsPayMaster:=False;
   FIsIAptekaCredit:=False;
   sbBSkd.Down:=False;
   sbGoldG.Down:=False;
   sbRecipt.Down:=False;
   SetSkdMag(nil,False);
   sbiApt.Down:=False;
   Fid_doctorA:=0;
   Fcard_doctorA:='';
   Fid_strah:=0;
   FlIsStrah:=0;
   FIsKurDostMakeOut:=False;
   FIDRes_Kur:=0;
   ForderID:=0;
   CheckReciptInChek;
   FIsNumCardSMS:=False;
   FIsBirth:=0;

{
   if TypeCard=1 then PlayWav(WV_SKD,Round(CP.SkdNew))
                 else PlayWav(WV_SKD,Round(CP.PSkd));
}
   SetVisWhenChekOpened(False);
   FSumCashToCard:=0;
   FSafeSumCashToCard:=0;
   FSafeSumSpis:=0;
   ShowStatus('Чек закрыт.');
//   if Prm.AptekaID=43 then

//   tCl:=TClearDisp.Create(False);

   EKKA.fpStrToDisp('');
   Write7hourStat;
   StartCamera(CM_STOP);
   TypeChek:=TC_MAIN;
   ForReserve:=False;
   NumCardRecipt:=-1;
//   if CheckNewVersion then Exit;
//   ExecCommand('CLOSE');
   tmrUpdateVersion.Enabled:=True;
   cbBoxZero.Checked:=False;
   if NewVersion then
    begin
     MessBox('Произошло обновление программных модулей программа будет закрыта! Если программа не закрывается сама - закройте ее сами! После закрытия откройте ее заново!');
     Close;
    end;

  end; {EndChek}

 // Выдача дополнительного сообщения при нажатии кнопки ЧЕК
 function CheckTerminal:Boolean;
  begin
   Result:=True;
   if (CP.TypeOplat<>TO_CHEK) or (CP.IsPayMaster=True) or (CP.TypeOplatKur=DO_BEZGOT1) then Exit;
   Result:=False;
   try
    ShowTerminalAlertF:=TShowTerminalAlertF.Create(Self);
    try
     if ShowTerminalAlertF.ShowModal=mrOK then Result:=True;
    finally
     ShowTerminalAlertF.Free;
    end;
   except
   end;
  end; {CheckTerminal}

 // Проверяет, перевалило ли время за полночь после снятия Z-отчета
 function CheckZRep:Boolean;
 var T:String;
  begin
   Result:=True;
   if cbEKKA.Checked then Exit;
   try
    ShowStatus('Чтение состояния кассы...');
    if Not EKKA.fpGetStatus then Abort;
    T:=EKKA.RD_Item[4];
    Insert(':',T,5);
    Insert(':',T,3);
    if Ord(EKKA.RD_Item[9][1])=1 then
     if (StrToTime(T)>StrToTime('23:00:00')) and (StrToTime(T)<StrToTime('23:59:59')) then
      if MessBox('Время в кассовом аппарате не перевалило за полночь!'+#10+
                 'Пробить ЧЕК сейчас или подождете несколько минут?',52)<>ID_YES then Abort;
    Result:=True;
   except
    Result:=False;
   end;
  end; {CheckZRep}

 function CheckSertif:Boolean;
  begin
   try
    Result:=True;
    if NumCardDnepr<>-1 then Exit;
    if Not (TypeChek in [TC_SERTIF,TC_STRETCH]) then Exit;
    if CP.SumChek>CP.SumSertif then
     begin
      SertifIF:=TSertifIF.Create(Self);
      try
       SertifIF.Label4.Caption:=CurrToStrF(CP.SumSertif,ffFixed,2);
       SertifIF.Label5.Caption:=CurrToStrF(CP.SumChek,ffFixed,2);
       SertifIF.Label6.Caption:=CurrToStrF(CP.SumChek-CP.SumSertif,ffFixed,2);
       Application.ProcessMessages;
       SertifIF.ShowModal;
       if SertifIF.Flag<>1 then Abort;
      finally
       SertifIF.Free;
      end;
     end;
   except
    Result:=False;
   end;
  end;

 // Окно "Сдача" 
 procedure CheckContinuePay;
 var Res,Mes:String;
     B:Boolean;
     dH:Integer;
     SumDopl:Currency;
  begin
   dH:=295;
   if FIsChSeria then Exit;
   if lbChek.Visible then
    begin
     if Design=False then
      begin
       if MessBox('В ЧЕКЕ ЕСТЬ НЕПРОВЕРЕННЫЕ ПОЗИЦИИ !!!'+#10+'Вы действительно хотите закрыть чек ?',52)<>ID_YES then raise EAbort.Create('');
       if MessBox('В ЧЕКЕ ЕЩЕ ЕСТЬ НЕПРОВЕРЕННЫЕ ПОЗИЦИИ !!!'+#10+'Вы действительно хотите закрыть чек ?',52)<>ID_YES then raise EAbort.Create('');
      end; 

     Mes:='В ЧЕКЕ ВСЕ ЕЩЕ ЕСТЬ НЕПРОВЕРЕННЫЕ ПОЗИЦИИ !!!'+#10+'Вы действительно хотите закрыть чек ?'
    end else Mes:='Вы действительно хотите закрыть чек ?';

   if Not ( (CP.TypeOplat=TO_CHEK) and (CP.IsTerminal=True) ) then
    if MessBox(Mes,MB_ICONWARNING+MB_YESNO)<>ID_YES then raise EAbort.Create('');

   //MainF.MessBox('- "Сумма вашей покупки '+CurrToStrF(CP.SumChek,ffFixed,2)+' грн." ',48,GetFont('Times New Roman',22,$00006600,[fsBold]),Res,False,'Озвучьте фразу:');

   if Not CheckSertif then raise EAbort.Create('');

   if (TypeCardNew<>1) and (Not Opt.ShowMCash) and (NumCardDnepr=-1) then Exit;
   if (TypeCardNew<>1) and (CP.TypeOplat=TO_CHEK) and (CP.id_strah=0) then Exit;
   B:=True;

   if (CP.TypeOplat in [TO_CASH,TO_CHEK,TO_CHP]) or ( (TypeChek in [TC_SERTIF,TC_STRETCH]) ) then
    begin

    if NumCardDnepr<>-1 then
     begin
      if EnterCurrValue(CP.SumSpisDnepr,'Введите сумму списания не более '+CurrToStr(CP.SumDnepr)+' грн.') then
       begin
        if CP.SumSpisDnepr>CP.SumDnepr then
         begin
          MessBox('Максимальная сумма списания: '+CurrToStr(CP.SumDnepr)+' грн.');
          raise EAbort.Create('');
         end;
       end else raise EAbort.Create('');
      CP.SumSertif:=CP.SumSpisDnepr;
      if CP.SumSertif>CP.SumChek then CP.SumSertif:=CP.SumChek;
     end;

     MoneyCashF:=TMoneyCashF.Create(Self);
     try
      if (CP.id_strah>0) or (CP.TypeChek in TC_DL) then
       begin

        if CP.id_strah>0 then SumDopl:=CP.Fransh else
        if CP.TypeChek in TC_DL then SumDopl:=CP.SumDopl;

        MoneyCashF.SumChek:=SumDopl;
        MoneyCashF.SumChekSafe:=SumDopl;
        MoneyCashF.Label9.Caption:='Сумма компенсации: '+CurrToStrF(CP.SumChek-SumDopl,ffFixed,2)+' грн.';

        MoneyCashF.Label9.Visible:=True;
        dH:=339;

       end else
      if (CP.TypeChek in [TC_SERTIF,TC_STRETCH]) and ((CP.SumChek>CP.SumSertif) or (NumCardDnepr<>-1)) then
       begin
        MoneyCashF.SumChek:=CP.SumChek-CP.SumSertif;
        MoneyCashF.SumChekSafe:=CP.SumChek-CP.SumSertif;
       end else begin
                 MoneyCashF.SumChekSafe:=CP.SumChek {-CP.SumChekRecipt};
                 MoneyCashF.SumChek:=CP.SumChek {-CP.SumChekRecipt};
                end;

      if CP.TypeOplat=TO_CHEK then
       begin
        MoneyCashF.Label12.Caption:='Оплата по безналичному расчету (терминал)';
        MoneyCashF.Label3.Enabled:=False;
        MoneyCashF.Memo1.Enabled:=False;
        MoneyCashF.Label2.Enabled:=False;
        MoneyCashF.StaticText2.Enabled:=False;
        MoneyCashF.StaticText2.Enabled:=False;
        MoneyCashF.Label9.Enabled:=False;
        MoneyCashF.Memo3.Enabled:=False;
        MoneyCashF.Label10.Visible:=False;
       end;

      if (Type_Skd=SK_CARD) and (TypeCardNew=1) then
       begin

        DM.Qr3.Close;
        DM.Qr3.SQL.Clear;
        DM.Qr3.SQL.Add('select 0.01*Sum(kol) as Sm from Chek (nolock) where compname=host_name() and id_user='+IntToStr(Prm.UserID));
        DM.Qr3.Open;

        MoneyCashF.SumSkd:=AccumSumChek;
        MoneyCashF.AccumSum:=AccumSum;


        MoneyCashF.MaxAccumSum:=CP.SumChek-DM.Qr3.FieldByName('Sm').AsCurrency;

        if MoneyCashF.MaxAccumSum>FMaxSpisSum then MoneyCashF.MaxAccumSum:=FMaxSpisSum;
        if AccumSum<MoneyCashF.MaxAccumSum then MoneyCashF.MaxAccumSum:=AccumSum;

        if (CP.TypeOplat=TO_CHEK) and (MoneyCashF.MaxAccumSum>1) and (CP.SumChek-MoneyCashF.MaxAccumSum<1) then MoneyCashF.MaxAccumSum:=MoneyCashF.MaxAccumSum-1;

        if FSafeSumSpis>MoneyCashF.MaxAccumSum then FSafeSumSpis:=MoneyCashF.MaxAccumSum;

        MoneyCashF.lbaAll.Caption:=CurrToStrF(AccumSum,ffFixed,2)+' грн.';
        MoneyCashF.lbaChek.Caption:=CurrToStrF(AccumSumChek,ffFixed,2)+' грн.';
        MoneyCashF.lbaOst.Caption:=CurrToStrF(AccumSum+AccumSumChek,ffFixed,2)+' грн.';

        if (edCash.Text='') or (CP.TypeOplat=TO_CHEK) then MoneyCashF.Memo1.Text:='0'
                                                      else MoneyCashF.Memo1.Text:=edCash.Text;

        if FSafeSumSpis>0 then MoneyCashF.SafeSumSpis:=FSafeSumSpis
                          else MoneyCashF.SafeSumSpis:=0;

        MoneyCashF.SumCashToCard:=FSafeSumCashToCard;

//        MoneyCashF.Memo2.Text:=CurrToStrF(MoneyCashF.MaxAccumSum,ffFixed,2);
        MoneyCashF.CheckBox1.Enabled:=AccumSum>0;
//        MoneyCashF.Memo2.Enabled:=AccumSum>0;
       end else begin
                 if (edCash.Text='') or (CP.TypeOplat=TO_CHEK) then MoneyCashF.Memo1.Text:='0'
                                                               else MoneyCashF.Memo1.Text:=edCash.Text;
                 MoneyCashF.Label4.Visible:=False;
                 MoneyCashF.Label10.Visible:=False;
                 MoneyCashF.Memo2.Visible:=False;
                 MoneyCashF.Label9.Visible:=(CP.id_strah>0) or (CP.SumDopl>0);
                 MoneyCashF.Memo3.Visible:=False;
                {
                 MoneyCashF.Label1.Top:=178;
                 MoneyCashF.StaticText1.Top:=162;
                }
                 MoneyCashF.Height:=dH;
                end;

      FSumCashToCard:=0;
      MoneyCashF.Cp:=CP;
      Application.ProcessMessages;
      //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      MoneyCashF.ShowModal;
      CP.AccumSum:=0;
      if MoneyCashF.Flag<>1 then
       begin
        FSumCashToCard:=0; B:=False;
        if CP.TypeOplat=TO_CHEK then CalcSkdOnly(0,0,False,1);
       end else begin

                 CP.AccumSum:=AccumSum;
                 CP.AccumSumChek:=AccumSumChek+MoneyCashF.SumCashToCard;
                 CP.SumCashToCard:=MoneyCashF.SumCashToCard;

                 if MoneyCashF.CheckBox1.Checked then CP.SumSpis:=MoneyCashF.SumSpis
                                                 else CP.SumSpis:=0;

                 FSafeSumCashToCard:=MoneyCashF.SumCashToCard;
                 FSafeSumSpis:=CP.SumSpis;

                 CP.SumChek:=GetSumChekFull;
                 CP.SumSkd:=SumSkd;
                 CP.IsTerminal:=MoneyCashF.Cp.IsTerminal;
                 CP.InvoiceNum:=MoneyCashF.Cp.InvoiceNum;
                 CP.Merchant:=MoneyCashF.Cp.Merchant;

                 if CP.SumSpis>0 then
                  MainF.MessBox('- "Сумма вашей покупки с учетом использованых накоплений '+CurrToStrF(CP.SumChek,ffFixed,2)+' грн." ',48,GetFont('Times New Roman',22,$00006600,[fsBold]),0,Res,False,'Озвучьте фразу:')
                 else
                  if Prm.AptekaSklad=False then
                   begin
                    //PlayFraz(5,CP.SumChek);
                    MessBox('- "Сумма вашей покупки '+CurrToStrF(CP.SumChek,ffFixed,2)+' грн." ',48,GetFont('Times New Roman',22,$00006600,[fsBold]),0,Res,False,'Озвучьте фразу:');
                   end;

                 edCash.Text:=MoneyCashF.Memo1.Text;
                end;

     finally
      MoneyCashF.Free;
     end;
    end;
   if Not B then raise EAbort.Create('');

   SetCashSumm;
  end;

 procedure PrepChek;
 var CP1:TChekPos;
     Kl,i,Ty:Integer;
     Nm:String;
  begin
   if TypeChek<>TC_PREP then Exit;
   ShowText('ВНИМАНИЕ! Оба чека "предоплата за товар" и "возвратный чек", а также наш экземпляр договора купли-продажи затем в обязательном порядке передать в сектор по обработке первичной документации.');
   try
    DM.ADOCo.BeginTrans;

    if Not (EKKA.fpGetStatus) then AbortM(EKKA.LastErrorDescr);

    if (EKKA.UseEKKA) or (EKKA.EmulEKKA) then
     begin

      EKKA.fpCancelFiscalReceipt;
      if EKKA.ReceiptNumber<0 then raise EAbort.Create('Ошибка определения номера чека.');
      CP1.NumbChek:=EKKA.ReceiptNumber+1;
      if Not EKKA.fpSetBackReceipt(IntToStr(CP.NPrepChek)) then AbortM('Ошибка определения номера возвратного чека: '+EKKA.LastErrorDescr);
      if Not EKKA.fpOpenFiscalReceipt(CH_BACK) then AbortM('Ошибка открытия чека: '+EKKA.LastErrorDescr);
     end else begin
               CP1.NumbChek:=GetNewNumbChek;
               if CP1.NumbChek=0 then begin MainF.MessBox('Ошибка определения номера чека!'); Exit; end;
              end;

    CP1.Date:=DM.GetServerDate;
    CP1.Vzh:=MainF.VzhNum;
    CP1.ID_User:=Prm.UserID;
    CP1.ID_Kassa:=Opt.KassaID;
    CP1.SumChek:=0;

    DM.Qr3.Close;
    DM.Qr3.SQL.Text:='select * from ArhCheks (nolock) where kod_name=0 and Numb_Chek='+IntToStr(CP.NPrepChek)+' and Vzh='+IntToStr(EKKA.VzhNum);
    DM.Qr3.Open;

    for i:=1 to DM.Qr3.RecordCount do
     begin
      if i=1 then DM.Qr3.First else DM.Qr3.Next;
      CP1.PSkd:=DM.Qr3.FieldByName('Skd').AsFloat;
      CP1.NumCard:=DM.Qr3.FieldByName('NumCard').AsInteger;
      if DM.Qr3.FieldByName('Kassa_Num').AsInteger=3 then
       CP1.TypeOplat:=TO_CASH
      else
       CP1.TypeOplat:=DM.Qr3.FieldByName('Kassa_Num').AsInteger-1;
      CP1.Kod_Name:=2;
      Nm:='Передплата за лiкарськi засоби';
//      CP1.ArtName:=IntToStr(CP.NumbChek);
      CP1.ArtName:=Copy(Nm,1,16);
      CP1.Kol:=0;
      Kl:=1;
      CP1.Skd:=0;
      CP1.Cena:=DM.Qr3.FieldByName('Cena').AsFloat;
      CP1.SumSkd:=0;
      CP1.F_NDS:=2;
      CP1.Type_Tov:=1;
      CP1.SumChek:=CP1.SumChek+Abs(Kl)*CP1.Cena-CP1.SumSkd;
      Case CP1.TypeOplat of
       TO_CASH:Ty:=4;
       TO_CHEK:Ty:=2;
      end;
      DM.InsertArhChek(CP1);
      DM.Qr4.Close;
      DM.Qr4.SQL.Text:='update ArhCheks set Kod_Name=1 where row_id='+DM.Qr3.FieldByName('ROW_ID').AsString;
      DM.Qr4.ExecSQL;

      if Not EKKA.fpAddBack(Nm,
                            Abs(Kl),
                            CP1.Cena,
                            1,
                            999999,
                            CP1.F_NDS,
                            -Abs(CP1.SumSkd),
                            ''
                            ) then AbortM('Ошибка пробития позиции чека: '+EKKA.LastErrorDescr);

     end;

    //if Not EKKA.fpCloseFiscalReceipt(CP1.SumChek,Ty,CP1.SumChek) then AbortM('Ошибка закрытия чека: '+EKKA.LastErrorDescr);
    if Not EKKA.fpCloseFiscalReceipt(CP1.SumChek,Ty,CP1.SumChek,0,false,0,StrToIntDef(MainF.RRN,1),MainF.BankCard) then AbortM('Ошибка закрытия чека: '+EKKA.LastErrorDescr);
     try
      EKKA.fpCheckCopy;
      DM.ADOCo.CommitTrans;
     except
      AbortM('Ошибка фиксации записи в архив чеков!');
     end
   except
    on E:Exception do
     begin
      DM.ADOCo.RollBackTrans;
      EKKA.fpCancelFiscalReceipt;
      if (E.Message='') or (E.Message='Operation aborted') then MessBox(E.Message);
     end;
   end;
  end;

 function RegDisountCard:Boolean;
 var bMB:Boolean;
     FIO,DateR:String;
     CR:TCardInfo;
  begin
   Result:=True;
(*   Result:=False;
   bMB:=IsCanRegMomBabyCard and IsMomBabyCard(NumCard);
   if Not ((CP.IsReg) and (Type_Skd=SK_CARD) and ((SumChek>Prm.SumSkd) or bMB or (Copy(IntToStr(NumCard),1,4)=CR_STUD) )) then begin Result:=True; Exit; end;

//   if Prm.AptekaID<>123 then
//    if MessBox('Напечатать бланк "Согласие на сбор и обработку персональных данных"',52)<>ID_YES then Exit;

   try
    AECardsF:=TAECardsF.Create(Self);
    try
     AECardsF.NumCard:=NumCard;
     AECardsF.TypeCard:=CP.TypeCardNew;
     AECardsF.IsMomBabyCard:=bMB;
     AECardsF.ShowModal;
     if AECardsF.Flag<>1 then Abort;
     FIO:=AECardsF.Edit2.Text+' '+AECardsF.Edit3.Text+' '+AECardsF.Edit5.Text;
     CR.NumCard:=NumCard;
     CR.F:=AECardsF.Edit2.Text;
     CR.I:=AECardsF.Edit3.Text;
     CR.O:=AECardsF.Edit5.Text;

     CR.ChName1:=AECardsF.Edit12.Text;
     CR.ChName2:=AECardsF.Edit13.Text;
     CR.ChName3:=AECardsF.Edit14.Text;

     CR.ChDateR1:=AECardsF.ComboBox6.Text+' '+AECardsF.ComboBox7.Text+' '+AECardsF.Edit15.Text+' г.';
     CR.ChDateR2:=AECardsF.ComboBox8.Text+' '+AECardsF.ComboBox9.Text+' '+AECardsF.Edit16.Text+' г.';
     CR.ChDateR3:=AECardsF.ComboBox10.Text+' '+AECardsF.ComboBox11.Text+' '+AECardsF.Edit17.Text+' г.';

     CR.Phone:=AECardsF.Edit4.Text+' '+AECardsF.Edit9.Text+' '+AECardsF.Edit10.Text;

     DateR:='';
    finally
     AECardsF.Free;
    end;

//    if Prm.AptekaID<>123 then
 {    begin

      if bMB then PrintBlankForRegMBCard(CR)
             else PrintBlankForRegCard(NumCard,FIO,DateR);

     end;   }

    Result:=True;
   except
    Result:=False;
   end;
*)
  end;

 procedure EnterForRecipt;
  begin
{
   if CP.B1=False then Exit;
   Pilot3F:=TPilot3F.Create(Self);
   try
    Pilot3F.Height:=207;
    Pilot3F.Top:=(Screen.Height-Pilot3F.Height) div 2;
    Pilot3F.BitBtn1.Visible:=True;

    Pilot3F.Label7.Visible:=True;
    Pilot3F.Edit2.Visible:=True;

    Pilot3F.Label8.Visible:=True;
    Pilot3F.Edit3.Visible:=True;

    Pilot3F.Label9.Visible:=True;
    Pilot3F.Edit4.Visible:=True;

    Application.ProcessMessages;
    Pilot3F.ShowModal;

    if Pilot3F.Flag<>1 then raise Eabort.Create('');

    CP.Pacient:=Pilot3F.Edit1.Text;
    CP.MedName:=Pilot3F.ComboBox1.Text;
    CP.PacientAdr:=Pilot3F.Edit2.Text;
    CP.NumRecipt:=StrToInt(Pilot3F.Edit3.Text);
    CP.FIODOCtor:=Pilot3F.Edit4.Text;

   finally
    Pilot3F.Free;
   end;
}
  end;

 function CheckOnlyMedicard:Boolean;
  begin
   Result:=False;
   try

    if (CP.NumMediCard<>-1) or (FIDRES<>-1) then begin Result:=True; Exit; end;

    DM.Qr3.Close;
    DM.Qr3.SQL.Text:='exec spY_CheckOnlyMedicard '+IntToStr(Prm.UserID);
    DM.Qr3.Open;

    if DM.Qr3.FieldByName('Cnt').AsInteger>0 then
     begin
      MainF.MessBox('В чеке есть позиции которые можно продавать только по карточке "Терапия Плюс"');
      Exit;
     end else Abort;

   except
    Result:=True;
   end;
  end;

 // Предварительные проверки
 function PriorCheking:Boolean;
 var P,Res,Mes:String;
     NCh,i:Integer;
     BSkd:Boolean;
     S:String;

  begin
   try
{
  if (Prm.AptekaID=232) and (CP.TypeOplat=TO_CHEK) then
     begin
      MainF.MessBox('Оплата по безналичному расчету временно запрещена!');
      Exit;
     end;
}
    if (TypeOplat=TO_CASH) and (Cp.SumChek>49999.99) then
     begin
      MessBox('Чеки, сумма которых превышает 50000 грн, нельзя пробивать за наличный расчет!');
      raise EAbort.Create('');
     end;

    if (CP.id_strah=0) and (FIDRES=-1) then
     begin
      DM.Qr5.Close;
      DM.Qr5.SQL.Text:='exec spY_CheckIApteka '+IntToStr(Prm.UserID);
      DM.Qr5.Open;
      if DM.Qr5.FieldByName('Res').AsInteger=0 then
       begin
        MessBox('В чеке есть препарат, который должен отпускаться по карточке врача. Для выбора врача нажмите кнопку "i-Аптека"');
        raise EAbort.Create('');
       end;
     end;

    if (NumCardMag>0) then
     begin
      DM.Qr5.Close;
      DM.Qr5.SQL.Text:='exec spY_CheckKolFlaer '+IntToStr(Prm.UserID);
      DM.Qr5.Open;
      if DM.Qr5.IsEmpty=False then
       begin
        MessBox('В чеке по акционному флаеру позиция "'+DM.Qr5.FieldByName('Names').AsString+'" должна быть в количестве не более '+DM.Qr5.FieldByName('KolOgrUp').AsString+' уп.');
        raise EAbort.Create('');
       end;
     end;

    // Если чек по доступным лекарствам проверяем, чтобы не был превышен лимит по сумме договора
    if CP.TypeChek in TC_DL then
     begin
      DM.Qr5.Close;
      DM.Qr5.SQL.Text:='exec spY_LimitDLSum '+IntToStr(Prm.UserID)+','+IntToStr(CP.TypeChek);
      DM.Qr5.Open;
      if DM.Qr5.FieldByName('Res').AsInteger=0 then
       begin
        MessBox('Превышен лимит по договору по программе "Доступні ліки"! Пробитие чека невозможно!');
        raise EAbort.Create('');
       end;
     end;

    if TypeOplat=TO_BACK then
     begin
      if Not IsPermit([R_KASSIR,R_SUPER,R_OPER,R_PROVIZ],P_ALERT) then raise EAbort.Create('');
     end else if Not IsPermit([R_KASSIR,R_SUPER,R_PROVIZ],P_ALERT) then raise EAbort.Create('');

    if (Prm.IsScanAll) and (CheckScan(P)=True) and (Prm.UserRole<>R_ADMIN) and (Fid_strah=0) and (Fid_doctor=0) and (FTypeRes<>4) and (FTypeRes<>6) then
     begin
      MessBox('Чек отсканирован неполностью!');
      raise EAbort.Create('');
     end;

    if (TypeOplat<>TO_CHEK) and (sbBskd.Down or sbGoldG.Down) then
     begin
      MessBox('Чек можно закрыть только по кнопке "ЧЕК"');
      raise EAbort.Create('');
     end;

    if CP.id_strah>0 then
     begin
      if MessBox('Товары в чеке совпадают с заявкой/рецептом страховой?',52)<>ID_YES then raise EAbort.Create('');
     end;

    if Type_Skd=SK_CARD then
     if Not CheckLimitSkd(NumCard) then raise EAbort.Create('');

    if Not CheckOnlyMedicard then  raise EAbort.Create('');

    if CP.B1=False then
     if Not (CheckTerminal) then raise EAbort.Create('1');
    if Not (ChekSkdConstraints) then raise EAbort.Create('2');

    if CP.TypeCardNew<>1 then
     begin
      BSkd:=False;
      if CP.id_strah<>0 then CP.SumOplata:=CP.Fransh else
      if CP.TypeChek in TC_DL then CP.SumOplata:=CP.SumDopl
                              else CP.SumOplata:=CP.SumChek;

      if (CP.B1=False) and (CP.SumOplata>0) then
       if Not (CheckBankCard(CP)) then raise EAbort.Create('');

      if CP.TypeOplat=TO_CHEK then
       begin
      {
       if CP.IsTerminal then BSkd:=CP.SumOplata<=CP.SumChek else
         if MainF.MessBox('Внимание! В чеке по терминалу есть дополнительная скидка 2% ?'#10#10'Если есть, нажмите "Да", иначе - "Нет".',52,GetFont('MS Sans Serif',12,clBlue,[fsBold]),Res,False)=ID_YES then BSkd:=True;

        if BSkd then
         begin
          sbBSkd.Down:=True;
          CalcSkdOnly(0,0,BSkd,1);
          CP.SumChek:=SumChek99;
         end;
       }
       end;

     end;

    if CP.TypeOplat=TO_BACK then Mes:='Вы действительно хотите сделать ВОЗВРАТ НА СКЛАД ?' else

    Case CP.Iter of
     1:CheckContinuePay;
     2:begin
        if CP.PrPayRecipt=20 then CheckContinuePay;
        //Mes:='Не пробивать р-ный чек?';
        Mes:='Выберите необходимое действие: '+#10#10+'  "Да" - не пробивать р-ный чек'+#10+'  "Нет" - пробивать р-ный чек';
        cbEKKA.Checked:=MessBox(Mes,MB_ICONWARNING+MB_YESNO)=ID_YES;
        if cbEKKA.Checked then CP.PrPayRecipt:=21 else CP.PrPayRecipt:=20;
       end;
    end;
    if DM.qrChek.IsEmpty then
     begin
      if CP.TypeOplat=TO_BACK then MessBox('Нельзя вернуть пустой чек!')
                              else MessBox('Нельзя пробить пустой чек!');
      raise EAbort.Create('5');
     end;

    CP.id_doctor:=0;
    CP.card_doctor:='';

    if sbiApt.Down=True then // Если нажата кнопка iApteka то запрашиваем фамилию врача
     begin
      AddDoctorF:=TAddDoctorF.Create(Self);
      try
       AddDoctorF.Simple:=False;
       AddDoctorF.ShowModal;
       if AddDoctorF.Flag=0 then
        begin
         FSumCashToCard:=0;
         CalcSkdOnly(0,0,False,1);
         Abort;
        end;
       Fid_doctor:=AddDoctorF.aID[AddDoctorF.cbDoctor.ItemIndex].ID;
       Fcard_doctor:=AddDoctorF.lbNCard.Caption;

       CP.id_doctor:=Fid_doctor;
       CP.card_doctor:=Fcard_doctor;
      finally
       AddDoctorF.Free;
      end;
     end;
  {
    // Блокируем продажу Рениаль не по кнопке Терапия+
    DM.Qr5.Close;
    DM.Qr5.SQL.Text:='select art_code,names from Chek (nolock) where dbo.GetOriginalArt(art_code) in (160486,160487) and compname=host_name() and id_user='+IntToStr(Prm.UserID);
    DM.Qr5.Open;

    if (sbMediCard.Down=False) and (DM.Qr5.IsEmpty=False) then
     begin
      S:='Следующие препараты можно продавать только по кнопке Терапия+'#10;
      for i:=1 to DM.Qr5.RecordCount do
       begin
        if i=1 then DM.Qr5.First else DM.Qr5.Next;
        S:=S+#10+'  - '+DM.Qr5.FieldByName('Names').AsString;
       end;
      MessBox(S);
      raise EAbort.Create('');
     end;
  }
    EnterForRecipt;

  {
    DM.Qr5.Close;
    DM.Qr5.SQL.Text:='select art_code from Chek (nolock) where art_code in (select art_code from Skd_Limit (nolock) where type_skd=7) and compname=host_name() and id_user='+IntToStr(Prm.UserID);
    DM.Qr5.Open;
    if (DM.Qr5.IsEmpty=False) and (sbProf.Down=False) then
     begin
      if MessBox('Внимание! В чеке есть перпараты профарма и вы забыли спросить у покупателя рецепт для получения скидки!'+#10+
                 'Если таковой имеется у покупателя, нажмите кнопку "Профарма" и проведите через сканер верхний штрихкод на рецепте!'#10#10+
                 'А также не забудьте забрать лист с рецептом профарма у покупателя иначе вы будете оштрафованы на крупную сумму!'+#10#10#10+
                 '   ДА - закрыть чек без рецепта профармы,'+#10+'   НЕТ - отменить закрытие чека.',52)=ID_NO then raise EAbort.Create('6');
     end else

    if (DM.Qr5.IsEmpty=False) and (sbProf.Down=True) then
     begin
      MessBox('Не забудьте забрать лист с рецептом профарма у покупателя иначе вы будете оштрафованы на крупную сумму!',48);
     end;
  }

    if TypeChek=TC_PILOT then ShowQ('После проведения чека, предъявленные рецепты (оригинал и копия) изъять у покупателя и хранить в аптечном пункте вместе с копией кассового чека',0,True);

    if Not RegDisountCard then raise EAbort.Create('7');

    // Если возврат на склад, то выходим
    if CP.TypeOplat=TO_BACK then
     try
      DateBackF:=TDateBackF.Create(Self);
      try
       DateBackF.Flag:=-1;
       Application.ProcessMessages;
       DateBackF.ShowModal;
       if DateBackF.Flag=-2 then
        begin
         RefreshChek;
         MessBox('В чеке есть позиции, которые вы не можете вернуть с признаком "Переброска"!'+#10+'В чеке они подсвечены желтым цветом!');
        end;
       if DateBackF.Flag<=-1 then raise EAbort.Create('8');
       CP.Priznak:=DateBackF.Flag;
       CP.VzDescr:=DateBackF.edDescr.Text;
       Result:=True;
       Exit;
      finally
       DateBackF.Free;
      end;
     except
      Result:=False; Exit;
     end;

    {Если есть незакрытый чек (только для Datecs)}
    FNonClosed:=EKKA.fpIsNonClosedReceipt;
    if FNonClosed then
     begin
      if EKKA.LastError<>'' then raise EAbort.Create(EKKA.LastError);
      btnCChek.Enabled:=False;
      Result:=True; Exit;
     end;

{
    if Prm.AptekaID in [39] then
     if Not EKKA.KeyPosition(KEY_W) then raise EAbort.Create('Переведите ключ в положение [P]!');
}
    if ((CP.TypeOplat in [TO_CHP,TO_CHPBEZNAL]) or (cbEKKA.Checked)) and (EKKA.EmulEKKA=False) then
     begin
      if (lbNumCard50.Visible) or (CP.PrPayRecipt=21) then CP.NumbChek:=GetNewNumbChek(1)
                                                      else CP.NumbChek:=GetNewNumbChek;

      if CP.NumbChek=0 then begin MessBox('Ошибка определения номера чека!'); raise EAbort.Create(''); end;
      Result:=True;
      Exit;
     end else begin // Если чек по кассовому аппарату и он используется
               if (EKKA.TypeEKKA=EKKA_MARRY301MTM) and (EKKA.EmulEKKA=False) then CheckStatusCheck(CP,ST_ZREP,1);
//               if Not CheckZRep then Abort;
               EKKA.fpCancelFiscalReceipt;
               {if (Prm.AptekaID in [51,52]) and (EKKA.TypeEKKA=EKKA_MARRY301MTM) then
                try
                 NCh:=EKKA.ReceiptNumber;
                 if (FLastNumbRecipt>0) and (FLastNumbRecipt<>NCh) then NCh:=FLastNumbRecipt;
                 Inc(FLastNumbRecipt);
                except
                end else} NCh:=EKKA.ReceiptNumber;
               if NCh<0 then
                begin
                 if EKKA.TypeEKKA<>EKKA_MARRY301MTM then
                  raise EAbort.Create('Ошибка определения номера чека!'#10#10+EKKA.LastErrorDescr)
                 else
                  raise EAbort.Create('Ошибка определения номера чека!'#10#10+
                                      'Выключите/включите кассовый аппарат, проверьте провода сзади кассового аппарата и попробуйте закрыть чек еще раз!');
                end;
               CP.NumbChek:=NCh+1;
              end;

    if PayCount>0 then cbEKKA.Checked:=True;

    if EKKA.TypeEKKA=EKKA_EXELLIO then
     begin
      EKKA.fpGetStatus;
      if EKKA.LastError='' then
       if Ord(EKKA.RD_Item[9][1])=1 then EKKA.fpSetTime(Now);
     end;

    ShowStatus('Открытие нового чека...');
    if Not EKKA.fpOpenFiscalReceipt then raise EAbort.Create('Не выполнилась открытие нового чека!'+#10+
                                                             '_______________________________________________________________'+#10#10+EKKA.LastErrorDescr)
                                    else WriteLog('Чек: №'+IntToStr(CP.NumbChek));
    ShowStatus('Чек открыт.');
    Result:=True;
   except
    on E:Exception do
     begin
      if Not ((E.Message='') or (AnsiUpperCase(E.Message)=AnsiUpperCase('Operation aborted'))) then MessBox(E.Message);
      Result:=False;
     end; 
   end;
  end; {PriorCheking}
  
 // Дополнительные параметры пробивки чека (только для администраторских прав)
 function AddonInitCP:Boolean;
  begin
   Result:=True;
   if CP.TypeOplat=TO_BACK then Exit;
   if Not (IsPermit([],P_SILENT)) then Exit;
   CP.Priznak:=200;
   try
    InitCPF:=TInitCPF.Create(Self);
    try
     InitCPF.CP:=CP;
     Application.ProcessMessages;
     InitCPF.ShowModal;
     if InitCPF.Flag=1 then
      begin
       CP:=InitCPF.CP;
      end else  Result:=False;
    finally
     InitCPF.Free;
    end;
   except
    MessBox(ER_CR_FORM);
   end;
  end; {AddonInitCP}

 // Показывает список подарков
 procedure ShowMessAkcii;
  begin
   if FTypeChek=TC_BACK then Exit;
   try
    DM.qrShAkcii.Close;
    DM.qrShAkcii.SQL.Clear;
    DM.qrShAkcii.SQL.Add('select a.art_code,a.names,Sum(a.kol) as kol from Chek a (nolock) ,DtAkcii b (nolock)');
    DM.qrShAkcii.SQL.Add('where a.art_code=b.art_add and a.compname=host_name() and a.id_user='+IntToStr(Prm.UserID));
    DM.qrShAkcii.SQL.Add('group by a.art_code,a.names order by 2 ');
    DM.qrShAkcii.Open;
    if DM.qrShAkcii.IsEmpty then Exit;
    ShowAkciiF:=TShowAkciiF.Create(Self);
    try
     if DM.qrShAkcii.RecordCount>1 then ShowAkciiF.Label1.Caption:='Не забудьте выдать покупателю следующие подарки';
     Application.ProcessMessages;
     ShowAkciiF.ShowModal;
    finally
     ShowAkciiF.Free;
    end;
   except
   end;
  end; {ShowMEssAkcii}

 // Устанавливает дополнительную скидку
 procedure CorrSkd50;
 var S1,S2:String;
  begin
{
   if Not IsSkdDop then Exit;
//   if Not (Prm.AptekaID in [6,11,20,21,22,24,17..19,8,7,30..38]) then Exit;
   S1:='0'; S2:='NULL';
   if lbNumCard50.Visible then
    begin
//     S1:='(cena*kol-IsNull(SumSkd,0))*@perc/100.';
     S1:='(cena*kol-IsNull(SumSkd,0))';
     S2:='1';
     FlagW:=True;
    end;
   DM.QrDS.Close;
   DM.QrDS.SQL.Clear;
//   DM.Qr.SQL.Add('declare @perc numeric(8,2)');
//   DM.Qr.SQL.Add('select @perc= IsNull(convert(numeric(8,2),Value),0) from Spr_Const where Descr=''Skd50''');
   DM.QrDS.SQL.Add('Update Chek set SumSkdK='+S1+', NumCardK='+S2+' where id_user='+IntToStr(Prm.UserID));
   DM.QrDS.ExecSQL;
//   DM.qrChek.Close;
//   DM.qrChek.Open;
   ReOpenChek;
}
  end; {CorrCena10}

 Begin

  if (FIsTerminal) and (TypeOplat=TO_CASH) then
   begin
    MessBox('Вы уже оплатили чек по териналу. Необходимо нажимать кнопку "ЧЕК"! ');
    Exit;
   end;

  if FPayWork then Exit;
  Result:=False;
  try
   FPayWork:=True;
    if BlockingChek=False then
     begin
      Init;

      if Not PriorCheking then Exit;
      if Not AddonInitCP then
       begin
        FSumCashToCard:=0;
        CalcSkdOnly(0,0,False,1);
        Exit;
       end;
      dbgChek.Enabled:=False;
     end;
   try
    if BlockingChek=False then
     begin
      Tran:=False;
      DM.ADOCo.BeginTrans;
      Tran:=True;
     end else Tran:=False;
    try
     if BlockingChek=False then
      begin
       CorrSkd50;
       ShowMEssAkcii;

       // Проверяем есть ли в чеке позиции по рецепту
       if AnsiUpperCase(Prm.aCity)='ХАРЬКОВ' then
        try
         DM.qrReciptList.Close;
         DM.qrReciptList.SQL.Text:='spY_CheckReciptList '+IntToStr(Prm.UserID);
         DM.qrReciptList.Open;
        except
        end;

       if cbEKKA.Checked then begin
                               DM.WriteChek(CP)
                              end
                         else begin
                               if CP.Vzh<=0 then raise EAbort.Create('Ошибка определения заводского номера кассового аппарата! Попробуйте закрыть чек еще раз.');
                               DM.WriteChek(CP,-100);
                              end;

       if Not MDMUSendRealiz(CP) then raise EAbort.Create('Ошибка отправки реализации в сервис MDM');
       if Not MediSendRealiz(CP) then raise EAbort.Create('Ошибка отправки реализации в сервис MediCard');

       if EKKA.EmulEKKA=False then
        begin
         if sbFix10.Down then
           if not GetGeptralChek(sbFix10,byte(asGeptral),byte(aoValidate)) then
           begin
            sbFix10.Down:=false;
            Type_Skd:=SK_NONE;
           MainF.MessBox('Ошибка отправки реализации в сервис Гептрал');
           //raise Exception.Create('Ошибка отправки реализации в сервис Гептрал');
          end
          else
           GetGeptralChek(sbFix10,byte(asGeptral),byte(aoFix));
        end;


       DM.ADOCo.CommitTrans;
       Tran:=False;
       MemCP:=CP;
       CheckOnly:=False;
       BlockingChek:=True;
      end else begin
                try
                 DM.QrEx.Close;
                 DM.QrEx.SQL.Clear;
                 DM.QrEx.SQL.Add('declare @RealizDay numeric(12,2), @dt datetime ');
                 DM.QrEx.SQL.Add('set @dt=getdate() ');
                 DM.QrEx.SQL.Add('exec spY_WriteJournZ @dt,'+IntToStr(MemCP.Vzh)+','+IntToStr(MemCP.ID_Kassa)+',1,@RealizDay output ');
                 DM.QrEx.SQL.Add('select Sum(kol*cena-sumskd) as SumCh, @RealizDay as RealizDay from Chek (nolock) where type_skd<>99 and compname=host_name() and id_user='+IntToStr(Prm.UserID));
//                DM.QrEx.SQL.SaveToFile('C:\JournZSums.txt');
                 DM.QrEx.Open;
                 if DM.QrEx.IsEmpty then raise EAbort.Create('Ошибка получения информации о дневных суммах и сумме чека!');
                 MemCP.SumChek:=DM.QrEx.FieldByName('SumCh').AsCurrency;
                 MemCP.RealizDay:=DM.QrEx.FieldByName('RealizDay').AsCurrency;
                except
                end;
                CheckOnly:=True;
                CP:=MemCP;
               end;

     if FNonClosed=False then
      begin
       try
        ResFisc:=FiscalChek(DM.qrChek,CheckOnly,CP,True)
       except
        BlockingChek:=False;
        raise;
       end
      end else ForceCloseReceipt(CP.TypeOplat);

     if ResFisc=False then
      begin
       pnBlChek.Visible:=True;
       Exit;
      end;

     DoneCheck(CP,1);
     BlockingChek:=False;

     if (CP.id_strah>0) or (CP.TypeChek in TC_DL) then EKKA.fpCheckCopy;

     // Печатаем квитанцию на оплату для кредитных броней по iApteka
     if CP.IsIAptekaCredit=True then
     begin
       if EKKA.TypeEKKA=EKKA_MARRY301MTM then
       begin
         if EKKA.fpOpenServiceReceipt then
         begin
           with TADOQuery.Create(self) do
           begin
             try
               Connection:=DM.ADOCo;
               SQL.Clear;
               SQL.Text:='select bank,mfo1,okpo,r_r1 from SPRFIRMS where DescrUA = '''+EKKA.FirmNameUA+'''';
               Open;
               if not IsEmpty then
               begin
                 if not FieldByName('bank').IsNull then EKKA.Bank:=FieldByName('bank').AsString else EKKA.Bank:='';
                 if not FieldByName('mfo1').IsNull then EKKA.MFO:=FieldByName('mfo1').AsString else EKKA.MFO:='';
                 if not FieldByName('okpo').IsNull then EKKA.OKPO:=FieldByName('okpo').AsString else EKKA.OKPO:='';
                 if not FieldByName('r_r1').IsNull then EKKA.R_R:=FieldByName('r_r1').AsString else EKKA.R_R:='';
               end
               else
               begin
                 EKKA.Bank:='';
                 EKKA.MFO:='';
                 EKKA.OKPO:='';
                 EKKA.R_R:='';
               end;
             finally
               Free;
             end;
           end;
           EKKA.NumbChek:=CP.NumbChek;
           EKKA.SumChek:=CP.SumChek;

           EKKA.fpCloseServiceReceipt;
         end
         else
           EKKA.fpCancelServiceReceipt;
       end
       else
       begin
         //печать реквизитов для оплаты
         try
           PrintRep.Clear;
           PrintRep.SetDefault;
           PrintRep.Font.Name:='Arial'; PrintRep.Font.Size:=4; PrintRep.Font.Style:=[];
           PrintRep.PageSize:=PF_A4; PrintRep.Orientation:=O_PORTR; PrintRep.Align:=AL_LEFT;

           PrintRep.AddTable(1,1);
           Tb:=PrintRep.LastTable;
           Tb.SetWidths('1000');
           Tb.SetBorders(1,1,1,1,EMPTY_BORDER);

           Tb.Cell[1,1].Font.Style:=[fsBold];
           Tb.Cell[1,1].AddText('Реквизиты для оплаты по кредиту СТАДА'+#10);

           PrintRep.AddTable(2,7);
           Tb:=PrintRep.LastTable;
           Tb.SetWidths('700,1800');
           Tb.SetBorders(1,1,2,8,EMPTY_BORDER);
           Tb.Cell[1,1].Font.Style:=[fsBold];
           Tb.Cell[1,1].AddText('Фирма получатель:'+#10);
           Tb.Cell[1,2].Font.Style:=[fsBold];
           Tb.Cell[1,2].AddText('ОКПО'+#10);
           Tb.Cell[1,3].Font.Style:=[fsBold];
           Tb.Cell[1,3].AddText('Банк '+#10);
           Tb.Cell[1,4].Font.Style:=[fsBold];
           Tb.Cell[1,4].AddText('МФО '+#10);
           Tb.Cell[1,5].Font.Style:=[fsBold];
           Tb.Cell[1,5].AddText('расчетный счет'+#10);
           Tb.Cell[1,6].Font.Style:=[fsBold];
           Tb.Cell[1,6].AddText('Чек №'+#10);
           Tb.Cell[1,7].Font.Style:=[fsBold];
           Tb.Cell[1,7].AddText('Сумма к оплате по чеку: '+#10);

           Tb.Cell[2,1].Font.Style:=[];
           Tb.Cell[2,1].AddText(Prm.FirmNameUA+#10);
           Tb.Cell[2,2].Font.Style:=[];
           Tb.Cell[2,2].AddText(EKKA.OKPO+#10);
           Tb.Cell[2,3].Font.Style:=[];
           Tb.Cell[2,3].AddText(EKKA.Bank+#10);
           Tb.Cell[2,4].Font.Style:=[];
           Tb.Cell[2,4].AddText(EKKA.MFO+#10);
           Tb.Cell[2,5].Font.Style:=[];
           Tb.Cell[2,5].AddText(EKKA.R_R+#10);
           Tb.Cell[2,6].Font.Style:=[];
           Tb.Cell[2,6].AddText(IntToStr(CP.NumbChek)+#10);
           Tb.Cell[2,7].Font.Style:=[];
           Tb.Cell[2,7].AddText(CurrToStrF(CP.SumChek,ffCurrency,3)+#10);

           PrintRep.PreView;
         except
           on E:Exception do MainF.MessBox('Ошибка формирования печатной формы: '+E.Message);
         end;
       end;
     end;

     if (FIsKurDostMakeOut=True) or ((Prm.IsKurDostavka=True) and (CP.SumKurDost>0)) then
      begin
       if FIsKurDostMakeOut then vidSumChek:=CP.SumChek else vidSumChek:=CP.SumKurDost;
       EKKA.fpCashOutput(vidSumChek,2);
       if EKKA.LastError<>'' then raise EAbort.Create('Ошибка выдачи денежных средств для !'#10#10+EKKA.LastErrorDescr);
       TryWriteToJournal;
       if EKKA.EmulEKKA=False then
        try
         ss:=CurrToStrF(vidSumChek,ffFixed,2);
         if Pos(',',ss)>0 then ss:=StringReplace(ss,',','.',[rfReplaceAll]);
         DM.QrEx.Close;
         DM.QrEx.SQL.Clear;
         DM.QrEx.SQL.Add('insert into CashOutPutLog(Dt,         Summa, vzh,                      id_kassa,                 id_user,               Cash, IsPrint,InOut,TypeO)');
         DM.QrEx.SQL.Add('                   values(getdate(),'+ss+','+IntToStr(EKKA.VzhNum)+','+IntToStr(Opt.KassaID)+','+IntToStr(Prm.UserID)+',0,    0,      -1,    2)');
         DM.QrEx.SQL.Add('select 999 as Res');
         DM.QrEx.Open;
        except
         on E:EXception do
          MainF.RegisterError('Выдача по курьерской доставке',E.Message,False);
        end;

      end;

     FIDRES:=-1;
     FNumZakaz:=0;
     FPhone:='';

     Result:=True;
     PrepChek;

    //сохраняем ввод клавиатуры между чеками
    if Prm.save_kyboard_data then
    try
     with DM.ADOQ_tmp do
      begin
       Close;
       SQL.Clear;
       SQL.Add('insert into APTEKA_NET..input_save');
       SQL.Add('(dt_chek, id_user, id_kassa, numb_chek, id_apteka,dt_begin, data)');
       SQL.Add('values (:Pdt_chek, :Pid_user, :Pid_kassa, :Pnumb_chek, :Pid_apteka, :Pdt_begin, :Pdata)');
       parameters.ParamByName('Pdt_chek').Value:=now();
       parameters.ParamByName('Pid_user').Value:=CP.ID_User;
       parameters.ParamByName('Pid_kassa').Value:=CP.ID_Kassa;
       parameters.ParamByName('Pnumb_chek').Value:=CP.NumbChek;
       parameters.ParamByName('Pid_apteka').Value:=Prm.AptekaID;
       parameters.ParamByName('Pdt_begin').Value:=date_begin;
       parameters.ParamByName('Pdata').Value:=curr_data;
       ExecSQL;
       date_begin:=now();
       curr_data:='';
      end;
    except

    end;

    except
     on E:Exception do
      begin
       if BlockingChek=False then
        begin
         FSumCashToCard:=0;
         CalcSkdOnly(0,0,False,0);
        end;
       EKKA.fpCancelFiscalReceipt;
       if Tran then DM.ADOCo.RollbackTrans else DoneCheck(CP,0);
       ShowExceptMessage(E);
       Exit;
      end;
    end;
   finally
    dbgChek.Enabled:=True;
    dbgChek.Repaint;
    if ResFisc then
     begin
      CP.Pacient:='';
      FPacient:='';
      FMedName:='';
      FDtRecipt:=0;
      FIsDopl:=0;
      FNRecipt:='';
      FFIODOctor1:='';

//      if dbgSklad.Visible then dbgSklad.SetFocus;
      dbgSkladSetFocused;
      cbEKKA.Checked:=cb_EKKA;
     end;
   end;
   if ResFisc then EndChek;
  finally
   dbgChek.Enabled:=True;
   FPayWork:=False;
   if ResFisc then
    begin
     FlagW:=False;
     lbNumCard50.Visible:=False;
     cbEKKA.Checked:=Not(UseEKKASafe);
     sbSearchClearClick(sbSearchClear);
     FilterSklad;
    end;
  end;
 End; {PayChek}

{
         try
         ChoosePayF:=TChoosePayF.Create(Self);
         try
          ChoosePayF.BitBtn2.Enabled:=False;
          ChoosePayF.ShowModal;
          Case ChoosePayF.Flag of
           1:PayChek(TO_CASH);
           3:PayChek(TO_CASH);
          end
         finally
          ChoosePayF.Free;
         end;
        except
         on E:Exception do MessBox(E.Message);
        end;
}

// Описание действий по закрытию чека
procedure TMainF.CloseChekExecute(Sender:TObject);
 begin
  if TControl(Sender).Enabled then
   begin
    if (FIDRES<>-1) and ((FIsPayMaster=True) or (FIsIAptekaCredit=True)) then PayChek(TO_CHEK,DO_BEZGOT1) else
    if Sender=btnPayCash then PayChek(TO_CASH) else
    if Sender=btnPayChek then PayChek(TO_CHEK);
   end;
 end; {CloseChekExecute}

procedure TMainF.btnPayCashClick(Sender:TObject);
 begin
  if Prm.IsKurier then
   begin
    ChoosePayF:=TChoosePayF.Create(Self);
    try
     ChoosePayF.BitBtn2.Enabled:=False;
     ChoosePayF.BitBtn5.Enabled:=False;

     if ID_Doctor=0 then ChoosePayF.BitBtn6.Enabled:=False;
     ChoosePayF.ShowModal;
     Case ChoosePayF.Flag of
      1:PayChek(TO_CASH);
      3:PayChek(TO_CASH,DO_NEWPOST);
     end
    finally
     ChoosePayF.Free;
    end;
   end else CloseChekExecute(Sender);
 end;

procedure TMainF.btnPayChekClick(Sender: TObject);
 begin
  if (Prm.IsKurier) or (ID_Doctor>0) then
   begin
    ChoosePayF:=TChoosePayF.Create(Self);
    try
     ChoosePayF.BitBtn1.Enabled:=False;
     ChoosePayF.BitBtn4.Enabled:=False;
     if TypeChek=TC_OBSL then
      begin
       ChoosePayF.BitBtn5.Enabled:=False;
      end;
     ChoosePayF.ShowModal;
     Case ChoosePayF.Flag of
      2:PayChek(TO_CHEK);
      4:PayChek(TO_CHEK,0,DO_KURIER);
      5:PayChek(TO_CHEK,DO_BEZGOT1);
     end
    finally
     ChoosePayF.Free;
    end;
   end else CloseChekExecute(Sender);
 end;

procedure TMainF.SetBlockingChek(V:Boolean);
 begin
  FBlockingChek:=V;
  cbEKKA.Enabled:=Not V;
  pnSkd.Enabled:=Not V;
  miSumSkd.Enabled:=Not V;
  miFixSkd.Enabled:=Not V;
  miCardSkd.Enabled:=Not V;
  miBack.Enabled:=Not V;
  bbReserve.Enabled:=Not V;
  N73.Visible:=V;
  if V=False then pnBlChek.Visible:=False;
 end;

procedure TClearDisp.Execute;
 begin
  inherited;
  FreeOnTerminate:=True;
  EKKA.fpStrToDisp('');
 end;

// Переключение флага использования EKKA
procedure TMainF.cbEKKAClick(Sender:TObject);
 begin
  EKKA.UseEKKA:=Not(TCheckBox(Sender).Checked);
 end; {cbEKKAClick}

// Обработчики контекстного меню pmMain
procedure TMainF.miCancelChekClick(Sender:TObject); begin CancelChek(1); end;

procedure TMainF.miCloseChekClick(Sender:TObject);
 begin
  if ChekOpened=False then Exit;
  if (FIDRES<>-1) and ((FIsPayMaster=True) or (FIsIAptekaCredit=True)) then PayChek(TO_CHEK,DO_BEZGOT1) else
  try
   ChoosePayF:=TChoosePayF.Create(Self);
   try
    if FIsKurDostMakeOut=True then ChoosePayF.BitBtn2.Enabled:=False;
    if TypeChek=TC_OBSL then
     begin
      ChoosePayF.BitBtn1.Enabled:=False;
      ChoosePayF.BitBtn5.Enabled:=False;
      ChoosePayF.BitBtn4.Enabled:=False;
     end;
    ChoosePayF.ShowModal;
    Case ChoosePayF.Flag of
     1:CloseChekExecute(btnPayCash);
     2:CloseChekExecute(btnPayChek);
     3:PayChek(TO_CASH,DO_NEWPOST);
     4:PayChek(TO_CHEK,0,DO_KURIER);
     5:PayChek(TO_CHEK,DO_BEZGOT1);
    end
   finally
    ChoosePayF.Free;
   end;
  except
   on E:Exception do MessBox(E.Message);
  end;
 end;

procedure TMainF.miChekClick(Sender:TObject);    begin CloseChekExecute(btnPayChek); end;
procedure TMainF.miFixSkdClick(Sender:TObject);  begin SwitchSkd(sbFix,Sender);      end;
procedure TMainF.miCardSkdClick(Sender:TObject); begin SwitchSkd(sbCard,Sender);     end;
procedure TMainF.miSumSkdClick(Sender:TObject);  begin SwitchSkd(sbSumm,Sender);     end;
//*************************************

function TMainF.GetOstatEd:Integer;
var Ostat,i:Integer;
 begin
  if DM.spY_FilterSklad.IsEmpty then begin Result:=0; end;

  Ostat:=-1;
  for i:=Low(aOstat) to High(aOstat) do
   if aOstat[i].Art_Code=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger then
    begin
     Ostat:=aOstat[i].Ostat;
     Break;
    end;
  if Ostat<>-1 then Result:=Ostat
               else Result:=DM.spY_FilterSklad.FieldByName('Ostat').AsInteger;
 end;

// Раскраска Справочника товаров
procedure TMainF.dbgSkladDrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
var db:TDBGrid;
    dR,sR:TRect;
    dx,dy,dxr,Kl,Art_Code,i,Ostat,dx2,dy2,dx3:Integer;
    PCena,sCn:String;
    tmpBColor,C:TColor;
    Srok:TDateTime;
    IsS,IsRec:Boolean;
    tmpB,tmpF,tmpF1:TColor;
    tmpS,tmpS1:TFontStyles;
    sPr:String;
    sSrokSkd:String;

 procedure MarkColumn(N:Integer);
  begin
   if Column=db.Columns[N] then db.Canvas.Brush.Color:=Cl.Order;
  end;

 procedure Transp(dr:TRect);
 var j,i:Integer;
  begin
   C:=db.Canvas.Pixels[dr.Left,dr.Top];
   for j:=dr.Top to dr.Bottom do
    for i:=dr.Left to dr.Right do
     if db.Canvas.Pixels[i,j]=C then
      db.Canvas.Pixels[i,j]:=db.Canvas.Brush.Color;
  end;

 // Подсвечиваем подстроку фильтра
 function DrawWithFilter(X,Y:Integer; Param:Byte):Boolean;
 var i,j,dx1,CA,P,q:Integer;
     F,F1,Names:String;
     Txt:Record
          P:Array of Byte;
          S:String;
          SUpper:String;
         end;
  begin
  Result:=False;
  try

   Case Param of
    0:Names:=db.DataSource.DataSet.FieldByName('NAMES').AsString;
    1:Names:=db.DataSource.DataSet.FieldByName('DESCR').AsString;
   end;

   F1:=AnsiUpperCase(Names);

   F:=nmFilter;
   if Length(F)<=2 then Abort;

   SetLength(Txt.P,0);
   Txt.S:='';
   dx1:=Abs(Rect.Right-Rect.Left-X);

   for i:=1 to Length(Names) do
    begin
     if db.Canvas.TextWidth(Txt.S+Names[i])>dx1 then Break;
     CA:=High(Txt.P)+1;
     SetLength(Txt.P,CA+1);
     Txt.P[CA]:=0;
     Txt.S:=Txt.S+Names[i];
    end;

   Txt.SUpper:=Txt.S;
   P:=0;
   for i:=Low(arFilter) to High(arFilter) do
    begin
     Repeat
      P:=PosEx(AnsiUpperCase(arFilter[i]),{F1} AnsiUpperCase(Txt.S),P+1);
      if (P=0) or (P>=Length(Txt.S)) then Break;

      for j:=0 to Length(arFilter[i])-1 do Txt.P[P+j-1]:=1;
     Until False;
    end;

    q:=0;
    if Param=0 then db.Canvas.FillRect(Rect);

    try
     tmpB:=db.Canvas.Brush.Color;
     tmpF:=db.Canvas.Font.Color;
     tmpS:=db.Canvas.Font.Style;

     if Param=1 then
      begin
       if (gdSelected in State) then db.Canvas.Pen.Color:=clWhite
                                else db.Canvas.Pen.Color:=clBlack;

       db.Canvas.MoveTo(Rect.Left+X-8,Rect.Top+Y);
       db.Canvas.LineTo(Rect.Left+X-8,Rect.Top+Y+9);
       db.Canvas.LineTo(Rect.Left+X-1,Rect.Top+Y+9);

      end;

     for i:=0 to Length(Txt.S)-1 do
      begin
       if Txt.P[i]=0 then
        begin
         db.Canvas.Brush.Color:=tmpB;
         Case Param of
          0:begin
             db.Canvas.Font.Color:=tmpF;
             db.Canvas.Font.Style:=tmpS;
            end;
          1:begin
             db.Canvas.Font.Color:=tmpF;
             db.Canvas.Font.Style:=[];
            end;
         end;
        end else begin
                  db.Canvas.Brush.Color:=clYellow;
                  db.Canvas.Font.Color:=clBlack;
                  Case Param of
                   0:db.Canvas.Font.Style:=[fsBold,fsUnderline];
                   1:db.Canvas.Font.Style:=[fsUnderline];
                  end;
                 end;
       db.Canvas.TextOut(Rect.Left+X+q,Rect.Top+Y,Txt.S[i+1]);
       Inc(q,db.Canvas.TextWidth(Txt.S[i+1]));
      end;
    finally
     db.Canvas.Brush.Color:=tmpB;
     db.Canvas.Font.Color:=tmpF;
     db.Canvas.Font.Style:=tmpS;
    end;
    Result:=True;
   except
    Result:=False;
   end;
  end;

 Begin

  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  Case SprOrder of
   O_ART_CODE:MarkColumn(0);
   O_NAMES   :MarkColumn(2);
  end;

  dx2:=15;
  dy2:=18;

  Art_Code:=db.DataSource.DataSet.FieldByName('Art_Code').AsInteger;
  Ostat:=-1;
  for i:=Low(aOstat) to High(aOstat) do
   if aOstat[i].Art_Code=Art_Code then
    begin
     Ostat:=aOstat[i].Ostat;
     Break;
    end;

//   TFake(db).RowHeights[2]:=60;

  if FullSprTov=False then
   if (db.DataSource.DataSet.FieldByName('OSTAT').AsInteger<=0) or ((Ostat<=0) and (Ostat<>-1)) then
    begin

     if (cbExt.Visible=False) and (db.DataSource.DataSet.FieldByName('TypeTov').AsInteger=2) then
      db.Canvas.Brush.Color:=$005EBB00
     else
      db.Canvas.Brush.Color:=$00FFCB5E;

    end;

  if db.DataSource.DataSet.FieldByName('F_NDS').AsInteger>2 then db.Canvas.Font.Style:=[fsItalic,fsBold];

  IsS:=IsSrok(db.DataSource.DataSet.FieldByName('NAMES').AsString,Srok);
  if IsS and (DataCol=2) and (db.DataSource.DataSet.FieldByName('OSTAT').AsInteger>0) then
   begin
    db.Canvas.Brush.Color:=$004F4FFF;
   end;

  try
   if db.DataSource.DataSet.FieldByName('Color').AsInteger=11053311 then db.Canvas.Brush.Color:=db.DataSource.DataSet.FieldByName('Color').AsInteger
    else
   if (db.DataSource.DataSet.FieldByName('Color').AsInteger>0) and (DataCol in [3,4]) then
     db.Canvas.Brush.Color:=db.DataSource.DataSet.FieldByName('Color').AsInteger;
  except
  end;

  if ((Prm.AptekaSklad=False) or (Prm.IsNewDiscOpt=True))  and (DataCol in [5]) and (db.DataSource.DataSet.FieldByName('IsSpisAll').AsInteger=1) then
   db.Canvas.Brush.Color:=clLime;

  if (db.DataSource.DataSet.FieldByName('IsScan').AsInteger<>0) and (DataCol=0) then
   begin
    db.Canvas.Brush.Color:=$00FFD98A;
    db.Canvas.Font.Color:=clBlack;
   end;

  if (Pos('***',db.DataSource.DataSet.FieldByName('Names').AsString)<>0) and (DataCol=2) then
   begin
    db.Canvas.Brush.Color:=clTeal;
    db.Canvas.Font.Color:=clWhite;
   end;

  if (gdSelected in State) and Not ((DataCol=2) and (Pos('***',db.DataSource.DataSet.FieldByName('Names').AsString)<>0)) then
   begin
{    if (db.DataSource.DataSet.FieldByName('OSTAT').AsInteger>0) or
       ((db.DataSource.DataSet.FieldByName('OSTAT').AsInteger<=0) and (DataCol=0)) then}
     begin
      FTopCurrentLine:=Rect.Top;

{
  if (hKonkurHintF1.Visible) and (DM.spY_FilterSklad.FieldByName('Descr').AsString='') then
   begin
    hKonkurHintF1.Hide;
    if dbgSklad.Visible then dbgSklad.SetFocus;
   end else
  if (hKonkurHintF1.Visible=False) and (DM.spY_FilterSklad.FieldByName('Descr').AsString<>'') then
   begin
    GetCoordControl(Self,dbgSklad,dx,dy);
    hKonkurHintF1.Label1.Caption:=DM.spY_FilterSklad.FieldByName('Descr').AsString;
    hKonkurHintF1.Show;
    hKonkurHintF1.Left:=dx+120;
    hKonkurHintF1.Top:=dy+FTopCurrentLine+55;
    if dbgSklad.Visible then dbgSklad.SetFocus;
   end;
}

      db.Canvas.Brush.Color:=clNavy;
      db.Canvas.Font.Color:=clWhite;
     end;
   end;

  if (DataCol=3) and (db.DataSource.DataSet.FieldByName('KolRes').AsInteger>0) then
   begin
    db.Canvas.Font.Color:=clRed;
   end;

  // подсветка товаров в карантине ---
  if (not db.DataSource.DataSet.FieldByName('IsQuarantine').IsNull)and(db.DataSource.DataSet.FieldByName('IsQuarantine').AsInteger = 1) then
   try
    db.Canvas.Brush.Color:=clFuchsia;
   except
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);

  if DataCol=13 then // Колонка акции
   try
    tmpF1:=db.Canvas.Font.Color;
    tmpS1:=db.Canvas.Font.Style;
    db.Canvas.FillRect(Rect);
    Case db.DataSource.DataSet.FieldByName('akType').AsInteger of
     1:if db.DataSource.DataSet.FieldByName('akCena').AsCurrency>0 then
        begin
         if (gdSelected in State) then db.Canvas.Font.Color:=clWhite
                                  else db.Canvas.Font.Color:=clBlue;
         db.Canvas.TextOut(Rect.Left,Rect.Top+((Rect.Bottom-Rect.Top-db.Canvas.TextHeight('Акцiя') )div 2),'Акцiя');

         if (gdSelected in State) then db.Canvas.Font.Color:=clWhite
                                  else db.Canvas.Font.Color:=clNavy;
         dx3:=Rect.Left+db.Canvas.TextWidth('Акцiя');
         db.Canvas.TextOut(dx3+((Rect.Right-dx3-db.Canvas.TextWidth(db.DataSource.DataSet.FieldByName('akCena').AsString))div 2),
                           Rect.Top,
                           db.DataSource.DataSet.FieldByName('akCena').AsString);
         db.Canvas.Font.Style:=[];
         db.Canvas.TextOut(dx3+((Rect.Right-dx3-db.Canvas.TextWidth('грн')) div 2),Rect.Top+11,'грн');
        end;
     2:if db.DataSource.DataSet.FieldByName('akCena').AsCurrency>0 then
        begin
         if (gdSelected in State) then db.Canvas.Font.Color:=clWhite
                                  else db.Canvas.Font.Color:=clGreen;
         db.Canvas.TextOut(Rect.Left+((Rect.Right-Rect.Left-db.Canvas.TextWidth('Ц. зi знижкою') )div 2),Rect.Top,'Ц. зi знижкою');

         if (gdSelected in State) then db.Canvas.Font.Color:=clWhite
                                  else db.Canvas.Font.Color:=$00006600;
         sCn:=CurrToStrF(0.01*(100-db.DataSource.DataSet.FieldByName('akCena').AsCurrency)*db.DataSource.DataSet.FieldByName('CenaUp').AsCurrency,ffFixed,2);

         db.Canvas.TextOut(Rect.Left+((Rect.Right-Rect.Left-db.Canvas.TextWidth(sCn+' грн.') )div 2),Rect.Top+11,sCn+' грн.');
        end;
     4:begin
        db.Canvas.Font.Color:=clRed;
        db.Canvas.TextOut(Rect.Left+((Rect.Right-Rect.Left-db.Canvas.TextWidth('Плюс') )div 2),Rect.Top,'Плюс');
        db.Canvas.TextOut(Rect.Left+((Rect.Right-Rect.Left-db.Canvas.TextWidth('подарунок!'))div 2),Rect.Top+11,'подарунок!');
       end;
    end;
    sPr:=db.DataSource.DataSet.FieldByName('sPrioritet').AsString;
    if (db.DataSource.DataSet.FieldByName('akType').AsInteger=0) and (sPr<>'') then
     begin
      if (gdSelected in State) then db.Canvas.Font.Color:=clWhite
                               else db.Canvas.Font.Color:=clBlue;
      db.Canvas.TextOut(Rect.Left+((Rect.Right-Rect.Left-db.Canvas.TextWidth(sPr) )div 2),Rect.Top+6,sPr);
     end;
   finally
    db.Canvas.Font.Color:=tmpF1;
    db.Canvas.Font.Style:=tmpS1;
   end;

//  DrawWithFilter(DataCol,Rect.Left+2,Rect.Top+1,db.DataSource.DataSet.FieldByName('NAMES').AsString,nmFilter,arFilter);
  if DataCol=2 then
   begin
    DrawWithFilter(2,1,0);
    DrawWithFilter(dx2,dy2,1);
   end;

  // проставляем правильные количества
  if (DataCol=6) and (Ostat<>-1) and (Prm.FirmID<>13) then
   begin
    db.Canvas.FillRect(Rect);
    db.Canvas.TextOut(Rect.Right-3-db.Canvas.TextWidth(IntToStr(Ostat)),Rect.Top+2,IntToStr(Ostat));
   end;

  if (DataCol=3) and (Ostat<>-1) and (Prm.FirmID<>13) and (Prm.OptCena=False) then
   begin
    db.Canvas.FillRect(Rect);
    db.Canvas.TextOut(Rect.Right-3-db.Canvas.TextWidth(CurrToStr(StrToCurr(CurrToStrF(Ostat/db.DataSource.DataSet.FieldByName('Upak').AsInteger,ffFixed,1)))),Rect.Top+2,
                                                       CurrToStr(StrToCurr(CurrToStrF(Ostat/db.DataSource.DataSet.FieldByName('Upak').AsInteger,ffFixed,1))));
   end;

{
  if DataCol=12 then
   begin
    PCena:=CurrToStrF(db.DataSource.DataSet.FieldByName('Cena').AsFloat*(100-upPercShow.Position)/100,ffFixed,2);
    db.Canvas.Font.Color:=clOlive;
    db.Canvas.TextOut(Rect.Right-3-db.Canvas.TextWidth(PCena),Rect.Top+2,PCena);
   end;

  if DataCol=13 then
   begin
    PCena:=CurrToStrF(db.DataSource.DataSet.FieldByName('CenaUp').AsFloat*(100-upPercShow.Position)/100,ffFixed,2);
    db.Canvas.Font.Color:=clOlive;
    db.Canvas.TextOut(Rect.Right-3-db.Canvas.TextWidth(PCena),Rect.Top+2,PCena);
   end;
 }

  tmpBColor:=db.Canvas.Brush.Color;

  {--- Рисование значка "Разрешенные для несканирования"}
  if (db.DataSource.DataSet.FieldByName('IsScan').AsInteger<>0) and (DataCol=0) then
   begin
    dR:=Rect;
    dr.Left:=dr.Left+2; dr.Top:=dr.Top+2;
    dr.Right:=dR.Left+imNoScan.Width; dr.Bottom:=dR.Top+imNoScan.Height;
    sR.Left:=0; sR.Top:=0;
    sR.Right:=imNoScan.Width; sR.Bottom:=imNoScan.Height;
    db.Canvas.CopyRect(dR,imNoScan.Canvas,sR);
   end;

  {--- Рисование значка "Есть аннотация"}
  if (DataCol=3) and (db.DataSource.DataSet.FieldByName('IsAnnot').AsInteger=1) then
   try
    dR:=Rect;
    dr.Left:=dr.Left+2; dr.Top:=dr.Top+2;
    dr.Right:=dR.Left+imAnnot.Width; dr.Bottom:=dR.Top+imAnnot.Height;
    sR.Left:=0; sR.Top:=0;
    sR.Right:=imAnnot.Width; sR.Bottom:=imAnnot.Height;

    db.Canvas.CopyRect(dR,imAnnot.Canvas,sR);
//       if (gdSelected in State) then
    Transp(dr);
   except
   end;

  if db.DataSource.DataSet.FieldByName('EndReg').AsInteger>2 then dxr:=20 else dxr:=0;
  IsRec:=False;

  {--- Рисование значка "Рецептура"}
  if (DataCol=2) and (db.DataSource.DataSet.FieldByName('F_NDS').AsInteger=2) and (db.DataSource.DataSet.FieldByName('IsRecipt').AsInteger=0) then
   try
    Inc(dxr,20);
    IsRec:=True;
    db.Canvas.FillRect(Rect);

    if DrawWithFilter(dxr,1,0)=False then
     db.Canvas.TextOut(Rect.Left+dxr, Rect.Top+1,db.DataSource.DataSet.FieldByName('NAMES').AsString)
    else DrawWithFilter(dxr+dx2,dy2,1);

    dR:=Rect;
    dr.Left:=dr.Left+2; dr.Top:=dr.Top+2;
    dr.Right:=dR.Left+imRecipt.Width; dr.Bottom:=dR.Top+imRecipt.Height;
    sR.Left:=0; sR.Top:=0;
    sR.Right:=imRecipt.Width; sR.Bottom:=imRecipt.Height;

    db.Canvas.CopyRect(dR,imRecipt.Canvas,sR);
//    if (gdSelected in State) then
    Transp(dr);
   except
   end;

  {--- Рисование значка "Закончилась регистрация"}
  if (DataCol=2) and (db.DataSource.DataSet.FieldByName('EndReg').AsInteger>2) then
   try
    if IsRec=False then
     begin
      db.Canvas.FillRect(Rect);

      if DrawWithFilter(dxr,1,0)=False then
       db.Canvas.TextOut(Rect.Left+dxr, Rect.Top+1,db.DataSource.DataSet.FieldByName('NAMES').AsString)
      else DrawWithFilter(dxr+dx2,dy2,1);

     end;
    db.Canvas.Pen.Color:=clBlue;
    db.Canvas.Brush.Color:=clYellow;
    db.Canvas.RoundRect(Rect.Left+dxr-18,Rect.Top+3,Rect.Left+dxr-2,Rect.Top+19,5,5);
    db.Canvas.Font.Name:='Arial';
    db.Canvas.Font.Size:=8;
    db.Canvas.Font.Style:=[fsBold,fsItalic];
    db.Canvas.Font.Color:=clBlue;
    db.Canvas.TextOut(Rect.Left+dxr-15,Rect.Top+4,'R');
   except
   end;
  db.Canvas.Brush.Color:=tmpBColor;

  {--- Рисование значка "Есть автозамена"}
{  if (db.DataSource.DataSet.FieldByName('IsMap').AsInteger<>0) and (DataCol=2) then
   try
    dR:=Rect;
    dr.Left:=dr.Right-imAvto.Width-2; dr.Top:=dr.Top+2; dr.Bottom:=dR.Top+imAvto.Height;
    dr.Right:=dr.Right-2;
    sR.Left:=0; sR.Top:=0;
    sR.Right:=imAvto.Width; sR.Bottom:=imAvto.Height;

    db.Canvas.CopyRect(dR,imAvto.Canvas,sR);
//    if (gdSelected in State) then
    Transp(dr);
   except
   end;
}
  {--- Подсветка скидки на сроковые препараты --- }
  if IsS and (db.DataSource.DataSet.FieldByName('SrokSkd').AsInteger>0) and (DataCol=2) then
   try
    dR:=Rect;

    if Prm.IsNewSrok then sSrokSkd:='Ц.со скидк. '+db.DataSource.DataSet.FieldByName('SrokSkd').AsString+'грн'
                     else sSrokSkd:='Скидка '+db.DataSource.DataSet.FieldByName('SrokSkd').AsString+'%';

    db.Canvas.Font.Name:='MS Sans Serif';
    db.Canvas.Font.Size:=10;
    db.Canvas.Font.Style:=[fsBold];
    db.Canvas.Font.Color:=clBlack;

    dr.Left:=dr.Right-db.Canvas.TextWidth(sSrokSkd)-24; dr.Right:=dr.Right-20; dr.Top:=dr.Top+1; dr.Bottom:=dR.Bottom-1;

    db.Canvas.Pen.Color:=clBlack;
    db.Canvas.Brush.Color:=clRed;
    db.Canvas.FillRect(dr);
    db.Canvas.Rectangle(dr);

    db.Canvas.TextOut(dr.Left+2,dr.Top+1,sSrokSkd);

   except
   end;
 End; {dbgSkladDrawColumnCell}

// Раскраска Чека
procedure TMainF.dbgChekDrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
var db:TDBGrid;
    pr:Integer;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  if db.DataSource.DataSet.FieldByName('F_NDS').AsInteger>2 then
   begin
    db.Canvas.Brush.Color:=clBlue;
    db.Canvas.Font.Color:=clWhite;
    db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
   end;
  pr:=db.DataSource.DataSet.FieldByName('PRINTING').AsInteger;

  if pr>0 then
   begin
    if (gdSelected in State) and (DataCol=2) then
     begin
      db.Canvas.Brush.Color:=clNavy;
      db.Canvas.Font.Color:=clWhite;
     end else begin
               Case pr of
                  1:db.Canvas.Brush.Color:=clLime;
                2,3:db.Canvas.Brush.Color:=clYellow;
               end;
               db.Canvas.Font.Color:=clBlack;
              end;
    db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
   end;
 end; {dbgChekDrawColumnCell}

// Блокировка программы и организация смены пользователя
procedure TMainF.miBlockNClick(Sender:TObject);
 begin
  try
   FChangeUser:=False;
   BlockingF:=TBlockingF.Create(Self);
   try
    Application.ProcessMessages;
    BlockingF.ShowModal;
    Case BlockingF.Flag of
     1:begin FChangeUser:=True; Close; end;
     2:Close;
    end;
   finally
    BlockingF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miBlockNClick}

// Переключение скидок
procedure TMainF.SwitchSkd(sb,mi:TObject);
 begin
  if TSpeedButton(sb).Visible then
   if TSpeedButton(sb).Enabled then
    begin
     TMenuItem(mi).Checked:=Not(TMenuItem(mi).Checked);
     TSpeedButton(sb).Down:=TMenuItem(mi).Checked;
     TSpeedButton(sb).Click;
    end;
 end; {SwitchSkd}

// Вызов окна "Настройки"
procedure TMainF.miOptionsClick(Sender:TObject);
 begin
{  if IsPermit([],P_ALERT) then
   try
    OptF:=TOptF.Create(Self);
    try
     OptF.ShowModal;
    finally
     OptF.Free;
    end;
   except
    MessBox(ER_CR_FORM);
   end;
}
 end; {miOptionsClick}

// Запись значения в ини файл любой
function TMainF.WriteToIni(FName:String; F:String; V:Variant):Boolean;
var IniF:TIniFile;
 begin
  try
   IniF:=TIniFile.Create(FName);
   try
    IniF.WriteString(Prm.Prof,F,V);
    Result:=True;
   finally
    IniF.Free;
   end;
  except
   Result:=False;
  end;
 end; {WriteToIni}

// Запись значения в ини файл Prm.OptFile
function TMainF.WriteToIni(F:String; V:Variant):Boolean;
 begin
  Result:=WriteToIni(Prm.OptFile,F,V);
 end; {WriteToIni}

// Читает значение из ини файла в виде строки
function TMainF.ReadFromIni(FName:String; F,Def:String):String;
var IniF:TIniFile;
 begin
  try
   Result:='';
   IniF:=TIniFile.Create(FName);
   try
    Result:=IniF.ReadString(Prm.Prof,F,Def);
   finally
    IniF.Free;
   end;
  except
   Result:='';
  end;
 end; {ReadFromIni}

// Читает значение из ини файла Prm.OptFile в виде строки
function TMainF.ReadFromIni(F,Def:String):String;
 begin
  Result:=ReadFromIni(Prm.OptFile,F,Def);
 end; {ReadFromIni}

procedure TMainF.ShowMovTov(Art_Code:Integer; Names:String);
 begin
  if Art_code<>0 then
   try
    MoveTovF:=TMoveTovF.Create(Self);
    try
     MoveTovF.Caption:=Names;
     MoveTovF.ArtCode:=Art_Code;
     Application.ProcessMessages;
     MoveTovF.ShowModal;
    finally
     MoveTovF.Free;
    end;
   except
    MessBox(ER_CR_FORM);
   end;
 end;

// Вызов окна "Движение товара"
procedure TMainF.miMoveTovClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  ShowMovTov(DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger,'Движение товара - '+DM.spY_FilterSklad.FieldByName('Names').AsString);
 end; {miMoveTovClick}

// Вызов окна "Проверка остатков"
procedure TMainF.miCheckOstClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  ShowOstatCheckF;
 end; {miCheckOstClick}

// Ортировка справочника по наименованию или арт_коду
procedure TMainF.dbgSkladTitleClick(Column: TColumn);
 begin
  if Column=dbgSklad.Columns[0] then SprOrder:=O_ART_CODE else
  if Column=dbgSklad.Columns[2] then SprOrder:=O_NAMES;
 end; {dbgSkladTitleClick}

// Организация поиска в чеке (вручную или со сканера)
procedure TMainF.dbgChekKeyPress(Sender:TObject; var Key:Char);
var IsFind:Boolean;
 begin
  if Sender=nil then Exit;
  if Key in CH_DIGIT then
   begin
    lbCheck.Caption:=lbCheck.Caption+Key;
    lbCheck.Caption:=FindEAN13(TDBGrid(Sender),lbCheck.Caption,SC_CHEK,1,IsFind);
   end;
 end; {dbgChekKeyPress}

// Подсчет сдачи по чеку
procedure TMainF.edCashChange(Sender:TObject);
var sm:Currency;
    ed:TEdit;
 begin
  try
   if Sender=nil then Exit;
   ed:=TEdit(Sender);
   if ed.Text<>'' then
    try
     sm:=StrToCurr(ed.Text)-SumChekFull;
     if sm<0 then lbSumCash.Caption:='0.00'
             else lbSumCash.Caption:=CurrToStrF(sm,ffFixed,2);
    except
     ed.Text:='0';
     lbSumCash.Caption:='0.00';
    end;
  except
  end;
 end; {edCashChange}

// Ввод только цифр и дробных разделителей в окне ввода суммы от покупателя
procedure TMainF.edCashKeyPress(Sender:TObject; var Key:Char);
var S:Set of Char;
 begin
  if (Key='.') or (Key=',') then Key:=GetDivPoint;
  S:=CH_DIGIT;
  Include(S,GetDivPoint);
  try
   if Key in S then StrToCurr(edCash.Text+Key) else
   if Key<>#8 then Abort;
  except
   Key:=#0;
  end;
 end; {edCashKeyPress}

// Ввод суммы с помощью кнопок калькулятора 
procedure TMainF.sb1Click(Sender:TObject);
var sb:TSpeedButton;
 begin
  if Sender=nil then Exit;
  sb:=TSpeedButton(Sender);
  if edCash.Text='' then edCash.Text:='0';
  try
   edCash.Text:=CurrToStr(StrToCurr(edCash.Text)+sb.Tag);
  except
  end;
 end; {sb1Click}

// Кнопка очистки окна ввода суммы от покупателя
procedure TMainF.sbClearClick(Sender:TObject);
 begin
  edCash.Text:='0';
 end; {sbClearClick}

// Вызов окна "ОТЧЕТЫ (Z,&X, внесение/выдача)"
procedure TMainF.miZXClick(Sender:TObject);
 begin
  try
   ZXRepF:=TZXRepF.Create(Self);
   try
    Application.ProcessMessages;
    ZXRepF.ShowModal;
   finally
    ZXRepF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miZXClick}

// Вывод ошибка кассового аппарата если она была
procedure TMainF.ShowErrorEKKA(Res:Boolean);
 begin
  if (Res) and (EKKA.LastError='') then Exit;
  if EKKA.LastError<>'' then
  MessBox(EKKA.LastErrorDescr);
 end; {CheckEKKA}

// Отображение штрих-кода по выбранной позиции
procedure TMainF.ShowEAN13(Source:TDataSet);
 begin
  if Not IsPermit([],P_SILENT) then Exit;
  if Source.IsEmpty then Exit;
  try
   ShowEAN13F:=TShowEAN13F.Create(Self);
   try
    ShowEAN13F.Panel2.Caption:='  '+Source.FieldByName('Art_Code').AsString+' '+Source.FieldByName('Names').AsString;
    DM.qrEAN.Close;
    DM.qrEAN.SQL.Text:='select * from sprean (nolock) where art_code='+Source.FieldByName('Art_Code').AsString+' order by EAN13';
    DM.qrEAN.Open;
    if DM.qrEAN.IsEmpty then
     MessBox('Штрих-код на препарат '+Source.FieldByName('Names').AsString+' отсутствует!')
    else
     Application.ProcessMessages;
     ShowEAN13F.ShowModal;
   finally
    ShowEAN13F.Free;
   end;
  except
   MainF.MessBox(ER_CR_FORM);
  end;
 end; {ShowEAN13}

// Вызов окна Штрих-кодов выбранного товара
procedure TMainF.miEAN13InfoClick(Sender:TObject);
 begin
  if dbgSklad.Focused then ShowEAN13(dbgSklad.DataSource.DataSet) else
  if dbgChek.Focused then ShowEAN13(dbgChek.DataSource.DataSet);
 end; {miEAN13InfoClick}

// Выгрузка конкретного файла для флешки со всеми проверками
function TMainF.UnLoadFile(P:Integer; Path:String):Boolean;
var Pth,FN:String;
    sl:TStringList;
    i:Integer;
    A:TStrArray;
 begin
  try
   ForceDirectories(Path);
   Pth:=Copy(WorkPath,3,Length(WorkPath));
   if IsServer then
    DeleteFile(WorkPath+'\ARH\'+FN)
   else
    DeleteFile('\\'+Prm.ServerKompName+Pth+'\ARH\'+FN);

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('exec spY_UnLoad '+IntToStr(P)+','''+Opt.ServerWorkPath+'ARH\'',999,5 ,'''+Opt.BaseUser+''','''+Opt.BasePassw+'''');
   DM.Qr.ExecSQL;

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select Max(FName) as FName from FileList (nolock) where Num='+IntToStr(P);
   DM.Qr.Open;
   FN:=DM.Qr.FieldByName('FName').AsString+IntToStr(Prm.AptekaID)+'.txt';

   if IsServer then
    CopyFile(PChar(WorkPath+'\ARH\'+FN),PChar(Path+FN),False)
   else
    CopyFile(PChar('\\'+Prm.ServerKompName+Pth+'\ARH\'+FN),PChar(Path+FN),False);

   if Not FileExists(Path+FN) then Abort;
   if P=20 then
    try
     sl:=TStringList.Create;
     try
      sl.LoadFromFile(Path+FN);
      FMistake:=False;
      FMistakes:=[];
      for i:=0 to sl.Count-1 do
       begin
        GetStrArray(sl[i],A,['|']);
        if A[1]='Период' then Continue;
        if A[2]<>'OK' then
         begin
          Mistake:=True;
          Include(FMistakes,i);
         end;
       end;
     finally
      sl.Free;
     end;
    except
    end;
   Result:=True;
  except
   Result:=False;
  end;
 end; {UnLoadFile}

// Проверка выгрузки файлов
function TMainF.CheckUnLoad(Path:String):String;
var i:Integer;
 begin
  Result:='';
  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select * from FileList (nolock) order by Num';
  DM.QrEx.Open;
  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    if DM.QrEx.FieldByName('Requir').AsInteger=1 then
     if Not(FileExists(Path+DM.QrEx.FieldByName('FName').AsString+IntToStr(Prm.AptekaID)+'.txt')) then Result:=Result+'Не выгрузился файл "'+DM.QrEx.FieldByName('Descr').AsString+'"'+#10;
   end;
 end; {ChekUnLoad}

// Выгрузка всех остатков
procedure TMainF.UnLoadFiles(Path:String);
var i:Integer;
 begin
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select * from FileList (nolock) order by Num';
   DM.QrEx.Open;
   pbUnLoad.Position:=0;
   pbUnLoad.Max:=DM.QrEx.RecordCount;
   pbUnLoad.Visible:=True;
   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;
     UnLoadFile(DM.QrEx.FieldByName('Num').AsInteger,Path);
     ShowStatus('Выгружаются: "'+DM.QrEx.FieldByName('Descr').AsString+'"',2);
     pbUnLoad.Position:=i+1;
     Application.ProcessMessages;
    end;
  finally
   pbUnLoad.Visible:=False;
   ShowStatus(Prm.Kurator,2);
  end;
  pbUnLoad.Visible:=False;
 end; {UnLoadFiles}

// Отправка почты
procedure TMainF.SendMail;
var i:Integer;
    FL:String;
 begin
  try
   ShowStatus('Подготовка информации для отправки...');
   UnLoadFiles(WorkPath+'\Mail\');
   SMTP.Host:=Opt.SMTPHost;
   SMTP.Port:=Opt.SMTPPort;
   With IdMessage do
    begin
     Body.Text:=' ';
     From.Text:='apteka@ukr.net';
     Recipients.EMailAddresses:=Opt.EMailAddress;
     Subject:=Prm.AptName+' za '+FormatDateTime('dd.mm.yyyy hh:nn:ss',Now);
     DM.QrEx.Close;
     DM.QrEx.SQL.Text:='select * from FileList (nolock) order by Num';
     DM.QrEx.Open;
     for i:=1 to DM.QrEx.RecordCount do
      begin
       if i=1 then DM.QrEx.First else DM.QrEx.Next;
       if DM.QrEx.FieldByName('Requir').AsInteger=1 then
        begin
         FL:=WorkPath+'\Mail\'+Dm.QrEx.FieldByName('FName').AsString+IntToStr(Prm.AptekaID)+'.txt';
         if FileExists(FL) then TIdAttachment.Create(IdMessage.MessageParts,FL);
        end;
      end;
    end;
   ShowStatus('Установка соединения с SMTP-сервером!');
   SMTP.Connect;
   try
    ShowStatus('Идет отправка почты. Подождите...');
    SMTP.Send(IdMessage);
   finally
    SMTP.Disconnect;
   end;
   MainF.MessBox('Почта отправлена!',64);
  except
   on E:Exception do MainF.MessBox('Ошибка отправки почты: '+E.Message);
  end;
  ShowStatus('');
 end; {SendMail}

// Копирует текстовые файлики лога робивки по ЕККА за текущий период
procedure TMainF.CopyTextLog(Path:String);
var FromP,ToP:String;
    sr:TSearchRec;

 function ExtractDate(S:String):TDateTime;
 var ss:String;
  begin
   ss:=Copy(S,8,8);
   Result:=StrToDate(Copy(ss,1,2)+'.'+Copy(ss,3,2)+'.'+Copy(ss,5,4));
  end;

 Begin
  try
   FromP:=WorkPath+'\Txt';
   ToP:=Path+'TextLog\';
   ForceDirectories(Path+'TextLog\');
   DelDir(ToP+'*');
   if FindFirst(FromP+'\Kassa'+IntToStr(Opt.KassaID)+'*.txt', faArchive,sr)=0 then
    begin
     Repeat
      try
       if (ExtractDate(sr.Name)>=BegPeriod) and (ExtractDate(sr.Name)<=EndPeriod) then
        CopyFile(PChar(FromP+'\'+sr.Name),PChar(ToP+sr.Name),False);
      except
      end;
     Until FindNext(sr)<>0;
     FindClose(sr);
    end;
  except
  end;
 End; {CopyTextLog}

// Выгрузка базы каждого второго числа месяца
procedure TMainF.PrepareBase;
 begin
// if (FormatDateTime('dd',Date)='02') or (Mistake=True) then
  try
   pnUnBase.Visible:=True;
   UnLoadBase(DM.Qr,Opt.FlashPath,False);
   if 1 in Mistakes then CopyTextLog(Opt.FlashPath);
   Delay(3);
  finally
   pnUnBase.Visible:=False;
  end;
 end; {PrepareBase}

// Выгрузка различных данных на флешку
procedure TMainF.UnLoadToFlash(P:Integer);
var Path,Mess,S:String;
    bt:Integer;
 begin
  if Not DirectoryExists(Opt.FlashPath) then
   MessBox('                              Вставте флешку!                                ',64);
  bt:=0;
  Repeat
   if Not DirectoryExists(Opt.FlashPath) then
   if MessBox('Флешка не найдена! Вставтье флешку в исправный разъем и нажмите "Да"'+
              #10+' Нажмите "Нет" для отмены выгрузки остатков.',52)=ID_NO then Exit
   else else Break;
  Until False;
  Case P of
   UN_BASE:begin
            if UnLoadBase(DM.Qr,Opt.FlashPath,False) then
             begin
              bt:=64;
              Mess:='                  База выгружена успешно!                  ';
             end else begin bt:=48; Mess:='Ошибка выгрузки базы!'; end;
           end;
   UN_ARHO:begin
            Path:=Opt.FlashPath+FormatDateTime('dd.mm.yy',Date)+'\';
            ExecScript(Opt.FlashPath+'\SQLScript'+IntToStr(Prm.AptekaID)+'.sql');
            UnLoadFiles(Path);
            if Prm.FirmID=5 then UnLoadFor271(StrToDate(DateToStr(Date-15)),Date,Path);
            CopyArh(Opt.FlashPath);
            S:=CheckUnLoad(Path);
            if MessBox('Выгружать базу на флешку?',52)=ID_YES then PrepareBase;
            if S<>'' then begin
                           Mess:=S; bt:=48;
                          end else begin
                                    bt:=64;
                                    Mess:='                  Все выгружено успешно!                  ';
                                   end;
           end;
  end;
  Delay(5);
  //EjectUSB;
  MainF.MessBox(Mess,bt);
 end; {UnLoadToFlash}

// Пункт меню "Выгрузить все на флешку"
procedure TMainF.miUnloadFlashClick(Sender:TObject);
 begin
  if (Time>StrToTime('22:00:00')) and (Time<=StrToTime('23:59:59')) then pnFlash.Visible:=True;
  try
   UnLoadToFlash(UN_ARHO);

  finally
   pnFlash.Visible:=False;
  end;
 end; {miUnloadFlashClick}

// Пункт меню "Проверка сумм по Z-отчетам"
procedure TMainF.miCheckSumZClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  ShowSumZ;
 end; {miCheckSumZClick}

// Пункт меню "История накладных"
procedure TMainF.miHistoryClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   ViewNaklF:=TViewNaklF.Create(Self);
   try
    Application.ProcessMessages;
    ViewNaklF.ShowModal;
   finally
    ViewNaklF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miHistoryClick}

// Поиск по вхождению в справочнике товара выбраной позиции 
procedure TMainF.cbFindCloseUp(Sender:TObject);
 begin
  try
   if Not(DM.qrFind.IsEmpty) then
    begin
     DM.qrFind.First;
     DM.qrFind.MoveBy(cbFind.ItemIndex);
     dbgSklad.DataSource.DataSet.Locate('Art_Code',DM.qrFind.FieldByName('Art_Code').AsInteger,[loCaseInsensitive,loPartialKey]);
    end;
  finally
   EscFind;
  end;
 end; {cbFindCloseUp}

procedure TMainF.cbFindEnter(Sender:TObject);
 begin
  if Not (cbFind.DroppedDown) then cbFind.DroppedDown:=False;
 end; {cbFindEnter}

// Отмена поиска по вхождению
procedure TMainF.EscFind;
 begin
  cbFind.Visible:=False;
//  if dbgSklad.Enabled then dbgsklad.SetFocus;
  dbgSkladSetFocused;
 end; {EscFind}

// Обработчик нажатия кнопок в окне поиска по вхождению
procedure TMainF.cbFindKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key=VK_ESCAPE then EscFind;
 end; {cbFindKeyDown}

// Если фокус ввода из окна поиска по входжению переключился на другой контрол
procedure TMainF.cbFindExit(Sender:TObject);
 begin
  EscFind;
 end; {cbFindExit}

// Пункт меню "Поиск по вхождению"
procedure TMainF.miFindExClick(Sender:TObject);
var i:Integer;
 begin
  try
   EnterStrF:=TEnterStrF.Create(Self);
   try
    Application.ProcessMessages;
    EnterStrF.ShowModal;
    if EnterStrF.Flag=1 then
     begin
      DM.qrFind.Close;
      DM.qrFind.SQL.Clear;
      DM.qrFind.SQL.Add('select Art_Code,Names,Type_Tov');
      DM.qrFind.SQL.Add('from SprTov (nolock) ');
      DM.qrFind.SQL.Add('where names like ''%'+EnterStrF.edStr.Text+'%'' ');
      if cbBoxZero.Checked then
       DM.qrFind.SQL.Add('and ostat>0');
      DM.qrFind.SQL.Add('group by Art_Code,Names,Type_Tov');
      DM.qrFind.SQL.Add('order by Names ');
      DM.qrFind.Open;

      if DM.qrFind.RecordCount<=0 then Exit;
      cbFind.Clear;
      for i:=1 to DM.qrFind.RecordCount do
       begin
        if i=1 then DM.qrFind.First else DM.qrFind.Next;
        cbFind.Items.Add(DM.qrFind.FieldByname('Names').AsString);
       end;
      cbFind.Visible:=True;
      cbFind.SetFocus;
      cbFind.ItemIndex:=0;
      cbFind.DroppedDown:=True;
     end;
   finally
    EnterStrF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miFindExClick}

// Пункт меню "Пробитие оптовой суммы"
procedure TMainF.miOptSumClick(Sender:TObject);
 begin
  if Not(IsPermit([R_ADMIN],P_ALERT)) then Exit;
  try
   OptSumF:=TOptSumF.Create(Self);
   try
    OptSumF.Flag:=SM_OPT;
    Application.ProcessMessages;
    OptSumF.ShowModal;
   finally
    OptSumF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miOptSumClick}

// Пункт меню "Выгрузить базу на флешку"
procedure TMainF.miUnloadBaseClick(Sender:TObject);
 begin
  UnLoadToFlash(UN_BASE);
 end; {miUnloadBaseClick}

// Пункт меню "Заявка"
procedure TMainF.miZakazClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  ShowZakazF;
 end; {miZakazClick}

// Пункт контекстного меню "Добавить позицию в отказы"
procedure TMainF.miAddOtkazClick(Sender:TObject);
var DefKol,Tg,Flag,Kol,Art_Code,id_zam:Integer;
    Cap,Names,Cena,Mess,Phone:String;
    IsLgot:Boolean;
    Cena_Site:Currency;
 begin
  if Sender=nil then Exit;
  Tg:=TMenuItem(Sender).Tag;
  Flag:=0;
  Art_Code:=0;
  Names:='';
  IsLgot:=Prm.FirmID in [14..17];
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select cena_site from Plist where art_code='+DM.spY_FilterSklad.FieldByName('Art_Code').AsString;
   DM.Qr.Open;
   Cena_Site:=DM.Qr.FieldByName('cena_site').AsCurrency;


 {  if (Tg=0) and (OstatED=0) and (IsLgot=False) then
    begin
     Flag:=1;
     Cena:=CurrToStr(DM.spY_FilterSklad.FieldByName('Cena').AsCurrency);
     Art_Code:=DM.spY_FilterSklad.FieldByName('Art_code').AsInteger;
     Names:=DM.spY_FilterSklad.FieldByName('Names').AsString;
    end else}
   if Tg=2 then
    begin
     Flag:=3;
     Cena:=CurrToStr(Cena_Site);
    end else
    begin
     PrOtkazF:=TPrOtkazF.Create(Self);
     try
      if IsLgot then PrOtkazF.rb4.Caption:='По льгот. рец.';
      PrOtkazF.rb4.Visible:=False; //Prm.AptekaSklad or IsLgot;

      PrOtkazF.Tp:=Tg;
      PrOtkazF.Label4.Caption:='Цена аптеки: '+CurrToStrF(Cena_Site,ffFixed,2)+' грн.';
      Application.ProcessMessages;
      PrOtkazF.ShowModal;
      if PrOtkazF.Flag=0 then Exit;
      Mess:=PrOtkazF.Mess;
      Flag:=PrOtkazF.Flag;
      if IsEmptyPhone(PrOtkazF.edPhone.Hint) then Phone:='' else Phone:=PrOtkazF.edPhone.Text;
      if Tg=1 then
       begin
        Names:=PrOtkazF.edName.Text;
        Art_Code:=PrOtkazF.edName.Tag;
       end;
      if Flag in [1,3] then
       begin
        if Tg=1 then Cena:='0'
                else Cena:=CurrToStr(Cena_Site);
        end else Cena:=CurrToStrF(PrOtkazF.Cena,ffFixed,2);
     finally
      PrOtkazF.Free;
     end;
    end;

  except
   MessBox(ER_CR_FORM);
  end;

  if (Flag=4) and (IsLgot=False) then
   begin
    DefKol:=DM.spY_FilterSklad.FieldByName('Upak').AsInteger*3-OstatED;
    if DefKol<0 then DefKol:=0;
   end else DefKol:=DM.spY_FilterSklad.FieldByName('Upak').AsInteger;

  if Tg=1 then
   begin
    Kol:=GetKolFromDialog(TrimRight(Names),DefKol,Art_Code,id_zam,EN_SIMPLE);
   end else begin
             if DM.spY_FilterSklad.IsEmpty then Exit;
             if Tg=0 then Cap:='Сколько заказать';
             Kol:=GetKolFromDialog(TrimRight(DM.spY_FilterSklad.FieldByName('Names').AsString),DefKol,Art_Code,id_zam,EN_SIMPLE,0,0,Cap);
             Art_Code:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;
            end;


  if (Kol<0) or ((Kol=0) and (Flag=3)) then Exit;

{
  if Flag=2 then
   try
    SimpleMessF:=TSimpleMessF.Create(Self);
    try
     SimpleMessF.Silent:=True;
     SimpleMessF.reW.Text:=Mess;
     SimpleMessF.BitBtn3Click(nil);
    finally
     SimpleMessF.Free;
    end;
   except
    on E:Exception do MainF.MessBox('Ошибка отправки сообщения: '+E.Message);
   end;
}
  // Оптовые отказы
  if Flag=4 then
   try
    DM.Qr.Close;
    DM.Qr.SQL.Text:='exec spY_AddOtkazOpt :art, :kol, :idu  select 951 as Res';
    DM.Qr.Parameters.ParamByName('art').Value:=Art_Code;
    DM.Qr.Parameters.ParamByName('kol').Value:=Kol;
    DM.Qr.Parameters.ParamByName('idu').Value:=Prm.ID_Gamma;
    DM.Qr.Open;
   except
    on E:Exception do
     MessBox('Ошибка добавления позици в отказы: '+E.Message);
   end;

  if (Flag=4) and (IsLgot=False) then Exit;
  try

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('declare @rl int');
   DM.Qr.SQL.Add('select @rl=IsNull(Sum(kol),0) ');
   DM.Qr.SQL.Add('from ExpCheks a (nolock), SprTov b (nolock) ');
   DM.Qr.SQL.Add('where a.kol>0 and a.kod_name=b.kod_name and ');
   DM.Qr.SQL.Add('      a.date_chek>getdate()-30 and ');
   DM.Qr.SQL.Add('      b.art_code='+IntToStr(Art_Code)  );
   DM.Qr.SQL.Add('select @rl=IsNull(Sum(kol),0) ');
   DM.Qr.SQL.Add('from ArhCheks a (nolock), SprTov b (nolock) ');
   DM.Qr.SQL.Add('where a.kol>0 and a.kod_name=b.kod_name and ');
   DM.Qr.SQL.Add('      a.date_chek>getdate()-30 and  ');
   DM.Qr.SQL.Add('      b.art_code='+IntToStr(Art_Code)  );
   DM.Qr.SQL.Add('declare @cn int');
   DM.Qr.SQL.Add('select @cn=IsNull(Count(*),0) from Otkaz (nolock) where art_code='+IntToStr(Art_Code));
   DM.Qr.SQL.Add('                                           and date_otkaz='''+FormatDateTime('yyyy-mm-dd',Date)+' 00:00:00''');

  // if Flag=3 then Flag:=1;
   DM.Qr.SQL.Add(' Insert into Otkaz(date_otkaz,art_code,realiz,otkaz,priznak,cena,names,id_user,Phone)   ');
   DM.Qr.SQL.Add(' Values(getdate(), ');
   DM.Qr.SQL.Add('dbo.GetOriginalArt('+IntToStr(Art_Code)+'), ');
   DM.Qr.SQL.Add(' @rl,');
   DM.Qr.SQL.Add(IntToStr(Kol)+','+IntToStr(Flag)+','+Cena+','''+Names+''','+IntToStr(Prm.UserID)+','''+Phone+''')');
   DM.Qr.SQL.Add('select 9999 as Res');

//   DM.Qr.SQL.SaveToFile('C:\log\otkaz.txt');
   DM.Qr.Open;
   {
    if Tg=1 then
     MessBox('Позиция "'+TrimRight(Names)+'" в таблицу отказов добавлена!',64)
    else
     MessBox('Позиция "'+TrimRight(DM.spY_FilterSklad.FieldByName('Names').AsString)+'" в таблицу отказов добавлена!',64)
   }
  except
   on E:Exception do
    MessBox('Ошибка добавления позици в отказы: '+E.Message);
  end;
 end; {miAddOtkazClick}

// Пункт меню "Движение денег по кассе"
procedure TMainF.miMoveMoneyClick(Sender:TObject);
 begin
  try
   MoveMoneyF:=TMoveMoneyF.Create(Self);
   try
    Application.ProcessMessages;
    MoveMoneyF.ShowModal;
   finally
    MoveMoneyF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miMoveMoneyClick}

// Пункт меню "Информация о карточке"
procedure TMainF.miCardInfoClick(Sender:TObject);
 begin
  try
   ShowCardInfoF:=TShowCardInfoF.Create(Self);
   try
    Application.ProcessMessages;
    ShowCardInfoF.ShowModal;
   finally
    ShowCardInfoF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miCardInfoClick}

// Кнопка "Печать ценников по чеку"
procedure TMainF.btPrCennikClick(Sender:TObject);
 begin
  ShowWorkSprF(W_CENNIK);
 end; {btPrCennikClick}

// Пункт меню "Отказы"
procedure TMainF.miOtkazClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   OtkazF:=TOtkazF.Create(Self);
   try
    Application.ProcessMessages;
    OtkazF.ShowModal;
   finally
    OtkazF.Free;
    OtkazF:=nil;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miOtkazClick}

// Пункт меню "Неотсканированные позиции"
procedure TMainF.miNoScanClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   NoScanF:=TNoScanF.Create(Self);
   try
    Application.ProcessMessages;
    NoScanF.ShowModal;
   finally
    NoScanF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miNoScanClick}

function TMainF.ShowATC(Art_Code:Integer; Names:String; P:Byte=0):Byte;
 begin
  Result:=0;
  ShowATCF:=TShowATCF.Create(Self);
  try
   ShowATCF.lbName.Caption:=DM.spY_FilterSklad.FieldByName('Names').AsString;
   ShowATCF.lbName.Tag:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;

//   if P=1 then ShowATCF.SpeedButton1.Down:=True;
//   ShowATCF.ReOpen('a.Names');

{
   if (P=1) and (ShowATCF.qrA.IsEmpty) then
    begin
     ShowATCF.SpeedButton1.Down:=False;
     ShowATCF.ReOpen('a.Names');
    end;
}
   DM.Qr.Close;
   DM.Qr.SQL.Text:='insert into F8Log(dt,done,id_user,art_code) values(getdate(),1,'+IntToStr(Prm.UserID)+','+IntToStr(ShowATCF.lbName.Tag)+')';
   DM.Qr.ExecSQL;

   Application.ProcessMessages;
   ShowATCF.ShowModal;
   if ShowATCF.IsFind then
    begin
     if dbgSklad.DataSource.DataSet.Locate('Art_Code',ShowATCF.Art_Code,[loCaseInsensitive,loPartialKey]) then Result:=1 else
     if IsFiltered then
      begin
       ClearFilters;
       if dbgSklad.DataSource.DataSet.Locate('Art_Code',ShowATCF.Art_Code,[loCaseInsensitive,loPartialKey]) then Result:=1;
      end;
    end else Result:=2;

  finally
   ShowATCF.Free;
  end;
 end;

// Вызов окна ATC-кодов для выбранной позиции товара
procedure TMainF.miATC1Click(Sender:TObject);
 begin
  if DM.spY_FilterSklad.IsEmpty then Exit;
  try
   ShowATC(DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger,DM.spY_FilterSklad.FieldByName('Names').AsString);
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику ATC кодов: '+E.Message);
  end;
 end; {miATC1Click}

function TMainF.CheckPereuchet:Boolean;
 begin
  try
   Result:=True;
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from PereuchetActive';
   DM.Qr.Open;
   if DM.Qr.FieldByName('Active').AsInteger=1 then Abort;
  except
   MainF.MessBox('Идет переучет!');
   Result:=False;
  end;
 end;

// Пункт меню "Печать остатков"
procedure TMainF.miPrintOstClick(Sender:TObject);
 begin
  if Not CheckPereuchet then Exit;

  if Not CheckPassword(GetPasswRep) then Exit;
  try
   RepOstatF:=TRepOstatF.Create(Self);
   try
    Application.ProcessMessages;
    RepOstatF.ShowModal;
   finally
    RepOstatF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miPrintOstClick}

// Пункт меню "Загрузка накладных"
procedure TMainF.miLoadClick(Sender:TObject);
 begin
  LoadNaklF:=TLoadNaklF.Create(Self);
  try
   Application.ProcessMessages;
   LoadNaklF.ShowModal;
   if MainF.Design=False then FilterSklad;
  finally
   LoadNaklF.Free;
  end;
 end; {miLoadClick}

function TMainF.CheckForReoc(NList:TNList):Boolean;
var i:Integer;
    S:String;
 begin
  try

   if High(NList)<=-1 then begin Result:=True; Exit; end;

   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
{
   DM.QrEx.SQL.Add('select s.Users');
   DM.QrEx.SQL.Add('from SprUser s (nolock), Chek c (nolock)');
   DM.QrEx.SQL.Add('where s.id=c.id_user and');

   DM.QrEx.SQL.Add('      art_code in (select a.art_code');
   DM.QrEx.SQL.Add('                   from TmpNakl a (nolock), SprTov b (nolock) ');
   DM.QrEx.SQL.Add('                   where /*a.NReady=1 and */ a.art_code=b.art_code and a.cena<>b.cena group by a.art_code /* union select art_code from Karantin (nolock) where IsNull(Done,0)=0 group by art_code */ )');

   DM.QrEx.SQL.Add('group by s.Users');
   DM.QrEx.SQL.Add('order by 1');
 }

   DM.QrEx.SQL.Add('if Object_ID(''tempdb..#NaklList'') is not null drop table #NaklList ');
   DM.QrEx.SQL.Add('select top 0 nn_nakl,date_nakl into #NaklList from TmpNakl ');

   for i:=Low(NList) to High(NList) do
    DM.QrEx.SQL.Add(' insert into #NaklList(nn_nakl,date_nakl) values('''+NList[i].NN_nakl+''','''+FormatDateTime('yyyy-mm-dd',NList[i].Date_Nakl)+''')');

   DM.QrEx.SQL.Add('exec spY_CheckChekForReoc ');

   DM.QrEx.Open;
   S:='Для загрузки накладных следующие пользователи должны закрыть чеки:'+#10;
   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;
     S:=S+#10+'   - '+DM.QrEx.FieldByName('Users').AsString;
    end;
   if Not DM.QrEx.IsEmpty then Abort;
   Result:=True;
  except
   Result:=False;
   MainF.MessBox(S);
  end;
 end;

// Пункт меню "Отчет пореализации"
procedure TMainF.miRepRealizClick(Sender:TObject);
var tOpl,Art,i:Integer;
    CP:TChekPos;
    Sm:Real;
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   RealizRepF:=TRealizRepF.Create(Self);
   try
    Repeat
    Application.ProcessMessages;
    RealizRepF.ShowModal;
    if RealizRepF.Flag=1 then
     begin
      if DM.spY_ChekList.FieldByName('kassa_num').AsString='Нал.' then tOpl:=4 else
      if DM.spY_ChekList.FieldByName('kassa_num').AsString='Безнал.' then tOpl:=2 else
       begin
        ShowMessage('Неизвестный тип оплаты!');
        Exit;
       end;
      DM.ADOCo.BeginTrans;
      try
       EKKA.fpCancelFiscalReceipt;
       if EKKA.ReceiptNumber<0 then Abort;
       CP.NumbChek:=EKKA.ReceiptNumber+1;
       if Not EKKA.fpOpenFiscalReceipt then
        begin
         MessBox('Не выполнилась открытие нового чека!'+#10+
                 '_______________________________________________________________'+#10#10+EKKA.LastErrorDescr);
         Abort;
        end;
       for i:=1 to DM.spY_ShowChek.RecordCount do
        begin
         if i=1 then DM.spY_ShowChek.First else DM.spY_ShowChek.Next;
         if DM.spY_ShowChek.FieldByName('Kol').AsInteger*DM.spY_ShowChek.FieldByName('Cena').AsCurrency<=0 then Continue;

         Sm:=DM.spY_ShowChek.FieldByName('SumSkd').AsCurrency;
         DM.QrEx.Close;
         DM.QrEx.SQL.Clear;
         DM.QrEx.SQL.Add('select f_nds,convert(numeric(8,2),'+CurrToStrF(Sm,ffFixed,2)+') as SumSkd from SprTov (nolock) where kod_name='+DM.spY_ShowChek.FieldByName('Kod_Name').AsString);
         DM.QrEx.Open;
         if EKKA.TypeEKKA in [EKKA_EXELLIO,EKKA_FP2000] then Art:=DM.spY_ShowChek.FieldByName('Art_Code').AsInteger else Art:=0;

         if Not EKKA.fpAddSale(DM.spY_ShowChek.FieldByName('Art_Code').AsString+' '+
                               DM.spY_ShowChek.FieldByName('Names').AsString,
                               DM.spY_ShowChek.FieldByName('Kol').AsInteger,
                               DM.spY_ShowChek.FieldByName('Cena').AsCurrency,
                               1,
                               Art,
                               DM.QrEx.FieldByName('F_NDS').AsInteger,
                               -DM.spY_ShowChek.FieldByName('SumSkd').AsCurrency,
                               ''
                              ) then AbortM(EKKA.LastErrorDescr);

        end;

       if DM.spY_ShowChek.FieldByName('Skd').AsCurrency>0 then
        EKKA.fpServiceText(1,1,1,'Знижка: '+IntToStr(Round(DM.spY_ShowChek.FieldByName('Skd').AsCurrency))+'%');
       //if Not EKKA.fpCloseFiscalReceipt(DM.spY_ChekList.FieldByName('Summa').AsCurrency,tOpl) then AbortM(EKKA.LastErrorDescr);
       if Not EKKA.fpCloseFiscalReceipt(DM.spY_ChekList.FieldByName('Summa').AsCurrency,tOpl,0,0,false,0,StrToIntDef(MainF.RRN,1),MainF.BankCard) then AbortM(EKKA.LastErrorDescr);

       DM.QrEx.Close;
       DM.QrEx.SQL.Clear;
       DM.QrEx.SQL.Add('declare @n int, @v bigint');
       DM.QrEx.SQL.Add('set @n='+DM.spY_ChekList.FieldByName('Numb_Chek').AsString);
       DM.QrEx.SQL.Add('set @v='+DM.spY_ChekList.FieldByName('Vzh').AsString);
       DM.QrEx.SQL.Add('update ArhCheks set SumSkdK=0, id_kassa='+IntToStr(Opt.KassaID)+' , Numb_chek='+IntToStr(CP.NumbChek)+', Vzh='+IntToStr(EKKA.VzhNum)+' /*,date_chek=getdate()*/ where numb_chek=@n and vzh=@v');
       DM.QrEx.ExecSQL;
       RealizRepF.FilterRealiz;
       DM.ADOCo.CommitTrans;
//       RealizRepF.ShowModal;
      except
       DM.ADOCo.RollbackTrans;
//       RealizRepF.ShowModal;
      end;
     end;
   Until RealizRepF.Flag<>1;

   finally
    TryWriteToJournal;
    RealizRepF.Free;
   end;
  except
   on E:Exception do MessBox('Ошибка открытия отчета: '+E.Message);
  end;
 end; {miRepRealizClick}

// Пункт меню Оформить предоплату
procedure TMainF.miPrevClick(Sender:TObject);
 begin

{

  ShowText('Заключение договора купли-продажа и получение задатка(предоплаты) производится  исключительно  с разрешения Николенко Е.В. (по тел.:7385740, 7386088, 7399915.  Разрешение на получение предоплаты или отказ дается в телефонном режиме.'
            +#10#10'После получения разрешения оформить с покупателем договор купли-продажи в двух экземплярах - внести паспортные данные покупателя. Покупатель ДОЛЖЕН ПОДПИСАТЬ ОБЯЗАТЕЛЬНО ДОГОВОР (один экз. договора вручить покупателю)');

}

  ShowText('После получения разрешения оформить с покупателем договор купли-продажи в двух экземплярах - внести паспортные данные покупателя. Покупатель ДОЛЖЕН ПОДПИСАТЬ ОБЯЗАТЕЛЬНО ДОГОВОР (один экз. договора вручить покупателю)');

  try
   OptSumF:=TOptSumF.Create(Self);
   try
    OptSumF.Flag:=SM_PREP;
    Application.ProcessMessages;
    OptSumF.ShowModal;
   finally
    OptSumF.Free;
   end;

  except
   MessBox(ER_CR_FORM);
  end;
  
 end; {miPrevClick}

// Возврат от покупателя
procedure TMainF.miBackClick(Sender:TObject);
var VF:TVozrForm;
    FIO,DateR:String;
    Dt:TDateTime;
 begin
   DM.QrEx.Close;
   DM.QrEx.SQl.Text:='select IsNull((select Value from Spr_Const (nolock) where Descr=''NotBackClient''),0) as Value';
   DM.QrEx.Open;
   if DM.QrEx.FieldByName('Value').AsInteger=1 then
    begin
     MessBox('Извините! Возвраты от покупателя временно запрещены!');
     Exit;
    end;

 //  if Not ((Prm.AptekaID=4) and (Opt.KassaID=5)) then
   Dt:=Date;
   if Prm.UserRole=R_ADMIN then
    if Not GetDiagDate1(Dt) then Exit;

   if Opt.EKKAAsPrinter=False then
    begin
     try
      ShowBackClInstructF:=TShowBackClInstructF.Create(Self);
      try
       Application.ProcessMessages;
       ShowBackClInstructF.ShowModal;
      finally
       ShowBackClInstructF.Free;
      end;
     except
     end;

//     if MessBox('Напечатать бланк "Согласие на сбор и обработку персональных данных"',52)<>ID_YES then Exit;
    {
     try

      FormForVozrF:=TFormForVozrF.Create(Self);
      try
       FormForVozrF.ShowModal;
       if FormForVozrF.Flag<>1 then  Exit;
       VF:=FormForVozrF.VF;
      finally
       FormForVozrF.Free;
      end;

     except
      Exit;
     end;

     FIO:=VF.F+' '+VF.N+' '+VF.O;
     DateR:=DateToStr(VF.DateR);

     FB.NumCard:=0;
     FB.FIO:=FIO;
     FB.DateR:=DateR;
     FB.Dt:=0;
    }

//     PrintBlankForRegCard(0,FIO,DateR,Dt);

    end;

{

  VF.F:='Васильчук';
  VF.N:='Олег';
  VF.O:='Николаевич';
  VF.A:='г. Харьков, ул. Грицевца,2';
  VF.Pr:='аллергия';
  VF.Z:='Булах Юлий Евгеньевич';
  VF.PaspS:='МН';
  VF.PaspN:='327096';
  VF.PaspD:=StrToDate('29.11.99');
  VF.PaspT:='паспорт';
  VF.PaspV:='Орджоникидзевским РВ УМВС Украины';
  VF.DateR:=StrToDate('29.11.78');
  PrintBlankForBack(VF);

}

  try
   BackClientF:=TBackClientF.Create(Self);
   try
    BackClientF.VF:=VF;
    BackClientF.Dt:=Dt;
    BackClientF.dtChekDate.Date:=BackClientF.Dt;
    Application.ProcessMessages;
    BackClientF.ShowModal;
   finally
    BackClientF.Free;
    BackClientF:=nil;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miBackClick}

// Установка соединения с интернетом и отправка почты
procedure TMainF.miSendMailClick(Sender:TObject);
var F:Boolean;
 begin
{  if Prm.AptekaID=28 then Exit;
  F:=InternetAutodial(INTERNET_AUTODIAL_FORCE_UNATTENDED,Handle);
  if Not (F) then begin MainF.MessBox('Соединение с интернет не установлено! Попробуйте еще раз.'); Exit; end;
  MainF.miSendMail.Enabled:=False;
  try
   SendMail;
  finally
   InternetAutodialHangup(0);
   MainF.miSendMail.Enabled:=True;
  end;
}
 end; {miSendMailClick}


// Полная обработка копирования истории выгрузки остатков
procedure TMainF.CopyArh(Path:String);
var Dir,FromPath:String;
    i:Integer;
 begin
  FromPath:=WorkPath+'\Arh\';
  for i:=0 to 6 do
   begin
    Dir:=FormatDateTime('dd.mm.yy',Date-i)+'\';
    if Not (DirectoryExists(FromPath+Dir)) then Continue;
    if Not (DirectoryExists(Path+Dir)) then MoveDir(ExcludeTrailingBackSlash(FromPath+Dir),
                                                    ExcludeTrailingBackSlash(Path+Dir)) else
     if (CheckUnload(FromPath+Dir)='') and (CheckUnload(Path+Dir)<>'') then CopyDir(FromPath+Dir,Path+Dir)
   end;
  DelDir(FromPath+'*');
 end; {CopyArh}

// Кнопка "Печать Ценников по Чеку"
procedure TMainF.btPrnChekClick(Sender:TObject);
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select a.art_code as Код_I_1500,');
   DM.Qr.SQL.Add('       b.names as Наименование_S_8000,');
   DM.Qr.SQL.Add('       Sum(a.kol) as [Кол-во_I_1000] ,');
//   DM.Qr.SQL.Add('       convert(numeric(8,2),a.cena) as Цена_N_1500,');
//   DM.Qr.SQL.Add('       Sum(convert(numeric(8,2),a.cena*a.kol)) as Сумма_N_1500,');
   DM.Qr.SQL.Add('       IsNull(convert(varchar(10),c.P1),'''')+IsNull(c.L1,'''') as [Осн_S_1000],');
   DM.Qr.SQL.Add('       IsNull(convert(varchar(10),c.P2),'''')+IsNull(c.L2,'''') as [Витр_S_1000],');
   DM.Qr.SQL.Add('       IsNull(convert(varchar(10),c.P3),'''')+IsNull(c.L3,'''') as [Скл_S_1000]');
   DM.Qr.SQL.Add('from Chek a (nolock), SprTov b (nolock) left join Inform..SprReg c on b.art_code=c.art_code');
   DM.Qr.SQL.Add('where a.kod_name=b.kod_name and a.compname=host_name() and a.id_user='+IntToStr(Prm.UserID));
   DM.Qr.SQL.Add('group by a.art_code,b.names,c.P1,c.P2,c.P3,c.L1,c.L2,c.L3');
   DM.Qr.SQL.Add('order by c.P1,c.P2,c.P3,b.names');
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Exit;
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=5;
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(false,0,0);
   PrintRep.PreView;
  except
   on E:Exception do MessBox('Ошибка печати чека: '+E.Message);
  end;
 end; {btPrnChekClick}

// Вызов контекстного меню "Сумма чека со скидкой"
procedure TMainF.btSumChekClick(Sender:TObject);
var dx,dy:Integer;
    Com:TControl;
 begin
  if Sender=nil then Exit;
  dx:=Left+3; dy:=Top+TControl(Sender).Height+41;
  Com:=TControl(Sender);
  While Com<>Self do
   begin
    Inc(dx,Com.Left);
    Inc(dy,Com.Top);
    Com:=Com.Parent;
   end;
  pmSkdList.Popup(dx,dy);
 end; {btSumChekClick}

// Пунткы контекстного меню "Сумма чекоа со скидкой"
procedure TMainF.miSkd2Click(Sender:TObject);
var Perc:Integer;
 begin
  if Sender=nil then Exit;
  Perc:=TMenuItem(Sender).Tag;
  MessBox('Сумма чека со скидкой '+IntToStr(Perc)+' % : '+CurrToStrF(SumChek*(1-Perc/100),ffFixed,2)+' грн.',64);
 end; {miSkd2Click}

// Пункт контекстного меню "Сумма чекоа со скидкой" - "Другой %..."
procedure TMainF.miSkdOtherClick(Sender:TObject);
var Kol,Art_Code,id_zam:Integer;
 begin
  Art_Code:=0;
  if Sender=nil then Exit;
  Kol:=GetKolFromDialog('Введите процент скидки',1,Art_Code,id_zam,EN_SIMPLE);
  if Kol<=0 then Exit else TMenuItem(Sender).Tag:=Kol;
  miSkd2Click(Sender);
 end; {miSkdOtherClick}

// Кнопка "Закрыть порт"
procedure TMainF.sbClosePortClick(Sender:TObject);
 begin
  EKKA.fpClosePort;
 end; {sbClosePortClick}

// Кнопка "Открыть порт"
procedure TMainF.sbOpenPortClick(Sender:TObject);
 begin
  ShowErrorEKKA(EKKA.fpConnect);
 end; {sbOpenPortClick}

// Кнопка выбора папки файлика с изображением логотипа 
procedure TMainF.sbPathClick(Sender:TObject);
var Bm:TBitMap;
 begin
  if Not odLoad.Execute then Exit;
  edLogoEKKA.Text:=odLoad.FileName;
  try
   Bm:=TBitMap.Create;
   try
    Bm.LoadFromFile(edLogoEKKA.Text);
    imLogoEKKA.Picture.Assign(Bm);
   finally
    Bm.Free;
   end;
  except
   MessBox('Ошибка загрузки изображения логотипа для просмотра!');
  end;
 end; {sbPathClick}

// Кнопка "Загрузить логотип" 
procedure TMainF.bbLoadLogoClick(Sender:TObject);
var T:TDateTime;
    Bm:TBitMap;
 begin
  T:=Time;
  try
   Bm:=TBitMap.Create;
   try
    Bm.Assign(imLogoEKKA.Picture);
    if Not EKKA.fpLoadLogo(Bm,True) then raise EAbort.Create(EKKA.LastErrorDescr);
    MessBox('Логотип загружен! Затрачено времени: '+TimeToStr(Abs(T-Time)),64);
   finally
    Bm.Free;
   end;
  except
   on E:Exception do MessBox(E.Message);
  end;
 end; {bbLoadLogoClick}

// Кнопка "Читать EKKA"
procedure TMainF.bbReadEKKAClick(Sender:TObject);
var B:Boolean;
 //   SL:TStringList;
 begin

  stFactoryNum.Caption:='';
  stRegNom.Caption:='';
  stFirma.Caption:='';
  stKassirIsReg.Caption:='';
  stKeyPos.Caption:='';
  stIsObnulen.Caption:='';
  stNomerLastZ.Caption:='';
  stNomberLastChek.Caption:='';
  stFiskDate.Caption:='';
  stFiskTime.Caption:='';
  stVersion.Caption:='';
  stDtVersion.Caption:='';
  stMoney.Caption:='';
  if cbEKKA.Checked then Exit;

  B:=EKKA.fpGetStatus;

  ShowErrorEKKA(B);

{
  SL:=TStringList.Create;
  SL.Text:=EKKA.RD_Item.Text;
  SL.SaveToFile('C:\log\rd_item.txt');
}
  if Not B then Exit;
  stFactoryNum.Caption:=EKKA.RD_Item[0]+' ';
  stRegNom.Caption:=EKKA.RD_Item[1]+' ';
  stFirma.Caption:=Trim(EKKA.RD_Item[2]);

  if EKKA.RD_Item[7]='0' then stKassirIsReg.Caption:='Не зарегистрирован' else
  if EKKA.RD_Item[7]='1' then stKassirIsReg.Caption:='Зарегистрирован';

  Case Ord(EKKA.RD_Item[5][1]) of
   KEY_O:stKeyPos.Caption:='Отключен';
   KEY_W:stKeyPos.Caption:='Работа';
   KEY_X:stKeyPos.Caption:='X-отчет';
   KEY_Z:stKeyPos.Caption:='Z-отчет';
   KEY_P:stKeyPos.Caption:='Программирование';
  end;

  Case Ord(EKKA.RD_Item[9][1]) of
   1:stIsObnulen.Caption:='Обнулена';
   0:stIsObnulen.Caption:='Не обнулена';
  end;

  stNomerLastZ.Caption:=EKKA.RD_Item[10]+' ';

  stNomberLastChek.Caption:=EKKA.RD_Item[11]+' ';

  stFiskDate.Caption:=JDateToStr(EKKA.RD_Item[3])+' ';
  stFiskTime.Caption:=JTimeToStr(EKKA.RD_Item[4])+' ';

  stVersion.Caption:=EKKA.RD_Item[13]+' ';
  stDtVersion.Caption:=JDateToStr(EKKA.RD_Item[14])+' ';;
  stMoney.Caption:=EKKA.RD_Item[18]+' ';

 end; {bbReadEKKAClick}

// Чтение свойства VzhNum
function TMainF.GetVzhNum:Int64;
 begin
  if (cbEKKA.Checked) and (EKKA.EmulEKKA=False) then Result:=Opt.KassaID
                                                else Result:=EKKA.VzhNum;

 end; {GetVzhNum}

// Пункт меню "Выручки по кассирам"
procedure TMainF.miRepKassirClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;

  try
   RepKassirSummF:=TRepKassirSummF.Create(Self);
   try
    Application.ProcessMessages;
    RepKassirSummF.ShowModal;
   finally
    RepKassirSummF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miRepKassirClick}

// Возвращает база ЧП или нет (ЧП - true, не ЧП false)
function TMainF.GetBaseCHP:Boolean;
 begin
  Result:=False;
{  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select Max(F_NDS) as F_NDS from SprTovar (nolock)';
   DM.Qr.Open;
   if DM.Qr.FieldByName('F_NDS').AsInteger>2 then Result:=True else Abort;
  except
   Result:=False;
  end;}
 end; {GetBaseCHP}

// Пункт меню "Отчеты различные" 
procedure TMainF.miRepClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   RepPeriodF:=TRepPeriodF.Create(Self);
   try
    Application.ProcessMessages;
    RepPeriodF.ShowModal;
   finally
    RepPeriodF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miRepClick}

// Дестрой главной формы
procedure TMainF.FormDestroy(Sender:TObject);
 begin
  FChpChek.Free;
//  UnRegisterHotKey(MaiNF.Handle, id_SnapShot);
 end; {FormDestroy}

// Копирование в буфер обмена арт_кода или наименования
procedure TMainF.CopyDataExecute(Sender:TObject);
 begin
  if Not dbgSklad.Focused then Exit;
  if SprOrder=O_ART_CODE then ClipBoard.AsText:=dbgSklad.DataSource.DataSet.FieldByName('ART_CODE').AsString;
  if SprOrder=O_NAMES then ClipBoard.AsText:=dbgSklad.DataSource.DataSet.FieldByName('ART_CODE').AsString+' '+dbgSklad.DataSource.DataSet.FieldByName('NAMES').AsString;
 end; {CopyDataExecute}

// Ожидание внешних комманд
procedure TMainF.tmWaitCommTimer(Sender:TObject);
//var T,T1:TDateTime;
 begin
  try

   tmWaitComm.Enabled:=False;

   lbTime.Visible:=(Time>StrToTime('01:45:00')) and (Time<StrToTime('21:45:00'));   //   Prm.AptekaID in [138,24,136,121,12,181,218,223,194,162,19,131,6,198,216,224];

   if Design=False then
    try
//    T:=Time;
     DM.tmQr.Close;
     DM.tmQr.SQL.Text:='select getdate() as dt';
     DM.tmQr.Open;
     lbTime.Caption:=TimeToStr(DM.tmQr.FieldByName('dt').AsDateTime);
{
    T1:=Time-T;
    DM.tmQr.Close;
    DM.tmQr.SQL.Text:=FormatDateTime('hh:nn:ss.zzz',T1);
    DM.tmQr.SQL.SaveToFile('c:\log\timet.txt')
}
    except
    end;

   if {(EKKA.EmulEKKA) and } (ChekOpened=False) then ShowIndic(CenterStr(FormatDateTime('hh-nn',Now),10));

   //if Prm.Dobraia then Exit;

   try  // Несобранные возвраты
    if pnBarDop.Tabs.Items[1].Btn.Visible then
     pnBarDop.Tabs.Items[1].Btn.Flash:=Not pnBarDop.Tabs.Items[1].Btn.Flash;
   except
   end;

   try  // Несданные уроки
    if pnBarDop.Tabs.Items[0].Btn.Visible then
     pnBarDop.Tabs.Items[0].Btn.Flash:=Not pnBarDop.Tabs.Items[0].Btn.Flash;
   except
   end;

   try  // Интернет заказы
    if pnBarDop.Tabs.Items[2].Btn.Visible then
     pnBarDop.Tabs.Items[2].Btn.Flash:=Not pnBarDop.Tabs.Items[2].Btn.Flash;
   except
   end;

   try  // Сообщения
    if pnBarDop.Tabs.Items[3].Btn.Tag>0 then
     pnBarDop.Tabs.Items[3].Btn.Flash:=Not pnBarDop.Tabs.Items[3].Btn.Flash;
   except
   end;

   if (StartFlash=False) and ((Time-flTime)>StrToTime('00:00:01')) then // Иницируем мигание аналогов и "Узнать где"
    try
     if Not (Prm.AptekaID in [46,216]) then FlashWhenZero;
    except
    end;

   if (Prm.UserRole=R_ADMIN) or (Design) then Exit;

   if (FIP='10.44.4.17') or (Prm.AptekaID in [216,40]) or ((Prm.AptekaID=91) and (Opt.KassaID=10)) then Exit;

   if (TimeToStr(Time)>'08:00:00') and (TimeToStr(Time)<'21:00:00') then // Показывает заставку "Ромашка"
    try
     if (Time-ssTime)>StrToTime('00:01:00') then
//     if (Time-ssTime)>StrToTime('00:00:05') then
      begin
//       SaveScreenF:=TSaveScreenF.Create(Self);
//       Application.ProcessMessages;
       SaveScreenF.ShowModal;
//       SaveScreenF.Free;
       ssTime:=Time;
      end;

   except
   end;

  finally
   tmWaitComm.Enabled:=True;
  end;
 {
  if Design then Exit;
  ExecCommand('GCCAS');
  ExecCommand('ULOAD');
 }
 end; {tmWaitCommTimer}

// Пункт меню "Бланки инкассации"
procedure TMainF.miIncomeBlanksClick(Sender:TObject);
 begin
  try
   RepIncomF:=TRepIncomF.Create(Self);
   try
    Application.ProcessMessages;
    RepIncomF.ShowModal;
   finally
    RepIncomF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miIncomeBlanksClick}

// Возвращает имя файла базы по формату 'Base'<номер аптеки>'.bak'
function TMainF.GetBaseFileName:String;
 begin
  Result:='Base'+IntToStr(Prm.AptekaID)+'.bak'
 end; {GetBaseFileName}

// Выгрузка базы в потоке
procedure TThArhBase.Execute;
 begin
  FreeOnTerminate:=True;
  MainF.UnLoadArhBase;
 end; {Execute}

// Кнопка сброс сервис-лимита
procedure TMainF.bbServLimClick(Sender:TObject);
 begin
  if MessBox('Вы действительно хотите выполнить сброс сервис-лимита?',52)<>ID_YES then Exit;
  try
   if Not EKKA.fpServPassw('2222222222') then raise EAbort.Create(EKKA.LastErrorDescr);
   if Not EKKA.fpPrintLimit(StrToInt(edKolStr.Text)) then raise EAbort.Create(EKKA.LastErrorDescr);
   if Not EKKA.fpDayLimit(StrToInt(edKolDay.Text)) then raise EAbort.Create(EKKA.LastErrorDescr);
   MessBox('Сброс сервис лимита прошел успешно.',64);
  except
   on E:EXception do MessBox(E.Message);
  end;
 end; {bbServLimClick}

// Организация ввода только цифр в TEdit
procedure TMainF.edKolStrKeyPress(Sender:TObject; var Key:Char);
 begin
  try
   if Sender=Nil then Exit;
   if Key in CH_DIGIT then StrToInt(TEdit(Sender).Text+Key) else
   if Key<>#8 then Abort;
  except
   Key:=#0;
  end;
 end; {edKolStrKeyPress}

// Вызов окна терминала кассового аппарата
procedure TMainF.bbTermEKKAClick(Sender:TObject);
var ch:Boolean;
 begin
  if Not(IsPermit([R_ADMIN],P_ALERT)) then Exit;
  try
   ActivateKeyboardLayout(ENLng, 0);

   ch:=cbEKKA.Checked;
   cbEKKA.Checked:=False;
   TermEKKAF:=TTermEKKAF.Create(Self);
   try
    Application.ProcessMessages;
    TermEKKAF.ShowModal;
   finally
    cbEKKA.Checked:=ch;
    ActivateKeyboardLayout(RULng, 0);
    TermEKKAF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {bbTermEKKAClick}

// Пункт меню Архивация базы 
procedure TMainF.miArhBaseClick(Sender: TObject);
 begin
  if Not(IsPermit([R_ADMIN],P_ALERT)) then Exit;
  try
   CutBaseF:=TCutBaseF.Create(Self);
   try
    Application.ProcessMessages;
    CutBaseF.ShowModal;
   finally
    CutBaseF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miArhBaseClick}

// Вызов окна просмотра аннотации к препарату
procedure TMainF.miAnnotClick(Sender: TObject);
var DS:TDataSet;
 begin
  DS:=nil;
  if dbgSklad.Focused then DS:=dbgSklad.DataSource.DataSet else
  if dbgChek.Focused then DS:=dbgChek.DataSource.DataSet;

  if DS=nil then Exit;
  if DS.IsEmpty then Exit;
  ShowAnnotation(DS.FieldByName('Art_Code').AsInteger);
 end;

procedure TMainF.ShowAnnotation(Art_code:Integer; Param:Byte=0);
var Blob:TMemoryStream;
 begin
  try

{
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select a.Txt ');
   DM.Qr.SQL.Add('from Plist p (nolock), ');
   DM.Qr.SQL.Add('     Morion_Base..Annotaci a (nolock) ');
   DM.Qr.SQL.Add('where a.morion=p.morion and');
   DM.Qr.SQL.Add('      p.art_code='+IntToStr(Art_Code));
}

   DM.Qr.Close;
   DM.Qr.SQL.Text:='exec spY_GetAnnot '+IntToStr(Art_Code);
   DM.Qr.Open;

   if DM.Qr.IsEmpty then
    begin
     MainF.MessBox('К данному препарату нет инструкции!');
     Exit;
    end;

    ShowAnnotNewF:=TShowAnnotNewF.Create(Self);
    try
     Blob:=TADOBlobStream.Create(TBlobField(DM.Qr.FieldByName('Txt')),bmRead);
     try
      if Design then
       Blob.SaveToFile('C:\log\'+IntToStr(Art_Code)+'.mht');
      WB_LoadHTMLBlob(ShowAnnotNewF.WebBrowser1,Blob);
     finally
      Blob.Free;
     end;
//     WB_LoadHTML(ShowAnnotNewF.WebBrowser1,DM.Qr.FieldByName('Txt').AsString);

     Application.ProcessMessages;
     Case Param of
      0:ShowAnnotNewF.ShowModal;
      1:begin
         ShowAnnotNewF.Flag:=1;
         ShowAnnotNewF.ShowModal;
         try
          ShowAnnotNewF.WebBrowser1.ExecWB(OLECMDID_PRINT,OLECMDEXECOPT_DONTPROMPTUSER);

          DM.QrEx.Close;
          DM.QrEx.SQL.Clear;
          DM.QrEx.SQL.Add('insert into PrintAnnotLog(DT,ID_GAMMA,ART_CODE) values(getdate(),'+IntToStr(Prm.ID_Gamma)+','+IntToStr(Art_Code)+') ');
          DM.QrEx.SQL.Add('');
          DM.QrEx.ExecSQL;

         finally
          ShowAnnotNewF.Close;
         end;
        end;
     end;
    finally
     ShowAnnotNewF.Free;
    end;

{
procedure TForm1.PrintIE;
var
  CmdTarget : IOleCommandTarget;
  vaIn, vaOut: OleVariant;
begin
  if WebBrowser1.Document <> nil then
    try
      WebBrowser1.Document.QueryInterface(IOleCommandTarget, CmdTarget);
      if CmdTarget <> nil then
        try
          CmdTarget.Exec( PGuid(nil), OLECMDID_PRINT,
                         OLECMDEXECOPT_DONTPROMPTUSER, vaIn, vaOut);
        finally
          CmdTarget._Release;
        end;
    except
      // nothing
    end;
end;


}

  except
  end;

 end; {miAnnotClick}

// Установка звука в максимальное значение на компьютерах с USB-колонками
procedure TMainF.SetVolume;
 begin
{
  SetMasterVolumeToValue(65500);
  SetMasterVolumeToValue(65530);
}
{
  try
   if (Prm.AptekaID=8) or (Prm.AptekaID=2) or (Prm.AptekaID=3) or
      ((Prm.AptekaID=5) and (Opt.KassaID=1)) or ((Prm.AptekaID=23) and (Opt.KassaID=1)) or ((Prm.AptekaID=72) and (Opt.KassaID=1)) then
    begin
     SetMasterVolumeToValue(65500);
     SetMasterVolumeToValue(65530);
    end;
  except
  end;
}

 end;

procedure TMainF.SaveFilesFromMess;
var Blob:TMemoryStream;
    ID,i:Integer;
    FName:String;
    SL:TStringList;
 begin
  try
   if IsServer=False then raise EAbort.Create('Не сервер'); // Exit;

   DM.TimerQr2.Close;
   DM.TimerQr2.SQL.Text:='select top 1 id from Inform..JFiles (nolock) where IsNull(Done,0)=0 ';
   DM.TimerQr2.Open;

   if DM.TimerQr2.IsEmpty then Exit;
   ID:=DM.TimerQr2.FieldByName('id').AsInteger;

   DM.TimerQr2.Close;
   DM.TimerQr2.SQL.Text:='select * from Inform..JFiles (nolock) where id='+IntToStr(ID);
   DM.TimerQr2.Open;
   if DM.TimerQr2.IsEmpty then Exit;

   FName:=IncludeTrailingBackslash(Opt.LoadNaklPath)+DM.TimerQr2.FieldByName('FName').AsString;

   if Not FileExists(FName) then
    begin
     Blob:=TADOBlobStream.Create(TBlobField(DM.TimerQr2.FieldByName('FData')),bmRead);
     try
      Blob.SaveToFile(FName);
     finally
      Blob.Free;
     end;
    end;

    if FileExists(FName) then
     begin
      DM.TimerQr2.Close;
      DM.TimerQr2.SQL.Text:='update Inform..JFiles set Done=1 where id='+IntToStr(ID);
      DM.TimerQr2.ExecSQL;
     end;

  except
   on E:Exception do
    try
     SL:=TStringList.Create;
     try
      SL.Text:=E.Message;
      SL.SaveToFile('C:\Log\CopingFilesFromMess.err');
     finally
      SL.Free;
     end
    except
    end;
  end;
 end;

// Отображение сообщений по зарплате
procedure TMainF.ShowZPMess;
var ID:Integer;
    S:String;
 begin
  Exit;
  try
   DM.QrZ.Close;
   DM.QrZ.SQL.Text:='select top 1 * from ZpList (nolock) where id_apteka=:idapteka and id_gamma=:idgamma and dt_read is null and dt_confirm is null and dt>getdate()-15 order by dt';
   DM.QrZ.Parameters.ParamByName('idapteka').Value:=Prm.AptekaID;
   DM.QrZ.Parameters.ParamByName('idgamma').Value:=Prm.ID_Gamma;
   DM.QrZ.Open;
   if DM.QrZ.IsEmpty then Exit;

   ID:=DM.QrZ.FieldByName('ID').AsInteger;

   ShowZpMessF:=TShowZpMessF.Create(Self);
   try

    S:=DM.QrZ.FieldByName('Subject').AsString;

    if DM.QrZ.FieldByName('Summa').AsCurrency<>0 then S:=S+' - '+CurrToStrF(DM.QrZ.FieldByName('Summa').AsCurrency,ffFixed,2);

    ShowZpMessF.mmMess.Lines.Add(S);
    if DM.QrZ.FieldByName('Descr').AsString<>'' then
     begin
      ShowZpMessF.mmMess.Lines.Add('');
      ShowZpMessF.mmMess.Lines.Add('');
      ShowZpMessF.mmMess.Lines.Add('');
      ShowZpMessF.mmMess.Lines.Add(DM.QrZ.FieldByName('Descr').AsString);
     end;

    Application.ProcessMessages;
    ShowZpMessF.ShowModal;

    DM.QrZ.Close;
    DM.QrZ.SQL.Text:='update ZpList set dt_read=getdate() where id=:pid ';
    DM.QrZ.Parameters.ParamByName('pid').Value:=ID;
    DM.QrZ.ExecSQL;

   finally
    ShowZpMessF.Free;
   end;
  except
  end;
 end; {ShowZPMess}

// Ожидание различных текстовых сообщений из офиса
procedure TMainF.tmrWaitMessTimer(Sender:TObject);
 begin
  try
   tmrWaitMess.Enabled:=False;
   if Design then Exit;
   if Prm.UserID<0 then Exit;
   if Prm.UserRole=R_PROVIZ then Exit;

   if (DM.qrChek.IsEmpty=False) then Exit;

   WaitMessTimer;

  finally
   tmrWaitMess.Enabled:=True;
  end;
 end;

procedure TMainF.WaitMessTimer;
var i,ID:Integer;
    ss:String;
    Blob:TMemoryStream;
    B:Boolean;
    Rc,idres:Integer;
    clMess:TColor;
    Bm:TBitMap;
    T:TDateTime;
    Res:String;

 begin

//  if dbgChek.Visible=True then Exit;
  try
   DM.TimerQr.Close;
   DM.TimerQr.SQL.Text:='select top 1 id_gamma from NotPassedTests where id_gamma='+IntToStr(Prm.ID_Gamma);
   DM.TimerQr.Open;
   pnBarDop.Tabs.Items[0].Btn.Visible:=Not DM.TimerQr.IsEmpty;
  except
  end;

  try
   try // Несобранные возвраты
    DM.TimerQr.Close;
    DM.TimerQr.SQL.Text:='exec spY_NotMarketBack ';
 //   DM.TimerQr.SQL.Text:='select Cnt from gh';
    DM.TimerQr.Open;
    B:=False;
    Rc:=DM.TimerQr.RecordCount;
    if Rc>0 then
     try
      Bm:=TBitMap.Create;
      try

       B:=True;
       pnBarDop.Tabs.Items[1].Btn.Visible:=False;

       pnBarDop.Tabs.Items[1].Btn.ShowHint:=True;
       pnBarDop.Tabs.Items[1].Btn.Hint:='Несобранных возвратов: '+IntToStr(Rc);

       PrepareIm(imNotV,Rc,0,Bm);

       pnBarDop.Tabs.Items[1].Btn.Glyph.Assign(Bm);
       pnBarDop.Tabs.Items[1].Btn.Visible:=True;

      finally
       Bm.Free;
      end;
     except
     end else pnBarDop.Tabs.Items[0].Btn.Visible:=False;

   except
   end;

   if Prm.IsKurator=False then
    try // Сообщения
     ss:='0';
     if Prm.UserRole=R_SUPER then ss:='1';

     DM.TimerQr.Close;
     DM.TimerQr.SQL.Clear;
{
     DM.TimerQr.SQL.Add('select Count(*) as Cnt from Inform..JMess j (nolock) where (IsNull(id_dest,-1)=-1 or id_dest='+IntToStr(Prm.ID_Gamma)+') and IsQueue=1 and id not in ');
     DM.TimerQr.SQL.Add('(select id_mess from Inform..JReadMess (nolock) where id_user='+IntToStr(Prm.UserID)+' and done=1) ');
     DM.TimerQr.SQL.Add('  and j.datem>IsNull((select Min(a.date_chek) from ArhCheks a (nolock) ),getdate()+1000) ');
}
//    DM.TimerQr.SQL.SaveToFile('C:\Mess.txt');

     DM.TimerQr.SQL.Add('exec spY_CheckNewMess '+IntToStr(Prm.UserID)+','+ss+',2');

     DM.TimerQr.Open;
     pnBarDop.Tabs.Items[3].Btn.Tag:=DM.TimerQr.FieldByName('Cnt').AsInteger;

     if pnBarDop.Tabs.Items[3].Btn.Tag>0 then
      try
       Bm:=TBitMap.Create;
       try

        pnBarDop.Tabs.Items[3].Btn.ShowHint:=True;
        pnBarDop.Tabs.Items[3].Btn.Hint:='Сообщений: '+IntToStr(pnBarDop.Tabs.Items[2].Btn.Tag);

        PrepareIm(imHist,pnBarDop.Tabs.Items[3].Btn.Tag,0,Bm);

        pnBarDop.Tabs.Items[3].Btn.Glyph.Assign(Bm);
        pnBarDop.Tabs.Items[3].Btn.Visible:=True;

       finally
        Bm.Free;
       end;
      except
      end else pnBarDop.Tabs.Items[3].Btn.Glyph.Assign(imHist.Picture);

    except
    end;

  // if Prm.IsKurator=False then
   try // Интернеn-заказы
    DM.TimerQr.Close;
 //    DM.TimerQr.SQL.Text:='select Max(idres) as idres, Count(*) as cnt from DhRes (nolock) where Closed=0';
 //   DM.TimerQr.SQL.Text:='select Cnt from gh';
    DM.TimerQr.SQL.Text:='exec spY_CheckNewZakaz '+IntToStr(Prm.ID_Gamma)+',0';
    DM.TimerQr.Open;

    B:=False;
    if (DM.TimerQr.FieldByName('Cnt').AsInteger>0) then
     try
      Bm:=TBitMap.Create;
      try

       if DM.TimerQr.FieldByName('ZState').AsInteger<>0 then
        begin
         B:=True;
         pnBarDop.Tabs.Items[2].Btn.Visible:=False;
        end;

       pnBarDop.Tabs.Items[2].Btn.ShowHint:=True;
       pnBarDop.Tabs.Items[2].Btn.Hint:='Активных интернет заказов: '+DM.TimerQr.FieldByName('Cnt').AsString;

       PrepareIm(imIZak,DM.TimerQr.FieldByName('Cnt').AsInteger,DM.TimerQr.FieldByName('CntNA').AsInteger,Bm);

       pnBarDop.Tabs.Items[2].Btn.Glyph.Assign(Bm);
       pnBarDop.Tabs.Items[2].Btn.Visible:=True;

       T:=Time;

       if ((T<StrToTime('23:45:00')) or (T>StrToTime('00:15:00'))) and (Prm.IsKurier=False) then
        if B then
         begin
          Case DM.TimerQr.FieldByName('IsRepeat').AsInteger of
           0:clMess:=clBlue;
           1:clMess:=clRed;
          end;

          MessBox(DM.TimerQr.FieldByName('Mess').AsString,
                  48,GetFont('MS Sans Serif',12,clMess,[fsBold]),20,Res);

          idres:=DM.TimerQr.FieldByName('idres').AsInteger;
          DM.TimerQr.Close;
          DM.TimerQr.SQL.Text:='exec spY_CheckNewZakaz '+IntToStr(Prm.ID_Gamma)+',1,'+IntToStr(idres);
          DM.TimerQr.Open;
         end;

      {
       MaxIDRES:=DM.TimerQr.FieldByName('IDRES').AsInteger;
       CntZakaz:=DM.TimerQr.FieldByName('Cnt').AsInteger;
      }

      finally
       Bm.Free;
      end;
     except
     end else pnBarDop.Tabs.Items[2].Btn.Visible:=False;
    except
    end;

  if DM.spY_FilterSklad.IsEmpty=False then
   try
    DM.tmrP.Close;
    DM.tmrP.SQL.Text:='select * from PereuchetActive (nolock) ';
    DM.tmrP.Open;
    if DM.tmrP.FieldByName('Active').AsInteger=1 then FilterSklad;
   except
   end;

  // Ожидание сообщений
  if Prm.UserRole=R_ADMIN then Exit;
  try
   try
    DM.TimerQr1.Close;
    DM.TimerQr1.SQL.Clear;
    ss:='0';
    if Prm.UserRole=R_SUPER then ss:='1';
{
    DM.TimerQr1.SQL.Add(' select top 1 *, ');
    DM.TimerQr1.SQL.Add('        (select top 1 users from SprUser s (nolock) where s.id_gamma=j.id_from) as users ');
    DM.TimerQr1.SQL.Add(' from Inform..JMess j (nolock) ');
    DM.TimerQr1.SQL.Add(' where IsQueue is null and DateM>convert(varchar,getdate(),23) and (IsNull(id_dest,-1) in (-1,'+ss+IntToStr(Prm.ID_Gamma)+') ) and id not in ( ');
    DM.TimerQr1.SQL.Add(' select id_mess from Inform..JReadMess (nolock) where id_user='+IntToStr(Prm.UserID)+' and done=1 ');
    DM.TimerQr1.SQL.Add(') order by IsNull(IsZp,0) desc, DateM desc ');
}
//    DM.TimerQr1.SQL.SaveToFile('C:\rty.txt');

    DM.TimerQr1.SQL.Add('exec spY_CheckNewMess '+IntToStr(Prm.UserID)+','+ss+',1');
    DM.TimerQr1.Open;

    if Not DM.TimerQr1.IsEmpty then
     begin
//      ShowMessageI(DM.TimerQr1.RecordCount);
      ShowNewInfoF:=TShowNewInfoF.Create(Self);
      try
       ID:=DM.TimerQr1.FieldByName('ID').AsInteger;

       ShowNewInfoF.MaxIncr:=5;
       ShowNewInfoF.lbFrom.Caption:='От кого: '+DM.TimerQr1.FieldByName('Users').AsString;
       ShowNewInfoF.lbDate.Caption:=DM.TimerQr1.FieldByName('DateM').AsString;
       ShowNewInfoF.FileName:=DM.TimerQr1.FieldByName('FName').AsString;
       ShowNewInfoF.Mess:=DM.TimerQr1.FieldByName('Mess').AsString;

       Application.ProcessMessages;
       ShowNewInfoF.ShowModal;

       DM.TimerQr1.Close;
       DM.TimerQr1.SQL.Clear;
       DM.TimerQr1.SQL.Add('Insert into Inform..JReadMess(ID_MESS,ID_USER,DONE)');
       DM.TimerQr1.SQL.Add('Values ('+IntToStr(ID)+','+IntToStr(Prm.UserID)+',1)');
       DM.TimerQr1.SQL.Add('select 999 as Res');
       DM.TimerQr1.Open;

       DM.TimerQr2.Close;
       DM.TimerQr2.SQL.Text:='select * from Inform..JFiles (nolock) where id_mess='+IntToStr(ID);
       DM.TimerQr2.Open;
       if DM.TimerQr2.IsEmpty=False then
        for i:=1 to DM.TimerQr2.RecordCount do
         begin
          if i=1 then DM.TimerQr2.First else DM.TimerQr2.Next;
          try
           Blob:=TADOBlobStream.Create(TBlobField(DM.TimerQr2.FieldByName('FData')),bmRead);
           try
            Blob.SaveToFile(IncludeTrailingBackslash(Opt.LoadNaklPath)+DM.TimerQr2.FieldByName('FName').AsString);
           finally
            Blob.Free;
           end;
          except
          end;
         end;

      finally
       ShowNewInfoF.Free;
      end;
     end;

   except
   end;
  finally
   SaveFilesFromMess;
   DM.TimerQr1.SQL.Text:='';
   DM.TimerQr1.Close;
  end;
 finally
  tmrWaitMess.Enabled:=True;
 end

end; {tmrWaitMessTimer}

// Подсветка ссылки "История сообщений"
procedure TMainF.lbHistoryMouseLeave(Sender:TObject);
 begin
  if Sender=Nil then Exit;
  if Not TLabel(Sender).Enabled then Exit;
  TLabel(Sender).Font.Color:=clNavy;
  TLabel(Sender).Font.Style:=[fsUnderLine];
 end; {lbHistoryMouseLeave}

// Подсветка ссылки "История сообщений"
procedure TMainF.lbHistoryMouseEnter(Sender: TObject);
 begin
  if Sender=Nil then Exit;
  if Not TLabel(Sender).Enabled then Exit;
  TLabel(Sender).Font.Color:=clBlue;
  TLabel(Sender).Font.Style:=[fsBold,fsUnderLine];
 end; {lbHistoryMouseEnter}

// пункт меню "Редактирование мест хранений"
procedure TMainF.miEditRegClick(Sender: TObject);
 begin
  try
   EditRegF:=TEditRegF.Create(Self);
   try
    EditRegF.Art_Code:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;

    EditRegF.Label4.Caption:=DM.spY_FilterSklad.FieldByName('Art_Code').AsString+' '+
                             DM.spY_FilterSklad.FieldByName('Names').AsString;
{
    EditRegF.Edit1.Text:=IntToStr(DM.spY_FilterSklad.FieldByName('P1').AsInteger);
    EditRegF.Edit2.Text:=IntToStr(DM.spY_FilterSklad.FieldByName('P2').AsInteger);
    EditRegF.Edit3.Text:=IntToStr(DM.spY_FilterSklad.FieldByName('P3').AsInteger);

    EditRegF.Edit4.Enabled:=Opt.ShowRegFull;
    EditRegF.Edit5.Enabled:=Opt.ShowRegFull;

    EditRegF.Edit2.Text:=IntToStr(DM.spY_FilterSklad.FieldByName('P2').AsInteger);
    EditRegF.Edit3.Text:=IntToStr(DM.spY_FilterSklad.FieldByName('P3').AsInteger);

    if Opt.ShowRegFull then
     begin
      EditRegF.Edit4.Text:=IntToStr(DM.spY_FilterSklad.FieldByName('P4').AsInteger);
      EditRegF.Edit5.Text:=IntToStr(DM.spY_FilterSklad.FieldByName('P5').AsInteger);
     end else begin
               EditRegF.Edit4.Text:='0';
               EditRegF.Edit5.Text:='0';
              end;
}
    Application.ProcessMessages;
    EditRegF.ShowModal;
   finally
    EditRegF.Free;
   end;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику "Места храниния"'+E.Message);
  end;
 end; {miEditRegClick}

// Клик по ссылке "История сообщений"
procedure TMainF.lbHistoryClick(Sender: TObject);
 begin
  try
   HistoryF:=THistoryF.Create(Self);
   try
    Application.ProcessMessages;
    HistoryF.ShowModal;
   finally
    HistoryF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {lbHistoryClick}

// Пункт меню "Формирование лишнего товара"
procedure TMainF.miLTClick(Sender:TObject);
 begin
  ShowWorkSprF(W_LT);
 end; {miLTClick}

// Пункт меню "График работы сотрудников"
procedure TMainF.miTableClick(Sender: TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   JTableF:=TJTableF.Create(Self);
   try
    Application.ProcessMessages;
    JTableF.ShowModal;
   finally
    JTableF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miTableClick}

// Пункт меню "Просмотр отмененных чеков"
procedure TMainF.miCancelVClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  if IsPermit([R_SUPER],P_ALERT) then
   try
    CancelViewF:=TCancelViewF.Create(Self);
    try
     Application.ProcessMessages;
     CancelViewF.ShowModal;
    finally
     CancelViewF.Free;
    end;
   except
    MessBox(ER_CR_FORM);
   end;
 end; {miCancelVClick}

// Проверка офисных карточек на предмет превышения лимита скидки в 2000 грн
function TMainF.CheckLimitSkd(Nm:Int64):Boolean;
var D1,D31:TDateTime;
 begin
  Result:=True;

  try
   if (Nm<236000) or (Nm>236499) then Abort;
   GetDaysOfMonth(StrToInt(FormatDateTime('mm',Date())),D1,D31);
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select IsNull(Sum(SumSkd),0) as Summ '+#10+
                   'from ArhCheks (nolock) where NumCard='+IntToStr(Nm)+' and '+#10+
                   'date_chek>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and '+#10+
                   'date_chek<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59''';
   DM.Qr.Open;
   if (DM.Qr.FieldByName('Summ').AsFloat+MainF.SumSkd)<=2000 then Abort;

   MessBox('Извините. Превышен лимит суммы скидки в этом месяце!');

   Result:=False;
  except
   Result:=True;
  end; {CheckLimitSkd}

 end;

procedure TMainF.acK1Execute(Sender:TObject);
var AC:Integer;
 begin
  Exit;
  if Prm.AptekaID<>9 then Exit;
  if InputBox('Password', 'Введите пароль', '')<>'555' then Exit;
  try
   if DM.spY_FilterSklad.IsEmpty then Exit;
   if DM.spY_FilterSklad.FieldByName('K1').AsInteger<=0 then
    begin
     MessBox('Операция невозможна!');
     Exit;
    end;
   AC:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('declare @Kol int, @kodn int');
   DM.QrEx.SQL.Add('set @Kol=IsNull((select Sum(ostat) from SprTov (nolock) where Art_Code='+IntToStr(AC)+'),0)');
   DM.QrEx.SQL.Add('set @kodn=-1 ');
   DM.QrEx.SQL.Add('select top 1 @kodn=kod_name from SprTov (nolock) where art_code='+IntToStr(AC)+' and ');
   DM.QrEx.SQL.Add(' IsNull(ostat_beg,0)<=0 or (IsNull(ostat_beg,0)>0 and cena_beg=cena) and ostat>0 ');
   DM.QrEx.SQL.Add('begin tran ');
   DM.QrEx.SQL.Add(' if @kodn<>-1 ');
   DM.QrEx.SQL.Add('  begin ');
   DM.QrEx.SQL.Add('   insert into SpisK(kod_name,kol,dt) ');
   DM.QrEx.SQL.Add('   values(@kodn,1,getdate()) ');
   DM.QrEx.SQL.Add('   update SprTov set ostat=ostat-1, ostat_beg=ostat_beg+1, cena_beg=cena ');
   DM.QrEx.SQL.Add('   where kod_name=@kodn ');
   DM.QrEx.SQL.Add('  end ');
   DM.QrEx.SQL.Add(' if @kodn=-1 begin rollback tran select 0 as Res end else');
   DM.QrEx.SQL.Add(' if @Kol=IsNull((select Sum(ostat) from SprTov (nolock) where Art_Code='+IntToStr(AC)+'),0) ');
   DM.QrEx.SQL.Add('  begin ');
   DM.QrEx.SQL.Add('   rollback tran select 0 as Res');
   DM.QrEx.SQL.Add('  end else begin commit tran select 1 as Res end');
   DM.QrEx.Open;
   if DM.QrEx.FieldByName('Res').AsInteger=0 then MessBox('Операция невозможна!') else FilterSklad;
  except
   on E:Exception do ShowMEssage(E.Message);
  end;
 end; {acK1Execute}

// Формирование пересорта
procedure TMainF.MakePeresort(P:Byte);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   PeresortF:=TPeresortF.Create(Self);
   try
    PeresortF.Period:=P;
    Application.ProcessMessages;
    PeresortF.ShowModal;
   finally
    PeresortF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {MakePeresort}

// Пункт меню "Формирование пересорта"
procedure TMainF.miPeresortClick(Sender:TObject);
 begin
  MakePeresort(P_MONTH);
 end; {miPeresortClick}

// Пункт меню "Формирование пересорта по переучету"
procedure TMainF.miPeresortPereuchetClick(Sender:TObject);
 begin
  MakePeresort(P_PEREUCHET);
 end; {miPeresortPereuchetClick}

// Печать обновленки по признаку НДС
procedure TMainF.PrintObnov(F_NDS:Integer; Gr:Integer=-1; dtDate:TDateTime=0);
var Nds:Boolean;
    It:Integer;
    Dt:TDateTime;
    Tb:TTableObj;
    i:Integer;
    s:String;
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   if F_NDS<>5 then
    begin
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('declare @mina datetime, @minm datetime');
     DM.Qr.SQL.Add('set @mina=IsNull((select Min(date_Chek) from ArhCheks (nolock)),getdate())');
     DM.Qr.SQL.Add('set @minm=IsNull((select Min(date_nakl) from Moves (nolock)),getdate())');
     DM.Qr.SQL.Add('if @mina<@minm select @mina as dt else select @minm as dt');
     DM.Qr.Open;
     Dt:=DM.Qr.FieldbyName('Dt').AsDateTime;
    end else begin
              Dt:=StartOfTheWeek(Date);
             end;


   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   if F_NDS in [1..4] then
    begin
     if F_NDS in [1,3] then
      begin
       DM.Qr.SQL.Add('select ''NumS'' as [№0пп_S_1000],');
       DM.Qr.SQL.Add('       Names as Наименование_S_8000,');
       DM.Qr.SQL.Add('      ''   уп'' as [Ед.изм_S_1000],');
       DM.Qr.SQL.Add('       Sum(Ostat_beg) as [Кол-во_I_1500],');
       DM.Qr.SQL.Add('       Max(Convert(Numeric(8,2),Cena_beg*5/6)) as [Цена0без0НДС_N_1700],');
       DM.Qr.SQL.Add('       Max(Cena_beg-Convert(Numeric(8,2),Cena_beg*5/6)) as [НДС0на0ед_N_1500],');
       DM.Qr.SQL.Add('       Max(Cena_beg) as [Цена0с0НДС_N_1700],');
       DM.Qr.SQL.Add('       Sum(Ostat_beg*Cena_beg) as Сумма_N_1700');
       It:=8;
       Nds:=True;
      end else
     if F_NDS in [2,4] then
      begin
       DM.Qr.SQL.Add('select ''NumS'' as [№0пп_S_1100],');
       DM.Qr.SQL.Add('       Names as Наименование_S_9000,');
       DM.Qr.SQL.Add('      ''   уп'' as [Ед.изм_S_1000],');
       DM.Qr.SQL.Add('       Sum(Ostat_beg) as [Кол-во_I_1700],');
       DM.Qr.SQL.Add('       Max(Cena_beg) as Цена_N_1700,');
       DM.Qr.SQL.Add('       Sum(Ostat_beg*Cena_beg) as Сумма_N_1700');
       Nds:=False;
       It:=6;
      end;

     DM.Qr.SQL.Add('from SprTov (nolock)');
//     DM.Qr.SQL.Add('where (art_code not in (select art from tmpa) and art_code not in (9809,9312,49066,7607,15684,708,12397,14332,37104,25942,2730,53537)) and f_nds='+IntToStr(F_NDS));

     if Gr=-1 then
      DM.Qr.SQL.Add('where art_code<>0 and f_nds='+IntToStr(F_NDS))
     else
      DM.Qr.SQL.Add('where art_code<>0 and art_code in (select IsNull(art_code,0) from #tmparto where gr='+IntToStr(Gr)+' and f_nds='+IntToStr(F_NDS)+')');

//     DM.Qr.SQL.Add('where art_code<>0 and f_nds='+IntToStr(F_NDS));
     DM.Qr.SQL.Add('group by Art_Code,Names');
     DM.Qr.SQL.Add('having Sum(Ostat_beg)>0');
     DM.Qr.SQL.Add('order by Names');
    end else begin
              DM.Qr.SQL.Add('declare @kol int');
//              DM.Qr.SQL.Add('set @kol=160');
              DM.Qr.SQL.Add('set @kol=(select Sum(ostat) from SprTov (nolock) where art_code=53537)+');
              DM.Qr.SQL.Add('IsNull((select Sum(kol) from ArhCheks (nolock) where date_chek>='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Dt)+''' and kod_name in (select kod_name from SprTov (nolock) where art_code=53537)),0)-');
              DM.Qr.SQL.Add('IsNull((select Sum(kol) from Moves (nolock) where date_nakl>='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Dt)+''' and debcrd=1 and kod_name in (select kod_name from SprTov (nolock) where art_code=53537)),0)+');
              DM.Qr.SQL.Add('IsNull((select Sum(kol) from Moves (nolock) where date_nakl>='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Dt)+''' and debcrd=2 and kod_name in (select kod_name from SprTov (nolock) where art_code=53537)),0)');
              DM.Qr.SQL.Add('select ''NumS'' as [№0пп_S_1100],');
              DM.Qr.SQL.Add('       Names as Наименование_S_9000,');
              DM.Qr.SQL.Add('      ''   уп'' as [Ед.изм_S_1000],');
              DM.Qr.SQL.Add('       @kol as [Кол-во_I_1700],');
              DM.Qr.SQL.Add('       Max(Cena) as Цена_N_1700,');
              DM.Qr.SQL.Add('       @kol*Max(Cena) as Сумма_N_1700');
              DM.Qr.SQL.Add('from SprTov (nolock)');
              DM.Qr.SQL.Add('where art_code=53537 ');
              DM.Qr.SQL.Add('group by Art_Code,Names');
              DM.Qr.SQL.Add('order by Names');
             end;
   DM.Qr.Open;
   DM.Qr.First;
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.Font.Size:=4;
   PrintRep.Font.Name:='Arial';
   PrintRep.Align:=AL_LEFT;
   PrintRep.AddTable(2,4);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('5200,1400');
   for i:=1 to 3 do Tb.Cell[2,i].Align:=AL_CENTER;
   Tb.SetBorders(1,1,1,4,EMPTY_BORDER);

   if F_NDS in [1,2,5] then
    begin
     Tb.SetBorders(2,1,2,3,Border(clBlack,5,psSolid));

     Tb.Cell[2,1].AddText(Prm.FirmNameUA);
     Tb.Cell[2,2].Font.Size:=3;
     Tb.Cell[2,2].AddText('ВХОДНОЙ КОНТРОЛЬ');
     Tb.Cell[2,3].AddText('ПРОВИЗОР___________');
    end else begin
              for i:=1 to 3 do Tb.Cell[2,i].RightBorder:=EMPTY_BORDER;
              Tb.Cell[2,1].TopBorder:=EMPTY_BORDER;
              Tb.Cell[2,4].TopBorder:=EMPTY_BORDER;
             end;
   Tb.Cell[2,2].TopBorder:=EMPTY_BORDER;
   Tb.Cell[2,3].TopBorder:=EMPTY_BORDER;
   Tb.Cell[2,4].RightBorder:=EMPTY_BORDER;
   s:='';
   if Gr<>-1 then S:=IntToStr(Gr);
   Tb.Cell[1,1].AddText('Накладная №'+IntToStr(Prm.AptekaID)+'/'+IntToStr(F_NDS)+s+'                       от '+FormatDateTime('dd.mm.yyyy',Dt));
   if F_NDS in [1,2,5] then
    begin
     Tb.Cell[1,3].AddText('От кого : '+Prm.FirmNameUA);
     Tb.Cell[1,4].AddText('Кому : '+Prm.AptekaNameRU);
    end else begin
              Tb.Cell[1,3].AddText('От кого : '+Opt.CHPName);
              Tb.Cell[1,4].AddText('Кому : '+Opt.CHPAddr);
             end;

   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Size:=4;
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(Nds,It,0);
   if F_NDS<=2 then
    PrintRep.AddText(#10#10+'Отпуск разрешил:______________'+#10);

   PrintRep.AddInterv(6);
   PrintRep.AddText('Отпустил:____________________           Получил:_______________________'+#10);
   PrintRep.PreView;
  except
   ShowMessage('Ошибка доступа к справочнику товаров!');
  end;
 end; {PrintObnov}

// Пункт меню "Печать обновленки..."
procedure TMainF.miFNDS1Click(Sender: TObject);
 begin
  if Sender=Nil then Exit;
  PrintObnov(TMenuItem(Sender).Tag);
 end; {miFNDS1Click}

// Пункт меню "Отчеты->Товарный отчет->Спец"
procedure TMainF.miSpecClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
{if Sender=Nil then Exit;
 PrintObnov(TMenuItem(Sender).Tag);}
  try
   PrintObnovF:=TPrintObnovF.Create(Self);
   try
    Application.ProcessMessages;
    PrintObnovF.ShowModal;
   finally
    PrintObnovF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {N1Click}

// Пункт меню "Проверка базы"
procedure TMainF.miCheckBaseClick(Sender: TObject);
 begin
  try
   CheckBaseF:=TCheckBaseF.Create(Self);
   try
    Application.ProcessMessages;
    CheckBaseF.ShowModal;
   finally
    CheckBaseF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miCheckBaseClick}

// Дата начала периода
function TMainF.GetBegPeriod:TDateTime;
var m:Integer;
    D,D1:TDateTime;
 begin
  m:=StrToInt(FormatDateTime('mm',Date));
  if StrToInt(FormatDateTime('dd',Date))=1 then
   begin
    if m=1 then D:=StrToDate('01.12.'+FormatDateTime('yyyy',Date-10))
           else GetDaysOfMonth(m-1,D,D1);
   end else GetDaysOfMonth(m,D,D1);
  Result:=D;
 end; {GetBegPeriod}

// Дата конца периода
function TMainF.GetEndPeriod:TDateTime;
var m:Integer;
    D,D1:TDateTime;
 begin
  m:=StrToInt(FormatDateTime('mm',Date));
  if StrToInt(FormatDateTime('dd',Date))=1 then
   begin
    if m=1 then D1:=StrToDate('31.12.'+FormatDateTime('yyyy',Date-10))
           else GetDaysOfMonth(m-1,D,D1);
   end else begin
             GetDaysOfMonth(m,D,D1);
             D1:=Date-1;
            end;
  Result:=D1;
 end; {GetEndPeriod}

// Устанавливает значение свойства Mistake
procedure TMainF.SetMistake(const Value:Boolean);
 begin
  FMistake:=Value;
  if Value=False then FMistakes:=[];
 end; {SetMistake}

// Пункт меню "Отчет по полкам"
procedure TMainF.miRegClick(Sender:TObject);
 begin
  try
   RepRegF:=TRepRegF.Create(Self);
   try
    Application.ProcessMessages;
    RepRegF.ShowModal;
   finally
    RepRegF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miRegClick}

// Пункт меню "Количество проданного.."
procedure TMainF.miKolProdClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  if DM.spY_FilterSklad.IsEmpty then Exit;
  try
   KolProdF:=TKolProdF.Create(Self);
   try
    KolProdF.lbName.Caption:=DM.spY_FilterSklad.FieldByName('Names').AsString;
    KolProdF.Art_Code:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;
    Application.ProcessMessages;
    KolProdF.ShowModal;
   finally
    KolProdF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miKolProdClick}

procedure  TMainF.CheckReocEndReg; // Проверяем, есть ли переоценки по препаратам, с закончившимся сроком регистрации
var i:Integer;
    Ms:String;
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select nn_reoc,date_reoc from JActReocExt where date_reoc=convert(varchar,getdate(),23) and ReocEndReg=1';
   DM.Qr.Open;
   if DM.Qr.IsEmpty=False then
    begin
     Ms:='';
     for i:=1 to DM.Qr.RecordCount do
      begin
       if i=1 then DM.Qr.First else DM.Qr.Next;
       Ms:=Ms+'    '+DM.Qr.FieldByName('nn_reoc').AsString+'   '+DM.Qr.FieldByName('date_reoc').AsString+#10;
      end;

     ShowText(DateToStr(Date)+' сформировалась автоматическая переоценка на препараты, с закончившимся сроком регистрации.'#10+
              'Зайдите в "Историю переоценок", распечатайте и замените ценники по следующим переоценкам:'#10#10+Ms,clBlue);
    end;
  except
  end;
 end;

procedure TMainF.ShowStartInfo(Silent:Byte=0);
var Perc,AvgSm:Real;
    Nch:Integer;

 begin
  try
   DM.qrSpisNeed.Close;
//   DM.qrSpisNeed.SQL.Text:='select art_code,Names from SprTov (nolock) where art_code in (select art_code from Inform..SpisNeed (nolock)) and ostat>0 group by art_code,Names order by Names';
   DM.qrSpisNeed.SQL.Clear;
   DM.qrSpisNeed.SQL.Add('select a.pr as Descr,Max(s.names) as names ');
   DM.qrSpisNeed.SQL.Add('from SprTov s (nolock) ');
   DM.qrSpisNeed.SQL.Add('      cross apply ');
   DM.qrSpisNeed.SQL.Add('     ( ');
   DM.qrSpisNeed.SQL.Add('      select top 1 z.pr ');
   DM.qrSpisNeed.SQL.Add('      from SprZamPrem z ');
   DM.qrSpisNeed.SQL.Add('      where s.art_code=z.art_code ');
   DM.qrSpisNeed.SQL.Add('      order by z.n_rec ');
   DM.qrSpisNeed.SQL.Add('     ) a ');
   DM.qrSpisNeed.SQL.Add('where s.ostat>0 ');
   DM.qrSpisNeed.SQL.Add('group by a.pr ');
   DM.qrSpisNeed.SQL.Add('order by 1 ');
   DM.qrSpisNeed.Open;

//   if DM.qrSpisNeed.IsEmpty then Exit;

   SpisF:=TSpisF.Create(Self);
   try
    try
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('declare @cntAll int, @cntD int                  ');
     DM.Qr.SQL.Add('set @cntAll=(select Count(*) from               ');
     DM.Qr.SQL.Add('             (select b.art_code,a.date_chek     ');
     DM.Qr.SQL.Add('              from ArhCheks a with (nolock, index=iDCh), SprTov b (nolock)        ');
     DM.Qr.SQL.Add('              where a.kod_name=b.kod_name and b.art_code in (select distinct i.art_code from Inform..SprDop d (nolock),  SprITC  i (nolock) where d.art_code=i.itc) '+' and a.date_chek>getdate()-30 and a.id_user='+IntToStr(Prm.UserID)+' group by b.art_code,a.date_chek) a) ');
     DM.Qr.SQL.Add('set @cntD  =(select Count(*) from                                                                                                                                               ');
     DM.Qr.SQL.Add('             (select b.art_code ,a.date_chek                                                                                                                                     ');
     DM.Qr.SQL.Add('              from ArhCheks a with (nolock, index=iDCh), ChArt b  (nolock)                                                                                                                                        ');
     DM.Qr.SQL.Add('              where a.row_id=b.row_id_a and a.date_chek>getdate()-30 and a.id_user='+IntToStr(Prm.UserID)+' and b.type_map=2 group by b.art_code,a.date_chek) a)                ');
     DM.Qr.SQL.Add('if @cntAll=0                                                                                                                                                                    ');
     DM.Qr.SQL.Add(' select 0 as Perc                                                                                                                                                               ');
     DM.Qr.SQL.Add('else                                                                                                                                                                            ');
     DM.Qr.SQL.Add(' select convert(numeric(8,2),@cntD)/convert(numeric(8,2),@cntAll)*100 as Perc                                                                                                   ');
     DM.Qr.Open;
     Perc:=DM.Qr.FieldByName('Perc').AsFloat;
    except
     Perc:=0;
    end;

    try
     DM.Qr.Close;
     DM.Qr.SQL.Text:='select Count(distinct convert(varchar,numb_chek)+convert(varchar,id_kassa)) as NCh from ArhCheks with (nolock, index=iDCh) where date_chek>getdate()-30 and id_user='+IntToStr(Prm.UserID);
     DM.Qr.Open;
     NCh:=DM.Qr.FieldByName('NCh').AsInteger;
    except
     Nch:=0;
    end;

    try
     DM.Qr.Close;
     DM.Qr.SQL.Text:='select (Sum(kol*cena)-IsNull(Sum(SumSkd),0))/'+IntToStr(NCh)+' as AvgSm from ArhCheks with (nolock, index=iDCh) where date_chek>getdate()-30 and id_user='+IntToStr(Prm.UserID);
     DM.Qr.Open;
     AvgSm:=DM.Qr.FieldByName('AvgSm').AsFloat;
    except
     AvgSm:=0;
    end;

    SpisF.lbAvgCh.Caption:=CurrToStrF(AvgSm,ffFixed,2)+' грн. ';
    SpisF.lbNCh.Caption:=IntToStr(NCh)+' ';
    SpisF.lbSop.Caption:=CurrToStrF(Perc,ffFixed,2)+' % ';

    try
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('');
     DM.Qr.SQL.Add('select top 1 Users,Sum(SumCh)/Count(numb_chek) as MaxSm from                                       ');
     DM.Qr.SQL.Add('(select a.numb_chek,a.id_kassa,Users,Sum(kol*cena)-IsNull(Sum(SumSkd),0) as SumCh ');
     DM.Qr.SQL.Add(' from ArhCheks a with (nolock, index=iDCh), SprUser b (nolock)                                                                   ');
     DM.Qr.SQL.Add(' where a.id_user=b.id and date_chek>getdate()-30                                               ');
     DM.Qr.SQL.Add(' group by numb_chek,id_kassa,users ) aaa                                                            ');
     DM.Qr.SQL.Add('group by Users                                                                                ');
     DM.Qr.SQL.Add('order by 2 desc                                                                               ');
//     DM.Qr.SQL.SaveToFile('C:\Perc.txt');
     DM.Qr.Open;
     SpisF.lbMaxAvgCh.Caption:='Максимальная сумма чека '+CurrToStrF(DM.Qr.FieldByName('MaxSm').AsFloat,ffFixed,2)+
                               ' грн. у пользователя '+DM.Qr.FieldByName('Users').AsString+' !';
    except
    end;

    SpisF.FilterSpis;
    Application.ProcessMessages;
    SpisF.Silent:=Silent;
    SpisF.ShowModal;
   finally
    SpisF.Free;
   end;
  except
  end;

 end;

// Показ списка предлагаемых препаратов
procedure TMainF.FormShow(Sender:TObject);
var Ms:String;
    i:Integer;
 begin

{
  if (Round(Date) mod 4=0) and (Prm.UserRole=R_SUPER ) then
   ShowText('ВНИМАНИЕ! Бланки договоров (10 экземпляров) для оформления договора купли-продажи заказывайте у помощника руководителя Швец Екатерины. Заказ по телефону:7-578-578.');
}

  if IsPermit([],P_SILENT) or Design then Exit;

  try  // Проверяем есть ли неотгруженные возвратные накладные

{
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select nn_nakl,date_nakl,(select top 1 Descr from SprPrVozr s (nolock) where s.id=j.priznak) as Descr from JMoves j (nolock) where date_nakl>''2014-03-03'' and nn_nakl like ''Взр-%'' and '+' Priznak not in (0,1,9,13,14,16,17,11,18,21,19,20) and IsNull(EANDriver,'''')='''' ');
   DM.Qr.SQL.Add(' union ');
   DM.Qr.SQL.Add('select nn_nakl,date_nakl,(select top 1 Descr from SprPrVozr s (nolock) where s.id=j.priznak) as Descr from JMoves j (nolock) where date_nakl>''2015-04-02'' and nn_nakl like ''Взр-%'' and '+' Priznak in (19,21) and IsNull(EANDriver,'''')='''' order by 2,1');
}


   DM.qrNeedAkt.Close;
   DM.qrNeedAkt.SQL.Text:='select * from NaklsNeedAkt order by 3,2';
   DM.qrNeedAkt.Open;
   if DM.qrNeedAkt.IsEmpty=False then
    try
     NeedAktF:=TNeedAktF.Create(Self);
     try
      NeedAktF.ShowModal;
     finally
      NeedAktF.Free;
      DM.qrNeedAkt.Close;
     end;
    except
    end;

 {
   DM.Qr.Open;
   Ms:='';
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     Ms:=Ms+'    '+DM.Qr.FieldByName('nn_nakl').AsString+'  '+
            DM.Qr.FieldByName('date_nakl').AsString+'  '+
            DM.Qr.FieldByName('Descr').AsString+#10;
    end;
   if Ms<>'' then
    ShowText('Следующие возвратные накладные неотгружены (не напечатаны акты прима-передачи). Как только приедет водитель за этими возвратами распечатайте акты приема передачи: '#10+Ms,clRed);
 }
  except
  end;

  CheckReocEndReg;// Проверяем, есть ли переоценки по препаратам, с закончившимся сроком регистрации

  ShowStartInfo;

 end; {FormShow}

// Пункт меню "Формирование возврата по списку"
procedure TMainF.miVozvrPisClick(Sender:TObject);
 begin
  try
   ChooseVLF:=TChooseVLF.Create(Self);
   try
    if ChooseVLF.Flag=0 then
     begin
      Application.ProcessMessages;
      ChooseVLF.ShowModal;
      if ChooseVLF.Flag<>1 then Exit;
      Prm.VSDate:=ChooseVLF.DateVz;
     end;
   finally
    ChooseVLF.Free;
   end;

{   if MainF.MessBox('Вы действительно хотите начать собирать товар для возврата! Если вы нажмете "ДА", данный товар станет на резерв и не сможет продаваться!',52)=ID_YES then
    begin
}
     DM.QrEx.Close;
     DM.QrEx.SQL.Clear;

 {    DM.QrEx.SQL.Add('update a set kol=b.ostat ');
     DM.QrEx.SQL.Add('from SpisVozr a, ');
     DM.QrEx.SQL.Add('     (select art_code, Sum(ostat) as Ostat from SprTov group by art_code) b');
     DM.QrEx.SQL.Add('where IsNull(Closed,0)=0 and DtVZ='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+''' and a.art_code=b.art_code and a.kol>b.ostat ');
}
     DM.QrEx.SQL.Add('update SpisVozr set Closed=1 where IsNull(Closed,0)=0 and DtVZ='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+''' ');
     DM.QrEx.ExecSQL;
//    end  else Exit;

   SpisForVozrF:=TSpisForVozrF.Create(Self);
   try
    Application.ProcessMessages;
    SpisForVozrF.ShowModal;
   finally
    SpisForVozrF.Free;
   end;

  //ShowWorkSprF(W_BACK,Prm.VSDate);
 except
  on E:Exception do MessBox('Ошибка формирования списка для возврата: '+E.Message);
 end;

  { try
   MakeVozvrF:=TMakeVozvrF.Create(Self);
   try
    MakeVozvrF.ShowModal;
   finally
    try
     ClearChekOnly(Prm.UserID+1000);
     DM.Qr.Close;
     DM.Qr.SQL.Text:='truncate table TmpSpisVozr';
     DM.Qr.ExecSQL;
    except
    end;
    MakeVozvrF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
}
 end; {miVozvrPisClick}

procedure TMainF.N24Click(Sender:TObject);
 begin
//  if Not IsPermit([R_PROVIZ],P_ALERT) then Exit;
  try
   tmrWaitMess.Enabled:=False;
   try
    ChooseVL1F:=TChooseVL1F.Create(Self);
    try
     if ChooseVL1F.Flag=0 then
      begin
       Application.ProcessMessages;
       ChooseVL1F.ShowModal;
       if ChooseVL1F.Flag<>1 then Exit;
       Prm.VSDate:=ChooseVL1F.DateVz;
      end;
    finally
     ChooseVL1F.Free;
    end;
    ShowScanVozr(Prm.VSDate);
   except
    on E:Exception do MessBox('Ошибка формирования списка для возврата: '+E.Message);
   end;
  finally
   tmrWaitMess.Enabled:=True;
  end;
 end;

// ------------------------------------------------
procedure TMainF.imHistoryDblClick(Sender:TObject);
 begin
  miSendMessClick(miSendMess);
 end; {imHistoryDblClick}

// Кнопка принудительного закрытия чека по наличной оплате (только для Datecs)
procedure TMainF.bbForceCloseCashClick(Sender:TObject);
 begin
  ForceCloseReceipt(TO_CASH);
 end; {bbForceCloseCashClick}

// Кнопка принудительного закрытия чека по безналичной оплате (только для Datecs)
procedure TMainF.bbForceCloseChekClick(Sender:TObject);
 begin
  ForceCloseReceipt(TO_CHEK);
 end; {bbForceCloseChekClick}

// Пунтк меню "История переоценок"
procedure TMainF.miJReocClick(Sender:TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   JReocF:=TJReocF.Create(Self);
   try
    Application.ProcessMessages;
    JReocF.ShowModal;
   finally
    JReocF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miJReocClick}

procedure TMainF.miUpdateClick(Sender:TObject);
 begin
  //
 end; {miUpdateClick}

procedure TMainF.btReadTxtClick(Sender:TObject);
 begin
  LoadTextLog(edKassaTxt.Text);
 end;

procedure TMainF.CheckBox1Click(Sender:TObject);
 begin
//  EKKA.IsAbort:=CheckBox1.Checked;
 end;

// Пункт меню "Отправить сообщение"
procedure TMainF.miSendMessClick(Sender:TObject);
var Tem:Integer;
 begin

  try
   if SimpleMessF.reW.Text='' then
    begin
     SpisUserF:=TSpisUserF.Create(Self);
     try
      Application.ProcessMessages;
      SpisUserF.ShowModal;
      if SpisUserF.Flag=0 then Exit;
     finally
      SpisUserF.Free;
     end;
     if DM.qrSpisUser.IsEmpty then Exit;

      MessThemsF:=TMessThemsF.Create(Self);
      try
       Application.ProcessMessages;
       MessThemsF.ShowModal;
       if MessThemsF.Flag=-1 then Exit;
       Tem:=MessThemsF.Flag;
      finally
       MessThemsF.Free;
      end;

      SimpleMessF.Tem:=Tem;
      SimpleMessF.ID_Dest:=DM.qrSpisUser.FieldByName('ID_GAMMA').AsInteger;
      SimpleMessF.Label2.Caption:=DM.qrSpisUser.FieldByName('Users').AsString;

     end;
    Application.ProcessMessages;
    SimpleMessF.ShowModal;

  except
   MessBox(ER_CR_FORM);
  end;
 end; {miSendMessClick}

// Подсветка ссылки "Непрочитанные сообщения"
procedure TMainF.lbNewMessMouseEnter(Sender:TObject);
 begin
  if Sender=Nil then Exit;
  if Not TLabel(Sender).Enabled then Exit;
  TLabel(Sender).Font.Style:=[fsBold,fsUnderLine];
 end; {lbNewMessMouseEnter}

// Подсветка ссылки "Непрочитанные сообщения"
procedure TMainF.lbNewMessMouseLeave(Sender:TObject);
 begin
  if Sender=Nil then Exit;
  if Not TLabel(Sender).Enabled then Exit;
  TLabel(Sender).Font.Style:=[fsUnderLine];
 end; {lbNewMessMouseLeave}

// Открытие окна для чтения/записи сообщений
procedure TMainF.lbNewMessClick(Sender:TObject);
 begin
//  imHistoryDblClick(imHistory);
 end; {lbNewMessClick}

// !!!!!
procedure TMainF.acNEKKAExecute(Sender:TObject);
 begin
  if BlockingChek then Exit;
  if Not IsSkdDop then Exit;
  if Not ChekOpened then Exit;
  if TypeChek<>TC_MAIN then Exit;

  lbNumCard50.Visible:=Not lbNumCard50.Visible;
  btnPayChek.Enabled:=Not lbNumCard50.Visible;

  FlagW:=Not FlagW;
  cbEKKA.Checked:=lbNumCard50.Visible;
 end; {acNEKKAExecute}

function TMainF.CheckPassword(Psw:String):Boolean;
 begin
  if (Design and (Prm.UserRole=R_ADMIN)) or (Psw='987654321') then begin Result:=True; Exit; end;

  try
   PswF:=TPswF.Create(Self);
   try
    PswF.Passw:=Psw;
    Application.ProcessMessages;
    PswF.ShowModal;
    if PswF.Flag<>1 then Abort;
   finally
    PswF.Free;
   end;
   Result:=True;
  except
   Result:=False;
  end;
 end;

// Пункт меню "Ведомости КРО"
procedure TMainF.miKROClick(Sender:TObject);
 begin
{
 if Not CheckPassword('777') then Exit;
  try
   BlankKROF:=TBlankKROF.Create(Self);
   try
    BlankKROF.ShowModal;
   finally
    BlankKROF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
}
 end; {miKROClick}

// Пункт меню "Чек для курьера"
procedure TMainF.miChekKurierClick(Sender:TObject);
 begin
  FTypeChek:=TC_KURER;
  OpenChek;
 end; {miChekKurierClick}

// Отчет по закончившимся наименованиям
procedure TMainF.PrintTodayZeroRep(P:Byte);
var D:Integer;
 begin
  if Not CheckPassword(GetPasswRep) then Exit;

  D:=1;
  if Not EnterIntValue(D,'Введите количество дней') then Exit;

  try

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1150], ');
   DM.Qr.SQL.Add('       a.Art_Code as Код_I_1500, ');
   DM.Qr.SQL.Add('       a.Names as Наименование_S_7500, ');
   DM.Qr.SQL.Add('       Max(a.Cena) as Цена_N_1000, ');
   DM.Qr.SQL.Add('       b.P1 as [Осн._S_1000], ');
   DM.Qr.SQL.Add('       b.P2 as [Витр._S_1000], ');
   DM.Qr.SQL.Add('       b.P3 as [Скл._S_1000] ');
   DM.Qr.SQL.Add('from (select s.art_code from ArhCheks aa (nolock), SprTov s (nolock)                          ');
   DM.Qr.SQL.Add('      where aa.kod_name=s.kod_name and                                       ');
   DM.Qr.SQL.Add('            aa.date_chek>convert(datetime,convert(varchar,getdate()-'+IntToStr(D-1)+',23))) c, ');
   DM.Qr.SQL.Add('     SprTov a left join Inform..SprReg b on a.art_code=b.art_code            ');
   DM.Qr.SQL.Add('where a.art_code=c.art_code                                                  ');
   DM.Qr.SQL.Add('group by a.Art_Code,a.Names,b.P1,b.P2,b.P3                                   ');
   DM.Qr.SQL.Add('having Sum(ostat)<=0                                                         ');

   Case P of
    1:DM.Qr.SQL.Add('order by a.Names ');
    2:DM.Qr.SQL.Add('order by b.P2,b.P1,b.P3,a.Names ');
   end;

   DM.Qr.Open;
   DM.Qr.First;

   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Size:=5;
   PrintRep.Font.Name:='Arial';
   PrintRep.Align:=AL_CENTER;
   PrintRep.AddText('Список наименований, которые закончились '+FormatDateTime('dd.mm.yyyy',Date)+#10' по торговой точке '+Prm.AptekaNameRU+#10);
   PrintRep.Align:=AL_LEFT;
   PrintRep.AddText(#10'Время печати: '+FormatDateTime('dd.mm.yyyy hh:nn:ss',Now)+#10#10#10);
   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Size:=4;
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(False,0,0);
   PrintRep.PreView;
  except
   MainF.MessBox('Ошибка формирования отчета!');
  end;
 end; {PrintTodayZeroRep}

// Пункт меню "Отчет по закончившимся наименованиям"
procedure TMainF.miRepAlfClick(Sender:TObject);
 begin
  if Sender=nil then Exit;
  PrintTodayZeroRep(TMenuItem(Sender).Tag);
 end; {miRepAlfClick}

// Пункт меню "Выборочная инвентаризация"
procedure TMainF.miInvClick(Sender:TObject);
 begin
//  if Not CheckPassword('777') then Exit;
  ShowWorkSprF(W_PEREUCHET);
 end; {miInvClick}

// Признак киоск/аптека
function TMainF.GetIsKiosk:Boolean;
 begin
  Result:=False;
 end; {GetIsKiosk}

// Пункт меню "Показывать окно ввода сдачи"
procedure TMainF.miShowMCashClick(Sender:TObject);
 begin
  miShowMCash.Checked:=Not miShowMCash.Checked;
  Opt.ShowMCash:=miShowMCash.Checked;
 end; {miShowMCashClick}

// Пункт меню "Терапевтическая замена"
procedure TMainF.miTerapClick(Sender: TObject);
 begin
  if DM.spY_FilterSklad.IsEmpty then Exit;

  if ShowTeramChange(DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger,DM.spY_FilterSklad.FieldByName('Names').AsString) then
   dbgSklad.DataSource.DataSet.Locate('Art_Code',DM.qrTerap.FieldByName('Art_Code').AsInteger,[loCaseInsensitive,loPartialKey]);

 end; {miTerapClick}

function TMainF.ShowTeramChange(Art_Code:Integer; Names:String):Boolean;
 begin
  Result:=False;
  try
   ShowTerapF:=TShowTerapF.Create(Self);
   try
    ShowTerapF.lbName.Caption:=Names;
    ShowTerapF.lbName.Tag:=Art_Code;
    ShowTerapF.MakeList;
    ShowTerapF.ReOpen(-1);
    if DM.qrTerap.IsEmpty then
     begin
      MainF.MessBox('К данному препарату нет терапевтической замены!');
      Exit;
     end;
    Application.ProcessMessages;
    ShowTerapF.ShowModal;
    Result:=ShowTerapF.IsFind;
   finally
    ShowTerapF.Free;
   end;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику "Терапевтические замены": '+E.Message);
  end;
 end;

// Метод чтения процента скидки для ценников
function TMainF.GetPercForPrice:Byte;
 begin
  Result:=0;
//  if Prm.AptekaID in [58] then Result:=10;  else
//  if Prm.AptekaID in [58,46] then Result:=10; // else
//  if Prm.AptekaID in [72] then Result:=3;
 end; {GetPercForPrice}

function TMainF.UnLoad(SQL,FName,FServName:String):String;
 begin
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add(' declare @sql varchar(1023),@FileName varchar(500)      ');
   DM.QrEx.SQL.Add(' set @FileName='''+FName+'''                            ');
   DM.QrEx.SQL.Add(' set @sql='''+SQL+'''                                   ');
   DM.QrEx.SQL.Add(' exec spY_UnloadToFile @sql,@FileName,''sa'','''+Opt.BasePassw+''',''\t'' ');
   DM.QrEx.ExecSQL;
   //DM.QrEx.SQL.SaveToFile('C:\CenaOStat.txt');
   if Not FileExists(FServName) then Abort;
   Result:='';
  except
   Result:=FName;
  end;
 end;

// Выгрузка данных для 271-х аптек
function TMainF.UnLoadFor271(D1,D2:TDateTime; Path:String):String;
var Er,ss,S,FName,Pth:String;

 procedure UnLoadDate(D:TDateTime);
  begin
   FName:='BankRealiz'+FormatDateTime('ddmmyyyy',D)+'.txt';
   DeleteFile(Pth+FName);
   S:=' set dateformat ymd  select convert(varchar,date_chek,104)+'''' ''''+convert(varchar,date_chek,8) as date_chek,a.numb_chek,Sum(a.cena*a.kol) as SumCh,IsNull(Sum(a.SumSkd),0) as sumskd,'+IntToStr(Prm.AptekaID)+' as Num, '''''+FormatDateTime('dd.mm.yyyy',D)+''''' as Dt, a.cena_pilot '+
      ' from apteka_net..arhcheks a (nolock)'+
      ' where a.kol>0 and a.kassa_num in (2,4,6,8,9) and '+
      ' date_chek between '''''+FormatDateTime('yyyy-mm-dd',D)+' 00:00:00'''' and '''''+FormatDateTime('yyyy-mm-dd',D)+' 23:59:59'''' group by date_chek,numb_chek,a.cena_pilot';

   ss:=UnLoad(S,Opt.LogPath+FName,Pth+FName);
   if Path<>'' then CopyFile(PChar(Pth+FName),PChar(Path+FName),false);
   if ss<>'' then Er:=' - '+ss;

   FName:='RealizBal'+FormatDateTime('ddmmyyyy',D)+'.txt';
   DeleteFile(Pth+FName);
   S:=' set dateformat ymd select b.art_code,b.names,Sum(a.kol) as Kol,a.cena,IsNull(Sum(a.SumSkd),0) as sumskd,a.VZH,a.NUMB_CHEK,a.kassa_num,'+IntToStr(Prm.AptekaID)+' as Num, '''''+FormatDateTime('dd.mm.yyyy',D)+''''' as Dt, a.cena_pilot '+
      ' from apteka_net..arhcheks a (nolock), apteka_net..sprtov b (nolock)'+
      ' where a.kol>0 and IsNull(a.IsPrint,0)=1 and a.kod_name=b.kod_name and '+
      ' date_chek between '''''+FormatDateTime('yyyy-mm-dd',D)+' 00:00:00'''' and '''''+FormatDateTime('yyyy-mm-dd',D)+' 23:59:59'''' group by b.art_code,b.names,a.cena,a.VZH,a.NUMB_CHEK,a.skd,a.kassa_num,a.cena_pilot';

   ss:=UnLoad(S,Opt.LogPath+FName,Pth+FName);
   if Path<>'' then CopyFile(PChar(Pth+FName),PChar(Path+FName),false);
   if ss<>'' then Er:=' - '+ss;

   FName:='Realiz'+FormatDateTime('ddmmyyyy',D)+'.txt';
   DeleteFile(Pth+FName);
   S:=' set dateformat ymd select b.art_code,b.names,Sum(a.kol) as Kol,a.cena,IsNull(Sum(a.SumSkd),0) as sumskd,a.VZH,a.NUMB_CHEK,a.kassa_num,'+IntToStr(Prm.AptekaID)+' as Num, '''''+FormatDateTime('dd.mm.yyyy',D)+''''' as Dt, a.cena_pilot '+
      ' from apteka_net..arhcheks a (nolock), apteka_net..sprtov b (nolock)'+
      ' where a.kol>0 and IsNull(a.IsPrint,0)=0 and a.kod_name=b.kod_name and '+
      ' date_chek between '''''+FormatDateTime('yyyy-mm-dd',D)+' 00:00:00'''' and '''''+FormatDateTime('yyyy-mm-dd',D)+' 23:59:59'''' group by b.art_code,b.names,a.cena,a.VZH,a.NUMB_CHEK,a.skd,a.kassa_num,a.cena_pilot';

{
   DM.QrEx.SQl.Text:=S;
   DM.QrEx.SQL.SaveToFile('C:\13333.txt');
}
   ss:=UnLoad(S,Opt.LogPath+FName,Pth+FName);
   if Path<>'' then CopyFile(PChar(Pth+FName),PChar(Path+FName),false);
   if ss<>'' then Er:=' - '+ss;

   FName:='BackCl'+FormatDateTime('ddmmyyyy',D)+'.txt';
   DeleteFile(Pth+FName);
   S:=' set dateformat ymd select b.art_code,b.names,Abs(Sum(a.kol)) as Kol,a.cena,Abs(IsNull(Sum(a.SumSkd),0)) as sumskd, a.VZH,a.NUMB_CHEK,'+IntToStr(Prm.AptekaID)+' as Num, '''''+FormatDateTime('dd.mm.yyyy',D)+''''' as Dt, a.cena_pilot '+
      ' from apteka_net..arhcheks a (nolock), apteka_net..sprtov b (nolock)'+
      ' where a.kol<0 and a.kod_name=b.kod_name and '+
      ' date_chek between '''''+FormatDateTime('yyyy-mm-dd',D)+' 00:00:00'''' and '''''+FormatDateTime('yyyy-mm-dd',D)+' 23:59:59'''' group by b.art_code,b.names,a.cena,a.skd,a.VZH,a.NUMB_CHEK,a.cena_pilot';
   ss:=UnLoad(S,Opt.LogPath+FName,Pth+FName);
   if Path<>'' then CopyFile(PChar(Pth+FName),PChar(Path+FName),false);
   if ss<>'' then Er:=Er+#10+' - '+ss;

   FName:='Vozvr'+FormatDateTime('ddmmyyyy',D)+'.txt';
   DeleteFile(Pth+FName);
   S:=' set dateformat ymd select j.nn_nakl,b.art_code,b.names,Sum(a.kol) as Kol,a.cena,'+IntToStr(Prm.AptekaID)+' as Num, '''''+FormatDateTime('dd.mm.yyyy',D)+''''' as Dt, j.priznak '+
      ' from apteka_net..jmoves j (nolock), apteka_net..rtovar a (nolock), apteka_net..sprtov b (nolock)'+
      ' where j.iddoc=a.iddoc and j.type_nakl=2 and j.reoc=0 and a.kod_name=b.kod_name and '+
      ' j.date_nakl between '''''+FormatDateTime('yyyy-mm-dd',D)+' 00:00:00'''' and '''''+FormatDateTime('yyyy-mm-dd',D)+' 23:59:59'''' group by j.priznak,j.nn_nakl,b.art_code,b.names,a.cena';
   ss:=UnLoad(S,Opt.LogPath+FName,Pth+FName);
   if Path<>'' then CopyFile(PChar(Pth+FName),PChar(Path+FName),false);
   if ss<>'' then Er:=Er+#10+' - '+ss;

   FName:='CenaOst'+FormatDateTime('ddmmyyyy',D)+'.txt';
   DeleteFile(Pth+FName);
   S:='set dateformat ymd exec(''''  declare @dt datetime '+
      'set @dt='''''''''+FormatDateTime('yyyy-mm-dd',D)+'''''''''  '+
      'select a.art_code,a.names, '+
      'Sum(a.ostat)+ '+
      'IsNull((select Sum(kol)from apteka_net..ArhCheks a1(nolock),apteka_net..SprTov s1(nolock) where a1.kod_name=s1.kod_name and s1.art_code=a.art_code and a1.date_chek>=@dt),0)+ '+
      'IsNull((select Sum(kol)from apteka_net..Moves m1(nolock),apteka_net..SprTov s2(nolock) where m1.kod_name=s2.kod_name and s2.art_code=a.art_code and m1.date_nakl>=@dt and m1.debcrd=2),0)-'+
      'IsNull((select Sum(kol)from apteka_net..Moves m2(nolock),apteka_net..SprTov s3(nolock) where m2.kod_name=s3.kod_name and s3.art_code=a.art_code and m2.date_nakl>=@dt and m2.debcrd=1),0) Ostat, '+
      'IsNull((select top 1 m.cena from apteka_net..Moves m (nolock),apteka_net..SprTov s(nolock)'+
      'where m.kod_name=s.kod_name and s.art_code=a.art_code and '+
      'm.nn_nakl like ''''''''Впр%'''''''' and m.debcrd=2 and m.date_nakl>=@dt '+
      'order by date_nakl,nn_nakl),cena) as cena_old,'+IntToStr(Prm.AptekaID)+' as Num,'''''''''+FormatDateTime('dd.mm.yyyy',D)+''''''''' as Dt '+
      'from apteka_net..SprTov a(nolock)'+
      'group by a.art_code,a.names,a.cena'''')';

   ss:=UnLoad(S,Opt.LogPath+FName,Pth+FName);
   if Path<>'' then CopyFile(PChar(Pth+FName),PChar(Path+FName),false);
   if ss<>'' then Er:=Er+#10+' - '+ss;
  end;

 begin
  Result:='';
  try
   if IsServer then Pth:=Opt.LogPath else Pth:=Opt.ServerLogPath;
   While D1<=D2 do
    begin
     UnLoadDate(D1);
     D1:=D1+1;
    end;
   Result:=Er;
  except
   Result:=Er;
  end;
 end;

// Пункт меню "Выгрузить реализацию"
procedure TMainF.miUnloadRealizClick(Sender:TObject);
var D1,D2:TDateTime;
    Er:String;

 begin
  D1:=StartOfTheMonth(Date);
  if GetDiagDate(D1,D2)=False then Exit;
  try
   Er:=UnLoadFor271(D1,D2,'');
   if Er='' then MessBox('Все выгружено успешно!',64) else Abort;
  except
   MessBox('Ошибка выгрузки файлов: '+#10#10+Er);
  end;
 End; {miUnloadRealizClick}

procedure TMainF.N57Click(Sender:TObject);
var Er,NN,S,ss,Path,FName:String;
    D1,D2:TDateTime;

 begin

  if GetDiagDate(D1,D2)=False then Exit;
  if IsServer then Path:=Opt.LogPath else Path:=Opt.ServerLogPath;
  try
   Er:='';
   FName:='VozvratBalr_'+FormatDateTime('ddmmyyyy',D1)+'_'+FormatDateTime('ddmmyyyy',D2)+'.txt';
   DeleteFile(Path+FName);
   NN:='Взр-0000'+FormatDateTime('ddmm',D2);
   S:=' set dateformat ymd select '''''+NN+''''' as nn_nakl,b.art_code,b.names,Sum(a.kol),a.cena,'+IntToStr(Prm.AptekaID)+' as Num, '''''+FormatDateTime('dd.mm.yyyy',D2)+''''' as Dt, 0 as Priznak '+
      ' from apteka_net..arhcheks a (nolock), apteka_net..sprtov b (nolock)'+
      ' where a.kol>0 and IsNull(a.IsPrint,0)=1 and a.kod_name=b.kod_name and '+
      ' date_chek between '''''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'''' and '''''+FormatDateTime('yyyy-mm-dd',D2)+' 23:59:59'''' '+
      ' group by b.art_code,b.names,a.cena ';

   ss:=UnLoad(S,Opt.LogPath+FName,Path+FName);
   if ss<>'' then Er:=Er+#10+' - '+ss;

   FName:='VozvratBalv_'+FormatDateTime('ddmmyyyy',D1)+'_'+FormatDateTime('ddmmyyyy',D2)+'.txt';
   DeleteFile(Path+FName);
   NN:='Взв-0000'+FormatDateTime('ddmm',D2);
   S:=' set dateformat ymd select '''''+NN+''''' as nn_nakl,b.art_code,b.names,Sum(a.kol),a.cena,'+IntToStr(Prm.AptekaID)+' as Num, '''''+FormatDateTime('dd.mm.yyyy',D2)+''''' as Dt, 0 as Priznak '+
      ' from apteka_net..arhcheks a (nolock), apteka_net..sprtov b (nolock)'+
      ' where a.kol<0 and IsNull(a.IsPrint,0)=1 and a.kod_name=b.kod_name and '+
      ' date_chek between '''''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'''' and '''''+FormatDateTime('yyyy-mm-dd',D2)+' 23:59:59'''' '+
      ' group by b.art_code,b.names,a.cena ';

   ss:=UnLoad(S,Opt.LogPath+FName,Path+FName);
   if ss<>'' then Er:=Er+#10+' - '+ss;

   if Er='' then MessBox('Все выгружено успешно!',64) else Abort;
  except
   MessBox('Ошибка выгрузки файлов: '+#10#10+Er);
  end;

//  if Path<>'' then CopyFile(PChar(Pth+FName),PChar(Path+FName),false);
 end;

procedure TMainF.tmChekClick(Sender: TObject);
var AC,Ac1,Num,Art,L,P,i,j,q,k:Integer;
    S:String;
    en:Boolean;
    Sum,SumNeed,SumChPrev:Currency;
    SL:TStringList;
    D1,D2:TDateTIme;
    CP:TChekPos;
    Blob:TMemoryStream;
    A:Array of Record
                Nm:String;
                Cena:Currency;
                ID,Kol:Integer;
               end;
 begin

       DM.TimerQr2.Close;
       DM.TimerQr2.SQL.Text:=

'select b.descr,substring(a.fname,11,1000) as fname,a.fdata '+#10+
'from Inform..JFiles a (nolock),  '+#10+
'     inform..folders b (nolock) '+#10+
'where a.fname like ''FOLDER_%'' and b.id=convert(int,substring(a.fname,8,2)) ';
       DM.TimerQr2.SQL.SaveToFile('C:\Log\Files.txt');
       DM.TimerQr2.Open;

       if DM.TimerQr2.IsEmpty=False then
        for i:=1 to DM.TimerQr2.RecordCount do
         begin
          if i=1 then DM.TimerQr2.First else DM.TimerQr2.Next;
          try
           Blob:=TADOBlobStream.Create(TBlobField(DM.TimerQr2.FieldByName('FData')),bmRead);
           try
            ForceDirectories('D:\AVA\111\'+DM.TimerQr2.FieldByName('descr').AsString);
            Blob.SaveToFile('D:\AVA\111\'+DM.TimerQr2.FieldByName('descr').AsString+'\'+DM.TimerQr2.FieldByName('FName').AsString);
           finally
            Blob.Free;
           end;
          except
          end;
         end;

  Exit;
  try
   EKKA.fpOpenServiceReceipt;
   q:=0;
   for i:=1 to 16 do
    begin
     S:='';
     for j:=1 to 16 do
      begin
       S:=S+Chr(q);
       Inc(q);
      end;
     EKKA.fpServiceText(0,1,3,S);
    end;
   EKKA.fpCloseServiceReceipt;


   Exit;
   tmChek.Enabled:=False;
   AC:=0;
   en:=False;
   EKKA.fpCutBeep(0,0);
   FIsChSeria:=True;

//   if DM.spY_FilterSklad.IsEmpty then Exit;
//   q:=GetKolFromDialog('',999,AC,EN_SIMPLE);
//   if Not EnterCurrValue(SumNeed) then Exit;

   DM.QrToOff.ConnectionString:=Prm.ConstrDB;
   DM.QrToOff.CommandTimeout:=600;


   Repeat
   DM.QrToOff.Close;
   DM.QrToOff.SQL.Text:='select top '+IntToStr(Random(20)+1)+' id,art_code,Price as cena,kol,Descr from ekka_net..ekka_osan_print where fn='+IntToStr(EKKA.Fn)+' and IsNull(fl_print,0)=0 order by NewID()';
//   DM.QrToOff.SQL.Text:='select top '+IntToStr(Random(35)+1)+' art_code,Price as cena,Sum(kol) as kol,Max(Descr) as Descr from ekka_net..ekka_osan_print where convert(varchar,[date],23)=convert(varchar,getdate(),23) and IsNull(fl_print,0)=0 group by art_code,price order by NewID()';
   DM.QrToOff.Open;

   if DM.QrToOff.IsEmpty then Break;

   SetLength(A,DM.QrToOff.RecordCount);
   for i:=1 to DM.QrToOff.RecordCount do
    begin
     if i=1 then DM.QrToOff.First else DM.QrToOff.Next;
//     A[i-1].ID:=DM.QrToOff.FieldByName('ID').AsInteger;
     A[i-1].ID:=DM.QrToOff.FieldByName('art_code').AsInteger;
     A[i-1].NM:=DM.QrToOff.FieldByName('art_code').AsString+' '+DM.QrToOff.FieldByName('Descr').AsString;
     A[i-1].Cena:=DM.QrToOff.FieldByName('Cena').AsFloat;
     A[i-1].Kol:=DM.QrToOff.FieldByName('Kol').AsInteger;
    end;

   Repeat
    try
     EKKA.fpCashState(0);
     //if StrToInt(EKKA.RD_Item[5])*0.01>=SumNeed then Break;
     tmChek.Caption:=CurrToStrF(StrToInt(EKKA.RD_Item[5])*0.01,ffFixed,2);

     EKKA.fpCancelFiscalReceipt;
     if EKKA.ReceiptNumber<0 then AbortM('Ошибка определения номера чека');
     CP.NumbChek:=EKKA.ReceiptNumber+1;
     if Not EKKA.fpOpenFiscalReceipt then AbortM('Ошибка открытия чека: '+EKKA.LastErrorDescr);

     for i:=Low(A) to High(A) do
      begin
       if EKKA.TypeEKKA in [EKKA_EXELLIO,EKKA_FP2000] then Ac1:=A[i].ID else Ac1:=0;
//       Num:=Random(High(A)+1);
       if Not EKKA.fpAddSale(A[i].Nm,
                             A[i].Kol,
                             A[i].Cena,
                             1,
                             Ac1,
                             2,
                             0,
                             ''
                             ) then AbortM('Ошибка пробития позиции чека: '+EKKA.LastErrorDescr);

       end;
     //if Not EKKA.fpCloseFiscalReceipt(0,4,0) then AbortM('Ошибка закрытия чека: '+EKKA.LastErrorDescr);
     if Not EKKA.fpCloseFiscalReceipt(0,4,0,0,false,0,StrToIntDef(MainF.RRN,1),MainF.BankCard) then AbortM('Ошибка закрытия чека: '+EKKA.LastErrorDescr);

     Application.ProcessMessages;
     Sleep(1000);
//     Sleep(1000*(Random(20)+15));

     for i:=Low(A) to High(A) do
      begin
       DM.QrToOff.Close;
//       DM.QrToOff.SQL.Text:='update ekka_net..ekka_osan_print set fl_print=1 where id='+IntToStr(A[i].ID);
       DM.QrToOff.SQL.Text:='update ekka_net..ekka_osan_print set fl_print=1 where convert(varchar,[date],23)=convert(varchar,getdate(),23) and fl_print=0 and art_code='+IntToStr(A[i].ID)+' and price='+CurrToStr(A[i].Cena);
       DM.QrToOff.ExecSQL;
      end;

     Application.ProcessMessages;
     Break;
    except
     if (EKKA.LastError<>'SOFTPROTOC') and (EKKA.LastError<>'') then ShowMessage(EKKA.LastErrorDescr) else Delay(2);
    end;
   Until False;
//Break;
   Until False;
(*

   for i:=1 to q do
    begin
     EKKA.fpCashState(0);
     if StrToInt(EKKA.RD_Item[5])*0.01>=SumNeed then Break;
     tmChek.Caption:=CurrToStrF(StrToInt(EKKA.RD_Item[5])*0.01,ffFixed,2);

     OpenChek;
     for j:=1 to Random(6)+1 do
      begin
       DM.Qr.Close;
       DM.Qr.SQL.Text:='select top 1 art_code from SprTov where f_nds=2 and ostat>0 order by NewID()';
       DM.Qr.Open;
       if DM.Qr.IsEmpty then Break;

       if DM.spY_FilterSklad.IsEmpty then Break;
       Art:=DM.Qr.FieldByName('art_code').AsInteger;
       DM.spY_FilterSklad.Locate('art_code',Art,[]);
       SumChPrev:=SumChekFull;

       // PrevEnterKol(EK_SCAN);
       DM.Qr1.Close;
       DM.Qr1.SQL.Clear;
       DM.Qr1.SQL.Add('declare @part_code integer,@pkol int,@piduser smallint,@pscan smallint ');
       DM.Qr1.SQL.Add('set @part_code='+IntToStr(Art)+'                                            ');
       DM.Qr1.SQL.Add('set @pkol='+IntToStr(Random(5)+1)+'                                         ');
       DM.Qr1.SQL.Add('set @piduser='+IntToStr(Prm.UserID)+'                                       ');
       DM.Qr1.SQL.Add('set @pscan=1 if @pkol>100 set @pkol=1                                                               ');
//       DM.Qr1.SQL.Add('delete from Chek where id_user=@piduser                                     ');
       DM.Qr1.SQL.Add('insert into Chek(art_code,kod_name,art_name,names,kol,cena,f_nds,type_tov,id_user,printing,sumskd,skd,numcard,old_art,type_map,compname) ');
       DM.Qr1.SQL.Add('select @part_code,kod_name,art_name,names,ostat,cena,f_nds,type_tov,@piduser,@pscan,0,0,-1,@part_code,0,host_name()                         ');
       DM.Qr1.SQL.Add('from sprtov where art_code=@part_code and ostat>0                                                                               ');
       DM.Qr1.SQL.Add('            and kod_name not in (select kod_name from Chek where id_user=@piduser)');
       DM.Qr1.SQL.Add('order by kod_name                                                                                                               ');
       DM.Qr1.SQL.Add('update Chek set @pkol=kol_akcii=@pkol-kol+IsNull(kol_akcii,0) where id_user=@piduser                                            ');
       DM.Qr1.SQL.Add('update Chek set kol_akcii=(case when kol_akcii+kol>kol then kol when kol_akcii+kol>0 then kol_akcii+kol else 0 end) where id_user=@piduser ');
       DM.Qr1.SQL.Add('update Chek set kol=kol_akcii where id_user=@piduser    ');
       DM.Qr1.SQL.Add('update Chek set kol=1 where kol>20 ');

       DM.Qr1.SQL.Add('delete from Chek where id_user=@piduser and kol<=0  and compname=host_name()    ');

//       DM.Qr1.SQL.Add('update SprTov set ostat=ostat-b.kol from SprTov a, Chek b where a.kod_name=b.kod_name and id_user=@piduser ');
       DM.Qr1.ExecSQL;

       if StrToInt(EKKA.RD_Item[5])*0.01+SumChekFull>SumNeed then Break;
{        begin
         DM.Qr1.Close;
         DM.Qr1.SQL.Clear;
         DM.Qr1.SQL.Add('declare @kd int');
         DM.Qr1.SQL.Add('set @kd=(select top 1 kod_name from Chek where id_user='+IntToStr(Prm.UserID)+' and art_code='+IntToStr(Art)+')');
         DM.Qr1.SQL.Add('delete from Chek where kod_name<>@kd and id_user='+IntToStr(Prm.UserID));
         DM.Qr1.SQL.Add('update Chek set kol=1, cena='+CurrToStr(SumNeed-SumChPrev-StrToInt(EKKA.RD_Item[5])*0.01)+' where kod_name=@kd and id_user='+IntToStr(Prm.UserID));
         DM.Qr1.ExecSQL;
         ReopenChek;
         Break;
        end;
}
{       if then
        begin
         en:=True;
         Break
        end;  }
      end;
     ReopenChek;

     if DM.qrChek.IsEmpty then Break;
     PayChek(TO_CASH);
     if en then Break;
    end;
*)
   if MessBox('Сделать выдачу и снять X,Z-отчеты?',52)=ID_YES then
    begin
     EKKA.fpCashState(0);
     MainF.ShowErrorEKKA(EKKA.fpCashOutput(StrToInt(EKKA.RD_Item[5])*0.01));


     DM.QrEx.Close;
     DM.QrEx.SQL.Clear;
     DM.QrEx.SQL.Add('insert into CashOutPutLog(Dt,Summa,vzh,id_kassa,id_user)');
     DM.QrEx.SQL.Add('values(getdate(),'+CurrToStr(StrToInt(EKKA.RD_Item[5])*0.01)+','+IntToStr(EKKA.VzhNum)+','+IntToStr(Opt.KassaID)+','+IntToStr(Prm.UserID)+')');
     DM.QrEx.ExecSQL;

     //     MainF.ShowErrorEKKA(EKKA.fpCashOutput(SumNeed));

     if EKKA.LastError<>'' then begin MessBox('Не удалось сделать выдачу: '+EKKA.LastErrorDescr,48); Exit; end;
     Repeat
      if EKKA.fpXRep then Break;
      if EKKA.LastError='SOFTSLZREP' then
       if MainF.MessBox('Переведите ключ в положение X. Для отмены снятия X-отчета нажмите "Нет"',52)<>ID_YES then Exit else
      else begin
            MainF.MessBox(EKKA.LastErrorDescr);
            Exit;
           end;
     Until False;

     Repeat
      if EKKA.fpZRep then Break;
      if EKKA.LastError='SOFTSLNREP' then
       if MainF.MessBox('Переведите ключ в положение Z. Для отмены снятия Z-отчета нажмите "Нет"',52)<>ID_YES then Exit else
      else begin
            MainF.MessBox(EKKA.LastErrorDescr);
            Exit;
           end;
     Until False;

     D1:= StartOfTheMonth(StartOfTheMonth(Date)-1);
     D2:= EndOfTheMonth(StartOfTheMonth(Date)-1);

     MainF.ShowErrorEKKA(EKKA.fpPerFullRepD(D1,D2));

    end;
  finally
   tmChek.Enabled:=True;
   tmChek.Caption:='tmChek';
   FIsChSeria:=False;
  end;
 end;

procedure TMainF.sbProfClick(Sender:TObject);
 begin
  SetSkdMag(sbProf,True);
  RefreshChek;
 end;

procedure TMainF.ShowTovInfo(Art_Code:Integer; Names:String; Upak:Integer; P:Byte; Art_Origin:Integer);
 begin
  try
   TovInfoF:=TTovInfoF.Create(Self);
   try
    if Names='' then
     begin
      DM.QrEx.Close;
      DM.QrEx.SQL.Text:='select names from PList where art_code='+IntToStr(art_code);
      DM.QrEx.Open;
      Names:=DM.QrEx.FieldByname('names').AsString;
     end;
    TovInfoF.lbName.Caption:=Names;
    TovInfoF.lbName.Tag:=Art_code;
    TovInfoF.Upak:=Upak;
    TovInfoF.lbName.Hint:='Код: '+IntToStr(Art_Code);
    TovInfoF.Art_Origin:=Art_Origin;
    TovInfoF.Expanded:=True;
    Application.ProcessMessages;
    TovInfoF.ShowModal;
   finally
    TovInfoF.Free;
    TovInfoF:=nil;
   end;
  except
   on E:Exception do MessBox('Ошибка открытия окна: '+E.Message);
  end;
 end;

procedure TMainF.miNoTovClick(Sender:TObject);
 begin
  if DM.spY_FilterSklad.IsEmpty then Exit;
  if Pos('***',DM.spY_FilterSklad.FieldByName('Names').AsString)>0 then
   begin
    MessBox('На данную группу препаратов можно получить информацию по телефону +38(097)-201-79-85!');
    Exit;
   end;
  ShowTovInfo(DM.spY_FilterSklad.FieldByName('MakeFrom').AsInteger,'',DM.spY_FilterSklad.FieldByName('Upak').AsInteger,TComponent(Sender).Tag,DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger);
 end;

procedure TMainF.miCompend(Sender:TObject);
 begin
  ShowSite('SiteCompend',1);
 end;

procedure TMainF.miCenaUpClick(Sender:TObject);
var Art_Code,Koef,Kol,id_zam:Integer;
 begin
  if DM.spY_FilterSklad.IsEmpty then Exit;
  Art_Code:=DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger;
  Koef:=0;
  try
   DM.Qr1.Close;
   DM.Qr1.SQL.Text:='select * from Inform..SprKoef (nolock) where art_code='+IntToStr(Art_Code);
   DM.Qr1.Open;
   if DM.Qr1.IsEmpty then Abort;

   Kol:=GetKoef(DM.Qr1.FieldByName('Koef').AsInteger,DM.Qr1.FieldByName('Upak').AsInteger);
   Kol:=DM.Qr1.FieldByName('Koef').AsInteger;
   Koef:=Kol;
   if Kol<=1 then Abort;
   if Kol>DM.spY_FilterSklad.FieldByName('OSTAT').AsInteger then Kol:=DM.spY_FilterSklad.FieldByName('OSTAT').AsInteger;
  except
   Kol:=0;
  end;
  Kol:=GetKolFromDialog(DM.spY_FilterSklad.FieldByName('Names').AsString,Kol,Art_Code,id_zam,EN_SIMPLE,Koef,DM.Qr1.FieldByName('Upak').AsInteger);

  try
   CenaUpakF:=TCenaUpakF.Create(Self);
   try
    CenaUpakF.Kol:=Kol;
    CenaUpakF.Cena:=DM.spY_FilterSklad.FieldByName('Cena').AsFloat;
    CenaUpakF.Names:=DM.spY_FilterSklad.FieldByName('Names').AsString;
    Application.ProcessMessages;
    CenaUpakF.ShowModal;
   finally
    CenaUpakF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.miScanBoxClick(Sender:TObject);
var S,IP:String;
    QrToOff:TADOQuery;
 begin
  try
   S:=lbAlertUnLoadBase.Caption;
   lbAlertUnLoadBase.Caption:='Идет обновление данных о ящиках. Пожалуйста подождите!';
   pnUnBase.Visible:=True;

   Application.ProcessMessages;

  // QrToOff:=TADOQuery.Create(nil);
   try
   {
    QrToOff.ConnectionString:=Opt.ConStrMess;
    QrToOff.CommandTimeout:=300;
    QrToOff.Close;
    QrToOff.SQL.Text:='exec remains.dbo.ex_load_scanbox '+IntToStr(Prm.AptekaID);
    QrToOff.ExecSQL;
   }
    DM.QrX.Close;
    DM.QrX.SQL.Clear;
    DM.QrX.SQL.Add(' exec ['+Prm.ServerDB+'].remains.dbo.ex_load_scanbox '+IntToStr(Prm.AptekaID));
    DM.QrX.SQL.Add('select 9999 as Res');
    DM.QrX.Open;

   finally
   // QrToOff.Free;

    pnUnBase.Visible:=False;
    lbAlertUnLoadBase.Caption:=S;
   end;
  except
   on E:Exception do
    RegisterError('Обновление данных о я щиках с товаром',E.Message,True);
  end;

  try
   ScanBoxF:=TScanBoxF.Create(Self);
   try
    Application.ProcessMessages;
    ScanBoxF.ShowModal;
   finally
    ScanBoxF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;

 end;

procedure TMainF.PrintObnovDate(F_NDS:Integer);
var Nds:Boolean;
    It:Integer;
    Dt:TDateTime;
    Tb:TTableObj;
    i:Integer;
 begin

  if Not CheckPassword(GetPasswRep) then Exit;
  try

   if GetDiagDate1(Dt)=False then Exit;
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spY_OstatToDate '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Dt)+''' ';
   DM.QrEx.ExecSQL;


   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   if F_NDS in [1..4] then
    begin
     DM.Qr.SQL.Add('select ''NumS'' as [№0пп_S_1000],');
     DM.Qr.SQL.Add('       Names as Наименование_S_8000,');
     DM.Qr.SQL.Add('      ''   уп'' as [Ед.изм_S_1000],');
     DM.Qr.SQL.Add('       Sum(Ostat) as [Кол-во_I_1500],');

     if F_NDS in [1,3] then
      begin
       DM.Qr.SQL.Add('       Convert(Numeric(8,2),Cena*5/6.) as [Цена0без0НДС_N_1700],');
       DM.Qr.SQL.Add('       Cena-Convert(Numeric(8,2),Cena*5/6.) as [НДС0на0ед_N_1500],');
      end else begin
                DM.Qr.SQL.Add('       Convert(Numeric(8,2),Cena*(100/107.)) as [Цена0без0НДС_N_1700],');
                DM.Qr.SQL.Add('       Cena-Convert(Numeric(8,2),Cena*(100/107.)) as [НДС0на0ед_N_1500],');
               end;
     DM.Qr.SQL.Add('       Cena as [Цена0с0НДС_N_1700],');
     DM.Qr.SQL.Add('       Sum(Ostat*Cena) as Сумма_N_1700');
     It:=8;
     Nds:=True;
     {
      else
     if F_NDS in [2,4] then
      begin
       DM.Qr.SQL.Add('select ''NumS'' as [№0пп_S_1100],');
       DM.Qr.SQL.Add('       Names as Наименование_S_9000,');
       DM.Qr.SQL.Add('      ''   уп'' as [Ед.изм_S_1000],');
       DM.Qr.SQL.Add('       Sum(Ostat) as [Кол-во_I_1700],');
       DM.Qr.SQL.Add('       Cena as Цена_N_1700,');
       DM.Qr.SQL.Add('       Sum(Ostat*Cena) as Сумма_N_1700');
       Nds:=False;
       It:=6;
      end;}

     DM.Qr.SQL.Add('from SprOstat (nolock)');
     DM.Qr.SQL.Add('where Dt='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Dt)+''' and ostat>0 and art_code<>0 and f_nds='+IntToStr(F_NDS));
     DM.Qr.SQL.Add('group by art_code,Names,cena');
     DM.Qr.SQL.Add('order by Names');
    end;
//   DM.Qr.SQL.SaveToFile('C:\9876.txt');
   DM.Qr.Open;
   DM.Qr.First;
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.Font.Size:=4;
   PrintRep.Font.Name:='Arial';
   PrintRep.Align:=AL_LEFT;

   PrintRep.AddTable(2,4);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('5200,1400');
   for i:=1 to 3 do Tb.Cell[2,i].Align:=AL_CENTER;
   Tb.SetBorders(1,1,1,4,EMPTY_BORDER);

   if F_NDS in [1,2,5] then
    begin
     Tb.SetBorders(2,1,2,3,Border(clBlack,5,psSolid));

     Tb.Cell[2,1].AddText(Prm.FirmNameUA);
     Tb.Cell[2,2].Font.Size:=3;
     Tb.Cell[2,2].AddText('ВХОДНОЙ КОНТРОЛЬ');
     Tb.Cell[2,3].AddText('ПРОВИЗОР___________');
    end else begin
              for i:=1 to 3 do Tb.Cell[2,i].RightBorder:=EMPTY_BORDER;
              Tb.Cell[2,1].TopBorder:=EMPTY_BORDER;
              Tb.Cell[2,4].TopBorder:=EMPTY_BORDER;
             end;
   Tb.Cell[2,2].TopBorder:=EMPTY_BORDER;
   Tb.Cell[2,3].TopBorder:=EMPTY_BORDER;
   Tb.Cell[2,4].RightBorder:=EMPTY_BORDER;
   Tb.Cell[1,1].AddText('Накладная №'+IntToStr(Prm.AptekaID)+'/'+IntToStr(F_NDS)+'                       от '+FormatDateTime('dd.mm.yyyy',Dt));
   if F_NDS in [1,2,5] then
    begin
     Tb.Cell[1,3].AddText('От кого : '+Prm.FirmNameUA);
     Tb.Cell[1,4].AddText('Кому : '+Prm.AptekaNameRU);
    end else begin
              Tb.Cell[1,3].AddText('От кого : '+Opt.CHPName);
              Tb.Cell[1,4].AddText('Кому : '+Opt.CHPAddr);
             end;

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select top 1 * from SprOstat (nolock) where Dt='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Dt)+''' ';
   DM.QrEx.Open;

   PrintRep.Indent:=0;
   PrintRep.AddText(#10+'Дата формирования: '+DM.QrEx.FieldByName('Tm').AsString);
   PrintRep.AddText(#10+'Дата печати: '+DateTimeToStr(Now)+#10#10);

   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Size:=4;
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(Nds,It,0);
   if F_NDS<=2 then
    PrintRep.AddText(#10#10+'Отпуск разрешил:______________'+#10);

   PrintRep.AddInterv(6);
   PrintRep.AddText('Отпустил:____________________           Получил:_______________________'+#10);
   PrintRep.PreView;
  except
   on E:Exception do MessBox('Ошибка доступа к справочнику товаров: '+E.Message);
  end;
 end; {PrintObnov}

procedure TMainF.miNDS1Click(Sender: TObject);
 begin
  if Sender=Nil then Exit;
  PrintObnovDate(TMenuItem(Sender).Tag);
 end; {miNDS1Click}

procedure TMainF.miPrepChekClick(Sender: TObject);
 begin
  FTypeChek:=TC_PREP;
  OpenChek;
 end; {N1Click}

procedure TMainF.N2Click(Sender:TObject);
 begin
  FTypeChek:=TC_SERTIF;
  OpenChek;
 end; {N2Click}

procedure TMainF.bbReserveClick(Sender:TObject);
var IDRes:Integer;
    sFIO,sPhone:String;
 begin

  if DM.qrChek.IsEmpty then
   begin
    MessBox('Чек пустой!');
    Exit;
   end;

  if sbiApt.Down=True then // Если нажата кнопка iApteka то запрашиваем фамилию врача
   begin
    AddDoctorF:=TAddDoctorF.Create(Self);
    try
     AddDoctorF.Simple:=False;
     AddDoctorF.ShowModal;
     if AddDoctorF.Flag=0 then Exit;
     Fid_doctor:=AddDoctorF.aID[AddDoctorF.cbDoctor.ItemIndex].ID;
    finally
     AddDoctorF.Free;
    end;
   end;

  try
   AddResF:=TAddResF.Create(Self);
   try
    Application.ProcessMessages;
    if Fid_strah=0 then AddResF.ShowModal;
    if (AddResF.Flag=1) or (Fid_strah>0) then
     begin
//      DM.ADOCo.BeginTrans;
      try

       DM.spY_AddToReserve.Close;

       if Fid_strah>0 then
        begin
         sFIO:=FFIOStrah;
         sPhone:=FPhoneStrah;
        end else begin
                  sFIO:=AddResF.Edit1.Text;
                  sPhone:=AddResF.Edit3.Text;
                 end;

       DM.spY_AddToReserve.Parameters.ParamValues['@fio']:=sFIO;
       DM.spY_AddToReserve.Parameters.ParamValues['@phone']:=sPhone;

       DM.spY_AddToReserve.Parameters.ParamValues['@id_user']:=Prm.UserID;
       DM.spY_AddToReserve.Parameters.ParamValues['@TypeZakaz']:=1;

        if Fid_strah>0 then
         DM.spY_AddToReserve.Parameters.ParamValues['@Priznak']:=6 else

        if Fid_doctor>0 then
         begin
          DM.spY_AddToReserve.Parameters.ParamValues['@Priznak']:=4;
          DM.spY_AddToReserve.Parameters.ParamValues['@id_doctor']:=Fid_doctor;
         end else
        if MainF.IsStudyRoom=False then
         DM.spY_AddToReserve.Parameters.ParamValues['@Priznak']:=2
        else
         DM.spY_AddToReserve.Parameters.ParamValues['@Priznak']:=1;

       DM.spY_AddToReserve.Parameters.ParamValues['@NumZakaz']:=Variants.Null;
//       DM.spY_AddToReserve.Parameters.ParamValues['@NumZakaz']:=null;

       DM.spY_AddToReserve.Open;
       IDRes:=DM.spY_AddToReserve.FieldByName('IDRes').AsInteger;

       if DM.spY_AddToReserve.Parameters.ParamValues['@RETURN_VALUE']<>4444 then Abort;
 //      DM.ADOCo.CommitTrans;

       ShowText('Номер заказа: '+IntToStr(IDRes)+#10+'Сообщите его клиенту он понадобится, когда клиент придет за покупкой.'+#10#10+'Бронь действительна в течении 24-x часов!');
       CancelChek(2);
      except
//       DM.ADOCo.RollbackTrans;
       raise;
      end;
     end;
   finally
    AddResF.Free;
   end;
  except
   on E:Exception do MessBox('Ошибка бронирования препаратов: '+E.Message);
  end;
 end; {bbReserveClick}

procedure TMainF.N3Click(Sender:TObject);
var i,IDRes_Kur,OrdID:Integer;
    Filt,Res:String;
 begin

  if ChekOpened then
   begin
    MainF.MessBox('Сначала необходимо закрыть чек!');
    Exit;
   end;

  try

//   if TWinControl(Sender).Tag=2 then
    begin
     AddResF:=TAddResF.Create(Self);
     try
      AddResF.RadioButton1.Visible:=True;
      AddResF.Label1.Visible:=True;

      Application.ProcessMessages;
      AddResF.ShowModal;
      if Not (AddResF.Flag in [1,2,3]) then Exit;
      IDRes_Kur:=AddResF.IDRes_Kur;
      OrdID:=AddResF.OrderID;
      if AddResF.Flag=1 then Filt:=AddResF.Filt else
      if AddResF.Flag=2 then
       begin
        TypeChek:=TC_MAIN;
        OpenChek;
        Exit;
       end else Filt:='';
     finally
      AddResF.Free;
     end;
    end;

   FIsKurDostMakeOut:=False;
   FIDRes_Kur:=0;

   WorkResF:=TWorkResF.Create(Self);
   try

    WorkResF.TypeZakaz:=TWinControl(Sender).Tag;
    WorkResF.Filt:=Filt;

    if Prm.IsKurier=False then IDRes_Kur:=0;
    WorkResF.IDRes_Kur:=IDRes_Kur;

    Application.ProcessMessages;
    WorkResF.ShowModal;
    if WorkResF.Flag=1 then
     begin

      FIDRES:=WorkResF.IDRES;
      FIsPayMaster:=WorkResF.IsPayMaster;
      FIsIAptekaCredit:=(WorkResF.TypeRes=4) and (WorkResF.TypeZakaz=2);
      FTypeRes:=WorkResF.TypeRes;
      FNumZakaz:=WorkResF.NumZakaz;
      FPhone:=WorkResF.Phone;

      Fid_doctorA:=WorkResF.id_doctor;
      Fcard_doctorA:=WorkResF.card_doctor;

      if FTypeRes=6 then
       FFIOStrah:=WorkResF.FIO;

      Fid_strah:=WorkResF.id_strah;
      FName_Strah:=WorkResF.name_strah;
      Fnn_polis:=WorkResF.nn_polis;
      FNumOrder:=WorkResF.NumOrder;
      Fdt_polis:=WorkResF.dt_polis;
      Ffransh:=WorkResF.fransh;
      FTypeDostStrah:=WorkResF.type_dostav;
      FIsKurDostMakeOut:=WorkResF.IsKurDostMakeOut;

      if WorkResF.MedCode>0 then
       begin
        TypeChek:=TC_PILOT;
        FMedName:=WorkResF.MedName;
        FPacient:=WorkResF.Pacient;
        FNRecipt:=WorkResF.NRecipt;
        FFIODOctor1:=WorkResF.FIODOctor1;
        FDtRecipt:=WorkResF.DtRecipt;
       end;

      if FTypeRes=1 then
       begin
        MessBox('Забронированные препараты с сайта будут проданы по сниженной цене, поэтому дисконтная карта не действует!',48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
       end;

      DM.ADOCo.BeginTrans;
      try

{
       DM.Qr4.Close;
       DM.Qr4.SQL.Text:='update DhRes set Closed=2 where idres='+IntToStr(FIDRES);
       DM.Qr4.ExecSQL;
}
       for i:=1 to DM.qrResPos.RecordCount do
        begin
         if i=1 then DM.qrResPos.First else DM.qrResPos.Next;

         DM.spY_EnterKol.Parameters.ParamValues['@part_code']:=DM.qrResPos.FieldByName('Art_code').AsInteger;
         DM.spY_EnterKol.Parameters.ParamValues['@pold_art']:=DM.qrResPos.FieldByName('Art_code').AsInteger;
         DM.spY_EnterKol.Parameters.ParamValues['@pkol']:=DM.qrResPos.FieldByName('kol').AsInteger;
         DM.spY_EnterKol.Parameters.ParamValues['@piduser']:=Prm.UserID;
         DM.spY_EnterKol.Parameters.ParamValues['@ptm']:=0;

         if (FId_strah>0) or (FTypeRes=4)  then DM.spY_EnterKol.Parameters.ParamValues['@simp']:=1
                        else DM.spY_EnterKol.Parameters.ParamValues['@simp']:=0;

         DM.spY_EnterKol.Parameters.ParamValues['@Force']:=1;
         DM.spY_EnterKol.Parameters.ParamValues['@idres']:=FIDRES;

         DM.spY_EnterKol.Parameters.ParamValues['@id_zam']:=0;
         DM.spY_EnterKol.Parameters.ParamValues['@id_prior']:=0;
         DM.spY_EnterKol.Parameters.ParamValues['@cena_obsl']:=0;
         DM.spY_EnterKol.Parameters.ParamValues['@idres_np']:=0;
         DM.spY_EnterKol.Parameters.ParamValues['@id_part']:=0;

         DM.spY_EnterKol.Parameters.ParamValues['@id_doctor']:=0;
         DM.spY_EnterKol.Parameters.ParamValues['@card_doctor']:=Variants.Null;

         DM.spY_EnterKol.Parameters.ParamValues['@IsGeptral']:=0;
//         DM.spY_EnterKol.Parameters.ParamValues['@card_doctor']:=null;

  //       DM.spY_EnterKol.Parameters.ParamValues['@NumSeriya']:=DM.spY_FilterSklad.FieldByName('NumSeriya').Value;

         if DM.qrResPos.FieldByName('IsScan').AsInteger<>0 then DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=1
                                                           else DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=0;

         DM.spY_EnterKol.ExecProc;
            { если нехватает остаков }
            if DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE'] = 21 
			then { даем возможность ввести доступное количесиво остатков или меньше }
            begin
              DM.QrEx.Close;
              DM.QrEx.SQL.Text := 'exec spY_CheckOstatArt ' + IntToStr(DM.qrResPos.FieldByName('Art_code').AsInteger);
              DM.QrEx.Open;
              if DM.QrEx.FieldByName('Ostat').AsInteger > 0 then // по данной позиции нет остатков вообще, переодим к следующей позиции
                with TfmChangeCount.Create(Self, Format('(%S) %S', [DM.qrResPos.FieldByName('Art_code').AsString, DM.qrResPos.FieldByName('names').AsString]), DM.qrResPos.FieldByName('kol').AsInteger, DM.QrEx.FieldByName('Ostat').AsInteger) do
                try
                  Application.ProcessMessages;
                  if ShowModal = mrOK then
                  begin
                    if ChangeCount > 0 // значение из формы
                      then
                    begin
                      DM.spY_EnterKol.Parameters.ParamValues['@pkol'] := ChangeCount;
                      DM.spY_EnterKol.ExecProc;
                    end;
                  end;
                finally
                  Close;
                end;
            end;

//         ShowMessage(DM.spY_EnterKol.Parameters.ParamValues['@Return_Value']);
         DM.spY_EnterKol.Parameters.ParamValues['@idres']:=-1;
        end;
{
       DM.Qr4.Close;
       DM.Qr4.SQL.Text:='update DhRes set Closed=0 where idres='+IntToStr(FIDRES);
       DM.Qr4.ExecSQL;
}
       DM.ADOCo.CommitTrans;
       FIDRes_Kur:=IDRes_Kur;
       FOrderID:=OrdId;
      except
       DM.ADOCo.RollbackTrans;
      end;
      OpenChek;
     end;
   finally
    WorkResF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {N3Click}

procedure TMainF.miPredstClick(Sender:TObject);
 begin
  try
   RegPredstF:=TRegPredstF.Create(Self);
   try
    RegPredstF.crPref:=CR_PREDST;
    RegPredstF.Cap:='медпредставителя';
    RegPredstF.Tab:='RegPredst';
    Application.ProcessMessages;
    RegPredstF.ShowModal;
   finally
    RegPredstF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miPredstClick}

procedure TMainF.sbMagClick(Sender:TObject);
 begin
  SetSkdMag(sbMag,True);
  RefreshChek;
 end;

procedure TMainF.sbMediCardClick(Sender:TObject);
 begin

  if sbCard.Down then
   begin
    MessBox('Чтобы просканировать карточку "Терапия+", отмените дисконтную карточку! ');
    Exit;
   end;

{  if Opt.EKKAAsPrinter=True then
   begin
    MessBox('На этой кассе оплата по карточке "Терапия +" невозможна! Проведите продажу на другой кассe.');
    sbMediCard.Down:=False;
    Exit;
   end;}       
//  if sbMediCard.Down then Type_Skd:=SK_NONE;

  SetSkdMag(sbMediCard,True);
  RefreshChek;
 end;

function TMainF.GetNumMediCard(Nm:Int64):String;
 begin
  if Copy(IntToStr(Nm),1,3)='272' then Result:='MD0'+Copy(IntToStr(Nm),4,10)
                                  else Result:='000'+Copy(IntToStr(Nm),4,10);
 end;

function TMainF.MediCardError(err:String):Boolean;
 begin
  Result:=True;
  if AnsiLowerCase(err)='0' then raise EAbort.Create('Ошибка не определена') else
  if AnsiLowerCase(err)='1' then raise EAbort.Create('Такой карты в базе нет') else
  if AnsiLowerCase(err)='1c' then raise EAbort.Create('Картка не активована. Для активації клiєнту необхідно зателефонувати за номером 0800 211 202 (безкоштовно в межах України) та назвати номер картки, ПІБ, номер телефону.');
  if AnsiLowerCase(err)='1a' then raise EAbort.Create('Запрашиваемая карта заблокирована') else
  if AnsiLowerCase(err)='1b' then raise EAbort.Create('Указанная карта не активна. Скидка недоступна') else
  if AnsiLowerCase(err)='2' then raise EAbort.Create('Обработка запроса, ожидайте 10 минут') else
//  if AnsiLowerCase(err)='3' then raise EAbort.Create('Невозможно сохранить продажу, неверный идентификатор') else
  if AnsiLowerCase(err)='3a' then raise EAbort.Create('Невозможно сохранить продажу, нет первого запроса') else
  if AnsiLowerCase(err)='4' then raise EAbort.Create('Невозможно сохранить продажу, запрос устарел') else
  if AnsiLowerCase(err)='4a' then raise EAbort.Create('Невозможно сохранить продажу, запрос устарел') else
  if AnsiLowerCase(err)='5' then raise EAbort.Create('Товар с таким кодом для Вашей сети аптек отсутствует в базе. Скидка не доступна') else
  if AnsiLowerCase(err)='5a' then raise EAbort.Create('Товар с таким кодом отключен в базе. Скидка не доступна') else
  if AnsiLowerCase(err)='5b' then raise EAbort.Create('Товар с таким кодом отключен в базе. Скидка не доступна') else
  if AnsiLowerCase(err)='5c' then raise EAbort.Create('Ваша аптека и товар с таким кодом отключены в базе. Скидка не доступна') else
  if AnsiLowerCase(err)='5d' then raise EAbort.Create('Ваша аптека отключена в базе. Скидка не доступна') else
  if AnsiLowerCase(err)='5e' then raise EAbort.Create('Ваша аптека не найдена в базе. Скидка не доступна') else
  if AnsiLowerCase(err)='5f' then raise EAbort.Create('Не указан договор дистрибьютора. Скидка не доступна') else
  if AnsiLowerCase(err)='5g' then raise EAbort.Create('Доступ к сервису отключен. Скидка не доступна') else
  if AnsiLowerCase(err)='5h' then raise EAbort.Create('Не указан код аптеки. Скидка не доступна') else
  if AnsiLowerCase(err)='6' then raise EAbort.Create('Группа товаров с таким кодом отключен в базе. Скидка не доступна') else
  if AnsiLowerCase(err)='6a' then raise EAbort.Create('Период действия программы для этой группы товаров истек. Скидка не доступна') else
  if AnsiLowerCase(err)='7' then raise EAbort.Create('Указано нулевое значение количества. Скидка недоступна.') else
  if AnsiLowerCase(err)='7a' then raise EAbort.Create('Указано дробное значение количества. Скидка недоступна.') else
  if AnsiLowerCase(err)='7b' then raise EAbort.Create('Для мультибонусов доступно продать одну упаковку в чеке. Указанное количество больше 1. Скидка недоступна.') else
  if AnsiLowerCase(err)='8' then raise EAbort.Create('Выбранный товар не участвует в данной программе. Скидка недоступна.') else
  if AnsiLowerCase(err)='8a' then raise EAbort.Create('Ваша карта не обслуживается в этом городе. Скидка недоступна.') else
  if AnsiLowerCase(err)='8b' then raise EAbort.Create('Ваша карта не обслуживается в этой аптеке. Скидка недоступна.') else
  if AnsiLowerCase(err)='9' then raise EAbort.Create('Продажа данной группы товаров не доступно для этой карты. Скидка не доступна') else
  if AnsiLowerCase(err)='9a' then raise EAbort.Create('Продажа данной группы товаров не доступно для этой карты. Скидка не доступна') else
  if AnsiLowerCase(err)='9b' then raise EAbort.Create('Для указанной карты не сопоставлено значение МП и производитель. Скидка не доступна. Скидка не доступна') else
  if AnsiLowerCase(err)='10' then raise EAbort.Create('Для указанной карты превышен лимит покупок по карте. Скидка не доступна.') else
  if AnsiLowerCase(err)='10a' then raise EAbort.Create('Для указанной карты превышен лимит покупок по выбранной группе. Скидка не доступна.') else
  if AnsiLowerCase(err)='11' then raise EAbort.Create('Ошибка выбора схемы скидки. Скидка не доступна.') else
  if AnsiLowerCase(err)='11a' then raise EAbort.Create('Ошибка выбора схемы скидки. Скидка не доступна.') else
  if AnsiLowerCase(err)='11b' then raise EAbort.Create('Ошибка выбора схемы скидки. Скидка не доступна.') else
  if AnsiLowerCase(err)='12' then raise EAbort.Create('Срок действия плана покупок истек. Скидка не доступна.') else
  if AnsiLowerCase(err)='12a' then raise EAbort.Create('Плана покупок не определен. Скидка не доступна.') else
  if AnsiLowerCase(err)='12b' then raise EAbort.Create('Плана покупок не определен. Скидка не доступна.') else
  if AnsiLowerCase(err)='12c' then raise EAbort.Create('Плана покупок не определен. Скидка не доступна.') else
  if AnsiLowerCase(err)='12d' then raise EAbort.Create('Доступно количество упаковок к выбору только 1. Скидка не доступна.') else
  if AnsiLowerCase(err)='12e' then raise EAbort.Create('Лимит плановых покупок исчерпан. Скидка не доступна.') else
  if AnsiLowerCase(err)='12f' then raise EAbort.Create('Ошибка выбора дизировки. Скидка не доступна.') else
  if AnsiLowerCase(err)='13' then raise EAbort.Create('Не указан поставщик. Скидка не доступна.') else
  if AnsiLowerCase(err)='9c' then raise EAbort.Create('Для Вашей аптеки выбранный товар заблокирован. Обратитесь к администратору программы.') else
  if AnsiLowerCase(err)='13a' then raise EAbort.Create('Указанный поставщик не активен или указан не верный ИД. Скидка не доступна.') else
  if (err='100') or (err='101') or (err='102') or (err='103') or (err='104') then raise EAbort.Create('Mysql запрос вернул пустой результат. Скидка не доступна');
  Result:=False;
 end;

procedure TMainF.SetMediCardSkd;
var i,k:Integer;
    d:Real;
    IsError:Boolean;
    sl:TStringList;
    Mes,err:String;
 begin
  try
//   if Design then Exit;
   if sbMediCard.Down=False then Exit;

   DM.Qr5.Close;
   DM.Qr5.SQL.Clear;
   DM.Qr5.SQL.Text:='select a.art_code from Chek a (nolock), MediCard b (nolock) where a.art_code=b.art_code and skdm is null and compname=host_name() and id_user='+IntToStr(Prm.UserID);
   DM.Qr5.Open;
   if DM.Qr5.IsEmpty then
    begin
     DM.Qr5.Close;
     DM.Qr5.SQL.Clear;
     DM.Qr5.SQL.Text:='select a.art_code from Chek a (nolock), MediCard b (nolock), Plist p (nolock) '+
                      ' where a.art_code=p.art_code and p.makefrom=b.art_code and skdm is null and compname=host_name() and id_user='+IntToStr(Prm.UserID);
     DM.Qr5.Open;
     if DM.Qr5.IsEmpty then Exit;
    end;

   DM.Qr5.Close;
   DM.Qr5.SQL.Clear;
   DM.Qr5.SQL.Add(' select a.art_code as art_codem,a.art_code,b.medi,convert(numeric(8,2),Sum(a.kol))/convert(numeric(8,2),dbo.GetKoefUpak(a.art_code)) as kol ');
   DM.Qr5.SQL.Add(' from Chek a (nolock), MediCard b (nolock) ');
   DM.Qr5.SQL.Add(' where a.art_code=b.art_code and compname=host_name() and id_user='+IntToStr(Prm.UserID)+' group by a.art_code,medi ');
   DM.Qr5.Open;

   if DM.Qr5.IsEmpty then
    begin
     DM.Qr5.Close;
     DM.Qr5.SQL.Clear;
     DM.Qr5.SQL.Add(' select b.art_code as art_codem,a.art_code,b.medi,convert(numeric(8,2),Sum(a.kol))/convert(numeric(8,2),dbo.GetKoefUpak(a.art_code)) as kol ');
     DM.Qr5.SQL.Add(' from Chek a (nolock), MediCard b (nolock), PList p (nolock) ');
     DM.Qr5.SQL.Add(' where a.art_code=p.art_code and p.makefrom=b.art_code and compname=host_name() and id_user='+IntToStr(Prm.UserID)+' group by b.art_code,a.art_code,medi ');
     DM.Qr5.Open;
     if DM.Qr5.IsEmpty then Exit;
    end;
//   ShowMessageI(NumMediCard);
   for i:=1 to DM.Qr5.RecordCount do
    try
     if i=1 then DM.Qr5.First else DM.Qr5.Next;
     SndRecXML.XMLBody:='<?xml version="1.0" encoding="UTF-8"?>'+#10+
                        '<data>'+#10+
                        ' <request_type>1</request_type>'+#10+
                        ' <id_casual>f4c5068424dab2e514f5fe536b5e4a8a</id_casual>'+#10+
                        ' <inside_code>'+IntToStr(Prm.MediID)+'</inside_code>'+#10+
                        ' <card_code>'+GetNumMediCard(NumMediCard)+'</card_code>'+#10+
                        ' <product_code>'+DM.Qr5.FieldByName('art_codem').AsString+'</product_code>'+#10+
                        ' <qty>'+DM.Qr5.FieldByName('kol').AsString+'</qty>'+#10+
                        ' <login></login><password></password>'+#10+
                        '</data>';

//     ShowMessage(SndRecXML.XMLBody);
     SndRecXML.Post;

//     ShowMessage( SndRecXML.Results);

     sl:=TStringList.Create;
     sl.Text:=SndRecXML.Results;
     sl.SaveToFile('D:\ava\medi.txt');

     DM.Qr6.Close;
     DM.Qr6.SQL.Clear;
     DM.Qr6.SQL.Add('insert into Inform..WebLog(Req,Answ,TypeLog)');
     DM.Qr6.SQL.Add('values('''+SndRecXML.XMLBody+''','''+SndRecXML.Results+''',1)');
     DM.Qr6.ExecSQL;
     if SndRecXML.Results='' then Continue;

     err:=GetValueFromXML('error',SndRecXML.Results);
     d:=0;
     k:=0;
     IsError:=True;
     MediCardError(err);
     IsError:=False;

     Mes:=GetValueFromXML('message',SndRecXML.Results);
     try d:=StrToFloat(GetValueFromXML('discont',SndRecXML.Results)); if d<0 then raise EAbort.Create(Mes); except d:=0; end;
     try k:=StrToInt(GetValueFromXML('qty',SndRecXML.Results)); if k<0 then raise EAbort.Create(Mes); except k:=0; end;

     DM.Qr6.Close;
     DM.Qr6.SQL.Clear;
     DM.Qr6.SQL.Add('update Chek set skdm='+FloatToStr(d)+',kolm='+IntToStr(k));
     DM.Qr6.SQL.Add('where art_code='+DM.Qr5.FieldByName('art_code').AsString+' and compname=host_name() and id_user='+IntToStr(Prm.UserID));
     DM.Qr6.ExecSQL;

    except
     on E:Exception do
      begin
       if IsError then raise
                  else MessBox('Ошибка отправки запроса: '+E.Message);
      end;
    end;
  except
   on E:Exception do
    begin
     if IsError then sbMediCard.Down:=False;
     MessBox('Ошибка отправки запроса: '+E.Message);
    end;
  end;
 end;

function TMainF.CheckTypeMDMU:Integer;
 begin
  try
   if Copy(IntToStr(NumMDMUCard),31,3)=MDM_1 then Result:=1 else
   if Pos(Copy(IntToStr(NumMDMUCard),1,3),MDM_2)<>0 then Result:=2
                                                    else Abort;
  except
   Result:=-1;
  end;
 end;

function TMainF.GetLoginMDMU:String;
 begin

// sergey.gabinet@mdmworld.com ящик для техподдержки
// https://t.medreestr.com/  сайт для формирования накладных

{
 Case Prm.AptekaID of

     1:Result:='Konstitutsii 1';
     4:Result:='Lenina9';
    26:Result:='Sumskaya 39';
    12:Result:='Korchagintsev27';
    21:Result:='PoltavskiyShlyah153';
    43:Result:='Balakireva8/1';
   138:Result:='Moskovskiy124a';
    78:Result:='Galana 5';
   225:Result:='Postusheva45';
   179:Result:='Kosiora81';
    28:Result:='Truda9';

   150:Result:='Naberezhna6';
   152:Result:='Lushpu22';
    72:Result:='Lesoparkovaya2';
   178:Result:='Lesoparkovaya7a';
    66:Result:='Pobedu57d';

   166:Result:='Pavlova44b';
   203:Result:='Svobodu41';
    17:Result:='Pobedu70d';
   160:Result:='23Avgusta67a';
   168:Result:='Poltavskiy shlyah41';
    23:Result:='Pushkinskaya65';
   182:Result:='Moskovskiy276v';
    57:Result:='Moskovskiy144';
     5:Result:='Blyuhera21';
    55:Result:='Gagarina244';
    27:Result:='Vernadskogo14';

    45: Result:='Oktyabrskoy Revolyutsii';
  142:Result:='Vosstaniya5/6';

    39: Result:='Proskury5';

  261:Result:='Konstitutsii20';
  258:Result:='Hmelnitskoe96b';
  260:Result:='Shevchenko44';
  266:Result:='Pushkinskaya59';

    68:Result:='Yubileyniy57/106';

    59:Result:='';
    25:Result:='';
    16:Result:='';
    59:Result:='';
    59:Result:='';
    59:Result:='';
    59:Result:='';

  end;
}
  if IsStudyRoom then Result:='Svobodu41'
                 else Result:=GetValueSC(DM.QrEx,'LoginMDMU');
 end;

function TMainF.MDMUCheckLogin:Boolean;
var sR,sR1:TStringStream;
    s,s1,ss:String;
 begin
  try
//   if Design then Exit;
   if CheckTypeMDMU=1 then
    begin
     s1:='checkLoginResult';
//     HTTPRR.URL:='https://exim.mdmworld.com/OrganizationSaleService.asmx';
     HTTPRR.URL:=GetValueSC(DM.QrEx,'SiteMDM')+'OrganizationSaleService.asmx';
     s:='<?xml version="1.0" encoding="utf-8"?>'+#10+
                      '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> '+#10+
                      '  <soap:Body>                                 '+#10+
                      '    <checkLogin xmlns="http://tempuri.org/">  '+#10+
                      '      <aLoginName>Service.Gamma55</aLoginName>         '+#10+
                      '      <aLoginPassword>yvb74_dr19</aLoginPassword> '+#10+
                      '    </checkLogin>                             '+#10+
                      '  </soap:Body>                                '+#10+
                      '</soap:Envelope>                              ';
     HTTPRR.SoapAction:='http://tempuri.org/checkLogin';
    end else
   if CheckTypeMDMU=2 then
    begin
     s1:='checkCardResult';

//     HTTPRR.URL:='http://www.medreestr.com/DefaultS.aspx';
//     HTTPRR.URL:='https://exim.mdmworld.com/CardService.asmx';
     HTTPRR.URL:=GetValueSC(DM.QrEx,'SiteMDM')+'CardService.asmx';

     s:='<?xml version="1.0" encoding="utf-8"?> '+#10+
        '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> '+#10+
        '  <soap:Body>                                   '+#10+
        '    <checkCard xmlns="http://tempuri.org/">     '+#10+
        '      <aMdmCode>'+IntToStr(NumMDMUCard)+'</aMdmCode>               '+#10+
        '      <aLoginName>'+GetLoginMDMU+'</aLoginName>           '+#10+
        '      <aLoginPassword>pass</aLoginPassword>   '+#10+
        '    </checkCard>                                '+#10+
        '  </soap:Body>                                  '+#10+
        '</soap:Envelope>                                ';
     HTTPRR.SoapAction:='http://tempuri.org/checkCard';
    end;

   sR:=TStringStream.Create(s);
   sR1:=TStringStream.Create('');
   try

    DM.Qr6.SQL.Text:=sR.DataString; DM.Qr6.SQL.SaveToFile('C:\Log\Sr_.txt');
    HTTPRR.Execute(sR,sR1);
    DM.Qr6.SQL.Text:=Utf8ToAnsi(sR1.DataString); DM.Qr6.SQL.SaveToFile('C:\Log\Sr_1.txt');
    ss:=Utf8ToAnsi(GetValueFromXML(s1,sR1.DataString));

  //  DM.Qr6.SQL.Text:=ss; DM.Qr6.SQL.SaveToFile('C:\Sr222222.txt');

    if CheckTypeMDMU=2 then
     if AnsiUpperCase(ss)<>AnsiUpperCase('ЏрнХажа ХнстсЯна') then raise EAbort.Create('Карточка не существует либо продажа уже совершена!') else MDMU221TypeCard:=1;

//    ShowMessage(ss);

{
    if CheckTypeMDMU=2 then
     if Not (ss[1] in ['1','2','3'] ) then raise EAbort.Create('Карточка не существует либо продажа уже совершена!') else MDMU221TypeCard:=StrToInt(ss);
}

    Result:=True;
   finally
    sR.Free;
    sR1.Free;
   end;
  except
   on E:Exception do begin MessBox(E.Message,48); Result:=False; DM.Qr6.SQL.Text:=E.Message; DM.Qr6.SQL.SaveToFile('C:\Log\ErrorMDM.txt') end;
  end;
 end;

function TMainF.MDMUSendRealiz(CP:TChekPos):Boolean;
var sR,sR1:TStringStream;
    s,ss:String;
    i:Integer;
 begin
  try
//   Result:=True; Exit;
//   if Design then Exit;
   if NumMDMUCard<0 then  begin Result:=True; Exit; end;

   if CheckTypeMDMU=1 then
    begin
//     HTTPRR.URL:='https://exim.mdmworld.com/OrganizationSaleService.asmx';
     HTTPRR.URL:=GetValueSC(DM.QrEx,'SiteMDM')+'OrganizationSaleService.asmx';

     HTTPRR.SoapAction:='http://tempuri.org/loadSaleList';
     s:='<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">'+#10+
        ' <s:Body>'+#10+
        '  <loadSaleList xmlns="http://tempuri.org/" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">'+#10+
        '   <aSaleList>';
{
   s:='<?xml version="1.0" encoding="utf-8"?>'+#10+
      ' <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">'+#10+
      '  <soap:Body> '+#10+
      '  <loadSaleList xmlns="http://tempuri.org/">';
}
     DM.Qr6.Close;
     DM.Qr6.SQL.Clear;
     DM.Qr6.SQL.Add('select a.date_Chek,b.art_code,b.names,a.cardpref,a.skd,a.numb_chek,a.cena,convert(numeric(8,2),a.cena*(100-a.skd)/100.) as cenaskd, Sum(a.kol) as kol,Sum(a.kol*a.cena)-IsNull(Sum(a.SumSkd),0) as summa,');
     DM.Qr6.SQL.Add('       (select Max(morion) from Inform..SprKoef k (nolock) where k.art_code=b.art_code) as morion');
     DM.Qr6.SQL.Add('from ArhCheks a (nolock), SprTov b (nolock)');
     DM.Qr6.SQL.Add('where a.kod_name=b.kod_name and a.numb_chek='+IntToStr(CP.NumbChek)+' and a.vzh='+IntToStr(CP.Vzh));
     DM.Qr6.SQL.Add('group by a.date_Chek,b.art_code,b.names,a.cardpref,a.skd,a.numb_chek,a.cena');
     DM.Qr6.Open;

    for i:=1 to DM.Qr6.RecordCount do
     begin
      if i=1 then DM.Qr6.First else DM.Qr6.Next;
      s:=s+'     <OrganizationSale> '+#10+
           '      <OrganizationCode>'+IntToStr(Prm.AptekaID)+'</OrganizationCode>'+#10+
           '      <OrganizationMorionCode></OrganizationMorionCode>'+#10+
           '      <OrganizationName>'+Prm.AptekaNameRU+'</OrganizationName>'+#10+
           '      <OrganizationRegion>'+Prm.aObl+'</OrganizationRegion>'+#10+
           '      <OrganizationCity>'+Prm.aCity+'</OrganizationCity>'+#10+
           '      <OrganizationAddress>'+Prm.aAdress+'</OrganizationAddress>'+#10+
           '      <ProductFormCode>'+DM.Qr6.FieldByName('art_code').AsString+'</ProductFormCode>'+#10+
           '      <ProductFormMorionCode>'+DM.Qr6.FieldByName('morion').AsString+'</ProductFormMorionCode>'+#10+
           '      <ProductFormName>'+DM.Qr6.FieldByName('names').AsString+'</ProductFormName>'+#10+
           '      <CheckId></CheckId>'+#10+
           '      <CheckCode>'+DM.Qr6.FieldByName('numb_chek').AsString+'</CheckCode>'+#10+
           '      <CheckDate>'+FormatDateTime('yyyy-mm-dd',DM.Qr6.FieldByName('date_chek').AsDateTime)+'T'+FormatDateTime('hh:nn:ss',DM.Qr6.FieldByName('date_chek').AsDateTime)+'</CheckDate>'+#10+
           '      <MdmCode>'+DM.Qr6.FieldByName('CardPref').AsString+'</MdmCode>'+#10+
           '      <PrimaryPrice>'+DM.Qr6.FieldByName('cena').AsString+'</PrimaryPrice>'+#10+
           '      <Quantity>'+DM.Qr6.FieldByName('kol').AsString+'</Quantity>'+#10+
           '      <Discount>'+DM.Qr6.FieldByName('skd').AsString+'</Discount>'+#10+
           '      <Price>'+DM.Qr6.FieldByName('cenaskd').AsString+'</Price>'+#10+
           '      <Amount>'+DM.Qr6.FieldByName('summa').AsString+'</Amount>'+#10+
           '     </OrganizationSale>';
     end;

     s:=s+'    </aSaleList> '+#10+
          '   <aLoginName>Service.Gamma55</aLoginName>'+#10+
          '   <aLoginPassword>yvb74_dr19</aLoginPassword>'+#10+
          '  </loadSaleList>'+#10+
          ' </s:Body>'+#10+
          '</s:Envelope>';

    end else
   if CheckTypeMDMU=2 then
    begin

     DM.Qr6.Close;
     DM.Qr6.SQL.Clear;

     if EKKA.EmulEKKA then
      begin
       DM.Qr6.SQL.Add('select c.ean13,a.date_Chek,dbo.GetOriginalArt(s.art_code) as art_code,Max(s.names) as names,a.cardpref,'+' a.skd,a.numb_chek,Max(a.cena) as cena,convert(numeric(8,2),Max(a.cena)*(100-a.skd)/100.) as cenaskd, Max(a.cena)*Sum(a.kol) as sumbez, Sum(a.kol) as kol,'+'Sum(a.kol*a.cena)-IsNull(Sum(a.SumSkd),0) as summa,');
       DM.Qr6.SQL.Add('       IsNull((select top 1 koef from Inform..SprKoef k (nolock) where k.art_code=dbo.GetOriginalArt(s.art_code)),1) as koef');
       DM.Qr6.SQL.Add('from ArhCheks a (nolock), SprTov s, SprMDM221 c (nolock) ');
       DM.Qr6.SQL.Add('where a.kod_name=s.kod_name and s.art_code=c.art_code and a.numb_chek='+IntToStr(CP.NumbChek)+' and a.vzh='+IntToStr(CP.Vzh));
       DM.Qr6.SQL.Add('group by c.ean13,a.date_chek,dbo.GetOriginalArt(s.art_code),a.cardpref,a.skd,a.numb_chek');
      end else begin
                DM.Qr6.SQL.Add('select c.ean13,getdate() as date_Chek,dbo.GetOriginalArt(a.art_code) as art_code,Max(a.names) as names '+' ,a.cardpref,a.skd,a.numb_chek,Max(a.cena) as cena,convert(numeric(8,2),Max(a.cena)*(100-a.skd)/100.) as cenaskd, Max(a.cena)*Sum(a.kol) as sumbez, Sum(a.kol) as kol,'+'Sum(a.kol*a.cena)-IsNull(Sum(a.SumSkd),0) as summa,');
                DM.Qr6.SQL.Add('       IsNull((select top 1 koef from Inform..SprKoef k (nolock) where k.art_code=dbo.GetOriginalArt(a.art_code)),1) as koef');
                DM.Qr6.SQL.Add('from Chek a (nolock), SprMDM221 c (nolock) ');
                DM.Qr6.SQL.Add('where a.art_code=c.art_code and a.numb_chek='+IntToStr(CP.NumbChek)+' and a.vzh='+IntToStr(CP.Vzh));
                DM.Qr6.SQL.Add('group by c.ean13,dbo.GetOriginalArt(a.art_code),a.cardpref,a.skd,a.numb_chek');
               end;

     DM.Qr6.SQL.SaveToFile('C:\Log\Mdm.txt');

     DM.Qr6.Open;
     if DM.Qr6.IsEmpty then Exit;

//     HTTPRR.URL:='https://exim.mdmworld.com/CardService.asmx';
     HTTPRR.URL:=GetValueSC(DM.QrEx,'SiteMDM')+'CardService.asmx';

     HTTPRR.SoapAction:='http://tempuri.org/commitCardSale';

     s:='<?xml version="1.0" encoding="utf-8"?> '+#10+
        '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> '+#10+
        '  <soap:Body>                                     '+#10+
        '    <commitCardSale xmlns="http://tempuri.org/">  '+#10+
        '      <aSaleRequest>                              '+#10+
        '        <CheckId>'+IntToStr(CP.ID_Kassa)+IntToStr(CP.NumbChek)+'</CheckId> '+#10+
        '        <CheckCode>'+IntToStr(CP.NumbChek)+'</CheckCode>             '+#10+
        '        <CheckDate>'+FormatDateTime('yyyy-mm-dd',DM.Qr6.FieldByName('date_chek').AsDateTime)+'T'+FormatDateTime('hh:nn:ss',DM.Qr6.FieldByName('date_chek').AsDateTime)+'</CheckDate>           '+#10+
        '        <Items>                                   ';

     for i:=1 to DM.Qr6.RecordCount do
      begin
       if i=1 then DM.Qr6.First else DM.Qr6.Next;
       s:=s+'<CardSaleRequestItem>                    '+#10+
            '<ItemId>'+IntToStr(i)+'</ItemId>                   '+#10+
            '<MdmCode>'+IntToStr(NumMDMUCard)+'</MdmCode>                 '+#10+
            '<ProductFormCode>'+DM.Qr6.FieldByName('EAN13').AsString+'</ProductFormCode> '+#10+
            '<SaleType>1</SaleType>               '+#10+
{
            '<PrimaryPrice>'+CurrToStrF(DM.Qr6.FieldByName('Cena').AsFloat*DM.Qr6.FieldByName('Koef').AsFloat,ffFixed,2)+'</PrimaryPrice>       '+#10+
            '<PrimaryAmount>'+DM.Qr6.FieldByName('SumBez').AsString+'</PrimaryAmount>     '+#10+
            '<RequestedPrice>'+CurrToStrF(DM.Qr6.FieldByName('CenaSkd').AsFloat*DM.Qr6.FieldByName('Koef').AsFloat,ffFixed,2)+'</RequestedPrice>  '+#10+
            '<RequestedQuantity>'+CurrToStrF(DM.Qr6.FieldByName('Kol').AsInteger/DM.Qr6.FieldByName('Koef').AsInteger,ffFixed,2)+'</RequestedQuantity> '+#10+
            '<RequestedAmount>'+DM.Qr6.FieldByName('Summa').AsString+'</RequestedAmount>     '+#10+
}
            '<PrimaryPrice>'+CurrToStrF(DM.Qr6.FieldByName('Cena').AsFloat*DM.Qr6.FieldByName('Koef').AsFloat,ffFixed,2)+'</PrimaryPrice>       '+#10+
            '<PrimaryAmount>'+DM.Qr6.FieldByName('SumBez').AsString+'</PrimaryAmount>     '+#10+
            '<RequestedPrice>'+CurrToStrF(DM.Qr6.FieldByName('Cena').AsFloat*DM.Qr6.FieldByName('Koef').AsFloat,ffFixed,2)+'</RequestedPrice>  '+#10+
            '<RequestedAmount>'+DM.Qr6.FieldByName('SumBez').AsString+'</RequestedAmount>     '+#10+
            '<RequestedQuantity>'+CurrToStrF(DM.Qr6.FieldByName('Kol').AsInteger/DM.Qr6.FieldByName('Koef').AsInteger,ffFixed,2)+'</RequestedQuantity> '+#10+
            //            '<MedicineSaleId>string</MedicineSaleId>        '+#10+
            '</CardSaleRequestItem>                           ';
      end;

     s:=s+'       </Items>                       '+#10+
          '      </aSaleRequest>                 '+#10+
          '      <aLoginName>'+GetLoginMDMU+'</aLoginName> '+#10+
          '      <aLoginPassword>pass</aLoginPassword> '+#10+
          '    </commitCardSale>  '+#10+
          '  </soap:Body>         '+#10+
          '</soap:Envelope> ';
    end;

{
   s:=s+'    </aSaleList> '+#10+
        '   <aLoginName>Service.Gamma55</aLoginName>'+#10+
        '   <aLoginPassword>yvb74_dr19</aLoginPassword>'+#10+
        '  </loadSaleList>'+#10+
        ' </soap:Body>'+#10+
        '</soap:Envelope>';
}

   sR:=TStringStream.Create(s);
   DM.Qr6.Close;
   DM.Qr6.SQL.Text:=AnsiToUtf8(sR.DataString); DM.Qr6.SQL.SaveToFile('C:\Log\RSr.txt');

   sR1:=TStringStream.Create('');
   try
    HTTPRR.Execute(sR,sR1);
    DM.Qr6.SQL.Text:=Utf8ToAnsi(sR1.DataString); DM.Qr6.SQL.SaveToFile('C:\Log\RSr1.txt');
    ss:=Utf8ToAnsi(GetValueFromXML('ResultDescription',sR1.DataString));


    if CheckTypeMDMU=2 then
     if AnsiUpperCase(ss)<>AnsiUpperCase('ЏрнХажа нссществлена') then raise EAbort.Create('Продажа не разрешена!');
    Result:=True;
   finally
    sR1.Free;
    sR.Free;
   end;
  except
   on E:Exception do
    begin
     Result:=False;
     MessBox(E.Message);
    end;
  end;
 end;


function TMainF.MediSendRealiz(CP:TChekPos):Boolean;
var sR,sR1:TStringStream;
    s:String;
    i:Integer;
    Nc:Int64;
    NumCrd:String;
    err:String;
    B:Boolean;
    sP:String;
 begin
  B:=False;
  if (NumMediCard<0) then begin Result:=True; Exit; end;

  Result:=False;
  try
   sP:='0';
   if (EKKA.EmulEKKA=True) or (EKKA.UseEKKA=False) then sP:='1';
   DM.Qr6.Close;
   DM.Qr6.SQL.Text:='exec spY_MediCardList '+IntToStr(CP.NumbChek)+','+IntToStr(CP.Vzh)+','+sP;
   DM.Qr6.SQL.SaveToFile('c:\log\spY_MediCardList.txt');
   DM.Qr6.Open;
//   ShowMessage(IntToStr(DM.Qr6.RecordCount));
   for i:=1 to DM.Qr6.RecordCount do
    begin
     if i=1 then DM.Qr6.First else DM.Qr6.Next;

     if CP.CardPref=0 then Nc:=StrToInt64(DM.Qr6.FieldByName('cardpref').AsString)
                      else Nc:=CP.CardPref;
     NumCrd:=GetNumMediCard(Nc);

     if Length(NumCrd)<>13 then raise EAbort.Create('Номер карты некорректный!');

     SndRecXML.XMLBody:='<?xml version="1.0" encoding="UTF-8"?>'+#10+
                        '<data>'+#10+
                        ' <request_type>2</request_type>'+#10+
                        ' <id_casual>f4c5068424dab2e514f5fe536b5e4a8a</id_casual>'+#10+
                        ' <inside_code>'+IntToStr(Prm.MediID)+'</inside_code>'+#10+
                        ' <id_alter>'+DM.Qr6.FieldByName('numb_chek').AsString+'</id_alter>'+#10+
                        ' <card_code>'+NumCrd+'</card_code>'+#10+
                        ' <product_code>'+DM.Qr6.FieldByName('art_code').AsString+'</product_code>'+#10+
                        ' <price>'+DM.Qr6.FieldByName('cena').AsString+'</price>'+#10+
                        ' <qty>'+DM.Qr6.FieldByName('kol').AsString+'</qty>'+#10+
                        ' <rezerv>'+DM.Qr6.FieldByName('cena').AsString+'</rezerv>'+#10+
                        ' <discont_percent>'+DM.Qr6.FieldByName('skd').AsString+'</discont_percent>'+#10+
                        ' <discont_value>'+DM.Qr6.FieldByName('sumskd').AsString+'</discont_value>'+#10+
                        ' <sale_date>'+FormatDateTime('yyyy-mm-dd hh:nn:ss',DM.Qr6.FieldByName('date_chek').AsDateTime)+'</sale_date>'+#10+
                        ' <login></login><password></password>'+#10+
                        '</data>';
     DM.QrEx.Close;
     DM.QrEx.SQL.Clear;
     DM.QrEx.SQL.Add('insert into Inform..WebLog(Req,TypeLog)');
     DM.QrEx.SQL.Add('values('''+SndRecXML.XMLBody+''',2)');
     DM.QrEx.SQL.SaveToFile('C:\log\WebLogReq.txt');
     DM.QrEx.ExecSQL;

     SndRecXML.Post;
     B:=True;
     DM.QrEx.Close;
     DM.QrEx.SQL.Clear;
     DM.QrEx.SQL.Add('insert into Inform..WebLog(Req,Answ,TypeLog)');
     DM.QrEx.SQL.Add('values('''+SndRecXML.XMLBody+''','''+SndRecXML.Results+''',3)');
     DM.QrEx.SQL.SaveToFile('C:\log\WebLogAnsw.txt');
     DM.QrEx.ExecSQL;
//     ShowMessage(SndRecXML.Results);
     err:=GetValueFromXML('error',SndRecXML.Results);
     MediCardError(err);
    end;
   if B=True then Result:=True;
  except
   on E:Exception do MainF.RegisterError('Терапия+ отправка реализации','Ошибка отправки запроса: '+E.Message,False);
  end;
 end;

procedure TMainF.SetSkdMag(Sender:TObject; B:Boolean);
 begin
  if (Sender=nil) and (B=False) then
   begin
    if B=False then
     begin
      sbProf.Down:=False;
      sbMag.Down:=False;
      sbMediCard.Down:=False;
      sbMDMU.Down:=False;
      sbMDMU1.Down:=False;
     end;

    if sbMag.Down=False then NumCardMag:=-1;
    if sbProf.Down=False then NumCardProf:=-1;
    if sbMediCard.Down=False then NumMediCard:=-1;
    if (sbMDMU.Down=False) or (sbMDMU1.Down=False) then NumMDMUCard:=-1;
   end;

  if Sender<>nil then
   begin
    if (sbMag.Down=True) and (Sender=sbMag) then
     begin
      NumCardMag:=GetEANDiag('','флаере');
      if NumCardMag=-1 then sbMag.Down:=False;

      if (Copy(IntToStr(NumCardMag),1,3)=CR_PROH) and (Date>=StrToDate('20.08.15')) and (Date<=StrToDate('30.09.15')) and (Prm.AptekaID in [21,23,26,78,138,211,230]) then
       begin
        if DM.qrChek.IsEmpty=False then
         begin
          NumCardMag:=-1;
          MainF.MessBox('Чтобы провести данный флаер чек должен быть пустым!');
          sbMag.Down:=False;
          Exit;
         end;
        if DM.spY_FilterSklad.Locate('art_code',154105,[]) then
         try
          FFlagProh:=True;
          PrevEnterKol(EK_DIALOG,0,154105);
         finally
          FFlagProh:=False;
         end;
       end else
      if Copy(IntToStr(NumCardMag),1,3)='252' then // флаер на Сингуляр
       try
        DM.QrX.Close;
        DM.QrX.SQL.Clear;
        DM.QrX.SQL.Add('');
        DM.QrX.SQL.Add('declare @art int, ');
        DM.QrX.SQL.Add('        @Kol1 int, ');
        DM.QrX.SQL.Add('        @Kol2 int, ');
        DM.QrX.SQL.Add('        @SError varchar(8000), ');
        DM.QrX.SQL.Add('        @IError int ');
        DM.QrX.SQL.Add('exec ['+Prm.ServerDB+'].ekka_net.dbo.spY_GetKolSingular '+IntToStr(Prm.UserID)+','+Copy(IntToStr(NumCardMag),1,12)+',@art output, @Kol1 output, @Kol2 output, @SError output, @IError output');
        DM.QrX.SQL.Add('select @art as art_code, @Kol1 as Kol1, @Kol2 as Kol2,@IError as IError, @SError as SError');
        DM.QrX.Open;

        if DM.QrX.FieldByName('IError').AsInteger=0 then
         begin
          FsArt_Code:=DM.QrX.FieldByName('Art_code').AsInteger;
          FsKol1:=DM.QrX.FieldByName('Kol1').AsInteger;
          FsKol2:=DM.QrX.FieldByName('Kol2').AsInteger;
         end else begin
                   MessBox(DM.QrX.FieldByName('SError').AsString);
                   NumCardMag:=-1;
                   sbMag.Down:=False;
                   Exit;
                  end
       except
        on E:Exception do
         begin
          MainF.RegisterError('Определение продаж по акции сингуляр!',E.Message,True);
          NumCardMag:=-1;
          sbMag.Down:=False;
          Exit;
         end;
       end;

     end else
   if (sbProf.Down=True) and (Sender=sbProf) then
    begin
     NumCardProf:=GetEANDiag('201','карточке профармы');
     if NumCardProf=-1 then sbProf.Down:=False;
    end else
   if (sbMediCard.Down=True) and (Sender=sbMediCard) then
    begin
     NumMediCard:=GetEANDiag('MD0,md0,ьв0,ЬВ0,000','карточке Терапия+',13);
     if NumMediCard=-1 then sbMediCard.Down:=False;
    end else
   if (sbMDMU.Down=True) and (Sender=sbMDMU) then
    begin
     NumMDMUCard:=GetEANDiag(MDM_1,'карточке MDM Ukraine',13,13);
     if (NumMDMUCard<>-1) and (MDMUCheckLogin=False) then NumMDMUCard:=-1;
     if NumMDMUCard=-1 then sbMDMU.Down:=False;
    end else
   if (sbMDMU1.Down=True) and (Sender=sbMDMU1) then
    begin
     NumMDMUCard:=GetEANDiag(MDM_2,'карточке MDM ',13,13);
     if (NumMDMUCard<>-1) and (MDMUCheckLogin=False) then NumMDMUCard:=-1;
     if NumMDMUCard=-1 then sbMDMU1.Down:=False;
    end
   end;
 end;

procedure TMainF.miPredstKROClick(Sender:TObject);
 begin
  try
   RegPredstF:=TRegPredstF.Create(Self);
   try
    RegPredstF.crPref:=CR_KRO;
    RegPredstF.Cap:='представителя КРО';
    RegPredstF.Tab:='RegKRO';
    Application.ProcessMessages;
    RegPredstF.ShowModal;
   finally
    RegPredstF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end; {miPredstKROClick}

procedure TMainF.btnReadStrClick(Sender:TObject);
 begin
  edFN.Text:=IntToStr(EKKA.FN);
  DM.Qr3.Close;
  DM.Qr3.SQL.Text:='select Value from Spr_Const (nolock) where Descr=''ePN''';
  DM.Qr3.Open;
  edPN.Text:=DM.Qr3.FieldByName('Value').AsString;

  DM.Qr3.Close;
  DM.Qr3.SQL.Text:='select Value from Spr_Const (nolock) where Descr=''eID''';
  DM.Qr3.Open;
  edID.Text:=DM.Qr3.FieldByName('Value').AsString;

  DM.Qr3.Close;
  DM.Qr3.SQL.Text:='select Value from Spr_Const (nolock) where Descr=''eStr1''';
  DM.Qr3.Open;
  edStr1.Text:=DM.Qr3.FieldByName('Value').AsString;

  DM.Qr3.Close;
  DM.Qr3.SQL.Text:='select Value from Spr_Const (nolock) where Descr=''eStr2''';
  DM.Qr3.Open;
  edStr2.Text:=DM.Qr3.FieldByName('Value').AsString;
                                            
  DM.Qr3.Close;
  DM.Qr3.SQL.Text:='select Value from Spr_Const (nolock) where Descr=''eStr3''';
  DM.Qr3.Open;
  edStr3.Text:=DM.Qr3.FieldByName('Value').AsString;

  DM.Qr3.Close;
  DM.Qr3.SQL.Text:='select Value from Spr_Const (nolock) where Descr=''eStr4''';
  DM.Qr3.Open;
  edStr4.Text:=DM.Qr3.FieldByName('Value').AsString;

  edHead.Text:=Prm.FirmNameUA;

  btnSetStr.Enabled:=True;
 end;

procedure TMainF.sbReciptClick(Sender: TObject);
 begin
  if sbRecipt.Down=True then
   begin
    NumCardRecipt:=GetEANDiag('231,237','рецепте');
    if NumCardRecipt=-1 then sbRecipt.Down:=False;
   end else NumCardRecipt:=-1;
 end;

procedure TMainF.miSktretchChekClick(Sender: TObject);
 begin
  if Opt.EKKAAsPrinter then
   begin
    MessBox('На этой кассе оплата сертификатами невозможна! Проведите продажу на другой кассe.');
    Exit;
   end;

  try
{
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select IsNull((select Value from Spr_Const where Descr=''OplSertif''),0) as V ';
   DM.Qr.Open;

   if DM.Qr.FieldByName('V').AsInteger=0 then
    begin
     MainF.MessBox('Продажа по сертификатам времменно запрещена!');
     Exit;
    end;
}
   FTypeChek:=TC_STRETCH;
   OpenChek;
  except
  end;
 end;

procedure TMainF.N1Click(Sender:TObject);
 begin
  if Opt.EKKAAsPrinter then
   begin
    MessBox('На этой кассе оплата по баллам "Мама и малыш" невозможна! Проведите продажу на другой кассe.');
    Exit;
   end;
  FTypeChek:=TC_MOMBABY;
  OpenChek;
 end;

procedure TMainF.N43Click(Sender:TObject);
 begin
  FTypeChek:=TC_SROK;
  OpenChek;
 end;

procedure TMainF.UpdateVersion(Path,FName:String; FDt:TDatetime);
var Er,FN1,PFN:String;

 begin
  try
   if (DM.qrChek.IsEmpty=True) and (NewVersion=True) then
    begin
     MessBox('Произошло обновление программных модулей программа будет закрыта! Если программа не закрывается сама - закройте ее сами! После закрытия откройте ее заново!');
     FNewVersion:=False;
     Close;
     Halt(1);
    end;

   Path:=ExcludeTrailingBackSlash(Path);
   PFN:=IncludeTrailingBackSlash(Path)+FName;
   FN1:='\'+MyFileName(FName)+'1.exe';
//   ShowMessage('Проверяем версию...');

   DM.qrChVer.Close;
   DM.qrChVer.SQL.Text:='select exename from NewExe (nolock) where exename='''+ExtractFileName(PFN)+
                        ''' and dateexe>'''+FormatDateTime('yyyy-mm-dd hh:nn:ss',FDt)+'''';

//    DM.qrChVer.SQL.SaveToFile('D:\ava\NE.sql');
   DM.qrChVer.Open;
   if DM.qrChVer.IsEmpty=False then
    begin
     ForceDirectories(Path);
//     ShowMessage('Есть новая версия...');
     DeleteFile(Path+FN1);
     if FileExists(PFN) then RenameFile(PFN,Path+FN1);
     if FileExists(PFN) then Abort;

//     ShowMessage('Старый файл переименован...');
     SaveExeFromSQL(DM.qrCopy,Path,FName,Er);

     if Not FileExists(PFN) then
      begin
       RenameFile(Path+FN1,PFN);
//       ShowMessage('Возвращаем пердыдущую версию...');
      end else
     if AnsiLowerCase(PFN)=AnsiLowerCase(Application.ExeName) then
      begin
       FNewVersion:=True;
{       MessBox('По техническим причинам программа будет закрыта! После закрытия откройте ее заново!');
       Close;
}
      end;
    end;  //else ShowMessage('Новой версии нет...');
  except
  end;
 end;

// Проверяем не появилась ли новая версия программы
procedure TMainF.tmrUpdateVersionTimer(Sender:TObject);
var Path:String;
    FDt:TDateTime;
    i:Integer;
    RStoped,B:Boolean;
 begin
//  if Prm.VSPriznak=1 then Exit;
//  if Design then Exit;
  try
   tmrUpdateVersion.Enabled:=False;
   try
    DM.tmprU.Close;
    DM.tmprU.SQL.Text:='select dateexe,exename,fpath,serveronly from NewExe (nolock) ';
    DM.tmprU.Open;

    for i:=1 to DM.tmprU.RecordCount do
     begin
      if i=1 then DM.tmprU.First else DM.tmprU.Next;

      if (DM.tmprU.FieldByName('ServerOnly').AsInteger=1) and (IsServer=False) then Continue;

      if DM.tmprU.FieldByName('FPath').AsString='' then Path:=IncludeTrailingBackSlash(PrPath)
                                                   else Path:=IncludeTrailingBackSlash(DM.tmprU.FieldByName('FPath').AsString);

      UpdateVersion(Path,DM.tmprU.FieldByName('ExeName').AsString,GetFileDateTime(Path+DM.tmprU.FieldByName('ExeName').AsString));
     end;

   except
    on E:Exception do
     MainF.RegisterError('Обновление exe-файлов.',E.Message,True);
   end;

   // Обновление и запуск рекламного ролика
   if Opt.PlayRolik then
    try
     RStoped:=False;
     if Assigned(PlayRolikF) then
      try
       if PlayRolikF.mpMain.Position>=PlayRolikF.mpMain.Length then
        begin
         PlayRolikF.mpMain.Stop;
         PlayRolikF.mpMain.Position:=0;
         RStoped:=True;
        end;
      except
       RStoped:=True;
      end;
     B:=False;

     if Assigned(PlayRolikF) then
      if PlayRolikF.mpMain.Mode in [mpPaused] then B:=True;

     if (RStoped=True) and (FileExists(PlayRolikF.PathAVA+PlayRolikF.FNameR)) then
      begin
       if Assigned(PlayRolikF) then
        try
         PlayRolikF.mpMain.Close;
        except
        end;
       DeleteFile(PlayRolikF.PathRolik+PlayRolikF.FNameR);
       ForceDirectories(PlayRolikF.PathRolik);
       CopyFile(PChar(PlayRolikF.PathAVA+PlayRolikF.FNameR),PChar(PlayRolikF.PathRolik+PlayRolikF.FNameR),False);
       if CompareFiles(PlayRolikF.PathAVA+PlayRolikF.FNameR,PlayRolikF.PathRolik+PlayRolikF.FNameR) then
        DeleteFile(PlayRolikF.PathAVA+PlayRolikF.FNameR);
       if FileExists(PlayRolikF.PathRolik+PlayRolikF.FNameR) then

       if Assigned(PlayRolikF) then PlayRolikF.mpMain.Open;

      end;

     if Assigned(PlayRolikF) and (B=False) then
      begin
       DM.tmprU.Close;
       DM.tmprU.SQL.Text:='select IsNull((select Value from Spr_Const where Descr=''NoPlayRolik''),0) as Res ';
       DM.tmprU.Open;
       if DM.tmprU.FieldByName('Res').AsInteger=0 then
        begin
         miRolik.Enabled:=True;
         PlayRolikF.mpMain.Play;
         PlayRolikF.mpMain.EnabledButtons:=[btStop,btPause];
        end else miRolik.Enabled:=False;
      end;

    except
     on E:Exception do
      MainF.RegisterError('Проигрывание рекламного ролика',E.Message,True);
    end;

  finally
   tmrUpdateVersion.Enabled:=True;
  end;
 end; {tmrUpdateVersionTimer}

procedure TMainF.miBackToSkladClick(Sender:TObject);
 begin
  ShowWorkSprF(W_BACK1);
 end;

procedure TMainF.miProfarmaClick(Sender:TObject);
 begin
  FTypeChek:=TC_PROFARMA;
  OpenChek;
 end;

function TMainF.GetPasswRep(P:Byte=0):String;
 begin
  try
   DM.qrEx1.Close;
   Case P of
    0:DM.qrEx1.SQL.Text:='select Value from Spr_Const (nolock) where Descr=''Passw''';
    1:DM.qrEx1.SQL.Text:='select Value from Spr_Const (nolock) where Descr=''Passw1''';
   end;
   DM.qrEx1.Open;
   if DM.qrEx1.IsEmpty then Abort;
   Result:=DM.qrEx1.FieldByName('Value').AsString;
  except
   Case P of
    0:Result:='911';
    1:Result:='112233';
   end; 
  end;
 end;

procedure TMainF.N6Click(Sender: TObject);
 begin
  try
   AkciiF:=TAkciiF.Create(Self);
   try
    Application.ProcessMessages;
    AkciiF.ShowModal;
   finally
    AkciiF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.btnSetStrClick(Sender: TObject);
var i:Integer;
 begin
  try
   if Length(edFN.Text)<>10 then
    begin
     MainF.MessBox('Фискальный номер должен состоять из 10 цифр');
     Exit;
    end;

   for i:=1 to Length(edFN.Text) do
    if Not (edFN.Text[i] in ['0'..'9']) then
     begin
      MainF.MessBox('Фискальный номер должен состоять из 10 цифр');
      Exit;
     end;

   if Not EKKA.fpSetINSP(edFN.Text,edID.Text,edPN.Text,edStr1.Text,edStr2.Text,edStr3.Text,edStr4.Text) then raise EAbort.Create(EKKA.LastErrorDescr);
   if Not EKKA.fpSetHead(edHead.Text) then raise EAbort.Create(EKKA.LastErrorDescr);
   EKKA.fpZeroCheck;
   EKKA.fpXRep;
   BitBtn10Click(BitBtn10);
  except
   on E:Exception do MessBox(E.Message);
  end;
 end;

procedure TMainF.N7Click(Sender:TObject);
 begin
  try
   MBSpisF:=TMBSpisF.Create(Self);
   try
    Application.ProcessMessages;
    MBSpisF.ShowModal;
   finally
    MBSpisF.Free;
   end;
  except
   on E:Exception do MessBox('Ошибка доступа к справочнику "Мама и малыш": '+E.Message);
  end;
 end;

procedure TMainF.edPercShowChange(Sender: TObject);
 begin
{  dbgSklad.Repaint;
  dbgSklad.Columns[12].Title.Caption:='Ц - '+IntToStr(upPercShow.Position)+' %';
  dbgSklad.Columns[13].Title.Caption:='Ц уп- '+IntToStr(upPercShow.Position)+' %';
}
 end;

procedure TMainF.N9Click(Sender: TObject);
 begin
  try
   ProvizInfoF:=TProvizInfoF.Create(Self);
   try
    Application.ProcessMessages;
    ProvizInfoF.ShowModal;
   finally
    ProvizInfoF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.N11Click(Sender:TObject);
var Ooo:TOpenOffice;
 begin
//  ShowMessage('\\'+Opt.Server+'\AVA\Инструкция для кассира или провизора НОВАЯ.doc');
//  WinExec(PChar('\\'+Opt.Server+'\AVA\Инструкция для кассира или провизора НОВАЯ.doc'),SW_SHOW);
//  ShellExecute(0,'open',PChar('\\'+Opt.Server+'\AVA\Инструкция для кассира или провизора НОВАЯ.doc'),'',nil,SW_SHOWNORMAL);
  Ooo:=TOpenOffice.Create;
  if Not Ooo.Connect then Exit;
  if Not CompareFiles('D:\AVA\Инструкция для кассира или провизора НОВАЯ.doc','\\'+Opt.Server+'\AVA\Инструкция для кассира или провизора НОВАЯ.doc') then
   CopyFile(PChar('\\'+Opt.Server+'\AVA\Инструкция для кассира или провизора НОВАЯ.doc'),PChar('D:\AVA\Инструкция для кассира или провизора НОВАЯ.doc'),False);
  Ooo.OpenDocument('D:\AVA\Инструкция для кассира или провизора НОВАЯ.doc');
//  Ooo.OpenDocument('D:\AVA\Инструкция для кассира или провизора НОВАЯ.doc');
 end;

procedure TMainF.N15Click(Sender:TObject);
 begin
  try
   RegPredstF:=TRegPredstF.Create(Self);
   try
    RegPredstF.crPref:=CR_DRIVER;
    RegPredstF.Cap:='водителя';
    RegPredstF.Tab:='RegDrivers';
    Application.ProcessMessages;
    RegPredstF.ShowModal;
   finally
    RegPredstF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.N12Click(Sender:TObject);
 begin
  try
   SignInfoF:=TSignInfoF.Create(Self);
   try
    Application.ProcessMessages;
    SignInfoF.ShowModal;
   finally
    SignInfoF.Free;
   end;
  except
  end;
 end;

procedure TMainF.miHotKeyInfoClick(Sender:TObject);
 begin
  try
   HotKeyInfoF:=THotKeyInfoF.Create(Self);
   try
    Application.ProcessMessages;
    HotKeyInfoF.ShowModal;
   finally
    HotKeyInfoF.Free;
   end;
  except
  end;
 end;

procedure TMainF.BitBtn1Click(Sender:TObject);
 begin
  ShowMEssage(GetIPAddress(edKassaTxt.Text));
 end;

procedure TMainF.N14Click(Sender:TObject);
 begin
  try
   TabelF:=TTabelF.Create(Self);
   try
    Application.ProcessMessages;
    TabelF.ShowModal;
   finally
    TabelF.Free;
   end;
  except
  end;
 end;

procedure TMainF.sbBSkdClick(Sender:TObject);
 begin
  RefreshChek;
 end;

procedure TMainF.sbGoldGClick(Sender:TObject);
 begin
  if MaxSkd=-1 then
   begin
    sbGoldG.Down:=False;
    Exit;
   end;

  if sbGoldG.Down then
   if MessBox('Вы уверены что платежная карта, является картой банка "Золотые ворота"?',52)<>ID_YES then
    begin
     sbGoldG.Down:=False;
     Exit;
    end;
  RefreshChek;

 end;

procedure TMainF.sbMDMUClick(Sender:TObject);
var Res:String;
 begin
  if (Sender=sbMDMU1) and (Opt.EKKAAsPrinter=True) then
   begin

    MessBox('На этой кассе оплата по карточке "Ради жизни, свобода движения" невозможна! Проведите продажу на другой кассe.');
    TSpeedButton(Sender).Down:=False;
    Exit;

    MessBox('Внимание! По карточке "Ради жизни, свобода движения" можно продавать только ЦЕЛЫЕ упаковки препаратов!',
             48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);

   end else
  if (Sender=sbMDMU) and (Opt.EKKAAsPrinter=True) then
   begin
    MessBox('На этой кассе оплата по карточке "MDMU 482" невозможна! Проведите продажу на другой кассe.');
    TSpeedButton(Sender).Down:=False;
    Exit;
   end else
  if (Sender=sbMDMU1) and (DM.qrChek.IsEmpty=False) then
   begin
    MessBox('Карточку MDMU нужно проводить в начале чека!');
    Exit;
   end;
  if TSpeedButton(Sender).Down then Type_Skd:=SK_NONE;
  SetSkdMag(Sender,True);
  RefreshChek;
 end;

procedure TMainF.N16Click(Sender:TObject);
 begin
  try
   CountersF:=TCountersF.Create(Self);
   try
    Application.ProcessMessages;
    CountersF.ShowModal;
   finally
    CountersF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.miLTMClick(Sender:TObject);
 begin
{
 try
   LTMF:=TLTMF.Create(Self);
   try
    LTMF.ShowModal;
   finally
    LTMF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
}
  ShowWorkSprF(W_LTM);
 end;


procedure TMainF.miPilottmpClick(Sender:TObject);
 begin
  FTypeChek:=TC_PILOT;
  OpenChek;
 end;

procedure TMainF.EKKA1Click(Sender:TObject);
 begin
  EKKA.fpCheckCopy;
 end;

procedure TMainF.N17Click(Sender:TObject);
 begin
 {
  try
   CalcZarplF:=TCalcZarplF.Create(Self);
   try
    CalcZarplF.ShowModal;
   finally
    CalcZarplF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 }
 end;

procedure TMainF.N18Click(Sender:TObject);
var S:String;
    B:Boolean;
 begin
  if Not EnterStrValue(S,'Введите строку для поиска назначения (пустая строка - все назначения)') then Exit;
  try

   DM.qrNazn.Close;
   DM.qrNazn.SQL.Text:='select pr from SprZamPrem (nolock) where pr like ''%'+S+'%'' group by pr order by 1';
   DM.qrNazn.Open;

   if DM.qrNazn.IsEmpty then
    begin
     MessBox('По строке "'+S+'" не найдено ни одного назначения!');
     Exit;
    end;

   FirstRecomendF:=TFirstRecomendF.Create(Self);
   try
    Application.ProcessMessages;
    FirstRecomendF.ShowModal;
    if FirstRecomendF.Flag>0 then
     begin
      B:=True;
      if dbgSklad.DataSource.DataSet.Locate('Art_Code',FirstRecomendF.Flag,[loCaseInsensitive,loPartialKey]) then
       begin
        if dbgSklad.DataSource.DataSet.FieldByName('Ostat').AsInteger<=0 then B:=False
                                                                         else PrevEnterKol(EK_DIALOG,FirstRecomendF.ArtDop,FirstRecomendF.Flag);
       end else B:=False;
      if Not B then MainF.MessBox('Выбранного препарата нет на остатках!');
     end;

   finally
    FirstRecomendF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.MDMU1Click(Sender:TObject);
 begin
  if Not(IsPermit([R_ADMIN],P_ALERT)) then Exit;
  try
   PrihodMDMF:=TPrihodMDMF.Create(Self);
   try
    Application.ProcessMessages;
    PrihodMDMF.ShowModal;
   finally
    PrihodMDMF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.miOstatInBSkladClick(Sender:TObject);
 begin
  try
   OstatInBSkladF:=TOstatInBSkladF.Create(Self);
   try
    Application.ProcessMessages;
    OstatInBSkladF.ShowModal;
   finally
    OstatInBSkladF.Free;
   end;
  except
  end;
 end;

procedure TMainF.N19Click(Sender:TObject);
 begin
  if  MainF.MessBox('Сжатие базы может занять некоторое время (5-15 минут) и во время сжатия все компьюетеры будут тормозить!'#10'Начать сжатие прямо сейчас?',52)<>ID_YES then Exit;
  try
   DM.spY_ReindexBases.Close;
   DM.spY_ReindexBases.ExecProc;
   MainF.MessBox('Базы сжаты успешны!',64);
  except
   on E:Exception do MainF.MessBox('Ошибка сжатия баз: '+E.Message);
  end;
 end;

procedure TMainF.N20Click(Sender: TObject);
 begin
  try
   KoefF:=TKoefF.Create(Self);
   try
    Application.ProcessMessages;
    KoefF.ShowModal;
   finally
    KoefF.Free;
   end;
  except
  end;
 end;

procedure TMainF.N21Click(Sender: TObject);
 begin
  if Not IsPermit([R_SUPER],P_ALERT) then Exit;

  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select top 1 art_code from Chek (nolock) where id_user<0';
   DM.QrEx.Open;
   if DM.QrEx.RecordCount<=0 then begin MessBox('Нет активных возвратов по списку!',64); Exit; end;

   if MessBox('Вы действительно хотите очистить списки для возвратов?'#10#10'Очистку можно проводить, если у вас нет текущих возвратов по списку, в противном случае вам заново придется сканировать ранее отсканированные позиции!'
              +#10#10'Нажмите "ДА" для очистки'#10'"НЕТ" для отмены операции.',52)<>ID_YES then Exit;
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add(' begin tran  ');
   DM.QrEx.SQL.Add(' update SprTov  ');
   DM.QrEx.SQL.Add(' set Ostat=Ostat+a.kol ');
   DM.QrEx.SQL.Add(' from Chek a (nolock) ,SprTov b (nolock)  ');
   DM.QrEx.SQL.Add(' where a.kod_name=b.kod_name and a.id_user<0 ');
   DM.QrEx.SQL.Add(' delete from chek where id_user<0 ');
   DM.QrEx.SQL.Add(' commit tran  ');
   DM.QrEx.ExecSQL;

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select top 1 art_code from Chek (nolock) where id_user<0';
   DM.QrEx.Open;
   if DM.QrEx.RecordCount>0 then Abort;
   Prm.VSPriznak:=0;
   MessBox('Список очищен успешно!',64);
  except
   on E:Exception do MessBox('Ошибка очистки списка: '+E.Message);
  end;
 end;

procedure TMainF.FormCloseQuery(Sender:TObject; var CanClose:Boolean);
 begin
  if FCloseFirst=0 then
   begin
    try
     DM.QrEx.Close;
     DM.QrEx.SQL.Text:='select top 1 art_code from Chek (nolock) where id_user<0';
     DM.QrEx.Open;

     if DM.QrEx.RecordCount>0 then
      begin
       MainF.MessBox('Имеются активные возвраты по списку!'#10#10'Их необходимо закрыть, зайдя в "Операции -> Формирование возвратов по списку", либо очистить, зайдя в "Служебные -> Очистить список препаратов для "Возрата по списку""!');
       CanClose:=False;
       FCloseFirst:=1;
      end;
    except
     CanClose:=True;
    end;
   end else CanClose:=True;
  CanClose:=CancelChek;
 end;

procedure TMainF.miChekPilotClick(Sender:TObject);
 begin
//  if MessBox('Пациент предъявил рецепт формы Ф-1?',52)<>ID_YES then Exit;
//  if Not ShowQ('Пациент предъявил рецепт формы Ф-1?',0) then Exit;
  try
{
   Pilot1F:=TPilot1F.Create(Self);
   try
    Application.ProcessMessages;
    Pilot1F.ShowModal;
   finally
    Pilot1F.Free;
   end;
}
//   if Not ShowQ('В верхней части рецепта (корешке) соответствует ли название поликлиники в штампе, поликлиники в которой находится ваш аптечный пункт?',2) then Exit;
//   if Not ShowQ('Присутствует ли угловой штамп ЛПУ?',0) then Exit;
//   if Not ShowQ('Присутствует ли круглая печать поликлиники, выписавшей рецепт?',0) then Exit;
//   if Not ShowQ('Присутствует ли треугольная печать вашей поликлиники?',1) then Exit;
//   if Not ShowQ('Имеется ли круглая печать красного цвета с текстом "вартість підлягає відшкодуванню"?',0) then Exit;
//   if Not ShowQ('Присутствует ли личная печать и подпись врача поликлиники, который выписал данный рецепт?',0) then Exit;
//   if Not ShowQ('Рецепт выписан в течение месяца?',0) then Exit;

//   if Not ShowQ('В нижней основной части рецепта соответствует ли название поликлиники в штампе, поликлиники в которой находится ваш аптечный пункт?',2) then Exit;
//   if Not ShowQ('Присутствует ли в нижней части рецепта круглая печать вашей поликлиники?',4) then Exit;
//   if Not ShowQ('Присутствует ли в нижней части рецепта треугольная печать вашей поликлиники?',1) then Exit;
//   if Not ShowQ('Присутствует ли в нижней части рецепта прямоугольный штамп красного цвета с текстом "вартість підлягає відшкодуванню"?',3) then Exit;
//   if Not ShowQ('Присутствует ли в нижней части рецепта личная печать и подпись врача вашей поликлиники, который выписал данный рецепт?',5) then Exit;
//   if Not ShowQ('Необходимо проверить правильность и полноту заполнения всех остальных данных в рецепте!',0) then Exit;



   if edVesh.Text<>'Действ. вещество...' then imVeshClick(edVesh);
   if edDoz.Text<>'Дозировка...' then imVeshClick(edDoz);
   if edForm.Text<>'Форма выпуска...' then imVeshClick(edForm);
   if edCntxSearch.Text<>'' then sbSearchClearClick(sbSearchClear);
   FilterSklad;

   Pilot3F:=TPilot3F.Create(Self);
   try
    FTypeChek:=TC_PILOT;
    OpenChek;
    try
     Application.ProcessMessages;
     Pilot3F.ShowModal;
//      Pilot3F.DBGrid1.Enabled:=False;
     if Pilot3F.Flag<>1 then
      begin
       if DM.qrChek.IsEmpty then CancelChek;
       Exit;
      end else begin
                FMedName:=Pilot3F.ComboBox1.Text;
                FPacient:=Pilot3F.Edit1.Text;
                FNRecipt:=Pilot3F.Edit3.Text;
                FFIODOctor1:=Pilot3F.Edit4.Text;
                FDtRecipt:=Pilot3F.dtpRecipt.Date;
                FTypeChek:=DM.qrMNNList.FieldByName('TypeChek').AsInteger;
               // FilterSklad;
               //  Pilot3F.Edit1.Enabled:=False;
                if dbgSklad.DataSource.DataSet.Locate('Art_Code',DM.qrMNNList.FieldByName('Art_Code').AsInteger,[loCaseInsensitive,loPartialKey]) then
                 try
                  FFlagPilot:=True;
                  // PrevEnterKol(EK_SILENT,0);
                  PrevEnterKol(EK_DIALOG,0,DM.qrMNNList.FieldByName('Art_Code').AsInteger);
                 finally
                  FFlagPilot:=False;
                 end;
               end;
    finally
     Pilot3F.Flag:=0;
    end;
   finally
    Pilot3F.Free;
   end;

  except
  end;
 end;

procedure TMainF.tmChekWorkTimeTimer(Sender:TObject);
var idc:Integer;
    Res:String;
 begin
  try
   tmChekWorkTime.Enabled:=False;

   if Date<=StrTodate('07.04.17') then
     MessBox('Поздравляем Вас с Благовещением!'+#10#10+
             'Уважаемые провизора!'+#10+
             'Для  увеличения продаж и  заинтересованности покупателей   в приобретении  товаров в наших аптеках '+
             'с 07.04.по  30.04.2017 года будет проводиться АКЦИЯ, '+
             'которая  дает возможность приобретать больше товаров по  ОПТОВЫМ ЦЕНАМ! '+#10#10+
             'Дополнительно, оптовая цена будет применяться на все товары  по чекам, в которых присутствуют  3 и более разных наименований!!! '+
             'Просим Вас эту информацию разъяснять покупателям, предлагая им докупить любые сопутствующие товары (витамины, салфетки, зубные пасты, вода, гематоген и пр.), '+'чтобы в чеке получалось 3 и более наименований и соответственно,  автоматически  сработала на чекОПТОВАЯ ЦЕНА!!!'
     ,
                   48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),15,Res);


  { Exit;
   try
    DM.qrTmW.Close;
    DM.qrTmW.SQL.Clear;
    DM.qrTmW.SQL.Add('declare @io int, @idc int ');
    DM.qrTmW.SQL.Add('set @io=(select id from inform..d_dept (nolock) where id_apteka=(select top 1 convert(int,Value) from Spr_Const (nolock) where Descr=''ID_APTEKA'')) ');
    DM.qrTmW.SQL.Add('set @idc=(select top 1 id from inform..e_worktime_card_head (nolock) ');
    DM.qrTmW.SQL.Add('where id_object=@io and getdate()>date_beg and (date_end is null or date_end>getdate()) ');
    DM.qrTmW.SQL.Add('order by is_temporary desc,personal_days desc)  ');
    DM.qrTmW.SQL.Add('select IsNull(@idc,0) as id_card ');
    DM.qrTmW.Open;
    if DM.qrTmW.FieldByName('id_card').AsInteger=0 then Exit;
    idc:=DM.qrTmW.FieldByName('id_card').AsInteger;
    DM.qrTmW.Close;
    DM.qrTmW.SQL.Text:='select convert(int,Value) as Value from Spr_Const (nolock) where Descr=''ID_CARD'' ';
    DM.qrTmW.Open;
    if DM.qrTmW.FieldbyName('value').AsInteger<>idc then
     begin
      MessBox('Изменился режим работы аптеки! Для просмотра нового режима работы необходимо зайти в окно редактирования графиков и нажать кнопку "Режим работы апеки".');
      DM.qrTmW.Close;
      DM.qrTmW.SQL.Clear;
      DM.qrTmW.SQL.Add('delete from Spr_Const where Descr=''ID_CARD'' ');
      DM.qrTmW.SQL.Add('insert into Spr_Const(Descr,Value) values(''ID_CARD'','''+IntToStr(idc)+''')');
      DM.qrTmW.ExecSQL;
     end;
   except
   end;
  }
  finally
   tmChekWorkTime.Enabled:=True;
  end;
 end;

procedure TMainF.N23Click(Sender:TObject);
 begin
  try
   ConfirmZpMessF:=TConfirmZpMessF.Create(Self);
   try
    if DM.qrZpMess.IsEmpty then begin MessBox('Нет сообщений для подтверждения!'); Exit; end;
    Application.ProcessMessages;
    ConfirmZpMessF.ShowModal;
   finally
    ConfirmZpMessF.Free;
   end;
  except

  end;
 end;

procedure TMainF.N22Click(Sender:TObject);
var D1,D2:TDateTime;
    Sum:Real;
    i:Integer;
    Tb:TTableObj;
 begin

{

  try
   PilotF:=TPilotF.Create(Self);
   try
    PilotF.D1:=D1;
    PilotF.D2:=D2;
    PilotF.qrPilot.Close;

    PilotF.qrPilot.SQL.Clear;
    PilotF.qrPilot.SQL.Add('select a.date_chek ,         ');
    PilotF.qrPilot.SQL.Add('       a.numb_chek ,     ');
    PilotF.qrPilot.SQL.Add('       p.mnn     ,        ');
    PilotF.qrPilot.SQL.Add('       a.pacient     ,        ');
    PilotF.qrPilot.SQL.Add('       b.names     , ');

    PilotF.qrPilot.SQL.Add('       p.sostav  ,              ');
    PilotF.qrPilot.SQL.Add('       p.formaua as formaen,             ');

    PilotF.qrPilot.SQL.Add('       k.koef    ,               ');
    PilotF.qrPilot.SQL.Add('      convert(numeric(8,2) ,Sum(convert(numeric(8,2),a.kol)/k.koef)) as KolUp, ');
    PilotF.qrPilot.SQL.Add('       p.cena , Sum(a.kol*p.cena) as Summa,     ');
    PilotF.qrPilot.SQL.Add('       a.medname,                                   ');
    PilotF.qrPilot.SQL.Add('       a.id_kassa, Max(a.row_id) as row_id                                   ');
    PilotF.qrPilot.SQL.Add('                                                                                          ');
    PilotF.qrPilot.SQL.Add('from ArhCheks a (nolock),                                                                                                           ');
    PilotF.qrPilot.SQL.Add('     SprPilot p (nolock),                                                                                                           ');
    PilotF.qrPilot.SQL.Add('     SprTov b (nolock) left join Inform..SprKoef k on b.art_code=k.art_code   ');
    PilotF.qrPilot.SQL.Add('where a.kod_name=b.kod_name and p.art_code=b.art_code and                                                                  ');
    PilotF.qrPilot.SQL.Add('      IsNull(cena_pilot,0)>0 and   ');
    PilotF.qrPilot.SQL.Add('      date_chek between '''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and '''+FormatDateTime('yyyy-mm-dd',D2)+' 23:59:59''   ');
    PilotF.qrPilot.SQL.Add('group by a.date_chek,a.numb_chek,p.mnn,b.names,p.sostav,p.formaua,a.medname,k.koef,p.cena,a.pacient,a.id_kassa ');
    PilotF.qrPilot.SQL.Add('order by p.mnn                                                                                ');
//    PilotF.qrPilot.SQL.SaveToFile('C:\Pilot.txt');
    PilotF.qrPilot.Open;
    Application.ProcessMessages;
    PilotF.ShowModal;
   finally
    PilotF.Free;
   end;
  except
  end;
}

  ReestrRepF:=TReestrRepF.Create(Self);
  try
   ReestrRepF.ShowModal;
  finally
   ReestrRepF.Free;
  end;
 end;

procedure TMainF.N26Click(Sender:TObject);
 begin
  if MessBox('Вы действительно хотите очистить список для возвратов?',52)<>ID_YES then Exit;
  try
   DM.QrEx3.Close;
   DM.QrEx3.SQL.Text:='delete from Inform..Tmp_Spis where priznak=5';
   DM.QrEx3.ExecSQL;
   MessBox('Список очищен!',64);
  except
   on E:Exception do MessBox('Ошибка очистки списка: '+E.Message);
  end;
 end;

function TMainF.GetMAxSkd:Real;
 begin
  try
//   if (Prm.FirmID=5) then begin Result:=-1; Exit; end;
   if (Prm.Dobraia) or (Prm.OptCena=True) then begin Result:=-1; Exit; end;
   if (Prm.AptekaSklad=False) {and (Prm.AptekaID<>58)} then begin Result:=-1; Exit; end;

   DM.QrEx3.Close;
   DM.QrEx3.SQL.Text:='select Value from Spr_Const (nolock) where Descr=''AptekaSklad'' ';
   DM.QrEx3.Open;
   if (DM.QrEx3.IsEmpty) or (DM.QrEx3.FieldByName('Value').AsInteger=0) then
    begin
     DM.QrEx3.Close;
     DM.QrEx3.SQL.Text:='select Max(Skd) as Sk from Skd (nolock) where Type_Skd=1';
     DM.QrEx3.Open;
     Result:=DM.QrEx3.FieldByName('Sk').AsFloat;
    end else
//   if DM.QrEx3.FieldByName('Value').AsInteger=1 then begin if Prm.FirmID=9 then Result:=-5 else Result:=-3; Exit; end;
   if DM.QrEx3.FieldByName('Value').AsInteger=1 then
    begin
     if Prm.AptekaID in [197,211] then Result:=-5 else Result:=-3;
     Exit;
    end;

//   if (Prm.FirmID=5) or (Prm.AptekaID in [142,165,138,168,169,170,172,173,175,178,179,181]) then begin Result:=-1; Exit; end;
  except
   Result:=0;
  end;
 end;

procedure TMainF.N27Click(Sender: TObject);
 begin
  HodAkciiF:=THodAkciiF.Create(Self);
  try
   Application.ProcessMessages;
   HodAkciiF.ShowModal;
  finally
   HodAkciiF.Free;
  end;
 end;

procedure TMainF.tmWaterNaklTimer(Sender:TObject);
var P,i:Integer;
    Res,S,Mess:String;
    B:Boolean;
 begin
  try
   tmWaterNakl.Enabled:=False;

   if DM.qrChek.IsEmpty=False then Exit;
//   if dbgChek.Visible=True then Exit;

   if Design then Exit;
   try
    CorrLocalDate;
   except
   end;

   try
    DM.qrNewReoc.Close;
    DM.qrNewReoc.SQL.Clear;
    DM.qrNewReoc.SQL.Add('select IsNull((select Value from Spr_Const where Descr=''IsLogAll''),0) as V');
    DM.qrNewReoc.Open;
    Prm.IsLogAll:=DM.qrNewReoc.FieldByName('V').AsInteger=1;
   except
   end;

   // Проверка действуют ли ночные цены
   try
    DM.qrNewReoc.Close;
    DM.qrNewReoc.SQL.Clear;
    DM.qrNewReoc.SQL.Add('declare @IsNight tinyint');
    DM.qrNewReoc.SQL.Add('exec spY_CheckIsNight @IsNight output');
    DM.qrNewReoc.SQL.Add('select @IsNight as IsNight');
    DM.qrNewReoc.Open;
    B:=DM.qrNewReoc.FieldByName('IsNight').AsInteger=1;
    if Prm.IsNightCena<>B then
     begin
      Prm.IsNightCena:=B;
      SprOrder:=O_NAMES;
      if Prm.IsNightCena then MessBox('Включился "ночной" режим цен! Будьте внимательны!')
                         else MessBox('Включился "дневной" режим цен! Будьте внимательны!');
     end;
   except
   end;

   // Ожидание загрузки новых переоценок
   try
    DM.qrNewReoc.Close;
    DM.qrNewReoc.SQL.Text:='exec spY_CheckNewReoc '+IntToStr(Prm.ID_Gamma)+',0';
    DM.qrNewReoc.Open;
    if DM.qrNewReoc.IsEmpty=False then
     begin
      NewReocListF:=TNewReocListF.Create(Self);
      try
       NewReocListF.TypeList:=TP_REOC;
       NewReocListF.ShowModal;
      finally
       NewReocListF.Free;
      end;
     end
   except
   end;

   // Ожидание загрузки новых стикеров
   try
    DM.qrNewReoc.Close;
    DM.qrNewReoc.SQL.Text:='exec spY_CheckNewStiker '+IntToStr(Prm.ID_Gamma)+',0';
    DM.qrNewReoc.Open;
    if DM.qrNewReoc.IsEmpty=False then
     begin
      NewReocListF:=TNewReocListF.Create(Self);
      try
       NewReocListF.TypeList:=TP_STIKER;
       NewReocListF.ShowModal;
      finally
       NewReocListF.Free;
      end;
     end
   except
   end;

   // Проверка на наличие отмененных броней
   try
    DM.qrNewReoc.Close;
    DM.qrNewReoc.SQL.Text:='exec spY_CheckNewZakaz '+IntToStr(Prm.ID_Gamma)+',2';
    DM.qrNewReoc.Open;
    if DM.qrNewReoc.IsEmpty=False then
     begin
      Mess:=DM.qrNewReoc.FieldByName('Mess').AsString+#10;
      for i:=1 to DM.qrNewReoc.RecordCount do
       begin
        if i=1 then DM.qrNewReoc.First else DM.qrNewReoc.Next;
        Mess:=Mess+'   №'+DM.qrNewReoc.FieldByName('NumZakaz').AsString;
        if i<DM.qrNewReoc.RecordCount then Mess:=Mess+#10;
       end;
      MessBox(Mess,64,GetFont('MS Sans Serif',12,$00006600,[fsBold]),0,Res);

      DM.qrNewReoc.Close;
      DM.qrNewReoc.SQL.Text:='exec spY_CheckNewZakaz '+IntToStr(Prm.ID_Gamma)+',3';
      DM.qrNewReoc.Open;

     end
   except
   end;

   // Ожидание обновления списка акционных ценников
   try
    DM.qrNewReoc.Close;
    DM.qrNewReoc.SQL.Text:='exec spY_CheckUpdAkcArt '+IntToStr(Prm.ID_Gamma)+',0';
    DM.qrNewReoc.Open;
    if DM.qrNewReoc.IsEmpty=False then
     begin
      NewReocListF:=TNewReocListF.Create(Self);
      try
       NewReocListF.TypeList:=TP_UPDC;
       NewReocListF.ShowModal;
      finally
       NewReocListF.Free;
      end;
     end
   except
   end;

  finally
   tmWaterNakl.Enabled:=True;
  end;
 end;

procedure TMainF.N37Click(Sender:TObject);
 begin
  try
   ZakazPriceF:=TZakazPriceF.Create(Self);
   try
    Application.ProcessMessages;
    ZakazPriceF.ShowModal;
   finally
    ZakazPriceF.Free;
   end;
  except
   on E:Exception do MessBox('Ошибка открытия окна поиска: '+E.Message);
  end;
 end;

procedure TMainF.N38Click(Sender:TObject);
 begin
  try
   ViewZakazPriceF:=TViewZakazPriceF.Create(Self);
   try
    Application.ProcessMessages;
    ViewZakazPriceF.ShowModal;
   finally
    ViewZakazPriceF.Free;
   end;
  except
   on E:Exception do MessBox('Ошибка открытия окна поиска: '+E.Message);
  end;
 end;

procedure TMainF.miSpisSrokClick(Sender: TObject);
var Sr:Byte;
 begin
  ChMonthF:=TChMonthF.Create(Self);
  try
   Application.ProcessMessages;
   ChMonthF.ShowModal;
   if ChMonthF.Flag<>1 then Exit;
   Sr:=ChMonthF.ComboBox1.ItemIndex;
  finally
   ChMonthF.Free;
  end;

  ShowPrihTov(StrToDate(DateToStr(Date)),Sr,PR_SROK)
 end;


procedure TMainF.miPrihTovClick(Sender:TObject);
var Dt:TDateTime;
    Param:Byte;
 begin
  try
   try

    DM.QrEx.SQL.Clear;
    DM.QrEx.SQL.Text:='master..xp_cmdshell ''copy \\192.168.0.9\ZAK\_SPR\Nakl\Nakl'+IntToStr(Prm.AptekaID)+'.txt D:\AVA\Nakl.txt ''';
    DM.QrEx.ExecSQL;

//    if FileExists(IncludeTrailingBackSlash(Opt.LoadNaklPath)+'Nakl.txt') then
    if Prm.UserRole=R_ADMIN then Param:=1 else Param:=0;
    LoadTmpNakl(DM.ADOCo,DM.Qr,IncludeTrailingBackSlash(Opt.LoadNaklPath)+'Nakl.txt',0,Param);
   except
   end;

   DM.qrDtPrih.Close;
   DM.qrDtPrih.SQL.Text:='select date_nakl,(case when sklad in (''  BY    1S'' , ''    1S'',''    1I'') then ''Белостоцкий'' when sklad in  (''  BY     1'' ,''     1'') then ''Каркача'' end) as sklad_descr '+
                         ' from TmpNakl a (nolock) where Obl<>1 and /*NReady=1 and */ nn_nakl not like ''ЛТ-%'' and  TypeNakl=1 and sklad in (''  BY    1S'',''    1I'',''    1S'',''  BY     1'',''     1'') and '+
                         ' not exists (select 1 from JMoves b (nolock) where a.nn_nakl=b.nn_nakl  and a.date_nakl=b.date_nakl) '+
                         'group by date_nakl,(case when sklad in (''  BY    1S'' , ''    1S'',''    1I'') then ''Белостоцкий'' when sklad in  (''  BY     1'' ,''     1'') then ''Каркача'' end) order by 1';
   DM.qrDtPrih.Open;

   if DM.qrDtPrih.IsEmpty then
    begin
     if GetDiagDate1(Dt) then ShowPrihTov(Dt,0,PR_TOVAR,True);
    end else begin

              if MainF.MessBox('Для сканирования нового товара нажмите "ДА".'#10#10'Для просмотра сканировки товара за'#10'прошлые даты нажмите "НЕТ"',52)<>ID_YES then
               begin
                if GetDiagDate1(Dt) then ShowPrihTov(Dt,0,PR_TOVAR,True);
                Exit;
               end;
              ChoosePrihF:=TChoosePrihF.Create(Self);
              try

               Application.ProcessMessages;
               ChoosePrihF.ShowModal;
               if ChoosePrihF.Dt=0 then Exit;
               ShowPrihTov(ChoosePrihF.Dt,0,PR_TOVAR,False,ChoosePrihF.Skl);
              finally
               ChoosePrihF.Free;
              end;
             end;
  except
   on E:Exception do MessBox('Ошибка приходования товара: '+E.Message);
  end;
 end;

procedure TMainF.miNaklClick(Sender: TObject);
 begin
  miPrihTov.Visible:=IsNewPrih;
  miNedSpis.Visible:=IsNewPrih;
 end;

function TMainF.GetIsNewPrih:Boolean;
 begin
  try
   DM.QrEx1.Close;
   DM.QrEx1.SQL.Text:='select IsNull((select convert(int,Value) from Spr_Const (nolock) where Descr=''IsNewPrih''),0) as Value ';
   DM.QrEx1.Open;
   Result:=DM.QrEx1.FieldByName('Value').AsInteger=1;
  except
   Result:=False;
  end
 end;

procedure TMainF.miPrihWaterClick(Sender:TObject);
 begin
  ShowPrihTov(StrToDate(DateToStr(Date)),0,PR_WATER)
 end;

procedure TMainF.miNedSpisClick(Sender: TObject);
 begin
   ViewVzResF:=TViewVzResF.Create(Self);
   try
    Application.ProcessMessages;
    ViewVzResF.ShowModal;
   finally
    ViewVzResF.Free;
   end;
 end;

procedure TMainF.N47Click(Sender: TObject);
 begin
  TovGrafikF:=TTovGrafikF.Create(Self);
  try
   Application.ProcessMessages;
   TovGrafikF.ShowModal;
  finally
   TovGrafikF.Free;
  end;
 end;

procedure TMainF.acCtrlDExecute(Sender: TObject);
 begin
  if lbNumCard50.Visible then ShowText('Для отмены чека нажмите кнопку "Отменить чек" мышкой!',clRed) else CancelChek(1);
 end;

procedure TMainF.N42Click(Sender: TObject);
 begin
  try
   HozZakazF:=THozZakazF.Create(Self);
   try
    Application.ProcessMessages;
    HozZakazF.ShowModal;
   finally
    HozZakazF.Free;
   end;
  except
   on E:Exception do
    MessBox('Ошибка открытия окна заявки: '+E.Message);
  end;
 end;

procedure TMainF.sbSearchClearClick(Sender: TObject);
 begin
  edCntxSearch.Text:='';
  edCntxSearchExit(edCntxSearch);
//  if dbgSklad.Visible then dbgSklad.SetFocus;
  dbgSkladSetFocused;
 end;

procedure TMainF.miLTJClick(Sender: TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   ViewLTF:=TViewLTF.Create(Self);
   try
    Application.ProcessMessages;
    ViewLTF.ShowModal;
   finally
    ViewLTF.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.miPrintSertifClick(Sender: TObject);
 begin
  if DM.spY_FilterSklad.IsEmpty then Exit;
  PrintSertif(DM.spY_FilterSklad.FieldByName('art_code').AsInteger);
 end;

procedure TMainF.PrintSertifOld(Art_code:Integer);
var QrToOff:TADOQuery;
    i,i1,j1:Integer;
    B:Boolean;
    Blob:TMemoryStream;
    imE:TImageEn;
    Jp,jpeg:TJPEGImage;
    Bmp,Bm,Bm1:TBitMap;
    FromF,ToF:String;
    NumSeriya:String;
 begin
  try
   QrToOff:=TADOQuery.Create(nil);
   Bm:=TBitMap.Create;
   Bm1:=TBitMap.Create;
   B:=False;
   try
    QrToOff.Connection:=DM.ADOCo;
    QrToOff.CommandTimeout:=600;

    QrToOff.Close;
    QrToOff.SQL.Text:='select top 1 data from ['+Prm.ServerDB+'].datafromapteks.dbo.StampGamma with (nolock) where typestamp=''gamma'' ';
    QrToOff.Open;

    Blob:=TADOBlobStream.Create(TBlobField(QrToOff.FieldByName('data')),bmRead);

    Jp:=TJPEGImage.Create;
    try
     Jp.LoadFromStream(Blob);
     Bm.Assign(Jp);
    finally
     Blob.Free;
    end;

    QrToOff.Close;
    QrToOff.SQL.Text:='select top 1 data from ['+Prm.ServerDB+'].datafromapteks.dbo.StampGamma with (nolock) where typestamp=''osan'' ';
    QrToOff.Open;

    Blob:=TADOBlobStream.Create(TBlobField(QrToOff.FieldByName('data')),bmRead);

    Jp:=TJPEGImage.Create;
    try
     Jp.LoadFromStream(Blob);
     Bm1.Assign(Jp);
    finally
     Blob.Free;
    end;


    QrToOff.Close;
    QrToOff.SQL.Clear;
    QrToOff.SQL.Add('select *  from '); ;
    QrToOff.SQL.Add('(select art_code,file_path from ['+Prm.ServerDB+'].workwith_gamma.dbo.ava_sertifikat_scan with (nolock)  ');
    QrToOff.SQL.Add(' union ');
    QrToOff.SQL.Add(' select art_code,file_path from ['+Prm.ServerDB+'].workwith_gamma.dbo.ava_sertifikat_scan_seriya with (nolock)) a  ');
    QrToOff.SQL.Add('where a.art_code='+IntToStr(Art_code));

    QrToOff.Open;

    if QrToOff.IsEmpty then
     begin
      MessBox('Извините на данный момент нет интернет соединения с базой сертификатов!');
      Exit;
     end;

    PrintRep.Clear;
    PrintRep.SetDefault;
    PrintRep.Stretch:=True;
    PrintRep.Indent:=0;

    for i:=1 to QrToOff.RecordCount do
     begin
      if i=1 then QrToOff.First else QrToOff.Next;
      FromF:='\\'+Prm.ServerSertif+'\'+Copy(QrToOff.FieldByName('File_Path').AsString,6,Length(QrToOff.FieldByName('File_Path').AsString));
      ToF:='\\'+Prm.ServerKompName+'\AVA\'+Copy(QrToOff.FieldByName('File_Path').AsString,17,Length(QrToOff.FieldByName('File_Path').AsString));
      if Not FileExists(ToF) then
       begin
        DM.QrEx.Close;
        DM.QrEx.SQL.Clear;
        DM.QrEx.SQL.Add('exec master..xp_cmdshell ''net use \\'+Prm.ServerSertif+'\annotaciya bmw525I /USER:GAMMA55\Sergio'' ');
        DM.QrEx.SQL.Add('exec master..xp_cmdshell ''copy '+FromF+' '+ToF+' ''  ');
//        DM.QrEx.SQL.SaveToFile('C:\Sertif.txt');
        DM.QrEx.ExecSQL;
       end;
      if FileExists(ToF) then
       begin
        B:=True;
        jpeg:=TJPEGImage.Create;
        try
         jpeg.CompressionQuality:=100;
         jpeg.LoadFromFile(ToF);
         Bmp:=TBitmap.Create;
         try
          Bmp.Assign(jpeg);

          for j1:=0 to Bm.Height-1 do
           for i1:=0 to Bm.Width-1 do
            begin
             if Bm.Canvas.Pixels[i1,j1]<$00FAFAFA then
              Bmp.Canvas.Pixels[i1+50,Bmp.Height-Bm.Height-100+j1]:=Bm.Canvas.Pixels[i1,j1]
            end;

          for j1:=0 to Bm1.Height-1 do
           for i1:=0 to Bm1.Width-1 do
            begin
             if Bm1.Canvas.Pixels[i1,j1]<$00FAFAFA then
              Bmp.Canvas.Pixels[Bmp.Width-Bm1.Width-100+i1,Bmp.Height-Bm1.Height-220+j1]:=Bm1.Canvas.Pixels[i1,j1]
            end;

          PrintRep.AddImage(Bmp,200);
//          PrintRep.AddText(#12)
         finally
          Bmp.Free
         end;
        finally
         Jpeg.Free
        end;
       end;
   {
     begin
      MessBox('Не удалось скопировать файл сертификата. Попробуйте еще раз!');
      Exit;
     end;
    }

     end;

    if B then PrintRep.PreView
         else MainF.MessBox('Извините на данный момент нет интернет соединения с базой сертификатов');

              // MainF.MessBox('Не удалось скопировать файлы сертификатов с сервера!');

   finally
    Bm.Free;
    Bm1.Free;
    QrToOff.Free;
   end;
  except
   on E:Exception do
    MessBox('Извините на данный момент нет интернет соединения с базой сертификатов!');
  end;

 end;

procedure TMainF.PrintSertif(Art_code:Integer);
var QrToOff:TADOQuery;
    i,i1,j1:Integer;
    B:Boolean;
    Blob:TMemoryStream;
    imE:TImageEn;
    Jp:TJPEGImage;
    Bm,Bm1:TBitMap;
    NumSeriya:String;

 begin
  if Not EnterStrValue(NumSeriya,'Введите номер серии') then Exit;
  try
   QrToOff:=TADOQuery.Create(nil);
   Bm:=TBitMap.Create;
   Bm1:=TBitMap.Create;
   B:=False;
   try

    QrToOff.Connection:=DM.ADOCo;
    QrToOff.CommandTimeout:=600;
    QrToOff.Close;
    QrToOff.SQL.Add('exec ['+Prm.ServerS2014+'].datafromapteks.dbo.spY_GetSertif '+IntToStr(Art_code)+','''+NumSeriya+'''');
    QrToOff.Open;

    if QrToOff.IsEmpty then
     begin
      PrintSertifOld(Art_code);
      Exit;
     end;

    Blob:=TADOBlobStream.Create(TBlobField(QrToOff.FieldByName('StampGamma')),bmRead);
    Jp:=TJPEGImage.Create;
    try
     Jp.LoadFromStream(Blob);
     Bm.Assign(Jp);
    finally
     Blob.Free;
     Jp.Free;
    end;

    Blob:=TADOBlobStream.Create(TBlobField(QrToOff.FieldByName('StampOsan')),bmRead);
    Jp:=TJPEGImage.Create;
    try
     Jp.LoadFromStream(Blob);
     Bm1.Assign(Jp);
    finally
     Blob.Free;
     Jp.Free;
    end;

    PrintRep.Clear;
    PrintRep.SetDefault;
    PrintRep.Stretch:=True;
    PrintRep.Indent:=0;
    for i:=1 to QrToOff.RecordCount do
     begin
      if i=1 then QrToOff.First else QrToOff.Next;
      try
       Blob:=TADOBlobStream.Create(TBlobField(QrToOff.FieldByName('data')),bmRead);
       imE:=TImageEn.Create(Self);
       try

        imE.IO.LoadFromStream(Blob);

//        PrintRep.AddImage(imE.IO.BitMap,200);

        for j1:=0 to Bm.Height-1 do
         for i1:=0 to Bm.Width-1 do
          begin
           if Bm.Canvas.Pixels[i1,j1]<$00FAFAFA then
            imE.IO.BitMap.Canvas.Pixels[i1+50,imE.IO.BitMap.Height-Bm.Height-100+j1]:=Bm.Canvas.Pixels[i1,j1]
          end;

        for j1:=0 to Bm1.Height-1 do
         for i1:=0 to Bm1.Width-1 do
          begin
           if Bm1.Canvas.Pixels[i1,j1]<$00FAFAFA then
            imE.IO.BitMap.Canvas.Pixels[imE.IO.BitMap.Width-Bm1.Width-100+i1,imE.IO.BitMap.Height-Bm1.Height-220+j1]:=Bm1.Canvas.Pixels[i1,j1];
          end;

        PrintRep.AddImage(imE.IO.BitMap,200);

       finally
        Blob.Free;
        imE.Free;
       end;
      except
      end
     end;

    PrintRep.PreView;

   finally
    QrToOff.Free;
    Bm.Free;
    Bm1.Free;
   end;
  except
   on E:Exception do
    MessBox('Ошибка чтения сертификатов: '+E.Message);
  end;
 end;

procedure TMainF.N46Click(Sender: TObject);
 begin
  ShowWorkSprF(W_CENNIKSROK);
 end;

procedure TMainF.Button1Click(Sender: TObject);
 begin
  EKKA.fpCloseNoFCheck;
 end;

procedure TMainF.N44Click(Sender: TObject);
 begin
  ShowWorkSprF(W_CENNIK);
 end;

procedure TMainF.edCntxSearchChange(Sender: TObject);
 begin
  SetLength(FArFilter,0);


  if Length(edCntxSearch.Text) in [1..2] then Exit;


  GetStrArray(PrepareStringFilter(edCntxSearch.Text),FArFilter,[' ']);

  edCntxSearch.Width:=TextWidth(edCntxSearch.Text,edCntxSearch.Font)+5;
  imSearch.Width:=edCntxSearch.Width+10;
  DrawRoundRect(imSearch,False,nil);

  sbSearchClear.Left:=imSearch.Left+imSearch.Width+1;
  imSearch2.Left:=sbSearchClear.Left+sbSearchClear.Width+2;
  DrawRoundRect(imSearch2,False,nil);
  edVesh.Left:=sbSearchClear.Left+sbSearchClear.Width+7;

  Panel3.Left:=imSearch2.Left+imSearch2.Width+3;
  Panel3.Width:=pnSklad.Width-(imSearch2.Left+imSearch2.Width+5);

  edDoZ.Left:=edVesh.Left+edVesh.Width+9;
  edForm.Left:=edDoZ.Left+edDoZ.Width+9;

  FilterSklad(1);
 end;

procedure TMainF.edCntxSearchKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
//  if Key=VK_UP then edCntxSearch.SelectAll;
  if Key in [VK_RETURN,VK_DOWN] then dbgSkladSetFocused;
  if Key=VK_ESCAPE then sbSearchClearClick(sbSearchClear);
 end;

procedure TMainF.imFindClick(Sender: TObject);
 begin
  imFind.Visible:=False;
  DrawRoundRect(imSearch,False,edCntxSearch);
  edCntxSearch.SetFocus;
 end;

procedure TMainF.edCntxSearchExit(Sender: TObject);
 begin
  if nmFilter='' then imFind.Visible:=True;
  DrawRoundRect(imSearch,False,nil);
 end;

function TMainF.GetGroupIndex:Integer;
 begin
  Result:=DM.spY_FilterSklad.FieldByName('Type_Tov').AsInteger;
 end;

procedure TMainF.SpeedButton1Click(Sender: TObject);
 begin
  FilterSklad;
 end;

procedure TMainF.MakeVZKarantin(Param:Byte=0);
var Sum:Real;
 begin
  try
   if (Param=1) and (EndOfTheMonth(Date)-Date>5) then Exit; 
   // if CheckForReoc=False then Exit;
   Sum:=DM.MakeVozvratKarantin(-Prm.UserID,Param);
   if Sum>0 then
    Case Param of
     0:ShowText('Сформировался автоматический возврат товара с окончившимся сроком регистрации с признаком "Фарминспекция". Зайдите в историю накладных и за сегодняшнюю дату по возврату с признаком "Фарминспекция"'+' соберите товар и передайте на возвратный склад! Либо сообщите ОБЯЗАТЕЛЬНО заведующей!',clRed);
     1:ShowText('Сформировался автоматический возврат товара с заканчивающимся сроком годности с признаком "Срок". Зайдите в историю накладных и за сегодняшнюю дату по возврату с признаком "Срок"'+' соберите товар и передайте на возвратный склад! Либо сообщите ОБЯЗАТЕЛЬНО заведующей!',clRed);
    end
  except
   on E:Exception do MainF.MessBox('Ошибка формирования возврата по карантину: '+E.Message);
  end;
 end;

procedure TMainF.PrepareList(CB:TComboBox);
var cnt,i:Integer;
    ss:String;

 begin
{
  try
   ss:=CB.Text;
   CB.Clear;
   if ss='' then begin CB.DroppedDown:=False; Exit; end;
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select top 1 art_code from SprFilter  where id_user='+IntToStr(Prm.UserID)+' and compname=host_name()';
   DM.Qr.Open;
   if DM.Qr.IsEmpty then cnt:=0 else cnt:=1;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   if CB=cbVesh then
    begin
     DM.Qr.SQL.Add('select veshestvo as Descr from Inform..SprFormV where veshestvo like ''%'+ss+'%'' ');
     DM.Qr.SQL.Add('and (('+IntToStr(cnt)+'=0) or ('+IntToStr(cnt)+'=1 and art_code in (select art_code from SprFilter where id_user='+IntToStr(Prm.UserID)+' and compname=host_name()) ) )');
     DM.Qr.SQL.Add('group by veshestvo');
     DM.Qr.SQL.Add('union all ');
     DM.Qr.SQL.Add('select veshestvoen as Descr from Inform..SprFormV where veshestvoen like ''%'+ss+'%'' ');
     DM.Qr.SQL.Add('and (('+IntToStr(cnt)+'=0) or ('+IntToStr(cnt)+'=1 and art_code in (select art_code from SprFilter where id_user='+IntToStr(Prm.UserID)+' and compname=host_name()) ) )');
     DM.Qr.SQL.Add('group by veshestvoen');
     DM.Qr.SQL.Add('order by 1');
     DM.Qr.SQL.SaveToFile('c:\vesh.txt');
    end else
   if CB=cbDoz then
    begin
     DM.Qr.SQL.Add('select sostav as Descr from Inform..SprFormV where sostav like ''%'+ss+'%'' ');
     DM.Qr.SQL.Add('and (('+IntToStr(cnt)+'=0) or ('+IntToStr(cnt)+'=1 and art_code in (select art_code from SprFilter where id_user='+IntToStr(Prm.UserID)+' and compname=host_name()) ) )');
     DM.Qr.SQL.Add('group by sostav');
     DM.Qr.SQL.Add('order by 1');
    end else
   if CB=cbForm then
    begin
     DM.Qr.SQL.Add('select formaen as Descr from Inform..SprFormV where formaen like ''%'+ss+'%'' ');
     DM.Qr.SQL.Add('and (('+IntToStr(cnt)+'=0) or ('+IntToStr(cnt)+'=1 and art_code in (select art_code from SprFilter where id_user='+IntToStr(Prm.UserID)+' and compname=host_name()) ) )');
     DM.Qr.SQL.Add('group by formaen');
     DM.Qr.SQL.Add('order by 1');
    end;

   CB.DroppedDown:=False;
   DM.Qr.Open;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     CB.Items.Add(DM.Qr.FieldByName('Descr').AsString);
    end;
   CB.DroppedDown:=True;
   CB.Text:=ss;
   CB.SelStart:=length(ss)+1;
  except
  end;
}
 end;

{-----------------------------------------------------------------}
procedure TMainF.ActivateFi(ed:TEdit; V:Boolean);
var eStr,fS:String;
    pn:TPanel;
 begin
  if ed=edVesh then begin fS:=fVesh; pn:=pnVesh; eStr:='Действ. вещество...'; end else
  if ed=edDoz then  begin fS:=fDoz;  pn:=pnDoz;  eStr:='Дозировка...'; end else
  if ed=edForm then begin fS:=fForm; pn:=pnForm; eStr:='Форма выпуска...'; end;

  if V=False then
   begin
    if fS='' then
     begin
      pn.Visible:=V;
      ed.Font.Color:=clGray;
      dbgFi.Tag:=0;
      ed.Text:=eStr;
      dbgFi.Tag:=1;
      DM.qrFi.Close;
      dbgFi.Visible:=False;
      DrawRoundRect(imSearch2,False,nil);
      ActiveFi:=nil;
     end else begin
               dbgFi.Tag:=0;
               ed.Text:=fS;
               dbgFi.Tag:=1;
              end;
   end else begin
             ed.Font.Color:=clBlack;
             dbgFi.Tag:=0;
             ed.Text:='';
             dbgFi.Tag:=1;
             DrawRoundRect(imSearch2,False,ed);
             ActiveFi:=ed;
            end;
  dbgFi.Left:=ed.Left-1; dbgFi.Top:=ed.Top+ed.Height+1; dbgFi.Width:=ed.Width+2;
 end;

procedure TMainF.edVeshEnter(Sender: TObject);
 begin
  if TEdit(Sender).Font.Color=clGray then ActivateFi(TEdit(Sender),True);
  DrawRoundRect(imSearch2,False,TControl(Sender));
 end;

procedure TMainF.dbgFiExit(Sender:TObject);
 begin
  if (TDBGrid(Sender).Tag=1) and Assigned(ActiveFi) then ActivateFi(TEdit(ActiveFi),False);
  TDBGrid(Sender).Tag:=1;
 end;

procedure TMainF.edVeshExit(Sender:TObject);
 begin
  try
   if Not Assigned(ActiveControl) then ActivateFi(TEdit(Sender),False) else
   if SameText(ActiveControl.Name,'dbgFi')=False then ActivateFi(TEdit(Sender),False);
  except
  end; 
 end;

procedure TMainF.imVeshClick(Sender:TObject);
 begin
  if Sender=imVesh then
   begin
    fVesh:=''; edVeshExit(edVesh);
   end else
  if Sender=imDoz then
   begin
    fDoz:=''; edVeshExit(edDoz);
   end else
  if Sender=imForm then
   begin
    fForm:=''; edVeshExit(edForm);
   end;
  FilterSklad;
 end;

procedure TMainF.edVeshKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if (Key=40) and (dbgFi.Visible) then dbgFi.SetFocus;
 end;

procedure TMainF.dbgFiKeyDown(Sender: TObject; var Key:Word; Shift:TShiftState);
 begin
  Case Key of
   27:DoneFi(1);
   13:DoneFi(0);
  end;
 end;

procedure TMainF.DoneFi(P:Byte);
 begin
  dbgFi.Tag:=P;
  if ActiveFi<>nil then
   begin
    if P=0 then
     begin
      TEdit(ActiveFi).Text:=DM.qrFi.FieldByName('Descr').AsString;

      if ActiveFi=edVesh then begin fVesh:=DM.qrFi.FieldByName('Descr').AsString;  pnVesh.Visible:=True; end else
      if ActiveFi=edDoz  then begin fDoz:=DM.qrFi.FieldByName('Descr').AsString;   pnDoz.Visible:=True;  end else
      if ActiveFi=edForm then begin fForm:=DM.qrFi.FieldByName('Descr').AsString;  pnForm.Visible:=True; end;
      dbgFi.Visible:=False;
      FilterSklad;
     end else begin
               dbgFi.Visible:=False;
               if ActiveFi=edVesh then ActivateFi(edVesh,False);
              end;
   end;
 end;

procedure TMainF.dbgFiCellClick(Column:TColumn);
 begin
  DoneFi(0);
 end;

procedure TMainF.edVeshChange(Sender:TObject);
var sZero,filt,ss:String;
    wd,cnt:Integer;
 begin
  if dbgFi.Tag=0 then Exit;
  ss:=TEdit(Sender).Text;
  DM.Qr.Close;
  DM.Qr.SQL.Text:='select top 1 art_code from SprFilter (nolock) where id_user='+IntToStr(Prm.UserID)+' and compname=host_name()';
  DM.Qr.Open;
  if DM.Qr.IsEmpty then cnt:=0 else cnt:=1;

  sZero:='';
  if cbBoxZero.Checked then sZero:=' where ostat>0';
  filt:=' art_code in (select distinct art_code from SprTov (nolock) '+sZero+') and (('+IntToStr(cnt)+'=0 ) or ('+IntToStr(cnt)+'=1 and art_code in (select art_code from SprFilter (nolock) where id_user='+IntToStr(Prm.UserID)+' and compname=host_name()) ) )';

  if (ss='') and (imSearch2.Tag=0) then Exit;
  DM.Qr.Close;
  DM.Qr.SQL.Clear;
  DM.Qr.SQL.Add('if Object_ID(N''tempdb..#tmpfilt'') is not null drop table #tmpfilt ');

  if Sender=edVesh then
   begin
    DM.Qr.SQL.Add('select Descr,Len(Descr) as LenD into #tmpfilt from Veshestva (nolock) where Descr like ''%'+ss+'%'' ');
    DM.Qr.SQL.Add('and '+filt);
    DM.Qr.SQL.Add('group by Descr');
    DM.Qr.SQL.Add(' union ');
    DM.Qr.SQL.Add('select VeshestvoEN, Len(VeshestvoEN) as LenD ');
    DM.Qr.SQL.Add('from Plist  ');
    DM.Qr.SQL.Add('where VeshestvoEN like ''%'+ss+'%'' ');
    DM.Qr.SQL.Add('and '+filt);
    DM.Qr.SQL.Add('group by VeshestvoEN');
    DM.Qr.SQL.Add('order by 1');
   end else
  if Sender=edDoz then
   begin
    DM.Qr.SQL.Add('select convert(varchar,Kol) as Descr,Len(convert(varchar,Kol)) as LenD into #tmpfilt from Veshestva (nolock) where convert(varchar,Kol) like ''%'+ss+'%'' ');
    DM.Qr.SQL.Add('and '+filt);
    DM.Qr.SQL.Add('group by Kol ');
    DM.Qr.SQL.Add('order by Kol ');
   end else
  if Sender=edForm then
   begin
    DM.Qr.SQL.Add('select Forma as Descr,Len(Forma) as LenD into #tmpfilt from Veshestva (nolock) where Forma like ''%'+ss+'%'' ');
    DM.Qr.SQL.Add('and '+filt);
    DM.Qr.SQL.Add('group by Forma ');
    DM.Qr.SQL.Add('order by 1');
   end;

  DM.Qr.SQL.Add('select top 1 Descr from #tmpfilt where LenD=(select Max(LenD) from #tmpfilt)');
//  DM.Qr.SQL.SaveToFile('C:\log\Filter.txt');
  DM.Qr.Open;

  DM.qrFi.Close;
  DM.qrFi.SQL.Clear;
  DM.QrFi.SQL.Add('select distinct Descr from #tmpfilt ');
  DM.QrFi.SQL.Add('order by 1');
  DM.QrFi.Open;
  if DM.QrFi.IsEmpty then dbgFi.Visible:=False else
   begin
    DM.qrFi.Locate('Descr',ss,[]);
    dbgFi.Width:=TextPixWidth(DM.Qr.FieldByName('Descr').AsString,dbgFi.Font)+30;
    dbgFi.Tag:=1;
    dbgFi.Visible:=True;
   end;
 end;

procedure TMainF.imVesh1Click(Sender:TObject);
 begin
  try
   imSearch2.Tag:=1;
   if Sender=imVesh1 then begin imVeshClick(imVesh); edVeshEnter(edVesh); edVeshChange(edVesh); edVesh.SetFocus; end else
   if Sender=imDoz1  then begin imVeshClick(imDoz);  edVeshEnter(edDoz);  edVeshChange(edDoz);  edDoz.SetFocus;  end else
   if Sender=imForm1 then begin imVeshClick(imForm); edVeshEnter(edForm); edVeshChange(edForm); edForm.SetFocus; end;
  finally
   imSearch2.Tag:=0;
  end
 end;

function TMainF.GetFullSprTov:Boolean;
 begin
{  try
   DM.Qr7.Close;
   DM.Qr7.SQL.Text:='select Value from Spr_Const (nolock) where Descr=''FullSprTov'' ';
   DM.Qr7.Open;
   if DM.Qr7.IsEmpty then Abort;
   Result:=DM.Qr7.FieldByName('Value').AsInteger=1;
  except
   Result:=False;
  end;
     }
  Result:=FFullSprTov;
 end;

function TMainF.GetIsFiltered:Boolean;
 begin
  Result:=(DM.spY_FilterSklad.IsEmpty=False) and
          ((Length(nmFilter)>2) or (fVesh<>'') or (fDoz<>'') or (fForm<>''));
 end;

procedure TMainF.N50Click(Sender: TObject);
var i:Integer;
 begin
  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Font.Name := 'Times New Roman';
  PrintRep.Align := al_left;
  PrintRep.Font.Size:=4;
  PrintRep.AddText('                                                                                                                                                                        Директору Аптечной сети 9-1-1 '+#10);
  PrintRep.AddText('                                                                                                                                                                        Григорян А.А. '+#10);
  PrintRep.AddText('                                                                                                                                                                         _______________ '+#10);
  PrintRep.AddText('                                                                                                                                                                         _______________ '+#10);
  PrintRep.AddText('                                                                                                                                                                         _______________ '+#10+#10+#10+#10+#10+#10+#10);
  PrintRep.Align := al_Center;
  PrintRep.AddText(' Служебная записка '+#10+#10);
  PrintRep.Align := al_left;
  PrintRep.AddText(' Коллектив ________________________________________________________________________________________________ '+#10+#10);
  PrintRep.AddText(' не возражает против выхода из состава коллектива сотрудников  '+#10);
  PrintRep.AddText(' ___________________________________________________________________________ с " _____ " ______________ 201_ г.'+#10+#10);
  PrintRep.AddText(' после проведения инвентаризации и исключением ее/его из договора коллективной материальной ответственности '+#10+#10);
  PrintRep.AddText(' "____" _____________________ 201__ г.'+#10+#10+#10+#10);

  for i:=1 to 24 do
   PrintRep.AddText(' _____________________________________ '+#10);
  PrintRep.PreView;
 end;

procedure TMainF.N51Click(Sender: TObject);
var i:Integer;
 begin
  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Font.Name := 'Times New Roman';
  PrintRep.Align := al_left;
  PrintRep.Font.Size:=4;
  PrintRep.AddText('                                                                                                                                                                        Директору Аптечной сети 9-1-1 '+#10);
  PrintRep.AddText('                                                                                                                                                                        Григорян А.А. '+#10);
  PrintRep.AddText('                                                                                                                                                                         _______________ '+#10);
  PrintRep.AddText('                                                                                                                                                                         _______________ '+#10);
  PrintRep.AddText('                                                                                                                                                                         _______________ '+#10+#10+#10+#10+#10+#10+#10);
  PrintRep.Align := al_Center;
  PrintRep.AddText(' Служебная записка '+#10+#10);
  PrintRep.Align := al_left;
  PrintRep.AddText(' Коллектив ________________________________________________________________________________________________ '+#10+#10);
  PrintRep.AddText(' не возражает против выхода из состава коллектива сотрудников  '+#10);
  PrintRep.AddText(' ___________________________________________________________________________ с " _____ " ______________ 201_ г.'+#10+#10);
  PrintRep.AddText(' без проведения инвентаризации и исключением ее/его из договора коллективной материальной ответственности. '+#10+#10);
  PrintRep.AddText(' Претензий по наличию и сохранности товарно-материальных ценностей не имеем '+#10+#10);
  PrintRep.AddText(' "____" _____________________ 201__ г.'+#10+#10+#10+#10);

  for i:=1 to 24 do
   PrintRep.AddText(' _____________________________________ '+#10);

  PrintRep.PreView;
 end;

procedure TMainF.N52Click(Sender: TObject);
var Tb,Tb_Nakl:TTableObj;
    i,j:Integer;
 begin
  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Font.Name := 'Times New Roman';
  PrintRep.Align := al_center;
  PrintRep.Font.Size:=8;
  PrintRep.AddText(' ОПИСЬ '+#10);
  PrintRep.Font.Size:=4;
  PrintRep.AddText(' передаваемых документов '+#10);
  PrintRep.AddText(' из аптеки/аптечного киоска "________________________" '+#10);
  PrintRep.AddText(' г. Харьков                                                                                               "___" ________________ 20__ г.'+#10);
  PrintRep.Align := al_left;
  PrintRep.AddText(' Сотрудник торговой точки _______________________________________________ '+#10);
  PrintRep.Font.Size:=2;
  PrintRep.AddText('                                                                                                                                             (Ф.И.О. сотрудника т/точки) '+#10);
  PrintRep.Font.Size:=4;
  PrintRep.AddText(' передал(а), а сотрудник офиса/водитель-экспидитор  __________________________________________'+#10);
  PrintRep.Font.Size:=2;
  PrintRep.AddText('                                                                                                                                                                                          (Ф.И.О. офиса/водитель-экспидитора ) '+#10);
  PrintRep.Font.Size:=4;
  PrintRep.AddText(' принял для последующей передачи секретарю фирмы следующую документацию: '+#10+#10+#10);


  PrintRep.Addtable(4,17);
  Tb:=PrintRep.LastTable;
  Tb.SetWidths('100,800,400,400');
  Tb.Cell[1,1].Font.Size:=3;
  Tb.Cell[1,1].AddText('№ п/п');
  Tb.Cell[2,1].Font.Size:=3;
  Tb.Cell[2,1].AddText('Наименование документа');
  Tb.Cell[3,1].Font.Size:=3;
  Tb.Cell[3,1].AddText('Наименование отдела, куда передается документ');
  Tb.Cell[4,1].Font.Size:=3;
  Tb.Cell[4,1].AddText('Ф.И.О. и подпись сотрудника отдела, получившего документ');

  for i:=2 to 17 do
   begin
    Tb.Cell[1,i].AddText(IntToStr(i-1));
    Tb.Cell[1,i].Align := al_center;
   end;

  for i:=1 to 4 do for j:=2 to 17 do Tb.Cell[i,j].Font.Size:=8;


  PrintRep.AddText(#10+#10+#10+#10+#10' ПЕРЕДАЛ (сотрудник)                                                                  ____________________ (___________________)'+#10);
  PrintRep.AddText(' ПРИНЯЛ  (сотрудник офиса/водитель-экспедитор)                  ____________________ (___________________)'+#10);
  PrintRep.AddText(' ПОЛУЧИЛ (секретарь)                                                                  ____________________ (___________________)'+#10+#10+#10);

  PrintRep.PreView;
 end;

procedure TMainF.FlashImage(Pb:TPaintBox; Cnt:Integer; Caption:String);
var x,y,i,j:Integer;

 begin
  try
   Pb.Visible:=True;

   Pb.Canvas.Font.Name:='Arial';
   Pb.Canvas.Font.Size:=14;
   Pb.Canvas.Font.Style:=[fsBold,fsItalic];

   x:=(Pb.Width- Pb.Canvas.TextWidth(Caption)) div 2;
   y:=(Pb.Height-Pb.Canvas.TextHeight(Caption)) div 2;

   for j:=1 to Cnt do
    begin

     for i:=255 downto 0 do
      begin
       if TerminateFlash or IsPreviewing then Exit;
       Pb.Canvas.Brush.Color:=i*65536+i*256+255;
       Pb.Canvas.Pen.Color:=i*65536+i*256+255;
//      Pb.Canvas.FillRect(Rect(0,0,Pb.Width,Pb.Height));
       Pb.Canvas.RoundRect(0,0,Pb.Width,Pb.Height,6,6);

       if Caption<>'' then
        begin
         Pb.Canvas.Pen.Color:=65536+256+i*255;
         Pb.Canvas.TextOut(x,y,Caption);
        end;

       if i mod 3=0 then
        begin
         Sleep(1);
         Application.ProcessMessages;
        end;

      end;

     for i:=0 to 255 do
      begin
       if TerminateFlash or IsPreviewing then Exit;
       Pb.Canvas.Brush.Color:=i*65536+i*256+255;
       Pb.Canvas.Pen.Color:=i*65536+i*256+255;
//      Pb.Canvas.FillRect(Rect(0,0,Pb.Width,Pb.Height));
       Pb.Canvas.RoundRect(0,0,Pb.Width,Pb.Height,4,4);

       if Caption<>'' then
        begin
         Pb.Canvas.Pen.Color:=65536+256+i*255;
         Pb.Canvas.TextOut(x,y,Caption);
        end;

       if i mod 3=0 then
        begin
         Sleep(1);
         Application.ProcessMessages;
        end;

      end;
    end;

   finally
    Pb.Visible:=False;
   end;

 end;

procedure TMainF.FlashWhenZero;
 begin

  if DM.spY_FilterSklad.IsEmpty then Exit;
  try
   StartFlash:=True;
   try

    if OstatED>0 then Exit;
    if dbgUp.Visible then FlashImage(MainF.pbUp,6,'');
    if dbgDown.Visible then FlashImage(MainF.pbDown,6,'');
    if bbWhereIs.Enabled then FlashImage(MainF.pbSop,6,'');

   except
   end;
  finally
   TerminateFlash:=False;
   StartFlash:=False;
  end;

 end;

procedure TMainF.ShowIndic(S:String);
var CPD:TCommPortDriver;
 begin
  try
   CPD:=TCommPortDriver.Create(Self);
   try

    CPD.BaudRate:=br9600;
    CPD.BaudRateValue:=9600;
    CPD.Parity:=ptNone;
    CPD.Port:=pnCOM8;
    CPD.PortName:='\\.\COM'+IntToStr(Opt.NumPortEkran);
    CPD.StopBits:=sb1BITS;

    if CPD.Connect then
     begin
      // bre - слово "РЕЗОНАНС"
      // bce - слово "Conn"
      CPD.SendString('b'+S+'e');
      Sleep(100);

      CPD.Disconnect;
     end;
   finally
    CPD.Free;
   end;
  except
  end;
 end;

procedure TMainF.tmpButtonClick(Sender:TObject);
var  A,B,i,j,Rc,Cc:Integer;
     v:Variant;
     ssss,S:String;
     SL:TStringList;
     ss,ss1:TStringStream;
     qqq:Int64;
     Cr:TCardInfo;
     T:TDateTime;
     FP:Variant;
     P:Integer;
     CP:TChekPos;
     R:Real;
     jpeg:TJPEGImage;
     bmp:TBitmap;
     TT:TDateTime;
     ii:Integer;
     CPD:TCommPortDriver;
     aSs,a1,a3:Array of Char;
     CA:Integer;
     M:TMainMenu;
     x:Integer;
     Res:String;
     qqq1:Int64;

 begin
  Width:=1366;
  Height:=713;
  Left:=(Screen.Width-Width) div 2;
  Top:=(Screen.Height-Height) div 2;

//  ShowMessage();
  Exit;

  SaveScreenF:=TSaveScreenF.Create(Self);
  SaveScreenF.ShowModal;

  Exit;


 // keybd_event(VK_NUMLOCK, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);


 {
   if Date<=StrTodate('06.04.17') then
     MessBox('Поздравляем Вас с Благовещением!'+#10#10+
             'Уважаемые провизора!'+#10+
             'Для  увеличения продаж и  заинтересованности покупателей   в приобретении  товаров в наших аптеках '+
             'с 07.04.по  30.04.2017 года будет проводиться АКЦИЯ, '+
             'которая  дает возможность приобретать больше товаров по  ОПТОВЫМ ЦЕНАМ! '+#10#10+
             'Дополнительно, оптовая цена будет применяться на все товары  по чекам, в которых присутствуют  3 и более разных наименований!!! '+
             'Просим Вас эту информацию разъяснять покупателям, предлагая им докупить любые сопутствующие товары (витамины, салфетки, зубные пасты, вода, гематоген и пр.), '+'чтобы в чеке получалось 3 и более наименований и соответственно,  автоматически  сработала на чекОПТОВАЯ ЦЕНА!!!'
     ,
                   48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),15,Res);
}
   {
     MessBox('Поздравляем Вас с Благовещением!'+#10#10+
             'Уважаемые провизора!'+#10+
             'Для  увеличения продаж и  заинтересованности покупателей   в приобретении  товаров в наших аптеках '+
             'с 07.04.по  30.04.2017 года будет проводиться АКЦИЯ, '+
             'которая  дает возможность приобретать больше товаров по  ОПТОВЫМ ЦЕНАМ! '+#10#10+
             'Дополнительно, оптовая цена будет применяться на все товары  по чекам, в которых присутствуют  3 и более разных наименований!!! '+
             'Просим Вас эту информацию разъяснять покупателям, предлагая им докупить любые сопутствующие товары (витамины, салфетки, зубные пасты, вода, гематоген и пр.), чтобы в чеке получалось 3 и более '+'наименований и соответственно,  автоматически  сработала на чекОПТОВАЯ ЦЕНА!!!'
     ,
                   48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),30,Res);
   }

  // ShowMessage(FileVersion(Application.ExeName));

//  BonusStr(78.43);
{
  DM.Qr.Close;
  DM.Qr.SQL.Text:='select convert(bigint,9111222333444555666) as V';
  DM.Qr.Open;
  qqq1:=DM.Qr.FieldByName('V').AsVariant;
  ShowMessage(IntToStr(qqq1));
  Exit;
}
{
  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='exec spY_gh12 :b';
  DM.QrEx.Parameters.ParamByName('b').LoadFromFile('d:\ava\PC_EKKA.exe',ftBlob);
  DM.QrEx.ExecSQL;
  Exit;
}

 // PrintSrokSkd(0);

  Exit;

{
  FP:=CreateOleObject('InpasEcrCom.Ecr');

  FP.onExecEnd:=ExecEnd;
  FP.onStateChanged:=EcrStateChanged;

  FP.SetValue('comm.type','serial');
  FP.SetValue('comm.port','com2');
  FP.SetValue('comm.baud','115200');
  FP.SetValue('comm.check','');

  Res:=FP.Exec(0,0);

  ShowMessageI(Res);

  FP.SetValue('req','');
  FP.SetValue('operation','sale');
  FP.Exec(1,null);

  FP.SetValue('req.Currency_Name','aaa');
  FP.SetValue('req.AMOUNT','1');
  FP.SetValue('req.Currency','980');
  FP.Exec(2,'');
}
//  FP.Dispose;

  Exit;

 {
  dbgSklad.Font.Size:=24;
}
//  ExecuteAndWait('D:\AVA\MPC\mpc-hc.exe /play /close /minimized "D:\AVA\Ролик динамики 277.mp3"',False);

  DM.Qr.Close;
  DM.Qr.SQL.Text:='select app_name() app';
  DM.Qr.Open;
  ShowMessage(DM.Qr.FieldByname('app').AsString);
  Exit;

  S:='123на456на678';
  ShowMessageI(PosEx('на',S,5));

  Exit;
  SaveScreenF:=TSaveScreenF.Create(Self);
  SaveScreenF.ShowModal;
  Exit;

  ShowTimerZ;

  Exit;
  DM.Qr.Close;
  DM.Qr.SQL.Text:='exec spY_GetEKKAInfo_ 3,71';
  DM.Qr.Open;
  ShowMessage(FormatDateTime('dd.mm.yy',DM.Qr.FieldByName('DtRep').AsDateTime));
  Exit;
  ShowZPMess;

//  EKKA.fpOpenServiceReceipt;
//  EKKA.fpCloseServiceReceipt;


  Exit;
  EKKA.bPrintRep(1,2);

  Exit;

  CPD:=TCommPortDriver.Create(Self);

  CPD.BaudRate:=br9600;
  CPD.BaudRateValue:=9600;
  CPD.Parity:=ptNone;
  CPD.Port:=pnCOM8;
  CPD.PortName:='\\.\COM11';
  CPD.StopBits:=sb1BITS;

  if CPD.Connect then
   begin

    // bre - слово "РЕЗОНАНС"
    // bce - слово "Conn"
    CPD.SendString('bce');
    Sleep(100);
{

    if Not CPD.SendByte(98) then ShowMessage('1');
    if Not CPD.SendByte(50) then ShowMessage('2');
    if Not CPD.SendByte(50) then ShowMessage('3');
    if Not CPD.SendByte(101) then ShowMessage('14');

}
    CPD.Disconnect;
   end else ShowMessage('Нет коннекта');

  Exit;
//  FlashWhenZero;
//  tFl:=TThFlash.Create(False);

  Exit;

  DM.Qrtmp.Close;
  DM.Qrtmp.SQL.Text:='select * from Plist,SprTov,ArhCheks';
  DM.Qrtmp.Open;

  ShowMessage(GetProgramFilesDir);
//  InitTerminal(1);
  Exit;
  DM.Qr.Close;
  DM.Qr.SQL.Text:='select 0 as F';
  DM.Qr.Open;
  if DM.Qr.FieldByName('F').Value=Variants.Null then ShowMessage('Да');
//  if DM.Qr.FieldByName('F').Value=NULL then ShowMessage('Да');

  Exit;

   EKKA.fpGetStatus;
   if EKKA.LastError<>'' then Abort;
   CP.DateK:=StrToDateTime(JDateToStr(EKKA.RD_Item[3])+' '+JTimeToStr(EKKA.RD_Item[4]));
   ShowMessage(DateTimeToStr(CP.DateK));
//  mpMain.FileName:=WorkPath+'\wav\Дисконтная карта\Желаете их списать сейчас или будете накапливать дальше.mp3';


//  ShowMessage(FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz',TT));

  Exit;

  FormHintF:=TFormHintF.Create(Self);
  try
   Application.ProcessMessages;
   FormHintF.ShowModal;
  finally
   FormHintF.Free;
  end;

   Exit;

   PlaySumm(SumChekFull);
   Exit;
//   PlServer.Active:=True;

//   PlServer.

//   PlServer.CommandHandlers.Items[0].Command:='0';
//   PlServer.CommandHandlers.
//   PlServer.
//   Exit;


   Exit;

 //  PrintBlankForNewDiscontSystem;

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select top 1 cast(id as uniqueidentifier)as id,descr from SprPostav ';
   DM.Qr.Open;

   ShowMessage(DM.Qr.FieldByName('id').AsVariant);
   ShowMessage(DM.Qr.FieldByName('Descr').AsString);

   Exit;
   SL:=TSTringList.Create;
   for i:=1 to 2000 do
    try
     DM.Qr.Close;
     DM.Qr.SQL.Text:='select convert(varchar,getdate(),'+IntToStr(i)+') as dt';
     DM.Qr.Open;
     SL.Add(IntToStr(i)+' - "'+DM.Qr.FieldByName('dt').AsString+'"');
    except
    end;

   SL.SaveToFile('C:\Log\ConvertDt.txt');

    Exit;
    PrintSrokSkd(0);
    Exit;
    PrintRep.Clear;
    PrintRep.SetDefault;
    PrintRep.Stretch:=True;
    PrintRep.Indent:=0;

//    PrintRep.AddTable(1,QrToOff.RecordCount);

    jpeg := TJPEGImage.Create;
    try
     jpeg.CompressionQuality:=100;
     jpeg.LoadFromFile('D:\588_4170_1.jpg');
     Bmp:=TBitmap.Create;
     try
      Bmp.Assign(jpeg);
      PrintRep.AddImage(Bmp,100);
//          PrintRep.AddText(#12);
      PrintRep.AddImage(Bmp,100);
     finally
      Bmp.Free
     end;
    finally
     Jpeg.Free
    end;

  PrintRep.PreView;
  Exit;
  //FP:=CreateOleObject('Marry301.Mary301mtmT7');

//   EKKA.fpCancelFiscalReceipt;
//  FP:=CreateOleObject('ArtSoft.ExellioFPU-550');

//  FP.OpenPort(1,115200);
//  FP.XReport('0000');

 {
  FP.fpConnect;
  FP.fpZeroCheck;
 }

//  for i:=1 to 85 do EKKA.fpSoundEx(Buf[I,1]+500,Buf[I,2]+200);
//  ShowMEssage(ExtractFileDir(ParamStr(0)));

  Exit;
  DM.Qr.Close;
  DM.Qr.SQL.Clear;
  DM.Qr.SQL.Add('declare @id int ');
  DM.Qr.SQL.Add('set @id=Scope_Identity()');
  DM.Qr.SQL.Add('insert into Inform..JMess(Mess) values(''ff'')');
  DM.Qr.SQL.Add('select @id as ID1, Scope_Identity() as ID2');
  DM.Qr.Open;
  ShowMessage('ID1=|'+DM.Qr.FieldByName('ID1').AsString+'|   ID2=|'+DM.Qr.FieldByName('ID2').AsString+'|' );
  Exit;

  EKKA.fpCurrToDisp(Random(100));
  Exit;

   SL:=TSTringList.Create;
   for i:=1 to 2000 do
    try
     DM.Qr.Close;
     DM.Qr.SQL.Text:='select convert(varchar,getdate(),'+IntToStr(i)+') as dt';
     DM.Qr.Open;
     SL.Add(IntToStr(i)+' - "'+DM.Qr.FieldByName('dt').AsString+'"');
    except
    end;
   SL.SaveToFile('C:\Log\ConvertDt.txt');
   Exit;

 end;

procedure TMainF.tmpButton2Click(Sender: TObject);
var FName:String;
    SL:TStringList;
    i:Integer;
 begin
  if Not CheckPassword('2726011013') then Exit;

  DM.Qr.Close;
  DM.Qr.SQL.Clear;

  DM.Qr.SQL.Add('if Object_ID(N''tmpa'') is not null drop table tmpa  ');
  DM.Qr.SQL.Add('select art_code as art into tmpa from SprTov (nolock) where art_code not in (select IsNull(art_Code,0) from SprNoRecipt (nolock)) ');

{
  DM.Qr.SQL.Add('                                                                       ');
  DM.Qr.SQL.Add('exec(''Bulk insert tmpa from ''''D:\AVA\Recipt.txt'''' with ( FIELDTERMINATOR = ''''|'''', ROWTERMINATOR = ''''\n'''', CODEPAGE = 1251)'') ');
  DM.Qr.SQL.Add('                                                                                                                                            ');
}

  DM.Qr.SQL.Add('insert into Chek(KOD_NAME,NAMES,KOL,CENA,F_NDS,PRINTING,TYPE_TOV,ID_USER,SUMSKD,ART_CODE,SKD,NUMCARD,ART_NAME,SUMSKDK,NUMCARDK,OLD_ART)     ');
  DM.Qr.SQL.Add('select b.kod_name,b.names,b.ostat,b.cena,b.f_nds,1,b.type_tov,3,0,b.art_code,0,-1,b.art_name,0,0,b.art_code                                 ');
  DM.Qr.SQL.Add('from SprTov b                                                                                                                               ');
  DM.Qr.SQL.Add('where art_code in (select art from tmpa) and ostat>0                                                                                        ');
  DM.Qr.SQL.Add('                                                                                                                                            ');
  DM.Qr.SQL.Add('update SprTov set ostat=0 where art_code in (select art from tmpa)                                                                          ');
  DM.Qr.SQL.Add('                                                                                                                                            ');
  DM.Qr.SQL.Add('declare @dt datetime                                                                                                                        ');
  DM.Qr.SQL.Add('set @dt=convert(datetime,convert(varchar,getdate(),23))                                                                                     ');
  DM.Qr.SQL.Add('exec spY_WriteChek 3,0,99,1,0,@dt,7,'''',0,0                                                                                                ');
  DM.Qr.SQL.Add('select 1 as Res ');

  DM.AdoCo.BeginTrans;
  try
   DM.Qr.Open;
   if DM.Qr.FieldByName('Res').AsInteger<>1 then Abort;
   ShowMessage('Возврат сформирован!');
   DM.AdoCo.CommitTrans;
  except
   on E:Exception do
    begin
     DM.AdoCo.RollbackTrans;
     ShowMessage('Ошибка: '+E.Message);
    end;
  end;

 end;

procedure TMainF.WMHotKey(var Msg:TWMHotKey);
 begin
//  if Msg.HotKey = id_SnapShot then ShowMessage('GotIt');
 end;

{ TClearDisp }



procedure TMainF.BitBtn3Click(Sender: TObject);
var C:String;
    Tg:Integer;
 begin
  if Sender=nil then Exit;

  Tg:=TBitBtn(Sender).Tag;

  if Not CheckPassword('789') then Exit;
  if EKKA.UseEKKA=False then
   begin
    MainF.MessBox('Кассовый не используется'); Exit;
   end;

  Case Tg of
   0:if MainF.MessBox('Вы действительно хотите снять Z-отчет и сменить ставку Б на 7% ?',52)<>ID_YES then Exit;
   1:if MainF.MessBox('Вы действительно хотите снять Z-отчет и сменить ставку А на 20% ?',52)<>ID_YES then Exit;
   2:if MainF.MessBox('Вы действительно хотите снять Z-отчет и сменить ставку В на 0% ?',52)<>ID_YES then Exit;
  end;

  Repeat
   EKKA.fpZRep;
   if EKKA.LastError<>'' then
    begin
     if MessBox(EKKA.LastErrorDescr,52)=ID_NO then Break;
    end else Break;
  Until False;
  Repeat
   Case Tg of
    0:C:='NALGБ00000';
    1:C:='NALGА00000';
    2:C:='NALGВ00000';
   end;
   EKKA.fpSendCommand(C);
   if (EKKA.LastError<>'') and (EKKA.LastError<>'SOFTREPL') then
    begin
     if MessBox(EKKA.LastErrorDescr,52)=ID_NO then Exit;
    end;

   Case Tg of
    0:C:='NALGБ00700';
    1:C:='NALGА02000';
    2:C:='NALGВ00000';
   end;

   EKKA.fpSendCommand(C);
   if (EKKA.LastError<>'') and (EKKA.LastError<>'SOFTREPL') then
    begin
     if MessBox(EKKA.LastErrorDescr,52)=ID_NO then Exit;
    end else Break;
  Until False;
  C:='CNAL';

   EKKA.fpSendCommand(C);
//   ShowMessage(Copy(C,25,1));
   if Copy(C,26,1)='7' then
    begin
     MessBox('Ставка 7% успешно установлена');
     DM.QrEx.Close;
     DM.QrEx.SQL.Text:='update SprIp set s7=7 where id_kassa='+IntToStr(Opt.KassaID)+' and id_user='+IntToStr(Prm.UserID)+' and Dt='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DTLogin)
                       +''' and VzhS='''+EKKA.VzhNumS+'''';
     DM.QrEx.ExecSQL;

{    DM.Qr.SQL.Add('insert into SprIP(IP,ID_KASSA,ID_USER,VERSION,DT,VZHS)');
   DM.Qr.SQL.Add('Values ('''+IP+''','+IntToStr(Opt.KassaID)+','+IntToStr(Prm.UserID)+','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',FApplDateTime)+''',@dt,'''+EKKA.VzhNumS+''') ');
 }
    end;
end;

procedure TMainF.BitBtn4Click(Sender: TObject);
 begin
  DM.Qr.Close;
  DM.Qr.SQL.Text:='use apteka_net '#10' delete from JournZ where datez is null ';
  DM.Qr.ExecSQL;
 end;

procedure TMainF.pns2Click(Sender: TObject);
 begin
  SprOrder:=O_NAMES;
 end;

procedure TMainF.lbArtClick(Sender: TObject);
 begin
  SprOrder:=O_ART_CODE;
 end;

procedure TMainF.N53Click(Sender:TObject);
 begin
  PrintSrokSkd(1);
 end;

procedure TMainF.N54Click(Sender:TObject);
 begin
  try
   SrokMovF:=TSrokMovF.Create(Self);
   try
    Application.ProcessMessages;
    SrokMovF.ShowModal;
   finally
    SrokMovF.Free;
   end;
  except
   on E:Exception do MessBox('Ошибка открытия окна: '+E.Message);
  end;
 end;

procedure TMainF.N55Click(Sender: TObject);
 begin

  DocumentsExtendedF:=TDocumentsExtendedF.Create(Self);
  try
   Application.ProcessMessages;
   DocumentsExtendedF.ShowModal;
  finally
   DocumentsExtendedF.Free;
  end;
{
  DocumentsF:=TDocumentsF.Create(Self);
  try
   Application.ProcessMessages;
   DocumentsF.ShowModal;
  finally
   DocumentsF.Free;
  end;
}
 end;

procedure TMainF.N56Click(Sender:TObject);
 begin
  try
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Style:=[fsBold];
   PrintRep.Font.Size:=5;
   PrintRep.Align:=AL_CENTER;
   PrintRep.Orientation:=O_LANDS;
   PrintRep.AddText('Список препаратов "Доступнi лiки" на дату: '+DateTimeToStr(Now)+#10#10);

   PrintRep.Font.Style:=[];
   PrintRep.Font.Size:=4;
   PrintRep.Align:=AL_LEFT;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
{
   DM.Qr.SQL.Add('select s.Names as [Товар_S_5900],');
   DM.Qr.SQL.Add('       m.MNN_EN  as [Международн._S_2000],');
   DM.Qr.SQL.Add('       s.cena  as [Цена парйс_N_1000],');
   DM.Qr.SQL.Add('       s.cena-p.cena as [Цена пациента_N_1100] ');
   DM.Qr.SQL.Add('from SprTov s (nolock), vSprPilot p (nolock), SprMnn m (nolock)');
   DM.Qr.SQL.Add('where s.art_code=p.art_code and p.mnn=m.mnn and');
   DM.Qr.SQL.Add('      s.ostat>0 and p.cena<s.cena');
   DM.Qr.SQL.Add('group by s.Names,m.MNN_EN,s.cena,p.cena ');
}
   DM.Qr.SQL.Text:='spY_ReestrList';
   DM.Qr.Open;

   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(False,0,0,False);
   PrintRep.PreView;
  except
   on E:Exception do

  end;
 end;

procedure TMainF.PlServerExecute(AThread:TIdPeerThread);
var S:String;
 begin
 { S:='0';
  With AThread.Connection do
   begin

    Disconnect;
   end;
 }
  ShowMessage('Тут 1');
 end;

procedure TMainF.Button2Click(Sender: TObject);
var msRecInfo:TMemoryStream;
    S:String;
 begin
{  S:='OPEN ';
  msRecInfo:=TMemoryStream.Create;
  msRecInfo.Write(S,SizeOf(S));
  msRecInfo.Position:=0;

  PClient.Connect;
  PClient.Write(S);
}
 end;


procedure TMainF.PlServerOpenChekCommand(ASender: TIdCommand);
var LFormat:String;
 begin
 if ASender.Params.Count = 0 then
  begin
    LFormat := 'yyyy-mm-dd hh:nn:ss';
  end
  else
  begin
    LFormat := ASender.Params[0];
  end;
  ASender.Reply.Text.Text := FormatDateTime(LFormat, Now);
 end;

procedure TMainF.tmPlayTimer(Sender: TObject);
var dx,dy,i:Integer;
 begin
  try
   tmPlay.Enabled:=False;
   try
    if (((DM.qrUp.IsEmpty=False) and (DM.qrUp.FieldByName('Ord').AsInteger=0)) or ((DM.qrDown.IsEmpty=False) and (DM.qrDown.FieldByName('Ord').AsInteger=0))) and
       (Time-ssTime>StrToTime('00:00:01')) and
       (hKonkurHintF.Visible=False) and (FCanShowingKonkurHint=True) then
     begin
      if (DM.qrUp.IsEmpty=False)   and (DM.qrUp.FieldByName('Ord').AsInteger=0)   then begin GetCoordControl(Self,dbgUp,dx,dy); hKonkurHintF.Label1.Caption:=DM.qrUp.FieldByName('Descr').AsString;     end else
      if (DM.qrDown.IsEmpty=False) and (DM.qrDown.FieldByName('Ord').AsInteger=0) then begin GetCoordControl(Self,dbgDown,dx,dy); hKonkurHintF.Label1.Caption:=DM.qrDown.FieldByName('Descr').AsString; end;

      hKonkurHintF.Show;
      hKonkurHintF.Left:=dx+100;
      hKonkurHintF.Top:=dy+75;

      //if dbgSklad.Visible then dbgSklad.SetFocus;
      dbgSkladSetFocused;
     end else
    if Not ( (((DM.qrUp.IsEmpty=False) and (DM.qrUp.FieldByName('Ord').AsInteger=0)) or ((DM.qrDown.IsEmpty=False) and (DM.qrDown.FieldByName('Ord').AsInteger=0)))) and
       (hKonkurHintF.Visible) then
     begin
      hKonkurHintF.Hide;
      //if dbgSklad.Visible then dbgSklad.SetFocus;
      dbgSkladSetFocused;
     end;
   except
   end;
   {
   try
    if High(qPlay)<0 then Exit;
    if Not FileExists(qPlay[0].FName) then qPlay[0].Done:=2;
    if (qPlay[0].Done=1) and (mpMain.Mode<>mpPlaying) then qPlay[0].Done:=2;
    if qPlay[0].Done=2 then
     begin
      for i:=Low(qPlay) to High(qPlay)-1 do qPlay[i]:=qPlay[i+1];
      SetLength(qPlay,High(qPlay));
     end;
    if High(qPlay)<0 then Exit;
    if (qPlay[0].Done=0) and (mpMain.Mode<>mpPlaying) then PlayMp3;
   except
   end;
  }
  finally
   tmPlay.Enabled:=True;
  end;

 end;

procedure TMainF.dbgSkladKeyUp(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  FIsKeyDown:=False;
  srSprTovDataChange(Sender,TDBGrid(Sender).SelectedField);
 end;

procedure TMainF.dbgUpDblClick(Sender: TObject);
 begin
  if Sender=nil then Exit;
  if TDBGrid(Sender).DataSource.DataSet.IsEmpty then Exit;

  if dbgSklad.DataSource.DataSet.Locate('Art_Code',TDBGrid(Sender).DataSource.DataSet.FieldByName('Art_Code').AsInteger,[loCaseInsensitive,loPartialKey]) then PrevEnterKol(EK_DIALOG,0,TDBGrid(Sender).DataSource.DataSet.FieldByName('Art_Code').AsInteger);
 end;

procedure TMainF.splMainMoved(Sender:TObject);
 begin
//  CheckShowngUpDownAnalogs;
 end;

procedure TMainF.dbgSkladCellClick(Column: TColumn);
 begin
  srSprTovDataChange(dbgSklad,dbgSklad.SelectedField);
  lbSearch.Caption:='';
  pnExt.Visible:=False;
 end;

procedure TMainF.BitBtn5Click(Sender:TObject);
 begin
  MainF.miAddOtkazClick(MainF.miAddOtkaz);
 end;

procedure TMainF.sbUpClick(Sender:TObject);
 begin
  ShowForATC(DM.qrUp,0,BoolToInt(sbUp.Down),1);
 end;

procedure TMainF.sbDownClick(Sender:TObject);
 begin
  ShowForATC(DM.qrDown,1,BoolToInt(sbDown.Down),1);
 end;

procedure TMainF.BitBtn6Click(Sender:TObject);
var QrToOff:TADOQuery;
    Art:Integer;
 begin
  if DM.spY_FilterSklad.IsEmpty then Exit;
  try
   ZakazPriceF:=TZakazPriceF.Create(Self);
   QrToOff:=TADOQuery.Create(nil);
   try
    QrToOff.Connection:=DM.ADOCo;
    QrToOff.CommandTimeout:=100;

    // Дефектура
    DM.QrEx.Close;
    DM.QrEx.SQL.Text:='select IsNull(makefrom,0) as makefrom from plist where art_code='+IntToStr(DM.spY_FilterSklad.FieldByName('art_code').AsInteger);
    DM.QrEx.Open;
    if DM.QrEx.FieldByName('MakeFrom').AsInteger>0 then Art:=DM.QrEx.FieldByName('MakeFrom').AsInteger
                                                   else Art:=DM.spY_FilterSklad.FieldByName('art_code').AsInteger;

    QrToOff.Close;
    QrToOff.SQL.Clear;
    QrToOff.SQL.Add('exec ['+Prm.ServerDB+'].ekka_net.dbo.spY_Defektura '+IntToStr(Art));
    QrToOff.Open;

    if QrToOff.IsEmpty then Exit;
    ZakazPriceF.Edit1.Text:=QrToOff.FieldByName('names').AsString;
    ZakazPriceF.BitBtn1Click(ZakazPriceF.BitBtn1);
    Application.ProcessMessages;
    ZakazPriceF.ShowModal;
   finally
    ZakazPriceF.Free;
   end;
  except
   on E:Exception do MainF.MessBox('Ошибка открытия окна поиска: '+E.Message);
  end;
 end;

procedure TMainF.Button3Click(Sender: TObject);
 begin
  EKKA.fpCancelFiscalReceipt;
 end;

procedure TMainF.dbgUpDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  if db.DataSource.DataSet.FieldByName('Ord').AsInteger=0 then
   begin
    db.Canvas.Font.Name:='Arial';
    db.Canvas.Font.Style:=[fsBold,fsItalic];
    db.Canvas.Font.Charset:=RUSSIAN_CHARSET;
    db.Canvas.Font.Size:=12;
    db.Canvas.Brush.Color:=$006767B4;
    db.Canvas.Font.Color:=$0076E4F8;
   end;

  if (gdSelected in State) and (DataCol=2) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure TMainF.dbgUpMouseMove(Sender:TObject; Shift:TShiftState; X,Y:Integer);
var db:TDBGrid;
    GrdPt,P: TPoint;
    FieldText:String;
    DLink:TDataLink;
    dx,dy,OldActiveRec:Integer;
    Cell:TGridCoord;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if Y<18 then Exit;
  GrdPt.X:=X; GrdPt.Y:=Y-20;
  Cell:=db.MouseCoord(GrdPt.X, GrdPt.Y);
  FieldText:='';
  DLink:=THackDBGrid(db).DataLink;
  if Assigned(DLink) then
   begin
    if (Cell.X<0) or (Cell.Y<0) then Exit;
    OldActiveRec:=DLink.ActiveRecord;
    try
     DLink.ActiveRecord:=Cell.Y;
     FieldText:=THackDBGrid(Sender).DataLink.DataSet.FieldByName('Descr').AsString;
     if FieldText='' then hKonkurHintF.Hide;
     if (FieldText<>'') and (hKonkurHintF.Visible=False) then
      begin
       P.X:=X+db.Left; P.Y:=Y+db.Top;
       //Label16.Caption:=FieldText;
       GetCoordControl(Self,db,dx,dy);
       hKonkurHintF.Label1.Caption:=FieldText;

       hKonkurHintF.Show;
       hKonkurHintF.Left:=dx+X-40;
       hKonkurHintF.Top:=dy+Y+50;

      end;
    finally
     DLink.ActiveRecord:=OldActiveRec;
    end;
   end;


 {
  Label24.Caption:=IntToStr(THackDBGrid(Sender).DataLink.ActiveRecord)+'  '+
                   IntToStr(THackDBGrid(Sender).DataLink.RecordCount);
}
//  Label24.Caption:=THackDBGrid(Sender).DataLink.DataSet.FieldByName('Ord').AsString;

 end;

procedure TMainF.tmStrTimer(Sender:TObject);
 begin
{
  try
//   keybd_event (VK_NUMLOCK, 0, KEYEVENTF_EXTENDEDKEY, 0);
   keybd_event (VK_NUMLOCK, 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  except
  end;
}
 {
  if GetAsynckeyState($91)<>0 then
   begin
    DM.qrAlarm.Close;
    DM.qrAlarm.Parameters.ParamByName('idu').Value:=Prm.UserID;
    DM.qrAlarm.ExecSQL;
   end;
}
 end;

procedure TMainF.tmAlarmTimer(Sender:TObject);
{
 var ID:Integer;
    V:Boolean;
}
 begin
{
  try
   if Design then Exit;
   tmAlarm.Enabled:=False;
   V:=tmWaitComm.Enabled;
   tmWaitComm.Enabled:=False;
   try
    DM.qrTmA.Close;
    DM.qrTmA.SQL.Clear;
    DM.qrTmA.SQL.Add('select top 1 * from Danger where Not (compname=host_name() and id_user=:idu) and Active=1 and id not in (select id_alarm from Jdanger where id_user=:idu1) and ');
    DM.qrTmA.SQL.Add(' DateDiff(mi,dt,getdate())<=5 ');
    DM.qrTmA.Parameters.ParamByName('idu').Value:=Prm.UserID;
    DM.qrTmA.Parameters.ParamByName('idu1').Value:=Prm.UserID;
    DM.qrTmA.Open;
    ID:=DM.qrTmA.FieldByName('id').AsInteger;
    if DM.qrTmA.IsEmpty then Exit;
     ShowAlarmF:=TShowAlarmF.Create(Self);
     try
      Application.ProcessMessages;
      ShowAlarmF.ShowModal;

      DM.qrTmA.Close;
      DM.qrTmA.SQL.Clear;
      DM.qrTmA.SQL.Add('update Danger set Active=0 where id=:ida1 ');
      DM.qrTmA.SQL.Add('insert into JDanger(id_alarm,id_user)');
      DM.qrTmA.SQL.Add('values(:ida,:idu) ');

      DM.qrTmA.Parameters.ParamByName('idu').Value:=Prm.UserID;
      DM.qrTmA.Parameters.ParamByName('ida').Value:=ID;
      DM.qrTmA.Parameters.ParamByName('ida1').Value:=ID;
      DM.qrTmA.ExecSQL;

     finally
      ShowAlarmF.Free;
     end;
   except
   end;
  finally
   tmAlarm.Enabled:=True;
   tmWaitComm.Enabled:=V;
  end
 }
 end;

procedure TMainF.N59Click(Sender: TObject);
 begin
  if Not CheckPassword('963147') then Exit;
//  if Not IsPermit([],P_ALERT) then Exit;

  if MessBox('Вы действительно хотите сформировать полный возврат?',52)<>ID_YES then Exit;

  try
   DM.spY_MakeBackAll.Close;
   DM.spY_MakeBackAll.ExecProc;
   FilterSklad;
   MessBox('Возврат сформирован! Можно выгрузить данные на флешку.',64);
  except
   on E:Exception do MessBox('Ошибка формирования полного возврата: '+E.Message);
  end;
 end;

procedure TMainF.N60Click(Sender:TObject);
 begin
  ReestrF:=TReestrF.Create(Self);
  try
   Application.ProcessMessages;
   ReestrF.ShowModal;
  finally
   ReestrF.Free;
  end;
 end;

procedure TMainF.miNonCashReciptClick(Sender:TObject);
var Tb:TTableObj;
    D1,D2:TDateTime;
    sA,sM:String;
    dy,i:Integer;
 begin
  try
   D1:=Date-1;
   if GetDiagDate(D1,D2)=False then Exit;
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Orientation:=O_LANDS;

   PrintRep.Font.Style:=[fsBold];
   PrintRep.Align:=AL_CENTER;

   PrintRep.Font.Size:=4;
   PrintRep.Indent:=0;
   PrintRep.AddTable(3,2);

   Tb:=PrintRep.LastTable;
   Tb.SetWidths('1500,10000,1500');
   Tb.SetBorders(1,1,3,2,EMPTY_BORDER);

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select medname,address from Apteks271 where id_apteka='+IntToStr(Prm.AptekaID);
   DM.QrEx.Open;
   sM:=DM.QrEx.FieldByName('medname').AsString;
   sA:=DM.QrEx.FieldByName('address').AsString;

{
   Tb.Cell[1,1].AddText('КП ОЗ МЛА №271');
   Tb.Cell[1,2].AddText('пров. Балакірєва, 3');

   Tb.Cell[3,1].AddText('Ліцензія АВ №527984');
   Tb.Cell[3,2].AddText('вiд 09.04.2010');
}
   PrintRep.AddText(#10'Реєстр'#10);
   PrintRep.AddText('Медикаментiв, відпущених КП ОЗ МЛА №271'#10);
   PrintRep.AddText('за безкоштовними рецептами хворим '+sM+#10);

   PrintRep.AddText('За період '+DateToStr(D1)+' по '+DateToStr(D2)+#10#10);
   PrintRep.Align:=AL_LEFT;

   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('select 1 as f union select 2');
   DM.QrEx.Open;

   dy:=DM.QrEx.RecordCount;

   PrintRep.Font.Style:=[];
   PrintRep.Font.Size:=3;

   PrintRep.AddTable(11,dy+8);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('1500,1500,2000,4100,2300,3300,6700,1500,1500,1500,2300');

   Tb.Cell[1,1]. Align:=AL_CENTER; Tb.Cell[1,1]. AddText('№');
   Tb.Cell[2,1]. Align:=AL_CENTER; Tb.Cell[2,1]. AddText('№ рец.');
   Tb.Cell[3,1]. Align:=AL_CENTER; Tb.Cell[3,1]. AddText('Дата отоварювання');
   Tb.Cell[4,1]. Align:=AL_CENTER; Tb.Cell[4,1]. AddText('ПІП хворого');
   Tb.Cell[5,1]. Align:=AL_CENTER; Tb.Cell[5,1]. AddText('Адреса хворого');
   Tb.Cell[6,1]. Align:=AL_CENTER; Tb.Cell[6,1]. AddText('ПІП лікаря');
   Tb.Cell[7,1]. Align:=AL_CENTER; Tb.Cell[7,1]. AddText('Назва медикаментів');
   Tb.Cell[8,1]. Align:=AL_CENTER; Tb.Cell[8,1]. AddText('Од. вим.');
   Tb.Cell[9,1]. Align:=AL_CENTER; Tb.Cell[9,1]. AddText('К-сть');
   Tb.Cell[10,1].Align:=AL_CENTER; Tb.Cell[10,1].AddText('Ціна');
   Tb.Cell[11,1].Align:=AL_CENTER; Tb.Cell[11,1].AddText('Сума відшкодування');

   Tb.MergeCells(1,2,11,2);
   Tb.Cell[1,2].AddText(sM+' ('+sA+')');

{
   for i:=1 to dy do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;

    end;
}

   for i:=1 to 5 do Tb.MergeCells(1,dy+2+i,10,dy+2+i);

   Tb.MergeCells(1,dy+8,6,dy+8);
   Tb.MergeCells(8,dy+8,11,dy+8);

   Tb.Cell[1,dy+3].AddText('Кількість хворих: ');
   Tb.Cell[1,dy+4].AddText('Кількість рецептів: ');
   Tb.Cell[1,dy+5].AddText('Сумма коштів відпущених медикаментів: ');
   Tb.Cell[1,dy+6].AddText('Сумма коштів, що підлягає: ');
   Tb.Cell[1,dy+7].AddText('Сумма коштів, що сплачена хворим: ');
   Tb.Cell[1,dy+8].AddText('Сумма до сплати прописом: ');

   Tb.Cell[7,dy+8].AddText('');
   PrintRep.AddInterv(5);

   PrintRep.AddText('Керівник:  ____________________________________________'#10#10);
   PrintRep.AddText('Бухгалтер: ____________________________________________');

   PrintRep.PreView;

  except
   on E:Exception do MessBox('Ошибка формирования отчета: '+E.Message);
  end;
 end;

function TMainF.GetBrend:Integer;
 begin
  if Prm.FirmID=13 then Result:=BR_308 else
  if Prm.Dobraia   then Result:=BR_DOBR else
  if Prm.AptekaSklad then Result:=BR_OPT
                     else Result:=BR_911;
 end;

procedure TMainF.N61Click(Sender: TObject);
 begin
  ShowPrihTov(StrToDate(DateToStr(Date)),0,PR_WATER,False,0,True);
 end;

procedure TMainF.N62Click(Sender: TObject);
 begin
  SpisNeedAktF:=TSpisNeedAktF.Create(Self);
  try
   Application.ProcessMessages;
   SpisNeedAktF.ShowModal;
  finally
   SpisNeedAktF.Free;
  end;
 end;

procedure TMainF.cbExtClick(Sender:TObject);
 begin
  FilterSklad;
 end;

procedure TMainF.N63Click(Sender:TObject);
 begin
  try
   ArmourInApteksF:=TArmourInApteksF.Create(Self);
   try
    Application.ProcessMessages;
    ArmourInApteksF.ShowModal;
   finally
    ArmourInApteksF.Free;
   end;
  except
   on E:Exception do MessBox('Ошибка открытия окна: '+E.Message);
  end;
 end;

procedure TMainF.BitBtn2Click(Sender:TObject);
var Com:String;
 begin

  Com:='MDMDAE021122';
  EKKA.fpSendCommand(Com);
  if EKKA.LastErrorDescr<>'' then begin MessBox(EKKA.LastErrorDescr); Exit; end;

  Com:='PRSN';
  EKKA.fpSendCommand(Com);
  if EKKA.LastErrorDescr<>'' then begin MessBox(EKKA.LastErrorDescr); Exit; end;

  MessBox('Для завершения персонализации выключите и включите кассовый аппарат!');

 end;

procedure TMainF.BitBtn8Click(Sender:TObject);
 begin
  if Not EKKA.fpSetHead(edHead.Text) then raise EAbort.Create(EKKA.LastErrorDescr);
 end;

procedure TMainF.N64Click(Sender:TObject);
 begin
  JPaySlipF:=TJPaySlipF.Create(Self);
  try
   Application.ProcessMessages;
   JPaySlipF.ShowModal;
  finally
   JPaySlipF.Free;
  end;
 end;

procedure TMainF.N210Click(Sender: TObject);
 begin
  JPaySlipF1:=TJPaySlipF1.Create(Self);
  try
   Application.ProcessMessages;
   JPaySlipF1.ShowModal;
  finally
   JPaySlipF1.Free;
  end;
 end;

procedure TMainF.N65Click(Sender:TObject);
 begin
  if Not IsPermit([R_SUPER],P_ALERT) then Exit;

  Application.ProcessMessages;
  JPaySlipF2:=TJPaySlipF2.Create(Self);
  try
   JPaySlipF2.ShowModal;
  finally
   JPaySlipF2.Free;
  end;
 end;

procedure TMainF.N66Click(Sender: TObject);
 begin
  if Not CheckPassword(GetPasswRep) then Exit;
  try
   RepKassirSumm1F:=TRepKassirSumm1F.Create(Self);
   try
    Application.ProcessMessages;
    RepKassirSumm1F.ShowModal;
   finally
    RepKassirSumm1F.Free;
   end;
  except
   MessBox(ER_CR_FORM);
  end;
 end;

procedure TMainF.N68Click(Sender:TObject);
 begin
  MotivationSystemF:=TMotivationSystemF.Create(Self);
  try
   Application.ProcessMessages;
   With MotivationSystemF do
    begin
     lbUser.Caption:=Prm.UserName;
     lbUser.Hint:=IntToStr(Prm.ID_Gamma);
     ShowModal;
    end;
  finally
   MotivationSystemF.Free;
  end;
 end;

procedure TMainF.SpeedButton2Click(Sender:TObject);
var Num,url:String;
 begin
  if TSpeedButton(Sender).Down=True then
   if ChekOpened=False then
    begin
     TSpeedButton(Sender).Down:=False;
     Exit;
   end;

  if TSpeedButton(Sender).Down=True then
   if Not EnterStrValue(Num,'Отсканируйте карту OrangeCard или введите все символы с штрихкода!') then TSpeedButton(Sender).Down:=False
   else begin
         if Length(Num)<8 then
          begin
           MainF.MessBox('Количество символов штрихкода должно быть не меньше восьми!');
           TSpeedButton(Sender).Down:=False;
           Exit;
          end;

         FNumGeptralCard:=Num;

         WebGeptralF:=TWebGeptralF.Create(Self);

         try

          DM.Qr.Close;
          DM.Qr.SQL.Text:='select Value from Spr_Const where Descr=''SiteOrange'' ';
          DM.Qr.Open;

          WebGeptralF.Url:=DM.Qr.FieldByName('Value').AsString;
          Application.ProcessMessages;
          WebGeptralF.ShowModal;

          if MainF.MessBox('Вы подтверждаете скидку по карте ОранжКард',52)<>ID_YES then TSpeedButton(Sender).Down:=False;
         finally
          WebGeptralF.Free;
         end;
        end;

  if TSpeedButton(Sender).Down then Type_Skd:=SK_ORANGE
                               else Type_Skd:=SK_NONE;

 end;

procedure TMainF.N70Click(Sender: TObject);
 begin
  BackTMCF:=TBackTMCF.Create(Self);
  try
   BackTMCF.ShowModal;
  finally
   BackTMCF.Free;
  end;
 end;

procedure TMainF.N71Click(Sender: TObject);
 begin
  ShowSentMessages;
 end;

procedure TMainF.N72Click(Sender: TObject);
 begin
  try
   ChooseReciptF:=TChooseReciptF.Create(Self);
   try
    ChooseReciptF.ShowModal;
    if ChooseReciptF.Flag<>1 then Exit;
    MedName:=ChooseReciptF.cbMed.Text;
    FIODOCtor:=ChooseReciptF.cbZabolev.Text;
    Pacient:=ChooseReciptF.edFIO.Text;

    if ChooseReciptF.rb1.Checked then TypeRecipt:=1  // Бесплатный
                                 else TypeRecipt:=2; // 50%

   finally
    ChooseReciptF.Free;
   end;
  except
   on E:Exception do
    begin
     MessBox('Ошибка определения параметров рецепта: '+E.Message);
     Exit;
    end;
  end;

  FTypeChek:=TC_RECIPT_PL;
  OpenChek;

 end;

// http://gepacourse.com.ua

function TMainF.GetNmFilter:String;
 begin
  Result:=PrepareStringFilter(edCntxSearch.Text);
 end;

procedure TMainF.lbNCrdClick(Sender: TObject);
 begin
  if Not CheckPassword(FormatDateTime('yymmdd',Date)) then Exit;
  CancelChek(2);
 end;

procedure TMainF.N73Click(Sender:TObject);
var CP:TChekPos;
 begin
  if MessBox('Вы действительно хотите скорректировать дневные суммы?',52)<>ID_YES then Exit;
  try
   if Not ReadCashState(CP,0) then raise EAbort.Create(EKKA.LastErrorDescr);

  except
   on E:Exception do MessBox(E.Message);
  end
 end;

procedure TMainF.N74Click(Sender: TObject);
 begin
  LgotListF:=TLgotListF.Create(Self);
  try

   DM.qrLgotList.Close;
   DM.qrLgotList.SQL.Text:='exec spY_SpisLgotList ';
   DM.qrLgotList.Open;

   LgotListF.ShowModal;
  finally
   LgotListF.Free;
  end;
 end;

procedure TMainF.N75Click(Sender:TObject);
 begin
  PrintBlankForNewDiscontSystem;
 end;

procedure TMainF.N76Click(Sender:TObject);
 begin
  if (Prm.IsKurator=True) and (Prm.IsKuratorApt=False) then
   begin
    MessBox('На данной торговой точке вы не можете делать выдачу!');
    Exit;
   end;
  ZpF:=TZpF.Create(Self);
  try
   ZpF.Flag:=0;
   ZpF.ShowModal;
  finally
   ZpF.Free;
  end;
 end;

procedure TMainF.N13Click(Sender:TObject);
//var Res:String;
 begin
{
  MessBox('Заказ препаратов по индивидуальным рецептам в аптеке'#10'№1 "Перша", пл Конституции 20 тел. 0504008362 и '#10'Аптека №308 ул Клочковская 337А тел. 338-19-92, 773-25-84, 0504006096',
           48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),Res);
}
 end;

procedure TMainF.miForProvisClick(Sender:TObject);
 begin

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select Value from apteka_net..Spr_Const where Descr=''IsZPNew'' ';
  DM.QrEx.Open;
  if DM.QrEx.IsEmpty=False then
   begin
    N76.Visible:=(DM.QrEx.FieldByName('value').AsInteger=1) or (Design=True) ;
    N80.Visible:=(DM.QrEx.FieldByName('value').AsInteger=1) or (Design=True) ;
    N88.Visible:=(DM.QrEx.FieldByName('value').AsInteger=1) or (Design=True) ;
   end;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select Value from apteka_net..Spr_Const where Descr=''IsZPBonus'' ';
  DM.QrEx.Open;
  if DM.QrEx.IsEmpty=False then
   N103.Visible:=(DM.QrEx.FieldByName('value').AsInteger=1) or (Design=True) ;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select Value from apteka_net..Spr_Const where Descr=''ViewBonusList'' ';
  DM.QrEx.Open;
  if DM.QrEx.IsEmpty=False then
   begin
    N210.Visible:=DM.QrEx.FieldByName('value').AsInteger=1;
   end;
 end;

procedure TMainF.pnExtMouseLeave(Sender: TObject);
 begin
  pnExt.Visible:=False;
 end;

procedure TMainF.Extempore1Click(Sender: TObject);
var p:TPoint;
 begin
  pnExt.Visible:=True;
  if GetCursorPos(p)=true then SetCursorPos(p.X,p.Y+20);
 end;

procedure TMainF.dbgChekCellClick(Column:TColumn);
 begin
  pnExt.Visible:=False;
 end;

procedure TMainF.FormShortCut(var Msg:TWMKey; var Handled:Boolean);
 begin
  if Msg.CharCode=27 then pnExt.Visible:=False;
 end;

procedure TMainF.bbExtClick(Sender:TObject);
 begin
  pnExt.Visible:=False;
//  if DM.spY_FilterSklad.IsEmpty then Exit;
  AddExtemoroF:=TAddExtemoroF.Create(Self);
  try
   AddExtemoroF.ShowModal;
  finally
   AddExtemoroF.Free;
  end;

 end;

procedure TMainF.N77Click(Sender: TObject);
 begin
  ShowStartInfo(1);
 end;

procedure TMainF.pnsIClick(Sender: TObject);
var T:TDateTime;
 begin
  try
   pnsI.OnClick:=nil;
   T:=Time;
   FilterSklad;
   ShowMessage('Затрачено времени: '+FormatDateTime('hh:nn:ss.zzz',Time-T)+#10+
               'Строк: '+IntToStr(DM.spY_FilterSklad.RecordCount));
  finally
   pnsI.OnClick:=pnsIClick;
  end;
 end;

procedure TMainF.N79Click(Sender:TObject);
var Res:Cardinal;
    F1,F2,FName:String;
 begin
//  ShowSite('Site911',1);

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select Value from Spr_Const where Descr=''PathSite911'' ';
  DM.QrEx.Open;
  F1:=DM.QrEx.FieldByName('Value').AsString;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select Value from Spr_Const where Descr=''PathSite911_'' ';
  DM.QrEx.Open;
  F2:=DM.QrEx.FieldByName('Value').AsString;

  if FileExists(F1)=True then Fname:=F1 else
  if FileExists(F2)=True then Fname:=F2 else Exit;

//  ShowMessage(FName);
  Res:=ShellExecute(0,'open',PChar(FName),nil,nil,SW_SHOWNORMAL);
//  ShowMEssageI(Res);
  if Res<32 then
   WinExec(PChar(FName),SW_SHOW);
 end;

procedure TMainF.N80Click(Sender:TObject);
 begin
  if (Prm.IsKurator=True) and (Prm.IsKuratorApt=False) then
   begin
    MessBox('На данной торговой точке вы не можете делать выдачу!');
    Exit;
   end;
  ZpF:=TZpF.Create(Self);
  try
   ZpF.Flag:=1;
   ZpF.ShowModal;
  finally
   ZpF.Free;
  end;
 end;

procedure TMainF.RegisterError(Caption,EMessage:String; Silent:Boolean=False);
 begin
  if Silent=False then MessBox(Caption+': '+EMessage);
  RegError(DM.qrErr,Caption,EMessage,PrPath+'\ErrorLog.txt');
 end;

procedure TMainF.Medicard1Click(Sender: TObject);
 begin
  ShowSite('SiteMediCard');
 end;

procedure TMainF.miRolikClick(Sender: TObject);
 begin
  PlayRolikF.ShowModal;
{
  PlayRolikF:=TPlayRolikF.Create(Self);
  try
   PlayRolikF.ShowModal;
  finally
   PlayRolikF.Free;
  end;
}
 end;

procedure TMainF.N83Click(Sender: TObject);
 begin

  ChangeMDMCardF:=TChangeMDMCardF.Create(Self);
  try
   ChangeMDMCardF.ShowModal;
  finally
   ChangeMDMCardF.Free;
  end;
 end;

procedure TMainF.N84Click(Sender: TObject);
 begin
    with DM.ADOQ_Tmp do
    begin
        try
        Close;
        SQL.Clear;
        SQL.Add('select descr, Value from apteka_net..spr_const (nolock)');
        SQL.Add('where descr='+#39+'store_locked'+#39);
        Open;
        if IsEmpty=False then
         if FieldByName('Value').AsString='1' then
          begin
           ShowMessage('Для вашей аптеки временно зпрещено бронирование товаров на складе!');
           exit;
          end;

        except
        end;

        ShowWorkSprF(W_ZAKAZSKL);
    end;//with
 end;

procedure TMainF.AVA1Click(Sender: TObject);
 begin
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec apteka_net..spy_unloadall ''d:\ava\'',4444 ';
   DM.QrEx.Open;
   MainF.MessBox('Данные выгружены успешно!',64);
  except
   on E:Exception do
    MainF.MessBox('Ошибка выгрузки данных: '+E.Message);
  end;
 end;

procedure TMainF.N85Click(Sender:TObject);
 begin
  ShowWorkSprF(W_ZAKAZWAIT);
 end;

procedure TMainF.N86Click(Sender:TObject);
var Sum:Currency;
    i,idres:Integer;

 begin
   if Not EnterIntValue(idres,'Введите номер заказа') then Exit;

   DM.QrX2.Close;
   DM.QrX2.SQL.Text:='exec [192.168.101.36\SQL2].workwith_gamma.dbo.spY_GetSumForZakazObsl '+IntToStr(idres);
//   DM.QrX2.SQL.Text:='select IsNull(OrderAmountCOD,0)+IsNull(OrderAmountShipping,0) as Summa from [192.168.0.9\sql5].workwith_gamma.dbo.CallCenter_Journal_Site where orderid='+IntToStr(idres);
   DM.QrX2.Open;

   if DM.QrX2.IsEmpty then
    begin
     MainF.MessBox('Заказ с номером '+IntToStr(idres)+' не найден!');
     Exit;
    end;

   if DM.QrX2.FieldByName('Sum1').AsCurrency+DM.QrX2.FieldByName('Sum2').AsCurrency<=0 then
    begin
     MainF.MessBox('По заказу №'+IntToStr(idres)+' сумма нулевая!');
     Exit;
    end;

   try
    for i:=1 to 2 do
     begin

      Sum:=DM.QrX2.FieldByName('Sum'+IntToStr(i)).AsCurrency;

      DM.spY_EnterKol.Close;
      DM.spY_EnterKol.Parameters.ParamValues['@part_code']:=4+i;
      DM.spY_EnterKol.Parameters.ParamValues['@pold_art']:=4+i;
      DM.spY_EnterKol.Parameters.ParamValues['@pkol']:=1;
      DM.spY_EnterKol.Parameters.ParamValues['@piduser']:=Prm.UserID;
      DM.spY_EnterKol.Parameters.ParamValues['@ptm']:=0;
      DM.spY_EnterKol.Parameters.ParamValues['@fr']:=0;
      DM.spY_EnterKol.Parameters.ParamValues['@MDMSkd']:=0;
      DM.spY_EnterKol.Parameters.ParamValues['@FIODoctor']:=FIODoctor;
      DM.spY_EnterKol.Parameters.ParamValues['@idres']:=-1;
      DM.spY_EnterKol.Parameters.ParamValues['@Force']:=0;
      DM.spY_EnterKol.Parameters.ParamValues['@id_zam']:=0;
      DM.spY_EnterKol.Parameters.ParamValues['@id_prior']:=0;
      DM.spY_EnterKol.Parameters.ParamValues['@NumSeriya']:=Variants.Null;
//      DM.spY_EnterKol.Parameters.ParamValues['@NumSeriya']:=NULL;
      DM.spY_EnterKol.Parameters.ParamValues['@Cena']:=Variants.Null;
//      DM.spY_EnterKol.Parameters.ParamValues['@Cena']:=NULL;
      DM.spY_EnterKol.Parameters.ParamValues['@IsSrok']:=0;
      DM.spY_EnterKol.Parameters.ParamValues['@simp']:=1;
      DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=1;
      DM.spY_EnterKol.Parameters.ParamValues['@cena_obsl']:=Sum;
      DM.spY_EnterKol.Parameters.ParamValues['@idres_np']:=idres;

      try

       DM.ADOCo.BeginTrans;
       DM.spY_EnterKol.ExecProc;
       DM.ADOCo.CommitTrans;

      except
       raise
      end;
     end;
     if Not ChekOpened then
      begin
       TypeChek:=TC_OBSL;
       FOrderID:=idres;
       OpenChek;
       btnPayCash.Enabled:=False;
      end;
    except
      on E:Exception do
       begin
        DM.ADOCo.RollbackTrans;
        MainF.RegisterError('Открытие чека для обслуживания',E.Message,False);
       end;
    end;
 end;

procedure TMainF.ShowReklamaMess;
 begin

 { Закоментировано 20.02.2017 после совещания с ДАС где решили убрать лишние сообщения с аптек

  if (Prm.AptekaID=240) or (Prm.AptekaID=274) then Exit;
  try
   ReklamaOnF:=TReklamaOnF.Create(Self);
   try
    ReklamaOnF.MaxIncr:=15;
    ReklamaOnF.ShowModal;
   finally
    ReklamaOnF.Free;
   end;
  except
  end;
  }
 end;

procedure TMainF.RegArtZamena(var Ep:TEnterParam);
var
  S: String;
begin
  if Ep.IsArtZam then
    try
      if Ep.Ra.Status=0 then S:='null' else
      begin
        if Ep.Ra.id_part<0 then Exit;
        S:=IntToStr(Ep.Ra.art_map)
      end;

      DM.QrExA.Close;
      DM.QrExA.SQL.Text:='exec report..spY_ArtZamenaReg '+
                        IntToStr(Ep.Ra.id_zam)+','+
                        IntToStr(Ep.Ra.id_part)+','+
                        IntToStr(Ep.Ra.art_code)+','+
                        S+','+
                        IntToStr(Prm.ID_Gamma)+','+
                        IntToStr(Ep.Ra.Status);
      DM.QrExA.Open;

      if Ep.Ra.Status=0 then Ep.Ra.id_part:=DM.QrExA.FieldByName('id_part').AsInteger;
    except
    end
  else
    if Ep.IsConcomit then
      try
        if Ep.Ra.Status=0 then S:='null' else
        begin
          if Ep.Ra.id_part<0 then Exit;
          S:=IntToStr(Ep.Ra.art_map)
        end;

        DM.QrExA.Close;
        DM.QrExA.SQL.Text:='exec report..spY_ConcomitReg '+
                          IntToStr(Ep.Ra.id_zam)+','+
                          IntToStr(Ep.Ra.id_part)+','+
                          IntToStr(Ep.Ra.art_code)+','+
                          S+','+
                          IntToStr(Prm.ID_Gamma)+','+
                          IntToStr(Ep.Ra.Status);
        DM.QrExA.Open;

      if Ep.Ra.Status=0 then Ep.Ra.id_part:=DM.QrExA.FieldByName('id_part').AsInteger;
    except
    end
end;
{
procedure TMainF.RegArtZamena(var Ep:TEnterParam);
var S:String;
 begin
  if Ep.IsArtZam then
   try
    if Ep.Ra.Status=0 then S:='null' else
     begin
      if Ep.Ra.id_part<0 then Exit;
      S:=IntToStr(Ep.Ra.art_map)
     end;

    DM.QrExA.Close;
    DM.QrExA.SQL.Text:='exec report..spY_ArtZamenaReg '+
                      IntToStr(Ep.Ra.id_zam)+','+
                      IntToStr(Ep.Ra.id_part)+','+
                      IntToStr(Ep.Ra.art_code)+','+
                      S+','+
                      IntToStr(Prm.ID_Gamma)+','+
                      IntToStr(Ep.Ra.Status);
//    DM.QrEx.SQL.SaveToFile('c:\az.txt');
    DM.QrExA.Open;

    if Ep.Ra.Status=0 then Ep.Ra.id_part:=DM.QrExA.FieldByName('id_part').AsInteger;
   except
   end;
 end;
}

procedure TMainF.N87Click(Sender: TObject);
 begin
  PlanForAptekaF:=TPlanForAptekaF.Create(Self);
  try
   PlanForAptekaF.ShowModal;
  finally
   PlanForAptekaF.Free;
  end;
 end;

procedure TMainF.N88Click(Sender: TObject);
 begin
  if (Prm.IsKurator=True) and (Prm.IsKuratorApt=False) then
   begin
    MessBox('На данной торговой точке вы не можете делать выдачу!');
    Exit;
   end;
  ZpF:=TZpF.Create(Self);
  try
   ZpF.Flag:=2;
   ZpF.ShowModal;
  finally
   ZpF.Free;
  end;
 end;

procedure TMainF.sbiAptClick(Sender: TObject);
var B:Boolean;
 begin
  if ChekOpened=False then begin sbDoctor.Down:=False; Exit; end;
//  Type_Skd:=SK_NONE;
  try
   try
    if TSpeedButton(Sender).Down=False then Abort;

    AddDoctorF:=TAddDoctorF.Create(Self);
    try
     B:=Sender=sbDoctor;
     if B then
      begin
       AddDoctorF.Simple:=B;
       AddDoctorF.ShowModal;
       if AddDoctorF.Flag=0 then Abort;
       if B=False then
        begin
         Fid_doctor:=AddDoctorF.aID[AddDoctorF.cbDoctor.ItemIndex].ID;
         Fcard_doctor:=AddDoctorF.lbNCard.Caption;
        end else Fid_doctorAll:=AddDoctorF.aID[AddDoctorF.cbDoctor.ItemIndex].ID;
      end else begin
                Fid_doctor:=999999;
               end;
     finally
      AddDoctorF.Free;
     end;
   except
    sbBaer.Down:=False;
    FNumKsareltoCard:='';
    Fid_doctorAll:=0;
    Fid_doctor:=0;
    Fcard_doctor:='';
    TSpeedButton(Sender).Down:=False;
   end;
  finally
   RefreshChek;
  end;
 end;

procedure TMainF.N89Click(Sender: TObject);
 begin
  if IsPermit([R_SUPER],P_ALERT)=False then Exit;

  DM.Qr.Close;
  DM.Qr.SQL.Text:='declare @dt datetime set @dt=getdate() exec spY_MakeStatement @dt,0';
  DM.Qr.Open;

  if DM.Qr.FieldByName('Res').AsInteger=1 then
   if MessBox('Ведомость уже сформирована. Вы действительно хотите сформировать ее заново?',52)<>ID_YES then Exit;

  DM.Qr.Close;
  DM.Qr.SQL.Text:='declare @dt datetime set @dt=getdate() exec spY_MakeStatement @dt,1';
  DM.Qr.Open;
  MessBox('Ведомость сформирована',64);
 end;

procedure TMainF.N90Click(Sender: TObject);
 begin

{
  if Opt.EmulEKKA then
   begin
    MessBox('На данной кассе пробивать чек по страховой нельзя!');
    Exit;
   end;

}
  if ChekOpened then
   begin
    MessBox('Сначала нужно закрыть чек!');
    Exit;
   end;

   AddStrahF:=TAddStrahF.Create(Self);
   try
    AddStrahF.ShowModal;
    //if AddStrahF.Flag<>1 then Exit;
    if MainF.FlIsStrah<>1 then exit;

    Fid_strah:=AddStrahF.id_strah;
    FName_Strah:=AddStrahF.name_strah;
    Fnn_polis:=AddStrahF.edNNPolis.Text;
    Fdt_polis:=AddStrahF.dtPolis.Date;
    FFransh:=StrToCurr(AddStrahF.edFransh.Text);
    FFIOStrah:=AddStrahF.edFIO.Text;
    FPhoneStrah:=AddStrahF.edPhone.Text;
    FNumOrder:=AddStrahF.edNumOrder.Text;

    if AddStrahF.RadioButton1.Checked then FTypeDostStrah:=0  // Доставка
                                      else FTypeDostStrah:=1; // Самовывоз
    TypeChek:=TC_MAIN;
    OpenChek;
   finally
    AddStrahF.Free;
   end;
 end;

procedure TMainF.N92Click(Sender: TObject);
var RC,i:Integer;
    SumCh,Sum,SumSkPos:Real;
    Tb:TTableObj;
 begin

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='exec spY_ShowChekList '+IntToStr(Prm.UserID);
  DM.QrEx.Open;
  if DM.QrEx.IsEmpty then Exit;
  try
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=5;
   PrintRep.Font.Style:=[fsBold,fsUnderLine];
//   PrintRep.AddText('КОПИЯ ЧЕКА'+#10#10);
//   PrintRep.Font.Size:=3;
   PrintRep.Font.Style:=[];
   PrintRep.AddText(Prm.AptekaNameRU+#10#10);
   PrintRep.AddText('Дата: '+DateTimeToStr(Now)+#10#10);
   RC:=DM.QrEx.RecordCount;
   PrintRep.AddTable(5,RC+1);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('1000,8000,2000,2000,2000');
   for i:=1 to 5 do
    begin
     Tb.Cell[i,1].Align:=AL_CENTER;
     Tb.Cell[i,1].Font.Style:=[fsBold];
    end;
   Tb.Cell[1,1].AddText('№ пп');
   Tb.Cell[2,1].AddText('Наименование');
   Tb.Cell[3,1].AddText('Кол-во');
   Tb.Cell[4,1].AddText('Цена');
   Tb.Cell[5,1].AddText('Сумма');
//   Tb.Cell[6,1].AddText('Скидка');
   SumCh:=0;
   for i:=1 to RC do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;
     Tb.Cell[1,i+1].Align:=AL_RIGHT;
     Tb.Cell[1,i+1].AddText(IntToStr(i));

     Tb.Cell[2,i+1].AddText(DM.QrEx.FieldByName('Names').AsString);

     Tb.Cell[3,i+1].Align:=AL_CENTER;
     Tb.Cell[3,i+1].AddText(DM.QrEx.FieldByName('Kol').AsString);

     Tb.Cell[4,i+1].Align:=AL_RIGHT;
     Tb.Cell[4,i+1].AddText(CurrToStrF(DM.QrEx.FieldByName('Cena').AsFloat,ffFixed,2));

     Tb.Cell[5,i+1].Align:=AL_RIGHT;
     Sum:=DM.QrEx.FieldByName('Cena').AsFloat*DM.QrEx.FieldByName('Kol').AsInteger;

     Tb.Cell[5,i+1].AddText(CurrToStrF(Sum,ffFixed,2));
     SumCh:=SumCh+Sum;
    end;

   PrintRep.Font.Name:='Courier New';
   PrintRep.AddText(#10#10);
   PrintRep.Font.Style:=[fsBold];
   PrintRep.AddTable(2,3);
   Tb:=PrintRep.LastTable;
   Tb.SetBorders(1,1,2,3,EMPTY_BORDER);
   Tb.Cell[1,3].AddText('Всего:');

   for i:=1 to 3 do Tb.Cell[2,i].Align:=AL_RIGHT;

   Tb.Cell[2,3].AddText(CurrToStrF(SumCh,ffFixed,2));

 {
   PrintRep.Font.Size:=7;
   PrintRep.AddText(#10#10#10+'=ОПЛАЧЕНО=');
 }

   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования отчета: '+E.Message);
  end;
 end;

procedure TMainF.N93Click(Sender: TObject);
 begin
  RegPredstF:=TRegPredstF.Create(Self);
  try
   RegPredstF.crPref:=CR_DRIVER; //CR_EMPLO;
   RegPredstF.Cap:='сотрудника';
   RegPredstF.Tab:='RegEmplo';
   Application.ProcessMessages;
   RegPredstF.ShowModal;
  finally
   RegPredstF.Free;
  end;
 end;

procedure TMainF.ShowNotMarkedBack(Sender:TObject);
var S,Res:String;
    i:Integer;
 begin
  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='exec spY_NotMarketBack ';
  DM.QrEx.Open;
  S:='';
  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    S:=S+DM.QrEx.FieldByName('date_nakl').AsString+' '+DM.QrEx.FieldByName('nn_nakl').AsString+#10;
   end;
  if S<>'' then
   MessBox('Следующие возвраты не собраны (не помечены как отсканированные): '+#10#10+S,
            48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
 end;

function TMainF.GetAddress:String;
 begin
  Result:='';
  if Prm.eStr1<>'' then Result:=Result+Prm.eStr1+' ';
  if Prm.eStr2<>'' then Result:=Result+Prm.eStr2+' ';
  if Prm.eStr3<>'' then Result:=Result+Prm.eStr3+' ';
  if Prm.eStr4<>'' then Result:=Result+Prm.eStr4;
 end;

procedure TMainF.N94Click(Sender: TObject);
 begin
  CalculatePlanF:=TCalculatePlanF.Create(Self);
  try
   CalculatePlanF.ShowModal;
  finally
   CalculatePlanF.Free;
  end;
 end;

procedure TMainF.N95Click(Sender:TObject);
 begin

  MainF.MessBox('Данная функция временно неактивна. По всем вопросам пишите сообщение на Call-центр.');
{
  ViolationDiagF:=TViolationDiagF.Create(Self);
  try
   ViolationDiagF.ShowModal;
  finally
   ViolationDiagF.Free;
  end;
}
 end;

procedure TMainF.N96Click(Sender: TObject);
 begin
  MainF.MessBox('Максимально-возможная сумма списания: '+CurrToStrF(FMaxSpisSum,ffFixed,2)+' грн.',64);
 end;

procedure TMainF.N98Click(Sender: TObject);
 begin
  if Prm.IsReplPhone=False then Exit;
  try
   ReplPhoneAccountF:=TReplPhoneAccountF.Create(MainF);
   ReplPhoneAccountF.ShowModal;
  finally
   ReplPhoneAccountF.Free;
  end;
 end;

procedure TMainF.N99Click(Sender: TObject);
 begin

  if ChekOpened then
   begin
    MainF.MessBox('Сначала необходимо закрыть чек!');
    Exit;
   end;

  Fn_to_chek:=TFn_to_chek.Create(Self);
  try
   Fn_to_chek.ShowModal;
  finally
   Fn_to_chek.Free;
  end;
 end;

procedure TMainF.N100Click(Sender: TObject);
 begin
  FGarant_remont:=TFGarant_remont.Create(Self);
  try
   FGarant_remont.ShowModal;
  finally
   FGarant_remont.Free;
  end;
 end;

procedure TMainF.miInsuranceInformationClick(Sender: TObject);
 begin
  try
    AddStrahF:=TAddStrahF.Create(self);
    //if AddStrahF.Flag<>1 then
    if MainF.FlIsStrah<>1 then
      exit
    else
      MainF.FStrahIsReadOnly:=true;
    AddStrahF.ShowModal;
  finally
    AddStrahF.Free;
  end;
 end;

procedure TMainF.N102Click(Sender: TObject);
 begin
  DeliveryCashInputF:=TDeliveryCashInputF.Create(Self);
  try
   Application.ProcessMessages;
   DeliveryCashInputF.ShowModal;
  finally
   DeliveryCashInputF.Free;
  end;
 end;

procedure TMainF.DeleteKurZakaz(IDRes:Integer);
 begin
  if (Prm.IsKurier) and (IDRes>0) then
   try
    DM.QrEx.Close;
    DM.QrEx.SQL.Clear;
    DM.QrEx.SQL.Add('begin try');
    DM.QrEx.SQL.Add('begin tran');
    DM.QrEx.SQL.Add(' delete from dhres where idres='+IntToStr(IDRes));
    DM.QrEx.SQL.Add(' delete from dtres where idres='+IntToStr(IDRes));
    DM.QrEx.SQL.Add('commit tran');
    DM.QrEx.SQL.Add('end try');
    DM.QrEx.SQL.Add('begin catch');
    DM.QrEx.SQL.Add(' rollback');
    DM.QrEx.SQL.Add('end catch');
    DM.QrEx.ExecSQL;
   except
   end;
  end;

procedure TMainF.miQuarantineClick(Sender: TObject);
 begin
  try
   QuarantineF:=TQuarantineF.Create(self);
   QuarantineF.ShowModal;
  finally
   QuarantineF.Free;
  end;
 end;

procedure TMainF.SetMaxSpisSum(const Value: Currency);
 begin
  FMaxSpisSum:=Value;
  lbMaxSumSpis.Caption:=CurrToStrF(Value,ffFixed,2);
 end;

procedure TMainF.cbIsSpisAllOnlyClick(Sender: TObject);
 begin
  FilterSklad;
 end;

procedure TMainF.N104Click(Sender: TObject);
 begin
  FTmp_change_employee:=TFTmp_change_employee.Create(Self);
  try
   FTmp_change_employee.ShowModal;
  finally
   FTmp_change_employee.Free;
  end;
 end;

procedure TMainF.N105Click(Sender: TObject);
begin
//  ShowWorkSprF(W_QUARANTINE1); //
  //W_ZAKAZSKL,,,,,,,,,,,,,,,
  //,W_ZAKAZWAIT
  //W_BACK1
  //W_BACK
  //W_CENNIK,W_CENNIKSROK
  //W_LT,W_LTM
  //W_PEREUCHET
  //W_BACK
  //W_BACK1
  //W_ZAKAZSKL
  //W_ZAKAZWAIT
  //W_BACK,W_BACK1
{
      W_CENNIK=1;     // Печать ценников
      W_LT=2;         // Формирование лишнего товара
      W_PEREUCHET=3;  // Формирование выборочной инвентаризации
      W_BACK=4;       // Формирование возврата по списку
      W_BACK1=5;      // Формирование возврата вручную
      W_LTM=6;        // Формирование лишнего товара по минусовой реализации
      W_CENNIKSROK=7; // Печать ценников на сроковые товары
      W_ZAKAZWAIT=9;  // Бронь ожидаемого товара
      W_QUARANTINE1=10; //Перемещение товара в карантин
}
end;

procedure TMainF.N106Click(Sender: TObject);
 begin
//  ShowWorkSprF(W_QUARANTINE1);
 end;

procedure TMainF.FormKeyPress(Sender: TObject; var Key: Char);
 begin//
  curr_data:=curr_data+Key;
 end;

procedure TMainF.miClaimesClick(Sender: TObject);
begin
  try
    try
      ClaimesF:=TClaimesF.Create(self);
      ClaimesF.ShowModal;
    finally
      ClaimesF.Free;
    end;
  except
    on E:Exception do
    begin
      MessBox('При формировании окна была получена ошибка: '+E.Message,16)
    end;
  end;
end;

procedure TMainF.N103Click(Sender: TObject);
 begin
  if (Prm.IsKurator=True) and (Prm.IsKuratorApt=False) then
   begin
    MessBox('На данной торговой точке вы не можете делать выдачу!');
    Exit;
   end;
  ZpF:=TZpF.Create(Self);
  try
   ZpF.Flag:=3;
   ZpF.ShowModal;
  finally
   ZpF.Free;
  end;
 end;

procedure TMainF.N107Click(Sender: TObject);
 begin
  ViewLessonsF:=TViewLessonsF.Create(Self);
  try
   ViewLessonsF.ShowModal;
  finally
   ViewLessonsF.Free;
  end;
 end;

procedure TMainF.sbBaerClick(Sender: TObject);
var Num,url:String;
    Res:Integer;
 begin
  if TSpeedButton(Sender).Down=True then
   if (ChekOpened=False) or (sbiApt.Down=False) then
    begin
     TSpeedButton(Sender).Down:=False;
     FNumKsareltoCard:='';
     Exit;
    end;

  if TSpeedButton(Sender).Down=True then
   if Not EnterStrValue(Num,'Отсканируйте или введите штрихкод с карты') then TSpeedButton(Sender).Down:=False
   else begin
         FNumKsareltoCard:=Num;

         DM.Qr.Close;
         DM.Qr.SQL.Text:='select Value from Spr_Const where Descr=''SiteBayer'' ';
         DM.Qr.Open;
         if DM.Qr.IsEmpty then
          begin
           MessBox('Сайт не определен. Обращайтесь в дисконтный отдел!');
           FNumKsareltoCard:='';
           TSpeedButton(Sender).Down:=False;
           Exit;
          end;

         url:=DM.Qr.FieldByName('Value').AsString;

         DM.Qr.Close;
         DM.Qr.SQL.Text:='select Value from Spr_Const where Descr=''PathSite911'' ';
         DM.Qr.Open;

         if DM.Qr.IsEmpty then
          begin
           MessBox('Браузер не найден. Обращайтесь в IT-отдел!');
           FNumKsareltoCard:='';
           TSpeedButton(Sender).Down:=False;
           Exit;
          end;

         Res:=ShellExecute(0,'open',PChar(DM.Qr.FieldByName('Value').AsString),PChar(url),nil,SW_SHOWNORMAL);
         if Res<32 then
           WinExec(PChar(DM.Qr.FieldByName('Value').AsString+' '+url),SW_SHOW);


         if MainF.MessBox('Вы подтверждаете скидку 42.8%',52)<>ID_YES then TSpeedButton(Sender).Down:=False;

        end;

  if TSpeedButton(Sender).Down then Type_Skd:=SK_FIX10
                               else Type_Skd:=SK_NONE;

 end;

procedure TMainF.miFarmZamAndSoputstvClick(Sender:TObject);
begin
  try
    FarmZamAndSoputstvF:=TFarmZamAndSoputstvF.Create(self);
    FarmZamAndSoputstvF.Caption:=MFC;
    FarmZamAndSoputstvF.ShowModal;
  finally
    FarmZamAndSoputstvF.Close;
  end;
end;

procedure TMainF.miMesHranSrokClick(Sender: TObject);
 begin
  try
   MesHranSrokF:=TMesHranSrokF.Create(self);
   MesHranSrokF.ShowModal;
  finally
   MesHranSrokF.Free;
  end;
 end;

procedure TMainF.miStickerForBoxClick(Sender: TObject);
 begin
  try
   StickerForBoxF:=TStickerForBoxF.Create(self);
   StickerForBoxF.ShowModal;
  finally
   StickerForBoxF.Free;
  end;
 end;

procedure TMainF.N110Click(Sender: TObject);
 begin
  try
   sbSearchClearClick(sbSearchClear);
   FilterSklad;

   InsulinF:=TInsulinF.Create(Self);
   try
    FTypeChek:=TC_INSULIN;
    OpenChek;
    try
     Application.ProcessMessages;
     InsulinF.ShowModal;
//      Pilot3F.DBGrid1.Enabled:=False;
     if InsulinF.Flag<>1 then
      begin
       if DM.qrChek.IsEmpty then CancelChek;
       Exit;
      end else begin
                FMedName:=InsulinF.ComboBox1.Text;
                FPacient:=InsulinF.Edit1.Text;
                FNRecipt:=InsulinF.Edit3.Text;
                FFIODOctor1:=InsulinF.Edit4.Text;
                FDtRecipt:=InsulinF.dtpRecipt.Date;
                if InsulinF.RadioButton1.Checked then FIsDopl:=1 else FIsDopl:=0;
                if dbgSklad.DataSource.DataSet.Locate('Art_Code',DM.qrMNNList.FieldByName('Art_Code').AsInteger,[loCaseInsensitive,loPartialKey]) then
                 try
                  FFlagInsulin:=True;
                  PrevEnterKol(EK_DIALOG,0,DM.qrMNNList.FieldByName('Art_Code').AsInteger);
                 finally
                  FFlagInsulin:=False;
                 end;
               end;
    finally
     InsulinF.Flag:=0;
    end;
   finally
    InsulinF.Free;
   end;

  except

  end;
 end;

procedure TMainF.N111Click(Sender: TObject);
 begin
  InsulinRepF:=TInsulinRepF.Create(Self);
  try
   InsulinRepF.ShowModal;
  finally
   InsulinRepF.Free;
  end;
 end;

function TMainF.GetGeptralChek(Sender: TObject; const request_project_id: byte; const request_operation: byte): boolean;
var
  Req: OleVariant;

  request_data, json_data: string;
  request_session_id: Longint;
  Response_OperationResult: string;
  Response_FullPrice: double;
  Response_PatientPrice: double;
  Response_InStock: integer;
  Response_SessionId: Longint;
  request_time: TDateTime;
  response_time: TDateTime;
  response_StatusCode: integer;
  response_StatusText: string;
  response_ResponseText: string;
  response_OperationCode: Longint;
  IsCanSaleGeptral: boolean;
  ErrorCodeDescription: string; 

  procedure ParseResponseData(const js: string);
  var
    str: string;
  begin
    str:=js;
    if Pos('[',str)>0 then Delete(str,Pos('[',str),1);
    if pos(']',str)>0 then Delete(str,pos(']',str),1);
    with TJSONObject.create(str) do
    begin
      try
        if has('OperationResult') then Response_OperationResult:=getString('OperationResult') else Response_OperationResult:='';
        if has('FullPrice') then Response_FullPrice:=getDouble('FullPrice') else Response_FullPrice:=0;
        if has('PatientPrice') then Response_PatientPrice:=getDouble('PatientPrice') else Response_PatientPrice:=0;
        if has('InStock') then Response_InStock:=getInt('InStock') else Response_InStock:=0;
        if has('SessionId') then Response_SessionId:=getInt('SessionId') else Response_SessionId:=request_session_id;
        if has('OperationCode') then response_OperationCode:=getInt('OperationCode') else response_OperationCode:=0;
      finally
        destroy;
      end;
    end;
  end;

begin
  Result:=true;
  IsCanSaleGeptral:=true;
  //art_code:=0;
  if EKKA.EmulEKKA=False then
  begin
    with TADOQuery.Create(self) do
    begin
      try
        if request_operation <> byte(aoFix) then
        begin
          art_code:=0;
          request_DrugCode:='';
          request_Distributor:=0;
          request_PharmPrice:=0;
          request_Amount:=0;
          try
            Connection:=DM.ADOCo;
            //проверка наличия гептралов в чеке от лицензированных поставщиков
            SQL.Clear;
	          SQL.Text:='exec spY_GetAbbotOrOrangeInChek @id_user = '+IntToStr(Prm.UserID)+', @GeptralOrOrange = ''гептрал''';
            Open;
            if IsEmpty then
            begin
              TSpeedButton(Sender).Down:=False;
              raise Exception.Create('В чеке не определены препараты "Гептрал"!');
            end;
            Last;
            if RecordCount > 1 then
            begin
              TSpeedButton(Sender).Down:=False;
              raise Exception.Create('В чек может быть добавлено только одно наименование препарата "Гептрал"!'+#13+
                                     'Либо препараты "Гептрал" от разных поставщиков');
            end;
            First;
            if (FieldByName('EAN13').IsNull) or (FieldByName('id_postav_geptral').IsNull) then
            begin
              TSpeedButton(Sender).Down:=False;
              raise Exception.Create('В чеке не определены препараты "Гептрал" или поставщик!');
            end;

            if (FieldByName('full_upak').AsFloat > 1) or (FieldByName('mod_upak').AsFloat > 0) then
            begin
              TSpeedButton(Sender).Down:=False;
              raise Exception.Create('В чек можно добавить не более 1 упаковки препарата '+FieldByName('ART_CODE').AsString+' "'+FieldByName('NAMES').AsString+'"!');
            end;
          except
            on E:Exception do
            begin
              Result:=false;
              IsCanSaleGeptral:=false;
              MainF.MessBox(E.Message);
            end;
          end;

          art_code:=FieldByName('Art_Code').AsInteger;
          request_DrugCode:=FieldByName('EAN13').AsString;
          request_Distributor:=FieldByName('id_postav_geptral').AsInteger;
          request_PharmPrice:=FieldByName('max_cena_upak').AsFloat;
          request_Amount:=FieldByName('full_upak').AsInteger;
        end;
      finally
        if not TSpeedButton(Sender).Down then FNumGeptralCard:='';

        request_time:=Now();
        with TADOQuery.Create(self) do
        begin
          try
            Connection:=DM.ADOCo;
            SQL.Clear;
            SQL.Add('select isnull(max(record_id),0)+1 as rec_count from journ_geptral_request');
            Open;
            request_session_id:=FieldByName('rec_count').AsVariant;
          finally
            Free;
          end;
        end;

        if TSpeedButton(Sender).Down then
        begin
          try
            Req:=CreateOleObject('WinHttp.WinHttpRequest.5.1');
            Req.Open('HEAD', Prm.SiteGeptralAPI, true);
            Req.SetRequestHeader('Content-Type','application/x-www-form-urlencoded');
            Req.SetRequestHeader('Cache-Control','no-cache');
            Req.Send();
            Req.WaitForResponse;

            case Req.Status of
              100..199,300..599:
                begin
                  Result:=false;
                  TSpeedButton(Sender).Down:=False;
                  IsCanSaleGeptral:=false;
                  raise Exception.Create('За отведенное время был получен не корректный ответ от сервиса "Гептрал": '+IntToStr(Req.Status)+' '+Req.StatusText+#10#13+Req.ResponseBody+#10#13+Req.ResponseText);
                end;
              200..299:
                begin
                  json_data:='"Operation":'+IntToStr(request_operation)+','+
                             '"PharmCard":"'+Prm.PharmCardGeptral+'",'+
                             '"PatientCard":"'+FNumGeptralCard+'",'+
                             '"DrugCode":"'+request_DrugCode+'",'+
                             '"Distributor":'+IntToStr(request_Distributor)+','+
                             '"PharmPrice":'+FloatToStrF(request_PharmPrice,12,2)+','+
                             '"Amount":'+FloatToStrF(request_Amount,12,0)+','+
                             '"SessionId":'+IntToStr(request_session_id+1);
                  request_data:='token='+Prm.TokenGeptral+
                                '&request_format=json'+
                                '&response_format=json'+
                                '&project_id='+IntToStr(request_project_id)+
                                '&data={'+json_data+'}';
                  Req:=CreateOleObject('WinHttp.WinHttpRequest.5.1');
                  Req.Open('POST', Prm.SiteGeptralAPI, true);
                  Req.SetRequestHeader('Content-Type','application/x-www-form-urlencoded');
                  Req.SetRequestHeader('Cache-Control','no-cache');
                  Req.Send(request_data);
                  Req.WaitForResponse;

                  case Req.Status of
                    100..199,300..599:
                      begin
                        Result:=false;
                        TSpeedButton(Sender).Down:=False;
                        IsCanSaleGeptral:=false;
                        raise Exception.Create('За отведенное время был получен не корректный ответ от сервиса "Гептрал": '+IntToStr(Req.Status)+' - '+Req.StatusText+#10#13+'ResponseText: '+Req.ResponseText);
                      end;
                    200..299:
                      begin
                        response_time:=Now();
                        response_StatusCode:=Req.Status;
                        response_StatusText:=Req.StatusText;
                        response_ResponseText:=Req.ResponseText;

                        ParseResponseData(Req.ResponseText);

                        if Response_OperationResult <> 'OK' then
                        begin
                          TSpeedButton(Sender).Down:=False;
                          IsCanSaleGeptral:=false;
                          if Response_OperationResult='pharm_not_active' then
                            ErrorCodeDescription:='Аптека (карта аптеки) не активна.'
                          else if Response_OperationResult='no_pharm_card' then
                            ErrorCodeDescription:='Нет такой карты аптеки'
                          else if Response_OperationResult='no_patient_card' then
                            ErrorCodeDescription:='Нет такой карты пациента'
                          else if Response_OperationResult='card_blocked' then
                            ErrorCodeDescription:='Карта пациента заблокирована'
                          else if Response_OperationResult='not_patient_card' then
                            ErrorCodeDescription:='Указанная карта не является картой пациента'
                          else if Response_OperationResult='drug_limit' then
                            ErrorCodeDescription:='Превышен лимит покупок по карте'
                          else if Response_OperationResult='no_today_price' then
                            ErrorCodeDescription:='Не установлена цена на препарат в личном кабинете аптеки'
                          else if Response_OperationResult='no_db_or_drug_link' then
                            ErrorCodeDescription:='Дистрибьютор не назначен аптеке, либо препарат не назначен дистрибьютору. Продажа не возможна.'
                          else if Response_OperationResult='ОК' then
                            ErrorCodeDescription:='Можно проводить продажу'
                          else
                            ErrorCodeDescription:='Ошбика сервиса не определена!';
                          raise Exception.Create('От сервиса получена ошибка: "'+Response_OperationResult+'" - "'+ErrorCodeDescription+'"'+#13+
                                                 'Дисконт на покупку не возможен!'+#13+
                                                 #13+
                                                 'Полный ответ от сервиса: "'+Response_OperationResult+'"!'+#13+
                                                 'Полученый ответ: '+IntToStr(Req.Status)+' - '+Req.StatusText+#13+
                                                 'ResponseText: '+Req.ResponseText+#13);
                        end
                        else
                        begin
                          if request_operation <> byte(aoFix) then
                            MainF.MessBox('Доступный остаток по карте '+FloatToStrF(Response_InStock,3,0)+' упаковок!');
                        end;
                      end;
                  end;
                end;
            end;
          except
            on E:Exception do
            begin
              Result:=false;
              MainF.MessBox(E.Message);
              response_time:=Now();
              response_StatusCode:=Req.Status;
              response_StatusText:=Req.StatusText;
              response_ResponseText:=Req.ResponseText;
              IsCanSaleGeptral:=false;
              Type_Skd:=SK_NONE;
            end;
          end;
        end;

        if not TSpeedButton(Sender).Down then
        begin
          response_time:=Now();
          FNumGeptralCard:='';
        end;

        with TADOQuery.Create(self) do
        begin
          try
            Connection:=DM.ADOCo;
            SQL.Clear;
            SQL.Add('declare @request_time datetime set @request_time = '''+FormatDateTime('YYYY-MM-DD HH:MM:SS',request_time)+'''');
            SQL.Add('declare @request_SessionId numeric(18,0) set @request_SessionId = '+IntToStr(request_session_id));
            SQL.Add('declare @request_token varchar(50) set @request_token = '''+Prm.TokenGeptral+'''');
            SQL.Add('declare @request_project_id numeric(1,0) set @request_project_id = '+IntToStr(request_project_id));
            SQL.Add('declare @request_operation numeric(1,0) set @request_operation = '+IntToStr(request_operation));
            SQL.Add('declare @request_PharmCard varchar(50) set @request_PharmCard = '''+Prm.PharmCardGeptral+'''');
            SQL.Add('declare @request_PatientCard varchar(20) set @request_PatientCard = '''+FNumGeptralCard+'''');
            SQL.Add('declare @request_DrugCode varchar(20) set @request_DrugCode = '''+request_DrugCode+'''');
            SQL.Add('declare @request_Distributor numeric(3,0) set @request_Distributor = '+IntToStr(request_Distributor));
            SQL.Add('declare @request_PharmPrice numeric(18,2) set @request_PharmPrice = '+FloatToStrF(request_PharmPrice,12,2));
            SQL.Add('declare @request_Amount numeric(2,0) set @request_Amount = '+FloatToStrF(request_Amount,12,0));
            SQL.Add('declare @request_Data varchar(500) set @request_Data = '''+request_data+'''');
            SQL.Add('declare @response_time datetime set @response_time = '''+FormatDateTime('YYYY-MM-DD HH:MM:SS',response_time)+'''');
            SQL.Add('declare @response_StatusCode int set @response_StatusCode = '+IntToStr(response_StatusCode));
            SQL.Add('declare @response_StatusText varchar(200) set @response_StatusText = '''+response_StatusText+'''');
            SQL.Add('declare @response_ResponseText varchar(500) set @response_ResponseText = '''+response_ResponseText+'''');
            SQL.Add('declare @response_OperationResult varchar(50) set @response_OperationResult = '''+Response_OperationResult+'''');
            SQL.Add('declare @response_FullPrice numeric(18,2) set @response_FullPrice = '+FloatToStrF(Response_FullPrice,18,2));
            SQL.Add('declare @response_PatientPrice numeric(18,2) set @response_PatientPrice = '+FloatToStrF(Response_PatientPrice,18,2));
            SQL.Add('declare @response_InStock numeric(3,0) set @response_InStock = '+FloatToStrF(Response_InStock,3,0));
            SQL.Add('declare @response_SessionId numeric(18,0) set @response_SessionId = '+FloatToStrF(Response_SessionId,18,0));
            SQL.Add('declare @response_OperationCode numeric(18,0) set @response_OperationCode = '+IntToStr(response_OperationCode));
            SQL.Add('');
            SQL.Add('insert into journ_geptral_request (');
            SQL.Add('  request_time,  request_SessionId,  request_token,  request_project_id,  request_operation,  request_PharmCard,  request_PatientCard,  request_DrugCode,  request_Distributor,  ');
            SQL.Add('    request_PharmPrice,  request_Amount,  request_Data,  response_time,  response_StatusCode,  response_StatusText,  response_ResponseText, ');
            SQL.Add('      response_OperationResult,  response_FullPrice,  response_PatientPrice,  response_InStock,  response_SessionId,  response_OperationCode');
            SQL.Add('  ');
            SQL.Add(') values (');
            SQL.Add('  @request_time, @request_SessionId, @request_token, @request_project_id, @request_operation, @request_PharmCard, @request_PatientCard, @request_DrugCode, @request_Distributor, ');
            SQL.Add('    @request_PharmPrice, @request_Amount, @request_Data, @response_time, @response_StatusCode, @response_StatusText,  @response_ResponseText, ');
            SQL.Add('      @response_OperationResult, @response_FullPrice, @response_PatientPrice, @response_InStock, @response_SessionId, @response_OperationCode');
            SQL.Add('  ');
            SQL.Add(')');
            SQL.Add('');
            //SQL.SaveToFile('1234');
            ExecSQL;
          finally
            Free;
          end;
        end;
        Free;
      end;

      if request_operation = byte(aoValidate) then
      begin
        if (IsCanSaleGeptral) and (art_code > 0) then
        begin
          with TADOQuery.Create(self) do
          begin
            try
              Connection:=DM.ADOCo;
              SQL.Clear;
              SQL.Add('update');
              SQL.Add('  CHEK');
              SQL.Add('set');
              SQL.Add('  IsAbbottCard = 1');
              SQL.Add('where');
              SQL.Add('  ART_CODE = '+IntToStr(art_code));
              SQL.Add('  and CompName = host_name()');
              SQL.Add('');
              ExecSQL;
            finally
              Free;
            end;
          end;
          FGeptralPatientPrice:=Response_PatientPrice;
          if not TSpeedButton(Sender).Down then // else
          begin
            Result:=false;
            Type_Skd:=SK_NONE;
          end
          else
          begin
            Result:=true;
            Type_Skd:=SK_FIX10;
          end;
        end;
      end;
    end;
  end
  else
  begin
    if sbFix10.Down then
      Type_Skd:=SK_FIX10
    else
      Type_Skd:=SK_NONE;
  end;
end;

function TMainF.GetWinVer: string;
var
  temp1, temp2, temp3:  integer;
  OsVer: OSVERSIONINFO;
begin
  OsVer.dwOSVersionInfoSize := SizeOf( OSVERSIONINFO );
  GetVersionEx( OsVer );
  temp1 := OsVer.dwMajorVersion;
  temp2 := OsVer.dwMinorVersion;
  temp3 := OsVer.dwPlatformId;

  if temp1 = 4 then
    if temp2 = 0 then
      if temp3 = VER_PLATFORM_WIN32_WINDOWS then
        Result := 'Windows 95';

  if temp1 = 4 then
    if temp2 = 10 then
         Result := 'Windows 98';
  if temp1 = 4 then
    if temp2 = 90 then
      Result := 'Windows Me';

  if temp1 = 3 then
    if temp2 = 51 then
      Result := 'Windows NT 3.51';

  if temp1 = 4 then
    if temp2 = 0 then
      Result := 'Windows NT 4.0';

  if temp1 = 5 then
    if temp2 = 0 then
      Result := 'Windows 2000';

  if temp1 = 5 then
    if temp2 = 1 then
      Result := 'Windows XP';

  if temp1 = 6 then
    if temp2 = 0 then
      Result := 'Windows Vista';

  if temp1 = 6 then
    if temp2 = 1 then
      Result := 'Windows 7';
end;

procedure TMainF.GetWinVer(out majorVersion: integer);
var
  temp1, temp2, temp3:  integer;
  OsVer: OSVERSIONINFO;
begin
  OsVer.dwOSVersionInfoSize := SizeOf( OSVERSIONINFO );
  GetVersionEx( OsVer );
  temp1 := OsVer.dwMajorVersion;
  temp2 := OsVer.dwMinorVersion;
  temp3 := OsVer.dwPlatformId;
  majorVersion:=temp1;
end;

procedure TMainF.BitBtn10Click(Sender: TObject);
var Com:String;
 begin
  Com:='NALGА00000'; EKKA.fpSendCommand(Com); Com:='NALGА02000'; EKKA.fpSendCommand(Com);
  Com:='NALGБ00000'; EKKA.fpSendCommand(Com); Com:='NALGБ00700'; EKKA.fpSendCommand(Com);
  Com:='NALGВ00000'; EKKA.fpSendCommand(Com); Com:='NALGВ00000'; EKKA.fpSendCommand(Com);
  EKKA.fpSetTime(Time());
 end;

procedure TMainF.N113Click(Sender: TObject);
 begin
  if EnterStrValue(FPacient,'Введите ФИО пациента')=False then Exit;
  FMedName:='Управління виконавчої дирекції Фонду соціального страхування України в Харківській області';
  FTypeChek:=TC_SOCSTRAH;
  OpenChek;
 end;

procedure TMainF.ShowNotPassedTests(Sender: TObject);
var S,Res:String;
    i:Integer;
 begin
  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select NumTest from NotPassedTests where id_gamma='+IntToStr(Prm.ID_Gamma)+' order by 1';
  DM.QrEx.Open;
  S:='';
  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    S:=S+DM.QrEx.FieldByName('NumTest').AsString+#10;
   end;
  if S<>'' then
   MessBox('Вы не сдали нижеперечисленные уроки!'#10+'Обязательно пройдите их в указанные сроки (см. на сайте)!'+#10#10+S,
            48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);

 end;

END.

//        MainF.RegisterError('Автоматическое снятие Z-отчета',E.Message,True);


{

 ExeName7=ChromePortable.exe
 Path7=D:\AVA\Chrome\
 Caption7=Интернет
 Hint7=Сайт сотрудников предприятия
 Params7=
 IsOne7=1
 ShortCut7=1
 Width=1926

}
{
Правильные kassa_num



1 это наличные
2 это безготивка.2 (то есть по банковскому терминалу)

Было 11 стало 7  это новая почта
Было 12 стало 8  это безготивка.3

11  -  7
12  -  8
13  -  9

8 - Безнал3
9 - Безнал1
}

{

5830
Ноут дом
386916972

         MessBox('На Вашей аптеке только что забронировали товары. Для их просмотра, нажмите на мигающую кнопку в правом верхнем углу экрана!',
                 48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);


751426 пароль на кассовый аппарат MG N707TS
http://10.44.23.202/cgi/chk
044-499-21-52 сервис - гера
213.160.130.62 адрес экваера
80.91.191.22

-- Сервисный пароль для ИКС810
fpservice
}

{
 Карта приватбанк
 5168 7426 0492 5846
 5168 7551 0421 7829
}

{

\\911-sql-files.gamma.local\Files2
T:\SQL2\Files\

C:\ClusterStorage\SQL2\Files\
}


// select * from NewExe where ExeName='Ролик.mp3'

{

Телефон

Серегей
Ефремов
ax1894eo@gmail.com
zazforza


Скайп
sergio0523574825
s0523574825

УкрКард

https://cso.rro.ukrcard.com.ua/ords/f?p=109:LOGIN_DESKTOP:1348259708272:::::
ultrasm5984
Char7iephu

}

222322
222323

222324
222325

insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(,30,99.99,1,'2018-02-01','2018-03-31 23:59:59')

insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(,62,0,1,'2018-06-01','2018-10-31 23:59:59')
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(247324,30,99.99,1,'2018-02-01','2018-03-31 23:59:59')


delete from skd_limit where type_skd=62
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(2734  ,62,0,1,'2018-06-18','2018-10-31 23:59:59')
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(253284,62,0,1,'2018-06-18','2018-10-31 23:59:59')
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(2731  ,62,0,1,'2018-06-18','2018-10-31 23:59:59')
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(153927,62,0,1,'2018-06-18','2018-10-31 23:59:59')
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(2733  ,62,0,1,'2018-06-18','2018-10-31 23:59:59')
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(257245,62,0,1,'2018-06-18','2018-10-31 23:59:59')
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(231465,62,0,1,'2018-06-18','2018-10-31 23:59:59')
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(156988,62,0,1,'2018-06-18','2018-10-31 23:59:59')
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(209846,62,0.06,1,'2018-06-18','2018-10-31 23:59:59')

insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(247039,62,0.06,1,'2018-06-18','2018-10-31 23:59:59')
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(249190,62,0.06,1,'2018-06-18','2018-10-31 23:59:59')
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(250909,62,0.06,1,'2018-06-18','2018-10-31 23:59:59')
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(251114,62,0.06,1,'2018-06-18','2018-10-31 23:59:59')


//Тамипул арткд 39217
delete from skd_limit where type_skd=41 and art_code in (39217)
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(39217,41,30,1,'2018-06-01','2018-06-30 23:59:59')


// Акция Гербер довнесение арткодов
delete from skd_limit where type_skd=30 and art_code in (249243)
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(249243,30,0,1,'2018-02-01','2018-03-31 23:59:59')

insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(249242,30,0,1,'2018-02-01','2018-03-31 23:59:59')
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(249619,30,99.99,1,'2018-02-01','2018-03-31 23:59:59')



insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(239424,40,20,1,'2018-02-09','2018-02-15 23:59:59')


insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(67475 ,41,20,1,'2018-02-12','2018-03-12 23:59:59')

insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values( ,44,15,1,'2018-07-01','2018-07-31 23:59:59')




insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(,50,25,1,'2018-03-02','2018-03-11 23:59:59')

insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(,51,25,1,'2018-03-01','2018-03-31 23:59:59')

delete from skd_limit where type_skd=54
insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(57156,54,0,1,'2018-06-15','2018-07-31 23:59:59')



insert into skd_limit(art_code,type_skd,skd,fix,dtstart,dtend) values(,42,40,1,'2018-03-03','2018-03-11 23:59:59')





Frankie Goes To Hollywood - Relax (Final DJs Relax On The Beach Remix)

{

Апетка №10 "Здоровеньки були" Ровно пароль на сервер Администратор rtqgnfey_2015
Апетка №03 "Здоровеньки були" Владимир-Волонскый пароль на сервер Администратор Wbrkjy_4
Апетка №09 "Здоровеньки були" Луцк пароль на сервер Администратор rtqgnfey_2015

}

{
Сдам на длительный срок гараж, пос. Жуковского. "Старт" 400 грн/мес. Тел. : 068-806-95-30.

}

138239285 310574
