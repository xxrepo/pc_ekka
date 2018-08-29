unit AddResU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ExtCtrls, OpenLib, Util;

type
  TAddResF = class(TForm)

    s: TLabel;
    Edit1: TEdit;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    Edit3: TEdit;
    Panel1: TPanel;
    im1: TImage;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    Label3: TLabel;
    edKol: TEdit;
    RadioButton3: TRadioButton;

    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
    procedure Edit3KeyPress(Sender:TObject; var Key:Char);
    procedure Edit3KeyUp(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure Edit3Enter(Sender:TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender:TObject; var Key:Char);
    procedure edKolChange(Sender:TObject);
    procedure edKolKeyPress(Sender:TObject; var Key:Char);

  private

    function PrepareZakaz(NumZakaz:Integer):Boolean;

  public

    Filt:String;
    Flag:Integer;
    ShowKol:Boolean;
    Kol:Integer;
    IDRes_Kur:Integer;
    OrderID:Integer;

  end;

var AddResF:TAddResF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TAddResF.FormCreate(Sender: TObject);
 begin
  Flag:=0;
  Filt:='';
  ShowKol:=False;
  Caption:=MFC;
  Kol:=0;
  IDRes_Kur:=0;
 end;

procedure TAddResF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

function TAddResF.PrepareZakaz(NumZakaz:Integer):Boolean;
var Res:Integer;
 begin
  if Prm.IsKurier=False then begin Result:=True; Exit; end;
  Result:=False;
  try
   DM.QrX3.Close;
   DM.QrX3.SQL.Text:='exec spY_TranslateZakaz '+IntToStr(NumZakaz)+','+IntToStr(Prm.ID_Gamma);
   DM.QrX3.Open;
   Res:=DM.QrX3.FieldByName('Res').AsInteger;
   IDRes_Kur:=DM.QrX3.FieldByName('idres').AsInteger;
   OrderID:=NumZakaz;
   Case Res of
    -1:MainF.MessBox('Заказ №'+IntToStr(Numzakaz)+' отменен!');
    -2:MainF.MessBox('Заказ №'+IntToStr(Numzakaz)+' уже выкуплен!');
    -3:MainF.MessBox('Заказ №'+IntToStr(Numzakaz)+' не найден!');
   end;

   if Res=999 then Result:=True;
  except
   on E:Exception do
    MainF.RegisterError('Бронь в аптечном курьере',E.Message,False);
  end;
 end;

procedure TAddResF.BitBtn1Click(Sender: TObject);
var S,Res:String;
 begin
  if RadioButton3.Checked=True then
   begin
    Flag:=2;
    Close;
   end else
  if (RadioButton1.Checked=True) and (Edit1.Text='') then
   begin
    if Prm.IsKurier then
     MainF.MessBox('Введите номер заказа !')
    else
     MainF.MessBox('Введите номер заказа (его должен назвать покупатель) !');

    Edit1.SetFocus;
   end else
  if (RadioButton2.Checked=True) and ((Pos('_',Edit3.Hint)<>0) or (Length(Edit3.Hint)<>10)) then
   begin
    MainF.MessBox('Введите контактный телефон покупателя!');
    Edit3.SetFocus;
   end else
  if (Edit1.Text='') and (RadioButton1.Checked=False) and (RadioButton2.Checked=False) then
   begin
    MainF.MessBox('Введите значение в поле "ФИО покупателя"!');
    Edit1.SetFocus;
   end else
  if ((Pos('_',Edit3.Hint)<>0) or (Length(Edit3.Hint)<>10)) and (RadioButton1.Checked=False) and (RadioButton2.Checked=False) then
   begin
    MainF.MessBox('Введите корректное значение в поле "Контактный телефон покупателя"!');
    Edit3.SetFocus;
   end else
  if (ShowKol=True) and ((edKol.Text='') or (edKol.Text='0')) then
   begin
    MainF.MessBox('Введите количество!');
    edKol.SetFocus;
   end else begin
             if (RadioButton1.Checked) or (RadioButton2.Checked) then
              begin

              if (RadioButton1.Checked) then
               if Not PrepareZakaz(StrToInt(Edit1.Text)) then Exit;

{
               DM.Qr4.Close;
               DM.Qr4.SQL.Clear;
               DM.Qr4.SQL.Add('select * from DhRes where Closed=0 and ');

               if RadioButton1.Checked then S:=' iddoc='+Edit1.Text
                                       else S:=' phone='''+Edit3.Text+'''';

               DM.Qr4.SQL.Add(S);
               DM.Qr4.Open;
}
               DM.Qr4.Close;
               if RadioButton1.Checked then DM.Qr4.SQL.Text:='exec spY_FindZakaz '+Edit1.Text+',null'
                                       else DM.Qr4.SQL.Text:='exec spY_FindZakaz null,'''+Edit3.Text+'''';
               DM.Qr4.Open;

               if DM.Qr4.IsEmpty then
                begin
                 MainF.MessBox('Такой заказ не найден, или он продан, или отменен!');
                 Exit;
                end;

               if DM.Qr4.FieldByName('PaySystemId').AsInteger=1 then
                begin
                 if DM.Qr4.FieldByName('Status_Pay').AsInteger=7 then
                  MainF.MessBox('Данная бронь уже оплачена, необходимо пробить чек и просто отдать товарные позиции по данной брони с чеком!',
                  48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res)
                 else begin
                       MainF.MessBox('Данная бронь является предоплатной, но подтверждения об оплате еще нет!',
                       48,GetFont('MS Sans Serif',12,clRed,[fsBold]),0,Res);
                       Exit;
                      end;
                end;


               // Filt:=' idres='+DM.Qr4.FieldByName('idres').AsString;
               if RadioButton1.Checked then Filt:=' idres='+DM.Qr4.FieldByName('idres').AsString
                                       else Filt:=' phone='''+Edit3.Text+'''';
              end;

             if ShowKol then Kol:=StrToInt(edKol.Text);
             Flag:=1;
             Close;
            end;
 end;

procedure TAddResF.Edit3KeyPress(Sender:TObject; var Key:Char);
 begin
  EditKeyPress(Sender,Key);
 end;

procedure TAddResF.Edit3KeyUp(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  EditKeyUp(Sender,Key,Shift);
 end;

procedure TAddResF.Edit3Enter(Sender: TObject);
 begin
  EditEnter(Sender);
 end;

procedure TAddResF.RadioButton1Click(Sender: TObject);
 begin
  Edit3.Enabled:=False;
  Edit1.Enabled:=True;
  Edit1.SetFocus;
 end;

procedure TAddResF.RadioButton2Click(Sender: TObject);
 begin
  Edit1.Enabled:=False;
  Edit3.Enabled:=True;
  Edit3.SetFocus;
 end;

procedure TAddResF.FormActivate(Sender: TObject);
 begin

  if RadioButton1.Visible then
   begin
    RadioButton2.Visible:=True;
    Panel1.Caption:='  Введите данные заказа';
    S.Visible:=False;
    Label4.Visible:=False;
   end;

  if RadioButton1.Visible then RadioButton1.Checked:=True;

  if ShowKol then
   begin
    Height:=229;
    Top:=(Screen.Height-Height) div 2;
    Label3.Visible:=True;
    edKol.Visible:=True;
   end;

  if Prm.IsKurier then
   begin
    Label1.Visible:=False;
    RadioButton2.Visible:=False;
    RadioButton1.Checked:=True;
    Edit3.Visible:=False;
    RadioButton3.Visible:=True;
   end;

  im1.Canvas.Pen.Color:=clGray;
  im1.Canvas.Rectangle(0,0,im1.Width,im1.Height);
  MakeGradientHeightI(im1,clGreen,clLime,1,1,20,im1.Height-2);

 end;

procedure TAddResF.Label1MouseEnter(Sender: TObject);
 begin
  TLabel(Sender).Font.Style:=[fsUnderline];
 end;

procedure TAddResF.Label1MouseLeave(Sender: TObject);
 begin
  TLabel(Sender).Font.Style:=[];
 end;

procedure TAddResF.Label1Click(Sender: TObject);
 begin
  Flag:=3;
  Close;
 end;

procedure TAddResF.Edit1KeyPress(Sender: TObject; var Key: Char);
 begin
  if RadioButton1.Checked=False then Exit;
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

procedure TAddResF.edKolChange(Sender: TObject);
 begin
  if TEdit(Sender).Text='' then
   begin
    TEdit(Sender).Text:='0';
    TEdit(Sender).SelectAll;
   end;
 end;

procedure TAddResF.edKolKeyPress(Sender: TObject; var Key: Char);
 begin
  if Key<>#8 then
   begin
    if Not (Key in ['0'..'9']) then Key:=#0;
   end;
 end;

end.
