unit RealizRepU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, OpenLib, Printers, StdCtrls, ComCtrls, Buttons, Grids,
  DBGrids, DBCtrls, DB, PrintReport, Util, Math, EKKAU;

type
  TRealizRepF = class(TForm)
    Panel2:TPanel;
    Label2:TLabel;
    btPer:TBitBtn;
    dtEnd:TDateTimePicker;
    dtStart:TDateTimePicker;
    Label1:TLabel;
    Panel1:TPanel;
    DBGrid1:TDBGrid;
    Panel3:TPanel;
    Panel4:TPanel;
    Panel5:TPanel;
    BitBtn2:TBitBtn;
    Label3:TLabel;
    DBText1:TDBText;
    DBText2:TDBText;
    Label4:TLabel;
    dbgChekInfo:TDBGrid;
    bbCopyChek:TBitBtn;
    pnSearch:TPanel;
    Label5:TLabel;
    Label6:TLabel;
    edNumb:TEdit;
    Label7:TLabel;
    edNames:TEdit;
    Label8:TLabel;
    cbKassa:TComboBox;
    Label9:TLabel;
    cbUsers:TComboBox;
    CheckBox1:TCheckBox;
    Label11:TLabel;
    DBText3:TDBText;
    Label12:TLabel;
    edNumC:TEdit;
    bbEKKACheck:TBitBtn;
    CheckBox2: TCheckBox;
    lbKur: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label13: TLabel;
    edStart: TEdit;
    edEnd: TEdit;
    Label10: TLabel;
    CheckBox3: TCheckBox;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btPerClick(Sender: TObject);
    procedure bbCopyChekClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edNumbKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    procedure bbEKKACheckClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);

  private

    FSr:String;

    procedure ShowChek;
    procedure DSrc1DataChange(Sender:TObject; Field:TField);

  public

    Flag:Integer;

    procedure FilterRealiz;

  end;

var RealizRepF:TRealizRepF;

implementation

uses DataModuleU, MainU, ShareU;

{$R *.dfm}

procedure TRealizRepF.FormCreate(Sender:TObject);
var i:Integer;
 begin
  Caption:=MFC;
  Flag:=0;
  FSr:='';

  BitBtn3.Visible:=Prm.UserRole=R_ADMIN;
  CheckBox3.Visible:=Prm.UserRole=R_ADMIN;
  BitBtn4.Visible:=Prm.UserRole=R_ADMIN;
  Label13.Visible:=Prm.UserRole=R_ADMIN;
  edStart.Visible:=Prm.UserRole=R_ADMIN;
  edEnd.Visible:=Prm.UserRole=R_ADMIN;

  dtStart.Date:=Date;
  dtEnd.Date:=Date;
  DBGrid1.DataSource.OnDataChange:=DSrc1DataChange;
  try

//   DM.Qr.SQL.Text:='select * from SprUser () where id in (select id_user from ArhCheks (nolock) group by id_user) order by Users';

   DM.Qr.Close;
   DM.Qr.SQL.CLear;
   DM.Qr.SQL.Add('select u.Users ');
   DM.Qr.SQL.Add('from SprUser u (nolock) ');
   DM.Qr.SQL.Add('      inner join ');
   DM.Qr.SQL.Add('     SprTypeUser t (nolock) on u.id_type=t.id_type ');
   DM.Qr.SQL.Add('where u.reserve=0 and ');
   DM.Qr.SQL.Add('      u.id_role<>2 and ');
   DM.Qr.SQL.Add('      t.CanLogin=1 ');
   DM.Qr.SQL.Add('order by u.users ');
   DM.Qr.Open;

   cbUsers.Clear;
   cbUsers.Items.Add('Все');
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     cbUsers.Items.Add(DM.Qr.FieldByName('Users').AsString);
    end;
   cbUsers.ItemIndex:=0;

   DM.Qr.Close;
   DM.Qr.SQL.Text:='select id_kassa from ArhCheks (nolock) group by id_kassa order by id_kassa';
   DM.Qr.Open;
   cbKassa.Clear;
   cbKassa.Items.Add('Все');
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     cbKassa.Items.Add(DM.Qr.FieldByName('id_kassa').AsString);
    end;
   cbKassa.ItemIndex:=0;

   bbEKKACheck.Visible:=(AnsiUpperCase(GetCompName)='SERGEY');
  except
  end;
  FilterRealiz;
 end;

