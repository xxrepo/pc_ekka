unit Pilot2U;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  jpeg;

type
  TPilot2F = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private

  public

    Flag:Integer;

  end;

var Pilot2F:TPilot2F;

function ShowQ(Mess:String; NumPict:Integer; OKOnly:Boolean=False):Boolean;

implementation

uses MainU;

{$R *.dfm}

function ShowQ(Mess:String; NumPict:Integer; OKOnly:Boolean=False):Boolean;
var F:Integer;
 begin
  Result:=True;
  try
   Pilot2F:=TPilot2F.Create(nil);
   try
    Pilot2F.Label1.Caption:=Mess;

    Pilot2F.BitBtn2.Visible:=OKOnly=False;

    if OKOnly then
     begin
      Pilot2F.BitBtn1.Caption:='ОК';
      Pilot2F.BitBtn1.Left:=131;
     end;

    Case NumPict of
     2:Pilot2F.Image2.Visible:=True;
     3:Pilot2F.Image3.Visible:=True;
     4:Pilot2F.Image4.Visible:=True;
     5:Pilot2F.Image5.Visible:=True
      else begin
              Pilot2F.Label1.Width:=730;
              if OKOnly then Pilot2F.BitBtn1.Left:=315
                        else Pilot2F.BitBtn1.Left:=255;
              Pilot2F.BitBtn2.Left:=375;
             end;
    end;

    Application.ProcessMessages;
    Pilot2F.ShowModal;
    F:=Pilot2F.Flag;
    if Pilot2F.Flag<>1 then Result:=False;
   finally
    Pilot2F.Free;  
   end;
//   if (OKOnly=False) and (F<>1) then ShowQ('Так как наданный вопрос вы ответили "НЕТ", то продажа со скидкой по "Пилотному проекту" невозможна!',0,True);
  except
   Result:=False;
  end;
 end;

procedure TPilot2F.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Flag:=0;
 end;

procedure TPilot2F.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TPilot2F.BitBtn1Click(Sender: TObject);
 begin
  Flag:=1;
  Close;
 end;

end.
