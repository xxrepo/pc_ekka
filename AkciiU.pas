unit AkciiU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGrids, ADODB;
                                         
type
  TAkciiF = class(TForm)
    PageControl1: TPageControl;
    BitBtn1: TBitBtn;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    DBGrid3: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbSum: TLabel;
    Label6: TLabel;
    lbCnt: TLabel;
    Label5: TLabel;
    Panel4: TPanel;
    DBGrid4: TDBGrid;
    Label7: TLabel;
    Panel5: TPanel;
    DBGrid5: TDBGrid;
    Label8: TLabel;
    lbSum1: TLabel;
    lbRules: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender:TObject; var Action: TCloseAction);

  private

    procedure ShowDhAkcii(Qr:TADOQuery; Tb:String);

  public

    procedure ShowAkciiAdd;
    procedure ShowAkciiRules;
    procedure ShowSpis(Qr:TADOQuery; FArt:String);
    procedure ShowSpisP(Qr:TADOQuery);

  end;

var AkciiF:TAkciiF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TAkciiF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  PageControl1.ActivePage:=TabSheet1;
  ShowDhAkcii(DM.qrDhAkcii,'DhAkcii');
  ShowDhAkcii(DM.qrDhAkciiP,'DhAkciiP');
 end;

procedure TAkciiF.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TAkciiF.ShowDhAkcii(Qr:TADOQuery; Tb:String);
var ID:Integer;
 begin
  try
   if Qr.Active then ID:=Qr.FieldByName('ID').AsInteger;

   Qr.Close;
   Qr.SQL.CLear;
   Qr.SQL.Add('select * from '+Tb);
   Qr.SQL.Add('order by DateStart,DateEnd,Descr ');
   Qr.Open;

   Qr.Locate('ID',ID,[]);
   if qr=DM.qrDhAkcii then ShowSpis(DM.qrAArt,'art_code') else
   if qr=DM.qrDhAkciiP then ShowSpisP(DM.qrAArtP);
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику акций: '+E.Message);
  end;
 end;

procedure TAkciiF.ShowSpis(Qr:TADOQuery; FArt:String);
var qrA:TADOQuery;
 begin
  try
   Qr.Close;
   qrA:=DM.qrDhAkcii;

   if qrA.IsEmpty then Exit;

   Qr.SQL.Clear;
   Qr.SQL.Add('select b.art_code,b.names,a.kol,a.sumchek,a.sumchek2,a.cnt');
   Qr.SQL.Add('from DtAkcii a, (select art_code,names from SprTov group by art_code,names) as b');
   Qr.SQL.Add('where a.art_code<>0 and a.'+FArt+'=b.art_code and');
   Qr.SQL.Add('      a.id_akcii='+qrA.FieldByName('id').AsString);
   Qr.SQL.Add('group by b.art_code,b.names,a.kol,a.sumchek,a.sumchek2,a.cnt');
   Qr.SQL.Add('union');
   Qr.SQL.Add('select top 1 0 as art_code,''Любые препараты'' as names,kol,sumchek,sumchek2,cnt');
   Qr.SQL.Add('from DtAkcii ');
   Qr.SQL.Add('where art_code=0 and ');
   Qr.SQL.Add('      id_akcii='+qrA.FieldByName('id').AsString);
   Qr.SQL.Add('order by b.names');
//   Qr.SQL.SaveToFile('C:\log\Akcii.txt');
   Qr.Open;
   ShowAkciiAdd;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику акций: '+E.Message);
  end;
 end;

procedure TAkciiF.ShowSpisP(Qr:TADOQuery);
var qrA:TADOQuery;
 begin
  try
   Qr.Close;
   qrA:=DM.qrDhAkciiP;

   if qrA.IsEmpty then Exit;

   Qr.SQL.Clear;
   Qr.SQL.Add('select b.art_code,b.names,a.kol,a.sumchek,a.cnt,a.rules');
   Qr.SQL.Add('from DtAkciiP a, (select art_code,names from SprTov group by art_code,names) as b');
   Qr.SQL.Add('where a.art_code=b.art_code and');
   Qr.SQL.Add('      a.id_akcii='+qrA.FieldByName('id').AsString);
   Qr.SQL.Add('group by b.art_code,b.names,a.kol,a.sumchek,a.cnt,a.rules');
   Qr.SQL.Add('order by b.names');
   Qr.Open;
   ShowAkciiRules;

  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику акций: '+E.Message);
  end;
 end;

procedure TAkciiF.ShowAkciiRules;
var s1,s2:Real;
 begin
  if PageControl1.ActivePage<>TabSheet2 then Exit;
  DM.qrAAdd.Close;
  lbSum1.Caption:='Сумма чеков:';
  lbRules.Caption:='';
  if DM.qrAArtP.IsEmpty then Exit;
  lbSum1.Caption:='Сумма чеков: '+CurrToStrF(DM.qrAArtP.FieldByName('SumChek').AsFloat,ffFixed,2);
  lbRules.Caption:=DM.qrAArtP.FieldByName('Rules').AsString;

 end;

procedure TAkciiF.ShowAkciiAdd;
var s1,s2:Real;
 begin
  if PageControl1.ActivePage<>TabSheet1 then Exit;
  DM.qrAAdd.Close;
  lbSum.Caption:='Сумма чека:';
  lbCnt.Caption:='';
  if DM.qrAArt.IsEmpty then Exit;
  s1:=DM.qrAArt.FieldByName('sumchek').AsFloat;
  s2:=DM.qrAArt.FieldByName('sumchek2').AsFloat;

  if (s1>0) and (s2>s1) then
   lbSum.Caption:='Сумма чека: от '+CurrToStrF(s1,ffFixed,2)+' грн. по '+CurrToStrF(s2,ffFixed,2)+' грн.' else
  if (s1>0) then lbSum.Caption:='Сумма чека: от '+CurrToStrF(s1,ffFixed,2)+' грн.'
            else lbSum.Caption:='Сумма чека: от 0.00 грн.';

  lbCnt.Caption:=DM.qrAArt.FieldByName('cnt').AsString+' и более';

  DM.qrAAdd.SQL.Clear;
  DM.qrAAdd.SQL.Add('select b.art_code,b.names,a.kol_add as kol');
  DM.qrAAdd.SQL.Add('from DtAkcii a, (select art_code,names from SprTov group by art_code,names) as b');
  DM.qrAAdd.SQL.Add('where a.art_add=b.art_code and a.art_code='+DM.qrAArt.FieldByName('art_code').AsString);
  DM.qrAAdd.SQL.Add('      and a.id_akcii='+DM.qrDhAkcii.FieldByName('id').AsString);
  DM.qrAAdd.SQL.Add('group by b.art_code,b.names,a.kol_add');
  DM.qrAAdd.SQL.Add('order by b.names');
  DM.qrAAdd.Open;
 end;

procedure TAkciiF.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  DM.qrDhAkcii.Close;
  DM.qrAArt.Close;
  DM.qrAAdd.Close;
  DM.qrDhAkciiP.Close;
  DM.qrAArtP.Close;
 end;

end.
