object QuarantineF: TQuarantineF
  Left = 1287
  Top = 567
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
  object pnlReturnOrders: TPanel
    Left = 4
    Top = 4
    Width = 593
    Height = 125
    Caption = 'pnlReturnOrders'
    TabOrder = 0
    object Label6: TLabel
      Left = 4
      Top = 4
      Width = 391
      Height = 20
      Alignment = taCenter
      Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077' '#1085#1072' '#1090#1086#1074#1072#1088#1099', '#1087#1086#1083#1091#1095#1077#1085#1085#1099#1077' '#1089#1086' '#1089#1082#1083#1072#1076#1072
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbToStockNotification: TLabel
      Left = 4
      Top = 21
      Width = 512
      Height = 20
      Alignment = taCenter
      Caption = #1058#1086#1074#1072#1088#1099' '#1087#1086' '#1101#1090#1080#1084' '#1085#1072#1082#1083#1072#1076#1085#1099#1084' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1077#1088#1085#1091#1090#1100' '#1085#1072' '#1089#1082#1083#1072#1076'!!!'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dgReturnOrders: TDBGrid
      Left = 16
      Top = 44
      Width = 225
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
      OnDrawColumnCell = dgReturnOrdersDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'NN_NAKL'
          Title.Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATE_NAKL'
          Title.Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
          Width = 90
          Visible = True
        end>
    end
    object dgOrderDetail: TDBGrid
      Left = 264
      Top = 48
      Width = 320
      Height = 61
      DataSource = dsOrderDetail
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ART_CODE'
          Title.Caption = #1040#1088#1090#1082#1086#1076
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAMES'
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KOL'
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CENA'
          Title.Caption = #1062#1077#1085#1072
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NDS'
          Title.Caption = #1053#1044#1057
          Visible = True
        end>
    end
  end
  object pnlQuarantine: TPanel
    Left = 4
    Top = 132
    Width = 441
    Height = 165
    Caption = 'pnlQuarantine'
    TabOrder = 1
    object Label2: TLabel
      Left = 4
      Top = 4
      Width = 172
      Height = 20
      Alignment = taCenter
      Caption = #1058#1086#1074#1072#1088#1099' '#1074' '#1082#1072#1088#1072#1085#1090#1080#1085#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbNotificationReturnToProvider: TLabel
      Left = 4
      Top = 24
      Width = 176
      Height = 13
      Alignment = taCenter
      Caption = 'lbNotificationReturnToProvider'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDateFrom: TLabel
      Left = 4
      Top = 40
      Width = 35
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089
    end
    object lbDateTo: TLabel
      Left = 136
      Top = 40
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object dgQuarantine: TDBGrid
      Left = 4
      Top = 64
      Width = 421
      Height = 61
      DataSource = DM.dsQuarantine
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'dt_record'
          Title.Caption = #1044#1072#1090#1072' '#1082#1072#1088#1072#1085#1090#1080#1085#1072
          Width = 89
          Visible = True
        end
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
    object dtDateFrom: TDateTimePicker
      Left = 44
      Top = 40
      Width = 89
      Height = 21
      Date = 43018.470644386570000000
      Time = 43018.470644386570000000
      TabOrder = 1
      OnChange = dtDateFromChange
    end
    object dtDateTo: TDateTimePicker
      Left = 152
      Top = 40
      Width = 89
      Height = 21
      Date = 43018.470823703700000000
      Time = 43018.470823703700000000
      TabOrder = 2
      OnChange = dtDateToChange
    end
    object btEditQuarantine: TBitBtn
      Left = 4
      Top = 132
      Width = 101
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 3
      OnClick = btEditQuarantineClick
    end
    object btUpdateQuarantine: TBitBtn
      Left = 108
      Top = 132
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 4
      OnClick = btUpdateQuarantineClick
    end
    object btReturn: TBitBtn
      Left = 188
      Top = 132
      Width = 121
      Height = 25
      Caption = #1042#1077#1088#1085#1091#1090#1100' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091
      TabOrder = 5
      OnClick = btReturnClick
    end
    object btCloseQuarantine: TBitBtn
      Left = 316
      Top = 132
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 6
      OnClick = btCloseQuarantineClick
    end
  end
  object qReturnOrders: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 76
    Top = 60
  end
  object dsReturnOrders: TDataSource
    DataSet = qReturnOrders
    Left = 48
    Top = 60
  end
  object dsOrderDetail: TDataSource
    DataSet = qOrderDetail
    Left = 380
    Top = 60
  end
  object qOrderDetail: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 408
    Top = 60
  end
end
