unit BlankKROU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, PrintReport, Menus, DB, Util;

type

  TBlankKROF = class(TForm)
    Label1:TLabel;
    cbGroup: TComboBox;
    Panel2:TPanel;
    Panel1:TPanel;
    DBGrid1:TDBGrid;
    bbMake: TBitBtn;
    bbView: TBitBtn;
    pmPrnReg: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel3: TPanel;
    bbEnd: TBitBtn;
    BitBtn2: TBitBtn;
    pn1: TPanel;
    Label7: TLabel;
    Label3: TLabel;
    Panel27: TPanel;
    StaticText1: TStaticText;
    Label2: TLabel;
    procedure FormCreate(Sender:TObject);
    procedure cbGroupChange(Sender:TObject);
    procedure bbMakeClick(Sender: TObject);
    procedure bbViewClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;  DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bbEndClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private

    procedure ShowVedList;
    procedure PrintVed(P:Byte);
    procedure DSrc1DataChange(Sender: TObject; Field: TField);

    function  MakeVedList(P:Byte):Boolean;

  public

  end;

var BlankKROF:TBlankKROF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TBlankKROF.FormCreate(Sender:TObject);
var i:Integer;
 begin
  Caption:=MFC;
  for i:=0 to cbGroup.Items.Count-1 do MakeVedList(i+1);
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='update Inform..DhVed set Done=2 where IsNull(Done,0)=1 and Time_Ved<convert(datetime,convert(varchar,getdate(),23))';
   DM.QrEx.ExecSQL;
  except
  end;
  DBGrid1.DataSource.OnDataChange:=DSrc1DataChange;
  ShowVedList;
 end;

function TBlankKROF.MakeVedList(P:Byte):Boolean;
var Cnt:Integer;
 begin
  Result:=True;
  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select Count(*) as Cnt from Inform..DhVed where Nds='+IntToStr(P);
  DM.QrEx.Open;
  Cnt:=DM.QrEx.FieldByName('Cnt').AsInteger;
  if Cnt>0 then
   begin
    DM.QrEx.Close;
    DM.QrEx.SQL.Text:='select Count(*) as Cnt from Inform..DhVed where IsNull(Done,0)=2 and Nds='+IntToStr(P);
    DM.QrEx.Open;
    if Cnt<>DM.QrEx.FieldByName('Cnt').AsInteger then Exit;
   end;
  try
   DM.ADOCo.BeginTrans;
   try
    DM.spY_MakeVedList.Close;
    DM.spY_MakeVedList.Parameters.ParamValues['@gr']:=P;
    DM.spY_MakeVedList.ExecProc;
    if DM.spY_MakeVedList.Parameters.ParamValues['@RETURN_VALUE']<>777 then Abort;
    DM.ADOCo.CommitTrans;
  except
    DM.ADOCo.RollbackTrans;
    raise;
   end;
  except
   on E:Exception do
    begin
     Result:=False;
     MainF.MessBox('Ошибка формирования списка ведомостей! '+E.Message);
    end;
  end;
 end;

procedure TBlankKROF.ShowVedList;
var ID:Integer;
 begin
  try
   ID:=-1;
   if DM.qrVedList.Active then ID:=DM.qrVedList.FieldByName('idved').AsInteger;
   DM.qrVedList.Close;
   DM.qrVedList.SQL.Clear;
   DM.qrVedList.SQL.Add('select *,RTrim(SubString(names_start,1,10))+''.. - ''+RTrim(SubString(names_end,1,10))+''..'' as Descr ');
   DM.qrVedList.SQL.Add('from Inform..DhVed v                                                                                 ');
   DM.qrVedList.SQL.Add('where v.nds='+IntToStr(cbGroup.ItemIndex+1)                                                           );
   DM.qrVedList.SQL.Add('order by Num                                                                                         ');
   DM.qrVedList.Open;
   DM.qrVedList.Locate('idved',id,[]);
  except
   MainF.MessBox('Ошибка доступа к списку Ведомостей инвентаризации!');
  end;
 end;

