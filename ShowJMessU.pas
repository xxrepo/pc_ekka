unit ShowJMessU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TShowJMessF = class(TForm)
    mmMess: TMemo;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var ShowJMessF:TShowJMessF;

procedure ShowMessFull(S:String);

implementation

uses MainU;

{$R *.dfm}

procedure ShowMessFull(S:String);
 begin
  try
   ShowJMessF:=TShowJMessF.Create(nil);
   try
    ShowJMessF.mmMess.Text:=S;
    Application.ProcessMessages;
    ShowJMessF.ShowModal;
   finally
    ShowJMessF.Free;
   end;
  except
  end;
 end;

procedure TShowJMessF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TShowJMessF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TShowJMessF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

end.
