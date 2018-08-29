object ShowATCF: TShowATCF
  Left = 449
  Top = 223
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ShowATCF'
  ClientHeight = 692
  ClientWidth = 1011
  Color = clWhite
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
    1011
    692)
  PixelsPerInch = 96
  TextHeight = 13
  object Image6: TImage
    Left = 415
    Top = 35
    Width = 588
    Height = 51
  end
  object Image5: TImage
    Left = 5
    Top = 594
    Width = 606
    Height = 91
    Anchors = [akLeft, akBottom]
  end
  object Label12: TLabel
    Left = 422
    Top = 63
    Width = 100
    Height = 13
    Caption = #1042#1077#1097#1077#1089#1090#1074#1086' ('#1083#1072#1090'.):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText6: TDBText
    Left = 529
    Top = 62
    Width = 467
    Height = 17
    DataField = 'veshestvoen'
    DataSource = DM.srATCDop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel
    Left = 422
    Top = 43
    Width = 101
    Height = 13
    Caption = #1060#1086#1088#1084#1072' '#1074#1099#1087#1091#1089#1082#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText7: TDBText
    Left = 529
    Top = 42
    Width = 467
    Height = 17
    DataField = 'forma'
    DataSource = DM.srATCDop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image1: TImage
    Left = 625
    Top = 600
    Width = 16
    Height = 16
    Anchors = [akLeft, akBottom]
    AutoSize = True
    Picture.Data = {
      07544269746D6170F6000000424DF60000000000000076000000280000001000
      000010000000010004000000000080000000130B0000130B0000100000000000
      00000000000010101000232323003939390060606000DE351200CBA96700B5B5
      B5001010DE006B6BFF00C6C6C600BDCEB5006BFFC900DADADA00E7E7E700FFFF
      FF00B7000BBBBBBBBBBBA07770BBBBBBBBBB27F7770BBBBBBBBB37EF7770BB77
      BBBB37FFF7772B557BBBB07FFFA1BB657BBBBB07FA1BBBBBBBBBBBB071BCCCB8
      886BBBB1117CFC89888BBB25562CCC9D988BB0555563BBDFE98B055566552BBD
      98BB05656550BBBBBBBB0555550BBBBBBBBB705550BBBBBBBBBBB7000BBBBBBB
      BBBB}
    Transparent = True
  end
  object lbTerap: TLabel
    Left = 648
    Top = 600
    Width = 139
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1058#1077#1088#1072#1087#1077#1074#1090#1080#1095#1077#1089#1082#1072#1103' '#1079#1072#1084#1077#1085#1072'...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = lbTerapClick
    OnMouseEnter = lbTerapMouseEnter
    OnMouseLeave = lbTerapMouseLeave
  end
  object Label16: TLabel
    Left = 650
    Top = 620
    Width = 69
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1048#1085#1089#1090#1088#1091#1082#1094#1080#1103'...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = Label16Click
    OnMouseEnter = lbTerapMouseEnter
    OnMouseLeave = lbTerapMouseLeave
  end
  object Label15: TLabel
    Left = 650
    Top = 640
    Width = 70
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090'...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = Label15Click
    OnMouseEnter = lbTerapMouseEnter
    OnMouseLeave = lbTerapMouseLeave
  end
  object Label17: TLabel
    Left = 650
    Top = 660
    Width = 74
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1060#1086#1090#1086#1075#1088#1072#1092#1080#1103'...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = BitBtn5Click
    OnMouseEnter = lbTerapMouseEnter
    OnMouseLeave = lbTerapMouseLeave
  end
  object imA: TImage
    Left = 626
    Top = 620
    Width = 14
    Height = 14
    Anchors = [akLeft, akBottom]
    AutoSize = True
    Transparent = True
  end
  object Image3: TImage
    Left = 625
    Top = 640
    Width = 16
    Height = 16
    Anchors = [akLeft, akBottom]
    AutoSize = True
    Picture.Data = {
      07544269746D617036030000424D360300000000000036000000280000001000
      0000100000000100180000000000000300000000000000000000000000000000
      0000B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB40D0D0D
      0D0D0D1414140D0D0D030303B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CF
      B4B9CFB4B9CFB4B9CFB40D0D0D929292989898CECECE8F8F8F444444030303B9
      CFB4000000000000000000000000000000000000000000030303444444BCBCBC
      4E96BE2C90CA9AB3C08F8F8F0D0D0DB9CFB40000007072726064646064646064
      646064646064643739397474746798B274AED17B95A42C90CACECECE141414B9
      CFB4000000E1E5E5C4CBCBC3CBCBC4CBCBC3CBCBC3CBCB969C9C44444491AAB7
      6AB7E474AED14E96BE9898980D0D0DB9CFB4000000E4E7E7C9D0CFC9CFCFC8CF
      CFC9D0CFC9CFD09B9F9F444444BCBCBC91AAB76798B2BCBCBC9898980D0D0DB9
      CFB4000000E7EAEA686B6B9CA0A0CFD5D4CFD5D5CFD5D5CFD5D5A0A3A3444444
      4444447474744444440D0D0DB9CFB4B9CFB4000000EBEDED6C6E6E6C6E6EA1A4
      A4A1A4A46C6E6E6C6E6ED6DBDBA5A8A8A5A8A8737575A4A8A8000000B9CFB4B9
      CFB4000000EEF0F06F71716F7171A6A9A9DDE1E0DDE0E0DDE1E0DDE0E0DDE0E1
      DDE0E0DDE0E0DDE1E1000000B9CFB4B9CFB4000000F1F2F27274737273737273
      73ABADAC727373727373ABACACABADACE3E6E6E3E6E6E3E6E6000000B9CFB4B9
      CFB4000000F4F5F5757675AFB0B0AFB0B0757676AFB0B0E9EAEBE9EAEAE9EBEA
      E9EBEBE9EAEAE9EAEB000000B9CFB4B9CFB4000000F6F6F6777777B2B2B3B2B2
      B2777777777777777777B2B3B3B2B3B3EDEEEEEDEEEEEDEEEE000000B9CFB4B9
      CFB4000000DACD9EC7B484C7B484C7B484C7B484C7B484C7B484C7B484C7B484
      C7B484C7B484C7B484000000B9CFB4B9CFB4000000C2AD3FA88B0DA88B0DA88B
      0EA88B0EA88B0EA88B0EA88B0DA88B0EA88B0DA88B0EA88B0E000000B9CFB4B9
      CFB4000000D5C659CFBE41CFBE41CFBE41CFBE41CFBE41CFBE41CFBE41CFBE41
      CFBE41CFBE41CFBE41000000B9CFB4B9CFB40000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000B9CFB4B9
      CFB4}
    Transparent = True
  end
  object Image4: TImage
    Left = 625
    Top = 660
    Width = 12
    Height = 16
    Anchors = [akLeft, akBottom]
    AutoSize = True
    Picture.Data = {
      07544269746D617076020000424D760200000000000036000000280000000C00
      000010000000010018000000000040020000130B0000130B0000000000000000
      0000C0C0C0C0C0C0C0C0C0C0C0C099E4E6DFF0F1C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0D3EBEEBEECF03ECBD438CED68CCBE387D0E1B7DDDFDEDF
      DFEEEEEEEEEEEEC0C0C0C0C0C09CE3E71CAEB50A8F9335D1D8ADB1DB9A9EDC9B
      A8DDBFC0C5BABABAB7B6B5E4E3E596E5EA0D9698077A7D06898E1DCED99FE0E6
      D0DBE5D8D8E1DFDFE2E3E3E3A5A6DCD5D6E56DDCE305888B03767909898E05CD
      DA03D9E50AD8E53DDBE378DDE1B4DFE2B3B9DFD1D5E765DAE107898B08848905
      B9C208C7D308D1DD06D8E607D7E505D6E404D5E216D7DF81E4EA60DBE30AB3B9
      05C6D101C9D20FABD2404BCC4178CA2890CE0FACD105CFDC03D5E459E1E95CDB
      E200CAD400C7D500C8D105CED90DADBF1B92C2257DCA4164CB434EC6275EC85E
      A0D95EDBE200CAD700C9D500C8D420D0D968DCE337CFD90ED9E308DAE506C8D7
      119FCE5AA0D75BDBE300CBD801C9D602C9D635D1DBE0E0DFE5E5E4D9E3E4ACE0
      E37ADDE446D8E25CE1E758DBE303CCD902CAD705CAD638D2DBA2A3A1A4A4A4E4
      E4E4E3E3E3E3E3E3E1E3E2E5E8E953DBE40AC9D50ABFCA0EA0A445A6D69A9A99
      9C9C9CA3A3A3929292A7A7A7C0C0C0E0E0E05BC6C911959B0E9FA70BC5D03CD0
      D9C2C2C1AAAAAAB8B8B8E2E2E2D5D5D5B9B9B9D2D2D259BCC10FA5AC19CFD96B
      CFD8C3D2D5D7D7D6D9D9D9DCDCDCDEDEDEE0E0E0E2E2E2E7E7E76ED9DF64C0C3
      A4ABADB9BDBCC1C1C1CDCDCDD2D4D2D2D3D2D1D2D2D6D6D6E3E3E3F3F3F3C0C0
      C0C0C0C0C0C0C0C0C0C0DFDFDFD0D0D0CACACDD9DCE4C0C0C0C0C0C0C0C0C0C0
      C0C0}
    Transparent = True
  end
  object Label2: TLabel
    Left = 16
    Top = 604
    Width = 587
    Height = 13
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label3: TLabel
    Left = 16
    Top = 619
    Width = 587
    Height = 13
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label4: TLabel
    Left = 16
    Top = 634
    Width = 587
    Height = 13
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label5: TLabel
    Left = 16
    Top = 649
    Width = 587
    Height = 13
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 25088
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label6: TLabel
    Left = 16
    Top = 664
    Width = 587
    Height = 13
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'Label2'
    ParentShowHint = False
    ShowHint = True
  end
  object SpeedButton2: TSpeedButton
    Left = 855
    Top = 94
    Width = 149
    Height = 23
    Hint = #1060#1086#1090#1086#1075#1088#1072#1092#1080#1103
    Caption = #1060#1086#1090#1086#1075#1088#1072#1092#1080#1103
    Flat = True
    Glyph.Data = {
      76020000424D760200000000000036000000280000000C000000100000000100
      18000000000040020000130B0000130B00000000000000000000C0C0C0C0C0C0
      C0C0C0C0C0C099E4E6DFF0F1C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0D3EBEEBEECF03ECBD438CED68CCBE387D0E1B7DDDFDEDFDFEEEEEEEEEEEEC0
      C0C0C0C0C09CE3E71CAEB50A8F9335D1D8ADB1DB9A9EDC9BA8DDBFC0C5BABABA
      B7B6B5E4E3E596E5EA0D9698077A7D06898E1DCED99FE0E6D0DBE5D8D8E1DFDF
      E2E3E3E3A5A6DCD5D6E56DDCE305888B03767909898E05CDDA03D9E50AD8E53D
      DBE378DDE1B4DFE2B3B9DFD1D5E765DAE107898B08848905B9C208C7D308D1DD
      06D8E607D7E505D6E404D5E216D7DF81E4EA60DBE30AB3B905C6D101C9D20FAB
      D2404BCC4178CA2890CE0FACD105CFDC03D5E459E1E95CDBE200CAD400C7D500
      C8D105CED90DADBF1B92C2257DCA4164CB434EC6275EC85EA0D95EDBE200CAD7
      00C9D500C8D420D0D968DCE337CFD90ED9E308DAE506C8D7119FCE5AA0D75BDB
      E300CBD801C9D602C9D635D1DBE0E0DFE5E5E4D9E3E4ACE0E37ADDE446D8E25C
      E1E758DBE303CCD902CAD705CAD638D2DBA2A3A1A4A4A4E4E4E4E3E3E3E3E3E3
      E1E3E2E5E8E953DBE40AC9D50ABFCA0EA0A445A6D69A9A999C9C9CA3A3A39292
      92A7A7A7C0C0C0E0E0E05BC6C911959B0E9FA70BC5D03CD0D9C2C2C1AAAAAAB8
      B8B8E2E2E2D5D5D5B9B9B9D2D2D259BCC10FA5AC19CFD96BCFD8C3D2D5D7D7D6
      D9D9D9DCDCDCDEDEDEE0E0E0E2E2E2E7E7E76ED9DF64C0C3A4ABADB9BDBCC1C1
      C1CDCDCDD2D4D2D2D3D2D1D2D2D6D6D6E3E3E3F3F3F3C0C0C0C0C0C0C0C0C0C0
      C0C0DFDFDFD0D0D0CACACDD9DCE4C0C0C0C0C0C0C0C0C0C0C0C0}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 712
    Top = 94
    Width = 143
    Height = 23
    Hint = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
    Caption = #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
    Flat = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000B9CFB4B9CFB4
      B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB40D0D0D0D0D0D1414140D0D
      0D030303B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9CFB4B9
      CFB40D0D0D929292989898CECECE8F8F8F444444030303B9CFB4000000000000
      000000000000000000000000000000030303444444BCBCBC4E96BE2C90CA9AB3
      C08F8F8F0D0D0DB9CFB400000070727260646460646460646460646460646437
      39397474746798B274AED17B95A42C90CACECECE141414B9CFB4000000E1E5E5
      C4CBCBC3CBCBC4CBCBC3CBCBC3CBCB969C9C44444491AAB76AB7E474AED14E96
      BE9898980D0D0DB9CFB4000000E4E7E7C9D0CFC9CFCFC8CFCFC9D0CFC9CFD09B
      9F9F444444BCBCBC91AAB76798B2BCBCBC9898980D0D0DB9CFB4000000E7EAEA
      686B6B9CA0A0CFD5D4CFD5D5CFD5D5CFD5D5A0A3A34444444444447474744444
      440D0D0DB9CFB4B9CFB4000000EBEDED6C6E6E6C6E6EA1A4A4A1A4A46C6E6E6C
      6E6ED6DBDBA5A8A8A5A8A8737575A4A8A8000000B9CFB4B9CFB4000000EEF0F0
      6F71716F7171A6A9A9DDE1E0DDE0E0DDE1E0DDE0E0DDE0E1DDE0E0DDE0E0DDE1
      E1000000B9CFB4B9CFB4000000F1F2F2727473727373727373ABADAC72737372
      7373ABACACABADACE3E6E6E3E6E6E3E6E6000000B9CFB4B9CFB4000000F4F5F5
      757675AFB0B0AFB0B0757676AFB0B0E9EAEBE9EAEAE9EBEAE9EBEBE9EAEAE9EA
      EB000000B9CFB4B9CFB4000000F6F6F6777777B2B2B3B2B2B277777777777777
      7777B2B3B3B2B3B3EDEEEEEDEEEEEDEEEE000000B9CFB4B9CFB4000000DACD9E
      C7B484C7B484C7B484C7B484C7B484C7B484C7B484C7B484C7B484C7B484C7B4
      84000000B9CFB4B9CFB4000000C2AD3FA88B0DA88B0DA88B0EA88B0EA88B0EA8
      8B0EA88B0DA88B0EA88B0DA88B0EA88B0E000000B9CFB4B9CFB4000000D5C659
      CFBE41CFBE41CFBE41CFBE41CFBE41CFBE41CFBE41CFBE41CFBE41CFBE41CFBE
      41000000B9CFB4B9CFB400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000B9CFB4B9CFB4}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TSpeedButton
    Left = 414
    Top = 94
    Width = 180
    Height = 23
    Hint = #1058#1077#1088#1072#1087#1077#1074#1090#1080#1095#1077#1089#1082#1072#1103' '#1079#1072#1084#1077#1085#1072
    Caption = #1058#1077#1088#1072#1087#1077#1074#1090#1080#1095#1077#1089#1082#1072#1103' '#1079#1072#1084#1077#1085#1072
    Flat = True
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000130B0000130B00001000000000000000000000001010
      1000232323003939390060606000DE351200CBA96700B5B5B5001010DE006B6B
      FF00C6C6C600BDCEB5006BFFC900DADADA00E7E7E700FFFFFF00B7000BBBBBBB
      BBBBA07770BBBBBBBBBB27F7770BBBBBBBBB37EF7770BB77BBBB37FFF7772B55
      7BBBB07FFFA1BB657BBBBB07FA1BBBBBBBBBBBB071BCCCB8886BBBB1117CFC89
      888BBB25562CCC9D988BB0555563BBDFE98B055566552BBD98BB05656550BBBB
      BBBB0555550BBBBBBBBB705550BBBBBBBBBBB7000BBBBBBBBBBB}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton4Click
  end
  object SpeedButton5: TSpeedButton
    Left = 594
    Top = 94
    Width = 117
    Height = 23
    Hint = #1048#1085#1089#1090#1088#1091#1082#1094#1080#1103
    Caption = #1048#1085#1089#1090#1088#1091#1082#1094#1080#1103
    Flat = True
    Glyph.Data = {
      9E020000424D9E0200000000000036000000280000000E0000000E0000000100
      18000000000068020000230B0000230B00000000000000000000EBF2EAEBF2EA
      EBF2EAEBF2EAEBF2EAEBF2EA84947BEBF2EAEBF2EAEBF2EAEBF2EAEBF2EAEBF2
      EAEBF2EA0000EBF2EAEBF2EAEBF2EAEBF2EAEBF2EA528C8CD6DEDE84947B9CB5
      9CEBF2EAEBF2EAEBF2EAEBF2EAEBF2EA0000EBF2EAEBF2EAEBF2EAEBF2EA8494
      7B84EFFF8CF7FF9CBDC6CEC6C66B7B6BEBF2EAEBF2EAEBF2EAEBF2EA0000EBF2
      EAEBF2EAEBF2EAEBF2EA5ABDE77BEFF77BEFF773D6FF5ACEEFC6D6DE9C9C9494
      A594EBF2EAEBF2EA0000EBF2EAEBF2EAEBF2EA52849C6BDEFF73E7FF6BDEFF5A
      CEEF63CEFF5ABDF78CB5DEE7DED66B7B6BEBF2EA0000EBF2EAEBF2EA738C8473
      D6FF63C6FF5ACEEF5AD6F763C6FF5ACEEF63B5FF63ADF7639CE7D6E7DEADBDA5
      0000EBF2EA9CB59C63ADF75ABDF75ABDF763C6FF63C6FF5ABDF763BDFF63ADF7
      63ADF7639CF7427BE7BDD6B50000EBF2EA527BAD6BB5FF63ADF75AB5FF63ADF7
      5ABDF763B5FF63ADF763A5FF639CF7528CF79CBDC6EBF2EA000063737B73ADFF
      639CF763A5FF63ADF763ADF763ADFF63A5FF63ADF7639CF7639CF77BA5D6EBF2
      EAEBF2EA00007394E7739CEF739CEF73ADF773ADF773B5FF73ADF773ADF76BA5
      F76394F75A8CD6EBF2EAEBF2EAEBF2EA00007B9CD67BA5D694B5EF94B5EF94BD
      EF9CC6F79CBDE79CC6F79CBDE79CBDE7BDCEB5EBF2EAEBF2EAEBF2EA0000EBF2
      EAB5CED68CB5DEADCEEFB5CEF7B5CEF7B5D6F7BDD6F7FFFFFF94A594EBF2EAEB
      F2EAEBF2EAEBF2EA0000EBF2EAEBF2EAEBF2EAC6D6DEC6DEEFD6E7F7D6E7F7FF
      FFFFFFFFFFB5C6B5EBF2EAEBF2EAEBF2EAEBF2EA0000EBF2EAEBF2EAEBF2EAEB
      F2EAD6DEDEFFFFFFD6DEDEFFFFFFB5C6B5EBF2EAEBF2EAEBF2EAEBF2EAEBF2EA
      0000}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton5Click
  end
  object Bevel1: TBevel
    Left = 5
    Top = 128
    Width = 1002
    Height = 2
    Anchors = [akLeft, akTop, akRight]
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 1011
    Height = 31
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object lbName: TLabel
      Left = 10
      Top = 7
      Width = 986
      Height = 17
      AutoSize = False
      Caption = 'lbName'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
  end
  object BitBtn1: TBitBtn
    Left = 865
    Top = 660
    Width = 140
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
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
  object pn1: TPanel
    Left = 5
    Top = 134
    Width = 781
    Height = 130
    BevelOuter = bvNone
    Color = clSilver
    TabOrder = 2
    DesignSize = (
      781
      130)
    object im1: TImage
      Left = 0
      Top = 0
      Width = 781
      Height = 26
      Hint = 
        #1055#1086#1083#1085#1086#1077' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1077' '#1089#1086#1089#1090#1072#1074#1072' '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1093' '#1074#1077#1097#1077#1089#1090#1074', '#1080#1093' '#1076#1086#1079#1080#1088#1086#1074#1082#1080' '#1080' '#1092#1086 +
        #1088#1084#1099' '#1074#1099#1087#1091#1089#1082#1072
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
    end
    object lb1: TLabel
      Left = 28
      Top = 5
      Width = 114
      Height = 16
      Hint = 
        #1055#1086#1083#1085#1086#1077' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1077' '#1089#1086#1089#1090#1072#1074#1072' '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1093' '#1074#1077#1097#1077#1089#1090#1074', '#1080#1093' '#1076#1086#1079#1080#1088#1086#1074#1082#1080' '#1080' '#1092#1086 +
        #1088#1084#1099' '#1074#1099#1087#1091#1089#1082#1072
      Caption = #1055#1086#1083#1085#1099#1081' '#1072#1085#1072#1083#1086#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label1: TLabel
      Left = 344
      Top = 7
      Width = 431
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 
        #1055#1086#1083#1085#1086#1077' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1077' '#1089#1086#1089#1090#1072#1074#1072' '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1093' '#1074#1077#1097#1077#1089#1090#1074', '#1080#1093' '#1076#1086#1079#1080#1088#1086#1074#1082#1080' '#1080' '#1092#1086 +
        #1088#1084#1099' '#1074#1099#1087#1091#1089#1082#1072
      Transparent = True
    end
    object cb1: TCheckBox
      Tag = 1
      Left = 8
      Top = 7
      Width = 12
      Height = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = cb1Click
    end
    object dbg1: TDBGrid
      Left = 1
      Top = 26
      Width = 779
      Height = 103
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Color = 14676983
      DataSource = DM.srA1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbg1DrawColumnCell
      OnDblClick = dbg1DblClick
      OnKeyDown = dbg1KeyDown
      OnKeyPress = dbg1KeyPress
      OnTitleClick = dbg1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Art_Code'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Names'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 475
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cenaup'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072' '#1079#1072' '#1091#1087#1072#1082'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 90
          Visible = True
        end>
    end
  end
  object pn2: TPanel
    Left = 5
    Top = 266
    Width = 781
    Height = 150
    BevelOuter = bvNone
    Color = clSilver
    TabOrder = 3
    DesignSize = (
      781
      150)
    object im2: TImage
      Left = 0
      Top = 1
      Width = 781
      Height = 25
      Hint = #1057#1086#1074#1087#1072#1076#1077#1085#1080#1077' '#1089#1086#1089#1090#1072#1074#1072' '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1093' '#1074#1077#1097#1077#1089#1090#1074' '#1080' '#1080#1093' '#1076#1086#1079#1080#1088#1086#1074#1082#1080
      ParentShowHint = False
      ShowHint = True
    end
    object lb2: TLabel
      Left = 28
      Top = 5
      Width = 247
      Height = 16
      Hint = #1057#1086#1074#1087#1072#1076#1077#1085#1080#1077' '#1089#1086#1089#1090#1072#1074#1072' '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1093' '#1074#1077#1097#1077#1089#1090#1074' '#1080' '#1080#1093' '#1076#1086#1079#1080#1088#1086#1074#1082#1080
      Caption = #1040#1085#1072#1083#1086#1075' '#1074' '#1076#1088#1091#1075#1080#1093' '#1092#1086#1088#1084#1072#1093' '#1074#1099#1087#1091#1089#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label11: TLabel
      Left = 469
      Top = 7
      Width = 303
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1074#1087#1072#1076#1077#1085#1080#1077' '#1089#1086#1089#1090#1072#1074#1072' '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1093' '#1074#1077#1097#1077#1089#1090#1074' '#1080' '#1080#1093' '#1076#1086#1079#1080#1088#1086#1074#1082#1080
      Transparent = True
    end
    object cb2: TCheckBox
      Tag = 2
      Left = 8
      Top = 7
      Width = 12
      Height = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = cb1Click
    end
    object dbg2: TDBGrid
      Left = 1
      Top = 26
      Width = 779
      Height = 123
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Color = 14020596
      DataSource = DM.srA2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbg1DrawColumnCell
      OnDblClick = dbg1DblClick
      OnKeyDown = dbg1KeyDown
      OnKeyPress = dbg1KeyPress
      OnTitleClick = dbg1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Art_Code'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Names'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 475
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cenaup'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072' '#1079#1072' '#1091#1087#1072#1082'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 90
          Visible = True
        end>
    end
  end
  object pn3: TPanel
    Left = 5
    Top = 417
    Width = 781
    Height = 170
    BevelOuter = bvNone
    Color = clSilver
    TabOrder = 4
    DesignSize = (
      781
      170)
    object Im3: TImage
      Left = 0
      Top = 1
      Width = 781
      Height = 25
      Hint = #1055#1088#1077#1087#1072#1088#1072#1090#1099' '#1074#1093#1086#1076#1103#1097#1080#1077' '#1074' '#1086#1076#1085#1091' '#1082#1083#1072#1089#1089#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1091#1102' '#1075#1088#1091#1087#1087#1091' '#1040#1058#1057
      ParentShowHint = False
      ShowHint = True
    end
    object lb3: TLabel
      Left = 28
      Top = 5
      Width = 388
      Height = 16
      Hint = #1055#1088#1077#1087#1072#1088#1072#1090#1099' '#1074#1093#1086#1076#1103#1097#1080#1077' '#1074' '#1086#1076#1085#1091' '#1082#1083#1072#1089#1089#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1091#1102' '#1075#1088#1091#1087#1087#1091' '#1040#1058#1057
      Caption = #1055#1088#1077#1087#1072#1088#1072#1090#1099' '#1089#1086' '#1089#1093#1086#1076#1085#1099#1084' '#1090#1077#1088#1072#1087#1077#1074#1090#1080#1095#1077#1089#1082#1080#1084' '#1101#1092#1092#1077#1082#1090#1086#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label14: TLabel
      Left = 459
      Top = 7
      Width = 313
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = #1055#1088#1077#1087#1072#1088#1072#1090#1099' '#1074#1093#1086#1076#1103#1097#1080#1077' '#1074' '#1086#1076#1085#1091' '#1082#1083#1072#1089#1089#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1091#1102' '#1075#1088#1091#1087#1087#1091' '#1040#1058#1057
      Transparent = True
    end
    object cb3: TCheckBox
      Tag = 3
      Left = 8
      Top = 7
      Width = 12
      Height = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = cb1Click
    end
    object dbg3: TDBGrid
      Left = 1
      Top = 26
      Width = 779
      Height = 143
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Color = 13167344
      DataSource = DM.srA3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbg1DrawColumnCell
      OnDblClick = dbg1DblClick
      OnKeyDown = dbg1KeyDown
      OnKeyPress = dbg1KeyPress
      OnTitleClick = dbg1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Art_Code'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Names'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 475
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kol'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cena'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cenaup'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072' '#1079#1072' '#1091#1087#1072#1082'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 90
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 33
    Width = 402
    Height = 90
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 5
    DesignSize = (
      402
      90)
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 400
      Height = 88
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Color = 16119285
      DataSource = DM.srVeshestva
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'Descr'
          Title.Alignment = taCenter
          Title.Caption = #1042#1077#1097#1077#1089#1090#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGreen
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 275
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Kol'
          Title.Alignment = taCenter
          Title.Caption = #1044#1086#1079#1080#1088#1086#1074#1082#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGreen
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 109
          Visible = True
        end>
    end
  end
  object pnv1: TPanel
    Left = 790
    Top = 133
    Width = 215
    Height = 130
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 6
    Visible = False
    DesignSize = (
      215
      130)
    object Label18: TLabel
      Left = 3
      Top = 85
      Width = 57
      Height = 13
      Caption = #1060#1088#1084'. '#1074#1099#1087'.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 3
      Top = 100
      Width = 57
      Height = 13
      Caption = #1042#1077#1097'. ('#1083#1072#1090'.):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBText5: TDBText
      Left = 65
      Top = 85
      Width = 146
      Height = 13
      DataField = 'forma'
      DataSource = DM.srvA1
    end
    object DBText8: TDBText
      Left = 65
      Top = 100
      Width = 146
      Height = 28
      DataField = 'veshestvoen'
      DataSource = DM.srvA1
      WordWrap = True
    end
    object DBGrid2: TDBGrid
      Left = 1
      Top = 1
      Width = 213
      Height = 80
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      Color = 16119285
      DataSource = DM.srvA1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'Descr'
          Title.Alignment = taCenter
          Title.Caption = #1042#1077#1097#1077#1089#1090#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGreen
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Kol'
          Title.Alignment = taCenter
          Title.Caption = #1044#1086#1079#1080#1088#1086#1074#1082#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGreen
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 69
          Visible = True
        end>
    end
  end
  object pnv2: TPanel
    Left = 790
    Top = 266
    Width = 215
    Height = 150
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 7
    Visible = False
    DesignSize = (
      215
      150)
    object Label20: TLabel
      Left = 3
      Top = 105
      Width = 57
      Height = 13
      Caption = #1060#1088#1084'. '#1074#1099#1087'.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 3
      Top = 120
      Width = 57
      Height = 13
      Caption = #1042#1077#1097'. ('#1083#1072#1090'.):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBText9: TDBText
      Left = 65
      Top = 105
      Width = 146
      Height = 13
      DataField = 'forma'
      DataSource = DM.srvA2
    end
    object DBText10: TDBText
      Left = 65
      Top = 120
      Width = 146
      Height = 28
      DataField = 'veshestvoen'
      DataSource = DM.srvA2
      WordWrap = True
    end
    object DBGrid3: TDBGrid
      Left = 1
      Top = 1
      Width = 213
      Height = 100
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      Color = 16119285
      DataSource = DM.srvA2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'Descr'
          Title.Alignment = taCenter
          Title.Caption = #1042#1077#1097#1077#1089#1090#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGreen
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Kol'
          Title.Alignment = taCenter
          Title.Caption = #1044#1086#1079#1080#1088#1086#1074#1082#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGreen
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 69
          Visible = True
        end>
    end
  end
  object pnv3: TPanel
    Left = 790
    Top = 417
    Width = 215
    Height = 169
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 8
    Visible = False
    DesignSize = (
      215
      169)
    object Label22: TLabel
      Left = 3
      Top = 125
      Width = 57
      Height = 13
      Caption = #1060#1088#1084'. '#1074#1099#1087'.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 3
      Top = 140
      Width = 57
      Height = 13
      Caption = #1042#1077#1097'. ('#1083#1072#1090'.):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBText11: TDBText
      Left = 65
      Top = 125
      Width = 146
      Height = 13
      DataField = 'forma'
      DataSource = DM.srvA3
    end
    object DBText12: TDBText
      Left = 65
      Top = 140
      Width = 146
      Height = 28
      DataField = 'veshestvoen'
      DataSource = DM.srvA3
      WordWrap = True
    end
    object DBGrid4: TDBGrid
      Left = 1
      Top = 1
      Width = 213
      Height = 120
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      Color = 16119285
      DataSource = DM.srvA3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'Descr'
          Title.Alignment = taCenter
          Title.Caption = #1042#1077#1097#1077#1089#1090#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGreen
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Kol'
          Title.Alignment = taCenter
          Title.Caption = #1044#1086#1079#1080#1088#1086#1074#1082#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGreen
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 69
          Visible = True
        end>
    end
  end
end
