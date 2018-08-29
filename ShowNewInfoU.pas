unit ShowNewInfoU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Buttons, ActnList, PrintReport;

type
  TShowNewInfoF = class(TForm)
    Panel1: TPanel;
    mmMess: TMemo;
    bbClose:TBitBtn;
    tmrWait:TTimer;
    acNotClose:TActionList;
    Action1:TAction;
    Label1:TLabel;
    lbDate:TLabel;
    imHistory:TImage;
    sbIm: TScrollBox;
    imPict: TImage;
    BitBtn1: TBitBtn;
    lbFrom: TLabel;
    procedure FormCreate(Sender:TObject);
    procedure bbCloseClick(Sender:TObject);
    procedure tmrWaitTimer(Sender:TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);

  private

    FMess:String;
    FFIleName:String;
    FIncr:Integer;
    FMaxIncr: Integer;

    procedure SetMess(const Value:String);

  public

    property MaxIncr:Integer read FMaxIncr write FMaxIncr;
    property Incr:Integer read FIncr write FIncr;
    property Mess:String read FMess write SetMess;
    property FileName:String read FFileName write FFileName;

  end;

var ShowNewInfoF:TShowNewInfoF;

implementation

uses MainU;

{$R *.dfm}

procedure TShowNewInfoF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  FIncr:=0;
  Panel1.Height:=526
 end;

procedure TShowNewInfoF.SetMess(const Value: String);
 begin
  FMess:=Value;
  mmMess.Lines.Text:=Value;
  if Not FileExists(FileName) then Exit;
  Panel1.Height:=281;
  imPict.Picture:=nil;
  imPict.Picture.LoadFromFile(FileName);
  sbIm.Visible:=True;
 end;

procedure TShowNewInfoF.bbCloseClick(Sender: TObject);
 begin
  if FIncr>=FMaxIncr then Close;
 end;

procedure TShowNewInfoF.tmrWaitTimer(Sender: TObject);
 begin
  Inc(FIncr);
  if FIncr<FMaxIncr then
   bbClose.Caption:='Закрыть ('+IntToStr(FMaxIncr-FIncr)+')'
  else
   bbClose.Caption:='Я прочитал(а) сообщение';
 end;

procedure TShowNewInfoF.BitBtn1Click(Sender: TObject);
 begin
  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Font.Size:=7;
  PrintRep.AddText('Торговая точка: '+Prm.AptekaNameRU+#10);
  PrintRep.AddText('Дата сообщения: '+lbDate.Caption+#10);
  PrintRep.AddText('Дата печати: '+DateTimeToStr(Now)+#10);
  PrintRep.AddText('Распечатал(а): '+Prm.UserName+#10#10);
  PrintRep.Font.Size:=6;
  PrintRep.AddText(mmMess.Lines.Text);
  PrintRep.PreView;
 end;

procedure TShowNewInfoF.Action1Execute(Sender: TObject);
 begin
  //
 end;

end.
