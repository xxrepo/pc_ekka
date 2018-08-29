unit ShowEAN13U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons;

type
  TShowEAN13F = class(TForm)
    Panel1:TPanel;
    DBGrid1:TDBGrid;
    Panel2:TPanel;
    Panel3:TPanel;
    BitBtn1:TBitBtn;
    procedure FormCreate(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
  private

  public

  end;

var ShowEAN13F:TShowEAN13F;

implementation

uses DataModuleU, MainU;

{$R *.dfm}

procedure TShowEAN13F.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TShowEAN13F.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

end.
