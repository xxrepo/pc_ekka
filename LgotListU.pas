unit LgotListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TLgotListF = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn6: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LgotListF: TLgotListF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TLgotListF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TLgotListF.BitBtn6Click(Sender: TObject);
 begin
  Close;
 end;

end.
