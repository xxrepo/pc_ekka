unit RepIncomU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, PrintReport, Util, ComObj;

type
  TRepIncomF=class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dtAct: TDateTimePicker;
    Label3: TLabel;
    cbBeg: TComboBox;
    Label4: TLabel;
    edDeb: TEdit;
    Label5: TLabel;
    edKr: TEdit;
    Label6: TLabel;
    Panel2: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    ed1: TEdit;
    ed2: TEdit;
    ed4: TEdit;
    ed3: TEdit;
    ed5: TEdit;
    ed6: TEdit;
    ed7: TEdit;
    ed8: TEdit;
    ed9: TEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    Label20: TLabel;
    Label21: TLabel;
    edPlomb: TEdit;
    edS: TEdit;
    Label22: TLabel;
    edD: TEdit;
    edMFO: TEdit;
    Label7: TLabel;
    pnSumm: TPanel;
    BitBtn2: TBitBtn;
    Label24: TLabel;
    edKop: TEdit;
    BitBtn4: TBitBtn;
    edBank: TComboBox;
    BitBtn3: TBitBtn;
    Label23: TLabel;
    BitBtn5: TBitBtn;
    lbePhone: TLabeledEdit;
    ledP: TLabeledEdit;
    ledID: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ed1Change(Sender: TObject);
    procedure ed1KeyPress(Sender: TObject; var Key: Char);
    procedure edKopKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure edBankChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);

  private

    FBlank:Boolean;
    FBank:String;

    procedure InitFields;
    procedure SaveFields;

    procedure InitRep;
    procedure PreparePage(P:Integer);
    procedure PreparePageBack1;
    procedure PreparePageBack2;

    function  CalcSumm:Integer;
    function  GetKop:Integer;
    function  GetSummAll:Real;

  public

  end;

var RepIncomF:TRepIncomF;
    FontName:String;
    StartTerminal:Boolean;

implementation

uses MainU, DataModuleU, Marry301U;

{$R *.dfm}

procedure TRepIncomF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  dtAct.Date:=Date;
  FBlank:=False;
  FontName:='Bookman Old Style';
  InitFields;
//  BitBtn1.Visible:=MainF.IsPermit([R_SUPER],P_SILENT);
  StartTerminal:=False;

{
 if ((MainF.IsSkdDop=True) and (Not (Prm.AptekaID in [71,91]))) or (Prm.AptekaID in [139,142,148]) then
   begin
    edBank.ItemIndex:=4;
    edBankChange(edBank);
    edBank.Enabled:=False;
   end;
}
 end;

procedure TRepIncomF.InitFields;
 begin
  edS.Text:=Prm.AptekaNameUA;
  edD.Text:=Prm.FirmNameUA;
  try
{
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select NBEG from Bank group by NBEG';
   DM.Qr.Open;
   cbBeg.Clear;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     cbBeg.Items.Add(DM.Qr.FieldByName('NBEG').AsString);
    end;

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select top 1 * from Bank where vzh='+IntToStr(EKKA.VzhNum)+' order by dt desc';
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Abort;

   cbBeg.Text:=DM.Qr.FieldByName('NBEG').AsString;
   edPlomb.Text:=DM.Qr.FieldByName('NPLOMB').AsString;
   edS.Text:=DM.Qr.FieldByName('SR').AsString;
   edBank.Text:=DM.Qr.FieldByName('BANK').AsString;
   edDeb.Text:=DM.Qr.FieldByName('DEB').AsString;
   edKr.Text:=DM.Qr.FieldByName('KR').AsString;
}
  except
  end;
 end;

procedure TRepIncomF.SaveFields;
 begin
  try

  except
  end;
 end;

procedure TRepIncomF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

function TRepIncomF.CalcSumm:Integer;
var i:Integer;
    ed:TEdit;
 begin
  try
   Result:=0;
   for i:=1 to 9 do
    begin
     ed:=TEdit(FindComponent('ed'+IntToStr(i)));
     if ed.Text<>'' then
     Result:=Result+ed.Tag*StrToInt(ed.Text);
    end
  except
   Result:=0;
  end;
 end;

function TRepIncomF.GetSummAll:Real;
 begin
  Result:=CalcSumm+GetKop*0.01;
 end;

procedure TRepIncomF.ed1Change(Sender:TObject);
 begin
  pnSumm.Caption:=CurrToStrF(GetSummAll,ffFixed,2)+' грн. ';
 end;

