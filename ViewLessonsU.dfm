object ViewLessonsF: TViewLessonsF
  Left = 523
  Top = 243
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ViewLessonsF'
  ClientHeight = 618
  ClientWidth = 999
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
    999
    618)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 598
    Width = 124
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1057#1087#1080#1089#1086#1082' '#1074#1080#1076#1077#1086#1091#1088#1086#1082#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbList: TComboBox
    Left = 135
    Top = 594
    Width = 173
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akBottom]
    ItemHeight = 13
    TabOrder = 0
    OnCloseUp = cbListCloseUp
  end
  object Panel1: TPanel
    Left = 1
    Top = 2
    Width = 997
    Height = 588
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
end
