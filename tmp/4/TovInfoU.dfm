object TovInfoF: TTovInfoF
  Left = 667
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'TovInfoF'
  ClientHeight = 611
  ClientWidth = 937
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShortCut = FormShortCut
  DesignSize = (
    937
    611)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 35
    Width = 88
    Height = 16
    Hint = 
      #1044#1077#1092#1077#1082#1090#1091#1088#1072' '#1086#1079#1085#1072#1095#1072#1077#1090', '#1095#1090#1086' '#1087#1077#1088#1087#1072#1088#1072#1090#1072' '#1085#1077#1090' '#1074' '#1087#1088#1072#1081#1089#1072#1093' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074' '#1079#1072'  ' +
      #1074#1095#1077#1088#1072#1096#1085#1080#1081' '#1076#1077#1085#1100'.'
    Caption = #1044#1077#1092#1077#1082#1090#1091#1088#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label2: TLabel
    Left = 5
    Top = 60
    Width = 144
    Height = 16
    Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1088#1077#1087#1072#1088#1072#1090#1072' '#1085#1072' '#1089#1082#1083#1072#1076#1077'.'
    Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1089#1082#1083#1072#1076#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label3: TLabel
    Left = 5
    Top = 85
    Width = 192
    Height = 16
    Hint = 
      #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '#1087#1088#1077#1087#1072#1088#1072#1090#1072' '#1074' '#1072#1087#1090#1077#1082#1072#1093' '#1089#1077#1090#1080' '#1086#1073#1085#1086#1074#1083#1103#1077#1090#1089#1103' '#1085#1077#1089#1082#1086#1083#1100#1082 +
      #1086' '#1088#1072#1079' '#1074' '#1089#1091#1090#1082#1080'. '#1055#1086#1101#1090#1086#1084#1091' '#1090#1086#1095#1085#1086#1077' '#1082#1086#1083'-'#1074#1086' '#1087#1088#1077#1087#1072#1088#1072#1090#1072' '#1085#1091#1078#1085#1086' '#1091#1090#1086#1095#1085#1103#1090#1100' '#1074' ' +
      #1090#1077#1083#1077#1092#1086#1085#1085#1086#1084' '#1088#1077#1078#1080#1084#1077'.'
    Caption = #1054#1089#1090#1072#1090#1086#1082' '#1074' '#1072#1087#1090#1077#1095#1085#1086#1081' '#1089#1077#1090#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object sbSw: TSpeedButton
    Left = 335
    Top = 589
    Width = 246
    Height = 19
    Anchors = [akLeft, akBottom]
    Caption = #1055#1086#1076#1088#1086#1073#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1072#1087#1090#1077#1082#1072#1084' '
    Flat = True
    OnClick = sbSwClick
  end
  object DBText1: TDBText
    Left = 480
    Top = 35
    Width = 451
    Height = 51
    DataField = 'Adress'
    DataSource = DM.dsTovInfo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 425
    Top = 35
    Width = 50
    Height = 16
    Caption = #1040#1076#1088#1077#1089':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label5: TLabel
    Left = 425
    Top = 90
    Width = 72
    Height = 16
    Caption = #1058#1077#1083#1077#1092#1086#1085':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object DBText2: TDBText
    Left = 500
    Top = 90
    Width = 431
    Height = 17
    DataField = 'phone'
    DataSource = DM.dsTovInfo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object imTrub: TImage
    Left = 205
    Top = 40
    Width = 8
    Height = 12
    AutoSize = True
    Picture.Data = {
      07544269746D617056010000424D560100000000000036000000280000000800
      00000C0000000100180000000000200100000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFF1F1F1AEAEAE8F8F8F939393D1D1D1FFFFFFFFFFFF
      EAEAEA9595958989898989898989899A9A9AFFFFFFF6F6F69696968989898989
      898989898D8D8DE6E6E6FFFFFFB8B8B8898989A8A8A8F6F6F6C8C8C8D6D6D6FF
      FFFFF0F0F08B8B8B909090F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFC4C4C4898989
      C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F898989E4E4E4FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF8C8C8C898989F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF8C8C8C898989AFAFAFDADADAFFFFFFFFFFFFFFFFFFFFFFFF949494898989
      898989959595FFFFFFFFFFFFFFFFFFFFFFFFB8B8B8898989898989A5A5A5FFFF
      FFFFFFFFFFFFFFFFFFFFFAFAFAB5B5B58D8D8DBEBEBEFFFFFFFFFFFFFFFFFFFF
      FFFF}
    Visible = False
  end
  object im911: TImage
    Left = 225
    Top = 40
    Width = 23
    Height = 16
    AutoSize = True
    Picture.Data = {
      07544269746D617036010000424D360100000000000076000000280000001700
      0000100000000100040000000000C0000000130B0000130B0000100000001000
      0000297300002B6D080037791C0066925A0092A79300B4BDB600C3CAC800CED5
      D200D6DEDA00E1E8DF00E7EFE700EFF3EF00EFF7F700F7FBF700F7FFFF00FFFF
      FF00FFFFDBBBAB9BBDDFFFFFFFF0FFFBBBBBBBBBBBDFFFFFFFF0FF9AC5BB4B94
      BBDFFFFFFFF0FA8F54574684BCDFDDDFFFF0D7CF548B5BB4BDA5554DDFF097BB
      BBBBBBBBBB52100AFFF06666666666766631100ADDF05988888888889831000A
      DDD05799976666832221002232407866F64646B3100000000030A885BDDCDFC3
      100000000030F78666FDFBB3000020000030FA7885555545453000044580FFA6
      8888A867FD520008DFF0FFFD876666DFFE501207FFF0FFFFFFDFFFFFFF522129
      EFF0}
    Visible = False
  end
  object imSkl: TImage
    Left = 220
    Top = 60
    Width = 31
    Height = 13
    AutoSize = True
    Picture.Data = {
      07544269746D617046010000424D460100000000000076000000280000001F00
      00000D0000000100040000000000D0000000130B0000130B0000100000001000
      0000008000003A80000000803A00668000000080660066806600ABA70000DBC2
      3A00FFD6660000A2A3003AC2DB0066D6FF00B6D6B600FFFAAD0094EDFF00FBFF
      FB00000000000000000000000000000000000000000000000000000000000006
      FF001DF90006FE206FFFF9003DFFFFFFFF0007FA0007FA06FB007FA03DE2006F
      A00006DFFFFFF93DE20008F93DE2006FA00001DE406FE26FA00006FA3DE2006F
      A000007F906FA07F900006FA3DE2006FA000006DB08F907F900006FA3DE2006F
      A000001DE5DE206FA00006F93DE2006FA0000007FCFA003DE20008F93DE2006F
      A0000006DFF90006FA007FA03DE2006FA0000001DFE200006FFFF9003DE2006F
      A00000000000000000000000000000000000}
    Visible = False
  end
  object Panel1: TPanel
    Left = 5
    Top = 110
    Width = 927
    Height = 474
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clGreen
    TabOrder = 0
    Visible = False
    DesignSize = (
      927
      474)
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 925
      Height = 472
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      DataSource = DM.dsTovInfo
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -43
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'apteka'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1040#1087#1090#1077#1082#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 333
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Armour'
          Title.Caption = '    '
          Width = 180
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'kol'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 50
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'cena'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'kolup'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1059#1087#1072#1082'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 50
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'cenaup'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072' '#1091#1087'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 107
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Dist'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1056#1072#1089#1089#1090'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 89
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 1
    Top = 226
    Width = 935
    Height = 134
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    Caption = #1048#1076#1077#1090' '#1089#1073#1086#1088' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086#1081' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080'. '#1055#1086#1078#1072#1083#1091#1081#1089#1090#1072' '#1087#1086#1076#1086#1078#1076#1080#1090#1077'...'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      935
      134)
    object pbProc: TProgressBar
      Left = 353
      Top = 95
      Width = 229
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Max = 3
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 937
    Height = 31
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object lbName: TLabel
      Left = 7
      Top = 7
      Width = 55
      Height = 16
      Caption = 'lbName'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Panel4: TPanel
      Left = 917
      Top = 2
      Width = 16
      Height = 27
      BevelOuter = bvNone
      TabOrder = 0
      OnClick = Panel4Click
    end
    object CheckBox1: TCheckBox
      Left = 770
      Top = 8
      Width = 130
      Height = 17
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1094#1077#1085#1077
      TabOrder = 1
      OnClick = CheckBox1Click
    end
  end
  object BitBtn1: TBitBtn
    Left = 275
    Top = 34
    Width = 141
    Height = 21
    Caption = #1047#1072#1082#1072#1079#1072#1090#1100' '#1091' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074'...'
    TabOrder = 3
    Visible = False
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 275
    Top = 59
    Width = 141
    Height = 21
    Caption = #1047#1072#1082#1072#1079#1072#1090#1100' '#1085#1072' '#1089#1082#1083#1072#1076#1077'...'
    TabOrder = 4
    Visible = False
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 275
    Top = 85
    Width = 141
    Height = 21
    Caption = #1059#1079#1085#1072#1090#1100' '#1075#1076#1077
    TabOrder = 5
    Visible = False
    OnClick = BitBtn3Click
  end
end
