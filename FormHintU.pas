unit FormHintU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, OpenLib, ExtCtrls, ActnList;

type

  TFormHintF=class(TForm)
    Image1: TImage;
    ActionList1: TActionList;
    NoClose: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure NoCloseExecute(Sender: TObject);

  private

  public

   procedure ReCreateRegion;

  end;

var FormHintF:TFormHintF;

implementation

{$R *.dfm}

procedure TFormHintF.FormCreate(Sender:TObject);
 begin
  ReCreateRegion;
 end;

procedure TFormHintF.FormActivate(Sender:TObject);
 begin
  DrawWindowRound(0,0,ClientWidth-1,ClientHeight-1,Image1);
 end;

procedure TFormHintF.NoCloseExecute(Sender: TObject);
 begin
  //
 end;

procedure TFormHintF.ReCreateRegion;
var rgn:HRGN;
 begin
  rgn:=CreateRoundRectRgn(0,0,ClientWidth,ClientHeight,4,4);
  SetWindowRgn(Handle,rgn,True);
 end;

end.
