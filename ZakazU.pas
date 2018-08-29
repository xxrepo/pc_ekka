unit ZakazU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls,MainU, StdCtrls, Grids, DBGrids, Buttons, ComCtrls, Util,
     DB, DBCtrls, EnterValueU, Menus, ActnList, ClipBrd;

type

  TZakazF = class(TForm)

    Panel1: TPanel;
    dbgZakaz: TDBGrid;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    edPer: TEdit;
    udPer: TUpDown;
    Label3: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    dtZakaz: TDateTimePicker;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    cbNew: TCheckBox;
    cbZatov: TCheckBox;
    cbZero: TCheckBox;
    cbSort: TCheckBox;
    BitBtn5: TBitBtn;
    cbGr: TComboBox;
    Label2: TLabel;
    ok1: TImage;
    cbZakApt: TCheckBox;
    cbAutoZak: TCheckBox;
    Label5: TLabel;
    DBText1: TDBText;
    BitBtn6: TBitBtn;
    CheckBox1: TCheckBox;
    cbEnter: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    alZakaz: TActionList;
    Action1: TAction;
    Label6: TLabel;
    cbKol: TComboBox;
    Label7: TLabel;
    cbSum: TComboBox;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure dbgZakazDrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn;  State:TGridDrawState);
    procedure cbNewClick(Sender: TObject);
    procedure cbZatovClick(Sender: TObject);
    procedure cbZeroClick(Sender: TObject);
    procedure cbSortClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgZakazKeyPress(Sender: TObject; var Key:Char);
    procedure dbgZakazKeyDown(Sender: TObject; var Key:Word; Shift:TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure cbGrCloseUp(Sender: TObject);
    procedure dbgZakazDblClick(Sender: TObject);
    procedure dbgZakazColEnter(Sender: TObject);
    procedure cbZakAptClick(Sender: TObject);
    procedure cbAutoZakClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure cbEnterClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure cbKolCloseUp(Sender: TObject);
    procedure cbSumCloseUp(Sender: TObject);

  private

    FSr:String;

    procedure FilterZakaz;
    procedure Fswitch;
    procedure qrZakazBeforePost(DataSet:TDataSet);

  public

  end;

var ZakazF:TZakazF=nil;

procedure ShowZakazF;

implementation

uses DataModuleU, ShareU, SimpleMessU;

{$R *.dfm}

procedure ShowZakazF;
 begin
  try
   ZakazF:=TZakazF.Create(nil);
   Application.ProcessMessages;
   ZakazF.ShowModal;
  except
   ZakazF.Free;
   MainF.MessBox(ER_CR_FORM);
  end;
 end;

procedure TZakazF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  dtZakaz.Date:=Date;
  FilterZakaz;
  DM.qrZakaz.AfterPost:=qrZakazBeforePost;
 end; {FormCreate}

procedure TZakazF.FilterZakaz;
var AC:Integer;
 begin
  try
   AC:=-1;
   if Not(DM.qrZakaz.IsEmpty) then AC:=DM.qrZakaz.FieldByName('Art_Code').AsInteger;

   DM.qrZakaz.Close;
   DM.qrZakaz.SQL.Clear;

   DM.qrZakaz.SQL.Add('select z.art_code,z.Gr,z.names,z.ostat,z.realiz,z.realiz_period,z.zakaz,z.realizDay, ');
   DM.qrZakaz.SQL.Add('       z.type_tov,z.f_nds,z.date_zakaz,z.CountDay,z.plist,z.ZAKAZ_OLD,z.ZAKAZ_OLD1,z.SPS,z.SummaDay,z.otkaz, ');
   DM.qrZakaz.SQL.Add('       (case when (z.realiz/2-z.ostat)<0 then 0 else (z.realiz/2-z.ostat) end) as Zapas,z.ZakazAuto,z.FSwitch,IsNull(z.tekotp,0) as TekOtp, ');
   DM.qrZakaz.SQL.Add('       z.EndReg,z.abc_kol,z.abc_sum ');

//   DM.qrZakaz.SQL.Add('       IsNull((select Max(art_code) from PList p (nolock) where p.art_code=z.art_code and p.DtEndReg<=convert(varchar,getdate(),23) ),0) as EndReg ');
//   DM.qrZakaz.SQL.Add('       case when IsNull(p.DtEndReg,getdate()+10)<=convert(varchar,getdate(),23) then p.art_code else 0 end as EndReg ');

   DM.qrZakaz.SQL.Add('from Zakaz z (nolock) ');
   DM.qrZakaz.SQL.Add('where z.date_zakaz='''+FormatDateTime('yyyy-mm-dd',dtZakaz.Date)+' 00:00:00'' and ');
   DM.qrZakaz.SQL.Add('      (z.zakaz>=0 or z.otkaz>=0) ');
{
   if cbNew.Checked then DM.qrZakaz.SQL.Add(' and   z.f_nds=0 ')
                    else DM.qrZakaz.SQL.Add(' and     z.f_nds>0 ');
}
//   if cbGr.ItemIndex>0 then DM.qrZakaz.SQL.Add(' and  z.gr='+IntToStr(cbGr.ItemIndex));

   if cbZatov.Checked then DM.qrZakaz.SQL.Add('  and    z.ostat>realiz');

   if cbZero.Checked then DM.qrZakaz.SQL.Add('  and    z.ostat<=0');

   if cbZakApt.Checked then DM.qrZakaz.SQL.Add('  and    z.zakaz>0');

   if cbAutoZak.Checked then DM.qrZakaz.SQL.Add('  and    z.ZakazAuto>0 ');

   if CheckBox1.Checked then DM.qrZakaz.SQL.Add('  and    z.Realiz>0 ');

   if cbKol.ItemIndex>0 then DM.qrZakaz.SQL.Add('  and    z.abc_kol='''+cbKol.Text+'''');
   if cbSum.ItemIndex>0 then DM.qrZakaz.SQL.Add('  and    z.abc_sum='''+cbSum.Text+'''');

   if cbSort.Checked then DM.qrZakaz.SQL.Add('order by z.SummaDay desc')
                     else DM.qrZakaz.SQL.Add('order by z.Names');

//   DM.qrZakaz.SQL.SaveToFile('C:\log\zakaz.txt');

   DM.qrZakaz.Open;
   DM.qrZakaz.Locate('ART_CODE',AC,[]);

   if (dbgZakaz.Visible) and (dbgZakaz.SelectedIndex<>13) then
    begin
     dbgZakaz.SetFocus;
     dbgZakaz.SelectedIndex:=11;
    end;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к таблице "Zakaz": '+E.Message);
  end;
 end;

procedure TZakazF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TZakazF.BitBtn1Click(Sender: TObject);
var T:TDateTime;
 begin

  dtZakaz.Date:=Date;
  if StrToDate(DateToStr(dtZakaz.Date))<StrToDate(DateToStr(Date)) then
   begin
    MainF.MessBox('Нельзя перерассчитать заказ за прошлые дни!');
    Exit;
   end;

//  InitGroupsZakaz;
//  FilterZakaz;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select Value from Spr_Const where Descr=''KoefZakaz'' ';
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Abort;
   Prm.KoefZakaz:=DM.Qr.FieldByName('').AsInteger;
  except
   Prm.KoefZakaz:=15;
  end;

  try

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select top 1 * from Zakaz where (zakaz>0 or otkaz>0) and IsNull(InSklad,0)=0 and date_zakaz='''+FormatDateTime('yyyy-mm-dd',dtZakaz.Date)+' 00:00:00'' ';
   DM.Qr.Open;

   if Not(DM.Qr.IsEmpty) then
    begin
     MainF.MessBox('Заявку можно расчитывать один раз в день!',48);
     Exit;
//     if MainF.MessBox('Вы действительно хотите перерасчитать Заказ за сегодня!',52)<>ID_YES then Exit;
    end;

   T:=Time;

   DM.spY_Zakaz.Close;
   DM.spY_Zakaz.Parameters.ParamValues['@vDateZakaz']:=StrToDate(DateToStr(dtZakaz.Date));
   DM.spY_Zakaz.Parameters.ParamValues['@vCountDay']:=udPer.Position;
   DM.spY_Zakaz.ExecProc;
   FilterZakaz;
   MainF.MessBox('Ресчет завершен! Затрачено времени: '+TimeToStr(Abs(T-Time)));

  except
   on E:Exception do MainF.MessBox('Ошибка расчета заказа: '+E.Message);
  end;

 end;

procedure TZakazF.BitBtn3Click(Sender: TObject);
 begin
  FilterZakaz;
 end;

procedure TZakazF.BitBtn4Click(Sender: TObject);
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select IsNull(Max(date_zakaz),getdate()) as DZ from Zakaz';
   DM.Qr.Open;
   dtZakaz.Date:=DM.Qr.FieldByName('DZ').AsDateTime;
   FilterZakaz;
  except
  end;
 end;

procedure TZakazF.dbgZakazDrawColumnCell(Sender:TObject; const Rect:TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
    dR,sR:TRect;
    i,j:Integer;
    C,C1:TColor;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if db.DataSource.DataSet.FieldByName('OSTAT').AsInteger<=0 then
   begin
    db.Canvas.Font.Color:=clBlack;
    db.Canvas.Brush.Color:=$00FFCB5E;
   end;
{
 else
  if db.DataSource.DataSet.FieldByName('OSTAT').AsInteger<=2 then
   begin
    db.Canvas.Font.Color:=clWhite;
    db.Canvas.Brush.Color:=$00FF8000;
   end;
}
  if db.DataSource.DataSet.FieldByName('F_NDS').AsInteger=0 then
   begin
    db.Canvas.Font.Color:=clBlack;
    db.Canvas.Brush.Color:=clYellow;
   end;
  if db.DataSource.DataSet.FieldByName('ZAKAZ').AsInteger>0 then
   begin
    db.Canvas.Font.Color:=clWhite;
    db.Canvas.Brush.Color:=clGreen;
   end;
  if gdSelected in State then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);

  if DataCol=13 then
   begin
    db.Canvas.FillRect(Rect);
    if db.DataSource.DataSet.FieldByName('FSwitch').AsInteger=1 then
     begin
      dR:=Rect;
      dr.Left:=dr.Left+(dr.Right-dr.Left-ok1.Width) div 2; dr.Top:=dr.Top+2;

      dr.Right:=dR.Left+ok1.Width; dr.Bottom:=dR.Top+ok1.Height;
      sR.Left:=0; sR.Top:=0;
      sR.Right:=ok1.Width; sR.Bottom:=ok1.Height;

      C:=db.Canvas.Pixels[Rect.Left+1,Rect.Top+1];
      C1:=ok1.Canvas.Pixels[0,0];
      for j:=0 to ok1.Height-1 do
       for i:=0 to ok1.Width-1 do
        if ok1.Canvas.Pixels[i,j]=C1 then ok1.Canvas.Pixels[i,j]:=C; 
      db.Canvas.CopyRect(dR,ok1.Canvas,sR);
     end;
   end;

  if (DataCol=0) and ((db.DataSource.DataSet.FieldByName('EndReg').AsString<>'') and (StrToDate(DateToStr(db.DataSource.DataSet.FieldByName('EndReg').AsDateTime))<=StrToDate(DateToStr(Date))) ) then
   try
    db.Canvas.Pen.Color:=clBlue;
    db.Canvas.Brush.Color:=clYellow;
    db.Canvas.RoundRect(Rect.Left+2,Rect.Top+3,Rect.Left+18,Rect.Top+19,5,5);
    db.Canvas.Font.Name:='Arial';
    db.Canvas.Font.Size:=8;
    db.Canvas.Font.Style:=[fsBold,fsItalic];
    db.Canvas.Font.Color:=clBlue;
    db.Canvas.TextOut(Rect.Left+5,Rect.Top+4,'R');
   except
   end;
 end;

procedure TZakazF.cbNewClick(Sender: TObject);
 begin
  if cbNew.Checked then cbZatov.Checked:=False;
  FilterZakaz;
 end;

procedure TZakazF.cbZatovClick(Sender: TObject);
 begin
  if cbZatov.Checked then cbNew.Checked:=False;
  FilterZakaz;
 end;

procedure TZakazF.cbZeroClick(Sender: TObject);
 begin
  FilterZakaz;
 end;

procedure TZakazF.cbSortClick(Sender: TObject);
 begin
  FilterZakaz;
 end;

procedure TZakazF.FormActivate(Sender: TObject);
 begin
  dbgZakaz.Visible:=True;
  dbgZakaz.SetFocus;
  dbgZakaz.SelectedIndex:=11;
 end;

procedure TZakazF.dbgZakazKeyPress(Sender: TObject; var Key: Char);
var db:TDBGrid;
    Zr,NC:Integer;
    IsFind:Boolean;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  NC:=db.SelectedIndex;
  Zr:=0;
  if NC>1 then NC:=1;
  MainF.dbGKeyPress(db,Key,FSr,NC,SC_FIND,Zr,IsFind);
 end;

procedure TZakazF.Fswitch;
 begin
  if Not((dbgZakaz.SelectedIndex=13) and (DM.qrZakaz.IsEmpty=False)) then Exit;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='update Zakaz set FSwitch=1-IsNull(FSwitch,0) where art_code='+DM.qrZakaz.FieldByName('art_code').AsString+' and date_zakaz='''+FormatDateTime('yyyy-mm-dd',dtZakaz.Date)+' 00:00:00''';
   DM.QrEx.ExecSQL;
   FilterZakaz;
  except
  end;
 end;

procedure TZakazF.dbgZakazKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
var Kol:Integer;
 begin
  if Key in K_ARROW_KEYS then FSr:='';
  if (Key=VK_RETURN) then
   begin
    if cbEnter.Checked=False then Fswitch else
     try
      if DM.qrZakaz.IsEmpty then Exit;
      if Not EnterIntValue(Kol,'Введите количество') then Exit;
      DM.QrEx.Close;
      DM.QrEx.SQL.Text:='update Zakaz set zakaz='+IntToStr(Kol)+' where art_code='+DM.qrZakaz.FieldByName('art_code').AsString+' and date_zakaz='''+FormatDateTime('yyyy-mm-dd',dtZakaz.Date)+' 00:00:00'' '+#10+
                        'select 9999 as Res';
      DM.QrEx.Open;
      FilterZakaz;
     except
      on E:Exception do MainF.MessBox('Ошибка редактирования заявки: '+E.Message);
     end;
   end;
 end;

procedure TZakazF.BitBtn5Click(Sender: TObject);
 begin
  PrintOtkaz(dtZakaz.Date,1);
 end;

procedure TZakazF.cbGrCloseUp(Sender: TObject);
 begin
  FilterZakaz;
 end;

procedure TZakazF.dbgZakazDblClick(Sender: TObject);
 begin
  Fswitch;
 end;

procedure TZakazF.dbgZakazColEnter(Sender: TObject);
 begin
  if dbgZakaz.SelectedIndex=13 then dbgZakaz.Options:=dbgZakaz.Options-[dgEditing]
                               else dbgZakaz.Options:=dbgZakaz.Options+[dgEditing];
 end;

procedure TZakazF.cbZakAptClick(Sender: TObject);
 begin
  FilterZakaz;
 end;

procedure TZakazF.cbAutoZakClick(Sender: TObject);
 begin
  FilterZakaz;
 end;

procedure TZakazF.qrZakazBeforePost(DataSet:TDataSet);
 begin
  if DM.qrZakaz.IsEmpty then Exit;
  FilterZakaz;
 end;

procedure TZakazF.BitBtn6Click(Sender:TObject);
 begin
  PrintOtkaz(dtZakaz.Date,4);
 end;

procedure TZakazF.CheckBox1Click(Sender:TObject);
 begin
  FilterZakaz;
 end;

procedure TZakazF.cbEnterClick(Sender:TObject);
 begin
  dbgZakaz.ReadOnly:=cbEnter.Checked;
 end;

procedure TZakazF.N1Click(Sender:TObject);
 begin
  if DM.qrZakaz.IsEmpty then Exit;

  MainF.ShowMovTov(DM.qrZakaz.FieldByName('Art_Code').AsInteger,'Движение товара - '+DM.qrZakaz.FieldByName('Names').AsString);
 end;

procedure TZakazF.BitBtn7Click(Sender:TObject);
 begin
  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='exec spY_UpdateZakaz '''+FormatDateTime('yyyy-mm-dd',dtZakaz.Date)+'''';
  DM.QrEx.Open;
  FilterZakaz;
 end;

procedure TZakazF.BitBtn8Click(Sender:TObject);
var S:String;
 begin
{
  S:='Сформирована заявка товара '+#10+
     'От т/т: '+Prm.AptekaNameRU+#10+
     'От: '+#10+Prm.UserName+#10#10+
     'Дата формирования: '+DateTimeToStr(Now);

  SimpleMessF:=TSimpleMessF.Create(Self);
  try
   SimpleMessF.Silent:=True;
   SimpleMessF.reW.Text:=S;
   SimpleMessF.BitBtn3Click(nil);
  finally
   SimpleMessF.Free;
  end;
}
  Close;
 end;

procedure TZakazF.Action1Execute(Sender: TObject);
 begin
  ClipBoard.AsText:=dbgZakaz.DataSource.DataSet.FieldByName('ART_CODE').AsString+' '+dbgZakaz.DataSource.DataSet.FieldByName('NAMES').AsString;
 end;

procedure TZakazF.cbKolCloseUp(Sender: TObject);
 begin
  FilterZakaz;
 end;

procedure TZakazF.cbSumCloseUp(Sender: TObject);
 begin
  FilterZakaz;
 end;

initialization

Finalization

 if ZakazF<>nil then ZakazF.Free;

end.





