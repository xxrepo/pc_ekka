unit TotalStatU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Grids, DBGrids;

type
  TTotalStatF = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    Label3: TLabel;
    Panel5: TPanel;
    Label4: TLabel;
    Panel6: TPanel;
    Label5: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Label6: TLabel;
    Panel10: TPanel;
    Label7: TLabel;
    Panel11: TPanel;
    procedure FormCreate(Sender: TObject);
  private

    procedure ShowStat;

  public
  end;

var TotalStatF: TTotalStatF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TTotalStatF.ShowStat;
 begin
  DM.qrTotalStat.Close;
  DM.qrTotalStat.SQL.Text:='exec spY_TotalStateBonuses '+IntToStr(Prm.ID_Gamma);
  DM.qrTotalStat.Open;
  Label6.Caption:=DM.qrTotalStat.FieldByName('GoalBAll').AsString;
  Label7.Caption:=DM.qrTotalStat.FieldByName('SummBAll').AsString;
 end;

procedure TTotalStatF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  ShowStat;
 end;

end.

