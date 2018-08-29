object AddDoctorF: TAddDoctorF
  Left = 721
  Top = 336
  BorderStyle = bsDialog
  Caption = 'AddDoctorF'
  ClientHeight = 157
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = cbDoctorKeyPress
  DesignSize = (
    459
    157)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 10
    Width = 443
    Height = 16
    Caption = #1055#1088#1086#1074#1077#1076#1080#1090#1077' '#1082#1072#1088#1090#1091' '#1095#1077#1088#1077#1079' '#1089#1082#1072#1085#1077#1088' '#1096#1090#1088#1080#1093#1082#1086#1076#1086#1074' ('#1077#1089#1083#1080' '#1086#1085#1072' '#1077#1089#1090#1100')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 20
    Top = 40
    Width = 72
    Height = 16
    Caption = #8470' '#1082#1072#1088#1090#1099': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 5
    Top = 70
    Width = 233
    Height = 16
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1088#1072#1095#1072' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbNCard: TLabel
    Left = 95
    Top = 40
    Width = 5
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 5
    Top = 135
    Width = 976
    Height = 16
    Caption = 
      #1045#1089#1083#1080' '#1042#1072#1084' '#1085#1091#1078#1085#1086' '#1091#1079#1085#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1094#1077#1085#1099', '#1074#1099#1073#1077#1088#1080#1090#1077' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1083#1102#1073#1091#1102' '#1092#1072#1084#1080 +
      #1083#1080#1102' '#1074#1088#1072#1095#1072', '#1085#1072#1078#1084#1080#1090#1077' "'#1054#1050'" '#1080' '#1074#1073#1077#1081#1090#1077' '#1085#1091#1078#1085#1099#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1099' '#1074' '#1095#1077#1082'!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object cbDoctor: TComboBox
    Left = 15
    Top = 100
    Width = 431
    Height = 21
    Style = csDropDownList
    DropDownCount = 20
    ItemHeight = 13
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 127
    Width = 83
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1050
    Default = True
    TabOrder = 1
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
    Left = 232
    Top = 127
    Width = 83
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
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
