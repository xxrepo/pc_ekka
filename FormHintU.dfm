object FormHintF: TFormHintF
  Left = 597
  Top = 351
  BorderStyle = bsNone
  Caption = 'FormHintF'
  ClientHeight = 340
  ClientWidth = 591
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
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 591
    Height = 340
    Align = alClient
  end
  object ActionList1: TActionList
    Left = 40
    Top = 35
    object NoClose: TAction
      Caption = 'NoClose'
      ShortCut = 32883
      OnExecute = NoCloseExecute
    end
  end
end
