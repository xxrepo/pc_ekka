unit TovInfoU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, ComCtrls, ADODB,
     DBCtrls, DateUtils, Util, OpenLib, ExtImage, Jpeg, DB;

type

  TWCtrl1=class(TWinControl);

  TTovInfoF = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    sbSw: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    pbProc: TProgressBar;
    Panel3: TPanel;
    lbName: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel4: TPanel;
    CheckBox1: TCheckBox;
    imTrub: TImage;
    im911: TImage;
    imSkl: TImage;
    sb1: TScrollBox;
    im1: TImage;
    imHead: TImage;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    imClock: TImage;
    Image1: TImage;
    Label4: TLabel;
    Label12: TLabel;
    imNC: TImage;

    procedure FormCreate(Sender: TObject);
    procedure sbSwClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure im1MouseMove(Sender: TObject; Shift: TShiftState; X,Y:Integer);
    procedure im1Click(Sender: TObject);

  private

    FNamesPrice:String;
    filt1:String;

    QrToOff:TADOQuery;
    procedure ShowGrid;
    procedure LabelClick(Sender: TObject);

    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);

    procedure CMDialogKey(var Msg:TCMDialogKey); message CM_DIALOGKEY;
    procedure DrawButtonArmour(Im:TExtImage; State: Byte);
    procedure ImageClick(Sender:TObject);
    procedure ImageMouseEnter(Sender: TObject);
    procedure ImageMouseLeave(Sender: TObject);

  public

    Upak:Integer;
    IsNoArmour,Expanded:Boolean;
    IsMap:Boolean;
    Art_Origin:Integer;

  end;

const dy=55;
      imbX=350;
      imbDX=100;
      imbDY=26;

var TovInfoF: TTovInfoF;
    ID_Im:Integer;
    aList:Array of Record
                    ID:Integer;
                    X,Y:Real;
                    Lb:TLabel;
                    Im:TExtImage;
                    Cena:Currency;
                    Apteka:String;
                   end;
implementation

uses MainU, DataModuleU, ZakazPriceU, ViewMapU, ShowPictU, AddResU;

{$R *.dfm}

procedure TTovInfoF.FormCreate(Sender: TObject);
 begin
  IsMap:=False;
  Caption:=MFC;
  Height:=163;
  Panel2.Top:=1;
  QrToOff:=TADOQuery.Create(Self);
//  TWCtrl1(DBGrid1).BevelKind:=bkFlat;
  Expanded:=False;
  ID_Im:=-1;

  try
//   if DM.spY_FilterSklad.FieldByName('Ostat').AsInteger>0 then IsNoArmour:=True else
//    begin
     DM.Qr.Close;
     DM.Qr.SQL.Text:='select IsNull((select Value from Spr_const where Descr=''IsNotArmour''),0) as v ';
     DM.Qr.Open;
     IsNoArmour:=DM.Qr.FieldByName('v').AsInteger=1;
//    end; 
  except
   IsNoArmour:=False;
  end;

  MakeGradientWidthI(imHead,clMaroon,clGreen);
 end;

procedure TTovInfoF.sbSwClick(Sender: TObject);
 begin

  if sbSw.Tag=0 then
   begin
    sbSw.Tag:=1;
    sbSw.Caption:='Скрыть подробную информацию по аптекам';
    Height:=700;
    Panel1.Visible:=True;
//    DBText1.Visible:=True;
//    DBText2.Visible:=True;
//    Label4.Visible:=True;
//    Label5.Visible:=True;
   end else begin
             sbSw.Tag:=0;
             sbSw.Caption:='Подробная информация по аптекам';
             Height:=163;
             Panel1.Visible:=False;
{
             DBText1.Visible:=False;
             DBText2.Visible:=False;
             Label4.Visible:=False;
             Label5.Visible:=False;
}
            end;

  Top:=(Screen.Height-Height) div 2;
 end;

procedure TTovInfoF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

procedure TTovInfoF.FormActivate(Sender: TObject);
var S,filt:String;
    V1,V2,V3:Boolean;
    Art,i:Integer;
 begin
  if IsMap then begin IsMap:=False; Exit; end;
  try

   V1:=False;
