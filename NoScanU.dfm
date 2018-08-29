object NoScanF: TNoScanF
  Left = 641
  Top = 343
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'NoScanF'
  ClientHeight = 492
  ClientWidth = 788
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
    788
    492)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 1
    Top = 1
    Width = 786
    Height = 31
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      786
      31)
    object Label1: TLabel
      Left = 6
      Top = 6
      Width = 226
      Height = 17
      Caption = #1053#1077#1086#1090#1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1087#1086#1079#1080#1094#1080#1080' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic, fsUnderline]
      ParentFont = False
    end
    object imNoScan: TImage
      Left = 758
      Top = 7
      Width = 21
      Height = 17
      Anchors = [akTop, akRight]
      AutoSize = True
      Picture.Data = {
        07544269746D617042010000424D420100000000000076000000280000001500
        0000110000000100040000000000CC000000130B0000130B0000100000001000
        000042424200084A8C000014A5000530AA001621E4003E4AE400716DFE009BA4
        E90025C6EA009CB7CE00BAC3DE00C1C1FF00FFDE8C00DEDEDE00DADAF300FFFF
        FF00CCCCCCCC5437CCCC64442000DDDFDFDE66527DA644429000DFFFDDDDB655
        2AB44429C000D0F000F007565355527CC000D0FF0FF0FDB6645539CCC000D0FF
        0FFA00F666641CCCC000D0F00FFFF0B6655549CCC000D0FF0FF00B666156527C
        C000D0FFFFFFB76728866529C000D0F00F0F7B61700756549000D0F00F0F7559
        F00DB5542000D0F00F0F0000F00ECCCCC000D0F00F0F0000F00DCCCCC000D0F0
        0F0F0000F00DCCCCC000D0F00F0F0000F00DCCCCC000DFFFFFFFFFFFFFFECCCC
        C000DDDDDDDDDDDDDDDDCCCCC000}
      Transparent = True
    end
    object Label2: TLabel
      Left = 250
      Top = 9
      Width = 160
      Height = 13
      Caption = #1044#1072#1090#1072': c                        '#1087#1086' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dtStart: TDateTimePicker
      Left = 298
      Top = 5
      Width = 88
      Height = 21
      Date = 39801.000000000000000000
      Time = 39801.000000000000000000
      TabOrder = 0
      OnChange = dtStartChange
    end
    object dtEnd: TDateTimePicker
      Left = 411
      Top = 5
      Width = 88
      Height = 21
      Date = 39801.731579675930000000
      Time = 39801.731579675930000000
      TabOrder = 1
      OnChange = dtStartChange
    end
  end
  object Panel1: TPanel
    Left = 1
    Top = 460
    Width = 786
    Height = 31
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      786
      31)
    object Label3: TLabel
      Left = 5
      Top = 9
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
    object Label4: TLabel
      Left = 210
      Top = 9
      Width = 79
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object BitBtn1: TBitBtn
      Left = 685
      Top = 3
      Width = 98
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
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
      Left = 55
      Top = 5
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnCloseUp = dtStartChange
    end
    object Edit1: TEdit
      Left = 295
      Top = 5
      Width = 181
      Height = 21
      TabOrder = 2
    end
    object BitBtn2: TBitBtn
      Left = 600
      Top = 3
      Width = 85
      Height = 25
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      TabOrder = 3
      OnClick = dtStartChange
    end
  end
  object Panel3: TPanel
    Left = 1
    Top = 34
    Width = 786
    Height = 424
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      786
      424)
    object DBGrid1: TDBGrid
      Left = -1
      Top = -1
      Width = 787
      Height = 425
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 14805218
      DataSource = DM.srNoScan
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
      Columns = <
        item
          Expanded = False
          FieldName = 'DateS'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 124
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fullname'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 394
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'id_user'
          Title.Alignment = taCenter
          Title.Caption = #1050#1072#1089#1089#1080#1088
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 118
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ean13'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = #1064#1090#1088#1080#1093'-'#1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 114
          Visible = True
        end>
    end
  end
end
