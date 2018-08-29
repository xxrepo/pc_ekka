object KoefF: TKoefF
  Left = 412
  Top = 205
  BorderStyle = bsDialog
  Caption = 'KoefF'
  ClientHeight = 629
  ClientWidth = 841
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
    841
    629)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 3
    Top = 90
    Width = 215
    Height = 16
    Caption = #1055#1088#1077#1084#1080#1103' '#1079#1072' '#1076#1085#1077#1074#1085#1091#1102' '#1074#1099#1088#1091#1095#1082#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 615
    Top = 235
    Width = 130
    Height = 16
    Caption = #1055#1088#1086#1094#1077#1085#1090' '#1079#1072' '#1085#1086#1095#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 750
    Top = 235
    Width = 60
    Height = 16
    AutoSize = True
    DataField = 'perc'
    DataSource = ds8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 3
    Top = 5
    Width = 395
    Height = 78
    Color = clBtnFace
    DataSource = ds1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgEditing, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Descr'
        Width = 248
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Width = 125
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 3
    Top = 109
    Width = 302
    Height = 516
    Anchors = [akLeft, akTop, akBottom]
    DataSource = ds2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Descr'
        Title.Caption = #1042#1099#1088#1091#1095#1082#1072', %'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p1'
        Title.Alignment = taCenter
        Title.Caption = '1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p2'
        Title.Alignment = taCenter
        Title.Caption = '2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p3'
        Title.Alignment = taCenter
        Title.Caption = '3'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p4'
        Title.Alignment = taCenter
        Title.Caption = '4'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p5'
        Title.Alignment = taCenter
        Title.Caption = '5'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = False
      end>
  end
  object DBGrid3: TDBGrid
    Left = 406
    Top = 4
    Width = 431
    Height = 57
    DataSource = ds4
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Descr'
        Title.Caption = #1047#1072#1074#1077#1076#1086#1074#1072#1085#1080#1077' '#1080' '#1089#1090#1072#1088#1072#1096#1080#1085#1089#1090#1074#1086
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 273
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p1'
        Title.Alignment = taCenter
        Title.Caption = '1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p2'
        Title.Alignment = taCenter
        Title.Caption = '2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p3'
        Title.Alignment = taCenter
        Title.Caption = '3'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p4'
        Title.Alignment = taCenter
        Title.Caption = '4'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p5'
        Title.Alignment = taCenter
        Title.Caption = '5'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = False
      end>
  end
  object DBGrid4: TDBGrid
    Left = 406
    Top = 64
    Width = 414
    Height = 39
    DataSource = ds5
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'Descr'
        Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1040#1087#1090#1077#1082#1080
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 274
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p1'
        Title.Alignment = taCenter
        Title.Caption = '1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p2'
        Title.Alignment = taCenter
        Title.Caption = '2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p3'
        Title.Alignment = taCenter
        Title.Caption = '3'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p4'
        Title.Alignment = taCenter
        Title.Caption = '4'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p5'
        Title.Alignment = taCenter
        Title.Caption = '5'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = False
      end>
  end
  object DBGrid5: TDBGrid
    Left = 310
    Top = 109
    Width = 299
    Height = 381
    Anchors = [akLeft, akTop, akBottom]
    DataSource = ds7
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Descr'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1080#1088#1086#1089#1090
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p1'
        Title.Alignment = taCenter
        Title.Caption = '1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p2'
        Title.Alignment = taCenter
        Title.Caption = '2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p3'
        Title.Alignment = taCenter
        Title.Caption = '3'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p4'
        Title.Alignment = taCenter
        Title.Caption = '4'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p5'
        Title.Alignment = taCenter
        Title.Caption = '5'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = False
      end>
  end
  object DBGrid6: TDBGrid
    Left = 613
    Top = 109
    Width = 225
    Height = 112
    DataSource = ds3
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Norm'
        Title.Caption = #1053#1086#1088#1084#1072' '#1074#1099#1088#1091#1095#1082#1080
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kateg'
        Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1072#1087#1090#1077#1082#1080
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 95
        Visible = True
      end>
  end
  object DBGrid7: TDBGrid
    Left = 311
    Top = 496
    Width = 528
    Height = 130
    Anchors = [akLeft, akBottom]
    DataSource = ds6
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'descr'
        Title.Alignment = taCenter
        Title.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 276
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p1'
        Title.Alignment = taCenter
        Title.Caption = #1044#1086#1087#1083#1072#1090#1072' '#1074#1099#1089#1096#1077#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p2'
        Title.Alignment = taCenter
        Title.Caption = #1044#1086#1087#1083#1072#1090#1072' '#1044#1086#1087#1063#1072#1089#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 121
        Visible = True
      end>
  end
  object k_spr1: TADOQuery
    Connection = DM.ADOCo
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from k_spr1')
    Left = 75
    Top = 30
  end
  object ds1: TDataSource
    DataSet = k_spr1
    Left = 145
    Top = 30
  end
  object k_spr2: TADOQuery
    Connection = DM.ADOCo
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from k_spr2'
      '')
    Left = 35
    Top = 170
  end
  object ds2: TDataSource
    DataSet = k_spr2
    Left = 105
    Top = 170
  end
  object k_spr4: TADOQuery
    Connection = DM.ADOCo
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from k_spr4')
    Left = 535
    Top = 20
  end
  object ds4: TDataSource
    DataSet = k_spr4
    Left = 595
    Top = 25
  end
  object k_spr5: TADOQuery
    Connection = DM.ADOCo
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from k_spr5')
    Left = 550
    Top = 70
  end
  object ds5: TDataSource
    DataSet = k_spr5
    Left = 590
    Top = 70
  end
  object k_spr7: TADOQuery
    Connection = DM.ADOCo
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from k_spr7')
    Left = 515
    Top = 185
  end
  object ds7: TDataSource
    DataSet = k_spr7
    Left = 555
    Top = 185
  end
  object k_spr3: TADOQuery
    Connection = DM.ADOCo
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from k_spr3')
    Left = 690
    Top = 155
  end
  object ds3: TDataSource
    DataSet = k_spr3
    Left = 730
    Top = 155
  end
  object k_spr6: TADOQuery
    Connection = DM.ADOCo
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from k_spr6')
    Left = 505
    Top = 525
  end
  object ds6: TDataSource
    DataSet = k_spr6
    Left = 550
    Top = 525
  end
  object k_spr8: TADOQuery
    Connection = DM.ADOCo
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select top 1  Perc from k_spr8 where id_apteka=(select convert(i' +
        'nt,Value) from Spr_Const where Descr='#39'ID_APTEKA'#39')')
    Left = 660
    Top = 295
  end
  object ds8: TDataSource
    DataSet = k_spr8
    Left = 705
    Top = 295
  end
end
