unit LoadNaklU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, Buttons, Util, CheckLst, DateUtils, Menus, PrintReport, ComCtrls;

type

  TNakl=Record
         LBN:TStaticText;
         LBS:TStaticText;

         LBpost:TStaticText;
         LBnn:TStaticText;
         LBdt:TStaticText;
         LBsum:TStaticText;

         BV:TStaticText;
         CB:TCheckBox;
         RB:TRadioButton;
         FL:TStaticText;
         DateNakl:TDateTime;
         F_NDS:Integer;
         TypeNakl:Byte;
         isLoad:Boolean;
        end;

  TSpr=Record
        Caption:String;
        FileName:String;
        QrText:String;
       end;

  TArrSpr=Array of TSpr;
  TArrNakl=Array of TNakl;

  TLoadNaklF = class(TForm)
    Panel1: TPanel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    edPath: TEdit;
    sbPath: TSpeedButton;
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    bbLoad: TBitBtn;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton6: TSpeedButton;
    BitBtn4: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Label9: TLabel;
    pn1: TPanel;
    pn2: TPanel;
    clbSpr: TCheckListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    BitBtn2: TBitBtn;
    pmPrnReg: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    BitBtn8: TBitBtn;
    pmPrnCen: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    BitBtn3: TBitBtn;
    pmPrnCen1: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    BitBtn5: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    Label1: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    cbNew: TCheckBox;
    HeaderControl1: THeaderControl;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPathClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure bbLoadClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure rb2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure cbNewClick(Sender: TObject);
    procedure dtEndCloseUp(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);

  private

    FNaklPath:String;
    Nakl:TArrNakl;
    Spr:TArrSpr;
    IsLoadN:Boolean;

    procedure ShowNakl;
    procedure ClearNaklList;
    procedure STClick(Sender:TObject);
    procedure LBDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
    procedure SetColorCell(N:Integer);
    procedure SelMode(P:Integer);
    procedure InitSpr;
    procedure CheckReoc;
    procedure OnClick(Sender:TObject);

    function  CreateNaklList:Boolean;
    function  CheckNakl(N:Integer):Boolean;
    function  MakeNakl(N:Integer):Boolean;
    function  LoadSpr(N:Integer; var Er:String):Boolean;

    procedure SetChecked(B: Boolean);
    procedure CopyBaseToFlash;
    procedure PrintReg(Param:Byte);
    procedure PrintCen(Param,P1:Byte);
    procedure LoadUpdate;

  public

    property NaklPath:String read FNaklPath write FNaklPath;

  end;


var LoadNaklF:TLoadNaklF;
    NaklTxt:String='Nakl.txt';

implementation

uses MainU, DataModuleU, ShareU, NaklInfoU, ScanNaklU, Pilot2U, ShowTextU;

{$R *.dfm}

procedure TLoadNaklF.OnClick(Sender: TObject);
var q,MaxN,j,i:Integer;
    B:Boolean;
 begin
{  if IsLoadN then Exit;
  MaxN:=0;

  for i:=Low(Nakl) to High(Nakl) do
   if (Nakl[i].TypeNakl=1) and (Nakl[i].F_NDS>MaxN) then MaxN:=Nakl[i].F_NDS;

  for i:=1 to MaxN do
   begin
    B:=False; q:=0;
    for j:=Low(Nakl) to High(Nakl) do if (Nakl[j].F_NDS=i) and (Nakl[j].TypeNakl=1) then Inc(q);

    for j:=Low(Nakl) to High(Nakl) do
     if (Nakl[j].F_NDS=i) and (Nakl[j].TypeNakl=1) and (Nakl[j].CB.Checked) then
      begin
       B:=True;
       Break;
      end;

    if (q=0) then B:=True;
    for j:=Low(Nakl) to High(Nakl) do
     if (Nakl[j].F_NDS=i) and (Nakl[j].TypeNakl=2) then Nakl[j].CB.Checked:=B;

   end;
}
 end;

procedure TLoadNaklF.FormCreate(Sender:TObject);
 begin

  if Prm.AptekaID=10001 then NaklTxt:='Nakl10001.txt' else
  if Prm.AptekaID=10002 then NaklTxt:='Nakl10002.txt';
  Caption:=MFC;
  IsLoadN:=False;

  if Prm.IsKurier then dtStart.Date:=Date-1
                  else dtStart.Date:=Date-3;
  dtEnd.Date:=Date;
  edPath.Text:=Opt.LoadNaklPath+NaklTxt;
  if MainF.Design=False then ShowNakl;
  try
   StaticText1.Top:=55;
   StaticText2.Top:=55;
   Label9.Top:=49;
   BitBtn5.Enabled:=Not MainF.IsNewPrih;
  except
  end;
 end;

procedure TLoadNaklF.InitSpr;
var i:Integer;
 begin
  try
   SetLength(Spr,0);
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select * from FileListLoad order by Num';
   DM.QrEx.Open;
   SetLength(Spr,DM.QrEx.RecordCount);
   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;
     Spr[i-1].Caption:=DM.QrEx.FieldByName('Descr').AsString;
     Spr[i-1].FileName:=DM.QrEx.FieldByName('FName').AsString;
     Spr[i-1].QrText:=StringReplace(DM.QrEx.FieldByName('SQL').AsString,'$FName$',Opt.LogPath+Spr[i-1].FileName,[rfReplaceAll,rfIgnoreCase]);
    end;

   clbSpr.Clear;
   for i:=Low(Spr) to High(Spr) do
    begin
     clbSpr.Items.Add(Spr[i].Caption);
     clbSpr.Checked[i]:=False; //FileExists(NaklPath+Spr[i].FileName) and (GetFileDateTime(NaklPath+Spr[i].FileName)>StrToDate(DateToStr(Date-2)));
    end;
  except
  end;
 end;

procedure TLoadNaklF.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TLoadNaklF.rb1Click(Sender:TObject);
 begin
//  ShowNakl;
 end;

procedure TLoadNaklF.ClearNaklList;
var i:Integer;
 begin
  for i:=Low(Nakl) to High(Nakl) do
   begin
    Nakl[i].LBN.Free;
    Nakl[i].LBS.Free;
    Nakl[i].LBpost.Free;
    Nakl[i].LBnn.Free;
    Nakl[i].LBdt.Free;
    Nakl[i].LBsum.Free;
    Nakl[i].BV.Free;
    Nakl[i].CB.Free;
    Nakl[i].FL.Free;
    Nakl[i].RB.Free;
   end;
  SetLength(Nakl,0);
 end;

