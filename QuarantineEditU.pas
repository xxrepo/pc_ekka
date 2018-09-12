unit QuarantineEditU;

interface

uses
  Forms, StdCtrls, Buttons, ComCtrls, Controls, Classes, SysUtils, DB;

type

  TQuarantineEditF = class(TForm)

    lb_kod_name1: TLabel;
    lb_kod_name: TLabel;
    lb_art_code1: TLabel;
    lb_art_code: TLabel;
    lb_names1: TLabel;
    lb_names: TLabel;
    lb_f_nds: TLabel;
    lb_f_nds1: TLabel;
    lb_cena: TLabel;
    lb_cena1: TLabel;
    lb_kol1: TLabel;
    lb_kol: TLabel;
    lb_seria: TLabel;
    lb_date_seria: TLabel;
    dt_seria: TDateTimePicker;
    btSave: TBitBtn;
    btCancel: TBitBtn;
    chSeriaIsAbsent: TCheckBox;
    cbSeria: TComboBox;
    cbSeria_KodName: TComboBox;
    cbSeria_Srok: TComboBox;
    lbSeriaFact: TLabel;
    edSeriaFact: TEdit;
    lbSrokFact: TLabel;
    dtSrokFact: TDateTimePicker;

    procedure FormActivate(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure chSeriaIsAbsentClick(Sender: TObject);
    procedure cbSeriaChange(Sender: TObject);

  public
    fl_editing:boolean;
  end;

var
  QuarantineEditF: TQuarantineEditF;

implementation

uses
  QuarantineU, DataModuleU;

{$R *.dfm}

procedure TQuarantineEditF.FormActivate(Sender: TObject);
begin
  BorderStyle:=bsDialog;
  Position:=poMainFormCenter;
  if cbSeria.Enabled then cbSeria.SetFocus else chSeriaIsAbsent.SetFocus;
end;

procedure TQuarantineEditF.btCancelClick(Sender: TObject);
begin
  fl_editing:=false;
  QuarantineEditF.Close;
end;

procedure TQuarantineEditF.FormCreate(Sender: TObject);
begin
  lb_kod_name.Caption:='';
  lb_art_code.Caption:='';
  lb_names.Caption:='';
  lb_names.Hint:='';
  lb_kol.Caption:='';
  lb_cena.Caption:='';
  lb_f_nds.Caption:='';
  cbSeria.ItemIndex:=-1;
  dt_seria.DateTime:=Now();
  edSeriaFact.Text:='';
  edSeriaFact.Enabled:=false;
  dtSrokFact.DateTime:=Now();
  dtSrokFact.Enabled:=false;
end;

procedure TQuarantineEditF.btSaveClick(Sender: TObject);
begin
  fl_editing:=true;
  QuarantineEditF.Close;
end;

procedure TQuarantineEditF.chSeriaIsAbsentClick(Sender: TObject);
begin
  if chSeriaIsAbsent.Checked then
  begin
    cbSeria.Style:=csDropDown;
    cbSeria.ItemIndex:=-1;
    cbSeria.Text:=SERIA_IS_ABSENT;
    cbSeria.Enabled:=false;
    dt_seria.DateTime:=StrToDate(SERIA_IS_ABSENT_DATE);
    dt_seria.Enabled:=false;
    edSeriaFact.Enabled:=true;
    dtSrokFact.Enabled:=true;
  end
  else
  begin
    cbSeria.ItemIndex:=-1;
    cbSeria.Enabled:=true;
    dt_seria.DateTime:=Now();
    dt_seria.Enabled:=true;
    cbSeria.Style:=csDropDownList;
    if not DM.qrQuarantine.FieldByName('seria').IsNull then
      cbSeria.ItemIndex:=cbSeria.Items.IndexOf(DM.qrQuarantine.FieldByName('seria').AsString)
    else
      cbSeria.ItemIndex:=-1;
    if not DM.qrQuarantine.FieldByName('dt_seria').IsNull then
      dt_seria.DateTime:=DM.qrQuarantine.FieldByName('dt_seria').AsDateTime
    else
      dt_seria.DateTime:=Now();
    edSeriaFact.Enabled:=false;
    dtSrokFact.Enabled:=false;
  end;
end;

procedure TQuarantineEditF.cbSeriaChange(Sender: TObject);
begin
  dt_seria.Date:=StrToDate(cbSeria_Srok.Items[cbSeria.ItemIndex]);
end;

end.

