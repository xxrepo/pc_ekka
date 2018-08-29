unit BackSkladInfoU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TBackSkladInfoF = class(TForm)
    BitBtn4: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
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
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var BackSkladInfoF:TBackSkladInfoF;

implementation

uses MainU;

{$R *.dfm}

procedure TBackSkladInfoF.BitBtn4Click(Sender: TObject);
 begin
  Close;
 end;

procedure TBackSkladInfoF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

end.
