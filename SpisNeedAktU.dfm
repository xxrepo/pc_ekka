object SpisNeedAktF: TSpisNeedAktF
  Left = 488
  Top = 222
  BorderStyle = bsDialog
  Caption = 'SpisNeedAktF'
  ClientHeight = 530
  ClientWidth = 912
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
    912
    530)
  PixelsPerInch = 96
  TextHeight = 13
  object pnSearch: TLabel
    Left = 4
    Top = 506
    Width = 4
    Height = 16
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 36
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 8
      Width = 546
      Height = 18
      Caption = #1053#1077#1087#1077#1088#1077#1076#1072#1085#1085#1099#1077' '#1087#1086#1079#1080#1094#1080#1080' '#1087#1086' '#1074#1086#1079#1074#1088#1072#1090#1072#1084' ('#1085#1077#1090' '#1072#1082#1090#1072' '#1087#1088#1080#1077#1084#1072' '#1087#1077#1088#1077#1076#1072#1095#1080') '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object CheckBox1: TCheckBox
      Left = 725
      Top = 10
      Width = 181
      Height = 17
      Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1103#1097#1080#1082#1080' '#1080' '#1082#1088#1099#1096#1082#1080
      TabOrder = 0
      OnClick = CheckBox1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 37
    Width = 911
    Height = 462
    DataSource = DM.srSpisNA
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = DBGrid1KeyPress
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
        Width = 71
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
        Width = 372
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kol'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nn_nakl'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_nakl'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descr'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1080#1095#1080#1085#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 161
        Visible = True
      end>
  end
  object BitBtn6: TBitBtn
    Left = 787
    Top = 503
    Width = 124
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 2
    OnClick = BitBtn6Click
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
    Left = 655
    Top = 503
    Width = 132
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072
    TabOrder = 3
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
end
