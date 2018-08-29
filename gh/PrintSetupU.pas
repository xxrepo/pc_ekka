unit PrintSetupU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, OpenLib, PrintReport;

type
  TPrintSetupF = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    UpDown1: TUpDown;
    Edit1: TLabeledEdit;
    Edit2: TLabeledEdit;
    UpDown2: TUpDown;
    Edit3: TLabeledEdit;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    Edit4: TLabeledEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Bevel2: TBevel;
    Label2: TLabel;
    Bevel3: TBevel;
    Image2: TImage;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Image3: TImage;
    Label3: TLabel;
    Bevel4: TBevel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Bevel5: TBevel;
    UpDown5: TUpDown;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Bevel6: TBevel;
    Label8: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    FontDialog1: TFontDialog;
    FontDialog2: TFontDialog;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Image4: TImage;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    CheckBox1: TCheckBox;
    Label10: TLabel;
    Bevel7: TBevel;
    Panel1: TPanel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
  private
    procedure DrawRect;
  public
    Flag:Integer;
    FWidth:Integer;
    FHeight:Integer;
    FAlignU,FAlignD:Integer;
  end;

var PrintSetupF: TPrintSetupF;

implementation

{$R *.dfm}

procedure TPrintSetupF.FormCreate(Sender: TObject);
 begin
  Flag:=0;
  FAlignU:=AL_LEFT;
  FAlignD:=AL_LEFT;
 end;

procedure TPrintSetupF.DrawRect;
var dx,dy,dx1,dy1:Integer;
 begin
  Image1.Canvas.Pen.Style:=psSolid;
  MakeGradientHeightI(Image1,clWhite,$00AEBDD5);
  DrawSimpleRect(Image1,clBtnFace);
  Image1.Canvas.Brush.Style:=bsClear;
  Image1.Canvas.Pen.Style:=psDash;
  dx:=Round(UpDown2.Position*(Image1.Width-4)/FWidth);
  dy:=Round(UpDown1.Position*(Image1.Height-4)/FHeight);
  dx1:=Image1.Width-Round(UpDown3.Position*(Image1.Width-4)/FWidth)-3;
  dy1:=Image1.Height-Round(UpDown4.Position*(Image1.Height-4)/FHeight)-3;
  Image1.Canvas.Rectangle(dx,dy,dx1,dy1);
 end;

procedure TPrintSetupF.BitBtn4Click(Sender: TObject);
 begin
  Close;
 end;

procedure TPrintSetupF.BitBtn3Click(Sender: TObject);
 begin
  Flag:=1;
  Close;
 end;

procedure TPrintSetupF.ComboBox1Change(Sender: TObject);
 begin
  Label4.Caption:='';
  FWidth:=210; FHeight:=297;
  Case ComboBox1.ItemIndex of
   0:begin
      FWidth:=294; FHeight:=420;
      Label4.Caption:='294x420 μμ';
     end; 
   1:begin
      FWidth:=210; FHeight:=297;
      Label4.Caption:='210x297 μμ';
     end;
   2:begin
      FWidth:=148; FHeight:=210;
      Label4.Caption:='148x210 μμ';
     end; 
  end;
  DrawRect;
 end;

procedure TPrintSetupF.Edit2Change(Sender: TObject);
 begin
  try
   TUpDown(FindComponent('UpDown'+IntToStr(TLabeledEdit(Sender).Tag))).Position:=StrToInt(TLabeledEdit(Sender).Text);
  except
   TLabeledEdit(Sender).Text:=IntToStr(TUpDown(FindComponent('UpDown'+IntToStr(TLabeledEdit(Sender).Tag))).Position);
  end;
  DrawRect;
 end;

procedure TPrintSetupF.Edit5Change(Sender: TObject);
 begin
  try
   UpDown5.Position:=StrToInt(Edit5.Text);
  except
   Edit5.Text:=IntToStr(UpDown5.Position);
  end;
 end;

procedure TPrintSetupF.BitBtn1Click(Sender: TObject);
 begin
  Flag:=2;
  Close;
 end;

procedure TPrintSetupF.BitBtn2Click(Sender: TObject);
 begin
  Flag:=3;
  Close;
 end;

procedure TPrintSetupF.FormActivate(Sender: TObject);
 begin
  ComboBox1Change(nil);
 end;

procedure TPrintSetupF.SpeedButton1Click(Sender: TObject);
 begin
  Memo1.Alignment:=taLeftJustify;
  FAlignU:=AL_LEFT;
 end;

procedure TPrintSetupF.SpeedButton2Click(Sender: TObject);
 begin
  Memo1.Alignment:=taCenter;
  FAlignU:=AL_CENTER;
 end;

procedure TPrintSetupF.SpeedButton3Click(Sender: TObject);
 begin
  Memo1.Alignment:=taRightJustify;
  FAlignU:=AL_RIGHT;
 end;

procedure TPrintSetupF.SpeedButton5Click(Sender: TObject);
 begin
  Memo2.Alignment:=taLeftJustify;
  FAlignD:=AL_LEFT;
 end;

procedure TPrintSetupF.SpeedButton6Click(Sender: TObject);
 begin
  Memo2.Alignment:=taCenter;
  FAlignD:=AL_CENTER;
 end;

procedure TPrintSetupF.SpeedButton7Click(Sender: TObject);
 begin
  Memo2.Alignment:=taRightJustify;
  FAlignD:=AL_Right;
 end;

procedure TPrintSetupF.SpeedButton4Click(Sender: TObject);
 begin
  FontDialog1.Font.Assign(Memo1.Font);
  if FontDialog1.Execute then Memo1.Font.Assign(FontDialog1.Font);
 end;

procedure TPrintSetupF.SpeedButton8Click(Sender: TObject);
 begin
  FontDialog2.Font.Assign(Memo2.Font);
  if FontDialog2.Execute then Memo2.Font.Assign(FontDialog2.Font);
 end;

procedure TPrintSetupF.SpeedButton9Click(Sender: TObject);
 begin
  Memo1.SetSelTextBuf('&NumP&');
 end;

procedure TPrintSetupF.SpeedButton10Click(Sender: TObject);
 begin
  Memo2.SetSelTextBuf('&NumP&');
 end;

procedure TPrintSetupF.SpeedButton11Click(Sender: TObject);
 begin
  FAlignU:=AL_JUST;
 end;

procedure TPrintSetupF.SpeedButton12Click(Sender: TObject);
 begin
  FAlignD:=AL_JUST;
 end;

end.
