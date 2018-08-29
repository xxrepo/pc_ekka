unit CalcZarplU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, Util, DateUtils, PrintReport;

type
  TCalcZarplF = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Label3: TLabel;
    UpDown1: TUpDown;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Panel2: TPanel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    ComboBox1: TComboBox;
    Label7: TLabel;
    Edit5: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit6: TEdit;
    st1: TStaticText;
    st2: TStaticText;
    st3: TStaticText;
    st4: TStaticText;
    st5: TStaticText;
    st6: TStaticText;
    st7: TStaticText;
    st8: TStaticText;
    st9: TStaticText;
    st10: TStaticText;
    st11: TStaticText;
    st12: TStaticText;
    st13: TStaticText;
    st14: TStaticText;
    st15: TStaticText;
    st16: TStaticText;
    st17: TStaticText;
    st18: TStaticText;
    st20: TStaticText;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    StaticText26: TStaticText;
    StaticText27: TStaticText;
    StaticText28: TStaticText;
    StaticText29: TStaticText;
    StaticText30: TStaticText;
    StaticText31: TStaticText;
    StaticText32: TStaticText;
    StaticText33: TStaticText;
    StaticText34: TStaticText;
    StaticText35: TStaticText;
    StaticText36: TStaticText;
    StaticText37: TStaticText;
    StaticText39: TStaticText;
    StaticText40: TStaticText;
    StaticText41: TStaticText;
    StaticText42: TStaticText;
    BitBtn3: TBitBtn;
    Label12: TLabel;
    Edit7: TEdit;
    st19: TStaticText;
    StaticText2: TStaticText;
    Label11: TLabel;
    Edit8: TEdit;
    Label13: TLabel;
    Edit9: TEdit;
    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);
    procedure Edit4KeyPress(Sender:TObject; var Key: Char);
    procedure BitBtn3Click(Sender:TObject);

  private

    NormHour,DoplataN:Real;
    StartW,EndW:String;

  public

  end;

var CalcZarplF:TCalcZarplF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TCalcZarplF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  DM.Qr.Close; DM.Qr.SQL.Text:='select Value from Spr_Const where Descr=''StartW'''; DM.Qr.Open;   StartW:=DM.Qr.FieldByName('Value').AsString;
  DM.Qr.Close; DM.Qr.SQL.Text:='select Value from Spr_Const where Descr=''EndW'''; DM.Qr.Open;     EndW:=DM.Qr.FieldByName('Value').AsString;
  DM.Qr.Close; DM.Qr.SQL.Text:='select Value from Spr_Const where Descr=''NormHour'''; DM.Qr.Open; NormHour:=DM.Qr.FieldByName('Value').AsFloat*0.89;
  DM.Qr.Close; DM.Qr.SQL.Text:='select Value from Spr_Const where Descr=''DoplataN'''; DM.Qr.Open; DoplataN:=DM.Qr.FieldByName('Value').AsFloat;
  Label9.Caption:=CurrToStrF(NormHour,ffFixed,0);
 end;

