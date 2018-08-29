unit RealizRepU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, OpenLib, Printers, StdCtrls, ComCtrls, Buttons, Grids,
  DBGrids, DBCtrls, DB, PrintReport;

type
  TRealizRepF = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    btPer: TBitBtn;
    dtEnd: TDateTimePicker;
    dtStart: TDateTimePicker;
    rbTn3: TRadioButton;
    rbTn2: TRadioButton;
    rbTn1: TRadioButton;
    Label1: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label4: TLabel;
    dbgChekInfo: TDBGrid;
    bbCopyChek: TBitBtn;
    rbFilter: TRadioButton;
    pnSearch: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    edNumb: TEdit;
    Label7: TLabel;
    edNames: TEdit;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Label9: TLabel;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    Label10: TLabel;
    procedure rbTn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btPerClick(Sender: TObject);
    procedure bbCopyChekClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure rbFilterClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private

    FSr:String;

    procedure FilterRealiz;
    procedure ShowChek;
    procedure DSrc1DataChange(Sender:TObject; Field:TField);
    procedure SetVizPanels(V:Boolean);

  public
  end;

var RealizRepF:TRealizRepF;

implementation

uses DataModuleU, MainU, ShareU;

{$R *.dfm}

procedure TRealizRepF.FilterRealiz;
var i,tn:Integer;
    rb:TRadioButton;
 begin
  tn:=0;
  try
   for i:=1 to 3 do
    begin
     rb:=TRadioButton(FindComponent('rbTn'+IntToStr(i)));
     if rb.Checked then begin tn:=rb.Tag; rb.Font.Color:=clBlue; end
                   else rb.Font.Color:=clBlack;
    end;
  except
  end;
  try
   DM.spY_ChekList.Close;
   DM.spY_ChekList.Parameters.ParamValues['@dt1']:=StrToDate(DateToStr(dtStart.Date))+StrToTime(TimeToStr(Opt.TimeZ));
   DM.spY_ChekList.Parameters.ParamValues['@dt2']:=StrToDate(DateToStr(dtEnd.Date))+StrToTime(TimeToStr(Opt.TimeZ));
   DM.spY_ChekList.Parameters.ParamValues['@tn']:=tn;
   DM.spY_ChekList.Open;
   ShowChek;
  except
   MainF.MessBox('Ошибка доступа к архиву чеков!');
  end;
 end;

procedure TRealizRepF.rbTn1Click(Sender:TObject);
 begin
  SetVizPanels(False);
  FilterRealiz;
 end;

procedure TRealizRepF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  FSr:='';
  dtStart.Date:=Date;
  dtEnd.Date:=Date;
  DBGrid1.DataSource.OnDataChange:=DSrc1DataChange;
  FilterRealiz;
 end;

procedure TRealizRepF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TRealizRepF.btPerClick(Sender:TObject);
 begin
  FilterRealiz;
 end;

procedure TRealizRepF.ShowChek;
 begin
  if DM.spY_ChekList.IsEmpty then Exit;
  try
   DM.spY_ShowChek.Close;
   DM.spY_ShowChek.Parameters.ParamValues['@vzh']:=DM.spY_ChekList.FieldByName('Vzh').AsFloat;
   DM.spY_ShowChek.Parameters.ParamValues['@nch']:=DM.spY_ChekList.FieldByName('Numb_Chek').AsInteger;
   DM.spY_ShowChek.Open;
  except
  end;
 end;

procedure TRealizRepF.DSrc1DataChange(Sender: TObject; Field:TField);
 begin
  ShowChek;
 end;

