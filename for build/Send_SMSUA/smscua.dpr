library smscua;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  ShareMem,
  System.SysUtils,
  System.Classes,
  Types,
  smsc_api in 'smsc_api.pas';

{$R *.res}
function SendSMS( Login : PAnsiChar;
                  Pass : PAnsiChar;
                  Phones: PAnsiChar;
                  mes: PAnsiChar) : integer; stdcall;
var
  sms : SMSC;
  ret : TStringDynArray;
begin
  Result := 0;
  sms := SMSC.Create(Login,Pass);
  try
    try
      ret := sms.send_sms(phones, mes);
      Result := StrToIntDef(ret[1], -1);
    except
      Result := -1;
    end;
  finally
    FreeAndNil(sms);
  end;
end;

function GetBalance (Login : PAnsiChar;
                      Pass : PAnsiChar) : Double; stdcall;
var
  sms : SMSC;
begin
  Result := 0;
  sms := SMSC.Create(Login,Pass);
  try
    Result := StrToFloatDef(sms.get_balance(),0);
  finally
    FreeAndNil(sms);
  end;
end;

exports
  SendSMS name 'SendSMS',
  GetBalance name 'GetBalance';
begin
end.
