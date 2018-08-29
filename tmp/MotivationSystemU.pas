unit MotivationSystemU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, jpeg, ExtCtrls, ExtImage, OpenLib, Buttons, Grids,
     DBGrids, DB, ADODB, Util, DateUtils;

const dy=65;

type

  TList=Array of Record
                  //Lb1:TLabel;
                  //Lb2:TLabel;
                  ID:Integer;
                  NumP:Integer;
                  Names:String;
                  Im:TExtImage;
                  Active:Boolean;
                 end;

  TMotivationSystemF = class(TForm)

    lbUser: TLabel;
    Image1: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    sb1: TScrollBox;
    Memo1: TMemo;
    Label2: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    lb1: TLabel;
    imHead1: TImage;
    imHead2: TImage;
    pn4: TPanel;
    Panel5: TPanel;
    im1_4: TImage;
    lb2: TLabel;
    dbg2: TDBGrid;
    Panel4: TPanel;
    im2_4: TImage;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    qr4_1: TADOQuery;
    qr4_2: TADOQuery;
    ds4_1: TDataSource;
    ds4_2: TDataSource;
    Label6: TLabel;
    Image2: TImage;
    lbBonusAll: TLabel;
    Panel6: TPanel;

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure imMouseEnter(Sender: TObject);
    procedure imMouseLeave(Sender: TObject);
    procedure imClick(Sender: TObject);

  private

    procedure ClearList;
    procedure CreateList;
    procedure DrawCell(Num:Integer; P:Byte);

  public

    aList:TList;
    Dt:TDatetime;

  end;

var MotivationSystemF: TMotivationSystemF;


implementation

uses DataModuleU, MainU;

{$R *.dfm}

procedure TMotivationSystemF.ClearList;
var i:Integer;
 begin
  for i:=Low(aList) to High(aList) do aList[i].Im.Free;
  SetLength(AList,0);
 end;

procedure TMotivationSystemF.DrawCell(Num:Integer; P:Byte);
var im:TExtImage;
 begin

  im:=aList[Num].Im;

  Case P of
   0:im.Canvas.Brush.Color:=$00E0ECDF;
   1:im.Canvas.Brush.Color:=$009FC59C;
  end;

  im.Canvas.FillRect(Rect(0,0,im.Width,im.Height));
  if aList[Num].Active=False then
   begin
    im.Canvas.Font.Color:=clBlack;
    im.Canvas.Font.Style:=[fsBold];
   end else begin
             im.Canvas.Font.Color:=clMaroon;
             im.Canvas.Font.Style:=[fsUnderline,fsBold];
            end;

  im.Canvas.TextOut(5,5,'Приоритет № -'+IntToStr(aList[Num].NumP));

  im.Canvas.Font.Style:=[];

  DrawWrapedText(im.Canvas,Memo1,Rect(111,5,331,Im.Height),aList[Num].Names);

 end;


procedure TMotivationSystemF.CreateList;
var i:Integer;

 begin
  try

   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select * from SprPrioritet order by NumPrioritet,Names';
//   DM.QrEx.SQL.Text:='exec spY_PrioritetList ';
   DM.QrEx.Open;

   sb1.VertScrollBar.Position:=0;

   ClearList;

   SetLength(aList,DM.QrEx.RecordCount);

   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;

     aList[i-1].Active:=False;
     aList[i-1].ID:=DM.QrEx.FieldByName('ID').AsInteger;
     aList[i-1].NumP:=DM.QrEx.FieldByName('NumPrioritet').AsInteger;
     aList[i-1].Names:=DM.QrEx.FieldByName('Names').AsString;

     aList[i-1].Im:=TExtImage.Create(nil);

     With aList[i-1].Im do
      begin

       Parent:=sb1;
       Left:=0;
       Top:=(i-1)*dy;
       Height:=dy-1;
       Width:=sb1.Width-16;
       ShowHint:=True;

       OnMouseEnter:=imMouseEnter;
       OnMouseLeave:=imMouseLeave;

       OnClick:=imClick;

       Tag:=i-1;

      end;

     DrawCell(i-1,0);
{
     aList[i-1].Lb1:=Tlabel.Create(nil);
     With aList[i-1].Lb1 do
      begin
       Parent:=sb1;
       Left:=5;
       Top:=(i-1)*dy+5;
       Font.Style:=[fsBold];
       Caption:='Приоритет № -'+DM.QrEx.FieldByName('NumPrioritet').AsString;
      end;

     aList[i-1].Lb2:=TLabel.Create(nil);
     With aList[i-1].Lb2 do
      begin
       Parent:=sb1;

       Left:=111;
       Top:=(i-1)*dy+5;
       WordWrap:=True;
       Caption:=DM.QrEx.FieldByName('Names').AsString;
       Width:=220;
      end;
}
    end;

  except
   on E:Exception do MainF.MessBox('Ошибка формирования списка: '+E.Message);
  end;
 end;

