unit ViewMapU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Buttons, OleCtrls, SHDocVw, Util, SHDocVw_EWB,
     PrintReport, ADODB, Printers, Grids, DBGrids;

type

  TViewMapF = class(TForm)

    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    imMap: TImage;
    Label1: TLabel;
    PrintDialog1: TPrintDialog;
    Label2: TLabel;
    lbPhone: TLabel;
    Label3: TLabel;
    lbAdres: TLabel;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    imFasad: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);

  private

  public

   X,Y:Real;
   Qr:TADOQuery;
   Phone:String;
   Adres:String;
   id_apteka:Integer;

  end;

var ViewMapF:TViewMapF;

implementation

uses MainU, TovInfoU, DataModuleU;

{$R *.dfm}

procedure TViewMapF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TViewMapF.BitBtn2Click(Sender:TObject);
 begin
  TovInfoF.IsMap:=True;
  Close;
 end;

procedure TViewMapF.BitBtn6Click(Sender: TObject);
var Bm:TBitMap;
    i:Integer;
 begin
  if PrintDialog1.Execute=False then Exit;
  try

   Printer.BeginDoc;
   Printer.Canvas.Font.Charset:=RUSSIAN_CHARSET;
   Printer.Canvas.Font.Size:=12;
   Printer.Canvas.TextOut(2000,50,Label1.Caption);
   Printer.Canvas.StretchDraw (Rect(150,300,4500,3370),imMap.Picture.Graphic);
   Printer.Canvas.Font.Size:=10;

   Printer.Canvas.StretchDraw (Rect(2000,3800,4500,5600),imFasad.Picture.Graphic);

   Printer.Canvas.TextOut(150,3500,'Телефон: '+Phone);
   Printer.Canvas.TextOut(150,3600,'Адрес: '+Adres);

   Printer.Canvas.TextOut(200,4100,'Режим работы: ');

   for i:=1 to Qr.RecordCount do
    begin
     if i=1 then Qr.First else Qr.Next;
     Printer.Canvas.TextOut(270,4100+i*100,Qr.FieldByName('Descr').AsString+':');
     Printer.Canvas.TextOut(900,4100+i*100,Qr.FieldByName('OperationMode').AsString);
    end;

   Printer.EndDoc;
  except
   on E:Exception do MainF.MessBox('Ошибка печати карты: '+E.Message);
  end;

{
                              MarryFont
  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Font.Size:=5;
  PrintRep.Align:=AL_CENTER;
  PrintRep.AddText(Label1.Caption+#10#10);

  Bm:=TBitMap.Create;
  try
   Bm.Width:=imMap.Width;
   Bm.Height:=imMap.Height;
   Bm.Canvas.Draw(0,0,imMap.Picture.Graphic);
   PrintRep.AddImage(Bm);
  finally
   Bm.Free;
  end;

  PrintRep.Align:=AL_LEFT;

  PrintRep.AddText(#10#10);
  PrintRep.AddText('Телефон: '+Phone+#10);
  PrintRep.AddText('Адрес: '+Adres+#10#10);
  PrintRep.AddText('Режим работы: '#10);


  PrintRep.PreView;
}
 end;

end.
