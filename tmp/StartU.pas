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

  private

    FEx:Boolean;        // ����: ���� ������� - ���������� ���������
    hWndC:THandle;
    FParamStr:String;
    FuList:Array of Integer;
    FShowLogon:Boolean; // ������� ������ ��������

    procedure LoadColors;
    procedure LoadOptions;      // �������� �������� ���������
    procedure LoadBaseOptions;  // �������� �������� ����
    procedure InitWebCam;       // ������������� Web-������
    procedure SnapShot;         // ��������� ���� ������
    procedure CloseWebCam;      // ��������� �����-������
    procedure LoadMainForm;
    procedure CheckServieNotInServer;

    function  GetProf:String;

    property Ex:Boolean read FEx write FEx; // ��������: ���� ������� - ���������� ���������

  public

    procedure PrepareUserList(P:Byte=0); // �������� ������ �������������

    property ShowLogon:Boolean read FShowLogon write FShowLogon;

  end;

  var StartF:TStartF;


implementation

uses LogoU, DataModuleU, MainU, CheckLoginU;

{$R *.dfm}

// Create �����
procedure TStartF.FormCreate(Sender:TObject);
 begin
  try
   FParamStr:=ParamStr(1);
   DM.ADOCo.Connected:=False;
   FShowLogon:=True; // ����� ���/���� ������ ��������
   FEx:=True;
   Prm.PrPath:=ExtractFileDir(Application.ExeName);
   Prm.OptFile:=ChangeFileExt(Application.ExeName,'.ini');
   Prm.ColorFile:=WorkPath+'\ColorSet.dat';
   Prm.Prof:=GetProf;
   LoadColors;
   LoadOptions;
   InitWebCam;
   if FEx then Abort;
   DM.ADOCo.ConnectionString:='Provider='+Opt.SQLProvider+';Password='+Opt.BasePassw+';'+
                                       'Persist Security Info=True;'+
                                       'User ID='+Opt.BaseUser+';'+
                                       'Initial Catalog='+Opt.Base+';'+
                                       'Data Source='+Opt.Server;
   try
    DM.ADOCo.Connected:=True;
   except
    on E:Exception do
     begin
