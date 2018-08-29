unit CancelResU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ExtCtrls, OpenLib, Util;

type
  TCancelResF = class(TForm)
    Edit1: TEdit;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit3: TEdit;
    Panel1: TPanel;
    im1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit3Enter(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);

  private

  public

    Filt:String;
    Flag:Integer;
    NumZakaz:Integer;
    PrefixID:String;
    Phone:String;

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
  MakeGradientHeightI(im1,clMaroon,clRed,1,1,20,im1.Height-2);
 end;

procedure TCancelResF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TCancelResF.BitBtn1Click(Sender: TObject);
var S:String;
 begin
  if Edit1.Text='' then
   begin
    MainF.MessBox('Введите номер заказа (его должен назвать покупатель) !');
    Edit1.SetFocus;
   end else
  if (Pos('_',Edit3.Hint)<>0) or (Length(Edit3.Hint)<>10) then
   begin
    MainF.MessBox('Введите контактный телефон покупателя!');
    Edit3.SetFocus;
   end else
  if ((Pos('_',Edit3.Hint)<>0) or (Length(Edit3.Hint)<>10)) then
   begin
    MainF.MessBox('Введите корректное значение в поле "Контактный телефон покупателя"!');
    Edit3.SetFocus;
   end else
  if (Edit1.Text<>IntToStr(NumZakaz)) and (Edit1.Text<>PrefixID) then
   begin
    MainF.MessBox('Номер заказа неверный!');
    Edit1.SetFocus;
   end else
  if Edit3.Text<>Phone then
   begin
    MainF.MessBox('Номер телефона неверный!');
    Edit1.SetFocus;
   end else begin
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
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

end.
