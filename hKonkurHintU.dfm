object hKonkurHintF: ThKonkurHintF
  Left = 669
  Top = 329
  BorderStyle = bsNone
  Caption = 'hKonkurHintF'
  ClientHeight = 112
  ClientWidth = 566
  Color = 12186365
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnHide = FormHide
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 566
    Height = 112
    Align = alClient
  end
  object Label1: TLabel
    Left = 5
    Top = 30
    Width = 556
    Height = 76
    AutoSize = False
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    WordWrap = True
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 6000
    OnTimer = Timer1Timer
    Left = 110
    Top = 25
  end
end
