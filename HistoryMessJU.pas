unit HistoryMessJU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  THistoryMessJF = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure DBGrid1DblClick(Sender:TObject);
  private

  public

  end;

var HistoryMessJF:THistoryMessJF;

implementation

uses MainU, DataModuleU, ShowJMessU;

{$R *.dfm}

procedure THistoryMessJF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure THistoryMessJF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure THistoryMessJF.DBGrid1DblClick(Sender: TObject);
 begin
  if DM.qrMess.IsEmpty then Exit;
  try
   ShowJMessF:=TShowJMessF.Create(Self);
   try
    ShowJMessF.mmMess.Lines.Text:=DM.qrMess.FieldByName('Mess').AsString;
    Application.ProcessMessages;
    ShowJMessF.ShowModal;
   finally
    ShowJMessF.Free;
   end;
  except
   MainF.MessBox(ER_CR_FORM);
  end;
 end;

end.
