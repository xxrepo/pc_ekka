object Fadd_counter: TFadd_counter
  Left = 355
  Top = 295
  Width = 381
  Height = 240
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1089#1095#1105#1090#1095#1080#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 12
    Width = 67
    Height = 13
    Caption = #1058#1080#1087' '#1089#1095#1105#1090#1095#1080#1082#1072
  end
  object Label2: TLabel
    Left = 10
    Top = 117
    Width = 50
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 10
    Top = 68
    Width = 34
    Height = 13
    Caption = #1053#1086#1084#1077#1088
  end
  object CB_counter_type: TComboBox
    Left = 10
    Top = 36
    Width = 155
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = #1069#1083#1077#1082#1090#1088#1080#1095#1077#1089#1090#1074#1086
    Items.Strings = (
      #1069#1083#1077#1082#1090#1088#1080#1095#1077#1089#1090#1074#1086
      #1061#1086#1083#1086#1076#1085#1072#1103' '#1074#1086#1076#1072
      #1043#1086#1088#1103#1095#1072#1103' '#1074#1086#1076#1072)
  end
  object ed_descr: TEdit
    Left = 10
    Top = 137
    Width = 345
    Height = 21
    TabOrder = 1
  end
  object btn_OK: TBitBtn
    Left = 12
    Top = 170
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 3
    OnClick = btn_OKClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000D40E0000D40E000010000000000000003291380034B4
      390053B5550077A87A004CD64C0062D6650073D275007CE681009EB79E00B1BD
      B100B5C6B500C6C6C6008CF7940094F79C00ADFFAD00B5FFB500BBBBBBB9BBBB
      BBBBBBBBBB0039BBBBBBBBBBB00128BBBBBBBBB9314123BBBBBBBB99055440AB
      BBBBB9902755513BBBBBA817D6106729BBBBB37C60832722BBBBB82239B926D6
      8BBBB988BBBBB3DC29ABBBBBBBBBBB3C729ABBBBBBBBBB93EC29BBBBBBBBBBBB
      6F69BBBBBBBBBBBB9639BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB}
  end
  object btn_cancel: TBitBtn
    Left = 280
    Top = 170
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = btn_cancelClick
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
  object ed_number: TEdit
    Left = 10
    Top = 88
    Width = 345
    Height = 21
    TabOrder = 2
  end
end