unit DialogU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TDialogF = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
  public

    Passw:String;

  end;

var DialogF: TDialogF;

implementation

uses MainU, PasswU;

{$R *.dfm}

procedure TDialogF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Passw:='';
 end;

procedure TDialogF.BitBtn1Click(Sender: TObject);
 begin

  Close;
 end;

procedure TDialogF.BitBtn2Click(Sender: TObject);
 begin
  try
   PasswF:=TPasswF.Create(Self);
   try
    PasswF.Left:=Left+BitBtn2.Left+2;
    PasswF.Top:=Top+BitBtn2.Top+BitBtn2.Height+22;
    PasswF.Passw:=Passw;
    Application.ProcessMessages;
    PasswF.ShowModal;
    if PasswF.FFlag=1 then
     begin
      if Passw='' then Prm.UserRole:=R_ADMIN;
      FlagD:=1; Close;
     end;
   finally
    PasswF.Free;
   end;
  except
   Close;
  end;
 end;

end.
