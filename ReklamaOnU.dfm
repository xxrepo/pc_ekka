object ReklamaOnF: TReklamaOnF
  Left = 581
  Top = 334
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'ReklamaOnF'
  ClientHeight = 456
  ClientWidth = 716
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    716
    456)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 40
    Width = 696
    Height = 156
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label1'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object Label2: TLabel
    Left = 10
    Top = 210
    Width = 696
    Height = 81
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label1'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object bbClose: TBitBtn
    Left = 270
    Top = 426
    Width = 176
    Height = 25
    Anchors = [akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100' (5)'
    TabOrder = 0
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
  object ActionList1: TActionList
    Left = 35
    Top = 25
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 32883
      OnExecute = Action1Execute
    end
  end
  object tmrWait: TTimer
    OnTimer = tmrWaitTimer
    Left = 36
    Top = 75
  end
end
