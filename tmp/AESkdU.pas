unit AESkdU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Util;

type
  TAESkdF = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Edit1: TLabeledEdit;
    Edit2: TLabeledEdit;
    Edit3: TLabeledEdit;
    Edit4: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
  public
    Flag:Integer;
  end;

var AESkdF: TAESkdF;

implementation

uses DataModuleU, MainU;

{$R *.dfm}                                         

procedure TAESkdF.FormCreate(Sender: TObject);
 begin
  Flag:=0;
  Caption:=MFC;
 end;

procedure TAESkdF.FormActivate(Sender: TObject);
 begin
  Case Flag of
    1:Label1.Caption:='Добавление скидки';
    2:begin
       Label1.Caption:='Редактирование скидки';
       try
        Edit1.Text:=DM.qrSKD.FieldByName('Type_Skd').AsString;
        Edit2.Text:=DM.qrSKD.FieldByName('Summ').AsString;
        Edit3.Text:=DM.qrSKD.FieldByName('Skd').AsString;
        Edit4.Text:=TrimRight(DM.qrSKD.FieldByName('Descr').AsString);
       except
       end
      end;
  end;
 end;

procedure TAESkdF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TAESkdF.BitBtn1Click(Sender: TObject);
 begin
  if IsInt(Edit1,'Введите целое числовое значение в поле "Тип скидки"',MFC) then
   if IsFloat(Edit2,'Введите денежное значение в поле "Сумма скидки"',MFC) then
    if IsFloat(Edit3,'Введите числовое значение в поле "Процент скидки"',MFC) then
     try
      DM.Qr.Close;
      DM.Qr.SQL.Clear;
      Case Flag of
       1:begin
          DM.Qr.SQL.Add('Insert into Skd(Type_Skd,Summ,SKD,Descr,Type_Limit)');
          DM.Qr.SQL.Add('Values('+Edit1.Text+','+Edit2.Text+','+Edit3.Text+','''+Edit4.Text+''',0)');
         end;
       2:begin
          DM.Qr.SQL.Add('Update SKD set Type_Skd='+Edit1.Text+', Summ='+Edit2.Text+', SKD='+Edit3.Text);
          DM.Qr.SQL.Add(' , Descr='''+Edit4.Text+''' where row_id='+DM.qrSKD.FieldByName('row_id').AsString);
         end;
      end;
      DM.Qr.ExecSQL;
      DM.qrSKD.Close;
      DM.qrSKD.Open;
      Close;
     except
      MainF.MessBox('Ошибка записи в таблицу "Скидки"');
     end;
 end;

end.
