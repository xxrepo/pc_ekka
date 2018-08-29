unit SpisArtAddU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, jpeg;

type
  TSpisArtAddF = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    Image1: TImage;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key:Word; Shift:TShiftState);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private

    FParam:Byte;
    FKol:Integer;
    FFlag:Integer;
    FFlag1:Integer;
    FArt_Code:Integer;

  public

    property Param:Byte read FParam write FParam;
    property Kol:Integer read FKol write FKol;
    property Flag:Integer read FFlag write FFlag;
    property Art_Code:Integer read FArt_Code write FArt_Code;

  end;

var SpisArtAddF:TSpisArtAddF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TSpisArtAddF.FormCreate(Sender:TObject);
 begin
  Caption:='ѕредлагайте указанный товар, использу€ подсказку';
  Kol:=0;
  Art_code:=0;
  FFlag:=0;
  FFlag1:=0;
 end;

procedure TSpisArtAddF.DBGrid1DblClick(Sender:TObject);
var AC,id_zam:Integer;
    S:String;
 begin
  AC:=DM.qrArtAdd.FieldByName('Art_Code').AsInteger;
  if Param=0 then
   Kol:=MainF.GetKolFromDialog(TrimRight(DM.qrArtAdd.FieldByName('Names').AsString),1,AC,id_zam,EN_SIMPLE)
  else
   Kol:=1;
  Art_Code:=AC;
  if Kol>0 then begin Flag:=1; Close; end;
 end;

procedure TSpisArtAddF.DBGrid1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
 begin
  if Key=VK_RETURN then DBGrid1DblClick(Sender);
 end;

procedure TSpisArtAddF.FormShortCut(var Msg:TWMKey; var Handled:Boolean);
 begin
  if Msg.CharCode=27 then Close;
 end;

procedure TSpisArtAddF.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 begin
  CanClose:=True;
{
  if Param<>1 then CanClose:=True else
   begin
    CanClose:=False;
    if (Flag=1) or (FFlag1=1) then CanClose:=True else
    if (Panel3.Visible=False) and (Flag=0) then Panel3.Visible:=True;
   end;
}
 end;

procedure TSpisArtAddF.BitBtn2Click(Sender:TObject);
 begin
  FFlag1:=1;
  Close;
 end;

procedure TSpisArtAddF.BitBtn1Click(Sender:TObject);
 begin
  Panel3.Visible:=False;
 end;

end.