procedure TRepIncomF.ed1KeyPress(Sender:TObject; var Key:Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

procedure TRepIncomF.InitRep;
 begin
  PixPerI:=530;
  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.LeftMargin:=80;
  PrintRep.TopMargin:=70;
  PrintRep.RightMargin:=100;
  PrintRep.BottomMargin:=50;
 end;

procedure TRepIncomF.PreparePage(P:Integer);
var Tb:TTableObj;
    i:Integer;
    Br:TBorder;
    S:String;
const NC=6;
 begin
  PrintRep.SetDefault;
  PrintRep.Font.Name:=FontName;
  PrintRep.Font.Size:=3;
  PrintRep.Indent:=0;
  if P=1 then
   begin
    PrintRep.Align:=AL_RIGHT;
    PrintRep.RightIndent:=69;
    PrintRep.AddText(#10'Додаток 6'+#10);
    PrintRep.AddText('до Інструкції з організації перевезення валютних цінностей'+#10);
    PrintRep.AddText('та інкасації коштів у банківських установах України'+#10);
   end else PrintRep.AddText(#10#10#10);
  PrintRep.RightIndent:=0;
  PrintRep.Align:=AL_LEFT;
  PrintRep.AddInterv(2);
  PrintRep.Font.Size:=4;
  Case P of
   1:PrintRep.AddText('Перший примірник'+#10);
   2:PrintRep.AddText('Другий примірник'+#10);
   3:PrintRep.AddText('Третій примірник'+#10);
  end;
  PrintRep.AddTable(5,1);
  Tb:=PrintRep.LastTable;
  Tb.SetWidths('540,35,260,90,340');
  Tb.Cell[1,1].LeftMargin:=0;
  Tb.Cell[1,1].Align:=AL_RIGHT;
  Tb.Cell[1,1].Font.Style:=[fsBold];

  Case P of
   1:Tb.Cell[1,1].AddText('Супровідна відомість до сумки'+#10+'з готівкою №');
   2:Tb.Cell[1,1].AddText('Накладна до сумки'+#10+'з готівкою №');
   3:Tb.Cell[1,1].AddText('Копія супровідної відомості'+#10+'до сумки з готівкою №');
  end;

  Tb.Cell[3,1].Font.Size:=5;
  Tb.Cell[3,1].Align:=AL_CENTER;
  Tb.Cell[3,1].AddText(cbBeg.Text);

  Tb.Cell[5,1].Font.Size:=4;
  Tb.Cell[5,1].AddText('Сумка опломбована пломбіром № ');
  Tb.Cell[5,1].Font.Size:=4;
  Tb.Cell[5,1].AddText(edPlomb.Text);

  Tb.SetBorders(1,1,5,1,EMPTY_BORDER);
  Tb.SetBorders(3,1,3,1,Border(clBlack,4,psSolid));

  {--- Основная таблица  ---}
  PrintRep.AddInterv(1);
  PrintRep.AddTable(NC,13);
  Tb:=PrintRep.LastTable;
  Tb.SetWidths('530,110,10,310,152,128');

  Tb.Cell[1,1].Align:=AL_CENTER;
  if Not FBlank then
   begin
    if edBank.ItemIndex in [0,1,2,3,5,6] then Tb.Cell[1,1].AddText(DateToStrUA(dtAct.Date,'dd'))
                                         else Tb.Cell[1,1].AddText(DateToStrUA(dtAct.Date,'d'));
   end;
  for i:=1 to NC do Tb.Cell[i,1].TopMargin:=0;

  Tb.MergeCells(1,2,2,2);
  Tb.Cell[1,2].Font.Size:=3;
  Tb.Cell[1,2].TopMargin:=0;
  Tb.Cell[1,2].AddText('                         (дата заповнення)'#10);

  Tb.Cell[1,2].Align:=AL_LEFT;
  Tb.Cell[1,2].Font.Size:=4;
  Tb.Cell[1,2].Font.Style:=[fsBold];
  Tb.Cell[1,2].AddText('Від кого ');
  Tb.Cell[1,2].Font.Style:=[];
  if Not FBlank then
   Tb.Cell[1,2].AddText(edS.Text);

  Tb.MergeCells(1,3,2,3);
  Tb.Cell[1,3].Font.Style:=[fsBold];
  Tb.Cell[1,3].AddText('Одержувач ');
  Tb.Cell[1,3].Font.Style:=[];
  Tb.Cell[1,3].AddText(edD.Text);

  Tb.MergeCells(1,4,2,4);
  Tb.Cell[1,4].Align:=AL_CENTER;
  Tb.Cell[1,4].AddText('готівкою');
  Tb.Cell[1,4].Align:=AL_LEFT;
  Tb.Cell[1,4].AddText(#10+'Для зарахування на рахунок '+edMFO.Text);

  Tb.MergeCells(1,5,2,5);
  Tb.Cell[1,5].AddText('Банк одержувача: ');
  if Not FBlank then
   Tb.Cell[1,5].AddText(FBank);

  Tb.MergeCells(1,6,2,7);
  Tb.Cell[1,6].AddText('Сума словами: ');
  if GetSummAll>0 then
   begin
    S:=IntToWordsUA(CalcSumm,0);
    S[1]:=AnsiUpperCase(S[1])[1];
    Tb.Cell[1,6].AddText(S+' грн. '+IntToStrF(GetKop,2)+' коп.');
   end; 

  Tb.Cell[4,1].Align:=AL_CENTER;
  Tb.Cell[4,1].AddText('Дебет');
  Tb.Cell[4,2].Align:=AL_CENTER;
  if Not FBlank then
   Tb.Cell[4,2].AddText(edDeb.Text);
  Tb.Cell[4,2].AddText(#10+'рахунок №');

  Tb.Cell[4,3].Align:=AL_CENTER;
  Tb.Cell[4,3].BottomMargin:=Tb.Cell[3,3].BottomMargin+10;
  Tb.Cell[4,3].AddText('Кредит');

  Tb.Cell[4,4].Align:=AL_CENTER;
  Tb.Cell[4,4].BottomMargin:=Tb.Cell[3,4].BottomMargin+10;
  Tb.Cell[4,4].AddText(edKr.Text);
  Tb.Cell[4,4].AddText(#10+'рахунок №');

  Tb.Cell[4,5].AddText(#10+'чеками з рахунків');
  Tb.Cell[4,6].AddText('згідно з переліком');
  Tb.Cell[4,7].AddText('на зворотному боці');
  for i:=1 to NC do Tb.Cell[i,7].TopMargin:=0;

  if P in [1,2] then
   begin
    Tb.MergeCells(5,2,6,5);
    Tb.Cell[5,2].Align:=AL_CENTER;
    Tb.Cell[5,2].AddText('Сума'+#10);
    if GetSummAll>0 then
     Tb.Cell[5,2].AddText(CurrToStrF(GetSummAll,ffFixed,2));
    Tb.MergeCells(5,6,6,6);
    Tb.Cell[5,6].Align:=AL_CENTER;
    Tb.Cell[5,6].AddText('Загальна');
   end else begin
             Tb.MergeCells(5,2,6,2);
             Tb.Cell[5,2].Align:=AL_CENTER;
             Tb.Cell[5,2].AddText('Сума'+#10);
             if GetSummAll>0 then
              Tb.Cell[5,2].AddText(CurrToStrF(GetSummAll,ffFixed,2));
             Tb.MergeCells(5,3,6,3);
             Tb.Cell[5,3].Align:=AL_CENTER;
             Tb.Cell[5,3].AddText('Загальна');
             Tb.MergeCells(5,4,6,4);
             Tb.MergeCells(5,5,6,6);
            end;

  Tb.Cell[5,7].Align:=AL_CENTER;
  Tb.Cell[5,7].AddText('Сума');
  Tb.Cell[6,7].AddText('Код');

  Tb.MergeCells(1,8,4,8);
  Tb.Cell[1,8].Font.Style:=[fsBold];
  Tb.Cell[1,8].AddText('Керівник підприємства (організації)         Касир');
  Tb.Cell[1,8].BottomMargin:=10;

  Tb.Cell[5,9].AddText('  ');
  Tb.Cell[5,10].AddText('  ');
  Tb.Cell[5,11].AddText('  ');

  Tb.Cell[5,12].Font.Size:=3;
  Tb.Cell[5,12].AddText('Вид операції');
  Tb.Cell[5,13].Font.Size:=3;
  Tb.Cell[5,13].AddText('Призна- чення платежу');
  Br:=Border(clBlack,4,psSolid);
  if P in [1,2] then
   begin
    Tb.MergeCells(1,9,4,9);
    Tb.Cell[1,9].AddText('Зазначена вище сума прийнята повністю');
    Tb.MergeCells(1,10,4,10);
    Tb.Cell[1,10].Font.Style:=[fsBold];
    Tb.Cell[1,10].AddText('Касир');
    Tb.MergeCells(1,11,4,11);
    Tb.Cell[1,11].Font.Style:=[fsBold];
    Tb.Cell[1,11].AddText('Контролер');

    Tb.MergeCells(1,12,4,12);
    Tb.Cell[1,12].Font.Style:=[fsBold];
    Tb.Cell[1,12].AddText('    Акт   _____________________');
    Tb.Cell[1,12].Font.Size:=3;
    Tb.Cell[1,12].Font.Style:=[];
    Tb.Cell[1,12].AddText(#10'                        (дата складання акта)');

    Tb.MergeCells(1,13,4,13);
    Tb.Cell[1,13].AddText('Під час розкриття сумки і перерахування вкладень виявилося:'#10);
    Tb.Cell[1,13].AddText('готівкою, грн.   ______________ , недостача, грн. ___________ ,'#10);
    PrintRep.AddText('надлишок, грн. ______________ ;'#10);
    PrintRep.AddText('чеками, грн.      ______________ , недостача, грн. ___________ '#10);
    PrintRep.AddText('надлишок, грн. ______________ ;'#10);
    PrintRep.AddText('неплатіжних і сумнівних банкнот (чеків), грн. ____________ ,'#10);
    PrintRep.AddText('дефективних банкнот (чеків), грн. ___________');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText('                      Підписи');
    PrintRep.AddText(#10'                                                                                         працівників банку'#10);
    PrintRep.AddInterv(1);
    PrintRep.AddText('Касир         Контролер         Представник клієнта         Контролер');
   end else begin
             Tb.MergeCells(1,10,4,10);
             Tb.Cell[1,10].Align:=AL_CENTER;
             Tb.Cell[1,10].Font.Style:=[fsBold];
             Tb.Cell[1,10].AddText('Розписка');
             Tb.MergeCells(1,12,4,12);
             Tb.Cell[1,12].AddText('Опломбовану сумку № _________________ без перерахування');
             Tb.MergeCells(1,13,4,13);
             Tb.Cell[1,13].AddText('вкладених у неї коштів прийняв інкасатор'#10);
             Tb.Cell[1,13].Font.Name:='Arial';
             Tb.Cell[1,13].Font.Size:=6;
             Tb.Cell[1,13].Font.Style:=[fsBold];
             Tb.Cell[1,13].AddText('______________________________________');

             Tb.Cell[5,9].BottomMargin:=10;
             Tb.Cell[5,10].BottomMargin:=10;
             Tb.Cell[5,11].BottomMargin:=10;

             Tb.Cell[5,12].TopMargin:=15;
             Tb.Cell[5,12].BottomMargin:=20;
             Tb.Cell[5,13].TopMargin:=15;
             Tb.Cell[5,13].BottomMargin:=25;
             PrintRep.Font.Size:=3;
             PrintRep.AddText('                              (найменування банківської установи)'#10);

             PrintRep.Font.Name:='Arial';
             PrintRep.Font.Size:=6;
             PrintRep.Font.Style:=[fsBold];
             PrintRep.AddText('__________________    __________________');

             PrintRep.Font.Name:=FontName;
             PrintRep.Font.Size:=3;
             PrintRep.Font.Style:=[];
             PrintRep.AddText(#10'                (прізвище, ініціали)                                              (підпис)'#10);

             PrintRep.Font.Name:='Arial';
             PrintRep.Font.Size:=6;
             PrintRep.Font.Style:=[fsBold];
             PrintRep.AddText('                                        __________________');

             PrintRep.Font.Name:=FontName;
             PrintRep.Font.Size:=3;
             PrintRep.Font.Style:=[];
             PrintRep.AddText(#10'            М.П.                                                                            (дата)');

            end;
  PrintRep.Font.Size:=2;
  PrintRep.AddText(#10);
  for i:=1 to NC do
   begin
    Tb.Cell[i,13].TopMargin:=0;
    Tb.Cell[i,13].BottomMargin:=0;
   end;

  Tb.SetBorders(1,1,NC,13,Br);
  Tb.SetBorders(1,1,NC,1,EMPTY_BORDER);
  Tb.SetBorders(1,2,2,4,EMPTY_BORDER);
  Tb.SetBorders(3,1,3,7,EMPTY_BORDER);
  Tb.SetBorders(1,9,4,13,EMPTY_BORDER);
  Tb.Cell[1,1].BottomBorder:=Br;
  for i:=4 to 6 do Tb.Cell[i,1].BottomBorder:=Br;
  Tb.Cell[3,2].RightBorder:=Br;
  for i:=4 to 7 do Tb.Cell[3,i].RightBorder:=Br;
  Tb.Cell[4,5].BottomBorder:=EMPTY_BORDER;
  Tb.Cell[5,5].BottomBorder:=EMPTY_BORDER;
  Tb.Cell[4,6].BottomBorder:=EMPTY_BORDER;
  Tb.Cell[3,7].BottomBorder:=Br;

  Tb.Cell[1,4].BottomBorder:=Br;
  Tb.Cell[2,4].BottomBorder:=Br;
  for i:=5 to 8 do Tb.Cell[1,i].LeftBorder:=EMPTY_BORDER;
  for i:=1 to 4 do Tb.Cell[i,8].BottomBorder:=Br;

  for i:=9 to 13 do Tb.Cell[4,i].RightBorder:=Br;
  if P=3 then
   begin
    Tb.Cell[5,2].BottomBorder:=EMPTY_BORDER;
    Tb.Cell[6,2].BottomBorder:=EMPTY_BORDER;
    Tb.Cell[5,6].BottomBorder:=Br;
    Tb.Cell[6,6].BottomBorder:=Br;
   end;
 end;

procedure TRepIncomF.PreparePageBack1;
var Tb:TTableObj;
    i,j:Integer;
    ed:TEdit;
 begin
  PrintRep.SetDefault;
  PrintRep.Font.Name:=Fontname;
  PrintRep.Font.Size:=4;
  PrintRep.Indent:=0;
  for i:=1 to 6 do PrintRep.AddInterv(1);
  PrintRep.Align:=AL_CENTER;
  PrintRep.AddTable(8,17);
  Tb:=PrintRep.LastTable;
  Tb.SetWidths('720,170,130,150,200,270,140,150');
  Tb.SetBorders(2,1,8,17,Border(clBlack,4,psSolid));
  Tb.Cell[2,1].AddText('Номінал банкноти або її вартість');
  Tb.Cell[3,1].AddText(#10'Кіль- кість');

  Tb.Cell[4,1].AddInterv(5);
  Tb.Cell[4,1].AddText('Сума');

  Tb.Cell[5,1].AddText(#10'Номер чека та серія');
  Tb.Cell[6,1].AddText('Номер рахунку та найменування чекодавця');

  Tb.Cell[7,1].AddInterv(3);
  Tb.Cell[7,1].AddText('Сума, грн.');
  Tb.Cell[8,1].AddText('Відміт- ка про дефект- ні чеки');
  for i:=2 to 8 do
   begin
    Tb.Cell[i,2].Font.Size:=3;
    Tb.Cell[i,2].Addtext(IntToStr(i-1));
   end;

  for i:=1 to 14 do
   begin
    for j:=2 to 4 do
     begin
      Tb.Cell[j,i+2].TopMargin:=20;
      Tb.Cell[j,i+2].BottomMargin:=13;
     end;
    if i>9 then
     begin
      Tb.Cell[2,i+2].Addtext(' ');
      Continue;
     end;
    ed:=TEdit(FindComponent('ed'+IntToStr(i)));
    Tb.Cell[2,i+2].Addtext(IntToStr(ed.Tag));
    if GetSummAll>0 then
     if ed.Text<>'' then
      begin
       Tb.Cell[3,i+2].Addtext(ed.Text);
       Tb.Cell[4,i+2].Addtext(IntToStr(StrToInt(ed.Text)*ed.Tag));
      end else begin
                Tb.Cell[3,i+2].Addtext('-');
                Tb.Cell[4,i+2].Addtext('-');
               end;
   end;

  if GetKop>0 then
   begin
    Tb.Cell[2,13].Addtext('Копiйок:');
    Tb.Cell[4,13].Addtext(IntToStr(GetKop));
   end;
  Tb.Cell[2,17].Align:=AL_LEFT;
  Tb.MergeCells(2,17,4,17);
  Tb.Cell[2,17].Align:=AL_LEFT;
  Tb.Cell[2,17].Addtext('Усього:  ');

  if GetSummAll>0 then
   Tb.Cell[2,17].Addtext(CurrToStrF(GetSummAll,ffFixed,2));

  Tb.MergeCells(6,17,7,17);
  Tb.Cell[6,17].Align:=AL_LEFT;
  Tb.Cell[6,17].TopMargin:=20;
  Tb.Cell[6,17].BottomMargin:=13;
  Tb.Cell[6,17].AddText('Усього:');

  Tb.SetBorders(1,1,1,17,EMPTY_BORDER);
  for i:=1 to 17 do Tb.Cell[1,i].RightBorder:=Border(clBlack,4,psSolid);
 end;

procedure TRepIncomF.PreparePageBack2;
var Tb:TTableObj;
    i:Integer;
 begin

  PrintRep.SetDefault;
  PrintRep.Font.Name:=FontName;
  PrintRep.Font.Size:=4;
  PrintRep.Align:=AL_CENTER;
  for i:=1 to 7 do PrintRep.AddInterv(4);
  PrintRep.AddText('                                                                        До уваги'#10#10);
  PrintRep.Align:=AL_LEFT;
  PrintRep.AddTable(3,1);
  Tb:=PrintRep.LastTable;
  Tb.SetWidths('850,700,350');
  Tb.SetBorders(1,1,3,1,EMPTY_BORDER);
  Tb.Cell[2,1].RightBorder:=Border(clBlack,4,psSolid);
  Tb.Cell[2,1].AddText('Готівка сортується за номіналами банкнот.'#10);
  Tb.Cell[2,1].AddText('Відбиток пломбіра має бути чітким.'#10);
  Tb.Cell[2,1].AddText('Слід обережно поводитися із сумкою.'#10);

  Tb.Cell[3,1].AddText('   Цей примірник'#10);
  Tb.Cell[3,1].AddText('   залишається в'#10);
  Tb.Cell[3,1].AddText('   здавача готівки'#10);
  Tb.Cell[3,1].AddText('   як квитанція'#10);
  Tb.Cell[3,1].AddText('   про приймання'#10);
  Tb.Cell[3,1].AddText('   інкасатором'#10);
  Tb.Cell[3,1].AddText('   сумки з готівкою.'#10#10);

 end;

procedure TRepIncomF.edKopKeyPress(Sender:TObject; var Key:Char);
var ed:TEdit;
 begin
  if Sender=nil then Exit;
  ed:=TEdit(Sender);
  if Key<>#8 then
   if (Not (Key in CH_DIGIT)) or (Length(ed.Text)>=2) then Key:=#0;
 end;

function TRepIncomF.GetKop:Integer;
 begin
  try
   if edKop.Text='' then Abort;
   Result:=StrToInt(edKop.Text);
  except
   Result:=0;
  end;
 end;

procedure TRepIncomF.BitBtn1Click(Sender:TObject);
var i:Integer;
    tmpS:String;
 begin
  tmpS:=edMFO.Text;
  try
   edMFO.Text:='МФО: ';
   try
    InitRep;
    FBlank:=True;
    PreparePage(1);
    for i:=1 to 22 do PrintRep.AddInterv(1);
    PreparePage(1);

    PreparePageBack1;
    for i:=1 to 27 do PrintRep.AddInterv(1);
    PreparePageBack1;
    PrintRep.AddText(#12);

    PreparePage(2);
    for i:=1 to 22 do PrintRep.AddInterv(1);
    PreparePage(2);
    PrintRep.AddText(#12);

    PreparePageBack1;
    for i:=1 to 27 do PrintRep.AddInterv(1);
    PreparePageBack1;

    for i:=1 to 8 do PrintRep.AddInterv(1);
    PreparePage(3);
    for i:=1 to 34 do PrintRep.AddInterv(1);
    PreparePage(3);
    PrintRep.AddText(#12);

    for i:=1 to 8 do PrintRep.AddInterv(1);
    PreparePageBack2;
    for i:=1 to 108 do PrintRep.AddInterv(1);
    PreparePageBack2;

    PrintRep.PreView;

   except
    MainF.MessBox('Ошибка формирования бланков для инкассации!')
   end;
  finally
   edMFO.Text:=tmpS;
  end;
 end;

{
procedure TRepIncomF.BitBtn4Click(Sender:TObject);
var i:Integer;
 begin
  if edKr.Text='' then begin MainF.MessBox('Выбериите банк получателя!'); Exit; end;
  try
   InitRep;
   FBlank:=False;
   PreparePage(1);
   for i:=1 to 22 do PrintRep.AddInterv(1);
   PreparePage(1);

   PreparePageBack1;
   for i:=1 to 27 do PrintRep.AddInterv(1);
   PreparePageBack1;
   PrintRep.AddText(#12);

   PreparePage(2);
   for i:=1 to 22 do PrintRep.AddInterv(1);
   PreparePage(2);
   PrintRep.AddText(#12);

   PreparePageBack1;
   for i:=1 to 27 do PrintRep.AddInterv(1);
   PreparePageBack1;

   for i:=1 to 8 do PrintRep.AddInterv(1);
   PreparePage(3);
   for i:=1 to 34 do PrintRep.AddInterv(1);
   PreparePage(3);
   PrintRep.AddText(#12);

   for i:=1 to 8 do PrintRep.AddInterv(1);
   PreparePageBack2;
   for i:=1 to 108 do PrintRep.AddInterv(1);
   PreparePageBack2;

   if PrintRep.PreView then
    try
     DM.QrEx.Close;
     DM.QrEx.SQL.Clear;
     DM.QrEx.SQL.Add('insert into PrintBNKLog(dt,id_user,summa)');
     DM.QrEx.SQL.Add('values(getdate(),'+IntToStr(Prm.UserID)+','+CurrToStrF(GetSummAll,ffFixed,2)+')');
     DM.QrEx.ExecSQL;

    except
    end;
   SaveFields;

  except
   MainF.MessBox('Ошибка формирования бланков для инкассации!')
  end;
 end;
}

procedure TRepIncomF.BitBtn4Click(Sender:TObject);
var i:Integer;
 begin
  if edKr.Text='' then begin MainF.MessBox('Выбериите банк получателя!'); Exit; end;
  try
   InitRep;
   FBlank:=False;
   PreparePage(1);
   for i:=1 to 17 do PrintRep.AddInterv(1);
   PreparePage(2);
   PrintRep.AddText(#12);

   PreparePageBack1;
   for i:=1 to 23 do PrintRep.AddInterv(1);
   PreparePageBack1;
   PrintRep.AddText(#12);

   for i:=1 to 7 do PrintRep.AddInterv(1);
   PreparePage(3);
   PrintRep.AddText(#12);

   for i:=1 to 8 do PrintRep.AddInterv(1);
   PreparePageBack2;

   if PrintRep.PreView then
    try

     DM.QrEx.Close;
     DM.QrEx.SQL.Clear;
     DM.QrEx.SQL.Add('insert into PrintBNKLog(dt,id_user,summa)');
     DM.QrEx.SQL.Add('values(getdate(),'+IntToStr(Prm.UserID)+','+CurrToStrF(GetSummAll,ffFixed,2)+')');
     DM.QrEx.ExecSQL;

    except
    end;
   SaveFields;

  except
   on E:Exception do
    MainF.MessBox('Ошибка формирования бланков для инкассации: '+E.Message);
  end;
 end;

procedure TRepIncomF.edBankChange(Sender:TObject);
 begin
  edKr.Text:='';
  edMFO.Text:='';
  FBank:=edBank.Text;
  if edBank.ItemIndex in [0] then
   begin
  {
    Case Prm.FirmID of
     1:edKr.Text:='260073013432';
     3:edKr.Text:='26001010106567';
     4:edKr.Text:='26008010106720';
     6:edKr.Text:='26008010106805';
     7:edKr.Text:='26008010106560';
    end;
    edMFO.Text:='МФО: 351931';
  }
   end else
  if edBank.ItemIndex=1 then
   begin
    if Prm.FirmID=10 then
     begin
      edKr.Text:='26002052333300';
      edMFO.Text:='МФО: 351533';
      FBank:='ГРУ ПАТ КБ "Приватбанк"';
     end else
    if Prm.FirmID=15 then
     begin
      edKr.Text:='26005052312771';
      edMFO.Text:='МФО: 351533';
      FBank:='ГРУ ПАТ КБ "Приватбанк"';
     end else
    if Prm.FirmID=9 then
     begin
      edKr.Text:='26008060817555';
      edMFO.Text:='МФО: 351533';
      FBank:='ГРУ ПАТ КБ "Приватбанк"';
     end else
    if Prm.FirmID=20 then
     begin
      edKr.Text:='26001060815918';
      edMFO.Text:='МФО: 351533';
      FBank:='ГРУ ПАТ КБ "Приватбанк"';
     end else
    if Prm.AptekaID in [50,158,159,207,221,254] then
     begin
      Case Prm.FirmID of
       3 :edKr.Text:='26007060328476';
       4 :edKr.Text:='26007060328465';
       7 :edKr.Text:='26007060328498';
       11:edKr.Text:='26009405657001';
      end;
      edMFO.Text:='МФО: 351533';
      FBank:='ПАТ КБ "Приватбанк"';
     end else edKr.Text:='26004201759001';
   end else
  if edBank.ItemIndex in [2] then
   begin
    edMFO.Text:='МФО: 321767';
    Case Prm.FirmID of
     1: edKr.Text:='26008020092284';
     3: edKr.Text:='26001010118238';
     4: edKr.Text:='26003010125081';
     6: edKr.Text:='26000010137276';
     7: edKr.Text:='26007010137268';
     8: edKr.Text:='26004010455802';
     10:edKr.Text:='26002010531698';
     11:edKr.Text:='26004010534808';
     18:edKr.Text:='26008010604585';
    end;
   end else
  if edBank.ItemIndex in [3] then
   begin
    if Prm.FirmID=1 then
     begin
     {
      edKr.Text:='260073013432';
      edMFO.Text:='МФО: 351931';
      FBank:='АТ "БАНК ЗОЛОТI ВОРОТА"';
     }
      edKr.Text:='26008020092284';
      edMFO.Text:='МФО: 321767';
      FBank:='ПАТ "ВТБ Банк"';
     end else begin
               if Prm.FirmID<>9 then
                begin
                 if Prm.AptekaID in [100,124,161] then
                  begin
                   edMFO.Text:='МФО: 351931';
                   FBank:='АТ "БАНК ЗОЛОТI ВОРОТА"';
                  end else
                 if Prm.AptekaID in [50,235,209,85,157,171,86,112,137,121,127,71,91,134,174,80,202,204,169,187,218,220] then
                  begin
                   edMFO.Text:='МФО: 351533';
                   FBank:='ПАТ "ПРИВАТБАНК"';
                  end else begin
                            edMFO.Text:='МФО: 321767';
                            FBank:='ПАТ "ВТБ Банк"';
                           end;
                end else begin
                          edMFO.Text:='МФО: 351533';
                          FBank:='ПАТ "ПРИВАТБАНК"';
                         end;
               if Prm.FirmID=2 then edKr.Text:='26002010125941' else  //ТОВ Нова Русь

               if Prm.FirmID=3 then                                   //ПП Аптека 2011
                begin
//                 if Prm.AptekaID in []         then edKr.Text:='26001010106567' else
                 if Prm.AptekaID in [171,112,86,137,71,91,134,202,204] then edKr.Text:='26007060328476'
                                                                       else edKr.Text:='26001010118238';
                end else
               if Prm.FirmID=4 then //ПП Темп 2011
                begin
//                 if Prm.AptekaID in [] then edKr.Text:='26008010106720'
                 edKr.Text:='26003010125081';
                end else
               if Prm.FirmID=5 then edKr.Text:='26000010120056' else  //КП ОЗ МБА №271
               if Prm.FirmID=6 then //ПП Фармарост 2011
                begin
                 if Prm.AptekaID in [157,85,121,127] then edKr.Text:='26007060328487'
                                                     else edKr.Text:='26000010137276';
                end else
               if Prm.FirmID=7 then                                   //ПП Фармация 2011
                begin
//                 if Prm.AptekaID in [120,149,82,219,64,29,88,78,165,65,122,170] then edKr.Text:='26008010106560' else
                 if Prm.AptekaID in [174,80]                                then edKr.Text:='26007060328498'
                                                                                else edKr.Text:='26007010137268';
                end else
               if Prm.FirmID=8 then edKr.Text:='26001000127263' else  //ПП Осан
               if Prm.FirmID=9 then edKr.Text:='26008060817555' else  //ТОВ Данунц
               if Prm.FirmID=10 then edKr.Text:='26002052333300' else // ООО "УЛЬТРАСПЕЦМОНТАЖ"
               if Prm.FirmID=11 then edKr.Text:='26009405657001';  // ООО "Аптека 97"
              end;
   end else
  if edBank.ItemIndex in [4] then
   begin
    edMFO.Text:='МФО: 380634';
    FBank:='ПуАТ "КБ "Акордбанк"';
    Case Prm.FirmID of
     1:edKr.Text:='26009006790001'; //ПФ Гамма 55
     2:edKr.Text:='26002006816001'; //ТОВ Нова Русь
     3:edKr.Text:='26003006804001'; //ПП Аптека 2011
     4:edKr.Text:='26009006789001'; //ПП Темп 2011
     6:edKr.Text:='26001006787001'; //ПП Фармарост 2011
     7:edKr.Text:='26002006786001'; //ПП Фармация 2011
    end;
   end else
  if edBank.ItemIndex in [5] then
   begin
    if Prm.FirmID<>9 then
     begin
      edKr.Text:='2600930689801';
      edMFO.Text:='МФО: 305006';

     end else begin
               FBank:='ПАТ "БАНК КРЕДИТ ДНIПРО"';
               edMFO.Text:='МФО: 351533';
               edKr.Text:='26008060817555';
              end;
   end else
  if edBank.ItemIndex in [6] then
   begin
    if Prm.FirmID<>8 then
     begin
      edKr.Text:='26001000127263';
      edMFO.Text:='МФО: 351618';
     end else begin
               edKr.Text:='26009052314805';
               edMFO.Text:='МФО: 351533';
               FBank:='ПАТ КБ "ПРИВАТБАНК"';
              end;
   end else
  if edBank.ItemIndex in [7] then
   begin
    if Prm.FirmID=13 then
     begin
      edKr.Text:='26001514777300';
      edMFO.Text:='МФО: 351005';
      FBank:=edBank.Text;
     end;
   end else
  if edBank.ItemIndex in [8] then
   begin
    Case Prm.FirmID of
      1:edKr.Text:='26006010338183';
      3:edKr.Text:='26006010338075';
      4:edKr.Text:='26007010338182';
      6:edKr.Text:='26008010338222';
      7:edKr.Text:='26001010338199';
      9:edKr.Text:='26003010450978';
     10:edKr.Text:='26005010338236';
     11:edKr.Text:='26008010338103';
     13:edKr.Text:='26002010332945';
     14:edKr.Text:='26003010397075';
     15:edKr.Text:='26007010397082';
     16:edKr.Text:='26006010397812';
     18:edKr.Text:='26004010517445';  //'2600222331';
     19:edKr.Text:='26002010461009';
     21:edKr.Text:='26003010548169';
    end;
    edMFO.Text:='МФО: 307123';
    FBank:=edBank.Text;
{
    if Prm.FirmID<>18 then
     begin

     end else begin
               edMFO.Text:='МФО: 334851';
               FBank:='Банк "Восток"';
              end;
}
   end else
  if edBank.ItemIndex in [9] then
   begin
    Case Prm.FirmID of
      9:edKr.Text:='2600026218';
     18:edKr.Text:='2600222331';
    end;
    edMFO.Text:='МФО: 334851';
    FBank:=edBank.Text;
   end else
  if edBank.ItemIndex in [10] then
   begin
    if Prm.FirmID=19 then
     begin
      edKr.Text:='26002000022447';
      edMFO.Text:='МФО: 300023';
      FBank:=edBank.Text;
     end;
   end;
 end;

procedure TRepIncomF.BitBtn3Click(Sender: TObject);
var Terminal:Variant;
    S1,S2,MerchNum:String;
    q,m1,m2,m3,i,P:Integer;
    SL:TStringList;


 procedure tWait;
  begin
   Label23.Visible:=True;
   Repeat
    if (Terminal.GetLastResult<>2) or (StartTerminal=False) then Break;
    Application.ProcessMessages;
   Until False;
   Label23.Visible:=False;

   if (StartTerminal=False) or (Terminal.GetLastResult=1) then
    begin
     Terminal.Cancel;
     raise EAbort.Create('операция прервана.');
    end;
  end;

 function GetTextSum(S:String):String;
  begin
   Result:=S;
   if S='' then S:='0';
   S:=IntToStr(StrToInt(S));
   Result:=S;
  end;

 Begin
  if TBitBtn(Sender).Tag=2 then begin StartTerminal:=False; Exit; end;

  if (Sender=BitBtn3) and (lbePhone.Text='') then
   begin
    MainF.MessBox('Введите номер телефона для подтверждения инкассации!');
    lbePhone.SetFocus;
    Exit;
   end;

  if (Sender=BitBtn5) and (ledID.Text='') then
   begin
    MainF.MessBox('Введите ID транзакции для подтверждения инкассации!');
    ledID.SetFocus;
    Exit;
   end;

  if (Sender=BitBtn5) and (ledP.Text='') then
   begin
    MainF.MessBox('Введите пароль для подтверждения инкассации!');
    ledP.SetFocus;
    Exit;
   end;

  if (Sender=BitBtn3) and (GetSummAll<=0) then
   begin
    MainF.MessBox('Нельзя проинкассировать нулевую сумму. Заполните днанные для инкассации!');
    Exit;
   end;
  if MainF.MessBox('Вы действительно хотите совершить инкасацию по терминалу?',52)<>ID_YES then Exit;
  try
   try
    StartTerminal:=True;
    TBitBtn(Sender).Tag:=2;

    if Sender=BitBtn3 then
     TBitBtn(Sender).Caption:='Прервать инкассацию ' else
    if Sender=BitBtn5 then
     TBitBtn(Sender).Caption:='Прервать подтверждение';

    Terminal:=CreateOleObject('ECRCommX.ECRLibSgn');
    Terminal.SetUserTimeOut(40);
    Terminal.SetCommNum(Opt.NumPortTerminal,115200);
    Terminal.PosGetInfo;
    tWait;
    MerchNum:=Terminal.getInfoBiplan;
    P:=Pos('/',MerchNum);
    if P=0 then raise EAbort.Create('не удалось считать необходимую информацию с терминала.');

    m1:=-1; m2:=-1; q:=0;
    for i:=P to Length(MerchNum) do
     begin
      if MerchNum[i]='/' then
       begin
        Inc(q);
        if ((MerchNum[i+1]='I') or ((MerchNum[i+1]='i'))) then
         begin
          if m1=-1 then m1:=q else
          if m2=-1 then m2:=q else begin m3:=q; break; end;
         end;
       end;
     end;
    if Sender=BitBtn3 then
     begin
      S1:='/4400/2/'+
          CurrToStrF(0.01*GetKop,ffFixed,2)+'/'+
          GetTextSum(ed1.Text)+'/'+
          GetTextSum(ed2.Text)+'/'+
          GetTextSum(ed3.Text)+'/'+
          GetTextSum(ed4.Text)+'/'+
          GetTextSum(ed5.Text)+'/'+
          GetTextSum(ed6.Text);

      S2:='/4400/'+
          GetTextSum(ed7.Text)+'/'+
          GetTextSum(ed8.Text)+'/'+
          GetTextSum(ed9.Text)+'/'+
          CurrToStrF(GetSummAll,ffFixed,2)+'/'+lbePhone.Text;

{
    SL:=TStringList.Create;
    SL.Add(MerchNum);
    SL.Add('0'+','+IntToStr(m1)+','+S1);
    SL.Add('0'+','+IntToStr(m1)+','+S2);
    SL.SaveToFile('C:\Term.txt');
}
      Terminal.PosService(0,m1,109,S1);
      tWait;

      Terminal.PosService(0,m2,110,S2);
      tWait;
     end else
    if Sender=BitBtn5 then
     begin
      S1:='/'+ledP.Text+'/'+ledID.Text;
      Terminal.PosService(0,m3,111,S1);
      tWait;
     end;
{
 TE7E118
 S1HA0XFE
 00CT20744822
 /S1HA0XFE/L1HA2XFE/L1HA3XFE/I1HA0XFE/I1HA0XFE/IPHA0XFE/X1HA1XFE/X1HA2XFE/X1HAEXFE/X1HAXXFE/Y1HABXFE/S1HA0XFE
}
   finally
    if Sender=BitBtn3 then
     TBitBtn(Sender).Caption:='Инкассация через терминал' else
    if Sender=BitBtn5 then
     TBitBtn(Sender).Caption:='Подтвердить инкассацию';

    StartTerminal:=False;
    TBitBtn(Sender).Tag:=1;
   end;
  except
   on E:Exception do MainF.MessBox('Ошибка инкассации по терминалу: '+E.Message);
  end;
 end;

{
procedure TBankCardF.BitBtn3Click(Sender:TObject);
var Terminal:Variant;
    Sum:Integer;

 procedure tWait;
  begin
   Label5.Visible:=True;
   Repeat
    if (Terminal.GetLastResult<>2) or (StartTerminal=False) then Break;
    Application.ProcessMessages;
   Until False;
   if StartTerminal=False then Terminal.Cancel;
   Label5.Visible:=False;
  end;

 begin
  if BitBtn3.Tag=2 then begin StartTerminal:=False; Exit; end;
  if MainF.MessBox('Вы действительно хотите совершить оплату по терминалу?',52)<>ID_YES then Exit;
  try
   try
    StartTerminal:=True;
    BitBtn3.Tag:=2;
    BitBtn3.Caption:='Прервать оплату по терминалу';
    Terminal:=CreateOleObject('ECRCommX.ECRLibSgn');
    Terminal.SetUserTimeOut(40);
    Terminal.SetCommNum(Opt.NumPortTerminal,115200);
    tWait;
    if StartTerminal=True then
     begin
      Sum:=Round(CP.SumChek*100);
      Terminal.PosPurchase(Sum,0,' ');
     end;
    tWait;

    if (Terminal.GetLastResult=1) or (StartTerminal=False) then
     begin
      MainF.MessBox('Оплата прервана. Убедитесь по чекам, которые выдал терминал прошла оплата или нет. Если чеков нет снимите X-баланс с терминала!!!');
     end else MainF.MessBox('Оплата по терминалу прошла успешно. Убедитесь по чекам, которые выдал терминал прошла оплата или нет!',64);

   finally
    BitBtn3.Caption:='Оплатить по терминалу';
    StartTerminal:=False;
    BitBtn3.Tag:=1;
   end;
  except
   on E:Exception do MainF.MessBox('Ошибка оплаты по терминалу: '+E.Message);
  end;
 end;
}
END.
