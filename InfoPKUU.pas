unit InfoPKUU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TInfoPKUF = class(TForm)
    BitBtn1: TBitBtn;
    Image1: TImage;
    lbName: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Image2: TImage;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    lbCap: TLabel;
    lbKol: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    
  private

  public

  end;

var InfoPKUF:TInfoPKUF;

implementation

uses MainU,OpenLib;

{$R *.dfm}

procedure TInfoPKUF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
 end;

procedure TInfoPKUF.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TInfoPKUF.FormActivate(Sender:TObject);
 begin
  DrawRect(Image1,clBtnFace,clWhite);
  DrawRect(Image2,clWhite,$0074B1EF);
 end;

end.
