object EnterKolF: TEnterKolF
  Left = 602
  Top = 253
  BorderStyle = bsDialog
  Caption = 'EnterKolF'
  ClientHeight = 388
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    552
    388)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 1
    Top = 344
    Width = 306
    Height = 41
    AutoSize = False
    Caption = 
      #1063#1090#1086#1073#1099' '#1074#1099#1073#1088#1072#1090#1100' '#1087#1088#1077#1087#1072#1088#1072#1090' '#1080#1079' '#1085#1080#1078#1085#1077#1075#1086' '#1089#1087#1080#1089#1082#1072', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1087#1086#1083#1085#1080#1090#1100' '#1076 +
      #1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1077#1082' '#1083#1077#1074#1086#1081' '#1082#1085#1086#1087#1082#1086#1081' '#1084#1099#1096#1080' '#1087#1086' '#1085#1091#1078#1085#1086#1084#1091' '#1087#1088#1077#1087#1072#1088#1072#1090#1091' '#1074' '#1089#1087#1080#1089#1082#1077'.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 1
    Width = 551
    Height = 45
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 0
    object lbAlert: TLabel
      Left = 5
      Top = 26
      Width = 355
      Height = 18
      Caption = #1055#1088#1077#1087#1072#1088#1072#1090' '#1076#1077#1083#1080#1090#1089#1103'! '#1041#1091#1076#1100#1090#1077' '#1074#1085#1080#1084#1072#1090#1077#1083#1100#1085#1099'! '#1042' '#1091#1087'. - '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbName: TLabel
      Left = 5
      Top = 5
      Width = 58
      Height = 18
      Caption = 'lbName'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 48
    Width = 551
    Height = 33
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      551
      33)
    object Label1: TLabel
      Left = 9
      Top = 6
      Width = 101
      Height = 19
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 117
      Top = 3
      Width = 84
      Height = 27
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = '1'
      OnChange = Edit1Change
    end
    object UpDown1: TUpDown
      Left = 201
      Top = 3
      Width = 17
      Height = 27
      Associate = Edit1
      Max = 32700
      Position = 1
      TabOrder = 1
    end
    object Label2: TStaticText
      Left = 227
      Top = 6
      Width = 315
      Height = 20
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Label2'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 2
    end
  end
  object BitBtn1: TBitBtn
    Left = 321
    Top = 360
    Width = 110
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1050
    Default = True
    ModalResult = 1
    TabOrder = 2
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
    Left = 440
    Top = 360
    Width = 110
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
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
  object Panel3: TPanel
    Left = 0
    Top = 83
    Width = 551
    Height = 258
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 4
    DesignSize = (
      551
      258)
    object Label3: TLabel
      Left = 5
      Top = 5
      Width = 466
      Height = 36
      Caption = 
        #1059#1074'. '#1087#1088#1086#1074#1080#1079#1086#1088#1099', '#1088#1077#1082#1086#1084#1077#1085#1076#1091#1077#1084' '#1079#1072#1084#1077#1085#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1042#1072#1084#1080' '#1087#1088#1077#1087#1072#1088#1072#1090' '#1085#1072' '#1086 +
        #1076#1080#1085' '#1080#1079' '#1085#1080#1078#1077' '#1087#1077#1088#1077#1095#1080#1089#1083#1077#1085#1085#1099#1093' '#1072#1085#1072#1083#1086#1075#1086#1074
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clPurple
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      WordWrap = True
    end
    object Image1: TImage
      Left = 495
      Top = 10
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D617076020000424D760200000000000076000000280000002000
        000020000000010004000000000000020000130B0000130B0000100000001000
        0000009C000046AE480039D66B0060C76F004CE4810052EC860065F094008EEE
        AC00CECECE00C5E2CE00ADF7CA00C5FFDA00DEFFE700E7E7E700EFEFEF00FFFF
        FF00FFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFF717DFFFFFFFFFF
        FFFFFFFFFFFFFFFFF317118FFFFFFFFFFFFFFFFFFFFFFFFF31BAA11DEFFFFFFF
        FFFFFFFFFFFFFFF31BA77711DEFFFFFFFFFFFFFFFFFFFF33BA7656711DEFFFFF
        FFFFFFFFFFFFF31BA765446711DEFFFFFFFFFFFFFFFF33BA766444437118EFFF
        FFFFFFFFFFF31CA7665544426711DEFFFFFFFFFFFF31CA7665544442467118EF
        FFFFFFFFF33BA766655444242348118EFFFFFFFF31CA7666555444424226711D
        EFFFFFE31CB7766655544442242267118FFFFF71CBA7766665544424423243A1
        3DFFFF37DBBB9A7665544442377779931DFFFFA100000B766644444247000001
        8EFFFFFFFFFF0B77655454244708EFFFFFFFFFFFFFFF0C77664542423708FFFF
        FFFFFFFFFFFF0CA7664444424708EFFFFFFFFFFFFFFF0CA7655444242708FFFF
        FFFFFFFFFFFF0CA7664444424708EFFFFFFFFFFFFFFF0C77664544423708FFFF
        FFFFFFFFFFFF0CA7664444242708EFFFFFFFFFFFFFFF0CA7655444424708FFFF
        FFFFFFFFFFFF0CA7664444424708FFFFFFFFFFFFFFFF0C77664444242708FFFF
        FFFFFFFFFFFF0CA7664444423708FFFFFFFFFFFFFFFF0CA7666446424708FFFF
        FFFFFFFFFFFF0DA7766663666A08FFFFFFFFFFFFFFFF37DBABAAAAA97318FFFF
        FFFFFFFFFFFFA10000000000019EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      Transparent = True
    end
    object Label5: TLabel
      Left = 5
      Top = 210
      Width = 481
      Height = 40
      AutoSize = False
      Caption = 
        #1059#1074'. '#1087#1088#1086#1074#1080#1079#1086#1088#1099', '#1088#1077#1082#1086#1084#1077#1085#1076#1091#1077#1084' '#1079#1072#1084#1077#1085#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1042#1072#1084#1080' '#1087#1088#1077#1087#1072#1088#1072#1090' '#1085#1072' '#1086 +
        #1076#1080#1085' '#1080#1079' '#1085#1080#1078#1077' '#1087#1077#1088#1077#1095#1080#1089#1083#1077#1085#1085#1099#1093' '#1072#1085#1072#1083#1086#1075#1086#1074
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clPurple
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      WordWrap = True
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 45
      Width = 547
      Height = 157
      Anchors = [akLeft, akTop, akRight]
      Color = 11788786
      DataSource = DM.srSpis
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'art_Code'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold, fsItalic]
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'names'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold, fsItalic]
          Width = 351
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ostat'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold, fsItalic]
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold, fsItalic]
          Width = 59
          Visible = True
        end>
    end
    object Panel4: TPanel
      Left = 3
      Top = 207
      Width = 545
      Height = 46
      Anchors = [akLeft, akRight, akBottom]
      BevelOuter = bvLowered
      Color = 14675679
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object DBText1: TDBText
        Left = 1
        Top = 1
        Width = 543
        Height = 44
        Alignment = taCenter
        DataField = 'descr'
        DataSource = DM.srSpis
        WordWrap = True
      end
    end
  end
end
