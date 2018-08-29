unit UGarant_remont;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ComCtrls, StdCtrls, PrintReport, DB, ADODB, Grids, DBGrids, Utake_product,
     Buttons;

type
  TCheks=record         //чеки по кассам
    chek:integer;
    kassa:integer;
  end;

  TFGarant_remont = class(TForm)
    btn_make_rep: TButton;
    ADOQ_apteka_info: TADOQuery;
    ed_sn: TEdit;
    lbl_sn: TLabel;
    lbl_prod_date: TLabel;
    DTP_prod_date: TDateTimePicker;
    ed_Name: TEdit;
    lbl_Name: TLabel;
    lbl_Surname: TLabel;
    ed_Surname: TEdit;
    ed_otch: TEdit;
    lbl_Otch: TLabel;
    ed_address: TEdit;
    lbl_address: TLabel;
    lbl_tel: TLabel;
    ed_tel: TEdit;
    lbl_product: TLabel;
    ed_defekt: TEdit;
    lbl_defekt: TLabel;
    lbl_opisanie: TLabel;
    ed_carap: TEdit;
    lbl_carap: TLabel;
    ed_skoly: TEdit;
    lbl_skoly: TLabel;
    ed_displ: TEdit;
    lbl_displ: TLabel;
    ed_sys_roz: TEdit;
    lbl_sys_roz: TLabel;
    ed_korpus: TEdit;
    lbl_korpus: TLabel;
    ed_kompl: TEdit;
    lbl_kompl: TLabel;
    Button1: TButton;
    btm_take_tov: TBitBtn;
    btn_exit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btm_take_tovClick(Sender: TObject);
    procedure btn_make_repClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btn_exitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    product_name:string;
    sell_date:TDateTime;
    numb_chek:integer;

  end;

var FGarant_remont:TFGarant_remont;
    cheks:array of TCheks;

implementation

uses MainU, SimpleMessU;

{$R *.dfm}

procedure TFGarant_remont.FormCreate(Sender: TObject);
var i:integer;
begin
    //

    Button1.Visible:=MainF.Design;

    DTP_prod_date.Date:=Date;

{
    with ADOQ_day_cheks do
    begin
        Close;
        SQL.Add('select numb_chek, KASSA_NUM from apteka_net..ARHCHEKS with(nolock)');
        SQL.Add('where DATE_CHEK between :dt_begin and :dt_end');
        SQL.Add('group by numb_chek, KASSA_NUM');
        SQL.Add('order by KASSA_NUM, NUMB_CHEK');
        parameters.ParamByName('dt_begin').Value:=DTP_chek_date.Date+EncodeTime(0,0,0,0) ;
        parameters.ParamByName('dt_end').Value:=DTP_chek_date.Date+EncodeTime(23,59,59,0);
        Open;

        SetLength(Cheks,RecordCount);

        i:=0;
        while not Eof do
        begin
            CB_chek_numb.Items.Add(FieldByName('numb_chek').AsString+'  Касса: '+FieldByName('KASSA_NUM').AsString);
            Cheks[i].chek:=FieldByName('numb_chek').AsInteger;
            Cheks[i].kassa:=FieldByName('KASSA_NUM').AsInteger;
            inc(i);
            next;
        end;
    end;
}

end;

procedure TFGarant_remont.btm_take_tovClick(Sender: TObject);
begin//вызов формы подбора товара по номеру чека
    FTake_product:=TFTake_product.Create(Self);
    try
        FTake_product.ShowModal;
        if (FTake_product.ADOQ_chek.Active)and(FTake_product.ADOQ_chek.RecordCount<>0) then
        begin
            lbl_product.Caption:=FTake_product.product_name;
            lbl_product.Tag:=FTake_product.art_code;

            product_name:=FTake_product.product_name;
            sell_date:=FTake_product.ADOQ_chek.FieldByName('date_chek').AsDateTime;
            numb_chek:=FTake_product.ADOQ_chek.FieldByName('NUMB_CHEK').AsInteger;
        end;
    finally
        FTake_product.Free;
    end;//try
end;

