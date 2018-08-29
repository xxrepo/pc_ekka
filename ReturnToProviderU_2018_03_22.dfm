object ReturnToProviderF: TReturnToProviderF
  Left = 674
  Top = 347
  Width = 510
  Height = 375
  Caption = 'ReturnToProviderF'
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
  object pnlNakl: TPanel
    Left = 4
    Top = 4
    Width = 353
    Height = 105
    Caption = 'pnlNakl'
    TabOrder = 0
    object lbInternalOrder: TLabel
      Left = 4
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
    object lbInternalOrderNumb: TLabel
      Left = 4
      Top = 20
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
    object lbProvider: TLabel
      Left = 4
      Top = 52
      Width = 72
      Height = 13
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbProviderOrderN: TLabel
      Left = 4
      Top = 68
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
    object lbInternalOrderDate: TLabel
      Left = 192
      Top = 20
      Width = 14
      Height = 13
      Caption = #1086#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbProviderOrderD: TLabel
      Left = 212
      Top = 68
      Width = 14
      Height = 13
      Caption = #1086#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbIntern_NN_Nakl: TLabel
      Left = 88
      Top = 20
      Width = 102
      Height = 13
      Caption = 'lbIntern_NN_Nakl'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbIntern_Date_Nakl: TLabel
      Left = 208
      Top = 20
      Width = 111
      Height = 13
      Caption = 'lbIntern_Date_Nakl'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbProviderName: TLabel
      Left = 76
      Top = 52
      Width = 90
      Height = 13
      Caption = 'lbProviderName'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbProviderOrderNumb: TLabel
      Left = 88
      Top = 68
      Width = 121
      Height = 13
      Caption = 'lbProviderOrderNumb'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbProviderOrderDate: TLabel
      Left = 228
      Top = 68
      Width = 116
      Height = 13
      Caption = 'lbProviderOrderDate'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbProviderInfo: TLabel
      Left = 4
      Top = 36
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
    object lbWarning: TLabel
      Left = 4
      Top = 84
      Width = 58
      Height = 13
      Alignment = taCenter
      Caption = 'lbWarning'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
  end
  object pnlInternalNakl: TPanel
    Left = 4
    Top = 116
    Width = 477
    Height = 113
    Caption = 'pnlInternalNakl'
    TabOrder = 1
    object dgInternalNakl: TDBGrid
      Left = 8
      Top = 4
      Width = 117
      Height = 69
      DataSource = dsInternalNakl
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = dgInternalNaklKeyPress
      OnKeyUp = dgInternalNaklKeyUp
      OnTitleClick = dgInternalNaklTitleClick
    end
    object btAddToReturn: TButton
      Left = 8
      Top = 76
      Width = 161
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088' '#1082' '#1074#1086#1079#1074#1088#1072#1090#1091
      TabOrder = 1
      OnClick = btAddToReturnClick
    end
    object btCancelReturn: TButton
      Left = 172
      Top = 76
      Width = 109
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1086#1079#1074#1088#1072#1090
      TabOrder = 2
      OnClick = btCancelReturnClick
    end
    object btClearReturn: TButton
      Left = 284
      Top = 76
      Width = 109
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1086#1079#1074#1088#1072#1090
      TabOrder = 3
      OnClick = btClearReturnClick
    end
    object btUpdateReturn: TButton
      Left = 396
      Top = 76
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 4
      OnClick = btUpdateReturnClick
    end
  end
  object pnlPreparedOrder: TPanel
    Left = 4
    Top = 236
    Width = 477
    Height = 89
    Caption = 'pnlPreparedOrder'
    TabOrder = 2
    object dgPreparedOrder: TDBGrid
      Left = 4
      Top = 4
      Width = 109
      Height = 49
      DataSource = dsPreparedOrder
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object btCreateOrder: TButton
      Left = 4
      Top = 56
      Width = 217
      Height = 25
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1074#1086#1079#1074#1088#1072#1090#1085#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      TabOrder = 1
      OnClick = btCreateOrderClick
    end
    object btCreateClaim: TButton
      Left = 224
      Top = 56
      Width = 153
      Height = 25
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1077#1090#1077#1085#1079#1080#1102
      TabOrder = 2
      OnClick = btCreateClaimClick
    end
    object btClose: TButton
      Left = 380
      Top = 56
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 3
      OnClick = btCloseClick
    end
  end
  object dsPreparedOrder: TDataSource
    DataSet = qPreparedOrder
    Left = 128
    Top = 244
  end
  object qPreparedOrder: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 176
    Top = 244
  end
  object dsInternalNakl: TDataSource
    DataSet = qInternalNakl
    Left = 236
    Top = 136
  end
  object qInternalNakl: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 276
    Top = 136
  end
end
