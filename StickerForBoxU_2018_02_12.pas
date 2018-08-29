unit StickerForBoxU;

interface

uses
  Forms, StdCtrls, ComCtrls, Controls, Classes, SysUtils, PrintReport, Graphics;
//  , Windows, Messages, Variants, Dialogs;

type
  TStickerForBoxF = class(TForm)
    lbApteka: TLabel;
    edApteka: TEdit;
    lbDateTime: TLabel;
    dtDate: TDateTimePicker;
    dtTime: TDateTimePicker;
    lbFIO: TLabel;
    edFIO: TEdit;
    lbDescr: TLabel;
    meDescr: TMemo;
    lbCount: TLabel;
    edCount: TEdit;
    udCount: TUpDown;
    btPrint: TButton;
    btClose: TButton;
    lbBoxNo: TLabel;
    edBoxNo: TEdit;
    udBoxNo: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btPrintClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure edCountChange(Sender: TObject);
    procedure edBoxNoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  LEFT_INDENT = 12;
  TOP_INDENT = 12;
  SPACE_INDENT = 12;
  CONNECTED_SPACE_INDENT = 4;

  MIN_WIDTH = 640;
  MIN_HEIGHT = 480;

  MAX_COUNT_IN_BOX = 10000;

  LB_APTEKA_CAPTION = 'Аптека';
  LB_DATE_TIME_CAPTION = 'Дата и время';
  LB_FIO_CAPTION = 'Фамилия И.О.';
  LB_DESCR_CAPTION = 'Описание содержимого';
  LB_COUNT_CAPTION = 'Количество позиций';
  LB_BOX_NO_CAPTION = '№ ящика';

var
  StickerForBoxF: TStickerForBoxF;

implementation

{$R *.dfm}

uses
  MainU;

procedure TStickerForBoxF.FormCreate(Sender: TObject);
begin
  Caption:=MFC;
  BorderStyle:=bsDialog;
  Position:=poMainFormCenter;
  edApteka.Text:=Prm.AptekaNameRU;
  dtDate.Date:=Date();
  dtTime.Time:=Now();
  edFIO.Text:=Prm.UserName;
  meDescr.Text:='';
  udCount.Position:=1;
  udBoxNo.Position:=1;
  udCount.Max:=MAX_COUNT_IN_BOX;
  udBoxNo.Max:=MAX_COUNT_IN_BOX;
  lbApteka.Caption:=LB_APTEKA_CAPTION;
  lbDateTime.Caption:=LB_DATE_TIME_CAPTION;
  lbFIO.Caption:=LB_FIO_CAPTION;
  lbDescr.Caption:=LB_DESCR_CAPTION;
  lbCount.Caption:=LB_COUNT_CAPTION;
  lbBoxNo.Caption:=LB_BOX_NO_CAPTION;
end;

procedure TStickerForBoxF.FormActivate(Sender: TObject);
begin
  with StickerForBoxF do
  begin
    Constraints.MinWidth:=MIN_WIDTH;
    Constraints.MinHeight:=MIN_HEIGHT;
    ClientWidth:=MIN_WIDTH;
    ClientHeight:=MIN_HEIGHT;
    Position:=poMainFormCenter;
    meDescr.SetFocus;
  end;
end;

procedure TStickerForBoxF.FormResize(Sender: TObject);
begin
  lbApteka.Left:=LEFT_INDENT;
  lbApteka.Top:=TOP_INDENT;
  edApteka.Left:=lbApteka.Left+lbApteka.Width+CONNECTED_SPACE_INDENT;
  edApteka.Top:=lbApteka.Top;
  edApteka.Width:=ClientWidth-edApteka.Left-LEFT_INDENT;
  lbDateTime.Left:=LEFT_INDENT;
  lbDateTime.Top:=edApteka.Top+edApteka.Height+SPACE_INDENT;
  dtDate.Left:=lbDateTime.Left+lbDateTime.Width+CONNECTED_SPACE_INDENT;
  dtDate.Top:=lbDateTime.Top;
  dtDate.Width:=trunc((ClientWidth-dtDate.Left)/2)-LEFT_INDENT;
  dtTime.Left:=dtDate.Left+dtDate.Width+CONNECTED_SPACE_INDENT;
  dtTime.Top:=dtDate.Top;
  dtTime.Width:=ClientWidth-dtTime.Left-LEFT_INDENT;
  lbFIO.Left:=LEFT_INDENT;
  lbFIO.Top:=dtTime.Top+dtTime.Height+SPACE_INDENT;
  edFIO.Left:=lbFIO.Left+lbFIO.Width+CONNECTED_SPACE_INDENT;
  edFIO.Top:=lbFIO.Top;
  edFIO.Width:=ClientWidth-edFIO.Left-LEFT_INDENT;
  lbDescr.Left:=LEFT_INDENT;
  lbDescr.Top:=edFIO.Top+edFIO.Height+SPACE_INDENT;
  meDescr.Left:=LEFT_INDENT;
  meDescr.Top:=lbDescr.Top+lbDescr.Height+CONNECTED_SPACE_INDENT;
  meDescr.Width:=ClientWidth-meDescr.Left-LEFT_INDENT;
  meDescr.Height:=ClientHeight-meDescr.Top-btPrint.Height-edCount.Height-edBoxNo.Height-SPACE_INDENT*3-TOP_INDENT;
  lbCount.Left:=LEFT_INDENT;
  lbCount.Top:=meDescr.Top+meDescr.Height+SPACE_INDENT;
  edCount.Left:=lbCount.Left+lbCount.Width+CONNECTED_SPACE_INDENT;
  edCount.Top:=lbCount.Top;
  edCount.Width:=ClientWidth-edCount.Left-udCount.Width-CONNECTED_SPACE_INDENT-LEFT_INDENT;
  udCount.Left:=edCount.Left+edCount.Width+CONNECTED_SPACE_INDENT;
  udCount.Top:=edCount.Top;

  lbBoxNo.Left:=LEFT_INDENT;
  lbBoxNo.Top:=edCount.Top+edCount.Height+SPACE_INDENT;
  edBoxNo.Left:=lbBoxNo.Left+lbBoxNo.Width+CONNECTED_SPACE_INDENT;
  edBoxNo.Top:=lbBoxNo.Top;
  edBoxNo.Width:=ClientWidth-edBoxNo.Left-udBoxNo.Width-CONNECTED_SPACE_INDENT-LEFT_INDENT;
  udBoxNo.Left:=edBoxNo.Left+edBoxNo.Width+CONNECTED_SPACE_INDENT;
  udBoxNo.Top:=edBoxNo.Top;

  btPrint.Left:=trunc(ClientWidth/2)-btPrint.Width-trunc(SPACE_INDENT/2);
  btPrint.Top:=edBoxNo.Top+edBoxNo.Height+SPACE_INDENT;
  btClose.Left:=btPrint.Left+btPrint.Width+SPACE_INDENT;
  btClose.Top:=btPrint.Top;
