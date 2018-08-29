unit PrOtkazU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, Util;

type
  TPrOtkazF = class(TForm)
    Panel1: TPanel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    rb3: TRadioButton;
    lbName: TLabel;
    edName: TEdit;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    lbSr: TLabel;
    Label2: TLabel;
    rb4: TRadioButton;
    Panel2: TPanel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Label6: TLabel;
    edPhone: TEdit;
    Bevel1: TBevel;
    rb5: TRadioButton;
    Label5: TLabel;
    Label7: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift:TShiftState);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edPhoneEnter(Sender: TObject);
    procedure edPhoneKeyDown(Sender: TObject; var Key: Word; Shift:TShiftState);
    procedure edPhoneKeyPress(Sender: TObject; var Key: Char);
    procedure edPhoneKeyUp(Sender: TObject; var Key: Word; Shift:TShiftState);

  private

    FFlag:Integer;
    FCena:Real;
    FTp:Integer;
    FMess:String;

  public
    fl_phone: boolean;

    procedure PreparePList;

    property Flag:Integer read FFlag write FFlag;
    property Tp:Integer read FTp write FTp;
    property Cena:Real read FCena write FCena;
    property Mess:String read FMess write FMess;

  end;

var PrOtkazF:TPrOtkazF;

implementation

uses MainU, DataModuleU, SimpleMessU, ZakazPodKlientaU;

{$R *.dfm}

procedure TPrOtkazF.FormCreate(Sender:TObject);
begin
  Caption:=MFC;
  FFlag:=0;
  FCena:=0;
  Fmess:='';
  lbSr.Caption:='';
  Tp:=0;
end;

procedure TPrOtkazF.PreparePList;
begin
  DM.qrPList.Close;
  DM.qrPList.Open;
end;

procedure TPrOtkazF.BitBtn2Click(Sender:TObject);
begin
  Close;
end;

procedure TPrOtkazF.BitBtn1Click(Sender:TObject);
var
  Res: String;
