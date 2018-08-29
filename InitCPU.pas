unit InitCPU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MainU, ExtCtrls, StdCtrls, Buttons, ComCtrls;

type
  TInitCPF = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    dtChek: TDateTimePicker;
    Label2: TLabel;
    cbKassa: TComboBox;
    Label3: TLabel;
    cbVzh: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    edCheck: TEdit;
    cbUser: TComboBox;
    Label6: TLabel;
    tmChek: TDateTimePicker;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbKassaChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private

    FFlag:Integer;
    FCP:TChekPos;

  public

    property CP:TChekPos read FCP write FCP;
    property Flag:Integer read FFlag write FFlag;

  end;

var InitCPF:TInitCPF;

implementation

uses DataModuleU;


{$R *.dfm}

procedure TInitCPF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  dtChek.Date:=Date;
  CheckBox1.Checked:=MainF.cbEKKA.Checked;
  Flag:=0;
 end;

procedure TInitCPF.FormActivate(Sender:TObject);
 begin
  dtChek.DateTime:=FCP.Date;
  tmChek.Time:=Time;
  edCheck.Text:=IntToStr(FCP.NumbChek);
  cbKassa.ItemIndex:=FCP.ID_Kassa-1;
  cbUser.Text:=IntToStr(FCP.ID_User);
  cbKassaChange(cbKassa);
 end;

procedure TInitCPF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TInitCPF.BitBtn1Click(Sender: TObject);
 begin
  if MainF.Design=False then
   try
    Prm.UserRole:=R_KASSIR;
    if Not MainF.IsPermit([],P_ALERT) then Exit;
   finally
    Prm.UserRole:=Prm.SafeUserRole;
   end;
  FCP.Date:=StrToDateTime(DateToStr(dtChek.Date)+' '+TimeToStr(tmChek.Time));
  FCP.NumbChek:=StrToInt(edCheck.Text);
  FCP.ID_Kassa:=StrToInt(cbKassa.Text);
  FCP.ID_User:=StrToInt(cbUser.Text);
  FCP.Vzh:=StrToInt64(cbVzh.Text);
  FCP.VzhSafe:=CP.Vzh;
  InitCPF.Flag:=1;
  Close;
 end;

procedure TInitCPF.cbKassaChange(Sender: TObject);
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select IsNull(Max(Vzh),0) as Vzh from ArhCheks where id_kassa='+cbKassa.Text;
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Abort;
   if DM.Qr.FieldByName('Vzh').AsFloat=0 then Abort;
   cbVzh.Text:=DM.Qr.FieldByName('Vzh').AsString;
  except
   cbVzh.Text:=cbKassa.Text;
  end;
 end;

procedure TInitCPF.CheckBox1Click(Sender: TObject);
 begin
  MainF.cbEKKA.Checked:=CheckBox1.Checked;
 end;

end.
