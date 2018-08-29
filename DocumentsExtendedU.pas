unit DocumentsExtendedU;

interface

uses
  Forms, ComCtrls, StdCtrls, Buttons, Classes, Controls, Grids, DBGrids, ADODB,
  DB, SysUtils, OpenOffice, Util;
//  , Windows, Messages, Variants, Graphics, Dialogs, 
type
  TDocumentsExtendedF=class(TForm)
    dgFiles:TDBGrid;
    bbOpenFile:TBitBtn;
    bbSaveFile:TBitBtn;
    bbClose:TBitBtn;
    tvFolders:TTreeView;
    procedure FormCreate(Sender:TObject);
    procedure FormActivate(Sender:TObject);
    procedure tvFoldersClick(Sender: TObject);
    procedure tvFoldersKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbCloseClick(Sender: TObject);
    procedure bbOpenFileClick(Sender: TObject);
    procedure bbSaveFileClick(Sender: TObject);
  private
    procedure Resize(Sender:TObject);
    procedure GetRootFolders;
    procedure GetFolders(const nodeId: integer = -1);
    procedure FoldersExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
    procedure ShowFiles(const folderId: integer = -1);
  end;

const
  MIN_WIDTH=640;
  MIN_HEIGHT=480;

  LEFT_INDENT=12;
  TOP_INDENT=12;
  SPACE_INDENT=12;
  CONNECTED_SPACE_INDENT=4;

  FOLDERS_RATIO=40;

var
  DocumentsExtendedF:TDocumentsExtendedF;

implementation

uses
  MainU, DataModuleU, PlayerU;

{$R *.dfm}

procedure TDocumentsExtendedF.FormCreate(Sender:TObject);
begin
  Caption:=MFC;
  if (Screen.Width<=MIN_WIDTH)or(Screen.Height<=MIN_HEIGHT) then
  begin
    Constraints.MinWidth:=trunc(Screen.Width*0.5);
    Constraints.MinHeight:=trunc(Screen.Height*0.5);
    Width:=trunc(Screen.Width*0.5);
    Height:=trunc(Screen.Height*0.5);
  end
  else
  begin
    Constraints.MinWidth:=MIN_WIDTH;
    Constraints.MinHeight:=MIN_HEIGHT;
    Width:=trunc(Screen.Width*0.75);
    Height:=trunc(Screen.Height*0.75);
  end;

  GetRootFolders;
end;

procedure TDocumentsExtendedF.FormActivate(Sender:TObject);
begin
  with DocumentsExtendedF do
  begin
    OnResize:=Resize;
    tvFolders.OnExpanding:=FoldersExpanding;

    Position:=poScreenCenter;
    bbSaveFile.Visible:=MainF.Design;
  end;
end;

procedure TDocumentsExtendedF.Resize(Sender:TObject);
begin
  tvFolders.Left:=LEFT_INDENT;
  tvFolders.Top:=TOP_INDENT;
  tvFolders.Width:=trunc(ClientWidth*FOLDERS_RATIO/100)-tvFolders.Left-trunc(SPACE_INDENT/2);
  tvFolders.Height:=ClientHeight-tvFolders.Top-TOP_INDENT;

  bbOpenFile.Left:=tvFolders.Left+tvFolders.Width+SPACE_INDENT;
  bbOpenFile.Top:=ClientHeight-bbOpenFile.Height-TOP_INDENT;
  bbSaveFile.Left:=bbOpenFile.Left+bbSaveFile.Width+SPACE_INDENT;
  bbSaveFile.Top:=bbOpenFile.Top;
  bbClose.Left:=ClientWidth-bbClose.Width-LEFT_INDENT;
  bbClose.Top:=bbSaveFile.Top;

  dgFiles.Left:=tvFolders.Left+tvFolders.Width+SPACE_INDENT;
  dgFiles.Top:=TOP_INDENT;
  dgFiles.Width:=ClientWidth-dgFiles.Left-LEFT_INDENT;
  dgFiles.Height:=bbOpenFile.Top-dgFiles.Top-SPACE_INDENT;
  dgFiles.Columns[0].Width:=dgFiles.Width-40;
