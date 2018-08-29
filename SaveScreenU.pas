unit SaveScreenU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, OpenLib, StdCtrls, JPEG, ADODB, DB;

type
  TSaveScreenF = class(TForm)
    lb9_1: TLabel;
    lb9_3: TLabel;
    lb9_25: TLabel;
    lb9_24: TLabel;
    lb9_23: TLabel;
    lb9_22: TLabel;
    lb9_21: TLabel;
    lb9_19: TLabel;
    lb9_20: TLabel;
    lb9_17: TLabel;
    lb9_18: TLabel;
    lb9_15: TLabel;
    lb9_16: TLabel;
    lb9_14: TLabel;
    lb9_12: TLabel;
    lb9_13: TLabel;
    lb9_11: TLabel;
    lb9_10: TLabel;
    lb9_9: TLabel;
    lb9_8: TLabel;
    lb9_7: TLabel;
    lb9_6: TLabel;
    lb9_5: TLabel;
    lb9_4: TLabel;
    lb9_2: TLabel;
    Im: TImage;
    lbs_1: TLabel;
    lbs_2: TLabel;
    lbs_3: TLabel;
    lbs_4: TLabel;
    lbs_8: TLabel;
    lbs_9: TLabel;
    lbs_10: TLabel;
    lbs_12: TLabel;
    lbs_13: TLabel;
    lbs_14: TLabel;
    lbs_16: TLabel;
    lbs_15: TLabel;
    lbs_18: TLabel;
    lbs_17: TLabel;
    lbs_5: TLabel;
    lbs_7: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    Label3: TLabel;
    lba_1: TLabel;
    lba_2: TLabel;
    lba_3: TLabel;
    lba_4: TLabel;
    lba_5: TLabel;
    lba_12: TLabel;
    lba_13: TLabel;
    lba_6: TLabel;
    lba_14: TLabel;
    lba_7: TLabel;
    lba_15: TLabel;
    lba_16: TLabel;
    lba_8: TLabel;
    lba_17: TLabel;
    lba_9: TLabel;
    lba_10: TLabel;
    lba_19: TLabel;
    lba_20: TLabel;
    lba_11: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private

    Brend:String;
    Num:Integer;

    procedure DrawSteps;

  public

  end;

var SaveScreenF:TSaveScreenF;

implementation

uses MainU, DataModuleU, ShowPictU;

{$R *.dfm}

var mX,mY:Integer;

procedure TSaveScreenF.FormCreate(Sender: TObject);
var dx,dy:Integer;
    i:Integer;
    S:String;
    Bm:TBitMap;

 begin
  Randomize;
  Num:=0;
  Color:=clBlack;
  Left:=0;
  Top:=0;
  dx:=(Screen.Width-1920) div 2;
  dy:=(Screen.Height-694) div 2;

 {
  if Prm.IsNewDiscOpt=True then
   begin
    dx:=dx-48;
    dy:=dy-20;
   end;
 }

  Width:=Screen.Width;
  Height:=Screen.Height;

  Panel1.Align:=alClient;

  if Prm.AptekaSklad then
   begin
    if Prm.IsNewDiscOpt=True then begin S:='lb9_'; lb9_8.Caption:='” ‚‡Ò ÂÒÚ¸ ‰ËÒÍÓÌÚÌ‡ˇ Í‡Ú‡ ‡ÔÚÂÍË ÓÔÚÓ‚˚ı ˆÂÌ?'; end
                             else S:='lbs_';

    Brend:='—ÍÎ‡‰';
    Panel1.Color:=$00368000;
    Label2.Font.Color:=$0090BA9B;
    Label2.Caption:='œ¿Ãﬂ“ ¿ œ–Œ¬»«Œ–” ¿œ“≈ » Œœ“Œ¬€’ ÷≈Õ';
   end else begin
             S:='lb9_';
             Brend:='911';
             Panel1.Color:=$00080E8D;
             Label2.Font.Color:=$006C80C7;
             Label2.Caption:='œ¿Ãﬂ“ ¿ œ–Œ¬»«Œ–” ¿œ“≈◊ÕŒ… —≈“» 9-1-1';
            end;

  mX:=-1; mY:=-1;
  Label3.Font.Color:=Label2.Font.Color;
  Label3.Caption:=Label2.Caption;
  if Prm.Deshevo=False then
   begin
    for i:=0 to ComponentCount-1 do
     if Copy(Components[i].Name,1,4)=S then
      if Components[i] is TLabel then
       begin
        TLabel(Components[i]).Left:=TLabel(Components[i]).Left+dx;
        TLabel(Components[i]).Top:=TLabel(Components[i]).Top+dy;
        TLabel(Components[i]).Visible:=True;
       end;


    if Prm.Dobraia then
     begin
      lbs_7.Visible:=False;
      lbs_5.Visible:=False;

      lbs_1.Caption:=' ÓÍ 1';
      lbs_3.Caption:=' ÓÍ 2';
      lbs_8.Caption:=' ÓÍ 3';
      lbs_10.Caption:=' ÓÍ 4';
      lbs_13.Caption:=' ÓÍ 5';
      lbs_16.Caption:=' ÓÍ 6';
      lbs_18.Caption:=' ÓÍ 7';
     end;

    DrawSteps;
   end else begin
             Bm:=TBitMap.Create;
             try
              Bm.LoadFromFile('D:\ava\SunDesh.bmp');
              Im.Canvas.Pen.Color:=clBlack;
              Im.Canvas.Brush.Color:=clBlack;
              Im.Canvas.FillRect(Rect(0,0,Im.Width,Im.Height));
              Im.Canvas.Draw((Im.Width-Bm.Width) div 2,(Im.Height-Bm.Height) div 2,Bm);
             finally
              Bm.Free;
             end;
            end;
 end;

