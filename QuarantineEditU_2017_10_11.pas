unit QuarantineEditU;

interface

uses Forms, StdCtrls, Buttons, ComCtrls, Controls, Classes, SysUtils;
//  , Windows, Messages, Variants, Graphics, Dialogs, ExtCtrls,

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
    ed_seria: TEdit;
    lb_date_seria: TLabel;
    dt_seria: TDateTimePicker;
    btSave: TBitBtn;
    btCancel: TBitBtn;

    procedure FormActivate(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btSaveClick(Sender: TObject);

  public

    fl_editing:boolean;

  end;

var QuarantineEditF:TQuarantineEditF;

implementation

uses QuarantineU;

{$R *.dfm}

procedure TQuarantineEditF.FormActivate(Sender: TObject);
 begin
  BorderStyle:=bsDialog;
  Position:=poMainFormCenter;
  ed_seria.SetFocus;
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
  ed_seria.Text:='';
  dt_seria.DateTime:=Now();
end;

procedure TQuarantineEditF.btSaveClick(Sender: TObject);
begin
  fl_editing:=true;
  QuarantineEditF.Close;
end;

end.

