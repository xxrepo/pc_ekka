unit ListBackPartU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type

  TListBackPartF = class(TForm)

    dsList: TDataSource;
    DBGrid1: TDBGrid;
    qrList: TADOQuery;
    btDel: TBitBtn;
    procedure FormCreate(Sender:TObject);
    procedure btDelClick(Sender: TObject);

  private

    procedure ShowList;

  public

    Flag:Integer;

  end;

var ListBackPartF:TListBackPartF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TListBackPartF.FormCreate(Sender: TObject);
 begin
  Flag:=0;
  Caption:=MFC;
  ShowList;
 end;

procedure TListBackPartF.ShowList;
 begin
  qrList.Close;
  qrList.SQL.Text:='select * from vListBackPart where iddoc='+DM.spY_NaklList.FieldByName('iddoc').AsString+' and art_code='+DM.qrShowNakl.FieldByName('art_code').AsString;
  qrList.Open;
 end;

procedure TListBackPartF.btDelClick(Sender: TObject);
 begin

  if qrList.IsEmpty then Exit;
  if MainF.MessBox('Вы действительно хотите удалить строку?',52)<>ID_YES then Exit;
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='exec spY_DeleteNakl '+DM.spY_NaklList.FieldByName('iddoc').AsString+','+qrList.FieldByName('kod_name').AsString+' select 999 as Res';
   DM.QrEx.Open;
   Flag:=1;
   ShowList;
  except
   on E:Exception do
    MainF.RegisterError('Удаление позиций из возвратов!',E.Message,False);
  end;

 end;

end.
