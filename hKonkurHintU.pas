unit hKonkurHintU;

interface

uses OpenLib, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls;

type
  ThKonkurHintF = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var hKonkurHintF:ThKonkurHintF;

implementation

uses MainU;

{$R *.dfm}

procedure ThKonkurHintF.FormCreate(Sender: TObject);
var R1,R2:HRGN;
    P:Array[0..2] of TPoint;
 begin
  R1:=CreateRoundRectRgn(0,25,ClientWidth,ClientHeight,10,10);

  P[0]:=Point(50,0);
  P[1]:=Point(50,25);
  P[2]:=Point(70,25);
  R2:=CreatePolygonRgn(P,3,WINDING);
  CombineRgn(R1,R1,R2,RGN_OR);
  SetWindowRgn(Handle,R1,True);


  With Image1 do
   begin
    Canvas.Pen.Width:=2;
    Canvas.Pen.Color:=clBlack;
    Canvas.Brush.Color:=$00B9F2FD;
    Canvas.RoundRect(1,26,ClientWidth-1,ClientHeight-1,10,10);
    Canvas.MoveTo(50,0); Canvas.LineTo(50,25);
    Canvas.MoveTo(50,0); Canvas.LineTo(70,25);

    Canvas.Pen.Color:=$00B9F2FD;
    Canvas.MoveTo(51,25); Canvas.LineTo(69,25);
    Canvas.MoveTo(51,26); Canvas.LineTo(69,26);

    Canvas.FloodFill(60,22,clBlack,fsBorder);

   end;

   MakeGradientHeightI(Image1,$00B9F2FD,$00E2FAFE,5,30,ClientWidth-5,ClientHeight-5);

 end;

procedure ThKonkurHintF.Timer1Timer(Sender: TObject);
 begin
  Close;
 end;

procedure ThKonkurHintF.FormActivate(Sender: TObject);
 begin
  Timer1.Enabled:=True;
 end;

procedure ThKonkurHintF.FormHide(Sender: TObject);
 begin
  Timer1.Enabled:=False;
  MainF.CanShowingKonkurHint:=False;
 end;

end.


