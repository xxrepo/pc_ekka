object RepRegF: TRepRegF
  Left = 655
  Top = 327
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'RepRegF'
  ClientHeight = 229
  ClientWidth = 694
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
    694
    229)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 2
    Top = 180
    Width = 90
    Height = 13
    Caption = #1053#1086#1084#1077#1088#1072' '#1087#1086#1083#1086#1082':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 105
    Top = 180
    Width = 53
    Height = 13
    Caption = #1054#1089#1085#1086#1074#1085#1086#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 215
    Top = 180
    Width = 45
    Height = 13
    Caption = #1042#1080#1090#1088#1080#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 320
    Top = 180
    Width = 34
    Height = 13
    Caption = #1057#1082#1083#1072#1076':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 694
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1088#1086#1094#1077#1085#1090' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1084#1077#1089#1090' '#1093#1088#1072#1085#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 26
    Width = 694
    Height = 147
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    DesignSize = (
      694
      147)
    object dbgR: TDBGrid
      Left = -1
      Top = -2
      Width = 695
      Height = 146
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DM.srRegPercent
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgRDrawColumnCell
      OnDblClick = dbgRDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Nds'
          Title.Alignment = taCenter
          Title.Caption = #1053#1044#1057
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kolname'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'. '#1085#1072#1081#1084
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kolname_p'
          Title.Alignment = taCenter
          Title.Caption = #1050'. '#1085'. '#1079#1072#1087#1086#1083#1085
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kolname_p1'
          Title.Alignment = taCenter
          Title.Caption = #1050'.'#1085'. '#1086#1089#1085'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kolname_p2'
          Title.Alignment = taCenter
          Title.Caption = #1050'.'#1085'. '#1074#1080#1090#1088'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kolname_p3'
          Title.Alignment = taCenter
          Title.Caption = #1050'.'#1085'. '#1089#1082#1083'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'perc'
          Title.Alignment = taCenter
          Title.Caption = '% '#1086#1073#1097#1080#1081
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'perc1'
          Title.Alignment = taCenter
          Title.Caption = '% '#1086#1089#1085'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'perc2'
          Title.Alignment = taCenter
          Title.Caption = '% '#1074#1080#1090#1088'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'perc3'
          Title.Alignment = taCenter
          Title.Caption = '% '#1089#1082#1083
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Num'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'id_apteka'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'f_nds'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = False
        end>
    end
  end
  object BitBtn2: TBitBtn
    Left = 583
    Top = 201
    Width = 110
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
  object BitBtn1: TBitBtn
    Left = 1
    Top = 201
    Width = 200
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1079#1080#1094#1080#1081' '#1073#1077#1079' '#1084#1077#1089#1090' '#1093#1088#1072#1085#1077#1085#1080#1103
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn3: TBitBtn
    Left = 205
    Top = 201
    Width = 216
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1079#1080#1094#1080#1081' '#1087#1086' '#1084#1077#1089#1090#1072#1084' '#1093#1088#1072#1085#1077#1085#1080#1103
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object Edit1: TEdit
    Left = 160
    Top = 176
    Width = 41
    Height = 21
    TabOrder = 5
    Text = '0'
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 265
    Top = 176
    Width = 41
    Height = 21
    TabOrder = 6
    Text = '0'
    OnKeyPress = Edit1KeyPress
  end
  object Edit3: TEdit
    Left = 360
    Top = 176
    Width = 41
    Height = 21
    TabOrder = 7
    Text = '0'
    OnKeyPress = Edit1KeyPress
  end
  object BitBtn4: TBitBtn
    Left = 426
    Top = 201
    Width = 127
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100' '#1094#1077#1085#1085#1080#1082#1086#1074
    TabOrder = 8
    OnClick = BitBtn4Click
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
  object CheckBox1: TCheckBox
    Left = 410
    Top = 178
    Width = 161
    Height = 17
    Caption = #1058#1086#1083#1100#1082#1086' '#1074#1080#1090#1088#1080#1085#1072
    TabOrder = 9
  end
  object pmPrnReg: TPopupMenu
    Left = 25
    Top = 93
    object N1: TMenuItem
      Tag = 1
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1072#1083#1092#1072#1074#1080#1090#1091'...'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Tag = 2
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1085#1086#1084#1077#1088#1072#1084' '#1087#1086#1083#1086#1082'...'
      OnClick = N1Click
    end
  end
  object pmPrnCen: TPopupMenu
    Left = 90
    Top = 93
    object MenuItem1: TMenuItem
      Tag = 1
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1072#1083#1092#1072#1074#1080#1090#1091'...'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Tag = 2
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1085#1086#1084#1077#1088#1072#1084' '#1087#1086#1083#1086#1082'...'
      OnClick = MenuItem1Click
    end
  end
end
