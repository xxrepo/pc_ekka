object NoScanViewF: TNoScanViewF
  Left = 824
  Top = 413
  BorderStyle = bsToolWindow
  Caption = 'NoScanViewF'
  ClientHeight = 150
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShortCut = FormShortCut
  DesignSize = (
    538
    150)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 538
    Height = 149
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.srNoScanV
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'art_code'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'names'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 302
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kol'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086' '#1087#1086' '#1085#1072#1082#1083'.'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'isscan'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'. '#1089#1082#1072#1085'.'
        Width = 56
        Visible = True
      end>
  end
end