procedure TSaveScreenF.FormActivate(Sender: TObject);
var i:Integer;
 begin
  try

   Timer1.Enabled:=True;

{   MainF.dbgSklad.Visible:=False;
   i:=0;
   While i<220 do
    begin
     AlphaBlendValue:=i; Application.ProcessMessages;
     Inc(i,5);
    end;
}  finally
//   MainF.dbgSklad.Visible:=True;
  end;
 end;

procedure TSaveScreenF.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
 begin
  if (mX=-1) or (mY=-1) then
   begin
    mX:=X; mY:=Y;
   end else
  if (Abs(X-mX)>40) or (Abs(Y-mY)>40) then
   begin
    Close;
   end;
 end;

procedure TSaveScreenF.FormKeyPress(Sender: TObject; var Key: Char);
 begin
  Close;
 end;

procedure TSaveScreenF.FormClick(Sender:TObject);
 begin
  Close;
 end;

procedure TSaveScreenF.DrawSteps;
var dx,i,x,y,R,R1,rr,a1,a2,K:Integer;
    P:TColor;
 begin
  with Im.Canvas do
   begin
    if (Prm.AptekaSklad=False) or (Prm.IsNewDiscOpt=True) then
     begin
      k:=32;
      a1:=58; a2:=90;
     end else begin
               if Prm.IsNewDiscOpt=True then k:=40
                                        else k:=45;
               a2:=90;
               a1:=a2-k;
              end;

    x:=Width div 2; y:=Height div 2;

    R:=340; //(Height div 2)-20;
    R1:=320;//(Height div 2)-35;
    Brush.Color:=clBlack;
    Rectangle(0,0,Im.Width,Im.Height);
    Pen.Width:=5;
    P:=clWhite;
    Pen.Color:=P;

    if (Prm.AptekaSklad=False) or (Prm.IsNewDiscOpt=True) then
     begin
      Pen.Color:=$0000009A;
      Brush.Color:=$0000009A;
      sQuad(Im.Canvas,x,y,R+20,a1-10*K-3,a2-10*K,1);

      Pen.Color:=$006666FF;
      Brush.Color:=$006666FF;
      sQuad(Im.Canvas,x,y,R1,a1-9*K,a2-9*K);
     end;

    if (Prm.AptekaSklad=False) or ((Prm.AptekaSklad=True) and (Prm.IsNewDiscOpt=True)) then
     begin
      Pen.Color:=$00FE00FF;
      Brush.Color:=$00FE00FF;
      if (Prm.AptekaSklad=False) or (Prm.IsNewDiscOpt=True) then rr:=R else rr:=R+20;
      sQuad(Im.Canvas,x,y,rr,a1-8*K,a2-8*K);
     end;

    Pen.Color:=$00CB99FF; Brush.Color:=$00CB99FF;
    if (Prm.AptekaSklad=False) or ((Prm.AptekaSklad=True) and (Prm.IsNewDiscOpt=True)) then
     sQuad(Im.Canvas,x,y,R1,a1-7*K,a2-7*K)
    else
     sQuad(Im.Canvas,x,y,R1,a1-7*K,a2-7*K,1);

    Pen.Color:=$00FFFF01; Brush.Color:=$00FFFF01;
    sQuad(Im.Canvas,x,y,R,a1-6*K,a2-6*K);

    Pen.Color:=$00FF9965;
    Brush.Color:=$00FF9965;
    sQuad(Im.Canvas,x,y,R1,a1-5*K,a2-5*K);

    Pen.Color:=$00FFCC00;
    Brush.Color:=$00FFCC00;
    sQuad(Im.Canvas,x,y,R,a1-4*K,a2-4*K);

    Pen.Color:=$0033CC33;
    Brush.Color:=$0033CC33;
    sQuad(Im.Canvas,x,y,R1,a1-3*K,a2-3*K);

    Pen.Color:=$0000CCFF;
    Brush.Color:=$0000CCFF;
    sQuad(Im.Canvas,x,y,R,a1-2*K,a2-2*K);

    Pen.Color:=$000165FF; Brush.Color:=$000165FF;

    sQuad(Im.Canvas,x,y,R1,a1-K,a2-K);

    if Prm.Deshevo=False then
     begin
      Pen.Color:=clRed; Brush.Color:=clRed;
     end else begin
               Pen.Color:=clNavy; Brush.Color:=clNavy; lbs_2.Font.Color:=clYellow;
              end;

    sQuad(Im.Canvas,x,y,R,a1,a2+5);

    Pen.Color:=$008CFFFF;
    Brush.Color:=$008CFFFF;
    Ellipse(x-100,y-100,x+100,y+100);
   end;

