object ReplPhoneAccountF: TReplPhoneAccountF
  Left = 308
  Top = 118
  Width = 471
  Height = 547
  Caption = 'ReplPhoneAccountF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 20
    Top = 20
    Width = 141
    Height = 20
    Caption = #1053#1086#1084#1077#1088' '#1072#1073#1086#1085#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 20
    Top = 109
    Width = 161
    Height = 20
    Caption = #1057#1091#1084#1084#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbSum: TLabel
    Left = 20
    Top = 304
    Width = 211
    Height = 20
    Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '#1086#1090' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbSurrender: TLabel
    Left = 20
    Top = 348
    Width = 55
    Height = 20
    Caption = #1057#1076#1072#1095#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbPaySum: TLabel
    Left = 20
    Top = 260
    Width = 131
    Height = 20
    Caption = #1048#1090#1086#1075#1086' '#1082' '#1086#1087#1083#1072#1090#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbFee: TLabel
    Left = 20
    Top = 216
    Width = 82
    Height = 20
    Caption = #1050#1086#1084#1080#1089#1089#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 20
    Top = 68
    Width = 84
    Height = 20
    Caption = #1054#1087#1077#1088#1072#1090#1086#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbService: TLabel
    Left = 120
    Top = 68
    Width = 321
    Height = 30
    Alignment = taCenter
    AutoSize = False
    Caption = #1054#1087#1077#1088#1072#1090#1086#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object lbChangeEdAmountByFee: TLabel
    Left = 24
    Top = 136
    Width = 417
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1057#1091#1084#1084#1072' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1072' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1089' '#1091#1095#1077#1090#1086#1084' '#1082#1086#1084#1080#1089#1089#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object edAccount: TEdit
    Left = 240
    Top = 20
    Width = 201
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = 'edAccount'
    OnEnter = edAccountEnter
    OnExit = edAccountExit
    OnKeyDown = edAccountKeyDown
    OnKeyPress = edAccountKeyPress
    OnKeyUp = edAccountKeyUp
  end
  object edAmount: TEdit
    Left = 240
    Top = 109
    Width = 201
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = 'edAmount'
    OnChange = edAmountChange
    OnKeyDown = edAmountKeyDown
    OnKeyPress = edAmountKeyPress
  end
  object btOK: TBitBtn
    Left = 20
    Top = 396
    Width = 421
    Height = 45
    Caption = #1055#1086#1087#1086#1083#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btOKClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btCancel: TBitBtn
    Left = 20
    Top = 452
    Width = 421
    Height = 45
    Cancel = True
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btCancelClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object edSurrender: TEdit
    Left = 240
    Top = 348
    Width = 201
    Height = 28
    Color = clScrollBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    Text = 'edSurrender'
  end
  object edPaySum: TEdit
    Left = 240
    Top = 260
    Width = 201
    Height = 28
    Color = clScrollBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Text = 'edPaySum'
    OnChange = edPaySumChange
  end
  object edSum: TEdit
    Left = 240
    Top = 304
    Width = 201
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Text = 'edSum'
    OnChange = edSumChange
    OnKeyDown = edSumKeyDown
    OnKeyPress = edSumKeyPress
  end
  object edFee: TEdit
    Left = 240
    Top = 216
    Width = 201
    Height = 28
    Color = clScrollBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Text = 'edFee'
  end
  object btAccount: TBitBtn
    Left = 20
    Top = 152
    Width = 421
    Height = 45
    Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1087#1086#1087#1086#1083#1085#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btAccountClick
    OnKeyDown = btAccountKeyDown
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object qSaveReplenishment: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 100
    Top = 332
  end
  object QrEx: TADOQuery
    Connection = DM.ADOCo
    Parameters = <>
    Left = 175
    Top = 330
  end
end
