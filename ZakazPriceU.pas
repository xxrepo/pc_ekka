unit ZakazPriceU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ADODB, Util, DB, Grids, DBGrids, DateUtils;

type
  TZakazPriceF = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Edit3: TEdit;
    BitBtn2: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift:TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);

  private

    procedure FindInPrice;
    procedure FilterSpis;

    function  SendNaklToOffice:Boolean;

  public

  end;

var ZakazPriceF:TZakazPriceF;

implementation

uses MainU, DataModuleU, Pilot2U;

{$R *.dfm}

procedure TZakazPriceF.FindInPrice;
var S:String;
 begin
  if Length(Edit1.Text)<5 then
   begin
    MainF.MessBox('Слишком короткая строка для поиска!');
    Edit1.SetFocus;
    Exit;
   end;

  try
   DM.QrToOff.Close;
   DM.QrToOff.Connection:=DM.ADOCo;

   DM.QrToOff.SQL.Clear;

   if RadioButton3.Checked then
    begin
     DM.QrToOff.SQL.Add('exec ['+Prm.ServerS2014+'].datafromapteks.dbo.spY_FindInPrice ''%'+CorrSQLString(Edit1.Text)+'%'', ''%'+CorrSQLString(Edit3.Text)+'%'', ''%'+CorrSQLString(Edit2.Text)+'%'' ');
    end;
   DM.QrToOff.Open;
   if DM.QrToOff.IsEmpty then MainF.MessBox('По вашему запросу ничего не найдено!');
  except
   on E:Exception do
    if Pos('[DBNETLIB][ConnectionOpen(Connect()).]SQL',E.Message)>0 then MainF.MessBox('Нет связи с сервером данных!')
                                                                    else MainF.MessBox('Ошибка поиска: '+E.Message);
  end;
 end;

procedure TZakazPriceF.FilterSpis;
var S:String;
 begin
  try
   if DM.qrZakazPrice.Active then S:=DM.qrZakazPrice.FieldbyName('Names').AsString;
   DM.qrZakazPrice.Close;
   DM.qrZakazPrice.SQL.Text:='select * from ZakazPrice (nolock) where IsNull(Closed,0)=0 order by Names';
   DM.qrZakazPrice.Open;
   DM.qrZakazPrice.Locate('Names',S,[]);
  except
   on E:Exception do MainF.MessBox('Ошибка добавления позиции в заказ: '+E.Message);
  end;
 end;

procedure TZakazPriceF.BitBtn1Click(Sender:TObject);
 begin
  FindInPrice;
 end;

procedure TZakazPriceF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  FilterSpis;
 end;

