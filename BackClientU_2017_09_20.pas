unit BackClientU;

interface

uses
  Forms, StdCtrls, Grids, DBGrids, Buttons, Controls, Classes, ExtCtrls, Messages,
  MainU, SysUtils, Windows, EKKAU, Util, ShowTextU, ComCtrls;
//  , Variants, Graphics, PrintReport,
//  , Dialogs, ComCtrls, ComObj;

type

  TChekInfo=Record
             TableArh:String;
             ID_KASSA:Int64;
             Cena:Real;
             Kod_Name:Integer;
             Summa:Real;
             ID_User:Integer;
             VZH:Int64;
            end;

  TChekList=Array of TChekInfo;

  TBackClientF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edNumb: TEdit;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    dbgBack: TDBGrid;
    Label3: TLabel;
    bbBack: TBitBtn;
    lbSkd: TLabel;
    Label4: TLabel;
    lbSum: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    dtChekDate: TDateTimePicker;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgBackKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edNumbKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);

  private

    FList:TChekList;
    FID:Integer;
    FFatalError:Boolean;
    FDt: TDateTime;
    FSumChek:Currency;
    FSum:Real;
    FIsTerminal:Boolean;
    FTypeRecipt:Integer;
    FIsIApteka:Boolean;
    FIsStrah:Boolean;
    FIsMed:Boolean;

    function  ReOpen:Currency;

    procedure EnterKol;
    procedure SetVis(V:Boolean);
    procedure ClearTmpVozr(CP:TChekPos; P,TT:Byte);

  public

    VF:TVozrForm;

    property Dt:TDateTime read FDt write FDt;
    property ID:Integer read FID write FID;

  end;

var BackClientF:TBackClientF=nil;
    StartTerminal:Boolean;

implementation

uses
  DataModuleU, ShareU, ChekListU, FormForVozrU;

{$R *.dfm}

procedure TBackClientF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  FID:=-1;
  FFatalError:=False;
{
  bbBack.Enabled:=((Prm.AptekaID=4) and (Opt.KassaID=5)) or (Opt.EKKAAsPrinter=True);
  BitBtn2.Enabled:=Not ((Prm.AptekaID=4) and (Opt.KassaID=5)) and (Opt.EKKAAsPrinter=False);
}
//  bbBack.Enabled:= (Opt.EKKAAsPrinter=True);
//  BitBtn2.Enabled:=Opt.EKKAAsPrinter=False;
 end;

procedure TBackClientF.SetVis(V:Boolean);
 begin
  dbgBack.Enabled:=V;
 end;

procedure TBackClientF.BitBtn4Click(Sender: TObject);
var i:Integer;

 procedure AddToList(Arh:String);
 var CA,i:Integer;
  begin
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select vzh,ID_KASSA,Numb_Chek,Sum(Kod_Name) as Kol,Max(Cena) as Cena,id_user,            ');
   DM.Qr.SQL.Add('       IsNull(Sum(convert(numeric(8,2),kol*cena)),0)-                   ');
   DM.Qr.SQL.Add('       IsNull(Sum(SumSkd),0) as Summa');

   if StrToInt64(edNumb.Text)>10000000 then
    DM.Qr.SQL.Add('from '+Arh+' a (nolock) where Numb_chek='+edNumb.Text)
   else
   if Prm.AptekaID=240 then
    DM.Qr.SQL.Add('from '+Arh+' a (nolock) where Numb_chek='+edNumb.Text)
   else
    DM.Qr.SQL.Add('from '+Arh+' a (nolock) where Numb_chek='+edNumb.Text+' and Vzh='+IntToStr(MainF.VzhNum)           );