procedure TLoadNaklF.STClick(Sender:TObject);
var i:Integer;
 begin
  if Sender=nil then Exit;
  for i:=Low(Nakl) to High(Nakl) do
   begin
    if Not(Nakl[i].CB.Enabled) then Continue;
    if (Sender=Nakl[i].LBS) or (Sender=Nakl[i].LBN) then Nakl[i].CB.Checked:=Not (Nakl[i].CB.Checked);
   end;
 end;

procedure TLoadNaklF.SetColorCell(N:Integer);
 begin
  Nakl[N].LBS.Font.Color:=clBlack;
  Nakl[N].LBN.Font.Color:=clBlack;

  if Nakl[N].F_NDS=2 then // Без НДС
   begin
    Nakl[N].LBN.Color:=clMoneyGreen;
    if Nakl[N].TypeNakl=2 then Nakl[N].LBN.Font.Color:=$0065966F;
   end else
  if Nakl[N].F_NDS=1 then  // НДС
   begin
    Nakl[N].LBN.Color:=clSkyBlue;
    if Nakl[N].TypeNakl=2 then Nakl[N].LBN.Font.Color:=$00BE8245;
   end else
  if Nakl[N].F_NDS=4 then  // ЧП без НДС
   begin
    Nakl[N].LBN.Color:=$0003D9F8;
    if Nakl[N].TypeNakl=2 then Nakl[N].LBN.Font.Color:=$000299AE;
   end else
  if Nakl[N].F_NDS=3 then  // ЧП с НДС
   begin
    Nakl[N].LBN.Color:=$0000EAEA;
    if Nakl[N].TypeNakl=2 then Nakl[N].LBN.Font.Color:=$0000AAAA;
   end;

  Nakl[N].LBS.Font.Color:=Nakl[N].LBN.Font.Color;
  Nakl[N].LBS.Color:=Nakl[N].LBN.Color;

  Nakl[N].LBpost.Font.Color:=Nakl[N].LBN.Font.Color;
  Nakl[N].LBpost.Color:=Nakl[N].LBN.Color;

  Nakl[N].LBnn.Font.Color:=Nakl[N].LBN.Font.Color;
  Nakl[N].LBnn.Color:=Nakl[N].LBN.Color;

  Nakl[N].LBdt.Font.Color:=Nakl[N].LBN.Font.Color;
  Nakl[N].LBdt.Color:=Nakl[N].LBN.Color;

  Nakl[N].LBsum.Font.Color:=Nakl[N].LBN.Font.Color;
  Nakl[N].LBsum.Color:=Nakl[N].LBN.Color;

  if Nakl[N].isLoad then Nakl[N].FL.Color:=clGreen
                    else Nakl[N].FL.Color:=clRed;

  try
   DM.Qr6.Close;
   DM.Qr6.SQL.Text:='select Sum(a.kol) as kol,IsNull(Sum(b.kolscan),0) as kolscan from (select art_code,nn_nakl,date_nakl,Sum(kol) as kol from TmpNakl group by nn_nakl,date_nakl,art_code) a left join ScanNakl b on '+#10+
                    '       a.nn_nakl=b.nn_nakl and a.date_nakl=b.date_nakl and a.art_code=b.art_code '+#10+
                    'where  a.nn_nakl='''+Nakl[N].LBN.Caption+''''+#10+
                    '       and a.date_nakl='''+FormatDateTime('yyyy-mm-dd',Nakl[N].DateNakl)+' 00:00:00''';

   DM.Qr6.Open;
   if (DM.Qr6.FieldByName('kol').AsInteger>DM.Qr6.FieldByName('kolscan').AsInteger) and (DM.Qr6.FieldByName('kolscan').AsInteger>0) then Nakl[N].LBN.Color:=clYellow else
   if (DM.Qr6.FieldByName('kol').AsInteger=DM.Qr6.FieldByName('kolscan').AsInteger) and (DM.Qr6.FieldByName('kol').AsInteger>0) then Nakl[N].LBN.Color:=clLime else
   if (DM.Qr6.FieldByName('kol').AsInteger<DM.Qr6.FieldByName('kolscan').AsInteger) and (DM.Qr6.FieldByName('kol').AsInteger>0) then Nakl[N].LBN.Color:=$008080FF;

  except
  end;

  Nakl[N].FL.Refresh;
  Nakl[N].LBS.Refresh;
  Nakl[N].LBN.Refresh;
 end;

function TLoadNaklF.CheckNakl(N:Integer):Boolean;
 begin
  Result:=False;
  try
   try
    DM.QrEx.Close;
    DM.QrEx.SQL.Text:='select * from JMoves where nn_nakl='''+
                      Nakl[N].LBN.Caption+''' and date_nakl='''+
                      FormatDateTime('yyyy-mm-dd',Nakl[N].DateNakl)+' 00:00:00'' ';
    DM.QrEx.Open;
    Result:=Not(DM.QrEx.IsEmpty);
   except
    Result:=False;
   end;
  finally
   Nakl[N].isLoad:=Result;
   if Nakl[N].isLoad  then
    begin
     Nakl[N].CB.Checked:=False;
     Nakl[N].CB.Enabled:=False;
    end;
{   if (Nakl[N].TypeNakl=2) and Not Nakl[N].isLoad then
    begin
     Nakl[N].CB.Checked:=True;
     Nakl[N].CB.Enabled:=False;
    end;}
   SetColorCell(N);
  end;
 end;

