unit PlayerU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, MPlayer, ComCtrls, StdCtrls, ExtCtrls, Util, Volume;

type
  TPlayerF = class(TForm)
    GroupBox1: TGroupBox;
    tbVolume: TTrackBar;
    GroupBox2: TGroupBox;
    mpMain: TMediaPlayer;
    gbEkran: TGroupBox;
    pnEkran: TPanel;
    procedure tbVolumeChange(Sender: TObject);

  private

  public

  end;

var PlayerF:TPlayerF;

implementation

{$R *.dfm}

procedure TPlayerF.tbVolumeChange(Sender: TObject);
 begin
  SetMasterVolumeToValue(tbVolume.Position);
 end;

end.
