unit FormForVozrU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, MainU,
  ComCtrls;

type
  TFormForVozrF=class(TForm)
    GroupBox1:TGroupBox;
    Edit1:TEdit;
    Label1:TLabel;
    Label2:TLabel;
    Edit2:TEdit;
    Label3:TLabel;
    Edit3:TEdit;
    Label4:TLabel;
    Edit4:TEdit;
    Label5:TLabel;
    Label6:TLabel;
    SpeedButton2:TSpeedButton;
    SpeedButton1:TSpeedButton;
    ComboBox1: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Edit6: TEdit;
    Label9: TLabel;
    Edit7: TEdit;
    Label10: TLabel;
    dtPasp: TDateTimePicker;
    Label11: TLabel;
    Edit8: TEdit;
    ComboBox2: TComboBox;
    Edit5: TComboBox;
    Label12: TLabel;
    dtBirth: TDateTimePicker;
    Label14: TLabel;
    Edit10: TEdit;
    Edit9: TComboBox;
    ComboBox3: TComboBox;
    Edit11: TEdit;
    procedure FormCreate(Sender:TObject);
    procedure SpeedButton1Click(Sender:TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);

  private

  public

    VF:TVozrForm;
    Flag:Integer;

  end;

var FormForVozrF:TFormForVozrF;

implementation

uses DataModuleU;

{$R *.dfm}

procedure TFormForVozrF.FormCreate(Sender:TObject);
var i:Integer;
 begin
  Caption:=MFC;
  Flag:=0;
  VF.IsSimpl:=False;
  try
   DM.QrEx.Close;

   if Prm.IsKurier=False then
    DM.QrEx.SQL.Text:='select * from SprUser where reserve=0 and id_role=4 order by users'
   else
    DM.QrEx.SQL.Text:='select top 1 Value as users from Spr_Const where Descr=''ZavApteki'' ';

   DM.QrEx.Open;
   if Prm.FirmID=5 then ComboBox1.Style:=csDropDown;
   ComboBox1.Clear;
   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;
     ComboBox1.Items.Add(DM.QrEx.FieldByName('Users').AsString);
    end;
   Edit9.Text:=Prm.aCity;
   dtPasp.Date:=Date-365*16;
   dtBirth.Date:=Date-365*16;
  except
  end;
 end;

procedure TFormForVozrF.SpeedButton1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TFormForVozrF.SpeedButton2Click(Sender: TObject);
 begin

  if Edit1.Text='' then
   begin
    MainF.MessBox('Введите фамилию покупателя!');
    Edit1.SetFocus;
    Exit;
   end else
  if Edit2.Text='' then
   begin
    MainF.MessBox('Введите имя покупателя!');
    Edit2.SetFocus;
    Exit;
   end else
  if Edit3.Text='' then
   begin
    MainF.MessBox('Введите отчество покупателя!');
    Edit3.SetFocus;
    Exit;
   end;

  if VF.IsSimpl=False then
   begin

    if Length(Edit9.Text)<3 then
     begin
      MainF.MessBox('Введите город покупателя!');
      Edit9.SetFocus;
     end else

    if ComboBox3.Text='' then
     begin
      MainF.MessBox('Выберите тип улицы!');
      ComboBox3.SetFocus;
     end else

    if Length(Edit4.Text)<5 then
     begin
      MainF.MessBox('Введите улицу покупателя!');
      Edit4.SetFocus;
     end else

    if Edit10.Text='' then
     begin
      MainF.MessBox('Введите номер дома покупателя!');
      Edit10.SetFocus;
     end else

    if ComboBox2.Text='' then
     begin
      MainF.MessBox('Введите тип документа!');
      ComboBox2.SetFocus;
     end else
{
    if Length(Edit6.Text)<>2 then
     begin
      MainF.MessBox('Серия доумента должна быть из 2-х символов!');
      Edit6.SetFocus;
     end else
}
{    if Length(Edit7.Text)<>6 then
     begin
      MainF.MessBox('Номер документа должен быть 6-значным!');
      Edit7.SetFocus;
     end else
 }
    if Edit8.Text='' then
     begin
      MainF.MessBox('Введите кем выдан документ!');
      Edit8.SetFocus;
     end else
    if Edit5.Text='' then
     begin
      MainF.MessBox('Введите причину возврата!');
      Edit5.SetFocus;
     end else
    if ComboBox1.Text='' then
     begin
      MainF.MessBox('Выберите заведующего или заместителя торговой точки из списка!');
      ComboBox1.SetFocus;
     end else
    if dtPasp.Date-dtBirth.Date<365*16 then
     begin
      MainF.MessBox('Дата рождения должна быть не менее чем на 16 лет меньше даты выдачи паспорта! ');
      dtBirth.SetFocus;
     end else begin

               VF.F:=Edit1.Text;
               VF.N:=Edit2.Text;
               VF.O:=Edit3.Text;

               VF.A:=Edit9.Text+' '+ComboBox3.Text+' '+Edit4.Text+' д. '+Edit10.Text;
              if Edit11.Text<>'' then VF.A:=VF.A+' кв. '+Edit11.Text;

              VF.Pr:=Edit5.Text;
              VF.Z:=ComboBox1.Text;
              VF.DateR:=dtBirth.Date;
              VF.PaspD:=dtPasp.Date;
              VF.PaspS:=Edit6.Text;
              VF.PaspN:=Edit7.Text;
              VF.PaspT:=ComboBox2.Text;
              VF.PaspV:=Edit8.Text;

              Flag:=1;

              Close;
             end; 
   end else begin
             VF.F:=Edit1.Text;
             VF.N:=Edit2.Text;
             VF.O:=Edit3.Text;

             Flag:=1;
             Close;
            end;
 end;

procedure TFormForVozrF.Edit7KeyPress(Sender: TObject; var Key: Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

end.

