unit SetPhoneU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TSetPhoneF = class(TForm)

    lbCap: TLabel;
    Edit1: TEdit;
    lbFIO: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;

    procedure FormCreate(Sender:TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private

    FFlag:Byte;
    FID_User:Integer;

  public

    property Flag:Byte read FFlag write FFlag;
    property ID_User:Integer read FID_User write FID_User;

  end;

var SetPhoneF:TSetPhoneF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TSetPhoneF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  FFlag:=0;
 end;

procedure TSetPhoneF.BitBtn1Click(Sender:TObject);
 begin
  if Edit1.Text='' then
   begin
    MainF.MessBox('Необходимо обязательно ввести телефон сотрудника!');
    Edit1.SetFocus;
   end else try
             DM.QrEx.Close;
             DM.QrEx.SQL.Text:='update SprUser set Phone='''+Edit1.Text+''' where id='+IntToStr(id_user);
             DM.QrEx.ExecSQL;
             Flag:=1;
             Close;
            except
             on E:Exception do
              MainF.MessBox('Ошибка записи в справочник пользователей! '+E.Message);
            end;
 end;

procedure TSetPhoneF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

end.
