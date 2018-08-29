object VozrPartF: TVozrPartF
  Left = 553
  Top = 214
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'VozrPartF'
  ClientHeight = 615
  ClientWidth = 1000
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
    1000
    615)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgSpr: TDBGrid
    Left = 0
    Top = 30
    Width = 999
    Height = 371
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.srSprPart
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgSprDblClick
    OnKeyDown = dbgSprKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'art_code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1040#1088#1090' '#1082#1086#1076
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
        FieldName = 'kod_name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1055#1072#1088#1090#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NumSeriya'
        Title.Alignment = taCenter
        Title.Caption = #1057#1077#1088#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SrokGodn'
        Title.Alignment = taCenter
        Title.Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'names'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 470
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cena'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PL1'
        Title.Alignment = taCenter
        Title.Caption = #1054#1089#1085'.'
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
        FieldName = 'PL2'
        Title.Alignment = taCenter
        Title.Caption = #1042#1080#1090#1088'.'
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
        FieldName = 'PL3'
        Title.Alignment = taCenter
        Title.Caption = #1057#1082#1083'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 999
    Height = 30
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    object lbNakl: TLabel
      Left = 7
      Top = 7
      Width = 46
      Height = 16
      Caption = 'lbNakl'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 405
    Width = 999
    Height = 180
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.srSprPartCh
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'art_code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1040#1088#1090' '#1082#1086#1076
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kod_name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1055#1072#1088#1090#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NumSeriya'
        Title.Alignment = taCenter
        Title.Caption = #1057#1077#1088#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SrokGodn'
        Title.Alignment = taCenter
        Title.Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'names'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 447
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cena'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PL1'
        Title.Alignment = taCenter
        Title.Caption = #1054#1089#1085'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PL2'
        Title.Alignment = taCenter
        Title.Caption = #1042#1080#1090#1088'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PL3'
        Title.Alignment = taCenter
        Title.Caption = #1057#1082#1083'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 45
        Visible = True
      end>
  end
  object BitBtn2: TBitBtn
    Left = 891
    Top = 588
    Width = 108
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 3
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
    Left = 1
    Top = 588
    Width = 170
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1074#1086#1079#1074#1088#1072#1090
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000D40E0000D40E00000001000000010000D65A0000CE63
      0000DE630000CE6B0000D66B0000D6730000DE730000DE7B0000E7840000EF8C
      0000F78C0000F7940000CE630800D6730800DE730800D67B0800DE7B0800E784
      0800EF940800F7940800CE6B1000D6731000E7841000EF8C1000F7941000AD4A
      1800DE841800F7941800BD632100D6732100D67B2100DE842100F7AD2100AD63
      2900D67B2900DE842900E7942900FFAD2900B56B3900DE9C4200EFAD4200C684
      4A00D6944A00DE944A00DE9C4A00DE9C5200F7BD5200F7C65A00E7AD6300E7B5
      6300F7C66300E7AD7300E7B57B00F7D684008C8C8C00E7BD8C00EFBD8C009494
      9400F7DE9400FFDE94009C9C9C00F7DE9C00A5A5A500ADADAD00EFD6AD00B5B5
      B500EFCEB500BDBDBD00C6C6C600CECECE00D6D6D600DEDEDE00E7E7E700EFEF
      EF00F7F7F7000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004B4B4B4B4B4B
      4B4B4B4B4B4B4B4B4B4B393639393639363939363939363936394B4B4B4B4B4B
      4B4B4B31294B4B4B4B4B393639363939363936484339363939364B4B4B4B4B4B
      4B4B310D264B4B4B4B4B3939363939363939473E3F36393936394B4B4B4B4B4B
      4B2D1003214B4B4B4B4B39363939363936463E3C3E36393936394B4B4B4B4B4B
      2A150F010C0F1A1D4B4B393639393639453E3E39393E3F3F39364B4B4B4B4B2D
      1403050D11171B144B4B3936393936453E3C3C3E3F43433C39394B4B4B4B2C0D
      03010507111718144B4B39363936453E3C393E3E3F41433C39364B4B4B2B151E
      1E0303070811180C4B4B393639453C3F41393C3E3F3F413C36394B4B40281E37
      340105060811090C4B4B39394C464149493C3C3E3E41413936394B4B4B3A3138
      421E0307080909004B4B3936394C494A4C3F3C3E3F3F413939364B4B4B4B3D32
      3733030708080A004B4B393639364C494A483C3E3E413F3639364B4B4B4B4B3A
      323323051112090C4B4B39363939364C4948413E3F41413939394B4B4B4B4B4B
      3A3223030F20201B4B4B3936393936394C4944393E45464339364B4B4B4B4B4B
      4B3A2F1E194B4B4B4B4B393639363939364C493F3639363939364B4B4B4B4B4B
      4B4B3A2E1C4B4B4B4B4B39393639393639394C483C39393639394B4B4B4B4B4B
      4B4B4B35274B4B4B4B4B3639363936393639364C453639363936}
    NumGlyphs = 2
  end
  object BitBtn3: TBitBtn
    Left = 171
    Top = 588
    Width = 145
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
    TabOrder = 5
    OnClick = BitBtn3Click
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
  object BitBtn4: TBitBtn
    Left = 316
    Top = 588
    Width = 125
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
    TabOrder = 6
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
end
