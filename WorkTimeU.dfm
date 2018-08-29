object WorkTimeF: TWorkTimeF
  Left = 341
  Top = 276
  BorderStyle = bsDialog
  Caption = 'WorkTimeF'
  ClientHeight = 382
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 10
    Width = 611
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = #1056#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099' '#1072#1087#1090#1077#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 5
    Top = 45
    Width = 5
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 395
    Top = 45
    Width = 5
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 3
    Top = 70
    Width = 120
    Height = 13
    Caption = #1056#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099' '#1082#1072#1089#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 3
    Top = 385
    Width = 128
    Height = 13
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1086#1085#1090#1088#1086#1083#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 3
    Top = 85
    Width = 615
    Height = 241
    DataSource = DM.srWorkTimeK
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
        FieldName = 'SDay'
        Title.Alignment = taCenter
        Title.Caption = #1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 101
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'time_beg'
        Title.Alignment = taCenter
        Title.Caption = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 91
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'time_end'
        Title.Alignment = taCenter
        Title.Caption = #1042#1088#1077#1084#1103' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'worktime_position_name'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 267
        Visible = True
      end>
  end
  object DBMemo1: TDBMemo
    Left = 3
    Top = 330
    Width = 615
    Height = 46
    DataField = 'worktime_position_description'
    DataSource = DM.srWorkTimeK
    TabOrder = 1
  end
  object DBGrid2: TDBGrid
    Left = 3
    Top = 400
    Width = 615
    Height = 166
    Color = 13231345
    DataSource = DM.srWorkTimeP
    Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'param_value'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'param_descr'
        Width = 469
        Visible = True
      end>
  end
end
