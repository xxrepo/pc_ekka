unit ChangeArticleCount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
    ArticleCountException = Exception;
    ArticleCountLessZeroException =  Exception;
type
  TfmChangeCount = class(TForm)
    lbNeedCount: TLabel;
    edNeedCount: TEdit;
    lbRestCount: TLabel;
    edRestCount: TEdit;
    lbChangeCount: TLabel;
    edChangeCount: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    lbArticleName: TLabel;
    Bevel1: TBevel;
    im1: TImage;
    Panel1: TPanel;
    procedure edChangeCountKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    FNeedCount,
    FRestCount : Integer;
    FChangeCount: Integer;
    FArticleName : string;
    procedure setChangeCount(const Value: Integer);
  protected
     procedure ValidateNewArticleCount(aCount : integer);
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aArticleName : string; aNeedCount, aRestCount : Integer);
    property ChangeCount : Integer read FChangeCount write setChangeCount;
  end;

var
  fmChangeCount: TfmChangeCount;

implementation
uses
  StrUtils, OpenLib;
{$R *.dfm}

{ TForm1 }

constructor TfmChangeCount.Create(aOwner: TComponent; aArticleName : string; aNeedCount, aRestCount: Integer);
begin
    inherited Create(aOwner);
    FArticleName := aArticleName;
    FNeedCount := aNeedCount;
    fRestCount := aRestCount;
end;

procedure TfmChangeCount.edChangeCountKeyPress(Sender: TObject; var Key: Char);
begin
 begin
  if Key<>#8 then
   begin
    if Not (Key in ['0'..'9']) then Key:=#0;
   end;
 end;
end;

procedure TfmChangeCount.setChangeCount(const Value: Integer);
begin
  if Value <> FChangeCount
  then
  begin
    ValidateNewArticleCount(Value);
    FChangeCount := Value;
  end;
end;

procedure TfmChangeCount.ValidateNewArticleCount(aCount: integer);
begin
    if aCount > FRestCount
    then { Ошибка, если введенное значение больше доступного }
    begin
      { присваиваем доступное количество }
      edChangeCount.Text := IntToStr(FRestCount);
      edChangeCount.SelectAll;
      edChangeCount.SetFocus;
      raise ArticleCountException.Create(Format('Количество добавляемое в чек (%D) должно быть меньше или равно доступному (%D).', [aCount, FRestCount]));
    end;
end;

procedure TfmChangeCount.FormShow(Sender: TObject);
begin
  lbArticleName.Caption := '  ' + FArticleName;
  lbArticleName.Hint := FArticleName;
  edNeedCount.Text := IntToStr(FNeedCount);
  edRestCount.Text := IntToStr(FRestCount);
  edChangeCount.Text := IntToStr(FRestCount);
  edChangeCount.SetFocus;
  edChangeCount.SelectAll;

  im1.Canvas.Pen.Color:=clGray;
  im1.Canvas.Rectangle(0,0,im1.Width,im1.Height);
  MakeGradientHeightI(im1,clGreen,clLime,1,1,20,im1.Height-2);  
end;

procedure TfmChangeCount.BitBtn1Click(Sender: TObject);
begin
  try
    ChangeCount := StrToIntdef(edChangeCount.Text,0);
    ModalResult := mrOK;
  except
    on e : ArticleCountException do
    begin
      Application.MessageBox(PChar(e.Message + #13#10 + ' Измените количество добавляемое в чек.'), PChar(' Ошибка '), 0);
    end;
  end;
end;

end.

