unit KoefU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, DBCtrls;

type
  TKoefF = class(TForm)
    DBGrid1: TDBGrid;
    k_spr1: TADOQuery;
    ds1: TDataSource;
    Label1: TLabel;
    DBGrid2: TDBGrid;
    k_spr2: TADOQuery;
    ds2: TDataSource;
    ds4: TDataSource;
    DBGrid3: TDBGrid;
    k_spr4: TADOQuery;
    DBGrid4: TDBGrid;
    k_spr5: TADOQuery;
    ds5: TDataSource;
    DBGrid5: TDBGrid;
    k_spr7: TADOQuery;
    ds7: TDataSource;
    DBGrid6: TDBGrid;
    k_spr3: TADOQuery;
    ds3: TDataSource;
    DBGrid7: TDBGrid;
    k_spr6: TADOQuery;
    ds6: TDataSource;
    Label2: TLabel;
    DBText1: TDBText;
    k_spr8: TADOQuery;
    ds8: TDataSource;

    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var KoefF:TKoefF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TKoefF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  k_spr1.Close; k_spr1.Open;
  k_spr2.Close; k_spr2.Open;
  k_spr3.Close; k_spr3.Open;
  k_spr4.Close; k_spr4.Open;
  k_spr5.Close; k_spr5.Open;
  k_spr6.Close; k_spr6.Open;
  k_spr7.Close; k_spr7.Open;
  k_spr8.Close; k_spr8.Open;
 end;

end.
