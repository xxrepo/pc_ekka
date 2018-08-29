unit PrVozrU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TPrVozrF = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private

  public

    Flag:Integer;
    FRb:Array of TRadioButton;

  end;

var PrVozrF:TPrVozrF;

implementation

uses DataModuleU, MainU;

{$R *.dfm}

procedure TPrVozrF.FormCreate(Sender: TObject);
var i,CA:Integer;
 begin
  Caption:=MFC;
  Flag:=-1;
  try
   SetLength(FRb,0);
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from SprPrVozr where Vis=1 order by id';
   DM.Qr.Open;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     CA:=High(FRb)+1; SetLength(FRb,CA+1);
     FRb[CA]:=TRadiobutton.Create(Self);
     FRb[CA].Parent:=Panel2;
     FRb[CA].Width:=170;
     FRb[CA].Caption:=DM.Qr.FieldByName('Descr').AsString;
     FRb[CA].Tag:=DM.Qr.FieldByName('ID').AsInteger;
     FRb[CA].Left:=15;
     FRb[CA].Top:=(i-1)*20+25;
    end;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования списка причин возвратов: '+E.Message);
  end;
 end;

procedure TPrVozrF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TPrVozrF.BitBtn1Click(Sender: TObject);
var i:Integer;
 begin
  Flag:=-1;
  for i:=Low(FRb) to High(FRb) do
   if FRb[i].Checked then
    begin
     Flag:=FRb[i].Tag;
     Close;
     Break;
    end;
  if Flag=-1 then MainF.MessBox('Выберите причину возврата!')
 end;

end.
