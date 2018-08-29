unit AECardsU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Buttons, Util;

type
  TAECardsF = class(TForm)
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit1: TEdit;
    cbLg: TCheckBox;
    Bevel1: TBevel;
    cbL1: TCheckBox;
    cbL2: TCheckBox;
    cbL3: TCheckBox;
    Label3: TLabel;
    edSer: TEdit;
    edNumD: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    edDateR: TEdit;
    edVidan: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edDateB: TEdit;
    Label10: TLabel;
    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbLgClick(Sender: TObject);
    procedure edDateRKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);

  private

    function CheckLg:Boolean;

  public
  end;

var AECardsF:TAECardsF;

implementation

uses MainU, CardReadU, DataModuleU, ShareU;

{$R *.dfm}

procedure TAECardsF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  LoadKeyboardLayout('00000419',KLF_ACTIVATE);
  if CardReadF.AECC=2 then
   begin
    Label7.Caption:='Заполните обязательные поля отмеченные красным';
    Edit2.Text:=TrimRight(DM.QrC.FieldByName('FIO').AsString);
    Edit4.Text:=TrimRight(DM.QrC.FieldByName('PHONE').AsString);
    Edit1.Text:=TrimRight(DM.QrC.FieldByName('ADDRESS').AsString);
    Label2.Font.Color:=clRed;
    Label5.Font.Color:=clRed;
    Label1.Font.Color:=clRed;
   end;
  Height:=192;
 end;

procedure TAECardsF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

function CheckDate(S:String):Boolean;
 begin
  if S='' then begin Result:=True; Exit; end;
  try
   StrToDate(S);
   Result:=True;
  except
   Result:=False;
  end;
 end;

function TAECardsF.CheckLg:Boolean;
 begin
  if cbLg.Checked=False then begin Result:=True; Exit; end;
  try
   if (cbL1.Checked=False) and (cbL2.Checked=False) and (cbL3.Checked=False) then
    begin
     MainF.MessBox('Выберите одну из категорий льготы: инвалид, ветеран или пенсионер.');
     Abort;
    end else
   if edSer.Text='' then
    begin
     MainF.MessBox('Введите значение в поле "Серия"!',48);
     edSer.SetFocus;
     Abort;
    end else
   if edNumD.Text='' then
    begin
     MainF.MessBox('Введите значение в поле "№ Документа"!',48);
     edNumD.SetFocus;
     Abort;
    end else
   if (edDateR.Text='') or (CheckDate(edDateR.Text)=False) then
    begin
     MainF.MessBox('Введите значение в поле "Дата выдачи" в формате "01.01.2002" или "01.01.02" !',48);
     edDateR.SetFocus;
     Abort;
    end else
   if edVidan.Text='' then
    begin
     MainF.MessBox('Введите значение в поле "Кем выдан"!',48);
     edVidan.SetFocus;
     Abort;
    end else
   if CheckDate(edDateB.Text)=False then
    begin
     MainF.MessBox('Введите значение в поле "Дата рождения" в формате "01.01.2002" или "01.01.02" !',48);
     edDateB.SetFocus;
     Abort;
    end;
   Result:=True;
  except
   Result:=False;
  end;
 end;

