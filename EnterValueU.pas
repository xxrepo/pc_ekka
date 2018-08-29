unit EnterValueU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, Util;

type
  TEnterValueF = class(TForm)
    lbCaption: TLabel;
    edValue: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edValueKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private

    FTypeValue:Integer;
    FFlag:Integer;

  public

    property TypeValue:Integer read FTypeValue write FTypeValue;
    property Flag:Integer read FFlag write FFlag;

  end;


var EnterValueF:TEnterValueF;

function EnterIntValue(var V:Integer; Cap:String=''):Boolean;
function EnterInt64Value(var V:Int64; Cap:String=''):Boolean;
function EnterCurrValue(var V:Currency; Cap:String=''):Boolean;
function EnterStrValue(var V:String; Cap:String=''; Def:String=''):Boolean;

implementation

{$R *.dfm}

uses MainU;

function EnterIntValue(var V:Integer; Cap:String=''):Boolean;
 begin
  try
   EnterValueF:=TEnterValueF.Create(nil);
   try
    EnterValueF.TypeValue:=INT_VALUE;
    EnterValueF.lbCaption.Caption:=Cap;
    Application.ProcessMessages;
    EnterValueF.ShowModal;
    if EnterValueF.Flag<>1 then Abort;
    V:=StrToInt(EnterValueF.edValue.Text);

   finally
    EnterValueF.Free;
   end;
   Result:=True;
  except
   Result:=False;
  end;
 end;

function EnterInt64Value(var V:Int64; Cap:String=''):Boolean;
 begin
  try
   EnterValueF:=TEnterValueF.Create(nil);
   try

    EnterValueF.TypeValue:=INT_VALUE;
    EnterValueF.lbCaption.Caption:=Cap;
    Application.ProcessMessages;
    EnterValueF.ShowModal;
    if EnterValueF.Flag<>1 then Abort;
    V:=StrToInt64(EnterValueF.edValue.Text);

   finally
    EnterValueF.Free;
   end;
   Result:=True;
  except
   Result:=False;
  end;
 end;

function EnterCurrValue(var V:Currency; Cap:String=''):Boolean;
 begin
  try
   EnterValueF:=TEnterValueF.Create(nil);
   try
    EnterValueF.TypeValue:=CUR_VALUE;
    EnterValueF.lbCaption.Caption:=Cap;
    Application.ProcessMessages;
    EnterValueF.ShowModal;
    if EnterValueF.Flag<>1 then Abort;

    V:=StrToCurr(CorrectFloatNumXP(EnterValueF.edValue.Text));

   finally
    EnterValueF.Free;
   end;
   Result:=True;
  except
   Result:=False;
  end;
 end;

function EnterStrValue(var V:String; Cap:String=''; Def:String=''):Boolean;
 begin
  try
   EnterValueF:=TEnterValueF.Create(nil);
   try

    EnterValueF.TypeValue:=STR_VALUE;
    EnterValueF.lbCaption.Caption:=Cap;
    EnterValueF.edValue.Text:=Def;
    Application.ProcessMessages;
    EnterValueF.ShowModal;
    if EnterValueF.Flag<>1 then Abort;
    V:=EnterValueF.edValue.Text;

   finally
    EnterValueF.Free;
   end;
   Result:=True;
  except
   Result:=False;
  end;
 end;

procedure TEnterValueF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TEnterValueF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  TypeValue:=STR_VALUE;
  FFlag:=0;
  Case TypeValue of
   CUR_VALUE,INT_VALUE:edValue.Text:='0' else edValue.Text:='';
  end
 end;

procedure TEnterValueF.edValueKeyPress(Sender: TObject; var Key: Char);
 begin
  Case TypeValue of
   INT_VALUE:begin
              if Key<>#8 then
               if Not (Key in CH_DIGIT) then Key:=#0;
             end;
   CUR_VALUE:begin
              if Key<>#8 then
               begin
                if Key=',' then Key:='.';
                if Not (Key in CH_DIGIT+['.']) then Key:=#0;
               end;
             end;
  end;
 end;

procedure TEnterValueF.FormActivate(Sender: TObject);
 begin
  edValue.SelectAll;
 end;

procedure TEnterValueF.BitBtn1Click(Sender: TObject);
 begin
  Flag:=1;
  Close;
 end;

end.


