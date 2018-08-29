unit ShowNonRegU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, PrintReport,
 RepRegU;
type
  TShowNonRegF = class(TForm)
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    BitBtn10: TBitBtn;
    Label1: TLabel;
    Panel3: TPanel;
    lbNDS: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);

  private

    FF_Nds:Integer;
    FID_Apteka:Integer;

  public

    procedure ShowSpis;

    property F_Nds:Integer read FF_Nds write FF_Nds;
    property ID_Apteka:Integer read FID_Apteka write FID_Apteka;

  end;

var ShowNonRegF:TShowNonRegF;

implementation

uses DataModuleU;



{$R *.dfm}

{ TShowNonRegF }

procedure TShowNonRegF.ShowSpis;
 begin
  DM.qrNonNames.Close;
  DM.qrNonNames.SQL.Clear;
  DM.qrNonNames.SQL.Add('select art_code,Names ');
  DM.qrNonNames.SQL.Add('from SprTov a');
  DM.qrNonNames.SQL.Add('where art_code<>1 and f_nds='+IntToStr(F_NDS)+' and ostat>0 and ');
  DM.qrNonNames.SQL.Add('      art_code not in (select art_code from Inform..SprReg ');
  DM.qrNonNames.SQL.Add('                       where (IsNull(p1,0)>0 or IsNull(p2,0)>0 or IsNull(p3,0)>0) ');
  DM.qrNonNames.SQL.Add('                       group by art_code) ');
  DM.qrNonNames.SQL.Add('group by art_code,Names ');
  DM.qrNonNames.SQL.Add('order by Names ');
  DM.qrNonNames.Open;
  Label1.Caption:='Кол. наименований '+IntToStr(DM.qrNonNames.RecordCount);
 end;

procedure TShowNonRegF.BitBtn4Click(Sender: TObject);
 begin
  Close;
 end;

procedure TShowNonRegF.BitBtn10Click(Sender: TObject);
var i,RC:Integer;
    Tb:TTableObj;
 begin
  if DM.qrNonNames.IsEmpty then Exit;
  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Font.Name:='Arial';
  PrintRep.Font.Size:=5;
  PrintRep.Font.Style:=[fsBold];
  PrintRep.AddText('Список непроставленных наименований на '+DateTimeToStr(Date)+#10);
  PrintRep.AddText('Признак НДС: '+lbNDS.Caption+#10);
  RC:=DM.qrNonNames.RecordCount;
  PrintRep.AddText('Количество наименований: '+IntToStr(RC)+#10#10);
  PrintRep.Align:=AL_Left;
  PrintRep.Font.Style:=[];
  PrintRep.AddTable(5,RC+1);
  Tb:=PrintRep.LastTable;
  Tb.SetWidths('600,3450,600,600,600');
  Tb.FixRows(1,1);
  Tb.Cell[1,1].Align:=AL_CENTER;
  Tb.Cell[1,1].Font.Style:=[fsBold];
  Tb.Cell[1,1].AddText('АртКод');

  Tb.Cell[2,1].Align:=AL_CENTER;
  Tb.Cell[2,1].Font.Style:=[fsBold];
  Tb.Cell[2,1].AddText('Наименование');

  Tb.Cell[3,1].Font.Style:=[fsBold];
  Tb.Cell[3,1].AddText('Осн.');

  Tb.Cell[4,1].Font.Style:=[fsBold];
  Tb.Cell[4,1].AddText('Витр.');

  Tb.Cell[5,1].Font.Style:=[fsBold];
  Tb.Cell[5,1].AddText('Скл.');
  for i:=1 to RC do
   begin
    if i=1 then DM.qrNonNames.First else DM.qrNonNames.Next;
    Tb.Cell[1,i+1].AddText(DM.qrNonNames.FieldByName('art_code').AsString);
    Tb.Cell[2,i+1].AddText(DM.qrNonNames.FieldByName('names').AsString);
   end;
  PrintRep.PreView;
 end;

end.
