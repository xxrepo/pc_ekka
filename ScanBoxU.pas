unit ScanBoxU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs , inifiles, DB, ADODB, ExtCtrls, StdCtrls;

type
  TScanBoxF = class(TForm)
    Timer1: TTimer;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
//    procedure read_box();
//    procedure FindFiles(Drive:String);
//    procedure Loadtxt();
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;  Shift: TShiftState);

  private
    { Private declarations }
    full_path : string;
    is_flash  : integer;
    NUmAct,bage_carmen : string;
    fl_13 : boolean;

  public

    procedure Check_box_out;

  end;

var ScanBoxF:TScanBoxF;

implementation

uses DataModuleU, MainU;

{$R *.dfm}

procedure TScanBoxF.FormCreate(Sender: TObject);
 begin
  full_path:=extractfiledir(Application.ExeName);
// Проверяем данные
{  DM.QrB.Close;
  DM.QrB.SQL.Clear;
  DM.QrB.SQL.Add('select count(*) as cnt from  SCAN_BOX');
//  DM.QrB.SQL.Add('where ((datepart(dd,getdate()) = substring(box, 9, 2) and datepart(mm,getdate()) =  substring(box, 11, 2)) or    ');
//  DM.QrB.SQL.Add('       (datepart(dd,getdate()-1) = substring(box, 9, 2) and datepart(mm,getdate()) =  substring(box, 11, 2)))    ');
  DM.QrB.SQL.Add('where convert(varchar,getdate(),23) = convert(varchar,dtload,23)   ');

  DM.QrB.SQL.Add('AND id_apteka in (select value from spr_const where descr = ''id_apteka'')');
  DM.QrB.Open;
  if DM.QrB.FieldByName('cnt').AsInteger > 0 then
   begin
    Label3.Caption := DM.QrB.FieldByName('cnt').AsString;
    Check_box_out;
    Label5.Caption := 'Данные прочитаны';
   end else begin
             Label5.Caption := 'Читаем флэшку';
             Timer1.Enabled := True;
            end;   }
  NumAct:='';
  Label5.Caption:='';
 end;

procedure TScanBoxF.Timer1Timer(Sender: TObject);
 begin
//  Read_Box;
 end;