function TLoadNaklF.CreateNaklList:Boolean;
var dh,CA,i:Integer;

 begin
  try
   dh:=17;

   DM.Qr.Close;
   DM.Qr.SQL.Text:='exec spY_ShowTmpNakl '+IntToStr(1-BoolToInt(cbNew.Checked))+','''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+'''';

{   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select typenakl,nn_nakl,date_nakl,f_nds, nready, Sum(kol*cena) as Summa from TmpNakl t where ');

   if MainF.IsNewPrih then
    DM.Qr.SQL.Add('  (typenakl=2 or nn_nakl like ''ЛТ-%'' or obl=1 or sklad in (''  BY    1F'',''  BY     7'')  ) and  (')
   else
    DM.Qr.SQL.Add('  (');

   if cbNew.Checked=False then
    DM.Qr.SQL.Add('     date_nakl between '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' or ');

   DM.Qr.SQL.Add('     not exists (select j.nn_nakl,j.date_nakl from JMoves j where j.nn_nakl=t.nn_nakl and j.date_nakl=t.date_nakl) )');

   DM.Qr.SQL.Add('group by typenakl, nn_nakl, date_nakl, f_nds, nready order by date_nakl,typenakl,nn_nakl ');
}
{
   DM.Qr.SQL.Text:='select typenakl,nn_nakl,date_nakl,f_nds, Sum(kol*cena) as Summa from TmpNakl '+
                   ' group by typenakl,nn_nakl,date_nakl,f_nds order by date_nakl,typenakl,nn_nakl ';
}//  DM.Qr.SQL.SaveToFile('C:\LNakl.txt');
//   DM.Qr.SQL.SaveToFile('C:\tmpn.txt');
   DM.Qr.Open;
   ClearNaklList;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     CA:=High(Nakl)+1; SetLength(Nakl,CA+1);
     //Номер накладной
     Nakl[CA].LBN:=TStaticText.Create(Self);
     Nakl[CA].LBN.Parent:=ScrollBox1;
     Nakl[CA].LBN.AutoSize:=False;
     Nakl[CA].LBN.BevelInner:=bvSpace;
     Nakl[CA].LBN.BevelKind:=bkFlat;
     Nakl[CA].LBN.Left:=36;
     Nakl[CA].LBN.Height:=dh;
     Nakl[CA].LBN.Top:=(i-1)*(dh-1)+1;
     Nakl[CA].LBN.Width:=85; //Nakl[CA].LBN.Parent.Width-140-16-dh;
     Nakl[CA].LBN.ShowHint:=True;
     Nakl[CA].LBN.Caption:=DM.Qr.FieldByName('NN_NAKL').AsString;
     Nakl[CA].LBN.Hint:='Дата: '+FormatDateTime('dd.mm.yyyy',DM.Qr.FieldByName('Date_Nakl').AsDateTime);
     Nakl[CA].LBN.OnClick:=STClick;
     Nakl[CA].LBN.Tag:=CA;
     Nakl[CA].LBN.OnMouseDown:=LBDown;

     // Сумма продажная
     Nakl[CA].LBS:=TStaticText.Create(Self);
     Nakl[CA].LBS.Parent:=ScrollBox1;
     Nakl[CA].LBS.AutoSize:=False;
     Nakl[CA].LBS.BevelInner:=bvSpace;
     Nakl[CA].LBS.BevelKind:=bkFlat;
     Nakl[CA].LBS.Left:=Nakl[CA].LBN.Left+Nakl[CA].LBN.Width-1;
     Nakl[CA].LBS.Height:=dh;
     Nakl[CA].LBS.Top:=(i-1)*(dh-1)+1;
     Nakl[CA].LBS.Width:=67;
     Nakl[CA].LBS.ShowHint:=True;
     Nakl[CA].LBS.Hint:='Сумма продажная';
     Nakl[CA].LBS.Alignment:=taRightJustify;
     Nakl[CA].LBS.Caption:=CurrToStrF(DM.Qr.FieldByName('Summa').AsFloat,ffFixed,2);
     Nakl[CA].LBS.OnClick:=STClick;
     Nakl[CA].LBS.Tag:=CA;
     Nakl[CA].LBS.OnMouseDown:=LBDown;

     //Поставщик
     Nakl[CA].LBpost:=TStaticText.Create(Self);
     Nakl[CA].LBpost.Parent:=ScrollBox1;
     Nakl[CA].LBpost.AutoSize:=False;
     Nakl[CA].LBpost.BevelInner:=bvSpace;
     Nakl[CA].LBpost.BevelKind:=bkFlat;
     Nakl[CA].LBpost.Left:=Nakl[CA].LBN.Left+Nakl[CA].LBN.Width+Nakl[CA].LBS.Width-2;
     Nakl[CA].LBpost.Height:=dh;
     Nakl[CA].LBpost.Top:=(i-1)*(dh-1)+1;
     Nakl[CA].LBpost.Width:=120;
     Nakl[CA].LBpost.ShowHint:=True;
     Nakl[CA].LBpost.Alignment:=taRightJustify;
     Nakl[CA].LBpost.Caption:=Trim(DM.Qr.FieldByName('Descr').AsString);
     Nakl[CA].LBpost.Hint:=Nakl[CA].LBpost.Caption;
     Nakl[CA].LBpost.OnClick:=STClick;
     Nakl[CA].LBpost.Tag:=CA;
     Nakl[CA].LBpost.OnMouseDown:=LBDown;

     //Номер накладной поставщика
     Nakl[CA].LBnn:=TStaticText.Create(Self);
     Nakl[CA].LBnn.Parent:=ScrollBox1;
     Nakl[CA].LBnn.AutoSize:=False;
     Nakl[CA].LBnn.BevelInner:=bvSpace;
     Nakl[CA].LBnn.BevelKind:=bkFlat;
     Nakl[CA].LBnn.Left:=Nakl[CA].LBN.Left+Nakl[CA].LBN.Width+Nakl[CA].LBS.Width+Nakl[CA].LBpost.Width-3;
     Nakl[CA].LBnn.Height:=dh;
     Nakl[CA].LBnn.Top:=(i-1)*(dh-1)+1;
     Nakl[CA].LBnn.Width:=110;
     Nakl[CA].LBnn.ShowHint:=True;
     Nakl[CA].LBnn.Alignment:=taLeftJustify;
     Nakl[CA].LBnn.Caption:=Trim(DM.Qr.FieldByName('nn_prih').AsString);
     Nakl[CA].LBnn.Hint:=Nakl[CA].LBnn.Caption;
     Nakl[CA].LBnn.OnClick:=STClick;
     Nakl[CA].LBnn.Tag:=CA;
     Nakl[CA].LBnn.OnMouseDown:=LBDown;

     //Дата накладной постащика
     Nakl[CA].LBdt:=TStaticText.Create(Self);
     Nakl[CA].LBdt.Parent:=ScrollBox1;
     Nakl[CA].LBdt.AutoSize:=False;
     Nakl[CA].LBdt.BevelInner:=bvSpace;
     Nakl[CA].LBdt.BevelKind:=bkFlat;
     Nakl[CA].LBdt.Left:=Nakl[CA].LBN.Left+Nakl[CA].LBN.Width+Nakl[CA].LBS.Width+Nakl[CA].LBpost.Width+Nakl[CA].LBnn.Width-4;
     Nakl[CA].LBdt.Height:=dh;
     Nakl[CA].LBdt.Top:=(i-1)*(dh-1)+1;
     Nakl[CA].LBdt.Width:=55;
     Nakl[CA].LBdt.ShowHint:=True;
     Nakl[CA].LBdt.Hint:='Дата накладной постащика';
     Nakl[CA].LBdt.Alignment:=taCenter;
     Nakl[CA].LBdt.Caption:=DM.Qr.FieldByName('dt_prih').AsString;
     Nakl[CA].LBdt.OnClick:=STClick;
     Nakl[CA].LBdt.Tag:=CA;
     Nakl[CA].LBdt.OnMouseDown:=LBDown;

     //Сумма накладной постащика
     Nakl[CA].LBsum:=TStaticText.Create(Self);
     Nakl[CA].LBsum.Parent:=ScrollBox1;
     Nakl[CA].LBsum.AutoSize:=False;
     Nakl[CA].LBsum.BevelInner:=bvSpace;
     Nakl[CA].LBsum.BevelKind:=bkFlat;
     Nakl[CA].LBsum.Left:=Nakl[CA].LBN.Left+Nakl[CA].LBN.Width+Nakl[CA].LBS.Width+Nakl[CA].LBpost.Width+Nakl[CA].LBnn.Width+Nakl[CA].LBdt.Width-5;
     Nakl[CA].LBsum.Height:=dh;
     Nakl[CA].LBsum.Top:=(i-1)*(dh-1)+1;
     Nakl[CA].LBsum.Width:=67;
     Nakl[CA].LBsum.ShowHint:=True;
     Nakl[CA].LBsum.Hint:='Сумма накладной постащика';
     Nakl[CA].LBsum.Alignment:=taRightJustify;
     Nakl[CA].LBsum.Caption:=DM.Qr.FieldByName('sum_prih').AsString;
     Nakl[CA].LBsum.OnClick:=STClick;
     Nakl[CA].LBsum.Tag:=CA;
     Nakl[CA].LBsum.OnMouseDown:=LBDown;

     // Статус загрузки
     Nakl[CA].FL:=TStaticText.Create(Self);
     Nakl[CA].FL.Parent:=ScrollBox1;
     Nakl[CA].FL.AutoSize:=False;
     Nakl[CA].FL.BevelInner:=bvSpace;
     Nakl[CA].FL.BevelKind:=bkFlat;
     Nakl[CA].FL.Left:=Nakl[CA].LBN.Left+Nakl[CA].LBN.Width+Nakl[CA].LBS.Width+Nakl[CA].LBpost.Width+Nakl[CA].LBnn.Width+Nakl[CA].LBdt.Width+Nakl[CA].LBsum.Width-6;
     Nakl[CA].FL.Height:=dh;
     Nakl[CA].FL.Top:=(i-1)*(dh-1)+1;
     Nakl[CA].FL.Width:=dh;

     // Рамка для CheckBox
     Nakl[CA].BV:=TStaticText.Create(Self);
     Nakl[CA].BV.Parent:=ScrollBox1;
     Nakl[CA].BV.AutoSize:=False;
     Nakl[CA].BV.BevelInner:=bvSpace;
     Nakl[CA].BV.BevelKind:=bkFlat;
     Nakl[CA].BV.Left:=19;
     Nakl[CA].BV.Height:=dh;
     Nakl[CA].BV.Top:=(i-1)*(dh-1)+1;
     Nakl[CA].BV.Width:=17;

     //CheckBox
     Nakl[CA].CB:=TCheckBox.Create(Self);
     Nakl[CA].CB.Parent:=ScrollBox1;
     Nakl[CA].CB.Width:=14;
     Nakl[CA].CB.Height:=14;
     Nakl[CA].CB.Left:=21;
     Nakl[CA].CB.Top:=(i-1)*(dh-1)+3;
     Nakl[CA].CB.Checked:=True;
     Nakl[CA].CB.OnClick:=OnClick;

     Nakl[CA].RB:=TRadioButton.Create(Self);
     Nakl[CA].RB.Parent:=ScrollBox1;
     Nakl[CA].RB.Width:=14;
     Nakl[CA].RB.Height:=14;
     Nakl[CA].RB.Left:=3;
     Nakl[CA].RB.Top:=(i-1)*(dh-1)+3;

     Nakl[CA].DateNakl:=DM.Qr.FieldByName('Date_Nakl').AsDateTime;
     Nakl[CA].F_NDS:=DM.Qr.FieldByName('F_NDS').AsInteger;
     Nakl[CA].TypeNakl:=DM.Qr.FieldByName('TypeNakl').AsInteger;

     CheckNakl(CA);
     if DM.Qr.FieldByName('NREADY').AsInteger=0 then begin Nakl[CA].CB.Checked:=False; Nakl[CA].CB.Enabled:=False; end;
    end;
   Result:=True;
  except
   Result:=False;
  end;
 end;

procedure TLoadNaklF.ShowNakl;
var Param:Byte;
 begin
  if rb1.Checked then NaklPath:=Opt.FlashPath+Prm.AptName+'\'
                 else NaklPath:=IncludeTrailingBackSlash(ExtractFileDir(edPath.Text));

  try
   if Prm.UserRole<>R_ADMIN then
    if Not (FileExists(NaklPath+NaklTxt)) then
     begin
      rb2.Checked:=True;
      NaklPath:=IncludeTrailingBackSlash(ExtractFileDir(edPath.Text));
      if Not (FileExists(NaklPath+NaklTxt)) then raise EAbort.Create('Файл с накладными не найден!');
      if GetFileSize(NaklPath+NaklTxt)<10 then raise EAbort.Create('Неверный формат файла накладных!');
     end;

   CopyFile(PChar(NaklPath+NaklTxt),PChar(IncludeTrailingBackSlash(Opt.ServerAVAPath)+NaklTxt),False);

   if Prm.UserRole=R_ADMIN then Param:=1 else Param:=0;
   if Not (LoadTmpNakl(DM.ADOCo,DM.Qr,NaklPath+NaklTxt,0,Param)) then
    raise EAbort.Create('Ошибка чтения файла накладных!');
  except
   on E:Exception do
    begin
     if E.Message<>'' then MainF.MessBox(E.Message) else MainF.MessBox('Ошибка чтения накладных!');
    end;
  end;
  InitSpr;
  if Not (CreateNaklList) then MainF.MessBox('Ошибка загрузки списка накладных!');
 end;

procedure TLoadNaklF.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
//  ClearNaklList;
 end;

procedure TLoadNaklF.sbPathClick(Sender:TObject);
 begin
  if OpenDialog1.Execute then
   begin
    edPath.Text:=OpenDialog1.FileName;
    rb2.Checked:=True;
    ShowNakl;
   end;
 end;

procedure TLoadNaklF.BitBtn4Click(Sender:TObject);
 begin
  ShowNakl;
 end;

procedure TLoadNaklF.SelMode(P:Integer);
var i:Integer;
 begin
  for i:=Low(Nakl) to High(Nakl) do
   begin
    if Not (Nakl[i].CB.Enabled) then Continue;
    Case P of
     1:Nakl[i].CB.Checked:=True;
     2:Nakl[i].CB.Checked:=False;
     5:if Nakl[i].isLoad then Nakl[i].CB.Checked:=True
                         else Nakl[i].CB.Checked:=False;
     6:if Not(Nakl[i].isLoad) then Nakl[i].CB.Checked:=True
                              else Nakl[i].CB.Checked:=False;
    end;
   end;
 end;

procedure TLoadNaklF.SpeedButton2Click(Sender:TObject);
 begin
  if Sender=nil then Exit;
  SelMode((Sender as TSpeedButton).Tag);
 end;

function TLoadNaklF.MakeNakl(N:Integer):Boolean;
 begin
  ErrMess:='';
// DM.ADOCo.BeginTrans;
  try

   DM.spY_ReocNakl.Close;
   DM.spY_ReocNakl.Parameters.ParamValues['@piduser']:=Prm.UserID;

   DM.spY_ReocNakl.Parameters.ParamValues['@pnn']:=Nakl[N].LBN.Caption;
   DM.spY_ReocNakl.Parameters.ParamValues['@pdn']:=StrToDate(DateToStr(Nakl[N].DateNakl));

   DM.spY_ReocNakl.ExecProc;
   if DM.spY_ReocNakl.Parameters.ParamValues['@RETURN_VALUE']<>888 then raise EAbort.Create(DM.spY_ReocNakl.Parameters.ParamValues['@RETURN_VALUE']);

   DM.spY_NewNakl.Close;
   DM.spY_NewNakl.Parameters.ParamValues['@piduser']:=Prm.UserID;
   DM.spY_NewNakl.Parameters.ParamValues['@pnn']:=Nakl[N].LBN.Caption;
   DM.spY_NewNakl.Parameters.ParamValues['@pdn']:=StrToDate(DateToStr(Nakl[N].DateNakl));
   DM.spY_NewNakl.ExecProc;
   if DM.spY_NewNakl.Parameters.ParamValues['@RETURN_VALUE']<>999 then raise EAbort.Create(DM.spY_NewNakl.Parameters.ParamValues['@RETURN_VALUE']);

//   DM.ADOCo.CommitTrans;
   Result:=True;
  except
   on E:Exception do
    begin
     DM.ADOCo.RollbackTrans;
     if Pos('duplicate key',E.Message)<>0 then ErrMess:='Накладная '+Nakl[N].LBN.Caption+' уже загружена'
                                          else ErrMess:='Ошибка загрузки накладной '+Nakl[N].LBN.Caption+' : '+E.Message;
     Result:=False;
    end;
  end;
 end;

function TLoadNaklF.LoadSpr(N:Integer; var Er:String):Boolean;
var ToF:String;
 begin
  try
   Er:='';
   if IsServer then
    begin
     ForceDirectories(Opt.LogPath);
     ToF:=Opt.LogPath+Spr[N].FileName;
    end else ToF:=Opt.ServerLogPath+Spr[N].FileName;

   CopyFile(PChar(NaklPath+Spr[N].FileName),PChar(ToF),False);
   DM.ADOCo.BeginTrans;
   try
    DM.Qr.Close;
    DM.Qr.SQL.Text:=Spr[N].QrText;
//    DM.Qr.SQL.SaveToFile('D:\ava\LAk.txt');
    DM.Qr.Open;
    if DM.Qr.FieldByName('Res').AsInteger<>9999 then Abort;
    DM.ADOCo.CommitTrans;
    Result:=True;
   except
    DM.ADOCo.RollbackTrans;
    raise;
   end;
  except
   on E:Exception do
    begin
     Er:=E.Message;
     Result:=False;
    end;
  end;
 end;

// Определение сложились ли переоценки после загрузки накладных
procedure TLoadNaklF.CheckReoc;
var Res,mes:String;
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from JMoves where reoc=1 and convert(varchar,time_nakl,23)='''+FormatDateTime('yyyy-mm-dd',Date)+'''';
   DM.Qr.Open;
   if DM.Qr.RecordCount>0 then
    begin
     mes:='После загрузки накладных произвелась переоценка некоторых препаратов.'+#10+
          'Необходимо распечатать и расклеить ценники по этим препаратам.'+#10#10+
          'Чтобы просмотреть какие препараты переоценились,'+#10+' зайдите в "Историю переоценки" за сегодняшнее число и'+#10+
          'просмотрите акты переоценок "Апр-"';
     MainF.MessBox(mes);
    end;
  except
  end;

  if (Prm.AptekaSklad) and (Prm.Dobraia=False) and (Prm.OptCena=False) then
   try
    DM.Qr.Close;
    DM.Qr.SQL.Text:='select top 1 * from JReocOpt where IsNull(Cena_old,0)<>Cena_New and IsNull(Cena_New,0)>0 and convert(varchar,dt,23)='''+FormatDateTime('yyyy-mm-dd',Date)+'''';
    DM.Qr.Open;
    if DM.Qr.RecordCount>0 then
     begin
      mes:='После загрузки накладных изменились оптовые цены.'+#10+
           'Необходимо распечатать и расклеить ценники по этим препаратам.'+#10#10+
           'Чтобы просмотреть какие оптовые цены изменились,'+#10+' зайдите в "Историю переоценки" за сегодняшнее число и'+#10+
           'просмотрите переоценки с признаком "Оптовые" ';
      MainF.MessBox(mes,48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
     end;

  except
  end;

 end;

procedure TLoadNaklF.CopyBaseToFlash;
var Prefix,KN,ToF:String;
 begin
  KN:=AnsiUpperCase(GetCompName);
  if (MainF.Design) or (KN='AVA') or (KN='SERGEY') then Exit;
  try
   Prefix:='_'+FormatDateTime('mmyy',StartOfTheMonth(Date)-1);
   ToF:=IncludeTrailingBackSlash(Opt.FlashPath)+'Base'+Prefix+ExtractFileExt(MainF.BaseFileName);

   if FileExists(ToF) and (GetFileDateTime(ToF)>=StartOfTheMonth(Date)+1) then Exit;
   UnLoadBase(DM.QrEx,IncludeTrailingBackSlash(Opt.FlashPath),False,Prefix);
  except
  end;
 end;

procedure TLoadNaklF.LoadUpdate;
var sr:TSearchRec;
    CA,i,j,x:Integer;
    FL:Array of Record
                 FName:String;
                 Num:Integer;
                 Dt:TDateTime;
                end;


 procedure AddToList(FName:String);
 var Num,q,i:Integer;
     N,D:String;
     Dt:TDateTime;
  begin
   try
    N:=''; q:=0;
    for i:=3 to Length(FName) do
     if FName[i]='_' then begin q:=i+1; Break; end else N:=N+FName[i];
    if q=0 then Abort;
    Num:=StrToInt(N);
    D:=Copy(FName,q+6,2)+'.'+Copy(FName,q+4,2)+'.'+Copy(FName,q,4)+' '+Copy(FName,q+8,2)+':'+Copy(FName,q+10,2)+':'+Copy(FName,q+12,2);
    Dt:=StrToDateTime(D);
    CA:=High(FL)+1; SetLength(FL,CA+1);
    FL[CA].FName:=FName;
    FL[CA].Num:=Num;
    FL[CA].Dt:=Dt;
   except
   end;
  end;

 function LoadScript(N:Integer):Boolean;
  begin
   try
    DM.qrScript.Close;
    DM.qrScript.SQL.Text:='select id_update from JUpdate where IsNull(done,0)<>1 and id_update='+IntToStr(FL[N].Num);
    DM.qrScript.Open;
    if DM.qrScript.IsEmpty=False then begin Result:=True; Exit; end;

    DM.ADOCo.BeginTrans;
    try
     DM.qrScript.Close;
     DM.qrScript.SQL.Text:='delete from JUpdate where id_update='+IntToStr(FL[N].Num);
     DM.qrScript.ExecSQL;

     DM.qrScript.Close;
     DM.qrScript.SQL.LoadFromFile(NaklPath+'Update\'+FL[N].FName);
     DM.qrScript.ExecSQL;

     DM.qrScript.Close;
     DM.qrScript.SQL.Text:='select id_update from JUpdate where id_update='+IntToStr(FL[N].Num);
     DM.qrScript.Open;
     if DM.qrScript.IsEmpty then raise EAbort.Create('Скрипт выполнился неполностью.');

     DM.ADOCo.CommitTrans;
    except
     DM.ADOCo.RollbackTrans;
     raise;
    end;

    DM.qrScript.Close;
   except
    on E:Exception do
     begin
      Result:=False;
      try
       DM.qrScript.Close;
       DM.qrScript.SQL.Clear;
       DM.qrScript.SQL.Add('delete from JUpdate where id_update='+IntToStr(FL[N].Num));
       DM.qrScript.SQL.Add('Insert into JUpdate(id_update,date_update,done,Error)');
       DM.qrScript.SQL.Add('Values('+IntToStr(FL[N].Num)+',getdate(),2,'''+E.Message+''')');
       DM.qrScript.ExecSQL;
      except
      end;
     end;
   end;
  end;

 Begin
  try
   if FindFirst(NaklPath+'Update\U_*.sql',faArchive,sr)=0 then
    try
     SetLength(FL,0);
     Repeat
      AddToList(sr.Name);
     Until FindNext(sr)<>0;
    finally
     FindClose(sr);
    end;
   if High(FL)<0 then Exit;

  for i:=1 to High(FL) do
   for j:=High(FL) downto i do
    if FL[j-1].Num>FL[j].Num then
     begin
      x:=FL[j-1].Num; FL[j-1].Num:=FL[j].Num; FL[j].Num:=x;
     end;
   for i:=Low(FL) to High(FL) do LoadScript(i);
  except
  end;
 End;

procedure TLoadNaklF.bbLoadClick(Sender:TObject);
var CA,i:Integer;
    B:Integer;
    B1:Boolean;
    Mes,Res,Er:String;
    NList:TNList;

 begin
  try
   bbLoad.Enabled:=False;
   B:=0;

   SetLength(NList,0);
   for i:=Low(Nakl) to High(Nakl) do
    if Nakl[i].CB.Checked then
     begin
      CA:=High(NList)+1;
      SetLength(NList,CA+1);
      NList[CA].NN_nakl:=Nakl[i].LBN.Caption;
      NList[CA].date_nakl:=Nakl[i].DateNakl;
     end;

   if MainF.CheckForReoc(NList)=False then Exit;

//  if MainF.MessBox('Вы уверенны, что суммы бумажных накладных совпадают с теми, что вы пытаетесь загрузить?',52)<>ID_YES then Exit;
   B1:=True;
   for i:=Low(Nakl) to High(Nakl) do
    if (Nakl[i].TypeNakl=1) and (Nakl[i].CB.Checked) and (AnsiUpperCase(Copy(Nakl[i].LBN.Caption,1,3))<>'ЛТ-') then
     if Nakl[i].LBN.Color<>clLime then
      begin
       B1:=False;
       Break;
      end;

   if B1=False then

    if Not ShowTextQ('Накладные, которые вы пытаетесь загрузить неотсканированы либо отсканированы неполностью!'+#10+
                     'Загрузив неотсканированный товар, вы берете на себя ответственность за любые возможные расхождения товара!'#10,2) then Exit;
{
   ShowText('Претензии по кол-ву принимаются в течении 7 дней ( со дня получения товара)'+#10+
            'Претензии по браку - в течении 24 часов ( со дня получения товара).');
}
   mes:='Уважаемые сотрудники аптеки!'#10+
            'Напоминаем Вам о том ,что с момента загрузки товара претензии к складу принимаются:'#10+
            ' - недостача /лишний товар - 7 дней;'#10#10+
            '  В данном случае вам необходимо написать сообщение на колл-центр и указать:'#10+
            '   № накладной, дату накладной, арт.код ,наименование,'#10+
            'колличество недостающего (лишнего) товара. '#10+
            'Формирование накладной на лишний товар производится только после получения разрешения офиса '#10+
            '(на торговую точку поступает ответ на ваше сообщение "сформируйте накладную на лишний товар")'#10#10+


            ' - товар с признаком "брак" - 24 часа;'#10+
            '  В случае обнаружения данного товара Вам необходимо:'#10+
            '  1. Зафиксировать время обнаружения и показать товар на камеру.'#10+
            '  2. Написать сообщение на колл-центр ,в котором указать:'#10+
            '   № накладной, дату накладной, арт.код ,наименование,'#10+
            '   колличество товара с признаком "брак",'#10+
            '   вид повреждения, № камеры и время обнаружения, '#10+
            '   Также обязательно указать, возможна ли реализация данного товара. '#10+
            '   При получении ответа "Верните товар на склад с признаком брак" (сформируте возвратную накладную с признаком "Брак", упакуйте товар и вложите служебнуб записку в ящик с товаром.)'
            ;

   MainF.MessBox(mes,48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);

   B1:=True;
   for i:=Low(Spr) to High(Spr) do
    if clbSpr.Checked[i] then
     if Not(LoadSpr(i,Er)) then
      begin
       if Prm.UserRole=R_ADMIN then MainF.MessBox('Не загрузились "'+Spr[i].Caption+'" : '+Er);
       B1:=False;
      end else begin
                clbSpr.Checked[i]:=False;
                Application.ProcessMessages;
               end;

   try
    IsLoadN:=True;
    for i:=Low(Nakl) to High(Nakl) do
     if Nakl[i].CB.Checked then
      if Not MakeNakl(i) then
       begin
        B:=-1;
        if ErrMess<>'' then MainF.MessBox(ErrMess);
       end else begin
                 B:=1;
                 CheckNakl(i);
                 Application.ProcessMessages;
                end;
   finally
    IsLoadN:=False;
   end;

   DM.Qr.Close;
   DM.Qr.SQL.Text:='exec spY_UpdateSprTovar '#10' select 9999 as Res';
   DM.Qr.Open;

   MainF.MakeVZKarantin;
   MainF.MakeVZKarantin(1);

//   LoadUpdate;
//   CopyBaseToFlash;
   CheckReoc;
   MainF.CheckReocEndReg;

   if B=-1 then
    MainF.MessBox('Загрузка накладных прошла с ошибками!')
   else
    MainF.MessBox('Загрузка накладных завершена!',64);
 //   MainF.MessBox('Загрузка накладных завершена!'+#10#10+'Еще раз проверьте правильность загрузки в истории накладных!');

  finally
   bbLoad.Enabled:=True;
  end;
 end;

procedure TLoadNaklF.LBDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
 begin
  if Sender=nil then Exit;
  if Button=mbRight then
   try
    NaklInfoF:=TNaklInfoF.Create(Self);
    try
     NaklInfoF.Left:=Left+Panel2.Left+ScrollBox1.Left+TLabel(Sender).Left+X+5;
     NaklInfoF.Top:=Top+Panel2.Top+ScrollBox1.Top+TLabel(Sender).Top+Y+24;
     NaklInfoF.NN_Nakl:=Nakl[TLabel(Sender).Tag].LBN.Caption;
     NaklInfoF.Date_Nakl:=Nakl[TLabel(Sender).Tag].DateNakl;
     NaklInfoF.ColorFon:=TLabel(Sender).Color;
     Application.ProcessMessages;
     NaklInfoF.ShowModal;
    finally
     NaklInfoF.Free;
    end;
   except
    MainF.MessBox(ER_CR_FORM);
   end;
 end;

procedure TLoadNaklF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

procedure TLoadNaklF.rb2Click(Sender: TObject);
 begin
  ClearNaklList;
 end;

procedure TLoadNaklF.SetChecked(B:Boolean);
var i:Integer;
 begin
  for i:=0 to clbSpr.Count-1 do clbSpr.Checked[i]:=B;
 end;

procedure TLoadNaklF.SpeedButton1Click(Sender: TObject);
 begin
  SetChecked(True);
 end;

procedure TLoadNaklF.SpeedButton4Click(Sender: TObject);
 begin
  SetChecked(False);
 end;

procedure TLoadNaklF.BitBtn2Click(Sender:TObject);
var dx,dy:Integer;
    Com:TControl;
 begin
  if Sender=nil then Exit;
  dx:=Left+3; dy:=Top+TControl(Sender).Height+23;
  Com:=TControl(Sender);
  While Com<>Self do
   begin
    Inc(dx,Com.Left);
    Inc(dy,Com.Top);
    Com:=Com.Parent;
   end;
  pmPrnReg.Popup(dx,dy);
 end;

procedure TLoadNaklF.PrintReg(Param:Byte);
var i:Integer;
    S:String;
 begin
  if Not Param in [1,2] then Exit;
  try
   PrintRep.Clear;
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select f_nds from TmpNakl group by f_nds';
   DM.QrEx.Open;
   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else begin PrintRep.AddText(#12); DM.QrEx.Next; end;
     S:='';
     Case DM.QrEx.FieldByName('f_nds').AsInteger of
      1:S:='НДС';
      2:S:='без НДС';
      3:S:='ЧП НДС';
      4:S:='ЧП без НДС';
     end;

     PrintRep.SetDefault;
     PrintRep.Font.Name:='Arial';
     PrintRep.Font.Size:=5;
     PrintRep.Font.Style:=[fsBold];
     PrintRep.Align:=AL_CENTER;
     PrintRep.AddText('Список препаратов '+S+' по местам хранения '+#10#10);

     PrintRep.Align:=AL_LEFT;
     PrintRep.AddText('Дата привоза товара: '+DateToStr(Date)+#10);
     PrintRep.AddText('Время печати списка: '+TimeToStr(Now)+#10#10);
     PrintRep.Font.Size:=4;
     PrintRep.Font.Style:=[];

     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('select a.Art_Code as Код_I_1400,');
     DM.Qr.SQL.Add('       a.Names as Наименование_S_9000,');
     DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1000],');
     DM.Qr.SQL.Add('       Max(a.Cena) as Цена_N_1700,');
     DM.Qr.SQL.Add('       c.P1 as [Осн._S_1000],');
     DM.Qr.SQL.Add('       c.P2 as [Витр._S_1000],');
     DM.Qr.SQL.Add('       c.P3 as [Скл._S_1000]');
     DM.Qr.SQL.Add('from TmpNakl a left join Inform..SprReg c on a.art_code=c.art_code ');
     DM.Qr.SQL.Add('where a.TypeNakl=1 and a.f_nds='+DM.QrEx.FieldByName('f_nds').AsString);
     DM.Qr.SQL.Add('group by a.art_code,a.Names,c.P1,c.P2,c.P3');

     Case Param of
      1:DM.Qr.SQL.Add('order by a.Names');
      2:DM.Qr.SQL.Add('order by c.P1,c.P2,c.P3,a.Names');
     end;

     DM.Qr.Open;
     PrintRep.Qr:=DM.Qr;
     PrintRep.PrintTable(False,0,0);
    end;
   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования печатной формы накладной: '+E.Message);
  end;

 end;

procedure TLoadNaklF.N1Click(Sender:TObject);
 begin
  if Sender=nil then Exit;
  if High(Nakl)<0 then Exit;
  PrintReg(TControl(Sender).Tag);
 end;

procedure TLoadNaklF.PrintCen(Param,P1:Byte);
var ss,ss1,ss2:String;
 begin
  try
   ss1:='';
   ss2:=' ,1 as koef ';
   if CheckBox3.Checked then
    begin
     ss1:='*(select top 1 koef from Inform..SprKoef kkk where kkk.art_code=a.art_code) ';
     ss2:='(select top 1 koef from Inform..SprKoef kkk where kkk.art_code=a.art_code) as koef, ';
    end;
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select a.Art_code,(case when Max(a.f_nds)>2 then IsNull((select top 1 s.Names from SprCHPNames s where s.art_code=a.art_code),a.Names) else a.Names end) as Names,Max(a.Cena)'+ss1+' as Cena,'+ss2);

   if MainF.MaxSkd>0 then
    DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where type_skd=4 and art_code=a.art_code),IsNull((select Max(skd) from Skd where type_skd=1),0)) as Skd, ') else
   if MainF.MaxSkd<=-3 then
    DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where skd<3 and type_skd=4 and art_code=a.art_code),'+IntToStr(Abs(Round(MainF.MaxSkd)))+') as Skd, ')
   else
    DM.Qr.SQL.Add('0 as Skd, ');

   if (Prm.AptekaSklad=True) then
    DM.Qr.SQL.Add('IsNull(Max(a.CenaP)'+ss1+',0) as CenaP, dbo.GetCenaOpt(a.art_code)'+ss1+' as CenaOpt,Max(l.art_code) as Skd3, ')
   else
    DM.Qr.SQL.Add('0 as CenaP, 0 as CenaOpt,');

   DM.Qr.SQL.Add('IsNull((select Max(ean13) from SprEan where art_code=a.art_code),'''') as Ean13,c.P1,c.P2,c.P3');
   DM.Qr.SQL.Add('from TmpNakl a (nolock) left join SkdLimit0 l (nolock) on a.art_code=l.art_code left join Inform..SprReg c (nolock) on a.art_code=c.art_code');
   ss:='';
   if P1=2 then ss:=' and IsNull(c.P2,0)>0';
   DM.Qr.SQL.Add('where a.Obl in (0,1) and a.TypeNakl=1 '+ss);
   DM.Qr.SQL.Add('group by a.Art_code,a.Names,c.P1,c.P2,c.P3');
   Case Param of
    1:DM.Qr.SQL.Add('order by a.Names');
    2:DM.Qr.SQL.Add('order by c.P1,c.P2,c.P3,a.Names');
   end;
