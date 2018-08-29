unit PreviewU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, OpenLib, Math, ActnList;

type
  TPreviewF = class(TForm)
    ScrollBox1:TScrollBox;
    btPrintTo: TBitBtn;
    BitBtn2:TBitBtn;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Image1: TImage;
    Image4: TImage;
    alMain: TActionList;
    acPrint: TAction;
    procedure BitBtn2Click(Sender: TObject);
    procedure btPrintToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acPrintExecute(Sender: TObject);
  private
    FNumPage:Integer;
    FScale:Integer;
    FK:Real;
    IsModal:Boolean;

    procedure CMDialogKey(var Msg: TCMDialogKey); message CM_DIALOGKEY;
    procedure SetScale(const Value: Integer);
    procedure AppMessage(var Msg: TMsg; var Handled:Boolean);
    procedure Scroll(K:Integer);
    procedure ScrollHorz(K:Integer);
    procedure SetNumPage(const Value: Integer);

    property  Scale:Integer read FScale write SetScale;
    property  NumPage:Integer read FNumPage write SetNumPage;

  end;

Const SC_ONE=0;
      SC_STRECH=1;

var PreviewF:TPreviewF;

implementation

{$R *.dfm}

Uses PrintReport;

procedure TPreviewF.AppMessage(var Msg: TMsg; var Handled:Boolean);
var i:SmallInt;
 begin
  try
  if Not (IsModal) then
   begin
    if Msg.Message=WM_MOUSEWHEEL then
     begin
      Msg.Message:=WM_KEYDOWN;
      Msg.lParam:=0;
      i:=HiWord(Msg.wParam);
      Scroll(i);
      Handled:=False;
     end;
   end;
  except
  end;
 end;

procedure TPreviewF.CMDialogkey;
 begin
  With Scrollbox1.VertScrollBar do
   begin
    Case Msg.CharCode of
     VK_DOWN:Scroll(-1);
     VK_Up:Scroll(1);
     VK_RIGHT:ScrollHorz(1);
     VK_LEFT:ScrollHorz(-1);
    else inherited;
   end;
  end;
 end;

procedure TPreviewF.BitBtn2Click(Sender:TObject);
 begin
  IsModal:=True;
  try
   if PrintRep.PageSetup then
    begin
     NumPage:=1;
     Scale:=Scale;
    end;
  finally
   IsModal:=False;
  end;
 end;

procedure TPreviewF.btPrintToClick(Sender:TObject);
 begin
  IsModal:=True;
  PrintRep.PrintDialog;
  IsModal:=False;
 end;

procedure TPreviewF.FormCreate(Sender:TObject);
 begin
  IsModal:=False;
  WindowState:=wsMaximized;
  DrawSimpleRect(Image1,clGray);
  ScrollBox1.HorzScrollBar.Position:=0;
  ScrollBox1.VertScrollBar.Position:=0;
  FK:=297/210;
  Scale:=SC_STRECH;
  Application.OnMessage:=AppMessage;
  NumPage:=1;
 end;

procedure TPreviewF.BitBtn5Click(Sender: TObject);
 begin
  if Scale=SC_ONE then Scale:=SC_STRECH else Scale:=SC_ONE;
 end;

procedure TPreviewF.SetScale(const Value: Integer);
var dx,iw,ih:Integer;
const c800=1000;
 begin
  FScale:=Value;
  iw:=c800;
  Image1.Picture:=nil;
  ih:=Round(c800*FK);
  Case Value of
   SC_ONE:   if PrintRep.Orientation=O_PORTR then
              begin
               iw:=c800;
               ih:=Round(c800*FK);
              end else begin
                        iw:=Ceil(c800*FK);
                        ih:=c800;
                       end;
   SC_STRECH:begin
              dx:=(ScrollBox1.Height-10);
              if dx<114 then dx:=114;
              ih:=dx;
              if PrintRep.Orientation=O_PORTR then iw:=Ceil(ih/FK)
                                              else iw:=Ceil(ih*FK);
             end;
  end;
  Image1.Width:=iw;
  Image1.Height:=ih;
  dx:=(ScrollBox1.Width-Image1.Width) div 2;
  if dx<5 then dx:=5;
  Image1.Left:=dx;
  Image1.Top:=3;
  DrawSimpleRect(Image1,clGray);
  PrintRep.PrintPage(Image1.Canvas,Image1.Width,Image1.Height,NumPage);
  StatusBar1.Panels[0].Text:='Страниц: '+IntToStr(PrintRep.NumPages);
 end;

procedure TPreviewF.FormResize(Sender:TObject);
 begin
  Scale:=Scale;
 end;

procedure TPreviewF.Scroll(K:Integer);
 begin
  Case Scale of
   SC_STRECH:begin
              if Sign(K)>0 then BitBtn3Click(nil) else
              if Sign(K)<0 then BitBtn4Click(nil);
             end;
   SC_ONE:With Scrollbox1.VertScrollBar do Position:=Position-5*Sign(K)*Increment;
  end;
 end;

procedure TPreviewF.ScrollHorz(K: Integer);
 begin
  Case Scale of
   SC_ONE:With Scrollbox1.HorzScrollBar do Position:=Position-5*Sign(K)*Increment;
  end;
 end;

procedure TPreviewF.SetNumPage(const Value:Integer);
var V:Integer;
 begin
  V:=FNumPage;
  if Value>PrintRep.NumPages then FNumPage:=PrintRep.NumPages else
  if Value<1 then FNumPage:=1 else FNumPage:=Value;
  if FNumPage<1 then FNumPage:=1;
  if V=FNumPage then Exit;
  StatusBar1.Panels[1].Text:='Страница: '+IntToStr(FNumPage);
  Scale:=Scale;
 end;

procedure TPreviewF.BitBtn4Click(Sender:TObject);
 begin
  NumPage:=NumPage+1;
 end;

procedure TPreviewF.BitBtn3Click(Sender:TObject);
 begin
  NumPage:=NumPage-1;
 end;

procedure TPreviewF.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  Application.OnMessage:=nil;
 end;    

procedure TPreviewF.acPrintExecute(Sender: TObject);
 begin
  btPrintToClick(btPrintTo);
 end;

end.
