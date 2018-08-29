object ScanMagF: TScanMagF
  Left = 572
  Top = 371
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ScanMagF'
  ClientHeight = 88
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShortCut = FormShortCut
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 20
    Width = 496
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1055#1088#1086#1074#1077#1076#1080#1090#1077' '#1096#1090#1088#1080#1093'-'#1082#1086#1076' '#1085#1072' '#1075#1072#1079#1077#1090#1077' '#1095#1077#1088#1077#1079' '#1089#1082#1072#1085#1077#1088'...'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clMaroon
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 199
    Top = 60
    Width = 106
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000D40E0000D40E00001000000010000000000059002424
      500026266900FF0000000101BD002929AF005D5DBB000707C8002828CA000000
      F5002626F4006161D300A4A4D500D1D1DA00D7D7F200E3E3E400333E20000001
      F33333E8744444441F333E874474444441F3E87844578578741F84DEC5C4EEBD
      844194EBC8D4FBCCB44077BBC8D4FBCCFC40947BC5D4FBCD6C40746F88D4FBCC
      BD4094DB88D4FBCCBD4094EBC7E4FBCCBD40A7CECCF6DDBEDC42EA8888888878
      B45F3EA74444444445E333EA777777745F33333EA9999995E333}
    OnClick = SpeedButton1Click
  end
end
