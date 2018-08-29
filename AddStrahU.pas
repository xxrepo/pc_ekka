unit AddStrahU;

interface

uses Forms, StdCtrls, ComCtrls, Buttons, Controls, Classes, SysUtils, Util;

type
  TAddStrahF = class(TForm)
    Label3: TLabel;
    cbStrah: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edNNPolis: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    dtPolis: TDateTimePicker;
    Label4: TLabel;
    edFransh: TEdit;
    Label5: TLabel;
    edFIO: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    edPhone: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edNumOrder: TEdit;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edFranshKeyPress(Sender: TObject; var Key: Char);
    procedure edPhoneEnter(Sender: TObject);
    procedure edPhoneKeyDown(Sender: TObject; var Key: Word; Shift:TShiftState);
    procedure edPhoneKeyPress(Sender: TObject; var Key: Char);
    procedure edPhoneKeyUp(Sender: TObject; var Key: Word; Shift:TShiftState);
    procedure FormActivate(Sender: TObject);

  private
    aID:Array of Record
     ID:Integer;
    end;
  public
//    Flag: Integer;
    id_strah: Integer;
    name_strah: String;
//    FIsReadOnly: boolean;
  end;

var
  AddStrahF: TAddStrahF;

implementation

uses
  MainU, DataModuleU;

{$R *.dfm}

procedure TAddStrahF.FormCreate(Sender:TObject);
var
  i: Integer;
begin
  MainF.FStrahIsReadOnly:=false;
  Caption:=MFC;
//  Flag:=0;
//  cbStrah.Clear;
//  SetLength(aID,0);
//  DM.QrEx.Close;
//  DM.QrEx.SQL.Text:='select id,Descr from Strahovaya order by Descr ';
//  DM.QrEx.Open;
//
//  dtPolis.Date:=Date;
//
//  SetLength(aID,DM.QrEx.RecordCount);
//  for i:=1 to DM.QrEx.RecordCount do
//  begin
//    if i=1 then DM.QrEx.First else DM.QrEx.Next;
//    cbStrah.Items.Add(DM.QrEx.FieldByName('Descr').AsString);
//    aID[i-1].ID:=DM.QrEx.FieldByName('ID').AsInteger;
//  end;
//  cbStrah.ItemIndex:=-1;
  Position:=poMainFormCenter;
end;

procedure TAddStrahF.BitBtn2Click(Sender:TObject);
begin
  Close;
end;

procedure TAddStrahF.BitBtn1Click(Sender: TObject);
begin
  if MainF.FStrahIsReadOnly then
  begin
    AddStrahF.Close;
  end
  else
  begin
    if cbStrah.ItemIndex=-1 then
    begin
      MainF.MessBox('Выберите страховую компанию.');
      cbStrah.SetFocus;
    end
    else
      if Trim(edNNPolis.Text)='' then
      begin
        MainF.MessBox('Введите номер полиса.');
        edNNPolis.SetFocus;
      end
      else
      if Trim(edFransh.Text)='' then
      begin
        MainF.MessBox('Введите процент франшизи (сумму, которую выплачивает клиент).');
        edFransh.SetFocus;
      end
      else
        if Trim(edFIO.Text)='' then
        begin
          MainF.MessBox('Введите ФИО покупателя.');
          edFIO.SetFocus;
        end
        else
        if (RadioButton1.Checked=False) and (RadioButton2.Checked=False) then
        begin
          MainF.MessBox('Выберите тип лоставки!');
        end
        else
          if (Pos('_',edPhone.Hint)<>0) or (Length(edPhone.Hint)<>10) then
          begin
            MainF.MessBox('Введите контактный телефон покупателя!');
            edPhone.SetFocus;
          end
          else
          if ((Pos('_',edPhone.Hint)<>0) or (Length(edPhone.Hint)<>10)) then
          begin
            MainF.MessBox('Введите корректное значение в поле "Контактный телефон покупателя"!');
            edPhone.SetFocus;
          end
          else
            if (Trim(edNumOrder.Text)='') and (aID[cbStrah.ItemIndex].ID in [9,32,36,37,19,14,23]) then
            begin
              MainF.MessBox('Введите Номер заявки.');
              edFIO.SetFocus;
            end
            else
            begin
              try
                if StrToCurr(edFransh.Text)>=100 then
                begin
                  MainF.MessBox('Процент франшизы не может превышать 100% !');
                  edFransh.SetFocus;
                  Exit;
                end;
              except
                MainF.MessBox('Введите корректно процент франшизы!');
                edFransh.SetFocus;
                Exit;
              end;
              id_strah:=aID[cbStrah.ItemIndex].ID;
              name_strah:=cbStrah.Text;
              //Flag:=1;
              MainF.FlIsStrah:=1;
              Close;
            end;
  end;
end;

procedure TAddStrahF.edFranshKeyPress(Sender: TObject; var Key: Char);
begin
  if Key<>#8 then
    if Not (Key in CH_DIGIT+[',','.']) then Key:=#0;
  if Key=',' then Key:='.';
