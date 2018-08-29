unit VozrPartU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DB, PrintReport;

type
  TVozrPartF = class(TForm)
    dbgSpr: TDBGrid;
    Panel1: TPanel;
    lbNakl: TLabel;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dbgSprKeyDown(Sender: TObject; var Key:Word; Shift:TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure dbgSprDblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private

    Fiddoc: Integer;

    procedure ShowNakl;
    procedure EnterKol(Ds:TDataSet; IsScan:Byte);
    procedure FilterSpis;

  public

    property iddoc:Integer read Fiddoc write Fiddoc;

  end;

var
  VozrPartF: TVozrPartF;

implementation

uses DataModuleU, MainU;

{$R *.dfm}

procedure TVozrPartF.ShowNakl;
var ID:Integer;
 begin
  try
   if DM.qrSprPart.Active then ID:=DM.qrSprPart.FieldByName('kod_name').AsInteger;

   DM.qrSprPart.Close;
   DM.qrSprPart.SQL.Text:='exec spY_ShoNaklPart '+IntToStr(fiddoc)+' , '+IntToStr(Prm.UserID);
   DM.qrSprPart.Open;

   DM.qrSprPart.Locate('kod_name',ID,[]);

   lbNakl.Caption:='Накладная №: '+DM.qrSprPart.FieldByName('nn_nakl').AsString+'   Дата накладной: '+DM.qrSprPart.FieldByName('date_nakl').AsString;

  except
   on E:Exception do MainF.MessBox('Ошибка доступа к накладной: '+E.Message);
  end;
 end;

procedure TVozrPartF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TVozrPartF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TVozrPartF.dbgSprKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key=VK_RETURN then EnterKol(TDBGrid(Sender).DataSource.DataSet,0);
 end;

procedure TVozrPartF.FilterSpis;
var ID:Integer;
 begin
  try
   if DM.qrSprPartCh.Active then ID:=DM.qrSprPartCh.FieldByName('kod_name').AsInteger;

   DM.qrSprPartCh.Close;
   DM.qrSprPartCh.SQL.Text:='exec spY_ShowVzrPartCh '+IntToStr(fiddoc)+' , '+IntToStr(Prm.UserID);
   DM.qrSprPartCh.Open;

   DM.qrSprPartCh.Locate('kod_name',ID,[]);
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к списку для возврата: '+E.Message);

  end;
 end;

procedure TVozrPartF.EnterKol(Ds:TDataSet; IsScan:Byte);
var Kol,Art_Code,id_zam,kod_name:Integer;
 begin

  Art_Code:=Ds.FieldByName('art_code').AsInteger;
  Kol:=MainF.GetKolFromDialog(Ds.FieldByName('Names').AsString,1,Art_Code,id_zam,EN_SIMPLE);
  Kod_name:=Ds.FieldByName('kod_name').AsInteger;

  if Kol<=0 then Exit;
  try

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spY_UpdateVzrPart '+IntToStr(kod_name)+' , '+IntToStr(kol)+' , '+IntToStr(fiddoc)+' , '+IntToStr(Prm.UserID);
//   DM.QrEx.SQL.SaveToFile('c:\tmc.txt');
   DM.QrEx.Open;

   if DM.QrEx.FieldByName('Res').AsInteger=-1 then
    begin
     MainF.MessBox('Введенное количество превышает остаток!');
     ShowNakl;
     Exit;
    end else
   if DM.QrEx.FieldByName('Res').AsInteger<>1 then raise EAbort.Create('позиция не добавлена!');

   ShowNakl;
   FilterSpis;
  except
   on E:Exception do MainF.MessBox('Ошибка добавления позиции возврата: '+E.Message);
  end;

 end;

procedure TVozrPartF.FormActivate(Sender: TObject);
 begin
  ShowNakl;
  FilterSpis;
 end;

procedure TVozrPartF.dbgSprDblClick(Sender: TObject);
 begin
  EnterKol(TDBGrid(Sender).DataSource.DataSet,0);
 end;

procedure TVozrPartF.BitBtn3Click(Sender: TObject);
 begin
  if DM.qrSprPartCh.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите очистить список?',52)<>ID_YES then Exit;
  try

   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('delete from tmpVzrPart ');
   DM.QrEx.SQL.Add('where compname=host_name() and ');
   DM.QrEx.SQL.Add('      iddoc='+IntToStr(fiddoc)+' and ');
   DM.QrEx.SQL.Add('      id_user='+IntToStr(Prm.UserID));
   DM.QrEx.SQL.Add('select 999 as Res');
   DM.QrEx.Open;

   ShowNakl;
   FilterSpis;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к списку для возврата: '+E.Message);
  end;
 end;

procedure TVozrPartF.BitBtn4Click(Sender: TObject);
 begin
  if DM.qrSprPartCh.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите удалить строку?',52)<>ID_YES then Exit;
  try

   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('delete from tmpVzrPart ');
   DM.QrEx.SQL.Add('where compname=host_name() and ');
   DM.QrEx.SQL.Add('      kod_name='+DM.qrSprPartCh.FieldByName('kod_name').AsString+' and ');
   DM.QrEx.SQL.Add('      iddoc='+IntToStr(fiddoc)+' and ');
   DM.QrEx.SQL.Add('      id_user='+IntToStr(Prm.UserID));
   DM.QrEx.SQL.Add('select 999 as Res');
   DM.QrEx.Open;

   ShowNakl;
   FilterSpis;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к списку для возврата: '+E.Message);
  end;
 end;

procedure TVozrPartF.BitBtn1Click(Sender: TObject);
 begin
  if DM.qrSprPartCh.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите сформировать возврат?',52)<>ID_YES then Exit;
  try

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spy_MakeVzrPart '+IntToStr(fiddoc)+' , '+IntToStr(Prm.UserID);
   DM.QrEx.Open;

   if DM.QrEx.FieldByName('Res').AsInteger<>998 then raise EAbort.Create('возврат не сформирован');

   ShowNakl;
   FilterSpis;

   MainF.MessBox('Возврат сформирован!',64);

  except
   on E:Exception do MainF.MessBox('Ошибка формирования возврата: '+E.Message);
  end;
 end;

end.
