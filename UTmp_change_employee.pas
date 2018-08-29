unit UTmp_change_employee;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, DB, ADODB, ComCtrls, PrintReport, Buttons;

type
  TFTmp_change_employee = class(TForm)
    lbl_title: TLabel;
    lbl_apteka: TLabel;
    lbl_employee: TLabel;
    lbl_period: TLabel;
    lbl_date_begin: TLabel;
    lbl_date_end: TLabel;
    CheckBox_date_end: TCheckBox;
    lbl_time_of_absent: TLabel;
    lbl_change_reason: TLabel;
    lbl_declaration_1: TLabel;
    lbl_declaration_2: TLabel;
    lbl_apteka_name: TLabel;
    ADOQ_tmp: TADOQuery;
    CB_employee: TComboBox;
    DTP_begin: TDateTimePicker;
    DTP_end: TDateTimePicker;
    ed_time_of_absent: TEdit;
    ed_change_reason: TEdit;
    btn_Report: TButton;
    lbl_or: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure CheckBox_date_endClick(Sender: TObject);
    procedure btn_ReportClick(Sender: TObject);
    procedure ed_time_of_absentKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private

  public
    message_str:string;
  end;

var FTmp_change_employee: TFTmp_change_employee;

implementation

uses SimpleMessU, MainU;

{$R *.dfm}

procedure TFTmp_change_employee.FormActivate(Sender: TObject);
begin//

    DTP_begin.Date:=Date;
    DTP_end.Date:=Date;

    with ADOQ_tmp do
    begin
        Close;
        SQL.Clear;
        SQL.Add('select DESCR, Value from APTEKA_NET..spr_const with(nolock)');
        SQL.Add('where DESCR=''AptekaNameRU''');
        Open;
        lbl_apteka_name.Caption:=FieldByName('Value').AsString;

        Close;
        SQL.Clear;
        SQL.Add('select id, Users, id_gamma from APTEKA_NET..vSprUser');
        SQL.Add('order by Users');
        Open;
        cb_employee.Items.Clear;
        while not eof do
        begin
            cb_employee.Items.Add(FieldByName('Users').AsString);
            next;
        end;
        cb_employee.ItemIndex:=0;
    end;

    lbl_declaration_1.Caption:='Сотрудники  '+lbl_apteka_name.Caption+'  предупреждены, '
            +#10+#13+'что при входе/выходе из графика сотрудника из другой аптеки '
            +#10+#13+'                           ПЕРЕУЧЕТ НЕ ПРОВОДИТСЯ';

    lbl_declaration_2.Caption:='Всю ответственность за сохранность материальных ценностей'+#10+#13+'аптеки, берут на себя материально ответственные лица '+#10+#13+'штатного коллектива аптеки.';

end;

procedure TFTmp_change_employee.CheckBox_date_endClick(Sender: TObject);
begin//
    DTP_end.Enabled:= CheckBox_date_end.Checked;
end;

