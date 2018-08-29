Unit ExecCommU;

Interface

Uses Windows, Dialogs, Messages, Classes, SysUtils, Util, ADODB, Forms;

Type TExecComm=class(TObject)
     private

       FQrEx:TADOQuery;
       FQr:TADOQuery;
       FLastError:String;
       FCommTbName:String;
       FCommResTbName:String;
       FLastID:Integer;
       FKassaID:Integer;

       function CheckCommName(S:String):Boolean;

     public

       constructor Create; virtual;
       destructor Destroy; override;

       procedure Clear; // Удаляет из таблиц COMMAND и COMMRESULT выполненые команды с признаком Done=2

       { --- Отсылка команды на удаленный сервер для выполнения ---}
       function ecSendCommand(Comm:String;     // Команда с параметрами
                              Owner:String;    // Имя приложения, которое будет выполнять команду
                              ID_KASSA:Integer // Номер кассы, приложение которой будет выполнять команду
                             ):Boolean;

       {--- Выполнение одной самой старой невыполненой команды ---}
       procedure ecExecComm(Command:String);

       property Qr:TADOQuery read FQr;                                         // "Запрос" для "внутренних" нужд
       property QrEx:TADOQuery read FQrEx;                                     // "Запрос" для отсылки и приема результатов команд
       property CommTbName:String read FCommTbName write FCommTbName;          // Имя журнала регистрации команд
       property CommResTbName:String read FCommResTbName write FCommResTbName; // Имя журнала результатов выполнения команд
       property LastError:String read FLastError write FLastError;             // Последняя ошибка при выполнения-отсылки команды
       property LastID:Integer read FLastID write FLastID;                     // Последняя успешно отправленая команда
       property KassaID:Integer read FKassaID write FKassaID;                  // Номер кассы (компьютера)

     end;

Function ExecComm:TExecComm;

Implementation

uses MainU, Marry301U;

{--- Список допустимых команд (длина имени команды 5 символов) ---}
const aListComm:Array[1..4] of String=(
                                       'ARHBS', // Архивация базы
                                       'LGOFF', // Смена текущего сеанса Windows
                                       'CLOSE', // Закрытие текущего приложения
                                       'GCCAS'  // Запрос информации о движении средств по кассе
                                       );

var FExecComm:TExecComm=nil;

function ExecComm:TExecComm;
 begin
  if FExecComm=nil then FExecComm:=TExecComm.Create;
  Result:=FExecComm;
 end;

{ TExecComm }

function TExecComm.CheckCommName(S:String):Boolean;
var i:Integer;
 begin
  try
   for i:=Low(aListComm) to High(aListComm) do
    begin
     if S=aListComm[i] then Break;
     if i=High(aListComm) then Abort;
    end; 
   Result:=True;
  except
   Result:=False;
  end;
 end;

procedure TExecComm.Clear;
 begin
  try
   Qr.Close;
   Qr.SQL.Clear;
   Qr.SQL.Add('delete from '+FCommResTbName+' where id in (select id from '+FCommTbName+' where Done=2)');
   Qr.SQL.Add('delete from '+FCommTbName+' where Done=2');
   Qr.ExecSQL;
  except
   on E:Exception do FLastError:=E.Message;
  end;
 end;

constructor TExecComm.Create;
 begin
  FQrEx:=TADOQuery.Create(nil);
  FQrEx.CommandTimeout:=200;
  FQr:=TADOQuery.Create(nil);
  FQr.Connection:=nil;
  FQr.CommandTimeout:=200;
  FLastError:='';
  FCommTbName:='COMMAND';
  FCommResTbName:='COMMRESULT';
  FKassaID:=1;
 end;

destructor TExecComm.Destroy;
 begin
  FQr.Free;
  FQrEx.Free;
  inherited;
 end;