end;

procedure TDocumentsExtendedF.GetRootFolders;
begin
  tvFolders.Items.Clear;
  with TADOQuery.Create(self) do
  begin
    try
      Connection:=DM.ADOCo;
      Close;
      SQL.Clear;
      SQL.Add('select ');
//      SQL.Add('  ID, DESCR, isnull(ParentNode,-1) as ParentNode ');
      SQL.Add('  id_folder, DESCR, isnull(ParentNode,-1) as ParentNode ');
      SQL.Add('from ');
      SQL.Add('  INFORM.dbo.FOLDERS ');
      SQL.Add('where ');
      SQL.Add('  isnull(ParentNode,-1) = -1');
      SQL.Add('order by ');
      SQL.Add('  DESCR');
      SQL.Add('');
      Open;
      First;
      while not Eof do
      begin
        tvFolders.Items.AddFirst(nil,FieldByName('DESCR').AsString);
        tvFolders.Items.AddChildFirst(tvFolders.Items.Item[0],'');
        Next;
      end;
    finally
      Free;
    end;
  end;
end;


procedure TDocumentsExtendedF.GetFolders(const nodeId: integer);
var
  node: TTreeNode;
  parentLevel: integer;
begin
  parentLevel:=tvFolders.Selected.Level;
  with TADOQuery.Create(self) do
  begin
    try
      Connection:=DM.ADOCo;
      Close;
      SQL.Clear;
      SQL.Add('select ');
      SQL.Add('  id_folder, DESCR, isnull(ParentNode,-1) as ParentNode ');
      SQL.Add('from ');
      SQL.Add('  INFORM.dbo.FOLDERS ');
      SQL.Add('where ');
      SQL.Add('  isnull(ParentNode,-1) = '+IntToStr(nodeId));
      SQL.Add('order by ');
      SQL.Add('  DESCR');
      SQL.Add('');
      Open;
      First;
      while not Eof do
      begin
        node:=tvFolders.Items.Item[tvFolders.Selected.AbsoluteIndex];
        tvFolders.Items.AddChildFirst(node,FieldByName('DESCR').AsString);
        node:=tvFolders.Items.Item[tvFolders.Selected.AbsoluteIndex];
        Application.ProcessMessages;
        Next;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TDocumentsExtendedF.FoldersExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
var
  i: integer;
  nodeId: integer;
begin
  if (Sender as TTreeView).Items.Item[Node.AbsoluteIndex].HasChildren then
    (Sender as TTreeView).Select(Node);
  if (Sender as TTreeView).Selected <> nil then
    if (Sender as TTreeView).Selected.HasChildren then
      for i:=0 to (Sender as TTreeView).Selected.Count-1 do
        (Sender as TTreeView).Selected.DeleteChildren;
  with TADOQuery.Create(self) do
  begin
    try
      Connection:=DM.ADOCo;
      SQL.Clear;
      SQL.Text:='select id_folder from INFORM.dbo.FOLDERS where DESCR like '''+Node.Text+'''';
      Open;
      if not IsEmpty then nodeId:=FieldByName('id_folder').AsInteger else nodeId:=-1;
    finally
      Free;
    end;
  end;
  ShowFiles(nodeId);
  GetFolders(nodeId);
end;

procedure TDocumentsExtendedF.ShowFiles(const folderId: integer = -1);
var Node:TTreeNode;
 begin
  try
    node:=tvFolders.Items.Item[tvFolders.Selected.AbsoluteIndex];
    DM.qrFiles.Close;
    DM.qrFiles.SQL.Clear;
    DM.qrFiles.SQL.Add('select');
//    DM.qrFiles.SQL.Add('  f.ID, case when f.fname like ''FOLDER_%'' then  SubString(f.fname, 15, Len(f.FName)) else f.fname end as Fname ');
    DM.qrFiles.SQL.Add('  f.ID, SubString(f.fname, 15, Len(f.FName)) Fname ');
    DM.qrFiles.SQL.Add('from');
    DM.qrFiles.SQL.Add('  INFORM.dbo.JFILES f');
    DM.qrFiles.SQL.Add('  left join INFORM.dbo.FOLDERS d (nolock) on d.id_folder=f.SubFolderID');
    DM.qrFiles.SQL.Add('where');
    DM.qrFiles.SQL.Add('  f.FName like ''FOLDER[_]'+IntToStrF(folderId,6)+'[_]%''');
