object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 268
  Top = 101
  Height = 911
  Width = 1652
  object ADOCo: TADOConnection
    CommandTimeout = 300
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    OnExecuteComplete = ADOCoExecuteComplete
    OnWillExecute = ADOCoWillExecute
    Left = 20
    Top = 10
  end
  object Qr: TADOQuery
    Connection = ADOCo
    CommandTimeout = 1500
    Parameters = <>
    Left = 70
    Top = 10
  end
  object QrEx: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 70
    Top = 56
  end
  object srSprTov: TDataSource
    DataSet = spY_FilterSklad
    Left = 1105
    Top = 56
  end
  object qrChek: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'pord'
        Size = -1
        Value = Null
      end
      item
        Name = 'pid'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 3
      end>
    SQL.Strings = (
      'declare @ord smallint'
      ''
      'set @ord=:pord'
      ''
      'select case when a.art_code=4 then 2 else 1 end as nsort,'
      '       a.art_code,'
      '       a.names,'
      '       Max(a.art_name) as art_name,'
      '       Sum(a.kol) as kol,'
      '       IsNull(a.CenaP,a.cena) as cena,'
      '       a.type_tov,'
      '       a.f_nds,'
      '       a.printing,'
      '       a.skd,'
      '       Sum(a.kol*IsNull(a.CenaP,a.cena)) as SumRow,'
      '       Sum(a.sumskd) as SumSkd,'
      '       IsNull(Sum(a.SumSkdK),0) as SumSkdK,'
      '       Sum(a.SumSkdNew) as SumSkdNew,'
      '       Sum(a.SumSpis) as SumSpis,'
      '       Max(a.SkdNew) as SkdNew,'
      '       IsNull(a.CenaP,a.cena) as CenaP,'
      ''
      
        '       Sum(a.SumSkd-(a.kol*a.cena-a.kol*IsNull(a.CenaP,a.cena)))' +
        ' as SumSkdP,'
      ''
      '       Max(b.P1) as P1,'
      '       Max(b.P2) as P2,'
      '       Max(b.P3) as P3,'
      ''
      
        '       IsNull(convert(varchar,Max(b.P1)),'#39#39')+IsNull(Max(b.L1),'#39#39 +
        ') as PL1,'
      
        '       IsNull(convert(varchar,Max(b.P2)),'#39#39')+IsNull(Max(b.L2),'#39#39 +
        ') as PL2,'
      
        '       IsNull(convert(varchar,Max(b.P3)),'#39#39')+IsNull(Max(b.L3),'#39#39 +
        ') as PL3,'
      ''
      '       Max(NumSeriya) as NumSeriya,'
      '       Max(idres) as idres,'
      
        '       case when Max(IsNull(a.id_doctor,0))=0 then 0 else 1 end ' +
        'as IsIApteka'
      ''
      'from Chek a (nolock)'
      '      left join'
      '     Inform..SprReg b (nolock) on a.art_code=b.art_code'
      'where a.compname=host_name() and'
      '      a.id_user=:pid'
      
        'group by a.art_code,a.names,a.CenaP,a.cena,a.f_nds,a.type_tov,a.' +
        'printing,a.skd'
      'order by 1,'
      '         case when @ord=1 then a.names   else null end,'
      '         case when @ord=2 then Max(a.id) else null end'
      ''
      '')
    Left = 70
    Top = 102
    object qrCheknames: TStringField
      DisplayWidth = 70
      FieldName = 'names'
      FixedChar = True
      Size = 70
    end
    object qrChekart_name: TStringField
      FieldName = 'art_name'
      ReadOnly = True
      Size = 16
    end
    object qrChekkol: TIntegerField
      FieldName = 'kol'
    end
    object qrChekcena: TBCDField
      FieldName = 'cena'
      DisplayFormat = '# ##0.00'
      Precision = 8
      Size = 2
    end
    object qrChekprinting: TSmallintField
      FieldName = 'printing'
    end
    object qrCheksumrow: TBCDField
      FieldName = 'sumrow'
      ReadOnly = True
      DisplayFormat = '# ##0.00'
      Precision = 19
      Size = 2
    end
    object qrChekf_nds: TSmallintField
      FieldName = 'f_nds'
    end
    object qrChektype_tov: TSmallintField
      FieldName = 'type_tov'
    end
    object qrChekart_code: TIntegerField
      FieldName = 'art_code'
    end
    object qrCheksumskd: TBCDField
      FieldName = 'sumskd'
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object qrChekSumSkdK: TBCDField
      FieldName = 'SumSkdK'
      Precision = 8
      Size = 2
    end
    object qrChekskd: TBCDField
      FieldName = 'skd'
      Precision = 8
      Size = 2
    end
    object qrChekP1: TSmallintField
      FieldName = 'P1'
    end
    object qrChekP2: TSmallintField
      FieldName = 'P2'
    end
    object qrChekP3: TSmallintField
      FieldName = 'P3'
    end
    object qrChekSumSkdNew: TBCDField
      FieldName = 'SumSkdNew'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object qrChekSumSpis: TBCDField
      FieldName = 'SumSpis'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object qrChekSkdNew: TBCDField
      FieldName = 'SkdNew'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object qrChekCenaP: TBCDField
      FieldName = 'CenaP'
      Precision = 8
      Size = 2
    end
    object qrChekSumSkdP: TBCDField
      FieldName = 'SumSkdP'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object qrChekNumSeriya: TStringField
      FieldName = 'NumSeriya'
      ReadOnly = True
      Size = 50
    end
    object qrChekidres: TIntegerField
      FieldName = 'idres'
      ReadOnly = True
    end
    object qrCheknsort: TIntegerField
      FieldName = 'nsort'
      ReadOnly = True
    end
    object qrChekPL1: TStringField
      FieldName = 'PL1'
      ReadOnly = True
      Size = 40
    end
    object qrChekPL2: TStringField
      FieldName = 'PL2'
      ReadOnly = True
      Size = 40
    end
    object qrChekPL3: TStringField
      FieldName = 'PL3'
      ReadOnly = True
      Size = 40
    end
    object qrChekIsIApteka: TIntegerField
      FieldName = 'IsIApteka'
      ReadOnly = True
    end
  end
  object srChek: TDataSource
    DataSet = qrChek
    Left = 1105
    Top = 102
  end
  object spY_EnterKol: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_EnterKol;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@part_code'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@pkol'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@piduser'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@pscan'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@pold_art'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ptm'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@simp'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@fr'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@MDMSkd'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@FIODoctor'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Sklad'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@IsSrok'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@IDRes'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Force'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@NumSeriya'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@cena'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@IsPereuchet'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@id_zam'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_prior'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@cena_obsl'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@idres_np'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_part'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_doctor'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@card_doctor'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = Null
      end
      item
        Name = '@ForBack'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@IsGeptral'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = 0
      end>
    Left = 825
    Top = 10
  end
  object TimerQr: TADOQuery
    Connection = ADOCo
    CommandTimeout = 10
    Parameters = <>
    Left = 70
    Top = 148
  end
  object srOstatCheck: TDataSource
    DataSet = qrOstChk
    Left = 1105
    Top = 148
  end
  object qrOstChk: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      
        'select art_code,kod_name,art_name,type_tov,f_nds,names,ostat,cen' +
        'a,ostat*cena as summ,IsNull(ostat_beg*cena_beg,0)-IsNull((select' +
        ' Sum(kol*cena) as Summa from ArhCheks where kod_name=c.kod_name ' +
        'group by Kod_Name),0) '
      
        '                                 +IsNull((select Sum(kol*cena) a' +
        's Summa from Moves where kod_name=c.kod_name and debcrd=1 group ' +
        'by Kod_Name),0)                   '
      
        '                                 -IsNull((select Sum(kol*cena) a' +
        's Summa from Moves where kod_name=c.kod_name and debcrd=2 group ' +
        'by Kod_Name),0)                   '
      
        '                                 -IsNull((select Sum(kol*cena) a' +
        's Summa from Chek where kod_name=c.kod_name group by Kod_Name),0' +
        ')                                '
      
        '                                 -IsNull((select Sum(kol*cena) a' +
        's Summa from Reserve where kod_name=c.kod_name group by Kod_Name' +
        '),0)                              '
      
        '                                                                ' +
        '                                                                ' +
        '                             '
      
        'as ostat_korr                                                   ' +
        '                                                                ' +
        '                             '
      
        'from SprTov c (nolock)                                          ' +
        '                                                                ' +
        '                             '
      
        'where ostat*cena<>IsNull(ostat_beg*cena_beg,0) -IsNull((select S' +
        'um(kol*cena) as Summa from ArhCheks where kod_name=c.kod_name gr' +
        'oup by Kod_Name),0)                             '
      
        '                                 +IsNull((select Sum(kol*cena) a' +
        's Summa from Moves where kod_name=c.kod_name and debcrd=1 group ' +
        'by Kod_Name),0)                   '
      
        '                                 -IsNull((select Sum(kol*cena) a' +
        's Summa from Moves where kod_name=c.kod_name and debcrd=2 group ' +
        'by Kod_Name),0)                   '
      
        '                                 -IsNull((select Sum(kol*cena) a' +
        's Summa from Chek where kod_name=c.kod_name group by Kod_Name),0' +
        ')                                '
      
        '                                 -IsNull((select Sum(kol*cena) a' +
        's Summa from Reserve where kod_name=c.kod_name group by Kod_Name' +
        '),0)                              ')
    Left = 70
    Top = 198
  end
  object spY_FilterSklad: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_FilterSkladSkd;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ptov'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@pzero'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@porder'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@idu'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@nmFilter'
        Attributes = [paNullable]
        DataType = ftString
        Size = 200
        Value = Null
      end
      item
        Name = '@dvFilter'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@dzFilter'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 4
        Precision = 12
        Value = Null
      end
      item
        Name = '@fvFilter'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@Ext'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@Dnepr'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@OptCena'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@IsFilter'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@IsPilot'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@RaznOpt'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@IsSpisAllOnly'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end>
    Left = 825
    Top = 102
    object spY_FilterSkladArt_Code: TIntegerField
      FieldName = 'Art_Code'
    end
    object spY_FilterSkladNames: TStringField
      DisplayWidth = 200
      FieldName = 'Names'
      ReadOnly = True
      FixedChar = True
      Size = 200
    end
    object spY_FilterSkladF_NDS: TSmallintField
      FieldName = 'F_NDS'
      ReadOnly = True
    end
    object spY_FilterSkladCena: TBCDField
      FieldName = 'Cena'
      ReadOnly = True
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object spY_FilterSkladSkd: TBCDField
      FieldName = 'Skd'
      ReadOnly = True
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object spY_FilterSkladCenaUp: TBCDField
      FieldName = 'CenaUp'
      ReadOnly = True
      DisplayFormat = '#0.00'
      Precision = 19
      Size = 2
    end
    object spY_FilterSkladOstat: TIntegerField
      FieldName = 'Ostat'
      ReadOnly = True
    end
    object spY_FilterSkladIsScan: TIntegerField
      FieldName = 'IsScan'
    end
    object spY_FilterSkladIsMap: TIntegerField
      FieldName = 'IsMap'
      ReadOnly = True
    end
    object spY_FilterSkladSrokSkd: TBCDField
      FieldName = 'SrokSkd'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object spY_FilterSkladType_Tov: TSmallintField
      FieldName = 'Type_Tov'
      ReadOnly = True
    end
    object spY_FilterSkladGr: TIntegerField
      FieldName = 'Gr'
      ReadOnly = True
    end
    object spY_FilterSkladNds: TStringField
      FieldName = 'Nds'
      ReadOnly = True
      Size = 6
    end
    object spY_FilterSkladUpak: TSmallintField
      FieldName = 'Upak'
      ReadOnly = True
    end
    object spY_FilterSkladOstatUp: TBCDField
      FieldName = 'OstatUp'
      ReadOnly = True
      Precision = 8
      Size = 1
    end
    object spY_FilterSkladEndReg: TIntegerField
      FieldName = 'EndReg'
      ReadOnly = True
    end
    object spY_FilterSkladIsAnnot: TWordField
      FieldName = 'IsAnnot'
      ReadOnly = True
    end
    object spY_FilterSkladIsRecipt: TSmallintField
      FieldName = 'IsRecipt'
      ReadOnly = True
    end
    object spY_FilterSkladColor: TIntegerField
      FieldName = 'Color'
      ReadOnly = True
    end
    object spY_FilterSkladOstatSklad: TBCDField
      FieldName = 'OstatSklad'
      ReadOnly = True
      Precision = 8
      Size = 1
    end
    object spY_FilterSkladOstatAptek: TBCDField
      FieldName = 'OstatAptek'
      ReadOnly = True
      Precision = 8
      Size = 1
    end
    object spY_FilterSkladInPrice: TWordField
      FieldName = 'InPrice'
      ReadOnly = True
    end
    object spY_FilterSkladMakeFrom: TIntegerField
      FieldName = 'MakeFrom'
      ReadOnly = True
    end
    object spY_FilterSkladDescr: TStringField
      FieldName = 'Descr'
      ReadOnly = True
      Size = 3000
    end
    object spY_FilterSkladNumSeriya: TStringField
      FieldName = 'NumSeriya'
      ReadOnly = True
      Size = 50
    end
    object spY_FilterSkladKolRes: TIntegerField
      FieldName = 'KolRes'
      ReadOnly = True
    end
    object spY_FilterSkladKolPrih: TBCDField
      FieldName = 'KolPrih'
      ReadOnly = True
      Precision = 8
      Size = 1
    end
    object spY_FilterSkladCenaPrih: TBCDField
      FieldName = 'CenaPrih'
      ReadOnly = True
      Precision = 14
      Size = 2
    end
    object spY_FilterSkladNaklBox: TStringField
      FieldName = 'NaklBox'
      ReadOnly = True
      Size = 12
    end
    object spY_FilterSkladP1: TSmallintField
      FieldName = 'P1'
      ReadOnly = True
    end
    object spY_FilterSkladP2: TSmallintField
      FieldName = 'P2'
      ReadOnly = True
    end
    object spY_FilterSkladP3: TSmallintField
      FieldName = 'P3'
      ReadOnly = True
    end
    object spY_FilterSkladPL1: TStringField
      FieldName = 'PL1'
      ReadOnly = True
      Size = 40
    end
    object spY_FilterSkladPL2: TStringField
      FieldName = 'PL2'
      ReadOnly = True
      Size = 40
    end
    object spY_FilterSkladPL3: TStringField
      FieldName = 'PL3'
      ReadOnly = True
      Size = 40
    end
    object spY_FilterSkladTypeTov: TWordField
      FieldName = 'TypeTov'
      ReadOnly = True
    end
    object spY_FilterSkladNamesUA: TStringField
      FieldName = 'NamesUA'
      Size = 200
    end
    object spY_FilterSkladIsSpisAll: TWordField
      FieldName = 'IsSpisAll'
      ReadOnly = True
    end
    object spY_FilterSkladIsQuarantine: TIntegerField
      FieldName = 'IsQuarantine'
      ReadOnly = True
    end
    object spY_FilterSkladakCena: TBCDField
      FieldName = 'akCena'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object spY_FilterSkladakType: TWordField
      FieldName = 'akType'
      ReadOnly = True
    end
    object spY_FilterSkladsPrioritet: TStringField
      FieldName = 'sPrioritet'
      ReadOnly = True
      Size = 3
    end
  end
  object spY_DelKol: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_DelKol;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@part_code'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@pkol'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@piduser'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@id_kassa'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@simp'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IsSrok'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@idres'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 825
    Top = 148
  end
  object spY_InsertArhCh: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_InsertArhCheks;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@vnumb_chek'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@vkod_name'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@vname'
        Attributes = [paNullable]
        DataType = ftString
        Size = 14
        Value = Null
      end
      item
        Name = '@vkol'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@vcena'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@vkassa_num'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@vtype_tov'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@vid_user'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@vid_kassa'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@vdate_chek'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@vskd'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@vnumcard'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@vvzh'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@IsPrint'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@ASum'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@SSum'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@vsumskd'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@id_doctor'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@card_doctor'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = Null
      end
      item
        Name = '@fransh'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@id_strah'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@nn_polis'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@dt_polis'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@rowid'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@FranshStr'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@TypeChek'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@SumB3'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end>
    Left = 915
    Top = 10
  end
  object spY_GetServerDate: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_GetServerDate;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 915
    Top = 56
  end
  object spY_InsertMoves: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_InsertMoves;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@iddoc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@vnn_nakl'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = Null
      end
      item
        Name = '@vdate_nakl'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@vkod_name'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@vkol'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@vcena'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@vf_nds'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@vt_tov'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@vdebcrd'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 825
    Top = 293
  end
  object spY_InsertJMoves: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_InsertJMoves;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@vnn_nakl'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = Null
      end
      item
        Name = '@vdate_nakl'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@vsumma'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@vt_nakl'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@vpriznak'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 825
    Top = 246
  end
  object srGroups: TDataSource
    Left = 1105
    Top = 198
  end
  object srSKD: TDataSource
    DataSet = qrSKD
    Left = 1155
    Top = 10
  end
  object qrSKD: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      'select * from SKD order by Type_Skd,Summ')
    Left = 125
    Top = 10
    object qrSKDROW_ID: TAutoIncField
      FieldName = 'ROW_ID'
      ReadOnly = True
    end
    object qrSKDType_Skd: TIntegerField
      FieldName = 'Type_Skd'
    end
    object qrSKDSumm: TFloatField
      FieldName = 'Summ'
    end
    object qrSKDSKD: TIntegerField
      FieldName = 'SKD'
    end
    object qrSKDDescr: TStringField
      FieldName = 'Descr'
      FixedChar = True
      Size = 250
    end
    object qrSKDType_Limit: TSmallintField
      FieldName = 'Type_Limit'
    end
  end
  object QrC: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 70
    Top = 246
  end
  object Qr1: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 70
    Top = 293
  end
  object spY_CheckSKD: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_CheckSKD;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@piduser'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@pt_skd'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@pskd'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 10
        Value = Null
      end>
    Left = 825
    Top = 198
  end
  object qrEAN: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 125
    Top = 56
  end
  object srEAN: TDataSource
    DataSet = qrEAN
    Left = 1155
    Top = 56
  end
  object spY_CalcRealiz: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_CalcRealiz'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@pidkassa'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@pdt1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@pdt2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 915
    Top = 102
  end
  object srNaklList: TDataSource
    DataSet = spY_NaklList
    Left = 1155
    Top = 102
  end
  object qrFind: TADOQuery
    Connection = ADOCo
    CommandTimeout = 200
    Parameters = <>
    Left = 125
    Top = 102
  end
  object spY_ShowChek: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_ShowChek'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vzh'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 10
        Value = Null
      end
      item
        Name = '@nch'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@dt'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 915
    Top = 198
    object spY_ShowChekart_code: TIntegerField
      FieldName = 'art_code'
    end
    object spY_ShowCheknames: TStringField
      FieldName = 'names'
      Size = 75
    end
    object spY_ShowChekkod_name: TIntegerField
      FieldName = 'kod_name'
    end
    object spY_ShowChekkol: TIntegerField
      FieldName = 'kol'
    end
    object spY_ShowChekcena: TFloatField
      FieldName = 'cena'
      DisplayFormat = '#0.00'
    end
    object spY_ShowChekskd: TFloatField
      FieldName = 'skd'
    end
    object spY_ShowChekSumSkd: TBCDField
      FieldName = 'SumSkd'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object spY_ShowChekcenap: TBCDField
      FieldName = 'cenap'
      ReadOnly = True
      Precision = 20
      Size = 13
    end
    object spY_ShowChektype_tov: TSmallintField
      FieldName = 'type_tov'
    end
  end
  object srShowChek: TDataSource
    DataSet = spY_ShowChek
    Left = 1105
    Top = 293
  end
  object srChekList: TDataSource
    DataSet = spY_ChekList
    Left = 1105
    Top = 246
  end
  object spY_NaklList: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_NaklList'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@dt1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@dt2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@tn'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@piduser'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@refresh'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 915
    Top = 341
    object spY_NaklListrow_id: TIntegerField
      FieldName = 'row_id'
    end
    object spY_NaklListiddoc: TIntegerField
      FieldName = 'iddoc'
    end
    object spY_NaklListDate_Nakl: TDateTimeField
      FieldName = 'Date_Nakl'
    end
    object spY_NaklListnn_nakl: TStringField
      FieldName = 'nn_nakl'
      Size = 50
    end
    object spY_NaklListdebcrd: TSmallintField
      FieldName = 'debcrd'
    end
    object spY_NaklListf_nds: TSmallintField
      FieldName = 'f_nds'
    end
    object spY_NaklListSumma: TBCDField
      FieldName = 'Summa'
      Precision = 10
      Size = 2
    end
    object spY_NaklListid_user: TSmallintField
      FieldName = 'id_user'
    end
    object spY_NaklListcompname: TWideStringField
      FieldName = 'compname'
      Size = 128
    end
    object spY_NaklListpriznak: TStringField
      FieldName = 'priznak'
      Size = 100
    end
    object spY_NaklListCnt: TIntegerField
      FieldName = 'Cnt'
    end
    object spY_NaklListnumscan: TIntegerField
      FieldName = 'numscan'
    end
    object spY_NaklListf: TIntegerField
      FieldName = 'f'
    end
    object spY_NaklListid_p: TSmallintField
      FieldName = 'id_p'
    end
    object spY_NaklListidpriznak: TSmallintField
      FieldName = 'idpriznak'
    end
    object spY_NaklListmarked: TWordField
      FieldName = 'marked'
    end
    object spY_NaklListObl: TSmallintField
      FieldName = 'Obl'
    end
    object spY_NaklListDeliveryDate: TDateTimeField
      FieldName = 'DeliveryDate'
    end
    object spY_NaklListid_p_descr: TStringField
      FieldName = 'id_p_descr'
      Size = 30
    end
    object spY_NaklListIsPostav: TStringField
      DisplayWidth = 100
      FieldName = 'IsPostav'
      Size = 100
    end
    object spY_NaklListpriznakI: TIntegerField
      FieldName = 'priznakI'
    end
    object spY_NaklListIsPostavI: TSmallintField
      FieldName = 'IsPostavI'
    end
    object spY_NaklListEANDriver: TStringField
      FieldName = 'EANDriver'
      Size = 13
    end
  end
  object srShowNakl: TDataSource
    DataSet = qrShowNakl
    Left = 1155
    Top = 148
  end
  object spY_NewNakl: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_NewNakl'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@piduser'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@pdn'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@pnn'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end>
    Left = 1005
    Top = 10
  end
  object spY_ReocNakl: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_ReocNakl'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@piduser'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@pnn'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = Null
      end
      item
        Name = '@pdn'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 825
    Top = 341
  end
  object qrNaklInfo: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 125
    Top = 148
  end
  object srNaklInfo: TDataSource
    DataSet = qrNaklInfo
    Left = 1155
    Top = 198
  end
  object spY_Zakaz: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_Zakaz'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@vCountDay'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@vDateZakaz'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 915
    Top = 293
  end
  object qrZakaz: TADOQuery
    Connection = ADOCo
    CursorType = ctStatic
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      
        'select top 1 art_code,Gr,names,ostat,realiz,realiz_period,zakaz,' +
        'realizDay,'
      
        '       type_tov,f_nds,date_zakaz,CountDay,plist,ZAKAZ_OLD,ZAKAZ_' +
        'OLD1,SPS,SummaDay,otkaz,'
      
        '       realiz/2-ostat as Zapas,ZakazAuto,FSwitch,getdate() as En' +
        'dReg,TekOtp,'
      '       convert(varchar(10),'#39#39') as abc_kol,'
      '       convert(varchar(10),'#39#39') as abc_sum'
      'from Zakaz z')
    Left = 125
    Top = 198
    object qrZakazart_code: TIntegerField
      FieldName = 'art_code'
    end
    object qrZakaznames: TStringField
      FieldName = 'names'
      FixedChar = True
      Size = 60
    end
    object qrZakazostat: TIntegerField
      FieldName = 'ostat'
    end
    object qrZakazrealiz: TIntegerField
      FieldName = 'realiz'
    end
    object qrZakazrealiz_period: TIntegerField
      FieldName = 'realiz_period'
    end
    object qrZakazzakaz: TIntegerField
      FieldName = 'zakaz'
    end
    object qrZakazrealizDay: TBCDField
      FieldName = 'realizDay'
      Precision = 8
      Size = 2
    end
    object qrZakaztype_tov: TIntegerField
      FieldName = 'type_tov'
    end
    object qrZakazf_nds: TIntegerField
      FieldName = 'f_nds'
    end
    object qrZakazdate_zakaz: TDateTimeField
      FieldName = 'date_zakaz'
    end
    object qrZakazCountDay: TIntegerField
      FieldName = 'CountDay'
    end
    object qrZakazplist: TIntegerField
      FieldName = 'plist'
    end
    object qrZakazZAKAZ_OLD: TIntegerField
      FieldName = 'ZAKAZ_OLD'
    end
    object qrZakazZAKAZ_OLD1: TIntegerField
      FieldName = 'ZAKAZ_OLD1'
    end
    object qrZakazSPS: TIntegerField
      FieldName = 'SPS'
    end
    object qrZakazSummaDay: TBCDField
      FieldName = 'SummaDay'
      DisplayFormat = '#0.00'
      Precision = 18
      Size = 2
    end
    object qrZakazotkaz: TSmallintField
      FieldName = 'otkaz'
    end
    object qrZakazZapas: TIntegerField
      FieldName = 'Zapas'
      ReadOnly = True
    end
    object qrZakazGr: TSmallintField
      FieldName = 'Gr'
    end
    object qrZakazZakazAuto: TSmallintField
      FieldName = 'ZakazAuto'
    end
    object qrZakazFSwitch: TSmallintField
      FieldName = 'FSwitch'
      ReadOnly = True
    end
    object qrZakazTekOtp: TSmallintField
      FieldName = 'TekOtp'
    end
    object qrZakazEndReg: TDateTimeField
      FieldName = 'EndReg'
      ReadOnly = True
    end
    object qrZakazabc_kol: TStringField
      FieldName = 'abc_kol'
      ReadOnly = True
      Size = 10
    end
    object qrZakazabc_sum: TStringField
      FieldName = 'abc_sum'
      ReadOnly = True
      Size = 10
    end
  end
  object srZakaz: TDataSource
    DataSet = qrZakaz
    Left = 1155
    Top = 246
  end
  object qrOtkaz: TADOQuery
    Connection = ADOCo
    AfterInsert = qrOtkazAfterInsert
    AfterPost = qrOtkazAfterPost
    CommandTimeout = 300
    Parameters = <>
    Left = 125
    Top = 246
  end
  object srOtkaz: TDataSource
    DataSet = qrOtkaz
    Left = 1155
    Top = 293
  end
  object qrNoScan: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 125
    Top = 293
  end
  object srNoScan: TDataSource
    DataSet = qrNoScan
    Left = 1155
    Top = 341
  end
  object qrATC_: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      ''
      
        'select top 1 a.Art_Code,a.Names,Sum(a.ostat) as kol,Max(a.cena) ' +
        'as cena,Max(a.cena) as cenaup, Max(a.type_tov) as type_tov ,Max(' +
        'veshestvo) as veshestvo, Max(forma) as forma,Max(veshestvo) as v' +
        'eshestvoen, Max(forma) as formaen, Max(sostav) as sostav'
      'from SprITC b,'
      
        '     SprTov a left join Inform..SprFormV f on a.art_code=f.art_c' +
        'ode '
      'where a.art_code=b.art_code'
      'group by a.Art_Code,a.Names')
    Left = 70
    Top = 341
    object qrATC_Art_Code: TIntegerField
      FieldName = 'Art_Code'
    end
    object qrATC_Names: TStringField
      FieldName = 'Names'
      Size = 70
    end
    object qrATC_kol: TIntegerField
      FieldName = 'kol'
      ReadOnly = True
    end
    object qrATC_cena: TBCDField
      FieldName = 'cena'
      ReadOnly = True
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object qrATC_type_tov: TSmallintField
      FieldName = 'type_tov'
      ReadOnly = True
    end
    object qrATC_veshestvo: TStringField
      FieldName = 'veshestvo'
      ReadOnly = True
      Size = 200
    end
    object qrATC_sostav: TStringField
      FieldName = 'sostav'
      ReadOnly = True
      Size = 50
    end
    object qrATC_forma: TStringField
      FieldName = 'forma'
      ReadOnly = True
      Size = 150
    end
    object qrATC_veshestvoen: TStringField
      FieldName = 'veshestvoen'
      ReadOnly = True
      Size = 200
    end
    object qrATC_formaen: TStringField
      FieldName = 'formaen'
      ReadOnly = True
      Size = 150
    end
    object qrATC_cenaup: TBCDField
      FieldName = 'cenaup'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
  end
  object srATC: TDataSource
    DataSet = qrATC_
    Left = 1105
    Top = 341
  end
  object qrBack: TADOQuery
    Connection = ADOCo
    AfterInsert = qrBackAfterInsert
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      'select * from TmpVozr')
    Left = 125
    Top = 341
    object qrBackROW_ID: TIntegerField
      FieldName = 'ROW_ID'
    end
    object qrBackDATE_CHEK: TDateTimeField
      FieldName = 'DATE_CHEK'
    end
    object qrBackNUMB_CHEK: TIntegerField
      FieldName = 'NUMB_CHEK'
    end
    object qrBackKOD_NAME: TIntegerField
      FieldName = 'KOD_NAME'
    end
    object qrBackART_CODE: TIntegerField
      FieldName = 'ART_CODE'
    end
    object qrBackNAMES: TStringField
      FieldName = 'NAMES'
      Size = 75
    end
    object qrBackKOL: TIntegerField
      FieldName = 'KOL'
    end
    object qrBackCENA: TBCDField
      FieldName = 'CENA'
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object qrBackKASSA_NUM: TSmallintField
      FieldName = 'KASSA_NUM'
    end
    object qrBackF_NDS: TSmallintField
      FieldName = 'F_NDS'
    end
    object qrBackTYPE_TOV: TSmallintField
      FieldName = 'TYPE_TOV'
    end
    object qrBackID_USER: TSmallintField
      FieldName = 'ID_USER'
    end
    object qrBackID_KASSA: TSmallintField
      FieldName = 'ID_KASSA'
    end
    object qrBackSKD: TBCDField
      FieldName = 'SKD'
      Precision = 8
      Size = 2
    end
    object qrBackNUMCARD: TLargeintField
      FieldName = 'NUMCARD'
    end
    object qrBackSUMSKD: TBCDField
      FieldName = 'SUMSKD'
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object qrBackCENA_SPR: TBCDField
      FieldName = 'CENA_SPR'
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object qrBackCompName: TStringField
      FieldName = 'CompName'
      Size = 50
    end
    object qrBackIsPrint: TWordField
      FieldName = 'IsPrint'
    end
    object qrBackAccumSum: TBCDField
      FieldName = 'AccumSum'
      Precision = 8
      Size = 2
    end
    object qrBackSpisSum: TBCDField
      FieldName = 'SpisSum'
      Precision = 8
      Size = 2
    end
    object qrBackvzh: TLargeintField
      FieldName = 'vzh'
    end
    object qrBackSumRecipt: TBCDField
      FieldName = 'SumRecipt'
      Precision = 12
      Size = 2
    end
    object qrBackTypeRecipt: TWordField
      FieldName = 'TypeRecipt'
    end
    object qrBackid_doctor: TIntegerField
      FieldName = 'id_doctor'
    end
    object qrBackcard_doctor: TStringField
      FieldName = 'card_doctor'
      Size = 13
    end
    object qrBackCenaP: TBCDField
      FieldName = 'CenaP'
      Precision = 8
      Size = 2
    end
    object qrBackSumSkdP: TBCDField
      FieldName = 'SumSkdP'
      Precision = 8
      Size = 2
    end
    object qrBackid_strah: TIntegerField
      FieldName = 'id_strah'
    end
    object qrBackfransh: TBCDField
      FieldName = 'fransh'
      Precision = 12
      Size = 2
    end
    object qrBacknn_polis: TStringField
      FieldName = 'nn_polis'
      Size = 50
    end
    object qrBackdt_polis: TDateTimeField
      FieldName = 'dt_polis'
    end
    object qrBackmedname: TStringField
      FieldName = 'medname'
      Size = 100
    end
    object qrBackcena_pilot: TBCDField
      FieldName = 'cena_pilot'
      Precision = 8
      Size = 2
    end
    object qrBackFranshStr: TBCDField
      FieldName = 'FranshStr'
      Precision = 8
      Size = 2
    end
    object qrBackTypeChek: TWordField
      FieldName = 'TypeChek'
    end
    object qrBackSumB3: TBCDField
      FieldName = 'SumB3'
      Precision = 8
      Size = 3
    end
  end
  object srBack: TDataSource
    DataSet = qrBack
    Left = 1205
    Top = 10
  end
  object qrmtPrih: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 180
    Top = 10
  end
  object srPrih: TDataSource
    DataSet = qrmtPrih
    Left = 1205
    Top = 56
  end
  object qrmtRealiz: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 180
    Top = 148
  end
  object srRealiz: TDataSource
    DataSet = qrmtRealiz
    Left = 1205
    Top = 148
  end
  object qrmtBackKl: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 180
    Top = 102
  end
  object srBackKl: TDataSource
    DataSet = qrmtBackKl
    Left = 1205
    Top = 198
  end
  object srVozr: TDataSource
    DataSet = qrmtVozr
    Left = 1205
    Top = 102
  end
  object qrmtVozr: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 180
    Top = 56
  end
  object qrShowNakl: TADOQuery
    Connection = ADOCo
    CommandTimeout = 0
    Parameters = <
      item
        Name = 'iddoc'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'obl'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 0
      end>
    SQL.Strings = (
      'exec spY_ShowNakl :iddoc, :obl')
    Left = 180
    Top = 198
    object qrShowNaklnn_nakl: TStringField
      FieldName = 'nn_nakl'
      Size = 15
    end
    object qrShowNakldate_nakl: TDateTimeField
      FieldName = 'date_nakl'
    end
    object qrShowNaklnames: TStringField
      FieldName = 'names'
      Size = 70
    end
    object qrShowNaklart_code: TIntegerField
      FieldName = 'art_code'
    end
    object qrShowNaklkol: TIntegerField
      FieldName = 'kol'
      ReadOnly = True
    end
    object qrShowNaklcena: TBCDField
      FieldName = 'cena'
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object qrShowNaklf_nds: TSmallintField
      FieldName = 'f_nds'
    end
    object qrShowNaklPriznak: TSmallintField
      FieldName = 'Priznak'
      ReadOnly = True
    end
    object qrShowNaklisscan: TSmallintField
      FieldName = 'isscan'
    end
    object qrShowNaklbox: TLargeintField
      FieldName = 'box'
      ReadOnly = True
    end
    object qrShowNaklTypeScan: TStringField
      FieldName = 'TypeScan'
      ReadOnly = True
      Size = 23
    end
    object qrShowNaklDtScan: TDateTimeField
      FieldName = 'DtScan'
      ReadOnly = True
    end
    object qrShowNaklUsers: TStringField
      FieldName = 'Users'
      ReadOnly = True
      Size = 50
    end
  end
  object spY_CalcSkd: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_CalcSkd;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@pid_user'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@t_s'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@pskd'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@pnumcard'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@profarma'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@SumP'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@bskd'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@ncMag'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@SumBonus'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@MedName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@TypeCard'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@SumSpis'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@SumCash'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@pskd7'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@NumGeptralCard'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@TypeRecipt'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@id_doctor'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@card_doctor'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = Null
      end
      item
        Name = '@id_doctorAll'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_strah'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@nn_polis'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@dt_polis'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@fransh'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@FIOStrah'
        Attributes = [paNullable]
        DataType = ftString
        Size = 240
        Value = Null
      end
      item
        Name = '@TypeDostStrah'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@FranshPrc'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@numorder'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@SingulArt'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@SingulKol1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@SingulKol2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@OrderID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IsBirth'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NumKsareltoCard'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@SumHeptral'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@TypeChek'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@IsDopl'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@DtRecipt'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@IsKassa'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 1
        Value = 0c
      end>
    Left = 825
    Top = 56
  end
  object spY_WriteChek: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_WriteChek'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@pid_user'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@pnchek'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ptypeopl'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@pid_kassa'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@pvzh'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@dat'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@priznak'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@pVzDescr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 300
        Value = Null
      end
      item
        Name = '@pPayRecipt'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@SumSertif'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@IdRes'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ncRecipt'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@ncStretch'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@ncProf'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@ncMediCard'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@Pacient'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@IDMess'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NewVersion'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@Sum0'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum1'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum2'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum3'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum4'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum5'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum6'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum7'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum8'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum9'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum10'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum11'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@VzhS'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@Fn'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@NumZ'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@TypeEKKA'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@IsPrint'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@TypeCard'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@IsTerminal'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@InvoiceNum'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Merchant'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@MedName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@PacientAdr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@NumRecipt'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@FioDoctor'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@NumGeptralCard'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end
      item
        Name = '@SumDnepr'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@TypeRecipt'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@id_doctor'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@card_doctor'
        Attributes = [paNullable]
        DataType = ftString
        Size = 13
        Value = Null
      end
      item
        Name = '@NumKsareltoCard'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end>
    Left = 915
    Top = 246
  end
  object QrL: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    ParamCheck = False
    Parameters = <>
    Left = 180
    Top = 246
  end
  object srKSumm: TDataSource
    DataSet = QrKSumm
    Left = 1205
    Top = 246
  end
  object QrKSumm: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      
        'select Users, convert(numeric(8,2),Sum(a.kol*a.cena)-IsNull(Sum(' +
        'convert(numeric(8,2),a.kol*a.cena*(a.skd/100.))),0)) as Summa,0 ' +
        'as cnt'
      'from SprUser s,ArhCheks a'
      'where s.id=a.id_user and'
      '      a.date_chek>='#39'2009-04-01 00:00:00'#39' and'
      '      a.date_chek<='#39'2009-04-30 23:59:59'#39
      'group by Users'
      'order by 1')
    Left = 180
    Top = 293
    object QrKSummUsers: TStringField
      FieldName = 'Users'
      Size = 30
    end
    object QrKSummSumma: TBCDField
      FieldName = 'Summa'
      ReadOnly = True
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
  end
  object spY_RealizCHP: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_RealizCHP'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@d1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@d2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 1005
    Top = 56
  end
  object spY_TovRep: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 1000
    ProcedureName = 'spY_TovRep'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@dt1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@dt2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@param'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@calconly'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_user'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 915
    Top = 389
  end
  object qrSumZRep: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 180
    Top = 341
    object qrSumZRepDescr: TStringField
      FieldName = 'Descr'
      ReadOnly = True
    end
    object qrSumZRepSumB: TBCDField
      FieldName = 'SumB'
      ReadOnly = True
      DisplayFormat = '#0.00'
      Precision = 12
      Size = 2
    end
    object qrSumZRepSumK: TBCDField
      FieldName = 'SumK'
      ReadOnly = True
      DisplayFormat = '#0.00'
      Precision = 12
      Size = 2
    end
    object qrSumZRepRazn: TBCDField
      FieldName = 'Razn'
      ReadOnly = True
      DisplayFormat = '#0.00'
      Precision = 12
      Size = 2
    end
  end
  object srSumZRep: TDataSource
    DataSet = qrSumZRep
    Left = 1205
    Top = 293
  end
  object spY_SumZRep: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_SumZRep'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@pdt1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@pdt2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@piduser'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@param'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@idkassa'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@sum'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 10
        Value = Null
      end>
    Left = 915
    Top = 436
  end
  object QrTh: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 70
    Top = 389
  end
  object spY_CheckOst: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_CheckOst'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 825
    Top = 389
  end
  object spY_CutBase: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 1000
    ProcedureName = 'spY_CutBase'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ObrD'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 825
    Top = 436
  end
  object qrSpis: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      'select  top 10 a.art_code,a.names,a.ostat,a.Cena,b.Descr'
      'from SprTov a, Inform..SprMap b')
    Left = 125
    Top = 389
  end
  object srSpis: TDataSource
    DataSet = qrSpis
    Left = 1205
    Top = 341
  end
  object TimerQr1: TADOQuery
    Connection = ADOCo
    CommandTimeout = 10
    Parameters = <>
    Left = 180
    Top = 389
  end
  object srHistory: TDataSource
    DataSet = qrHistory
    Left = 1105
    Top = 389
  end
  object qrHistory: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 70
    Top = 436
  end
  object qrSpr: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    SQL.Strings = (
      'select top 1 a.art_code,b.names,a.kol,b.cena,0 as IsScan,'
      
        '      IsNull(convert(varchar,r.P1),'#39#39#39#39')+IsNull(r.L1,'#39#39#39#39') as PL' +
        '1,'
      
        '      IsNull(convert(varchar,r.P2),'#39#39#39#39')+IsNull(r.L2,'#39#39#39#39') as PL' +
        '2,'
      
        '      IsNull(convert(varchar,r.P3),'#39#39#39#39')+IsNull(r.L3,'#39#39#39#39') as PL' +
        '3'
      ''
      ''
      'from SpisVozr a, SprTov b, Inform..SprReg r'
      'where a.art_code=b.art_code and r.art_code=b.art_code')
    Left = 125
    Top = 436
  end
  object srSpr: TDataSource
    DataSet = qrSpr
    Left = 1155
    Top = 389
  end
  object srList: TDataSource
    DataSet = qrList
    Left = 1205
    Top = 389
  end
  object spY_MakeLt: TADOStoredProc
    Connection = ADOCo
    ProcedureName = 'spY_MakeLt'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@piduser'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@flag'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 1005
    Top = 102
  end
  object qrLT: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    SQL.Strings = (
      'select * from Inform..DHLT')
    Left = 235
    Top = 10
    object qrLTIDDOC: TIntegerField
      FieldName = 'IDDOC'
    end
    object qrLTDATE_NAKL: TDateTimeField
      FieldName = 'DATE_NAKL'
    end
    object qrLTNN_NAKL: TStringField
      FieldName = 'NN_NAKL'
    end
    object qrLTSUMMA: TBCDField
      FieldName = 'SUMMA'
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object qrLTF_NDS: TSmallintField
      FieldName = 'F_NDS'
    end
  end
  object srLT: TDataSource
    DataSet = qrLT
    Left = 1105
    Top = 436
  end
  object qrCancel: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 235
    Top = 56
  end
  object srCancel: TDataSource
    DataSet = qrCancel
    Left = 1155
    Top = 436
  end
  object qrGrafik: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 235
    Top = 102
  end
  object srGrafik: TDataSource
    DataSet = qrGrafik
    Left = 1205
    Top = 436
  end
  object spY_AddGrafik: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 100
    ProcedureName = 'spY_AddGrafik'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@dtStart'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@dtEnd'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@show'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end>
    Left = 1005
    Top = 148
  end
  object qrTab: TADOQuery
    Connection = ADOCo
    CursorType = ctStatic
    CommandTimeout = 100
    Parameters = <>
    SQL.Strings = (
      
        'select row_id,a.id_role,idtab,id_user,users,a.dolgn,a.id_type,d1' +
        '1,d12,d21,d22,d31,d32,d41,d42,d51,d52,d61,d62,d71,d72 ,'
      
        'convert(numeric(8,2),0) as hours,IsDop,a.iszam,a.Dt_Begin,a.Dt_E' +
        'nd'
      'from Inform..DtGrafik a, SprUser b'
      'where a.id_user=b.id and b.reserve=0 and idtab=1')
    Left = 235
    Top = 148
    object qrTabrow_id: TAutoIncField
      FieldName = 'row_id'
      ReadOnly = True
    end
    object qrTabidtab: TIntegerField
      FieldName = 'idtab'
    end
    object qrTabid_user: TSmallintField
      FieldName = 'id_user'
    end
    object qrTabusers: TStringField
      FieldName = 'users'
      Size = 50
    end
    object qrTabdolgn: TStringField
      FieldName = 'dolgn'
      Size = 50
    end
    object qrTabid_type: TSmallintField
      FieldName = 'id_type'
    end
    object qrTabd11: TStringField
      DisplayWidth = 40
      FieldName = 'd11'
      Size = 40
    end
    object qrTabd12: TStringField
      DisplayWidth = 40
      FieldName = 'd12'
      Size = 40
    end
    object qrTabd21: TStringField
      DisplayWidth = 40
      FieldName = 'd21'
      Size = 40
    end
    object qrTabd22: TStringField
      DisplayWidth = 40
      FieldName = 'd22'
      Size = 40
    end
    object qrTabd31: TStringField
      DisplayWidth = 40
      FieldName = 'd31'
      Size = 40
    end
    object qrTabd32: TStringField
      DisplayWidth = 40
      FieldName = 'd32'
      Size = 40
    end
    object qrTabd41: TStringField
      DisplayWidth = 40
      FieldName = 'd41'
      Size = 40
    end
    object qrTabd42: TStringField
      DisplayWidth = 40
      FieldName = 'd42'
      Size = 40
    end
    object qrTabd51: TStringField
      DisplayWidth = 40
      FieldName = 'd51'
      Size = 40
    end
    object qrTabd52: TStringField
      DisplayWidth = 40
      FieldName = 'd52'
      Size = 40
    end
    object qrTabd61: TStringField
      DisplayWidth = 40
      FieldName = 'd61'
      Size = 40
    end
    object qrTabd62: TStringField
      DisplayWidth = 40
      FieldName = 'd62'
      Size = 40
    end
    object qrTabd71: TStringField
      DisplayWidth = 40
      FieldName = 'd71'
      Size = 40
    end
    object qrTabd72: TStringField
      DisplayWidth = 40
      FieldName = 'd72'
      Size = 40
    end
    object qrTabid_role: TSmallintField
      FieldName = 'id_role'
    end
    object qrTabhours: TBCDField
      FieldName = 'hours'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object qrTabIsDop: TSmallintField
      FieldName = 'IsDop'
    end
    object qrTabiszam: TSmallintField
      FieldName = 'iszam'
    end
    object qrTabDt_Begin: TDateTimeField
      FieldName = 'Dt_Begin'
    end
    object qrTabDt_End: TDateTimeField
      FieldName = 'Dt_End'
    end
  end
  object srTab: TDataSource
    DataSet = qrTab
    Left = 1255
    Top = 10
  end
  object spY_ChekList: TADOStoredProc
    Connection = ADOCo
    CursorType = ctStatic
    CommandTimeout = 300
    ProcedureName = 'spY_ChekList'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@dt1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@dt2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@idkassa'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@numbchek'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@numcard'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@names'
        Attributes = [paNullable]
        DataType = ftString
        Size = 200
        Value = Null
      end
      item
        Name = '@user'
        Attributes = [paNullable]
        DataType = ftString
        Size = 35
        Value = Null
      end
      item
        Name = '@Kur'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end>
    Left = 915
    Top = 148
    object spY_ChekListDate_Chek: TDateTimeField
      FieldName = 'Date_Chek'
    end
    object spY_ChekListNumb_Chek: TIntegerField
      FieldName = 'Numb_Chek'
    end
    object spY_ChekListvzh: TBCDField
      FieldName = 'vzh'
      Precision = 10
      Size = 0
    end
    object spY_ChekListNumCard: TLargeintField
      FieldName = 'NumCard'
    end
    object spY_ChekListSumma: TBCDField
      FieldName = 'Summa'
      ReadOnly = True
      DisplayFormat = '#0.00'
      Precision = 32
      Size = 2
    end
    object spY_ChekListSumSkd: TBCDField
      FieldName = 'SumSkd'
      ReadOnly = True
      DisplayFormat = '#0.00'
      Precision = 32
      Size = 2
    end
    object spY_ChekListKassir: TStringField
      FieldName = 'Kassir'
      Size = 30
    end
    object spY_ChekListKassa_Num: TStringField
      FieldName = 'Kassa_Num'
      ReadOnly = True
      Size = 7
    end
    object spY_ChekListSummAll: TBCDField
      FieldName = 'SummAll'
      ReadOnly = True
      Precision = 32
      Size = 2
    end
    object spY_ChekListIsIApteka: TIntegerField
      FieldName = 'IsIApteka'
    end
    object spY_ChekListIsStrah: TIntegerField
      FieldName = 'IsStrah'
    end
    object spY_ChekListkn: TSmallintField
      FieldName = 'kn'
    end
  end
  object qrLTList: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 235
    Top = 198
    object qrLTListart_code: TIntegerField
      FieldName = 'art_code'
    end
    object qrLTListnames: TStringField
      FieldName = 'names'
      Size = 70
    end
    object qrLTListkol: TSmallintField
      FieldName = 'kol'
    end
    object qrLTListcena: TBCDField
      FieldName = 'cena'
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
  end
  object qrNEDList: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 235
    Top = 246
    object qrNEDListart_code: TIntegerField
      FieldName = 'art_code'
    end
    object qrNEDListnames: TStringField
      FieldName = 'names'
      Size = 70
    end
    object qrNEDListkol: TSmallintField
      FieldName = 'kol'
    end
    object qrNEDListcena: TBCDField
      FieldName = 'cena'
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
  end
  object srLTList: TDataSource
    DataSet = qrLTList
    Left = 1255
    Top = 56
  end
  object srNEDList: TDataSource
    DataSet = qrNEDList
    Left = 1255
    Top = 102
  end
  object qrL1: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    SQL.Strings = (
      'select * from Inform..TmpLN')
    Left = 235
    Top = 293
    object IntegerField1: TIntegerField
      FieldName = 'art_code'
    end
    object StringField1: TStringField
      FieldName = 'names'
      Size = 70
    end
    object SmallintField1: TSmallintField
      FieldName = 'kol'
    end
    object BCDField1: TBCDField
      FieldName = 'cena'
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object qrL1ROW_ID: TAutoIncField
      FieldName = 'ROW_ID'
      ReadOnly = True
    end
  end
  object qrN1: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    SQL.Strings = (
      'select * from Inform..TmpLN')
    Left = 235
    Top = 341
    object IntegerField2: TIntegerField
      FieldName = 'art_code'
    end
    object StringField2: TStringField
      FieldName = 'names'
      Size = 70
    end
    object SmallintField2: TSmallintField
      FieldName = 'kol'
    end
    object BCDField2: TBCDField
      FieldName = 'cena'
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object qrN1ROW_ID: TAutoIncField
      FieldName = 'ROW_ID'
      ReadOnly = True
    end
  end
  object srL1: TDataSource
    DataSet = qrL1
    Left = 1255
    Top = 148
  end
  object srN1: TDataSource
    DataSet = qrN1
    Left = 1255
    Top = 198
  end
  object spY_EnterLN: TADOStoredProc
    Connection = ADOCo
    ProcedureName = 'spY_EnterLN'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@dt1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@dt31'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@pr'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@ac'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@nm'
        Attributes = [paNullable]
        DataType = ftString
        Size = 70
        Value = Null
      end
      item
        Name = '@kl'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@cn'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 8
        Value = Null
      end
      item
        Name = '@UpOnly'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@per'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end>
    Left = 1005
    Top = 198
  end
  object qrPPer: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 235
    Top = 389
    object qrPPeridper: TIntegerField
      FieldName = 'idper'
    end
    object qrPPerart_code: TIntegerField
      FieldName = 'art_code'
    end
    object qrPPernames: TStringField
      FieldName = 'names'
      Size = 70
    end
    object qrPPerkol: TIntegerField
      FieldName = 'kol'
    end
    object qrPPercena: TBCDField
      FieldName = 'cena'
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object qrPPerSumma: TBCDField
      FieldName = 'Summa'
      ReadOnly = True
      DisplayFormat = '#0.00'
      Precision = 19
      Size = 2
    end
  end
  object qrPer: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 235
    Top = 436
    object qrPeridper: TIntegerField
      FieldName = 'idper'
    end
    object qrPerart_code: TIntegerField
      FieldName = 'art_code'
    end
    object qrPernames: TStringField
      FieldName = 'names'
      Size = 70
    end
    object qrPerkol: TIntegerField
      FieldName = 'kol'
    end
    object qrPercena: TBCDField
      FieldName = 'cena'
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object qrPerSumma: TBCDField
      FieldName = 'Summa'
      ReadOnly = True
      DisplayFormat = '#0.00'
      Precision = 19
      Size = 2
    end
  end
  object srPPer: TDataSource
    DataSet = qrPPer
    OnDataChange = srPPerDataChange
    Left = 1255
    Top = 246
  end
  object srPer: TDataSource
    DataSet = qrPer
    Left = 1255
    Top = 293
  end
  object spY_AddPeresort: TADOStoredProc
    Connection = ADOCo
    ProcedureName = 'spY_AddPeresort'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@dt1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@dt31'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@pr'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@per'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end>
    Left = 1005
    Top = 246
  end
  object spY_EditPeresort: TADOStoredProc
    Connection = ADOCo
    ProcedureName = 'spY_EditPeresort'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@idper'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 1005
    Top = 293
  end
  object spY_ReocBackClient: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 100
    ProcedureName = 'spY_ReocBackClient'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@piduser'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@vn1'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@pn1'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@vn2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@pn2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@t_tov'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end>
    Left = 1005
    Top = 341
  end
  object spY_CheckBase: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 90
    ProcedureName = 'spY_CheckBase'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@iduser'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@dt7'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@dt1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@idkassa'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@sum'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 10
        Value = Null
      end>
    Left = 1005
    Top = 389
  end
  object qrScript: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 290
    Top = 10
  end
  object qrEx1: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 290
    Top = 56
  end
  object qrSpisNeed: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 290
    Top = 102
  end
  object srSpisNeed: TDataSource
    DataSet = qrSpisNeed
    Left = 1255
    Top = 341
  end
  object spY_MakeSpisVozr: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 900
    ProcedureName = 'spY_MakeSpisVozr'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@FName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 500
        Value = Null
      end
      item
        Name = '@DFile'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 1005
    Top = 436
  end
  object qrVozrSpis: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 290
    Top = 148
    object qrVozrSpisnames: TStringField
      DisplayWidth = 70
      FieldName = 'names'
      FixedChar = True
      Size = 70
    end
    object qrVozrSpiskol: TIntegerField
      FieldName = 'kol'
    end
    object qrVozrSpiscena: TBCDField
      FieldName = 'cena'
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object qrVozrSpisprinting: TSmallintField
      FieldName = 'printing'
    end
    object qrVozrSpissumrow: TBCDField
      FieldName = 'sumrow'
      ReadOnly = True
      DisplayFormat = '#0.00'
      Precision = 19
      Size = 2
    end
    object qrVozrSpisf_nds: TSmallintField
      FieldName = 'f_nds'
    end
    object qrVozrSpisart_code: TIntegerField
      FieldName = 'art_code'
    end
    object qrVozrSpissumskd: TBCDField
      FieldName = 'sumskd'
      Precision = 8
      Size = 2
    end
    object qrVozrSpisSumSkdK: TBCDField
      FieldName = 'SumSkdK'
      Precision = 8
      Size = 2
    end
  end
  object srVozrSpis: TDataSource
    DataSet = qrVozrSpis
    Left = 1255
    Top = 389
  end
  object spY_WriteMessToOffice: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 90
    ProcedureName = 'spY_WriteMessToOffice'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Mess'
        Attributes = [paNullable]
        DataType = ftString
        Size = 8000
        Value = Null
      end
      item
        Name = '@id_dest'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@id_user'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end>
    Left = 1005
    Top = 531
  end
  object qrTmM: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 290
    Top = 198
  end
  object qrArtAdd: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <>
    Left = 290
    Top = 246
  end
  object srSpisArtAdd: TDataSource
    DataSet = qrArtAdd
    Left = 1105
    Top = 484
  end
  object Qr2: TADOQuery
    Connection = ADOCo
    CommandTimeout = 50
    Parameters = <>
    Left = 290
    Top = 293
  end
  object qrActReoc: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <>
    SQL.Strings = (
      'select *,convert(varchar,null) as ForPrint from JActReoc')
    Left = 290
    Top = 341
    object qrActReocIDDOC: TAutoIncField
      FieldName = 'IDDOC'
      ReadOnly = True
    end
    object qrActReocIDVZR: TIntegerField
      FieldName = 'IDVZR'
    end
    object qrActReocIDPRC: TIntegerField
      FieldName = 'IDPRC'
    end
    object qrActReocNN_REOC: TStringField
      FieldName = 'NN_REOC'
      Size = 15
    end
    object qrActReocDATE_REOC: TDateTimeField
      FieldName = 'DATE_REOC'
    end
    object qrActReocSUMVZR: TBCDField
      FieldName = 'SUMVZR'
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object qrActReocSUMPRC: TBCDField
      FieldName = 'SUMPRC'
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object qrActReocForPrint: TStringField
      FieldName = 'ForPrint'
      ReadOnly = True
      Size = 30
    end
    object qrActReocIsPrintCen: TWordField
      FieldName = 'IsPrintCen'
    end
    object qrActReocIsPrintAct: TWordField
      FieldName = 'IsPrintAct'
    end
  end
  object srActReoc: TDataSource
    DataSet = qrActReoc
    Left = 1155
    Top = 484
  end
  object qrList: TADOQuery
    Connection = ADOCo
    CursorType = ctStatic
    AfterInsert = qrListAfterInsert
    CommandTimeout = 100
    Parameters = <>
    SQL.Strings = (
      
        'select t.*,kol*cena as Summa,convert(numeric(8,2),kol*cena*(skd/' +
        '100.)) as SumSkd, convert(smallint,0) as printing,shtrih  ,'
      '      IsNull(convert(varchar,r.P1),'#39#39')+IsNull(r.L1,'#39#39') as PL1,'
      '      IsNull(convert(varchar,r.P2),'#39#39')+IsNull(r.L2,'#39#39') as PL2,'
      '      IsNull(convert(varchar,r.P3),'#39#39')+IsNull(r.L3,'#39#39') as PL3'
      ''
      ''
      'from Inform..Tmp_Spis t, '
      '        Inform..SprReg r'
      'where t.art_code=r.art_code'
      '    ')
    Left = 180
    Top = 436
  end
  object qrUsersAll: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <>
    SQL.Strings = (
      'select * from SprUser '
      'where reserve=1 and (id_type<=100 or id_role=0) and'
      
        '      id_gamma in (select b.id_employee from Inform..d_dept a,In' +
        'form..l_employee_dplace b'
      
        '                   where a.id_apteka=(select convert(int,Value) ' +
        'from Spr_const where Descr='#39'ID_APTEKA'#39') and a.id=b.id_dept and'
      
        '                         date_begin<=getdate() and (date_end is ' +
        'null or (date_end  is not null and date_end>getdate())))'
      'order by users')
    Left = 70
    Top = 484
  end
  object qrUsersApt: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <>
    SQL.Strings = (
      'select * from SprUser'
      'where reserve<>1 and (id_type<=100 or id_role=0)  and id_role<>2'
      'order by users')
    Left = 125
    Top = 484
  end
  object srUsersAll: TDataSource
    DataSet = qrUsersAll
    Left = 1205
    Top = 484
  end
  object srUsersApt: TDataSource
    DataSet = qrUsersApt
    Left = 1255
    Top = 436
  end
  object qrSpisUser: TADOQuery
    Connection = ADOCo
    CommandTimeout = 60
    Parameters = <>
    Left = 290
    Top = 389
  end
  object srSpisUser: TDataSource
    DataSet = qrSpisUser
    Left = 1105
    Top = 10
  end
  object qrMess: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <>
    Left = 180
    Top = 484
  end
  object srMess: TDataSource
    DataSet = qrMess
    Left = 1105
    Top = 531
  end
  object spY_RegPercent: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 100
    ProcedureName = 'spY_RegPercent'
    Parameters = <>
    Left = 1005
    Top = 484
  end
  object srRegPercent: TDataSource
    DataSet = spY_RegPercent
    Left = 1155
    Top = 531
  end
  object qrNonNames: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 290
    Top = 436
  end
  object srNonNames: TDataSource
    DataSet = qrNonNames
    Left = 1255
    Top = 484
  end
  object spY_MakeVedList: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 240
    ProcedureName = 'spY_MakeVedList'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@gr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 825
    Top = 484
  end
  object srVedList: TDataSource
    DataSet = qrVedList
    Left = 1205
    Top = 531
  end
  object qrVedList: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 235
    Top = 484
  end
  object spY_MakeVed: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 120
    ProcedureName = 'spY_MakeVed'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@idv'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 915
    Top = 484
  end
  object QrE: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 290
    Top = 484
  end
  object QrCr: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 70
    Top = 531
  end
  object spY_ReindexBase: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_ReindexBase'
    Parameters = <>
    Left = 825
    Top = 531
  end
  object QrDS: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <>
    Left = 125
    Top = 531
  end
  object Qr3: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <>
    Left = 235
    Top = 531
  end
  object qrSpisObnov: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 290
    Top = 531
  end
  object srSpisObnov: TDataSource
    DataSet = qrSpisObnov
    Left = 1255
    Top = 531
  end
  object qrPList: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <>
    SQL.Strings = (
      'select art_code,names'
      'from PList'
      'where art_code>1 and'
      
        '      art_code not in (select art_code from SprTovar where ostat' +
        '_>0 )'
      ''
      'order by names')
    Left = 70
    Top = 578
  end
  object dsPList: TDataSource
    DataSet = qrPList
    Left = 1105
    Top = 578
  end
  object qrTerap: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      
        'select top 1 a.id,a.id_gr,c.type_tov,c.Art_Code,c.Names,Sum(c.os' +
        'tat) as kol,Max(c.cena) as cena'
      
        'from Inform..DtTerap a, SprTov c                                ' +
        '      '
      ''
      'group by a.id,a.id_gr,c.type_tov,c.Art_Code,c.Names')
    Left = 125
    Top = 578
    object IntegerField3: TIntegerField
      FieldName = 'Art_Code'
    end
    object StringField3: TStringField
      FieldName = 'Names'
      Size = 70
    end
    object IntegerField4: TIntegerField
      FieldName = 'kol'
      ReadOnly = True
    end
    object BCDField3: TBCDField
      FieldName = 'cena'
      ReadOnly = True
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object qrTerapid: TIntegerField
      FieldName = 'id'
    end
    object qrTeraptype_tov: TSmallintField
      FieldName = 'type_tov'
    end
    object qrTerapid_gr: TSmallintField
      FieldName = 'id_gr'
    end
  end
  object srTerap: TDataSource
    DataSet = qrTerap
    Left = 1155
    Top = 578
  end
  object Qr4: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 180
    Top = 578
  end
  object QrB: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 235
    Top = 578
  end
  object qrChVer: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 290
    Top = 578
  end
  object qrCopy: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <>
    Left = 70
    Top = 624
  end
  object QrMessToOff: TADOQuery
    CommandTimeout = 100
    Parameters = <>
    Left = 125
    Top = 624
  end
  object qrSentM: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <>
    Left = 180
    Top = 624
  end
  object srSentM: TDataSource
    DataSet = qrSentM
    Left = 1205
    Top = 578
  end
  object TimerQr2: TADOQuery
    Connection = ADOCo
    CommandTimeout = 60
    Parameters = <>
    Left = 235
    Top = 624
  end
  object QrEx2: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <>
    Left = 180
    Top = 531
  end
  object QrEx4: TADOQuery
    Connection = ADOCo
    CommandTimeout = 900
    Parameters = <>
    Left = 290
    Top = 624
  end
  object spY_AddToReserve: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 90
    ProcedureName = 'spY_AddToReserve;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@fio'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@phone'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_user'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@iddoc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NumZakaz'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Priznak'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@TypeZakaz'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@id_doctor'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 825
    Top = 578
  end
  object srRes: TDataSource
    DataSet = qrRes
    OnDataChange = srResDataChange
    Left = 1255
    Top = 578
  end
  object qrRes: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <>
    Left = 70
    Top = 670
  end
  object qrResPos: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <>
    Left = 125
    Top = 670
  end
  object srResPos: TDataSource
    DataSet = qrResPos
    Left = 1105
    Top = 624
  end
  object QrCa: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <>
    Left = 615
    Top = 624
  end
  object qrShAkcii: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 180
    Top = 670
  end
  object srShAkcii: TDataSource
    DataSet = qrShAkcii
    Left = 1155
    Top = 624
  end
  object qrSertif: TADOQuery
    Connection = ADOCo
    CommandTimeout = 60
    Parameters = <>
    Left = 235
    Top = 670
  end
  object srSertif: TDataSource
    DataSet = qrSertif
    Left = 1205
    Top = 624
  end
  object qrDhAkcii: TADOQuery
    Connection = ADOCo
    CommandTimeout = 60
    Parameters = <>
    Left = 290
    Top = 670
  end
  object qrAArt: TADOQuery
    Connection = ADOCo
    CommandTimeout = 60
    Parameters = <>
    Left = 70
    Top = 717
  end
  object srDhAkcii: TDataSource
    DataSet = qrDhAkcii
    OnDataChange = srDhAkciiDataChange
    Left = 1255
    Top = 624
  end
  object srAArtP: TDataSource
    DataSet = qrAArtP
    OnDataChange = srAArtPDataChange
    Left = 1105
    Top = 670
  end
  object qrAAdd: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 125
    Top = 717
  end
  object sqAAdd: TDataSource
    DataSet = qrAAdd
    Left = 1155
    Top = 670
  end
  object qrDhAkciiP: TADOQuery
    Connection = ADOCo
    CommandTimeout = 60
    Parameters = <>
    Left = 180
    Top = 717
  end
  object srDhAkciiP: TDataSource
    DataSet = qrDhAkciiP
    OnDataChange = srDhAkciiPDataChange
    Left = 1205
    Top = 670
  end
  object srAArt: TDataSource
    DataSet = qrAArt
    OnDataChange = srAArtDataChange
    Left = 1255
    Top = 670
  end
  object qrAArtP: TADOQuery
    Connection = ADOCo
    CommandTimeout = 60
    Parameters = <>
    Left = 235
    Top = 717
  end
  object Qr5: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 290
    Top = 717
  end
  object ADOCoTest: TADOConnection
    CommandTimeout = 300
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security="";Persist Security Inf' +
      'o=False;User ID=sa;Initial Catalog=APTEKA_NET;Data Source=SERGEY' +
      ';Initial File Name="";Server SPN="";'
    ConnectionTimeout = 3
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 20
    Top = 56
  end
  object spY_ClearChek: TADOStoredProc
    Connection = ADOCo
    ProcedureName = 'spY_ClearChek;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@iduser'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 915
    Top = 531
  end
  object qrMBSpis: TADOQuery
    Connection = ADOCo
    CommandTimeout = 200
    Parameters = <>
    SQL.Strings = (
      'select a.art_code,a.names,b.bonus'
      'from SprTov a, Bonuses b'
      'where a.art_code=b.art_code and a.ostat>0'
      'group by a.art_code,a.names,b.bonus'
      'order by 2')
    Left = 343
    Top = 10
  end
  object srMBSpis: TDataSource
    DataSet = qrMBSpis
    Left = 1305
    Top = 10
  end
  object qrDop: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 343
    Top = 56
  end
  object qrDopList: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 343
    Top = 102
  end
  object srDop: TDataSource
    DataSet = qrDop
    OnDataChange = srDopDataChange
    Left = 1305
    Top = 56
  end
  object srDopList: TDataSource
    DataSet = qrDopList
    Left = 1305
    Top = 102
  end
  object qrAvt: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 343
    Top = 148
  end
  object qrAvtList: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 343
    Top = 198
  end
  object srAvt: TDataSource
    DataSet = qrAvt
    Left = 1305
    Top = 148
  end
  object srAvtList: TDataSource
    DataSet = qrAvtList
    Left = 1305
    Top = 198
  end
  object Qr6: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 343
    Top = 246
  end
  object qrATCDop: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <>
    Left = 343
    Top = 293
  end
  object srATCDop: TDataSource
    DataSet = qrATCDop
    Left = 1305
    Top = 246
  end
  object qrScanN: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 343
    Top = 341
  end
  object srScanN: TDataSource
    DataSet = qrScanN
    Left = 1305
    Top = 293
  end
  object qrZamPrep: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 343
    Top = 389
  end
  object srZamPrep: TDataSource
    DataSet = qrZamPrep
    Left = 1305
    Top = 341
  end
  object qrCounters: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 343
    Top = 436
  end
  object srCounters: TDataSource
    DataSet = qrCounters
    OnDataChange = srCountersDataChange
    Left = 1305
    Top = 389
  end
  object qrCountNums: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 343
    Top = 484
  end
  object srCountNums: TDataSource
    DataSet = qrCountNums
    Left = 1305
    Top = 436
  end
  object qrMinus: TADOQuery
    Connection = ADOCo
    CommandTimeout = 60
    Parameters = <>
    Left = 343
    Top = 531
  end
  object srMinus: TDataSource
    DataSet = qrMinus
    Left = 1305
    Top = 484
  end
  object Qr7: TADOQuery
    Connection = ADOCo
    CommandTimeout = 50
    Parameters = <>
    Left = 343
    Top = 578
  end
  object qrNazn: TADOQuery
    Connection = ADOCo
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 343
    Top = 624
  end
  object srNaznSpis: TDataSource
    DataSet = qrNaznSpis
    Left = 1305
    Top = 531
  end
  object qrNaznSpis: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    SQL.Strings = (
      'select pr from SprZamPrem group by pr order by 1')
    Left = 343
    Top = 670
  end
  object Qr8: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 343
    Top = 717
  end
  object qrN: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 70
    Top = 764
  end
  object srN: TDataSource
    DataSet = qrN
    Left = 1305
    Top = 578
  end
  object QrSt: TADOQuery
    CommandTimeout = 100
    Parameters = <>
    Left = 125
    Top = 764
  end
  object qrDB: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=ckj#ktn#djc;Persist Security Info=T' +
      'rue;User ID=admin;Initial Catalog=ekka_net;Data Source=192.168.0' +
      '.9\SQL5'
    CommandTimeout = 100
    Parameters = <>
    SQL.Strings = (
      'exec spY_OstatInSkladBack')
    Left = 180
    Top = 764
  end
  object srDB: TDataSource
    DataSet = qrDB
    Left = 1305
    Top = 624
  end
  object spY_ReindexBases: TADOStoredProc
    Connection = ADOCo
    ProcedureName = 'spY_ReindexBases;1'
    Parameters = <>
    Left = 915
    Top = 578
  end
  object qrMNN: TADOQuery
    Connection = ADOCo
    CursorType = ctStatic
    CommandTimeout = 100
    Parameters = <>
    SQL.Strings = (
      ''
      
        'select * from SprMnn a, SprMnnGroup b where a.id_group=b.id_grou' +
        'p order by a.id_group,a.mnn_ua')
    Left = 235
    Top = 764
  end
  object dsMnn: TDataSource
    DataSet = qrMNN
    Left = 1305
    Top = 670
  end
  object qrMnnList: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 290
    Top = 764
  end
  object dsMnnList: TDataSource
    DataSet = qrMnnList
    Left = 1105
    Top = 717
  end
  object qrWorkTimeK: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 343
    Top = 764
  end
  object srWorkTimeK: TDataSource
    DataSet = qrWorkTimeK
    Left = 1155
    Top = 717
  end
  object qrWorkTimeP: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 70
    Top = 811
  end
  object srWorkTimeP: TDataSource
    DataSet = qrWorkTimeP
    Left = 1205
    Top = 717
  end
  object qrTmW: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 125
    Top = 811
  end
  object qrZpMess: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 180
    Top = 811
  end
  object srZpMess: TDataSource
    DataSet = qrZpMess
    Left = 1255
    Top = 717
  end
  object qrDtPrih: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 235
    Top = 811
  end
  object srDtPrih: TDataSource
    DataSet = qrDtPrih
    Left = 1305
    Top = 717
  end
  object qrPrih: TADOQuery
    CommandTimeout = 100
    Parameters = <>
    Left = 290
    Top = 811
  end
  object srPrih1: TDataSource
    DataSet = qrPrih
    Left = 1355
    Top = 10
  end
  object qrPList1: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    SQL.Strings = (
      'select art_code,names from Plist order by 2')
    Left = 343
    Top = 811
  end
  object srPList1: TDataSource
    DataSet = qrPList1
    Left = 1355
    Top = 56
  end
  object tmprU: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 395
    Top = 10
  end
  object QrEx3: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 395
    Top = 56
  end
  object qrSpisForVozr: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 395
    Top = 102
  end
  object srSpisForVozr: TDataSource
    DataSet = qrSpisForVozr
    Left = 1355
    Top = 102
  end
  object qrMess1: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 395
    Top = 148
  end
  object srMess1: TDataSource
    DataSet = qrMess1
    Left = 1355
    Top = 148
  end
  object QrToOff: TADOQuery
    CommandTimeout = 300
    Parameters = <>
    Left = 395
    Top = 198
  end
  object srQrToOff: TDataSource
    DataSet = QrToOff
    Left = 1355
    Top = 198
  end
  object qrZakazPrice: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 395
    Top = 246
  end
  object srZakazPrice: TDataSource
    DataSet = qrZakazPrice
    Left = 1355
    Top = 246
  end
  object qrResA1: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 395
    Top = 293
  end
  object srResA1: TDataSource
    DataSet = qrResA1
    Left = 1355
    Top = 293
  end
  object TimerQr10: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 395
    Top = 341
  end
  object qrDateZP: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 395
    Top = 389
  end
  object qrZakazP: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 395
    Top = 436
  end
  object qrPlanA1: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 395
    Top = 484
  end
  object srPlanA1: TDataSource
    DataSet = qrPlanA1
    Left = 1355
    Top = 341
  end
  object qrVzRes: TADOQuery
    Connection = ADOCo
    BeforePost = qrVzResBeforePost
    AfterPost = qrVzResAfterPost
    CommandTimeout = 100
    Parameters = <>
    Left = 395
    Top = 531
  end
  object qrDateVZ: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 395
    Top = 578
  end
  object QrG: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 395
    Top = 624
  end
  object qrHozZak: TADOQuery
    Connection = ADOCo
    CursorType = ctStatic
    BeforeInsert = qrHozZakBeforeInsert
    CommandTimeout = 100
    Parameters = <>
    SQL.Strings = (
      'select b.id,a.descr,a.ed,b.kol'
      'from SprHozTov a, HozZakaz b')
    Left = 395
    Top = 670
    object qrHozZakid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qrHozZakdescr: TStringField
      FieldName = 'descr'
      ReadOnly = True
      Size = 150
    end
    object qrHozZaked: TStringField
      FieldName = 'ed'
      ReadOnly = True
      Size = 15
    end
    object qrHozZakkol: TBCDField
      FieldName = 'kol'
      Precision = 10
      Size = 3
    end
  end
  object srHozZak: TDataSource
    DataSet = qrHozZak
    Left = 1355
    Top = 389
  end
  object QrFnd: TADOQuery
    Connection = ADOCo
    CursorType = ctOpenForwardOnly
    CommandTimeout = 100
    Parameters = <>
    Left = 395
    Top = 717
  end
  object spY_AddMessFromApteks: TADOStoredProc
    ProcedureName = 'spY_AddMessFromApteksCall;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Mess'
        Attributes = [paNullable]
        DataType = ftString
        Size = 6999
        Value = Null
      end
      item
        Name = '@Type_mess'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@ID_Apteka'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@Apteka'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@ID_From'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@FIO_From'
        Attributes = [paNullable]
        DataType = ftString
        Size = 150
        Value = Null
      end
      item
        Name = '@Recipient'
        Attributes = [paNullable]
        DataType = ftString
        Size = 150
        Value = Null
      end
      item
        Name = '@id_tema'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_To'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@FIO_To'
        Attributes = [paNullable]
        DataType = ftString
        Size = 150
        Value = Null
      end
      item
        Name = '@ID_Status'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@ID_user_read'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Date_update'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@id'
        Attributes = [paNullable]
        DataType = ftLargeint
        Direction = pdInputOutput
        Precision = 19
        Value = Null
      end
      item
        Name = '@IsExtempore'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end>
    Left = 1005
    Top = 578
  end
  object dsTovInfo: TDataSource
    Left = 1404
    Top = 148
  end
  object spY_MakeVozvratKarantin: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 50
    ProcedureName = 'spY_MakeVozvratKarantin;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@idu'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@Param'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end>
    Left = 825
    Top = 624
  end
  object spY_WriteJournZ: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 60
    ProcedureName = 'spY_WriteJournZ;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@dt'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@pvzh'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@pid_kassa'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@readonly'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@RealizDay'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum0'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum1'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum2'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum3'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum4'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum5'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum6'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum7'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum8'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum9'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum10'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum11'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@VzhS'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@Fn'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@NumZ'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@TypeEKKA'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@DateK'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@Sum12'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum13'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum14'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum15'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end>
    Left = 1005
    Top = 624
  end
  object srTovGrafik: TDataSource
    DataSet = qrTovGrafik
    Left = 1355
    Top = 436
  end
  object qrTovGrafik: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    SQL.Strings = (
      'select top 1'
      
        '       (case when IsNull(D1,0)<>0 then char(13)+'#39#1058#1086#1074#1072#1088#39' else '#39#39' ' +
        'end) as D1,'
      
        '       (case when IsNull(D2,0)<>0 then char(13)+'#39#1058#1086#1074#1072#1088#39' else '#39#39' ' +
        'end) as D2,'
      
        '       (case when IsNull(D3,0)<>0 then char(13)+'#39#1058#1086#1074#1072#1088#39' else '#39#39' ' +
        'end) as D3,'
      
        '       (case when IsNull(D4,0)<>0 then char(13)+'#39#1058#1086#1074#1072#1088#39' else '#39#39' ' +
        'end) as D4,'
      
        '       (case when IsNull(D5,0)<>0 then char(13)+'#39#1058#1086#1074#1072#1088#39' else '#39#39' ' +
        'end) as D5,'
      
        '       (case when IsNull(D6,0)<>0 then char(13)+'#39#1058#1086#1074#1072#1088#39' else '#39#39' ' +
        'end) as D6,'
      
        '       (case when IsNull(D7,0)<>0 then char(13)+'#39#1058#1086#1074#1072#1088#39' else '#39#39' ' +
        'end) as D7'
      'from TovGrafik')
    Left = 395
    Top = 764
  end
  object qrFi: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    SQL.Strings = (
      'select top 1 veshestvo as Descr from Inform..SprFormV')
    Left = 395
    Top = 811
    object qrFiDescr: TStringField
      FieldName = 'Descr'
      Size = 200
    end
  end
  object srFi: TDataSource
    DataSet = qrFi
    Left = 1355
    Top = 484
  end
  object srNoScanV: TDataSource
    DataSet = qrNoScanV
    Left = 1355
    Top = 531
  end
  object qrNoScanV: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <>
    Left = 450
    Top = 717
  end
  object QrCen: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 450
    Top = 764
  end
  object tbGroups: TADOTable
    Connection = ADOCo
    CommandTimeout = 300
    TableName = 'GROUPTOV'
    Left = 1585
    Top = 10
    object tbGroupsTYPE_TOV: TSmallintField
      FieldName = 'TYPE_TOV'
    end
    object tbGroupsDescr: TStringField
      FieldName = 'Descr'
      FixedChar = True
      Size = 50
    end
  end
  object qrTekOtp: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 450
    Top = 10
  end
  object srTekOtp: TDataSource
    DataSet = qrTekOtp
    Left = 1355
    Top = 578
  end
  object qrSrokMov: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <
      item
        Name = 'pdt1'
        Size = -1
        Value = Null
      end
      item
        Name = 'pdt2'
        Size = -1
        Value = Null
      end
      item
        Name = 'pNames'
        Size = -1
        Value = Null
      end
      item
        Name = 'pGr'
        Size = -1
        Value = Null
      end
      item
        Name = 'pMn'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @dt1 datetime, @dt2 datetime'
      ''
      'set @dt1=:pdt1'
      'set @dt2=:pdt2'
      ''
      'select s.art_code as ['#1050#1086#1076'_I_720],'
      '       IsNull(g.gr,5) as ['#1043#1088'. '#1087#1088#1080#1073'._I_540],'
      '       s.names as ['#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'_S_4880],'
      '       lp.Date_Nakl as ['#1055#1086#1089#1083'. '#1087#1088#1080#1093'._S_780],'
      
        '       IsNull(t.ostat,0)-IsNull(m.kolm,0)+IsNull(a.kola,0)-IsNul' +
        'l(m.kolp,0)+IsNull(m.kolv,0)+IsNull(a.kol,0) as ['#1054#1089#1090'. '#1085#1072#1095'._I_570' +
        '],'
      '       IsNull(m.kolp,0) as ['#1055#1088#1080#1093'._I_400],'
      '       IsNull(m.kolv,0) as ['#1042#1086#1079#1088'._I_410],'
      '       IsNull(a.kol,0) as ['#1056#1077#1072#1083#1080#1079'._I_500],'
      
        '       IsNull(t.ostat,0)-IsNull(m.kolm,0)+IsNull(a.kola,0) as ['#1054 +
        #1089#1090'. '#1082#1086#1085'._I_570]'
      ''
      'from SprTovar s (nolock)'
      '      left join'
      '     ('
      '      select s.art_code,'
      
        '             Sum(case when j.type_nakl=1 and j.date_nakl<=@dt2 t' +
        'hen r.kol else 0 end) as kolp,'
      
        '             Sum(case when j.type_nakl=2 and j.date_nakl<=@dt2 t' +
        'hen r.kol else 0 end) as kolv,'
      
        '             Sum(case when j.date_nakl>@dt2 then case j.type_nak' +
        'l when 1 then r.kol else -r.kol end else 0 end) as kolm'
      ''
      '      from rTovar r (nolock),'
      '           jMoves j (nolock),'
      '           SprTov s (nolock)'
      '      where r.kod_name=s.kod_name and'
      '            r.iddoc=j.iddoc and'
      '            j.date_nakl>=@dt1'
      '      group by s.art_code'
      '     ) m on s.art_code=m.art_code'
      '      left join'
      '     ('
      '      select s.art_code,'
      
        '             Sum(case when a.date_chek<=@dt2 then a.kol else 0 e' +
        'nd) as kol,'
      
        '             Sum(case when a.date_chek>@dt2 then a.kol else 0 en' +
        'd) as kola'
      '      from ArhCheks a (nolock),'
      '           SprTov s (nolock)'
      '      where a.kod_name=s.kod_name and'
      '            a.date_chek>=@dt1'
      '      group by s.art_code'
      '     ) a on a.art_code=s.art_code'
      '      left join'
      
        '     (select art_code,Sum(ostat) as ostat from SprTov (nolock) w' +
        'here ostat<>0 group by art_code) t on t.art_code=s.art_code'
      '      left join'
      '     SprGroups g on s.art_code=g.art_code'
      '      left join'
      '     ('
      '      select s.art_code,Max(j.date_nakl) as date_nakl'
      '      from rTovar r (nolock),'
      '           JMoves j (nolock),'
      '           SprTov s (nolock)'
      '      where r.iddoc=j.iddoc and j.type_nakl=1 and'
      '            s.kod_name=r.kod_name'
      '      group by s.art_code'
      '     ) lp on lp.art_code=s.art_code'
      
        'where t.ostat>0 and names like '#39'%([0-9][0-9].[0-9][0-9])%'#39' and s' +
        '.names like :pNames and :pGr like '#39'%'#39'+convert(varchar(2),IsNull(' +
        'g.gr,5))+'#39'%'#39' and'
      
        '      DateDiff(mm,getdate(),convert(datetime,'#39'01.'#39'+substring(s.n' +
        'ames,PatIndex('#39'%([0-9][0-9].[0-9][0-9])%'#39',s.names)+1,5),4))<=:pM' +
        'n'
      'order by s.names')
    Left = 450
    Top = 56
  end
  object srSrokMov: TDataSource
    DataSet = qrSrokMov
    Left = 1355
    Top = 624
  end
  object srQr6: TDataSource
    Left = 1355
    Top = 670
  end
  object qrFolders: TADOQuery
    Connection = ADOCo
    CommandTimeout = 200
    Parameters = <>
    SQL.Strings = (
      'select * from Inform..Folders order by descr')
    Left = 450
    Top = 102
  end
  object qrFiles: TADOQuery
    Connection = ADOCo
    CommandTimeout = 200
    Parameters = <>
    Left = 450
    Top = 148
  end
  object srFolders: TDataSource
    DataSet = qrFolders
    OnDataChange = srFoldersDataChange
    Left = 1404
    Top = 10
  end
  object srFiles: TDataSource
    DataSet = qrFiles
    Left = 1404
    Top = 56
  end
  object qrViolations: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <
      item
        Name = 'pIDU'
        Size = -1
        Value = Null
      end
      item
        Name = 'pP'
        Size = -1
        Value = Null
      end
      item
        Name = 'pP1'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select v.dt,s.Descr,u.Users,v.coment'
      'from Inform..SprViolations s (nolock),'
      '     Inform..Violations v (nolock),'
      '     SprUser u'
      ''
      
        'where u.id_gamma=v.id_gamma and v.id_apteka=(select convert(int,' +
        'Value) from Spr_Const where Descr='#39'ID_APTEKA'#39') and'
      
        '      s.id=cast(v.id_v as varchar(30)) collate SQL_Latin1_Genera' +
        'l_CP1251_CI_AS and'
      '      ((v.id_gamma=:pIDU and 1=:pP) or (0=:pP1))'
      'order by v.dt desc'
      '')
    Left = 450
    Top = 198
  end
  object srViolations: TDataSource
    DataSet = qrViolations
    Left = 1404
    Top = 102
  end
  object QrX: TADOQuery
    Connection = ADOCo
    CommandTimeout = 120
    Parameters = <>
    Left = 450
    Top = 246
  end
  object QrLog: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 450
    Top = 293
  end
  object qrWorkPos: TADOQuery
    Connection = ADOCo
    Parameters = <
      item
        Name = 'idtype'
        Size = -1
        Value = Null
      end
      item
        Name = 'idrole'
        Size = -1
        Value = Null
      end
      item
        Name = 'iszam'
        Size = -1
        Value = Null
      end
      item
        Name = 'iday'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select e.id,e.id_card,(case e.id_day when 1 then '#39#1055#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082#39
      '                                when 2 then '#39#1042#1090#1086#1088#1085#1080#1082#39
      '                                when 3 then '#39#1057#1088#1077#1076#1072#39
      '                                when 4 then '#39#1063#1077#1090#1074#1077#1088#1075#39
      '                                when 5 then '#39#1055#1103#1090#1085#1080#1094#1072#39
      '                                when 6 then '#39#1057#1091#1073#1073#1086#1090#1072#39
      
        '                                when 7 then '#39#1042#1086#1089#1082#1088#1077#1089#1077#1085#1100#1077#39' end) a' +
        's SDay,'
      
        '       convert(varchar,convert(smalldatetime,convert(numeric(15,' +
        '5),e.time_beg)/86400.),8) as time_beg,'
      
        '       convert(varchar,convert(smalldatetime,convert(numeric(15,' +
        '5),e.time_end)/86400.),8) as time_end,'
      '       d.worktime_position_name,'
      '       d.worktime_position_description'
      ''
      'from inform..e_worktime_position e (nolock),'
      '     inform..d_worktime_position d (nolock),'
      '     inform..l_worktime_position l (nolock)'
      ''
      'where d.id=l.id_worktime_position and'
      '      l.id_type=:idtype and'
      '      l.id_role=:idrole and'
      '      l.iszam=:iszam and'
      '      e.id_card=('
      '                 select top 1 id'
      '                 from inform..e_worktime_card_head'
      
        '                 where id_object=inform.dbo.get_dept_id() and ge' +
        'tdate()>date_beg and (date_end is null or date_end>getdate())'
      '                 order by is_temporary desc,personal_days desc'
      
        '                ) and e.id_worktime_position=d.id  and e.id_day=' +
        ':iday'
      'order by e.id_day')
    Left = 450
    Top = 341
  end
  object srWorkPos: TDataSource
    DataSet = qrWorkPos
    Left = 1404
    Top = 198
  end
  object qrUp: TADOQuery
    Connection = ADOCo
    CommandTimeout = 5
    Parameters = <>
    Left = 450
    Top = 389
  end
  object qrDown: TADOQuery
    Connection = ADOCo
    CommandTimeout = 5
    Parameters = <>
    Left = 450
    Top = 436
  end
  object srUp: TDataSource
    DataSet = qrUp
    Left = 1404
    Top = 246
  end
  object srDown: TDataSource
    DataSet = qrDown
    Left = 1404
    Top = 293
  end
  object qrSop: TADOQuery
    Connection = ADOCo
    CommandTimeout = 5
    Parameters = <>
    Left = 450
    Top = 484
  end
  object srSop: TDataSource
    DataSet = qrSop
    Left = 1404
    Top = 341
  end
  object Qr11: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 450
    Top = 531
  end
  object QrZ: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 450
    Top = 578
  end
  object qrAlarm: TADOQuery
    Connection = ADOCo
    Parameters = <
      item
        Name = 'idu'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @id_user smallint'
      ''
      'set @id_user=:idu'
      ''
      
        'if (select Count(*) from Danger where compname=host_name() and i' +
        'd_user=@id_user and Active=1)<=0'
      ' begin'
      '  insert into Danger(active,compname,id_user,dt)'
      '  values(1,host_name(),@id_user,getdate())'
      ' end')
    Left = 450
    Top = 624
  end
  object qrTmA: TADOQuery
    Connection = ADOCo
    Parameters = <
      item
        Name = 'idu'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @id_user smallint'
      ''
      'set @id_user=:idu'
      ''
      
        'select top 1 * from Danger where Not (compname=host_name() and i' +
        'd_user=@id_user) and Active=1'
      '')
    Left = 450
    Top = 670
  end
  object qrA1: TADOQuery
    Connection = ADOCo
    Parameters = <
      item
        Name = 'art'
        Size = -1
        Value = Null
      end
      item
        Name = 'param'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'exec spY_GetAnalog :art, :param')
    Left = 505
    Top = 10
  end
  object qrA2: TADOQuery
    Connection = ADOCo
    Parameters = <
      item
        Name = 'art'
        Size = -1
        Value = Null
      end
      item
        Name = 'param'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'exec spY_GetAnalog :art, :param')
    Left = 505
    Top = 56
  end
  object qrA3: TADOQuery
    Connection = ADOCo
    Parameters = <
      item
        Name = 'art'
        Size = -1
        Value = Null
      end
      item
        Name = 'param'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'exec spY_GetAnalog :art, :param')
    Left = 505
    Top = 102
  end
  object srA1: TDataSource
    DataSet = qrA1
    Left = 1404
    Top = 389
  end
  object srA2: TDataSource
    DataSet = qrA2
    Left = 1404
    Top = 436
  end
  object srA3: TDataSource
    DataSet = qrA3
    Left = 1404
    Top = 484
  end
  object qrVeshestva: TADOQuery
    Connection = ADOCo
    Parameters = <
      item
        Name = 'art'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from Veshestva'
      'where art_code=:art'
      'order by Ord')
    Left = 450
    Top = 811
  end
  object srVeshestva: TDataSource
    DataSet = qrVeshestva
    Left = 1355
    Top = 717
  end
  object qrvA1: TADOQuery
    Connection = ADOCo
    Parameters = <
      item
        Name = 'art'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from Veshestva v'
      '      cross apply'
      
        '     (select top 1 * from Inform..SprFormV f where f.art_code=v.' +
        'art_code) a '
      'where v.art_code=:art'
      'order by Ord')
    Left = 505
    Top = 148
  end
  object qrvA2: TADOQuery
    Connection = ADOCo
    Parameters = <
      item
        Name = 'art'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from Veshestva v'
      '      cross apply'
      
        '     (select top 1 * from Inform..SprFormV f where f.art_code=v.' +
        'art_code) a '
      'where v.art_code=:art'
      'order by Ord'
      '')
    Left = 505
    Top = 198
  end
  object qrvA3: TADOQuery
    Connection = ADOCo
    Parameters = <
      item
        Name = 'art'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from Veshestva v'
      '      cross apply'
      
        '     (select top 1 * from Inform..SprFormV f where f.art_code=v.' +
        'art_code) a '
      'where v.art_code=:art'
      'order by Ord'
      '')
    Left = 505
    Top = 246
  end
  object srvA1: TDataSource
    DataSet = qrvA1
    Left = 1404
    Top = 531
  end
  object srvA2: TDataSource
    DataSet = qrvA2
    Left = 1404
    Top = 578
  end
  object srvA3: TDataSource
    DataSet = qrvA3
    Left = 1404
    Top = 624
  end
  object spY_MakeBackAll: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 300
    ProcedureName = 'spY_MakeBackAll;1'
    Parameters = <>
    Left = 915
    Top = 624
  end
  object qrReestr: TADOQuery
    Connection = ADOCo
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'spY_ShowReestr '#39'2014-12-29'#39','#39'2015-01-01'#39)
    Left = 505
    Top = 293
    object qrReestr_S_700: TLargeintField
      FieldName = #8470' '#1087'/'#1087'_S_700'
      ReadOnly = True
    end
    object qrReestrii_S_4000: TStringField
      FieldName = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1087#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1072' '#1090#1072' '#1085#1086#1084#1077#1088' '#1083'i'#1094#1077#1085#1079'i'#1111'_S_4000'
      ReadOnly = True
      Size = 201
    end
    object qrReestri_S_2200: TStringField
      FieldName = #1053#1086#1084#1077#1088' i '#1076#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1111'_S_2200'
      ReadOnly = True
      Size = 46
    end
    object qrReestrii_S_5000: TStringField
      FieldName = 
        #1053#1072#1079#1074#1072' '#1083'i'#1082#1072#1088#1089#1100#1082#1086#1075#1086' '#1079#1072#1089#1086#1073#1091' '#1090#1072' '#1081#1086#1075#1086' '#1083'i'#1082#1072#1088#1089#1100#1082#1072' '#1092#1086#1088#1084#1072', '#1076#1072#1090#1072' '#1088#1077#1108#1089#1090#1088#1072#1094#1110 +
        #1111' '#1090#1072' '#1085#1086#1084#1077#1088' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1086#1075#1086' '#1087#1086#1089#1074#1110#1076#1095#1077#1085#1085#1103'_S_5000'
      ReadOnly = True
      Size = 331
    end
    object qrReestr_S_2200: TStringField
      FieldName = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1074#1080#1088#1086#1073#1085#1080#1082#1072'_S_2200'
      Size = 100
    end
    object qrReestr_S_1200: TStringField
      FieldName = #1053#1086#1084#1077#1088' '#1089#1077#1088#1110#1111'_S_1200'
      Size = 50
    end
    object qrReestri_S_2100: TStringField
      FieldName = #1053#1086#1084#1077#1088' '#1110' '#1076#1072#1090#1072' '#1089#1077#1088#1090#1080#1092#1110#1082#1072#1090#1072' '#1103#1082#1086#1089#1090'i '#1074#1080#1088#1086#1073#1085#1080#1082#1072'_S_2100'
      Size = 100
    end
    object qrReestrii_N_1900: TBCDField
      FieldName = #1050'i'#1083#1100#1082'i'#1089#1090#1100' '#1086#1076#1077#1088#1078#1072#1085#1080#1093' '#1091#1087#1072#1082#1086#1074#1086#1082'_N_1900'
      ReadOnly = True
      Precision = 8
      Size = 1
    end
    object qrReestriii_S_2100: TDateTimeField
      FieldName = #1058#1077#1088#1084'i'#1085' '#1087#1088#1080#1076#1072#1090#1085#1086#1089#1090'i '#1083'i'#1082#1072#1088#1089#1100#1082#1086#1075#1086' '#1079#1072#1089#1086#1073#1091'_S_2100'
    end
    object qrReestr_S_2600: TStringField
      FieldName = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1091#1087#1086#1074#1085#1086#1074#1072#1078#1077#1085#1085#1086#1102' '#1086#1089#1086#1073#1086#1102'_S_2600'
      ReadOnly = True
      Size = 13
    end
  end
  object srReestr: TDataSource
    DataSet = qrReestr
    Left = 1404
    Top = 670
  end
  object tmrS: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 505
    Top = 341
  end
  object tmrP: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 505
    Top = 389
  end
  object qrSpisNA: TADOQuery
    Connection = ADOCo
    CommandTimeout = 200
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 505
    Top = 436
  end
  object srSpisNA: TDataSource
    DataSet = qrSpisNA
    Left = 1404
    Top = 717
  end
  object Qrtmp: TADOQuery
    Connection = ADOCo
    CommandTimeout = 20
    Parameters = <>
    Left = 505
    Top = 484
  end
  object qrArmour: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 505
    Top = 531
  end
  object srArmour: TDataSource
    DataSet = qrArmour
    Left = 1455
    Top = 10
  end
  object qrArmCh: TADOQuery
    Connection = ADOCo
    Parameters = <
      item
        Name = 'pid'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'select a.art_code,'
      '       a.names,'
      '       Max(a.art_name) as art_name,'
      '       Sum(a.kol) as kol,'
      
        '       convert(numeric(8,1),Sum(a.kol)/convert(numeric(8,1),IsNu' +
        'll(Max(p.Koef),1))) as kolup,'
      '       a.cenap as cena,'
      '       a.type_tov,'
      '       a.f_nds,'
      '       a.printing,'
      '       Sum(a.kol*a.cenap) as SumRow,'
      '       Max(NumSeriya) as NumSeriya'
      ''
      'from Chek a (nolock)'
      '      left join'
      '     Plist p on a.art_code=p.art_code'
      ''
      'where a.compname=host_name() and'
      '      a.id_user=:pid'
      ''
      'group by a.art_code,'
      '         a.names,'
      '         a.cenap,'
      '         a.f_nds,'
      '         a.type_tov,'
      '         a.printing'
      ''
      'order by a.names')
    Left = 505
    Top = 578
  end
  object srArmCh: TDataSource
    DataSet = qrArmCh
    Left = 1455
    Top = 56
  end
  object qrEKKA: TADOQuery
    Connection = ADOCo
    CommandTimeout = 60
    Parameters = <>
    Left = 505
    Top = 624
  end
  object qrJPaySlip: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 505
    Top = 670
  end
  object srJPaySlip: TDataSource
    DataSet = qrJPaySlip
    Left = 1455
    Top = 102
  end
  object qrJPaySlip1: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 505
    Top = 717
  end
  object srJPaySlip1: TDataSource
    DataSet = qrJPaySlip1
    Left = 1455
    Top = 148
  end
  object QrLog1: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 505
    Top = 764
  end
  object spY_WriteJournZ_: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 60
    ProcedureName = 'spY_WriteJournZ_;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@dt'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@pvzh'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@pid_kassa'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@RealizDay'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum0'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum1'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum2'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum3'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum4'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum5'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum6'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum7'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum8'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum9'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum10'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@Sum11'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 2
        Precision = 12
        Value = Null
      end
      item
        Name = '@VzhS'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@Fn'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@NumZ'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@DateK'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 825
    Top = 670
  end
  object qrEKKA1: TADOQuery
    Connection = ADOCo
    CommandTimeout = 60
    Parameters = <>
    Left = 505
    Top = 811
  end
  object qrEKKA2: TADOQuery
    Connection = ADOCo
    CommandTimeout = 60
    Parameters = <>
    Left = 560
    Top = 10
  end
  object QrKSumm1: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    SQL.Strings = (
      
        'select Users, convert(numeric(8,2),Sum(a.kol*a.cena)-IsNull(Sum(' +
        'convert(numeric(8,2),a.kol*a.cena*(a.skd/100.))),0)) as Summa,0 ' +
        'as cnt'
      'from SprUser s,ArhCheks a'
      'where s.id=a.id_user and'
      '      a.date_chek>='#39'2009-04-01 00:00:00'#39' and'
      '      a.date_chek<='#39'2009-04-30 23:59:59'#39
      'group by Users'
      'order by 1')
    Left = 560
    Top = 56
    object StringField4: TStringField
      DisplayWidth = 240
      FieldName = 'Users'
      Size = 240
    end
    object BCDField4: TBCDField
      FieldName = 'Summa'
      ReadOnly = True
      DisplayFormat = '#0.00'
      Precision = 8
      Size = 2
    end
    object QrKSumm1cnt: TIntegerField
      FieldName = 'cnt'
      ReadOnly = True
    end
  end
  object srKSumm1: TDataSource
    DataSet = QrKSumm1
    Left = 1455
    Top = 198
  end
  object qrTMC: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 560
    Top = 102
  end
  object srTMC: TDataSource
    DataSet = qrTMC
    Left = 1455
    Top = 246
  end
  object qrTMCs: TADOQuery
    Connection = ADOCo
    Parameters = <
      item
        Name = 'idu'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select t.id,t.art_code,s.names,s.KodUtp,t.kol'
      'from tmpTMC t (nolock),'
      '     SprTMC s (nolock)'
      'where t.art_code=s.art_code and'
      '      t.compname=host_name() and'
      '      t.id_user=:idu')
    Left = 560
    Top = 148
  end
  object srTMCs: TDataSource
    DataSet = qrTMCs
    Left = 1455
    Top = 293
  end
  object qrReciptList: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 560
    Top = 198
  end
  object srReciptList: TDataSource
    DataSet = qrReciptList
    Left = 1455
    Top = 341
  end
  object srMakeFrom: TDataSource
    DataSet = spY_MakeFromList
    Left = 1455
    Top = 389
  end
  object qrRegDop1: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 560
    Top = 246
  end
  object qrRegDop2: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 560
    Top = 293
  end
  object qrRegDop3: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 560
    Top = 341
  end
  object srRegDop1: TDataSource
    DataSet = qrRegDop1
    Left = 1455
    Top = 436
  end
  object srRegDop2: TDataSource
    DataSet = qrRegDop2
    Left = 1455
    Top = 484
  end
  object srRegDop3: TDataSource
    DataSet = qrRegDop3
    Left = 1455
    Top = 531
  end
  object qrAnalog: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 560
    Top = 389
  end
  object srAnalog: TDataSource
    DataSet = qrAnalog
    Left = 1455
    Top = 578
  end
  object spY_MakeFromList: TADOStoredProc
    Connection = ADOCo
    ProcedureName = 'spY_MakeFromList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@art'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@idu'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end>
    Left = 915
    Top = 670
  end
  object qrSpisArtCena: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 560
    Top = 436
  end
  object srSpisArtCena: TDataSource
    DataSet = qrSpisArtCena
    Left = 1455
    Top = 624
  end
  object qrLgotList: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 560
    Top = 484
  end
  object srLgotList: TDataSource
    DataSet = qrLgotList
    Left = 1455
    Top = 670
  end
  object qrZamZamena: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 560
    Top = 531
  end
  object srZamZamena: TDataSource
    DataSet = qrZamZamena
    Left = 1455
    Top = 717
  end
  object srMode: TDataSource
    Left = 1510
    Top = 10
  end
  object qrDiagnostic: TADOQuery
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'spy_diagnosticrepair 96955,'#39'K'#39)
    Left = 560
    Top = 578
  end
  object srDiagnostic: TDataSource
    DataSet = qrDiagnostic
    Left = 1510
    Top = 56
  end
  object qrRepairRep: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 560
    Top = 624
  end
  object srRepairRep: TDataSource
    DataSet = qrRepairRep
    Left = 1510
    Top = 102
  end
  object QrDiagn: TADOQuery
    Parameters = <>
    Left = 560
    Top = 670
  end
  object qrAkciiList: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 560
    Top = 717
  end
  object srAkciiList: TDataSource
    DataSet = qrAkciiList
    Left = 1510
    Top = 148
  end
  object QrEx5: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 560
    Top = 764
  end
  object qrASpis: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 560
    Top = 811
  end
  object srASpis: TDataSource
    DataSet = qrASpis
    Left = 1510
    Top = 198
  end
  object qrASpis1: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 615
    Top = 10
  end
  object srASpis1: TDataSource
    DataSet = qrASpis1
    Left = 1510
    Top = 246
  end
  object qrSprPart: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 615
    Top = 56
  end
  object srSprPart: TDataSource
    DataSet = qrSprPart
    Left = 1510
    Top = 293
  end
  object qrSprPartCh: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 615
    Top = 102
  end
  object srSprPartCh: TDataSource
    DataSet = qrSprPartCh
    Left = 1510
    Top = 341
  end
  object qrAStatD: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 615
    Top = 148
  end
  object srAStatD: TDataSource
    DataSet = qrAStatD
    Left = 1510
    Top = 389
  end
  object qrTStatD: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 615
    Top = 198
  end
  object srTStatD: TDataSource
    DataSet = qrTStatD
    Left = 1510
    Top = 436
  end
  object qrErr: TADOQuery
    Connection = ADOCo
    CommandTimeout = 50
    Parameters = <>
    Left = 615
    Top = 246
  end
  object spY_AddToReserveExt: TADOStoredProc
    Connection = ADOCoTest
    ProcedureName = 'spY_AddToReserveExt;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@fio'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@phone'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_user'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@iddoc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NumZakaz'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Priznak'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@TypeZakaz'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@id_doctor'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 1005
    Top = 670
  end
  object qrPlanAptStat: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 615
    Top = 293
  end
  object srPlanAptStat: TDataSource
    DataSet = qrPlanAptStat
    Left = 1510
    Top = 484
  end
  object QrX1: TADOQuery
    Connection = ADOCo
    CommandTimeout = 90
    Parameters = <
      item
        Name = 'idato'
        Size = -1
        Value = Null
      end
      item
        Name = 'idafrom'
        Size = -1
        Value = Null
      end
      item
        Name = 'idg'
        Size = -1
        Value = Null
      end
      item
        Name = 'fio'
        Size = -1
        Value = Null
      end
      item
        Name = 'phone'
        Size = -1
        Value = Null
      end
      item
        Name = 'art'
        Size = -1
        Value = Null
      end
      item
        Name = 'kol'
        Size = -1
        Value = Null
      end
      item
        Name = 'cena'
        Size = -1
        Value = Null
      end
      item
        Name = 'id_kassa'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'exec spY_RemoteZakaz :idato,'
      '                     :idafrom,'
      '                     :idg,'
      '                     :fio,'
      '                     :phone,'
      '                     :art,'
      '                     :kol,'
      '                     :cena,'
      '                     :id_kassa'
      ''
      ''
      ''
      '')
    Left = 615
    Top = 341
  end
  object QrX2: TADOQuery
    Connection = ADOCo
    CommandTimeout = 50
    Parameters = <
      item
        Name = 'p1'
        Size = -1
        Value = Null
      end
      item
        Name = 'pfio'
        Size = -1
        Value = Null
      end
      item
        Name = 'pphone'
        Size = -1
        Value = Null
      end
      item
        Name = 'pida'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @res varchar(8000)'
      
        'exec [192.168.0.9\sql5].workwith_gamma.dbo.AVA_FARMACY_Remote_Za' +
        'kaz :p1,1,:pfio,:pphone,:pida, @res output'
      ''
      ''
      ''
      '')
    Left = 615
    Top = 389
  end
  object QrExA: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 615
    Top = 436
  end
  object QrX3: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <
      item
        Name = 'p1'
        Size = -1
        Value = Null
      end
      item
        Name = 'pfio'
        Size = -1
        Value = Null
      end
      item
        Name = 'pphone'
        Size = -1
        Value = Null
      end
      item
        Name = 'pida'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @res varchar(8000)'
      
        'exec [192.168.0.9\sql5].workwith_gamma.dbo.AVA_FARMACY_Remote_Za' +
        'kaz :p1,1,:pfio,:pphone,:pida, @res output'
      ''
      ''
      ''
      '')
    Left = 615
    Top = 484
  end
  object qrAStatD1: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 615
    Top = 531
  end
  object srAStatD1: TDataSource
    DataSet = qrAStatD1
    Left = 1510
    Top = 531
  end
  object qrUserList: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 615
    Top = 578
  end
  object srUserList: TDataSource
    DataSet = qrUserList
    Left = 1510
    Top = 578
  end
  object qrNewReoc: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 615
    Top = 670
  end
  object srNewReoc: TDataSource
    DataSet = qrNewReoc
    Left = 1510
    Top = 624
  end
  object qrReocList: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 615
    Top = 717
  end
  object qrPRep: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 615
    Top = 764
  end
  object qrTotalStat: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 615
    Top = 811
  end
  object srTotalStat: TDataSource
    DataSet = qrTotalStat
    Left = 1510
    Top = 670
  end
  object qrNeedAkt: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 675
    Top = 10
  end
  object srNeedAkt: TDataSource
    DataSet = qrNeedAkt
    Left = 1510
    Top = 717
  end
  object qrCalcPlan: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 675
    Top = 56
  end
  object srCalcPlan: TDataSource
    DataSet = qrCalcPlan
    Left = 1585
    Top = 102
  end
  object qrCalcPlan1: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 675
    Top = 102
  end
  object srCalcPlan1: TDataSource
    DataSet = qrCalcPlan1
    Left = 1585
    Top = 148
  end
  object qrViolationList: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 675
    Top = 148
  end
  object srViolationList: TDataSource
    DataSet = qrViolationList
    Left = 1585
    Top = 198
  end
  object spY_Quarantine: TADOStoredProc
    Connection = ADOCo
    CommandTimeout = 60
    ProcedureName = 'spY_Quarantine;1'
    Parameters = <>
    Left = 825
    Top = 717
  end
  object dsQuarantine: TDataSource
    DataSet = qrQuarantine
    Left = 1155
    Top = 764
  end
  object qrQuarantine: TADOQuery
    Connection = ADOCo
    CommandTimeout = 3000
    Parameters = <>
    Left = 675
    Top = 198
  end
  object dsZ_insertion: TDataSource
    DataSet = qrZ_insertion
    Left = 1105
    Top = 764
  end
  object qrZ_insertion: TADOQuery
    Connection = ADOCo
    CommandTimeout = 3000
    Parameters = <>
    Left = 675
    Top = 246
  end
  object qrBonusState: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 675
    Top = 293
  end
  object srBonusState: TDataSource
    DataSet = qrBonusState
    Left = 1585
    Top = 246
  end
  object QrExC: TADOQuery
    Connection = ADOCo
    CommandTimeout = 300
    Parameters = <>
    Left = 675
    Top = 341
  end
  object ADOQ_Tmp: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 675
    Top = 389
  end
  object tmQr: TADOQuery
    Connection = ADOCo
    CommandTimeout = 3
    Parameters = <>
    Left = 675
    Top = 435
  end
  object dsClaimes: TDataSource
    DataSet = qrClaimes
    Left = 1204
    Top = 764
  end
  object qrClaimes: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 676
    Top = 483
  end
  object qrSeriaArt: TADOQuery
    Connection = ADOCo
    CommandTimeout = 100
    Parameters = <>
    Left = 675
    Top = 530
  end
  object srSeriaArt: TDataSource
    DataSet = qrSeriaArt
    Left = 1255
    Top = 765
  end
  object qrmtPer: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 675
    Top = 580
  end
  object srmtPer: TDataSource
    DataSet = qrmtPer
    Left = 1305
    Top = 765
  end
  object ADOLog: TADOConnection
    CommandTimeout = 300
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 20
    Top = 102
  end
  object qrSQLLog: TADOQuery
    Connection = ADOLog
    Parameters = <>
    Left = 675
    Top = 625
  end
  object qrRROLog: TADOQuery
    Connection = ADOLog
    Parameters = <>
    Left = 675
    Top = 675
  end
  object qrFarmZamCount: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 676
    Top = 716
  end
  object srFarmZamCount: TDataSource
    DataSet = qrFarmZamCount
    Left = 1356
    Top = 764
  end
  object dsSrokHranWOPlases: TDataSource
    DataSet = qrSrokHranWOPlases
    Left = 1404
    Top = 764
  end
  object qrSrokHranWOPlases: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 676
    Top = 764
  end
  object dsPrepStorage: TDataSource
    DataSet = qrPrepStorage
    Left = 1456
    Top = 764
  end
  object qrPrepStorage: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 676
    Top = 812
  end
  object qrSoputstvCount: TADOQuery
    Connection = ADOCo
    Parameters = <>
    Left = 725
    Top = 10
  end
  object dsSoputstvCount: TDataSource
    DataSet = qrSoputstvCount
    Left = 1512
    Top = 764
  end
  object qrPMStat: TADOQuery
    Connection = ADOCo
    CommandTimeout = 3000
    Parameters = <>
    Left = 725
    Top = 58
  end
  object dsPMStat: TDataSource
    DataSet = qrPMStat
    Left = 1105
    Top = 820
  end
  object qrAhchT: TADOQuery
    Connection = ADOCo
    Parameters = <>
    SQL.Strings = (
      'select convert(uniqueidentifier,id) as id,'
      '       Descr'
      'from SprAHCHt'
      'order by Descr')
    Left = 726
    Top = 103
  end
  object srAhchT: TDataSource
    DataSet = qrAhchT
    Left = 1155
    Top = 820
  end
  object qrAhchV: TADOQuery
    Connection = ADOCo
    Parameters = <>
    SQL.Strings = (
      'select convert(uniqueidentifier,id) as id,'
      '       Descr'
      'from SprAHCHt'
      'order by Descr')
    Left = 726
    Top = 148
  end
  object srAhchV: TDataSource
    DataSet = qrAhchV
    Left = 1205
    Top = 820
  end
  object qrAhchR: TADOQuery
    Connection = ADOCo
    Parameters = <>
    SQL.Strings = (
      'select convert(uniqueidentifier,id) as id,'
      '       Descr'
      'from SprAHCHt'
      'order by Descr')
    Left = 726
    Top = 198
  end
  object srAhchR: TDataSource
    DataSet = qrAhchR
    Left = 1255
    Top = 820
  end
  object qrJAhch: TADOQuery
    Connection = ADOCo
    Parameters = <>
    SQL.Strings = (
      'select convert(uniqueidentifier,id) as id,'
      '       Descr'
      'from SprAHCHt'
      'order by Descr')
    Left = 726
    Top = 246
  end
  object srJAhch: TDataSource
    DataSet = qrJAhch
    Left = 1305
    Top = 820
  end
  object qrAhchR1: TADOQuery
    Connection = ADOCo
    Parameters = <>
    SQL.Strings = (
      'select convert(uniqueidentifier,id) as id,'
      '       Descr'
      'from SprAHCHt'
      'order by Descr')
    Left = 726
    Top = 293
  end
  object srAhchR1: TDataSource
    DataSet = qrAhchR1
    Left = 1355
    Top = 820
  end
end
