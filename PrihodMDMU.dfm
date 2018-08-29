object PrihodMDMF: TPrihodMDMF
  Left = 588
  Top = 234
  BorderStyle = bsDialog
  Caption = 'PrihodMDMF'
  ClientHeight = 415
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 10
    Width = 174
    Height = 13
    Caption = #1048#1044' '#1085#1072#1082#1083#1072#1076#1085#1086#1081' '#1074' '#1091#1095#1077#1090#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1077':'
  end
  object Label2: TLabel
    Left = 5
    Top = 40
    Width = 94
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081':'
  end
  object Label3: TLabel
    Left = 210
    Top = 40
    Width = 86
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081':'
  end
  object Label4: TLabel
    Left = 285
    Top = 10
    Width = 79
    Height = 13
    Caption = #1058#1080#1087' '#1085#1072#1082#1083#1072#1076#1085#1086#1081':'
  end
  object Label5: TLabel
    Left = 5
    Top = 70
    Width = 132
    Height = 13
    Caption = #1050#1086#1076' '#1054#1088#1075'-'#1094#1080#1080' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103':'
  end
  object Label6: TLabel
    Left = 5
    Top = 100
    Width = 163
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1054#1088#1075'-'#1094#1080#1080' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103':'
  end
  object Label7: TLabel
    Left = 5
    Top = 130
    Width = 125
    Height = 13
    Caption = #1050#1086#1076' '#1054#1088#1075'-'#1094#1080#1080' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103':'
  end
  object Label8: TLabel
    Left = 5
    Top = 160
    Width = 156
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1054#1088#1075'-'#1094#1080#1080' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103':'
  end
  object Label9: TLabel
    Left = 5
    Top = 190
    Width = 93
    Height = 13
    Caption = #1064#1090#1088#1080#1093' '#1082#1086#1076' '#1090#1086#1074#1072#1088#1072':'
  end
  object Label10: TLabel
    Left = 200
    Top = 190
    Width = 37
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086':'
  end
  object Label11: TLabel
    Left = 5
    Top = 255
    Width = 55
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090':'
  end
  object Edit1: TEdit
    Left = 185
    Top = 7
    Width = 86
    Height = 21
    TabOrder = 0
  end
  object edNakl: TEdit
    Left = 100
    Top = 37
    Width = 101
    Height = 21
    TabOrder = 1
  end
  object dtNakl: TDateTimePicker
    Left = 300
    Top = 37
    Width = 86
    Height = 21
    Date = 41289.428348287040000000
    Time = 41289.428348287040000000
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 366
    Top = 6
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 3
    Text = #1055#1086#1089#1090#1072#1074#1082#1072
    Items.Strings = (
      #1055#1086#1089#1090#1072#1074#1082#1072
      #1042#1086#1079#1074#1088#1072#1090' '#1044#1080#1089#1090#1088#1080#1073#1100#1102#1090#1086#1088#1091
      #1042#1086#1079#1074#1088#1072#1090' '#1055#1086#1082#1091#1087#1072#1090#1077#1083#1103)
  end
  object Edit2: TEdit
    Left = 140
    Top = 67
    Width = 91
    Height = 21
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 170
    Top = 97
    Width = 216
    Height = 21
    TabOrder = 5
  end
  object Edit4: TEdit
    Left = 140
    Top = 127
    Width = 91
    Height = 21
    TabOrder = 6
  end
  object Edit5: TEdit
    Left = 170
    Top = 157
    Width = 216
    Height = 21
    TabOrder = 7
  end
  object Edit6: TEdit
    Left = 100
    Top = 187
    Width = 91
    Height = 21
    TabOrder = 8
  end
  object Edit7: TEdit
    Left = 240
    Top = 187
    Width = 146
    Height = 21
    TabOrder = 9
  end
  object BitBtn1: TBitBtn
    Left = 5
    Top = 220
    Width = 101
    Height = 25
    Caption = #1054#1087#1088#1080#1093#1086#1076#1086#1074#1072#1090#1100
    TabOrder = 10
    OnClick = BitBtn1Click
  end
  object Memo1: TMemo
    Left = 5
    Top = 270
    Width = 509
    Height = 139
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 11
    WordWrap = False
  end
end