procedure TFGarant_remont.btn_make_repClick(Sender: TObject);
var
    Tb:TTableObj;
    apteka_name:string;
    apteka_addr:string;
    apteka_firm:string;
    apteka_dir:string;
    apteka_firm_addr:string;

    dash_str:string;
    page_width:integer;
    not_all_fields:boolean;

    symb_count:integer; //количество символов в строке
//    symb_str:WideString;    //строка символов
    symb_str:String;    //строка символов
    curr_str:string;   //текущая строка

    i:integer;
    n_begin:integer;
    n_col:integer;
    curr_width:integer;
    Mes:String;

begin
    //проверки на ввод данных
    not_all_fields:=false;
    if ed_Surname.Text='' then
    begin
        lbl_Surname.Font.Color:=clRed;
        not_all_fields:=true;
    end
    else
        lbl_Surname.Font.Color:=clWindowText;

    if ed_Name.Text='' then
    begin
        lbl_Name.Font.Color:=clRed;
        not_all_fields:=true;
    end
    else
        lbl_Name.Font.Color:=clWindowText;

    if ed_Otch.Text='' then
    begin
        lbl_Otch.Font.Color:=clRed;
        not_all_fields:=true;
    end
    else
        lbl_Otch.Font.Color:=clWindowText;

    if ed_address.Text='' then
    begin
        lbl_address.Font.Color:=clRed;
        not_all_fields:=true;
    end
    else
        lbl_address.Font.Color:=clWindowText;

    if ed_tel.Text='' then
    begin
        lbl_tel.Font.Color:=clRed;
        not_all_fields:=true;
    end
    else
        lbl_tel.Font.Color:=clWindowText;

    if ed_sn.Text='' then
    begin
        lbl_sn.Font.Color:=clRed;
        not_all_fields:=true;
    end
    else
        lbl_sn.Font.Color:=clWindowText;

    if ed_defekt.Text='' then
    begin
        lbl_defekt.Font.Color:=clRed;
        not_all_fields:=true;
    end
    else
        lbl_defekt.Font.Color:=clWindowText;

    if ed_carap.Text='' then
    begin
        lbl_carap.Font.Color:=clRed;
        not_all_fields:=true;
    end
    else
        lbl_carap.Font.Color:=clWindowText;

    if ed_skoly.Text='' then
    begin
        lbl_skoly.Font.Color:=clRed;
        not_all_fields:=true;
    end
    else
        lbl_skoly.Font.Color:=clWindowText;

    if ed_displ.Text='' then
    begin
        lbl_displ.Font.Color:=clRed;
        not_all_fields:=true;
    end
    else
        lbl_displ.Font.Color:=clWindowText;

    if ed_sys_roz.Text='' then
    begin
        lbl_sys_roz.Font.Color:=clRed;
        not_all_fields:=true;
    end
    else
        lbl_sys_roz.Font.Color:=clWindowText;

    if ed_korpus.Text='' then
    begin
        lbl_korpus.Font.Color:=clRed;
        not_all_fields:=true;
    end
    else
        lbl_korpus.Font.Color:=clWindowText;

    if ed_kompl.Text='' then
    begin
        lbl_kompl.Font.Color:=clRed;
        not_all_fields:=true;
    end
    else
        lbl_kompl.Font.Color:=clWindowText;

    //проверка на выбор продукта
    if lbl_product.Caption='' then
    begin
        btm_take_tov.Font.Color:=clRed;
        not_all_fields:=true;
    end
    else
        btm_take_tov.Font.Color:=clWindowText;

    if not_all_fields then
    begin
        ShowMessage('Все поля должны быть заполнены');
        exit;
    end;

    //выбираем необходимые данные
    with ADOQ_apteka_info do
    begin
        //название аптеки
        Close;
        SQL.Clear;
        SQL.Add('select descr, value from apteka_net..SPR_CONST with(nolock)');
        SQL.Add('where descr=''AptekaName''');
        Open;
        apteka_name:=FieldByName('value').AsString;
        //адрес аптеки
        Close;
        SQL.Clear;
        SQL.Add('select descr, value from apteka_net..SPR_CONST with(nolock)');
        SQL.Add('where descr=''eStr1''');
        Open;
        apteka_addr:=FieldByName('value').AsString;
        //фирма
        Close;
        SQL.Clear;
        SQL.Add('select f.DescrUA,f.Boss,f.SkladAdress from apteka_net..SPR_CONST c with(nolock)');
        SQL.Add('	inner join apteka_net..SPRFIRMS f with(nolock) on cast(c.Value as int)=f.ID_FIRM');
        SQL.Add('where descr=''FirmID''');
        Open;
        apteka_firm:=FieldByName('DescrUA').AsString;
        apteka_dir:=FieldByName('Boss').AsString;
        apteka_firm_addr:=FieldByName('SkladAdress').AsString;
    end;

    //создание заявления
    PrintRep.Clear;
    PrintRep.SetDefault;
    PrintRep.Font.Name:='Arial'; PrintRep.Font.Size:=3; PrintRep.Font.Style:=[];
    PrintRep.Orientation:=O_PORTR; PrintRep.PageSize:=PF_A4; PrintRep.Align:=AL_LEFT;
    PrintRep.Indent:=0;

    PrintRep.AddText('Складається в 3-х примірниках (один прикриплюєтся до товару,'+#10);
    PrintRep.AddText('другий зберигаєтся в на аптеці протягом 4-х тижнів,'+#10);
    PrintRep.AddText('третій передається на склад)'+#10);
    PrintRep.AddText('на одну одиницю товару, складаєтся тільки один акт.'+#10);

    PrintRep.AddText(#10);
    PrintRep.AddText(#10);

    PrintRep.Font.Size:=5;
    PrintRep.AddText('Додаток №2'+#10);
    PrintRep.Font.Size:=9;
    PrintRep.AddText('ГАРАНТІЙНИЙ РЕМОНТ'+#10);
    PrintRep.Font.Size:=6;
    PrintRep.AddText('КАРТА РЕМОНТУ №___'+#10);

    PrintRep.Font.Size:=3;

    PrintRep.AddText(#10);
    PrintRep.AddText(#10);

    PrintRep.AddTable(2,6);
    tb:=PrintRep.LastTable;

    Tb.SetBorders(1,1,2,6,EMPTY_BORDER);
//    Tb.SetWidths('1000,1000');
    Tb.Cell[1,1].Align:=AL_LEFT;
    Tb.Cell[1,1].AddText('Аптека, що знаходиться за адресою:');
    Tb.Cell[1,2].AddText(apteka_addr);
    Tb.Cell[1,3].AddText('Дата: '+FormatDateTime('dd.mm.yyyy', Date()));

    Tb.Cell[2,1].Align:=AL_RIGHT;
    Tb.Cell[2,1].AddText('Директору '+apteka_firm);
    Tb.Cell[2,2].Align:=AL_RIGHT;
    Tb.Cell[2,2].AddText(apteka_dir);
    Tb.Cell[2,3].Align:=AL_RIGHT;
    Tb.Cell[2,3].AddText(apteka_firm_addr);
    Tb.Cell[2,4].Align:=AL_RIGHT;
    Tb.Cell[2,4].AddText(ed_Surname.Text+' '+ed_Name.Text+' '+ed_otch.Text);
    Tb.Cell[2,5].Align:=AL_RIGHT;
    Tb.Cell[2,5].AddText('т.'+ed_tel.Text+'  '+ed_address.Text);

    PrintRep.AddText(#10);
    PrintRep.AddText(#10);

    PrintRep.Font.Size:=6;
    PrintRep.Align:=AL_CENTER;
    PrintRep.AddText('З А Я В А'+#10);
    PrintRep.AddText(#10);

    PrintRep.Font.Size:=3;
    PrintRep.Align:=AL_LEFT;
    PrintRep.Indent:=0;
    PrintRep.LeftMargin:=120;

    PrintRep.AddText('Прошу передати до сервісного центру для проведення діагностики та обслуговування '+#10);
    PrintRep.Font.Style:=[];
    PrintRep.Font.Size:=2;
    PrintRep.AddText('(згідно з частиною 1 статті 8 Закону України "Про звхист прав споживачів") ');

    PrintRep.Font.Size:=3;
    PrintRep.AddText(#10);

    curr_str:=product_name+' , '+ed_sn.Text+' , '+FormatDateTime('dd.mm.yyyy', DTP_prod_date.Date);
    symb_str:='';

    curr_str:='очень длинная строка, чтоб ей пусто было, Im not sure theres a simply way to do what you wish. You can convert a Word into a WideChar with a simple cast but you cannot concatenate WideChar. So this is a compiler error';

    page_width:=round(210*10)-PrintRep.LeftMargin-PrintRep.RightMargin;

{    n_begin:=1;
    i:=1;
    n_col:=i;
    while i<=Length(curr_str) do
    begin
        curr_width:= TextWidth(copy(curr_str,n_begin,n_col),PrintRep.Font);
        if (page_width-7)<curr_width then
        begin
            //вывод
            PrintRep.AddText(copy(curr_str,n_begin,n_col)+#10);
            PrintRep.AddText(symb_str+#10);
            symb_str:='';
            n_begin:=n_col+1;
            n_col:=1;
        end;
        curr_width:= TextWidth(symb_str,PrintRep.Font);
        if (page_width-7)>curr_width then
            symb_str:=symb_str+'_';

        n_col:=n_col+1;
        inc(i);
    end;
    PrintRep.AddText(copy(curr_str,n_begin,n_col)+#10);
    PrintRep.AddText(symb_str+#10);
}
//    symb_count:=Length(curr_str);
//    for i:=1 to symb_count-1 do
//        symb_str:=symb_str+'_';

//    PrintRep.Font.Name:='Lucida Console';
    PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(product_name+' , '+ed_sn.Text+' , '+FormatDateTime('dd.mm.yyyy', DTP_prod_date.Date)+#10);
//    PrintRep.Font.Name:='Arial';
//    PrintRep.AddText(curr_str+#10);
//    PrintRep.AddText(symb_str+#10);
    PrintRep.Font.Style:=[];
    PrintRep.Align:=AL_CENTER;
    PrintRep.Font.Size:=2;
    PrintRep.AddText('(найменування товару, заводській номер, дата виготовлення)');
    PrintRep.Font.Size:=3;
    PrintRep.Align:=AL_LEFT;

    PrintRep.Font.Style:=[];
    PrintRep.AddText(#10);

    PrintRep.AddText('придбаного ');
    PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(FormatDateTime('dd.mm.yyyy', sell_date));
    PrintRep.Font.Style:=[];
    PrintRep.AddText('  № чеку ');
    PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(IntToStr(numb_chek));
    PrintRep.Font.Style:=[];
    PrintRep.AddText('  в аптеці № ');
    PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(apteka_name);
//    PrintRep.Font.Style:=[];
//    PrintRep.AddText('  у місті ');
//    PrintRep.Font.Style:=[fsUnderline];
//    PrintRep.AddText('');
    PrintRep.Font.Style:=[];
    PrintRep.AddText('  за адресою ');
    PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(apteka_addr);

    PrintRep.AddText(#10);
    PrintRep.Font.Style:=[];
    PrintRep.AddText('У зв''язку з (характер недоліків, дефект) ');
    PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(ed_defekt.Text);
    PrintRep.Font.Style:=[];
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);    
    PrintRep.AddText('До заяви додається орігінал гарантійного талону виробника та оригінал квитанції, товарного чи касового чека або інший документ, що засвідчує факт купівлі(необхідне підкреслити).'+#10);
    PrintRep.AddText(#10);
    PrintRep.AddText('Споживачу роз''яснені його прова відповідно до законодавства при виявленні в товарі недоліку, який не є істотним. В цому випадку товар приймаєтся і передаєтся в СЦ для усунення недоліку.');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);
    PrintRep.AddText('При прийомі апарату узгоджено, що в разі можливої затримки із поставкою запасних частин, строк усунення недолілу може перевищувати 14 днів, але складати не більше 45 днів');
    PrintRep.AddText(' (у відповідності до п.9ст.8,ч.1 ст.15 Закону України(Про захист прав споживачів)). Термін на транспортування - 14 днів.');
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);

    PrintRep.AddTable(2,2);
    tb:=PrintRep.LastTable;

    Tb.SetBorders(1,1,2,2,EMPTY_BORDER);
//    Tb.SetWidths('1000,1000');
    Tb.Cell[1,1].Align:=AL_LEFT;
    Tb.Cell[1,1].Font.Style:=[fsUnderline];
    Tb.Cell[1,1].AddText(FormatDateTime('dd.mm.yyyy', Date()));

    Tb.Cell[2,1].Align:=AL_RIGHT;
    Tb.Cell[2,1].Font.Style:=[fsUnderline];
    Tb.Cell[2,1].AddText('__________________________');

    Tb.Cell[1,2].Align:=AL_LEFT;
    Tb.Cell[1,2].Font.Style:=[];
    Tb.Cell[1,2].AddText('    (дата)');

    Tb.Cell[2,2].Align:=AL_RIGHT;
    Tb.Cell[2,2].Font.Style:=[];
    Tb.Cell[2,2].AddText('(підпис Споживача)      ');

    PrintRep.AddText(#10);
    PrintRep.AddText(#10);
    
    PrintRep.Font.Style:=[];
    PrintRep.Font.Size:=6;
    PrintRep.AddText('ОПИС ЗОВНИШНЬГО СТАНУ ТОВАРУ:');

    PrintRep.Font.Size:=3;
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);
    PrintRep.AddText('-подряпини (місця розташування, кількість)  ');
    PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(ed_carap.Text);

    PrintRep.Font.Style:=[];
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);
    PrintRep.Font.Size:=3;
    PrintRep.AddText('-сколи корпусу (місця розташування, кількість)  ');
    PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(ed_skoly.Text);

    PrintRep.Font.Style:=[];
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);
    PrintRep.Font.Size:=3;
    PrintRep.AddText('-вигляд дисплею (наявність плям, пилу, інших предметів)  ');
    PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(ed_displ.Text);

    PrintRep.Font.Style:=[];
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);
    PrintRep.Font.Size:=3;
    PrintRep.AddText('-вигляд системного роз''эму (ушкодження, слыди бруду, вологи)  ');
    PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(ed_sys_roz.Text);

    PrintRep.Font.Style:=[];
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);
    PrintRep.Font.Size:=3;
    PrintRep.AddText('-місця нещільного прилягання корпусу  ');
    PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(ed_korpus.Text);

    PrintRep.Font.Style:=[];
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);
    PrintRep.Font.Size:=3;
    PrintRep.AddText('-комплектація (описати)  ');
    PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(ed_kompl.Text);

    PrintRep.AddText(#10);
    PrintRep.AddText(#10);

    PrintRep.AddTable(2,2);
    tb:=PrintRep.LastTable;
    Tb.SetBorders(1,1,2,2,EMPTY_BORDER);
    Tb.Cell[1,1].Align:=AL_LEFT;
    Tb.Cell[1,1].Font.Style:=[fsUnderline];
    Tb.Cell[1,1].AddText(FormatDateTime('dd.mm.yyyy', Date()));

    Tb.Cell[2,1].Align:=AL_RIGHT;
    Tb.Cell[2,1].Font.Style:=[fsUnderline];
    Tb.Cell[2,1].AddText('_______________________________');

    Tb.Cell[1,2].Align:=AL_LEFT;
    Tb.Cell[1,2].Font.Style:=[];
    Tb.Cell[1,2].AddText('    (дата)');

    Tb.Cell[2,2].Align:=AL_RIGHT;
    Tb.Cell[2,2].Font.Style:=[];
    Tb.Cell[2,2].AddText('МП                             (ПІБ та підпис продавця)      ');

    PrintRep.AddText(#10);
    PrintRep.AddText(#10);

    PrintRep.Font.Size:=6;
    PrintRep.Font.Style:=[];
    dash_str:='';
    page_width:=round((210/25.4)*100)-PrintRep.LeftMargin-PrintRep.RightMargin;
    while (page_width/2)>TextWidth(dash_str,PrintRep.Font) do
     begin
      dash_str:=dash_str+'- ';
     end;

    PrintRep.AddText(dash_str);
    PrintRep.AddText(#10);
    PrintRep.Font.Size:=5;
    PrintRep.AddText('ЗАДОВОЛЕННЯ ВИМОГ СПОЖИВАЧА ПРИ НАЯВНОСТІ ІСТОТНИХ НЕДОЛІКІВ:'+#10);
    PrintRep.Font.Size:=3;
    PrintRep.AddText('Споживач підтвержує, що всі його вимоги по цій заяві задоволені повністю і претензій не має.'+#10);
    PrintRep.AddText(#10);

    PrintRep.AddTable(4,2);
    tb:=PrintRep.LastTable;
    Tb.SetBorders(1,1,4,2,EMPTY_BORDER);

    Tb.Cell[1,1].Align:=AL_LEFT;
    Tb.Cell[1,1].Font.Style:=[];
    Tb.Cell[1,1].AddText('_______________________');

    Tb.Cell[2,1].Align:=AL_CENTER;
    Tb.Cell[2,1].Font.Style:=[];
    Tb.Cell[2,1].AddText('___________________          МП');

    Tb.Cell[3,1].Align:=AL_CENTER;
    Tb.Cell[3,1].Font.Style:=[];
    Tb.Cell[3,1].AddText('_______________________');

    Tb.Cell[4,1].Align:=AL_RIGHT;
    Tb.Cell[4,1].Font.Style:=[];
    Tb.Cell[4,1].AddText('___________________');

    Tb.Cell[1,2].Align:=AL_LEFT;
    Tb.Cell[1,2].Font.Style:=[];
    Tb.Cell[1,2].AddText('(ПІБ та підпис споживача)');

    Tb.Cell[2,2].Align:=AL_CENTER;
    Tb.Cell[2,2].Font.Style:=[];
    Tb.Cell[2,2].AddText('(Дата)');

    Tb.Cell[3,2].Align:=AL_CENTER;
    Tb.Cell[3,2].Font.Style:=[];
    Tb.Cell[3,2].AddText('(ПІБ та підпис продавця)');

    Tb.Cell[4,2].Align:=AL_RIGHT;
    Tb.Cell[4,2].Font.Style:=[];
    Tb.Cell[4,2].AddText('(Дата)      ');

    if PrintRep.PreView then
     begin
      Mes:='Заявление на гарантийный ремонт '#10+
           'Клиент: '+ed_Surname.Text+' '+ed_Name.Text+' '+ed_otch.Text+#10+
           'Телефон: '+ed_tel.Text+#10+
           'Товар: '+IntToStr(lbl_product.Tag)+' '+lbl_product.Caption;

      SimpleMessF:=TSimpleMessF.Create(Self);
      try
       SimpleMessF.Silent:=True;
       SimpleMessF.IsExtempore:=True;
       SimpleMessF.reW.Text:=Mes;
       SimpleMessF.Tem:=84;
       SimpleMessF.BitBtn3Click(nil);
      finally
       SimpleMessF.Free;
      end;
     end;


//    if PrintRep.PreView then
//        ShowMessage('Печать')
//    else
//        ShowMessage('Нет печати');
end;

procedure TFGarant_remont.Button1Click(Sender: TObject);
 begin//тестовые данные
  ed_Surname.Text:='Соколов';
  ed_name.Text:='Антон';
  ed_otch.Text:='Петрович';

  ed_tel.Text:='066123123';
  ed_address.Text:='г. Дануолл, ул. Научная, д. 100, кв. 200';

  ed_sn.Text:='322322_серийный_номер_322322';

  ed_defekt.Text:='Сломался совсем, работать не хочет';
  ed_carap.Text:='Царапины справа и слева 2 штуки';
  ed_skoly.Text:='скол посередине сверху 1 шт.';
  ed_displ.Text:='Дисплей помятый и пожеваный, в середине торчит гвоздь';
  ed_sys_roz.Text:='разъем выдернут наружу';
  ed_korpus.Text:='корпус помят';
  ed_kompl.Text:='ничего нет, все пропало...';
 end;

procedure TFGarant_remont.btn_exitClick(Sender: TObject);
begin
    //
    FGarant_remont.Close;
end;

end.
