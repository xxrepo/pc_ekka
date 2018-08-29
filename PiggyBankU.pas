unit PiggyBankU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, jpeg, ExtCtrls, StdCtrls, Grids, DBGrids, OpenLib, DBCtrls,
     Buttons, Util, ComCtrls, DateUtils;

type
  TPiggyBankF = class(TForm)

    Image1: TImage;
    lbUser: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Panel8: TPanel;
    DBGrid3: TDBGrid;
    im1_3: TImage;
    DBText1: TDBText;
    DBText2: TDBText;
    Label3: TLabel;
    Bevel2: TBevel;
    Panel1: TPanel;
    Label4: TLabel;
    DBText4: TDBText;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    lbTest: TLabel;
    Label7: TLabel;
    lbArmour: TLabel;
    bbTest: TBitBtn;
    bbArmour: TBitBtn;
    Panel2: TPanel;
    Shape1: TShape;
    Label6: TLabel;
    lbBonusAll: TLabel;
    Image2: TImage;
    Label8: TLabel;
    Panel3: TPanel;
    Shape2: TShape;
    Label9: TLabel;
    lbBonusActive: TLabel;
    Image3: TImage;
    Label11: TLabel;
    DBText3: TDBText;
    DBText5: TDBText;
    BitBtn1: TBitBtn;
    Panel4: TPanel;
    Label2: TLabel;
    cbPrior: TComboBox;
    CheckBox1: TCheckBox;
    Panel5: TPanel;
    Label12: TLabel;
    ComboBox2: TComboBox;
    Label13: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    BitBtn3: TBitBtn;
    cbStatus: TComboBox;
    Label10: TLabel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bbTestClick(Sender: TObject);
    procedure bbArmourClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbPriorCloseUp(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox2CloseUp(Sender: TObject);
    procedure UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure cbStatusCloseUp(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure lbUserDblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);

  private

    aID:Array of Integer;

    procedure ShowAkciiStat(id_p:Integer; IsAll:Byte; D1,D2:TDateTime);
    procedure FilterSpisAkcii;

  public

  end;

var PiggyBankF:TPiggyBankF;

implementation

uses MainU, DataModuleU, AkciiStatU, PiggyBankRepU, BonusStateU,
  PlanMotivationStatU;

{$R *.dfm}

procedure TPiggyBankF.FormCreate(Sender:TObject);
var i:Integer;
 begin

  Caption:=MFC;
  lbUser.Caption:=Prm.UserName;
  if MainF.Design then lbUser.Caption:=lbUser.Caption+' ('+IntToStr(Prm.ID_Gamma)+')';
  lbUser.ShowHint:=True;
  lbUser.Hint:=IntToStr(Prm.ID_Gamma);
  MakeGradientWidthI(im1_3,clGreen,$00C1EFAD);

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select * from SprPrioritet where Active=1 order by id';

  try
   DM.QrEx.Open;
  except
   DM.ADOCo.Connected:=False;
   DM.ADOCo.Connected:=True;
   DM.QrEx.Open;
  end;

  SetLength(aID,DM.QrEx.RecordCount+1);
  cbPrior.Items.Add('Все');
  aID[0]:=0;
  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    cbPrior.Items.Add(DM.QrEx.FieldByName('Names').AsString);
    aID[i]:=DM.QrEx.FieldByName('ID').AsInteger;
   end;
  cbPrior.ItemIndex:=0;

  UpDown1.Position:=StrToInt(FormatDateTime('yyyy',Date));
  ComboBOx2.ItemIndex:=StrToInt(FormatDateTime('mm',Date))-1;

  BitBtn5.Visible:=Prm.IsZav;
  FilterSpisAkcii;

  DM.qrASpis1.Close;
  DM.qrASpis1.SQL.Text:='spY_GetSumBonusAll_End '+IntToStr(Prm.ID_Gamma)+',null,null,2 ';
  DM.qrASpis1.Open;

//  Label6.Caption:='Бонусов к выплате итого'#10'(на текущую дату)';

  DM.Qr.Close;
  DM.Qr.SQL.Text:='exec spY_GetSumBonusAll_End '+IntToStr(Prm.ID_Gamma)+',null,null,0 ';
  DM.Qr.Open;
  lbBonusAll.Caption:=CurrToStr(DM.Qr.FieldByName('SumB').AsCurrency);
  lbBonusActive.Caption:=CurrToStr(DM.Qr.FieldByName('SumBActive').AsCurrency);

  DM.Qr.Close;
  DM.Qr.SQL.Text:='declare @Sm numeric(12,2) exec spY_TestResult '+IntToStr(Prm.ID_Gamma)+', 0, @Sm output, null, null ';
  DM.Qr.Open;

  lbTest.Caption:=CurrToStr(DM.Qr.FieldByName('Prize').AsCurrency)+' '+BonusStr(DM.Qr.FieldByName('Prize').AsCurrency,'');
//  bbTest.Left:=lbTest.Left+lbTest.Width+5;

  DM.Qr.Close;
  DM.Qr.SQL.Text:='declare @Sm numeric(12,2) exec spY_ArmourResults '+IntToStr(Prm.ID_Gamma)+', 0, @Sm output, null, null ';
  DM.Qr.Open;


  lbArmour.Caption:=CurrToStr(DM.Qr.FieldByName('Prize').AsCurrency)+' '+BonusStr(DM.Qr.FieldByName('Prize').AsCurrency,'');
 end;

procedure TPiggyBankF.FilterSpisAkcii;
var id_prior,id_status:Integer;
    D1,D2:TDateTime;
    sD1,sD2:String;
 begin

  if cbPrior.ItemIndex<0 then id_prior:=0 else id_prior:=aID[cbPrior.ItemIndex];
  if cbStatus.ItemIndex<0 then id_status:=0 else id_status:=cbStatus.ItemIndex;

  D1:=StrToDateTime('01.'+LeadZero(ComboBox2.ItemIndex+1)+'.'+IntToStr(UpDown1.Position)+' 00:00:00');
  D2:=EndOfTheMonth(D1);

  if CheckBox1.Checked then
   begin
    sD1:=''''+FormatDateTime('yyyy-mm-dd',D1)+'''';
    sD2:=''''+FormatDateTime('yyyy-mm-dd',D2+1)+'''';
   end else begin
             sD1:='null';
             sD2:='null';
            end;

  DM.qrASpis.Close;
  DM.qrASpis.SQL.Text:='spY_GetSumBonusAll_End '+IntToStr(Prm.ID_Gamma)+','+sD1+','+sD2+',1,0,0,'+IntToStr(id_prior)+','+IntToStr(id_status);
//  DM.qrASpis.SQL.SaveToFile('C:\log\ASpis.txt');
  DM.qrASpis.Open;
 end;

procedure TPiggyBankF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TPiggyBankF.ShowAkciiStat(id_p:Integer; IsAll:Byte; D1,D2:TDateTime);
var sD1,sD2:String;
    KolPlan,KolRest,KolRestApt:Currency;

 begin

  if IsAll=0 then
   begin
    sD1:=''''+FormatDateTime('yyyy-mm-dd',D1)+'''';
    sD2:=''''+FormatDateTime('yyyy-mm-dd',D2)+'''';
   end else begin
             sD1:='null';
             sD2:='null';
            end;

  AkciiStatF:=TAkciiStatF.Create(Self);
  try
   DM.qrAStatD.Close;
   Case id_p of
    1:begin
       DM.qrAStatD.SQL.Text:='declare @Sm numeric(12,2) exec spY_ArmourResults '+IntToStr(Prm.ID_Gamma)+', 1, @Sm output ,'+sD1+','+sD2;

       DM.qrAStatD1.Close;
       DM.qrAStatD1.SQL.Text:='declare @Sm numeric(12,2) exec spY_ArmourResults '+IntToStr(Prm.ID_Gamma)+', 2, @Sm output, '+sD1+','+sD2;
       DM.qrAStatD1.Open;

      end;

    3,4,5,6:DM.qrAStatD.SQL.Text:='exec spY_AkciiStatDetail '+
                                   DM.qrASpis.FieldByName('id_p').AsString+','+
                                   DM.qrASpis.FieldByName('id').AsString+','+sD1+','+sD2+','+
                                   IntToStr(Prm.ID_Gamma);

    7:DM.qrAStatD.SQL.Text:='declare @Sm numeric(12,2) exec spY_TestResult '+IntToStr(Prm.ID_Gamma)+', 1, @Sm output, '+sD1+','+sD2;

    9:DM.qrAStatD.SQL.Text:='declare @Sm numeric(12,2) exec spY_RegCardsResults '+IntToStr(Prm.ID_Gamma)+', 1, @Sm output, '+sD1+','+sD2;

   end;
//   DM.qrAStatD.SQL.SaveToFile('C:\log\stat.txt');
   DM.qrAStatD.Open;

   Case id_p of
    1:begin
       AkciiStatF.lbSumAll.Caption:= 'Всего : '+CurrToStr(DM.qrAStatD.FieldByName('SummAll').AsCurrency)+' '+BonusStr(DM.qrAStatD.FieldByName('SummAll').AsCurrency,'');
       AkciiStatF.lbSumAll1.Caption:='Всего : '+CurrToStr(DM.qrAStatD1.FieldByName('SummAll').AsCurrency)+' '+BonusStr(DM.qrAStatD1.FieldByName('SummAll').AsCurrency,'');
      end;
    3:begin
       DM.QrEx.Close;
       DM.QrEx.SQL.Text:='exec spY_AckiiStat '+DM.qrASpis.FieldByName('id').AsString+','+IntToStr(Prm.ID_Gamma)+','+IntToStr(id_p)+','+sD1+','+sD2;
       DM.QrEx.Open;

       AkciiStatF.Label36.Caption:=CurrToStr(DM.QrEx.FieldByName('Prc').AsCurrency);
       AkciiStatF.Label38.Caption:=CurrToStr(DM.QrEx.FieldByName('Kol').AsCurrency);

       KolRest:=KolPlan-DM.QrEx.FieldByName('Kol').AsCurrency;
       if KolRest<0 then KolRest:=0;
       AkciiStatF.Label89.Caption:=CurrToStr(KolRest);

      end;
    4:AkciiStatF.lbSumBonusAll4.Caption:='Всего : '+CurrToStr(DM.qrAStatD.FieldByName('SummAll').AsCurrency)+' '+BonusStr(DM.qrAStatD.FieldByName('SummAll').AsCurrency,'');
    6:AkciiStatF.lbSumBonusAll6.Caption:='Всего : '+CurrToStr(DM.qrAStatD.FieldByName('SummAll').AsCurrency)+' '+BonusStr(DM.qrAStatD.FieldByName('SummAll').AsCurrency,'');
   end;

   AkciiStatF.ID_P:=id_p;
   AkciiStatF.ShowModal;
  finally
   AkciiStatF.Free;
  end;
 end;

procedure TPiggyBankF.DBGrid3DblClick(Sender:TObject);
 begin
{
  if DM.qrASpis.IsEmpty then Exit;
  if DM.qrASpis.FieldByName('id_p').AsInteger<>4 then Exit;
  ShowAkciiStat(DM.qrASpis.FieldByName('id_p').AsInteger);
}
  if DM.qrASpis.IsEmpty then Exit;
  if AnsiUpperCase(GetCompName)='SERGEY' then
   ShowMessage(DM.qrASpis.FieldByName('id').AsString);
 end;

procedure TPiggyBankF.DBGrid1DrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
var db:TDBGrid;
 begin

  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  Case db.DataSource.DataSet.FieldByName('Status').AsInteger of
   0:db.Canvas.Brush.Color:=clLime;
   1:db.Canvas.Brush.Color:=clYellow;
  end;

  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);

 end;