{
  Label1.Left:=x+30;   Label1.Top:=y-265;
  Label3.Left:=x+160;  Label3.Top:=y-110;
  Label5.Left:=x+105;  Label5.Top:=y+55;
  Label7.Left:=x-40;   Label7.Top:=y+145;
  Label9.Left:=x-220;  Label9.Top:=y+80;
  Label11.Left:=x-300; Label11.Top:=y-125;
  Label13.Left:=x-160; Label13.Top:=y-265;

  Label15.Left:=x-61; Label15.Top:=y-33;
  for i:=1 to 7 do
   begin
    if i=3 then dx:=20 else
    if i=4 then dx:=-35 else dx:=10;
    TLabel(FindComponent('Label'+IntToStr(2*i))).Left:=TLabel(FindComponent('Label'+IntToStr(2*i-1))).Left+dx;
    TLabel(FindComponent('Label'+IntToStr(2*i))).Top:=TLabel(FindComponent('Label'+IntToStr(2*i-1))).Top+50;
   end;
  Label16.Left:=Label6.Left+15;
  Label16.Top:=Label6.Top;
  if Prm.AptekaSklad then Label16.Visible:=True
                     else Label6.Visible:=True;
}
 end;

procedure TSaveScreenF.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  Close;
 end;

procedure TSaveScreenF.Timer1Timer(Sender:TObject);
var i,Num1,Pr:Integer;
 begin
  try
   Timer1.Enabled:=False;

   try

    if Num<2 then Inc(Num) else Num:=0;

    if Num in [0,1] then
     begin
      Panel1.Visible:=False;
//      Application.ProcessMessages;
     end else
     begin

      for i:=Low(aRemind) to High(aRemind) do
       if aRemind[i].Img.Visible then aRemind[i].Img.Visible:=False;

      for i:=Low(aRemindP) to High(aRemindP) do
       if aRemindP[i].Img.Visible then aRemindP[i].Img.Visible:=False;

      Pr:=Random(3);
      if Pr=0 then
       begin
        Num1:=Random(High(aRemind)+1);
//        Image1.Picture.Assign(aRemind[Num1].Img);
        aRemind[Num1].Img.Visible:=True;
        Label1.Caption:=aRemind[Num1].Txt;
       end else begin
                 Num1:=Random(High(aRemindP)+1);
//                 Image1.Picture.Assign(aRemindP[Num1].Img);
                 aRemindP[Num1].Img.Visible:=True;
                 Label1.Caption:=aRemindP[Num1].Txt;
                end;
      Panel1.Visible:=True;
//      Application.ProcessMessages;

     end;

   except
   end;
  finally
   Timer1.Enabled:=True;
  end;

 end;

procedure TSaveScreenF.FormClose(Sender: TObject; var Action: TCloseAction);
//var i:Integer;
 begin
 {
  for i:=Low(aRemind) to High(aRemind) do aRemind[i].Img.Parent:=nil;
  for i:=Low(aRemindP) to High(aRemindP) do aRemindP[i].Img.Parent:=nil;
 }
  Timer1.Enabled:=False;
 end;

end.
