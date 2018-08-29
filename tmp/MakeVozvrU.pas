unit MakeVozvrU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, MainU, Util, PrintReport,Menus;

type
  TMakeVozvrF = class(TForm)
    Panel2: TPanel;
    dbgVozrSpis: TDBGrid;
    BitBtn1: TBitBtn;
    bbLoad: TBitBtn;
    BitBtn4: TBitBtn;
    OpenDialog1: TOpenDialog;
    StaticText1: TStaticText;
    stSum: TStaticText;
    lbSearch: TLabel;
    BitBtn2: TBitBtn;
    lbKolName: TStaticText;
    pmPrnReg: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    cbDtVozr: TComboBox;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgVozrSpisKeyPress(Sender: TObject; var Key: Char);
    procedure dbgVozrSpisKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure bbLoadClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private

    FUserID:Integer;
    IsScan:Boolean;
    IsEdit:Boolean;
    FServerFile:String;

    procedure MakeSpis;
    procedure ShowSpis;
    procedure PrintReg(Param:Byte);
    procedure EnterKol;

  public

  end;

var MakeVozvrF:TMakeVozvrF;

implementation

uses DataModuleU, DateBackU, DialogVozrSpisU;

{$R *.dfm}

procedure TMakeVozvrF.FormCreate(Sender: TObject);
 begin
  //edPath.Text:=Opt.LoadNaklPath+'Vozvrat'+IntToStr(Prm.AptekaID)+'.txt';
  FUserID:=Prm.UserID+1000;
  IsScan:=False;
  Caption:=MFC;
  lbSearch.Caption:='';
  dbgVozrSpis.OnDrawColumnCell:=MainF.dbgChekDrawColumnCell;
  DM.qrVozrSpis.SQL.Text:=StringReplace(DM.qrChek.SQL.Text,
                                        'id_user='+IntToStr(Prm.UserID),
                                        'id_user='+IntToStr(FUserID),
                                        [rfReplaceAll, rfIgnoreCase]);
  IsEdit:=False;
  MakeSpis;
 end;

procedure TMakeVozvrF.ShowSpis;
var AC:Integer;
 begin
  AC:=0;
  try
   if DM.qrVozrSpis.Active then AC:=DM.qrVozrSpis.FieldByName('Art_Code').AsInteger;
   DM.qrVozrSpis.Close;
   DM.qrVozrSpis.Open;
//   if DM.qrVozrSpis.IsEmpty then DeleteFile(FServerFile);
   DM.qrVozrSpis.Locate('Art_Code',AC,[]);
   lbKolName.Caption:='Кол-во наименований: '+IntToStr(DM.qrVozrSpis.RecordCount);
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select Sum(kol*cena) as Sm, Min(Printing) as Pr from Chek where id_user='+IntToStr(FUserID);
   DM.Qr.Open;
   IsScan:=DM.Qr.FieldByName('Pr').AsInteger=1;
   stSum.Caption:=CurrToStrF(DM.Qr.FieldByName('Sm').AsFloat,ffFixed,2)+' грн.';
  except
   MainF.MessBox('Ошибка доступа к списку позиций возврата!');
  end;
 end;

procedure TMakeVozvrF.MakeSpis;
 begin

  FServerFile:=Opt.ServerLogPath+'Vozvrat'+IntToStr(Prm.AptekaID)+'.txt';

  if Not FileExists(FServerFile) then
   begin
    MainF.MessBox('Файл со списком позиций для возврата не найден!');
    Exit;
   end;

  DM.qrVozrSpis.Close;

  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='truncate table TmpSpisVozr';
   DM.Qr.ExecSQL;
   DM.ADOCo.BeginTrans;
   try
    MainF.ClearChekOnly(FUserID);

    DM.spY_MakeSpisVozr.Close;
    DM.spY_MakeSpisVozr.Parameters.ParamValues['@FName']:=FServerFile;
    DM.spY_MakeSpisVozr.Parameters.ParamValues['@id_user']:=FUserID;
    DM.spY_MakeSpisVozr.ExecProc;
    DM.ADOCo.CommitTrans;

    DM.Qr.Close;
    DM.Qr.SQL.Text:='select top 1 * from TmpSpisVozr';
    DM.Qr.Open;

    if DM.Qr.IsEmpty=False then
     if DM.Qr.FieldByName('Weight').AsInteger>1 then
      begin
       IsEdit:=True;
      end;

    ShowSpis;
   except
    DM.ADOCo.RollBackTrans;
   end;

  except
   MainF.MessBox('Ошибка формирования списка позиций возврата!');
  end;
 end;

