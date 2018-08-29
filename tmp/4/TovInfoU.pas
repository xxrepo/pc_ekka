unit TovInfoU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, ComCtrls, ADODB,
     DBCtrls, DateUtils, Util, OpenLib;

type

  TWCtrl1=class(TWinControl);

  TTovInfoF = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    sbSw: TSpeedButton;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    pbProc: TProgressBar;
    DBText1: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    DBText2: TDBText;
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

  private

    FNamesPrice:String;
    filt1:String;

    QrToOff:TADOQuery;

  public

    Upak:Integer;
    IsNoArmour,Expanded:Boolean;

  end;

var TovInfoF: TTovInfoF;

implementation

uses MainU, DataModuleU, ZakazPriceU;

{$R *.dfm}

procedure TTovInfoF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Height:=163;
  Panel2.Top:=1;
  QrToOff:=TADOQuery.Create(Self);
//  TWCtrl1(DBGrid1).BevelKind:=bkFlat;
  Expanded:=False;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select IsNull((select Value from Spr_const where Descr=''IsNotArmour''),0) as v '  ;
   DM.Qr.Open;
   IsNoArmour:=DM.Qr.FieldByName('v').AsInteger=1;
  except
   IsNoArmour:=False;
  end;
 end;

procedure TTovInfoF.sbSwClick(Sender: TObject);
 begin

  if sbSw.Tag=0 then
   begin
    sbSw.Tag:=1;
    sbSw.Caption:='Скрыть подробную информацию по аптекам';
    Height:=638;
    Panel1.Visible:=True;
    DBText1.Visible:=True;
    DBText2.Visible:=True;
    Label4.Visible:=True;
    Label5.Visible:=True;
   end else begin
             sbSw.Tag:=0;
             sbSw.Caption:='Подробная информация по аптекам';
             Height:=163;
             Panel1.Visible:=False;
             DBText1.Visible:=False;
             DBText2.Visible:=False;
             Label4.Visible:=False;
             Label5.Visible:=False;
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
  try
   V1:=False;
   QrToOff.ConnectionString:=Opt.ConStrMess;
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
   DM.QrEx.SQL.Add('where art_code=@art and makefrom>0 ');
   DM.QrEx.SQL.Add(' union ');
   DM.QrEx.SQL.Add('select b.art_code ');
   DM.QrEx.SQL.Add('from Plist a, Plist b ');
   DM.QrEx.SQL.Add('where a.art_code=@art and a.art_code=b.makefrom and b.art_code>0');
   DM.QrEx.SQL.Add(' union ');
   DM.QrEx.SQL.Add('select b.art_code ');
   DM.QrEx.SQL.Add('from Plist a, Plist b ');
   DM.QrEx.SQL.Add('where a.art_code=@art and b.art_code=a.makefrom and b.art_code>0');
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
   if filt='(' then filt:='('+IntToStr(lbName.Tag)+')';
   S:='1';
   if DayOfTheWeek(Date)=1 then S:='3' else
   if DayOfTheWeek(Date)=7 then S:='2';
   QrToOff.Close;
   QrToOff.SQL.Clear;
//   QrToOff.SQL.Add('select top 1 id from workwith_gamma..import a, gammax..e_price_offer_spec p1 ');
//   QrToOff.SQL.Add('where p1.date_offer>=convert(datetime,convert(varchar,getdate()-'+s+',23)) and a.morion=p1.codemorion and a.art_code='+IntToStr(lbName.Tag));
   QrToOff.SQL.Add('exec ekka_net..spY_Defektura '+IntToStr(Art));
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
   QrToOff.SQL.Clear;
   QrToOff.SQL.Add('select convert(numeric(8,1),Sum(_Fld4240)/'+IntToStr(Upak)+'.) as Kol ');
   QrToOff.SQL.Add('from S2014.GAMMA_83N.dbo._AccumRgT4241 ост with (nolock), ');
   QrToOff.SQL.Add('     S2014.GAMMA_83N.dbo._Reference21 номенкл with (nolock)  ');
   QrToOff.SQL.Add('where ост._Fld4238RRef=номенкл._IDRRef and ');
   QrToOff.SQL.Add('      ост._Fld4236RRef in (0x9047F8BC12347BD911E451E0FC5DC9A7) and ');
   QrToOff.SQL.Add('     _Period = (select max(_period) from S2014.GAMMA_83N.dbo._AccumRgT4241 with (nolock)) and ');
