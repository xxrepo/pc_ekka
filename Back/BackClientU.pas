unit BackClientU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Util, Grids, DBGrids;

type

  TChekInfo=Record
             TableArh:String;
             ID_KASSA:Integer;
             Cena:Real;
             Kod_Name:Integer;
             Summa:Real;
            end;

  TChekList=Array of TChekInfo;

  TBackClientF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edNumb: TEdit;
    BitBtn4: TBitBtn;
    lbNum: TLabel;
    edVZH: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    dbgBack: TDBGrid;
    Label3: TLabel;
    bbBack: TBitBtn;
    lbSkd: TLabel;
    Label4: TLabel;
    lbSum: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgBackKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

    FVZHNum:String;
    FList:TChekList;
    FID:Integer;
    FFatalError:Boolean;

    procedure ReOpen;
    procedure EnterKol;
    procedure SetVis(V:Boolean);
    procedure ClearTmpVozr;

  public

    property VZHNum:String read FVZHNum write FVZHNum;
    property ID:Integer read FID write FID;

  end;

var BackClientF:TBackClientF=nil;

implementation

uses MainU, DataModuleU, ShareU, ChekListU, Marry301U;

{$R *.dfm}

procedure TBackClientF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  FID:=-1;
  FFatalError:=False;
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
   DM.Qr.SQL.Add('select ID_KASSA,Numb_Chek,Sum(Kod_Name) as Kol,Max(Cena) as Cena,            ');
   DM.Qr.SQL.Add('       IsNull(Sum(convert(numeric(8,2),kol*cena)),0)-                   ');
   DM.Qr.SQL.Add('       IsNull(Sum(convert(numeric(8,2),kol*cena*(skd/100.))),0) as Summa');
   DM.Qr.SQL.Add('from '+Arh+' where Numb_chek='+edNumb.Text                                );
   DM.Qr.SQL.Add('group by ID_KASSA,Numb_Chek                                             ');
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
    end;
  end;

 Begin
  if Not CheckInteger(edNumb.Text) then
   begin
    MainF.MessBox('Введите целое числовое значение номера чека!');
    edNumb.SetFocus;
    Exit;
   end;
  if lbNum.Caption+edVZH.Text<>'ВЖ'+VZHNum then
   begin
    MainF.MessBox('Заводской номер текущего кассового аппарата не совпадает с введеным!'+#10+
                  'Убедитесь в том, что данный чек был пробит на этом кассовом аппарате и повторите ввод!');
    edVZH.SetFocus;
    Exit;
   end;
  try
   SetLength(FList,0);
   AddToList('ArhCheks');
   AddToList('ExpCheks');
   if High(FList)<0 then begin MainF.MessBox('Чеков с номером '+edNumb.Text+' не найдено!'); Exit; end;
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
      ChekListF.ShowModal;
      if ChekListF.Flag=1 then ID:=ChekListF.SG.Row-1 else Exit;
     finally
      ChekListF.Free;
     end;
    end else ID:=0;
   if FList[ID].Kod_Name=1 then
    begin
     MainF.MessBox('Выбранный вами чек является завершенным предоплатным чеком!'+#10+
                   'Повторно сделать возврат от покупателя по этому чеку нельзя!');
     Exit;
    end;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('delete from TMPVOZR where id_user='+IntToStr(Prm.UserID));
   DM.Qr.SQL.Add('insert into TmpVozr(ROW_ID,DATE_CHEK,NUMB_CHEK,ART_CODE,KOD_NAME,NAMES,KOL,CENA,KASSA_NUM,F_NDS,TYPE_TOV,ID_USER,ID_KASSA,SKD,SUMSKD,NUMCARD)');

   if FList[ID].Kod_Name=0 then
    begin
     SetVis(False);
     DM.Qr.SQL.Add('select ROW_ID,DATE_CHEK,NUMB_CHEK,0,KOD_NAME,''Передплата за лiкарськi засоби'',KOL,CENA,KASSA_NUM,2,TYPE_TOV,'+IntToStr(Prm.UserID)+',ID_KASSA,SKD,IsNull(convert(numeric(8,2),KOL*CENA*(SKD/100.)),0),NUMCARD');
     DM.Qr.SQL.Add('from '+FList[ID].TableArh+' a');
     DM.Qr.SQL.Add('where ');
    end else begin
              SetVis(True);
              DM.Qr.SQL.Add('select a.ROW_ID,a.DATE_CHEK,a.NUMB_CHEK,b.ART_CODE,a.KOD_NAME,b.Names,a.KOL,a.CENA,a.KASSA_NUM,b.F_NDS,a.TYPE_TOV,'+IntToStr(Prm.UserID)+',a.ID_KASSA,a.SKD,IsNull(convert(numeric(8,2),a.KOL*a.CENA*(a.SKD/100.)),0),a.NUMCARD');
              DM.Qr.SQL.Add('from '+FList[ID].TableArh+' a, SprTov b');
              DM.Qr.SQL.Add('where a.kod_name=b.kod_name and ');
             end;
   DM.Qr.SQL.Add(' a.Numb_Chek='+edNumb.Text+' and a.id_kassa='+IntToStr(FList[ID].ID_KASSA));
   DM.Qr.ExecSQL;
   ClientWidth:=699;
   ClientHeight:=349;
   Left:=(Screen.Width-Width) div 2;
   Top:=(Screen.Height-Height) div 2;
   ReOpen;
   if dbgBack.Enabled then dbgBack.SetFocus;
  except
   ID:=-1;
   SetLength(FList,0);
   ClientWidth:=596;
   ClientHeight:=73;
   Left:=(Screen.Width-Width) div 2;
   Top:=(Screen.Height-Height) div 2;
   MainF.MessBox('Ошибка поиска чека!');
  end;
 End;

