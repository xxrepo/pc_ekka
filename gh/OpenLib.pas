UNIT OpenLib;
INTERFACE

Uses Classes,OpenGL,Graphics,ExtCtrls;

Type Vector=Record
             x,y,z:GLfloat;
            end;

     TArrF4v=Array[0..3] of GLfloat;
     TArrF13v=Array[0..12] of GLfloat;

     TPoint=Record // Тип точка
             x,y,z:GLFloat;
            end;

     TGLColor=Record // Тип цвет OpenGL
               R,G,B:GLFloat;
              end;

// 1.Загрузка модели из STL-файла
Function LoadSTL(St:String; var M,N:TList):Boolean;

// 2.Создание дисплейного списка для рисования модели
Function MakeModelList(var NameL:GLInt; Path:String; Col:TArrF13v):Boolean;

// 3.Создание части дисплейного списка для рисования составной модели
Function MakePartList(Path:String; Col:TArrF13v):Boolean;

// 4.Перевод цвета в цвет OpenGl
Procedure ColorToGL (C:TColor; var R,G,B:GLFloat);

// 5.Установка параметров материала
Procedure SetMaterial(ar,ag,ab, dr,dg,db, sr,sg,sb, er,eg,eb, shine:GLfloat);

// 6.Рисует градиентный переход на BitMap-e
Procedure MakeGradientHeightB(Bm:TBitMap; Col1,Col2:TColor);

// 7.Рисует градиентный переход на Image-e
Procedure MakeGradientHeightI(Bm:TImage; Col1,Col2:TColor);

// 8.Рисование рамки для Image  
Procedure DrawRect(var Im:TImage; C,F:TColor);

// 9.Рисование рамки для Image
Procedure DrawSimpleRect(var Im:TImage; C:TColor);

IMPLEMENTATION

// Загрузка модели из STL-файла
Function LoadSTL(St:String; var M,N:TList):Boolean;
var f:TextFile;
    tx,ty,tz,nx,ny,nz:GLfloat;
    s:String;
    Code:Integer;

 procedure StrTo3v(S:String; var x,y,z:GLFloat);
 var i,q:Integer;
     v:Array[1..3] of String[20];
  begin
   v[1]:=''; v[2]:=''; v[3]:=''; q:=1;
   for i:=1 to Length(S) do
    if S[i]<>' ' then v[q]:=v[q]+S[i] else Inc(q);
   Val(v[1],x,Code);
   Val(v[2],y,Code);
   Val(v[3],z,Code);
  end;

 procedure AddToModelList(x,y,z:GLfloat);
 var wrkVector:Vector;
     pwrkVector:^Vector;
  begin
   wrkVector.x:=x;  wrkVector.y:=y; wrkVector.z:=z;
   New(pwrkVector); pwrkVector^:=wrkVector; M.Add(pwrkVector);
  end;

 procedure AddToNormalList(x,y,z:GLfloat);
 var wrkVector:Vector;
     pwrkVector:^Vector;
  begin
   wrkVector.x:=x;  wrkVector.y:=y; wrkVector.z:=z;
   New(pwrkVector); pwrkVector^:=wrkVector; N.Add(pwrkVector);
  end;

 Begin
  AssignFile(f,st);
  LoadSTL:=True;
  {$I-}
  ReSet(f);
  {$I+}
  if IOResult<>0 then begin LoadStl:=False; Exit; end;
  ReadLn(f,S);
  While not Eof(f) do
   begin
    ReadLn(f,s);
    if Copy(S,4,12)='facet normal' then
     begin
      StrTo3v(Copy(S,17,Length(S)-16),nx,ny,nz);
      AddToNormalList(nx,ny,nz);
      ReadLn(f,s);
      ReadLn(f,s); StrTo3v(Copy(S,17,Length(S)-16),tx,ty,tz); AddToModelList(tx,ty,tz);
      ReadLn(f,s); StrTo3v(Copy(S,17,Length(S)-16),tx,ty,tz); AddToModelList(tx,ty,tz);
      ReadLn(f,s); StrTo3v(Copy(S,17,Length(S)-16),tx,ty,tz); AddToModelList(tx,ty,tz);
     end else
    if Copy(S,1,12)='endsolid' then Break else ReadLn(f,s);
   end;
  CloseFile(f);
 end;

