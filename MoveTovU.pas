unit MoveTovU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,DateUtils,
     Dialogs, ExtCtrls, ComCtrls, StdCtrls, Grids, DBGrids, Buttons, DB, ADODB, Util;

type
  TMoveTovF = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel5: TPanel;
    Panel6: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2:TGroupBox;
    GroupBox3:TGroupBox;
    GroupBox4:TGroupBox;
    Panel2:TPanel;
    DBGrid1:TDBGrid;
    Panel3:TPanel;
    DBGrid2:TDBGrid;
    Panel4:TPanel;
    DBGrid3:TDBGrid;
    Panel7:TPanel;
    DBGrid4:TDBGrid;
    BitBtn1:TBitBtn;
    Label1:TLabel;
    Label2:TLabel;
    Label3:TLabel;
    Label4:TLabel;
    Label5:TLabel;
    Label6:TLabel;
    Label7:TLabel;
    Label8:TLabel;
    Label9:TLabel;
    Label10:TLabel;
    Label11:TLabel;
    Label12:TLabel;
    Label13:TLabel;
    Label14:TLabel;
    Label15:TLabel;
    Label16:TLabel;
    cbPer:TCheckBox;
    GroupBox5: TGroupBox;
    DBGrid5: TDBGrid;
    procedure FormCreate(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
    procedure FormClose(Sender:TObject; var Action: TCloseAction);
    procedure cbPerClick(Sender:TObject);
    procedure FormActivate(Sender: TObject);
    
  private

    FArtCode:Integer;
    procedure ShowAll;

  public

    property ArtCode:Integer read FArtCode write FArtCode;

  end;

var MoveTovF: TMoveTovF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

// Create формы
procedure TMoveTovF.FormCreate(Sender: TObject);
 begin
  BitBtn1.Glyph.Assign(MainF.imStop.Picture);
 end; {FormCreate}

// Отображает всю инфрмацию по движению
procedure TMoveTovF.ShowAll;
var i:Integer;
    Arh,Mov,Spr:String;
    IsShmal:Boolean;
    Dt:TDateTime;
    Reoc,DtS:String;
 begin
  try
   if Prm.AptekaID in [17,4,248] then Reoc:='ghghghghghghgh' else Reoc:='%пр-%';
   Dt:=StartOfTheWeek(Date);
   DtS:=FormatDateTime('yyyy-mm-dd',Dt)+' 00:00:00';
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from SprTer where art_code='+IntToStr(FArtCode);
   DM.Qr.Open;
   IsShmal:=Not DM.Qr.IsEmpty;
   cbPer.Visible:=Not IsShmal;

   for i:=0 to DM.ComponentCount-1 do
    if Copy(DM.Components[i].Name,1,4)='qrmt' then
     begin
      TADOQuery(DM.Components[i]).Close;
      TADOQuery(DM.Components[i]).SQL.Clear;
     end;

   if cbPer.Checked then
    begin
     Arh:='Apteka_Old..ArhCheks';
     Mov:='Apteka_Old..Moves';
     Spr:='Apteka_Old..SprTov'
    end else begin
              Arh:='ArhCheks';
              Mov:='Moves';
              Spr:='SprTov';
             end;

   // Приход со склада
   DM.qrmtPrih.SQL.Add('select nn_nakl,date_nakl,kol');
   DM.qrmtPrih.SQL.Add('from '+Mov);
   DM.qrmtPrih.SQL.Add('where nn_nakl not like '''+Reoc+''' and kod_name in (select kod_name from '+Spr+' where art_code = '+IntToStr(ArtCode)+')');
   DM.qrmtPrih.SQL.Add('and debcrd = 1 ');
   if IsShmal then
    DM.qrmtPrih.SQL.Add('and date_nakl>='''+DtS+'''');
   DM.qrmtPrih.SQL.Add('order by date_nakl ');

   // Всего приход со склада
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select IsNull(Sum(kol),0) as Sm from '+Mov+' where nn_nakl not like '''+Reoc+''' and kod_name in');
   DM.Qr.SQL.Add('(select kod_name from '+Spr+' where art_code = '+IntToStr(ArtCode)+') and debcrd=1');
   if IsShmal then
    DM.Qr.SQL.Add('and date_nakl>='''+DtS+'''');
   DM.Qr.Open;
   Label2.Caption:=DM.Qr.FieldByName('Sm').AsString;

   // Возврат на склад
   DM.qrmtVozr.SQL.Add('select nn_nakl,date_nakl,kol');
   DM.qrmtVozr.SQL.Add('from '+Mov);
   DM.qrmtVozr.SQL.Add('where nn_nakl not like '''+Reoc+''' and kod_name in (select kod_name from '+Spr+' where art_code = '+IntToStr(ArtCode)+')');
   DM.qrmtVozr.SQL.Add('and debcrd = 2 ');
   if IsShmal then
    DM.qrmtVozr.SQL.Add(' and date_nakl>='''+DtS+'''');
   DM.qrmtVozr.SQL.Add('order by date_nakl ');

   // Всего возврат на склад
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select IsNull(Sum(kol),0) as Sm from '+Mov+' where nn_nakl not like '''+Reoc+''' and kod_name in');
   DM.Qr.SQL.Add('(select kod_name from '+Spr+' where art_code = '+IntToStr(ArtCode)+') and debcrd=2');
   if IsShmal then
    DM.Qr.SQL.Add('and date_nakl>='''+DtS+'''');
   DM.Qr.Open;
   Label3.Caption:=DM.Qr.FieldByName('Sm').AsString;

   // Реализовано
   DM.qrmtRealiz.SQL.Add('select date_chek,numb_chek,kol,id_kassa,IsNull((select Max(Users) from SprUser where id=id_user),'''') as Kassir');
   DM.qrmtRealiz.SQL.Add('from '+Arh);
   DM.qrmtRealiz.SQL.Add('where kod_name in (select kod_name from '+Spr+' where art_code = '+IntToStr(ArtCode)+')');
   DM.qrmtRealiz.SQL.Add('and kol>0 ');
   if IsShmal then
    DM.qrmtRealiz.SQL.Add(' and date_chek>='''+DtS+'''');
   DM.qrmtRealiz.SQL.Add('order by date_chek ');


   // Всего реализовано
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select IsNull(Sum(kol),0) as Sm from '+Arh+' where kod_name in');
   DM.Qr.SQL.Add('(select kod_name from '+Spr+' where art_code = '+IntToStr(ArtCode)+') and kol>0');
   if IsShmal then
    DM.Qr.SQL.Add(' and date_chek>='''+DtS+'''');
   DM.Qr.Open;
   Label6.Caption:=DM.Qr.FieldByName('Sm').AsString;

   // Возврат от покупателей
   DM.qrmtBackKl.SQL.Add('select date_chek,numb_chek,kol*(-1) as kol,id_kassa,IsNull((select Max(Users) from SprUser where id=id_user),'''') as Kassir');
   DM.qrmtBackKl.SQL.Add('from '+Arh);
   DM.qrmtBackKl.SQL.Add('where kod_name in (select kod_name from '+Spr+' where art_code = '+IntToStr(ArtCode)+')');
   DM.qrmtBackKl.SQL.Add('and kol<0 ');

   if IsShmal then
    DM.qrmtBackKl.SQL.Add(' and date_chek>='''+DtS+'''');
   DM.qrmtBackKl.SQL.Add('order by date_chek ');

   // Всего возврат отпокупателей
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select IsNull(Abs(Sum(kol)),0) as Sm from '+Arh+' where kod_name in');
   DM.Qr.SQL.Add('(select kod_name from '+Spr+' where art_code = '+IntToStr(ArtCode)+') and kol<0');
   if IsShmal then
    DM.Qr.SQL.Add(' and date_chek>='''+DtS+'''');
   DM.Qr.Open;
   Label8.Caption:=DM.Qr.FieldByName('Sm').AsString;

   DM.qrmtPer.Close;
   DM.qrmtPer.SQL.Clear;
   DM.qrmtPer.SQL.Add('select dt,Sum(kol) as kol,Sum(IsNull(Blank1,0)+IsNull(Blank2,0)+IsNull(Blank3,0)) as Blank');
   DM.qrmtPer.SQL.Add('from Pereuchet ');
   DM.qrmtPer.SQL.Add('where art_code = '+IntToStr(ArtCode));
   DM.qrmtPer.SQL.Add('group by dt ');
   DM.qrmtPer.SQL.Add('order by dt ');
   DM.qrmtPer.Open;

   // Фактический остаток
   OpenADOSQL(DM.Qr,'select IsNull(Sum(Ostat),0) as Sm from '+Spr+' where art_code='+IntToStr(ArtCode));
   Label14.Caption:=DM.Qr.FieldByName('Sm').AsString;

   // Остаток на начало периода
   OpenADOSQL(DM.Qr,'select IsNull(Sum(Ostat_beg),0) as Sm from '+Spr+' where art_code='+IntToStr(ArtCode));
   Label15.Caption:=DM.Qr.FieldByName('Sm').AsString;

   // На резерве
   OpenADOSQL(DM.Qr,'select IsNull(Sum(t.Kol),0) as Sm from DhRes h (nolock), DtRes t (nolock) where h.idres=t.idres and h.closed=0 and t.art_code='+IntToStr(ArtCode));
   Label16.Caption:=DM.Qr.FieldByName('Sm').AsString;

   if DM.Qr.FieldByName('Sm').AsInteger>0 then
    begin
     Label12.Font.Color:=clBlue;
     Label16.Font.Color:=clBlue;
    end;
   // Расчетный остаток
   try
    if IsShmal then
     begin
      Label15.Caption:=IntToStr(StrToInt(Label14.Caption)+StrToInt(Label3.Caption)+
                                                          StrToInt(Label6.Caption)-
                                                          StrToInt(Label2.Caption)-
                                                          StrToInt(Label8.Caption));
      Label13.Caption:=Label14.Caption;
     end
    else
     Label13.Caption:=IntToStr(StrToInt(Label15.Caption)+StrToInt(Label2.Caption)+
                                                         StrToInt(Label8.Caption)-
                                                         StrToInt(Label6.Caption)-
                                                         StrToInt(Label3.Caption));
   except
    Label13.Caption:='0';
   end;

   if Label13.Caption<>Label14.Caption then
    begin
     Label13.Font.Color:=clRed;
     Label14.Font.Color:=clRed;
    end else begin
              Label13.Font.Color:=clBlack;
              Label14.Font.Color:=clBlack;
             end;

   for i:=0 to DM.ComponentCount-1 do
    if Copy(DM.Components[i].Name,1,4)='qrmt' then
     begin
      TADOQuery(DM.Components[i]).Open;
      TADOQuery(DM.Components[i]).Last;
     end;
  except
  end;
 end; {ShowAll}

// Кнопка "Закрыть"
procedure TMoveTovF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end; {BitBtn1Click}

// Close формы
procedure TMoveTovF.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  DM.Qr.Close;
 end; {FormClose}

// Флаг "Выбор периода" 
procedure TMoveTovF.cbPerClick(Sender: TObject);
 begin
  ShowAll;
 end; {cbPerClick}

procedure TMoveTovF.FormActivate(Sender: TObject);
 begin
  ShowAll;
 end;

END.
