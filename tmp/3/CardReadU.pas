unit CardReadU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Buttons, jpeg, Util, EnterValueU, ADODB;

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
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

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

    procedure ShowDiscF(P: Integer);
    procedure SetMBCard(const Value:Boolean);
    procedure bClick(Sender: TObject);

    function  Mess(S:String; P:Integer):Integer;
    function  CheckBlockCard(Nm:Int64):Boolean;
    function  NumCardToInt(S,Pref:String):Int64;
    function  CheckSuperCard(Nm:Int64): Boolean;
    function  CheckOldCartToNewCard(NC:Int64):Byte;
    procedure UpdateCardInfo(N: Int64);

  public

    property KodEAN:Integer read FKodEAN write FKodEAN;
    property IsReg:Boolean read FIsReg write FIsReg;
    property NumCard:Int64 read FNumCard write FNumCard;
    property TypeCard:Byte read FTypeCard;
    property AccumSum:Currency read FAccumSum;
    property SSum:Currency read FSSum;
    property AEC:Integer read FAEC write FAEC;
    property AECC:Integer read FAECC write FAECC;
    property IsMBCard:Boolean read FIsMBCard write SetMBCard;
    property CheckOnly:Boolean read FCheckOnly write FCheckOnly;

  end;

// Извлекает номер карточки
Function GetNumCard(S:String):Int64;

Function CheckEANStr(S:String):Integer;

var CardReadF:TCardReadF;

implementation

uses MainU, DataModuleU, AECardsU, ShareU, EnterNDocU, QOldToNewU;

{$R *.dfm}

function CheckEANStr(S:String):Integer;
var ln:Integer;
 begin
  try
   Result:=0;
   ln:=Length(S);
   if Ln<8 then Exit;
   if ((Prm.CR_BEGIN=Copy(S,1,Length(Prm.CR_BEGIN))) or (Copy(S,1,3)='550')) and (ln=13) then Result:=1 else // 1 - зеленые карточки (наши)
//   if (CR_BEGDR=Copy(S,1,Length(CR_BEGDR))) and (ln=13) then Result:=2 else        // 2 - карточки 10% на определенные препараты
//   if (CR_NAKLOF=Copy(S,1,Length(CR_NAKLOF))) and (ln=13) then Result:=7 else    // карточки 10% на определенные препараты
   if (CR_DOCT1=Copy(S,1,Length(CR_DOCT1))) and (ln=13) then Result:=15 else       // карточки 5% на все препараты
//   if (CR_BIOSTR=Copy(S,1,Length(CR_BIOSTR))) and (ln=13) then Result:=9 else      // карточки 10% на определенные препараты
   if (CR_KARAV=Copy(S,1,Length(CR_KARAV))) and (ln=13) then Result:=3 else        // 3 - дисконтные карты супермаркета "Караван"
   if (CR_911=Copy(S,1,Length(CR_911))) and (ln=13) then Result:=5 else            // 5 - спец карточки 911
   if (CR_STUD=Copy(S,1,Length(CR_STUD))) and (ln=13) then Result:=6 else          // 6 - студенческие карточки
   if (CR_DAFI=Copy(S,1,Length(CR_DAFI))) and (ln=13) then Result:=11 else         // 3 - дисконтные карты супермаркета в Дафи
   if (CR_271=Copy(S,1,Length(CR_271))) and (ln=13) then Result:=12 else           // карты для 271
   if ln=8 then Result:=4 else                                                     // 4 - Оранж кард
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
  IsClosed:=True;
 end;

procedure TCardReadF.FormActivate(Sender:TObject);
var Res:String;
 begin
  if (CheckOnly=False) and (Prm.FirmID<>5) then
   MainF.MessBox('- "У Вас есть дисконтная карта аптечной сети 9-1-1?" ',48,GetFont('Times New Roman',22,$00006600,[fsBold]),Res,False,'Фраза:');

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

procedure TCardReadF.ShowDiscF(P:Integer);
 begin
  AEC:=0;
  AECC:=P;
  try

   AECardsF:=TAECardsF.Create(Self);
   try
    AECardsF.NumCard:=NumCard;
    AECardsF.TypeCard:=FTypeCard;
    AECardsF.IsMomBabyCard:=IsMBCard;
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
   DM.QrC.SQL.Add('  select dbo.GetSkdPlus() as PSkd,IsNull((select -Max(Skd) from BonusCards where NumCard=@nc),');
   DM.QrC.SQL.Add('         IsNull((select case when @sm>0 then Max(SkdNew) else Max(Skd) end from Skd (nolock) where type_skd=1 and Summ<@sm),IsNull((select Min(skd) from Skd where Type_Skd=1),0))) as Skd ');
   DM.QrC.SQL.Add(' end');
   DM.QrC.Open;

   if DM.QrC.FieldByName('Skd').AsFloat<0 then
    begin
     Result:=0;
     Exit;
    end;

   QOldToNewF.Label1.Caption:='Карточка № '+IntToStr(NC)+' (текущий процент скидки '+DM.QrC.FieldByName('Skd').AsString+') работает по старой дисконтной программе!!!';
   QOldToNewF.PSkd:=DM.QrC.FieldByName('PSkd').AsInteger;
   Application.ProcessMessages;
   QOldToNewF.ShowModal;
   if QOldToNewF.Flag=1 then
    begin
     DM.QrC.Close;
     DM.QrC.SQL.Clear;
     DM.QrC.SQL.Add('update Cards set SumMonth=0,TypeCard=1 where IsNull(TypeCard,0)=0 and NumCard='+IntToStr(NC) );
     DM.QrC.SQL.Add('update CardUser set TypeCard=1 where NumCard='+IntToStr(NC));
     DM.QrC.ExecSQL;
    end;
   Result:=QOldToNewF.Flag;
  finally
   if Not Result  in [0,1] then Abort;
   QOldToNewF.Free;
  end;
 end;