//   DM.Qr.SQL.SaveToFile('C:\log\CenNakl.txt');
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Exit;
{
   PrintRep.Qr:=DM.Qr;
   if CheckBox1.Checked then PrintRep.PrintStiker else
   PrintRep.PrintCennik(Prm.FirmNameUA,MainF.MaxSkd,DM.QrCen,Prm.AptekaID,MainF.PercForPrice,0,Prm.RealizMinus)
   else
    PrintRep.PrintCennik(Opt.CHPName,MainF.MaxSkd,DM.QrCen,Prm.AptekaID,MainF.PercForPrice,0,Prm.RealizMinus);
   PrintRep.PreView;
}
   PrintCennikListExt(DM.Qr,W_CENNIK,CheckBox3.Checked,False,False,Param);

  except
   on E:Exception do MainF.MessBox('Ошибка формирования списка ценников: '+E.Message);
  end;
 end;

procedure TLoadNaklF.MenuItem1Click(Sender: TObject);
 begin
  if Sender=nil then Exit;
  if High(Nakl)<0 then Exit;
  PrintCen(TControl(Sender).Tag,1);
 end;

procedure TLoadNaklF.MenuItem3Click(Sender: TObject);
 begin
  if Sender=nil then Exit;
  if High(Nakl)<0 then Exit;
  PrintCen(TControl(Sender).Tag,2);
 end;