procedure TFTmp_change_employee.btn_ReportClick(Sender: TObject);
var Tb:TTableObj;
 begin//
    //создание Заявки на временную замену сотрудника
    PrintRep.Clear;
    PrintRep.SetDefault;
    PrintRep.Font.Name:='Arial'; PrintRep.Font.Size:=3; PrintRep.Font.Style:=[];
    PrintRep.Orientation:=O_PORTR; PrintRep.PageSize:=PF_A4; PrintRep.Align:=AL_LEFT;
    PrintRep.Indent:=0;

    PrintRep.Font.Size:=7;
    PrintRep.Align:=AL_CENTER;
    PrintRep.AddText('Заявка на временную замену сотрудника'+#10);
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);

    PrintRep.Font.Size:=6;
    PrintRep.Align:=AL_LEFT;
    PrintRep.AddText('Аптека: ');
    PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(lbl_apteka_name.Caption+#10);
    PrintRep.Font.Style:=[];
    PrintRep.AddText('     (управленческое название аптеки)'+#10);
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);

    PrintRep.AddText('Просим временно заменить сотрудника'+#10);
    PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(CB_employee.Text+#10);
    PrintRep.Font.Style:=[];
    PrintRep.AddText('     (ФИО)'+#10);
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);

    PrintRep.AddText('Период замены:'+#10);
    PrintRep.AddText('дата начала: ');
    PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(FormatDateTime('dd.mm.yyyy',DTP_begin.Date));
    PrintRep.AddText(#10);

    PrintRep.Font.Style:=[];
    PrintRep.AddText('дата окончания (если известна): ');

    if CheckBox_date_end.Checked then
    begin
        PrintRep.Font.Style:=[fsUnderline];
        PrintRep.AddText(FormatDateTime('dd.mm.yyyy',DTP_end.Date));
    end
    else
        PrintRep.AddText('_________________________________');

    PrintRep.Font.Style:=[];
    PrintRep.AddText(' или ');

    PrintRep.AddText(#10);
    PrintRep.AddText(#10);

    PrintRep.AddText('предполагаемая длительность отсутствия основного сотрудника (дней)'+#10);
    if trim(ed_time_of_absent.Text)<>'' then
    begin
        PrintRep.Font.Style:=[fsUnderline];
        PrintRep.AddText(ed_time_of_absent.Text);
    end
    else
        PrintRep.AddText('_________________________________');

    PrintRep.Font.Style:=[];
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);

    PrintRep.AddText('Причина замены '+#10);
    if trim(ed_change_reason.Text)<>'' then
    begin
        PrintRep.Font.Style:=[fsUnderline];
        PrintRep.AddText(ed_change_reason.Text);
    end
    else
        PrintRep.AddText('___________________________________________________________________________________________________');


    PrintRep.Font.Style:=[];
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);
    PrintRep.Font.Size:=7;
//    PrintRep.AddText('Сотрудники предупреждены, что по окончании работы'+#10);
//    PrintRep.AddText('сотрудника из другой аптеки ПЕРЕУЧЕТ НЕ ПРОВОДИТСЯ.');
    PrintRep.AddText(lbl_declaration_1.Caption);
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);

//    PrintRep.AddText('Всю ответственность за сохранность материальных ценностей '+#10);
//    PrintRep.AddText('аптеки, берут на себя материально ответственные лица'+#10);
//    PrintRep.AddText('штатного коллектива аптеки.');
    PrintRep.AddText(lbl_declaration_2.Caption);

//    Label1.Caption:=message_str;
    PrintRep.PreView;
  end;

procedure TFTmp_change_employee.ed_time_of_absentKeyPress(Sender: TObject; var Key: Char);
var
  ttt : set of char;
begin
   ttt := ['1','2','3','4','5','6','7','8','9','0'];
try
// If key = ',' then key := '.';
 If  (key <> char(8)) then
  begin
   if key  in ttt then
     begin
      if (pos('.',TEdit(Sender).text)>0) and (key='.') then key := char(nil);
     end
    else key := Char(nil);

   end;
  except

 end;
end;

procedure TFTmp_change_employee.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TFTmp_change_employee.BitBtn1Click(Sender:TObject);
 begin
  //формируем сообщение
  if MainF.MessBox('Вы дейтсвительно ходтите отправить сообщение о замене сотрудника?',52)<>ID_YES then Exit;

  message_str:='"Заявка на временную замену сотрудника"'#10;
  message_str:=message_str+'Аптека: '+lbl_apteka_name.Caption+#10'Сотрудник: '+CB_employee.Text+#10' Дата начала: '+FormatDateTime('dd.mm.yyyy',DTP_begin.Date);
  if CheckBox_date_end.Checked then
      message_str:=message_str+#10'Дата окончания: '+FormatDateTime('dd.mm.yyyy',DTP_end.Date)
  else
      message_str:=message_str+#10'Дата окончания: '+'"не введена"';

  if trim(ed_time_of_absent.Text)<>'' then
      message_str:=message_str+#10'Длительность отсутствия: '+ed_time_of_absent.Text
  else
      message_str:=message_str+#10'Длительность отсутствия: '+'"не введена"';

  if trim(ed_change_reason.Text)<>'' then
      message_str:=message_str+#10'Причина: '+ed_change_reason.Text
  else
      message_str:=message_str+#10'Причина: '+'"не введена"';

  SimpleMessF:=TSimpleMessF.Create(Self);
  try
   SimpleMessF.Silent:=True;
   SimpleMessF.IsExtempore:=True;
   SimpleMessF.reW.Text:=message_str;

   if Prm.FirmID=19 then SimpleMessF.Tem:=97
                    else SimpleMessF.Tem:=96;

   SimpleMessF.BitBtn3Click(nil);
   MainF.MessBox('Сообщение поставлено в очередь отправки!',64);
  finally
   SimpleMessF.Free;
  end;
 end;

end.
