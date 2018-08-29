unit ChoosePostavU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TChoosePostavF = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);

  private
  public

    Flag:Integer;

  end;

var ChoosePostavF: TChoosePostavF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TChoosePostavF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Flag:=0;
 end;

procedure TChoosePostavF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TChoosePostavF.BitBtn1Click(Sender: TObject);
 begin
  if DM.Qr6.IsEmpty then
   begin
    MainF.MessBox('Список поставщиков пуст!');
    Exit;
   end;
  Flag:=1;
  Close;
 end;

procedure TChoosePostavF.DBGrid1DblClick(Sender: TObject);
 begin
  BitBtn1Click(BitBtn1);
 end;

end.
