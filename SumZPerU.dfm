object SumZPerF: TSumZPerF
  Left = 589
  Top = 237
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'SumZPerF'
  ClientHeight = 569
  ClientWidth = 346
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
    346
    569)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 510
    Width = 345
    Height = 26
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 0
    object Label4: TLabel
      Left = 6
      Top = 6
      Width = 44
      Height = 13
      Caption = #1057#1091#1084#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSumB: TLabel
      Left = 90
      Top = 6
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSumK: TLabel
      Left = 170
      Top = 6
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbRazn: TLabel
      Left = 250
      Top = 6
      Width = 70
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object BitBtn1: TBitBtn
    Left = 235
    Top = 541
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
  object Panel2: TPanel
    Left = 1
    Top = 0
    Width = 345
    Height = 91
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      345
      91)
    object Label1: TLabel
      Left = 13
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
    object Label2: TLabel
      Left = 117
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
    object lbKass: TLabel
      Left = 231
      Top = 10
      Width = 37
      Height = 13
      Caption = #1050#1072#1089#1089#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 68
      Top = 37
      Width = 33
      Height = 13
      Caption = #1052#1077#1089#1103#1094
    end
    object dtStart: TDateTimePicker
      Left = 26
      Top = 6
      Width = 86
      Height = 21
      Date = 38786.618706955990000000
      Time = 38786.618706955990000000
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
      Date = 38786.618719976900000000
      Time = 38786.618719976900000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object bbDays: TBitBtn
      Left = 38
      Top = 60
      Width = 118
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1056#1072#1089#1095#1077#1090' '#1087#1086' '#1076#1085#1103#1084
      TabOrder = 2
      OnClick = bbDaysClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000330B0000330B000010000000100000002E3C35004B75
        600098979500A9A9AC0000FF000039CE84005ED89C00B5B5BD009C9CC6009CDA
        EF00BDBDBD00BFC1D200D2D2D200DADEDE00D6E7E700EFEFEF00422222222222
        2344422222222222234443AAAAAAAA78734443AAAAAAAA33334443CDADDADDAB
        B34443CDCCDADDACA34447A7AA7AAAA3A74443A7AA7AA7A7A34443CFCDFAFDCF
        C34447CFCDFAFDCFC34447AAAAAAAAAAA34443AAAA7AAAA7A34447DFCFFAFFCF
        D74447DFCFFAFFCFD74447AAAAAC7AAAA74447AAAA7C3ABAA74447DFDFFCFFCF
        DA4447DFDFFCFFCFD7444AABAABCACCAC74447CABABCABCAC7444A99999CEFDF
        D74447CCCCCCFDDDDA444ACECEEEFEEDDA444ADCCDDDFDDDD7444AD115555555
        CA444AD122337A32C7444AC000000100CA444AC000010100DA444ACCACBCACBC
        CA444ACCACACACACCA444ACCCCDCDCCCCA444ACCCCDCDCCCCA44}
      NumGlyphs = 2
    end
    object cbKass: TComboBox
      Left = 272
      Top = 6
      Width = 59
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 3
      OnChange = cbKassChange
    end
    object ComboBox2: TComboBox
      Left = 109
      Top = 34
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
      TabOrder = 4
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
    object bbPeriod: TBitBtn
      Left = 156
      Top = 60
      Width = 151
      Height = 25
      Caption = #1057#1091#1084#1084#1072#1088#1085#1099#1081' '#1088#1072#1089#1095#1077#1090
      TabOrder = 5
      OnClick = bbPeriodClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E000000000000000000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF8F8F8F5050509090900000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF9F8F8F5F5F5FB09090CF
        9F9F9070706060609F8F8F5F5F5F8080800000FF0000FF0000FF0000FF0000FF
        0000FFCFA0A0CF9F9F8F6F6FB08F8FCF9F9FB08F8F907070CF9F9FBF8F8F6F6F
        6F0000FF0000FF0000FF0000FF0000FF7F7F7FBF9090CF9F9FCF9F9FCF9F9FCF
        9F9FCF9F9FCF9F9FCF9F9FB08F8F4F4F4F6F6F6F7F7F7F0000FF0000FFCF9F9F
        B08F8FB08F8FCF9F9FCF9F9FCF9F9FD0AFAFCF9F9FCF9F9FCF9F9FC09090B08F
        8FC09090605F5F0000FF0000FFCF9F9FCF9F9FCF9F9FCF9F9FB0A0A00000FF00
        00FF0000FF0000FFCF9F9FCF9F9FCF9F9FCF9F9FA090900000FF0000FFB09090
        CF9F9FCF9F9F907F7F0000FF0000FF0000FF0000FF0000FF0000FFCF9F9FCF9F
        9F8F7070606060808080CFAFAFBF9090CF9F9FC090907070700000FF0000FF00
        00FF0000FF0000FF0000FFCF9F9FCF9F9FB08F8FA08080505050CF9F9FCF9F9F
        CF9F9FAF80806060600000FF0000FF0000FF0000FF0000FF0000FFCFAFAFCF9F
        9FCF9F9FCF9F9F9F9F9FCFAFAFCFAFAFCF9F9FC090904F4F4F9F9F9F0000FF00
        00FF0000FF0000FF0000FFCF9F9FCF9F9FAF8080A08F8F0000FF0000FFC0A0A0
        CF9F9FCF9F9F8F6F6F5050509F9F9F0000FF0000FF0000FFB09F9FCF9F9FCF9F
        9F9F7F7F605F5F0000FF0000FFCF9F9FCF9F9FCF9F9FCF9F9F8F7070504F4F50
        50506060609F7F7FCF9F9FCF9F9FCF9F9FCF9F9FA090900000FF0000FFD0AFAF
        CFAFAFCFA0A0CF9F9FCF9F9FCF9F9FCF9F9FCF9F9FCF9F9FCF9F9FBF8F8FA080
        80CF9F9F0000FF0000FF0000FF0000FF0000FFD0A0A0CF9F9FCF9F9FCF9F9FCF
        9F9FCF9F9FCF9F9FCF9F9FBF90908080800000FF0000FF0000FF0000FF0000FF
        0000FFD0AFAFCF9F9FCFAFAFD0AFAFCF9F9FB08F8FBFA0A0CF9F9FCF9F9F0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFD0AFAFCF
        9F9FCF9F9F0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
    end
  end
  object Panel3: TPanel
    Left = 1
    Top = 93
    Width = 346
    Height = 415
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = -1
      Top = -1
      Width = 345
      Height = 416
      DataSource = DM.srSumZRep
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'Descr'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SumB'
          Title.Alignment = taCenter
          Title.Caption = #1055#1086' '#1041#1040#1047#1045
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SumK'
          Title.Alignment = taCenter
          Title.Caption = #1055#1086' '#1050#1040#1057#1057#1045
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Razn'
          Title.Alignment = taCenter
          Title.Caption = #1056#1072#1079#1085#1080#1094#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 78
          Visible = True
        end>
    end
  end
  object BitBtn2: TBitBtn
    Left = 5
    Top = 540
    Width = 75
    Height = 25
    Caption = 'Corr'
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object ComboBox1: TComboBox
    Left = 85
    Top = 542
    Width = 46
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 1
    TabOrder = 5
    Text = '2'
    Items.Strings = (
      '1'
      '2')
  end
  object Edit1: TEdit
    Left = 135
    Top = 542
    Width = 93
    Height = 21
    TabOrder = 6
  end
end
