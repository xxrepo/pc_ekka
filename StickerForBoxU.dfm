object StickerForBoxF: TStickerForBoxF
  Left = 266
  Top = 145
  Width = 336
  Height = 297
  Caption = 'StickerForBoxF'
  Color = clBtnFace
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
  object lbApteka: TLabel
    Left = 4
    Top = 4
    Width = 36
    Height = 13
    Caption = #1040#1087#1090#1077#1082#1072
  end
  object lbDateTime: TLabel
    Left = 4
    Top = 28
    Width = 64
    Height = 13
    Caption = #1044#1072#1090#1072'/'#1042#1088#1077#1084#1103
  end
  object lbFIO: TLabel
    Left = 4
    Top = 52
    Width = 36
    Height = 13
    Caption = #1060'.'#1048'.'#1054'.'
  end
  object lbDescr: TLabel
    Left = 4
    Top = 76
    Width = 122
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1075#1086
  end
  object lbCount: TLabel
    Left = 4
    Top = 184
    Width = 175
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1077#1076#1080#1085#1080#1094' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1099
    Visible = False
  end
  object lbBoxNo: TLabel
    Left = 4
    Top = 208
    Width = 47
    Height = 13
    Caption = #8470' '#1103#1097#1080#1082#1072
    Visible = False
  end
  object edApteka: TEdit
    Left = 40
    Top = 4
    Width = 57
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
    Text = 'edApteka'
  end
  object dtDate: TDateTimePicker
    Left = 72
    Top = 28
    Width = 81
    Height = 21
    Date = 43140.684992511570000000
    Time = 43140.684992511570000000
    Color = clBtnFace
    Enabled = False
    TabOrder = 1
  end
  object dtTime: TDateTimePicker
    Left = 156
    Top = 28
    Width = 81
    Height = 21
    Date = 43140.685049097220000000
    Time = 43140.685049097220000000
    Color = clBtnFace
    Enabled = False
    Kind = dtkTime
    TabOrder = 2
  end
  object edFIO: TEdit
    Left = 40
    Top = 52
    Width = 121
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
    Text = 'edFIO'
  end
  object meDescr: TMemo
    Left = 4
    Top = 92
    Width = 185
    Height = 89
    Lines.Strings = (
      'meDescr')
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object edCount: TEdit
    Left = 180
    Top = 184
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '0'
    Visible = False
    OnChange = edCountChange
  end
  object udCount: TUpDown
    Left = 301
    Top = 184
    Width = 16
    Height = 21
    Associate = edCount
    TabOrder = 6
    Visible = False
  end
  object btPrint: TButton
    Left = 4
    Top = 232
    Width = 75
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 9
    OnClick = btPrintClick
  end
  object btClose: TButton
    Left = 80
    Top = 232
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 10
    OnClick = btCloseClick
  end
  object edBoxNo: TEdit
    Left = 52
    Top = 208
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '0'
    Visible = False
    OnChange = edBoxNoChange
  end
  object udBoxNo: TUpDown
    Left = 173
    Top = 208
    Width = 16
    Height = 21
    Associate = edBoxNo
    TabOrder = 8
    Visible = False
  end
end
