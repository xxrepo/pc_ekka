unit JAhchU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, DB,
     DBCtrls, EnterValueU;

type
  TJAhchF = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    DBMemo2: TDBMemo;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    DBText1: TDBText;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private

    procedure DSrc1DataChange(Sender:TObject; Field:TField);
    procedure DSrc2DataChange(Sender:TObject; Field:TField);
    procedure ShowReq;
    procedure ShowSpis;


  public

  end;

var JAhchF: TJAhchF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TJAhchF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  dtStart.Date:=Date;
  dtEnd.Date:=Date;
 end;

procedure TJAhchF.BitBtn1Click(Sender: TObject);
 begin
  ShowReq;
 end;

procedure TJAhchF.ShowReq;
var id:String;
 begin

  if DM.qrJAhch.Active then id:=DM.qrJAhch.FieldByName('idr').AsString else id:='';
  DM.qrJAhch.Close;
  DM.qrJAhch.SQL.Text:='exec spY_Ahch_Req null,6,null,null,null,null,'''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+'''';
  DM.qrJAhch.Open;
  if id<>'' then DM.qrJAhch.Locate('idr',id,[]);
  ShowSpis;
 end;

procedure TJAhchF.DSrc1DataChange(Sender:TObject; Field:TField);
 begin
  ShowSpis;
 end;

procedure TJAhchF.DSrc2DataChange(Sender:TObject; Field:TField);
 begin
  BitBtn2.Enabled:=False;
  if DM.qrAhchR1.IsEmpty then Exit;
  if DM.qrAhchR1.FieldByName('Status').AsInteger=0 then BitBtn2.Enabled:=True;
 end;

procedure TJAhchF.ShowSpis;
var id:String;
 begin

  if DM.qrJAhch.IsEmpty then Exit;

  if DM.qrAhchR1.Active then id:=DM.qrAhchR1.FieldByName('id').AsString else id:='';
  DM.qrAhchR1.Close;
  DM.qrAhchR1.SQL.Text:='exec spY_Ahch_Req null,7,null,null,null,null,null,null,'''+DM.qrJAhch.FieldByName('idr').AsString+'''';
  DM.qrAhchR1.Open;
  if id<>'' then DM.qrAhchR1.Locate('id',id,[]);

 end;

procedure TJAhchF.FormActivate(Sender: TObject);
 begin
  DBGrid1.DataSource.OnDataChange:=DSrc1DataChange;
  DBGrid2.DataSource.OnDataChange:=DSrc2DataChange;
  ShowReq;
 end;

procedure TJAhchF.BitBtn4Click(Sender: TObject);
 begin
  Close;
 end;

procedure TJAhchF.BitBtn2Click(Sender: TObject);
var sDescr:String;
 begin
  if DM.qrAhchR1.IsEmpty then Exit;

  if EnterStrValue(sDescr,'¬ведите комментарий к качеству выполненной работы!')=False then Exit;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='exec spY_Ahch_Req '+IntToStr(Prm.ID_Gamma)+',8,null,null,null,'''+DM.qrAhchR1.FieldByName('id').AsString+''',null,null,null,'''+sDescr+''' select 1234 as Res';
  DM.QrEx.Open;

  ShowReq;

 end;

procedure TJAhchF.DBGrid1DrawColumnCell(Sender: TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin

  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  Case db.DataSource.DataSet.FieldByName('id_status').AsInteger of
   1:db.Canvas.Brush.Color:=clYellow;
   2:db.Canvas.Brush.Color:=clLime;
  end;

  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure TJAhchF.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin

  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  Case db.DataSource.DataSet.FieldByName('Status').AsInteger of
   0:db.Canvas.Brush.Color:=clYellow;
   1:db.Canvas.Brush.Color:=clLime;
  end;

  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

end.
