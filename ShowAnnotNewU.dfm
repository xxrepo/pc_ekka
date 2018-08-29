object ShowAnnotNewF: TShowAnnotNewF
  Left = 484
  Top = 174
  Width = 964
  Height = 698
  Caption = 'ShowAnnotNewF'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnPaint = FormPaint
  DesignSize = (
    956
    671)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 5
    Top = 34
    Width = 947
    Height = 633
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      947
      633)
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 944
      Height = 630
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 0
      object WebBrowser1: TWebBrowser
        Left = 0
        Top = 0
        Width = 944
        Height = 630
        Align = alClient
        TabOrder = 0
        ControlData = {
          4C000000916100001D4100000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 10
    Top = 5
    Width = 171
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100' '#1072#1085#1085#1086#1090#1072#1094#1080#1080
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
