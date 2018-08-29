unit DocumentsU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, Grids, DBGrids, StdCtrls, Buttons, Util, OpenOffice, ADODB, DB;

type
  TDocumentsF = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    DBGrid2: TDBGrid;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);

  private
    procedure FilterFolders;

  public

    procedure ShowFiles;

  end;

var DocumentsF:TDocumentsF;

implementation

uses MainU, DataModuleU, PlayerU;

{$R *.dfm}

procedure TDocumentsF.FilterFolders;
 begin
  DM.qrFolders.Close;
  if RadioButton1.Checked then
   DM.qrFolders.SQL.Text:='select * from Inform..Folders order by id '
  else
   DM.qrFolders.SQL.Text:='select * from Inform..Folders order by descr ';

  DM.qrFolders.Open;

  ShowFiles;
 end;

procedure TDocumentsF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  FilterFolders;
 end;

procedure TDocumentsF.ShowFiles;
 begin
  try
   DM.qrFiles.Close;
   if DM.qrFolders.IsEmpty then Exit;
   DM.qrFiles.SQL.Clear;
   DM.qrFiles.SQL.Add('select id,SubString(fname,11,Len(FName)) as Fname ');
   DM.qrFiles.SQL.Add('from Inform..JFiles where fname like ''FOLDER[_]'+IntToStrF(DM.qrFolders.FieldByName('ID').AsInteger,2)+'[_]%'' order by fname ');
//   DM.qrFiles.SQL.SaveToFile('C:\Files.txt');
   DM.qrFiles.Open;
  except
   on E:Exception do MainF.MessBox('Ошибка доступа к файлам: '+E.Message);
  end;
 end;

procedure TDocumentsF.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TDocumentsF.BitBtn2Click(Sender:TObject);
var Ooo:TOpenOffice;
    FName,ExtN:String;
    Blob:TMemoryStream;
    G:TGuid;
    FPath:String;
 begin

  if DM.qrFiles.IsEmpty then Exit;

  CreateGUID(G);
  FPath:=IncludeTrailingBackslash(Opt.LogPath)+'\TmpFiles\';
  ForceDirectories(FPath);
  DelDir(FPath+'\*');
  ExtN:=ExtractFileExt(DM.qrFiles.FieldByname('FName').AsString);
  FName:=FPath+GUIDToString(G)+ExtN;
//  ShowMessage(FName);
  DeleteFile(FName);
  try
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select FData from Inform..JFiles where id='+DM.qrFiles.FieldByName('id').AsString;
   DM.QrEx.Open;
   if DM.QrEx.IsEmpty then Exit;

   Blob:=TADOBlobStream.Create(TBlobField(DM.QrEx.FieldByName('FData')),bmRead);
   try
    Blob.SaveToFile(FName);
   finally
    Blob.Free;
   end;

   if (AnsiUpperCase(ExtN)='.WAV') or (AnsiUpperCase(ExtN)='.MP3') then
    begin
     PlayerF:=TPlayerF.Create(Self);
     try
      PlayerF.mpMain.FileName:=FName;
      PlayerF.mpMain.Open;
      PlayerF.ShowModal;
     finally
      PlayerF.Free;
     end;
    end else begin
              Ooo:=TOpenOffice.Create;
              if Not Ooo.Connect then Exit;
              Ooo.OpenDocument(FName);
             end;

  except
   on E:Exception do MainF.RegisterError('Ошибка открытия файла: ',E.Message,False);
  end;
 end;

procedure TDocumentsF.DBGrid2DblClick(Sender: TObject);
 begin
  BitBtn2Click(BitBtn2);
 end;

procedure TDocumentsF.DBGrid2KeyDown(Sender: TObject; var Key: Word; Shift:TShiftState);
 begin
  if Key=VK_RETURN then BitBtn2Click(BitBtn2);
 end;

procedure TDocumentsF.RadioButton1Click(Sender: TObject);
 begin
  FilterFolders;
 end;

procedure TDocumentsF.FormActivate(Sender: TObject);
 begin
  BitBtn3.Visible:=MainF.Design;
 end;

procedure TDocumentsF.BitBtn3Click(Sender: TObject);
var Blob:TMemoryStream;
    FPath,FName:String;

 begin
   if DM.qrFiles.IsEmpty then Exit;
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='select FData from Inform..JFiles where id='+DM.qrFiles.FieldByName('id').AsString;
   DM.QrEx.Open;
   if DM.QrEx.IsEmpty then Exit;
   FPath:='D:\ava\TmpFiles\';
   FName:=FPath+DM.qrFolders.FieldByName('Descr').AsString+' - '+DM.qrFiles.FieldByName('fname').AsString;
   ForceDirectories(FPath);

   DeleteFile(FName);
   Blob:=TADOBlobStream.Create(TBlobField(DM.QrEx.FieldByName('FData')),bmRead);
   try
    Blob.SaveToFile(FName);
   finally
    Blob.Free;
   end;

 end;

end.




