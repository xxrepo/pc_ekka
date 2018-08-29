unit ShowMessU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, ExtCtrls, Buttons, Grids, DBGrids;

type
  TShowMessF = class(TForm)
    Splitter1: TSplitter;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    reW: TRichEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tmMess: TTimer;
    lbName: TLabel;
    DBGrid1: TDBGrid;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure tmMessTimer(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);

  private

    FID_Dest:Integer;

    procedure ShowAllMess(Param:Byte=0);

  public

    property ID_Dest:Integer read FID_Dest write FID_Dest;

  end;

var ShowMessF:TShowMessF;

implementation

uses MainU, Apteks, DataModuleU, ShowJMessU, HistoryMessJU;

{$R *.dfm}

procedure TShowMessF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
 end;

procedure TShowMessF.FormActivate(Sender:TObject);
 begin
  ShowAllMess;
  reW.SetFocus;
 end;

procedure TShowMessF.ShowAllMess(Param:Byte=0);
var Done,i:Integer;
    S,Nm:String;
 begin
  try
   DM.qrMess.Close;
   DM.qrMess.SQL.Clear;
   DM.qrMess.SQL.Add('select *,(select Max(users) from SprUser a where a.id_gamma=b.id_user) as users');
   DM.qrMess.SQL.Add('from Inform..JMessOffice b');
   DM.qrMess.SQL.Add('where id_dest in ('+IntToStr(ID_Dest)+','+IntToStr(Prm.ID_Gamma)+') and ');
   if Param=0 then 
    DM.qrMess.SQL.Add('      DateM>getdate()-15 and');
   DM.qrMess.SQL.Add('      id_user in ('+IntToStr(ID_Dest)+','+IntToStr(Prm.ID_Gamma)+') order by ID');
   DM.qrMess.Open;
   DM.qrMess.Last;
   if Param=0 then
    try
     DM.QrEx.Close;
     DM.QrEx.SQL.Clear;
     DM.QrEx.SQL.Add('update Inform..JMessOffice set Done=1 where IsNull(Done,0)<>1 and id_dest='+IntToStr(Prm.ID_Gamma));
     DM.QrEx.ExecSQL;
    except
    end;
  except
  end;
 end;

procedure TShowMessF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TShowMessF.BitBtn1Click(Sender:TObject);
 begin
{  if Application.MessageBox('Очистить историю сообщений?',PChar(MFC),52)<>ID_YES then Exit;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('delete from Inform..JMessOffice ');
   DM.QrEx.SQL.Add('where id_dest in ('+IntToStr(ID_Dest)+','+IntToStr(Prm.ID_Gamma)+') and ');
   DM.QrEx.SQL.Add('      id_user in ('+IntToStr(ID_Dest)+','+IntToStr(Prm.ID_Gamma)+')');
   DM.QrEx.ExecSQL;
   ShowAllMess;
  except
   Application.MessageBox('Ошибка удаления истории сообщений!',PChar(MFC),48);
  end;
}
 end;

procedure TShowMessF.BitBtn3Click(Sender: TObject);
 begin
  try
   DM.spY_WriteMessToOffice.Close;
   DM.spY_WriteMessToOffice.Parameters.ParamValues['@Mess']:=reW.Text;
   DM.spY_WriteMessToOffice.Parameters.ParamValues['@id_dest']:=ID_Dest;
   DM.spY_WriteMessToOffice.Parameters.ParamValues['@id_user']:=Prm.ID_Gamma;
   DM.spY_WriteMessToOffice.ExecProc;
   ShowAllMess;
   reW.SetFocus;
   reW.Text:='';
  except
   Application.MessageBox('Ошибка отправки сообщений!',PChar(MFC),48);
  end;
 end;

procedure TShowMessF.tmMessTimer(Sender: TObject);
 begin
  tmMess.Enabled:=False;
  try
   ShowAllMess;
  finally
   tmMess.Enabled:=True;
  end;
 end;

procedure TShowMessF.DBGrid1DrawColumnCell(Sender:TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if DataCol=0 then db.Canvas.Font.Style:=[fsBold];
  if DataCol=1 then
   begin
    if db.DataSource.DataSet.FieldByName('ID_User').AsInteger=ID_Dest then db.Canvas.Font.Color:=clBlue
                                                                      else db.Canvas.Font.Color:=clGreen;
    if db.DataSource.DataSet.FieldByName('Done').AsInteger=0 then db.Canvas.Font.Style:=[] else db.Canvas.Font.Style:=[fsBold];
   end;

  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure TShowMessF.DBGrid1DblClick(Sender: TObject);
 begin
  if DM.qrMess.IsEmpty then Exit;
  try
   ShowJMessF:=TShowJMessF.Create(Self);
   try
    ShowJMessF.mmMess.Lines.Text:=DM.qrMess.FieldByName('Mess').AsString;
    Application.ProcessMessages;
    ShowJMessF.ShowModal;
   finally
    ShowJMessF.Free;
   end;
  except
   MainF.MessBox(ER_CR_FORM);
  end;
 end;

procedure TShowMessF.BitBtn4Click(Sender: TObject);
 begin
  DBGrid1DblClick(nil);
 end;

procedure TShowMessF.BitBtn5Click(Sender: TObject);
 begin
  try
   tmMess.Enabled:=False;
   DBGrid1.Visible:=False;
   try
    HistoryMessJF:=THistoryMessJF.Create(Self);
    try
     ShowAllMess(1);
     Application.ProcessMessages;
     HistoryMessJF.ShowModal;
    finally
     HistoryMessJF.Free;
    end;
   except
    MainF.MessBox(ER_CR_FORM);
   end;
  finally
   DBGrid1.Visible:=True;
   tmMess.Enabled:=True;
  end;
 end;

end.
