unit WelcomeU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TWelcomeF = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WelcomeF: TWelcomeF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TWelcomeF.FormCreate(Sender:TObject);
 begin

  Caption:=MFC;
  DM.QrEx.Close;
  DM.QrEx.SQL.Clear;
  DM.QrEx.SQL.Add('if (select substring(convert(varchar,date_of_birth,23),6,5) from inform..d_employee where id='+IntToStr(Prm.ID_Gamma)+')=substring(convert(varchar,getdate(),23),6,5) ');
  DM.QrEx.SQL.Add(' select 1 as Res');
  DM.QrEx.SQL.Add('else ');
  DM.QrEx.SQL.Add(' select 0 as Res');
  DM.QrEx.Open;

  if DM.QrEx.FieldByName('Res').AsInteger=1 then
   begin
    Height:=394;
    Label2.Visible:=True;
    Top:=(Screen.Height-Height) div 2;
   end;

 end;

procedure TWelcomeF.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

end.
