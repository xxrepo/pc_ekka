object ClaimesF: TClaimesF
  Left = 1375
  Top = 117
  Width = 324
  Height = 186
  Caption = 'ClaimesF'
  Color = clBtnFace
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
  object pnlFilter: TPanel
    Left = 0
    Top = 0
    Width = 297
    Height = 57
    Caption = 'pnlFilter'
    TabOrder = 0
    object lbDateFrom: TLabel
      Left = 4
      Top = 4
      Width = 94
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1088#1077#1090#1077#1085#1079#1080#1081' '#1089' '
    end
    object lbDateTo: TLabel
      Left = 188
      Top = 4
      Width = 18
      Height = 13
      Caption = ' '#1087#1086' '
    end
    object dtDateFrom: TDateTimePicker
      Left = 96
      Top = 4
      Width = 89
      Height = 21
      Date = 43038.613602453700000000
      Time = 43038.613602453700000000
      TabOrder = 0
      OnExit = dtDateFromExit
    end
    object dtDateTo: TDateTimePicker
      Left = 204
      Top = 4
      Width = 89
      Height = 21
      Date = 43038.613848020830000000
      Time = 43038.613848020830000000
      TabOrder = 1
      OnExit = dtDateToExit
    end
    object btSendToRemainder: TButton
      Left = 4
      Top = 28
      Width = 117
      Height = 25
      Caption = #1042#1077#1088#1085#1091#1090#1100' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091
      TabOrder = 2
      OnClick = btSendToRemainderClick
    end
    object btUpdate: TButton
      Left = 124
      Top = 28
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 3
      OnClick = btUpdateClick
    end
  end
  object dgClaimes: TDBGrid
    Left = 8
    Top = 60
    Width = 177
    Height = 81
    DataSource = DM.dsClaimes
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = dgClaimesTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'claime_date'
        Title.Caption = #1044#1072#1090#1072' '#1087#1088#1077#1090#1077#1085#1079#1080#1080
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nn_prih'
        Title.Caption = #8470' '#1087#1088#1080#1093'. '#1085#1072#1082#1083'. '#1087#1086#1089#1090#1072#1074'.'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_prih'
        Title.Caption = #1044#1072#1090#1072' '#1087#1088#1080#1093'. '#1085#1072#1082#1083'. '#1087#1086#1089#1090#1072#1074'.'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'art_code'
        Title.Caption = #1040#1088#1090#1082#1086#1076
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'names'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 359
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NDS'
        Title.Caption = #1053#1044#1057
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kol'
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cena'
        Title.Caption = #1062#1077#1085#1072
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cena_with_nds'
        Title.Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'summa'
        Title.Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'summa_with_nds'
        Title.Caption = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cena_zakup'
        Title.Caption = #1062#1077#1085#1072' '#1079#1072#1082#1091#1087#1082#1080
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cena_zakup_with_nds'
        Title.Caption = #1062#1077#1085#1072' '#1079#1072#1082#1091#1087#1082#1080' '#1089' '#1053#1044#1057
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'summa_zakup'
        Title.Caption = #1057#1091#1084#1084#1072' '#1079#1072#1082#1091#1087'.'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'summa_zakup_with_nds'
        Title.Caption = #1057#1091#1084#1084#1072' '#1079#1072#1082#1091#1087'. '#1089' '#1053#1044#1057
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pr_vz'
        Title.Caption = #1055#1088#1080#1095#1080#1085#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VzDescr'
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1082' '#1074#1086#1079#1074#1088#1072#1090#1091
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumSeriya'
        Title.Caption = #1057#1077#1088#1080#1103' '#1090#1086#1074#1072#1088#1072
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SrokGodn'
        Title.Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USERS'
        Title.Caption = #1054#1087#1077#1088#1072#1090#1086#1088
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unloaded'
        Title.Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1086' '#1074' '#1086#1092#1080#1089
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IsSend'
        Title.Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateSendToProvider'
        Title.Caption = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1082#1080
        Visible = True
      end>
  end
  object _dsClaimes: TDataSource
    DataSet = _qClaimes
    Left = 76
    Top = 64
  end
  object _qClaimes: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 112
    Top = 64
  end
  object qTemp: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 200
    Top = 68
  end
end
