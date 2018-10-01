unit CardReadU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Buttons, jpeg, Util, EnterValueU, ADODB,
     ActnList, ClipBrd;

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
    Label3: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);

  private

    FNumCard:Int64;
    FAEC:Integer;
    FAECC:Integer;
    Fq:Integer;
    FKodEAN:Integer;
    FIsReg:Boolean;
    FIsMBCard:Boolean;
    FTypeCard:Byte;
    FAccumSum:Currency;
    FCheckOnly:Boolean;
    FSSum:Currency;
    FFlag:Integer;
    FDone:Boolean;
    FIsReadCard:Boolean;
    FIsBirth:Byte;

    procedure ShowDiscF(P:Integer; IsLink:Boolean);
    procedure SetMBCard(const Value:Boolean);
    procedure bClick(Sender: TObject);

    function  Mess(S:String; P:Integer):Integer;
    function  CheckBlockCard(Nm:Int64):Boolean;
    function  NumCardToInt(S,Pref:String):Int64;
    function  CheckSuperCard(Nm:Int64): Boolean;
    function  CheckOldCartToNewCard(NC:Int64):Byte;
    procedure SetCheckOnly(const Value: Boolean);

  public
    { Возвращает префикс карты
      возвращает первые aLength символов номера карты aCardNum}
    class function GetPrefixCardByNum(aCardNum : String; aLength : Integer = 3) : String;
   { IsUniversalCorpCard - проверяет является ли карта с номером aCardNum
     корпоративной универсальной картой
    Возвращает
      True если дисконтная карта aCardNum - это универсаная корпоративная карта
      False - в других случаях}
    class function IsUniversalCorpCard(aCardNum : String) : Boolean; overload;
    class function IsUniversalCorpCard(aCardNum : Int64) : Boolean; overload;

    property KodEAN:Integer read FKodEAN write FKodEAN;
    property IsReg:Boolean read FIsReg write FIsReg;
    property NumCard:Int64 read FNumCard write FNumCard;
    property TypeCard:Byte read FTypeCard;
    property AccumSum:Currency read FAccumSum;
    property SSum:Currency read FSSum;
    property AEC:Integer read FAEC write FAEC;
    property AECC:Integer read FAECC write FAECC;
    property IsMBCard:Boolean read FIsMBCard write SetMBCard;
    property CheckOnly:Boolean read FCheckOnly write SetCheckOnly;
    property IsBirth:Byte read FIsBirth;

  end;

// Извлекает номер карточки
Function GetNumCard(S:String):Int64;

Function CheckEANStr(S:String):Integer;

var CardReadF:TCardReadF;
    Tm:TDateTime;
    IsFirst:Boolean;

implementation

uses MainU, DataModuleU, AECardsU, ShareU, EnterNDocU, QOldToNewU,
  GetNumCardSMSU;

{$R *.dfm}

