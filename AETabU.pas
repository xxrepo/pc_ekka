unit AETabU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, Util, ExtCtrls, DateUtils, Math;

type
  TSet=Set of Byte;

  TAETabF = class(TForm)
    edStart: TEdit;
    edEnd: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edStMin: TEdit;
    edEndMin: TEdit;
    Label3: TLabel;
    RadioButton4: TRadioButton;
    cbKassa: TComboBox;
    Label4: TLabel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    edDescr: TEdit;
    RadioButton8: TRadioButton;
    Label5: TLabel;
    Edit1: TEdit;
    cbDescr: TComboBox;
    Panel1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    lbHAll: TLabel;
    lbHMn: TLabel;
    Label8: TLabel;
    lbHRest: TLabel;

    procedure FormCreate(Sender:TObject);
    procedure RadioButton1Click(Sender:TObject);
    procedure RadioButton2Click(Sender:TObject);
    procedure RadioButton3Click(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure edStartKeyPress(Sender:TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure edStartKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edEndKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RadioButton4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure cbDescrChange(Sender: TObject);

  private

    FCol:String;
    FCol2:String;
    FRow:Integer;
    FStrTime:String;
    FStrTimeOther:String;
    FID_Role:Integer;
    FIsNight:Boolean;
    FOklad:Boolean;
    FSmena:Byte;
    FID_Type:Integer;
    FTekMinutes:Integer;
    Fidtab:Integer;
    FNumDay:Integer;
    FID_User:Integer;

    function  CheckTime(N:String; S:TSet; P:Byte=0):Boolean;

    procedure SetEnab(V:Boolean);
    procedure SetEnab1(V:Boolean; P:Byte);
    procedure SetTimeOther(const Value: String);
    procedure SetIsNight(const Value: Boolean);

  public

    property StrTimeOther:String read FStrTimeOther write SetTimeOther;
    property StrTime:String read FStrTime write FStrTime;
    property Row:Integer read FRow write FRow;
    property ID_Role:Integer read FID_Role write FID_Role;
    property Col:String read FCol write FCol;
    property Col2:String read FCol2 write FCol2;
    property IsNight:Boolean read FIsNight write SetIsNight;
    property Oklad:Boolean read FOklad write FOklad;
    property Smena:Byte read FSmena write FSmena;
    property ID_Type:Integer read FID_Type write FID_Type;
    property idtab:Integer read Fidtab write Fidtab;
    property NumDay:Integer read FNumDay write FNumDay;
    property ID_User:Integer read FID_User write FID_User;

  end;

var AETabF:TAETabF;

implementation

uses MainU, TableU, DataModuleU, ShareU;

{$R *.dfm}

procedure TAETabF.FormCreate(Sender:TObject);
var i:Integer;
 begin
  Caption:=MFC;
  FOklad:=False;
  cbKassa.Clear;
  cbKassa.Items.Add(' ');
  for i:=Low(TableF.arKassa) to High(TableF.arKassa) do cbKassa.Items.Add(IntToStr(TableF.arKassa[i]));

  if cbKassa.Items.Count=1 then
   for i:=1 to 10 do cbKassa.Items.Add(IntToStr(i));

  cbKassa.ItemIndex:=0;

 end;

procedure TAETabF.RadioButton1Click(Sender:TObject);
 begin
  edStart.Text:='8';
  edEnd.Text:='15';
  edStMin.Text:='00';
  edEndMin.Text:='00';
  edDescr.Text:='';
  cbDescr.ItemIndex:=0;
  SetEnab(True);
 end;

procedure TAETabF.RadioButton2Click(Sender:TObject);
 begin
  edStart.Text:='15';
  edEnd.Text:='21';
  edStMin.Text:='00';
  edEndMin.Text:='00';
  edDescr.Text:='';
  cbDescr.ItemIndex:=0;
  SetEnab(True);
 end;

procedure TAETabF.RadioButton3Click(Sender:TObject);
 begin
  edStart.Text:='21';
  edEnd.Text:='8';
  edStMin.Text:='00';
  edEndMin.Text:='00';
  edDescr.Text:='';
  cbDescr.ItemIndex:=0;
  SetEnab(True);
 end;

procedure TAETabF.RadioButton4Click(Sender:TObject);
 begin
  edStart.Text:='00';
  edEnd.Text:='00';
  edStMin.Text:='00';
  edEndMin.Text:='00';
  edDescr.Text:='Вых.';
  cbDescr.ItemIndex:=0;
  cbKassa.ItemIndex:=-1;
  SetEnab(False);
 end;

procedure TAETabF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TAETabF.edStartKeyPress(Sender:TObject; var Key:Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

function TAETabF.CheckTime(N:String; S:TSet; P:Byte=0):Boolean;
 begin
  try
   if Not(StrToInt(N) in S) then Abort;
   if (P=1) and (StrToInt(N) mod 5<>0) then Abort;
   Result:=True;
  except
   Result:=False;
  end;
 end;

procedure TAETabF.edStartKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key=VK_RETURN then edEnd.SetFocus;
 end;

procedure TAETabF.edEndKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key=VK_RETURN then BitBtn1Click(BitBtn1);
 end;

procedure TAETabF.BitBtn1Click(Sender:TObject);
var Sm1,Sm2,GtOther,Gt:TGrafTime;
    sK,S,Res:String;
 begin
  if Not CheckTime(edStart.Text,[0..23]) then
   begin
    MainF.MessBox('Введите целое числовое значение из интервала [0..23]!');
    edStart.SetFocus;
   end else
  if Not CheckTime(edEnd.Text,[0..23]) then
   begin
    MainF.MessBox('Введите целое числовое значение из интервала [0..23]!');
    edEnd.SetFocus;
   end else
  if Not CheckTime(edStMin.Text,[0..59],1) then
   begin
    MainF.MessBox('Введите целое числовое значение кратное 5-и из интервала [0..59]!');
    edStMin.SetFocus;
   end else
  if Not CheckTime(edEndMin.Text,[0..59],1) then
   begin
    MainF.MessBox('Введите целое числовое значение кратное 5-и из интервала [0..59]!');
    edEndMin.SetFocus;
   end else
  if (ID_Type<=1) and (cbKassa.Text=' ') and (cbKassa.Enabled=True) then
   begin
    MainF.MessBox('Необходимо указать номер кассы!');
    cbKassa.SetFocus;
   end else try
             Gt.tStart:=StrToInt(edStart.Text);
             Gt.tStMin:=StrToInt(edStMin.Text);
             Gt.tEnd:=StrToInt(edEnd.Text);
             Gt.tEndMin:=StrToInt(edEndMin.Text);

             if (id_type in [1,11]) and (RadioButton3.Checked) then
              begin
               DM.Qr1.Close;
               DM.Qr1.SQL.Text:='exec spY_CheckNightSmena_1_11 '+IntToStr(idtab)+','+IntToStr(id_user)+','+IntToStr(id_type)+','+IntToStr(NumDay);
               DM.Qr1.Open;
               if DM.Qr1.FieldByName('Res').AsInteger=1 then
                begin
                 MainF.MessBox('Для администраторов зала ночные часы должны быть либо в графе "Ночная смена" либо "Администратор зала"!');
                 Exit;
                end;
              end;

             if ((RadioButton5.Checked) or (RadioButton2.Checked) or (RadioButton1.Checked)) and (cbDescr.ItemIndex<>7) then
              begin
               if GrafTimeToTime(Gt,0)>GrafTimeToTime(Gt,1) then
                begin
                 MainF.MessBox('Начальное время смены не может быть больше конечного времени смены!');
                 Exit;
                end;

               if (id_type=8) and (MinutesBetween(GrafTimeToTime(Gt,0),GrafTimeToTime(Gt,1))/60+(TableF.SumHClMn-RoundTo(FTekMinutes/60,-1))>TableF.SumHClAll) then
                begin
                 MainF.MessBox('Время на уборку превышает норму часов!');
                 Exit;
                end;

               GtOther:=StrToGrafTime(StrTimeOther);
               if (GrafTimeToTime(GtOther,0)>0) or (GrafTimeToTime(GtOther,1)>0) then
                begin
                 if Smena=1 then
                  begin
                   Sm1:=Gt;
                   Sm2:=GtOther;
                  end else begin
                            Sm2:=Gt;
                            Sm1:=GtOther;
                           end;
                 if (GrafTimeToTime(Sm1,0)>=GrafTimeToTime(Sm2,1)) or
                    (GrafTimeToTime(Sm1,1)>GrafTimeToTime(Sm2,0)) then
                  begin
                   MainF.MessBox('Данный сотрудник уже работает по графику в указанное время в другой смене, либо время первой смены больше времени второй смены!');
                   Exit;
                  end;
                end;
              end;


             if cbKassa.ItemIndex<=0 then sK:='' else sK:=cbKassa.Text;
             Gt.Descr:=edDescr.Text+'#'+sK+'$'+IntToStr(ID_Role);

             if StrToFloat(CorrFloatNum(Edit1.Text))>0 then
              Gt.Descr:=Gt.Descr+'H'+CorrFloatNum(Edit1.Text);
             if (RadioButton4.Checked and (edDescr.Text='')) or RadioButton6.Checked then S:='' else S:=GrafTimeToStr(Gt);

             DM.ADOCo.BeginTrans;
             try
              DM.QrEx.Close;
              DM.QrEx.SQL.Clear;
              DM.QrEx.SQL.Add('declare @B smallint, @B1 smallint ');
              DM.QrEx.SQL.Add('set @B=0  ');
              DM.QrEx.SQL.Add('set @B1=0  ');

              if (FID_Role=1) {and (RadioButton5.Checked or RadioButton1.Checked or RadioButton2.Checked)} then
               begin
                DM.QrEx.SQL.Add('update t set t.'+Col+'=null, t.'+Col2+'=null, IsUnload=0 ');
                DM.QrEx.SQL.Add('from Inform..DtGrafik t, ');
                DM.QrEx.SQL.Add('     Inform..DtGrafik a ');
                DM.QrEx.SQL.Add('where t.idtab=a.idtab and ');
                DM.QrEx.SQL.Add('      t.id_user=a.id_user and ');
                DM.QrEx.SQL.Add('      a.id_type<>7 and t.id_type=7 and (IsNull(t.'+Col+','''')<>'''' or IsNull(t.'+Col2+','''')<>'''') and ');
                DM.QrEx.SQL.Add('      a.row_id='+IntToStr(Row));
                DM.QrEx.SQL.Add('set @B=@@rowcount ');
               end else
              if (FID_Role=4) {and (RadioButton5.Checked or RadioButton1.Checked or RadioButton2.Checked)} then
               begin
                DM.QrEx.SQL.Add('update t set t.'+Col+'=null, t.'+Col2+'=null, IsUnload=0 ');
                DM.QrEx.SQL.Add('from Inform..DtGrafik t, ');
                DM.QrEx.SQL.Add('     Inform..DtGrafik a ');
                DM.QrEx.SQL.Add('where t.idtab=a.idtab and ');
                DM.QrEx.SQL.Add('      a.id_type<>7 and t.id_type=7 and (IsNull(t.'+Col+','''')<>'''' or IsNull(t.'+Col2+','''')<>'''') and ');
                DM.QrEx.SQL.Add('      a.row_id='+IntToStr(Row));
                DM.QrEx.SQL.Add('set @B1=@@rowcount ');
               end;

              DM.QrEx.SQL.Add('Update Inform..DtGrafik set '+Col+'='''+Copy(S,1,40)+''', IsUnload=0 where row_id='+IntToStr(Row));

              DM.QrEx.SQL.Add('Update Inform..DtGrafik set '+Col+'='''+Copy(S,1,40)+''', IsUnload=0 where row_id='+IntToStr(Row));
              DM.QrEx.SQL.Add('Update Inform..DhGrafik set DtEdit=getdate() where idtab=(select idtab from Inform..DtGrafik where row_id='+IntToStr(Row)+')');
              DM.QrEx.SQL.Add('select @B as B, @B1 as B1 ');
              DM.QrEx.Open;
              DM.ADOCo.CommitTrans;

              if DM.QrEx.FieldByName('B').AsInteger>0 then
               MainF.MessBox('Вы изменили время смены сотрудника "'+DM.qrTab.FieldByName('Users').AsString+'" и поэтому смена его старшинства была очищена. Поставтье смену старшинства заново!',
                48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);

              if DM.QrEx.FieldByName('B1').AsInteger>0 then
               MainF.MessBox('Вы изменили время смены заведующего/замзав. и поэтому смены всех старшинств были очищены! Запрещено выставлять старшинство в день когда заведующий или зам зав. на смене!',
                48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);

             except
              DM.ADOCo.RollBackTrans;
              raise;
             end;
             TableF.ShowTab;
             Close;
            except
             on E:Exception do MainF.MessBox('Ошибка записи значения в таблицу "Графики работы сотрудников": '+E.Message);
            end;
 end;

procedure TAETabF.FormActivate(Sender: TObject);
var Gt,Gt1:TGrafTime;
    i,P:Integer;
 begin

  if StrTime<>'' then
   try
    Gt:=StrToGrafTime(StrTime);
    edStart.Text:=IntToStr(Gt.tStart);
    edEnd.Text:=IntToStr(Gt.tEnd);
    edStMin.Text:=IntToStr(Gt.tStMin);
    edEndMin.Text:=IntToStr(Gt.tEndMin);

    //edDescr.Text:=GetDescr(Gt.Descr);

    P:=Pos('H',Gt.Descr);
    if P<>0 then Edit1.Text:=Copy(Gt.Descr,P+1,Length(Gt.Descr)-P);
    cbKassa.ItemIndex:=0;
    if ID_Type<=2 then
     for i:=0 to cbKassa.Items.Count-1 do
      if cbKassa.Items[i]=GetKassa(Gt.Descr) then
       begin
        cbKassa.ItemIndex:=i;
        Break;
       end;

   except
   end;

  if id_type=8 then
   begin
    Height:=323;
    Panel1.Visible:=True;

    FTekMinutes:=MinutesBetween(GrafTimeToTime(Gt,0),GrafTimeToTime(Gt,1));
    lbHAll.Caption:=CurrToStr(TableF.SumHClAll)+' ч.';
    lbHMn.Caption:=CurrToStr(TableF.SumHClMn-RoundTo(FTekMinutes/60,-1))+' ч.';
    lbHRest.Caption:=CurrToStr(TableF.SumHClAll-(TableF.SumHClMn-RoundTo(FTekMinutes/60,-1)))+' ч.';

   end else begin
             Height:=251;
             Panel1.Visible:=False;
            end;
 end;

procedure TAETabF.SetEnab(V:Boolean);
 begin
  edStart.Enabled:=V;
  edEnd.Enabled:=V;
  edStMin.Enabled:=V;
  edEndMin.Enabled:=V;
 // edDescr.Enabled:=V;
  cbDescr.Enabled:=V;
  if ID_Type>1 then cbKassa.Enabled:=False
               else cbKassa.Enabled:=V;
  IsNight:=IsNight;
 end;

procedure TAETabF.RadioButton5Click(Sender: TObject);
 begin
  edStart.Text:='8';
  edEnd.Text:='21';
  edStMin.Text:='00';
  edEndMin.Text:='00';
  edDescr.Text:='';
  cbDescr.ItemIndex:=0;
  SetEnab(True);
 end;

procedure TAETabF.RadioButton6Click(Sender: TObject);
 begin
  edStart.Text:='00';
  edEnd.Text:='00';
  edStMin.Text:='00';
  edEndMin.Text:='00';
  edDescr.Text:='';
  cbDescr.ItemIndex:=0;
  cbKassa.ItemIndex:=-1;
  SetEnab(False);
 end;

procedure TAETabF.RadioButton7Click(Sender: TObject);
 begin
  edStart.Text:='00';
  edEnd.Text:='00';
  edStMin.Text:='00';
  edEndMin.Text:='00';
  edDescr.Text:='Отпуск';
  cbDescr.ItemIndex:=0;
  cbKassa.ItemIndex:=-1;
  SetEnab(False);
 end;

procedure TAETabF.SetEnab1(V:Boolean; P:Byte);
 begin
  if P=1 then
   begin
    edStart.Enabled:=V;
    edEnd.Enabled:=V;
    edStMin.Enabled:=V;
    edEndMin.Enabled:=V;
   end;
  edDescr.Enabled:=V;

  if ID_Type>1 then cbKassa.Enabled:=False
               else cbKassa.Enabled:=V;
  IsNight:=IsNight;
 end;

procedure TAETabF.RadioButton8Click(Sender:TObject);
 begin
  edStart.Text:='00';
  edEnd.Text:='00';
  edStMin.Text:='00';
  edEndMin.Text:='00';
  edDescr.Text:='Больнич.';
  cbDescr.ItemIndex:=0;
  cbKassa.ItemIndex:=-1;
  SetEnab(False);
 end;

procedure TAETabF.Edit1KeyPress(Sender: TObject; var Key: Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT+[',','.']) then Key:=#0;
 end;

procedure TAETabF.cbDescrChange(Sender: TObject);
 begin
  if cbDescr.ItemIndex>0 then
   begin
    cbKassa.ItemIndex:=-1;
    SetEnab1(True,1);
    if cbDescr.ItemIndex in [1,5,6,7] then SetEnab1(False,0) else
     begin
      edStart.Text:='00';
      edEnd.Text:='00';
      edStMin.Text:='00';
      edEndMin.Text:='00';
      SetEnab1(False,1);
     end;
    end else SetEnab1(True,1);

  if cbDescr.ItemIndex=0 then edDescr.Text:=''
                         else edDescr.Text:=cbDescr.Text;
 end;

procedure TAETabF.SetTimeOther(const Value: String);
 begin
  if Value='' then FStrTimeOther:='0:0-0:0_'
              else FStrTimeOther:=Value;
 end;

procedure TAETabF.SetIsNight(const Value: Boolean);
 begin
  FIsNight:=Value;
  if FOklad=False then
   begin

    RadioButton5.Enabled:=Not Value;
    RadioButton1.Enabled:=Not Value;
    RadioButton2.Enabled:=Not Value;

    RadioButton3.Enabled:=Value;
   end else begin
             RadioButton5.Enabled:=True;
             RadioButton1.Enabled:=True;
             RadioButton2.Enabled:=True;
             RadioButton3.Enabled:=True;
            end;
 end;

end.




