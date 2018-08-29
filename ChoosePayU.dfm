object ChoosePayF: TChoosePayF
  Left = 665
  Top = 277
  BorderStyle = bsDialog
  Caption = 'ChoosePayF'
  ClientHeight = 485
  ClientWidth = 503
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    503
    485)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn6: TBitBtn
    Left = 26
    Top = 363
    Width = 446
    Height = 76
    Caption = #1041#1077#1079#1085#1072#1083' 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Visible = False
    OnClick = BitBtn6Click
  end
  object BitBtn4: TBitBtn
    Left = 26
    Top = 115
    Width = 446
    Height = 76
    Caption = #1054#1055#1051#1040#1058#1040' '#1053#1040#1051#1048#1063#1053#1067#1052#1048' ('#1053#1054#1042#1040#1071'  '#1055#1054#1063#1058#1040')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 26
    Top = 198
    Width = 446
    Height = 76
    Caption = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1081' '#1095#1077#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnClick = BitBtn5Click
  end
  object BitBtn1: TBitBtn
    Left = 26
    Top = 30
    Width = 446
    Height = 76
    Caption = #1054#1055#1051#1040#1058#1040' '#1053#1040#1051#1048#1063#1053#1067#1052#1048
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn3: TBitBtn
    Left = 191
    Top = 451
    Width = 121
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 0
    OnClick = BitBtn3Click
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
  object BitBtn2: TBitBtn
    Left = 26
    Top = 280
    Width = 446
    Height = 76
    Caption = #1063#1045#1050' '#1055#1054' '#1058#1045#1056#1052#1048#1053#1040#1051#1059
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn2Click
  end
end
