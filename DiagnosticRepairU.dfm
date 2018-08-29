object DiagnosticRepairF: TDiagnosticRepairF
  Left = 330
  Top = 169
  Width = 1426
  Height = 732
  Caption = 'DiagnosticRepairF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  DesignSize = (
    1418
    705)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 987
    Top = 525
    Width = 9
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1057
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 1091
    Top = 525
    Width = 15
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1087#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 326
    Top = 9
    Width = 52
    Height = 13
    Caption = 'Art_code'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 491
    Top = 9
    Width = 62
    Height = 13
    Caption = #1050'od_Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 666
    Top = 9
    Width = 30
    Height = 13
    Caption = 'Code'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 30
    Width = 1415
    Height = 481
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.srDiagnostic
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
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
        FieldName = 'rn'
        Title.Alignment = taCenter
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nn_nakl'
        Title.Alignment = taCenter
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_nakl'
        Title.Alignment = taCenter
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kol'
        Title.Alignment = taCenter
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cena'
        Title.Alignment = taCenter
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type_nakl'
        Title.Alignment = taCenter
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reoc'
        Title.Alignment = taCenter
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'row_id'
        Title.Alignment = taCenter
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tm'
        Title.Alignment = taCenter
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rKol'
        Title.Alignment = taCenter
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rCena'
        Title.Alignment = taCenter
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descr'
        Title.Alignment = taCenter
        Width = 375
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 2
    Top = 2
    Width = 109
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000D40E0000D40E0000100000001000000000000000FF00
      00000080000000FF000080808000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000111111111111
      1111111111111111111111111100001111111111115555111111111100333300
      1111111155444455111111103333333301111115444444445111112333222233
      3011114444444444451111233211112330111144441111444511123301111112
      3301144451111114445112330111111233011444511111144451123301111112
      3301144451111114445112330111001233011444511155144451112330112303
      3011114445114454451111233011233330111144451144444511111221112333
      0111111441114444511111111111233330111111111144444511111111112222
      2011111111114444451111111111111111111111111111111111}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 125
    Top = 2
    Width = 136
    Height = 25
    Caption = #1057#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 2
    OnClick = BitBtn2Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E000000000000000000000000FF0000FF
      0000FF0000FF0000FF0000FF0000FF8F8F8F5050509090900000FF0000FF0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF9F8F8F5F5F5FB09090CF
      9F9F9070706060609F8F8F5F5F5F8080800000FF0000FF0000FF0000FF0000FF
      0000FFCFA0A0CF9F9F8F6F6FB08F8FCF9F9FB08F8F907070CF9F9FBF8F8F6F6F
      6F0000FF0000FF0000FF0000FF0000FF7F7F7FBF9090CF9F9FCF9F9FCF9F9FCF
      9F9FCF9F9FCF9F9FCF9F9FB08F8F4F4F4F6F6F6F7F7F7F0000FF0000FFCF9F9F
      B08F8FB08F8FCF9F9FCF9F9FCF9F9FD0AFAFCF9F9FCF9F9FCF9F9FC09090B08F
      8FC09090605F5F0000FF0000FFCF9F9FCF9F9FCF9F9FCF9F9FB0A0A00000FF00
      00FF0000FF0000FFCF9F9FCF9F9FCF9F9FCF9F9FA090900000FF0000FFB09090
      CF9F9FCF9F9F907F7F0000FF0000FF0000FF0000FF0000FF0000FFCF9F9FCF9F
      9F8F7070606060808080CFAFAFBF9090CF9F9FC090907070700000FF0000FF00
      00FF0000FF0000FF0000FFCF9F9FCF9F9FB08F8FA08080505050CF9F9FCF9F9F
      CF9F9FAF80806060600000FF0000FF0000FF0000FF0000FF0000FFCFAFAFCF9F
      9FCF9F9FCF9F9F9F9F9FCFAFAFCFAFAFCF9F9FC090904F4F4F9F9F9F0000FF00
      00FF0000FF0000FF0000FFCF9F9FCF9F9FAF8080A08F8F0000FF0000FFC0A0A0
      CF9F9FCF9F9F8F6F6F5050509F9F9F0000FF0000FF0000FFB09F9FCF9F9FCF9F
      9F9F7F7F605F5F0000FF0000FFCF9F9FCF9F9FCF9F9FCF9F9F8F7070504F4F50
      50506060609F7F7FCF9F9FCF9F9FCF9F9FCF9F9FA090900000FF0000FFD0AFAF
      CFAFAFCFA0A0CF9F9FCF9F9FCF9F9FCF9F9FCF9F9FCF9F9FCF9F9FBF8F8FA080
      80CF9F9F0000FF0000FF0000FF0000FF0000FFD0A0A0CF9F9FCF9F9FCF9F9FCF
      9F9FCF9F9FCF9F9FCF9F9FBF90908080800000FF0000FF0000FF0000FF0000FF
      0000FFD0AFAFCF9F9FCFAFAFD0AFAFCF9F9FB08F8FBFA0A0CF9F9FCF9F9F0000
      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFD0AFAFCF
      9F9FCF9F9F0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
  end
  object DBGrid2: TDBGrid
    Left = 2
    Top = 515
    Width = 979
    Height = 189
    Anchors = [akLeft, akBottom]
    Color = 14479838
    DataSource = DM.srRepairRep
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt'
        Title.Alignment = taCenter
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'txt'
        Title.Alignment = taCenter
        Width = 730
        Visible = True
      end>
  end
  object BitBtn3: TBitBtn
    Left = 990
    Top = 550
    Width = 207
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 4
    OnClick = BitBtn3Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000D40E0000D40E0000100000001000000000000000FF00
      00000080000000FF000080808000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000111111111111
      1111111111111111111111111100001111111111115555111111111100333300
      1111111155444455111111103333333301111115444444445111112333222233
      3011114444444444451111233211112330111144441111444511123301111112
      3301144451111114445112330111111233011444511111144451123301111112
      3301144451111114445112330111001233011444511155144451112330112303
      3011114445114454451111233011233330111144451144444511111221112333
      0111111441114444511111111111233330111111111144444511111111112222
      2011111111114444451111111111111111111111111111111111}
    NumGlyphs = 2
  end
  object dtStart: TDateTimePicker
    Left = 1000
    Top = 521
    Width = 86
    Height = 21
    Anchors = [akLeft, akBottom]
    Date = 38786.000000000000000000
    Time = 38786.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object dtEnd: TDateTimePicker
    Left = 1111
    Top = 521
    Width = 86
    Height = 21
    Anchors = [akLeft, akBottom]
    Date = 38786.999988425930000000
    Time = 38786.999988425930000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object dbeArt: TDBEdit
    Left = 385
    Top = 5
    Width = 86
    Height = 21
    DataField = 'art_code'
    DataSource = DM.srDiagnostic
    ReadOnly = True
    TabOrder = 7
  end
  object dbeKod: TDBEdit
    Left = 560
    Top = 5
    Width = 86
    Height = 21
    DataField = 'kod_name'
    DataSource = DM.srDiagnostic
    ReadOnly = True
    TabOrder = 8
  end
  object edeCode: TDBEdit
    Left = 705
    Top = 5
    Width = 86
    Height = 21
    DataField = 'code'
    DataSource = DM.srDiagnostic
    ReadOnly = True
    TabOrder = 9
  end
end
