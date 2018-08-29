unit ViewLessonsU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MPlayer, ExtCtrls, OleCtrls, WMPLib_TLB;

type
  TViewLessonsF = class(TForm)
    cbList: TComboBox;
    Label1: TLabel;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure cbListCloseUp(Sender: TObject);

  private

   Path:String;

  public

  end;

var ViewLessonsF:TViewLessonsF;
    mp:TWindowsMediaPlayer;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TViewLessonsF.FormCreate(Sender: TObject);
var i:Integer;
    FName:String;

 begin
  Caption:=MFC;
  cbList.Clear;
  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='select IsNull((select top 1 Value from Spr_Const where Descr=''PathLessons''),''\\server\ava\'') as Path';
  DM.QrEx.Open;
  Path:=DM.QrEx.FieldByName('Path').AsString;
//  Path:='D:\ava\uroki\';
  for i:=1 to 100 do
   begin
    FName:=Path+'Lesson'+IntToStr(i)+'.mp4';
    if FileExists(FName) then cbList.Items.Add('Óðîê ¹'+IntToStr(i));
   end;
  mp:=TWindowsMediaPlayer.Create(nil);
  with mp do
   begin
    Parent:=Panel1;
    Align:=alclient;
   end
 end;

procedure TViewLessonsF.cbListCloseUp(Sender: TObject);
var FName:String;
 begin
  FName:=Path+'Lesson'+Copy(cbList.Text,7,3)+'.mp4';
  if mp.playState=wmppsPlaying then mp.Controls.Stop;
  mp.URL:=FName;
  mp.controls.play;
 end;

end.
