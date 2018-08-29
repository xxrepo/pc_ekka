unit JTableU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGrids, Menus, Util, PrintReport, DateUtils;

type
  TJTableF = class(TForm)

    Panel1: TPanel;
    Label1: TLabel;
    cbFilter: TComboBox;
    Image1: TImage;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    bbView: TBitBtn;
    DBGrid1: TDBGrid;
    bbAdd: TBitBtn;
    pmNew: TPopupMenu;
    miNew2: TMenuItem;
    miNew1: TMenuItem;
    pn1: TPanel;
    Label7: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Panel5: TPanel;
    N1: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    Panel6: TPanel;
    Label5: TLabel;
    ComboBox2: TComboBox;
    Label6: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure cbFilterChange(Sender: TObject);
    procedure bbAddClick(Sender: TObject);
    procedure miNew1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
    procedure bbViewClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift:TShiftState);
    procedure BitBtn1Click(Sender: TObject);

  private

    procedure FilterGrafik;
    procedure ShowGrafikWin;
    procedure ShowGrafik(D1,D2:TDateTime; Show:Byte);

  public

  end;

var JTableF:TJTableF;

implementation

uses MainU, DataModuleU, TableU, GrafikU;

{$R *.dfm}

procedure TJTableF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  DM.QrEx.Close;
{

  DM.QrEx.SQL.Clear;

  DM.QrEx.SQL.Add('if (SELECT Count(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME=''DtGrafik'' AND COLUMN_NAME=''IsDop'')<=0 alter table DtGrafik add IsDop smallint ');
  DM.QrEx.SQL.Add('if (SELECT Count(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME=''DtGrafik'' AND COLUMN_NAME=''Dt_Begin'')<=0 alter table DtGrafik add Dt_Begin datetime ');
  DM.QrEx.SQL.Add('if (SELECT Count(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME=''DtGrafik'' AND COLUMN_NAME=''Dt_End'')<=0 alter table DtGrafik add Dt_End datetime ');
  DM.QrEx.SQL.Add('if (SELECT Count(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME=''DtGrafik'' AND COLUMN_NAME=''Dolgn'')<=0 alter table DtGrafik add Dolgn varchar(200) ');
  DM.QrEx.SQL.Add('if (SELECT Count(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME=''DtGrafik'' AND COLUMN_NAME=''id_role'')<=0 alter table DtGrafik add id_role smallint ');
  DM.QrEx.SQL.Add('if (SELECT Count(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME=''DtGrafik'' AND COLUMN_NAME=''IsZam'')<=0 alter table DtGrafik add IsZam smallint ');

  DM.QrEx.ExecSQL;

}
  FilterGrafik;
  UpDown1.Position:=StrToInt(FormatDateTime('yyyy',Date));
  ComboBOx2.ItemIndex:=StrToInt(FormatDateTime('mm',Date))-1;
 end;

procedure TJTableF.FilterGrafik;
var ID:Integer;
 begin
  try
   ID:=-1;
   if Not DM.qrGrafik.IsEmpty then ID:=DM.qrGrafik.FieldByName('IDTAB').AsInteger;
   DM.qrGrafik.Close;
   DM.qrGrafik.SQL.Clear;
   DM.qrGrafik.SQL.Add('select *');
   DM.qrGrafik.SQL.Add('from Inform..DHGrafik');
   Case cbFilter.ItemIndex of
    0:begin
       DM.qrGrafik.SQL.Add('where dtStart<='''+FormatDateTime('yyyy-mm-dd',Date)+' 00:00:00'' and ');
       DM.qrGrafik.SQL.Add('      dtEnd>'''+FormatDateTime('yyyy-mm-dd',Date)+' 00:00:00'' ');
      end;
    1:begin
       DM.qrGrafik.SQL.Add('where dtStart<'''+FormatDateTime('yyyy-mm-dd',Date+7)+' 00:00:00'' and ');
       DM.qrGrafik.SQL.Add('      dtEnd>'''+FormatDateTime('yyyy-mm-dd',Date+7)+' 00:00:00'' ');
      end;
    2:begin
       DM.qrGrafik.SQL.Add('where dtEnd>'''+FormatDateTime('yyyy-mm-dd',Date-21)+' 00:00:00'' and ');
       DM.qrGrafik.SQL.Add('      dtEnd<'''+FormatDateTime('yyyy-mm-dd',Date+7)+' 00:00:00'' ');
      end; 
   end;
   DM.qrGrafik.SQL.Add('order by dtstart');
   DM.qrGrafik.Open;
   DM.qrGrafik.Locate('IDTAB',ID,[]);
  except
   on E:Exception do MainF.MessBox('Ошибка доступка к таблице "Графики работы сотрудников": '+E.Message);
  end;
 end;

