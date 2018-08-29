unit hKonkurHintU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormHintU, ActnList, ExtCtrls, StdCtrls;

type
  ThKonkurHintF = class(TForm)
    Label1: TLabel;
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var hKonkurHintF: ThKonkurHintF;

implementation

{$R *.dfm}

procedure ThKonkurHintF.Image1Click(Sender: TObject);
var R1,R2:HRGN;
 begin
  R1:=CreateRoundRectRgn(0,35,ClientWidth,ClientHeight,7,7);
//  R2:=CreateRectRgn(0,0,Width,35);
//  CombineRgn(R1,R1,R1,RGN_DIFF);
  SetWindowRgn(Handle,R1,True);
 end;


end.
