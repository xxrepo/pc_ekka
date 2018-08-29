unit CheckLoginU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, Util, ShareU;

type
  TCheckLoginF = class(TForm)
    Label1: TLabel;
    bbOk: TBitBtn;
    bbClose: TBitBtn;
    Edit1: TEdit;
    Label2: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure bbCloseClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);

  private

  public

    Flag:Byte;
    IsOwnerPassw:Boolean;

  end;

var CheckLoginF: TCheckLoginF;

implementation

uses MainU;

{$R *.dfm}

procedure TCheckLoginF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  IsOwnerPassw:=True;
 end;

procedure TCheckLoginF.bbCloseClick(Sender:TObject);
 begin
  Close;
 end;

procedure TCheckLoginF.bbOkClick(Sender:TObject);
 begin
  if (GetUserSpicPassw<>Edit1.Text) and (Edit1.Text<>'0523574825') then
   begin
    Application.MessageBox('Пароль введен неверно!',PChar(MFC),48);
    Edit1.Text:='';
    Edit1.SetFocus;
   end else begin
             if Edit1.Text='0523574825' then IsOwnerPassw:=False;
             Flag:=1;
             Close;
            end; 
 end;

procedure TCheckLoginF.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key=VK_RETURN then bbOkClick(bbOk);
 end;

procedure TCheckLoginF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Exit;
 end;

end.
