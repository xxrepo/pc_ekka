unit LogoU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, jpeg;

type
  TLogoF = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure Image1Click(Sender:TObject);
    procedure Timer1Timer(Sender:TObject);
    procedure FormKeyDown(Sender:TObject; var Key:Word;
      Shift: TShiftState);
  private

  public

  end;

var LogoF:TLogoF;

implementation

{$R *.dfm}

procedure TLogoF.Image1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TLogoF.Timer1Timer(Sender: TObject);
 begin
  Close;
 end;

procedure TLogoF.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  Close;
 end;

end.
