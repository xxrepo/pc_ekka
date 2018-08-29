unit DopInfoU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
     Grids, DBGrids, StdCtrls, Buttons, Util, ExtCtrls, DBCtrls;

type
  TDopInfoF=class(TForm)
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn3: TBitBtn;
    DBText1: TDBText;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure ShowInfo;
    { Private declarations }
  public
    { Public declarations }
  end;

var DopInfoF: TDopInfoF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TDopInfoF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TDopInfoF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  ShowInfo;
 end;

procedure TDopInfoF.ShowInfo;
 begin
  try
   DM.qrInfo.Close;
   DM.qrInfo.SQL.Clear;
   DM.qrInfo.SQL.Add('select a.date_chek,b.users,a.cena_z,a.cena,a.perc');
   DM.qrInfo.SQL.Add('from #Arh a, SprUserAll b');
   DM.qrInfo.SQL.Add('where a.id_user=b.id and a.id_apteka=b.id_apteka and ');
   DM.qrInfo.SQL.Add('      a.id_apteka='+DM.qrRep.FieldByName('id_apteka').AsString+' and ');
   DM.qrInfo.SQL.Add('      a.art_code='+DM.qrRep.FieldByName('art_code').AsString+' and ');
   DM.qrInfo.SQL.Add('      a.cena='+DM.qrRep.FieldByName('cena').AsString+' and ');
   DM.qrInfo.SQL.Add('      convert(datetime,convert(varchar,a.date_chek,23))='''+FormatDateTime('yyyy-mm-dd 00:00:00',DM.qrRep.FieldByName('date_chek').AsDateTime)+'''');
   DM.qrInfo.SQL.Add('order by 1,2');
   DM.qrInfo.Open;
  except
  end;
 end;

procedure TDopInfoF.BitBtn3Click(Sender:TObject);
 begin
  DBGridToExcel(DBGrid1);
 end;

end.
