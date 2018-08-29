unit EnterCash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormEnterCash = class(TForm)
    edSumCash: TLabeledEdit;
    BtnSelect: TButton;
    BtnCancel: TButton;
    lblSurname: TLabel;
    procedure BtnSelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edSumCashKeyPress(Sender: TObject; var Key: Char);
  end;

var
  FormEnterCash: TFormEnterCash;

implementation

uses DailyOperationSelection;

//uses Main;

{$R *.dfm}

procedure TFormEnterCash.BtnSelectClick(Sender: TObject);
var
  lFormatSettings: TFormatSettings;
begin
  lFormatSettings.DecimalSeparator := '.';
  if edSumCash.Text = '' then
  begin
    ShowMessage('¬ведите сумму!');
    edSumCash.SetFocus;
    Exit;
  end;
  if FormDailyOperationSelection.FQuery.Active then FormDailyOperationSelection.FQuery.Close;
  FormDailyOperationSelection.FQuery.SQL.Clear;
  FormDailyOperationSelection.FQuery.SQL.Add('insert into');
  FormDailyOperationSelection.FQuery.SQL.Add('     inform..issuance_cash(id_employee, cash)');
  FormDailyOperationSelection.FQuery.SQL.Add('values(' + IntToStr(FormDailyOperationSelection.EmployeeID) + ', ' + FloatToStr(StrToFloat(trim(edSumCash.Text)), lFormatSettings) + ')');
  FormDailyOperationSelection.FQuery.ExecSQL;
  ModalResult := mrOk;
end;

procedure TFormEnterCash.edSumCashKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9','.',',', #8]) then Key := #0;
end;

procedure TFormEnterCash.FormCreate(Sender: TObject);
begin
  edSumCash.Text := '';
  if FormDailyOperationSelection.FQuery.Active then FormDailyOperationSelection.FQuery.Close;
  FormDailyOperationSelection.FQuery.SQL.Clear;
  FormDailyOperationSelection.FQuery.SQL.Add('select id, surname_ru, firstname_ru, middlename_ru from inform..d_employee (nolock) where id = ' + IntToStr(FormDailyOperationSelection.EmployeeID));
  FormDailyOperationSelection.FQuery.Open;
  if not FormDailyOperationSelection.FQuery.Eof then
  begin
    lblSurname.Caption := FormDailyOperationSelection.FQuery.FieldByName('surname_ru').AsString + ' ' +
                          FormDailyOperationSelection.FQuery.FieldByName('firstname_ru').AsString + ' ' +
                          FormDailyOperationSelection.FQuery.FieldByName('middlename_ru').AsString;
  end;
end;

end.
