unit SimpleMessU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ComCtrls, Buttons, ADODB, ExtCtrls, ComObj, Util,
  ActnList;


type

  TSimpleMessF = class(TForm)
    reW: TRichEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    ActionList1: TActionList;
    Action1: TAction;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label3MouseEnter(Sender: TObject);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);

  private

    FIsNeedSend: Boolean;

    procedure SetIsNeedSend(const Value: Boolean);

  public

    Silent:Boolean;
    IsExtempore:Boolean;
    Tem,ID_Dest:Integer;

    property IsNeedSend:Boolean read FIsNeedSend write SetIsNeedSend;

  end;

procedure ShowSentMessages;

var SimpleMessF:TSimpleMessF;

implementation

uses MainU,DataModuleU,SentMessU;

{$R *.dfm}

procedure TSimpleMessF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TSimpleMessF.BitBtn3Click(Sender:TObject);
var B:Boolean;
    ID:Integer;
    Mess:String;
 begin
  Mess:=reW.Lines.Text;
  if Mess='' then
   begin
    MainF.MessBox('Введите текст сообщения!');
    Exit;
   end else

  Mess:=StringReplace(Mess,':','-',[rfReplaceAll, rfIgnoreCase]);

  if Length(Mess)>6950 then
   begin
    MainF.MessBox('Сообщение слишком длинное! Вы можете отправить сообщение частями!');
    Exit;
   end;

   if (IsNeedSend=True) and (Length(Trim(Mess))<=5) then
    begin
     IsNeedSend:=False;
     Close;
     Exit;
    end;
  try
