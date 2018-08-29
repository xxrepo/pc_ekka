unit ShowCardInfoU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TShowCardInfoF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbNum: TLabel;
    lbSum: TLabel;
    lbSkd: TLabel;
    lbAdr: TLabel;
    Edit1: TEdit;
    Timer1: TTimer;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
  public
  end;

var ShowCardInfoF:TShowCardInfoF;

implementation

uses DataModuleU, MainU, CardReadU, ShareU;

{$R *.dfm}

procedure TShowCardInfoF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TShowCardInfoF.FormActivate(Sender: TObject);
 begin
  Timer1.Enabled:=True;
  Edit1.SetFocus;
 end;

procedure TShowCardInfoF.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  Timer1.Enabled:=True;
 end;

procedure TShowCardInfoF.Timer1Timer(Sender:TObject);
var sNC,fSkd:String;
    FullSkd:Integer;
    IsLink:Boolean;
    V:Byte;
 begin
  if Edit1.Text='' then Exit;
  lbNum.Caption:='0';
  lbSum.Caption:='0';
  lbSkd.Caption:='0';
  if CheckEANStr(Edit1.Text)<>1 then Exit;
  sNC:=Copy(IntToStr(GetNumCard(Edit1.Text)),3,10);
  lbNum.Caption:=sNC;
  try
   UpdateCardInfo(StrToInt64(sNC),IsLink,V);
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select *,IsNull((select convert(int,SumMonth/5000)),0) as SkdMn from Cards where NumCard='+sNC;
   DM.Qr.Open;
   if Not(DM.Qr.IsEmpty) then
    begin
     DM.QrEx.Close;

     if DM.Qr.FieldByName('TypeCard').AsInteger=1 then
      begin

       fSkd:='SkdNew';
       DM.QrEx.SQL.Text:='select IsNull(Max('+fSkd+'),0)+dbo.GetSkdPlus() as Skd from Skd where type_skd=1 and Summ<='+DM.Qr.FieldByName('Summa').AsString;
       Label4.Caption:='Процент накопления';
       Label5.Visible:=True;
       Label6.Visible:=True;
       Label6.Caption:=CurrToStrF(DM.Qr.FieldByName('AccumSum').AsFloat,ffFixed,2);

      end else begin
                fSkd:='Skd';
                DM.QrEx.SQL.Text:='select IsNull(Max('+fSkd+'),0) as Skd from Skd where type_skd=1 and Summ<='+DM.Qr.FieldByName('Summa').AsString;
                Label4.Caption:='Процент скидки';
                Label5.Visible:=False;
                Label6.Visible:=False;
               end;

     lbSum.Caption:=CurrToStrF(DM.Qr.FieldByName('Summa').AsFloat,ffFixed,2);
     DM.QrEx.Open;
     FullSkd:=DM.QrEx.FieldByName('Skd').AsInteger+DM.Qr.FieldByName('SkdMn').AsInteger;
     if FullSkd>25 then FullSkd:=25;
     lbSkd.Caption:=IntToStr(FullSkd);
    end;
  finally
   Edit1.Text:='';
  end;
 end;

procedure TShowCardInfoF.BitBtn1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TShowCardInfoF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

end.
