unit Digits;

interface

uses Windows,Dialogs,SysUtils,Graphics,ExtCtrls,Util,Types;

type TDigitBin=Array[1..7] of Byte;

const Segm1:Array[1..4,1..13] of Integer=( // (4,0)
                                          (5,9,9,9,9,9,9,9,9,9,9,9,9),
                                          (0,8,9,9,9,9,9,9,9,9,9,6,0),
                                          (0,0,8,9,9,9,9,9,9,9,6,0,0),
                                          (0,0,0,8,9,9,9,9,9,6,0,0,0)
                                         );

const Segm2:Array[1..12,1..4] of Integer=( // (2,1)
                                          (0,8,0,0),
                                          (5,9,7,0),
                                          (5,9,9,5),
                                          (7,9,9,9),
                                          (7,9,9,9),
                                          (8,9,9,9),
                                          (9,9,9,9),
                                          (9,9,9,9),
                                          (9,9,9,8),
                                          (9,9,9,8),
                                          (9,9,9,0),
                                          (8,8,0,0)
                                         );

const Segm3:Array[1..12,1..5] of Integer=( // (15,1)
                                          (0,0,5,8,0),
                                          (0,0,8,9,7),
                                          (0,8,9,9,7),
                                          (5,9,9,9,4),
                                          (5,9,9,9,4),
                                          (7,9,9,9,0),
                                          (7,9,9,9,0),
                                          (8,9,9,9,0),
                                          (9,9,9,9,0),
                                          (9,9,9,8,0),
                                          (9,9,9,7,0),
                                          (0,9,9,5,0)
                                         );

const Segm4:Array[1..4,1..12] of Integer=( // (4,12)
                                          (3,8,9,9,9,9,9,9,9,9,8,0),
                                          (9,9,9,9,9,9,9,9,9,9,9,8),
                                          (9,9,9,9,9,9,9,9,9,9,9,8),
                                          (3,9,9,9,9,9,9,9,9,9,8,0)
                                         );

const Segm5:Array[1..13,1..5] of Integer=( // (0,15)
                                          (0,7,9,8,0),
                                          (0,8,9,9,8),
                                          (0,9,9,9,9),
                                          (0,9,9,9,9),
                                          (0,9,9,9,8),
                                          (0,9,9,9,8),
                                          (3,9,9,9,7),
                                          (4,9,9,9,4),
                                          (4,9,9,9,4),
                                          (7,9,9,9,3),
                                          (8,9,9,8,0),
                                          (8,9,8,0,0),
                                          (1,8,1,0,0)
                                         );

const Segm6:Array[1..13,1..5] of Integer=( // (14,15)
                                          (0,0,9,9,3),
                                          (0,9,9,9,9),
                                          (4,9,9,9,4),
                                          (6,9,9,9,3),
                                          (7,9,9,9,0),
                                          (8,9,9,9,0),
                                          (9,9,9,9,0),
                                          (9,9,9,9,0),
                                          (9,9,9,7,0),
                                          (9,9,9,7,0),
                                          (9,9,9,6,0),
                                          (0,9,9,3,0),
                                          (0,0,6,0,0)
                                         );

const Segm7:Array[1..4,1..14] of Integer=( // (2,25)
                                          (0,0,0,6,9,9,9,9,9,9,9,0,0,0),
                                          (0,0,6,9,9,9,9,9,9,9,9,9,0,0),
                                          (0,6,9,9,9,9,9,9,9,9,9,9,9,0),
                                          (7,9,9,9,9,9,9,9,9,9,9,9,9,6)
                                         );

const Segm8:Array[1..4,1..5] of Integer=( // (20,27)
                                         (4,9,9,9,5),
                                         (4,9,9,9,2),
                                         (6,9,9,9,0),
                                         (7,9,9,9,0)
                                         );


const dZero:TDigitBin  =(1,1,1,0,1,1,1);
      dOne:TDigitBin   =(0,0,1,0,0,1,0);
      dTwo:TDigitBin   =(1,0,1,1,1,0,1);
      dThree:TDigitBin =(1,0,1,1,0,1,1);
      dFour:TDigitBin  =(0,1,1,1,0,1,0);
      dFive:TDigitBin  =(1,1,0,1,0,1,1);
      dSix:TDigitBin   =(1,1,0,1,1,1,1);
      dSeven:TDigitBin =(1,0,1,0,0,1,0);
      dEight:TDigitBin =(1,1,1,1,1,1,1);
      dNine:TDigitBin  =(1,1,1,1,0,1,1);

// Рисует цифру
Procedure DrawDigit(Im:TImage; N:Byte; x,y:Integer; C,F:TColor);

