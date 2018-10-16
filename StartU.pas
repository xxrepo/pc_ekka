unit StartU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, Mask, ExtCtrls, Buttons, Util, DBCtrls,IniFiles,EKKAU, ActnList, ShareU, DateUtils,
     ShellApi;

type

  TStartF = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Image1: TImage;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    acStart: TActionList;
    acShowUsers: TAction;
    lbName: TLabel;
    Panel2: TPanel;
    pnWebCam: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure FormShow(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure MaskEdit1KeyDown(Sender:TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender:TObject);
    procedure FormCreate(Sender:TObject);
    procedure FormClose(Sender:TObject; var Action:TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox1Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure acShowUsersExecute(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);

  private

    FEx:Boolean;        // поле: Флаг признак - завершения программы
    hWndC:THandle;
    FParamStr:String;
    FuList:Array of Integer;
    FShowLogon:Boolean; // Признак показа заставки

    procedure LoadColors;
    procedure LoadOptions;      // Загрузка настроек программы
    procedure LoadBaseOptions;  // Загрузка настроек базы
    procedure InitWebCam;       // Инициализация Web-камеры
    procedure SnapShot;         // Сохраняет кадр съемки
    procedure CloseWebCam;      // Закрывает видео-сессию
    procedure LoadMainForm;
    procedure CheckServieNotInServer;

    function  GetProf:String;

    property Ex:Boolean read FEx write FEx; // свойство: Флаг признак - завершения программы

  public

    procedure PrepareUserList(P:Byte; P1:Byte); // Загрузка списка пользователей

    property ShowLogon:Boolean read FShowLogon write FShowLogon;

  end;

  var StartF:TStartF;


implementation

uses LogoU, DataModuleU, MainU, CheckLoginU, WelcomeU, UserListU, OtkritkaU;

{$R *.dfm}

// Create формы
procedure TStartF.FormCreate(Sender:TObject);
 begin
  try

   FParamStr:=ParamStr(1);
   DM.ADOCo.Connected:=False;
   FShowLogon:=True; // Режим вкл/выкл показа заставки
   FEx:=True;
   Prm.PrPath:=ExtractFileDir(Application.ExeName);
   Prm.OptFile:=ChangeFileExt(Application.ExeName,'.ini');
   Prm.ColorFile:=WorkPath+'\ColorSet.dat';
   Prm.Prof:=GetProf;
   LoadColors;
   LoadOptions;
   InitWebCam;

   if FEx then Abort;
   Prm.ConStr:='Provider='+Opt.SQLProvider+';Password='+Opt.BasePassw+';'+
               'Persist Security Info=True;'+
               'User ID='+Opt.BaseUser+';'+
               'Initial Catalog='+Opt.Base+';'+
               'Data Source='+Opt.Server;

   DM.ADOCo.ConnectionString:=Prm.ConStr;
   DM.ADOLog.ConnectionString:=Prm.ConStr;

   try
    DM.ADOCo.Connected:=True;
    DM.ADOLog.Connected:=True;
   except
    on E:Exception do
     begin
//      ShowMessage(E.Message);
      DM.QrSt.ConnectionString:='Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Data Source='+Opt.Server;

      DM.QrSt.SQL.Text:='exec master.dbo.sp_password @new=NULL, @loginame='''+Opt.BaseUser+''' ';
      DM.QrSt.ExecSQL;
      DM.ADOCo.Connected:=True;
      DM.ADOLog.Connected:=True;
     end;
   end;

//   DM.ADOX.ConnectionString:=DM.ADOCo.ConnectionString;
   CorrLocalDate;
   LoadBaseOptions;
   CheckServieNotInServer;
   PrepareUserList(0,0);
   if FEx then Abort;
   FEx:=False;

   {
    if Copy(FParamStr,1,2)<>'U_' then
    begin
     LoadMainForm;
    end;
   }

  except
   on E:EAbort do Ex:=True else
    begin
     ErrMess:='Ошибка подключения к базе аптеки!'; Ex:=True;
    end;
  end;
 end; {FormCreate}

procedure TStartF.CheckServieNotInServer;
 begin
  try
   if Prm.AptekaID=241 then Exit;
   if AnsiUpperCase(GetCompName)=AnsiUpperCase(Prm.ServerKompName) then Exit;
   if AnsiUpperCase(GetCompName)='SERGEY' then Exit;

//   ShowMessage(AnsiUpperCase(GetCompName)+' : '+AnsiUpperCase(Prm.ServerKompName));

   WinExec(PAnsiChar('cmd /c sc stop UnloadDataFromApteks'), SW_HIDE);
   WinExec(PAnsiChar('cmd /c sc config UnloadDataFromApteks start= disabled'), SW_HIDE);
  except
  end;
 end;

// Инициализация имени профайла в ини-файле
function TStartF.GetProf:String;
var S:String;
 begin
  S:=ParamStr(1);
  try
   if (S='') or (Copy(S,1,8)<>'WorkEKKA') then Abort;
   Result:=S;
  except
   Result:='WorkEKKA';
  end;
 end; {GetProf}

// Загрузка цветовой палитры
procedure TStartF.LoadColors;
var F:System.Text;
    B:Boolean;
    S:String;
 begin

  B:=False;
  try
   if Not (FileExists(Prm.ColorFile)) then Abort;
   System.Assign(F,Prm.ColorFile);
   System.ReSet(F);
   B:=True;

   ReadLn(F,S); CL.Order:=StrToColor(S);
   ReadLn(F,S); CL.SklFon:=StrToColor(S);
   ReadLn(F,S); CL.ChFon:=StrToColor(S);
   ReadLn(F,S); CL.MinSum:=StrToFloat(S);
   ReadLn(F,S); CL.CodeF:=StrToColor(S);
   ReadLn(F,S); CL.NamesF:=StrToColor(S);
   ReadLn(F,S); CL.OstatF:=StrToColor(S);
   ReadLn(F,S); CL.CenaF:=StrToColor(S);
   ReadLn(F,S); CL.SklFS:=StrToInt(S);
   ReadLn(F,S); CL.SklFN:=S;
   ReadLn(F,S); CL.IndicFon:=StrToColor(S);
   ReadLn(F,S); CL.IndicF:=StrToColor(S);
   ReadLn(F,S); CL.IndicFSkd:=StrToColor(S);
   ReadLn(F,S); CL.IndicNoScanF:=StrToColor(S);
   ReadLn(F,S); CL.CashSumF:=StrToColor(S);

   System.Close(F);
   B:=False;
  except
   CL.Order:=$00D8E4D6;
   CL.SklFon:=$00EBF2EA;
   CL.ChFon:=$00C6EEFD;
   CL.MinSum:=999999.99;
   CL.CodeF:=clGray;
   CL.NamesF:=clWindowText;
   CL.OstatF:=clMaroon;
   CL.CenaF:=clBlue;
   CL.SklFS:=10;
   CL.SklFN:='MS Sans Serif';
   CL.IndicFon:=clBlack;
   CL.IndicF:=CL_GREEN;
   CL.IndicFSkd:=CL_RED;
   CL.IndicNoScanF:=clYellow;
   CL.CashSumF:=clAqua;
   if B then System.Close(F);
  end;

 end; {LoadColors}

// Загрузка настроек из ini - файла
procedure TStartF.LoadOptions;
var IniFile:TIniFile;

 procedure ReadStr(var S:String; V:String);
  begin
   S:=IniFile.ReadString(Prm.Prof,V,'');
   if S='' then raise EAbort.Create('Файл настроек поврежден!');
  end;

 procedure ReadInt(var I:Integer; V:String);
  begin
   I:=IniFile.ReadInteger(Prm.Prof,V,-9999);
   if I=-9999 then raise EAbort.Create('Файл настроек поврежден!');
  end;

 Begin
  try
   Ex:=True;
   if ParamStr(1)<>'ConStr' then
    if Not (FileExists(Prm.OptFile)) then raise EAbort.Create('Файл настроек не найден!');
   IniFile:=TIniFile.Create(Prm.OptFile);
   try
    Opt.SQLProvider:=IniFile.ReadString(Prm.Prof,'SQLProvider','SQLOLEDB.1');
    Opt.StartFromApteksInfo:=False;
    if ParamStr(1)='ConStr' then
     begin
      Opt.StartFromApteksInfo:=True;
      Opt.Server:=ParamStr(2);
      Opt.Base:=ParamStr(3);
      Opt.BaseUser:=ParamStr(4);
      Opt.BasePassw:=ParamStr(5);
     end else begin
               ReadStr(Opt.Server,'ServerName');
               ReadStr(Opt.Base,'BaseName');
               ReadStr(Opt.BaseUser,'BaseUser');
               Opt.BasePassw:=IniFile.ReadString(Prm.Prof,'BasePassw','');
              end;

    //    Opt.FirmName:=IniFile.ReadString(Prm.Prof,'FirmName','ПФ "Гамма 55"');

    Opt.LoadNaklPath:=IncludeTrailingBackSlash(IniFile.ReadString(Prm.Prof,'LoadNaklPath','D:\AVA'));
    Opt.LogPath:=IncludeTrailingBackSlash(IniFile.ReadString(Prm.Prof,'LogPath','D:\AVA'));
    Opt.ServerLogPath:=IncludeTrailingBackSlash(IniFile.ReadString(Prm.Prof,'ServerLogPath','\\SERVER\AVA'));
    Opt.ServerAVAPath:=IncludeTrailingBackSlash(IniFile.ReadString(Prm.Prof,'ServerAVAPath','\\SERVER\AVA'));
    Opt.FlashPath:=IncludeTrailingBackSlash(IniFile.ReadString(Prm.Prof,'FlashPath','F:\'));

    if IsServer then
     Opt.ServerWorkPath:=IncludeTrailingBackSlash(WorkPath)
    else
     Opt.ServerWorkPath:=IncludeTrailingBackSlash(IniFile.ReadString(Prm.Prof,'ServerWorkPath','D:\EKKA_NET\WORK'));


    Opt.Camera:=IniFile.ReadInteger(Prm.Prof,'Camera',0);
    Opt.WebCamera:=IniFile.ReadInteger(Prm.Prof,'WebCamera',0);

    Opt.SMTPHost:=IniFile.ReadString(Prm.Prof,'SMTPHost','');
    Opt.SMTPPort:=IniFile.ReadInteger(Prm.Prof,'SMTPPort',25);
    Opt.EMailAddress:=IniFile.ReadString(Prm.Prof,'EMailAddress','root@gamma55.com.ua');

    Opt.CHPName:=IniFile.ReadString(Prm.Prof,'CHPName','');
    Opt.CHPIndN:=IniFile.ReadString(Prm.Prof,'CHPIndN','');
    Opt.CHPAddr:=IniFile.ReadString(Prm.Prof,'CHPAddr','');

    Opt.PrintPort:=IniFile.ReadString(Prm.Prof,'PrintPort','LPT1');

    try
     Opt.TimeZ:=StrToTime(IniFile.ReadString(Prm.Prof,'TimeZ','20:30:00'));
    except
     Opt.TimeZ:=StrToTime('20:30:00');
    end;
    if ParamStr(1)='ConStr' then Opt.KassaID:=1 else ReadInt(Opt.KassaID,'KassaID');

    EKKA.TypeEKKA:=IniFile.ReadInteger(Prm.Prof,'TypeEKKA',1);

    EKKA.PortNum:=IniFile.ReadInteger(Prm.Prof,'PortNum',1);
    EKKA.UseEKKA:=IniFile.ReadInteger(Prm.Prof,'UseEKKA',1)=1;

    Opt.PlayRolik:=IniFile.ReadInteger(Prm.Prof,'PlayRolik',0)=1;
    Opt.VolumeRolik:=IniFile.ReadInteger(Prm.Prof,'VolumeRolik',65535);

    Opt.NumPortEkran:=IniFile.ReadInteger(Prm.Prof,'NumPortEkran',1);

    Opt.IsAutoZ:=IniFile.ReadInteger(Prm.Prof,'IsAutoZ',1)=1;

    Opt.IPAddrEKKA:=IniFile.ReadString(Prm.Prof,'IPAddrEKKA','');

    if Not EKKA.fpLoadExellio then
     begin
      Application.MessageBox(PChar(EKKA.LastErrorDescr),'Работа с EKKA',48);
      Exit;
     end;

    Opt.ShowMCash:=True; //IniFile.ReadInteger(Prm.Prof,'ShowMCash',0)=1;
    Opt.ShowRegFull:=IniFile.ReadInteger(Prm.Prof,'ShowRegFull',0)=1;

    Opt.EKKAAsPrinter:=IniFile.ReadInteger(Prm.Prof,'EKKAAsPrinter',0)=1;
    Opt.EmulEKKA:=IniFile.ReadInteger(Prm.Prof,'EmulEKKA',0)=1;

    Opt.NumPortTerminal:=IniFile.ReadInteger(Prm.Prof,'NumPortTerminal',3);
    Opt.UseTerminal:=IniFile.ReadInteger(Prm.Prof,'UseTerminal',1)=1;
    Opt.BaudRateTerminal:=IniFile.ReadInteger(Prm.Prof,'BaudRateTerminal',9600);
    Opt.TcpIpAddressTerminal:=IniFile.ReadString(Prm.Prof,'TcpIpAddressTerminal','');
    Opt.TcpIpPortTerminal:=IniFile.ReadInteger(Prm.Prof,'TcpIpPortTerminal',2000);
    //TypeTerminal: byte;          //тип банковского терминала: 0: ECRCommX.ECRLibSgn; 1 - ECRCommX.BPOS1Lib/Comm; 2 - ECRCommX.BPOS1Lib/CommAuto; 3 - ECRCommX.BPOS1Lib/TCP-IP
    Opt.TypeTerminal:=IniFile.ReadInteger(Prm.Prof,'TypeTerminal',0)

   finally
    IniFile.Free;
   end;
   Ex:=False;
  except
   on E:Exception do ErrMess:='Ошибка загрузки параметров! '+E.Message;
  end;
 End; {LoadOptions}

// Инициализация опций БД
procedure TStartF.LoadBaseOptions;
var S:String;

 procedure LoadValue(V:String; var Dest:String);
  begin
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from Spr_Const (nolock) where Descr='''+V+'''';
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Abort;
   Dest:=DM.Qr.FieldByName('Value').AsString;
  end;

 procedure LoadDefValue(V:String; var Dest:String; DefValue:String);
  begin
   try
    DM.Qr.Close;
    DM.Qr.SQL.Text:='select * from Spr_Const (nolock) where Descr='''+V+'''';
    DM.Qr.Open;
    if DM.Qr.IsEmpty then Abort;
    Dest:=DM.Qr.FieldByName('Value').AsString;
   except
    Dest:=DefValue;
   end;
  end;

 Begin
  try
   Prm.IsOwnerPassw:=True;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('SET DATEFORMAT YMD');
   DM.Qr.SQL.Add('if SubString(@@version,1,26)<>''Microsoft SQL Server  2000''   ');
   DM.Qr.SQL.Add(' begin ');
   DM.Qr.SQL.Add('  use master ');
   DM.Qr.SQL.Add('  if (select Count(*) from sysobjects o (nolock)                        ');
   DM.Qr.SQL.Add('      where o.name=''xp_makecab'' and (OBJECTPROPERTY(o.id, N''IsProcedure'') = 1 or OBJECTPROPERTY(o.id, N''IsExtendedProc'') = 1 or OBJECTPROPERTY(o.id, N''IsReplProc'') = 1) and ');
   DM.Qr.SQL.Add('            o.name not like N''#%%'')<=0                                   ');
   DM.Qr.SQL.Add('   EXEC master..sp_addextendedproc N''xp_makecab'', ''D:\AVA\xprepl.dll''  ');
   DM.Qr.SQL.Add('  use apteka_net ');
   DM.Qr.SQL.Add(' end  ');
   DM.Qr.SQL.Add('if SubString(@@version,1,26)<>''Microsoft SQL Server  2000''               ');
   DM.Qr.SQL.Add(' begin ');
   DM.Qr.SQL.Add('  use master ');
   DM.Qr.SQL.Add('  if (select Count(*) from sysobjects o (nolock) ');
   DM.Qr.SQL.Add('      where o.name=''xp_unpackcab'' and (OBJECTPROPERTY(o.id, N''IsProcedure'') = 1 or OBJECTPROPERTY(o.id, N''IsExtendedProc'') = 1 or OBJECTPROPERTY(o.id, N''IsReplProc'') = 1) and ');
   DM.Qr.SQL.Add('            o.name not like N''#%%'')<=0 ');
   DM.Qr.SQL.Add('   EXEC master..sp_addextendedproc N''xp_unpackcab'', ''D:\AVA\xprepl.dll'' ');
   DM.Qr.SQL.Add('  use apteka_net ');
   DM.Qr.SQL.Add(' end  ');
   DM.Qr.ExecSQL;
  except
  end;

  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='use apteka_net select dbo.IsNewSrok() as V ';
   DM.Qr.Open;

   Prm.LoginWithOutGrafik:=False;

   Prm.IsNewSrok:=DM.Qr.FieldByname('V').AsInteger=1;

   LoadValue('ID_APTEKA',S);
   Prm.AptekaID:=StrToInt(S);
   Prm.IsKurier:=(Prm.AptekaID=240) or (Prm.AptekaID=505);

   LoadValue('AptekaName',Prm.AptekaNameUA);
   LoadValue('AptekaNameRU',Prm.AptekaNameRU);
   LoadValue('AptName',Prm.AptName);

   LoadDefValue('AptekaNameLic',Prm.AptekaNameLic,Prm.AptekaNameRU);
   LoadDefValue('PathMP3',Prm.PathMP3,'Mp3Ru');

   LoadValue('FirmID',S);
   Prm.FirmID:=StrToInt(S);

   LoadDefValue('StartTime',Prm.StartTime,'23:59:58');
   LoadDefValue('EndTime',Prm.EndTime,'23:59:59');
   LoadDefValue('CardPref',Prm.CR_BEGIN,'550');
   LoadDefValue('TimeZRep',Prm.TimeZRep,'23:45');

   LoadDefValue('ReklamaOn',Prm.ReklamaOn,'18:00:00');
   LoadDefValue('ReklamaOff',Prm.ReklamaOff,'04:00:00');

   LoadDefValue('FilterSklad',S,'0');
   Prm.FilterSklad:=StrToInt(S)=1;

   LoadDefValue('MaxCashSum',S,'500');
   Prm.MaxCashSum:=StrToCurr(S);

   LoadDefValue('OrderChek',S,'1');
   Prm.OrderChek:=StrToInt(S);

   LoadDefValue('IsAutoZ',S,'0');
   Prm.IsAutoZ:=StrToInt(S)=1;

   LoadDefValue('Save_kyboard_data',S,'0');
   Prm.save_kyboard_data:=StrToInt(S)=1;

   LoadDefValue('IsLogAll',S,'0');
   Prm.IsLogAll:=StrToInt(S)=1;

   LoadDefValue('ForceEnterCash',S,'0');
   Prm.ForceEnterCash:=StrToInt(S)=1;

   LoadDefValue('Deshevo',S,'0');
   Prm.Deshevo:=StrToInt(S)=1;

   LoadDefValue('ServerSertif',Prm.ServerSertif,'192.168.0.40');
   LoadDefValue('TimeOutReadCard',Prm.TimeOutReadCard,'1900-01-01 00:05:00');

//   LoadDefValue('IPDB',Prm.ServerDB,'192.168.0.9\sql5');
   LoadDefValue('IPDB',Prm.ServerDB,'192.168.101.36\sql2');
   LoadDefValue('IPS2014',Prm.ServerS2014,'192.168.0.11');
   LoadDefValue('ProxyAdr',Prm.ProxyAdr,'192.168.101.236:8080');

   Prm.ConStrDB:='Provider=SQLOLEDB.1; Password=ckj#ktn#djc;Persist Security Info=True; User ID=sa; Initial Catalog=ekka_net;Data Source='+Prm.ServerDB;
   Prm.ConStrS2014:='Provider=SQLOLEDB.1; Password=ckj#ktn#djc;Persist Security Info=True; User ID=sa; Initial Catalog=datafromapteks;Data Source='+Prm.ServerS2014;

   LoadDefValue('Dobraia',S,'0');
   Prm.Dobraia:=StrToInt(S)=1;


   LoadDefValue('ShowMenuIcons',S,'1');
   Prm.ShowMenuIcons:=StrToInt(S)=1;

   LoadDefValue('IsKurDostavka',S,'0');
   Prm.IsKurDostavka:=StrToInt(S)=1;

   LoadDefValue('IsSoc',S,'0');
   Prm.IsSoc:=StrToInt(S)=1;

   LoadDefValue('AdvEnterKol',S,'0');
   Prm.AdvEnterKol:=StrToInt(S)=1;

   LoadDefValue('IsScanAll',S,'0');
   Prm.IsScanAll:=StrToInt(S)=1;

   LoadDefValue('NewGrafik',S,'0');
   Prm.NewGrafik:=StrToInt(S)=1;

   LoadDefValue('GrafikUpdateNew',S,'0');
   Prm.GrafikUpdateNew:=StrToInt(S)=1;

   LoadDefValue('PeriodRep',S,'0');
   Prm.PeriodRep:=StrToInt(S)=1;

   LoadDefValue('GrafikUpdateNew1',S,'0');
   Prm.GrafikUpdateNew1:=StrToInt(S)=1;

   LoadDefValue('IsPL2Perc',S,'0');
   Prm.IsPL2Perc:=StrToInt(S)=1;

   LoadDefValue('IsOneTabInPage',S,'0');
   Prm.IsOneTabInPage:=StrToInt(S)=1;

   LoadDefValue('IsCenaZak',S,'0');
   Prm.IsCenaZak:=StrToInt(S)=1;

   LoadDefValue('OptCena',S,'0');
   Prm.OptCena:=StrToInt(S)=1;

   LoadDefValue('TerminalNew',S,'0');
   Prm.TerminalNew:=StrToInt(S)=1;

   LoadDefValue('aObl',Prm.aObl,'Харьковская');
   LoadDefValue('aRegion',Prm.aRegion,'Харьковский');

   LoadDefValue('eCity',Prm.aCity,'Харьков');
   LoadDefValue('eAdress',Prm.aAdress,'');

   LoadDefValue('Region',S,'0');
   Prm.Region:=StrToInt(S);

   LoadDefValue('ZavApteki',Prm.ZavApteki,'');
   LoadDefValue('Kurator',Prm.Kurator,'');

   LoadDefValue('VSPriznak'+IntToStr(Opt.KassaID),S,'0');
   Prm.VSPriznak:=StrToInt(S);

   LoadDefValue('VSDate'+IntToStr(Opt.KassaID),S,'0');
   Prm.VSDate:=StrToDateTime(S);

   LoadDefValue('RealizMinus',S,'0');
   Prm.RealizMinus:=StrToInt(S)=1;

   LoadDefValue('SumSkd',S,'100');
   Prm.SumSkd:=StrToCurr(S);

   LoadDefValue('MediID',S,'0');
   Prm.MediID:=StrToInt(S);

   LoadDefValue('SkdFirst',S,'0');
   Prm.SkdFirst:=StrToInt(S)=1;

   LoadDefValue('AptekaSklad',S,'0');
   Prm.AptekaSklad:=StrToInt(S)=1;

   LoadDefValue('IsLogo',S,'1');
   Prm.IsLogo:=StrToInt(S)=1;

   LoadDefValue('RollMakeFrom',S,'0');
   Prm.RollMakeFrom:=StrToInt(S)=1;

   LoadDefValue('RegCardFromSMS',S,'0');
   Prm.RegCardFromSMS:=StrToInt(S)=1;

   LoadDefValue('IsProxy',S,'1');
   Prm.IsProxy:=StrToInt(S)=1;

 {
   LoadDefValue('NoPlayRolik',S,'0');
   if StrToInt(S)=1 then Opt.PlayRolik:=False;
 }

   LoadDefValue('KolOpt',S,'999999');
   Prm.KolOpt:=StrToInt(S);

   LoadDefValue('IsNewDiscOpt',S,'0');
   Prm.IsNewDiscOpt:=StrToInt(S)=1;

   LoadDefValue('IsReplPhone',S,'0');
   Prm.IsReplPhone:=StrToInt(S)=1;

   LoadDefValue('baseurl',Prm.baseurl,'https://dealer.chmsoft.com.ua/api');
   LoadDefValue('userkey',Prm.userkey,'');

   LoadDefValue('c_code',Prm.c_code,'0000');
   LoadDefValue('c_username',Prm.c_username,'gamma2');
   LoadDefValue('c_userpass',Prm.c_userpass,'pbu5wuG88');

   LoadDefValue('eStr1',Prm.eStr1,'');
   LoadDefValue('eStr2',Prm.eStr2,'');
   LoadDefValue('eStr3',Prm.eStr3,'');
   LoadDefValue('eStr4',Prm.eStr4,'');

   LoadDefValue('AuthorizedFIO',Prm.AuthorizedFIO,'');

   //параметры подключения к АПИ Гептрал
   LoadDefValue('SiteGeptralAPI',Prm.SiteGeptralAPI,'');
   LoadDefValue('TokenGeptral',Prm.TokenGeptral,'');
   LoadDefValue('PharmCardGeptral',Prm.PharmCardGeptral,'');

   LoadDefValue('OptimaAddressID',Prm.OptimaAddressID,'');

   try
    DM.Qr.Close;
    DM.Qr.SQL.Text:='select top 1 convert(datetime,Value) as Dt from Spr_Const (nolock) where Descr=''AuthorizedDT'' ';
    DM.Qr.Open;
    Prm.AuthorizedDT:=DM.Qr.FieldByName('Dt').AsDateTime;
   except
   end;

   if Not ((Prm.AptekaSklad=True) and (Prm.Dobraia=False)) then Prm.IsNewDiscOpt:=False;

   lbName.Caption:=Prm.AptekaNameRU;

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from SprFirms (nolock) where id_firm='+IntToStr(Prm.FirmID);
   DM.Qr.Open;

   Prm.SkladAdress:=DM.Qr.FieldByName('SkladAdress').AsString;
   Prm.FirmNameRU:=DM.Qr.FieldByName('DescrRu').AsString;
   Prm.FirmNameUA:=DM.Qr.FieldByName('DescrUa').AsString;
   Prm.FullFirmNameRU:=DM.Qr.FieldByName('FullDescrRu').AsString;
   Prm.Boss:=DM.Qr.FieldByName('Boss').AsString;
   Prm.BossRod:=DM.Qr.FieldByName('BossRod').AsString;
   Prm.IsBackAll:=DM.Qr.FieldByName('BackAll').AsInteger=1;
   Prm.mfo1:=DM.Qr.FieldByName('mfo1').AsString;
   Prm.r_r1:=DM.Qr.FieldByName('r_r1').AsString;

   if DM.Qr.FieldByName('Nds').AsString='' then Prm.NDS:=True
                                           else Prm.NDS:=DM.Qr.FieldByName('Nds').AsInteger=1;

   if Prm.IsLogo then
    Prm.IsLogo:=DM.Qr.FieldByName('IsLogo').AsInteger=1;

   LoadDefValue('KoefZakaz',S,'15');
   Prm.KoefZakaz:=StrToInt(S);

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select Min(Skd) as MinSkd, Max(Skd) as MaxSkd from Skd where type_skd=1';
   DM.Qr.Open;
   Prm.MinSkd:=DM.Qr.FieldByName('MinSkd').AsInteger;
   Prm.MaxSkd:=DM.Qr.FieldByName('MaxSkd').AsInteger;

   DM.Qr.Close;
   DM.Qr.SQL.Text:='SELECT SERVERPROPERTY(''MachineName'') as Sn';
   DM.Qr.Open;

//   ShowMessage(DM.Qr.FieldByName('Sn').AsString);

   Prm.ServerKompName:=DM.Qr.FieldByName('Sn').AsString;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('declare @IsNight tinyint');
   DM.Qr.SQL.Add('exec spY_CheckIsNight @IsNight output');
   DM.Qr.SQL.Add('select @IsNight as IsNight');
   DM.Qr.Open;
   Prm.IsNightCena:=DM.Qr.FieldByName('IsNight').AsInteger=1;

   Ex:=False;
  except
   Ex:=True;
   ErrMess:='Ошибка загрузки параметров базы!'
  end;
 End; {LoadBaseOptions}

// Инициализация Web камеры
procedure TStartF.InitWebCam;
 begin
  if Opt.WebCamera<>1 then Exit;
  try
   // Открываем ссесию видеонаблюдения
   hWndC:=capCreateCaptureWindowA('My Own Capture Window',
                                   WS_CHILD or WS_VISIBLE,
                                   Panel2.Left+pnWebCam.Left+1,
                                   Panel2.Top+pnWebCam.Top+1,
                                   pnWebCam.Width,
                                   pnWebCam.Height,
                                   Handle,0);
   if hWndC<>0 then
    begin
     SendMessage(hWndC,WM_CAP_DRIVER_CONNECT,0,0);
     SendMessage(hWndC,WM_CAP_DRIVER_CONNECT,0,0);
     SendMessage(hWndC,WM_CAP_SET_SCALE,1,0);
     SendMessage(hWndC,WM_CAP_SET_PREVIEWRATE,10,0);
     SendMessage(hWndC,WM_CAP_SET_PREVIEW,1,0);
    end;
   Panel2.Visible:=True;
   pnWebCam.Visible:=True;
  except
  end;
 end; {InitWebCam}
 
// Загрузка списка пользователей
procedure TStartF.PrepareUserList(P:Byte; P1:Byte);
var i:Integer;
    S:String;
    ss,ss1:String;
 begin
  try
   if P=0 then Ex:=True;

   if CheckBox1.Checked then ss:=' and id_role='+IntToStr(R_PROVIZ)
                        else ss:=' and id_role<>'+IntToStr(R_PROVIZ);

   if CheckBox2.Checked then ss1:=' and (id_type=17 or id_dolgn in (307,318,375)) '
                        else ss1:=' and id_type<>17 ';

   if (ParamStr(1)='/v') or (ParamStr(1)='/V') then
    S:='select * from SprUser (nolock) where reserve=0 and (id_role=0 or id_type in (select id_type from SprTypeUser (nolock) where CanLogin=1)) and id_role='+IntToStr(R_DISP)+' order by Users'
   else
    S:='select * from SprUser (nolock) where reserve=0 and (id_role=0 or id_type in (select id_type from SprTypeUser(nolock) where CanLogin=1)) and id_role<>'+IntToStr(R_DISP)+ss+ss1+' order by Users';

   if CheckBox3.Checked=False then
    S:='exec spY_SetUsersState '+IntToStr(P1)+#10+S
   else
    S:='exec spY_SetUsersState '+IntToStr(P1)+',1'+#10+S;

   if OpenADOSQL(DM.Qr,S)>0 then
    begin
     //DM.Qr.SQL.SaveToFile('c:\log\SprUser.txt');
     SetLength(FuList,0);
     SetLength(FuList,DM.Qr.RecordCount);
     ComboBox1.Clear;
     for i:=1 to DM.Qr.RecordCount do
      begin
       if i=1 then DM.Qr.First else DM.Qr.Next;
       ComboBox1.Items.Add(TrimRight(DM.Qr.FieldBYName('Users').AsString));
       Fulist[i-1]:=DM.Qr.FieldBYName('ID').AsInteger;
      end;
     ComboBox1.ItemIndex:=0;
    end;
   DM.Qr.Close;
   if P=0 then Ex:=False;
  except
   on E:Exception do
    begin
     ErrMess:='Ошибка формирования списка пользователей!';
     ShowMessage(ErrMess+' '+E.Message);
    end;
  end;
 end; {PrepareUserList}

// Показ заставки
procedure TStartF.FormShow(Sender:TObject);
 begin
  if FShowLogon then
   try
    LogoF:=TLogoF.Create(Self);
    try
     LogoF.Timer1.Enabled:=True;
     Application.ProcessMessages;
     LogoF.ShowModal;
    finally
     LogoF.Free;
    end;
   except
   end;
 end; {FormShow}

// Кнопка Закрыть 
procedure TStartF.BitBtn2Click(Sender:TObject);
 begin
  CloseWebCam;
  Close;
 end; {BitBtn2Click}

// Нажатие Enter в поле ввода пароля
procedure TStartF.MaskEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key=VK_RETURN then BitBtn1Click(Nil);
 end; {MaskEdit1KeyDown}

// Закрывает видео-сессию
procedure TStartF.CloseWebCam;
 begin
  if Opt.WebCamera<>1 then Exit;
  try
   if hWndC<>0 then
    begin
     SendMessage(hWndC,WM_CAP_DRIVER_DISCONNECT,0,0);
     hWndC:=0;
    end;
  except
  end;
 end; {CloseWebCam}

// Сохраняет кадр съемки
procedure TStartF.SnapShot;
var FN:String;
 begin
  if Opt.WebCamera<>1 then Exit;
  try
   // Записываем картинку видеонаблюдения
   FN:=WorkPath+'\Register\'+Prm.UserName+'_'+FormatDateTime('ddmmyyyy',Date)+'_'+FormatDateTime('hhnnss',Time);
   ForceDirectories(WorkPath+'\Register\');
   SendMessage(hWndC,WM_CAP_SAVEDIB,0,Longint(Pchar(FN+'.bmp')));
   CloseWebCam;
   if Not FileExists(FN+'.bmp') then Abort;
  except
   AppendStringToFile(FN+'.txt','Ошибка записи кадра.');
  end;
 end; {SnapShot}

// Процесс авторизации: проверка имени пароля пользователя
procedure TStartF.BitBtn1Click(Sender:TObject);
var isFree:Boolean;
    Mes:String;
    ForceEnter:Boolean;
    Res:String;
 begin
  try
   BitBtn1.Enabled:=False;
   MaskEdit1.Enabled:=False;
   ComboBox1.Enabled:=False;
   CheckBox1.Enabled:=False;
   CheckBox2.Enabled:=False;
   Panel1.Enabled:=False;
   try
   // if OpenADOSQL(DM.Qr,'select *,IsNull(DtEnd,getdate()+10) as DtEnds from SPRUSER (nolock) where reserve=0 and Users='''+ComboBox1.Text+'''')<=0 then raise EAbort.Create('');
    DM.Qr.Close;
    DM.Qr.SQL.Clear;
    DM.Qr.SQL.Add('select *,case when convert(datetime,convert(varchar,getdate(),23))<DtStart then 0   ');
    DM.Qr.SQL.Add('              when convert(datetime,convert(varchar,getdate(),23))>IsNull(DtEnd,getdate()+10) then 1 else 2 end as CanWork, ');
    DM.Qr.SQL.Add('       case when id_dolgn in (select v.id_employee_position from vEmployeeKurator v) then 1 else 0 end IsKurator');
    DM.Qr.SQL.Add('from SprUser (nolock)');
    DM.Qr.SQL.Add('where id='+IntToStr(FuList[ComboBox1.ItemIndex]));
//   DM.Qr.SQL.SaveToFile('C:\Passw.txt');
    DM.Qr.Open;
    if DM.Qr.IsEmpty then raise EAbort.Create('Сотрудник '+ComboBox1.Text+' отсутствует в справочнике сотрудников!');
    if (AnsiUpperCase(GetCompName)<>'SERGEY') and (FileExists(PrPath+'\PC_EKKA.dsg')=False) then
     begin
      Case DM.Qr.Fieldbyname('CanWork').AsInteger of
       0:begin
          Application.MessageBox(PChar('Сотрудник '+ComboBox1.Text+' может зайти в программу не ранее '+DateToStr(DM.Qr.Fieldbyname('DtStart').AsDateTime)),'Работа с ЕККА',48);
          Exit;
         end;
       1:begin
          Application.MessageBox(PChar('C '+DateToStr(DM.Qr.Fieldbyname('DtStart').AsDateTime)+' сотрудник '+ComboBox1.Text+' не может заходить в прогамму!'),'Работа с ЕККА',48);
          Exit;
         end;
      end;
     end;
    Prm.IsEnterVideoPassw:=False;
    ForceEnter:=False;
    Prm.ID_Gamma:=DM.Qr.FieldByName('ID_GAMMA').AsInteger;

    if (TrimRight(MaskEdit1.Text)<>TrimRight(DM.Qr.FieldByName('Passw').AsString)) and (TrimRight(MaskEdit1.Text)<>GetUserSpicPassw) then raise EAbort.Create('Пароль набран неверно!');

    if TrimRight(MaskEdit1.Text)=GetUserSpicPassw then
     begin
      ForceEnter:=True;
      Prm.IsEnterVideoPassw:=True;
     end;

    isFree:=False;
    if DM.Qr.FieldByName('Flag_OK').AsInteger<>0 then
     begin
      if ExecADOSQL(DM.QrEx,'update SprUser set flag_ok=0 where reserve=0 and Users='''+ComboBox1.Text+'''')<0 then raise EAbort.Create('');
      Label4.Caption:='Ожидайте идет подключение...';
      Application.ProcessMessages;
      Delay(10);
      Label4.Caption:='';
      DM.Qr.Close; DM.Qr.Open;
      if DM.Qr.RecordCount>0 then
       if DM.Qr.FieldByName('Flag_OK').AsInteger=0 then isFree:=True;
     end else isFree:=True;

    if isFree then // Если пароль проверен и каталог пользователя свободен
     begin

      Prm.Login:=Trim(DM.Qr.FieldBYName('Login').AsString);
      Prm.Passw:=Trim(DM.Qr.FieldBYName('Passw').AsString);
      Prm.UserName:=Trim(DM.Qr.FieldBYName('Users').AsString);
      Prm.UserID:=DM.Qr.FieldByName('ID').AsInteger;
      Prm.UserRole:=DM.Qr.FieldByName('id_role').AsInteger;
      Prm.IsZav:=(DM.Qr.FieldByName('id_role').AsInteger=4) and (DM.Qr.FieldByName('IsZam').AsInteger=0);
      Prm.IsKurator:=DM.Qr.FieldByName('IsKurator').AsInteger=1;
      Prm.IsKuratorApt:=Prm.IsKurator and (DM.Qr.FieldByName('id_type').AsInteger<>17);

      Prm.SafeUserRole:=Prm.UserRole;
      if Prm.Login=''then
       begin
        Prm.Login:=TranslitStr(Prm.UserName);
        DM.QrEx.Close;
        DM.QrEx.SQL.Text:='update SprUser set Login='''+Prm.Login+''' where id='+IntToStr(Prm.UserID);
        DM.QrEx.ExecSQL;
       end;
      try
       DM.ADOCo.Connected:=False;
       DM.ADOCo.ConnectionString:='Provider='+Opt.SQLProvider+';Password='+Prm.Passw+';'+
                                           'Persist Security Info=True;'+
                                           'User ID='+Prm.Login+';'+
                                           'Initial Catalog='+Opt.Base+';'+
                                           'Data Source='+Opt.Server;
       DM.ADOCo.Connected:=True;

       DM.ADOLog.Connected:=False;
       DM.ADOLog.ConnectionString:=DM.ADOCo.ConnectionString;
       DM.ADOLog.Connected:=True;
      except
       on E:Exception do
        try
         DM.QrEx.Close;
         DM.QrEx.ConnectionString:='Provider='+Opt.SQLProvider+';Password='+Opt.BasePassw+';'+
                                   'Persist Security Info=True;'+
                                   'User ID='+Opt.BaseUser+';'+
                                   'Initial Catalog='+Opt.Base+';'+
                                   'Data Source='+Opt.Server;
         DM.QrEx.SQL.Clear;
 //        DM.QrEx.SQL.Add('exec sp_droplogin '''+Prm.Login+''' ');
{
         DM.QrEx.SQL.Add('if (select Count(*) from master..syslogins (nolock) where name='''+Prm.Login+''')>0 ');
         DM.QrEx.SQL.Add(' exec sp_droplogin '''+Prm.Login+''' ');

         DM.QrEx.SQL.Add('exec sp_addlogin '''+Prm.Login+''' , '''+Prm.Passw+''' ');
         DM.QrEx.SQL.Add('exec sp_addsrvrolemember '''+Prm.Login+''', sysadmin ');
}
         DM.QrEx.SQL.Add('exec spY_CreateLogin '''+Prm.Login+''','''+Prm.Passw+'''');
         DM.QrEx.SQL.Add('select 999 as res');
//         DM.QrEx.SQL.SaveToFile('C:\Login.txt');
         DM.QrEx.Open;
         if DM.QrEx.FieldByName('res').AsInteger<>999 then Abort;
         DM.QrEx.Close;
         DM.QrEx.Connection:=DM.ADOCo;
         DM.ADOCo.Connected:=False;
         DM.ADOCo.Connected:=True;
        except
         on E:Exception do
          begin
           Application.MessageBox(PChar('Ошибка подлючения к базе аптеки: '+E.Message),'Работа с ЕККА',48);
           Exit;
          end;
        end;

      end;

   if (Prm.IsKurator=False) and
         (ForceEnter=False) and
         (Prm.ID_Gamma<>1)  and
         (FileExists(PrPath+'\pc_ekka.dsg')=False) and
         (Opt.Server<>'192.168.0.15') and
         (AnsiUpperCase(GetCompName)<>'SERGEY') and
         (AnsiUpperCase(Copy(Opt.Server,1,8))<>'TEST_SQL') and
         (AnsiUpperCase(Copy(Opt.Server,1,13))<>'192.168.0.186') and
         (AnsiUpperCase(Copy(Opt.Server,1,9))<>'MARINENKO') and
         (AnsiUpperCase(Copy(Opt.Server,1,13))<>'10.35.238.100') and
         (AnsiUpperCase(Copy(Opt.Server,1,13))<>'10.44.4.17') and
         (Prm.UserRole<>R_DISP) then
        begin

         DM.Qr.Close;
         DM.Qr.SQL.Clear;
         DM.Qr.SQL.Add('select top 1 id_daily_operation ');
         DM.Qr.SQL.Add('from inform..e_daily_journal (nolock)');
         DM.Qr.SQL.Add('where id_employee='+IntToStr(Prm.ID_Gamma));
         DM.Qr.SQL.Add('order by daily_operation_time desc, id desc ');
//         DM.Qr.SQL.SaveToFile('C:\Login0.txt');
         DM.Qr.Open;
         if (DM.Qr.IsEmpty) or (DM.Qr.FieldByName('id_daily_operation').AsInteger=2) then
          Mes:='Вы не зарегистрировали приход на работу через сканер пальцев!'#10+'Если у вас действительно не сканируются пальцы звоните в офис оператору видеонаблюдения и вам сообщат единоразовый пароль для входа в программу!'
         else begin
          DM.Qr.Close;
          DM.Qr.SQL.Text:='select id_state from inform..e_daily_journal (nolock) where id_daily_operation=1 and daily_operation_time>convert(datetime,convert(varchar,getdate(),23)) and id_employee='+IntToStr(Prm.ID_Gamma)+' order by id_state desc';
          DM.Qr.Open;
          if DM.Qr.IsEmpty then
           begin
            DM.Qr.Close;
            DM.Qr.SQL.Clear;
            DM.Qr.SQL.Add('declare @dt datetime, @idu int');
            DM.Qr.SQL.Add('set @dt='''+FormatDateTime('yyyy-mm-dd',StartOfTheWeek(Date))+''' ');
            DM.Qr.SQL.Add('set @idu='+IntToStr(Prm.UserID));

            DM.Qr.SQL.Add(' if @dt<convert(datetime,convert(varchar,getdate(),23))');
            DM.Qr.SQL.Add('  begin ');
            DM.Qr.SQL.Add('   select id_state ');
            DM.Qr.SQL.Add('   from inform..e_daily_journal (nolock)');
            DM.Qr.SQL.Add('   where id_daily_operation=1 and daily_operation_time>convert(datetime,convert(varchar,getdate()-1,23)) and id_employee='+IntToStr(Prm.ID_Gamma));
            DM.Qr.SQL.Add('          and id not in (select id_parent from inform..e_daily_journal (nolock))          ');
            DM.Qr.SQL.Add('          and (select Count(*)   ');
            DM.Qr.SQL.Add('               from Inform..DhGrafik h (nolock), ');
            DM.Qr.SQL.Add('                    Inform..DtGrafik t (nolock) ');
            DM.Qr.SQL.Add('                where h.idtab=t.idtab and h.dtstart=@dt and t.id_user=@idu and dbo.CheckIntervDN(d'+IntToStr(DayOfTheWeek(Date-1))+'1)=1)>0 ');
            DM.Qr.SQL.Add('  end else ');
            DM.Qr.SQL.Add('  begin ');
            DM.Qr.SQL.Add('   select id_state ');
            DM.Qr.SQL.Add('   from inform..e_daily_journal (nolock) ');
            DM.Qr.SQL.Add('   where id_daily_operation=1 and daily_operation_time>convert(datetime,convert(varchar,getdate()-1,23)) and id_employee='+IntToStr(Prm.ID_Gamma));
            DM.Qr.SQL.Add('          and id not in (select id_parent from inform..e_daily_journal (nolock))          ');
            DM.Qr.SQL.Add('          and (select Count(*)   ');
            DM.Qr.SQL.Add('               from Inform..DhGrafik h (nolock), ');
            DM.Qr.SQL.Add('                    Inform..DtGrafik t (nolock)  ');
            DM.Qr.SQL.Add('                where h.idtab=t.idtab and h.dtend=@dt-1 and t.id_user=@idu and dbo.CheckIntervDN(d71)=1 )>0 ');
            DM.Qr.SQL.Add('  end ');

//           DM.Qr.SQL.Text:='select id_state from inform..e_daily_journal where id_daily_operation=1 and daily_operation_time>convert(datetime,convert(varchar,getdate(),23)) and id_employee='+IntToStr(Prm.ID_Gamma);
//           DM.Qr.SQL.SaveToFile('C:\Login.txt');

            DM.Qr.Open;
           end;
          if DM.Qr.IsEmpty then Mes:='Вы не зарегистрировали приход на работу через сканер пальцев!'#10+'Если у вас действительно не сканируются пальцы звоните в офис оператору видеонаблюдения и вам сообщат единоразовый пароль для входа в программу!' else
         end;

         if (Mes='') and (Prm.GrafikUpdateNew1) then
          begin
           DM.Qr.Close;
           DM.Qr.SQL.Clear;
           DM.Qr.SQL.Add('declare @Res int, @DtLate datetime');
           DM.Qr.SQL.Add('exec spY_LateComer_ '+IntToStr(Prm.ID_Gamma)+',@Res output, @DtLate output');
           DM.Qr.SQL.Add('select @Res as Res, @DtLate as DtLate');
           DM.Qr.Open;

           if DM.Qr.FieldByName('Res').AsInteger<>778 then
            Case DM.Qr.FieldByName('Res').AsInteger of
             -1:Mes:='Вы не зарегистрировали приход на работу через сканер пальцев!'#10+'Если у вас действительно не сканируются пальцы звоните в офис оператору видеонаблюдения и вам сообщат единоразовый пароль для входа в программу!';
             -2:begin
                 Mes:='';
                 // 'У Вас нет смен по графику'+#10+'Обращайтесь в отдел видеонаблюдения для получения единоразового пароля для входа в программу.';
                 Prm.LoginWithOutGrafik:=True;
                end;
             -3:begin
                 Mes:='';
                 Application.MessageBox(PChar('У Вас есть опоздание на '+FormatDateTime('hh:nn:ss',DM.Qr.FieldByName('DtLate').AsDateTime)+#10+
                                        '. Возможно у вас неправильно составлен график. Для входа в программу просто нажмите "ОК", в видеонаблюдение звонить НЕ НУЖНО!'),'Работа с EKKA',48);
                end;
            end;
          end;
         if Mes<>'' then
          begin
           CheckLoginF:=TCheckLoginF.Create(Self);
           try
            CheckLoginF.Label1.Caption:=Mes;
            Application.ProcessMessages;
            CheckLoginF.ShowModal;
            if CheckLoginF.Flag<>1 then Exit;
            Prm.IsOwnerPassw:=CheckLoginF.IsOwnerPassw;
            Prm.IsEnterVideoPassw:=True;
           finally
            CheckLoginF.Free;
           end;
          end;
        end;

      // Регистрируем приход
      if (Prm.IsEnterVideoPassw=True) and (Prm.IsOwnerPassw=True) then
       begin
        DM.Qr.Close;
        DM.Qr.SQL.Clear;
        DM.Qr.SQL.Add('declare @Res smallint, @SError varchar(8000) ');
        DM.Qr.SQL.Add('if object_id(''tempdb..#res'') is not null drop table #res');
        DM.Qr.SQL.Add('select top 0 convert(int,0) as res into #res');
        DM.Qr.SQL.Add('insert into #res');
        DM.Qr.SQL.Add('exec spY_RegisterEnterExit '+IntToStr(Prm.ID_Gamma)+',2,@Res output, @SError output');
        DM.Qr.SQL.Add('if @SError<>'''' raiserror(@SError,16,1) ');
        DM.Qr.SQL.Add('select @Res as Res');
        DM.Qr.Open;
       end;

      Ex:=False;
      SnapShot;

      if Prm.UserRole<>R_ADMIN then
       begin
        WelComeF:=TWelComeF.Create(Self);
        try
         Application.ProcessMessages;
         WelComeF.ShowModal;
        finally
         WelComeF.Free;
        end;
       end;
      // Показ поздравительной открытки 2017
      if {(Prm.UserRole<>R_ADMIN) and} (Date=StrToDate('15.09.18'))   then
       begin
        OtkritkaF:=TOtkritkaF.Create(Self);
        try
         Application.ProcessMessages;
         OtkritkaF.ShowModal;
        finally
         OtkritkaF.Free;
        end;
       end;

      // if Prm.AptekaID in [185,116] then
       begin
        MainF:=TMainF.Create(Self);
        try
         Visible:=False;
         Application.ProcessMessages;
         MainF.ShowModal;
        finally
         MainF.Free;
        end;
       end;

      Close;

     end else Application.MessageBox('Каталог пользователя занят!','Работа с ЕККА',48);
   except
    on E:Exception do
     begin
      Application.MessageBox(PChar(E.Message),'Работа с ЕККА',48);
      MaskEdit1.Enabled:=True;
      MaskEdit1.Text:='';
      MaskEdit1.SetFocus;
     end;
   end;
  finally
   BitBtn1.Enabled:=True;
   MaskEdit1.Enabled:=True;
   ComboBox1.Enabled:=True;
   CheckBox1.Enabled:=True;
   CheckBox2.Enabled:=True;
   Panel1.Enabled:=True;
  end
 end; {BitBtn1Click}

// Загрузка главной формы
procedure TStartF.LoadMainForm;
 begin
  Exit;
  if Prm.AptekaID=185 then Exit;

  MainF:=TMainF.Create(Self); // Создаем "главную" форму
  if MainF.Ex then // Если Create прошел неудачно...
   begin
    MainF.MessBox(ErrMess); // Выводим сообщение об ошибке
    MainF.Close;            // Закрываем форму
   end else begin  // Если все ОК
             MainF.Show; // Показываем "главную" форму
             SetAsMainForm(MainF); // Делаем главную форму действительно главной
            end;

 end; {LoadMainForm}

// Закрытие формы
procedure TStartF.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  try
   if Ex=False then // Если Стартовая форма не закрывается...
     LoadMainForm
    else
     DM.ADOCo.Connected:=False; // Покидаем программу...
  except
  end;

 end; {FormClose}

// Activate формы
procedure TStartF.FormActivate(Sender: TObject);
 begin
  CheckBox3.Visible:=FileExists(PrPath+'\PC_EKKA.dsg');
  if Ex then
   begin
    Application.MessageBox(PChar(ErrMess),'Регистрация продаж',48);
    Close;
    Exit;
   end;
  Ex:=True;
  MaskEdit1.SetFocus;
 end; {FormActivate}

// Выбор из спика пользователей мышью
procedure TStartF.ComboBox1Click(Sender: TObject);
 begin
  if Not (ComboBox1.DroppedDown) then MaskEdit1.SetFocus();
 end; {ComboBox1Click}

// Выбор из списка пользователей нажатием Enter
procedure TStartF.ComboBox1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if (Key=VK_RETURN) then MaskEdit1.SetFocus();
 end; {ComboBox1KeyDown}

// Открытие списка пользователей при входе в ComboBox1
procedure TStartF.ComboBox1Enter(Sender:TObject);
 begin
  if Not (ComboBox1.DroppedDown) then ComboBox1.DroppedDown:=True;
 end; {ComboBox1Enter}

// Нажатие "неродной" кнопки открытия списка, так как родная ведет себя по-свински при описаном обработчике OnEnter 
procedure TStartF.SpeedButton1Click(Sender: TObject);
 begin
  ComboBox1.SetFocus;
  ComboBox1.DroppedDown:=True;
 end; {SpeedButton1Click}

procedure TStartF.acShowUsersExecute(Sender: TObject);
var ss,S:String;
    i:Integer;
 begin
  S:='';
  ss:='1';
  if CheckBox1.Checked then ss:='0';
  try
   DM.qrUserList.Close;
   DM.qrUserList.SQL.Text:='exec spY_UserList '+ss;
   DM.qrUserList.Open;

   UserListF:=TUserListF.Create(Self);
   try
    UserListF.ShowModal;
   finally
    UserListF.Free;
   end;
  except
  end;
 end;

procedure TStartF.CheckBox1Click(Sender:TObject);
 begin
  if CheckBox1.Checked then CheckBox2.Checked:=False;
  PrepareUserList(1,0);
 end;

procedure TStartF.ComboBox1KeyPress(Sender:TObject; var Key:Char);
 begin
  Key:=#0;
 end;

procedure TStartF.CheckBox2Click(Sender:TObject);
 begin
  if CheckBox2.Checked then CheckBox1.Checked:=False;
  PrepareUserList(1,1);
 end;

procedure TStartF.CheckBox3Click(Sender: TObject);
 begin
  PrepareUserList(0,0);
 end;

end.


