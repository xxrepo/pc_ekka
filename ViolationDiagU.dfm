object ViolationDiagF: TViolationDiagF
  Left = 591
  Top = 278
  BorderStyle = bsDialog
  Caption = 'ViolationDiagF'
  ClientHeight = 448
  ClientWidth = 879
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
  OnDestroy = FormDestroy
  DesignSize = (
    879
    448)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 879
    Height = 36
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    object Label1: TLabel
      Left = 277
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
      Left = 381
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
      Left = 497
      Top = 10
      Width = 36
      Height = 13
      Caption = #1052#1077#1089#1103#1094':'
    end
    object CheckBox1: TCheckBox
      Left = 5
      Top = 10
      Width = 261
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1085#1077#1086#1090#1074#1077#1095#1077#1085#1085#1099#1077' '#1079#1072#1084#1077#1095#1072#1085#1080#1103
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object dtStart: TDateTimePicker
      Left = 290
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
      TabOrder = 1
      OnCloseUp = CheckBox1Click
    end
    object dtEnd: TDateTimePicker
      Left = 401
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
      TabOrder = 2
      OnCloseUp = CheckBox1Click
    end
    object ComboBox2: TComboBox
      Left = 538
      Top = 7
      Width = 103
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
      TabOrder = 3
      OnChange = ComboBox2Change
      OnCloseUp = CheckBox1Click
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 38
    Width = 879
    Height = 343
    Anchors = [akLeft, akTop, akRight]
    DataSource = DM.srViolationList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = bbViewClick
    Columns = <
      item
        Expanded = False
        FieldName = 'dt'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ComentDescr'
        Title.Alignment = taCenter
        Title.Caption = #1047#1072#1084#1077#1095#1072#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 342
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'apteka'
        Title.Alignment = taCenter
        Title.Caption = #1040#1087#1090#1077#1082#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 224
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DoneDescr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 157
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 383
    Width = 879
    Height = 65
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      879
      65)
    object Label3: TLabel
      Left = 5
      Top = 8
      Width = 73
      Height = 13
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    end
    object BitBtn2: TBitBtn
      Left = 177
      Top = 33
      Width = 116
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
    object bbView: TBitBtn
      Left = 5
      Top = 33
      Width = 172
      Height = 25
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1079#1072#1084#1077#1095#1072#1085#1080#1077'...'
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
    object RadioButton1: TRadioButton
      Left = 580
      Top = 38
      Width = 86
      Height = 17
      Caption = #1057#1086#1075#1083#1072#1089#1086#1074#1072#1090#1100
      TabOrder = 2
    end
    object RadioButton2: TRadioButton
      Left = 670
      Top = 38
      Width = 101
      Height = 17
      Caption = #1053#1077#1089#1086#1075#1083#1072#1089#1086#1074#1072#1090#1100
      TabOrder = 3
    end
    object BitBtn1: TBitBtn
      Left = 781
      Top = 33
      Width = 93
      Height = 25
      Caption = #1054#1090#1074#1077#1090#1080#1090#1100
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object Edit1: TEdit
      Left = 80
      Top = 5
      Width = 794
      Height = 21
      MaxLength = 240
      TabOrder = 5
    end
  end
end
