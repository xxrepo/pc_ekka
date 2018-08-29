unit ViewZakazPriceU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, DateUtils, Util,
  Grids, DBGrids, DB;

type
  TViewZakazPriceF = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    dtStart: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dtEnd: TDateTimePicker;
    Label8: TLabel;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    dsDate: TDataSource;
    dsZakaz: TDataSource;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dsDateDataChange(Sender: TObject; Field: TField);

  private

    procedure ShowDates;
    procedure ShowZakazPrice;

  public

  end;

var ViewZakazPriceF:TViewZakazPriceF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TViewZakazPriceF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  ComboBox2.ItemIndex:=StrToInt(FormatDateTime('mm',Date()))-1;
  ComboBox2Change(ComboBox2);
  dtEnd.Date:=Date;
  ShowDates;
 end;

procedure TViewZakazPriceF.ShowDates;
var Dt:TDateTime;
 begin
  try
   if DM.qrDateZP.Active then Dt:=DM.qrDateZP.FieldByName('Dt').AsDateTime;
   DM.qrDateZP.Close;
   DM.qrDateZP.SQL.Clear;
   DM.qrDateZP.SQL.Add('select Dt,id_user from ZakazPrice where IsNull(Closed,0)=1 and ');
   DM.qrDateZP.SQL.Add(' dt between '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtStart.Date)+''' and ');
   DM.qrDateZP.SQL.Add(' '''+FormatDateTime('yyyy-mm-dd hh:nn:ss',dtEnd.Date)+'''  ');
   DM.qrDateZP.SQL.Add('group by dt,id_user');
   DM.qrDateZP.SQL.Add('order by 1');
   DM.qrDateZP.Open;
   DM.qrDateZP.Locate('Dt',Dt,[]);
   ShowZakazPrice;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к заказам: '+E.Message);
  end;
 end;

procedure TViewZakazPriceF.ShowZakazPrice;
 begin
  DM.qrZakazP.Close;
  if DM.qrDateZP.IsEmpty then Exit;
  DM.qrZakazP.SQL.Clear;
  DM.qrZakazP.SQL.Add('select z.art_code,z.names,z.kol,u.users,z.prim,');
  DM.qrZakazP.SQL.Add('       (case when InSklad=0 then ''Нет'' else ''Есть'' end) as InSklad,');
  DM.qrZakazP.SQL.Add('       (case when IsNull(Zakaz,-1)=-1 then ''Необработан'' when IsNull(Zakaz,30000)<kol then ''Заказано в кол-ве ''+convert(varchar,Zakaz) else ''Заказано'' end) as Zakaz');
  DM.qrZakazP.SQL.Add('from ZakazPrice z, SprUser u ');
  DM.qrZakazP.SQL.Add('where IsNull(Closed,0)=1 and u.id=z.id_user and ');
  DM.qrZakazP.SQL.Add('      convert(datetime,convert(varchar,z.dt,20))=convert(datetime,convert(varchar,'''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DM.qrDateZP.FieldByName('dt').AsDateTime)+''',20)) and id_user='+DM.qrDateZP.FieldByName('id_user').AsString);
  DM.qrZakazP.SQL.Add('order by 2');
//  DM.qrZakazP.SQL.SaveToFile('C:\ZakazP.txt');
  DM.qrZakazP.Open;
 end;

procedure TViewZakazPriceF.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TViewZakazPriceF.ComboBox2Change(Sender:TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    dtStart.Date:=D1;
    dtEnd.Date:=D31;
   end;
 end;

procedure TViewZakazPriceF.BitBtn2Click(Sender: TObject);
 begin
  ShowDates;
 end;

procedure TViewZakazPriceF.dsDateDataChange(Sender: TObject; Field: TField);
 begin
  ShowZakazPrice;
 end;

end.
