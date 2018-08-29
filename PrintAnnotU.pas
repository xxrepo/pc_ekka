unit PrintAnnotU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TPrintAnnotF = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private

  public

  end;

var PrintAnnotF:TPrintAnnotF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TPrintAnnotF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TPrintAnnotF.SpeedButton1Click(Sender: TObject);
 begin
  MainF.ShowAnnotation(DM.spY_FilterSklad.FieldByName('Art_Code').AsInteger,1);
 end;

procedure TPrintAnnotF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

end.