procedure TBlankKROF.cbGroupChange(Sender:TObject);
 begin
  ShowVedList;
 end;

procedure TBlankKROF.bbMakeClick(Sender:TObject);
 begin
  if DM.qrVedList.IsEmpty then Exit;
  if DM.qrVedList.FieldByName('Done').AsInteger=0 then
   try
    if MainF.MessBox('Вы действительно хотите сформировать ведомость?',52)<>ID_YES then Exit;

    DM.ADOCo.BeginTrans;
    try
     DM.spY_MakeVed.Close;
     DM.spY_MakeVed.Parameters.ParamValues['@idv']:=DM.qrVedList.FieldByName('idved').AsInteger;
     DM.spY_MakeVed.ExecProc;
     if DM.spY_MakeVed.Parameters.ParamValues['@RETURN_VALUE']<>777 then Abort;
     ShowVedList;
     DM.ADOCo.CommitTrans;
    except
     DM.ADOCo.RollbackTrans;
     raise;
    end;
   except
    on E:Exception do MainF.MessBox('Ошибка формирования ведомости! '+E.Message);
   end;
  bbViewClick(bbView);
 end;

procedure TBlankKROF.bbEndClick(Sender: TObject);
 begin
  if DM.qrVedList.IsEmpty then Exit;
  if DM.qrVedList.FieldByName('Done').AsInteger<>1 then Exit;
  if MainF.MessBox('Вы действительно завершить ведомость?',52)<>ID_YES then Exit;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='update Inform..DhVed set Done=2 where idved='+DM.qrVedList.FieldByName('idved').AsString;
   DM.QrEx.ExecSQL;
   ShowVedList;
  except
   on E:Exception do MainF.MessBox('Ошибка завершения ведомости! '+E.Message);
  end;
 end;

procedure TBlankKROF.PrintVed(P:Byte);
var RC:Integer;
    Tb:TTableObj;
    kol,idved,i:Integer;
    my_font:String;
    sum_itogo:Currency;

 begin
  try
   if DM.qrVedList.IsEmpty then Exit;
   if DM.qrVedList.FieldByName('Done').AsInteger<>1 then Exit;
   idved:=DM.qrVedList.FieldByName('idved').AsInteger;
   DM.Qr.Close;
   DM.Qr.SQl.Text:='select Count(*) as Cnt from Inform..DtVed where idved='+IntToStr(idved);
   DM.Qr.Open;
   RC:=DM.Qr.FieldByName('Cnt').AsInteger;
   if RC<=0 then Exit;
