object ShowCardInfoF: TShowCardInfoF
  Left = 606
  Top = 396
  BorderStyle = bsDialog
  Caption = 'ShowCardInfoF'
  ClientHeight = 187
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShortCut = FormShortCut
  DesignSize = (
    395
    187)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 0
    Width = 393
    Height = 46
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      393
      46)
    object Label1: TLabel
      Left = 6
      Top = 4
      Width = 381
      Height = 39
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = #1055#1088#1086#1074#1077#1076#1080#1090#1077' '#1082#1072#1088#1090#1086#1095#1082#1091' '#1095#1077#1088#1077#1079' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1086' '#1095#1090#1077#1085#1080#1103
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      WordWrap = True
    end
  end
  object Panel2: TPanel
    Left = 1
    Top = 49
    Width = 393
    Height = 108
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 1
    object Label4: TLabel
      Left = 5
      Top = 55
      Width = 113
      Height = 16
      Caption = #1055#1088#1086#1094#1077#1085#1090' '#1089#1082#1080#1076#1082#1080':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 5
      Top = 4
      Width = 113
      Height = 16
      Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1086#1095#1082#1080':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 5
      Top = 29
      Width = 132
      Height = 16
      Caption = #1057#1091#1084#1084#1072' '#1085#1072' '#1082#1072#1088#1090#1086#1095#1082#1077':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lbNum: TLabel
      Left = 155
      Top = 4
      Width = 8
      Height = 17
      Caption = '0'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lbSum: TLabel
      Left = 155
      Top = 29
      Width = 28
      Height = 17
      Caption = '0.00'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lbSkd: TLabel
      Left = 154
      Top = 54
      Width = 8
      Height = 17
      Caption = '0'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lbAdr: TLabel
      Left = 55
      Top = 129
      Width = 4
      Height = 16
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 5
      Top = 79
      Width = 133
      Height = 16
      Caption = #1053#1072#1082#1086#1087#1083#1077#1085#1085#1072#1103' '#1089#1091#1084#1084#1072':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Visible = False
    end
    object Label6: TLabel
      Left = 155
      Top = 79
      Width = 28
      Height = 17
      Caption = '0.00'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Visible = False
    end
  end
  object BitBtn1: TBitBtn
    Left = 132
    Top = 160
    Width = 131
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
  object Edit1: TEdit
    Left = 401
    Top = 130
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Timer1: TTimer
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 231
    Top = 69
  end
end
