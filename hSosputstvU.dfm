inherited hSoputstvF: ThSoputstvF
  Left = 1047
  Top = 297
  Caption = 'hSoputstvF'
  ClientHeight = 216
  ClientWidth = 535
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Image1: TImage
    Width = 535
    Height = 216
  end
  object Label1: TLabel [1]
    Left = 174
    Top = 5
    Width = 187
    Height = 17
    Anchors = [akTop]
    Caption = #1057#1086#1087#1091#1090#1089#1090#1074#1091#1102#1097#1080#1081' '#1090#1086#1074#1072#1088
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    Transparent = True
  end
  object Bevel1: TBevel [2]
    Left = 8
    Top = 25
    Width = 520
    Height = 2
    Anchors = [akLeft, akTop, akRight]
  end
  object DBText1: TDBText [3]
    Left = 10
    Top = 31
    Width = 516
    Height = 40
    DataField = 'Descr'
    DataSource = DM.srSop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object dbgSop: TDBGrid [4]
    Left = 8
    Top = 75
    Width = 521
    Height = 134
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    Color = 16772033
    DataSource = DM.srSop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
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
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'names'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 390
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ostat'
        Title.Alignment = taCenter
        Title.Caption = #1054#1089#1090'. '#1091#1087'.'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cena'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072' '#1091#1087'.'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 58
        Visible = True
      end>
  end
  inherited ActionList1: TActionList
    Left = 100
    Top = 40
  end
end
