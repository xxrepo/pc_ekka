object EnterStrF: TEnterStrF
  Left = 321
  Top = 242
  BorderStyle = bsDialog
  Caption = 'EnterStrF'
  ClientHeight = 74
  ClientWidth = 392
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
    392
    74)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 74
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      392
      74)
    object Label1: TLabel
      Left = 5
      Top = 5
      Width = 161
      Height = 13
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1092#1088#1072#1079#1091' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edStr: TEdit
      Left = 5
      Top = 21
      Width = 383
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 94
      Top = 46
      Width = 100
      Height = 25
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
      Left = 199
      Top = 46
      Width = 100
      Height = 25
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
end
