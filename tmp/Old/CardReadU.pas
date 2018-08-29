unit CardReadU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, jpeg, Util;

type
  TCardReadF = class(TForm)
    Label8: TLabel;
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Timer1: TTimer;
    Bevel1: TBevel;
    Image1: TImage;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private

    FNumCard:Int64;
    FAEC:Integer;
    FAECC:Integer;
    Fq:Integer;
    FKodEAN:Integer;

    procedure ShowDiscF(P: Integer);

    function  Mess(S:String; P:Integer):Integer;
    function  CheckBlockCard(Nm:Integer):Boolean;
    function  NumCardToInt(S,Pref:String):Int64;
    function  CheckSuperCard(Nm: Integer): Boolean;

  public

    property KodEAN:Integer read FKodEAN write FKodEAN;
    property NumCard:Int64 read FNumCard write FNumCard;
    property AEC:Integer read FAEC write FAEC;
    property AECC:Integer read FAECC write FAECC;

  end;

// Извлекает номер карточки
Function GetNumCard(S:String):Int64;

Function CheckEANStr(S:String):Integer;

var CardReadF:TCardReadF;

implementation

uses MainU, DataModuleU, AECardsU, ShareU;

{$R *.dfm}

function CheckEANStr(S:String):Integer;
var ln:Integer;
 begin
  try
   Result:=0;
   ln:=Length(S);
   if Ln<8 then Exit;
   if (Prm.CR_BEGIN=Copy(S,1,Length(Prm.CR_BEGIN))) and (ln=13) then Result:=1 else // 1 - зеленые карточки (наши)
   if (CR_BEGDR=Copy(S,1,Length(CR_BEGDR))) and (ln=13) then Result:=2 else         // 2 - карточки 10% на определенные препараты
   if (CR_NAKLOF=Copy(S,1,Length(CR_NAKLOF))) and (ln=13) then Result:=7 else       // карточки 10% на определенные препараты
   if (CR_DOCT1=Copy(S,1,Length(CR_DOCT1))) and (ln=13) then Result:=15 else       // карточки 5% на все препараты
   if (CR_BIOSTR=Copy(S,1,Length(CR_BIOSTR))) and (ln=13) then Result:=9 else       // карточки 10% на определенные препараты
   if (CR_KARAV=Copy(S,1,Length(CR_KARAV))) and (ln=13) then Result:=3 else         // 3 - дисконтные карты супермаркета "Караван"
   if (CR_911=Copy(S,1,Length(CR_911))) and (ln=13) then Result:=5 else             // 5 - спец карточки 911
   if (CR_STUD=Copy(S,1,Length(CR_STUD))) and (ln=13) then Result:=6 else         // 6 - студенческие карточки
   if (CR_DAFI=Copy(S,1,Length(CR_DAFI))) and (ln=13) then Result:=11 else          // 3 - дисконтные карты супермаркета в Дафи
   if (CR_271=Copy(S,1,Length(CR_271))) and (ln=13) then Result:=12 else          // карты для 271
   if ln=8 then Result:=4 else                                                      // 4 - Оранж кард
   if (ln=13) then
    begin
     DM.QrCr.Close;
     DM.QrCr.SQL.Clear;
     DM.QrCr.SQL.Add('select * from MetroCard where NumCard='+(Copy(S,1,ln-2)));
     DM.QrCr.Open;
     if DM.QrCr.IsEmpty=False then Result:=8;
    end;
  except
   Result:=0;
  end;
 end;

procedure TCardReadF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  LoadKeyboardLayout('00000409',KLF_ACTIVATE);
  KodEAN:=0;
  FNumCard:=0;
  Randomize;
  Fq:=0;
 end;

procedure TCardReadF.SpeedButton2Click(Sender:TObject);
 begin
  Timer1.Enabled:=False;
  FNumCard:=0;
  Close;
 end;

procedure TCardReadF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

procedure TCardReadF.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  Timer1.Enabled:=False;
  LoadKeyboardLayout('00000419',KLF_ACTIVATE);
 end;

procedure TCardReadF.FormActivate(Sender:TObject);
 begin
  Timer1.Enabled:=True;
  Edit1.SetFocus;
 end;

procedure TCardReadF.Edit1Change(Sender:TObject);
 begin
  if Edit1.Text<>'' then
   begin
    Label7.Visible:=True;
    Label8.Visible:=False;
    Fq:=0;
    Timer1.Enabled:=True;
   end else Label7.Visible:=False;
 end;

function TCardReadF.Mess(S:String; P:Integer):Integer;
var B:Boolean;

 begin
  B:=Timer1.Enabled;
  try
   Timer1.Enabled:=False;
   Result:=MainF.MessBox(S,P);
  finally
   Timer1.Enabled:=B;
  end;
 end;

function GetNumCard(S:String):Int64;
 begin
  try
   if Length(S)<12 then Abort;
   Result:=StrToInt64(Copy(S,1,12));
  except
   Result:=-1;
  end;
 end;

