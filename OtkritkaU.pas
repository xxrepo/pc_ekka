unit OtkritkaU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg;

type
  TOtkritkaF = class(TForm)
    imOtkr: TImage;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var OtkritkaF: TOtkritkaF;

implementation

uses MainU;

{$R *.dfm}

procedure TOtkritkaF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TOtkritkaF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

end.
