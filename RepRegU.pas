unit RepRegU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Menus, PrintReport, Util, ShareU;

type

  TRepRegF = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    dbgR: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    pmPrnReg: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn4: TBitBtn;
    pmPrnCen: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure dbgRDrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
    procedure BitBtn1Click(Sender:TObject);
    procedure dbgRDblClick(Sender:TObject);
    procedure BitBtn3Click(Sender:TObject);
    procedure N1Click(Sender:TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);

  private

    procedure PrintReg(Param:Byte);
    procedure PrintCen(Param:Byte);

  public

  end;

var RepRegF:TRepRegF;

implementation

uses MainU, DataModuleU, ShowNonRegU;

{$R *.dfm}

procedure TRepRegF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  try
   DM.spY_RegPercent.Close;
   DM.spY_RegPercent.Open;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику товаров и полок! '+E.Message);
  end;
 end;

procedure TRepRegF.BitBtn2Click(Sender:TObject);
 begin
  Close;
 end;

procedure TRepRegF.dbgRDrawColumnCell(Sender:TObject; const Rect:TRect; DataCol:Integer; Column:TColumn; State:TGridDrawState);
var db:TDBGrid;
 begin
  if Sender=nil then Exit;
  db:=TDBGrid(Sender);

  db.Canvas.Font.Color:=clBlack;
  db.Canvas.Brush.Color:=clWhite;

  if DataCol in [0,2,6] then db.Canvas.Font.Style:=[fsBold];
  if DataCol=2 then db.Canvas.Font.Color:=clMaroon;
  if DataCol=6 then db.Canvas.Font.Color:=clBlue;

  if (gdSelected in State) then
   begin
    db.Canvas.Brush.Color:=clNavy;
    db.Canvas.Font.Color:=clWhite;
   end;

  db.DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

procedure TRepRegF.BitBtn1Click(Sender: TObject);
 begin
  if DM.spY_RegPercent.IsEmpty then Exit;
  try
   ShowNonRegF:=TShowNonRegF.Create(Self);
   try
    ShowNonRegF.F_Nds:=DM.spY_RegPercent.FieldByName('f_nds').AsInteger;
    ShowNonRegF.lbNDS.Caption:=DM.spY_RegPercent.FieldByName('nds').AsString;
    ShowNonRegF.ShowSpis;
    Application.ProcessMessages;
    ShowNonRegF.ShowModal;
   finally
    ShowNonRegF.Free;
   end;
  except
   Application.MessageBox('Ошибка формирования списка непроставленных наименований!','Места хранения',48);
  end;
 end;

procedure TRepRegF.dbgRDblClick(Sender:TObject);
 begin
  BitBtn1Click(BitBtn1);
 end;

procedure TRepRegF.BitBtn3Click(Sender:TObject);
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

