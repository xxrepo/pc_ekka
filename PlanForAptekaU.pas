unit PlanForAptekaU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TPlanForAptekaF = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn4: TBitBtn;
    Bevel2: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Bevel3: TBevel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var PlanForAptekaF:TPlanForAptekaF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TPlanForAptekaF.FormCreate(Sender: TObject);
var Sum:Currency;
 begin
  Caption:=MFC;
  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='spY_ShowPlanApteka';
  DM.QrEx.Open;

  Label8.Caption:=DM.QrEx.FieldByName('ѕлан1').AsString+' грн.';
  Label9.Caption:=DM.QrEx.FieldByName('ѕлан2').AsString+' грн.';

  Sum:=DM.QrEx.FieldByName('¬ыручкаƒневных асс').AsCurrency;
  Label10.Caption:=DM.QrEx.FieldByName('¬ыручкаƒневных асс').AsString+' грн.';

  Label11.Caption:=DM.QrEx.FieldByName('ѕроцентƒоѕлана').AsString+' %';
  Label12.Caption:=DM.QrEx.FieldByName('ѕроцентћеждуѕланами').AsString+' %';
  Label13.Caption:=DM.QrEx.FieldByName('ѕроцент—вышеѕлана').AsString+' %';
  Label14.Caption:=DM.QrEx.FieldByName('Ѕонус»того').AsString+' грн.';
  Label21.Caption:=DM.QrEx.FieldByName('ѕроц¬ырƒень').AsString+' %';

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select Koef from KoefZP where id=0';
  DM.QrEx.Open;

  if DM.QrEx.IsEmpty=False then
   begin
    Label15.Visible:=True;
    Label17.Visible:=True;
    Label17.Caption:=CurrToStrF(DM.QrEx.FieldByName('Koef').AsCurrency*Sum,ffFixed,2)+' грн.';
   end;

  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select Koef from KoefZP where id=1';
  DM.QrEx.Open;

  if DM.QrEx.IsEmpty=False then
   begin
    Label16.Visible:=True;
    Label18.Visible:=True;
    Label18.Caption:=CurrToStrF(DM.QrEx.FieldByName('Koef').AsCurrency*Sum,ffFixed,2)+' грн.';
   end;
 end;

procedure TPlanForAptekaF.BitBtn4Click(Sender: TObject);
 begin
  Close;
 end;

end.