procedure TExecComm.ecExecComm(Command:String);
var i,ID:Integer;
    IsExit,CanDel:Boolean;
    SQL,FN,Param:String;

 function StrToDT(S:String):TDateTime;
  begin
   if S<>'' then Result:=StrToDateTime(S) else Result:=Now()-100;
  end;

 Begin
  try
   IsExit:=False;
   CanDel:=False;
   FLastError:='';
   Qr.Close;
   Qr.SQL.Text:='select top 1 * from '+FCommTbName+' where done=0 and Left(Comm,5)='''+Command+''' order by id';
   Qr.Open;
   if Qr.IsEmpty then Exit;
   if Qr.FieldByName('ID_KASSA').AsInteger<>KassaID then Exit;
   if AnsiUpperCase(Qr.FieldByName('OWNER').AsString)<>AnsiUpperCase(ExtractFileName(Application.ExeName)) then Exit;
   ID:=Qr.FieldByName('ID').AsInteger;
   Param:=Copy(Qr.FieldByName('Comm').AsString,6,255);
   if Qr.Connection<>nil then Qr.Connection.BeginTrans;
   try
    if Command='CLOSE' then
     begin
      CanDel:=True;
      if Now<StrToDT(Param) then raise EAbort.Create('');
      MainF.MessBox('По техническим причинам программа может быть закрыта. Откройте программу заново!');
      IsExit:=True;
     end else
    if Command='GCCAS' then
     begin
      if Not Marry301.fpCashState(0) then EAbort.Create(Marry301.LastErrorDescr);
      Qr.Close;
      Qr.SQL.Text:='delete from '+FCommResTbName+' where id='+IntToStr(ID);
      Qr.ExecSQL;
      for i:=0 to 7 do
       begin
        Qr.Close;
        Qr.SQL.Clear;
        Qr.SQL.Add('insert into '+FCommResTbName+'(ID,ORDERC,RREAL,RDATE)');
        Qr.SQL.Add('values('+IntToStr(ID)+','+IntToStr(i+1)+','+CurrToStr(StrToInt(Marry301.RD_Item[i])*0.01)+',getdate())');
        Qr.ExecSQL;
       end;
     end;
    if (Command='ULOAD') and (FileExists(PrPath+'\rar.exe')) then
     begin
      FN:=FormatDateTime('dd.mm.yy',Date);
      DelDir(WorkPath+'\Arh\'+FN+'\');
      ForceDirectories(WorkPath+'\Arh\'+FN+'\');
      MainF.UnLoadFiles(WorkPath+'\Arh\'+FN+'\');
      DeleteFile(WorkPath+'\Arh\'+FN+'.zip');
      Qr.Close;
      SQL:='exec master..xp_cmdshell '''+PrPath+'\rar.exe a -ep '+WorkPath+'\Arh\'+FN+'.zip '+WorkPath+'\Arh\'+FN+'\''';
      Qr.SQL.Text:=SQL;
      Qr.ExecSQL;
     end;
    Qr.Close;
    if CanDel then
     Qr.SQL.Text:='delete from '+FCommTbName+' where id='+IntToStr(ID)
    else
     Qr.SQL.Text:='update '+FCommTbName+' set done=1 where id='+IntToStr(ID);
    Qr.ExecSQL;
    if Qr.Connection<>nil then Qr.Connection.CommitTrans;
    if IsExit then MainF.Close;
   except
    if Qr.Connection<>nil then Qr.Connection.RollbackTrans;
    raise;
   end;
  except
   on E:Exception do FLastError:=E.Message;
  end;
 End;

function TExecComm.ecSendCommand(Comm:String; Owner:String; ID_KASSA:Integer):Boolean;
 begin
  try
   FLastError:='';
   if Length(Comm)>255 then raise EAbort.Create('Размер команды выходит за границы диапазона!');
   if Not CheckCommName(Copy(Comm,1,5)) then raise EAbort.Create('Недопустимая комманда!');
   FQrEx.Close;
   FQrEx.SQL.Clear;
   FQrEx.SQL.Add('declare @mid int');
   FQrEx.SQL.Add('set @mid=IsNull((select Max(id) from '+FCommTbName+'),0)+1');
   FQrEx.SQL.Add('Insert into '+FCommTbName+'(ID,SOURCE,COMM,OWNER,ID_KASSA,DONE)');
   FQrEx.SQL.Add('Values(@mid,'''+GetLocalIP+''','''+Comm+''','''+Owner+''','+IntToStr(ID_KASSA)+',0)');
   FQrEx.SQL.Add('select @mid as idc');
   FQrEx.Open;
   LastID:=FQrEx.FieldByName('idc').AsInteger;
   Result:=True;
  except
   on E:Exception do
    begin
     Result:=False;
     FLastError:=E.Message;
    end;
  end;
 end;

Initialization

Finalization

End.
