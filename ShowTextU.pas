unit ShowTextU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type

  TShowTextF = class(TForm)

    bbClose: TBitBtn;
    Label1: TLabel;
    bbOk: TBitBtn;

    procedure bbCloseClick(Sender:TObject);
    procedure FormCreate(Sender:TObject);
    procedure bbOkClick(Sender:TObject);

  private

  public

    Flag:Byte;

  end;

procedure ShowText(S:String;  C:TColor=clBlue);

function  ShowTextQ(S:String; C:TColor=clBlue):Boolean;

var ShowTextF:TShowTextF;

implementation

uses MainU;

{$R *.dfm}

procedure ShowText(S:String; C:TColor=clBlue);
 begin
  try
   ShowTextF:=TShowTextF.Create(nil);
   try
    ShowTextF.Label1.Font.Color:=C;
    ShowTextF.Label1.Caption:=S;
    ShowTextF.bbClose.Left:=274;
    ShowTextF.bbClose.Caption:='Закрыть';
    ShowTextF.bbOk.Visible:=False;
    Application.ProcessMessages;
    ShowTextF.ShowModal;
   finally
    ShowTextF.Free;
   end;
  except
  end;
 end;

function ShowTextQ(S:String; C:TColor=clBlue):Boolean;
 begin
  try
   ShowTextF:=TShowTextF.Create(nil);
   try

    ShowTextF.Label1.Font.Color:=C;
    ShowTextF.Label1.Caption:=S;
    ShowTextF.bbClose.Left:=346;
    ShowTextF.bbOk.Left:=202;
    ShowTextF.bbClose.Caption:='Отмена';
    ShowTextF.bbOk.Visible:=True;
    Application.ProcessMessages;
    ShowTextF.ShowModal;
    Result:=ShowTextF.Flag=1;

   finally
    ShowTextF.Free;
   end;
  except
   Result:=False;
  end;
 end;

procedure TShowTextF.bbCloseClick(Sender: TObject);
 begin
  Close;
 end;

procedure TShowTextF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Flag:=0;
 end;

procedure TShowTextF.bbOkClick(Sender: TObject);
 begin
  Flag:=1;
  Close;
 end;

end.
