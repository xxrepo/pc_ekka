object BlankReciptF: TBlankReciptF
  Left = 770
  Top = 180
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'BlankReciptF'
  ClientHeight = 191
  ClientWidth = 435
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
    435
    191)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 0
    Width = 433
    Height = 160
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 0
    object Label2: TLabel
      Left = 15
      Top = 35
      Width = 52
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103':'
    end
    object Label3: TLabel
      Left = 15
      Top = 60
      Width = 25
      Height = 13
      Caption = #1048#1084#1103':'
    end
    object Label4: TLabel
      Left = 15
      Top = 85
      Width = 50
      Height = 13
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
    end
    object Label1: TLabel
      Left = 10
      Top = 10
      Width = 90
      Height = 13
      Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 230
      Top = 35
      Width = 52
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103':'
    end
    object Label6: TLabel
      Left = 230
      Top = 60
      Width = 25
      Height = 13
      Caption = #1048#1084#1103':'
    end
    object Label7: TLabel
      Left = 230
      Top = 85
      Width = 50
      Height = 13
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
    end
    object Label8: TLabel
      Left = 225
      Top = 10
      Width = 69
      Height = 13
      Caption = #1060#1048#1054' '#1074#1088#1072#1095#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 15
      Top = 110
      Width = 48
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085':'
    end
    object Label10: TLabel
      Left = 15
      Top = 135
      Width = 33
      Height = 13
      Caption = #1043#1086#1088#1086#1076':'
    end
    object Edit1: TEdit
      Left = 72
      Top = 31
      Width = 140
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 72
      Top = 56
      Width = 140
      Height = 21
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 72
      Top = 81
      Width = 140
      Height = 21
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 287
      Top = 31
      Width = 140
      Height = 21
      TabOrder = 5
    end
    object Edit5: TEdit
      Left = 287
      Top = 56
      Width = 140
      Height = 21
      TabOrder = 6
    end
    object Edit6: TEdit
      Left = 287
      Top = 81
      Width = 140
      Height = 21
      TabOrder = 7
    end
    object Edit7: TEdit
      Left = 72
      Top = 106
      Width = 140
      Height = 21
      TabOrder = 3
    end
    object Edit8: TEdit
      Left = 72
      Top = 131
      Width = 140
      Height = 21
      TabOrder = 4
    end
  end
  object BitBtn1: TBitBtn
    Left = 103
    Top = 164
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
    Left = 221
    Top = 164
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
end
