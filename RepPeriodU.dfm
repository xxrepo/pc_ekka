object RepPeriodF: TRepPeriodF
  Left = 1205
  Top = 290
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'RepPeriodF'
  ClientHeight = 149
  ClientWidth = 348
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
    348
    149)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 121
    Top = 123
    Width = 106
    Height = 25
    Anchors = [akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 0
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
  object Panel2: TPanel
    Left = 1
    Top = 0
    Width = 345
    Height = 120
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      345
      120)
    object Label1: TLabel
      Left = 7
      Top = 10
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
      Left = 111
      Top = 10
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
      Left = 7
      Top = 37
      Width = 33
      Height = 13
      Caption = #1052#1077#1089#1103#1094
    end
    object dtStart: TDateTimePicker
      Left = 20
      Top = 6
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
      Left = 131
      Top = 6
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
    object bbCHP: TBitBtn
      Left = 221
      Top = 4
      Width = 120
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1063#1055'...'
      TabOrder = 2
      OnClick = bbCHPClick
    end
    object ComboBox2: TComboBox
      Left = 48
      Top = 34
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
      TabOrder = 3
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
    object bbTovRep: TBitBtn
      Left = 221
      Top = 32
      Width = 120
      Height = 25
      Caption = #1058#1086#1074#1072#1088#1085#1099#1081' '#1086#1090#1095#1077#1090'...'
      TabOrder = 4
      OnClick = bbTovRepClick
    end
    object bbRepApt: TBitBtn
      Tag = 1
      Left = 5
      Top = 60
      Width = 176
      Height = 25
      Caption = #1058#1086#1074#1072#1088#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1040#1087#1090#1077#1082#1072'...'
      TabOrder = 5
      OnClick = bbTovRepClick
    end
    object bbRepCHP: TBitBtn
      Tag = 2
      Left = 184
      Top = 60
      Width = 157
      Height = 25
      Caption = #1058#1086#1074#1072#1088#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1063#1055'...'
      TabOrder = 6
      OnClick = bbTovRepClick
    end
    object bbRep99: TBitBtn
      Left = 5
      Top = 88
      Width = 176
      Height = 25
      Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1082#1072#1088#1090#1086#1095#1082#1072#1084' 99'
      TabOrder = 7
      OnClick = bbRep99Click
    end
    object BitBtn2: TBitBtn
      Left = 184
      Top = 88
      Width = 157
      Height = 25
      Caption = #1053#1077#1087#1088#1086#1076#1072#1074#1072#1077#1084#1099#1081' '#1090#1086#1074#1072#1088'...'
      TabOrder = 8
      OnClick = BitBtn2Click
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = #1060#1072#1081#1083' Excel|*.xls'
    Left = 266
    Top = 100
  end
end
