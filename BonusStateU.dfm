object BonusStateF: TBonusStateF
  Left = 765
  Top = 364
  BorderStyle = bsDialog
  Caption = 'BonusStateF'
  ClientHeight = 284
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 1
    Top = 1
    Width = 381
    Height = 252
    DataSource = DM.srBonusState
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'dt_pay'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'state'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summ'
        Width = 107
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 134
    Top = 257
    Width = 116
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
