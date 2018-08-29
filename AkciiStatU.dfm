object AkciiStatF: TAkciiStatF
  Left = 701
  Top = 270
  BorderStyle = bsDialog
  Caption = 'AkciiStatF'
  ClientHeight = 531
  ClientWidth = 908
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
    908
    531)
  PixelsPerInch = 96
  TextHeight = 13
  object pn3: TPanel
    Left = 13
    Top = 8
    Width = 905
    Height = 498
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    Visible = False
    DesignSize = (
      905
      498)
    object DBText2: TDBText
      Left = 352
      Top = 10
      Width = 60
      Height = 16
      AutoSize = True
      DataField = 'Descr'
      DataSource = DM.srAStatD
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 5
      Top = 10
      Width = 344
      Height = 16
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1087#1083#1072#1085#1072#1084' '#1087#1088#1086#1076#1072#1078' '#1085#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label35: TLabel
      Left = 10
      Top = 455
      Width = 143
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = #1042#1099' '#1091#1078#1077' '#1074#1099#1087#1086#1083#1085#1080#1083#1080' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label36: TLabel
      Left = 152
      Top = 455
      Width = 49
      Height = 16
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label37: TLabel
      Left = 205
      Top = 455
      Width = 92
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = '%  '#1086#1090' '#1087#1083#1072#1085#1072' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label38: TLabel
      Left = 300
      Top = 455
      Width = 61
      Height = 16
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label60: TLabel
      Left = 365
      Top = 455
      Width = 23
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = #1091#1087'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label88: TLabel
      Left = 11
      Top = 475
      Width = 272
      Height = 16
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      Caption = #1044#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1083#1072#1085#1072' '#1042#1072#1084' '#1086#1089#1090#1072#1083#1086#1089#1100':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label89: TLabel
      Left = 300
      Top = 475
      Width = 61
      Height = 16
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label90: TLabel
      Left = 365
      Top = 475
      Width = 23
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = #1091#1087'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid5: TDBGrid
      Left = 3
      Top = 35
      Width = 899
      Height = 416
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DM.srAStatD
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
      Columns = <
        item
          Expanded = False
          FieldName = 'art_code'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'names'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 247
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Plan'
          Title.Alignment = taCenter
          Title.Caption = #1055#1083#1072#1085' '#1091#1087'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Prc1'
          Title.Alignment = taCenter
          Title.Caption = '% 1'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Prc2'
          Title.Alignment = taCenter
          Title.Caption = '% 2'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Prc3'
          Title.Alignment = taCenter
          Title.Caption = '% 3'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Prize1'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1075#1088#1072#1076#1072' 1'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Prize2'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1075#1088#1072#1076#1072' 2'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Prize3'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1075#1088#1072#1076#1072' 3'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 134
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KolUp'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'. '#1091#1087'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 44
          Visible = True
        end>
    end
  end
  object BitBtn1: TBitBtn
    Left = 401
    Top = 505
    Width = 106
    Height = 25
    Anchors = [akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 0
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000D40E0000D40E00001000000010000000000059002424
      500026266900FF0000000101BD002929AF005D5DBB000707C8002828CA000000
      F5002626F4006161D300A4A4D500D1D1DA00D7D7F200E3E3E400333E20000001
      F33333E8744444441F333E874474444441F3E87844578578741F84DEC5C4EEBD
      844194EBC8D4FBCCB44077BBC8D4FBCCFC40947BC5D4FBCD6C40746F88D4FBCC
      BD4094DB88D4FBCCBD4094EBC7E4FBCCBD40A7CECCF6DDBEDC42EA8888888878
      B45F3EA74444444445E333EA777777745F33333EA9999995E333}
  end
  object pn1: TPanel
    Left = 13
    Top = 58
    Width = 905
    Height = 498
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Visible = False
    DesignSize = (
      905
      498)
    object Label3: TLabel
      Left = 5
      Top = 10
      Width = 270
      Height = 16
      Caption = #1041#1088#1086#1085#1080#1088#1086#1074#1072#1085#1080#1077' "'#1057' '#1072#1087#1090#1077#1082#1080' '#1085#1072' '#1072#1087#1090#1077#1082#1091'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSumAll: TLabel
      Left = 690
      Top = 230
      Width = 201
      Height = 16
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = #1042#1089#1077#1075#1086': 0 '#1073#1086#1085#1091#1089#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSumAll1: TLabel
      Left = 375
      Top = 475
      Width = 201
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1042#1089#1077#1075#1086': 0 '#1073#1086#1085#1091#1089#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 5
      Top = 260
      Width = 344
      Height = 16
      Caption = #1041#1088#1086#1085#1080#1088#1086#1074#1072#1085#1080#1077' "'#1047#1072#1082#1072#1079' '#1087#1086#1076' '#1082#1083#1080#1077#1085#1090#1072' '#1089#1086' '#1089#1082#1083#1072#1076#1072'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid3: TDBGrid
      Left = 3
      Top = 35
      Width = 899
      Height = 191
      Anchors = [akLeft, akTop, akRight]
      DataSource = DM.srAStatD
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
      OnDrawColumnCell = DBGrid3DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'dt_res'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1073#1088#1086#1085#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 125
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'summ'
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'apteka'
          Title.Alignment = taCenter
          Title.Caption = #1040#1087#1090#1077#1082#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 238
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'statusarm'
          Title.Alignment = taCenter
          Title.Caption = #1057#1090#1072#1090#1091#1089' '#1073#1088#1086#1085#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_closed'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1073#1088#1086#1085#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 135
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Bonus'
          Title.Alignment = taCenter
          Title.Caption = #1041#1086#1085#1091#1089#1099
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 55
          Visible = True
        end>
    end
    object DBGrid4: TDBGrid
      Left = 1
      Top = 280
      Width = 578
      Height = 191
      DataSource = DM.srAStatD1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid3DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'dt_res'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1073#1088#1086#1085#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 125
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'summ'
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'statusarm'
          Title.Alignment = taCenter
          Title.Caption = #1057#1090#1072#1090#1091#1089' '#1073#1088#1086#1085#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_closed'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1073#1088#1086#1085#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 135
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Bonus'
          Title.Alignment = taCenter
          Title.Caption = #1041#1086#1085#1091#1089#1099
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 55
          Visible = True
        end>
    end
  end
  object pn4: TPanel
    Left = 18
    Top = 58
    Width = 905
    Height = 498
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Visible = False
    DesignSize = (
      905
      498)
    object DBText1: TDBText
      Left = 312
      Top = 10
      Width = 60
      Height = 16
      AutoSize = True
      DataField = 'Descr'
      DataSource = DM.srAStatD
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 5
      Top = 10
      Width = 304
      Height = 16
      Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1072#1103' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1092#1072#1088#1084#1079#1072#1084#1077#1085#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSumBonusAll4: TLabel
      Left = 700
      Top = 476
      Width = 201
      Height = 16
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      AutoSize = False
      Caption = #1042#1089#1077#1075#1086': 0 '#1073#1086#1085#1091#1089#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 3
      Top = 35
      Width = 899
      Height = 436
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DM.srAStatD
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
      Columns = <
        item
          Expanded = False
          FieldName = 'art_code'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'names'
          Title.Alignment = taCenter
          Title.Caption = #1047#1072#1084#1077#1085#1103#1084#1099#1077' '#1087#1086#1079#1080#1094#1080#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 248
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'art_code_'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'names_'
          Title.Alignment = taCenter
          Title.Caption = #1047#1072#1084#1077#1085#1077#1085#1086' '#1085#1072' '
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 248
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'prize'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 63
          Visible = True
        end>
    end
  end
  object pn6: TPanel
    Left = 18
    Top = 63
    Width = 905
    Height = 498
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 5
    Visible = False
    DesignSize = (
      905
      498)
    object DBText3: TDBText
      Left = 392
      Top = 10
      Width = 60
      Height = 16
      AutoSize = True
      DataField = 'Descr'
      DataSource = DM.srAStatD
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 5
      Top = 10
      Width = 383
      Height = 16
      Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1072#1103' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1082#1086#1084#1087#1083#1077#1082#1089#1085#1099#1084' '#1087#1086#1082#1091#1087#1082#1072#1084':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSumBonusAll6: TLabel
      Left = 700
      Top = 476
      Width = 201
      Height = 16
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      AutoSize = False
      Caption = #1042#1089#1077#1075#1086': 0 '#1073#1086#1085#1091#1089#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid6: TDBGrid
      Left = 3
      Top = 35
      Width = 899
      Height = 436
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DM.srAStatD
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
      Columns = <
        item
          Expanded = False
          FieldName = 'art_code'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'names'
          Title.Alignment = taCenter
          Title.Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1087#1086#1079#1080#1094#1080#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 248
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'art_code_'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'names_'
          Title.Alignment = taCenter
          Title.Caption = #1055#1088#1086#1076#1072#1085#1099#1077' '#1087#1086#1079#1080#1094#1080#1080' '#1074' '#1082#1086#1084#1087#1083#1077#1082#1090#1077' '#1089' '#1086#1089#1085#1086#1074#1085#1099#1084#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 248
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'prize'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 63
          Visible = True
        end>
    end
  end
  object pn7: TPanel
    Left = 3
    Top = 3
    Width = 905
    Height = 498
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Visible = False
    DesignSize = (
      905
      498)
    object Label2: TLabel
      Left = 5
      Top = 11
      Width = 417
      Height = 16
      Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1072#1103' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1076#1080#1089#1090#1072#1085#1094#1080#1086#1085#1085#1086#1084#1091' '#1086#1073#1091#1095#1077#1085#1080#1102
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid2: TDBGrid
      Left = 3
      Top = 35
      Width = 899
      Height = 460
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DM.srAStatD
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
      Columns = <
        item
          Expanded = False
          FieldName = 'NumTest'
          Title.Alignment = taCenter
          Title.Caption = #8470' '#1058#1077#1089#1090#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Dt'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 213
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Prize'
          Title.Alignment = taCenter
          Title.Caption = #1041#1086#1085#1091#1089#1099
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 118
          Visible = True
        end>
    end
  end
  object pn9: TPanel
    Left = 3
    Top = 3
    Width = 905
    Height = 498
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 6
    Visible = False
    DesignSize = (
      905
      498)
    object lb111111: TLabel
      Left = 5
      Top = 11
      Width = 437
      Height = 16
      Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1072#1103' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1076#1080#1089#1082#1086#1085#1090#1085#1099#1093' '#1082#1072#1088#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid7: TDBGrid
      Left = 3
      Top = 35
      Width = 899
      Height = 460
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DM.srAStatD
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
      Columns = <
        item
          Expanded = False
          FieldName = 'Dt'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 213
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Prize'
          Title.Alignment = taCenter
          Title.Caption = #1041#1086#1085#1091#1089#1099
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 118
          Visible = True
        end>
    end
  end
end
