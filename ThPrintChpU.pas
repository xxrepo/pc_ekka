unit ThPrintChpU;

interface

uses Windows,SysUtils,Classes;

type TPrintChp=class(TThread)
     private

     protected

       procedure Execute; override;

     end;

implementation

uses MainU;

{ TPrintChp }

procedure TPrintChp.Execute;
var FHandle:THandle;
    i:Integer;
    OEMStr: PChar;
    NumberOfBytesToWrite,FNumberOfBytesWritten:Cardinal;
    S:String;
 begin
  FreeOnTerminate:=True;
  if MainF.CHPChek.Text<>'' then
   begin
    FHandle:=CreateFile(PChar(Opt.PrintPort),GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0);
    try
     if FHandle<>INVALID_HANDLE_VALUE then
      for i:=0 to MainF.CHPChek.Count-1 do
       begin
        S:='      '+MainF.CHPChek[i]+#10#13;
        NumberOfBytesToWrite:=Length(S);
        OEMStr:=PChar(LocalAlloc(LMEM_FIXED,NumberOfBytesToWrite+1));
        try
         CharToOem(PChar(S),OEMStr);
         WriteFile(FHandle,OEMStr^,NumberOfBytesToWrite,FNumberOfBytesWritten,nil)
        finally
         LocalFree(Integer(OEMStr));
        end;
       end;
    finally
     CloseHandle(FHandle);
    end;
   end;
 end;

end.
 