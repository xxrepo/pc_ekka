unit GetNumCardSMSU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, Util, SendSmsUA;

type

  TGetNumCardSMSF = class(TForm)
    Label1: TLabel;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key:Word; Shift:TShiftState);
    procedure Edit4KeyPress(Sender: TObject; var Key:Char);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word; Shift:TShiftState);
    procedure BitBtn3Click(Sender: TObject);

  private

    FNumCard:Int64;
    FKod:String;
    FFlag:Integer;
    {SendSMSUA - отправляет СМС через сервис sms.ua
     RESULT - состояние операции
        aPhoneNum  - входящий  номер телефона на который будет отправлен СМС
        NumCard    - исходящий. Номер карточки клиента закрепленного за номером телефона
        SMSKod     - исходящий. отправленный СМС код
        AnswerCode - исходящий. Возвращаемый код выполненной операции
            1 - отправка выполнена успешно
            -1  Возможно введен несуществующий мобильный номер телефона!
            -3  Нет связи с офисом, невозможно отправить SMS!
            -4  По указаному номеру телефона дисконтная карта не найдена!
    }
    function SendSMSUA(const aPhoneNum : string; out NumCard :string; out SMSKod : string; out AnswerCode : string) : TSMSConfirmStatus;

  public

    property Flag:Integer read FFlag;

    property NumCard:Int64 read FNumCard;

  end;

var GetNumCardSMSF:TGetNumCardSMSF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TGetNumCardSMSF.FormCreate(Sender:TObject);
 begin
  FNumCard:=0;
  FFlag:=0;
  Fkod:='';
  Caption:=MFC;
  Height:=163;
 end;

procedure TGetNumCardSMSF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TGetNumCardSMSF.BitBtn1Click(Sender: TObject);
var Res:String;
  AnswerCode : integer;
 begin
  if IsEmptyPhone(Edit4.Hint) then
   begin
    MainF.MessBox('Введите мобильный номер телефона!',48);
    Edit4.SetFocus;
   end else
  if IsCorrectPhone(Edit4.Hint)=False then
   begin
    MainF.MessBox('Введите корректный мобильный номер телефона!',48);
    Edit4.SetFocus;
   end else begin
             try
               //if (SendSMSUA(Edit4.Text, NumCard, SMSKod, AnswerCode) <> stOk)
               //then
               begin
                 DM.QrX.Close;
                 DM.QrX.SQL.Clear;
                 DM.QrX.SQL.Add('declare @Phone varchar(20), ');
                 DM.QrX.SQL.Add('        @Kod varchar(4), ');
                 DM.QrX.SQL.Add('        @NumCard bigint, ');
                 DM.QrX.SQL.Add('        @Res smallint ');
                 DM.QrX.SQL.Add('set @Phone='''+Edit4.Text+'''');
                 DM.QrX.SQL.Add('exec spY_SendSMSForNumCard @Phone, @Kod output, @NumCard output, @Res output ');
                 DM.QrX.SQL.Add('select @Kod as Kod, @NumCard as NumCard, @Res as Res ');
                 DM.QrX.Open;
                 AnswerCode := DM.QrX.FieldByName('Res').AsInteger;
               end;
               Case AnswerCode of
                 1:begin

                     MainF.MessBox('Сообщение поставлено в очередь, ожидайте SMS на телефон клиента с кодом подтверждения!',
                                  64,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
                     Height:=238;
                     Top:=(Screen.Height-Height) div 2;
                     Label2.Visible:=True;
                     Edit1.Visible:=True;
                     BitBtn3.Visible:=True;
                     BitBtn1.Visible:=False;
                     FNumCard:=StrToInt64(DM.QrX.FieldByName('NumCard').AsString);
                     FKod:=DM.QrX.FieldByName('Kod').AsString;
                     DM.QrX.Close;
                     DM.QrX.SQL.Clear;
//                   Edit1.SetFocus;
                     Exit;
                   end;

                 -1:MainF.MessBox('Возможно введен несуществующий мобильный номер телефона!',
                                 48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
                 -3:MainF.MessBox('Нет связи с офисом, невозможно отправить SMS!',
                                  48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
                 -4:MainF.MessBox('По указаному номеру телефона дисконтная карта не найдена!',
                                 48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
               end
             except
              on E:Exception do
               MainF.RegisterError('Номер карты по SMS',E.Message,False);
             end
            end;
 end;

procedure TGetNumCardSMSF.Edit4Enter(Sender: TObject);
 begin
  EditEnter(Sender);
 end;

procedure TGetNumCardSMSF.Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  EditKeyUp(Sender,Key,Shift);
 end;

procedure TGetNumCardSMSF.Edit4KeyPress(Sender: TObject; var Key: Char);
 begin
  EditKeyPress(Sender,Key);
 end;

procedure TGetNumCardSMSF.Edit4KeyUp(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  EditKeyUp(Sender,Key,Shift);
 end;

procedure TGetNumCardSMSF.BitBtn3Click(Sender:TObject);
 begin
  if Length(Edit1.Text)<>4 then
   begin
    MainF.MessBox('Введите 4-х значный код активации!');
    Edit1.SetFocus;
   end else
  if FKod<>Edit1.Text then
   begin
    MainF.MessBox('Введенный код неверный, повторите ввод либо отправть SMS еще раз!');
    Edit1.SetFocus;
   end else begin
             FFlag:=1;
             Close;
            end;
 end;

function TGetNumCardSMSF.SendSMSUA(const aPhoneNum: string; out NumCard,
                                    SMSKod, AnswerCode: string): TSMSConfirmStatus;

  procedure GetNumCardByPhone(aPhone : string);
  begin

    DM.QrX.Close;
    DM.QrX.SQL.Clear;
    DM.QrX.SQL.Add('declare @Phone varchar(20), ');
    DM.QrX.SQL.Add('        @Kod varchar(4), ');
    DM.QrX.SQL.Add('        @NumCard bigint, ');
    DM.QrX.SQL.Add('        @Res smallint ');
    DM.QrX.SQL.Add('set @Phone='''+aPhone+'''');

    DM.QrX.SQL.Add('select @Kod as Kod, @NumCard as NumCard, @Res as Res ');
    DM.QrX.Open;
  end;
begin


end;

end.


