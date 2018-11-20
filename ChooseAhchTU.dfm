object ChooseAhchTF: TChooseAhchTF
  Left = 613
  Top = 457
  BorderStyle = bsDialog
  Caption = 'ChooseAhchTF'
  ClientHeight = 328
  ClientWidth = 397
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
    397
    328)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 70
    Top = 5
    Width = 257
    Height = 16
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1080#1087' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1093' '#1088#1072#1073#1086#1090'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 5
    Top = 25
    Width = 386
    Height = 272
    DataSource = DM.srAhchT
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = BitBtn1Click
    Columns = <
      item
        Expanded = False
        FieldName = 'Descr'
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087#1099' '#1088#1072#1073#1086#1090
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 352
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 110
    Top = 301
    Width = 85
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
    Left = 203
    Top = 301
    Width = 85
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
end
