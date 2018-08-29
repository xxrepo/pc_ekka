unit ShowSimpTextU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons;

type
  TShowSimpTextF = class(TForm)
    DBMemo1: TDBMemo;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private

  public

  end;

var ShowSimpTextF:TShowSimpTextF;

implementation

uses MainU;

{$R *.dfm}

procedure TShowSimpTextF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
 end;

procedure TShowSimpTextF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

end.
