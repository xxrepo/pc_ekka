object ReasonNoTovF: TReasonNoTovF
  Left = 454
  Top = 217
  BorderStyle = bsDialog
  Caption = 'ReasonNoTovF'
  ClientHeight = 328
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    338
    328)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 76
    Top = 3
    Width = 187
    Height = 18
    Anchors = [akTop]
    Caption = #1055#1088#1080#1095#1080#1085#1099' '#1086#1090#1089#1091#1090#1089#1090#1074#1080#1103' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object ok1: TImage
    Left = 310
    Top = 5
    Width = 16
    Height = 16
    AutoSize = True
    Picture.Data = {
      07544269746D6170F6000000424DF60000000000000076000000280000001000
      000010000000010004000000000080000000D40E0000D40E0000100000000000
      00003291380034B4390053B5550077A87A004CD64C0062D6650073D275007CE6
      81009EB79E00B1BDB100B5C6B500C6C6C6008CF7940094F79C00ADFFAD00B5FF
      B500BBBBBBB9BBBBBBBBBBBBBB0039BBBBBBBBBBB00128BBBBBBBBB9314123BB
      BBBBBB99055440ABBBBBB9902755513BBBBBA817D6106729BBBBB37C60832722
      BBBBB82239B926D68BBBB988BBBBB3DC29ABBBBBBBBBBB3C729ABBBBBBBBBB93
      EC29BBBBBBBBBBBB6F69BBBBBBBBBBBB9639BBBBBBBBBBBBBBBBBBBBBBBBBBBB
      BBBB}
    Transparent = True
    Visible = False
  end
  object BitBtn2: TBitBtn
    Left = 116
    Top = 301
    Width = 106
    Height = 25
    Anchors = [akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 0
    OnClick = BitBtn2Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000D40E0000D40E00001000000010000000000059002424
      500026266900FF0000000101BD002929AF005D5DBB000707C8002828CA000000
      F5002626F4006161D300A4A4D500D1D1DA00D7D7F200E3E3E400333E20000001
      F33333E8744444441F333E874474444441F3E87844578578741F84DEC5C4EEBD
      844194EBC8D4FBCCB44077BBC8D4FBCCFC40947BC5D4FBCD6C40746F88D4FBCC
      BD4094DB88D4FBCCBD4094EBC7E4FBCCBD40A7CECCF6DDBEDC42EA8888888878
      B45F3EA74444444445E333EA777777745F33333EA9999995E333}
  end
  object Panel1: TPanel
    Left = 1
    Top = 25
    Width = 335
    Height = 272
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 1
  end
end