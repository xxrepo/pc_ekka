object BlockingF: TBlockingF
  Left = 782
  Top = 287
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'BlockingF'
  ClientHeight = 134
  ClientWidth = 394
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
    394
    134)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 10
    Width = 225
    Height = 13
    Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1079#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085#1072' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1084':'
  end
  object Label2: TLabel
    Left = 235
    Top = 10
    Width = 126
    Height = 13
    AutoSize = False
    Caption = 'User'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 4
    Top = 32
    Width = 387
    Height = 2
    Anchors = [akLeft, akTop, akRight]
  end
  object Image1: TImage
    Left = 366
    Top = 4
    Width = 24
    Height = 24
    Anchors = [akTop, akRight]
    AutoSize = True
    Picture.Data = {
      07544269746D617096010000424D960100000000000076000000280000001800
      000018000000010004000000000020010000E30E0000E30E0000100000001000
      0000293931003141360037454200394C520042524A00425656004A525200FF00
      FF004D6454004F656B00446578005A7A8800628AA000639BB8007BB3C800B8E8
      EF00777777993AAAAB7777777777777779AAAAAADDB777777777777783A5AAAB
      CDFC77777777777743AAAABDDDFFCB777777777763AAAABCDDFFFFC777777777
      45AAAACCDDEFFFEB7777777765AAAABCDEFFFFFC7777777745AAAACCDDEFFFFC
      7777777769AABABDDEFFFFED7777777799AACDCDDEEFFFED777777779BBBCDDD
      DEFFFFEC777777779BB19EDDDDEFFFEC7777777784418EEEDDACFFEC77777777
      7881BEEEDDBCAEEC7777777777C18BBDEDC22CDC7777777777C8677BBDB10CDB
      7777777777C187777BC10CC77777777777C11777777117777777777777C18877
      777107777777777777E811877771277777777777777E148C7781277777777777
      7777E1198E8477777777777777777E8C89977777777777777777777777777777
      7777}
    Transparent = True
  end
  object Label3: TLabel
    Left = 50
    Top = 45
    Width = 293
    Height = 13
    Caption = #1044#1083#1103' '#1088#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080', '#1074#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100' '#1101#1090#1086#1075#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  end
  object Label4: TLabel
    Left = 50
    Top = 75
    Width = 49
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 99
    Top = 72
    Width = 246
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    OnKeyDown = Edit1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 21
    Top = 105
    Width = 86
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1050
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 111
    Top = 105
    Width = 136
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1084#1077#1085#1072' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103'...'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 251
    Top = 105
    Width = 123
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1047#1072#1074#1077#1088#1096#1077#1085#1080#1077' '#1088#1072#1073#1086#1090#1099
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object ActionList1: TActionList
    Left = 355
    Top = 45
    object ActClose: TAction
      Caption = 'ActClose'
      ShortCut = 32883
      OnExecute = ActCloseExecute
    end
  end
end
