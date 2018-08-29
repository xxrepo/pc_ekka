object ViewLTF: TViewLTF
  Left = 1136
  Top = 516
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ViewLTF'
  ClientHeight = 331
  ClientWidth = 347
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
    347
    331)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 0
    Width = 345
    Height = 53
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      345
      53)
    object Label2: TLabel
      Left = 5
      Top = 29
      Width = 127
      Height = 13
      Caption = #1057'                          '#1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 5
      Top = 5
      Width = 212
      Height = 13
      Caption = #1055#1077#1088#1080#1086#1076' '#1087#1088#1086#1089#1084#1086#1090#1088#1072' '#1083#1080#1096#1077#1085#1075#1086' '#1090#1086#1074#1072#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dtStart: TDateTimePicker
      Left = 19
      Top = 25
      Width = 91
      Height = 21
      Date = 39801.731579675930000000
      Time = 39801.731579675930000000
      TabOrder = 0
    end
    object dtEnd: TDateTimePicker
      Left = 138
      Top = 25
      Width = 91
      Height = 21
      Date = 39801.731579675930000000
      Time = 39801.731579675930000000
      TabOrder = 1
    end
    object BitBtn5: TBitBtn
      Left = 234
      Top = 24
      Width = 104
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      TabOrder = 2
      OnClick = BitBtn5Click
    end
  end
  object Panel2: TPanel
    Left = 1
    Top = 56
    Width = 345
    Height = 241
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      345
      241)
    object DBGrid1: TDBGrid
      Left = -1
      Top = -1
      Width = 346
      Height = 242
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DM.srLT
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NN_NAKL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #8470' '#1057#1087#1080#1089#1082#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 125
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATE_NAKL'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 109
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUMMA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 77
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 299
    Width = 348
    Height = 31
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      348
      31)
    object BitBtn4: TBitBtn
      Left = 239
      Top = 3
      Width = 106
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = BitBtn4Click
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
    object bbView: TBitBtn
      Left = 4
      Top = 3
      Width = 117
      Height = 25
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088'...'
      TabOrder = 1
      OnClick = bbViewClick
      Glyph.Data = {
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
    end
  end
end
