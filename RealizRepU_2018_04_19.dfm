object RealizRepF: TRealizRepF
  Left = 463
  Top = 298
  Width = 892
  Height = 491
  Caption = 'RealizRepF'
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 832
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    884
    464)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 883
    Height = 31
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 0
    object Label2: TLabel
      Left = 277
      Top = 10
      Width = 123
      Height = 13
      Caption = #1057'                         '#1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 44
      Top = 7
      Width = 180
      Height = 18
      Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object btPer: TBitBtn
      Left = 499
      Top = 3
      Width = 108
      Height = 25
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      TabOrder = 0
      OnClick = btPerClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E000000010000000000009C3100000063
        0000CE63000000730000D6840000008C0000009C000063313100218C42002194
        420021944A00219C4A00FFAD4A0029A5520029AD520031AD520039B552004AB5
        520029B55A0031BD5A0039BD630039C6630031CE630042C66B0052C66B005AC6
        6B0042D66B0052D67B005ADE7B0073DE940000009C00FFCE9C00009CCE000000
        DE0000A5EF00FF00FF004242FF0000BDFF009CDEFF009CFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00232323232323
        2301232323232323232323232323232323062323232323232323232323232323
        23060A0123232323232323232323232323061201232323232323232323232323
        2306120123232323232323232323232323061201232323232323232323232323
        0D1A0D0D0123232323232323232323061A130E0D08012323232323232323191D
        1412120E0D0A01232323232323061D1B120503060D0B08012323232311050327
        252626201E080303232323230105252727222021211E08012323232323070101
        27251E2121211E232323232323070202251E241E212123232323232323071F0C
        04041E1E1E232323232323232323071F0707231E232323232323}
    end
    object dtEnd: TDateTimePicker
      Left = 405
      Top = 6
      Width = 91
      Height = 21
      Date = 39801.999988425930000000
      Time = 39801.999988425930000000
      TabOrder = 1
    end
    object dtStart: TDateTimePicker
      Left = 291
      Top = 6
      Width = 91
      Height = 21
      Date = 39801.000000000000000000
      Time = 39801.000000000000000000
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 331
    Height = 398
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      331
      398)
    object DBGrid1: TDBGrid
      Left = -1
      Top = -1
      Width = 332
      Height = 399
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 13557738
      DataSource = DM.srChekList
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'Date_Chek'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Numb_Chek'
          Title.Alignment = taCenter
          Title.Caption = #8470' '#1063#1077#1082#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Summa'
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Kassa_Num'
          Title.Alignment = taCenter
          Title.Caption = #1058#1080#1087' '#1086#1087#1083'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 60
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 333
    Top = 140
    Width = 550
    Height = 33
    Anchors = [akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 2
    object Label3: TLabel
      Left = 10
      Top = 10
      Width = 48
      Height = 13
      Caption = #1057#1082#1080#1076#1082#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 60
      Top = 10
      Width = 50
      Height = 13
      AutoSize = True
      DataField = 'SumSkd'
      DataSource = DM.srChekList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 175
      Top = 10
      Width = 50
      Height = 13
      AutoSize = True
      DataField = 'Kassir'
      DataSource = DM.srChekList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 125
      Top = 10
      Width = 48
      Height = 13
      Caption = #1050#1072#1089#1089#1080#1088':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 385
      Top = 10
      Width = 76
      Height = 13
      Caption = #8470' '#1050#1072#1088#1090#1086#1095#1082#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object DBText3: TDBText
      Left = 465
      Top = 10
      Width = 76
      Height = 13
      Alignment = taRightJustify
      DataField = 'NumCard'
      DataSource = DM.srChekList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
  end
  object Panel4: TPanel
    Left = 333
    Top = 175
    Width = 550
    Height = 256
    Anchors = [akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 3
    DesignSize = (
      550
      256)
    object dbgChekInfo: TDBGrid
      Left = -1
      Top = 0
      Width = 551
      Height = 255
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 14740452
      DataSource = DM.srShowChek
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'art_code'
          Title.Alignment = taCenter
          Title.Caption = #1040#1088#1090'_'#1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 58
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
          Width = 237
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kod_name'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 46
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
          Title.Font.Style = [fsBold]
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'skd'
          Title.Alignment = taCenter
          Title.Caption = '% '#1089#1082#1080#1076#1082#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 61
          Visible = True
        end>
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 433
    Width = 883
    Height = 31
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 4
    DesignSize = (
      883
      31)
    object Label10: TLabel
      Left = 180
      Top = 10
      Width = 3
      Height = 13
    end
    object Label13: TLabel
      Left = 480
      Top = 10
      Width = 103
      Height = 13
      Caption = #1057'                    '#1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BitBtn2: TBitBtn
      Left = 789
      Top = 3
      Width = 91
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
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
    object bbCopyChek: TBitBtn
      Left = 3
      Top = 3
      Width = 154
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100' '#1082#1086#1087#1080#1080' '#1095#1077#1082#1072
      TabOrder = 1
      OnClick = bbCopyChekClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E000000000000000000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF8000008000008000008000008000008000
        008000008000008000000000FF0000FF0000FF0000FF0000FF0000FF0000FF80
        80808080808080808080808080808080808080808080808080800000FF0000FF
        0000FF0000FF0000FF0000FF0000FF800000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF8000000000FF0000FF0000FF0000FF0000FF0000FF0000FF80
        8080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080800000FF0000FF
        0000FF0000FF0000FF0000FF0000FF800000FFFFFF0000000000000000000000
        00000000FFFFFF8000000000FF0000FF0000FF0000FF0000FF0000FF0000FF80
        8080FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF8080800000FF000000
        000000000000000000000000000000800000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF8000000000FF80808080808080808080808080808080808080
        8080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080800000FF000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000FFFFFF0000000000000000000000
        00000000FFFFFF8000000000FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
        8080FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF8080800000FF000000
        FFFFFF000000000000000000000000800000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF8000000000FF808080FFFFFF80808080808080808080808080
        8080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080800000FF000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000FFFFFF000000000000FFFFFF8000
        008000008000008000000000FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
        8080FFFFFFC0C0C0C0C0C0FFFFFF8080808080808080808080800000FF000000
        FFFFFF000000000000000000000000800000FFFFFFFFFFFFFFFFFFFFFFFF8000
        00FFFFFF8000000000FF0000FF808080FFFFFF80808080808080808080808080
        8080FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF8080800000FF0000FF000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000FFFFFFFFFFFFFFFFFFFFFFFF8000
        008000000000FF0000FF0000FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
        8080FFFFFFFFFFFFFFFFFFFFFFFF8080808080800000FF0000FF0000FF000000
        FFFFFF000000000000FFFFFF0000008000008000008000008000008000008000
        000000FF0000FF0000FF0000FF808080FFFFFF808080808080FFFFFF80808080
        80808080808080808080808080808080800000FF0000FF0000FF0000FF000000
        FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF0000000000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF808080FFFFFFFFFFFFFFFFFFFFFFFF808080FF
        FFFF8080800000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000
        FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF808080FFFFFFFFFFFFFFFFFFFFFFFF80808080
        80800000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000
        0000000000000000000000000000000000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF80808080808080808080808080808080808000
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
      NumGlyphs = 2
    end
    object bbEKKACheck: TBitBtn
      Left = 157
      Top = 3
      Width = 114
      Height = 25
      Caption = #1063#1077#1082' '#1087#1086' EKKA'
      TabOrder = 2
      Visible = False
      OnClick = bbEKKACheckClick
      Glyph.Data = {
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
    end
    object BitBtn1: TBitBtn
      Left = 705
      Top = 5
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 3
      Visible = False
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 271
      Top = 3
      Width = 100
      Height = 25
      Caption = #1050#1086#1087#1080#1103' '#1095#1077#1082#1072
      TabOrder = 4
      Visible = False
      OnClick = BitBtn3Click
      Glyph.Data = {
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
    end
    object BitBtn4: TBitBtn
      Tag = 1
      Left = 371
      Top = 3
      Width = 105
      Height = 25
      Caption = #1050#1086#1087#1080#1103' '#1083#1077#1085#1090#1099
      TabOrder = 5
      Visible = False
      OnClick = BitBtn4Click
      Glyph.Data = {
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
    end
    object edStart: TEdit
      Left = 492
      Top = 6
      Width = 71
      Height = 21
      TabOrder = 6
    end
    object edEnd: TEdit
      Left = 587
      Top = 5
      Width = 71
      Height = 21
      TabOrder = 7
    end
  end
  object pnSearch: TPanel
    Left = 333
    Top = 33
    Width = 550
    Height = 105
    Anchors = [akTop, akRight]
    BevelOuter = bvLowered
    Color = clSilver
    TabOrder = 5
    object Label5: TLabel
      Left = 5
      Top = 5
      Width = 103
      Height = 13
      Caption = #1050#1088#1080#1090#1077#1088#1080#1080' '#1087#1086#1080#1089#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 5
      Top = 28
      Width = 43
      Height = 13
      Caption = #8470' '#1063#1077#1082#1072':'
    end
    object Label7: TLabel
      Left = 5
      Top = 58
      Width = 79
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label8: TLabel
      Left = 135
      Top = 28
      Width = 49
      Height = 13
      Caption = #8470' '#1082#1072#1089#1089#1099':'
    end
    object Label9: TLabel
      Left = 268
      Top = 58
      Width = 40
      Height = 13
      Caption = #1050#1072#1089#1089#1080#1088':'
    end
    object Label12: TLabel
      Left = 268
      Top = 28
      Width = 64
      Height = 13
      Caption = #8470' '#1050#1072#1088#1090#1086#1095#1082#1080':'
    end
    object lbKur: TLabel
      Left = 174
      Top = 84
      Width = 30
      Height = 13
      Caption = 'lbKur'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object edNumb: TEdit
      Left = 52
      Top = 24
      Width = 71
      Height = 21
      TabOrder = 0
      OnKeyPress = edNumbKeyPress
    end
    object edNames: TEdit
      Left = 88
      Top = 54
      Width = 167
      Height = 21
      TabOrder = 1
    end
    object cbKassa: TComboBox
      Left = 189
      Top = 24
      Width = 66
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
    end
    object cbUsers: TComboBox
      Left = 315
      Top = 54
      Width = 226
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
    end
    object CheckBox1: TCheckBox
      Left = 410
      Top = 26
      Width = 136
      Height = 17
      Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 4
      OnClick = CheckBox1Click
    end
    object edNumC: TEdit
      Left = 339
      Top = 24
      Width = 62
      Height = 21
      TabOrder = 5
      OnKeyPress = edNumbKeyPress
    end
    object CheckBox2: TCheckBox
      Left = 5
      Top = 82
      Width = 131
      Height = 17
      Caption = #1050#1091#1088#1100#1077#1088#1089#1082#1072#1103' '#1076#1086#1089#1090#1072#1074#1082#1072
      TabOrder = 6
    end
  end
end