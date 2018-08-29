object TermEKKAF: TTermEKKAF
  Left = 506
  Top = 241
  Width = 805
  Height = 439
  Caption = 'TermEKKAF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    797
    412)
  PixelsPerInch = 96
  TextHeight = 13
  object pnGroup: TPanel
    Left = 1
    Top = 0
    Width = 795
    Height = 25
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvLowered
    Caption = ' '#1054#1082#1085#1086' '#1090#1077#1088#1084#1080#1085#1072#1083#1072' '#1045#1050#1050#1040' '#1052#1072#1088#1080#1103' 301 '#1052#1058#1052
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 1
    Top = 380
    Width = 795
    Height = 31
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      795
      31)
    object BitBtn2: TBitBtn
      Left = 707
      Top = 3
      Width = 85
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
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
  object sbTerm: TScrollBox
    Left = 1
    Top = 27
    Width = 795
    Height = 350
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBlack
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object lbStart: TLabel
      Left = 10
      Top = 10
      Width = 16
      Height = 16
      Caption = '>\'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edCommand: TEdit
      Left = 30
      Top = 10
      Width = 181
      Height = 24
      BorderStyle = bsNone
      Color = clBlack
      TabOrder = 0
      Text = 'Edit1WWWIIIIIIiiiiwww'
      OnChange = edCommandChange
      OnKeyDown = edCommandKeyDown
    end
  end
end
