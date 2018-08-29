unit FirstRecomendU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Grids, DBGrids, StdCtrls, DBCtrls, Buttons, ExtCtrls, DB;

type
  TFirstRecomendF = class(TForm)
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    DBText1: TDBText;
    Label1: TLabel;
    DBText2: TDBText;
    cbAddToChek: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1KeyUp(Sender: TObject; var Key: Word; Shift:TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private

    procedure ShowNaznSpis(S: String);
    procedure DSrc1DataChange(Sender: TObject; Field: TField);

  public

    T_tov,Flag,ArtDop:Integer;

  end;

var FirstRecomendF:TFirstRecomendF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TFirstRecomendF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Flag:=0;
  DBGrid1.DataSource.OnDataChange:=DSrc1DataChange;
  ArtDop:=0;
 end;

procedure TFirstRecomendF.ShowNaznSpis(S:String);
var AC:Integer;
 begin
  try
   if DM.qrNaznSpis.Active then AC:=DM.qrNaznSpis.FieldByName('art_code').AsInteger;
   DM.qrNaznSpis.Close;
   DM.qrNaznSpis.SQL.Clear;

{
   DM.qrNaznSpis.SQL.Add('select s.art_code,s.names,Sum(s.ostat) as kol,Max(s.cena) as cena,s.type_tov,z.n_rec,IsNull((select top 1 Upak from Inform..SprKoef k where k.art_code=s.art_code),1)*Max(s.cena) as cenaup      ');
   DM.qrNaznSpis.SQL.Add('from SprTov s (nolock), SprZamPrem z (nolock) ');
   DM.qrNaznSpis.SQL.Add('where s.art_code=z.art_code and z.pr='''+S+''' ');
   DM.qrNaznSpis.SQL.Add('group by s.art_code,s.names,s.type_tov, z.n_rec ');
   DM.qrNaznSpis.SQL.Add('order by z.n_rec,s.names ');
}
   DM.qrNaznSpis.SQL.Text:='exec spY_FirstRecList '''+S+'''';
   DM.qrNaznSpis.Open;
   DM.qrNaznSpis.Locate('art_code',AC,[]);
  except
  end;
 end;

procedure TFirstRecomendF.ListBox1Click(Sender: TObject);
 begin
  if ListBox1.ItemIndex>=0 then ShowNaznSpis(ListBox1.Items[ListBox1.ItemIndex]);
 end;

procedure TFirstRecomendF.ListBox1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if ListBox1.ItemIndex>=0 then ShowNaznSpis(ListBox1.Items[ListBox1.ItemIndex]);
 end;

procedure TFirstRecomendF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TFirstRecomendF.BitBtn1Click(Sender: TObject);
 begin
  if DM.qrNaznSpis.IsEmpty=False then
   begin
    T_tov:=DM.qrNaznSpis.FieldByName('type_tov').AsInteger;
    Flag:=DM.qrNaznSpis.FieldByName('art_code').AsInteger;
    ArtDop:=0;
    if cbAddToChek.Checked then
     ArtDop:=DM.qrNaznSpis.FieldByName('ArtDop').AsInteger;
{    if cbAddToChek.Checked
    try
     DM.QrEx.
exec @Res=spY_EnterKol @Art,1,@id_user,1,@Art,0,1
    except
    end
}
   end;
  Close;
 end;

procedure TFirstRecomendF.DBGrid1DblClick(Sender: TObject);
 begin
  BitBtn1Click(nil);
 end;

procedure TFirstRecomendF.FormActivate(Sender: TObject);
var i:Integer;
 begin
  ListBox1.Clear;
  for i:=1 to DM.qrNazn.RecordCount do
   begin
    if i=1 then DM.qrNazn.First else DM.qrNazn.Next;
    ListBox1.Items.Add(DM.qrNazn.FieldByName('Pr').AsString);
   end;
  ListBox1.ItemIndex:=0;
  if ListBox1.ItemIndex>=0 then ShowNaznSpis(ListBox1.Items[ListBox1.ItemIndex]);
 end;

procedure TFirstRecomendF.DSrc1DataChange(Sender:TObject; Field:TField);
 begin
  Panel1.Visible:=False;
  DBGrid1.Height:=374;
  if DM.qrNaznSpis.FieldByName('ArtDop').AsInteger>10 then
   begin
    Panel1.Visible:=True;
    DBGrid1.Height:=241;
   end;
 end;

end.



