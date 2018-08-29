unit ChekListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, Buttons;

type
  TChekListF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    SG: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pn1: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    pn2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
  private

    FFlag:Integer;

  public

    property Flag:Integer read FFlag write FFlag;

  end;

var ChekListF:TChekListF;

implementation

uses MainU;

{$R *.dfm}

procedure TChekListF.FormCreate(Sender:TObject);
 begin
  Flag:=0;
  Caption:=MFC;
  SG.ColWidths[0]:=87;
  SG.ColWidths[1]:=98;
  SG.ColWidths[2]:=-1;
  SG.Cells[0,0]:='Номер чека';
  SG.Cells[1,0]:='Сумма';
 end;

procedure TChekListF.BitBtn2Click(Sender:TObject);
 begin
  Close; 
 end;

procedure TChekListF.BitBtn1Click(Sender: TObject);
 begin
  Flag:=1;
  Close;
 end;

procedure TChekListF.SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var sg:TStringGrid;
    dx:Integer;
 begin
  if Sender=nil then Exit;
  sg:=TStringGrid(Sender);
  sg.Canvas.Font.Color:=clBlack;
  dx:=0;
  Case ACol of
   0:sg.Canvas.Font.Style:=[fsBold];
   1:dx:=sg.ColWidths[1]-sg.Canvas.TextWidth(sg.Cells[ACol,ARow])-2;
  end;
  if ARow=0 then
   begin
    sg.Canvas.Font.Style:=[fsBold];
    sg.Canvas.Font.Color:=clMaroon;
    dx:=(sg.ColWidths[ACol]-sg.Canvas.TextWidth(sg.Cells[ACol,ARow])-2) div 2;
   end;
  if sg.Cells[2,ARow]='0' then sg.Canvas.Brush.Color:=clYellow else
  if sg.Cells[2,ARow]='1' then
   begin
    sg.Canvas.Font.Color:=clWhite;
    sg.Canvas.Brush.Color:=clBlue;
   end; 
  if gdSelected in State then begin SG.Canvas.Font.Color:=clWhite; SG.Canvas.Brush.Color:=clNavy; end;

  sg.Canvas.FillRect(Rect);
  sg.Canvas.TextOut(Rect.Left+dx,Rect.Top+1,SG.Cells[ACol,ARow]);
 end;

end.