procedure TRepRegF.PrintReg(Param:Byte);
var i:Integer;
    IsFirst:Boolean;
 begin
  IsFirst:=True;
  if Not Param in [1,2] then Exit;
  try
   PrintRep.Clear;
   for i:=1 to DM.spY_RegPercent.RecordCount do
    begin
     if i=1 then DM.spY_RegPercent.First else DM.spY_RegPercent.Next;

     DM.Qr.Close;
     DM.Qr.SQL.Clear;
     DM.Qr.SQL.Add('select a.Art_Code as Код_I_1400,      ');
     DM.Qr.SQL.Add('       a.Names as Наименование_S_9000,');
     DM.Qr.SQL.Add('       Sum(a.Ostat) as [Кол-во_I_1000],      ');
     DM.Qr.SQL.Add('       a.Cena as Цена_N_1100,         ');
     DM.Qr.SQL.Add('       a.Cena*Max(IsNull(p.Koef,1)) as [Цена Уп._N_1100],         ');
     DM.Qr.SQL.Add('       IsNull(convert(varchar(10),c.P1),'''')+IsNull(c.L1,'''') as [Осн._S_1000],         ');
     DM.Qr.SQL.Add('       IsNull(convert(varchar(10),c.P2),'''')+IsNull(c.L2,'''') as [Витр._S_1000],        ');
     DM.Qr.SQL.Add('       IsNull(convert(varchar(10),c.P3),'''')+IsNull(c.L3,'''') as [Скл._S_1000]          ');
     DM.Qr.SQL.Add('from SprTov a inner join Inform..SprReg c on a.art_code=c.art_code left join Plist p on a.art_code=p.art_code  ');
     DM.Qr.SQL.Add('where a.f_nds='+DM.spY_RegPercent.FieldByName('f_nds').AsString);

     if CheckBox1.Checked then
      DM.Qr.SQL.Add(' and IsNull(c.P2,0)>0 ');

     if StrToIntEd(Edit1.Text)>0 then
      DM.Qr.SQL.Add(' and c.P1='+IntToStr(StrToIntEd(Edit1.Text)));

     if StrToIntEd(Edit2.Text)>0 then
      DM.Qr.SQL.Add(' and c.P2='+IntToStr(StrToIntEd(Edit2.Text)));

     if StrToIntEd(Edit3.Text)>0 then
      DM.Qr.SQL.Add(' and c.P3='+IntToStr(StrToIntEd(Edit3.Text)));

     DM.Qr.SQL.Add('group by a.art_code,a.Names,a.cena,c.P1,c.P2,c.P3,c.L1,c.L2,c.L3');
     Case Param of
      1:DM.Qr.SQL.Add('order by a.Names');
      2:DM.Qr.SQL.Add('order by c.P2,c.P1,c.P3,a.Names');
     end;
     DM.Qr.Open;
     if DM.Qr.IsEmpty then Continue;
     if IsFirst=False then PrintRep.AddText(#12);

     PrintRep.SetDefault;
     PrintRep.Font.Name:='Arial';
     PrintRep.Font.Size:=5;
     PrintRep.Font.Style:=[fsBold];
     PrintRep.Align:=AL_CENTER;
     PrintRep.AddText('Список препаратов '+DM.spY_RegPercent.FieldByName('nds').AsString+' по местам хранения '+#10#10);

     PrintRep.Align:=AL_LEFT;
     PrintRep.AddText('Время печати списка: '+TimeToStr(Now)+#10#10);
     PrintRep.Font.Size:=4;
     PrintRep.Font.Style:=[];

     PrintRep.Qr:=DM.Qr;
     PrintRep.PrintTable(False,0,0);
     IsFirst:=False;
    end;
   PrintRep.PreView;
  except
   on E:Exception do MainF.MessBox('Ошибка формирования печатной формы накладной: '+E.Message);
  end;
 end;

procedure TRepRegF.N1Click(Sender:TObject);
 begin
  if Sender=nil then Exit;
  PrintReg(TControl(Sender).Tag);
 end;

procedure TRepRegF.Edit1KeyPress(Sender: TObject; var Key: Char);
 begin
  if Key<>#8 then
   if Not (Key in CH_DIGIT) then Key:=#0;
 end;

procedure TRepRegF.BitBtn4Click(Sender: TObject);
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
  pmPrnCen.Popup(dx,dy);
 end;

procedure TRepRegF.MenuItem1Click(Sender: TObject);
 begin
  if Sender=nil then Exit;
  PrintCen(TControl(Sender).Tag);
 end;

procedure TRepRegF.PrintCen(Param:Byte);
 begin
  try
   DM.Qr.Close;
   DM.Qr.SQL.Clear;

   DM.Qr.SQL.Add('select b.Art_code,b.Names, ');
   DM.Qr.SQL.Add(' Max(b.Cena) *dbo.GetKoef(b.art_code) as Cena, dbo.GetKoef(b.art_code) as Koef, IsNull(Max(s.CenaP)*dbo.GetKoef(b.art_code),0) as CenaP, dbo.GetCenaOpt(b.art_code)*dbo.GetKoef(b.art_code) as CenaOpt, Max(l.art_code) as Skd3, ');

   if MainF.MaxSkd>0 then
    DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where type_skd=4 and art_code=b.art_code),IsNull((select Max(skd) from Skd where type_skd=1),0)) as Skd, ') else
   if MainF.MaxSkd<=-3 then
    DM.Qr.SQL.Add('IsNull((select top 1 skd from Skd_limit where skd<3 and type_skd=4 and art_code=b.art_code),'+IntToStr(Abs(Round(MainF.MaxSkd)))+') as Skd, ')
   else
    DM.Qr.SQL.Add('0 as Skd, ');

   DM.Qr.SQL.Add('IsNull((select Max(ean13) from SprEan where art_code=b.art_code),'''') as Ean13,c.P1,c.P2,c.P3');
   DM.Qr.SQL.Add('from SprTovar s (nolock) left join SkdLimit0 l (nolock) on s.art_code=l.art_code, SprTov b (nolock),Inform..SprReg c (nolock) ');
   DM.Qr.SQL.Add('where b.ostat>0 and b.art_code=s.art_code and b.art_code=c.art_code and b.f_nds='+DM.spY_RegPercent.FieldByName('f_nds').AsString);

   if CheckBox1.Checked then
    DM.Qr.SQL.Add(' and IsNull(c.P2,0)>0');

   if StrToIntEd(Edit1.Text)>0 then
    DM.Qr.SQL.Add(' and c.P1='+IntToStr(StrToIntEd(Edit1.Text)));

   if StrToIntEd(Edit2.Text)>0 then
    DM.Qr.SQL.Add(' and c.P2='+IntToStr(StrToIntEd(Edit2.Text)));

   if StrToIntEd(Edit3.Text)>0 then
    DM.Qr.SQL.Add(' and c.P3='+IntToStr(StrToIntEd(Edit3.Text)));

   DM.Qr.SQL.Add('group by b.Art_code,b.Names,c.P1,c.P2,c.P3');
   Case Param of
    1:DM.Qr.SQL.Add('order by b.Names');
    2:DM.Qr.SQL.Add('order by c.P1,c.P2,c.P3,b.Names');
   end;
   //     DM.Qr.SQL.SaveToFile('C:\Cenn.txt');
   DM.Qr.Open;

   PrintCennikListExt(DM.Qr,W_CENNIK,True,False,False,Param);
  except
   on E:Exception do MainF.MessBox('Ошибка формирования списка ценников: '+E.Message);
  end;
 end;

end.