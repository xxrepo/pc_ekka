unit ViewNaklU;

interface

uses
  Forms, Menus, DBCtrls, Controls, StdCtrls, Graphics, ExtCtrls, Grids,
  DBGrids, Buttons, ComCtrls, Classes, DB, Windows, SysUtils, PrintReport,
  Util, ShowTextU;
//  , Messages, Dialogs, ShowTextU, Variants;

type

  TViewNaklF = class(TForm)
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btDel: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    pmPrnReg: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    BitBtn8: TBitBtn;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Label9: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    BitBtn9: TBitBtn;
    PopupMenu1: TPopupMenu;
    pm11: TMenuItem;
    bbCloseBox: TBitBtn;
    BitBtn10: TBitBtn;
    imChp: TImage;
    Label10: TLabel;
    pmCancel: TPopupMenu;
    N3: TMenuItem;
    bbVzr: TBitBtn;
    BitBtn11: TBitBtn;
    CheckBox4: TCheckBox;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    rbPr: TRadioButton;
    rbVz: TRadioButton;
    BitBtn5: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    CheckBox1: TCheckBox;
    Panel8: TPanel;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label6: TLabel;
    DBText4: TDBText;
    Label11: TLabel;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    Label7: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);

    procedure DSrc1DataChange(Sender:TObject; Field:TField);

    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure rbPrClick(Sender: TObject);
    procedure rbVzClick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure pm11Click(Sender: TObject);
    procedure bbCloseBoxClick(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure bbVzrClick(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);

  private

    P:Byte;
    FSr:String;

    function  CheckMarked:Boolean;

    procedure DrawGridCheckBox(Canvas:TCanvas; Rect:TRect; Checked:Boolean);
    procedure SelectNakls(ColName:String; All:Boolean; Value:Boolean);
    procedure PrintCen(Param:Byte);
    procedure NaklList(Refresh:Integer);
    procedure ShowNakl;
    procedure EnterKol(AC:Integer; P:Byte);

  public

  end;

var ViewNaklF:TViewNaklF;

implementation

uses MainU, DataModuleU, PrintMarkBoxU, RegPredstU, EnterKolScanU, Math,
  VozrPartU, ReturnToProviderU, ADODB;

{$R *.dfm}

procedure TViewNaklF.FormCreate(Sender: TObject);
 begin
  P:=0;
  Caption:=MFC;
  dtStart.Date:=Date;
  dtEnd.Date:=Date;
  DBGrid1.DataSource.OnDataChange:=DSrc1DataChange;
  btDel.Enabled:=MainF.IsPermit([],P_SILENT);
  CheckBox4.Enabled:=false;
  CheckBox4.Checked:=false;

  

//    dtStart.Date:=StrToDate('01.01.2017');
//    rbPr.Checked:=false;
//    rbVz.Checked:=true;

  BitBtn5Click(BitBtn5);
  FSr:='';
{
  CheckBox3.Visible:=Prm.RealizMinus;
  CheckBox3.Checked:=Prm.RealizMinus;
}
 end;

procedure TViewNaklF.BitBtn4Click(Sender:TObject);
 begin
  Close;
 end;

procedure TViewNaklF.NaklList(Refresh:Integer);
var
  tn:String;
  ID:Integer;
  ref: integer;
begin
  ref:=Refresh;
  try
    BitBtn2.Enabled:=rbPr.Checked;
//   BitBtn6.Enabled:=rbPr.Checked;

    BitBtn3.Enabled:=rbVz.Checked;
    BitBtn7.Enabled:=rbVz.Checked;
    Label6.Visible:=rbVz.Checked;
    DBText4.Visible:=rbVz.Checked;
    bbCloseBox.Enabled:=rbVz.Checked;

    if Prm.AptekaID=138 then
    begin
      bbVzr.Visible:=True;
      bbVzr.Enabled:=rbPr.Checked;
    end;

    if rbPr.Checked then
      tn:=IntToStr(DC_INCOME)
    else
      tn:=IntToStr(DC_BACK);

    if DM.spY_NaklList.Active then ID:=DM.spY_NaklList.FieldByName('iddoc').AsInteger;
    DM.spY_NaklList.Close;
    with DM.spY_NaklList do
    begin
      Parameters.Clear;
      Parameters.CreateParameter('@dt1',ftDate,pdInput,23,StrToDate(DateToStr(dtStart.Date)));
      Parameters.CreateParameter('@dt2',ftDate,pdInput,23,StrToDate(DateToStr(dtEnd.Date+1)));
      Parameters.CreateParameter('@tn',ftInteger,pdInput,10,tn);
      Parameters.CreateParameter('@piduser',ftInteger,pdInput,10,Prm.UserID);
      Parameters.CreateParameter('@refresh',ftInteger,pdInput,10,ref);
      if CheckBox4.Checked and CheckBox4.Enabled then //только возвраты поставщикам
        Parameters.CreateParameter('@p_only_vz_provider',ftSmallint,pdInput,1,1)
      else
        Parameters.CreateParameter('@p_only_vz_provider',ftSmallint,pdInput,1,0);
    end;
{
   DM.spY_NaklList.Parameters.ParamValues['@dt1']:=StrToDate(DateToStr(dtStart.Date));
   DM.spY_NaklList.Parameters.ParamValues['@dt2']:=StrToDate(DateToStr(dtEnd.Date+1));
   DM.spY_NaklList.Parameters.ParamValues['@tn']:=tn;
   DM.spY_NaklList.Parameters.ParamValues['@piduser']:=Prm.UserID;
   DM.spY_NaklList.Parameters.ParamValues['@refresh']:=Refresh;

   if CheckBox4.Checked and CheckBox4.Enabled then //только возвраты поставщикам
     DM.spY_NaklList.Parameters.CreateParameter('@p_only_vz_provider',ftSmallint,pdInput,1,1)
   else
     DM.spY_NaklList.Parameters.CreateParameter('@p_only_vz_provider',ftSmallint,pdInput,1,0);
}
    DBGrid1.DataSource.OnDataChange:=nil;
    DM.spY_NaklList.Open;
    DBGrid1.DataSource.OnDataChange:=DSrc1DataChange;
    DM.spY_NaklList.Locate('iddoc',id,[]);
  except
    on E:Exception do MainF.MessBox('Ошибка формирования списка накладных: '+E.Message);
  end;
end;

procedure TViewNaklF.BitBtn5Click(Sender:TObject);
begin
  NaklList(0);
  ShowNakl;
end;

procedure TViewNaklF.DSrc1DataChange(Sender:TObject; Field:TField);
begin
  ShowNakl;
end;

procedure TViewNaklF.ShowNakl;
var AC:Integer;
 begin

  AC:=-1;
  if DM.qrShowNakl.Active then AC:=DM.qrShowNakl.FieldByName('Art_code').AsInteger;
  DM.qrShowNakl.Close;
  if DM.spY_NaklList.IsEmpty then Exit;
{
 BitBtn10.Enabled:=(DM.spY_NaklList.FieldByName('idpriznak').AsInteger in [3,4,5,6]) and
                   (DM.spY_NaklList.FieldByName('marked').AsInteger=0);
}
  DM.qrShowNakl.SQL.Text:='exec spY_ShowNakl :iddoc, :obl';
  DM.qrShowNakl.Parameters.ParamByName('iddoc').Value:=DM.spY_NaklList.FieldByName('iddoc').AsInteger;
  DM.qrShowNakl.Parameters.ParamByName('obl').Value:=DM.spY_NaklList.FieldByName('obl').AsInteger;
  DM.qrShowNakl.Open;
  DM.qrShowNakl.Locate('Art_Code',AC,[]);

  if DM.spY_NaklList.FieldByName('DeliveryDate').AsDateTime=0 then Label11.Visible:=False else
   begin
    Label11.Caption:='Дата доставки посылки: '+DM.spY_NaklList.FieldByName('DeliveryDate').AsString;
    Label11.Visible:=True;
   end;

 end;

procedure TViewNaklF.BitBtn2Click(Sender:TObject);
var dx,dy:Integer;
    Com:TControl;
 begin
  if Sender=nil then Exit;
  dx:=Left+3; dy:=Top+TControl(Sender).Height+23;
  Com:=TControl(Sender);
  P:=Com.Tag;
  While Com<>Self do
   begin
    Inc(dx,Com.Left);
    Inc(dy,Com.Top);
    Com:=Com.Parent;
   end;
  pmPrnReg.Popup(dx,dy);
 end;

procedure TViewNaklF.PrintCen(Param:Byte);
var Skd,i:Integer;
    ss,ss1:String;
 begin
  try
   if DM.qrShowNakl.IsEmpty then Exit;
   PrintRep(1).Clear;
   PrintRep.SetDefault;
   ss:=''; ss1:=' 1 as koef,';
   if CheckBox3.Checked then
    begin
     ss:='*dbo.GetKoef(b.art_code)';
     ss1:=' dbo.GetKoef(b.art_code) as koef,';
    end;
   for i:=1 to 4 do
    begin
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     Case P Of
      0:begin
         DM.Qr.SQL.Add('select b.Art_code,(case when Max(b.f_nds)>2 then IsNull((select top 1 s.Names from SprCHPNames s where s.art_code=b.art_code),b.Names) else b.Names end) as Names, ');
         DM.Qr.SQL.Add('IsNull((select Max(ss.cena) from SprTov ss (nolock) where ostat>0 and ss.art_code=b.art_code),Max(b.cena))'+ss+' as Cena, '+ss1);

         DM.Qr.SQL.Add('IsNull((select Max(ean13) from SprEan where art_code=b.art_code),'''') as Ean13,c.P1,c.P2,c.P3,');

         if MainF.MaxSkd>0 then
          DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where type_skd=4 and art_code=b.art_code),IsNull((select Max(skd) from Skd where type_skd=1),0)) as Skd, ') else
         if MainF.MaxSkd<=-3 then
          DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where skd<3 and type_skd=4 and art_code=b.art_code),'+IntToStr(Abs(Round(MainF.MaxSkd)))+') as Skd, ')
         else
          DM.Qr.SQL.Add('0 as Skd, ');


         DM.Qr.SQL.Add('IsNull(Max(s.cenap'+ss+'),0) as CenaP, ');
         DM.Qr.SQL.Add('dbo.GetCenaOpt(b.art_code)'+ss+' as CenaOpt,Max(l.art_code) as Skd3  ');
         DM.Qr.SQL.Add('from Moves a, SprTovar s left join SkdLimit0 l on s.art_code=l.art_code, SprTov b left join Inform..SprReg c on b.art_code=c.art_code');
         DM.Qr.SQL.Add('where b.art_code=s.art_code and a.kod_name=b.kod_name and b.f_nds='+IntToStr(i)+' and ');
         DM.Qr.SQL.Add('      date_nakl='''+FormatDateTime('yyyy-mm-dd',DBText2.Field.AsDateTime)+' 00:00:00'' and');
         DM.Qr.SQL.Add('      nn_nakl='''+DBText3.Field.AsString+''' ');
        end;
      1:begin
         DM.Qr.SQL.Add('if Object_ID(N''tempdb..#tmps'') is not null drop table #tmps');
         DM.Qr.SQL.Add('select b.art_code,Max(j.time_nakl) as time_nakl,(case when Max(b.f_nds)>2 then IsNull((select top 1 s.Names from SprCHPNames s where s.art_code=b.art_code),b.Names) else b.Names end) as Names,b.f_nds,Sum(a.kol) as kol,');
         DM.Qr.SQL.Add('IsNull((select Max(ss.cena) from SprTov ss (nolock) where ostat>0 and ss.art_code=b.art_code),Max(b.cena)) as cena, ');
         DM.Qr.SQL.Add('convert(int,0) as ostat  ');
         DM.Qr.SQL.Add('into #tmps                                                                         ');
         DM.Qr.SQL.Add('from Moves a, SprTov b, Jmoves j                                                   ');
         DM.Qr.SQL.Add('where a.kod_name=b.kod_name and a.iddoc=j.iddoc and                               ');
         DM.Qr.SQL.Add('      a.date_nakl>='''+FormatDateTime('yyyy-mm-dd',DBText2.Field.AsDateTime)+' 00:00:00'' and ');
         DM.Qr.SQL.Add('      a.debcrd=1 and a.nn_nakl not like ''%пр-%''                                  ');
         DM.Qr.SQL.Add('group by b.art_code,b.names,b.f_nds                                         ');
         DM.Qr.SQL.Add('                                                                                   ');
//         DM.Qr.SQL.Add('update #tmps set ostat=IsNull((select Sum(ostat)+Sum(b.kol) from SprTov s, ArhCheks b where s.kod_name=b.kod_name and b.date_chek>#tmps.time_nakl and s.art_code=#tmps.art_code),0) ');

         DM.Qr.SQL.Add('update #tmps set ostat= IsNull((select Sum(ostat) from SprTov s where s.art_code=#tmps.art_code ),0) ');
         DM.Qr.SQL.Add('                       +IsNull((select Sum(kol) from ArhCheks a, SprTov b where a.kod_name=b.kod_name and b.art_code=#tmps.art_code and a.date_chek>#tmps.time_nakl),0)  ');
         DM.Qr.SQL.Add('                       -IsNull((select Sum(kol) from Moves a, SprTov b, JMoves j where a.debcrd=1 and j.nn_nakl not like ''%пр-%'' and j.iddoc=a.iddoc and a.kod_name=b.kod_name and b.art_code=#tmps.art_code and j.time_nakl>=#tmps.time_nakl),0)   ');
         DM.Qr.SQL.Add('                       +IsNull((select Sum(kol) from Moves a, SprTov b, JMoves j where a.debcrd=2 and j.nn_nakl not like ''%пр-%'' and j.iddoc=a.iddoc and a.kod_name=b.kod_name and b.art_code=#tmps.art_code and j.time_nakl>=#tmps.time_nakl),0) ');

         DM.Qr.SQL.Add('select b.Art_code,b.Names,Max(b.Cena)'+ss+' as Cena,'+ss1+' IsNull(Max(s.CenaP),0)'+ss+' as CenaP, dbo.GetCenaOpt(b.art_code)'+ss+' as CenaOpt,Max(l.art_code) as Skd3,            ');

         if MainF.MaxSkd>0 then
          DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where type_skd=4 and art_code=b.art_code),IsNull((select Max(skd) from Skd where type_skd=1),0)) as Skd, ') else
         if MainF.MaxSkd<=-3 then
          DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where skd<3 and type_skd=4 and art_code=b.art_code),'+IntToStr(Abs(Round(MainF.MaxSkd)))+') as Skd, ')
         else
          DM.Qr.SQL.Add('0 as Skd, ');

         DM.Qr.SQL.Add('       IsNull((select Max(ean13) from SprEan where art_code=b.art_code),'''') as Ean13,c.P1,c.P2,c.P3');
         DM.Qr.SQL.Add(' from SprTovar s  left join SkdLimit0 l on s.art_code=l.art_code, #tmps b left join Inform..SprReg c on b.art_code=c.art_code                   ');
         DM.Qr.SQL.Add(' where s.art_code=b.art_code and b.ostat<=0 and b.f_nds='+IntToStr(i) );
        end;
     end;
     DM.Qr.SQL.Add('group by b.Art_code,b.Names,c.P1,c.P2,c.P3');

     Case Param of
      1:DM.Qr.SQL.Add('order by b.Names');
      2:DM.Qr.SQL.Add('order by c.P1,c.P2,c.P3,b.Names');
     end;
//    DM.Qr.SQL.SaveToFile('C:\cennew.txt');
     DM.Qr.Open;
     if DM.Qr.IsEmpty then Continue;
     PrintRep.Qr:=DM.Qr;

     if ComboBox1.Text='0' then Skd:=MainF.PercForPrice else
      try
       Skd:=StrToInt(ComboBox1.Text);
      except
       Skd:=MainF.PercForPrice;
      end;

     if CheckBox2.Checked then PrintRep.PrintStiker else
     if i<=2 then
      PrintRep.PrintCennik(Prm.FirmNameUA,MainF.MaxSkd,DM.QrCen,Prm.AptekaID,Skd,0,Prm.RealizMinus)
     else
      PrintRep.PrintCennik(Opt.CHPName,MainF.MaxSkd,DM.QrCen,Prm.AptekaID,Skd,0,Prm.RealizMinus);

     PrintRep.AddText(#12);
    end;
   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования списка ценников: '+E.Message);
  end;
 end;

procedure TViewNaklF.DrawGridCheckBox(Canvas:TCanvas; Rect:TRect; Checked:boolean);
var DrawFlags:Integer;
 begin
  Canvas.TextRect(Rect,Rect.Left+1,Rect.Top+1,' ');
  DrawFrameControl(Canvas.Handle, Rect, DFC_BUTTON, DFCS_BUTTONPUSH or DFCS_ADJUSTRECT);
  DrawFlags:=DFCS_BUTTONCHECK or DFCS_ADJUSTRECT;// DFCS_BUTTONCHECK
  if Checked then DrawFlags:=DrawFlags or DFCS_CHECKED;
  DrawFrameControl(Canvas.Handle,Rect,DFC_BUTTON,DrawFlags);
 end;

procedure TViewNaklF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
    dR,sR,R:TRect;
    Pr,Kol,i,j:Integer;
    C,C1:TColor;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if Copy(db.DataSource.DataSet.FieldByName('NN_NAKL').AsString,2,3)='пр-' then db.Canvas.Font.Color:=$00858ECD else
  if DataCol=1 then
   begin
    Pr:=db.DataSource.DataSet.FieldByName('NumScan').AsInteger;
    Kol:=db.DataSource.DataSet.FieldByName('Cnt').AsInteger;
    if Pr>0 then
     begin
      if Kol=Pr then db.Canvas.Brush.Color:=clLime else
      if Pr<Kol then db.Canvas.Brush.Color:=clYellow
                else db.Canvas.Brush.Color:=$008080FF;
     end;

    {if (db.DataSource.DataSet.FieldByName('Cnt').AsInteger=db.DataSource.DataSet.FieldByName('NumScan').AsInteger) and
       (db.DataSource.DataSet.FieldByName('Cnt').AsInteger>0) then db.Canvas.Brush.Color:=clLime else
    if (db.DataSource.DataSet.FieldByName('Cnt').AsInteger<>db.DataSource.DataSet.FieldByName('NumScan').AsInteger) and
       (db.DataSource.DataSet.FieldByName('NumScan').AsInteger>0) then db.Canvas.Brush.Color:=clYellow;
    }
   end;
  if gdSelected in State then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  if Column=db.Columns[2] then
   begin
    R.Left:=Rect.Left;
    R.Top:=Rect.Top;
    R.Right:=Rect.Right;
    R.Bottom:=Rect.Bottom+1;
    DrawGridCheckBox(db.Canvas,R,db.DataSource.DataSet.FieldByName('f').AsInteger=1);
   end;

  if (db.DataSource.DataSet.FieldByName('Marked').AsInteger=1) and (DataCol=0) then
   begin
    dr:=Rect;
    dr.Left:=dr.Left+2; dr.Top:=dr.Top+1;
    dr.Right:=dR.Left+imChp.Width; dr.Bottom:=dR.Top+imChp.Height;

    db.Canvas.FillRect(Rect);
    db.Canvas.TextOut(Rect.Left+imChp.Width+6, Rect.Top+1,db.DataSource.DataSet.FieldByName('Date_Nakl').AsString);

    C1:=imChp.Canvas.Pixels[0,0];
    C:=$00DFE2EC;
    for i:=0 to imChp.Width-1 do
     for j:=0 to imChp.Height-1 do
      if imChp.Canvas.Pixels[i,j]=C1 then imChp.Canvas.Pixels[i,j]:=C;
    sR.Left:=0; sR.Top:=0; sR.Right:=imChp.Width; sR.Bottom:=imChp.Height;
    db.Canvas.CopyRect(dR,imChp.Canvas,sR);
   end;
 end;


procedure TViewNaklF.BitBtn1Click(Sender: TObject);
var Tb:TTableObj;
    i,F_NDS,It,Kol,Tn:Integer;
    NDS:Boolean;
    VzDescr,FirmName,AptekaName,S:String;
 begin
  It:=0;
  Tb:=nil;
  if DM.spY_NaklList.IsEmpty then Exit;
  if DM.qrShowNakl.IsEmpty then Exit;

  if DM.spY_NaklList.FieldByName('obl').AsInteger=2 then // Печать накладной на ТМЦ
   begin
    try
     PrintRep.Clear;
     PrintRep.SetDefault;
     PrintRep.Font.Size:=6;
 
     PrintRep.AddText('Накладная ТМЦ № '+DM.spY_NaklList.FieldByName('NN_Nakl').AsString+'от '+DateToStrRU(DM.spY_NaklList.FieldByName('Date_Nakl').AsDateTime)+#10);
     PrintRep.AddText('От кого: '+Prm.AptekaNameRU+#10#10);
     PrintRep.Font.Size:=4;
     PrintRep.Align:=AL_LEFT;

     DM.Qr.Close;
     if rbPr.Checked then
      DM.Qr.SQL.Text:='exec spY_NaklListTMC '+DM.spY_NaklList.FieldByName('iddoc').AsString+',1'
     else
      DM.Qr.SQL.Text:='exec spY_NaklListTMC '+DM.spY_NaklList.FieldByName('iddoc').AsString+',2';

     DM.Qr.Open;

     PrintRep.Qr:=DM.Qr;
     PrintRep.PrintTable(False,0,0);
     PrintRep.PreView;
    except
     on E:Exception do MainF.MessBox('Ошибка печати накладной ТМЦ:'+E.Message);
    end;
    Exit;
   end;

  try
   F_NDS:=DM.qrShowNakl.FieldByName('F_NDS').AsInteger;
   if F_NDS<=2 then
    begin
     if Prm.AptekaNameLic<>Prm.AptekaNameRU then AptekaName:=Prm.AptekaNameLic+' ('+Prm.AptekaNameRU+')'
                                            else AptekaName:=Prm.AptekaNameLic;

     FirmName:=Prm.FirmNameRU;
    end else begin
              AptekaName:=Opt.CHPAddr;
              FirmName:=Opt.CHPName;
             end;
   Tn:=DM.spY_NaklList.FieldByName('DebCrd').AsInteger;
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=4;
   Case Tn of
    DC_INCOME:begin
               PrintRep.AddTable(4,5);
               Tb:=PrintRep.LastTable;
               Tb.SetWidths('1200,1400,2600,1400');
               Tb.MergeCells(1,1,3,1);
               Tb.MergeCells(1,5,3,5);
               for i:=1 to 3 do Tb.Cell[4,i].Align:=AL_CENTER;
               Tb.SetBorders(1,1,4,5,EMPTY_BORDER);
               if Prm.FirmID<>5 then
                begin
                 Tb.SetBorders(4,1,4,3,Border(clBlack,5,psSolid));

                 Tb.Cell[4,1].AddText(Prm.FirmNameUA);
                 Tb.Cell[4,2].Font.Size:=3;
                 Tb.Cell[4,2].AddText('ВХОДНОЙ КОНТРОЛЬ');
                 Tb.Cell[4,3].AddText('ПРОВИЗОР___________');

                 Tb.Cell[4,2].TopBorder:=EMPTY_BORDER;
                 Tb.Cell[4,3].TopBorder:=EMPTY_BORDER;
                end;

               Tb.Cell[1,1].Font.Style:=[fsBold];
               Tb.Cell[1,5].Font.Style:=[fsBold];
               Tb.Cell[1,1].AddText(FirmName);
               Tb.Cell[1,1].Font.Style:=[];
               Tb.Cell[1,1].AddText(' ('+Prm.SkladAdress+')');

               Tb.Cell[1,4].AddText('на отпуск товара');
               Tb.Cell[1,5].AddText('Кому: '+AptekaName);
               if Prm.FirmID<>5 then
                Tb.Cell[4,5].AddText(FormatDateTime('dd.mm.yyyy hh:nn:ss',Now));

               Tb.Cell[2,2].AddInterv(2);
               Tb.Cell[1,2].Font.Style:=[fsBold];
               Tb.Cell[1,2].AddText(DateToStrRU(DM.spY_NaklList.FieldByName('Date_Nakl').AsDateTime));
               Tb.Cell[1,3].Font.Style:=[fsBold];
               Tb.Cell[1,3].AddText('Накладная №');
               Tb.SetBorders(2,3,2,3,Border(clBlack,4,psSolid));
               Tb.Cell[2,3].AddText(DM.spY_NaklList.FieldByName('NN_Nakl').AsString);
               {
                Case Tn of
                 DC_INCOME:Tb.Cell[2,3].AddText(DM.spY_NaklList.FieldByName('NN_Nakl').AsString);
                 DC_BACK:  Tb.Cell[2,3].AddText(DM.spY_NaklList.FieldByName('NN_Nakl').AsString+'-'+IntToStr(Prm.AptekaID));
                end;
               }
              end;
    DC_BACK:  begin

               PrintRep.Font.Size:=6;
               PrintRep.Font.Style:=[fsBold];
               PrintRep.Align:=AL_CENTER;
               PrintRep.AddText('Накладная № '+DM.spY_NaklList.FieldByName('NN_Nakl').AsString+#10);
               PrintRep.Font.Size:=5;
               PrintRep.AddText('на возврат товара из розницы'+#10);
               PrintRep.AddText('от '+DateToStrRU(DM.spY_NaklList.FieldByName('Date_Nakl').AsDateTime)+#10#10);
               PrintRep.Font.Size:=4;
               PrintRep.Align:=AL_LEFT;

               PrintRep.AddText('От кого: '+AptekaName+#10);

               DM.QrEx3.Close;
               DM.QrEx3.SQL.Text:='select priznak from JMoves where iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString;
               DM.QrEx3.Open;

               Case DM.QrEx3.FieldByName('priznak').AsInteger of
                 1:PrintRep.AddText('Основание: Другая причина'+#10);
                 7:PrintRep.AddText('Основание: АВС ручной'+#10);
                12:PrintRep.AddText('Основание: АВС - анализ'+#10) else PrintRep.AddText('Основание: '+DBText4.Caption+#10);
               end;

               PrintRep.AddText('в фармотдел (отдел возвратов)'+#10#10);

               PrintRep.AddText('Кому: '+FirmName);

               {PrintRep.AddTable(3,5);
               Tb:=PrintRep.LastTable;
               Tb.SetWidths('2000,1500,3000');
               Tb.SetBorders(1,1,3,5,EMPTY_BORDER);
               Tb.MergeCells(2,1,3,1);
               Tb.MergeCells(2,2,3,2);
               Tb.Cell[1,1].Font.Style:=[fsBold];
               Tb.Cell[1,5].Font.Style:=[fsBold];
               Tb.Cell[1,1].AddText(AptekaName+#10);
               if F_NDS<=2 then Tb.Cell[1,1].AddText('в фармотдел (отдел возвратов)!');
               Tb.Cell[1,4].AddText('на возврат товара');
               Tb.Cell[1,5].AddText('Кому: '+FirmName);

               try
                DM.QrEx.Close;
                DM.QrEx.SQL.Text:='select VzDescr from JMoves where iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString;
                DM.QrEx.Open;
                VzDescr:=DM.QrEx.FieldByName('VzDescr').AsString;
               except
                VzDescr:='';
               end;

               if DBText4.Caption='' then
                Tb.Cell[2,1].AddText('Заполнить обязательно - причина (сроки,долг склада, т.д.)'+#10+'___________________')

               else begin
                     Tb.Cell[2,1].AddText('Причина возврата: ');
                     Tb.Cell[2,1].Font.Style:=[fsBold];
                     Tb.Cell[2,1].Font.Size:=6;
                     Tb.Cell[2,1].AddText(DBText4.Caption);
                    end;
               Tb.Cell[2,2].AddText('Возврат сделан по распоряжению______________________________________'#10);

               if VzDescr<>'' then
                Tb.Cell[2,2].AddText('Основания для возврата: '+VzDescr);
              }
              end;
   end;


   PrintRep.AddInterv(4);
   if DM.spY_NaklList.FieldByName('f_nds').AsInteger=1 then NDS:=True else NDS:=False;
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   Kol:=4;
   Case Tn of
    DC_INCOME:begin
               PrintRep.Font.Size:=5;
               PrintRep.Font.Style:=[fsBold];
               PrintRep.Indent:=0;
               PrintRep.AddText(#10+'Второй экземпляр накладной обязательно вернуть в бухгалтерию'+#10);
               PrintRep.AddInterv(1);
               PrintRep.Font.Style:=[];
               PrintRep.Font.Size:=4;
               if NDS then
                begin
                 DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1150],');
                 DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
                 DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
                 DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
                 DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)/6. as [Цена без НДС_N_1700],');
                 DM.Qr.SQL.Add('Max(a.Cena)/6. as [НДС на ед_N_1500],');
                 DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
                 DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
                 It:=8;
                end else begin
                          DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1150],');
                          DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
                          DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
                          DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
                          DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)*(7./107.) as [Цена без НДС_N_1700],');
                          DM.Qr.SQL.Add('Max(a.Cena)*(7./107.) as [НДС на ед_N_1500],');
                          DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
                          DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
                          It:=8;
{                          DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1100],');
                          DM.Qr.SQL.Add('       b.Names as Наименование_S_9000,');
                          DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1100],');
                          DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1600],');
                          DM.Qr.SQL.Add('Max(a.Cena) as Цена_N_1700,');
                          DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as Сумма_N_1700');
                          It:=6;
}
                         end;
               DM.Qr.SQL.Add('from Moves a, SprTov b where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('IDDOC').AsString);
               DM.Qr.SQL.Add('group by b.art_code,b.Names,b.f_nds');
               DM.Qr.SQL.Add('order by b.Names');
              end;
    DC_BACK:  begin
               if NDS then
                begin
                 DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1050],');
                 DM.Qr.SQL.Add('       b.art_code as Код_S_1100,');
                 DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
                 DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
                 DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
                 DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)/6. as [Цена без НДС_N_1700],');
                 DM.Qr.SQL.Add('Max(a.Cena)/6. as [НДС на ед_N_1500],');
                 DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
                 DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
                 It:=9;
                end else begin
                          DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1050],');
                          DM.Qr.SQL.Add('       b.art_code as Код_S_1100,');
                          DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
                          DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
                          DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
                          DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)*(7./107.) as [Цена без НДС_N_1700],');
                          DM.Qr.SQL.Add('Max(a.Cena)*(7./107.) as [НДС на ед_N_1500],');
                          DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
                          DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
                          It:=9;
{
                          DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1050],');
                          DM.Qr.SQL.Add('       b.art_code as Код_S_1100,');
                          DM.Qr.SQL.Add('       b.Names as Наименование_S_9000,');
                          DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1100],');
                          DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1600],');
                          DM.Qr.SQL.Add('Max(a.Cena) as Цена_N_1700,');
                          DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as Сумма_N_1700');
                          It:=7;
}
                         end;

               DM.Qr.SQL.Add('from Moves a, SprTov b where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('IDDOC').AsString);
               DM.Qr.SQL.Add('group by b.art_code,b.Names,b.f_nds');
               DM.Qr.SQL.Add('order by b.Names');

              { if NDS then
                begin
                 DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1150],');
                 DM.Qr.SQL.Add('       b.Names as Наименование_S_7050,');
                 DM.Qr.SQL.Add('       a.kod_name as [Код_I_1900],');
                 DM.Qr.SQL.Add('       a.Kol as [Кол-во_I_1500],');
                 DM.Qr.SQL.Add('a.Cena-(a.Cena*0.2) as [Цена без НДС_N_1700],');
                 DM.Qr.SQL.Add('a.Cena*0.2 as [НДС на ед_N_1500],');
                 DM.Qr.SQL.Add('a.Cena as [Цена с НДС_N_1500],');
                 DM.Qr.SQL.Add('a.Kol*a.Cena as [Сумма_N_1900]');
                 It:=8;
                end else begin
                          DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1100],');
                          DM.Qr.SQL.Add('       b.Names as Наименование_S_8300,');
                          DM.Qr.SQL.Add('       a.kod_name as [Код_I_1800],');
                          DM.Qr.SQL.Add('       a.Kol as [Кол-во_I_1600],');
                          DM.Qr.SQL.Add('a.Cena as Цена_N_1700,');
                          DM.Qr.SQL.Add('a.Kol*a.Cena as Сумма_N_1700');
                          It:=6;
                         end;
               DM.Qr.SQL.Add('from Moves a, SprTov b where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('IDDOC').AsString);
               DM.Qr.SQL.Add('order by b.Names, a.kod_name');
              }
              end;
   end;
   DM.Qr.Open;
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(Nds,It,Kol);

   Case Tn of
    DC_INCOME:begin
               S:='______________/                             /';
               PrintRep.Font.Size:=4;
               PrintRep.Font.Style:=[fsBold];
               PrintRep.AddText(#10#10+'Отпуск разрешил:'+S+'         ');
               PrintRep.Font.Size:=3;
               PrintRep.Font.Style:=[];
//               PrintRep.AddText(#10+'                                             (начальник отдела розничной торговли)');

               PrintRep.Font.Size:=4;
               PrintRep.Font.Style:=[fsBold];

               if Copy(DM.spY_NaklList.FieldByName('NN_Nakl').AsString,1,3)<>'Ппр' then
                begin
                 PrintRep.AddText(#10#10+'Отпустил:'+S+'     Получил:_____________    __________    _____________ ');
                 PrintRep.Font.Size:=3;
                 PrintRep.Font.Style:=[];
                 PrintRep.AddText(#10+'                                                                                                 '
                                     +'                                                                     (должность)                 (подпись)                      (фио)');
                end else begin
                          PrintRep.AddText(#10#10+'Получил:_____________    __________    _____________ ');
                          PrintRep.Font.Size:=3;
                          PrintRep.Font.Style:=[];
                          PrintRep.AddText(#10+'                        (должность)                 (подпись)                      (фио)');
                         end;
              end;
    DC_BACK:  PrintRep.AddText(#10#10+'Отпустил:_______________________           Получил:_________________________'+#10);
   end;

   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования печатной формы накладной: '+E.Message);
  end;
 end;

procedure TViewNaklF.rbPrClick(Sender:TObject);
begin
  CheckBox4.Enabled:=false;
  CheckBox4.Checked:=false;
  BitBtn5Click(BitBtn5);
  BitBtn5Click(BitBtn5);
  N3.Visible:=rbVz.Checked;
end;

procedure TViewNaklF.rbVzClick(Sender:TObject);
begin
  CheckBox4.Enabled:=true;
  BitBtn5Click(BitBtn5);
  BitBtn5Click(BitBtn5);
  N3.Visible:=rbVz.Checked;
end;

procedure TViewNaklF.btDelClick(Sender:TObject);
var iddoc:Integer;
 begin
  if Not MainF.CheckPassword('0523574825') then Exit;
  if DM.spY_NaklList.IsEmpty then Exit;
  if MainF.MessBox('Удалить накладную: '+DM.spY_NaklList.FieldByName('nn_nakl').AsString+' ?',52)<>ID_YES then Exit;
  iddoc:=DM.spY_NaklList.FieldByName('iddoc').AsInteger;
  DM.ADOCo.BeginTrans;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   if rbPr.Checked then DM.Qr.SQL.Add('update SprTov set Ostat=Ostat-a.kol')
                   else DM.Qr.SQL.Add('update SprTov set Ostat=Ostat+a.kol');
   DM.Qr.SQL.Add('from rTovar a, SprTov b');
//   DM.Qr.SQL.Add('from Moves a, SprTov b');
   DM.Qr.SQL.Add('where a.kod_name=b.kod_name and');
   DM.Qr.SQL.Add('      a.iddoc='+IntToStr(iddoc));
   DM.Qr.SQL.Add('delete from rTovar where iddoc='+IntToStr(iddoc));
   DM.Qr.SQL.Add('delete from JMoves where iddoc='+IntToStr(iddoc));
   DM.Qr.ExecSQL;
   DM.ADOCo.CommitTrans;
//   MainF.MessBox('Накладная '+DM.spY_NaklList.FieldByName('nn_nakl').AsString+' удалена успешно!',64);
   BitBtn5Click(BitBtn5);
   if MainF.Design=False then MainF.FilterSklad;
  except
   DM.ADOCo.RollbackTrans;
   MainF.MessBox('Ошибка удаления накладной: '+DM.spY_NaklList.FieldByName('nn_nakl').AsString+'.');
  end;
 end;

procedure TViewNaklF.SelectNakls(ColName:String; All:Boolean; Value:Boolean);
var V,RID:Integer;
 begin
  if DM.spY_NaklList.IsEmpty then Exit;
  if ColName='f' then
   try
    RID:=DM.spY_NaklList.FieldByName('ROW_ID').AsInteger;
    DM.Qr.Close;
    if Value then V:=1 else V:=0;
    DM.Qr.SQL.Clear;
    if Not All then
     DM.Qr.SQL.Add('Update ##nakllist set F=1-F where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and row_id='+DM.spY_NaklList.FieldByName('row_id').AsString)
    else begin
          DM.Qr.SQL.Add('Update ##nakllist set F='+IntToStr(V)+' where nn_nakl not like ''%пр-%'' and priznak not in (select Descr from SPRPRVOZR where id in (9,10)) and compname=host_name() and id_user='+IntToStr(Prm.UserID));
         end;
    DM.Qr.SQL.Add('Update ##nakllist set F=0 where priznak in (select Descr from SPRPRVOZR where id in (9,10))');
    DM.Qr.ExecSQL;
    NaklList(1);
    DM.spY_NaklList.Locate('ROW_ID',RID,[]);
   except
   end;
 end;

procedure TViewNaklF.DBGrid1CellClick(Column:TColumn);
 begin
  SelectNakls(Column.FieldName,False,False);
 end;

procedure TViewNaklF.CheckBox1Click(Sender:TObject);
 begin
  SelectNakls('f',True,CheckBox1.Checked);
 end;

procedure TViewNaklF.BitBtn3Click(Sender:TObject);
var i,iii:Integer;
    EAN13,S:String;
 begin
  try
{
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select * from JMoves where IsNull(EANDriver,'''')<>'''' and iddoc in (select iddoc from ##nakllist where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 group by iddoc)';
   DM.QrEx.Open;
   if Not DM.QrEx.IsEmpty then
    begin
     MainF.MessBox('На все или некоторые выбранные накладные уже был напечатан акт приема передачи!');
     Exit;
    end;

   if MainF.MessBox('После печати Акта приема-передачи вы не сможете его напечатать повторно! Вы уверены, что хотите распечатать Акт?',52)<>ID_YES then Exit;
}
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('if Object_ID(N''tempdb..#tmpnspis'') is not null drop table #tmpnspis ');
   DM.Qr.SQL.Add('select iddoc,nn_nakl ');
   DM.Qr.SQL.Add('into #tmpnspis ');
   DM.Qr.SQL.Add('from  Moves (nolock) ');
   DM.Qr.SQL.Add('where IsNull(IsScan,0)>0 and IsNull(Shtrih,0)=0 ');
   DM.Qr.SQL.Add('      and iddoc in (select iddoc from ##nakllist where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 )');
   DM.Qr.SQL.Add('group by iddoc,nn_nakl');

   DM.Qr.SQL.Add('select * from #tmpnspis ');
   DM.Qr.SQL.Add('order by 2');
   DM.Qr.Open;
   if DM.Qr.IsEmpty=False then
    begin
     S:='';
     for i:=1 to DM.Qr.RecordCount do
      begin
       if i=1 then DM.Qr.First else DM.Qr.Next;
       S:=S+'      '+DM.Qr.FieldByName('nn_nakl').AsString+#10;
     end;
     ShowText('Для следующих накладных невозможно напечатать акт приема-передачи, так как не все ящики закрыты: '#10+S);
    end;

   if (Prm.UserRole<>R_ADMIN) then
    begin
     RegPredstF:=TRegPredstF.Create(Self);
     try

      RegPredstF.crPref:=CR_DRIVER;
      RegPredstF.OnlyScan:=True;
      RegPredstF.Cap:='водителя';
      RegPredstF.Tab:='RegDrivers';
      Application.ProcessMessages;
      RegPredstF.ShowModal;

      if RegPredstF.Flag=False then Exit;
      EAN13:=RegPredstF.EAN13;
      try
       if Length(EAN13)<>13 then Abort;

       DM.QrEx.Close;
       DM.QrEx.SQL.Clear;
       DM.QrEx.SQL.Add('update JMoves set Date_Close=getdate(), EANDriver='''+EAN13+''' where iddoc in (select iddoc from ##nakllist where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) group by iddoc)');
       DM.QrEx.SQL.Add('select top 1 EANDriver from JMoves where IsNull(EANDriver,'''')='''' and iddoc in (select iddoc from ##nakllist where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) group by iddoc) ');
       DM.QrEx.Open;

       if DM.QrEx.IsEmpty=False then Abort;
      except
       MainF.MessBox('Штрих-код водителя некорректный! Просканируйте еще раз!');
       Exit;
      end;
     finally
      RegPredstF.Free;
     end;
    end;

   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=3;

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select id_p from ##nakllist where id_p>0 and id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) group by id_p';
   DM.QrEx.Open;

   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;
     for iii:=1 to 2 do
      begin
       PrintRep.Align:=AL_LEFT;

       DM.Qr.Close;
       DM.Qr.SQL.Clear;
       DM.Qr.SQL.Add('select nn_nakl+''-'+IntToStr(Prm.AptekaID)+''' +case Priznak when 19 then ''     ЯЩИКИ'' else ''''      end as [Номера накладных_S_600], ');
       DM.Qr.SQL.Add('       date_nakl as [Дата_S_400], ');
       DM.Qr.SQL.Add('       Summa as [Сумма_N_300] ');
       DM.Qr.SQL.Add('from JMoves ');
       DM.Qr.SQL.Add('where iddoc in (select iddoc from ##nakllist where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) and id_p='+DM.QrEx.FieldByName('id_p').AsString+')');
       DM.Qr.Open;

       PrintRep.AddTable(2,1);
       PrintRep.LastTable.SetWidths('7000,3000');
       PrintRep.LastTable.SetBorders(1,1,2,1,EMPTY_BORDER);

       PrintRep.LastTable.Cell[1,1].AddText('Приложение №2');

       PrintRep.LastTable.Cell[2,1].AddText('Приложение №2');
       PrintRep.Font.Size:=3;

       PrintRep.Align:=AL_CENTER;
       PrintRep.AddText(#10+'Акт'+#10);
       PrintRep.AddText('приема-передачи товара'+#10);
       PrintRep.AddTable(2,1);
       PrintRep.LastTable.SetBorders(1,1,2,1,EMPTY_BORDER);
       PrintRep.LastTable.Cell[1,1].Align:=AL_LEFT;
       PrintRep.LastTable.Cell[1,1].AddText('г.Харьков');
       PrintRep.LastTable.Cell[2,1].Align:=AL_RIGHT;
       PrintRep.LastTable.Cell[2,1].AddText(DateToStr(Date));
       PrintRep.Align:=AL_JUST;

       PrintRep.Indent:=15;
       PrintRep.AddText(#10+'Заведующая (зам. заведующей) аптеки "'+Prm.AptekaNameRU+' '+Prm.FirmNameRU+' ______________/ФИО/, ');
       PrintRep.AddText('передал товар в нижеуказанном количестве ящиков (кульков), которые опечатаны и не имеют видимых повреждений, а водитель');
       PrintRep.AddText('(экспедитор) __________/ФИО/ принял указанный товар  для последующей доставки поставщику ПФ "Гамма 55"');
       PrintRep.AddText(#10#10);
       PrintRep.AddText('Количество ящиков (кульков) без видимых повреждений ___________________');
       PrintRep.AddText(#10);

       PrintRep.Qr:=DM.Qr;
       PrintRep.PrintTable(False,0,0);
       PrintRep.AddText(#10+'Накладных '+IntToStr(DM.Qr.RecordCount)+' на сумму ');
       DM.Qr.Close;
       DM.Qr.SQL.Text:='select Sum(Summa) as Summa from ##nakllist where  id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) and id_p='+DM.QrEx.FieldByName('id_p').AsString;
       DM.Qr.Open;
       PrintRep.AddText(CurrToStrF(DM.Qr.FieldByName('Summa').AsFloat,ffFixed,2)+' грн. '#10);

       DM.Qr.Close;
       DM.Qr.SQL.Clear;
       DM.Qr.SQL.Add('select art_code');
       DM.Qr.SQL.Add('from  Moves a, SprTov b');
       DM.Qr.SQL.Add('where a.kod_name=b.kod_name ');
       DM.Qr.SQL.Add('      and iddoc in (select iddoc from ##nakllist where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) and id_p='+DM.QrEx.FieldByName('id_p').AsString+')');
       DM.Qr.SQL.Add('group by art_code');
       DM.Qr.Open;
       PrintRep.AddText('Количество наименований: '+IntToStr(DM.Qr.RecordCount)+'   ');

       DM.Qr.Close;
       DM.Qr.SQL.Clear;
       DM.Qr.SQL.Add('select Sum(kol) as kol');
       DM.Qr.SQL.Add('from Moves');
       DM.Qr.SQL.Add('where iddoc in (select iddoc from ##nakllist where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) and id_p='+DM.QrEx.FieldByName('id_p').AsString+')');
       DM.Qr.Open;
       PrintRep.AddText('Количество штук: '+DM.Qr.FieldByName('kol').AsString+#10);
       PrintRep.AddText('Акт сформирован: '+FormatDateTime('dd.mm.yyyy hh:nn:ss',Now)+#10#10);

       PrintRep.Font.Size:=3;
       PrintRep.AddTable(2,1);
       PrintRep.LastTable.SetWidths('2000,1300');
       PrintRep.LastTable.SetBorders(1,1,2,1,EMPTY_BORDER);
       PrintRep.LastTable.Cell[1,1].Align:=AL_LEFT;
       PrintRep.LastTable.Cell[1,1].AddText('Отпустил товар с аптеки'+#10#10+'_____________________________');
       
       PrintRep.LastTable.Cell[2,1].Align:=AL_LEFT;
       PrintRep.LastTable.Cell[2,1].AddText('Принял экспедитор (водитель)'+#10#10+'_____________________________'+#10#10);
       PrintRep.LastTable.Cell[2,1].AddText('Принял товар '+#10+'_____________________________');
       
       DM.Qr1.Close;
       DM.Qr1.SQL.Clear;
       DM.Qr1.SQL.Add('select a.nn_nakl as [№ Накл._S_2500],a.date_nakl as [Дата накл._S_1800], b.art_code as [Код_I_1500],b.names as [Наименование_S_7000],Sum(a.kol) as [Кол. накл._I_1500],Sum(IsNull(IsScan,0)) as [Кол. скан._I_1500], ');
       DM.Qr1.SQL.Add('       Sum(a.kol)-Sum(IsNull(IsScan,0)) as [Недостача._I_2000]');
       DM.Qr1.SQL.Add('from Moves a (nolock), SprTov b (nolock) ');
       DM.Qr1.SQL.Add('where IsNull(a.IsScan,0)>0 and IsNull(a.Shtrih,0)=0 and a.date_nakl>=''2014-02-25'' and a.kod_name=b.kod_name and a.iddoc in (select iddoc from ##nakllist where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) and id_p='+DM.QrEx.FieldByName('id_p').AsString+')');
       DM.Qr1.SQL.Add('group by a.nn_nakl,a.date_nakl,b.art_code,b.names ');
       DM.Qr1.SQL.Add('having Sum(a.kol)>Sum(Isnull(IsScan,0)) ');
       DM.Qr1.SQL.Add('order by 2 ');
       DM.Qr1.Open;

       if DM.Qr1.IsEmpty=False then
        begin
         PrintRep.AddText(#10#10'Данный неотсканированный товар будет считаться как недостача');
         PrintRep.Qr:=DM.Qr1;
         PrintRep.PrintTable(False,0,0);
        end;

       if iii=1 then PrintRep.AddInterv(12);

      end;
     PrintRep.AddText(#12);
    end;

   PrintRep.PreView;
   { then
    begin
     DM.QrEx.Close;
     DM.QrEx.SQL.Text:='update JMoves set EANDriver='''+EAN13+''' where iddoc in (select iddoc from ##nakllist where id_user='+IntToStr(Prm.UserID)+' and compname=host_name() and f=1 and iddoc not in (select iddoc from #tmpnspis) group by iddoc)';
     DM.QrEx.ExecSQL;
    end; }
  except
   on E:Exception do
    MainF.MessBox('Ошибка формирования данных для акта: '+E.Message);
  end;
 end;

procedure TViewNaklF.BitBtn6Click(Sender: TObject);
 begin
  try
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=5;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.AddText('Список препаратов накладной по местам хранения'+#10#10);
   PrintRep.AddText('Торговая точка: '+Prm.AptekaNameRU+#10);
   PrintRep.AddText('Накладная №: '+DM.spY_NaklList.FieldByName('nn_nakl').AsString+#10);
   PrintRep.AddText('Дата : '+DM.spY_NaklList.FieldByName('date_nakl').AsString+#10#10);
   PrintRep.Orientation:=O_LANDS;
   PrintRep.Font.Size:=4;
   PrintRep.Font.Style:=[];

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select b.Art_Code as Код_I_1400,');
   DM.Qr.SQL.Add('       b.Names as Наименование_S_11000,');
   DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1000],');
   DM.Qr.SQL.Add('       convert(varchar(10),case Min(p.t1) when -999 then null else Min(p.t1) end)+char(176) as [Темп. реж. '#10'с_C_1200],');
   DM.Qr.SQL.Add('       convert(varchar(10),case Min(p.t2) when -999 then null else Min(p.t2) end)+char(176) as [Темп. реж. по_C_1200],');
   DM.Qr.SQL.Add('       (case Max(p.Svet) when 2 then ''Да'' when 1 then ''Нет'' else '''' end) as [Светочувств._S_1200],');
   DM.Qr.SQL.Add('       (case when n.art_code is null then ''Рецепт.'' else '''' end) as [Рецепт._S_1700],');
   DM.Qr.SQL.Add('       (case Max(p.in_out) when 0 then ''Внутр.'' when 1 then ''Наружн.'' else ''Прочее'' end) as [Приме- нение_S_1700],');
   DM.Qr.SQL.Add('       (case Max(p.Nds) when 3 then ''ДП'' else '''' end) as [Детское питание_S_1700],');
   DM.Qr.SQL.Add('       Max(p.KategMorion) as [Категория_S_1700],');
   DM.Qr.SQL.Add('       IsNull(convert(varchar(10),c.P1),'''')+IsNull(c.L1,'''') as [Осн_S_1000],');
   DM.Qr.SQL.Add('       IsNull(convert(varchar(10),c.P2),'''')+IsNull(c.L2,'''') as [Витр_S_1000],');
   DM.Qr.SQL.Add('       IsNull(convert(varchar(10),c.P3),'''')+IsNull(c.L3,'''') as [Скл_S_1000]');
   DM.Qr.SQL.Add('from Moves a, ');
   DM.Qr.SQL.Add('     SprTov b ');
   DM.Qr.SQL.Add('      left join ');
   DM.Qr.SQL.Add('     Inform..SprReg c on b.art_code=c.art_code ');
   DM.Qr.SQL.Add('      left join ');
   DM.Qr.SQL.Add('     Plist p on b.art_code=p.art_code ');
   DM.Qr.SQL.Add('      left join ');
   DM.Qr.SQL.Add('     SprNoRecipt n on b.art_code=n.art_code');
   DM.Qr.SQL.Add('where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('IDDOC').AsString);
   DM.Qr.SQL.Add('group by b.art_code,n.art_code,b.Names,c.P1,c.P2,c.P3,c.L1,c.L2,c.L3');
   DM.Qr.SQL.Add('order by b.Names');
   DM.Qr.Open;
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(False,0,0);
   PrintRep.PreView;

{
 2-прочее
 1-наружн.
 0-внутр.
}
  except
   on E:Exception do MainF.MessBox('Ошибка формирования печатной формы накладной: '+E.Message);
  end;
 end;

procedure TViewNaklF.BitBtn7Click(Sender:TObject);
var Ex:Boolean;
 begin
  try
   PrintMarkBoxF:=TPrintMarkBoxF.Create(Self);
   try
    PrintMarkBoxF.Flag:=1;
    PrintMarkBoxF.CreateList(Ex);
    Application.ProcessMessages;
    if Ex=False then PrintMarkBoxF.ShowModal;
   finally
    PrintMarkBoxF.Free;
   end;
  except
   MainF.MessBox(ER_CR_FORM);
  end;
 end;

procedure TViewNaklF.N1Click(Sender: TObject);
 begin
  if Sender=nil then Exit;
  if DM.qrShowNakl.IsEmpty then Exit;
  PrintCen(TControl(Sender).Tag);
 end;

procedure TViewNaklF.CheckBox2Click(Sender: TObject);
 begin
  if CheckBox2.Checked=False then
   begin
    BitBtn2.Caption:='Печать ценников';
    BitBtn8.Caption:='Печать ценников по новому приходу';
   end else begin
             BitBtn2.Caption:='Печать стикеров';
             BitBtn8.Caption:='Печать стикеров по новому приходу';
            end;
 end;

procedure TViewNaklF.BitBtn9Click(Sender: TObject);
var Tb:TTableObj;
 begin
  if DM.spY_NaklList.IsEmpty then Exit;
  try
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=5;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.Align:=AL_CENTER;
   PrintRep.AddText('Акт о несоответствии принимаемого товара'#10);
   PrintRep.AddText(Prm.FirmNameRU+'                    от '+DateToStr(Date)+#10);
   PrintRep.AddText('во время передачи товаров представителями торговой точки '+Prm.AptekaNameRU+#10);
   PrintRep.AddText('установили следующие несоответсвия передаваемого товара с данными по накладной '+DM.spY_NaklList.FieldByName('nn_nakl').AsString+' от '+DM.spY_NaklList.FieldByName('date_nakl').AsString+#10#10);
   PrintRep.Align:=AL_LEFT;

   PrintRep.AddText('Излишек'#10);
   PrintRep.Font.Size:=4;
   PrintRep.Font.Style:=[];
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('if Object_ID(N''tempdb..#akt'') is not null drop table #akt');
   DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_700],');
   DM.Qr.SQL.Add('       a.art_code as [Код_I_1300],');
   DM.Qr.SQL.Add('       a.names as [Наименование_S_6000],');
   DM.Qr.SQL.Add('       a.kol as [Кол-во_I_1300],');
   DM.Qr.SQL.Add('       b.kolscan as [Отскан_I_1300],');
   DM.Qr.SQL.Add('       Abs(a.kol-IsNull(b.kolscan,0)) as [Разн_I_1300],');
   DM.Qr.SQL.Add('       a.cena as [Цена_N_1300],');
   DM.Qr.SQL.Add('       a.cena*Abs(a.kol-IsNull(b.kolscan,0)) as [Сумма_N_1300],');
   DM.Qr.SQL.Add('       c.Users as [Приемщик_S_4000]');
   DM.Qr.SQL.Add('into #akt');
   DM.Qr.SQL.Add('from  (select m.nn_nakl,m.date_nakl,s.art_code,s.names,Sum(m.kol) as kol,m.cena from Moves m, SprTov s where m.kod_name=s.kod_name and m.nn_nakl='''+DM.spY_NaklList.FieldByName('nn_nakl').AsString+''' and m.date_nakl='''+FormatDateTime('yyyy-mm-dd',DM.spY_NaklList.FieldByName('date_nakl').AsDateTime)+' 00:00:00'' group by m.nn_nakl,m.date_nakl,s.art_code,s.names,m.cena) a ');
   DM.Qr.SQL.Add('      left join ScanNakl b on a.art_code=b.art_code and a.nn_nakl=b.nn_nakl and a.date_nakl=b.date_nakl left join SprUser c on b.id_user=c.id');
   DM.Qr.SQL.Add('where a.kol<IsNull(b.kolscan,0)');
   DM.Qr.SQL.Add('order by 3');

   DM.Qr.SQL.Add('if (select Count(*) from #akt)>0');
   DM.Qr.SQL.Add(' insert into #akt([№ пп._S_700],[Наименование_S_6000],[Сумма_N_1300]) ');
   DM.Qr.SQL.Add(' select '''',''Итого'',Sum(a.cena*Abs(a.kol-IsNull(b.kolscan,0))) ');
   DM.Qr.SQL.Add(' from  (select m.nn_nakl,m.date_nakl,s.art_code,s.names,Sum(m.kol) as kol,m.cena from Moves m, SprTov s where m.kod_name=s.kod_name and m.nn_nakl='''+DM.spY_NaklList.FieldByName('nn_nakl').AsString+''' and m.date_nakl='''+FormatDateTime('yyyy-mm-dd',DM.spY_NaklList.FieldByName('date_nakl').AsDateTime)+' 00:00:00'' group by m.nn_nakl,m.date_nakl,s.art_code,s.names,m.cena) a ');
   DM.Qr.SQL.Add('       left join ScanNakl b on a.art_code=b.art_code and a.nn_nakl=b.nn_nakl and a.date_nakl=b.date_nakl left join SprUser c on b.id_user=c.id');
   DM.Qr.SQL.Add(' where a.kol<IsNull(b.kolscan,0)');
   DM.Qr.SQL.Add('select * from #akt order by 1 desc,3');
//   DM.Qr.SQL.SaveToFile('C:\AktN.txt');
   DM.Qr.Open;

   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(False,0,0);

   PrintRep.Font.Size:=5;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.AddText(#10#10'Недостача'#10);
   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Size:=4;
   PrintRep.Font.Style:=[];

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('if Object_ID(N''tempdb..#akt'') is not null drop table #akt');
   DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_700],');
   DM.Qr.SQL.Add('       a.art_code as [Код_I_1300],');
   DM.Qr.SQL.Add('       a.names as [Наименование_S_6000],');
   DM.Qr.SQL.Add('       a.kol as [Кол-во_I_1300],');
   DM.Qr.SQL.Add('       b.kolscan as [Отскан_I_1300],');
   DM.Qr.SQL.Add('       Abs(a.kol-IsNull(b.kolscan,0)) as [Разн_I_1300],');
   DM.Qr.SQL.Add('       a.cena as [Цена_N_1300],');
   DM.Qr.SQL.Add('       a.cena*Abs(a.kol-IsNull(b.kolscan,0)) as [Сумма_N_1300],');
   DM.Qr.SQL.Add('       c.Users as [Приемщик_S_4000]');
   DM.Qr.SQL.Add('into #akt');
   DM.Qr.SQL.Add('from  (select m.nn_nakl,m.date_nakl,s.art_code,s.names,Sum(m.kol) as kol,m.cena from Moves m, SprTov s where m.kod_name=s.kod_name and m.nn_nakl='''+DM.spY_NaklList.FieldByName('nn_nakl').AsString+''' and m.date_nakl='''+FormatDateTime('yyyy-mm-dd',DM.spY_NaklList.FieldByName('date_nakl').AsDateTime)+' 00:00:00'' group by m.nn_nakl,m.date_nakl,s.art_code,s.names,m.cena) a ');
   DM.Qr.SQL.Add('      left join ScanNakl b on a.art_code=b.art_code and a.nn_nakl=b.nn_nakl and a.date_nakl=b.date_nakl left join SprUser c on b.id_user=c.id');
   DM.Qr.SQL.Add('where a.kol>IsNull(b.kolscan,0)');
   DM.Qr.SQL.Add('order by 3');

   DM.Qr.SQL.Add('if (select Count(*) from #akt)>0');
   DM.Qr.SQL.Add(' insert into #akt([№ пп._S_700],[Наименование_S_6000],[Сумма_N_1300]) ');
   DM.Qr.SQL.Add(' select '''',''Итого'',Sum(a.cena*Abs(a.kol-IsNull(b.kolscan,0))) ');
   DM.Qr.SQL.Add(' from  (select m.nn_nakl,m.date_nakl,s.art_code,s.names,Sum(m.kol) as kol,m.cena from Moves m, SprTov s where m.kod_name=s.kod_name and m.nn_nakl='''+DM.spY_NaklList.FieldByName('nn_nakl').AsString+''' and m.date_nakl='''+FormatDateTime('yyyy-mm-dd',DM.spY_NaklList.FieldByName('date_nakl').AsDateTime)+' 00:00:00'' group by m.nn_nakl,m.date_nakl,s.art_code,s.names,m.cena) a ');
   DM.Qr.SQL.Add('       left join ScanNakl b on a.art_code=b.art_code and a.nn_nakl=b.nn_nakl and a.date_nakl=b.date_nakl left join SprUser c on b.id_user=c.id');
   DM.Qr.SQL.Add(' where a.kol>IsNull(b.kolscan,0)');
   DM.Qr.SQL.Add('select * from #akt order by 1 desc,3');
//   DM.Qr.SQL.SaveToFile('C:\AktN1.txt');
   DM.Qr.Open;

   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(False,0,0);

   PrintRep.Font.Size:=5;
   PrintRep.AddText(#10#10'Представитель торговой точки '+Prm.UserName+#10);

   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования печатной формы: '+E.Message);
  end;
 end;

procedure TViewNaklF.DBGrid2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key in K_ARROW_KEYS then FSr:='';
  if Key=VK_RETURN then DBGrid2DblClick(Sender);
 end;

procedure TViewNaklF.DBGrid2KeyPress(Sender: TObject; var Key: Char);
var db:TDBGrid;
    NC:Integer;
    IsFind:Boolean;
 begin
  if Sender=nil then Exit;
  if DM.spY_NaklList.IsEmpty then Exit;
  if DM.qrShowNakl.IsEmpty then Exit;
  if Copy(DM.spY_NaklList.FieldByName('nn_nakl').AsString,2,3)='пр-' then Exit;
  if Key in CH_DIGIT then
   begin
    FSr:=FSr+Key;
    FSr:=MainF.FindEAN13(TDBGrid(Sender),FSr,SC_MOVES,1,IsFind,DM.spY_NaklList.FieldByName('iddoc').AsInteger);
    if isFind then EnterKol(DM.qrShowNakl.FieldByName('art_code').AsInteger,0);
   end;
 end;

procedure TViewNaklF.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var Kol,Pr:Integer;
    db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  Kol:=db.DataSource.DataSet.FieldByName('Kol').AsInteger;
  pr:=db.DataSource.DataSet.FieldByName('IsScan').AsInteger;
  if pr<>0 then
   begin
    if (gdSelected in State) and (DataCol=2) then
     begin
      db.Canvas.Brush.Color:=clNavy;
      db.Canvas.Font.Color:=clWhite;
     end else begin
               if Kol=Pr then db.Canvas.Brush.Color:=clLime else
               if Pr<Kol then db.Canvas.Brush.Color:=clYellow
                         else db.Canvas.Brush.Color:=$008080FF;
               db.Canvas.Font.Color:=clBlack;
              end;
    db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
   end;
 end;

procedure TViewNaklF.DBGrid2DblClick(Sender: TObject);
 begin
  try
   if DM.qrShowNakl.IsEmpty then Exit;
   EnterKol(DM.qrShowNakl.FieldByName('Art_Code').AsInteger,1);
  except
   on E:Exception do MainF.MessBox('Ошибка записи в журнал сканирования накладных: '+E.Message);
  end;
 end;

procedure TViewNaklF.EnterKol(AC:Integer; P:Byte);
var Kol,Kol1,TP:Integer;
    IsOne:Boolean;
 begin

  if DM.qrShowNakl.IsEmpty then Exit;
  if CheckMarked=False then Exit;

  DM.Qr6.Close;
  DM.Qr6.SQL.Text:='select dbo.GetKoefUpak('+IntToStr(AC)+') as Koef';
  DM.Qr6.Open;

  IsOne:=DM.qrShowNakl.FieldByName('Priznak').AsInteger=18;

  EnterKolScanF:=TEnterKolScanF.Create(Self);
  try
   Kol:=DM.Qr6.FieldByName('Koef').AsInteger;
   EnterKolScanF.Label2.Caption:=DM.qrShowNakl.FieldByName('Names').AsString;
   Kol1:=DM.qrShowNakl.FieldByName('Kol').AsInteger-DM.qrShowNakl.FieldByName('IsScan').AsInteger;
   if Kol1<0 then Kol1:=0;

   if IsOne then
    begin
     EnterKolScanF.edKol.Text:='1';
     EnterKolScanF.edKol.Enabled:=False;
    end else begin
              if Kol<Kol1 then
               EnterKolScanF.edKol.Text:=IntToStr(Kol)
              else
               EnterKolScanF.edKol.Text:=IntToStr(Kol1);
             end;

   if P=1 then
    begin
//     EnterKolScanF.cbHand.Checked:=True;
//     EnterKolScanF.cbHand.Enabled:=False;
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
   DM.Qr6.SQL.Add('declare @rowid int, @kol int');

   DM.Qr6.SQL.Add('set @kol=IsNull((select Sum(IsScan)');
   DM.Qr6.SQL.Add('from Moves a, SprTov b');
   DM.Qr6.SQL.Add('where a.kod_name=b.kod_name and b.art_Code='+DM.qrShowNakl.FieldByName('Art_Code').AsString);
   DM.Qr6.SQL.Add('      and a.iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString+'),0)');

   DM.Qr6.SQL.Add('update a set IsScan=0');
   DM.Qr6.SQL.Add('from rTovar a, SprTov b');
   DM.Qr6.SQL.Add('where a.kod_name=b.kod_name and b.art_Code='+DM.qrShowNakl.FieldByName('Art_Code').AsString);
   DM.Qr6.SQL.Add('      and a.iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString);

   DM.Qr6.SQL.Add('set @rowid=(select top 1 a.id from rTovar a, SprTov b ');
   DM.Qr6.SQL.Add('where a.kod_name=b.kod_name and b.art_Code='+DM.qrShowNakl.FieldByName('Art_Code').AsString);
   DM.Qr6.SQL.Add('      and a.iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString+')');
   DM.Qr6.SQL.Add('');
   DM.Qr6.SQL.Add(' update rTovar set IsScan=@kol+'+IntToStr(Kol)+' where id=@rowid');
   DM.Qr6.SQL.Add(' update rTovar set DateScan=getdate(),id_user='+IntToStr(Prm.UserID)+',prscan='+IntToStr(TP));
   DM.Qr6.SQL.Add(' where iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString+' and kod_name in (select kod_name from SprTov (nolock) where art_code='+DM.qrShowNakl.FieldByName('Art_Code').AsString+')');

//   DM.Qr6.SQL.SaveToFile('C:\VN.txt');

   DM.Qr6.ExecSQL;

  finally
   FSr:='';
   EnterKolScanF.Free;
   NaklList(0);
//   ShowNakl;
  end;
 end;

procedure TViewNaklF.pm11Click(Sender: TObject);
 begin
  if DM.qrShowNakl.IsEmpty then Exit;
  if CheckMarked=False then Exit;

  if MainF.MessBox('Вы действительно хотите очистить строку?',52)<>ID_YES then Exit;
  try
   DM.Qr6.Close;
   DM.Qr6.SQL.Clear;
   DM.Qr6.SQL.Add('update a set IsScan=0, Shtrih=null ');
   DM.Qr6.SQL.Add('from rTovar a, SprTov b ');
   DM.Qr6.SQL.Add('where a.kod_name=b.kod_name and b.art_Code='+DM.qrShowNakl.FieldByName('Art_Code').AsString);
   DM.Qr6.SQL.Add('      and a.iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString);
   DM.Qr6.ExecSQL;
   NaklList(0);
//   ShowNakl;
  except
   on E:Exception do MainF.MessBox('Ошибка очистки строки: '+E.Message);
  end;
 end;

function TViewNaklF.CheckMarked:Boolean;
 begin
  Result:=False;
  if Not (DM.spY_NaklList.FieldByName('idpriznak').AsInteger in [4,5,6]) then
   begin
    Result:=True;
    Exit;
   end;

  if DM.spY_NaklList.FieldByName('Marked').AsInteger=1 then
   begin
    MainF.MessBox('Возврат уже помечен как отсканированный. Любые операции по пересканировке и перезакрытию ящиков запрещены!');
    Result:=False;
   end else Result:=True;
 end;

procedure TViewNaklF.bbCloseBoxClick(Sender:TObject);
var Num,NumBox:String;
 begin
  try
   if DM.spY_NaklList.IsEmpty then Exit;
   if CheckMarked=False then Exit;

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select top 1 shtrih from Moves where IsNull(IsScan,0)>0 and IsNull(Shtrih,0)=0 and iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString;
   DM.Qr.Open;

   if DM.Qr.IsEmpty then begin MainF.MessBox('Нет незакрытых ящиков!'); Exit; end;
   if MainF.MessBox('Вы действительно хотите закрыть ящик?',52)<>ID_YES then Exit;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('declare @ida varchar(5), @num bigint, @numfull varchar(20) ');
   DM.Qr.SQL.Add('set @ida=(select Value from Spr_const where Descr=''ID_APTEKA'') ');
   DM.Qr.SQL.Add('set @num=IsNull((select convert(bigint,Value) from Spr_const where Descr=''NumBox''),0)+1 ');
   DM.Qr.SQL.Add('select ''2''+replicate(''0'',6-len(convert(varchar,@num)))+convert(varchar,@num)+replicate(''0'',3-len(convert(varchar(3),@ida)))+@ida+''01'' as NumBox, @num as  Num');
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
   DM.Qr.SQL.Add('update rTovar set shtrih='+NumBox+' where IsNull(IsScan,0)>0 and IsNull(Shtrih,0)=0 and iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString);
   DM.Qr.SQL.Add('update rTovar set shtrih=(select Max(shtrih) from rTovar m (nolock), SprTov s (nolock) where m.iddoc=a.iddoc and IsNull(Shtrih,0)>0 and m.kod_name=s.kod_name and s.art_code=b.art_code) ');
   DM.Qr.SQL.Add('from rTovar a (nolock), SprTov b (nolock) ');
   DM.Qr.SQL.Add('where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString);
//   DM.Qr.SQL.SaveToFile('C:\TmpSpis.txt');

   DM.Qr.SQL.Add('delete from Spr_Const where Descr=''NumBox'' ');
   DM.Qr.SQL.Add('insert into Spr_Const(Descr,Value) values(''NumBox'','''+Num+''') ');

   DM.Qr.ExecSQL;
//   ComboBox1.ItemIndex:=-1;
{
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('if (select Count(shtrih) from Moves where IsNull(IsScan,0)>0 and IsNull(Shtrih,0)=0 and iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString+')<=0');
   DM.Qr.SQL.Add(' update JMoves set Marked=1 where iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString);
   DM.Qr.ExecSQL;
}
   NaklList(0);

  except
   on E:Exception do MainF.MessBox('Ошибка закрытия ящика: '+E.Message);
  end;
 end;

procedure TViewNaklF.BitBtn10Click(Sender: TObject);
var Res:String;
 begin
  if DM.spY_NaklList.IsEmpty then Exit;

  DM.Qr.Close;
  DM.Qr.SQL.Text:='select top 1 shtrih from Moves where IsNull(IsScan,0)>0 and IsNull(Shtrih,0)=0 and iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString;
  DM.Qr.Open;
  if DM.Qr.IsEmpty=False then begin MainF.MessBox('Сначала нужно закрыть ящик!'); Exit; end;

  if MainF.MessBox('Вы действительно хотите пометить накладную "'+DM.spY_NaklList.FieldByName('nn_nakl').AsString+'" как отсканированную?'#10#10+
                   'Эту кнопку нужно нажимать после того как вы отсканировали накладную и закрыли все ящики!!!',
                   52,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res)<>ID_YES then Exit;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('update JMoves set Marked=1 where iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString);
   DM.Qr.ExecSQL;

   NaklList(0);
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику накладных: '+E.Message);
  end;

 end;

procedure TViewNaklF.N3Click(Sender: TObject);
 begin
  if DM.spY_NaklList.IsEmpty then Exit;
  if Not MainF.CheckPassword('2726011013') then Exit;
  DM.Qr.Close;
  DM.Qr.SQL.Text:='update Jmoves set Marked=null where iddoc=:iddoc';
  DM.Qr.Parameters.ParamByName('iddoc').Value:=DM.spY_NaklList.FieldByName('iddoc').AsInteger;
  DM.Qr.ExecSQL;
  BitBtn5Click(BitBtn5);
 end;

procedure TViewNaklF.bbVzrClick(Sender: TObject);
 begin
  if DM.spY_NaklList.IsEmpty then Exit;
  VozrPartF:=TVozrPartF.Create(Self);
  try
   VozrPartF.iddoc:=DM.spY_NaklList.FieldByName('iddoc').AsInteger;
   VozrPartF.ShowModal;
  finally
   VozrPartF.Free;
  end;
 end;

procedure TViewNaklF.BitBtn11Click(Sender: TObject);
begin
  if (not rbPr.Checked)and(DM.spY_NaklList.RecordCount<=0) then exit;
  ReturnToProviderF:=TReturnToProviderF.Create(self);
  try
    with ReturnToProviderF do
    begin
      Position:=poMainFormCenter;
      with ADOQuery1 do
      begin
        Close;
        SQL.Clear;
        SQL.Text:='';
        SQL.Text:=SQL.Text+'select ';
        SQL.Text:=SQL.Text+'  * ';
        SQL.Text:=SQL.Text+'from ';
        SQL.Text:=SQL.Text+'  Jmoves with (nolock) ';
        SQL.Text:=SQL.Text+'where ';
        SQL.Text:=SQL.Text+'  type_nakl = 1 ';
        SQL.Text:=SQL.Text+'  and reoc=0 ';
        SQL.Text:=SQL.Text+'  and obl in (0, 1) ';
        SQL.Text:=SQL.Text+'  and date_nakl >= :dt1 and date_nakl < :dt2 ';
        SQL.Text:=SQL.Text+'order by ';
        SQL.Text:=SQL.Text+'  date_nakl, ';
        SQL.Text:=SQL.Text+'  nn_nakl';
        Parameters.Clear;
        Parameters.Add;
        Parameters[0].Name:='dt1';
        Parameters[0].Value:=StrToDate(DateToStr(dtStart.Date));
        Parameters.Add;
        Parameters[1].Name:='dt2';
        Parameters[1].Value:=StrToDate(DateToStr(dtEnd.Date+1));
        Open;
      end;
    end;
    ReturnToProviderF.ShowModal;
  finally
    ReturnToProviderF.Free;
  end;
end;

procedure TViewNaklF.CheckBox4Click(Sender: TObject);
begin
 if not CheckBox4.Checked then
 begin
   //только возвраты поставщику за период
   Panel6.Visible:=false;
   ViewNaklF.BitBtn5Click(Sender);
 end
 else
 begin
   //все возвратные накладные за период
   Panel6.Visible:=true;
   ViewNaklF.BitBtn5Click(Sender);
 end;
end;

procedure TViewNaklF.BitBtn12Click(Sender: TObject);
{
var Tb:TTableObj;
    i,F_NDS,It,Kol,Tn:Integer;
    NDS:Boolean;
    VzDescr,FirmName,AptekaName,S:String;
}
{
const
  Guaranie = 'Гарантуємо, що усі лікарскі засоби, що вказані в цій накладній упродовж усього періоду знаходження в аптеці зберігалися у відповідності з умовами зберігання, затвердженими виробником.';
  sign = 'Підпис:';
  sign1 = '(П.І.Б.)';
  responsible='Уповноважена особа:';
  releaser = 'Відпустив:';
  goter = 'Прийняв:';
  underlines = '__________________________';
}
begin
{
  try
    PrintRep.Clear;
    PrintRep.SetDefault;
    PrintRep.Font.Name:='Arial';
    PrintRep.Font.Size:=4;
    PrintRep.Font.Style:=[];
    PrintRep.Orientation:=O_PORTR;
    PrintRep.PageSize:=PF_A4;
    PrintRep.Align:=AL_LEFT;

//    PrintRep.AddText(   #10+''+#10);

    PrintRep.Font.Name:='Arial';
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(#10+Guaranie+#10);

    PrintRep.Font.Size:=4;
    PrintRep.Font.Style:=[];
    PrintRep.AddText(#10+#10+responsible+underlines+sign1+#10);
    PrintRep.AddText(#10+sign+underlines+#10);
    PrintRep.AddText(#10+#10+#10+releaser+underlines+'                                         '+goter+underlines+#10);
    PrintRep.AddText(#10+sign+'__________________________'+#10);
    PrintRep.PreView;
  except
    on E:Exception do MainF.MessBox('Ошибка формирования печатной формы накладной: '+E.Message);
  end;
}
{
  It:=0;
  Tb:=nil;
  if DM.spY_NaklList.IsEmpty then Exit;
  if DM.qrShowNakl.IsEmpty then Exit;

  if DM.spY_NaklList.FieldByName('obl').AsInteger=2 then // Печать накладной на ТМЦ
   begin
    try
     PrintRep.Clear;
     PrintRep.SetDefault;
     PrintRep.Font.Size:=6;

     PrintRep.AddText('Накладная ТМЦ № '+DM.spY_NaklList.FieldByName('NN_Nakl').AsString+'от '+DateToStrRU(DM.spY_NaklList.FieldByName('Date_Nakl').AsDateTime)+#10);
     PrintRep.AddText('От кого: '+Prm.AptekaNameRU+#10#10);
     PrintRep.Font.Size:=4;
     PrintRep.Align:=AL_LEFT;

     DM.Qr.Close;
     if rbPr.Checked then
      DM.Qr.SQL.Text:='exec spY_NaklListTMC '+DM.spY_NaklList.FieldByName('iddoc').AsString+',1'
     else
      DM.Qr.SQL.Text:='exec spY_NaklListTMC '+DM.spY_NaklList.FieldByName('iddoc').AsString+',2';

     DM.Qr.Open;

     PrintRep.Qr:=DM.Qr;
     PrintRep.PrintTable(False,0,0);
     PrintRep.PreView;
    except
     on E:Exception do MainF.MessBox('Ошибка печати накладной ТМЦ:'+E.Message);
    end;
    Exit;
   end;

  try
   F_NDS:=DM.qrShowNakl.FieldByName('F_NDS').AsInteger;
   if F_NDS<=2 then
    begin
     if Prm.AptekaNameLic<>Prm.AptekaNameRU then AptekaName:=Prm.AptekaNameLic+' ('+Prm.AptekaNameRU+')'
                                            else AptekaName:=Prm.AptekaNameLic;

     FirmName:=Prm.FirmNameRU;
    end else begin
              AptekaName:=Opt.CHPAddr;
              FirmName:=Opt.CHPName;
             end;
   Tn:=DM.spY_NaklList.FieldByName('DebCrd').AsInteger;
}
{
   Case Tn of
    DC_INCOME:begin
               PrintRep.AddTable(4,5);
               Tb:=PrintRep.LastTable;
               Tb.SetWidths('1200,1400,2600,1400');
               Tb.MergeCells(1,1,3,1);
               Tb.MergeCells(1,5,3,5);
               for i:=1 to 3 do Tb.Cell[4,i].Align:=AL_CENTER;
               Tb.SetBorders(1,1,4,5,EMPTY_BORDER);
               if Prm.FirmID<>5 then
                begin
                 Tb.SetBorders(4,1,4,3,Border(clBlack,5,psSolid));

                 Tb.Cell[4,1].AddText(Prm.FirmNameUA);
                 Tb.Cell[4,2].Font.Size:=3;
                 Tb.Cell[4,2].AddText('ВХОДНОЙ КОНТРОЛЬ');
                 Tb.Cell[4,3].AddText('ПРОВИЗОР___________');

                 Tb.Cell[4,2].TopBorder:=EMPTY_BORDER;
                 Tb.Cell[4,3].TopBorder:=EMPTY_BORDER;
                end;

               Tb.Cell[1,1].Font.Style:=[fsBold];
               Tb.Cell[1,5].Font.Style:=[fsBold];
               Tb.Cell[1,1].AddText(FirmName);
               Tb.Cell[1,1].Font.Style:=[];
               Tb.Cell[1,1].AddText(' ('+Prm.SkladAdress+')');

               Tb.Cell[1,4].AddText('на отпуск товара');
               Tb.Cell[1,5].AddText('Кому: '+AptekaName);
               if Prm.FirmID<>5 then
                Tb.Cell[4,5].AddText(FormatDateTime('dd.mm.yyyy hh:nn:ss',Now));

               Tb.Cell[2,2].AddInterv(2);
               Tb.Cell[1,2].Font.Style:=[fsBold];
               Tb.Cell[1,2].AddText(DateToStrRU(DM.spY_NaklList.FieldByName('Date_Nakl').AsDateTime));
               Tb.Cell[1,3].Font.Style:=[fsBold];
               Tb.Cell[1,3].AddText('Накладная №');
               Tb.SetBorders(2,3,2,3,Border(clBlack,4,psSolid));
               Tb.Cell[2,3].AddText(DM.spY_NaklList.FieldByName('NN_Nakl').AsString);

//                Case Tn of
//                 DC_INCOME:Tb.Cell[2,3].AddText(DM.spY_NaklList.FieldByName('NN_Nakl').AsString);
//                 DC_BACK:  Tb.Cell[2,3].AddText(DM.spY_NaklList.FieldByName('NN_Nakl').AsString+'-'+IntToStr(Prm.AptekaID));
//                end;

              end;
    DC_BACK:  begin

               PrintRep.Font.Size:=6;
               PrintRep.Font.Style:=[fsBold];
               PrintRep.Align:=AL_CENTER;
               PrintRep.AddText('Накладная № '+DM.spY_NaklList.FieldByName('NN_Nakl').AsString+#10);
               PrintRep.Font.Size:=5;
               PrintRep.AddText('на возврат товара из розницы'+#10);
               PrintRep.AddText('от '+DateToStrRU(DM.spY_NaklList.FieldByName('Date_Nakl').AsDateTime)+#10#10);
               PrintRep.Font.Size:=4;
               PrintRep.Align:=AL_LEFT;

               PrintRep.AddText('От кого: '+AptekaName+#10);

               DM.QrEx3.Close;
               DM.QrEx3.SQL.Text:='select priznak from JMoves where iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString;
               DM.QrEx3.Open;

               Case DM.QrEx3.FieldByName('priznak').AsInteger of
                 1:PrintRep.AddText('Основание: Другая причина'+#10);
                 7:PrintRep.AddText('Основание: АВС ручной'+#10);
                12:PrintRep.AddText('Основание: АВС - анализ'+#10) else PrintRep.AddText('Основание: '+DBText4.Caption+#10);
               end;

               PrintRep.AddText('в фармотдел (отдел возвратов)'+#10#10);

               PrintRep.AddText('Кому: '+FirmName);

//               PrintRep.AddTable(3,5);
//               Tb:=PrintRep.LastTable;
//               Tb.SetWidths('2000,1500,3000');
//               Tb.SetBorders(1,1,3,5,EMPTY_BORDER);
//               Tb.MergeCells(2,1,3,1);
//               Tb.MergeCells(2,2,3,2);
//               Tb.Cell[1,1].Font.Style:=[fsBold];
//               Tb.Cell[1,5].Font.Style:=[fsBold];
//               Tb.Cell[1,1].AddText(AptekaName+#10);
//               if F_NDS<=2 then Tb.Cell[1,1].AddText('в фармотдел (отдел возвратов)!');
//               Tb.Cell[1,4].AddText('на возврат товара');
//               Tb.Cell[1,5].AddText('Кому: '+FirmName);
//
//               try
//                DM.QrEx.Close;
//                DM.QrEx.SQL.Text:='select VzDescr from JMoves where iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString;
//                DM.QrEx.Open;
//                VzDescr:=DM.QrEx.FieldByName('VzDescr').AsString;
//               except
//                VzDescr:='';
//               end;
//
//               if DBText4.Caption='' then
//                Tb.Cell[2,1].AddText('Заполнить обязательно - причина (сроки,долг склада, т.д.)'+#10+'___________________')
//
//               else begin
//                     Tb.Cell[2,1].AddText('Причина возврата: ');
//                     Tb.Cell[2,1].Font.Style:=[fsBold];
//                     Tb.Cell[2,1].Font.Size:=6;
//                     Tb.Cell[2,1].AddText(DBText4.Caption);
//                    end;
//               Tb.Cell[2,2].AddText('Возврат сделан по распоряжению______________________________________'#10);
//
//               if VzDescr<>'' then
//                Tb.Cell[2,2].AddText('Основания для возврата: '+VzDescr);

              end;
   end;


   PrintRep.AddInterv(4);
   if DM.spY_NaklList.FieldByName('f_nds').AsInteger=1 then NDS:=True else NDS:=False;
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   Kol:=4;
   Case Tn of
    DC_INCOME:begin
               PrintRep.Font.Size:=5;
               PrintRep.Font.Style:=[fsBold];
               PrintRep.Indent:=0;
               PrintRep.AddText(#10+'Второй экземпляр накладной обязательно вернуть в бухгалтерию'+#10);
               PrintRep.AddInterv(1);
               PrintRep.Font.Style:=[];
               PrintRep.Font.Size:=4;
               if NDS then
                begin
                 DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1150],');
                 DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
                 DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
                 DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
                 DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)/6. as [Цена без НДС_N_1700],');
                 DM.Qr.SQL.Add('Max(a.Cena)/6. as [НДС на ед_N_1500],');
                 DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
                 DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
                 It:=8;
                end else begin
                          DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1150],');
                          DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
                          DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
                          DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
                          DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)*(7./107.) as [Цена без НДС_N_1700],');
                          DM.Qr.SQL.Add('Max(a.Cena)*(7./107.) as [НДС на ед_N_1500],');
                          DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
                          DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
                          It:=8;
//                          DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1100],');
//                          DM.Qr.SQL.Add('       b.Names as Наименование_S_9000,');
//                          DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1100],');
//                          DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1600],');
//                          DM.Qr.SQL.Add('Max(a.Cena) as Цена_N_1700,');
//                          DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as Сумма_N_1700');
//                          It:=6;

                         end;
               DM.Qr.SQL.Add('from Moves a, SprTov b where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('IDDOC').AsString);
               DM.Qr.SQL.Add('group by b.art_code,b.Names,b.f_nds');
               DM.Qr.SQL.Add('order by b.Names');
              end;
    DC_BACK:  begin
               if NDS then
                begin
                 DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1050],');
                 DM.Qr.SQL.Add('       b.art_code as Код_S_1100,');
                 DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
                 DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
                 DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
                 DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)/6. as [Цена без НДС_N_1700],');
                 DM.Qr.SQL.Add('Max(a.Cena)/6. as [НДС на ед_N_1500],');
                 DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
                 DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
                 It:=9;
                end else begin
                          DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1050],');
                          DM.Qr.SQL.Add('       b.art_code as Код_S_1100,');
                          DM.Qr.SQL.Add('       b.Names+'' ''+convert(varchar,b.art_code) as Наименование_S_7800,');
                          DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1150],');
                          DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
                          DM.Qr.SQL.Add('Max(a.Cena)-Max(a.Cena)*(7./107.) as [Цена без НДС_N_1700],');
                          DM.Qr.SQL.Add('Max(a.Cena)*(7./107.) as [НДС на ед_N_1500],');
                          DM.Qr.SQL.Add('Max(a.Cena) as [Цена с НДС_N_1500],');
                          DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as [Сумма_N_1900]');
                          It:=9;

//                          DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1050],');
//                          DM.Qr.SQL.Add('       b.art_code as Код_S_1100,');
//                          DM.Qr.SQL.Add('       b.Names as Наименование_S_9000,');
//                          DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1100],');
//                          DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1600],');
//                          DM.Qr.SQL.Add('Max(a.Cena) as Цена_N_1700,');
//                          DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as Сумма_N_1700');
//                          It:=7;

                         end;

               DM.Qr.SQL.Add('from Moves a, SprTov b where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('IDDOC').AsString);
               DM.Qr.SQL.Add('group by b.art_code,b.Names,b.f_nds');
               DM.Qr.SQL.Add('order by b.Names');

//               if NDS then
//                begin
//                 DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1150],');
//                 DM.Qr.SQL.Add('       b.Names as Наименование_S_7050,');
//                 DM.Qr.SQL.Add('       a.kod_name as [Код_I_1900],');
//                 DM.Qr.SQL.Add('       a.Kol as [Кол-во_I_1500],');
//                 DM.Qr.SQL.Add('a.Cena-(a.Cena*0.2) as [Цена без НДС_N_1700],');
//                 DM.Qr.SQL.Add('a.Cena*0.2 as [НДС на ед_N_1500],');
//                 DM.Qr.SQL.Add('a.Cena as [Цена с НДС_N_1500],');
//                 DM.Qr.SQL.Add('a.Kol*a.Cena as [Сумма_N_1900]');
//                 It:=8;
//                end else begin
//                          DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1100],');
//                          DM.Qr.SQL.Add('       b.Names as Наименование_S_8300,');
//                          DM.Qr.SQL.Add('       a.kod_name as [Код_I_1800],');
//                          DM.Qr.SQL.Add('       a.Kol as [Кол-во_I_1600],');
//                          DM.Qr.SQL.Add('a.Cena as Цена_N_1700,');
//                          DM.Qr.SQL.Add('a.Kol*a.Cena as Сумма_N_1700');
//                          It:=6;
//                         end;
//               DM.Qr.SQL.Add('from Moves a, SprTov b where a.kod_name=b.kod_name and a.iddoc='+DM.spY_NaklList.FieldByName('IDDOC').AsString);
//               DM.Qr.SQL.Add('order by b.Names, a.kod_name');

              end;
   end;
   DM.Qr.Open;
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(Nds,It,Kol);

   Case Tn of
    DC_INCOME:begin
               S:='______________/                             /';
               PrintRep.Font.Size:=4;
               PrintRep.Font.Style:=[fsBold];
               PrintRep.AddText(#10#10+'Отпуск разрешил:'+S+'         ');
               PrintRep.Font.Size:=3;
               PrintRep.Font.Style:=[];
//               PrintRep.AddText(#10+'                                             (начальник отдела розничной торговли)');

               PrintRep.Font.Size:=4;
               PrintRep.Font.Style:=[fsBold];

               if Copy(DM.spY_NaklList.FieldByName('NN_Nakl').AsString,1,3)<>'Ппр' then
                begin
                 PrintRep.AddText(#10#10+'Отпустил:'+S+'     Получил:_____________    __________    _____________ ');
                 PrintRep.Font.Size:=3;
                 PrintRep.Font.Style:=[];
                 PrintRep.AddText(#10+'                                                                                                 '
                                     +'                                                                     (должность)                 (подпись)                      (фио)');
                end else begin
                          PrintRep.AddText(#10#10+'Получил:_____________    __________    _____________ ');
                          PrintRep.Font.Size:=3;
                          PrintRep.Font.Style:=[];
                          PrintRep.AddText(#10+'                        (должность)                 (подпись)                      (фио)');
                         end;
              end;
    DC_BACK:  PrintRep.AddText(#10#10+'Отпустил:_______________________           Получил:_________________________'+#10);
   end;
}
{
  except
    on E:Exception do MainF.MessBox('Ошибка формирования печатной формы накладной: '+E.Message);
  end;
}
end;

end.


