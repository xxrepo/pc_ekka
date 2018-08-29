unit SpisU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ActnList, Buttons, Grids, DBGrids, PrintReport,
  DBCtrls, Util;

type
  TSpisF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    bbClose: TBitBtn;
    tmrWait: TTimer;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    StaticText1: TStaticText;
    lbAvgCh: TStaticText;
    StaticText2: TStaticText;
    lbNCh: TStaticText;
    lbMaxAvgCh: TStaticText;
    Panel3: TPanel;
    Label2: TLabel;
    StaticText3: TStaticText;
    lbSop: TStaticText;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    DBText1: TDBText;
    Label4: TLabel;
    RadioButton3: TRadioButton;
    DBText2: TDBText;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure tmrWaitTimer(Sender: TObject);
    procedure bbCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Label4MouseEnter(Sender: TObject);
    procedure Label4MouseLeave(Sender: TObject);
    procedure Label4Click(Sender: TObject);

  private

    FIncr:Byte;

  public

    Silent:Byte;

    procedure FilterSpis;

  end;

var SpisF:TSpisF;

implementation

uses MainU, DataModuleU, ShareU, ShowSimpTextU;

{$R *.dfm}

procedure TSpisF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  FIncr:=0;
  Label3.Caption:='Напоминаем Вам о необходимости пользоваться автозаменой и сопутствующими препаратами.';
  Label2.Caption:='Если замечание не корректно, Вы имеете право опротестовать его в трехдневный срок, отправив сообщение в Call-центр.';
                 //или использовать закладку: кабинет провизора / замечания требуюущие ответа.
 end;

procedure TSpisF.Action1Execute(Sender:TObject);
 begin
  //
 end;

procedure TSpisF.tmrWaitTimer(Sender:TObject);
 begin
  if Silent=1 then Exit;
  Inc(FIncr);
  if FIncr<5 then
   bbClose.Caption:='Закрыть ('+IntToStr(5-FIncr)+')'
  else
   bbClose.Caption:='Закрыть';
 end;


procedure TSpisF.bbCloseClick(Sender:TObject);
var Rc:Integer;
    Res:String;
 begin
  if Silent=1 then Close;

  if FIncr>=5 then
   if PrintSrokSkd(0) then
    begin
    {
     try
      DM.QrEx.Close;
      DM.QrEx.SQL.Text:='exec spY_ListViolations '+IntToStr(Prm.ID_Gamma)+',null,null,0 ';
      DM.QrEx.Open;
      Rc:=DM.QrEx.RecordCount;
      if Rc>0 then
       MainF.MessBox('У Вас есть замечания, на которые нужно дать ответ. (Кабинет провизора -> Замечания, требующие ответа)',
                      48,GetFont('MS Sans Serif',12,clBlue,[fsBold]),0,Res);
     except
     end;
     }

     Close;
    end;
 end;

procedure TSpisF.FormActivate(Sender: TObject);
 begin

{  if DM.qrViolations.IsEmpty then
   begin
    Height:=456;
    Top:=(Screen.Height-Height) div 2;
    Panel4.Visible:=False;
   end;
}
  if Silent=1 then bbClose.Caption:='Закрыть'; 
  if DM.qrViolations.IsEmpty then
   begin
    RadioButton1.Checked:=True;
    if DM.qrViolations.IsEmpty then
     RadioButton3.Checked:=True;
   end;

 end;

procedure TSpisF.FilterSpis;
 begin
  try
   DM.qrViolations.Close;
   DM.qrViolations.SQL.Clear;
   DM.qrViolations.SQL.Add('select v.dt,s.Descr,u.Users,v.coment,v.apteka ');
   DM.qrViolations.SQL.Add('from Inform..SprViolations s (nolock) ');
   DM.qrViolations.SQL.Add('       inner join ');
   DM.qrViolations.SQL.Add('     Inform..Violations v (nolock) on s.id=cast(v.id_v as varchar(30)) collate SQL_Latin1_General_CP1251_CI_AS ');
   DM.qrViolations.SQL.Add('      left join ');
   DM.qrViolations.SQL.Add('     SprUser u (nolock) on u.id_gamma=v.id_gamma ');
   DM.qrViolations.SQL.Add('where 1=1 ');
   if RadioButton2.Checked then
    begin
     DM.qrViolations.SQL.Add(' and  v.id_gamma='+IntToStr(Prm.ID_Gamma));

     DBGrid2.Columns[2].Visible:=False;
     DBGrid2.Columns[3].Visible:=False;
     DBGrid2.Columns[1].Width:=450;

    end else
   if RadioButton1.Checked then
    begin

     DM.qrViolations.SQL.Add(' and  v.id_apteka='+IntToStr(Prm.AptekaID));
     DBGrid2.Columns[2].Visible:=True;
     DBGrid2.Columns[3].Visible:=False;
     DBGrid2.Columns[1].Width:=311;

    end else begin
              DBGrid2.Columns[2].Visible:=True;
              DBGrid2.Columns[3].Visible:=True;
              DBGrid2.Columns[1].Width:=208;
             end;

   DM.qrViolations.SQL.Add('order by v.dt desc ');

   DM.qrViolations.Open;
  except
  end;
 end;

procedure TSpisF.RadioButton1Click(Sender: TObject);
 begin
  FilterSpis;
 end;

procedure TSpisF.Label4MouseEnter(Sender: TObject);
 begin
  TLabel(Sender).Font.Style:=[fsUnderline];
 end;

procedure TSpisF.Label4MouseLeave(Sender: TObject);
 begin
  TLabel(Sender).Font.Style:=[];
 end;

procedure TSpisF.Label4Click(Sender: TObject);
 begin
  if DM.qrViolations.IsEmpty then Exit;
  ShowSimpTextF:=TShowSimpTextF.Create(Self);
  try
   ShowSimpTextF.DBMemo1.DataSource:=DM.srViolations;
   Application.ProcessMessages;
   ShowSimpTextF.ShowModal;
  finally
   ShowSimpTextF.Free;
  end;
 end;

end.