function TCardReadF.CheckBlockCard(Nm:Integer):Boolean;
var B:Integer;
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from BlockCards where NumCard='+IntToStr(Nm);
   DM.Qr.Open;
   if DM.Qr.RecordCount<=0 then Abort;
   B:=DM.Qr.FieldByName('Blocking').AsInteger;
   if B=0 then Abort;
   Case B of
    0:Mess('Извините. Эта карточка временно заблокирована.'+#10+'Для ее разблокировки клиенту необходимо позвонить '+#10+
           'начальнику Контрольно-ревизионного отдела Батвиньеву Александру Васильевичу '+#10+'по телефону 0503027106',48);
    1:Mess('Извините. Эта карточка заблокирована!',48);
   end;
   Result:=False;
  except
   Result:=True;
  end;
 end;

function TCardReadF.CheckSuperCard(Nm:Integer):Boolean;
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from AptCards where NumCard='+IntToStr(Nm);
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Abort;
   if Prm.UserRole=R_SUPER then Abort;
   Mess('Эту карточку может проводить только заведующая!',48);
   Result:=False;
  except
   Result:=True;
  end;
 end;

procedure TCardReadF.ShowDiscF(P:Integer);
 begin
  AEC:=0;
  AECC:=P;
  try
   AECardsF:=TAECardsF.Create(Self);
   try
    AECardsF.ShowModal;
   finally
    AECardsF.Free;
   end;
  except
  end;
 end;

function TCardReadF.NumCardToInt(S:String; Pref:String):Int64;
 begin
  if (Pref=CR_BEGDR) or (Pref=CR_NAKLOF) or (Pref=CR_BIOSTR) or (Pref=CR_DOCT1) then
   begin
    S[7]:=S[4];
    S[6]:=Pref[3];
   end;

  S[1]:='0'; S[2]:='0'; S[3]:='0';
  if (Pref=CR_DAFI) then
   begin
    S[4]:=Pref[2]; S[5]:=Pref[3];
   end else begin
             S[4]:=Pref[1]; S[5]:=Pref[2];
            end;
  if (Pref=CR_911) or (Pref=CR_STUD) then S[6]:=Pref[3];
  if Pref=CR_STUD then S[7]:=Pref[4];
  Result:=StrToInt(S);
 end;

procedure TCardReadF.Timer1Timer(Sender:TObject);
var sNC:String;
    B:Boolean;
    P:Integer;
    n:Int64;

 begin
  if Edit1.Text='' then Exit;
  try
   KodEAN:=0;
   NumCard:=0;
   if Length(Edit1.Text)=12 then Edit1.Text:=Edit1.Text+'0';
   if (Length(Edit1.Text)=13) or (Fq>=20) then
    begin
     Timer1.Enabled:=False;
     Fq:=0;
    end else if Fq<=20 then begin Inc(Fq); Exit; end;
   try
    Label7.Visible:=False;
    Label2.Visible:=False;
    KodEAN:=CheckEANStr(Edit1.Text);
    Case KodEAN of
     1,5,6,8:begin
          Case KodEAN of
           1:begin
              sNC:=Copy(IntToStr(GetNumCard(Edit1.Text)),3,10);
              if Not(CheckBlockCard(StrToInt(sNC))) then Exit;
              if Not(CheckSuperCard(StrToInt(sNC))) then Exit;
              if Not (MainF.CheckLimitSkd(StrToInt(sNC))) then Exit;
             end;
           5:begin
              n:=GetNumCard(Edit1.Text);
              if n=-1 then Abort;
              sNC:=IntToStr(NumCardToInt(IntToStr(n),CR_911));
             end;
           6:begin
              n:=GetNumCard(Edit1.Text);
              if n=-1 then Abort;
              sNC:=IntToStr(NumCardToInt(IntToStr(n),CR_STUD));
             end;
           8:begin
              sNC:=IntToStr(StrToInt64(Copy(Edit1.Text,1,Length(Edit1.Text)-2)));
             end;
          end;
        Timer1.Enabled:=False;
        try
         DM.QrC.Close;
         DM.QrC.SQL.Text:='select Count(*) as Cn from Cards where NumCard='+sNC;
         DM.QrC.Open;
         B:=True;
         if DM.QrC.FieldByName('Cn').AsInteger>0 then // Карточка зарегистрирована
          begin
           DM.QrC.Close;
           DM.QrC.SQL.Text:='update CardUser set id_user='+IntToStr(Prm.UserID)+' where id_user is null and NumCard='+sNC+#10+
                            'select *,IsNull((select Blocking from BlockCards where numcard=CardUser.NumCard),1) as Blocking from CardUser where NumCard='+sNC;
           DM.QrC.Open;
           if DM.QrC.RecordCount>0 then
            if (DM.QrC.FieldByName('FIO').AsString='') or (DM.QrC.FieldByName('Blocking').AsInteger=0) or
               ((DM.QrC.FieldByName('Address').AsString='') and (DM.QrC.FieldByName('Phone').AsString=''))  then B:=False;
           P:=2;
          end else begin B:=False; P:=1; end;
         AEC:=1;
         NumCard:=StrToInt(sNC);
         if (NumCard>=479000) and (NumCard<=479999) and (B=False) then
          begin
           DM.Qr.Close;
           DM.Qr.SQL.Clear;
           DM.Qr.SQL.Add('Insert into Cards(NumCard,Summa) Values(');
           DM.Qr.SQL.Add(IntToStr(NumCard)+',0)');
           DM.Qr.ExecSQL;
           B:=True;
          end;
         
         if Not (B) then ShowDiscF(P);
         if AEC=1 then
          begin
           Label8.Visible:=True;
          end else begin
                    NumCard:=0;
                    Mess('Карточка не считана!'+#13+'Введены не все данные.',48);
                   end;
        finally
         Timer1.Enabled:=True;
        end;
       end;
     2:begin
        n:=GetNumCard(Edit1.Text);
        if n=-1 then Abort;
        sNC:=IntToStr(n);
        NumCard:=NumCardToInt(sNC,CR_BEGDR);
        Label2.Visible:=True;
        Label8.Visible:=True;
       end;
     7:begin
        n:=GetNumCard(Edit1.Text);
        if n=-1 then Abort;
        sNC:=IntToStr(n);
        NumCard:=NumCardToInt(sNC,CR_NAKLOF);
        Label2.Visible:=True;
        Label8.Visible:=True;
       end;
     9:begin
        n:=GetNumCard(Edit1.Text);
        if n=-1 then Abort;
        sNC:=IntToStr(n);
        NumCard:=NumCardToInt(sNC,CR_BIOSTR);
        Label2.Visible:=True;
        Label8.Visible:=True;
       end;
     3:begin
        n:=GetNumCard(Edit1.Text);
        if n=-1 then Abort;
        sNC:=IntToStr(n);
        NumCard:=NumCardToInt(sNC,CR_KARAV);
        Label8.Visible:=True;
       end;
     11:begin
         n:=GetNumCard(Edit1.Text);
         if n=-1 then Abort;
         sNC:=IntToStr(n);
         NumCard:=NumCardToInt(sNC,CR_DAFI);
         Label8.Visible:=True;
       end;
     12:begin
         NumCard:=GetNumCard(Edit1.Text);
         Label8.Visible:=True;
        end;
     4:begin
        DM.Qr.Close;
        DM.Qr.SQL.Clear;
        DM.Qr.SQL.Add('declare @mx int,@nc bigint');
        DM.Qr.SQL.Add('select @mx=IsNull(Max(id),0)+1 from Orange ');
        DM.Qr.SQL.Add('set @nc=IsNull((select id from Orange where NumCard='''+Edit1.Text+'''),0)');
        DM.Qr.SQL.Add('if @nc=0');
        DM.Qr.SQL.Add(' begin');
        DM.Qr.SQL.Add('  insert into Orange(id,NumCard)');
        DM.Qr.SQL.Add('  values(@mx,'''+Edit1.Text+''')');
        DM.Qr.SQL.Add('  set @nc=@mx');
        DM.Qr.SQL.Add(' end');
        DM.Qr.SQL.Add('select @nc as NumCard');
        DM.Qr.Open;
        if DM.Qr.IsEmpty then Abort;
        NumCard:=StrToInt(CR_ORANG+IntToStrF(DM.Qr.FieldByName('NumCard').AsInteger,7));
        Label8.Visible:=True;
       end;
     15:begin
        n:=GetNumCard(Edit1.Text);
        if n=-1 then Abort;
        sNC:=IntToStr(n);
        NumCard:=NumCardToInt(sNC,CR_DOCT1);
        Label2.Visible:=True;
        Label8.Visible:=True;
       end;
{     5:begin
        n:=GetNumCard(Edit1.Text);
        if n=-1 then Abort;
        sNC:=IntToStr(n);
        DM.QrC.Close;
        DM.QrC.SQL.Text:='select Count(*) as Cn from Cards where NumCard='+sNC;
        DM.QrC.Open;
        NumCard:=NumCardToInt(sNC,CR_911);
        if DM.QrC.FieldByName('Cn').AsInteger<=0 then
         begin
          AEC:=1;
          ShowDiscF(P);
          if AEC=1 then
           begin
            DM.Qr.Close;
            DM.Qr.SQL.Clear;
            DM.Qr.SQL.Add('Insert into Cards(NumCard,Summa) Values(');
            DM.Qr.SQL.Add(IntToStr(NumCard)+',0)');
            DM.Qr.ExecSQL;
            Label8.Visible:=True;
           end else begin
                    NumCard:=0;
                    Mess('Карточка не считана!'+#13+'Введены не все данные.',48);
                   end;
         end else Label8.Visible:=True;
       end} else Abort;
    end;
   finally
    if NumCard<>0 then Close;
    Edit1.Text:='';
    Timer1.Enabled:=False;
   end;
  except
   Mess('Карточка не считана!'+#13+'Попробуйте еще раз',48);
   NumCard:=0;
  end;
 end;

end.


