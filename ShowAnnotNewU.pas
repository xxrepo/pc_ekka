unit ShowAnnotNewU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls, StdCtrls, Buttons;

type

  TShowAnnotNewF = class(TForm)

    Panel2: TPanel;
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);

  private

  public

    Flag:Byte;

  end;

var ShowAnnotNewF:TShowAnnotNewF;

implementation

uses MainU;

{$R *.dfm}

procedure TShowAnnotNewF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  Flag:=0;
 end;

procedure TShowAnnotNewF.BitBtn1Click(Sender: TObject);
 begin
  WebBrowser1.ExecWB(OLECMDID_PRINT,OLECMDEXECOPT_PROMPTUSER);
//  WebBrowser1.ExecWB(OLECMDID_PRINT,OLECMDEXECOPT_DONTPROMPTUSER);
 end;

procedure TShowAnnotNewF.FormPaint(Sender: TObject);
 begin
  if Flag=1 then Close;
 end;

end.