begin
  if (rb1.Checked=False) and (rb2.Checked=False) and (rb3.Checked=False) and (rb4.Checked=False) and (rb5.Checked=False) then
  begin
    MainF.MessBox('Выберите причину отказа!');
    exit;
  end;

  if ((rb1.Checked)or(rb2.Checked){or(rb3.Checked)}or(rb4.Checked))and(not fl_phone) then
   begin
    try
      ZakazPodKlientaF:=TZakazPodKlientaF.Create(self);
      fl_phone:=false;
      ZakazPodKlientaF.ShowModal;
    finally
      ZakazPodKlientaF.Free;
    end;
   end;

   if (rb5.Checked=True) and ( (IsEmptyPhone(edPhone.Hint)=True) or ((Pos('_',edPhone.Hint)<>0) or (Length(edPhone.Hint)<>10))) then
    begin
      MainF.MessBox('Введите корректный номер телефона клиента!');
      edPhone.SetFocus;
    end
    else
      if (Tp=1) and (edName.Text='') then
        MainF.MessBox('Выберите название требуемого препарата!')
      else
      begin
        if rb1.Checked then
          Flag:=1
        else
          if rb2.Checked then
          begin
            try
              FCena:=StrToCurr(Edit1.Text);

              FMess:='Обратите внимание!'+#10+
                     'Был оформлен отказ по цене '+#10+
                     ''+#10+
                     DM.spY_FilterSklad.FieldByName('Names').AsString+#10+
                     Label4.Caption+#10+
                     'Цена покупателя: '+Edit1.Text+#10;
              if ComboBox1.Text<>'' then Mess:=Mess+'У конкурента: '+ComboBox1.Text;
            except
              MainF.MessBox('Введите цену, которую назвал покупатель!');
              FCena:=0;
              Exit;
            end;

            Flag:=2;
          end
          else
            if (rb3.Checked) or (rb5.Checked) then
              Flag:=3
            else
               if rb4.Checked then Flag:=4;

        if Tp=1 then
          try
            DM.Qr2.Close;
            DM.Qr2.SQL.Clear;
            DM.Qr2.SQL.Add('declare @art int');
            DM.Qr2.SQL.Add('set @art=IsNull((select Max(art_code) from SprTov where Names='''+Trim(edName.Text)+'''),0)');
            DM.Qr2.SQL.Add('if @art=0');
            DM.Qr2.SQL.Add(' set @art=IsNull((select Max(art_code) from PList where Names='''+Trim(edName.Text)+'''),0)');
            DM.Qr2.SQL.Add('select @art as Art_code ');
            DM.Qr2.Open;
            edName.Tag:=DM.Qr2.FieldByName('art_code').AsInteger;
          except
            edName.Tag:=0;
          end;

        if (Tp=3) or (rb2.Checked) then
        begin
          MainF.MessBox('Предложите покупателю заказать на сайте дешевле самостоятельно '+
                        'или закажите ему сами, позвонив на бесплатный номер 0-800-505-911, '+
                        'чтобы покупатель не ушел в другую аптеку!',
                        48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
        end;

        Close;
      end;
(*
  if (rb1.Checked=False) and (rb2.Checked=False) and (rb3.Checked=False) and (rb4.Checked=False) and (rb5.Checked=False) then MainF.MessBox('Выберите причину отказа!') else
  if (IsEmptyPhone(edPhone.Hint)=False) and ((Pos('_',edPhone.Hint)<>0) or (Length(edPhone.Hint)<>10)) then
   begin
    MainF.MessBox('Введите корректный номер телефона клиента!');
    edPhone.SetFocus;
   end else
  if (Tp=1) and (edName.Text='') then MainF.MessBox('Выберите название требуемого препарата!') else
   begin
    if rb1.Checked then Flag:=1 else
    if rb2.Checked then
     begin

      try
       FCena:=StrToCurr(Edit1.Text);

       FMess:='Обратите внимание!'+#10+
             'Был оформлен отказ по цене '+#10+
             ''+#10+
             DM.spY_FilterSklad.FieldByName('Names').AsString+#10+
             Label4.Caption+#10+
             'Цена покупателя: '+Edit1.Text+#10;
       if ComboBox1.Text<>'' then Mess:=Mess+'У конкурента: '+ComboBox1.Text;

      except
       MainF.MessBox('Введите цену, которую назвал покупатель!');
       FCena:=0;
       Exit;
      end;

      Flag:=2;
     end else
    if (rb3.Checked) or (rb5.Checked) then Flag:=3 else
    if rb4.Checked then Flag:=4;

    if Tp=1 then
     try
      DM.Qr2.Close;
      DM.Qr2.SQL.Clear;
      DM.Qr2.SQL.Add('declare @art int');
      DM.Qr2.SQL.Add('set @art=IsNull((select Max(art_code) from SprTov where Names='''+Trim(edName.Text)+'''),0)');
      DM.Qr2.SQL.Add('if @art=0');
      DM.Qr2.SQL.Add(' set @art=IsNull((select Max(art_code) from PList where Names='''+Trim(edName.Text)+'''),0)');
      DM.Qr2.SQL.Add('select @art as Art_code ');
      DM.Qr2.Open;
      edName.Tag:=DM.Qr2.FieldByName('art_code').AsInteger;
     except
      edName.Tag:=0;
     end;

    if (Tp=3) or (rb2.Checked) then
     begin
      MainF.MessBox('Предложите покупателю заказать на сайте дешевле самостоятельно или закажите ему сами, позвонив на бесплатный номер 0-800-505-911, чтобы покупатель не ушел в другую аптеку!',
                    48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
     end;

    Close;
   end;
*)
end;

procedure TPrOtkazF.rb1Click(Sender:TObject);
begin
  Label1.Visible:=rb2.Checked;
  Edit1.Visible:=rb2.Checked;
  Panel2.Visible:=rb2.Checked;

  Label6.Visible:=rb5.Checked;
  edPhone.Visible:=rb5.Checked;
end;

procedure TPrOtkazF.Edit1KeyPress(Sender:TObject; var Key:Char);
begin
  if Key<>#8 then
    if Not (Key in CH_DIGIT+[',','.']) then Key:=#0;
  if Key=',' then Key:='.';
end;

procedure TPrOtkazF.DBGrid1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
  if Key in K_ARROW_KEYS then lbSr.Caption:='';
end;

procedure TPrOtkazF.DBGrid1Exit(Sender: TObject);
begin
  lbSr.Caption:='';
end;

procedure TPrOtkazF.DBGrid1KeyPress(Sender:TObject; var Key:Char);
var S:String;
begin
  S:=lbSr.Caption+Key;
  if DM.qrPList.Locate('Names',AnsiUpperCase(S),[loCaseInsensitive,loPartialKey]) then
    lbSr.Caption:=Copy(DM.qrPList.FieldByName('Names').AsString,1,Length(S));
end;

procedure TPrOtkazF.DBGrid1DblClick(Sender: TObject);
begin
  if DM.qrPList.IsEmpty then Exit;
  edName.Text:=TrimRight(DM.qrPList.FieldByName('Names').AsString);
  edName.Tag:=DM.qrPList.FieldByName('Art_Code').AsInteger;
end;

procedure TPrOtkazF.FormActivate(Sender: TObject);
begin
  if Tp=1 then
    PreparePList
  else
  begin
    Height:=262;
    //Height:=210;
    Top:=(Screen.Height-Height) div 2;
    if Tp=3 then
    begin
      rb2.Checked:=True;
      Edit1.SetFocus;
    end;
  end;
end;

procedure TPrOtkazF.edPhoneEnter(Sender:TObject);
begin
  EditEnter(Sender);
end;

procedure TPrOtkazF.edPhoneKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
  EditKeyUp(Sender,Key,Shift);
end;

procedure TPrOtkazF.edPhoneKeyPress(Sender:TObject; var Key:Char);
begin
  EditKeyPress(Sender,Key);
end;

procedure TPrOtkazF.edPhoneKeyUp(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
  EditKeyUp(Sender,Key,Shift);
end;

end.


