unit EditRegU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, ADODB;

type
  TEditRegF = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    Image1: TImage;
    GroupBox1: TGroupBox;
    ed1: TEdit;
    Label1: TLabel;
    Label7: TLabel;
    edd1: TEdit;
    dbg1: TDBGrid;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    ed2: TEdit;
    edd2: TEdit;
    dbg2: TDBGrid;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    ed3: TEdit;
    edd3: TEdit;
    dbg3: TDBGrid;
    ep1: TEdit;
    el1: TEdit;
    sbAdd1: TSpeedButton;
    sbDel1: TSpeedButton;
    ep2: TEdit;
    el2: TEdit;
    sbAdd2: TSpeedButton;
    sbDel2: TSpeedButton;
    ep3: TEdit;
    el3: TEdit;
    sbAdd3: TSpeedButton;
    sbDel3: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ed1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edd1KeyPress(Sender: TObject; var Key: Char);
    procedure sbAdd1Click(Sender: TObject);
    procedure sbDel1Click(Sender: TObject);
  private

    FArt_Code:Integer;

    procedure ShowInfoReg(Qr:TADOQuery; NP:Integer);

  public

    property Art_Code:Integer read FArt_Code write FArt_Code;

  end;

var EditRegF:TEditRegF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TEditRegF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC+'  Места хранения';
 end;

