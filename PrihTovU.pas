unit PrihTovU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, Menus, ADODB, DateUtils,
     DBCtrls, PrintReport;

type

  TPrihTovF = class(TForm)
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    lbDN: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    lbSr: TLabel;
    PopupMenu1:TPopupMenu;
    N1: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    lbPostav: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    bbSrok: TBitBtn;
    Label5: TLabel;
    bbBack: TBitBtn;
    BitBtn6: TBitBtn;
    cbPostav: TComboBox;

    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ComboBox1CloseUp(Sender: TObject);
    procedure bbSrokClick(Sender: TObject);
    procedure bbBackClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);

  private

    FSr:String;
    FDateNakl:TDateTime;
    FFlag: Byte;
    FID_Postav:String;
    FArt_Code:Integer;
    FReadOnly:Boolean;
    FSklad:String;
    FSkl:Integer;
    FDtSrok:TDateTime;

    procedure ShowNakl;
    procedure SetSr(const Value: String);
    procedure EnterKol(AC:Integer; Names:String; P:Byte);

    function SendNaklToOffice:Boolean;
    function SendSpisToOffice: Boolean;


  public

    property Flag:Byte read FFlag write FFlag;
    property Sr:String read FSr write SetSr;
    property DateNakl:TDateTime read FDateNakl write FDateNakl;
    property DtSrok:TDateTime read FDtSrok write FDtSrok;

    property ID_Postav:String read FID_Postav write FID_Postav;
    property ReadOnly:Boolean read FReadOnly write FReadOnly;
    property Sklad:String read FSklad write FSklad;
    property Skl:Integer read FSkl write FSkl;

  end;

var PrihTovF:TPrihTovF=nil;

procedure ShowPrihTov(DateNakl:TDateTime; Sr,P:Byte; ReadOnly:Boolean=False; Skl:Byte=0; ChPostav:Boolean=False);

implementation

uses MainU, DataModuleU, EnterKolScanU, SpisTovAllU, ChMonthU,
  ChoosePostavU, DB;

{$R *.dfm}

