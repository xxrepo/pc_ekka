object BankCardF: TBankCardF
  Left = 693
  Top = 416
  BorderStyle = bsDialog
  Caption = 'BankCardF'
  ClientHeight = 160
  ClientWidth = 356
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
    356
    160)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 1
    Width = 354
    Height = 126
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 0
    object Label4: TLabel
      Left = 200
      Top = 20
      Width = 48
      Height = 16
      Caption = 'Label4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 50
      Top = 55
      Width = 254
      Height = 16
      Caption = #1054#1078#1080#1076#1072#1085#1080#1077'  '#1086#1090#1074#1077#1090#1072' '#1086#1090' '#1090#1077#1088#1084#1080#1085#1072#1083#1072'...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object BitBtn3: TBitBtn
      Tag = 1
      Left = 10
      Top = 15
      Width = 181
      Height = 25
      Caption = #1054#1087#1083#1072#1090#1080#1090#1100' '#1087#1086' '#1090#1077#1088#1084#1080#1085#1072#1083#1091
      TabOrder = 0
      OnClick = BitBtn3Click
    end
    object Edit1: TEdit
      Left = 10
      Top = 90
      Width = 336
      Height = 21
      Color = clScrollBar
      ReadOnly = True
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 10
      Top = 76
      Width = 105
      Height = 17
      Caption = #1054#1087#1083#1072#1090#1072' '#1095#1072#1089#1090#1103#1084#1080
      TabOrder = 2
      Visible = False
      OnClick = CheckBox1Click
    end
    object ComboBox1: TComboBox
      Left = 120
      Top = 73
      Width = 56
      Height = 21
      Style = csDropDownList
      DropDownCount = 20
      Enabled = False
      ItemHeight = 13
      TabOrder = 3
      Visible = False
      Items.Strings = (
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '16'
        '17'
        '18'
        '19'
        '20'
        '21'
        '22'
        '23'
        '24'
        '25')
    end
  end
  object BitBtn1: TBitBtn
    Left = 66
    Top = 132
    Width = 110
    Height = 25
    Anchors = [akBottom]
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
    Left = 181
    Top = 132
    Width = 110
    Height = 25
    Anchors = [akBottom]
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