//   QrToOff:=TADOQuery.Create(nil);
   (*
   try

    try
     DM.spY_AddMessFromApteks.Close;
     DM.spY_AddMessFromApteks.ConnectionString:=Opt.ConStrMess;
     //'Provider=SQLOLEDB.1; Password=ckj#ktn#djc;Persist Security Info=True; User ID=admin; Initial Catalog=BMESS;Data Source=192.168.0.9';

     DM.spY_AddMessFromApteks.CommandTimeout:=100;

     DM.spY_AddMessFromApteks.Close;

     DM.spY_AddMessFromApteks.Parameters.ParamValues['@Mess']:=Mess;
     DM.spY_AddMessFromApteks.Parameters.ParamValues['@Type_mess']:='Сообщение';
     DM.spY_AddMessFromApteks.Parameters.ParamValues['@ID_Apteka']:=Prm.AptekaID;
     DM.spY_AddMessFromApteks.Parameters.ParamValues['@Apteka']:=Prm.AptekaNameRU;
     DM.spY_AddMessFromApteks.Parameters.ParamValues['@ID_FROM']:=Prm.ID_Gamma;
     DM.spY_AddMessFromApteks.Parameters.ParamValues['@FIO_From']:=Prm.UserName;
     DM.spY_AddMessFromApteks.Parameters.ParamValues['@Recipient']:=Label2.Caption;

     DM.spY_AddMessFromApteks.Parameters.ParamValues['@id_tema']:=Tem;
     DM.spY_AddMessFromApteks.Parameters.ParamValues['@ID_To']:=-1;
     DM.spY_AddMessFromApteks.Parameters.ParamValues['@ID_Status']:=1;

     DM.spY_AddMessFromApteks.Parameters.ParamValues['@ID_user_read']:=NULL;
     DM.spY_AddMessFromApteks.Parameters.ParamValues['@Date_update']:=NULL;
     DM.spY_AddMessFromApteks.Parameters.ParamValues['@id']:=0;

     if IsExtempore then DM.spY_AddMessFromApteks.Parameters.ParamValues['@IsExtempore']:=1
                    else DM.spY_AddMessFromApteks.Parameters.ParamValues['@IsExtempore']:=0;

     DM.spY_AddMessFromApteks.Open;
     ID:=DM.spY_AddMessFromApteks.FieldByName('ID').AsInteger;
     if ID=-1 then Abort;

     B:=True;
    except
     on E:Exception do
      begin
//       ShowMessage(E.Message);
       if ID=-1 then raise EAbort.Create(DM.spY_AddMessFromApteks.FieldByName('ErStr').AsString);
       B:=False;
      end;
    end;

   finally
   // QrToOff.Free;
   end;
   *)
   B:=False;

   DM.Qr4.Close;
   DM.Qr4.SQL.Clear;
   DM.Qr4.SQL.Clear;

   if B then
    DM.Qr4.SQL.Add('insert into Inform..MessFromApteks(id,dateread,Mess,id_from,id_dest,id_apteka,id_tema,IsExtempore) values('+IntToStr(ID)+',getdate(),')
   else
    DM.Qr4.SQL.Add('insert into Inform..MessFromApteks(Mess,id_from,id_dest,id_apteka,id_tema,IsExtempore) values(');

   DM.Qr4.SQL.Add(''''+Mess+''',');

   DM.Qr4.SQL.Add(IntToStr(Prm.ID_Gamma)+','+IntToStr(ID_Dest)+','+IntToStr(Prm.AptekaID)+','+IntToStr(Tem)+','+IntToStr(BoolToInt(IsExtempore))+')');
   DM.Qr4.SQL.Add('select 9999 as Res');
   try
    DM.Qr4.Open;
   except
    DM.ADOCo.Connected:=False;
    DM.ADOCo.Connected:=True;
    DM.Qr4.Open;
   end;

   if Silent=False then
    begin
//     if B then
     MainF.MessBox('Сообщение поставлено в очередь на отправку!'#10#10'Просмотреть очередь сообщений можно в меню '#10'"Служебные" - "Просмотреть отправленные сообщения" ',64)
{     else
      MainF.MessBox('Нет связи с офисом. Сообщение поставлено в очередь и будет отправлено автоматически как только появится связь!'#10#10'Просмотреть статус сообщения можно, нажав синюю строку "Отправленные сообщения..."');
}
    end;
   reW.Clear;
   if IsNeedSend then
    begin
     IsNeedSend:=False;
     Close;
    end;
  except
   on E:Exception do
    begin
     Application.MessageBox(PChar('Ошибка отправки сообщения: '+E.Message),PChar(MFC),48);
     BitBtn2.Visible:=True;
     Close;
    end;
  end;
 end;

procedure TSimpleMessF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  Silent:=False;
  IsExtempore:=False;
  IsNeedSend:=False;
 end;

procedure TSimpleMessF.Label3MouseEnter(Sender:TObject);
 begin
  if Sender=Nil then Exit;
  if Not TLabel(Sender).Enabled then Exit;
  TLabel(Sender).Font.Color:=clBlue;
  TLabel(Sender).Font.Style:=[fsBold,fsUnderLine];
 end;

procedure TSimpleMessF.Label3MouseLeave(Sender:TObject);
 begin
  if Sender=Nil then Exit;
  if Not TLabel(Sender).Enabled then Exit;
  TLabel(Sender).Font.Color:=clNavy;
  TLabel(Sender).Font.Style:=[fsUnderLine];
 end;

procedure ShowSentMessages;
 begin
  try
   SentMessF:=TSentMessF.Create(nil);
   try
    if Prm.UserRole in [R_ADMIN,R_SUPER] then
     SentMessF.Label1.Caption:='Все сообщения '
    else
     SentMessF.Label1.Caption:='Сообщения от : '+Prm.UserName;

    SentMessF.Label1.Tag:=Prm.ID_Gamma;
    SentMessF.FilterMess;
    Application.ProcessMessages;
    SentMessF.ShowModal;
   finally
    SentMessF.Free;
   end;
  except
   on E:Exception do MainF.MessBox('Ошибка открытия истории сообщений: '+E.Message);
  end;
 end;

procedure TSimpleMessF.Label3Click(Sender: TObject);
 begin
  ShowSentMessages;
 end;

procedure TSimpleMessF.Action1Execute(Sender: TObject);
 begin
  if FIsNeedSend=False then Close;
 end;

procedure TSimpleMessF.SetIsNeedSend(const Value: Boolean);
 begin
  FIsNeedSend:=Value;
  if Value then
   begin
    BorderIcons:=[];
    BitBtn2.Visible:=False;
   end else begin
             BorderIcons:=[biSystemMenu,biMinimize];
             BitBtn2.Visible:=True;
            end;
 end;

end.



