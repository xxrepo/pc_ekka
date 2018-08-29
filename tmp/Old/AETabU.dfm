object AETabF: TAETabF
  Left = 790
  Top = 413
  BorderStyle = bsToolWindow
  Caption = 'AETabF'
  ClientHeight = 223
  ClientWidth = 277
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
    277
    223)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 75
    Top = 32
    Width = 7
    Height = 20
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 5
    Top = 5
    Width = 82
    Height = 13
    Caption = #1042#1088#1077#1084#1103' '#1089#1084#1077#1085#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 5
    Top = 173
    Width = 66
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
  end
  object Label4: TLabel
    Left = 5
    Top = 145
    Width = 41
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1050#1072#1089#1089#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 5
    Top = 70
    Width = 100
    Height = 13
    Caption = #1063#1072#1089#1099' '#1079#1072#1074#1077#1076#1086#1074#1072#1085#1080#1103':'
    Enabled = False
  end
  object edStart: TEdit
    Left = 5
    Top = 30
    Width = 36
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = '8'
    OnKeyDown = edStartKeyDown
    OnKeyPress = edStartKeyPress
  end
  object edEnd: TEdit
    Left = 87
    Top = 30
    Width = 36
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = '20'
    OnKeyDown = edEndKeyDown
    OnKeyPress = edStartKeyPress
  end
  object RadioButton1: TRadioButton
    Left = 176
    Top = 25
    Width = 100
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1055#1077#1088#1074#1072#1103' '#1089#1084#1077#1085#1072
    TabOrder = 2
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 176
    Top = 45
    Width = 100
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1042#1090#1086#1088#1072#1103' '#1089#1084#1077#1085#1072
    TabOrder = 3
    OnClick = RadioButton2Click
  end
  object RadioButton3: TRadioButton
    Left = 176
    Top = 65
    Width = 100
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1053#1086#1095#1085#1072#1103' '#1089#1084#1077#1085#1072
    TabOrder = 4
    OnClick = RadioButton3Click
  end
  object BitBtn1: TBitBtn
    Left = 50
    Top = 195
    Width = 83
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    TabOrder = 5
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
    Left = 143
    Top = 195
    Width = 83
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 6
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
  object edStMin: TEdit
    Left = 45
    Top = 20
    Width = 26
    Height = 21
    TabOrder = 7
    Text = '00'
    OnKeyPress = edStartKeyPress
  end
  object edEndMin: TEdit
    Left = 127
    Top = 20
    Width = 26
    Height = 21
    TabOrder = 8
    Text = '00'
    OnKeyPress = edStartKeyPress
  end
  object RadioButton4: TRadioButton
    Tag = 1
    Left = 176
    Top = 85
    Width = 84
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1042#1099#1093#1086#1076#1085#1086#1081
    TabOrder = 9
    OnClick = RadioButton4Click
  end
  object cbKassa: TComboBox
    Left = 52
    Top = 141
    Width = 71
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akBottom]
    ItemHeight = 13
    TabOrder = 10
  end
  object RadioButton5: TRadioButton
    Left = 176
    Top = 5
    Width = 100
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1062#1077#1083#1099#1081' '#1076#1077#1085#1100
    TabOrder = 11
    OnClick = RadioButton5Click
  end
  object RadioButton6: TRadioButton
    Tag = 1
    Left = 176
    Top = 145
    Width = 90
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 12
    OnClick = RadioButton6Click
  end
  object RadioButton7: TRadioButton
    Tag = 1
    Left = 176
    Top = 105
    Width = 84
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1087#1091#1089#1082
    TabOrder = 13
    OnClick = RadioButton7Click
  end
  object edDescr: TEdit
    Left = 5
    Top = 115
    Width = 121
    Height = 21
    TabOrder = 14
    Text = 'edDescr'
    Visible = False
  end
  object RadioButton8: TRadioButton
    Tag = 1
    Left = 176
    Top = 125
    Width = 84
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1081
    TabOrder = 15
    OnClick = RadioButton8Click
  end
  object Edit1: TEdit
    Left = 107
    Top = 67
    Width = 49
    Height = 21
    Enabled = False
    TabOrder = 16
    Text = '0'
    OnKeyPress = Edit1KeyPress
  end
  object cbDescr: TComboBox
    Left = 75
    Top = 168
    Width = 197
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 17
    OnChange = cbDescrChange
    Items.Strings = (
      ' '
      #1058#1086#1074#1072#1088
      #1058#1088#1077#1085#1080#1085#1075
      #1057#1077#1089#1089#1080#1103
      #1059#1074#1086#1083#1077#1085
      #1055#1077#1088#1077#1074#1077#1076#1077#1085
      #1053#1077#1074#1099#1093#1086#1076
      #1055#1077#1088#1077#1091#1095#1077#1090
      #1044#1086#1087'. '#1095#1077#1083'.'
      #1054#1090#1082#1088'. '#1072#1087#1090'.')
  end
end
