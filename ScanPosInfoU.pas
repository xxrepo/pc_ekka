unit ScanPosInfoU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls;

type
  TScanPosInfoF = class(TForm)
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private

  public

  end;

var ScanPosInfoF:TScanPosInfoF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TScanPosInfoF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TScanPosInfoF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

end.
