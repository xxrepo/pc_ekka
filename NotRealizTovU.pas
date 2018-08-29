unit NotRealizTovU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Grids, DBGrids, StdCtrls, Buttons, Util;

type
  TNotRealizTovF = class(TForm)
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    DBGrid10: TDBGrid;
    BitBtn2: TBitBtn;
    Label14: TLabel;
    edApteka: TEdit;
    sbApteka: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure sbAptekaClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private

  public

  end;

var
  NotRealizTovF: TNotRealizTovF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TNotRealizTovF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TNotRealizTovF.BitBtn29Click(Sender: TObject);
 begin
  if (edApteka.Tag=0) then
   begin
    MainF.MessBox('Аптека не выбрана!');
    Exit;
   end;

  DM.qrNotRealizTov.Close;
  DM.qrNotRealizTov.SQL.Text:='select * from NotRealizTov where id_apteka='+IntToStr(edApteka.Tag)+' order by  names';
  DM.qrNotRealizTov.Open;
 end;

procedure TNotRealizTovF.BitBtn30Click(Sender: TObject);
 begin
  DBGridToExcel(DBGrid10,edApteka.Text);
  MainF.MessBox('Отчет в Excel выгружен!',64);
 end;

procedure TNotRealizTovF.sbAptekaClick(Sender: TObject);
 begin
  if MainF.ShowClient(edApteka.Tag,SPR_APTEKA)=1 then
   begin
    edApteka.Text:=DM.qrClient.FieldByName('Descr').AsString;
    edApteka.Tag:=DM.qrClient.FieldByName('ID').AsInteger;
   end;
 end;

procedure TNotRealizTovF.SpeedButton3Click(Sender: TObject);
 begin
  edApteka.Text:='';
  edApteka.Tag:=0;
 end;

procedure TNotRealizTovF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

end.

