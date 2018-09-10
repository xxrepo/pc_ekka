unit WorkResU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Grids, DBGrids, ComCtrls, Util, Buttons, ExtCtrls, DB,
     PrintReport, ADODB, ShellAPI, EKKAU;

type

  TWorkResF = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    BitBtn2: TBitBtn;
    bbClearRes: TBitBtn;
    BitBtn3: TBitBtn;
    bbSetRes: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    Label8: TLabel;
    ComboBox2: TComboBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    lbAssemb: TLabel;
    Label4: TLabel;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    Label5: TLabel;
    lbDtpolis: TLabel;
    Label6: TLabel;
    lbNnpolis: TLabel;
    Label7: TLabel;
    dtdostav: TLabel;
    BitBtn5: TBitBtn;
    Label9: TLabel;
    lbFransh: TLabel;
    Label10: TLabel;
    lbPhone: TLabel;
    Label11: TLabel;
    lbnnStrah: TLabel;
    Label12: TLabel;
    lbAYKABU: TLabel;
    Label13: TLabel;
    lbBezn1: TLabel;
    Label14: TLabel;
    lbNumOrder: TLabel;
    Label15: TLabel;
    lbComment: TLabel;
    CheckBox1: TCheckBox;
    Panel3: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    BitBtn_select_med: TBitBtn;

    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure dtStartCloseUp(Sender: TObject);
    procedure dtEndCloseUp(Sender: TObject);
    procedure ComboBox2CloseUp(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bbClearResClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure bbSetResClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn_select_medClick(Sender: TObject);

  private

  public

    id_doctor,TypeRes,TypeZakaz,IDRES,Flag,NumZakaz:Integer;
    Phone,Filt,card_doctor:String;
    id_strah:Integer;
    name_strah:String;
    nn_polis:String;
    NumOrder:String;
    dt_polis:TDateTime;
    fransh:Currency;
    type_dostav:Integer;
    IsPayMaster:Boolean;
    IsKurDostMakeOut:Boolean;
    IDRes_Kur:Integer;
    FIO:String;
    MedCode:Integer;
    MedName:String;
    Pacient:String;
    NRecipt:String;
    FIODOctor1:String;
    DtRecipt:TDateTime;

    procedure FilterRes;
    procedure FilterResPos;
    procedure FlashStatus;

  end;

var WorkResF:TWorkResF;

implementation

uses MainU, DataModuleU, EnterValueU, AddResU, CancelResU, Pilot3U, Uedit_filtr;

{$R *.dfm}

procedure TWorkResF.FormCreate(Sender: TObject);
 begin
  Flag:=0;
  Caption:=MFC+' - Брони клиентов';
  ComboBox2.ItemIndex:=StrToInt(FormatDateTime('mm',Date()))-1;
  ComboBox2Change(ComboBox2);
  dtEnd.Date:=Date;
  IsPayMaster:=False;
  IsKurDostMakeOut:=False;
  Panel2.Left:=5;
  Panel2.Top:=275;

  Panel3.Left:=5;
  Panel3.Top:=275;
 end;

procedure TWorkResF.FilterRes;
var ID:Integer;
    Res:String;
 begin
  try
   ID:=-1;
   if DM.qrRes.Active then ID:=DM.qrRes.FieldByName('idres').AsInteger;
   DM.qrRes.Close;
   DM.qrRes.SQL.Clear;

   DM.qrRes.SQL.Add('select iddoc,numzakaz,idres,date_res,fio,phone,                                             ');
   DM.qrRes.SQL.Add('       (select top 1 users from SprUser s where s.id=r.id_user) as usero,    ');
   DM.qrRes.SQL.Add('       date_close,                                                           ');
   DM.qrRes.SQL.Add('       (case when id_close=0 then ''Снята автоматически'' when r.id_close>0 then (select top 1 users from SprUser ss where ss.id=r.id_close) else '''' end) as userc, ');
   DM.qrRes.SQL.Add('       closed,priznak,numzakaz,                                          ');

   DM.qrRes.SQL.Add('       case when (Priznak=1 and NumZakaz>0 and id_apteka_from is null) or (TypeZakaz=4) then ''С ''+r.Prefix ');
   DM.qrRes.SQL.Add('            when Priznak=1 and IsNull(NumZakaz,0)=0 then ''По звонку'' ');
   DM.qrRes.SQL.Add('            when Priznak=2 then ''В аптеке'' ');
   DM.qrRes.SQL.Add('            when Priznak=3 then ''Заказ на складе'' ');
   DM.qrRes.SQL.Add('            when Priznak=1 and id_apteka_from is not null then ''С другой аптеки'' ');
   DM.qrRes.SQL.Add('            when Priznak=4 then ''iАптека'' ');
   DM.qrRes.SQL.Add('            when Priznak=6 then ''Страховая'' ');
   DM.qrRes.SQL.Add('            when Priznak=7 and IsNull(TypeZakaz,0)<>5 then ''Заказ у поставщика'' ');
   DM.qrRes.SQL.Add('            when Priznak=7 and TypeZakaz=5 then ''Заказ по дефектуре'' ');
   DM.qrRes.SQL.Add('       end as TypeBr, ');

   DM.qrRes.SQL.Add('       case when Priznak=1 and iddoc>0 and iddoc=NumZakaz then 1 when Priznak=1 and iddoc>0 and IsNull(NumZakaz,0)=0 then 2 end as TypeBrI, ');

   DM.qrRes.SQL.Add('       case when PaySystemId=1 then ''Предоплата'' when Priznak=1 and TypeZakaz=3 and id_apteka_from is null then ''Курьер'' else ''Самовывоз''                 ');
   DM.qrRes.SQL.Add('       end as TypeZakaz, ');

   DM.qrRes.SQL.Add('       case when Priznak=1 and TypeZakaz=3 then 1 else 0 end as TypeZakazI, ');
   DM.qrRes.SQL.Add('       case when Date_Assembly is null then 0 else 1 end as IsAssembly, ');

   DM.qrRes.SQL.Add('       Date_Assembly, ');
   DM.qrRes.SQL.Add('       (select top 1 s1.users from SprUser s1 where s1.id_gamma=r.id_user_assembly) as fio_assembly, ');
   DM.qrRes.SQL.Add('       r.id_doctor, ');
   DM.qrRes.SQL.Add('       (select top 1 d.shtr from CallCenter_Doctors d where d.id=r.id_doctor) as card_doctor, ');

   DM.qrRes.SQL.Add('       r.TypeZakaz as TypeZakazR, ');

   DM.qrRes.SQL.Add('       IsNull(r.id_apteka_from,0) as id_apteka_from, ');
   DM.qrRes.SQL.Add('       dt_polis, ');
   DM.qrRes.SQL.Add('       nn_polis, ');
   DM.qrRes.SQL.Add('       dt_dostav, ');
   DM.qrRes.SQL.Add('       fransh, ');
   DM.qrRes.SQL.Add('       id_strah, ');
   DM.qrRes.SQL.Add('       id_blob, ');
   DM.qrRes.SQL.Add('       case when id_blob is null then 0 else 1 end as IsFilePolice, ');
   DM.qrRes.SQL.Add('       (select top 1 b.fname from dhres_blob b (nolock) where b.id=r.id_blob) as fnameblob, ');
   DM.qrRes.SQL.Add('       case when dt_load_nakl is null then 0 else 1 end CanSale, ');
   DM.qrRes.SQL.Add('       (select top 1 Descr from Strahovaya st (nolock) where st.id=r.id_strah) as StrahDescr,');
   DM.qrRes.SQL.Add('       YAKABU, ');
   DM.qrRes.SQL.Add('       NumOrder, ');
   DM.qrRes.SQL.Add('       PaySystemId, ');
   DM.qrRes.SQL.Add('       Status_Pay, ');
   DM.qrRes.SQL.Add('       (select Sum(kol*cena) from DtRes dtr (nolock) where dtr.idres=r.idres)-fransh as Bezn1, ');
   DM.qrRes.SQL.Add('       PrefixID, ');
   DM.qrRes.SQL.Add('       ID_USER, ');
   DM.qrRes.SQL.Add('       Comment, ');
   DM.qrRes.SQL.Add('       case when r.Priznak=7 and r.TypeZakaz=5 and IsNull(r.IsTovLoaded,0)=0 then ''Товар в пути''   ');
   DM.qrRes.SQL.Add('            when r.Priznak=7 and r.TypeZakaz=5 and IsNull(r.IsTovLoaded,0)=1 then ''Есть остатки'' else '''' end as TovLoaded,  ');

   DM.qrRes.SQL.Add('       institutionCode,');
   DM.qrRes.SQL.Add('       institutionName,');
   DM.qrRes.SQL.Add('       orderPatientCard,');
   DM.qrRes.SQL.Add('       orderDoctor,');
   DM.qrRes.SQL.Add('       orderRecipe,');
   DM.qrRes.SQL.Add('       orderDtRecipe, ');
   DM.qrRes.SQL.Add('       type_dostav ');


   DM.qrRes.SQL.Add('from DhRes r ');

   DM.qrRes.SQL.Add('where 1=1 ');

   if ComboBox1.ItemIndex<>1 then
    begin
     DM.qrRes.SQL.Add('       and r.date_res>='''+FormatDateTime('yyyy-mm-dd',dtStart.Date)+' 00:00:00'' and  ');
     DM.qrRes.SQL.Add('      r.date_res<='''+FormatDateTime('yyyy-mm-dd',dtEnd.Date)+' 23:59:59 '' ');
    end;

   if CheckBox1.Checked then
    begin
     DM.qrRes.SQL.Add(' and r.Priznak=7 and r.TypeZakaz=5 ');
    end;

   if Filt<>'' then
    DM.qrRes.SQL.Add('and r.'+Filt );

{
   if TypeZakaz=2 then
    begin
     DM.qrRes.SQL.Add(' and r.Priznak=1 ');
     if Filt<>'' then
      DM.qrRes.SQL.Add('and r.'+Filt );
    end;
}

   if ComboBox1.ItemIndex>0 then
    DM.qrRes.SQL.Add(' and r.Closed='+IntToStr(ComboBox1.ItemIndex-1)  );
   DM.qrRes.SQL.Add('order by date_res ');
//   DM.qrRes.SQL.SaveToFile('C:\log\dhres.txt');
   //DM.qrRes.SQL.SaveToFile('1234');
   DM.qrRes.Open;

   DM.qrRes.Locate('idres',ID,[]);
   FilterResPos;
   FlashStatus;

   if (Filt<>'') and (DM.qrRes.RecordCount>1) then
    MainF.MessBox('Найдено несколько заказов. Уточните номер или состав заказа у покупателя!',
                   48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);

  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику брони: '+E.Message);
  end;
 end;

procedure TWorkResF.FilterResPos;
 begin
  DM.qrResPos.Close;
  if DM.qrRes.IsEmpty then Exit;
  try

   lbAssemb.Caption:='';
   Label4.Visible:=False;

   if DM.qrRes.FieldByName('IsAssembly').AsInteger=1 then
    begin
     Label4.Visible:=True;
     lbAssemb.Caption:=DM.qrRes.FieldByName('Date_Assembly').AsString+' сотрудником '+DM.qrRes.FieldByName('Fio_Assembly').AsString;
    end;

   DM.qrResPos.Close;

{
   DM.qrResPos.SQL.Clear;
   DM.qrResPos.SQL.Add('select a.names,c.art_code,c.kol,c.cena,IsNull((select Max(Art_Code) from NoScan n where n.art_code=c.Art_Code),0) as IsScan');
   DM.qrResPos.SQL.Add('from (select art_code,Max(names) as names, Max(cena) as cena from SprTov group by art_code) as a, ');
   DM.qrResPos.SQL.Add('     DtRes c ');
   DM.qrResPos.SQL.Add('where a.art_code=c.art_code and');
   DM.qrResPos.SQL.Add('      c.idres='+DM.qrRes.FieldByName('idres').AsString);
   DM.qrResPos.SQL.Add('order by a.names ');
}

   DM.qrResPos.SQL.Text:='exec spY_DtResList '+DM.qrRes.FieldByName('idres').AsString;
   DM.qrResPos.Open;

  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику брони: '+E.Message);
  end;

 end;

procedure TWorkResF.ComboBox2Change(Sender:TObject);
var D1,D31:TDateTime;
 begin
  if ComboBox2.ItemIndex<>-1 then
   begin
    GetDaysOfMonth(ComboBox2.ItemIndex+1,D1,D31);
    dtStart.Date:=D1;
    dtEnd.Date:=D31;
   end;
 end;

procedure TWorkResF.ComboBox1Change(Sender:TObject);
 begin
  FilterRes;
 end;

procedure TWorkResF.dtStartCloseUp(Sender:TObject);
 begin
  FilterRes;
 end;

procedure TWorkResF.dtEndCloseUp(Sender: TObject);
 begin
  FilterRes;
 end;

procedure TWorkResF.ComboBox2CloseUp(Sender: TObject);
 begin
  FilterRes;
 end;

procedure TWorkResF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TWorkResF.FlashStatus;
var V:Boolean;
 begin
  bbSetRes.Visible:=False;
  bbClearRes.Visible:=False;

  if DM.qrRes.IsEmpty then Exit;

  if DM.qrRes.FieldByName('Priznak').AsInteger in [3,7] then // Если бронь со склада или с аптеки на аптеку, то отмену брони отменяем
   begin
    bbClearRes.Visible:=False;
    Exit;
   end;

  if (DM.qrRes.FieldByName('Closed').AsInteger=1) and (DM.qrRes.FieldByName('Priznak').AsInteger<>1) then bbSetRes.Visible:=True else
  if (DM.qrRes.FieldByName('Closed').AsInteger=0) then bbClearRes.Visible:=True;

  V:=bbClearRes.Visible;
  if DM.qrRes.FieldByName('Priznak').AsInteger=6 then
   begin
    // GroupBox1.Height:=205;
    bbClearRes.Visible:=False;
    if DM.qrRes.FieldByName('ID_USER').AsInteger <> -1001 then
    bbClearRes.Visible:=true;

    lbDtpolis.Caption:=DM.qrRes.FieldByName('dt_polis').AsString;
    lbNnpolis.Caption:=DM.qrRes.FieldByName('nn_polis').AsString;
    dtdostav.Caption:=DM.qrRes.FieldByName('dt_dostav').AsString;
    lbFransh.Caption:=CurrToStrF(DM.qrRes.FieldByName('fransh').AsCurrency,ffFixed,2)+' грн.';

    lbBezn1.Caption:=CurrToStrF(DM.qrRes.FieldByName('Bezn1').AsCurrency,ffFixed,2)+' грн.';

    lbPhone.Caption:=DM.qrRes.FieldByName('phone').AsString;
    lbnnStrah.Caption:=DM.qrRes.FieldByName('StrahDescr').AsString;
    lbAYKABU.Caption:=DM.qrRes.FieldByName('YAKABU').AsString;
    lbNumOrder.Caption:=DM.qrRes.FieldByName('NumOrder').AsString;
    lbComment.Caption:=DM.qrRes.FieldByName('Comment').AsString;

    Panel2.Visible:=True;
   end else
  if (DM.qrRes.FieldByName('Priznak').AsInteger=1) and (DM.qrRes.FieldByName('institutionCode').AsInteger>0)  then
   begin
    Label17.Caption:=DM.qrRes.FieldByName('institutionName').AsString;
    Label29.Caption:=DM.qrRes.FieldByName('orderPatientCard').AsString;
    Label25.Caption:=DM.qrRes.FieldByName('orderDoctor').AsString;
    Label27.Caption:=DM.qrRes.FieldByName('orderRecipe').AsString;
    Label21.Caption:=DM.qrRes.FieldByName('orderDtRecipe').AsString;
    Panel3.Visible:=True;
   end else begin
             // GroupBox1.Height:=238;
             bbClearRes.Visible:=V;
             Panel2.Visible:=False;
             Panel3.Visible:=False;
            end;
 end;

procedure TWorkResF.bbClearResClick(Sender: TObject);
 begin
   try

    if (DM.qrRes.FieldByName('Priznak').AsInteger in [1,4]) or
       (DM.qrRes.FieldByName('id_apteka_from').AsInteger>0) then
     begin
      CancelResF:=TCancelResF.Create(Self);
      try

       CancelResF.PrefixID:=DM.qrRes.FieldByName('PrefixID').AsString;
       CancelResF.NumZakaz:=DM.qrRes.FieldByName('NumZakaz').AsInteger;

       if CancelResF.PrefixID='' then CancelResF.PrefixID:=DM.qrRes.FieldByName('NumZakaz').AsString;

       CancelResF.Phone:=DM.qrRes.FieldByName('Phone').AsString;
       Application.ProcessMessages;
       CancelResF.ShowModal;

       if CancelResF.Flag<>1 then Exit;
      finally
       CancelResF.Free;
      end;
     end;

   if DM.qrRes.IsEmpty then Exit;
   if DM.qrRes.FieldByName('Closed').AsInteger<>0 then Exit;
   if MainF.MessBox('Вы действительно хотите снять бронь?',52)<>ID_YES then Exit;

   DM.Qr4.Close;
   DM.Qr4.SQL.Clear;
   DM.Qr4.SQL.Add('update DhRes set Closed=1,id_close='+IntToStr(Prm.UserID)+',date_close=getdate() where idres='+DM.qrRes.FieldByName('idres').AsString);
   DM.Qr4.ExecSQL;
   FilterRes;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику брони: '+E.Message);
  end;
 end;

procedure TWorkResF.BitBtn3Click(Sender: TObject);
var
    //eID:Integer;
    Res,PrefID:String;
 begin
  if DM.qrRes.IsEmpty then Exit;
  if DM.qrResPos.IsEmpty then Exit;
  if DM.qrRes.FieldByName('Closed').AsInteger>=1 then Exit;

  if (EKKA.TypeEKKA=EKKA_N707) and (DM.qrRes.FieldByName('Priznak').AsInteger=6) then
   begin
    MainF.MessBox('На данной кассе временно невозможно проводить продажи по страховым!');
    Exit;
   end;

  if AnsiUpperCase(DM.qrRes.FieldByName('FIO').AsString)=AnsiUpperCase('1-Сверка Товаров Страховой') then
   begin
    MainF.MessBox('Данную бронь добавлять в чек нельзя! По данному вопросу обращайтесь в офис!');
    Exit;
   end;

  if (DM.qrRes.FieldByName('Priznak').AsInteger=3) and
     (DM.qrRes.FieldByName('CanSale').AsInteger=0) then
   begin
    MainF.MessBox('По данному заказу со склада необходимо сначала загрузить накладную!');
    Exit;
   end;

  if Prm.UserRole=R_DISP then
   begin
    MainF.MessBox('В этом режиме работы программы добавлять в чек позиции нельзя!');
    Exit;
   end;

  if (DM.qrRes.FieldByName('PaySystemId').AsInteger=1) and
     (DM.qrRes.FieldByName('Status_Pay').AsInteger<>7) then
   begin
    MainF.MessBox('По данному заказу нет подтверждения по оплате! Обращайтесь в Call-центр по тел. 093-170-0911 для уточнения информации об оплате!');
    Exit;
   end;

  if {(TypeZakaz=2) and} (Filt='') and (DM.qrRes.FieldByName('TypeZakazI').AsInteger=0) and (DM.qrRes.FieldByName('Priznak').AsInteger<>6) then
   begin
    AddResF:=TAddResF.Create(Self);
    try

     AddResF.RadioButton1.Visible:=True;
     AddResF.Label1.Visible:=False;
     Application.ProcessMessages;
     AddResF.ShowModal;
     if AddResF.Flag<>1 then Exit;

     if AddResF.RadioButton1.Checked then
      begin
       if DM.qrRes.FieldByName('PrefixID').AsString='' then PrefID:=DM.qrRes.FieldByName('iddoc').AsString
                                                       else PrefID:=DM.qrRes.FieldByName('PrefixID').AsString;
       if (AddResF.Edit1.Text<>DM.qrRes.FieldByName('iddoc').AsString) and (AddResF.Edit1.Text<>PrefID) then
        begin
         MainF.MessBox('Номер заказа введен неправильно!');
         Exit;
        end;
      end else begin
                if AddResF.Edit3.Text<>DM.qrRes.FieldByName('Phone').AsString then
                 begin
                  MainF.MessBox('Номер телефона введен неправильно!');
                  Exit;
                 end;
               end;

    finally
     AddResF.Free;
    end;
   end;

  if MainF.MessBox('Вы действительно хотите продать забронированные препараты?',52)<>ID_YES then Exit;

  if (DM.qrRes.FieldByName('PaySystemId').AsInteger=1) and
     (DM.qrRes.FieldByName('Status_Pay').AsInteger=7) then
   MainF.MessBox('Данная бронь уже оплачена, необходимо пробить чек и просто отдать товарные позиции по данной брони с чеком!',
                  48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);

  if (DM.qrRes.FieldByName('Priznak').AsInteger=4) and
     (DM.qrRes.FieldByName('TypeZakazR').AsInteger=2) then
   MainF.MessBox('Данная бронь уже оплачена, необходимо пробить чек и просто отдать товарные позиции по данной брони с чеком!',
                  48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);

  if DM.qrRes.FieldByName('id_strah').AsInteger>0 then
   if MainF.MessBox('Вы распечатали заявку страховой в 2-х экземплярах по данному заказу (кнопка "Открыть файл-полис" и напечатать, или в электронной почте заведующей)?',
                     52,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res)<>ID_YES then Exit;

  IDRES:=DM.qrRes.FieldByName('idres').AsInteger;
  IsPayMaster:=DM.qrRes.FieldByName('PaySystemId').AsInteger=1;
  TypeRes:=DM.qrRes.FieldByName('Priznak').AsInteger;

  FIO:=DM.qrRes.FieldByName('FIO').AsString;

  NumZakaz:=DM.qrRes.FieldByName('NumZakaz').AsInteger;
  Phone:=DM.qrRes.FieldByName('Phone').AsString;
  id_doctor:=DM.qrRes.FieldByName('id_doctor').AsInteger;
  card_doctor:=DM.qrRes.FieldByName('card_doctor').AsString;
  TypeZakaz:=DM.qrRes.FieldByName('TypeZakazR').AsInteger;

  id_strah:=DM.qrRes.FieldByName('id_strah').AsInteger;
  name_strah:=DM.qrRes.FieldByName('StrahDescr').AsString;
  nn_polis:=DM.qrRes.FieldByName('nn_polis').AsString;
  NumOrder:=DM.qrRes.FieldByName('NumOrder').AsString;
  dt_polis:=DM.qrRes.FieldByName('dt_polis').AsDateTime;
  fransh:=DM.qrRes.FieldByName('fransh').AsCurrency;
  type_dostav:=DM.qrRes.FieldByName('type_dostav').AsInteger;

  MedCode:=0;
  if DM.qrRes.FieldByName('institutionCode').AsInteger>0 then
   begin
    MedCode:=DM.qrRes.FieldByName('institutionCode').AsInteger;
    MedName:=DM.qrRes.FieldByName('institutionName').AsString;
    Pacient:=DM.qrRes.FieldByName('fio').AsString;   
    NRecipt:=DM.qrRes.FieldByName('orderRecipe').AsString;
    FIODOctor1:=DM.qrRes.FieldByName('orderDoctor').AsString;
    DtRecipt:=DM.qrRes.FieldByName('orderDtRecipe').AsDateTime;
   end;

  // Курьерская доставка с выдачей
  IsKurDostMakeOut:=(Prm.IsKurDostavka=True) and
                    (DM.qrRes.FieldByName('TypeZakazI').AsInteger=1) and
                    (DM.qrRes.FieldByName('id_apteka_from').AsInteger=0);

{
  if (TypeRes=1) then
   begin
    if Not EnterIntValue(eID,'Введите номер заказа. Его вам должен сообщить покупатель!') then Exit;
    if DM.qrRes.FieldByName('iddoc').AsInteger<>eID then
     begin
      MainF.MessBox('Введен неверный номер заказа!');
      Exit;
     end;
   end;
}
  Flag:=1;
  MainF.ForReserve:=True;
  Close;
 end;

procedure TWorkResF.bbSetResClick(Sender: TObject);
 begin
  if DM.qrRes.IsEmpty then Exit;
  if DM.qrRes.FieldByName('Closed').AsInteger<>1 then Exit;
  if MainF.MessBox('Вы действительно хотите заново установить бронь?'#10#10'Бронь будет установлена с учетом текущих остатков!',52)<>ID_YES then Exit;
  try
   DM.Qr4.Close;
   DM.Qr4.SQL.Clear;
   DM.Qr4.SQL.Add('update DtRes set kol=(case when kol>IsNull((select Sum(ostat) from SprTov s where s.art_code=DtRes.art_code),0) then ');
   DM.Qr4.SQL.Add('                     IsNull((select Sum(ostat) from SprTov s where s.art_code=DtRes.art_code),0) else kol end) ');
   DM.Qr4.SQL.Add('where idres='+DM.qrRes.FieldByName('idres').AsString);
   DM.Qr4.SQL.Add('delete from DtRes where kol<=0 and idres='+DM.qrRes.FieldByName('idres').AsString);
   DM.Qr4.SQL.Add('delete from DhRes where idres not in (select idres from DtRes)');

   DM.Qr4.SQL.Add('update DhRes set Closed=0,id_close=null,date_close=null where idres='+DM.qrRes.FieldByName('idres').AsString);
   DM.Qr4.ExecSQL;
   FilterRes;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику брони: '+E.Message);
  end;
 end;

procedure TWorkResF.FormActivate(Sender: TObject);
 begin
  FilterRes;
 end;


procedure TWorkResF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  if db.DataSource.DataSet.FieldByName('IsAssembly').AsInteger=1 then
   db.Canvas.Brush.Color:=$00C7DAC2;

  if DataCol=5 then
   Case db.DataSource.DataSet.FieldByName('TypeBrI').AsInteger of
    1:db.Canvas.Brush.Color:=clYellow;
    2:db.Canvas.Brush.Color:=clLime;
   end;

  if (db.DataSource.DataSet.FieldByName('Priznak').AsInteger=7) and
     (db.DataSource.DataSet.FieldByName('TypeZakazR').AsInteger=5) and
     (DataCol=6) then
   db.Canvas.Brush.Color:=clAqua;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);

  db.Canvas.Pen.Color:=clWhite;

  db.Canvas.MoveTo(Rect.Left,Rect.Bottom);
  db.Canvas.LineTo(Rect.Right+1,Rect.Bottom);

  db.Canvas.MoveTo(Rect.Right,Rect.Top);
  db.Canvas.LineTo(Rect.Right,Rect.Bottom+1);

  if (gdSelected in State) then
   begin
    db.Canvas.Pen.Color:=$00C08000;
    db.Canvas.Brush.Color:=$00C08000;
    db.Canvas.FillRect(Rect);

    db.Canvas.Font.Color:=clBlack;
    db.Canvas.TextOut(Rect.Left+2, Rect.Top+2,Column.Field.AsString);
    db.Canvas.Font.Color:=clWhite;
{
    db.Canvas.MoveTo(Rect.Left,Rect.Bottom);
    db.Canvas.LineTo(Rect.Right+1,Rect.Bottom);
}
    db.Canvas.MoveTo(Rect.Right,Rect.Top);
    db.Canvas.LineTo(Rect.Right,Rect.Bottom);
   end;
 end;

procedure TWorkResF.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  db.Canvas.Pen.Color:=clWhite;

  db.Canvas.MoveTo(Rect.Left,Rect.Bottom);
  db.Canvas.LineTo(Rect.Right+1,Rect.Bottom);

  db.Canvas.MoveTo(Rect.Right,Rect.Top);
  db.Canvas.LineTo(Rect.Right,Rect.Bottom+1);

  if (gdSelected in State) then
   begin
    db.Canvas.Pen.Color:=$008080FF;
    db.Canvas.Brush.Color:=$008080FF;
    db.Canvas.FillRect(Rect);

    db.Canvas.Font.Color:=clBlack;
    if DataCol=1 then db.Canvas.TextOut(Rect.Left+2, Rect.Top+2,Column.Field.AsString)
                 else db.Canvas.TextOut(Rect.Right-db.Canvas.TextWidth(Column.Field.AsString)-3, Rect.Top+2,Column.Field.AsString);

    db.Canvas.Font.Color:=clWhite;
{
    db.Canvas.MoveTo(Rect.Left,Rect.Bottom);
    db.Canvas.LineTo(Rect.Right+1,Rect.Bottom);
}
    db.Canvas.MoveTo(Rect.Right,Rect.Top);
    db.Canvas.LineTo(Rect.Right,Rect.Bottom);
   end;
 end;

procedure TWorkResF.BitBtn1Click(Sender: TObject);
var Res:Integer;
 begin
  if DM.qrRes.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите пометить бронь как собранную?',52)<>ID_YES then Exit;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spY_SetOrderAsAssembly '+DM.qrRes.FieldByName('idres').AsString+','+IntToStr(Prm.ID_Gamma);
   DM.QrEx.Open;
   Res:=DM.QrEx.FieldByName('Res').AsInteger;
   FilterRes;
   Case Res of
    -1:MainF.MessBox('Данная бронь уже собрана '+DM.QrEx.FieldByName('Date_Assembly').AsString+' сотрудником '+DM.QrEx.FieldByName('Fio_Assembly').AsString);
     1:MainF.MessBox('Признак "Собранный" успешно установлен!',64);
   end;
   BitBtn4Click(sender);
  except
   on E:Exception do MainF.RegisterError('Ошибка установки признака "Собранный": ',E.Message);
  end;
 end;

//----- Кнопка печать заказа ---------------------------------------------------
procedure TWorkResF.BitBtn4Click(Sender: TObject);
var
//  f: TextFile;
//  tmpADOQuery: TADOQuery;
  cSumma: Currency;
  sSumma: String;
  Tb: TTableObj;
begin
  if DM.qrRes.IsEmpty then Exit;

  if DM.qrRes.FieldByName('Priznak').AsInteger=6 then //страховая
  begin
    DM.Qr.Close;
    //2 - параметр в запросе ( отдельный запрос в хранимой процедуре spY_DtResList). Идет условие if @Param=2
    DM.Qr.SQL.Text:='exec spY_DtResList '+DM.qrRes.FieldByName('idres').AsString+',2';
    DM.Qr.Open;

    PrintRep.Clear;
    PrintRep.SetDefault;
    PrintRep.Qr:=DM.Qr;

    PrintRep.Orientation:=O_PORTR;      //Ориентация страницы
    PrintRep.Font.Name:='Arial';
    PrintRep.Font.Size:=5;

    PrintRep.Font.Style:=[fsBold];
    PrintRep.Align:=AL_CENTER;
    PrintRep.AddText('Чек/заказ №'+DM.qrRes.FieldByName('idres').AsString+' от '+FormatDateTime('DD.MM.YYYY',DM.qrRes.FieldByName('date_res').AsDateTime)+#10#10);
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.Align:=AL_LEFT;
    PrintRep.Font.Size:=4;
    PrintRep.AddText('По заявке: ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(DM.qrRes.FieldByName('NumOrder').AsString+#10#10);
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];

    PrintRep.AddText(#10);
    PrintRep.AddText('Страховая компания: ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(DM.qrRes.FieldByName('StrahDescr').AsString+#10);
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText('Застрахованное лицо: ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(DM.qrRes.FieldByName('fio_assembly').AsString);
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText(', полис: ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(DM.qrRes.FieldByName('nn_polis').AsString);
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText(', тел.: ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(DM.qrRes.FieldByName('phone').AsString+#10);
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText(#10);

    PrintRep.AddText('Аптека: ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(Prm.AptekaNameRU);
    with TADOQuery.Create(self) do
    begin
      try
        Connection:=DM.ADOCo;
        SQL.Clear;
        SQL.Add('select isnull(adress,0) as adress from APTEKS where id_apteka = '+IntToStr(Prm.AptekaID));
        SQL.Add('');
        Open;
        if (not IsEmpty)and(length(trim(FieldByName('adress').AsString))>0) then
          PrintRep.AddText(' ('+FieldByName('adress').AsString+')'+#10)
        else
          PrintRep.AddText(#10);
      finally
        Free;
      end;
    end;
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];


    PrintRep.AddText('Юридическое лицо: ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(Prm.FirmNameRU+#10);
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText('Телефон для справки: +38 (044) 593-12-03'+#10);

    if length(trim(DM.qrRes.FieldByName('Comment').AsString))>0 then
    begin
      PrintRep.AddText('Комментарии к заказу: ');
      PrintRep.Font.Style:=[fsBold];
      PrintRep.AddText(DM.qrRes.FieldByName('Comment').AsString+#10);
      PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];

      PrintRep.AddText('Дата выполнения заказа: ');
      PrintRep.Font.Style:=[fsBold];
      PrintRep.AddText(FormatDateTime('DD.MM.YYYY HH:MM',Now())+#10);
      PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    end;
    PrintRep.AddText(#10);
    PrintRep.AddText('Товары в заказе: '+#10#10);
    //Таблица
    PrintRep.Font.Size:=4;
    PrintRep.PrintTable(False,0,0);
    PrintRep.Font.Size:=4;

    //Саша Малахов 02.08.2018 звонил (Сергею?) и выяснил, что
    //Итого за заказ - это оплата страховой, а франшиза и сумма заказа никак не влияет на итого
    //PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(#10);
    PrintRep.Align:=AL_RIGHT;
    PrintRep.AddText('Итого по заказу ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(CurrencyToStr(DM.qrRes.FieldByName('Bezn1').AsCurrency));
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText(' грн.'+#10);

    //Получаем сумму по заказу
    with TADOQuery.Create(self) do
    begin
      try
        Connection:=DM.ADOCo;
        SQL.Clear;
        SQL.Add('select');
        SQL.Add('  SUM(KOL*cena) as SUMMA');
        SQL.Add('from');
        SQL.Add('  DTRES (nolock)');
        SQL.Add('where');
        SQL.Add('  IDRES = ' + DM.qrRes.FieldByName('idres').AsString);
        SQL.Add('');
        Open;
        cSumma:=FieldByName('SUMMA').AsCurrency;
        sSumma:=CurrencyToStr(FieldByName('SUMMA').AsCurrency);
      finally
        Free;
      end;
    end;
    //PrintRep.AddText(#10);
    //PrintRep.AddText(#10);

    PrintRep.Align:=AL_RIGHT;
    //PrintRep.AddText('Сумма заказа = ');
    //PrintRep.Font.Style:=[fsBold];
    //PrintRep.AddText(sSumma);
    //PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    //PrintRep.AddText(' грн.'+#10);

    //Процент франшизы от суммы
    PrintRep.AddText('Франшиза (');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(CurrencyToStr(DM.qrRes.FieldByName('fransh').AsCurrency/cSumma*100));
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText('%) ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(CurrencyToStr(DM.qrRes.FieldByName('fransh').AsCurrency));
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText(' грн.'+#10);

    PrintRep.AddText('ВСЕГО К ОПЛАТЕ ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(CurrencyToStr(DM.qrRes.FieldByName('Bezn1').AsCurrency));
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText(' грн '+#10);
    //PrintRep.AddText(#10);
    //PrintRep.AddText(#10);
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);

    Tb:=nil;
    PrintRep.AddTable(2,2);
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('1500,1000');
    Tb.SetBorders(1,1,2,2,EMPTY_BORDER);
    Tb.Cell[1,1].Font.Size:=4;
    Tb.Cell[1,1].Align:=AL_CENTER;
    Tb.Cell[1,1].Font.Style:=[fsBold];
    Tb.Cell[1,1].AddText(DM.qrRes.FieldByName('fio_assembly').AsString+#10);
    Tb.Cell[1,1].Font.Style:=Tb.Cell[1,1].Font.Style-[fsBold];
    //Tb.Cell[1,2].TopBorder:=DEFAULT_BORDER;
    Tb.Cell[2,2].TopBorder:=DEFAULT_BORDER;
    Tb.Cell[1,2].Align:=AL_CENTER;
    Tb.Cell[2,2].Align:=AL_CENTER;
    Tb.Cell[1,2].Font.Size:=3;
    Tb.Cell[2,2].Font.Size:=3;
    Tb.Cell[1,2].AddText('(Ф.И.О. клиента)');
    Tb.Cell[2,2].AddText('(подпись клиента)');


    PrintRep.PreView;
(*
    DM.Qr.Close;
    //2 - параметр в запросе ( отдельный запрос в хранимой процедуре spY_DtResList). Идет условие if @Param=2
    DM.Qr.SQL.Text:='exec spY_DtResList '+DM.qrRes.FieldByName('idres').AsString+',2';
    DM.Qr.Open;

    PrintRep.Clear;
    PrintRep.SetDefault;
    PrintRep.Qr:=DM.Qr;

    PrintRep.Orientation:=O_PORTR;      //Ориентация страницы
    PrintRep.Font.Name:='Arial';
    PrintRep.Font.Size:=5;

    PrintRep.Font.Style:=[fsBold];
    PrintRep.Align:=AL_CENTER;
    PrintRep.AddText('Чек/заказ №'+DM.qrRes.FieldByName('idres').AsString+' от '+FormatDateTime('DD.MM.YYYY',DM.qrRes.FieldByName('date_res').AsDateTime)+#10#10);
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.Align:=AL_LEFT;
    PrintRep.Font.Size:=4;
    PrintRep.AddText('По заявке: ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(DM.qrRes.FieldByName('NumOrder').AsString+#10#10);
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText('Фирма: ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText('Фирма: '+Prm.FirmNameRU+#10);
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText('(телефон справки аптеки страховых: +38 (044) 593-12-03)'+#10);
    PrintRep.AddText(#10);
    PrintRep.AddText('Заказ страховой: ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(DM.qrRes.FieldByName('StrahDescr').AsString+#10);
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText('ЗЛ: ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(DM.qrRes.FieldByName('fio_assembly').AsString);
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText(', полис: ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(DM.qrRes.FieldByName('nn_polis').AsString);
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText(', тел.: ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(DM.qrRes.FieldByName('phone').AsString+#10);
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText(#10);
    PrintRep.AddText('Бронь в аптеке: ');
    PrintRep.Font.Style:=[fsBold];
    with TADOQuery.Create(self) do
    begin
      try
        Connection:=DM.ADOCo;
        SQL.Clear;
        SQL.Add('select isnull(adress,0) as adress from APTEKS where id_apteka = '+IntToStr(Prm.AptekaID));
        SQL.Add('');
        Open;
        if (not IsEmpty)and(length(trim(FieldByName('adress').AsString))>0) then
          PrintRep.AddText(FieldByName('adress').AsString+#10)
        else
          PrintRep.AddText(#10);
      finally
        Free;
      end;
    end;
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];

    if length(trim(DM.qrRes.FieldByName('Comment').AsString))>0 then
    begin
      PrintRep.AddText('Комментарии к заказу: ');
      PrintRep.Font.Style:=[fsBold];
      PrintRep.AddText(DM.qrRes.FieldByName('Comment').AsString+#10);
      PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];

      PrintRep.AddText('Дата выполнения заказа: ');
      PrintRep.Font.Style:=[fsBold];
      PrintRep.AddText(FormatDateTime('DD.MM.YYYY HH:MM',Now())+#10);
      PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    end;
    PrintRep.AddText(#10);
    PrintRep.AddText('Товары в заказе: '+#10#10);
    //Таблица
    PrintRep.Font.Size:=4;
    PrintRep.PrintTable(False,0,0);
    PrintRep.Font.Size:=4;

    //Саша Малахов 02.08.2018 звонил (Сергею?) и выяснил, что
    //Итого за заказ - это оплата страховой, а франшиза и сумма заказа никак не влияет на итого
    //PrintRep.Font.Style:=[fsUnderline];
    PrintRep.AddText(#10);
    PrintRep.Align:=AL_RIGHT;
    PrintRep.AddText('ИТОГО ПО ЗАКАЗУ ');
    PrintRep.Font.Style:=[fsBold,fsUnderline];
    PrintRep.AddText(CurrencyToStr(DM.qrRes.FieldByName('Bezn1').AsCurrency));
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold,fsUnderline];
    PrintRep.AddText(' грн.'+#10);

    //Получаем сумму по заказу
    with TADOQuery.Create(self) do
    begin
      try
        Connection:=DM.ADOCo;
        SQL.Clear;
        SQL.Add('select');
        SQL.Add('  SUM(KOL*cena) as SUMMA');
        SQL.Add('from');
        SQL.Add('  DTRES (nolock)');
        SQL.Add('where');
        SQL.Add('  IDRES = ' + DM.qrRes.FieldByName('idres').AsString);
        SQL.Add('');
        Open;
        cSumma:=FieldByName('SUMMA').AsCurrency;
        sSumma:=CurrencyToStr(FieldByName('SUMMA').AsCurrency);
      finally
        Free;
      end;
    end;
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);

    PrintRep.Align:=AL_LEFT;
    PrintRep.AddText('Сумма заказа = ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(sSumma);
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText(' грн.'+#10);

    //Процент франшизы от суммы
    PrintRep.AddText('Франшиза - ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(CurrencyToStr(DM.qrRes.FieldByName('fransh').AsCurrency/cSumma*100));
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText('% = ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(CurrencyToStr(DM.qrRes.FieldByName('fransh').AsCurrency));
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText(' грн.'+#10);

    PrintRep.AddText('Оплата страховой = ');
    PrintRep.Font.Style:=[fsBold];
    PrintRep.AddText(CurrencyToStr(DM.qrRes.FieldByName('Bezn1').AsCurrency));
    PrintRep.Font.Style:=PrintRep.Font.Style-[fsBold];
    PrintRep.AddText(' грн '+#10);
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);
    PrintRep.AddText(#10);

    Tb:=nil;
    PrintRep.AddTable(2,2);
    Tb:=PrintRep.LastTable;
    Tb.SetWidths('1500,1000');
    Tb.SetBorders(1,1,2,2,EMPTY_BORDER);
    Tb.Cell[1,1].Font.Size:=4;
    Tb.Cell[1,1].Align:=AL_CENTER;
    Tb.Cell[1,1].Font.Style:=[fsBold];
    Tb.Cell[1,1].AddText(DM.qrRes.FieldByName('fio_assembly').AsString+#10);
    Tb.Cell[1,1].Font.Style:=Tb.Cell[1,1].Font.Style-[fsBold];
    Tb.Cell[1,2].TopBorder:=DEFAULT_BORDER;
    Tb.Cell[2,2].TopBorder:=DEFAULT_BORDER;
    Tb.Cell[1,2].Align:=AL_CENTER;
    Tb.Cell[2,2].Align:=AL_CENTER;
    Tb.Cell[1,2].Font.Size:=3;
    Tb.Cell[2,2].Font.Size:=3;
    Tb.Cell[1,2].AddText('(Ф.И.О. клиента)');
    Tb.Cell[2,2].AddText('(подпись клиента)');


    PrintRep.PreView;
*)
  end
  else
  //Это не интернет заказ и этот работает, как надо
  begin
    DM.Qr.Close;
    DM.Qr.SQL.Text:='exec spY_DtResList '+DM.qrRes.FieldByName('idres').AsString+',1';
    DM.Qr.Open;

    PrintRep.Clear;
    PrintRep.SetDefault;
    PrintRep.Qr:=DM.Qr;
    PrintRep.Orientation:=O_LANDS;
    PrintRep.Font.Name:='Arial';
    PrintRep.Font.Size:=5;

    PrintRep.AddText('Заказ № '+DM.qrRes.FieldByName('idres').AsString+#10);
    PrintRep.AddText('ФИО: '+DM.qrRes.FieldByName('FIO').AsString+#10);
    PrintRep.AddText('Дата бронирования: '+DM.qrRes.FieldByName('Date_Res').AsString+#10);
    PrintRep.AddText('Тип заказа: '+DM.qrRes.FieldByName('TypeBr').AsString+#10#10);

    PrintRep.Font.Size:=4;
    PrintRep.PrintTable(False,0,0);

    //PrintRep.AddText('Тест'+DM.qrRes.FieldByName('idres').AsString+#10);

    PrintRep.PreView;
  end;
end;

procedure TWorkResF.BitBtn5Click(Sender: TObject);
var Blob:TMemoryStream;
    G:TGuid;
    FName,ExtN:String;
    Res:Cardinal;
 begin
  if DM.qrRes.IsEmpty then Exit;

  if DM.qrRes.FieldByName('IsFilePolice').AsInteger=0 then
   begin
    MainF.MessBox('Файл полиса не прикреплен. По данному вопросу обращайтесь к менеджерам по страховым через Call-центр!');
    Exit;
   end;

  CreateGUID(G);
  ForceDirectories('C:\LOG\TmpFiles\');
  DelDir('C:\LOG\TmpFiles\*');
  ExtN:=ExtractFileExt(DM.qrRes.FieldByname('fnameblob').AsString);
  FName:='C:\LOG\TmpFiles\'+GUIDToString(G)+ExtN;
//  ShowMessage(FName);
  DeleteFile(FName);
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select Data from dhres_blob where id='+DM.qrRes.FieldByName('id_blob').AsString;
   DM.QrEx.Open;
   if DM.QrEx.IsEmpty then Exit;

   Blob:=TADOBlobStream.Create(TBlobField(DM.QrEx.FieldByName('Data')),bmRead);
   try
    Blob.SaveToFile(FName);
   finally
    Blob.Free;
   end;

  Res:=ShellExecute(0,'open',PChar(FName),nil,nil,SW_SHOWNORMAL);
//  ShowMessageI(Res);
  if Res<32 then
   WinExec(PChar(FName),SW_SHOW);

  except
   on E:Exception do
    MainF.RegisterError('Открытие файла полиса',E.Message,True);
  end;
 end;

procedure TWorkResF.FormClose(Sender:TObject; var Action:TCloseAction);
 begin
  if Flag=0 then MainF.DeleteKurZakaz(IDRes_Kur);
 end;

procedure TWorkResF.CheckBox1Click(Sender: TObject);
 begin
  FilterRes;
 end;

procedure TWorkResF.BitBtn_select_medClick(Sender: TObject);
var curr_med:integer;
begin//
    try
        Fedit_filter:=TFedit_filter.Create(Self);
        try
            with Fedit_filter.ADOQ_edit_filtr do
            begin
                Close;
                SQL.Clear;
                parameters.Clear;
                SQL.Add('select id, MedName from apteka_net..sprmed with(nolock)');
                SQL.Add('order by MedName');
                Open;
                Locate('MedName',DM.qrRes.FieldByName('institutionName').AsString,[]);
            end;
            with Fedit_filter.DBG_filtr do
            begin
                Columns.Clear;
                Columns.Add();
                Columns[0].Field:=Fedit_filter.ADOQ_edit_filtr.FieldByName('MedName');
                Columns[0].Title.Caption:='Мед. учреждение';
                Columns[0].Width:=Width-10;
                Fedit_filter.Curr_field:=Columns[0].Field.FieldName;
                Fedit_filter.filter_name:=Columns[0].Field.FieldName;
                Fedit_filter.search_type:=1;    //фильтр
            end;

            Fedit_filter.ShowModal;

            if Fedit_filter.filter_status=0 then//фильтр применен
            begin
                Label17.Caption:=Fedit_filter.ADOQ_edit_filtr.FieldByName('MedName').AsString;
                curr_med:=Fedit_filter.ADOQ_edit_filtr.FieldByName('id').AsInteger;
                with DM.Qrtmp do
                begin
//                    showmessage(DM.qrRes.FieldByName('PrefixID').AsString);
                    Close;
                    SQL.Clear;
                    parameters.Clear;
                    SQL.Add('update APTEKA_NET.dbo.dhres');
                    SQL.Add('set institutionCode=:PCode, institutionName=:PName');
                    SQL.Add('where PrefixID=:PPrefixID');
                    parameters.ParamByName('PCode').Value:=Fedit_filter.ADOQ_edit_filtr.FieldByName('id').AsInteger;
                    parameters.ParamByName('PName').Value:=Fedit_filter.ADOQ_edit_filtr.FieldByName('MedName').AsString;
                    parameters.ParamByName('PPrefixID').Value:=DM.qrRes.FieldByName('PrefixID').AsInteger;
                    ExecSQL;
                    DM.qrRes.Close;
                    DM.qrRes.Open;
                end;
                //  institutionCode
                //  institutionName
            end;
        finally
        Fedit_filter.Free;
        end;
    except
    end;

end;

end.

Рекомендуем Вам фитосироп Первоцвет, который эффективен при сухом и влажном кашле различной этиологии – трахеите, бронхите, кашле, вызванном табачным дымом, спазмолитическом кашле и при старческом кашле, вызванном недостаточностью кровоснабжения легк