//   QrToOff.ConnectionString:=Prm.ConStrDB;
   QrToOff.Connection:=DM.ADOCo;
   QrToOff.CommandTimeout:=100;


   // Дефектура
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select IsNull(makefrom,0) as makefrom from plist where art_code='+IntToStr(lbName.Tag);
   DM.QrEx.Open;
   if DM.QrEx.FieldByName('MakeFrom').AsInteger>0 then Art:=DM.QrEx.FieldByName('MakeFrom').AsInteger
                                                  else Art:=lbName.Tag;

   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('declare @art int ');
   DM.QrEx.SQL.Add('set @art='+IntToStr(lbName.Tag));
   DM.QrEx.SQL.Add('select art_code ');
   DM.QrEx.SQL.Add('from Plist ');
   DM.QrEx.SQL.Add('where art_code=@art ');
   DM.QrEx.SQL.Add(' union ');
   DM.QrEx.SQL.Add('select makefrom ');
   DM.QrEx.SQL.Add('from Plist ');
   DM.QrEx.SQL.Add('where art_code=@art and IsNull(makefrom,0)>0 ');
   DM.QrEx.SQL.Add(' union ');
   DM.QrEx.SQL.Add('select b.art_code ');
   DM.QrEx.SQL.Add('from Plist a, Plist b ');
   DM.QrEx.SQL.Add('where a.art_code=@art and a.art_code=b.makefrom and b.art_code>0');
   DM.QrEx.SQL.Add(' union ');
   DM.QrEx.SQL.Add('select b.art_code ');
   DM.QrEx.SQL.Add('from Plist a, Plist b ');
   DM.QrEx.SQL.Add('where a.art_code=@art and b.art_code=a.makefrom and b.art_code>0');
   DM.QrEx.SQL.SaveToFile('C:\Log\TovInfo.txt');
   DM.QrEx.Open;
   filt:='(';
   filt1:=',';

   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;
     filt:=filt+DM.QrEx.FieldByName('art_code').AsString;
     if i<DM.QrEx.RecordCount then filt:=filt+','
                              else filt:=filt+')';

     filt1:=filt1+DM.QrEx.FieldByName('art_code').AsString+',';
    end;

   if DM.QrEx.RecordCount=0 then filt1:=','+IntToStr(lbName.Tag)+',';
   if filt='(' then filt:='('+IntToStr(lbName.Tag)+')';
   S:='1';

   if DayOfTheWeek(Date)=1 then S:='3' else
   if DayOfTheWeek(Date)=7 then S:='2';

   QrToOff.Close;
   QrToOff.SQL.Clear;

