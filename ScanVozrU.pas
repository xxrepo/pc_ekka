unit ScanVozrU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, Menus, PrintReport, Util;

type

  TScanVozrF = class(TForm)

    Panel3: TPanel;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    lbDN: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    lbSr: TLabel;
    PopupMenu1:TPopupMenu;
    N1: TMenuItem;
    BitBtn1: TBitBtn;
    bbBack: TBitBtn;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    bbCloseBox: TBitBtn;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    N2: TMenuItem;

    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift:TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bbBackClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure bbCloseBoxClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);

  private

    FSr:String;
    FNN_Nakl:String;
    FDateNakl:TDateTime;
    FReadOnly:Boolean;
    procedure ShowNakl;
    procedure SetSr(const Value: String);
    procedure EnterKol(AC:Integer; P:Byte);


  public

    property Sr:String read FSr write SetSr;
    property NN_Nakl:String read FNN_Nakl write FNN_Nakl;
    property DateNakl:TDateTime read FDateNakl write FDateNakl;

  end;

var ScanVozrF:TScanVozrF=nil;

procedure ShowScanVozr(DateNakl:TDateTime);

implementation

uses MainU, DataModuleU, EnterKolScanU, ShareU;

{$R *.dfm}

function PrVozrToInd(P:Integer):Integer;
 begin
  Case P of
   3:Result:=1;
   5:Result:=2 else Result:=0;
  end;
 end;

function IndToPrVozr(P:Integer):Integer;
 begin
  Case P of
   1:Result:=3;
   2:Result:=5 else Result:=12;
  end;
 end;

procedure ShowScanVozr(DateNakl:TDateTime);
 begin
  try
   if ScanVozrF=nil then ScanVozrF:=TScanVozrF.Create(nil);
   ScanVozrF.DateNakl:=DateNakl;
   ScanVozrF.lbDN.Caption:='Дата накладной: '+DateTimeToStr(DateNakl);

   DM.Qr5.Close;
   DM.Qr5.SQL.Text:='select top 1 Closed from SpisVozr where IsNull(kolscan,0)+IsNull(kolscanb,0)>0 and  DtVz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+'''';
   DM.Qr5.Open;
   ScanVozrF.FReadOnly:=DM.Qr5.FieldByName('Closed').AsInteger=2;
   ScanVozrF.bbBack.Enabled:=Not ScanVozrF.FReadOnly;

   DM.Qr5.Close;
   DM.Qr5.SQL.Text:='select top 1 Priznak from SpisVozr where ((IsNull(kolscan,0)>0 and IsNull(box,0)=0) or (IsNull(kolscanb,0)>0 and IsNull(boxb,0)=0))  and DtVz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+'''';
   DM.Qr5.Open;
   if DM.Qr5.IsEmpty then ScanVozrF.ComboBox1.ItemIndex:=-1
                     else ScanVozrF.ComboBox1.ItemIndex:=PrVozrToInd(DM.Qr5.FieldByName('Priznak').AsInteger);

   ScanVozrF.ShowNakl;
   Application.ProcessMessages;
   ScanVozrF.ShowModal;
  except
   ScanVozrF:=nil;
   MainF.MessBox(ER_CR_FORM);
  end;
 end;

procedure TScanVozrF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
 end;