//   QrToOff.SQL.Add('     номенкл._Fld237='+IntToStr(lbName.Tag));
   QrToOff.SQL.Add('     номенкл._Fld237 in '+filt);
   QrToOff.SQL.Add('having Sum(_Fld4240) > 0 ');
   QrToOff.Open;

   Label2.Caption:='Остаток на складе: '+CurrToStr(QrToOff.FieldByName('Kol').AsFloat)+' уп.';
   V2:=QrToOff.FieldByName('Kol').AsInteger>0;
   pbProc.StepIt;
   Application.ProcessMessages;

   // Остатки в сети
   QrToOff.Close;
   QrToOff.SQL.Text:='exec ekka_net..spY_GetOstatApteks :ida, :filt ';
   QrToOff.Parameters.ParamByName('ida').Value:=Prm.AptekaID;
   QrToOff.Parameters.ParamByName('filt').Value:=filt1;

   QrToOff.Open;

   Label3.Caption:='Остаток в аптечной сети: '+CurrToStr(QrToOff.FieldByName('KolAll').AsFloat)+' уп.';
   V3:=QrToOff.FieldByName('Kol').AsFloat>0;

   pbProc.StepIt;
   Application.ProcessMessages;

   // Остатки в сети подробные
{   QrToOff.Close;
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

procedure TTovInfoF.BitBtn1Click(Sender: TObject);
 begin
  try
   ZakazPriceF:=TZakazPriceF.Create(Self);
   try
    ZakazPriceF.Edit1.Text:=FNamesPrice;
    ZakazPriceF.BitBtn1Click(ZakazPriceF.BitBtn1);
    ZakazPriceF.ShowModal;
   finally
    ZakazPriceF.Free;
   end;
  except
   on E:Exception do MainF.MessBox('Ошибка открытия окна поиска: '+E.Message);
  end;
 end;

procedure TTovInfoF.BitBtn2Click(Sender: TObject);
 begin
  MainF.miAddOtkazClick(MainF.miAddOtkaz);
 end;

procedure TTovInfoF.BitBtn3Click(Sender: TObject);
 begin
  sbSw.Tag:=0;
  sbSwClick(sbSw);
 end;

procedure TTovInfoF.Panel4Click(Sender: TObject);
 begin
  QrToOff.Close;
  QrToOff.SQL.Text:='exec ekka_net..spY_GetOstatApteks :ida, :filt, :sort, :o911 ';
  QrToOff.Parameters.ParamByName('ida').Value:=Prm.AptekaID;
  QrToOff.Parameters.ParamByName('filt').Value:=filt1;
  QrToOff.Parameters.ParamByName('sort').Value:=BoolToInt(CheckBox1.Checked);
  QrToOff.Parameters.ParamByName('o911').Value:=1;
  QrToOff.Open;
 end;

procedure TTovInfoF.CheckBox1Click(Sender: TObject);
 begin
  QrToOff.Close;
  QrToOff.SQL.Text:='exec ekka_net..spY_GetOstatApteks :ida, :filt, :sort, :o911 ';
  QrToOff.Parameters.ParamByName('ida').Value:=Prm.AptekaID;
  QrToOff.Parameters.ParamByName('filt').Value:=filt1;
  QrToOff.Parameters.ParamByName('sort').Value:=BoolToInt(CheckBox1.Checked);
  QrToOff.Parameters.ParamByName('o911').Value:=0;
  QrToOff.Open;
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
    if db.DataSource.DataSet.FieldByName('Napravlenie').AsString='911' then im:=im911 else
    if db.DataSource.DataSet.FieldByName('Napravlenie').AsString='Склад' then im:=imSkl;

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

end.
