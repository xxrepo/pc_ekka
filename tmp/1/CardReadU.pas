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
    SpeedButton3: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);

  private

    FNumCard:Int64;
    FNumCardS:String;
    FAEC:Integer;
    FAECC:Integer;
    Fq:Integer;

    function  Mess(S:String; P:Integer):Integer;

    function GetNumCard(S:String):Int64;

  public

    property NumCard:Int64 read FNumCard write FNumCard;
    property NumCardS:String read FNumCardS write FNumCardS;

    property AEC:Integer read FAEC write FAEC;
    property AECC:Integer read FAECC write FAECC;

  end;



var CardReadF:TCardReadF;

implementation

uses MainU, DataModuleU, AECardsU, ShareU;

{$R *.dfm}

procedure TCardReadF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  LoadKeyboardLayout('00000409',KLF_ACTIVATE);
  FNumCard:=0;
  FNumCardS:='';
  Randomize;
  Fq:=0;
 end;

function TCardReadF.GetNumCard(S:String):Int64;
 begin
  try
   if Length(S)<12 then Abort;
   Result:=StrToInt64(Copy(S,1,12));
  except
   Result:=0;
  end;
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

procedure TCardReadF.Timer1Timer(Sender:TObject);
var ln:Integer;
    n:Int64;

 begin
  if Edit1.Text='' then Exit;
  try
   if (Length(Edit1.Text)=13) or (Fq>=20) then
    begin
     Timer1.Enabled:=False;
     Fq:=0;
    end else if Fq<=20 then begin Inc(Fq); Exit; end;
   NumCard:=0;
   NumCardS:='';
   try
    Label7.Visible:=False;
    ln:=Length(Edit1.Text);
    if (ln<>13) or (ln<>8) then Abort;
    Case ln of
     13:NumCard:=GetNumCard(Edit1.Text);
      8:try
         StrToInt(Edit1.Text);
         Abort;
        except
         NumCardS:=Edit1.Text;
        end;
    end;
   finally
    if (NumCard<>0) or (NumCardS<>'') then Close;
    Edit1.Text:='';
    Timer1.Enabled:=False;
   end;
  except
   Mess('Карточка не считана!'+#13+'Попробуйте еще раз',48);
   NumCard:=0;
  end;
 end;

procedure TCardReadF.SpeedButton3Click(Sender: TObject);
 begin
  if Prm.AptekaID<>9 then Exit;
  try
   if InputBox('Password', 'Введите пароль', '')<>'555' then Exit;
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select * from Cards');
   DM.Qr.SQL.Add('where Summa>1700 and Summa<8000 and NumCard>200000 and');
   DM.Qr.SQL.Add('      NumCard not in (select NumCard from BlockCards) and');
   DM.Qr.SQL.Add('      NumCard not in (select NumCard from BonusCards)');
   DM.Qr.Open;
   DM.Qr.First;
   DM.Qr.MoveBy(Random(DM.Qr.RecordCount));
   NumCard:=DM.Qr.FieldByName('NumCard').AsInteger;
   MainF.FlagW:=True;
   Close;
  except
  end;
 end;

end.


