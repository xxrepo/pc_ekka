unit OtkazInfoU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, ADODB;

type
  TOtkazInfoF = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    lbNextDateTov: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbKol: TLabel;
    lbCena: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    Bevel3: TBevel;
    BitBtn2: TBitBtn;
    Label8: TLabel;
    lbOstApteks: TLabel;
    Label7: TLabel;
    Bevel4: TBevel;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    procedure FormActivate(Sender:TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

  private

  public

    Art_Code:Integer;
    MakeFrom:Integer;
    Upak:Integer;

  end;

var OtkazInfoF:TOtkazInfoF;

implementation

uses MainU,DataModuleU;

{$R *.dfm}

procedure TOtkazInfoF.FormActivate(Sender:TObject);
var Dt:TDateTime;
    QrToOff:TADOQuery;
 begin
  DM.qrAnalog.Close;
  DM.qrAnalog.SQL.Text:='exec spY_GetAnalog '+IntToStr(Art_Code)+',1';
  DM.qrAnalog.Open;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='exec spY_GetNextTovPrihDate ';
  DM.QrEx.Open;

  if DM.QrEx.FieldByName('IsPrih').AsInteger=1 then
   begin
    Dt:=DM.QrEx.FieldByName('Dt').AsDateTime;

    DM.QrEx.Close;
    DM.QrEx.SQL.Text:='exec spY_GetNextTov '+IntToStr(Art_Code);
    DM.QrEx.Open;
    if DM.QrEx.IsEmpty=False then
     begin
      lbKol.Caption:= DM.QrEx.FieldByName('kol').AsString;
      lbCena.Caption:=DM.QrEx.FieldByName('Cena').AsString;

      lbNextDateTov.Caption:=DateToStr(Dt);

      BitBtn1.Enabled:=True;
     end; 
    end else lbNextDateTov.Caption:='нового товара нет';

 end;

procedure TOtkazInfoF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

procedure TOtkazInfoF.BitBtn2Click(Sender: TObject);
 begin
  if DM.spY_FilterSklad.IsEmpty then Exit;
  MainF.ShowTovInfo(MakeFrom,'',Upak,1,MakeFrom);
 end;

procedure TOtkazInfoF.SpeedButton1Click(Sender: TObject);
 begin
  Close;
 end;

end.



