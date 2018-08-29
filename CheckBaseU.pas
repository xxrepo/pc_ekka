unit CheckBaseU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ComCtrls, ExtCtrls, Util, Buttons, EKKAU;

type
  TCheckBaseF = class(TForm)
    pn1: TPanel;
    Label1: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label8: TLabel;
    pn2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private

    lb,lb1:Array of TStaticText;

  public
    { Public declarations }
  end;

var
  CheckBaseF: TCheckBaseF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TCheckBaseF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  Caption:=MFC;
  ComboBox2.ItemIndex:=StrToInt(FormatDateTime('mm',Date()))-1;
  ComboBox2Change(ComboBox2);
  dtEnd.Date:=Date;
 end;

procedure TCheckBaseF.ComboBox2Change(Sender: TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    dtStart.Date:=D1;
    dtEnd.Date:=D31;
   end;
 end;

procedure TCheckBaseF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TCheckBaseF.BitBtn1Click(Sender: TObject);
var q,i,dy,maxl,CA:Integer;
 begin
  try
   DM.spY_CheckBase.Close;
   DM.spY_CheckBase.Parameters.ParamValues['@dt7']:=dtStart.Date;
   DM.spY_CheckBase.Parameters.ParamValues['@dt1']:=dtEnd.Date;
   DM.spY_CheckBase.Parameters.ParamValues['@iduser']:=Prm.UserID;
   try
    if MainF.Design then Abort;
    if Not EKKA.fpCashState(0) then Abort;
    DM.spY_CheckBase.Parameters.ParamValues['@idkassa']:=Opt.KassaID;
    DM.spY_CheckBase.Parameters.ParamValues['@sum']:=StrToInt(EKKA.RD_Item[3])*0.01+
                                                     StrToInt(EKKA.RD_Item[6])*0.01-
                                                     StrToInt(EKKA.RD_Item[4])*0.01-
                                                     StrToInt(EKKA.RD_Item[7])*0.01;
   except
    DM.spY_CheckBase.Parameters.ParamValues['@idkassa']:=0;
    DM.spY_CheckBase.Parameters.ParamValues['@sum']:=0;
   end;
   DM.spY_CheckBase.Open;
   q:=0; dy:=18; maxl:=0;
   for i:=Low(lb) to High(lb) do lb[i].Free;
   for i:=Low(lb1) to High(lb1) do lb1[i].Free;
   SetLength(lb,0);    SetLength(lb1,0);
   for i:=1 to DM.spY_CheckBase.RecordCount do
    begin
     if i=1 then DM.spY_CheckBase.First else DM.spY_CheckBase.Next;
     if DM.spY_CheckBase.FieldByName('Descr').AsString='Период' then Continue;
     CA:=High(lb)+1; SetLength(lb,CA+1); SetLength(lb1,CA+1);
     lb[CA]:=TStaticText.Create(Self);
     lb[CA].Parent:=pn2;
     lb[CA].Left:=4;
     lb[CA].BorderStyle:=sbsSunken;
     lb[CA].Top:=q*dy+4;
     lb[CA].Font.Color:=clNavy;
     lb[CA].Caption:=DM.spY_CheckBase.FieldByName('Num').AsString+'. '+DM.spY_CheckBase.FieldByName('Descr').AsString;
     lb[CA].AutoSize:=False;
     lb[CA].Width:=250;

     lb1[CA]:=TStaticText.Create(Self);
     lb1[CA].Parent:=pn2;
     lb1[CA].Left:=lb[CA].Left+lb[CA].Width+1;
     lb1[CA].BorderStyle:=sbsSunken;
     lb1[CA].Top:=q*dy+4;
     lb1[CA].Caption:=DM.spY_CheckBase.FieldByName('Value').AsString;
     if lb1[CA].Caption='OK' then
      begin
       lb1[CA].Font.Style:=[fsBold];
       lb1[CA].Font.Color:=clBlue;
      end else lb1[CA].Font.Color:=clRed;
     if lb1[CA].Width>maxl then maxl:=lb1[CA].Width;
     Inc(q);
    end;
   Height:=q*dy+102;
   Width:=maxl+267;
   Left:=(Screen.Width-Width) div 2;
   Top:=(Screen.Height-Height) div 2;
  except
   on E:Exception do MainF.MessBox('Ошибка расчета: '+E.Message);
  end;
 end;

end.