// Отображает сумму на 8-значном индикаторе
Procedure ShowSumDigit(Im:TImage; Sum:Currency; x,y:Integer; C,F:TColor);

implementation

// Получаем цвет заданный процентом между цветами С и F
function GetPColor(C,F:TColor; P:Integer):TColor;
var pR,pB,pG,k:Real;
 begin
  k:=P/9;
  pR:=k*(GetR(C)-GetR(F));
  pG:=k*(GetG(C)-GetG(F));
  pB:=k*(GetB(C)-GetB(F));
  Result:=Round(pB)*65536+Round(pG)*256+Round(pR);
 end;

procedure DrawDigit(Im:TImage; N:Byte; x,y:Integer; C,F:TColor);
var i:Integer;

 function GetCol(P,Param:Integer):TColor;
  begin
   if Param=0 then Result:=GetPColor(C,F,1)
              else Result:=GetPColor(C,F,P);
  end;

 procedure DrawSegm(Num:Integer; Param:Integer);
 var i,j:Integer;
  begin
   Case Num of
    1:for j:=1 to 4 do
       for i:=1 to 13 do
        if Segm1[j,i]<>0 then
         Im.Canvas.Pixels[x+i+3,y+j-1]:=GetCol(Segm1[j,i],Param);
    2:for j:=1 to 12 do
       for i:=1 to 4 do
        if Segm2[j,i]<>0 then
         Im.Canvas.Pixels[x+i+1,y+j]:=GetCol(Segm2[j,i],Param);
    3:for j:=1 to 12 do
       for i:=1 to 5 do
        if Segm3[j,i]<>0 then
         Im.Canvas.Pixels[x+i+14,y+j]:=GetCol(Segm3[j,i],Param);
    4:for j:=1 to 4 do
       for i:=1 to 12 do
        if Segm4[j,i]<>0 then
         Im.Canvas.Pixels[x+i+3,y+j+11]:=GetCol(Segm4[j,i],Param);
    5:for j:=1 to 13 do
       for i:=1 to 5 do
        if Segm5[j,i]<>0 then
         Im.Canvas.Pixels[x+i-1,y+j+14]:=GetCol(Segm5[j,i],Param);
    6:for j:=1 to 13 do
       for i:=1 to 5 do
        if Segm6[j,i]<>0 then
         Im.Canvas.Pixels[x+i+13,y+j+14]:=GetCol(Segm6[j,i],Param);
    7:for j:=1 to 4 do
       for i:=1 to 14 do
        if Segm7[j,i]<>0 then
         Im.Canvas.Pixels[x+i+1,y+j+24]:=GetCol(Segm7[j,i],Param);
   end;
  end;

 Begin
  Im.Canvas.Pen.Color:=F;
  Im.Canvas.Brush.Color:=F;
  Im.Canvas.Rectangle(x,y,x+20,y+29);
  for i:=1 to 7 do
   Case N of
    0:DrawSegm(i,dZero[i]);
    1:DrawSegm(i,dOne[i]);
    2:DrawSegm(i,dTwo[i]);
    3:DrawSegm(i,dThree[i]);
    4:DrawSegm(i,dFour[i]);
    5:DrawSegm(i,dFive[i]);
    6:DrawSegm(i,dSix[i]);
    7:DrawSegm(i,dSeven[i]);
    8:DrawSegm(i,dEight[i]);
    9:DrawSegm(i,dNine[i]) else DrawSegm(i,0);
   end;
 End;

Procedure ShowSumDigit(Im:TImage; Sum:Currency; x,y:Integer; C,F:TColor);
var q,i,j,dx:Integer;
    sInd,ss:String;
 begin
  Im.Canvas.Brush.Color:=F;
  Im.Canvas.FillRect(Rect(0,0,Im.Width,Im.Height));
  dx:=x;
  sInd:='AAAAAAAA';
  ss:=CurrToStrF(Sum,ffFixed,2);
  q:=8;
  for i:=Length(ss) downto 1 do
   begin
    if ss[i] in ['0'..'9'] then begin sInd[q]:=ss[i]; Dec(q); end;
    if q=0 then Break;
   end;

  for i:=1 to 8 do
   begin
    DrawDigit(Im,StrToInt('$'+sInd[i]),dx,y,C,F);
    if i=6 then dx:=dx+29 else dx:=dx+24;
   end;

  for j:=1 to 4 do
   for i:=1 to 5 do
    if Segm8[j,i]<>0 then
     Im.Canvas.Pixels[x+141+i,y+26+j]:=GetPColor(C,F,Segm8[j,i]);

 end;

end.
