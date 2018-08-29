unit ProvizInfoU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ComCtrls, Util, ExtCtrls, Buttons, Grids, DBGrids, ADODB;

type

  TProvizInfoF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    ComboBox2: TComboBox;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    lbNCh: TStaticText;
    lbAvgCh: TStaticText;
    lbMaxAvgCh: TStaticText;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    DBGrid2: TDBGrid;

    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private

    procedure ShowInfo;
    procedure ShowDA(Qr,Qr1:TADOQuery; P:Byte);

  public

    procedure ShowDAList(Qr,Qr1:TADOQuery);

  end;

var ProvizInfoF:TProvizInfoF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TProvizInfoF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  ComboBox2.ItemIndex:=StrToInt(FormatDateTime('mm',Date()))-1;
  ComboBox2Change(ComboBox2);
  dtEnd.Date:=Date;
  ShowInfo;
 end;

procedure TProvizInfoF.ComboBox2Change(Sender: TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    dtStart.Date:=D1;
    dtEnd.Date:=D31;
   end;
 end;

procedure TProvizInfoF.ShowInfo;
var NCh:Integer;
    AvgSm:Real;
 begin
  try
   try
    DM.Qr.Close;
    DM.Qr.SQL.Text:='select Count(distinct convert(varchar,numb_chek)+convert(varchar,id_kassa)) as NCh from ArhCheks '+#10+
                    'where date_chek between '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' and id_user='+IntToStr(Prm.UserID);
    DM.Qr.Open;
    NCh:=DM.Qr.FieldByName('NCh').AsInteger;

    DM.Qr.Close;
    DM.Qr.SQL.Text:='select (Sum(kol*cena)-IsNull(Sum(SumSkd),0))/'+IntToStr(NCh)+' as AvgSm from ArhCheks '+#10+
                    'where date_chek between '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' and id_user='+IntToStr(Prm.UserID);
    DM.Qr.Open;
    AvgSm:=DM.Qr.FieldByName('AvgSm').AsFloat;
   except
    NCh:=0;
    AvgSm:=0;
   end;

   lbAvgCh.Caption:=CurrToStrF(AvgSm,ffFixed,2)+' грн. ';
   lbNCh.Caption:=IntToStr(NCh)+' ';

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('if Object_ID(N''tempdb..#tmpch'') is not null drop table #tmpch');
   DM.Qr.SQL.Add('select a.numb_chek,a.id_kassa,Users,Sum(kol*cena)-IsNull(Sum(SumSkd),0) as SumCh ');
   DM.Qr.SQL.Add('into #tmpch                                                                                   ');
   DM.Qr.SQL.Add('from ArhCheks a, SprUser b                                                                    ');
   DM.Qr.SQL.Add('where a.id_user=b.id and date_chek between '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' ');
   DM.Qr.SQL.Add('group by numb_chek,id_kassa,users                                                             ');
   DM.Qr.SQL.Add('                                                                                              ');
   DM.Qr.SQL.Add('select top 1 Users,Sum(SumCh)/Count(numb_chek) as MaxSm                                       ');
   DM.Qr.SQL.Add('from #tmpch                                                                                   ');
   DM.Qr.SQL.Add('group by Users                                                                                ');
   DM.Qr.SQL.Add('order by 2 desc                                                                               ');
   DM.Qr.Open;
   lbMaxAvgCh.Caption:='Максимальная сумма чека '+
                       CurrToStrF(DM.Qr.FieldByName('MaxSm').AsFloat,ffFixed,2)+
                       ' грн. у пользователя '+DM.Qr.FieldByName('Users').AsString+' !';
   ShowDA(DM.qrAvt,DM.qrAvtList,1);
   ShowDA(DM.qrDop,DM.qrDopList,2);
  except
  end;
 end;

procedure TProvizInfoF.ShowDA(Qr,Qr1:TADOQuery; P:Byte);
 begin
  try
   Qr.Close;
   Qr.SQL.Clear;
   Qr.SQL.Add('select b.numb_chek,b.date_chek,c.names,c.art_code         ');
   Qr.SQL.Add('from ChArt a, ArhCheks b, SprTov c              ');
   Qr.SQL.Add('where a.art_code=c.art_code and               ');
   Qr.SQL.Add('      a.row_id_a=b.row_id and                 ');
   Qr.SQL.Add('      b.date_Chek>='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtStart.Date)+''' and  ');
   Qr.SQL.Add('      b.date_Chek<='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+''' and    ');
   Qr.SQL.Add('      b.id_user='+IntToStr(Prm.UserID)+' and a.type_map='+IntToStr(P));
   Qr.SQL.Add('group by b.numb_chek,b.date_chek,c.names,c.art_code       ');
   Qr.SQL.Add('order by 2                                    ');
   Qr.Open;
   ShowDAList(Qr,Qr1);
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к статистике: '+E.Message);
  end;
 end;

procedure TProvizInfoF.ShowDAList(Qr,Qr1:TADOQuery);
 begin
  if Qr.IsEmpty then Exit;
  try
  {
   Qr1.Close;
   Qr1.SQL.Clear;
   Qr1.SQL.Add('select c.names                                   ');
   Qr1.SQL.Add('from ArhCheks b, SprTov c, Inform..SprDop a      ');
   Qr1.SQL.Add('where b.kod_name=c.kod_name and a.art_code='+Qr.FieldByName('art_code').AsString+' and ');
   Qr1.SQL.Add('      b.id_user='+IntToStr(Prm.UserID)+' and b.numb_chek='+Qr.FieldByName('numb_chek').AsString+' and c.art_code=a.art_map ');
   Qr1.SQL.Add('group by c.names ');
   Qr1.SQL.Add('order by 1 ');
//   Qr1.SQL.SaveToFile('C:\log\Sop.txt');
   Qr1.Open;
  }
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к статистике: '+E.Message);
  end;
 end;

procedure TProvizInfoF.BitBtn1Click(Sender: TObject);
 begin
  ShowInfo;
 end;

procedure TProvizInfoF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

end.
