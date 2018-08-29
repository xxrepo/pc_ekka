object HodAkciiF: THodAkciiF
  Left = 439
  Top = 247
  BorderStyle = bsDialog
  Caption = #1040#1082#1094#1080#1080' "'#1056#1086#1079#1099#1075#1088#1099#1096' '#1087#1088#1080#1079#1086#1074'"'
  ClientHeight = 633
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    702
    633)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 10
    Width = 49
    Height = 17
    Caption = #1040#1082#1094#1080#1103':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 5
    Top = 95
    Width = 151
    Height = 17
    Caption = #1055#1077#1088#1080#1086#1076' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 5
    Top = 150
    Width = 139
    Height = 17
    Caption = #1055#1088#1080#1079' '#1079#1072' 1-'#1077' '#1084#1077#1089#1090#1086':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 5
    Top = 175
    Width = 139
    Height = 17
    Caption = #1055#1088#1080#1079' '#1079#1072' 2-'#1077' '#1084#1077#1089#1090#1086':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clMaroon
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 5
    Top = 200
    Width = 139
    Height = 17
    Caption = #1055#1088#1080#1079' '#1079#1072' 3-'#1077' '#1084#1077#1089#1090#1086':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 5
    Top = 120
    Width = 151
    Height = 17
    Caption = #1055#1077#1088#1080#1086#1076' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 5
    Top = 40
    Width = 61
    Height = 39
    Caption = #1055#1086#1083#1085#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1072#1082#1094#1080#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object GroupBox1: TGroupBox
    Left = 1
    Top = 370
    Width = 698
    Height = 233
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' '#1056#1077#1081#1090#1080#1085#1075#1080' '
    TabOrder = 0
    DesignSize = (
      698
      233)
    object DBGrid1: TDBGrid
      Left = 4
      Top = 15
      Width = 690
      Height = 213
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DM.srResA1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'Apteka'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1040#1087#1090#1077#1082#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 203
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Users'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1050#1072#1089#1089#1080#1088
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 307
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Kol'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'-'#1074#1086' '#1087#1088#1086#1076#1072#1078
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Place'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1052#1077#1089#1090#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 44
          Visible = True
        end>
    end
  end
  object BitBtn1: TBitBtn
    Left = 570
    Top = 606
    Width = 126
    Height = 25
    Anchors = [akLeft, akBottom]
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
  object ComboBox1: TComboBox
    Left = 60
    Top = 8
    Width = 636
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnCloseUp = ComboBox1CloseUp
  end
  object GroupBox2: TGroupBox
    Left = 1
    Top = 220
    Width = 698
    Height = 151
    Caption = ' '#1055#1083#1072#1085' '#1087#1088#1086#1076#1072#1078' '
    TabOrder = 3
    object DBGrid2: TDBGrid
      Left = 4
      Top = 16
      Width = 690
      Height = 121
      Color = 15263999
      DataSource = DM.srPlanA1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'names'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 511
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'plankol'
          Title.Alignment = taCenter
          Title.Caption = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1087#1088#1086#1076#1072#1090#1100
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 145
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 70
    Top = 35
    Width = 626
    Height = 51
    BevelOuter = bvLowered
    TabOrder = 4
    object Label8: TLabel
      Left = 1
      Top = 1
      Width = 624
      Height = 49
      Align = alClient
      Caption = 'Label8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
  end
end
