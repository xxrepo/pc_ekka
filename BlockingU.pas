unit BlockingU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, StdCtrls, ExtCtrls, Buttons, Util;

type
  TBlockingF=class(TForm)

    ActionList1: TActionList;
    ActClose: TAction;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;

    procedure ActCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);

  private

  public

   Flag:Integer;

  end;

var BlockingF: TBlockingF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TBlockingF.ActCloseExecute(Sender: TObject);
 begin
  // Перехват нажатия Alt+F4
 end;

procedure TBlockingF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Label2.Caption:=Prm.UserName;
  Flag:=0;
 end;

procedure TBlockingF.BitBtn1Click(Sender: TObject);
 begin
  try
   if OpenADOSQL(DM.Qr,'select * from SprUser where Users='''+Prm.UserName+'''')<=0 then raise EAbort.Create('');
   if TrimRight(DM.Qr.FieldByName('Passw').AsString)<>TrimRight(Edit1.Text) then raise EAbort.Create(''); 
   Close;
  except
   MainF.MessBox('Пароль введен неправильно!')
  end;
 end;

procedure TBlockingF.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key=VK_RETURN then BitBtn1Click(Nil);
 end;

procedure TBlockingF.FormActivate(Sender: TObject);
 begin
  Flag:=0;
 end;

procedure TBlockingF.BitBtn2Click(Sender: TObject);
 begin
  Flag:=1;
  Close;
 end;

procedure TBlockingF.BitBtn3Click(Sender: TObject);
 begin
  Flag:=2;
  Close;
 end;

end.
