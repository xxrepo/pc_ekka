unit SpisForVozrU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Grids, DBGrids, StdCtrls, Buttons, PrintReport, DateUtils;

type
  TSpisForVozrF = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
  public

    FlExit:Boolean;

  end;

var SpisForVozrF:TSpisForVozrF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TSpisForVozrF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  FlExit:=False;
  Label1.Caption:='Дата списка: '+DateTimeToStr(Prm.VSDate);
  DM.qrSpisForVozr.Close;
  DM.qrSpisForVozr.SQL.Clear;
  DM.qrSpisForVozr.SQL.Add('select a.art_code,p.names,Sum(a.kol) as kol,IsNull(Closed,0) as Closed ');
  DM.qrSpisForVozr.SQL.Add('from SpisVozr a,');
  DM.qrSpisForVozr.SQL.Add('     (select art_code,names from SprTov group by art_code,names) p');
  DM.qrSpisForVozr.SQL.Add('where a.art_code=p.art_code and');
  DM.qrSpisForVozr.SQL.Add('      a.dtvz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+''' ');
  DM.qrSpisForVozr.SQL.Add('group by a.art_code,p.names,Closed');
  DM.qrSpisForVozr.SQL.Add('order by 2      ');
  DM.qrSpisForVozr.Open;

 end;

procedure TSpisForVozrF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TSpisForVozrF.BitBtn1Click(Sender: TObject);
var Skl:String;
    i:Integer;
 begin
  try
   if Sender=nil then Exit;
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select Count(*) as Rc from SpisVozr where IsNull(Closed,0)=0 and DtVZ='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+''' ';
   DM.QrEx.Open;
   if DM.QrEx.FieldByName('rc').AsInteger>0 then
    if MainF.MessBox('После печати все наименования данного списка станут на резерв и продать их в данном количестве вы не сможете, до прихода ревизора! Напечатать список?',52)<>ID_YES then Exit;

   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Orientation:=O_LANDS;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=5;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.AddText('Список препаратов для возврата'+#10#10);
   PrintRep.AddText('Торговая точка: '+Prm.AptekaNameRU+#10);
   PrintRep.AddText('Дата списка: '+DateTimeToStr(Prm.VSDate)+#10);
   PrintRep.AddText('Дата печати списка: '+DateTimeToStr(Now)+#10);

   PrintRep.Font.Size:=4;
   PrintRep.Font.Style:=[];

   DM.Qr1.Close;
   DM.Qr1.SQL.Text:='select gr from SprVGr where art_code in (select art_code from SpisVozr where dtvz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+''' ) group by gr';
   DM.Qr1.Open;
   for i:=1 to DM.Qr1.RecordCount do
    begin
     if i=1 then DM.Qr1.First else DM.Qr1.Next;
     PrintRep.Font.Style:=[fsBold];
     Case DM.Qr1.FieldByName('gr').AsInteger of
      1:Skl:='БЕЛОСТОЦКИЙ';
      2:Skl:='КАРКАЧА';
     end;
     PrintRep.Font.Style:=[fsBold];
     PrintRep.AddText('Склад '+Skl+#10#10);
     PrintRep.Font.Style:=[];

     DM.QrEx.Close;
     DM.QrEx.SQL.Clear;

     DM.QrEx.SQL.Add('select a.art_code as Код_I_1400,        ');
     DM.QrEx.SQL.Add('       p.names as [Наименование '+Skl+'_S_8500],           ');
     DM.QrEx.SQL.Add('       Sum(a.kol) as [Кол-во_I_1000], ');
     DM.QrEx.SQL.Add('       Max(p.Cena) as Цена_N_1450, ');

     DM.QrEx.SQL.Add('       (select Sum(aa.kol) from ArhCheks aa (nolock), SprTov ss (nolock) ');
     DM.QrEx.SQL.Add('        where aa.kod_name=ss.kod_name and ss.art_code=a.art_code and aa.date_chek between getdate()-30 and getdate() ) as [Реализ. '+FormatDateTime('mmm.yy',Date)+'_I_1000],              ');

     DM.QrEx.SQL.Add('       (select Sum(aa.kol) from ArhCheks aa (nolock), SprTov ss (nolock) ');
     DM.QrEx.SQL.Add('        where aa.kod_name=ss.kod_name and ss.art_code=a.art_code and aa.date_chek between getdate()-61 and getdate()-31 ) as [Реализ. '+FormatDateTime('mmm.yy',Date-31)+'_I_1000],              ');

     DM.QrEx.SQL.Add('       (select Sum(ostat) from SprTov ss (nolock) where ss.art_code=a.art_code) as [Остат._I_1000],              ');

     DM.QrEx.SQL.Add('       r.p1 as [Осн._I_1000],              ');
     DM.QrEx.SQL.Add('       r.p2 as [Витр._I_1000],              ');
     DM.QrEx.SQL.Add('       r.p3 as [Скл._I_1000],               ');
     DM.QrEx.SQL.Add('       dbo.Get4Digits(a.art_code) as [Штрих- Код_S_1250]               ');
     DM.QrEx.SQL.Add('from SpisVozr a (nolock) left join Inform..SprReg r (nolock) on a.art_code=r.art_code ,');
     DM.QrEx.SQL.Add('     (select art_code,names,Max(cena) as cena from SprTov (nolock) group by art_code,names) p');
     DM.QrEx.SQL.Add('where a.art_code=p.art_code and a.art_code in (select art_code from SprVGr (nolock) where gr='+DM.Qr1.FieldByName('gr').AsString+') and ');
     DM.QrEx.SQL.Add('      a.dtvz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+''' ');
     DM.QrEx.SQL.Add('group by a.art_code,p.names,r.p1,r.p2,r.p3');
     Case TBitBtn(Sender).Tag of
      1:DM.QrEx.SQL.Add('order by 2      ');
      2:DM.QrEx.SQL.Add('order by 8,9,10      ');
     end;
//     DM.QrEx.SQL.SaveToFile('C:\SpisV.txt');
     DM.QrEx.Open;


     PrintRep.Qr:=DM.QrEx;
     PrintRep.PrintTable(False,0,0);
     if i<>DM.Qr1.RecordCount then PrintRep.AddText(#12);
    end;

   PrintRep.PreView;
{   if then
    begin
     DM.QrEx.Close;
     DM.QrEx.SQL.Text:='update SpisVozr set Closed=1 where IsNull(Closed,0)=0 and DtVZ='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Prm.VSDate)+''' ';
     DM.QrEx.ExecSQL;
    end;
 }
  except
   on E:Exception do MainF.MessBox('Ошибка формирования списка для возврата: '+E.Message);
  end;
 end;

procedure TSpisForVozrF.FormActivate(Sender: TObject);
 begin
//  if FlExit then Close;
 end;

end.