procedure TPiggyBankF.bbTestClick(Sender: TObject);
 begin
  ShowAkciiStat(7,1,0,0);
 end;

procedure TPiggyBankF.bbArmourClick(Sender: TObject);
 begin
  ShowAkciiStat(1,1,0,0);
 end;

procedure TPiggyBankF.BitBtn1Click(Sender: TObject);
begin
 PiggyBankRepF:=TPiggyBankRepF.Create(Self);
 try
  PiggyBankRepF.ShowModal;
 finally
  PiggyBankRepF.Free;
 end;
end;

procedure TPiggyBankF.cbPriorCloseUp(Sender: TObject);
 begin
  FilterSpisAkcii;
 end;

procedure TPiggyBankF.CheckBox1Click(Sender: TObject);
var V:Boolean;
 begin
  V:=TCheckBox(Sender).Checked;
  Panel5.Enabled:=V;
  Label12.Enabled:=V;
  ComboBox2.Enabled:=V;
  Label13.Enabled:=V;
  Edit1.Enabled:=V;
  UpDown1.Enabled:=V;

  FilterSpisAkcii;
 end;

procedure TPiggyBankF.ComboBox2CloseUp(Sender: TObject);
 begin
  FilterSpisAkcii;
 end;

procedure TPiggyBankF.UpDown1Changing(Sender:TObject; var AllowChange:Boolean);
 begin
  FilterSpisAkcii;
 end;

