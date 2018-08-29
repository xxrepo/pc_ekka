unit Utake_product;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids;

type
  TFTake_product = class(TForm)
    ed_chek_number: TEdit;
    lbl_chek_number: TLabel;
    btn_select_chek: TButton;
    DBG_chek: TDBGrid;
    DS_chek: TDataSource;
    ADOQ_chek: TADOQuery;
    DBG_products: TDBGrid;
    ADOQ_products: TADOQuery;
    DS_products: TDataSource;
    btn_select_product: TButton;
    btn_Cancel: TButton;
    procedure btn_select_chekClick(Sender: TObject);
    procedure ed_chek_numberKeyPress(Sender: TObject; var Key: Char);
    procedure DBG_chekCellClick(Column: TColumn);
    procedure btn_select_productClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    product_name:string;
    art_code:Integer;
  end;

var
  FTake_product: TFTake_product;

implementation

{$R *.dfm}

procedure TFTake_product.btn_select_chekClick(Sender: TObject);
begin
    with ADOQ_chek do
    begin
        Close;
        SQL.Clear;
        SQL.Add('select NUMB_CHEK,kassa_num,date_chek from apteka_net..ARHCHEKS with(nolock)');
        SQL.Add('where NUMB_CHEK=:PNChek');
        SQL.Add('group by NUMB_CHEK,kassa_num,date_chek');
        parameters.ParamByName('PNChek').Value:=StrToInt(trim(ed_chek_number.Text));
        Open;
    end;

end;

procedure TFTake_product.DBG_chekCellClick(Column: TColumn);
begin//
    with ADOQ_products do
    begin
        Close;
        SQL.Clear;
        SQL.Add('select tov.art_code,tov.names ');
        SQL.Add('from apteka_net..ARHCHEKS ch with(nolock)');
        SQL.Add('left join apteka_net..sprtov tov with(nolock) on ch.kod_name=tov.kod_name');
        SQL.Add('where (NUMB_CHEK=:PNChek)and(kassa_num=:PKassa_num)and(datepart(DAY,date_chek)=datepart(DAY,:PDate_chek))');

        Parameters.ParamByName('PNChek').Value:=ADOQ_chek.FieldByName('NUMB_CHEK').AsInteger;
        Parameters.ParamByName('PKassa_num').Value:=ADOQ_chek.FieldByName('Kassa_num').AsInteger;
        Parameters.ParamByName('Pdate_chek').Value:=ADOQ_chek.FieldByName('date_chek').AsDateTime;
        Open;
    end;
end;


procedure TFTake_product.ed_chek_numberKeyPress(Sender: TObject;
  var Key: Char);
 var
  s, s1: string;
  i: integer;
  ttt : set of char;
begin
   ttt := ['1','2','3','4','5','6','7','8','9','0'];

    try
// If key = ',' then key := '.';
    If  (key <> char(8)) then
    begin
        if key=#13 then btn_select_chekClick(Sender);
        if not(key in ttt) then
            key := char(nil);
        end;
        except
            ShowMessage('Не привильный формат ввода');
    end;
end;


procedure TFTake_product.btn_select_productClick(Sender: TObject);
begin
    //сохраняем выбор
    if ADOQ_products.Active and (ADOQ_products.RecordCount<>0) then
    begin
        product_name:=ADOQ_products.FieldByName('names').AsString;
        art_code:=ADOQ_products.FieldByName('art_code').AsInteger;
        FTake_product.Close;
    end
    else
    begin
        ShowMessage('Нет чека');
    end;
end;

procedure TFTake_product.btn_CancelClick(Sender: TObject);
begin
    //выходим без сохранения
    product_name:='';
    FTake_product.Close;
end;

end.
