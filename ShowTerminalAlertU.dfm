object ShowTerminalAlertF: TShowTerminalAlertF
  Left = 487
  Top = 371
  BorderStyle = bsDialog
  Caption = 'ShowTerminalAlertF'
  ClientHeight = 185
  ClientWidth = 489
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
    489
    185)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 1
    Width = 487
    Height = 150
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      487
      150)
    object Label2: TLabel
      Left = 181
      Top = 8
      Width = 125
      Height = 28
      Caption = #1042#1085#1080#1084#1072#1085#1080#1077'!'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 13
      Top = 48
      Width = 462
      Height = 61
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 
        #1042#1099' '#1076#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1086' '#1093#1086#1090#1080#1090#1077' '#1087#1088#1086#1073#1080#1090#1100' '#1095#1077#1082' '#1087#1086' '#1073#1072#1085#1082#1086#1074#1089#1082#1086#1084#1091' '#1090#1077#1088#1084#1080#1085#1072#1083#1083#1091' '#1080#1083 +
        #1080' '#1074#1099' '#1087#1088#1086#1089#1090#1086' '#1087#1077#1088#1077#1087#1091#1090#1072#1083#1080' '#1082#1085#1086#1087#1082#1080'?'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      WordWrap = True
    end
    object Label3: TLabel
      Left = 12
      Top = 118
      Width = 463
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = #1045#1089#1083#1080' '#1074#1099' '#1090#1086#1095#1085#1086' '#1093#1086#1090#1080#1090#1077' '#1087#1088#1086#1073#1080#1090#1100' '#1095#1077#1082' '#1087#1086' '#1090#1077#1088#1084#1080#1085#1072#1083#1083#1091', '#1085#1072#1078#1084#1080#1090#1077' '#1044#1040
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
  end
  object BitBtn1: TBitBtn
    Left = 135
    Top = 157
    Width = 106
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1044#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 247
    Top = 157
    Width = 106
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1053#1077#1090
    Default = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn2Click
  end
end
