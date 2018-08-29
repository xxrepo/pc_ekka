object OtkazF: TOtkazF
  Left = 511
  Top = 231
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'OtkazF'
  ClientHeight = 426
  ClientWidth = 999
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
    999
    426)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 1
    Top = 394
    Width = 997
    Height = 31
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      997
      31)
    object Label4: TLabel
      Left = 5
      Top = 9
      Width = 87
      Height = 13
      Caption = #1044#1072#1090#1072' '#1086#1090#1082#1072#1079#1086#1074':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dtOtkaz: TDateTimePicker
      Left = 93
      Top = 5
      Width = 91
      Height = 21
      Date = 39801.731579675930000000
      Time = 39801.731579675930000000
      TabOrder = 0
      OnChange = dtOtkazChange
    end
    object BitBtn3: TBitBtn
      Left = 186
      Top = 3
      Width = 75
      Height = 25
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      TabOrder = 1
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 261
      Top = 3
      Width = 115
      Height = 25
      Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1077' '#1086#1090#1082#1072#1079#1099
      TabOrder = 2
      OnClick = BitBtn4Click
    end
    object BitBtn2: TBitBtn
      Left = 852
      Top = 3
      Width = 142
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 3
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
    object BitBtn1: TBitBtn
      Left = 376
      Top = 3
      Width = 138
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100' '#1086#1090#1082#1072#1079#1086#1074
      TabOrder = 4
      OnClick = BitBtn1Click
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E000000000000000000000000FF0000FF
        0000FF0000FF0000FF8F8F8F7F7F7F7F7F7F7F7F7F7F7F7F0000FF0000FF0000
        FF0000FF0000FF0000FF7B7B7B7B7B7B7B7B7B7B7B7B7B7B7BBEBEBEAEAEAEAE
        AEAEAEAEAEAEAEAE7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B0000FF0000FF
        0000FF8F8F8F6060604F4F4F505050605F5F8F80806060606060607F7F7F0000
        FF0000FF0000FF0000FF7B7B7B7B7B7B7B7B7BBEBEBE8F8F8F7E7E7E7F7F7F8E
        8E8EB0B0B08F8F8F8F8F8FAEAEAE7B7B7B7B7B7B7B7B7B7B7B7B0000FF8F8F8F
        606060A0A0A0F0F0F0B0B0B09F8F8FA08080B0B0B0E0E0E0BFBFBF6F6F6F6060
        600000FF0000FF0000FF7B7B7BBEBEBE8F8F8FCFCFCFFFFFFFDFDFDFBFBFBFB2
        B2B2DFDFDFFFFFFFEEEEEE9E9E9E8F8F8F7B7B7B7B7B7B7B7B7B8F8F8F9F9F9F
        EFEFEFF0F0F0EFEFEFAFAFAF9090905F5F5F6F6F6F8F8F8FBFBFBFEFEFEFB0B0
        B08080800000FF0000FFBEBEBECECECEFFFFFFFFFFFFFFFFFFDEDEDEBFBFBF8E
        8E8E9E9E9EBEBEBEEEEEEEFFFFFFDFDFDFAFAFAF7B7B7B7B7B7BD0D0D0FFFFFF
        F0F0F0DFDFDF9090907F7F7F909090B0B0B0A0A0A09090908F8F8F8F8F8F6F6F
        6F8F8F8F0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFAEAEAEBFBFBFDF
        DFDFCFCFCFBFBFBFBEBEBEBEBEBE9E9E9EBEBEBE7B7B7B7B7B7BBFBFBFDFDFDF
        A0A0A09F9F9FCFCFCFAFAFAF8F8F8F8080808080809F9F9FBFBFBF7FAF8F6060
        608F8F8F0000FF0000FFEEEEEEFFFFFFCFCFCFCECECEFFFFFFDEDEDEBEBEBEAF
        AFAFAFAFAFCECECEEEEEEECFCFCF8F8F8FBEBEBE7B7B7B7B7B7B707070A0A0A0
        DFDFDFDFDFDFDFDFDFDFDFDFE0E0E0CFCFCFBFBFBF9F9F9F8F8F8F6080705F5F
        5F8F8F8F0000FF0000FF9F9F9FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFEEEEEECECECEBEBEBEA6A6A68E8E8EBEBEBE7B7B7B7B7B7B9F9F9FE0E0E0
        DFDFDFD0D0D0CFCFCFD0D0D0CFCFCFC0C0C0C0C0C0CFCFCFD0D0D0CFCFCF7070
        708F8F8F0000FF0000FFCECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF
        EFEFEFEFEFFFFFFFFFFFFFFFFFFF9F9F9FBEBEBE7B7B7B7B7B7BAFAFAFD0D0D0
        C0C0C0AFAFAFA0A0A0CFCFCFF0F0F0EFEFEFEFEFEFDFDFDFBFBFBFBFBFBF8F8F
        8F0000FF0000FF0000FFDEDEDEFFFFFFEFEFEFDEDEDECFCFCFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFEEEEEEEEEEEEBEBEBE7B7B7B7B7B7B7B7B7B0000FFAFAFAF
        CFCFCFEFEFEFB0B0B0BFBFBFAFAFAFB0B0B0BFBFBFBFBFBFB0B0B08F8F8F0000
        FF0000FF0000FF0000FF7B7B7BDEDEDEFFFFFFFFFFFFDFDFDFEEEEEEDEDEDEDF
        DFDFEEEEEEEEEEEEDFDFDFBEBEBE7B7B7B7B7B7B7B7B7B7B7B7B0000FF0000FF
        C0BFBFFFD0C0FFD0C0FFD0CFEFDFD0E0E0DFE0E0E08F8F8F0000FF0000FF0000
        FF0000FF0000FF0000FF7B7B7B7B7B7BEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFBEBEBE7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B0000FF0000FF
        DFCFC0FFDFBFFFDFBFFFDFBFFFD0B0FFD0AF806F6F0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF7B7B7B7B7B7BFBFBFBFFFFFFFFFFFFFFFFFFFAFAFAFA
        FAFA9F9F9F7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B0000FF0000FF
        D0B0A0FFE0CFFFE0CFFFE0CFFFE0CFFFDFC07F6F6F0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF7B7B7B7B7B7BDDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF9F9F9F7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B0000FF0000FF
        DFC0B0FFEFDFFFEFDFFFEFDFFFEFDFDFC0B0A0A0A00000FF0000FF0000FF0000
        FF0000FF0000FF0000FF7B7B7B7B7B7BEDEDEDFFFFFFFFFFFFFFFFFFFFFFFFED
        EDEDCFCFCF7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B0000FFD0C0BF
        FFF0EFFFF0EFFFF0EFFFF0EFFFF0EFAFA09F0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF7B7B7BF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0
        D0D07B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B0000FFDFC0C0
        FFF0F0E0DFD0E0DFD0E0DFD0A0A0A00000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF7B7B7BF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFCFCFCF7B
        7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B}
      NumGlyphs = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 998
    Height = 391
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      998
      391)
    object Label1: TLabel
      Left = 5
      Top = 373
      Width = 397
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 
        #1063#1090#1086#1073#1099' '#1091#1076#1072#1083#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102' '#1080#1079' '#1086#1090#1082#1072#1079#1086#1074', '#1074#1074#1077#1076#1080#1090#1077' '#1085#1091#1083#1077#1074#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1087#1086#1083#1103' ' +
        '"'#1050#1086#1083'-'#1074#1086'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 814
      Top = 371
      Width = 43
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = #1060#1080#1083#1100#1090#1088':'
    end
    object Label3: TLabel
      Left = 426
      Top = 372
      Width = 73
      Height = 13
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    end
    object DBGrid1: TDBGrid
      Left = -1
      Top = -1
      Width = 999
      Height = 367
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 15659767
      DataSource = DM.srOtkaz
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'Date_Otkaz'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1086#1090#1082'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 149
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Names'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 372
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Realiz'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Otkaz'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clMaroon
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
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'users'
          Title.Alignment = taCenter
          Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 242
          Visible = True
        end>
    end
    object cbPriznak: TComboBox
      Left = 860
      Top = 368
      Width = 136
      Height = 21
      Style = csDropDownList
      Anchors = [akRight, akBottom]
      ItemHeight = 13
      TabOrder = 1
      OnCloseUp = cbPriznakCloseUp
      Items.Strings = (
        #1055#1086' '#1085#1072#1083#1080#1095#1080#1102
        #1055#1086' '#1094#1077#1085#1077
        #1057#1088#1086#1095#1085#1072#1103' '#1079#1072#1103#1074#1082#1072)
    end
    object cbUsers: TComboBox
      Left = 505
      Top = 368
      Width = 291
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnCloseUp = cbUsersCloseUp
    end
  end
end
