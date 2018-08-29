unit TermEKKAU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ExtCtrls, Util, EKKAU;

type
  TTermEKKAF = class(TForm)
    pnGroup: TPanel;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    sbTerm: TScrollBox;
    lbStart: TLabel;
    edCommand: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edCommandChange(Sender: TObject);
    procedure edCommandKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private

  public

  end;

var TermEKKAF: TTermEKKAF;

const TX=8;
      TY=8;
      DY=20;

implementation

uses MainU;

{$R *.dfm}

procedure TTermEKKAF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TTermEKKAF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TTermEKKAF.edCommandChange(Sender: TObject);
var ed:TEdit;
 begin
  if Sender=nil then Exit;
  ed:=TEdit(Sender);
  ed.Width:=Length(ed.Text)*TY+30;
 end;

procedure TTermEKKAF.edCommandKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
var ed:TEdit;
    lbRes,lbComm,lbComm1:TLabel;
    cl,cl1:TColor;
    Comm:String;
    dyy,i:Integer;
 begin
  if Sender=nil then Exit;
  ed:=TEdit(Sender);
  if Key=VK_RETURN then
   begin
    Comm:=ed.Text;
    cl:=clAqua;
    cl1:=clWhite;
    EKKA.RD_Item.Clear;
    if Not EKKA.fpSendCommand(Comm) then
     begin
      EKKA.RD_Item.Add(EKKA.LastErrorDescr);
      cl:=clRed;
     end;
    if EKKA.RD_Item.Text='' then EKKA.RD_Item.Add(Comm);
    if EKKA.LastError<>'SOFTCOMMAN' then cl1:=clLime;

    sbTerm.HorzScrollBar.Position:=0;

    lbComm:=TLabel.Create(Self);
    lbComm.Parent:=sbTerm;
    lbComm.Top:=ed.Top;
    lbComm.Left:=10;
    lbComm.Font.Color:=cl1;
    lbComm.Caption:=Copy(ed.Text,1,4);

    lbComm1:=TLabel.Create(Self);
    lbComm1.Parent:=sbTerm;
    lbComm1.Top:=ed.Top;
    lbComm1.Left:=lbComm.Left+lbComm.Width;
    lbComm1.Caption:=Copy(ed.Text,5,Length(ed.Text)-4);

    dyy:=ed.Top+dy;
    for i:=0 to EKKA.RD_Item.Count-1 do
     begin
      lbRes:=TLabel.Create(Self);
      lbRes.Parent:=sbTerm;
      lbRes.Top:=dyy;
      lbRes.Left:=20;
      lbRes.Font.Color:=cl;
      lbRes.Caption:=CopyStrR(IntToStr(i+1),2)+
                     '. ('+CopyStrR(IntToStr(Length(EKKA.RD_Item[i])),3)+') - '''+EKKA.RD_Item[i]+'''';
      Inc(dyy,DY);
     end;

    lbStart.Top:=dyy;
    ed.Top:=dyy;
    ed.Text:='';
    sbTerm.VertScrollBar.Position:=10000;
   end else
  if ((Key=VK_LEFT) and (ed.SelStart*TX<sbTerm.HorzScrollBar.Position)) or
     ((Key=VK_RIGHT) and (ed.SelStart*TX>sbTerm.HorzScrollBar.Position+sbTerm.Width-60)) then sbTerm.HorzScrollBar.Position:=ed.SelStart*TX else
 end;

procedure TTermEKKAF.FormActivate(Sender: TObject);
 begin
  edCommand.Text:='';
  edCommand.SetFocus;
 end;

end.
