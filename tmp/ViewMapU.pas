unit ViewMapU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls, Buttons, OleCtrls, SHDocVw, Util, cefvcl;

type

  TViewMapF = class(TForm)

    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    Chromium1: TChromium;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private

  public

   X,Y:Real;

  end;

var ViewMapF:TViewMapF;

implementation

uses MainU, TovInfoU;

{$R *.dfm}

procedure TViewMapF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TViewMapF.FormActivate(Sender: TObject);
var Url:String;
    SL:TStringList;
 begin

//  Url:='https://static-maps.yandex.ru/1.x/?l=map&pt='+CurrToStr(X)+','+CurrToStr(Y);

//  Url:='https://static-maps.yandex.ru/1.x/?l=map&pt=37.6,55.6~37.601,55.6,78~37.602,55.6,pmgrs~37.603,55.6,pm2rdm~37.604,55.6,pmntl100~37.605,55.6,pmors23~37.606,55.6,flag~37.607,55.6,pm2ywl99';

//  Url:='<html><head></head><body><script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=HxJjosRgZ6x3yL_bmLl1d7rK4z1cUg4m&width=600&height=450"></script></body></html>';
{   Url:='https://static-maps.yandex.ru/1.x/?l=map&pt='+CurrToStr(X)+','+CurrToStr(Y);
   SL:=TStringList.Create;
   SL.Text:=Url;
   SL.SaveToFile('C:\map.txt');

   Chromium1.DefaultUrl:=Url;

https://static-maps.yandex.ru/1.x/?ll=36.241440,49.998870&size=600,450&z=16&l=map&pt=36.241440,49.99887,pm2rdm
   }
//  Url:='https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=geBz68PxGJLUp_AZtdJwo11-rMR71VTl&width=600&height=450"></script>';
//  WB_LoadHTML(WebBrowser1,Url);

//  WebBrowser1.Navigate(Url);

   Chromium1.Load('https://static-maps.yandex.ru/1.x/?ll='+CurrToStr(Y)+','+CurrToStr(X)+'&size=600,450&z=16&l=map&pt='+CurrToStr(Y)+','+CurrToStr(X)+',pm2rdm');

 end;

procedure TViewMapF.BitBtn2Click(Sender:TObject);
 begin
  TovInfoF.IsMap:=True;
  Close;
 end;

end.
