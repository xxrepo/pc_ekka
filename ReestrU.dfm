object ReestrF: TReestrF
  Left = 671
  Top = 211
  BorderStyle = bsDialog
  Caption = 'ReestrF'
  ClientHeight = 634
  ClientWidth = 1001
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
    1001
    634)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 317
    Top = 10
    Width = 31
    Height = 13
    Caption = #1044#1072#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 21
    Top = 9
    Width = 190
    Height = 13
    Caption = #1056#1077#1077#1089#1090#1088' '#1083#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 35
    Width = 1001
    Height = 570
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.srReestr
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = #8470' '#1087'/'#1087'_S_700'
        Title.Caption = #8470' '#1087'/'#1087
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1087#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1072' '#1090#1072' '#1085#1086#1084#1077#1088' '#1083'i'#1094#1077#1085#1079'i'#1111'_S_4000'
        Title.Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1087#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1072' '#1090#1086' '#1085#1086#1084#1077#1088' '#1083'i'#1094#1077#1085#1079'i'#1111
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1053#1086#1084#1077#1088' i '#1076#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1111'_S_2200'
        Title.Caption = #1053#1086#1084#1077#1088' i '#1076#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1111
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 
          #1053#1072#1079#1074#1072' '#1083'i'#1082#1072#1088#1089#1100#1082#1086#1075#1086' '#1079#1072#1089#1086#1073#1091' '#1090#1072' '#1081#1086#1075#1086' '#1083'i'#1082#1072#1088#1089#1100#1082#1072' '#1092#1086#1088#1084#1072', '#1076#1072#1090#1072' '#1088#1077#1108#1089#1090#1088#1072#1094#1110 +
          #1111' '#1090#1072' '#1085#1086#1084#1077#1088' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1086#1075#1086' '#1087#1086#1089#1074#1110#1076#1095#1077#1085#1085#1103'_S_5000'
        Title.Caption = 
          #1053#1072#1079#1074#1072' '#1083'i'#1082#1072#1088#1089#1100#1082#1086#1075#1086' '#1079#1072#1089#1086#1073#1091' '#1090#1072' '#1081#1086#1075#1086' '#1083'i'#1082#1072#1088#1089#1100#1082#1072' '#1092#1086#1088#1084#1072', '#1076#1072#1090#1072' '#1088#1077#1108#1089#1090#1088#1072#1094#1110 +
          #1111' '#1090#1072' '#1085#1086#1084#1077#1088' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1086#1075#1086' '#1087#1086#1089#1074#1110#1076#1095#1077#1085#1085#1103
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1074#1080#1088#1086#1073#1085#1080#1082#1072'_S_2200'
        Title.Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1074#1080#1088#1086#1073#1085#1080#1082#1072
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1053#1086#1084#1077#1088' '#1089#1077#1088#1110#1111'_S_1200'
        Title.Caption = #1053#1086#1084#1077#1088' '#1089#1077#1088#1110#1111
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1053#1086#1084#1077#1088' '#1110' '#1076#1072#1090#1072' '#1089#1077#1088#1090#1080#1092#1110#1082#1072#1090#1072' '#1103#1082#1086#1089#1090'i '#1074#1080#1088#1086#1073#1085#1080#1082#1072'_S_2100'
        Title.Caption = #1053#1086#1084#1077#1088' '#1110' '#1076#1072#1090#1072' '#1089#1077#1088#1090#1080#1092#1110#1082#1072#1090#1072' '#1103#1082#1086#1089#1090'i '#1074#1080#1088#1086#1073#1085#1080#1082#1072
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1050'i'#1083#1100#1082'i'#1089#1090#1100' '#1086#1076#1077#1088#1078#1072#1085#1080#1093' '#1091#1087#1072#1082#1086#1074#1086#1082'_N_1900'
        Title.Caption = #1050'i'#1083#1100#1082'i'#1089#1090#1100' '#1086#1076#1077#1088#1078#1072#1085#1080#1093' '#1091#1087#1072#1082#1086#1074#1086#1082
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1058#1077#1088#1084'i'#1085' '#1087#1088#1080#1076#1072#1090#1085#1086#1089#1090'i '#1083'i'#1082#1072#1088#1089#1100#1082#1086#1075#1086' '#1079#1072#1089#1086#1073#1091'_S_2100'
        Title.Caption = #1058#1077#1088#1084'i'#1085' '#1087#1088#1080#1076#1072#1090#1085#1086#1089#1090'i '#1083'i'#1082#1072#1088#1089#1100#1082#1086#1075#1086' '#1079#1072#1089#1086#1073#1091
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1091#1087#1086#1074#1085#1086#1074#1072#1078#1077#1085#1085#1086#1102' '#1086#1089#1086#1073#1086#1102'_S_2600'
        Title.Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1091#1087#1086#1074#1085#1086#1074#1072#1078#1077#1085#1085#1086#1102' '#1086#1089#1086#1073#1086#1102
        Visible = True
      end>
  end
  object dtStart: TDateTimePicker
    Left = 355
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
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 445
    Top = 608
    Width = 111
    Height = 25
    Anchors = [akTop]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
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
  object BitBtn1: TBitBtn
    Left = 715
    Top = 4
    Width = 136
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn3: TBitBtn
    Left = 855
    Top = 4
    Width = 145
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 4
    OnClick = BitBtn3Click
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