procedure TAECardsF.BitBtn1Click(Sender: TObject);
var DopF,Lgota:String;
 begin
  if CardReadF.NumCard=0 then
   begin
    MainF.MessBox('Карточка не считана!',48);
   end else
  if Edit2.Text='' then
   begin
    MainF.MessBox('Введите значение в поле ''Фамилия, Имя, Отчество''!',48);
    Edit2.SetFocus;
   end else
  if Edit4.Text=''  then
   begin
    MainF.MessBox('Обязательно введите ''Телефон'' ',48);
    Edit4.SetFocus;
   end else
  if Edit1.Text='' then
   begin
    MainF.MessBox('Обязательно введите ''Адрес''',48);
    Edit1.SetFocus;
   end else
  if CheckLg then try
                   Edit2.Text:=CorrSQLString(Edit2.Text);
                   Edit4.Text:=CorrSQLString(Edit4.Text);
                   Edit1.Text:=CorrSQLString(Edit1.Text);
                   Lgota:=IntToStr(BoolToInt(cbL1.Checked))+
                          IntToStr(BoolToInt(cbL2.Checked))+
                          IntToStr(BoolToInt(cbL3.Checked));
                   DM.Qr.Close;
                   DM.Qr.SQL.Clear;
                   if (CardReadF.AECC=1) then
                    begin
                     DM.Qr.SQL.Add('Begin tran');
                     DM.Qr.SQL.Add('update SprTov set ostat=ostat-1,ostat_beg=ostat_beg-1 where art_code=1');
                     DopF:='';
                     if cbLg.Checked then
                      begin
                       DM.Qr.SQL.Add('Insert into BonusCards(NumCard,Skd,Vip,SkdOld) Values(');
                       DM.Qr.SQL.Add(IntToStr(CardReadF.NumCard)+',7,2,7)');
                       if edDateB.Text<>'' then
                        DopF:='Lgota,Seria,NumD,DateR,DateB,Vidan,'
                       else
                        DopF:='Lgota,Seria,NumD,DateR,Vidan,';
                      end;
                     DM.Qr.SQL.Add('Insert into Cards(NumCard,Summa) Values(');
                     DM.Qr.SQL.Add(IntToStr(CardReadF.NumCard)+',0)');

                     DM.Qr.SQL.Add('Insert into CardUser(NumCard,FIO,Phone,Address,'+DopF+'ID_User) Values(');
                     DM.Qr.SQL.Add(IntToStr(CardReadF.NumCard)+','''+Edit2.Text+''','''+CorrPhoneNumber(Edit4.Text)+''','''+Edit1.Text+''',');
                     if cbLg.Checked then
                      begin
                       DM.Qr.SQL.Add(''''+Lgota+''','''+edSer.Text+''','''+edNumD.Text+''','''+FormatDateTime('yyyy-mm-dd',StrToDate(edDateR.Text))+''',');
                       if edDateB.Text<>'' then
                        DM.Qr.SQL.Add(''''+FormatDateTime('yyyy-mm-dd',StrToDate(edDateB.Text))+''',');
                        DM.Qr.SQL.Add(''''+edVidan.Text+''',');
                      end;
                     DM.Qr.SQL.Add(IntToStr(Prm.UserID)+')');
                     DM.Qr.SQL.Add('Commit tran');
                    end else
                   if CardReadF.AECC=2 then
                    begin
                     DM.Qr.SQL.Add('Update CardUser');
                     DM.Qr.SQL.Add('set FIO='''+Edit2.Text+''',');
                     DM.Qr.SQL.Add('Phone='''+Edit4.Text+''',');
                     DM.Qr.SQL.Add('Address='''+Edit1.Text+''',');
                     if cbLg.Checked then
                      begin
                       DM.Qr.SQL.Add('Lgota='''+Lgota+''',');
                       DM.Qr.SQL.Add('Seria='''+edSer.Text+''',');
                       DM.Qr.SQL.Add('NumD='''+edNumD.Text+''',');
                       DM.Qr.SQL.Add('Vidan='''+edVidan.Text+''',');
                       DM.Qr.SQL.Add('DateR='''+FormatDateTime('yyyy-mm-dd',StrToDate(edDateR.Text))+' 00:00:00'',');
                       if edDateB.Text<>'' then
                        DM.Qr.SQL.Add('DateB='''+FormatDateTime('yyyy-mm-dd',StrToDate(edDateB.Text))+' 00:00:00'',');
                      end;
                     DM.Qr.SQL.Add('ID_User='+IntToStr(Prm.UserID)+' where NumCard='+IntToStr(CardReadF.NumCard));
                     DM.Qr.SQL.Add('Delete from BlockCards where NumCard='+IntToStr(CardReadF.NumCard));
                    end;
                    DM.Qr.ExecSQL;
                    MainF.ShowCountCards;
                    CardReadF.AEC:=1;
                    Close;
                   except
                    MainF.MessBox('Ошибка регистрации карточки!',48);
                   end;
 end;

procedure TAECardsF.cbLgClick(Sender:TObject);
 begin
  if cbLg.Checked then Height:=307 else Height:=192;
 end;

procedure TAECardsF.edDateRKeyPress(Sender: TObject; var Key: Char);
 begin
  if Key=',' then Key:='.';
 end;

procedure TAECardsF.FormActivate(Sender: TObject);
 begin
  Edit2.SetFocus;
 end;

end.
