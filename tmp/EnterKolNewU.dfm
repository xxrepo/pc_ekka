object EnterKolNewF: TEnterKolNewF
  Left = 900
  Top = 174
  BorderStyle = bsDialog
  Caption = 'EnterKolNewF'
  ClientHeight = 523
  ClientWidth = 614
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnConstrainedResize = FormConstrainedResize
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    614
    523)
  PixelsPerInch = 96
  TextHeight = 13
  object imR: TImage
    Left = 598
    Top = 39
    Width = 15
    Height = 484
    Anchors = [akLeft, akTop, akBottom]
    Stretch = True
  end
  object imL: TImage
    Left = 0
    Top = 39
    Width = 15
    Height = 484
    Anchors = [akLeft, akTop, akBottom]
    Stretch = True
  end
  object im1: TImage
    Left = 30
    Top = 104
    Width = 429
    Height = 81
    Anchors = [akLeft, akTop, akRight]
  end
  object Label3: TLabel
    Left = 90
    Top = 144
    Width = 89
    Height = 16
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 60
    Top = 119
    Width = 326
    Height = 13
    Caption = #1042#1074#1086#1076' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1087#1086#1079#1080#1094#1080#1081' '#1090#1086#1074#1072#1088#1072' '#1074' '#1076#1077#1083#1080#1084#1099#1093' '#1077#1076#1080#1085#1080#1094#1072#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 30
    Top = 79
    Width = 89
    Height = 16
    Caption = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbArt: TLabel
    Left = 120
    Top = 79
    Width = 49
    Height = 16
    Caption = '999999'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object sbLeft: TSpeedButton
    Left = 0
    Top = 39
    Width = 15
    Height = 484
    Hint = 'C '#1101#1090#1080#1084' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1084' '#1095#1072#1097#1077' '#1074#1089#1077#1075#1086' '#1087#1086#1082#1091#1087#1072#1102#1090'...'
    AllowAllUp = True
    Anchors = [akLeft, akTop, akBottom]
    GroupIndex = 1
    Flat = True
    Glyph.Data = {
      9E010000424D9E010000000000003600000028000000070000000F0000000100
      1800000000006801000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFDABFA4C19467000000FFFFFFFFFFFFFFFFFFFFFFFFDCC0A5B07437B0743700
      0000FFFFFFFFFFFFFFFFFFDEC3A7B5793BFFBA16B5793B000000FFFFFFFFFFFF
      E0C5A9BB7F3FF7BA30F6B11DBB7F3F000000FFFFFFE3C8ABC08444ECB952E09E
      29E5A83AC08444000000E6CBADC78B49E9BD6ECF9240CF9240D9A352C78B4900
      0000CE924EFAD589E9AD61DFA357D5994DDCA95DCE924E000000EBD0B1D49853
      FBD88CEEB266EEB266F4C276D49853000000FFFFFFEED3B3DB9F57FDDD91F2B9
      6DF7CA7EDB9F57000000FFFFFFFFFFFFF0D5B5E0A45BFEE195FBD488E0A45B00
      0000FFFFFFFFFFFFFFFFFFF3D8B7E6AA5FFFE498E6AA5F000000FFFFFFFFFFFF
      FFFFFFFFFFFFF5DAB8EAAE63EAAE63000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFF7DCBAF1C48C000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000}
    ParentShowHint = False
    ShowHint = True
    Visible = False
    OnClick = sbLeftClick
  end
  object sbRight: TSpeedButton
    Left = 598
    Top = 39
    Width = 15
    Height = 484
    AllowAllUp = True
    Anchors = [akLeft, akTop, akBottom]
    GroupIndex = 2
    Flat = True
    Glyph.Data = {
      9E010000424D9E010000000000003600000028000000070000000F0000000100
      1800000000006801000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C19467DABFA4FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000B07437B07437DCC0A5FFFFFFFFFFFFFFFFFFFFFFFF00
      0000B5793BFFBA16B5793BDEC3A7FFFFFFFFFFFFFFFFFF000000BB7F3FF6B11D
      F7BA30BB7F3FE0C5A9FFFFFFFFFFFF000000C08444E5A83AE09E29ECB952C084
      44E3C8ABFFFFFF000000C78B49D9A352CF9240CF9240E9BD6EC78B49E6CBAD00
      0000CE924EDCA95DD5994DDFA357E9AD61FAD589CE924E000000D49853F4C276
      EEB266EEB266FBD88CD49853EBD0B1000000DB9F57F7CA7EF2B96DFDDD91DB9F
      57EED3B3FFFFFF000000E0A45BFBD488FEE195E0A45BF0D5B5FFFFFFFFFFFF00
      0000E6AA5FFFE498E6AA5FF3D8B7FFFFFFFFFFFFFFFFFF000000EAAE63EAAE63
      F5DAB8FFFFFFFFFFFFFFFFFFFFFFFF000000F1C48CF7DCBAFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000}
    Visible = False
  end
  object Label2: TLabel
    Left = 235
    Top = 79
    Width = 48
    Height = 16
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 20
    Top = 189
    Width = 572
    Height = 319
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 4
    Visible = False
    DesignSize = (
      572
      319)
    object Label4: TLabel
      Left = 0
      Top = 0
      Width = 572
      Height = 86
      Alignment = taCenter
      AutoSize = False
      Caption = 'Label4'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object Label5: TLabel
      Left = 0
      Top = 135
      Width = 572
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = 'Label5'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object Label7: TLabel
      Left = 1
      Top = 291
      Width = 569
      Height = 26
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = 
        #1063#1090#1086#1073#1099' '#1074#1099#1073#1088#1072#1090#1100' '#1087#1088#1077#1087#1072#1088#1072#1090' '#1080#1079' '#1085#1080#1078#1085#1077#1075#1086' '#1089#1087#1080#1089#1082#1072', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1087#1086#1083#1085#1080#1090#1100' '#1076 +
        #1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1077#1082' '#1083#1077#1074#1086#1081' '#1082#1085#1086#1087#1082#1086#1081' '#1084#1099#1096#1080' '#1087#1086' '#1085#1091#1078#1085#1086#1084#1091' '#1087#1088#1077#1087#1072#1088#1072#1090#1091' '#1074' '#1089#1087#1080#1089#1082#1077' '#1080 +
        #1083#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1082#1085#1086#1087#1082#1091' '#1079#1072#1084#1077#1085#1080#1090#1100'.'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label9: TLabel
      Left = 25
      Top = 241
      Width = 176
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1042#1099' '#1091#1078#1077' '#1079#1072#1088#1072#1073#1086#1090#1072#1083#1080' '#1087#1086' '#1101#1090#1086#1081' '#1072#1082#1094#1080#1080':'
    end
    object Label10: TLabel
      Left = 205
      Top = 241
      Width = 51
      Height = 13
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 320
      Top = 241
      Width = 126
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1048#1090#1086#1075#1086' '#1074' '#1042#1072#1096#1077#1081' '#1082#1086#1087#1080#1083#1082#1077': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Label11Click
      OnMouseEnter = Label11MouseEnter
      OnMouseLeave = Label11MouseLeave
    end
    object Label12: TLabel
      Left = 453
      Top = 241
      Width = 46
      Height = 13
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 503
      Top = 241
      Width = 44
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
    end
    object Label14: TLabel
      Left = 25
      Top = 256
      Width = 138
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1055#1083#1072#1085' '#1079#1072#1084#1077#1085' '#1087#1086' '#1101#1090#1086#1081' '#1072#1082#1094#1080#1080':'
      Visible = False
    end
    object Label15: TLabel
      Left = 205
      Top = 256
      Width = 51
      Height = 13
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label16: TLabel
      Left = 275
      Top = 256
      Width = 16
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1096#1090'.'
      Visible = False
    end
    object Label17: TLabel
      Left = 321
      Top = 256
      Width = 93
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1042#1099' '#1091#1078#1077' '#1079#1072#1084#1077#1085#1080#1083#1080':'
    end
    object Label18: TLabel
      Left = 453
      Top = 256
      Width = 46
      Height = 13
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 514
      Top = 256
      Width = 21
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1088#1072#1079'.'
    end
    object Label20: TLabel
      Left = 263
      Top = 241
      Width = 44
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
    end
    object Label21: TLabel
      Left = 25
      Top = 271
      Width = 192
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1055#1088#1080' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080' '#1087#1083#1072#1085#1072' '#1042#1072#1096#1072' '#1087#1088#1077#1084#1080#1103':'
      Visible = False
    end
    object Label22: TLabel
      Left = 220
      Top = 271
      Width = 51
      Height = 13
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label23: TLabel
      Left = 273
      Top = 271
      Width = 44
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
      Visible = False
    end
    object Label54: TLabel
      Left = 0
      Top = 154
      Width = 572
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = 'Label5'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object pn2: TPanel
      Left = 24
      Top = 22
      Width = 525
      Height = 107
      BevelOuter = bvNone
      Color = clSilver
      TabOrder = 0
      DesignSize = (
        525
        107)
      object dbg2: TDBGrid
        Left = 1
        Top = 1
        Width = 523
        Height = 105
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderStyle = bsNone
        Color = 14020596
        DataSource = DM.srSpis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg2DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Art_Code'
            Title.Alignment = taCenter
            Title.Caption = #1050#1086#1076
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Names'
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 261
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ostat'
            Title.Alignment = taCenter
            Title.Caption = #1054#1089#1090'.'#1045#1076'.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OstatUp'
            Title.Alignment = taCenter
            Title.Caption = #1054#1089#1090'.'#1091#1087'.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cena'
            Title.Alignment = taCenter
            Title.Caption = #1062#1077#1085#1072
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cenaup'
            Title.Alignment = taCenter
            Title.Caption = #1062#1077#1085#1072' '#1091#1087'.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 50
            Visible = True
          end>
      end
    end
    object Panel3: TPanel
      Left = 13
      Top = 179
      Width = 546
      Height = 41
      BevelOuter = bvNone
      Color = clMaroon
      TabOrder = 1
      DesignSize = (
        546
        41)
      object Label8: TLabel
        Left = 1
        Top = 1
        Width = 544
        Height = 39
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        Caption = 'Label8'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
      end
    end
  end
  object Panel4: TPanel
    Left = 20
    Top = 190
    Width = 572
    Height = 319
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 6
    Visible = False
    object Label25: TLabel
      Left = 15
      Top = 215
      Width = 126
      Height = 13
      Caption = #1048#1090#1086#1075#1086' '#1074' '#1042#1072#1096#1077#1081' '#1082#1086#1087#1080#1083#1082#1077': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Label25Click
      OnMouseEnter = Label11MouseEnter
      OnMouseLeave = Label11MouseLeave
    end
    object Label26: TLabel
      Left = 142
      Top = 215
      Width = 46
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 192
      Top = 215
      Width = 44
      Height = 13
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
    end
    object Label28: TLabel
      Left = 15
      Top = 90
      Width = 106
      Height = 13
      Caption = #1054#1073#1097#1080#1081' '#1087#1083#1072#1085' '#1087#1088#1086#1076#1072#1078' '
    end
    object Label29: TLabel
      Left = 125
      Top = 90
      Width = 46
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label30: TLabel
      Left = 175
      Top = 90
      Width = 71
      Height = 13
      Caption = #1091#1087'. '#1079#1072' '#1087#1077#1088#1080#1086#1076' '
    end
    object Label31: TLabel
      Left = 255
      Top = 90
      Width = 46
      Height = 13
      Caption = 'Label31'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label32: TLabel
      Left = 105
      Top = 130
      Width = 102
      Height = 13
      Caption = #1042#1072#1096#1072' '#1087#1088#1077#1084#1080#1103' '#1073#1091#1076#1077#1090' '
    end
    object Label33: TLabel
      Left = 210
      Top = 130
      Width = 46
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label34: TLabel
      Left = 265
      Top = 130
      Width = 44
      Height = 13
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
    end
    object Bevel1: TBevel
      Left = 15
      Top = 183
      Width = 541
      Height = 2
    end
    object Label35: TLabel
      Left = 15
      Top = 195
      Width = 99
      Height = 13
      Caption = #1042#1099' '#1091#1078#1077' '#1074#1099#1087#1086#1083#1085#1080#1083#1080' '
    end
    object Label36: TLabel
      Left = 117
      Top = 195
      Width = 49
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label37: TLabel
      Left = 170
      Top = 195
      Width = 61
      Height = 13
      Caption = '%  '#1086#1090' '#1087#1083#1072#1085#1072' '
    end
    object Label38: TLabel
      Left = 230
      Top = 195
      Width = 46
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label42: TLabel
      Left = 15
      Top = 110
      Width = 180
      Height = 13
      Caption = #1055#1088#1080' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080' '#1087#1083#1072#1085#1072' '#1087#1088#1086#1076#1072#1078' '#1085#1072' :'
    end
    object Label43: TLabel
      Left = 30
      Top = 130
      Width = 36
      Height = 13
      Caption = '- 10000'
    end
    object Label44: TLabel
      Left = 30
      Top = 145
      Width = 36
      Height = 13
      Caption = '- 10000'
    end
    object Label45: TLabel
      Left = 30
      Top = 160
      Width = 36
      Height = 13
      Caption = '- 10000'
    end
    object Label46: TLabel
      Left = 105
      Top = 145
      Width = 102
      Height = 13
      Caption = #1042#1072#1096#1072' '#1087#1088#1077#1084#1080#1103' '#1073#1091#1076#1077#1090' '
    end
    object Label47: TLabel
      Left = 210
      Top = 145
      Width = 46
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label48: TLabel
      Left = 105
      Top = 160
      Width = 102
      Height = 13
      Caption = #1042#1072#1096#1072' '#1087#1088#1077#1084#1080#1103' '#1073#1091#1076#1077#1090' '
    end
    object Label49: TLabel
      Left = 210
      Top = 160
      Width = 46
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label50: TLabel
      Left = 265
      Top = 145
      Width = 44
      Height = 13
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
    end
    object Label51: TLabel
      Left = 265
      Top = 160
      Width = 44
      Height = 13
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
    end
    object Label60: TLabel
      Left = 280
      Top = 195
      Width = 14
      Height = 13
      Caption = #1091#1087'.'
    end
    object Label39: TLabel
      Left = 300
      Top = 195
      Width = 167
      Height = 13
      Caption = #1080' '#1091#1078#1077' '#1079#1072#1088#1072#1073#1086#1090#1072#1083#1080' '#1087#1086' '#1101#1090#1086#1081' '#1072#1082#1094#1080#1080' '
    end
    object Label40: TLabel
      Left = 470
      Top = 195
      Width = 46
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label41: TLabel
      Left = 520
      Top = 195
      Width = 44
      Height = 13
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
    end
    object Panel5: TPanel
      Left = 13
      Top = 9
      Width = 546
      Height = 74
      BevelOuter = bvNone
      Color = clMaroon
      TabOrder = 0
      DesignSize = (
        546
        74)
      object Label24: TLabel
        Left = 1
        Top = 1
        Width = 544
        Height = 72
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        Caption = 'Label24'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
      end
    end
  end
  object edKol: TEdit
    Left = 188
    Top = 140
    Width = 63
    Height = 27
    BevelKind = bkFlat
    BorderStyle = bsNone
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = '0'
    OnChange = edKolChange
    OnKeyPress = edKolKeyPress
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 614
    Height = 40
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object lbNames: TLabel
      Left = 13
      Top = 8
      Width = 594
      Height = 24
      AutoSize = False
      Caption = 'names'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Layout = tlCenter
    end
  end
  object bbChek: TBitBtn
    Left = 467
    Top = 102
    Width = 124
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1095#1077#1082
    Default = True
    TabOrder = 2
    OnClick = bbChekClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000000000000000000000000000000000000000FF0000FF
      0000000000000000FF0000FF0000FF0000000000000000000000FF0000FF0000
      000000000000FF0000FF0000FF0000FF8080808080800000FF0000FF0000FF80
      80808080808080800000FF0000FF8080808080800000FF0000FF0000FF0000FF
      000000FFFFFF000000000000000000FFFFFFFFFFFFFFFFFF000000000000FFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3808080808080808080D3
      D3D3D3D3D3D3D3D3808080808080D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3D3D3D3D3D3D380808080
      8080808080808080808080D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3D3D3D3D3D3D3808080D3
      D3D3808080D3D3D3808080D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3808080808080808080D3
      D3D3D3D3D3D3D3D3D3D3D3808080D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3808080808080808080D3
      D3D3D3D3D3D3D3D3D3D3D3808080D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3808080808080808080D3
      D3D3D3D3D3D3D3D3D3D3D3808080D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFF000000000000000000000000000000FFFFFFFFFFFF000000FFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D380808080808080808080
      8080808080D3D3D3D3D3D3808080D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFF000000000000FFFFFF000000FFFFFF000000000000FFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3808080808080D3D3D380
      8080D3D3D3808080808080D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      0000000000000000FF0000FF0000000000FF0000000000FF0000FF0000000000
      000000000000FF0000FF0000FF0000FF8080808080800000FF0000FF80808000
      00FF8080800000FF0000FF8080808080808080800000FF0000FF}
    NumGlyphs = 2
  end
  object bbCancel: TBitBtn
    Left = 467
    Top = 131
    Width = 124
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
    OnClick = bbCancelClick
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
  object bbChange: TBitBtn
    Left = 467
    Top = 161
    Width = 124
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1047#1072#1084#1077#1085#1080#1090#1100
    ModalResult = 2
    TabOrder = 5
    Visible = False
    OnClick = bbChangeClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010FF1098FF98C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0386818386818386818C0
      C0C010FF1010FF1060F860A0F8A8B8F8B8C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C048703038681848803058904068D06010FF1018FF1830F83040F04858E8
      6880E890C0C0C0C0C0C0C0C0C0C0C0C090D0A028501038601848783058884030
      D02000FF0020F82838F84050F05868E87878E09098E0B0C0C0C0C0C0C058E868
      70E080407830386020507838508038C0C0C068FF6818F81848F04860F06868E0
      7878D08888D0A0C8E0D0C0C0C070E88058E86898FFA0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C060F86090F890C0C0C0C0C0C030501830501038581830F03848E850
      50F05858F06898FFA060F868C0C0C0C0C0C0C0C0C0C0C0C090F890C0C0C0C0C0
      C038601838601830601830F03830F03838F84038F84018F82860F868C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0789868407028407828789860B9CFB430F838
      20F82820F82010FF18C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C04888304888
      3058904058904090C08040FF4800FF0000FF0000FF0058FF58C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C068A85890C080C0C0C078FF7888FF80
      80FF8098FF98B9CFB4C0FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C088B07898C0
      90B9CFB490C080C0C0C0C0C0C0C0C0C0C0C0C0D0FFD050FF5010FF1060FF68C0
      C0C0C0C0C0C0C0C0789868407828509038A0C898C0C0C0C0C0C0C0C0C0C0C0C0
      C8FFC820FF2818F82030F83838F040B0F8B8C0C0C07088582858104878305890
      4068A850C0C0C0C0C0C0C0C0C0C0C0C0C0C0C098F8A038F04850F06058F06878
      E880385820183800305810487030285010C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C070E88070E88080E09088E0A070A870204000285010285010C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C090D8A898D8B0A0
      D8B8A8E0C078A880285010C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
  end
  object pnAl1: TPanel
    Left = 0
    Top = 39
    Width = 612
    Height = 35
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    Visible = False
    object Label52: TLabel
      Left = 180
      Top = 3
      Width = 252
      Height = 13
      Caption = #1054#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1087#1088#1077#1076#1083#1086#1078#1080#1090#1077' '#1060#1040#1056#1052#1047#1040#1052#1045#1053#1059'!'
    end
    object Label53: TLabel
      Left = 197
      Top = 18
      Width = 218
      Height = 13
      Caption = '('#1101#1090#1086' '#1082#1086#1085#1090#1088#1086#1083#1080#1088#1091#1077#1090#1089#1103' '#1090#1072#1081#1085#1099#1084' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1077#1084')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnAl2: TPanel
    Left = 0
    Top = 74
    Width = 12
    Height = 449
    Anchors = [akLeft, akTop, akBottom]
    BevelOuter = bvNone
    Color = clRed
    TabOrder = 8
    Visible = False
  end
  object pnAl4: TPanel
    Left = 600
    Top = 74
    Width = 12
    Height = 449
    Anchors = [akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clRed
    TabOrder = 9
    Visible = False
  end
  object pnAl3: TPanel
    Left = 12
    Top = 511
    Width = 588
    Height = 12
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    Color = clRed
    TabOrder = 10
    Visible = False
  end
end
