unit ShCutU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ExtCtrls, ShellApi, Util;

type TShortCut=class(TSpeedButton)
     private

       FX0,FY0:Integer;
       FIsDrag,FDraging:Boolean;
       FExeName:String;
       FPath:String;
       FParamStr:String;
       FWnStyle:Integer;
       FIsOne:Boolean;

       procedure SetPath(const Value:String);

     public

       constructor Create(AOwner: TComponent); override;

       procedure Click; override;

       property IsOne:Boolean read FIsOne write FIsOne;
       property ExeName:String read FExeName write FExeName;
       property Path:String read FPath write SetPath;
       property ParamStr:String read FParamStr write FParamStr;
       property WnStyle:Integer read FWnStyle write FWnStyle;

     end;

implementation

uses MainU;

{ TShortCut }

procedure TShortCut.Click;
var Wnd:HWND;
    sa:TSECURITYATTRIBUTES;
    si:TSTARTUPINFO;
    pi:TPROCESSINFORMATION;
    Res1,Res2:Integer;
 begin
  if FIsDrag then Exit;
  inherited;
  if IsOne then
   if ProcessExists(ExeName)<>0 then
    begin
     Wnd:=GetHandleByExeName(Parent.Handle,ExeName);
     ShowWindow(Wnd,SW_SHOWDEFAULT);
     SetForegroundWindow(Wnd);
     Exit;
    end;

{
  ZeroMemory(@si,sizeof(si));
  si.cb:=sizeof(si);
  si.dwFlags:=STARTF_USESHOWWINDOW;
  si.wShowWindow:=SW_HIDE;
  CreateProcess(Pchar(IncludeTrailingBackSlash(Path)+ExeName),PChar(ParamStr),nil, nil, true,CREATE_DEFAULT_ERROR_MODE, nil, nil, si, pi);
}
 // Res1:=WinExec(Pchar(IncludeTrailingBackSlash(Path)+ExeName+' '+ParamStr),SW_SHOW);

  if (AnsiUpperCase(ExtractFileExt(ExeName))='.EXE') and (ParamStr<>'-ShellEx') then
   begin
    Res1:=WinExec(Pchar(IncludeTrailingBackSlash(Path)+ExeName+' '+ParamStr),SW_SHOW);
    if Res1<>33 then
     Res2:=ShellExecute(Application.Handle,'open',PChar(IncludeTrailingBackSlash(Path)+ExeName),PChar(ParamStr),PChar(Path),WnStyle);
   end
  else
   Res2:=ShellExecute(Application.Handle,'open',PChar(IncludeTrailingBackSlash(Path)+ExeName),PChar(ParamStr),PChar(Path),WnStyle);

//  ShowMessage(IntToStr(Res1)+' - '+IntToStr(Res2));
 end;

constructor TShortCut.Create(AOwner:TComponent);
 begin
  inherited;
  FX0:=0; FY0:=0;
  FDraging:=False;
  Transparent:=True;
  Flat:=True;
  LayOut:=blGlyphTop;
  ShowHint:=True;
 end;

procedure TShortCut.SetPath(const Value:String);
 begin
  if Value='' then FPath:='' else FPath:=IncludeTrailingBackSlash(Value);
 end;

end.
