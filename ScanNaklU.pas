unit ScanNaklU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, Menus, ShowTextU, DB;

type

  TScanNaklF = class(TForm)

    Panel3: TPanel;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    lbNN: TLabel;
    lbDN: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    lbSr: TLabel;
    PopupMenu1:TPopupMenu;
    N1: TMenuItem;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;

    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private

    FSr:String;
    FNN_Nakl:String;
    FDateNakl:TDateTime;
    procedure ShowNakl;
    procedure SetSr(const Value: String);
    procedure EnterKol(AC:Integer; P:Byte);
    procedure srScanNDataChange(Sender: TObject; Field: TField);

  public

    property Sr:String read FSr write SetSr;
    property NN_Nakl:String read FNN_Nakl write FNN_Nakl;
    property DateNakl:TDateTime read FDateNakl write FDateNakl;


  end;

var ScanNaklF:TScanNaklF=nil;

procedure ShowScanNakl(NN_Nakl:String; DateNakl:TDateTime);

implementation

uses MainU, DataModuleU, EnterKolScanU;

{$R *.dfm}

procedure ShowScanNakl(NN_Nakl:String; DateNakl:TDateTime);
 begin
  try
   if ScanNaklF=nil then ScanNaklF:=TScanNaklF.Create(nil);
   if (ScanNaklF.NN_Nakl<>NN_Nakl) or (ScanNaklF.DateNakl<>DateNakl) or (DM.qrScanN.IsEmpty) then
    begin
     ScanNaklF.NN_Nakl:=NN_Nakl; ScanNaklF.DateNakl:=DateNakl;
     ScanNaklF.lbNN.Caption:='Накладная №: '+NN_Nakl; ScanNaklF.lbDN.Caption:='Дата накладной: '+DateTimeToStr(DateNakl);
    end;
   ScanNaklF.ShowNakl;

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select top 1 DeliveryDate from TmpNakl where Obl=3 and nn_nakl='''+NN_Nakl+''' and date_nakl='''+FormatDateTime('yyyy-mm-dd',DateNakl)+'''';
   DM.Qr.Open;
   
   if DM.Qr.FieldByName('DeliveryDate').AsDateTime=0 then ScanNaklF.Label1.Visible:=False else
    begin
     ScanNaklF.Label1.Caption:='Дата доставки посылки: '+DM.Qr.FieldByName('DeliveryDate').AsString;
     ScanNaklF.Label1.Visible:=True;
    end;

   Application.ProcessMessages;
   ScanNaklF.ShowModal;
  except
   ScanNaklF:=nil;
   MainF.MessBox(ER_CR_FORM);
  end;
 end;

procedure TScanNaklF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
 end;

