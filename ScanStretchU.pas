unit ScanStretchU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Buttons, StdCtrls, Grids, DBGrids, ExtCtrls, Menus, EnterValueU, ShareU;

type
  TScanStretchF = class(TForm)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    lbSumm: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;

    procedure FormCreate(Sender:TObject);
    procedure FormShortCut(var Msg:TWMKey; var Handled:Boolean);
    procedure SpeedButton1Click(Sender:TObject);
    procedure SpeedButton2Click(Sender:TObject);
    procedure FormActivate(Sender:TObject);
    procedure DBGrid1KeyPress(Sender:TObject; var Key:Char);
    procedure DBGrid1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure FormClose(Sender:TObject; var Action:TCloseAction);
    procedure N1Click(Sender:TObject);
    procedure FormDestroy(Sender:TObject);

  private

    FFlag:Integer;
    FSumm:Real;
    FParam:Byte;
    sSr:String;
    FPref:TStringList;

    procedure ShowSertif;
    procedure ClearSertif;
    procedure SetParam(const Value: Byte);

    function  CheckNumCardIsSoc(nc:Int64):Boolean;

  public

    property Flag:Integer read FFlag;
    property Summ:Real read FSumm;
    property Param:Byte read FParam write SetParam;

  end;

var ScanStretchF:TScanStretchF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TScanStretchF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  FFlag:=0;
  FSumm:=0;
  ShowSertif;
  sSr:='';
  FParam:=TC_STRETCH;
  FPref:=TStringList.Create;
 end;

procedure TScanStretchF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

procedure TScanStretchF.ShowSertif;
 begin
  try
   FSumm:=0;
   try
    DM.qrSertif.Close;
    DM.qrSertif.SQL.Text:='select * from SertifTmp where compname=host_name() and id_user='+IntToStr(Prm.UserID)+' order by NumCard';
    DM.qrSertif.Open;

    DM.QrEx4.Close;
    DM.QrEx4.SQL.Text:='select Sum(Summ) as Summa from SertifTmp where compname=host_name() and id_user='+IntToStr(Prm.UserID);
    DM.QrEx4.Open;

    FSumm:=DM.QrEx4.FieldByName('Summa').AsFloat;
   finally
    lbSumm.Caption:='Всего на сумму: '+CurrToStrF(FSumm,ffFixed,2);
   end;
  except
   on E:Exception do MainF.MessBox('Ошибка чтения сертификатов: '+E.Message);
  end;
 end;

procedure TScanStretchF.SpeedButton1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TScanStretchF.SpeedButton2Click(Sender:TObject);
 begin
  FFlag:=1;
  Close;
 end;

procedure TScanStretchF.FormActivate(Sender:TObject);
 begin
  DBGrid1.SetFocus;
 end;

