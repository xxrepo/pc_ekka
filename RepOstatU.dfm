object RepOstatF: TRepOstatF
  Left = 729
  Top = 499
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'RepOstatF'
  ClientHeight = 164
  ClientWidth = 364
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
    364
    164)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 1
    Width = 362
    Height = 133
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 55
      Width = 71
      Height = 13
      Caption = #1057'           '#1087#1086' '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 15
      Top = 83
      Width = 40
      Height = 13
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object rb1: TRadioButton
      Left = 15
      Top = 10
      Width = 186
      Height = 17
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1083#1085#1099#1081' '#1089#1087#1080#1089#1086#1082
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = rb2Click
    end
    object rb2: TRadioButton
      Left = 15
      Top = 30
      Width = 211
      Height = 17
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1074#1099#1073#1086#1088#1086#1095#1085#1099#1081' '#1089#1087#1080#1089#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = rb2Click
    end
    object Edit1: TEdit
      Left = 47
      Top = 52
      Width = 29
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = #1040
    end
    object Edit2: TEdit
      Left = 107
      Top = 52
      Width = 29
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = #1071
    end
    object BitBtn2: TBitBtn
      Left = 240
      Top = 76
      Width = 116
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100' '#1086#1089#1090#1072#1090#1082#1086#1074'...'
      TabOrder = 4
      OnClick = BitBtn2Click
    end
    object cbSrok: TCheckBox
      Left = 240
      Top = 10
      Width = 116
      Height = 17
      Caption = #1058#1086#1083#1100#1082#1086' '#1089#1088#1086#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object cbOst: TCheckBox
      Left = 240
      Top = 30
      Width = 116
      Height = 17
      Caption = #1058#1086#1074#1072#1088' '#1085#1072' '#1086#1089#1090#1072#1090#1082#1072#1093
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object edFiltr: TEdit
      Left = 60
      Top = 79
      Width = 156
      Height = 21
      TabOrder = 7
    end
    object cbBU: TCheckBox
      Left = 240
      Top = 50
      Width = 116
      Height = 17
      Caption = #1041#1077#1079' '#1091#1087#1072#1082#1086#1074#1086#1082
      TabOrder = 8
    end
    object BitBtn3: TBitBtn
      Left = 5
      Top = 104
      Width = 186
      Height = 25
      Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103' '#1076#1077#1087#1072#1088#1090#1072#1084#1077#1085#1090#1072'...'
      TabOrder = 9
      OnClick = BitBtn3Click
    end
    object CheckBox1: TCheckBox
      Left = 195
      Top = 108
      Width = 61
      Height = 17
      Caption = #1042' Excel'
      TabOrder = 10
    end
  end
  object BitBtn1: TBitBtn
    Left = 129
    Top = 138
    Width = 106
    Height = 25
    Anchors = [akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
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
  object pmPrnReg: TPopupMenu
    Left = 166
    Top = 30
    object N1: TMenuItem
      Tag = 1
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1072#1083#1092#1072#1074#1080#1090#1091'...'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Tag = 2
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1085#1086#1084#1077#1088#1072#1084' '#1087#1086#1083#1086#1082'...'
      OnClick = N1Click
    end
  end
end
