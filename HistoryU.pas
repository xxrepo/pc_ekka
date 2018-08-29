unit HistoryU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, Util;

type
  THistoryF=class(TForm)

    Panel1:TPanel;
    ComboBox1:TComboBox;
    Panel2: TPanel;
    imHistory: TImage;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    bbView: TBitBtn;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure bbViewClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);

  private

    procedure FilterMess;

  public


  end;

var HistoryF:THistoryF;

implementation

uses MainU,DataModuleU, ShowNewInfoU;

{$R *.dfm}

procedure THistoryF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  FilterMess;
 end;

procedure THistoryF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure THistoryF.FilterMess;
var S,ss,S2:String;
    ID,IDPrev,IDNext:Integer;
 begin
  try
   S:='';
   Case ComboBox1.ItemIndex of
    0:S:='10';
    1:S:='30';
    2:S:='50';
    3:S:='1000000';
   end;
   S2:='0';
   if CheckBox1.Checked=False then S2:='1';

   ss:='0';
   if Prm.UserRole=R_SUPER then ss:='1';

   ID:=-1; IDPrev:=-1; IDNext:=-1;
   if DM.qrHistory.Active then
    begin
     ID:=DM.qrHistory.FieldByName('id').AsInteger;

     DM.qrHistory.Prior;
     IDPrev:=DM.qrHistory.FieldByName('id').AsInteger;

     DM.qrHistory.Locate('ID',ID,[]);

     DM.qrHistory.Next;
     IDNext:=DM.qrHistory.FieldByName('id').AsInteger;
    end;

   DM.qrHistory.Close;
{
   DM.qrHistory.SQL.Text:='select '+S+' id,IsQueue,Left(Mess,50)+''...'' as Mess,DateM,Mess as MessFull,FName, '+#10+
                          '       (select top 1 users from SprUser s (nolock) where s.id_gamma=j.id_from) as users, '+#10+
                          '       case when r.id_mess is null then 0 else 1 end as IsRead'+#10+
                          'from Inform..JMess j (nolock) '+#10+
                          '      left join '+#10+
                          '     (select id_mess from Inform..JReadMess (nolock) where id_user='+IntToStr(Prm.UserID)+' and done=1 group by id_mess) r on r.id_mess=j.id '+#10+
                          'where '+S1+'  (IsNull(id_dest,-1) in (-1,-2,'+IntToStr(Prm.ID_Gamma)+') ) '+#10+S2+#10+
                          '      and j.datem>IsNull((select Min(a.date_chek) from ArhCheks a (nolock) ),getdate()+1000) '+
                          'order by DateM desc ';
}
   DM.qrHistory.SQL.Text:='exec spY_CheckNewMess '+IntToStr(Prm.UserID)+','+ss+',3,'+S2+','+S;
//   DM.qrHistory.Sql.SaveToFile('C:\Log\Hist.txt');
   DM.qrHistory.Open;

   if DM.qrHistory.Locate('ID',ID,[])=False then
    if DM.qrHistory.Locate('ID',IDPrev,[])=False then DM.qrHistory.Locate('ID',IDNext,[]);
  except
   on E:Exception do MainF.MessBox('Ошибка чтения журнала сообщений: '+E.Message);
  end;
 end;

procedure THistoryF.ComboBox1Change(Sender: TObject);
 begin
  FilterMess;
 end;

procedure THistoryF.bbViewClick(Sender: TObject);
 begin
  if DM.qrHistory.IsEmpty then Exit;
  try
   ShowNewInfoF:=TShowNewInfoF.Create(Self);
   try
    ShowNewInfoF.Incr:=0;
    if DM.qrHistory.FieldByName('IsRead').AsInteger=1  then ShowNewInfoF.MaxIncr:=0 else
    if DM.qrHistory.FieldByName('IsQueue').AsInteger=0 then ShowNewInfoF.MaxIncr:=5
                                                       else ShowNewInfoF.MaxIncr:=Length(DM.qrHistory.FieldByName('MessFull').AsString) div 30;

    if ShowNewInfoF.MaxIncr>60 then ShowNewInfoF.MaxIncr:=60;

    ShowNewInfoF.bbClose.Caption:='Закрыть';
    ShowNewInfoF.FileName:=DM.qrHistory.FieldByName('FName').AsString;
    ShowNewInfoF.Mess:=DM.qrHistory.FieldByName('MessFull').AsString;
    ShowNewInfoF.lbDate.Caption:=DM.qrHistory.FieldByName('DateM').AsString;
    ShowNewInfoF.lbFrom.Caption:='От кого: '+DM.qrHistory.FieldByName('Users').AsString;
    Application.ProcessMessages;
    ShowNewInfoF.ShowModal;

    DM.QrEx.Close;
    DM.QrEx.SQL.Clear;
    DM.QrEx.SQL.Add('Insert into Inform..JReadMess(ID_MESS,ID_USER,DONE)');
    DM.QrEx.SQL.Add('Values ('+DM.qrHistory.FieldByName('id').AsString+','+IntToStr(Prm.UserID)+',1)');
    DM.QrEx.SQL.Add('select 999 as Res');
    DM.QrEx.Open;
    FilterMess;

   finally
    ShowNewInfoF.Free;
   end;
  except
  end;
 end;

procedure THistoryF.DBGrid1DblClick(Sender:TObject);
 begin
  bbViewClick(bbView);
 end;

procedure THistoryF.CheckBox1Click(Sender: TObject);
 begin
  FilterMess;
 end;

procedure THistoryF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if db.DataSource.DataSet.FieldByName('IsRead').AsInteger=0 then db.Canvas.Font.Style:=[fsBold];
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

end.

{

select '+S+' id,IsQueue,Left(Mess,50)+''...'' as Mess,DateM,Mess as MessFull,FName,
       (select top 1 users from SprUser s (nolock) where s.id_gamma=j.id_from) as users,
       case when r.id_mess is null then 0 else 1 end as IsRead
from Inform..JMess j (nolock)
      left join
     (select id_mess from Inform..JReadMess (nolock) where id_user='+IntToStr(Prm.UserID)+' and done=1 group by id_mess) r on r.id_mess=j.id
where '+S1+'  (IsNull(id_dest,-1) in (-1,-2,'+IntToStr(Prm.ID_Gamma)+') ) +S2+
      and j.datem>IsNull((select Min(a.date_chek) from ArhCheks a (nolock) ),getdate()+1000)
order by DateM desc
}
