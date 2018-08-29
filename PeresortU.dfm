object PeresortF: TPeresortF
  Left = 582
  Top = 176
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PeresortF'
  ClientHeight = 645
  ClientWidth = 992
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
  OnShortCut = FormShortCut
  DesignSize = (
    992
    645)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 992
    Height = 31
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    object Label8: TLabel
      Left = 8
      Top = 9
      Width = 39
      Height = 13
      Caption = #1052#1077#1089#1103#1094
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 650
      Top = 7
      Width = 46
      Height = 17
      Caption = 'Label1'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 387
      Top = 9
      Width = 9
      Height = 13
      Caption = #1057
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 491
      Top = 9
      Width = 15
      Height = 13
      Caption = #1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox2: TComboBox
      Left = 52
      Top = 5
      Width = 168
      Height = 21
      Style = csDropDownList
      DropDownCount = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      OnChange = ComboBox2Change
      Items.Strings = (
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
    object cbYear: TCheckBox
      Left = 224
      Top = 7
      Width = 97
      Height = 17
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1075#1086#1076
      TabOrder = 1
      OnClick = cbYearClick
    end
    object cbPer: TCheckBox
      Left = 320
      Top = 7
      Width = 66
      Height = 17
      Caption = #1055#1077#1088#1080#1086#1076
      TabOrder = 2
      OnClick = cbPerClick
    end
    object dtStart: TDateTimePicker
      Left = 400
      Top = 5
      Width = 86
      Height = 21
      Date = 38786.000000000000000000
      Time = 38786.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnCloseUp = dtStartCloseUp
    end
    object dtEnd: TDateTimePicker
      Left = 511
      Top = 5
      Width = 86
      Height = 21
      Date = 38786.000000000000000000
      Time = 38786.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object cbChp: TCheckBox
      Left = 605
      Top = 7
      Width = 41
      Height = 17
      Caption = #1063#1055
      TabOrder = 5
      OnClick = cbChpClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 31
    Width = 496
    Height = 250
    TabOrder = 1
    DesignSize = (
      496
      250)
    object Label2: TLabel
      Left = 76
      Top = 4
      Width = 64
      Height = 13
      Caption = #1053#1077#1076#1086#1089#1090#1072#1095#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSumN1: TLabel
      Left = 290
      Top = 4
      Width = 92
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1085#1077#1076#1086#1089#1090#1072#1095#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbSumN: TLabel
      Left = 390
      Top = 4
      Width = 99
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lbSumN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgNED: TDBGrid
      Left = 2
      Top = 20
      Width = 491
      Height = 227
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 15132415
      DataSource = DM.srNEDList
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgNEDDblClick
      OnKeyDown = dbgNEDKeyDown
      OnKeyPress = dbgNEDKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'art_code'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
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
          FieldName = 'names'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 307
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 51
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 496
    Top = 31
    Width = 496
    Height = 250
    TabOrder = 2
    DesignSize = (
      496
      250)
    object Label3: TLabel
      Left = 76
      Top = 4
      Width = 85
      Height = 13
      Caption = #1051#1080#1096#1085#1080#1081' '#1090#1086#1074#1072#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSumL: TLabel
      Left = 385
      Top = 4
      Width = 104
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lbSumN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 263
      Top = 4
      Width = 121
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1083#1080#1096#1085#1077#1075#1086' '#1090#1086#1074#1072#1088#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbgLT: TDBGrid
      Left = 2
      Top = 20
      Width = 491
      Height = 227
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 14999251
      DataSource = DM.srLTList
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgLTDblClick
      OnKeyDown = dbgLTKeyDown
      OnKeyPress = dbgLTKeyPress
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
          Title.Font.Style = [fsBold]
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'names'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 307
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
          Title.Font.Style = [fsBold]
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 51
          Visible = True
        end>
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 281
    Width = 992
    Height = 143
    TabOrder = 3
    DesignSize = (
      992
      143)
    object Label4: TLabel
      Left = 390
      Top = 4
      Width = 211
      Height = 13
      Caption = #1057#1086#1087#1086#1089#1090#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1079#1080#1094#1080#1081' '#1087#1077#1088#1077#1089#1086#1088#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgN: TDBGrid
      Left = 2
      Top = 20
      Width = 493
      Height = 41
      DataSource = DM.srN1
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
          FieldName = 'art_code'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = 5329152
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'names'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = 5329152
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 290
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = 5329152
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = 5329152
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 59
          Visible = True
        end>
    end
    object dbgL: TDBGrid
      Left = 496
      Top = 20
      Width = 493
      Height = 41
      DataSource = DM.srL1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
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
          Title.Font.Color = 5329152
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'names'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = 5329152
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 290
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = 5329152
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = 5329152
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 59
          Visible = True
        end>
    end
    object BitBtn1: TBitBtn
      Left = 122
      Top = 116
      Width = 110
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E000000000000000000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF3C6D6DC2C2C20000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF80
        8080FFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF73BABA6ACCCC256666B9BEBE0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF808080C1
        C1C1808080FFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF42BBBB5DF6F65DC8D8256969BFBFBF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF808080C0
        C0C0C1C1C1808080FFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF83C1C1AAE8EB64CFE78CEFF74FBCD4116168BCBFBF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF808080C0C0C0C0
        C0C0C0C0C0C0C0C0808080FFFFFF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF78BCBE79D2E88CEFF764CDE767E6F439B6CC216363BCBF
        BF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF808080C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0808080FFFFFF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF5CAFAF8FDBE789ECF566CEE654E4F637C7E946D0F33ECFD81861
        68BFBFBF0000FF0000FF0000FF0000FF0000FFFFFFFF808080C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080FFFFFF0000FF0000FF0000FF0000FF
        0000FF0000FF3BADAD8DF0F567D3E954EBF542C2E939DBF148C3ED5AC3DE51B8
        C41E6363B9BEBE0000FF0000FF0000FF0000FFFFFFFF808080C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C2C2C2C0C0C0C0C0C0808080FFFFFF0000FF0000FF0000FF
        0000FF4F5F5F096F6F76DEE654EBF542BFE83BDCF345C1EC48C9DF5EC2E33BB1
        CD4EC0DE1F6266C2C2C20000FF0000FFFFFFFF808080FFFFFFC0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C1C1C1C0C0C0C0C0C0BCBCBC808080FFFFFF0000FF0000FF
        0000FF982C1E541E110D898938C7D930E8F33BC8EC52DADF57C9E337ADC84DC0
        E54EC0D01F62620000FF0000FF0000FFFFFFFF808080808080FFFFFFBCBCBCC0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF8080800000FF0000FF0000FF
        CA9595E5A669DC9F8D3E1E1E2081814ACCE546D4DF57C2E02CB8CB48BCDC2893
        A61E63630000FF0000FF0000FFFFFFFF808080C0C0C0C0C0C0808080FFFFFFC5
        C5C5C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF8080800000FF0000FF0000FF0000FF
        BA7575F5BF7AF1AF78D8895B441A110D898957C9D334B4C717B3B31B5B5B5F71
        710000FF0000FF0000FF0000FFFFFFFF808080C0C0C0C0C0C0C0C0C0808080FF
        FFFFC0C0C0FFFFFFFFFFFF8080808080800000FF0000FF0000FF0000FF0000FF
        BD7361F8C887EBA764EE7941B44026490B0B075E600E5A5B515B5B0000FF0000
        FF0000FF0000FF0000FF0000FFFFFFFF808080C0C0C0C0C0C0C0C0C0FFFFFF80
        8080FFFFFF8080808080800000FF0000FF0000FF0000FF0000FF0000FFC68776
        ECC17BF0A46CAE41258E1D0E81110E5511114F4F4F0000FF0000FF0000FF0000
        FF0000FF0000FF0000FFFFFFFF808080C0C0C0C0C0C0FFFFFFFFFFFF80808080
        80808080800000FF0000FF0000FF0000FF0000FF0000FF0000FFC07965EFC37C
        F3A76F9029156651517575757575750000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF808080C0C0C0FFFFFF80808080808080808080808000
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFB03F15EF9552
        962E187B67670000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF808080FFFFFF8080808080800000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF7417074F240F
        6B54540000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF8080808080808080800000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 616
      Top = 116
      Width = 110
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 3
      OnClick = BitBtn2Click
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E000000000000000000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF3C6D6DC2C2C20000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF80
        8080FFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF73BABA6ACCCC256666B9BEBE0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF808080C1
        C1C1808080FFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF42BBBB5DF6F65DC8D8256969BFBFBF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF808080C0
        C0C0C1C1C1808080FFFFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF83C1C1AAE8EB64CFE78CEFF74FBCD4116168BCBFBF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF808080C0C0C0C0
        C0C0C0C0C0C0C0C0808080FFFFFF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF78BCBE79D2E88CEFF764CDE767E6F439B6CC216363BCBF
        BF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF808080C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0808080FFFFFF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF5CAFAF8FDBE789ECF566CEE654E4F637C7E946D0F33ECFD81861
        68BFBFBF0000FF0000FF0000FF0000FF0000FFFFFFFF808080C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080FFFFFF0000FF0000FF0000FF0000FF
        0000FF0000FF3BADAD8DF0F567D3E954EBF542C2E939DBF148C3ED5AC3DE51B8
        C41E6363B9BEBE0000FF0000FF0000FF0000FFFFFFFF808080C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C2C2C2C0C0C0C0C0C0808080FFFFFF0000FF0000FF0000FF
        0000FF4F5F5F096F6F76DEE654EBF542BFE83BDCF345C1EC48C9DF5EC2E33BB1
        CD4EC0DE1F6266C2C2C20000FF0000FFFFFFFF808080FFFFFFC0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C1C1C1C0C0C0C0C0C0BCBCBC808080FFFFFF0000FF0000FF
        0000FF982C1E541E110D898938C7D930E8F33BC8EC52DADF57C9E337ADC84DC0
        E54EC0D01F62620000FF0000FF0000FFFFFFFF808080808080FFFFFFBCBCBCC0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF8080800000FF0000FF0000FF
        CA9595E5A669DC9F8D3E1E1E2081814ACCE546D4DF57C2E02CB8CB48BCDC2893
        A61E63630000FF0000FF0000FFFFFFFF808080C0C0C0C0C0C0808080FFFFFFC5
        C5C5C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF8080800000FF0000FF0000FF0000FF
        BA7575F5BF7AF1AF78D8895B441A110D898957C9D334B4C717B3B31B5B5B5F71
        710000FF0000FF0000FF0000FFFFFFFF808080C0C0C0C0C0C0C0C0C0808080FF
        FFFFC0C0C0FFFFFFFFFFFF8080808080800000FF0000FF0000FF0000FF0000FF
        BD7361F8C887EBA764EE7941B44026490B0B075E600E5A5B515B5B0000FF0000
        FF0000FF0000FF0000FF0000FFFFFFFF808080C0C0C0C0C0C0C0C0C0FFFFFF80
        8080FFFFFF8080808080800000FF0000FF0000FF0000FF0000FF0000FFC68776
        ECC17BF0A46CAE41258E1D0E81110E5511114F4F4F0000FF0000FF0000FF0000
        FF0000FF0000FF0000FFFFFFFF808080C0C0C0C0C0C0FFFFFFFFFFFF80808080
        80808080800000FF0000FF0000FF0000FF0000FF0000FF0000FFC07965EFC37C
        F3A76F9029156651517575757575750000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF808080C0C0C0FFFFFF80808080808080808080808000
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFB03F15EF9552
        962E187B67670000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF808080FFFFFF8080808080800000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF7417074F240F
        6B54540000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF8080808080808080800000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Left = 2
      Top = 116
      Width = 120
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
      TabOrder = 4
      OnClick = BitBtn3Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000D40E0000D40E00001000000010000000000000000000
        FF00808080009F9F9F00C0C0C000FFFFFF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000444444444444
        4444444444444444444444444444444444444444444444444444444444444444
        4444444444444444444444444444444444444444444444444444444444444444
        4444445555555555555530000000000000024222222222222224211111111111
        1110254444444444444221111111111111102544444444444442211111111111
        1110254444444444444221111111111111102455555555555552322222222222
        2222422222222222222444444444444444444444444444444444444444444444
        4444444444444444444444444444444444444444444444444444444444444444
        4444444444444444444444444444444444444444444444444444}
      NumGlyphs = 2
    end
    object BitBtn4: TBitBtn
      Left = 496
      Top = 116
      Width = 120
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
      TabOrder = 5
      OnClick = BitBtn4Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000D40E0000D40E00001000000010000000000000000000
        FF00808080009F9F9F00C0C0C000FFFFFF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000444444444444
        4444444444444444444444444444444444444444444444444444444444444444
        4444444444444444444444444444444444444444444444444444444444444444
        4444445555555555555530000000000000024222222222222224211111111111
        1110254444444444444221111111111111102544444444444442211111111111
        1110254444444444444221111111111111102455555555555552322222222222
        2222422222222222222444444444444444444444444444444444444444444444
        4444444444444444444444444444444444444444444444444444444444444444
        4444444444444444444444444444444444444444444444444444}
      NumGlyphs = 2
    end
    object lbKN: TStaticText
      Left = 237
      Top = 120
      Width = 66
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = #1050#1086#1083'-'#1074#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object stKN: TStaticText
      Left = 305
      Top = 120
      Width = 33
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object StaticText3: TStaticText
      Left = 357
      Top = 120
      Width = 54
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = #1057#1091#1084#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    object stSN: TStaticText
      Left = 413
      Top = 120
      Width = 76
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object lbKL: TStaticText
      Left = 732
      Top = 120
      Width = 66
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = #1050#1086#1083'-'#1074#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object stKL: TStaticText
      Left = 800
      Top = 120
      Width = 33
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
    end
    object StaticText7: TStaticText
      Left = 852
      Top = 120
      Width = 54
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = #1057#1091#1084#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
    end
    object stSL: TStaticText
      Left = 908
      Top = 120
      Width = 76
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 424
    Width = 496
    Height = 222
    TabOrder = 4
    DesignSize = (
      496
      222)
    object Label5: TLabel
      Left = 189
      Top = 4
      Width = 118
      Height = 13
      Caption = #1055#1086#1079#1080#1094#1080#1080' '#1087#1077#1088#1077#1089#1086#1088#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 20
      Width = 491
      Height = 174
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 12704240
      DataSource = DM.srPPer
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
          FieldName = 'art_code'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
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
          FieldName = 'names'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 255
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Summa'
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 58
          Visible = True
        end>
    end
    object BitBtn5: TBitBtn
      Left = 2
      Top = 195
      Width = 110
      Height = 25
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      TabOrder = 1
      OnClick = BitBtn5Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000D40E0000D40E000010000000100000000000000000FF
        0000808080009F9F9F00C0C0C000FFFFFF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000444443200024
        4444444444222245444444444211110444444444425444254444444442111104
        4444444442544425444444444211110444444444425444254444444432111103
        4444445552544425555532222211110000024222224444222224211111111111
        1110254444444444444221111111111111102544444444444442211111111111
        1110254444444444444221111111111111102455555444455552322222111100
        0002422222544422222444443211110344444444425444254444444442111104
        4444444442544425444444444211110444444444425444254444444442111104
        4444444442455524444444444322202444444444442222444444}
      NumGlyphs = 2
    end
    object BitBtn6: TBitBtn
      Left = 112
      Top = 195
      Width = 110
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 2
      OnClick = BitBtn6Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000D40E0000D40E00001000000010000000101F1F005D0F
        0F0010696900645C5C009A000000DB1A1A00E35050000000FF00219797006196
        960062EDED0080808000C9A2A200F7FBFB000000000000000000702B77777777
        77777BBB7777777777777788B3333337777777BBBBBBBBB777777778AD222900
        7777777BDDDBBBBB777777778AD8889207777777BDDDBBBBB777777778AD8289
        007777777BDDDBBBBB777777778AD8289007777777BDDDBDDDB777777778AD82
        00017777777BDDDBBBBB777777778A80001177777777BDBBBBBB777777777800
        0414777777777BBBBBBB77777777772055547777777777BBDBBB777777777771
        6C5577777777777BBDBB77777777777346C5777777777777BBDB777777777777
        356C7777777777777BBD777777777777735677777777777777BB777777777777
        7735777777777777777B77777777777777737777777777777777}
      NumGlyphs = 2
    end
    object BitBtn7: TBitBtn
      Left = 222
      Top = 195
      Width = 93
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
      OnClick = BitBtn7Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000D40E0000D40E00001000000010000000000000000000
        FF00808080009F9F9F00C0C0C000FFFFFF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000444444444444
        4444444444444444444444444444444444444444444444444444444444444444
        4444444444444444444444444444444444444444444444444444444444444444
        4444445555555555555530000000000000024222222222222224211111111111
        1110254444444444444221111111111111102544444444444442211111111111
        1110254444444444444221111111111111102455555555555552322222222222
        2222422222222222222444444444444444444444444444444444444444444444
        4444444444444444444444444444444444444444444444444444444444444444
        4444444444444444444444444444444444444444444444444444}
      NumGlyphs = 2
    end
    object BitBtn8: TBitBtn
      Left = 315
      Top = 195
      Width = 179
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1083#1091#1078#1077#1073#1085#1086#1081' '#1079#1072#1087#1080#1089#1082#1080
      TabOrder = 4
      OnClick = BitBtn8Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000D40E0000D40E00001000000010000000000000001010
        10004F4F4F0077777700B8A38800D0BFB900CEC8C800E8DCCF000000FF00DEDE
        DE00EFEFEF00F7F1E800FFF7EF00FFF7F700FFFFF700FFFFFF00882222222221
        2388883222222222238885556556565542888596966666665388859B77777777
        528886DEAAAAAAAA638885900C777710538885F11FAAAA11638885BBDBD77777
        628886EFFFFAAAAA638885B000000000528885F111111111638885BBCCCBBB77
        638886EFFFFFFDFA638885B000000000628885F111111111938885BECBCCCB9B
        528886EFFFFFFFDF638885AF00000000538885FF11111111938885DFFCCBDBBB
        528885FFFFFFFFFD638885D00FECBC00538886E11FFFFF11938885AFFFFFCBB7
        438885FFFFFFFFFF638885DFFF000C44448885FFFF111F53458885CFEFEFEC74
        488886DFFFFEFF95588886757575757488888999999999958888}
      NumGlyphs = 2
    end
  end
  object Panel6: TPanel
    Left = 496
    Top = 424
    Width = 496
    Height = 222
    TabOrder = 5
    DesignSize = (
      496
      222)
    object Label6: TLabel
      Left = 219
      Top = 4
      Width = 58
      Height = 13
      Caption = #1055#1077#1088#1077#1089#1086#1088#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid2: TDBGrid
      Left = 2
      Top = 20
      Width = 491
      Height = 199
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clWhite
      DataSource = DM.srPer
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
          FieldName = 'art_code'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
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
          FieldName = 'names'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 255
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Summa'
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 58
          Visible = True
        end>
    end
  end
end
