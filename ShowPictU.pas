unit ShowPictU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls;

type
  TShowPictF = class(TForm)
    Panel1: TPanel;
    imPict: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    Draging:Boolean;

    X0,Y0:Integer;
    
  public

  end;

var ShowPictF:TShowPictF;

implementation

uses MainU;

{$R *.dfm}

procedure TShowPictF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

procedure TShowPictF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TShowPictF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

end.
