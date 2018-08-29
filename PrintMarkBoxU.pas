unit PrintMarkBoxU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ComCtrls, PrintReport, Util, ShowTextU;

type

  TElem=Record
         IDDOC:Integer;
         LB:TLabel;
         LB1:TLabel;
         BT:TBitBtn;
         ED:TEdit;
         UD:TUpDown;
         Priznak:String;
         nSklad:String;
         aSklad:String;
         Date_Nakl:TDateTime;
        end;


  TPrintMarkBoxF = class(TForm)
    ScrollBox1: TScrollBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private

    Arr:Array of TElem;
    procedure ClearList;
    procedure ViewClick(Sender:TObject);

  public

    Flag:Byte;
    Printed:Boolean;

    procedure CreateList(var Ex:Boolean);

  end;

var PrintMarkBoxF:TPrintMarkBoxF;

implementation

uses MainU, DataModuleU, ViewNaklU, NoScanViewU;

{$R *.dfm}

procedure TPrintMarkBoxF.FormCreate(Sender: TObject);
 begin
  Printed:=False;
  Caption:=MFC;
 end;

procedure TPrintMarkBoxF.ClearList;
var i:Integer;
 begin
  for i:=Low(Arr) to High(Arr) do
   begin
    Arr[i].LB.Free;
    Arr[i].ED.Free;
   end;
  SetLength(Arr,0);
 end;

procedure TPrintMarkBoxF.CreateList(var Ex:Boolean);
var i,CA,dy:Integer;
    B:Boolean;
    S:String;
 begin
  try
   Ex:=False;
   ClearList;
   DM.Qr2.Close;
   Case Flag of
    1:DM.Qr2.SQL.Text:='select *,(select case Priznak when 12 then ''Излишек'' else Max(Descr) end from SprPrVozr where id=Priznak) as Prizn, '#10+
                       '       (case when Priznak in (12,16) then ''Розничный склад'' else ''Возвратный склад'' end) as nSklad, '#10+
                       '       (case when Priznak in (12,16) then ''бул. И.Каркача, 2а'' else ''Белостоцкий въезд, 3'' end) as aSklad, '#10+
                       '       (select Count(distinct shtrih) from rTovar m (nolock) where m.iddoc=j.iddoc ) as NumBx, '#10+
                       '       IsNull((select Min(IsNull(shtrih,0)) from rTovar m (nolock) where m.iddoc=j.iddoc), '#10+
                       '              (select Min(IsNull(shtrih,0)) from rTovar m (nolock) where m.iddoc=j.iddoc and IsNull(m.IsScan,0)>0)) as FirstBox '#10+

                       ' from JMoves j where priznak in (8,5,6,3,4,12,16,18,23) and iddoc in (select iddoc from ##nakllist where compname=host_name() and id_user='+IntToStr(Prm.UserID)+' and f=1)';

    2:DM.Qr2.SQL.Text:='select *,(select case Priznak when 12 then ''Излишек'' else Max(Descr) end from SprPrVozr where id=Priznak) as Prizn from JMoves where iddoc in (select iddoc from CurrentIDDOC where compname=host_name() and id_user='+IntToStr(Prm.UserID)+')';
   end;
