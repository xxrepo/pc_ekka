unit FirstRecU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DBCtrls;

type
  TFirstRecF = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    DBText1: TDBText;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);

  private


  public

    Flag:Integer;

  end;

var FirstRecF: TFirstRecF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TFirstRecF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Flag:=0;
 end;

procedure TFirstRecF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TFirstRecF.DBGrid1DblClick(Sender: TObject);
 begin
  Flag:=1;
  Close;
 end;

end.
