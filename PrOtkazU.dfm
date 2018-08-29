object PrOtkazF: TPrOtkazF
  Left = 652
  Top = 316
  BorderStyle = bsToolWindow
  Caption = 'PrOtkazF'
  ClientHeight = 466
  ClientWidth = 568
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
    568
    466)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 1
    Width = 566
    Height = 433
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 0
    object Bevel1: TBevel
      Left = 9
      Top = 123
      Width = 549
      Height = 78
    end
    object Label1: TLabel
      Left = 164
      Top = 58
      Width = 107
      Height = 13
      Caption = #1062#1077#1085#1072' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbName: TLabel
      Left = 5
      Top = 210
      Width = 154
      Height = 13
      Caption = #1055#1088#1086#1080#1079#1074#1086#1083#1100#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object lbSr: TLabel
      Left = 5
      Top = 398
      Width = 23
      Height = 13
      Caption = 'lbSr'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 5
      Top = 413
      Width = 548
      Height = 13
      Caption = 
        #1044#1083#1103' '#1074#1099#1073#1086#1088#1072' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103' '#1080#1079' '#1087#1088#1072#1081#1089'-'#1083#1080#1089#1090#1072', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1087#1088#1086#1080#1079#1074#1077#1089#1090#1080' '#1076#1074 +
        #1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1077#1082' '#1083#1077#1074#1086#1081' '#1082#1085#1086#1087#1082#1086#1081' '#1084#1099#1096#1080'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 220
      Top = 157
      Width = 137
      Height = 16
      Caption = #1058#1077#1083#1077#1092#1086#1085' '#1082#1083#1080#1077#1085#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label5: TLabel
      Left = 12
      Top = 128
      Width = 541
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = #1055#1088#1077#1074#1088#1072#1090#1080' '#1086#1090#1082#1072#1079' '#1074' '#1079#1072#1082#1072#1079' '#1082#1083#1080#1077#1085#1090#1072' '#1080' '#1079#1072#1088#1072#1073#1086#1090#1072#1081' 2%'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 94
      Top = 180
      Width = 379
      Height = 20
      Caption = #1047#1072#1082#1072#1079' '#1076#1083#1103' '#1084#1077#1076#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1077#1081' '#1047#1040#1055#1056#1045#1065#1045#1053'!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object rb1: TRadioButton
      Left = 14
      Top = 21
      Width = 177
      Height = 17
      Caption = #1054#1090#1082#1072#1079' '#1087#1086' '#1085#1072#1083#1080#1095#1080#1102
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = rb1Click
    end
    object rb2: TRadioButton
      Left = 14
      Top = 56
      Width = 142
      Height = 17
      Caption = #1054#1090#1082#1072#1079' '#1087#1086' '#1094#1077#1085#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = rb1Click
    end
    object Edit1: TEdit
      Left = 275
      Top = 55
      Width = 66
      Height = 21
      TabOrder = 2
      Visible = False
      OnKeyPress = Edit1KeyPress
    end
    object rb3: TRadioButton
      Left = 399
      Top = 54
      Width = 163
      Height = 17
      Caption = #1057#1088#1086#1095#1085#1072#1103' '#1079#1072#1103#1074#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = rb1Click
    end
    object edName: TEdit
      Left = 165
      Top = 207
      Width = 394
      Height = 21
      TabOrder = 5
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 228
      Width = 554
      Height = 166
      Caption = ' '#1055#1088#1072#1081#1089'-'#1083#1080#1089#1090' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      DesignSize = (
        554
        166)
      object DBGrid1: TDBGrid
        Left = 5
        Top = 15
        Width = 544
        Height = 146
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DM.dsPList
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
        OnExit = DBGrid1Exit
        OnKeyDown = DBGrid1KeyDown
        OnKeyPress = DBGrid1KeyPress
        Columns = <
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
            Width = 511
            Visible = True
          end>
      end
    end
    object rb4: TRadioButton
      Left = 400
      Top = 21
      Width = 152
      Height = 17
      Caption = #1054#1087#1090#1086#1074#1099#1081' '#1086#1090#1082#1072#1079
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Visible = False
      OnClick = rb1Click
    end
    object Panel2: TPanel
      Left = 9
      Top = 80
      Width = 549
      Height = 40
      TabOrder = 7
      Visible = False
      object Label3: TLabel
        Left = 10
        Top = 13
        Width = 56
        Height = 13
        Caption = #1050#1086#1085#1082#1091#1088#1077#1085#1090':'
      end
      object Label4: TLabel
        Left = 260
        Top = 12
        Width = 98
        Height = 16
        Caption = #1062#1077#1085#1072' '#1072#1087#1090#1077#1082#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ComboBox1: TComboBox
        Left = 70
        Top = 10
        Width = 176
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          #1040#1087#1090#1077#1082#1072' '#1085#1080#1079#1082#1080#1093' '#1094#1077#1085
          #1040#1087#1090#1077#1082#1072' '#1047#1076#1086#1088#1086#1074#1100#1103
          #1040#1087#1090#1077#1082#1072' '#1076#1086#1073#1088#1086#1075#1086' '#1076#1085#1103
          #1054#1054#1054' '#1051#1077#1076#1072
          #1040#1087#1090#1077#1082#1072' '#1041#1072#1078#1072#1077#1084#1086' '#1079#1076#1086#1088#1086#1074#1100#1103)
      end
    end
    object edPhone: TEdit
      Left = 362
      Top = 155
      Width = 184
      Height = 21
      BevelKind = bkFlat
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 8
      Text = '+38 (___) ___-__-__'
      Visible = False
      OnEnter = edPhoneEnter
      OnKeyDown = edPhoneKeyDown
      OnKeyPress = edPhoneKeyPress
      OnKeyUp = edPhoneKeyUp
    end
    object rb5: TRadioButton
      Left = 18
      Top = 157
      Width = 188
      Height = 17
      Caption = #1047#1072#1082#1072#1079' '#1087#1086#1076' '#1082#1083#1080#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = rb1Click
    end
  end
  object BitBtn1: TBitBtn
    Left = 169
    Top = 439
    Width = 112
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1050
    Default = True
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000D40E0000D40E00001000000010000000255B25002966
      29002D712D00327E3200368836003B943B0041A5410048B6480054BC54005FC1
      5F0071C771000000FF008ED38E00A4DCA400B2E1B200D1EED100BBB64BBBBBB4
      4BBBBBB614BBBB424BBBBBB6304BB6534BBBBBB7D52137A44BBBBBB7FE63ACC2
      6BBBBBB7FFFFEEA36BBBBBB7DDFFFE404BBBBB55EEEFFFA204BBB5AEEEEEFFEA
      310B9EFFFFEEFFFFC5548889AAFEE669A88BBBBBB7FEE2BBBBBBBBBBBAFF94BB
      BBBBBBBBBACE54BBBBBBBBBBBBAC26BBBBBBBBBBBB977BBBBBBB}
  end
  object BitBtn2: TBitBtn
    Left = 286
    Top = 439
    Width = 112
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
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
