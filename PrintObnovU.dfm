object PrintObnovF: TPrintObnovF
  Left = 378
  Top = 397
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PrintObnovF'
  ClientHeight = 184
  ClientWidth = 405
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
    405
    184)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 1
    Width = 404
    Height = 180
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      404
      180)
    object Label1: TLabel
      Left = 5
      Top = 8
      Width = 118
      Height = 13
      Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1085#1086#1074#1083#1077#1085#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 245
      Top = 65
      Width = 29
      Height = 13
      Caption = #1044#1072#1090#1072':'
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 24
      Width = 236
      Height = 152
      Anchors = [akLeft, akTop, akBottom]
      DataSource = DM.srSpisObnov
      Options = [dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Descr'
          Visible = True
        end>
    end
    object BitBtn2: TBitBtn
      Left = 245
      Top = 24
      Width = 155
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1082#1080
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000D40E0000D40E00001000000010000000000000001010
        10004F4F4F0077777700B8A38800D0BFB900CEC8C800E8DCCF000000FF00DEDE
        DE00EFEFEF00F7F1E800FFF7EF00FFF7F700FFFFF700FFFFFF00882222222221
        2388883222222222238885556556565542888596966666665388859B77777777
        528886DEAAAAAAAA638885900C777710538885F11FAAAA11638885BBDBD77777
        628886EFFFFAAAAA638885B000000000528885F111111111638885BBCCCBBB77
        638886EFFFFFFDFA638885B000000000628885F111111111938885BECBCCCB9B
        528886EFFFFFFFDF638885AF00000000538885FF11111111938885DFFCCBDBBB
        528885FFFFFFFFFD638885D00FECBC00538886E11FFFFF11938885AFFFFFCBB7
        438885FFFFFFFFFF638885DFFF000C44448885FFFF111F53458885CFEFEFEC74
        488886DFFFFEFF95588886757575757488888999999999958888}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 245
      Top = 150
      Width = 155
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 2
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
    object dtDate: TDateTimePicker
      Left = 278
      Top = 62
      Width = 122
      Height = 21
      Date = 41054.621183125000000000
      Time = 41054.621183125000000000
      TabOrder = 3
    end
  end
end
