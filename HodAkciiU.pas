unit HodAkciiU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB, Util, ExtCtrls;

type
  THodAkciiF = class(TForm)

    Label1: TLabel;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Label8: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;  DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ComboBox1CloseUp(Sender: TObject);

  private

    Arr:Array of Integer;

    procedure ShowAkcia(IDA: Integer);

  public

  end;

var HodAkciiF:THodAkciiF;

implementation

uses DataModuleU;

{$R *.dfm}

procedure THodAkciiF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure THodAkciiF.ShowAkcia(IDA:Integer);
var sPl:String;
 begin

  Label8.Caption:=ComboBox1.Text;

  DM.QrEx1.Close;
  DM.QrEx1.SQL.Text:='select * from Inform..dhAkcii1 where id='+IntToStr(IDA);
  DM.QrEx1.Open;

  Label2.Caption:='Период проведения: '+DateToStr(DM.QrEx1.FieldByName('dt_start').AsDateTime)+' по '+DateToStr(DM.QrEx1.FieldByName('dt_end').AsDateTime);
  Label3.Caption:='Приз за 1-е место: '+DM.QrEx1.FieldByName('Prize1').AsString;
  Label4.Caption:='Приз за 2-е место: '+DM.QrEx1.FieldByName('Prize2').AsString;
  Label5.Caption:='Приз за 3-е место: '+DM.QrEx1.FieldByName('Prize3').AsString;

  DM.QrEx1.Close;
  DM.QrEx1.SQL.Text:='select top 1 * from Inform..dsAkcii1 where id_akcii='+IntToStr(IDA);
  DM.QrEx1.Open;
  if DM.QrEx1.FieldByName('Plan').AsInteger=0 then
   begin
    DBGrid2.Columns[1].Visible:=True;
    DBGrid2.Columns[0].Width:=511;
    Label6.Caption:='План продаж утановлен для каждого товара отдельно';
   end else begin
             DBGrid2.Columns[1].Visible:=False;
             DBGrid2.Columns[0].Width:=656;
             Label6.Caption:='План продаж общий в количестве '+DM.QrEx1.FieldByName('Plan').AsString;
            end;

  DM.qrPlanA1.Close;
//  DM.qrPlanA1.SQL.Text:='select t.names,t.plankol from Inform..dtAkcii1 t, Inform..dhAkcii1 a where t.id=a.id_pos and t.id_akcii='+IntToStr(IDA);
  DM.qrPlanA1.SQL.Text:='select t.names,t.plankol from Inform..dtAkcii1 t where t.id_akcii='+IntToStr(IDA);
  DM.qrPlanA1.Open;

  DM.qrResA1.Close;
  DM.qrResA1.SQL.Clear;
  DM.qrResA1.SQL.Add('if Object_ID(N''tempdb..#hodakc'') is not null drop table #hodakc ');

  if DM.QrEx1.FieldByName('TypeExec').AsInteger=1 then
   begin
    DBGrid1.Columns[1].Visible:=False;
    DBGrid1.Columns[0].Width:=510;
    DM.qrResA1.SQL.Add('select apteka,Sum(kol) as kol,Max(place) as Place into #hodakc from Inform..dsAkcii1 where id_akcii='+IntToStr(IDA)+' group by apteka order by 2 desc');
   end else begin
             DBGrid1.Columns[1].Visible:=True;
             DBGrid1.Columns[0].Width:=203;
             DM.qrResA1.SQL.Add('select apteka,users,kol,place into #hodakc from Inform..dsAkcii1 where id_akcii='+IntToStr(IDA)+' order by kol desc');
            end;

  DM.qrResA1.SQL.Add('declare @i smallint ');
  DM.qrResA1.SQL.Add('set @i=0');
  DM.qrResA1.SQL.Add('update #hodakc set @i=Place=@i+1');
  DM.qrResA1.SQL.Add('select * from #hodakc order by Place');
  DM.qrResA1.Open;

 end;

procedure THodAkciiF.FormActivate(Sender: TObject);
var i:Integer;

 begin
  DM.QrEx1.Close;
  DM.QrEx1.SQL.Text:='select id,descr from Inform..dhAkcii1 group by id,descr order by 2';
  DM.QrEx1.Open;
  ComboBox1.Clear;
  SetLength(Arr,0);
  SetLength(Arr,DM.QrEx1.RecordCount);
  for i:=1 to DM.QrEx1.RecordCount do
   begin
    if i=1 then DM.QrEx1.First else DM.QrEx1.Next;
    ComboBox1.Items.Add(DM.QrEx1.FieldByName('Descr').AsString);
    Arr[i-1]:=DM.QrEx1.FieldByName('id').AsInteger;
   end;
  ComboBox1.ItemIndex:=0;
  ShowAkcia(Arr[ComboBox1.ItemIndex]);
 end;

procedure THodAkciiF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  Case db.DataSource.DataSet.FieldByName('Place').AsInteger of
   1:db.Canvas.Font.Color:=clRed;
   2:db.Canvas.Font.Color:=clMaroon;
   3:db.Canvas.Font.Color:=clBlue;
  end;
  if gdSelected in State then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure THodAkciiF.ComboBox1CloseUp(Sender: TObject);
 begin
  ShowAkcia(Arr[ComboBox1.ItemIndex]);
 end;

end.