{procedure TScanBoxF.Read_Box();
var C:Char;
    RootPath:PChar;
 begin
  Timer1.Enabled := False;
  is_flash :=0;
  // Находим съемный диск
  GetMem(RootPath,16);
  for C:='A' to 'Z' do
   begin
    StrPLCopy(RootPath,C+':\',16);
    case GetDriveType(RootPath) of
     0:;//ListBox1.Items.Add(C+':\ (неизвестный)');
     DRIVE_REMOVABLE:
                    begin
                    If (C<>'A') then
                     begin
                       is_flash := 1;
                       //copy_flash(C);
                       //ShowMessage(C);
                       try
                        FindFiles(C+':\');
                       except
                       end;
                      end;
                   end;
     DRIVE_FIXED:;//ListBox1.Items.Add(C+':\ (жесткий)');
     DRIVE_REMOTE:;//ListBox1.Items.Add(C+':\ (сетевой)');
     DRIVE_CDROM:;//ListBox1.Items.Add(C+':\ (компакт диск)');
     DRIVE_RAMDISK:;//ListBox1.Items.Add(C+':\ (RAM диск)');
    end;
   end;
  FreeMem(RootPath,16);
  If is_flash = 0 then
   begin
    ShowMessage('Вставьте флэшку, так как информация о ящиках не считана!');
    Timer1.Enabled:=true;
    exit;
   end
    else
     begin
      Loadtxt();
     end;
   if is_flash = 2 Then
    begin
     Label5.Caption := 'Данные прочитаны';
     ShowMessage('Данные о ящиках загружены!');
     Timer1.Enabled := False;
     Edit1.SetFocus;
     DM.QrB.Close;
     DM.QrB.SQL.Clear;
     DM.QrB.SQL.Add('select count(*) as cnt from  SCAN_BOX');
//     DM.QrB.SQL.Add('where datepart(dd,getdate()) = substring(box, 9, 2) and datepart(mm,getdate()) =  substring(box, 11, 2)    ');
//     DM.QrB.SQL.Add('where ((datepart(dd,getdate()) = substring(box, 9, 2) and datepart(mm,getdate()) =  substring(box, 11, 2)) or    ');
//     DM.QrB.SQL.Add('       (datepart(dd,getdate()-1) = substring(box, 9, 2) and datepart(mm,getdate()) =  substring(box, 11, 2)))    ');
     DM.QrB.SQL.Add('where convert(varchar,getdate(),23) = convert(varchar,dtload,23)   ');

     DM.QrB.SQL.Add('AND id_apteka in (select value from spr_const where descr = ''id_apteka'')');
     DM.QrB.Open;
     Label3.Caption:=DM.QrB.FieldByName('cnt').AsString;
     DM.QrB.Close;
     DM.QrB.SQL.Clear;
     DM.QrB.SQL.Add('select count(*) as cnt from  SCAN_BOX ');
//     DM.QrB.SQL.Add(' where datepart(dd,getdate()) = substring(box, 9, 2) and datepart(mm,getdate()) =  substring(box, 11, 2)');
//     DM.QrB.SQL.Add('where ((datepart(dd,getdate()) = substring(box, 9, 2) and datepart(mm,getdate()) =  substring(box, 11, 2)) or    ');
//     DM.QrB.SQL.Add('       (datepart(dd,getdate()-1) = substring(box, 9, 2) and datepart(mm,getdate()) =  substring(box, 11, 2)))    ');
     DM.QrB.SQL.Add('where convert(varchar,getdate(),23) = convert(varchar,dtload,23)   ');

     DM.QrB.SQL.Add(' and dt is not  null');
     DM.QrB.SQL.Add('AND id_apteka in (select value from spr_const where descr = ''id_apteka'')');
     DM.QrB.Open;
     Label4.Caption:=DM.QrB.FieldByName('cnt').AsString;
    end;
 end;
}

(*procedure TScanBoxF.FindFiles(Drive:String);
var DirInfo:TSearchRec;
 begin
{  FindFirst(Drive+'*',faAnyFile,DirInfo);
  Repeat
   if (DirInfo.Attr in [16,17,18,19,20,21,22,23,48,49,50,51,55,54,53,52]) and
      (DirInfo.Name<>'.') and (DirInfo.Name<>'..') then FindFiles(Drive+DirInfo.Name+'\') else
   if (AnsiLowerCase(ExtractFileExt(Drive+DirInfo.Name))='.txt') and (DirInfo.Name = 'boxes.txt') then
    begin
     // имя найденного файла     Drive+DirInfo.Name
     copyfile(PChar(Drive+DirInfo.Name),PChar(IncludeTrailingBackSlash(Opt.ServerLogPath)+DirInfo.Name),false);
     is_flash := 1;
    end;
  Until FindNext(DirInfo)<>0;
}
  copyfile(PChar(IncludeTrailingBackSlash(Drive)+'box\boxes.txt'),PChar(IncludeTrailingBackSlash(Opt.ServerLogPath)+'boxes.txt'),false);
 end;
 *)
{
procedure TScanBoxF.LoadTxt;
 begin
  try
    DM.QrB.Close;
    DM.QrB.SQL.Clear;
    DM.QrB.SQL.Add('truncate table SCAN_BOX_TMP');  ;
    DM.QrB.SQL.Add('BULK INSERT SCAN_BOX_TMP from '''+Opt.LogPath+'\boxes.txt'' with ( FIELDTERMINATOR = ''|'', ROWTERMINATOR = ''|\n'', CODEPAGE = 1251)');
    DM.QrB.ExecSQL;
   except
    ShowMessage('Плохой формат файла. Загрузка не произошла');
    exit;
   end;
//**********
  try
    DM.QrB.Close;
    DM.QrB.SQL.Clear;
    DM.QrB.SQL.Add('delete from scan_box_tmp where id_apteka not in (select value from spr_const where descr = ''id_apteka'')');

    DM.QrB.SQL.Add('insert into SCAN_BOX (id_apteka, box ,carmen,dtload)    ');
    DM.QrB.SQL.Add(' (    select id_apteka, box ,carmen,getdate() from SCAN_BOX_TMP a');
    DM.QrB.SQL.Add('     WHERE not exists 	( select  id_apteka, box ,carmen from SCAN_BOX b ');
    DM.QrB.SQL.Add('			where   a.id_apteka=b.id_apteka AND a.box = b.box AND a.carmen=b.carmen   ');
    DM.QrB.SQL.Add('		 	)');
    DM.QrB.SQL.Add('	)');
//    DM.QrB.SQL.SaveToFile('2box');
    DM.QrB.ExecSQL;
   except
    ShowMessage('Данные не загрузились в основную таблицу!!!');
    exit;
   end;
   is_flash := 2;
 end;
}
procedure TScanBoxF.Edit1KeyPress(Sender: TObject; var Key: Char);
var ttt:Set of char;
 begin

  if bage_carmen = '' then Edit1.Text:='';
  fl_13 := false;
  ttt := ['1','2','3','4','5','6','7','8','9','0'];

  if key  in ttt then
   begin

    bage_carmen:=bage_carmen + Key;
    if (Length(bage_carmen)>=13) then
     begin

      bage_carmen:=Copy(bage_carmen,1,12);

      Key := char(nil);
      fl_13 := true;
      Edit1.Text := '';

      DM.QrB.Close;
      DM.QrB.Sql.Clear;
      DM.QrB.Sql.Add('Select box  from scan_box where DatePart(yy,getdate())=DatePart(yy,dtload) and box = '''+copy(bage_carmen,1,12)+'''');
      DM.QrB.Sql.Add(' AND dt is not null ');
      DM.QrB.Open;

      if DM.QrB.RecordCount >0   then
       begin
        beep;
        MainF.MessBox('Этот ящик уже сканировался!!!');
        bage_carmen := '';
        Edit1.Text := '';
        exit;
       end;

      DM.QrB.Close;
      DM.QrB.Sql.Clear;
      DM.QrB.Sql.Add('Select box,NumAct from scan_box where DatePart(yy,getdate())=DatePart(yy,dtload) and box = '''+copy(bage_carmen,1,12)+'''');
      DM.QrB.Sql.Add(' AND dt is null');
      DM.QrB.OPen;
      if DM.QrB.RecordCount >0   then
       begin

        if NumAct='' then
         begin
          NumAct:=DM.QrB.FieldByName('NumAct').AsString;
          Label5.Caption:='Акт погрузки №: '+NumAct;
         end else
        if NumAct<>DM.QrB.FieldByName('NumAct').AsString then
         begin
          beep;
          MainF.MessBox('Этот ящик из другого акта погрузки!!!');
          bage_carmen := '';
          Edit1.Text := '';
          exit;
         end;

        DM.QrB.Close;
        DM.QrB.Sql.Clear;
        DM.QrB.Sql.Add('update scan_box  set id_user='+IntToStr(Prm.UserID)+', dt=getdate() ');
        DM.QrB.Sql.Add(' WHERE DatePart(yy,getdate())=DatePart(yy,dtload) and dt is null ');
        DM.QrB.Sql.Add(' AND NumAct='''+NumAct+''' and  BOX  = ''' +copy(bage_carmen,1,12)+'''');
        DM.QrB.Sql.Add(' select (select Count(*) from Scan_Box where DatePart(yy,getdate())=DatePart(yy,dtload) and NumAct='''+NumAct+''' and Dt is Null) as CntAll,(select Count(*) from Scan_Box where DatePart(yy,getdate())=DatePart(yy,dtload) and Dt is not Null and NumAct='''+NumAct+''') as CntS  ');
        DM.QrB.Open;
        Label3.Caption:=DM.QrB.FieldByName('CntAll').AsString;
        Label4.Caption:=DM.QrB.FieldByName('CntS').AsString;
        bage_carmen := '';
        Key := char(nil);
        Edit1.Text := '';
        Check_box_out();
       end else begin
                 MainF.MessBox('Стикер не правильный на ящике '+ bage_carmen);
                 bage_carmen := '';
                 Edit1.Text := '';
                end;
      end;
    end else key := char(nil);
 end;

procedure TScanBoxF.Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if fl_13 = true then
   begin
    Edit1.Text := '';
    fl_13 := false ;
    bage_carmen :='';
   end;
 end;

procedure TScanBoxF.Check_box_out;
 begin
{  DM.QrB.Close;
  DM.QrB.Sql.Clear;
  DM.QrB.Sql.Add('Select box from scan_box where');
  DM.QrB.Sql.Add(' dt >= '''+ FormatDateTime('yyyy-mm-dd', date)+''' ');
  DM.QrB.Sql.Add(' AND dt is not null');
  DM.QrB.Sql.Add(' ');
  DM.QrB.Sql.Add(' GROUP by BOX');
  DM.QrB.OPen;
//  Label5.Visible := True;
//  Label5.Caption := 'Ящиков ПОГРУЖЕННО        ';
  Label4.Visible := True;
  Label4.Caption := IntToStr(DM.QrB.RecordCount); }
 end;

end.