procedure TRealizRepF.FilterRealiz;
var dt:Integer;
 begin
  try
   if CheckBox1.Checked then dt:=0 else dt:=40000;
   DM.spY_ChekList.Close;

   DM.spY_ChekList.Parameters.ParamValues['@dt1']:=dtStart.Date-dt;
   DM.spY_ChekList.Parameters.ParamValues['@dt2']:=dtEnd.Date+dt;
   DM.spY_ChekList.Parameters.ParamValues['@numbchek']:=GetIntValue(edNumb.Text);

   if cbKassa.ItemIndex=0 then
    DM.spY_ChekList.Parameters.ParamValues['@idkassa']:=GetIntValue('0')
   else
    DM.spY_ChekList.Parameters.ParamValues['@idkassa']:=GetIntValue(cbKassa.Text);

   DM.spY_ChekList.Parameters.ParamValues['@numcard']:=GetIntValue(edNumC.Text,-2);
   DM.spY_ChekList.Parameters.ParamValues['@names']:=GetStrValue(edNames.Text);
   DM.spY_ChekList.Parameters.ParamValues['@user']:=GetStrValue(cbUsers.Text);

   if CheckBox2.Checked then
    begin
     DM.spY_ChekList.Parameters.ParamValues['@Kur']:=1;
     lbKur.Visible:=True;
    end else begin
              DM.spY_ChekList.Parameters.ParamValues['@Kur']:=0;
              lbKur.Visible:=False;
             end;

   DM.spY_ChekList.Open;
   lbKur.Caption:=CurrToStrF(DM.spY_ChekList.FieldByName('SummAll').AsCurrency,ffFixed,2);
   ShowChek;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к архиву чеков: '+E.Message);
  end;
 end;

procedure TRealizRepF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TRealizRepF.btPerClick(Sender:TObject);
 begin
  FilterRealiz;
 end;

procedure TRealizRepF.ShowChek;
 begin
  try
   DM.spY_ShowChek.Close;
   if DM.spY_ChekList.IsEmpty then Exit;
//   ShowMessage(DM.spY_ChekList.FieldByName('Vzh').AsString);
   DM.spY_ShowChek.Parameters.ParamValues['@vzh']:=DM.spY_ChekList.FieldByName('Vzh').AsFloat;
   DM.spY_ShowChek.Parameters.ParamValues['@nch']:=DM.spY_ChekList.FieldByName('Numb_Chek').AsInteger;
   DM.spY_ShowChek.Parameters.ParamValues['@dt']:=DM.spY_ChekList.FieldByName('date_chek').AsDateTime;
   DM.spY_ShowChek.Open;
  except
  end;
 end;

procedure TRealizRepF.DSrc1DataChange(Sender:TObject; Field:TField);
 begin
  ShowChek;
 end;

procedure TRealizRepF.bbCopyChekClick(Sender:TObject);
var RC,i:Integer;
    SumCh,Sum,SumSk,SumSkPos:Real;
    Tb:TTableObj;
    NCh,k:Integer;
 begin
  if DM.spY_ChekList.IsEmpty then Exit;
  if DM.spY_ShowChek.IsEmpty then Exit;
  if DM.spY_ChekList.FieldByName('Numb_Chek').AsInteger>10000000 then Exit;
  try
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=5;
   PrintRep.Font.Style:=[fsBold,fsUnderLine];
