object SumZF: TSumZF
  Left = 735
  Top = 281
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'SumZF'
  ClientHeight = 436
  ClientWidth = 267
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
    267
    436)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 0
    Width = 265
    Height = 118
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 10
      Width = 35
      Height = 13
      Caption = #1044#1072#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 5
      Top = 64
      Width = 126
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1087#1088#1077#1076'. '#1074#1099#1076#1072#1095#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 5
      Top = 90
      Width = 144
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1090#1077#1082#1091#1097#1077#1081' '#1074#1099#1076#1072#1095#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 5
      Top = 40
      Width = 41
      Height = 13
      Caption = #1050#1072#1089#1089#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sbCHP: TSpeedButton
      Left = 236
      Top = 59
      Width = 24
      Height = 24
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
      Visible = False
      OnClick = sbCHPClick
    end
    object Label12: TLabel
      Left = 149
      Top = 10
      Width = 15
      Height = 13
      Caption = #1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dtZ: TDateTimePicker
      Left = 49
      Top = 6
      Width = 95
      Height = 21
      BevelInner = bvNone
      Date = 39814.822322222220000000
      Time = 39814.822322222220000000
      TabOrder = 0
    end
    object dtStart: TDateTimePicker
      Left = 155
      Top = 61
      Width = 77
      Height = 21
      Date = 39814.823770428240000000
      Time = 39814.823770428240000000
      Kind = dtkTime
      TabOrder = 1
    end
    object dtEnd: TDateTimePicker
      Left = 155
      Top = 86
      Width = 106
      Height = 21
      Date = 39814.999988425930000000
      Time = 39814.999988425930000000
      Kind = dtkTime
      TabOrder = 2
    end
    object cbKassa: TComboBox
      Left = 49
      Top = 36
      Width = 71
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
    end
    object dtZ1: TDateTimePicker
      Left = 168
      Top = 6
      Width = 92
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      Date = 38786.618719976900000000
      Time = 38786.618719976900000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 1
    Top = 120
    Width = 265
    Height = 111
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 1
    object Label4: TLabel
      Left = 5
      Top = 10
      Width = 73
      Height = 13
      Caption = #1041#1077#1079' '#1089#1082#1080#1076#1082#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 5
      Top = 30
      Width = 48
      Height = 13
      Caption = #1057#1082#1080#1076#1082#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 5
      Top = 94
      Width = 40
      Height = 13
      Caption = #1042#1089#1077#1075#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbAll: TLabel
      Left = 125
      Top = 10
      Width = 135
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
    object lbSkd: TLabel
      Left = 130
      Top = 30
      Width = 130
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
    object lbItog: TLabel
      Left = 115
      Top = 94
      Width = 145
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 5
      Top = 88
      Width = 256
      Height = 2
    end
    object Label9: TLabel
      Left = 5
      Top = 50
      Width = 75
      Height = 13
      Caption = #1044#1086#1087'. '#1089#1082#1080#1076#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbSkd50: TLabel
      Left = 130
      Top = 50
      Width = 130
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label15: TLabel
      Left = 5
      Top = 70
      Width = 81
      Height = 13
      Caption = #1044#1086#1087'. '#1074#1086#1079#1074#1088#1072#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbSkd50B: TLabel
      Left = 130
      Top = 70
      Width = 130
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
  end
  object Panel3: TPanel
    Left = 1
    Top = 235
    Width = 265
    Height = 170
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 2
    object Label7: TLabel
      Left = 5
      Top = 10
      Width = 64
      Height = 13
      Caption = #1058#1077#1088#1084#1080#1085#1072#1083':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 5
      Top = 70
      Width = 159
      Height = 13
      Caption = #1042#1086#1079#1074#1088#1072#1090#1099' '#1086#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1077#1081':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbTerm: TLabel
      Left = 125
      Top = 10
      Width = 135
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbVozPok: TLabel
      Left = 170
      Top = 50
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 5
      Top = 90
      Width = 112
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1095#1077#1082#1086#1074':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbKolCh: TLabel
      Left = 170
      Top = 90
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbPrep: TLabel
      Left = 170
      Top = 50
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 5
      Top = 50
      Width = 110
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1087#1088#1077#1076#1086#1087#1083#1072#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 5
      Top = 110
      Width = 160
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbKolNaim: TLabel
      Left = 195
      Top = 110
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 5
      Top = 130
      Width = 152
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1089#1090#1088#1077#1090#1095' '#1082#1072#1088#1090#1072#1084':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbSumStretch: TLabel
      Left = 160
      Top = 130
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 5
      Top = 30
      Width = 77
      Height = 13
      Caption = #1041#1077#1079#1075#1086#1090'i'#1074#1082#1072'.1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbBezgot1: TLabel
      Left = 125
      Top = 30
      Width = 135
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 5
      Top = 150
      Width = 114
      Height = 13
      Caption = #1055#1086#1087#1086#1083#1085#1077#1085#1080#1077' '#1089#1095#1077#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbAmount: TLabel
      Left = 160
      Top = 150
      Width = 100
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel4: TPanel
    Left = 1
    Top = 407
    Width = 266
    Height = 28
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 3
      Top = 2
      Width = 65
      Height = 25
      Caption = #1056#1072#1089#1095#1077#1090
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 68
      Top = 2
      Width = 121
      Height = 25
      Caption = #1056#1072#1089#1095#1077#1090' '#1079#1072' '#1087#1077#1088#1080#1086#1076
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 189
      Top = 2
      Width = 74
      Height = 25
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 2
      OnClick = BitBtn3Click
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
  end
end
