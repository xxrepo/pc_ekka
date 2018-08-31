object QuarantineEditF: TQuarantineEditF
  Left = 1641
  Top = 383
  Width = 286
  Height = 180
  Caption = 'QuarantineEditF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lb_kod_name1: TLabel
    Left = 4
    Top = 4
    Width = 40
    Height = 13
    Caption = #1055#1072#1088#1090#1080#1103' '
  end
  object lb_kod_name: TLabel
    Left = 44
    Top = 4
    Width = 76
    Height = 13
    AutoSize = False
    Caption = 'lb_kod_name'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lb_art_code1: TLabel
    Left = 120
    Top = 4
    Width = 39
    Height = 13
    Caption = #1040#1088#1090#1082#1086#1076' '
  end
  object lb_art_code: TLabel
    Left = 160
    Top = 4
    Width = 68
    Height = 13
    Caption = 'lb_art_code'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lb_names1: TLabel
    Left = 4
    Top = 20
    Width = 79
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '
  end
  object lb_names: TLabel
    Left = 84
    Top = 20
    Width = 54
    Height = 13
    Caption = 'lb_names'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object lb_f_nds: TLabel
    Left = 212
    Top = 36
    Width = 49
    Height = 13
    AutoSize = False
    Caption = 'lb_f_nds'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lb_f_nds1: TLabel
    Left = 184
    Top = 36
    Width = 27
    Height = 13
    Caption = #1053#1044#1057' '
    Color = clBtnFace
    ParentColor = False
  end
  object lb_cena: TLabel
    Left = 136
    Top = 36
    Width = 46
    Height = 13
    Caption = 'lb_cena'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lb_cena1: TLabel
    Left = 104
    Top = 36
    Width = 29
    Height = 13
    Caption = #1062#1077#1085#1072' '
    Color = clBtnFace
    ParentColor = False
  end
  object lb_kol1: TLabel
    Left = 4
    Top = 36
    Width = 62
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '
    Color = clBtnFace
    ParentColor = False
  end
  object lb_kol: TLabel
    Left = 68
    Top = 36
    Width = 35
    Height = 13
    AutoSize = False
    Caption = 'lb_kol'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lb_seria: TLabel
    Left = 4
    Top = 72
    Width = 34
    Height = 13
    Caption = #1057#1077#1088#1080#1103' '
  end
  object lb_date_seria: TLabel
    Left = 104
    Top = 72
    Width = 77
    Height = 13
    Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080' '
  end
  object dt_seria: TDateTimePicker
    Left = 184
    Top = 72
    Width = 81
    Height = 21
    Date = 42970.360476736110000000
    Time = 42970.360476736110000000
    TabOrder = 2
  end
  object btSave: TBitBtn
    Left = 4
    Top = 96
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 3
    OnClick = btSaveClick
  end
  object btCancel: TBitBtn
    Left = 80
    Top = 96
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 4
    OnClick = btCancelClick
  end
  object chSeriaIsAbsent: TCheckBox
    Left = 4
    Top = 52
    Width = 177
    Height = 17
    Caption = #1057#1077#1088#1080#1103' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' '#1085#1072' '#1086#1089#1090#1072#1090#1082#1077
    TabOrder = 0
    OnClick = chSeriaIsAbsentClick
  end
  object cbSeria: TComboBox
    Left = 40
    Top = 72
    Width = 61
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'cbSeria'
    OnChange = cbSeriaChange
  end
  object cbSeria_Srok: TComboBox
    Left = 136
    Top = 100
    Width = 65
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Text = 'cbSeria_Srok'
    Visible = False
  end
  object cbSeria_KodName: TComboBox
    Left = 200
    Top = 100
    Width = 65
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'cbSeria_KodName'
    Visible = False
  end
end
