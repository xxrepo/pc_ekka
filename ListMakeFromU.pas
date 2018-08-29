unit ListMakeFromU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Grids, DBGrids, StdCtrls, Buttons, ShareU, Menus;

type
  TListMakeFromF = class(TForm)
    dbgSkl: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dbgSklKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgSklDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N1Click(Sender: TObject);
  private

  public

    Flag:Byte;

  end;

var
  ListMakeFromF: TListMakeFromF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TListMakeFromF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Flag:=0;
  if (Prm.AptekaSklad=False) or (Prm.Dobraia=True) then
   begin
    dbgSkl.Columns[2].Width:=dbgSkl.Columns[2].Width+dbgSkl.Columns[4].Width;
    dbgSkl.Columns[4].Visible:=False;
   end;
 end;

procedure TListMakeFromF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TListMakeFromF.BitBtn2Click(Sender: TObject);
var AC:Integer;
 begin
  MainF.CheckMakeFromExists(DM.spY_MakeFromList,AC);
  Flag:=1;
  Close;
 end;

procedure TListMakeFromF.dbgSklKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key=VK_RETURN then BitBtn2Click(BitBtn2);
 end;

procedure TListMakeFromF.dbgSklDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
    IsS:Boolean;
    Srok:TDateTime;
    dR,sR:TRect;
    tmpBColor,C:TColor;
    dxr:Integer;
    IsRec:Boolean;

 procedure Transp(dr:TRect);
 var j,i:Integer;
  begin
   C:=db.Canvas.Pixels[dr.Left,dr.Top];
   for j:=dr.Top to dr.Bottom do
    for i:=dr.Left to dr.Right do
     if db.Canvas.Pixels[i,j]=C then
      db.Canvas.Pixels[i,j]:=db.Canvas.Brush.Color;
  end;

 Begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  if (db.DataSource.DataSet.FieldByName('OSTAT').AsInteger<=0) then db.Canvas.Brush.Color:=$00FFCB5E;

  IsS:=IsSrok(db.DataSource.DataSet.FieldByName('NAMES').AsString,Srok);
  if IsS and (DataCol=2) and (db.DataSource.DataSet.FieldByName('OSTAT').AsInteger>0) then
   begin
    db.Canvas.Brush.Color:=$004F4FFF;
   end;

  if (db.DataSource.DataSet.FieldByName('IsScan').AsInteger<>0) and (DataCol=0) then
   begin
    db.Canvas.Brush.Color:=$00FFD98A;
    db.Canvas.Font.Color:=clBlack;
   end;

  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  if (DataCol=3) and (db.DataSource.DataSet.FieldByName('KolRes').AsInteger>0) then
   begin
    db.Canvas.Font.Color:=clRed;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  {--- Рисование значка "Разрешенные для несканирования"}
  if (db.DataSource.DataSet.FieldByName('IsScan').AsInteger<>0) and (DataCol=0) then
   begin
    dR:=Rect;
    dr.Left:=dr.Left+2; dr.Top:=dr.Top+2;
    dr.Right:=dR.Left+MainF.imNoScan.Width; dr.Bottom:=dR.Top+MainF.imNoScan.Height;
    sR.Left:=0; sR.Top:=0;
    sR.Right:=MainF.imNoScan.Width; sR.Bottom:=MainF.imNoScan.Height;
    db.Canvas.CopyRect(dR,MainF.imNoScan.Canvas,sR);
   end;

  {--- Рисование значка "Есть аннотация"}
  if (DataCol=3) and (db.DataSource.DataSet.FieldByName('IsAnnot').AsInteger=1) then
   try
    dR:=Rect;
    dr.Left:=dr.Left+2; dr.Top:=dr.Top+2;
    dr.Right:=dR.Left+MainF.imAnnot.Width; dr.Bottom:=dR.Top+MainF.imAnnot.Height;
    sR.Left:=0; sR.Top:=0;
    sR.Right:=MainF.imAnnot.Width; sR.Bottom:=MainF.imAnnot.Height;

    db.Canvas.CopyRect(dR,MainF.imAnnot.Canvas,sR);
