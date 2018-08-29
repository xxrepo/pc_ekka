object JPaySlipF1: TJPaySlipF1
  Left = 662
  Top = 285
  BorderStyle = bsDialog
  Caption = 'JPaySlipF1'
  ClientHeight = 255
  ClientWidth = 313
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
    313
    255)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 60
    Top = 6
    Width = 184
    Height = 16
    Caption = #1057#1087#1080#1089#1086#1082' '#1073#1086#1085#1091#1089#1085#1099#1093' '#1083#1080#1089#1090#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 6
    Top = 33
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
  object Label8: TLabel
    Left = 12
    Top = 58
    Width = 33
    Height = 13
    Caption = #1052#1077#1089#1103#1094
  end
  object Panel1: TPanel
    Left = 2
    Top = 80
    Width = 309
    Height = 142
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    DesignSize = (
      309
      142)
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 307
      Height = 140
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DM.srJPaySlip1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
          FieldName = #1040#1087#1090#1077#1082#1072
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 172
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt'
          Title.Alignment = taCenter
          Title.Caption = #1055#1077#1088#1080#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 98
          Visible = True
        end>
    end
  end
  object dtStart: TDateTimePicker
    Left = 20
    Top = 30
    Width = 91
    Height = 21
    Date = 39801.000000000000000000
    Time = 39801.000000000000000000
    TabOrder = 1
  end
  object dtEnd: TDateTimePicker
    Left = 139
    Top = 30
    Width = 91
    Height = 21
    Date = 39801.999988425920000000
    Time = 39801.999988425920000000
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 233
    Top = 28
    Width = 75
    Height = 25
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn4: TBitBtn
    Left = 184
    Top = 226
    Width = 118
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 4
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
  object BitBtn2: TBitBtn
    Left = 11
    Top = 226
    Width = 118
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088
    TabOrder = 5
    OnClick = BitBtn2Click
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
  object ComboBox2: TComboBox
    Left = 53
    Top = 55
    Width = 169
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
    TabOrder = 6
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
end