procedure TBackClientF.ReOpen;
var ROW_ID:Integer;
 begin
  lbSkd.Visible:=False;
  lbSum.Caption:='0.00';
  ROW_ID:=-1;
  if Not(DM.qrBack.IsEmpty) then ROW_ID:=DM.qrBack.FieldByName('ROW_ID').AsInteger;
  DM.qrBack.Close;
  DM.qrBack.SQL.Clear;
  DM.qrBack.SQL.Text:='select * from TmpVozr where id_user='+IntToStr(Prm.UserID);
  DM.qrBack.Open;
  if DM.qrBack.IsEmpty then Exit;
  DM.Qr.Close;
  DM.Qr.SQL.Text:='select IsNull(Avg(Skd),0) as Skd from TmpVozr where id_user='+IntToStr(Prm.UserID);
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
    DM.Qr.SQL.Add('       IsNull(Sum(convert(numeric(8,2),kol*cena*(skd/100.))),0) as Summa');
   end else DM.Qr.SQL.Add('select IsNull(cena,0) as Summa');
  DM.Qr.SQL.Add('from TmpVozr');
  DM.Qr.SQL.Add('where id_user='+IntToStr(Prm.UserID));
  DM.Qr.Open;
  lbSum.Caption:=CurrToStrF(DM.Qr.FieldByName('Summa').AsFloat,ffFixed,2);
 end;

procedure TBackClientF.FormActivate(Sender: TObject);
 begin
  lbNum.Caption:='ВЖ'+Copy(VZHNum,1,6);
  ClientWidth:=596;
  ClientHeight:=73;
  Left:=(Screen.Width-Width) div 2;
  Top:=(Screen.Height-Height) div 2;
 end;

procedure TBackClientF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

procedure TBackClientF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TBackClientF.EnterKol;
var Kol:Integer;
 begin
  if DM.qrBack.IsEmpty then Exit;
  try
   Kol:=MainF.GetKolFromDialog(DM.qrBack.FieldByName('Names').AsString,DM.qrBack.FieldByName('Kol').AsInteger);
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
   DM.Qr.SQL.Add('where row_id='+DM.qrBack.FieldByName('ROW_ID').AsString+' and id_user='+IntToStr(Prm.UserID));
   DM.Qr.SQL.Add('delete from TmpVozr where kol=0 and id_user='+IntToStr(Prm.UserID));
   DM.Qr.ExecSQL;
   ReOpen;
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
procedure TBackClientF.ClearTmpVozr;
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Text:='delete from TmpVozr where id_user='+IntToStr(Prm.UserID);
   DM.Qr.ExecSQL;
  except
   raise EAbort.Create('Ошибка очистки чека!');
  end;
 end; {ClearTmpVozr}

