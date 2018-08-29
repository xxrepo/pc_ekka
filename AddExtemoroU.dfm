object AddExtemoroF: TAddExtemoroF
  Left = 726
  Top = 198
  BorderStyle = bsDialog
  Caption = 'AddExtemoroF'
  ClientHeight = 412
  ClientWidth = 541
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    541
    412)
  PixelsPerInch = 96
  TextHeight = 13
  object im1: TImage
    Left = 10
    Top = 42
    Width = 521
    Height = 189
    Anchors = [akLeft, akTop, akRight]
  end
  object Label1: TLabel
    Left = 43
    Top = 59
    Width = 35
    Height = 13
    Caption = #1060#1048#1054':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 43
    Top = 88
    Width = 202
    Height = 13
    Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 10
    Top = 240
    Width = 130
    Height = 13
    Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1088#1077#1094#1077#1087#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 45
    Top = 120
    Width = 161
    Height = 13
    Caption = #1043#1076#1077' '#1091#1076#1086#1073#1085#1086' '#1079#1072#1073#1088#1072#1090#1100' '#1090#1086#1074#1072#1088':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 222
    Top = 171
    Width = 17
    Height = 13
    Caption = #1083#1077#1090
  end
  object lbDescr: TLabel
    Left = 212
    Top = 142
    Width = 3
    Height = 13
  end
  object Label5: TLabel
    Left = 44
    Top = 204
    Width = 184
    Height = 13
    Caption = #1054#1073#1098#1077#1084' '#1083#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1086#1081' '#1092#1086#1088#1084#1099':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 541
    Height = 31
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = '  '#1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1085#1085#1099#1077' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 83
    Top = 55
    Width = 413
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 253
    Top = 85
    Width = 243
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 2
    Text = '+38 (___) ___-__-__'
    OnEnter = Edit3Enter
    OnKeyDown = Edit3KeyDown
    OnKeyPress = Edit3KeyPress
    OnKeyUp = Edit3KeyUp
  end
  object Memo1: TMemo
    Left = 10
    Top = 255
    Width = 521
    Height = 121
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 156
    Top = 382
    Width = 110
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1050
    Default = True
    TabOrder = 4
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
    Left = 274
    Top = 382
    Width = 110
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
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
  object ComboBox1: TComboBox
    Left = 210
    Top = 117
    Width = 286
    Height = 21
    BevelKind = bkFlat
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
    OnChange = ComboBox1Change
  end
  object RadioButton1: TRadioButton
    Left = 45
    Top = 170
    Width = 143
    Height = 17
    Caption = #1042#1086#1079#1088#1072#1089#1090' '#1087#1072#1094#1080#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object RadioButton2: TRadioButton
    Left = 252
    Top = 170
    Width = 179
    Height = 17
    Caption = #1043#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103' '#1087#1072#1094#1080#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object Edit4: TEdit
    Left = 192
    Top = 168
    Width = 23
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 9
  end
  object ComboBox2: TComboBox
    Left = 435
    Top = 168
    Width = 61
    Height = 21
    BevelKind = bkFlat
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 10
  end
  object Edit2: TEdit
    Left = 235
    Top = 201
    Width = 71
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 11
  end
end
