unit SignInfoU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Buttons;

type

  TSignInfoF = class(TForm)
    Label1: TLabel;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    imRecipt: TImage;
    imAnnot: TImage;
    imNoScan: TImage;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    Label6: TLabel;
    Image2: TImage;
    Label7: TLabel;
    Image3: TImage;
    Label8: TLabel;
    Label9: TLabel;
    pn1: TPanel;
    Label10: TLabel;
    Panel2: TPanel;
    Label11: TLabel;
    Panel3: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Panel4: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Panel5: TPanel;
    Label16: TLabel;
    Label3: TLabel;
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

var SignInfoF:TSignInfoF;

implementation

uses MainU;

{$R *.dfm}

procedure TSignInfoF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  BitBtn2.Glyph.Assign(MainF.imStop.Picture);
 end;

procedure TSignInfoF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

end.
