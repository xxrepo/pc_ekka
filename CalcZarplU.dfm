object CalcZarplF: TCalcZarplF
  Left = 398
  Top = 4
  BorderStyle = bsDialog
  Caption = 'CalcZarplF'
  ClientHeight = 619
  ClientWidth = 398
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
    398
    619)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 397
    Height = 588
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object Label1: TLabel
      Left = 215
      Top = 100
      Width = 79
      Height = 13
      Caption = #1042#1099#1088#1091#1095#1082#1072' ('#1076#1077#1085#1100'):'
    end
    object Label2: TLabel
      Left = 6
      Top = 22
      Width = 36
      Height = 13
      Caption = #1052#1077#1089#1103#1094':'
    end
    object Label3: TLabel
      Left = 186
      Top = 22
      Width = 21
      Height = 13
      Caption = #1043#1086#1076':'
    end
    object Label4: TLabel
      Left = 5
      Top = 100
      Width = 64
      Height = 13
      Caption = #1063#1072#1089#1099' ('#1076#1077#1085#1100'):'
    end
    object Label5: TLabel
      Left = 5
      Top = 180
      Width = 106
      Height = 13
      Caption = #1063#1072#1089#1099' ('#1089#1090#1072#1088#1096#1080#1085#1089#1090#1074#1086'):'
    end
    object Label6: TLabel
      Left = 5
      Top = 74
      Width = 61
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
    end
    object Label7: TLabel
      Left = 5
      Top = 125
      Width = 63
      Height = 13
      Caption = #1063#1072#1089#1099' ('#1085#1086#1095#1100'):'
    end
    object Label8: TLabel
      Left = 5
      Top = 50
      Width = 124
      Height = 13
      Caption = #1053#1086#1088#1084#1072#1090#1080#1074' '#1095#1072#1089#1086#1074' '#1072#1087#1090#1077#1082#1080':'
    end
    object Label9: TLabel
      Left = 135
      Top = 50
      Width = 40
      Height = 13
      Caption = 'lbNorm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 215
      Top = 125
      Width = 78
      Height = 13
      Caption = #1042#1099#1088#1091#1095#1082#1072' ('#1085#1086#1095#1100'):'
    end
    object Label12: TLabel
      Left = 230
      Top = 180
      Width = 106
      Height = 13
      Caption = #1063#1072#1089#1099' ('#1079#1072#1074#1077#1076#1086#1074#1072#1085#1080#1103'):'
    end
    object Label11: TLabel
      Left = 5
      Top = 150
      Width = 102
      Height = 13
      Caption = #1063#1072#1089#1099' ('#1076#1077#1085#1100' '#1089#1090#1072#1074#1082#1072'):'
    end
    object Label13: TLabel
      Left = 230
      Top = 151
      Width = 101
      Height = 13
      Caption = #1063#1072#1089#1099' ('#1085#1086#1095#1100' '#1089#1090#1072#1074#1082#1072'):'
    end
    object ComboBox2: TComboBox
      Left = 47
      Top = 19
      Width = 120
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
      TabOrder = 0
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
    object Edit1: TEdit
      Left = 211
      Top = 19
      Width = 41
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Text = '2012'
    end
    object UpDown1: TUpDown
      Left = 252
      Top = 19
      Width = 15
      Height = 21
      Associate = Edit1
      Min = 1975
      Max = 10000
      Position = 2012
      TabOrder = 2
      Thousands = False
    end
    object Edit2: TEdit
      Left = 299
      Top = 97
      Width = 92
      Height = 21
      TabOrder = 3
      Text = '0'
      OnKeyPress = Edit4KeyPress
    end
    object Edit3: TEdit
      Left = 71
      Top = 97
      Width = 57
      Height = 21
      TabOrder = 4
      Text = '0'
      OnKeyPress = Edit4KeyPress
    end
    object Panel2: TPanel
      Left = -80
      Top = 75
      Width = 93
      Height = 46
      TabOrder = 5
      Visible = False
      object RadioButton3: TRadioButton
        Left = 5
        Top = 25
        Width = 56
        Height = 17
        Caption = #1057#1090#1072#1074#1082#1072
        TabOrder = 0
      end
      object RadioButton4: TRadioButton
        Left = 5
        Top = 5
        Width = 86
        Height = 17
        Caption = #1055#1086#1095#1072#1089#1086#1074#1082#1072
        Checked = True
        TabOrder = 1
        TabStop = True
      end
    end
    object BitBtn1: TBitBtn
      Left = 274
      Top = 18
      Width = 117
      Height = 25
      Caption = #1056#1072#1089#1095#1077#1090
      TabOrder = 6
      OnClick = BitBtn1Click
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
    object Edit4: TEdit
      Left = 116
      Top = 177
      Width = 50
      Height = 21
      TabOrder = 7
      Text = '0'
      OnKeyPress = Edit4KeyPress
    end
    object ComboBox1: TComboBox
      Left = 70
      Top = 70
      Width = 146
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
      Items.Strings = (
        #1047#1072#1074#1077#1076#1091#1102#1097#1080#1081
        #1047#1072#1084#1077#1089#1090#1080#1090#1077#1083#1100
        #1050#1072#1089#1089#1080#1088
        #1055#1088#1086#1074#1080#1079#1086#1088
        #1055#1088#1086#1074#1080#1079#1086#1088'-'#1080#1085#1090#1077#1088#1085
        #1060#1072#1088#1084#1072#1094#1077#1074#1090
        #1048'.'#1086'. '#1079#1072#1074#1077#1076#1091#1102#1097#1077#1075#1086
        #1047#1072#1074#1077#1076#1091#1102#1097#1080#1081' '#1072#1087#1090#1077#1095#1085#1099#1084' '#1082#1080#1086#1089#1082#1086#1084)
    end
    object Edit5: TEdit
      Left = 71
      Top = 122
      Width = 57
      Height = 21
      TabOrder = 9
      Text = '0'
      OnKeyPress = Edit4KeyPress
    end
    object Edit6: TEdit
      Left = 299
      Top = 122
      Width = 92
      Height = 21
      TabOrder = 10
      Text = '0'
      OnKeyPress = Edit4KeyPress
    end
    object st1: TStaticText
      Left = 5
      Top = 205
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1054#1082#1083#1072#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object st2: TStaticText
      Left = 5
      Top = 224
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1044#1086#1087#1083#1072#1090#1072' '#1079#1072' '#1074#1099#1089#1096#1077#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
    end
    object st3: TStaticText
      Left = 5
      Top = 243
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1044#1086#1087#1083#1072#1090#1072' '#1079#1072' '#1079#1072#1074#1077#1076#1086#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
    end
    object st4: TStaticText
      Left = 5
      Top = 262
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1044#1086#1087#1083#1072#1090#1072' '#1079#1072' '#1089#1090#1072#1088#1096#1080#1085#1089#1090#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
    end
    object st5: TStaticText
      Left = 5
      Top = 281
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1044#1086#1087#1083#1072#1090#1072' '#1079#1072' '#1087#1088#1080#1077#1084' '#1090#1086#1074#1072#1088#1072' '#1085#1086#1095#1100#1102
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
    end
    object st6: TStaticText
      Left = 5
      Top = 300
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1044#1086#1087#1083#1072#1090#1072' '#1079#1072' '#1085#1086#1095#1085#1099#1077' '#1095#1072#1089#1099' '#1088#1072#1073#1086#1090#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
    end
    object st7: TStaticText
      Left = 5
      Top = 319
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1055#1088#1077#1084#1080#1103' 20%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
    end
    object st8: TStaticText
      Left = 5
      Top = 338
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1044#1085#1077#1074#1085#1072#1103' '#1074#1099#1088#1091#1095#1082#1072' '#1072#1087#1090#1077#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 18
    end
    object st9: TStaticText
      Left = 5
      Top = 357
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1072#1087#1090#1077#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 19
    end
    object st10: TStaticText
      Left = 5
      Top = 376
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1063#1072#1089#1086#1074#1072#1103' '#1085#1086#1088#1084#1072#1090#1080#1074#1085#1072#1103' '#1074#1099#1088#1091#1095#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 20
    end
    object st11: TStaticText
      Left = 5
      Top = 395
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1063#1072#1089#1086#1074#1072#1103' '#1074#1099#1088#1091#1095#1082#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 21
    end
    object st12: TStaticText
      Left = 5
      Top = 414
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1055#1088#1086#1094#1077#1085#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1086' '#1085#1086#1088#1084#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 22
    end
    object st13: TStaticText
      Left = 5
      Top = 433
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1087#1088#1077#1084#1080#1080' '#1087#1086' '#1074#1099#1088#1091#1095#1082#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 23
    end
    object st14: TStaticText
      Left = 5
      Top = 452
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1055#1088#1077#1084#1080#1103' '#1079#1072' '#1074#1099#1088#1091#1095#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 24
    end
    object st15: TStaticText
      Left = 5
      Top = 471
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1042#1099#1088#1091#1095#1082#1072' '#1072#1087#1090#1077#1082#1080' '#1079#1072' '#1087#1088#1086#1096#1083#1099#1081' '#1084#1077#1089#1103#1094
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 25
    end
    object st16: TStaticText
      Left = 5
      Top = 490
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1055#1088#1080#1088#1086#1089#1090' '#1076#1085#1077#1074#1085#1086#1081' '#1074#1099#1088#1091#1095#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 26
    end
    object st17: TStaticText
      Left = 5
      Top = 509
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1087#1088#1077#1084#1080#1080' '#1087#1086' '#1087#1088#1080#1088#1086#1089#1090#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 27
    end
    object st18: TStaticText
      Left = 5
      Top = 528
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1055#1088#1077#1084#1080#1103' '#1079#1072' '#1087#1088#1080#1088#1086#1089#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 28
    end
    object st20: TStaticText
      Left = 5
      Top = 567
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1048#1090#1086#1075#1086' '#1047#1055
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 29
    end
    object StaticText22: TStaticText
      Left = 224
      Top = 205
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 30
    end
    object StaticText23: TStaticText
      Left = 224
      Top = 224
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 31
    end
    object StaticText24: TStaticText
      Left = 224
      Top = 243
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 32
    end
    object StaticText26: TStaticText
      Left = 224
      Top = 262
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 33
    end
    object StaticText27: TStaticText
      Left = 224
      Top = 281
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 34
    end
    object StaticText28: TStaticText
      Left = 224
      Top = 300
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 35
    end
    object StaticText29: TStaticText
      Left = 224
      Top = 319
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 36
    end
    object StaticText30: TStaticText
      Left = 224
      Top = 338
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 37
    end
    object StaticText31: TStaticText
      Left = 224
      Top = 357
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 38
    end
    object StaticText32: TStaticText
      Left = 224
      Top = 376
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 39
    end
    object StaticText33: TStaticText
      Left = 224
      Top = 395
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 40
    end
    object StaticText34: TStaticText
      Left = 224
      Top = 414
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 41
    end
    object StaticText35: TStaticText
      Left = 224
      Top = 433
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 42
    end
    object StaticText36: TStaticText
      Left = 224
      Top = 452
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 43
    end
    object StaticText37: TStaticText
      Left = 224
      Top = 471
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 44
    end
    object StaticText39: TStaticText
      Left = 224
      Top = 490
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 45
    end
    object StaticText40: TStaticText
      Left = 224
      Top = 509
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 46
    end
    object StaticText41: TStaticText
      Left = 224
      Top = 528
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 47
    end
    object StaticText42: TStaticText
      Left = 224
      Top = 567
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 48
    end
    object Edit7: TEdit
      Left = 341
      Top = 177
      Width = 50
      Height = 21
      TabOrder = 49
      Text = '0'
      OnKeyPress = Edit4KeyPress
    end
    object st19: TStaticText
      Left = 5
      Top = 547
      Width = 216
      Height = 17
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Caption = #1055#1088#1077#1084#1080#1103' '#1079#1072' '#1087#1088#1080#1088#1086#1089#1090' '#1087#1086' '#1072#1087#1090#1077#1082#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 50
    end
    object StaticText2: TStaticText
      Left = 224
      Top = 547
      Width = 168
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BevelInner = bvNone
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 51
    end
    object Edit8: TEdit
      Left = 116
      Top = 147
      Width = 50
      Height = 21
      TabOrder = 52
      Text = '0'
      OnKeyPress = Edit4KeyPress
    end
    object Edit9: TEdit
      Left = 341
      Top = 148
      Width = 50
      Height = 21
      TabOrder = 53
      Text = '0'
      OnKeyPress = Edit4KeyPress
    end
  end
  object BitBtn2: TBitBtn
    Left = 202
    Top = 592
    Width = 106
    Height = 25
    Anchors = [akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
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
    Left = 90
    Top = 592
    Width = 106
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 2
    OnClick = BitBtn3Click
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
