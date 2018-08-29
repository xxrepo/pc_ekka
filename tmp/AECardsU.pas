unit AECardsU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Buttons, Util, MainU, ComCtrls;

type
  TAECardsF = class(TForm)
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Edit4: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit3: TComboBox;
    Edit2: TEdit;
    Edit5: TComboBox;
    Edit6: TComboBox;
    Edit1: TComboBox;
    Label3: TLabel;
    Edit9: TEdit;
    Label4: TLabel;
    Edit10: TEdit;
    Label6: TLabel;
    ComboBox3: TComboBox;
    Label9: TLabel;
    ComboBox2: TComboBox;
    Label10: TLabel;
    ComboBox4: TComboBox;
    Label17: TLabel;
    Edit11: TEdit;
    Label18: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ComboBox5: TComboBox;
    ComboBox1: TEdit;
    Label8: TLabel;
    Panel2: TPanel;
    Label19: TLabel;
    Label25: TLabel;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    Label26: TLabel;
    Label27: TLabel;
    Edit15: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    Label30: TLabel;
    Label31: TLabel;
    Edit16: TEdit;
    Label32: TLabel;
    Label33: TLabel;
    ComboBox10: TComboBox;
    ComboBox11: TComboBox;
    Label34: TLabel;
    Label35: TLabel;
    Edit17: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Edit14: TEdit;
    Edit13: TEdit;
    Edit12: TEdit;
    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edDateRKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyUp(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure RadioButton1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure Edit15Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure Edit16Change(Sender: TObject);
    procedure ComboBox11Change(Sender: TObject);
    procedure Edit17Change(Sender: TObject);

  private

    procedure ShowList(CB:TComboBox);
    procedure ChMN(Cb1, Cb2: TComboBox; Ed1: TEdit);

    function CheckValue(V:String; K:Integer):Boolean;

  public

    Flag:Integer;
    NumCard:Int64;
    IsMomBabyCard:Boolean;

  end;

var AECardsF:TAECardsF;

implementation

uses CardReadU, DataModuleU, ShareU, EnterValueU;

{$R *.dfm}

procedure TAECardsF.FormCreate(Sender:TObject);
 begin
  Flag:=0;
  Caption:='Регистрация дисконтной карты';
  ActivateKeyboardLayout(RULng, 0);
  Edit1.Text:=Prm.aCity;
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

function TAECardsF.CheckValue(V:String; K:Integer):Boolean;
 begin
  Result:=(Length(V)>=K);
 end;

function GetDate(Cb1,Cb2:TComboBox; Ed1:TEdit):String;
 begin
  try
   Result:=''''+IntToStr(StrToInt(Ed1.Text))+'-'+LeadZero(Cb2.ItemIndex+1)+'-'+LeadZero(StrToInt(Cb1.Text))+' 00:00:00''';
  except
   Result:='null';
  end;
 end;

procedure TAECardsF.BitBtn1Click(Sender: TObject);
var Address,FIO,DateB,AvgAge,Phone,db1,db2,db3,nC1,nC2,nC3:String;

 function IsNull(S:String):String;
  begin
   Result:='';
   if S<>'' then Result:=',';
  end;

 Begin
  if NumCard=0 then
   begin
    MainF.MessBox('Карточка не считана!',48);
   end else
  if Not CheckValue(Edit2.Text,2) then
   begin
    MainF.MessBox('Введите значение в поле ''Фамилия'' не менее 2 символов!',48);
    Edit2.SetFocus;
   end else
{  if Not CheckValue(Edit3.Text,2) then
   begin
    MainF.MessBox('Введите значение в поле ''Имя'' не менее 2 символов!',48);
    Edit3.SetFocus;
   end else
  if Not CheckValue(Edit5.Text,0) then
   begin
    MainF.MessBox('Введите значение в поле ''Отчество''!',48);
    Edit5.SetFocus;
   end else }
  if Not CheckValue(Edit4.Text,5) and Not CheckValue(Edit9.Text,5) and Not CheckValue(Edit10.Text,5) then
   begin
    MainF.MessBox('Введите хотябы один номер телефона не менее 5 цифр!',48);
    Edit4.SetFocus;
   end else
  if Not CheckValue(Edit1.Text,2) then
   begin
    MainF.MessBox('Введите значение в поле ''Город/поселок'' не менее 2 символов!',48);
    Edit1.SetFocus;
   end else
  if Not CheckValue(Edit6.Text,2) then
   begin
    MainF.MessBox('Введите значение в поле ''Улица'' не менее 2 символов!',48);
    Edit6.SetFocus;
   end else
  if Edit7.Text='' then
   begin
    MainF.MessBox('Введите значение в поле ''Дом''',48);
    Edit7.SetFocus;
   end else
  if ComboBox4.Text='' then
   begin
    MainF.MessBox('Введите значение в поле ''Пол''',48);
    ComboBox4.SetFocus;
   end else
  if RadioButton1.Checked and (ComboBox2.Text='') then
   begin
    MainF.MessBox('Введите значение в поле ''День''',48);
    ComboBox2.SetFocus;
   end else
  if RadioButton1.Checked and (ComboBox3.Text='') then
   begin
    MainF.MessBox('Введите значение в поле ''Месяц''',48);
    ComboBox3.SetFocus;
   end else
  if RadioButton1.Checked and (ComboBox1.Text='') then
   begin
    MainF.MessBox('Введите значение в поле ''Год''',48);
    ComboBox1.SetFocus;
   end else
  if RadioButton2.Checked and (ComboBox5.Text='') then
   begin
    MainF.MessBox('Введите значение в поле ''Примерный возраст''',48);
    ComboBox5.SetFocus;
   end {else
  if (IsMomBabyCard) and (GetDate(ComboBox6,ComboBox7,Edit15)='null') and (GetDate(ComboBox8,ComboBox9,Edit16)='null') and (GetDate(ComboBox10,ComboBox11,Edit17)='null') then
   begin
    MainF.MessBox('Введите дату рождения хотя бы одного ребенка',48);
    ComboBox6.SetFocus;
   end} else try
              FIO:=TrimRight(UpperLowerStr(CorrSQLString(Edit2.Text))+' '+
                   UpperLowerStr(CorrSQLString(Edit3.Text))+' '+
                   UpperLowerStr(CorrSQLString(Edit5.Text)));

              Address:=TrimRight(UpperLowerStr(CorrSQLString(Edit1.Text))+' '+
                                 CorrSQLString(Edit6.Text)+' '+
                                 CorrSQLString(Edit7.Text)+' '+
                                 CorrSQLString(Edit8.Text));

              if Edit4.Text<>''  then Phone:=Edit4.Text;
              if Edit9.Text<>''  then Phone:=Phone+IsNull(Phone)+Edit9.Text;
              if Edit10.Text<>'' then Phone:=Phone+IsNull(Phone)+Edit10.Text;

              DateB:='null'; AvgAge:='';
              db1:='null'; db2:='null'; db3:='null';
              nC1:=''; nC2:=''; nC3:='';
              if IsMomBabyCard then
               begin
                db1:=GetDate(ComboBox6,ComboBox7,Edit15);
                db2:=GetDate(ComboBox8,ComboBox9,Edit16);
                db3:=GetDate(ComboBox10,ComboBox11,Edit17);

                nC1:=Edit12.Text;
                nC2:=Edit13.Text;
                nC3:=Edit14.Text;
               end;
              if RadioButton1.Checked then DateB:=GetDate(ComboBox2,ComboBox3,ComboBox1)
               else
              if RadioButton2.Checked then AvgAge:=ComboBox5.Text;

              DM.QrCa.Close;
              DM.QrCa.SQL.Clear;

              if NumCard<MAX_NUMCARD then
               begin
                if IsMomBabyCard then
                 DM.QrCa.SQL.Add('update SprTov set ostat=ostat-1,ostat_beg=ostat_beg-1 where art_code=2')
                else
                 DM.QrCa.SQL.Add('update SprTov set ostat=ostat-1,ostat_beg=ostat_beg-1 where art_code=1');
               end;
              DM.ADOCo.BeginTrans;
              try
               DM.QrCa.SQL.Add('if (select Count(*) from Cards where NumCard='+IntToStr(NumCard)+')=0');
               DM.QrCa.SQL.Add(' Insert into Cards(NumCard,Summa) Values(');
               DM.QrCa.SQL.Add(IntToStr(NumCard)+',0)');
               DM.QrCa.SQL.Add('delete from CardUser where NumCard='+IntToStr(NumCard));
               DM.QrCa.SQL.Add('Insert into CardUser(NumCard,FIO,Phone,Address,ID_User,DateB,Sex,AvgAge,EMail,ChBirth1,ChBirth2,ChBirth3,ChName1,ChName2,ChName3,Soglashenie,MainF.NPSvid) Values(');
               DM.QrCa.SQL.Add(IntToStr(NumCard)+','''+FIO+''','''+Phone+''','''+Address+''',');
               DM.QrCa.SQL.Add(IntToStr(Prm.UserID)+','+DateB+',');
               DM.QrCa.SQL.Add(''''+ComboBox4.Text+''',');
               DM.QrCa.SQL.Add(''''+AvgAge+''',');
               DM.QrCa.SQL.Add(''''+Edit11.Text+''',');
               DM.QrCa.SQL.Add(dB1+',');
               DM.QrCa.SQL.Add(dB2+',');
               DM.QrCa.SQL.Add(dB3+',');
               DM.QrCa.SQL.Add(''''+nC1+''',');
               DM.QrCa.SQL.Add(''''+nC2+''',');
               DM.QrCa.SQL.Add(''''+nC3+''',1,'''+MainF.NPSvid+''')');

{
               if (CheckBox1.Checked) and (NPSvid>0) then
                begin
                 DM.QrCa.SQL.Add('delete from BonusCards where NumCard='+IntToStr(NumCard));
                 DM.QrCa.SQL.Add('insert into BonusCards(NumCard,Skd,Vip) values('+IntToStr(NumCard)+',7,2) ');
                end;
}
               DM.QrCa.SQL.Add('select 789 as res');
               DM.QrCa.SQL.SaveToFile('C:\2234.txt');
               DM.QrCa.Open;
               if DM.QrCa.FieldByName('Res').AsInteger<>789 then Abort;
               DM.ADOCo.CommitTrans;
              except
               DM.ADOCo.RollbackTrans;
               raise;
              end;
              MainF.ShowCountCards;
              Flag:=1;
              Close;
             except
              on E:Exception do
               begin
                MainF.MessBox('Ошибка регистрации карточки: '+E.Message,48);
               end;
             end;
 end;

procedure TAECardsF.edDateRKeyPress(Sender:TObject; var Key:Char);
 begin
  if Key=',' then Key:='.';
 end;

procedure TAECardsF.FormActivate(Sender:TObject);
 begin
  if IsMomBabyCard=False then
   begin
    Height:=422;
    Panel2.Visible:=False;
   end;
  Edit2.SetFocus;
 end;

procedure TAECardsF.Edit4KeyPress(Sender:TObject; var Key: Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

procedure TAECardsF.Edit2KeyPress(Sender:TObject; var Key: Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_ANSI-CH_DIGIT-[' ']) then
    Key:=#0;
 end;

procedure TAECardsF.Edit6KeyPress(Sender: TObject; var Key: Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_ANSI) then Key:=#0;
 end;

procedure TAECardsF.ShowList(CB:TComboBox);
var i:Integer;
    ss:String;
 begin
  try
   ss:=CB.Text;
   CB.Clear;
   if ss='' then begin CB.DroppedDown:=False; Exit; end;
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from SprNames where id_descr='+IntToStr(CB.Tag)+' and Descr like '''+ss+'%'' order by Descr';
   DM.Qr.Open;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     CB.Items.Add(DM.Qr.FieldByName('Descr').AsString);
    end;
   CB.DroppedDown:=False;
   CB.DroppedDown:=True;
   CB.Text:=ss;
   CB.SelStart:=length(ss)+1;
  except
  end;
 end;

procedure TAECardsF.Edit2KeyUp(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Sender=nil then Exit;
  if Key in [VK_RETURN,VK_TAB] then begin TComboBox(Sender).DroppedDown:=False; Exit; end;
  if not (key in [8,46,32,65..90,186,188,190,191,192,219,221,222]) then exit;
  ShowList(TComboBox(Sender));
 end;

procedure TAECardsF.RadioButton1Click(Sender: TObject);
 begin
  ComboBox2.Enabled:=RadioButton1.Checked;
  ComboBox3.Enabled:=RadioButton1.Checked;
  ComboBox1.Enabled:=RadioButton1.Checked;
  ComboBox5.Enabled:=RadioButton2.Checked;
  if RadioButton1.Checked then ComboBox5.ItemIndex:=-1 else
   begin
    ComboBox2.ItemIndex:=-1;
    ComboBox3.ItemIndex:=-1;
    ComboBox1.Text:='';
   end;
 end;

procedure TAECardsF.ComboBox1KeyPress(Sender: TObject; var Key: Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

procedure TAECardsF.ChMN(Cb1,Cb2:TComboBox; Ed1:TEdit);
var MaxD,d,i:Integer;
 begin
  d:=Cb1.ItemIndex;
  if Cb2.Itemindex in [3,5,8,10] then MaxD:=30 else
  if Cb2.Itemindex in [0,2,4,6,7,9,11] then MaxD:=31 else
  if Cb2.Itemindex=1 then
   try
    if (StrToInt(Ed1.Text) mod 4)=0 then MaxD:=29 else Abort;
   except
    MaxD:=28;
   end;
  Cb1.Clear;
  for i:=1 to MaxD do Cb1.Items.Add(LeadZero(i));
  Cb1.ItemIndex:=d;
 end;

procedure TAECardsF.ComboBox3Change(Sender: TObject);
 begin
  ChMN(ComboBox2,ComboBox3,ComboBox1);
 end;

procedure TAECardsF.ComboBox1Change(Sender: TObject);
 begin
  ChMN(ComboBox2,ComboBox3,ComboBox1);
 end;

procedure TAECardsF.ComboBox7Change(Sender: TObject);
 begin
  ChMN(ComboBox6,ComboBox7,Edit15);
 end;

procedure TAECardsF.Edit15Change(Sender: TObject);
 begin
  ChMN(ComboBox6,ComboBox7,Edit15);
 end;

procedure TAECardsF.ComboBox9Change(Sender: TObject);
 begin
  ChMN(ComboBox8,ComboBox9,Edit16);
 end;

procedure TAECardsF.Edit16Change(Sender: TObject);
 begin
  ChMN(ComboBox8,ComboBox9,Edit16);
 end;

procedure TAECardsF.ComboBox11Change(Sender: TObject);
 begin
  ChMN(ComboBox10,ComboBox11,Edit17);
 end;

procedure TAECardsF.Edit17Change(Sender: TObject);
 begin
  ChMN(ComboBox10,ComboBox11,Edit17);
 end;

end.



