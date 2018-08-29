object FormDailyOperationSelection: TFormDailyOperationSelection
  Left = 1117
  Top = 111
  AutoSize = True
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1086#1087#1077#1088#1072#1094#1080#1080' '#1087#1086' '#1087#1088#1086#1093#1086#1076#1085#1086#1081
  ClientHeight = 220
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBtns: TPanel
    Left = 0
    Top = 130
    Width = 500
    Height = 90
    Align = alTop
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 130
    Align = alTop
    TabOrder = 1
    object lblSurname: TLabel
      Left = 10
      Top = 0
      Width = 130
      Height = 33
      Caption = #1060#1072#1084#1080#1083#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFirstName: TLabel
      Left = 10
      Top = 35
      Width = 57
      Height = 33
      Caption = #1048#1084#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMiddleName: TLabel
      Left = 10
      Top = 75
      Width = 129
      Height = 33
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Timer1: TTimer
    Interval = 1500
    OnTimer = Timer1Timer
    Left = 224
    Top = 40
  end
  object Timer2: TTimer
    Interval = 30000
    OnTimer = Timer2Timer
    Left = 280
    Top = 40
  end
  object FQuery: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 348
    Top = 44
  end
  object FSProc: TADOStoredProc
    Connection = DM.ADOCo
    Parameters = <>
    Left = 392
    Top = 44
  end
end
