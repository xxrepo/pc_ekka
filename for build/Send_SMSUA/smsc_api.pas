// SMSC.UA API для Delphi (smsc.ua) версия 3.2 (31.01.2017)
unit smsc_api;

interface

uses IdHTTP, IdURI, IdMessage, IdSMTP, IdStrings, IdGlobal, IdGlobalProtocols, StrUtils, SysUtils,
     Classes, DateUtils, Types, Windows, IdMultipartFormData;

var
	SMSC_POST: Boolean = False;				// использовать метод POST

const
	// Константы с параметрами отправки
//	SMSC_LOGIN: String = 'login';			// логин клиента
//	SMSC_PASSWORD: String = 'password';		// пароль
	SMSC_CHARSET: String =	{$IFDEF UNICODE}// кодировка сообщения (utf-8 или koi8-r), по умолчанию используется windows-1251
							'utf-8'
							{$ELSE}
							'windows-1251'
							{$ENDIF};
	SMSC_DEBUG: Boolean = False;			// флаг отладки

	// Константы для отправки SMS по SMTP
	SMTP_FROM: String = 'api@smsc.ua';		// e-mail адрес отправителя
	SMTP_SERVER: String = 'send.smsc.ua';	// адрес smtp сервера
	SMTP_LOGIN: String = '';				// логин для smtp сервера
	SMTP_PASSWORD: String = '';				// пароль для smtp сервера

type
	SMSC = class
  private
    FLogin   : String ;    // логин клиента
    FPassword : String;		// пароль

	public
     D2Res: array of TStringDynArray;
		// Общедоступные методы класса SMSС
		function send_sms(phones: String; mes: String; translit: Integer = 0; time: String = ''; id: Integer = 0; format: Integer = 0; sender: String = ''; query: String = ''; files: TStringList = nil): TStringDynArray;
		procedure send_sms_mail(phones: String; mes: String; translit: Integer = 0; time: String = ''; id: Integer = 0; format: Integer = 0; senderid: String = '');
		function get_sms_cost(phones: String; mes: String; translit: Integer = 0; format: Integer = 0; sender: String = ''; query: String = ''): TStringDynArray;
		function get_status(id: String; phone: String; all: Integer = 0): TStringDynArray;
		function get_balance: String;

    property Login : string read FLogin write FLogin;
    property Password : string read FPassword write FPassword;
    constructor Create(aLogin, aPassword : string);
	private
		// Приватные методы класса SMSС
		function _smsc_send_cmd(cmd: String; arg: String; files: TStringList = nil): TStringDynArray;
		function _urlencode(str: String): String;
		procedure _print_debug(str: String);
		function _ifs(cond: Boolean; val1: String; val2: String): String;
	end;

var
	formats: array[0..9] of String = ('', 'flash=1', 'push=1', 'hlr=1', 'bin=1', 'bin=2', 'ping=1', 'mms=1', 'mail=1', 'call=1');

implementation

// Метод отправки SMS
//
// обязательные параметры:
//
// phones - список телефонов через запятую или точку с запятой
// mes - отправляемое сообщение
//
// необязательные параметры:
//
// translit - переводить или нет в транслит
// time - необходимое время доставки в виде строки (DDMMYYhhmm, h1-h2, 0ts, +m)
// id - идентификатор сообщения. Представляет собой 32-битное число в диапазоне от 1 до 2147483647.
// format - формат сообщения (0 - обычное sms, 1 - flash-sms, 2 - wap-push, 3 - hlr, 4 - bin, 5 - bin-hex, 6 - ping-sms, 7 - mms, 8 - mail, 9 - call)
// sender - имя отправителя (Sender ID). Для отключения Sender ID по умолчанию необходимо в качестве имени
// передать пустую строку или точку.
// query - строка дополнительных параметров, добавляемая в URL-запрос ('valid=01:00&maxsms=3')
// files - массив путей к файлам при отправке mms или e-mail сообщений
//
// возвращает массив (<id>, <количество sms>, <стоимость>, <баланс>) в случае успешной отправки
// либо (<id>, -<код ошибки>) в случае ошибки

function SMSC.send_sms(phones: String;
                       mes: String;
                       translit: Integer = 0;
                       time: String = '';
                       id: Integer = 0;
                       format: Integer = 0;
                       sender: String = '';
                       query: String = '';
                       files: TStringList = nil): TStringDynArray;
