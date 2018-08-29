unit CancelResU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ExtCtrls, OpenLib, Util;

type
  TCancelResF = class(TForm)

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

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit3Enter(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);

  private

  public

    Filt:String;
    Flag:Integer;

  end;

var CancelResF:TCancelResF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TCancelResF.FormCreate(Sender: TObject);
 begin
  Flag:=0;
  Filt:='';
  Caption:=MFC;
  im1.Canvas.Pen.Color:=clGray;
  im1.Canvas.Rectangle(0,0,im1.Width,im1.Height);
  MakeGradientHeightI(im1,clGreen,clLime,1,1,20,im1.Height-2);
 end;

procedure TCancelResF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TCancelResF.BitBtn1Click(Sender: TObject);
var S:String;
 begin
  if (RadioButton1.Checked=True) and (Edit1.Text='') then
   begin
    MainF.MessBox('Введите номер заказа (его должен назвать покупатель) !');
    Edit1.SetFocus;
   end else
  if (RadioButton2.Checked=True) and ((Pos('_',Edit3.Hint)<>0) or (Length(Edit3.Hint)<>9)) then
   begin
    MainF.MessBox('Введите контактный телефон покупателя!');
    Edit3.SetFocus;
   end else
  if (Edit1.Text='') and (RadioButton1.Checked=False) and (RadioButton2.Checked=False) then
   begin
    MainF.MessBox('Введите значение в поле "ФИО покупателя"!');
    Edit1.SetFocus;
   end else
  if ((Pos('_',Edit3.Hint)<>0) or (Length(Edit3.Hint)<>9)) and (RadioButton1.Checked=False) and (RadioButton2.Checked=False) then
   begin
    MainF.MessBox('Введите корректное значение в поле "Контактный телефон покупателя"!');
    Edit3.SetFocus;
   end else begin

             if (RadioButton1.Checked) or (RadioButton2.Checked) then
              begin
               DM.Qr4.Close;
               DM.Qr4.SQL.Clear;
               DM.Qr4.SQL.Add('select * from DhRes where Closed=0 and Priznak=1 and ');

               if RadioButton1.Checked then S:=' iddoc='+Edit1.Text
                                       else S:=' phone='''+Edit3.Text+'''';

               DM.Qr4.SQL.Add(S);
               DM.Qr4.Open;
               if DM.Qr4.IsEmpty then
                begin
                 MainF.MessBox('Такой заказ не найден, или он продан, или отменен!');
                 Exit;
                end;
               Filt:=S;
              end;

             Flag:=1;
             Close;
            end;
 end;

procedure TCancelResF.Edit3KeyPress(Sender: TObject; var Key: Char);
 begin
  EditKeyPress(Sender,Key);
 end;

procedure TCancelResF.Edit3KeyUp(Sender: TObject; var Key: Word; Shift:TShiftState);
 begin
  EditKeyUp(Sender,Key,Shift);
 end;

procedure TCancelResF.Edit3Enter(Sender: TObject);
 begin
  EditEnter(Sender);
 end;

procedure TCancelResF.RadioButton1Click(Sender: TObject);
 begin
  Edit3.Enabled:=False;
  Edit1.Enabled:=True;
  Edit1.SetFocus;
 end;

procedure TCancelResF.RadioButton2Click(Sender: TObject);
 begin
  Edit1.Enabled:=False;
  Edit3.Enabled:=True;
  Edit3.SetFocus;
 end;

procedure TCancelResF.FormActivate(Sender: TObject);
 begin

  if RadioButton1.Visible then
   begin
    RadioButton2.Visible:=True;
    Panel1.Caption:='  Введите данные заказа';
    S.Visible:=False;
    Label4.Visible:=False;
   end; 

  if RadioButton1.Visible then RadioButton1.Checked:=True;
 end;

procedure TCancelResF.Label1MouseEnter(Sender: TObject);
 begin
  TLabel(Sender).Font.Style:=[fsUnderline];
 end;

procedure TCancelResF.Label1MouseLeave(Sender: TObject);
 begin
  TLabel(Sender).Font.Style:=[];
 end;

procedure TCancelResF.Label1Click(Sender: TObject);
 begin
  Flag:=2;
  Close;
 end;

procedure TCancelResF.Edit1KeyPress(Sender: TObject; var Key: Char);
 begin
  if RadioButton1.Checked=False then Exit;
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

end.
