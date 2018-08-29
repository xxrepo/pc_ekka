object SpisArtCenaF: TSpisArtCenaF
  Left = 569
  Top = 306
  BorderStyle = bsDialog
  Caption = 'SpisArtCenaF'
  ClientHeight = 287
  ClientWidth = 711
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShortCut = FormShortCut
  DesignSize = (
    711
    287)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 5
    Width = 706
    Height = 51
    Alignment = taCenter
    AutoSize = False
    Caption = 
      #1042#1085#1080#1084#1072#1085#1080#1077'! '#1053#1072' '#1076#1072#1085#1085#1091#1102' '#1087#1086#1079#1080#1094#1080#1102' '#1076#1077#1081#1089#1090#1074#1091#1102#1090' '#1088#1072#1079#1085#1099#1077' '#1094#1077#1085#1099' '#1074' '#1079#1072#1074#1080#1089#1080#1084#1086#1089#1090#1080' ' +
      #1086#1090' '#1079#1072#1082#1091#1087#1082#1080'. '#1055#1086' '#1084#1077#1088#1077' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1076#1072#1085#1085#1086#1081' '#1087#1086#1079#1080#1094#1080#1080' '#1074' '#1095#1077#1082' '#1094#1077#1085#1099' '#1073#1091#1076#1091#1090' '#1088 +
      #1072#1089#1087#1088#1077#1076#1077#1083#1103#1090#1089#1103' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080', '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086' '#1082#1086#1085#1077#1095#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1095#1077#1082#1072' '#1084 +
      #1086#1078#1077#1090' '#1086#1090#1083#1080#1095#1072#1090#1100#1089#1103' '#1086#1090' '#1080#1079#1085#1072#1095#1072#1083#1100#1085#1086' '#1086#1079#1074#1091#1095#1077#1085#1085#1086#1081' '#1089#1091#1084#1084#1099'!!!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object BitBtn2: TBitBtn
    Left = 300
    Top = 260
    Width = 110
    Height = 25
    Anchors = [akBottom]
    Caption = #1054#1050
    Default = True
    TabOrder = 0
    OnClick = BitBtn2Click
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 60
    Width = 711
    Height = 197
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.srSpisArtCena
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'names'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 419
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ostat'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1054#1089#1090#1072#1090'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ostatup'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1054#1089#1090#1072#1090'. '#1091#1087'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cena'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cenaup'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072' '#1091#1087'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 69
        Visible = True
      end>
  end
end
