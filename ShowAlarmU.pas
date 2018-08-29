unit ShowAlarmU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TShowAlarmF = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShowAlarmF: TShowAlarmF;

implementation

uses MainU;

{$R *.dfm}

procedure TShowAlarmF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TShowAlarmF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

end.
