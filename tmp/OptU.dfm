object OptF: TOptF
  Left = 723
  Top = 138
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'OptF'
  ClientHeight = 407
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    629
    407)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 218
    Top = 26
    Width = 410
    Height = 347
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 3
    DesignSize = (
      410
      347)
    object Bevel1: TBevel
      Left = 5
      Top = 31
      Width = 399
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object Label1: TLabel
      Left = 5
      Top = 10
      Width = 39
      Height = 13
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnsect21: TPanel
      Left = 3
      Top = 34
      Width = 404
      Height = 311
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 2
      object Image4: TImage
        Left = 34
        Top = 215
        Width = 336
        Height = 81
        Transparent = True
      end
      object Label5: TLabel
        Left = 45
        Top = 225
        Width = 122
        Height = 13
        Caption = #1044#1083#1103' '#1086#1073#1099#1095#1085#1099#1093' '#1072#1087#1090#1077#1082':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = True
      end
      object Label6: TLabel
        Left = 55
        Top = 245
        Width = 94
        Height = 13
        Caption = '1 - '#1058#1086#1074#1072#1088' '#1073#1077#1079' '#1053#1044#1057
        Transparent = True
      end
      object Label7: TLabel
        Left = 55
        Top = 260
        Width = 82
        Height = 13
        Caption = '2 - '#1058#1086#1074#1072#1088' '#1089' '#1053#1044#1057
        Transparent = True
      end
      object Label8: TLabel
        Left = 225
        Top = 225
        Width = 100
        Height = 13
        Caption = #1044#1083#1103' '#1072#1087#1090#1077#1082' '#1089' '#1063#1055':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = True
      end
      object Label9: TLabel
        Left = 235
        Top = 245
        Width = 94
        Height = 13
        Caption = '1 - '#1058#1086#1074#1072#1088' '#1073#1077#1079' '#1053#1044#1057
        Transparent = True
      end
      object Label10: TLabel
        Left = 235
        Top = 260
        Width = 82
        Height = 13
        Caption = '2 - '#1058#1086#1074#1072#1088' '#1089' '#1053#1044#1057
        Transparent = True
      end
      object Label11: TLabel
        Left = 235
        Top = 275
        Width = 103
        Height = 13
        Caption = '3 - '#1044#1077#1090#1089#1082#1086#1077' '#1087#1080#1090#1072#1085#1080#1077
        Transparent = True
      end
      object Bevel3: TBevel
        Left = 5
        Top = 9
        Width = 394
        Height = 134
      end
      object Bevel4: TBevel
        Left = 5
        Top = 145
        Width = 394
        Height = 23
      end
      object DBGrid1: TDBGrid
        Left = 6
        Top = 10
        Width = 391
        Height = 131
        BorderStyle = bsNone
        DataSource = DM.srGroups
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'TYPE_TOV'
            Title.Caption = #1058#1080#1087' '#1090#1086#1074#1072#1088#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descr'
            Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
            Width = 295
            Visible = True
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 7
        Top = 147
        Width = 390
        Height = 19
        DataSource = DM.srGroups
        TabOrder = 1
      end
    end
    object pnsect22: TPanel
      Left = 3
      Top = 34
      Width = 404
      Height = 311
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 3
      object Image5: TImage
        Left = 11
        Top = 235
        Width = 381
        Height = 66
      end
      object Label12: TLabel
        Left = 20
        Top = 240
        Width = 82
        Height = 13
        Caption = #1058#1080#1087#1099' '#1089#1082#1080#1076#1086#1082':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = True
      end
      object Label13: TLabel
        Left = 25
        Top = 260
        Width = 124
        Height = 13
        Caption = '1 - '#1057#1082#1080#1076#1082#1080' '#1087#1086' '#1082#1072#1088#1090#1086#1095#1082#1072#1084
        Transparent = True
      end
      object Label14: TLabel
        Left = 25
        Top = 275
        Width = 139
        Height = 13
        Caption = '2 - '#1060#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1089#1082#1080#1076#1082#1080
        Transparent = True
      end
      object Bevel5: TBevel
        Left = 6
        Top = 193
        Width = 391
        Height = 31
      end
      object DBGrid2: TDBGrid
        Left = 6
        Top = 5
        Width = 391
        Height = 186
        DataSource = DM.srSKD
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Type_Skd'
            Title.Caption = #1058#1080#1087' '#1089#1082#1080#1076#1082#1080
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Summ'
            Title.Caption = #1057#1091#1084#1084#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SKD'
            Title.Caption = #1055#1088#1086#1094#1077#1085#1090
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descr'
            Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
            Width = 145
            Visible = True
          end>
      end
      object BitBtn4: TBitBtn
        Left = 37
        Top = 196
        Width = 110
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
        TabOrder = 1
        OnClick = BitBtn4Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000D40E0000D40E000010000000100000000000000000FF
          0000808080009F9F9F00C0C0C000FFFFFF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000444443200024
          4444444444222245444444444211110444444444425444254444444442111104
          4444444442544425444444444211110444444444425444254444444432111103
          4444445552544425555532222211110000024222224444222224211111111111
          1110254444444444444221111111111111102544444444444442211111111111
          1110254444444444444221111111111111102455555444455552322222111100
          0002422222544422222444443211110344444444425444254444444442111104
          4444444442544425444444444211110444444444425444254444444442111104
          4444444442455524444444444322202444444444442222444444}
        NumGlyphs = 2
      end
      object BitBtn5: TBitBtn
        Left = 147
        Top = 196
        Width = 110
        Height = 25
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
        TabOrder = 2
        OnClick = BitBtn5Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000D40E0000D40E00001000000010000000101F1F005D0F
          0F0010696900645C5C009A000000DB1A1A00E35050000000FF00219797006196
          960062EDED0080808000C9A2A200F7FBFB000000000000000000702B77777777
          77777BBB7777777777777788B3333337777777BBBBBBBBB777777778AD222900
          7777777BDDDBBBBB777777778AD8889207777777BDDDBBBBB777777778AD8289
          007777777BDDDBBBBB777777778AD8289007777777BDDDBDDDB777777778AD82
          00017777777BDDDBBBBB777777778A80001177777777BDBBBBBB777777777800
          0414777777777BBBBBBB77777777772055547777777777BBDBBB777777777771
          6C5577777777777BBDBB77777777777346C5777777777777BBDB777777777777
          356C7777777777777BBD777777777777735677777777777777BB777777777777
          7735777777777777777B77777777777777737777777777777777}
        NumGlyphs = 2
      end
      object BitBtn6: TBitBtn
        Left = 257
        Top = 196
        Width = 110
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 3
        OnClick = BitBtn6Click
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
    object pnsect32: TPanel
      Left = 3
      Top = 34
      Width = 404
      Height = 311
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 1
      object Image2: TImage
        Left = 229
        Top = 41
        Width = 169
        Height = 51
      end
      object Image1: TImage
        Left = 47
        Top = 80
        Width = 121
        Height = 211
      end
      object Label2: TLabel
        Left = 52
        Top = 85
        Width = 131
        Height = 201
        AutoSize = False
        Caption = 
          '1 - "'#1062#1077#1085#1090#1088#1072#1083#1100#1085#1072#1103' 1"         2 - "'#1055#1088#1080#1074#1086#1082#1079#1072#1083#1100#1085#1072#1103'"       3 - "'#1053#1086#1074#1099#1077 +
          ' '#1076#1086#1084#1072'"             4 - "'#1062#1077#1085#1090#1088#1072#1083#1100#1085#1072#1103' 2"         5 - "'#1062#1077#1085#1090#1088#1072#1083#1100#1085#1072#1103' ' +
          '3"         6 - "'#1045#1089#1077#1085#1080#1085#1072' 12"               7 - "'#1050#1086#1085#1085#1099#1081' '#1088#1099#1085#1086#1082'"    ' +
          '     8 - "'#1042#1077#1089#1085#1080#1085#1072'"                    9 - "'#1062#1077#1085#1090#1088#1072#1083#1100#1085#1072#1103' 4"       ' +
          '10 - "'#1057#1083#1072#1074#1103#1085#1089#1082#1072#1103'"          11 - "'#1062#1077#1085#1090#1088#1072#1083#1100#1085#1072#1103' 7"     12 - "'#1052#1077#1076#1082#1086#1084 +
          #1087#1083#1077#1082#1089'"      14 - "'#1050#1072#1088#1072#1074#1072#1085'"                15 - "'#1055#1091#1096#1082#1080#1085#1089#1082#1072#1103'"     ' +
          '    16 - "'#1057#1072#1083#1090#1086#1074#1089#1082#1072#1103'"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Bevel2: TBevel
        Left = 220
        Top = 5
        Width = 2
        Height = 288
      end
      object Label3: TLabel
        Left = 233
        Top = 45
        Width = 168
        Height = 51
        AutoSize = False
        Caption = 
          #1044#1072#1085#1085#1072#1103' '#1085#1091#1084#1077#1088#1072#1094#1080#1103' '#1095#1077#1082#1086#1074' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1100#1089#1103' '#1076#1083#1103' '#1095#1077#1082#1086#1074' '#1063#1055' '#1080' '#1076#1083#1103' '#1085#1086#1084#1077#1088#1086#1074' ' +
          #1074#1086#1079#1074#1088#1072#1090#1086#1074'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Edit5: TLabeledEdit
        Left = 97
        Top = 40
        Width = 41
        Height = 21
        EditLabel.Width = 75
        EditLabel.Height = 13
        EditLabel.Caption = #1053#1086#1084#1077#1088' '#1072#1087#1090#1077#1082#1080':'
        LabelPosition = lpLeft
        TabOrder = 0
        OnChange = SetChange
      end
      object Edit6: TLabeledEdit
        Left = 360
        Top = 10
        Width = 36
        Height = 21
        EditLabel.Width = 128
        EditLabel.Height = 13
        EditLabel.Caption = #1053#1086#1084#1077#1088' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1095#1077#1082#1072': '
        LabelPosition = lpLeft
        TabOrder = 1
        OnChange = SetChange
      end
      object Edit7: TLabeledEdit
        Left = 97
        Top = 10
        Width = 116
        Height = 21
        EditLabel.Width = 91
        EditLabel.Height = 13
        EditLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1072#1087#1090#1077#1082#1080':'
        LabelPosition = lpLeft
        TabOrder = 2
        OnChange = SetChange
      end
    end
    object pnsect31: TPanel
      Left = 3
      Top = 34
      Width = 404
      Height = 311
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 0
      object Image3: TImage
        Left = 19
        Top = 250
        Width = 366
        Height = 41
      end
      object Label4: TLabel
        Left = 98
        Top = 262
        Width = 208
        Height = 13
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103' '#1082' SQL - '#1089#1077#1088#1074#1077#1088#1091
        Transparent = True
      end
      object Edit1: TLabeledEdit
        Left = 110
        Top = 10
        Width = 281
        Height = 21
        EditLabel.Width = 73
        EditLabel.Height = 13
        EditLabel.Caption = #1048#1084#1103' '#1089#1077#1088#1074#1077#1088#1072': '
        LabelPosition = lpLeft
        TabOrder = 0
        OnChange = SetChange
      end
      object Edit2: TLabeledEdit
        Left = 110
        Top = 40
        Width = 281
        Height = 21
        EditLabel.Width = 57
        EditLabel.Height = 13
        EditLabel.Caption = #1048#1084#1103' '#1073#1072#1079#1099': '
        LabelPosition = lpLeft
        TabOrder = 1
        OnChange = SetChange
      end
      object Edit3: TLabeledEdit
        Left = 110
        Top = 70
        Width = 281
        Height = 21
        EditLabel.Width = 102
        EditLabel.Height = 13
        EditLabel.Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103': '
        LabelPosition = lpLeft
        TabOrder = 2
        OnChange = SetChange
      end
      object Edit4: TLabeledEdit
        Left = 110
        Top = 100
        Width = 281
        Height = 21
        EditLabel.Width = 44
        EditLabel.Height = 13
        EditLabel.Caption = #1055#1072#1088#1086#1083#1100': '
        LabelPosition = lpLeft
        TabOrder = 3
        OnChange = SetChange
      end
    end
  end
  object Panel1: TPanel
    Left = 1
    Top = 26
    Width = 215
    Height = 347
    Anchors = [akLeft, akTop, akBottom]
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      215
      347)
    object TreeView1: TTreeView
      Left = 1
      Top = 1
      Width = 212
      Height = 344
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      HideSelection = False
      Indent = 19
      ReadOnly = True
      RightClickSelect = True
      TabOrder = 0
      OnChange = TreeView1Change
      Items.Data = {
        04000000230000000000000003000000FFFFFFFFFFFFFFFF0000000005000000
        0A494E49202D20F4E0E9EB230000000000000021000000FFFFFFFFFFFFFFFF00
        000000000000000AC4E8F0E5EAF2EEF0E8E8290000000000000022000000FFFF
        FFFFFFFFFFFF000000000000000010C8EDF2E5F0EDE5F220E820EFEEF7F2E024
        000000000000001F000000FFFFFFFFFFFFFFFF00000000000000000BCFEEE4EA
        EBFEF7E5EDE8E5220000000000000020000000FFFFFFFFFFFFFFFF0000000000
        00000009D1EBF3E6E5E1EDFBE51B0000000000000023000000FFFFFFFFFFFFFF
        FF000000000000000002D7CF240000000000000002000000FFFFFFFFFFFFFFFF
        00000000040000000BC1E0E7E020E4E0EDEDFBF5270000000000000015000000
        FFFFFFFFFFFFFFFF00000000000000000EC3F0F3EFEFFB20F2EEE2E0F0EEE22E
        0000000000000017000000FFFFFFFFFFFFFFFF000000000000000015CEE3F0E0
        EDE8F7E5EDE8FF20EDE020F1EAE8E4EAE81F0000000000000016000000FFFFFF
        FFFFFFFFFF000000000000000006D1EAE8E4EAE8230000000000000018000000
        FFFFFFFFFFFFFFFF00000000000000000AD1F2E0F2E8F1F2E8EAE01C00000000
        00000001000000FFFFFFFFFFFFFFFF000000000300000003C2E8E42200000000
        0000000B000000FFFFFFFFFFFFFFFF000000000000000009C8EDF2E5F0F4E5E9
        F11D000000000000000C000000FFFFFFFFFFFFFFFF000000000000000004D6E2
        E5F21E000000000000000D000000FFFFFFFFFFFFFFFF000000000000000005D8
        F0E8F4F2200000000000000004000000FFFFFFFFFFFFFFFF0000000002000000
        07D1E8F1F2E5ECE0250000000000000029000000FFFFFFFFFFFFFFFF00000000
        000000000CC1E5E7EEEFE0F1EDEEF1F2FC1E000000000000002A000000FFFFFF
        FFFFFFFFFF000000000000000005CEE1F9E8E5}
    end
  end
  object Panel2: TPanel
    Left = 1
    Top = 0
    Width = 627
    Height = 24
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    Caption = '  '#1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 1
    Top = 375
    Width = 627
    Height = 31
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      627
      31)
    object BitBtn1: TBitBtn
      Left = 143
      Top = 3
      Width = 110
      Height = 25
      Anchors = [akTop]
      Caption = #1054#1050
      Default = True
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000D40E0000D40E00001000000010000000255B25002966
        29002D712D00327E3200368836003B943B0041A5410048B6480054BC54005FC1
        5F0071C771000000FF008ED38E00A4DCA400B2E1B200D1EED100BBB64BBBBBB4
        4BBBBBB614BBBB424BBBBBB6304BB6534BBBBBB7D52137A44BBBBBB7FE63ACC2
        6BBBBBB7FFFFEEA36BBBBBB7DDFFFE404BBBBB55EEEFFFA204BBB5AEEEEEFFEA
        310B9EFFFFEEFFFFC5548889AAFEE669A88BBBBBB7FEE2BBBBBBBBBBBAFF94BB
        BBBBBBBBBACE54BBBBBBBBBBBBAC26BBBBBBBBBBBB977BBBBBBB}
    end
    object BitBtn2: TBitBtn
      Left = 374
      Top = 3
      Width = 110
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
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
    object BitBtn3: TBitBtn
      Left = 258
      Top = 3
      Width = 110
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
end
