unit EnterKolU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, DBCtrls, Util;

type
  TEnterKolF = class(TForm)
    Panel1: TPanel;                                                          
    Panel2: TPanel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TStaticText;
    Panel3: TPanel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    Image1: TImage;
    lbAlert: TLabel;
    lbName: TLabel;
    Panel4: TPanel;
    DBText1: TDBText;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);

  private

    FArt_Code:Integer;
    FParam:Integer;
    FParam2:Integer;
    Fid_zam:Integer;

  public

    property Art_Code:Integer read FArt_Code write FArt_Code;
    property id_zam:Integer read Fid_zam write Fid_zam;
    property Param:Integer read FParam write FParam;
    property Param2:Integer read FParam2 write FParam2;

  end;

var EnterKolF:TEnterKolF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TEnterKolF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  Fid_zam:=0;
  Label2.Caption:=Prm.UserName;
  Panel3.Visible:=False;
  Height:=141;
  Width:=475;
 end;

procedure TEnterKolF.BitBtn2Click(Sender:TObject);
 begin
  ModalResult:=mrCancel;
 end;

procedure TEnterKolF.BitBtn1Click(Sender:TObject);
 begin
  ModalResult:=mrOk;
 end;

procedure TEnterKolF.Edit1Change(Sender:TObject);
 begin
  try
   if StrToInt(Edit1.Text)<UpDown1.Min then Edit1.Text:=IntToStr(UpDown1.Min);
  except
   Edit1.Text:='0';
  end;
 end;

procedure TEnterKolF.FormActivate(Sender:TObject);
 begin
  try

   if Art_code=0 then Abort;
   {if Param=EN_SIMPLE then} Abort;

   DM.qrSpis.Close;
   DM.qrSpis.SQL.Clear;
   if Param2=0 then
    begin
     DM.qrSpis.SQL.Add('select a.art_code,a.names,Sum(a.ostat) as Ostat,a.Cena,b.Descr');
     DM.qrSpis.SQL.Add('from SprTov a, Inform..SprMap b');
     DM.qrSpis.SQL.Add('where a.art_code=b.art_map and b.art_code='+IntToStr(Art_Code));
     DM.qrSpis.SQL.Add('and a.ostat>0 and ((b.art_code=14818 and b.art_map=37839) or  a.cena>(select Max(cena) from SprTov where art_code='+IntToStr(Art_Code)+'))');
     DM.qrSpis.SQL.Add('group by a.art_code,a.names,a.Cena, b.Descr');
     DM.qrSpis.SQL.Add('order by a.Cena Desc');
    end else begin
              //Label3.Caption:='Ув. провизоры, замените '+lbName.Caption+' на один из списка...';
              DM.qrSpis.SQL.Text:='exec spY_ArtZamena '+IntToStr(Art_Code);
              Panel4.Visible:=False;
             end;

   DM.qrSpis.Open;
   if Param2=1 then
    begin
     Label3.Caption:=Copy(DM.qrSpis.FieldByName('FullDescr').AsString,1,200);
     Label5.Caption:='';

     DBGrid1.Top:=Label3.Top+Label3.Height+3;
    end;
    //Label5.Caption:='...и получите '+DM.qrSpis.FieldByName('Prize').AsString+' грн за каждую проданную позицию из списка';

   if DM.qrSpis.IsEmpty then Abort;
   Height:=415;
   Width:=560;
   Panel3.Visible:=True;
   DBGrid1.Width:=549;
  except
   Height:=141;
   Width:=475;
   Panel3.Visible:=False;
   BitBtn1.Left:=119;
   BitBtn2.Left:=237;
   Label4.Visible:=False;
  end;
 end;



procedure TEnterKolF.DBGrid1DblClick(Sender: TObject);
 begin
  if DM.qrSpis.IsEmpty then Exit;
  Art_Code:=DM.qrSpis.FieldByname('Art_Code').AsInteger;
  if Param2=1 then id_zam:=DM.qrSpis.FieldByname('id_zam').AsInteger;
  ModalResult:=mrOk;
 end;

end.