//   QrToOff.SQL.Add('select top 1 id from workwith_gamma..import a, gammax..e_price_offer_spec p1 ');
//   QrToOff.SQL.Add('where p1.date_offer>=convert(datetime,convert(varchar,getdate()-'+s+',23)) and a.morion=p1.codemorion and a.art_code='+IntToStr(lbName.Tag));

   QrToOff.SQL.Add('exec ['+Prm.ServerDB+'].ekka_net.dbo.spY_Defektura '+IntToStr(Art));
   QrToOff.Open;

   if QrToOff.IsEmpty then Label1.Caption:='Дефектура'
                      else begin
                            Label1.Caption:='Есть в предложениях поставщиков';
                            V1:=True;
                            FNamesPrice:=QrToOff.FieldByName('names').AsString;
                           end;
   pbProc.StepIt;
   Application.ProcessMessages;

   // Остатки на складе
   QrToOff.Close;
   QrToOff.SQL.Text:='exec ['+Prm.ServerS2014+'].datafromapteks.dbo.spY_GetOstatSkl '''+filt1+''' ';
   QrToOff.Open;
   Label2.Caption:='Остаток на складе: '+CurrToStr(QrToOff.FieldByName('Kol').AsFloat)+' уп.';
   V2:=QrToOff.FieldByName('Kol').AsInteger>0;

   pbProc.StepIt;
   Application.ProcessMessages;

   // Остатки в сети
   QrToOff.Close;
   QrToOff.SQL.Text:=filt1;
//   QrToOff.SQL.SaveToFile('c:\filt.txt');

   QrToOff.Close;
   QrToOff.SQL.Text:='exec ['+Prm.ServerDB+'].ekka_net.dbo.spY_GetOstatApteks :ida, :filt, :sort, :o911, :arto ';
   QrToOff.Parameters.ParamByName('ida').Value:=Prm.AptekaID;
   QrToOff.Parameters.ParamByName('filt').Value:=filt1;
   QrToOff.Parameters.ParamByName('sort').Value:=0;
   QrToOff.Parameters.ParamByName('o911').Value:=0;
   QrToOff.Parameters.ParamByName('arto').Value:=lbName.Tag;

   QrToOff.Open;
   ShowGrid;

   Label3.Caption:='Остаток в аптечной сети: '+CurrToStr(QrToOff.FieldByName('KolAll').AsFloat)+' уп.';
   V3:=QrToOff.FieldByName('Kol').AsFloat>0;

   pbProc.StepIt;
   Application.ProcessMessages;

   // Остатки в сети подробные
{
   QrToOff.Close;
   QrToOff.SQL.Clear;
   QrToOff.SQL.Add('select a.apteka, Sum(s.remain)-Sum(IsNull(t.kol,0)) as kol,av.adress,av.phone,convert(varchar,ekka_net.dbo.GetDistance('+IntToStr(Prm.AptekaID)+',a.id_apteka))+'' км'' as Dist ');
   QrToOff.SQL.Add('from  workwith_gamma..ava_apteks av (nolock),ekka_net..apteks a (nolock) left join remains..US_SprRemains s (nolock) on a.id_apteka=s.id_apteka ');
   QrToOff.SQL.Add('      left join  ');
   QrToOff.SQL.Add('     (select t.id_apteka,t.art_code,Sum(t.kol) as kol ');
   QrToOff.SQL.Add('      from remains..ex_dtres t (nolock), ');
   QrToOff.SQL.Add('           remains..ex_dhres h (nolock) ');
   QrToOff.SQL.Add('      where h.closed=0 and h.idres=t.idres ');
   QrToOff.SQL.Add('      group by t.id_apteka,t.art_code ');
   QrToOff.SQL.Add('     ) as t on t.art_code=s.art_code and t.id_apteka=a.id_apteka ');

   QrToOff.SQL.Add('where a.id_apteka=av.id_gamma and s.art_code in '+filt);
   if Prm.FirmID<>5 then
    QrToOff.SQL.Add(' and av.firma<>2 ');
   QrToOff.SQL.Add('group by a.apteka,av.adress,av.phone,ekka_net.dbo.GetDistance('+IntToStr(Prm.AptekaID)+',a.id_apteka)');
   QrToOff.SQL.Add('having Sum(s.remain)>0');
   QrToOff.SQL.Add('order by ekka_net.dbo.GetDistance('+IntToStr(Prm.AptekaID)+',a.id_apteka) ');
   QrToOff.SQL.SaveToFile('C:\Ost.txt');
 }

   DM.dsTovInfo.DataSet:=QrToOff;
   Panel2.Visible:=False;

   BitBtn1.Visible:=V1;
   BitBtn2.Visible:=V2;
   BitBtn3.Visible:=V3;

   if Expanded then sbSwClick(sbSw);
  except
   on E:Exception do
    begin
     if Pos('[DBNETLIB][ConnectionOpen(Connect()).]SQL',E.Message)>0 then MainF.MessBox('Нет связи с сервером данных! Повторите попытку позже!')
                                                                     else MainF.MessBox('Ошибка поиска: '+E.Message);
     Close;
    end;
  end;
 end;

procedure TTovInfoF.BitBtn1Click(Sender:TObject);
 begin
  try
   ZakazPriceF:=TZakazPriceF.Create(Self);
   try
    ZakazPriceF.Edit1.Text:=FNamesPrice;
    ZakazPriceF.BitBtn1Click(ZakazPriceF.BitBtn1);
    Application.ProcessMessages;
    ZakazPriceF.ShowModal;
   finally
    ZakazPriceF.Free;
   end;
  except
   on E:Exception do MainF.MessBox('Ошибка открытия окна поиска: '+E.Message);
  end;
 end;

procedure TTovInfoF.BitBtn2Click(Sender:TObject);
 begin
  MainF.miAddOtkazClick(MainF.miAddOtkaz);
 end;

procedure TTovInfoF.BitBtn3Click(Sender:TObject);
 begin
  sbSw.Tag:=0;
  sbSwClick(sbSw);
 end;

procedure TTovInfoF.Panel4Click(Sender:TObject);
 begin
  QrToOff.Close;
  QrToOff.SQL.Text:='exec ['+Prm.ServerDB+'].ekka_net.dbo.spY_GetOstatApteks :ida, :filt, :sort, :o911, :arto ';
  QrToOff.Parameters.ParamByName('ida').Value:=Prm.AptekaID;
  QrToOff.Parameters.ParamByName('filt').Value:=filt1;
  QrToOff.Parameters.ParamByName('sort').Value:=BoolToInt(CheckBox1.Checked);
  QrToOff.Parameters.ParamByName('o911').Value:=1;
  QrToOff.Parameters.ParamByName('arto').Value:=lbName.Tag;
  QrToOff.Open;
  ShowGrid;
 end;

procedure TTovInfoF.CheckBox1Click(Sender: TObject);
 begin
  QrToOff.Close;
  QrToOff.SQL.Text:='exec ['+Prm.ServerDB+'].ekka_net.dbo.spY_GetOstatApteks :ida, :filt, :sort, :o911, :arto ';
  QrToOff.Parameters.ParamByName('ida').Value:=Prm.AptekaID;
  QrToOff.Parameters.ParamByName('filt').Value:=filt1;
  QrToOff.Parameters.ParamByName('sort').Value:=BoolToInt(CheckBox1.Checked);
  QrToOff.Parameters.ParamByName('o911').Value:=0;
  QrToOff.Parameters.ParamByName('arto').Value:=lbName.Tag;
  QrToOff.Open;
  ShowGrid;
 end;

procedure TTovInfoF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
    dR,sR:TRect;
    C:TColor;
    NewButton:TSpeedButton;
    im:TImage;

 procedure Transp(dr:TRect);
 var j,i:Integer;
  begin
   C:=db.Canvas.Pixels[dr.Left,dr.Top];
   for j:=dr.Top to dr.Bottom do
    for i:=dr.Left to dr.Right do
     if db.Canvas.Pixels[i,j]=C then
      db.Canvas.Pixels[i,j]:=db.Canvas.Brush.Color;
  end;

 begin

  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clWhite;
    db.Canvas.Font.Color:=clBlack;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);

  if DataCol=0 then
   begin
    db.Canvas.Font.Size:=8;
    db.Canvas.Font.Style:=[fsUnderline];
//    if (gdSelected in State) then db.Canvas.Font.Color:=clWhite  else
    db.Canvas.Font.Color:=clTeal;
    db.Canvas.TextOut(Rect.Left+2,Rect.Top+20,Trim(db.DataSource.DataSet.FieldByName('Adress').AsString));

//    if (gdSelected in State) then db.Canvas.Font.Color:=clWhite else

    db.Canvas.Font.Color:=clBlack;

    db.Canvas.Font.Style:=[fsBold];
    db.Canvas.TextOut(Rect.Left+17,Rect.Top+37,db.DataSource.DataSet.FieldByName('Phone').AsString);

    // Рисуем значок телефонная трубка
    dR:=Rect;
    dr.Left:=dr.Left+4; dr.Top:=dr.Top+37; dr.Bottom:=dR.Top+imTrub.Height;
    dr.Right:=dr.Left+imTrub.Width;

    sR.Left:=0; sR.Top:=0;
    sR.Right:=imTrub.Width; sR.Bottom:=imTrub.Height;

    db.Canvas.CopyRect(dR,imTrub.Canvas,sR);

    // Рисуем значок бренд
    im:=nil;
    Case db.DataSource.DataSet.FieldByName('brend').AsInteger of
     1:im:=im911;
     2:im:=imSkl;
     4:im:=imNC;
    end; 

    if im<>nil then
     begin
      dR:=Rect;
      dr.Left:=dr.Left+3; dr.Top:=dr.Top+4; dr.Bottom:=dR.Top+im.Height;
      dr.Right:=dr.Left+im.Width;

      sR.Left:=0; sR.Top:=0;
      sR.Right:=im.Width; sR.Bottom:=im.Height;

      db.Canvas.CopyRect(dR,im.Canvas,sR);
     end;

//    if (gdSelected in State) then Transp(dr);
   end else
  if (DataCol=1) and (IsNoArmour=False) then
   begin

    db.Canvas.Brush.Color:=clRed;
    db.Canvas.Pen.Color:=clRed;
    db.Canvas.RoundRect(Rect.Left+17,Rect.Top+14,Rect.Right-17,Rect.Bottom-14,4,4);

    db.Canvas.Font.Size:=8;
    db.Canvas.Font.Name:='MS Sans Serif';
    db.Canvas.Font.Style:=[fsBold];
    db.Canvas.Font.Color:=clWhite;
    db.Canvas.TextOut(Rect.Left+45,Rect.Top+18,'Забронировать');

    MakeGradientHeightC(db.Canvas,clRed,clMaroon,Rect.Left+18,Rect.Top+16,Rect.Right-19,Rect.Bottom-15,clWhite);
    MakeGradientHeightC(db.Canvas,clRed,clMaroon,Rect.Right-18,Rect.Top+16, Rect.Right-18,Rect.Bottom-14,clWhite);
    MakeGradientHeightC(db.Canvas,clRed,clMaroon,Rect.Left+17,Rect.Top+16, Rect.Left+18,Rect.Bottom-14,clWhite);

   end else
  if (DataCol=3) then
   begin

    db.Canvas.FillRect(Rect);
    db.Canvas.TextOut(Rect.Right-33-db.Canvas.TextWidth(db.DataSource.DataSet.FieldByName('Cena').AsString),Rect.Top+2,db.DataSource.DataSet.FieldByName('Cena').AsString+' грн');

   end else
  if (DataCol=5) then
   begin

    db.Canvas.FillRect(Rect);
    db.Canvas.TextOut(Rect.Right-33-db.Canvas.TextWidth(db.DataSource.DataSet.FieldByName('CenaUp').AsString),Rect.Top+2,db.DataSource.DataSet.FieldByName('CenaUp').AsString+' грн');

   end else
  if (DataCol=6) then
   begin

    db.Canvas.FillRect(Rect);
    db.Canvas.TextOut(Rect.Right-25-db.Canvas.TextWidth(db.DataSource.DataSet.FieldByName('Dist').AsString),Rect.Top+2,db.DataSource.DataSet.FieldByName('Dist').AsString+' км');

   end;
 end;

procedure TTovInfoF.DBGrid1CellClick(Column: TColumn);
 begin
  if DM.dsTovInfo.DataSet.IsEmpty then Exit;

{  if Column=DBGrid1.Columns[1] then
   begin
    pnArmour.Tag:=DM.dsTovInfo.DataSet.FieldByName('id_apteka').AsInteger;
    pnArmour.Visible:=True;
   end;
}
 end;

procedure TTovInfoF.DrawButtonArmour(Im:TExtImage; State:Byte);
var v:String;
    C1,C2:TColor;
 begin
  With Im do
   begin
    Canvas.Brush.Color:=$0038950C; //$0000008C;
    Canvas.Pen.Color:=$0038950C; //$0000008C;
    Canvas.RoundRect(0,0,Width,Height,4,4);

    Canvas.Font.Size:=8;
    Canvas.Font.Name:='MS Sans Serif';
    Canvas.Font.Style:=[fsBold];
    Canvas.Font.Color:=clWhite;
    v:='Забронировать';
    Canvas.TextOut((Width-Canvas.TextWidth(v)) div 2,(Height-Canvas.TextHeight(v)) div 2,v);
    C1:=$00389505;
    C2:=$00204A07;
    if State=0 then
     begin
      MakeGradientHeightC(Canvas,C1,C2,1,0,Width-2,Height-1,clWhite);
      MakeGradientHeightC(Canvas,C1,C2,Width-1,2,Width-1,Height,clWhite);
      MakeGradientHeightC(Canvas,C1,C2,0,2,1,Height,clWhite);
     end;

   end;
 end;

procedure TTovInfoF.ShowGrid;

var i:Integer;
    dR,sR:TRect;
    im:TImage;
    v:String;

 begin

  im1.Picture:=nil;
  im1.Height:=QrToOff.RecordCount*dy+5;
  sb1.VertScrollBar.Position:=0;

  for i:=Low(aList) to High(aList) do
   begin
    aList[i].Lb.Free;
    aList[i].Im.Free;
   end;
  SetLength(aList,0);

  SetLength(aList,QrToOff.RecordCount);
//  Label6.Caption:=IntToStr(im1.Width);
  for i:=1 to QrToOff.RecordCount do
   begin
    if i=1 then QrToOff.First else QrToOff.Next;

    aList[i-1].X:=QrToOff.FieldByName('X').AsFloat;
    aList[i-1].Y:=QrToOff.FieldByName('Y').AsFloat;

    // Ссылки просмотр на карте
    aList[i-1].Lb:=TLabel.Create(nil);
    aList[i-1].Lb.Parent:=sb1;
    aList[i-1].Lb.Left:=5;
    aList[i-1].Lb.Top:=(i-1)*dy+20;
    aList[i-1].Lb.Font.Name:='MS Sans Serif';
    aList[i-1].Lb.Font.Style:=[fsUnderline];
    aList[i-1].Lb.Font.Color:=clTeal;
    aList[i-1].Lb.AutoSize:=False;
    aList[i-1].Lb.Width:=imbX-aList[i-1].Lb.Left-3;
    aList[i-1].Lb.OnClick:=LabelClick;
    aList[i-1].Lb.OnMouseLeave:=LabelMouseLeave;
    aList[i-1].Lb.OnMouseEnter:=LabelMouseEnter;

    aList[i-1].Lb.Tag:=QrToOff.FieldByName('id_apteka').AsInteger;
    aList[i-1].Lb.Caption:=Trim(QrToOff.FieldByName('Adress').AsString);

    aList[i-1].Lb.Hint:=Trim(QrToOff.FieldByName('Adress').AsString)+#10+
                        'Нажмите на ссылку, чтобы просмотреть расположение аптеки на карте';
    aList[i-1].Lb.ShowHint:=True;

    aList[i-1].Cena:=QrToOff.FieldByName('CenaSite').AsCurrency;
    aList[i-1].Apteka:=QrToOff.FieldByName('Apteka').AsString;

    // Кнопки "Забронировать"
    if IsNoArmour=False then
     begin

      aList[i-1].Im:=TExtImage.Create(nil);
      aList[i-1].Im.Parent:=sb1;
      aList[i-1].Im.Left:=imbX;
      aList[i-1].Im.Height:=imbDY;
      aList[i-1].Im.Top:=(i-1)*dy+(dy-aList[i-1].Im.Height) div 2;
      aList[i-1].Im.Width:=imbDX;
      aList[i-1].Im.Tag:=QrToOff.FieldByName('id_apteka').AsInteger;

      aList[i-1].Im.OnClick:=ImageClick;
      aList[i-1].Im.OnMouseLeave:=ImageMouseLeave;
      aList[i-1].Im.OnMouseEnter:=ImageMouseEnter;

      DrawButtonArmour(aList[i-1].Im,0);

     end;

    im1.Canvas.Pen.Color:=clSilver;
    im1.Canvas.MoveTo(5,i*dy); im1.Canvas.LineTo(im1.Width-5,i*dy);

    im1.Canvas.Font.Color:=clBlack;
    im1.Canvas.Font.Name:='MS Sans Serif';
    im1.Canvas.Font.Size:=10;
    im1.Canvas.Font.Style:=[fsBold];
    im1.Canvas.TextOut(5,(i-1)*dy+2,QrToOff.FieldByName('Apteka').AsString);

{
    v:=QrToOff.FieldByName('kolup').AsString;
    im1.Canvas.Font.Color:=clPurple;
    im1.Canvas.TextOut(470+(25-(im1.Canvas.TextWidth(v) div 2)),(i-1)*dy+(dy-im1.Canvas.TextHeight(v)) div 2,v);

    v:=QrToOff.FieldByName('cenasiteup').AsString+' грн';
    im1.Canvas.Font.Color:=clMaroon;
    im1.Canvas.TextOut(528+(50-(im1.Canvas.TextWidth(v) div 2)),(i-1)*dy+(dy-im1.Canvas.TextHeight(v)) div 2,v);

    v:=QrToOff.FieldByName('kol').AsString;
    im1.Canvas.Font.Color:=clNavy;
    im1.Canvas.TextOut(615+(25-(im1.Canvas.TextWidth(v) div 2)),(i-1)*dy+(dy-im1.Canvas.TextHeight(v)) div 2,v);

    v:=QrToOff.FieldByName('cenaup').AsString+' грн';
    im1.Canvas.Font.Color:=clBlue;
    im1.Canvas.TextOut(660+(51-(im1.Canvas.TextWidth(v) div 2)),(i-1)*dy+(dy-im1.Canvas.TextHeight(v)) div 2,v);

    v:=QrToOff.FieldByName('cena').AsString+' грн';
    im1.Canvas.Font.Color:=clNavy;
    im1.Canvas.TextOut(740+(51-(im1.Canvas.TextWidth(v) div 2)),(i-1)*dy+(dy-im1.Canvas.TextHeight(v)) div 2,v);
}

    if (QrToOff.FieldByName('cenasiteup').AsCurrency>QrToOff.FieldByName('Cena_OptUp').AsCurrency) and
       (QrToOff.FieldByName('Cena_OptUp').AsCurrency>0.1) and
       (QrToOff.FieldByName('brend').AsInteger=2) then
     begin
      v:=QrToOff.FieldByName('cenasiteup').AsString+' грн';
      im1.Canvas.Font.Color:=clMaroon;

      im1.Canvas.Font.Size:=8;  im1.Canvas.Font.Style:=[];       im1.Canvas.TextOut(470,(i-1)*dy+((dy-im1.Canvas.TextHeight('на сайте')) div 3)-5,'на сайте');
      im1.Canvas.Font.Size:=12; im1.Canvas.Font.Style:=[fsBold]; im1.Canvas.TextOut(520,(i-1)*dy+((dy-im1.Canvas.TextHeight(v)) div 3)-6,v);

      v:=QrToOff.FieldByName('Cena_OptUp').AsString+' грн';
      im1.Canvas.Font.Color:=$00005E00;
      im1.Canvas.Font.Size:=8;  im1.Canvas.Font.Style:=[];       im1.Canvas.TextOut(470,(i-1)*dy+2*((dy-im1.Canvas.TextHeight('от 3x уп.')) div 3)+5,'от 3-x уп.');
      im1.Canvas.Font.Size:=12; im1.Canvas.Font.Style:=[fsBold]; im1.Canvas.TextOut(520,(i-1)*dy+2*((dy-im1.Canvas.TextHeight(v)) div 3)+6,v);
     end else begin
               v:=QrToOff.FieldByName('cenasiteup').AsString+' грн';
               im1.Canvas.Font.Color:=clMaroon;

               im1.Canvas.Font.Size:=8;  im1.Canvas.Font.Style:=[];       im1.Canvas.TextOut(470,(i-1)*dy+(dy-im1.Canvas.TextHeight('на сайте')) div 2,'на сайте');
               im1.Canvas.Font.Size:=12; im1.Canvas.Font.Style:=[fsBold]; im1.Canvas.TextOut(520,(i-1)*dy+(dy-im1.Canvas.TextHeight(v)) div 2,v);
              end;

    im1.Canvas.Font.Size:=10;
    im1.Canvas.Font.Style:=[fsBold];
    v:=QrToOff.FieldByName('kolup').AsString;
    im1.Canvas.Font.Color:=clPurple;
    im1.Canvas.Font.Size:=8;  im1.Canvas.Font.Style:=[];       im1.Canvas.TextOut(640,(i-1)*dy+((dy-im1.Canvas.TextHeight('за уп.')) div 3)-5,'уп.');
    im1.Canvas.Font.Size:=10; im1.Canvas.Font.Style:=[fsBold]; im1.Canvas.TextOut(660,(i-1)*dy+((dy-im1.Canvas.TextHeight(v)) div 3)-5,v);

    im1.Canvas.Font.Style:=[fsBold];
    v:=QrToOff.FieldByName('kol').AsString;
    im1.Canvas.Font.Color:=clNavy;
    im1.Canvas.Font.Size:=8; im1.Canvas.Font.Style:=[];       im1.Canvas.TextOut(640,(i-1)*dy+2*((dy-im1.Canvas.TextHeight('за ед.')) div 3)+5,'ед.');
    im1.Canvas.Font.Size:=8; im1.Canvas.Font.Style:=[fsBold]; im1.Canvas.TextOut(660,(i-1)*dy+2*((dy-im1.Canvas.TextHeight(v)) div 3)+5,v);

    im1.Canvas.Font.Style:=[fsBold];
    v:=QrToOff.FieldByName('cenaup').AsString+' грн';
    im1.Canvas.Font.Color:=clBlue;
    im1.Canvas.Font.Size:=8;  im1.Canvas.Font.Style:=[]; im1.Canvas.TextOut(730,(i-1)*dy+((dy-im1.Canvas.TextHeight('за уп.')) div 3)-5,'за уп.');
    im1.Canvas.Font.Size:=10; im1.Canvas.Font.Style:=[fsBold]; im1.Canvas.TextOut(765,(i-1)*dy+((dy-im1.Canvas.TextHeight(v)) div 3)-5,v);

    im1.Canvas.Font.Style:=[fsBold];
    v:=QrToOff.FieldByName('cena').AsString+' грн';
    im1.Canvas.Font.Color:=clNavy;
    im1.Canvas.Font.Size:=8; im1.Canvas.Font.Style:=[];       im1.Canvas.TextOut(730,(i-1)*dy+2*((dy-im1.Canvas.TextHeight('за ед.')) div 3)+5,'за ед.');
    im1.Canvas.Font.Size:=8; im1.Canvas.Font.Style:=[fsBold]; im1.Canvas.TextOut(765,(i-1)*dy+2*((dy-im1.Canvas.TextHeight(v)) div 3)+5,v);

    im1.Canvas.Font.Style:=[fsBold];
    v:=QrToOff.FieldByName('Razn').AsString+' грн';
    im1.Canvas.Font.Color:=clRed;
    im1.Canvas.TextOut(860+(51-(im1.Canvas.TextWidth(v) div 2)),(i-1)*dy+((dy-im1.Canvas.TextHeight(v)) div 3)-5,v);

    v:='Расст. '+QrToOff.FieldByName('Dist').AsString+' км';
    im1.Canvas.Font.Color:=clTeal;
    im1.Canvas.TextOut(im1.Width-120, (i-1)*dy+2*((dy-im1.Canvas.TextHeight(v)) div 3)+5,v);

 {
    im1.Canvas.Font.Size:=8;
    im1.Canvas.Font.Color:=clBlack;
    im1.Canvas.TextOut(17,(i-1)*dy+37,QrToOff.FieldByName('Phone').AsString);
 }
 {
    im1.Canvas.Font.Size:=8;
    im1.Canvas.Font.Color:=clGray;
    im1.Canvas.Font.Style:=[];
    im1.Canvas.TextOut(22,(i-1)*dy+52,QrToOff.FieldByName('OperationMode').AsString);
 }

    // Рисуем значок телефонная трубка
 {
    dr.Left:=6; dr.Top:=(i-1)*dy+37;
    dr.Bottom:=dR.Top+imTrub.Height; dr.Right:=dr.Left+imTrub.Width;

    sR.Left:=0; sR.Top:=0;
    sR.Right:=imTrub.Width; sR.Bottom:=imTrub.Height;

    im1.Canvas.CopyRect(dR,imTrub.Canvas,sR);
 }
    // Рисуем значок режим работы
{
    dr.Left:=6; dr.Top:=(i-1)*dy+52;
    dr.Bottom:=dR.Top+imClock.Height; dr.Right:=dr.Left+imClock.Width;

    sR.Left:=0; sR.Top:=0;
    sR.Right:=imClock.Width; sR.Bottom:=imClock.Height;

    im1.Canvas.CopyRect(dR,imClock.Canvas,sR);
}
    // Рисуем значок бренд
    im:=nil;
    Case QrToOff.FieldByName('brend').AsInteger of
     1:im:=im911;
     2:im:=imSkl;
     4:im:=imNC;
    end;

    if im<>nil then
     begin

      dr.Left:=5; dr.Top:=(i-1)*dy+4;
      dr.Bottom:=dR.Top+im.Height;  dr.Right:=dr.Left+im.Width;

      sR.Left:=0; sR.Top:=0;
      sR.Right:=im.Width; sR.Bottom:=im.Height;

      im1.Canvas.CopyRect(dR,im.Canvas,sR);

     end;

   end;

 end;

procedure TTovInfoF.FormClose(Sender: TObject; var Action: TCloseAction);
var i:Integer;
 begin
  for i:=Low(aList) to High(aList) do
   begin
    aList[i].Lb.Free;
    aList[i].Im.Free;
   end;
  SetLength(aList,0);
 end;

procedure TTovInfoF.LabelClick(Sender: TObject);
var jpg,jpg1:TJPEGImage;
    Blob,Blob1:TMemoryStream;
 begin
  try
   ViewMapF:=TViewMapF.Create(Self);
   try

    QrToOff.Close;
    QrToOff.SQL.Text:='exec ['+Prm.ServerDB+'].ekka_net.dbo.spY_GetInfoMapAptek '+IntToStr(TLabel(Sender).Tag);
    QrToOff.Open;

    if QrToOff.FieldByName('IsMap').AsInteger=1 then
     try
      jpg:=TJPEGImage.Create;
      Blob:=TADOBlobStream.Create(TBlobField(QrToOff.FieldByName('map')),bmRead);
      jpg.LoadFromStream(Blob);
      ViewMapF.imMap.Picture.Assign(jpg);
     except
     end;

    if QrToOff.FieldByName('IsFasad').AsInteger=1 then
     try
      jpg1:=TJPEGImage.Create;
      Blob1:=TADOBlobStream.Create(TBlobField(QrToOff.FieldByName('fasad')),bmRead);
      jpg1.LoadFromStream(Blob1);
      ViewMapF.imFasad.Picture.Assign(jpg1);
      ViewMapF.imFasad.AutoSize:=True;
     except
     end;

    ViewMapF.Label1.Caption:=QrToOff.FieldByName('apteka').AsString;
    ViewMapF.Qr:=QrToOff;

    ViewMapF.Phone:=QrToOff.FieldByName('phone').AsString;
    ViewMapF.Adres:=QrToOff.FieldByName('adress').AsString;
    ViewMapF.id_apteka:=TLabel(Sender).Tag;

    ViewMapF.lbPhone.Caption:=ViewMapF.Phone;
    ViewMapF.lbAdres.Caption:=ViewMapF.Adres;

    QrToOff.Close;
    QrToOff.SQL.Text:='exec ['+Prm.ServerDB+'].ekka_net.dbo.spY_GetOperationMode '+IntToStr(ViewMapF.id_apteka);
    QrToOff.Open;

    DM.srMode.DataSet:=QrToOff;
    Application.ProcessMessages;
    ViewMapF.ShowModal;
    DM.srMode.DataSet:=nil;

   finally

    if Assigned(Blob) then Blob.Free;
    if Assigned(jpg) then jpg.Free;

    if Assigned(Blob1) then Blob1.Free;
    if Assigned(jpg1) then jpg1.Free;
    ViewMapF.Free;

   end;

  except
   on E:Exception do
    MainF.MessBox('Ошибка формирования карт: '+E.Message);
  end;

 end;

procedure TTovInfoF.LabelMouseEnter(Sender: TObject);
 begin
  TLabel(Sender).Font.Style:=TLabel(Sender).Font.Style-[fsUnderline];
 end;

procedure TTovInfoF.LabelMouseLeave(Sender: TObject);
 begin
  TLabel(Sender).Font.Style:=TLabel(Sender).Font.Style+[fsUnderline];
 end;

procedure TTovInfoF.ImageMouseEnter(Sender: TObject);
 begin
  DrawButtonArmour(TExtImage(Sender),1);
 end;

procedure TTovInfoF.ImageMouseLeave(Sender: TObject);
 begin
  DrawButtonArmour(TExtImage(Sender),0);
 end;

procedure TTovInfoF.CMDialogKey(var Msg: TCMDialogKey);
 begin

  with sb1.VertScrollBar do
   begin
    case Msg.CharCode of
     VK_DOWN:Position:=Position+25;
     VK_Up:  Position:=Position-25;
     else inherited;
    end;
   end;

 end;

procedure TTovInfoF.im1MouseMove(Sender: TObject; Shift: TShiftState; X,Y:Integer);
 begin
{  Label12.Caption:=IntToStr(X)+','+IntToStr(Y);
  ID_Im:=-1;
  if (X<imbX) or (X>imbX+imbDX) then Exit;

  if (Y>=(Y div dy)*dy+((dy-imbDY) div 2)) and (Y<=(Y div dy)*dy+((dy-imbDY) div 2)+imbDY) then ID_Im:=Y div dy else ID_Im:=-1;

  Label13.Caption:=IntToStr(ID_Im);
}
 end;

procedure TTovInfoF.im1Click(Sender: TObject);
 begin
  if (ID_Im<Low(aList)) or (ID_Im>High(aList)) then Exit;
  ShowMessage('Выбрана аптека с ID='+IntToStr(aList[ID_Im].Im.Tag));
 end;

procedure TTovInfoF.ImageClick(Sender:TObject);
var i:Integer;
    Cena:Currency;
    Apteka:String;
    B:Boolean;
    Res:String;
 begin
  try
   AddResF:=TAddResF.Create(Self);
   try
//    Application.ProcessMessages;
    AddResF.ShowKol:=True;
    AddResF.ShowModal;
    if AddResF.Flag<>1 then Exit;

    B:=False;
    for i:=Low(aList) to High(aList) do
     if TExtImage(Sender).Tag=aList[i].Lb.Tag then
      begin
       Cena:=aList[i].Cena;
       Apteka:=aList[i].Apteka;
       B:=True;
       Break;
      end;

    if B=False then
     begin
      MainF.MessBox('Аптека не определена');
      Exit;
     end;

    DM.QrX1.Close;
    DM.QrX1.Parameters.ParamByName('idato').Value:=TExtImage(Sender).Tag;
    DM.QrX1.Parameters.ParamByName('idafrom').Value:=Prm.AptekaID;
    DM.QrX1.Parameters.ParamByName('idg').Value:=Prm.ID_Gamma;
    DM.QrX1.Parameters.ParamByName('fio').Value:=AddResF.Edit1.Text;
    DM.QrX1.Parameters.ParamByName('phone').Value:=AddResF.Edit3.Text;
    DM.QrX1.Parameters.ParamByName('art').Value:=Art_Origin;
    DM.QrX1.Parameters.ParamByName('kol').Value:=AddResF.Kol;
    DM.QrX1.Parameters.ParamByName('cena').Value:=CurrToStr(Cena);
    DM.QrX1.Parameters.ParamByName('id_kassa').Value:=Opt.KassaID;
    DM.QrX1.Open;

    Case DM.QrX1.FieldByName('Res').AsInteger of
      1:MainF.MessBox('На телефон клиента отправлена sms с номером заказа.',
                 48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
      -1,-2:MainF.MessBox('На указанный телефон невозможно отправить sms. Номер заказа: '+DM.QrX1.FieldByName('Kod').AsString,
                 48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
      -3:MainF.MessBox('На торговой точке "'+Apteka+'" недостаточное количество товара на остатке',
                 48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
    end;

   finally
    AddResF.Free;
   end;
  except
   on E:Exception do
    MainF.RegisterError('Бронирование препаратов с аптеки на аптеку',E.Message,False);
  end;
 end;


end.


