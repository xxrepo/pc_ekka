object ScanBoxF: TScanBoxF
  Left = 613
  Top = 252
  BorderStyle = bsDialog
  Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1103#1097#1080#1082#1086#1074
  ClientHeight = 463
  ClientWidth = 497
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
    Left = 8
    Top = 136
    Width = 229
    Height = 32
    Caption = #1071#1097#1080#1082#1086#1074' '#1074' '#1084#1072#1096#1080#1085#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 344
    Width = 181
    Height = 32
    Caption = #1071#1097#1080#1082#1086#1074' '#1089#1076#1072#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 280
    Top = 80
    Width = 176
    Height = 178
    Caption = '....'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -160
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 280
    Top = 264
    Width = 176
    Height = 178
    Caption = '....'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -160
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 8
    Width = 63
    Height = 24
    Caption = 'Label5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 184
    Top = 38
    Width = 0
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
    OnKeyUp = Edit1KeyUp
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 8
    Top = 71
  end
end
