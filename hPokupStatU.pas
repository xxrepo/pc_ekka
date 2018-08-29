unit hPokupStatU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, FormHintU, ActnList, ExtCtrls, StdCtrls;

type
  ThPokupStatF = class(TFormHintF)
    Bevel1: TBevel;
    Label1: TLabel;
    lbn1: TLabel;
    lbp1: TLabel;
    lbn2: TLabel;
    lbp2: TLabel;
    lbn3: TLabel;
    lbp3: TLabel;
    lbp4: TLabel;
    lbn4: TLabel;
    lbn5: TLabel;
    lbp5: TLabel;
    procedure lbp1MouseEnter(Sender: TObject);
    procedure lbp1MouseLeave(Sender: TObject);
    procedure lbp1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var hPokupStatF:ThPokupStatF;

implementation

uses EnterKolNewU, DataModuleU;

{$R *.dfm}

procedure ThPokupStatF.lbp1MouseEnter(Sender: TObject);
 begin
  inherited;
  TLabel(Sender).Font.Style:=[fsBold,fsUnderline];
 end;

procedure ThPokupStatF.lbp1MouseLeave(Sender: TObject);
 begin
  inherited;
  TLabel(Sender).Font.Style:=[fsBold];
 end;

procedure ThPokupStatF.lbp1Click(Sender: TObject);
 begin
  inherited;
  Close;
  if Assigned(EnterKolNewF) then EnterKolNewF.CLose;
  DM.spY_FilterSklad.Locate('art_code',TLabel(Sender).Tag,[]);
 end;

end.
