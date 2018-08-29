unit SumZPerU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, ComCtrls, Util, ADODB,
  DBGrids, EKKAU;

type
  TSumZPerF = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    lbSumB: TLabel;
    lbSumK: TLabel;
    lbRazn: TLabel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lbKass: TLabel;
    Label8: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    bbDays: TBitBtn;
    cbKass: TComboBox;
    ComboBox2: TComboBox;
    Panel3: TPanel;
    bbPeriod: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bbPeriodClick(Sender: TObject);
    procedure bbDaysClick(Sender: TObject);
    procedure cbKassChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private

    procedure Calc(B:Boolean);
    procedure RefreshKassList;
    procedure FilterSumZRep(K:Integer);

  public

  end;

var SumZPerF:TSumZPerF;

procedure ShowSumZPer;

implementation

uses MainU, DataModuleU, SumZU, Marry301U;

{$R *.dfm}

procedure ShowSumZPer;
 begin
  try
   if SumZPerF=Nil then SumZPerF:=TSumZPerF.Create(nil);
   Application.ProcessMessages;
   SumZPerF.ShowModal;
  except
   SumZPerF:=nil;
   MainF.MessBox(ER_CR_FORM);
  end;
 end;

procedure TSumZPerF.RefreshKassList;
var i:Integer;
 begin
  DM.Qr.Close;
  DM.Qr.SQL.Text:='select id_kassa from ##SumZRep where id_user='+IntToStr(Prm.UserID)+' group by id_kassa order by id_kassa';
  DM.Qr.Open;
  cbKass.Clear;
  for i:=1 to DM.Qr.RecordCount do
   begin
    if i=1 then DM.Qr.First else DM.Qr.Next;
    cbKass.Items.Add(DM.Qr.FieldByName('id_kassa').AsString);
   end;
  cbKass.ItemIndex:=0;
 end;

procedure TSumZPerF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  ComboBox2.ItemIndex:=StrToInt(FormatDateTime('mm',Date()))-1;
  ComboBox2Change(ComboBox2);
  dtEnd.Date:=Date-1;
 end;