//   DM.Qr2.SQL.SaveToFile('C:\PrBox.txt');
   DM.Qr2.Open;
   if DM.Qr2.IsEmpty then
    begin
     MainF.MessBox('Печать стикеров разрешена только на возвраты с причинами: '#10'   Брак'#10'   Срок'#10'   Фарминспекция'#10'   Возврат фирме'#10'   Излишек'#10'   Хладоген'#10'   Курьер'#10'   Переброска'#10'   Возврат от покупателя'#10);
     Ex:=True;
     Exit;
    end;
   dy:=23;  B:=True; S:='';
   for i:=1 to DM.Qr2.RecordCount do
    begin
     if i=1 then DM.Qr2.First else DM.Qr2.Next;
     CA:=High(Arr)+1; SetLength(Arr,CA+1);
     Arr[CA].IDDOC:=DM.Qr2.FieldByName('iddoc').AsInteger;

     Arr[CA].LB:=TLabel.Create(Self);
     Arr[CA].LB.Parent:=ScrollBox1;
     Arr[CA].LB.Left:=5;
     Arr[CA].LB.Top:=(i-1)*dy+5;
     Arr[CA].LB.AutoSize:=True;
     Arr[CA].LB.Caption:=DM.Qr2.FieldByName('nn_nakl').AsString;
     Arr[CA].Date_Nakl:=DM.Qr2.FieldByName('date_nakl').AsDateTime;

     Arr[CA].LB1:=TLabel.Create(Self);
     Arr[CA].LB1.Parent:=ScrollBox1;
     Arr[CA].LB1.Top:=(i-1)*dy+5;
     Arr[CA].LB1.AutoSize:=True;
     Arr[CA].LB1.Caption:='';

     Arr[CA].ED:=TEdit.Create(Self);
     Arr[CA].ED.Parent:=ScrollBox1;
     Arr[CA].ED.Left:=90;
     Arr[CA].ED.Top:=(i-1)*dy+3;
     Arr[CA].ED.Width:=40;
     Arr[CA].ED.OnKeyPress:=Edit1KeyPress;
     Arr[CA].ED.Enabled:=False;

     Arr[CA].UD:=TUpDown.Create(Self);
     Arr[CA].UD.Parent:=ScrollBox1;
     Arr[CA].UD.Left:=132;
     Arr[CA].UD.Top:=(i-1)*dy+3;
     Arr[CA].UD.Max:=1000;
     Arr[CA].LB1.Left:=Arr[CA].UD.Left+Arr[CA].UD.Width+15;
     Arr[CA].LB1.Font.Color:=clRed;

     if DM.Qr2.FieldByName('NumBx').AsInteger<=0 then begin S:=S+'      '+Arr[CA].LB.Caption+#10; B:=False; {Arr[CA].UD.Position:=1;} end
                                                 else Arr[CA].UD.Position:=DM.Qr2.FieldByName('NumBx').AsInteger;
//     Arr[CA].UD.Position:=Arr[CA].UD.Min;

     if (DM.Qr2.FieldByName('FirstBox').AsInteger=0) and (DM.Qr2.FieldByName('NumBx').AsInteger>0) then
      begin
       Arr[CA].LB1.Caption:='Ящики закрыты неполностью!!!';

       Arr[CA].BT:=TBitBtn.Create(Self);
       Arr[CA].BT.Parent:=ScrollBox1;
       Arr[CA].BT.Top:=(i-1)*dy+3;
       Arr[CA].BT.Caption:='Просмотр незакрытых';
       Arr[CA].BT.Width:=140;
       Arr[CA].BT.Left:=Arr[CA].LB1.Left+Arr[CA].LB1.Width+5;
       Arr[CA].BT.Tag:=Arr[CA].IDDOC;
       Arr[CA].BT.Height:=23;
       Arr[CA].BT.OnClick:=ViewClick;
      end;

     Arr[CA].ED.Text:=IntToStr(Arr[CA].UD.Position);
     Arr[CA].UD.Enabled:=False;
//     Arr[CA].UD.Associate:=Arr[CA].ED;

     Arr[CA].Priznak:=DM.Qr2.FieldByName('Prizn').AsString;
     Arr[CA].nSklad:=DM.Qr2.FieldByName('nSklad').AsString;
     Arr[CA].aSklad:=DM.Qr2.FieldByName('aSklad').AsString;

    end;
   if B=False then
    ShowText('Следующие возвратные накладные не упакованы в ящики. Чтобы напечатать на них стикеры, в истории накладных необходимо отсканировать эти накладные и закрыть ящики!'#10+S);
  except
   on E:Exception do
    if Flag=1 then MainF.MessBox('Ошибка формирования списка накладных: '+E.Message) else raise E;
  end;
 end;

procedure TPrintMarkBoxF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TPrintMarkBoxF.Edit1KeyPress(Sender:TObject; var Key:Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

procedure TPrintMarkBoxF.Edit1Change(Sender:TObject);
var i:Integer;
 begin
{  for i:=Low(Arr) to High(Arr) do
   Arr[i].ED.Text:=Edit1.Text;
}
 end;

procedure TPrintMarkBoxF.BitBtn1Click(Sender:TObject);
var q,Rc,i,j:Integer;
    Tb:TTableObj;
    ss,EAN13:String;

 begin
  try
   PrintRep.Clear;
   PrintRep.SetDefault;
   PrintRep.Font.Size:=7;
   PrintRep.Font.Style:=[fsBold];
   Rc:=0;

//   DM.ADOCo.BeginTrans;
   try
    for i:=Low(Arr) to High(Arr) do
     if Arr[i].UD.Position>0 then
      begin
       DM.Qr4.Close;
       DM.Qr4.SQL.Text:='update JMoves set NumBox='+IntToStr(Arr[i].UD.Position)+' where type_nakl=2 and nn_nakl='''+Arr[i].LB.Caption+'''';
       DM.Qr4.ExecSQL;
      end;
//    DM.ADOCo.CommitTrans;
   except
//    DM.ADOCo.RollbackTrans;
    raise;
   end;

   for i:=Low(Arr) to High(Arr) do Rc:=Rc+Arr[i].UD.Position;
   if Rc<=0 then Exit;
   PrintRep.AddTable(3,Rc);
   Tb:=PrintRep.LastTable;
   q:=0;
   for i:=Low(Arr) to High(Arr) do
    begin

     DM.Qr4.Close;
     DM.Qr4.SQL.Text:='select shtrih,(select top 1 Priznak from Jmoves j where j.iddoc=Max(m.iddoc)) as Priznak from Moves m where iddoc='+IntToStr(Arr[i].IDDOC)+' group by shtrih order by 1';
     DM.Qr4.Open;

     for j:=1 to Arr[i].UD.Position do
      begin
       if j=1 then DM.Qr4.First else DM.Qr4.Next;
       Inc(q);

       Tb.Cell[1,q].Font.Size:=7;
       Tb.Cell[1,q].AddText(Arr[i].nSklad+#10+Arr[i].aSklad+#10#10);

       Tb.Cell[1,q].Font.Size:=11;
       Tb.Cell[1,q].AddText('    '+IntToStr(j)+'.');
       Tb.Cell[1,q].Font.Size:=8;
       Tb.Cell[1,q].AddText(#10#10'Накладная: '+Arr[i].LB.Caption+'-'+IntToStr(Prm.AptekaID)+#10+DateToStr(Arr[i].Date_Nakl));

       ss:='';
       { else
       if (Arr[i].Priznak='Фарминспекция') or (Arr[i].Priznak='Переброска')  then ss:='БЕЛОСТОЦКИЙ!' else
       if (Arr[i].Priznak='По акту') or (Arr[i].Priznak='Срок') or (Arr[i].Priznak='Возврат фирме') or (Arr[i].Priznak='Излишек') then ss:='МОСКОВСКИЙ!';
       }

       if Prm.FirmID=19 then
        Tb.Cell[2,q].AddText(#10+Prm.aCity+' '+Prm.AptekaNameRU+#10#10)
       else
        Tb.Cell[2,q].AddText(#10+Prm.AptekaNameRU+#10#10);

       if DM.Qr4.FieldByName('Priznak').AsInteger=18 then
        Tb.Cell[2,q].AddText('АПТЕЧНЫЙ КУРЬЕР'#10)
       else
        Tb.Cell[2,q].AddText('Причина: '+Arr[i].Priznak+#10);
       Tb.Cell[2,q].AddInterv(3);

       Tb.Cell[2,q].Font.Style:=[];
       Tb.Cell[2,q].Font.Name:='EanBwrP36Tt';
       Tb.Cell[2,q].Font.CharSet:=ANSI_CHARSET;
       EAN13:='1'+IntToStrF(StrToInt(Copy(Arr[i].LB.Caption,7,6)),6)+IntToStrF(Prm.AptekaID,3)+IntToStrF(j,2);
       Tb.Cell[2,q].Font.Size:=16;
       Tb.Cell[2,q].AddText(GenEAN13(EAN13));

       Tb.Cell[3,q].Font.Size:=6;
       Tb.Cell[3,q].Align:=AL_RIGHT;
       Tb.Cell[3,q].AddText('Дата: '+FormatDateTime('dd.mm.yyyy hh:nn:ss',Now));

       Tb.Cell[3,q].Font.Size:=7;
       Tb.Cell[3,q].Align:=AL_LEFT;
       Tb.Cell[3,q].AddText(#10#10'Фамилия собравшего'+#10+'возврат______________'#10);


       if DM.Qr4.FieldByName('shtrih').AsString<>'' then
        begin
         Tb.Cell[3,q].Align:=AL_CENTER;
         Tb.Cell[3,q].AddText('Ящик'#10);
         Tb.Cell[3,q].Font.Style:=[];
         Tb.Cell[3,q].Font.Name:='EanBwrP36Tt';
         Tb.Cell[3,q].Font.CharSet:=ANSI_CHARSET;
         Tb.Cell[3,q].Font.Size:=16;
         Tb.Cell[3,q].AddText(GenEAN13(DM.Qr4.FieldByName('shtrih').AsString));
        end;

       Tb.Cell[1,q].RightBorder:=EMPTY_BORDER;

       Tb.Cell[2,q].RightBorder:=EMPTY_BORDER;

     end;
    end;
   if PrintRep.PreView then Printed:=True;
  except
   on E:Exception do
    if Flag=1 then MainF.MessBox('Ошибка формирования списка для печати: '+E.Message) else raise E;
  end;
 end;

procedure TPrintMarkBoxF.ViewClick(Sender: TObject);
 begin
  if Assigned(Sender)=False then Exit;
  try
   NoScanViewF:=TNoScanViewF.Create(Self);
   try
    DM.qrNoScanV.Close;
    DM.qrNoScanV.SQL.Clear;
    DM.qrNoScanV.SQL.Add('select b.art_code,b.names,Sum(a.kol) as kol,Sum(Isnull(IsScan,0)) as IsScan');
    DM.qrNoScanV.SQL.Add('from Moves a (nolock), SprTov b (nolock)');
    DM.qrNoScanV.SQL.Add('where a.kod_name=b.kod_name and a.iddoc='+IntToStr(TBitBtn(Sender).Tag));
    DM.qrNoScanV.SQL.Add('group by b.art_code,b.names');
    DM.qrNoScanV.SQL.Add('having Sum(a.kol)<>Sum(Isnull(IsScan,0)) ');
    DM.qrNoScanV.SQL.Add('order by 2');
    DM.qrNoScanV.Open;
    Application.ProcessMessages;
    NoScanViewF.ShowModal;
   finally
    NoScanViewF.Free;
   end;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к накладным: '+E.Message);
  end;
 end;

end.

