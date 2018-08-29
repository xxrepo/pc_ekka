object AddStrahF: TAddStrahF
  Left = 541
  Top = 296
  BorderStyle = bsDialog
  Caption = 'AddStrahF'
  ClientHeight = 272
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    458
    272)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 5
    Top = 20
    Width = 235
    Height = 16
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1090#1088#1072#1093#1086#1074#1091#1102' '#1082#1086#1084#1087#1072#1085#1080#1102
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 5
    Top = 75
    Width = 106
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1087#1086#1083#1080#1089#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 175
    Top = 75
    Width = 86
    Height = 16
    Caption = #1044#1072#1090#1072' '#1073#1088#1086#1085#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 320
    Top = 75
    Width = 95
    Height = 16
    Caption = '% '#1060#1088#1072#1085#1096#1080#1079#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 5
    Top = 130
    Width = 100
    Height = 16
    Caption = #1060#1048#1054' '#1082#1083#1080#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 5
    Top = 185
    Width = 133
    Height = 16
    Caption = #1058#1077#1083#1077#1092#1086#1085' '#1082#1083#1080#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 200
    Top = 185
    Width = 180
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080' / '#1088#1077#1094#1077#1087#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbStrah: TComboBox
    Left = 5
    Top = 40
    Width = 447
    Height = 21
    BevelKind = bkFlat
    Style = csDropDownList
    DropDownCount = 20
    ItemHeight = 13
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 241
    Width = 83
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1050
    Default = True
    TabOrder = 9
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
    Top = 241
    Width = 83
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 10
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
  object edNNPolis: TEdit
    Left = 5
    Top = 95
    Width = 156
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 1
  end
  object dtPolis: TDateTimePicker
    Left = 175
    Top = 95
    Width = 131
    Height = 21
    BevelOuter = bvNone
    BevelKind = bkFlat
    Date = 42726.000000000000000000
    Time = 42726.000000000000000000
    TabOrder = 2
  end
  object edFransh: TEdit
    Left = 320
    Top = 95
    Width = 131
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 3
    OnKeyPress = edFranshKeyPress
  end
  object edFIO: TEdit
    Left = 5
    Top = 150
    Width = 301
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 4
  end
  object RadioButton1: TRadioButton
    Left = 335
    Top = 135
    Width = 113
    Height = 17
    Caption = #1044#1086#1089#1090#1072#1074#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object RadioButton2: TRadioButton
    Left = 335
    Top = 160
    Width = 113
    Height = 17
    Caption = #1057#1072#1084#1086#1074#1099#1074#1086#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object edPhone: TEdit
    Left = 5
    Top = 205
    Width = 184
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    Text = '+38 (___) ___-__-__'
    OnEnter = edPhoneEnter
    OnKeyDown = edPhoneKeyDown
    OnKeyPress = edPhoneKeyPress
    OnKeyUp = edPhoneKeyUp
  end
  object edNumOrder: TEdit
    Left = 200
    Top = 205
    Width = 251
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 8
  end
end
