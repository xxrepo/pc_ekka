object JReocF: TJReocF
  Left = 545
  Top = 245
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'JReocF'
  ClientHeight = 521
  ClientWidth = 509
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
    509
    521)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 508
    Height = 61
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 0
    object Label8: TLabel
      Left = 5
      Top = 37
      Width = 33
      Height = 13
      Caption = #1052#1077#1089#1103#1094
    end
    object Label5: TLabel
      Left = 5
      Top = 10
      Width = 123
      Height = 13
      Caption = #1057'                         '#1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox2: TComboBox
      Left = 46
      Top = 34
      Width = 177
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
    object dtStart: TDateTimePicker
      Left = 19
      Top = 6
      Width = 89
      Height = 21
      Date = 39799.000000000000000000
      Time = 39799.000000000000000000
      TabOrder = 1
    end
    object dtEnd: TDateTimePicker
      Left = 134
      Top = 6
      Width = 89
      Height = 21
      Date = 39799.999988425920000000
      Time = 39799.999988425920000000
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 226
      Top = 4
      Width = 110
      Height = 25
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object CheckBox2: TCheckBox
      Left = 229
      Top = 36
      Width = 177
      Height = 17
      Caption = #1041#1077#1079' '#1087#1088#1080#1093#1086#1076#1085#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 63
    Width = 508
    Height = 284
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      508
      284)
    object DBGrid1: TDBGrid
      Left = -1
      Top = -1
      Width = 509
      Height = 285
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DM.srActReoc
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NN_REOC'
          Title.Alignment = taCenter
          Title.Caption = #8470' '#1040#1082#1090#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATE_REOC'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 116
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUMVZR'
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084'. '#1076#1086' '#1087#1077#1088#1077#1086#1094'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUMPRC'
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084'. '#1087#1086#1089#1083#1077' '#1087#1077#1088#1077#1086#1094'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 107
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ForPrint'
          Title.Alignment = taCenter
          Title.Caption = #1044#1083#1103' '#1087#1077#1095#1072#1090#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 77
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 349
    Width = 508
    Height = 172
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      508
      172)
    object Label3: TLabel
      Left = 325
      Top = 9
      Width = 8
      Height = 13
      Caption = '%'
    end
    object Label1: TLabel
      Left = 11
      Top = 80
      Width = 486
      Height = 40
      Alignment = taCenter
      AutoSize = False
      Caption = 
        #1044#1083#1103' '#1090#1086#1075#1086' '#1095#1090#1086#1073#1099' '#1088#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1094#1077#1085#1085#1080#1082#1080' '#1087#1086' '#1074#1099#1073#1086#1088#1086#1095#1085#1099#1084' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1072#1084', '#1085#1072 +
        #1078#1084#1080#1090#1077' "'#1055#1077#1095#1072#1090#1100' '#1074#1099#1073#1086#1088#1086#1095#1085#1086'" '#1080' '#1097#1077#1083#1082#1085#1080#1090#1077' '#1074' '#1089#1087#1080#1089#1082#1077' '#1087#1086' '#1085#1091#1078#1085#1099#1084' '#1087#1077#1088#1077#1086#1094#1077#1085#1082 +
        #1072#1084' '#1087#1086' '#1082#1086#1083#1086#1085#1082#1077' "'#1044#1083#1103' '#1087#1077#1095#1072#1090#1080'" ('#1074#1099#1073#1088#1072#1085#1085#1099#1077' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1080' '#1087#1086#1076#1089#1074#1077#1090#1103#1090#1089#1103' '#1089#1083#1086 +
        #1074#1086#1084' "'#1044#1072'").'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label2: TLabel
      Left = 45
      Top = 124
      Width = 319
      Height = 13
      Caption = #1046#1077#1083#1090#1099#1084' '#1087#1086#1076#1089#1074#1077#1095#1080#1074#1072#1102#1090#1089#1103' '#1091#1078#1077' '#1085#1072#1087#1077#1095#1072#1090#1072#1085#1085#1099#1077' '#1072#1082#1090#1099' '#1087#1077#1088#1077#1086#1094#1077#1085#1086#1082
    end
    object Label4: TLabel
      Left = 45
      Top = 149
      Width = 273
      Height = 13
      Caption = #1046#1077#1083#1090#1099#1084' '#1087#1086#1076#1089#1074#1077#1095#1080#1074#1072#1102#1090#1089#1103' '#1091#1078#1077' '#1085#1072#1087#1077#1095#1072#1090#1072#1085#1085#1099#1077' '#1094#1077#1085#1085#1080#1082#1080
    end
    object BitBtn2: TBitBtn
      Left = 404
      Top = 3
      Width = 93
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = BitBtn2Click
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
    object BitBtn3: TBitBtn
      Left = 3
      Top = 3
      Width = 158
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100' '#1072#1082#1090#1072' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1080
      TabOrder = 1
      OnClick = bbPrnActReoc
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
    object BitBtn4: TBitBtn
      Left = 161
      Top = 3
      Width = 122
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100' '#1062#1077#1085#1085#1080#1082#1086#1074
      TabOrder = 2
      OnClick = BitBtn4Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000010000000000000008484
        8400C6C6C600F7E7D600FFF7EF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        5555555555555555555551111111111111115111111111111111000000000000
        0001111111111111111103334466666644011222221222222211034000666616
        1401122111221212121104466666611414011221222221121211046000006666
        4401122111112212211106666666666443011222221222222211061611666430
        0301121211222221121106666666443333011222222222222211000000000000
        0005111111111111111555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
    end
    object ComboBox1: TComboBox
      Left = 284
      Top = 5
      Width = 40
      Height = 21
      DropDownCount = 20
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = '0'
      Items.Strings = (
        '0'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '20'
        '25')
    end
    object CheckBox1: TCheckBox
      Left = 4
      Top = 34
      Width = 327
      Height = 17
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1094#1077#1085#1085#1080#1082#1080' '#1087#1086' '#1074#1089#1077#1084' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1072#1084' '#1077#1076#1080#1085#1099#1084' '#1089#1087#1080#1089#1082#1086#1084
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = CheckBox1Click
    end
    object RadioButton1: TRadioButton
      Left = 4
      Top = 55
      Width = 91
      Height = 17
      Caption = #1042#1089#1077' '#1094#1077#1085#1085#1080#1082#1080
      Checked = True
      TabOrder = 5
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 104
      Top = 55
      Width = 111
      Height = 17
      Caption = #1058#1086#1083#1100#1082#1086' '#1074#1080#1090#1088#1080#1085#1072
      TabOrder = 6
    end
    object RadioButton3: TRadioButton
      Left = 234
      Top = 55
      Width = 136
      Height = 17
      Caption = #1054#1089#1090#1072#1083#1100#1085#1099#1077' '#1094#1077#1085#1085#1080#1082#1080
      TabOrder = 7
    end
    object CheckBox3: TCheckBox
      Left = 335
      Top = 34
      Width = 116
      Height = 17
      Caption = #1055#1077#1095#1072#1090#1100' '#1074#1099#1073#1086#1088#1086#1095#1085#1086
      TabOrder = 8
      OnClick = CheckBox3Click
    end
    object Panel4: TPanel
      Left = 5
      Top = 120
      Width = 34
      Height = 21
      Color = clYellow
      TabOrder = 9
    end
    object Panel5: TPanel
      Left = 5
      Top = 145
      Width = 34
      Height = 21
      Color = clLime
      TabOrder = 10
    end
  end
  object pmPrnReg: TPopupMenu
    Left = 30
    Top = 133
    object N1: TMenuItem
      Tag = 1
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1072#1083#1092#1072#1074#1080#1090#1091'...'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Tag = 2
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1085#1086#1084#1077#1088#1072#1084' '#1087#1086#1083#1086#1082'...'
      OnClick = N1Click
    end
  end
end
