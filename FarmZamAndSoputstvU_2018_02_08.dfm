object FarmZamAndSoputstvF: TFarmZamAndSoputstvF
  Left = 1255
  Top = 118
  Width = 454
  Height = 317
  Caption = 'FarmZamAndSoputstvF'
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
  object lbDateFrom: TLabel
    Left = 4
    Top = 4
    Width = 47
    Height = 13
    Caption = #1055#1077#1088#1080#1086#1076' '#1089
  end
  object lbDateTo: TLabel
    Left = 136
    Top = 4
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object lbByMonth: TLabel
    Left = 228
    Top = 4
    Width = 48
    Height = 13
    Caption = #1047#1072' '#1084#1077#1089#1103#1094
  end
  object dtDateFrom: TDateTimePicker
    Left = 52
    Top = 4
    Width = 81
    Height = 21
    Date = 43138.646941458330000000
    Time = 43138.646941458330000000
    TabOrder = 0
  end
  object dtDateTo: TDateTimePicker
    Left = 148
    Top = 4
    Width = 81
    Height = 21
    Date = 43138.647260532410000000
    Time = 43138.647260532410000000
    TabOrder = 1
  end
  object cbByMonth: TComboBox
    Left = 276
    Top = 4
    Width = 81
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = 'cbByMonth'
    OnChange = cbByMonthChange
    Items.Strings = (
      #1071#1085#1074#1072#1088#1100
      #1060#1077#1074#1088#1072#1083#1100
      #1052#1072#1088#1090
      #1040#1087#1088#1077#1083#1100
      #1052#1072#1081
      #1048#1102#1085#1100
      #1048#1102#1083#1100
      #1040#1074#1075#1091#1089#1090
      #1057#1077#1085#1090#1103#1073#1088#1100
      #1054#1082#1090#1103#1073#1088#1100
      #1053#1086#1103#1073#1088#1100
      #1044#1077#1082#1072#1073#1088#1100)
  end
  object btGetStatistics: TButton
    Left = 360
    Top = 4
    Width = 75
    Height = 21
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 3
    OnClick = btGetStatisticsClick
  end
  object dgFarmZamCount: TDBGrid
    Left = 4
    Top = 28
    Width = 320
    Height = 120
    DataSource = DM.srFarmZamCount
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
end
