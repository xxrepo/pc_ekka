unit HotKeyInfoU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  THotKeyInfoF = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    Label7: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private

  public

  end;

var HotKeyInfoF:THotKeyInfoF;

implementation

uses MainU;

{$R *.dfm}

procedure THotKeyInfoF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure THotKeyInfoF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

end.
