unit GrafikInfoU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TGrafikInfoF = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    pn1: TPanel;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var GrafikInfoF:TGrafikInfoF;

implementation

uses MainU, TableU;

{$R *.dfm}

procedure TGrafikInfoF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  pn1.BorderStyle:=bsNone;

  Image1.Canvas.Pen.Color:=clWhite;
  Image1.Canvas.Brush.Color:=clBlack;
  Image1.Canvas.Brush.Style:=bsBDiagonal;
  Image1.Canvas.Rectangle(Rect(0,0,Image1.Width,Image1.Height));
  Image1.Canvas.Brush.Style:=bsSolid;

  Label15.Caption:='Удалять можно только строки, добавленные вручную и то, только в том случае если в строке нет заполненных данных за прошлые даты. В противном случае, можно либо  поменять тип '+
                   'сотрудника на другой (нажать правой кнопкой мыши на нужной строке и в контекстном меню выбрать "Установить признак пользователя" и соответствующий признак рабочего места), '+
                   'либо добавить новую строку, как описывалось выше.';
 end;

procedure TGrafikInfoF.Label2MouseEnter(Sender:TObject);
 begin
  if Not Assigned(Sender) then Exit;
  TLabel(Sender).Font.Style:=[fsUnderline];
 end;

procedure TGrafikInfoF.Label2MouseLeave(Sender:TObject);
 begin
  if Not Assigned(Sender) then Exit;
  TLabel(Sender).Font.Style:=[];
 end;

end.
