Unit EKKAU;

Interface

Uses Windows, Dialogs, Classes, SysUtils, Marry301, Forms;

Const TE_MARRY301=1; // Тип Екка Мария301 MTM
      TE_MINI500=2;  // Тип Екка Mini500

Type

     TRDItems=Array of String;

     TEKKA=class(TComponent)

     private
       FM301:TMarry301;
       FTypeEKKA:Integer;
       FUseEKKA:Boolean;
       FRDItem:TRDItems;
       FLastErrorCode:Integer;
       FReceiptNumber:String;
       FKeyPosition:Integer;

     public
       constructor Create(AOwner:TComponent); override;
       constructor CreateEKKA(AOwner:TComponent; P:Integer); virtual;
       destructor Destroy; override;

       function fpInit:Boolean; // установка связи с ЕККА
       function fpGetStatus:Boolean; // запрос внутреннего состояния
       function fpOpenFiscalReceipt:Boolean; // открытие нового фискального
       function RDItem(N:Integer):String; // считать элемент массива RDItem;

       function MessBox(S:String; B:Integer):Integer;

       property TypeEKKA:Integer read FTypeEKKA;
       property UseEKKA:Boolean read FUseEKKA write FUseEKKA;
       property LastErrorCode:Integer read FLastErrorCode;
       property ReceiptNumber:String read FReceiptNumber;
       property KeyPosition:Integer read FKeyPosition;
       
     end;

Implementation

constructor TEKKA.Create(AOwner:TComponent);
 begin
  inherited Create(AOwner);
  SetLength(FRDItem,0);
  FTypeEKKA:=TE_MARRY301;
  FUseEKKA:=True;
  FLastErrorCode:=0;
  FReceiptNumber:='';
  FKeyPosition:=-1;
  FM301:=TMarry301.Create(AOwner);
 end;

constructor TEKKA.CreateEKKA(AOwner:TComponent; P:Integer);
 begin
  inherited Create(AOwner);
  FTypeEKKA:=P;
  FUseEKKA:=True;
  Case P of
   TE_MARRY301:FM301:=TMarry301.Create(AOwner);
   else raise EAbort.Create('Несуществующий тип ЕККА!');
  end;
 end;

destructor TEKKA.Destroy;
 begin
  inherited Destroy;
 end;

function TEKKA.fpInit:Boolean;
 begin
  try
   if Not UseEKKA then begin Result:=True; Exit; end;
   Result:=True;
  except
   Result:=False;
  end;
 end;

function TEKKA.fpGetStatus:Boolean;
 begin
  try
   if Not UseEKKA then begin Result:=True; Exit; end;
   SetLength(FRDItem,0);
   Case TypeEKKA of
    TE_MARRY301:begin


                 SetLength(FRDItem,19);
                 FReceiptNumber:=FRDItem[11];
                 try
                  FKeyPosition:=StrToInt(FRDItem[5]);
                 except
                  FKeyPosition:=-1;
                 end;
                end;
   end;
   Result:=True;
  except
   Result:=False;
  end;
 end;

function TEKKA.RDItem(N:Integer):String;
 begin
  try
   Result:=FRDItem[N];
  except
   Result:='';
  end;
 end;

function TEKKA.MessBox(S:String; B:Integer):Integer;
 begin
  Result:=Application.MessageBox(PChar(S),'ЕККА',B);
 end;

function TEKKA.fpOpenFiscalReceipt:Boolean;
 begin
  try
   Result:=True;
  except
   Result:=False;
  end;
 end;

End.
