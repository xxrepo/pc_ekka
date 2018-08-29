object AETabF: TAETabF
  Left = 921
  Top = 280
  BorderStyle = bsToolWindow
  Caption = 'AETabF'
  ClientHeight = 251
  ClientWidth = 692
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
    692
    251)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 5
    Top = 230
    Width = 78
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 5
    Top = 205
    Width = 41
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1050#1072#1089#1089#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 1
    Top = 5
    Width = 584
    Height = 191
    Caption = ' '#1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1096#1072#1073#1083#1086#1085#1099' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    Visible = False
    DesignSize = (
      584
      191)
    object DBText1: TDBText
      Left = 5
      Top = 171
      Width = 50
      Height = 13
      AutoSize = True
      DataField = 'worktime_position_description'
      DataSource = DM.srWorkPos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 4
      Top = 15
      Width = 576
      Height = 151
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DM.srWorkPos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'SDay'
          Title.Alignment = taCenter
          Title.Caption = #1044#1077#1085#1100' '#1085#1077#1076#1077#1083#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'time_beg'
          Title.Alignment = taCenter
          Title.Caption = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'time_end'
          Title.Alignment = taCenter
          Title.Caption = #1042#1088#1077#1084#1103' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'worktime_position_name'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 222
          Visible = True
        end>
    end
  end
  object edDescr: TEdit
    Left = 440
    Top = 223
    Width = 121
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 10
    Text = 'edDescr'
    Visible = False
  end
  object RadioButton1: TRadioButton
    Left = 591
    Top = 25
    Width = 100
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1055#1077#1088#1074#1072#1103' '#1089#1084#1077#1085#1072
    TabOrder = 0
    Visible = False
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 591
    Top = 45
    Width = 100
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1042#1090#1086#1088#1072#1103' '#1089#1084#1077#1085#1072
    TabOrder = 1
    Visible = False
    OnClick = RadioButton2Click
  end
  object RadioButton3: TRadioButton
    Left = 591
    Top = 65
    Width = 100
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1053#1086#1095#1085#1072#1103' '#1089#1084#1077#1085#1072
    TabOrder = 2
    Visible = False
    OnClick = RadioButton3Click
  end
  object BitBtn1: TBitBtn
    Left = 515
    Top = 223
    Width = 83
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    TabOrder = 3
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
    Left = 608
    Top = 223
    Width = 83
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
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
  object RadioButton4: TRadioButton
    Tag = 1
    Left = 591
    Top = 85
    Width = 84
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1042#1099#1093#1086#1076#1085#1086#1081
    TabOrder = 5
    OnClick = RadioButton4Click
  end
  object cbKassa: TComboBox
    Left = 52
    Top = 201
    Width = 71
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akBottom]
    ItemHeight = 13
    TabOrder = 6
  end
  object RadioButton5: TRadioButton
    Left = 591
    Top = 5
    Width = 100
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1062#1077#1083#1099#1081' '#1076#1077#1085#1100
    TabOrder = 7
    Visible = False
    OnClick = RadioButton5Click
  end
  object RadioButton6: TRadioButton
    Tag = 1
    Left = 591
    Top = 145
    Width = 90
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 8
    OnClick = RadioButton6Click
  end
  object RadioButton7: TRadioButton
    Tag = 1
    Left = 591
    Top = 105
    Width = 84
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1087#1091#1089#1082
    TabOrder = 9
    OnClick = RadioButton7Click
  end
  object RadioButton8: TRadioButton
    Tag = 1
    Left = 591
    Top = 125
    Width = 84
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1041#1086#1083#1100#1085#1080#1095#1085#1099#1081
    TabOrder = 11
    OnClick = RadioButton8Click
  end
  object cbDescr: TComboBox
    Left = 90
    Top = 226
    Width = 151
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akBottom]
    ItemHeight = 13
    TabOrder = 12
    OnChange = cbDescrChange
    Items.Strings = (
      ' '
      #1058#1086#1074#1072#1088
      #1058#1088#1077#1085#1080#1085#1075
      #1057#1077#1089#1089#1080#1103
      #1059#1074#1086#1083#1077#1085
      #1055#1077#1088#1077#1074#1077#1076#1077#1085
      #1053#1077#1074#1099#1093#1086#1076
      #1055#1077#1088#1077#1091#1095#1077#1090
      #1044#1086#1087'. '#1095#1077#1083'.'
      #1054#1090#1082#1088'. '#1072#1087#1090'.')
  end
  object GroupBox2: TGroupBox
    Left = 73
    Top = 20
    Width = 205
    Height = 121
    Caption = ' '#1042#1088#1077#1084#1103' '#1089#1084#1077#1085#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    Visible = False
    object Label5: TLabel
      Left = 27
      Top = 76
      Width = 100
      Height = 13
      Caption = #1063#1072#1089#1099' '#1079#1072#1074#1077#1076#1086#1074#1072#1085#1080#1103':'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 97
      Top = 38
      Width = 7
      Height = 20
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edStart: TEdit
      Left = 27
      Top = 36
      Width = 36
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = '8'
      OnKeyDown = edStartKeyDown
      OnKeyPress = edStartKeyPress
    end
    object edStMin: TEdit
      Left = 67
      Top = 26
      Width = 26
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '00'
      OnKeyPress = edStartKeyPress
    end
    object edEnd: TEdit
      Left = 109
      Top = 36
      Width = 36
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Text = '20'
      OnKeyDown = edEndKeyDown
      OnKeyPress = edStartKeyPress
    end
    object edEndMin: TEdit
      Left = 149
      Top = 26
      Width = 26
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '00'
      OnKeyPress = edStartKeyPress
    end
    object Edit1: TEdit
      Left = 129
      Top = 73
      Width = 49
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '0'
      OnKeyPress = Edit1KeyPress
    end
  end
  object RadioButton9: TRadioButton
    Tag = 1
    Left = 591
    Top = 165
    Width = 90
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1057#1084#1077#1085#1072
    TabOrder = 15
    Visible = False
    OnClick = RadioButton9Click
  end
end
