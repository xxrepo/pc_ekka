object PilotF: TPilotF
  Left = 306
  Top = 187
  Width = 1139
  Height = 693
  Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1087#1080#1083#1086#1090#1085#1086#1084#1091' '#1087#1088#1086#1077#1082#1090#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1131
    Height = 636
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnColExit = DBGrid1ColExit
    Columns = <
      item
        Expanded = False
        FieldName = 'date_chek'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1095#1077#1082#1072
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numb_chek'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1063#1077#1082#1072
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mnn'
        Title.Alignment = taCenter
        Title.Caption = #1052#1053#1053
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pacient'
        Title.Alignment = taCenter
        Title.Caption = #1055#1072#1094#1080#1077#1085#1090
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'names'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 261
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sostav'
        Title.Alignment = taCenter
        Title.Caption = #1057#1086#1089#1090#1072#1074
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'formaen'
        Title.Alignment = taCenter
        Title.Caption = #1060#1086#1088#1084#1072' '#1074#1099#1087'.'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'koef'
        Title.Alignment = taCenter
        Title.Caption = #1045#1076'. '#1074' '#1091#1087'.'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KolUp'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'. '#1091#1087'.'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'medname'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1083#1080#1082#1083#1080#1085#1080#1082#1072
        Width = 191
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Tag = 1
    Left = 0
    Top = 640
    Width = 181
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100' '#1086#1090#1095#1077#1090#1072' ('#1056#1077#1077#1089#1090#1088')'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Tag = 2
    Left = 185
    Top = 640
    Width = 181
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100' '#1086#1090#1095#1077#1090#1072' ('#1040#1082#1090' '#1089#1074#1077#1088#1082#1080')'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Edit1: TEdit
    Left = 500
    Top = 641
    Width = 218
    Height = 21
    TabOrder = 3
  end
  object BitBtn3: TBitBtn
    Left = 723
    Top = 639
    Width = 94
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object qrPilot: TADOQuery
    Connection = DM.ADOCo
    CursorType = ctStatic
    CommandTimeout = 150
    Parameters = <>
    SQL.Strings = (
      'select a.date_chek ,         '
      '       a.numb_chek ,     '
      '       p.mnn     ,        '
      '       a.pacient     ,        '
      '       b.names     , '
      '       f.sostav  ,              '
      '       f.formaen ,             '
      '       k.koef    ,               '
      
        '      convert(numeric(8,2) ,Sum(convert(numeric(8,2),a.kol)/k.ko' +
        'ef)) as KolUp, '
      '       p.cena , Sum(a.kol*p.cena) as Summa,     '
      '       a.medname,                                   '
      '       a.id_kassa, Max(a.row_id) as row_id'
      
        '                                                                ' +
        '                          '
      
        'from ArhCheks a,                                                ' +
        '                                                           '
      
        '     SprPilot p,                                                ' +
        '                                                           '
      
        '     SprTov b left join Inform..SprFormV f on b.art_code=f.art_c' +
        'ode left join Inform..SprKoef k on b.art_code=k.art_code   '
      
        'where a.kod_name=b.kod_name and p.art_code=b.art_code and       ' +
        '                                                           '
      '      IsNull(cena_pilot,0)>0 and   '
      
        '      date_chek between '#39'2013-05-13 00:00:00'#39' and '#39'2013-05-30 23' +
        ':59:59'#39'   '
      
        'group by a.date_chek,a.numb_chek,p.mnn,b.names,f.sostav,f.formae' +
        'n,a.medname,k.koef,p.cena,a.pacient,a.id_kassa '
      
        'order by 1                                                      ' +
        '                          ')
    Left = 75
    Top = 135
    object qrPilotdate_chek: TDateTimeField
      FieldName = 'date_chek'
    end
    object qrPilotnumb_chek: TIntegerField
      FieldName = 'numb_chek'
    end
    object qrPilotmnn: TStringField
      FieldName = 'mnn'
      Size = 50
    end
    object qrPilotpacient: TStringField
      FieldName = 'pacient'
      Size = 100
    end
    object qrPilotnames: TStringField
      FieldName = 'names'
      Size = 200
    end
    object qrPilotsostav: TStringField
      FieldName = 'sostav'
      Size = 50
    end
    object qrPilotformaen: TStringField
      FieldName = 'formaen'
      Size = 150
    end
    object qrPilotkoef: TSmallintField
      FieldName = 'koef'
    end
    object qrPilotKolUp: TBCDField
      FieldName = 'KolUp'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object qrPilotcena: TBCDField
      FieldName = 'cena'
      Precision = 8
      Size = 2
    end
    object qrPilotSumma: TBCDField
      FieldName = 'Summa'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object qrPilotmedname: TStringField
      FieldName = 'medname'
      Size = 100
    end
    object qrPilotid_kassa: TSmallintField
      FieldName = 'id_kassa'
    end
    object qrPilotrow_id: TIntegerField
      FieldName = 'row_id'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = qrPilot
    OnDataChange = DataSource1DataChange
    Left = 165
    Top = 140
  end
  object Qr: TADOQuery
    Connection = DM.ADOCo
    CommandTimeout = 150
    Parameters = <>
    Left = 75
    Top = 205
  end
end
