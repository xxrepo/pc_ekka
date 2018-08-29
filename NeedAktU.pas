unit NeedAktU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Grids, DBGrids, Buttons;

type
  TNeedAktF = class(TForm)
    Label1: TLabel;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private

  public

  end;

var NeedAktF:TNeedAktF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TNeedAktF.FormCreate(Sender: TObject);
 begin
  Caption:='Несобранные или неотправленные возвраты';
 end;

procedure TNeedAktF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

end.
