object MoveMoneyF: TMoveMoneyF
  Left = 656
  Top = 418
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'MoveMoneyF'
  ClientHeight = 222
  ClientWidth = 344
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
    344
    222)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 2
    Top = 2
    Width = 157
    Height = 13
    Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1076#1077#1085#1077#1075' '#1087#1086' '#1082#1072#1089#1089#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 1
    Top = 20
    Width = 342
    Height = 170
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      342
      170)
    object SG: TStringGrid
      Left = 1
      Top = 1
      Width = 340
      Height = 166
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Color = clBtnFace
      ColCount = 2
      DefaultRowHeight = 17
      FixedCols = 0
      RowCount = 9
      FixedRows = 0
      TabOrder = 0
      OnDrawCell = SGDrawCell
    end
  end
  object BitBtn8: TBitBtn
    Left = 114
    Top = 195
    Width = 116
    Height = 25
    Anchors = [akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = BitBtn8Click
  end
end
