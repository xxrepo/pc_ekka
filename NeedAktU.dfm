object NeedAktF: TNeedAktF
  Left = 469
  Top = 430
  BorderStyle = bsDialog
  Caption = 'NeedAktF'
  ClientHeight = 386
  ClientWidth = 626
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
    626
    386)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 10
    Width = 609
    Height = 60
    Caption = 
      #1057#1083#1077#1076#1091#1102#1097#1080#1077' '#1074#1086#1079#1074#1088#1072#1090#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077' '#1085#1077#1086#1090#1075#1088#1091#1078#1077#1085#1099' ('#1085#1077' '#1085#1072#1087#1077#1095#1072#1090#1072#1085#1099' '#1072#1082#1090#1099' '#1087 +
      #1088#1080#1084#1072'-'#1087#1077#1088#1077#1076#1072#1095#1080'). '#1050#1072#1082' '#1090#1086#1083#1100#1082#1086' '#1087#1088#1080#1077#1076#1077#1090' '#1074#1086#1076#1080#1090#1077#1083#1100' '#1079#1072' '#1101#1090#1080#1084#1080' '#1074#1086#1079#1074#1088#1072#1090#1072#1084#1080' ' +
      #1088#1072#1089#1087#1077#1095#1072#1090#1072#1081#1090#1077' '#1072#1082#1090#1099' '#1087#1088#1080#1077#1084#1072' '#1087#1077#1088#1077#1076#1072#1095#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object BitBtn2: TBitBtn
    Left = 256
    Top = 357
    Width = 114
    Height = 25
    Anchors = [akLeft, akBottom]
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
  object DBGrid1: TDBGrid
    Left = 5
    Top = 85
    Width = 616
    Height = 266
    DataSource = DM.srNeedAkt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nn_nakl'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_nakl'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
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
        FieldName = 'Descr'
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 310
        Visible = True
      end>
  end
end