procedure TEditRegF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TEditRegF.ed1KeyPress(Sender:TObject; var Key:Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

procedure TEditRegF.BitBtn1Click(Sender: TObject);

 function StrToValue(V:String):String;
  begin
   if (V='0') or (V='') then Result:='null' else Result:=V;
  end;

 Begin
  try
{
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('if (select Count(*) from Inform..SprReg where art_code='+IntToStr(Art_Code)+')<=0');
   if Opt.ShowRegFull then
    begin
     DM.Qr.SQL.Add(' Insert into Inform..SprReg(art_code,P1,P2,P3,P4,P5)');
     DM.Qr.SQL.Add(' Values('+IntToStr(Art_Code)+','+StrToValue(Edit1.Text)+','+StrToValue(Edit2.Text)+','+StrToValue(Edit3.Text)+','+StrToValue(Edit4.Text)+','+StrToValue(Edit5.Text)+')');
    end else begin
              DM.Qr.SQL.Add(' Insert into Inform..SprReg(art_code,P1,P2,P3)');
              DM.Qr.SQL.Add(' Values('+IntToStr(Art_Code)+','+StrToValue(Edit1.Text)+','+StrToValue(Edit2.Text)+','+StrToValue(Edit3.Text)+')');
             end;
   DM.Qr.SQL.Add('else');
   DM.Qr.SQL.Add(' Update Inform..SprReg set ');
   DM.Qr.SQL.Add(' P1='+StrToValue(Edit1.Text)+',');
   DM.Qr.SQL.Add(' P2='+StrToValue(Edit2.Text)+',');
   if Opt.ShowRegFull then
    begin
     DM.Qr.SQL.Add(' P4='+StrToValue(Edit4.Text)+',');
     DM.Qr.SQL.Add(' P5='+StrToValue(Edit5.Text)+',');
    end;
   DM.Qr.SQL.Add(' P3='+StrToValue(Edit3.Text)+'');
   DM.Qr.SQL.Add(' where art_code='+IntToStr(Art_Code));
   DM.Qr.ExecSQL;
}
   DM.Qr.Close;
   DM.Qr.SQL.Clear;

   DM.Qr.SQL.Add('declare @errmsg1234567890_23Qwerty_987654 varchar(max) ');
   DM.Qr.SQL.Add('begin tran ');
   DM.Qr.SQL.Add('begin try ');

   DM.Qr.SQL.Add(' delete from Inform..SprReg where art_code='+IntToStr(Art_Code));
   DM.Qr.SQL.Add(' Insert into Inform..SprReg(art_code,P1,P2,P3,L1,L2,L3)');
   DM.Qr.SQL.Add(' Values('+IntToStr(Art_Code)+','+StrToValue(ed1.Text)+','+StrToValue(ed2.Text)+','+StrToValue(ed3.Text)+','''+edd1.Text+''','''+edd2.Text+''','''+edd3.Text+''')');
   DM.Qr.SQL.Add(' select 999 as Res ');

   DM.Qr.SQL.Add('commit tran ');
   DM.Qr.SQL.Add('end try ');
   DM.Qr.SQL.Add('begin catch ');
   DM.Qr.SQL.Add(' select @errmsg1234567890_23Qwerty_987654=error_message() ');
   DM.Qr.SQL.Add(' raiserror(@errmsg1234567890_23Qwerty_987654, 16, 1) ');
   DM.Qr.SQL.Add(' rollback ');
   DM.Qr.SQL.Add('end catch ');

   DM.Qr.Open;

   if Prm.AptekaID<>303 then  MainF.FilterSklad;
   Close;
  except
   on E:Exception do MainF.MessBox('Ошибка записи в справочник "Места хранения": '+E.Message);
  end;
 End;

procedure TEditRegF.ShowInfoReg(Qr:TADOQuery; NP:Integer);
 begin

  Qr.Close;
  Qr.SQL.Text:='select * from inform..SprRegDop where art_code='+IntToStr(Art_Code)+' and NumPlace='+IntToStr(NP)+' order by Place,DopPlace';
  Qr.Open;
 end;

procedure TEditRegF.FormActivate(Sender: TObject);
 begin
  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select * from inform..SprReg where art_code='+IntToStr(Art_Code);
  DM.QrEx.Open;

  ed1.Text:=DM.QrEx.FieldByName('P1').AsString; edd1.Text:=DM.QrEx.FieldByName('L1').AsString;
  ed2.Text:=DM.QrEx.FieldByName('P2').AsString; edd2.Text:=DM.QrEx.FieldByName('L2').AsString;
  ed3.Text:=DM.QrEx.FieldByName('P3').AsString; edd3.Text:=DM.QrEx.FieldByName('L3').AsString;

  ShowInfoReg(DM.qrRegDop1,1);
  ShowInfoReg(DM.qrRegDop2,2);
  ShowInfoReg(DM.qrRegDop3,3);
 end;

procedure TEditRegF.edd1KeyPress(Sender: TObject; var Key: Char);
 begin
  if Key<>#8 then
   if Key in CH_DIGIT then Key:=#0;
 end;

procedure TEditRegF.sbAdd1Click(Sender: TObject);
var edp,edl:TEdit;
    Tg:Integer;
 begin

  Tg:=TSpeedButton(Sender).Tag;
  edp:=TEdit(FindComponent('ep'+IntToStr(Tg)));
  edl:=TEdit(FindComponent('el'+IntToStr(Tg)));
  if edp.Text='' then
   begin
    MainF.MessBox('Ведите числовое значение в поле номер!');
    edp.SetFocus;
    Exit;
   end;

  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('insert into inform..SprRegDop(art_code,numplace,place,dopplace)');
   DM.QrEx.SQL.Add('values('+IntToStr(Art_code)+', ');
   DM.QrEx.SQL.Add(IntToStr(Tg)+',');
   DM.QrEx.SQL.Add(edp.Text+',');
   DM.QrEx.SQL.Add(''''+edl.Text+''')');
   DM.QrEx.SQL.Add('select 9999 as res');
   DM.QrEx.Open;
   edp.Text:='';
   edl.Text:='';
   Case Tg of
    1:ShowInfoReg(DM.qrRegDop1,Tg);
    2:ShowInfoReg(DM.qrRegDop2,Tg);
    3:ShowInfoReg(DM.qrRegDop3,Tg);
   end;
  except
   on E:Exception do
    begin
     if Pos(AnsiUpperCase('Cannot insert duplicate key'),AnsiUpperCase(E.Message))<>0 then
      MainF.MessBox('Полка с таким номером уже есть!')
     else
      MainF.MessBox('Ошибка добавления номера полки: '+E.Message);
    end;
  end;
 end;

procedure TEditRegF.sbDel1Click(Sender: TObject);
var Qr:TADOQuery;
    Tg:Integer;
 begin
  Tg:=TSpeedButton(Sender).Tag;
  Case Tg of
   1:Qr:=DM.qrRegDop1;
   2:Qr:=DM.qrRegDop2;
   3:Qr:=DM.qrRegDop3;
  end;

  if Qr.IsEmpty then Exit;

  if MainF.MessBox('Вы действительно хотите удалить выбранный номер полки!',52)<>ID_YES then Exit;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('delete from inform..SprRegDop where id='+Qr.FieldByName('id').AsString);
   DM.QrEx.SQL.Add('select 999 as Res ');
   DM.QrEx.Open;
   ShowInfoReg(Qr,Tg);
  except
   on E:Exception do MainF.MessBox('Ошибка удаления номера полки: '+E.Message);
  end;
 end;

end.