procedure TCalcZarplF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TCalcZarplF.BitBtn1Click(Sender: TObject);
var D1,D2:TDateTime;
    HStarsh,HZav,HDay,HNight,VDay,VNight,HDayStav,HNightStav,Sum:Real;
    Kateg:Integer;
    ItogPrem,ItogZP:Real;
    Res:Array[1..2] of Record
                        Oklad:Real;
                        OkladS:Real;
                        DopVish:Real;
                        DopZav:Real;
                        DopStarsh:Real;
                        DopNTov:Real;
                        DopN:Real;
                        Prem20:Real;
                        VDayM:Real;
                        VDayMPrev:Real;
                        VHourM:Real;
                        VHourProv:Real;
                        PercExec:Real;
                        KoefPrem:Real;
                        Premia:Real;
                        Prirost:Real;
                        KPrirost:Real;
                        PremPrirost:Real;
                        PremPrirostApt:Real;
                       end;
 begin

  if ComboBox2.ItemIndex=-1 then
   begin
    MainF.MessBox('Выберите месяц');
    ComboBox2.SetFocus;
   end else
  if Edit4.Text='' then
   begin
    MainF.MessBox('Введите часы старшинства');
    Edit4.SetFocus;
   end else
  if ComboBox1.ItemIndex=-1 then
   begin
    MainF.MessBox('Выберите должность');
    ComboBox1.SetFocus;
   end else

  if Edit3.Text='' then
   begin
    MainF.MessBox('Введите знaчение в поле "Часы (День)"');
    Edit3.SetFocus;
   end else
  if Edit5.Text='' then
   begin
    MainF.MessBox('Введите знaчение в поле "Часы (Ночь)"');
    Edit5.SetFocus;
   end else
  if Edit2.Text='' then
   begin
    MainF.MessBox('Введите знaчение в поле "Выручка (День)"');
    Edit2.SetFocus;
   end else
  if Edit6.Text='' then
   begin
    MainF.MessBox('Введите знaчение в поле "Выручка (Ночь)"');
    Edit6.SetFocus;
   end else
  if Edit7.Text='' then
   begin
    MainF.MessBox('Введите знaчение в поле "Часы (заведования)"');
    Edit7.SetFocus;
   end else try
             D1:=StrToDateTime('01.'+LeadZero(ComboBox2.ItemIndex+1)+'.'+IntToStr(UpDown1.Position)+' 00:00:00');
             D2:=EndOfTheMonth(D1);
             HStarsh:=StrToCurr(Edit4.Text);
             HDay:=StrToCurr(Edit3.Text);
             HNight:=StrToCurr(Edit5.Text);

             VDay:=StrToCurr(Edit2.Text);
             VNight:=StrToCurr(Edit6.Text);

             HDayStav:=StrToCurr(Edit8.Text);
             HNightStav:=StrToCurr(Edit9.Text);


             HZav:=StrToCurr(Edit7.Text);
             if ComboBox1.ItemIndex in [0,1,6,7] then HZav:=HDay+HNight;

             Res[1].Oklad:=HDay*6.75;
             Res[2].Oklad:=HNight*6.75;

             Res[1].OkladS:=HDayStav*3.5;
             Res[2].OkladS:=HNightStav*3.5;

             if NormHour=0 then raise EAbort.Create('Нормочасы не заданы!');

             DM.Qr.Close;
             DM.Qr.SQL.Clear;
             DM.Qr.SQL.Add(' select (Sum(kol*cena)-IsNull(Sum(convert(numeric(12,2),kol*cena*skd/100.)),0)) as Summa from ArhCheks ');
             DM.Qr.SQL.Add(' where kol>0 and date_chek between '''+FormatDateTime('yyyy-mm-dd',D1)+' 00:00:00'' and '''+FormatDateTime('yyyy-mm-dd',D2)+' 23:59:59'' and ');
             DM.Qr.SQL.Add(' (convert(varchar,date_chek,8)>='''+StartW+''' and convert(varchar,date_chek,8)<='''+EndW+''' )');
             DM.Qr.Open;
             Res[1].VDayM:=DM.Qr.FieldByName('Summa').AsFloat;
             Res[1].VHourM:=Res[1].VDayM/NormHour;

             DM.Qr.Close;
             DM.Qr.SQL.Clear;
             DM.Qr.SQL.Add(' select top 1 case when max(isnull(ВЫРУЧКА_ЗА_ЧАС,0)) <300 then 5 when  ( max(isnull(ВЫРУЧКА_ЗА_ЧАС,0)) between 300 and 499.99) then 4  when ( max(Isnull(ВЫРУЧКА_ЗА_ЧАС,0)) ');
             DM.Qr.SQL.Add(' between 500 and 699.99) then 3 when (max(isnull(ВЫРУЧКА_ЗА_ЧАС,0)) between 700 and 899.99) then 2 when max(isnull(ВЫРУЧКА_ЗА_ЧАС,0)) > 900 then 1  end as Kateg ');
             DM.Qr.SQL.Add(' from (select '+CurrToStr(Res[1].VHourM)+' as ВЫРУЧКА_ЗА_ЧАС) a ');
             DM.Qr.Open;
             Kateg:=DM.Qr.FieldByName('Kateg').AsInteger;

             if RadioButton3.Checked then
              begin
               Res[1].DopVish:=0;
               Res[2].DopVish:=0;
              end else
             if ComboBox1.ItemIndex in [0,1,3,4,6,7] then
              begin
               Res[1].DopVish:=HDay*0.3;
               Res[2].DopVish:=HNight*0.3;
              end;


             Res[1].DopZav:=0;
             Res[2].DopZav:=0;
             if ComboBox1.ItemIndex=0 then
              begin
               Case Kateg of
                1:Res[1].DopZav:=HZav*5.5;
                2:Res[1].DopZav:=HZav*5.0;
                3:Res[1].DopZav:=HZav*4.5;
                4:Res[1].DopZav:=HZav*4.0;
                5:Res[1].DopZav:=HZav*3.0;
               end
              end else
             if ComboBox1.ItemIndex=1 then
              begin
               Case Kateg of
                1:Res[1].DopZav:=HZav*4.5;
                2:Res[1].DopZav:=HZav*4.0;
                3:Res[1].DopZav:=HZav*3.5;
                4:Res[1].DopZav:=HZav*3.0;
                5:Res[1].DopZav:=HZav*2.0;
               end
              end else
             if ComboBox1.ItemIndex in [6,7] then
              begin
               Case Kateg of
                1:Res[1].DopZav:=HZav*0;
                2:Res[1].DopZav:=HZav*5.0;
                3:Res[1].DopZav:=HZav*4.5;
                4:Res[1].DopZav:=HZav*4.0;
                5:Res[1].DopZav:=HZav*3.0;
               end
              end;

             Res[1].DopStarsh:=0;
             Case Kateg of
              1:Res[1].DopStarsh:=HStarsh*4.5;
              2:Res[1].DopStarsh:=HStarsh*4.0;
              3:Res[1].DopStarsh:=HStarsh*3.5;
              4:Res[1].DopStarsh:=HStarsh*3.0;
              5:Res[1].DopStarsh:=HStarsh*2.0;
             end;

             Res[1].DopNTov:=0;
             Case Kateg of
              1:Res[2].DopNTov:=HNight*1.2;
              2:Res[2].DopNTov:=HNight*1.1;
              3:Res[2].DopNTov:=HNight*1.0;
              4:Res[2].DopNTov:=HNight*0.9;
              5:Res[2].DopNTov:=HNight*0.8;
             end;

             Res[2].DopN:=((HNight/11)*6.75*8)*20/100;
             Res[1].Prem20:=0;
             Res[2].Prem20:=0;

             if RadioButton4.Checked then
              begin
               Res[1].Prem20:=Res[1].Oklad*1/5;
               Res[2].Prem20:=Res[2].Oklad*1/5;
              end;

             Res[1].VHourProv:=0;
             if HDay<>0 then Res[1].VHourProv:=VDay/HDay;

             Res[1].PercExec:=0;
             if Res[1].VHourM<>0 then
              Res[1].PercExec:=100+(Res[1].VHourProv/Res[1].VHourM-1)*100;

             Res[1].KoefPrem:=0;
             if RadioButton4.Checked then
              begin
               DM.Qr.Close;
               DM.Qr.SQL.Text:='select top 1 bonus from ava_zarplata_norma_3 where '+CurrToStr(Res[1].PercExec)+'>=percent_1 and  '+CurrToStr(Res[1].PercExec)+'<percent_2 and '+IntToStr(Kateg)+' = ID';
               DM.Qr.Open;
               Res[1].KoefPrem:=DM.Qr.FieldByName('bonus').AsFloat;
              end;

             DM.Qr.Close;
             DM.Qr.SQL.Clear;
             DM.Qr.SQL.Add(' select (Sum(kol*cena)-IsNull(Sum(convert(numeric(12,2),kol*cena*skd/100.)),0)) as Summa from ArhCheks ');
             DM.Qr.SQL.Add(' where kol>0 and date_chek between '''+FormatDateTime('yyyy-mm-dd',StartOfTheMonth(D1-1))+' 00:00:00'' and '''+FormatDateTime('yyyy-mm-dd',EndOfTheMonth(D1-1))+' 23:59:59'' and ');
             DM.Qr.SQL.Add(' (convert(varchar,date_chek,8)>='''+StartW+''' and convert(varchar,date_chek,8)<='''+EndW+''' )');
             DM.Qr.Open;
             Res[1].VDayMPrev:=DM.Qr.FieldByName('Summa').AsFloat;

             Res[1].Premia:=0;
             Res[2].Premia:=0;

             Res[1].Prirost:=0;
             Res[1].KPrirost:=0;
             Res[1].PremPrirost:=0;
             Res[1].PremPrirostApt:=0;

             if (RadioButton4.Checked) and (Res[1].PercExec>0) and (Res[1].KoefPrem>0) then
              begin
               Res[1].Premia:=HDay*Res[1].KoefPrem;
//               Res[2].Premia:=HNight*Res[1].KoefPrem;
              end;
             if (RadioButton4.Checked) then
              begin
               Res[2].Premia:=DoplataN*VNight/100;

               DM.Qr.Close;
               DM.Qr.SQl.Text:='select Min(Date_nakl) as dt from JMOves where type_nakl=1 and nn_nakl like ''Рнр%'' ';
               DM.Qr.Open;

               if (Res[1].VDayMPrev>0) and (DM.Qr.IsEmpty=False) and (Abs(Date-DM.Qr.FieldByName('dt').AsDateTime)>=180) then
                begin
                 Res[1].Prirost:=(Res[1].VDayM/Res[1].VDayMPrev-1)*100;
                 Res[1].KPrirost:=Res[1].Prirost-10; // 10 - коеффициент сезонности, на 09.11.2012 он для всех аптек был одинаковый
                end;

               if (Res[1].PercExec>100) and (Res[1].KPrirost>0.001) and (HDay+HNight>84) then
                begin
                 DM.Qr.Close;
                 DM.Qr.SQL.Text:='select top 1 bonus from ava_zarplata_norma_2 where '+CurrToStr(Res[1].KPrirost)+'>=percent_1 and '+CurrToStr(Res[1].KPrirost)+' <percent_2 and '+IntToStr(Kateg)+' = ID';
                 DM.Qr.Open;
                 Res[1].PremPrirost:=DM.Qr.FieldByName('bonus').AsFloat;
                end;

               if HDay+HNight>84 then
                Res[1].PremPrirostApt:=(HDay+HNight)*Res[1].PremPrirost;
              end;

             ItogPrem:=Res[1].PremPrirostApt+Res[1].Prem20+Res[2].Prem20+Res[1].Premia+Res[2].Premia+Res[2].DopNTov+Res[2].DopN;
             ItogZP:=Res[1].Oklad+Res[2].Oklad+Res[1].OkladS+Res[2].OkladS+ItogPrem+Res[1].DopVish+Res[2].DopVish+Res[1].DopZav+Res[1].DopStarsh;
//             'ИТОГО_ПРЕМИЯ =  isnull(ПРЕМИЯ_ПРИРОСТ_АПТЕКА,0) + isnull(ПРЕМИЯ_Н,0) + isnull(ПРЕМИЯ_ЗА_ВЫРУЧКУ,0) + isnull(ДОПЛАТА_ТОВАР_НОЧЬ,0) + isnull(ДОПЛАТА_ЧАСЫ_НОЧЬ,0)'


             StaticText22.Caption:=CurrToStrF(Res[1].Oklad+Res[2].Oklad+Res[1].OkladS+Res[2].OkladS,ffFixed,2)+' грн. ';
             StaticText23.Caption:=CurrToStrF(Res[1].DopVish+Res[2].DopVish,ffFixed,2)+' грн. ';
             StaticText24.Caption:=CurrToStrF(Res[1].DopZav,ffFixed,2)+' грн. ';
             StaticText26.Caption:=CurrToStrF(Res[1].DopStarsh,ffFixed,2)+' грн. ';
             StaticText27.Caption:=CurrToStrF(Res[2].DopNTov,ffFixed,2)+' грн. ';
             StaticText28.Caption:=CurrToStrF(Res[2].DopN,ffFixed,2)+' грн. ';
             StaticText29.Caption:=CurrToStrF(Res[1].Prem20+Res[2].Prem20,ffFixed,2)+' грн. ';

             StaticText30.Caption:=CurrToStrF(Res[1].VDayM,ffFixed,2)+' грн. ';
             StaticText31.Caption:=IntToStr(Kateg);
             StaticText32.Caption:=CurrToStrF(Res[1].VHourM,ffFixed,2)+' грн. ';
             StaticText33.Caption:=CurrToStrF(Res[1].VhourProv,ffFixed,2)+' грн. ';
             StaticText34.Caption:=CurrToStrF(Res[1].PercExec,ffFixed,2)+' % ';
             StaticText35.Caption:=CurrToStrF(Res[1].KoefPrem,ffFixed,2);
             StaticText36.Caption:=CurrToStrF(Res[1].Premia+Res[2].Premia,ffFixed,2)+' грн. ';
             StaticText37.Caption:=CurrToStrF(Res[1].VDayMPrev,ffFixed,2)+' грн. ';

             StaticText39.Caption:=CurrToStrF(Res[1].Prirost,ffFixed,2);
             StaticText40.Caption:=CurrToStrF(Res[1].KPrirost,ffFixed,2);

             StaticText41.Caption:=CurrToStrF(Res[1].PremPrirost,ffFixed,2);
             StaticText2.Caption:=CurrToStrF(Res[1].PremPrirostApt,ffFixed,2);

             StaticText42.Caption:=CurrToStrF(ItogZP,ffFixed,2);

            { Sum:=Res[1].Oklad+Res[2].Oklad;
             Sum:=Sum+Res[1].DopVish+Res[2].DopVish;
             Sum:=Sum+Res[1].DopZav;
             Sum:=Sum+Res[1].DopStarsh;
             Sum:=Sum+Res[2].DopNtov;
             Sum:=Sum+Res[2].DopN;
             Sum:=Res[1].Prem20+Res[2].Prem20;
            }
            except
             on E:Exception do MainF.MessBox('Ошибка расчета: '+E.Message);
            end;
 end;

procedure TCalcZarplF.Edit4KeyPress(Sender: TObject; var Key: Char);
var Ch:Char;
 begin
  if (Key='.') or (Key=',') then
   begin
    Key:=GetDivPoint;
    Ch:=Key;
   end else Ch:=#0;
  if Key<>#8 then
   if Not (Key in CH_DIGIT+[Ch]) then Key:=#0;
 end;

procedure TCalcZarplF.BitBtn3Click(Sender: TObject);
var Tb:TTableObj;
    i:Integer;
 begin
  try
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Size:=6;
   PrintRep.Font.Style:=[fsBold];
   PrintRep.Align:=AL_CENTER;
   PrintRep.AddText('Расчет зароботной платы  за '+ComboBox2.Text+' '+Edit1.Text+' г '#10'торговой точки '+Prm.FirmNameRU+' '+Prm.AptekaNameRU+' '#10'по сотруднику: '+Prm.UserName+#10);
   PrintRep.Font.Style:=[];

   PrintRep.Align:=AL_LEFT;
   if RadioButton4.Checked then PrintRep.AddText(#10'Режим работы: почасовой')
                           else PrintRep.AddText(#10'Режим работы: ставка');
   PrintRep.AddText(#10'Должность: '+ComboBox1.Text);
   PrintRep.AddText(#10'Часы:  ');
   PrintRep.AddText(#10'   - день: '+Edit3.Text+' ч');
   PrintRep.AddText(#10'   - ночь: '+Edit5.Text+' ч');
   PrintRep.AddText(#10'   - старшинство: '+Edit4.Text+' ч');
   PrintRep.AddText(#10'   - заведование: '+Edit7.Text+' ч');

   PrintRep.AddText(#10'Выручка (день): '+Edit2.Text+' грн.');
   PrintRep.AddText(#10'Выручка (ночь): '+Edit6.Text+' грн.'+#10#10);



   PrintRep.AddTable(2,20);
   Tb:=PrintRep.LastTable;
   Tb.SetWidths('6000,4000');

   for i:=1 to 20 do
    begin
     Tb.Cell[1,i].Align:=AL_LEFT;
     if i=20 then
      begin
       Tb.Cell[1,i].Font.Style:=[fsBold];
       Tb.Cell[2,i].Font.Style:=[fsBold];
      end;
     Tb.Cell[1,i].AddText(TStaticText(FindComponent('st'+IntToStr(i))).Caption);

     Tb.Cell[2,i].Align:=AL_RIGHT;
    end;

   Tb.Cell[2,1].AddText(StaticText22.Caption);
   Tb.Cell[2,2].AddText(StaticText23.Caption);
   Tb.Cell[2,3].AddText(StaticText24.Caption);
   Tb.Cell[2,4].AddText(StaticText26.Caption);
   Tb.Cell[2,5].AddText(StaticText27.Caption);
   Tb.Cell[2,6].AddText(StaticText28.Caption);
   Tb.Cell[2,7].AddText(StaticText29.Caption);
   Tb.Cell[2,8].AddText(StaticText30.Caption);
   Tb.Cell[2,9].AddText(StaticText31.Caption);
   Tb.Cell[2,10].AddText(StaticText32.Caption);
   Tb.Cell[2,11].AddText(StaticText33.Caption);
   Tb.Cell[2,12].AddText(StaticText34.Caption);
   Tb.Cell[2,13].AddText(StaticText35.Caption);
   Tb.Cell[2,14].AddText(StaticText36.Caption);
   Tb.Cell[2,15].AddText(StaticText37.Caption);
   Tb.Cell[2,16].AddText(StaticText39.Caption);
   Tb.Cell[2,17].AddText(StaticText40.Caption);
   Tb.Cell[2,18].AddText(StaticText41.Caption);
   Tb.Cell[2,19].AddText(StaticText2.Caption);
   Tb.Cell[2,20].AddText(StaticText42.Caption);

   PrintRep.Align:=AL_LEFT;
   PrintRep.AddInterv(6);
   PrintRep.AddText('Дата расчета: '+DateTimeToStr(Now));
   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формиврования печатной формы: '+E.Message);
  end;
 end;

end.
