unit AboutU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TAboutF = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
  public
  end;

var AboutF:TAboutF;

implementation

uses MainU;

{$R *.dfm}

procedure TAboutF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TAboutF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

end.
