unit ChangeMDMCardU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, Util;

type
  TChangeMDMCardF = class(TForm)
    Label1: TLabel;
    edOld: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edNew: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangeMDMCardF: TChangeMDMCardF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TChangeMDMCardF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
 end;

procedure TChangeMDMCardF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TChangeMDMCardF.BitBtn1Click(Sender: TObject);
var S,ss:String;
    sR,sR1:TStringStream;
    
 begin
  if edOld.Text='' then
   begin
    MainF.MessBox('Введите номер старой карты');
    edOld.SetFocus;
   end else
  if edNew.Text='' then
   begin
    MainF.MessBox('Введите номер новой карты');
    edOld.SetFocus;
   end else try

             MainF.HTTPRR.URL:='https://exim.mdmworld.com/CardService.asmx';
             MainF.HTTPRR.SoapAction:='http://tempuri.org/commitCardChange';

{             s:=' <?xml version="1.0" encoding="utf-8"?> '+#10+
                ' <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> '+#10+
                '  <soap:Body> '+#10+
                '    <commitCardChange xmlns="http://tempuri.org/"> '+#10+
                '      <aMdmCodeOld>'+edOld.Text+'</aMdmCodeOld> '+#10+
                '      <aMdmCodeNew>'+edNew.Text+'</aMdmCodeNew> '+#10+
                '      <aLoginName>'+MainF.GetLoginMDMU+'</aLoginName> '+#10+
                '      <aLoginPassword>pass</aLoginPassword> '+#10+
                '    </commitCardChange> '+#10+
                '  </soap:Body> '+#10+
                ' </soap:Envelope> ';}

{             s:=' <?xml version="1.0" encoding="utf-8"?> '+#10+
                ' <soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope"> '+#10+
                '   <soap12:Body> '+#10+
                '     <commitCardChange xmlns="http://tempuri.org/"> '+#10+
                '       <aMdmCodeOld>'+edOld.Text+'</aMdmCodeOld> '+#10+
                '       <aMdmCodeNew>'+edNew.Text+'</aMdmCodeNew> '+#10+
                '       <aLoginName>'+MainF.GetLoginMDMU+'</aLoginName> '+#10+
                '       <aLoginPassword>pass</aLoginPassword> '+#10+
                '     </commitCardChange> '+#10+
                '   </soap12:Body> '+#10+
                ' </soap12:Envelope> ';
}
             s:=' <?xml version="1.0" encoding="utf-8"?> '+#10+
                ' <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:tem="http://tempuri.org" > '+#10+
                '  <soap:Header/> '+#10+
                '  <soap:Body> '+#10+
                '    <tem:commitCardChange> '+#10+
                '      <tem:aMdmCodeOld>'+edOld.Text+'</tem:aMdmCodeOld> '+#10+
                '      <tem:aMdmCodeNew>'+edNew.Text+'</tem:aMdmCodeNew> '+#10+
                '      <tem:aLoginName>'+MainF.GetLoginMDMU+'</tem:aLoginName> '+#10+
                '      <tem:aLoginPassword>pass</tem:aLoginPassword> '+#10+
                '    </tem:commitCardChange> '+#10+
                '  </soap:Body> '+#10+
                ' </soap:Envelope> ';

             sR:=TStringStream.Create(s);
             DM.Qr6.Close;
             DM.Qr6.SQL.Text:=AnsiToUtf8(sR.DataString); DM.Qr6.SQL.SaveToFile('C:\Log\Sr.txt');

             sR1:=TStringStream.Create('');
             try
              MainF.HTTPRR.Execute(sR,sR1);
              DM.Qr6.SQL.Text:=Utf8ToAnsi(sR1.DataString); DM.Qr6.SQL.SaveToFile('C:\Log\Sr1.txt');
              ss:=Utf8ToAnsi(GetValueFromXML('commitCardChangeResult',sR1.DataString));

              if AnsiUpperCase(ss)='OK' then MainF.MessBox('Замена карты прошла успешно!',64)
                                        else raise EAbort.Create(ss);
             finally
              sR1.Free;
              sR.Free;
             end;
            except
             on E:Exception do MainF.RegisterError('Замена карточки "Ради жизни" ',E.Message,False);
            end;
 end;

end.
