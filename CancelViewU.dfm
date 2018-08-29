object CancelViewF: TCancelViewF
  Left = 702
  Top = 259
  Width = 847
  Height = 509
  BorderIcons = [biSystemMenu]
  Caption = 'CancelViewF'
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
    839
    482)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 1
    Top = 10
    Width = 115
    Height = 13
    Caption = #1057'                       '#1087#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 225
    Top = 10
    Width = 44
    Height = 13
    Caption = #1050#1072#1089#1089#1080#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 435
    Top = 10
    Width = 79
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object Label4: TLabel
    Left = 1
    Top = 35
    Width = 158
    Height = 13
    Caption = #1055#1088#1080#1079#1085#1072#1082' '#1086#1090#1084#1077#1085#1099' '#1087#1086#1079#1080#1094#1080#1081':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dtStart: TDateTimePicker
    Left = 15
    Top = 6
    Width = 81
    Height = 21
    Date = 39801.000000000000000000
    Time = 39801.000000000000000000
    TabOrder = 0
  end
  object dtEnd: TDateTimePicker
    Left = 124
    Top = 6
    Width = 91
    Height = 21
    Date = 39801.000000000000000000
    Time = 39801.000000000000000000
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 58
    Width = 837
    Height = 396
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.srCancel
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'dt'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'art_code'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm_s'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 323
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kol'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cena'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kassa'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1050#1072#1089#1089#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'username'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #1050#1072#1089#1089#1080#1088
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 101
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 727
    Top = 456
    Width = 110
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 3
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
  object cbUsers: TComboBox
    Left = 275
    Top = 6
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    OnChange = cbUsersChange
  end
  object BitBtn2: TBitBtn
    Left = 690
    Top = 4
    Width = 85
    Height = 25
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 0
    Top = 456
    Width = 106
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 6
    OnClick = BitBtn3Click
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000C40E0000C40E000000000000000000000000FF0000FF
      0000FF0000FF0000FF8F8F8F7F7F7F7F7F7F7F7F7F7F7F7F0000FF0000FF0000
      FF0000FF0000FF0000FF51515151515151515151515151515194949484848484
      84848484848484845151515151515151515151515151515151510000FF0000FF
      0000FF8F8F8F6060604F4F4F505050605F5F8F80806060606060607F7F7F0000
      FF0000FF0000FF0000FF51515151515151515194949465656554545455555564
      64648686866565656565658484845151515151515151515151510000FF8F8F8F
      606060A0A0A0F0F0F0B0B0B09F8F8FA08080B0B0B0E0E0E0BFBFBF6F6F6F6060
      600000FF0000FF0000FF515151949494656565A5A5A5D5D5D5B5B5B595959588
      8888B5B5B5D5D5D5C4C4C47474746565655151515151515151518F8F8F9F9F9F
      EFEFEFF0F0F0EFEFEFAFAFAF9090905F5F5F6F6F6F8F8F8FBFBFBFEFEFEFB0B0
      B08080800000FF0000FF949494A4A4A4D5D5D5D5D5D5D5D5D5B4B4B495959564
      6464747474949494C4C4C4D5D5D5B5B5B5858585515151515151D0D0D0FFFFFF
      F0F0F0DFDFDF9090907F7F7F909090B0B0B0A0A0A09090908F8F8F8F8F8F6F6F
      6F8F8F8F0000FF0000FFD5D5D5D5D5D5D5D5D5D5D5D5959595848484959595B5
      B5B5A5A5A5959595949494949494747474949494515151515151BFBFBFDFDFDF
      A0A0A09F9F9FCFCFCFAFAFAF8F8F8F8080808080809F9F9FBFBFBF7FAF8F6060
      608F8F8F0000FF0000FFC4C4C4D5D5D5A5A5A5A4A4A4D5D5D5B4B4B494949485
      8585858585A4A4A4C4C4C4A5A5A5656565949494515151515151707070A0A0A0
      DFDFDFDFDFDFDFDFDFDFDFDFE0E0E0CFCFCFBFBFBF9F9F9F8F8F8F6080705F5F
      5F8F8F8F0000FF0000FF757575A5A5A5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5
      D5D5C4C4C4A4A4A49494947C7C7C6464649494945151515151519F9F9FE0E0E0
      DFDFDFD0D0D0CFCFCFD0D0D0CFCFCFC0C0C0C0C0C0CFCFCFD0D0D0CFCFCF7070
      708F8F8F0000FF0000FFA4A4A4D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5C5
      C5C5C5C5C5D5D5D5D5D5D5D5D5D5757575949494515151515151AFAFAFD0D0D0
      C0C0C0AFAFAFA0A0A0CFCFCFF0F0F0EFEFEFEFEFEFDFDFDFBFBFBFBFBFBF8F8F
      8F0000FF0000FF0000FFB4B4B4D5D5D5C5C5C5B4B4B4A5A5A5D5D5D5D5D5D5D5
      D5D5D5D5D5D5D5D5C4C4C4C4C4C49494945151515151515151510000FFAFAFAF
      CFCFCFEFEFEFB0B0B0BFBFBFAFAFAFB0B0B0BFBFBFBFBFBFB0B0B08F8F8F0000
      FF0000FF0000FF0000FF515151B4B4B4D5D5D5D5D5D5B5B5B5C4C4C4B4B4B4B5
      B5B5C4C4C4C4C4C4B5B5B59494945151515151515151515151510000FF0000FF
      C0BFBFFFD0C0FFD0C0FFD0CFEFDFD0E0E0DFE0E0E08F8F8F0000FF0000FF0000
      FF0000FF0000FF0000FF515151515151C4C4C4D5D5D5D5D5D5D5D5D5D5D5D5D5
      D5D5D5D5D59494945151515151515151515151515151515151510000FF0000FF
      DFCFC0FFDFBFFFDFBFFFDFBFFFD0B0FFD0AF806F6F0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF515151515151D1D1D1D5D5D5D5D5D5D5D5D5D0D0D0D0
      D0D07575755151515151515151515151515151515151515151510000FF0000FF
      D0B0A0FFE0CFFFE0CFFFE0CFFFE0CFFFDFC07F6F6F0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF515151515151B3B3B3D5D5D5D5D5D5D5D5D5D5D5D5D5
      D5D57575755151515151515151515151515151515151515151510000FF0000FF
      DFC0B0FFEFDFFFEFDFFFEFDFFFEFDFDFC0B0A0A0A00000FF0000FF0000FF0000
      FF0000FF0000FF0000FF515151515151C3C3C3D5D5D5D5D5D5D5D5D5D5D5D5C3
      C3C3A5A5A55151515151515151515151515151515151515151510000FFD0C0BF
      FFF0EFFFF0EFFFF0EFFFF0EFFFF0EFAFA09F0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF515151C6C6C6D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5A6
      A6A65151515151515151515151515151515151515151515151510000FFDFC0C0
      FFF0F0E0DFD0E0DFD0E0DFD0A0A0A00000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF515151C8C8C8D5D5D5D5D5D5D5D5D5D5D5D5A5A5A551
      5151515151515151515151515151515151515151515151515151}
    NumGlyphs = 2
  end
  object Edit1: TEdit
    Left = 520
    Top = 6
    Width = 167
    Height = 21
    TabOrder = 7
  end
  object cbPriznak: TComboBox
    Left = 161
    Top = 32
    Width = 195
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 8
    Text = #1042#1089#1077
    OnChange = cbPriznakChange
    Items.Strings = (
      #1042#1089#1077
      #1054#1090#1084#1077#1085#1077#1085#1085#1099#1077' '#1095#1077#1082#1080
      #1059#1084#1077#1085#1100#1096#1077#1085#1085#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086)
  end
end