procedure TRealizRepF.bbCopyChekClick(Sender: TObject);
var RC,i:Integer;
    SumSk:Real;
    Tb:TTableObj;
 begin
  if DM.spY_ChekList.IsEmpty then Exit;
  if DM.spY_ShowChek.IsEmpty then Exit;
  try
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=5;
   PrintRep.Font.Style:=[fsBold,fsUnderLine];
   PrintRep.AddText('КОПИЯ ЧЕКА'+#10#10);
   PrintRep.Font.Style:=[];
   PrintRep.AddText(Opt.FirmName+#10#10);
   PrintRep.AddText('№ Чека: '+DM.spY_ChekList.FieldByName('Numb_Chek').AsString+#10);
   PrintRep.AddText('Дата: '+FormatDateTime('dd.mm.yyyy hh:nn:ss',DM.spY_ChekList.FieldByName('Date_Chek').AsDateTime)+#10#10);
   RC:=DM.spY_ShowChek.RecordCount;
   PrintRep.AddTable(5,RC+1);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('1000,8000,2000,2000,2000');
   for i:=1 to 5 do
    begin
     Tb.Cell[i,1].Align:=AL_CENTER;
     Tb.Cell[i,1].Font.Style:=[fsBold];
    end; 
   Tb.Cell[1,1].AddText('№ пп');
   Tb.Cell[2,1].AddText('Наименование');
   Tb.Cell[3,1].AddText('Кол-во');
   Tb.Cell[4,1].AddText('Цена');
   Tb.Cell[5,1].AddText('Сумма');
   for i:=1 to RC do
    begin
     if i=1 then DM.spY_ShowChek.First else DM.spY_ShowChek.Next;
     Tb.Cell[1,i+1].Align:=AL_RIGHT;
     Tb.Cell[1,i+1].AddText(IntToStr(i));

     Tb.Cell[2,i+1].AddText(DM.spY_ShowChek.FieldByName('Names').AsString);

     Tb.Cell[3,i+1].Align:=AL_CENTER;
     Tb.Cell[3,i+1].AddText(DM.spY_ShowChek.FieldByName('Kol').AsString);

     Tb.Cell[4,i+1].Align:=AL_RIGHT;
     Tb.Cell[4,i+1].AddText(CurrToStrF(DM.spY_ShowChek.FieldByName('Cena').AsFloat,ffFixed,2));

     Tb.Cell[5,i+1].Align:=AL_RIGHT;
     Tb.Cell[5,i+1].AddText(CurrToStrF(DM.spY_ShowChek.FieldByName('Cena').AsFloat*DM.spY_ShowChek.FieldByName('Kol').AsInteger,ffFixed,2));
    end;
   SumSk:=DM.spY_ChekList.FieldByName('SumSkd').AsFloat;
   PrintRep.Font.Name:='Courier New';
   PrintRep.AddText(#10#10);
   PrintRep.Font.Style:=[fsBold];
   PrintRep.AddTable(2,3);
   Tb:=PrintRep.LastTable;
   Tb.SetBorders(1,1,2,3,EMPTY_BORDER);
   Tb.Cell[1,1].AddText('Сумма:');
   Tb.Cell[1,2].AddText('Скидка:');
   Tb.Cell[1,3].AddText('Всего:');

   for i:=1 to 3 do Tb.Cell[2,i].Align:=AL_RIGHT;
   Tb.Cell[2,1].AddText(CurrToStrF(DM.spY_ChekList.FieldByName('Summa').AsFloat,ffFixed,2));
   Tb.Cell[2,2].AddText(CurrToStrF(SumSk,ffFixed,2));
   Tb.Cell[2,3].AddText(CurrToStrF(DM.spY_ChekList.FieldByName('Summa').AsFloat-SumSk,ffFixed,2));

   PrintRep.Font.Size:=7;
   PrintRep.AddText(#10#10#10+'=ОПЛАЧЕНО=');
   PrintRep.PreView;
  except
  end;
 end;

procedure TRealizRepF.SetVizPanels(V:Boolean);
 begin
  if V then
   begin
    Panel3.Top:=33;
    Panel4.Top:=68;
    Panel4.Height:=363;
    edNumb.SetFocus;
   end else begin
             Panel3.Top:=33;
             Panel4.Top:=68;
             Panel4.Height:=363;
            end;
  pnSearch.Visible:=V;
 end;

procedure TRealizRepF.FormResize(Sender:TObject);
 begin
  RisizeDBGrid(dbgChekInfo,40);
 end;

procedure TRealizRepF.rbFilterClick(Sender:TObject);
 begin
  SetVizPanels(True);
 end;

procedure TRealizRepF.FormActivate(Sender:TObject);
 begin
  SetVizPanels(False);
  ShowChek;
  DBGrid1.SetFocus;
 end;

procedure TRealizRepF.DBGrid1KeyPress(Sender:TObject; var Key:Char);
 begin
  FindInDBG(TDBGrid(Sender),FSr,Key);
  Label10.Caption:=FSr;
 end;

procedure TRealizRepF.DBGrid1KeyDown(Sender:TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key in K_ARROW_KEYS then FSr:='';
 end;

end.
