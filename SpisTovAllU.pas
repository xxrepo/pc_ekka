unit SpisTovAllU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type

  TSpisTovAllF = class(TForm)

    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    pnSearch: TLabel;

    procedure FormCreate(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure DBGrid1KeyPress(Sender:TObject; var Key:Char);
    procedure DBGrid1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure DBGrid1DblClick(Sender:TObject);

  private

  public

    Flag:Integer;

  end;

var SpisTovAllF:TSpisTovAllF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TSpisTovAllF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  Flag:=0;
  DM.qrPList1.Close;
  DM.qrPList1.Open;
 end;

procedure TSpisTovAllF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TSpisTovAllF.BitBtn2Click(Sender: TObject);
 begin
  if Not DM.qrPList1.IsEmpty then
   begin
    Flag:=1;
    Close;
   end;
 end;

procedure TSpisTovAllF.DBGrid1KeyPress(Sender:TObject; var Key:Char);
var S:String;
    Ind:Integer;
    IsFind:Boolean;

 begin
  if Sender=Nil then Exit;
  S:=pnSearch.Caption;
  Ind:=TDBGrid(Sender).SelectedIndex;
  if Ind>1 then Ind:=1;
  MainF.dbGKeyPress(TDBGrid(Sender),Key,S,Ind,SC_FIND,1,IsFind);
  pnSearch.Caption:=S;
 end;

procedure TSpisTovAllF.DBGrid1KeyDown(Sender:TObject; var Key:Word;  Shift:TShiftState);
 begin
  if Key in K_ARROW_KEYS then pnSearch.Caption:='';
  if Key=VK_RETURN then BitBtn2Click(BitBtn2);
 end;

procedure TSpisTovAllF.DBGrid1DblClick(Sender: TObject);
 begin
  BitBtn2Click(BitBtn2);
 end;

end.