function CheckEANStr(S:String):Integer;
var ln:Integer;
 begin
  try
   Result:=0;
   ln:=Length(S);
   if Ln<8 then Exit;
   if (Prm.AptekaSklad=False) and (((Prm.CR_BEGIN=Copy(S,1,Length(Prm.CR_BEGIN))) or (((Copy(S, 1, 3) ='550') or TCardReadF.IsUniversalCorpCard(S)) and (Prm.FirmID<>5) ) ) and (ln=13)) then Result:=1 else // 1 - зеленые карточки (наши)

   // с 08.08.2018 на "Здоровенькi Були" и Фармалай действуют карты АОЦ в полной мере (и выдача и прием)
   if (Prm.AptekaSklad=True) {and (Prm.FirmID<>22)} and (((Copy(S, 1, 3)='770') or TCardReadF.IsUniversalCorpCard(S)) and (ln=13)) then Result:=1 else // Дисконтные карты оптовых цен
   if (Prm.AptekaSklad=True) {and (Prm.FirmID=22) } and ((Copy(S,1,3)='262') and (ln=13)) then Result:=1 else // Дисконтные карты "Здоровенькi Були"

   if (CR_DOCT1=Copy(S,1,Length(CR_DOCT1))) and (ln=13) then Result:=15 else       // карточки 5% на все препараты
   if (CR_KARAV=Copy(S,1,Length(CR_KARAV))) and (ln=13) then Result:=3 else        // 3 - дисконтные карты супермаркета "Караван"
   if (CR_911=Copy(S,1,Length(CR_911))) and (ln=13) then Result:=5 else            // 5 - спец карточки 911
   if (CR_STUD=Copy(S,1,Length(CR_STUD))) and (ln=13) then Result:=6 else          // 6 - студенческие карточки
   if (CR_DAFI=Copy(S,1,Length(CR_DAFI))) and (ln=13) then Result:=11 else         // 3 - дисконтные карты супермаркета в Дафи
   if (CR_271=Copy(S,1,Length(CR_271))) and (ln=13) then Result:=12 else           // карты для 271
   if ln=8 then Result:=4 else                                                     // 4 - Оранж кард
   if ( ('N'=AnsiUpperCase(Copy(S,1,1))) or ('NH'=AnsiUpperCase(Copy(S,1,2)))  or ('NU'=AnsiUpperCase(Copy(S,1,2))) ) and (ln=9) then Result:=7 else        // - дисконтные карты аптеки Ницких цен для пластика
   if (ln=13) then
    begin
     DM.QrCr.Close;
     DM.QrCr.SQL.Clear;
     DM.QrCr.SQL.Add('select * from MetroCard where NumCard='+(Copy(S,1,ln-2)));
     DM.QrCr.Open;
     if DM.QrCr.IsEmpty=False then Result:=8 else
      begin
       DM.QrCr.Close;
       DM.QrCr.SQL.Clear;
       DM.QrCr.SQL.Add('select * from SprStud where NumCard='+(Copy(S,1,ln)));
       DM.QrCr.Open;
       if DM.QrCr.IsEmpty=False then Result:=8;
      end;
    end;
  except
   Result:=0;
  end;
 end;

procedure TCardReadF.FormCreate(Sender: TObject);
 begin
  if Assigned(MainF) then MainF.IsNumCardSMS:=False;
  IsFirst:=True;
  FIsReadCard:=False;
  Caption:=MFC;
  FFlag:=0;
  ActivateKeyboardLayout(ENLng, 0);
  FTypeCard:=0;
//  LoadKeyboardLayout('00000409',KLF_ACTIVATE);
  KodEAN:=0;
  FNumCard:=0;
  FIsReg:=False;
  Randomize;
  FAccumSum:=0;
  Fq:=0;
  Label3.Caption:='';
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
  ActivateKeyboardLayout(RULng, 0);
 end;

procedure TCardReadF.FormActivate(Sender:TObject);
var Res:String;
 begin
  if Assigned(MainF)=False then SpeedButton1.Enabled:=False; 
  if (CheckOnly=False) and (Prm.FirmID<>5) then
   //PlayFraz(1);
  if Prm.IsPL2Perc=False then
   begin
    if Prm.AptekaSklad=False then
     MainF.MessBox('- "У Вас есть дисконтная карта аптечной сети 9-1-1?" ',48,GetFont('Times New Roman',22,$00006600,[fsBold]),0,Res,False,'Озвучьте фразу:')
    else
     MainF.MessBox('- "У Вас есть дисконтная карта аптечной сети АОЦ?" ',48,GetFont('Times New Roman',22,$00006600,[fsBold]),0,Res,False,'Озвучьте фразу:')
   end else begin
             Label1.Caption:='Проведите карточку через устройство чтения...';
             Label4.Visible:=False;
            end;

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
   end else begin
             Label7.Visible:=False;
            end;
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

function TCardReadF.CheckBlockCard(Nm:Int64):Boolean;
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

function TCardReadF.CheckSuperCard(Nm:Int64):Boolean;
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

procedure TCardReadF.ShowDiscF(P:Integer; IsLink:Boolean);
 begin
  AEC:=0;
  AECC:=P;
  try

   AECardsF:=TAECardsF.Create(Self);
   try
    AECardsF.NumCard:=NumCard;
    AECardsF.IsLink:=IsLink;
    AECardsF.TypeCard:=FTypeCard;
    AECardsF.IsMomBabyCard:=IsMBCard and MainF.IsMomBabyCard(NumCard);
    Application.ProcessMessages;
    AECardsF.ShowModal;
    if AECardsF.Flag=1 then AEC:=1;
   finally
    AECardsF.Free;
   end;
  except
  end;
 end;

