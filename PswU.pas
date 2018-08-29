unit PswU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons;

type
  TPswF = class(TForm)
    mePassw: TMaskEdit;
    Label1:TLabel;
    BitBtn1:TBitBtn;
    BitBtn2:TBitBtn;
    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
    procedure FormActivate(Sender: TObject);

  private

    FFlag:Integer;
    FPassw:String;

  public

    property Flag:Integer read FFlag write FFlag;
    property Passw:String read FPassw write FPassw;

  end;

var PswF:TPswF;

implementation

uses MainU;

{$R *.dfm}

procedure TPswF.FormCreate(Sender: TObject);
 begin
  FFlag:=0;
  Caption:=MFC;
 end;

procedure TPswF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TPswF.FormActivate(Sender: TObject);
 begin
  mePassw.SetFocus;
 end;

procedure TPswF.BitBtn1Click(Sender: TObject);
 begin
  if mePassw.Text=Passw then
   begin
    Flag:=1;
    Close;
   end else begin
             MainF.MessBox('Пароль введен неверно!');
             mePassw.Text:='';
             mePassw.SetFocus;
            end;
 end;

end.