begin
    if files <> nil then
        SMSC_POST := true;

	Result := _smsc_send_cmd('send', 'cost=3&phones=' + _urlencode(phones) + '&mes=' + _urlencode(mes) + '&id=' + IntToStr(id) + '&translit=' + IntToStr(translit) +
							_ifs(format > 0, '&' + formats[format], '') + _ifs(sender <> '', '&sender=' + _urlencode(sender), '') + _ifs(time <> '', '&time=' +
                            _urlencode(time), '') + _ifs(query <> '', '&' + query, ''), files);

	// (id, cnt, cost, balance) или (id, -error)

	if SMSC_DEBUG then
		if StrToInt(Result[1]) > 0 then
			_print_debug('Сообщение отправлено успешно. ID: ' + Result[0] + ', всего SMS: ' + Result[1]
						+ ', стоимость: ' + Result[2] + ', баланс: ' + Result[3])
		else
			_print_debug('Ошибка №' + Result[1][2] + ', ID: ' + Result[0]);
end;

// SMTP версия метода отправки SMS

procedure SMSC.send_sms_mail(phones: String; mes: String; translit: Integer = 0; time: String = ''; id: Integer = 0; format: Integer = 0; senderid: String = '');
var
	msg: TIdMessage;
begin
	msg := TIdMessage.Create(nil);

	with TIdSMTP.Create(nil) do
	begin
		Port := 25;
		Host := SMTP_SERVER;

   		if SMTP_LOGIN <> '' then
        begin
			Username := SMTP_LOGIN;
			Password := SMTP_PASSWORD;
        end;

		msg.Recipients.EMailAddresses := 'send@send.smsc.ua';
		msg.From.Address := SMTP_FROM;
		msg.ContentType := 'text/plain';
		msg.CharSet := SMSC_CHARSET;
		SysLocale.PriLangID := LANG_SYSTEM_DEFAULT; // если не поставить, то Indy будет оборачивать в koi8-r заголовки
		msg.Body.Add({SMSC_LOGIN}Login + ':' + {SMSC_PASSWORD} Password + ':' + IntToStr(id) + ':' + time + ':' + IntToStr(translit) + ',' + IntToStr(format) + ',' + senderid + ':' + phones + ':' + mes);

		Connect;
		Send(msg);
		Disconnect;
		Destroy;
	end;

	msg.Destroy;
end;

// Метод получения стоимости SMS
//
// обязательные параметры:
//
// phones - список телефонов через запятую или точку с запятой
// message - отправляемое сообщение
//
// необязательные параметры:
//
// translit - переводить или нет в транслит
// format - формат сообщения (0 - обычное sms, 1 - flash-sms, 2 - wap-push, 3 - hlr, 4 - bin, 5 - bin-hex, 6 - ping-sms, 7 - mms, 8 - mail, 9 - call)
// sender - имя отправителя (Sender ID)
// query - строка дополнительных параметров, добавляемая в URL-запрос ('list=79999999999:Ваш пароль: 123'#13#10 + '78888888888:Ваш пароль: 456')
//
// возвращает массив (<стоимость>, <количество sms>) либо (0, -<код ошибки>) в случае ошибки

function SMSC.get_sms_cost(phones: String; mes: String; translit: Integer = 0; format: Integer = 0; sender: String = ''; query: String = ''): TStringDynArray;
begin
	Result := _smsc_send_cmd('send', 'cost=1&phones=' + _urlencode(phones) + '&mes=' + _urlencode(mes) + '&translit=' + IntToStr(translit) +
							_ifs(format > 0, '&' + formats[format], '') + _ifs(sender <> '', '&sender=' + _urlencode(sender), '') + _ifs(query <> '', '&' + query, ''));

	// (cost, cnt) или (0, -error)

	if SMSC_DEBUG then
		if StrToInt(Result[1]) > 0 then
			_print_debug('Стоимость рассылки: ' + Result[0] + '. Всего SMS: ' + Result[1])
		else
			_print_debug('Ошибка №' + Result[1][2]);
end;

