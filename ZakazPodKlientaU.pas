unit ZakazPodKlientaU;

interface

uses
  Forms, Graphics, Classes, Controls, StdCtrls, Buttons;
//  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
//  Dialogs;

type
  TZakazPodKlientaF = class(TForm)
    lbARTICLE_TEXT1: TLabel;
    lbARTICLE_TEXT2: TLabel;
    lbARTICLE_TEXT3: TLabel;
    lbTEXT1: TLabel;
    lbTelefon: TLabel;
    edTelefon: TEdit;
    lbNameClient: TLabel;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    edNameClient: TEdit;
    lbNOTE1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edTelefonEnter(Sender: TObject);
    procedure edTelefonKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edTelefonKeyPress(Sender: TObject; var Key: Char);
    procedure edTelefonKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbOKClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  ZakazPodKlientaF: TZakazPodKlientaF;

const
  LEFT_INDENT = 12;
  TOP_INDENT = 12;
  SPACE_INDENT = 12;
  CONNECTED_SPACE_INDENT = 12;

  FORM_WIDTH = 480;

  LB_CAPTION_FONT_COLOR = clHotLight;
  LB_CAPTION_FONT_SIZE = 14;
  LB_CAPTION_FONT_STYLE: set of TFontStyle = [fsBold];
  LB_FONT_COLOR = clHotLight;
  LB_FONT_SIZE = 12;
  LB_FONT_STYLE: set of TFontStyle = [fsBold];
  LB_NOTE_FONT_COLOR = clMenuHighlight;
  LB_NOTE_FONT_SIZE = 8;
  LB_NOTE_FONT_STYLE: set of TFontStyle = [];

  ARTICLE_TEXT1 = 'Преврати отказ';
  ARTICLE_TEXT2 = 'в заказ под клиента';
  ARTICLE_TEXT3 = 'и заработай 2% от стоимости заказа *';
  TEXT1 = '(если клиент выкупит свой заказ)';
  NOTE_TEXT1 = '* - сотрудник аптеки, оформивший заказ под клиента'+#10+
               '    получает 2% от стоимости заказа при условии, '+#10+
               '    что клиент выкупит свой заказ.';//+#10+''+#10+''+#10+''+#10+''+#10+''+#10+''+#10+''+#10+'';

  BTN_OK_CAPTION = 'Хорошо!';
  BTN_OK_FONT_COLOR = clGreen;
  BTN_CANCEL_CAPTION = 'Клиент не дает телефон';
  BTN_CANCEL_FONT_COLOR = clMaroon;

  PHONE_EDIT_FIELD = '+38 (___) ___-__-__';

implementation

uses
  MainU, Util, PrOtkazU;

{$R *.dfm}

