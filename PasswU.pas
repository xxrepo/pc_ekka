unit PasswU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Util;

type
  TPasswF = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure Edit1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
  private

  public
   FFlag:Integer;
   Passw:String;

  end;

var PasswF:TPasswF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TPasswF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
 end;

procedure TPasswF.BitBtn1Click(Sender:TObject);
var i:Integer;
    F:Boolean;
 begin
// ava05

  try
   F:=False;
   FFlag:=0;
   if Passw='' then
    begin
     if OpenADOSQL(DM.Qr,'select Passw from SprUser where reserve=0 and id_role='+IntToStr(R_ADMIN))<=0 then raise EAbort.Create('');
     for i:=1 to DM.Qr.RecordCount do
      begin
       if i=1 then DM.Qr.First else DM.Qr.Next;
       if TrimRight(DM.Qr.FieldByName('Passw').AsString)=TrimRight(Edit1.Text) then begin F:=True; Break; end;
      end;
     if F then begin FFlag:=1; Close; end else raise EAbort.Create('');
    end else
   if Passw=TrimRight(Edit1.Text) then
    begin
     FFlag:=1;
     Close;
    end else raise EAbort.Create('');

  except
   MainF.MessBox('Пароль введен неправильно!')
  end;
  
 end;

procedure TPasswF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TPasswF.Edit1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key=VK_RETURN then BitBtn1Click(nil);
 end;

end.
