unit PrintObnovU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, ComCtrls;

type
  TPrintObnovF = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    dtDate: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private

    procedure MakeSpis;

  public

  end;

var PrintObnovF: TPrintObnovF;

implementation

uses DataModuleU, MainU;

{$R *.dfm}

procedure TPrintObnovF.MakeSpis;
 begin
  try
   DM.qrSpisObnov.Close;
   DM.qrSpisObnov.SQL.Clear;
   DM.qrSpisObnov.SQL.Add('if Object_ID(N''tempdb..#tmparto'') is not null drop table #tmparto            ');
   DM.qrSpisObnov.SQL.Add('                                                                               ');
   DM.qrSpisObnov.SQL.Add('select art_code,f_nds,convert(smallint,0) as gr                                ');
   DM.qrSpisObnov.SQL.Add('into #tmparto                                                                  ');
   DM.qrSpisObnov.SQL.Add('from SprTov                                                                    ');
   DM.qrSpisObnov.SQL.Add('group by art_code,f_nds                                                        ');
   DM.qrSpisObnov.SQL.Add('                                                                               ');
   DM.qrSpisObnov.SQL.Add('update #tmparto set gr=1 where art_code in (select art_code from SprNoRecipt)  ');
   DM.qrSpisObnov.SQL.Add('                                                                               ');
   DM.qrSpisObnov.SQL.Add('update #tmparto set gr=b.gr                                                    ');
   DM.qrSpisObnov.SQL.Add('from #tmparto a, SprSpecTov b                                                  ');
   DM.qrSpisObnov.SQL.Add('where a.art_code=b.art_code                                                    ');
   DM.qrSpisObnov.SQL.Add('                                                                               ');
   DM.qrSpisObnov.SQL.Add('select b.Descr+'' ''+c.Descr as Descr,a.f_nds,a.gr                             ');
   DM.qrSpisObnov.SQL.Add('from #tmparto a, SprNds b, SprObnovGr c                                        ');
   DM.qrSpisObnov.SQL.Add('where a.gr=c.gr and a.f_nds=b.f_nds                                            ');
   DM.qrSpisObnov.SQL.Add('group by b.Descr+'' ''+c.Descr,a.f_nds,a.gr                                    ');
   DM.qrSpisObnov.SQL.Add('order by 1                                                                     ');
   DM.qrSpisObnov.Open;

  except
   on E:Exception do MainF.MessBox('Ошибка формирования списка обновленок! '+E.Message);
  end;
 end;

procedure TPrintObnovF.FormCreate(Sender:TObject);
 begin
  dtDate.Date:=Date;
  Caption:=MFC;
  MakeSpis;
 end;

procedure TPrintObnovF.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TPrintObnovF.BitBtn2Click(Sender: TObject);
 begin
  MainF.PrintObnov(DM.qrSpisObnov.FieldByName('f_nds').AsInteger,DM.qrSpisObnov.FieldByName('gr').AsInteger);
 end;

end.
