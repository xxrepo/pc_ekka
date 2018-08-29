object FTake_product: TFTake_product
  Left = 497
  Top = 259
  Width = 326
  Height = 347
  Caption = #1042#1099#1073#1086#1088' '#1090#1086#1074#1072#1088#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_chek_number: TLabel
    Left = 12
    Top = 18
    Width = 63
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1095#1077#1082#1072':'
  end
  object ed_chek_number: TEdit
    Left = 84
    Top = 14
    Width = 129
    Height = 21
    TabOrder = 0
    OnKeyPress = ed_chek_numberKeyPress
  end
  object btn_select_chek: TButton
    Left = 224
    Top = 14
    Width = 75
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1095#1077#1082
    TabOrder = 1
    OnClick = btn_select_chekClick
  end
  object DBG_chek: TDBGrid
    Left = 0
    Top = 51
    Width = 301
    Height = 106
    DataSource = DS_chek
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBG_chekCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMB_CHEK'
        Title.Caption = #1053#1086#1084#1077#1088' '#1095#1077#1082#1072
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kassa_num'
        Title.Caption = #1050#1072#1089#1089#1072
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_chek'
        Title.Caption = #1044#1072#1090#1072' '#1095#1077#1082#1072
        Width = 75
        Visible = True
      end>
  end
  object DBG_products: TDBGrid
    Left = 0
    Top = 159
    Width = 301
    Height = 106
    DataSource = DS_products
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'names'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Visible = True
      end>
  end
  object btn_select_product: TButton
    Left = 8
    Top = 280
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 4
    OnClick = btn_select_productClick
  end
  object btn_Cancel: TButton
    Left = 228
    Top = 280
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = btn_CancelClick
  end
  object DS_chek: TDataSource
    DataSet = ADOQ_chek
    Left = 144
    Top = 56
  end
  object ADOQ_chek: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 176
    Top = 56
  end
  object ADOQ_products: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 176
    Top = 164
  end
  object DS_products: TDataSource
    DataSet = ADOQ_products
    Left = 148
    Top = 164
  end
end