procedure TCardReadF.UpdateCardInfo(N:Int64);
 begin
  if CheckOnly=True then Exit;
  try
  // QrToOff:=TADOQuery.Create(nil);
   try
   { ConToOff:=TADOConnection.Create(Self);
    ConToOff.Connected:= false;
    ConToOff.LoginPrompt:=False;
    ConToOff.ConnectionString:=Opt.ConStrMess;
    ConToOff.ConnectOptions:=coAsyncConnect;
    ConToOff.OnExecuteComplete:=OnExecQr;

    QrToOff.Connection:=ConToOff;
    QrToOff.ExecuteOptions:=[eoAsyncExecute];
    QrToOff.CommandTimeout:=10;
    QrToOff.Close;
    QrToOff.SQL.Text:='exec datafromapteks..spY_CardInfo :ncard';
    QrToOff.Parameters.ParamByName('ncard').Value:=N;

    Fdone:=False;
    QrToOff.Open;
    Repeat
     if FDone then Exit;
     Application.ProcessMessages;
    Until False;
   }
    DM.QrX.Close;
    DM.QrX.SQL.Clear;
    DM.QrX.SQL.Add('exec [192.168.0.9\SQL5].datafromapteks.dbo.spY_CardInfo '+IntToStr(N));
    DM.QrX.Open;
    
    if (DM.QrX.IsEmpty) or (DM.QrX.FieldByName('NumCard').AsInteger=-1) then Exit;

    DM.QrC.Close;
    DM.QrC.SQL.Clear;
    DM.QrC.SQL.Add('BEGIN TRANSACTION');
    DM.QrC.SQL.Add('if (select Count(*) from Cards (nolock) where NumCard=:ncard)<=0');
    DM.QrC.SQL.Add(' insert into Cards(NumCard,Summa,TypeCard,AccumSum,SumMonth) ');
    DM.QrC.SQL.Add(' values(:ncard1,:summa,:typecard,:accumsum,:summonth) ');
    DM.QrC.SQL.Add('else ');
    DM.QrC.SQL.Add(' update Cards set Summa=:summa1, TypeCard=:typecard1, AccumSum=:accumsum1, SumMonth=:summonth1 ');
    DM.QrC.SQL.Add(' where NumCard=:ncard2 ');

    DM.QrC.SQL.Add('if @@error<>0 ');
    DM.QrC.SQL.Add(' begin');
    DM.QrC.SQL.Add('  ROLLBACK TRANSACTION');
    DM.QrC.SQL.Add('  raiserror(''Ошибка записи информации по карте'',16,1)');
    DM.QrC.SQL.Add(' end ');
    DM.QrC.SQL.Add(' delete from CardsNeedUpdate where NumCard=:ncard3');

    DM.QrC.SQL.Add('COMMIT TRANSACTION');

    DM.QrC.Parameters.ParamByName('ncard').Value:=N;
    DM.QrC.Parameters.ParamByName('ncard1').Value:=N;
    DM.QrC.Parameters.ParamByName('ncard2').Value:=N;
    DM.QrC.Parameters.ParamByName('ncard3').Value:=N;

    DM.QrC.Parameters.ParamByName('Summa').Value:=DM.QrX.FieldByName('Summa').AsCurrency;
    DM.QrC.Parameters.ParamByName('Summa1').Value:=DM.QrX.FieldByName('Summa').AsCurrency;

    DM.QrC.Parameters.ParamByName('TypeCard').Value:=DM.QrX.FieldByName('TypeCard').AsInteger;
    DM.QrC.Parameters.ParamByName('TypeCard1').Value:=DM.QrX.FieldByName('TypeCard').AsInteger;

    DM.QrC.Parameters.ParamByName('AccumSum').Value:=DM.QrX.FieldByName('AccumSum').AsCurrency;
    DM.QrC.Parameters.ParamByName('AccumSum1').Value:=DM.QrX.FieldByName('AccumSum').AsCurrency;

    DM.QrC.Parameters.ParamByName('SumMonth').Value:=DM.QrX.FieldByName('SumMonth').AsCurrency;
    DM.QrC.Parameters.ParamByName('SumMonth1').Value:=DM.QrX.FieldByName('SumMonth').AsCurrency;

    DM.QrC.ExecSQL;

   finally
   {
    QrToOff.Free;
    ConToOff.Free;
   }
   end;
  except
   try
    DM.QrC.Close;
    DM.QrC.SQL.Clear;
    DM.QrC.SQL.Add('delete from CardsNeedUpdate where NumCard=:ncard');
    DM.QrC.SQL.Add('insert into CardsNeedUpdate(NumCard) values(:ncard1)');
    DM.QrC.Parameters.ParamByName('ncard').Value:=N;
    DM.QrC.Parameters.ParamByName('ncard1').Value:=N;
    DM.QrC.ExecSQL;
   except
   end;
  end;
 end;

