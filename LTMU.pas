unit LTMU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  TLTMF = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    BitBtn2: TBitBtn;

    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);

  private

    procedure FilterSpis;

  public

  end;

var LTMF:TLTMF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TLTMF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  FilterSpis;
 end;

procedure TLTMF.FilterSpis;
var AC:Integer;
 begin
  try
   AC:=-1;
   if DM.qrMinus.Active then AC:=DM.qrMinus.FieldByName('Art_code').AsInteger;
   DM.qrMinus.Close;
   DM.qrMinus.SQL.Clear;
   DM.qrMinus.SQL.Add('if Object_ID(N''tempdb..#tmp_z'') is not null drop table #tmp_z ');
   DM.qrMinus.SQL.Add('select art_code,names,Sum(ostat) as ostat,cena ');
   DM.qrMinus.SQL.Add('from SprTov ');
   DM.qrMinus.SQL.Add('where ostat<0 group by art_code,names,cena order by names ');
   DM.qrMinus.Open;
   DM.qrMinus.Locate('Art_code',AC,[]);
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику товаров: '+E.Message);
  end;
 end;

procedure TLTMF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

end.
