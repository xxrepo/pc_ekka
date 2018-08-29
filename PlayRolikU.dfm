object PlayRolikF: TPlayRolikF
  Left = 789
  Top = 443
  BorderStyle = bsDialog
  Caption = 'PlayRolikF'
  ClientHeight = 84
  ClientWidth = 339
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 10
    Width = 191
    Height = 67
    Caption = ' '#1043#1088#1086#1084#1082#1086#1089#1090#1100' '
    TabOrder = 0
    object tbVolume: TTrackBar
      Left = 20
      Top = 20
      Width = 150
      Height = 34
      Max = 65535
      Position = 65535
      TabOrder = 0
      ThumbLength = 17
      TickStyle = tsManual
      OnChange = tbVolumeChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 205
    Top = 10
    Width = 126
    Height = 67
    Caption = ' '#1055#1088#1086#1080#1075#1088#1099#1074#1072#1090#1077#1083#1100' '
    TabOrder = 1
    object mpMain: TMediaPlayer
      Left = 34
      Top = 24
      Width = 57
      Height = 30
      VisibleButtons = [btPlay, btPause]
      AutoEnable = False
      FileName = 'D:\AVA\Rolik\'#1056#1086#1083#1080#1082'.mp3'
      TabOrder = 0
      OnClick = mpMainClick
    end
  end
end
