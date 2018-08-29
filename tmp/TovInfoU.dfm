object TovInfoF: TTovInfoF
  Left = 488
  Top = 219
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'TovInfoF'
  ClientHeight = 462
  ClientWidth = 858
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShortCut = FormShortCut
  DesignSize = (
    858
    462)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 35
    Width = 88
    Height = 16
    Hint = 
      #1044#1077#1092#1077#1082#1090#1091#1088#1072' '#1086#1079#1085#1072#1095#1072#1077#1090', '#1095#1090#1086' '#1087#1077#1088#1087#1072#1088#1072#1090#1072' '#1085#1077#1090' '#1074' '#1087#1088#1072#1081#1089#1072#1093' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074' '#1079#1072'  ' +
      #1074#1095#1077#1088#1072#1096#1085#1080#1081' '#1076#1077#1085#1100'.'
    Caption = #1044#1077#1092#1077#1082#1090#1091#1088#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label2: TLabel
    Left = 5
    Top = 60
    Width = 144
    Height = 16
    Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1088#1077#1087#1072#1088#1072#1090#1072' '#1085#1072' '#1089#1082#1083#1072#1076#1077'.'
    Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1089#1082#1083#1072#1076#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label3: TLabel
    Left = 5
    Top = 85
    Width = 192
    Height = 16
    Hint = 
      #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '#1087#1088#1077#1087#1072#1088#1072#1090#1072' '#1074' '#1072#1087#1090#1077#1082#1072#1093' '#1089#1077#1090#1080' '#1086#1073#1085#1086#1074#1083#1103#1077#1090#1089#1103' '#1085#1077#1089#1082#1086#1083#1100#1082 +
      #1086' '#1088#1072#1079' '#1074' '#1089#1091#1090#1082#1080'. '#1055#1086#1101#1090#1086#1084#1091' '#1090#1086#1095#1085#1086#1077' '#1082#1086#1083'-'#1074#1086' '#1087#1088#1077#1087#1072#1088#1072#1090#1072' '#1085#1091#1078#1085#1086' '#1091#1090#1086#1095#1085#1103#1090#1100' '#1074' ' +
      #1090#1077#1083#1077#1092#1086#1085#1085#1086#1084' '#1088#1077#1078#1080#1084#1077'.'
    Caption = #1054#1089#1090#1072#1090#1086#1082' '#1074' '#1072#1087#1090#1077#1095#1085#1086#1081' '#1089#1077#1090#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object sbSw: TSpeedButton
    Left = 306
    Top = 440
    Width = 246
    Height = 19
    Anchors = [akLeft, akBottom]
    Caption = #1055#1086#1076#1088#1086#1073#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1072#1087#1090#1077#1082#1072#1084' '
    Flat = True
    OnClick = sbSwClick
  end
  object DBText1: TDBText
    Left = 480
    Top = 35
    Width = 376
    Height = 51
    DataField = 'Adress'
    DataSource = DM.dsTovInfo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 425
    Top = 35
    Width = 50
    Height = 16
    Caption = #1040#1076#1088#1077#1089':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label5: TLabel
    Left = 425
    Top = 90
    Width = 72
    Height = 16
    Caption = #1058#1077#1083#1077#1092#1086#1085':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object DBText2: TDBText
    Left = 500
    Top = 90
    Width = 351
    Height = 17
    DataField = 'phone'
    DataSource = DM.dsTovInfo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Panel1: TPanel
    Left = 5
    Top = 110
    Width = 848
    Height = 325
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    Visible = False
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 848
      Height = 325
      Align = alClient
      BorderStyle = bsNone
      DataSource = DM.dsTovInfo
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'apteka'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1040#1087#1090#1077#1082#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 206
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kolup'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1059#1087#1072#1082'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cenaup'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072' '#1091#1087'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'adress'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1040#1076#1088#1077#1089
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 305
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Dist'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1056#1072#1089#1089#1090'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 68
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 1
    Top = 226
    Width = 856
    Height = 134
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    Caption = #1048#1076#1077#1090' '#1089#1073#1086#1088' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086#1081' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080'. '#1055#1086#1078#1072#1083#1091#1081#1089#1090#1072' '#1087#1086#1076#1086#1078#1076#1080#1090#1077'...'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 1
    object pbProc: TProgressBar
      Left = 353
      Top = 95
      Width = 150
      Height = 17
      Max = 3
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 858
    Height = 31
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object lbName: TLabel
      Left = 7
      Top = 7
      Width = 55
      Height = 16
      Caption = 'lbName'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Panel4: TPanel
      Left = 838
      Top = 2
      Width = 16
      Height = 27
      BevelOuter = bvNone
      TabOrder = 0
      OnClick = Panel4Click
    end
    object CheckBox1: TCheckBox
      Left = 680
      Top = 8
      Width = 130
      Height = 17
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1094#1077#1085#1077
      TabOrder = 1
      OnClick = CheckBox1Click
    end
  end
  object BitBtn1: TBitBtn
    Left = 275
    Top = 34
    Width = 141
    Height = 21
    Caption = #1047#1072#1082#1072#1079#1072#1090#1100' '#1091' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074'...'
    TabOrder = 3
    Visible = False
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 275
    Top = 59
    Width = 141
    Height = 21
    Caption = #1047#1072#1082#1072#1079#1072#1090#1100' '#1085#1072' '#1089#1082#1083#1072#1076#1077'...'
    TabOrder = 4
    Visible = False
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 275
    Top = 85
    Width = 141
    Height = 21
    Caption = #1059#1079#1085#1072#1090#1100' '#1075#1076#1077
    TabOrder = 5
    Visible = False
    OnClick = BitBtn3Click
  end
end