procedure TScanVozrF.ShowNakl;
var ID:Integer;
 begin
  try
   Sr:='';
   ID:=-1;
   if DM.qrScanN.Active then ID:=DM.qrScanN.FieldByName('art_code').AsInteger;
   DM.Qr5.Close;
   DM.Qr5.SQL.Clear;
   DM.Qr5.SQL.Add('select Count(*) as Cnt ');
   DM.Qr5.SQL.Add('from  SpisVozr a ');
   DM.Qr5.SQL.Add('where IsNull(kolscan,0)+IsNull(kolscanb,0)=0 and a.dtvz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DateNakl)+'''');
   DM.Qr5.Open;
   Label1.Caption:='Осталось отсканировать: '+DM.Qr5.FieldByName('Cnt').AsString+' наименований.';

   DM.qrScanN.Close;
   DM.qrScanN.SQL.Clear;
   DM.qrScanN.SQL.Add('select a.Closed,a.art_code,b.names,a.kol,IsNull(a.kolscan,0) as kolscan,IsNull(a.kolscanb,0) as kolscanb,a.typescan,a.dtscan,a.id_user,IsNull((select Max(Art_Code) from NoScan where art_code=a.Art_Code),0) as IsScan,Box,BoxB,');
   DM.qrScanN.SQL.Add('(case a.Priznak when 3 then ''Брак'' when 5 then ''Карантин'' else ''Хороший'' end) as Descr, ');
   DM.qrScanN.SQL.Add('(case v.Gr when 1 then ''Белостоцкий'' else ''Каркача'' end) as Sklad ');
   DM.qrScanN.SQL.Add('from  SpisVozr a left join SprVGr v on a.art_code=v.art_code, ');
   DM.qrScanN.SQL.Add('      (select art_code,names from SprTov group by art_code,names) b ');
   DM.qrScanN.SQL.Add('where a.art_code=b.art_code and a.dtvz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DateNakl)+'''');
   if CheckBox1.Checked then
    DM.qrScanN.SQL.Add(' and a.kol<>IsNull(a.kolscan,0)+IsNull(a.kolscanb,0)');
   DM.qrScanN.SQL.Add('order by b.names');

{
   DM.qrScanN.SQL.Add('select a.art_code,a.names,a.kol,IsNull(b.kolscan,0) as kolscan,b.typescan,b.dtscan,b.id_user,c.users,IsNull((select Max(Art_Code) from NoScan where art_code=a.Art_Code),0) as IsScan,a.kol-s.kol as ned,s.akt');
   DM.qrScanN.SQL.Add('from  (select nn_nakl,date_nakl,art_code,names,Sum(kol) as kol from TmpNakl where nn_nakl='''+nn_nakl+''' and date_nakl='''+FormatDateTime('yyyy-mm-dd',DateNakl)+' 00:00:00'' group by nn_nakl,date_nakl,art_code,names) a ');
   DM.qrScanN.SQL.Add('      left join ScanVozr b on a.art_code=b.art_code and a.nn_nakl=b.nn_nakl and a.date_nakl=b.date_nakl left join SprUser c on b.id_user=c.id');
   DM.qrScanN.SQL.Add('      left join Scan s on a.art_code=s.art_code and a.nn_nakl=s.nn_nakl and a.date_nakl=s.date_nakl');
   DM.qrScanN.SQL.Add('order by 2');
}
 //  DM.qrScanN.SQL.SaveToFile('C:\1234444.txt');
   DM.qrScanN.Open;
   DM.qrScanN.Locate('art_code',ID,[]);

   DM.Qr5.Close;
   DM.Qr5.SQL.Clear;
   DM.Qr5.SQL.Add('select Count(*) as Cnt ');
   DM.Qr5.SQL.Add('from  SpisVozr a ');
   DM.Qr5.SQL.Add('where ((IsNull(kolscan,0)>0 and IsNull(Box,0)=0) or (IsNull(kolscanb,0)>0 and IsNull(BoxB,0)=0)) and a.dtvz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DateNakl)+'''');
//   DM.Qr5.SQL.SaveToFile('C:\ClBoxes.txt');
   DM.Qr5.Open;

//   ComboBox1.Enabled:=DM.Qr5.FieldByName('Cnt').AsInteger=0;
   ComboBox1.ItemIndex:=0;
   ComboBox1.Enabled:=False;
   BitBtn3.Enabled:=DM.qrScanN.FieldByName('Closed').AsInteger=2;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к журналу сканирования накладных: '+E.Message);
  end;
 end;

procedure TScanVozrF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TScanVozrF.DBGrid1KeyDown(Sender:TObject; var Key: Word; Shift:TShiftState);
 begin
  if Key in K_ARROW_KEYS then Sr:='';
  if Key=VK_RETURN then DBGrid1DblClick(Sender);

 end;

procedure TScanVozrF.DBGrid1KeyPress(Sender:TObject; var Key:Char);
var S:String;
    Ind:Integer;
    IsFind:Boolean;
 begin
  if Sender=Nil then Exit;
//  if FReadOnly then Exit;
  S:=Sr;
  Ind:=TDBGrid(Sender).SelectedIndex;
  if Ind>1 then Ind:=1;
  MainF.dbGKeyPress(TDBGrid(Sender),Key,S,Ind,SC_SPIS,1,IsFind);
  Sr:=S;
  if isFind then
   begin
   if FReadOnly then MainF.MessBox('Возврат уже сформирован. Дальнейшее сканирование невозможно!')
                else EnterKol(DM.qrScanN.FieldByName('art_code').AsInteger,0);
   end;
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

procedure TScanVozrF.SetSr(const Value: String);
 begin
  FSr:=Value;
  lbSr.Caption:=Value;
 end;

procedure TScanVozrF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
    dR,sR:TRect;
    kolScan:Integer;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  KolScan:=db.DataSource.DataSet.FieldByName('KolScan').AsInteger+db.DataSource.DataSet.FieldByName('KolScanB').AsInteger;
  if db.DataSource.DataSet.FieldByName('Kol').AsInteger=KolScan then db.Canvas.Brush.Color:=clLime;
  if (db.DataSource.DataSet.FieldByName('Kol').AsInteger>KolScan) and (KolScan<>0) then db.Canvas.Brush.Color:=clYellow;
  if db.DataSource.DataSet.FieldByName('Kol').AsInteger<KolScan then db.Canvas.Brush.Color:=$008080FF;

  if (db.DataSource.DataSet.FieldByName('IsScan').AsInteger<>0) and(DataCol=0) then
   begin
    db.Canvas.Brush.Color:=$00FFD98;
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

procedure TScanVozrF.DBGrid1DblClick(Sender:TObject);
 begin
  try
   if FReadOnly then Exit;
   if DM.qrScanN.IsEmpty then Exit;
   EnterKol(DM.qrScanN.FieldByName('Art_Code').AsInteger,1);
  except
   on E:Exception do MainF.MessBox('Ошибка записи в журнал сканирования накладных: '+E.Message);
  end;
 end;

procedure TScanVozrF.EnterKol(AC:Integer; P:Byte);
var Kol,TP:Integer;
 begin
  if ComboBox1.ItemIndex=-1 then
   begin
    MainF.MessBox('Выберите тип товара из списка!');
    ComboBox1.SetFocus;
    Exit;
   end;

  DM.Qr6.Close;
  DM.Qr6.SQL.Text:='select Sum(t.kol) as kol from DhRes h, DtRes t where h.idres=t.idres and h.closed=0 and t.kol>0 and t.art_code='+IntToStr(AC);
  DM.Qr6.Open;

  if DM.Qr6.FieldByName('kol').AsInteger>0 then
   begin
    MainF.MessBox('Позиция "'+DM.qrScanN.FieldByName('Names').AsString+'" забронирована в количестве '+DM.Qr6.FieldByName('kol').AsString
                 +#10#10'Пока позиция забронирована, в возврат она может не попасть! Обращайтесь в Call-Center. ');
   end;

  DM.Qr6.Close;
  DM.Qr6.SQL.Text:='select dbo.GetKoefUpak('+IntToStr(AC)+') as Koef';
  DM.Qr6.Open;

  EnterKolScanF:=TEnterKolScanF.Create(Self);
  try
   Kol:=DM.Qr6.FieldByName('Koef').AsInteger;
   EnterKolScanF.Label2.Caption:=DM.qrScanN.FieldByName('Names').AsString;
   if Kol<DM.qrScanN.FieldByName('Kol').AsInteger-(DM.qrScanN.FieldByName('KolScan').AsInteger+DM.qrScanN.FieldByName('KolScanB').AsInteger) then
    EnterKolScanF.edKol.Text:=IntToStr(Kol)
   else
    EnterKolScanF.edKol.Text:=IntToStr(DM.qrScanN.FieldByName('Kol').AsInteger-(DM.qrScanN.FieldByName('KolScan').AsInteger+DM.qrScanN.FieldByName('KolScanB').AsInteger));

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
//   DM.Qr6.SQL.Add('declare @ks int');
//   DM.Qr6.SQL.Add('set @ks=IsNull((select Sum(KolScan) from Spis where dtvz='''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'' and art_code='+IntToStr(AC)+'),0)');

   DM.Qr6.SQL.Add('update SpisVozr set');
   Case ComboBox1.ItemIndex of
    0:DM.Qr6.SQL.Add('KolScan=IsNull(KolScan,0)+ '+IntToStr(Kol)+',');
    1:DM.Qr6.SQL.Add('KolScanB=IsNull(KolScanB,0)+ '+IntToStr(Kol)+',');
   end;
   DM.Qr6.SQL.Add('priznak='+IntToStr(IndToPrVozr(ComboBox1.ItemIndex))+',');
   DM.Qr6.SQL.Add('typescan='+IntToStr(TP)+',');
   DM.Qr6.SQL.Add('id_user='+IntToStr(Prm.UserID)+',');
   DM.Qr6.SQL.Add('dtscan=getdate() ');

   DM.Qr6.SQL.Add('where art_code='+IntToStr(AC)+' and dtvz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',datenakl)+''' ');
//   DM.Qr6.SaveToFile('C:\SpisVozr.txt');
   DM.Qr6.ExecSQL;

  finally
   ShowNakl;
   Sr:='';
   EnterKolScanF.Free;
  end;
 end;

procedure TScanVozrF.FormActivate(Sender:TObject);
 begin
  DBGrid1.SetFocus;
 end;

procedure TScanVozrF.N1Click(Sender:TObject);
 begin
  if Not Assigned(Sender) then Exit;
  if FReadOnly then Exit;
  if DM.qrScanN.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите очистить строку?',52)<>ID_YES then Exit;
  try
   DM.Qr6.Close;

   Case TMenuItem(Sender).Tag of
    1:DM.Qr6.SQL.Text:='update SpisVozr set kolscan=0,box=null where dtvz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',datenakl)+''' and art_code='+DM.qrScanN.FieldByName('art_code').AsString;
    2:DM.Qr6.SQL.Text:='update SpisVozr set kolscanb=0,boxb=null where dtvz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',datenakl)+''' and art_code='+DM.qrScanN.FieldByName('art_code').AsString;
   end;

   DM.Qr6.ExecSQL;
   ShowNakl;
  except
   on E:Exception do MainF.MessBox('Ошибка очистки строки: '+E.Message);
  end;
 end;

procedure TScanVozrF.BitBtn1Click(Sender:TObject);
 begin
  ShowNakl;
 end;

procedure TScanVozrF.bbBackClick(Sender:TObject);
var i:Integer;
    CP:TChekPos;
    bS,kS:String;
 begin
  if DM.qrScanN.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите сформировать возврат?',52)<>ID_YES then Exit;

  DM.Qr5.Close;
  DM.Qr5.SQL.Text:='select top 1 box from SpisVozr where IsNull(kolscan,0)>0 and IsNull(Box,0)=0 and DtVz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+''''#10+
                   'union '#10+
                   'select top 1 boxb from SpisVozr where IsNull(kolscanb,0)>0 and IsNull(Boxb,0)=0 and DtVz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+'''';
  DM.Qr5.Open;
  if DM.Qr5.IsEmpty=False then
   begin
    MainF.MessBox('Есть незакрытые ящики! Формирование возврата невозможно!');
    Exit;
   end;

  try
   DM.ADOCo.BeginTrans;
   try
{    DM.Qr5.Close;
    DM.Qr5.SQL.Text:='select Priznak from SpisVozr where IsNull(kolscan,0)+IsNull(kolscanb,0)>0 and DtVz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+''' group by Priznak';
    DM.Qr5.Open;
}
    for i:=2 downto 1 do
     begin
      Case i of
       1:begin CP.Priznak:=12; kS:='kolscan';  bS:='box'  end;
       2:begin CP.Priznak:=3;  kS:='kolscanb'; bS:='boxb' end;
      end;
