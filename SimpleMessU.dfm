object SimpleMessF: TSimpleMessF
  Left = 507
  Top = 330
  Width = 908
  Height = 439
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'SimpleMessF'
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
    900
    412)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 25
    Width = 210
    Height = 17
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clMaroon
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 45
    Top = 5
    Width = 4
    Height = 17
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 711
    Top = 25
    Width = 184
    Height = 13
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1103'...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label3Click
    OnMouseEnter = Label3MouseEnter
    OnMouseLeave = Label3MouseLeave
  end
  object Label4: TLabel
    Left = 0
    Top = 5
    Width = 41
    Height = 17
    Caption = #1050#1086#1084#1091':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object reW: TRichEdit
    Left = 0
    Top = 45
    Width = 900
    Height = 335
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = 14348284
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 382
    Width = 898
    Height = 30
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    DesignSize = (
      898
      30)
    object BitBtn3: TBitBtn
      Left = 2
      Top = 2
      Width = 154
      Height = 25
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = BitBtn3Click
      Glyph.Data = {
        16020000424D16020000000000003600000028000000100000000A0000000100
        180000000000E0010000130B0000130B00000000000000000000C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4B590
        7FB99986C5C6C7C8D0D4B29D9DB29D9DB29D9DB29D9DB29D9DB29D9DB29D9DB2
        9D9DBA8C6EBF895BBC865BBC855BB2642CB65910B38368C4C5C5B59490E7DDD6
        EADED6E9DDD1E8DCCEE7D9CAE6D7C6E5D5C2BD6725DE7901CD6801C56001C560
        01C96401B5550CB48870BB9C97F6F3EDF8F4ECF4EEE5EDE8DEEBE5DAEAE4D6E9
        E2D3C79671D6995BD59558CE8F58BB672ABA5908B1724AC1B9B6C2A39CF6F6F3
        F7F5F1DCDAD5AEADABADACAAADACA9ADABA9ACABA9D1C9BDF0E2CBF0E2CBC58D
        68B17858C3C0BFC8D0D4CDACA0F8F8F8F9F8F7EDECE9DBD8D3DAD7D0D9D4CBD8
        D3C8D8D0C4E6DCCCF1E5D1F0E4CEC6A193C5C8CBC8D0D4C8D0D4D7B6A4FCFCFC
        FFFFFFEFEFEFD3D3D2D1D0CED0CFCCCFCDC9CECBC6E3DDD4F5EDE0F4ECDEC4A1
        96C5C7CAC8D0D4C8D0D4E2BFA9FDFDFDFFFFFFFFFFFFFFFFFEFEFEFDFDFCF8FB
        F9F4F9F5EEF7F2EAB2B5C59FA8BFBF9E97C4C7CAC8D0D4C8D0D4EBC8ACFEFEFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFCFAF6FAF7F1BEC3DAB7C6E3BB9A
        95C3C6C9C8D0D4C8D0D4EBBD97E5C1A9E5C1A9E5C1A9E5C1A9E5C1A9E5C1A9E5
        C1A9E5C0A8E5BFA6E5BFA6E5BFA6AE8278C2C5C9C8D0D4C8D0D4}
    end
    object BitBtn2: TBitBtn
      Left = 805
      Top = 3
      Width = 91
      Height = 25
      Anchors = [akTop, akRight]
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
  end
  object ActionList1: TActionList
    Left = 35
    Top = 70
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 32883
      OnExecute = Action1Execute
    end
  end
end
