unit ShowStatPlanAptU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, jpeg, Grids, DBGrids;

type

  TShowStatPlanAptF = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    Label2: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);

  private

  public

  end;

var ShowStatPlanAptF:TShowStatPlanAptF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TShowStatPlanAptF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TShowStatPlanAptF.FormActivate(Sender: TObject);
 begin
  Label2.Caption:=DM.qrAkciiList.FieldByName('Descr').AsString;

  DM.qrPlanAptStat.Close;
  DM.qrPlanAptStat.SQL.Clear;
  DM.qrPlanAptStat.SQL.Add('exec spY_ShowPlanAptStat '+DM.qrAkciiList.FieldByName('IDP').AsString+',');
  DM.qrPlanAptStat.SQL.Add(''''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtStart').AsDateTime)+''',');
  DM.qrPlanAptStat.SQL.Add(''''+FormatDateTime('yyyy-mm-dd',DM.qrAkciiList.FieldByName('DtEnd').AsDateTime)+'''');
  DM.qrPlanAptStat.Open;

 end;

procedure TShowStatPlanAptF.FormShortCut(var Msg:TWMKey; var Handled:Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

end.


