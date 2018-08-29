object NewReocListF: TNewReocListF
  Left = 474
  Top = 337
  BorderStyle = bsDialog
  Caption = 'NewReocListF'
  ClientHeight = 386
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    737
    386)
  PixelsPerInch = 96
  TextHeight = 13
  object lbInfo: TLabel
    Left = 5
    Top = 5
    Width = 727
    Height = 51
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 
      #1042#1085#1080#1084#1072#1085#1080#1077'! '#1055#1088#1086#1080#1079#1086#1096#1083#1072' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1072' '#1089#1083#1077#1076#1091#1102#1097#1080#1093' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074'. '#1055#1086#1078#1072#1083#1091#1081#1089#1090#1072',' +
      ' '#1088#1072#1089#1087#1077#1095#1072#1090#1072#1081#1090#1077' '#1085#1086#1074#1099#1077' '#1094#1077#1085#1085#1080#1082#1080' ('#1082#1085#1086#1087#1082#1072' "'#1055#1077#1095#1072#1090#1100' '#1094#1077#1085#1085#1080#1082#1086#1074' '#1087#1086' '#1087#1077#1088#1077#1086#1094#1077#1085 +
      #1082#1077'")'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object lbSort: TLabel
    Left = 360
    Top = 362
    Width = 63
    Height = 13
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072':'
    Visible = False
  end
  object Panel1: TPanel
    Left = 1
    Top = 60
    Width = 735
    Height = 291
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    DesignSize = (
      735
      291)
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 731
      Height = 287
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DM.srNewReoc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
          FieldName = 'art_code'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'names'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 429
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena_old_up'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072' '#1091#1087'. '#1089#1090#1072#1088#1072#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena_new_up'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072' '#1091#1087'. '#1085#1086#1074#1072#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 96
          Visible = True
        end>
    end
  end
  object BitBtn4: TBitBtn
    Left = 626
    Top = 357
    Width = 106
    Height = 25
    Anchors = [akTop]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
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
  object bbPrint: TBitBtn
    Tag = 2
    Left = 5
    Top = 357
    Width = 215
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1077#1095#1072#1090#1100' '#1094#1077#1085#1085#1080#1082#1086#1074' '#1087#1086' '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1077
    TabOrder = 2
    OnClick = bbPrintClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000010000000000000008484
      8400C6C6C600F7E7D600FFF7EF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00555555555555
      5555555555555555555555555555555555555555555555555555555555555555
      5555555555555555555551111111111111115111111111111111000000000000
      0001111111111111111103334466666644011222221222222211034000666616
      1401122111221212121104466666611414011221222221121211046000006666
      4401122111112212211106666666666443011222221222222211061611666430
      0301121211222221121106666666443333011222222222222211000000000000
      0005111111111111111555555555555555555555555555555555555555555555
      5555555555555555555555555555555555555555555555555555}
    NumGlyphs = 2
  end
  object CheckBox5: TCheckBox
    Left = 231
    Top = 361
    Width = 105
    Height = 17
    Caption = #1058#1086#1083#1100#1082#1086' '#1074#1080#1090#1088#1080#1085#1072
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object cbSort: TComboBox
    Left = 427
    Top = 358
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 4
    Text = #1055#1086' '#1072#1083#1092#1072#1074#1080#1090#1091
    Visible = False
    Items.Strings = (
      #1055#1086' '#1072#1083#1092#1072#1074#1080#1090#1091
      #1055#1086' '#1085#1086#1084#1077#1088#1072#1084' '#1087#1086#1083#1086#1082)
  end
end
