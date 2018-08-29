object TotalStatF: TTotalStatF
  Left = 509
  Top = 347
  BorderStyle = bsDialog
  Caption = 'TotalStatF'
  ClientHeight = 303
  ClientWidth = 733
  Color = 15773696
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    733
    303)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 11
    Width = 337
    Height = 20
    Caption = #1054#1073#1097#1072#1103' '#1089#1074#1086#1076#1082#1072' '#1087#1086' '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1084' '#1072#1082#1094#1080#1103#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image1: TImage
    Left = 696
    Top = 5
    Width = 32
    Height = 32
    Anchors = [akTop, akRight]
    AutoSize = True
    Picture.Data = {
      0A544A504547496D6167652B040000FFD8FFE000104A46494600010101004800
      480000FFDB0043000503040404030504040405050506070C08070707070F0B0B
      090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
      24221E241C1E1F1EFFDB0043010505050706070E08080E1E1411141E1E1E1E1E
      1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
      1E1E1E1E1E1E1E1E1E1E1E1E1EFFC00011080020002003012200021101031101
      FFC4001F0000010501010101010100000000000000000102030405060708090A
      0BFFC400B5100002010303020403050504040000017D01020300041105122131
      410613516107227114328191A1082342B1C11552D1F02433627282090A161718
      191A25262728292A3435363738393A434445464748494A535455565758595A63
      6465666768696A737475767778797A838485868788898A92939495969798999A
      A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
      D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
      01010101010101010000000000000102030405060708090A0BFFC400B5110002
      0102040403040705040400010277000102031104052131061241510761711322
      328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
      292A35363738393A434445464748494A535455565758595A636465666768696A
      737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
      A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
      E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F46B
      FBBBA9AFA6924B8959DA42492E7D6A1F3E7FF9ECFF00F7D1AD5D27C3DAA6B971
      72D6112B244E433BB6D19CF4FAD675D5A4D697325B5CC6639A362AEA7B1AFC3E
      BD3C4463EDA49F2B6ECFA33F51A53A0DFB38B574B6EC4BA4C17BA96A5058C133
      09266DAA59CE07BD741AFF0087F53F0C5C595D0D44CAAF2801D0952ADD718CD5
      1F0DAC1A5C53F89EFD992D34EE50038334A7EEA0FEB5936FF15355D435248B5C
      D3ECAF2C2460A6054D8539E195B939FF003C57BB9760E8CB09CF59B5524FDD77
      7A25D5AECDDCE4AB4F175EB37878A708AF7969ABECBCD2B1BF77E3CD3BC0D34B
      A469900D5EE0C8CF772F9BB6357E9B57839C639A7F83752D1BE21EAD2A5F594B
      61A92279B21825CC73282077E411915E49AAD8DEC1A95CC335A4E9224AC194A1
      C839A658BEA76374B75646EEDA74FBB245B9587E22BD378ABB54AAC13A69FC36
      FE9DCF45E418695073A33B556BE3BFE9B58F42F8EF9D36F74CD02D6455B086DF
      CE5881F98B9620B37A9E3F9D79BDA7FC7DC3FF005D17F9D4D7CFA9DF5CB5CDE9
      BBB99DFEF492EE663F89A7699617B71A95B430DA4F248F2A85508724E6B9EBCB
      DB57E6846CBA2ECBB1EB606847058354A724DA4EEFBBDDB3FFD9}
  end
  object Bevel1: TBevel
    Left = 5
    Top = 41
    Width = 723
    Height = 2
    Anchors = [akLeft, akTop, akRight]
  end
  object Panel1: TPanel
    Left = 2
    Top = 48
    Width = 729
    Height = 253
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      729
      253)
    object DBGrid1: TDBGrid
      Left = 1
      Top = 61
      Width = 727
      Height = 169
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      DataSource = DM.srTotalStat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'Names'
          Width = 425
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KolActive'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KolMinPlan'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GoalB'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SummB'
          Width = 70
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 426
      Height = 60
      Caption = #1058#1080#1087' '#1072#1082#1094#1080#1080
      Color = 14792843
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 427
      Top = 1
      Width = 71
      Height = 60
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Label2: TLabel
        Left = 1
        Top = 1
        Width = 69
        Height = 58
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = #1050#1086#1083'-'#1074#1086' '#1076#1077#1081#1089#1090#1074#1091#1102#1097'. '#1072#1082#1094#1080#1081
        Color = 14924971
        ParentColor = False
        Layout = tlCenter
        WordWrap = True
      end
    end
    object Panel4: TPanel
      Left = 498
      Top = 1
      Width = 71
      Height = 60
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object Label3: TLabel
        Left = 1
        Top = 1
        Width = 69
        Height = 58
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = #1050#1086#1083'-'#1074#1086' '#1072#1082#1094#1080#1081' '#1075#1076#1077'  '#1076#1086#1089#1090#1080#1075#1085'. '#1084#1080#1085'. '#1087#1083#1072#1085
        Color = 14924971
        ParentColor = False
        Layout = tlCenter
        WordWrap = True
      end
    end
    object Panel5: TPanel
      Left = 569
      Top = 1
      Width = 71
      Height = 60
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object Label4: TLabel
        Left = 1
        Top = 1
        Width = 69
        Height = 58
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = #1062#1077#1083#1100
        Color = 1375467
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
      end
    end
    object Panel6: TPanel
      Left = 640
      Top = 1
      Width = 71
      Height = 60
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object Label5: TLabel
        Left = 1
        Top = 1
        Width = 69
        Height = 58
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = #1053#1072#1095#1080#1089#1083#1077#1085'- '#1085#1099#1077' '#1073#1072#1083#1099
        Color = 2747412
        ParentColor = False
        Layout = tlCenter
        WordWrap = True
      end
    end
    object Panel7: TPanel
      Left = 711
      Top = 1
      Width = 17
      Height = 60
      Color = 15773696
      TabOrder = 6
    end
    object Panel8: TPanel
      Left = 1
      Top = 231
      Width = 568
      Height = 22
      Caption = #1048#1090#1086#1075#1086':'
      Color = 15773696
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object Panel9: TPanel
      Left = 569
      Top = 231
      Width = 71
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      object Label6: TLabel
        Left = 1
        Top = 1
        Width = 69
        Height = 20
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = '88888.88'
        Color = 1375467
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
    end
    object Panel10: TPanel
      Left = 640
      Top = 231
      Width = 71
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      object Label7: TLabel
        Left = 1
        Top = 1
        Width = 69
        Height = 20
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = #1062#1077#1083#1100
        Color = 2747412
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
    end
    object Panel11: TPanel
      Left = 711
      Top = 231
      Width = 17
      Height = 22
      Color = 15773696
      TabOrder = 10
    end
  end
end
