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
    Edit4: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Edit3: TComboBox;
    Edit2: TEdit;
    Edit5: TComboBox;
    Label3: TLabel;
    Edit9: TEdit;
    Label4: TLabel;
    Edit10: TEdit;
    Label10: TLabel;
    ComboBox4: TComboBox;
    Label18: TLabel;
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
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Label1: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    cbb1: TComboBox;
    cbb2: TComboBox;
    cbb3: TComboBox;
    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edDateRKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyUp(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox7Change(Sender: TObject);
    procedure Edit15Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure Edit16Change(Sender: TObject);
    procedure ComboBox11Change(Sender: TObject);
    procedure Edit17Change(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure cbb2CloseUp(Sender: TObject);

  private

    procedure ShowList(CB:TComboBox);
    procedure ChMN(Cb1, Cb2: TComboBox; Ed1: TEdit);
    procedure LoadCbb(cb: TComboBox; Param: Byte);

    function  CheckValue(V:String; K:Integer):Boolean;

    function  RegCardSMS(P1,P2,P3:String; IsLink:Boolean):Boolean;

  public

    Flag:Integer;
    NumCard:Int64;
    TypeCard:Byte;
    IsMomBabyCard:Boolean;
    IsLink:Boolean;

  end;

var AECardsF:TAECardsF;

implementation

uses CardReadU, DataModuleU, ShareU, EnterValueU, CheckSMSKodU;

{$R *.dfm}

procedure TAECardsF.LoadCbb(cb:TComboBox; Param:Byte);
var i:Integer;
 begin

  DM.QrEx.Close;
  DM.QrEx.SQL.Clear;
  DM.QrEx.SQL.Add('declare @id int ');
  DM.QrEx.SQL.Add('set @id = '+IntToStr(Prm.AptekaID));
  DM.QrEx.SQL.Add('select type_pol, Names,a.phone from Kod_Mista a, Gen_base_Phone_load s');
  DM.QrEx.SQL.Add('where a.id_mista = s.id_gorod');

  Case Param of
   1:DM.QrEx.SQL.Add('and id_apteka = @id and s.Type_pol<6');
   2:DM.QrEx.SQL.Add('and id_apteka = @id and s.Type_pol=6');
  end;

  DM.QrEx.SQL.Add('group by type_pol, Names,a.phone');
  DM.QrEx.SQL.Add('order by type_pol, Names,a.phone');
//    DM.QrEx.SQL.SaveToFile('C:\kod.txt');
  DM.QrEx.Open;

  cb.Clear;

  Case Param of
   1:cb.Items.Add('Выберите город');
   2:cb.Items.Add('Выберите код моб.');
  end;

  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    cb.Items.Add(DM.QrEx.FieldByName('Names').AsString);
   end;
  cb.ItemIndex := 0;

 end;

procedure TAECardsF.FormCreate(Sender:TObject);
 begin
  TypeCard:=0;
  Flag:=0;
  Caption:='Регистрация дисконтной карты';
  ActivateKeyboardLayout(RULng, 0);

  if Prm.AptekaSklad=False then
   begin
    LoadCbb(cbb1,1);
    LoadCbb(cbb3,2);
   end;

  LoadCbb(cbb2,2);
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

function TAECardsF.RegCardSMS(P1,P2,P3:String; IsLink:Boolean):Boolean;
var Kod,Res:String;
    IsRegFromKod:Boolean;

 function CheckKodFromCall:Boolean;
 var V:String;
  begin
   Result:=False;
   if EnterStrValue(V,'Введите код полученный из Call-центра') then
    begin
     if GetKodForEachHour<>V then
      MainF.MessBox('Код введен неверно!')
     else Result:=True;
    end;
  end;

 Begin
  try
   Result:=False;
   IsRegFromKod:=False;

   if IsLink=False then
    begin
     {
      MainF.MessBox('Невозможно отослать SMS.'#10#10+
                   'Зарегистрируйте карту с помощью одноразового кода (код можно получить через Call-центр)',
                   48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
     if CheckKodFromCall then Result:=True;
     }
     Result:=True;
     Exit;
    end;

   DM.QrCa.Close;
   DM.QrCa.SQL.Clear;
   DM.QrCa.SQL.Add('declare @res varchar(10), @ResI int');
   DM.QrCa.SQL.Add('set @res='''' ');
   DM.QrCa.SQL.Add('set @ResI=0 ');
   DM.QrCa.SQL.Add('exec spY_SendSMSforRegCard '''+P1+''','''+P2+''','''+P3+''',''Kod dlya registratsii diskontnoy karty: '',1, @Res output, @ResI output ');
   DM.QrCa.Open;

   if DM.QrCa.FieldByName('Res').AsInteger in [1,2] then
    begin
     if DM.QrCa.FieldByName('Res').AsInteger=2 then
      MainF.MessBox('На данный телефон временно невозможно отправить SMS.'#10#10+
                    'Код для регистрации дисконтной карты: '+DM.QrCa.FieldByName('Kod').AsString,
                    48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);

     CheckSMSKodF:=TCheckSMSKodF.Create(Self);
     try
      CheckSMSKodF.Kod:=DM.QrCa.FieldByName('Kod').AsString;
      CheckSMSKodF.ShowModal;
      if CheckSMSKodF.Flag<>1 then Exit;
     finally
      CheckSMSKodF.Free;
     end;

    end else
   if DM.QrCa.FieldByName('Res').AsInteger=-2 then
    begin
     if MainF.MessBox('Возможно введен неправильный мобильный номер телефона! Вы действительно хотите зарегистрировать дисконтную карту на этот номер телефона!',52,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res)<>ID_YES then
      Exit;
{
     if MainF.MessBox('Возможно введен городской номер, на который нельзя отослать SMS.'#10#10+
                      'Нажмите "ДА" для того, зарегистрировать кату с помощью одноразового кода (код можно получить через Call-центр)'+#10#10+
                      'либо введите действующий номер мобильного телефона.',52,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res)=ID_YES then
      IsRegFromKod:=True
     else
      Exit;
}
    end else
   if DM.QrCa.FieldByName('Res').AsInteger=-1 then
    begin
{
     MainF.MessBox('Невозможно отослать SMS.'#10#10+
                   'Зарегистрируйте карту с помощью одноразового кода (код можно получить через Call-центр)',
                   48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
     IsRegFromKod:=False;
}
    end;

{
   if IsRegFromKod then
    begin
     if CheckKodFromCall then Result:=True;
     Exit;
    end;
}
   Result:=True;
  except
   on E:Exception do
    begin
     Result:=False;
     MainF.RegisterError('Регистрация дисконтной карты через SMS',E.Message,True);
    end;
  end;
 End;

procedure TAECardsF.BitBtn1Click(Sender: TObject);
var FIO,AvgAge,Phone,db1,db2,db3,nC1,nC2,nC3,P1,P2,P3,Art:String;

 function IsNull(S:String):String;
  begin
   Result:='';
   if S<>'' then Result:=',';
  end;

 Begin
  if NumCard=0 then
   begin
    MainF.MessBox('Карточка не считана!',48);
    Exit;
   end else
  if Not CheckValue(Edit2.Text,2) then
   begin
    MainF.MessBox('Введите значение в поле ''Фамилия'' не менее 2 символов!',48);
    Edit2.SetFocus;
    Exit;
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

  if IsEmptyPhone(Edit4.Hint) and IsEmptyPhone(Edit9.Hint) and IsEmptyPhone(Edit10.Hint) then
   begin
    MainF.MessBox('Введите хотябы один номер телефона!',48);
    Edit4.SetFocus;
    Exit;
   end;

  if IsCorrectPhone(Edit4.Hint)=False then
   begin
    MainF.MessBox('Введите корректный номер телефона в поле "Телефон 1" либо очистите его!',48);
    Edit4.SetFocus;
    Exit;
   end;
  if IsCorrectPhone(Edit9.Hint)=False then
   begin
    MainF.MessBox('Введите корректный номер телефона в поле "Телефон 2" либо очистите его!',48);
    Edit9.SetFocus;
    Exit;
   end;
  if IsCorrectPhone(Edit10.Hint)=False then
   begin
    MainF.MessBox('Введите корректный номер телефона в поле "Телефон 3" либо очистите его!',48);
    Edit10.SetFocus;
    Exit;
   end;

  if ComboBox4.Text='' then
   begin
    MainF.MessBox('Введите значение в поле ''Пол''',48);
    ComboBox4.SetFocus;
   end else
  if (RadioButton1.Checked=False) and (RadioButton2.Checked=False) and (RadioButton3.Checked=False) and (RadioButton4.Checked=False) then
   begin
    MainF.MessBox('Выберите признак ''Примерный возраст''',48);
   end else try

              FIO:=TrimRight(UpperLowerStr(CorrSQLString(Edit2.Text))+' '+
                   UpperLowerStr(CorrSQLString(Edit3.Text))+' '+
                   UpperLowerStr(CorrSQLString(Edit5.Text)));

              P1:=''; P2:=''; P3:='';

              if IsEmptyPhone(Edit4.Hint)=False  then begin P1:='+38'+Edit4.Hint; Phone:=P1 end;
              if IsEmptyPhone(Edit9.Hint)=False  then begin P2:='+38'+Edit9.Hint; Phone:=Phone+IsNull(Phone)+P2 end;
              if IsEmptyPhone(Edit10.Hint)=False then begin P3:='+38'+Edit10.Hint; Phone:=Phone+IsNull(Phone)+P3 end;

              if Prm.RegCardFromSMS then
               if RegCardSMS(P1,P2,P3,IsLink)=false then Abort;

              AvgAge:='';
              db1:='null'; db2:='null'; db3:='null';
              nC1:=''; nC2:=''; nC3:='';

              if IsMomBabyCard then
               begin
                Art:='2';
                db1:=GetDate(ComboBox6,ComboBox7,Edit15);
                db2:=GetDate(ComboBox8,ComboBox9,Edit16);
                db3:=GetDate(ComboBox10,ComboBox11,Edit17);

                nC1:=Edit12.Text;
                nC2:=Edit13.Text;
                nC3:=Edit14.Text;
               end else
              if Prm.AptekaSklad=False then Art:='1'  //Карты 911
                                       else Art:='7'; //Карты АОЦ

              if RadioButton1.Checked then AvgAge:=RadioButton1.Caption else
              if RadioButton2.Checked then AvgAge:=RadioButton2.Caption else
              if RadioButton3.Checked then AvgAge:=RadioButton3.Caption
                                      else AvgAge:=RadioButton4.Caption;


              {
              if NumCard<MAX_NUMCARD then
               begin
                if IsMomBabyCard then
                 DM.QrCa.SQL.Add('update SprTov set ostat=ostat-1,ostat_beg=ostat_beg-1 where art_code=2')
                else
                 DM.QrCa.SQL.Add('update SprTov set ostat=ostat-1,ostat_beg=ostat_beg-1 where art_code=1');
               end;
              }

               {
               DM.QrCa.SQL.Add('if (select Count(*) from Cards where NumCard='+IntToStr(NumCard)+')=0');
               DM.QrCa.SQL.Add(' Insert into Cards(NumCard,Summa,TypeCard,AccumSum,SumMonth) Values(');

               DM.QrCa.SQL.Add(IntToStr(NumCard)+',0,'+IntToStr(TypeCard)+',0,0)');
               DM.QrCa.SQL.Add('delete from CardUser where NumCard='+IntToStr(NumCard));
               DM.QrCa.SQL.Add('Insert into CardUser(NumCard,FIO,Phone,ID_User,Sex,AvgAge,ChBirth1,ChBirth2,ChBirth3,ChName1,ChName2,ChName3,Soglashenie,NPSvid,TypeCard) Values(');
               DM.QrCa.SQL.Add(IntToStr(NumCard)+','''+FIO+''','''+Phone+''',');
               DM.QrCa.SQL.Add(IntToStr(Prm.UserID)+',');
               DM.QrCa.SQL.Add(''''+ComboBox4.Text+''',');
               DM.QrCa.SQL.Add(''''+AvgAge+''',');
               DM.QrCa.SQL.Add(dB1+',');
               DM.QrCa.SQL.Add(dB2+',');
               DM.QrCa.SQL.Add(dB3+',');
               DM.QrCa.SQL.Add(''''+nC1+''',');
               DM.QrCa.SQL.Add(''''+nC2+''',');
               DM.QrCa.SQL.Add(''''+nC3+''',1,'''+MainF.NPSvid+''','+IntToStr(TypeCard)+')');

               DM.QrCa.SQL.Add('');
               DM.QrCa.SQL.Add('');
               DM.QrCa.SQL.Add('declare @Res int ');
               DM.QrCa.SQL.Add('exec spY_EnterKol '+Art+',1,'+IntToStr(Prm.UserID)+',1,'+Art+',0,1 ');
               DM.QrCa.SQL.Add('if @Res=21 raiserror (''Недостаточное количество карт на остатке!'',16,1)');
               DM.QrCa.SQL.Add('');
              }
{
               if (CheckBox1.Checked) and (NPSvid>0) then
                begin
                 DM.QrCa.SQL.Add('delete from BonusCards where NumCard='+IntToStr(NumCard));
                 DM.QrCa.SQL.Add('insert into BonusCards(NumCard,Skd,Vip) values('+IntToStr(NumCard)+',7,2) ');
                end;
}
{               DM.QrCa.SQL.Add('select 789 as res');
               DM.QrCa.SQL.SaveToFile('C:\2234.txt');
}

              DM.QrCa.Close;
              DM.QrCa.SQL.Clear;
              DM.QrCa.SQL.Add('exec spY_RegisterCard ');
              DM.QrCa.SQL.Add(IntToStr(NumCard)+',');
              DM.QrCa.SQL.Add(IntToStr(TypeCard)+',');
              DM.QrCa.SQL.Add(''''+FIO+''',');
              DM.QrCa.SQL.Add(''''+Phone+''',');
              DM.QrCa.SQL.Add(IntToStr(Prm.UserID)+',');
              DM.QrCa.SQL.Add(''''+ComboBox4.Text+''',');
              DM.QrCa.SQL.Add(''''+AvgAge+''',');
              DM.QrCa.SQL.Add(dB1+',');
              DM.QrCa.SQL.Add(dB2+',');
              DM.QrCa.SQL.Add(dB3+',');
              DM.QrCa.SQL.Add(''''+nC1+''',');
              DM.QrCa.SQL.Add(''''+nC2+''',');
              DM.QrCa.SQL.Add(''''+nC3+''',');
              DM.QrCa.SQL.Add(''''+MainF.NPSvid+''',');
              DM.QrCa.SQL.Add(Art);
//              DM.QrCa.SQL.SaveToFile('C:\log\2234.txt');
              DM.QrCa.Open;

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
    // 618
    Height:=426;
    Top:=(Screen.Height-Height) div 2;
    Panel2.Visible:=False;
   end;
  if Prm.AptekaSklad=True then
   begin

    cbb1.Visible:=False;
    cbb3.Visible:=False;

    Label5.Visible:=False;
    Label4.Visible:=False;
    Edit4.Visible:=False;
    Edit10.Visible:=False;

    cbb2.Left:=5;
    Label3.Left:=5;
    Edit9.Left:=5;
   end;
  Edit2.SetFocus;
 end;

procedure TAECardsF.Edit4KeyPress(Sender:TObject; var Key:Char);
 begin
  EditKeyPress(Sender,Key);
 end;

procedure TAECardsF.Edit2KeyPress(Sender:TObject; var Key:Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_ANSI-CH_DIGIT-[' ']) then
    Key:=#0;
 end;

procedure TAECardsF.Edit6KeyPress(Sender:TObject; var Key:Char);
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

procedure TAECardsF.Edit4Enter(Sender: TObject);
 begin
  EditEnter(Sender);
 end;

procedure TAECardsF.Edit4KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  EditKeyUp(Sender,Key,Shift);
 end;

procedure TAECardsF.cbb2CloseUp(Sender: TObject);
var cb:TComboBox;
    ed:TEdit;
    i:Integer;
    S:String;
 begin
  try
   if Sender=nil then Exit;
   cb:=TComboBox(Sender);
   if cb=cbb1 then ed:=Edit4 else
   if cb=cbb2 then ed:=Edit9 else
   if cb=cbb3 then ed:=Edit10;

   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add(' declare @id int ');
   DM.QrEx.SQL.Add('set @id = '+IntToStr(Prm.AptekaID));
   DM.QrEx.SQL.Add('select a.phone from Kod_Mista a, Gen_base_Phone_load s ');
   DM.QrEx.SQL.Add('where a.id_mista = s.id_gorod ');

   Case cb.Tag of
    1:DM.QrEx.SQL.Add('and id_apteka = @id and s.Type_pol<6 ');
    2:DM.QrEx.SQL.Add('and id_apteka = @id and s.Type_pol=6 ');
   end;

   DM.QrEx.SQL.Add('and a.names='''+cb.Text+'''');
   DM.QrEx.SQL.Add('group by type_pol, Names,a.phone ');
   DM.QrEx.SQL.Add('order by type_pol, Names,a.phone ');
   DM.QrEx.Open;

   ed.Text:='+38 (___) ___-__-__';
   ed.Hint:='';
   if DM.QrEx.IsEmpty then Exit;

   S:=DM.QrEx.FieldbyName('Phone').AsString;

   ed.SetFocus;
   for i:=1 to Length(S) do
    begin
     keybd_event(Ord(S[i]), 0, 0, 0);
     keybd_event(Ord(S[i]), 0, KEYEVENTF_KEYUP, 0);
    end;

  except
   on E:Exception do MainF.MessBox('Ошибка ввода шаблона:'+E.Message);
  end;
 end;

end.