//   my_font:='MS Sans Serif';
   my_font:='Arial';
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Size:=6;
   PrintRep.Font.Name:=my_font;
   PrintRep.BottomMargin:=200;


   PrintRep.Align:=AL_CENTER;
   PrintRep.Font.Style:=[fsBold];

   PrintRep.Font.Size:=4;
   PrintRep.AddText(Prm.FirmNameUA+'                                                                                    Код ЕГРПОУ          24482251 '+#10);
   PrintRep.AddText('_______________                                                                                                                             '+#10);
   PrintRep.AddText('(предприятие, организация)                                                                                                                              '+#10+#10+#10+#10);

   PrintRep.Addtable(3, 1);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('1200,1200,1200');
   Tb.Cell[1,1].Font.Size:= 4;
   Tb.Cell[1,1].AddText('Инвентаризационная опись '+#10+'товарно-материальных '+#10+'ценностей ');

   Tb.Cell[2,1].Font.Size:=4;
   Tb.Cell[2,1].AddText('Дата '#10' составления '+#10+#10+'"___" ________ 20__ г '+#10+#10);

   Tb.Cell[3,1].Font.Size:=4;
   Tb.Cell[3,1].AddText('Цех (склад)'#10' _________________ ');

   PrintRep.AddText(#10#10#10#10'Лекарственные средства, изделия медицинского назначения'#10#10);
   PrintRep.AddText('(род товарно-материальных ценностей) '#10#10#10#10);

   PrintRep.Font.Size := 10;
   PrintRep.AddText('РАСПИСКА'+#10+#10);
   PrintRep.Font.Size := 5;

   PrintRep.Align := AL_JUST;
   PrintRep.AddText(#10+'К началу проведения частичной (выборочной) инвентаризации все расходные и приходные документы на ');
   PrintRep.AddText('товарно-материальные ценности сданы в бухгалтерию и все товарно-материальные ');
   PrintRep.AddText('ценности, поступившие на нашу ответственность,      оприходованы, а выбывшие  ');
   PrintRep.AddText('списаны в расход. Все денежные средства на момент переучета находятся в кассе, в сумме _____________________________________ '+#10+#10);
   PrintRep.Align := AL_LEFT;
   PrintRep.AddText('Материально ответственные лица:  '+#10+#10);

   PrintRep.Align := AL_LEFT;
   PrintRep.AddText(#10);

   PrintRep.Align := AL_CENTER;

   PrintRep.Addtable(3,11);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('1200,1200,1200');

   Tb.Cell[1,1].Font.Size:= 5;
   Tb.Cell[1,1].AddText(' Должность ');

   Tb.Cell[2,1].Font.Size:= 5;
   Tb.Cell[2,1].AddText('Ф.И.О.'+#10);

   Tb.Cell[3,1].Font.Size:= 5;
   Tb.Cell[3,1].AddText('Подпись');
   PrintRep.AddText(#10+#10);

   PrintRep.Align := AL_LEFT;
   PrintRep.AddText('В соответствии с графиком проведения инвентаризаций'#10);
   PrintRep.AddText('произведено снятие фактических остатков ценностей  '+#10+'по состоянию на '+FormatDateTime('dd.mm.yyyy hh:nn:ss',DM.qrVedList.FieldByName('Time_Ved').AsDateTime)+#10+#10+#10);
   PrintRep.AddText('Инвентаризация:              Начата     "____"__________ 20__ г. время с ____ по ____'+#10+#10);
   PrintRep.AddText('                                            Окончена   "____"__________ 20__ г. время с ____ по ____'+#10+#10);
   PrintRep.AddText('В ходе инвентаризации установлено следующее: ');

   PrintRep.AddText(#12);

   PrintRep.AddText('Сличительная ведомость от '+FormatDateTime('dd.mm.yyyy' , DM.qrVedList.FieldByName('Time_Ved').AsDateTime)+#10);
   PrintRep.AddText('подразделения '+Prm.AptekaNameRU+#10);
   PrintRep.AddText('время печати '+FormatDateTime('dd.mm.yyyy hh:nn:ss',Now)+#10#10);

   PrintRep.Font.Style:=[];
   PrintRep.Font.Size:=4;
   PrintRep.AddTable(10,RC+1);
   PrintRep.UpKolontit.Align:=AL_CENTER;
   PrintRep.UpKolontit.Font.Name:=my_font;
   PrintRep.UpKolontit.Font.Size:=3;
   PrintRep.UpKolontit.Text:='- Стр. &NumP& -';
   PrintRep.DownKolontit.Font.Size:=4;
   PrintRep.DownKolontit.Font.Name:=my_font;
   PrintRep.DownKolontit.Align:=AL_CENTER;
   PrintRep.DownKolontit.Text:='Представитель аптеки _________________________         Представитель КРО  __________________________'+#10+'ФИО               (полностью)                               ФИО               (полностью)';

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select a.art_code,Max(b.names) as names,Max(b.cena) as cena,a.ostat,Max(P1) as P1,Max(P2) as P2,Max(P3) as P3');
   DM.Qr.SQL.Add('from SprTov b, ');
   DM.Qr.SQL.Add('     Inform..DtVed a left join Inform..SprReg r on r.art_code=a.art_code');
   DM.Qr.SQL.Add('where a.art_code=b.art_code and');
   DM.Qr.SQL.Add('      a.idved='+IntToStr(idved));
   DM.Qr.SQL.Add('group by a.art_code,a.ostat');
   Case P of
    1:DM.Qr.SQL.Add('order by 2');
    2:DM.Qr.SQL.Add('order by 5,6,7');
   end;
   DM.Qr.Open;

   Tb:=PrintRep.LastTable;
   Tb.FixRows(1,1);
   Tb.SetWidths('180,180,1050,210,180,180,180,380,380,380');
   for i:=1 to 10 do
    begin
     Tb.Cell[i,1].Font.Style:=[fsBold];
     Tb.Cell[i,1].Align:=AL_CENTER;
    end;
   Tb.Cell[1,1].AddText('№ пп');
   Tb.Cell[2,1].AddText('Код');
   Tb.Cell[3,1].AddText('Наименование');
   Tb.Cell[4,1].AddText('Цена');
   Tb.Cell[5,1].AddText('Осн.');
   Tb.Cell[6,1].AddText('Витр.');
   Tb.Cell[7,1].AddText('Скл.');
   Tb.Cell[8,1].AddText('Ост.по учету');
   Tb.Cell[9,1].AddText('Ост. факт.');
   Tb.Cell[10,1].AddText('Отклонения');
   sum_itogo :=0;
   for i:=1 to RC do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     Tb.Cell[1,i+1].Align:=AL_RIGHT;
     Tb.Cell[1,i+1].AddText(IntToStr(i));

     Tb.Cell[2,i+1].Align:=AL_CENTER;
     Tb.Cell[2,i+1].AddText(DM.Qr.FieldByName('art_code').AsString);

     Tb.Cell[3,i+1].Align:=AL_LEFT;
     Tb.Cell[3,i+1].AddText(TrimRight(DM.Qr.FieldByName('names').AsString));

     Tb.Cell[4,i+1].Align:=AL_RIGHT;
     Tb.Cell[4,i+1].AddText(CurrToStrF(DM.Qr.FieldByName('cena').AsCurrency,ffFixed,2));

     Tb.Cell[5,i+1].Align:=AL_RIGHT;
     Tb.Cell[5,i+1].AddText(DM.Qr.FieldByName('P1').AsString);

     Tb.Cell[6,i+1].Align:=AL_RIGHT;
     Tb.Cell[6,i+1].AddText(DM.Qr.FieldByName('P2').AsString);

     Tb.Cell[7,i+1].Align:=AL_RIGHT;
     Tb.Cell[7,i+1].AddText(DM.Qr.FieldByName('P3').AsString);

     Tb.Cell[8,i+1].Align:=AL_RIGHT;
     Tb.Cell[8,i+1].AddText(DM.Qr.FieldByName('ostat').AsString);

     sum_itogo:=sum_itogo+(DM.Qr.FieldByName('ostat').AsCurrency * DM.Qr.FieldByName('cena').AsCurrency);
     kol:=kol+DM.Qr.FieldByName('ostat').AsInteger;
    end;

   PrintRep.Font.Size:=4;
   PrintRep.AddText(#12'Итого по описи: ');
   PrintRep.AddText(#10#10'Количество порядковых номеров: '+IntToStr(RC)+' ('+IntToWordsRU(RC,0)+')');
   PrintRep.AddText(#10#10'Количество (по учетному остатку):   '+IntToStr(kol) + ' ('+IntToWordsRU(kol,0)+')');
   PrintRep.AddText(#10#10'Сумма итого (по учетному остатку):   '+CurrToStrF(sum_itogo,ffFixed,2) + ' грн. ('+CurrToWordsRU(sum_itogo,0)+')');
   PrintRep.AddText(#10#10'Количество (по фактическому остатку): _______________________________');
   PrintRep.AddText(#10#10'Сумма итого (по фактическому остатку): _______________________________');
   PrintRep.AddText(#10#10'Сумма недостачи: ________________________________');
   PrintRep.AddText(#10#10'Сумма лишнего товара: ___________________________');
   PrintRep.AddText(#10#10#10'Обяснение '+#10);
   PrintRep.AddText('_____________________________________________________________________'#10#10);
   PrintRep.AddText('_____________________________________________________________________'#10#10);
   PrintRep.AddText('_____________________________________________________________________'#10#10);
   PrintRep.AddText('_____________________________________________________________________'#10#10);
   PrintRep.AddText('_____________________________________________________________________'#10#10);
   PrintRep.AddText('Заявление '+#10#10+'Просим сумму недостачи удержать из зароботной платы всех членов трудового коллектива ');
   PrintRep.AddText('в равных долях. (В случае несогласия - обязательная служебная записка с указанием виновных лиц.)'+#10#10);
   PrintRep.AddText('Подписи : '#10#10);
   PrintRep.AddText('( ___________________________ (Ф.И.О.) )'#10#10);
   PrintRep.AddText('( ___________________________ (Ф.И.О.) )'#10#10);
   PrintRep.AddText('( ___________________________ (Ф.И.О.) )'#10#10);
   PrintRep.AddText('( ___________________________ (Ф.И.О.) )'#10#10);
   PrintRep.AddText('( ___________________________ (Ф.И.О.) )'#10#10);
   PrintRep.AddText(#12);

   PrintRep.Align:=AL_JUST;
   PrintRep.AddText(#10+#10+'Все ценности, поименованные в настоящей Сличительной ведомости с N _____ по N _____, проверены  в натуре в моем (нашем) присутствии и внесены в опись, ');
   PrintRep.AddText('в связи с чем претензий к представителям КРО  не имею (не имеем). Ценности, перечисленные в описи, находятся на моем (нашем) ответственном хранении ');
   PrintRep.AddText('на сумму ____________________________________________'+#10+#10+#10);

   PrintRep.Align:=AL_LEFT;
   PrintRep.AddText('Материально ответственные лица:'#10#10);
   PrintRep.AddText('Представители аптеки: _______________________'#10#10);
   PrintRep.AddText('( ___________________________ (Ф.И.О.) )'#10#10);
   PrintRep.AddText('( ___________________________ (Ф.И.О.) )'#10#10);
   PrintRep.AddText('( ___________________________ (Ф.И.О.) )'#10#10);

   PrintRep.AddText('" ___ " _____________________ 20__ г.'+#10+#10);
   PrintRep.AddText(#10#10'Представитли КРО: ');
   PrintRep.AddText(#10#10#10'Указанные в настоящей описи данные и подсчеты проверил '+#10#10);
   PrintRep.AddText('                                            _______________   ___________________   _________________');
   PrintRep.AddText('                                                                                                           (должность)                 (подпись)                              (ФИО)'+#10+#10);
   PrintRep.AddText('                                            _______________   ___________________   _________________');
   PrintRep.AddText('                                                                                                           (должность)                 (подпись)                              (ФИО)'+#10+#10);
   PrintRep.AddText('                                            _______________   ___________________   _________________');
   PrintRep.AddText('                                                                                                           (должность)                 (подпись)                              (ФИО)'+#10+#10);
   PrintRep.AddText('" ___ " _____________________ 20__ г.'+#10+#10+#10+#10);

   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования списка по ведомости! '+E.Message);
  end;
 end;


procedure TBlankKROF.bbViewClick(Sender:TObject);
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

procedure TBlankKROF.N1Click(Sender: TObject);
 begin
  if Sender=nil then Exit;
  PrintVed(TControl(Sender).Tag);
 end;

procedure TBlankKROF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  Case db.DataSource.DataSet.FieldByName('Done').AsInteger of
   0:db.Canvas.Font.Color:=clGray;
   1:db.Canvas.Brush.Color:=clYellow;
   2:db.Canvas.Brush.Color:=clLime;
  end;

  if (gdSelected in State) then
   begin
    db.Canvas.Font.Color:=clWhite;
    db.Canvas.Brush.Color:=clNavy;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure TBlankKROF.DSrc1DataChange(Sender:TObject; Field:TField);
var D:Integer;
 begin
  D:=TDataSource(Sender).DataSet.FieldByName('Done').AsInteger;
  bbView.Visible:=False;
  bbMake.Visible:=False;
  bbEnd.Visible:=False;
  Case D of
   0:bbMake.Visible:=True;
   1:begin
      bbView.Visible:=True;
      bbEnd.Visible:=True;
     end;
  end;
 end;

procedure TBlankKROF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

end.
