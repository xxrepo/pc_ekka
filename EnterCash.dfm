object FormEnterCash: TFormEnterCash
  Left = 504
  Top = 95
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076' '#1089#1091#1084#1084#1099
  ClientHeight = 115
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    320
    115)
  PixelsPerInch = 96
  TextHeight = 13
  object lblSurname: TLabel
    Left = 10
    Top = 10
    Width = 197
    Height = 19
    Caption = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1089#1090#1074#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edSumCash: TLabeledEdit
    Left = 10
    Top = 50
    Width = 300
    Height = 21
    EditLabel.Width = 223
    EditLabel.Height = 13
    EditLabel.Caption = #1042#1074#1077#1076#1080#1090#1077' '#1089#1091#1084#1084#1091' '#1074#1077#1095#1077#1088#1085#1077#1075#1086' '#1080#1079#1098#1103#1090#1080#1103' '#1080#1079' '#1082#1072#1089#1089#1099
    TabOrder = 0
    OnKeyPress = edSumCashKeyPress
  end
  object BtnSelect: TButton
    Left = 80
    Top = 80
    Width = 80
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    TabOrder = 1
    OnClick = BtnSelectClick
  end
  object BtnCancel: TButton
    Left = 160
    Top = 80
    Width = 80
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
end
