object AkciiF: TAkciiF
  Left = 387
  Top = 196
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'AkciiF'
  ClientHeight = 637
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    780
    637)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 780
    Height = 609
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1040#1082#1094#1080#1080' '#1076#1083#1103' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1077#1081
      DesignSize = (
        772
        581)
      object Label1: TLabel
        Left = 154
        Top = 5
        Width = 115
        Height = 20
        Anchors = [akTop]
        Caption = #1057#1087#1080#1089#1086#1082' '#1072#1082#1094#1080#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 95
        Top = 265
        Width = 191
        Height = 20
        Caption = #1040#1082#1094#1080#1086#1085#1085#1099#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 485
        Top = 265
        Width = 205
        Height = 20
        Caption = #1055#1086#1076#1072#1088#1086#1095#1085#1099#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 435
        Top = 25
        Width = 319
        Height = 16
        Caption = #1040#1082#1094#1080#1103' '#1076#1077#1081#1089#1090#1074#1091#1077#1090' '#1087#1088#1080' '#1089#1083#1077#1076#1091#1102#1097#1080#1093' '#1091#1089#1083#1086#1074#1080#1103#1093':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object lbSum: TLabel
        Left = 435
        Top = 65
        Width = 92
        Height = 16
        Caption = #1057#1091#1084#1084#1072' '#1095#1077#1082#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 435
        Top = 95
        Width = 231
        Height = 46
        AutoSize = False
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1081' '#1072#1082#1094#1080#1086#1085#1085#1099#1093' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074' '#1074' '#1095#1077#1082#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object lbCnt: TLabel
        Left = 675
        Top = 100
        Width = 5
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel1: TPanel
        Left = 3
        Top = 27
        Width = 416
        Height = 224
        Anchors = [akTop]
        TabOrder = 0
        DesignSize = (
          416
          224)
        object DBGrid1: TDBGrid
          Left = 3
          Top = 3
          Width = 410
          Height = 218
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = 14541307
          DataSource = DM.srDhAkcii
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'DateStart'
              Title.Alignment = taCenter
              Title.Caption = #1057
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DateEnd'
              Title.Alignment = taCenter
              Title.Caption = #1087#1086
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 50
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
              Width = 275
              Visible = True
            end>
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 293
        Width = 376
        Height = 287
        Anchors = [akLeft, akBottom]
        TabOrder = 1
        DesignSize = (
          376
          287)
        object DBGrid2: TDBGrid
          Left = 3
          Top = 3
          Width = 370
          Height = 281
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = 14151412
          DataSource = DM.srAArt
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'names'
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 233
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'kol'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083'-'#1074#1086
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 47
              Visible = True
            end>
        end
      end
      object Panel3: TPanel
        Left = 395
        Top = 294
        Width = 376
        Height = 287
        Anchors = [akLeft, akBottom]
        TabOrder = 2
        DesignSize = (
          376
          287)
        object DBGrid3: TDBGrid
          Left = 3
          Top = 3
          Width = 370
          Height = 281
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = 16316380
          DataSource = DM.sqAAdd
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'names'
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 233
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'kol'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083'-'#1074#1086
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 47
              Visible = True
            end>
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1040#1082#1094#1080#1080' '#1076#1083#1103' '#1087#1088#1086#1074#1080#1079#1086#1088#1086#1074
      ImageIndex = 1
      DesignSize = (
        772
        581)
      object Label5: TLabel
        Left = 154
        Top = 5
        Width = 115
        Height = 20
        Anchors = [akTop]
        Caption = #1057#1087#1080#1089#1086#1082' '#1072#1082#1094#1080#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 435
        Top = 25
        Width = 319
        Height = 16
        Caption = #1040#1082#1094#1080#1103' '#1076#1077#1081#1089#1090#1074#1091#1077#1090' '#1087#1088#1080' '#1089#1083#1077#1076#1091#1102#1097#1080#1093' '#1091#1089#1083#1086#1074#1080#1103#1093':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 290
        Top = 265
        Width = 191
        Height = 20
        Caption = #1040#1082#1094#1080#1086#1085#1085#1099#1077' '#1087#1088#1077#1087#1072#1088#1072#1090#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object lbSum1: TLabel
        Left = 435
        Top = 65
        Width = 92
        Height = 16
        Caption = #1057#1091#1084#1084#1072' '#1095#1077#1082#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbRules: TLabel
        Left = 435
        Top = 95
        Width = 331
        Height = 151
        AutoSize = False
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1081' '#1072#1082#1094#1080#1086#1085#1085#1099#1093' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074' '#1074' '#1095#1077#1082#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Panel4: TPanel
        Left = 3
        Top = 27
        Width = 416
        Height = 224
        Anchors = [akTop]
        TabOrder = 0
        DesignSize = (
          416
          224)
        object DBGrid4: TDBGrid
          Left = 3
          Top = 3
          Width = 410
          Height = 218
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = 16773070
          DataSource = DM.srDhAkciiP
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'DateStart'
              Title.Alignment = taCenter
              Title.Caption = #1057
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DateEnd'
              Title.Alignment = taCenter
              Title.Caption = #1087#1086
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 50
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
              Width = 275
              Visible = True
            end>
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 293
        Width = 771
        Height = 287
        Anchors = [akLeft, akBottom]
        TabOrder = 1
        DesignSize = (
          771
          287)
        object DBGrid5: TDBGrid
          Left = 3
          Top = 3
          Width = 765
          Height = 281
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = 14477272
          DataSource = DM.srAArtP
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'names'
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 552
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'kol'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083'-'#1074#1086
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 93
              Visible = True
            end>
        end
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 659
    Top = 611
    Width = 121
    Height = 25
    Anchors = [akRight, akBottom]
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
end
