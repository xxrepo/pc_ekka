object CheckBaseF: TCheckBaseF
  Left = 358
  Top = 380
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CheckBaseF'
  ClientHeight = 203
  ClientWidth = 453
  Color = clBtnFace
  Constraints.MinWidth = 461
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    453
    203)
  PixelsPerInch = 96
  TextHeight = 13
  object pn1: TPanel
    Left = 1
    Top = 1
    Width = 451
    Height = 35
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      451
      35)
    object Label1: TLabel
      Left = 3
      Top = 11
      Width = 9
      Height = 13
      Caption = #1057
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 107
      Top = 11
      Width = 15
      Height = 13
      Caption = #1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 218
      Top = 11
      Width = 33
      Height = 13
      Caption = #1052#1077#1089#1103#1094
    end
    object dtStart: TDateTimePicker
      Left = 16
      Top = 7
      Width = 86
      Height = 21
      Date = 38786.000000000000000000
      Time = 38786.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dtEnd: TDateTimePicker
      Left = 127
      Top = 7
      Width = 86
      Height = 21
      Date = 38786.999988425930000000
      Time = 38786.999988425930000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object ComboBox2: TComboBox
      Left = 259
      Top = 7
      Width = 100
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
      TabOrder = 2
      OnChange = ComboBox2Change
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
    object BitBtn1: TBitBtn
      Left = 364
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1056#1072#1089#1095#1077#1090
      TabOrder = 3
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
  end
  object pn2: TPanel
    Left = 1
    Top = 38
    Width = 451
    Height = 134
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 161
    Top = 176
    Width = 131
    Height = 25
    Anchors = [akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 2
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
end
