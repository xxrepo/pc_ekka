unit EnterDateU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TEnterDateF = class(TForm)
    dtStart: TDateTimePicker;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    dtEnd: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private

    FFlag:Integer;

  public

    property Flag:Integer read FFlag write FFlag;

  end;

function GetDiagDate(var D1,D2:TDateTime):Boolean;

var EnterDateF:TEnterDateF;

implementation

uses MainU;

{$R *.dfm}

function GetDiagDate(var D1,D2:TDateTime):Boolean;
 begin
  try
   EnterDateF:=TEnterDateF.Create(MainF);
   try
    if D1<>0 then EnterDateF.dtStart.Date:=D1;
    Application.ProcessMessages;
    EnterDateF.ShowModal;
    if EnterDateF.Flag<>1 then Abort;
    D1:=EnterDateF.dtStart.Date;
    D2:=EnterDateF.dtEnd.Date;
   finally
    EnterDateF.Free;
   end;
   Result:=True;
  except
   Result:=False;
  end;
 end;


procedure TEnterDateF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Flag:=0;
  dtStart.Date:=Date-1;
  dtEnd.Date:=Date-1;
 end;

procedure TEnterDateF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TEnterDateF.BitBtn2Click(Sender: TObject);
 begin
  Flag:=1;
  Close;
 end;

end.
