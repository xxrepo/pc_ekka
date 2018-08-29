unit Uadd_counter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Buttons,Dialogs, StdCtrls;

type
  TFadd_counter = class(TForm)
    CB_counter_type: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ed_descr: TEdit;
    btn_OK: TBitBtn;
    btn_cancel: TBitBtn;
    Label3: TLabel;
    ed_number: TEdit;
    procedure btn_OKClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);

  private

  public

  end;

var
  Fadd_counter: TFadd_counter;

implementation

uses DataModuleU;

{$R *.dfm}

procedure TFadd_counter.btn_OKClick(Sender: TObject);
begin//
    with DM.ADOQ_tmp do
    begin
        Close;
        SQL.Clear;
        parameters.Clear;
        SQL.Add('insert into apteka_net.dbo.DHCOUNTERS');
        SQL.Add('(kod,descr,counter_type)');
        SQL.Add('values(:PCNumber,:Pdescr,:Pcounter_type)');
        parameters.ParamByName('PCNumber').Value:=ed_number.Text;
        parameters.ParamByName('Pdescr').Value:=ed_descr.Text;
        parameters.ParamByName('Pcounter_type').Value:=CB_counter_type.Text;
        ExecSQL;
        DM.qrCounters.Close;
        DM.qrCounters.Open;
    end;
end;

procedure TFadd_counter.btn_cancelClick(Sender: TObject);
begin
    Fadd_counter.Close;
end;

end.