procedure TScanNaklF.ShowNakl;
var ID:Integer;
 begin
  try

   Sr:='';
   ID:=-1;
   if DM.qrScanN.Active then ID:=DM.qrScanN.FieldByName('art_code').AsInteger;
   DM.qrScanN.Close;
   DM.qrScanN.SQL.Clear;
   DM.qrScanN.SQL.Add('select a.art_code,case IsNull(a.names,'''') when '''' then (select top 1 names from Plist p (nolock) where p.art_code=a.art_code) else a.names end as names,a.kol,IsNull(b.kolscan,0) '+' as kolscan,b.typescan,b.dtscan,b.id_user,c.users,IsNull((select Max(Art_Code) from NoScan where art_code=a.Art_Code),0) as IsScan,a.kol-s.kol as ned,s.akt,a.KodUTP,a.MainEAN ');
   DM.qrScanN.SQL.Add('from  (select nn_nakl,date_nakl,art_code,names,Sum(kol) as kol,case when Obl=2 then nn_postav else '''' end as KodUTP, MainEAN from TmpNakl (nolock) where nn_nakl='''+nn_nakl+''' and date_nakl='''+FormatDateTime('yyyy-mm-dd',DateNakl)+' 00:00:00'' group by nn_nakl,date_nakl,art_code,names,case when Obl=2 then nn_postav else '''' end, MainEAN) a ');
   DM.qrScanN.SQL.Add('      left join ScanNakl b (nolock) on a.art_code=b.art_code and a.nn_nakl=b.nn_nakl and a.date_nakl=b.date_nakl left join SprUser c (nolock) on b.id_user=c.id');
   DM.qrScanN.SQL.Add('      left join Scan s (nolock) on a.art_code=s.art_code and a.nn_nakl=s.nn_nakl and a.date_nakl=s.date_nakl');
   DM.qrScanN.SQL.Add('order by 2');
//   DM.qrScanN.SQL.SaveToFile('C:\1234444.txt');
   DM.qrScanN.Open;
   DM.qrScanN.Locate('art_code',ID,[]);

  except
   on E:Exception do MainF.MessBox('Ошибка доступа к журналу сканирования накладных: '+E.Message);
  end;
 end;

procedure TScanNaklF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TScanNaklF.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key in K_ARROW_KEYS then Sr:='';
  if Key=VK_RETURN then DBGrid1DblClick(Sender);
 end;

procedure TScanNaklF.DBGrid1KeyPress(Sender:TObject; var Key:Char);
var S:String;
    Ind:Integer;
    IsFind:Boolean;
 begin
  if Sender=Nil then Exit;
  S:=Sr;
  Ind:=TDBGrid(Sender).SelectedIndex;
  if Ind>1 then Ind:=1;
  MainF.dbGKeyPress(TDBGrid(Sender),Key,S,Ind,SC_SCNAKL,1,IsFind);
  Sr:=S;
  if isFind then EnterKol(DM.qrScanN.FieldByName('art_code').AsInteger,0);
 end;

{  if DM.qrScanN.IsEmpty then Exit;
  if Key in CH_ANSI then
   begin
    Sr:=Sr+Key;
    if Length(Sr)=13 then
     try
      try
       if DM.qrScanN.FieldByName('Kol').AsInteger<=DM.qrScanN.FieldByName('KolScan').AsInteger then Abort;

       DM.Qr6.Close;
       DM.Qr6.SQL.Text:='select Max(art_code) as art_code from SprEAN where EAN13='''+Sr+'''';
       DM.Qr6.Open;

       if DM.Qr6.IsEmpty then Abort;
       AC:=DM.Qr6.FieldByName('Art_code').AsInteger;
       if DM.qrScanN.Locate('Art_code',AC,[])=False then Abort;
       EnterKol(AC,0);
      finally
       Sr:='';
      end;
     except
      Sr:='';
     end;
   end;
}

procedure TScanNaklF.SetSr(const Value: String);
 begin
  FSr:=Value;
  lbSr.Caption:=Value;
 end;

procedure TScanNaklF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
    dR,sR:TRect;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  if db.DataSource.DataSet.FieldByName('Kol').AsInteger=db.DataSource.DataSet.FieldByName('KolScan').AsInteger then db.Canvas.Brush.Color:=clLime;
  if (db.DataSource.DataSet.FieldByName('Kol').AsInteger>db.DataSource.DataSet.FieldByName('KolScan').AsInteger) and
     (db.DataSource.DataSet.FieldByName('KolScan').AsInteger<>0) then db.Canvas.Brush.Color:=clYellow;
  if db.DataSource.DataSet.FieldByName('Kol').AsInteger<db.DataSource.DataSet.FieldByName('KolScan').AsInteger then db.Canvas.Brush.Color:=$008080FF;

  if (db.DataSource.DataSet.FieldByName('IsScan').AsInteger<>0) and(DataCol=0) then
   begin
    db.Canvas.Brush.Color:=$00FFD98A;
    db.Canvas.Font.Color:=clBlack;
   end;

  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);

  {--- Рисование значка "Разрешенные для несканирования"}
  if (db.DataSource.DataSet.FieldByName('IsScan').AsInteger<>0) and (DataCol=0) then
   begin
    dR:=Rect;
    dr.Left:=dr.Left+2; dr.Top:=dr.Top+2;
    dr.Right:=dR.Left+MainF.imNoScan.Width; dr.Bottom:=dR.Top+MainF.imNoScan.Height;
    sR.Left:=0; sR.Top:=0;
    sR.Right:=MainF.imNoScan.Width; sR.Bottom:=MainF.imNoScan.Height;
    db.Canvas.CopyRect(dR,MainF.imNoScan.Canvas,sR);
   end;

 end;

procedure TScanNaklF.DBGrid1DblClick(Sender:TObject);
 begin
  try
   if DM.qrScanN.IsEmpty then Exit;
   EnterKol(DM.qrScanN.FieldByName('Art_Code').AsInteger,1);
  except
   on E:Exception do MainF.MessBox('Ошибка записи в журнал сканирования накладных: '+E.Message);
  end;
 end;

procedure TScanNaklF.EnterKol(AC:Integer; P:Byte);
var Kol,TP:Integer;
 begin
  DM.Qr6.Close;
  DM.Qr6.SQL.Text:='select dbo.GetKoefUpak('+IntToStr(AC)+') as Koef';
  DM.Qr6.Open;

  EnterKolScanF:=TEnterKolScanF.Create(Self);
  try
   Kol:=DM.Qr6.FieldByName('Koef').AsInteger;
   EnterKolScanF.Label2.Caption:=DM.qrScanN.FieldByName('Names').AsString;
   if Kol<DM.qrScanN.FieldByName('Kol').AsInteger-DM.qrScanN.FieldByName('KolScan').AsInteger then
    EnterKolScanF.edKol.Text:=IntToStr(Kol)
   else
    EnterKolScanF.edKol.Text:=IntToStr(DM.qrScanN.FieldByName('Kol').AsInteger-DM.qrScanN.FieldByName('KolScan').AsInteger);

   if P=1 then
    begin
     EnterKolScanF.cbHand.Checked:=True;
     EnterKolScanF.cbHand.Enabled:=False;
    end;

   Application.ProcessMessages;
   EnterKolScanF.ShowModal;
   if EnterKolScanF.Flag<>1 then Exit;

   Kol:=StrToInt(EnterKolScanF.edKol.Text);
   if P=1 then TP:=3 else
    begin
     TP:=1;
     if EnterKolScanF.cbHand.Checked then TP:=2;
    end;
   DM.Qr6.Close;
   DM.Qr6.SQL.Clear;
   DM.Qr6.SQL.Add('declare @ks int');
   DM.Qr6.SQL.Add('set @ks=IsNull((select Sum(KolScan) from ScanNakl where nn_nakl='''+nn_nakl+''' and date_nakl='''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'' and art_code='+IntToStr(AC)+'),0)');
   DM.Qr6.SQL.Add('delete from ScanNakl where nn_nakl='''+nn_nakl+''' and date_nakl='''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'' and art_code='+IntToStr(AC));
   DM.Qr6.SQL.Add('insert into ScanNakl(nn_nakl,date_nakl,art_code,kolscan,typescan,id_user) values(');
   DM.Qr6.SQL.Add(''''+nn_nakl+''',');
   DM.Qr6.SQL.Add(''''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'',');
   DM.Qr6.SQL.Add(IntToStr(AC)+',');
   DM.Qr6.SQL.Add(IntToStr(Kol)+'+@ks,');
   DM.Qr6.SQL.Add(IntToStr(TP)+',');
   DM.Qr6.SQL.Add(IntToStr(Prm.UserID)+')');
//   DM.Qr6.SQL.SaveToFile('c:\scan.txt');
   DM.Qr6.ExecSQL;
  finally
   ShowNakl;
   Sr:='';
   EnterKolScanF.Free;
  end;
 end;

procedure TScanNaklF.FormActivate(Sender:TObject);
 begin
  DBGrid1.DataSource.OnDataChange:=srScanNDataChange;
  DBGrid1.SetFocus;
 end;

procedure TScanNaklF.N1Click(Sender:TObject);
 begin
  if DM.qrScanN.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите очистить строку?',52)<>ID_YES then Exit;
  try
   DM.Qr6.Close;
   DM.Qr6.SQL.Text:='delete from ScanNakl where nn_nakl='''+nn_nakl+''' and date_nakl='''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'' and art_code='+DM.qrScanN.FieldByName('art_code').AsString;
   DM.Qr6.ExecSQL;
   ShowNakl;
  except
   on E:Exception do MainF.MessBox('Ошибка очистки строки: '+E.Message);
  end;
 end;

procedure TScanNaklF.BitBtn1Click(Sender: TObject);
 begin
  ShowNakl;
 end;

procedure TScanNaklF.BitBtn3Click(Sender: TObject);
var i:Integer;
    S:String;
 begin

  if DM.qrScanN.IsEmpty then Exit;

  DM.QrEx.Close;
  DM.QrEx.SQL.Clear;

  DM.QrEx.SQL.Add('select distinct n.NumBox ');
  DM.QrEx.SQL.Add('from NaklBox n (nolock) ');
  DM.QrEx.SQL.Add('where nn_nakl='''+FNN_Nakl+''' and ');
  DM.QrEx.SQL.Add('      date_nakl='''+FormatDateTime('yyyy-mm-dd',FDateNakl)+''' and ');
  DM.QrEx.SQL.Add('      art_code='+DM.qrScanN.FieldByName('art_code').AsString);
  DM.QrEx.SQL.Add('order by 1 ');

  DM.QrEx.Open;

  if DM.QrEx.IsEmpty then
   begin
    MainF.MessBox('Номера ящиков неизвестны!');
    Exit;
   end else
  if DM.QrEx.RecordCount=1 then
   S:=DM.qrScanN.FieldByName('names').AsString+' лежит в ящике: '+#10#10
  else
   S:=DM.qrScanN.FieldByName('names').AsString+' лежит в ящиках: '+#10#10;

  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    S:=S+'     '+DM.QrEx.FieldByName('numbox').AsString+#10;
   end;
  ShowText(S);
 end;

procedure TScanNaklF.srScanNDataChange(Sender:TObject; Field:TField);
 begin
  DM.qrSeriaArt.Close;
  if DM.qrScanN.IsEmpty then Exit;
  DM.qrSeriaArt.SQL.Text:='exec spY_ShowSeriaForArt '''+nn_nakl+''','''+FormatDateTime('yyyy-mm-dd',DateNakl)+''','+DM.qrScanN.FieldByName('art_code').AsString;
  DM.qrSeriaArt.Open;

  Label2.Visible:=False;
  if DM.qrScanN.FieldByName('KodUTP').AsString<>'' then
   begin
    Label2.Caption:='Код ТМЦ: '+DM.qrScanN.FieldByName('KodUTP').AsString;
    Label2.Visible:=True;
   end;

  Label3.Visible:=False;
  if DM.qrScanN.FieldByName('MainEAN').AsString<>'' then
   begin
    Label3.Caption:='Штрихкод ТМЦ: '+DM.qrScanN.FieldByName('MainEAN').AsString;
    Label3.Visible:=True;
   end;
 end;

procedure TScanNaklF.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  DBGrid1.DataSource.OnDataChange:=nil;
 end;

end.
