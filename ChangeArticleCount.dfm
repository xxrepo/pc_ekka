object fmChangeCount: TfmChangeCount
  Left = 667
  Top = 344
  HelpType = htKeyword
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072
  ClientHeight = 230
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  DesignSize = (
    417
    230)
  PixelsPerInch = 96
  TextHeight = 13
  object im1: TImage
    Left = 3
    Top = 72
    Width = 413
    Height = 105
    Anchors = [akLeft, akTop, akRight, akBottom]
    Center = True
  end
  object lbNeedCount: TLabel
    Left = 52
    Top = 83
    Width = 175
    Height = 16
    Caption = #1058#1088#1077#1073#1091#1077#1084#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbRestCount: TLabel
    Left = 156
    Top = 115
    Width = 72
    Height = 16
    Caption = #1044#1086#1089#1090#1091#1087#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbChangeCount: TLabel
    Left = 112
    Top = 147
    Width = 115
    Height = 16
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1095#1077#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = -63
    Top = 183
    Width = 483
    Height = 6
    Anchors = [akLeft, akRight, akBottom]
  end
  object edNeedCount: TEdit
    Left = 274
    Top = 79
    Width = 78
    Height = 27
    BevelKind = bkFlat
    BorderStyle = bsNone
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    Text = '0'
  end
  object edRestCount: TEdit
    Left = 274
    Top = 111
    Width = 78
    Height = 27
    BevelKind = bkFlat
    BorderStyle = bsNone
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Text = '0'
  end
  object edChangeCount: TEdit
    Left = 274
    Top = 143
    Width = 78
    Height = 27
    BevelKind = bkFlat
    BorderStyle = bsNone
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Text = '0'
    OnKeyPress = edChangeCountKeyPress
  end
  object BitBtn1: TBitBtn
    Left = 136
    Top = 193
    Width = 83
    Height = 28
    Anchors = [akLeft, akBottom]
    Caption = #1054#1050
    Default = True
    TabOrder = 3
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
    Left = 244
    Top = 193
    Width = 83
    Height = 28
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 69
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clGradientInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object lbArticleName: TLabel
      Left = 2
      Top = 18
      Width = 411
      Height = 46
      Align = alCustom
      AutoSize = False
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      WordWrap = True
    end
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 413
      Height = 16
      Align = alTop
      BevelOuter = bvNone
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      Color = cl3DLight
      TabOrder = 0
    end
  end
end
