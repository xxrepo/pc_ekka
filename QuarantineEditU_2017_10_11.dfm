object QuarantineEditF: TQuarantineEditF
  Left = 1198
  Top = 107
  Width = 436
  Height = 200
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
    Left = 12
    Top = 12
    Width = 40
    Height = 13
    Caption = #1055#1072#1088#1090#1080#1103' '
  end
  object lb_kod_name: TLabel
    Left = 56
    Top = 12
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
    Left = 136
    Top = 12
    Width = 39
    Height = 13
    Caption = #1040#1088#1090#1082#1086#1076' '
  end
  object lb_art_code: TLabel
    Left = 180
    Top = 12
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
    Left = 12
    Top = 40
    Width = 79
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '
  end
  object lb_names: TLabel
    Left = 96
    Top = 40
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
    Left = 268
    Top = 68
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
    Left = 236
    Top = 68
    Width = 27
    Height = 13
    Caption = #1053#1044#1057' '
    Color = clBtnFace
    ParentColor = False
  end
  object lb_cena: TLabel
    Left = 172
    Top = 68
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
    Left = 136
    Top = 68
    Width = 29
    Height = 13
    Caption = #1062#1077#1085#1072' '
    Color = clBtnFace
    ParentColor = False
  end
  object lb_kol1: TLabel
    Left = 12
    Top = 68
    Width = 62
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '
    Color = clBtnFace
    ParentColor = False
  end
  object lb_kol: TLabel
    Left = 80
    Top = 68
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
    Left = 12
    Top = 96
    Width = 34
    Height = 13
    Caption = #1057#1077#1088#1080#1103' '
  end
  object lb_date_seria: TLabel
    Left = 148
    Top = 96
    Width = 77
    Height = 13
    Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080' '
  end
  object ed_seria: TEdit
    Left = 52
    Top = 96
    Width = 41
    Height = 21
    TabOrder = 0
    Text = 'ed_seria'
  end
  object dt_seria: TDateTimePicker
    Left = 228
    Top = 96
    Width = 93
    Height = 21
    Date = 42970.360476736110000000
    Time = 42970.360476736110000000
    TabOrder = 1
  end
  object btSave: TBitBtn
    Left = 130
    Top = 128
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btSaveClick
  end
  object btCancel: TBitBtn
    Left = 214
    Top = 128
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 3
    OnClick = btCancelClick
  end
end