procedure TZakazPodKlientaF.FormCreate(Sender: TObject);
begin
  ClientWidth:=FORM_WIDTH;
  lbARTICLE_TEXT1.Caption:=ARTICLE_TEXT1;
  lbARTICLE_TEXT1.Font.Color:=LB_CAPTION_FONT_COLOR;
  lbARTICLE_TEXT1.Font.Size:=LB_CAPTION_FONT_SIZE;
  lbARTICLE_TEXT1.Font.Style:=LB_CAPTION_FONT_STYLE;
  lbARTICLE_TEXT1.AutoSize:=true;
  lbARTICLE_TEXT1.AutoSize:=false;
  lbARTICLE_TEXT1.Left:=LEFT_INDENT;
  lbARTICLE_TEXT1.Top:=TOP_INDENT;
  lbARTICLE_TEXT1.Width:=ClientWidth-lbARTICLE_TEXT1.Left-LEFT_INDENT;
  lbARTICLE_TEXT1.Alignment:=taCenter;

  lbARTICLE_TEXT2.Caption:=ARTICLE_TEXT2;
  lbARTICLE_TEXT2.Font.Color:=LB_CAPTION_FONT_COLOR;
  lbARTICLE_TEXT2.Font.Size:=LB_CAPTION_FONT_SIZE;
  lbARTICLE_TEXT2.Font.Style:=LB_CAPTION_FONT_STYLE;
  lbARTICLE_TEXT2.AutoSize:=true;
  lbARTICLE_TEXT2.AutoSize:=false;
  lbARTICLE_TEXT2.Left:=LEFT_INDENT;
  lbARTICLE_TEXT2.Top:=lbARTICLE_TEXT1.Top+lbARTICLE_TEXT1.Height+CONNECTED_SPACE_INDENT;
  lbARTICLE_TEXT2.Width:=ClientWidth-lbARTICLE_TEXT2.Left-LEFT_INDENT;
  lbARTICLE_TEXT2.Alignment:=taCenter;

  lbARTICLE_TEXT3.Caption:=ARTICLE_TEXT3;
  lbARTICLE_TEXT3.Font.Color:=LB_CAPTION_FONT_COLOR;
  lbARTICLE_TEXT3.Font.Size:=LB_CAPTION_FONT_SIZE;
  lbARTICLE_TEXT3.Font.Style:=LB_CAPTION_FONT_STYLE;
  lbARTICLE_TEXT3.AutoSize:=true;
  lbARTICLE_TEXT3.AutoSize:=false;
  lbARTICLE_TEXT3.Left:=LEFT_INDENT;
  lbARTICLE_TEXT3.Top:=lbARTICLE_TEXT2.Top+lbARTICLE_TEXT2.Height+CONNECTED_SPACE_INDENT;
  lbARTICLE_TEXT3.Width:=ClientWidth-lbARTICLE_TEXT3.Left-LEFT_INDENT;
  lbARTICLE_TEXT3.Alignment:=taCenter;

  lbTEXT1.Caption:=TEXT1;
  lbTEXT1.Font.Color:=LB_FONT_COLOR;
  lbTEXT1.Font.Size:=LB_FONT_SIZE;
  lbTEXT1.Font.Style:=LB_FONT_STYLE;
  lbTEXT1.AutoSize:=true;
  lbTEXT1.AutoSize:=false;
  lbTEXT1.Left:=LEFT_INDENT;
  lbTEXT1.Top:=lbARTICLE_TEXT3.Top+lbARTICLE_TEXT3.Height+SPACE_INDENT;
  lbTEXT1.Width:=ClientWidth-lbTEXT1.Left-LEFT_INDENT;
  lbTEXT1.Alignment:=taCenter;

  lbTelefon.Left:=LEFT_INDENT;
  lbTelefon.Top:=lbTEXT1.Top+lbTEXT1.Height+SPACE_INDENT;
  edTelefon.Left:=lbTelefon.Left+lbTelefon.Width+CONNECTED_SPACE_INDENT;
  edTelefon.Top:=lbTelefon.Top;
  edTelefon.Width:=ClientWidth-edTelefon.Left-LEFT_INDENT;
  edTelefon.Text:=PHONE_EDIT_FIELD;

  lbNameClient.Left:=LEFT_INDENT;
  lbNameClient.Top:=edTelefon.Top+edTelefon.Height+SPACE_INDENT;
  edNameClient.Left:=lbNameClient.Left+lbNameClient.Width+CONNECTED_SPACE_INDENT;
  edNameClient.Top:=lbNameClient.Top;
  edNameClient.Width:=ClientWidth-edNameClient.Left-LEFT_INDENT;
  edNameClient.Text:='';

  bbOK.Caption:=BTN_OK_CAPTION;
  bbOK.Font.Color:=BTN_OK_FONT_COLOR;
  bbOK.Left:=LEFT_INDENT*2;
  bbOK.Top:=edNameClient.Top+edNameClient.Height+SPACE_INDENT;
  bbOK.Width:=trunc(ClientWidth/2)-bbOK.Left-SPACE_INDENT;

  bbCancel.Caption:=BTN_CANCEL_CAPTION;
  bbCancel.Font.Color:=BTN_CANCEL_FONT_COLOR;
  bbCancel.Left:=trunc(ClientWidth/2)+SPACE_INDENT;
  bbCancel.Top:=bbOK.Top;
  bbCancel.Width:=trunc(ClientWidth/2)-bbOK.Left-LEFT_INDENT;

  lbNOTE1.Caption:=NOTE_TEXT1;
  lbNOTE1.Font.Color:=LB_NOTE_FONT_COLOR;
  lbNOTE1.Font.Size:=LB_NOTE_FONT_SIZE;
  lbNOTE1.Font.Style:=LB_NOTE_FONT_STYLE;
  lbNOTE1.AutoSize:=true;
  lbNOTE1.Left:=LEFT_INDENT;
  lbNOTE1.Top:=bbCancel.Top+bbCancel.Height+SPACE_INDENT;
  lbNOTE1.Width:=ClientWidth-lbNOTE1.Left-LEFT_INDENT;
  lbNOTE1.AutoSize:=true;
  lbNOTE1.AutoSize:=false;
  lbNOTE1.Alignment:=taLeftJustify;

  ClientHeight:=lbNOTE1.Top+lbNOTE1.Height+TOP_INDENT;
end;

procedure TZakazPodKlientaF.FormActivate(Sender: TObject);
begin
  with ZakazPodKlientaF do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:=MFC;
    edTelefon.SetFocus;
  end;
end;

procedure TZakazPodKlientaF.edTelefonEnter(Sender: TObject);
begin
  EditEnter(Sender);
end;

procedure TZakazPodKlientaF.edTelefonKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  EditKeyUp(Sender,Key,Shift);
end;

procedure TZakazPodKlientaF.edTelefonKeyPress(Sender: TObject; var Key: Char);
begin
  EditKeyPress(Sender,Key);
end;

procedure TZakazPodKlientaF.edTelefonKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  EditKeyUp(Sender,Key,Shift);
end;

procedure TZakazPodKlientaF.bbOKClick(Sender: TObject);
begin

  if ( (IsEmptyPhone(edTelefon.Hint)=True) or ((Pos('_',edTelefon.Hint)<>0) or (Length(edTelefon.Hint)<>10))) then
   begin
    MainF.MessBox('Введите корректный номер телефона клиента!');
    edTelefon.SetFocus;
    Exit;
   end;
//  PrOtkazF.rb5.Checked:=true;
  PrOtkazF.edPhone.Text:=edTelefon.Text;
  PrOtkazF.edPhone.Hint:=edTelefon.Hint;
  PrOtkazF.Label6.Visible:=true;
  PrOtkazF.edPhone.Visible:=true;
  ZakazPodKlientaF.Close;
end;

procedure TZakazPodKlientaF.bbCancelClick(Sender: TObject);
begin
  ZakazPodKlientaF.Close;
end;

procedure TZakazPodKlientaF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrOtkazF.fl_phone:=true;
end;

end.
