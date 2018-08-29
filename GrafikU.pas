unit GrafikU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TGrafikF = class(TForm)
    Panel3: TPanel;
    pnd1: TPanel;
    pnd2: TPanel;
    pnd3: TPanel;
    pnd4: TPanel;
    pnd5: TPanel;
    pnd6: TPanel;
    pnd7: TPanel;
    Panel25: TPanel;
    Label11: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    lbStart: TLabel;
    lbEnd: TLabel;
    Image1: TImage;
    BitBtn5: TBitBtn;
    Panel2: TPanel;
    dbgTab: TDBGrid;

    procedure FormCreate(Sender: TObject);
    procedure dbgTabDrawColumnCell(Sender: TObject; const Rect: TRect;  DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private

    FIDTAB: Integer;
    FShowOnly: Integer;

  public

    property ShowOnly:Integer read FShowOnly write FShowOnly;
    property IDTAB:Integer read FIDTAB write FIDTAB;

  end;

var GrafikF: TGrafikF;

implementation

uses MainU;

{$R *.dfm}

procedure TGrafikF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TGrafikF.dbgTabDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var R:TRect;
    DrawFlags:Integer;
 begin
{
  R.Left:=Rect.Left;
  R.Top:=Rect.Top;
  R.Right:=R.Left+30;
  R.Right:=R.Top+20;
  Canvas.TextRect(Rect, Rect.Left + 1, Rect.Top + 1, ' ');
  DrawFrameControl(Canvas.Handle, Rect, DFC_BUTTON, DFCS_BUTTONPUSH or DFCS_ADJUSTRECT);
  DrawFlags:=DFCS_BUTTONCHECK or DFCS_ADJUSTRECT;// DFCS_BUTTONCHECK
//  if Checked then DrawFlags:=DrawFlags or DFCS_CHECKED;
  DrawFrameControl(Canvas.Handle,Rect,DFC_BUTTON,DrawFlags);
}
 end;

end.
