object SrokMovF: TSrokMovF
  Left = 557
  Top = 186
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'SrokMovF'
  ClientHeight = 521
  ClientWidth = 985
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
    985
    521)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 385
    Top = 4
    Width = 214
    Height = 16
    Anchors = [akTop]
    Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1089#1088#1086#1082#1086#1074#1099#1093' '#1090#1086#1074#1072#1088#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 3
    Top = 90
    Width = 980
    Height = 401
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.srSrokMov
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = #1050#1086#1076'_I_720'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1043#1088'. '#1087#1088#1080#1073'._I_540'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1043#1088'. '#1087#1088#1080#1073'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'_S_4880'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 488
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1055#1086#1089#1083'. '#1087#1088#1080#1093'._S_780'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1089#1083'. '#1087#1088#1080#1093'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1054#1089#1090'. '#1085#1072#1095'._I_570'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1054#1089#1090'. '#1085#1072#1095'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1055#1088#1080#1093'._I_400'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1080#1093'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1042#1086#1079#1088'._I_410'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1042#1086#1079#1088'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1056#1077#1072#1083#1080#1079'._I_500'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1056#1077#1072#1083#1080#1079'.'
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
        FieldName = #1054#1089#1090'. '#1082#1086#1085'._I_570'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1054#1089#1090'. '#1082#1086#1085'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 2
    Top = 25
    Width = 981
    Height = 61
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    object Label2: TLabel
      Left = 13
      Top = 10
      Width = 119
      Height = 13
      Caption = #1057'                        '#1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 13
      Top = 37
      Width = 33
      Height = 13
      Caption = #1052#1077#1089#1103#1094
    end
    object Label3: TLabel
      Left = 475
      Top = 10
      Width = 76
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object Label4: TLabel
      Left = 635
      Top = 8
      Width = 131
      Height = 48
      AutoSize = False
      Caption = #1057#1082#1086#1083#1100#1082#1086' '#1086#1089#1090#1072#1083#1086#1089#1100' '#1084#1077#1089#1103#1094#1077#1074' '#1076#1086' '#1082#1086#1085#1094#1072' '#1089#1088#1086#1082#1072' '#1075#1086#1076#1085#1086#1089#1090#1080
      WordWrap = True
    end
    object SpeedButton1: TSpeedButton
      Left = 860
      Top = 15
      Width = 32
      Height = 32
      Hint = #1059#1089#1090#1072#1086#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000130B0000130B000000010000000100009C3100000063
        0000CE63000000730000D6840000008C0000009C000063313100218C42002194
        420021944A00219C4A00FFAD4A0029A5520029AD520031AD520039B552004AB5
        520029B55A0031BD5A0039BD630039C6630031CE630042C66B0052C66B005AC6
        6B0042D66B0052D67B005ADE7B0073DE940000009C00FFCE9C00009CCE000000
        DE0000A5EF00FF00FF004242FF0000BDFF009CDEFF009CFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00232323232323
        2323232301232323232323232323232323232323232323232323232306012323
        2323232323232323232323232323232323232323060A01232323232323232323
        23232323232323232323232306160A0123232323232323232323232323232323
        2323232306161201232323232323232323232323232323232323232306161201
        2323232323232323232323232323232323232323061612012323232323232323
        2323232323232323232323230616120123232323232323232323232323232323
        232323060D0D0A0A012323232323232323232323232323232323060D1A0E0D0D
        0801232323232323232323232323232323060F1A13120E0D0A08012323232323
        232323232323232306101D151312120E0D0A0801232323232323232323232306
        191D1C141212120E0D0D0A080123232323232323232306191D1B171205050306
        0E0D0B0A08012323232323232306191D1C050306262620080503030B0A080123
        232323232311050303272725262626201E1E0805030308232323232323010508
        25272727222620211E211E08080101232323232323230101082227272722211E
        2121211E01232323232323232323070201012227251E1E21212121211E232323
        2323232323230702020200251E24241E2121211E23232323232323232323070C
        00000202001E24241E211E232323232323232323232307071F0C040404071E1E
        1E1E2323232323232323232323232307071F1F070723231E2323232323232323
        2323232323232323230707232323232323232323232323232323}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object dtStart: TDateTimePicker
      Left = 26
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
      Left = 137
      Top = 6
      Width = 86
      Height = 21
      Date = 38786.999988425920000000
      Time = 38786.999988425920000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object ComboBox2: TComboBox
      Left = 54
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
    object GroupBox1: TGroupBox
      Left = 230
      Top = 2
      Width = 236
      Height = 54
      Caption = ' '#1043#1088#1091#1087#1087#1099' '#1087#1088#1080#1073#1099#1083#1100#1085#1086#1089#1090#1080
      TabOrder = 3
      object grAll: TCheckBox
        Left = 8
        Top = 15
        Width = 46
        Height = 17
        Caption = #1042#1089#1077
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = grAllClick
      end
      object gr1: TCheckBox
        Left = 60
        Top = 15
        Width = 38
        Height = 17
        Caption = '1-'#1103
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = gr1Click
      end
      object gr2: TCheckBox
        Left = 60
        Top = 32
        Width = 38
        Height = 17
        Caption = '2-'#1103
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = gr1Click
      end
      object gr3: TCheckBox
        Left = 110
        Top = 15
        Width = 38
        Height = 17
        Caption = '3-'#1103
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = gr1Click
      end
      object gr4: TCheckBox
        Left = 110
        Top = 32
        Width = 38
        Height = 17
        Caption = '4-'#1103
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = gr1Click
      end
      object gr5: TCheckBox
        Left = 155
        Top = 15
        Width = 38
        Height = 17
        Caption = '5-'#1103
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = gr1Click
      end
      object gr6: TCheckBox
        Left = 155
        Top = 32
        Width = 38
        Height = 17
        Caption = '6-'#1103
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = gr1Click
      end
      object gr7: TCheckBox
        Left = 195
        Top = 15
        Width = 38
        Height = 17
        Caption = '7-'#1103
        Checked = True
        State = cbChecked
        TabOrder = 7
        OnClick = gr1Click
      end
    end
    object Edit1: TEdit
      Left = 475
      Top = 25
      Width = 141
      Height = 21
      TabOrder = 4
    end
    object ComboBox1: TComboBox
      Left = 775
      Top = 25
      Width = 71
      Height = 21
      Style = csDropDownList
      DropDownCount = 20
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = ' '
      Items.Strings = (
        ' '
        '1'
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
        '12')
    end
  end
  object BitBtn1: TBitBtn
    Left = 877
    Top = 494
    Width = 106
    Height = 25
    Anchors = [akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 2
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
  object BitBtn2: TBitBtn
    Left = 3
    Top = 494
    Width = 128
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072
    TabOrder = 3
    OnClick = BitBtn2Click
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
  object PopupMenu1: TPopupMenu
    Left = 55
    Top = 165
    object N1: TMenuItem
      Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1090#1086#1074#1072#1088#1072'...'
      ShortCut = 120
      OnClick = N1Click
    end
  end
end
