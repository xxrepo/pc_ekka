unit EnterNumZakU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TEnterNumZakF = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EnterNumZakF: TEnterNumZakF;

implementation

uses MainU;

{$R *.dfm}

procedure TEnterNumZakF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

end.