procedure ShowPrihTov(DateNakl:TDateTime; Sr,P:Byte; ReadOnly:Boolean=False; Skl:Byte=0; ChPostav:Boolean=False);
var DtSr:TDateTime;
    SSr:String;
    V:Boolean;
    i:Integer;
 begin
  try

   if P=PR_SROK then
    begin
     DM.QrEx.Close;
     DM.QrEx.SQL.Text:='select DateAdd(m,'+IntToStr(Sr)+',convert(datetime,Value)) as dt from Spr_Const where Descr=''DtStartSrok'' ';
     DM.QrEx.Open;
     DtSr:=DM.QrEx.FieldByName('dt').AsDatetime;
     SSr:='Реестр срокового товара №'+IntToStr(Sr+1)+' ('+FormatDateTime('mmmm',DtSr)+' '+FormatDateTime('yyyy',DtSr)+')';

     {
     Case Sr of
      0:begin
         DtSr:=EndOfTheMonth(Date)+1;
         SSr:='Реестр срокового товара №1 ('+FormatDateTime('mmmm',EndOfTheMonth(Date)+1)+' '+FormatDateTime('yyyy',EndOfTheMonth(Date)+1)+')';
        end;
      1:begin
         DtSr:=EndOfTheMonth(EndOfTheMonth(Date)+1)+1;
         SSr:='Реестр срокового товара №2 ('+FormatDateTime('mmmm',EndOfTheMonth(EndOfTheMonth(Date)+1)+1)+' '+FormatDateTime('yyyy',EndOfTheMonth(EndOfTheMonth(Date)+1)+1)+')';
        end;
      2:begin
         DtSr:=EndOfTheMonth(EndOfTheMonth(EndOfTheMonth(Date)+1)+1)+1;
         SSr:='Реестр срокового товара №3 ('+FormatDateTime('mmmm',EndOfTheMonth(EndOfTheMonth(EndOfTheMonth(Date)+1)+1)+1)+' '+FormatDateTime('yyyy',EndOfTheMonth(EndOfTheMonth(EndOfTheMonth(Date)+1)+1)+1)+')';
        end else Exit;
     end;
     }

     DM.QrEx.Close;
     DM.QrEx.SQL.Text:='select top 1 Closed,DtSrok from ScanNakl where IsNull(Closed,0)>=1 and flag='+IntToStr(P)+' and DtSrok='''+FormatDateTime('yyyy-mm-dd',DtSr)+'''';
     DM.QrEx.Open;

     V:=False;
     if DM.QrEx.IsEmpty=False then
      begin
       if DM.QrEx.FieldByName('Closed').AsInteger=1 then V:=True else V:=False;
       if V then MainF.MessBox('"'+SSr+'" уже отсканирован и сформирован! Вы только можете просмотреть список и сформировать возврат!') else
                 MainF.MessBox('"'+SSr+'" уже отсканирован и сформирован! Вы только можете просмотреть этот список!');

       ReadOnly:=True;
      end;

    end;

   {if PrihTovF=nil then} PrihTovF:=TPrihTovF.Create(nil);
   try
    PrihTovF.BitBtn4.Visible:=False;
    PrihTovF.BitBtn5.Visible:=False;
    PrihTovF.bbSrok.Visible:=False;

    PrihTovF.ReadOnly:=ReadOnly;
    PrihTovF.Label1.Visible:=False;
    PrihTovF.Label5.Visible:=False;
    PrihTovF.Edit1.Visible:=False;
    PrihTovF.Label2.Visible:=False;
    PrihTovF.lbPostav.Visible:=False;
    PrihTovF.Label3.Visible:=False;
    PrihTovF.bbBack.Visible:=False;

    PrihTovF.Label4.Visible:=False;
    PrihTovF.ComboBox1.Visible:=False;
    PrihTovF.Flag:=P;
    PrihTovF.DBGrid1.Enabled:=True;
    PrihTovF.N1.Enabled:=True;
    PrihTovF.ComboBox1.Clear;
    Case P of
     PR_TOVAR:begin
               PrihTovF.DateNakl:=DateNakl;
               PrihTovF.BitBtn4.Visible:=True;
               PrihTovF.lbDN.Caption:='Дата товара: '+DateTimeToStr(DateNakl);
               PrihTovF.BitBtn4.Enabled:=True;
               PrihTovF.Label3.Visible:=True;
               PrihTovF.N1.Enabled:=True;
               PrihTovF.BitBtn3.Enabled:=True;
               PrihTovF.ComboBox1.Items.Add('Белостоцкий');
               PrihTovF.ComboBox1.Items.Add('Каркача');
               if Skl=0 then
                begin
                 Skl:=1;
                 PrihTovF.Label4.Caption:='Склад';
                 PrihTovF.Label4.Visible:=True;
                 PrihTovF.ComboBox1.Visible:=True;
                end;
               PrihTovF.Skl:=Skl;
               Case Skl of
                1:PrihTovF.Sklad:='''  BY    1S'',''    1I'',''    1S''';
                2:PrihTovF.Sklad:='''  BY     1'',''     1''';
               end;
              end;
     PR_WATER:begin

               PrihTovF.Skl:=Skl;
               PrihTovF.Label1.Visible:=True;
               PrihTovF.Edit1.Visible:=True;
               PrihTovF.Label2.Visible:=True;
               PrihTovF.lbPostav.Visible:=True;

               PrihTovF.BitBtn5.Visible:=True;
               PrihTovF.lbDN.Caption:='Дата накладной на воду: '+DateTimeToStr(DateNakl);
               PrihTovF.BitBtn3.Enabled:=True;
               PrihTovF.BitBtn5.Enabled:=True;

               DM.QrEx.Close;
               DM.QrEx.SQL.Text:='select top 1 date_nakl,cast(id_postav as uniqueidentifier) as id_postav,(select top 1 Descr from SprPostav p where p.id=s.id_postav) as postav,nn_postav from scannakl s where IsNull(Closed,0)=0 and flag='+IntToStr(PR_WATER);
               DM.QrEx.Open;

               if DM.QrEx.IsEmpty then
                begin
                 PrihTovF.DateNakl:=StrToDate(DateToStr(Date));
                 PrihTovF.ID_Postav:='null';
                 PrihTovF.lbPostav.Caption:='';
                end else begin
                          PrihTovF.DateNakl:=DM.QrEx.FieldByName('date_nakl').AsDateTime;
                          PrihTovF.ID_Postav:=DM.QrEx.FieldByName('id_postav').AsString;
                          PrihTovF.lbPostav.Caption:=DM.QrEx.FieldByName('postav').AsString;
                         end;
               PrihTovF.cbPostav.Visible:=ChPostav;
               if ChPostav then
                begin
                 DM.QrEx.Close;
                 DM.QrEx.SQL.Text:='select * from PostavList order by Descr';
                 DM.QrEx.Open;
                 PrihTovF.cbPostav.Clear;
                 for i:=1 to DM.QrEx.RecordCount do
                  begin
                   if i=1 then DM.QrEx.First else DM.QrEx.Next;
                   PrihTovF.cbPostav.Items.Add(DM.QrEx.FieldByName('Descr').AsString);
                  end;
                end;
              end;
     PR_SROK: begin

               PrihTovF.Skl:=Skl;
               PrihTovF.DateNakl:=DateNakl;
               PrihTovF.DtSrok:=DtSr;
               PrihTovF.Label5.Caption:=SSr;

               PrihTovF.Label5.Visible:=True;
               PrihTovF.bbSrok.Visible:=True;
               PrihTovF.lbDN.Caption:='Дата списка: '+DateTimeToStr(DateNakl);
               PrihTovF.bbSrok.Enabled:=True;
               PrihTovF.BitBtn3.Enabled:=True;
               PrihTovF.bbBack.Visible:=True;
               PrihTovF.bbBack.Enabled:=False;

               {
               DM.QrEx.Close;
               DM.QrEx.SQL.Text:='select substring(convert(varchar,DtSrok,4),4,5) as DtSrok from ScanNakl where Flag=3 and IsNull(Closed,0)=1 group by substring(convert(varchar,DtSrok,4),4,5) order by 1';
               DM.QrEx.Open;
               PrihTovF.ComboBox1.Items.Add('');
               for i:=1 to DM.QrEx.RecordCount do
                begin
                 if i=1 then DM.QrEx.First else DM.QrEx.Next;
                 PrihTovF.ComboBox1.Items.Add(DM.QrEx.FieldByName('DtSrok').AsString);
                end;
               }

               PrihTovF.ComboBox1.ItemIndex:=0;
               PrihTovF.Label4.Caption:='Срок';
               PrihTovF.Label4.Visible:=True;
               PrihTovF.ComboBox1.Visible:=False;

              end;
     end;
    if ReadOnly then
     begin
      PrihTovF.BitBtn3.Enabled:=False;
      PrihTovF.BitBtn4.Enabled:=False;
      PrihTovF.BitBtn5.Enabled:=False;
      PrihTovF.Edit1.Enabled:=False;
      PrihTovF.N1.Enabled:=False;
      PrihTovF.bbSrok.Enabled:=False;
      if P=PR_SROK then
       begin
        PrihTovF.bbBack.Enabled:=V;
       end;
     end;

    PrihTovF.ShowNakl;
    if (P=PR_SROK) and (DM.qrScanN.IsEmpty) then PrihTovF.bbBack.Enabled:=False;
    Application.ProcessMessages;
    PrihTovF.ShowModal;
   finally
    PrihTovF.Free;
   end;
  except
   on E:Exception do
    begin
     PrihTovF:=nil;
     MainF.MessBox('Ошибка открытия окна: '+E.Message);
    end;
  end;
 end;

procedure TPrihTovF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  ID_Postav:='';
  FArt_Code:=0;
 end;

procedure TPrihTovF.ShowNakl;
var ID:Integer;
    RO:String;
 begin
  try
   Sr:='';
   ID:=-1;
   if DM.qrScanN.Active then ID:=DM.qrScanN.FieldByName('art_code').AsInteger;

   DM.qrScanN.Close;
   DM.qrScanN.SQL.Clear;

   DM.qrScanN.SQL.Add('select a.art_code,b.names,a.kolscan,a.dtscan,u.users,a.id_user,a.typescan,cast(a.id_postav as uniqueidentifier) as id_postav,substring(convert(varchar,a.dtsrok,4),4,5) as dtsrok, ');
   DM.qrScanN.SQL.Add('       a.kolprod,              ');
   DM.qrScanN.SQL.Add('       IsNull((select Max(Art_Code) from NoScan where art_code=a.Art_Code),0) as IsScan,a.row_id ');

   Case Flag of
    PR_TOVAR:DM.qrScanN.SQL.Add(', IsNull(d.IsDelete,0) as IsDelete,(select Sum(kol) from TmpNakl t where t.sklad in ('+Sklad+') and a.date_nakl=t.date_nakl and a.art_code=t.art_code and /*t.NReady=1 and*/ t.Obl<>1 and t.nn_nakl not like ''ЛТ-%'' and t.typenakl=1) as KolNakl');
    PR_WATER,PR_SROK:DM.qrScanN.SQL.Add(', 0 as IsDelete,0 as kolnakl');
   end;

   DM.qrScanN.SQL.Add('from ScanNakl a left join ScanDeleted d on a.date_nakl=d.date_nakl and a.art_code=d.art_code and a.flag=d.flag  ,                ');
   DM.qrScanN.SQL.Add('     PList b,                                                                ');
   DM.qrScanN.SQL.Add('     SprUser u                                                               ');

   if (Flag<>PR_SROK) then
    DM.qrScanN.SQL.Add('where a.date_nakl='''+FormatDateTime('yyyy-mm-dd',DateNakl)+' 00:00:00'' and ')
   else begin
