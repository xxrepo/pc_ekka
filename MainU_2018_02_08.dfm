object MainF: TMainF
  Left = 566
  Top = 141
  Width = 1028
  Height = 738
  Caption = 'MainF'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  OnShortCut = FormShortCut
  OnShow = FormShow
  DesignSize = (
    1020
    692)
  PixelsPerInch = 96
  TextHeight = 13
  object pnWrkEKKA: TPanel
    Left = 0
    Top = 60
    Width = 1020
    Height = 612
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 5
    Visible = False
    object pnLogEKKA: TPanel
      Left = 4
      Top = 4
      Width = 556
      Height = 311
      BevelOuter = bvLowered
      TabOrder = 0
      DesignSize = (
        556
        311)
      object lbState: TLabel
        Left = 5
        Top = 35
        Width = 133
        Height = 13
        Caption = #1054#1082#1085#1086' '#1089#1086#1089#1090#1086#1103#1085#1080#1103' EKKA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object sbOpenPort: TSpeedButton
        Left = 5
        Top = 5
        Width = 24
        Height = 24
        Hint = #1054#1090#1082#1088#1099#1090#1100' '#1087#1086#1088#1090
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
          000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
          BF00BFBFBF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00000000007F7F7F007F7F7F00BFBFBF007F7F7F00000000007F7F
          7F00BFBFBF007F7F7F007F7F7F0000000000FF00FF00FF00FF00FF00FF00FF00
          FF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F00000000007F7F
          7F00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000FF00FF00FF00FF00FF00
          FF00000000007F7F7F007F7F7F007F7F7F00BFBFBF00BFBFBF0000000000BFBF
          BF00BFBFBF007F7F7F007F7F7F007F7F7F0000000000FF00FF00FF00FF00FF00
          FF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000000000000000
          0000BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000FF00FF00FF00FF00FF00
          FF00000000007F7F7F007F7F7F007F7F7F007F7F7F0000000000000000000000
          00007F7F7F007F7F7F007F7F7F007F7F7F0000000000FF00FF0000FFFF00FF00
          FF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
          BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000FF00FF00FF00FF0000FF
          FF00FF00FF000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
          FF0000FFFF0000FFFF0000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00FF0000FFFF0000FF
          FF0000FFFF0000FFFF007F7F7F00000000007F7F7F0000FFFF0000FFFF00FF00
          FF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000FFFF0000FFFF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00
          FF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00FF00FF00FF0000FF
          FF00FF00FF0000FFFF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00
          FF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00FF0000FFFF00FF00
          FF00FF00FF0000FFFF007F7F7F007F7F7F00BFBFBF0000000000000000000000
          0000BFBFBF007F7F7F007F7F7F00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000FFFF00FF00FF0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
          BF00BFBFBF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000FFFF00FF00FF00FF00FF000000000000000000000000000000
          000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbOpenPortClick
      end
      object sbClosePort: TSpeedButton
        Left = 29
        Top = 5
        Width = 24
        Height = 24
        Hint = #1047#1072#1082#1088#1099#1090#1100' '#1087#1086#1088#1090
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
          000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBF
          BF00BFBFBF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00000000007F7F7F007F7F7F00BFBFBF007F7F7F00000000007F7F
          7F00BFBFBF007F7F7F007F7F7F0000000000FF00FF00FF00FF00FF00FF00FF00
          FF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF007F7F7F00000000007F7F
          7F00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000FF00FF00FF00FF00FF00
          FF00000000007F7F7F007F7F7F007F7F7F00BFBFBF00BFBFBF0000000000BFBF
          BF00BFBFBF007F7F7F007F7F7F007F7F7F0000000000FF00FF00FF00FF00FF00
          FF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000000000000000
          0000BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000FF00FF00FF00FF00FF00
          FF00000000007F7F7F007F7F7F007F7F7F007F7F7F0000000000000000000000
          00007F7F7F007F7F7F007F7F7F007F7F7F0000000000FF00FF00FF00FF00FF00
          FF0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
          BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00
          FF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00
          FF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00
          FF0000000000BFBFBF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF007F7F7F007F7F7F00BFBFBF0000000000000000000000
          0000BFBFBF007F7F7F007F7F7F00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
          BF00BFBFBF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
          000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbClosePortClick
      end
      object cbEKKA: TCheckBox
        Left = 405
        Top = 10
        Width = 142
        Height = 17
        Caption = #1053#1077' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1045#1050#1050#1040
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = cbEKKAClick
      end
      object meEKKA: TMemo
        Left = 5
        Top = 50
        Width = 546
        Height = 256
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = 16769704
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object pnInfoEKKA: TPanel
      Left = 562
      Top = 4
      Width = 446
      Height = 311
      BevelOuter = bvLowered
      TabOrder = 1
      DesignSize = (
        446
        311)
      object imEKKA: TImage
        Left = 280
        Top = 275
        Width = 30
        Height = 31
        Anchors = [akLeft, akBottom]
        AutoSize = True
        Picture.Data = {
          0A544A504547496D6167659A030000FFD8FFE000104A46494600010100000100
          010000FFDB0043000403030303020403030304040405060A06060505060C0809
          070A0E0C0F0E0E0C0D0D0F1116130F1015110D0D131A131517181919190F121B
          1D1B181D16181918FFDB0043010404040605060B06060B18100D101818181818
          1818181818181818181818181818181818181818181818181818181818181818
          18181818181818181818181818FFC2001108001F001E03012200021101031101
          FFC400190001010100030000000000000000000000060703000405FFC4001701
          0100030000000000000000000000000001000203FFDA000C0301000210031000
          0001A8733239D9978929A0A6C0E9E5A049A77108FF00FFC4001D100002030002
          030000000000000000000003040102050006101132FFDA0008010100010502F1
          1F79ACDCE3B12B4E37D8975E5C1EB8DAC0B5A40E39446EE682AEDA1C0FAC2241
          8DA2193263C86AF03C38895D612D5FFFC4001511010100000000000000000000
          000000000011FFDA0008010301013F01AA88FFC4001611010101000000000000
          00000000000000110010FFDA0008010201013F01237FFFC40024100002020103
          04020300000000000000000102000311123161042142511014243241FFDA0008
          010100063F02F803FB2F4B1F55955CC867B8B43294BD8E349D9792635E6DB5AC
          F174EE312D3D41FC973A9DBDCB3ECFE99CA37BE22974A8E9DBB6A8065CE36010
          F696694B0617C9710859E2A393336F504F0A21150C6779FFC400221000020202
          010305000000000000000000011100213151416171B11081A1C1D1FFDA000801
          0100013F21F44B21AD4C0AA9A22D8F899665A1080CA74694307A42E705DA746A
          8C04C21F6D43DE39A41179C9E08F1024CCB7094CF044E0342A26C0167E7D62F4
          6547AEF3F0819B47DC85EF90896E7FFFDA000C0301000200030000001013C866
          FFC400161101010100000000000000000000000000010011FFDA000801030101
          3F10411A6542BFFFC400161101010100000000000000000000000000010011FF
          DA0008010201013F1013202D94BFFFC4001F1001000202020203000000000000
          0000000111210031416110815171D1FFDA0008010100013F10F09A4E93494368
          612549501053EDBC9F22FA23DE53A3855308A1A910F710E4A6A192FA0442AEC2
          78AC2EBDE468594A405BDF3BC43E36085B4521A96D1128E266F6473B62C22751
          18A18B198680887463A93092546A24E5E7298D693295534164F98964420E087D
          BF30368C4691ACFFD9}
        Transparent = True
      end
      object bbReadEKKA: TBitBtn
        Left = 8
        Top = 280
        Width = 131
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = #1063#1080#1090#1072#1090#1100' '#1045#1050#1050#1040
        TabOrder = 0
        OnClick = bbReadEKKAClick
      end
      object lbFactoryNum: TStaticText
        Left = 4
        Top = 10
        Width = 71
        Height = 17
        Alignment = taRightJustify
        Caption = #1047#1072#1074'.'#8470' '#1069#1050#1050#1040':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object lbRegNom: TStaticText
        Left = 4
        Top = 32
        Width = 60
        Height = 17
        Alignment = taRightJustify
        Caption = #1056#1077#1075'.'#1085#1086#1084#1077#1088':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object lbFirma: TStaticText
        Left = 4
        Top = 54
        Width = 74
        Height = 17
        Alignment = taRightJustify
        Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object lbKassirIsReg: TStaticText
        Left = 4
        Top = 77
        Width = 85
        Height = 17
        Alignment = taRightJustify
        Caption = #1050#1072#1089#1089#1080#1088' '#1079#1072#1088#1077#1075'-'#1085':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object lbKeyPos: TStaticText
        Left = 4
        Top = 99
        Width = 85
        Height = 17
        Alignment = taRightJustify
        Caption = #1055#1086#1079#1080#1094#1080#1103' '#1082#1083#1102#1095#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object lbIsObnulen: TStaticText
        Left = 4
        Top = 121
        Width = 88
        Height = 17
        Alignment = taRightJustify
        Caption = #1050#1072#1089#1089#1072' '#1086#1073#1085#1091#1083#1077#1085#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object lbNomerLastZ: TStaticText
        Left = 4
        Top = 143
        Width = 77
        Height = 17
        Alignment = taRightJustify
        Caption = #8470' '#1087#1086#1089#1083'.Z-'#1086#1090#1095'.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object lbNomberLastChek: TStaticText
        Left = 4
        Top = 166
        Width = 74
        Height = 17
        Alignment = taRightJustify
        Caption = #8470' '#1087#1086#1089#1083'. '#1095#1077#1082#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object lbFiskDate: TStaticText
        Left = 4
        Top = 188
        Width = 33
        Height = 17
        Alignment = taRightJustify
        Caption = #1044#1072#1090#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object lbFiskTime: TStaticText
        Left = 4
        Top = 210
        Width = 40
        Height = 17
        Alignment = taRightJustify
        Caption = #1042#1088#1077#1084#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object stFiskTime: TStaticText
        Left = 95
        Top = 209
        Width = 217
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 11
      end
      object stFiskDate: TStaticText
        Left = 95
        Top = 187
        Width = 217
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 12
      end
      object stNomberLastChek: TStaticText
        Left = 95
        Top = 165
        Width = 217
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 13
      end
      object stNomerLastZ: TStaticText
        Left = 95
        Top = 142
        Width = 217
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 14
      end
      object stIsObnulen: TStaticText
        Left = 95
        Top = 120
        Width = 217
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 15
      end
      object stKeyPos: TStaticText
        Left = 95
        Top = 98
        Width = 217
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 16
      end
      object stKassirIsReg: TStaticText
        Left = 95
        Top = 76
        Width = 217
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 17
      end
      object stFirma: TStaticText
        Left = 95
        Top = 53
        Width = 217
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 18
      end
      object stRegNom: TStaticText
        Left = 95
        Top = 31
        Width = 217
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 19
      end
      object stFactoryNum: TStaticText
        Left = 95
        Top = 9
        Width = 217
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 20
      end
      object lbVersion: TStaticText
        Left = 4
        Top = 232
        Width = 63
        Height = 17
        Alignment = taRightJustify
        Caption = #1042#1077#1088#1089#1080#1103' '#1055#1054':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 21
      end
      object lbMoney: TStaticText
        Left = 206
        Top = 232
        Width = 45
        Height = 17
        Alignment = taRightJustify
        Caption = #1042#1072#1083#1102#1090#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 22
      end
      object stMoney: TStaticText
        Left = 261
        Top = 231
        Width = 51
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 23
      end
      object stDtVersion: TStaticText
        Left = 150
        Top = 253
        Width = 162
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 24
      end
      object stVersion: TStaticText
        Left = 95
        Top = 231
        Width = 101
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 25
      end
      object lbDtVersion: TStaticText
        Left = 4
        Top = 254
        Width = 142
        Height = 17
        Alignment = taRightJustify
        Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1074#1077#1088#1089#1080#1080' '#1055#1054':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 26
      end
      object BitBtn3: TBitBtn
        Left = 330
        Top = 20
        Width = 75
        Height = 25
        Caption = '7 % '#1041
        TabOrder = 27
        OnClick = BitBtn3Click
      end
      object BitBtn4: TBitBtn
        Left = 330
        Top = 140
        Width = 75
        Height = 25
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' Z'
        TabOrder = 28
        OnClick = BitBtn4Click
      end
      object BitBtn7: TBitBtn
        Tag = 1
        Left = 330
        Top = 55
        Width = 75
        Height = 25
        Caption = '20 % '#1040
        TabOrder = 29
        OnClick = BitBtn3Click
      end
      object BitBtn2: TBitBtn
        Left = 320
        Top = 180
        Width = 121
        Height = 25
        Caption = #1055#1077#1088#1089#1086#1085#1072#1083#1080#1079#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 30
        OnClick = BitBtn2Click
      end
      object BitBtn9: TBitBtn
        Tag = 2
        Left = 330
        Top = 90
        Width = 75
        Height = 25
        Caption = '0 % '#1042
        TabOrder = 31
        OnClick = BitBtn3Click
      end
    end
    object pnWrEKKA: TPanel
      Left = 4
      Top = 318
      Width = 445
      Height = 231
      BevelOuter = bvLowered
      TabOrder = 2
      DesignSize = (
        445
        231)
      object lbLogo: TLabel
        Left = 5
        Top = 10
        Width = 54
        Height = 13
        Caption = #1051#1086#1075#1086#1090#1080#1087':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object sbPath: TSpeedButton
        Left = 281
        Top = 5
        Width = 24
        Height = 23
        Hint = #1054#1090#1082#1088#1099#1090#1100' '#1089' '#1076#1080#1089#1082#1072
        Anchors = [akTop, akRight]
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000D40E0000D40E00000000000000000000BEBEBEBABABA
          BABABABABABABABABABABABABABABABABABABABABABABABABBBBBBC0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0B2B2B299999991919191919191919191919191919191
          9191919191919191A4A4A4B8B8B8BFBFBFC0C0C0C0C0C0C0C0C0A4A4A4595959
          386262277C7C277979277575276969276666275F5F275F5F2F6161868686B6B6
          B6C0C0C0C0C0C0C0C0C0A4A4A462626284979716B1B100C9C900BCBC00B3B300
          9C9C009393008383017F7F2A6969868989B6B6B6BFBFBFC0C0C0A4A4A4686868
          F1F1F188989811BEBE00E4E400CACA00BBBB00AFAF00A2A2008E8E0086862A69
          69868686B8B8B8C0C0C0A4A4A4686868FFFFFFF0F0F08B9B9B15D1D100FAFA00
          DFDF00CBCB00BDBD00B3B3009E9E019191266E6E868989B5B5B5A4A4A4686868
          FFFFFFFFFFFFF1F1F181999910D2D200FFFF00F3F300D4D400CACA00BBBB00AE
          AE00A0A02D7373868686A4A4A4686868FFFFFFFFFFFFFFFFFFF1F1F19298986A
          74746A74746A7272656E6E515858606868606767656A6A6A6A6AA4A4A4686868
          FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2EAEAEAEAEAEAEAEAEAA768687D27248F37
          35997172B9B9B9BBBBBBA4A4A4666666F0F0F0FFFFFFFFFFFFFFFFFFFFFFFFE7
          E7E7B5B5B5B5B5B5B29FA1B64C09E1671CB55A6FBDBDBDC0C0C0B5B5B58A8A8A
          919191ECECECF7F7F7F7F7F7EEEEEE8A8486A39592A59E9BB95552E49A2ECD3E
          2BB75C71BDBDBDC0C0C0C0C0C0B8B8B88E8E8E8383838585858585857E7E7EBC
          9391D0534AEB9C66FFD35AEDA066C09D9EC3949FC0C0C0C0C0C0C0C0C0BFBFBF
          BDBDBDA8A8A8A2A2A2A2A2A2B2B2B2C0BBB7D6C07CEFD36BE9B476BFB7B1BFBF
          BFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0BBBBBBB9B9B9BABABAC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbPathClick
      end
      object edLogoEKKA: TEdit
        Left = 65
        Top = 6
        Width = 216
        Height = 21
        TabOrder = 0
      end
      object pnLogoEKKA: TPanel
        Left = 5
        Top = 32
        Width = 435
        Height = 195
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 1
        object imLogoEKKA: TImage
          Left = -1
          Top = 0
          Width = 432
          Height = 192
          AutoSize = True
          Center = True
        end
      end
      object bbLoadLogo: TBitBtn
        Left = 309
        Top = 4
        Width = 131
        Height = 25
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1083#1086#1075#1086#1090#1080#1087
        TabOrder = 2
        OnClick = bbLoadLogoClick
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E0000000000000000000000FF0000FF00
          00FF0000FF0000FF0000FF00BDACAB946666000000B3A7A600FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00E3E3E3A1
          A1A1363636DEDEDE00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF00D0D3D500FF00C06050F09090C0606000000000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FFFFFF00FF009B9B9BD0
          D0D0A0A0A036363600FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          CCCDCB80584080584000FF00E07070FFC0C0F0909095676700FF008068508058
          4080584000FF0000FF0000FF0000FF00FFFFFF8B8B8B8B8B8B00FF00B2B2B2FC
          FCFCD0D0D0A2A2A200FF009999998B8B8B8B8B8B00FF0000FF0000FF0000FF00
          856758A79386D4D7D700FF00CCB5B4E07070C06050C2B0AF00FF008068508060
          50AC9F9800FF0000FF0000FF0000FF009B9B9BC7C7C7FFFFFF00FF00EDEDEDB2
          B2B29B9B9BE7E7E700FF00999999949494D4D4D400FF0000FF0000FF0000FF00
          806050D1D0CF00FF0000FF0000FF0000FF0000FF0000FF0000FF00806850C5C1
          BE80605000FF0000FF0000FF0000FF00949494FFFFFF00FF0000FF0000FF0000
          FF0000FF0000FF0000FF00999999F6F6F694949400FF0000FF0000FF00806850
          80605085604900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0080605000FF0000FF0000FF0099999994949493939300FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0094949400FF0000FF0000FF00D1CFCE
          806850D4D5D400FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0080685000FF0000FF0000FF00FFFFFF999999FFFFFF00FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0099999900FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00B5BFC3
          44515F000800A6A9AA00FF0000FF0000FF0000FF0000FF0000FF00ABB0D2444B
          861010108993AC00FF0000FF00F5F5F58989893A3A3ADEDEDE00FF0000FF0000
          FF0000FF0000FF0000FF00EFEFEF919191464646CFCFCF00FF0000FF008099A6
          60D0E02090B0000000D6DADC00FF0000FF0000FF0000FF0000FF005C69BE5068
          E04050A02B2B3B00FF0000FF00D0D0D0FFFFFFC3C3C3363636FFFFFF00FF0000
          FF0000FF0000FF0000FF00B7B7B7BFBFBF9C9C9C65656500FF0000FF008DA0B2
          C0FFFF60D0E038464600FF0000FF0000FF0000FF0000FF0000FF005C6ABE7098
          F05068E044528600FF0000FF00D9D9D9FFFFFFFFFFFF7A7A7A00FF0000FF0000
          FF0000FF0000FF0000FF00B7B7B7E4E4E4BFBFBF96969600FF0000FF00C2CBD4
          8DA0B3819AA6B8C1C500FF0000FF0000FF0000FF0000FF0000FF00AEB5D95D6A
          BF5D6ABFAEB2D400FF0000FF00FFFFFFD9D9D9D0D0D0F7F7F700FF0000FF0000
          FF0000FF0000FF0000FF00F5F5F5B8B8B8B8B8B8F1F1F100FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0080686080605080584000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF009E9E9E9494948B8B8B00FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF00806850CFCBC700FF00CFCDCB80686080605000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00999999FFFFFF00
          FF00FFFFFF9E9E9E94949400FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF00D0CCC7806860806850807060D4D0CF80706000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00FFFFFF9E9E9E99
          9999A2A2A2FFFFFFA2A2A200FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
        NumGlyphs = 2
      end
    end
    object pnEditEKKA: TPanel
      Left = 451
      Top = 318
      Width = 556
      Height = 213
      BevelOuter = bvLowered
      TabOrder = 3
      DesignSize = (
        556
        213)
      object lbNumStr: TLabel
        Left = 5
        Top = 7
        Width = 66
        Height = 13
        Caption = #1050#1086#1083'-'#1074#1086' '#1089#1090#1088#1086#1082
      end
      object lbNumDay: TLabel
        Left = 5
        Top = 32
        Width = 61
        Height = 13
        Caption = #1050#1086#1083'-'#1074#1086' '#1076#1085#1077#1081
      end
      object bvServLim: TBevel
        Left = 141
        Top = 3
        Width = 2
        Height = 77
      end
      object bbServLim: TBitBtn
        Left = 4
        Top = 54
        Width = 133
        Height = 25
        Caption = #1057#1073#1088#1086#1089' '#1089#1077#1088#1074#1080#1089'-'#1083#1080#1084#1080#1090#1072
        TabOrder = 0
        OnClick = bbServLimClick
      end
      object edKolStr: TEdit
        Left = 77
        Top = 4
        Width = 59
        Height = 21
        TabOrder = 1
        Text = '4500000'
        OnKeyPress = edKolStrKeyPress
      end
      object edKolDay: TEdit
        Left = 77
        Top = 29
        Width = 59
        Height = 21
        TabOrder = 2
        Text = '548'
        OnKeyPress = edKolStrKeyPress
      end
      object bbTermEKKA: TBitBtn
        Left = 145
        Top = 4
        Width = 149
        Height = 25
        Caption = #1054#1082#1085#1086' '#1090#1077#1088#1084#1080#1085#1072#1083#1072' '#1045#1050#1050#1040
        TabOrder = 3
        OnClick = bbTermEKKAClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000130B0000130B00001000000010000000000000005229
          1000523121005A39210073392100C5731E00EF8C1800F78C1800615246007560
          4100A06C4700E49A5000A9A09F00CECED600CED6D600FFFFFF00DDDDDDDDDDDD
          DDDDCAC9CAC9CAC9CACC93333333333333498000F0000000F02980000F00000F
          0029800000F0008F00198000000F00F80029800000F008F0002980000F000F80
          00298000F0000F0000398000000000000019A9999999999999996666666666BB
          BCA9AA5A5A55A5A5A5ACDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      end
      object bbForceCloseCash: TBitBtn
        Left = 4
        Top = 83
        Width = 186
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1095#1077#1082' '#1087#1086' '#1085#1072#1083#1080#1095#1085#1086#1081' '#1086#1087#1083#1072#1090#1077
        TabOrder = 4
        OnClick = bbForceCloseCashClick
      end
      object bbForceCloseChek: TBitBtn
        Left = 4
        Top = 108
        Width = 186
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1095#1077#1082' '#1087#1086' '#1090#1077#1088#1084#1080#1085#1072#1083#1091
        TabOrder = 5
        OnClick = bbForceCloseChekClick
      end
      object btnSetStr: TBitBtn
        Left = 433
        Top = 4
        Width = 120
        Height = 25
        Caption = #1047#1072#1075#1086#1083#1086#1074#1082#1080' '#1095#1077#1082#1086#1074
        Enabled = False
        TabOrder = 6
        OnClick = btnSetStrClick
      end
      object Panel1: TPanel
        Left = 192
        Top = 30
        Width = 361
        Height = 181
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 7
        object Label1: TLabel
          Left = 5
          Top = 8
          Width = 26
          Height = 13
          Caption = #1060#1053':'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 5
          Top = 33
          Width = 19
          Height = 13
          Caption = 'I'#1044':'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 165
          Top = 8
          Width = 23
          Height = 13
          Caption = #1055#1053':'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 5
          Top = 58
          Width = 68
          Height = 13
          Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082':'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 5
          Top = 81
          Width = 58
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 1:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 5
          Top = 104
          Width = 58
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 2:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 5
          Top = 127
          Width = 58
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 3:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 5
          Top = 151
          Width = 58
          Height = 13
          Caption = #1057#1090#1088#1086#1082#1072' 4:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edFN: TEdit
          Left = 32
          Top = 4
          Width = 114
          Height = 21
          TabOrder = 0
        end
        object edPN: TEdit
          Left = 187
          Top = 4
          Width = 149
          Height = 21
          TabOrder = 1
        end
        object edID: TEdit
          Left = 32
          Top = 29
          Width = 114
          Height = 21
          TabOrder = 2
        end
        object edHead: TEdit
          Left = 75
          Top = 55
          Width = 216
          Height = 21
          TabOrder = 3
        end
        object edStr1: TEdit
          Left = 75
          Top = 78
          Width = 278
          Height = 21
          TabOrder = 4
        end
        object edStr2: TEdit
          Left = 75
          Top = 101
          Width = 278
          Height = 21
          TabOrder = 5
        end
        object edStr3: TEdit
          Left = 75
          Top = 124
          Width = 278
          Height = 21
          TabOrder = 6
        end
        object edStr4: TEdit
          Left = 75
          Top = 147
          Width = 278
          Height = 21
          TabOrder = 7
        end
        object BitBtn8: TBitBtn
          Left = 293
          Top = 53
          Width = 60
          Height = 25
          Caption = #1047#1072#1087#1080#1089#1072#1090#1100
          TabOrder = 8
          OnClick = BitBtn8Click
        end
      end
      object btnReadStr: TBitBtn
        Left = 295
        Top = 4
        Width = 138
        Height = 25
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        TabOrder = 8
        OnClick = btnReadStrClick
      end
    end
    object edKassaTxt: TEdit
      Left = 75
      Top = 555
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object BitBtn1: TBitBtn
      Left = 85
      Top = 585
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 5
      OnClick = BitBtn1Click
    end
    object btReadTxt: TButton
      Left = 200
      Top = 555
      Width = 75
      Height = 25
      Caption = #1063#1090#1077#1085#1080#1077' Txt'
      TabOrder = 6
      OnClick = btReadTxtClick
    end
    object ProgressBar1: TProgressBar
      Left = 230
      Top = 605
      Width = 150
      Height = 16
      TabOrder = 7
    end
    object tmpButton2: TButton
      Left = 315
      Top = 555
      Width = 71
      Height = 25
      Caption = 'tmpButton2'
      TabOrder = 8
      OnClick = tmpButton2Click
    end
    object Button1: TButton
      Left = 450
      Top = 535
      Width = 276
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1085#1077#1092#1080#1089#1082#1072#1083#1100#1085#1099#1081' '#1095#1077#1082' ('#1076#1083#1103' Exellio) '
      TabOrder = 9
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 450
      Top = 560
      Width = 276
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1092#1080#1089#1082#1072#1083#1100#1085#1099#1081' '#1095#1077#1082' ('#1076#1083#1103' Exellio) '
      TabOrder = 10
      OnClick = Button3Click
    end
  end
  object pnSale: TPanel
    Left = 0
    Top = 60
    Width = 1020
    Height = 612
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderWidth = 2
    TabOrder = 3
    Visible = False
    object splMain: TSplitter
      Left = 3
      Top = 432
      Width = 1014
      Height = 4
      Cursor = crVSplit
      Align = alBottom
      Color = 10395294
      ParentColor = False
      ResizeStyle = rsUpdate
      OnMoved = splMainMoved
    end
    object pnMainTop: TPanel
      Left = 3
      Top = 3
      Width = 1014
      Height = 429
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        1014
        429)
      object lbExt: TLabel
        Left = 12
        Top = 279
        Width = 811
        Height = 92
        Alignment = taCenter
        Anchors = [akLeft, akRight, akBottom]
        AutoSize = False
        Caption = 'lbExt'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
      end
      object pnSklad: TPanel
        Left = 0
        Top = 0
        Width = 833
        Height = 272
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          833
          272)
        object sbSearchClear: TSpeedButton
          Left = 294
          Top = 2
          Width = 28
          Height = 43
          Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clRed
          Font.Height = -21
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00008F8FFF9898FF
            9C97FF5D72D581A0C1FF0000FF0000FF0000FF0000FF0000FF00007373FF5657
            FC6258FF515AEE3560AA9A9AFF5252FF3F3BFF1221DF1036B397AFCFFF0000FF
            0000FF0000FF00007B7BFE0000FE0000FF0000E90011BB5D80B9FF0000B3B3FF
            6869FD635BFF393FF20021A798ACD6FF0000FF00008485FE0000FF211EFF0309
            F20128B19DBAC6FF0000FF0000FF0000B2B2FF5C5CFE5F5CFF4D4EFD0018A3B6
            CBD5B0ACFF1918FF2F2EFF1F1FFD0019A79EB6CFFF0000FF0000FF0000FF0000
            FF0000ACACFE4C4BFF5B5BFF484AFB1D47AB2340C5493DFF3537FB0011A398AD
            D6FF0000FF0000FF0000FF0000FF0000FF0000FF0000B2B2FE6464FF635EFF2F
            3DE2363DEF343DED2143B99DB2D6FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF00006565FE6768FC7066FF6B5CFF152FCC0F488DFF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000BBBBFE6E6EFF7C78FF50
            52E24B4AEF3A44ED2245B99AAFD6FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000C0C0FE7675FF8281FF6C6CFB0749AB2250C57565FF484AFB0018A398AC
            D6FF0000FF0000FF0000FF0000FF0000CCCCFF8D8DFE9491FF8C8CFD0822A300
            C0D549C6FF6F50FF5B5BFF4D4EFD0021A797AFCFFF0000FF0000FF0000CBCBFF
            9B9CFDB4ABFF7F85F2022DA79EACD6FF0000FF0000B4ABFE4C4CFF5F5CFF393F
            F20B32B18EABC6FF0000BCBCFF9090FF9A95FF5969DF2349B38EA6CFFF0000FF
            0000FF0000FF0000ACACFE5D5DFE544CFF101BE90C2DBB5679B9B5B5FFC1C1FF
            D6D1FF758AD56F8EC1FF0000FF0000FF0000FF0000FF0000FF0000AEAEFF9B9C
            FCAAA0FF7880EE2D58AAFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Transparent = False
          OnClick = sbSearchClearClick
        end
        object imSearch: TImage
          Left = 133
          Top = 2
          Width = 160
          Height = 42
        end
        object imSearch2: TImage
          Left = 324
          Top = 2
          Width = 357
          Height = 42
        end
        object dbgSklad: TDBGrid
          Left = 2
          Top = 87
          Width = 829
          Height = 183
          Hint = 
            #1059#1074#1072#1078#1072#1077#1084#1099#1077' '#1087#1088#1086#1074#1080#1079#1086#1088#1099'! '#1044#1083#1103'  '#1087#1086#1080#1089#1082#1072' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074' '#1085#1077' '#1087#1086' '#1085#1072#1095#1072#1083#1100#1085#1099#1084' '#1089#1080#1084#1074 +
            #1086#1083#1072#1084', '#1072' '#1087#1086' '#1092#1088#1072#1079#1077' '#1074' '#1083#1102#1073#1086#1081' '#1095#1072#1089#1090#1080' '#1085#1072#1079#1074#1072#1085#1080#1103' '#1085#1072#1078#1084#1080#1090#1077' Ctrl+F7'
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          Color = 15463146
          DataSource = DM.srSprTov
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ParentShowHint = False
          PopupMenu = pmMain
          ReadOnly = True
          ShowHint = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Visible = False
          OnCellClick = dbgSkladCellClick
          OnDrawColumnCell = dbgSkladDrawColumnCell
          OnDblClick = dbgSkladDblClick
          OnKeyDown = dbgSkladKeyDown
          OnKeyPress = dbgSkladKeyPress
          OnKeyUp = dbgSkladKeyUp
          OnTitleClick = dbgSkladTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Art_Code'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = #1050#1054#1044
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nds'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = #1053#1044#1057
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Names'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 295
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OstatUp'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = #1054#1089#1090'.'#1059#1087'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Skd'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = #1062'.'#1091#1087'. '#1086#1090' 3'#1091#1087'. '
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CenaUp'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085'.'#1059#1087'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Ostat'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = #1054#1089#1090#1072#1090'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 38
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PL1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = #1054#1089#1085'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 34
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PL2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = #1042#1080#1090#1088
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 37
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PL3'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = #1057#1082#1083'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P4'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = #1057#1088#1086#1082
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P5'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = #1050#1072#1088#1072#1085#1090'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cena'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'akCena'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Width = 86
              Visible = True
            end>
        end
        object pns3: TPanel
          Left = 260
          Top = 45
          Width = 71
          Height = 42
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 17
          object Label14: TLabel
            Left = 1
            Top = 1
            Width = 69
            Height = 40
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = #1054#1089#1090#1072#1090#1086#1082' '#1091#1087#1072#1082#1086#1074#1086#1082
            Layout = tlCenter
            WordWrap = True
          end
        end
        object pns2: TPanel
          Left = 124
          Top = 45
          Width = 136
          Height = 42
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
          OnClick = pns2Click
          DesignSize = (
            136
            42)
          object lbNamesUA: TLabel
            Left = 117
            Top = 23
            Width = 13
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Caption = 'lbNamesUA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clPurple
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = pns2Click
          end
          object lbnmCap: TLabel
            Left = 41
            Top = 6
            Width = 89
            Height = 13
            Anchors = [akTop, akRight]
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Layout = tlCenter
            OnClick = pns2Click
          end
          object cbIsSpisAllOnly: TCheckBox
            Left = 5
            Top = 4
            Width = 149
            Height = 17
            Caption = #1055#1086#1083#1085#1086#1089#1090#1100#1102' '#1076#1083#1103' '#1089#1087#1080#1089#1072#1085#1080#1103
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = cbIsSpisAllOnlyClick
          end
          object cbExt: TCheckBox
            Left = 5
            Top = 22
            Width = 102
            Height = 15
            Caption = #1069#1082#1089#1090#1077#1084#1087#1086#1088#1072#1083
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Visible = False
            OnClick = cbExtClick
          end
        end
        object edCntxSearch: TEdit
          Left = 138
          Top = 7
          Width = 150
          Height = 32
          BevelKind = bkFlat
          BorderStyle = bsNone
          Constraints.MaxWidth = 430
          Constraints.MinWidth = 150
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnChange = edCntxSearchChange
          OnEnter = imFindClick
          OnExit = edCntxSearchExit
          OnKeyDown = edCntxSearchKeyDown
        end
        object Panel3: TPanel
          Left = 682
          Top = 2
          Width = 151
          Height = 43
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          DesignSize = (
            151
            43)
          object Label25: TLabel
            Left = 16
            Top = 1
            Width = 133
            Height = 13
            Anchors = [akTop, akRight]
            Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1090#1086#1074#1072#1088#1072':'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbNextDateTov: TLabel
            Left = 16
            Top = 16
            Width = 133
            Height = 13
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object Panel4: TPanel
          Left = 2
          Top = 2
          Width = 129
          Height = 43
          TabOrder = 3
          DesignSize = (
            129
            43)
          object SpeedButton1: TSpeedButton
            Left = 0
            Top = -1
            Width = 129
            Height = 44
            Anchors = [akLeft, akTop, akRight, akBottom]
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
            Flat = True
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
            OnClick = SpeedButton1Click
          end
        end
        object edVesh: TEdit
          Tag = 1
          Left = 329
          Top = 13
          Width = 121
          Height = 21
          BevelKind = bkFlat
          BorderStyle = bsNone
          Constraints.MaxWidth = 400
          Constraints.MinWidth = 112
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          Text = #1044#1077#1081#1089#1090#1074'. '#1074#1077#1097#1077#1089#1090#1074#1086'...'
          OnChange = edVeshChange
          OnEnter = edVeshEnter
          OnExit = edVeshExit
          OnKeyDown = edVeshKeyDown
        end
        object pnVesh: TPanel
          Left = 192
          Top = 8
          Width = 16
          Height = 16
          TabOrder = 4
          Visible = False
          object imVesh: TImage
            Left = 8
            Top = 8
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000C40E0000C40E0000000000000000
              0000808080808080808080808080808080808080808080808080808080808080
              808080808080808080808080808080808080FFFFFFC0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080
              8080FFFFFF9898FF9C97FF5D72D581A0C1C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C07373FF5657FC6258FF515AEE808080FFFFFF5252FF3F3BFF1221DF1036
              B397AFCFC0C0C0C0C0C0C0C0C0C0C0C07B7BFE0000FE0000FF0000E90011BB80
              8080FFFFFFB3B3FF6869FD635BFF393FF20021A798ACD6C0C0C0C0C0C08485FE
              0000FF211EFF0309F20128B19DBAC6808080FFFFFFC0C0C0B2B2FF5C5CFE5F5C
              FF4D4EFD0018A3B6CBD5B0ACFF1918FF2F2EFF1F1FFD0019A79EB6CFC0C0C080
              8080FFFFFFC0C0C0C0C0C0ACACFE4C4BFF5B5BFF484AFB1D47AB2340C5493DFF
              3537FB0011A398ADD6C0C0C0C0C0C0808080FFFFFFC0C0C0C0C0C0C0C0C0B2B2
              FE6464FF635EFF2F3DE2363DEF343DED2143B99DB2D6C0C0C0C0C0C0C0C0C080
              8080FFFFFFC0C0C0C0C0C0C0C0C0C0C0C06565FE6768FC7066FF6B5CFF152FCC
              0F488DC0C0C0C0C0C0C0C0C0C0C0C0808080FFFFFFC0C0C0C0C0C0C0C0C0BBBB
              FE6E6EFF7C78FF5052E24B4AEF3A44ED2245B99AAFD6C0C0C0C0C0C0C0C0C080
              8080FFFFFFC0C0C0C0C0C0C0C0FE7675FF8281FF6C6CFB0749AB2250C57565FF
              484AFB0018A398ACD6C0C0C0C0C0C0808080FFFFFFC0C0C0CCCCFF8D8DFE9491
              FF8C8CFD0822A300C0D549C6FF6F50FF5B5BFF4D4EFD0021A797AFCFC0C0C080
              8080FFFFFFCBCBFF9B9CFDB4ABFF7F85F2022DA79EACD6C0C0C0C0C0C0B4ABFE
              4C4CFF5F5CFF393FF20B32B18EABC6808080FFFFFF9090FF9A95FF5969DF2349
              B38EA6CFC0C0C0C0C0C0C0C0C0C0C0C0ACACFE5D5DFE544CFF101BE90C2DBB80
              8080FFFFFFC1C1FFD6D1FF758AD56F8EC1C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0AEAEFF9B9CFCAAA0FF7880EE808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
              8080}
            OnClick = imVeshClick
          end
        end
        object edDoz: TEdit
          Tag = 1
          Left = 459
          Top = 13
          Width = 93
          Height = 21
          BevelKind = bkFlat
          BorderStyle = bsNone
          Constraints.MaxWidth = 120
          Constraints.MinWidth = 84
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          Text = #1044#1086#1079#1080#1088#1086#1074#1082#1072'...'
          OnChange = edVeshChange
          OnEnter = edVeshEnter
          OnExit = edVeshExit
          OnKeyDown = edVeshKeyDown
        end
        object edForm: TEdit
          Tag = 1
          Left = 560
          Top = 13
          Width = 116
          Height = 21
          BevelKind = bkFlat
          BorderStyle = bsNone
          Constraints.MaxWidth = 450
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          Text = #1060#1086#1088#1084#1072' '#1074#1099#1087#1091#1089#1082#1072'...'
          OnChange = edVeshChange
          OnEnter = edVeshEnter
          OnExit = edVeshExit
          OnKeyDown = edVeshKeyDown
        end
        object pnDoz: TPanel
          Left = 216
          Top = 8
          Width = 16
          Height = 16
          TabOrder = 5
          Visible = False
          object imDoz: TImage
            Left = 8
            Top = 8
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000C40E0000C40E0000000000000000
              0000808080808080808080808080808080808080808080808080808080808080
              808080808080808080808080808080808080FFFFFFC0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080
              8080FFFFFF9898FF9C97FF5D72D581A0C1C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C07373FF5657FC6258FF515AEE808080FFFFFF5252FF3F3BFF1221DF1036
              B397AFCFC0C0C0C0C0C0C0C0C0C0C0C07B7BFE0000FE0000FF0000E90011BB80
              8080FFFFFFB3B3FF6869FD635BFF393FF20021A798ACD6C0C0C0C0C0C08485FE
              0000FF211EFF0309F20128B19DBAC6808080FFFFFFC0C0C0B2B2FF5C5CFE5F5C
              FF4D4EFD0018A3B6CBD5B0ACFF1918FF2F2EFF1F1FFD0019A79EB6CFC0C0C080
              8080FFFFFFC0C0C0C0C0C0ACACFE4C4BFF5B5BFF484AFB1D47AB2340C5493DFF
              3537FB0011A398ADD6C0C0C0C0C0C0808080FFFFFFC0C0C0C0C0C0C0C0C0B2B2
              FE6464FF635EFF2F3DE2363DEF343DED2143B99DB2D6C0C0C0C0C0C0C0C0C080
              8080FFFFFFC0C0C0C0C0C0C0C0C0C0C0C06565FE6768FC7066FF6B5CFF152FCC
              0F488DC0C0C0C0C0C0C0C0C0C0C0C0808080FFFFFFC0C0C0C0C0C0C0C0C0BBBB
              FE6E6EFF7C78FF5052E24B4AEF3A44ED2245B99AAFD6C0C0C0C0C0C0C0C0C080
              8080FFFFFFC0C0C0C0C0C0C0C0FE7675FF8281FF6C6CFB0749AB2250C57565FF
              484AFB0018A398ACD6C0C0C0C0C0C0808080FFFFFFC0C0C0CCCCFF8D8DFE9491
              FF8C8CFD0822A300C0D549C6FF6F50FF5B5BFF4D4EFD0021A797AFCFC0C0C080
              8080FFFFFFCBCBFF9B9CFDB4ABFF7F85F2022DA79EACD6C0C0C0C0C0C0B4ABFE
              4C4CFF5F5CFF393FF20B32B18EABC6808080FFFFFF9090FF9A95FF5969DF2349
              B38EA6CFC0C0C0C0C0C0C0C0C0C0C0C0ACACFE5D5DFE544CFF101BE90C2DBB80
              8080FFFFFFC1C1FFD6D1FF758AD56F8EC1C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0AEAEFF9B9CFCAAA0FF7880EE808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
              8080}
            OnClick = imVeshClick
          end
        end
        object pnForm: TPanel
          Left = 240
          Top = 8
          Width = 16
          Height = 16
          TabOrder = 6
          Visible = False
          object imForm: TImage
            Left = 8
            Top = 8
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000C40E0000C40E0000000000000000
              0000808080808080808080808080808080808080808080808080808080808080
              808080808080808080808080808080808080FFFFFFC0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080
              8080FFFFFF9898FF9C97FF5D72D581A0C1C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C07373FF5657FC6258FF515AEE808080FFFFFF5252FF3F3BFF1221DF1036
              B397AFCFC0C0C0C0C0C0C0C0C0C0C0C07B7BFE0000FE0000FF0000E90011BB80
              8080FFFFFFB3B3FF6869FD635BFF393FF20021A798ACD6C0C0C0C0C0C08485FE
              0000FF211EFF0309F20128B19DBAC6808080FFFFFFC0C0C0B2B2FF5C5CFE5F5C
              FF4D4EFD0018A3B6CBD5B0ACFF1918FF2F2EFF1F1FFD0019A79EB6CFC0C0C080
              8080FFFFFFC0C0C0C0C0C0ACACFE4C4BFF5B5BFF484AFB1D47AB2340C5493DFF
              3537FB0011A398ADD6C0C0C0C0C0C0808080FFFFFFC0C0C0C0C0C0C0C0C0B2B2
              FE6464FF635EFF2F3DE2363DEF343DED2143B99DB2D6C0C0C0C0C0C0C0C0C080
              8080FFFFFFC0C0C0C0C0C0C0C0C0C0C0C06565FE6768FC7066FF6B5CFF152FCC
              0F488DC0C0C0C0C0C0C0C0C0C0C0C0808080FFFFFFC0C0C0C0C0C0C0C0C0BBBB
              FE6E6EFF7C78FF5052E24B4AEF3A44ED2245B99AAFD6C0C0C0C0C0C0C0C0C080
              8080FFFFFFC0C0C0C0C0C0C0C0FE7675FF8281FF6C6CFB0749AB2250C57565FF
              484AFB0018A398ACD6C0C0C0C0C0C0808080FFFFFFC0C0C0CCCCFF8D8DFE9491
              FF8C8CFD0822A300C0D549C6FF6F50FF5B5BFF4D4EFD0021A797AFCFC0C0C080
              8080FFFFFFCBCBFF9B9CFDB4ABFF7F85F2022DA79EACD6C0C0C0C0C0C0B4ABFE
              4C4CFF5F5CFF393FF20B32B18EABC6808080FFFFFF9090FF9A95FF5969DF2349
              B38EA6CFC0C0C0C0C0C0C0C0C0C0C0C0ACACFE5D5DFE544CFF101BE90C2DBB80
              8080FFFFFFC1C1FFD6D1FF758AD56F8EC1C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0AEAEFF9B9CFCAAA0FF7880EE808080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
              8080}
            OnClick = imVeshClick
          end
        end
        object pnVesh1: TPanel
          Left = 73
          Top = 170
          Width = 17
          Height = 17
          TabOrder = 11
          object imVesh1: TImage
            Left = 8
            Top = 8
            Width = 17
            Height = 17
            AutoSize = True
            Picture.Data = {
              07544269746D6170AA030000424DAA0300000000000036000000280000001100
              0000110000000100180000000000740300000000000000000000000000000000
              0000808080808080808080808080808080808080808080808080808080808080
              80808080808080808080808080808080808080808000808080C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
              C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080008080
              80C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
              C8D0D4000000000000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D48080
              8000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000000000000000000000
              000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8
              D0D4C8D0D4000000000000000000000000000000000000000000C8D0D4C8D0D4
              C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080008080
              80C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D48080
              8000808080808080808080808080808080808080808080808080808080808080
              80808080808080808080808080808080808080808000}
            OnClick = imVesh1Click
          end
        end
        object pnDoz1: TPanel
          Left = 97
          Top = 170
          Width = 17
          Height = 17
          TabOrder = 12
          object imDoz1: TImage
            Left = 8
            Top = 8
            Width = 17
            Height = 17
            AutoSize = True
            Picture.Data = {
              07544269746D6170AA030000424DAA0300000000000036000000280000001100
              0000110000000100180000000000740300000000000000000000000000000000
              0000808080808080808080808080808080808080808080808080808080808080
              80808080808080808080808080808080808080808000808080C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
              C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080008080
              80C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
              C8D0D4000000000000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D48080
              8000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000000000000000000000
              000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8
              D0D4C8D0D4000000000000000000000000000000000000000000C8D0D4C8D0D4
              C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080008080
              80C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D48080
              8000808080808080808080808080808080808080808080808080808080808080
              80808080808080808080808080808080808080808000}
            OnClick = imVesh1Click
          end
        end
        object pnForm1: TPanel
          Left = 121
          Top = 170
          Width = 17
          Height = 17
          TabOrder = 13
          object imForm1: TImage
            Left = 8
            Top = 8
            Width = 17
            Height = 17
            AutoSize = True
            Picture.Data = {
              07544269746D6170AA030000424DAA0300000000000036000000280000001100
              0000110000000100180000000000740300000000000000000000000000000000
              0000808080808080808080808080808080808080808080808080808080808080
              80808080808080808080808080808080808080808000808080C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
              C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080008080
              80C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
              C8D0D4000000000000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D48080
              8000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000000000000000000000
              000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8
              D0D4C8D0D4000000000000000000000000000000000000000000C8D0D4C8D0D4
              C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080008080
              80C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D4C8D0D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
              D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
              D4C8D0D4C8D0D4C8D0D480808000808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
              C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D48080
              8000808080808080808080808080808080808080808080808080808080808080
              80808080808080808080808080808080808080808000}
            OnClick = imVesh1Click
          end
        end
        object pns0: TPanel
          Left = 14
          Top = 45
          Width = 79
          Height = 42
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
          OnClick = lbArtClick
          object lbArt: TLabel
            Left = 1
            Top = 1
            Width = 77
            Height = 22
            Alignment = taCenter
            AutoSize = False
            Caption = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072
            Layout = tlCenter
            WordWrap = True
            OnClick = lbArtClick
          end
          object cbBoxZero: TCheckBox
            Left = 5
            Top = 22
            Width = 37
            Height = 17
            Caption = '>0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = cbBoxZeroClick
          end
        end
        object pns1: TPanel
          Left = 93
          Top = 45
          Width = 31
          Height = 42
          Caption = #1053#1044#1057
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 15
        end
        object pns4: TPanel
          Left = 331
          Top = 45
          Width = 87
          Height = 42
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 18
          object lbCenaUpSkd: TLabel
            Left = 1
            Top = 1
            Width = 85
            Height = 40
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = #1053#1072#1082#1086#1087#1083#1077#1085#1080#1077' '#1085#1072' '#1082#1072#1088#1090#1091' '#1086#1090' 3-x '#1091#1087#1072#1082#1086#1074#1086#1082
            Layout = tlCenter
            WordWrap = True
          end
        end
        object pns5: TPanel
          Left = 418
          Top = 45
          Width = 76
          Height = 42
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 19
          object lbCenaUp: TLabel
            Left = 1
            Top = 1
            Width = 74
            Height = 40
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = #1062#1077#1085#1072' '#1079#1072' '#1091#1087#1072#1082#1086#1074#1082#1091' '#1073#1077#1079' '#1089#1082#1080#1076#1082#1080
            Layout = tlCenter
            WordWrap = True
          end
        end
        object pns6: TPanel
          Left = 494
          Top = 45
          Width = 39
          Height = 42
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 20
          object Label17: TLabel
            Left = 1
            Top = 1
            Width = 37
            Height = 40
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = #1054#1089#1090#1072#1090' '#1077#1076'.'
            Layout = tlCenter
            WordWrap = True
          end
        end
        object pns7: TPanel
          Left = 533
          Top = 45
          Width = 36
          Height = 42
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 21
          object Label18: TLabel
            Left = 1
            Top = 1
            Width = 34
            Height = 40
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = #8470' '#1054#1089#1085'.'
            Layout = tlCenter
            WordWrap = True
          end
        end
        object pns8: TPanel
          Left = 572
          Top = 45
          Width = 38
          Height = 42
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 22
          object Label19: TLabel
            Left = 1
            Top = 1
            Width = 36
            Height = 40
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = #8470' '#1042#1080#1090#1088'.'
            Layout = tlCenter
            WordWrap = True
          end
        end
        object pns9: TPanel
          Left = 610
          Top = 45
          Width = 38
          Height = 42
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 23
          object Label20: TLabel
            Left = 1
            Top = 1
            Width = 36
            Height = 40
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = #8470' '#1057#1082#1083'.'
            Layout = tlCenter
            WordWrap = True
          end
        end
        object pns10: TPanel
          Left = 648
          Top = 45
          Width = 38
          Height = 42
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 24
          object Label21: TLabel
            Left = 1
            Top = 1
            Width = 36
            Height = 40
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = #8470' '#1057#1088#1086#1082'.'
            Layout = tlCenter
            WordWrap = True
          end
        end
        object pns11: TPanel
          Left = 671
          Top = 45
          Width = 51
          Height = 42
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 25
          object Label22: TLabel
            Left = 1
            Top = 1
            Width = 49
            Height = 40
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = #8470' '#1050#1072#1088#1072#1085#1090'.'
            Layout = tlCenter
            WordWrap = True
          end
        end
        object pns12: TPanel
          Left = 680
          Top = 45
          Width = 51
          Height = 42
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 26
          object Label23: TLabel
            Left = 1
            Top = 1
            Width = 49
            Height = 40
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = #1062#1077#1085#1072'  '#1079#1072' '#1077#1076'.'
            Layout = tlCenter
            WordWrap = True
          end
        end
        object pnsI: TPanel
          Left = 2
          Top = 45
          Width = 12
          Height = 42
          TabOrder = 27
          OnClick = pnsIClick
        end
        object pnse: TPanel
          Left = 556
          Top = 45
          Width = 16
          Height = 42
          TabOrder = 28
        end
        object dbgFi: TDBGrid
          Tag = 1
          Left = 300
          Top = 125
          Width = 276
          Height = 131
          BorderStyle = bsNone
          DataSource = DM.srFi
          Options = [dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 8
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Visible = False
          OnCellClick = dbgFiCellClick
          OnExit = dbgFiExit
          OnKeyDown = dbgFiKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'Descr'
              Visible = True
            end>
        end
        object pns13: TPanel
          Left = 734
          Top = 45
          Width = 92
          Height = 42
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 29
          object Label16: TLabel
            Left = 1
            Top = 1
            Width = 90
            Height = 40
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = #1040#1082#1094#1080#1103
            Layout = tlCenter
            WordWrap = True
          end
        end
      end
      object pnSop: TPanel
        Left = 540
        Top = 273
        Width = 274
        Height = 103
        Anchors = [akLeft, akRight, akBottom]
        BevelOuter = bvNone
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 7
        DesignSize = (
          274
          103)
        object Shape1: TShape
          Left = 7
          Top = 7
          Width = 261
          Height = 89
          Anchors = [akLeft, akTop, akRight, akBottom]
          Pen.Color = clGray
        end
        object imSop: TImage
          Left = 7
          Top = 6
          Width = 20
          Height = 91
        end
        object Label3: TLabel
          Left = 30
          Top = 45
          Width = 118
          Height = 13
          Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1088#1077#1087#1072#1088#1072#1090#1072' '#1085#1072' '#1089#1082#1083#1072#1076#1077'.'
          Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1089#1082#1083#1072#1076#1077':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clPurple
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label15: TLabel
          Left = 30
          Top = 73
          Width = 124
          Height = 13
          Hint = 
            #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '#1087#1088#1077#1087#1072#1088#1072#1090#1072' '#1074' '#1072#1087#1090#1077#1082#1072#1093' '#1089#1077#1090#1080' '#1086#1073#1085#1086#1074#1083#1103#1077#1090#1089#1103' '#1085#1077#1089#1082#1086#1083#1100#1082 +
            #1086' '#1088#1072#1079' '#1074' '#1089#1091#1090#1082#1080'. '#1055#1086#1101#1090#1086#1084#1091' '#1090#1086#1095#1085#1086#1077' '#1082#1086#1083'-'#1074#1086' '#1087#1088#1077#1087#1072#1088#1072#1090#1072' '#1085#1091#1078#1085#1086' '#1091#1090#1086#1095#1085#1103#1090#1100' '#1074' ' +
            #1090#1077#1083#1077#1092#1086#1085#1085#1086#1084' '#1088#1077#1078#1080#1084#1077'.'
          Caption = #1054#1089#1090#1072#1090#1086#1082' '#1074' '#1072#1087#1090'. '#1089#1077#1090#1080':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object lbPrice: TLabel
          Left = 30
          Top = 11
          Width = 165
          Height = 34
          Hint = 
            #1044#1077#1092#1077#1082#1090#1091#1088#1072' '#1086#1079#1085#1072#1095#1072#1077#1090', '#1095#1090#1086' '#1087#1077#1088#1087#1072#1088#1072#1090#1072' '#1085#1077#1090' '#1074' '#1087#1088#1072#1081#1089#1072#1093' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074' '#1079#1072'  ' +
            #1074#1095#1077#1088#1072#1096#1085#1080#1081' '#1076#1077#1085#1100'.'
          AutoSize = False
          Caption = #1045#1089#1090#1100' '#1091' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Layout = tlCenter
          WordWrap = True
        end
        object lbApt: TLabel
          Left = 155
          Top = 73
          Width = 36
          Height = 13
          Hint = 
            #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '#1087#1088#1077#1087#1072#1088#1072#1090#1072' '#1074' '#1072#1087#1090#1077#1082#1072#1093' '#1089#1077#1090#1080' '#1086#1073#1085#1086#1074#1083#1103#1077#1090#1089#1103' '#1085#1077#1089#1082#1086#1083#1100#1082 +
            #1086' '#1088#1072#1079' '#1074' '#1089#1091#1090#1082#1080'. '#1055#1086#1101#1090#1086#1084#1091' '#1090#1086#1095#1085#1086#1077' '#1082#1086#1083'-'#1074#1086' '#1087#1088#1077#1087#1072#1088#1072#1090#1072' '#1085#1091#1078#1085#1086' '#1091#1090#1086#1095#1085#1103#1090#1100' '#1074' ' +
            #1090#1077#1083#1077#1092#1086#1085#1085#1086#1084' '#1088#1077#1078#1080#1084#1077'.'
          Caption = '99999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object lbSkl: TLabel
          Left = 155
          Top = 45
          Width = 36
          Height = 13
          Hint = 
            #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '#1087#1088#1077#1087#1072#1088#1072#1090#1072' '#1074' '#1072#1087#1090#1077#1082#1072#1093' '#1089#1077#1090#1080' '#1086#1073#1085#1086#1074#1083#1103#1077#1090#1089#1103' '#1085#1077#1089#1082#1086#1083#1100#1082 +
            #1086' '#1088#1072#1079' '#1074' '#1089#1091#1090#1082#1080'. '#1055#1086#1101#1090#1086#1084#1091' '#1090#1086#1095#1085#1086#1077' '#1082#1086#1083'-'#1074#1086' '#1087#1088#1077#1087#1072#1088#1072#1090#1072' '#1085#1091#1078#1085#1086' '#1091#1090#1086#1095#1085#1103#1090#1100' '#1074' ' +
            #1090#1077#1083#1077#1092#1086#1085#1085#1086#1084' '#1088#1077#1078#1080#1084#1077'.'
          Caption = '99999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clPurple
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object pbSop: TPaintBox
          Left = 190
          Top = 62
          Width = 79
          Height = 33
          Anchors = [akLeft, akTop, akRight]
        end
        object BitBtn6: TBitBtn
          Left = 195
          Top = 13
          Width = 69
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          Caption = #1047#1072#1082#1072#1079#1072#1090#1100
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = BitBtn6Click
        end
        object bbWhereIs: TBitBtn
          Tag = 1
          Left = 195
          Top = 68
          Width = 69
          Height = 22
          Hint = #1059#1079#1085#1072#1090#1100' '#1075#1076#1077' '#1080' '#1079#1072#1073#1088#1086#1085#1080#1088#1086#1074#1072#1090#1100
          Anchors = [akLeft, akTop, akRight]
          Caption = #1059#1079#1085#1072#1090#1100' '#1075#1076#1077
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = miNoTovClick
        end
        object BitBtn5: TBitBtn
          Left = 195
          Top = 40
          Width = 69
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          Caption = #1047#1072#1082#1072#1079#1072#1090#1100
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = BitBtn5Click
        end
        object dbgSop: TDBGrid
          Left = 243
          Top = -1
          Width = 268
          Height = 95
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          Color = 16772033
          DataSource = DM.srSop
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgUpDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'art_code'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1076
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'names'
              Title.Alignment = taCenter
              Title.Caption = #1057#1086#1087#1091#1090#1089#1090#1074#1091#1102#1097#1080#1077
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 125
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ostat'
              Title.Alignment = taCenter
              Title.Caption = #1054#1089#1090'. '#1091#1087'.'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cena'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072' '#1091#1087'.'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 58
              Visible = True
            end>
        end
      end
      object pnUp: TPanel
        Left = 0
        Top = 273
        Width = 294
        Height = 103
        Anchors = [akLeft, akRight, akBottom]
        BevelOuter = bvNone
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 5
        DesignSize = (
          294
          103)
        object pbUp: TPaintBox
          Left = 0
          Top = 0
          Width = 294
          Height = 103
          Align = alClient
        end
        object Shape3: TShape
          Left = 25
          Top = 7
          Width = 262
          Height = 89
          Anchors = [akLeft, akTop, akRight, akBottom]
          Pen.Color = clGray
        end
        object imUp: TImage
          Left = 20
          Top = 6
          Width = 20
          Height = 91
        end
        object Label13: TLabel
          Left = 54
          Top = 42
          Width = 194
          Height = 18
          Anchors = []
          Caption = ' '#1044#1086#1088#1086#1075#1080#1093' '#1072#1085#1072#1083#1086#1075#1086#1074' '#1085#1077#1090' '
        end
        object sbUp: TSpeedButton
          Left = 2
          Top = 4
          Width = 17
          Height = 95
          Hint = 
            #1055#1086#1082#1072#1079#1072#1090#1100' '#1072#1085#1072#1083#1086#1075#1080' '#1090#1086#1083#1100#1082#1086' '#1087#1086' '#1040#1058#1057'-'#1082#1083#1072#1089#1089#1080#1092#1080#1082#1072#1094#1080#1080', '#1072' '#1085#1077' '#1087#1086' '#1087#1086#1083#1085#1086#1084#1091' '#1089#1086 +
            #1086#1090#1074#1077#1090#1089#1090#1074#1080#1102
          AllowAllUp = True
          GroupIndex = 1
          Glyph.Data = {
            D6090000424DD60900000000000036000000280000000A0000004D0000000100
            180000000000A009000000000000000000000000000000000000C0C0C0C0C0C0
            C0C0C0B8BBBE8398AE8398AEB8BBBEC0C0C0C0C0C0C0C0C00000C0C0C0AEB6BC
            3969991168BF1373D31373D31566B75E82A5C0C0C0C0C0C00000C0C0C04775A4
            1581F02088F26FA3D77EA2C65A9CDF4985C0C0C0C0C0C0C00000A6AFB91574D7
            137EEF98ABBFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000008FA1B41279E8
            267EDCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000008399B11074E2
            377BC7C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000097A5B40E6EDB
            216CC2C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000B7BABE136CD4
            0C65CD8C9CADC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C05984B7
            0C64CE1A53977388A17B8DA448678D476A94C0C0C0C0C0C00000C0C0C0B7BABD
            4D81C00A5EC70955B3084FA70A5CC3587DACC0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C099A7BA7592B7628ABD98A6B9C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C08398AEA1ADB8C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C08098B11373D33376B9C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0839CB51584F53881CCC0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0839BB4137EEF367EC8C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C08399B21279E8367AC4C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C08399B11074E23577C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C08398B00E6EDB3473BBC0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C08296AE0D69D53370B7C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C08B9AAB
            7B8DA459789C0C64CE2967B17B8DA47B8DA4AEB3B9C0C0C00000C0C0C01E579E
            084FA70953AF0A5EC70A5ABF084FA7084FA76680A1C0C0C00000C0C0C097A5B7
            8DA0B98DA0B98DA0B98DA0B98DA0B98DA0B9A7AEB7C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000A1ADB88A9DB1
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08A9DB192A2B3C0C0C000004681BB1373D3
            7894AEC0C0C0C0C0C0C0C0C0869CB21373D32577CBC0C0C00000829FBC1584F5
            487CB2C0C0C0C0C0C0C0C0C0517FAE1584F55C91C8C0C0C00000B8BBBE1E82EC
            1172D80D55A20D55A20D55A2116FD2137EEF8CA1B7C0C0C00000C0C0C0528AC7
            1279E85394D9699DD45996D81279E82C81DEC0C0C0C0C0C00000C0C0C0869CB6
            1074E2537BA7C0C0C0567AA31074E25C89BAC0C0C0C0C0C00000C0C0C0C0C0C0
            1F74D52469B7C0C0C02B68AD0E6EDBA1ACB9C0C0C0C0C0C00000C0C0C0C0C0C0
            5281B80D67D1758BA40C65CD3379CAC0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            8C9DB20C64CE1755A00C64CE6487B0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C02068C20A5EC70A5EC7A7AFB8C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C096A4B65C81B1859BB6C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0A8B0BA8398AE8398AEB0B7BCC0C0C0C0C0C0C0C0C00000C0C0C0AEB6BC
            3A6B9C1168BF1373D31373D31165BA2E6297A5AFBAC0C0C00000C0C0C04775A4
            1584F5358FEB7BA3CC86A7C94093E81584F52666A7C0C0C00000A6AFB91779E1
            137EEFAAB4BDC0C0C0C0C0C0B8BBBE3287E2137CEA7790AB00008EA0B21279E8
            3581D2C0C0C0C0C0C0C0C0C0C0C0C05785B81279E85580AD00008399B11074E2
            3B7AC0C0C0C0C0C0C0C0C0C0C0C0C06D8EB21074E24A7CB2000097A5B40E6EDB
            3473BBC0C0C0C0C0C0C0C0C0C0C0C05A7FA90E6EDB5480B20000B7BABE136CD4
            1266C9A4ACB6C0C0C0C0C0C0C0C0C03368A60D69D56687AD0000C0C0C05683BB
            0C64CE20518D7B8DA49DA7B35572950B5EC21D6DCDA7AFB80000C0C0C0B0B5BB
            4E82C30A5EC7084FA7084FA70958BB1B67C6859BB7C0C0C00000C0C0C0C0C0C0
            C0C0C099A7BA7B96B7628ABD8DA0B9B1B6BCC0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C092A2B3
            8A9DB1C0C0C0C0C0C0C0C0C0B0B7BC8398AEB0B7BCC0C0C00000C0C0C02372C1
            1370CFC0C0C0C0C0C0C0C0C05481AD1373D35481AEC0C0C00000C0C0C02883DF
            1584F5C0C0C0C0C0C0C0C0C05A88B81584F55A88B8C0C0C00000C0C0C0277EDA
            137EEFC0C0C0C0C0C0C0C0C05986B6137EEF5986B6C0C0C00000C0C0C0267AD4
            1279E8C0C0C0C0C0C0C0C0C05984B21279E85984B2C0C0C00000C0C0C02476D0
            1074E2C0C0C0C0C0C0C0C0C05882B01074E25882B0C0C0C00000C0C0C02271CA
            0E6EDBC0C0C0C0C0C0C0C0C0577FAD0E6EDB577FADC0C0C00000C0C0C0216DC5
            0D69D5C0C0C0C0C0C0C0C0C0577DAB0D69D5577DABC0C0C00000C0C0C02169BF
            0C64CE7B8DA47B8DA47B8DA4406CA10C64CE567BA7C0C0C00000C0C0C01F64B9
            0A5EC7084FA7084FA7084FA70957B70A5EC75578A5C0C0C00000C0C0C097A5B7
            8DA0B98DA0B98DA0B98DA0B98DA0B98DA0B9A8AFB8C0C0C00000}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbUpClick
        end
        object dbgUp: TDBGrid
          Left = 19
          Top = 4
          Width = 272
          Height = 95
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          Color = 12713983
          DataSource = DM.srUp
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgUpDrawColumnCell
          OnDblClick = dbgUpDblClick
          OnMouseMove = dbgUpMouseMove
          Columns = <
            item
              Expanded = False
              FieldName = 'art_code'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1076
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'names'
              Title.Alignment = taCenter
              Title.Caption = #1044#1086#1088#1086#1075#1080#1077' '#1072#1085#1072#1083#1086#1075#1080
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 154
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ostat'
              Title.Alignment = taCenter
              Title.Caption = #1054#1089#1090'. '#1091#1087'.'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cena'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072' '#1091#1087'.'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 58
              Visible = True
            end>
        end
      end
      object pnDown: TPanel
        Left = 285
        Top = 273
        Width = 259
        Height = 103
        Anchors = [akLeft, akRight, akBottom]
        BevelOuter = bvNone
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 6
        DesignSize = (
          259
          103)
        object pbDown: TPaintBox
          Left = 0
          Top = 0
          Width = 259
          Height = 103
          Align = alClient
        end
        object Shape2: TShape
          Left = 25
          Top = 7
          Width = 227
          Height = 89
          Anchors = [akLeft, akTop, akRight, akBottom]
          Pen.Color = clGray
        end
        object imDown: TImage
          Left = 20
          Top = 6
          Width = 20
          Height = 91
        end
        object Label5: TLabel
          Left = 33
          Top = 42
          Width = 201
          Height = 18
          Anchors = []
          Caption = ' '#1044#1077#1096#1077#1074#1099#1093' '#1072#1085#1072#1083#1086#1075#1086#1074' '#1085#1077#1090' '
        end
        object sbDown: TSpeedButton
          Left = 2
          Top = 4
          Width = 17
          Height = 95
          Hint = 
            #1055#1086#1082#1072#1079#1072#1090#1100' '#1072#1085#1072#1083#1086#1075#1080' '#1090#1086#1083#1100#1082#1086' '#1087#1086' '#1040#1058#1057'-'#1082#1083#1072#1089#1089#1080#1092#1080#1082#1072#1094#1080#1080', '#1072' '#1085#1077' '#1087#1086' '#1087#1086#1083#1085#1086#1084#1091' '#1089#1086 +
            #1086#1090#1074#1077#1090#1089#1090#1074#1080#1102
          AllowAllUp = True
          GroupIndex = 1
          Glyph.Data = {
            D6090000424DD60900000000000036000000280000000A0000004D0000000100
            180000000000A009000000000000000000000000000000000000C0C0C0C0C0C0
            C0C0C0B8BBBE8398AE8398AEB8BBBEC0C0C0C0C0C0C0C0C00000C0C0C0AEB6BC
            3969991168BF1373D31373D31566B75E82A5C0C0C0C0C0C00000C0C0C04775A4
            1581F02088F26FA3D77EA2C65A9CDF4985C0C0C0C0C0C0C00000A6AFB91574D7
            137EEF98ABBFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000008FA1B41279E8
            267EDCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000008399B11074E2
            377BC7C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000097A5B40E6EDB
            216CC2C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000B7BABE136CD4
            0C65CD8C9CADC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C05984B7
            0C64CE1A53977388A17B8DA448678D476A94C0C0C0C0C0C00000C0C0C0B7BABD
            4D81C00A5EC70955B3084FA70A5CC3587DACC0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C099A7BA7592B7628ABD98A6B9C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C08398AEA1ADB8C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C08098B11373D33376B9C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0839CB51584F53881CCC0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0839BB4137EEF367EC8C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C08399B21279E8367AC4C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C08399B11074E23577C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C08398B00E6EDB3473BBC0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C08296AE0D69D53370B7C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C08B9AAB
            7B8DA459789C0C64CE2967B17B8DA47B8DA4AEB3B9C0C0C00000C0C0C01E579E
            084FA70953AF0A5EC70A5ABF084FA7084FA76680A1C0C0C00000C0C0C097A5B7
            8DA0B98DA0B98DA0B98DA0B98DA0B98DA0B9A7AEB7C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000A1ADB88A9DB1
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08A9DB192A2B3C0C0C000004681BB1373D3
            7894AEC0C0C0C0C0C0C0C0C0869CB21373D32577CBC0C0C00000829FBC1584F5
            487CB2C0C0C0C0C0C0C0C0C0517FAE1584F55C91C8C0C0C00000B8BBBE1E82EC
            1172D80D55A20D55A20D55A2116FD2137EEF8CA1B7C0C0C00000C0C0C0528AC7
            1279E85394D9699DD45996D81279E82C81DEC0C0C0C0C0C00000C0C0C0869CB6
            1074E2537BA7C0C0C0567AA31074E25C89BAC0C0C0C0C0C00000C0C0C0C0C0C0
            1F74D52469B7C0C0C02B68AD0E6EDBA1ACB9C0C0C0C0C0C00000C0C0C0C0C0C0
            5281B80D67D1758BA40C65CD3379CAC0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            8C9DB20C64CE1755A00C64CE6487B0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C02068C20A5EC70A5EC7A7AFB8C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C096A4B65C81B1859BB6C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0A8B0BA8398AE8398AEB0B7BCC0C0C0C0C0C0C0C0C00000C0C0C0AEB6BC
            3A6B9C1168BF1373D31373D31165BA2E6297A5AFBAC0C0C00000C0C0C04775A4
            1584F5358FEB7BA3CC86A7C94093E81584F52666A7C0C0C00000A6AFB91779E1
            137EEFAAB4BDC0C0C0C0C0C0B8BBBE3287E2137CEA7790AB00008EA0B21279E8
            3581D2C0C0C0C0C0C0C0C0C0C0C0C05785B81279E85580AD00008399B11074E2
            3B7AC0C0C0C0C0C0C0C0C0C0C0C0C06D8EB21074E24A7CB2000097A5B40E6EDB
            3473BBC0C0C0C0C0C0C0C0C0C0C0C05A7FA90E6EDB5480B20000B7BABE136CD4
            1266C9A4ACB6C0C0C0C0C0C0C0C0C03368A60D69D56687AD0000C0C0C05683BB
            0C64CE20518D7B8DA49DA7B35572950B5EC21D6DCDA7AFB80000C0C0C0B0B5BB
            4E82C30A5EC7084FA7084FA70958BB1B67C6859BB7C0C0C00000C0C0C0C0C0C0
            C0C0C099A7BA7B96B7628ABD8DA0B9B1B6BCC0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000C0C0C092A2B3
            8A9DB1C0C0C0C0C0C0C0C0C0B0B7BC8398AEB0B7BCC0C0C00000C0C0C02372C1
            1370CFC0C0C0C0C0C0C0C0C05481AD1373D35481AEC0C0C00000C0C0C02883DF
            1584F5C0C0C0C0C0C0C0C0C05A88B81584F55A88B8C0C0C00000C0C0C0277EDA
            137EEFC0C0C0C0C0C0C0C0C05986B6137EEF5986B6C0C0C00000C0C0C0267AD4
            1279E8C0C0C0C0C0C0C0C0C05984B21279E85984B2C0C0C00000C0C0C02476D0
            1074E2C0C0C0C0C0C0C0C0C05882B01074E25882B0C0C0C00000C0C0C02271CA
            0E6EDBC0C0C0C0C0C0C0C0C0577FAD0E6EDB577FADC0C0C00000C0C0C0216DC5
            0D69D5C0C0C0C0C0C0C0C0C0577DAB0D69D5577DABC0C0C00000C0C0C02169BF
            0C64CE7B8DA47B8DA47B8DA4406CA10C64CE567BA7C0C0C00000C0C0C01F64B9
            0A5EC7084FA7084FA7084FA70957B70A5EC75578A5C0C0C00000C0C0C097A5B7
            8DA0B98DA0B98DA0B98DA0B98DA0B98DA0B9A8AFB8C0C0C00000}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbDownClick
        end
        object dbgDown: TDBGrid
          Left = 19
          Top = 4
          Width = 237
          Height = 95
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          Color = 13363149
          DataSource = DM.srDown
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgUpDrawColumnCell
          OnDblClick = dbgUpDblClick
          OnMouseMove = dbgUpMouseMove
          Columns = <
            item
              Expanded = False
              FieldName = 'art_code'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1076
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'names'
              Title.Alignment = taCenter
              Title.Caption = #1044#1077#1096#1077#1074#1099#1077' '#1072#1085#1072#1083#1086#1075#1080
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 125
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ostat'
              Title.Alignment = taCenter
              Title.Caption = #1054#1089#1090'. '#1091#1087'.'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cena'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072' '#1091#1087'.'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 58
              Visible = True
            end>
        end
      end
      object pnStatus: TPanel
        Left = 0
        Top = 376
        Width = 1014
        Height = 21
        Anchors = [akLeft, akRight, akBottom]
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          1014
          21)
        object lbSearch: TLabel
          Left = 4
          Top = 3
          Width = 4
          Height = 16
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = True
        end
        object lbFullName: TLabel
          Left = 310
          Top = 3
          Width = 31
          Height = 16
          Caption = 'sdfd'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 190
          Top = 3
          Width = 116
          Height = 16
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
          Font.Charset = ANSI_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pbUnLoad: TProgressBar
          Left = 3
          Top = 3
          Width = 1008
          Height = 16
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Visible = False
        end
        object cbFind: TComboBox
          Left = 0
          Top = -1
          Width = 296
          Height = 24
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemHeight = 16
          ParentFont = False
          TabOrder = 0
          Visible = False
          OnCloseUp = cbFindCloseUp
          OnEnter = cbFindEnter
          OnExit = cbFindExit
          OnKeyDown = cbFindKeyDown
        end
      end
      object pnControl: TPanel
        Left = 0
        Top = 398
        Width = 1014
        Height = 31
        Anchors = [akLeft, akRight, akBottom]
        BevelOuter = bvLowered
        TabOrder = 2
        DesignSize = (
          1014
          31)
        object sbRecipt: TSpeedButton
          Left = 665
          Top = 3
          Width = 123
          Height = 25
          AllowAllUp = True
          Anchors = [akTop, akRight]
          GroupIndex = 10
          Caption = #1051#1080#1089#1090' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
          Enabled = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000130B0000130B00000000000000000000C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C6C6C6C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C6C6C6C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0B3B3B39797974949498D8D8D9A9A9AC0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0B3B3B39797978080808D
            8D8D9A9A9AC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C08D8D8D2525251F1F1F424242C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08D8D8D80808080
            8080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0444444484848919191C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808080808091
            9191C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0AFAFAF2F2F2F434343656565828282C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0AFAFAF80808080808065
            6565828282C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C06F6F6F9999994E4E4E656565C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C06F6F6F99
            9999808080656565C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C02C2C2C3434342828283F3F3F676767C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808080808080808080
            8080676767C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C09D9D9D3F3F3FC0C0C0868686C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C09D9D9D808080C0C0C0868686C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C07474743030301C1C1CC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0747474808080808080C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C09E9E9E5E5E5E1010102727276F6F6FBDBDBDC0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C09E9E9E5E5E5E80808080
            80806F6F6FBDBDBDC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            B8B8B81B1B1B050505050505050505050505050505050505424242C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0B8B8B880808080808080808080808080
            8080808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            3B3B3B3535353535353535353535353535353535353434340808082A2A2AC0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808080808080808080808080808080
            8080808080808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08484843737
            37C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0848484808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08888
            88979797C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0888888979797C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C02323230909093F3F3F7C7C7CB5B5B5C4C4C44040
            40BCBCBCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808080
            80808080807C7C7CB5B5B5C4C4C4808080BCBCBCC0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CACACACECECE959595585858474747A2A2
            A2C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CA
            CACACECECE959595808080808080A2A2A2C0C0C0C0C0C0C0C0C0}
          NumGlyphs = 2
          OnClick = sbReciptClick
        end
        object lbCheck: TLabel
          Left = 5
          Top = 7
          Width = 4
          Height = 16
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object btnOChek: TBitBtn
          Left = 283
          Top = 3
          Width = 100
          Height = 25
          Caption = #1054#1090#1082#1088#1099#1090#1100' '#1095#1077#1082
          TabOrder = 0
          OnClick = btnOChekClick
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
        object btnCChek: TBitBtn
          Left = 383
          Top = 3
          Width = 100
          Height = 25
          Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1095#1077#1082
          Enabled = False
          TabOrder = 1
          OnClick = btnCChekClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B000010000000100000000000000000FF
            000084848400D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
            1111111111111111111111111111111111111111111111111111111111100011
            1111111111122211111111111004040011111111122323221111111110440404
            0111111112332323211111111104044401111111112323332111111110044440
            4011111112233332321111100440404444011112233232333321111044444040
            4401111233333232332111104004440404011112322333232321111104440444
            4011111123332333321111111040440401111111123233232111111110040040
            1111111112232232111111111104040111111111112323211111111111100011
            1111111111122211111111111111111111111111111111111111}
          NumGlyphs = 2
        end
        object btPrCennik: TBitBtn
          Left = 893
          Top = 3
          Width = 120
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1055#1077#1095#1072#1090#1100' '#1094#1077#1085#1085#1080#1082#1086#1074
          TabOrder = 2
          OnClick = btPrCennikClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000000000000000000000000000000000000000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF808080
            8080808080808080808080808080808080808080808080808080808080808080
            808080808080808080800000FF80808080808080808080808080808080808080
            8080808080808080808080808080808080808080808080808080000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000080808080808080808080808080808080808080808080808080
            8080808080808080808080808080808080808080808080808080000000F0E0D0
            F0E0D0FFF0EFFFF0EFFFF0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0
            EFFFF0EF000000808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080808080000000F0E0D0
            FFF0EF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF8080
            80FFFFFF000000808080808080C0C0C0C0C0C0808080808080808080C0C0C0C0
            C0C0C0C0C0C0C0C0808080C0C0C0808080C0C0C0808080808080000000FFF0EF
            FFF0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080FFFFFF8080
            80FFF0EF000000808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0808080808080C0C0C0808080C0C0C0808080808080000000FFF0EF
            FFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFF0
            EFFFF0EF000000808080808080C0C0C0C0C0C080808080808080808080808080
            8080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080808080000000FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0EFFFF0
            EFF0E0D0000000808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080808080000000FFFFFF
            808080FFFFFF808080808080FFFFFFFFFFFFFFFFFFFFF0EFFFF0EF0000000000
            00F0E0D0000000808080808080C0C0C0808080C0C0C0808080808080C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0808080808080C0C0C0808080808080000000FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0EFFFF0EFF0E0D0F0E0D0F0E0
            D0F0E0D0000000808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080808080000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000FF80808080808080808080808080808080808080808080
            80808080808080808080808080808080808080808080800000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
          NumGlyphs = 2
        end
        object btPrnChek: TBitBtn
          Left = 788
          Top = 3
          Width = 103
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1055#1077#1095#1072#1090#1100' '#1095#1077#1082#1072
          Enabled = False
          TabOrder = 3
          OnClick = btPrnChekClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000C40E0000C40E000000000000000000000000FF0000FF
            0000FF0000FF0000FF8F8F8F7F7F7F7F7F7F7F7F7F7F7F7F0000FF0000FF0000
            FF0000FF0000FF0000FF51515151515151515151515151515194949484848484
            84848484848484845151515151515151515151515151515151510000FF0000FF
            0000FF8F8F8F6060604F4F4F505050605F5F8F80806060606060607F7F7F0000
            FF0000FF0000FF0000FF51515151515151515194949465656554545455555564
            64648686866565656565658484845151515151515151515151510000FF8F8F8F
            606060A0A0A0F0F0F0B0B0B09F8F8FA08080B0B0B0E0E0E0BFBFBF6F6F6F6060
            600000FF0000FF0000FF515151949494656565A5A5A5D5D5D5B5B5B595959588
            8888B5B5B5D5D5D5C4C4C47474746565655151515151515151518F8F8F9F9F9F
            EFEFEFF0F0F0EFEFEFAFAFAF9090905F5F5F6F6F6F8F8F8FBFBFBFEFEFEFB0B0
            B08080800000FF0000FF949494A4A4A4D5D5D5D5D5D5D5D5D5B4B4B495959564
            6464747474949494C4C4C4D5D5D5B5B5B5858585515151515151D0D0D0FFFFFF
            F0F0F0DFDFDF9090907F7F7F909090B0B0B0A0A0A09090908F8F8F8F8F8F6F6F
            6F8F8F8F0000FF0000FFD5D5D5D5D5D5D5D5D5D5D5D5959595848484959595B5
            B5B5A5A5A5959595949494949494747474949494515151515151BFBFBFDFDFDF
            A0A0A09F9F9FCFCFCFAFAFAF8F8F8F8080808080809F9F9FBFBFBF7FAF8F6060
            608F8F8F0000FF0000FFC4C4C4D5D5D5A5A5A5A4A4A4D5D5D5B4B4B494949485
            8585858585A4A4A4C4C4C4A5A5A5656565949494515151515151707070A0A0A0
            DFDFDFDFDFDFDFDFDFDFDFDFE0E0E0CFCFCFBFBFBF9F9F9F8F8F8F6080705F5F
            5F8F8F8F0000FF0000FF757575A5A5A5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5
            D5D5C4C4C4A4A4A49494947C7C7C6464649494945151515151519F9F9FE0E0E0
            DFDFDFD0D0D0CFCFCFD0D0D0CFCFCFC0C0C0C0C0C0CFCFCFD0D0D0CFCFCF7070
            708F8F8F0000FF0000FFA4A4A4D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5C5
            C5C5C5C5C5D5D5D5D5D5D5D5D5D5757575949494515151515151AFAFAFD0D0D0
            C0C0C0AFAFAFA0A0A0CFCFCFF0F0F0EFEFEFEFEFEFDFDFDFBFBFBFBFBFBF8F8F
            8F0000FF0000FF0000FFB4B4B4D5D5D5C5C5C5B4B4B4A5A5A5D5D5D5D5D5D5D5
            D5D5D5D5D5D5D5D5C4C4C4C4C4C49494945151515151515151510000FFAFAFAF
            CFCFCFEFEFEFB0B0B0BFBFBFAFAFAFB0B0B0BFBFBFBFBFBFB0B0B08F8F8F0000
            FF0000FF0000FF0000FF515151B4B4B4D5D5D5D5D5D5B5B5B5C4C4C4B4B4B4B5
            B5B5C4C4C4C4C4C4B5B5B59494945151515151515151515151510000FF0000FF
            C0BFBFFFD0C0FFD0C0FFD0CFEFDFD0E0E0DFE0E0E08F8F8F0000FF0000FF0000
            FF0000FF0000FF0000FF515151515151C4C4C4D5D5D5D5D5D5D5D5D5D5D5D5D5
            D5D5D5D5D59494945151515151515151515151515151515151510000FF0000FF
            DFCFC0FFDFBFFFDFBFFFDFBFFFD0B0FFD0AF806F6F0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF515151515151D1D1D1D5D5D5D5D5D5D5D5D5D0D0D0D0
            D0D07575755151515151515151515151515151515151515151510000FF0000FF
            D0B0A0FFE0CFFFE0CFFFE0CFFFE0CFFFDFC07F6F6F0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF515151515151B3B3B3D5D5D5D5D5D5D5D5D5D5D5D5D5
            D5D57575755151515151515151515151515151515151515151510000FF0000FF
            DFC0B0FFEFDFFFEFDFFFEFDFFFEFDFDFC0B0A0A0A00000FF0000FF0000FF0000
            FF0000FF0000FF0000FF515151515151C3C3C3D5D5D5D5D5D5D5D5D5D5D5D5C3
            C3C3A5A5A55151515151515151515151515151515151515151510000FFD0C0BF
            FFF0EFFFF0EFFFF0EFFFF0EFFFF0EFAFA09F0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF515151C6C6C6D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5A6
            A6A65151515151515151515151515151515151515151515151510000FFDFC0C0
            FFF0F0E0DFD0E0DFD0E0DFD0A0A0A00000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF515151C8C8C8D5D5D5D5D5D5D5D5D5D5D5D5A5A5A551
            5151515151515151515151515151515151515151515151515151}
          NumGlyphs = 2
        end
        object btSumChek: TBitBtn
          Left = 630
          Top = 3
          Width = 32
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1057#1091#1084#1084#1072' '#1095#1077#1082#1072' '#1089#1086' '#1089#1082#1080#1076#1082#1086#1081'...'
          Enabled = False
          TabOrder = 4
          Visible = False
          OnClick = btSumChekClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000230B0000230B0000000000000000000000FF009E9E9E
            9898989898989898989898989797979897979897999798979898979998989898
            979F9E9E00FF0000FF0000FF009E9E9E98989898989898989898989897979797
            97979797979797979797979898989797979E9E9E00FF0000FF0000FF00ADADAD
            BEBEBEBBBBBBBDBDBDBDBDBDBCBCBCBABABBBCBCBCBEBEBDB2B2BC9B9AC3B0AF
            BEACACAE00FF0000FF0000FF00ADADADBEBEBEBBBBBBBDBDBDBDBDBDBCBCBCBA
            BABABCBCBCBDBDBDB5B5B5A6A6A6B3B3B3ACACAC00FF0000FF0000FF00AFAFAF
            CDCDCDE6E6E6C7C7C7D9D9D9E5E5E5BCBCBCE4E4E4D8D9D9BDBDC7BFC0E8BFBE
            CDAFB0B000FF0000FF0000FF00AFAFAFCDCDCDE6E6E6C7C7C7D9D9D9E5E5E5BC
            BCBCE4E4E4D8D8D8C0C0C0CBCBCBC2C2C2AFAFAF00FF0000FF0000FF00B0B0B0
            BDBDBDB6B6B6BEBEBEBBBBBBB8B8B8BEBEBEB7B7B7BBBBBBBDBDBDB6B6B6BEBE
            BEB0B0B000FF0000FF0000FF00B0B0B0BDBDBDB6B6B6BEBEBEBBBBBBB8B8B8BE
            BEBEB7B7B7BBBBBBBDBDBDB6B6B6BEBEBEB0B0B000FF0000FF0000FF00B2B2B2
            D4D4D4EDEDEDCDCDCDE0E0E0ECECECC1C1C1ECECECE0E0E0CDCDCDEDEDEDD4D4
            D4B1B1B100FF0000FF0000FF00B2B2B2D4D4D4EDEDEDCDCDCDE0E0E0ECECECC1
            C1C1ECECECE0E0E0CDCDCDEDEDEDD4D4D4B1B1B100FF0000FF0000FF00B3B3B3
            C0C0C0B5B5B5C1C1C1BBBBBBB6B6B6C4C4C4B6B6B6BBBBBBC0C0C0B5B5B5C0C0
            C0B3B3B300FF0000FF0000FF00B3B3B3C0C0C0B5B5B5C1C1C1BBBBBBB6B6B6C4
            C4C4B6B6B6BBBBBBC0C0C0B5B5B5C0C0C0B3B3B300FF0000FF0000FF00B4B4B4
            DADADAF3F3F3D4D3D3E7E7E7F2F2F2C7C7C7F2F2F2E7E7E7D4D4D4F3F3F3DBDB
            DBB4B4B400FF0000FF0000FF00B4B4B4DADADAF3F3F3D3D3D3E7E7E7F2F2F2C7
            C7C7F2F2F2E7E7E7D4D4D4F3F3F3DBDBDBB4B4B400FF0000FF0000FF00B7B5B6
            C4C3C4B6B6B6C6C5C5BCBDBCB5B7B6CBCACAB7B7B7BDBDBDC5C5C5B6B6B6C3C3
            C3B5B5B500FF0000FF0000FF00B5B5B5C3C3C3B6B6B6C5C5C5BCBCBCB6B6B6CA
            CACAB7B7B7BDBDBDC5C5C5B6B6B6C3C3C3B5B5B500FF0000FF0000FF00B7B7B7
            E1E0E0F3F3F3D9D9D9EBEAEAF3F3F3CDCECDF4F4F4EBEBEBD9D9D9F3F3F3E0E0
            E0B7B7B700FF0000FF0000FF00B7B7B7E0E0E0F3F3F3D9D9D9EAEAEAF3F3F3CD
            CDCDF4F4F4EBEBEBD9D9D9F3F3F3E0E0E0B7B7B700FF0000FF0000FF00B8B9B8
            CDCDCDC4C4C5C0C2C2C2C3C4C3C4C4D1D1D1C4C4C4C8C8C8CECECEC4C4C4CDCD
            CDB8B8B800FF0000FF0000FF00B8B8B8CDCDCDC4C4C4C1C1C1C3C3C3C3C3C3D1
            D1D1C4C4C4C8C8C8CECECEC4C4C4CDCDCDB8B8B800FF0000FF0000FF00B9B9BA
            B5D6E081D8F280D8F380D8F384D8F2D3D4D4E9E9E9E5E5E5DBDBDBE8E8E8DFDF
            DFBABABA00FF0000FF0000FF00B9B9B9D5D5D5D6D6D6D6D6D6D6D6D6D6D6D6D3
            D3D3E9E9E9E5E5E5DBDBDBE8E8E8DFDFDFBABABA00FF0000FF0000FF00BBBBBA
            D3DBDBCDE1E1CEE3E2D1E4E5D3E6E7DFE0E0E6E7E6E2E2E2DCDDDCE1E1E1DBDB
            DBBBBBBB00FF0000FF0000FF00BABABADADADADEDEDEE0E0E0E2E2E2E4E4E4DF
            DFDFE6E6E6E2E2E2DCDCDCE1E1E1DBDBDBBBBBBB00FF0000FF0000FF00BCBCBC
            DADADA566C613E886340AA6C42D78B43D78F42DA8F40F0A63ECF85568D77DADA
            DABCBCBC00FF0000FF0000FF00BCBCBCDADADA6666667474748B8B8BAFAFAFB1
            B1B1B2B2B2C6C6C6A8A8A8808080DADADABCBCBC00FF0000FF0000FF00BDBDBD
            D4D4D4343E38173828164427175D3C175A38175C3A176745175937344C43D4D4
            D4BDBDBD00FF0000FF0000FF00BDBDBDD4D4D43B3B3B2F2F2F3636364B4B4B48
            48484A4A4A545454474747464646D4D4D4BDBDBD00FF0000FF0000FF00C0C0C0
            D6D6D6C8C8C8C8C9C9CAC9C9CAC9CAC8C9C9CAC9CACAC9C9C9C8C9C8C8C8D6D6
            D6C0C0C000FF0000FF0000FF00C0C0C0D6D6D6C8C8C8C8C8C8C9C9C9C9C9C9C8
            C8C8C9C9C9C9C9C9C8C8C8C8C8C8D6D6D6C0C0C000FF0000FF0000FF00BDBDBD
            CDCDCDD2D2D1D4D4D3D5D6D6D8D8D8DAD9D9D9D8D9D6D7D7D5D5D5D2D3D2CDCD
            CDBDBDBD00FF0000FF0000FF00BDBDBDCDCDCDD1D1D1D3D3D3D5D5D5D8D8D8D9
            D9D9D8D8D8D6D6D6D5D5D5D2D2D2CDCDCDBDBDBD00FF0000FF00}
          NumGlyphs = 2
        end
        object bbReserve: TBitBtn
          Left = 136
          Top = 3
          Width = 136
          Height = 25
          Caption = #1041#1088#1086#1085#1100' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074
          Enabled = False
          TabOrder = 5
          OnClick = bbReserveClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000130B0000130B000000000000000000003C4C6A6C91BA
            688EBB668BB9678BBA678DBC6389BA658BBD658ABC618BBC648BBD6289BA5D84
            B4435C795C89BD5C87BB4E4E4EAFAFAFACACACA8A8A8AAAAAAABABABA7A7A7AA
            AAAAA8A8A8AAAAAAAAAAAAA7A7A7A0A0A0616161A7A7A7A4A4A438445549576E
            48576D42526844576E3849613B4C624D607453697F55697F4E627951647B4254
            6B303E513B4F654458703D3D3D5A5A5A59595952525259595947474749494964
            64647272727272726868686B6B6B5454543636364E4E4E5B5B5B6285B76187B7
            6085B56388B66188B66086B352739A4457745B85B55982B35982B35B84B55B84
            B55681B55783B75983B6A3A3A3A4A4A4A1A1A1A4A4A4A4A4A4A1A1A18585855B
            5B5BA0A0A09D9D9D9D9D9DA0A0A0A0A0A09C9C9C9E9E9E9E9E9E6186B96086B9
            6186B76288B96389BA5F85B64F74A34058775D88BA5C86B75C85B65D86B75D87
            B85A84B75A85B95B84B7A4A4A4A4A4A4A3A3A3A5A5A5A7A7A7A1A1A18989895D
            5D5DA5A5A5A3A3A3A1A1A1A3A3A3A4A4A4A0A0A0A1A1A1A0A0A06388B96589B9
            678CB8698EBA688CBB6388B8567AA6475D7A648BB9648CB86089B66189B76088
            B75D86B76089B8668EBAA5A5A5A7A7A7AAAAAAACACACABABABA5A5A590909064
            6464A8A8A8A8A8A8A4A4A4A5A5A5A4A4A4A3A3A3A5A5A5ABABAB38475A44556B
            41566F4E637C4E637C4F657E4E647E4A5C764C5F794960785267814D627C4E63
            7C434C5B41546C3E51664242425656565959596B6B6B6B6B6B6E6E6E6C6C6C61
            61616565656565657070706969696B6B6B484848565656505050445B80537396
            5B84B45982B35881B25B84B55980B15D83B45C83B15882B35A83B55982B45982
            B34B5D745984B36087B36464648282829E9E9E9D9D9D9C9C9CA0A0A09A9A9A9E
            9E9E9D9D9D9D9D9D9E9E9E9D9D9D9D9D9D6161619E9E9EA1A1A1455E8358769A
            6489B76188B66085B76188B56087B35E86B75D87B55E86B55E87B75C86B85A84
            B84B5E765A86B75C86B6686868888888A5A5A5A4A4A4A1A1A1A4A4A4A1A1A1A3
            A3A3A3A3A3A1A1A1A3A3A3A3A3A3A0A0A0646464A1A1A1A1A1A1435670506681
            5A77985977985A779A5A79995C7A9B5B799D58789C5A799B5977975D7B9C5C7B
            9E43526557789B5D7B9E5959596F6F6F8888888888888989898B8B8B8C8C8C8C
            8C8C8B8B8B8B8B8B8888888E8E8E8F8F8F5252528989898F8F8F547297557397
            54739853719953719853729A4C6A914A5A7055749954759D52749F5375A05575
            9F51749E5375A051759E8282828484848484848282828282828484847979795D
            5D5D858585888888888888898989898989878787898989888888688CBA688CB9
            678BB86589B76589B76689B75C7FAD5D7289648BB8648AB86088BA6189BC6289
            B86088B96289BB648AB7AAAAAAAAAAAAA8A8A8A5A5A5A5A5A5A5A5A59797977E
            7E7EA8A8A8A7A7A7A5A5A5A7A7A7A5A5A5A5A5A5A7A7A7A7A7A76A8FBB6C91BD
            698EBA688DB96A8FBB678BB95D7FAE596D876B8FBD678EBB638CBA658CBE658B
            BB668DBA658CBD668CB9AEAEAEB0B0B0ACACACABABABAEAEAEA8A8A899999979
            7979AEAEAEACACACAAAAAAABABABAAAAAAABABABABABABAAAAAA44556A455871
            3D4E673E4E6645556C485A7344566D3C4D60485E75465C744A60774B61794C61
            794D5E73495E734153685656565B5B5B4E4E4E4E4E4E5757575E5E5E57575749
            49496262626060606565656767676767676262626161615353534C62847190B6
            6A8CB86689B5688BB7668BB7648AB6668CB8658AB8658BB8658AB86287B66083
            B04D65826289B66085B26C6C6CACACACAAAAAAA5A5A5A8A8A8A8A8A8A7A7A7AA
            AAAAA7A7A7A8A8A8A7A7A7A4A4A49D9D9D6F6F6FA5A5A5A0A0A04C60817394B9
            6A8DB96A8CB96B8DB9688CB9678BB7688CB8678BB8678BB9698EBB668BB86285
            B1526986628AB96286B5696969B2B2B2ABABABAAAAAAABABABAAAAAAA8A8A8AA
            AAAAA8A8A8A8A8A8ACACACA8A8A8A0A0A0757575A7A7A7A3A3A34B607C7295B8
            6D8EB96B8EBA6C90BC6B8EB9698CB86A8EBA678DB8698EBA698FBA678DB96488
            B2556C875F88B96087B9686868B2B2B2ACACACACACACAFAFAFACACACAAAAAAAC
            ACACAAAAAAACACACACACACABABABA3A3A3777777A5A5A5A4A4A4}
          NumGlyphs = 2
        end
        object btnPayChek: TBitBtn
          Left = 483
          Top = 2
          Width = 182
          Height = 26
          Anchors = [akLeft, akBottom]
          Caption = #1063#1045#1050' '#1055#1054' '#1058#1045#1056#1052#1048#1053#1040#1051#1059
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnClick = btnPayChekClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000000000000000000000000000000000000000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000080808080808080808080808080808080808080808080
            8080808080808080808080808080808080808080808080808080008000FFFFFF
            C0C0C0FFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080
            80C0C0C0808080000000808080FFFFFFC0C0C0FFFFFFFFFFFFC0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C0808080808080008000FFFFFF
            008000FFFFFFFFFFFFFFFFFF808080008000008000808080C0C0C0C0C0C0C0C0
            C0C0C0C0808080000000808080FFFFFF4B4B4BFFFFFFFFFFFFFFFFFF80808080
            80804B4B4B808080C0C0C0C0C0C0C0C0C0C0C0C0808080808080008000FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF008000008000808080808080C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080
            8080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080008000FFFFFF
            C0C0C0808080FFFFFF008000008000C0C0C0808080808080C0C0C0C0C0C08080
            80C0C0C0C0C0C0000000808080FFFFFFC0C0C0808080FFFFFF808080808080C0
            C0C0808080808080C0C0C0C0C0C0808080C0C0C0C0C0C0808080008000FFFFFF
            C0C0C0808080FFFFFF008000C0C0C0008000C0C0C0808080C0C0C0C0C0C08080
            80C0C0C0C0C0C0000000808080FFFFFFC0C0C0808080FFFFFF808080C0C0C080
            8080C0C0C0808080C0C0C0C0C0C0808080C0C0C0C0C0C0808080008000C0C0C0
            C0C0C0FFFFFFFFFFFFFFFFFF008000C0C0C0808080C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0000000808080C0C0C0C0C0C0FFFFFFFFFFFFFFFFFF808080C0
            C0C0808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080008000C0C0C0
            FFFFFFC0C0C0808080808080C0C0C0008000C0C0C0808080808080C0C0C0C0C0
            C0808080C0C0C0000000808080C0C0C0FFFFFFC0C0C0808080808080C0C0C080
            8080C0C0C0808080808080C0C0C0C0C0C0808080C0C0C0808080008000008000
            C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0
            C0808080C0C0C0000000808080808080C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C0808080008000008000
            0080000080000080000080000080000080000080000080000080000080000080
            0000800000800000000080808080808080808080808080808080808080808080
            80808080808080808080808080808080808080808080808080800000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
          NumGlyphs = 2
        end
      end
      object pnSkd: TPanel
        Left = 834
        Top = 0
        Width = 180
        Height = 377
        Anchors = [akTop, akRight, akBottom]
        BevelOuter = bvLowered
        TabOrder = 3
        DesignSize = (
          180
          377)
        object sbBSkd: TSpeedButton
          Left = 70
          Top = 79
          Width = 101
          Height = 21
          AllowAllUp = True
          GroupIndex = 3
          Caption = #1055#1088#1080#1074#1072#1090' '#1073#1072#1085#1082
          Visible = False
          OnClick = sbBSkdClick
        end
        object sbGoldG: TSpeedButton
          Left = 110
          Top = 94
          Width = 60
          Height = 21
          AllowAllUp = True
          GroupIndex = 3
          Caption = #1047#1086#1083#1086#1090#1099#1077' '#1074#1086#1088#1086#1090#1072
          Visible = False
          OnClick = sbGoldGClick
        end
        object sbFix: TSpeedButton
          Left = 5
          Top = 22
          Width = 104
          Height = 21
          AllowAllUp = True
          GroupIndex = 1
          Caption = #1060#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1072#1103
          OnClick = sbFixClick
        end
        object sbCard: TSpeedButton
          Left = 5
          Top = 43
          Width = 104
          Height = 21
          AllowAllUp = True
          GroupIndex = 1
          Caption = #1057' '#1082#1072#1088#1090#1086#1095#1082#1080
          OnClick = sbCardClick
        end
        object lbSkdTit: TLabel
          Left = 5
          Top = 2
          Width = 154
          Height = 15
          Caption = #1056#1077#1078#1080#1084' '#1089#1082#1080#1076#1086#1082': '#1074#1099#1082#1083#1102#1095#1077#1085
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object bvSkd: TBevel
          Left = 5
          Top = 18
          Width = 169
          Height = 2
        end
        object lbSkidkaTit: TLabel
          Left = 5
          Top = 312
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
        object lbSumTit: TLabel
          Left = 5
          Top = 272
          Width = 96
          Height = 15
          Caption = #1057#1091#1084#1084#1099' '#1087#1086' '#1095#1077#1082#1091':'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object bvSumms: TBevel
          Left = 5
          Top = 288
          Width = 169
          Height = 2
        end
        object lbNalTit: TLabel
          Left = 5
          Top = 292
          Width = 94
          Height = 13
          Caption = #1053#1072#1082#1086#1087#1083#1077#1085#1086' '#1075#1088#1085':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbAllTit: TLabel
          Left = 5
          Top = 332
          Width = 40
          Height = 13
          Caption = #1042#1089#1077#1075#1086':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbPercSkd: TLabel
          Left = 5
          Top = 225
          Width = 60
          Height = 13
          Caption = '% '#1089#1082#1080#1076#1082#1080':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object bvInfoSkd: TBevel
          Left = 5
          Top = 220
          Width = 169
          Height = 2
        end
        object lbDSkdTit: TLabel
          Left = 5
          Top = 204
          Width = 113
          Height = 15
          Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1089#1082#1080#1076#1082#1077':'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object lbNCard: TLabel
          Left = 5
          Top = 241
          Width = 57
          Height = 13
          Caption = #8470' '#1082#1072#1088#1090#1099':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbIndNal: TLabel
          Left = 100
          Top = 290
          Width = 73
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clGreen
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object lbIndSkd: TLabel
          Left = 110
          Top = 310
          Width = 63
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object lbIndAll: TLabel
          Left = 70
          Top = 330
          Width = 103
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object lbPrSkd: TLabel
          Left = 120
          Top = 223
          Width = 53
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object lbNCrd: TLabel
          Left = 65
          Top = 239
          Width = 108
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clMaroon
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          OnClick = lbNCrdClick
        end
        object lbPerc1: TLabel
          Left = 160
          Top = 29
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbPerc2: TLabel
          Left = 160
          Top = 47
          Width = 10
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbSumm: TSpeedButton
          Left = 150
          Top = 34
          Width = 101
          Height = 21
          AllowAllUp = True
          GroupIndex = 1
          Caption = #1057#1091#1084#1084#1072#1088#1085#1072#1103
          Visible = False
          OnClick = sbSummClick
        end
        object imAnnot: TImage
          Left = 40
          Top = 310
          Width = 14
          Height = 14
          AutoSize = True
          Picture.Data = {
            07544269746D61709E020000424D9E0200000000000036000000280000000E00
            00000E000000010018000000000068020000230B0000230B0000000000000000
            0000EBF2EAEBF2EAEBF2EAEBF2EAEBF2EAEBF2EA84947BEBF2EAEBF2EAEBF2EA
            EBF2EAEBF2EAEBF2EAEBF2EA0000EBF2EAEBF2EAEBF2EAEBF2EAEBF2EA528C8C
            D6DEDE84947B9CB59CEBF2EAEBF2EAEBF2EAEBF2EAEBF2EA0000EBF2EAEBF2EA
            EBF2EAEBF2EA84947B84EFFF8CF7FF9CBDC6CEC6C66B7B6BEBF2EAEBF2EAEBF2
            EAEBF2EA0000EBF2EAEBF2EAEBF2EAEBF2EA5ABDE77BEFF77BEFF773D6FF5ACE
            EFC6D6DE9C9C9494A594EBF2EAEBF2EA0000EBF2EAEBF2EAEBF2EA52849C6BDE
            FF73E7FF6BDEFF5ACEEF63CEFF5ABDF78CB5DEE7DED66B7B6BEBF2EA0000EBF2
            EAEBF2EA738C8473D6FF63C6FF5ACEEF5AD6F763C6FF5ACEEF63B5FF63ADF763
            9CE7D6E7DEADBDA50000EBF2EA9CB59C63ADF75ABDF75ABDF763C6FF63C6FF5A
            BDF763BDFF63ADF763ADF7639CF7427BE7BDD6B50000EBF2EA527BAD6BB5FF63
            ADF75AB5FF63ADF75ABDF763B5FF63ADF763A5FF639CF7528CF79CBDC6EBF2EA
            000063737B73ADFF639CF763A5FF63ADF763ADF763ADFF63A5FF63ADF7639CF7
            639CF77BA5D6EBF2EAEBF2EA00007394E7739CEF739CEF73ADF773ADF773B5FF
            73ADF773ADF76BA5F76394F75A8CD6EBF2EAEBF2EAEBF2EA00007B9CD67BA5D6
            94B5EF94B5EF94BDEF9CC6F79CBDE79CC6F79CBDE79CBDE7BDCEB5EBF2EAEBF2
            EAEBF2EA0000EBF2EAB5CED68CB5DEADCEEFB5CEF7B5CEF7B5D6F7BDD6F7FFFF
            FF94A594EBF2EAEBF2EAEBF2EAEBF2EA0000EBF2EAEBF2EAEBF2EAC6D6DEC6DE
            EFD6E7F7D6E7F7FFFFFFFFFFFFB5C6B5EBF2EAEBF2EAEBF2EAEBF2EA0000EBF2
            EAEBF2EAEBF2EAEBF2EAD6DEDEFFFFFFD6DEDEFFFFFFB5C6B5EBF2EAEBF2EAEB
            F2EAEBF2EAEBF2EA0000}
          Visible = False
        end
        object imNoScan: TImage
          Left = 45
          Top = 290
          Width = 21
          Height = 17
          AutoSize = True
          Picture.Data = {
            07544269746D617042010000424D420100000000000076000000280000001500
            0000110000000100040000000000CC000000130B0000130B0000100000001000
            000042424200084A8C000014A5000530AA001621E4003E4AE400716DFE009BA4
            E90025C6EA009CB7CE00BAC3DE00C1C1FF00FFDE8C00DEDEDE00DADAF300FFFF
            FF00CCCCCCCC5437CCCC64442000DDDFDFDE66527DA644429000DFFFDDDDB655
            2AB44429C000D0F000F007565355527CC000D0FF0FF0FDB6645539CCC000D0FF
            0FFA00F666641CCCC000D0F00FFFF0B6655549CCC000D0FF0FF00B666156527C
            C000D0FFFFFFB76728866529C000D0F00F0F7B61700756549000D0F00F0F7559
            F00DB5542000D0F00F0F0000F00ECCCCC000D0F00F0F0000F00DCCCCC000D0F0
            0F0F0000F00DCCCCC000D0F00F0F0000F00DCCCCC000DFFFFFFFFFFFFFFECCCC
            C000DDDDDDDDDDDDDDDDCCCCC000}
          Transparent = True
          Visible = False
        end
        object imRecipt: TImage
          Left = 10
          Top = 290
          Width = 16
          Height = 16
          AutoSize = True
          Picture.Data = {
            07544269746D617036030000424D360300000000000036000000280000001000
            000010000000010018000000000000030000D40E0000D40E0000000000000000
            0000D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D68989FF8989FF8989FFC6C6FF
            D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6BABAFF4848
            FF2A2AFF1A1AFF2A2AFF2A2AFF2A2AFF2A2AFF8989FFD8E4D6D8E4D6D8E4D6D8
            E4D6D8E4D6D8E4D6BABAFF1A1AFF2A2AFF3939FF4848FF4848FF5A5AFF4848FF
            4848FF2A2AFF5A5AFFD8E4D6D8E4D6D8E4D6D8E4D6C6C6FF1A1AFF2A2AFF4848
            FF5A5AFF6A6AFF6A6AFF6A6AFF6A6AFF5A5AFF5A5AFF3939FF5A5AFFD8E4D6D8
            E4D6D8E4D60909FF2A2AFF4848FF5A5AFF7979FF7979FF8989FF8989FF8989FF
            7979FF6A6AFF4848FF3939FF9898FFD8E4D67979FF1A1AFF3939FF5A5AFF6A6A
            FF8989FFA8A8FFA8A8FFA8A8FFA8A8FF9898FF7979FF6A6AFF4848FF2A2AFFD8
            E4D64848FF2A2AFF4848FF6A6AFF8989FF9898FFBABAFFC6C6FFC6C6FFC6C6FF
            A8A8FF9898FF7979FF5A5AFF3939FFC6C6FF0909FF2A2AFFFBFBFFFBFBFFFBFB
            FFFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFA8A8FF3939FF89
            89FF0909FF2A2AFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBFFFBFBFF
            FBFBFFFBFBFFFBFBFFA8A8FF4848FF9898FF0909FF2A2AFF9898FFBABAFFBABA
            FFD7D7FFD7D7FFD7D7FFFBFBFFD7D7FFD7D7FFC6C6FFBABAFF7979FF3939FF89
            89FF8989FF2A2AFF4848FF5A5AFF7979FF9898FFA8A8FFBABAFFBABAFFA8A8FF
            A8A8FF8989FF6A6AFF5A5AFF3939FFD8E4D6BABAFF1A1AFF2A2AFF5A5AFF6A6A
            FF7979FF9898FF9898FF9898FF9898FF8989FF6A6AFF6A6AFF3939FF5A5AFFD8
            E4D6D8E4D64848FF1A1AFF3939FF4848FF6A6AFF7979FF7979FF8989FF7979FF
            6A6AFF6A6AFF3939FF2A2AFFC6C6FFD8E4D6D8E4D6D8E4D64848FF2A2AFF3939
            FF4848FF4848FF5A5AFF5A5AFF5A5AFF4848FF3939FF3939FFC6C6FFD8E4D6D8
            E4D6D8E4D6D8E4D6D8E4D64848FF1A1AFF3939FF3939FF3939FF3939FF3939FF
            3939FF2A2AFFC6C6FFD8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6BABA
            FF8989FF1A1AFF1A1AFF1A1AFF5A5AFF8989FFD8E4D6D8E4D6D8E4D6D8E4D6D8
            E4D6}
          Transparent = True
          Visible = False
        end
        object sbProf: TSpeedButton
          Left = 140
          Top = 36
          Width = 101
          Height = 21
          AllowAllUp = True
          GroupIndex = 2
          Caption = #1055#1088#1086#1092#1072#1088#1084#1072
          Visible = False
          OnClick = sbProfClick
        end
        object sbMag: TSpeedButton
          Left = 5
          Top = 85
          Width = 170
          Height = 21
          AllowAllUp = True
          GroupIndex = 4
          Caption = #1060#1083#1072#1077#1088#1099' '#1089#1086' '#1096#1090#1088#1080#1093#1082#1086#1076#1072#1084#1080
          ParentShowHint = False
          ShowHint = True
          OnClick = sbMagClick
        end
        object imAvto: TImage
          Left = 10
          Top = 315
          Width = 16
          Height = 16
          AutoSize = True
          Picture.Data = {
            07544269746D617036030000424D360300000000000036000000280000001000
            000010000000010018000000000000030000130B0000130B0000000000000000
            0000D8E4D6D8E4D6D8E4D6D8E4D6C6C6C6A6A8A77D703663581F73705CA0A09F
            BFBFBFD8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4
            D6D8E4D6A39030625201948C66D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8
            E4D6D8E4D6D8E4D6D8E4D6D8E4D6E4D274CCB218B59702A48A01937A01927F1B
            B1A777D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6E2CF68E5C0
            01DFBA01D6B301CAAA00B89B00A68B00927B027A6720D8E4D6D8E4D6D8E4D6D8
            E4D6D8E4D6D8E4D6D8E4D6E3BF09ECC501C2A404CEAC04A48B04BFA105CCAC00
            B69B009F85029B8A3DD8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6E2CB50DEC0
            1B7C6B11CEAF0A8672029A8A42E5C402DAB700C7A7019D8307D8E4D6D8E4D6D8
            E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6DEC5347A6804A7931EECCE02
            E9C800DDB900B79C08D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4
            D6C5BA72C0A913CAB404D4B901E4CF01EAD300E0C101D4BE43D8E4D6D8E4D6D8
            E4D6D8E4D6D8E4D6D8E4D6D8E4D6897407917B01AD9701C6B501D3C401CDBB01
            DFD201DCC713D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6AD9B368B74
            008872009F8700BFA601D1B903B39E04C8BD3BD8E4D6D8E4D6D8E4D6D8E4D6D8
            E4D6D8E4D6D8E4D6D8E4D6C7B136A78E01927A028F7902998303BFB36BD8E4D6
            D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6E9D568D4B3
            018D7604977F047F6C029086534C4411827A51D8E4D6D8E4D6D8E4D6D8E4D6D8
            E4D6D8E4D6D8E4D6D8E4D6D8E4D6EECA0CDBB704C9A8038C7404A88D038E7905
            6657035B4D04D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4
            D6F0CD0EF3CD02EAC401DBB701CAAA01B89B02A18F2BD8E4D6D8E4D6D8E4D6D8
            E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6F9DC29F7D102F5CE03ECC501
            DDBA06E6DDA2D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8E4
            D6D8E4D6F7ECA8E1D27CF3EAA8F7E899D8E4D6D8E4D6D8E4D6D8E4D6D8E4D6D8
            E4D6}
          Visible = False
        end
        object sbMediCard: TSpeedButton
          Left = 5
          Top = 106
          Width = 85
          Height = 21
          AllowAllUp = True
          GroupIndex = 4
          Caption = #1058#1077#1088#1072#1087#1080#1103
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000000000000000000000000000000000000000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF80808080808080
            80808080808080808080800000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FFC0C0C00000000000000000000000000000008080800000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FFFFFFFFFFFFFF
            FFFFFFFFFF0000008080800000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFF0000008080800000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FFFFFFFFFFFFFF
            FFFFFFFFFF0000008080808080808080808080808080800000FFC0C0C0000000
            000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000
            000000008080800000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000008080800000FF000000FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF0000008080800000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000008080800000FF000000FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF0000008080800000FFC0C0C0000000000000000000000000FFFFFFFFFFFFFF
            FFFFFFFFFF000000000000000000000000C0C0C00000FF0000FF0000FF0000FF
            0000FF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FFFFFFFFFFFFFF
            FFFFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFC0C0C000000000000000
            0000000000C0C0C00000FF0000FF0000FF0000FF0000FF0000FF}
          Layout = blGlyphRight
          OnClick = sbMediCardClick
        end
        object sbMDMU: TSpeedButton
          Left = 160
          Top = 106
          Width = 85
          Height = 21
          AllowAllUp = True
          GroupIndex = 4
          Caption = 'MDMU 482'
          Visible = False
          OnClick = sbMDMUClick
        end
        object lbMB: TLabel
          Left = 5
          Top = 256
          Width = 36
          Height = 13
          Caption = #1041#1072#1083#1099':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object lbMBInfo: TLabel
          Left = 70
          Top = 255
          Width = 103
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Visible = False
        end
        object sbMDMU1: TSpeedButton
          Left = 5
          Top = 127
          Width = 170
          Height = 21
          AllowAllUp = True
          GroupIndex = 4
          Caption = #1056#1072#1076#1080#1046#1080#1079#1085#1080'\'#1055#1086#1089#1084#1110#1093#1072#1081#1089#1103','#1059#1082#1088#1072#1111#1085#1086
          OnClick = sbMDMUClick
        end
        object lbTime: TLabel
          Left = 109
          Top = 179
          Width = 66
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'lbTime'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object imFind: TImage
          Left = 78
          Top = 197
          Width = 57
          Height = 17
          AutoSize = True
          Picture.Data = {
            07544269746D6170A20B0000424DA20B00000000000036000000280000003900
            00001100000001001800000000006C0B0000130B0000130B0000000000000000
            0000FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFE
            FDFDFDFCFCFDAEB0B0657666D0D3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFEFDFDFDE2E2E2ACADD36F71B5989997818980FBFCFCFEFD
            FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFEFEFEFEFEFEFDFDFDFDFDFDFEFEFEFBFBFBD5D4D89B9BB71817B81614
            DE4847AEE6E1E7FEFEFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFEFEFEF7F7F7E1E1E1D0D0D0CACACAC9C9C9CFCFCFCFCF
            CFB3B6BE2323B50E0EE00606C29D9CDFFCFDFCFEFEFEFEFEFEFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FEFEFEEBEBEBCACACAD9D9D9E7E7
            E7E5E5E5DEDEDED3D3D3C2C2C0484B9A0D0DDF0C0BBFBCBDE6FDFDFCFEFEFEFF
            FEFFFEFEFEFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFF
            FFFFFF808080808080808080FFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF8080
            80FFFFFFFFFFFF808080808080808080FFFFFFFFFFFF808080FFFFFFFFFFFFFF
            FFFF808080FFFFFF808080FFFFFFFFFFFF808080FFFFFFFFFFFF80808000F9F9
            F9CACACAD2D2D2FAFAFAF8F8F8EDEDEDEFEFEFEDEDEDA9A9AA9796BC2D31BF76
            74BCF6F8F4FDFDFDFFFEFEFFFFFFFEFEFEFFFFFF808080FFFFFFFFFFFFFFFFFF
            FFFFFF808080FFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF808080FFFFFF8080
            80808080FFFFFFFFFFFF808080FFFFFF808080FFFFFFFFFFFFFFFFFF808080FF
            FFFF808080FFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00F5F5F5C6C6C6BEBEBEB6B6B6AEAEAE9D9D9D86868690
            9090AFAFADD4D2D3BCB6B4BDBDBDE5E2E3FDFEFBFFFEFEFFFFFFFEFEFEFFFFFF
            808080FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFF808080FFFFFFFFFF
            FFFFFFFF808080FFFFFF808080FFFFFF808080FFFFFF808080FFFFFF808080FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF808080FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FBFBFBC2C3C3B1B1B1B6
            B5B4C7C5C4CFCAC9CDC7C8C9CACAD5D6D5C9C5C4E3E0DFC6C8C7DEDEDEFEFEFE
            FFFFFFFFFFFFFEFEFEFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFF808080FFFF
            FFFFFFFF808080FFFFFFFFFFFFFFFFFF808080FFFFFF808080FFFFFFFFFFFF80
            8080808080FFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00E2E2E2A2A3A3B2B2B2C6C3C3D3CBCBE0D4D5E8DBDCE2D8D9D5D2D29F9D9D
            9F9F9ECCCDCDF0F0F0FEFEFEFFFFFFFFFFFFFEFEFEFFFFFF808080FFFFFFFFFF
            FFFFFFFFFFFFFF808080FFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF808080FF
            FFFF808080FFFFFFFFFFFFFFFFFF808080FFFFFF808080FFFFFFFFFFFFFFFFFF
            808080FFFFFF808080FFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00B9B9B9818181F4F2F2E3E3E3CFCFCECCC7C7
            D2C9C9D8CBCCDACFCFCECACA787979D7D7D7FCFCFCFEFEFEFFFFFFFFFFFFFEFE
            FEFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF80
            8080808080808080FFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF808080FFFFFF
            FFFFFF808080808080808080FFFFFFFFFFFF808080FFFFFFFFFFFF808080FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00AEAEAE8A8686
            FAF3F3FDFCFCF7F8F8F1EFEFE8E4E4E4DCDCE6DBDBD4CDCCA6A6A6B1B1B1FEFE
            FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFF80
            8080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00B8B8B8887F7FF8ECECFBF6F6FDFEFEFDFEFEFDFEFEFCFAFAF9F3
            F3F3ECEBB2B2B2A0A0A0FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF
            FFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00D2D2D2847C7DE3D2D3F6EAE9FCF7
            F8FEFEFEFDFEFEFEFEFEFEFBFBFAF6F7B2B0B0B0B0B0FEFEFEFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF808080808080808080808080808080808080FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00E9E9
            E9B0ACAC9E8E8FF0E3E2F6EAEBFAF3F3FDFBFBFEFEFEFEFEFEEFEEEEA5A5A5D9
            D9D9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FDFDFDDCDEDDB1ABABC8C0C0E7DADBF5E7E8F7ECEDF9
            F2F3E4E1E1A3A3A3B4B5B5FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFAFBFBE4E3E3CE
            CBCB9E95959D8E8FB9AFAFA8A2A2989695AEAEAEEFEFEFFEFEFEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFEFFFFFBFDFDEEF0F0E0E2E2CBCDCDC3C1C1C7C6C6D4D4D4F5F5F5
            FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00}
          OnClick = imFindClick
        end
        object Image1: TImage
          Left = 8
          Top = 177
          Width = 16
          Height = 16
          Picture.Data = {
            07544269746D617036030000424D360300000000000036000000280000001000
            000010000000010018000000000000030000130B0000130B0000000000000000
            0000DBDADABFBCBDB7B4B5B5B3B4B5B2B2B4B1B2B3B0B1AFACADA5A1A3A9A5A7
            B2AFB1B8B5B6BAB8B9B9B7B8BAB8B9CFCECFE9E9E9F1F1F1F3F3F2F4F2F2F3F2
            F2F3F2F1F3F2F1F3F2F2EDEDEDAEAAAC959193B0ADAEC3C1C2D0CFD0E4E3E4C7
            C5C6EAEAEAF3F2F2F3F2F3F2E6DCE5AA76E29A58E4A670EFE0D3F4F3F3E1E0E1
            8681838B8688ABA9AAC2C1C2D8D7D8C4C2C3EDEDEDF3F3F3F5F3F4E49751E29A
            5BEBCDB5E4A873DB873DF0ECEAE7E6E6ADABAC9C999A817C7FA6A4A5C7C7C7C3
            C2C3EDEDEDF2F2F2F2F1F2EBC29FEEDDD2F0EEF0EDDED1D87D2CEBDDD2E6E5E6
            BCBABBB9B7B8A5A2A37B7678A7A4A5C2C1C2EEEEEEEFEFEFEEEDEDEFEDEEEADF
            D9DFC5B3D7A377D38643ECE8E8E7E6E7D5C1B1C27C42D0CECED0CFD0ABA8A9B8
            B7B8EEEEEFECEBECE9E8E9EAE8E9DFC3ACC98045BF6C2BD8BAA3EAE8EBE4E3E4
            D8BFABC67631D0CECED2D2D2E5E5E5BFBEBEECECECE7E7E7E5E4E4E5E4E4E5E3
            E5E5E4E8D6B7A0BC7136E4E1E2E1DFE1D8BEA9CB7D37D3D1D2D3D2D2DCDBDBD5
            D5D5EBEBEBE3E2E3E0DFE0CA956BCCA282E0E0E4D4B8A2BD6F32DFDBDDDAD5D5
            D2B49DC97F3CD5D3D5D4D3D4D8D8D8D7D6D7E9E9E9DEDEDFDBDADBD3BBAAC074
            36C38553BE7234CAA283DAD9DBC69D81B0642DB86D34D3D2D3D2D2D2D5D5D6D6
            D6D6E6E6E7D2D2D4CFCED0CFCED1CEC7C6C9B7AACCC2BDD0CFD2CFCDD0CECDD0
            CDCCCFC6BBB6CAC9CBC9C8CACCCCCED2D1D2D7C0AEB99174B79072B78F71B58C
            70B68E71B78E72B78E71B78F71B68D70B48B6EB1876BB0866AB0876BB28A6DBF
            A290DAAE86C4793CC1793DBB763C99694AB87036BE763ABE7539BD7438BC7438
            B97035956647AB642DB96E34BB6E33C28B62D8AD89C0773DBD773EB17D549C99
            9BAE6C39B9733CB8723BB8713AB7713AB274459D9C9F9F6336B56D36B86D34BF
            8A63D8B18FBF7C46BB7945B97844B47342B77643B67542B57441B47340B37240
            B3713FAF6D3DB4703EB46F3CB7713BC08E69F7F4F0F2E8D9F2E6D8F2E6D8F2E6
            D8F2E6D8F2E6D8F2E6D8F2E6D8F2E6D8F2E5D7F2E4D7F2E3D6F2E3D5F2E3D5F5
            EFE9}
        end
        object sbFix10: TSpeedButton
          Left = 5
          Top = 64
          Width = 115
          Height = 21
          AllowAllUp = True
          GroupIndex = 1
          Caption = #1043#1077#1087#1090#1088#1072#1083'('#1056#1040#1047#1054#1052')-30%'
          OnClick = sbFix10Click
        end
        object SpeedButton2: TSpeedButton
          Left = 90
          Top = 106
          Width = 85
          Height = 21
          AllowAllUp = True
          GroupIndex = 4
          Caption = #1054#1088#1072#1085#1078' '#1082#1072#1088#1076
          OnClick = SpeedButton2Click
        end
        object sbiApt: TSpeedButton
          Left = 120
          Top = 64
          Width = 55
          Height = 21
          AllowAllUp = True
          GroupIndex = 5
          Caption = 'i-'#1040#1087#1090#1077#1082#1072
          OnClick = sbiAptClick
        end
        object sbDoctor: TSpeedButton
          Left = 5
          Top = 148
          Width = 80
          Height = 21
          AllowAllUp = True
          GroupIndex = 6
          Caption = #1042#1088#1072#1095#1080
          OnClick = sbiAptClick
        end
        object Label26: TLabel
          Left = 5
          Top = 352
          Width = 102
          Height = 13
          Caption = #1052#1072#1082#1089'. '#1089#1091#1084'. '#1089#1087#1080#1089'.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbMaxSumSpis: TLabel
          Left = 110
          Top = 350
          Width = 63
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clPurple
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object sbBaer: TSpeedButton
          Left = 85
          Top = 148
          Width = 90
          Height = 21
          AllowAllUp = True
          GroupIndex = 1
          Caption = #1050#1089#1072#1088#1077#1083#1090#1086' 42.8%'
          OnClick = sbBaerClick
        end
        object stPercSkd: TStaticText
          Left = 110
          Top = 46
          Width = 46
          Height = 17
          Alignment = taRightJustify
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = '0 '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object cbFixSkd: TComboBox
          Left = 110
          Top = 22
          Width = 46
          Height = 21
          Style = csDropDownList
          DropDownCount = 25
          ItemHeight = 13
          TabOrder = 0
          OnChange = cbFixSkdChange
        end
        object tmpButton: TButton
          Left = 105
          Top = 295
          Width = 70
          Height = 26
          Anchors = [akLeft, akBottom]
          Caption = 'tmpButton'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 14214358
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = False
          OnClick = tmpButtonClick
        end
        object tmChek: TButton
          Left = 50
          Top = 270
          Width = 120
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'tmpChek'
          TabOrder = 3
          OnClick = tmChekClick
        end
        object lbDate: TDateTimePicker
          Left = 29
          Top = 175
          Width = 78
          Height = 21
          Date = 41795.731432048610000000
          Time = 41795.731432048610000000
          TabOrder = 4
        end
      end
      object pnBlChek: TPanel
        Left = -630
        Top = 190
        Width = 631
        Height = 106
        TabOrder = 4
        Visible = False
        DesignSize = (
          631
          106)
        object Label11: TLabel
          Left = 20
          Top = 5
          Width = 586
          Height = 96
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = False
          Caption = #1063#1045#1050' '#1079#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085'. '#1052#1086#1078#1085#1086' '#1090#1086#1083#1100#1082#1086' '#1087#1086#1087#1099#1090#1072#1090#1100#1089#1103' '#1077#1075#1086' '#1079#1072#1082#1088#1099#1090#1100' '#1077#1097#1077' '#1088#1072#1079'! '
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Layout = tlCenter
          WordWrap = True
        end
      end
    end
    object pnMainBottom: TPanel
      Left = 3
      Top = 436
      Width = 1014
      Height = 173
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        1014
        173)
      object pnShowSumm: TPanel
        Left = 800
        Top = 0
        Width = 214
        Height = 173
        Anchors = [akTop, akRight, akBottom]
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          214
          173)
        object imCash: TImage
          Left = 185
          Top = 119
          Width = 24
          Height = 24
          AutoSize = True
          Picture.Data = {
            07544269746D617076060000424D760600000000000036040000280000001800
            000018000000010008000000000040020000D30E0000D30E0000000100000001
            00006B6363006BAD6300525A6B00736B6B0073736B00636B73006B6B73007373
            73007B7B73006B737B007B847B0084847B00737B84007B7B8400848C84008C8C
            8C008C948C0094948C008CBD8C00848C94008C8C940094949400949C94009494
            9C00949C9C009C9C9C009CA59C009CC69C009C9CA50094A5A5009CA5A5009CAD
            A500A5ADA500A5ADAD00A5B5AD00ADB5AD00A5ADB500ADB5B500ADBDB500B5BD
            B500ADCEB500B5BDBD00B5C6BD00B5C6C600BDC6C600BDCEC600C6CECE00C6D6
            CE00C6D6D600CED6D600CEE7DE00D6E7E700DEEFEF00FF00FF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00353535353535353535353535353535353535353535353535353535353535
            3535353535353535353535353535353535353535353535353535353535353535
            353535353535353535353535353535353535353535353535353535351C171C1C
            353535353535353535353535353535353535351C020506131C35353535353535
            353535353535353535353509290C0D2125351008080808080808080808080808
            0808080C2E2B240C21081029292521252523262925292A292929291C142E2929
            310810210B3434343426252E0B0B1A15231A342C1C13130B1908100B21343434
            3434341000072A0B0B3434343434342C0B0810103434342E2E343410030A1A04
            0F3432011B3434341108101634342E0F0F2E3410040B270F1034120101343433
            1608100B2C342E0F1D2E34340A212A1A1E3432122834342F1A0810160B31342E
            2E3434340E2930082E343434343434200B08101E25253434343434342B221F26
            3434343434342D10290810181021212129212121252221251F26232021290B10
            1E08101821251818212121181821212118182121181821212108101010101010
            1010101010101010101010101010101010103510183131343434343431212118
            1010103535353535353535351021213131312121181010103535353535353535
            3535353510182121211810101035353535353535353535353535353535101810
            1010353535353535353535353535353535353535351010353535353535353535
            3535353535353535353535353535353535353535353535353535353535353535
            3535}
          Transparent = True
        end
        object pnIndicator: TPanel
          Left = 3
          Top = 3
          Width = 208
          Height = 41
          BevelOuter = bvLowered
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -32
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 0
          object ImIndicator: TImage
            Left = 0
            Top = 0
            Width = 206
            Height = 39
            Transparent = True
          end
        end
        object lbChek: TStaticText
          Left = 3
          Top = 45
          Width = 208
          Height = 17
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = 'lbChek'
          Color = clBlack
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clYellow
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 1
        end
        object pnCash: TPanel
          Left = 3
          Top = 64
          Width = 208
          Height = 53
          BevelOuter = bvLowered
          TabOrder = 2
          object sb1: TSpeedButton
            Tag = 1
            Left = 85
            Top = 2
            Width = 24
            Height = 24
            Caption = '1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = sb1Click
          end
          object sb2: TSpeedButton
            Tag = 2
            Left = 109
            Top = 2
            Width = 24
            Height = 24
            Caption = '2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = sb1Click
          end
          object sb5: TSpeedButton
            Tag = 5
            Left = 133
            Top = 2
            Width = 24
            Height = 24
            Caption = '5'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = sb1Click
          end
          object sb10: TSpeedButton
            Tag = 10
            Left = 157
            Top = 2
            Width = 24
            Height = 24
            Caption = '10'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = sb1Click
          end
          object sb20: TSpeedButton
            Tag = 20
            Left = 181
            Top = 2
            Width = 24
            Height = 24
            Caption = '20'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = sb1Click
          end
          object sb200: TSpeedButton
            Tag = 200
            Left = 157
            Top = 26
            Width = 24
            Height = 24
            Caption = '200'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = sb1Click
          end
          object sbClear: TSpeedButton
            Left = 85
            Top = 26
            Width = 24
            Height = 24
            Caption = 'C'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            OnClick = sbClearClick
          end
          object sb50: TSpeedButton
            Tag = 50
            Left = 109
            Top = 26
            Width = 24
            Height = 24
            Caption = '50'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = sb1Click
          end
          object sb100: TSpeedButton
            Tag = 100
            Left = 133
            Top = 26
            Width = 24
            Height = 24
            Caption = '100'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = sb1Click
          end
          object sb500: TSpeedButton
            Tag = 500
            Left = 181
            Top = 26
            Width = 24
            Height = 24
            Caption = '500'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = sb1Click
          end
          object lbOtPOkup: TLabel
            Left = 5
            Top = 5
            Width = 68
            Height = 16
            Caption = #1054#1090' '#1087#1086#1082#1091#1087'.'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
          object edCash: TEdit
            Left = 3
            Top = 25
            Width = 80
            Height = 25
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 0
            Text = '0'
            OnChange = edCashChange
            OnKeyPress = edCashKeyPress
          end
        end
        object lbSumCash: TStaticText
          Left = 60
          Top = 120
          Width = 121
          Height = 22
          Alignment = taRightJustify
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = '0.00 '
          Color = clBlack
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clAqua
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentColor = False
          ParentFont = False
          TabOrder = 3
        end
        object lbCash: TStaticText
          Left = 3
          Top = 121
          Width = 56
          Height = 21
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = #1057#1076#1072#1095#1072':'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 4
        end
        object btnPayCash: TBitBtn
          Left = 3
          Top = 145
          Width = 208
          Height = 26
          Anchors = [akRight, akBottom]
          Caption = ' '#1054#1055#1051#1040#1058#1040' '#1053#1040#1051#1048#1063#1053#1067#1052#1048
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = btnPayCashClick
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000400B0000400B000000000000000000000000FF0000FF
            0000FF0000FF0000FF0000FF9DB6B785A8AA83A0A198A3A30000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFB3B3B3A4
            A4A49D9D9DA1A1A10000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF71B7BE20B1BE08C3D208A8AF073E40047E811A91936073730000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFB1B1B1A4A4A4B2B2B298
            98983838387171718484847070700000FF0000FF0000FF0000FF0000FF0000FF
            0000FF36BACA08CBDE03D8EB09B8C563A5AA83828106595D01BEC001CCCF196E
            6F0000FF0000FF0000FF0000FF0000FF0000FFB0B0B0BBBBBBC6C6C6A8A8A89F
            9F9F818181515151A9A9A9B6B6B66464640000FF0000FF0000FF0000FF0000FF
            3BC3D708CFE706D2E9149CAA617D81C5C8C8E0E1E2717373202C2C026E7101E0
            E31883830000FF0000FF0000FF0000FFBABABAC0C0C0C2C2C29191917B7B7BC7
            C7C7E1E1E17272722A2A2A636363C8C8C87777770000FF0000FF0000FF83C8D3
            0FCAE605D1EC28BBCDA7C2C5E8EBEBF2F3F5F5F6F6F5F5F5D3D1D148403F0193
            9601E3E85797980000FF0000FFC3C3C3BDBDBDC2C2C2B0B0B0BFBFBFEAEAEAF3
            F3F3F5F5F5F5F5F5D1D1D1404040838383CBCBCB9090900000FF0000FF51C3DA
            08C9E80AC6E377BFCBDBEBECE5EBECACC3C893B1B3DFE2E1FBFAFAC6C0BF0C64
            6801F6FB18B1B3B8C0C00000FFBDBDBDBDBDBDBABABABABABAE9E9E9EAEAEAC1
            C1C1AEAEAEE1E1E1FAFAFAC0C0C05B5B5BDCDCDCA0A0A0BFBFBF0000FF2AC3E3
            03C3E707C5E343BBCF7BB8C3819599306067496164CCCFCFFDFCFCE8E3E31D88
            8D00F3FC00D2D899BABA0000FFBBBBBBB8B8B8B9B9B9B3B3B3B4B4B49494945C
            5C5C5F5F5FCECECEFCFCFCE3E3E37D7D7DDADADABCBCBCB6B6B60000FF2BC1E3
            03BFE603C5E810C1E24098A799A3A6CBCDCDEAECEBF9FAFBFBFCFDCAD5D70CC3
            CF00F0FD00DDE685BCBE0000FFBABABAB6B6B6BABABAB7B7B7929292A2A2A2CC
            CCCCEBEBEBFAFAFAFCFCFCD4D4D4B2B2B2D9D9D9C7C7C7B6B6B60000FF3BC0E3
            03BAE303C1E72FB6D1C8D9DCF2F5F3F7F8F7F7F8F8F0F1F1C6D0D249C0CC01E5
            F600EAF800DCE887C2C60000FFBBBBBBB2B2B2B7B7B7AFAFAFD8D8D8F4F4F4F7
            F7F7F7F7F7F0F0F0CFCFCFB6B6B6D1D1D1D4D4D4C7C7C7BCBCBC0000FF83C0D3
            04B7E004BCE565BCD1F3F8F6FAFAFAC5C7C68395985170750E303403545E01BC
            CB00E9FA00D7E69FC8CB0000FFBEBEBEAFAFAFB4B4B4B8B8B8F6F6F6FAFAFAC6
            C6C69393936E6E6E2D2D2D4E4E4EABABABD4D4D4C3C3C3C4C4C40000FFADC5CD
            0CB6E002B7E356B6D0F6F7F6FBFBFB8C8C8C454D4FB7BDBEC7C3C3666B6C00B1
            C200E5F818D1DF0000FF0000FFC4C4C4AFAFAFB0B0B0B3B3B3F6F6F6FBFBFB8C
            8C8C4C4C4CBCBCBCC3C3C36A6A6AA2A2A2D1D1D1C0C0C00000FF0000FF0000FF
            86BED203B1E111ABD3B9CFD6FAFCFAFBFCFCFAFAFAFCFDFEF5F3F260C0CE00D5
            EE00DBF173D1DB0000FF0000FF0000FFBDBDBDACACACA6A6A6CECECEFBFBFBFB
            FBFBFAFAFAFDFDFDF2F2F2B9B9B9C5C5C5C9C9C9C9C9C90000FF0000FF0000FF
            0000FF7CBCD31AAEDC13A9CE7DB7CAD9E3E7F3EEED9BBBC147BACF01CBE800D6
            F054D0E00000FF0000FF0000FF0000FF0000FFBBBBBBABABABA3A3A3B6B6B6E3
            E3E3EEEEEEB9B9B9B3B3B3BDBDBDC6C6C6C7C7C70000FF0000FF0000FF0000FF
            0000FF0000FFA2C3CE36B6DC02A7D874B3C5A3B8BE01A3C500CAED43C9E07BCB
            D80000FF0000FF0000FF0000FF0000FF0000FF0000FFC2C2C2B3B3B3A3A3A3B1
            B1B1B7B7B79B9B9BBEBEBEC1C1C1C6C6C60000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FFABC5CE93BFCD85BDCC85C5D698C8D20000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFC4C4C4BE
            BEBEBBBBBBC3C3C3C5C5C50000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
          NumGlyphs = 2
        end
      end
      object pnChek: TPanel
        Left = 0
        Top = 0
        Width = 798
        Height = 173
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvLowered
        TabOrder = 0
        DesignSize = (
          798
          173)
        object dbgChek: TDBGrid
          Left = -1
          Top = -1
          Width = 799
          Height = 174
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = 13037309
          DataSource = DM.srChek
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          PopupMenu = pmMain
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Visible = False
          OnCellClick = dbgChekCellClick
          OnDrawColumnCell = dbgChekDrawColumnCell
          OnDblClick = dbgChekDblClick
          OnKeyDown = dbgChekKeyDown
          OnKeyPress = dbgChekKeyPress
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'art_code'
              Title.Alignment = taCenter
              Title.Caption = #1050#1054#1044
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'names'
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 277
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'kol'
              Title.Alignment = taRightJustify
              Title.Caption = #1050#1086#1083'-'#1074#1086
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cena'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taRightJustify
              Title.Caption = #1062#1077#1085#1072
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sumrow'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taRightJustify
              Title.Caption = #1057#1091#1084#1084#1072'  '
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'skd'
              Title.Alignment = taRightJustify
              Title.Caption = '% '#1089#1082#1080#1076#1082#1080
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sumskd'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clPurple
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taRightJustify
              Title.Caption = #1057#1091#1084'. '#1085#1072#1082#1086#1087#1083'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 77
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PL1'
              Title.Alignment = taCenter
              Title.Caption = #1054#1089#1085'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PL2'
              Title.Alignment = taCenter
              Title.Caption = #1042#1080#1090#1088'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PL3'
              Title.Alignment = taCenter
              Title.Caption = #1057#1082#1083'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 40
              Visible = True
            end>
        end
      end
    end
  end
  object stMain: TStatusBar
    Left = 0
    Top = 671
    Width = 1020
    Height = 21
    Panels = <
      item
        Width = 150
      end
      item
        Width = 110
      end
      item
        Width = 300
      end
      item
        Width = 120
      end
      item
        Width = 150
      end
      item
        Width = 300
      end>
  end
  object pnHead: TPanel
    Left = 0
    Top = 0
    Width = 1020
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      1020
      60)
    object Shape4: TShape
      Left = 494
      Top = 14
      Width = 300
      Height = 43
      Anchors = [akLeft, akTop, akRight]
    end
    object DBText1_: TDBText
      Left = 495
      Top = 15
      Width = 298
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Descr'
      DataSource = DM.srSprTov
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      WordWrap = True
    end
    object lbNumCard50: TLabel
      Left = 934
      Top = 10
      Width = 33
      Height = 17
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '!!!!!'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object imSale: TImage
      Left = 10
      Top = 10
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D6170360C0000424D360C00000000000036000000280000002000
        0000200000000100180000000000000C00000000000000000000000000000000
        0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4A6C9DB94C7E178BDE173B2D6
        519CC74B8EB74581A83F739838658858779157758F7D96A999AEBCC8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C0CDD590C1DC63B9E762BBEB7BC6ED7FC7EB66BBE8
        4CAFE737A6E62B93D01D7CB4196593105680175881235F882F658D3D72997EA1
        BABECAD1C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D469B3DD56B3E762BFF07BD1F690E1FB89E0FC68CDFA
        49BAF636A9EA2B94D11D7EB50E6698055887075D8D0E6B9E1676AC227CB03278
        A83A7EAE4581A83F739838658858779157758F7D96A9A3B5C1C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D453ADE053C3FC69D0FE87D8FAB5E5F8C7E8F6B8E4F9
        98D9F797DBFA97E0FF78CCF363B8E16FB9DE63A5C94F97BF2984B61E86BD278F
        C8377CAE155A9A0F4D870D43720E436E16507A235F882F658D3D72997EA1BABE
        CAD1C8D0D4C8D0D4C8D0D453ADE057C4FB93DCFDB0ECFC9EEEFD7EE0FA74D3F7
        69C5EE61B7E1539FCA4B8EB74581A83F73983B6C90557E9C4F80A33880AD2A86
        BB377CAE155B9A0F4E880843760341700650830E6A9E1676AC227CB03278A851
        8AB4C8D0D4C8D0D4C8D0D453ADE081D8FA9CEFFA7ED3F161BCEA62BBEB7BC6ED
        7FC7EB66BBE84CAFE737A6E62B93D01D7CB4196593105680175881235F882F65
        8D356D98417EAF3B7EB5367AAF4688B94D8EB94D95BF2984B61E86BD278FC837
        7CAEC8D0D4C8D0D4C8D0D44CA6D968CAEA5EBBE656B3E762BFF07BD1F690E1FB
        89E0FC68CDFA49BAF636A9EA2B94D11D7EB50E6698055887075D8D0E6B9E1676
        AC227CB03278A83272A1204870285982326B955C99BD6FBAE24CB6ED2D97D137
        7CAEC8D0D4C8D0D4C8D0D48FBCD448A2D553ADE053C3FC69D0FE87D8FAB5E5F8
        C7E8F6B8E4F998D9F797DBFA97E0FF78CCF363B8E16FB9DE63A5C94F97BF2984
        B61E86BD278FC8377CAE0D43720A3F6B124C77225F882F658D36719D4499CB37
        7CAEC8D0D4C8D0D4C8D0D4C8D0D4B8CAD353ADE057C1F871C8F47CC7EE7DBDE1
        58A5CE4B8EB74581A83F7398407598437A9C4681A3559DBF58B2DA7AD5FA75CF
        FC4CB6ED2D97D1377CAE0843760341700650830E6B9E1676AC227CB03278A839
        80B2C8D0D4C8D0D4C8D0D4C8D0D490C1DC5BB7E862BBEB7BC6ED7FC7EB66BBE8
        4CAFE737A6E62B93D01D7CB4196593105680175881235F882F658D39739D54A7
        CF60CEFB5BC7FB377CAE367AAF4688B95797BE4F97BF2984B61E86BD278FC837
        7CAEC8D0D4C8D0D4C8D0D470B6DD56B3E762BFF07BD1F690E1FB89E0FC68CDFA
        49BAF636A9EA2B94D11D7EB50E6698055887075E8D0E6B9E1676AC227CB03278
        A84C97C07BDEFC459BCD224D7632658C4181A85F9ABD71C0E94CB6ED2D97D137
        7CAEC8D0D4C8D0D4C8D0D455B0E259BFF461BFEF61B6E15CA8D14B8EB74581A8
        3F739847789C4E7B9C467A9F3F7AA162A3C863A5C94F97BF2984B61E86BD278F
        C8377CAE4CA9DD2773AA0D43720F4F7A175881235F882F658D3877A34499CB37
        7CAEC8D0D490C1DC69BAE662BBEB7BC6ED7FC7EB66BBE84CAFE737A6E62B93D0
        1D7CB4196593105680175881235F882F658D3A78A360A6CF75CFFC4CB6ED2D97
        D1377CAE1B63A00F4E8808437604507F075D8D0E6B9E1676AC227CB03278A83A
        83B470B6DD56B3E762BFF07BD1F690E1FB89E0FC68CDFA49BAF636A9EA2B94D1
        1D7EB50E6698055887075D8D0E6B9E1676AC227CB03278A84391C060CEFB5BC7
        FB377CAE4988BD3B7FB6397EB26FB7DD63A5C94F97BF2984B61E86BD278FC837
        7CAE53ADE053C3FC69D0FE87D8FAB5E5F8C7E8F6B8E4F998D9F797DBFA97E0FF
        78CCF363B8E16FB9DE63A5C94F97BF2984B61E86BD278FC8377CAE97EDFE7BDE
        FC459BCD214F7C234D773D769C40799C4181A8609FC471C0E94CB6ED2D97D137
        7CAE53ADE057C4FB93DCFDB0ECFC9EEEFD89ECFF88E9FF80E3FD74D6F471D5F6
        78DDFC76D8F679DFFF6CD2F77AD5FA75CFFC4CB6ED2D97D1377CAE85D4F54CA9
        DD2E82C0155A9A115891196593105680175881235F882F658D3877A34499CB37
        7CAE53ADE081D8FAA3F4FC9DF0FC9FF0FC99EDFC92E7F997E7F887E7FF84E4FC
        88EAFF87E9FF72D5F667D1FA6ED8FE73DBFE60CEFB5BC7FB377CAE429BD32982
        C81B6BB2155B9A1159920E6698055887075D8D0E6B9E1676AC227CB03278A839
        80B24DA7DA68CAEA91F5FFA5F6FF9AEDFBB2F6FD9AEFFF86E8FF73D1EE7FDFF8
        87E9FF75D8F782E6FF7ADFFE66D2FD69D2FD97EDFE7BDEFC4499CB63A6D54E94
        C84A8ABE4988BD509ACC63B8E16FB9DE63A5C94F97BF2984B61E86BD278FC837
        7CAE8FBCD448A2D561C1E57EE3F79AF3FFA1F3FF8FECFF87E6FC7EE1FC75D9F8
        6AD1F667D1FA75DDFD8DE6FFB8F0FFCCF2FF85D4F54CA9DD3E97D23687C13076
        AD28609223527F3F789E4582A640799C4286AE609FC471C0E94CB6ED2D97D137
        7CAEC8D0D4B8CAD377B3D450A4D54DAADB59BAE665C7EF67CDF667D3FD62CFFC
        67D4FF66D1FA70D6F569C7EF57B6E74AA7DB44A1DA49A2DD479AD33788C72777
        BB2581C5288CC91D7CB4196593105680175881235F882F658D3877A348A4D737
        7CAEC8D0D4C8D0D4C8D0D4C8D0D4AFC7D49FC1D388B9D488B9D488B9D488B9D4
        88B9D488B9D488B9D4399ADC389EE43CA6EF49B0F05BBCEE5FBDEB53B4EA44B2
        F136A9EA2B94D11D7EB50E6698055887075D8D0E6B9E1676AC227CB03278A839
        80B2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D44BA7E04BBDFC67CEFE87D8FAB5E5F8C7E8F6B8E4F998D9
        F797DBFA97E0FF78CCF363B8E16FB9DE63A5C94F97BF2984B61E86BD278FC837
        7CAEC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D453ADE057C4FB93DCFDA4E4FA93DFF970CEF164B9E15DAE
        D558A3C95198BE4C8DB24582A640799C4286AE61A5CB72C5EF4CB6ED2D97D137
        7CAEC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D453ADE067C5F362BFEC62BBEB7BC6ED7FC7EB66BBE84CAF
        E737A6E62B93D01D7CB4196593105680175881235F882F658D3877A348A4D737
        7CAEC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D452ACDF56B3E762BFF07BD1F690E1FB89E0FC68CDFA49BA
        F636A9EA2B94D11D7EB50E6698055887075E8D0E6B9E1676AC227CB03278A83A
        83B4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D453ADE053C3FC69D0FE87D8FAB5E5F8C7E8F6B8E4F998D9
        F797DBFA97E0FF78CCF363B8E16FB9DE63A5C94F97BF2984B61E86BD278FC837
        7CAEC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D453ADE057C4FB93DCFDB0ECFC9EEEFD89ECFF88E9FF80E3
        FD74D6F471D5F678DDFC76D8F679DFFF6CD2F77AD5FA75CFFC4CB6ED2D97D137
        7CAEC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D453ADE081D8FAA3F4FC9DF0FC9FF0FC99EDFC92E7F997E7
        F887E7FF84E4FC88EAFF87E9FF72D5F667D1FA6ED8FE73DBFE60CEFB5BC7FB37
        7CAEC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D44EA8DB68CAEA91F5FFA5F6FF9AEDFBB2F6FD9AEFFF86E8
        FF73D1EE7FDFF887E9FF75D8F782E6FF7ADFFE66D2FD69D2FD97EDFE7BDEFC43
        96C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D48FBCD448A2D561C1E57EE3F79AF3FFA1F3FF8FECFF87E6
        FC7EE1FC75D9F86AD1F667D1FA75DDFD8DE6FFB8F0FFCCF2FF85D4F54CA9DD8F
        BCD4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4B8CAD377B3D450A4D54DAADB59BAE665C7EF67CD
        F667D3FD62CFFC67D4FF66D1FA70D6F569C7EF57B6E753A9DA77B3D4B8CAD3C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4AFC7D49FC1D388B9D488B9
        D488B9D488B9D488B9D488B9D488B9D49FC1D3AFC7D4C8D0D4C8D0D4C8D0D4C8
        D0D4}
      Visible = False
    end
    object imEK: TImage
      Left = 50
      Top = 10
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D6170360C0000424D360C00000000000036000000280000002000
        0000200000000100180000000000000C00000000000000000000000000000000
        0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4BABBB9B4B1ACACA29AA4968897816E8F79669D8E81B9BAB8C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C4CACDBBBBBAAFA8A0A99F95A39283
        9C8673A28C79B5A393B7A696BAA999C3B2A0CAB6A2B6A18E957F6CA4998FC0C5
        C5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C1C5C6B8B7B3B0A9A2A59689A1907F9F8A77A6907DB8A695BAA898BBAA9A
        C0B0A0CBBBACCBB9A8D2C5B9CABAAACFBFAEC9B5A1C2AD9ABBA693A48F7B9380
        6EAAA49CC3CACDC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4A18C79AD9885BAA795BBA897B9A695C4B2A2CCBCADC8B5A4D3C1B0DFCEBD
        E6D6C6E6D6C6F5F5F5939393C2B4A6D0BFAFC8B4A0C1AD99BAA592B39E8BAA95
        82998471938172B0AEA9C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4B49F8BD7C6B4C4B19FD2C0AEDDCCBAE1D0BEE1D0BEE1D0BEE1D0BEE1D0BE
        E1D0BEE1D0BEDFDFDFF5F5F5E0CFBFD7CABDCCB9A7C1AC98B9A591B29D8AAB96
        83A48F7B9B85728E7966938376B7B8B6C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C2AD99D8C7B7DBC9B7DBC9B7DBC9B7DBC9B7DDCBB9E0CFBEE5D4C4E1D1C1
        DDCFC0E3D7CBE6DCD3ECE4DEEBE5E0F8F5F2E7DED5C5B2A0B9A490B29D89AB95
        82A38E7B9C8774957F6C8D7865867260968B82BEC3C4C8D0D4C8D0D4C8D0D4C8
        D0D4CBB7A3DACABAE0CEBDE0CFBEDBCBBBE0D3C6E4DACFE7DFD7EAE5DFF1EDE9
        F8F5F2F7F4F0F4EFEBE6E1DCDFDAD5CFCBC8C4C1BEC5C1BED1C5BAB4A08DAA95
        81A38D7A9C8673957F6C8F79668F79668974627D6B5A9A948DC2C9CCC8D0D4C8
        D0D4D0BCA8EBE4DDECE5DFEEEAE5F8F5F2F8F4F1F5F1EDECE7E2DDD9D4D1CECA
        C9C6C3C7C5C3BABABAC4C4C4CCCCCCD3D3D3CECECE9F9F9FA0A09FC0BBB7C6B8
        ABA6917F9B8572947E6B8F79668F79668F79668F7966826E5D77685A9F9D99C8
        D0D4CCC4BBE5DFD9E1DCD8CFCBC8CCC9C6C4C2C0BDBCBBC2C2C2CACACAD1D1D1
        D8D8D8E0E0E0E8E8E8EEEEEEF0F0F0EEEEEEE7E7E7C7C7C79F9F9F9898989E9D
        9DC4BDB7B3A395937D6A8F79668F79668F79668F79668F79668D776577665777
        6D64C8D0D4B2B4B5C7C7C7CECECED5D5D5DDDDDDE6E6E6EDEDEDF0F0F0E9E7E5
        DEDCDBDEDEDED9DFD8B3CAB3A4C0A390AB8ECED1CEDCDCDCCECECEA0A0A09494
        94919191A2A09EBEB6AEA290808F79668F79668F79668F79668F79668F796660
        5448C8D0D4C0C2C4E2E2E2F0F0F0EDEDEDE4E1DED9D5D0E2DEDBD4D1CEB4B2B1
        DFDEDEADACACD1D1D0C2CEC2ADBEABB3C1A9C1BEAFC3BFBCDEDEDED8D8D8A1A1
        A19191918D8D8D8A8A8AA6A3A1B8ADA49884738F79668F79668F79668F79665D
        5146C8D0D4C6CED2C3C5C6D1D1D1DBDBDBD9D9D9D2D0CFDBD7D3BDBCBBD1CECC
        BCBBB9D6D4D2C1C0C0BBBAB9DFDDDBC9BEB2C0B4A8D9C8B8C8C1BCE2E2E2DADA
        DAACACAC8D8D8D898989868686888887ADA9A6B3A69B947F6C8F79668F796659
        4E44C8D0D4C8D0D4C8D0D4C4C9CBC9C9C9DBDBDBE4E4E4D7D7D7CDCCCAB5B3B1
        D8D6D4C9C8C7BEBEBDD6D5D4BDBCBCDEDDDBE3DAD2CEBEAEC8B9A9B8ACA1DCDB
        DAE3E3E3B3B3B38989898686868282827F7F7F878786B1ABA7B5A69A947F6C56
        4B41C8D0D4C8D0D4C8D0D4C8D0D4C6CED2C4C6C8D6D6D6E1E1E1D2D2D2E3E3E3
        C0BDBAD0D0CFD1CECBB7B6B5D6D5D4BEBDBDDEDDDCDCD6CFD4C8BCE6D9CDD7D8
        D6CDE0E7B3D4E0C4D6D8B0B0B08D8D8D7F7F7F7B7B7B7878788E8B89B1A9A259
        5148C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C5CBCECBCCCDE4E4E4EBEBEB
        DADADADDDDDDDDDDDDEDEDEDDAE4E7CCDFE6AED5E39FD0E18EC3D76FA4B75E89
        99567985526F7A81C8DCA6E0EB9DC5D6B4C2C89E9E9E7E7E7E7474744C4C4CC8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C6CED2C5C8CAB4CED9
        AED5E398CDE088C2D76FA9BE6B96A66689955E7279555A5C4F4F4F4C4C4C4848
        484D765B4F8D65538C7693D6E59AD8E86EB6D482BED6A9CAD8ABB0B34C4C4CC8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4A1BECA
        6EB8D378B0C27A7A7A7474746F6F6F6969696464646060605A5A5A5454544F4F
        4F4F69584F7E5F4F7D64649AA998E1F18FD0E36EB7D567B4D54E94B6546873C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        A2C0CC72BFD97EA8B57E7E7E7777777171716B6B6B6B808668828A6A95A16DA2
        B270B0C37CD2EB7CD2EB7CD2EB81D5EC9DE4F38FD1E467B4D545A0CB5995B2C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D497BDCC74C3DC7DBDD07CBCCF7CCCE37CD2EB81D5EC90DDF09AE3F391D7
        E76BB4CDA4E9F5BDF7FBCCFFFFBDF7FBB3F1F9A1E7F478C0DC45A0CB5995B2C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D48BBACC75C5DE9BE4F4DED3CAA9D9DFB2D6D9B6D4D8B7CACDA9B6
        B9B8ADA36BAFC581D5EC7CD2EB7CD2EB7CD2EB7CD2EBADECF553A8CC6DA0BAC8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D48DBCCE79CBE3DED3CAECECECF4F4F4F7F6F6F8F6F6F8F6
        F6B8ADA36FA3B479CCE578CBE476C7E076C7E072C1DA7BC4DB87BDD1ADC3CDC8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D48DBED0DED3CAF6F5F5F8F7F7F9F8F8FAF9F9FAF9
        F9B8ADA39BC5D49BC5D4B1CAD4B1CAD4BCCDD3C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4DED3CAF6F4F4F4F2F2F3F0EFF6F4F2F7F5
        F2B8ADA3918C87918C87918C87C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4DED3CAFCFAF9F9F6F5F7F4F2F6F1EEF3EE
        EAD3CDC7B8ADA3918C87918C87C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8CCCDDED3CAECE5E0EBE4DEE9E1DAE6DC
        D3E4D8CECFC3B9B8ADA3B8ADA3C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CDCCC8D8C8BADAC9BBDBCABBDBCA
        BBDBCABBDBCABBC8C5C0C0C7CBC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4}
      Visible = False
    end
    object imStop: TImage
      Left = 940
      Top = 35
      Width = 16
      Height = 16
      AutoSize = True
      Picture.Data = {
        07544269746D6170F6000000424DF60000000000000076000000280000001000
        000010000000010004000000000080000000D40E0000D40E0000100000001000
        0000000059002424500026266900FF0000000101BD002929AF005D5DBB000707
        C8002828CA000000F5002626F4006161D300A4A4D500D1D1DA00D7D7F200E3E3
        E400333E20000001F33333E8744444441F333E874474444441F3E87844578578
        741F84DEC5C4EEBD844194EBC8D4FBCCB44077BBC8D4FBCCFC40947BC5D4FBCD
        6C40746F88D4FBCCBD4094DB88D4FBCCBD4094EBC7E4FBCCBD40A7CECCF6DDBE
        DC42EA8888888878B45F3EA74444444445E333EA777777745F33333EA9999995
        E333}
      Visible = False
    end
    object imStar: TImage
      Left = 960
      Top = 35
      Width = 16
      Height = 16
      AutoSize = True
      Picture.Data = {
        07544269746D6170F6000000424DF60000000000000076000000280000001000
        000010000000010004000000000080000000D40E0000D40E0000100000001000
        0000255B2500296629002D712D00327E3200368836003B943B0041A5410048B6
        480054BC54005FC15F0071C771000000FF008ED38E00A4DCA400B2E1B200D1EE
        D100BBB64BBBBBB44BBBBBB614BBBB424BBBBBB6304BB6534BBBBBB7D52137A4
        4BBBBBB7FE63ACC26BBBBBB7FFFFEEA36BBBBBB7DDFFFE404BBBBB55EEEFFFA2
        04BBB5AEEEEEFFEA310B9EFFFFEEFFFFC5548889AAFEE669A88BBBBBB7FEE2BB
        BBBBBBBBBAFF94BBBBBBBBBBBACE54BBBBBBBBBBBBAC26BBBBBBBBBBBB977BBB
        BBBB}
      Visible = False
    end
    object imFR: TImage
      Left = 95
      Top = 10
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D6170360C0000424D360C00000000000036000000280000002000
        0000200000000100180000000000000C00000000000000000000000000000000
        0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4BFC7CBBDC5C8C4CCD0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4BFC6
        CAA9AFB3949A9F9EA4A7BBC3C7C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4BEC5C99298A1696D873E40
        811516941212B22D2E88747985ACB3B6C3CACEC8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C5CDD1B0B8BB888E9B5255872D2E8C0909A70000C90000
        D20000DC0202C10D0DBA090AA44749788F9497B7BEC2C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        B8C0C3989EA874799240428B090AA80000B80000C70000D10000CE0000CB0000
        CB0000CE0303C20D0DAD0101B50001BD1D248B666A77A5ABAFBFC7CBC8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C1C9CDB0B7BA7E8396434594
        24269C0909AB0000C40000C40000BF0000BF0000BF0000C00000C20000C30000
        C40000C90303BF0D0DAC0101AA0001B2040AB10607989EA4A79EA4A7B9C1C4C4
        CCD0C8D0D4C8D0D4C8D0D4B7BEC48C91A45F63952E309B0B0BB80000C70000C9
        0000C30000B90000B50000B60000B70000B90000BA0000BC0000BE0000C00000
        C10000C40303BD0D0DAC0101A80001AE030AA40000AF999FA2999FA2A7AEB1BB
        C2C6BFC6CD787DA94749A22223B20000D80000E50000D70000CC0000C30000BD
        0000B70707B32524B21110B30000B50000B70000B80000BA0000BB0000BC0000
        BD0000BF0302BB0E0DAC0101A40001AB030AA30000A6A5ABAFA5ABAFACB3B6BB
        C3C74E50B40808F10000EE0000E90000DA0000D10000CD0000C80000C42726BF
        8481C0CFC9C8EAE2CB3837B50000B10000B40000B50000B60000B70000B90000
        BA0000BB0505BA0C0CA901019F0002A604099D0000A4B3BABEB3BABEB5BCC0C0
        C8CC2525E21313EA0000E00000DB0000D70000D20000CE0000CA0000C57D7BC4
        FFFDD8F1E9D6E6DFCF3736B60000B00000B20000B30000B40000B50000B60000
        B60000B70606BB0A0AA50000990002A2030A980000A0BFC6CABFC6CABCC4C8C4
        CCD03636DC4747ED2B2BE72A2BE42526DF1E1EDB1919D61010D00000C96F6DC6
        F4EDD8EAE3D7E5DED13433B80000B10000B00000AF0202B10000B20000B30000
        B40000B40606B90A0AA400009400029D03099700009EC8D0D4C8D0D4C2C9CDC6
        CED2494ADE8585F46565EF6262ED5E5FE95B5BE75656E24A4ADE2828DA8280CE
        F3EDDAECE6DAE3DED33F3EBA3433B8706DBCACA6BF3836B30000AF0000B10000
        B10000B10606B80A0AA300008F000297030A94000098C8D0D4C8D0D4C6CED2C8
        D0D44B4BDE8788F56868EE6363ED5F5FEB5959EA4C4CE74647E24747DA9C9BD1
        F3EEDEEBE4DDE8E2D8E5DED5ECE4D5F2EAD4FFF9CF4847B70000B10000B10000
        B00000AF0606B90A0AA1000089000293030A9200008AC8D0D4C8D0D4C8D0D4C8
        D0D44E4EDF9191F67272F06D6DEF6666EF6666E69594D9BCBBDDD3CFE1E6E2E0
        EFEAE2EBE6DFE9E4DCEAE4DAE8E2D8E7E0D6F2ECD04341BA0000B40000B40000
        B40000B20606BB0A0A9F00008200028E030A90000084C8D0D4C8D0D4C8D0D4C8
        D0D45252E19B9BF77D7CF27878F06A6AF28586DFFDFCECFFFEEDFBF8ECF4F0E8
        EEEAE5EDE8E3ECE7E0EEE9DEF2EBDCF7F0DBFFF8CF5150C00000BA0000B80000
        B80000B60707C109099C00007B000287030A8900007EC8D0D4C8D0D4C8D0D4C8
        D0D45757E1A5A4F98686F38282F27575F28B8AE0FBFAF2FCF9F2FEFAEEF8F5EB
        F0ECE8EFEBE6F0EBE2DAD6D8BBB7D49E9BD27A7ACE4E4ED12A2ACB0708BF0000
        BB0000BB0808C7080899000074010281030985000079C8D0D4C8D0D4C8D0D4C8
        D0D45B5BE1AFAFF99090F48C8CF38181F49695E2FFFFEFF0EEE9D1D0E7D4D2E2
        F4F1EBF5F1EAEDEAE27373DC494BDE4B4BDB4343D94A4AD84E4ED74243D31211
        C60000BE0808CE08089700006C01027A040A82000074C8D0D4C8D0D4C8D0D4C8
        D0D46060E2B8B8FB9A9AF69696F58E8EF59191EAA6A7E88B8BE76666EA9F9FDF
        FCF8EDF8F5EDF0EDE47B7BE05858E45D5DE15959DE5555DC5151DA5151D94848
        D71111C80404D3080896000065010274030A7F00006EC8D0D4C8D0D4C8D0D4C8
        D0D46363E3C1C1FDA4A4F7A0A0F69B9BF59393F58686F48282F47777F6ADACE2
        FDFBF1F9F7F1F3F0E88382E46262E86565E56161E35D5DE15959E05555DE5656
        DE4545D90A0ADB02029100005B01026D04097B000069C8D0D4C8D0D4C8D0D4C8
        D0D46767E4C9C9FDACACF8A8A8F7A3A3F79E9EF69898F59393F38585F5B5B5E4
        FFFFF3FFFFF3F6F5E98C8BE76A6AEC6D6DE96969E76565E55F5FE45858E25353
        E05959E05454EC1D1D9F000054000061030975000063C8D0D4C8D0D4C8D0D4C8
        D0D46C6BE5D1D1FDB6B6F8B2B2F8ADADF8A7A7F6A1A1F69C9CF59292F7B0AFE5
        D5D5E9BEBDE8A5A4E58080ED7676EF7575EC7171EB7070EA7676EA7F7FEB8081
        EB8282EB9B9BF59797DF44449907086E00056C000058C8D0D4C8D0D4C8D0D4C8
        D0D46E6FE6DADAFEBEBEFABABAF9B5B5F9B0B0F8AAAAF7A4A4F6A0A0F79A9AF1
        9091F29191F69292F59595F59393F49292F38585F17172EE5D5DE94F4FE94343
        E53838DC6A6AE2A8A7EE9493E36264C42E3492070563C8D0D4C8D0D4C8D0D4C8
        D0D47273E6E2E2FFC7C7FBC4C4FABEBEFABDBDF9C1C1F9C6C6FABFBFF9ABABF9
        9D9DF89393F68D8DF77070ED4646E71D1DE41515E71A19EA1717EA0808D70000
        D30504DE1313DB1B1FD93C3FD07B7DD28A8BC8605FBCC8D0D4C8D0D4C8D0D4C8
        D0D47475E8F5F5FFD8D8FED6D6FED3D3FEB8B8F98F8EF56666F14F4FF44B4BF5
        3B3BF12E2DEA1817E01A18E62121EA2626D92121C211109528276D5353723D3D
        6A0D12990A0EB20608B10508C31113C54141DA7677E4C8D0D4C8D0D4C8D0D4C8
        D0D44242DF8C8BFF6B6BEF5C5CEC4F50EB4D4CEA5454F05555F74747E23D3ECF
        3A3BAD3334BC2B2FDE272BD22328D92C2FAA6C6C687B7A6D9F9FA5B6B6DE7F7F
        B93738AD1313CF1C1BCA2F2FCA4143CE4447C87074C6C8D0D4C8D0D4C8D0D4C8
        D0D4969ACC7F82D98384E78F90ED9696EC989AF67678C573738D88899C676677
        6C6C5E7F7F76363B97272CD62728C92928D57271807D7B933E40AE4E50BF686C
        CC8388C78F95CEA2A8CCB9C1CFC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C7CED4B4BBD97881C8797DC87E7ED29696D0A6A6D38788D7
        9090CBADAB9B5F62C25C5FBE7B80BFA3AAC68E8C8D9FA0A6C6CED3C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C3CBD5BBC1DCB4B9DDB1B7D8B6BDD4
        B3B7C7ABAAA1C8D0D4C8D0D4C6CED3B8BEC8939390AAACA7C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C5CAC9BFBFBEC3C6BBBCBCB1B9B7ADB5B4ABB5B4B3B6B9BAC8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C4CACDC2C0C1BFBEBBC1C2C2C5C8C9C7CCCECFD4D7C6CDD1C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4}
      Visible = False
    end
    object imInf: TImage
      Left = 135
      Top = 10
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D6170360C0000424D360C00000000000036000000280000002000
        0000200000000100180000000000000C00000000000000000000000000000000
        0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C1C9CDB0B8BB9DA3A6898F917B8083737779727679797E80858B8D979DA0ADB4
        B8C0C8CCC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4BCC4C89CA2A5
        6E71736465656868686D6D6D6F6F707272727070706C6C6C6464645758585254
        556C7072979DA0BBC3C7C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C3CBCF9FA5A86C6E70727272
        959494C7C5C3E8E5E0F2EFEBEFEFF1EBEEF3EDEFF2EFEEEDE9E5E1CBC8C59695
        946868684E4F5065696B9EA4A7C3CBCFC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4BBC3C6828587707070AAAAA9E7E5E1
        FDF9F8F8DBD5F1B19DEB855FE65927E83F05EF6327F89460FEC49DFEE6D5FEFB
        F8EAE7E5AEADAB6464644E5051818689BDC5C8C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4B7BEC27B7D7E8F8F8FDEDCDAFDF6F5EFBBB3
        D8573BD22C01DB3901E04702E35200DE5800D85700E25D00F56600FB6900FF93
        3CFED8B4FEFAF5E7E3E18A8A8A4C4D4D727779BAC1C5C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4BBC2C67D7D7EA3A3A3EFEBE6F7D8D3D76252C92102
        D63202DE4302E24D01E15000D15C0BD3925BD29F6EBF7325D56F00F98D00FF8D
        03FC800AFBA65AFEECD7F6F2F0A7A5A54E4E4E73777ABDC5C8C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C2C9CD818384A4A5A5FAF9F6F4C4BACA2204CE2303D62E03
        DA3902DE4302E14B01D7530CD7C1AFE4F1F2F4FAFBEFECE9BC7D30E37E00FF9B
        02FD9F0BFA9311F88514FDE1C0FBFAFAA7A6A54C4D4D83888BC4CCD0C8D0D4C8
        D0D4C8D0D4C8D0D4939698919191ECE8E4F5C5BAD02A01D52E03D42903D52D03
        D93803DE4202DE4100D68556C2CDCFC5CDCCCCD3D1DCE8EED0BCA1D77604FE95
        00FF9E07FDA10FFC9B16FA8611FDE0BFF4EFEF8B8A8B4E4F509EA5A8C8D0D4C8
        D0D4C8D0D4B7BEC17D7C7DD7D6D3F9DBD3D42F03D83702D73203D32A03D52B03
        D93503DC3F02DF3F00D48A63B2BEC2B2B5B5B7BAB8BDC9D0C5B7A2E07E09FC91
        00FF9A01FE9D08FDA00FFD9910FB7E0DFEEAD5E6E3E064646465686ABCC4C8C8
        D0D4C7CFD3898C8DA8A8A8FDF7F4E67251D93C02DB3B02D83403D52C03D42903
        D83203DC3C02DE4101DE6426CBC6C3BBC7D0B2BCC3B7C3CAC98F53E77400FB8E
        00FD9300FF9801FF9B04FF9E08FF8B05FE9D52FEF9F4AEADAC4D4F4F999FA2C8
        D0D4BAC1C47C7D7DDCDAD7F6C4B2DB3B02DE4502DB3D02D93603D62D03D42803
        D63003DA3A03E04301DF4200DD763DD7AE94D1B39CCE8A50E16B02F47D00F786
        01FA8B00FC9000FD9400FE9700FE9800FF7200FED3B2E9E6E46868686A6E70C1
        C9CD9B9FA1949595FDFBF9ED7B51E04800DF4702DD3F02DA3803D73103D32A03
        D52C03D93503DC3E02DB4503CA4505BF5013BC5816C25506D96403EF7501F67E
        01F78301F88700F98A00FA8D00FA8D00F97B00F9803AFCF9F8969595515354AF
        B6B9838485BDBDBDFBE9E1EF8052E55B0EDF4600DC4102DA3B02D73403D52C03
        D42903D73103DB3600D7521AEFDBD1EFE5DEF0E3DCEBE0DAC97C3EE26400F476
        01F37A01F57E01F68101F68301F68301F67F01F05001FCE2D5CAC8C556575798
        9EA17F7F7FD9D6D3F7CFBAF2915DEC8344E45B14DC4100DC3D01D93702D73003
        D52803D52B03D82F00D3501FF6F1EEFEFFFFFFFFFFFCFCFEBE7C4DD55400F16F
        01F07101F17501F27801F27A01F37901F27A01EE5501F9BC9DE4E1DD66666685
        8A8D7B7B7BE6E3E0F9BB94F08D50ED8D4EEC8349E35B1CDD3E01DA3700D83403
        D62C03D32803D52C00D24113E5E3DEECF6F5F2F5F3FBFFFFC99D82B83C00EB64
        01ED6901EE6C01EE6D01EF6F01EF6F01EF6E01EB5701F08D60EAE7E86B6C6C76
        7B7E767676EBE8E6FBB47DF29758EE8B47ED864BEA814DE4662EDD4308D93300
        D73202D52A03D42903D02300DAB8AAD8E7E6DFE4E1E8F2F3DEDBD4AA4F19CE48
        00E86002EA6201EA6401EB6501EB6501EB6501E75601E55927E9E8F071717170
        7577747474ECE9E7FDAD6AF5A365F08D45ED8746EB8148E9804EE77242E05220
        D83503D52D00D42801D32200D05939CEDDDCCDD6D3D3D9D7DDECEDC7B5A8A93F
        0BD64A00E75802E85A02E75B02E75B02E75B02E55203DA3505E8E7F272727271
        7578767676ECE8E6FAB176F6AD72F19043EE8A44EC8445EA7F47E87C4BE6794D
        E3683CDD4D20D63407D42601D01C00CC8A79C0D0D2C3CBC9C9CFCED2E2E3BB9B
        8AAE3503DB4A01E35002E35102E35000E34E00DD4200DD4D26EBEAF070717179
        7E807B7B7BE6E2DFF6BF94F8B478F29442F08D42EE8843EB8244E97C45E77848
        E6774AE5764DE26A47DF542ED83715D23918C4A097B5BEC0B9BDBCC0C5C5C6D3
        D5B0765ABB2B00DD4100DF4000DF4701E04F0EDE5223EB937EEFECEB6C6C6C88
        8D90818282D6D3D1F6D0B3FABB88F59F4EF29140EF8B41ED8542EB8043E97B44
        E77746E67447E6724AE4734FE37150DF593ADA715BC3C3C2BABFBFBEC1BEC1CB
        CCBEB4AFBB5735DB5626E46636E56F42E6774EE98570F4C7BFE4E1DD6868689E
        A5A8868788BBBABAFAEBDFFAAB6FF9B979F3943EF18E3FEF8940EC8341EA7F42
        E87A44E77644E26D3FE26F46E57049E5704EE06444D5ACA1C3C8CBC7C6C6C4C6
        C6CED5D7C48A79D96D4DE67B5BE57B5CE8896EE57A6BFAE3E0C5C4C3626364B4
        BCBF9FA3A5969695FDFCFBF8A666FAC99CF7A250F3923CF18D3EEE883FEC8341
        EA7E41E57A44D88159C7663ECF6239D4643ECE5D39CFAEA5C2C8C9C4C5C5C4C3
        C2CFD9DBC1877AD45F47E16D52E26E55E89383E48074FCFAF99595956D7072C3
        CBCFBAC1C47F7F7FD5D3D2F8DCC4F9AA68FAC896F5973CF3923CF08C3DEE873F
        EC823DDE7F4BD8CFCBCBB5ACC59887C6917CCAA89BC6C7C8C1C3C3C3C3C3C2C2
        C2CCD5D7C48576D96245E26D50E9907CE58274F4C9C3E5E3E07272729CA2A5C8
        D0D4C7CFD38E9091A9A8A8FDFCF9F9AA6CFBBF8EFAC58FF5963AF3913BF18C3C
        EC8336E19D71DCE4E9DADFE2D6DADBD3D5D5D1D7D8CCCDCDC8C8C7C6C6C5C4C8
        C9C8C5C3CF7B61DE6A46E98E71EC9F8CE68374FDF8F7ACABAA67696ABFC7CBC8
        D0D4C8D0D4B8BEC1818181CFCECDFAEDE1F5812CFAC897FAC794F59A41F3923A
        EE8531EACEB9E8EFF3E4E5E5E0E1E1DDDEDFDADADBD7D7D7D3D3D4CFD3D4CFD7
        DBCF9F8CDB6B44ED997BEFAE99DF5C43FAE1DCDEDBD97171719DA3A6C8D0D4C8
        D0D4C8D0D4C8D0D49B9EA0969696E0DEDDF8E0CBF78329FBC38FFACFA4F8B16B
        F28D31EFB887F1E9E2F0F4F5EDF1F2E9EDF0E6EBEEE2E7E9DFE4E6DFDEDDD7A3
        8BE08258F0AF92F1AE96E36442F7D1C7ECE8E59292927C8081C6CED2C8D0D4C8
        D0D4C8D0D4C8D0D4C2CACD898A8BA7A7A7F6F5F4F9E1CBF57D25F8AA66FBD0A5
        FBCDA0F6AE6AF09A4FEBA266EDB78CEDC4A7ECCBB2E8BEA2E7AC88E79A70F0AE
        8AF4BFA2EE9A78E25B33F8D3C7F8F6F5A6A5A5707172BEC6CAC8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4BFC7CA898989A7A7A7E1DFDEFAEDE1F8A96BF5862C
        F7AD6BFACA9AFACFA3F9C899F7C091F6BC8EF5BA8EF4BC92F5C09AF7C19EF2A6
        7BEB6D3CEE8C6CFCE5DCEAE6E3A5A4A4717273BBC2C6C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4BFC6C9898A8B969696CECECDFEFCFAF9DBC4
        F6A666F79B56FAB682FBC496FACA9FFAC9A0F9C7A1F9BF96F7B084F49363F393
        67FAD4C1FEFAF7D6D5D2909090858788BCC3C7C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C2CACD9B9E9F828282A8A7A8D5D3D1
        FDFCFBFBECE0F8D0B2F2AD79F69849F98B2DF99849F8AD78F7C9AEFCE9DDFDFB
        FADBD8D6A7A6A67E7E7E95999BC2CACEC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C6CED2B9BEC18E9091808080
        959696BBBABAD7D3D1E6E2E0ECE9E7EEEAE9ECE9E7E7E3E0D9D5D3BDBCBA9494
        947B7D7D898C8DB9C0C4C6CED2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C6CED2BAC0C3
        9FA3A58788898081817B7B7B7575757474747575757B7B7B7E7E7E8485869CA0
        A2BCC3C6C6CED2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4}
      Visible = False
    end
    object imBr: TImage
      Left = 175
      Top = 10
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D6170360C0000424D360C00000000000036000000280000002000
        0000200000000100180000000000000C00000000000000000000000000000000
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0D6D9DCCFD1D2CFD0D2CFD0D2CFD0D2CFD0D2
        CFD0D2CFD0D2CFD0D2CFD0D2CFD0D2CFD0D2CFD0D2CFD0D2CFD0D2CFD0D2CFD0
        D2CFD0D2CFD0D2CFD0D2CFD0D2CFD0D2D0D1D2D6D9DCC0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0B8C4D33D87D23D87D2458BD3376FA72846603581D3
        3A85D33681D23782D13C86D23C86D23C86D23C86D23575B12740554A8FD24B90
        D1488FD2488FD2488FD2488FD2488FD24990D26194C7C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0A0B6CF2684EE2C89EE308CEE2469B11C3C582880E5
        338DEE2986EF2582EE2382EE2583EE2684EE2885EE2A75C21B3B574699F1499F
        F04399F23C95F03B94F13B94F13B94F13B94F1498ED2C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C092AAC32683EE2784EE2281ED1E63B11C3C582680EB
        368FEF2985EF2280ED1879EC1777EB1576EB1979EC1D66B8182D404293EF4E9D
        F14397F1358FEF2E8AEE2885EE2784EE2885EE3882D1C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C087A1BA2C84ED378EEF2A86EF165DAF1B3C582A81EA
        4191EE368DEE2A86EC207FED1374EA0F6FE60F6FE60F55AA080F163C8EEF539D
        F14495F03D91F02E8BEF2482EE1A7AEC1576EB2C79D0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C08599AE3372B63D76B73674B719518D1837522561A8
        3368A92E65A6265FA5255EA3215DA21D5CA41859A4113E740304052560A63468
        A83168AA306DB12E6DB43070B7296EB6256BB6346BA5C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0808A97234D73234D73234D73234C7126435E21384F
        20334520314215212C050608112941132D44132D44132D44132D44132D44132D
        44142E45152E44192937244C70234E74234D733D5C79C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0BCBCBCC0C0C0859CB54E9EF1509FF04D9FF0509FF0539EF1579FF1
        5CA0F161A3F24C6F98090F164897EB4C9FF0459EF0459EF1459EF1469EF1469E
        F1469EF1357ABA0A12194197EB469EF1469EF15596D5C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0859CB54B9AF1529EF14C9FF0459EF0459DF1489FF0
        4C9EF04F9FF04070A4101C274896EB4F9EF1449AF14095F03B93F13B93F13B93
        F13B93F12C70B705070A378FEE4094F03B93F15192D6C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C08FA4BB4595F0579FF1509DF1439AF24398F23F94F1
        3C95F03F98F13970A31A2732458CDF539DF14798F13D91F0308BEF2885EE2483
        EE2583EE1F65B20405073186E73F94F1308BEE4789D4C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C093A8BE4895EF62A3F15AA0F2549DF14F9AF14498F0
        4195F13E94F1376CA229323C498EDE5EA1F1549CF14997F13F93F0358BEF2D87
        EE2885EE1D63B10405063A89E9589EF14997F14D8DD5C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C09FA7B41B446A1F466A2F4D693D51653D51653D5165
        3D51653D51653D4955393E432C4054243E5A1D38561C3246142C450C223C0A1C
        33071A30061220030405061930112C4B1B42684A6480C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0A4B1C32359922663A232679E435F7D4E565E3A6592
        3A6A9A3B6A993E6B993D6B993D6B993E69983A66942F557A252F392B5B8B2556
        872052851E50821D4F821E5083235A9325629F507EAFC0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0B3CCE62885EE2A87EE2E8BEF4779AF6269704497EB
        4A9EF1459BF14399F2439AF2439AF24399F14399F1438BD33E42464A99EF469A
        F23890F02E8BEF2C89EF2985ED2985ED2885EE559BE8C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0BBD3EC2583EE2381ED2180ED4478B470757A4D98EB
        5AA0F1549EF1499AF24697F14395F14495F14495F1498CD251575D5099EC539D
        F14093F02F8BEF1F7EED1979EC1879EC1576EB4C94E7C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C08198B02B85ED358DEE2986EE437BBD798290579DE9
        69A6F066A5F05DA1F1569EF24F9AF14796F14593EF4D8DD26A6E715B9EEC63A3
        F1539CF14191EE2C87EE1979EC0F6FE60F6FE6468FE5C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0485A6C3A7FCA4A8CD3488BD34475AC7883946AA1DA
        7FB0E47EB1E67DB0E578ADE975ACEA73A0D7689DD86C94C373798171A2D57CA5
        D16C9DD46096D44E8DD14187D0317ED21F6EC85088C6C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C049515D223E582E4860395672455E7864758B8790A0
        999EA7A0A4AAA1A5ABA1A5ACA1A5AB9CA1A7999EA58E96A4818B9C777F8B7178
        80666E75566676475E77405D7A355069254461576A7EC0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C04B5D6D3986DB4A8DD34D8FD35C95D4689CD76CA3E0
        73AAE779AEE796B6D6B9BBBD90BCE59DC3E790BCE590BCE58EBBE58CBAE68BB8
        E588B7E47BA6D1586C846B9DD5659BD74B94DF70A2D1C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0485E724194EE569FF2579FF15B9FF166A5F16CA8EF
        7CB1E88BBAE79DBAD5BABEC1C6D8EDC6D8EDC6D8EDC6D8EDABCAE990BCE590BC
        E58BBBE883ABD35E728A6AA6EE5CA0F14B9DF16DA9E6C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0435A724492F062A2F163A3F166A5F169A6F073ABEA
        88B7E690BCE5B0C4D8BDC2C7CADBF0CBDCF2C9DCF2C8DAF1C6D8EDB8D1EB90BC
        E58DBBE683ABD368788E6FAAEC65A4F14B99F15CA1E9C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C04259714B97ED6AA7F06AA7F06CA8EE70AAEC80B2E6
        8EBBE59DC3E7C5D2E0C7CED6D8E4F2E0E8F2DAE4F1D0DFF3C9DCF2C6D8ED9DC3
        E78CBAE67AA6D368788E6DA9E972ABEC589EF1599FE9C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0575E652A567E305C87315C88335D87466F965E7D9F
        758DA98D9FB5A1AFBFBCC3CBD5DCE5ECEEF2DFE4EAC9D1DBB5BDC898AABF7F93
        AD6984A44A6D902B476033587A3A6185355E866483A3C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C03A55715C6F875C70885B6F875B6F875B6F88
        5D718961748B62758C65768D66778E66778E66778E66778E66778E64768D6476
        8D62758C61748B5F738A5E728960738A5B6F868394A4C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C05C718A7D889C7D889C7784987A86987E899C
        7F8A9D808B9E818CA0818CA0848EA0848EA0848EA0848EA0848EA0848EA0818C
        A0818CA0808B9E808B9E818B9F818CA061758DC0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C072859D798BA3798BA3798BA37A8BA3
        7C8CA37D8DA37E8DA27F8DA27F8DA1818EA1818EA1818EA1818EA17F8DA27F8D
        A27E8DA37C8CA37D8DA47B8CA47B8CA4C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0}
      Visible = False
    end
    object imExit: TImage
      Left = 255
      Top = 10
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D6170360C0000424D360C00000000000036000000280000002000
        0000200000000100180000000000000C00000000000000000000000000000000
        0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C6CED2426CA6215CAF184481
        797E808F9497B6BDC1C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C6CED2587EB1205BAD215DB017417B
        81878983888B858B8DA1A7AAC4CCD0C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4597FB2205BAD215DB0215DB0163E76
        8A90928C91948E9496909699969C9FB2B9BDC8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4819BBD205AAB215DB0215DB0235FB1163C72
        93999B959B9E979DA0999FA29BA2A59EA4A7A5ABAFBFC7CBC8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4849DBE2059AA215DB0215DB0215DB02560B2153A70
        9CA2A59EA5A8A0A6AAA2A9ACA5ABAFA7AEB1A9B0B4ACB3B6B7BEC2C6CED2C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D487A1C02059AA215DB0215DB01D529F1F58A82762B315396D
        A5ACAFA8AFB2AAB1B4ADB3B7AFB6B9B1B8BCB4BCBFB7BEC2B9C1C4BEC5C9C6CE
        D2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D41A4A93235FB21C509B225EB1225EB11E56A42059A92059AA2A65B514386B
        9CA2A5A1A7AAA5ABAFA9B0B4ADB4B8B3BABEB7BEC2BEC5C9C5CDD11A4A93235F
        B2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D41C4D952562B51E539F2462B52057A42563B5235FAF225DAD2E69B8143769
        9CA2A5A1A7AAA5ABAFA9B0B4ADB4B8B3BABEB7BEC2BEC5C9C5CDD11C4D952562
        B5C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D41C4F982666B91F55A12A62AD2664B62869BC2663B42460B0316EBB143767
        9CA2A5A1A7AAA5ABAFA9B0B4ADB4B8B3BABEB7BEC2BEC5C9C5CDD11C4F982468
        AD26A328007300C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D41E519B2868BC2158A43877C52B6DC12B6DC12867B82663B43572BF133666
        9CA2A5A1A7AAA5ABAFA9B0B4ADB4B8B3BABEB7BEC2BEC5C9C5CDD11C5590078F
        2244B848007300C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D41F539D2A6BBE225AA73B7AC82D71C52D71C52A6ABC2866B73773BF113260
        9CA2A5A1A7AAA5ABAFA9B0B4ADB4B8B3BABEB7BEC2BEC5C9B8C9C3068B1D3AB3
        3D76CF7D007300C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D421569F7F7E7E245DA93D7ECB3075C83075C83878C52C6CBD3A76C146505F
        9CA2A5A1A7AAA5ABAFA9B0B4ADB4B8B3BABEB7BEC2B1C1BC25A12729AC2B63C8
        6A6BCA71007300C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D42258A27F7E7E255FAB3E80CE3278CC3D81CF3C6EA92454923C77BF4B535F
        9CA2A5A1A7AAA5ABAFA9B0B4ADB4B8B3BABEACBCB623A12527AB295DC5634ABE
        5168C96E007300C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4235AA32F73C62662AE4083D14084D2377BCB8E8E8E3B52703F7BC35A616D
        9CA2A5A1A7AAA5ABAFA9B0B4ADB4B8A8B8B2229F2425AA2758C25D43BB4946BC
        4D65C86B00730000730000730000730000730000730000730000730000730000
        7300245BA53075C82863B04084D2367ACC3075C93266A72E70C04584CD6E7682
        9CA2A5A1A7AAA5ABAFA9B0B4A2B2AC219E2323A92552BF563CB74240B94643BB
        495BC46165C86B68C96E6BCA716DCC7470CE7773CF7A76D17E79D28182D58900
        7300255DA73177CB2965B23177CB3177CB3475C43073C32F72C44988D1133564
        9CA2A5A1A7AAA5ABAF9FAFA9209D2221A82253BF5838B53D39B63E3CB74240B9
        4643BB4946BC4D4ABE514DC05450C15854C35C57C5605BC7635EC86779D28100
        7300255FA93279CD2A67B43379CD2D6DBB4489D7347BCC3074C64C8BD4133564
        9CA2A5A1A7AA9BAAA41F9D212AAB2B58C05C31B23632B23735B43B39B63E3CB7
        4240B94643BB4946BC4D4ABE514DC05450C15854C35C57C5605BC76376D17E00
        73002760AB347BCF2B69B63B7DCA347ACB458BD9357CCE3176C84F8FD6133564
        9CA2A597A6A01F9C2028AA2981CF836BC66D44B8482FB13332B23735B43B39B6
        3E3CB74240B94643BB4946BC4D4ABE514DC05450C15854C35C57C56073CF7A00
        73002862AC357DD02C6AB7458CDA367DCF458CDA367DCF3278C95292D8133564
        9CA2A597A6A01F9C2034AE3484D0866CC76F6CC76F58C05B37B43B32B23735B4
        3B39B63E3CB74240B94643BB4946BC4D4ABE514DC05450C15854C35C70CE7700
        73002862AD367ED22C6BB9468DDB367ED0468DDB367ED03379CB5595DB133564
        9CA2A5A1A7AA9BAAA41F9D2133AE347DCD7F6BC76E6BC76E6BC76E55BF5844B9
        4935B43B39B63E3CB74240B94643BB4946BC4D4ABE514DC05450C1586DCC7400
        73002864AF3680D42D6DBA478EDC377FD1478EDC3C83D2377CCD5898DD133564
        9CA2A5A1A7AAA5ABAF9FAFA9209D223CB13C7DCD7F6BC66D6AC66D6BC76D6BC7
        6E68C66C5FC36353BF5852BF574CBD524EBF5451C05854C25B5FC6657BD08100
        73002965AF3781D52E6EBB478FDD3780D1478FDD468EDC3881D45B9BDF133564
        9CA2A5A1A7AAA5ABAFA9B0B4A2B2AC219E2355BC567DCD7F6AC66C6AC66C6AC7
        6D7CCE7E82D08482D08583D18784D28885D28986D38A87D48C89D58E90D89400
        73002A66B03882D62F6FBC478FDD4289D63F88D93883D73883D761A0E2133564
        9CA2A5A1A7AAA5ABAFA9B0B4ADB4B8A8B8B2229F2455BC567DCD7F6AC66C6AC6
        6C81CF8300990000990000990000990000990000990000990000990000990000
        73002B66B17F7E7E2F70BD468EDD408ADA3984D83984D85C9DE18ABEEE1C4476
        9CA2A5A1A7AAA5ABAFA9B0B4ADB4B8B3BABEACBCB623A12555BC567DCD7F6AC6
        6C80CF83007300C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D42B67B27F7E7E2F70BE3A85D93A85D93A85D971ADE769A7E5458DD56896C2
        9CA2A5A1A7AAA5ABAFA9B0B4ADB4B8B3BABEB7BEC2B1C1BC25A12755BC567DCD
        7F81CF83007300C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D42B68B33A85D93071BF3A85D93F88DA75B0E85C9EE0488FD37496B4999FA2
        9CA2A5A1A7AAA5ABAFA9B0B4ADB4B8B3BABEB7BEC2BEC5C9B8C9C308902255BC
        5688D18A007300C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D42B68B43A86DA3072C0458DDC6FABE55096DC518FC88395A4949A9D999FA2
        9CA2A5A1A7AAA5ABAFA9B0B4ADB4B8B3BABEB7BEC2BEC5C9C5CDD1286BA90B95
        2955BC56007300C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D42C68B43B86DA3C7CC55E9FE04F94D65B8CBA88919891979A949A9D999FA2
        9CA2A5A1A7AAA5ABAFA9B0B4ADB4B8B3BABEB7BEC2BEC5C9C5CDD12C68B43787
        CC26A328007300C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D42C69B43B87DB4C8ECF488DCF6587A9898F918C929591979A949A9D999FA2
        9CA2A5A1A7AAA5ABAFA9B0B4ADB4B8B3BABEB7BEC2BEC5C9C5CDD13274C33B87
        DBBBCCC796C29FC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D42C69B43780D13780D13780D13780D13780D13780D13780D13780D13780D1
        3780D13780D13780D13780D13780D13780D13780D13780D13780D13780D13B87
        DBC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D42C69B42C69B42C69B42C69B42C69B42C69B42C69B42C69B42C69B42C69B4
        2C69B42C69B42C69B42C69B42C69B42C69B42C69B42C69B42C69B42C69B43274
        C3C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4}
      Visible = False
    end
    object imHist: TImage
      Left = 215
      Top = 10
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D6170360C0000424D360C00000000000036000000280000002000
        0000200000000100180000000000000C00000000000000000000000000000000
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C6CED2C7CFD3C7CFD3C6CED2C6CED2C6CED2C6CDD1
        C6CDD1C6CDD1C6CDD1C6CDD1C6CDD1C6CDD1C6CDD1C6CDD1C6CDD1C6CDD1C6CD
        D1C6CDD1C6CED2C5CDD1C5CDD1C5CDD1C6CED2C7CFD3C7CFD3C0C0C0C0C0C0C0
        C0C0C0C0C0BDC5C8B3BABEEAEAEAE9E9E9E9E9E9EAEAEAEAEAEAE9E9E9E9E9E9
        EAEAEAEAEAEAEAEAEAE9E9E9EAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEA
        EAEAEAEAEAEAEAEAEAEA858A8D979DA09BA1A49FA6A9A7AEB1B2B9BDC0C0C0C0
        C0C0C0C0C0B2B9BD008AD8EBEBEB9C9C9C9C9C9CAEAEAEA4A4A4B3B3B3C2C2C2
        9D9D9DA2A2A2A3A3A3A6A6A6C9C9C9B4B4B4B5B5B5999999CBCBCBECECECECEC
        ECECECECECECECECECEC0070B20286D8008BDB0092DC0093DE50829DC0C0C0C0
        C0C0C0C0C0C2C9CD0EA0E2EEEEEEECECECEDEDEDEDEDEDEDEDEDEEEEEEEEEEEE
        EFEFEFEBEBEBE9E9E9E9E9E9EDEDEDEBEBEBEDEDEDEEEEEEEEEEEEEEEEEEEEEE
        EEECECECEEEEEEECECECC6C6C62E9CD037AEE73AAFE836B1E847ABD6C0C0C0C0
        C0C0C0C0C0C2CFD51AA5E5F0F0F06161619999999696967C7C7C686868F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EEEEEEF0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0C7C7C73498C941B1E944B6EB41B5EB38B0E2C0C0C0C0
        C0C0C0C0C0C2CFD51EA7E5F2F2F2F0F0F0F0F0F0F0F0F0F4F4F4F2F2F2F0F0F0
        F2F2F2F0F0F0F2F2F2F0F0F0F2F2F2F0F0F0F0F0F0F1F1F1F0F0F0F0F0F0F2F2
        F2F2F2F2F2F2F2F2F2F2C8C8C8399ACA45B5E949B6EA47B9EC25AAE2C0C0C0C0
        C0C0C0C0C0C2CFD51FACE6F5F5F56060606F6F6F7777777F7F7F888888717171
        AEAEAE8C8C8CF4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F2F2F2F4F4F4F4F4F4F4F4
        F4F2F2F2F4F4F4F4F4F4CACACA3E9FCA47B9EB4DBCED4CBCED12A5E5C0C0C0C0
        C0C0C0C0C0C2CFD524AFE8F7F7F7F7F7F7F5F5F5F7F7F7F7F7F7F7F7F7F5F5F5
        F7F7F7F7F7F7F7F7F7F5F5F5F7F7F7F7F7F7F7F7F7F7F7F7F5F5F5F5F5F5F7F7
        F7F5F5F5F5F5F5F5F5F5CCCCCC40A0CC4DBDEC50BDEE50C0EE00A4E7C0C0C0C0
        C0C0C0C0C0C2CFD52BB2EAF9F9F9606060A6A6A6989898737373FBFBFBF7F7F7
        F9F9F9F9F9F9F9F9F9F7F7F7F9F9F9F9F9F9F9F9F9F7F7F7F9F9F9F9F9F9F9F9
        F9F8F8F8F7F7F7F8F8F8CECECE45A4CD51BFED56C0EF56C1EF00A7EAC0C0C0C0
        C0C0C0C0C0C2CFD543B9ECF8F8F8F8F8F8F9F9F9F8F8F8FAFAFAF8F8F8FAFAFA
        F9F9F9F8F8F8F8F8F8F9F9F9F8F8F8F8F8F8F8F8F8F9F9F9F8F8F8F8F8F8F8F8
        F8F9F9F9F8F8F8F8F8F8D0D0D048A5CD56C2ED5DC5EF5DC7F000ABE8C0C0C0C0
        C0C0C0C0C0B9CDD748BEEEFAFAFA9D9D9DD1D1D1898989A8A8A8CFCFCFBDBDBD
        B1B1B1FAFAFAFAFAFAF8F8F8FAFAFAFAFAFAFAFAFAF8F8F8FAFAFAFAFAFAFAFA
        FAF8F8F8FAFAFAFAFAFAD1D1D14FA8CF5BC3EF5FC6EF63CAF100ACEBC0C0C0C0
        C0C0C0C0C0B1CCD753C1EEF9F9F9FFFFFFFAFAFAF1F1F1F1F1F1E7E7E7FFFFFF
        F9F9F9FBFBFBF9F9F9F9F9F9FBFBFBF9F9F9FBFBFBF9F9F9FBFBFBFBFBFBFBFB
        FBF9F9F9FBFBFBFBFBFBD3D3D365B2D275D0F27AD2F37CD3F41ABAEFC0C0C0C0
        C0C0C0C0C0A9CAD95DC7EFFBFBFBFEFEFEE3E3E3F5F5F5F4F4F4C8C8C8F2F2F2
        FBFBFBFBFBFBFBFBFBF9F9F9FBFBFBFBFBFBFBFBFBF9F9F9FBFBFBFBFBFBFBFB
        FBF9F9F9FBFBFBFBFBFBD3D3D36BB5D27FD4F280D5F385D6F52BC0F0C0C0C0C0
        C0C0C0C0C0A1C8DB68CAF0F9F9F9F9F9F9FAFAFAF9F9F9F9F9F9F9F9F9FAFAFA
        F9F9F9F9F9F9F9F9F9FAFAFAF9F9F9F9F9F9F9F9F9FAFAFAF9F9F9F9F9F9F9F9
        F9FAFAFAF9F9F9F9F9F9D4D4D471B5D383D6F487D6F38BD9F33FC5EFC0C0C0C0
        C0C0C0C0C090C5DC73D0F3C9DBE1DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFE0E0E0DFDFDFDFDFDFDFDF
        DFE0E0E0DFDFDFDFDFDFE8E8E878B9D48CD7F490DAF591DBF54ACCF3C0C0C0C0
        C0C0C0C0C068BADE7ED5F581D2F1FBFBFBF9F9F9FBFBFBFAFAFAF9F9F9FAFAFA
        FAFAFAF9F9F9FBFBFBFAFAFAFBFBFBFBFBFBFBFBFBFAFAFAFBFBFBFBFBFBFBFB
        FBFAFAFAFBFBFBFBFBFBFBFBFB7DBCD391D9F494DCF596DEF453CFF4C0C0C0C0
        C0C0C0C0C051B3E085D9F68EDAF59DCBDE94C2D295C2D394C1D394C1D394C1D2
        94C1D394C1D394C1D393C1D296C2D396C2D396C2D396C2D297C2D398C2D397C2
        D398C2D398C2D399C2D39AC3D38DD1E996DDF697DDF69ADEF660D3F5C0C0C0C0
        C0C0C0C0C03EADE08DDCF496DDF494DAF592DBF491DAF390D8F38FD8F48FD8F4
        8FD8F38ED8F38ED9F379D3F375D2F378D2F376D3F376D3F379D3F479D4F47AD4
        F47AD4F47BD5F47BD5F47DD5F47DD5F57FD7F580D8F583D8F54ACDF2C0C0C0C0
        C0C0C0C0C028AAE495DDF69BDEF698DCF698DDF495DBF696DDF595DCF593DCF3
        93DCF594DCF546C8F20275CA0084D20086D00083CF0280CF007FCD007FCD0080
        CD0281CF0083D00086D20088D2028AD4008CD40090D7009ADB87B9D7C0C0C0C0
        C0C0C0C0C017A7E897DEF79CDFF79ADFF699DEF497DDF697DDF696DBF695DCF4
        95DCF680D6F508A4E108A6DF2BB3E832B7EA34B7EA34B7EA33B7EA33B6EA34B7
        EA35B6EA37B9E938B7E93ABAEB3EBAEA3FBCEC41BAEC47BFEE7CBCDCC0C0C0C0
        C0C0C0C0C071CAE57AD8F478D7F271D2F167D0F15CCEF154CCF150CBF14AC9F0
        46C8F022BEEC24B0E647BCED55C6EF59C8F059C8F05AC7EE59C8F059C8F05AC8
        F05BC7EE5AC8F05BC8F05CC8F05DC6EE5CC8F05CC8F05DC8F074BCDCC0C0C0C0
        C0C0C0C0C0C0C0C047BCEC75CFF074CEF073CFEF76CFF079D0F079D0F07CD0F1
        7FD1F185D5F38DDAF397DFF699DFF697DFF697DFF697DFF699DFF699DFF699DF
        F598DDF599DEF599DEF597DDF495DCF495DDF495DDF493DCF486C9E1C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0}
      Stretch = True
      Visible = False
    end
    object imIZak: TImage
      Left = 345
      Top = 10
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D6170360C0000424D360C00000000000036000000280000002000
        0000200000000100180000000000000C00000000000000000000000000000000
        0000C8D0D4C8D0D4C8D0D4BC9E949A431E9D42169B3E119C4116AE7D66C3C1C2
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C4CCD0C1C9CDBFC7CBC0C8CCC2C9
        CDC3CBCFC6CED2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4D0B9BA9E431C973000993505A14E27A2502A9D441AA1522A
        B28A77C4C8CBC8D0D4C8D0D4BFC7CBB6BDC1ADB4B8A9AFB3A6ADB0A9AFB3ADB4
        B8B3BABEBBC2C6C1C9CDC6CED2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4D0C3C6B7624B922B009F4519BAA69DC8D0D4C7CED2C3BFBFB58D7D
        A256319E54309D847E838386726B677260576A574E6B5C526D645D6E6C6C767A
        7D7F84878C9295999FA2A8AFB2B5BCC0C0C8CCC7CFD3C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4CF9C939D3608973000B28A77C8D0D4C8D0D4C8D0D4C8D0D4C4CCD0
        9BA0A38149319445075F6E145F881E947521BF7926C9772BBB7528AD6A269664
        377E695B7C8183868B8E9096999BA2A5A9B0B4B9C1C4C5CDD1C8D0D4C8D0D4C8
        D0D4C8D0D4C17B68993204993606BEB0AAC8D0D4C8D0D4C8D0D4C3CACE8B7E77
        7F431EB3582151AB1903D01611B31C0FA61333AE1BAD923EE38C4AE09747DA98
        3DD08628AA6A2F907B6D93999B9AA0A3A2A8ABABB2B5B8C0C3C5CDD1C8D0D4C8
        D0D4C8D0D4C178649A33049A3809BFB6B4C8D0D4C8D0D4C8D0D4A07965A1501F
        B5612EBF59303B991707980D148A0F1393120AA0151C9D1A4D911E9D8330D385
        45D4954ADB9C43C97F27A2724D9C9EA0A5ABAFABB2B5B4BBBEBFC7CBC6CED2C8
        D0D4C8D0D4C985769B3406983302BBA8A0C8D0D4C5CBCFAE7A61A84F22AD592E
        AE472174631314950E108C0E138C0F138C101591130F9E1A02A71825911AA46B
        37C26F30CA8643D7994DD68F2FA96E40A6A8AAAEB5B9B4BCBFBFC6CAC6CED2C8
        D0D4C8D0D4D59E98A23B10983100B48F7EC8D0D4AF7D65A84E21AA5427B0451D
        775F111B910C0E9510148D0F148C10148C1012860E0F850D0B8E12008D0F4F6A
        18AC4716AF5216BF7032D0904BD48E34AC7448ACB0B4B8C0C3C3CBCFC7CFD3C8
        D0D4C8D0D4D7BBBEB35132972F00AD785FBAA096A64A1AA95222AD491B925619
        2B860D2290141294141194130F92120B8409047904007801017801067D002F7E
        079837039C2D009E3700B25719C78039CC8128AC8167C0C8CCC7CFD3C8D0D4C8
        D0D4C8D0D4D0C8CBCB7C6A972F00A04417A55126AA5020AB4C1CAC4E1C447810
        2A8B162F931D12A821089C14068A0A008B080486073D5F026D4C00884000953C
        029B35009A32009931009B3200AD5114BF6D21BC6719BEB0AAC8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4CE9E969D36029F3700A64814A84C1AAB4714A2470E376E05
        2F8319318A190FA01905A415009E10009C09357C05B03B01B53600AA3400A233
        009D35009C35009B34009831009A3402AF561DB85D09B2764EC8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C5B3AFA64513A83F00A54003A23E05A33E00B53D00754B00
        267C1B338E2A0FA62700B01C32A117917107BC5700C45100BB4D00B54600AA3F
        00A23A009D37009C35009C34009830009F3F0EAF5617AE5513BEB3AFC8D0D4C8
        D0D4C8D0D4C8D0D4C7CDD0A96440B4500AB5510BA73F00B14700A548007C4B00
        4A6B0F457E214E851B797804C97203E46C00DB6D00D36A00CF6300C85A00BE4E
        00B34500A63C009E37009C35009B34009D2B00A74616A94704B68C79C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4AE7D67B14D0BCD7830B74E03B04B008E4D00B45700
        B95800B25A00CC6800EB8000E68800E18800E18600E08200DC7800D76F00CF62
        00C45500B54700A63C009E3600A330008E5E289C5524A43B08A37855C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4AC6B47A73E00D07C32D977286E56007D6300E27000
        D57000BD680AC36D09DF9100EBA200EA9F00EA9C00E89600E58E00E28300DB76
        00D26700C55700B54600A83700805217359A483F913E7C672A837A47C8D0D4C8
        D0D4C8D0D4C8D0D4C5C7CAAF6333AF4700C15B0FE8A45AA26D13BB6B00D18105
        B47B09B97915C07913DA940DEEB30FEFB40BEEAE06EDA700EB9F00E89400E488
        00DC7800D16700C55100AB490839923A197924207521229A3D618644C8D0D4C8
        D0D4C8D0D4C8D0D4C5C7C8B66F40C15C03AC4700DB9450EAA764D5760DBE8311
        CC9F1EDB991ACE8C17D1941BE4B422F1C724EFBF1BEEB710EEAF05EDA400E998
        00E48800D97500D15D00B2580D39A4492190372678251B7C24568A48C8D0D4C8
        D0D4C8D0D4C8D0D4C5C9CDBE815BD774265671009F6F19F6C28EDEA257BA8F13
        ECC333E2B633D19A29CD9326D6A32BEAC534F2D231F0C625EFBC18EFB209EDA6
        00E89600DF8300D96700B36D1C3CBF642FC35E34C76126AF4D74A56AC8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4BA876AED955642B115389803E88D55F9D8A8C49D44
        E8C340F1D253DDB043CF9635CE9432D9AA39ECCE41F2D63AF1CB2BEFBF1CEEB1
        0AEBA200E48E00DF7200BB6D1647D3783CE27939DA6F4AE286978E68C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4BA937CED9D6376C95301DE1C7D840CFCBE95FADEAC
        DFB45AF1DA69EFD068D8A74DCE943ECF963BDCAC40ECCC46F3D83DF1CC2CEFBD
        18EDAC05E89700DF7E00CE640465B9613EE88243E17840E17AAA9E85C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4BEB2ADDD8E5496CA7110DD3706C001A7862BFFE5C0
        ECD99DDFC071FBE389EDCC76D9A856CE9846CF9841D9A942E8C442F0D339F1CA
        26EEB510E89D00DE8700DE5C0078A64C42F38D44ED8342C261BDA99FC8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C7CFD3C4846080D46F0ACD3000C40720AF00C9934E
        FFF7CAE9D68FD0CC97F2E5A8E5CC8EDCAC5DD19A49CF9941D5A23BE0B738EAC4
        2EEDB91BE9A206E48500AC882D6CA85749E68043ED8880905CC4C0C3C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4BDA197C2AA6532DB5002BE0E00C60039A706
        DEA66BFFFDC6D7DC95AEDECDE4E6C2ECD095D9B56ED5A248D09A3DD29D33D8A3
        29DEA31DE09708DD81055FBC6B9C8B33929534957D2CBB9586C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C6CED2C5866BA6D27A1DDB4200B80000D511
        53A727DFAC78FFFFC3DBD592D3D7BCD5F3E8ECDCAAEAC985DCAE4FD4A034D198
        27D18E1AD67E09D26D027E903E749646AF732BB54305BEB0ABC8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4BFB8B8D4926980DA7303CD1B00C000
        0CE44179A156E5AF80FFF9B7DCD29AD8E2D5FDF1DFFBE7D0F2D7A0E6C05FDDA8
        2ECD8D1B977712AC6B0F559A4937BB678F8450AF654BB18977C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C1ADA6CE9D6B53E26200CC10
        14D533BCE9B7E89F7DDDA675FFF0B3EEC689EBCEB0E8E6D3EED9B5F6D59BF4C5
        72CDA849A5861FBA741B3AB85A5A984EBAA096BBA39BAE7A60C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C3B0AABC986854DD5A
        12E03B77EA97B6F2CA9AAB85CA9F73FEE0A9E6B875C6D1BDD6E6D2E7C68CCABA
        74E9AC61C0AD66B49C5E89985DB99C92C8D0D4BEB0AAAB7153C6CED2C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C3BCBABC8C6F
        72BE555FE07781EDAE8DF3CDA4B291CC8959F1BE82E4AD62C0B791D4B987DBAD
        64B2B36E71AD6EA77E63C4B8B8C8D0D4C8D0D4BBA8A0AB6D4FC7CFD3C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C2AAA1C29371D6A575B3CDA7A2FCE39EDBC7B1A783E2A769DF9842D48431D484
        40A18663AEAD9FC6CDD1C8D0D4C8D0D4C8D0D4B08069AB7155C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C7CDD0C1B7B2B79D8EB19582AD9E86A89A80BB8871DB8F65D6872FC866
        0AB76B3EB8A597C3C5C7C6CED2C8D0D4BBA9A1A04517B89B8FC8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4CAC7CAD2A59ACA7A
        46BF5F0BB84C00AC4C11A85C31A5552C9B3603AC7052C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8BF
        BFB07759AF5417AF5215A74811A03F0CA55B36C2BFBEC8D0D4C8D0D4C8D0D4C8
        D0D4}
      Transparent = True
      Visible = False
    end
    object DBText2: TDBText
      Left = 495
      Top = -1
      Width = 298
      Height = 15
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Names'
      DataSource = DM.srSprTov
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object imCompend: TImage
      Left = 290
      Top = 10
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D6170360C0000424D360C00000000000036000000280000002000
        0000200000000100180000000000000C00000000000000000000000000000000
        0000119FF911A3FA11A8FA10ACFB0FABFB11AAFA12AAFA12ACFB13ACFB11ABFB
        10AAFB0CA8FB09A8FB06A8FB05A8FB03A8FB04A8FB07A9FB09A9FB0DA9FB11A9
        FB13ABFB12ABFB12ACFB11ABFB0FAAFA0FAAFA11ABFB11ACFB11A8FA11A3FA11
        9FF911A2FA10A7FB10AEFB0FB3FC10B1FC10B0FB10B0FB0DB1FC0BB0FC0BAFFC
        0DB0FC10B0FC14B1FC16B3FC18B3FC17B3FC16B3FC15B2FC11B2FC0EB0FC0CAF
        FC0BAFFC0CB0FC0FB1FC10B1FC10B0FB10B0FB10B2FC10B2FC10AEFB10A7FB11
        A2FA11A8FA10ADFB10B7FC0FBEFD10BDFD11BBFC10BBFC0CBBFD0BBBFD0EBBFD
        18BDFD26C1FD34C5FD3EC8FD44C9FD45C9FD41C8FD39C6FD2DC4FD1FC0FD13BC
        FD0CBBFD0BBAFD0EBBFD11BBFD11BCFC10BCFC0FBDFD0FBEFD10B7FC10ADFB11
        A8FA10ACFB10B2FC10BEFD0EC6FE0EC4FE0BC1FD0CC2FD12C4FE21C7FE34CCFE
        4AD2FE5FD8FE71DDFE7EE0FE85E2FE86E2FE81E0FE77DDFE68DAFE55D5FE3FCF
        FE2ACAFE18C5FE0FC2FE0BC1FE0DC2FD0FC3FD0FC5FE0FC7FE0FBEFD0FB2FC11
        ACFB10ABFB10B1FC11BDFD0FC4FE0EC3FE0DC1FD15C3FD2BC8FD52D1FD75DBFD
        90E2FDA3E7FEAFEAFEB4ECFEB8EDFEB7EDFDB3ECFDAFE9FDA6E7FD9AE4FD85DF
        FD65D7FE3ECDFE21C6FE0FC2FE0CC1FD0EC0FD11C3FE10C5FE0FBEFD0FB1FC11
        ABFB11AAFA10B0FB10BBFC0CC1FD0EC1FD1AC2FC3ACBFC63D6FE91E2FEB2EBFE
        C6F0FECCF1FECDF0FDCCF0FDCFF1FED1F3FED1F3FED3F4FED0F3FECBF1FEBAEC
        FE9EE4FE75DAFE4BCFFD25C6FD12C0FC0CBDFC0FC0FD0FC2FD10BCFC10B0FB10
        AAFA11AAFA0FB1FB0FBBFC0DC2FD1AC4FD3DCBFC73DAFDA3E7FEC1F0FECEF4FE
        D2F5FECEF3FECBF1FECAEFFDCBF0FECFF3FED2F4FED3F6FED4F6FED3F4FECCF1
        FEC4EFFEAEE9FE88E0FD53D2FD2AC7FC12BFFC0DC0FD0DC2FD11BCFC11B0FB10
        AAFA12AAFB0CB0FC0CBAFD17C5FE3ACCFE6AD7FD9DE3FCB9E9FDBEEAFCB8E8FC
        B9E8FCBBEBFDBFEEFDC4EEFEC1EDFDBDEBFDB7E8FCB2E7FCB1E7FCB4E7FCB9E9
        FCC6EDFDC8EFFDB5ECFE87DFFD52D1FD24C4FD0EC1FE0AC1FE10BBFD10B1FC11
        ABFB11AAFB0BB0FC0DBAFD30CCFE6CDAFE99E2FDAAE3FC9ED9FA8ACEF97DCAF8
        88CEF9A1DCFBBAEAFDC4EEFEB6E7FC9FDAFA8AD0F97BC9F87AC8F886CDF899D8
        FAB5E5FCC7EEFDCBF1FEB5ECFD83DDFD45CDFD1CC5FE0DC3FE0EBBFD0FB1FC12
        ABFB0EA9FB0DAFFC19BDFD51D5FE98E6FEB7E9FDA1DBFB70C2F749ADF53AA6F3
        4EB0F582CBF8B3E5FCBFEBFD9CDAFB6DC0F74EB0F53AA5F339A5F354B3F57ECB
        F8A7E0FBBFECFDCEF2FDCBF2FEA6E6FD6AD6FD34CBFE14C5FE0BBAFD0CB0FC13
        AAFB0AA8FB14B1FC31C3FD76DFFEB6EEFEC2EBFD93D3FA4CAFF51993F10C8AF0
        2198F266BCF7A6DEFBABE1FB72C3F832A2F41792F20A8AF0118FF03EA7F47ECA
        F9AFE4FCC3EEFDCDF1FDCFF2FEB9EBFD8EE0FD57D4FE25C9FE0CBBFD0BB0FC12
        AAFB08A7FB1DB3FC4BCAFD95E7FEC5F2FEC1EAFD89CEF93BA7F40488F0007FEF
        1391F25BB7F696D6FA90D3F94BAEF50B8BF10080F00084EF1A95F154B3F695D5
        FABCEBFDC6F0FEC6F0FCC8EFFDC1EDFDA9E7FD78DDFE3BCEFE14BDFD0CAFFC10
        A9FB0BA8FB28B6FC62CFFDACEEFECEF5FEC0EBFD89CFFA3DA7F40588F00081F0
        1A95F255B5F67BC8F969BFF72A9DF20081EF007FEF1491F14EB1F58AD0F9B4E7
        FCC6F0FDC7F1FEC4EFFCC5EFFDC8EFFDBBEBFD95E4FE56D5FE24C1FD10B0FC0D
        A9FB0EA9FB31B9FC72D3FDBAF1FECFF6FEBDEAFD8AD0F944ABF50D8CF10286F1
        1C96F243ACF553B3F63DA8F41391F10485EF1391F148ADF488D0F9B6E7FCC8F2
        FDC9F2FDC7F0FDC3EEFDC2EEFDC9F0FDC4EEFDA7E9FE6DDBFE33C4FD13B1FC09
        A8FB12ABFB38BBFC7DD7FDC5F4FED3F6FEBBE9FD88CFF944AAF50D8CF10084F0
        0E8EF1259BF2299DF31793F10489F00E8DF13DA7F378C6F8ABE2FCC6F0FDCAF2
        FDC5EFFDC5EFFDC4EEFDC1EEFDCAF0FDCBF0FDB4ECFE7EE0FE3EC7FD16B2FC05
        A8FB15ACFB3CBCFC83D8FDCAF5FED4F6FEBAE8FD87CEF944ABF50D8DF10083EF
        078AF01592F11391F10388F00085EF1592F256B4F595D6FABFECFDCDF4FECAF2
        FEC1EDFCC4EEFCC5EFFEC1EFFECAF1FDCDF1FDB8EDFE86E3FE44C9FD17B3FC04
        A7FB15ACFB3DBCFC85D9FDCBF6FED5F6FEBAE8FD87CEF944ABF50C8CF10083EF
        0A8CF11C96F21B95F1098CF00086EF1290F14EB0F58ED2FABEEBFDCEF4FECBF2
        FEC2EDFCC4EEFCC4EFFEC1EFFECAF1FDCFF1FDB9EEFE87E3FE45CAFD18B3FC04
        A7FB14ABFB3BBBFC81D8FDC9F5FED4F7FEBBE9FD88CEFA43AAF50B8BF00084F0
        1391F233A2F440A9F42B9EF3098CF00388F02A9DF263BBF79BD9FABDEBFDC8F0
        FDC6EFFDC5EFFDC3EEFDC2EEFDCBF0FDCEF0FDB7EDFE83E2FE41C9FD17B2FC05
        A8FB11AAFB35B9FC78D5FDC0F3FED1F7FEBCEAFD88CEFA41A9F50A8BF00084F0
        1A95F24EB1F670C2F75CB8F7249BF30085F0098AF02FA0F36ABFF6A0DBFBBFEB
        FDC9F0FDC7F0FDC3EDFDC2EEFDCAF0FDC9EFFDAEEAFE76DEFE3AC7FD15B2FC07
        A8FB0CA9FB2DB7FC6AD2FDB4F0FED0F6FEBFEBFD89CFF940A8F50B8BF10083F0
        1B96F25EBAF794D6FA8CD2FA4CB0F60C8EF10084EF0A8DF037A5F373C3F8A6DE
        FCC1EDFDC7F0FDC5EEFCC5EFFDC9EFFDC2EDFDA0E6FE63D9FE2CC4FD12B1FC0A
        A9FB09A9FB23B5FC56CCFDA1EBFEC9F4FEC1EAFD8BCFF940A9F50C8BF10083F0
        1794F25FBBF7A4DEFAB0E4FC7ECAF83EA9F51E97F21190F1229AF252B3F58CD2
        FAB5E7FDC5EFFDC8F0FCC8F0FDC4EEFDB2E9FD87E0FE48D2FE1CBFFD0FB0FC0F
        A9FB09A9FB18B2FC3EC6FD86E4FEBFF1FEC4EBFD8ED0FA41AAF50D8BF10082F0
        1592F15CB8F6A5DEFBC2EDFDA8E0FB7BC8F85DB9F649AEF549AFF465BDF790D4
        FAB2E6FDC2EEFDCCF1FCCDF1FDBFEDFD9DE3FD69D8FE30CBFE10BCFD0DAFFC12
        AAFB0CA9FB0FB0FC23C0FD63DBFEA9ECFEBBE9FD8DD0FA43AAF50E8BF10082F0
        1792F15BB7F6A4DEFBCAF2FDC4EEFDAEE3FCA3DDFB98D8FA96D7F99FDBFBAEE3
        FCBBEBFDC1EEFDCBF1FCCBF1FDB1EAFD7CDBFD45CFFE1BC6FE0BBBFD0CAFFC13
        ABFB10AAFB0BAFFC11BCFD43D2FE86E4FEA3E3FD87CFF947ABF5108CF10082F0
        1893F25AB6F79FDCFAC8F1FCCDF3FEC5F0FDC7F0FEC6F0FDC7F1FDC7F0FEC5EF
        FDC7F0FEC8F0FECCF0FDBEEDFD95E2FD57D2FD27C8FE10C3FE0CBBFD0DB0FC12
        ABFB12ABFB0BAFFC09BAFD26CBFE57D7FE79D8FD74CAF945ABF5118EF10082F0
        1793F259B6F79EDCFAC6F0FCCBF3FEC4F0FDC7F1FEC7F2FDC8F2FDC7F2FEC5F0
        FDCAF1FECBF1FEC0EDFD9DE4FD69D7FD31C9FD11C3FE0AC1FE0FBBFD0FB0FC11
        ABFB12ABFA0EB0FB0AB9FC17C6FD31CDFD4BCCFC52C0FA36A7F50D8DF00083F0
        1994F15BB7F6A5DDFBCEF2FCD0F3FDC7EEFCC8EFFDC9EFFCC9EFFCCAF1FDC9F0
        FDC8F0FDBCECFD9EE4FE6DD8FE3DCCFC19C2FC0BC1FD0BC2FD11BCFC10B1FB10
        AAFA11ABFA0FB0FB0DBAFC10C4FD17C5FD23C1FC29B5FA1B9FF5068AF10084F0
        1B94F15BB6F6A7DEFBD2F2FCD5F4FDCCEFFCCEF1FDCEF1FCCDF0FCCCF0FDC4EF
        FDB3EAFD93E1FD67D6FE38CAFE1AC2FC0DBEFC0DC0FD0DC2FD10BCFC10B0FB10
        AAFA10ABFB10B1FC10BCFD10C6FE0FC5FE10BEFD11B0F9089BF40089F00085EF
        1893F14FB4F696DBFBBEF0FDC1F0FEBAECFDBBEDFEB9EDFDB4ECFDAEEAFE9EE7
        FE83E0FE5DD5FE36CBFE17C3FE0CC1FD0DC0FD11C3FE0FC5FE0FBEFD0FB1FC11
        ABFB10ACFB10B2FC10BEFD0FC8FE0DC7FE0CBEFD0AB0F8039CF4008CF00087EF
        1094F239B1F76CD2FB8BE4FD8EE5FE8BE2FD8BE3FE87E2FD7FE0FD71DCFE5CD7
        FE42D0FE28C9FE15C5FE0CC2FE0BC2FD0DC3FD10C5FE0FC7FE0FBEFD0FB2FC11
        ACFB11A8FA0FADFB0FB7FC10C0FD11BFFD10B9FC0DAFF907A1F60497F40494F3
        0C9BF520ACF838C0FB47CBFC49CCFD49C9FC48CAFD45C9FC3FC8FC34C4FD25C0
        FD17BDFD0DBBFD0CBBFD0EBBFD10BCFC10BCFC10BDFD0FBEFD10B7FC10ADFB11
        A8FA11A2FA0FA7FB10AEFB10B3FC11B3FC0FB0FB0EACFA0CA6F90CA3F80CA1F8
        0EA4F811A8FA15AFFB18B3FC18B4FC19B2FB18B3FB18B2FC16B3FC14B1FC10B0
        FC0DB0FC0CB0FC0DB0FC0FB1FC10B0FB10B0FB10B2FC10B2FC10AEFB10A7FB11
        A2FA119FF910A3FA0FA8FA11ABFB11ACFB10AAFA11AAFB10A9FA10A9FB10A8FB
        0FA8FA0BA7FB07A7FB03A7FB03A8FB04A7FA03A8FA05A7FB06A8FB09A8FB0CA9
        FB10AAFB12ABFB13ACFB12ABFB10AAFA10AAFA11ABFB11ACFB11A8FA11A3FA11
        9FF9}
      Visible = False
    end
    object imSklad: TImage
      Left = 390
      Top = 10
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D6170360C0000424D360C00000000000036000000280000002000
        0000200000000100180000000000000C0000130B0000130B0000000000000000
        00000000FF0000FFDBDBDBCFCFCFBEBEBEB9B9B9B8B8B8B8B8B8B8B8B8B8B8B8
        B7B7B7B6B6B6B6B6B6B5B5B5B4B4B4B4B4B4B3B3B3B3B3B3B2B2B2B3B3B3B7B7
        B7C6C6C6DBDBDBDBDBDB0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FFDBDBDBC6C6C6BABABAB7B7B7B6B6B6B5B5B5
        B4B4B4B3B3B3B1B1B1AEAEAEACACACA9A9A9A7A7A7A6A6A6A5A5A5A6A6A6A8A8
        A8ADADADBEBEBED4D4D4E5E5E5DBDBDB0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FFDBDBDBD2D2D2BEBEBEB5B5B5B2B2B2
        AFAFAFABABABA5A5A59E9E9E9797979191918C8C8C8888888787878B8B8B8989
        897878785C5D5E6F7071ABABABCECECEDBDBDB0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FFDBDBDBDCDCDCC3C3C3B2B2B2
        A9A9A9A2A2A29999998A8A8A7B7B7B7272726C6C6C6666666465655B5F626161
        61292C301F22282022245A5B5DA2A2A2C7C7C7E0E0E00000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFDBDBDBE4E4E4CACACA
        9E9E9E727273686969696A6A575B5E4A4E533E444A3C3E41174D6B0A55811947
        6632353935373A1C49622948587070708C8C8CB8B8B8D8D8D8DBDBDB0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFDBDBDB
        4E515412171D323437151B23171B231C20281A1E255354551B3E540F6A981A6A
        9245484B40414422536C1B5D7C255875367392747B7FA9A9A9D1D1D1DBDBDB00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFC1C2C2
        2E31351D21265354551D1F23151A222D3035191C225657571F44591371A01670
        9D3B3F4347484B2E4E5E17567B141D241B77A72981AD667F8B9E9E9EC7C7C7DB
        DBDB0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFBEBFC0
        43454925292E53545516181C0E141E1D232B0D213455595C1D374C1675A41979
        A71E31423B3F443C3E402C383E182A371C75A30A5A87207FAB393E436D6E6FCB
        CBCB0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFD8D9D9
        4244472C303552535416191E12293B2C394510345051575B253E4F1A78A61776
        A50D486F204E6729576E21252A1D3D4E2582B0144F6E2A93BB223743232D34C0
        C0C10000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFFDFDFD
        5153572E343B5152541A1D23253749353A41171E265253542F4652186A93226A
        8C2F718E36A3D33BADE13187B0245A75267BA41E79A62C97BE2F526216679199
        A0A40000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFF8F9F9E5ECEF
        9AA8B14B62745D798E99BCD1577C964C6D873E546355595D303234171C221E3E
        524344462586B72E97CB34A2D73094C4297CA42482AF2C95BC376A7D165F8673
        8C980000FF0000FF0000FFDBDBDBDBDBDBBBCBD597ADBD99B8CB456A86345D7E
        2F56773658742E4D6795BBD27292A851728B3D607B476A8548617429323A0F27
        364A4D4F19658F1A77A8268BBE3099CC2D93C32781AD2A93BA3B7F98254A5E71
        7D83B4C6D0A0BACB53748F436988305676305677335A7B95BBD1476A84486D8A
        4A76914C7F8E488E9A3A9099268C902A95943B818A4E768A41637D4368844365
        7E525D651246691159840C56841974A62B92C62E94C52D95BD3993B42B2E32A3
        A3A3E8ECEE8AAEC4415C724B667B4B738F467B92498C9C3E8C9828888E219192
        28A3A02CA9A52FAFAA4DB6B275B9B729A09A1A807B1F837E318286497D8C475C
        6D46545D2F6A86266E911A25310E4B73156A9C1972A42486B635A2D54C9EC5DC
        EAF076A6AF4997A3318E95238F9127A19E2BAAA63EAAA62EA6A32EAEAA31B5B1
        34B7B334B8B436B9B45AC1BD55C0BC2BA49F19807A1C827C1A807B1A817B2782
        81456C72345E722685B42456711C567633A0D136A5D51C74A3156A9A4198C478
        B8D549AFAB2EB1AD33B5B134B7B334B8B462C4C183C0BF39AEAB34BAB735BBB8
        37BCB837BCB838BDB836BCB736BCB72DA7A218807B1C857E1C857F19807B1B81
        7B306462363F45114C711C7BAC2689B93DB0E041B6E62A82AC2682AFC6DAE300
        00FF56BEBB35BCB938BDBA37BDB939BEBA36BDB835BCB72FAEAA2FB2AD2DAFAB
        31B5B133B6B237BDB937BDB837BDB82FACA61A847E1B847E1A847F19807B1C84
        7E306D6A4243442F32372184AA2181AE153E58236F962E8EBD2A7BA3B5D2DF00
        00FF5BC0BD34B9B533B8B435B8B438BEBA38BEBA37BEB931B0AC78CFD18DD5D8
        63CACA38BFBB39BEBA38BEB938BEB931B0AA208C862386801B847F19817C1B84
        7E2A6C694A4A4B494A4D237CA52486B62D333926282B1C3F5358A6CCCADFE900
        00FF7ACBCA75CDCE5DC9C93FC2BF3AC0BC39BFBB39BFBB32B1AE8AD5D87CD1D3
        4DC5C339C0BC38BEBA32AEAC2FA8A6299C9A1B817E2686801C8580208D862187
        8129706D4F4F504F50513790BA3AACE23B43483080A7747F850000FF0000FF00
        00FF90D3D397D9DD66CECE45C5C23AC1BD3AC1BC37BBB72B9E9D3DADAD32A9A8
        2FA7A62DA6A52EA6A536B5B230B1AC30ACA71B807B1877741778761B847F2687
        802975725354564A4B4C84A4B4C2DFED484A4CC9CFD20000FF0000FF0000FF00
        00FF79C5C54BB3B430AAAA30A9A92FA8A72EA7A62CA5A32EABA835BAB531B2AD
        36BAB638BFBB39BFBB3ABFBB33B3AE35B3AE1B827C1D857F1679741B817C1A78
        7525716E565758474849ACADADFFFFFF505051D8D8D80000FF0000FF0000FF00
        00FF6CC0BE36BDBA39BFBD3ABFBD39BFBB4BC5C288C3C258B8B638BEBA35BAB6
        38BFBC39C1BE3AC1BD3CC1BD3CC0BC39B8B41B817C1B837E1B837E1B837D1E85
        8021726E595A5B575758C2C2C3FFFFFF545555D5D5D50000FF0000FF0000FF00
        00FF74CCCA3BC5C43DC5C43DC5C23DC4C145C5C253C7C433B2AF3CC4C14CC4C1
        3BC4C13CC4C13BC3BF3BC2BE3DC1BE3ABCB8197F7A1A837D19817C1B837E1B84
        7E338983B6B6B7717272FFFFFFFFFFFF585859D2D2D20000FF0000FF0000FF00
        00FF7CD2D13FCBCA3EC7C63FC7C53FC6C33DC4C13BC2BF35B6B39ED8D8D5DEDF
        40C7C53DC5C23CC4C13CC3BF3DC3BF3CBFBB1F8C861C868019817B19817C1A82
        7C26827DCCCCCC5A5B5BFEFEFEFFFFFF5B5B5BCFCFCF0000FF0000FF0000FF00
        00FF7DD1CF43C4C147C3C13AC1BE3EC4C23EC5C23DC5C137BAB780D2D19FDFDE
        41C8C63EC6C342C5C151C6C559C8C650C5C21F8F882387811B837D1F8C871E87
        811B817B58595A49494A828384F4F4F45C5C5DCCCCCC0000FF0000FF0000FF00
        00FFA7DDDDADE3E792DCDF59CFCE3FC7C53FC6C33EC5C23BC0BD36B8B636BAB8
        3DC5C23BC2BF49C0BD3EB9B431B0AA2FA9A326968E298F881C86811F8E882789
        831D847E3B3F3F3D3D3E3839394A4A4A464748C8C8C80000FF0000FF0000FF00
        00FFA5DCDC88DBDD47CCCB40CAC73CC3C038BDB835B7B230AFAA2CA39E2BA09A
        289C95289C95299D962A9E97289C95269C95249D97269D96279C952799912892
        8A1E8A843B45443C3D3D393A3B393A3B343435CCCCCC0000FF0000FF0000FF00
        00FFC1E4E36DC0BD39A39D279C95289C95299E96299D96279C95259C96249D96
        269A94269892269892259891279A932A958E2F8B86327F7C2F706D3565635374
        737080818C8E8FA8A8A9C0C0C0DBDBDBDBDBDB0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FFD9E7E6A6CFCD73B7B3419F992B968F46A39D64B0AB
        7DBDB999CAC7B6D6D59FB4B3737B7E98999BB0B1B3C9C9CADBDBDB0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF}
      Transparent = True
      Visible = False
    end
    object imWait: TImage
      Left = 430
      Top = 10
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D6170360C0000424D360C00000000000036000000280000002000
        0000200000000100180000000000000C00000000000000000000000000000000
        00000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FFE7E9E9E0E0DDD8D7D7D0D1CF
        CACDCDCACBCDCFCECDD6D6D3DADBD9DFE0DE0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FFE1DFDECECCCBBCBBB9A5AEA890A091739A7A558D62
        4C825A568565839687A3A29F8B8D8A6C6D6B959594C6C6C6E1E1E10000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FFBDC0BE8AA1936E957956885D3B6F3F2C653129662E258C3F
        15832D11782A1657241F241F0C0E0C4748484646457E7D7DC2C0C0E0DEDE0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF74A97C4F835141794443774240773E3A783944C16142C66439BF5C
        1EA74523A64429A94D1F3D254E5253D0D2D2B5B4B4676565A2A0A0C9C7C7DFDD
        DDEEEDED0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF80C89045A04E4DA65B5880545C66465D523B5A4A34629C6C6B8F72559264
        268A5B35858B1694393F8952676A696A6B6B8F8E8E706E6E9C9A9AB6B4B4CAC8
        C8DCDBDBEAEAE90000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF48BD6850C66E5CA55F8974677E675B695E4954583F5D92626AC38260D180
        3EBB5F38AF5E29A64753AD6D5759599797977F7D7D4745458D8B8BA2A0A0B5B3
        B3C7C5C4D9D7D6E8E6E50000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF55AC6C6D94765E8F627EA2787DB6827BC78A79CB8B71AF754B79473AA051
        40CF6640CD633FBA6440BB64414F455252524240402C2A2A5C5A5A8886869D9B
        9BAFADADC1BFBED2D1D0E0E0E0EDEDED0000FF0000FF0000FF0000FF0000FF00
        00FF6FC9867CD39181BE8B9BC9997C9C7191A98A86997F6A7A5C404D2C3D9D4C
        39C85C3DC75F3E5D364DB05D2D7B411A241E2321231C1C18403B3B47433F7570
        6E969490A6A6A1B5B5AFB9B7B5A5A3A3BCBABA0000FF0000FF0000FF0000FF00
        00FF91D6A163A9666F7B5AABB89C929781959982A9A99D958E803B362041944C
        3AC05E37BF5D3E4C2B659D612EB65330A64F326639635C54526C513B3B313C34
        2F56514A86827D76726E1F1E1C32302F535151949292E2E1E10000FF0000FF00
        00FF99D5AA699E61706756B1BAA799B094849D7A61875F456B46324D2B1F2F18
        1B2811264A25485436688560368344549A60439C5183746C56B2693BA1523652
        374A433B7B756E948B87302B29B0B0AFB7B5B67472739A999AC2C1C20000FF00
        00FF9BD2A85CA15A5071443E57342D361B1D1B071D1706191102180D01180D03
        211405232E10444E345B4B3D779A6B3C7F4A3A924981706A5AA96C32B45434B2
        533D8B4C717864847771564F4D9091917574764848492524264F4E50A5A5A600
        00FF97A58F866A38785C3E4F422F3E32202D24141D1304191005160E06140A03
        24180828320F39432D33281C4E473533A04C35914585706BB5B6AB8ABA9039AE
        5827AE4930A64E507C515F5E596566668281832C2B2D939294B9B8BA8D8C8E00
        00FFB2ABA47D5B32A57C4C655441514536463B2D372E22231A10130C03120B04
        221507282F0E2D3C23362D22413C27299542308D4284726BBDB0ADCEC2C0BCC4
        B370B37C27A04920A2422F8B442339292A2A2B4C4B4D8383846E6D6F69686A00
        00FFCBC7C26F5334A27B4D705C45544A3E483F333E362C302921231E170D0903
        211507282C0C203219241D16322F1C248F3D2E883E827069ADA19EBEAEAFCBBF
        BDCEC4BFB5C1AA55A7691E97401E963F296A3A8FA0965654568889883E3E3DB7
        B7B80000FF65503796765473624C544E424C443B413A3039332D28251E1A1C12
        1B220D23360F205F2B1324132021101D87352B7F3884726AB0A29FBBADABBAA9
        A8C1B2B1CDC1BFCDC3BE9AB99B3E9755128F3323863A20482A242521393334C3
        C3C30000FF64553F8570545F594146543B4160423A7144358647399C533CB05C
        39B65D35B259139336168B3511672317862D267D35826F68A39491AA9B99BCAD
        ABBEAFADBBACAAC7B8B6CFC2BFC5C8BC85B087268E4312883116672A31433400
        00FF0000FF5AA56449B55F51CF6E4FDD7145D76B3ED5643ED15F3ACC5D36C75A
        2CB85227AB4B1090331D9C3F1FA042169539247C357F6E68A79895B3A4A2A798
        96AD9E9CC0B1AFC3B3B1BFB0AEC7BBB7CDC3C0C2C2B86DA6771A88371B8233AE
        CDB80000FF47D26B4DE87649E37344DF6F40DA6A3FD66642D0653FCF633ED063
        32BB571F9D3F0E8E2F15953620A3432BB0503AA8537A72669B8A87A39490B0A1
        9FB7A6A6AC9A99B5A3A2C8B8B6C1B3B1C4B6B4CEBFBDD1C4C2B4BFAD579C65A1
        C3AB0000FF50CA7258E97E5BE98162EA8465EC8765EF8969F08A65EF895CEA83
        55DF781C9B3E1191321292331A9E3D24AA4835AE527B7566A0918CAC9C99A293
        91A69595B3A1A0B8A5A4B5A2A1BFAEADC8B9B7C6B7B5C5B6B3CCC0BECAC3C2D9
        DAD80000FFA3E1B496F8AD90F7AA8BF6A482F59E77F4976BF08F62EA8758E57D
        50E07631BE561A9E3C149636169A3921A64533AA4F7B75689183819B8B88A697
        95AE9E9CA99796A89695B6A4A3BDABAABAAAA9C0B1AFCABCB9C5B7B2CABAB8E0
        DADB0000FFE5F3E894E9A984F3A185F1A075ED935AE57C4FE07447DC6D42D969
        40D7673FD56536C35B22AC461FA5431EA34230A74D7F786B958785A494929D8E
        8CA08F8EA99796B19F9EAB9998AE9C9BBCACABBFB0AEBCADABC4B5B1CCBDBBDF
        D9D90000FF0000FFD2EBDA7AD3928EECA797F1B182EB9F64E48654DC794CD873
        46D46D41D1673ECE653AC96130BC562CB5512FA84B807C6E8C7D799283819D8E
        8CA59592A3928FA1908DAA9998B2A1A0B1A1A0B5A6A4BEB0ACC2B3AEC0B1AFDC
        D6D60000FF0000FF0000FFF3FAF5A4E0B97AE0928DECA388E6A27EE29872DC8D
        66D78458D0794EC96F47BC6545AF5C4EA1595D91598C827A90807D9A8B87988A
        85978883A0908AA89892A59694A39492A99999B6A7A5B6A7A3B8A9A5C1B2AFDB
        D4D30000FF0000FF0000FF0000FFFBFDFDDDF2E087DC9C7DCF907BBD877EB182
        82A87F8AA080959B869F9B8CABA499BCB0A9CDBAB6D0C1BBA4989190827A988B
        839C8D879C8C869A8A859E8F8DA79896A79797A89996B1A29EBBACA8B8A9A7D6
        CFCE0000FF0000FF0000FF0000FF0000FF0000FFD5D5D2BEB7B1C6BDB7CDC3BC
        D4C8C0DACDC3DED3CBE4D7CFE6D8D0E5D8D0E7D8D1E8D7D2E7D8D2DDD0C8B4A7
        9F95877F9989839E8E899F918D9A8D89A0918FA89997AC9D9AAE9F9CB3A4A3D3
        CCCB0000FF0000FF0000FF0000FF0000FF0000FFFBFAF9EAE8E6E5E3E1E9E7E6
        F3F0EEF1ECE8ECE6E1E6DED9E0D6D0E1D4CDE5D4CFE3D5CFE0D4CEE2D5CDE3D6
        CEE1D3CBC5B5AFA3938D9586809F9089A0918E9F908CA1938DAC9E99B0A29FCF
        C8C70000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFF7F7F8
        EBEAEBE7E7E6ECECEAF7F7F5F7F4F1F3EDE9EBE3DFE5DBD6DDD2CCDCD0CBDED1
        CADFD2CAE0D1CAE2D1CBD2C2BBAF9F989687839F908CA59691A2938FA69794CA
        C3C20000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FFF6F6F6E8E8E8E6E4E4E9E6E5F2EFEEF0EEEBF0ECE7ECE3DFE3DA
        D5DDD2CCDBCDC7DDCCC7DDCEC8DCCDC8D8C9C6B8A9A69E908C9B8D8AA49692C6
        BFBE0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFF5F4F4E6E5E5E2E0DFE4E1DEEFE7E6EBE5
        E2E9E4E0E8DFDCE3D9D6E1D3D0DCCFCCDBCCC9DACAC8D8CAC7C1B6B3A69A97BD
        B8B70000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFF1F1F1E4E2E1DDDA
        D9DEDAD9DED8D8DAD3D3DCD2D2DED4D4E0D8D8E3DCDBE5DFDFE8E4E3EBE8E7F2
        F2F10000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF}
      Transparent = True
      Visible = False
    end
    object imNotV: TImage
      Left = 465
      Top = 10
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D6170360C0000424D360C00000000000036000000280000002000
        0000200000000100180000000000000C00000000000000000000000000000000
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CACDCCB3B4B6828F99495C
        6A949CA0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0D3D6D5C7C9C7A6A8AD718491547A8B5A83963D63
        775C7C8F95A0A7C8C9CAC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0D3D2D2C1C4C598A1A569808C577E91577F97496F875C849D5A84
        A04E7B935D7F939FA6AECACBCCC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        CFCFD0BCBEC28D989D617B8A58809559849B416580426376557C976FA6C36396
        B55E8FAA3B61795D7D92A9ADB1CECFCBC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CECCCEB4B8BC
        8190955A79895B8598597D9A3D627A4C6D818A9DAEB0C1C77299B26FA9C66AA0
        C070A5C34E77933E617B5B7E90B0B2B7D0D1D1C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CBCACBA8ADB274858F57778A
        5D89A04F76923F627B46738B98ACBAAFB9BFA5AAADC5D0D3769FBB78B2D075AC
        CC7BB5D55386A649728E42677F64808FB6B7B9D1D2D1C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C6C7C79BA4AA6B7F8B5577895D879F496F88
        3D64794C7A956592B46E9DBDA5AFB9909A9A9FA1A4A6ACB284AECA7CB6D579AF
        CF82BDDD6EA4C55386A8456986406B81698290B7B9BBD2D2D2C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C3C4C3959CA2647A88577D92598299436B833B637D5683A0
        6191B35C93B65B90B66C9EBCADB8C280878C808B909AB2C27AABCC74AECE70A9
        C97FB8D8679DC1699EC1588AAD3C6581476D84728692BBBCBBDAD9DAC0C0C0C0
        C0C0C0C0C094A6AB5E7889588196507D943D647C426B865D8CAB568AAB578BB0
        5587AF639EBD74AFD47EB1D0A7BEC79BB7CA8CB8D978B0D76EA8CE75AFCF76B2
        D37CB5D56FA8CD679DC2679BBF5584A438617C4D74897F8A98CACDCBC0C0C0C0
        C0C0C0C0C06986964D758C3C5D764B718E6190B26397BB568CB05E92B8629CC1
        70AFD575AED873ABD26FAACD76AAD66AA2D0628FD74B7BBC5485BF75AFD07FBC
        DD80BBDB6BA6CB659EC56198BF6598BC5C8BAC385B76507990A3ADB1C0C0C0C0
        C0C0C0C0C058778B4A728F5283A04D7FA14C80A25487AB598CB267A2C670ACD0
        6DA9CB71A7D16FAEDB6096CE5281C24474AD4D79C45D8FCD76A9D974AECE81BC
        DD72ADCD7CB8DC609BC368A2C95F95BB679DC36293B041698494A6B2C0C0C0C0
        C0C0C0C0C0789FB44D7C974A78985586B04C81A9568BB4538BB2689CC96191D1
        6FA3E04C78C54472BB5687BD5F94C677B0E080BAE57EB8DF72ACD071ABCC78B6
        D771ACCC78B1DE7BB7DF67A3CA70AAD373ACD1689CC15A8BA79EB2C0C0C0C0C0
        C0C0C0C0C07CA7C15786A35A8EB15084AC5A8FBC6296C55683CB4972C7537ECE
        4D7CC0598DC477B0DE7CB9E37FBDE478B6DB71ACD1619BBF6FA6C86AA0C076B0
        D171A7C368A0CE6DA6D879B7DE79B7DC70AAD376AFD36194B0B2C7D5C0C0C0C0
        C0C0C0C0C086B5D25484A35584B84F79BF5987CF5885CD4370C25285C369A3CE
        7AB6E17CBBE17EBCE178B4D975AFD5679DC25F93B86095BA69A0C573AED16FA5
        C56192AC7AB7DA5C93C671AAD978B6DB7BB8DF71ABD06698B7A9C7D8C0C0C0C0
        C0C0DDE6E989BEDE598BAC517DC66797D65C91D0659EC974B0DE7BB8E07AB6E3
        75B2DB70ACD469A2CB6196BD6AA2C66CA9CC69A3C46EA8C973AFD282BFDF77AD
        CB6695B188C7E770ADD35387C271ABDA79B7DD7AB7DB6395B7A0C8DBC0C0C0C0
        C0C0D9E4E987C0E1568AA96BA3D16EAAD378B7DF7DBAE273B0DA68A6C96CAAD2
        68A1C8598DAE669CC174ADD06AA0C16698B64A7A966598B46190AE567E954D75
        8C547D9782BDDC83C3E770ABD5568BC575B0DA7CB9DF6598B992BED6C0C0C0C0
        C0C0CEDCE383C0E1558AAD70AAD379B7E077B3DA72ACD3609ABF5F99BE75B0D6
        71ADD26FABCF6DA7CB5889A95B88A5608FAC76ABCA91CBEB79B4D54A77921934
        452946584A738D80B8D97DBFE273ADD85C91C876B0DE679DBC8FBCD8C0C0C0C0
        C0C0C2D3DD7CB8DA558BAD6AA6CD67A2C9659BC06097BC619ABF74AED274AFD2
        64A0C370A8CA7BAECC689DB973AECB82BFE074ADCF6194B86FA9CC84C2E57CB4
        D342657F26495A41687E79ABCA77B4D871AAD95990C56095BA95C5DFC0C0C0C0
        C0C0BDD2DE75B0D35385A75A93BA5893B86FA8CA69A5CA6EAAD1558EB373A9CB
        79ADCA5B8CA86094B27FBBDC7FBFE167A1C1679CBE6FA9CB6CA3C66097BC72AD
        D182C2E679ACD146718B35566C6D9FBC75AFD271A8D45D91B78BBED8C0C0C0C0
        C0C0B1CBD973ADD15387AA6BA6CC6AA2C56298B969A2C57BB5D76A9FBF527F99
        44708977ADCB80BEE06FA9CC5E93B66FA7CD77B4DA6DA9D06EABD36FABD46299
        BF588EB36DAACD85C3E672AACA466F8B6293AF77AFCE5D93B586BBD7C0C0C0C0
        C0C0A0C2D375B0D56EADCF6097B971A9C878B0CE6BA1BE53829A41657D5585A1
        80BCDD77B5D8619BBD619ABF75AFD56FACD269A6CD6EABD66FACD8609DC668A4
        CD72ACD3639CC15D95B776B3D686C3E56A9EC06294B36CA0BE84BBDCC0C0C0C0
        C0C08BBAD685C5E47DBEE071A9CA6A9DBA5682983A6075395D7773A8C779B9DD
        64A0C55992B56DA6CB73AFD664A1CA69A6CF6EA9D6629DC965A1CB74ACDF6BA6
        D56BA8D26FACD379B8DA669FC36397BC77B3D687C6EA76B0D074ADCDC4D8E1C0
        C0C07AABC46CA0BB618DAB5374893552602C4E625683A07AB9D974B6DA5E96BC
        649BC075AED470ABD46BA8D36DAAD5639ECB5C97C471ACDA689ED94E83C15D97
        CC7CB9E479B7DD68A0CA6EA8CE75AFD05787A76B9EC08AC7E690CDEF85A9BCC0
        C0C0A7B9C6527890223D4C243C4A3A607371A9C77DBCE16DAACF6096BB6CA7CD
        72AED668A4CE6DA9D667A4D05793BE66A2D0689FD9578CCB609ACC73AFDC76B5
        DC6AA8CE6BA6CE7AB3D8639ABD6295B786C2E385C2E05D8FAB547C9798B3C0C0
        C0C0C0C0C0C9D3DC4661705280987CB9D97AB6D96199BC629ABF6FACD36BA7CF
        6DACD56BA9D55C98C3609ACA5E95CF598BCE5F95CA76B2DB7BBBE470AED76EA8
        D274B0D7649DC15485A578B0D48BCAEE73A9CA517A94648093AABBC3C0C0C0C0
        C0C0C0C0C0B6C4CB6D9CB56091B25283A24E809E6599BE6AA3CA68A3CA70ABD7
        66A4D05892C15D91CC6195D36097CD70A9D781C0E976B6DD6EAAD37AB8DD6FAE
        CF568BAC74ACCD87C8E984BAD881A8BBACC3CBC0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0B9D3DF8DC0D977B1D25483A13C68824D7F9E649AC3568EB9
        5D98C16DA8D5609BCB619ECA76B4DC7CBAE16DA9D275B1D87DB8DC5E93B65F94
        B98BC6E785BDDAA2BFD0DBE4E9C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C8DAE497C0D485BBDA588EAE3863814A7798
        5D93B75690B66AA6CD78B7DC6AA8D06FAAD37EB7DD649ABC6097B781BBDB8BC1
        E095B7CCDAE2E8C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0DBE7EDAAC9DB83B8D9689EC1
        4573904B79965E8EB5629AC278B4D969A0C25A8FB07AB7D789C4E48FB9CFCCDA
        E1C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0D4DEE581ACC2
        7CB6D778B2D45086A046748D4C7B996CA4C583BFE48BB5CDC0D1DAC0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        A8BFC9B2CBD9A5C8E08BBFDE70A4C46C95ADB4C7D3C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0E1ECF0B6D1D8E5EEF1C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0}
      Transparent = True
      Visible = False
    end
  end
  object pnFlash: TPanel
    Left = -610
    Top = 170
    Width = 631
    Height = 106
    TabOrder = 0
    Visible = False
    DesignSize = (
      631
      106)
    object lbAlertUnloadFlash: TLabel
      Left = 40
      Top = 5
      Width = 586
      Height = 96
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Caption = 
        #1060#1051#1045#1064#1050#1059' '#1074#1099#1075#1088#1091#1078#1072#1090#1100' '#1088#1072#1085#1086'! '#1060#1083#1077#1096#1082#1080' '#1074#1099#1075#1088#1091#1078#1072#1077#1090#1089#1103' '#1089#1090#1088#1086#1075#1086' '#1087#1086#1089#1083#1077' 24 '#1095#1072#1089#1086#1074' ' +
        #1087#1086' '#1074#1088#1077#1084#1077#1085#1080', '#1082#1086#1090#1086#1088#1086#1077' '#1085#1072' '#1050#1054#1052#1055#1068#1070#1058#1045#1056#1045'.'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
  end
  object pnUnBase: TPanel
    Left = -495
    Top = 485
    Width = 516
    Height = 111
    TabOrder = 1
    Visible = False
    DesignSize = (
      516
      111)
    object lbAlertUnLoadBase: TLabel
      Left = 20
      Top = 5
      Width = 471
      Height = 101
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Caption = 
        #1055#1086#1076#1086#1078#1076#1080#1090#1077', '#1080#1076#1077#1090' '#1074#1099#1075#1088#1091#1079#1082#1072' '#1073#1072#1079#1099'. '#1069#1090#1086' '#1084#1086#1078#1077#1090' '#1079#1072#1085#1103#1090#1100' '#1085#1077#1082#1086#1090#1086#1088#1086#1077' '#1074#1088#1077#1084#1103'.' +
        ' '#1053#1077' '#1087#1077#1088#1077#1075#1088#1091#1078#1072#1081#1090#1077' '#1082#1086#1084#1087#1100#1102#1090#1077#1088' '#1080' '#1085#1077' '#1080#1079#1074#1083#1077#1082#1072#1081#1090#1077' '#1092#1083#1077#1096#1082#1091', '#1087#1086#1082#1072' '#1085#1077' '#1080#1089#1095#1077#1079 +
        #1085#1077#1090' '#1101#1090#1086' '#1089#1086#1086#1073#1097#1077#1085#1080#1077'.'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
  end
  object pnExt: TPanel
    Left = 635
    Top = 190
    Width = 41
    Height = 36
    Caption = 'pnExt'
    TabOrder = 6
    Visible = False
  end
  object mmMain: TMainMenu
    Left = 49
    Top = 175
    object miFile: TMenuItem
      Caption = '&'#1060#1072#1081#1083
      object miZakaz: TMenuItem
        Bitmap.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000D30E0000D30E00000001000000010000944242008C4A
          4A00944A4A007B525A008C5A5A005A636B0063636B006B6B6B005A6373005A6B
          7300636B73007B6B7300CE7B73004A637B00636B7B006B737B0073737B007B73
          7B00737B7B007B7B7B00B57B7B00C67B7B0052738400737B8400847B84008C7B
          8400AD7B84007B848400848484009C848400A5848400316B8C0039738C005273
          8C00527B8C00637B8C0063848C006B848C008C848C0094848C00A5848C00AD84
          8C00948C8C00AD8C8C0031739400527B940084849400638C94008C8C94008C94
          9400949494004A849C005A849C004A8C9C00638C9C007B949C009C949C00A594
          9C00428CA500528CA5005A8CA5005A94A500949CA500A5A5A500CEA5A5002984
          AD004A94AD005294AD005A94AD006B9CAD0073A5AD0084A5AD00A5A5AD00ADA5
          AD00ADADAD00BDADAD00CEADAD00E7B5AD003194B5003994B5004294B5004A9C
          B5005A9CB500639CB5005AA5B50063A5B5006BA5B5007BA5B50073ADB5007BAD
          B50084ADB5008CADB5008CB5B500B5B5B500DEB5B5002994BD003194BD00319C
          BD00399CBD00429CBD004A9CBD004AA5BD005AA5BD005AADBD0073ADBD007BAD
          BD0073B5BD007BB5BD0084B5BD00299CC60039A5C60042A5C6006BB5C60073B5
          C6007BB5C6007BBDC60084BDC600BDC6C60031A5CE004AADCE0052ADCE006BB5
          CE007BBDCE0084C6CE0042B5D6004ABDD6006BBDD6006BC6D60084C6D60031AD
          DE0031B5DE0042B5DE0073CEDE0084CEDE007BD6DE0084D6DE008CD6DE004AC6
          E70052C6E70063CEE7006BCEE70073CEE70084D6E70084DEE7008CDEE7009CE7
          E7004AC6EF004ACEEF0052CEEF005ACEEF005AD6EF006BD6EF0073DEEF007BDE
          EF007BE7EF008CE7EF009CE7EF0094EFEF00A5EFEF004ACEF7004AD6F70052D6
          F70063DEF7006BDEF70073DEF70073E7F7007BE7F70084E7F70084EFF7008CEF
          F7009CEFF70094F7F700A5F7F700ADF7F700ADFFF700B5FFF700FF00FF007BEF
          FF0084EFFF0094EFFF008CF7FF0094F7FF009CFFFF00ADFFFF00B5FFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00757575757575
          7575757575757575757575750D6F51433D362525171013327575751939237C93
          A2A3A6A79B912405757575101F4F77898B8C99A7A9AD458105755D28400B6F89
          8B8C99A7A99E59950975751D3E0333928B8C99A7A9AA5A870875482B4D045089
          8B8C99A7A9AD54412A757519360E42898B8C99A7A9AD568106753F2B5E023A93
          8B8C99A7A9AC6B980A757511203364898B8C99A7A9AC5A870A75752738347C89
          8B8C99A7A9AC58221B7575322C5077929597A6B2B3B759960775757521635152
          707E84878E9E578C0A7575757531223C68696C747B7B72980E75757575757575
          75316885A9915A371775757575757575757575315BAA5C4A7575}
        Caption = #1047#1072#1103#1074#1082#1072'...'
        ShortCut = 114
        OnClick = miZakazClick
      end
      object miOtkaz: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E000000000000000000006398463A5929
          3D5D2B3A592926391B111A0C000000131C0E58883E6398466398466398466398
          46639846639846639846669C48D8EACEE1EFD9D7E9CDCEE4C2BCDAACB7D7A580
          B86244683053803A639846639846639846639846639846639846669C48E5F1DF
          EBF4E6E6F2E0DAEBD1CFE5C3BBD9ABAAD09655843C6DA94D5F93436398466398
          4663984663984663984668A149ECF5E7F2F8EEEAF4E4E6F2E0D4E7C9C5DFB7AB
          D197669E48A2CB8B77B35769A24A6398466398466398466398466BA54BF4F9F1
          F4F9F1EFF7EBEBF4E6DBECD2CCE3BFB1D49E75B254BCDAACC2DDB382BA646FAC
          4E6398466398466398466DA94DF7FBF5F3F9EFEDF6E8E8F2E2E0EED8D1E6C6BD
          DBAD7FB86073B151659B4754813B41642E6CA64C63984663984671AE50FAFDF9
          F6FBF3EFF7EBE9F3E3F1F7EDE5F1DFD7E9CDC5DFB7C4DEB6BAD9A9BAD9A978B4
          5843672F63984663984675B254FDFEFCF9FCF8669E48669E48669E48669E4866
          9E48669E48669E48669E48C5DFB7BDDBAD37532763984663984679B559FFFFFF
          F8FCF6F7FBF5F2F8EEF1F7EDEBF4E6E8F2E2E8F2E2DBECD2DBECD2D1E6C6C3DE
          B4324D236398466398467EB75FFFFFFFFFFFFF669E48669E48669E48669E4866
          9E48669E48669E48669E48D5E8CACFE5C32A401E63984663984680B862FFFFFF
          FFFFFFFFFFFFF5FAF2F3F9EFF2F8EEF1F7EDE8F2E2E4F1DDDBECD2D4E7C9D4E7
          C92B421E63984663984685BB67FFFFFFFFFFFF669E48669E48669E48669E4866
          9E48669E48669E48669E48DBECD2D5E8CA334E2463984663984688BD6BFFFFFF
          FDFEFCFEFFFDFDFEFCF8FCF6F3F9EFEFF7EBE5F1DFE4F1DDDDEDD5DAEBD1D0E5
          C53753276398466398468BBF6FFFFFFFFDFEFCF7FBF5FAFDF9F7FBF5EFF7EBEE
          F6EAE3F0DCE2EFDBE1EFD9DDEDD5D5E8CA3E602C6398466398468DBF71FFFFFF
          F7FBF5F6FBF3F3F9EFF1F7EDEFF7EBEBF4E6E6F2E0E3F0DCDCECD4DBECD2DBEC
          D241642E6398466398468FC1738DBF718ABE6E87BC6A82BA647EB75F79B55975
          B25471AE506DA74D6AA34B669E48649A46619644639846639846}
        Caption = #1054#1090#1082#1072#1079#1099'...'
        OnClick = miOtkazClick
      end
      object miF1: TMenuItem
        Caption = '-'
      end
      object miUnloadFlash: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000B0C6B1B0C6B1
          B0C6B1B0C6B197AA988A9B8B8B9C8C8B9C8C8B9C8C8B9C8C8A9B8B93A594B0C6
          B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B16466623A36354341404A
          46454B48474543423C3837626260B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1
          B0C6B1B0C6B186857F96B3CD89888A92ABC08FA1B08B929994B1CB9A9693B1C6
          B2B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B6B2ADFFFCFAFFFEFEFF
          FCFBFFFCFBFFFFFEFFFBFAD9D0CDB0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1
          B0C6B1B0C6B1A1A19AF7E9E9BDB4B4F0E5E5FBF0F0BDB4B4ECDFDFBCB6B3B0C6
          B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1707E71B1A8A6E8D6D6716464DD
          CFCFF6E7E7716464D3C3C3CBC0BE6F7D70B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1
          B0C6B1777C77C2BCBCF5E3E3FFF5F5FFEFF0FFEEEEFFF5F5FFEFEFC3BBBB777B
          77B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B17C807CB0ADACD1C9C5D3CBC8D7
          CDC9D7CECBD4CBC7D0C9C5B7B3B27B807CB0C6B1B0C6B1B0C6B1B0C6B1B0C6B1
          B0C6B19EA39EEDEEEFEAEBECEDEEEFF0F1F2F0F1F2ECEDEEE9EBECEDEEEF9EA3
          9EB0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B16F6650D6C6B9D6CABDDDD2C8E3
          D8D0E5DBD2E2D6CCDED1C7E1D3C76D654EB0C6B1B0C6B1B0C6B1B0C6B1B0C6B1
          B0C6B16C6852D9C9BAD8CCBFDDD2C7E1D7CDE4D9D0E7DAD2EADDD5EEDFD86A65
          4FB0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B171725ED3C2B0D5C7BAD9CDC1DD
          D2C7E0D6CCE3D8CFE5D9D0E4D5C970705CB0C6B1B0C6B1B0C6B1B0C6B1B0C6B1
          B0C6B1838A77CBB8A4D2C3B4D4C8BAD9CDC0DCD1C5DFD4CAE0D7CDDACABB8388
          76B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B198A593C8B19BCEBDADD0C2B3D5
          C7B9D6C9BDDACEC1DCD1C6D3C1AD97A693B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1
          B0C6B1B0C6B18F8F7ECDBBA8CDBBABD0C1B0D2C4B4D6C6B9DBCCBD909585B0C6
          B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B1C4B1B5C1B1BA
          C2B3BBC3B4B6C2B2B2C4B2B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1}
        Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074#1089#1077' '#1085#1072' &'#1060#1051#1069#1064#1050#1059
        OnClick = miUnloadFlashClick
      end
      object AVA1: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000B9CFB4B9CFB4
          B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CF
          B4B9CFB4B9CFB4B9CFB480808080808080808080808080808080808080808080
          8080808080808080808080B9CFB4B9CFB4B9CFB4B9CFB4B9CFB480808000FFFF
          00FFFF00FFFF00FFFF80808000FFFF00FFFF00FFFF00FFFF808080808080B9CF
          B4B9CFB4B9CFB4B9CFB480808000FFFF00FFFF00FFFF00FFFF80808000FFFF00
          FFFF00FFFF00FFFF80808000FFFF808080B9CFB4B9CFB4B9CFB480808000FFFF
          00FFFF00FFFF00FFFF80808000FFFF00FFFF00FFFF00FFFF80808000FFFF00FF
          FF808080B9CFB4B9CFB480808080808080808080808080808080808080808080
          808080808080808080808000FFFF00FFFF808080808080B9CFB480808000FFFF
          00FFFF00FFFF00FFFF80808000FFFF00FFFF00FFFF00FFFF80808080808000FF
          FF80808000FFFF80808080808000FFFF00FFFF00FFFF00FFFF80808000FFFF00
          FFFF00FFFF00FFFF80808000FFFF80808080808000FFFF80808080808000FFFF
          00FFFF00FFFF00FFFF80808000FFFF00FFFF00FFFF00FFFF80808000FFFF00FF
          FF80808000FFFF80808080808080808080808080808080808080808080808080
          808080808080808080808000FFFF00FFFF80808080808080808080808000FFFF
          00FFFF00FFFF00FFFF00FFFF80808000FFFF00FFFF00FFFF00FFFF80808000FF
          FF80808000FFFF808080B9CFB480808000FFFF00FFFF00FFFF00FFFF00FFFF80
          808000FFFF00FFFF00FFFF00FFFF80808080808000FFFF808080B9CFB4B9CFB4
          8080808080808080808080808080808080808080808080808080808080808080
          8080808000FFFF808080B9CFB4B9CFB4B9CFB480808000FFFF00FFFF00FFFF00
          FFFF00FFFF80808000FFFF00FFFF00FFFF00FFFF808080808080B9CFB4B9CFB4
          B9CFB4B9CFB48080808080808080808080808080808080808080808080808080
          80808080808080808080B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9
          CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4}
        Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' '#1087#1072#1087#1082#1091' AVA'
        OnClick = AVA1Click
      end
      object miSendMail: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000000000000000000000000000000000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF00000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000FF0000FF848484
          8484848484848484848484848484848484848484848484848484848484848484
          848484840000000000FF0000FF848484C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C68484840000000000FF0000FF848484
          008484C6C6C6C6C6C6C6C6C6008484008484008484C6C6C6C6C6C6C6C6C60084
          848484840000000000FF0000FF84848400FFFF008484C6C6C600848400000000
          0000000000008484C6C6C6008484C6C6C68484840000000000FF0000FF848484
          FFFFFFFFFFFF008484000000FFFFFFFFFFFF00FFFF000000008484C6C6C6C6C6
          C68484840000000000FF0000FF84848400FFFFC6C6C6000000FFFFFF00FFFFFF
          FFFFFFFFFFFFFFFF000000008484C6C6C68484840000000000FF0000FF848484
          C6C6C600000000FFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFF0000000084
          848484840000000000FF0000FF848484000000FFFFFFFFFFFFFFFFFF00FFFFFF
          FFFFFFFFFFFFFFFF00FFFFFFFFFF0000008484840000000000FF0000FF848484
          FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF00FF
          FF0000000000000000FF0000FF84848484848484848484848484848484848484
          84848484848484848484848484848484848484840000000000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' &'#1087#1086#1095#1090#1091
        Visible = False
        OnClick = miSendMailClick
      end
      object miUnloadRealiz: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F40404040
          4040000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF707070A0A0A0A0A0A0202020000000000000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20202000000000000040
          4040BFBFBFA0A0A0505050FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF404040BFBFBFA0A0A0505050FFFFFF4040404040404040400000000000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040404040202020FF
          FFFFFFFFFF505050808080404040404040202020FFFFFFFFFFFFFFFFFFFFFFFF
          0040000040000040000040000040000040000040005070508080804040404040
          40202020004000002000FFFFFFFFFFFF009F003F5F3F009F00004000007F0030
          CF300040005070508080804040404040402020203F5F3F005F00004000204020
          009F003F5F3F00BF0000FF0000FF00007F008F8F8F808080DFDFDFA0A0A0A0A0
          A02020203F5F3F005F00009F00204020009F00009F0000BF0000BF003F7F3F00
          7F007F7F7F606060AFAFAFA0A0A0A0A0A0205F20009F00005F00009F00204020
          009F003F5F3F007F0000FF0000BF00007F008F8F8F30303000FF0000BF00009F
          00007F003F5F3F004000009F0000DF00009F003F5F3F007F0000BF00005F0000
          7F00003F00007F00007F0000BF0000BF00007F003F5F3F005F00009F00204020
          008000009F00009F000080000080000080000080000080000080000080000080
          00009F00009F00006000009F00204020009F0000BF00009F0000BF00003F0000
          7F0000BF0000BF0000BF0000DF00009F00007F00FFFFFFFFFFFF008000009F00
          009F00008000008000008000008000008000008000008000008000009F00009F
          00006000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1102'...'
        OnClick = miUnloadRealizClick
      end
      object N57: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000D40E0000D40E0000000000000000000000FF0000FF00
          00FF0000FF0000FF0000FF00DBE2EBB2BBCD8795B066799B6984AACEDBED00FF
          0000FF0000FF0000FF0000FF00DDDDDED5DBE3A9B6CB6882AC384E8E15418F11
          4F9E1564B41777C81477CD74A7DAC8C7C600FF0000FF0000FF00C0C0C07EA0C7
          2F5BA01451AD1B5FB2195EA21B83DB1287E71087E40D83DE0A7BD95997CFC8C9
          C900FF0000FF0000FF0081A1CF075CC50766CB0A6DD4187AD81F5EA11C609F18
          90E9168AE81182E20D76DD548FCCC4C5C800FF0000FF0000FF00C0C0C0669DD6
          0E6FCF0C79DD0E84E11D8BDD2278B52487D01192E71183E50E77DB6097CFCAC9
          CA00FF0000FF0000FF0000FF00E4EBED76B0DF1483D7168DE6199BEE1D548110
          171D153D66168CE31781DC7FAFDC00FF0000FF0000FF0000FF0000FF0000FF00
          00FF00A2CFEE2897E11E90DE1F436D16131B131520247CBB1B5F94ADB9CA00FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF00D9EEF35C6675171E2413
          1D22211F27171E2625252800FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF00D9D4D78C8A87545255363830504F5100FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF00D6D5D74646462625269A9A9A00FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF00C5C5C51E1E1E363636C3C3
          C300FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF008787871F1F1F737373C3C3C300FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF005757572E2E
          2EABABAB00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF00D3D3D339393941414100FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF005757
          5728282853535300FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF003A3A3A28282800FF00}
        Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074#1086#1079#1074#1088#1072#1090' '#1073#1072#1083'...'
        OnClick = N57Click
      end
      object miF2: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Bitmap.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000D40E0000D40E00001000000010000000FF0000000909
          FF001A1AFF002A2AFF003939FF004848FF005A5AFF006A6AFF007979FF008989
          FF009898FF00A8A8FF00BABAFF00C6C6FF00D7D7FF00FBFBFF00000000999D00
          0000000C53233339000000C23455655360000D23567777664600013568899987
          54A0824679BBBBA8753053579ACDDDBA864D13FFFFFFFFFFFB4913FFFFFFFFFF
          FB5A13ACCEEEFEEDC84993568ABCCBB97640C23678AAAA977460052457889877
          43D00053455666544D00000524444443D0000000C92226900000}
        Caption = #1042'&'#1099#1093#1086#1076
        ShortCut = 32883
        OnClick = miExitClick
      end
    end
    object miNakl: TMenuItem
      Caption = '&'#1053#1072#1082#1083#1072#1076#1085#1099#1077
      OnClick = miNaklClick
      object miHistory: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000000000000000000000000000000000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF717171696A6A6B6B6B6868686F70
          700000FF0000FF0000FF0000FF806B6773645C6D665970665B7B666282676265
          5D5B59595A7B706F927C766767676158575959580000FF0000FF0000FFA58876
          AFD69B8CE08790DC87A6CB84A893807272729A917FB7AA9E7E83AABAB3A6AA93
          83886F6F4C4C4C0000FF0000FF9EA884B4FFBEA0FFAE94FFA472CE6D768173BE
          AD8FFFE9B1F9E0B9CABBB5FFF3D6E9E9D7AC9A886868686363630000FFAEA98E
          B2FFBB9DFCA978F88651AC5EA5A085FFEEAFFAE8AAFDE6A7FFE8A3FDD192FFEC
          CEE0E0CA9D827B5454540000FFC3B49DACFCB68AF4976CE77879AD7ACDBEA5F7
          FBCCFBFCC6E6E2AEAD9A76DDB885EAC38DE9E4D7998B8B5F5F5F0000FFCABEA4
          B1FCBE95F7A059D36792B588A9AEC0D6E9FEFFFFE3CCCAA6434242443D36BB9F
          79C1BDCA7573896161610000FFD2C1A8C3FFCE8AF99635964081BD87E1C8BFFF
          FFFFFCFCF1FAFBD8CECDA7595248C0A27BFCE8B68B81735858580000FFDDC4B2
          D3FFDC44CC541F802B6BCA79D4C7C5E9DBD5FFFFFFFEFFFBFFFFEFD4D4A7766F
          5BB9A6856A6A6A6868680000FFEDD0C09BE9A8177C234AD25B76F18484DF94C3
          C1B3E9D7C7E6E6E6A3C5EDF6EDC0C2B4918785857172727D7D7D0000FFEED6C2
          B2E8BD67CC748BE6958FEA9982E88D7EE68BB9CAB0C0B4ABACA6A1A9A39C8E8E
          8E7878797F7F7F0000FF0000FFEDD6C0DDFEE5BCFCC4B9F9BFB5F7BBABF9B591
          F49AA8DDA0C5D9C1C4DEBEACA6936E6E6E0000FF0000FF0000FF0000FFEED9BD
          FEFFFFFFFFFFFFFFFFF6FFF6EAFFEDDFFFE3D7FFDCC8DFAFC5BE86B3926C716E
          6E0000FF0000FF0000FF0000FFF0E0C5FAFFFFF8FFFAFAFFFBF8FFF8F1FFF1E6
          FFE9E6FAE6E3BF89D887239571527E7D7D0000FF0000FF0000FF0000FFF3E5CB
          FCFFFFF8FFFFF8FFFEF8FFFEF6FFFBF6FFF7F9F6F2ECD6B5BB936783807D0000
          FF0000FF0000FF0000FF0000FFE5CFAEE7D8C7DBCFBBC8CBB1BAC9A5B8BEA5C2
          B3ABC2B0ABAB9C8F84817F0000FF0000FF0000FF0000FF0000FF}
        Caption = '&'#1048#1089#1090#1086#1088#1080#1103' '#1085#1072#1082#1083#1072#1076#1085#1099#1093'...'
        ShortCut = 16458
        OnClick = miHistoryClick
      end
      object miLTJ: TMenuItem
        Bitmap.Data = {
          36030000424D360300000000000036000000280000000F000000100000000100
          1800000000000003000000000000000000000000000000000000B9CFB4AAAAAA
          000000000000000000B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CF
          B4B9CFB4B9CFB4000000C0C0C0000000AAAAAAAAAAAAAAAAAA000000B9CFB4B9
          CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4000000323232AAAAAA
          FFFFFFAAAAAAAAAAAAAAAAAA000000B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CF
          B4B9CFB4B9CFB4000000323232AAAAAAFFFFFFFFFFFFAAAAAAAAAAAAAAAAAA00
          0000B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4000000323232AAAAAA
          FFFFFFFFFFFFFFFFFFAAAAAAAAAAAAC0C0C01A1A1AB9CFB4B90000B90000B9CF
          B4B9CFB4B9CFB4000000B9CFB4000000AAAAAAFFFFFFFFFFFFFFFFFFC0C0C01A
          1A1AB9CFB4B9CFB4FFAA00B90000B9CFB4B9CFB4B9CFB4000000B9CFB4B9CFB4
          000000AAAAAAFFFFFFC0C0C01A1A1AB9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CF
          B4B9CFB4B9CFB4000000B9CFB4B9CFB4B9CFB4000000AAAAAA1A1A1AB9CFB448
          FFB88EFFD448FFB8B9CFB40000B90000B90000B9B9CFB4000000B9CFB4B9CFB4
          B9CFB40000001A1A1A1A1A1AB9CFB48EFFD4FFFFFF8EFFD42525FF4848FF2525
          FF0000B90000B9000000B9CFB4B9CFB4323232B93D00B93D00FF48481A1A1A48
          FFB88EFFD448FFB88E8EFFDADADA8E8EFF2525FF0000B9000000B9CFB4000000
          B93D00B93D00FF4848FF4848FFC66B262626B9CFB4B9CFB4DADADAFFFFFFDADA
          DA4848FF0000B9000000000000B93D00B93D00FF4848FF4848FFC66BFF5500B9
          0000323232B9CFB4B9CFB4DADADA8E8EFF2525FFB9CFB4000000000000B93D00
          FF4848FF4848FFC66BFF5500B90000000000B9CFB4B9CFB4B9CFB4B9CFB4B9CF
          B4B9CFB4B9CFB4000000000000B93D00FF4848FF5500FF5500B90000000000B9
          CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4000000AAAAAA000000
          FF4848FF5500B90000000000B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CF
          B4B9CFB4B9CFB4000000B9CFB4AAAAAA000000000000000000B9CFB4B9CFB4B9
          CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4000000}
        Caption = #1048#1089#1090#1086#1088#1080#1103' '#1083#1080#1096#1085#1077#1075#1086' '#1090#1086#1074#1072#1088#1072'...'
        OnClick = miLTJClick
      end
      object miJReoc: TMenuItem
        Bitmap.Data = {
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
        Caption = #1048#1089#1090#1086#1088#1080#1103' '#1087#1077#1088#1077#1086#1094#1077#1085#1086#1082'...'
        OnClick = miJReocClick
      end
      object miLoad: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000E30E0000E30E00000000000000000000FFFF00FFFF00
          FFFF008D848D7C7C7C6464646161616868687373737E7E7E8F8F8F9C9C9C8D84
          8DFFFF00FFFF00FFFF00FFFF00FFFF00676767ABABAB6E6E6E61616178787899
          9999B2B2B2C3C3C3C2C2C2AAAAAA999999929292FFFF00FFFF00FFFF00FFFF00
          616161C8C8C87979796363637777779A9A9AB0B0B0CBCBCBD0D0D0BDBDBDAEAE
          AEA3A3A3FFFF00FFFF00FFFF00FFFF005F5F5FC2C2C276767663636376767696
          9696AEAEAEC6C6C6D0D0D0BCBCBCACACACA2A2A2FFFF00FFFF00FFFF00FFFF00
          616161BEBEBE7070705C5C5C6D6D6D7E7E7E8C8C8CA2A2A2AEAEAEA9A9A9A1A1
          A19F9F9FFFFF00FFFF00FFFF00FFFF00595959A0A0A06868685858586B6B6B81
          8181949494A1A1A1A3A3A39494948C8C8C969696FFFF00FFFF00FFFF00FFFF00
          5E5E5DBFBEBD757474626161767575959695AEAEAEC9C9C9CECECEB8B8B8A9A9
          A9A1A1A1FFFF00FFFF00FFFF00FFFF0060615FCAC5C2787576615F627F757995
          9895AEAEAECBCBCBD0D0D0BCBCBCADADADA3A3A3FFFF00FFFF00FFFF00FFFF00
          5B6165C6C5C67675786063637B7879959595AEAEAECBCBCBD0D0D0BCBCBCADAD
          ADA3A3A3FFFF00FFFF00FFFF00FFFF00625A5DB9B6B76F676D595A5D5C5C5C68
          68686E6E6E8181819797979898989B9B9B9C9C9CFFFF00FFFF00FFFF00FFFF00
          63595BABA7A66E6F6A62635E757575959595ADADADC3C3C3C7C7C7ADADAD9696
          968F8F8FFFFF00FFFF00FFFF00FFFF0063595BCFC7C278757663635C74757490
          9393AAAAAAC3C3C3C9C9C9B7B7B7A6A6A69B9B9BFFFF00FFFF00FFFF00FFFF00
          63595BCDC4C076727860605C6E756F8C9191A7A7A7C3C3C3C8C8C8B3B3B3A5A5
          A59A9A9AFFFF00FFFF00FFFF00FFFF0060595C9898986D6B696059616A6E6B7E
          8082919191A5A5A5B2B2B2A1A1A19A9A9A939393FFFF00FFFF00FFFF00FFFF00
          5D61609E9FA17C7D7E787A778484848885888585858D8D8D9393939090908989
          89898989FFFF00FFFF00FFFF00FFFF00FFFF0093848A7D797D7C797A7E7E827C
          807C7E7E7E808080828282838383898089FFFF00FFFF00FFFF00}
        Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1085#1072#1082#1083#1072#1076#1085#1099#1093'...'
        OnClick = miLoadClick
      end
      object miPrihTov: TMenuItem
        Bitmap.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000E30E0000E30E00000001000000010000180808002108
          0800290808001010100018101000391010000810180010181800181818002918
          1800391818004A18180052181800002918000010210021212100392121005221
          2100081829002121290029292900312929007329290021293100313131004231
          310000183900393139003939390010394200424242004A4242007B4242008442
          42008C42420000214A0039394A0031424A0039424A0042424A004A4A4A005A4A
          4A00424A52004A4A52004A525200525252005A52520063525200A55252000029
          5A0008315A0010425A00394A5A005A5A5A00635A5A006B5A5A00003163000831
          63000839630010396300525A6300636363006B63630073636300B56363004252
          6B004A5A6B00525A6B005A636B00736B6B007B6B6B008C6B6B0010427300184A
          73007373730010217B00395A7B007B7B7B00947B7B00A57B7B00002984001029
          8400215284004A638400BD84840008218C0000298C0008298C0008398C002142
          8C00214A8C0029528C00215A8C00295A8C00426B8C00AD8C8C00BD8C8C000021
          940029529400295A940029639400316394004A73940052739400BD9494000018
          9C0010299C0031639C00316B9C00396B9C00CE9C9C000018A5000021A500215A
          A5004273A500527BA500D6A5A5000852AD004273AD00427BAD004A7BAD00D6AD
          AD00DEADAD000031B5000052B500427BB5004A7BB5004A84B5005284B5005A8C
          B500D6B5B500E7B5B5000031BD000842BD005284BD00528CBD005A8CBD00B5BD
          BD00D6BDBD00396BC6005A8CC6005A94C6006394C600E7C6C6006394CE00639C
          CE00E7CECE00FFCECE000039D600005AD6006B9CD60073A5D60084ADD60073A5
          DE0073ADDE007BADDE007BADE70084B5E70084BDE7003984EF00A5CEEF00B5D6
          EF00FFEFEF003184F700FF00FF004294FF0073B5FF0084BDFF0094C6FF009CCE
          FF009CD6FF00A5D6FF00ADDEFF00BDE7FF00C6E7FF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00898989898989
          8989898989898989898989898989898935898989898989898989898989894A0F
          2D4A8989898989898989898914087921080389898989898989894D7493833E40
          11059B652D1E898989894A744E1F18600B049B781414273D35894A681F1C4679
          16049B7F1A325D1E354A892EA28F6E6E461A9594515A6B12083B893D3F4F2017
          39A3A87D5061515248658989890823759FA9AB810D38564B5B6589898928A9AB
          AC98868E9B886D3385848989894AADA09878806D91979A6B6B7189898989678E
          9197A99B888E919D88728989898989894A4C9180807880915E42898989898989
          894A2667877780264A898989898989898989894A4C5E42898989}
        Caption = #1055#1088#1080#1077#1084' '#1090#1086#1074#1072#1088#1072'...'
        OnClick = miPrihTovClick
      end
      object miNedSpis: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000430B0000430B00000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0808080A26F17A26F17808080C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080AC6B26FF
          F3F0FFFFFFB49B2D808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0808080B15A2AFFF6ED886E5C876B58FFF8F8B77232808080C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080AC7224F7EEEAE4914A9E
          592C9A58265E2702FFFFFFB77A32808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          808080AC7224FEE4DFE29B5EA75925C89572C48B66CB966F602A06FEF5F7B69F
          30808080C0C0C0C0C0C0C0C0C0808080B15A2AF7EEEAE29B5EA95317A75925ED
          DDD5FFFFFFE9CFC19E531D724728FEF5F7B77A32808080C0C0C0808080AD6B26
          F6F1ECE4914AA95D2AAC6231AC6230BC8159FFFFFFBA7B51AD6331A35B28622E
          0AFFFFFFB77232808080A26F17FFEFEFE4A36DA95F2FAD6330AD6331AD6331BC
          8057FFFFFFBA7B50AC6230AE6331B36A36612B06FFFFFFB7833EA26F17FFFFFF
          E3B06EA65C2FAE6430AD6331AD6331B7784FFFFFFFBA7B50AC6230AE6331AF68
          368D4615FFFFFFBC9151808080B3992DFFFAF8E68E139E5738AD6330A5541DFF
          FFFFFFFFFFBC7D54AD6331AE6634722000F1EDEBCCA75B808080C0C0C0808080
          B97432FAFCFFE6921CA85D2DAD6432A5551EB06737AD6332A8602E844012F0EB
          E9CE8B5F808080C0C0C0C0C0C0C0C0C0808080B87B32FFFAF7E79F38A85D2DC0
          855DFFFFFFC78960834011EBDDDCCFB361808080C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0808080B39C2FFFFAF7E6921CA36043CA98737A2900F0EBE8CFB3618080
          80C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080B87B32FAFCFFDE
          89126D2A08F2EEEBCE8B5F808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0808080B97432FFFFFFFFFFFFCCA75B808080C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080B7
          833EBC9151808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
        Caption = #1053#1077#1076#1086#1089#1090#1072#1095#1072' '#1087#1086' '#1087#1088#1080#1077#1084#1091' '#1090#1086#1074#1072#1088#1072'...'
        OnClick = miNedSpisClick
      end
      object miPrihWater: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000130B0000130B000000000000000000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FFD6AF92E8CAB0ECCEB4DFB38ADBAB7EDDAA7CDF
          AC7BDFAC7EDEAD7EDEAE80E3BA94EBCAB0ECCCB8D5AE900000FF0000FFE0BCA3
          F0DFD0E9CEB9D2A57ACE9D6FD09D6FD29D71D09E71D19F73D29F75D4AA81E6C7
          ADF5E3D8E5CAB30000FF0000FFCD9F7BE5CAB5EACCB5D3A271CD9A69CB9867CC
          9866CC9A67CD9A68CD9B69D6A578EAC7ACECD4C1CB9D770000FF0000FFC9A180
          EFDCD0F2DCCCD1A478C69464C19160C39362C69363C59362C89866D9AF84F1D3
          BEF4E2D8CCA6840000FF0000FFD6B49EE4CBBAE9CAB6CCA481C89C76C49771C6
          9973C59975C59976C69A78D1AC8BE7C7B1E6D1BFD9BAA10000FF0000FFDCC1AD
          F2E5DCECD6C5CDA185C29778C19677C19778BF9879C29A7BC69D7DD1AD90E9CD
          BBF4E9E2E3CEBE0000FF0000FFDBC7BBBC8B68C18758BD8554BB8256BC8357BC
          8458BB8458BC865ABD875BC18A5BC39162BF9371DFCEC20000FF0000FF0000FF
          E8E3DBBD93789D6138A6663AAE6C3EB26D3EB26E3DB16F3EAE6D3EA86A3FC09A
          80EEE8E40000FF0000FF0000FF0000FF0000FFF9FBFBD6CAC681584A6C2D187A
          311C7E331C77321B8B5E4DDBCEC90000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FFA6715EA24D2BA74D2AAF78660000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFDEC9BAB7
          734EB06E48D7C3B90000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FFD7C1B8AD6945B86542D9C3BA0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFDBB3A39B
          442A9F3F28E6B7A90000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FFD7AA9A8C372585311FE2AB990000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFEDE2DFC6
          A59EC4A69EEFE1DC0000FF0000FF0000FF0000FF0000FF0000FF}
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1088#1080#1093#1086#1076#1085#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102' '#1085#1072' '#1074#1086#1076#1091'...'
        OnClick = miPrihWaterClick
      end
      object N61: TMenuItem
        Bitmap.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000E30E0000E30E00000001000000010000180808002108
          0800290808001010100018101000391010000810180010181800181818002918
          1800391818004A18180052181800002918000010210021212100392121005221
          2100081829002121290029292900312929007329290021293100313131004231
          310000183900393139003939390010394200424242004A4242007B4242008442
          42008C42420000214A0039394A0031424A0039424A0042424A004A4A4A005A4A
          4A00424A52004A4A52004A525200525252005A52520063525200A55252000029
          5A0008315A0010425A00394A5A005A5A5A00635A5A006B5A5A00003163000831
          63000839630010396300525A6300636363006B63630073636300B56363004252
          6B004A5A6B00525A6B005A636B00736B6B007B6B6B008C6B6B0010427300184A
          73007373730010217B00395A7B007B7B7B00947B7B00A57B7B00002984001029
          8400215284004A638400BD84840008218C0000298C0008298C0008398C002142
          8C00214A8C0029528C00215A8C00295A8C00426B8C00AD8C8C00BD8C8C000021
          940029529400295A940029639400316394004A73940052739400BD9494000018
          9C0010299C0031639C00316B9C00396B9C00CE9C9C000018A5000021A500215A
          A5004273A500527BA500D6A5A5000852AD004273AD00427BAD004A7BAD00D6AD
          AD00DEADAD000031B5000052B500427BB5004A7BB5004A84B5005284B5005A8C
          B500D6B5B500E7B5B5000031BD000842BD005284BD00528CBD005A8CBD00B5BD
          BD00D6BDBD00396BC6005A8CC6005A94C6006394C600E7C6C6006394CE00639C
          CE00E7CECE00FFCECE000039D600005AD6006B9CD60073A5D60084ADD60073A5
          DE0073ADDE007BADDE007BADE70084B5E70084BDE7003984EF00A5CEEF00B5D6
          EF00FFEFEF003184F700FF00FF004294FF0073B5FF0084BDFF0094C6FF009CCE
          FF009CD6FF00A5D6FF00ADDEFF00BDE7FF00C6E7FF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00898989898989
          8989898989898989898989898989898935898989898989898989898989894A0F
          2D4A8989898989898989898914087921080389898989898989894D7493833E40
          11059B652D1E898989894A744E1F18600B049B781414273D35894A681F1C4679
          16049B7F1A325D1E354A892EA28F6E6E461A9594515A6B12083B893D3F4F2017
          39A3A87D5061515248658989890823759FA9AB810D38564B5B6589898928A9AB
          AC98868E9B886D3385848989894AADA09878806D91979A6B6B7189898989678E
          9197A99B888E919D88728989898989894A4C9180807880915E42898989898989
          894A2667877780264A898989898989898989894A4C5E42898989}
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1087#1088#1080#1093#1086#1076#1085#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102'...'
        OnClick = N61Click
      end
    end
    object miPilotProj: TMenuItem
      Caption = #1044#1086#1089#1090#1091#1087#1085'i '#1083'i'#1082#1080
      object miChekPilot: TMenuItem
        Caption = #1055#1088#1086#1076#1072#1078#1072' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074'...'
        OnClick = miChekPilotClick
      end
      object N22: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1087#1088#1086#1076#1072#1078#1072#1084'...'
        OnClick = N22Click
      end
      object N56: TMenuItem
        Caption = #1055#1077#1088#1077#1095#1077#1085#1100' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074' "'#1044#1086#1089#1090#1091#1087#1085'i '#1083'i'#1082#1080'"...'
        OnClick = N56Click
      end
      object N108: TMenuItem
        Caption = '-'
      end
    end
    object miOper: TMenuItem
      Caption = #1054#1087#1077'&'#1088#1072#1094#1080#1080
      object N28: TMenuItem
        Caption = #1055#1088#1077#1076#1086#1087#1083#1072#1090#1072
        object miPrev: TMenuItem
          Caption = #1054#1092#1086#1088#1084#1080#1090#1100' '#1087#1088#1077#1076#1086#1087#1083#1072#1090#1091'...'
          OnClick = miPrevClick
        end
        object miPrepChek: TMenuItem
          Caption = #1063#1077#1082' '#1087#1086' '#1087#1088#1077#1076#1086#1087#1083#1072#1090#1077'...'
          OnClick = miPrepChekClick
        end
      end
      object N31: TMenuItem
        Caption = #1063#1077#1082#1080
        object N98: TMenuItem
          Caption = #1055#1086#1087#1086#1083#1085#1077#1085#1080#1077' '#1089#1095#1077#1090#1072
          ShortCut = 16461
          OnClick = N98Click
        end
        object N97: TMenuItem
          Caption = '-'
        end
        object miChekKurier: TMenuItem
          Caption = #1040#1087#1090#1077#1095#1085#1099#1081' '#1082#1091#1088#1100#1077#1088
          Visible = False
          OnClick = miChekKurierClick
        end
        object miSktretchChek: TMenuItem
          Caption = #1054#1087#1083#1072#1090#1072' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072#1084#1080'...'
          OnClick = miSktretchChekClick
        end
        object N1: TMenuItem
          Caption = #1055#1086' '#1073#1072#1083#1083#1072#1084' "'#1052#1072#1084#1072' '#1080' '#1084#1072#1083#1099#1096'"'
          OnClick = N1Click
        end
        object N2: TMenuItem
          Caption = #1055#1086' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1091'...'
          Enabled = False
          Visible = False
          OnClick = N2Click
        end
        object miProfarma: TMenuItem
          Caption = #1055#1086' '#1088#1077#1094#1077#1087#1090#1091' '#1055#1088#1086#1092#1072#1088#1084#1072'...'
          Visible = False
          OnClick = miProfarmaClick
        end
        object miPilottmp: TMenuItem
          Caption = #1055#1086' '#1088#1077#1094#1077#1087#1090#1091' ('#1087#1080#1083#1086#1090#1085#1099#1081' '#1087#1088#1086#1077#1082#1090')...'
          Visible = False
          OnClick = miPilottmpClick
        end
        object N43: TMenuItem
          Caption = #1055#1086' '#1088#1077#1077#1089#1090#1088#1072#1084' '#1089#1088#1086#1082#1086#1074#1086#1075#1086' '#1090#1086#1074#1072#1088#1072'...'
          Visible = False
          OnClick = N43Click
        end
        object N72: TMenuItem
          Caption = #1055#1086' '#1088#1077#1094#1077#1087#1090#1072#1084'...'
          OnClick = N72Click
        end
        object N86: TMenuItem
          Caption = #1063#1077#1082' '#1085#1072' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1077'...'
          OnClick = N86Click
        end
        object N90: TMenuItem
          Caption = #1063#1077#1082' '#1076#1083#1103' '#1089#1090#1088#1072#1093#1086#1074#1086#1081' '#1082#1086#1084#1087#1072#1085#1080#1080'...'
          OnClick = N90Click
        end
        object N99: TMenuItem
          Caption = #1063#1077#1082' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1086#1081'...'
          OnClick = N99Click
        end
        object N32: TMenuItem
          Caption = '-'
        end
        object EKKA1: TMenuItem
          Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1082#1086#1087#1080#1102' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1095#1077#1082#1072' '#1087#1086' EKKA'
          OnClick = EKKA1Click
        end
        object N91: TMenuItem
          Caption = '-'
        end
        object N92: TMenuItem
          Caption = #1055#1077#1095#1072#1090#1100' '#1087#1086#1079#1080#1094#1080#1081' '#1095#1077#1082#1072' '#1076#1083#1103' '#1073#1086#1083#1100#1085#1080#1094#1099'...'
          OnClick = N92Click
        end
      end
      object miBack: TMenuItem
        Caption = #1042#1086#1079#1074#1088#1072#1090' '#1086#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103'...'
        OnClick = miBackClick
      end
      object N29: TMenuItem
        Caption = #1042#1086#1079#1074#1088#1072#1090#1099' '#1085#1072' '#1089#1082#1083#1072#1076
        object miBackToSklad: TMenuItem
          Caption = #1063#1077#1082' '#1076#1083#1103' '#1074#1086#1079#1074#1088#1072#1090#1072'...'
          OnClick = miBackToSkladClick
        end
        object N30: TMenuItem
          Caption = '-'
        end
        object miVozvrPis: TMenuItem
          Caption = #1055#1077#1095#1072#1090#1100' '#1089#1087#1080#1089#1082#1072' '#1076#1083#1103' '#1074#1086#1079#1074#1088#1072#1090#1086#1074'...'
          OnClick = miVozvrPisClick
        end
        object N24: TMenuItem
          Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1074#1086#1079#1074#1088#1072#1090' '#1087#1086' '#1089#1087#1080#1089#1082#1091'...'
          OnClick = N24Click
        end
        object N69: TMenuItem
          Caption = '-'
        end
        object N70: TMenuItem
          Caption = #1058#1086#1074#1072#1088#1085#1086'-'#1084#1072#1090#1077#1088#1080#1072#1083#1100#1085#1099#1077' '#1094#1077#1085#1085#1086#1089#1090#1080'...'
          OnClick = N70Click
        end
      end
      object N105: TMenuItem
        Caption = #1050#1072#1088#1072#1085#1090#1080#1085
        OnClick = N105Click
        object N106: TMenuItem
          Caption = #1055#1086#1084#1077#1089#1090#1080#1090#1100' '#1074' '#1082#1072#1088#1072#1085#1090#1080#1085'...'
          Visible = False
          OnClick = N106Click
        end
        object miQuarantine: TMenuItem
          Caption = #1058#1086#1074#1072#1088#1099' '#1074' '#1082#1072#1088#1072#1085#1090#1080#1085#1077' '#1087#1086' '#1060'.'#1048'.'
          OnClick = miQuarantineClick
        end
      end
      object N33: TMenuItem
        Caption = #1044#1083#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1050#1056#1054
        object miKRO: TMenuItem
          Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1080' '#1050#1056#1054'...'
          Enabled = False
          OnClick = miKROClick
        end
        object miInv: TMenuItem
          Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1074#1099#1073#1086#1088#1086#1095#1085#1086#1081' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1086#1085#1085#1086#1081' '#1074#1077#1076#1086#1084#1086#1089#1090#1080'...'
          OnClick = miInvClick
        end
      end
      object N34: TMenuItem
        Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1077#1088#1077#1089#1086#1088#1090#1072
        object miPeresort: TMenuItem
          Caption = #1055#1086' '#1074#1099#1073#1086#1088#1086#1095#1085#1086#1081' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080'...'
          OnClick = miPeresortClick
        end
        object miPeresortPereuchet: TMenuItem
          Caption = #1055#1086' '#1087#1077#1088#1077#1091#1095#1077#1090#1091'...'
          OnClick = miPeresortPereuchetClick
        end
      end
      object N102: TMenuItem
        Caption = #1042#1085#1077#1089#1077#1085#1080#1077' '#1087#1086' '#1082#1091#1088#1100#1077#1088#1089#1082#1086#1081' '#1076#1086#1089#1090#1072#1074#1082#1077'...'
        OnClick = N102Click
      end
      object miClaimes: TMenuItem
        Caption = #1055#1088#1077#1090#1077#1085#1079#1080#1080' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1091
        OnClick = miClaimesClick
      end
      object N36: TMenuItem
        Caption = '-'
      end
      object miLT: TMenuItem
        Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1083#1080#1096#1085#1077#1075#1086' '#1090#1086#1074#1072#1088#1072'...'
        OnClick = miLTClick
      end
      object N44: TMenuItem
        Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1072#1082#1090#1072' '#1087#1086'  '#1073#1088#1072#1082#1091'...'
        OnClick = N44Click
      end
      object miNewNameOtkaz: TMenuItem
        Tag = 1
        Caption = #1042#1074#1077#1089#1090#1080' '#1087#1088#1086#1080#1079#1074#1086#1083#1100#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1086#1090#1082#1072#1079#1072'...'
        OnClick = miAddOtkazClick
      end
      object miScanBox: TMenuItem
        Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1103#1097#1080#1082#1086#1074' '#1089' '#1090#1086#1074#1072#1088#1086#1084'...'
        OnClick = miScanBoxClick
      end
      object N16: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103' '#1089#1095#1077#1090#1095#1080#1082#1086#1074'...'
        OnClick = N16Click
      end
      object N35: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' '#1087#1088#1080#1093#1086#1076#1086#1074'/'#1091#1093#1086#1076#1086#1074
        object miPredst: TMenuItem
          Caption = #1052#1077#1076#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1080'...'
          OnClick = miPredstClick
        end
        object miPredstKRO: TMenuItem
          Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1080' '#1050#1056#1054'...'
          Visible = False
          OnClick = miPredstKROClick
        end
        object N15: TMenuItem
          Caption = #1042#1086#1076#1080#1090#1077#1083#1080' ('#1089#1090#1072#1088#1099#1081' '#1087#1091#1085#1082#1090' '#1084#1077#1085#1102')...'
          Visible = False
          OnClick = N15Click
        end
        object N93: TMenuItem
          Caption = #1055#1086' '#1087#1088#1086#1087#1091#1089#1082#1091' '#1089' '#1096#1090#1088#1080#1093'-'#1082#1086#1076#1086#1084'...'
          OnClick = N93Click
        end
      end
      object N5: TMenuItem
        Caption = #1041#1088#1086#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074
        object N3: TMenuItem
          Tag = 1
          Caption = #1046#1091#1088#1085#1072#1083' '#1079#1072#1082#1072#1079#1086#1074'...'
          OnClick = N3Click
        end
        object N63: TMenuItem
          Caption = #1041#1088#1086#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1085#1072' '#1076#1088#1091#1075#1080#1093' '#1072#1087#1090#1077#1082#1072#1093'...'
          Visible = False
          OnClick = N63Click
        end
        object N84: TMenuItem
          Caption = #1047#1072#1082#1072#1079' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074' '#1085#1072' '#1089#1082#1083#1072#1076#1077'...'
          OnClick = N84Click
        end
        object N85: TMenuItem
          Caption = #1041#1088#1086#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1078#1080#1076#1072#1077#1084#1086#1075#1086' '#1090#1086#1074#1072#1088#1072'....'
          OnClick = N85Click
        end
      end
      object miLTM: TMenuItem
        Caption = #1051#1080#1096#1085#1080#1081' '#1090#1086#1074#1072#1088' '#1087#1086' '#1084#1080#1085#1091#1089#1086#1074#1086#1081' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
        OnClick = miLTMClick
      end
      object N45: TMenuItem
        Caption = #1056#1077#1077#1089#1090#1088' '#1089#1088#1086#1082#1086#1074#1099#1093' '#1090#1086#1074#1072#1088#1086#1074
        object miSpisSrok: TMenuItem
          Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1087#1080#1089#1082#1072' '#1089#1088#1086#1082#1086#1074#1099#1093' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074'...'
          OnClick = miSpisSrokClick
        end
        object N46: TMenuItem
          Caption = #1062#1077#1085#1085#1080#1082#1080' '#1085#1072' '#1089#1088#1086#1082#1086#1074#1099#1081' '#1090#1086#1074#1072#1088'...'
          OnClick = N46Click
        end
      end
    end
    object miReports: TMenuItem
      Caption = '&'#1054#1090#1095#1077#1090#1099
      object miPrintOst: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100' '#1086#1089#1090#1072#1090#1082#1086#1074'...'
        OnClick = miPrintOstClick
      end
      object miObnov: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1082#1080
        object miFNDS1: TMenuItem
          Tag = 1
          Caption = #1053#1044#1057
          OnClick = miFNDS1Click
        end
        object miFNDS2: TMenuItem
          Tag = 2
          Caption = #1041#1077#1079' '#1053#1044#1057
          OnClick = miFNDS1Click
        end
        object miFNDS3: TMenuItem
          Tag = 3
          Caption = #1063#1055' '#1053#1044#1057
          OnClick = miFNDS1Click
        end
        object miFNDS4: TMenuItem
          Tag = 4
          Caption = #1063#1055' '#1041#1077#1079' '#1053#1044#1057
          OnClick = miFNDS1Click
        end
        object miSpec: TMenuItem
          Tag = 5
          Caption = #1057#1087#1077#1094'.'
          OnClick = miSpecClick
        end
        object miObnDate: TMenuItem
          Caption = #1053#1072' '#1076#1072#1090#1091
          object miNDS1: TMenuItem
            Tag = 1
            Caption = #1053#1044#1057
            OnClick = miNDS1Click
          end
          object miNDS2: TMenuItem
            Tag = 2
            Caption = #1041#1077#1079' '#1053#1044#1057
            OnClick = miNDS1Click
          end
          object miNDS3: TMenuItem
            Tag = 3
            Caption = #1063#1055' '#1053#1044#1057
            Visible = False
            OnClick = miNDS1Click
          end
          object miNDS4: TMenuItem
            Tag = 4
            Caption = #1063#1055' '#1041#1077#1079' '#1053#1044#1057
            Visible = False
            OnClick = miNDS1Click
          end
        end
      end
      object miReg: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1087#1086#1083#1082#1072#1084'...'
        OnClick = miRegClick
      end
      object miRepRealiz: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080'...'
        OnClick = miRepRealizClick
      end
      object miRep: TMenuItem
        Caption = #1058#1086#1074#1072#1088#1085#1099#1081' '#1086#1090#1095#1077#1090'...'
        OnClick = miRepClick
      end
      object miRepKassir: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1074#1099#1088#1091#1095#1082#1072#1084' '#1082#1072#1089#1089#1080#1088#1086#1074' '#1087#1086' '#1075#1088#1072#1092#1080#1082#1091'...'
        OnClick = miRepKassirClick
      end
      object N66: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1074#1099#1088#1091#1095#1082#1072#1084' '#1082#1072#1089#1089#1080#1088#1086#1074'...'
        OnClick = N66Click
      end
      object miZero: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1079#1072#1082#1086#1085#1095#1080#1074#1096#1080#1084#1089#1103' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103#1084
        object miRepAlf: TMenuItem
          Tag = 1
          Caption = #1055#1086' '#1072#1083#1092#1072#1074#1080#1090#1091'...'
          OnClick = miRepAlfClick
        end
        object miRepReg: TMenuItem
          Tag = 2
          Caption = #1055#1086' '#1084#1077#1089#1090#1072#1084' '#1093#1088#1072#1085#1077#1085#1080#1103'...'
          OnClick = miRepAlfClick
        end
      end
      object miIncomeBlanks: TMenuItem
        Caption = #1041#1083#1072#1085#1082#1080' '#1076#1083#1103' '#1080#1085#1082#1072#1089#1089#1072#1094#1080#1080'...'
        OnClick = miIncomeBlanksClick
      end
      object N14: TMenuItem
        Caption = #1058#1072#1073#1077#1083#1100' '#1091#1095#1077#1090#1072' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080'...'
        OnClick = N14Click
      end
      object miOstatInBSklad: TMenuItem
        Caption = #1054#1089#1090#1072#1090#1082#1080' '#1085#1072' '#1089#1082#1083#1072#1076#1077' '#1074#1086#1079#1074#1088#1072#1090#1086#1074'...'
        OnClick = miOstatInBSkladClick
      end
      object N53: TMenuItem
        Caption = '"'#1059#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1087#1088#1077#1076#1083#1086#1078#1077#1085#1080#1077'"'
        OnClick = N53Click
      end
      object N54: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1076#1074#1080#1078#1077#1085#1080#1102' '#1089#1088#1086#1082#1086#1074#1099#1093' '#1090#1086#1074#1072#1088#1086#1074'...'
        OnClick = N54Click
      end
      object N60: TMenuItem
        Caption = #1056#1077#1077#1089#1090#1088' '#1083#1077#1082#1072#1088#1090#1089#1074#1077#1085#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074'...'
        OnClick = N60Click
      end
      object miNonCashRecipt: TMenuItem
        Caption = #1041#1077#1089#1087#1083#1072#1090#1085#1099#1077' '#1088#1077#1094#1077#1087#1090#1099'...'
        OnClick = miNonCashReciptClick
      end
      object N62: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1085#1077#1087#1077#1088#1077#1076#1072#1085#1085#1099#1084' '#1087#1086#1079#1080#1094#1080#1103#1084' '#1087#1086' '#1074#1086#1079#1074#1088#1072#1090#1072#1084'...'
        OnClick = N62Click
      end
      object N74: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1087#1088#1077#1087#1072#1088#1072#1090#1072#1084' '#1087#1086' '#1083#1100#1075#1086#1090#1085#1099#1084' '#1088#1077#1094#1077#1087#1090#1072#1084'...'
        OnClick = N74Click
      end
      object N100: TMenuItem
        Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077' '#1085#1072' '#1075#1072#1088#1072#1085#1090#1080#1081#1085#1099#1081' '#1088#1077#1084#1086#1085#1090' '#1084#1077#1076#1090#1077#1093#1085#1080#1082#1080'...'
        OnClick = N100Click
      end
      object N104: TMenuItem
        Caption = #1047#1072#1103#1074#1082#1072' '#1085#1072' '#1074#1088#1077#1084#1077#1085#1085#1091#1102' '#1079#1072#1084#1077#1085#1091' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072'...'
        OnClick = N104Click
      end
    end
    object miCheckDB: TMenuItem
      Caption = '&'#1055#1088#1086#1074#1077#1088#1082#1072' '#1041#1044
      object miCheckOst: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C04A714A4A
          714A718B71C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0ACBAAD377A3926B02A39CE3952A25390AE91C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C085AE8822A9263FCE3F3B
          CE3B47A24A85AE88C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0A4B4A424A32966DA6666DC6657D8574DC44D279A2CC0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A4B4A439913D5DCB6073DE7466DA6662
          DA6267DA673CC23E71A875C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C098B49A
          3FAA4481DF8890F5986DE17035AF3935AF3973DE7373DE734DA951ACBAADC0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C06FAC717EE68094F79C68D46C3EA64098B49A60
          9D6259D65B7AE57F5BD15C56A657C0C0C0C0C0C0C0C0C0C0C0C0C0C0C096B796
          53C65353C65371A875C0C0C0C0C0C0C0C0C04DA9517EE5848CF1926FCB7098B4
          9AC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A1B9A1A1B9A1C0C0C0C0C0C0C0C0C0C0
          C0C0ACBAAD79BE7C94F79C8CF1925AB65CA4B4A4C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C07DC57F89F2917CEA
          8055C356ABBBABC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0B1C1B16BD46DB3FCB488EF8D5ABD5AABBBABC0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C074D5
          74AEF9AE7CD87FA1B9A1C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0B1C1B174D5747BBC7BB5BDB5C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
        Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1086#1089#1090#1072#1090#1082#1086#1074'...'
        ShortCut = 49231
        OnClick = miCheckOstClick
      end
      object miCheckSumZ: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          180000000000000300000000000000000000000000000000000000FFFF000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000080808080808080808080808080808080808080808080
          8080808080808080808080808080808080808080808080000000808080FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF808080000000808080FFFFFFFFFFFFFFFF00FFFF00FFFF00FFFFFFC0
          C0C0FFFFFFFFFFFF8080FF8080FF8080FFFFFFFF808080000000808080FFFFFF
          FF0000FF0000FF0000FFFFFFFFFFFFC0C0C0FFFFFF0000FF0000FF0000FFFFFF
          FFFFFFFF808080000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0
          C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080000000808080FFFFFF
          FFFFFFFFFF00FFFF00FFFF00FFFFFFC0C0C0FFFFFFFFFFFFFFFF00FFFF00FFFF
          00FFFFFF808080000000808080FFFFFFFF0000FF0000FF0000FFFFFFFFFFFFC0
          C0C0FFFFFFFF0000FF0000FF0000FFFFFFFFFFFF808080000000808080FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF808080000000808080FFFFFFFFFFFFFFFF00FFFF00FFFF00FFFFFFC0
          C0C0FFFFFFFFFFFFFFFF00FFFF00FFFF00FFFFFF808080000000808080FFFFFF
          FF0000FF0000FF0000FFFFFFFFFFFFC0C0C0FFFFFFFF0000FF0000FF0000FFFF
          FFFFFFFF808080000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0
          C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080000000808080FFFFFF
          FFFFFFFFFF00FFFF00FFFF00FFFFFFC0C0C0FFFFFFFFFFFF8080FF8080FF8080
          FFFFFFFF808080000000808080FFFFFFFF0000FF0000FF0000FFFFFFFFFFFFC0
          C0C0FFFFFF0000FF0000FF0000FFFFFFFFFFFFFF808080000000808080FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF80808000000080808080808080808080808080808080808080808080
          808080808080808080808080808080808080808080808000FFFF}
        Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1089#1091#1084#1084' '#1087#1086' Z-'#1086#1090#1095#1077#1090#1072#1084'...'
        ShortCut = 49240
        OnClick = miCheckSumZClick
      end
      object miCheckBase: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000430B0000430B00000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0808080A26F17A26F17808080C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080AC6B26FF
          F3F0FFFFFFB49B2D808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0808080B15A2AFFF6ED886E5C876B58FFF8F8B77232808080C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080AC7224F7EEEAE4914A9E
          592C9A58265E2702FFFFFFB77A32808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          808080AC7224FEE4DFE29B5EA75925C89572C48B66CB966F602A06FEF5F7B69F
          30808080C0C0C0C0C0C0C0C0C0808080B15A2AF7EEEAE29B5EA95317A75925ED
          DDD5FFFFFFE9CFC19E531D724728FEF5F7B77A32808080C0C0C0808080AD6B26
          F6F1ECE4914AA95D2AAC6231AC6230BC8159FFFFFFBA7B51AD6331A35B28622E
          0AFFFFFFB77232808080A26F17FFEFEFE4A36DA95F2FAD6330AD6331AD6331BC
          8057FFFFFFBA7B50AC6230AE6331B36A36612B06FFFFFFB7833EA26F17FFFFFF
          E3B06EA65C2FAE6430AD6331AD6331B7784FFFFFFFBA7B50AC6230AE6331AF68
          368D4615FFFFFFBC9151808080B3992DFFFAF8E68E139E5738AD6330A5541DFF
          FFFFFFFFFFBC7D54AD6331AE6634722000F1EDEBCCA75B808080C0C0C0808080
          B97432FAFCFFE6921CA85D2DAD6432A5551EB06737AD6332A8602E844012F0EB
          E9CE8B5F808080C0C0C0C0C0C0C0C0C0808080B87B32FFFAF7E79F38A85D2DC0
          855DFFFFFFC78960834011EBDDDCCFB361808080C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0808080B39C2FFFFAF7E6921CA36043CA98737A2900F0EBE8CFB3618080
          80C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080B87B32FAFCFFDE
          89126D2A08F2EEEBCE8B5F808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0808080B97432FFFFFFFFFFFFCCA75B808080C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080B7
          833EBC9151808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
        Caption = #1050#1086#1084#1087#1083#1077#1082#1089#1085#1072#1103' '#1087#1088#1086#1074#1077#1088#1082#1072'...'
        OnClick = miCheckBaseClick
      end
    end
    object miForProvis: TMenuItem
      Caption = #1050#1072#1073#1080#1085#1077#1090' '#1087#1088#1086#1074#1080#1079#1086#1088#1072
      OnClick = miForProvisClick
      object N6: TMenuItem
        Caption = #1040#1082#1094#1080#1080' '#1076#1083#1103' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1077#1081' '#1080' '#1087#1088#1086#1074#1080#1079#1086#1088#1086#1074'...'
        OnClick = N6Click
      end
      object N27: TMenuItem
        Caption = #1040#1082#1094#1080#1103' "'#1056#1086#1079#1099#1075#1088#1099#1096' '#1087#1088#1080#1079#1086#1074'"'
        OnClick = N27Click
      end
      object N41: TMenuItem
        Caption = '-'
      end
      object N7: TMenuItem
        Caption = #1057#1087#1080#1089#1086#1082' '#1090#1086#1074#1072#1088#1086#1074' '#1087#1086' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' "'#1052#1072#1084#1072' '#1080' '#1084#1072#1083#1099#1096'"...'
        OnClick = N7Click
      end
      object N9: TMenuItem
        Caption = #1057#1088#1077#1076#1085#1080#1081' '#1095#1077#1082', '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1089#1086#1087#1091#1090#1089#1090#1074#1091#1102#1097#1080#1084' '#1080' '#1072#1074#1090#1086#1079#1072#1084#1077#1085#1072#1084'...'
        Visible = False
        OnClick = N9Click
      end
      object miFarmZamAndSoputstv: TMenuItem
        Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1092#1072#1088#1084'.'#1079#1072#1084#1077#1085' '#1080' '#1089#1086#1087#1091#1090#1089#1090#1074#1091#1102#1097#1080#1093
        OnClick = miFarmZamAndSoputstvClick
      end
      object N77: TMenuItem
        Caption = #1053#1072#1088#1091#1096#1077#1085#1080#1103'...'
        OnClick = N77Click
      end
      object N95: TMenuItem
        Caption = #1047#1072#1084#1077#1095#1072#1085#1080#1103', '#1090#1088#1077#1073#1091#1102#1097#1080#1077' '#1086#1090#1074#1077#1090#1072'...'
        OnClick = N95Click
      end
      object N67: TMenuItem
        Caption = '-'
      end
      object N68: TMenuItem
        Caption = #1057#1080#1089#1090#1077#1084#1072' '#1084#1086#1090#1080#1074#1072#1094#1080#1080' "'#1055#1088#1080#1086#1088#1080#1090#1077#1090#1099'" + "'#1042#1072#1096#1072' '#1082#1086#1087#1080#1083#1082#1072'"...'
        Default = True
        OnClick = N68Click
      end
      object N40: TMenuItem
        Caption = '-'
      end
      object N79: TMenuItem
        Caption = #1057#1072#1081#1090' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1082#1086#1084#1087#1072#1085#1080#1080'...'
        OnClick = N79Click
      end
      object Medicard1: TMenuItem
        Caption = #1057#1072#1081#1090' "Medicard- '#1050#1089#1072#1088#1077#1083#1090#1086'"...'
        OnClick = Medicard1Click
      end
      object N78: TMenuItem
        Caption = '-'
      end
      object N17: TMenuItem
        Caption = #1047#1072#1088#1087#1083#1072#1090#1085#1099#1081' '#1082#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088'...'
        Visible = False
        OnClick = N17Click
      end
      object N20: TMenuItem
        Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099' '#1087#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1102' '#1079#1072#1088#1087#1083#1072#1090#1099'...'
        Visible = False
        OnClick = N20Click
      end
      object N76: TMenuItem
        Caption = #1057#1083#1091#1078#1077#1073#1085#1072#1103' '#1074#1099#1076#1072#1095#1072'...'
        Visible = False
        OnClick = N76Click
      end
      object N103: TMenuItem
        Caption = #1042#1099#1076#1072#1095#1072' '#1073#1086#1085#1091#1089'-'#1082#1086#1087#1080#1083#1082#1080'...'
        Visible = False
        OnClick = N103Click
      end
      object N80: TMenuItem
        Caption = #1057#1083#1091#1078#1077#1073#1085#1072#1103' '#1074#1099#1076#1072#1095#1072' '#1091#1074'. ...'
        OnClick = N80Click
      end
      object N88: TMenuItem
        Caption = #1057#1083#1091#1078#1077#1073#1085#1072#1103' '#1074#1099#1076#1072#1095#1072' '#1091#1073'. ...'
        OnClick = N88Click
      end
      object N23: TMenuItem
        Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' ...'
        Visible = False
        OnClick = N23Click
      end
      object N64: TMenuItem
        Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1077' '#1083#1080#1089#1090#1099' '#8470'1...'
        OnClick = N64Click
      end
      object N210: TMenuItem
        Caption = #1041#1086#1085#1091#1089#1085#1099#1081' '#1083#1080#1089#1090'...'
        Visible = False
        OnClick = N210Click
      end
      object N65: TMenuItem
        Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1077' '#1083#1080#1089#1090#1099' '#1087#1077#1088#1089#1086#1085#1072#1083'...'
        OnClick = N65Click
      end
      object N87: TMenuItem
        Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1080#1077' '#1087#1083#1072#1085#1072' '#1072#1087#1090#1077#1082#1086#1081' '#1079#1072' '#1087#1088#1086#1096#1083#1099#1081' '#1084#1077#1089#1103#1094'...'
        OnClick = N87Click
      end
      object N94: TMenuItem
        Caption = #1055#1083#1072#1085#1099' '#1087#1086' '#1074#1099#1088#1091#1095#1082#1077' '#1085#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094'...'
        OnClick = N94Click
      end
      object N39: TMenuItem
        Caption = '-'
      end
      object miTable: TMenuItem
        Caption = #1043#1088#1072#1092#1080#1082' '#1088#1072#1073#1086#1090#1099' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074'...'
        ShortCut = 113
        OnClick = miTableClick
      end
      object N25: TMenuItem
        Caption = #1047#1072#1082#1072#1079' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074' '#1087#1086' '#1087#1088#1072#1081#1089#1072#1084' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
        object N37: TMenuItem
          Caption = #1047#1072#1082#1072#1079#1072#1090#1100'...'
          OnClick = N37Click
        end
        object N38: TMenuItem
          Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1079#1072#1082#1072#1079#1086#1074'...'
          OnClick = N38Click
        end
      end
      object N42: TMenuItem
        Caption = #1047#1072#1082#1072#1079' '#1082#1072#1085#1094#1077#1083#1103#1088#1089#1082#1080#1093' '#1080' '#1093#1086#1079#1103#1081#1089#1090#1074#1077#1085#1085#1099#1093' '#1090#1086#1074#1072#1088#1086#1074'...'
        Visible = False
        OnClick = N42Click
      end
      object N47: TMenuItem
        Caption = #1043#1088#1072#1092#1080#1082' '#1089#1073#1086#1088#1072' '#1090#1086#1074#1072#1088#1072' '#1085#1072' '#1089#1082#1083#1072#1076#1077'...'
        OnClick = N47Click
      end
      object N48: TMenuItem
        Caption = '-'
      end
      object N49: TMenuItem
        Caption = #1041#1083#1072#1085#1082#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        Visible = False
        object N50: TMenuItem
          Caption = #1047#1072#1074#1083#1077#1085#1080#1077' '#1085#1072' '#1091#1074#1086#1083#1085#1077#1085#1080#1077' '#1089' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1077#1084' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080'...'
          OnClick = N50Click
        end
        object N51: TMenuItem
          Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077' '#1085#1072' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1077' '#1073#1077#1079' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080'...'
          OnClick = N51Click
        end
        object N52: TMenuItem
          Caption = #1054#1087#1080#1089#1100' '#1087#1077#1088#1077#1076#1072#1074#1072#1077#1084#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074'...'
          OnClick = N52Click
        end
      end
      object N75: TMenuItem
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1085#1072#1082#1086#1087#1080#1090#1077#1083#1100#1085#1086#1081' '#1076#1080#1089#1082#1086#1085#1090#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1077'...'
        OnClick = N75Click
      end
      object N107: TMenuItem
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1074#1080#1076#1077#1086#1091#1088#1086#1082#1086#1074'...'
        OnClick = N107Click
      end
      object N55: TMenuItem
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099', '#1073#1083#1072#1085#1082#1080', '#1080#1085#1089#1090#1088#1091#1082#1094#1080#1080'...'
        OnClick = N55Click
      end
    end
    object N18: TMenuItem
      Caption = #1055#1077#1088#1074#1072#1103' '#1088#1077#1082#1086#1084#1077#1085#1076#1072#1094#1080#1103'...'
      ShortCut = 16496
      OnClick = N18Click
    end
    object miService: TMenuItem
      Caption = '&'#1057#1083#1091#1078#1077#1073#1085#1099#1077
      object miCardInfo: TMenuItem
        Bitmap.Data = {
          16020000424D16020000000000003600000028000000100000000A0000000100
          180000000000E0010000130B0000130B000000000000000000000000FFC2E1BE
          C2E1BEC2E1BEC2E1BEC2E1BEC2E1BEC2E1BEC2E1BEC2E1BEC2E1BEC2E1BEC2E1
          BEC2E1BEC2E1BE0000FFC0D5CBC2E1BEC2E1BEC2E1BEC2E1BEC2E1BEC2E1BEC2
          E1BEC2E1BEC2E1BEC2E1BEC2E1BEC2E1BEC2E1BEC2E1BEC1D6CCBDDABAB3D9AC
          B3D9ACB3D9ACB3D9ACB3D9ACB3D9ACB3D9ACB3D9ACB3D9ACB3D9ACB3D9ACB3D9
          ACB3D9ACB3D9ACBEDBBAAFD3A8B3D9ACB3D9ACB3D9ACB3D9ACB3D9ACB3D9ACB3
          D9ACB3D9ACB3D9ACB3D9ACB3D9ACB3D9ACB3D9ACB3D9ACAFD4A8A0CD97A4D29A
          A4D29AA4D29AA4D29AA4D29AA4D29AA4D29AA4D29AA4D29AAFD5A8CFE3CBC3DE
          BEA4D19AA3D299A0CE9691C68594CB8894CB8894CB8894CB8794CB8794CB8794
          CB8794CB879ECD93BDC0BFCCCDCECDCECFABC98E8AC17291C78471A583679791
          64939367969176AD835F8C976A9B8E5D889A64929390AFA6D5D6D7CBCCCDB5C3
          A27DA4426EA93B7BB76274B86276BD6376BD6376BD6376BD6376BD6376BD6376
          BD6376BD6385C175C9CBCAE3E4E49FB77A709E2B609D1F6AAB4565B15167B651
          67B65167B65166B65166B65066B65066B65066B65066B6507CB96C97B69092BB
          8862A53462AC3F64B24F0000FF56AB3E56AB3E56AB3E56AB3E56AB3D56AB3D56
          AB3D56AB3D56AB3D56AB3D56AB3D56AB3D56AB3D56AB3D0000FF}
        Caption = #1055#1088#1086#1074#1077#1088#1082#1072' &'#1076#1080#1089#1082#1086#1085#1090#1085#1086#1081' '#1082#1072#1088#1090#1086#1095#1082#1080
        OnClick = miCardInfoClick
      end
      object miNoScan: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          180000000000000300000000000000000000000000000000000000FFFFE7E7E7
          E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E76869FD635BFF393FF20021A798AC
          D6DEDEDEE7E7E7E7E7E7E7E7E7FFFFFFFFFFFFFFFFFFE7E7E7E7E7E7E7E7E7E7
          E7E7B2B2FF5C5CFE5F5CFF4D4EFD0018A3B6CBD5E7E7E7E7E7E7E7E7E7424242
          FFFFFF424242424242424242FFFFFF424242424242ACACFE4C4BFF5B5BFF484A
          FB1D47AB2340C5E7E7E7E7E7E7424242FFFFFFFFFFFF424242FFFFFFFFFFFF42
          4242FFFFFFE7E7E7B2B2FE6464FF635EFF2F3DE2363DEF343DEDE7E7E7424242
          FFFFFFFFFFFF424242FFFFFFFFFFFFC6C6C6424242424242FFFFFF6565FE6768
          FC7066FF6B5CFF152FCCE7E7E7424242FFFFFF424242424242FFFFFFFFFFFFFF
          FFFFFFFFFF424242BBBBFE6E6EFF7C78FF5052E24B4AEF3A44EDE7E7E7424242
          FFFFFFFFFFFF424242FFFFFFFFFFFF424242424242C0C0FE7675FF8281FF6C6C
          FB0749AB2250C5E7E7E7E7E7E7424242FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFCCCCFF8D8DFE9491FF8C8CFD0822A300C0D549C6FFE7E7E7E7E7E7424242
          FFFFFF424242424242FFFFFF424242FFFFFF9B9CFDB4ABFF7F85F2022DA79EAC
          D6424242424242E7E7E7E7E7E7424242FFFFFF424242424242FFFFFF424242FF
          FFFF9A95FF5969DF2349B38EA6CFFFFFFF424242424242DEDEDEE7E7E7424242
          FFFFFF424242424242FFFFFF424242FFFFFF424242424242424242424242FFFF
          FF424242424242E7E7E7E7E7E7424242FFFFFF424242424242FFFFFF424242FF
          FFFF424242424242424242424242FFFFFF424242424242E7E7E7E7E7E7424242
          FFFFFF424242424242FFFFFF424242FFFFFF424242424242424242424242FFFF
          FF424242424242E7E7E7E7E7E7424242FFFFFF424242424242FFFFFF424242FF
          FFFF424242424242424242424242FFFFFF424242424242E7E7E7E7E7E7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7
          E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7}
        Caption = #1053#1077#1086#1090#1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1087#1086#1079#1080#1094#1080#1080'...'
        OnClick = miNoScanClick
      end
      object miCancelV: TMenuItem
        Bitmap.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000130B0000130B000010000000000000000000000000FF
          000084848400D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
          1111111111111111111111111110001111111111100404001111111110440404
          0111111111040444011111111004444040111110044040444401111044444040
          4401111040044404040111110444044440111111104044040111111110040040
          1111111111040401111111111110001111111111111111111111}
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1086#1090#1084#1077#1085#1077#1085#1085#1099#1093' '#1095#1077#1082#1086#1074'...'
        OnClick = miCancelVClick
      end
      object miSendMess: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000130B0000130B00000000000000000000C8D0D4C8D0D4
          C8D0D4C8D0D44273845A6B6BC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4089CD6218CB531738C6B
          6B6BC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D431ADF721A5E7218CAD5A6B6BC8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D431A5D64AB5FF29
          A5EF2184AD636B6BC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
          C8D0D46B7B7B63737B319CBD5AC6FF4AB5FF21A5E729738C6B7373C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4399CBD31B5E742C6EF5ACEFF63CEFF5A
          CEFF4ABDF721A5E7218CB539738C5A6B6BC8D0D4C8D0D4C8D0D4C8D0D442A5CE
          63D6FF73DEFF73DEFF6BD6FF6BD6FF63CEFF63CEFF52BDFF39ADF7189CE7188C
          B5636B6BC8D0D4C8D0D48CADB56BD6EF7BE7FF6BDEFF42BDEF42BDF742BDEF42
          BDEF4ABDF752C6F752BDFF4AB5FF29A5F71894C64A6B73C8D0D442B5DEBDF7FF
          84EFFF73E7FF5AD6F752CEF74AC6EF42BDF739BDEF31B5EF52C6FF52BDFF4AB5
          FF29A5F71884B56B7B7B39B5DEC6F7FF84EFFF7BE7FF5ACEF752C6F752CEF752
          CEF752CEF752CEF752C6FF52C6FF52BDFF42B5FF21A5E74A737B39B5DECEFFFF
          94F7FF7BE7FF5AD6F74ACEEF42C6EF39BDEF39BDF729B5EF29B5E729ADE752C6
          FF52BDFF31ADEF52738439A5C6BDEFF7B5F7FF84EFFF6BDEF76BDEF763DEFF6B
          DEFF63D6FF5ACEF75AD6F75AC6FF63CEFF63CEFF39B5EF52737BC8D0D45AC6E7
          DEF7FF94EFFF42C6E742C6E739BDEF42BDEF39BDEF31BDEF31B5E739B5EF63CE
          FF63D6FF4AA5CE7B8C8CC8D0D4C8D0D46BCEE7D6F7FFCEF7FF9CF7FF8CEFFF84
          E7FF7BE7FF73DEFF6BDEFF63D6F76BD6FF52C6F74A849CC8D0D4C8D0D4C8D0D4
          C8D0D463A5BD73CEEFA5DEEFB5E7F7ADEFF7B5EFFFB5EFFF94E7F752CEF742B5
          E7739CADC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D463A5BD63C6E763
          BDDE52BDDE52BDDE5ABDDE7BA5B5C8D0D4C8D0D4C8D0D4C8D0D4}
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077'...'
        OnClick = miSendMessClick
      end
      object N71: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F673F247F4F30673F247F7F7FFFFFFFFF
          FFFFFFFFFFFFFFFF7F7F7F673F247F4F30673F247F7F7FFFFFFF7F7F7F9B6F30
          DFCFABF3EBDBF7E7CBD38F58574B3FFFFFFFFFFFFF7F7F7F9B6F30DFCFABF3EB
          DBF7E7CBD38F58574B3F4F3000CF9F63DFB79FE3D3AFEFE7D7F3E7AB875737BF
          BFBFC7C7C74F3000CF9F63DFB79FE3D3AFEFE7D7F3E7AB8757374F3000CF9F73
          D7AB83D7B79FDFC39FEFCF8B6F57277F7F7F8F8F8F4F3000CF9F73D7AB83D7B7
          9FDFC39FEFCF8B6F5727171717AB6F0CCF9F67CF9F57CFAB7F9B57302F2F2F7F
          7F7F8F8F8F202020AB6F0CCF9F67CF9F57CFAB7F9B57300B0B0BA3A3A3807468
          5B300C6730186730184747474F4F4F7F7F7F8F8F8FCBCBCB584C405B300C6730
          18673018171717282828D7D7D7C3C3C3BFBFBF8888887070705F5F5F4F4F4F7F
          7F7F8F8F8FDFDFDFB8B8B88888887070706B6B6B4F4F4F8B8B8BFFFFFFABABAB
          D7D7D7A0A0A07878786767675757570000000F0F0FDFDFDFB8B8B88888887070
          70636363282828FFFFFFFFFFFFD7D7D79B9B9B8F8F8F7373736767675757572C
          2C2C3B3B3B9F9F9F8B8B8B7373736767674F4F4F8B8B8BFFFFFFFFFFFFFFFFFF
          ABABABC7C7C7AFAFAF8484845353534848485B5B5BDFDFDFB4B4B49C9C9C7878
          78282828FFFFFFFFFFFFFFFFFFFFFFFFD7D7D7C3C3C3BFBFBF8888885858580F
          0F0F1F1F1FDFDFDFB8B8B88484845858588B8B8BFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFABABABD3D3D3A0A0A05C5C5C6F6F6F777777DFDFDFB8B8B87C7C7C2828
          28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7C3C3C3C7C7C79B9B9B6F
          6F6F777777AFAFAFC7C7C75B5B5B838383FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFAFAFAF505050333333FFFFFFFFFFFF7777774C4C4C535353FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1103'...'
        OnClick = N71Click
      end
      object MDMU1: TMenuItem
        Caption = #1055#1088#1080#1093#1086#1076' '#1090#1086#1074#1072#1088#1072' '#1076#1083#1103' MDMU...'
        Visible = False
        OnClick = MDMU1Click
      end
      object N83: TMenuItem
        Caption = #1054#1073#1084#1077#1085' '#1089#1090#1072#1088#1086#1081' '#1082#1072#1088#1090#1099' "'#1056#1072#1076#1080' '#1078#1080#1079#1085#1080'" '#1085#1072' '#1085#1086#1074#1091#1102' '#1082#1072#1088#1090#1091'...'
        OnClick = N83Click
      end
      object miS2: TMenuItem
        Caption = '-'
      end
      object miArhBase: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000B9CFB4B9CFB4
          B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4996600040404996600040404CC99
          00040404996600040404B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9
          CFB4040404996600040404CC9900040404996600040404996600B9CFB4B9CFB4
          B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4040404CC99
          00B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB404
          0404040404040404040404040404040404333300B9CFB4B9CFB4B9CFB4B9CFB4
          B9CFB4B9CFB4B9CFB4B9CFB4040404996600CC9900CC9900CCCC33CCCC33FFCC
          66CC9966333300B9CFB4B9CFB4B9CFB466666666666666666666666604040404
          0404040404040404040404040404040404996600FFCC99333300B9CFB41B81B4
          1B81B4147AAD147AAD0F75A80B71A4046A9D046A9D01679A01679A6666666666
          66040404FFCC990404042187BA66CCFF1F85B86ED4FF6ED4FF6ED4FF6ED4FF6E
          D4FF6ED4FF3AA0D399FFFF01679A666666040404FFCC99040404248ABD66CCFF
          248ABD80E6FF80E6FF80E6FF80E6FF80E6FF80E6FF43A9DC99FFFF01679A6666
          66040404FFCC990404042C92C56ED4FF3399CC99FFFF99FFFF99FFFF99FFFF99
          FFFF99FFFF5FC5F899FFFF076DA0666666040404FFCC990404042C92C580E6FF
          2C92C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80E6FFFFFFFF0B71A46666
          66040404FFCC990404043399CC85EBFF80E6FF2C92C52C92C52C92C52C92C524
          8ABD1F85B81B81B41B81B41B81B4B9CFB4040404FFCC990404043399CC91F7FF
          8EF4FF8EF4FF8EF4FF8EF4FFFFFFFFFFFFFFFFFFFF147AAD666666B9CFB4B9CF
          B4040404FFCC990404043399CCFFFFFF99FFFF99FFFF99FFFFFFFFFF248ABD1B
          81B41B81B4177DB0040404040404040404996600FFCC99333300B9CFB43399CC
          FFFFFFFFFFFFFFFFFF298FC2040404996600CC9900CC9900CCCC33CCCC33FFCC
          66CC9966333300B9CFB4B9CFB4B9CFB43399CC3399CC2C92C5B9CFB4B9CFB404
          0404040404040404040404040404040404333300B9CFB4B9CFB4}
        Caption = '&'#1040#1088#1093#1080#1074#1072#1094#1080#1103' '#1073#1072#1079#1099'...'
        OnClick = miArhBaseClick
      end
      object miUnloadBase: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000B0C6B1B0C6B1
          B0C6B1B0C6B197AA988A9B8B8B9C8C8B9C8C8B9C8C8B9C8C8A9B8B93A594B0C6
          B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B16466623A36354341404A
          46454B48474543423C3837626260B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1
          B0C6B1B0C6B186857F96B3CD89888A92ABC08FA1B08B929994B1CB9A9693B1C6
          B2B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B6B2ADFFFCFAFFFEFEFF
          FCFBFFFCFBFFFFFEFFFBFAD9D0CDB0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1
          B0C6B1B0C6B1A1A19AF7E9E9BDB4B4F0E5E5FBF0F0BDB4B4ECDFDFBCB6B3B0C6
          B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1707E71B1A8A6E8D6D6716464DD
          CFCFF6E7E7716464D3C3C3CBC0BE6F7D70B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1
          B0C6B1777C77C2BCBCF5E3E3FFF5F5FFEFF0FFEEEEFFF5F5FFEFEFC3BBBB777B
          77B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B17C807CB0ADACD1C9C5D3CBC8D7
          CDC9D7CECBD4CBC7D0C9C5B7B3B27B807CB0C6B1B0C6B1B0C6B1B0C6B1B0C6B1
          B0C6B19EA39EEDEEEFEAEBECEDEEEFF0F1F2F0F1F2ECEDEEE9EBECEDEEEF9EA3
          9EB0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B16F6650D6C6B9D6CABDDDD2C8E3
          D8D0E5DBD2E2D6CCDED1C7E1D3C76D654EB0C6B1B0C6B1B0C6B1B0C6B1B0C6B1
          B0C6B16C6852D9C9BAD8CCBFDDD2C7E1D7CDE4D9D0E7DAD2EADDD5EEDFD86A65
          4FB0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B171725ED3C2B0D5C7BAD9CDC1DD
          D2C7E0D6CCE3D8CFE5D9D0E4D5C970705CB0C6B1B0C6B1B0C6B1B0C6B1B0C6B1
          B0C6B1838A77CBB8A4D2C3B4D4C8BAD9CDC0DCD1C5DFD4CAE0D7CDDACABB8388
          76B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B198A593C8B19BCEBDADD0C2B3D5
          C7B9D6C9BDDACEC1DCD1C6D3C1AD97A693B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1
          B0C6B1B0C6B18F8F7ECDBBA8CDBBABD0C1B0D2C4B4D6C6B9DBCCBD909585B0C6
          B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1B1C4B1B5C1B1BA
          C2B3BBC3B4B6C2B2B2C4B2B0C6B1B0C6B1B0C6B1B0C6B1B0C6B1}
        Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1073#1072#1079#1091' '#1085#1072' '#1060#1051#1045#1064#1050#1059
        OnClick = miUnloadBaseClick
      end
      object miUpdate: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0808080000000000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF808080808080C0C0C0C0C0C0C0C0C0C0C0C00000FFC0C0C08080808080
          80000000000000FFFFFFFFFFFFFFFFFF808080FF0000808080C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0808080808080000000808080000000FFFFFF808080
          808000FF0000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080808080
          80000000808080000000FFFFFF808080008000FF0000808080C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0808080808080000000808080000000808080008000
          FF0000FF0000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080808080
          80000000808080000000808080808000FF0000FF000080808080808080808080
          8080808080808080808080000000808080000000808080000000808080808000
          FF0000FF0000808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080800000
          00000000808080000000808080808000FF0000FF0000808080FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF808080808080000000000000000000808080FFFFFF
          808000FF00008080808080808080808080808080808080808080800000008080
          80000000808080000000FFFFFF808080FFFFFFFFFFFF808080C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0808080000000000000808080000000FFFFFF808080
          FFFFFFC0C0C0808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080808080
          80000000000000000000FFFFFFFFFFFF808080FFFFFFFFFFFF808080C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080000000808080000000FFFFFFFFFFFF
          FFFFFF808080808080FFFFFF8080808080808080808080808080808080808080
          80C0C0C0808080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080
          8080808080808080808080808080808080808080808080FFFFFF}
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
        Visible = False
        OnClick = miUpdateClick
      end
      object N19: TMenuItem
        Bitmap.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000130B0000130B00001000000000000000007F0000007F
          3F0000404000306F6F006F6F6F0000BF000000FF000020DF2000209F5F005CBC
          5C0021B6B6006BAFAF007CFBFB00B3B4B400A9E9E900E9E9E900666666666334
          36666666666E4ACEA2666666DD4EDACEA26666BECEDEDACEA26666DECEDEDACE
          A26666DECEDDDAFEB26666DECEDEDEECC36666DECEDEFDDDDD6666DECEDECCCC
          B66666DECEDCCCCCE66666DECEFBBBE3D66666DECEFFECBBD66666DCEFFFFFFB
          D66666DECCCCCCCEF66666DFFEFEFEFFD666666DDDDDDDBD6666}
        Caption = #1057#1078#1072#1090#1100' '#1073#1072#1079#1099
        OnClick = N19Click
      end
      object N81: TMenuItem
        Caption = '-'
      end
      object N21: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E000000000000000000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF3C6D6DC2C2C20000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF73BABA6A
          CCCC256666B9BEBE0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF42BBBB5DF6F65DC8D8256969BFBFBF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF83C1C1AAE8EB64
          CFE78CEFF74FBCD4116168BCBFBF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF78BCBE79D2E88CEFF764CDE767E6F439B6CC216363BCBF
          BF0000FF0000FF0000FF0000FF0000FF0000FF0000FF5CAFAF8FDBE789ECF566
          CEE654E4F637C7E946D0F33ECFD8186168BFBFBF0000FF0000FF0000FF0000FF
          0000FF0000FF3BADAD8DF0F567D3E954EBF542C2E939DBF148C3ED5AC3DE51B8
          C41E6363B9BEBE0000FF0000FF0000FF0000FF4F5F5F096F6F76DEE654EBF542
          BFE83BDCF345C1EC48C9DF5EC2E33BB1CD4EC0DE1F6266C2C2C20000FF0000FF
          0000FF982C1E541E110D898938C7D930E8F33BC8EC52DADF57C9E337ADC84DC0
          E54EC0D01F62620000FF0000FF0000FFCA9595E5A669DC9F8D3E1E1E2081814A
          CCE546D4DF57C2E02CB8CB48BCDC2893A61E63630000FF0000FF0000FF0000FF
          BA7575F5BF7AF1AF78D8895B441A110D898957C9D334B4C717B3B31B5B5B5F71
          710000FF0000FF0000FF0000FF0000FFBD7361F8C887EBA764EE7941B4402649
          0B0B075E600E5A5B515B5B0000FF0000FF0000FF0000FF0000FF0000FFC68776
          ECC17BF0A46CAE41258E1D0E81110E5511114F4F4F0000FF0000FF0000FF0000
          FF0000FF0000FF0000FFC07965EFC37CF3A76F90291566515175757575757500
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFB03F15EF9552
          962E187B67670000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF7417074F240F6B54540000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074' '#1076#1083#1103' "'#1042#1086#1079#1088#1072#1090#1072' '#1087#1086' '#1089#1087#1080#1089#1082#1091'"'
        OnClick = N21Click
      end
      object N26: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E000000000000000000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF3C6D6DC2C2C20000FF0000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF73BABA6A
          CCCC256666B9BEBE0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF42BBBB5DF6F65DC8D8256969BFBFBF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF83C1C1AAE8EB64
          CFE78CEFF74FBCD4116168BCBFBF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF78BCBE79D2E88CEFF764CDE767E6F439B6CC216363BCBF
          BF0000FF0000FF0000FF0000FF0000FF0000FF0000FF5CAFAF8FDBE789ECF566
          CEE654E4F637C7E946D0F33ECFD8186168BFBFBF0000FF0000FF0000FF0000FF
          0000FF0000FF3BADAD8DF0F567D3E954EBF542C2E939DBF148C3ED5AC3DE51B8
          C41E6363B9BEBE0000FF0000FF0000FF0000FF4F5F5F096F6F76DEE654EBF542
          BFE83BDCF345C1EC48C9DF5EC2E33BB1CD4EC0DE1F6266C2C2C20000FF0000FF
          0000FF982C1E541E110D898938C7D930E8F33BC8EC52DADF57C9E337ADC84DC0
          E54EC0D01F62620000FF0000FF0000FFCA9595E5A669DC9F8D3E1E1E2081814A
          CCE546D4DF57C2E02CB8CB48BCDC2893A61E63630000FF0000FF0000FF0000FF
          BA7575F5BF7AF1AF78D8895B441A110D898957C9D334B4C717B3B31B5B5B5F71
          710000FF0000FF0000FF0000FF0000FFBD7361F8C887EBA764EE7941B4402649
          0B0B075E600E5A5B515B5B0000FF0000FF0000FF0000FF0000FF0000FFC68776
          ECC17BF0A46CAE41258E1D0E81110E5511114F4F4F0000FF0000FF0000FF0000
          FF0000FF0000FF0000FFC07965EFC37CF3A76F90291566515175757575757500
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFB03F15EF9552
          962E187B67670000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF7417074F240F6B54540000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1076#1083#1103' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
        OnClick = N26Click
      end
      object N59: TMenuItem
        Bitmap.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000D40E0000D40E0000100000000000000000000000FF00
          00000080000000FF000080808000FFFFFF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000111111111111
          1111111111000011111111110033330011111110333333330111112333222233
          3011112332111123301112330111111233011233011111123301123301111112
          3301123301110012330111233011230330111123301123333011111221112333
          0111111111112333301111111111222220111111111111111111}
        Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1083#1085#1099#1081' '#1074#1086#1079#1074#1088#1072#1090'...'
        OnClick = N59Click
      end
      object N73: TMenuItem
        Caption = #1057#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1085#1077#1074#1085#1099#1077' '#1089#1091#1084#1084#1099
        Visible = False
        OnClick = N73Click
      end
      object N89: TMenuItem
        Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1087#1077#1088#1077#1091#1095#1077#1090#1085#1091#1102' '#1074#1077#1076#1086#1084#1086#1089#1090#1100'...'
        Visible = False
        OnClick = N89Click
      end
      object N82: TMenuItem
        Caption = '-'
      end
      object miRolik: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0E0E1E1CCCDCEB1
          B2B4ACAEAFC2C3C4C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0B2B3B554565A23262B292C302B2E322224283D4044909193C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C088898B212428584A2F9E7722BD
          8B18C9961ABD932A816A362B2C2D54575AC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          9A9C9D1F21257C5D23BA8425C59749CEA762D6B672DDBF78E2B257BE944C3A39
          355E6064C0C0C0C0C0C0C0C0C0DADBDB26292D644B22B27E32C09A67D5BFA0CD
          AE7DD3B783D9C18BE4C07DE0AD5DAA8043222427A8AAABC0C0C0C0C0C0949697
          222221A16D1FB17E3FC09B6BFDFDF9EFE9DDD9C299D5B16FDAAE62D6A150C083
          2A59492B616467C0C0C0C0C0C066686B453821AE7A30B07D38BE955EFEFDFAFE
          FDFAFDFCF9EFE6D5DAB77ECA933EB67A1B7A5518494C4FC0C0C0C0C0C0717376
          675639B3873EB78A45C5A16BFDFCF9FEFDF9FEFDF9FEFDF9FCFBF7E7D9C1AF78
          187B510F56585BC0C0C0C0C0C08C8D8F796D5ABA9354BC9551C8A96EFDFCFAFE
          FCF9FEFDF9FDFCF8E6D6B4BE913FA06503725221737476C0C0C0C0C0C0B0B1B2
          83817EB99A6BC3A26DCEB385FCFDFBFDFBF8EFE3CDCB9A3EB57401B07C25A16E
          207568549C9E9FC0C0C0C0C0C0C0C0C098999B9C8E7BD0B997D7C3A4F4F0E8C7
          A46BC39345AF6F03A46501AD803C8D6835838485C2C2C3C0C0C0C0C0C0C0C0C0
          BDBDBE979697A99E90E7DCCBE5D8C4C4A472CCAF81C29E67C3A272B6A2868F8C
          889FA0A1C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0BBBBBCAEAEB09E9A96BDB9B2D0
          C4B3AC8E65BEB3A39588779898989E9FA1C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0CBCCCDB9BABBB9BABBB7B7B8B4B4B5B0B1B2AFAFB0BABBBCC0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0DDDDDEC4
          C5C6C2C2C3D4D5D5C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
        Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1088#1077#1082#1083#1072#1084#1085#1099#1084' '#1088#1086#1083#1080#1082#1086#1084'...'
        Visible = False
        OnClick = miRolikClick
      end
      object miS3: TMenuItem
        Caption = '-'
        Visible = False
      end
      object miMoveMoney: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000400B0000400B000000000000000000000000FF0000FF
          0000FF0000FF0000FF0000FF9DB6B785A8AA83A0A198A3A30000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF71B7BE20B1BE08C3D208
          A8AF073E40047E811A91936073730000FF0000FF0000FF0000FF0000FF0000FF
          0000FF36BACA08CBDE03D8EB09B8C563A5AA83828106595D01BEC001CCCF196E
          6F0000FF0000FF0000FF0000FF0000FF3BC3D708CFE706D2E9149CAA617D81C5
          C8C8E0E1E2717373202C2C026E7101E0E31883830000FF0000FF0000FF83C8D3
          0FCAE605D1EC28BBCDA7C2C5E8EBEBF2F3F5F5F6F6F5F5F5D3D1D148403F0193
          9601E3E85797980000FF0000FF51C3DA08C9E80AC6E377BFCBDBEBECE5EBECAC
          C3C893B1B3DFE2E1FBFAFAC6C0BF0C646801F6FB18B1B3B8C0C00000FF2AC3E3
          03C3E707C5E343BBCF7BB8C3819599306067496164CCCFCFFDFCFCE8E3E31D88
          8D00F3FC00D2D899BABA0000FF2BC1E303BFE603C5E810C1E24098A799A3A6CB
          CDCDEAECEBF9FAFBFBFCFDCAD5D70CC3CF00F0FD00DDE685BCBE0000FF3BC0E3
          03BAE303C1E72FB6D1C8D9DCF2F5F3F7F8F7F7F8F8F0F1F1C6D0D249C0CC01E5
          F600EAF800DCE887C2C60000FF83C0D304B7E004BCE565BCD1F3F8F6FAFAFAC5
          C7C68395985170750E303403545E01BCCB00E9FA00D7E69FC8CB0000FFADC5CD
          0CB6E002B7E356B6D0F6F7F6FBFBFB8C8C8C454D4FB7BDBEC7C3C3666B6C00B1
          C200E5F818D1DF0000FF0000FF0000FF86BED203B1E111ABD3B9CFD6FAFCFAFB
          FCFCFAFAFAFCFDFEF5F3F260C0CE00D5EE00DBF173D1DB0000FF0000FF0000FF
          0000FF7CBCD31AAEDC13A9CE7DB7CAD9E3E7F3EEED9BBBC147BACF01CBE800D6
          F054D0E00000FF0000FF0000FF0000FF0000FF0000FFA2C3CE36B6DC02A7D874
          B3C5A3B8BE01A3C500CAED43C9E07BCBD80000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FFABC5CE93BFCD85BDCC85C5D698C8D20000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
        Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1076#1077#1085#1077#1075' '#1087#1086' '#1082#1072#1089#1089#1077'...'
        OnClick = miMoveMoneyClick
      end
      object miOptSum: TMenuItem
        Bitmap.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Caption = #1055#1088#1086#1073#1080#1090#1100' '#1086#1087#1090#1086#1074#1091#1102' '#1089#1091#1084#1084#1091
        Visible = False
        OnClick = miOptSumClick
      end
      object miZX: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000000000000000000000000000000000000000FF0000FF
          0000000000000000FF0000FF0000FF0000000000000000000000FF0000FF0000
          000000000000FF0000FF0000FF0000FF000000FFFFFF000000000000000000FF
          FFFFFFFFFFFFFFFF000000000000FFFFFF0000000000FF0000FF0000FF0000FF
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF0000000000FF0000FF0000FF0000FF000000FFFFFFFFFFFFFFFFFF00000000
          0000000000000000000000FFFFFFFFFFFF0000000000FF0000FF0000FF0000FF
          000000FFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFF
          FF0000000000FF0000FF0000FF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000FF0000FF0000FF0000FF
          000000FFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
          FF0000000000FF0000FF0000FF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000FF0000FF0000FF0000FF
          000000FFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
          FF0000000000FF0000FF0000FF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000FF0000FF0000FF0000FF
          000000FFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
          FF0000000000FF0000FF0000FF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000FF0000FF0000FF0000FF
          000000FFFFFF000000000000000000000000000000FFFFFFFFFFFF000000FFFF
          FF0000000000FF0000FF0000FF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000FF0000FF0000FF0000FF
          000000FFFFFF000000000000FFFFFF000000FFFFFF000000000000FFFFFFFFFF
          FF0000000000FF0000FF0000FF0000FF0000000000000000FF0000FF00000000
          00FF0000000000FF0000FF0000000000000000000000FF0000FF}
        Caption = #1054#1058#1063#1045#1058#1067' (Z,&X, '#1074#1085#1077#1089#1077#1085#1080#1077'/'#1074#1099#1076#1072#1095#1072')...'
        ShortCut = 49242
        OnClick = miZXClick
      end
      object miS4: TMenuItem
        Caption = '-'
      end
      object miBlockN: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E0000000000000000000000FF0000FF00
          00FF008080804C646D425D6D425B6E435E725D7D8A80808000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF008080805B4E6C42637342637343647B4C
          778A6293AB83B9CA80808000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          808080394C4E4263734263734C708357869D6599B293CFDEABDBE77597A18080
          8000FF0000FF0000FF0000FF0000FF008080803C5053426373426373496C8557
          869F659BB784C5DCC4F5FBC6F3FB7D87B480808000FF0000FF0000FF0000FF00
          80808043535D4263734263734C73895786A1679FBA86C5DBCBF9FFC3F4F97BB7
          CB80808000FF0000FF0000FF0000FF0080808043596043647647687E4C708557
          86A4659FBA81C2DBCCF9FFC5F4F972A9C280808000FF0000FF0000FF0000FF00
          8080804D63744B6D845682986199B66195AF6BA7C284C8DBCDF9FFCAF4F970A5
          BF80808000FF0000FF0000FF0000FF00808080546E7F4D6D7D46647067A1BC63
          9DB8679EB881C2D6C8F6FBC1F4F970A0BB80808000FF0000FF0000FF0000FF00
          8080805C50613A474A485D646CB0CC6EADCC64A3BD547E948CA1A9A8D8DD72A4
          BC80808000FF0000FF0000FF0000FF0000FF008080805F68664561576195AE63
          98B268A4C15B8EAB3D54595C839070A2B880808000FF0000FF0000FF0000FF00
          00FF0000FF00717A7345534C00FF008080807E68B55A859F2E3B38496B787280
          B080808000FF0000FF0000FF0000FF0000FF0000FF006D786D3A4A3F00FF0000
          FF00808080808080303F3E80808080808000FF0000FF0000FF0000FF0000FF00
          00FF0000FF007581783D524180808000FF0000FF0000FF00313A4080808000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF008080804D5D5046594A80
          808000FF00808080313D3C80808000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF008080804D5D50636F6862736961706780808000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0080808080
          808080808080808000FF0000FF0000FF0000FF0000FF0000FF00}
        Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072'...'
        ShortCut = 49218
        OnClick = miBlockNClick
      end
      object miUsers: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0BEA196C55332
          D64D2ADB5534DA5739CA522EC55134A05F4EAA9D939DA89C8BAC8B8EB18E90B4
          90A0B79BA5B3A0B4B7B4C3988BE15535F8684FFE7860F47C5CE09063E56C49ED
          65499D592C4E90402489245EB65769C6625CC65756B3519EB19EC59F92E86143
          FF7C63F98463E58E60FBD2A0E98458FF8C6BBF723C5CAF4D94C5858ECB839EE0
          8C77DA6A5AC55A9EB79EC2B9B5D67E67F47C5DE3754FE1A07FF7C093E9885BFB
          8867A78A465DBC5DE6F1DDAAD2A889CF809EE08C77C9709EB79EC0C0C0A5A5A5
          74422E3D1E3A202B942B2F85894A56946D3E68C86860B05ED3DAD6BDCFD274AD
          7681C77792B492C0C0C0B0B0B056565611161F09255F153CA4153CA424349184
          8C9B8FB9914898743F8FCC2C8CD02D83AC458070C0C0C0C0C0C0959595272727
          0F284F1A56BB1B5FC21B5FC2174DB44C5F8DB3BCC1529CE03C99F93699F93196
          F72786CFA4ADB0C0C0C08E8E8E2B2B2B1C375A2370D12677DE2677DE206ACF3C
          5C9797B4C841A0F247AAFF41AAFF3FA2FF37A0FB608AA4C0C0C0909090383838
          2A3B541F6AC94C9EF5479EFD2882E84970A296B7CD4FADF76BC0FF6BC0FF60BA
          FF47AAFF6FA6C9C0C0C095959545454548494C40516929487D2B4BA9314F9F83
          8F9C9AB8CB61B6F54FB0E953B7F468BEFF52B1FB599BC5C0C0C0C0C0C0747474
          5C5C5C868686A0A0A0686868484848A5A5A5A7B8C13D8DBB499DCE5AA8D552A4
          D6338DC15992B1C0C0C0C0C0C0B0B0B08787875F5F5F6161616C6C6CA2A2A2C0
          C0C0C0C0C089B3C967AEDA8DC4E67CBCE34E9DC7A7B8C1C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A4C2D2A0C2D299BA
          CEB4BFC4C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
        Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103' &'#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081'...'
        ShortCut = 16469
        OnClick = miUsersClick
      end
      object miOptions: TMenuItem
        Bitmap.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          180000000000000300000000000000000000000000000000000000FF0000FF00
          D7CAC0EEDAAFBFBFC00A48BC2552B3D9C0A2C8CCCCB8BBBDD6BCA2D3D5D200FF
          0000FF0000FF0000FF0000FF00607EC12652B1B79897A4A5A747B3E858ADD8BE
          9882AA998E6460655A504CC3B8A600FF0000FF0000FF0000FF00CCD3D669B1DC
          58B2E12859B44881C781ECFE6DD4F53763B1838393F8BA71B57027B4A28C00FF
          00C7CFD300FF0000FF00C4C6C799E1F78FE9FE6EC7EB67C1E875D8F66AD5F651
          B1DB8D999AFAB569B87129A38A85E7D5C0C6D1D500FF0000FF000F42AE5196D2
          8CE3FB84DEF977DBF870D2F269D2F561D0EF99A7A1FBAD5DAA6B2E133999A8A9
          BCC7CFD400FF0000FF0061B3DC7BCAED87DEF87AD7F798DEF5ABB9BF687A853D
          81B49AA5A4FAA954B172381F80AE9EB9C8C7CFD400FF0000FF009FEBFD94E9FD
          82DAF779D8F8DCEFF6C2B5B4675A553259799EACAEF9A44EA76F3E259FC2BBD7
          DB00FF0000FF0000FF00BDDDE491CAE781D7F47AD8F8DEF3FCBCB9BD61616143
          7C8CB2C1B4F89F49A36A3F69A1B2C7C4C800FF0000FF0000FF0000FF007284C4
          78CFF178DEF9D8E4E498918E4545453D7F90B8C8B7F79B44AB6F4C88939700FF
          0000FF0000FF0000FF0000FF00B8CFDD99DDF39FDCEFD2D7D4A3988D5958588B
          A2A8C6C0A7ED9036AF7D616A747900FF0000FF0000FF0000FF0000FF0000FF00
          C9D1CEC8CFD3C8D0D4C9D0D2AEB5B8C4CCCE8B8277B59D87826960757B7E00FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF00A4A9AA969896625F644E
          56595E6566AAB0B48D8D8F696B6D00FF0000FF00BDC4C8C5CDD100FF0000FF00
          00FF00BCC2C6888F92E2E5E6C9C9C97D7D7D767878D0D0CFCCCCCC6564647F83
          8594989A5B595990969900FF0000FF0000FF00C3CBCF969797D9D9D9E1E2E2CA
          CACA838383B9B9B9CCCBCBC2C1C19B99999190907D767692969800FF0000FF00
          00FF0000FF0092999AACADADC4C4C4959595AFB0B0C4C7C7C3C7C7BAC0C19FA6
          A6888A8A9A9C9E00FF0000FF0000FF0000FF0000FF00C2CBCEA3A9ABA2AAACB8
          C0C39297987E88898293937A85869CA6A8ACB4B700FF0000FF00}
        Caption = '&'#1053#1072#1089#1090#1088#1086#1081#1082#1080'...'
        ShortCut = 16468
        Visible = False
        OnClick = miOptionsClick
      end
      object miShowMCash: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1086#1082#1085#1086' '#1074#1074#1086#1076#1072' '#1089#1076#1072#1095#1080
        Visible = False
        OnClick = miShowMCashClick
      end
    end
    object N10: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object N11: TMenuItem
        Caption = #1048#1085#1089#1090#1088#1091#1082#1094#1080#1103' '#1076#1083#1103' '#1082#1072#1089#1089#1080#1088#1072' '#1080#1083#1080' '#1087#1088#1086#1074#1080#1079#1086#1088#1072'...'
        OnClick = N11Click
      end
      object N12: TMenuItem
        Caption = #1057#1080#1084#1074#1086#1083#1100#1085#1099#1077' '#1086#1073#1086#1079#1085#1072#1095#1077#1085#1080#1103'...'
        OnClick = N12Click
      end
      object miHotKeyInfo: TMenuItem
        Caption = #1043#1086#1088#1103#1095#1080#1077' '#1082#1083#1072#1074#1080#1096#1080'...'
        OnClick = miHotKeyInfoClick
      end
      object N13: TMenuItem
        Caption = #1047#1072#1082#1072#1079' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074' '#1087#1086' '#1080#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1084' '#1088#1077#1094#1077#1087#1090#1072#1084'...'
        Visible = False
        OnClick = N13Click
      end
    end
    object Extempore1: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0CDD6D99CC1CB76AEC16DA5B974ABBE90B3BCC2CACCC0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C1C1C189A7B25B93AA669CAE64
        9DAF5E99AB518EA2819EA9CDD0D0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0CFD2D2799FA86698AB6DA3B76AA3B6619BAE5C93A36E929DD1D6D6C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0B5C4C76695A56BA7B46FAABD71
        A9BD70A6B9679DAD5B8A97BBC7CAC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C092ADB5649CAD6EAFB972AFBE7DB5C57AAEBE6DA5B16196A48CA4ABC5C6
        C6C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C07497A269A2B176B1BD7AB4C07F
        B5C27BB0BC6FA7B4639AA9638892CBCDCDC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0668F9979A8B982B3C086B7C588BCC981B6C376ACBC639CAF507C88C2C5
        C5C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0678F997EAABA82AEBB7DAABB79
        ABBD71A7B96B9FB25B95AA4E7D8CC4C7C8C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C072909C6392A4537E8E5680945180965689A054839B4C7F98577C8ECCCE
        CFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0A3B2B947697B587B8D6A8D9E56
        7F9259879C5D899F41677D95A6B0C2C2C3C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C5C6C6AEBABF92A1AA89A1AD7B99A66085936D97A8688F9EBFCACEC0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C1C1C1C5C6C6C5
        C6C6C8CFD16F93A06E9DAC859EA9CECFD0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C2C3C3B1C3C66C98A47299A7ACBC
        C2CDCECFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C9CCCC7C9DA66F96A9658995B5C5CAC0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0B5C0C35C8495658F
        A66B8792C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C3C4C47C969E506E80AEBCC4C0C0C0C0C0C0}
      Caption = 'Extempore'
      OnClick = Extempore1Click
    end
  end
  object alMain: TActionList
    Left = 109
    Top = 175
    object SetOrderArt_Code: TAction
      Caption = 'SetOrderArt_Code'
      ShortCut = 32880
      OnExecute = SetOrderArt_CodeExecute
    end
    object SetOrderNames: TAction
      Caption = 'SetOrderNames'
      ShortCut = 32881
      OnExecute = SetOrderNamesExecute
    end
    object SetGroup1: TAction
      Caption = 'SetGroup1'
      ShortCut = 113
    end
    object SetGroup2: TAction
      Caption = 'SetGroup2'
      ShortCut = 114
    end
    object SetGroup3: TAction
      Caption = 'SetGroup3'
      ShortCut = 115
    end
    object SetGroup4: TAction
      Caption = 'SetGroup4'
      ShortCut = 116
    end
    object SetGroup5: TAction
      Caption = 'SetGroup5'
      ShortCut = 117
    end
    object CloseChek: TAction
      Caption = 'CloseChek'
      OnExecute = CloseChekExecute
    end
    object CopyData: TAction
      ShortCut = 16451
      OnExecute = CopyDataExecute
    end
    object acK1: TAction
      Caption = 'acK1'
      ShortCut = 123
      OnExecute = acK1Execute
    end
    object acNEKKA: TAction
      Caption = 'acNEKKA'
      ShortCut = 16461
      OnExecute = acNEKKAExecute
    end
    object acCtrlD: TAction
      Caption = 'acCtrlD'
      Enabled = False
      OnExecute = acCtrlDExecute
    end
    object Action1: TAction
      Caption = 'Action1'
    end
  end
  object tmrFlushPassw: TTimer
    Interval = 7000
    OnTimer = tmrFlushPasswTimer
    Left = 194
    Top = 126
  end
  object pmMain: TPopupMenu
    Left = 269
    Top = 126
    object miOpenChek: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1095#1077#1082
      ShortCut = 16462
      OnClick = btnOChekClick
    end
    object miCloseChek: TMenuItem
      Caption = #1054#1087#1083#1072#1090#1072
      ShortCut = 16453
      OnClick = miCloseChekClick
    end
    object miChek: TMenuItem
      Caption = #1063#1045#1050
      OnClick = miChekClick
    end
    object miCancelChek: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1095#1077#1082
      OnClick = miCancelChekClick
    end
    object miP1: TMenuItem
      Caption = '-'
    end
    object miSumSkd: TMenuItem
      Caption = #1057#1091#1084#1084#1072#1088#1085#1072#1103' '#1089#1082#1080#1076#1082#1072
      GroupIndex = 1
      Visible = False
      OnClick = miSumSkdClick
    end
    object miFixSkd: TMenuItem
      Caption = #1060#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1089#1082#1080#1076#1082#1072
      GroupIndex = 1
      RadioItem = True
      Visible = False
      OnClick = miFixSkdClick
    end
    object miCardSkd: TMenuItem
      Caption = #1057#1082#1080#1076#1082#1072' '#1087#1086' '#1082#1072#1088#1090#1086#1095#1082#1077'...'
      GroupIndex = 1
      RadioItem = True
      OnClick = miCardSkdClick
    end
    object N96: TMenuItem
      Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1089#1087#1080#1089#1072#1085#1080#1103'...'
      GroupIndex = 1
      OnClick = N96Click
    end
    object miP2: TMenuItem
      Caption = '-'
      GroupIndex = 1
      Visible = False
    end
    object miEditReg: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1084#1077#1089#1090#1072' '#1093#1088#1072#1085#1077#1085#1080#1103
      GroupIndex = 1
      ShortCut = 115
      OnClick = miEditRegClick
    end
    object miEAN13Info: TMenuItem
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1064#1090#1088#1080#1093'-'#1050#1086#1076#1072#1093'...'
      GroupIndex = 1
      Visible = False
      OnClick = miEAN13InfoClick
    end
    object miCenaUp: TMenuItem
      Caption = #1062#1077#1085#1072' '#1079#1072' '#1091#1087#1072#1082#1086#1074#1082#1091'...'
      GroupIndex = 1
      ShortCut = 117
      OnClick = miCenaUpClick
    end
    object miTerap: TMenuItem
      Caption = #1058#1077#1088#1072#1087#1077#1074#1090#1080#1095#1077#1089#1082#1072#1103' '#1079#1072#1084#1077#1085#1072'...'
      GroupIndex = 1
      ShortCut = 118
      OnClick = miTerapClick
    end
    object miMoveTov: TMenuItem
      Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072'...'
      GroupIndex = 1
      ShortCut = 120
      OnClick = miMoveTovClick
    end
    object miATC1: TMenuItem
      Caption = #1055#1088#1077#1087#1072#1088#1072#1090#1099', '#1074#1093#1086#1076#1103#1097#1080#1077' '#1074' '#1086#1076#1085#1091' '#1082#1083#1072#1089#1089#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1091#1102' '#1075#1088#1091#1087#1087#1091' '#1040#1058#1057'...'
      GroupIndex = 1
      ShortCut = 119
      OnClick = miATC1Click
    end
    object miAnnot: TMenuItem
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1072#1085#1085#1086#1090#1072#1094#1080#1080'...'
      GroupIndex = 1
      ShortCut = 121
      OnClick = miAnnotClick
    end
    object miKolProd: TMenuItem
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1088#1086#1076#1072#1085#1085#1086#1075#1086'...'
      GroupIndex = 1
      OnClick = miKolProdClick
    end
    object miAddOtkaz: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102' '#1074' '#1086#1090#1082#1072#1079#1099'...'
      GroupIndex = 1
      ShortCut = 116
      OnClick = miAddOtkazClick
    end
    object N8: TMenuItem
      Tag = 2
      Caption = #1054#1090#1082#1072#1079' '#1087#1086' "'#1057#1088#1086#1095#1085#1072#1103' '#1079#1072#1103#1074#1082#1072'"...'
      GroupIndex = 1
      Visible = False
      OnClick = miAddOtkazClick
    end
    object N58: TMenuItem
      Tag = 3
      Caption = #1054#1090#1082#1072#1079' '#1087#1086' '#1094#1077#1085#1077'...'
      GroupIndex = 1
      ShortCut = 16501
      OnClick = miAddOtkazClick
    end
    object miNoTov: TMenuItem
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1087#1088#1077#1087#1072#1088#1072#1090#1091'...'
      GroupIndex = 1
      ShortCut = 123
      OnClick = miNoTovClick
    end
    object miPrintSertif: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1086#1074'...'
      GroupIndex = 1
      OnClick = miPrintSertifClick
    end
    object miP3: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object miFindByName: TMenuItem
      Action = SetOrderNames
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102' '#1090#1086#1074#1072#1088#1072
      GroupIndex = 1
    end
    object miFindByCode: TMenuItem
      Action = SetOrderArt_Code
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1082#1086#1076#1091' '#1090#1086#1074#1072#1088#1072
      GroupIndex = 1
    end
    object miFindEx: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1074#1093#1086#1078#1076#1077#1085#1080#1102'...'
      GroupIndex = 1
      ShortCut = 16502
      OnClick = miFindExClick
    end
    object N101: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object miInsuranceInformation: TMenuItem
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1090#1088#1072#1093#1086#1074#1086#1081
      GroupIndex = 1
      OnClick = miInsuranceInformationClick
    end
  end
  object SMTP: TIdSMTP
    MaxLineLength = 86384
    MaxLineAction = maException
    ReadTimeout = 0
    RecvBufferSize = 8192
    Port = 25
    AuthenticationType = atLogin
    Password = '123456789'
    Left = 410
    Top = 165
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 343
    Top = 165
  end
  object pmSkdList: TPopupMenu
    Left = 270
    Top = 175
    object miSkd2: TMenuItem
      Tag = 2
      Caption = '2%'
      OnClick = miSkd2Click
    end
    object miSkd3: TMenuItem
      Tag = 3
      Caption = '3%'
      OnClick = miSkd2Click
    end
    object miSkd4: TMenuItem
      Tag = 4
      Caption = '4%'
      OnClick = miSkd2Click
    end
    object miSkd5: TMenuItem
      Tag = 5
      Caption = '5%'
      OnClick = miSkd2Click
    end
    object miSkd6: TMenuItem
      Tag = 6
      Caption = '6%'
      OnClick = miSkd2Click
    end
    object miSkd7: TMenuItem
      Tag = 7
      Caption = '7%'
      OnClick = miSkd2Click
    end
    object miSkd10: TMenuItem
      Tag = 10
      Caption = '10%'
      OnClick = miSkd2Click
    end
    object miSkd15: TMenuItem
      Tag = 15
      Caption = '15%'
      OnClick = miSkd2Click
    end
    object miSkd20: TMenuItem
      Tag = 20
      Caption = '20%'
      OnClick = miSkd2Click
    end
    object miSkdSplit: TMenuItem
      Caption = '-'
    end
    object miSkdOther: TMenuItem
      Caption = #1044#1088#1091#1075#1086#1081' %...'
      OnClick = miSkdOtherClick
    end
  end
  object odLoad: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' bmp|*.bmp'
    Left = 479
    Top = 215
  end
  object tmWaitComm: TTimer
    Enabled = False
    OnTimer = tmWaitCommTimer
    Left = 195
    Top = 176
  end
  object tmrWaitMess: TTimer
    Interval = 60000
    OnTimer = tmrWaitMessTimer
    Left = 194
    Top = 230
  end
  object tmrUpdateVersion: TTimer
    Interval = 20000
    OnTimer = tmrUpdateVersionTimer
    Left = 194
    Top = 400
  end
  object HTTPRR: THTTPReqResp
    Agent = 'Borland SOAP 1.1'
    UseUTF8InHeader = False
    InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Left = 409
    Top = 216
  end
  object tmChekWorkTime: TTimer
    Interval = 1800000
    OnTimer = tmChekWorkTimeTimer
    Left = 194
    Top = 284
  end
  object tmWaterNakl: TTimer
    Interval = 30000
    OnTimer = tmWaterNaklTimer
    Left = 194
    Top = 454
  end
  object PlServer: TIdTCPServer
    Bindings = <>
    CommandHandlers = <
      item
        CmdDelimiter = ' '
        Command = 'OPEN'
        Disconnect = False
        Name = 'OpenChek'
        OnCommand = PlServerOpenChekCommand
        ParamDelimiter = ' '
        ReplyExceptionCode = 0
        ReplyNormal.NumericCode = 200
        ReplyNormal.Text.Strings = (
          'Good Bye')
        ReplyNormal.TextCode = '200'
        Tag = 0
      end>
    DefaultPort = 8082
    Greeting.NumericCode = 200
    Greeting.Text.Strings = (
      'Hello')
    Greeting.TextCode = '200'
    MaxConnectionReply.NumericCode = 0
    OnExecute = PlServerExecute
    ReplyExceptionCode = 500
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 400
    ReplyUnknownCommand.Text.Strings = (
      'Unknown Command')
    ReplyUnknownCommand.TextCode = '400'
    Left = 408
    Top = 268
  end
  object Pclient: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    Host = '192.168.0.190'
    Port = 8082
    Left = 478
    Top = 268
  end
  object tmPlay: TTimer
    Enabled = False
    Interval = 10
    OnTimer = tmPlayTimer
    Left = 193
    Top = 509
  end
  object tmStr: TTimer
    Interval = 4
    OnTimer = tmStrTimer
    Left = 193
    Top = 564
  end
  object tmAlarm: TTimer
    Interval = 3000
    OnTimer = tmAlarmTimer
    Left = 193
    Top = 344
  end
  object tmFlash: TTimer
    Enabled = False
    Interval = 800
    OnTimer = tmFlashTimer
    Left = 193
    Top = 621
  end
end