function TScanStretchF.CheckNumCardIsSoc(nc:Int64):Boolean;
 begin

  {
   (
    ((nc>=990000000001) and (nc<=990000000640)) or ((nc>=990000001001) and (nc<=990000001360))
   ) and (Prm.IsSoc=True)
  }

  Result:=False;
  if Prm.IsSoc=False then Exit;

  DM.QrEx4.Close;
  DM.QrEx4.SQL.Text:='select NumCard from RedCrossCards where NumCard='''+IntToStr(nc)+'''';
  DM.QrEx4.Open;
//  DM.QrEx4.SQL.SaveToFile('c:\log\n99.txt');
  if DM.QrEx4.IsEmpty=False then
   begin
//    ShowMessage('Тут');
    Result:=True;
   end;
 end;

procedure TScanStretchF.DBGrid1KeyPress(Sender:TObject; var Key:Char);
var nc:Int64;
    sSum:String;
    IsLink,B:Boolean;
    i:Integer;
    V:Byte;

 begin
  if Key in CH_DIGIT then
   begin
    sSr:=sSr+Key;
    if Length(sSr)=13 then
     begin

      try
       B:=False;
       for i:=0 to FPref.Count-1 do
        if Copy(sSr,1,3)=FPref[i] then
         begin
          B:=True;
          Break;
         end;
        if B=False then Abort;

       Case Param of
        TC_STRETCH:begin
                    nc:=StrToInt64(Copy(sSr,1,12));
                    MainF.CopyChek:=False;
                    if (Copy(sSr,1,3)='550') or (Copy(sSr,1,3)='990') then
                     begin
                      if //((nc>=550001656071) and (nc<=550001657430) and ((Prm.AptekaID=259) or (Prm.AptekaID in [185,222,226]))) or
                         (
                         { (
                           ((nc>=990000000001) and (nc<=990000000640)) or ((nc>=990000001001) and (nc<=990000001360))
                          ) and (Prm.IsSoc=True)
                         }
                          CheckNumCardIsSoc(nc)
                         )
                      then
                       begin
                        if DM.qrSertif.IsEmpty=False then Exit;
                        if Prm.IsSoc then MainF.NumCardDnepr:=StrToInt64(Copy(sSr,1,12))
                                     else MainF.NumCardDnepr:=StrToInt64(Copy(sSr,3,10));

                        DM.QrEx4.Close;
                        DM.QrEx4.SQL.Text:='select NumCard from BlockCards where NumCard='+IntToStr(MainF.NumCardDnepr);
                        DM.QrEx4.Open;

                        if DM.QrEx4.IsEmpty=False then
                         begin
                          MainF.MessBox('Извините! Карта '+IntToStr(MainF.NumCardDnepr)+' заблокирована!');
                          MainF.NumCardDnepr:=-1;
                          Exit;
                         end;

                        UpdateCardInfo(MainF.NumCardDnepr,IsLink,V);

                        DM.QrEx4.Close;
                        DM.QrEx4.SQL.Text:='select Sum(AccumSum) as AccumSum from Cards where NumCard='+IntToStr(MainF.NumCardDnepr);
                        DM.QrEx4.Open;

                        MainF.SumDnepr:=DM.QrEx4.FieldByName('AccumSum').AsCurrency;
                        sSum:=CurrToStrF(DM.QrEx4.FieldByName('AccumSum').AsCurrency,ffFixed,2);

                       end else begin
                                 if (nc<550000900000) or (nc>550000932000) then Abort;
                                 sSum:='10';
                                end;
                     end else begin

                               DM.Qr.Close;
                               DM.Qr.SQL.Text:='select IsNull((select Value from Spr_Const where Descr=''OplSertif''),0) as V ';
                               DM.Qr.Open;

                               if DM.Qr.FieldByName('V').AsInteger=0 then
                                begin
                                 MainF.MessBox('Продажа по сертификатам временно запрещена!');
                                 Exit;
                                end;

                               MainF.CopyChek:=True;
                               sSum:=CurrToStr(StrToCurr(Copy(IntToStr(nc),4,3)));

                              end;
                   end;
        TC_MOMBABY:nc:=StrToInt64(Copy(sSr,4,9));
       end;
      except
       MainF.MessBox('Штрих-код '+sSr+' неверный!'); sSr:=''; Exit;
      end;

      try
       Case Param of
        TC_STRETCH:begin
                    if MainF.NumCardDnepr=-1 then
                     begin
                      DM.QrEx4.Close;
                      DM.QrEx4.SQL.Clear;
                      DM.QrEx4.SQL.Add('select NumCard from SertifTmp where NumCard='+IntToStr(nc));
                      DM.QrEx4.SQL.Add(' union ');
                      DM.QrEx4.SQL.Add('select NumCard from ArhSertif where IsNull(Block,0)=1 and NumCard='+IntToStr(nc));
                      DM.QrEx4.Open;
                      if Not DM.QrEx4.IsEmpty then begin MainF.MessBox('Стретч карта № '+IntToStr(nc)+' уже использовалась!'); sSr:=''; Exit; end;
                     end;
                   end;
        TC_MOMBABY:begin
                    DM.QrEx4.Close;
                    DM.QrEx4.SQL.Text:='select * from MomBabyCards where IsNull(Block,0)=0 and NumCard='+IntToStr(nc);
                    DM.QrEx4.Open;
                    if DM.QrEx4.IsEmpty then begin MainF.MessBox('Карта № '+IntToStr(nc)+' либо заблокирована, либо не является карточкой "Мама и малыш"!'); sSr:=''; Exit; end;

                    DM.QrEx4.Close;
                    DM.QrEx4.SQL.Text:='select IsNull(Sum(Bonus),0) as Sm from Cards where NumCard='+IntToStr(nc);
                    DM.QrEx4.Open;

                    if DM.QrEx4.FieldByName('Sm').AsFloat<=0 then begin MainF.MessBox('Карта № '+IntToStr(nc)+' обнулена!'); sSr:=''; Exit; end;
                    sSum:=DM.QrEx4.FieldByName('Sm').AsString;
                    DM.QrEx4.Close;
                    DM.QrEx4.SQL.Text:='delete from SertifTmp where NumCard='+IntToStr(nc)+' and compname=host_name() and id_user='+IntToStr(Prm.UserID);
                    DM.QrEx4.ExecSQL;
                   end;
       end;

       DM.QrEx4.Close;
       DM.QrEx4.SQL.Clear;
       DM.QrEx4.SQL.Add('insert into SertifTmp(numcard,summ,summax,bonus,id_user,compname)');
       DM.QrEx4.SQL.Add('values('+IntToStr(nc)+','+sSum+','+sSum+',0,'+IntToStr(Prm.UserID)+',host_name())');
       DM.QrEx4.ExecSQL;

       ShowSertif;
       sSr:='';
      except
       on E:Exception do MainF.MessBox('Ошибка записи сертификатов: '+E.Message);
      end;
     end;
   end;
 end;

procedure TScanStretchF.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key in K_ARROW_KEYS then sSr:='';
  if Key=VK_RETURN then SpeedButton2Click(SpeedButton2);
 end;

procedure TScanStretchF.FormClose(Sender:TObject; var Action:TCloseAction);
 begin
  if Flag<>1 then ClearSertif;
 end;

procedure TScanStretchF.ClearSertif;
 begin
  try
   DM.QrEx4.Close;
   DM.QrEx4.SQL.Text:='delete from SertifTmp where compname=host_name() and id_user='+IntToStr(Prm.UserID);
   DM.QrEx4.ExecSQL;
  except
  end;
 end;

procedure TScanStretchF.SetParam(const Value: Byte);
 begin
  if Not (Value in [TC_STRETCH,TC_MOMBABY]) then Abort;
  FParam:=Value;
  FPref.Clear;
  Case Value of
   TC_STRETCH:begin
               Label1.Caption:='Проведите сертификаты поочереди через сканер...';
               DBGrid1.Columns[0].Title.Caption:='Номер сертификата';
               DBGrid1.Columns[1].Title.Caption:='Сумма';
               DBGrid1.Options:=DBGrid1.Options-[dgEditing];
               FPref.Add('241');
               FPref.Add('550');
               FPref.Add('990');
              end;
   TC_MOMBABY:begin
               Label1.Caption:='Проведите карты "Мама и малыш" поочереди через сканер...';
               DBGrid1.Columns[0].Title.Caption:='Номер карты "Мама и малыш"';
               DBGrid1.Columns[1].Title.Caption:='Сумма бонусов';
               DBGrid1.Options:=DBGrid1.Options+[dgEditing];
               FPref.Add('550');
              end;
  end;
 end;

procedure TScanStretchF.N1Click(Sender: TObject);
var Sum:Currency;
 begin
  if DM.qrSertif.IsEmpty then Exit;
  if Not EnterCurrValue(Sum,'Введите кол-во балов') then Exit;
  if (Sum<=0) or (Sum>DM.qrSertif.FieldbyName('SumMax').AsFloat) then
   begin
    MainF.MessBox('Введите значение больше 0 и меньше '+DM.qrSertif.FieldbyName('SumMax').AsString+'!');
    Exit;
   end;
  try
   DM.QrEx4.Close;
   DM.QrEx4.SQL.Text:='update SertifTmp set Summ='+CurrToStr(Sum)+' where compname=host_name() and id_user='+IntToStr(Prm.UserID)+' and NumCard='+DM.qrSertif.FieldbyName('NumCard').AsString;
   DM.QrEx4.ExecSQL;
   ShowSertif;
  except
  end;
 end;

procedure TScanStretchF.FormDestroy(Sender: TObject);
 begin
  FPref.Free;
 end;

end.