procedure TJTableF.BitBtn4Click(Sender:TObject);
 begin
  Close;
 end;

procedure TJTableF.cbFilterChange(Sender:TObject);
 begin
  FilterGrafik;
 end;

procedure TJTableF.bbAddClick(Sender:TObject);
 begin
  if Not MainF.IsPermit([R_SUPER,R_DISP],P_ALERT) then Exit;
  pmNew.Popup(Left+Panel3.Left+bbAdd.Left+3,Top+Panel3.Top+bbAdd.Top+bbAdd.Height+22);
 end;

procedure TJTableF.ShowGrafik(D1,D2:TDateTime; Show:Byte);
var IDTAB:Integer;
 begin
  DM.ADOCo.BeginTrans;
  try
   if Prm.NewGrafik=False then
    begin
     DM.spY_AddGrafik.Close;
     DM.spY_AddGrafik.Parameters.ParamValues['@dtstart']:=D1;
     DM.spY_AddGrafik.Parameters.ParamValues['@dtend']:=D2;
     DM.spY_AddGrafik.Parameters.ParamValues['@show']:=Show;
     DM.spY_AddGrafik.Open;
     if DM.spY_AddGrafik.Parameters.ParamValues['@RETURN_VALUE']<>888 then Abort;
     IDTAB:=DM.spY_AddGrafik.FieldByName('idtab').AsInteger;
     if IDTAB=-1 then Abort;
     DM.ADOCo.CommitTrans;
     TableF:=TTableF.Create(nil);
     try
      TableF.ShowOnly:=Show;
      TableF.IDTAB:=IDTAB;
      Application.ProcessMessages;
      TableF.ShowModal;
     finally
      TableF.Free;
     end;
    end else begin
              DM.ADOCo.CommitTrans;
              GrafikF:=TGrafikF.Create(nil);
              try
               GrafikF.ShowOnly:=Show;
               GrafikF.IDTAB:=IDTAB;
               Application.ProcessMessages;
               GrafikF.ShowModal;
              finally
               GrafikF.Free;
              end;
             end;
  except
   on E:Exception do
    begin
     DM.ADOCo.RollbackTrans;
     MainF.MessBox('Ошибка записи в таблицу "Графики работы сотрудников": '+E.Message);
    end; 
  end;
 end;

procedure TJTableF.ShowGrafikWin;
var Show:Integer;
 begin
  if DM.qrGrafik.IsEmpty then Exit;

  DM.QrEx.Close;
  DM.QrEx.SQL.Clear;
  DM.QrEx.SQL.Add('select Count(*) as Cnt');
  DM.QrEx.SQL.Add('from Inform..DhGrafik h (nolock), ');
  DM.QrEx.SQL.Add('     Inform..DtGrafik t (nolock)  ');
  DM.QrEx.SQL.Add('where h.idtab=t.idtab and t.id_type=7 and t.id_user='+IntToStr(Prm.UserID)+' and ');
  DM.QrEx.SQL.Add('      getdate() between h.dtstart and h.dtend+1 and  ');
  DM.QrEx.SQL.Add('       (dbo.CheckIntervAll(dtstart+'+IntToStr(DayOfTheWeek(Date)-1)+',d'+IntToStr(DayOfTheWeek(Date))+'1,getdate())=1 or ');
  DM.QrEx.SQL.Add('        dbo.CheckIntervAll(dtstart+'+IntToStr(DayOfTheWeek(Date)-1)+',d'+IntToStr(DayOfTheWeek(Date))+'2,getdate())=1  ) ');
  DM.QrEx.Open;

  if (Prm.UserRole in [R_ADMIN,R_SUPER]) or (DM.QrEx.FieldByName('Cnt').AsInteger>0) then Show:=0 else Show:=1;


  ShowGrafik(DM.qrGrafik.FieldByName('dtStart').AsDateTime,DM.qrGrafik.FieldByName('dtEnd').AsDateTime,Show);

 end;

procedure TJTableF.miNew1Click(Sender:TObject);
var mi:TMenuItem;
    D1,D2:TDateTime;
 begin
  if Sender=nil then Exit;
  mi:=TMenuItem(Sender);
  D1:=7*mi.Tag+Date-DayOfWeekRu(Date)+1;
  D2:=D1+6;
  ShowGrafik(D1,D2,0);
  FilterGrafik;
 end;