//         if ComboBox1.ItemIndex<=0 then DM.qrScanN.SQL.Add('where substring(convert(varchar,a.date_nakl,23),1,7)='''+FormatDateTime('yyyy-mm',DateNakl)+''' and ')
         DM.qrScanN.SQL.Add('where  ');
        end;
   DM.qrScanN.SQL.Add('      a.art_code=b.art_code and a.Skl='+IntToStr(Skl)+' and ');

   if Flag=PR_SROK then
    begin
     if ComboBox1.ItemIndex<=0 then DM.qrScanN.SQL.Add('      a.DtSrok='''+FormatDateTime('yyyy-mm-dd',DtSrok)+''' and ')
                               else DM.qrScanN.SQL.Add('      substring(convert(varchar,a.DtSrok,4),4,5)='''+ComboBox1.Text+''' and ');
    end;

   if (Flag=PR_SROK) then
    begin
     if ReadOnly then RO:='1' else RO:='0';
     DM.qrScanN.SQL.Add('      a.id_user=u.id and IsNull(Closed,0)>='+RO+' and a.flag='+IntToStr(Flag));
    end else DM.qrScanN.SQL.Add('      a.id_user=u.id and IsNull(Closed,0)=0 and a.flag='+IntToStr(Flag));
   DM.qrScanN.SQL.Add('order by 2  ');

//   DM.qrScanN.SQL.SaveToFile('C:\1234444.txt');
   DM.qrScanN.Open;
   DM.qrScanN.Locate('art_code',ID,[]);

   if cbPostav.Visible then cbPostav.Enabled:=DM.qrScanN.IsEmpty;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к журналу сканирования накладных: '+E.Message);
  end;
 end;

procedure TPrihTovF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TPrihTovF.DBGrid1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key in K_ARROW_KEYS then Sr:='';
 end;

procedure TPrihTovF.DBGrid1KeyPress(Sender:TObject; var Key:Char);
var AC:Integer;
    Names:String;
 begin
  try
   if ReadOnly then Exit;
   if Length(Sr)>13 then Sr:='';
   Sr:=Sr+Key;
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select a.art_code,b.names from SprEAN a, Plist b where b.names not like ''Ящик%'' and b.names not like ''Крышка%'' and a.art_code=b.art_code and EAN13='''+Sr+''' ';
   DM.QrEx.Open;
   if DM.QrEx.IsEmpty then
    begin
     if Length(Sr)=13 then
      begin
       MainF.MessBox('Позиция со штрихкодом '+Sr+' в базе не найдена!');
       Sr:='';
      end;
    end else begin
              if DM.QrEx.RecordCount>1 then
               begin
                AC:=DM.QrEx.FieldByName('art_code').AsInteger;
                Names:=DM.QrEx.FieldByName('names').AsString;
               end else begin
                         AC:=DM.QrEx.FieldByName('art_code').AsInteger;
                         Names:=DM.QrEx.FieldByName('names').AsString;
                        end;

              Sr:='';
              EnterKol(AC,Names,0);
             end;
  except
   on E:Exception do MainF.MessBox('Ошибка добавления товара: '+E.Message);
  end;
 end;

procedure TPrihTovF.SetSr(const Value: String);
 begin
  FSr:=Value;
  lbSr.Caption:=Value;
 end;

procedure TPrihTovF.DBGrid1DrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
var db:TDBGrid;
    dR,sR:TRect;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

{  if db.DataSource.DataSet.FieldByName('Kol').AsInteger=db.DataSource.DataSet.FieldByName('KolScan').AsInteger then db.Canvas.Brush.Color:=clLime;
  if (db.DataSource.DataSet.FieldByName('Kol').AsInteger>db.DataSource.DataSet.FieldByName('KolScan').AsInteger) and
     (db.DataSource.DataSet.FieldByName('KolScan').AsInteger<>0) then db.Canvas.Brush.Color:=clYellow;
  if db.DataSource.DataSet.FieldByName('Kol').AsInteger<db.DataSource.DataSet.FieldByName('KolScan').AsInteger then db.Canvas.Brush.Color:=$008080FF;
}
  Case Flag of
   PR_TOVAR:begin
             if db.DataSource.DataSet.FieldByName('IsDelete').AsInteger=1 then db.Canvas.Brush.Color:=clYellow else
              begin
               if db.DataSource.DataSet.FieldByName('kolscan').AsInteger<>db.DataSource.DataSet.FieldByName('kolnakl').AsInteger then db.Canvas.Brush.Color:=clYellow
                                                                                                                                 else db.Canvas.Brush.Color:=clLime;

               if (db.DataSource.DataSet.FieldByName('IsScan').AsInteger<>0) and(DataCol=0) then
                begin
                 db.Canvas.Brush.Color:=$00FFD98A;
                 db.Canvas.Font.Color:=clBlack;
                end;
              end;
            end;
   PR_WATER,PR_SROK:begin
                     if db.DataSource.DataSet.FieldByName('typescan').AsInteger=1 then db.Canvas.Brush.Color:=clLime;
                     if (db.DataSource.DataSet.FieldByName('IsScan').AsInteger<>0) and(DataCol=0) then
                      begin
                       db.Canvas.Brush.Color:=$00FFD98A;
                       db.Canvas.Font.Color:=clBlack;
                      end;
            end;
  end;


  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);

 { --- Рисование значка "Разрешенные для несканирования"}
  if (db.DataSource.DataSet.FieldByName('IsScan').AsInteger<>0) and (DataCol=0) then
   begin
    dR:=Rect;
    dr.Left:=dr.Left+2; dr.Top:=dr.Top+2;
    dr.Right:=dR.Left+MainF.imNoScan.Width; dr.Bottom:=dR.Top+MainF.imNoScan.Height;
    sR.Left:=0; sR.Top:=0;
    sR.Right:=MainF.imNoScan.Width; sR.Bottom:=MainF.imNoScan.Height;
    db.Canvas.CopyRect(dR,MainF.imNoScan.Canvas,sR);
   end;

 end;

procedure TPrihTovF.EnterKol(AC:Integer; Names:String; P:Byte);
var Ostat,Kol,TP,i:Integer;
    Mes,S:String;

 begin
  if Flag=PR_WATER then
   begin
    if cbPostav.Visible=True then
     begin

      if cbPostav.Text='' then
       begin
        MainF.MessBox('Выберите поставщика!');
        Exit;
       end;

      DM.Qr6.Close;
      DM.Qr6.SQL.Text:='select cast(id as uniqueidentifier) as id_postav from SprPostav where Descr='''+cbPostav.Text+'''';
      DM.Qr6.Open;

      lbPostav.Caption:=cbPostav.Text;
      ID_POstav:=DM.Qr6.FieldByName('id_postav').AsString;

     end else
    if (lbPostav.Caption='') then
     begin
 {
      DM.Qr6.Close;
      DM.Qr6.SQL.Text:='select cast(a.id_postav as uniqueidentifier) as id_postav,b.descr from Plist a, SprPostav b where a.id_postav=b.id and a.art_code='+IntToStr(AC)+' group by cast(a.id_postav as uniqueidentifier), b.descr';
      DM.Qr6.Open;
  }
      ID_POstav:='null';
      if DM.Qr6.IsEmpty then
       begin
       {
        MainF.MessBox('Поставщик не опознан, добавление товара невозможно!');
        Exit;
       }
       end else begin
{
                 if DM.Qr6.RecordCount>1 then
                 try
                  ChoosePostavF:=TChoosePostavF.Create(Self);
                  try
                   DM.srQr6.DataSet:=DM.Qr6;
                   ChoosePostavF.ShowModal;
                   if ChoosePostavF.Flag<>1 then Abort;
                  finally
                   DM.srQr6.DataSet:=nil;
                   ChoosePostavF.Free;
                  end;
                 except
                  MainF.MessBox('Поставщик не выбран!');
                  Exit;
                 end;

                 lbPostav.Caption:=DM.Qr6.FieldByName('descr').AsString;
                 ID_POstav:=DM.Qr6.FieldByName('id_postav').AsString;
}
                end;
     end else begin
               {
                DM.Qr6.Close;
                DM.Qr6.SQL.Text:='select top 1 cast(id_postav as uniqueidentifier) as id_postav from Plist a where a.id_postav=cast('''+ID_Postav+''' as uniqueidentifier) and a.art_code='+IntToStr(AC);
                DM.Qr6.Open;
               if DM.Qr6.IsEmpty then
                begin
                 MainF.MessBox('Выбранный товар не является товаром поставщика: '+lbPostav.Caption);
                 Exit;
                end;
               }
              end;
   end else

  if Flag=PR_TOVAR then
   begin
    DM.Qr6.Close;
    DM.Qr6.SQL.Text:='select top 1 (case when sklad in (''  BY    1S'' , ''    1S'',''    1I'') then 1 when sklad in  (''  BY     1'' ,''     1'') then 2 end) as Skl '+
                     ' from TmpNakl a where art_code='+IntToStr(AC)+' and TypeNakl=1 /*and NReady=1*/ and  a.date_nakl='''+FormatDateTime('yyyy-mm-dd',DateNakl)+' 00:00:00'' and a.obl<>1 and a.nn_nakl not like ''ЛТ-%'' and not exists (select 1 from JMoves b where a.nn_nakl=b.nn_nakl and a.date_nakl=b.date_nakl) ';
    DM.Qr6.Open;

    if DM.Qr6.IsEmpty=False then
     if DM.Qr6.FieldByName('Skl').AsInteger<>Skl then
      begin
       Case Skl of
        1:S:='Белостоцкий';
        2:S:='Каркача';
       end;
       MainF.MessBox('Данный товар не относится к складу "'+S+'"');
       Exit;
      end;

   end;

  if Flag=PR_SROK then // Проверяем есть ли на остатках вводимый препарат
   begin
    DM.Qr6.Close;
    DM.Qr6.SQL.Text:='select Sum(ostat) as Ostat from SprTov (nolock) where art_code='+IntToStr(AC);
    DM.Qr6.Open;
    Ostat:=DM.Qr6.FieldByName('Ostat').AsInteger;

    if Ostat=0 then
     begin
      Mes:='Позиция "'+Names+'" с арткодом '+IntToStr(AC)+' на остатках не числиться.';

      DM.Qr6.Close;
      DM.Qr6.SQL.Clear;
      DM.Qr6.SQL.Add('select art_code,names ');
      DM.Qr6.SQL.Add('from Plist (nolock) ');
      DM.Qr6.SQL.Add('where makefrom='+IntToStr(AC)+' and names not like ''%([0-9][0-9].[0-9][0-9])%'' and ');
      DM.Qr6.SQL.Add('      art_code in (select art_code from SprTov (nolock) where ostat>0) ');
      DM.Qr6.SQL.Add('order by 2');
      DM.Qr6.Open;

      if DM.Qr6.IsEmpty=False then
       begin
        Mes:=Mes+#10#10+' Нажмите "НЕТ" и проверьте наличие следующих позиции:'+#10;

        for i:=1 to DM.Qr6.RecordCount do
         begin
          if i=1 then DM.Qr6.First else DM.Qr6.Next;
          Mes:=Mes+#10+'  - '+DM.Qr6.FieldByName('art_code').AsString+' '+DM.Qr6.FieldByName('names').AsString;
         end;

        Mes:=Mes+#10#10+'Нажатие кнопки "ДА" добавит в список расфасовки исходную позицию.';

       end else Mes:=Mes+' Вы действительно хотите добавить ее в список расфасовки?';

      if MainF.MessBox(Mes,52)<>ID_YES then Exit;

     end;


   end;

  DM.Qr6.Close;
  DM.Qr6.SQL.Text:='select dbo.GetKoefUpak('+IntToStr(AC)+') as Koef';
  DM.Qr6.Open;

  EnterKolScanF:=TEnterKolScanF.Create(Self);
  try
   if Flag<>PR_SROK then Kol:=DM.Qr6.FieldByName('Koef').AsInteger
                    else Kol:=1;
   EnterKolScanF.Label2.Caption:=Names;

   EnterKolScanF.edKol.Text:=IntToStr(Kol);

   if P=1 then
    begin
     EnterKolScanF.cbHand.Checked:=True;
     EnterKolScanF.cbHand.Enabled:=False;
    end;
   Application.ProcessMessages;
   EnterKolScanF.ShowModal;
   if EnterKolScanF.Flag<>1 then Exit;

   if ID_POstav='' then ID_POstav:='null';

   Kol:=StrToInt(EnterKolScanF.edKol.Text);
   if Kol=0 then Exit;
   if P=1 then TP:=3 else
    begin
     TP:=1;
     if EnterKolScanF.cbHand.Checked then TP:=2;
    end;

   DM.Qr6.Close;
   DM.Qr6.SQL.Clear;
   DM.Qr6.SQL.Add('declare @ks int ');

   if Flag<>PR_SROK then
    begin
     DM.Qr6.SQL.Add('set @ks=IsNull((select Sum(KolScan) from ScanNakl where date_nakl='''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'' and Skl='+IntToStr(Skl)+' and art_code='+IntToStr(AC)+' and flag='+IntToStr(Flag)+'),0) ');
     DM.Qr6.SQL.Add('delete from ScanNakl where date_nakl='''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'' and Skl='+IntToStr(Skl)+' and art_code='+IntToStr(AC)+' and flag='+IntToStr(Flag));
     DM.Qr6.SQL.Add('insert into ScanNakl(date_nakl,art_code,kolscan,typescan,id_user,flag,skl,id_postav) values(')
    end else begin
              DM.Qr6.SQL.Add('set @ks=IsNull((select Sum(KolScan) from ScanNakl where DtSrok='''+FormatDateTime('yyyy-mm-dd',DtSrok)+''' and date_nakl='''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'' and Skl='+IntToStr(Skl)+' and art_code='+IntToStr(AC)+' and flag='+IntToStr(Flag)+'),0) ');
              DM.Qr6.SQL.Add('delete from ScanNakl where DtSrok='''+FormatDateTime('yyyy-mm-dd',DtSrok)+''' and date_nakl='''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'' and Skl='+IntToStr(Skl)+' and art_code='+IntToStr(AC)+' and flag='+IntToStr(Flag));
              DM.Qr6.SQL.Add('insert into ScanNakl(date_nakl,art_code,kolscan,typescan,id_user,flag,skl,id_postav,DtSrok,KolProd) values(');
             end;

   DM.Qr6.SQL.Add(''''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'',');
   DM.Qr6.SQL.Add(IntToStr(AC)+',');
   DM.Qr6.SQL.Add(IntToStr(Kol)+'+@ks,');
   DM.Qr6.SQL.Add(IntToStr(TP)+',');
   DM.Qr6.SQL.Add(IntToStr(Prm.UserID)+',');
   DM.Qr6.SQL.Add(IntToStr(Flag)+',');
   DM.Qr6.SQL.Add(IntToStr(Skl)+',');

   if Flag=PR_SROK then
    begin
     DM.Qr6.SQL.Add(' null ,');

//     DM.Qr6.SQL.Add(' cast(cast(NullIf('''+ID_Postav+''','''') as uniqueidentifier) as binary(16)) ,');
     DM.Qr6.SQL.Add(''''+FormatDateTime('yyyy-mm-dd',DtSrok)+''',0)');
    end else begin
              if ID_Postav='null' then DM.Qr6.SQL.Add(' cast(cast('+ID_Postav+' as uniqueidentifier) as binary(16)) )')
                                  else DM.Qr6.SQL.Add(' cast(cast('''+ID_Postav+'''as uniqueidentifier) as binary(16)) )');
             end; 
//   DM.Qr6.SQL.SaveToFile('C:\Srok1.txt');

   DM.Qr6.SQL.Add('select 9951 as Res');
   DM.Qr6.Open;
  finally
   ShowNakl;
   DM.qrScanN.Locate('art_code',AC,[]);
   Sr:='';
   EnterKolScanF.Free;
  end;
 end;

procedure TPrihTovF.FormActivate(Sender:TObject);
 begin
//  BitBtn3.Enabled:=True;
  DBGrid1.SetFocus;
 end;

procedure TPrihTovF.N1Click(Sender:TObject);
 begin
  if (Flag=PR_SROK) and (ComboBox1.ItemIndex>0) then
   begin
    MainF.MessBox('Снимите фильтр просмотра прошлых реестров!');
    ComboBox1.SetFocus;
    Exit;
   end;

  if DM.qrScanN.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите очистить строку?',52)<>ID_YES then Exit;
  try
   DM.Qr6.Close;
   DM.Qr6.SQL.Clear;
   DM.Qr6.SQL.Add('if (select Count(*) from ScanDeleted where flag='+IntToStr(Flag)+' and  date_nakl='''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'' and art_code='+DM.qrScanN.FieldByName('art_code').AsString+')<=0 ');
   DM.Qr6.SQL.Add(' insert into ScanDeleted(flag,date_nakl,art_code,IsDelete) values('+IntToStr(flag)+','''+FormatDateTime('yyyy-mm-dd',datenakl)+''','+DM.qrScanN.FieldByName('art_code').AsString+',1)  ');
//   DM.Qr6.SQL.Add('delete from ScanNakl where row_id='+DM.qrScanN.FieldByName('row_id').AsString);
   if Flag=PR_SROK then
    DM.Qr6.SQL.Add('delete from ScanNakl where DtSrok='''+FormatDateTime('yyyy-mm-dd',DtSrok)+''' and IsNull(Closed,0)=0 and flag='+IntToStr(Flag)+' and Skl='+IntToStr(Skl)+' and art_code='+DM.qrScanN.FieldByName('art_code').AsString)
   else
    DM.Qr6.SQL.Add('delete from ScanNakl where IsNull(Closed,0)=0 and flag='+IntToStr(Flag)+' and Skl='+IntToStr(Skl)+' and  date_nakl='''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'' and art_code='+DM.qrScanN.FieldByName('art_code').AsString);

   DM.Qr6.ExecSQL;
   ShowNakl;
  except
   on E:Exception do MainF.MessBox('Ошибка очистки строки: '+E.Message);
  end;
 end;

procedure TPrihTovF.BitBtn1Click(Sender: TObject);
 begin
  ShowNakl;
 end;

procedure TPrihTovF.BitBtn3Click(Sender: TObject);
 begin
  if (Flag=PR_SROK) and (ComboBox1.ItemIndex>0) then
   begin
    MainF.MessBox('Снимите фильтр просмотра прошлых реестров!');
    ComboBox1.SetFocus;
    Exit;
   end;
  try
   SpisTovAllF:=TSpisTovAllF.Create(Self);
   try
    if FArt_code>0 then DM.qrPList1.Locate('art_code',FArt_code,[]);
    Application.ProcessMessages;
    SpisTovAllF.ShowModal;
    FArt_code:=DM.qrPList1.FieldByName('Art_Code').AsInteger;
    if SpisTovAllF.Flag=1 then EnterKol(DM.qrPList1.FieldByName('art_code').AsInteger,DM.qrPList1.FieldByName('names').AsString,1);
   finally
    SpisTovAllF.Free;
   end;
  except
  end;

 end;

procedure TPrihTovF.BitBtn4Click(Sender:TObject);
var i:Integer;
    nn_nakl:String;
 begin

  Exit;

  if DM.qrScanN.IsEmpty then Exit;
//  if MainF.CheckForReoc=False then Exit;

  if MainF.MessBox('Вы действительно хотите загрузить товар?',52)<>ID_YES then Exit;

  DM.ADOCo.BeginTrans;
  try

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select date_nakl,typenakl,nn_nakl from TmpNakl a where sklad in ('+Sklad+') and /*NReady=1 and */ a.date_nakl='''+FormatDateTime('yyyy-mm-dd',DateNakl)+' 00:00:00'' and a.obl<>1 and a.nn_nakl not like ''ЛТ-%'' and not exists (select 1 from JMoves b where a.nn_nakl=b.nn_nakl and a.date_nakl=b.date_nakl) group by date_nakl,typenakl,nn_nakl order by date_nakl,typenakl,nn_nakl';
   DM.QrEx.Open;

   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;

     NN_Nakl:=DM.QrEx.FieldByName('nn_nakl').AsString;

     DM.spY_ReocNakl.Close;
     DM.spY_ReocNakl.Parameters.ParamValues['@piduser']:=Prm.UserID;

     DM.spY_ReocNakl.Parameters.ParamValues['@pnn']:=NN_Nakl;
     DM.spY_ReocNakl.Parameters.ParamValues['@pdn']:=StrToDate(DateToStr(DM.QrEx.FieldByName('date_nakl').AsDateTime));

     DM.spY_ReocNakl.ExecProc;
     if DM.spY_ReocNakl.Parameters.ParamValues['@RETURN_VALUE']<>888 then Abort;

     DM.spY_NewNakl.Close;
     DM.spY_NewNakl.Parameters.ParamValues['@piduser']:=Prm.UserID;
     DM.spY_NewNakl.Parameters.ParamValues['@pnn']:=NN_Nakl;
     DM.spY_NewNakl.Parameters.ParamValues['@pdn']:=StrToDate(DateToStr(DM.QrEx.FieldByName('date_nakl').AsDateTime));
     DM.spY_NewNakl.ExecProc;
     if DM.spY_NewNakl.Parameters.ParamValues['@RETURN_VALUE']<>999 then Abort;
    end;
   DM.QrEx1.Close;
   DM.QrEx1.SQL.Clear;
   DM.QrEx1.SQL.Add('declare @dt datetime, @id_user int  ');
   DM.QrEx1.SQL.Add('                                    ');
   DM.QrEx1.SQL.Add('set @dt='''+FormatDateTime('yyyy-mm-dd',DateNakl)+' 00:00:00''                    ');
   DM.QrEx1.SQL.Add('set @id_user='+IntToStr(Prm.UserID)  );
   DM.QrEx1.SQL.Add('                                    ');
   DM.QrEx1.SQL.Add('                                    ');
   DM.QrEx1.SQL.Add('if Object_ID(N''tempdb..#per'') is not null drop table #per ');
   DM.QrEx1.SQL.Add('select IsNull(a.art_code,b.art_code) as art_code,IsNull(b.kol,0)-IsNull(a.kol,0) as kol,IsNull(a.cena,0) as cena,sklad,a.nn_nakl ');
   DM.QrEx1.SQL.Add('into #per                                                                                                              ');
   DM.QrEx1.SQL.Add('from (select art_code,Sum(kol) as kol,Max(cena) as cena,Max(sklad) as sklad, Max(nn_nakl) as nn_nakl from TmpNakl a where sklad in ('+Sklad+') and typenakl=1 and nn_nakl not like ''ЛТ-%'' and /*NReady=1 and*/ obl<>1 and date_nakl=@dt and exists '+'(select 1 from JMoves b where a.nn_nakl=b.nn_nakl and a.date_nakl=b.date_nakl) group by art_code) a full join');
   DM.QrEx1.SQL.Add('     (select art_code,Sum(kolscan) as kol from ScanNakl where IsNull(Closed,0)=0 and flag='+IntToStr(Flag)+' and Skl='+IntToStr(Skl)+' and date_nakl=@dt group by art_code) b on a.art_code=b.art_code                  ');
   DM.QrEx1.SQL.Add('                                                                                                                                           ');
   DM.QrEx1.SQL.Add('delete from Inform..TMP_SPIS where id_user=@id_user and compname=host_name() and priznak=100                                                                   ');

   DM.QrEx1.SQL.Add('insert into Inform..Tmp_Spis(art_code,names,kol,cena,id_user,priznak,compname)        ');
   DM.QrEx1.SQL.Add('select a.art_code,b.names,a.kol,a.cena,@id_user,100,host_name()                       ');
   DM.QrEx1.SQL.Add('from #per a, PList b                                                                  ');
   DM.QrEx1.SQL.Add('where a.kol>0 and a.art_code=b.art_code                                               ');

   DM.QrEx1.SQL.Add('exec spY_MakeLt @id_user,100                                                          ');

   DM.QrEx1.SQL.Add('delete from Inform..TMP_SPIS where id_user=@id_user and compname=host_name() and priznak=100                                                                   ');

   DM.QrEx1.SQL.Add('insert into Inform..Tmp_Spis(art_code,names,kol,cena,id_user,priznak,compname,nn_prih)        ');
   DM.QrEx1.SQL.Add('select a.art_code,b.names,Abs(a.kol),a.cena,@id_user,100,host_name(),a.nn_nakl                       ');
   DM.QrEx1.SQL.Add('from #per a, PList b                                                                  ');
   DM.QrEx1.SQL.Add('where a.kol<0 and a.art_code=b.art_code                                               ');

   DM.QrEx1.SQL.Add('exec spY_MakeVz @id_user,100                                                          ');

{
   DM.QrEx1.SQL.Add('declare @art int, @kol int, @sklad varchar(9)                                         ');
   DM.QrEx1.SQL.Add('declare Cur cursor local for select art_code,Abs(kol),sklad from #per where kol<0     ');
   DM.QrEx1.SQL.Add('open Cur                                                                              ');
   DM.QrEx1.SQL.Add('fetch Cur into @art,@kol,@sklad                                                       ');
   DM.QrEx1.SQL.Add('while @@Fetch_Status = 0                                                              ');
   DM.QrEx1.SQL.Add(' begin                                                                                ');
   DM.QrEx1.SQL.Add('  exec spY_EnterKol @art,@kol,@id_user,1,@art,0,1,0,0,'''',@sklad                     ');
   DM.QrEx1.SQL.Add('  fetch Cur into @art,@kol,@sklad                                                     ');
   DM.QrEx1.SQL.Add(' end                                                                                  ');
   DM.QrEx1.SQL.Add('close Cur                                                                             ');
   DM.QrEx1.SQL.Add('deallocate Cur                                                                        ');
}
//   DM.QrEx1.SQL.Add('exec spY_WriteChek @id_user,0,99,1,1,@dt,9,'''',0,0                      ');
//   DM.QrEx1.SQL.Add('exec spY_WriteChek @id_user,0,99,1,1,@dt,0,''$autovozvrat$'',0,0                      ');

   DM.QrEx1.SQL.Add('select 9900 as Res ');
   DM.QrEx1.Open;

   if DM.QrEx1.FieldByName('Res').AsInteger<>9900 then Abort;

   DM.ADOCo.CommitTrans;

   BitBtn3.Enabled:=False;
   BitBtn4.Enabled:=False;
   DBGrid1.Enabled:=False;

   MainF.MessBox('Загрузка накладных завершена!',64);
   MainF.FilterSklad;
//   MainF.MessBox('Загрузка накладных завершена!'+  #10#10+'Теперь');
  except
   on E:Exception do
    begin
     if Pos('duplicate key',E.Message)<>0 then MainF.MessBox('Накладная '+NN_Nakl+' уже загружена')
                                          else MainF.MessBox('Ошибка загрузки накладной'+NN_Nakl+' : '+E.Message);
     DM.ADOCo.RollbackTrans;
    end;
  end;

 end;

function TPrihTovF.SendNaklToOffice:Boolean;
var QrToOff:TADOQuery;
    i:Integer;
 begin
  if MainF.IsStudyRoom then begin Result:=True; Exit; end;
  try
   QrToOff:=TADOQuery.Create(nil);
   try
    QrToOff.ConnectionString:=Prm.ConStrDB;
    QrToOff.CommandTimeout:=600;
    QrToOff.Close;

    DM.QrEx1.Close;
    DM.QrEx1.SQL.Text:='select cast(id_postav as uniqueidentifier) as id_postav, nn_postav,art_code,kolscan,date_nakl,id_user,dtscan from ScanNakl where IsNull(Closed,0)=1 and nn_postav='''+Edit1.Text+''' and flag='+IntToStr(Flag)+' and date_nakl='''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'' ';
    DM.QrEx1.Open;

    for i:=1 to DM.QrEx1.RecordCount do
     begin
      if i=1 then DM.QrEx1.First else DM.QrEx1.Next;

      QrToOff.SQL.Clear;
      QrToOff.SQL.Add('insert into ekka_net..water_all(id_postav,nn_postav,art_code,kol,date_nakl,id_user,id_apteka,dtscan) values(');

      if DM.QrEx1.FieldByName('id_postav').AsString='' then
       QrToOff.SQL.Add('cast(cast(null as uniqueidentifier) as binary(16)) ,')
      else
       QrToOff.SQL.Add('cast(cast('''+DM.QrEx1.FieldByName('id_postav').AsString+''' as uniqueidentifier) as binary(16)) ,');

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
   Result:=True;
  except
   Result:=False;
  end;
 end;

procedure TPrihTovF.BitBtn5Click(Sender: TObject);
var S:String;
 begin

  if DM.qrScanN.IsEmpty then Exit;
  if Edit1.Text='' then
   begin
    MainF.MessBox('Введите номер приходной накладной поставщика!');
    Edit1.SetFocus;
    Exit;
   end;

  DM.QrEx1.Close;

  if DM.qrScanN.FieldByName('id_postav').AsString='' then
   DM.QrEx1.SQL.Text:='select top 1 * from ScanNakl where IsNull(Closed,0)=1 and id_postav=cast(null as uniqueidentifier) and nn_postav='''+Edit1.Text+''' and flag='+IntToStr(Flag)
  else
   DM.QrEx1.SQL.Text:='select top 1 * from ScanNakl where IsNull(Closed,0)=1 and id_postav=cast('''+ DM.qrScanN.FieldByName('id_postav').AsString+''' as uniqueidentifier) and nn_postav='''+Edit1.Text+''' and flag='+IntToStr(Flag);

  DM.QrEx1.Open;

  if DM.QrEx1.IsEmpty=False then
   if MainF.MessBox('Накладная с номером "'+Edit1.Text+'" данного поставщика уже была сформирована '+DateToStr(datenakl)+'!'#10#10+
                    'Если вы уверены что это не дубликат, отсканированной только что накладной, то нажмите "ДА" иначе "НЕТ"!',52)<>ID_YES then Exit;


  if MainF.MessBox('Вы действительно хотите сформировать приходную накладную?',52)<>ID_YES then Exit;

  DM.ADOCo.BeginTrans;
  try

   DM.QrEx1.Close;
   DM.QrEx1.SQL.Text:='update ScanNakl set Closed=1,nn_postav='''+Copy(Edit1.Text,1,13)+''' where IsNull(Closed,0)=0 and flag='+IntToStr(Flag)+' and date_nakl='''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'' ';
   DM.QrEx1.SQL.Add('select 9900 as Res ');
   DM.QrEx1.Open;
   if DM.QrEx1.FieldByName('Res').AsInteger<>9900 then Abort;


   DM.ADOCo.CommitTrans;
   SendNaklToOffice;
   MainF.MessBox('Приходная накладная сформирована успешно!',64);
//                       else MainF.MessBox('Приходная накладная сформирована успешно, но не отправлена в базу офиса!');

   lbPostav.Caption:='';
   ID_Postav:='';
   Edit1.Text:='';
   BitBtn3.Enabled:=False;
   BitBtn5.Enabled:=False;
   DBGrid1.Enabled:=False;



   Close;
  except
   on E:Exception do
    begin
     DM.ADOCo.RollbackTrans;
     MainF.MessBox('Ошибка формирования приходной накладной: '+E.Message);
    end;
  end;
 end;

function TPrihTovF.SendSpisToOffice:Boolean;
var QrToOff:TADOQuery;
    i:Integer;
 begin
  try
   if Prm.ID_Gamma=1 then begin Result:=True; Exit; end;
   QrToOff:=TADOQuery.Create(nil);
   try
    QrToOff.ConnectionString:=Prm.ConStrDB;
    QrToOff.CommandTimeout:=600;
    QrToOff.Close;

    DM.QrEx1.Close;
    DM.QrEx1.SQL.Text:='select * from ScanNakl where DtSrok='''+FormatDateTime('yyyy-mm-dd',DtSrok)+''' and IsNull(Closed,0)=1 and flag='+IntToStr(Flag);
//    DM.QrEx1.SQL.SaveToFile('C:\SpisSrok.sql');
    DM.QrEx1.Open;

    for i:=1 to DM.QrEx1.RecordCount do
     begin
      if i=1 then DM.QrEx1.First else DM.QrEx1.Next;

      QrToOff.SQL.Clear;
      QrToOff.SQL.Add('insert into ekka_net..SpisSrok_All(art_code,kol,date_nakl,id_user,id_apteka,dtscan,dtsrok,KolProd) values(');
      QrToOff.SQL.Add(DM.QrEx1.FieldByName('art_code').AsString+',');
      QrToOff.SQL.Add(DM.QrEx1.FieldByName('kolscan').AsString+',');
      QrToOff.SQL.Add(''''+FormatDateTime('yyyy-mm-dd',DM.QrEx1.FieldByName('date_nakl').AsDateTime)+' 00:00:00'',');
      QrToOff.SQL.Add(DM.QrEx1.FieldByName('id_user').AsString+',');
      QrToOff.SQL.Add(IntToStr(Prm.AptekaID)+',');
      QrToOff.SQL.Add(''''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DM.QrEx1.FieldByName('dtscan').AsDateTime)+''',');
      QrToOff.SQL.Add(''''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DM.QrEx1.FieldByName('dtsrok').AsDateTime)+''',');
      QrToOff.SQL.Add(DM.QrEx1.FieldByName('KolProd').AsString+')');
      QrToOff.ExecSQL;
     end;
   finally
    QrToOff.Free;
   end;
   Result:=True;
  except
   Result:=False;
  end;
 end;

procedure TPrihTovF.bbSrokClick(Sender: TObject);
var Empt:Boolean;
 begin
  if (Flag=PR_SROK) and (ComboBox1.ItemIndex>0) then
   begin
    MainF.MessBox('Снимите фильтр просмотра прошлых реестров!');
    ComboBox1.SetFocus;
    Exit;
   end;

  Empt:=False;
  if DM.qrScanN.IsEmpty then
   begin
    if MainF.MessBox('Вы действительно хотите сформировать пустой список сроковых препаратов?',52)<>ID_YES then Exit;
    Empt:=True;
   end else
  if MainF.MessBox('Вы действительно хотите сформировать список сроковых препаратов?',52)<>ID_YES then Exit;

  DM.ADOCo.BeginTrans;
  try

   DM.QrEx1.Close;
   DM.QrEx1.SQL.Clear;

   if Empt then
    begin
     DM.QrEx1.SQL.Add('insert into ScanNakl(date_nakl,art_code,kolscan,typescan,id_user,flag,skl,DtSrok,KolProd) values(');
     DM.QrEx1.SQL.Add(''''+FormatDateTime('yyyy-mm-dd',datenakl)+' 00:00:00'',');
     DM.QrEx1.SQL.Add('-1,0,3,');
     DM.QrEx1.SQL.Add(IntToStr(Prm.UserID)+',');
     DM.QrEx1.SQL.Add(IntToStr(Flag)+',');
     DM.QrEx1.SQL.Add('0,');
     DM.QrEx1.SQL.Add(''''+FormatDateTime('yyyy-mm-dd',DtSrok)+''',0)');
    end;

   DM.QrEx1.SQL.Add('update ScanNakl set Closed=1 where DtSrok='''+FormatDateTime('yyyy-mm-dd',DtSrok)+''' and IsNull(Closed,0)=0 and flag='+IntToStr(Flag));
   DM.QrEx1.SQL.Add('select 9900 as Res ');
   DM.QrEx1.Open;
   if DM.QrEx1.FieldByName('Res').AsInteger<>9900 then Abort;


   DM.ADOCo.CommitTrans;

   if SendSpisToOffice then MainF.MessBox('Список сроковых препаратов сформирован успешно!',64)
                       else MainF.MessBox('Список сроковых препаратов сформирован успешно, но не отправлен в базу офиса!');

   BitBtn3.Enabled:=False;
   bbSrok.Enabled:=False;
   DBGrid1.Enabled:=False;
   bbBack.Enabled:=True;

//   Close;
  except
   on E:Exception do
    begin
     DM.ADOCo.RollbackTrans;
     MainF.MessBox('Ошибка формирования списка сроковых препаратов: '+E.Message);
    end;
  end;
 end;


procedure TPrihTovF.ComboBox1CloseUp(Sender: TObject);
 begin
  if Flag=PR_TOVAR then
   begin
    Skl:=ComboBox1.ItemIndex+1;

    Case Skl of
     1:Sklad:='''  BY    1S'',''    1I'',''    1S''';
     2:Sklad:='''  BY     1'',''     1''';
    end;
   end;
  ShowNakl;
 end;

procedure TPrihTovF.bbBackClick(Sender: TObject);
var CP:TChekPos;
    sPr:String;
    i:Integer;
 begin

  if (Flag=PR_SROK) and (ComboBox1.ItemIndex>0) then
   begin
    MainF.MessBox('Снимите фильтр просмотра прошлых реестров!');
    ComboBox1.SetFocus;
    Exit;
   end;

  if MainF.MessBox('Вы действительно хотите сформировать возврат?',52)<>ID_YES then Exit;

  CP.Priznak:=14;
  CP.VzDescr:=' ('+FormatDateTime('mm.yy',DtSrok)+')';
  CP.IDMess:=0;
  CP.Date:=StrToDate(DateToStr(Date));
  try
   DBGrid1.Visible:=False;
   try
    DM.ADOCo.BeginTrans;
    DM.Qr1.Close;
    DM.Qr1.SQL.Clear;
    DM.Qr1.SQL.Add('if Object_ID(N''tempdb..#VList'') is not null drop table #VList ');
    DM.Qr1.SQL.Add('select top 0 art_code,kol,id_user,printing into #VList from Inform..Tmp_Spis');
    try

     for i:=1 to DM.qrScanN.RecordCount do
      begin
       if i=1 then DM.qrScanN.First else DM.qrScanN.Next;
       if (DM.qrScanN.FieldbyName('IsScan').AsInteger<>0) or (DM.qrScanN.FieldbyName('TypeScan').AsInteger<>3) then sPr:='1' else sPr:='0';

       DM.Qr1.SQL.Add('insert into #VList Values(' );
       DM.Qr1.SQL.Add(DM.qrScanN.FieldbyName('art_code').AsString+',');
       DM.Qr1.SQL.Add(DM.qrScanN.FieldbyName('kolscan').AsString+','+IntToStr(-Prm.UserID)+','+sPr+')');

      end;

     DM.Qr1.SQL.Add('delete from #Vlist where art_code in (select art_code from SprTov where names like ''%(__.__)%'' group by art_code ) ');
     DM.Qr1.SQL.Add('update V set kol=s.ostat ');
     DM.Qr1.SQL.Add('from #Vlist v, (select art_code,Sum(ostat) as ostat from SprTov group by art_code) s ');
     DM.Qr1.SQL.Add('where v.art_code=s.art_code and v.kol>s.ostat ');

     DM.Qr1.SQL.Add('declare @part_code int, @pkol smallint, @piduser smallint ,@pscan smallint ');
     DM.Qr1.SQL.Add('declare Cur cursor local for select art_code,kol,id_user,printing from #VList where kol>0');

     DM.Qr1.SQL.Add('open Cur                                                             ');
     DM.Qr1.SQL.Add('fetch Cur into @part_code,@pkol,@piduser,@pscan                      ');
     DM.Qr1.SQL.Add('while @@Fetch_Status = 0                                             ');
     DM.Qr1.SQL.Add(' begin                                                               ');

     DM.Qr1.SQL.Add('  exec spY_EnterKol @part_code,@pkol,@piduser,@pscan,@part_code,0,1,0,0,'''','''',0,-1,0,null,null,0,0,0,0,0,0,0,null,0  ');

//   DM.Qr1.SQL.Add('  exec spY_EnterKol @part_code,@pkol,@piduser,@pscan,@part_code,0,1,0,0,'''','''',0,-1,1   ');

     DM.Qr1.SQL.Add('  fetch Cur into @part_code,@pkol,@piduser,@pscan                    ');
     DM.Qr1.SQL.Add(' end                                                                 ');
     DM.Qr1.SQL.Add('close Cur                                                            ');
     DM.Qr1.SQL.Add('deallocate Cur                                                       ');
//     DM.Qr1.SQL.SaveToFile('C:\Srok.txt');
     DM.Qr1.ExecSQL;

     CP.ID_User:=-Prm.UserID;
     CP.NumbChek:=0;
     CP.TypeOplat:=TO_BACK;
     CP.TypeOplatBS:=TO_BACK;
     CP.TypeOplatKur:=TO_BACK;
     CP.ID_Kassa:=Opt.KassaID;
     CP.Vzh:=0;
     CP.VzhSafe:=0;
     CP.PrPayRecipt:=0;
     CP.SumSertif:=0;
     DM.WriteChek(CP);

     DM.QrEx1.Close;
     DM.QrEx1.SQL.Clear;
     DM.QrEx1.SQL.Add('update ScanNakl set Closed=2 where DtSrok='''+FormatDateTime('yyyy-mm-dd',DtSrok)+''' and IsNull(Closed,0)=1 and flag='+IntToStr(Flag));
     DM.QrEx1.SQL.Add('select 9900 as Res ');
     DM.QrEx1.Open;
     if DM.QrEx1.FieldByName('Res').AsInteger<>9900 then Abort;
     DM.ADOCo.CommitTrans;
     bbBack.Enabled:=False;
     MainF.MessBox('Внимание был сформирован возврат по сроковым товарам! Товар с остатков снят. В течении 24 часов Вам будет сформирована расходная накладная, расфасованная в сроковый товар.'+' Если в течении 4 часов Вы не увидите в меню "Накладные\Загрузка накладных" накладную со сроковым товаром, вышлите сообщение на CALL-Центр следующего содержания: "К нам не поступила накладная со сроковым товаром".',64);
    except
     DM.ADOCo.RollbackTrans;
     raise;
    end;
   except
    on E:Exception do MainF.MessBox('Ошибка формирования возврата: '+E.Message);
   end;
  finally
   DM.qrScanN.First;
   DBGrid1.Visible:=True;
  end;
 end;

procedure TPrihTovF.BitBtn6Click(Sender: TObject);
var i:Integer;
    Tb:TTableObj;
 begin
  if DM.qrScanN.IsEmpty then Exit;
  try
   DBGrid1.SetFocus;
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Align:=AL_CENTER;
   PrintRep.AddText(Label5.Caption+#10#10);
   PrintRep.Align:=AL_LEFT;
   PrintRep.AddText('Дата печати: '+DateTimeToStr(Now)+#10#10);
   PrintRep.AddTable(4,DM.qrScanN.RecordCount+1);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('1500,2000,8000,2000');
   Tb.Cell[1,1].Align:=AL_CENTER; Tb.Cell[1,1].AddText('№ п/п');
   Tb.Cell[2,1].Align:=AL_CENTER; Tb.Cell[2,1].AddText('Код');
   Tb.Cell[3,1].Align:=AL_CENTER; Tb.Cell[3,1].AddText('Наименование');
   Tb.Cell[4,1].Align:=AL_CENTER; Tb.Cell[4,1].AddText('Кол-во.');

   for i:=1 to DM.qrScanN.RecordCount do
    begin
     if i=1 then DM.qrScanN.First else DM.qrScanN.Next;
     Tb.Cell[1,i+1].Align:=AL_CENTER; Tb.Cell[1,i+1].AddText(IntToStr(i)+'.');
     Tb.Cell[2,i+1].Align:=AL_CENTER; Tb.Cell[2,i+1].AddText(DM.qrScanN.FieldByName('art_code').AsString);
     Tb.Cell[3,i+1].AddText(DM.qrScanN.FieldByName('names').AsString);
     Tb.Cell[4,i+1].Align:=AL_CENTER; Tb.Cell[4,i+1].AddText(DM.qrScanN.FieldByName('kolscan').AsString);
    end;

   PrintRep.PreView;
  finally
   DM.qrScanN.First;
   DBGrid1.Visible:=True;
  end;
 end;

end.




