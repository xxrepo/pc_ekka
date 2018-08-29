unit ShowReciptListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TShowReciptListF = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShowReciptListF: TShowReciptListF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TShowReciptListF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TShowReciptListF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

end.