procedure TPiggyBankF.BitBtn3Click(Sender: TObject);
 begin
  FilterSpisAkcii;
 end;

procedure TPiggyBankF.cbStatusCloseUp(Sender: TObject);
 begin
  FilterSpisAkcii;
 end;

procedure TPiggyBankF.BitBtn4Click(Sender: TObject);
 begin
  if DM.qrASpis.IsEmpty then Exit;
  if DM.qrASpis.FieldByName('id_p').AsInteger=5 then Exit;
  ShowAkciiStat(DM.qrASpis.FieldByName('id_p').AsInteger,0,DM.qrASpis.FieldByName('DtStart_').AsDateTime,DM.qrASpis.FieldByName('DtEnd_').AsDateTime);
 end;

procedure TPiggyBankF.DBGrid1DblClick(Sender: TObject);
 begin
  if MainF.Design=False then Exit;
  DM.qrBonusState.Close;
  DM.qrBonusState.SQL.Text:='exec spY_BonusState '+IntToStr(Prm.ID_Gamma);
  DM.qrBonusState.Open;
  BonusStateF:=TBonusStateF.Create(Self);
  try
   BonusStateF.ShowModal;
  finally
   BonusStateF.Free;
  end;
 end;

procedure TPiggyBankF.lbUserDblClick(Sender: TObject);
 begin
  ShowMessageI(Prm.ID_Gamma);
 end;

procedure TPiggyBankF.BitBtn5Click(Sender: TObject);
 begin
  PlanMotivationStatF:=TPlanMotivationStatF.Create(Self);
  try
   Application.ProcessMessages;
   PlanMotivationStatF.ShowModal;
  finally
   PlanMotivationStatF.Free;
  end;
 end;

end.



