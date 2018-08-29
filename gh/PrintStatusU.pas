unit PrintStatusU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons;

type
  TPrintStatusF = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y:Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,Y:Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton; Shift:TShiftState; X,Y:Integer);
    procedure FormPaint(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Draging:Boolean;
    X0,Y0:Integer;
  public
    Flag:Integer;
  end;

var PrintStatusF:TPrintStatusF;

implementation

{$R *.dfm}

procedure TPrintStatusF.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 begin
  Draging:=true; x0:=x; y0:=y;
 end;

procedure TPrintStatusF.FormMouseMove(Sender: TObject; Shift: TShiftState; X,Y:Integer);
 begin
  if Draging=True then
   begin
    Left:=Left+X-X0;
    Top:=Top+Y-Y0;
   end;
 end;

procedure TPrintStatusF.FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 begin
  Draging:=False;
 end;

procedure TPrintStatusF.FormPaint(Sender: TObject);
 begin
  With PrintStatusF.Canvas do
   begin
    Pen.Color:=clWhite;
    MoveTo(1,1); LineTo(ClientWidth-1,1);
    MoveTo(1,1); LineTo(1,ClientHeight-1);
    Pen.Color:=clGray;
    MoveTo(1,ClientHeight-1); LineTo(ClientWidth-1,ClientHeight-1);
    MoveTo(ClientWidth-1,1); LineTo(ClientWidth-1,ClientHeight-1);
   end;
 end;

procedure TPrintStatusF.BitBtn1Click(Sender: TObject);
 begin
  Flag:=1;
  Close;
 end;

procedure TPrintStatusF.FormCreate(Sender: TObject);
 begin
  Flag:=0;
 end;

end.
