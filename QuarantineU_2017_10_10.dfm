object QuarantineF: TQuarantineF
  Left = 575
  Top = 1
  Width = 640
  Height = 480
  Caption = 'QuarantineF'
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 113
    Width = 624
    Height = 6
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object pnlReturnOrders: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 113
    Align = alTop
    Caption = 'pnlReturnOrders'
    TabOrder = 0
    object Label6: TLabel
      Left = 1
      Top = 1
      Width = 622
      Height = 20
      Align = alTop
      Alignment = taCenter
      Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077' '#1085#1072' '#1090#1086#1074#1072#1088#1099', '#1087#1086#1083#1091#1095#1077#1085#1085#1099#1077' '#1089#1086' '#1089#1082#1083#1072#1076#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbToStockNotification: TLabel
      Left = 1
      Top = 92
      Width = 622
      Height = 20
      Align = alBottom
      Alignment = taCenter
      Caption = #1058#1086#1074#1072#1088#1099' '#1087#1086' '#1101#1090#1080#1084' '#1085#1072#1082#1083#1072#1076#1085#1099#1084' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1077#1088#1085#1091#1090#1100' '#1085#1072' '#1089#1082#1083#1072#1076'!!!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object dgReturnOrders: TDBGrid
      Left = 12
      Top = 28
      Width = 157
      Height = 57
      DataSource = dsReturnOrders
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'NN_NAKL'
          Title.Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATE_NAKL'
          Title.Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
          Visible = True
        end>
    end
  end
  object pnlQuarantine: TPanel
    Left = 12
    Top = 124
    Width = 441
    Height = 205
    Caption = 'pnlQuarantine'
    TabOrder = 1
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 439
      Height = 20
      Align = alTop
      Alignment = taCenter
      Caption = #1058#1086#1074#1072#1088#1099' '#1074' '#1082#1072#1088#1072#1085#1090#1080#1085#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlControlQuarantine: TPanel
      Left = 4
      Top = 164
      Width = 425
      Height = 33
      Caption = 'pnlControlQuarantine'
      TabOrder = 0
      object btCloseQuarantine: TBitBtn
        Left = 324
        Top = 4
        Width = 75
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 3
        OnClick = btCloseQuarantineClick
      end
      object btUpdateQuarantine: TBitBtn
        Left = 116
        Top = 4
        Width = 75
        Height = 25
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        TabOrder = 1
        OnClick = btUpdateQuarantineClick
      end
      object btEditQuarantine: TBitBtn
        Left = 12
        Top = 4
        Width = 101
        Height = 25
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 0
        OnClick = btEditQuarantineClick
      end
      object btReturn: TBitBtn
        Left = 196
        Top = 4
        Width = 121
        Height = 25
        Caption = #1042#1077#1088#1085#1091#1090#1100' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091
        TabOrder = 2
        OnClick = btReturnClick
      end
    end
    object pnlFilterQuarantine: TPanel
      Left = 4
      Top = 28
      Width = 265
      Height = 33
      Caption = 'pnlFilterQuarantine'
      TabOrder = 1
      object lbDateFrom: TLabel
        Left = 8
        Top = 8
        Width = 38
        Height = 13
        Caption = #1044#1072#1090#1072' '#1089' '
      end
      object lbDateTo: TLabel
        Left = 140
        Top = 8
        Width = 18
        Height = 13
        Caption = ' '#1087#1086' '
      end
      object dtDateFrom: TDateTimePicker
        Left = 48
        Top = 8
        Width = 89
        Height = 21
        Date = 43018.470644386570000000
        Time = 43018.470644386570000000
        TabOrder = 0
        OnChange = dtDateFromChange
      end
      object dtDateTo: TDateTimePicker
        Left = 168
        Top = 8
        Width = 89
        Height = 21
        Date = 43018.470823703700000000
        Time = 43018.470823703700000000
        TabOrder = 1
        OnChange = dtDateToChange
      end
    end
    object dgQuarantine: TDBGrid
      Left = 4
      Top = 72
      Width = 421
      Height = 85
      DataSource = DM.dsQuarantine
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'kod_name'
          Title.Caption = #1055#1072#1088#1090#1080#1103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'art_code'
          Title.Caption = #1040#1088#1090#1082#1086#1076
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAMES'
          Title.Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
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
          FieldName = 'seria'
          Title.Caption = #1057#1077#1088#1080#1103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_seria'
          Title.Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
          Visible = True
        end>
    end
  end
  object qTemp: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 100
    Top = 160
  end
  object qReturnOrders: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 64
    Top = 52
  end
  object dsReturnOrders: TDataSource
    DataSet = qReturnOrders
    Left = 36
    Top = 52
  end
end
