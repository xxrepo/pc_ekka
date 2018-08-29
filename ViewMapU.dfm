object ViewMapF: TViewMapF
  Left = 461
  Top = 159
  BorderStyle = bsDialog
  Caption = 'ViewMapF'
  ClientHeight = 724
  ClientWidth = 1005
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
    1005
    724)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 5
    Width = 576
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 30
    Width = 1005
    Height = 663
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    BorderStyle = bsSingle
    TabOrder = 0
    object imMap: TImage
      Left = 0
      Top = 0
      Width = 600
      Height = 450
    end
    object Label2: TLabel
      Left = 15
      Top = 465
      Width = 57
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbPhone: TLabel
      Left = 75
      Top = 465
      Width = 23
      Height = 13
      Caption = 'dfsdf'
      Visible = False
    end
    object Label3: TLabel
      Left = 15
      Top = 480
      Width = 41
      Height = 13
      Caption = #1040#1076#1088#1077#1089':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbAdres: TLabel
      Left = 75
      Top = 480
      Width = 23
      Height = 13
      Caption = 'dfsdf'
    end
    object Label5: TLabel
      Left = 15
      Top = 495
      Width = 92
      Height = 13
      Caption = #1056#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 775
      Top = 10
      Width = 41
      Height = 13
      Caption = #1060#1072#1089#1072#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object imFasad: TImage
      Left = 610
      Top = 30
      Width = 381
      Height = 561
      Proportional = True
      Stretch = True
    end
    object DBGrid1: TDBGrid
      Left = 15
      Top = 513
      Width = 396
      Height = 141
      DataSource = DM.srMode
      Options = [dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          Width = 199
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'OperationMode'
          Width = 175
          Visible = True
        end>
    end
  end
  object BitBtn2: TBitBtn
    Left = 879
    Top = 697
    Width = 125
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
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
  object BitBtn6: TBitBtn
    Left = 3
    Top = 697
    Width = 153
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1053#1072#1087#1077#1095#1072#1090#1072#1090#1100' '#1082#1072#1088#1090#1091'...'
    TabOrder = 2
    OnClick = BitBtn6Click
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
  object PrintDialog1: TPrintDialog
    Left = 50
    Top = 70
  end
end
