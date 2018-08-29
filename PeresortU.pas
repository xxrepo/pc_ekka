unit PeresortU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Util, Grids, DBGrids, DB, ADODB, Buttons, PrintReport,
     ComCtrls;

type
  TPeresortF = class(TForm)
    Panel1: TPanel;
    Label8: TLabel;
    ComboBox2: TComboBox;
    cbYear: TCheckBox;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    dbgNED: TDBGrid;
    Panel3: TPanel;
    Label3: TLabel;
    dbgLT: TDBGrid;
    Panel4: TPanel;
    Label4: TLabel;
    dbgN: TDBGrid;
    dbgL: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    lbKN: TStaticText;
    stKN: TStaticText;
    StaticText3: TStaticText;
    stSN: TStaticText;
    lbKL: TStaticText;
    stKL: TStaticText;
    StaticText7: TStaticText;
    stSL: TStaticText;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    Panel6: TPanel;
    Label6: TLabel;
    DBGrid2: TDBGrid;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    lbSumN1: TLabel;
    lbSumN: TLabel;
    lbSumL: TLabel;
    Label9: TLabel;
    cbPer: TCheckBox;
    Label7: TLabel;
    dtStart: TDateTimePicker;
    Label10: TLabel;
    dtEnd: TDateTimePicker;
    cbChp: TCheckBox;
    procedure FormCreate(Sender:TObject);
    procedure ComboBox2Change(Sender:TObject);
    procedure cbYearClick(Sender:TObject);
    procedure dbgNEDKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure dbgLTKeyDown(Sender:TObject; var Key: Word; Shift:TShiftState);
    procedure dbgNEDDblClick(Sender:TObject);
    procedure dbgLTDblClick(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn3Click(Sender:TObject);
    procedure BitBtn4Click(Sender:TObject);
    procedure BitBtn5Click(Sender:TObject);
    procedure BitBtn7Click(Sender:TObject);
    procedure BitBtn6Click(Sender:TObject);
    procedure BitBtn8Click(Sender:TObject);
    procedure dbgNEDKeyPress(Sender:TObject; var Key:Char);
    procedure dbgLTKeyPress(Sender:TObject; var Key:Char);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure cbPerClick(Sender: TObject);
    procedure dtStartCloseUp(Sender: TObject);
    procedure cbChpClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private

    D1,D31:TDateTime;
    sN,sL:String;
    SumL,SumN:Real;
    FPeriod:Integer;
    FNDS2,FNDS1:String;

    procedure GetDaysOfMonth(M: Integer; Dt: TDateTime; var D1,D31:TDateTime);
    procedure ShowLT(P:Byte=0);
    procedure ShowNED(P:Byte=0);
    procedure EnterKol(Pr:Integer);
    procedure ShowLN(Pr:Integer);
    procedure ClearLN(Pr:Integer);
    procedure ClearStrLN(Pr:Integer);
    procedure ShowPosPer;
    procedure AddPer(Pr:Byte);
    function  IsEdit:Boolean;

  public

    procedure ShowPer;

    property Period:Integer read FPeriod write FPeriod;

  end;

var PeresortF:TPeresortF=nil;

implementation

uses MainU,DataModuleU, ShareU;

{$R *.dfm}

procedure TPeresortF.FormCreate(Sender:TObject);
 begin
  sN:=''; sL:='';
  SumN:=0; SumL:=0;
  Caption:=MFC;
  ComboBox2.ItemIndex:=StrToInt(FormatDateTime('mm',Date()))-1;
  cbPer.Enabled:=(Prm.AptekaID=12);
  cbChp.Visible:=MainF.BaseCHP;
{  if Prm.AptekaID=4 then
   begin
    FNDS1:='2';
    FNDS2:='1,3,4';
   end else begin
             FNDS1:='1,2';
             FNDS2:='3,4';
            end
}
  FNDS1:='1,2';
  FNDS2:='3,4';
 end;

procedure TPeresortF.GetDaysOfMonth(M:Integer; Dt:TDateTime; var D1,D31:TDateTime);
var sY,sM:String;
 begin
  if Not (M  in [1..12]) then M:=StrToInt(FormatDateTime('mm',Dt));
  if M<10 then sM:='0'+IntToStr(M) else sM:=IntToStr(M);
  sY:=FormatDateTime('yyyy',Dt);
  D1:=StrToDate('01.'+sM+'.'+sY)+StrToTime('00:00:00');

  if M+1<10 then sM:='0'+IntToStr(M+1) else sM:=IntToStr(M+1);
  if M=12 then D31:=StrToDate('31.12.'+sY)+StrToTime('23:59:59')
          else D31:=StrToDate('01.'+sM+'.'+sY)-1+StrToTime('23:59:59');
 end;

procedure TPeresortF.ShowLT(P:Byte=0);
var AC:Integer;
 begin
  try
   AC:=-1;
   if Not (DM.qrLTList.IsEmpty) then AC:=DM.qrLTList.FieldByName('art_code').AsInteger;
   DM.qrLTList.Close;
   DM.qrLTList.SQL.Clear;
   DM.qrLTList.SQL.Add('select art_code,names,Sum(kol)                                                          ');
   DM.qrLTList.SQL.Add('-IsNull((select Sum(kol) from Inform..TmpLN where priznak=2 and a.art_code=art_code and ');
   DM.qrLTList.SQL.Add('        a.cena=cena and                                               ');
   DM.qrLTList.SQL.Add('    DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and                           ');
   DM.qrLTList.SQL.Add('    DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59''),0)                         ');
   DM.qrLTList.SQL.Add('-IsNull((select Sum(kol) from Inform..DHPER where priznak=2 and a.art_code=art_code and ');
   DM.qrLTList.SQL.Add('        a.cena=cena and                                               ');
   DM.qrLTList.SQL.Add('    DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and                           ');
   DM.qrLTList.SQL.Add('    DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59''),0)                         ');
   DM.qrLTList.SQL.Add('-IsNull((select Sum(kol) from Inform..DTPER where a.art_code=art_code and               ');
   DM.qrLTList.SQL.Add('        a.cena=cena and                                               ');
   DM.qrLTList.SQL.Add('        idper in (select idper from Inform..DHPER where priznak=1 and                   ');
   DM.qrLTList.SQL.Add('    DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and                           ');
   DM.qrLTList.SQL.Add('    DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59'')),0)                         ');
   DM.qrLTList.SQL.Add(' as kol,cena');
   DM.qrLTList.SQL.Add('from Inform..DtLT a');
   DM.qrLTList.SQL.Add('where iddoc in (select iddoc from Inform..DhLT where date_nakl>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and ');
   DM.qrLTList.SQL.Add('                                                     date_nakl<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59'')');

   if cbChp.Checked then
    DM.qrLTList.SQL.Add(' and art_code in (select art_code from SprTov where f_nds in ('+FNDS2+') group by art_code)')
   else
    DM.qrLTList.SQL.Add(' and art_code in (select art_code from SprTov where f_nds in ('+FNDS1+') group by art_code)');


   Case Period of
    P_MONTH:DM.qrLTList.SQL.Add(' and a.iddoc in (select iddoc from Inform..DhLT where id_user<>9999)                 ');
    P_PEREUCHET:DM.qrLTList.SQL.Add(' and a.iddoc in (select iddoc from Inform..DhLT where id_user=9999)              ');
   end;
   DM.qrLTList.SQL.Add('group by art_code,names,cena');
   DM.qrLTList.SQL.Add('having (Sum(kol)                                                                        ');
   DM.qrLTList.SQL.Add('-IsNull((select Sum(kol) from Inform..TmpLN where priznak=2 and a.art_code=art_code and ');
   DM.qrLTList.SQL.Add('        a.cena=cena and                                               ');
   DM.qrLTList.SQL.Add('    DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and                           ');
   DM.qrLTList.SQL.Add('    DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59''),0)                         ');
   DM.qrLTList.SQL.Add('-IsNull((select Sum(kol) from Inform..DHPER where priznak=2 and a.art_code=art_code and ');
   DM.qrLTList.SQL.Add('        a.cena=cena and                                               ');
   DM.qrLTList.SQL.Add('    DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and                           ');
   DM.qrLTList.SQL.Add('    DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59''),0)                         ');
   DM.qrLTList.SQL.Add('-IsNull((select Sum(kol) from Inform..DTPER where a.art_code=art_code and               ');
   DM.qrLTList.SQL.Add('        a.cena=cena and                                               ');
   DM.qrLTList.SQL.Add('        idper in (select idper from Inform..DHPER where priznak=1  and                  ');
   DM.qrLTList.SQL.Add('    DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and                           ');
   DM.qrLTList.SQL.Add('    DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59'')),0)                        ');
   DM.qrLTList.SQL.Add(')>0');
   DM.qrLTList.SQL.Add('order by names');
//   DM.qrLTList.SQL.SaveToFile('C:\Lt.txt');
   DM.qrLTList.Open;
   DM.qrLTList.Locate('art_code',AC,[]);
   ShowLN(2);
  except
   on E:Exception do
    begin
     if P=1 then raise;
     MainF.MessBox('Ошибка формирования списка лишнего товара: '+E.Message);
    end;
  end;
 end;

procedure TPeresortF.ShowNED(P:Byte=0);
var AC:Integer;
 begin
  try
   AC:=-1;
   if Not (DM.qrNEDList.IsEmpty) then AC:=DM.qrNEDList.FieldByName('art_code').AsInteger;
   DM.qrNEDList.Close;
   DM.qrNEDList.SQL.Clear;
   DM.qrNEDList.SQL.Add('select a.art_code,a.names,Sum(b.kol)                                                    ');
   DM.qrNEDList.SQL.Add('-IsNull((select Sum(kol) from Inform..TmpLN where priznak=1 and a.art_code=art_code and ');
   DM.qrNEDList.SQL.Add('        b.cena=cena and                                               ');
   DM.qrNEDList.SQL.Add('    DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and                           ');
   DM.qrNEDList.SQL.Add('    DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59''),0)                         ');
   DM.qrNEDList.SQL.Add('-IsNull((select Sum(kol) from Inform..DHPER where priznak=1 and a.art_code=art_code and ');
   DM.qrNEDList.SQL.Add('        b.cena=cena and                                               ');
   DM.qrNEDList.SQL.Add('    DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and                           ');
   DM.qrNEDList.SQL.Add('    DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59''),0)                         ');
   DM.qrNEDList.SQL.Add('-IsNull((select Sum(kol) from Inform..DTPER where a.art_code=art_code and               ');
   DM.qrNEDList.SQL.Add('        b.cena=cena and                                               ');
   DM.qrNEDList.SQL.Add('        idper in (select idper from Inform..DHPER where priznak=2 and                   ');
   DM.qrNEDList.SQL.Add('    DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and                           ');
   DM.qrNEDList.SQL.Add('    DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59'')),0)                        ');
   DM.qrNEDList.SQL.Add(' as kol,b.cena                                                                          ');
   DM.qrNEDList.SQL.Add('from SprTov a, Moves b                                                                  ');
   DM.qrNEDList.SQL.Add('where a.kod_name=b.kod_name and                                                         ');
   DM.qrNEDList.SQL.Add('      b.debcrd=2 and                                                                    ');
   DM.qrNEDList.SQL.Add('      b.iddoc in (select iddoc from JMoves where priznak=9) and                         ');
   DM.qrNEDList.SQL.Add('      b.date_nakl>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and                 ');
   DM.qrNEDList.SQL.Add('      b.date_nakl<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59''                    ');

   if cbChp.Checked then
    DM.qrNEDList.SQL.Add(' and a.f_nds in ('+FNDS2+')')
   else
    DM.qrNEDList.SQL.Add(' and a.f_nds in ('+FNDS1+')');

   Case Period of
    P_MONTH:DM.qrNEDList.SQL.Add(' and b.iddoc in (select iddoc from JMoves where id_user<>9999)                 ');
    P_PEREUCHET:DM.qrNEDList.SQL.Add(' and b.iddoc in (select iddoc from JMoves where id_user=9999)              ');
   end;
   DM.qrNEDList.SQL.Add('group by a.art_code,a.names,b.cena                                                      ');
   DM.qrNEDList.SQL.Add('having (Sum(b.kol)                                                                      ');
   DM.qrNEDList.SQL.Add('-IsNull((select Sum(kol) from Inform..TmpLN where priznak=1 and a.art_code=art_code and ');
   DM.qrNEDList.SQL.Add('        b.cena=cena and                                               ');
   DM.qrNEDList.SQL.Add('    DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and                           ');
   DM.qrNEDList.SQL.Add('    DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59''),0)                         ');
   DM.qrNEDList.SQL.Add('-IsNull((select Sum(kol) from Inform..DHPER where priznak=1 and a.art_code=art_code and ');
   DM.qrNEDList.SQL.Add('        b.cena=cena and                                               ');
   DM.qrNEDList.SQL.Add('    DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and                           ');
   DM.qrNEDList.SQL.Add('    DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59''),0)                         ');
   DM.qrNEDList.SQL.Add('-IsNull((select Sum(kol) from Inform..DTPER where a.art_code=art_code and               ');
   DM.qrNEDList.SQL.Add('        b.cena=cena and                                               ');
   DM.qrNEDList.SQL.Add('        idper in (select idper from Inform..DHPER where priznak=2 and                   ');
   DM.qrNEDList.SQL.Add('    DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and                           ');
   DM.qrNEDList.SQL.Add('    DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59'')),0)                        ');
   DM.qrNEDList.SQL.Add(')>0');
   DM.qrNEDList.SQL.Add('order by a.names');
   DM.qrNEDList.ExecSQL;
   DM.qrNEDList.Open;
   DM.qrNEDList.Locate('art_code',AC,[]);
   ShowLN(1);
  except
   on E:Exception do
    begin
     if P=1 then raise;
     MainF.MessBox('Ошибка формирования списка по недостаче: '+E.Message);
    end;
  end;
 end;

procedure TPeresortF.ComboBox2Change(Sender:TObject);
 begin
  if ComboBox2.ItemIndex=-1 then Exit;
  if cbPer.Checked then
   begin
    D1:=dtStart.Date;
    D31:=dtEnd.Date;
   end else
  if cbYear.Checked then GetDaysOfMonth(ComboBox2.ItemIndex+1,Date-365,D1,D31)
                    else GetDaysOfMonth(ComboBox2.ItemIndex+1,Date,D1,D31);
  Label1.Caption:='С '+DateToStr(D1)+' по '+DateToStr(D31);
  dtStart.Date:=D1;
  dtEnd.Date:=D31;
  ShowNED;
  ShowLT;
  ShowPosPer;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select Sum(b.kol*b.cena) as Sm from SprTov a, Moves b                                   ');
   DM.Qr.SQL.Add('where a.kod_name=b.kod_name and                                                         ');

   if cbChp.Checked then
    DM.Qr.SQL.Add(' a.f_nds in ('+FNDS2+') and ')
   else
    DM.Qr.SQL.Add(' a.f_nds in ('+FNDS1+') and ');

   DM.Qr.SQL.Add('      b.debcrd=2 and                                                                    ');
   DM.Qr.SQL.Add('      b.iddoc in (select iddoc from JMoves where priznak=9) and                         ');
   DM.Qr.SQL.Add('      b.date_nakl>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and                 ');
   DM.Qr.SQL.Add('      b.date_nakl<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59''                    ');
   Case Period of
    P_MONTH:DM.Qr.SQL.Add(' and b.iddoc in (select iddoc from JMoves where id_user<>9999)                 ');
    P_PEREUCHET:DM.Qr.SQL.Add(' and b.iddoc in (select iddoc from JMoves where id_user=9999)              ');
   end;
   DM.Qr.Open;
   SumN:=DM.Qr.FieldByName('Sm').AsFloat;
   lbSumN.Caption:=CurrToStrF(SumN,ffFixed,2)+' грн.';
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select Sum(kol*cena) as Sm from Inform..DtLT a');
   DM.Qr.SQL.Add('where iddoc in (select iddoc from Inform..DhLT where date_nakl>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and ');
   DM.Qr.SQL.Add('                                                     date_nakl<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59'')');

   if cbChp.Checked then
    DM.Qr.SQL.Add(' and a.art_code in (select art_code from SprTov where f_nds in ('+FNDS2+') group by art_code)')
   else
    DM.Qr.SQL.Add(' and a.art_code in (select art_code from SprTov where f_nds in ('+FNDS1+') group by art_code)');

   Case Period of
    P_MONTH:DM.Qr.SQL.Add(' and a.iddoc in (select iddoc from Inform..DhLT where id_user<>9999)                 ');
    P_PEREUCHET:DM.Qr.SQL.Add(' and a.iddoc in (select iddoc from Inform..DhLT where id_user=9999)              ');
   end;
   DM.Qr.Open;
   SumL:=DM.Qr.FieldByName('Sm').AsFloat;
   lbSumL.Caption:=CurrToStrF(SumL,ffFixed,2)+' грн.';
  except
   on E:Exception do MainF.MessBox('Ошибка подсчета сумм по недостаче и лишнему товару: '+E.Message);
  end;
 end;

procedure TPeresortF.cbYearClick(Sender: TObject);
 begin
  ComboBox2Change(Sender);
 end;

procedure TPeresortF.ShowLN(Pr:Integer);
var Qr:TADOQuery;
    Rc,AC:Integer;
    dbg:TDBGrid;
 begin
  try
   Case Pr of
    1:begin
       Qr:=DM.qrN1;
       dbg:=dbgN;
      end;
    2:begin
       Qr:=DM.qrL1;
       dbg:=dbgL;
      end else Exit;
   end;
   AC:=-1;
   if Not (Qr.IsEmpty) then AC:=Qr.FieldByName('art_code').AsInteger;
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select IsNull(Sum(kol),0) as SmKol,IsNull(Sum(kol*cena),0) as Summa from Inform..TmpLN');
   DM.Qr.SQL.Add('where Priznak='+IntToStr(Pr)+' and Period='+IntToStr(Period)+' and ');
   DM.Qr.SQL.Add('    DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and   ');
   DM.Qr.SQL.Add('    DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59'' ');
   if cbChp.Checked then
    DM.Qr.SQL.Add(' and art_code in (select art_code from SprTov where f_nds in ('+FNDS2+') group by art_code)')
   else
    DM.Qr.SQL.Add(' and art_code in (select art_code from SprTov where f_nds in ('+FNDS1+') group by art_code)');
   DM.Qr.Open;
   Case Pr of
    1:begin
       stKN.Caption:=DM.Qr.FieldByName('SmKol').AsString;
       stSN.Caption:=CurrToStrF(DM.Qr.FieldByName('Summa').AsFloat,ffFixed,2);
      end;
    2:begin
       stKL.Caption:=DM.Qr.FieldByName('SmKol').AsString;
       stSL.Caption:=CurrToStrF(DM.Qr.FieldByName('Summa').AsFloat,ffFixed,2);
      end;
   end;
   if stKN.Caption<>stKL.Caption then
    begin
     stKN.Font.Color:=clRed;
     stKL.Font.Color:=clRed;
     lbKN.Font.Color:=clRed;
     lbKL.Font.Color:=clRed;
    end else begin
              stKN.Font.Color:=clBlue;
              stKL.Font.Color:=clBlue;
              lbKN.Font.Color:=clBlue;
              lbKL.Font.Color:=clBlue;
             end;
   Qr.Close;
   Qr.SQL.Clear;
   Qr.SQL.Add('select row_id,art_code,names,kol,cena from Inform..TmpLN');
   Qr.SQL.Add('where Priznak='+IntToStr(Pr)+' and Period='+IntToStr(Period)+' and ');
   Qr.SQL.Add('    DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and   ');
   Qr.SQL.Add('    DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59'' ');

   if cbChp.Checked then
    Qr.SQL.Add(' and art_code in (select art_code from SprTov where f_nds in ('+FNDS2+') group by art_code)')
   else
    Qr.SQL.Add(' and art_code in (select art_code from SprTov where f_nds in ('+FNDS1+') group by art_code)');

   Qr.SQL.Add('order by names');
   Qr.Open;
   Qr.Locate('Art_Code',AC,[]);
   Rc:=Qr.RecordCount;
   if Rc<=1 then dbg.Height:=41 else if Rc>=4 then dbg.Height:=95 else dbg.Height:=Rc*18+23;
  except
   on E:Exception do MainF.MessBox('Ошибка чтения сопоставлений пересорта: '+E.Message);
  end;
 end;

procedure TPeresortF.EnterKol(Pr:Integer);
var Art_Code,id_zam,Kol:Integer;
    Ds:TDataSet;
    UpdateOnly:Boolean;
 begin
  if IsEdit=False then Exit;
  Case Pr of
   1:Ds:=dbgNED.DataSource.DataSet;
   2:Ds:=dbgLT.DataSource.DataSet else Exit
  end;
  if Ds.IsEmpty then Exit;
  UpdateOnly:=False;
  Case Pr of
   1:if (DM.qrL1.RecordCount>1) and (DM.qrN1.RecordCount>=1) then UpdateOnly:=True;
   2:if (DM.qrN1.RecordCount>1) and (DM.qrL1.RecordCount>=1) then UpdateOnly:=True;
  end;
  Art_Code:=Ds.FieldByName('Art_Code').AsInteger;
  Kol:=MainF.GetKolFromDialog(Ds.FieldByName('Names').AsString,1,Art_Code,id_zam,EN_SIMPLE);
  if Kol<=0 then Exit;
  if Kol>Ds.FieldByName('kol').AsInteger then
   begin
    MainF.MessBox('Количество превышает имеющийся остаток!');
    Exit;
   end;
  DM.ADOCo.BeginTrans;
  try
   DM.spY_EnterLN.Close;
   DM.spY_EnterLN.Parameters.ParamValues['@dt1']:=D1;
   DM.spY_EnterLN.Parameters.ParamValues['@dt31']:=D31;
   DM.spY_EnterLN.Parameters.ParamValues['@ac']:=Ds.FieldByName('art_code').AsInteger;
   DM.spY_EnterLN.Parameters.ParamValues['@nm']:=Ds.FieldByName('names').AsString;
   DM.spY_EnterLN.Parameters.ParamValues['@kl']:=Kol;
   DM.spY_EnterLN.Parameters.ParamValues['@cn']:=Ds.FieldByName('cena').AsFloat;
   DM.spY_EnterLN.Parameters.ParamValues['@pr']:=Pr;
   DM.spY_EnterLN.Parameters.ParamValues['@per']:=Period;
   DM.spY_EnterLN.Parameters.ParamValues['@UpOnly']:=BoolToInt(UpdateOnly);
   DM.spY_EnterLN.ExecProc;
   if DM.spY_EnterLN.Parameters.ParamValues['@RETURN_VALUE']<>999 then Abort;
   Case Pr of
    1:ShowNED(1);
    2:ShowLT(1);
   end;
   DM.ADOCo.CommitTrans;
  except
   on E:Exception do
    begin
     DM.ADOCo.RollBackTrans;
     MainF.MessBox('Ошибка добаления позиции: '+E.Message);
    end; 
  end;
 end;

procedure TPeresortF.ClearLN(Pr:Integer);
 begin
  if IsEdit=False then Exit;
  if Not Pr in [1,2] then Exit;
  Case Pr of
   1:if DM.qrN1.IsEmpty then Exit;
   2:if DM.qrL1.IsEmpty then Exit;
  end;
  if MainF.MessBox('Вы действительно хотите очистить список сопоставлений пересорта?',52)<>ID_YES then Exit;
  DM.ADOCo.BeginTrans;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('delete from Inform..TmpLN where priznak='+IntToStr(Pr)+' and Period='+IntToStr(Period)+' and ');
   DM.QrEx.SQL.Add('dt1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and');
   DM.QrEx.SQL.Add('dt1<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59'' ');
   DM.QrEx.ExecSQL;
   Case Pr of
    1:ShowNED(1);
    2:ShowLT(1);
   end;
   DM.ADOCo.CommitTrans;
  except
   on E:Exception do
    begin
     DM.ADOCo.RollBackTrans;
     MainF.MessBox('Ошибка очистки списка: '+E.Message);
    end;
  end;
 end;

procedure TPeresortF.ClearStrLN(Pr:Integer);
var Qr:TADOQuery;
 begin
  if IsEdit=False then Exit;
  Qr:=Nil;
  if Not Pr in [1,2] then Exit;
  Case Pr of
   1:Qr:=DM.qrN1;
   2:Qr:=DM.qrL1;
  end;
  if Qr.IsEmpty then Exit;
  if MainF.MessBox('Удалить позицию "'+Qr.FieldbyName('Names').AsString+'" из сопоставлений пересорта?',52)<>ID_YES then Exit;
  DM.ADOCo.BeginTrans;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='delete from Inform..TmpLN where row_id='+Qr.FieldbyName('ROW_ID').AsString;
   DM.QrEx.ExecSQL;
   Case Pr of
    1:ShowNED(1);
    2:ShowLT(1);
   end;
   DM.ADOCo.CommitTrans;
  except
   on E:Exception do
    begin
     DM.ADOCo.RollBackTrans;
     MainF.MessBox('Ошибка очистки списка: '+E.Message);
    end; 
  end;
 end;

procedure TPeresortF.ShowPer;
 begin
  if DM.qrPPer.IsEmpty then Exit;
  try
   DM.qrPer.Close;
   DM.qrPer.SQL.Text:='select idper,art_code,names,kol,cena,kol*cena as Summa from Inform..DTPER where IDPER='+DM.qrPPer.FieldByName('IDPER').AsString+' order by names';
   DM.qrPer.Open;
  except
   on E:Exception do
    MainF.MessBox('Ошибка чтения списка позиций пересорта: '+E.Message);
  end;
 end;

procedure TPeresortF.ShowPosPer;
var IP:Integer;
 begin
  try

   IP:=-1;
   DM.qrPer.Close;
   if Not DM.qrPPer.IsEmpty then IP:=DM.qrPPer.FieldByName('IDPER').AsInteger;

   DM.qrPPer.Close;
   DM.qrPPer.SQL.Clear;
   DM.qrPPer.SQL.Add('select idper,art_code,names,kol,cena,kol*cena as Summa from Inform..DHPER');
   DM.qrPPer.SQL.Add('where DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and  Period='+IntToStr(Period)+' and ' );
   DM.qrPPer.SQL.Add('      DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59'' ');

   if cbChp.Checked then
    DM.qrPPer.SQL.Add(' and art_code in (select art_code from SprTov where f_nds in ('+FNDS2+') group by art_code)')
   else
    DM.qrPPer.SQL.Add(' and art_code in (select art_code from SprTov where f_nds in ('+FNDS1+') group by art_code)');

   DM.qrPPer.SQL.Add('order by names');
   DM.qrPPer.Open;
   DM.qrPPer.Locate('IDPER',IP,[]);
   ShowPer;

  except
   on E:Exception do
    MainF.MessBox('Ошибка чтения списка позиций пересорта: '+E.Message);
  end;
 end;

procedure TPeresortF.AddPer(Pr:Byte);
 begin
  DM.ADOCo.BeginTrans;
  try

   DM.spY_AddPeresort.Close;
   DM.spY_AddPeresort.Parameters.ParamValues['@dt1']:=D1;
   DM.spY_AddPeresort.Parameters.ParamValues['@dt31']:=D31;
   DM.spY_AddPeresort.Parameters.ParamValues['@pr']:=Pr;
   DM.spY_AddPeresort.Parameters.ParamValues['@per']:=Period;
   DM.spY_AddPeresort.ExecProc;
   if DM.spY_AddPeresort.Parameters.ParamValues['@RETURN_VALUE']<>999 then Abort;

   ShowNED(1);
   ShowLT(1);
   ShowPosPer;
   DM.ADOCo.CommitTrans;
  except
   on E:Exception do
    begin
     DM.ADOCo.RollBackTrans;
     MainF.MessBox('Ошибка записи позиций пересорта: '+E.Message);
    end;
  end;
 end;

procedure TPeresortF.dbgNEDKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key in K_ARROW_KEYS then sN:='';
  if Key=VK_RETURN then EnterKol(1);
 end;

procedure TPeresortF.dbgLTKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key in K_ARROW_KEYS then sL:='';
  if Key=VK_RETURN then EnterKol(2);
 end;

procedure TPeresortF.dbgNEDDblClick(Sender:TObject);
 begin
  EnterKol(1);
 end;

procedure TPeresortF.dbgLTDblClick(Sender:TObject);
 begin
  EnterKol(2);
 end;

procedure TPeresortF.BitBtn1Click(Sender:TObject);
 begin
  ClearLN(1);
 end;

procedure TPeresortF.BitBtn2Click(Sender:TObject);
 begin
  ClearLN(2);
 end;

procedure TPeresortF.BitBtn3Click(Sender:TObject);
 begin
  ClearStrLN(1);
 end;

procedure TPeresortF.BitBtn4Click(Sender:TObject);
 begin
  ClearStrLN(2);
 end;

procedure TPeresortF.BitBtn5Click(Sender:TObject);
var Pr,i:Integer;
    Sum1,Sum2:Real;
 begin
  if IsEdit=False then Exit;
  if DM.qrN1.RecordCount=1 then Pr:=1 else
  if DM.qrL1.RecordCount=1 then Pr:=2 else Exit;
  if stKN.Caption<>stKL.Caption then
   begin
    Sum1:=0;
    DM.Qr.Close;
    DM.Qr.SQL.Clear;
    DM.Qr.SQL.Add('select kol,convert(numeric(5),IsNull((select Max(koef) from Inform..SprKoef s where s.art_code=a.art_code),1)) as Koef, ');
    DM.Qr.SQL.Add('       convert(numeric(5),IsNull((select Max(upak) from Inform..SprKoef ss where ss.art_code=a.art_code),1)) as Upak from Inform..TmpLN a');
    DM.Qr.SQL.Add('where Priznak=1 and Period='+IntToStr(Period)+' and ');
    DM.Qr.SQL.Add('    DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and   ');
    DM.Qr.SQL.Add('    DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59'' ');

    if cbChp.Checked then
     DM.Qr.SQL.Add(' and a.art_code in (select art_code from SprTov where f_nds in ('+FNDS2+') group by art_code)')
    else
     DM.Qr.SQL.Add(' and a.art_code in (select art_code from SprTov where f_nds in ('+FNDS1+') group by art_code)');

    DM.Qr.Open;
    for i:=1 to DM.Qr.RecordCount do
     begin
      if i=1 then DM.Qr.First else DM.Qr.Next;
      Sum1:=Sum1+DM.Qr.FieldByName('Kol').AsFloat/GetKoef(DM.Qr.FieldByName('Koef').AsInteger,DM.Qr.FieldByName('Upak').AsInteger);
     end;
    Sum2:=0;
    DM.Qr.Close;
    DM.Qr.SQL.Clear;
    DM.Qr.SQL.Add('select kol,convert(numeric(5),IsNull((select Max(koef) from Inform..SprKoef s where s.art_code=a.art_code),1)) as Koef, ');
    DM.Qr.SQL.Add('       convert(numeric(5),IsNull((select Max(upak) from Inform..SprKoef ss where ss.art_code=a.art_code),1)) as Upak from Inform..TmpLN a');
    DM.Qr.SQL.Add('where Priznak=2 and Period='+IntToStr(Period)+' and ');
    DM.Qr.SQL.Add('    DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and ');
    DM.Qr.SQL.Add('    DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59'' ');
    if cbChp.Checked then
     DM.Qr.SQL.Add(' and a.art_code in (select art_code from SprTov where f_nds in ('+FNDS2+') group by art_code)')
    else
     DM.Qr.SQL.Add(' and a.art_code in (select art_code from SprTov where f_nds in ('+FNDS1+') group by art_code)');
    DM.Qr.Open;
    for i:=1 to DM.Qr.RecordCount do
     begin
      if i=1 then DM.Qr.First else DM.Qr.Next;
      Sum2:=Sum2+DM.Qr.FieldByName('Kol').AsFloat/GetKoef(DM.Qr.FieldByName('Koef').AsInteger,DM.Qr.FieldByName('Upak').AsInteger);
     end;
    if Sum1<>Sum2 then
     MainF.MessBox('Для того чтобы записать позицию пересорта, обшее количество в правой и левой колонках должно быть одинаковым!')
    else AddPer(Pr);
   end else AddPer(Pr);
 end;

procedure TPeresortF.BitBtn6Click(Sender: TObject);
 begin
  if IsEdit=False then Exit;
  if DM.qrPPer.IsEmpty then Exit;
  DM.ADOCo.BeginTrans;
  try

   DM.spY_EditPeresort.Close;
   DM.spY_EditPeresort.Parameters.ParamValues['@idper']:=DM.qrPPer.FieldByName('IDPER').AsInteger;
   DM.spY_EditPeresort.ExecProc;

   if DM.spY_EditPeresort.Parameters.ParamValues['@RETURN_VALUE']<>999 then Abort;
   ShowNED(1);
   ShowLT(1);
   ShowPosPer;
   DM.ADOCo.CommitTrans;
  except
   on E:Exception do
    begin
     DM.ADOCo.RollBackTrans;
     MainF.MessBox('Ошибка редактирования позиций пересорта: '+E.Message);
    end;
  end;
 end;

procedure TPeresortF.BitBtn7Click(Sender: TObject);
 begin
  if IsEdit=False then Exit;
  if DM.qrPPer.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите удалить позицию пересорта "'+DM.qrPPer.FieldByName('Names').AsString+'"?',52)<>ID_YES then Exit;
  DM.ADOCo.BeginTrans;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('delete from Inform..DHPER where IDPER='+DM.qrPPer.FieldbyName('IDPER').AsString);
   DM.QrEx.SQL.Add('delete from Inform..DTPER where IDPER='+DM.qrPPer.FieldbyName('IDPER').AsString);
   DM.QrEx.ExecSQL;
   ShowNED(1);
   ShowLT(1);
   ShowPosPer;
   DM.ADOCo.CommitTrans;
  except
   on E:Exception do
    begin
     DM.ADOCo.RollBackTrans;
     MainF.MessBox('Ошибка удаления позиции пересорта: '+E.Message);
    end; 
  end;
 end;

function TPeresortF.IsEdit:Boolean;
 begin
  if Not MainF.IsPermit([R_SUPER],P_SILENT) then begin Result:=False; Exit; end;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select convert(datetime,Value) as Value from Spr_Const where Descr=''EndPeriod''';
   DM.Qr.Open;
   if DM.Qr.RecordCount<=0 then Abort;
   if D1>DM.Qr.FieldByName('Value').AsDateTime then Abort;
   Result:=False;
  except
   Result:=True;
  end;
 end;

procedure TPeresortF.BitBtn8Click(Sender:TObject);
var Cl,Rc,i,j,dy:Integer;
    Tb:TTableObj;
    Sm,SumPer,SmN,SmL:Real;
    S:String;
 begin
  try
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Orientation:=O_LANDS;
   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=5;
   PrintRep.Align:=AL_RIGHT;
   PrintRep.LeftMargin:=150;
   PrintRep.RightMargin:=150;
   PrintRep.AddText('Директору '+Prm.FirmNameRU+#10+Prm.BossRod+#10);
   PrintRep.AddText(Prm.AptekaNameRU+#10+'_____________________'+#10#10);
   PrintRep.Align:=AL_CENTER;
   PrintRep.AddText('Служебная записка'+#10);
   PrintRep.Align:=AL_LEFT;
   S:='';
   if Period=P_PEREUCHET then S:=' по переучету ';
   PrintRep.AddText('Прошу учесть данный перечень препаратов как пересорт '+S+' за '+ComboBox2.Text+' '+FormatDateTime('yyyy',D1)+' г.'+#10#10);
   PrintRep.AddText('                                             Недостача                                                                                 Лишний товар'+#10);
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select idper from Inform..DTPER where IDPER in ');
   DM.Qr.SQL.Add('(select idper from Inform..DHPER ');
   DM.Qr.SQL.Add(' where DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and  Period='+IntToStr(Period)+' and ');
   DM.Qr.SQL.Add('       DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59'' ');
   if cbChp.Checked then
    DM.Qr.SQL.Add(' and art_code in (select art_code from SprTov where f_nds in ('+FNDS2+') group by art_code) )')
   else
    DM.Qr.SQL.Add(' and art_code in (select art_code from SprTov where f_nds in ('+FNDS1+') group by art_code) )');
   DM.Qr.Open;
   Rc:=DM.Qr.RecordCount;
   if Rc<=0 then Exit;
   Cl:=11;
   PrintRep.Font.Size:=4;
   PrintRep.Align:=AL_RIGHT;
   PrintRep.AddTable(Cl,Rc+2);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('165,840,165,165,165,30,165,840,165,165,165');

   for i:=1 to Cl do
    begin
     Tb.Cell[i,1].Font.Style:=[fsBold];
     Tb.Cell[i,1].Align:=AL_CENTER;
    end;

   Tb.Cell[1,1].AddText('АртКод');
   Tb.Cell[2,1].AddText('Наменование');
   Tb.Cell[3,1].AddText('Кол-во');
   Tb.Cell[4,1].AddText('Цена');
   Tb.Cell[5,1].AddText('Сумма');
   Tb.Cell[7,1].AddText('АртКод');
   Tb.Cell[8,1].AddText('Наменование');
   Tb.Cell[9,1].AddText('Кол-во');
   Tb.Cell[10,1].AddText('Цена');
   Tb.Cell[11,1].AddText('Сумма');
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select idper,art_code,names,kol,cena,kol*cena as Summa from Inform..DHPER');
   DM.Qr.SQL.Add('where DT1>='''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and  Period='+IntToStr(Period)+' and ');
   DM.Qr.SQL.Add('      DT31<='''+FormatDateTime('yyyy-mm-dd',D31)+' 23:59:59'' ');
   if cbChp.Checked then
    DM.Qr.SQL.Add(' and art_code in (select art_code from SprTov where f_nds in ('+FNDS2+') group by art_code)')
   else
    DM.Qr.SQL.Add(' and art_code in (select art_code from SprTov where f_nds in ('+FNDS1+') group by art_code)');
   DM.Qr.SQL.Add('order by names');
   DM.Qr.Open;
   dy:=2;
   SumPer:=0; SmN:=0; SmL:=0;
   Tb.Cell[6,1].TopBorder:=EMPTY_BORDER;
   for i:=1 to Rc+1 do Tb.Cell[6,i].BottomBorder:=EMPTY_BORDER;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     Tb.Cell[1,dy].AddText(DM.Qr.FieldByName('Art_Code').AsString);
     Tb.Cell[2,dy].Align:=AL_LEFT;
     Tb.Cell[2,dy].AddText(DM.Qr.FieldByName('Names').AsString);
     Tb.Cell[3,dy].AddText(DM.Qr.FieldByName('Kol').AsString);
     Tb.Cell[4,dy].AddText(CurrToStrF(DM.Qr.FieldByName('Cena').AsFloat,ffFixed,2));
     Tb.Cell[5,dy].AddText(CurrToStrF(DM.Qr.FieldByName('Summa').AsFloat,ffFixed,2));
     if dy>2 then
      for j:=1 to Cl do if j<>6 then Tb.Cell[j,dy].TopBorder:=Border(clBlack,5,psSolid);
     DM.QrEx.Close;
     DM.QrEx.SQL.Text:='select idper,art_code,names,kol,cena,kol*cena as Summa from Inform..DTPER where IDPER='+DM.Qr.FieldByName('IDPER').AsString+' order by names';
     DM.QrEx.Open;
     Sm:=0;
     for j:=1 to DM.QrEx.RecordCount do
      begin
       if j=1 then DM.QrEx.First else DM.QrEx.Next;
       Tb.Cell[7,dy].AddText(DM.QrEx.FieldByName('Art_Code').AsString);
       Tb.Cell[8,dy].Align:=AL_LEFT;
       Tb.Cell[8,dy].AddText(DM.QrEx.FieldByName('Names').AsString);
       Tb.Cell[9,dy].AddText(DM.QrEx.FieldByName('Kol').AsString);
       Tb.Cell[10,dy].AddText(CurrToStrF(DM.QrEx.FieldByName('Cena').AsFloat,ffFixed,2));
       Tb.Cell[11,dy].AddText(CurrToStrF(DM.QrEx.FieldByName('Summa').AsFloat,ffFixed,2));
       Sm:=Sm+DM.QrEx.FieldByName('Summa').AsFloat;
       Inc(dy);
      end;
     SmN:=SmN+DM.Qr.FieldByName('Summa').AsFloat;
     SmL:=SmL+Sm;
     if DM.Qr.FieldByName('Summa').AsFloat<Sm then Sm:=DM.Qr.FieldByName('Summa').AsFloat;
     SumPer:=SumPer+Sm;
    end;
   Tb.Cell[1,Rc+2].LeftBorder:=EMPTY_BORDER;
   for i:=1 to Cl do
    begin
     Tb.Cell[i,Rc+2].Font.Style:=[fsBold];
     Tb.Cell[i,Rc+2].RightBorder:=EMPTY_BORDER;
     Tb.Cell[i,Rc+2].BottomBorder:=EMPTY_BORDER;
    end;

   Tb.Cell[1,Rc+2].AddText('Итого');
   Tb.Cell[7,Rc+2].AddText('Итого');

   Tb.Cell[5,Rc+2].AddText(CurrToStrF(SmN,ffFixed,2));
   Tb.Cell[11,Rc+2].AddText(CurrToStrF(SmL,ffFixed,2));

   PrintRep.Font.Size:=5;
   PrintRep.Align:=AL_LEFT;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.AddText(#10+'Недостача: '+CurrToStrF(SumN,ffFixed,2)+' грн.');
   PrintRep.AddText(#10+'Лишний: '+CurrToStrF(SumL,ffFixed,2)+' грн.');
   PrintRep.AddText(#10+'Убрать из недостачи: '+CurrToStrF(SumPer,ffFixed,2)+' грн.');

   PrintRep.Font.Style:=[];
   PrintRep.AddText(#10#10+'Заведующий аптеки:  ______________________                                                                                  '
   +DateTimeToStr(Now));
   PrintRep.AddText(#10#10+'Фармотдел: ______________________________ ');
   PrintRep.AddText(#10#10+'Бухгалтерия: _____________________________ ');
   PrintRep.PreView;
  except
   on E:Exception do
    MainF.MessBox('Ошибка формирования печатной формы Служебной записки : '+E.Message);
  end;
 end;

procedure TPeresortF.dbgNEDKeyPress(Sender: TObject; var Key:Char);
var IsFind:Boolean;
 begin
  if Sender=Nil then Exit;
  MainF.dbGKeyPress(TDBGrid(Sender),Key,sN,1,SC_FIND,1,IsFind);
 end;

procedure TPeresortF.dbgLTKeyPress(Sender:TObject; var Key:Char);
var IsFind:Boolean;
 begin
  if Sender=Nil then Exit;
  MainF.dbGKeyPress(TDBGrid(Sender),Key,sL,1,SC_FIND,1,IsFind);
 end;

procedure TPeresortF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

procedure TPeresortF.cbPerClick(Sender: TObject);
 begin
  ComboBox2Change(Sender);
 end;

procedure TPeresortF.dtStartCloseUp(Sender: TObject);
 begin
  ComboBox2Change(Sender);
 end;

procedure TPeresortF.cbChpClick(Sender: TObject);
 begin
  ComboBox2Change(Sender);
 end;

procedure TPeresortF.FormActivate(Sender: TObject);
 begin
  ComboBox2Change(Sender);
 end;

end.



