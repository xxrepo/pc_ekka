unit AkciiStatU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DBCtrls;

type

  TAkciiStatF = class(TForm)
    BitBtn1: TBitBtn;
    pn4: TPanel;
    DBGrid1: TDBGrid;
    DBText1: TDBText;
    Label1: TLabel;
    pn7: TPanel;
    Label2: TLabel;
    DBGrid2: TDBGrid;
    pn1: TPanel;
    Label3: TLabel;
    DBGrid3: TDBGrid;
    lbSumAll: TLabel;
    DBGrid4: TDBGrid;
    lbSumAll1: TLabel;
    Label6: TLabel;
    lbSumBonusAll4: TLabel;
    pn3: TPanel;
    DBText2: TDBText;
    Label4: TLabel;
    DBGrid5: TDBGrid;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label60: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    pn6: TPanel;
    DBText3: TDBText;
    Label5: TLabel;
    lbSumBonusAll6: TLabel;
    DBGrid6: TDBGrid;
    pn9: TPanel;
    lb111111: TLabel;
    DBGrid7: TDBGrid;

    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private

    FID_P:Integer;

    procedure SetID_P(const Value:Integer);

  public

    property ID_P:Integer read FID_P write SetID_P;

  end;

var AkciiStatF:TAkciiStatF;

implementation

uses DataModuleU, MainU;

{$R *.dfm}

procedure TAkciiStatF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TAkciiStatF.SetID_P(const Value:Integer);
var i:Integer;
 begin
  FID_P:=Value;

  for i:=0 to ComponentCount-1 do
   if Copy(Components[i].Name,1,2)='pn' then
    begin
     TPanel(Components[i]).Top:=3;
     TPanel(Components[i]).Left:=1;
     if Components[i].Name='pn'+IntToStr(Value) then TPanel(Components[i]).Visible:=True
                                                else TPanel(Components[i]).Visible:=False;
    end;

  Case Value of
   1:Width:=842;
   7,9:Width:=474;
  end;

  if Value<>1 then Height:=361;

  Left:=(Screen.Width-Width) div 2;
  Top:=(Screen.Height-Height) div 2;

 end;

procedure TAkciiStatF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
 end;

procedure TAkciiStatF.DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin

  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  Case db.DataSource.DataSet.FieldByName('Closed').AsInteger of
   0:db.Canvas.Brush.Color:=clYellow;
   1:db.Canvas.Brush.Color:=$00A8A8FF;
   2:db.Canvas.Brush.Color:=clLime;
  end;

  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);

 end;

end.
