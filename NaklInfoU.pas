unit NaklInfoU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, OpenLib, Grids, DBGrids, Buttons;

type
  TNaklInfoF = class(TForm)
    Label1: TLabel;
    imFon: TImage;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Bevel1: TBevel;
    SpeedButton1: TSpeedButton;
    procedure Label1MouseLeave(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private

    FNN_Nakl:String;
    FDate_Nakl:TDateTime;
    FColorFon: TColor;

  public

    property NN_Nakl:String read FNN_Nakl write FNN_Nakl;
    property Date_Nakl:TDateTime read FDate_Nakl write FDate_Nakl;
    property ColorFon:TColor read FColorFon write FColorFon;

  end;

var NaklInfoF:TNaklInfoF;

implementation

uses DataModuleU, MainU;

{$R *.dfm}

procedure TNaklInfoF.Label1MouseLeave(Sender:TObject);
 begin
//  Close;
 end;

procedure TNaklInfoF.FormActivate(Sender: TObject);
 begin
  try
   DBGrid1.Color:=ColorFon;
   DrawRect(imFon,clBtnFace,ColorFon);
   Label2.Caption:='Дата накладной: '+FormatDateTime('dd.mm.yyyy',Date_Nakl);
   DM.qrNaklInfo.Close;
   DM.qrNaklInfo.SQL.Clear;
   DM.qrNaklInfo.SQL.Add('select case IsNull(t.names,'''') when '''' then (select top 1 names from Plist p (nolock) where p.art_code=t.art_code) else t.names end as names ,Sum(Kol) as Kol,Max(Cena) as Cena ');
   DM.qrNaklInfo.SQL.Add('from TmpNakl t (nolock)');
   DM.qrNaklInfo.SQL.Add('where nn_nakl='''+NN_Nakl+''' and ');
   DM.qrNaklInfo.SQL.Add('      date_nakl='''+FormatDateTime('yyyy-mm-dd',Date_Nakl)+' 00:00:00''');
   DM.qrNaklInfo.SQL.Add('group by Names,t.art_code');
   DM.qrNaklInfo.SQL.Add('order by Names');
   DM.qrNaklInfo.Open;
  except
  end;
 end;

procedure TNaklInfoF.SpeedButton1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TNaklInfoF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

end.
