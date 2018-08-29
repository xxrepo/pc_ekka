unit TovGrafikU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Grids, DBGrids, DateUtils, Buttons;

type

  TTovGrafikF = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    BitBtn4: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);

  private

  public

  end;

var TovGrafikF: TTovGrafikF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TTovGrafikF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Label1.Caption:='График сбора товара на складе с '+DateToStr(StartOfTheWeek(Date))+' по '+DateToStr(EndOfTheWeek(Date));
  DM.qrTovGrafik.Close;
  DM.qrTovGrafik.Open;
 end;

procedure TTovGrafikF.BitBtn4Click(Sender: TObject);
 begin
  Close;
 end;

end.



