unit Un_to_chek;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB, ComCtrls, ExtCtrls, MainU;

type
  TFn_to_chek = class(TForm)
    ADOQuery_nakl: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DTP_nakl: TDateTimePicker;
    btn_nakl: TButton;
    ADOQuery_test_tov: TADOQuery;
    ADOSP_add_to_chek: TADOStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DTP_naklChange(Sender: TObject);
    procedure btn_naklClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    curr_dt:TDateTime;
  end;

var
  Fn_to_chek: TFn_to_chek;

implementation

uses DataModuleU;

{$R *.dfm}

procedure TFn_to_chek.FormCreate(Sender: TObject);
begin
    ADOQuery_nakl.Connection:=DM.ADOCo;
    ADOQuery_test_tov.Connection:=DM.ADOCo;
    ADOSP_add_to_chek.Connection:=DM.ADOCo;
    DTP_nakl.Date:=Date;
    DTP_nakl.Time:=EncodeTime(0,0,0,0);
end;

procedure TFn_to_chek.DBGrid1DblClick(Sender: TObject);
var
    no_tovar:TStringList;//Список товаров, которых в наличии не хватает для данной накладной
begin//
    if not ADOQuery_nakl.Active then
    begin
        Exit;
    end;
    if ADOQuery_nakl.RecordCount=0 then
    begin
        Exit;
    end;

    no_tovar:=TStringList.Create();
    curr_dt:=DTP_nakl.Date;

    with ADOQuery_test_tov do
    begin
        Close;
        SQL.Clear;
        SQL.Add('select jm.IDDOC, jm.NN_NAKL, jm.SUMMA, jm.TYPE_NAKL, jm.TIME_NAKL, rt.KOD_NAME, rt.KOL, rt.CENA, rt.ID_USER,tov.ART_CODE, tov.NAMES,tov.TYPE_TOV, tov.CENA, tov.F_NDS, tov.ART_NAME,rt.CenaZakup,tov.OSTAT');
        SQL.Add('from JMOVES jm with(nolock)');
        SQL.Add('	left join rTovar rt with(nolock) on jm.IDDOC=rt.IDDOC');
        SQL.Add('	left join SPRTOV tov with(nolock) on rt.KOD_NAME=tov.KOD_NAME');
        SQL.Add('where (jm.date_nakl=:pdt) and (TYPE_NAKL=1) and (rt.KOD_NAME is not null)');
        SQL.Add('	and jm.IDDOC=:p_iddoc');
        SQL.Add('order by jm.IDDOC, rt.KOD_NAME');
        parameters.ParamByName('pdt').Value:=curr_dt;
        parameters.ParamByName('p_iddoc').Value:=ADOQuery_nakl.FieldByName('iddoc').asInteger;

        Open;

        if RecordCount=0 then
        begin
            ShowMessage('Для данной накладной нет товаров');
            Exit;
        end;

        First;
        while not Eof do
        begin
            if FieldByName('kol').asInteger > FieldByName('OSTAT').asInteger then
                no_tovar.Add(FieldByName('art_code').AsString+' - '+FieldByName('Names').AsString+' Нужно:'+FieldByName('kol').asString+' Есть:'+FieldByName('OSTAT').asString);
            next;
        end;
        if no_tovar.Count>0 then
        begin
            ShowMessage('Недостаточно следующих товаров: '+#13+#10+no_tovar.Text);
            Exit;
        end;
    end;//with

    with ADOSP_add_to_chek do
    begin
        Close;
        ProcedureName:='spY_add_nakl_to_chek';
        Parameters.Clear;
        Parameters.CreateParameter('@dt',ftDateTime,pdInput,20,curr_dt);
        Parameters.CreateParameter('@iddoc',ftInteger,pdInput,20,ADOQuery_nakl.FieldByName('iddoc').asInteger);
        Parameters.CreateParameter('@id_user',ftInteger,pdInput,20,Prm.UserID);
        ExecProc;
    end;//with
    MainF.TypeChek:=TC_NAKL;
    MainF.OpenChek; //открытие чека
    Fn_to_chek.Close;

end;

procedure TFn_to_chek.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key=VK_Return then
    begin
        DBGrid1DblClick(Sender);
    end;
end;

procedure TFn_to_chek.DTP_naklChange(Sender: TObject);
begin
    curr_dt:=DTP_nakl.Date;
    with ADOQuery_nakl do
    begin
        Close;
        SQL.Clear;
        SQL.Add('');

        SQL.Add('select jm.iddoc, jm.NN_NAKL');
        SQL.Add('from JMOVES jm with(nolock)');
        SQL.Add('	left join rTovar rt with(nolock) on jm.IDDOC=rt.IDDOC');
        SQL.Add('where jm.DATE_NAKL=:pdt and jm.TYPE_NAKL=1 and (rt.KOD_NAME is not null)');
        SQL.Add('group by jm.iddoc, jm.NN_NAKL');
        SQL.Add('order by jm.NN_NAKL');

        parameters.ParamByName('pdt').Value:=DTP_nakl.Date;
        Open;
    end;

end;

procedure TFn_to_chek.btn_naklClick(Sender: TObject);
 begin
  DBGrid1DblClick(Sender);
 end;

end.
