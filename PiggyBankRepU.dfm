object PiggyBankRepF: TPiggyBankRepF
  Left = 637
  Top = 308
  BorderStyle = bsDialog
  Caption = 'PiggyBankRepF'
  ClientHeight = 171
  ClientWidth = 578
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
    578
    171)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 15
    Width = 66
    Height = 13
    Caption = #1042#1080#1076' '#1086#1090#1095#1077#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbRepList: TComboBox
    Left = 10
    Top = 35
    Width = 559
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnCloseUp = cbRepListCloseUp
    Items.Strings = (
      '1. '#1042#1099#1074#1086#1076' '#1086#1073#1097#1077#1075#1086' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1087#1086' '#1082#1086#1087#1080#1083#1082#1077
      '2. '#1042#1099#1074#1086#1076' '#1089#1091#1084#1084#1072#1088#1085#1086#1075#1086' '#1080#1090#1086#1075#1072' '#1087#1086' '#1072#1082#1094#1080#1103#1084
      '3. '#1042#1099#1074#1086#1076' '#1089#1091#1084#1084#1072#1088#1085#1086#1075#1086'  '#1080#1090#1086#1075#1072' '#1087#1086' '#1090#1080#1087#1072#1084' '#1072#1082#1094#1080#1081)
  end
  object BitBtn1: TBitBtn
    Left = 145
    Top = 139
    Width = 171
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1086#1090#1095#1077#1090
    TabOrder = 1
    OnClick = BitBtn1Click
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
  object BitBtn2: TBitBtn
    Left = 323
    Top = 139
    Width = 110
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    ModalResult = 2
    TabOrder = 2
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
  object Panel1: TPanel
    Left = 10
    Top = 65
    Width = 226
    Height = 61
    BevelOuter = bvLowered
    TabOrder = 3
    Visible = False
    object Label8: TLabel
      Left = 7
      Top = 37
      Width = 33
      Height = 13
      Caption = #1052#1077#1089#1103#1094
    end
    object Label2: TLabel
      Left = 111
      Top = 10
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
    object Label3: TLabel
      Left = 7
      Top = 10
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
    object dtStart: TDateTimePicker
      Left = 20
      Top = 6
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
      TabOrder = 0
    end
    object dtEnd: TDateTimePicker
      Left = 131
      Top = 6
      Width = 86
      Height = 21
      Date = 38786.999988425930000000
      Time = 38786.999988425930000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object ComboBox2: TComboBox
      Left = 48
      Top = 34
      Width = 169
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
      TabOrder = 2
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
  end
  object Panel2: TPanel
    Left = 240
    Top = 65
    Width = 328
    Height = 61
    BevelOuter = bvLowered
    TabOrder = 4
    Visible = False
    object Label4: TLabel
      Left = 5
      Top = 10
      Width = 128
      Height = 13
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1080#1087' '#1073#1086#1085#1091#1089#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbPrior: TComboBox
      Left = 5
      Top = 30
      Width = 316
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
end
