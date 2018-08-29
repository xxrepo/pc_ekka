unit ScanMagU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Buttons, StdCtrls, Util;

type
  TScanMagF = class(TForm)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key:Word; Shift:TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);

  private

    sSr:String;

  public

    PrefCard:TStringList;
    NumCard:Int64;
    Flag:Integer;
    LenEAN:Byte;
    LenEAN1:Byte;

  end;

var ScanMagF:TScanMagF;

function GetEANDiag(Pref:String; Cap:String; LenEAN:Byte=12; LenEAN1:Byte=13):Int64;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

function GetEANDiag(Pref:String; Cap:String; LenEAN:Byte=12; LenEAN1:Byte=13):Int64;
var s:TStrArray;
    i:Integer;
 begin
  try
   Result:=-1;
   ScanMagF:=TScanMagF.Create(nil);
   try
    ScanMagF.PrefCard.Clear;
    GetStrArray(Pref,S,[',']);
    for i:=Low(S) to High(S) do ScanMagF.PrefCard.Add(S[i]);
    ScanMagF.LenEAN:=LenEAN;
    ScanMagF.LenEAN1:=LenEAN1;
    ScanMagF.Label1.Caption:='Проведите штрих-код на '+Cap+' через сканер...';
    Application.ProcessMessages;
    ScanMagF.ShowModal;
    if ScanMagF.Flag=0 then Abort;
    if ScanMagF.NumCard<>-1 then Result:=ScanMagF.NumCard else Abort;
   finally
    ScanMagF.Free;
   end;
  except
   Result:=-1;
  end;
 end;

procedure TScanMagF.SpeedButton1Click(Sender: TObject);
 begin
  Close;
 end;

procedure TScanMagF.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
 begin
  if Msg.CharCode=27 then begin NumCard:=-1; Close; end;
 end;

procedure TScanMagF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  sSr:='';
  NUmCard:=-1;
  Flag:=0;
  PrefCard:=TStringList.Create;
 end;

procedure TScanMagF.FormKeyDown(Sender:TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key in K_ARROW_KEYS then sSr:='';
 end;

procedure TScanMagF.FormKeyPress(Sender:TObject; var Key:Char);
var B:Boolean;
    i:Integer;
 begin
  if Key in CH_ANSI then
   begin
    sSr:=sSr+Key;

    if PrefCard.Text='' then
     begin
      DM.QrEx.Close;
      DM.QrEx.SQL.Text:='select top 1 NumCard from CardsTVA where NumCard='''+sSr+'''';
      DM.QrEx.Open;
      if DM.QrEx.IsEmpty=False then
       begin
        NumCard:=StrToInt64(sSr);
        sSr:='';
        Flag:=1;
        Close;
       end;
     end;

    if Length(sSr)=LenEAN1 then
     begin
      B:=False;
      for i:=0 to PrefCard.Count-1 do
       if Copy(sSr,1,3)=PrefCard[i] then
        begin
         B:=True;
         Break;
        end;
      if PrefCard.Count=0 then B:=True;
      if B=False then begin MainF.MessBox('Штрих-код '+sSr+' неверный!'); sSr:=''; Exit; end;

      if (Copy(sSr,1,3)='MD0') or (Copy(sSr,1,3)='md0') or (Copy(sSr,1,3)='ьв0') or (Copy(sSr,1,3)='ЬВ0') then sSr:='272'+Copy(sSr,4,Length(sSr)-3) else
      if (Copy(sSr,1,3)='000') then sSr:='273'+Copy(sSr,4,Length(sSr)-3);

      NumCard:=StrToInt64(Copy(sSr,1,LenEAN));
      sSr:='';
      Flag:=1;
      Close;
     end;
   end;
 end;

procedure TScanMagF.FormDestroy(Sender: TObject);
 begin
  PrefCard.Free;
 end;

end.