function TCardReadF.NumCardToInt(S:String; Pref:String):Int64;
 begin
  if (Pref=CR_BEGDR) {or (Pref=CR_NAKLOF)} or (Pref=CR_BIOSTR) or (Pref=CR_DOCT1) then
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
  Result:=StrToInt64(S);
 end;

function TCardReadF.CheckOldCartToNewCard(NC:Int64):Byte;
var S:String;
 begin
  Result:=255;
  QOldToNewF:=TQOldToNewF.Create(Self);
  try
   DM.QrC.Close;
   DM.QrC.SQL.Clear;
   DM.QrC.SQL.Add('declare @nc bigint, @sm numeric(8,2) ');
   DM.QrC.SQL.Add('set @nc='+IntToStr(NC));

   DM.QrC.SQL.Add('if (select Count(*) from MomBabyCards where NumCard=@nc)>0');
   DM.QrC.SQL.Add(' select 1 as Pskd,7 as Skd');
   DM.QrC.SQL.Add('else');
   DM.QrC.SQL.Add(' begin');
   DM.QrC.SQL.Add('  set @sm=IsNull((select Sum(Summa) from Cards where NumCard=@nc),0)');
   DM.QrC.SQL.Add('  select dbo.GetSkdPlus() as PSkd,IsNull((select Max(Skd) from BonusCards where NumCard=@nc),');
   DM.QrC.SQL.Add('         IsNull((select case when @sm>0 then Max(SkdNew) else Max(Skd) end from Skd (nolock) where type_skd=1 and Summ<@sm),IsNull((select Min(skd) from Skd where Type_Skd=1),0))) as Skd ');
   DM.QrC.SQL.Add(' end');
   DM.QrC.Open;

   if DM.QrC.FieldByName('Skd').AsFloat<0 then
    begin
     Result:=0;
     Exit;
    end;

  { if Prm.AptekaID=58 then
    begin
     QOldToNewF.Label1.Caption:='Карточка № '+IntToStr(NC)+' (текущий процент скидки '+DM.QrC.FieldByName('Skd').AsString+') работает по старой дисконтной программе!!!';
     QOldToNewF.PSkd:=DM.QrC.FieldByName('PSkd').AsInteger;
     Application.ProcessMessages;
     QOldToNewF.AccumSum:=FAccumSum;
     Application.ProcessMessages;
     QOldToNewF.ShowModal;
    end else} QOldToNewF.Flag:=1;

   if QOldToNewF.Flag=1 then
    begin
     DM.QrC.Close;
     DM.QrC.SQL.Clear;
//     if Prm.AptekaID=58 then S:='' else
     DM.QrC.SQL.Add('update Cards set SumMonth=IsNull(SumMonth,0),TypeCard=1 where IsNull(TypeCard,0)=0 and NumCard='+IntToStr(NC) );
     DM.QrC.SQL.Add('update CardUser set TypeCard=1 where NumCard='+IntToStr(NC));
     DM.QrC.ExecSQL;
    end;

   Result:=QOldToNewF.Flag;
  finally
   if Not Result  in [0,1] then Abort;
   QOldToNewF.Free;
  end;
 end;

procedure TCardReadF.Timer1Timer(Sender:TObject);
var sNC:String;
    B,IsLink:Boolean;
    IsOld,P:Integer;
    n,n1:Int64;
    Res:String;

 begin
  if Edit1.Text='' then begin Tm:=Time; Exit; end;
  try
   KodEAN:=0;
   NumCard:=0;