//    DM.qrFiles.SQL.Add('  or d.DESCR like '''+node.Text+'''');
//    DM.qrFiles.SQL.Add('');
//    dm.qrFiles.sql.savetofile('1234');
    DM.qrFiles.Open;
  except
    on E:Exception do MainF.MessBox('Ошибка доступа к файлам: '+E.Message);
  end;
 end;

procedure TDocumentsExtendedF.tvFoldersClick(Sender: TObject);
var
  AllowExpansion: boolean;
begin
  FoldersExpanding(tvFolders, tvFolders.Selected, AllowExpansion);
end;

procedure TDocumentsExtendedF.tvFoldersKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  tvFoldersClick(tvFolders);
end;

procedure TDocumentsExtendedF.bbOpenFileClick(Sender: TObject);
var
  Ooo: TOpenOffice;
  FName, ExtN: String;
  Blob: TMemoryStream;
  G: TGuid;
  FPath: String;
  cr: TCursor;
begin
  cr:=Screen.Cursor;
  try
    Screen.Cursor:=crHourGlass;

    if DM.qrFiles.IsEmpty then Exit;

    CreateGUID(G);
    FPath:=IncludeTrailingBackslash(Opt.LogPath)+'\TmpFiles\';
    ForceDirectories(FPath);
    DelDir(FPath+'\*');
    ExtN:=ExtractFileExt(DM.qrFiles.FieldByname('FName').AsString);
    FName:=FPath+GUIDToString(G)+ExtN;
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
      end
      else
      begin
        Ooo:=TOpenOffice.Create;
        if Not Ooo.Connect then Exit;
        Ooo.OpenDocument(FName);
      end;
    except
      on E:Exception do MainF.RegisterError('Ошибка открытия файла: ',E.Message,False);
    end;
  finally
    Screen.Cursor:=cr;
  end;
end;

procedure TDocumentsExtendedF.bbSaveFileClick(Sender: TObject);
var
  Blob: TMemoryStream;
  FPath, FName: String;
  node: TTreeNode;
  cr: TCursor;
begin
  cr:=Screen.Cursor;
  try
    Screen.Cursor:=crHourGlass;

    node:=tvFolders.Selected;
    if DM.qrFiles.IsEmpty then Exit;
    DM.QrEx.Close;
    DM.QrEx.SQL.Text:='select FData from Inform.dbo.JFiles where id='+DM.qrFiles.FieldByName('id').AsString;
    DM.QrEx.Open;
    if DM.QrEx.IsEmpty then Exit;
    FPath:='D:\ava\TmpFiles\';
    FName:=FPath+node.Text+' - '+DM.qrFiles.FieldByName('fname').AsString;
    ForceDirectories(FPath);

    DeleteFile(FName);
    Blob:=TADOBlobStream.Create(TBlobField(DM.QrEx.FieldByName('FData')),bmRead);
    try
      Blob.SaveToFile(FName);
    finally
      Blob.Free;
    end;
  finally
    Screen.Cursor:=cr;
  end;
end;

procedure TDocumentsExtendedF.bbCloseClick(Sender: TObject);
begin
  Close;
end;

end.
