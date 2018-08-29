object ReturnToProviderF: TReturnToProviderF
  Left = 768
  Top = 141
  Width = 960
  Height = 689
  Caption = 'ReturnToProviderF'
  Color = clBtnFace
  Constraints.MinHeight = 689
  Constraints.MinWidth = 960
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 372
    Width = 952
    Height = 4
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel2: TPanel
    Left = 0
    Top = 635
    Width = 952
    Height = 27
    Align = alBottom
    AutoSize = True
    TabOrder = 0
    object bbClose: TBitBtn
      Left = 857
      Top = 1
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 2
      OnClick = bbCloseClick
      Kind = bkClose
    end
    object bbCreateOrder: TBitBtn
      Left = 1
      Top = 1
      Width = 221
      Height = 25
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1074#1086#1079#1074#1088#1072#1090#1085#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      TabOrder = 0
      OnClick = bbCreateOrderClick
    end
    object bbCreateClaime: TBitBtn
      Left = 224
      Top = 1
      Width = 157
      Height = 25
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1077#1090#1077#1085#1079#1080#1102
      TabOrder = 1
      OnClick = bbCreateClaimeClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 952
    Height = 372
    Align = alClient
    TabOrder = 1
    object DBGrid2: TDBGrid
      Left = 1
      Top = 97
      Width = 950
      Height = 246
      Align = alClient
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = DBGrid2KeyPress
      OnKeyUp = DBGrid2KeyUp
      OnTitleClick = DBGrid2TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'art_code'
          Title.Caption = #1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'names'
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 395
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ostat'
          Title.Caption = #1054#1089#1090#1072#1090#1086#1082
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'isscan'
          Title.Caption = #1050#1086#1083'. '#1089#1082#1072#1085'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena'
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CenaZakup'
          Title.Caption = #1047#1072#1082#1091#1087#1082#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nds'
          Title.Caption = #1053#1044#1057
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NumSeriya'
          Title.Caption = #1057#1077#1088#1080#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SrokGodn'
          Title.Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 67
          Visible = True
        end>
    end
    object Panel5: TPanel
      Left = 1
      Top = 343
      Width = 950
      Height = 28
      Align = alBottom
      AutoSize = True
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 1
        Top = 2
        Width = 165
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088' '#1082' '#1074#1086#1079#1074#1088#1072#1090#1091
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 173
        Top = 2
        Width = 113
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1086#1079#1074#1088#1072#1090
        TabOrder = 1
        OnClick = BitBtn2Click
      end
      object BitBtn4: TBitBtn
        Left = 292
        Top = 2
        Width = 106
        Height = 25
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1086#1079#1074#1088#1072#1090
        TabOrder = 2
        OnClick = BitBtn4Click
      end
      object BitBtn3: TBitBtn
        Left = 404
        Top = 1
        Width = 106
        Height = 25
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        TabOrder = 3
        OnClick = BitBtn3Click
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 950
      Height = 96
      Align = alTop
      TabOrder = 2
      object Label12: TLabel
        Left = 10
        Top = 40
        Width = 192
        Height = 16
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 10
        Top = 59
        Width = 76
        Height = 13
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082': '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPostavschik: TLabel
        Left = 86
        Top = 59
        Width = 611
        Height = 13
        AutoSize = False
        Caption = 'lblPostavschik'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 10
        Top = 75
        Width = 82
        Height = 13
        Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103' '#8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNaklNomber: TLabel
        Left = 94
        Top = 75
        Width = 271
        Height = 13
        AutoSize = False
        Caption = 'lblNaklNomber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 370
        Top = 75
        Width = 22
        Height = 13
        Caption = ' '#1086#1090' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNaklDate: TLabel
        Left = 394
        Top = 75
        Width = 175
        Height = 13
        AutoSize = False
        Caption = 'lblNaklDate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 10
        Top = 4
        Width = 176
        Height = 16
        Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1103#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 10
        Top = 23
        Width = 82
        Height = 13
        Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103' '#8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblnn_nakl: TLabel
        Left = 94
        Top = 23
        Width = 271
        Height = 13
        AutoSize = False
        Caption = 'lblnn_nakl'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 370
        Top = 23
        Width = 22
        Height = 13
        Caption = ' '#1086#1090' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbldt_nakl: TLabel
        Left = 394
        Top = 23
        Width = 175
        Height = 13
        AutoSize = False
        Caption = 'lbldt_nakl'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 376
    Width = 952
    Height = 259
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid3: TDBGrid
      Left = 0
      Top = 0
      Width = 952
      Height = 259
      Align = alClient
      DataSource = DataSource3
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Art_code'
          Title.Caption = #1040#1088#1090#1082#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'names'
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 298
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena'
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena_zakup'
          Title.Caption = #1047#1072#1082#1091#1087'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nds'
          Title.Caption = #1053#1044#1057
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 31
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vzdescr'
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 199
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pr_vz'
          Title.Caption = #1055#1088'.'#1074#1086#1079#1088'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NumSeriya'
          Title.Caption = #1057#1077#1088#1080#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SrokGodn'
          Title.Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 67
          Visible = True
        end>
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 176
    Top = 263
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 224
    Top = 263
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 84
    Top = 416
  end
  object ADOQuery3: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 112
    Top = 412
  end
  object aTmp: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 704
    Top = 443
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = DM.ADOCo
    ProcedureName = 'spY_WriteVozvrat'
    Parameters = <>
    Left = 212
    Top = 571
  end
end
