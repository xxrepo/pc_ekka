object RepKassirSumm1F: TRepKassirSumm1F
  Left = 689
  Top = 247
  Width = 541
  Height = 492
  BorderIcons = [biSystemMenu]
  Caption = 'RepKassirSumm1F'
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
    533
    465)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 1
    Top = 1
    Width = 530
    Height = 115
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      530
      115)
    object Label1: TLabel
      Left = 7
      Top = 10
      Width = 9
      Height = 13
      Caption = #1057
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
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
    object Label8: TLabel
      Left = 7
      Top = 37
      Width = 39
      Height = 13
      Caption = #1052#1077#1089#1103#1094
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 222
      Top = 10
      Width = 49
      Height = 13
      Caption = #8470' '#1082#1072#1089#1089#1099':'
    end
    object Label4: TLabel
      Left = 7
      Top = 87
      Width = 50
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 151
      Top = 87
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
    object bbRefresh: TBitBtn
      Left = 386
      Top = 18
      Width = 125
      Height = 31
      Anchors = [akTop, akRight]
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 3
      OnClick = bbRefreshClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000D40E0000D40E0000100000001000000000000000FF00
        00000080000000FF000080808000FFFFFF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000111111111111
        1111111111111111111111111100001111111111115555111111111100333300
        1111111155444455111111103333333301111115444444445111112333222233
        3011114444444444451111233211112330111144441111444511123301111112
        3301144451111114445112330111111233011444511111144451123301111112
        3301144451111114445112330111001233011444511155144451112330112303
        3011114445114454451111233011233330111144451144444511111221112333
        0111111441114444511111111111233330111111111144444511111111112222
        2011111111114444451111111111111111111111111111111111}
      NumGlyphs = 2
    end
    object CheckBox1: TCheckBox
      Left = 7
      Top = 60
      Width = 91
      Height = 17
      Caption = #1058#1086#1083#1100#1082#1086' '#1085#1086#1095#1100
      TabOrder = 4
    end
    object cbKassa: TComboBox
      Left = 276
      Top = 6
      Width = 66
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      OnCloseUp = cbKassaCloseUp
    end
    object CheckBox3: TCheckBox
      Left = 102
      Top = 60
      Width = 156
      Height = 17
      Caption = #1041#1077#1079' '#1074#1086#1079#1074#1088#1072#1090#1086#1074' '#1086#1090' '#1087#1086#1082#1091#1087
      TabOrder = 6
    end
    object tmStart: TDateTimePicker
      Left = 60
      Top = 83
      Width = 86
      Height = 21
      Date = 36526.000000000000000000
      Time = 36526.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Kind = dtkTime
      ParentFont = False
      TabOrder = 7
    end
    object tmEnd: TDateTimePicker
      Left = 171
      Top = 83
      Width = 86
      Height = 21
      Date = 36526.999988425920000000
      Time = 36526.999988425920000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Kind = dtkTime
      ParentFont = False
      TabOrder = 8
    end
  end
  object BitBtn1: TBitBtn
    Left = 214
    Top = 438
    Width = 106
    Height = 25
    Anchors = [akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
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
  object Panel1: TPanel
    Left = 1
    Top = 120
    Width = 530
    Height = 314
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      530
      314)
    object DBGrid1: TDBGrid
      Left = 2
      Top = 0
      Width = 526
      Height = 312
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 15790051
      DataSource = DM.srKSumm1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'Users'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1050#1072#1089#1089#1080#1088
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 319
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Summa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1042#1099#1088#1091#1095#1082#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Caption = #1050#1086#1083'. '#1095#1077#1082#1086#1074
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 72
          Visible = True
        end>
    end
  end
end
