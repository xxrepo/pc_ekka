unit KolProdU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Util;

type
  TKolProdF = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    ComboBox2: TComboBox;
    lbName: TLabel;
    bbKol: TBitBtn;
    lbKol: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure bbKolClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private

    FArt_Code:Integer;

  public

    property Art_Code:Integer read FArt_Code write FArt_Code;

  end;

var KolProdF:TKolProdF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TKolProdF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TKolProdF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  ComboBox2.ItemIndex:=StrToInt(FormatDateTime('mm',Date()))-1;
  ComboBox2Change(ComboBox2);
  dtEnd.Date:=Date;
 end;

procedure TKolProdF.ComboBox2Change(Sender: TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    dtStart.Date:=D1;
    dtEnd.Date:=D31;
    bbKolClick(bbKol);
   end;
 end;

procedure TKolProdF.bbKolClick(Sender: TObject);
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select Sum(kol) as Kol from ArhCheks');
   DM.Qr.SQL.Add('where kod_name in (select kod_name from SprTov where art_code='+IntToStr(Art_Code)+') and ');
   DM.Qr.SQL.Add('      date_chek>='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtStart.DateTime)+''' and ');
   DM.Qr.SQL.Add('      date_chek<='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd  .DateTime)+''' and ');
   DM.Qr.SQL.Add('      id_user='+IntToStr(Prm.UserID));
   DM.Qr.Open;
   lbKol.Caption:=IntToStr(DM.Qr.FieldByName('Kol').AsInteger);
  except
   MainF.MessBox('Ошибка подсчета количества проданного товара!');
  end;
 end;

procedure TKolProdF.FormActivate(Sender: TObject);
 begin
  bbKolClick(bbKol);
 end;

end.
