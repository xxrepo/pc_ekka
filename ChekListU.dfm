object ChekListF: TChekListF
  Left = 425
  Top = 410
  BorderStyle = bsDialog
  Caption = 'ChekListF'
  ClientHeight = 225
  ClientWidth = 208
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
    208
    225)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 0
    Width = 206
    Height = 194
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      206
      194)
    object Label1: TLabel
      Left = 31
      Top = 5
      Width = 143
      Height = 13
      Caption = #1057#1087#1080#1089#1086#1082' '#1085#1072#1081#1076#1077#1085#1099#1093' '#1095#1077#1082#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 27
      Top = 151
      Width = 95
      Height = 13
      Caption = #1055#1088#1077#1076#1086#1087#1083#1072#1090#1085#1099#1081' '#1095#1077#1082
    end
    object Label8: TLabel
      Left = 27
      Top = 171
      Width = 167
      Height = 13
      Caption = #1047#1072#1074#1077#1088#1096#1077#1085#1085#1099#1081' '#1087#1088#1077#1076#1086#1087#1083#1072#1090#1085#1099#1081' '#1095#1077#1082
    end
    object SG: TStringGrid
      Left = -1
      Top = 20
      Width = 207
      Height = 126
      Anchors = [akLeft, akTop, akRight]
      Color = 15198449
      ColCount = 3
      DefaultRowHeight = 17
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goThumbTracking]
      TabOrder = 0
      OnDrawCell = SGDrawCell
      ColWidths = (
        94
        92
        64)
    end
    object pn1: TPanel
      Left = 7
      Top = 151
      Width = 14
      Height = 14
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clYellow
      TabOrder = 1
    end
    object pn2: TPanel
      Left = 7
      Top = 171
      Width = 14
      Height = 14
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clBlue
      TabOrder = 2
    end
  end
  object BitBtn1: TBitBtn
    Left = 7
    Top = 198
    Width = 96
    Height = 25
    Anchors = [akBottom]
    Caption = #1042#1099#1073#1088#1072#1090#1100
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
    Left = 106
    Top = 198
    Width = 96
    Height = 25
    Anchors = [akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
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
