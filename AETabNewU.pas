unit AETabNewU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, Buttons;

type

  TAETabNewF = class(TForm)

    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBText1: TDBText;
    Label4: TLabel;
    cbKassa: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private

  public

  end;

var AETabNewF:TAETabNewF;

implementation

uses DataModuleU, MainU, TableU;

{$R *.dfm}

procedure TAETabNewF.FormCreate(Sender:TObject);
Var i:Integer;
 begin
  Caption:=MFC;
  cbKassa.Clear;
  cbKassa.Items.Add(' ');
  for i:=Low(TableF.arKassa) to High(TableF.arKassa) do cbKassa.Items.Add(IntToStr(TableF.arKassa[i]));

  if cbKassa.Items.Count=1 then
   for i:=1 to 10 do cbKassa.Items.Add(IntToStr(i));

  cbKassa.ItemIndex:=0;
 end;

procedure TAETabNewF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

end.
