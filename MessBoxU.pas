unit MessBoxU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TCntrLEdit = class(TLabeledEdit)
  protected

  procedure CreateParams(var Params: TCreateParams);override;

  end;

  TMessBoxF = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    ledText: TLabeledEdit;
    tmWait: TTimer;
    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
    procedure FormActivate(Sender:TObject);
    procedure ledTextKeyPress(Sender:TObject; var Key:Char);
    procedure tmWaitTimer(Sender: TObject);

  private

    FIncr:Integer;
    FMaxIncr:Integer;

  public

    Flag:Integer;

    TypeDiag:Byte;

    property MaxIncr:Integer read FMaxIncr write FMaxIncr;

  end;

var MessBoxF: TMessBoxF;

implementation

{$R *.dfm}

procedure TMessBoxF.FormCreate(Sender: TObject);
 begin
  Flag:=0;
  FIncr:=0;
  pPointer(ledText)^:=TCntrLEdit;
  TCntrLEdit(ledText).RecreateWnd;
  FMaxIncr:=-1;
 end;

procedure TMessBoxF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TMessBoxF.BitBtn1Click(Sender: TObject);
 begin
  Flag:=1;
  Close;
 end;

procedure TMessBoxF.FormActivate(Sender: TObject);
 begin
  BitBtn2.SetFocus;
  BitBtn1.Visible:=TypeDiag=1;

  if ledText.Visible then ledText.SetFocus;
  if TypeDiag=0 then
   begin
    BitBtn2.Left:=(Panel1.Width-BitBtn2.Width) div 2;
    BitBtn2.Caption:='Œ ';
    BitBtn2.Default:=True;
   end;

 end;

procedure TCntrLEdit.CreateParams(var Params: TCreateParams);
 begin
  inherited;
  Params.Style:=Params.Style or ES_RIGHT;
 end;

 
procedure TMessBoxF.ledTextKeyPress(Sender: TObject; var Key: Char);
var P:Integer;
 begin
  if Key=',' then Key:='.';
  if Key<>#8 then
   begin
    if Not (Key in ['0'..'9']+['.']) then Key:=#0;
    P:=Pos('.',TEdit(Sender).Text);
    if P<>0 then
     begin
      if (Key='.') or ((Length(TEdit(Sender).Text)>P+1) and (TEdit(Sender).SelStart>=P)) then Key:=#0;
     end;
   end;
 end;

procedure TMessBoxF.tmWaitTimer(Sender: TObject);
 begin
  if (FMaxIncr=-1) or (TypeDiag<>0) then Exit;

  Inc(FIncr);
  if FIncr<FMaxIncr then
   BitBtn2.Caption:='OK ('+IntToStr(FMaxIncr-FIncr)+')'
  else begin
        BitBtn2.Caption:='OK';
        BitBtn2Click(BitBtn1);
       end;
 end;

end.