procedure TMotivationSystemF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  CreateList;

  MakeGradientWidthI(imHead1,$0083582E,$00CFA376);
  MakeGradientWidthI(imHead2,$00000380,$000004B9);

  Dt:=Date;

  Label6.Caption:='Всего бонусов за '+#10+MonthToStrRU(Dt)+' '+FormatDateTime('yyyy',Dt);

  DM.Qr.Close;
  DM.Qr.SQL.Text:='exec spY_GetSumBonusAll '+IntToStr(Prm.ID_Gamma)+','''+FormatDateTime('yyyy-mm-dd',StartOfTheMonth(Date))+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss',EndOfTheMonth(Date))+'''';
  DM.Qr.Open;
  lbBonusAll.Caption:=CurrToStr(DM.Qr.FieldByName('SumB').AsCurrency);
 end;

procedure TMotivationSystemF.FormActivate(Sender: TObject);
 begin
//  WindowState:=wsMaximized;
  if High(aList)>-1 then  imClick(aList[0].Im);
 end;

procedure TMotivationSystemF.Label1MouseEnter(Sender: TObject);
 begin
  TLabel(Sender).Font.Style:=[fsUnderline];
 end;

procedure TMotivationSystemF.Label1MouseLeave(Sender: TObject);
 begin
  TLabel(Sender).Font.Style:=[];
 end;

procedure TMotivationSystemF.FormDestroy(Sender: TObject);
 begin
  ClearList;
 end;

procedure TMotivationSystemF.imMouseEnter(Sender: TObject);
 begin
  DrawCell(TExtImage(Sender).Tag,1);
 end;

procedure TMotivationSystemF.imMouseLeave(Sender: TObject);
 begin
  DrawCell(TExtImage(Sender).Tag,0);
 end;

procedure TMotivationSystemF.imClick(Sender: TObject);
var ID,i:Integer;
    pn:TPanel;
    IsExist:Boolean;

 begin


  for i:=Low(aList) to High(aList) do
   begin
    aList[i].Active:=False;
    DrawCell(i,0);
   end;

  ID:=TExtImage(Sender).Tag;

  aList[ID].Active:=True;

  DrawCell(ID,1);

 { lb1.Caption:=aList[ID].Descr;

  IsExist:=False;
  for i:=0 to ComponentCount-1 do
   if Copy(Components[i].Name,1,2)='pn' then
    begin
     TPanel(Components[i]).Visible:=False;
     if Components[i].Name='pn'+IntToStr(aList[ID].ID) then IsExist:=True;
    end;

  if IsExist then
   try
    pn:=TPanel(FindComponent('pn'+IntToStr(aList[ID].ID)));
    pn.Left:=346;
    pn.Top:=116;
    pn.Visible:=True;
    Case aList[ID].ID of
     4:begin
        MakeGradientWidthI(im1_4,clGreen,$00C1EFAD);
        MakeGradientWidthI(im2_4,clGreen,$00C1EFAD);

        qr4_1.Close;
        qr4_1.SQL.Text:='exec spY_ArtZamenaList '+IntToStr(aList[ID].IDP)+',1';
        qr4_1.Open;

        Label5.Caption:='Период действия: с '+qr4_1.FieldByName('DtStart').AsString+' по '+qr4_1.FieldByName('DtEnd').AsString;

        qr4_2.Close;
        qr4_2.SQL.Text:='exec spY_ArtZamenaList '+IntToStr(aList[ID].IDP)+',2';
        qr4_2.Open;

       end;
    end;
   except
   end;
}
 end;

end.
