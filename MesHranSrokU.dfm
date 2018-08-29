object MesHranSrokF: TMesHranSrokF
  Left = 1261
  Top = 111
  Width = 656
  Height = 503
  Caption = 'MesHranSrokF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object lbBigCaption: TLabel
    Left = 4
    Top = 4
    Width = 525
    Height = 24
    Caption = #1057#1088#1086#1082#1086#1074#1099#1077' '#1090#1086#1074#1072#1088#1099' '#1089' '#1085#1077' '#1091#1082#1072#1079#1072#1085#1099#1084#1080' '#1084#1077#1089#1090#1072#1084#1080' '#1093#1088#1072#1085#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btFillPlaces: TButton
    Left = 4
    Top = 288
    Width = 209
    Height = 25
    Caption = #1055#1088#1086#1089#1090#1072#1074#1080#1090#1100' '#1084#1077#1089#1090#1072' '#1093#1088#1072#1085#1077#1085#1080#1103
    TabOrder = 2
    OnClick = btFillPlacesClick
  end
  object dgMesHranSrok: TDBGrid
    Left = 4
    Top = 168
    Width = 289
    Height = 120
    DataSource = DM.dsPrepStorage
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btClose: TButton
    Left = 368
    Top = 288
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 5
    OnClick = btCloseClick
  end
  object dgSrokHranWOPlases: TDBGrid
    Left = 4
    Top = 48
    Width = 320
    Height = 120
    DataSource = DM.dsSrokHranWOPlases
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dgSrokHranWOPlasesDrawColumnCell
  end
  object btAddToList: TButton
    Left = 216
    Top = 288
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 3
    OnClick = btAddToListClick
  end
  object btRemoveFromList: TButton
    Left = 292
    Top = 288
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 4
    OnClick = btRemoveFromListClick
  end
  object chMoreThanZerro: TCheckBox
    Left = 4
    Top = 28
    Width = 45
    Height = 17
    Caption = ' > 0'
    TabOrder = 6
  end
end