procedure TZakazPriceF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TZakazPriceF.BitBtn3Click(Sender:TObject);
var Kol:Integer;
    AC,id_zam:Integer;
 begin
  if DM.QrToOff.IsEmpty then Exit;
  AC:=DM.QrToOff.FieldByName('Art_Code').AsInteger;
  Kol:=MainF.GetKolFromDialog(DM.QrToOff.FieldByName('Names').AsString,1,AC,id_zam,EN_SIMPLE);
  if Kol<1 then Exit;
  try
   DM.QrEx1.Close;
   DM.QrEx1.SQL.Clear;
   DM.QrEx1.SQL.Add('declare @kol int');
   DM.QrEx1.SQL.Add('set @kol=IsNull((select Sum(kol) from ZakazPrice (nolock) where IsNull(Closed,0)=0 and morion='+IntToStr(DM.QrToOff.FieldByName('codemorion').AsInteger)+' and ');
   DM.QrEx1.SQL.Add('art_code='+IntToStr(DM.QrToOff.FieldByName('Art_Code').AsInteger)+' and ');
   DM.QrEx1.SQL.Add('names='''+DM.QrToOff.FieldByName('names').AsString+''' and ');
   DM.QrEx1.SQL.Add('producer='''+DM.QrToOff.FieldByName('producer').AsString+''' ),0) ');

   DM.QrEx1.SQL.Add('declare @InSklad smallint set @InSklad=0');

   DM.QrEx1.SQL.Add(' if  '+IntToStr(DM.QrToOff.FieldByName('ost').AsInteger)+'>@kol+'+IntToStr(Kol)+' set @InSklad=1 ');
   DM.QrEx1.SQL.Add('if @kol>0 ');
   DM.QrEx1.SQL.Add(' delete from ZakazPrice where IsNull(Closed,0)=0 and morion='+IntToStr(DM.QrToOff.FieldByName('codemorion').AsInteger)+' and ');
   DM.QrEx1.SQL.Add('                              art_code='+IntToStr(DM.QrToOff.FieldByName('Art_Code').AsInteger)+' and ');
   DM.QrEx1.SQL.Add('                              names='''+DM.QrToOff.FieldByName('names').AsString+''' and ');
   DM.QrEx1.SQL.Add('                              producer='''+DM.QrToOff.FieldByName('producer').AsString+''' ');

   DM.QrEx1.SQL.Add('insert into ZakazPrice(art_code,morion,names,producer,InSklad,kol) values(');
   DM.QrEx1.SQL.Add(IntToStr(DM.QrToOff.FieldByName('Art_Code').AsInteger)+',');
   DM.QrEx1.SQL.Add(IntToStr(DM.QrToOff.FieldByName('codemorion').AsInteger)+',');
   DM.QrEx1.SQL.Add(''''+DM.QrToOff.FieldByName('Names').AsString+''',');
   DM.QrEx1.SQL.Add(''''+DM.QrToOff.FieldByName('Producer').AsString+''',');
   DM.QrEx1.SQL.Add('@InSklad,');
   DM.QrEx1.SQL.Add(IntToStr(Kol)+'+@kol)');

   DM.QrEx1.SQL.Add('select @InSklad as InSklad');
//     DM.QrEx1.SQL.SaveToFile('C:\Log\Zk.txt');

   DM.QrEx1.Open;

   if DM.QrEx1.FieldByName('InSklad').AsInteger=1 then
    MainF.MessBox('Препарат "'+DM.QrToOff.FieldByName('Names').AsString+'" в необходимом количестве есть на складе, и поэтому он будет заказан через заявку автоматически!');

   FilterSpis;
  except
   on E:Exception do MainF.MessBox('Ошибка добавления позиции в заказ: '+E.Message);
  end;
 end;

procedure TZakazPriceF.DBGrid1DblClick(Sender: TObject);
 begin
  BitBtn3Click(BitBtn3);
 end;

procedure TZakazPriceF.DBGrid1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key=VK_RETURN then BitBtn3Click(BitBtn3);
 end;

procedure TZakazPriceF.BitBtn4Click(Sender: TObject);
 begin
  if DM.qrZakazPrice.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите очистить заказ?',52)<>ID_YES then Exit;
  try
   DM.QrEx1.Close;
   DM.QrEx1.SQL.Text:='delete from ZakazPrice where IsNull(Closed,0)=0';
   DM.QrEx1.ExecSQL;
   FilterSpis;
  except
   on E:Exception do MainF.MessBox('Ошибка очистки заказа: '+E.Message);
  end;
 end;

procedure TZakazPriceF.BitBtn5Click(Sender: TObject);
 begin
  try
   DM.QrEx1.Close;
   DM.QrEx1.SQL.Clear;
   DM.QrEx1.SQL.Add(' delete from ZakazPrice where IsNull(Closed,0)=0 and morion='+IntToStr(DM.qrZakazPrice.FieldByName('morion').AsInteger)+' and ');
   DM.QrEx1.SQL.Add('                              art_code='+IntToStr(DM.qrZakazPrice.FieldByName('art_code').AsInteger)+' and ');
   DM.QrEx1.SQL.Add('                              names='''+DM.qrZakazPrice.FieldByName('names').AsString+''' and ');
   DM.QrEx1.SQL.Add('                              producer='''+DM.qrZakazPrice.FieldByName('producer').AsString+''' ');
   DM.QrEx1.ExecSQL;
   FilterSpis;
  except
   on E:Exception do MainF.MessBox('Ошибка удаления позиции из заказа: '+E.Message);
  end;
 end;

function TZakazPriceF.SendNaklToOffice:Boolean;
var QrToOff:TADOQuery;
    i:Integer;
 begin
  try
   QrToOff:=TADOQuery.Create(nil);
   try
    QrToOff.ConnectionString:=Prm.ConStrDB;
    QrToOff.CommandTimeout:=600;
    QrToOff.Close;

    DM.QrEx1.Close;
    DM.QrEx1.SQL.Clear;
    DM.QrEx1.SQL.Add('declare @dt datetime');
    DM.QrEx1.SQL.Add('set @dt=(select Max(dt) from ZakazPrice (nolock) where IsNull(Closed,0)=1 and id_user='+IntToStr(Prm.UserID)+')');
    DM.QrEx1.SQL.Add('select * from ZakazPrice where IsNull(Closed,0)=1 and id_user='+IntToStr(Prm.UserID)+' and dt=@dt');
    DM.QrEx1.Open;

    QrToOff.SQL.Clear;
    for i:=1 to DM.QrEx1.RecordCount do
     begin
      if i=1 then DM.QrEx1.First else DM.QrEx1.Next;
      QrToOff.SQL.Add('insert into ekka_net..ZakazPrice_All(dt,art_code,morion,names,producer,cena,InSklad,kol,id_user,id_apteka) values(');
      QrToOff.SQL.Add(''''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DM.QrEx1.FieldByName('dt').AsDateTime)+''',');
      QrToOff.SQL.Add(IntToStr(DM.QrEx1.FieldByName('Art_Code').AsInteger)+',');
      QrToOff.SQL.Add(IntToStr(DM.QrEx1.FieldByName('morion').AsInteger)+',');
      QrToOff.SQL.Add(''''+DM.QrEx1.FieldByName('Names').AsString+''',');
      QrToOff.SQL.Add(''''+DM.QrEx1.FieldByName('Producer').AsString+''',');
      QrToOff.SQL.Add(DM.QrEx1.FieldByName('Cena').AsString+',');
      QrToOff.SQL.Add(DM.QrEx1.FieldByName('InSklad').AsString+',');
      QrToOff.SQL.Add(DM.QrEx1.FieldByName('Kol').AsString+',');
      QrToOff.SQL.Add(DM.QrEx1.FieldByName('id_user').AsString+',');
      QrToOff.SQL.Add(IntToStr(Prm.AptekaID)+')');
     end;
    QrToOff.ExecSQL;
   finally
    QrToOff.Free;
   end;
   Result:=True;
  except
   Result:=False;
  end;
 end;

procedure TZakazPriceF.BitBtn6Click(Sender: TObject);
 begin
  if DM.qrZakazPrice.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите сформировать заказ?',52)<>ID_YES then Exit;
  try
   DM.QrEx1.Close;
   DM.QrEx1.SQL.Clear;
   DM.QrEx1.SQL.Add('insert into Zakaz(art_code,names,ostat,realiz,realiz_period,zakaz,realizDay,type_tov,f_nds,date_zakaz,CountDay,plist,zakaz_old,zakaz_old1,SPS,SummaDay,otkaz,koef_otp,upak_otp,zakaz_tochno,zakazauto,fswitch,insklad) ');
   DM.QrEx1.SQL.Add('select art_code,names,0,0,0,kol,0,0,0,convert(varchar,getdate(),23),10,0,0,0,0,0,0,1,1,0,0,1,1                                                                                                                  ');
   DM.QrEx1.SQL.Add('from ZakazPrice (nolock) where IsNull(Closed,0)=0 and IsNull(InSklad,0)=1 and art_code not in (select art_code from Zakaz (nolock) where date_zakaz=convert(varchar,getdate(),23) and IsNull(InSklad,0)=0)    ');

   DM.QrEx1.SQL.Add('update ZakazPrice set Closed=1, dt=getdate(),id_user='+IntToStr(Prm.UserID)+' where IsNull(Closed,0)=0');


   DM.QrEx1.ExecSQL;
   FilterSpis;
   if SendNaklToOffice then MainF.MessBox('Заказ сформирован успешно!',64)
                       else MainF.MessBox('Заказ сформирован успешно, но в офис данные отправлены не были!'#10'Теперь данные попадут в офис на следующий день');
  except
   on E:Exception do MainF.MessBox('Ошибка очистки заказа: '+E.Message);
  end;
 end;

procedure TZakazPriceF.BitBtn7Click(Sender: TObject);
 begin
  if DM.QrToOff.IsEmpty then Exit;
  ShowQ('Внимание! Цена товара "'+TrimRight(DM.QrToOff.FieldByName('Names').AsString)+'" будет приблизительно от '+CurrToStrF(DM.QrToOff.FieldByName('MinCena').AsCurrency,ffFixed,2)+' грн. до '+
         CurrToStrF(DM.QrToOff.FieldByName('MaxCena').AsCurrency,ffFixed,2)+' грн., в зависимости от поставщика, у которого будет покупаться товар!',0,True);
 end;

end.
