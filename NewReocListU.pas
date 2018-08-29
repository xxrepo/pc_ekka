unit NewReocListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  TNewReocListF = class(TForm)
    lbInfo: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn4: TBitBtn;
    bbPrint: TBitBtn;
    CheckBox5: TCheckBox;
    lbSort: TLabel;
    cbSort: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure bbPrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private

    FTypeList:Integer;
    procedure SetTypeList(const Value:Integer);

  public

    property TypeList:Integer read FTypeList write SetTypeList;

  end;

var NewReocListF:TNewReocListF;

implementation

uses MainU, DataModuleU, ShareU;

{$R *.dfm}

procedure TNewReocListF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;

 end;

procedure TNewReocListF.BitBtn4Click(Sender: TObject);
 begin
  try
   DM.qrReocList.Close;
   Case FTypeList of
    TP_REOC:  begin
               DM.qrReocList.SQL.Text:='exec spY_CheckNewReoc '+IntToStr(Prm.ID_Gamma)+',1';
              end; 
    TP_STIKER:DM.qrReocList.SQL.Text:='exec spY_CheckNewStiker '+IntToStr(Prm.ID_Gamma)+',1';
    TP_UPDC:  DM.qrReocList.SQL.Text:='exec spY_CheckUpdAkcArt '+IntToStr(Prm.ID_Gamma)+',1';
   end;
   DM.qrReocList.Open;

  except
  end;
  Close;
 end;

procedure TNewReocListF.bbPrintClick(Sender: TObject);
var B:Boolean;
    P:Integer;
 begin
  DM.qrReocList.Close;
  P:=1;
  Case FTypeList of
   TP_REOC  :begin
              DM.qrReocList.SQL.Text:='exec spY_CheckNewReoc '+IntToStr(Prm.ID_Gamma)+',2';
              if cbSort.ItemIndex in [0,1] then P:=cbSort.ItemIndex+1;
             end;
   TP_STIKER:DM.qrReocList.SQL.Text:='exec spY_CheckNewStiker '+IntToStr(Prm.ID_Gamma)+',2';
   TP_UPDC  :DM.qrReocList.SQL.Text:='exec spY_CheckUpdAkcArt '+IntToStr(Prm.ID_Gamma)+',2';
  end;
  DM.qrReocList.Open;
  if DM.qrReocList.IsEmpty then Exit;

  if FTypeList in [TP_REOC,TP_UPDC] then B:=False else B:=True;

  PrintCennikListExt(DM.qrReocList,W_CENNIK,True,B,CheckBox5.Checked,P);
 end;

procedure TNewReocListF.SetTypeList(const Value:Integer);
 begin
  FTypeList:=Value;
  Case Value of
   TP_REOC:begin
            bbPrint.Caption:='Печать ценников по переоценке...';
            lbInfo.Caption:='Внимание! Произошла переоценка следующих препаратов. Пожалуйста, распечатайте новые ценники (кнопка "Печать ценников по переоценке")';
            DBGrid1.Columns[2].Visible:=True;
            DBGrid1.Columns[3].Visible:=True;
            DBGrid1.Columns[1].Width:=429;
           end;
   TP_STIKER:begin
              bbPrint.Caption:='Печать стикеров...';
              lbInfo.Caption:='Внимание! На данные позиции необходимо распечатать новые стикеры (кнопка "Печать стикеров")!';
              DBGrid1.Columns[2].Visible:=False;
              DBGrid1.Columns[3].Visible:=False;
              DBGrid1.Columns[1].Width:=627;
             end;
   TP_UPDC:begin
            bbPrint.Caption:='Печать ценников...';
            lbInfo.Caption:='Внимание! Изменился список акционных позиций. Необходимо обновить ценники (кнопка "Печать ценников")!';
            DBGrid1.Columns[2].Visible:=False;
            DBGrid1.Columns[3].Visible:=False;
            DBGrid1.Columns[1].Width:=627;
           end;
  end;
 end;

procedure TNewReocListF.FormClose(Sender:TObject; var Action:TCloseAction);
 begin
  BitBtn4Click(BitBtn4);
 end;

procedure TNewReocListF.FormActivate(Sender:TObject);
 begin
  if FTypeList=TP_REOC then
   begin
    lbSort.Visible:=True;
    cbSort.Visible:=True;
   end; 
 end;

end.
