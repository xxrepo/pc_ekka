unit ChooseVL1U;

interface

uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      Dialogs, StdCtrls, Buttons;

type
  TChooseVL1F = class(TForm)
    Label1: TLabel;
    cbDtVozr: TComboBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
  public

    DateVz:TDateTime;
    Flag:Integer;

  end;

var ChooseVL1F:TChooseVL1F;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TChooseVL1F.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TChooseVL1F.BitBtn1Click(Sender: TObject);
 begin
  if cbDtVozr.Items.Count=0 then begin MainF.MessBox('Список возвратов пуст!'); Exit; end;
  if cbDtVozr.ItemIndex<0 then begin MainF.MessBox('Выберите дату возврата из списка'); Exit; end;
  try
   DateVz:=StrToDateTime(cbDtVozr.Text);
   Flag:=1;
   Close;
  except
   MainF.MessBox('Ошибка преобразования даты возврата!');
  end;
 end;

procedure TChooseVL1F.FormCreate(Sender: TObject);
var i:Integer;
 begin
  Caption:=MFC;
  DM.Qr5.Close;
  DM.Qr5.SQL.Text:='select DtVz from SpisVozr where IsNull(Closed,0) in (1,2) group by DtVz order by DtVz desc';
  DM.Qr5.Open;
  cbDtVozr.Clear;
  for i:=1 to DM.Qr5.RecordCount do
   begin
    if i=1 then DM.Qr5.First else DM.Qr5.Next;
    cbDtVozr.Items.Add(DM.Qr5.FieldByName('DtVz').AsString);
   end;
  cbDtVozr.ItemIndex:=0;
 end;

end.
