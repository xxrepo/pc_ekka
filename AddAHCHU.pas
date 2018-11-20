unit AddAHCHU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, DBCtrls, EnterValueU;

type

  TAddAHCHF = class(TForm)

    Label1: TLabel;
    Bevel1: TBevel;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    SpeedButton3: TSpeedButton;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private

    procedure ShowReq;

  public

    atID:String;

  end;

var AddAHCHF:TAddAHCHF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TAddAHCHF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TAddAHCHF.BitBtn4Click(Sender: TObject);
 begin
  Close;
 end;

procedure TAddAHCHF.SpeedButton3Click(Sender: TObject);
 begin
  if DM.qrAhchR.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите очистить заявку?',52)<>ID_YES then Exit;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spY_Ahch_Req '+IntToStr(Prm.id_gamma)+',3 select 985 as Res';
   DM.QrEx.Open;
   ShowReq
  except
   on E:Exception do
    MainF.RegisterError('Ошибка очистки заявки: ',E.Message,True);
  end;

 end;

procedure TAddAHCHF.ShowReq;
 begin
  DM.qrAhchR.Close;
  DM.qrAhchR.SQL.Text:='exec spY_Ahch_Req '+IntToStr(Prm.id_gamma)+',5';
  DM.qrAhchR.Open;
 end;

procedure TAddAHCHF.SpeedButton2Click(Sender: TObject);
var sDescr:String;
 begin
  if DM.qrAhchV.IsEmpty then Exit;
  if EnterStrValue(sDescr,'Введите комментарий к виду работы!')=False then Exit;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spY_Ahch_Req '+IntToStr(Prm.id_gamma)+',1,'''+atID+''','''+DM.qrAhchV.FieldByName('id').AsString+''','''+sDescr+''' select 987 as Res';
   DM.QrEx.Open;
   ShowReq
  except
   on E:Exception do
    MainF.RegisterError('Ошибка добавления вида работы: ',E.Message,True);
  end;
 end;

procedure TAddAHCHF.SpeedButton1Click(Sender: TObject);
 begin
  if DM.qrAhchR.IsEmpty then Exit;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spY_Ahch_Req '+IntToStr(Prm.id_gamma)+',2,null,null,null,'''+DM.qrAhchR.FieldByName('id').AsString+''' select 987 as Res';
   DM.QrEx.Open;
   ShowReq
  except
   on E:Exception do
    MainF.RegisterError('Ошибка удаления вида работы: ',E.Message,True);
  end;
 end;

procedure TAddAHCHF.FormActivate(Sender: TObject);
 begin
  ShowReq;
 end;

procedure TAddAHCHF.BitBtn1Click(Sender:TObject);
 begin
  if DM.qrAhchR.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите отправить заявку?',52)<>ID_YES then Exit;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spY_Ahch_Req '+IntToStr(Prm.id_gamma)+',4 select 987 as Res';
   DM.QrEx.Open;
   ShowReq;
   MainF.MessBox('Заявка сформирована!',64);
   Close;
  except
   on E:Exception do
    MainF.RegisterError('Ошибка формирования заявки: ',E.Message,True);
  end;
 end;

end.