// Метод проверки статуса отправленного SMS или HLR-запроса
//
// id - ID cообщения или список ID через запятую
// phone - номер телефона или список номеров через запятую
// all - вернуть все данные отправленного SMS, включая текст сообщения (0,1 или 2)
//
// возвращает массив (для множественного запроса возвращается массив с единственным элементом, равным 1. В этом случае статусы сохраняются в
//					двумерном динамическом массиве класса D2Res):
//
// для одиночного SMS-сообщения:
// (<статус>, <время изменения>, <код ошибки доставки>)
//
// для HLR-запроса:
// (<статус>, <время изменения>, <код ошибки sms>, <код IMSI SIM-карты>, <номер сервис-центра>, <код страны регистрации>, <код оператора>,
// <название страны регистрации>, <название оператора>, <название роуминговой страны>, <название роумингового оператора>)
//
// при all = 1 дополнительно возвращаются элементы в конце массива:
// (<время отправки>, <номер телефона>, <стоимость>, <sender id>, <название статуса>, <текст сообщения>)
//
// при all = 2 дополнительно возвращаются элементы <страна>, <оператор> и <регион>
//
// при множественном запросе (данные по статусам сохраняются в двумерном массиве D2Res):
// если all = 0, то для каждого сообщения или HLR-запроса дополнительно возвращается <ID сообщения> и <номер телефона>
//
// если all = 1 или all = 2, то в ответ добавляется <ID сообщения>
//
// либо массив (0, -<код ошибки>) в случае ошибки

function SMSC.get_status(id: String; phone: String; all: Integer = 0): TStringDynArray;
var
	ans: String;
	TZInfo: TIME_ZONE_INFORMATION;
	i, idx: Integer;
begin

	Result := _smsc_send_cmd('status', 'phone=' + _urlencode(phone) + '&id=' + _urlencode(id) + '&all=' + IntToStr(all));

	// (status, time, err, ...) или (0, -error)

    if Pos(',', id) = 0 then
    begin
        if SMSC_DEBUG then
            if (Result[1] <> '') and (StrToInt(Result[1]) >= 0) then
            begin
                ans := 'Статус SMS = ' + Result[0];
                GetTimeZoneInformation(TZInfo);

                if StrToInt(Result[1]) > 0 then
                    ans := ans + ', время изменения статуса - ' + DateTimeToStr(UnixToDateTime(StrToInt64(Result[1]) - TZInfo.Bias * 60));

                _print_debug(ans);
            end
            else
                _print_debug('Ошибка №' + Result[1][2]);

		idx := StrToInt(_ifs(all = 1, '9', '12'));

        if (all > 0) and (Length(Result) > idx) and ((Length(Result) < idx + 5) or (Result[idx + 5] <> 'HLR')) then
        begin
            ans := '';

            for i := 0 to Length(Result) - 1 do
                ans := ans + Result[i] + _ifs(i = Length(Result) - 1, '', ',');

            SetLength(Result, idx);
            for i := 0 to idx - 2 do
                IdStrings.SplitString(ans, ',', Result[i], ans);

            Result[idx - 1] := ans;
        end;
    end
    else
    begin
        if (Length(Result) = 1) and (Pos('-', Result[0]) = 3) then
            Result := StrUtils.SplitString(Result[0], ',')
        else
        begin
            SetLength(D2Res, 0);
            SetLength(D2Res, Length(Result));

            for i := 0 to Length(D2Res) - 1 do
                D2Res[i] := StrUtils.SplitString(Result[i], ',');

            SetLength(Result, 1);
            Result[0] := '1';
        end;
    end;
end;

// Метод получения баланса
//
// без параметров
//
// возвращает баланс в виде строки или пустую строку в случае ошибки

constructor SMSC.Create(aLogin, aPassword: string);
begin
  fLogin := aLogin;
  fPassword := aPassword;
end;

function SMSC.get_balance: String;
var
	bal: TStringDynArray;
begin
	bal := _smsc_send_cmd('balance', ''); // (balance) или (0, -error)

	if SMSC_DEBUG then
		if Length(bal) = 1 then
			_print_debug('Сумма на счете: ' + bal[0])
		else
			_print_debug('Ошибка №' + bal[1][2]);

	if Length(bal) = 1 then
		Result := bal[0]
	else
		Result := '';
end;

// ПРИВАТНЫЕ МЕТОДЫ
//
// Метод вызова запроса. Формирует URL и делает 3 попытки чтения

function SMSC._smsc_send_cmd(cmd: String; arg: String; files: TStringList = nil): TStringDynArray;
var
	par: TIdMultiPartFormDataStream;
    params: TStringDynArray;
	aurl, _aurl, s, delim, VLeft, VRight: String;
	cnt, i: Integer;
    pf: TIdFormDataField;

