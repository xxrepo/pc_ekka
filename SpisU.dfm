object SpisF: TSpisF
  Left = 727
  Top = 241
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'SpisF'
  ClientHeight = 607
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    600
    607)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 1
    Top = 318
    Width = 598
    Height = 176
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    DesignSize = (
      598
      176)
    object DBText1: TDBText
      Left = 5
      Top = 159
      Width = 50
      Height = 13
      AutoSize = True
      DataField = 'Users'
      DataSource = DM.srViolations
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 435
      Top = 159
      Width = 159
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #1050#1086#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1085#1072#1088#1091#1096#1077#1085#1080#1102'...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Label4Click
      OnMouseEnter = Label4MouseEnter
      OnMouseLeave = Label4MouseLeave
    end
    object DBText2: TDBText
      Left = 245
      Top = 158
      Width = 50
      Height = 13
      AutoSize = True
      DataField = 'Apteka'
      DataSource = DM.srViolations
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid2: TDBGrid
      Left = 3
      Top = 25
      Width = 592
      Height = 130
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DM.srViolations
      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'dt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descr'
          Width = 208
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'users'
          Width = 138
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'apteka'
          Width = 102
          Visible = True
        end>
    end
    object RadioButton1: TRadioButton
      Left = 123
      Top = 6
      Width = 199
      Height = 17
      Caption = #1057#1086#1073#1099#1090#1080#1103' '#1074#1089#1077#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1072#1087#1090#1077#1082#1080
      TabOrder = 1
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 5
      Top = 6
      Width = 94
      Height = 17
      Caption = #1052#1086#1080' '#1089#1086#1073#1099#1090#1080#1103
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = RadioButton1Click
    end
    object RadioButton3: TRadioButton
      Left = 352
      Top = 6
      Width = 239
      Height = 17
      Caption = #1057#1086#1073#1099#1090#1080#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1074#1089#1077#1081' '#1072#1087#1090#1077#1095#1085#1086#1081' '#1089#1077#1090#1080
      TabOrder = 3
      OnClick = RadioButton1Click
    end
  end
  object Panel1: TPanel
    Left = 1
    Top = 1
    Width = 598
    Height = 56
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      598
      56)
    object Label1: TLabel
      Left = 46
      Top = 5
      Width = 506
      Height = 44
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 
        #1059#1074#1072#1078#1072#1077#1084#1099#1077' '#1087#1088#1086#1074#1080#1079#1086#1088#1099', '#1089#1077#1075#1086#1076#1085#1103' '#1074' '#1087#1077#1088#1074#1091#1102' '#1086#1095#1077#1088#1077#1076#1100' '#1087#1088#1077#1076#1083#1072#1075#1072#1081#1090#1077' '#1089#1083#1077#1076#1091#1102 +
        #1097#1080#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1099':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
  end
  object bbClose: TBitBtn
    Left = 233
    Top = 580
    Width = 136
    Height = 25
    Anchors = [akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100' (5)'
    TabOrder = 1
    OnClick = bbCloseClick
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 60
    Width = 599
    Height = 159
    Anchors = [akLeft, akTop, akRight]
    DataSource = DM.srSpisNeed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
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
        Title.Alignment = taCenter
        Title.Caption = #1057#1080#1084#1087#1090#1086#1084#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 282
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAMES'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 294
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 1
    Top = 495
    Width = 598
    Height = 82
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    DesignSize = (
      598
      82)
    object StaticText1: TStaticText
      Left = 4
      Top = 4
      Width = 477
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = #1057#1091#1084#1084#1072' '#1042#1072#1096#1077#1075#1086' '#1089#1088#1077#1076#1085#1077#1075#1086' '#1095#1077#1082#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object lbAvgCh: TStaticText
      Left = 483
      Top = 4
      Width = 112
      Height = 17
      Alignment = taRightJustify
      Anchors = [akRight]
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = '0.00 '#1075#1088#1085'. '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object StaticText2: TStaticText
      Left = 4
      Top = 23
      Width = 477
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1042#1072#1096#1080#1093' '#1095#1077#1082#1086#1074':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object lbNCh: TStaticText
      Left = 483
      Top = 23
      Width = 112
      Height = 17
      Alignment = taRightJustify
      Anchors = [akRight]
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = '0 '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object lbMaxAvgCh: TStaticText
      Left = 4
      Top = 42
      Width = 591
      Height = 17
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = sbsSunken
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object StaticText3: TStaticText
      Left = 4
      Top = 61
      Width = 477
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077' '#1089#1086#1087#1091#1090#1089#1090#1074#1091#1102#1097#1080#1093':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object lbSop: TStaticText
      Left = 483
      Top = 61
      Width = 112
      Height = 17
      Alignment = taRightJustify
      Anchors = [akRight]
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = '0.00 % '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
  end
  object Panel3: TPanel
    Left = 1
    Top = 222
    Width = 598
    Height = 94
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    Color = 16772812
    TabOrder = 4
    object Label2: TLabel
      Left = 1
      Top = 40
      Width = 596
      Height = 53
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 
        #1053#1072#1087#1086#1084#1080#1085#1072#1077#1084' '#1042#1072#1084' '#1086' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086#1089#1090#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100#1089#1103' '#1072#1074#1090#1086#1079#1072#1084#1077#1085#1086#1081' '#1080' '#1089#1086#1087#1091#1090#1089 +
        #1090#1074#1091#1102#1097#1080#1084#1080' '#1087#1088#1077#1087#1072#1088#1072#1090#1072#1084#1080'.'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object Label3: TLabel
      Left = 1
      Top = 1
      Width = 596
      Height = 39
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 
        #1053#1072#1087#1086#1084#1080#1085#1072#1077#1084' '#1042#1072#1084' '#1086' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086#1089#1090#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100#1089#1103' '#1072#1074#1090#1086#1079#1072#1084#1077#1085#1086#1081' '#1080' '#1089#1086#1087#1091#1090#1089 +
        #1090#1074#1091#1102#1097#1080#1084#1080' '#1087#1088#1077#1087#1072#1088#1072#1090#1072#1084#1080'.'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
  end
  object ActionList1: TActionList
    Left = 25
    Top = 120
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 32883
      OnExecute = Action1Execute
    end
  end
  object tmrWait: TTimer
    OnTimer = tmrWaitTimer
    Left = 86
    Top = 120
  end
end