//      ShowMessage(E.Message);
      DM.QrSt.ConnectionString:='Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Data Source='+Opt.Server;

      DM.QrSt.SQL.Text:='exec master.dbo.sp_password @new=NULL, @loginame='''+Opt.BaseUser+''' ';
      DM.QrSt.ExecSQL;
      DM.ADOCo.Connected:=True;
     end;
   end;

   DM.ADOX.ConnectionString:=DM.ADOCo.ConnectionString;
   LoadBaseOptions;
   CheckServieNotInServer;
   PrepareUserList;
   if FEx then Abort;
   FEx:=False;

   {if Copy(FParamStr,1,2)<>'U_' then
    begin
     LoadMainForm;
    end;}

  except
   on E:EAbort do Ex:=True else
    begin
     ErrMess:='������ ����������� � ���� ������!'; Ex:=True;
    end;
  end;
 end; {FormCreate}

procedure TStartF.CheckServieNotInServer;
 begin
  try
   if Prm.AptekaID=241 then Exit;
   if AnsiUpperCase(GetCompName)=AnsiUpperCase(Prm.ServerKompName) then Exit;
   if AnsiUpperCase(GetCompName)='SERGEY' then Exit;

   WinExec(PAnsiChar('cmd /c sc stop UnloadDataFromApteks'), SW_HIDE);
   WinExec(PAnsiChar('cmd /c sc config UnloadDataFromApteks start= disabled'), SW_HIDE);
  except
  end;
 end;

// ������������� ����� �������� � ���-�����
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

// �������� �������� �������
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

// �������� �������� �� ini - �����
procedure TStartF.LoadOptions;
var IniFile:TIniFile;

 procedure ReadStr(var S:String; V:String);
  begin
   S:=IniFile.ReadString(Prm.Prof,V,'');
   if S='' then raise EAbort.Create('���� �������� ���������!');
  end;

 procedure ReadInt(var I:Integer; V:String);
  begin
   I:=IniFile.ReadInteger(Prm.Prof,V,-9999);
   if I=-9999 then raise EAbort.Create('���� �������� ���������!');
  end;

 Begin
  try
   Ex:=True;
   if Not (FileExists(Prm.OptFile)) then raise EAbort.Create('���� �������� �� ������!');
   IniFile:=TIniFile.Create(Prm.OptFile);
   try
    Opt.SQLProvider:=IniFile.ReadString(Prm.Prof,'SQLProvider','SQLOLEDB.1');

    ReadStr(Opt.Server,'ServerName');
    ReadStr(Opt.Base,'BaseName');
    ReadStr(Opt.BaseUser,'BaseUser');
//    Opt.FirmName:=IniFile.ReadString(Prm.Prof,'FirmName','�� "����� 55"');

    Opt.LoadNaklPath:=IncludeTrailingBackSlash(IniFile.ReadString(Prm.Prof,'LoadNaklPath','D:\AVA'));
    Opt.LogPath:=IncludeTrailingBackSlash(IniFile.ReadString(Prm.Prof,'LogPath','D:\AVA'));
    Opt.ServerLogPath:=IncludeTrailingBackSlash(IniFile.ReadString(Prm.Prof,'ServerLogPath','\\SERVER\AVA'));
    Opt.FlashPath:=IncludeTrailingBackSlash(IniFile.ReadString(Prm.Prof,'FlashPath','F:\'));

    if IsServer then
     Opt.ServerWorkPath:=IncludeTrailingBackSlash(WorkPath)
    else
     Opt.ServerWorkPath:=IncludeTrailingBackSlash(IniFile.ReadString(Prm.Prof,'ServerWorkPath','D:\EKKA_NET\WORK'));

    Opt.BasePassw:=IniFile.ReadString(Prm.Prof,'BasePassw','');
    Opt.Camera:=IniFile.ReadInteger(Prm.Prof,'Camera',0);
    Opt.WebCamera:=IniFile.ReadInteger(Prm.Prof,'WebCamera',0);

    Opt.SMTPHost:=IniFile.ReadString(Prm.Prof,'SMTPHost','');
    Opt.SMTPPort:=IniFile.ReadInteger(Prm.Prof,'SMTPPort',25);
    Opt.EMailAddress:=IniFile.ReadString(Prm.Prof,'EMailAddress','root@gamma55.com.ua');

    Opt.CHPName:=IniFile.ReadString(Prm.Prof,'CHPName','');
    Opt.CHPIndN:=IniFile.ReadString(Prm.Prof,'CHPIndN','');
    Opt.CHPAddr:=IniFile.ReadString(Prm.Prof,'CHPAddr','');
//    Opt.ConStr\Mess:=IniFile.ReadString(Prm.Prof,'ConStrMess','Provider=SQLOLEDB.1; Password=ckj#ktn#djc;Persist Security Info=True; User ID=admin; Initial Catalog=BMESS;Data Source=192.168.0.9\SQL5');

    Opt.ConStrMess:=     IniFile.ReadString(Prm.Prof,'ConStrMess','Provider=SQLOLEDB.1; Password=ckj#ktn#djc;Persist Security Info=True; User ID=admin; Initial Catalog=ekka_net;Data Source=192.168.0.9\SQL5');
    Opt.ConStrMessS2014:=IniFile.ReadString(Prm.Prof,'ConStrMess','Provider=SQLOLEDB.1; Password=ckj#ktn#djc;Persist Security Info=True; User ID=sa; Initial Catalog=datafromapteks;Data Source=192.168.0.11');

//    Opt.ConStrMess:='Provider=SQLOLEDB.1; Password=ckj#ktn#djc;Persist Security Info=True; User ID=admin; Initial Catalog=BMESS;Data Source=192.168.0.9\SQL5';

    Opt.PrintPort:=IniFile.ReadString(Prm.Prof,'PrintPort','LPT1');

    try
     Opt.TimeZ:=StrToTime(IniFile.ReadString(Prm.Prof,'TimeZ','20:30:00'));
    except
     Opt.TimeZ:=StrToTime('20:30:00');
    end;
    ReadInt(Opt.KassaID,'KassaID');

    EKKA.TypeEKKA:=IniFile.ReadInteger(Prm.Prof,'TypeEKKA',1);
    EKKA.PortNum:=IniFile.ReadInteger(Prm.Prof,'PortNum',1);
    EKKA.UseEKKA:=IniFile.ReadInteger(Prm.Prof,'UseEKKA',1)=1;
    if Not EKKA.fpLoadExellio then
     begin
      Application.MessageBox(PChar(EKKA.LastErrorDescr),'������ � EKKA',48);
      Exit;
     end;

    Opt.ShowMCash:=IniFile.ReadInteger(Prm.Prof,'ShowMCash',0)=1;
    Opt.ShowRegFull:=IniFile.ReadInteger(Prm.Prof,'ShowRegFull',0)=1;
    Opt.EKKAAsPrinter:=IniFile.ReadInteger(Prm.Prof,'EKKAAsPrinter',0)=1;

    Opt.NumPortTerminal:=IniFile.ReadInteger(Prm.Prof,'NumPortTerminal',3);
    Opt.UseTerminal:=IniFile.ReadInteger(Prm.Prof,'UseTerminal',1)=1;

   finally
    IniFile.Free;
   end;
   Ex:=False;
  except
   on E:Exception do ErrMess:='������ �������� ����������! '+E.Message;
  end;
 End; {LoadOptions}

// ������������� ����� ��
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
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
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
   DM.Qr.SQL.Text:='use apteka_net';
   DM.Qr.ExecSQL;

   LoadValue('ID_APTEKA',S);
   Prm.AptekaID:=StrToInt(S);
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

   LoadDefValue('ServerDB',Prm.ServerDB,'192.168.0.9\SQL5');
   LoadDefValue('ServerDB',Prm.ServerSertif,'192.168.0.40');
   LoadDefValue('ServerDB',Prm.TimeOutReadCard,'1900-01-01 00:05:00');


   LoadDefValue('Dobraia',S,'0');
   Prm.Dobraia:=StrToInt(S)=1;

   LoadDefValue('AdvEnterKol',S,'0');
   Prm.AdvEnterKol:=StrToInt(S)=1;

   LoadDefValue('IsScanAll',S,'0');
   Prm.IsScanAll:=StrToInt(S)=1;

   LoadDefValue('NewGrafik',S,'0');
   Prm.NewGrafik:=StrToInt(S)=1;


   LoadDefValue('aObl',Prm.aObl,'�����������');
   LoadDefValue('aRegion',Prm.aRegion,'�����������');
   LoadDefValue('eCity',Prm.aCity,'�������');
   LoadDefValue('eAdress',Prm.aAdress,'');

   LoadDefValue('ZavApteki',Prm.ZavApteki,'');

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

   Prm.NDS:=DM.Qr.FieldByName('Nds').AsInteger=1;

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
   Prm.ServerKompName:=DM.Qr.FieldByName('Sn').AsString;
   Ex:=False;
  except
   Ex:=True;
   ErrMess:='������ �������� ���������� ����!'
  end;
 End; {LoadBaseOptions}

// ������������� Web ������
procedure TStartF.InitWebCam;
 begin
  if Opt.WebCamera<>1 then Exit;
  try
   // ��������� ������ ���������������
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
 
// �������� ������ �������������
procedure TStartF.PrepareUserList(P:Byte=0);
var i:Integer;
    S:String;
    ss:String;
 begin
  try
   if P=0 then Ex:=True;
   if CheckBox1.Checked then ss:=''
                        else ss:=' and id_role<>'+IntToStr(R_PROVIZ);

   if (ParamStr(1)='/v') or (ParamStr(1)='/V') then
    S:='select * from SprUser (nolock) where reserve=0 and (id_role=0 or id_type in (select id_type from SprTypeUser (nolock) where CanLogin=1)) and id_role='+IntToStr(R_DISP)+' order by Users'
   else
    S:='select * from SprUser (nolock) where reserve=0 and (id_role=0 or id_type in (select id_type from SprTypeUser(nolock) where CanLogin=1)) and id_role<>'+IntToStr(R_DISP)+ss+' order by Users';

   S:='exec spY_SetUsersState '#10+S;
   if OpenADOSQL(DM.Qr,S)>0 then
    begin
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
   ErrMess:='������ ������������ ������ �������������!'
  end;
 end; {PrepareUserList}

// ����� ��������
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

// ������ ������� 
procedure TStartF.BitBtn2Click(Sender:TObject);
 begin
  CloseWebCam;
  Close;
 end; {BitBtn2Click}

// ������� Enter � ���� ����� ������
procedure TStartF.MaskEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key=VK_RETURN then BitBtn1Click(Nil);
 end; {MaskEdit1KeyDown}

// ��������� �����-������
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

// ��������� ���� ������
procedure TStartF.SnapShot;
var FN:String;
 begin
  if Opt.WebCamera<>1 then Exit;
  try
   // ���������� �������� ���������������
   FN:=WorkPath+'\Register\'+Prm.UserName+'_'+FormatDateTime('ddmmyyyy',Date)+'_'+FormatDateTime('hhnnss',Time);
   ForceDirectories(WorkPath+'\Register\');
   SendMessage(hWndC,WM_CAP_SAVEDIB,0,Longint(Pchar(FN+'.bmp')));
   CloseWebCam;
   if Not FileExists(FN+'.bmp') then Abort;
  except
   AppendStringToFile(FN+'.txt','������ ������ �����.');
  end;
 end; {SnapShot}

// ������� �����������: �������� ����� ������ ������������
procedure TStartF.BitBtn1Click(Sender:TObject);
var isFree:Boolean;
    Mes:String;
 begin
  try
   BitBtn1.Enabled:=False;
   MaskEdit1.Enabled:=False;
   ComboBox1.Enabled:=False;
   CheckBox1.Enabled:=False;
   Panel1.Enabled:=False;
   try
   // if OpenADOSQL(DM.Qr,'select *,IsNull(DtEnd,getdate()+10) as DtEnds from SPRUSER (nolock) where reserve=0 and Users='''+ComboBox1.Text+'''')<=0 then raise EAbort.Create('');
    DM.Qr.Close;
    DM.Qr.SQL.Clear;
    DM.Qr.SQL.Add('select *,case when convert(datetime,convert(varchar,getdate(),23))<DtStart then 0   ');
    DM.Qr.SQL.Add('              when convert(datetime,convert(varchar,getdate(),23))>IsNull(DtEnd,getdate()+10) then 1 else 2 end as CanWork ');
    DM.Qr.SQL.Add('from SprUser (nolock)');
    DM.Qr.SQL.Add('where id='+IntToStr(FuList[ComboBox1.ItemIndex]));
    DM.Qr.SQL.SaveToFile('C:\Passw.txt');
    DM.Qr.Open;
    if DM.Qr.IsEmpty then raise EAbort.Create('��������� '+ComboBox1.Text+' ����������� � ����������� �����������!');
    Case DM.Qr.Fieldbyname('CanWork').AsInteger of
     0:begin
        Application.MessageBox(PChar('��������� '+ComboBox1.Text+' ����� ����� � ��������� �� ����� '+DateToStr(DM.Qr.Fieldbyname('DtStart').AsDateTime)),'������ � ����',48);
        Exit;
       end;
     1:begin
        Application.MessageBox(PChar('C '+DateToStr(DM.Qr.Fieldbyname('DtStart').AsDateTime)+' ��������� '+ComboBox1.Text+' �� ����� �������� � ��������!'),'������ � ����',48);
        Exit;
       end;
    end;

    if TrimRight(MaskEdit1.Text)<>TrimRight(DM.Qr.FieldByName('Passw').AsString) then raise EAbort.Create('������ ������ �������!');

    isFree:=False;
    if DM.Qr.FieldByName('Flag_OK').AsInteger<>0 then
     begin
      if ExecADOSQL(DM.QrEx,'update SprUser set flag_ok=0 where reserve=0 and Users='''+ComboBox1.Text+'''')<0 then raise EAbort.Create('');
      Label4.Caption:='�������� ���� �����������...';
      Application.ProcessMessages;
      Delay(10);
      Label4.Caption:='';
      DM.Qr.Close; DM.Qr.Open;
      if DM.Qr.RecordCount>0 then
       if DM.Qr.FieldByName('Flag_OK').AsInteger=0 then isFree:=True;
     end else isFree:=True;

    if isFree then // ���� ������ �������� � ������� ������������ ��������
     begin
      Prm.Login:=Trim(DM.Qr.FieldBYName('Login').AsString);
      Prm.Passw:=Trim(DM.Qr.FieldBYName('Passw').AsString);
      Prm.UserName:=Trim(DM.Qr.FieldBYName('Users').AsString);
      Prm.UserID:=DM.Qr.FieldByName('ID').AsInteger;
      Prm.ID_Gamma:=DM.Qr.FieldByName('ID_GAMMA').AsInteger;
      Prm.UserRole:=DM.Qr.FieldByName('id_role').AsInteger;
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
      except
       on E:Exception do
        try
//         if Pos('ogin failed for user',E.Message)=0 then Abort;
         DM.QrEx.Close;
         DM.QrEx.ConnectionString:='Provider='+Opt.SQLProvider+';Password='+Opt.BasePassw+';'+
                                   'Persist Security Info=True;'+
                                   'User ID='+Opt.BaseUser+';'+
                                   'Initial Catalog='+Opt.Base+';'+
                                   'Data Source='+Opt.Server;
         DM.QrEx.SQL.Clear;
 //        DM.QrEx.SQL.Add('exec sp_droplogin '''+Prm.Login+''' ');

         DM.QrEx.SQL.Add('if (select Count(*) from master..syslogins (nolock) where name='''+Prm.Login+''')>0 ');
         DM.QrEx.SQL.Add(' exec sp_droplogin '''+Prm.Login+''' ');
         DM.QrEx.SQL.Add('exec sp_addlogin '''+Prm.Login+''' , '''+Prm.Passw+''' ');
         DM.QrEx.SQL.Add('exec sp_addsrvrolemember '''+Prm.Login+''', sysadmin ');

         DM.QrEx.SQL.Add('select 999 as res');
         DM.QrEx.SQL.SaveToFile('C:\Login.txt');
         DM.QrEx.Open;
         if DM.QrEx.FieldByName('res').AsInteger<>999 then Abort;
         DM.QrEx.Close;
         DM.QrEx.Connection:=DM.ADOCo;
         DM.ADOCo.Connected:=False;
         DM.ADOCo.Connected:=True;
        except
         on E:Exception do
          begin
           Application.MessageBox(PChar('������ ���������� � ���� ������: '+E.Message),'������ � ����',48);
           Exit;
          end;
        end;

      end;

//      if (Prm.ID_Gamma<>1)  and (FileExists(PrPath+'\pc_ekka.dsg')=False) and (Opt.Server<>'192.168.0.15') and (AnsiUpperCase(GetCompName)<>'SERGEY') and (AnsiUpperCase(Copy(Opt.Server,1,8))<>'TEST_SQL') and (AnsiUpperCase(Copy(Opt.Server,1,13))<>'192.168.0.186') then
       if Prm.FirmID<>5 then
        begin

 {
         DM.Qr.Close;
         DM.Qr.SQL.Text:='select id_state from inform..e_daily_journal (nolock) where id_daily_operation=1 and daily_operation_time>convert(datetime,convert(varchar,getdate(),23)) and id_employee='+IntToStr(Prm.ID_Gamma)+' order by id_state desc';
         DM.Qr.Open;
 }

         DM.Qr.Close;
         DM.Qr.SQL.Clear;

{
         DM.Qr.SQL.Add('select id_daily_operation,id_state ');
         DM.Qr.SQL.Add('from inform..e_daily_journal (nolock) ');
         DM.Qr.SQL.Add('where --id_daily_operation=1 and ');
         DM.Qr.SQL.Add('      daily_operation_time>convert(datetime,convert(varchar,getdate(),23)) and ');
         DM.Qr.SQL.Add('      id_employee='+IntToStr(Prm.ID_Gamma) );
         DM.Qr.SQL.Add('order by 1 desc ');
}
         DM.Qr.SQL.Add('select top 1 id_daily_operation ');
         DM.Qr.SQL.Add('from inform..e_daily_journal (nolock)');
         DM.Qr.SQL.Add('where id_employee=1'+IntToStr(Prm.ID_Gamma));
         DM.Qr.SQL.Add('order by daily_operation_time desc');
         DM.Qr.Open;

         Mes:='';
         if DM.Qr.FieldByName('id_daily_operation').AsInteger=2 then
          begin
           Mes:='�� �� ���������������� ������ �� ������ ����� ������ �������!'#10+'���� � ��� ������������� �� ����������� ������ ������� � ���� ��������� ��������������� � ��� ������� ������������ ������ ��� ����� � ���������!';
          end else
         if (DM.Qr.IsEmpty) or (DM.Qr.FieldByName('id_daily_operation').AsInteger=1) then
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
           DM.Qr.SQL.SaveToFile('C:\Login.txt');

           DM.Qr.Open;
           if (DM.Qr.IsEmpty) then Mes:='�� �� ���������������� ������ �� ������ ����� ������ �������!'#10+'���� � ��� ������������� �� ����������� ������ ������� � ���� ��������� ��������������� � ��� ������� ������������ ������ ��� ����� � ���������!';
          end;


{
         if DM.Qr.FieldByName('id_state').AsInteger=0 then Mes:='�� ���������������� ���� ������ �� ������ ��� ������������� ����� ����� ����������! ���������� ���������������� ������ �� ������ ����� ���� �����!'#10+
                                                                '���� � ��� ������������� �� ����������� ������ ������� � ���� ��������� ��������������� � ��� ������� ������������ ������ ��� ����� � ���������!';
}
         if Mes<>'' then
          begin
           CheckLoginF:=TCheckLoginF.Create(Self);
           try
            CheckLoginF.Label1.Caption:=Mes;
            Application.ProcessMessages;
            CheckLoginF.ShowModal;
            if CheckLoginF.Flag<>1 then Exit;
           finally
            CheckLoginF.Free;
           end;
          end;
        end;

      Ex:=False;
      SnapShot;

      // if Prm.AptekaID in [185,116] then
       begin
        MainF:=TMainF.Create(Self);
        try
         Visible:=False;
         MainF.ShowModal;
        finally
         MainF.Free;
        end;
       end;

      Close;

     end else Application.MessageBox('������� ������������ �����!','������ � ����',48);


   except
    on E:Exception do
     begin
      Application.MessageBox(PChar(E.Message),'������ � ����',48);
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
   Panel1.Enabled:=True;
  end
 end; {BitBtn1Click}

// �������� ������� �����
procedure TStartF.LoadMainForm;
 begin
  Exit;
  if Prm.AptekaID=185 then Exit;

  MainF:=TMainF.Create(Self); // ������� "�������" �����
  if MainF.Ex then // ���� Create ������ ��������...
   begin
    MainF.MessBox(ErrMess); // ������� ��������� �� ������
    MainF.Close;            // ��������� �����
   end else begin  // ���� ��� ��
             MainF.Show; // ���������� "�������" �����
             SetAsMainForm(MainF); // ������ ������� ����� ������������� �������
            end;

 end; {LoadMainForm}

// �������� �����
procedure TStartF.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  try
   if Ex=False then // ���� ��������� ����� �� �����������...
     LoadMainForm
    else
     DM.ADOCo.Connected:=False; // �������� ���������...
  except
  end;

 end; {FormClose}

// Activate �����
procedure TStartF.FormActivate(Sender: TObject);
 begin
  if Ex then
   begin
    Application.MessageBox(PChar(ErrMess),'����������� ������',48);
    Close;
    Exit;
   end;
  Ex:=True;
  MaskEdit1.SetFocus;
 end; {FormActivate}

// ����� �� ����� ������������� �����
procedure TStartF.ComboBox1Click(Sender: TObject);
 begin
  if Not (ComboBox1.DroppedDown) then MaskEdit1.SetFocus();
 end; {ComboBox1Click}

// ����� �� ������ ������������� �������� Enter
procedure TStartF.ComboBox1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if (Key=VK_RETURN) then MaskEdit1.SetFocus();
 end; {ComboBox1KeyDown}

// �������� ������ ������������� ��� ����� � ComboBox1
procedure TStartF.ComboBox1Enter(Sender:TObject);
 begin
  if Not (ComboBox1.DroppedDown) then ComboBox1.DroppedDown:=True;
 end; {ComboBox1Enter}

// ������� "��������" ������ �������� ������, ��� ��� ������ ����� ���� ��-������� ��� �������� ����������� OnEnter 
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
  ss:=' and id_role<>2';
  if CheckBox1.Checked then ss:='';
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from SprUser (nolock) where reserve<>1 '+ss+' order by Users';
   DM.Qr.Open;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     S:=S+TrimRight(DM.Qr.FieldByName('Users').AsString)+' - '+DM.Qr.FieldByName('Passw').AsString+#10;
    end;
  except
  end;
  Application.MessageBox(PChar(S),PChar(MFC),64);
 end;

procedure TStartF.CheckBox1Click(Sender: TObject);
 begin
  PrepareUserList(1);
 end;

procedure TStartF.ComboBox1KeyPress(Sender: TObject; var Key: Char);
 begin
  Key:=#0;
 end;

end.






