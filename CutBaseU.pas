unit CutBaseU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DateUtils;

type
  TCutBaseF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    dtCut: TDateTimePicker;
    Image1: TImage;
    BitBtn8: TBitBtn;
    Panel2: TPanel;
    Image2: TImage;
    BitBtn1: TBitBtn;
    lb2: TLabel;
    lb3: TLabel;
    lb4: TLabel;
    lb1: TLabel;
    lb5: TLabel;
    pbCut: TProgressBar;
    lbPerc: TLabel;
    ok1: TImage;
    lb6: TLabel;
    er1: TImage;
    er2: TImage;
    ok2: TImage;
    er3: TImage;
    ok3: TImage;
    ok4: TImage;
    er4: TImage;
    er5: TImage;
    ok5: TImage;
    er6: TImage;
    ok6: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private

    procedure ClearStatus;
    procedure DoStep(N:Integer);

  public

  end;

var CutBaseF:TCutBaseF;

const N=6;

implementation

uses MainU, DataModuleU, ShareU;

{$R *.dfm}

procedure TCutBaseF.FormCreate(Sender:TObject);
var i:Integer;
 begin
  Caption:=MFC;
  dtCut.Date:=StartOfTheMonth(Date);
  ClearStatus;
  for i:=2 to N do
   begin
    TImage(FindComponent('ok'+IntToStr(i))).Picture.Assign(ok1.Picture);
    TImage(FindComponent('er'+IntToStr(i))).Picture.Assign(er1.Picture);
   end;
 end;

procedure TCutBaseF.BitBtn8Click(Sender:TObject);
 begin
  Close;
 end;

procedure TCutBaseF.ClearStatus;
var i:Integer;
 begin
  for i:=1 to N do
   begin
    TImage(FindComponent('ok'+IntToStr(i))).Visible:=False;
    TImage(FindComponent('er'+IntToStr(i))).Visible:=False;
    TLabel(FindComponent('lb'+IntToStr(i))).Font.Color:=clBlack;
    TLabel(FindComponent('lb'+IntToStr(i))).Font.Style:=[];
    pbCut.Max:=N;
    pbCut.Min:=0;
    pbCut.Position:=0;
    lbPerc.Caption:='0 %';
   end;
 end;

procedure TCutBaseF.DoStep(N:Integer);
var i:Integer;
 begin
  Case N of
   1:begin
{      DM.Qr.Close;
      DM.Qr.SQL.Text:='select * from Chek';
      DM.Qr.Open;
      if Not DM.Qr.IsEmpty then raise EAbort.Create('Чек не пустой! Архивирование невозможно!');
}
     end;
   2:begin
{
      DM.spY_CheckOst.Close;
      DM.spY_CheckOst.ExecProc;
      if DM.spY_CheckOst.Parameters.ParamValues['@RETURN_VALUE']<>1 then
       raise EAbort.Create('База расходиться! Архивирование невозможно!');
}
     end;
   3:begin
      if Not UnLoadBase(DM.Qr,'',True,'_'+FormatDateTime('yyyymmdd_hhnnss',Now)) then
       raise EAbort.Create('Резервная копия не создана! Архивирование невозможно!');
     end;
   4:begin
      DM.ADOCo.BeginTrans;
      try
       DM.spY_CutBase.Close;
       DM.spY_CutBase.Parameters.ParamValues['@ObrD']:=dtCut.Date;
       DM.spY_CutBase.ExecProc;
       if DM.spY_CutBase.Parameters.ParamValues['@RETURN_VALUE']<>1000 then
        raise EAbort.Create('Архивирование завершено с ошибками! Разверните резервную копию базы и попробуйте еще раз!');
       DM.ADOCo.CommitTrans;
      except
       DM.Qr.Close;
       DM.Qr.SQL.Clear;
       DM.Qr.SQL.Add('select @i=1 from ArhCheks (TABLOCK HOLDLOCK) where 0=1');
       DM.Qr.SQL.Add('select @i=1 from Moves (TABLOCK HOLDLOCK) where 0=1');
       DM.Qr.SQL.Add('select @i=1 from JMoves (TABLOCK HOLDLOCK) where 0=1');
       DM.Qr.SQL.Add('select @i=1 from SprTov (TABLOCK HOLDLOCK) where 0=1');
       DM.Qr.Open;
       DM.ADOCo.RollbackTrans;
       raise;
      end;
     end;
   5:begin
      er5.Hint:='';
      DM.spY_CheckBase.Close;
      DM.spY_CheckBase.Parameters.ParamValues['@dt7']:=dtCut.Date;
      DM.spY_CheckBase.Parameters.ParamValues['@dt1']:=StrToDate(DateToStr(Date-1));
      DM.spY_CheckBase.Parameters.ParamValues['@iduser']:=Prm.UserID;
      DM.spY_CheckBase.Open;
      for i:=1 to DM.spY_CheckBase.RecordCount do
       begin
        if i=1 then DM.spY_CheckBase.First else DM.spY_CheckBase.Next;
        if DM.spY_CheckBase.FieldByName('Descr').AsString='Период' then Continue;
        if DM.spY_CheckBase.FieldByName('Value').AsString<>'OK' then
         er5.Hint:=er5.Hint+DM.spY_CheckBase.FieldByName('Value').AsString+#10;
       end;
      if er5.Hint<>'' then 
       raise EAbort.Create('После архивации база расходиться! Разверните резервную копию базы и попробуйте еще раз!');
     end;
   6:begin
      {DM.Qr.Close;
      DM.Qr.SQL.Text:='select * from SprIP';
      DM.Qr.Open;
      for i:=1 to DM.Qr.RecordCount do
       begin
        if i=1 then DM.Qr.First else DM.Qr.Next;

       end;}
     end;
  end;
 end;

procedure TCutBaseF.BitBtn1Click(Sender:TObject);
var i,q:Integer;
    T:TDateTime;
 begin
  if MainF.MessBox('Вы действительно хотите произвести архивацию базы?',52)<>ID_YES then Exit;
  T:=Time;
  q:=1;
  try
   ClearStatus;
   for i:=1 to N do
    begin
     q:=i;
     TLabel(FindComponent('lb'+IntToStr(q))).Font.Style:=[fsBold];
     Application.ProcessMessages;
     DoStep(q);
     TImage(FindComponent('ok'+IntToStr(q))).Visible:=True;
     TLabel(FindComponent('lb'+IntToStr(q))).Font.Style:=[];
     TLabel(FindComponent('lb'+IntToStr(q))).Font.Color:=clBlue;
     pbCut.Position:=q;
     lbPerc.Caption:=IntToSTr(Round(pbCut.Position*100/pbCut.Max))+' %';
     Application.ProcessMessages;
    end;
   MainF.MessBox('Архивация произведена успешно! Затрачено времени: '+TimeToStr(Abs(T-Time)),64);
  except
   on E:Exception do
    begin
     TImage(FindComponent('er'+IntToStr(q))).Visible:=True;
     TLabel(FindComponent('lb'+IntToStr(q))).Font.Style:=[];
     TLabel(FindComponent('lb'+IntToStr(q))).Font.Color:=clRed;
     MainF.MessBox(E.Message);
    end;
  end;
 end;

end.