// Установка параметров материала
Procedure SetMaterial(ar,ag,ab, dr,dg,db, sr,sg,sb, er,eg,eb, shine:GLfloat);
var mat:Array[0..3] of GLfloat;
 begin
  glPushMatrix;

  mat[0]:=ar; mat[1]:=ag; mat[2]:=ab;
  glMaterialfv (GL_FRONT, GL_AMBIENT, @mat);

  mat[0]:=dr; mat[1]:=dg; mat[2]:=db;
  glMaterialfv (GL_FRONT, GL_DIFFUSE, @mat);

  mat[0]:=sr; mat[1]:=sg; mat[2]:=sb;
  glMaterialfv (GL_FRONT, GL_SPECULAR, @mat);

  mat[0]:=er; mat[1]:=eg; mat[2]:=eb;
  glMaterialfv (GL_FRONT, GL_EMISSION, @mat);

  glMaterialf (GL_FRONT, GL_SHININESS, shine);

  glPopMatrix;
 end;

// Создание дисплейного списка для рисования одной модели
Function MakeModelList(var NameL:GLInt; Path:String; Col:TArrF13v):Boolean;
var Model,Normals:TList;
    i:Integer;
 begin
  Model:=TList.Create;
  Normals:=TList.Create;
  MakeModelList:=True;
  if Not LoadSTL(Path,Model,Normals) then
   begin
    MakeModelList:=False;
    Model.Free;
    Normals.Free;
    Exit;
   end;
  NameL:=glGenLists(1);
  glNewList(NameL,GL_COMPILE);
  SetMaterial(Col[0],Col[1],Col[2],Col[3],Col[4],Col[5],Col[6],Col[7],Col[8],Col[9],Col[10],Col[11],Col[12]);
  for i:=0 to Round(Model.Count/3)-1 do
   begin
    glBegin(GL_TRIANGLES);
     glNormal3fv(Normals.Items[i]);
     glvertex3fv(Model.Items[i*3]);
     glvertex3fv(Model.Items[i*3+1]);
     glvertex3fv(Model.Items[i*3+2]);
    glEnd;
   end;
  glEndList;
  Model.Free;
  Normals.Free;
 end;

// Создание части дисплейного списка для рисования составной модели
Function MakePartList(Path:String; Col:TArrF13v):Boolean;
var i:Integer;
    Model,Normals:TList;
 begin
  Model:=TList.Create;
  Normals:=TList.Create;
  MakePartList:=True;
  if Not LoadSTL(Path,Model,Normals) then
   begin
    MakePartList:=False;
    Model.Free;
    Normals.Free;
    Exit;
   end;
  SetMaterial(Col[0],Col[1],Col[2],Col[3],Col[4],Col[5],Col[6],Col[7],Col[8],Col[9],Col[10],Col[11],Col[12]);
  for i:=0 to Round(Model.Count/3)-1 do
   begin
    glBegin(GL_TRIANGLES);
     glNormal3fv(Normals.Items[i]);
     glvertex3fv(Model.Items[i*3]);
     glvertex3fv(Model.Items[i*3+1]);
     glvertex3fv(Model.Items[i*3+2]);
    glEnd;
   end;
  Model.Free;
  Normals.Free;
 end;

// Перевод цвета в цвет OpenGl
Procedure ColorToGL(C:TColor; var R,G,B:GLFloat);
 begin
  R:=(c mod $100)/255;
  G:=((c div $100) mod $100)/255;
  B:=(c div $10000)/255;
 end;

