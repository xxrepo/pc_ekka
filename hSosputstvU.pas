unit hSosputstvU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormHintU, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DBCtrls,
  ActnList;

type

  TWCtrl1=class(TWinControl);

  ThSoputstvF = class(TFormHintF)

    dbgSop: TDBGrid;
    Label1: TLabel;
    Bevel1: TBevel;
    DBText1: TDBText;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var hSoputstvF:ThSoputstvF;

implementation

{$R *.dfm}

end.



