object MoveTovF: TMoveTovF
  Left = 654
  Top = 323
  Width = 700
  Height = 552
  BorderIcons = [biSystemMenu]
  Caption = 'MoveTovF'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 289
    Top = 0
    Width = 4
    Height = 340
    ResizeStyle = rsUpdate
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 506
    Width = 692
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = #1044#1074#1080#1078#1077#1085#1080#1077' '#1090#1086#1074#1072#1088#1072'...'
  end
  object Panel1: TPanel
    Left = 0
    Top = 466
    Width = 692
    Height = 40
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      692
      40)
    object Label9: TLabel
      Left = 235
      Top = 5
      Width = 143
      Height = 13
      Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072':'
    end
    object Label10: TLabel
      Left = 5
      Top = 5
      Width = 101
      Height = 13
      Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1086#1089#1090#1072#1090#1086#1082':'
    end
    object Label11: TLabel
      Left = 5
      Top = 20
      Width = 115
      Height = 13
      Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081' '#1086#1089#1090#1072#1090#1086#1082':'
    end
    object Label12: TLabel
      Left = 235
      Top = 20
      Width = 43
      Height = 13
      Caption = #1042' '#1073#1088#1086#1085#1080':'
    end
    object Label13: TLabel
      Left = 130
      Top = 5
      Width = 41
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 130
      Top = 20
      Width = 41
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 385
      Top = 5
      Width = 41
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 385
      Top = 20
      Width = 41
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 579
      Top = 7
      Width = 110
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object cbPer: TCheckBox
      Left = 440
      Top = 12
      Width = 131
      Height = 17
      Caption = #1055#1088#1086#1096#1083#1099#1081' '#1087#1077#1088#1080#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = cbPerClick
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 289
    Height = 340
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      289
      340)
    object GroupBox1: TGroupBox
      Left = 1
      Top = 0
      Width = 286
      Height = 157
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' '#1055#1088#1080#1093#1086#1076' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        286
        157)
      object Label1: TLabel
        Left = 5
        Top = 137
        Width = 153
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = #1042#1089#1077#1075#1086' '#1087#1088#1080#1093#1086#1076' '#1089#1086' '#1089#1082#1083#1072#1076#1072': '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 190
        Top = 137
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        AutoSize = False
      end
      object Panel2: TPanel
        Left = 4
        Top = 16
        Width = 278
        Height = 117
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          278
          117)
        object DBGrid1: TDBGrid
          Left = 1
          Top = 1
          Width = 276
          Height = 115
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = DM.srPrih
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NN_NAKL'
              Title.Alignment = taCenter
              Title.Caption = #8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATE_NAKL'
              Title.Alignment = taCenter
              Title.Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KOL'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 75
              Visible = True
            end>
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 157
      Width = 286
      Height = 180
      Anchors = [akLeft, akRight, akBottom]
      Caption = ' '#1042#1086#1079#1074#1088#1072#1090' '#1085#1072' '#1089#1082#1083#1072#1076' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        286
        180)
      object Label3: TLabel
        Left = 190
        Top = 161
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        AutoSize = False
      end
      object Label4: TLabel
        Left = 5
        Top = 161
        Width = 135
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = #1042#1089#1077#1075#1086' '#1074#1086#1079#1074#1088#1072#1090' '#1089#1082#1083#1072#1076': '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel3: TPanel
        Left = 4
        Top = 16
        Width = 278
        Height = 141
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          278
          141)
        object DBGrid2: TDBGrid
          Left = 1
          Top = 1
          Width = 276
          Height = 139
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = DM.srVozr
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NN_NAKL'
              Title.Alignment = taCenter
              Title.Caption = #8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATE_NAKL'
              Title.Alignment = taCenter
              Title.Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083'.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KOL'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 75
              Visible = True
            end>
        end
      end
    end
  end
  object Panel6: TPanel
    Left = 293
    Top = 0
    Width = 399
    Height = 340
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      399
      340)
    object GroupBox3: TGroupBox
      Left = 1
      Top = 0
      Width = 397
      Height = 157
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' '#1056#1077#1072#1083#1080#1079#1072#1094#1080#1103' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        397
        157)
      object Label5: TLabel
        Left = 5
        Top = 137
        Width = 125
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = #1042#1089#1077#1075#1086' '#1088#1077#1072#1083#1080#1079#1086#1074#1072#1085#1086': '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 300
        Top = 137
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        AutoSize = False
      end
      object Panel4: TPanel
        Left = 4
        Top = 16
        Width = 389
        Height = 117
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          389
          117)
        object DBGrid3: TDBGrid
          Left = 1
          Top = 1
          Width = 387
          Height = 115
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = DM.srRealiz
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'DATE_CHEK'
              Title.Alignment = taCenter
              Title.Caption = #1044#1072#1090#1072' '#1095#1077#1082#1072
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Numb_Chek'
              Title.Alignment = taCenter
              Title.Caption = #8470' '#1095#1077#1082#1072
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
              FieldName = 'KOL'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083'-'#1074#1086
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_KASSA'
              Title.Alignment = taCenter
              Title.Caption = #8470' '#1082#1072#1089#1089#1099
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Kassir'
              Title.Alignment = taCenter
              Title.Caption = #1050#1072#1089#1089#1080#1088
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end>
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 1
      Top = 157
      Width = 397
      Height = 180
      Anchors = [akLeft, akRight, akBottom]
      Caption = ' '#1042#1086#1079#1074#1088#1072#1090' '#1086#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        397
        180)
      object Label7: TLabel
        Left = 5
        Top = 161
        Width = 206
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = #1042#1089#1077#1075#1086' '#1074#1086#1079#1074#1088#1072#1090#1086#1074' '#1086#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1077#1081': '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 300
        Top = 161
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        AutoSize = False
      end
      object Panel7: TPanel
        Left = 4
        Top = 16
        Width = 389
        Height = 141
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          389
          141)
        object DBGrid4: TDBGrid
          Left = 1
          Top = 1
          Width = 387
          Height = 139
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = DM.srBackKl
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'Date_Chek'
              Title.Alignment = taCenter
              Title.Caption = #1044#1072#1090#1072' '#1095#1077#1082#1072
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Numb_Chek'
              Title.Alignment = taCenter
              Title.Caption = #8470' '#1095#1077#1082#1072
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
              FieldName = 'Kol'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083'-'#1074#1086
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_KASSA'
              Title.Alignment = taCenter
              Title.Caption = #8470' '#1082#1072#1089#1089#1099
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Kassir'
              Title.Alignment = taCenter
              Title.Caption = #1050#1072#1089#1089#1080#1088
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end>
        end
      end
    end
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 340
    Width = 692
    Height = 126
    Align = alBottom
    Caption = ' '#1055#1077#1088#1077#1091#1095#1077#1090' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object DBGrid5: TDBGrid
      Left = 3
      Top = 15
      Width = 686
      Height = 108
      DataSource = DM.srmtPer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'dt'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1087#1077#1088#1077#1091#1095#1077#1090#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Kol'
          Title.Alignment = taCenter
          Title.Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1084#1086#1084'. '#1087#1077#1088#1077#1091#1095'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 151
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Blank'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'-'#1074#1086' '#1087#1086' '#1087#1077#1088#1077#1091#1095#1077#1090#1091
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 168
          Visible = True
        end>
    end
  end
end
