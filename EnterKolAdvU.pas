unit EnterKolAdvU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, OpenLib, Buttons, Util, ActnList;

type
  TEnterkolAdvF = class(TForm)
    Panel2: TPanel;
    lbNames: TLabel;
    Label1: TLabel;
    lbArt: TLabel;
    Label2: TLabel;
    lbCenaUp: TLabel;
    lbCena: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    lbAnnot: TLabel;
    edKol: TEdit;
    Label6: TLabel;
    im1: TImage;
    pnOst: TPanel;
    Label7: TLabel;
    Label9: TLabel;
    lbOstUp: TLabel;
    lbOst: TLabel;
    Label8: TLabel;
    bbChek: TBitBtn;
    bbChange: TBitBtn;
    imA: TImage;
    lbTek: TLabel;
    Label4: TLabel;
    Image1: TImage;
    lbInApteks: TLabel;
    imInApteks: TImage;
    imTek: TImage;
    lbPolkiCap: TLabel;
    lbPolki: TLabel;
    Label10: TLabel;
    lbSum: TLabel;
    lbP2: TLabel;
    lbP1: TLabel;
    lbP3: TLabel;
    Image2: TImage;
    acList: TActionList;
    acPr1: TAction;
    acPr2: TAction;
    acPr3: TAction;
    procedure FormCreate(Sender: TObject);
    procedure lbAnnotMouseEnter(Sender: TObject);
    procedure lbAnnotMouseLeave(Sender: TObject);
    procedure lbAnnotClick(Sender: TObject);
    procedure edKolKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure edKolChange(Sender: TObject);
    procedure bbChekClick(Sender: TObject);
    procedure edKolKeyDown(Sender: TObject; var Key: Word; Shift:TShiftState);
    procedure bbChangeClick(Sender: TObject);
    procedure lbTekClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure lbInApteksClick(Sender: TObject);
    procedure lbP1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acPr1Execute(Sender: TObject);
    procedure acPr2Execute(Sender: TObject);
    procedure acPr3Execute(Sender: TObject);

  private

    FFlag,FKol,FKolFirst:Integer;
    FCena:Currency;
    FPriznak:Integer;

    procedure ShowGrdient(P:Byte);
    procedure InitForm;

  public

    procedure InitTovar(AC:Integer; Param:Byte=0);

    property Flag:Integer read FFlag;
    property Priznak:Integer read FPriznak;

    property Kol:Integer read FKol;

  end;

var EnterkolAdvF:TEnterkolAdvF;

implementation

uses MainU,DataModuleU,ShowTekOtpU;

{$R *.dfm}

