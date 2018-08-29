unit ChMonthU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons,Util, DateUtils;

type
  TChMonthF = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private

  public

    Flag:Byte;

  end;

var ChMonthF:TChMonthF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TChMonthF.FormCreate(Sender: TObject);
var i:Integer;
 begin
  Caption:=MFC;
  Flag:=0;
{  ComboBox1.Items.Add('Реестр срокового товара №1 ('+FormatDateTime('mmmm',EndOfTheMonth(Date)+1)+' '+FormatDateTime('yyyy',EndOfTheMonth(Date)+1)+')');
  ComboBox1.Items.Add('Реестр срокового товара №2 ('+FormatDateTime('mmmm',EndOfTheMonth(EndOfTheMonth(Date)+1)+1)+' '+FormatDateTime('yyyy',EndOfTheMonth(EndOfTheMonth(Date)+1)+1)+')');
  ComboBox1.Items.Add('Реестр срокового товара №3 ('+FormatDateTime('mmmm',EndOfTheMonth(EndOfTheMonth(EndOfTheMonth(Date)+1)+1)+1)+' '+FormatDateTime('yyyy',EndOfTheMonth(EndOfTheMonth(EndOfTheMonth(Date)+1)+1)+1)+')');
}
  DM.Qr.Close;
  DM.Qr.SQL.Clear;
  DM.Qr.SQL.Add('declare @t table(dt datetime)                 ');
  DM.Qr.SQL.Add('declare @dt datetime, @i int                  ');
  DM.Qr.SQL.Add('set @dt=(select Value from Spr_Const where Descr=''DtStartSrok'') ');
  DM.Qr.SQL.Add('set @i=0                                      ');
  DM.Qr.SQL.Add('while @i<12                                   ');
  DM.Qr.SQL.Add(' begin                                        ');
  DM.Qr.SQL.Add('  insert into @t values(DateAdd(m,@i,@dt))    ');
  DM.Qr.SQL.Add('  set @i=@i+1                                 ');
  DM.Qr.SQL.Add(' end                                          ');
  DM.Qr.SQL.Add('select t.dt,(case IsNull(Closed,0) when 0 then '''' when 1 then ''Список сформирован'' else ''Возврат сделан'' end) as Descr ');
  DM.Qr.SQL.Add('from @t t left join (select dtsrok,Closed from ScanNakl where Flag=3 group by dtsrok,Closed) s on t.dt=s.dtsrok order by 1 ');
//  DM.Qr.SQL.SaveToFile('C:\Reestr.txt');
  DM.Qr.Open;
  ComboBox1.Clear;

  for i:=1 to DM.Qr.RecordCount do
   begin
    if i=1 then DM.Qr.First else DM.Qr.Next;
    ComboBox1.Items.Add('Реестр срокового товара №'+IntToStr(i)+' ('+FormatDateTime('mmmm',DM.Qr.FieldByName('dt').AsDateTime)+' '+FormatDateTime('yyyy',DM.Qr.FieldByName('dt').AsDateTime)+') '+DM.Qr.FieldByName('Descr').AsString);
   end;
  ComboBox1.ItemIndex:=-1;
 end;

procedure TChMonthF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TChMonthF.BitBtn1Click(Sender: TObject);
 begin
  if ComboBox1.Text='' then
   begin
    MainF.MessBox('Выберите реестр!');
   end else begin
             Flag:=1;
             Close;
            end; 
 end;

end.