end;

procedure TAddStrahF.edPhoneEnter(Sender:TObject);
 begin
  EditEnter(Sender);
 end;

procedure TAddStrahF.edPhoneKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
  EditKeyUp(Sender,Key,Shift);
end;

procedure TAddStrahF.edPhoneKeyPress(Sender: TObject; var Key: Char);
begin
  EditKeyPress(Sender,Key);
end;

procedure TAddStrahF.edPhoneKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  EditKeyUp(Sender,Key,Shift);
 end;

procedure TAddStrahF.FormActivate(Sender: TObject);
var
  i: integer;
begin
  if MainF.FStrahIsReadOnly then
  begin
    cbStrah.Enabled:=false;
    edNNPolis.Enabled:=false;
    dtPolis.Enabled:=false;
    edFransh.Enabled:=false;
    edFIO.Enabled:=false;
    RadioButton1.Enabled:=false;
    RadioButton2.Enabled:=false;
    edPhone.Enabled:=false;
    edNumOrder.Enabled:=false;
    with BitBtn1 do
    begin
      Enabled:=true;
      Visible:=true;
      Left:=144;
      Top:=241;
      Width:=173;
      Height:=25;
    end;
    with BitBtn2 do
    begin
      Enabled:=true;
      Visible:=false;
      Left:=232;
      Top:=241;
      Width:=83;
      Height:=25;
    end;

    with AddStrahF do
    begin
      id_strah:=MainF.Fid_strah;
      DM.QrEx.Close;
      DM.QrEx.SQL.Text:='select id,Descr from Strahovaya where id='+IntToStr(MainF.Fid_strah)+' order by Descr ';
      DM.QrEx.Open;
      SetLength(aID,DM.QrEx.RecordCount);
      for i:=1 to DM.QrEx.RecordCount do
      begin
        if i=1 then DM.QrEx.First else DM.QrEx.Next;
        cbStrah.Items.Add(DM.QrEx.FieldByName('Descr').AsString);
        aID[i-1].ID:=DM.QrEx.FieldByName('ID').AsInteger;
      end;
      cbStrah.ItemIndex:=0;
//      cbStrah.ItemIndex:=MainF.Fid_strah;
//      cbStrah.Text:=MainF.FName_Strah;
      edNNPolis.Text:=MainF.Fnn_polis;
      dtPolis.Date:=MainF.Fdt_polis;
      edFransh.Text:=CurrToStr(MainF.Ffransh);
      edFIO.Text:=MainF.FFIOStrah;

      if MainF.FTypeDostStrah=0 then // Доставка
      begin
        RadioButton1.Checked:=true;
        RadioButton2.Checked:=false;
      end
      else
        if MainF.FTypeDostStrah=1 then // Самовывоз
        begin
          RadioButton1.Checked:=false;
          RadioButton2.Checked:=true;
        end;

      edPhone.Text:=MainF.FPhoneStrah;
      edNumOrder.Text:=MainF.FNumOrder;
    end;
{
    :=AddStrahF.;
    :=AddStrahF.name_strah;
    :=AddStrahF.edNNPolis.Text;
    :=AddStrahF.dtPolis.Date;
    :=StrToCurr(AddStrahF.edFransh.Text);
    :=AddStrahF.edFIO.Text;
    :=AddStrahF.edPhone.Text;
    :=AddStrahF.edNumOrder.Text;

    if AddStrahF.RadioButton1.Checked then FTypeDostStrah:=0
                                      else FTypeDostStrah:=1; 
}
  end
  else
  begin
    //Flag:=0;
    MainF.FlIsStrah:=0;
    cbStrah.Clear;
    SetLength(aID,0);
    DM.QrEx.Close;
    DM.QrEx.SQL.Text:='select id,Descr from Strahovaya order by Descr ';
    DM.QrEx.Open;

    dtPolis.Date:=Date;

    SetLength(aID,DM.QrEx.RecordCount);
    for i:=1 to DM.QrEx.RecordCount do
    begin
      if i=1 then DM.QrEx.First else DM.QrEx.Next;
      cbStrah.Items.Add(DM.QrEx.FieldByName('Descr').AsString);
      aID[i-1].ID:=DM.QrEx.FieldByName('ID').AsInteger;
    end;
    cbStrah.ItemIndex:=-1;

    cbStrah.Enabled:=true;
    edNNPolis.Enabled:=true;
    dtPolis.Enabled:=true;
    edFransh.Enabled:=true;
    edFIO.Enabled:=true;
    RadioButton1.Enabled:=true;
    RadioButton2.Enabled:=true;
    edPhone.Enabled:=true;
    edNumOrder.Enabled:=true;
    with BitBtn1 do
    begin
      Enabled:=true;
      Visible:=true;
      Left:=144;
      Top:=241;
      Width:=83;
      Height:=25;
    end;
    with BitBtn2 do
    begin
      Enabled:=true;
      Visible:=true;
      Left:=232;
      Top:=241;
      Width:=83;
      Height:=25;
    end;
  end;
end;

end.