//   PrintRep.AddText('КОПИЯ ЧЕКА'+#10#10);
//   PrintRep.Font.Size:=3;
   PrintRep.Font.Style:=[];
   PrintRep.AddText(Prm.AptekaNameRU+#10#10);
   Nch:=DM.spY_ChekList.FieldByName('Numb_Chek').AsInteger;
   if Nch<0 then Nch:=-1*NCh;
   PrintRep.AddText('№ Чека: '+IntToStr(NCh)+#10);
   PrintRep.AddText('Дата: '+FormatDateTime('dd.mm.yyyy hh:nn:ss',DM.spY_ChekList.FieldByName('Date_Chek').AsDateTime)+#10#10);
//   PrintRep.RightMargin:=1100;
   RC:=DM.spY_ShowChek.RecordCount;
   PrintRep.AddTable(5,RC+1);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('1000,8000,2000,2000,2000');
   for i:=1 to 5 do
    begin
     Tb.Cell[i,1].Align:=AL_CENTER;
     Tb.Cell[i,1].Font.Style:=[fsBold];
    end;
   Tb.Cell[1,1].AddText('№ пп');
   Tb.Cell[2,1].AddText('Наименование');
   Tb.Cell[3,1].AddText('Кол-во');
   Tb.Cell[4,1].AddText('Цена');
   Tb.Cell[5,1].AddText('Сумма');
//   Tb.Cell[6,1].AddText('Скидка');
   SumCh:=0; SumSk:=0;
   for i:=1 to RC do
    begin
     if i=1 then DM.spY_ShowChek.First else DM.spY_ShowChek.Next;
     Tb.Cell[1,i+1].Align:=AL_RIGHT;
     Tb.Cell[1,i+1].AddText(IntToStr(i));

     Tb.Cell[2,i+1].AddText(DM.spY_ShowChek.FieldByName('Names').AsString);

     Tb.Cell[3,i+1].Align:=AL_CENTER;
     Tb.Cell[3,i+1].AddText(DM.spY_ShowChek.FieldByName('Kol').AsString);

     Tb.Cell[4,i+1].Align:=AL_RIGHT;
     Tb.Cell[4,i+1].AddText(CurrToStrF(DM.spY_ShowChek.FieldByName('Cena').AsFloat,ffFixed,2));

     Tb.Cell[5,i+1].Align:=AL_RIGHT;
     Sum:=DM.spY_ShowChek.FieldByName('Cena').AsFloat*DM.spY_ShowChek.FieldByName('Kol').AsInteger;

     Tb.Cell[5,i+1].AddText(CurrToStrF(Sum,ffFixed,2));
     SumCh:=SumCh+Sum;
{
     Tb.Cell[6,i+1].Align:=AL_RIGHT;
     Tb.Cell[6,i+1].AddText(CurrToStrF(DM.spY_ShowChek.FieldByName('SumSkd').AsFloat,ffFixed,2));
}
     SumSk:=SumSk+DM.spY_ShowChek.FieldByName('SumSkd').AsCurrency;
    end;

   PrintRep.Font.Name:='Courier New';
   PrintRep.AddText(#10#10);
   PrintRep.Font.Style:=[fsBold];
   PrintRep.AddTable(2,3);
   Tb:=PrintRep.LastTable;
   Tb.SetBorders(1,1,2,3,EMPTY_BORDER);
   if SumSk>0 then
    begin
     Tb.Cell[1,1].AddText('Сумма:');
     Tb.Cell[1,2].AddText('Скидка:');
    end;
   Tb.Cell[1,3].AddText('Всего:');

   for i:=1 to 3 do Tb.Cell[2,i].Align:=AL_RIGHT;

   if SumSk>0 then
    begin
     Tb.Cell[2,1].AddText(CurrToStrF(SumCh,ffFixed,2));
     Tb.Cell[2,2].AddText(CurrToStrF(SumSk,ffFixed,2));
    end; 

   Tb.Cell[2,3].AddText(CurrToStrF(SumCh-SumSk,ffFixed,2));

   PrintRep.Font.Size:=7;
   PrintRep.AddText(#10#10#10+'=ОПЛАЧЕНО=');
   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования отчета: '+E.Message);
  end;
 end;

procedure TRealizRepF.FormResize(Sender:TObject);
 begin
  RisizeDBGrid(dbgChekInfo,40);
 end;

procedure TRealizRepF.FormActivate(Sender:TObject);
 begin
  Flag:=0;
  ShowChek;
  DBGrid1.SetFocus;
 end;

procedure TRealizRepF.DBGrid1KeyPress(Sender:TObject; var Key:Char);
 begin
  FindInDBG(TDBGrid(Sender),FSr,Key);
  Label10.Caption:=FSr;
 end;

procedure TRealizRepF.DBGrid1KeyDown(Sender:TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key in K_ARROW_KEYS then FSr:='';
 end;

procedure TRealizRepF.edNumbKeyPress(Sender: TObject; var Key: Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

procedure TRealizRepF.CheckBox1Click(Sender: TObject);
 begin
  dtStart.Enabled:=CheckBox1.Checked;
  dtEnd.Enabled:=CheckBox1.Checked;
 end;

procedure TRealizRepF.bbEKKACheckClick(Sender: TObject);
 begin
  if DM.spY_ChekList.IsEmpty then Exit;
  if DM.spY_ShowChek.IsEmpty then Exit;
  if DM.spY_ChekList.FieldByName('Numb_Chek').AsInteger<10000000 then Exit;
{  if DM.spY_ChekList.FieldByName('Date_Chek').AsDateTime<StrToDate(DateToStr(Date)) then
   begin
    MainF.MessBox('Нельзя пробить чек по EKKA задним числом!');
    Exit;
   end;
}
  Flag:=1;
  Close;
 end;

procedure TRealizRepF.BitBtn1Click(Sender:TObject);
var CP:TChekPos;
 begin
  try
   MainF.NumMediCard:=1;
   CP.Vzh:=StrToInt64(DM.spY_ChekList.FieldByName('Vzh').AsString);
   CP.NumbChek:=DM.spY_ChekList.FieldByName('Numb_Chek').AsInteger;
   CP.CardPref:=2720310001730;
   MainF.MediSendRealiz(CP);
  finally
   MainF.NumMediCard:=-1;
  end;
 end;

procedure TRealizRepF.BitBtn3Click(Sender:TObject);
var tFN,tZN,tPN,FirmName:String;
    Ty,i,Tg:Integer;
    IsBack:Boolean;
    BNCh:Integer;

 begin
  if (DM.spY_ChekList.IsEmpty) or (EKKA.EmulEKKA=False) or (Not (DM.spY_ChekList.FieldByName('kn').AsInteger in [1,2,7,8,9]))then Exit;

  IsBack:=DM.spY_ChekList.FieldByName('Summa').AsCurrency<0;

  try
   Tg:=TComponent(Sender).Tag;
   tFN:=EKKA.sFN;
   tZN:=EKKA.sZN;
   tPN:=EKKA.sPN;
   FirmName:=EKKA.FirmNameUA;

   EKKA.FirmNameUA:=Prm.FirmNameUA;

   EKKA.sFN:='3000220961';
   EKKA.sZN:='ТР1001011354';

   BNCh:=0; //94537;
//   EKKA.sPN:='000030772700';
   EKKA.IsCopy:=CheckBox3.Checked;
   if CheckBox3.Checked then
    EKKA.Copy_Chek:=DM.spY_ChekList.FieldByName('Numb_Chek').AsInteger;

   if IsBack then EKKA.fpSetBackReceipt(IntToStr(BNCh));
   if IsBack=False then
    EKKA.fpOpenFiscalReceipt(1,DM.spY_ChekList.FieldByName('Numb_Chek').AsInteger-1,Tg)
   else
    EKKA.fpOpenFiscalReceipt(2,DM.spY_ChekList.FieldByName('Numb_Chek').AsInteger-1,Tg);

    for i:=1 to DM.spY_ShowChek.RecordCount do
     begin
      if i=1 then DM.spY_ShowChek.First else DM.spY_ShowChek.Next;

      if Not (DM.spY_ShowChek.FieldByName('type_tov').AsInteger in [1,2]) then Continue;
      if IsBack=False then
       EKKA.fpAddSale(
                      Copy(DM.spY_ShowChek.FieldByName('Names').AsString,1,42),
                      DM.spY_ShowChek.FieldByName('Kol').AsInteger,
                      DM.spY_ShowChek.FieldByName('CenaP').AsCurrency,
                      1,
                      0,
                      3-DM.spY_ShowChek.FieldByName('type_tov').AsInteger,
                      0,
                      ''
                     )
      else
       EKKA.fpAddBack(
                      Copy(DM.spY_ShowChek.FieldByName('Names').AsString,1,42),
                      Abs(DM.spY_ShowChek.FieldByName('Kol').AsInteger),
                      DM.spY_ShowChek.FieldByName('CenaP').AsCurrency,
                      1,
                      0,
                      3-DM.spY_ShowChek.FieldByName('type_tov').AsInteger,
                      0,
                      ''
                     )
     end;
    Case DM.spY_ChekList.FieldByName('kn').AsInteger of
     1,7:Ty:=4;
       2:Ty:=2;
       8:Ty:=3;
       9:Ty:=1;
    end;
    EKKA.DateChek:=DM.spY_ChekList.FieldByName('Date_Chek').AsDateTime;
    //EKKA.fpCloseFiscalReceipt(DM.spY_ChekList.FieldByName('Summa').AsCurrency,Ty,DM.spY_ChekList.FieldByName('Summa').AsCurrency,0,False,Tg);
    EKKA.fpCloseFiscalReceipt(DM.spY_ChekList.FieldByName('Summa').AsCurrency,Ty,DM.spY_ChekList.FieldByName('Summa').AsCurrency,0,False,Tg,StrToIntDef(MainF.RRN,1),MainF.BankCard);

  finally
   EKKA.sFN:=tFN;
   EKKA.sZN:=tZN;
   EKKA.sPN:=tPN;
   EKKA.FirmNameUA:=FirmName;
  end;
 end;

procedure TRealizRepF.BitBtn4Click(Sender: TObject);
var i,N1,N2:Integer;
 begin
  N1:=StrToInt(edStart.Text);
  N2:=StrToInt(edEnd.Text);
  for i:=N1 to N2 do
   begin
    if DM.spY_ChekList.Locate('numb_chek',i,[]) then
     BitBtn3Click(Sender);
   end;
 end;

end.




