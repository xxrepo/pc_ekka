unit DiagnosticRepairU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, Mask, DBCtrls;

type

  TDiagnosticRepairF = class(TForm)

    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid2: TDBGrid;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    dtStart: TDateTimePicker;
    Label2: TLabel;
    dtEnd: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbeArt: TDBEdit;
    dbeKod: TDBEdit;
    edeCode: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);

  private

    procedure ShowRepRepair;

  public

  end;

var DiagnosticRepairF:TDiagnosticRepairF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TDiagnosticRepairF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  DM.qrDiagnostic.ConnectionString:=Prm.ConStr;
  DM.qrDiagnostic.Close;
  DM.qrDiagnostic.SQL.Text:='exec spy_diagnosticrepair '+DM.qrOstChk.FieldByName('kod_name').AsString+', ''K'' ';
  DM.qrDiagnostic.Open;
  dtStart.Date:=Date;
  dtEnd.Date:=Date;
 end;

procedure TDiagnosticRepairF.BitBtn1Click(Sender:TObject);
 begin
  DM.qrDiagnostic.Close;
  DM.qrDiagnostic.Open;
 end;

procedure TDiagnosticRepairF.BitBtn2Click(Sender:TObject);
 begin

  DM.QrDiagn.ConnectionString:=Prm.ConStr;
  DM.QrDiagn.Close;
  DM.QrDiagn.SQL.Text:='exec spy_diagnosticrepair '+DM.qrOstChk.FieldByName('kod_name').AsString+', ''K'', 0';

//  DM.QrDiagn.SQL.SaveToFile('c:\diag.txt');

  DM.QrDiagn.Open;
  BitBtn1Click(BitBtn1);
  ShowRepRepair;

 end;

procedure TDiagnosticRepairF.ShowRepRepair;
 begin
  DM.qrRepairRep.Close;
  DM.qrRepairRep.SQL.Clear;
  DM.qrRepairRep.SQL.Add('select * from RepairRep ');
  DM.qrRepairRep.SQL.Add('where dt between '''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''' and '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+'''');
  DM.qrRepairRep.SQL.Add('order by dt ');
  DM.qrRepairRep.Open;
 end;

procedure TDiagnosticRepairF.BitBtn3Click(Sender: TObject);
 begin
  ShowRepRepair;
 end;

end.
