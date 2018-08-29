unit DialogVozrSpisU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TDialogVozrSpisF = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn4: TBitBtn;
    Label5: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);

  private

    FFlag:Integer;

  public

    property Flag:Integer read FFlag write FFlag;

  end;

var DialogVozrSpisF: TDialogVozrSpisF;

function ShowDialogVozrSpis:Integer;

implementation

uses MainU;

{$R *.dfm}

procedure TDialogVozrSpisF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Flag:=0;
 end;

procedure TDialogVozrSpisF.BitBtn3Click(Sender: TObject);
 begin
  Flag:=3;
  Close;
 end;

procedure TDialogVozrSpisF.BitBtn1Click(Sender: TObject);
 begin
  Flag:=1;
  Close;
 end;

procedure TDialogVozrSpisF.BitBtn2Click(Sender: TObject);
 begin
  Flag:=2;
  Close;
 end;

procedure TDialogVozrSpisF.BitBtn4Click(Sender: TObject);
 begin
  Close;
 end;

function ShowDialogVozrSpis:Integer;
var dvs:TDialogVozrSpisF;
 begin
  Result:=0;
  try
   dvs:=TDialogVozrSpisF.Create(nil);
   try
    Application.ProcessMessages;
    dvs.ShowModal;
    Result:=dvs.Flag;
   finally
    dvs.Free;
   end;
  except
  end;
 end;

end.
