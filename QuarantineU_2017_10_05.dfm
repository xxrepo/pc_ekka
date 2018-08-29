object QuarantineF: TQuarantineF
  Left = 1286
  Top = 63
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 294
    Width = 624
    Height = 120
    Align = alBottom
    DataSource = DM.dsQuarantine
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'kod_name'
        Title.Caption = #1055#1072#1088#1090#1080#1103
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'art_code'
        Title.Caption = #1040#1088#1090#1050#1086#1076
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAMES'
        Title.Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clRed
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kol'
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cena'
        Title.Caption = #1062#1077#1085#1072
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'f_nds'
        Title.Caption = #1053#1044#1057
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'seria'
        Title.Caption = #1057#1077#1088#1080#1103
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_seria'
        Title.Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
        Width = 65
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 414
    Width = 624
    Height = 27
    Align = alBottom
    AutoSize = True
    TabOrder = 1
    object btEdit: TBitBtn
      Left = 4
      Top = 1
      Width = 101
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 0
      OnClick = btEditClick
    end
    object btClose: TBitBtn
      Left = 508
      Top = 1
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 4
      OnClick = btCloseClick
    end
    object btUpdate: TBitBtn
      Left = 244
      Top = 1
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 2
      OnClick = btUpdateClick
    end
    object btExtractFromQuarantine: TBitBtn
      Left = 108
      Top = 1
      Width = 133
      Height = 25
      Caption = #1048#1079#1074#1083#1077#1095#1100' '#1080#1079' '#1082#1072#1088#1072#1085#1090#1080#1085#1072
      Enabled = False
      TabOrder = 1
      OnClick = btExtractFromQuarantineClick
    end
    object btReturnToProvider: TBitBtn
      Left = 324
      Top = 1
      Width = 133
      Height = 25
      Caption = #1042#1077#1088#1085#1091#1090#1100' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091
      TabOrder = 3
      OnClick = btReturnToProviderClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 137
    Align = alTop
    TabOrder = 2
    Visible = False
    object lb_kol: TLabel
      Left = 76
      Top = 48
      Width = 75
      Height = 13
      AutoSize = False
      Caption = 'lb_kol'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lb_cena: TLabel
      Left = 200
      Top = 48
      Width = 75
      Height = 13
      AutoSize = False
      Caption = 'lb_cena'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lb_f_nds: TLabel
      Left = 324
      Top = 48
      Width = 75
      Height = 13
      AutoSize = False
      Caption = 'lb_f_nds'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 37
      Height = 13
      Caption = #1055#1072#1088#1090#1080#1103
    end
    object lb_kod_name: TLabel
      Left = 92
      Top = 8
      Width = 150
      Height = 13
      AutoSize = False
      Caption = 'lb_kod_name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 260
      Top = 8
      Width = 37
      Height = 13
      Caption = #1040#1088#1090#1050#1086#1076
    end
    object lb_art_code: TLabel
      Left = 344
      Top = 8
      Width = 150
      Height = 13
      AutoSize = False
      Caption = 'lb_art_code'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 28
      Width = 76
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object lb_names: TLabel
      Left = 92
      Top = 28
      Width = 54
      Height = 13
      Caption = 'lb_names'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 48
      Width = 59
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      Color = clBtnFace
      ParentColor = False
    end
    object Label13: TLabel
      Left = 8
      Top = 72
      Width = 31
      Height = 13
      Caption = #1057#1077#1088#1080#1103
    end
    object Label14: TLabel
      Left = 180
      Top = 72
      Width = 74
      Height = 13
      Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
    end
    object Label9: TLabel
      Left = 164
      Top = 48
      Width = 26
      Height = 13
      Caption = #1062#1077#1085#1072
      Color = clBtnFace
      ParentColor = False
    end
    object Label11: TLabel
      Left = 292
      Top = 48
      Width = 24
      Height = 13
      Caption = #1053#1044#1057
      Color = clBtnFace
      ParentColor = False
    end
    object btSave: TBitBtn
      Left = 276
      Top = 100
      Width = 75
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 2
      OnClick = btSaveClick
    end
    object btCancel: TBitBtn
      Left = 360
      Top = 100
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 3
      OnClick = btCancelClick
    end
    object ed_seria: TEdit
      Left = 48
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'ed_seria'
      OnChange = ed_seriaChange
      OnExit = ed_seriaExit
      OnKeyDown = ed_seriaKeyDown
    end
    object dt_seria: TDateTimePicker
      Left = 260
      Top = 72
      Width = 85
      Height = 21
      Date = 42970.360476736110000000
      Time = 42970.360476736110000000
      TabOrder = 1
      OnChange = dt_seriaChange
      OnExit = dt_seriaExit
      OnKeyDown = dt_seriaKeyDown
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 137
    Width = 624
    Height = 36
    Align = alTop
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 38
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089' '
    end
    object Label4: TLabel
      Left = 140
      Top = 8
      Width = 18
      Height = 13
      Caption = ' '#1087#1086' '
    end
    object dt_from: TDateTimePicker
      Left = 52
      Top = 8
      Width = 85
      Height = 21
      Date = 42970.648848414350000000
      Time = 42970.648848414350000000
      TabOrder = 0
      OnChange = dt_fromChange
    end
    object dt_to: TDateTimePicker
      Left = 160
      Top = 8
      Width = 85
      Height = 21
      Date = 42970.648873796290000000
      Time = 42970.648873796290000000
      TabOrder = 1
      OnChange = dt_toChange
    end
  end
  object qTemp: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 404
    Top = 24
  end
end
