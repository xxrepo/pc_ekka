object EnterKolNewF: TEnterKolNewF
  Left = 694
  Top = 232
  BorderStyle = bsDialog
  Caption = 'EnterKolNewF'
  ClientHeight = 551
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
    551)
  PixelsPerInch = 96
  TextHeight = 13
  object imR: TImage
    Left = 598
    Top = 39
    Width = 15
    Height = 512
    Anchors = [akLeft, akTop, akBottom]
    Stretch = True
  end
  object imL: TImage
    Left = 0
    Top = 39
    Width = 15
    Height = 512
    Anchors = [akLeft, akTop, akBottom]
    Stretch = True
  end
  object im1: TImage
    Left = 20
    Top = 104
    Width = 416
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
    Left = 20
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
    Left = 110
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
    Height = 512
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
    Height = 512
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
    Left = 230
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
  object Panel8: TPanel
    Left = 20
    Top = 189
    Width = 572
    Height = 347
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 12
    Visible = False
    DesignSize = (
      572
      347)
    object Shape4: TShape
      Left = 0
      Top = 56
      Width = 572
      Height = 31
      Pen.Color = clRed
      Pen.Width = 3
      Shape = stRoundRect
    end
    object Shape3: TShape
      Left = 0
      Top = 0
      Width = 572
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Pen.Color = clTeal
      Shape = stRoundRect
    end
    object Label65: TLabel
      Left = 115
      Top = 286
      Width = 331
      Height = 13
      Anchors = [akTop]
      Caption = #1057#1086#1087#1091#1090#1089#1090#1074#1091#1102#1097#1080#1081' '#1090#1086#1074#1072#1088' '#1085#1091#1078#1085#1086' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1087#1088#1077#1076#1083#1086#1078#1080#1090#1100'!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label97: TLabel
      Left = 155
      Top = 301
      Width = 255
      Height = 13
      Anchors = [akTop]
      Caption = #1069#1090#1086' '#1082#1086#1085#1090#1088#1086#1083#1080#1088#1091#1077#1090#1089#1103' '#1090#1072#1081#1085#1099#1084' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1077#1084'!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label98: TLabel
      Left = 8
      Top = 1
      Width = 559
      Height = 42
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Label98'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object Label103: TLabel
      Left = 25
      Top = 317
      Width = 131
      Height = 27
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = #1042#1099' '#1091#1078#1077' '#1079#1072#1088#1072#1073#1086#1090#1072#1083#1080' '#1087#1086' '#1082#1086#1084#1087#1083#1077#1082#1089#1085#1086#1081' '#1087#1086#1082#1091#1087#1082#1077':'
      WordWrap = True
    end
    object Label104: TLabel
      Left = 155
      Top = 325
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
    object Label105: TLabel
      Left = 213
      Top = 325
      Width = 44
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
    end
    object Label106: TLabel
      Left = 320
      Top = 325
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
      Visible = False
      OnClick = Label11Click
      OnMouseEnter = Label11MouseEnter
      OnMouseLeave = Label11MouseLeave
    end
    object Label107: TLabel
      Left = 450
      Top = 325
      Width = 49
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
      Visible = False
    end
    object Label108: TLabel
      Left = 503
      Top = 325
      Width = 44
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
      Visible = False
    end
    object Label99: TLabel
      Left = 302
      Top = 68
      Width = 135
      Height = 13
      Caption = #1044#1083#1103' '#1082#1083#1080#1077#1085#1090#1072' - '#1089#1082#1080#1076#1082#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object Label101: TLabel
      Tag = 1
      Left = 440
      Top = 68
      Width = 126
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00 '#1075#1088#1085' '#1079#1072' 1 '#1091#1087'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label100: TLabel
      Left = 8
      Top = 68
      Width = 164
      Height = 13
      Caption = #1044#1083#1103' '#1042#1072#1089' - '#1073#1086#1085#1091#1089' '#1074' '#1082#1086#1087#1080#1083#1082#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label102: TLabel
      Tag = 1
      Left = 170
      Top = 68
      Width = 124
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00 '#1075#1088#1085' '#1079#1072' 1 '#1091#1087'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sbList: TScrollBox
      Left = 3
      Top = 105
      Width = 566
      Height = 176
      Color = 14020596
      ParentColor = False
      TabOrder = 0
    end
    object HeaderControl1: THeaderControl
      Left = 3
      Top = 90
      Width = 566
      Height = 17
      Align = alNone
      Sections = <
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 341
        end
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #1054#1089#1090' '#1077#1076'.'
          Width = 49
        end
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #1054#1089#1090' '#1091#1087'.'
          Width = 49
        end
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #1062#1077#1085#1072
          Width = 51
        end
        item
          Alignment = taCenter
          ImageIndex = -1
          Text = #1062#1077#1085#1072' '#1091#1087'.'
          Width = 75
        end>
    end
    object Panel9: TPanel
      Left = 193
      Top = 47
      Width = 185
      Height = 18
      Caption = #1055#1056#1045#1048#1052#1059#1065#1045#1057#1058#1042#1040
      Color = 11579647
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object Panel6: TPanel
    Left = 20
    Top = 190
    Width = 572
    Height = 347
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 11
    Visible = False
    object Shape1: TShape
      Left = 320
      Top = 190
      Width = 213
      Height = 89
      Pen.Color = clMaroon
      Pen.Width = 5
      Shape = stRoundRect
    end
    object Label55: TLabel
      Left = 15
      Top = 280
      Width = 126
      Height = 13
      Caption = #1048#1090#1086#1075#1086' '#1074' '#1042#1072#1096#1077#1081' '#1082#1086#1087#1080#1083#1082#1077': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
      OnClick = Label25Click
      OnMouseEnter = Label11MouseEnter
      OnMouseLeave = Label11MouseLeave
    end
    object Label56: TLabel
      Left = 142
      Top = 280
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
      Visible = False
    end
    object Label57: TLabel
      Left = 192
      Top = 280
      Width = 44
      Height = 13
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
      Visible = False
    end
    object Label58: TLabel
      Left = 15
      Top = 90
      Width = 256
      Height = 13
      Caption = #1054#1073#1097#1080#1081' '#1087#1083#1072#1085' '#1087#1088#1086#1076#1072#1078' '#1076#1083#1103' '#1074#1089#1077#1075#1086' '#1082#1086#1083#1083#1077#1082#1090#1080#1074#1072' '#1072#1087#1090#1077#1082#1080
    end
    object Label59: TLabel
      Left = 275
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
    object Label61: TLabel
      Left = 325
      Top = 90
      Width = 71
      Height = 13
      Caption = #1091#1087'. '#1079#1072' '#1087#1077#1088#1080#1086#1076' '
    end
    object Label62: TLabel
      Left = 400
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
    object Bevel2: TBevel
      Left = 15
      Top = 143
      Width = 541
      Height = 2
    end
    object Label66: TLabel
      Left = 15
      Top = 165
      Width = 165
      Height = 13
      Caption = #1050#1086#1083#1083#1077#1082#1090#1080#1074#1086#1084' '#1072#1087#1090#1077#1082#1080' '#1074#1099#1087#1086#1083#1085#1077#1085#1086
    end
    object Label67: TLabel
      Left = 187
      Top = 165
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
    object Label68: TLabel
      Left = 240
      Top = 165
      Width = 61
      Height = 13
      Caption = '%  '#1086#1090' '#1087#1083#1072#1085#1072' '
    end
    object Label80: TLabel
      Left = 326
      Top = 110
      Width = 44
      Height = 13
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
    end
    object Label63: TLabel
      Left = 15
      Top = 110
      Width = 254
      Height = 13
      Caption = #1041#1086#1085#1091#1089' '#1072#1087#1090#1077#1082#1080' '#1087#1088#1080' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1080' '#1087#1083#1072#1085#1072' '#1089#1086#1089#1090#1072#1074#1083#1103#1077#1090'  '
    end
    object Label64: TLabel
      Left = 270
      Top = 110
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
    object Label69: TLabel
      Left = 355
      Top = 165
      Width = 14
      Height = 13
      Caption = #1091#1087'.'
    end
    object Label70: TLabel
      Left = 305
      Top = 165
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
    object Label71: TLabel
      Left = 15
      Top = 185
      Width = 86
      Height = 13
      Caption = #1042#1072#1084#1080' '#1074#1099#1087#1086#1083#1085#1077#1085#1086
    end
    object Label72: TLabel
      Left = 107
      Top = 185
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
    object Label73: TLabel
      Left = 160
      Top = 185
      Width = 61
      Height = 13
      Caption = '%  '#1086#1090' '#1087#1083#1072#1085#1072' '
    end
    object Label74: TLabel
      Left = 225
      Top = 185
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
    object Label75: TLabel
      Left = 275
      Top = 185
      Width = 14
      Height = 13
      Caption = #1091#1087'.'
    end
    object Label76: TLabel
      Left = 15
      Top = 205
      Width = 115
      Height = 13
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1073#1086#1085#1091#1089' '#1072#1087#1090#1077#1082#1080
    end
    object Label77: TLabel
      Left = 137
      Top = 205
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
    object Label78: TLabel
      Left = 195
      Top = 205
      Width = 44
      Height = 13
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
    end
    object Label79: TLabel
      Left = 335
      Top = 205
      Width = 166
      Height = 13
      Caption = #1044#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1083#1072#1085#1072' '#1086#1089#1090#1072#1083#1086#1089#1100':'
    end
    object Label81: TLabel
      Left = 340
      Top = 225
      Width = 105
      Height = 13
      Caption = '- '#1082#1086#1083#1083#1077#1082#1090#1080#1074#1091' '#1072#1087#1090#1077#1082#1080':'
    end
    object Label82: TLabel
      Left = 340
      Top = 245
      Width = 61
      Height = 13
      Caption = '- '#1083#1080#1095#1085#1086' '#1074#1072#1084':'
    end
    object Label83: TLabel
      Left = 450
      Top = 225
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
    object Label85: TLabel
      Left = 500
      Top = 225
      Width = 14
      Height = 13
      Caption = #1091#1087'.'
    end
    object Label86: TLabel
      Left = 450
      Top = 245
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
    object Label87: TLabel
      Left = 500
      Top = 245
      Width = 14
      Height = 13
      Caption = #1091#1087'.'
    end
    object Label21: TLabel
      Left = 15
      Top = 228
      Width = 296
      Height = 33
      AutoSize = False
      Caption = 
        #1055#1088#1080' '#1087#1077#1088#1077#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080' '#1087#1083#1072#1085#1072' ('#1073#1086#1083#1077#1077' '#1095#1077#1084' '#1085#1072' 100%)  '#1087#1088#1086#1087#1086#1088#1094#1080#1086#1085#1072#1083#1100#1085#1086' '#1085#1072 +
        #1095#1080#1089#1083#1103#1102#1090#1089#1103' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label54: TLabel
      Left = 15
      Top = 256
      Width = 93
      Height = 13
      Caption = #1073#1086#1085#1091#1089#1099' '#1074' '#1088#1072#1079#1084#1077#1088#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 115
      Top = 256
      Width = 70
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
      Layout = tlCenter
    end
    object Label23: TLabel
      Left = 190
      Top = 256
      Width = 41
      Height = 13
      Caption = #1073#1086#1085#1091#1089#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label91: TLabel
      Left = 235
      Top = 256
      Width = 70
      Height = 13
      Caption = #1079#1072' 1 '#1091#1087#1072#1082#1086#1074#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Panel7: TPanel
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
      object Label84: TLabel
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
  object Panel4: TPanel
    Left = 20
    Top = 190
    Width = 572
    Height = 347
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 6
    Visible = False
    object Shape2: TShape
      Left = 383
      Top = 112
      Width = 132
      Height = 62
      Pen.Color = clMaroon
      Pen.Width = 5
      Shape = stRoundRect
    end
    object Label25: TLabel
      Left = 15
      Top = 265
      Width = 126
      Height = 13
      Caption = #1048#1090#1086#1075#1086' '#1074' '#1042#1072#1096#1077#1081' '#1082#1086#1087#1080#1083#1082#1077': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
      OnClick = Label25Click
      OnMouseEnter = Label11MouseEnter
      OnMouseLeave = Label11MouseLeave
    end
    object Label26: TLabel
      Left = 142
      Top = 265
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
      Visible = False
    end
    object Label27: TLabel
      Left = 192
      Top = 265
      Width = 44
      Height = 13
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
      Visible = False
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
      Width = 234
      Height = 13
      Caption = #1055#1088#1080' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080' '#1087#1083#1072#1085#1072' '#1087#1088#1086#1076#1072#1078' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1084' :'
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
    object Label88: TLabel
      Left = 396
      Top = 121
      Width = 111
      Height = 27
      Alignment = taCenter
      AutoSize = False
      Caption = #1044#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1083#1072#1085#1072' '#1042#1072#1084' '#1086#1089#1090#1072#1083#1086#1089#1100':'
      WordWrap = True
    end
    object Label89: TLabel
      Left = 418
      Top = 151
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
    object Label90: TLabel
      Left = 468
      Top = 151
      Width = 14
      Height = 13
      Caption = #1091#1087'.'
    end
    object Label92: TLabel
      Left = 15
      Top = 218
      Width = 500
      Height = 13
      Caption = 
        #1055#1088#1080' '#1087#1077#1088#1077#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080' '#1087#1083#1072#1085#1072' ('#1073#1086#1083#1077#1077' '#1095#1077#1084' '#1085#1072' 100%)  '#1087#1088#1086#1087#1086#1088#1094#1080#1086#1085#1072#1083#1100#1085#1086' '#1085#1072 +
        #1095#1080#1089#1083#1103#1102#1090#1089#1103' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label93: TLabel
      Left = 15
      Top = 236
      Width = 93
      Height = 13
      Caption = #1073#1086#1085#1091#1089#1099' '#1074' '#1088#1072#1079#1084#1077#1088#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label94: TLabel
      Left = 115
      Top = 236
      Width = 70
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
      Layout = tlCenter
    end
    object Label95: TLabel
      Left = 190
      Top = 236
      Width = 41
      Height = 13
      Caption = #1073#1086#1085#1091#1089#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label96: TLabel
      Left = 240
      Top = 236
      Width = 70
      Height = 13
      Caption = #1079#1072' 1 '#1091#1087#1072#1082#1086#1074#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
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
  object Panel10: TPanel
    Left = 20
    Top = 190
    Width = 572
    Height = 347
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 14
    Visible = False
    object Label109: TLabel
      Left = 15
      Top = 225
      Width = 126
      Height = 13
      Caption = #1048#1090#1086#1075#1086' '#1074' '#1042#1072#1096#1077#1081' '#1082#1086#1087#1080#1083#1082#1077': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
      OnClick = Label25Click
      OnMouseEnter = Label11MouseEnter
      OnMouseLeave = Label11MouseLeave
    end
    object Label110: TLabel
      Left = 142
      Top = 225
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
      Visible = False
    end
    object Label111: TLabel
      Left = 192
      Top = 225
      Width = 44
      Height = 13
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
      Visible = False
    end
    object Label112: TLabel
      Left = 15
      Top = 90
      Width = 320
      Height = 13
      Caption = #1054#1073#1097#1080#1081' '#1087#1083#1072#1085' '#1087#1088#1086#1076#1072#1078' '#1087#1086' '#1074#1089#1077#1084' '#1072#1082#1094#1080#1086#1085#1085#1099#1084' '#1087#1086#1079#1080#1094#1080#1103#1084' '#1076#1083#1103' '#1072#1087#1090#1077#1082#1080
    end
    object Label113: TLabel
      Left = 340
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
    object Label114: TLabel
      Left = 390
      Top = 90
      Width = 14
      Height = 13
      Caption = #1091#1087'.'
    end
    object Label115: TLabel
      Left = 75
      Top = 110
      Width = 53
      Height = 13
      Caption = 'Label115'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label116: TLabel
      Left = 305
      Top = 190
      Width = 64
      Height = 13
      Caption = '%  '#1086#1090' '#1087#1083#1072#1085#1072' -'
      Visible = False
    end
    object Bevel3: TBevel
      Left = 15
      Top = 208
      Width = 549
      Height = 2
    end
    object Label123: TLabel
      Left = 15
      Top = 190
      Width = 234
      Height = 13
      Caption = #1058#1077#1082#1091#1097#1080#1081' '#1087#1088#1086#1094#1077#1085#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1083#1072#1085#1072'  '#1072#1087#1090#1077#1082#1086#1081
      Visible = False
    end
    object Label128: TLabel
      Left = 255
      Top = 190
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
      Visible = False
    end
    object Label134: TLabel
      Left = 15
      Top = 150
      Width = 143
      Height = 13
      Caption = #1042#1072#1096' '#1073#1086#1085#1091#1089' '#1087#1086' '#1076#1072#1085#1085#1086#1081' '#1072#1082#1094#1080#1080' '
    end
    object Label135: TLabel
      Left = 165
      Top = 150
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
    object Label136: TLabel
      Left = 215
      Top = 150
      Width = 44
      Height = 13
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
    end
    object Label137: TLabel
      Left = 375
      Top = 190
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
      Visible = False
    end
    object Label138: TLabel
      Left = 425
      Top = 190
      Width = 71
      Height = 13
      Caption = #1091#1087'. '#1079#1072' '#1087#1077#1088#1080#1086#1076' '
      Visible = False
    end
    object Label117: TLabel
      Left = 15
      Top = 130
      Width = 128
      Height = 13
      Caption = #1055#1083#1072#1085' '#1085#1072' '#1076#1072#1085#1085#1091#1102' '#1087#1086#1079#1080#1094#1080#1102
    end
    object Label118: TLabel
      Left = 150
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
    object Label119: TLabel
      Left = 200
      Top = 130
      Width = 14
      Height = 13
      Caption = #1091#1087'.'
    end
    object Label120: TLabel
      Left = 15
      Top = 110
      Width = 51
      Height = 13
      Caption = #1079#1072' '#1087#1077#1088#1080#1086#1076
    end
    object Panel11: TPanel
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
      object Label145: TLabel
        Left = 1
        Top = 1
        Width = 544
        Height = 72
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        Caption = 'Label145'
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
  object Panel1: TPanel
    Left = 20
    Top = 189
    Width = 572
    Height = 347
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 4
    Visible = False
    DesignSize = (
      572
      347)
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
      Height = 41
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
      Top = 319
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
      Top = 269
      Width = 176
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1042#1099' '#1091#1078#1077' '#1079#1072#1088#1072#1073#1086#1090#1072#1083#1080' '#1087#1086' '#1101#1090#1086#1081' '#1072#1082#1094#1080#1080':'
    end
    object Label10: TLabel
      Left = 205
      Top = 269
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
      Top = 269
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
      Visible = False
      OnClick = Label11Click
      OnMouseEnter = Label11MouseEnter
      OnMouseLeave = Label11MouseLeave
    end
    object Label12: TLabel
      Left = 453
      Top = 269
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
      Visible = False
    end
    object Label13: TLabel
      Left = 503
      Top = 269
      Width = 44
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
      Visible = False
    end
    object Label14: TLabel
      Left = 25
      Top = 284
      Width = 138
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1055#1083#1072#1085' '#1079#1072#1084#1077#1085' '#1087#1086' '#1101#1090#1086#1081' '#1072#1082#1094#1080#1080':'
      Visible = False
    end
    object Label15: TLabel
      Left = 205
      Top = 284
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
      Top = 284
      Width = 16
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1096#1090'.'
      Visible = False
    end
    object Label17: TLabel
      Left = 321
      Top = 284
      Width = 93
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1042#1099' '#1091#1078#1077' '#1079#1072#1084#1077#1085#1080#1083#1080':'
    end
    object Label18: TLabel
      Left = 453
      Top = 284
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
      Top = 284
      Width = 21
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1088#1072#1079'.'
    end
    object Label20: TLabel
      Left = 263
      Top = 269
      Width = 44
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1073#1086#1085#1091#1089#1086#1074'.'
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
    Left = 440
    Top = 102
    Width = 151
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
    Left = 440
    Top = 131
    Width = 151
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
    Left = 440
    Top = 161
    Width = 151
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
    Height = 477
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
    Height = 477
    Anchors = [akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clRed
    TabOrder = 9
    Visible = False
  end
  object pnAl3: TPanel
    Left = 12
    Top = 539
    Width = 588
    Height = 12
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    Color = clRed
    TabOrder = 10
    Visible = False
  end
  object bbComlect: TBitBtn
    Left = 440
    Top = 161
    Width = 151
    Height = 25
    Caption = #1055#1088#1086#1076#1072#1090#1100' '#1082#1086#1084#1087#1083#1077#1082#1090#1086#1084
    TabOrder = 13
    Visible = False
    OnClick = bbComlectClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000130B0000130B00000000000000000000C0C0C0C0C0C0
      C0C0C0C0C0C0DFF7FB8FE2F855BBF139AEEE39ADEF56BAF190D1F4E0F1F8C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0F8FCFD8CE7F929CDF821ACEF22A6EE23
      A6EF23A5EF22A5EE21A4EC2BA7EE8ED1F3F8FCFCC0C0C0C0C0C0C0C0C0F8FCFD
      69E1F723C8F52893E12885DC258EDE23A2EB4EB1EA98C9E997C3E745A1DC22A4
      EE6BC2F1F8FCFCC0C0C0C0C0C08CE7F922D2FA456EDD545FDE5D63E0515DDA75
      96DAF6FAFBFEFEFEFEFEFEDADCE04D99CE21A6EE8DD1F3C0C0C0DCF6FB29D2F8
      24D2FA4B64E05059DB5359D84E57DAE4E7F8FFFFFFFEFEFEE1E1E1D0D0D0C9D9
      E824A2EC29A7EEE0F2F98DE7F922D2FA23D1F9506AE34C58DF4E55D85460E0F7
      F8FCFEFEFEE1E1E1D0D0D0FBFBFBE5EDF4249FE920A6EE8FD1F353DBFA24D2FA
      24D2F9556DE05A65E05F64DF5561E1D6DAF5E1E1E1D0D0D0FBFBFBFEFEFEB7D8
      ED23A5EE22A5EE55BAF138D6F924D3FB25D2FA5169E05965E05A5FDC5863E25D
      81D6CFCFC7F9FAFAFDFDFEF8F4DF82ACA421A6EE23A6EF38ADEE38D6F923D2FA
      23D0F94B63DD5460DD5D62DD515CDD3C73D5DABC40EBD378E4CE76E7C0387DA2
      8423A5EE23A6EF38ADEE51DAF922D1F924D2FA4B84F0546AF1656AE5516CF13A
      A2EADCBB34E7BD2FE5BB33E6BC2B7EA18522A6EE23A6EE54BAF18AE6F921D3FA
      23D2FB21D2F928C7F72CC1F527CCF926D2F8D9BC36E6BA28E5BB2AE7BA257FA3
      8922A6ED22ABF08EE1F8DCF7FB2AD3F924D2FB23D3FB24D2FA23D2FB23D2FA27
      D3F8DCC13CE4B928E2B727E8BD2E7FA48A21ACEF28CDF8DDF7FBC0C0C089E6F9
      22D2FA24D3FB24D3FB24D3FB24D3FB26D3F6DDC346E9C74FD8BE58E8C64480AC
      8E21CDF78BE6F9C0C0C0C0C0C0F7FCFD67E0F722D3FA24D3FB24D3FB24D3FB24
      D2FA63CEBF9CCC9098C48F89CA9C37D0E669E0F8F6FAFCC0C0C0C0C0C0C0C0C0
      F7FCFD88E6F929D3F923D2FA23D3FA24D3FB23D2FA21D3FA20D3F928D3F888E4
      F6F3F7F8C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0DCF7FB8AE7F952DBFA38
      D6F938D6F952DBFA8BE7F9DCF7FBC0C0C0C0C0C0C0C0C0C0C0C0}
  end
end
