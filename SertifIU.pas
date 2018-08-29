unit SertifIU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TSertifIF = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private

  public

    Flag:Integer;

  end;

var SertifIF:TSertifIF;

implementation

uses MainU;

{$R *.dfm}

procedure TSertifIF.FormCreate(Sender: TObject);
 begin
  Flag:=0;
  Caption:=MFC;
 end;

procedure TSertifIF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TSertifIF.BitBtn1Click(Sender: TObject);
 begin
  Flag:=1;
  Close;
 end;

end.