procedure TEnterkolAdvF.InitTovar(AC:Integer; Param:Byte=0);
var sUp:String;
 begin
  lbNames.Tag:=DM.spY_FilterSklad.FieldByName('art_code').AsInteger;

  DM.Qr1.Close;
  DM.Qr1.SQL.Clear;
  DM.Qr1.SQL.Add('select Max(a.names) as names, Max(s.cena) as Cena, Sum(s.ostat) as Ostat, Max(s.Cena)*IsNull(Max(a.Upak),1) as CenaUp, IsNull(Max(a.Upak),1) as Upak, ');
  DM.Qr1.SQL.Add('       convert(numeric(8,1),(Sum(s.Ostat))/convert(numeric(8,1),IsNull(Max(a.Upak),1))) as OstatUp, ');
  DM.Qr1.SQL.Add('       IsNull(''Основное - ''+convert(varchar,Max(r.P1))+char(10),'''')+ ');
  DM.Qr1.SQL.Add('       IsNull(''Витрина  - ''+convert(varchar,Max(r.P2))+char(10),'''')+ ');
  DM.Qr1.SQL.Add('       IsNull(''Склад    - ''+convert(varchar,Max(r.P3)),'''') as VReg ');
  DM.Qr1.SQL.Add('from SprTov s (nolock), SprTovar a (nolock) left join Inform..SprReg r (nolock) on r.art_code=a.art_code ');
  DM.Qr1.SQL.Add('where  a.art_code=s.art_code and s.art_code='+IntToStr(lbNames.Tag));
  DM.Qr1.Open;

  sUp:=DM.Qr1.FieldByName('Upak').AsString;
  lbPolki.Caption:=DM.Qr1.FieldByName('VReg').AsString;
  lbPolkiCap.Visible:=lbPolki.Caption<>'';

  lbNames.Caption:=DM.Qr1.FieldByName('names').AsString;
  lbNames.Font.Size:=GetOptimalFontSize(lbNames.Caption,lbNames.Font,lbNames.Width,14);

  lbArt.Caption:=DM.spY_FilterSklad.FieldByName('art_code').AsString;

  lbCenaUp.Caption:=CurrToStrF(DM.Qr1.FieldByName('CenaUp').AsCurrency,ffFixed,2)+' грн.';
  lbCena.Caption:=CurrToStrF(DM.Qr1.FieldByName('Cena').AsCurrency,ffFixed,2)+' грн.';
  FCena:=DM.Qr1.FieldByName('Cena').AsCurrency;

  lbOstUp.Caption:=DM.Qr1.FieldByName('OstatUp').AsString;
  lbOst.Caption:=DM.Qr1.FieldByName('Ostat').AsString;
  lbOst.Tag:=DM.Qr1.FieldByName('Ostat').AsInteger;
  lbP2.Enabled:=lbOst.Tag>0;
  lbP3.Enabled:=lbOst.Tag>0;


  DM.Qr1.Close;
  DM.Qr1.SQL.Clear;
  DM.Qr1.SQL.Add('select Sum(a.kol) as Kol, convert(numeric(8,1),convert(numeric(8,1),Sum(a.kol))/dbo.GetKoef(a.art_code)) as KolUp  ');
  DM.Qr1.SQL.Add('from TmpNakl a (nolock) left join JMoves j on a.nn_nakl=j.nn_nakl and a.date_nakl=j.date_nakl  ');
  DM.Qr1.SQL.Add('where j.nn_nakl is null and a.TypeNakl=1 and  a.art_code='+DM.spY_FilterSklad.FieldByName('art_code').AsString);
  DM.Qr1.SQL.Add('group by a.art_code ');
  DM.Qr1.Open;

  lbTek.Visible:=DM.Qr1.FieldByName('Kol').AsInteger>0;
  imTek.Visible:=lbTek.Visible;
  lbTek.Caption:='Текущий отпуск '+CurrToStr(DM.Qr1.FieldByName('KolUp').AsFloat)+' уп. ( '+IntToStr(DM.Qr1.FieldByName('Kol').AsInteger)+' ед. )';
  lbTek.Tag:=lbNames.Tag;

  if Param<>1 then
   begin
    InitForm;
    edKol.Text:=sUp;
    edKolChange(edKol);
   end;

  if (Param=0) and (lbOst.Tag<=0) then
   begin
    DM.Qr1.Close;
    DM.Qr1.SQL.Clear;
    DM.Qr1.SQL.Add('select top 1 a.Art_Code,a.Names ');
    DM.Qr1.SQL.Add('from SprITC b (nolock), SprTov a (nolock) ');

    DM.Qr1.SQL.Add('where a.ostat>0 and (a.art_code>'+IntToSTr(lbNames.Tag)+' or a.art_code<'+IntToSTr(lbNames.Tag)+')  and a.art_code=b.art_code and ');
    DM.Qr1.SQL.Add('      b.itc in (select distinct ITC from SprItc with (nolock) where art_code='+IntToSTr(lbNames.Tag)+') and ');
    DM.Qr1.SQL.Add('      b.itc is not null ');
    DM.Qr1.SQL.Add('group by a.Art_Code,a.Names ');
    DM.Qr1.Open;
    if DM.Qr1.IsEmpty=False then
     begin
      MainF.MessBox('Извините, данного препарата нет, но мы можем предложить следующую замену!');
      bbChangeClick(bbChange);
     end;
   end;
 end;

procedure TEnterkolAdvF.ShowGrdient(P:Byte);
 begin
  try
   Case P of
    1:MakeGradientHeightI(im1,clGreen,clLime,1,1,20,im1.Height-2);
    2:MakeGradientHeightI(im1,$000000B0,clRed,1,1,20,im1.Height-2);
   end;
  except
  end;
 end;

procedure TEnterkolAdvF.InitForm;
 begin
  FFlag:=0;
  FKolFirst:=0;
  pnOst.Visible:=False;
  bbChange.Enabled:=False;
  lbInApteks.Visible:=False;
  imInApteks.Visible:=False;

  DrawRectBlue(Image2);

  im1.Canvas.Pen.Color:=clGray;
  im1.Canvas.Rectangle(0,0,im1.Width,im1.Height);
  ShowGrdient(1);
 end;

procedure TEnterkolAdvF.FormCreate(Sender: TObject);
 begin
  FPriznak:=0;
  Caption:=MFC;
  CopyImageTransp(imA,MainF.imAnnot);
  InitForm;
 end;

procedure TEnterkolAdvF.lbAnnotMouseEnter(Sender: TObject);
 begin
  if Not Assigned(Sender) then Exit;
  if TLabel(Sender).Enabled=False then Exit;
  TLabel(Sender).Font.Style:=[fsUnderline];
 end;

procedure TEnterkolAdvF.lbAnnotMouseLeave(Sender: TObject);
 begin
  if Not Assigned(Sender) then Exit;
  if TLabel(Sender).Enabled=False then Exit;
  TLabel(Sender).Font.Style:=[];
 end;

procedure TEnterkolAdvF.lbAnnotClick(Sender: TObject);
 begin
  MainF.ShowAnnotation(lbNames.Tag);
 end;

procedure TEnterkolAdvF.edKolKeyPress(Sender: TObject; var Key: Char);
 begin
  if Key<>#8 then
   begin
    if Not (Key in CH_DIGIT) then Key:=#0;
   end else begin
             Key:=#0;
             TEdit(Sender).SelectAll;
            end;
 end;

procedure TEnterkolAdvF.FormActivate(Sender: TObject);
 begin
  edKol.SetFocus;
 end;

procedure TEnterkolAdvF.edKolChange(Sender:TObject);
 begin
  try
   if FKolFirst=0 then
    if StrToInt(edKol.Text)>0 then
     begin
      pnOst.Visible:=True;
      bbChange.Enabled:=True;
      lbInApteks.Visible:=True;
      imInApteks.Visible:=True;
     end;

   if StrToInt(edKol.Text)>0 then FKolFirst:=StrToInt(edKol.Text);
   if (StrToInt(edKol.Text)=0) or (edKol.Text='') then Abort;
   FKol:=StrToInt(edKol.Text);
  except
   edKol.Text:=IntToStr(FKolFirst);
   FKol:=FKolFirst;
  end;

  try
   Label8.Visible:=False;
   lbOstUp.Font.Color:=clBlue;
   lbOst.Font.Color:=clBlack;
   lbSum.Font.Color:=clNavy;
   ShowGrdient(1);
   Label8.Visible:=FKol>lbOst.Tag;

   lbSum.Caption:=CurrToStrF(FKol*FCena,ffFixed,2)+' грн.';

   if Label8.Visible then
    begin
     lbOstUp.Font.Color:=clRed;
     lbOst.Font.Color:=clRed;
     lbSum.Font.Color:=clRed;
     ShowGrdient(2);
    end;
  finally
   bbChek.Enabled:=(FKol>0) and (FKol<=lbOst.Tag);
  end;
 end;

procedure TEnterkolAdvF.bbChekClick(Sender: TObject);
 begin
  if Not bbChek.Enabled then Exit;
  if Kol<=0 then
   begin
    MainF.MessBox('Введите ненулевое количество!');
    edKol.SetFocus;
   end else begin
             FFlag:=1;
             Close;
            end;
 end;

procedure TEnterkolAdvF.edKolKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key=VK_RETURN then bbChekClick(bbChek);
 end;

procedure TEnterkolAdvF.bbChangeClick(Sender:TObject);
var Ret:Byte;
 begin
  try
   Ret:=MainF.ShowATC(lbNames.Tag,lbNames.Caption,1);

   Case Ret of
    0:begin
       MainF.MessBox('Позиция для замены не найдена!');
       Abort;
      end;
    1:begin
       InitTovar(DM.spY_FilterSklad.FieldByName('art_code').AsInteger,2);
       if EnterkolAdvF.Visible then edKol.SetFocus;
      end;
   end;

  except
   MainF.dbgSklad.DataSource.DataSet.Locate('Art_Code',lbNames.Tag,[]);
  end;
 end;

procedure TEnterkolAdvF.lbTekClick(Sender: TObject);
 begin
  try
   DM.qrTekOtp.Close;
   DM.qrTekOtp.SQL.Clear;
   DM.qrTekOtp.SQL.Add('select a.nn_nakl,a.date_nakl,a.NReady,case a.NReady when 0 then ''К загрузке не готова'' else ''Загрузка разрешена'' end as NRDescr');
   DM.qrTekOtp.SQL.Add('from TmpNakl a (nolock) left join JMoves j (nolock) on a.nn_nakl=j.nn_nakl and a.date_nakl=j.date_nakl');
   DM.qrTekOtp.SQL.Add('where j.nn_nakl is null and a.art_code='+IntToStr(lbTek.Tag));
   DM.qrTekOtp.SQL.Add('group by a.nn_nakl,a.date_nakl,a.NReady');
   DM.qrTekOtp.SQL.Add('order by 2');
   DM.qrTekOtp.Open;
   if DM.qrTekOtp.IsEmpty then
    begin
     lbTek.Visible:=False;
     Exit;
    end;

   ShowTekOtpF:=TShowTekOtpF.Create(Self);
   try
    ShowTekOtpF.Left:=Left+lbTek.Left;
    ShowTekOtpF.Top:=Top+lbTek.Top+lbTek.Height+27;

    ShowTekOtpF.Panel1.Caption:='    '+lbTek.Caption;

    if DM.qrTekOtp.RecordCount=1 then ShowTekOtpF.lb1.Caption:='Данная позиция придет по накладной'
                                 else ShowTekOtpF.lb1.Caption:='Данная позиция придет по накладным';
    ShowTekOtpF.ShowModal;
   finally
    ShowTekOtpF.Free;
   end;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к накладным: '+E.Message);
  end;
 end;

procedure TEnterkolAdvF.Label4Click(Sender: TObject);
 begin
  InitTovar(lbNames.Tag,1);
 end;

procedure TEnterkolAdvF.lbInApteksClick(Sender: TObject);
 begin
//  MainF.ShowTovInfo(lbNames.Tag,lbnames.Caption);
 end;

procedure TEnterkolAdvF.lbP1Click(Sender:TObject);
 begin
  if Assigned(Sender)=False then Exit;

  if TLabel(Sender).Tag=1 then
   begin

    Label4Click(Label4);
    if FKol<lbOst.Tag then
     begin
      MainF.MessBox('Чтобы совершить "Отказ по количеству", введеное количество должно превышать остаток в аптеке!');
      Exit;
     end;
   end;

  FPriznak:=TLabel(Sender).Tag;
  FFlag:=2;
  Close;
 end;

procedure TEnterkolAdvF.FormCloseQuery(Sender:TObject; var CanClose:Boolean);
 begin
  if FFlag<>0 then Exit;
   begin
    if lbOst.Tag<=0 then
     begin
      FFlag:=2;
      FPriznak:=1;
     end else begin
               MainF.MessBox('Необходимо указать причину, по которой вы хотите прекратить добавление в чек препарата!');
               CanClose:=False;
              end; 
   end;
 end;

procedure TEnterkolAdvF.acPr1Execute(Sender: TObject);
 begin
  lbP1Click(lbP1);
 end;

procedure TEnterkolAdvF.acPr2Execute(Sender: TObject);
 begin
  lbP1Click(lbP2);
 end;

procedure TEnterkolAdvF.acPr3Execute(Sender: TObject);
 begin
  lbP1Click(lbP3);
 end;

end.
