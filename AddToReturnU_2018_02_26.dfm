object AddToReturnF: TAddToReturnF
  Left = 998
  Top = 126
  Width = 770
  Height = 200
  Caption = 'AddToReturnF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    754
    161)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 415
    Top = 36
    Width = 99
    Height = 16
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086'*:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 5
    Top = 10
    Width = 741
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 68
    Width = 98
    Height = 16
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 48
    Top = 36
    Width = 145
    Height = 16
    Caption = #1055#1088#1080#1095#1080#1085#1072' '#1074#1086#1079#1074#1088#1072#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 39
    Top = 100
    Width = 684
    Height = 16
    Caption = 
      '* '#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1073#1091#1076#1077#1090' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1086' '#1082' '#1073#1083#1080#1078#1072#1081#1096#1077#1084#1091' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1091' '#1091#1087#1072#1082#1086#1074#1086 +
      #1082' '#1087#1086' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1091'!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edKol: TEdit
    Left = 512
    Top = 36
    Width = 65
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = '0'
    OnExit = edKolExit
  end
  object BitBtn1: TBitBtn
    Left = 263
    Top = 130
    Width = 110
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
    Left = 381
    Top = 130
    Width = 110
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
  object Edit1: TEdit
    Left = 108
    Top = 68
    Width = 637
    Height = 21
    MaxLength = 500
    TabOrder = 3
    Text = 'Edit1'
  end
  object ComboBox1: TComboBox
    Left = 197
    Top = 36
    Width = 204
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'ComboBox1'
    OnChange = ComboBox1Change
  end
  object ComboBox2: TComboBox
    Left = 300
    Top = 36
    Width = 81
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'ComboBox2'
    Visible = False
  end
end
