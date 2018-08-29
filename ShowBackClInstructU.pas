unit ShowBackClInstructU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Util;

type

  TShowBackClInstructF=class(TForm)

    RichEdit1:TRichEdit;

    procedure FormCreate(Sender:TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);

  private

  public

  end;

var ShowBackClInstructF:TShowBackClInstructF;

implementation

uses MainU;

{$R *.dfm}

procedure TShowBackClInstructF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  if FileExists('D:\ava\BInstruct.rtf') then RichEdit1.Lines.LoadFromFile('D:\ava\BInstruct.rtf') else
   if FileExists('\\server\ava\BInstruct.rtf') then RichEdit1.Lines.LoadFromFile('\\server\ava\BInstruct.rtf');
 end;

procedure TShowBackClInstructF.FormShortCut(var Msg:TWMKey; var Handled:Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

end.
