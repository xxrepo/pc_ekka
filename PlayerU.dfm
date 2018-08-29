object PlayerF: TPlayerF
  Left = 564
  Top = 345
  Width = 592
  Height = 97
  Caption = 'PlayerF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    584
    70)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 3
    Top = 0
    Width = 191
    Height = 67
    Anchors = [akLeft, akBottom]
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
    Left = 199
    Top = 0
    Width = 382
    Height = 67
    Anchors = [akLeft, akRight, akBottom]
    Caption = ' '#1055#1088#1086#1080#1075#1088#1099#1074#1072#1090#1077#1083#1100' '
    TabOrder = 1
    DesignSize = (
      382
      67)
    object mpMain: TMediaPlayer
      Left = 100
      Top = 22
      Width = 181
      Height = 30
      VisibleButtons = [btPlay, btPause, btStop, btNext, btBack]
      Anchors = [akTop]
      Display = gbEkran
      FileName = 'S:\Musi'#1089'\modern_talking_-_mrs._robota.mp3'
      TabOrder = 0
    end
  end
  object gbEkran: TGroupBox
    Left = 5
    Top = 5
    Width = 576
    Height = 0
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' '#1042#1080#1076#1077#1086' '
    TabOrder = 2
    Visible = False
    DesignSize = (
      576
      0)
    object pnEkran: TPanel
      Left = 5
      Top = 15
      Width = 566
      Height = 0
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 0
    end
  end
end
