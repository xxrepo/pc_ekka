object Pilot2F: TPilot2F
  Left = 741
  Top = 435
  BorderStyle = bsDialog
  Caption = 'Pilot2F'
  ClientHeight = 267
  ClientWidth = 740
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
    740
    267)
  PixelsPerInch = 96
  TextHeight = 13
  object Image4: TImage
    Left = 432
    Top = 5
    Width = 237
    Height = 241
    AutoSize = True
    Visible = False
  end
  object Image2: TImage
    Left = 360
    Top = 96
    Width = 385
    Height = 74
    AutoSize = True
    Visible = False
  end
  object Image3: TImage
    Left = 441
    Top = 87
    Width = 214
    Height = 79
    AutoSize = True
    Visible = False
  end
  object Image5: TImage
    Left = 480
    Top = 55
    Width = 129
    Height = 137
    AutoSize = True
    Visible = False
  end
  object Label1: TLabel
    Left = 5
    Top = 10
    Width = 351
    Height = 218
    Alignment = taCenter
    Anchors = [akLeft, akTop, akBottom]
    AutoSize = False
    Caption = 'Label1'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object BitBtn1: TBitBtn
    Left = 71
    Top = 237
    Width = 110
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1044#1072
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
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
    Left = 191
    Top = 237
    Width = 110
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1053#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
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
end
