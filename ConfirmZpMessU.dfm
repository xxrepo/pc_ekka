object ConfirmZpMessF: TConfirmZpMessF
  Left = 424
  Top = 332
  BorderStyle = bsDialog
  Caption = 'ConfirmZpMessF'
  ClientHeight = 244
  ClientWidth = 785
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
    785
    244)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 5
    Width = 767
    Height = 18
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = #1057#1087#1080#1089#1086#1082' '#1085#1077#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1085#1099#1093' '#1089#1086#1086#1073#1097#1077#1085#1080#1081
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 30
    Width = 782
    Height = 183
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.srZpMess
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'DT'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Users'
        Title.Alignment = taCenter
        Title.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 279
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Subject'
        Title.Alignment = taCenter
        Title.Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 248
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 85
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 17
    Top = 217
    Width = 120
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000D40E0000D40E000000000000000000000000FF0000FF
      0000FF0000FF0000FF0000FF0000FFB1BDB10000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF32913832
      913877A87A0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF0000FF32913832913834B43953B5550000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF77A87A34B4394CD64C34
      B43953B55577A87A0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      0000FF0000FF32913862D66562D6654CD64C4CD64C3291380000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF32913853B5557CE68162D66562
      D66562D66534B43977A87A0000FF0000FF0000FF0000FF0000FF0000FF9EB79E
      34B4397CE68194F79C73D27534B43932913873D2757CE68153B555B1BDB10000
      FF0000FF0000FF0000FF0000FF77A87A7CE6818CF79473D2753291389EB79E77
      A87A53B5557CE68153B55553B5550000FF0000FF0000FF0000FF0000FF0000FF
      53B55553B55577A87A0000FF0000FF0000FF53B55573D27594F79C73D2759EB7
      9E0000FF0000FF0000FF0000FF0000FF0000FF9EB79E0000FF0000FF0000FF00
      00FF0000FF77A87A94F79C8CF79453B555B1BDB10000FF0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF77A87A8CF7947CE6
      8153B555B1BDB10000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF77A87AADFFAD8CF79453B5550000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF73D2
      75B5FFB573D2750000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF73D27577A87A0000FF0000FF0000FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
  end
  object BitBtn2: TBitBtn
    Left = 652
    Top = 217
    Width = 116
    Height = 25
    Anchors = [akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
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