procedure TJTableF.DBGrid1DrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);
  if db.DataSource.DataSet.FieldByName('DTEND').AsDateTime<Date then db.Canvas.Font.Color:=clBtnFace;

  if (db.DataSource.DataSet.FieldByName('DTSTART').AsDateTime<Date) and
     (db.DataSource.DataSet.FieldByName('DTEND').AsDateTime>Date) then db.Canvas.Font.Color:=clBlue;

  if (db.DataSource.DataSet.FieldByName('DTSTART').AsDateTime<Date+7) and
     (db.DataSource.DataSet.FieldByName('DTEND').AsDateTime>Date+7) then db.Canvas.Font.Color:=clMaroon;
  if db.DataSource.DataSet.FieldByName('DTSTART').AsDateTime>Date+7 then db.Canvas.Font.Color:=clRed;

  if gdSelected in State then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;
  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure TJTableF.bbViewClick(Sender:TObject);
 begin
  ShowGrafikWin;
 end;

procedure TJTableF.DBGrid1DblClick(Sender:TObject);
 begin
  ShowGrafikWin;
 end;

procedure TJTableF.DBGrid1KeyDown(Sender:TObject; var Key: Word; Shift:TShiftState);
 begin
  if Key=VK_RETURN then ShowGrafikWin;
 end;

procedure TJTableF.BitBtn1Click(Sender: TObject);
var Dt:TDateTime;
    Tb:TTableObj;
 begin
  if ComboBox2.ItemIndex=-1 then Exit;
  try
   Dt:=StrToDateTime('01.'+LeadZero(ComboBox2.ItemIndex+1)+'.'+IntToStr(UpDown1.Position)+' 00:00:00');
   PrintRep.Clear;
   PrintRep.SetDefault;

   PrintRep.Font.Name:='Arial';
   PrintRep.Font.Size:=6;

   PrintRep.AddTable(2,2);

   Tb:=PrintRep.LastTable;
   Tb.SetWidths('6000,4000');
   Tb.SetBorders(1,1,2,2,EMPTY_BORDER);
   Tb.Cell[2,1].AddText(Prm.FirmNameUA);
//   Tb.Cell[2,2].AddText(Prm.AptekaNameUA);

   PrintRep.Align:=AL_CENTER;
   PrintRep.AddText(#10#10'З Графіком роботи на '+ComboBox2.Text+' місяць '+Edit1.Text);
   PrintRep.AddText(#10#10'ознайомлений і згоден дотримуватись'#10#10);
   DM.QrEx.Close;
   DM.QrEx.SQL.Clear;
   DM.QrEx.SQL.Add('select ''NumS'' as [№ з/п_S_1000],s.users as [П.I.Б_S_6000],'''' as [Підпис_S_3000]  ');
   DM.QrEx.SQL.Add('from Inform..DhGrafik h,                                                             ');
   DM.QrEx.SQL.Add('     Inform..DtGrafik t,                                                             ');
   DM.QrEx.SQL.Add('     SprUser s                                                                       ');
   DM.QrEx.SQL.Add('where h.idtab=t.idtab and t.id_type in (0,1,2) and                                   ');
   DM.QrEx.SQL.Add('      s.id=t.id_user and '''+FormatDateTime('yyyy-mm-dd',Dt)+' 00:00:00'' between h.dtstart and h.dtend and ');

   DM.QrEx.SQL.Add('      (dbo.GetHours(t.d11)>0 or dbo.GetHours(t.d12)>0 or dbo.GetHours(t.d21)>0 or dbo.GetHours(t.d22)>0 or dbo.GetHours(t.d31)>0 or dbo.GetHours(t.d32)>0 or dbo.GetHours(t.d71)>0 or ');
   DM.QrEx.SQL.Add('       dbo.GetHours(t.d41)>0 or dbo.GetHours(t.d42)>0 or dbo.GetHours(t.d51)>0 or dbo.GetHours(t.d52)>0 or dbo.GetHours(t.d61)>0 or dbo.GetHours(t.d62)>0 or dbo.GetHours(t.d72)>0) ');

   DM.QrEx.SQL.Add('group by s.users                                                                     ');
   DM.QrEx.SQL.Add('order by 1                                                                           ');
//   DM.QrEx.SQL.SaveToFile('C:\hj1.txt');
   DM.QrEx.Open;
   PrintRep.Qr:=DM.QrEx;
   PrintRep.PrintTable(False,0,0);
   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования отчета: '+E.Message);
  end;
 end;

end.





