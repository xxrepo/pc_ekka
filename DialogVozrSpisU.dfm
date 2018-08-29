object DialogVozrSpisF: TDialogVozrSpisF
  Left = 431
  Top = 275
  BorderStyle = bsDialog
  Caption = 'DialogVozrSpisF'
  ClientHeight = 377
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    430
    377)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 1
    Width = 428
    Height = 255
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 181
      Top = 5
      Width = 90
      Height = 18
      Caption = #1042#1085#1080#1084#1072#1085#1080#1077' !'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 5
      Top = 25
      Width = 416
      Height = 41
      AutoSize = False
      Caption = #1055#1086' '#1082#1085#1086#1087#1082#1077' 1. '#1074#1086#1079#1074#1088#1072#1090' '#1089#1092#1086#1084#1080#1088#1091#1077#1090#1089#1103' '#1087#1086#1083#1085#1086#1089#1090#1100#1102' '#1087#1086' '#1074#1089#1077#1084#1091' '#1089#1087#1080#1089#1082#1091'.'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      WordWrap = True
    end
    object Label3: TLabel
      Left = 5
      Top = 75
      Width = 416
      Height = 76
      AutoSize = False
      Caption = 
        #1055#1086' '#1082#1085#1086#1087#1082#1077' 2. '#1074#1086#1079#1074#1088#1072#1090' '#1089#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1087#1086' '#1086#1090#1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1084' '#1087#1086#1079#1080 +
        #1094#1080#1103#1084', '#1072' '#1086#1089#1090#1072#1083#1100#1085#1099#1077' '#1084#1086#1078#1085#1086' '#1073#1091#1076#1077#1090' '#1086#1090#1089#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1079#1078#1077', '#1086#1090#1082#1088#1099#1074' '#1079#1072#1085#1086#1074#1086 +
        ' '#1086#1082#1085#1086' '#1089' "'#1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1074#1086#1079#1074#1088#1072#1090#1072' '#1087#1086' '#1089#1087#1080#1089#1082#1091'"'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      WordWrap = True
    end
    object Label4: TLabel
      Left = 5
      Top = 160
      Width = 416
      Height = 61
      AutoSize = False
      Caption = 
        #1055#1086' '#1082#1085#1086#1087#1082#1077' 3. '#1074#1086#1079#1074#1088#1072#1090' '#1085#1077' '#1089#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1074#1086#1086#1073#1097#1077', '#1086#1082#1085#1086' '#1079#1072#1082#1088#1086#1077#1090#1089#1103' '#1080' '#1074#1089 +
        #1077' '#1095#1090#1086' '#1073#1099#1083#1086' '#1086#1090#1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1086' '#1080' '#1085#1077' '#1086#1090#1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1086' '#1086#1090#1084#1077#1085#1080#1090#1089#1103'.'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      WordWrap = True
    end
    object Label5: TLabel
      Left = 5
      Top = 225
      Width = 416
      Height = 21
      AutoSize = False
      Caption = #1055#1086' '#1082#1085#1086#1087#1082#1077' 4. '#1090#1077#1082#1091#1097#1077#1077' '#1086#1082#1085#1086' '#1087#1088#1086#1089#1090#1086' '#1079#1072#1082#1088#1086#1077#1090#1089#1103'.'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      WordWrap = True
    end
  end
  object BitBtn1: TBitBtn
    Left = 100
    Top = 259
    Width = 231
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '1. '#1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1074#1086#1079#1074#1088#1072#1090' '#1087#1086#1083#1085#1086#1089#1090#1100#1102
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 7
    Top = 289
    Width = 416
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '2. '#1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1074#1086#1079#1074#1088#1072#1090' '#1090#1086#1083#1100#1082#1086' '#1087#1086' '#1086#1090#1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1084' '#1087#1086#1079#1080#1094#1080#1103#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 110
    Top = 319
    Width = 211
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '3. '#1053#1077' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1074#1086#1079#1074#1088#1072#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 142
    Top = 350
    Width = 146
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = '4. '#1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn4Click
  end
end
