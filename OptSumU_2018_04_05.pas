unit OptSumU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, Buttons, Util, EKKAU, Grids, DBGrids, DB;

type
  TOptSumF = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lbCap: TLabel;
    lbName: TLabel;
    edName: TEdit;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    lbSr: TLabel;
    Panel2: TPanel;
    ListBox1: TListBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;

    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
    procedure Edit1KeyPress(Sender:TObject; var Key:Char);
    procedure FormActivate(Sender:TObject);
    procedure FormCreate(Sender:TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1Exit(Sender: TObject);

  private

    FFlag:Integer;

  public

    property Flag:Integer read FFlag write FFlag;

  end;

var OptSumF:TOptSumF;

implementation

uses Marry301U, MainU, DataModuleU, ShareU, ShowTextU;

{$R *.dfm}

procedure TOptSumF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TOptSumF.BitBtn1Click(Sender: TObject);
var Nm,Mess:String;
    i,F_NDS:Integer;
    CP:TChekPos;
    Sum:Real;
 begin
  ShowText('Предупреди покупателя! Данный чек  предоплаты должен быть возвращен покупателем в аптеку провизору во время получения заказанного товара.');
  Case Flag of
   SM_OPT:Mess:='Вы действительно хотите пробить данную сумму по кассовому аппарату?';
   SM_PREP:begin
            if (MainF.cbEKKA.Checked) and (EKKA.EmulEKKA=False) then
             begin
              MainF.MessBox('Кассовый аппарат не используется! Пробитие невозможно!');
              Exit;
             end;
            Mess:='Вы действительно хотите пробить сумму предоплаты?';
           end;
  end;
  if MainF.MessBox(Mess,52)<>ID_YES then Exit;

  if Not CheckReal(Edit1.Text) then
   begin
    MainF.MessBox('Введите числовое значение суммы!');
    Edit1.SetFocus;
    Exit;
   end else Sum:=StrToCurr(CurrToStrF(StrToCurr(Edit1.Text),ffFixed,2));
  F_NDS:=2;
  Case Flag of
   SM_OPT:begin
           if rb1.Checked then
            begin
             Nm:='Опт на Есенина без НДС';
             F_NDS:=2;
            end else begin
                      Nm:='Опт на Есенина с НДС';
                      F_NDS:=1;
                     end;
          end;
   SM_PREP:begin
            Nm:='Передплата за лiкарськi засоби';
            F_NDS:=2;
           end;
  end;

  try
   if Not EKKA.fpGetStatus then AbortM(EKKA.LastErrorDescr);

   if Flag=SM_PREP then DM.ADOCo.BeginTrans;
   EKKA.fpCancelFiscalReceipt;

   if EKKA.ReceiptNumber<0 then AbortM('Ошибка определения номера чека');
   CP.NumbChek:=EKKA.ReceiptNumber+1;

   if Not EKKA.fpOpenFiscalReceipt then AbortM('Ошибка открытия чека: '+EKKA.LastErrorDescr);
   if Flag=SM_PREP then
    for i:=0 to ListBox1.Count-1 do
     begin
      if Not EKKA.fpAddFinStr(ListBox1.Items[i]) then AbortM('Ошибка добавления строк: '+EKKA.LastErrorDescr);
     end;
   if Not EKKA.fpAddSale(Nm,
                             1,
                             Sum,
                             1,
                             0,
                             F_NDS,
                             0,
                             ''
                             ) then AbortM('Ошибка пробития позиции чека: '+EKKA.LastErrorDescr);
   if Not EKKA.fpCloseFiscalReceipt(StrToCurr(Edit1.Text),4,StrToCurr(Edit1.Text)) then AbortM('Ошибка закрытия чека: '+EKKA.LastErrorDescr);

   Case Flag of
    SM_OPT:MainF.ShowErrorEKKA(EKKA.fpCashOutput(StrToCurr(Edit1.Text)));
    SM_PREP:begin
             CP.ID_User:=Prm.UserID;
             CP.ID_Kassa:=Opt.KassaID;
             CP.PSkd:=0;
             CP.NumCard:=-1;
             CP.TypeOplat:=TO_CASH;
             CP.ArtName:=Copy(Nm,1,16);
             CP.Kod_Name:=0;
             CP.Kol:=0;
             CP.Cena:=Sum;
             CP.Type_Tov:=1;
             CP.Date:=DM.GetServerDate;
             CP.Vzh:=MainF.VzhNum;
             CP.VzhSafe:=CP.Vzh;
             try
              DM.InsertArhChek(CP);
              DM.ADOCo.CommitTrans;
             except
              raise EAbort.Create('Ошибка записи в архив чеков!');
             end
            end;
   end;
   TryWriteToJournal;
  except
   on E:Exception do
    begin
     if Flag=SM_PREP then DM.ADOCo.RollbackTrans;
     EKKA.fpCancelFiscalReceipt;
     if E.Message<>'' then MainF.MessBox(E.Message) else MainF.MessBox('Ошибка пробивки суммы!');
    end;
  end;
 end;

procedure TOptSumF.Edit1KeyPress(Sender: TObject; var Key: Char);
 begin
  if (Key='.') or (Key=',') then Key:=GetDivPoint;
 end;

procedure TOptSumF.FormActivate(Sender:TObject);
 begin
  if Flag=SM_PREP then
   begin
    rb1.Visible:=False;
    rb2.Visible:=False;
    lbCap.Caption:='Введите сумму предоплаты';
    Edit1.Width:=255;
   end else begin
             GroupBox1.Enabled:=False;
             Panel2.Enabled:=False;
             BitBtn4.Enabled:=False;
             edName.Enabled:=False;
             lbName.Enabled:=False;
             BitBtn3.Enabled:=False;
            end;
 end;

procedure TOptSumF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Randomize;
  DM.qrPList.Close;
  DM.qrPList.Open;
 end;

procedure TOptSumF.BitBtn3Click(Sender: TObject);
 begin
  if edName.Text<>'' then ListBox1.Items.Add(edName.Text);
 end;

procedure TOptSumF.BitBtn4Click(Sender: TObject);
 begin
  ListBox1.DeleteSelected;
 end;

procedure TOptSumF.DBGrid1DblClick(Sender: TObject);
 begin
  if DM.qrPList.IsEmpty then Exit;
  edName.Text:=TrimRight(DM.qrPList.FieldByName('Names').AsString);
 end;

procedure TOptSumF.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key in K_ARROW_KEYS then lbSr.Caption:='';
 end;

procedure TOptSumF.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var S:String;
 begin
  S:=lbSr.Caption+Key;
  if DM.qrPList.Locate('Names',AnsiUpperCase(S),[loCaseInsensitive,loPartialKey]) then
   lbSr.Caption:=Copy(DM.qrPList.FieldByName('Names').AsString,1,Length(S));
 end;

procedure TOptSumF.DBGrid1Exit(Sender: TObject);
 begin
  lbSr.Caption:='';
 end;

end.