//   if Length(Edit1.Text)<=1 then Tm:=Time;

   if Length(Edit1.Text)=12 then Edit1.Text:=Edit1.Text+'0';

   if Time-Tm>StrToTime('00:00:01') then
    begin
     Timer1.Enabled:=False;
     ShowMessage('Таймаут чтения карты');

     if (Edit1.Text<>'') and (MainF.Design=False) then
      try
       DM.QrLog1.Close;
       DM.QrLog1.SQL.Clear;
       DM.QrLog1.SQL.Add('insert into CtrlVLog(dt,priznak,id_gamma,id_kassa,numcard)');
       DM.QrLog1.SQL.Add('values(getdate(),2,'+IntToStr(Prm.ID_Gamma)+','+IntToStr(Opt.KassaID)+','''+Copy(Edit1.Text,1,13)+''')');
       DM.QrLog1.ExecSQL;
      except
      end;

     Timer1.Enabled:=True;
     Edit1.Text:='';
     Exit;
    end;

   if (((Length(Edit1.Text)=13) and (Prm.IsPL2Perc=False)) or
       ((Length(Edit1.Text)=9) and (Prm.IsPL2Perc=True))) or (Fq>=20) then
    begin
     Fq:=0;
    end else if Fq<=20 then begin Inc(Fq); Exit; end;

   try
    FIsReadCard:=True;
    Label7.Visible:=False;
    Label2.Visible:=False;
    KodEAN:=CheckEANStr(Edit1.Text);
    Case KodEAN of
     1,5,6,8:begin
          Case KodEAN of
           1:begin

              if Prm.AptekaSklad=True  or TCardReadF.IsUniversalCorpCard(Edit1.Text) then 
                sNC:=IntToStr(GetNumCard(Edit1.Text))
              else 
                sNC:=Copy(IntToStr(GetNumCard(Edit1.Text)),3,10);
              if Not (CheckBlockCard(StrToInt64(sNC))) then Exit;
              if Not (CheckSuperCard(StrToInt64(sNC))) then Exit;
              if Not (MainF.CheckLimitSkd(StrToInt64(sNC))) then Exit;

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
         if CheckOnly=False then UpdateCardInfo(StrToInt64(sNC),IsLink,FIsBirth); // Обновление даннык по карте из офисной базы
         Application.ProcessMessages;

         DM.QrC.Close;
         DM.QrC.SQL.Clear;
         DM.QrC.SQL.Add('if ((select Count(*) from BonusCards where NumCard='+sNC+')>0 or '+Copy(sNC,1,3)+'=262 ) and ');
         DM.QrC.SQL.Add('   (select Count(*) from Cards where NumCard='+sNC+')=0');
         DM.QrC.SQL.Add(' insert into Cards(NumCard,Summa,TypeCard,AccumSum,SumMonth) values('+sNC+',0,1,0,0)');
         DM.QrC.SQL.Add('select top 1 NumCard,IsNull(IsOld,0) as IsOld, IsNull(TypeCard,1) as TypeCard,IsNull(AccumSum,0) as AccumSum from Cards where NumCard='+sNC);
         DM.QrC.Open;
         IsOld:=DM.QrC.FieldByName('IsOld').AsInteger;
         B:=True;
         if DM.QrC.RecordCount>0 then // Карточка зарегистрирована
          begin
           FAccumSum:=DM.QrC.FieldByName('AccumSum').AsCurrency;


           FTypeCard:=0;
           if (Prm.FirmID=5) or (DM.QrC.FieldByName('IsOld').AsInteger=1) then FTypeCard:=0 else
            begin

             if (DM.QrC.FieldByName('TypeCard').AsInteger=1) {and (Prm.AptekaID<>58)} then FTypeCard:=1 else
             if CheckOnly=False then
              begin
               { if Prm.AptekaID=58 then FTypeCard:=CheckOldCartToNewCard(StrToInt64(sNC)) else} FTypeCard:=1;
//               if FTypeCard=1) and  then PrintBlankForNewDiscontSystem;
              end;
            end;

           if (FAccumSum>0) and (CheckOnly=False) and (IsOld=0) and (FTypeCard=1) then
            begin
             FSSum:=0;
             PlayFraz(3,FAccumSum);
             MainF.MessBox('- "У Вас на карточке накоплено '+CurrToStrF(FAccumSum,ffFixed,2)+' грн. Желаете их списать сейчас или будете накапливать дальше?"',48,GetFont('Times New Roman',22,$00006600,[fsBold]),0,Res,True,'Озвучьте фразу:');
             try
              FSSum:=StrToCurr(Res);
             except
              FSSum:=0;
             end;
            end;

           DM.QrC.Close;
           DM.QrC.SQL.Text:='update CardUser set id_user='+IntToStr(Prm.UserID)+' where id_user is null and NumCard='+sNC+#10+
                            'select *,IsNull((select Blocking from BlockCards where numcard=CardUser.NumCard),1) as Blocking from CardUser where NumCard='+sNC;
           DM.QrC.Open;
           if DM.QrC.RecordCount>0 then
            if (DM.QrC.FieldByName('FIO').AsString='') or (DM.QrC.FieldByName('Blocking').AsInteger=0) or
               ((DM.QrC.FieldByName('Address').AsString='') and (DM.QrC.FieldByName('Phone').AsString=''))  then B:=False;
           P:=2;
          end else begin

                    MainF.NPSvid:='';
                    DM.QrC.Close;
                    DM.QrC.SQL.Text:='select top 1 NumCard from BonusCards where NumCard='+sNC;
                    DM.QrC.Open;

                    if (DM.QrC.IsEmpty) and (Prm.FirmID<>5) then
                     begin
                      {if Prm.AptekaID in [58] then FTypeCard:=CheckOldCartToNewCard(StrToInt64(sNC))
                                              else} FTypeCard:=1;
                     end else FTypeCard:=0;
                    if (FTypeCard=1) and (CheckOnly=False) then PrintBlankForNewDiscontSystem;

                    if Prm.AptekaID in [145..147] then
                     begin
                      EnterNDocF:=TEnterNDocF.Create(Self);
                      try
                       Application.ProcessMessages;
                       EnterNDocF.ShowModal;
                       if EnterNDocF.Flag=1 then
                        begin
                         MainF.NPSvid:=EnterNDocF.Edit1.Text+' '+EnterNDocF.Edit2.Text;
                         DM.QrC.Close;
                         DM.QrC.SQL.Clear;
                         DM.QrC.SQL.Add('delete from BonusCards where NumCard='+sNC);
                         DM.QrC.SQL.Add('insert into BonusCards(NumCard,Skd,Vip) values('+sNC+',7,2) ');
                         DM.QrC.ExecSQL;
                        end;
                      finally
                       EnterNDocF.Free;
                      end;
                     end;
                    B:=False; P:=1;
                   end;
         AEC:=1;
         NumCard:=StrToInt64(sNC);
         if (NumCard>=479000) and (NumCard<=479999) and (B=False) then
          begin
           DM.Qr.Close;
           DM.Qr.SQL.Clear;
           DM.Qr.SQL.Add('Insert into Cards(NumCard,Summa) Values(');
           DM.Qr.SQL.Add(IntToStr(NumCard)+',0)');
           DM.Qr.SQL.Add('Insert into CardsLog(NumCard,Summa,IsUnload) Values(');
           DM.Qr.SQL.Add(IntToStr(NumCard)+',0,0)');
           DM.Qr.ExecSQL;
           B:=True;
          end;

//         if Not (B) then IsReg:=True;
         if Not (B) and (CheckOnly=False) then ShowDiscF(P,IsLink);
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
{     7:begin
        n:=GetNumCard(Edit1.Text);
        if n=-1 then Abort;
        sNC:=IntToStr(n);
        NumCard:=NumCardToInt(sNC,CR_NAKLOF);
        Label2.Visible:=True;
        Label8.Visible:=True;
       end;}
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
     7:begin
//        if Not CheckBlockCard(StrToInt64(CR_PL2PERC+'000'+Copy(Edit1.Text,3,7))) then Exit;
        NumCard:=StrToInt64(CR_PL2PERC+'000'+Copy(Edit1.Text,3,7));
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
        NumCard:=StrToInt64(CR_ORANG+IntToStrF(DM.Qr.FieldByName('NumCard').AsInteger,7));
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
    FIsReadCard:=False;
    Edit1.Text:='';
    if NumCard<>0 then
     begin
      FFlag:=1;
      Close;
      Timer1.Enabled:=False;
    end else Timer1.Enabled:=True;
   end;
  except
   on E:Exception do
    begin
     Edit1.Text:='';
     Label7.Visible:=False;
     Mess('Карточка не считана!'+#13+'Попробуйте еще раз! '+E.Message,48);
     NumCard:=0;
    end;
  end;
 end;

procedure TCardReadF.SetMBCard(const Value:Boolean);
 begin
  FIsMBCard:=Value;
  Label3.Visible:=Value;
//  if Value=False then Height:=165;
 end;

procedure TCardReadF.bClick(Sender:TObject);
 begin
  PrintBlankForNewDiscontSystem;
 end;

procedure TCardReadF.FormCloseQuery(Sender:TObject; var CanClose:Boolean);
var Btn:TControl;
    Res,S:String;
 begin
  if Prm.IsPL2Perc then begin CanClose:=True; Exit; end;
  try
   Btn:=nil;
   if Prm.AptekaSklad=False then
    begin
     Btn:=TBitBtn.Create(Self);
     TBitBtn(Btn).Caption:='Ознакомиться с правилами...';
     TBitBtn(Btn).Width:=181;
     TBitBtn(Btn).OnClick:=bClick;
    end else
   if (Prm.IsNewDiscOpt=True) and (Date<StrToDate('01.09.17')) then
    begin
     Btn:=TLabel.Create(Self);
     TLabel(Btn).Font.Style:=[fsBold];
     TLabel(Btn).Font.Color:=clRed;
     TLabel(Btn).AutoSize:=False;
     TLabel(Btn).WordWrap:=True;
     TLabel(Btn).Width:=370;
     TLabel(Btn).Height:=30;
//     TLabel(Btn).Caption:='За каждую регистрацию новой дисконтной карты вы получите бонус - 1 грн. в копилку!';
     TLabel(Btn).Caption:='ЗА КАЖДУЮ РЕГИСТРАЦИЮ НОВОЙ ДИСКОНТНОЙ КАРТЫ, ВЫ ПОЛУЧИТЕ БОНУС - 1 ГРН. В КОПИЛКУ!';
    end;

   if (FFlag<>1) and (CheckOnly=False) and (Prm.FirmID<>5) then
    begin
     PlayFraz(2);
     S:='Озвучьте фразу:';
{
     if (Prm.IsNewDiscOpt=True) and (Date<StrToDate('01.09.17')) then
      S:='ЗА КАЖДУЮ ВЫДАННУЮ НОВУЮ ДИСКОНТНУЮ КАРТУ, ВЫ ПОЛУЧИТЕ БОНУС 1 грн. В КОПИЛКУ! ';
}
     if MainF.MessBox('- "Давайте мы Вам оформим карту, она реально позволяет экономить!" ',52,GetFont('Times New Roman',22,$00006600,[fsBold]),0,Res,False,S,Btn)=ID_YES then
      begin
       CanClose:=False;
       Edit1.Text:='';
       Label7.Visible:=False;
       Timer1.Enabled:=True;
      end else CanClose:=True;
    end;
  finally
   Btn.Free;
  end;
 end;

{ TCntrEdit }

procedure TCardReadF.Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if (Key in [45,86]) then IsFirst:=True;
 end;

procedure TCardReadF.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin

  if (Key in [16,17]) then
   try
    if IsFirst=False then Exit;

    DM.QrLog1.Close;
    DM.QrLog1.SQL.Clear;
    DM.QrLog1.SQL.Add('insert into CtrlVLog(dt,priznak,id_gamma,id_kassa,numcard)');
    DM.QrLog1.SQL.Add('values(getdate(),1,'+IntToStr(Prm.ID_Gamma)+','+IntToStr(Opt.KassaID)+','''+Copy(Clipboard.AsText,1,13)+''')');
    DM.QrLog1.ExecSQL;
    IsFirst:=False;

   except
   end;

 end;

procedure TCardReadF.SpeedButton1Click(Sender: TObject);
 begin
  GetNumCardSMSF:=TGetNumCardSMSF.Create(Self);
  try
   GetNumCardSMSF.ShowModal;
   if GetNumCardSMSF.Flag=1 then
    begin
     MainF.IsNumCardSMS:=True;
     Edit1.Text:=IntToStr(GetNumCardSMSF.NumCard);
    end; 
  finally
   GetNumCardSMSF.Free;
  end;
 end;

procedure TCardReadF.SetCheckOnly(const Value:Boolean);
 begin
  FCheckOnly:=Value;
  SpeedButton1.Visible:=Not Value;
 end;

class function TCardReadF.GetPrefixCardByNum(aCardNum: String; aLength: Integer): String;
begin
  Result := Copy(aCardNum,1,aLength);
end;

class function TCardReadF.IsUniversalCorpCard(aCardNum: String): Boolean;
begin
  Result := TCardReadF.GetPrefixCardByNum(aCardNum, Length(CR_UNUVERSAL_CORP_CARD_PREFIX111)) = CR_UNUVERSAL_CORP_CARD_PREFIX111;
end;

class function TCardReadF.IsUniversalCorpCard(aCardNum: Int64): Boolean;
begin
   Result := TCardReadF.IsUniversalCorpCard(IntToStr(aCardNum));
end;


end.


