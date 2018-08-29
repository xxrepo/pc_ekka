unit ConfirmZpMessU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TConfirmZpMessF = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;

    procedure FormCreate(Sender:TObject);
    procedure BitBtn2Click(Sender:TObject);
    procedure BitBtn1Click(Sender:TObject);

  private

    procedure FilterSpis;

  public
  end;

var ConfirmZpMessF:TConfirmZpMessF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TConfirmZpMessF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  FilterSpis;
 end;

procedure TConfirmZpMessF.FilterSpis;
var S:String;
 begin
  try
   DM.qrZpMess.Close;
   DM.qrZpMess.SQL.Clear;

   DM.qrZpMess.SQL.Add('select z.id,z.dt,u.users,z.subject,z.summa');
   DM.qrZpMess.SQL.Add('from ZpList z (nolock), ');
   DM.qrZpMess.SQL.Add('     SprUser u (nolock) ');
   DM.qrZpMess.SQL.Add('where z.id_gamma=u.id_gamma and ');
   DM.qrZpMess.SQL.Add('      z.dt_read is not null and ');
   DM.qrZpMess.SQL.Add('      z.dt_confirm is null and ');
   DM.qrZpMess.SQL.Add('      z.dt>getdate()-15 and ');
   DM.qrZpMess.SQL.Add('      z.id_apteka=:idapteka and ');
   DM.qrZpMess.SQL.Add('      z.id_gamma=:idgamma ');
   DM.qrZpMess.SQL.Add('order by z.dt ');
   DM.qrZpMess.Parameters.ParamByName('idapteka').Value:=Prm.AptekaID;
   DM.qrZpMess.Parameters.ParamByName('idgamma').Value:=Prm.ID_Gamma;
   DM.qrZpMess.Open;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику сообщений: '+E.Message);
  end;
 end;

procedure TConfirmZpMessF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TConfirmZpMessF.BitBtn1Click(Sender: TObject);
var S:String;
 begin
  if DM.qrZpMess.IsEmpty then Exit;
   if MainF.MessBox('Вы действительно хотите подтвердить получение зарплаты?',52)<>ID_YES then Exit;

  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='update ZpList set dt_confirm=getdate() where id=:pid ';
   DM.QrEx.Parameters.ParamByName('pid').Value:=DM.qrZpMess.FieldByName('id').AsInteger;
   DM.QrEx.ExecSQL;
   FilterSpis;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к справочнику сообщений: '+E.Message);
  end;

 end;

end.
