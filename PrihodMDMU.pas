unit PrihodMDMU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TPrihodMDMF = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    edNakl: TEdit;
    Label3: TLabel;
    dtNakl: TDateTimePicker;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    Edit3: TEdit;
    Label7: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    Edit5: TEdit;
    Label9: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private

  public

  end;

var PrihodMDMF:TPrihodMDMF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TPrihodMDMF.FormCreate(Sender:TObject);
 begin
  Caption:=MFC;
  dtNakl.Date:=Date;
 end;

procedure TPrihodMDMF.BitBtn1Click(Sender:TObject);
var sR,sR1:TStringStream;
    s:String;
 begin
  try
   MainF.HTTPRR.URL:='https://exim.mdmworld.com/CardService.asmx';
   MainF.HTTPRR.SoapAction:='http://tempuri.org/commitOrder';
   s:='<?xml version="1.0" encoding="utf-8"?>  '+#10+
      '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> '+#10+
      '  <soap:Body>                                                           '+#10+
      '    <commitOrder xmlns="http://tempuri.org/">                           '+#10+
      '      <aOrderRequest>                                                   '+#10+
      '        <OrderId>'+Edit1.Text+'</OrderId>                               '+#10+
      '        <OrderCode>'+edNakl.Text+'</OrderCode>                          '+#10+
      '        <OrderDate>'+FormatDateTime('yyyy-mm-dd',dtNakl.Date)+'T'+FormatDateTime('hh:nn:ss',dtNakl.Date)+'</OrderDate>    '+#10+
      '        <OrderType>'+IntToStr(ComboBox1.ItemIndex+1)+'</OrderType>      '+#10+
      '        <OrganizationFromCode>'+Edit2.Text+'</OrganizationFromCode>     '+#10+
      '        <OrganizationFromName>'+Edit3.Text+'</OrganizationFromName>     '+#10+
      '        <OrganizationToCode>'+Edit4.Text+'</OrganizationToCode>         '+#10+
      '        <OrganizationToName>'+Edit5.Text+'</OrganizationToName>         '+#10+
      '        <Items>                                                         '+#10+
      '          <OrderRequestItem>                                            '+#10+
      '            <ProductFormCode>'+Edit6.Text+'</ProductFormCode>           '+#10+
      '            <SaleType>0</SaleType>                                      '+#10+
      '            <Amount>'+Edit7.Text+'</Amount>                             '+#10+
      '          </OrderRequestItem>                                           '+#10+
      '        </Items>                                                        '+#10+
      '      </aOrderRequest>                                                  '+#10+
      '      <aLoginName>'+MainF.GetLoginMDMU+'</aLoginName>                   '+#10+
      '      <aLoginPassword>pass</aLoginPassword>                             '+#10+
      '    </commitOrder>                                                      '+#10+
      '  </soap:Body>                                                          '+#10+
      '</soap:Envelope>                                                        ';

   sR:=TStringStream.Create(AnsiToUTF8(s));
   sR1:=TStringStream.Create('');
   try

    DM.Qr6.SQL.Text:=sR.DataString;  DM.Qr6.SQL.SaveToFile('C:\Log\Sr12_.txt');
    MainF.HTTPRR.Execute(sR,sR1);
    Memo1.Lines.Text:=sR1.DataString;
    DM.Qr6.SQL.Text:=sR1.DataString; DM.Qr6.SQL.SaveToFile('C:\Log\Sr12_1.txt');
   finally
    sR.Free;
    sR1.Free;
   end;
  except
   on E:Exception do MainF.MessBox(E.Message,48);
  end;
 end;

end.
