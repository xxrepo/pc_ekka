object Fn_to_chek: TFn_to_chek
  Left = 577
  Top = 238
  BorderStyle = bsDialog
  ClientHeight = 417
  ClientWidth = 203
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 203
    Height = 376
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyUp = DBGrid1KeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'nn_nakl'
        Title.Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        Width = 120
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 203
    Height = 41
    Align = alTop
    TabOrder = 1
    object DTP_nakl: TDateTimePicker
      Left = 8
      Top = 8
      Width = 93
      Height = 21
      Date = 42902.634943472220000000
      Time = 42902.634943472220000000
      TabOrder = 0
      OnChange = DTP_naklChange
    end
    object btn_nakl: TButton
      Left = 108
      Top = 8
      Width = 85
      Height = 25
      Caption = #1042' '#1095#1077#1082
      TabOrder = 1
      OnClick = btn_naklClick
    end
  end
  object ADOQuery_nakl: TADOQuery
    Parameters = <>
    Left = 44
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery_nakl
    Left = 72
    Top = 72
  end
  object ADOQuery_test_tov: TADOQuery
    Parameters = <>
    Left = 44
    Top = 116
  end
  object ADOSP_add_to_chek: TADOStoredProc
    Parameters = <>
    Left = 44
    Top = 156
  end
end
