object MoneyCashF: TMoneyCashF
  Left = 691
  Top = 168
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'MoneyCashF'
  ClientHeight = 623
  ClientWidth = 538
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
    538
    623)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 591
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      537
      591)
    object Label1: TLabel
      Left = 15
      Top = 46
      Width = 128
      Height = 28
      Caption = #1050' '#1086#1087#1083#1072#1090#1077': '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 15
      Top = 168
      Width = 86
      Height = 28
      Caption = #1057#1076#1072#1095#1072': '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 15
      Top = 106
      Width = 180
      Height = 24
      Caption = #1054#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 15
      Top = 376
      Width = 148
      Height = 28
      Caption = #1050' '#1089#1087#1080#1089#1072#1085#1080#1102':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 15
      Top = 446
      Width = 201
      Height = 20
      Caption = #1053#1072#1082#1086#1087#1083#1077#1085#1086' '#1074#1089#1077#1075#1086' '#1076#1077#1085#1077#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 15
      Top = 478
      Width = 216
      Height = 20
      Caption = #1053#1072#1082#1086#1087#1083#1077#1085#1086' '#1076#1077#1085#1077#1075' '#1087#1086' '#1095#1077#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 275
      Top = 300
      Width = 6
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbaAll: TLabel
      Left = 296
      Top = 443
      Width = 221
      Height = 30
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '0.0'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clPurple
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbaOst: TLabel
      Left = 336
      Top = 507
      Width = 181
      Height = 30
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '999999.00 '#1075#1088#1085'.'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clPurple
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 15
      Top = 511
      Width = 290
      Height = 20
      Caption = #1054#1089#1090#1072#1085#1077#1090#1089#1103' '#1076#1077#1085#1077#1075' '#1087#1086#1089#1083#1077' '#1089#1087#1080#1089#1072#1085#1080#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbaChek: TLabel
      Left = 286
      Top = 475
      Width = 231
      Height = 30
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '0.0'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clPurple
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 15
      Top = 239
      Width = 258
      Height = 23
      Caption = #1057#1091#1084#1084#1072' '#1089#1076#1072#1095#1080' '#1085#1072' '#1082#1072#1088#1090#1086#1095#1082#1091':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 15
      Top = 280
      Width = 486
      Height = 36
      AutoSize = False
      Caption = 
        #1042#1099' '#1084#1086#1078#1077#1090#1077' '#1079#1072#1095#1080#1089#1083#1080#1090#1100' '#1095#1072#1089#1090#1100' '#1089#1076#1072#1095#1080' '#1085#1072' '#1089#1074#1086#1102' '#1082#1072#1088#1090#1086#1095#1082#1091' '#1080' '#1074' '#1087#1086#1089#1083#1077#1076#1089#1090#1074#1080#1080 +
        ' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1077#1077' '#1076#1083#1103' '#1086#1087#1083#1072#1090#1099' '#1090#1086#1074#1072#1088#1086#1074'. '#1044#1083#1103' '#1101#1090#1086#1075#1086' '#1074#1074#1077#1076#1080#1090#1077' '#1085#1091#1078#1085#1091#1102' '#1089#1091 +
        #1084#1084#1091' '#1074' '#1087#1086#1083#1077' "'#1057#1091#1084#1084#1072' '#1089#1076#1072#1095#1080' '#1085#1072' '#1082#1072#1088#1090#1086#1095#1082#1091'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label11: TLabel
      Left = 26
      Top = 560
      Width = 468
      Height = 26
      Alignment = taCenter
      Caption = 
        #1053#1077' '#1086#1090#1076#1072#1074#1072#1081#1090#1077' '#1076#1080#1089#1082#1086#1085#1090#1085#1091#1102' '#1082#1072#1088#1090#1086#1095#1082#1091' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1102' '#1076#1086' '#1082#1086#1085#1094#1072' '#1087#1086#1082#1091#1087#1082#1080'. '#1054#1085 +
        #1072' '#1073#1091#1076#1077#1090' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1072' '#1076#1083#1103' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103' '#1079#1072#1074#1077#1088#1096#1077#1085#1080#1103' '#1087#1086#1082#1091#1087#1082#1080' !!! '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label12: TLabel
      Left = 42
      Top = 7
      Width = 436
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = #1054#1087#1083#1072#1090#1072' '#1085#1072#1083#1080#1095#1085#1099#1084#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 50
      Top = 540
      Width = 420
      Height = 13
      Caption = 
        #1053#1077' '#1079#1072#1073#1091#1076#1100#1090#1077' '#1086#1079#1074#1091#1095#1080#1090#1100' '#1080#1090#1086#1075#1086#1074#1091#1102' '#1089#1091#1084#1084#1091' '#1085#1072#1082#1086#1087#1083#1077#1085#1085#1099#1093' '#1076#1077#1085#1077#1075' '#1087#1086' '#1082#1072#1088#1090#1077'!!' +
        '!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 15
      Top = 315
      Width = 508
      Height = 46
      AutoSize = False
      Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1089#1087#1080#1089#1072#1085#1080#1103' '#1085#1072' '#1076#1072#1085#1085#1099#1081' '#1095#1077#1082': '#1075#1088#1085'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object StaticText1: TStaticText
      Left = 145
      Top = 30
      Width = 372
      Height = 58
      Alignment = taRightJustify
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = '0.00 '
      Color = clBtnHighlight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -48
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object StaticText2: TStaticText
      Left = 110
      Top = 150
      Width = 407
      Height = 63
      Alignment = taRightJustify
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = '0.00 '
      Color = clBtnHighlight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -55
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 15
      Top = 415
      Width = 471
      Height = 17
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1085#1072#1082#1086#1087#1083#1077#1085#1085#1091#1102' '#1089#1091#1084#1084#1091' '#1076#1083#1103' '#1095#1072#1089#1090#1080#1095#1085#1086#1081' '#1086#1087#1083#1072#1090#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object Memo1: TEdit
      Left = 225
      Top = 100
      Width = 292
      Height = 36
      Anchors = [akLeft, akTop, akRight]
      BevelKind = bkFlat
      BorderStyle = bsNone
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Text = '0'
      OnChange = Memo1Change
      OnKeyPress = Memo1KeyPress
    end
    object Memo2: TEdit
      Left = 185
      Top = 370
      Width = 331
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      BevelKind = bkFlat
      BorderStyle = bsNone
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -29
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Text = '0'
      OnChange = Memo2Change
      OnKeyPress = Memo1KeyPress
    end
    object Memo3: TEdit
      Left = 285
      Top = 230
      Width = 231
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      BevelKind = bkFlat
      BorderStyle = bsNone
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -29
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      Text = '0'
      OnChange = Memo3Change
      OnKeyPress = Memo1KeyPress
    end
  end
  object BitBtn1: TBitBtn
    Left = 147
    Top = 596
    Width = 110
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1050
    Default = True
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 265
    Top = 596
    Width = 110
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = BitBtn2Click
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000D40E0000D40E00000000000000000000FF0000FF0000
      FF0000D7D7F2262669000059000059000059000059000059000059242450E3E3
      E4FF0000FF0000FF000000FF0000FF0000FF00DFDFDF3A3A3A1A1A1A1A1A1A1A
      1A1A1A1A1A1A1A1A1A1A1A313131E3E3E300FF0000FF0000FF00FF0000FF0000
      D7D7F22828CA0707C80101BD0101BD0101BD0101BD0101BD0101BD0101BD2424
      50E3E3E4FF0000FF000000FF0000FF00DFDFDF58585840404039393939393939
      3939393939393939393939393939313131E3E3E300FF0000FF00FF0000D7D7F2
      2828CA0707C80101BD0101BD0707C80101BD0101BD0101BD0101BD0101BD0101
      BD242450E3E3E4FF000000FF00DFDFDF58585840404039393939393940404039
      3939393939393939393939393939393939313131E3E3E300FF00D7D7F22828CA
      0707C82828CA0101BD0101BD2929AF0707C82828CA2929AF0707C82828CA0707
      C80101BD242450E3E3E4DFDFDF58585840404058585839393939393951515140
      4040585858515151404040585858404040393939313131E3E3E32828CA0101BD
      D1D1DAD7D7F2A4A4D52929AFA4A4D50101BDD7D7F2D7D7F26161D3D1D1DA2828
      CA0101BD0101BD242450585858393939D3D3D3DFDFDFB2B2B2515151B2B2B239
      3939DFDFDFDFDFDF838383D3D3D35858583939393939393131310000F50101BD
      D7D7F26161D3A4A4D52828CAD1D1DA0101BDE3E3E46161D3A4A4D5A4A4D56161
      D30101BD0101BD000059494949393939DFDFDF838383B2B2B2585858D3D3D339
      3939E3E3E3838383B2B2B2B2B2B28383833939393939391A1A1A0707C80707C8
      6161D36161D3A4A4D52828CAD1D1DA0101BDE3E3E46161D3A4A4D5A4A4D5E3E3
      E4A4A4D50101BD000059404040404040838383838383B2B2B2585858D3D3D339
      3939E3E3E3838383B2B2B2B2B2B2E3E3E3B2B2B23939391A1A1A0000F50101BD
      0707C86161D3A4A4D52929AFD1D1DA0101BDE3E3E46161D3A4A4D5D1D1DA5D5D
      BBA4A4D50101BD000059494949393939404040838383B2B2B2515151D3D3D339
      3939E3E3E3838383B2B2B2D3D3D3797979B2B2B23939391A1A1A0707C80101BD
      5D5DBBE3E3E42828CA2828CAD1D1DA0101BDE3E3E46161D3A4A4D5A4A4D56161
      D3D1D1DA0101BD000059404040393939797979E3E3E3585858585858D3D3D339
      3939E3E3E3838383B2B2B2B2B2B2838383D3D3D33939391A1A1A0000F50101BD
      D1D1DA6161D32828CA2828CAD1D1DA0101BDE3E3E46161D3A4A4D5A4A4D56161
      D3D1D1DA0101BD000059494949393939D3D3D3838383585858585858D3D3D339
      3939E3E3E3838383B2B2B2B2B2B2838383D3D3D33939391A1A1A0000F50101BD
      D7D7F26161D3A4A4D50707C8D7D7F20101BDE3E3E46161D3A4A4D5A4A4D56161
      D3D1D1DA0101BD000059494949393939DFDFDF838383B2B2B2404040DFDFDF39
      3939E3E3E3838383B2B2B2B2B2B2838383D3D3D33939391A1A1A2626F40707C8
      A4A4D5D7D7F2A4A4D5A4A4D5E3E3E45D5DBBD1D1DAD1D1DA6161D3D7D7F2D1D1
      DAA4A4D50101BD262669636363404040B2B2B2DFDFDFB2B2B2B2B2B2E3E3E379
      7979D3D3D3D3D3D3838383DFDFDFD3D3D3B2B2B23939393A3A3AD7D7F22626F4
      2828CA2828CA2828CA2828CA2828CA2828CA2828CA2828CA0707C82828CA6161
      D30101BD2929AFE3E3E4DFDFDF63636358585858585858585858585858585858
      5858585858585858404040585858838383393939515151E3E3E3FF0000D7D7F2
      2626F40707C80101BD0101BD0101BD0101BD0101BD0101BD0101BD0101BD0101
      BD2929AFD7D7F2FF000000FF00DFDFDF63636340404039393939393939393939
      3939393939393939393939393939393939515151DFDFDF00FF00FF0000FF0000
      D7D7F22626F40707C80707C80707C80707C80707C80707C80707C80101BD2929
      AFE3E3E4FF0000FF000000FF0000FF00DFDFDF63636340404040404040404040
      4040404040404040404040393939515151E3E3E300FF0000FF00FF0000FF0000
      FF0000D7D7F22626F40000F50000F50000F50000F50000F50000F52929AFD7D7
      F2FF0000FF0000FF000000FF0000FF0000FF00DFDFDF63636349494949494949
      4949494949494949494949515151DFDFDF00FF0000FF0000FF00}
    NumGlyphs = 2
  end
  object ActionList1: TActionList
    Left = 130
    Top = 155
    object NotAltF4: TAction
      Caption = 'NotAltF4'
      ShortCut = 32883
      OnExecute = NotAltF4Execute
    end
  end
end
