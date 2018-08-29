unit EnterStrU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TEnterStrF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edStr: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private

    FFlag:Integer;

  public

   property Flag:Integer read FFlag write FFlag;

  end;

var EnterStrF:TEnterStrF;

implementation

uses MainU;

{$R *.dfm}

procedure TEnterStrF.FormCreate(Sender: TObject);
 begin
  Flag:=0;
  Caption:=MFC;
 end;

procedure TEnterStrF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TEnterStrF.BitBtn1Click(Sender: TObject);
 begin
  if edStr.Text<>'' then Flag:=1;
  Close;
 end;

end.
