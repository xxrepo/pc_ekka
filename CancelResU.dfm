object CancelResF: TCancelResF
  Left = 607
  Top = 175
  BorderStyle = bsDialog
  Caption = 'CancelResF'
  ClientHeight = 167
  ClientWidth = 468
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    468
    167)
  PixelsPerInch = 96
  TextHeight = 13
  object im1: TImage
    Left = 10
    Top = 42
    Width = 451
    Height = 79
    Anchors = [akLeft, akTop, akRight]
  end
  object Bevel1: TBevel
    Left = 3
    Top = 131
    Width = 461
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
  end
  object Label1: TLabel
    Left = 55
    Top = 59
    Width = 86
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 55
    Top = 89
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
  object Edit1: TEdit
    Left = 165
    Top = 55
    Width = 279
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 148
    Top = 139
    Width = 83
    Height = 25
    Anchors = [akLeft, akBottom]
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
    Left = 236
    Top = 139
    Width = 83
    Height = 25
    Anchors = [akLeft, akBottom]
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
  object Edit3: TEdit
    Left = 260
    Top = 85
    Width = 184
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 1
    Text = '+38 (___) ___-__-__'
    OnEnter = Edit3Enter
    OnKeyDown = Edit3KeyUp
    OnKeyPress = Edit3KeyPress
    OnKeyUp = Edit3KeyUp
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 468
    Height = 38
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    DesignSize = (
      468
      38)
    object Label3: TLabel
      Left = 7
      Top = 5
      Width = 451
      Height = 28
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Caption = '  '#1044#1083#1103' '#1086#1090#1084#1077#1085#1099' '#1073#1088#1086#1085#1080' '#1074#1074#1077#1076#1080#1090#1077' '#1085#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1072' '#1080' '#1090#1077#1083#1077#1092#1086#1085' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
      Layout = tlCenter
      WordWrap = True
    end
  end
end
