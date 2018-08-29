unit Pilot1U;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TPilot1F = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private

  public

  end;

var Pilot1F:TPilot1F;

implementation

uses MainU;

{$R *.dfm}

procedure TPilot1F.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
 end;

procedure TPilot1F.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

end.
