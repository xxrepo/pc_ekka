object JAhchF: TJAhchF
  Left = 517
  Top = 286
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'JAhchF'
  ClientHeight = 465
  ClientWidth = 786
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
    786
    465)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 265
    Top = 35
    Width = 54
    Height = 16
    Caption = #1047#1072#1103#1074#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 387
    Top = 233
    Width = 130
    Height = 13
    Caption = #1050#1086#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1079#1072#1103#1074#1082#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 387
    Top = 338
    Width = 208
    Height = 13
    Caption = #1050#1086#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1102' '#1079#1072#1103#1074#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 390
    Top = 420
    Width = 115
    Height = 13
    Caption = #1040#1074#1090#1086#1088' '#1082#1086#1084#1077#1085#1090#1072#1088#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 510
    Top = 420
    Width = 50
    Height = 13
    AutoSize = True
    DataField = 'user_comment'
    DataSource = DM.srAhchR1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 31
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    object Label2: TLabel
      Left = 5
      Top = 8
      Width = 127
      Height = 13
      Caption = #1057'                          '#1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dtStart: TDateTimePicker
      Left = 19
      Top = 5
      Width = 91
      Height = 21
      Date = 39801.000000000000000000
      Time = 39801.000000000000000000
      TabOrder = 0
    end
    object dtEnd: TDateTimePicker
      Left = 138
      Top = 5
      Width = 91
      Height = 21
      Date = 39801.999988425920000000
      Time = 39801.999988425920000000
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 235
      Top = 3
      Width = 75
      Height = 25
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 53
    Width = 785
    Height = 178
    Anchors = [akLeft, akTop, akRight]
    DataSource = DM.srJAhch
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'dt'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1082#1080
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descr'
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087' '#1088#1072#1073#1086#1090
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 231
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fio'
        Title.Alignment = taCenter
        Title.Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100' '#1079#1072#1103#1074#1082#1080
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 255
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 233
    Width = 381
    Height = 201
    DataSource = DM.srAhchR1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid2DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Descr'
        Title.Alignment = taCenter
        Title.Caption = #1042#1080#1076#1099' '#1088#1072#1073#1086#1090
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_status'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 127
        Visible = True
      end>
  end
  object DBMemo1: TDBMemo
    Left = 387
    Top = 248
    Width = 396
    Height = 81
    Anchors = [akLeft, akTop, akRight]
    DataField = 'Comment'
    DataSource = DM.srAhchR1
    ReadOnly = True
    TabOrder = 3
  end
  object DBMemo2: TDBMemo
    Left = 387
    Top = 353
    Width = 396
    Height = 63
    Anchors = [akLeft, akTop, akRight]
    DataField = 'status_descr'
    DataSource = DM.srAhchR1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object BitBtn4: TBitBtn
    Left = 667
    Top = 439
    Width = 106
    Height = 25
    Anchors = [akTop]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 5
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
  object BitBtn2: TBitBtn
    Left = 2
    Top = 439
    Width = 199
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1088#1080#1079#1085#1072#1082' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
    Enabled = False
    TabOrder = 6
    OnClick = BitBtn2Click
  end
end
