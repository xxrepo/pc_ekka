unit ChooseVLU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, Util;

type
  TChooseVLF = class(TForm)
    Label1: TLabel;
    cbDtVozr: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private

  public

    DateVz:TDateTime;
    Flag:Integer;

  end;

var ChooseVLF:TChooseVLF;

implementation

uses DataModuleU, MainU;

{$R *.dfm}

procedure TChooseVLF.FormCreate(Sender: TObject);
var FServerFile,FLocalFile:String;
    DtF:TDateTime;
    i:Integer;
 begin
  Caption:=MFC;
  Flag:=0;
  try

   FServerFile:=Opt.ServerLogPath+'Vozvrat'+IntToStr(Prm.AptekaID)+'.txt';
   FLocalFile:=Opt.LogPath+'Vozvrat'+IntToStr(Prm.AptekaID)+'.txt';

   if FileExists(FServerFile) then
    begin
     DtF:=GetFileDateTime(FServerFile);
     if Prm.VSPriznak=1 then
      begin
       if DtF=Prm.VSDate then begin Flag:=1; Exit; end else Prm.VSPriznak:=0;
      end;
     DM.Qr5.Close;
     DM.Qr5.SQL.Text:='select Count(*) as cnt from SpisVozr where dtvz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DtF)+'''';
     DM.Qr5.Open;
     if DM.Qr5.FieldByName('cnt').AsInteger=0 then
      begin
       DM.ADOCo.BeginTrans;
       try
        DM.spY_MakeSpisVozr.Close;
        DM.spY_MakeSpisVozr.Parameters.ParamValues['@FName']:=FServerFile;
        DM.spY_MakeSpisVozr.Parameters.ParamValues['@DFile']:=DtF;
        DM.spY_MakeSpisVozr.ExecProc;
        if DM.spY_MakeSpisVozr.Parameters.ParamValues['@RETURN_VALUE']<>5555 then Abort;
        DM.ADOCo.CommitTrans;
       except
        DM.ADOCo.RollbackTrans;
        raise
       end;
      end;
    end;
  except
   on E:Exception do MainF.MessBox('Ошибка загрузки списка для возврата: '+E.Message);
  end;

  try
   DM.Qr5.Close;
   DM.Qr5.SQL.Text:='select DtVz from SpisVozr where IsNull(Closed,0) in (0,1)  group by DtVz order by DtVz desc';
   DM.Qr5.Open;
   cbDtVozr.Clear;
   for i:=1 to DM.Qr5.RecordCount do
    begin
     if i=1 then DM.Qr5.First else DM.Qr5.Next;
     cbDtVozr.Items.Add(DM.Qr5.FieldByName('DtVz').AsString);
    end;
   cbDtVozr.ItemIndex:=0;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования списков для возврата: '+E.Message);
  end;
 end;

procedure TChooseVLF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TChooseVLF.BitBtn1Click(Sender: TObject);
 begin
  if cbDtVozr.Items.Count=0 then begin MainF.MessBox('Список возвратов пуст!'); Exit; end;
  if cbDtVozr.ItemIndex<0 then begin MainF.MessBox('Выберите дату возврата из списка'); Exit; end;
  try
   DateVz:=StrToDateTime(cbDtVozr.Text);
   Flag:=1;
   Close;
  except
   MainF.MessBox('Ошибка преобразования даты возврата!');
  end;
 end;

end.
