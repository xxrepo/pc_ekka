object BackClientF: TBackClientF
  Left = 383
  Top = 258
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'BackClientF'
  ClientHeight = 349
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShortCut = FormShortCut
  DesignSize = (
    699
    349)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 2
    Width = 697
    Height = 70
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 8
      Width = 265
      Height = 17
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1084#1077#1088' '#1092#1080#1089#1082#1072#1083#1100#1085#1086#1075#1086' '#1063#1045#1050#1040
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 7
      Top = 35
      Width = 276
      Height = 32
      Caption = #1042#1074#1077#1076#1080#1090#1077' 4 '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1094#1080#1092#1088#1099' '#1079#1072#1074#1086#1076#1089#1082#1086#1075#1086' '#1085#1086#1084#1077#1088#1072' '#1082#1072#1089#1089#1086#1074#1086#1075#1086' '#1072#1087#1087#1072#1088#1072#1090#1072':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      WordWrap = True
    end
    object lbNum: TLabel
      Left = 295
      Top = 41
      Width = 22
      Height = 22
      Caption = #1042#1046
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clPurple
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSkd: TLabel
      Left = 600
      Top = 27
      Width = 68
      Height = 16
      Caption = #1057#1082#1080#1076#1082#1072' 7%'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object edNumb: TEdit
      Left = 345
      Top = 6
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object BitBtn4: TBitBtn
      Left = 470
      Top = 6
      Width = 118
      Height = 58
      Caption = #1053#1072#1081#1090#1080
      TabOrder = 2
      OnClick = BitBtn4Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000D40E0000D40E000010000000100000000000000000FF
        000080808000FFFFFF0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000111111111111
        1111111111111111111111111111111111111333331111133333000001111100
        0001222223111122222303000111110300012322231111232223030001111103
        0001232223331323222300000001000000012322222322222223003000000300
        0001232222222222222300300030030000012322222222222223003000300300
        0001213222223222222110000000000000111213222213222211110300010300
        0111112322232322231111000001000001111121322121322111111000111000
        1111111232311232311111103011103011111112323112323111111000111000
        1111111222111222111111111111111111111111111111111111}
      NumGlyphs = 2
    end
    object edVZH: TEdit
      Left = 385
      Top = 41
      Width = 81
      Height = 21
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 1
    Top = 75
    Width = 697
    Height = 240
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      697
      240)
    object Label3: TLabel
      Left = 5
      Top = 221
      Width = 338
      Height = 13
      Caption = #1063#1090#1086#1073#1099' '#1091#1076#1072#1083#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102', '#1074#1074#1077#1076#1080#1090#1077' '#1085#1091#1083#1077#1074#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1087#1086#1083#1103' "'#1050#1086#1083'-'#1074#1086'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 445
      Top = 219
      Width = 89
      Height = 17
      Caption = #1057#1091#1084#1084#1072' '#1095#1077#1082#1072':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lbSum: TLabel
      Left = 540
      Top = 217
      Width = 139
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object dbgBack: TDBGrid
      Left = -1
      Top = -1
      Width = 698
      Height = 217
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 14938105
      DataSource = DM.srBack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = dbgBackKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'ART_CODE'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAMES'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 473
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KOL'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CENA'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 63
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 1
    Top = 318
    Width = 697
    Height = 31
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      697
      31)
    object BitBtn1: TBitBtn
      Left = 584
      Top = 3
      Width = 110
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
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
    object bbBack: TBitBtn
      Left = 3
      Top = 3
      Width = 168
      Height = 25
      Caption = #1057#1076#1077#1083#1072#1090#1100' '#1074#1086#1079#1074#1088#1072#1090
      TabOrder = 1
      OnClick = bbBackClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333FF3333333333333003333333333333F77F3333333333300A033
        333333333F7737F33333333300AAA0333333333F773337FFFFFF3300AAAAA000
        00003F7733333777777700AAAAAAAAAAAAA0773FF33333FFFFF73300AAAAA000
        000033773FF337777777333300AAA03333333333773FF7F3333333333300A033
        33333333337737F3333333333333003333333333333377333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
end
