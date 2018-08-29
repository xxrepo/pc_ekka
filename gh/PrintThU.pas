unit PrintThU;

interface

uses SysUtils, Classes, PrintReport;

type
  TPrintTh = class(TThread)
  private
  protected
    procedure Execute; override;
  end;

implementation

procedure TPrintTh.Execute;
 begin
  FreeOnTerminate:=True;
  PrintRep.Print;
 end;

end.