procedure TLoadNaklF.BitBtn3Click(Sender:TObject);
var dx,dy:Integer;
    Com:TControl;
 begin
  if Sender=nil then Exit;
  dx:=Left+3; dy:=Top+TControl(Sender).Height+23;
  Com:=TControl(Sender);
  While Com<>Self do
   begin
    Inc(dx,Com.Left);
    Inc(dy,Com.Top);
    Com:=Com.Parent;
   end;
  pmPrnCen1.Popup(dx,dy);
 end;

procedure TLoadNaklF.BitBtn5Click(Sender:TObject);
var i:Integer;
 begin
  if High(Nakl)<0 then Exit;
  for i:=Low(Nakl) to High(Nakl) do
   if Nakl[i].RB.Checked then
    begin
     ShowScanNakl(Nakl[i].LBN.Caption,Nakl[i].DateNakl);
     SetColorCell(i);
     Break;
    end;
 end;

procedure TLoadNaklF.CheckBox1Click(Sender:TObject);
 begin
  if CheckBox1.Checked=False then
   begin
    BitBtn8.Caption:='Печать ценников по новому приходу';
    BitBtn3.Caption:='Печать ценников на витрину';
   end else begin
             BitBtn8.Caption:='Печать стикеров по новому приходу';
             BitBtn3.Caption:='Печать стикеров на витрину';
            end;
 end;

procedure TLoadNaklF.cbNewClick(Sender: TObject);
 begin
  ShowNakl;
 end;

procedure TLoadNaklF.dtEndCloseUp(Sender: TObject);
 begin
  ShowNakl;
 end;

procedure TLoadNaklF.BitBtn8Click(Sender: TObject);
var dx,dy:Integer;
    Com:TControl;
 begin
  if Sender=nil then Exit;
  dx:=Left+3; dy:=Top+TControl(Sender).Height+23;
  Com:=TControl(Sender);
  While Com<>Self do
   begin
    Inc(dx,Com.Left);
    Inc(dy,Com.Top);
    Com:=Com.Parent;
   end;
  pmPrnCen.Popup(dx,dy);
 end;

end.


