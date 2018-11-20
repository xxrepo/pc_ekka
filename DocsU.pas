unit DocsU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, Buttons, StdCtrls, ShCutU, Util;

type
  TDocsF = class(TForm)
    scrBox: TScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private

    procedure CreateDocsList;
    procedure ClearDocs;
    function SplitStr(S:String; F:TFont; W:Integer):String;

  public
  end;

var DocsF:TDocsF;
    Docs:Array of TShortCut;

implementation

uses MainU;

{$R *.dfm}

procedure TDocsF.ClearDocs;
var i:Integer;
 begin
  for i:=Low(Docs) to High(Docs) do Docs[i].Free;
  SetLength(Docs,0);
 end;

Procedure GetIconExt(Name:String; B:TBitMap; W,H:Integer);
 begin
  B.Height:=H;
  B.Width:=W;
  DrawIconEx(B.Canvas.Handle,0,0,GetRegistryIconHandle(Name),W,H,0,0,DI_Normal);
 end;

function TDocsF.SplitStr(S:String; F:TFont; W:Integer):String;
var M:TMemo;
    i:Integer;
    ss:String;
 begin
  try
   M:=TMemo.Create(nil);
   try
    M.Parent:=Self;
    M.Visible:=false;
    M.Font:=F;
    M.BorderStyle:=bsNone;
    M.WordWrap:=True;
    M.Width:=W;
    M.Lines.Text:=S;
    ss:='';
    for i:=0 to M.Lines.Count-1 do
     begin
      ss:=ss+M.Lines[i];
      if i<M.Lines.Count-1 then ss:=ss+#13;
     end;
    Result:=ss;
   finally
    M.Free;
   end;
  except
   Result:=S;
  end;
 end;


procedure TDocsF.CreateDocsList;
var sr:TSearchRec;
    dx,dy,X,Y,CA:Integer;
    DocPath:String;
 begin
  try
   DocPath:='\\server\ava\';
   ClearDocs;
   dx:=110; dy:=85;
   if FindFirst(DocPath+'*.pdf',faArchive,sr)=0 then
    begin
     X:=15; Y:=15;
     Repeat
      CA:=High(Docs)+1; SetLength(Docs,CA+1);
      Docs[CA]:=TShortCut.Create(Self);
      Docs[CA].Parent:=scrBox;
      Docs[CA].Height:=dy;
      Docs[CA].Width:=dx;
      Docs[CA].Top:=Y;
      Docs[CA].Left:=X;
      Docs[CA].Caption:=SplitStr(MyFileName(sr.Name),Docs[CA].Font,Docs[CA].Width-4);
      Docs[CA].ExeName:=sr.Name;
      Docs[CA].Path:=DocPath;
      Docs[CA].ParamStr:='';
      Docs[CA].IsOne:=false;
      GetIconExt(Docs[CA].Path+Docs[CA].ExeName,Docs[CA].Glyph,32,32);
      Inc(X,Dx+10);
      if X>scrBox.Width-Dx-25 then
       begin
        X:=15; Y:=Y+Dy+10;
       end;
     Until FindNext(sr)<>0;
     FindClose(sr);
    end;
  except
   MainF.MessBox('Ошибка создания списка документов!');
  end;
 end;

procedure TDocsF.FormCreate(Sender:TObject);
 begin
  Caption:='Документы';
  scrBox.HorzScrollBar.Position:=0;
  scrBox.VertScrollBar.Position:=0;
  CreateDocsList;
 end;

procedure TDocsF.FormDestroy(Sender: TObject);
 begin
  ClearDocs;
 end;

end.