procedure TSumZPerF.ComboBox2Change(Sender: TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    dtStart.Date:=D1;
    dtEnd.Date:=D31;
   end;
 end;

procedure TSumZPerF.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TSumZPerF.FilterSumZRep(K:Integer);
 begin
  DM.qrSumZRep.Close;
  DM.qrSumZRep.SQL.Clear;
  DM.Qr.Close;
  if K=0 then
   begin
    DM.qrSumZRep.SQL.Add('select ''Касса ''+convert(varchar(5),id_kassa) as Descr, ');
    DM.qrSumZRep.SQL.Add('       Sum(SumB) as SumB,                                ');
    DM.qrSumZRep.SQL.Add('       Sum(SumK) as SumK,                                ');
    DM.qrSumZRep.SQL.Add('       Sum(SumB)-Sum(SumK) as Razn                       ');
    DM.qrSumZRep.SQL.Add('from ##SumZRep                                           ');
    DM.qrSumZRep.SQL.Add('where id_user='+IntToStr(Prm.UserID)                      );
    DM.qrSumZRep.SQL.Add('group by id_kassa                                        ');
    DM.qrSumZRep.SQL.Add('order by id_kassa                                        ');
    DM.Qr.SQL.Text:='select Sum(SumB) as SumB,Sum(SumK) as SumK from ##SumZRep where id_user='+IntToStr(Prm.UserID);
   end else begin
             DM.qrSumZRep.SQL.Add('select convert(varchar(50),datez,104) as Descr, ');
             DM.qrSumZRep.SQL.Add('       Sum(SumB) as SumB,          ');
             DM.qrSumZRep.SQL.Add('       Sum(SumK) as SumK,          ');
             DM.qrSumZRep.SQL.Add('       Sum(SumB)-Sum(SumK) as Razn ');
             DM.qrSumZRep.SQL.Add('from ##SumZRep                     ');
             DM.qrSumZRep.SQL.Add('where id_user='+IntToStr(Prm.UserID));
             DM.qrSumZRep.SQL.Add('      and id_kassa='+IntToStr(K)    );
             DM.qrSumZRep.SQL.Add('group by DateZ                     ');
             DM.qrSumZRep.SQL.Add('order by DateZ                     ');
             DM.Qr.SQL.Text:='select Sum(SumB) as SumB,Sum(SumK) as SumK from ##SumZRep where id_user='+IntToStr(Prm.UserID)+
                             ' and id_kassa='+IntToStr(K);
            end;
  DM.qrSumZRep.Open;
  DM.Qr.Open;
  lbSumB.Caption:=CurrToStrF(DM.Qr.FieldByName('SumB').AsFloat,ffFixed,2);
  lbSumK.Caption:=CurrToStrF(DM.Qr.FieldByName('SumK').AsFloat,ffFixed,2);
  lbRazn.Caption:=CurrToStrF(DM.Qr.FieldByName('SumB').AsFloat-DM.Qr.FieldByName('SumK').AsFloat,ffFixed,2);
  if Abs(StrToCurr(lbRazn.Caption))>0.15 then lbRazn.Font.Color:=clRed
                                         else lbRazn.Font.Color:=clBlue;
 end;

procedure TSumZPerF.Calc(B:Boolean);
 begin
  try
   DM.spY_SumZRep.Close;
   if (dtStart.Date<Date-xM) and (Prm.UserRole<>R_ADMIN) then
    begin
     dtStart.Date:=StrToDate(DateToStr(Date-xM));
     MainF.MessBox('Вы не можете выбрать дату меньше чем '+DateToStr(Date-xM));
     Exit;
    end; 

   DM.spY_SumZRep.Parameters.ParamValues['@pdt1']:=StrToDateTime(DateToStr(dtStart.Date-1)+' 23:59:59');;
   DM.spY_SumZRep.Parameters.ParamValues['@pdt2']:=StrToDateTime(DateToStr(dtEnd.Date)+' 23:59:59');
   DM.spY_SumZRep.Parameters.ParamValues['@param']:=0;
   DM.spY_SumZRep.Parameters.ParamValues['@piduser']:=Prm.UserID;

   try
    if MainF.Design then Abort;
    if Not EKKA.fpCashState(0) then Abort;
    DM.spY_SumZRep.Parameters.ParamValues['@idkassa']:=Opt.KassaID;
    DM.spY_SumZRep.Parameters.ParamValues['@sum']:=StrToInt(EKKA.RD_Item[3])*0.01+
                                                   StrToInt(EKKA.RD_Item[6])*0.01-
                                                   StrToInt(EKKA.RD_Item[4])*0.01-
                                                   StrToInt(EKKA.RD_Item[7])*0.01;
   except
    DM.spY_SumZRep.Parameters.ParamValues['@idkassa']:=0;
    DM.spY_SumZRep.Parameters.ParamValues['@sum']:=0;
   end;

   DM.spY_SumZRep.ExecProc;
   if DM.spY_SumZRep.Parameters.ParamValues['@RETURN_VALUE']<>1 then Abort;

   lbKass.Enabled:=Not B;
   cbKass.Enabled:=Not B;
   RefreshKassList;
   if B then FilterSumZRep(0) else FilterSumZRep(cbKass.ItemIndex+1);
  except
   MainF.MessBox('Ошибка расчета сумм по Z-отчетам!');
  end;
 end;

procedure TSumZPerF.bbPeriodClick(Sender:TObject);
 begin
  Calc(True);
 end;

procedure TSumZPerF.bbDaysClick(Sender:TObject);
 begin
  Calc(False);
 end;

procedure TSumZPerF.cbKassChange(Sender:TObject);
 begin
  try
   if cbKass.Text<>'' then
    FilterSumZRep(StrToInt(cbKass.Text));
  except
   MainF.MessBox('Ошибка расчета сумм по Z-отчетам!');
  end;
 end;

procedure TSumZPerF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=Nil then Exit;
  db:=TDBGrid(Sender);
  if DataCol=3 then
   begin
    if Abs(db.DataSource.DataSet.FieldByName('Razn').AsFloat)>0.1 then
     db.Canvas.Font.Color:=clRed
    else
     db.Canvas.Font.Color:=clBlue;
   end;
  if gdSelected in State then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure TSumZPerF.FormActivate(Sender: TObject);
 begin
  BitBtn2.Visible:=Prm.ID_Gamma=1;
  ComboBOx1.Visible:=Prm.ID_Gamma=1;
  Edit1.Visible:=Prm.ID_Gamma=1;
 end;

procedure TSumZPerF.BitBtn2Click(Sender:TObject);
var i,Kol,AC,ID_Kassa,NCh,Cnt:Integer;
    B:Boolean;
    ArtS:String;
    Nm:String;
    Cena:Currency;
    Dt:TDateTime;
    QrToOff:TADOQuery;

 begin
  if DM.qrSumZRep.IsEmpty then Exit;
  if DM.qrSumZRep.FieldByName('Razn').AsFloat=0 then Exit;
  if cbKass.ItemIndex=-1 then Exit;
  ID_Kassa:=StrToInt(cbKass.Text);
  Dt:=DM.qrSumZRep.FieldByName('Descr').AsDateTime;
  B:=False;
  if (Abs(DM.qrSumZRep.FieldByName('Razn').AsFloat-DM.qrSumZRep.FieldByName('Razn').AsInteger)<0.7 ) and (DM.qrSumZRep.FieldByName('Razn').AsInteger mod 20=0) then
   begin
    AC:=17485;
    Nm:='Кодтерпин IC табл. №10 "ИнтерХим"Одесса';
    Cena:=20;
    Kol:=Abs(DM.qrSumZRep.FieldByName('Razn').AsInteger div 20);
    DM.QrEx.Close;
    DM.QrEx.SQL.Clear;
    DM.QrEx.SQL.Add('select Sum(ostat) as Cnt from SprTov where art_code='+IntToStr(AC));
    DM.QrEx.Open;
    if DM.QrEx.FieldByName('cnt').AsInteger>=Kol then B:=True;
   end;

  if B=False then
   begin
    Kol:=1;
    DM.QrEx.Close;
    DM.QrEx.SQL.Clear;
    DM.QrEx.SQL.Add('declare @cn numeric(8,2)');
    DM.QrEx.SQL.Add('set @cn=Abs('+DM.qrSumZRep.FieldByName('Razn').AsString+') ');
    if Edit1.Text<>'' then ArtS:='art_code='+Edit1.Text+' and ' else ArtS:='';
    DM.QrEx.SQL.Add('select top 1 art_code,f_nds,names,cena,Sum(ostat) from SprTov where '+ArtS+' ostat>0 and f_nds='+ComboBox1.Text+' and cena between @cn-0.15 and @cn+0.15 group by art_code,f_nds,names,cena order by Abs(@cn-cena) ');
    DM.QrEx.Open;
    if DM.QrEx.IsEmpty then
     begin
      MainF.MessBox('Позиция для пробивки не подобрана!');
      Exit;
     end;
    AC:=DM.QrEx.FieldByName('Art_code').AsInteger;
    Nm:=DM.QrEx.FieldByName('Names').AsString;
    Cena:=DM.QrEx.FieldByName('Cena').AsCurrency;
   end;
  if MainF.MessBox('Будет пробит: '+IntToStr(Kol)+' "'+Nm+'" за '+CurrToStrF(Cena,ffFixed,2),52)<>ID_YES then Exit;

  DM.ADOCo.BeginTrans;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('select IsNull((select Min(numb_chek) from ArhCheks where numb_chek<0 and id_kassa='+IntToStr(ID_Kassa)+'),0)-1 as numb_chek');
   DM.QrEx.Open;
   NCh:=DM.QrEx.FieldByName('numb_chek').AsInteger;

   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('declare @idu int, @nch int, @vzh bigint');
   DM.QrEx.SQL.Add('set @nch=IsNull((select Min(numb_chek) from ArhCheks where numb_chek<0 and id_kassa='+IntToStr(ID_Kassa)+'),0)-1');
   DM.QrEx.SQL.Add('set @vzh=IsNull((select top 1 vzh from ArhCheks where date_chek>='''+FormatDateTime('yyyy-mm-dd',Dt)+''' and id_kassa='+IntToStr(ID_Kassa)+'),0)-1');
   DM.QrEx.SQL.Add('set @idu=(select top 1 id_user from ArhCheks a where a.id_kassa='+IntToStr(ID_Kassa)+' and a.date_chek>'''+FormatDateTime('yyyy-mm-dd hh:nn:ss',Dt)+''' order by date_Chek) ');
   DM.QrEx.SQL.Add('exec spY_EnterKol '+IntToStr(AC)+','+IntToStr(Kol)+',@idu,1,'+IntToStr(AC)+',0,1');
   DM.QrEx.SQL.Add('exec spY_WriteChek @idu,'+IntToStr(NCh)+',0,'+IntToStr(ID_Kassa)+',@vzh,'''+FormatDateTime('yyyy-mm-dd',Dt)+' '+FormatDateTime('hh:nn:ss',Time)+''',200,'''',0,0');
   DM.QrEx.Open;

   if DM.QrEx.FieldByName('Res').AsInteger<>1 then raise Eabort.Create('Ошибка пробивки чека!');
   DM.ADOCo.CommitTrans;

  except
   on E:Exception do
    begin
     DM.ADOCo.RollbackTrans;
     MainF.MessBox(E.Message);
    end;
  end;
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('select       ');
   DM.QrEx.SQL.Add('a.row_id,      ');
   DM.QrEx.SQL.Add('convert(varchar(50),a.date_chek,4)+'' ''+convert(varchar(50),a.date_chek,8) as date_chek, ');
   DM.QrEx.SQL.Add('a.numb_chek,             ');
   DM.QrEx.SQL.Add('b.art_code,              ');
   DM.QrEx.SQL.Add('a.kod_name,              ');
   DM.QrEx.SQL.Add('a.kol,                   ');
   DM.QrEx.SQL.Add('a.cena,                  ');
   DM.QrEx.SQL.Add('IsNull(a.SKD,0) as Skd,  ');
   DM.QrEx.SQL.Add('convert(numeric(10,2),a.SumSkd) as Sum_Skd, ');
   DM.QrEx.SQL.Add('a.NumCard,        ');
   DM.QrEx.SQL.Add('a.kassa_num,      ');
   DM.QrEx.SQL.Add('a.id_kassa,       ');
   DM.QrEx.SQL.Add('a.id_user,        ');
   DM.QrEx.SQL.Add('b.id_part,        ');
   DM.QrEx.SQL.Add('a.vzh,             ');
   DM.QrEx.SQL.Add('a.date_chek as dt, ');
   DM.QrEx.SQL.Add('(select top 1 id_gamma from SprUser s where id=a.id_user ) as id_gamma ');
   DM.QrEx.SQL.Add('from ArhCheks a, SprTov b ');
   DM.QrEx.SQL.Add('where a.kod_name=b.kod_name and a.numb_Chek='+IntToStr(NCh)+' and a.id_kassa='+IntToStr(ID_Kassa));
   DM.QrEx.Open;

   if DM.QrEx.IsEmpty then
    begin
     MainF.MessBox('Чек по аптечной базе не пробит!');
     Exit;
    end;

   try
    QrToOff:=TADOQuery.Create(nil);
    try
     QrToOff.ConnectionString:=Prm.ConstrDB;
     QrToOff.CommandTimeout:=600;
     QrToOff.Close;
     Cnt:=DM.QrEx.RecordCount;
     for i:=1 to DM.QrEx.RecordCount do
      begin
       if i=1 then DM.QrEx.First else DM.QrEx.Next;
       QrToOff.Close;
       QrToOff.SQL.Clear;

       QrToOff.SQL.Add('insert into ekka_net..Arh_All(row_id,KOD_NAME,KOL,CENA,KASSA_NUM,ID_KASSA,ID_APTEKA,id_user,dt,dt_date,numb_chek,skd,numcard,id_part,sumskd,art_code,vzh,id_employee) values(');
       QrToOff.SQL.Add(DM.QrEx.FieldByName('row_id').AsString+',');
       QrToOff.SQL.Add(DM.QrEx.FieldByName('kod_name').AsString+',');
       QrToOff.SQL.Add(DM.QrEx.FieldByName('kol').AsString+',');
       QrToOff.SQL.Add(DM.QrEx.FieldByName('cena').AsString+',');
       QrToOff.SQL.Add(DM.QrEx.FieldByName('kassa_num').AsString+',');
       QrToOff.SQL.Add(DM.QrEx.FieldByName('id_kassa').AsString+',');
       QrToOff.SQL.Add(IntToStr(Prm.AptekaID)+',');
       QrToOff.SQL.Add(DM.QrEx.FieldByName('id_user').AsString+',');
       QrToOff.SQL.Add(''''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DM.QrEx.FieldByName('dt').AsDateTime)+''',');
       QrToOff.SQL.Add(''''+FormatDateTime('yyyy-mm-dd',DM.QrEx.FieldByName('dt').AsDateTime)+''',');

       QrToOff.SQL.Add(DM.QrEx.FieldByName('numb_Chek').AsString+',');
       QrToOff.SQL.Add(DM.QrEx.FieldByName('skd').AsString+',');
       QrToOff.SQL.Add(DM.QrEx.FieldByName('numcard').AsString+',');
       QrToOff.SQL.Add(''''+DM.QrEx.FieldByName('id_part').AsString+''',');
       QrToOff.SQL.Add(DM.QrEx.FieldByName('Sum_Skd').AsString+',');
       QrToOff.SQL.Add(DM.QrEx.FieldByName('art_code').AsString+',');
       QrToOff.SQL.Add(DM.QrEx.FieldByName('vzh').AsString+',');
       QrToOff.SQL.Add(DM.QrEx.FieldByName('id_gamma').AsString+')');
       QrToOff.ExecSQL;
      end;

     QrToOff.Close;
     QrToOff.SQL.Text:='select Count(*) as Cnt from ekka_net..arh_all where id_apteka='+IntToStr(Prm.AptekaID)+' and numb_chek='+IntToStr(NCh)+' and id_kassa='+IntToStr(ID_Kassa);
     QrToOff.Open;

     if QrToOff.FieldByName('Cnt').AsInteger=0 then MainF.MessBox('Не удалось записать чек в Arh_All!') else
     if QrToOff.FieldByName('Cnt').AsInteger<>Cnt then MainF.MessBox('Чек записан в Arh_All неполностью!') else MainF.MessBox('Чек записан в Arh_All!',64);

    finally
     QrToOff.Free;
    end;
   except
   on E:Exception do
    begin
     MainF.MessBox('Не удалось записать чек в Arh_All: '+E.Message);
    end;
   end;

 end;

Initialization

Finalization

 if SumZPerF<>nil then SumZPerF.Free;

end.

var
    i:Integer;
 begin
  try
   QrToOff:=TADOQuery.Create(nil);
   try
    QrToOff.ConnectionString:=Opt.ConStrMess;
    QrToOff.CommandTimeout:=600;
    QrToOff.Close;

    DM.QrEx1.Close;
    DM.QrEx1.SQL.Text:='select * from ScanNakl where IsNull(Closed,0)=1 and nn_postav='''+Edit1.Text+''' and flag='+IntToStr(Flag)+' and date_nakl='''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'' ';
    DM.QrEx1.Open;

    for i:=1 to DM.QrEx1.RecordCount do
     begin
      if i=1 then DM.QrEx1.First else DM.QrEx1.Next;

      QrToOff.SQL.Clear;
      QrToOff.SQL.Add('insert into ekka_net..water_all(id_postav,nn_postav,art_code,kol,date_nakl,id_user,id_apteka,dtscan) values(');
      QrToOff.SQL.Add(''''+DM.QrEx1.FieldByName('id_postav').AsString+''',');
      QrToOff.SQL.Add(''''+DM.QrEx1.FieldByName('nn_postav').AsString+''',');

      QrToOff.SQL.Add(DM.QrEx1.FieldByName('art_code').AsString+',');
      QrToOff.SQL.Add(DM.QrEx1.FieldByName('kolscan').AsString+',');
      QrToOff.SQL.Add(''''+FormatDateTime('yyyy-mm-dd',DM.QrEx1.FieldByName('date_nakl').AsDateTime)+' 00:00:00'',');
      QrToOff.SQL.Add(DM.QrEx1.FieldByName('id_user').AsString+',');
      QrToOff.SQL.Add(IntToStr(Prm.AptekaID)+',');
      QrToOff.SQL.Add(''''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DM.QrEx1.FieldByName('dtscan').AsDateTime)+''')');
      QrToOff.ExecSQL;
     end;
   finally
    QrToOff.Free;
   end;


