unit ViewLTU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, PrintReport;

type
  TViewLTF=class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    Label1: TLabel;
    BitBtn5: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    bbView: TBitBtn;

    procedure FormCreate(Sender:TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure bbViewClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);

  private

    procedure LTList;

  public

  end;

var ViewLTF:TViewLTF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TViewLTF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  dtStart.Date:=Date;
  dtEnd.Date:=Date;
  LTList;
 end;

procedure TViewLTF.LTList;
 begin
  try
   DM.qrLT.Close;
   DM.qrLT.SQL.Clear;
   DM.qrLT.SQL.Add('select * from Inform..DHLT where date_nakl>='''+FormatDateTime('yyyy-mm-dd ',dtStart.Date)+' 00:00:00'' and ');
   DM.qrLT.SQL.Add('                                 date_nakl<='''+FormatDateTime('yyyy-mm-dd ',dtEnd.Date)+' 23:59:59''');
   DM.qrLT.SQL.Add('order by date_nakl');
   DM.qrLT.Open;
  except
   MainF.MessBox('Ошибка доступа к спискам по лишнему товару!');
  end;
 end;

procedure TViewLTF.BitBtn5Click(Sender: TObject);
 begin
  LTList;
 end;

procedure TViewLTF.BitBtn4Click(Sender: TObject);
 begin
  Close;
 end;

procedure TViewLTF.bbViewClick(Sender: TObject);
 begin
  if DM.qrLT.IsEmpty then Exit;
  try
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=5;
   PrintRep.Font.Style:=[];
   PrintRep.AddText('Список лишних препаратов по торговой точке: ');
   PrintRep.Font.Style:=[fsBold];
   PrintRep.AddText(#10+Prm.AptekaNameRU+#10#10);
   PrintRep.AddText('Накладная №: '+DM.qrLT.FieldByName('nn_nakl').AsString+#10);
   PrintRep.AddText('Дата : '+DM.qrLT.FieldByName('date_nakl').AsString+#10#10);
   PrintRep.Font.Size:=4;
   PrintRep.Font.Style:=[];

{
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select top f_nds from SprTov where art_code='+DM.Qr.FieldByName('Код_I_1400').AsString;
   DM.QrEx.Open;
}
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_900],');
   DM.Qr.SQL.Add('       b.Art_Code as Код_I_1400,');
   DM.Qr.SQL.Add('       b.Names as Наименование_S_9000,');
   DM.Qr.SQL.Add('       b.Kol as [Кол-во_I_1000],');
   DM.Qr.SQL.Add('       b.Cena as Цена_N_1700,');
   DM.Qr.SQL.Add('       b.Cena*b.Kol as Сумма_N_1700');
   DM.Qr.SQL.Add('from Inform..DHLT a, Inform..DTLT b ');
   DM.Qr.SQL.Add('where a.iddoc=b.iddoc and a.iddoc='+DM.qrLT.FieldByName('IDDOC').AsString);
   DM.Qr.SQL.Add('order by b.Names,b.cena');
   DM.Qr.Open;
   PrintRep.Qr:=DM.Qr;

   PrintRep.PrintTable(False,6,4);
   PrintRep.Font.Style:=[fsBold];
   PrintRep.AddText(#10#10+'Зав. аптекой:_____________________       Представитель ревизионной комиссии :____________________'+#10);

   PrintRep.PreView;

  except
   MainF.MessBox('');
  end;
 end;

procedure TViewLTF.DBGrid1DblClick(Sender: TObject);
 begin
  bbViewClick(bbView);
 end;

end.
