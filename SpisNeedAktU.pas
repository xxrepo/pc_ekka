unit SpisNeedAktU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Util, PrintReport;

type
  TSpisNeedAktF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    BitBtn6: TBitBtn;
    CheckBox1: TCheckBox;
    pnSearch: TLabel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure ShowSpis;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SpisNeedAktF: TSpisNeedAktF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TSpisNeedAktF.FormCreate(Sender: TObject);
 begin
  pnSearch.Caption:='';
  Caption:=MFC;
  ShowSpis;
 end;

procedure TSpisNeedAktF.ShowSpis;
 begin
  try
   DM.qrSpisNA.Close;
   DM.qrSpisNA.SQL.Clear;
   DM.qrSpisNA.SQL.Add('select * ');
   DM.qrSpisNA.SQL.Add('from SpisNeedAkt ');
   if CheckBox1.Checked=False then
    DM.qrSpisNA.SQL.Add('where (id not in (19,20)) ');
   DM.qrSpisNA.SQL.Add('order by names ');
   DM.qrSpisNA.Open;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования списка: '+E.Message);
  end;
 end;

procedure TSpisNeedAktF.BitBtn6Click(Sender: TObject);
 begin
  Close;
 end;

procedure TSpisNeedAktF.CheckBox1Click(Sender: TObject);
 begin
  ShowSpis;
 end;

procedure TSpisNeedAktF.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var S:String;
    Ind:Integer;
    IsFind:Boolean;

 begin
  if Sender=Nil then Exit;
  S:=pnSearch.Caption;
  Ind:=TDBGrid(Sender).SelectedIndex;
  if Ind>1 then Ind:=1;
  MainF.dbGKeyPress(TDBGrid(Sender),Key,S,Ind,SC_FIND,1,IsFind);
  pnSearch.Caption:=S;
 end;

procedure TSpisNeedAktF.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key in K_ARROW_KEYS then pnSearch.Caption:='';
 end;

procedure TSpisNeedAktF.BitBtn1Click(Sender: TObject);
var fList:String;
    i:Integer;
 begin
  try
   fList:='';
   for i:=0 to DBGrid1.Columns.Count-1 do
    begin
     fList:=fList+DBGrid1.Columns[i].FieldName+' as ['+
                  DBGrid1.Columns[i].Title.Caption+'_S_'+
                  IntToStr(DBGrid1.Columns[i].Width*100)+'],';
    end;
   DM.Qr.Close;
   DM.Qr.SQL.Clear;

   DM.Qr.SQL.Add('select '+Copy(fList,1,Length(fList)-1));
   DM.Qr.SQL.Add('from SpisNeedAkt ');

   if CheckBox1.Checked=False then
    DM.Qr.SQL.Add('where (id not in (19,20)) ');

   DM.Qr.SQL.Add('order by names ');
   DM.Qr.Open;

   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Name:='Arial';
   PrintRep.Align:=AL_CENTER;
   PrintRep.AddText('Отчет по непереданным позициям по возвратам'#10#10);
   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Size:=4;
   PrintRep.Qr:=DM.Qr;
   PrintRep.PrintTable(False,0,0);
   PrintRep.PreView;

  except
   on E:Exception do MainF.MessBox('Ошибка формирования печатной формы: '+E.Message);
  end;

 end;

end.
