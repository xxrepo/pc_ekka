unit OstatInBSkladU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type

  TOstatInBSkladF=class(TForm)

    Label1: TLabel;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    pnSearch: TLabel;
    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private

  public

  end;

var OstatInBSkladF:TOstatInBSkladF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TOstatInBSkladF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  DM.qrDB.Close;
  DM.qrDB.Open;
 end;

procedure TOstatInBSkladF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TOstatInBSkladF.DBGrid1KeyPress(Sender: TObject; var Key: Char);
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

procedure TOstatInBSkladF.FormActivate(Sender:TObject);
 begin
  DBGrid1.SetFocus;
 end;

procedure TOstatInBSkladF.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key in K_ARROW_KEYS then pnSearch.Caption:='';
 end;

end.