//   DM.Qr.SQL.Add(' and a.date_chek=(select Max(aa.date_chek) from ArhCheks aa (nolock) where aa.numb_chek=a.numb_chek and aa.vzh=a.vzh) ');
   if EKKA.TypeEKKA <> EKKA_N707 then
     DM.Qr.SQL.Add(' and a.date_chek=(select Max(aa.date_chek) from ArhCheks aa (nolock) where aa.numb_chek=a.numb_chek and aa.vzh=a.vzh) ')
   else
   begin
     DM.Qr.SQL.Add(' and a.date_chek>'''+FormatDateTime('YYYY-MM-DD',dtChekDate.Date-1)+'''');
     DM.Qr.SQL.Add(' and a.date_chek<'''+FormatDateTime('YYYY-MM-DD',dtChekDate.Date+1)+'''');
   end;

   DM.Qr.SQL.Add('group by vzh,ID_KASSA,Numb_Chek,id_user                                             ');
   DM.Qr.Open;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     CA:=High(FList)+1; SetLength(FList,CA+1);
     FList[CA].TableArh:=Arh;
     FList[CA].ID_KASSA:=DM.Qr.FieldByName('ID_KASSA').AsInteger;
     FList[CA].Kod_Name:=DM.Qr.FieldByName('Kol').AsInteger;
     FList[CA].Cena:=DM.Qr.FieldByName('Cena').AsFloat;
     FList[CA].Summa:=DM.Qr.FieldByName('Summa').AsFloat;
     FList[CA].ID_User:=DM.Qr.FieldByName('id_user').AsInteger;
     FList[CA].VZH:=StrToInt64(DM.Qr.FieldByName('Vzh').AsString);
    end;
  end;

 Begin
  if Not CheckInteger(edNumb.Text) then
   begin
    MainF.MessBox('Введите целое числовое значение номера чека!');
    edNumb.SetFocus;
    Exit;
   end;
  if Opt.EKKAAsPrinter then edNumb.Text:=IntToStr(-Abs(StrToInt(edNumb.Text)));

//  if MainF.VzhNum=Opt.KassaID then edNumb.Text:=IntToStr(-Abs(StrToInt(edNumb.Text)));
  try
   SetLength(FList,0);
   AddToList('ArhCheks');

   if High(FList)<0 then begin MainF.MessBox('Чеков с номером '+edNumb.Text+' не найдено либо он был пробит на другой кассе!'); Exit; end;
   if High(FList)>0 then
    begin
     ChekListF:=TChekListF.Create(Self);
     try
      ChekListF.SG.RowCount:=High(FList)+2;
      for i:=Low(FList) to High(FList) do
       begin
        ChekListF.SG.Cells[0,i+1]:=edNumb.Text;
        if FList[i].Kod_Name>1 then
         ChekListF.SG.Cells[1,i+1]:=CurrToStrF(FList[i].Summa,ffFixed,2)
        else
         ChekListF.SG.Cells[1,i+1]:=CurrToStrF(FList[i].Cena,ffFixed,2);
        ChekListF.SG.Cells[2,i+1]:=IntToStr(FList[i].Kod_Name);
       end;
      Application.ProcessMessages;
      ChekListF.ShowModal;
      if ChekListF.Flag=1 then ID:=ChekListF.SG.Row-1 else Exit;
     finally
      ChekListF.Free;
     end;
    end else ID:=0;
   if FList[ID].Kod_Name in [0,1,2] then
    begin

{
     MainF.MessBox('Выбранный вами чек является завершенным предоплатным чеком!'+#10+
                   'Повторно сделать возврат от покупателя по этому чеку нельзя!');
}

     MainF.MessBox('Выбранный вами чек является предоплатным чеком!'+#10+
                   'Возврат и продажа товаров по предоплате осуществляется через меню "Операции->Чек по предоплате"!');
     Exit;
    end;

{

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('delete from TMPVOZR where compname=host_name() and id_user='+IntToStr(Prm.UserID));
   DM.Qr.SQL.Add('insert into TmpVozr(ROW_ID,DATE_CHEK,NUMB_CHEK,ART_CODE,KOD_NAME,NAMES,KOL,CENA,CENA_SPR,KASSA_NUM,F_NDS,TYPE_TOV,ID_USER,ID_KASSA,SKD,SUMSKD,NUMCARD,COMPNAME,ISPRINT,ACCUMSUM,SPISSUM,VZH,SUMRECIPT,TYPERECIPT)');
   DM.Qr.SQL.Add('select a.ROW_ID,a.DATE_CHEK,a.NUMB_CHEK,b.ART_CODE,a.KOD_NAME,b.Names,a.KOL,a.CENA,b.CENA,a.KASSA_NUM,3-a.TYPE_TOV,a.TYPE_TOV,'+IntToStr(Prm.UserID)+',a.ID_KASSA,a.SKD,IsNull(a.SumSkd,0),a.NUMCARD,host_name(),a.IsPrint,a.AccumSum,a.SpisSum,a.vzh,a.cena_pilot,a.typerecipt');
   DM.Qr.SQL.Add('from '+FList[ID].TableArh+' a (nolock), SprTov b (nolock)');
   DM.Qr.SQL.Add('where a.type_tov<>99 and a.kod_name=b.kod_name and ');
   DM.Qr.SQL.Add(' a.Numb_Chek='+edNumb.Text+' and a.vzh='+IntToStr(FList[ID].VZH));
   DM.Qr.SQL.Add(' and b.art_code<>3 and a.date_chek=(select Max(aa.date_chek) from ArhCheks aa (nolock) where aa.numb_chek=a.numb_chek and aa.vzh=a.vzh) ');
   DM.Qr.ExecSQL;

}
   DM.Qr.Close;
//   DM.Qr.SQL.Text:='exec spY_GetChekForBack '+IntToStr(Prm.UserID)+','+edNumb.Text+','+IntToStr(FList[ID].VZH);
   if EKKA.TypeEKKA <> EKKA_N707 then
     DM.Qr.SQL.Text:='exec spY_GetChekForBack '+IntToStr(Prm.UserID)+','+edNumb.Text+','+IntToStr(FList[ID].VZH)
   else
     DM.Qr.SQL.Text:='exec spY_GetChekForBack '+IntToStr(Prm.UserID)+','+edNumb.Text+','+IntToStr(FList[ID].VZH)+', '''+FormatDateTime('YYYY-MM-DD',dtChekDate.Date)+'''';
   DM.Qr.Open;
   SetVis(True);


   ClientWidth:=699;
   Left:=(Screen.Width-Width) div 2;
   Top:=(Screen.Height-Height) div 2;

{
  ClientHeight:=313;
}
   FSum:=ReOpen;
   BitBtn3.Enabled:=True;
   if dbgBack.Enabled then dbgBack.SetFocus;

  except
   on E:Exception do
    begin
     ID:=-1;
     SetLength(FList,0);
     ClientWidth:=596;
     ClientHeight:=37;
     Left:=(Screen.Width-Width) div 2;
     Top:=(Screen.Height-Height) div 2;
     MainF.MessBox('Ошибка поиска чека: '+E.Message);
    end;
  end;
 End;

function TBackClientF.ReOpen:Currency;
var ROW_ID:Integer;
 begin
  lbSkd.Visible:=False;
  lbSum.Caption:='0.00';
  ROW_ID:=-1;
  if Not(DM.qrBack.IsEmpty) then ROW_ID:=DM.qrBack.FieldByName('ROW_ID').AsInteger;
  DM.qrBack.Close;
  DM.qrBack.SQL.Clear;
  DM.qrBack.SQL.Text:='select * from TmpVozr where compname=host_name() and id_user='+IntToStr(Prm.UserID);
  DM.qrBack.Open;
  if DM.qrBack.IsEmpty then Exit;

  FIsIApteka:=DM.qrBack.FieldByName('id_doctor').AsInteger>0;
  FIsStrah:=DM.qrBack.FieldByName('id_strah').AsInteger>0;

  FIsMed:=DM.qrBack.FieldByName('medname').AsString<>'';

//  ShowMessageI(BoolToInt(FIsStrah));

  FTypeRecipt:=DM.qrBack.FieldByName('TypeRecipt').AsInteger;

  if (DM.qrBack.FieldByName('kassa_num').AsInteger in [1,3]) then
   begin
    Height:=379;
    FIsTerminal:=False;
   end else begin
             Height:=409;
             FIsTerminal:=True;
            end;
  Left:=(Screen.Width-Width) div 2;
  Top:=(Screen.Height-Height) div 2;

  DM.Qr.Close;
  DM.Qr.SQL.Text:='select IsNull(Avg(Skd),0) as Skd from TmpVozr where compname=host_name() and id_user='+IntToStr(Prm.UserID);
  DM.Qr.Open;

  if DM.Qr.FieldByname('Skd').AsFloat>0 then
   begin
    lbSkd.Caption:='Скидка '+IntToStr(Round(DM.Qr.FieldByname('Skd').AsFloat))+'%';
    lbSkd.Visible:=True;
   end;

  DM.qrBack.Locate('ROW_ID',ROW_ID,[]);
  DM.Qr.Close;
  DM.Qr.SQL.Clear;

  if FList[ID].Kod_Name<>0 then
   begin
    DM.Qr.SQL.Add('select IsNull(Sum(convert(numeric(8,2),kol*cena)),0)-');
    DM.Qr.SQL.Add('       IsNull(Sum(SumSkd),0)- ');
    DM.Qr.SQL.Add('       IsNull(Sum(SumRecipt),0) as Summa');
   end else DM.Qr.SQL.Add('select IsNull(cena,0) as Summa');

  DM.Qr.SQL.Add('from TmpVozr');
  DM.Qr.SQL.Add('where compname=host_name() and id_user='+IntToStr(Prm.UserID));
  DM.Qr.Open;


  lbSum.Caption:=CurrToStrF(DM.Qr.FieldByName('Summa').AsFloat,ffFixed,2);
  FSumChek:=DM.Qr.FieldByName('Summa').AsCurrency;
  Result:=DM.Qr.FieldByName('Summa').AsFloat;

 end;

procedure TBackClientF.FormActivate(Sender:TObject);
 begin
  ClientWidth:=596;
  ClientHeight:=37;
  Left:=(Screen.Width-Width) div 2;
  Top:=(Screen.Height-Height) div 2;
  if EKKA.TypeEKKA = EKKA_N707 then dtChekDate.Visible:=true else dtChekDate.Visible:=false;
 end;

procedure TBackClientF.FormShortCut(var Msg:TWMKey; var Handled:Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

procedure TBackClientF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TBackClientF.EnterKol;
var Kol,Art_Code,id_zam:Integer;
    S:Currency;
    Res:String;
 begin
  if DM.qrBack.IsEmpty then Exit;

  try
   Art_Code:=0;
   Kol:=MainF.GetKolFromDialog(DM.qrBack.FieldByName('Names').AsString,DM.qrBack.FieldByName('Kol').AsInteger,Art_Code,id_zam,EN_SIMPLE);
   if Kol<0 then Exit;
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select Kol from '+FList[ID].TableArh+' where row_id='+DM.qrBack.FieldByName('ROW_ID').AsString;
   DM.Qr.Open;
   if Kol>=DM.Qr.FieldByName('Kol').AsInteger then
    begin
     if Kol>DM.Qr.FieldByName('Kol').AsInteger then
      Mainf.MessBox('Нельзя ввести количество большее, чем было в исходном списке!');
     Exit;
    end;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('update TmpVozr set Kol='+IntToStr(Kol)+',SumSkd=IsNull(convert(numeric(8,2),'+IntToStr(Kol)+'*cena*(skd/100.)),0) ');
   DM.Qr.SQL.Add('where row_id='+DM.qrBack.FieldByName('ROW_ID').AsString+' and compname=host_name() and id_user='+IntToStr(Prm.UserID));

   DM.Qr.SQL.Add('update TmpVozr set SumSkdP=case when id_doctor>0 or id_strah>0 or SumSkd<0 then SumSkd-(kol*cena-kol*convert(numeric(8,2),(kol*cena-IsNull(SumSkd,0))/kol)) ');
   DM.Qr.SQL.Add('		                            else IsNull(SumSkd,0) ');
   DM.Qr.SQL.Add('                           end ');
   DM.Qr.SQL.Add('where kol<>0 and row_id='+DM.qrBack.FieldByName('ROW_ID').AsString+' and compname=host_name() and id_user='+IntToStr(Prm.UserID));

   DM.Qr.SQL.Add('delete from TmpVozr where kol=0 and compname=host_name() and id_user='+IntToStr(Prm.UserID));
   DM.Qr.ExecSQL;

   S:=ReOpen;
//   BitBtn3.Enabled:=S=FSum;
  except
   Mainf.MessBox('Ошибка ввода количества!');
  end;
 end;

procedure TBackClientF.dbgBackKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Sender=nil then Exit;
  if Not TDBGrid(Sender).Enabled then Exit;
  if Key=VK_RETURN then EnterKol;
 end;

 // Очистка таблицы TmpVozr
procedure TBackClientF.ClearTmpVozr(CP:TChekPos; P,TT:Byte);

var SumDnepr:Currency;

 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   if P=1 then
    begin
     if CP.SumSpisDnepr>0 then
      begin

       if CP.SumChek>CP.SumSpisDnepr then SumDnepr:=CP.SumSpisDnepr
                                     else SumDnepr:=CP.SumChek;

       DM.Qr.SQL.Add('insert into CardsLog(NumCard,Summa,IsUnload,TypeCard,AccumSum,SumChek,Date_Chek)');
       DM.Qr.SQL.Add('select '+IntToStr(CP.NumCard)+',0,0,1,'+CurrToStr(SumDnepr)+',0,'''+FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz',CP.Date)+''' ');

       DM.Qr.SQL.Add('update a set              a.AccumSum=IsNull(a.AccumSum,0)+'+CurrToStr(SumDnepr));
       DM.Qr.SQL.Add('from Cards a');
       DM.Qr.SQL.Add('where a.numcard='+IntToSTr(CP.NumCard));

      end else begin
                DM.Qr.SQL.Add('update a set a.Summa=IsNull(a.Summa,0)-IsNull(b.Sum,0),');
                DM.Qr.SQL.Add('             a.SumMonth=IsNull(a.SumMonth,0)-IsNull(b.Sum-b.SumSkd,0),');
                DM.Qr.SQL.Add('             a.AccumSum=IsNull(a.AccumSum,0)-IsNull(b.AccumSum,0)');
                DM.Qr.SQL.Add('from ');
                DM.Qr.SQL.Add('(select NumCard, Sum(kol*cena) as Sum, Sum(IsNull(SumSkd,0)) as SumSkd, Sum(IsNull(AccumSum,0)-IsNull(SpisSum,0)) as AccumSum from TmpVozr where type_tov='+IntToStr(TT)+' and compname=host_name() and id_user='+IntToStr(Prm.UserID)+' group by numcard) b, ');
                DM.Qr.SQL.Add(' Cards a');
                DM.Qr.SQL.Add('where a.numcard=b.numcard ');

                DM.Qr.SQL.Add('insert into CardsLog(NumCard,Summa,IsUnload,TypeCard,AccumSum,SumChek,Date_Chek)');
                DM.Qr.SQL.Add('select NumCard,-Sum(kol*cena),0,IsNull((select Max(TypeCard) from Cards r where r.numcard=t.numcard),1),-Sum(IsNull(AccumSum,0)-IsNull(SpisSum,0)),-(Sum(kol*cena)-Sum(IsNull(SumSkd,0))),'''+FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz',CP.Date)+''' from TmpVozr t where t.type_tov='+IntToStr(TT)+' and compname=host_name() and id_user='+IntToStr(Prm.UserID)+' group by numcard ');
               end;
    end;
   DM.Qr.SQL.Add('delete from TmpVozr where type_tov='+IntToStr(TT)+' and compname=host_name() and id_user='+IntToStr(Prm.UserID));
//   DM.Qr.SQL.SaveToFile('BackCl.txt');
   DM.Qr.ExecSQL;
  except
   on E:Exception do
    raise EAbort.Create('Ошибка очистки чека: '+E.Message);
  end;
 end; {ClearTmpVozr}

procedure TBackClientF.bbBackClick(Sender: TObject);
var CP:TChekPos;
    AC,Kl,Ty,i,RC,j:Integer;
    Nm:String;
    B:Boolean;

 // Инициализация позиций чека
 procedure SetCP;
  begin
   CP.PSkd:=DM.qrBack.FieldByName('Skd').AsFloat;
   CP.NumCard:=StrToInt64(DM.qrBack.FieldByName('NumCard').AsString);

   CP.TypeOplatKur:=DM.qrBack.FieldByName('Kassa_Num').AsInteger;

   if DM.qrBack.FieldByName('Kassa_Num').AsInteger=3 then
    CP.TypeOplat:=TO_CASH
   else begin
         if DM.qrBack.FieldByName('Kassa_Num').AsInteger=7 then CP.TypeOplat:=TO_CASH else
         if DM.qrBack.FieldByName('Kassa_Num').AsInteger=8 then CP.TypeOplat:=TO_BEZNAL3 else
         if DM.qrBack.FieldByName('Kassa_Num').AsInteger=9 then CP.TypeOplat:=TO_BEZNAL1
                                                           else CP.TypeOplat:=DM.qrBack.FieldByName('Kassa_Num').AsInteger-1;
        end;

   if FList[ID].Kod_Name=0 then
    begin
     CP.Kod_Name:=2;
     CP.ArtName:='PREP_'+DM.qrBack.FieldByName('ROW_ID').AsString;
     Nm:=DM.qrBack.FieldByName('Names').AsString;
     Ac:=DM.qrBack.FieldByName('Art_code').AsInteger;
     CP.Kol:=0;
     Kl:=1;
    end else begin
         CP.Kod_Name:=DM.qrBack.FieldByName('Kod_Name').AsInteger;
         Ac:=DM.qrBack.FieldByName('Art_code').AsInteger;
         CP.ArtName:=Copy(DM.qrBack.FieldByName('Names').AsString,1,16);
         Nm:=DM.qrBack.FieldByName('Names').AsString; // CP.ArtName;
         CP.Kol:=-Abs(DM.qrBack.FieldByName('Kol').AsInteger);
         Kl:=CP.Kol;
        end;

   CP.Skd:=DM.qrBack.FieldByName('Skd').AsFloat;

   CP.Cena:=DM.qrBack.FieldByName('CenaP').AsFloat;
   CP.SumSkd:=DM.qrBack.FieldByName('SumSkdP').AsFloat;

{
   if (FIsIApteka) or (FISStrah) then
    begin
     CP.Cena:=DM.qrBack.FieldByName('CenaP').AsFloat;
     CP.SumSkd:=-DM.qrBack.FieldByName('SumSkdP').AsFloat;
    end else begin
}
{              CP.Cena:=DM.qrBack.FieldByName('Cena').AsFloat;
               CP.SumSkd:=-DM.qrBack.FieldByName('SumSkd').AsFloat;
}
//             end;
   CP.IsStrah:=FIsStrah;
   CP.IsMed:=FIsMed;

   if FiSStrah then
    begin
     CP.Fransh:=DM.qrBack.FieldByName('fransh').AsFloat;

     CP.id_strah:=DM.qrBack.FieldByName('id_strah').AsInteger;
     CP.nn_polis:=DM.qrBack.FieldByName('nn_polis').AsString;
     CP.dt_polis:=DM.qrBack.FieldByName('dt_polis').AsDateTime;
//     CP.dt_dostav:=DM.qrBack.FieldByName('dt_dostav').AsDateTime;
    end;

   if FIsMed then CP.SumDopl:=DM.qrBack.FieldByName('cena_pilot').AsFloat*DM.qrBack.FieldByName('Kol').AsInteger;

   CP.id_doctor:=DM.qrBack.FieldByName('id_doctor').AsInteger;
   CP.card_doctor:=DM.qrBack.FieldByName('card_doctor').AsString;

   CP.F_NDS:=DM.qrBack.FieldByName('F_NDS').AsInteger;
   CP.Type_Tov:=DM.qrBack.FieldByName('Type_Tov').AsInteger;
   CP.SumChekRecipt:=DM.qrBack.FieldByName('SumRecipt').AsCurrency;

   CP.SumChek:=CP.SumChek+Abs(Kl)*CP.Cena-Abs(CP.SumSkd)-CP.SumChekRecipt;

   CP.IsPrint:=DM.qrBack.FieldByName('IsPrint').AsInteger;
   CP.AccumSum:=-DM.qrBack.FieldByName('AccumSum').AsFloat;
   CP.SumSpis:=-DM.qrBack.FieldByName('SpisSum').AsFloat;

   Case CP.TypeOplat of
    TO_CASH:Ty:=4;
    TO_CHEK:Ty:=2;
    TO_BEZNAL3:Ty:=1;
    TO_BEZNAL1:Ty:=3;
   end;

  end; {SetCP}

 // Запись в ArhCheks, в зависимости от типа возврата (обычный, предоплатный)
 procedure InsertArh;
  begin
   try
    DM.InsertArhChek(CP);
    if FList[ID].Kod_Name=0 then
     begin
      DM.Qr.Close;
      DM.Qr.SQL.Text:='update ArhCheks set Kod_Name=1 where row_id='+DM.qrBack.FieldByName('ROW_ID').AsString;
      DM.Qr.ExecSQL;
     end;
   except
    on E:Exception do raise EAbort.Create(E.Message);
   end;
  end; {InsertArh}

 // Пробивка позиции возврата по кассе
 procedure RegChekPos;
  begin
//   ShowMessage(CurrToStrF(CP.SumSkd,ffFixed,2));
   if Not EKKA.fpAddBack(Nm,
                         Abs(Kl),
                         CP.Cena,
                         1,
                         AC,
                         CP.F_NDS,
                         -CP.SumSkd,
                         ''
                         ) then AbortM('Ошибка пробития позиции чека: '+EKKA.LastErrorDescr);
  end; {RegChekPos}

 // Ставим на остатки позиции возврата
 procedure UpdateSpr(t_tov:Byte);
 var Vn1,Pn1,Vn2,Pn2:String;
  begin
   if FList[ID].Kod_Name=0 then Exit;
   try

    Vn1:=GetNewNomNakl(DM.Qr,'Впр-00000000');
    Pn1:=GetNewNomNakl(DM.Qr,'Ппр-00000000');
    Vn2:='Впр-'+IntToStrF(StrToInt(Copy(Vn1,5,8))+1,8);
    Pn2:='Ппр-'+IntToStrF(StrToInt(Copy(Pn1,5,8))+1,8);
    DM.spY_ReocBackClient.Close;
    DM.spY_ReocBackClient.Parameters.ParamValues['@piduser']:=Prm.UserID;
    DM.spY_ReocBackClient.Parameters.ParamValues['@vn1']:=Vn1;
    DM.spY_ReocBackClient.Parameters.ParamValues['@pn1']:=Pn1;
    DM.spY_ReocBackClient.Parameters.ParamValues['@vn2']:=Vn2;
    DM.spY_ReocBackClient.Parameters.ParamValues['@pn2']:=Pn2;
    DM.spY_ReocBackClient.Parameters.ParamValues['@t_tov']:=t_tov;
    DM.spY_ReocBackClient.ExecProc;

    if DM.spY_ReocBackClient.Parameters.ParamValues['@RETURN_VALUE']<>777 then Abort;
   except
    on E:Exception do raise EAbort.Create('Ошибка обновления справочника товаров: '+E.Message);
   end;
  end; {UpdateSpr}

 Begin
  B:=MainF.cbEKKA.Checked;
  if DM.qrBack.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите сделать возврат?',52)<>ID_YES then Exit;
  if DM.qrBack.FieldByName('Kassa_Num').AsInteger in [2,4,6,8,9] then
   begin
    if MainF.MessBox('Внимание! Возврат будет сделан по безналичному расчету!'#10#10'Выдавать покупателю НАЛИЧНЫЕ деньги из кассы НЕ НУЖНО!!!'#10#10+
                  'Перед тем как делать этот возврат по компьютеру необходимо было сделать возврат денег по терминалу! Если вы этого не сделали нажмите "НЕТ"!',52)<>ID_YES then Exit;
   end;
  try
   if (StrToInt64(edNumb.Text)>10000000) then
    begin
     MainF.cbEKKA.Checked:=True;
    end;
   dbgBack.Visible:=False;

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select type_tov from TmpVozr where compname=host_name() and id_user='+IntToStr(Prm.UserID)+' group by type_tov';
   DM.QrEx.Open;

   for j:=1 to DM.QrEx.RecordCount do
    begin
//     DM.ADOCo.BeginTrans;

     try
      if j=1 then DM.QrEx.First else DM.QrEx.Next;
      if Not (EKKA.fpGetStatus) then AbortM(EKKA.LastErrorDescr);

      if StrToInt64(edNumb.Text)>10000000 then CP.ID_Kassa:=FList[ID].ID_KASSA
                                          else CP.ID_Kassa:=Opt.KassaID;

      if (EKKA.UseEKKA) or (EKKA.EmulEKKA) then
       begin
        EKKA.fpCancelFiscalReceipt;

        if EKKA.ReceiptNumber<0 then raise EAbort.Create('Ошибка определения номера чека');
        CP.NumbChek:=EKKA.ReceiptNumber+1;

        if Not EKKA.fpSetBackReceipt(edNumb.Text) then AbortM('Ошибка определения номера возвратного чека: '+EKKA.LastErrorDescr);
        if Not EKKA.fpOpenFiscalReceipt(CH_BACK) then AbortM('Ошибка открытия чека: '+EKKA.LastErrorDescr);

        CP.Vzh:=MainF.VzhNum;
        CP.VzhSafe:=CP.Vzh;

       end else begin

                 if StrToInt64(edNumb.Text)>10000000 then CP.NumbChek:=GetNewNumbChek(1)
                                                     else CP.NumbChek:=GetNewNumbChek;

                 if CP.NumbChek=0 then begin MainF.MessBox('Ошибка определения номера чека!'); Exit; end;
                 CP.Vzh:=CP.ID_Kassa;

                end;

      RC:=DM.qrBack.RecordCount;
      CP.Date:=DM.GetServerDate;
      CP.ID_User:=FList[ID].ID_User;

      CP.SumChek:=0;

      CP.SumSpisDnepr:=0;
      if (DM.qrBack.FieldByName('NumCard').AsInteger>=1656071) and (DM.qrBack.FieldByName('NumCard').AsInteger<=1657430) then //социальная программа днепр
       begin
        DM.QrEx1.Close;
        DM.QrEx1.SQL.Text:='select Sum(Summ) as Summ from ArhSertif where numcard=55000'+DM.qrBack.FieldByName('NumCard').AsString+
                          ' and vzh='+DM.qrBack.FieldByName('Vzh').AsString+' and numb_chek='+DM.qrBack.FieldByName('Numb_Chek').AsString;
        DM.QrEx1.Open;

        CP.SumSpisDnepr:=DM.QrEx1.FieldByName('Summ').AsCurrency;
       end;

      for i:=1 to RC do
       begin
        if i=1 then DM.qrBack.First else DM.qrBack.Next;
        if DM.qrBack.FieldByName('Type_Tov').AsInteger<>DM.QrEx.FieldByName('Type_Tov').AsInteger then Continue;
        SetCP;
        InsertArh;
        RegChekPos;
       end;

//      CP.SumChek:=FSumChek;
      UpdateSpr(DM.QrEx.FieldByName('Type_Tov').AsInteger);

      ClearTmpVozr(CP,1,DM.QrEx.FieldByName('Type_Tov').AsInteger);
//      ShowMessage(CurrToStr(CP.SumChek)+' | '+IntToStr(Ty)+' | '+CurrToStr(CP.SumSpisDnepr));
//      ShowMessage(CurrToStr(CP.SumChek)+' | '+IntToStr(Ty)+' | '+CurrToStr(CP.SumDopl));

      if (CP.IsMed) and (CP.SumChek-CP.SumDopl>0) then
       begin
        EKKA.fpCloseFiscalReceipt(CP.SumDopl,Ty,CP.SumChek,CP.SumChek-CP.SumDopl,False);
       end else
      if (CP.IsStrah) and (CP.SumChek-CP.Fransh>0) and (CheckBox2.Checked=False) then
       begin
        EKKA.fpCloseFiscalReceipt(CP.Fransh,Ty,CP.SumChek,CP.SumChek-CP.Fransh,False);
       end else
      if FTypeRecipt>0 then
       begin
//        ShowMessage(CurrToStr(CP.SumChek)+' | '+CurrToStr(CP.SumChekRecipt));
        EKKA.fpCloseFiscalReceipt(0,Ty,CP.SumChek,CP.SumChekRecipt,True);
       end else
      if CP.SumSpisDnepr>0 then
       begin

        if CP.SumChek>CP.SumSpisDnepr then
         begin
          if Not EKKA.fpCloseFiscalReceipt(CP.SumChek,Ty,CP.SumChek,CP.SumSpisDnepr,True) then AbortM('Ошибка закрытия чека: '+EKKA.LastErrorDescr+' | '+EKKA.LastError)
         end else begin
                   if Not EKKA.fpCloseFiscalReceipt(0,Ty,CP.SumChek,CP.SumChek,True) then AbortM('Ошибка закрытия чека: '+EKKA.LastErrorDescr+' | '+EKKA.LastError);
                  end;

       end else begin
                 if Not EKKA.fpCloseFiscalReceipt(CP.SumChek,Ty,CP.SumChek) then AbortM('Ошибка закрытия чека: '+EKKA.LastErrorDescr+' | '+EKKA.LastError);
                end;

      try
 //    DM.ADOCo.CommitTrans;

       if EKKA.EmulEKKA then EKKA.fpSetBackReceipt(edNumb.Text);
       EKKA.fpCheckCopy;

       if (FIsTerminal=False) and (Prm.AptekaID<>240) and (Prm.OptCena=False) and (FIsStrah=False) and (FIsIApteka=False) then
        begin

         DM.Qr.Close;
         DM.Qr.SQL.Text:='exec spY_MakeVzrAfterBackCl '+IntToStr(CP.NumbChek)+','+IntToStr(CP.Vzh);
         DM.Qr.Open;

         ShowText('По данному возврату от покупателя был автоматически сформирован возврат на склад.'+#10+
                  'Пожалуйста, соберите товар по накладной '+DM.Qr.FieldByName('nn_nakl').AsString+' за сегодняшнее число и передайте на склад!');
        end;

       if j=DM.QrEx.RecordCount then
        begin
         MainF.MessBox('Возврат сделан успешно!',64);
         MainF.FilterSklad;
         Close;
        end;

      except
       // AbortM('Ошибка фиксации записи в архив чеков!');
       raise;
      end
     except
      on E:Exception do
       begin
        FFatalError:=True;
//        DM.ADOCo.RollBackTrans;
        EKKA.fpCancelFiscalReceipt;
        ShowExceptMessage(E);
       end;
    end;
   end;
  finally
   MainF.cbEKKA.Checked:=B;
   dbgBack.Visible:=True;
   TryWriteToJournal;
  end;
 End;

procedure TBackClientF.FormClose(Sender: TObject; var Action: TCloseAction);
var CP:TChekPos;
 begin
  DM.Qr.Close;
  DM.Qr.SQL.Clear;
  DM.Qr.SQL.Add('delete from TmpVozr where compname=host_name() and id_user='+IntToStr(Prm.UserID));
  DM.Qr.ExecSQL;
//  ClearTmpVozr(CP,0);
 end;

procedure TBackClientF.edNumbKeyDown(Sender:TObject; var Key:Word;  Shift:TShiftState);
 begin
  if Key=VK_RETURN then BitBtn4Click(BitBtn4);
 end;

procedure TBackClientF.BitBtn2Click(Sender:TObject);
 begin

  try

   FormForVozrF:=TFormForVozrF.Create(Self);
   try

    if StrToFloat(lbSum.Caption)<100 then
     begin
      FormForVozrF.Height:=159;
      FormForVozrF.Top:=(Screen.Height-FormForVozrF.Height) div 2;
      FormForVozrF.VF.IsSimpl:=True;
      FormForVozrF.Edit9.Visible:=False;
      FormForVozrF.Edit4.Visible:=False;
      FormForVozrF.Edit10.Visible:=False;
      FormForVozrF.Edit11.Visible:=False;
      FormForVozrF.ComboBox3.Visible:=False;
     end;

    Application.ProcessMessages;
    FormForVozrF.ShowModal;
    if FormForVozrF.Flag<>1 then  Exit;
    VF:=FormForVozrF.VF;
   finally
    FormForVozrF.Free;
   end;

  except
   Exit;
  end;

  VF.Summ:=StrToCurr(lbSum.Caption);
  VF.NumbChek:=StrToInt(edNumb.Text);

  FB.NumCard:=0;
  FB.FIO:=VF.F+' '+VF.N+' '+VF.O;
  FB.DateR:=DateToStr(VF.DateR);
  FB.Dt:=Dt;

  bbBack.Enabled:=True; //
  PrintBlankForBack(VF,Dt);

  if StrToFloat(lbSum.Caption)>=100 then MainF.PrintBlankForRegCard(FB);

 end;

procedure TBackClientF.BitBtn3Click(Sender: TObject);
var //Terminal:Variant;
    N:Integer;
    Sum:Currency;

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

 Begin

  if BitBtn3.Tag=2 then begin StartTerminal:=False; Exit; end;
  if MainF.MessBox('Вы действительно хотите совершить возврат по терминалу?',52)<>ID_YES then Exit;
  try
   try
    StartTerminal:=True;
    BitBtn3.Tag:=2;
    BitBtn3.Caption:='Прервать возврат по терминалу';

{
    Terminal:=CreateOleObject('ECRCommX.ECRLibSgn');
    Terminal.SetUserTimeOut(40);
    Terminal.SetCommNum(Opt.NumPortTerminal,115200);

    tWait;
}
    if StartTerminal=True then
     begin
      if CheckBox1.Checked then
       Sum:=Round(0.98*StrToCurr(lbSum.Caption)*100)
      else
       Sum:=Round(StrToCurr(lbSum.Caption)*100);
      Terminal.PosRefund(Sum,0,' ');
     end;

    tWait;
    if (Terminal.GetLastResult=1) or (StartTerminal=False) then
     begin
      MainF.MessBox('Возврат прерван. Убедитесь по чекам, которые выдал терминал прошел возврат или нет!');
     end else begin
               // CP.SumOplata:=0.01*Terminal.getTotalAmount;
               // CP.IsTerminal:=True;
               MainF.MessBox('Возврат по терминалу прошел успешно. Убедитесь по чекам, которые выдал терминал прошел возврт или нет!',64);
              end;

   finally
    BitBtn3.Caption:='Возврат по терминалу';
    StartTerminal:=False;
    BitBtn3.Tag:=1;
   end;
  except
   on E:Exception do MainF.MessBox('Ошибка возврат по терминалу: '+E.Message);
  end;
 end;

procedure TBackClientF.Edit1KeyPress(Sender: TObject; var Key: Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

end.




