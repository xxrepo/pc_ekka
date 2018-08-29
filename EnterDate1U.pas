unit EnterDate1U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TEnterDate1F = class(TForm)
    Label1: TLabel;
    dtStart: TDateTimePicker;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private

    FFlag:Integer;

  public

    property Flag:Integer read FFlag write FFlag;

  end;  

var EnterDate1F:TEnterDate1F;

function GetDiagDate1(var D1:TDateTime):Boolean;

implementation

uses MainU;

{$R *.dfm}

function GetDiagDate1(var D1:TDateTime):Boolean;
 begin
  try
   EnterDate1F:=TEnterDate1F.Create(MainF);
   try
    Application.ProcessMessages;
    EnterDate1F.ShowModal;
    if EnterDate1F.Flag<>1 then Abort;
    D1:=EnterDate1F.dtStart.Date;
   finally
    EnterDate1F.Free;
   end;
   Result:=True;
  except
   Result:=False;
  end;
 end;

procedure TEnterDate1F.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TEnterDate1F.BitBtn2Click(Sender:TObject);
 begin
  Flag:=1;
  Close;
 end;

procedure TEnterDate1F.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Flag:=0;
  dtStart.Date:=Date;
 end;

end.