//       if (gdSelected in State) then
    Transp(dr);
   except
   end;

  if db.DataSource.DataSet.FieldByName('EndReg').AsInteger>2 then dxr:=20 else dxr:=0;
  IsRec:=False;

  {--- Рисование значка "Рецептура"}
  if (DataCol=2) and (db.DataSource.DataSet.FieldByName('F_NDS').AsInteger=2) and (db.DataSource.DataSet.FieldByName('IsRecipt').AsInteger=0) then
   try
    Inc(dxr,20);
    IsRec:=True;
    db.Canvas.FillRect(Rect);

//    DrawWithFilter(DataCol,Rect.Left+dxr, Rect.Top+1,db.DataSource.DataSet.FieldByName('NAMES').AsString,edCntxSearch.Text);
    db.Canvas.TextOut(Rect.Left+dxr, Rect.Top+1,db.DataSource.DataSet.FieldByName('NAMES').AsString);

    dR:=Rect;
    dr.Left:=dr.Left+2; dr.Top:=dr.Top+2;
    dr.Right:=dR.Left+MainF.imRecipt.Width; dr.Bottom:=dR.Top+MainF.imRecipt.Height;
    sR.Left:=0; sR.Top:=0;
    sR.Right:=MainF.imRecipt.Width; sR.Bottom:=MainF.imRecipt.Height;

    db.Canvas.CopyRect(dR,MainF.imRecipt.Canvas,sR);
//    if (gdSelected in State) then
    Transp(dr);
   except
   end;

  {--- Рисование значка "Закончилась регистрация"}
  if (DataCol=2) and (db.DataSource.DataSet.FieldByName('EndReg').AsInteger>2) then
   try
    if IsRec=False then
     begin
      db.Canvas.FillRect(Rect);
//      DrawWithFilter(DataCol,Rect.Left+dxr, Rect.Top+1,db.DataSource.DataSet.FieldByName('NAMES').AsString,edCntxSearch.Text);
      db.Canvas.TextOut(Rect.Left+dxr, Rect.Top+1,db.DataSource.DataSet.FieldByName('NAMES').AsString);
     end;

    db.Canvas.Pen.Color:=clBlue;
    db.Canvas.Brush.Color:=clYellow;
    db.Canvas.RoundRect(Rect.Left+dxr-18,Rect.Top+3,Rect.Left+dxr-2,Rect.Top+19,5,5);
    db.Canvas.Font.Name:='Arial';
    db.Canvas.Font.Size:=8;
    db.Canvas.Font.Style:=[fsBold,fsItalic];
    db.Canvas.Font.Color:=clBlue;
    db.Canvas.TextOut(Rect.Left+dxr-15,Rect.Top+4,'R');
   except
   end;
  db.Canvas.Brush.Color:=tmpBColor;

  {--- Подсветка скидки на сроковые препараты --- }
  if IsS and (db.DataSource.DataSet.FieldByName('SrokSkd').AsInteger>0) and (DataCol=2) then
   try
    dR:=Rect;
    dr.Left:=dr.Right-110; dr.Right:=dr.Right-20; dr.Top:=dr.Top+1; dr.Bottom:=dR.Bottom-1;

    db.Canvas.Font.Name:='MS Sans Serif';
    db.Canvas.Font.Size:=10;
    db.Canvas.Font.Style:=[fsBold];
    db.Canvas.Font.Color:=clBlack;

    db.Canvas.Pen.Color:=clBlack;
    db.Canvas.Brush.Color:=clRed;
    db.Canvas.FillRect(dr);
    db.Canvas.Rectangle(dr);

    db.Canvas.TextOut(dr.Left+2,dr.Top+1,'Скидка '+db.DataSource.DataSet.FieldByName('SrokSkd').AsString+'%');
   except
   end;

 end;

procedure TListMakeFromF.N1Click(Sender: TObject);
 begin
  MainF.ShowAnnotation(DM.spY_MakeFromList.FieldByName('Art_Code').AsInteger);
 end;

end.
