unit ShowKolForVozrU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TShowKolForVozrF = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    lbNames: TLabel;
    lbKol: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private

  public

    Flag:Integer;

  end;

var ShowKolForVozrF:TShowKolForVozrF;

function ShowKolForVozr(Nm:String; Kol:Integer):Boolean;

implementation

uses MainU;

{$R *.dfm}

function ShowKolForVozr(Nm:String; Kol:Integer):Boolean;
 begin
  Result:=False;
  try
   ShowKolForVozrF:=TShowKolForVozrF.Create(nil);
   try
    ShowKolForVozrF.lbKol.Caption:=IntToStr(Kol);
    ShowKolForVozrF.lbNames.Caption:=Nm;
    Application.ProcessMessages;
    ShowKolForVozrF.ShowModal;
    Result:=ShowKolForVozrF.Flag=1;
   finally
    ShowKolForVozrF.Free;
   end;
  except
  end;
 end;

procedure TShowKolForVozrF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Flag:=0;
 end;

procedure TShowKolForVozrF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TShowKolForVozrF.BitBtn1Click(Sender: TObject);
 begin
  Flag:=1;
  Close;
 end;

end.