//      ShowMessageI(CP.Priznak);
      CP.Date:=StrToDate(DateToStr(Date));

      DM.Qr1.Close;
      DM.Qr1.SQL.Clear;

      DM.Qr1.SQL.Add('update a set '+kS+'=b.ostat ');
      DM.Qr1.SQL.Add('from SpisVozr a, ');
      DM.Qr1.SQL.Add('     (select art_code, Sum(ostat) as Ostat from SprTov group by art_code) b ');
      DM.Qr1.SQL.Add('where IsNull(Closed,0)=1 and DtVZ='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+''' and a.art_code=b.art_code and a.'+kS+'>b.ostat ');

      DM.Qr1.SQL.Add('declare @part_code int, @pkol smallint, @piduser smallint ,@pscan smallint ');
      DM.Qr1.SQL.Add('declare Cur cursor local for select art_code,(case when '+kS+'>kol then kol else '+kS+' end) as kolscan,'+IntToStr(Prm.UserID)+' from SpisVozr where IsNull(Closed,0)=1 and IsNull('+kS+',0)>0 and DtVZ='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+'''');
      DM.Qr1.SQL.Add('open Cur                                                             ');
      DM.Qr1.SQL.Add('fetch Cur into @part_code,@pkol,@piduser                      ');
      DM.Qr1.SQL.Add('while @@Fetch_Status = 0                                             ');
      DM.Qr1.SQL.Add(' begin                                                               ');
      DM.Qr1.SQL.Add('  exec spY_EnterKol @part_code,@pkol,@piduser,1,@part_code,0,1  ');
      DM.Qr1.SQL.Add('  fetch Cur into @part_code,@pkol,@piduser                    ');
      DM.Qr1.SQL.Add(' end                                                                 ');
      DM.Qr1.SQL.Add('close Cur                                                            ');
      DM.Qr1.SQL.Add('deallocate Cur                                                       ');

      DM.Qr1.SQL.Add('update Chek set shtrih=b.'+bS);
      DM.Qr1.SQL.Add('from Chek a, SpisVozr b');
      DM.Qr1.SQL.Add('where a.art_code=b.art_code and a.id_user='+IntToStr(Prm.UserID)+' and a.compname=host_name() and ');
      DM.Qr1.SQL.Add('      IsNull(b.Closed,0)=1 and IsNull(b.'+kS+',0)>0 and b.DtVZ='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+'''');

//      DM.Qr1.SQL.SaveToFile('C:\spip.txt');
      DM.Qr1.ExecSQL;

      CP.IDMess:=0;
      CP.ID_User:=Prm.UserID;
      CP.NumbChek:=0;
      CP.TypeOplat:=TO_BACK;
      CP.ID_Kassa:=Opt.KassaID;
      CP.Vzh:=0;
      CP.VzhSafe:=0;
      CP.PrPayRecipt:=0;
      CP.SumSertif:=0;
      DM.WriteChek(CP);

     end;
    DM.Qr1.Close;
    DM.Qr1.SQL.Clear;
    DM.Qr1.SQL.Add('update SpisVozr set Closed=2,DtVozvrat=getdate() where IsNull(Closed,0)=1 and DtVZ='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+'''');
    DM.Qr1.ExecSQL;
    DM.ADOCo.CommitTrans;
   except
    raise;
   end;
   bbBack.Enabled:=False;
   FReadOnly:=True;
   ShowNakl;
   MainF.MessBox('Возврат сформирован успешно!',64);
  except
   on E:Exception do
    begin
     DM.ADOCo.RollbackTrans;
     MainF.MessBox(E.Message);
    end;
  end;
 end;

procedure TScanVozrF.CheckBox1Click(Sender: TObject);
 begin
  ShowNakl;
 end;

procedure TScanVozrF.bbCloseBoxClick(Sender: TObject);
var Num,NumBox:String;
 begin
  try
   if FReadOnly then Exit;
   if DM.qrScanN.IsEmpty then Exit;
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select Box from SpisVozr where IsNull(kolscan,0)>0 and IsNull(Box,0)=0 and dtvz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DateNakl)+''''+#10+
                   'union '#10+
                   'select BoxB from SpisVozr where IsNull(kolscanB,0)>0 and IsNull(BoxB,0)=0 and dtvz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DateNakl)+'''';
   DM.Qr.Open;

   if DM.Qr.IsEmpty then begin MainF.MessBox('Нет незакрытых ящиков!'); Exit; end;
   if MainF.MessBox('Вы действительно хотите закрыть ящик?',52)<>ID_YES then Exit;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('declare @ida varchar(5), @num bigint, @numfull varchar(20) ');
   DM.Qr.SQL.Add('set @ida=(select Value from Spr_const where Descr=''ID_APTEKA'') ');
   DM.Qr.SQL.Add('set @num=IsNull((select convert(bigint,Value) from Spr_const where Descr=''NumBox''),0)+1 ');
   DM.Qr.SQL.Add('select ''2''+replicate(''0'',6-len(convert(varchar,@num)))+convert(varchar,@num)+replicate(''0'',3-len(@ida))+@ida+''01'' as NumBox, @num as  Num');
//   DM.Qr.SQL.SaveToFile('C:\TmpSpis.txt');
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Abort;

   Num:=DM.Qr.FieldByName('Num').AsString;
   NumBox:=DM.Qr.FieldByName('NumBox').AsString;

{
   if Not PrintStiker(NumBox,IndToPrVozr(ComboBox1.ItemIndex)) then
    begin
     MainF.MessBox('Вы не напечатали стикер для ящика!');
     Exit;
    end;
}

   DM.Qr.Close;
   DM.Qr.SQL.Clear;

   Case ComboBox1.ItemIndex of
    0:DM.Qr.SQL.Add('update SpisVozr set box='+NumBox+'  where IsNull(kolscan,0)>0 and IsNull(box,0)=0 and dtvz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DateNakl)+'''');
    1:DM.Qr.SQL.Add('update SpisVozr set boxB='+NumBox+'  where IsNull(kolscanB,0)>0 and IsNull(boxB,0)=0 and dtvz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DateNakl)+'''');
   end;

   DM.Qr.SQL.Add('delete from Spr_Const where Descr=''NumBox'' ');
   DM.Qr.SQL.Add('insert into Spr_Const(Descr,Value) values(''NumBox'','''+Num+''') ');

   DM.Qr.ExecSQL;
//   ComboBox1.ItemIndex:=-1;
   ShowNakl;
  except
   on E:Exception do MainF.MessBox('Ошибка закрытия ящика: '+E.Message);
  end;
end;

procedure TScanVozrF.BitBtn3Click(Sender: TObject);
var Cnt,i,j:Integer;
    Tb:TTableObj;
 begin
  try
   DM.Qr5.Close;
   DM.Qr5.SQL.Clear;
   DM.Qr5.SQL.Add('select b.names,a.art_code, ');
   DM.Qr5.SQL.Add('       b.cena as cena1,a.kol as kol1,a.kol*b.cena as sum1,');
   DM.Qr5.SQL.Add('       b.cena as cena2,IsNull(a.kolscan,0) as kol2,');
   DM.Qr5.SQL.Add('                       IsNull(a.kolscan,0)*b.cena as sum2,');
   DM.Qr5.SQL.Add('       b.cena as cena3,IsNull(a.kolscanb,0) as kol3,');
   DM.Qr5.SQL.Add('                       IsNull(a.kolscanb,0)*b.cena as sum3,');
   DM.Qr5.SQL.Add('       IsNull(d.cena,0) as cena4, IsNull(d.kol,0) as kol4,');
   DM.Qr5.SQL.Add('                                  IsNull(d.Summ,0) as sum4,');

   DM.Qr5.SQL.Add('       b.cena as cena5,IsNull(a.kolscan,0)+IsNull(a.kolscanb,0)+IsNull(d.kol,0)-a.kol as kol5,');
   DM.Qr5.SQL.Add('                       (IsNull(a.kolscan,0)+IsNull(a.kolscanb,0)+IsNull(d.kol,0)-a.kol)*b.cena as sum5');


   DM.Qr5.SQL.Add('from (select art_code,cena,names from SprTov (nolock) group by art_code,cena,names) b,');
   DM.Qr5.SQL.Add('     SpisVozr a (nolock) left join (select b.art_code,s.priznak,s.dtvz,Max(a.cena) as cena, Sum(a.kol) as kol, Sum(a.kol*a.cena) as Summ from ArhCheks a (nolock), SprTov b (nolock), SpisVozr s  ');
   DM.Qr5.SQL.Add('                                    where s.art_code=b.art_code and a.kod_name=b.kod_name and a.date_chek between s.DtSpis and s.DtVozvrat and (IsNull(s.kolscan,0)>0 or IsNull(s.kolscanb,0)>0) and IsNull(Closed,0)=2 ');
   DM.Qr5.SQL.Add('                                    group by b.art_code,s.priznak,s.dtvz) d');
   DM.Qr5.SQL.Add('                         on a.art_code=d.art_code and d.priznak=a.priznak and d.dtvz=a.dtvz ');

   DM.Qr5.SQL.Add('where ((IsNull(a.kolscan,0)>0 or IsNull(a.kolscanb,0)>0)) and a.DtVz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+''' ');
   DM.Qr5.SQL.Add('      and a.art_code=b.art_code and IsNull(a.Closed,0)=2 ');
   DM.Qr5.SQL.Add('order by 1');
//   DM.Qr5.SQL.SaveToFile('C:\Akt.txt');
   DM.Qr5.Open;
   if DM.Qr5.IsEmpty then Exit;

   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Orientation:=O_LANDS;

   Cnt:=DM.Qr5.RecordCount;
   PrintRep.Align:=AL_CENTER;
   PrintRep.AddText('Отчет по сбору излишков'#10#10);
   PrintRep.Align:=AL_LEFT;

   PrintRep.AddText('Дата: '+DateToStr(Prm.VSDate)+#10);
   PrintRep.AddText('Торговая точка: '+Prm.AptekaNameRU+#10#10);

   PrintRep.Align:=AL_CENTER;
   PrintRep.Font.Size:=3;
   PrintRep.AddTable(18,Cnt+2);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('600,5000,1200,1000,800,1000,1000,800,1000,1000,800,1000,1000,800,1000,1000,800,1000');

   Tb.Cell[1,1].AddText('№ п/п');
   Tb.Cell[2,1].AddText('Наименование товара');
   Tb.Cell[3,1].AddText('Арткод');

   Tb.Cell[4,1].AddText('Список излишков');
   Tb.Cell[7,1].AddText('Хороший');
   Tb.Cell[10,1].AddText('Брак');
   Tb.Cell[13,1].AddText('Реализовано');
   Tb.Cell[16,1].AddText('Расхождения');

   for i:=1 to 5 do
    begin
     Tb.MergeCells(i*3+1,1,i*3+3,1);
     Tb.Cell[i*3+1,2].AddText('Цена');
     Tb.Cell[i*3+2,2].AddText('Кол-во');
     Tb.Cell[i*3+3,2].AddText('Сумма');
    end;

   for i:=1 to Cnt do
    begin
     if i=1 then DM.Qr5.First else DM.Qr5.Next;

     Tb.Cell[1,i+2].AddText(IntToStr(i));
     Tb.Cell[2,i+2].Align:=AL_LEFT;
     Tb.Cell[2,i+2].AddText(DM.Qr5.FieldByName('names').AsString);
     Tb.Cell[3,i+2].AddText(DM.Qr5.FieldByName('art_code').AsString);
     for j:=1 to 5 do
      begin
       Tb.Cell[j*3+1,i+2].AddText(CurrToStrF(DM.Qr5.FieldByName('cena'+IntToStr(j)).AsCurrency,ffFixed,2));
       Tb.Cell[j*3+2,i+2].AddText(DM.Qr5.FieldByName('kol'+IntToStr(j)).AsString);
       Tb.Cell[j*3+3,i+2].AddText(CurrToStrF(DM.Qr5.FieldByName('sum'+IntToStr(j)).AsCurrency,ffFixed,2));
      end;
    end;
   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования акта расхождений: '+E.Message);
  end;
 end;

end.
