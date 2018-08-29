object FTmp_change_employee: TFTmp_change_employee
  Left = 799
  Top = 159
  BorderStyle = bsDialog
  Caption = #1042#1088#1077#1084#1077#1085#1085#1072#1103' '#1079#1072#1084#1077#1085#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
  ClientHeight = 672
  ClientWidth = 786
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    786
    672)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_title: TLabel
    Left = 188
    Top = 20
    Width = 374
    Height = 24
    Caption = #1047#1072#1103#1074#1082#1072' '#1085#1072' '#1074#1088#1077#1084#1077#1085#1085#1091#1102' '#1079#1072#1084#1077#1085#1091' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl_apteka: TLabel
    Left = 40
    Top = 88
    Width = 63
    Height = 20
    Caption = #1040#1087#1090#1077#1082#1072': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl_employee: TLabel
    Left = 40
    Top = 148
    Width = 309
    Height = 20
    Caption = #1055#1088#1086#1089#1080#1084' '#1074#1088#1077#1084#1077#1085#1085#1086' '#1079#1072#1084#1077#1085#1080#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl_period: TLabel
    Left = 40
    Top = 196
    Width = 120
    Height = 20
    Caption = #1055#1077#1088#1080#1086#1076' '#1079#1072#1084#1077#1085#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl_date_begin: TLabel
    Left = 40
    Top = 236
    Width = 97
    Height = 20
    Caption = #1076#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl_date_end: TLabel
    Left = 40
    Top = 276
    Width = 246
    Height = 20
    Caption = #1076#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' ('#1077#1089#1083#1080' '#1080#1079#1074#1077#1089#1090#1085#1072')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl_time_of_absent: TLabel
    Left = 40
    Top = 360
    Width = 560
    Height = 20
    Caption = 
      #1087#1088#1077#1076#1087#1086#1083#1072#1075#1072#1077#1084#1072#1103' '#1076#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1086#1090#1089#1091#1090#1089#1090#1074#1080#1103' '#1086#1089#1085#1086#1074#1085#1086#1075#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' ('#1076#1085#1077 +
      #1081')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl_change_reason: TLabel
    Left = 40
    Top = 408
    Width = 127
    Height = 20
    Caption = #1055#1088#1080#1095#1080#1085#1072' '#1079#1072#1084#1077#1085#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl_declaration_1: TLabel
    Left = 40
    Top = 464
    Width = 1044
    Height = 24
    Caption = 
      #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080' '#1087#1088#1077#1076#1091#1087#1088#1077#1078#1076#1077#1085#1099', '#1095#1090#1086' '#1087#1086' '#1086#1082#1086#1085#1095#1072#1085#1080#1080' '#1088#1072#1073#1086#1090#1099' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072' '#1080#1079' ' +
      #1076#1088#1091#1075#1086#1081' '#1072#1087#1090#1077#1082#1080' '#1055#1045#1056#1045#1059#1063#1045#1058' '#1053#1045' '#1055#1056#1054#1042#1054#1044#1048#1058#1057#1071
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl_declaration_2: TLabel
    Left = 40
    Top = 558
    Width = 580
    Height = 24
    Caption = #1042#1089#1103' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100' '#1079#1072' '#1089#1086#1093#1088#1072#1085#1085#1086#1089#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083#1100#1085#1099#1093' '#1094#1077#1085#1085#1086#1089#1090#1077#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl_apteka_name: TLabel
    Left = 128
    Top = 88
    Width = 4
    Height = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl_or: TLabel
    Left = 40
    Top = 332
    Width = 28
    Height = 20
    Caption = #1080#1083#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object CheckBox_date_end: TCheckBox
    Left = 40
    Top = 304
    Width = 233
    Height = 17
    Caption = #1086#1090#1084#1077#1090#1080#1090#1100' '#1077#1089#1083#1080' '#1080#1079#1074#1077#1089#1090#1085#1072' '#1076#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
    TabOrder = 2
    OnClick = CheckBox_date_endClick
  end
  object CB_employee: TComboBox
    Left = 372
    Top = 148
    Width = 269
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
  object DTP_begin: TDateTimePicker
    Left = 288
    Top = 236
    Width = 101
    Height = 21
    Date = 42992.724621400460000000
    Time = 42992.724621400460000000
    TabOrder = 1
  end
  object DTP_end: TDateTimePicker
    Left = 288
    Top = 300
    Width = 101
    Height = 21
    Date = 42992.724621400460000000
    Time = 42992.724621400460000000
    Enabled = False
    TabOrder = 3
  end
  object ed_time_of_absent: TEdit
    Left = 608
    Top = 360
    Width = 85
    Height = 21
    TabOrder = 4
    OnKeyPress = ed_time_of_absentKeyPress
  end
  object ed_change_reason: TEdit
    Left = 172
    Top = 408
    Width = 605
    Height = 21
    TabOrder = 5
  end
  object btn_Report: TButton
    Left = 177
    Top = 642
    Width = 121
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1077#1095#1072#1090#1100' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
    TabOrder = 6
    OnClick = btn_ReportClick
  end
  object BitBtn1: TBitBtn
    Left = 5
    Top = 642
    Width = 166
    Height = 25
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
    TabOrder = 7
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 671
    Top = 641
    Width = 110
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = BitBtn2Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000D40E0000D40E00001000000010000000000059002424
      500026266900FF0000000101BD002929AF005D5DBB000707C8002828CA000000
      F5002626F4006161D300A4A4D500D1D1DA00D7D7F200E3E3E400333E20000001
      F33333E8744444441F333E874474444441F3E87844578578741F84DEC5C4EEBD
      844194EBC8D4FBCCB44077BBC8D4FBCCFC40947BC5D4FBCD6C40746F88D4FBCC
      BD4094DB88D4FBCCBD4094EBC7E4FBCCBD40A7CECCF6DDBEDC42EA8888888878
      B45F3EA74444444445E333EA777777745F33333EA9999995E333}
  end
  object ADOQ_tmp: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 108
    Top = 48
  end
end
