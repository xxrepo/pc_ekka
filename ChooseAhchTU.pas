unit ChooseAhchTU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TChooseAhchTF = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private

  public

    Flag:Integer;

  end;

var ChooseAhchTF:TChooseAhchTF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TChooseAhchTF.FormCreate(Sender: TObject);
 begin
  Flag:=0;
  Caption:=MFC;
  DM.qrAhchT.Close;
  DM.qrAhchT.Open;
 end;

procedure TChooseAhchTF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TChooseAhchTF.BitBtn1Click(Sender: TObject);
 begin
  if DM.qrAhchT.IsEmpty then Exit;
  Flag:=1;
  Close;
 end;

end.
