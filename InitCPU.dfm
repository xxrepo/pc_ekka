object InitCPF: TInitCPF
  Left = 626
  Top = 391
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'InitCPF'
  ClientHeight = 158
  ClientWidth = 363
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
    363
    158)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 2
    Top = 3
    Width = 359
    Height = 123
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 10
      Width = 66
      Height = 13
      Caption = #1044#1072#1090#1072' '#1095#1077#1082#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 75
      Width = 85
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1082#1072#1089#1089#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 175
      Top = 40
      Width = 25
      Height = 13
      Caption = #1042#1046':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 175
      Top = 75
      Width = 90
      Height = 13
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 10
      Top = 40
      Width = 51
      Height = 13
      Caption = #8470' '#1063#1077#1082#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 175
      Top = 10
      Width = 74
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1095#1077#1082#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dtChek: TDateTimePicker
      Left = 80
      Top = 7
      Width = 86
      Height = 21
      Date = 39898.618936446760000000
      Time = 39898.618936446760000000
      TabOrder = 0
    end
    object cbKassa: TComboBox
      Left = 99
      Top = 71
      Width = 67
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = cbKassaChange
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9')
    end
    object cbVzh: TComboBox
      Left = 205
      Top = 36
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
    end
    object cbUser: TComboBox
      Left = 270
      Top = 71
      Width = 81
      Height = 21
      Enabled = False
      ItemHeight = 13
      TabOrder = 3
    end
    object edCheck: TEdit
      Left = 65
      Top = 37
      Width = 101
      Height = 21
      TabOrder = 4
    end
    object tmChek: TDateTimePicker
      Left = 255
      Top = 7
      Width = 94
      Height = 21
      Date = 39898.618936446760000000
      Time = 39898.618936446760000000
      Kind = dtkTime
      TabOrder = 5
    end
    object CheckBox1: TCheckBox
      Left = 10
      Top = 100
      Width = 156
      Height = 17
      Caption = #1053#1077' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' EKKA'
      Checked = True
      State = cbChecked
      TabOrder = 6
      OnClick = CheckBox1Click
    end
  end
  object BitBtn2: TBitBtn
    Left = 185
    Top = 131
    Width = 110
    Height = 25
    Anchors = [akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
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
  object BitBtn1: TBitBtn
    Left = 68
    Top = 131
    Width = 110
    Height = 25
    Anchors = [akBottom]
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
end
