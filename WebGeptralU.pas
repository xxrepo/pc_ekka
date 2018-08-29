unit WebGeptralU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw;

type
  TWebGeptralF = class(TForm)

    WebBrowser1: TWebBrowser;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure WebBrowser1NewWindow2(Sender: TObject; var ppDisp: IDispatch; var Cancel: WordBool);

  private

  public

    Url:String;

  end;

var WebGeptralF:TWebGeptralF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TWebGeptralF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
 end;

procedure TWebGeptralF.FormActivate(Sender:TObject);
 begin
  WindowState:=wsMaximized;
  WebBrowser1.Navigate(Url);
 end;

procedure TWebGeptralF.WebBrowser1NewWindow2(Sender: TObject; var ppDisp: IDispatch; var Cancel: WordBool);
 begin
  Cancel:=True;
 end;

end.