procedure TCardReadF.Timer1Timer(Sender:TObject);
var sNC:String;
    B:Boolean;
    P:Integer;
    n,n1:Int64;
    Res:String;

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
              if (Prm.FirmID=5) and (Copy(IntToStr(GetNumCard(Edit1.Text)),1,2)='66') then sNC:=IntToStr(GetNumCard(Edit1.Text))
                                                                                      else sNC:=Copy(IntToStr(GetNumCard(Edit1.Text)),3,10);
              if Not(CheckBlockCard(StrToInt64(sNC))) then Exit;
              if Not(CheckSuperCard(StrToInt64(sNC))) then Exit;
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

         UpdateCardInfo(StrToInt64(sNC)); // Обновление даннык по карте из офисной базы

         DM.QrC.Close;
         DM.QrC.SQL.Text:='select top 1 NumCard,IsNull(IsOld,0) as IsOld, IsNull(TypeCard,0) as TypeCard,IsNull(AccumSum,0) as AccumSum from Cards where NumCard='+sNC;
         DM.QrC.Open;
         B:=True;
         if DM.QrC.RecordCount>0 then // Карточка зарегистрирована
          begin
           FAccumSum:=DM.QrC.FieldByName('AccumSum').AsCurrency;

           if (FAccumSum>0) and (CheckOnly=False) and (DM.QrC.FieldByName('IsOld').AsInteger=0) then
            begin
             FSSum:=0;
             MainF.MessBox('- "У Вас на карточке накоплено '+CurrToStrF(FAccumSum,ffFixed,2)+' грн. Желаете их списать сейчас или будете накапливать дальше?"',48,GetFont('Times New Roman',22,$00006600,[fsBold]),Res,True,'Фраза:');
             try
              FSSum:=StrToCurr(Res);
             except
              FSSum:=0;
             end;
            end;

           FTypeCard:=0;
           if (Prm.FirmID=5) or (DM.QrC.FieldByName('IsOld').AsInteger=1) then FTypeCard:=0 else
            begin
             if DM.QrC.FieldByName('TypeCard').AsInteger=1 then FTypeCard:=1 else
             if CheckOnly=False then
              begin
               FTypeCard:=CheckOldCartToNewCard(StrToInt64(sNC));
               if FTypeCard=1 then PrintBlankForNewDiscontSystem;
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
                      if Prm.AptekaID in [58,12,43,78] then FTypeCard:=CheckOldCartToNewCard(StrToInt64(sNC))
                                                       else FTypeCard:=1;
                     end else FTypeCard:=0;
                    if (FTypeCard=1) and (CheckOnly=False) then PrintBlankForNewDiscontSystem;
                    if Prm.AptekaID in [145..147] then
                     begin
                      EnterNDocF:=TEnterNDocF.Create(Self);
                      try
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
    if NumCard<>0 then begin FFlag:=1; Close; end;
    Edit1.Text:='';
    Timer1.Enabled:=False;
   end;
  except
   on E:Exception do
    begin
     Mess('Карточка не считана!'+#13+'Попробуйте еще раз! '+E.Message,48);
     NumCard:=0;
    end;
  end;
 end;

procedure TCardReadF.SetMBCard(const Value:Boolean);
 begin
  FIsMBCard:=Value;
  Label3.Visible:=Value;
  if Value=False then Height:=165;
 end;

procedure TCardReadF.bClick(Sender:TObject);
 begin
  PrintBlankForNewDiscontSystem;
 end;

procedure TCardReadF.FormCloseQuery(Sender:TObject; var CanClose:Boolean);
var Btn:TBitBtn;
    Res:String;
 begin
  try
   Btn:=TBitBtn.Create(Self);
   Btn.Caption:='Ознакомиться с правилами...';
   Btn.Width:=181;
   Btn.OnClick:=bClick;
   if (FFlag<>1) and (CheckOnly=False) and (Prm.FirmID<>5) then
    if MainF.MessBox('- "Давайте мы Вам оформим карту, она реально позволяет экономить!" ',52,GetFont('Times New Roman',22,$00006600,[fsBold]),Res,False,'Фраза:',Btn)=ID_YES then CanClose:=False
                                                                                                                                                                     else CanClose:=True;
  finally
   Btn.Free;
  end;
 end;

{ TCntrEdit }

end.



