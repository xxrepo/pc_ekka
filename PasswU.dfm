object PasswF: TPasswF
  Left = 473
  Top = 347
  BorderStyle = bsToolWindow
  Caption = 'PasswF'
  ClientHeight = 70
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 45
    Width = 49
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 5
    Top = 5
    Width = 332
    Height = 26
    AutoSize = False
    Caption = 
      #1045#1089#1083#1080' '#1074#1099' '#1079#1085#1072#1077#1090#1077' '#1087#1072#1088#1086#1083#1100' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072', '#1090#1086' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1077#1075#1086' '#1076#1083#1103' '#1074#1088#1077 +
      #1084#1084#1077#1085#1086#1075#1086' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1087#1086#1083#1085#1086#1075#1086' '#1076#1086#1089#1090#1091#1087#1072'.'
    WordWrap = True
  end
  object Edit1: TEdit
    Left = 57
    Top = 42
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    OnKeyDown = Edit1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 185
    Top = 40
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 265
    Top = 40
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
