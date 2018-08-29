unit ArmourInApteksU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, jpeg, Buttons;

type
  TArmourInApteksF = class(TForm)
    Panel1: TPanel;
    pn1: TPanel;
    dbg1: TDBGrid;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pnSearch: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbg1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure dbg1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dbg1KeyPress(Sender: TObject; var Key: Char);
  private

    procedure ShowSpisAll;
    procedure EnterKol(Param:Integer);
    procedure ShowChek;

  public

  end;

var ArmourInApteksF:TArmourInApteksF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TArmourInApteksF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;

  ShowSpisAll;
  ShowChek;
 end;

procedure TArmourInApteksF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TArmourInApteksF.ShowSpisAll;
var AC:Integer;
 begin
  try
   AC:=-1;
   if DM.qrArmour.Active then AC:=DM.qrArmour.FieldByName('art_code').AsInteger;
   DM.qrArmour.Close;
   DM.qrArmour.SQL.Text:='exec spY_FilterSklad 0,-1,1';
   DM.qrArmour.Open;
   DM.qrArmour.Locate('art_code',AC,[]);
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику остатков: '+E.Message);
  end;
 end;

procedure TArmourInApteksF.ShowChek;
var AC:Integer;
 begin
  try
   AC:=-1;
   if DM.qrArmCh.Active then AC:=DM.qrArmCh.FieldByName('art_code').AsInteger;
   DM.qrArmCh.Close;
   DM.qrArmCh.Parameters.ParamByName('pid').Value:=-Prm.UserID;
   DM.qrArmCh.Open;
   DM.qrArmCh.Locate('art_code',AC,[]);
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к чеку: '+E.Message);
  end;
 end;

procedure TArmourInApteksF.EnterKol(Param:Integer);
var Kol,Art_Code,id_zam:Integer;

 begin

  if DM.qrArmour.IsEmpty then Exit;
  Art_Code:=DM.qrArmour.FieldByName('Art_Code').AsInteger;
  Kol:=DM.qrArmour.FieldByName('Upak').AsInteger;
  Kol:=MainF.GetKolFromDialog(DM.qrArmour.FieldByName('Names').AsString,Kol,Art_Code,id_zam,0);
  if Kol<=0 then Exit;

  DM.spY_EnterKol.Parameters.ParamValues['@part_code']:=Art_code;
  DM.spY_EnterKol.Parameters.ParamValues['@pold_art']:=Art_code;
  DM.spY_EnterKol.Parameters.ParamValues['@pkol']:=Kol;
  DM.spY_EnterKol.Parameters.ParamValues['@piduser']:=-Prm.UserID;
  DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=Param;
  DM.spY_EnterKol.Parameters.ParamValues['@simp']:=1;

  DM.ADOCo.BeginTrans;
  try
   DM.spY_EnterKol.ExecProc;

   if DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']=21 then
    raise EAbort.Create('Введеное количество превышает остаток склада'+#10+'Или товар забрал другой оператор либо товар находиться в спике забронированных или зарезервированных для возврата!') else

   DM.ADOCo.CommitTrans;

   ShowSpisAll;
   ShowChek;
  except
   on E:Exception do
    begin
     DM.ADOCo.RollbackTrans;
     MainF.MessBox(E.Message);
    end;
  end;

 end;

procedure TArmourInApteksF.dbg1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key in K_ARROW_KEYS then pnSearch.Caption:='';
  if Key=VK_RETURN then EnterKol(0);
 end;

procedure TArmourInApteksF.dbg1DblClick(Sender: TObject);
 begin
  EnterKol(0);
 end;

procedure TArmourInApteksF.BitBtn2Click(Sender: TObject);
 begin
  if MainF.MessBox('Вы действительно хотите очистить список?',52)<>ID_YES then Exit;
  try

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spY_ClearChek :pid select 999 as Res';
   DM.QrEx.Parameters.ParamByName('pid').Value:=-Prm.UserID;
   DM.QrEx.Open;

   ShowSpisAll;
   ShowChek;

  except
   on E:Exception do MainF.MessBox('Ошибка доступа к чеку: '+E.Message);
  end;
 end;

procedure TArmourInApteksF.dbg1KeyPress(Sender: TObject; var Key: Char);
var S:String;
    Ind:Integer;
    IsFind:Boolean;

 begin

  if Sender=Nil then Exit;
  S:=pnSearch.Caption;
  Ind:=TDBGrid(Sender).SelectedIndex;
  if Ind>1 then Ind:=1;
  MainF.dbGKeyPress(TDBGrid(Sender),Key,S,Ind,SC_FIND,0,IsFind);
  pnSearch.Caption:=S;
  if isFind then EnterKol(1);

 end;

end.