begin
	arg := 'login=' + _urlencode({SMSC_LOGIN} Login) + '&psw=' + _urlencode({SMSC_PASSWORD} Password) + '&fmt=1&charset=' + SMSC_CHARSET + '&' + arg;
	aurl := 'http://smsc.ua/sys/' + cmd + '.php';
    _aurl := aurl;

	with TIdHTTP.Create(nil) do
	begin
		cnt := 0;

		repeat
			if cnt > 0 then
				aurl := StringReplace(_aurl, 'smsc.ua', 'www' + IntToStr(cnt) + '.smsc.ua', [rfReplaceAll])
            else
                Inc(cnt);

			try
				if SMSC_POST then
				begin
                    par := TIdMultiPartFormDataStream.Create;

                    for i := 1 to files.Count do
                        par.AddFile('File' + IntToStr(i), files.Strings[i-1], 'application/octet-stream');

                    params := StrUtils.SplitString(arg, '&');

                    for i := 1 to Length(params) do
                    begin
                        IdStrings.SplitString(params[i-1], '=', VLeft, VRight);
                        pf := par.AddFormField(VLeft, VRight);
                        pf.Charset := SMSC_CHARSET;
                        pf.ContentTransfer := 'binary';
                    end;

                    s := Post(aurl, par);

					par.Destroy;
				end
				else
			  		s := Get(aurl + '?' + arg);
			except
				s := '';
			end;

			Inc(cnt);
		until (s <> '') or (cnt > 5);

		if s = '' then
		begin
			if SMSC_DEBUG then
				_print_debug('Ошибка чтения адреса: ' + aurl + '?' + arg);

			s := ','; // фиктивный ответ
		end;

		Destroy;
	end;

    delim := ',';

    if cmd = 'status' then
    begin
        params := StrUtils.SplitString(arg, '&');

        for i := 0 to Length(params) - 1 do
        begin
            IdStrings.SplitString(params[i], '=', VLeft, VRight);

            if (VLeft = 'id') and (Pos('%2C', VRight) > 0) then // запятая в id - множественный запрос
                delim := #10;
        end;
    end;

	Result := StrUtils.SplitString(s, delim);
end;

// кодирование параметра в http-запросе

function SMSC._urlencode(str: String): String;
var
    EncodeStr, UnsafeChars: String;
    UStr: UTF8String;
    i, j: Integer;

begin
    UnsafeChars := '!"#%&''*,:;<=>?[]^`{|} ';
    EncodeStr := '';

    if SMSC_POST then
        Result := str
    else
    begin
        for i := 1 to Length(str) do
            if (CharIsInSet(str, i, UnsafeChars) or not CharIsInSet(str, i, CharRange(Char(33), Char(126)))) then
            begin
                UStr := UTF8String(str[i]);

                for j := 1 to Length(UStr) do
                    EncodeStr := EncodeStr + '%' + IntToHex(Byte(UStr[j]), 2);
            end
            else
                EncodeStr := EncodeStr + str[i];

        Result := EncodeStr;
    end;
end;

// вывод отладочной информации

procedure SMSC._print_debug(str: String);
begin
//	with Application do MessageBox(PChar(str), '');
end;

function SMSC._ifs(cond: Boolean; val1: String; val2: String): String;
begin
	if cond then
    	Result := val1
    else
    	Result := val2;
end;

end.

// Examples:
// var
// sms: SMSC;
// ret: TStringDynArray;
// balance: String;
// begin
// sms := SMSC.Create;
// ret := sms.send_sms('79999999999', 'Ваш пароль: 123', 1);
// ret := sms.send_sms('79999999999', 'http://smsc.ua'#13#10 + 'SMSC.UA', 0, '', 0, 0, '', 'maxsms=3');
// ret := sms.send_sms('79999999999', '0605040B8423F0DC0601AE02056A0045C60C036D79736974652E72750001036D7973697465000101', 0, '', 0, 5);
// ret := sms.send_sms('79999999999', '', 0, '', 0, 3);
// ret := sms.send_sms('dest@mysite.com', 'Ваш пароль: 123', 0, 0, 0, 8, 'source@mysite.com', 'subj=Confirmation');
// ret := sms.get_sms_cost('79999999999', 'Вы успешно зарегистрированы!');
// sms.send_sms_mail('79999999999', 'Ваш пароль: 123', 0, '0101121000', 0, 1);
// ret := sms.get_status(12345, '79999999999');
// balance := sms.get_balance;
// sms.Destroy;
// end;

