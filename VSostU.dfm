object VSostF: TVSostF
  Left = 666
  Top = 368
  BorderStyle = bsToolWindow
  Caption = 'VSostF'
  ClientHeight = 136
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 85
    Width = 184
    Height = 50
  end
  object Label1: TLabel
    Left = 5
    Top = 15
    Width = 255
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1086#1079#1080#1088#1086#1074#1082#1091' '#1091#1082#1072#1079#1072#1085#1085#1091#1102' '#1074' '#1088#1077#1094#1077#1087#1090#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 5
    Top = 45
    Width = 155
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1086#1088#1084#1091' '#1074#1099#1087#1091#1089#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 5
    Top = 89
    Width = 176
    Height = 42
    AutoSize = False
    Caption = 
      #1045#1089#1083#1080' '#1074#1099' '#1085#1077' '#1079#1085#1072#1077#1090#1077' '#1076#1086#1079#1080#1088#1086#1074#1082#1091' '#1080#1083#1080' '#1092#1086#1088#1084#1091' '#1074#1099#1087#1091#1089#1082#1072', '#1086#1089#1090#1072#1074#1090#1077' '#1087#1086#1083#1103' '#1087#1091#1089#1090 +
      #1099#1084#1080' '#1080' '#1085#1072#1078#1084#1080#1090#1077' "'#1054#1050'"'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object ComboBox1: TComboBox
    Left = 265
    Top = 11
    Width = 96
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
  object ComboBox2: TComboBox
    Left = 265
    Top = 41
    Width = 96
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 229
    Top = 76
    Width = 100
    Height = 25
    Caption = #1054#1050
    Default = True
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000D40E0000D40E00001000000010000000255B25002966
      29002D712D00327E3200368836003B943B0041A5410048B6480054BC54005FC1
      5F0071C771000000FF008ED38E00A4DCA400B2E1B200D1EED100BBB64BBBBBB4
      4BBBBBB614BBBB424BBBBBB6304BB6534BBBBBB7D52137A44BBBBBB7FE63ACC2
      6BBBBBB7FFFFEEA36BBBBBB7DDFFFE404BBBBB55EEEFFFA204BBB5AEEEEEFFEA
      310B9EFFFFEEFFFFC5548889AAFEE669A88BBBBBB7FEE2BBBBBBBBBBBAFF94BB
      BBBBBBBBBACE54BBBBBBBBBBBBAC26BBBBBBBBBBBB977BBBBBBB}
  end
  object BitBtn2: TBitBtn
    Left = 229
    Top = 106
    Width = 100
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
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
end
