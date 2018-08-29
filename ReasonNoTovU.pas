unit ReasonNoTovU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type


  TReasonNoTovF = class(TForm)
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    ok1: TImage;

    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private

  public

  end;

var ReasonNoTovF:TReasonNoTovF;
    aL:Array of Record
                 Lb:TLabel;
                 Im:TImage;
                end;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TReasonNoTovF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
 end;

procedure TReasonNoTovF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TReasonNoTovF.FormActivate(Sender:TObject);
var i,CA:Integer;
 begin
  SetLength(aL,0);
  for i:=1 to DM.Qr4.RecordCount do
   begin
    if i=1 then DM.Qr4.First else DM.Qr4.Next;
    CA:=High(aL)+1; SetLength(aL,CA+1);

    aL[CA].Lb:=TLabel.Create(nil);
    aL[CA].Lb.Parent:=Panel1;
    aL[CA].Lb.Caption:=DM.Qr4.FieldByName('Descr').AsString;
    aL[CA].Lb.Left:=35;
    aL[CA].Lb.Top:=i*25-15;

    if DM.Qr4.FieldByName('art_code').AsInteger<>-1 then
     begin
      aL[CA].Im:=TImage.Create(nil);
      aL[CA].Im.Parent:=Panel1;
      aL[CA].Im.Left:=9;
      aL[CA].Im.Top:=i*25-17;
      aL[CA].Im.Transparent:=True;
      aL[CA].Im.Picture.Assign(ok1.Picture);
     end;
   end;
 end;

procedure TReasonNoTovF.FormClose(Sender: TObject; var Action: TCloseAction);
var i:Integer;
 begin
  for i:=Low(aL) to High(aL) do
   begin
    aL[i].Lb.Free;
    aL[i].Im.Free;
   end;
  SetLength(aL,0);
 end;

end.
