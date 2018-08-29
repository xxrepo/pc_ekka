object Fedit_filter: TFedit_filter
  Left = 620
  Top = 300
  Width = 375
  Height = 412
  Caption = #1060#1080#1083#1100#1090#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBG_filtr: TDBGrid
    Left = 0
    Top = 0
    Width = 367
    Height = 385
    Align = alClient
    DataSource = DS_edit_filtr
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnColEnter = DBG_filtrColEnter
    OnDblClick = DBG_filtrDblClick
    OnKeyPress = DBG_filtrKeyPress
  end
  object DS_edit_filtr: TDataSource
    DataSet = ADOQ_edit_filtr
    Left = 104
    Top = 148
  end
  object ADOQ_edit_filtr: TADOQuery
    Connection = DM.ADOCo
    CursorType = ctStatic
    Parameters = <>
    Left = 104
    Top = 180
  end
end
