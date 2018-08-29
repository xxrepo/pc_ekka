unit ChoosePrihU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TChoosePrihF = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private

  public

    Dt:TDateTime;
    Skl:Byte;

  end;

var ChoosePrihF: TChoosePrihF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TChoosePrihF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Dt:=0; 
 end;

procedure TChoosePrihF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TChoosePrihF.BitBtn1Click(Sender: TObject);
 begin
  if DM.qrDtPrih.IsEmpty=False then
   begin
    Dt:=DM.qrDtPrih.FieldByName('date_nakl').AsDateTime;
    if DM.qrDtPrih.FieldByName('sklad_descr').AsString='Белостоцкий' then Skl:=1 else Skl:=2;
    Close;
   end;
 end;

end.
