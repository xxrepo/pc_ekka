unit ShowTerminalAlertU;

interface

uses
  Forms, StdCtrls, Buttons, Controls, Classes, ExtCtrls;
//  , Windows, Messages, SysUtils, Variants, Graphics, Dialogs,

type
  TShowTerminalAlertF = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  end;

var ShowTerminalAlertF:TShowTerminalAlertF;

implementation

uses MainU;

{$R *.dfm}

procedure TShowTerminalAlertF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
 end;

procedure TShowTerminalAlertF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

end.
