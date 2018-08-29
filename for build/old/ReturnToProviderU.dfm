object ReturnToProviderF: TReturnToProviderF
  Left = 831
  Top = 136
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
    Top = 361
    Width = 944
    Height = 4
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel2: TPanel
    Left = 0
    Top = 624
    Width = 944
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
      TabOrder = 0
      OnClick = bbCloseClick
      Kind = bkClose
    end
    object bbCreateOrder: TBitBtn
      Left = 1
      Top = 1
      Width = 221
      Height = 25
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1074#1086#1079#1074#1088#1072#1090#1085#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      TabOrder = 1
      OnClick = bbCreateOrderClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 944
    Height = 361
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 97
      Width = 942
      Height = 68
      Align = alTop
      Color = 15000284
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
      Columns = <
        item
          Expanded = False
          FieldName = 'nn_nakl'
          Title.Caption = #8470#8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
          Width = 289
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'date_nakl'
          Title.Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'summa'
          Title.Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
          Width = 118
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 1
      Top = 165
      Width = 942
      Height = 168
      Align = alClient
      DataSource = DataSource2
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
          FieldName = 'art_code'
          Title.Caption = #1050#1086#1076
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'names'
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 507
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'isscan'
          Title.Caption = #1050#1086#1083'. '#1089#1082#1072#1085'.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena'
          Title.Caption = #1062#1077#1085#1072
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'f_nds'
          Title.Caption = #1053#1044#1057
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'edname'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'id_postav'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'nn_prih'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'dt_prih'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'koef'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'numseriya'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'srokgodn'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'iddoc'
          Visible = False
        end>
    end
    object Panel5: TPanel
      Left = 1
      Top = 333
      Width = 942
      Height = 27
      Align = alBottom
      AutoSize = True
      TabOrder = 2
      object BitBtn1: TBitBtn
        Left = 1
        Top = 1
        Width = 165
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088' '#1082' '#1074#1086#1079#1074#1088#1072#1090#1091
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 173
        Top = 1
        Width = 113
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1086#1079#1074#1088#1072#1090
        TabOrder = 1
        OnClick = BitBtn2Click
      end
      object BitBtn4: TBitBtn
        Left = 292
        Top = 1
        Width = 106
        Height = 25
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1086#1079#1074#1088#1072#1090
        TabOrder = 2
        OnClick = BitBtn4Click
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 942
      Height = 96
      Align = alTop
      TabOrder = 3
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
    Top = 365
    Width = 944
    Height = 259
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid3: TDBGrid
      Left = 0
      Top = 0
      Width = 944
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
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 120
    Top = 184
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOCo
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    Left = 160
    Top = 184
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
    Left = 200
    Top = 480
  end
  object ADOQuery3: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 228
    Top = 480
  end
  object ADOQuery4: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 208
    Top = 547
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = DM.ADOCo
    ProcedureName = 'spY_WriteVozvrat'
    Parameters = <>
    Left = 196
    Top = 187
  end
end
