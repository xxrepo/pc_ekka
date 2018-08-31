object RepIncomF: TRepIncomF
  Left = 1203
  Top = 192
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'RepIncomF'
  ClientHeight = 470
  ClientWidth = 451
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
    451
    470)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 1
    Width = 240
    Height = 322
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 33
      Width = 92
      Height = 13
      Caption = #1044#1072#1090#1072' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103':'
    end
    object Label2: TLabel
      Left = 10
      Top = 5
      Width = 222
      Height = 13
      Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1080#1085#1082#1072#1089#1089#1072#1094#1080#1086#1085#1085#1099#1093' '#1073#1083#1072#1085#1082#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 10
      Top = 65
      Width = 71
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1089#1091#1084#1082#1080':'
    end
    object Label4: TLabel
      Left = 10
      Top = 245
      Width = 74
      Height = 13
      Caption = #1044#1077#1073#1077#1090' '#1089#1095#1077#1090' '#8470':'
    end
    object Label5: TLabel
      Left = 10
      Top = 275
      Width = 78
      Height = 13
      Caption = #1050#1088#1077#1076#1080#1090' '#1089#1095#1077#1090' '#8470':'
    end
    object Label6: TLabel
      Left = 10
      Top = 215
      Width = 88
      Height = 13
      Caption = #1041#1072#1085#1082' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103':'
    end
    object Label20: TLabel
      Left = 10
      Top = 125
      Width = 42
      Height = 13
      Caption = #1054#1090' '#1082#1086#1075#1086':'
    end
    object Label21: TLabel
      Left = 10
      Top = 95
      Width = 90
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1087#1083#1086#1084#1073#1080#1088#1072':'
    end
    object Label22: TLabel
      Left = 10
      Top = 155
      Width = 62
      Height = 13
      Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100':'
    end
    object dtAct: TDateTimePicker
      Left = 105
      Top = 30
      Width = 126
      Height = 21
      Date = 39979.463011238430000000
      Time = 39979.463011238430000000
      TabOrder = 0
    end
    object cbBeg: TComboBox
      Left = 85
      Top = 61
      Width = 146
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
    object edDeb: TEdit
      Left = 95
      Top = 241
      Width = 136
      Height = 21
      Color = clWhite
      TabOrder = 2
    end
    object edKr: TEdit
      Left = 95
      Top = 271
      Width = 136
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 3
    end
    object edPlomb: TEdit
      Left = 105
      Top = 91
      Width = 126
      Height = 21
      TabOrder = 4
    end
    object edS: TEdit
      Left = 60
      Top = 121
      Width = 171
      Height = 21
      TabOrder = 5
    end
    object edD: TEdit
      Left = 76
      Top = 151
      Width = 155
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 6
    end
    object edMFO: TEdit
      Left = 10
      Top = 181
      Width = 221
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 7
      Text = #1052#1060#1054': 351931'
    end
    object edBank: TComboBox
      Left = 105
      Top = 212
      Width = 126
      Height = 21
      Style = csDropDownList
      DropDownCount = 20
      ItemHeight = 13
      TabOrder = 8
      OnChange = edBankChange
      Items.Strings = (
        #1040#1058' "'#1041#1040#1053#1050' '#1047#1054#1051#1054#1058'I '#1042#1054#1056#1054#1058#1040'"'
        #1055#1088#1080#1074#1072#1090' '#1073#1072#1085#1082
        #1055#1040#1058' '#1042#1058#1041' '#1041#1072#1085#1082
        #1042#1040#1058' "'#1054#1097#1072#1076#1073#1072#1085#1082'"'
        #1055#1091#1040#1058' "'#1050#1041' "'#1040#1082#1086#1088#1076#1073#1072#1085#1082'"'
        #1055#1040#1058' "'#1041#1040#1053#1050' '#1050#1056#1045#1044#1048#1058' '#1044#1053'I'#1055#1056#1054'"'
        #1042#1040#1058' "'#1059#1082#1088#1077#1082#1089'i'#1084#1073#1072#1085#1082'"'
        #1040#1058' "'#1059#1082#1088#1089#1080#1073#1073#1072#1085#1082'"'
        #1041#1072#1085#1082' "'#1042#1086#1089#1090#1086#1082'"'
        #1055#1040#1058' "'#1055#1091#1084#1073'"'
        #1055#1040#1058' '#1059#1082#1088#1089#1086#1094#1073#1072#1085#1082)
    end
  end
  object Panel2: TPanel
    Left = 244
    Top = 1
    Width = 205
    Height = 322
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      205
      322)
    object Label8: TLabel
      Left = 10
      Top = 5
      Width = 181
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1085#1086#1084#1080#1085#1072#1083#1072#1084' '#1073#1072#1085#1082#1085#1086#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 25
      Top = 52
      Width = 51
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 25
      Top = 75
      Width = 51
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 25
      Top = 98
      Width = 51
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 25
      Top = 121
      Width = 51
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '10'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 25
      Top = 144
      Width = 51
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '20'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 25
      Top = 236
      Width = 51
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '500'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 25
      Top = 213
      Width = 51
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '200'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 25
      Top = 190
      Width = 51
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '100'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 25
      Top = 167
      Width = 51
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '50'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 25
      Top = 30
      Width = 54
      Height = 13
      Alignment = taCenter
      Caption = #1053#1086#1084#1080#1085#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 110
      Top = 30
      Width = 41
      Height = 13
      Alignment = taCenter
      Caption = #1050#1086#1083'-'#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 10
      Top = 295
      Width = 44
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1057#1091#1084#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 10
      Top = 265
      Width = 40
      Height = 13
      Caption = #1050#1086#1087#1077#1077#1082':'
    end
    object ed1: TEdit
      Tag = 1
      Left = 100
      Top = 50
      Width = 61
      Height = 21
      TabOrder = 0
      OnChange = ed1Change
      OnKeyPress = ed1KeyPress
    end
    object ed2: TEdit
      Tag = 2
      Left = 100
      Top = 73
      Width = 61
      Height = 21
      TabOrder = 1
      OnChange = ed1Change
      OnKeyPress = ed1KeyPress
    end
    object ed4: TEdit
      Tag = 10
      Left = 100
      Top = 119
      Width = 61
      Height = 21
      TabOrder = 3
      OnChange = ed1Change
      OnKeyPress = ed1KeyPress
    end
    object ed3: TEdit
      Tag = 5
      Left = 100
      Top = 96
      Width = 61
      Height = 21
      TabOrder = 2
      OnChange = ed1Change
      OnKeyPress = ed1KeyPress
    end
    object ed5: TEdit
      Tag = 20
      Left = 100
      Top = 142
      Width = 61
      Height = 21
      TabOrder = 4
      OnChange = ed1Change
      OnKeyPress = ed1KeyPress
    end
    object ed6: TEdit
      Tag = 50
      Left = 100
      Top = 165
      Width = 61
      Height = 21
      TabOrder = 5
      OnChange = ed1Change
      OnKeyPress = ed1KeyPress
    end
    object ed7: TEdit
      Tag = 100
      Left = 100
      Top = 188
      Width = 61
      Height = 21
      TabOrder = 6
      OnChange = ed1Change
      OnKeyPress = ed1KeyPress
    end
    object ed8: TEdit
      Tag = 200
      Left = 100
      Top = 211
      Width = 61
      Height = 21
      TabOrder = 7
      OnChange = ed1Change
      OnKeyPress = ed1KeyPress
    end
    object ed9: TEdit
      Tag = 500
      Left = 100
      Top = 234
      Width = 61
      Height = 21
      TabOrder = 8
      OnChange = ed1Change
      OnKeyPress = ed1KeyPress
    end
    object pnSumm: TPanel
      Left = 60
      Top = 292
      Width = 136
      Height = 21
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Caption = '0.00 '#1075#1088#1085'. '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object edKop: TEdit
      Left = 60
      Top = 261
      Width = 36
      Height = 21
      TabOrder = 10
      OnChange = ed1Change
      OnKeyPress = edKopKeyPress
    end
  end
  object Panel3: TPanel
    Left = 1
    Top = 325
    Width = 448
    Height = 144
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      448
      144)
    object Label23: TLabel
      Left = 97
      Top = 118
      Width = 254
      Height = 16
      Caption = #1054#1078#1080#1076#1072#1085#1080#1077'  '#1086#1090#1074#1077#1090#1072' '#1086#1090' '#1090#1077#1088#1084#1080#1085#1072#1083#1072'...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 192
      Top = 3
      Width = 154
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100' '#1087#1091#1089#1090#1099#1093' '#1073#1083#1072#1085#1082#1086#1074'...'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E000000000000000000000000FF0000FF
        5F5F5F4040404040404040404040404040404040404040404040404040404040
        405F5F5F0000FF0000FF0000FF0000FF70707051515151515151515151515151
        51515151515151515151515151515151517070700000FF0000FF0000FFC0B0B0
        DFCFC0D0C0C0D0C0C0CFBFBFCFBFBFCFBFBFCFBFBFCFBFBFCFBFB0CFBFB0AF9F
        905F5F5F0000FF0000FF0000FFC2C2C2DDDDDDD2D2D2D2D2D2D1D1D1D1D1D1D1
        D1D1D1D1D1D1D1D1CDCDCDCDCDCDADADAD7070700000FF0000FF0000FFC0B0B0
        F0EFE0F0EFE0F0E0D0F0E0D0F0E0D0F0E0D0F0E0D0F0E0D0EFE0CFEFDFCFCFBF
        B05F5F5F0000FF0000FF0000FFC2C2C2FBFBFBFBFBFBEDEDEDEDEDEDEDEDEDED
        EDEDEDEDEDEDEDEDEDEDEDECECECCDCDCD7070700000FF0000FF0000FFC0B0B0
        F0F0EF000000000000FFF0EFF0E0D0F0E0D0F0E0D0F0E0D0000000000000CFBF
        B05F5F5F0000FF0000FF0000FFC2C2C2FFFFFF111111111111FFFFFFEDEDEDED
        EDEDEDEDEDEDEDED111111111111CDCDCD7070700000FF0000FF0000FFC0B0B0
        FFF0EFFFF0EFFFF0EFFFF0EFFFF0EFF0E0D0F0E0D0F0E0D0F0E0D0F0E0D0CFBF
        BF5F5F5F0000FF0000FF0000FFC2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED
        EDEDEDEDEDEDEDEDEDEDEDEDEDEDD1D1D17070700000FF0000FF0000FFC0B0B0
        FFF0EF000000000000000000000000000000000000000000000000000000CFBF
        BF5F5F5F0000FF0000FF0000FFC2C2C2FFFFFF11111111111111111111111111
        1111111111111111111111111111D1D1D17070700000FF0000FF0000FFC0B0B0
        FFF0F0FFF0F0FFF0EFFFF0EFFFF0EFFFF0EFF0EFDFF0EFDFF0EFDFF0E0D0D0C0
        BF5F5F5F0000FF0000FF0000FFC2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFBFBFBFBFBFBFBFBFBEDEDEDD2D2D27070700000FF0000FF0000FFC0B0B0
        FFFFF0000000000000000000000000000000000000000000000000000000D0C0
        BF5F5F5F0000FF0000FF0000FFC2C2C2FFFFFF11111111111111111111111111
        1111111111111111111111111111D2D2D27070700000FF0000FF0000FFC0B0B0
        FFFFF0FFFFF0FFF0F0FFF0EFFFF0EFFFF0EFFFF0EFF0EFDFF0EFE0F0EFDFD0C0
        C05F5F5F0000FF0000FF0000FFC2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFBFBFBFBFBFBFBFBFBD2D2D27070700000FF0000FF0000FFC0B0B0
        FFFFFFFFFFFF000000000000000000000000000000000000000000000000D0C0
        C05F5F5F0000FF0000FF0000FFC2C2C2FFFFFFFFFFFF11111111111111111111
        1111111111111111111111111111D2D2D27070700000FF0000FF0000FFC0B0B0
        FFFFFFFFFFFFFFFFFFFFFFF0FFF0F0FFF0F0FFF0EFFFF0EFF0EFDFF0EFE0D0C0
        C05F5F5F0000FF0000FF0000FFC2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFBFBFBFBFBFBD2D2D27070700000FF0000FF0000FFC0B0B0
        FFFFFF000000000000FFFFFFFFFFF0FFF0F0FFF0EFFFF0EF000000000000D0C0
        BF5F5F5F0000FF0000FF0000FFC2C2C2FFFFFF111111111111FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF111111111111D2D2D27070700000FF0000FF0000FFC0B0B0
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0EFF0EFEFF0EFDFD0BF
        B07F7F7F0000FF0000FF0000FFC2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFBFBFBCDCDCD9090900000FF0000FF0000FFC0B0B0
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFF0EFDFB080DFA040B08F
        50CFAF8F0000FF0000FF0000FFC2C2C2FFFFFFFFFFFFFFFFFFFFFFFF11111111
        1111111111FFFFFFB7B7B79B9B9B909090B9B9B90000FF0000FF0000FFC0B0B0
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E0CFBFCFAF8FCFAF
        8F0000FF0000FF0000FF0000FFC2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDDDDDDB9B9B9B9B9B90000FF0000FF0000FF0000FFDFCFC0
        DFCFC0DFCFC0DFCFC0DFCFC0DFCFC0DFCFC0DFCFC0DFCFC0DFCFC0CFAF8F0000
        FF0000FF0000FF0000FF0000FFDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDB9B9B90000FF0000FF0000FF0000FF}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 355
      Top = 3
      Width = 90
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
    object BitBtn4: TBitBtn
      Left = 3
      Top = 3
      Width = 189
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100' '#1079#1072#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1073#1083#1072#1085#1082#1086#1074'...'
      TabOrder = 2
      OnClick = BitBtn4Click
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E000000000000000000000000FF0000FF
        5F5F5F4040404040404040404040404040404040404040404040404040404040
        405F5F5F0000FF0000FF0000FF0000FF70707051515151515151515151515151
        51515151515151515151515151515151517070700000FF0000FF0000FFC0B0B0
        DFCFC0D0C0C0D0C0C0CFBFBFCFBFBFCFBFBFCFBFBFCFBFBFCFBFB0CFBFB0AF9F
        905F5F5F0000FF0000FF0000FFC2C2C2DDDDDDD2D2D2D2D2D2D1D1D1D1D1D1D1
        D1D1D1D1D1D1D1D1CDCDCDCDCDCDADADAD7070700000FF0000FF0000FFC0B0B0
        F0EFE0F0EFE0F0E0D0F0E0D0F0E0D0F0E0D0F0E0D0F0E0D0EFE0CFEFDFCFCFBF
        B05F5F5F0000FF0000FF0000FFC2C2C2FBFBFBFBFBFBEDEDEDEDEDEDEDEDEDED
        EDEDEDEDEDEDEDEDEDEDEDECECECCDCDCD7070700000FF0000FF0000FFC0B0B0
        F0F0EF000000000000FFF0EFF0E0D0F0E0D0F0E0D0F0E0D0000000000000CFBF
        B05F5F5F0000FF0000FF0000FFC2C2C2FFFFFF111111111111FFFFFFEDEDEDED
        EDEDEDEDEDEDEDED111111111111CDCDCD7070700000FF0000FF0000FFC0B0B0
        FFF0EFFFF0EFFFF0EFFFF0EFFFF0EFF0E0D0F0E0D0F0E0D0F0E0D0F0E0D0CFBF
        BF5F5F5F0000FF0000FF0000FFC2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED
        EDEDEDEDEDEDEDEDEDEDEDEDEDEDD1D1D17070700000FF0000FF0000FFC0B0B0
        FFF0EF000000000000000000000000000000000000000000000000000000CFBF
        BF5F5F5F0000FF0000FF0000FFC2C2C2FFFFFF11111111111111111111111111
        1111111111111111111111111111D1D1D17070700000FF0000FF0000FFC0B0B0
        FFF0F0FFF0F0FFF0EFFFF0EFFFF0EFFFF0EFF0EFDFF0EFDFF0EFDFF0E0D0D0C0
        BF5F5F5F0000FF0000FF0000FFC2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFBFBFBFBFBFBFBFBFBEDEDEDD2D2D27070700000FF0000FF0000FFC0B0B0
        FFFFF0000000000000000000000000000000000000000000000000000000D0C0
        BF5F5F5F0000FF0000FF0000FFC2C2C2FFFFFF11111111111111111111111111
        1111111111111111111111111111D2D2D27070700000FF0000FF0000FFC0B0B0
        FFFFF0FFFFF0FFF0F0FFF0EFFFF0EFFFF0EFFFF0EFF0EFDFF0EFE0F0EFDFD0C0
        C05F5F5F0000FF0000FF0000FFC2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFBFBFBFBFBFBFBFBFBD2D2D27070700000FF0000FF0000FFC0B0B0
        FFFFFFFFFFFF000000000000000000000000000000000000000000000000D0C0
        C05F5F5F0000FF0000FF0000FFC2C2C2FFFFFFFFFFFF11111111111111111111
        1111111111111111111111111111D2D2D27070700000FF0000FF0000FFC0B0B0
        FFFFFFFFFFFFFFFFFFFFFFF0FFF0F0FFF0F0FFF0EFFFF0EFF0EFDFF0EFE0D0C0
        C05F5F5F0000FF0000FF0000FFC2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFBFBFBFBFBFBD2D2D27070700000FF0000FF0000FFC0B0B0
        FFFFFF000000000000FFFFFFFFFFF0FFF0F0FFF0EFFFF0EF000000000000D0C0
        BF5F5F5F0000FF0000FF0000FFC2C2C2FFFFFF111111111111FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF111111111111D2D2D27070700000FF0000FF0000FFC0B0B0
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0EFF0EFEFF0EFDFD0BF
        B07F7F7F0000FF0000FF0000FFC2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFBFBFBCDCDCD9090900000FF0000FF0000FFC0B0B0
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFF0EFDFB080DFA040B08F
        50CFAF8F0000FF0000FF0000FFC2C2C2FFFFFFFFFFFFFFFFFFFFFFFF11111111
        1111111111FFFFFFB7B7B79B9B9B909090B9B9B90000FF0000FF0000FFC0B0B0
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E0CFBFCFAF8FCFAF
        8F0000FF0000FF0000FF0000FFC2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDDDDDDB9B9B9B9B9B90000FF0000FF0000FF0000FFDFCFC0
        DFCFC0DFCFC0DFCFC0DFCFC0DFCFC0DFCFC0DFCFC0DFCFC0DFCFC0CFAF8F0000
        FF0000FF0000FF0000FF0000FFDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDB9B9B90000FF0000FF0000FF0000FF}
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Tag = 1
      Left = 3
      Top = 28
      Width = 173
      Height = 25
      Caption = #1048#1085#1082#1072#1089#1089#1072#1094#1080#1103' '#1095#1077#1088#1077#1079' '#1090#1077#1088#1084#1080#1085#1072#1083
      TabOrder = 3
      OnClick = BitBtn3Click
    end
    object BitBtn5: TBitBtn
      Tag = 1
      Left = 163
      Top = 75
      Width = 158
      Height = 25
      Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1080#1085#1082#1072#1089#1089#1072#1094#1080#1102
      TabOrder = 4
      OnClick = BitBtn3Click
    end
    object lbePhone: TLabeledEdit
      Left = 270
      Top = 32
      Width = 171
      Height = 21
      EditLabel.Width = 86
      EditLabel.Height = 13
      EditLabel.Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
      LabelPosition = lpLeft
      TabOrder = 5
    end
    object ledP: TLabeledEdit
      Left = 60
      Top = 90
      Width = 91
      Height = 21
      EditLabel.Width = 38
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1072#1088#1086#1083#1100
      LabelPosition = lpLeft
      TabOrder = 6
    end
    object ledID: TLabeledEdit
      Left = 60
      Top = 65
      Width = 91
      Height = 21
      EditLabel.Width = 11
      EditLabel.Height = 13
      EditLabel.Caption = 'ID'
      LabelPosition = lpLeft
      TabOrder = 7
    end
  end
end
