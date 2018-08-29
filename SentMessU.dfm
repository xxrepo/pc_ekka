object SentMessF: TSentMessF
  Left = 550
  Top = 364
  BorderStyle = bsDialog
  Caption = 'SentMessF'
  ClientHeight = 311
  ClientWidth = 704
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
    704
    311)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 5
    Width = 132
    Height = 17
    Caption = 'C '#1074#1072#1087#1099#1074#1072#1087#1099#1074#1087' sd'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clMaroon
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 5
    Top = 269
    Width = 402
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 
      #1044#1083#1103' '#1087#1086#1083#1085#1086#1075#1086' '#1087#1088#1086#1089#1084#1086#1090#1088#1072' '#1090#1077#1082#1089#1090#1072' '#1089#1086#1086#1073#1097#1077#1085#1080#1103', '#1097#1077#1083#1082#1085#1080#1090#1077'  '#1087#1086' '#1085#1077#1084#1091'  2 '#1088#1072#1079 +
      #1072' '#1084#1099#1096#1100#1102
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 214
    Top = 291
    Width = 172
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1103' '#1086#1078#1080#1076#1072#1102#1097#1080#1077' '#1086#1090#1087#1088#1072#1074#1082#1080
    Color = clBtnFace
    ParentColor = False
  end
  object Label3: TLabel
    Left = 24
    Top = 291
    Width = 135
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
  end
  object Label4: TLabel
    Left = 7
    Top = 33
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
  object Label5: TLabel
    Left = 111
    Top = 33
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
  object Label8: TLabel
    Left = 227
    Top = 31
    Width = 33
    Height = 13
    Caption = #1052#1077#1089#1103#1094
  end
  object BitBtn2: TBitBtn
    Left = 579
    Top = 285
    Width = 121
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
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
  object pn1: TPanel
    Left = 195
    Top = 291
    Width = 14
    Height = 14
    Anchors = [akLeft, akBottom]
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clYellow
    TabOrder = 2
  end
  object Panel27: TPanel
    Left = 5
    Top = 291
    Width = 14
    Height = 14
    Anchors = [akLeft, akBottom]
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clLime
    TabOrder = 3
  end
  object dtStart: TDateTimePicker
    Left = 20
    Top = 29
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
  object dtEnd: TDateTimePicker
    Left = 131
    Top = 28
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
    TabOrder = 5
  end
  object ComboBox2: TComboBox
    Left = 268
    Top = 28
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
    TabOrder = 6
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
  object DBGrid2: TDBGrid
    Left = 5
    Top = 55
    Width = 695
    Height = 205
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.srSentM
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = DBGrid2DrawColumnCell
    OnDblClick = DBGrid2DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DateM'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Mess'
        Title.Alignment = taCenter
        Title.Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 263
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FromU'
        Title.Alignment = taCenter
        Title.Caption = #1054#1090' '#1082#1086#1075#1086
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateRead'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1074' '#1086#1092#1080#1089
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 154
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 460
    Top = 285
    Width = 116
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100'...'
    TabOrder = 7
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
  object BitBtn3: TBitBtn
    Left = 585
    Top = 15
    Width = 111
    Height = 25
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100
    TabOrder = 8
    OnClick = BitBtn3Click
  end
end
