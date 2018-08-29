unit UserListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TUserListF = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UserListF: TUserListF;

implementation

uses DataModuleU, DB;

{$R *.dfm}

procedure TUserListF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

procedure TUserListF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TUserListF.FormActivate(Sender: TObject);
 begin
  Height:=DM.qrUserList.RecordCount*18+95;
  Top:=(Screen.Height-Height) div 2
 end;

end.
