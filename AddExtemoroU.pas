unit AddExtemoroU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, OpenLib, Buttons, Util;

type

  TAddExtemoroF = class(TForm)

    Panel1: TPanel;
    Edit1: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    im1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    ComboBox1: TComboBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit4: TEdit;
    Label6: TLabel;
    ComboBox2: TComboBox;
    lbDescr: TLabel;
    Label5: TLabel;
    Edit2: TEdit;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);

  private

    aList:Array of Record
                    Descr:String;
                   end;

    Phone:String;
  public

  end;

var AddExtemoroF:TAddExtemoroF;

implementation

uses MainU, SimpleMessU, DataModuleU;

{$R *.dfm}

procedure TAddExtemoroF.FormCreate(Sender: TObject);
var i:Integer;
 begin
  Caption:=MFC;
  im1.Canvas.Pen.Color:=clGray;
  im1.Canvas.Rectangle(0,0,im1.Width,im1.Height);
  MakeGradientHeightI(im1,clGreen,clLime,1,1,20,im1.Height-2);

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select phone from Apteks (nolock) where id_apteka='+IntToStr(Prm.AptekaID);
  DM.QrEx.Open;
  Phone:=DM.QrEx.FieldByName('Phone').AsString;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select apteka,id_apteka,descr from Apteks (nolock) where IsExtempore=1 order by 1';
  DM.QrEx.Open;

  SetLength(aList,0);
  SetLength(aList,DM.QrEx.RecordCount);

  ComboBox1.Clear;
  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    ComboBox1.Items.Add(DM.QrEx.FieldByName('Apteka').AsString);

    aList[i-1].Descr:=DM.QrEx.FieldByName('Descr').AsString;
//    aList[i].Phone:=DM.QrEx.FieldByName('Phone').AsString;
   end;


  ComboBox1.ItemIndex:=-1;

  ComboBox2.Clear;

  for i:=0 to 120 do ComboBox2.Items.Add(IntToStr(StrToInt(FormatDateTime('yyyy',Date))-i));

 end;

procedure TAddExtemoroF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TAddExtemoroF.Edit3Enter(Sender: TObject);
 begin
  EditEnter(Sender);
 end;

procedure TAddExtemoroF.Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  EditKeyUp(Sender,Key,Shift);
 end;

procedure TAddExtemoroF.Edit3KeyPress(Sender: TObject; var Key: Char);
 begin
  EditKeyPress(Sender,Key);
 end;

procedure TAddExtemoroF.Edit3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  EditKeyUp(Sender,Key,Shift);
 end;

procedure TAddExtemoroF.BitBtn1Click(Sender: TObject);
var S,S1:String;
 begin

  if Edit1.Text='' then
   begin
    MainF.MessBox('Введите значение в поле "ФИО покупателя"!');
    Edit1.SetFocus;
   end else
  if Edit2.Text='' then
   begin
    MainF.MessBox('Введите необходимый объем!');
    Edit2.SetFocus;
   end else
  if ((Pos('_',Edit3.Hint)<>0) or (Length(Edit3.Hint)<>10)) then
   begin
    MainF.MessBox('Введите контактный телефон покупателя!');
    Edit3.SetFocus;
   end else
  if ComboBox1.Text='' then
   begin
    MainF.MessBox('Выберите торговую точку "Где удобно купить"!');
    ComboBox1.SetFocus;
   end else
  if (RadioButton1.Checked=False) and (RadioButton2.Checked=False) then
   begin
    MainF.MessBox('Выберите возраст или год рождения покупателя!');
   end else
  if (RadioButton1.Checked) and (Edit4.Text='') then
   begin
    MainF.MessBox('Введите возраст покупателя!');
    Edit4.SetFocus;
   end else
  if (RadioButton2.Checked) and (ComboBox2.Text='') then
   begin
    MainF.MessBox('Введите год рождения покупателя!');
    ComboBox2.SetFocus;
   end else begin
             try
              if RadioButton1.Checked then S1:=RadioButton1.Caption+': '+Edit4.Text+' лет'
                                      else S1:=RadioButton2.Caption+': '+ComboBox2.Text;

              S:='Заказ по экстемпоральной рецептуре '+#10#10+
                 'От т/т: '+Prm.AptekaNameRU+'(тел. '+Phone+')'#10+
                 'От: '+Prm.UserName+#10+
                 'Дата заказа: '+DateTimeToStr(Now)+#10#10+

                 'ФИО покупателя: '+Edit1.Text+#10+
                 S1+#10+
                 'Телефон покупателя: '+Edit3.Text+#10+
                 'Объем: '+Edit2.Text+#10#10+

                 'Удобно купить на т/т: '+ComboBox1.Text+#10#10+'Состав рецепта: '+#10+Memo1.Lines.Text;

              SimpleMessF:=TSimpleMessF.Create(Self);

              try

               SimpleMessF.Silent:=True;
               SimpleMessF.IsExtempore:=True;
               SimpleMessF.reW.Text:=S;
               SimpleMessF.BitBtn3Click(nil);

               Close;

              finally
               SimpleMessF.Free;
              end;

             except
              on E:Exception do MainF.MessBox('Ошибка отправки сообщения: '+E.Message);
             end;
            end;
 end;

procedure TAddExtemoroF.FormClose(Sender:TObject; var Action:TCloseAction);
 begin
  SetLength(aList,0);
 end;

procedure TAddExtemoroF.ComboBox1Change(Sender: TObject);
 begin
  lbDescr.Caption:='';
  if ComboBox1.ItemIndex=-1 then Exit;
  lbDescr.Caption:=aList[ComboBox1.ItemIndex].Descr;
 end;

end.


// Аптека во по вторникам и пятница с 15:00



