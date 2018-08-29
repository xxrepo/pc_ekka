object ZakazPodKlientaF: TZakazPodKlientaF
  Left = 839
  Top = 201
  Width = 328
  Height = 200
  Caption = 'ZakazPodKlientaF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbARTICLE_TEXT1: TLabel
    Left = 4
    Top = 4
    Width = 93
    Height = 13
    Caption = 'lbARTICLE_TEXT1'
  end
  object lbARTICLE_TEXT2: TLabel
    Left = 4
    Top = 20
    Width = 93
    Height = 13
    Caption = 'lbARTICLE_TEXT2'
  end
  object lbARTICLE_TEXT3: TLabel
    Left = 4
    Top = 36
    Width = 93
    Height = 13
    Caption = 'lbARTICLE_TEXT3'
  end
  object lbTEXT1: TLabel
    Left = 4
    Top = 52
    Width = 42
    Height = 13
    Caption = 'lbTEXT1'
  end
  object lbTelefon: TLabel
    Left = 4
    Top = 68
    Width = 45
    Height = 13
    Caption = #1058#1077#1083#1077#1092#1086#1085
  end
  object lbNameClient: TLabel
    Left = 4
    Top = 92
    Width = 66
    Height = 13
    Caption = #1048#1084#1103' '#1082#1083#1080#1077#1085#1090#1072
    Visible = False
  end
  object lbNOTE1: TLabel
    Left = 4
    Top = 144
    Width = 44
    Height = 13
    Caption = 'lbNOTE1'
    Color = clBtnFace
    ParentColor = False
  end
  object edTelefon: TEdit
    Left = 52
    Top = 68
    Width = 121
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    Text = '+38 (___) ___-__-__'
    OnEnter = edTelefonEnter
    OnKeyDown = edTelefonKeyDown
    OnKeyPress = edTelefonKeyPress
    OnKeyUp = edTelefonKeyUp
  end
  object bbOK: TBitBtn
    Left = 4
    Top = 116
    Width = 75
    Height = 25
    Caption = 'bbOK'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    WordWrap = True
    OnClick = bbOKClick
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
  object bbCancel: TBitBtn
    Left = 80
    Top = 116
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'bbCancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    WordWrap = True
    OnClick = bbCancelClick
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
  object edNameClient: TEdit
    Left = 72
    Top = 92
    Width = 121
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 3
    Text = 'edNameClient'
    Visible = False
  end
end