end;

procedure TStickerForBoxF.btPrintClick(Sender: TObject);
var
  Tb: TTableObj;
{
const
  underlines = '_____________________';
}
begin
  try
    PrintRep.Clear;
    PrintRep.SetDefault;
    PrintRep.Font.Name:='Arial'; PrintRep.Font.Size:=5; PrintRep.Font.Style:=[];
    PrintRep.PageSize:=PF_A5; PrintRep.Orientation:=O_PORTR; PrintRep.Align:=AL_LEFT;

    PrintRep.AddTable(2,1);
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('500,2000');
    Tb.SetBorders(1,1,2,1,Border(clBlack,1,psClear));
    Tb.Cell[1,1].AddText(LB_APTEKA_CAPTION);
    Tb.Cell[2,1].Font.Style:=[fsBold];
    Tb.Cell[2,1].AddText(edApteka.Text+#10);

    PrintRep.AddTable(2,1);
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('500,2000');
    Tb.SetBorders(1,1,2,1,Border(clBlack,1,psClear));
    Tb.Cell[1,1].AddText(LB_DATE_TIME_CAPTION);
    Tb.Cell[2,1].Font.Style:=[fsBold];
    Tb.Cell[2,1].AddText(FormatDateTime('YYYY-MM-DD',dtDate.Date)+' '+FormatDateTime('HH:MM',dtTime.Time)+#10);

    PrintRep.AddTable(2,1);
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('500,2000');
    Tb.SetBorders(1,1,2,1,Border(clBlack,1,psClear));
    Tb.Cell[1,1].AddText(LB_FIO_CAPTION+#10);
    Tb.Cell[2,1].Font.Style:=[fsBold];
    Tb.Cell[2,1].AddText(edFIO.Text+#10);

    PrintRep.AddTable(2,1);
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('500,2000');
    Tb.SetBorders(1,1,2,1,Border(clBlack,1,psClear));
    Tb.Cell[1,1].AddText(LB_COUNT_CAPTION);
    Tb.Cell[2,1].Font.Style:=[fsBold];
    Tb.Cell[2,1].AddText(edCount.Text+#10);

    PrintRep.AddTable(2,1);
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('500,2000');
    Tb.SetBorders(1,1,2,1,Border(clBlack,1,psClear));
    Tb.Cell[1,1].AddText(LB_BOX_NO_CAPTION);
    Tb.Cell[2,1].Font.Style:=[fsBold];
    Tb.Cell[2,1].AddText(edBoxNo.Text+#10);

    PrintRep.AddText(#10+#10+LB_DESCR_CAPTION+#10+#10);
    PrintRep.AddText(meDescr.Text+#10);

    PrintRep.PreView;
  except
    on E:Exception do MainF.MessBox('Ошибка формирования печатной формы накладной: '+E.Message, 16);
  end;
end;

procedure TStickerForBoxF.btCloseClick(Sender: TObject);
begin
  StickerForBoxF.Close;
end;

procedure TStickerForBoxF.edCountChange(Sender: TObject);
begin
  try
    udCount.Position:=StrToInt(edCount.Text);
  except
    edCount.Text:=IntToStr(udCount.Position);
  end;
end;

procedure TStickerForBoxF.edBoxNoChange(Sender: TObject);
begin
  try
    udBoxNo.Position:=StrToInt(edBoxNo.Text);
  except
    edBoxNo.Text:=IntToStr(udBoxNo.Position);
  end;
end;

end.