// Рисует градиентный переход на BitMap-e
Procedure MakeGradientHeightB(Bm:TBitMap; Col1,Col2:TColor);
var i:Integer;
    StR,StG,StB,R1,G1,B1,R2,G2,B2:GLFLoat;
 begin
  ColorToGL(Col1,R1,G1,B1); ColorToGL(Col2,R2,G2,B2);
  StR:=(R2-R1)/Bm.Height;
  StG:=(G2-G1)/Bm.Height;
  StB:=(B2-B1)/Bm.Height;
  for i:=1 to Bm.Height do
   begin
    Bm.Canvas.Pen.Color:=Round((B1+StB*i)*255)*65536+Round((G1+StG*i)*255)*256+Round((R1+StR*i)*255);
    Bm.Canvas.MoveTo(0,i-1);
    Bm.Canvas.LineTo(Bm.Width,i-1);
   end;
 end;

// Рисует градиентный переход на Image-e
Procedure MakeGradientHeightI(Bm:TImage; Col1,Col2:TColor);
var i:Integer;
    StR,StG,StB,R1,G1,B1,R2,G2,B2:GLFLoat;
 begin
  ColorToGL(Col1,R1,G1,B1); ColorToGL(Col2,R2,G2,B2);
  StR:=(R2-R1)/Bm.Height;
  StG:=(G2-G1)/Bm.Height;
  StB:=(B2-B1)/Bm.Height;
  for i:=1 to Bm.Height do
   begin
    Bm.Canvas.Pen.Color:=Round((B1+StB*i)*255)*65536+Round((G1+StG*i)*255)*256+Round((R1+StR*i)*255);
    Bm.Canvas.MoveTo(0,i-1);
    Bm.Canvas.LineTo(Bm.Width,i-1);
   end;
 end;

// Рисование рамки для Image
Procedure DrawRect(var Im:TImage; C,F:TColor);
 begin
  With Im.Canvas do
   begin
    Brush.Color:=F;
    Rectangle(Rect(0,0,Im.Width-2,Im.Height-2));
    Pen.Color:=$00000000;
    MoveTo(Im.Width-2,2); LineTo(Im.Width-2,Im.Height);
    MoveTo(2,Im.Height-2); LineTo(Im.Width-1,Im.Height-2);
    MoveTo(Im.Width-1,2); LineTo(Im.Width-1,Im.Height);
    MoveTo(2,Im.Height-1); LineTo(Im.Width-1,Im.Height-1);
    Pixels[Im.Width-1,0]:=C; Pixels[0,Im.Height-1]:=C;
    Pixels[Im.Width-1,1]:=C; Pixels[1,Im.Height-1]:=C;
    Pixels[Im.Width-2,0]:=C; Pixels[0,Im.Height-2]:=C;
    Pixels[Im.Width-2,1]:=C; Pixels[1,Im.Height-2]:=C;
   end;
 end;

// Рисование рамки для Image
Procedure DrawSimpleRect(var Im:TImage; C:TColor);
 begin
  With Im.Canvas do
   begin
    Brush.Color:=$00000000;
    Pen.Color:=$00000000;
    FrameRect(Rect(0,0,Im.Width-2,Im.Height-2));
    MoveTo(Im.Width-2,2); LineTo(Im.Width-2,Im.Height);
    MoveTo(2,Im.Height-2); LineTo(Im.Width-1,Im.Height-2);
    MoveTo(Im.Width-1,2); LineTo(Im.Width-1,Im.Height);
    MoveTo(2,Im.Height-1); LineTo(Im.Width-1,Im.Height-1);
    Pixels[Im.Width-1,0]:=C; Pixels[0,Im.Height-1]:=C;
    Pixels[Im.Width-1,1]:=C; Pixels[1,Im.Height-1]:=C;
    Pixels[Im.Width-2,0]:=C; Pixels[0,Im.Height-2]:=C;
    Pixels[Im.Width-2,1]:=C; Pixels[1,Im.Height-2]:=C;
   end;
 end;


END.
