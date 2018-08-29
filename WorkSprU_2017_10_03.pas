unit WorkSprU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Menus, DB, PrintReport, Util;

type

  TWorkSprF = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    btPrCennik: TBitBtn;
    dbgSpr: TDBGrid;
    pnSearch: TPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    dbgSpis: TDBGrid;
    bbLt: TBitBtn;
    bbClear: TBitBtn;
    bbInv: TBitBtn;
    Panel5: TPanel;
    Label4: TLabel;
    lbSum: TLabel;
    btPrCennikAkcia: TBitBtn;
    btPrCennikAkcia15: TBitBtn;
    bbBack: TBitBtn;
    bbPrnSpis: TBitBtn;
    pmPrnReg: TPopupMenu;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    bbCloseBox: TBitBtn;
    bbPrintStik: TBitBtn;
    bbAktBrak: TBitBtn;
    N3: TMenuItem;
    bbAddAll: TBitBtn;
    bbSrokMonth: TBitBtn;
    pmSrok: TPopupMenu;
    cbZero: TCheckBox;
    BitBtn3: TBitBtn;
    bbZakazSkl: TBitBtn;
    bbZakazWait: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    bbZakazPOstav: TBitBtn;

    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cbZeroClick(Sender: TObject);
    procedure dbgSprKeyPress(Sender: TObject; var Key: Char);
    procedure dbgSprKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgSprDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure dbgSprDblClick(Sender:TObject);
    procedure dbgSpisKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure bbClearClick(Sender:TObject);
    procedure btPrCennikClick(Sender: TObject);
    procedure bbLtClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbInvClick(Sender: TObject);
    procedure cbPercKeyPress(Sender: TObject; var Key:Char);
    procedure cbPercChange(Sender: TObject);
    procedure btPrCennikAkciaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbBackClick(Sender: TObject);
    procedure dbgSpisDrawColumnCell(Sender: TObject; const Rect: TRect;  DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgSpisKeyPress(Sender: TObject; var Key: Char);
    procedure bbPrnSpisClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure bbCloseBoxClick(Sender: TObject);
    procedure bbPrintStikClick(Sender: TObject);
    procedure bbAktBrakClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure bbAddAllClick(Sender: TObject);
    procedure bbSrokMonthClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure bbZakazSklClick(Sender: TObject);
    procedure bbZakazPOstavClick(Sender: TObject);

  private

    FUserID:Integer;
    FFlag:Integer;
    DtVz:TDateTime;
    FSr:String;
    FPrVozr:Integer;

    procedure FilterSpis;
    procedure EnterKol(DS:TDataSet; Scan:Byte=0; Silent:Boolean=False);
    procedure ClearSpis(P:Byte; AC:Integer=0);
    procedure PrintMarkBox;

    function  FilterSpr:Boolean;
    procedure PrintReg(Param: Byte);
    procedure SetSr(const Value: String);

  public

    property PrVozr:Integer read FPrVozr write FPrVozr;
    property Flag:Integer read FFlag write FFlag;

    property Sr:String read FSr write SetSr;

  end;

procedure ShowWorkSprF(P:Byte; Dt:TDateTime=0);

var WorkSprF:TWorkSprF=nil;

implementation

uses MainU, DataModuleU, ShowKolForVozrU, DateBackU, ClDiagU, PrVozrU, PrintMarkBoxU, EnterValueU, ShareU,
     AddResU,ShowTextU, BackSkladInfoU, ZakazPriceU;

{$R *.dfm}

procedure ShowWorkSprF(P:Byte; Dt:TDateTime=0);
var PrVozr,i:Integer;
 begin
  if Not (P in [W_ZAKAZSKL,W_ZAKAZWAIT]) then
   if Not MainF.CheckPassword(MainF.GetPasswRep) then Exit;

  try
   MainF.tmrUpdateVersion.Enabled:=False;
   MainF.tmrWaitMess.Enabled:=False;

   try

    if P=W_BACK1 then  // Возврат на склад
    try
     BackSkladInfoF:=TBackSkladInfoF.Create(nil);
     try
      BackSkladInfoF.ShowModal;
     finally
      BackSkladInfoF.Free;
     end;
    except
    end;

    if P in [W_BACK,W_BACK1] then
     begin

      DM.Qr.Close;
      DM.Qr.SQL.Text:='select top 1 prVozr from Inform..TMP_SPIS where IsNull(prvozr,-1) in (select id from SprPrVozr) and compname=host_name() and id_user='+IntToStr(-Prm.UserID)+' and priznak='+IntToStr(P);
      DM.Qr.Open;

      if DM.Qr.IsEmpty then
       begin
        PrVozrF:=TPrVozrF.Create(nil);
        try
         Application.ProcessMessages;
         PrVozrF.ShowModal;
         if PrVozrF.Flag=-1 then Exit;
         PrVozr:=PrVozrF.Flag;
        finally
         PrVozrF.Free;
        end;
       end else PrVozr:=DM.Qr.FieldByName('prvozr').AsInteger;
     end;

    if WorkSprF=nil then WorkSprF:=TWorkSprF.Create(nil);

    WorkSprF.Flag:=P;
    WorkSprF.PrVozr:=PrVozr;
    WorkSprF.btPrCennik.Enabled:=False;
    WorkSprF.btPrCennikAkcia.Enabled:=False;
//    WorkSprF.btPrCennikAkcia15.Enabled:=False;
    WorkSprF.bbLt.Enabled:=False;
    WorkSprF.bbInv.Enabled:=False;
    WorkSprF.bbBack.Visible:=False;
    WorkSprF.Label1.Caption:='Справочник товаров';
    WorkSprF.bbPrnSpis.Enabled:=False;
    WorkSprF.dbgSpis.Options:=WorkSprF.dbgSpis.Options+[dgEditing];
    WorkSprF.bbPrintStik.Enabled:=False;
    WorkSprF.bbCloseBox.Enabled:=False;
    WorkSprF.bbAktBrak.Visible:=False;
    WorkSprF.N3.Visible:=False;
//    WorkSprF.btPrCennikAkcia15.Visible:=True;
    WorkSprF.bbAddAll.Visible:=False;
    WorkSprF.bbSrokMonth.Visible:=False;
    WorkSprF.bbZakazSkl.Visible:=False;
    WorkSprF.bbZakazWait.Visible:=False;

    WorkSprF.dbgSpr.Columns[7].Visible:=False;
    WorkSprF.dbgSpr.Columns[8].Visible:=False;
    WorkSprF.dbgSpr.Columns[9].Visible:=False;
    WorkSprF.dbgSpis.Columns[10].Visible:=False;
    WorkSprF.dbgSpis.Columns[11].Visible:=False;
    WorkSprF.dbgSpis.Columns[12].Visible:=False;

    WorkSprF.dbgSpr.Top:=0;
    WorkSprF.dbgSpr.Height:=370;
    for i:=2 to 6 do WorkSprF.dbgSpr.Columns[i].Visible:=True;

    WorkSprF.dbgSpr.Columns[7].Visible:=False;
    WorkSprF.dbgSpr.Columns[8].Visible:=False;
    WorkSprF.dbgSpr.Columns[9].Visible:=False;
    WorkSprF.dbgSpr.Columns[1].Width:=606;

    for i:=2 to 9 do WorkSprF.dbgSpis.Columns[i].Visible:=True;

    WorkSprF.dbgSpis.Columns[1].Width:=360;
    WorkSprF.dbgSpis.Columns[10].Visible:=False;
    WorkSprF.dbgSpis.Columns[11].Visible:=False;
    WorkSprF.dbgSpis.Columns[12].Visible:=False;
    WorkSprF.bbZakazPOstav.Visible:=False;

    Case P of
     W_CENNIK,W_CENNIKSROK: begin
                             WorkSprF.N3.Visible:=True;
                             WorkSprF.bbCloseBox.Visible:=False;
                             WorkSprF.bbAktBrak.Visible:=True;
                             WorkSprF.btPrCennik.Enabled:=True;  WorkSprF.btPrCennikAkcia.Enabled:=True; {WorkSprF.btPrCennikAkcia15.Enabled:=True;}
                             if P=W_CENNIKSROK then
                              begin
//                               WorkSprF.btPrCennikAkcia15.Visible:=False;
                               WorkSprF.bbAddAll.Visible:=True;
                               WorkSprF.bbSrokMonth.Visible:=True;
                              end;
                            end;
     W_LT,W_LTM: WorkSprF.bbLt.Enabled:=True;
     W_PEREUCHET:WorkSprF.bbInv.Enabled:=True;
     W_BACK:begin
             WorkSprF.dbgSpis.Options:=WorkSprF.dbgSpis.Options-[dgEditing];
             WorkSprF.DtVz:=Dt;
             WorkSprF.bbBack.Visible:=True;
             WorkSprF.bbBack.Enabled:=True;
             WorkSprF.bbPrnSpis.Enabled:=True;
             WorkSprF.Label1.Caption:='Список для возврата от '+DateTimeToStr(WorkSprF.DtVz);
            end;
     W_BACK1:begin
              WorkSprF.bbCloseBox.Visible:=True;
              WorkSprF.bbCloseBox.Enabled:=True;
              WorkSprF.bbPrintStik.Enabled:=True;
              WorkSprF.bbBack.Visible:=True;
              WorkSprF.bbBack.Enabled:=True;
              WorkSprF.bbPrnSpis.Enabled:=True;
             end;
     W_ZAKAZSKL:begin
                 with WorkSprF do
                  begin
                   bbZakazSkl.Visible:=True;
                   for i:=2 to 6 do dbgSpr.Columns[i].Visible:=False;

                   dbgSpr.Columns[7].Visible:=True;
                   dbgSpr.Columns[8].Visible:=True;
                   dbgSpr.Columns[9].Visible:=True;
                   dbgSpr.Columns[1].Width:=665;

                   dbgSpr.Top:=70;
                   dbgSpr.Height:=300;

                   for i:=2 to 9 do dbgSpis.Columns[i].Visible:=False;

                   dbgSpis.Columns[1].Width:=671;
                   dbgSpis.Columns[10].Visible:=True;
                   dbgSpis.Columns[11].Visible:=True;
                   dbgSpis.Columns[12].Visible:=True;
                   bbZakazPOstav.Visible:=True;

                  end;
                end;
     W_ZAKAZWAIT:begin
                  WorkSprF.bbZakazWait.Visible:=True;
                 end;
    end;

    if WorkSprF.Flag in [W_BACK,W_BACK1] then WorkSprF.FUserID:=-Prm.UserID
                                         else WorkSprF.FUserID:=Prm.UserID;

    Application.ProcessMessages;
    WorkSprF.ShowModal;
   except
    WorkSprF:=nil;
    MainF.MessBox(ER_CR_FORM);
   end;
  finally
   MainF.tmrUpdateVersion.Enabled:=True;
   MainF.tmrWaitMess.Enabled:=True;
  end;
 end;

procedure TWorkSprF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  Flag:=0;
  Sr:='';
  if MainF.FullSprTov then
   begin
    dbgSpr.Columns[2].Visible:=False;
    dbgSpr.Columns[3].Visible:=False;
    dbgSpr.Columns[1].Width:=783;
   end;
{  CheckBox2.Visible:=Prm.RealizMinus;
  CheckBox2.Checked:=Prm.RealizMinus;
 }
 //CheckBox2.Checked:=True;
//  Prm.VSPriznak:=0;
 end;

procedure TWorkSprF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

function TWorkSprF.FilterSpr:Boolean;
var i,AC,AC1:Integer;
    ss:String;
    NewItem:TMenuItem;
 begin
  try
   AC:=-1; AC1:=-1; ss:='';

{   if Flag=W_CENNIKSROK then  ss:=',IsNull((select Max(skd) from AddSkd aa where aa.art_code=a.art_code and getdate() between aa.DtStart and aa.DtEnd ),0) as SkdSrok'
                        else  ss:=',0.00 as SkdSrok ';
 }
   if Not DM.qrSpr.IsEmpty then
    begin
     AC:=DM.qrSpr.FieldByName('Art_Code').AsInteger;
     DM.qrSpr.Prior;
     AC1:=DM.qrSpr.FieldByName('Art_Code').AsInteger;
     DM.qrSpr.Next;
    end;

   DM.qrSpr.Close;
   DM.qrSpr.SQL.Clear;

   if Flag=W_ZAKAZSKL then
    begin
     DM.qrSpr.SQL.Add('exec spY_ListForZakazSkl 1');
    end else
   if Flag=W_ZAKAZWAIT then
    begin
     DM.qrSpr.SQL.Add('exec spY_ListForZakazSkl 2');
    end else
   if Flag<>W_Back then
    begin

     DM.qrSpr.SQL.Add('select a.Art_Code,a.names as names,');

     if Flag=W_BACK1 then
      DM.qrSpr.SQL.Add('Sum(ostat)-IsNull((select Sum(kol) from Inform..Tmp_Spis ttt where ttt.art_code=a.art_code and ttt.Priznak='+IntToStr(Flag)+'),0) as Kol,Max(Cena) as Cena,IsNull((select Max(n.Art_Code) from NoScan n where n.art_code=a.art_Code),0) as IsScan ') else
     if Flag=W_LTM then
      begin

       DM.qrSpr.SQL.Add('Sum(ostat)+IsNull((select Sum(kol) from Inform..Tmp_Spis ttt where ttt.art_code=a.art_code and ttt.Priznak='+IntToStr(Flag)+'),0)');
       DM.qrSpr.SQL.Add('          +IsNull((select Sum(kol) from Inform..DhLt h, Inform..DtLt t where t.iddoc=h.iddoc and t.art_code=a.art_code and h.Priznak=3),0) as Kol,');
       DM.qrSpr.SQL.Add('Max(Cena) as Cena, IsNull((select Max(n.Art_Code) from NoScan n where n.art_code=a.art_Code),0) as IsScan ')

      end else DM.qrSpr.SQL.Add('Sum(ostat) as Kol,Max(Cena) as cena,IsNull((select Max(n.Art_Code) from NoScan n where n.art_code=a.art_Code),0) as IsScan ');

     DM.qrSpr.SQL.Add('     ,IsNull(convert(varchar,Max(r.P1)),'''')+IsNull(Max(r.L1),'''') as PL1, ');
     DM.qrSpr.SQL.Add('      IsNull(convert(varchar,Max(r.P2)),'''')+IsNull(Max(r.L2),'''') as PL2, ');
     DM.qrSpr.SQL.Add('      IsNull(convert(varchar,Max(r.P3)),'''')+IsNull(Max(r.L3),'''') as PL3, 0 KolUp, 0 as CenaUp, 0 as Koef   ');

     if Flag=W_LTM then
      begin
       DM.qrSpr.SQL.Add('from SprTov a left join Inform..SprReg r on a.art_code=r.art_code where ostat<0 ');
      end else DM.qrSpr.SQL.Add('from SprTov a left join Inform..SprReg r on a.art_code=r.art_code where 1=1 ');
//               DM.qrSpr.SQL.Add('from SprTov a where art_code not in (select art from tmpa) ');

     if cbZero.Checked then
      DM.qrSpr.SQL.Add(' and a.ostat>0  ');
     if Flag=W_CENNIKSROK then
      DM.qrSpr.SQL.Add(' and a.art_code in (select askd.art_code from AddSkd askd where getdate() between DtStart and DtEnd) and a.ostat>0 and a.names like ''%([0-9][0-9].[0-9][0-9])%''  ');

     if Flag=W_BACK1 then
      begin
       if cbZero.Checked then
        DM.qrSpr.SQL.Add(' and a.ostat>0 ');
       Case PrVozr of
//       16:DM.qrSpr.SQL.Add(' and a.art_code in (95265,144863)  ');
        16:DM.qrSpr.SQL.Add(' and a.names like ''Хлад_ген%''  ');
        19:DM.qrSpr.SQL.Add(' and a.names like ''Ящик%''  ');
        20:DM.qrSpr.SQL.Add(' and a.names like ''Крышка%''  ')
           else begin
//                DM.qrSpr.SQL.Add(' and (a.art_code not in (95265,144863)  ');
                 DM.qrSpr.SQL.Add(' and (a.names not like ''Хлад_ген%''  ');
                 DM.qrSpr.SQL.Add('  and a.names not like ''Ящик%''  ');
                 DM.qrSpr.SQL.Add('  and a.names not like ''Крышка%'' ) ');
                end;
       end;
      end;

     if Flag in [W_LT] then
      begin
       DM.qrSpr.SQL.Add('and ( a.names not like ''%([0-9][0-9].[0-9][0-9])%'' or (a.names like ''%([0-9][0-9].[0-9][0-9])%'' and  ');
       DM.qrSpr.SQL.Add('convert(datetime,''01.''+substring(a.Names,PatIndex(''%([0-9][0-9].[0-9][0-9])%'',a.Names)+1,5),4)>getdate() ))');
      end;

     DM.qrSpr.SQL.Add('group by a.Art_Code,a.Names');
     if Flag=W_LTM then
      begin
       DM.qrSpr.SQL.Add('having Sum(ostat)+IsNull((select Sum(kol) from Inform..Tmp_Spis ttt where ttt.art_code=a.art_code and ttt.Priznak='+IntToStr(Flag)+'),0)');
       DM.qrSpr.SQL.Add('          +IsNull((select Sum(kol) from Inform..DhLt h, Inform..DtLt t where t.iddoc=h.iddoc and t.art_code=a.art_code and h.Priznak=3),0)<0');
      end;

     if Flag in [W_LT] then
      begin
       DM.qrSpr.SQL.Add(' union all ');
       DM.qrSpr.SQL.Add('select p.art_code,p.names+'' ''+p.manufacturer,0,0,0, ');

       DM.qrSpr.SQL.Add('      IsNull(convert(varchar,r.P1),'''')+IsNull(r.L1,'''') as PL1, ');
       DM.qrSpr.SQL.Add('      IsNull(convert(varchar,r.P2),'''')+IsNull(r.L2,'''') as PL2, ');
       DM.qrSpr.SQL.Add('      IsNull(convert(varchar,r.P3),'''')+IsNull(r.L3,'''') as PL3, 0 KolUp, 0 as CenaUp, 0 as Koef   ');

       DM.qrSpr.SQL.Add('from Plist p (nolock) left join Inform..SprReg r (nolock) on p.art_code=r.art_code  ');
       DM.qrSpr.SQL.Add('where p.art_code not in (select art_code from SprTov) and  ');
       DM.qrSpr.SQL.Add('( p.names not like ''%([0-9][0-9].[0-9][0-9])%'' or (p.names like ''%([0-9][0-9].[0-9][0-9])%'' and  ');
       DM.qrSpr.SQL.Add('convert(datetime,''01.''+substring(p.Names,PatIndex(''%([0-9][0-9].[0-9][0-9])%'',p.Names)+1,5),4)>getdate() ))');
      end;

     DM.qrSpr.SQL.Add('order by Names');
    end else begin
              DM.qrSpr.SQL.Add('select a.art_code,b.names,(case when ');
              DM.qrSpr.SQL.Add('                           a.kol-IsNull((select Sum(ch.kol) from Chek ch where ch.art_code=a.art_code and ch.compname=host_name() and ch.id_user='+IntToStr(FUserID)+'),0)  ');
              DM.qrSpr.SQL.Add('                           -IsNull((select Sum(kol) from Moves m, SprTov s where m.kod_name=s.kod_name and m.iddoc=a.idvzr and s.art_code=a.art_code),0)>b.ostat then b.ostat else ');
              DM.qrSpr.SQL.Add('                           a.kol-IsNull((select Sum(ch.kol) from Chek ch where ch.art_code=a.art_code and ch.compname=host_name() and ch.id_user='+IntToStr(FUserID)+'),0)  ');
              DM.qrSpr.SQL.Add('                           -IsNull((select Sum(kol) from Moves m, SprTov s where m.kod_name=s.kod_name and m.iddoc=a.idvzr and s.art_code=a.art_code),0) end) as kol,       ');

              DM.qrSpr.SQL.Add('       b.cena,IsNull((select Max(n.Art_Code) from NoScan n where n.art_code=a.art_Code),0) as IsScan, ');
              DM.qrSpr.SQL.Add('       IsNull(convert(varchar,r.P1,'''')+IsNull(r.L1,'''') as PL1, ');
              DM.qrSpr.SQL.Add('       IsNull(convert(varchar,r.P2,'''')+IsNull(r.L2,'''') as PL2, ');
              DM.qrSpr.SQL.Add('       IsNull(convert(varchar,r.P3,'''')+IsNull(r.L3,'''') as PL3 ');

              DM.qrSpr.SQL.Add('from SpisVozr a left join Inform..SprReg r on a.art_code=r.art_code,                                                                                                           ');
              DM.qrSpr.SQL.Add('     (select art_code,names,Sum(ostat) as Ostat,Max(cena) as cena from SprTov where ostat>0 group by art_code,names) as b  ');

              DM.qrSpr.SQL.Add('where a.DtVz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DtVz)+''' and                                                        ');
              DM.qrSpr.SQL.Add('      a.art_code=b.art_code and                                                                                            ');
{
              DM.qrSpr.SQL.Add('      (case when a.kol>b.ostat then b.ostat else a.kol end)                                                               ');
              DM.qrSpr.SQL.Add('      -IsNull((select Sum(ch.kol) from Chek ch where ch.art_code=a.art_code and ch.compname=host_name() and ch.id_user='+IntToStr(FUserID)+'),0)  ');
              DM.qrSpr.SQL.Add('      -IsNull((select Sum(kol) from Moves m, SprTov s where m.kod_name=s.kod_name and m.iddoc=a.idvzr and s.art_code=a.art_code),0)>0 ');
}
              DM.qrSpr.SQL.Add('      (case when a.kol-IsNull((select Sum(ch.kol) from Chek ch where ch.art_code=a.art_code and ch.compname=host_name() and ch.id_user='+IntToStr(FUserID)+'),0)  ');
              DM.qrSpr.SQL.Add('                      -IsNull((select Sum(kol) from Moves m, SprTov s where m.kod_name=s.kod_name and m.iddoc=a.idvzr and s.art_code=a.art_code),0)>b.ostat then b.ostat else ');
              DM.qrSpr.SQL.Add('                 a.kol-IsNull((select Sum(ch.kol) from Chek ch where ch.art_code=a.art_code and ch.compname=host_name() and ch.id_user='+IntToStr(FUserID)+'),0)  ');
              DM.qrSpr.SQL.Add('                      -IsNull((select Sum(kol) from Moves m, SprTov s where m.kod_name=s.kod_name and m.iddoc=a.idvzr and s.art_code=a.art_code),0) end)>0        ');

              DM.qrSpr.SQL.Add('order by 2  ');

             end;

//   DM.qrSpr.SQL.SaveToFile('C:\Log\987.txt');

   DM.qrSpr.Open;
   if Not DM.qrSpr.Locate('Art_Code',AC,[]) then DM.qrSpr.Locate('Art_Code',AC1,[]);

   // Формируем список месяцев для сроков
   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('select substring(names,patindex(''%(__.__)%'',names)+1,5) as Mn ');
   DM.Qr.SQL.Add('from SprTov                                                   ');
   DM.Qr.SQL.Add('where art_code in (select art_code from AddSkd where getdate() between DtStart and DtEnd) and ');
   DM.Qr.SQL.Add('      ostat>0 and ');
   DM.Qr.SQL.Add('      names like ''%(__.__)%'' ');
   DM.Qr.SQL.Add('group by substring(names,patindex(''%(__.__)%'',names)+1,5) ');
   DM.Qr.SQL.Add('order by 1 ');
   DM.Qr.Open;
   pmSrok.Items.Clear;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     NewItem:=TMenuItem.Create(Self);
     NewItem.Name:='imSr'+IntToStr(i);
     NewItem.Caption:=DM.Qr.FieldByName('Mn').AsString;
     NewItem.Hint:=DM.Qr.FieldByName('Mn').AsString;
     NewItem.OnClick:=bbAddAllClick;
     pmSrok.Items.Add(NewItem);
    end;

   Result:=True;
  except
   on E:Exception do
    begin
     Result:=False;
     MainF.MessBox('Ошибка доступа к справочнику товаров: '+E.Message);
    end;
  end;
 end;

Procedure TWorkSprF.FilterSpis;
var AC:Integer;
 begin
  try
   lbSum.Caption:='0.00';
   AC:=-1;
   if Not DM.qrList.IsEmpty then AC:=DM.qrList.FieldByName('Art_Code').AsInteger;

   if Flag<>W_BACK then
    begin
     DM.Qr.Close;
     DM.Qr.SQL.Text:='delete from Inform..TMP_SPIS where kol<=0 and compname=host_name() and id_user='+IntToStr(FUserID)+' and Priznak='+IntToStr(Flag);
     DM.Qr.ExecSQL;

     DM.qrList.Close;
     DM.qrList.SQL.Clear;
     DM.qrList.SQL.Add('select t.*,t.kol*t.cena-convert(numeric(12,2),t.kol*t.cena*(skd/100.)) as Summa, ');
     DM.qrList.SQL.Add('       convert(numeric(12,2),t.kol*t.cena*(skd/100.)) as SumSkd, t.Printing, ');
     DM.qrList.SQL.Add('       IsNull(convert(varchar,r.P1),'''')+IsNull(r.L1,'''') as PL1, ');
     DM.qrList.SQL.Add('       IsNull(convert(varchar,r.P2),'''')+IsNull(r.L2,'''') as PL2, ');
     DM.qrList.SQL.Add('       IsNull(convert(varchar,r.P3),'''')+IsNull(r.L3,'''') as PL3 ');

     DM.qrList.SQL.Add('from Inform..TMP_SPIS t (nolock) ');
     DM.qrList.SQL.Add('      left join ');
     DM.qrList.SQL.Add('     Inform..SprReg r (nolock) on t.art_code=r.art_code ');
     DM.qrList.SQL.Add('where t.compname=host_name() and ');
     DM.qrList.SQL.Add('      t.id_user='+IntToStr(FUserID)+' and ');
     DM.qrList.SQL.Add('      t.Priznak='+IntToStr(Flag)+' order by Names ');
     DM.qrList.Open;
     DM.qrList.Locate('Art_Code',AC,[]);

     DM.QrEx.Close;
     DM.QrEx.SQL.Clear;
     DM.QrEx.SQL.Add('select Sum(t.kol*t.cena)-IsNull(Sum(convert(numeric(12,2),t.kol*t.cena*(skd/100.))),0) as Summa');
     DM.QrEx.SQL.Add('from Inform..Tmp_Spis t');
     DM.QrEx.SQL.Add('where compname=host_name() and id_user='+IntToStr(FUserID)+' and Priznak='+IntToStr(Flag));
     DM.QrEx.Open;
    end else begin
              DM.qrList.Close;
              DM.qrList.SQL.Clear;
              DM.qrList.SQL.Add('select a.art_code,Max(a.names) as Names,Sum(a.kol) as kol,a.cena,a.f_nds,a.type_tov,a.printing,a.skd, ');
              DM.qrList.SQL.Add('       IsNull(Sum(a.sumskd),0) as SumSkd,Sum(a.kol*a.cena)-IsNull(Sum(a.sumskd),0) as Summa, ');
              DM.qrList.SQL.Add('       IsNull(convert(varchar,r.P1),'''')+IsNull(r.L1,'''') as PL1, ');
              DM.qrList.SQL.Add('       IsNull(convert(varchar,r.P2),'''')+IsNull(r.L2,'''') as PL2, ');
              DM.qrList.SQL.Add('       IsNull(convert(varchar,r.P3),'''')+IsNull(r.L3,'''') as PL3  ');
              DM.qrList.SQL.Add('from Chek a (nolock) ');
              DM.qrList.SQL.Add('      left join ');
              DM.qrList.SQL.Add('     Inform..SprReg r (nolock) on a.art_code=r.art_code ');
              DM.qrList.SQL.Add('where a.compname=host_name() and a.id_user='+IntToStr(FUserID));
              DM.qrList.SQL.Add('group by a.art_code,a.cena,a.f_nds,a.type_tov,a.printing,a.skd');
              DM.qrList.SQL.Add('order by 2');
              DM.qrList.Open;
              DM.qrList.Locate('Art_Code',AC,[]);
              DM.QrEx.Close;
              DM.QrEx.SQL.Clear;
              DM.QrEx.SQL.Add('select Sum(kol*cena)-IsNull(Sum(sumskd),0) as Summa');
              DM.QrEx.SQL.Add('from Chek a');
              DM.QrEx.SQL.Add('where a.compname=host_name() and a.id_user='+IntToStr(FUserID));
              DM.QrEx.Open;
             end;
   lbSum.Caption:=CurrToStrF(DM.QrEx.FieldByName('Summa').AsFloat,ffFixed,2);
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к списку товаров: '+E.Message);
  end;
 end;

procedure TWorkSprF.cbZeroClick(Sender:TObject);
 begin
  FilterSpr;
 end;

procedure TWorkSprF.EnterKol(Ds:TDataSet; Scan:Byte=0; Silent:Boolean=False);
var Art_Code,id_zam,Kol,Koef:Integer;
    Nm,Res:String;
 begin
  if Ds.IsEmpty then Exit;
  Art_Code:=Ds.FieldByName('Art_Code').AsInteger;
  if Flag<>W_BACK then
   begin

    if Silent then Kol:=Ds.FieldByName('Kol').AsInteger
              else Kol:=MainF.GetKolFromDialog(Ds.FieldByName('Names').AsString,1,Art_Code,id_zam,EN_SIMPLE);

    if Flag=W_ZAKAZSKL then
     begin

      DM.QrEx.Close;
      DM.QrEx.SQL.Text:='select Sum(kol) as kol from Inform..TMP_SPIS (nolock) where compname=host_name() and IsNull(Shtrih,0)=0 and id_user='+IntToStr(FUserID)+' and art_code='+IntToStr(Art_Code)+' and priznak= '+IntToStr(Flag);
//      DM.QrEx.SQL.SaveToFile('c:\log\kl.txt');
      DM.QrEx.Open;
      if Kol+DM.QrEx.FieldByName('Kol').AsInteger>DM.qrSpr.FieldByName('Kol').AsInteger then
       begin
        MainF.MessBox('Превышено количество остатка на складе!');
        Exit;
       end;

     end;

    if Flag in [W_BACK1,W_LTM] then
     begin
      DM.Qr.Close;
      DM.Qr.SQL.Clear;
      DM.Qr.SQL.Add('select names,Sum(ostat)');
      Case Flag of
       W_BACK1:begin
                if FPrVozr<>18 then
                 DM.Qr.SQL.Add('-IsNull((select Sum(t.kol) from DhRes h, DtRes t where h.idres=t.idres and IsNull(Closed,0)=0 and t.art_code=s.art_code),0) ');
                DM.Qr.SQL.Add('-IsNull((select Sum(kol) from Inform..Tmp_Spis ss where ss.art_code=s.art_code and ss.priznak='+IntToStr(Flag)+'),0) as Kol ');
               end;
       W_LTM:begin
                DM.Qr.SQL.Add('+IsNull((select Sum(kol) from Inform..DhLt h, Inform..DtLt t where t.iddoc=h.iddoc and t.art_code=s.art_code and h.Priznak=3),0)');
                DM.Qr.SQL.Add('+IsNull((select Sum(kol) from Inform..Tmp_Spis ss where ss.art_code=s.art_code and ss.priznak='+IntToStr(Flag)+'),0) as Kol ');
               end;
      end;

      DM.Qr.SQL.Add('from SprTov s where art_code='+IntToStr(Art_Code)+' group by art_code,names');
//      DM.qr.SQL.SaveToFile('C:\987.txt');
      DM.Qr.Open;
      if Abs(DM.Qr.FieldbyName('Kol').AsInteger)<Kol then
       begin
        MainF.MessBox('Введеное количество превышает остаток для товара: '#10#10+DM.Qr.FieldbyName('Names').AsString);
        Exit;
       end;
     end;

    if Kol<=0 then Exit;

    Koef:=1;
    if Flag=W_ZAKAZSKL then Koef:=Ds.FieldByName('Koef').AsInteger;


    if Flag in [W_CENNIK,W_LT] then if Kol>500 then Kol:=500;
    try
     if DS.FieldByName('IsScan').AsInteger<>0 then Scan:=1;

     if Flag=W_ZAKAZSKL then
      begin
       DM.Qr.Close;
       DM.Qr.SQL.Clear;
 //    DM.Qr.SQL.Add('if (select Sum(ostat) from SprTov (nolock) where art_code='+IntToStr(Art_Code)+')>='+IntToStr(Kol*Koef)+' select 0 as Res else select 1 as Res');
       DM.Qr.SQL.Add('exec spY_CheckEnterKolForZakazSkl '+IntToStr(Art_code)+','+IntToStr(Kol));

       DM.Qr.Open;
       if DM.Qr.FieldByName('Res').AsInteger=0 then
        begin

         MainF.MessBox('У Вас на остатках достаточное количество данного товара. Для того чтобы заказать на складе данную товарную позиции, сначала нужно продать то, что есть на остатках!',
                       48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
         Exit;
        end else
       if DM.Qr.FieldByName('Res').AsInteger=2 then
        begin

         MainF.MessBox('В открытых чеках находится достаточное количество данного препарата! Для того чтобы заказать на складе данную товарную позиции, сначала нужно продать то, что есть на остатках и то что находится в открытых чеках!',
                       48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
         Exit;
        end;
      end;

     DM.Qr.Close;
     DM.Qr.SQL.Clear;

     DM.Qr.SQL.Add('if (select Count(*) from Inform..TMP_SPIS where compname=host_name() and IsNull(Shtrih,0)=0 and id_user='+IntToStr(FUserID)+' and art_code='+IntToStr(Art_Code)+' and priznak= '+IntToStr(Flag)+')<=0');
     DM.Qr.SQL.Add(' Insert into Inform..TMP_SPIS(art_code,names,kol,cena,id_user,priznak,skd,printing,compname,prvozr,kolup,cenaup,koef)');
     DM.Qr.SQL.Add(' Values('+IntToStr(Art_Code)+','''+Ds.FieldByName('Names').AsString+''',');
     DM.Qr.SQL.Add(IntToStr(Kol*Koef)+','+Ds.FieldByName('Cena').AsString+','+IntToStr(FUserID)+','+IntToStr(Flag)+',3,'+IntToStr(Scan)+',host_name(),'+IntToStr(PrVozr)+',');
     DM.Qr.SQL.Add(IntToStr(Kol)+','+Ds.FieldByName('CenaUp').AsString+','+IntToStr(Koef)+')');
     DM.Qr.SQL.Add('else');
     DM.Qr.SQL.Add(' Update Inform..TMP_SPIS set Kol=Kol+'+IntToStr(Kol*Koef)+',');
     DM.Qr.SQL.Add('                             KolUp=KolUp+'+IntToStr(Kol));
     DM.Qr.SQL.Add(' where compname=host_name() and IsNull(Shtrih,0)=0 and id_user='+IntToStr(FUserID)+' and art_code='+IntToStr(Art_Code));
     DM.Qr.SQL.Add('select 9999 as Res ');
//     DM.Qr.SQL.SaveToFile('c:\log\vz.txt');
     DM.Qr.Open;
     if Flag in [W_BACK1,W_LTM] then FilterSpr;
     if Silent=False then FilterSpis;
    except
     on E:Exception do MainF.MessBox('Ошибка добавление в список товаров! '+E.Message);
    end;
   end else try
             Nm:=Ds.FieldbyName('Names').AsString;
             if Not FilterSpr then Exit;
             Kol:=Ds.FieldbyName('Kol').AsInteger;
             if (Art_code<>Ds.FieldbyName('Art_code').AsInteger) or (Kol<=0) then
              begin
               MainF.MessBox('Препарата "'+Nm+'" уже нет на остатках. Он либо продан, либо набрат в чек!');
               Exit;
              end;
             if Not ShowKolForVozr(Nm,Kol) then Exit;

             DM.spY_EnterKol.Parameters.ParamValues['@part_code']:=Art_code;
             DM.spY_EnterKol.Parameters.ParamValues['@pold_art']:=Art_code;
             DM.spY_EnterKol.Parameters.ParamValues['@pkol']:=Kol;
             DM.spY_EnterKol.Parameters.ParamValues['@piduser']:=FUserID;
             DM.spY_EnterKol.Parameters.ParamValues['@ptm']:=0;
             DM.spY_EnterKol.Parameters.ParamValues['@simp']:=1;
             DM.spY_EnterKol.Parameters.ParamValues['@idres']:=1;
//             DM.spY_EnterKol.Parameters.ParamValues['@ForBack']:=1;
             if Ds.FieldByName('IsScan').AsInteger>0 then
              DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=1
             else
              DM.spY_EnterKol.Parameters.ParamValues['@pscan']:=Scan;
             if (Flag=W_BACK1) and (FPrVozr=18) then DM.spY_EnterKol.Parameters.ParamValues['@Force']:=1
                                                else DM.spY_EnterKol.Parameters.ParamValues['@Force']:=0;
             DM.ADOCo.BeginTrans;
             try
              DM.spY_EnterKol.ExecProc;
//              DM.spY_EnterKol.Parameters.ParamValues['@ForBack']:=0;

              if DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']=21 then
               raise EAbort.Create('Введеное количество превышает остаток склада'+#10+'Или товар забрал другой оператор либо товар находиться в спике забронированных!') else
              if DM.spY_EnterKol.Parameters.ParamValues['@RETURN_VALUE']<>0 then
               raise EAbort.Create('Ошибка добавления в чек препарата "'+Nm+'"!');

              DM.ADOCo.CommitTrans;
              FilterSpr;
              FilterSpis;
             except
              DM.ADOCo.RollbackTrans;
              raise;
             end;
            except
             on E:Exception do MainF.MessBox(E.Message);
            end;
 end;

procedure TWorkSprF.dbgSprKeyPress(Sender:TObject; var Key:Char);
var S:String;
    Ind:Integer;
    IsFind:Boolean;
 begin
  if Sender=Nil then Exit;
  S:=pnSearch.Caption;
  Ind:=TDBGrid(Sender).SelectedIndex;
  if Ind>1 then Ind:=1;
  MainF.dbGKeyPress(TDBGrid(Sender),Key,S,Ind,SC_FIND,0,IsFind);
  pnSearch.Caption:=S;
  if isFind then EnterKol(TDBGrid(Sender).DataSource.DataSet,1);
 end;

procedure TWorkSprF.dbgSprKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key in K_ARROW_KEYS then pnSearch.Caption:='';
  if Key=VK_RETURN then EnterKol(TDBGrid(Sender).DataSource.DataSet,0);
 end;

procedure TWorkSprF.dbgSprDrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
var db:TDBGrid;
    dR,sR:TRect;
    S:String;
      i:Integer;
 begin
  if Sender=nil then Exit;

  db:=TDBGrid(Sender);
  if (db.DataSource.DataSet.FieldByName('KOL').AsInteger<=0) and (Flag<>W_LTM) then
   begin
    db.Canvas.Brush.Color:=clRed;
    db.Canvas.Font.Color:=clWhite;
   end;

  try
   if High(MainF.FArtCodeList)>=db.DataSource.DataSet.FieldByName('art_code').AsInteger then
    if (MainF.FArtCodeList[db.DataSource.DataSet.FieldByName('art_code').AsInteger].Color<>-1) and (DataCol in [2,3]) then
     db.Canvas.Brush.Color:=MainF.FArtCodeList[db.DataSource.DataSet.FieldByName('art_code').AsInteger].Color;
  except
  end;

  if (db.DataSource.DataSet.FieldByName('IsScan').AsInteger<>0) and(DataCol=0) then
   begin
    db.Canvas.Brush.Color:=$00FFD98A;
    db.Canvas.Font.Color:=clBlack;
   end;



  if gdSelected in State then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);

{
  S:=Column.Field.AsString;
  if db.Canvas.TextWidth(S)>Rect.Right-Rect.Left then
   begin
    for i:=Length(S) downto 1 do
     begin
      S:=Copy(S,1,Length(S)-1);
      if db.Canvas.TextWidth(S)<=Rect.Right-Rect.Left-db.Canvas.TextWidth('...') then
       begin
        db.Canvas.FillRect(Rect);
        db.Canvas.TextOut(Rect.Left+2, Rect.Top+2,S+'...');
        Break;
       end
     end

   end;
}
  {--- Рисование значка "Разрешенные для несканирования"}
  if (db.DataSource.DataSet.FieldByName('IsScan').AsInteger<>0) and (DataCol=0) then
   begin
    dR:=Rect;
    dr.Left:=dr.Left+2; dr.Top:=dr.Top+2;
    dr.Right:=dR.Left+MainF.imNoScan.Width; dr.Bottom:=dR.Top+MainF.imNoScan.Height;
    sR.Left:=0; sR.Top:=0;
    sR.Right:=MainF.imNoScan.Width; sR.Bottom:=MainF.imNoScan.Height;
    db.Canvas.CopyRect(dR,MainF.imNoScan.Canvas,sR);
   end;

 end;

procedure TWorkSprF.N1Click(Sender:TObject);
 begin
  if dbgSpr.Focused then MainF.ShowEAN13(dbgSpr.DataSource.DataSet) else
  if dbgSpis.Focused then MainF.ShowEAN13(dbgSpis.DataSource.DataSet);
 end;

procedure TWorkSprF.dbgSprDblClick(Sender:TObject);
 begin
  if Sender=nil then Exit;
  EnterKol(TDBGrid(Sender).DataSource.DataSet);
 end;

procedure TWorkSprF.dbgSpisKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if (ssctrl in shift) and (key=vk_delete) then key:=0;

  if Key in K_ARROW_KEYS then Sr:='';
  if Key=VK_RETURN then
   if DM.qrList.State in [dsEdit] then
    begin
     DM.qrList.Post;
     FilterSpr;
     FilterSpis;
    end;

  if (Key=VK_DELETE) then
   if (DM.qrList.IsEmpty=False) and (Flag=W_BACK) then
    if MainF.MessBox('Удалить позициию "'+DM.qrList.FieldByName('names').AsString+'"?',52)=ID_YES then
     try
      DM.Qr5.Close;
      DM.Qr5.SQL.Text:=' update SprTov set ostat=ostat+b.kol '#10+
                       ' from SprTov a, Chek b'+#10+
                       ' where a.kod_name=b.kod_name and b.compname=host_name() and b.id_user='+IntToStr(FUserID)+' and b.art_code='+DM.qrList.FieldByName('art_code').AsString+#10+
                       ' delete from Chek where compname=host_name() and id_user='+IntToStr(FUserID)+' and IsNull(Shtrih,0)='+IntToStr(DM.qrList.FieldByName('Shtrih').AsInteger)+' and art_code='+DM.qrList.FieldByName('art_code').AsString;
      DM.Qr5.ExecSQL;
      FilterSpr;
      FilterSpis;
     except
      on E:Exception do MainF.MessBox('Ошибка удаления позиции из списка: '+E.Message);
     end;
 end;

procedure TWorkSprF.ClearSpis(P:Byte; AC:Integer=0);
var S,S1:String;
 begin
  try
   S:='';
   S1:='';
   if AC<>0 then
    begin
     S:= ' and art_code='+IntToStr(AC);
     S1:=' and b.art_code='+IntToStr(AC);
    end;

   DM.Qr.Close;

   if Flag<>W_BACK then
    DM.Qr.SQL.Text:='delete from Inform..TMP_SPIS where compname=host_name() and id_user='+IntToStr(FUserID)+' and priznak='+IntToStr(Flag)+s
   else begin
         DM.Qr.SQL.Text:=' update SprTov set ostat=ostat+b.kol '#10+
                         ' from SprTov a, Chek b'+#10+
                         ' where a.kod_name=b.kod_name and b.compname=host_name() and b.id_user='+IntToStr(FUserID)+s1+#10+
                         ' delete from Chek where compname=host_name() and id_user='+IntToStr(FUserID)+s;
        end;

   DM.Qr.ExecSQL;
   if P<>0 then
    begin
     if Flag in [W_BACK,W_LTM] then FilterSpr;
     FilterSpis;
    end;
  except
   on E:Exception do if P<>0 then MainF.MessBox('Ошибка очистки списка товаров: '+E.Message);
  end;
 end;

procedure TWorkSprF.bbClearClick(Sender:TObject);
 begin
  if DM.qrList.IsEmpty then Exit;
  if MainF.MessBox('Очистить список?',52)<>ID_YES then Exit;
  ClearSpis(1);
 end;

procedure TWorkSprF.btPrCennikClick(Sender: TObject);
 begin
  if DM.qrList.IsEmpty then Exit;
  //PrintCennikList(DM.qrList,Flag,FUserID,CheckBox2.Checked,CheckBox1.Checked,False);
  PrintCennikListExt(DM.qrList,Flag,CheckBox2.Checked,CheckBox1.Checked,False);
 end;
{
var Cnt,i,k,j,SkdSrok:Integer;
    ss,ss1:String;
 begin
  if DM.qrList.IsEmpty then Exit;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('select (Case when b.f_nds<=2 then 1 else 2 end) as F_NDS       ');
   DM.QrEx.SQL.Add('from Inform..TMP_SPIS a, SprTov b');
   DM.QrEx.SQL.Add('where a.art_code=b.art_code and a.priznak='+IntToStr(Flag)+' and a.compname=host_name() and a.id_user='+IntToStr(FUserID));
   DM.QrEx.SQL.Add('group by (Case when b.f_nds<=2 then 1 else 2 end)              ');
   DM.QrEx.Open;
   PrintRep(1).Clear;
   PrintRep.SetDefault;
   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('declare @ean13 varchar(13), @SkdSrok numeric(8,2), @CenaP numeric(8,2), @CenaOpt numeric(8,2), @Cena numeric(8,2) ');
     DM.Qr.SQL.Add('set @SkdSrok=0');
     DM.Qr.SQL.Add('if Object_ID(N''tempdb..#cennik'') is not null drop table #cennik');
     DM.Qr.SQL.Add('select top 0 convert(int,1) as art_code,convert(varchar(200),'' '') as names,convert(numeric(8,2),1.01) as cena, convert(varchar(13),'' '') as EAN13, convert(numeric(8,2),0) SkdSrok, '+'convert(numeric(8,2),1.01) as cenap, convert(numeric(8,2),1.01) as cenaopt into #cennik');
     for j:=1 to DM.qrList.RecordCount do
      begin
       if j=1 then DM.qrList.First else DM.qrList.Next;
       Cnt:=DM.qrList.FieldByName('Kol').AsInteger;
       if Cnt>50 then Cnt:=50;
       for k:=1 to Cnt do
        begin

         DM.Qr.SQL.Add('set @ean13=IsNull((select Max(ean13) from SprEAN where art_code='+DM.qrList.FieldByName('Art_Code').AsString+' ),'''')');
         if Flag=W_CENNIKSROK then
          DM.Qr.SQL.Add('set @SkdSrok=IsNull((select Max(skd) from AddSkd where art_code='+DM.qrList.FieldByName('Art_Code').AsString+' and getdate() between DtStart and DtEnd ),0) ');
         DM.Qr.SQL.Add('set @CenaP=IsNull((select Max(cenap) from SprTovar where art_code='+DM.qrList.FieldByName('Art_Code').AsString+'),0) ');

//         DM.Qr.SQL.Add('set @CenaOpt=IsNull((select Max(cenaopt) from SprTovar where art_code='+DM.qrList.FieldByName('Art_Code').AsString+'),0) ');
         DM.Qr.SQL.Add('set @CenaOpt=dbo.GetCenaOpt('+DM.qrList.FieldByName('Art_Code').AsString+') ');

         DM.Qr.SQL.Add('set @Cena=IsNull((select Max(cena) from SprTov (nolock) where ostat>0 and art_code='+DM.qrList.FieldByName('Art_Code').AsString+'),(select Max(cena) from SprTov (nolock) where art_code='+DM.qrList.FieldByName('Art_Code').AsString+')) ');

         DM.Qr.SQL.Add('Insert into #cennik(art_code,names,cena,ean13,SkdSrok,cenap,cenaopt)');
         DM.Qr.SQL.Add('Values('+DM.qrList.FieldByName('Art_Code').AsString+',');
         DM.Qr.SQL.Add(''''+DM.qrList.FieldByName('Names').AsString+''',');
         DM.Qr.SQL.Add(' @cena, @ean13, @SkdSrok, @cenap, @cenaopt) ');

        end;
      end;
     ss:=''; ss1:=' 1 as Koef, ';

     if CheckBox2.Checked then
      begin
       ss:='*dbo.GetKoef(a.art_code) ';
       ss1:=' dbo.GetKoef(a.art_code) as koef, ';
      end;

     DM.Qr.SQL.Add('select a.art_code,a.names,a.cena'+ss+' as cena,'+ss1+' a.ean13,a.skdsrok,a.cenap'+ss+' as cenap,dbo.GetCenaOpt(a.art_code)'+ss+' as cenaopt,l.art_code as skd3, c.*,');

     if MainF.MaxSkd>0 then
      DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where type_skd=4 and art_code=a.art_code),IsNull((select Max(skd) from Skd where type_skd=1),0)) as Skd ') else

     if MainF.MaxSkd<=-3 then
      DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where skd<3 and type_skd=4 and art_code=a.art_code),'+IntToStr(Abs(Round(MainF.MaxSkd)))+') as Skd ')
     else DM.Qr.SQL.Add(' 0 as Skd ');

     DM.Qr.SQL.Add('from #cennik a left join SkdLimit0 l (nolock) on a.art_code=l.art_code left join Inform..SprReg c (nolock) on a.art_code=c.art_code  ');
     DM.Qr.SQL.Add('order by c.P1,c.P2,c.P3,a.names ');

//     DM.Qr.SQL.SaveToFile('C:\Cennik1.txt');

     DM.Qr.Open;

//     ShowMessageI(PrintRep.ID_Apteka);
//     PrintRep.ID_Apteka:=Prm.AptekaID;
     PrintRep.Qr:=DM.Qr;
     if Flag=W_CENNIKSROK then SkdSrok:=1 else SkdSrok:=0;

     if CheckBox1.Checked then PrintRep.PrintStiker
                          else PrintRep.PrintCennik(Prm.FirmNameUA,MainF.MaxSkd,DM.QrCen,Prm.AptekaID,MainF.PercForPrice,0,Prm.RealizMinus,SkdSrok)

     PrintRep.AddText(#12);
    end;
   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования списка ценников: '+E.Message);
  end;
 end;
 }
procedure TWorkSprF.bbLtClick(Sender:TObject);
var Res:Integer;
 begin
  if MainF.MessBox('Вы действительно хотите сформировать лишний товар?',52)<>ID_YES then Exit;
  DM.AdoCo.BeginTrans;
  Res:=0;
  try

   DM.spY_MakeLt.Close;
   DM.spY_MakeLt.Parameters.ParamValues['@piduser']:=FUserID;
   DM.spY_MakeLt.Parameters.ParamValues['@flag']:=Flag;
   DM.spY_MakeLt.ExecProc;
   Res:=DM.spY_MakeLt.Parameters.ParamValues['@RETURN_VALUE'];

   if Res=-99 then raise EAbort.Create('Неизвестный номер аптеки!') else
   if Res<>100 then Abort;
   DM.AdoCo.CommitTrans;

   FilterSpis;
  except
   on E:Exception do
    begin
     DM.AdoCo.RollbackTrans;
     if Res<>-99 then MainF.MessBox('Ошибка формирования накладных на лишний товар!');
    end;
  end;
 end;

procedure TWorkSprF.FormActivate(Sender: TObject);
 begin
  if (Flag=W_BACK) and (Prm.VSPriznak=0) then ClearSpis(0);
  if (Flag=W_BACK) then Prm.VSPriznak:=0;
  FilterSpr;
  FilterSpis;
 end;

procedure TWorkSprF.bbInvClick(Sender:TObject);
 begin
  if DM.qrList.IsEmpty then Exit;
  DM.Qr.Close;
  DM.Qr.SQL.Text:='select Count(*) as cnt from Pereuchet where dt=convert(datetime,convert(varchar,getdate(),23))';
  DM.Qr.Open;
  if DM.Qr.FieldByName('Cnt').AsInteger>0 then
   if MainF.MessBox('Инвентаризационная ведомость уже сформирована!'+#10#10+
                    'Вы действительно хотите переформировать ведомость?',52)<>ID_YES then Exit;

  DM.ADOCo.BeginTrans;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;

   DM.QrEx.SQL.Add('delete from Pereuchet where dt=convert(datetime,convert(varchar,getdate(),23)) ');
   DM.QrEx.SQL.Add('insert into Pereuchet(dt,art_code,nm_s,cena,kol,blank1,blank2,blank3,nds,type) ');
   DM.QrEx.SQL.Add('select convert(datetime,convert(varchar,getdate(),23)),                        ');
   DM.QrEx.SQL.Add('       a.art_code,a.names,a.cena,Sum(b.ostat),0,0,0,                                  ');
   DM.QrEx.SQL.Add('       case when b.f_nds=2 then ''БезНдс''   when b.f_nds =1 then ''Ндс'' when b.f_nds=3 then ''Ндс'' when b.f_nds =4 then ''БезНдс'' end , ');
   DM.QrEx.SQL.Add('       case when (b.type_tov =1 and b.f_nds=2 )then '' ''   else ''ЧП'' end   ');
   DM.QrEx.SQL.Add('from Inform..TMP_SPIS a, SprTov b                            ');
   DM.QrEx.SQL.Add('where a.art_code=b.art_code and                              ');
   DM.QrEx.SQL.Add('      a.compname=host_name() and a.id_user='+IntToStr(FUserID)+' and a.Priznak='+IntToStr(Flag));
   DM.QrEx.SQL.Add('group by a.art_code,a.names,a.cena,a.kol,b.f_nds,b.type_tov  ');
   DM.QrEx.SQL.Add('delete from Inform..TMP_SPIS where compname=host_name() and id_user='+IntToStr(FUserID)+' and Priznak='+IntToStr(Flag));
   DM.QrEx.ExecSQL;
   DM.ADOCo.CommitTrans;
   FilterSpis;
   MainF.MessBox('Выборочная инвентаризационная ведомость сформирована успешно!',64);
  except
   on E:Exception do
    begin
     DM.ADOCo.RollbackTrans;
     MainF.MessBox('Ошибка формирования выборочной инвентаризационной ведомости! '+E.Message,48);
    end;
  end;
 end;

procedure TWorkSprF.cbPercKeyPress(Sender: TObject; var Key: Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

procedure TWorkSprF.cbPercChange(Sender: TObject);
 begin
{  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='update Inform..Tmp_Spis set Skd='+cbPerc.Text+' where compname=host_name() and id_user='+IntToStr(FUserID)+' and Priznak='+IntToStr(Flag);
   DM.QrEx.ExecSQL;
   FilterSpis;
  except
   on E:Exception do
    MainF.MessBox('Ошибка добавления записи: '+E.Message);
  end;
}
 end;


{procedure TWorkSprF.btPrCennikAkciaClick(Sender:TObject);
var Skd,Tg,i,k,j:Integer;
 begin
  if Not Assigned(Sender) then Exit;
  Tg:=TBitBtn(Sender).Tag;
  if DM.qrList.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите распечатать ценники с акционной ценой?',52)<>ID_YES then Exit;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('select (Case when b.f_nds<=2 then 1 else 2 end) as F_NDS       ');
   DM.QrEx.SQL.Add('from Inform..TMP_SPIS a, SprTov b');
   DM.QrEx.SQL.Add('where a.art_code=b.art_code and a.priznak='+IntToStr(Flag)+' and a.compname=host_name() and a.id_user='+IntToStr(FUserID));
   DM.QrEx.SQL.Add('group by (Case when b.f_nds<=2 then 1 else 2 end)              ');
   DM.QrEx.Open;
   PrintRep(1).Clear;
   PrintRep.SetDefault;
   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else DM.QrEx.Next;
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('declare @ean13 varchar(13)');
     DM.Qr.SQL.Add('if Object_ID(N''tempdb..#cennik'') is not null drop table #cennik');
     DM.Qr.SQL.Add('select top 0 convert(int,1) as art_code,convert(varchar(200),'' '') as names,convert(numeric(8,2),1.01) as cena, convert(varchar(13),'' '') as EAN13 into #cennik');
     for j:=1 to DM.qrList.RecordCount do
      begin
       if j=1 then DM.qrList.First else DM.qrList.Next;
       for k:=1 to DM.qrList.FieldByName('Kol').AsInteger do
        begin
         DM.Qr.SQL.Add('set @ean13=IsNull((select Max(ean13) from SprEAN where art_code='+DM.qrList.FieldByName('Art_Code').AsString+' ),'''')');
         DM.Qr.SQL.Add('Insert into #cennik(art_code,names,cena,ean13)');
         DM.Qr.SQL.Add('Values('+DM.qrList.FieldByName('Art_Code').AsString+',');
         DM.Qr.SQL.Add(''''+'АКЦИЯ'+#10#13+DM.qrList.FieldByName('Names').AsString+''',');
         DM.Qr.SQL.Add(DM.qrList.FieldByName('Cena').AsString+',@ean13)');
        end;
      end;
     DM.Qr.SQL.Add('select *,0 as cenap,0 as cenaopt,l.art_code as Skd3');

     if MainF.MaxSkd>0 then
      DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where type_skd=4 and art_code=a.art_code),IsNull((select Max(skd) from Skd where type_skd=1),0)) as Skd ') else
     if MainF.MaxSkd<=-3 then
      DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where skd<3 and type_skd=4 and art_code=a.art_code),'+IntToStr(Abs(Round(MainF.MaxSkd)))+') as Skd ')
     else
      DM.Qr.SQL.Add('0 as Skd ');

     DM.Qr.SQL.Add('from #cennik a left join SkdLimit0 l (nolock) on a.art_code=l.art_code left join Inform..SprReg c (nolock) on a.art_code=c.art_code  ');
     DM.Qr.SQL.Add('order by c.P1,c.P2,c.P3,a.names');
     DM.Qr.Open;
     PrintRep.Qr:=DM.Qr;

     Case Tg of
      0:Skd:=MainF.PercForPrice;
      1:try
         Skd:=StrToInt(ComboBox1.Text);
        except
         Skd:=MainF.PercForPrice;
        end;
     end;

     if DM.QrEx.FieldbyName('F_NDS').AsInteger<=1 then
      PrintRep.PrintCennik(Prm.FirmNameUA,MainF.MaxSkd,DM.QrCen,Skd,Tg,Prm.RealizMinus)
     else
      PrintRep.PrintCennik(Opt.CHPName,MainF.MaxSkd,DM.QrCen,Skd,Tg,Prm.RealizMinus);
     PrintRep.AddText(#12);
    end;
   PrintRep.PreView;
  except
    on e:Exception do MainF.MessBox('Ошибка формирования списка мегаценников!'+e.Message);
  end;

end; }

procedure TWorkSprF.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  if (Flag=W_BACK) and (Prm.VSPriznak=0) then ClearSpis(0);
 end;

procedure TWorkSprF.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 begin
  if Flag<>W_BACK then begin CanClose:=True; Exit; end;

  if DM.qrList.IsEmpty=False then
   try
    CanClose:=False;
    ClDiagF:=TClDiagF.Create(Self);
    try
     Application.ProcessMessages;
     ClDiagF.ShowModal;
     if ClDiagF.Flag=1 then
      begin
       CanClose:=True;
       if ClDiagF.RadioButton2.Checked then Prm.VSPriznak:=1;
      end;
    finally
     ClDiagF.Free;
    end;
   except
   end;
   //if MainF.MessBox('Внимание! Если закрыть окно, то список который вы набарали или отсканировали исчезнет!'#10#10'Вы действительно хотите закрыть окно?',52)=ID_YES then CanClose:=True else CanClose:=False;
 end;

procedure TWorkSprF.PrintMarkBox;
 begin
  PrintMarkBoxF:=TPrintMarkBoxF.Create(Self);
  try
   PrintMarkBoxF.Flag:=2;
   Application.ProcessMessages;
   PrintMarkBoxF.ShowModal;
   if PrintMarkBoxF.Printed=False then raise EAbort.Create('Стикеры не распечатаны! Возврат НЕ сформирован!');
  finally
   PrintMarkBoxF.Free;
  end;
 end;

procedure TWorkSprF.bbBackClick(Sender:TObject);
var CP:TChekPos;
    UI:Integer;
    s:String;
 begin
  if (Flag=W_BACK1) and (WorkSprF.PrVozr<>16) then
   begin

{    DM.Qr1.Close;
    DM.Qr1.SQL.Text:='select top 1 shtrih from Inform..TMP_SPIS where IsNull(shtrih,0)=0 and compname=host_name() and id_user='+IntToStr(-Prm.UserID)+' and priznak='+IntToStr(Flag);
    DM.Qr1.Open;
    if DM.Qr1.IsEmpty=False then
     begin
      MainF.MessBox('Есть незакрытые ящики!');
      Exit;
     end;
 }  end;

  if MainF.MessBox('Вы действительно хотите сформировать возврат?',52)<>ID_YES then Exit;

  if Flag=W_BACK1 then
   try
    DateBackF:=TDateBackF.Create(Self);
    try
     DateBackF.Flag:=WorkSprF.PrVozr;
     try
      Prm.UserID:=-Abs(Prm.UserID);
      if WorkSprF.PrVozr<>16 then DateBackF.ShowModal else DateBackF.Ex:=False;
      if DateBackF.Ex then Exit;
     finally
      Prm.UserID:=Abs(Prm.UserID);
     end;
    if WorkSprF.PrVozr=-2 then
     begin

      DM.Qr1.Close;
      DM.Qr1.SQL.Clear;
      DM.Qr1.SQL.Add('update Inform..Tmp_Spis set printing=b.printing');
      DM.Qr1.SQL.Add('from Inform..Tmp_Spis a, Chek b');
      DM.Qr1.SQL.Add('where a.ar_code=b.art_code and b.compname=host_name() and a.compname=host_name() and a.id_user=b.id_user and a.id_user='+IntToStr(FUserID)+' a.priznak='+IntToStr(Flag));
      DM.Qr1.ExecSQL;
      FilterSpis;
      MainF.MessBox('В чеке есть позиции, которые вы не можете вернуть с признаком "Переброска"!'+#10+'В чеке они подсвечены желтым цветом!');
     end;

     if DateBackF.Flag<=-1 then Abort;

     CP.Priznak:=WorkSprF.PrVozr;
     CP.VzDescr:=DateBackF.edDescr.Lines.Text;
     CP.IDMess:=0;
     if DateBackF.Flag=1 then
      CP.VzDescr:=CP.VzDescr+'&'+DateBackF.Edit1.Text+'&'+DateBackF.ComboBox1.Text else
     if DateBackF.Flag in [3,4,5,6,7,8] then
      begin
       CP.VzDescr:=CP.VzDescr+'&'+DateBackF.ComboBox1.Text;
       CP.IDMess:=DateBackF.Label12.Tag;
      end else
     if DateBackF.Flag=0 then
      begin
       if CP.VzDescr<>'' then CP.VzDescr:=#10+CP.VzDescr;
       if DateBackF.ComboBox2.ItemIndex=0 then s:=', акт несоответствия со склада есть. ' else
       if DateBackF.ComboBox2.ItemIndex=1 then s:=', акта несоответствия со склада нет. ';
       CP.VzDescr:='По накладной '+DateBackF.lbNakl.Caption+' за '+DateToStr(DateBackF.dtNakl.Date)+s+CP.VzDescr;
      end;

    finally
     DateBackF.Free;
    end;
   except
    Exit;
   end;

//  DM.ADOCo.BeginTrans;
  try
   if Flag=W_BACK then
    begin
     DM.Qr5.Close;
     DM.Qr5.SQL.Text:='select top 1 * from SpisVozr where DtVz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DtVz)+'''' ;
     DM.Qr5.Open;
     CP.Priznak:=DM.Qr5.FieldByName('Priznak').AsInteger;
     CP.Date:=DtVz;
    end else

   if Flag=W_BACK1 then
    begin
     CP.Date:=StrToDate(DateToStr(Date));
     DM.Qr1.Close;
     DM.Qr1.SQL.Clear;
     DM.Qr1.SQL.Add('declare @part_code int, @pkol smallint, @piduser smallint ,@pscan smallint ');
     DM.Qr1.SQL.Add('declare Cur cursor local for select art_code,kol,id_user,printing from Inform..Tmp_Spis where priznak='+IntToStr(Flag)+' and compname=host_name() and id_user='+IntToStr(FUserID));
     DM.Qr1.SQL.Add('open Cur                                                             ');
     DM.Qr1.SQL.Add('fetch Cur into @part_code,@pkol,@piduser,@pscan                      ');
     DM.Qr1.SQL.Add('while @@Fetch_Status = 0                                             ');
     DM.Qr1.SQL.Add(' begin                                                               ');

     if (CP.Priznak in [18,9,14,5]) or (Prm.IsBackAll=True) then
      DM.Qr1.SQL.Add('  exec spY_EnterKol @part_code,@pkol,@piduser,@pscan,@part_code,0,1,0,0,'''','''',0,-1,1,null,null,0,0,0,0,0,0,0,null,0  ')
     else
      DM.Qr1.SQL.Add('  exec spY_EnterKol @part_code,@pkol,@piduser,@pscan,@part_code,0,1,0,0,'''','''',0,-1,0,null,null,0,0,0,0,0,0,0,null,1  ');

     DM.Qr1.SQL.Add('  fetch Cur into @part_code,@pkol,@piduser,@pscan                    ');
     DM.Qr1.SQL.Add(' end                                                                 ');
     DM.Qr1.SQL.Add('close Cur                                                            ');
     DM.Qr1.SQL.Add('deallocate Cur                                                       ');

     DM.Qr1.SQL.Add('update Chek set shtrih=b.shtrih');
     DM.Qr1.SQL.Add('from Chek a, Inform..Tmp_Spis b');
     DM.Qr1.SQL.Add('where a.art_code=b.art_code and a.id_user=b.id_user and a.compname=host_name() and b.priznak='+IntToStr(Flag));
     DM.Qr1.SQL.Add('      and b.compname=host_name() and b.id_user='+IntToStr(FUserID));
//     DM.Qr1.SQL.SaveToFile('c:\back.txt');
     DM.Qr1.SQL.Add('select Sum(kol*cena-sumskd) as SumCh from Chek where compname=host_name() and id_user='+IntToStr(FUserID));
     DM.Qr1.Open;
     CP.SumChek:=0;
    end;

   CP.ID_User:=FUserID;
   CP.NumbChek:=0;
   CP.TypeOplat:=TO_BACK;
   CP.TypeOplatBS:=TO_BACK;
   CP.TypeOplatKur:=TO_BACK;
   CP.ID_Kassa:=Opt.KassaID;
   CP.Vzh:=0;
   CP.PrPayRecipt:=0;
   CP.SumSertif:=0;
   CP.ResBack:=-1;

   DM.WriteChek(CP);

   DM.Qr1.Close;
   DM.Qr1.SQL.Text:='delete from Inform..Tmp_Spis where priznak='+IntToStr(Flag)+' and id_user='+IntToStr(FUserID);
   DM.Qr1.ExecSQL;

//   if (Flag=W_BACK1) and (WorkSprF.PrVozr<>16) then PrintMarkBox;

//   DM.ADOCo.CommitTrans;

   if MainF.Design=False  then
    begin
     FilterSpr;
     FilterSpis;
     MainF.FilterSklad;
    end;
   if CP.ResBack<=-1 then MainF.MessBox('Возврат сформирован успешно, но если его нет в истории накладных или он есть частично, значит возвращаемые позиции пришли от поставщика и тогда по данному вопросу нужно ображаться в отдел розницы!',64) else
   if CP.ResBack=0 then MainF.MessBox('Возврат не сформирован, так как данный товар возвращать нельзя!',48) else
                        MainF.MessBox('Возврат сформирован частично, так как в возврате были позиции, которые возвращать нельзя!',48);
   Close;
  except
   on E:Exception do
    begin
 //    DM.ADOCo.RollBackTrans;
     if E.Message<>'' then MainF.MessBox('Ошибка формирования возврата: '+E.Message);
    end;
  end;
 end;

procedure TWorkSprF.dbgSpisDrawColumnCell(Sender:TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
    pr:Integer;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  if db.DataSource.DataSet.FieldByName('Shtrih').AsInteger>0 then db.Canvas.Brush.Color:=clYellow;

  pr:=db.DataSource.DataSet.FieldByName('PRINTING').AsInteger;
  if pr>0 then
   begin
    if (gdSelected in State) and (DataCol=2) then
     begin
      db.Canvas.Brush.Color:=clNavy;
      db.Canvas.Font.Color:=clWhite;
     end else begin
               Case pr of
                      1:db.Canvas.Brush.Color:=clLime;
                2,3..15:db.Canvas.Brush.Color:=clYellow;
               end;
               db.Canvas.Font.Color:=clBlack;
              end;
    if (db.DataSource.DataSet.FieldByName('Shtrih').AsInteger>0) and (DataCol=6) then db.Canvas.Brush.Color:=clYellow;
   end;
  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure TWorkSprF.dbgSpisKeyPress(Sender:TObject; var Key:Char);
var IsFind:Boolean;
    S:String;
    UI,AC:Integer;
 begin
  if Sender=nil then Exit;
  if Key in CH_DIGIT then
   begin
    Sr:=Sr+Key;
    try
     UI:=Prm.UserID;
     Prm.UserID:=FUserID;
     S:=Sr;
     if Flag=W_BACK then
      begin
       Sr:=MainF.FindEAN13(TDBGrid(Sender),Sr,SC_CHEK,1,IsFind);
       if (S<>'') and (Sr='') then FilterSpis;
      end else
     if Flag=W_BACK1 then
      begin
       Sr:=MainF.FindEAN13(TDBGrid(Sender),Sr,SC_TMPSPIS,1,IsFind);
       if IsFind then
        try
         AC:=TDBGrid(Sender).DataSource.DataSet.FieldByName('art_code').AsInteger;
         DM.Qr1.Close;
         DM.Qr1.SQL.Clear;
         DM.Qr1.SQL.Add('update Inform..Tmp_Spis set printing=1 ');
         DM.Qr1.SQL.Add('where art_Code='+IntToStr(AC));
         DM.Qr1.SQL.Add(' and compname=host_name() and id_user='+IntToStr(FUserID)+' and priznak='+IntToStr(Flag) );
         DM.Qr1.ExecSQL;
         FilterSpis;
         TDBGrid(Sender).DataSource.DataSet.Locate('ART_CODE',AC,[loCaseInsensitive,loPartialKey]);
        except
        end;
      end;
    finally
     Prm.UserID:=UI;
    end;
   end;
 end;

procedure TWorkSprF.PrintReg(Param:Byte);
var i:Integer;
    S:String;
 begin
  if Not Param in [1,2] then Exit;
  try
   PrintRep.Clear;
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('select b.f_nds       ');
   DM.QrEx.SQL.Add('from SpisVozr a, SprTov b');
   DM.QrEx.SQL.Add('where a.art_code=b.art_code and DtVz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DtVz)+'''');
   DM.QrEx.SQL.Add('group by b.f_nds');
   DM.QrEx.Open;
   for i:=1 to DM.QrEx.RecordCount do
    begin
     if i=1 then DM.QrEx.First else begin PrintRep.AddText(#12); DM.QrEx.Next; end;
     S:='';
     Case DM.QrEx.FieldByName('f_nds').AsInteger of
      1:S:='НДС';
      2:S:='без НДС';
      3:S:='ЧП НДС';
      4:S:='ЧП без НДС';
     end;

     PrintRep.SetDefault;
     PrintRep.Font.Name:='Arial';
     PrintRep.Font.Size:=5;
     PrintRep.Font.Style:=[fsBold];
     PrintRep.Align:=AL_CENTER;
     Case Param of
      1:PrintRep.AddText('Список препаратов '+S+' по алфавиту '+#10#10);
      2:PrintRep.AddText('Список препаратов '+S+' по местам хранения '+#10#10);
     end; 

     PrintRep.Align:=AL_LEFT;
     PrintRep.Font.Size:=4;
     PrintRep.Font.Style:=[];

     DM.Qr.Close;
     DM.Qr.SQL.Clear;
 {
     DM.Qr.SQL.Add('select a.Art_Code as Код_I_1400,');
     DM.Qr.SQL.Add('       a.Names as Наименование_S_9000,');
     DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1000],');
     DM.Qr.SQL.Add('       Max(a.Cena) as Цена_N_1700,');
     DM.Qr.SQL.Add('       c.P1 as [Осн._S_1000],');
     DM.Qr.SQL.Add('       c.P2 as [Витр._S_1000],');
     DM.Qr.SQL.Add('       c.P3 as [Скл._S_1000]');
     DM.Qr.SQL.Add('from Inform..Tmp_Spis a left join Inform..SprReg c on a.art_code=c.art_code ');
     DM.Qr.SQL.Add('where a.priznak='+IntToStr(Flag)+' and a.id_user='+IntToStr(FUserID)+' and a.art_code in (select art_code from SprTov where f_nds='+DM.QrEx.FieldByName('f_nds').AsString+' group by art_code)');
     DM.Qr.SQL.Add('group by a.art_code,a.Names,c.P1,c.P2,c.P3');
}
     DM.qr.SQL.Add('select a.art_code as Код_I_1400,b.names as Наименование_S_9000,(case when a.kol>b.ostat then b.ostat else a.kol end)     ');
     DM.qr.SQL.Add('                           -IsNull((select Sum(ch.kol) from Chek ch where ch.art_code=a.art_code and ch.compname=host_name() and ch.id_user='+IntToStr(FUserID)+'),0)  ');
     DM.qr.SQL.Add('                           -IsNull((select Sum(kol) from Moves m, SprTov s where m.kod_name=s.kod_name and m.iddoc=a.idvzr and s.art_code=a.art_code),0) as [Кол-во_I_1000], ');
     DM.qr.SQL.Add('       b.cena as Цена_N_1700, ');
     DM.Qr.SQL.Add('       c.P1 as [Осн._S_1000],');
     DM.Qr.SQL.Add('       c.P2 as [Витр._S_1000],');
     DM.Qr.SQL.Add('       c.P3 as [Скл._S_1000]');
     DM.qr.SQL.Add('from (select art_code,names,Max(f_nds) as f_nds,Sum(ostat) as Ostat,Max(cena) as cena from SprTov where ostat>0 group by art_code,names) as b,  ');
     DM.qr.SQL.Add('     SpisVozr a left join Inform..SprReg c on a.art_code=c.art_code                                                                                                           ');
     DM.qr.SQL.Add('where a.DtVz='''+FormatDateTime('yyyy-mm-dd hh:nn:ss',DtVz)+''' and                                                        ');
     DM.qr.SQL.Add('      a.art_code=b.art_code and b.f_nds='+DM.QrEx.FieldByName('f_nds').AsString+' and');
     DM.qr.SQL.Add('      (case when a.kol>b.ostat then b.ostat else a.kol end)                                                               ');
     DM.qr.SQL.Add('      -IsNull((select Sum(ch.kol) from Chek ch where ch.art_code=a.art_code and ch.compname=host_name() and ch.id_user='+IntToStr(FUserID)+'),0)  ');
     DM.qr.SQL.Add('      -IsNull((select Sum(kol) from Moves m, SprTov s where m.kod_name=s.kod_name and m.iddoc=a.idvzr and s.art_code=a.art_code),0)>0 ');
     Case Param of
      1:DM.Qr.SQL.Add('order by b.Names');
      2:DM.Qr.SQL.Add('order by c.P1,c.P2,c.P3,b.Names');
     end;
//     DM.Qr.SQL.SaveToFile('C:\23542345.txt');
     DM.Qr.Open;
     PrintRep.Qr:=DM.Qr;
     PrintRep.PrintTable(False,0,0);
    end;
   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования печатной формы накладной: '+E.Message);
  end;
 end;

procedure TWorkSprF.bbPrnSpisClick(Sender: TObject);
var dx,dy:Integer;
    Com:TControl;
 begin
  if Sender=nil then Exit;
  dx:=Left+3; dy:=Top+TControl(Sender).Height+23;
  Com:=TControl(Sender);
  While Com<>Self do
   begin
    Inc(dx,Com.Left);
    Inc(dy,Com.Top);
    Com:=Com.Parent;
   end;
  pmPrnReg.Popup(dx,dy);
 end;

procedure TWorkSprF.MenuItem1Click(Sender: TObject);
 begin
  PrintReg(1);
 end;

procedure TWorkSprF.N2Click(Sender: TObject);
 begin
  PrintReg(2);
 end;

procedure TWorkSprF.SetSr(const Value: String);
 begin
  FSr:=Value;
  Label5.Caption:=FSr+' ';
 end;

procedure TWorkSprF.CheckBox1Click(Sender: TObject);
 begin
  if CheckBox1.Checked then btPrCennik.Caption:='Печать стикеров...'
                       else btPrCennik.Caption:='Печать ценников...'
 end;

procedure TWorkSprF.bbCloseBoxClick(Sender: TObject);
var Num,NumBox:String;
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select shtrih from Inform..TMP_SPIS where IsNull(shtrih,0)=0 and compname=host_name() and id_user='+IntToStr(FUserID)+' and priznak='+IntToStr(Flag);
   DM.Qr.Open;

   if DM.Qr.IsEmpty then begin MainF.MessBox('Нет незакрытых ящиков!'); Exit; end;
   if MainF.MessBox('Вы действительно хотите закрыть ящик?',52)<>ID_YES then Exit;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('declare @ida varchar(5), @num bigint, @numfull varchar(20) ');
   DM.Qr.SQL.Add('set @ida=(select Value from Spr_const where Descr=''ID_APTEKA'') ');
   DM.Qr.SQL.Add('set @num=IsNull((select convert(bigint,Value) from Spr_const where Descr=''NumBox''),0)+1 ');
   DM.Qr.SQL.Add('select ''2''+replicate(''0'',6-len(convert(varchar,@num)))+convert(varchar,@num)+replicate(''0'',3-len(@ida))+@ida+''01'' as NumBox, @num as  Num');
//   DM.Qr.SQL.SaveToFile('C:\TmpSpis.txt');
   DM.Qr.Open;
   if DM.Qr.IsEmpty then Abort;

   Num:=DM.Qr.FieldByName('Num').AsString;
   NumBox:=DM.Qr.FieldByName('NumBox').AsString;

{
   if Not PrintStiker(NumBox,PrVozr) then
    begin
     MainF.MessBox('Вы не напечатали стикер для ящика!');
     Exit;
    end;
}
   DM.Qr.Close;
   DM.Qr.SQL.Clear;

   DM.Qr.SQL.Add('update Inform..TMP_SPIS set shtrih='+NumBox+'  where IsNull(shtrih,0)=0 and compname=host_name() and id_user='+IntToStr(FUserID)+' and priznak='+IntToStr(Flag));
   DM.Qr.SQL.Add('delete from Spr_Const where Descr=''NumBox'' ');
   DM.Qr.SQL.Add('insert into Spr_Const(Descr,Value) values(''NumBox'','''+Num+''') ');

   DM.Qr.ExecSQL;
   FilterSpis;
  except
   on E:Exception do MainF.MessBox('Ошибка закрытия ящика: '+E.Message);
  end;
 end;

procedure TWorkSprF.bbPrintStikClick(Sender: TObject);
 begin
  if DM.qrList.IsEmpty then Exit;
  if DM.qrList.FieldByName('Shtrih').AsString<>'' then PrintStiker(DM.qrList.FieldByName('Shtrih').AsString, PrVozr)
                                                  else MainF.MessBox('Выбранная позиция находится в незакрытом ящике!');
 end;

procedure TWorkSprF.bbAktBrakClick(Sender:TObject);
 begin
  if DM.qrList.IsEmpty then Exit;
  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Font.Name:='Arial';
  PrintRep.Font.Size:=6;
  PrintRep.Font.Style:=[fsBold];
  PrintRep.Align:=AL_CENTER;
  PrintRep.AddText('Акт'#10'о наличи брака товара в аптеке'#10+Prm.AptekaNameRU+#10#10);
  PrintRep.Font.Size:=5;
  PrintRep.AddText('от '+DateToStrRU(Now)+#10#10);
  PrintRep.Font.Size:=4;
  PrintRep.Align:=AL_LEFT;

  DM.Qr.Close;
  DM.Qr.SQL.Clear;
  DM.Qr.SQL.Add('select ''NumS'' as [№ пп._S_1150],');
  DM.Qr.SQL.Add('       a.art_code as Код_S_1100,');
  DM.Qr.SQL.Add('       a.Names as Наименование_S_7800,');
  DM.Qr.SQL.Add('       ''Уп.'' as [Ед. изм_S_1100],');
  DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1500],');
  DM.Qr.SQL.Add('Max(a.Cena) as Цена_N_1500,');
  DM.Qr.SQL.Add('Sum(a.Kol*a.Cena) as Сумма_N_1500,');
  DM.Qr.SQL.Add('       a.Descr as [Примечание_S_2000]');
  DM.Qr.SQL.Add('from Inform..TMP_SPIS a where compname=host_name() and id_user='+IntToStr(FUserID)+' and Priznak='+IntToStr(Flag));
  DM.Qr.SQL.Add('group by a.art_code,a.names,a.Descr ');
  DM.Qr.SQL.Add('order by a.names ');
  PrintRep.AddInterv(4);
  DM.Qr.Open;
  PrintRep.Qr:=DM.Qr;
  PrintRep.PrintTable(False,7,0,True);
  PrintRep.AddText(#10#10+'Представитель аптеки:_______________________           Представитель:_________________________'+#10);
  PrintRep.PreView;
 end;

procedure TWorkSprF.N3Click(Sender: TObject);
var S:String;
 begin
  if DM.qrList.IsEmpty then Exit;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select Descr from Inform..Tmp_Spis where id_user='+IntToStr(FUserID)+' and priznak='+IntToStr(Flag)+' and art_code='+DM.qrList.FieldByName('art_code').AsString;
   DM.Qr.Open;

   if Not EnterStrValue(S,'Примечание к браку',DM.Qr.FieldByName('Descr').AsString) then Exit;
   DM.Qr.Close;
   DM.Qr.SQL.Text:='update Inform..Tmp_Spis set Descr='''+S+''' where id_user='+IntToStr(FUserID)+' and priznak='+IntToStr(Flag)+' and art_code='+DM.qrList.FieldByName('art_code').AsString;
   DM.Qr.ExecSQL;
  except
   on E:Exception do MainF.MessBox('Ошибка записи примечания: '+E.Message);
  end;
 end;

procedure TWorkSprF.bbAddAllClick(Sender:TObject);
var i:Integer;
 begin
  if DM.qrSpr.IsEmpty then Exit;
  ClearSpis(1);
  try
   dbgSpr.Visible:=False;
   for i:=1 to DM.qrSpr.RecordCount do
    begin
     if i=1 then DM.qrSpr.First else DM.qrSpr.Next;

     if SameText(Sender.ClassName,'TMenuItem') then
      if Pos('('+TMenuItem(Sender).Hint+')',dbgSpr.DataSource.DataSet.FieldByName('Names').AsString)=0 then Continue;

     EnterKol(dbgSpr.DataSource.DataSet,0,True);
    end;
   FilterSpis;
  finally
   dbgSpr.Visible:=True;
  end;
 end;

procedure TWorkSprF.bbSrokMonthClick(Sender: TObject);
var dx,dy:Integer;
    Com:TControl;
 begin
  if Sender=nil then Exit;
  dx:=Left+3; dy:=Top+TControl(Sender).Height+23;
  Com:=TControl(Sender);
  While Com<>Self do
   begin
    Inc(dx,Com.Left);
    Inc(dy,Com.Top);
    Com:=Com.Parent;
   end;
  pmSrok.Popup(dx,dy);
 end;

procedure TWorkSprF.btPrCennikAkciaClick(Sender:TObject);
var i,j:Integer;
    C:TCennik;
 begin

  PrintRep.Clear;
  PrintRep.SetDefault;
  PrintRep.Indent:=0;
  PrintRep.Font.Name:='Arial Narrow';
  PrintRep.Font.Size:=4;
  PrintRep.LeftMargin:=50;
  PrintRep.TopMargin:=0;
  PrintRep.BottomMargin:=0;

  for i:=1 to DM.qrList.RecordCount do
   begin
    if i=1 then DM.qrList.First else DM.qrList.Next;


    With C do
     begin
      Brend:=MainF.Brend;
      Names:=DM.qrList.FieldByName('names').AsString;
      Art_Code:=DM.qrList.FieldByName('art_code').AsInteger;

      DM.Qr.Close;
      DM.Qr.SQL.Text:='select EAN13 from SprEAN where art_code='+IntToStr(Art_Code);
      DM.Qr.Open;

      EAN13:=DM.Qr.FieldByName('EAN13').AsString;
      Cena:=DM.qrList.FieldByName('cena').AsCurrency;
      CenaOpt:=0;
      SrokSkd:=0;
      FirmName:=Prm.FirmNameRU;
      P1:=0;
      P2:=0;
      P3:=0;
     end;
    for j:=1 to DM.qrList.FieldByName('kol').AsInteger do
     PrintCennikLenta(C);
   end;
  PrintRep.PreView;
 end;

procedure TWorkSprF.BitBtn3Click(Sender: TObject);
 begin
  if DM.qrList.IsEmpty then Exit;
  if MainF.MessBox('Удалить строку из списка?',52)<>ID_YES then Exit;

  ClearSpis(1,DM.qrList.FieldByName('art_code').AsInteger);
 end;

procedure TWorkSprF.bbZakazSklClick(Sender:TObject);
var IDRes:Integer;
    Res:String;
 begin
  if DM.qrList.IsEmpty then Exit;
//
  MainF.MessBox('Заказанный товар ожидается в течении 7 дней. После загрузки накладной, бронь продержится в течении 4 суток.',
                48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
  try
   AddResF:=TAddResF.Create(Self);
   try
    Application.ProcessMessages;
    AddResF.ShowModal;
    if AddResF.Flag=1 then
     begin

       {
        DM.spY_AddToReserveExt.Close;
        DM.spY_AddToReserveExt.Parameters.ParamValues['@fio']:=AddResF.Edit1.Text;
        DM.spY_AddToReserveExt.Parameters.ParamValues['@phone']:=AddResF.Edit3.Text;
        DM.spY_AddToReserveExt.Parameters.ParamValues['@id_user']:=Prm.UserID;

        DM.spY_AddToReserveExt.Parameters.ParamValues['@Priznak']:=3;

        DM.spY_AddToReserveExt.Parameters.ParamValues['@NumZakaz']:=null;
        DM.spY_AddToReserveExt.Open;
       }

       DM.QrEx.Close;
       DM.QrEx.SQL.Text:='exec spY_AddToReserveExt '''+AddResF.Edit1.Text+''','''+AddResF.Edit3.Text+''','+IntToStr(Prm.UserID)+',0,null,3';
       DM.QrEx.Open;


       IDRes:=DM.QrEx.FieldByName('IDRes').AsInteger;

       if DM.QrEx.FieldByName('Res').AsInteger=1 then
        begin
         ShowText('На телефон клиента отправлено сообщение с номером заказа. Он понадобится, когда клиент придет за покупкой.'+#10#10+'Бронь действительна в течении недели');
        end else
       if DM.QrEx.FieldByName('Res').AsInteger=-4 then
        begin
         ShowText('Пустой заказ!');
        end
       else
         ShowText('Номер заказа: '+IntToStr(IDRes)+#10+'Собщите его клиенту он понадобится, когда клиент придет за покупкой.'+#10#10+'Бронь действительна в течении недели');

       FilterSpis;
     end;
   finally
    AddResF.Free;
   end;
  except
   on E:Exception do
    MainF.RegisterError('Бронирование препаратов со склада',E.Message,False);
  end;
 end;

procedure TWorkSprF.bbZakazPOstavClick(Sender: TObject);
 begin
  try
   ZakazPriceF:=TZakazPriceF.Create(Self);
   try
    Application.ProcessMessages;
    ZakazPriceF.ShowModal;
   finally
    ZakazPriceF.Free;
   end;
  except
   on E:Exception do MainF.MessBox('Ошибка открытия окна поиска: '+E.Message);
  end;
 end;

Initialization

Finalization

 if WorkSprF<>nil then WorkSprF.Free;

end.





