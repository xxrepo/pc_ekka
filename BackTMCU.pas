unit BackTMCU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, DB;

type
  TBackTMCF = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    pnSearch: TPanel;
    DBGrid2: TDBGrid;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;

    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word; Shift:TShiftState);
    procedure BitBtn3Click(Sender: TObject);

  private

    procedure FilterSpisAll;
    procedure FilterSpis;
    procedure EnterKol(Ds:TDataSet; IsScan: Byte);

  public

  end;

var BackTMCF:TBackTMCF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TBackTMCF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  FilterSpisAll;
  FilterSpis;
 end;

procedure TBackTMCF.FilterSpisAll;
var AC:Integer;
 begin
  try
   AC:=-1;
   if DM.qrTMC.Active then AC:=DM.qrTMC.FieldbyName('Art_code').AsInteger;
   DM.qrTMC.Close;
   DM.qrTMC.SQL.Text:='exec spY_SpisTMC :zero';

   if CheckBox1.Checked then DM.qrTMC.Parameters.ParamByName('zero').Value:=0
                        else DM.qrTMC.Parameters.ParamByName('zero').Value:=-1;

   DM.qrTMC.Open;

   DM.qrTMC.Locate('art_code',AC,[]);
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику ТМЦ: '+E.Message);
  end;
 end;

procedure TBackTMCF.FilterSpis;
var AC:Integer;
 begin
  try
   AC:=-1;
   if DM.qrTMCs.Active then AC:=DM.qrTMCs.FieldbyName('id').AsInteger;
   DM.qrTMCs.Close;
   DM.qrTMCs.Parameters.ParamByName('idu').Value:=Prm.UserID;
   DM.qrTMCs.Open;

   DM.qrTMCs.Locate('id',AC,[]);
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику ТМЦ: '+E.Message);
  end;
 end;

procedure TBackTMCF.CheckBox1Click(Sender: TObject);
 begin
  FilterSpisAll;
 end;

procedure TBackTMCF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if db.DataSource.DataSet.FieldByName('ostat').AsInteger<=0 then
   begin
    db.Canvas.Brush.Color:=clRed;
    db.Canvas.Font.Color:=clWhite;
   end;

  if gdSelected in State then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure TBackTMCF.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var S:String;
    Ind:Integer;
    IsFind:Boolean;
 begin
  if Sender=Nil then Exit;
  S:=pnSearch.Caption;
  Ind:=TDBGrid(Sender).SelectedIndex;
  if Ind>1 then Ind:=1;
  MainF.dbGKeyPress(TDBGrid(Sender),Key,S,Ind,SC_FINDTMC,0,IsFind);
  pnSearch.Caption:=S;
  if isFind then EnterKol(TDBGrid(Sender).DataSource.DataSet,1);

 end;

procedure TBackTMCF.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift:TShiftState);
 begin
  if Key in K_ARROW_KEYS then pnSearch.Caption:='';
  if Key=VK_RETURN then EnterKol(TDBGrid(Sender).DataSource.DataSet,0);
 end;

procedure TBackTMCF.EnterKol(Ds:TDataSet; IsScan:Byte);
var Kol,Art_Code,id_zam:Integer;
 begin
  Art_Code:=Ds.FieldByName('art_code').AsInteger;
  Kol:=MainF.GetKolFromDialog(Ds.FieldByName('Names').AsString,1,Art_Code,id_zam,EN_SIMPLE);
  if Kol<=0 then Exit;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spY_UpdateTMC '+IntToStr(Art_Code)+' , '+IntToStr(kol)+' , '+IntToStr(isscan)+' , '+IntToStr(Prm.UserID);
//   DM.QrEx.SQL.SaveToFile('c:\tmc.txt');
   DM.QrEx.Open;
   if DM.QrEx.FieldByName('Res').AsInteger=-1 then
    begin
     MainF.MessBox('Введенное количество превышает остаток!');
     FilterSpisAll;
     Exit;
    end else
   if DM.QrEx.FieldByName('Res').AsInteger<>9999 then raise EAbort.Create('позиция не добавлена!');

   FilterSpisAll;
   FilterSpis;
  except
   on E:Exception do MainF.MessBox('Ошибка добавления количества ТМЦ: '+E.Message);
  end;

 end;

procedure TBackTMCF.BitBtn4Click(Sender: TObject);
 begin
  Close;
 end;

procedure TBackTMCF.BitBtn2Click(Sender: TObject);
 begin
  if DM.qrTMCs.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите очистить список?',52)<>ID_YES then Exit;
  try

   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('delete from tmpTMC ');
   DM.QrEx.SQL.Add('where compname=host_name() and ');
   DM.QrEx.SQL.Add('      id_user='+IntToStr(Prm.UserID));
   DM.QrEx.SQL.Add('select 999 as Res');
   DM.QrEx.Open;

   FilterSpis;
   FilterSpisAll;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к списку ТМЦ: '+E.Message);
  end;
 end;

procedure TBackTMCF.DBGrid1DblClick(Sender: TObject);
 begin
  EnterKol(TDBGrid(Sender).DataSource.DataSet,1);
 end;

procedure TBackTMCF.BitBtn1Click(Sender: TObject);
 begin
  if DM.qrTMCs.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите сформировать возврат?',52)<>ID_YES then Exit;
  try

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spy_MakeBackTMC '+IntToStr(Prm.UserID);
   DM.QrEx.Open;
   DM.QrEx.Close;

   FilterSpis;
   FilterSpisAll;

   MainF.MessBox('Возврат ТМЦ сформирован успешно!',64);
  except
   on E:Exception do MainF.MessBox('Ошибка формирования возврата ТМЦ: '+E.Message);
  end;

 end;

procedure TBackTMCF.DBGrid2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key=VK_DELETE then BitBtn3Click(BitBtn3);
 end;

procedure TBackTMCF.BitBtn3Click(Sender: TObject);
 begin
  if DM.qrTMCs.IsEmpty then Exit;
  if MainF.MessBox('Удалить строку?',52)<>ID_YES then Exit;
  try

   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('delete from tmpTMC ');
   DM.QrEx.SQL.Add('where compname=host_name() and ');
   DM.QrEx.SQL.Add('      id_user='+IntToStr(Prm.UserID)+' and art_code='+DM.qrTMCs.FieldByName('art_code').AsString);
   DM.QrEx.SQL.Add('select 999 as Res');
   DM.QrEx.Open;

   FilterSpis;
   FilterSpisAll;
  except
   on E:Exception do MainF.MessBox('Ошибка удаления позици: '+E.Message);
  end;
 end;

end.