procedure TMakeVozvrF.BitBtn4Click(Sender:TObject);
 begin
  ShowSpis;
 end;

procedure TMakeVozvrF.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TMakeVozvrF.dbgVozrSpisKeyPress(Sender: TObject; var Key: Char);
var S:String;
    IsFind:Boolean;
 begin
  if DM.qrVozrSpis.IsEmpty then Exit;
  if Sender=Nil then Exit;
  S:=lbSearch.Caption;
  MainF.dbGKeyPress(TDBGrid(Sender),Key,S,O_NAMES,SC_FIND,0,IsFind);
  if IsFind then
   try
    try
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('update Chek set printing=1 ');
     DM.Qr.SQL.Add('where art_Code='+DM.qrVozrSpis.FieldByName('Art_code').AsString);
     DM.Qr.SQL.Add(' and id_user='+IntToStr(FUserID));
     DM.Qr.ExecSQL;
    except
     MainF.MessBox('Ошибка доступа к таблице Chek!');
    end;
   finally
    ShowSpis;
   end;
  lbSearch.Caption:=S;
 end;

procedure TMakeVozvrF.EnterKol;
var Kol,Art_Code:Integer;
 begin
  if DM.qrVozrSpis.IsEmpty then Exit;
  try
   Art_Code:=0;
   Kol:=MainF.GetKolFromDialog(DM.qrVozrSpis.FieldByName('Names').AsString,DM.qrVozrSpis.FieldByName('Kol').AsInteger,Art_Code,EN_SIMPLE);
   if Kol<0 then Exit;
   DM.spY_DelKol.Parameters.ParamValues['@part_code']:=DM.qrVozrSpis.FieldByName('Art_code').AsInteger;
   DM.spY_DelKol.Parameters.ParamValues['@pkol']:=Kol;
   DM.spY_DelKol.Parameters.ParamValues['@piduser']:=FUserID;
   DM.spY_DelKol.Parameters.ParamValues['@id_kassa']:=Opt.KassaID;
   DM.spY_DelKol.Parameters.ParamValues['@simp']:=1;
   DM.spY_DelKol.ExecProc;
   if DM.spY_DelKol.Parameters.ParamValues['@RETURN_VALUE']=21 then
    begin
     MainF.MessBox('Введеное количество превышает остаток склада'+#10+'Или товар забрал другой оператор!');
     Exit;
    end;
   ShowSpis;
  except
   on E:Exception do MainF.MessBox('Ошибка ввода количества: '+E.Message);
  end;
 end;

procedure TMakeVozvrF.dbgVozrSpisKeyDown(Sender:TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key in K_ARROW_KEYS then lbSearch.Caption:='';
  if (Key=VK_RETURN) and IsEdit then EnterKol;
 end;

procedure TMakeVozvrF.bbLoadClick(Sender:TObject);
var CP:TChekPos;
    S:String;
    Res,i:Integer;

 procedure SaveToFileSpisVozr;
 var F:System.Text;
     S,FName:String;
     i:Integer;
  begin
   try
    DM.Qr.Close;
    DM.Qr.SQL.Text:='select * from TMPSPISVOZR';
    DM.Qr.Open;
    FName:=PrPath+'\$tmp$.txt';
    DeleteFile(FName);
    if FileExists(FName) then Abort;
    if DM.Qr.IsEmpty then
     begin
      DeleteFile(FServerFile);
      Exit;
     end;
    System.Assign(F,FName);
    System.ReWrite(F);
    for i:=1 to DM.Qr.RecordCount do
     begin
      if i=1 then DM.Qr.First else DM.Qr.Next;
      S:=DM.Qr.FieldByName('art_code').AsString+'|'+
         DM.Qr.FieldByName('kol').AsString+'|'+
         DM.Qr.FieldByName('priznak').AsString+'|'+
         DM.Qr.FieldByName('weight').AsString+'|';
      WriteLn(F,S);
     end;
    System.Close(f);
    CopyFile(PChar(FName),PChar(FServerFile),false);
    DeleteFile(FName);
   except
   end;
  end;

 Begin
  if DM.qrVozrSpis.IsEmpty then Exit;

  Res:=ShowDialogVozrSpis;
  if Res=3 then Close;
  if Res in [0,3] then Exit;

  DM.ADOCo.BeginTrans;
  try
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select top 1 * from TmpSpisVozr' ;
   DM.Qr.Open;
   CP.Priznak:=DM.Qr.FieldByName('Priznak').AsInteger;

   if Res=2 then
    begin
     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('update SprTov set ostat=ostat+b.kol');
     DM.Qr.SQL.Add('from SprTov a, Chek b');
     DM.Qr.SQL.Add('where a.kod_name=b.kod_name and Printing<>1 and id_user='+IntToStr(FUserID));
     DM.Qr.SQL.Add('delete from Chek where Printing<>1 and id_user='+IntToStr(FUserID));
     DM.Qr.ExecSQL;
    end;

   DM.Qr.Close;
   DM.Qr.SQL.Clear;
   DM.Qr.SQL.Add('delete from TmpSpisVozr where art_code in (select art_code from Chek where id_user='+IntToStr(FUserID)+')');
   DM.Qr.ExecSQL;

   CP.ID_User:=FUserID;
   CP.NumbChek:=0;
   CP.TypeOplat:=TO_BACK;
   CP.ID_Kassa:=Opt.KassaID;
   CP.Date:=Date;
   CP.Vzh:=0;
   CP.PrPayRecipt:=0;
   CP.SumSertif:=0;
   DM.WriteChek(CP);
   MainF.ClearChekOnly(CP.ID_User);

   DM.ADOCo.CommitTrans;
   dbgVozrSpis.Visible:=False;
   SaveToFileSpisVozr;
   MainF.MessBox('Возврат сформирован успешно!',64);
   Close;
  except
   on E:Exception do
    begin
     DM.ADOCo.RollBackTrans;
     MainF.MessBox('Ошибка формирования возврата: '+E.Message);
    end;
  end;
 End;

procedure TMakeVozvrF.PrintReg(Param:Byte);
var i:Integer;
    S:String;
 begin
  if Not Param in [1,2] then Exit;
  try
   PrintRep.Clear;
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select f_nds from Chek where id_user='+IntToStr(FUserID)+' group by f_nds';
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
     PrintRep.AddText('Список препаратов '+S+' по местам хранения '+#10#10);

     PrintRep.Align:=AL_LEFT;
     PrintRep.Font.Size:=4;
     PrintRep.Font.Style:=[];

     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('select a.Art_Code as Код_I_1400,');
     DM.Qr.SQL.Add('       a.Names as Наименование_S_9000,');
     DM.Qr.SQL.Add('       Sum(a.Kol) as [Кол-во_I_1000],');
     DM.Qr.SQL.Add('       Max(a.Cena) as Цена_N_1700,');
     DM.Qr.SQL.Add('       c.P1 as [Осн._S_1000],');
     DM.Qr.SQL.Add('       c.P2 as [Витр._S_1000],');
     DM.Qr.SQL.Add('       c.P3 as [Скл._S_1000]');
     DM.Qr.SQL.Add('from Chek a left join Inform..SprReg c on a.art_code=c.art_code ');
     DM.Qr.SQL.Add('where a.id_user='+IntToStr(FUserID)+' and a.f_nds='+DM.QrEx.FieldByName('f_nds').AsString);
     DM.Qr.SQL.Add('group by a.art_code,a.Names,c.P1,c.P2,c.P3');
     Case Param of
      1:DM.Qr.SQL.Add('order by a.Names');
      2:DM.Qr.SQL.Add('order by c.P1,c.P2,c.P3,a.Names');
     end;
     DM.Qr.Open;
     PrintRep.Qr:=DM.Qr;
     PrintRep.PrintTable(False,0,0);
    end;
   PrintRep.PreView;
  except
   MainF.MessBox('Ошибка формирования печатной формы накладной!');
  end;
 end;

procedure TMakeVozvrF.BitBtn2Click(Sender: TObject);
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

procedure TMakeVozvrF.N1Click(Sender: TObject);
 begin
  if Sender=nil then Exit;
  if DM.qrVozrSpis.IsEmpty then Exit;
  PrintReg(TControl(Sender).Tag)
 end;

procedure TMakeVozvrF.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
// SaveToFileSpisVozr;
 end;

end.
