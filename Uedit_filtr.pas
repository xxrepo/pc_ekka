unit Uedit_filtr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ComCtrls;

type
  TFedit_filter = class(TForm)
    DS_edit_filtr: TDataSource;
    DBG_filtr: TDBGrid;
    ADOQ_edit_filtr: TADOQuery;
    procedure DBG_filtrDblClick(Sender: TObject);
    procedure cancel_filtr();
    procedure DBG_filtrKeyPress(Sender: TObject; var Key: Char);
    procedure DBG_filtrColEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    curr_seek:string;

    function apostrophe_adaptation(curr_str:string):string;

  public
    { Public declarations }
    filter_name:string;  //название поля для возврата
    filter_result:string;//возвращаемое значение
    filter_status:integer;  //статус фильтра (применен - 0(Enter), отменен - 1(Esc))
    curr_field:string;  //текущее поле для ввода

    search_type:integer;    //тип поиска (0-поиск, 1 фильтр) по умолчанию 0(присваисается при создании формы)
    edit_records:integer;   //редактирование записей
  end;

var
  Fedit_filter: TFedit_filter;

implementation

{$R *.dfm}

function TFedit_filter.apostrophe_adaptation(curr_str:string):string;
var
    tmp_str,new_str:string;
    i,j:integer;
    str_length:integer;
begin//
    //обработка апострофов в укр названиях :(
    //--------------------------------------------------
    tmp_str:=curr_str;
    new_str:='';
    j:=1;
    str_length:=Length(tmp_str);
    for i:=1 to str_length do
    begin
        if tmp_str[i]=#39 then//если апостроф, то удваиваем его в строке
        begin
            new_str:=new_str+copy(tmp_str,j,i-j+1)+#39;
            j:=i+1;
        end
    end;
    apostrophe_adaptation:=new_str+copy(tmp_str,j,i-j+1);
    //--------------------------------------------------
end;

procedure TFedit_filter.DBG_filtrDblClick(Sender: TObject);
begin//выбран пункт
    filter_result:=ADOQ_edit_filtr.FieldByName(filter_name).AsString;
    filter_status:=0;   //применен
    Fedit_filter.Close;
end;

procedure TFedit_filter.cancel_filtr();
begin//
    filter_result:='';
    filter_status:=1;   //отменен
    Fedit_filter.Close;
end;

procedure TFedit_filter.DBG_filtrKeyPress(Sender: TObject; var Key: Char);
var
    filtr, add: string;
    new_str:string;
begin//поиск
    if((key = char(8))) or ((key = char(9)))then//если backspace, TAB
    begin
        curr_seek:='';
        ADOQ_edit_filtr.Filtered:=false;
        exit;
    end
    else if (key = char(13)) then  //Enter
    begin
        DBG_filtrDblClick(Sender);
        exit;
    end
    else if (key = char($1B)) then// Esc
    begin
        cancel_filtr();
    end;

    if search_type=0 then   //если поиск
    begin
//        if ((Key in ['A'..'z'])or(Key in ['А'..'я'])) then

        //art_code типа Numeric(10,0) , а не int. Если в этот тип вводить буквы при поиске то возникает ошибка
        if (DBG_filtr.SelectedField.DataType=ftBCD)
            or(DBG_filtr.SelectedField.DataType=ftInteger)
            or(DBG_filtr.SelectedField.DataType=ftLargeint)then
        begin
            if Key in ['0'..'9'] then
            begin
                curr_seek:=curr_seek+Key;
                ADOQ_edit_filtr.Locate(curr_field{DBG_filtr.Columns[0].Field.FIeldName},curr_seek,[loPartialKey]);
            end;
        end
        else
        begin
            curr_seek:=curr_seek+Key;
            ADOQ_edit_filtr.Locate(curr_field{DBG_filtr.Columns[0].Field.FIeldName},curr_seek,[loPartialKey]);
        end;
    end
    else if search_type=1 then   //если фильтр
    begin
        with ADOQ_edit_filtr do
        begin
            filtered:=false;
            filtr:='';

            if (DBG_filtr.SelectedField.DataType=ftBCD)
                or(DBG_filtr.SelectedField.DataType=ftInteger)
                or(DBG_filtr.SelectedField.DataType=ftLargeint)then
            begin
                if Key in ['0'..'9'] then
                begin
                    curr_seek:=curr_seek+Key;
                    new_str:=curr_seek;
                    filtr:=filtr + add + curr_field + ' = '+new_str;
                end;
            end
            else
            begin
                if length(filtr) > 0 then add:= ' and ' else add:='';
                curr_seek:=curr_seek+Key;
                new_str:=apostrophe_adaptation(curr_seek);
                filtr:=filtr + add + curr_field + ' like '+#39+'%'+new_str+'%'+#39;
            end;

            if length(filtr) > 0 then
            begin
                Filter:= filtr;
                filtered:=true;
            end;
        end;//with
    end;//if
end;

procedure TFedit_filter.DBG_filtrColEnter(Sender: TObject);
begin
    curr_field:=DBG_filtr.SelectedField.FieldName;
    curr_seek:='';
end;

procedure TFedit_filter.FormCreate(Sender: TObject);
begin//
    search_type:=0; //по умолчанию поиск
    edit_records:=0;    //по умолчанию не редактируем записи
    filter_status:=1;   //статус фильтра по умолчанию - отменен
end;

procedure TFedit_filter.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
{    if edit_records=1 then
    begin
        if Msg.CharCode=VK_F4 then
            ShowMessage('Проба F4')
        else if Msg.CharCode=VK_INSERT then
            ShowMessage('Проба Ins');

    end;//if
}    
end;

procedure TFedit_filter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin//
    if filter_status=1 then
        filter_result:='';
end;

end.