procedure TBackClientF.bbBackClick(Sender: TObject);
var CP:TChekPos;
    Kl,Ty,i,RC:Integer;
    Nm:String;

 // Инициализация позиций чека
 procedure SetCP;
  begin
   CP.PSkd:=DM.qrBack.FieldByName('Skd').AsFloat;
   CP.NumCard:=DM.qrBack.FieldByName('NumCard').AsInteger;
   CP.TypeOplat:=DM.qrBack.FieldByName('Kassa_Num').AsInteger-1;
   if FList[ID].Kod_Name=0 then
    begin
     CP.Kod_Name:=2;
     CP.ArtName:='PREP_'+DM.qrBack.FieldByName('ROW_ID').AsString;
     Nm:=DM.qrBack.FieldByName('Names').AsString;
     CP.Kol:=0;
     Kl:=1;
    end else begin
         CP.Kod_Name:=DM.qrBack.FieldByName('Kod_Name').AsInteger;
         CP.ArtName:=Copy(DM.qrBack.FieldByName('Art_Code').AsString+' '+DM.qrBack.FieldByName('Names').AsString,1,16);
         Nm:=CP.ArtName;
         CP.Kol:=-Abs(DM.qrBack.FieldByName('Kol').AsInteger);
         Kl:=CP.Kol;
        end;
   CP.Skd:=DM.qrBack.FieldByName('Skd').AsFloat;
   CP.Cena:=DM.qrBack.FieldByName('Cena').AsFloat;
   CP.SumSkd:=DM.qrBack.FieldByName('SumSkd').AsFloat;

   CP.F_NDS:=DM.qrBack.FieldByName('F_NDS').AsInteger;
   CP.Type_Tov:=DM.qrBack.FieldByName('Type_Tov').AsInteger;
   Case CP.TypeOplat of
    TO_CASH:Ty:=4;
    TO_CHEK:Ty:=2;
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
    raise EAbort.Create('Ошибка записи в архив чеков!');
   end;
  end; {InsertArh}

 // Пробивка позиции возврата по кассе
 procedure RegChekPos;
  begin
   if Not Marry301.fpAddBack(Nm,
                             Abs(Kl),
                             CP.Cena,
                             1,
                             CP.F_NDS,
                             -Abs(CP.SumSkd),
                             ''
                             ) then AbortM('Ошибка пробития позиции чека: '+Marry301.LastErrorDescr);
  end; {RegChekPos}

 // Ставим на остатки позиции возврата
 procedure UpdateSpr;
  begin
   if FList[ID].Kod_Name=0 then Exit;
   try
    DM.Qr.Close;
    DM.Qr.SQL.Clear;
    DM.Qr.SQL.Add('update SprTov set ostat=ostat+b.kol');
    DM.Qr.SQL.Add('from SprTov a, TmpVozr b');
    DM.Qr.SQL.Add('where a.kod_name=b.kod_name and ');
    DM.Qr.SQL.Add('      b.id_user='+IntToStr(Prm.UserID));
    DM.Qr.ExecSQL;
   except
    raise EAbort.Create('Ошибка обновления справочника товаров');
   end;
  end; {UpdateSpr}

 Begin
  if DM.qrBack.IsEmpty then Exit;
  if Not (DM.qrBack.FieldByName('Kassa_Num').AsInteger) in [1,2] then
   begin
    MainF.MessBox('По данной форме оплаты нельзя оформить возвратный чек!');
    Exit;
   end;
  if MainF.MessBox('Вы действительно хотите сделать возврат от покупателя на сумму '+lbSum.Caption+'?',52)<>ID_YES then Exit;
  try
   dbgBack.Visible:=False;
   DM.ADOCo.BeginTrans;
   try
    if Not (Marry301.fpGetStatus) then AbortM(Marry301.LastErrorDescr);
    if Marry301.UseEKKA then
     if Marry301.KeyPosition<>KEY_W then
      begin
       MainF.MessBox('Переведите ключ в положение [P]!');
       Exit;
      end;
    Marry301.fpCancelFiscalReceipt;
    if Marry301.ReceiptNumber<0 then raise EAbort.Create('Ошибка определения номера чека');
    CP.NumbChek:=Marry301.ReceiptNumber+1;
    if Not Marry301.fpSetBackReceipt(edNumb.Text) then AbortM('Ошибка определения номера возвратного чека: '+Marry301.LastErrorDescr);
    if Not Marry301.fpOpenFiscalReceipt then AbortM('Ошибка открытия чека: '+Marry301.LastErrorDescr);
    RC:=DM.qrBack.RecordCount;
    CP.DateNakl:=DM.GetServerDate;
    CP.ID_User:=Prm.UserID;
    CP.ID_Kassa:=Opt.KassaID;
    for i:=1 to RC do
     begin
      if i=1 then DM.qrBack.First else DM.qrBack.Next;
      SetCP;
      InsertArh;
      RegChekPos;
     end;
    UpdateSpr;
    ClearTmpVozr;
    if Not Marry301.fpCloseFiscalReceipt(StrToCurr(lbSum.Caption),Ty) then AbortM('Ошибка закрытия чека: '+Marry301.LastErrorDescr);
    try
     DM.ADOCo.CommitTrans;
     MainF.MessBox('Возврат сделан успешно!',64);
     MainF.FilterSklad;
     Close;
    except
     raise EAbort.Create('Ошибка фиксации записи в архив чеков!');
    end
   except
    on E:Exception do
     begin
      FFatalError:=True;
      DM.ADOCo.RollBackTrans;
      Marry301.fpCancelFiscalReceipt;
      if E.Message<>'' then MainF.MessBox(E.Message) else MainF.MessBox('Ошибка формирования возрата от покупателя!');
     end;
   end;
  finally
   dbgBack.Visible:=True;
  end;
 End;

procedure TBackClientF.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  ClearTmpVozr;
 end;

end.
