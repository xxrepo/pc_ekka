object ShowZpMessF: TShowZpMessF
  Left = 638
  Top = 224
  BorderStyle = bsDialog
  Caption = 'ShowZpMessF'
  ClientHeight = 546
  ClientWidth = 683
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
    683
    546)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 5
    Width = 681
    Height = 506
    Caption = 'Panel1'
    TabOrder = 0
    DesignSize = (
      681
      506)
    object mmMess: TMemo
      Left = 3
      Top = 3
      Width = 675
      Height = 500
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelInner = bvLowered
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object bbClose: TBitBtn
    Left = 246
    Top = 517
    Width = 191
    Height = 25
    Anchors = [akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100' (5)'
    TabOrder = 1
    OnClick = bbCloseClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000D40E0000D40E00001000000010000000000059002424
      500026266900FF0000000101BD002929AF005D5DBB000707C8002828CA000000
      F5002626F4006161D300A4A4D500D1D1DA00D7D7F200E3E3E400333E20000001
      F33333E8744444441F333E874474444441F3E87844578578741F84DEC5C4EEBD
      844194EBC8D4FBCCB44077BBC8D4FBCCFC40947BC5D4FBCD6C40746F88D4FBCC
      BD4094DB88D4FBCCBD4094EBC7E4FBCCBD40A7CECCF6DDBEDC42EA8888888878
      B45F3EA74444444445E333EA777777745F33333EA9999995E333}
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 61
    Top = 100
  end
end
