unit MoveMoneyU;

interface

uses
  Forms, StdCtrls, Buttons, Grids, Controls, ExtCtrls, Classes, Windows, EKKAU,
  SysUtils, Graphics;
// , Messages, Variants, Dialogs;

type
  TMoveMoneyF = class(TForm)

    Panel1: TPanel;
    Label1: TLabel;
    BitBtn8: TBitBtn;
    SG: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;  State: TGridDrawState);

  private

  public

  end;

var
  MoveMoneyF: TMoveMoneyF;

implementation

uses
  MainU, Marry301U, DataModuleU;

{$R *.dfm}

procedure TMoveMoneyF.FormCreate(Sender: TObject);
var i:Integer;
 begin
  Caption:=MFC;
  BitBtn8.Glyph.Assign(MainF.imStop.Picture);

  SG.ColWidths[0]:=200;
  SG.ColWidths[1]:=137;

  SG.Cells[0,0]:='Начальный остаток:';
  SG.Cells[0,1]:='Служебное внесение:';

  SG.Cells[0,2]:='Служебная выдача:';
  SG.Cells[0,3]:='Получено денег от клиентов:';
  SG.Cells[0,4]:='Возврат клиентам:';
  SG.Cells[0,5]:='ОСТАТОК ДЕНЕГ В КАССЕ:';
  SG.Cells[0,6]:='Безналичная оплата:';
  SG.Cells[0,7]:='Безналичный возврат:';
  SG.Cells[0,8]:='Общий оборот:';

  if Opt.EKKAAsPrinter=False then
   begin
    if (Not(EKKA.UseEKKA)) and (EKKA.EmulEKKA=False) then Exit;

    if Not EKKA.fpCashState(0) then Exit;
//    ShowMessage(EKKA.RD_Item.Text);
    if length(EKKA.RD_Item.Text)>0 then
    begin
      for i:=0 to 7 do SG.Cells[1,i]:=CurrToStrF(StrToInt(EKKA.RD_Item[i])*0.01,ffFixed,2);

      SG.Cells[1,8]:=CurrToStrF(StrToInt(EKKA.RD_Item[3])*0.01
                     +StrToInt(EKKA.RD_Item[6])*0.01
                     -StrToInt(EKKA.RD_Item[4])*0.01
                     -StrToInt(EKKA.RD_Item[7])*0.01,ffFixed,2);
    end
    else
      for i:=0 to 7 do SG.Cells[1,i]:=CurrToStrF(0,ffFixed,2);
   end else begin

             DM.QrEx.Close;
             DM.QrEx.SQL.Text:='exec spY_GetCashPrint '+IntToStr(Opt.KassaID);
             DM.QrEx.Open;

             SG.Cells[1,5]:=CurrToStrF(DM.QrEx.FieldByName('Sm').AsCurrency,ffFixed,2);
             SG.Cells[1,6]:=CurrToStrF(DM.QrEx.FieldByName('SmBn').AsCurrency,ffFixed,2);

            end;
 end;

procedure TMoveMoneyF.BitBtn8Click(Sender: TObject);
 begin
  Close;
 end;

procedure TMoveMoneyF.SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var sg:TStringGrid;
    dx:Integer;
 begin
  dx:=2;
  if Sender=nil then Exit;
  sg:=TStringGrid(Sender);
  Case ACol of
   0:sg.Canvas.Font.Style:=[fsBold];
   1:dx:=sg.ColWidths[1]-sg.Canvas.TextWidth(sg.Cells[ACol,ARow])-2;
  end;
  sg.Canvas.FillRect(Rect);
  sg.Canvas.TextOut(Rect.Left+dx,Rect.Top+1,SG.Cells[ACol,ARow]);
 end;

end.



