unit PlayRolikU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ComCtrls, StdCtrls, Buttons, Util, Volume, MPlayer;

type
  TPlayRolikF = class(TForm)
    GroupBox1: TGroupBox;
    tbVolume: TTrackBar;
    GroupBox2: TGroupBox;
    mpMain: TMediaPlayer;
    procedure FormCreate(Sender: TObject);
    procedure tbVolumeChange(Sender: TObject);
    procedure mpMainClick(Sender: TObject; Button: TMPBtnType;  var DoDefault: Boolean);

  private

    FPathAVA:String;
    FPathRolik:String;
    FFNameR:String;

  public

    property PathAVA:String read FPathAVA write FPathAVA;
    property PathRolik:String read FPathRolik write FPathRolik;
    property FNameR:String read FFNameR write FFNameR;

  end;

var PlayRolikF: TPlayRolikF;

implementation

uses MainU;

{$R *.dfm}

procedure TPlayRolikF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TPlayRolikF.tbVolumeChange(Sender: TObject);
 begin
//  SetWaveVolume(tbVolume.Position);
  SetMasterVolumeToValue(tbVolume.Position);
 end;

procedure TPlayRolikF.mpMainClick(Sender:TObject; Button:TMPBtnType;  var DoDefault: Boolean);
 begin
  if Button=btStop then
   begin
    mpMain.Position:=0;
    mpMain.EnabledButtons:=[btPlay];
   end else
  if Button=btPause then
   mpMain.EnabledButtons:=[btPlay,btStop,btPause] else
  if Button=btPlay then
   mpMain.EnabledButtons:=[btStop,btPause];
 end;

end.
