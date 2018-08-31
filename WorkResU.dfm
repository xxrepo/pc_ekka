object WorkResF: TWorkResF
  Left = 484
  Top = 329
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'WorkResF'
  ClientHeight = 580
  ClientWidth = 981
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    981
    580)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 760
    Top = 440
    Width = 211
    Height = 71
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 
      #1044#1083#1103' '#1090#1086#1075#1086' '#1095#1090#1086#1073#1099' '#1091#1079#1085#1072#1090#1100' '#1085#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072' '#1082#1083#1080#1077#1085#1090#1072', '#1079#1074#1086#1085#1080#1090#1077' '#1085#1072' '#1075#1072#1088#1103#1095#1091#1102 +
      ' '#1083#1080#1085#1080#1102' '#1087#1086' '#1085#1086#1084#1077#1088#1091' 0-800-505-911'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object lbAssemb: TLabel
    Left = 100
    Top = 40
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 5
    Top = 40
    Width = 87
    Height = 13
    Caption = #1047#1072#1082#1072#1079' '#1089#1086#1073#1088#1072#1085':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel3: TPanel
    Left = 5
    Top = 276
    Width = 972
    Height = 104
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 9
    Visible = False
    object Label16: TLabel
      Left = 5
      Top = 10
      Width = 115
      Height = 13
      Caption = #1051#1077#1095#1077#1073#1085#1086#1077' '#1091#1095#1088#1077#1078#1076#1077#1085#1080#1077':'
    end
    object Label17: TLabel
      Left = 152
      Top = 10
      Width = 70
      Height = 13
      Caption = #1074#1072#1099#1074#1072#1099#1092#1074#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 545
      Top = 30
      Width = 73
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1077#1094#1077#1087#1090#1072':'
    end
    object Label21: TLabel
      Left = 625
      Top = 30
      Width = 51
      Height = 13
      Caption = '27.12.16'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 5
      Top = 30
      Width = 62
      Height = 13
      Caption = #1060#1048#1054' '#1074#1088#1072#1095#1072':'
    end
    object Label25: TLabel
      Left = 75
      Top = 30
      Width = 95
      Height = 13
      Caption = 'kvhkjxchvzjxchv'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 300
      Top = 30
      Width = 81
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1088#1077#1094#1077#1087#1090#1072':'
    end
    object Label27: TLabel
      Left = 390
      Top = 30
      Width = 59
      Height = 13
      Caption = #1095#1103#1084#1072#1103#1095#1089#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 545
      Top = 10
      Width = 173
      Height = 13
      Caption = #8470' '#1072#1084#1073#1091#1083#1072#1090#1086#1088#1085#1086#1081' '#1082#1088#1072#1090#1099' '#1087#1072#1094#1080#1077#1085#1090#1072':'
    end
    object Label29: TLabel
      Left = 720
      Top = 10
      Width = 43
      Height = 13
      Caption = #1072#1087#1088#1074#1072#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BitBtn_select_med: TBitBtn
      Left = 123
      Top = 4
      Width = 25
      Height = 21
      Caption = '. . .'
      TabOrder = 0
      OnClick = BitBtn_select_medClick
    end
  end
  object bbSetRes: TBitBtn
    Left = 760
    Top = 382
    Width = 212
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1073#1088#1086#1085#1100
    TabOrder = 5
    Visible = False
    OnClick = bbSetResClick
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000130B0000130B000000000000000000003C4C6A6C91BA
      688EBB668BB9678BBA678DBC6389BA658BBD658ABC618BBC648BBD6289BA5D84
      B4435C795C89BD5C87BB4E4E4EAFAFAFACACACA8A8A8AAAAAAABABABA7A7A7AA
      AAAAA8A8A8AAAAAAAAAAAAA7A7A7A0A0A0616161A7A7A7A4A4A438445549576E
      48576D42526844576E3849613B4C624D607453697F55697F4E627951647B4254
      6B303E513B4F654458703D3D3D5A5A5A59595952525259595947474749494964
      64647272727272726868686B6B6B5454543636364E4E4E5B5B5B6285B76187B7
      6085B56388B66188B66086B352739A4457745B85B55982B35982B35B84B55B84
      B55681B55783B75983B6A3A3A3A4A4A4A1A1A1A4A4A4A4A4A4A1A1A18585855B
      5B5BA0A0A09D9D9D9D9D9DA0A0A0A0A0A09C9C9C9E9E9E9E9E9E6186B96086B9
      6186B76288B96389BA5F85B64F74A34058775D88BA5C86B75C85B65D86B75D87
      B85A84B75A85B95B84B7A4A4A4A4A4A4A3A3A3A5A5A5A7A7A7A1A1A18989895D
      5D5DA5A5A5A3A3A3A1A1A1A3A3A3A4A4A4A0A0A0A1A1A1A0A0A06388B96589B9
      678CB8698EBA688CBB6388B8567AA6475D7A648BB9648CB86089B66189B76088
      B75D86B76089B8668EBAA5A5A5A7A7A7AAAAAAACACACABABABA5A5A590909064
      6464A8A8A8A8A8A8A4A4A4A5A5A5A4A4A4A3A3A3A5A5A5ABABAB38475A44556B
      41566F4E637C4E637C4F657E4E647E4A5C764C5F794960785267814D627C4E63
      7C434C5B41546C3E51664242425656565959596B6B6B6B6B6B6E6E6E6C6C6C61
      61616565656565657070706969696B6B6B484848565656505050445B80537396
      5B84B45982B35881B25B84B55980B15D83B45C83B15882B35A83B55982B45982
      B34B5D745984B36087B36464648282829E9E9E9D9D9D9C9C9CA0A0A09A9A9A9E
      9E9E9D9D9D9D9D9D9E9E9E9D9D9D9D9D9D6161619E9E9EA1A1A1455E8358769A
      6489B76188B66085B76188B56087B35E86B75D87B55E86B55E87B75C86B85A84
      B84B5E765A86B75C86B6686868888888A5A5A5A4A4A4A1A1A1A4A4A4A1A1A1A3
      A3A3A3A3A3A1A1A1A3A3A3A3A3A3A0A0A0646464A1A1A1A1A1A1435670506681
      5A77985977985A779A5A79995C7A9B5B799D58789C5A799B5977975D7B9C5C7B
      9E43526557789B5D7B9E5959596F6F6F8888888888888989898B8B8B8C8C8C8C
      8C8C8B8B8B8B8B8B8888888E8E8E8F8F8F5252528989898F8F8F547297557397
      54739853719953719853729A4C6A914A5A7055749954759D52749F5375A05575
      9F51749E5375A051759E8282828484848484848282828282828484847979795D
      5D5D858585888888888888898989898989878787898989888888688CBA688CB9
      678BB86589B76589B76689B75C7FAD5D7289648BB8648AB86088BA6189BC6289
      B86088B96289BB648AB7AAAAAAAAAAAAA8A8A8A5A5A5A5A5A5A5A5A59797977E
      7E7EA8A8A8A7A7A7A5A5A5A7A7A7A5A5A5A5A5A5A7A7A7A7A7A76A8FBB6C91BD
      698EBA688DB96A8FBB678BB95D7FAE596D876B8FBD678EBB638CBA658CBE658B
      BB668DBA658CBD668CB9AEAEAEB0B0B0ACACACABABABAEAEAEA8A8A899999979
      7979AEAEAEACACACAAAAAAABABABAAAAAAABABABABABABAAAAAA44556A455871
      3D4E673E4E6645556C485A7344566D3C4D60485E75465C744A60774B61794C61
      794D5E73495E734153685656565B5B5B4E4E4E4E4E4E5757575E5E5E57575749
      49496262626060606565656767676767676262626161615353534C62847190B6
      6A8CB86689B5688BB7668BB7648AB6668CB8658AB8658BB8658AB86287B66083
      B04D65826289B66085B26C6C6CACACACAAAAAAA5A5A5A8A8A8A8A8A8A7A7A7AA
      AAAAA7A7A7A8A8A8A7A7A7A4A4A49D9D9D6F6F6FA5A5A5A0A0A04C60817394B9
      6A8DB96A8CB96B8DB9688CB9678BB7688CB8678BB8678BB9698EBB668BB86285
      B1526986628AB96286B5696969B2B2B2ABABABAAAAAAABABABAAAAAAA8A8A8AA
      AAAAA8A8A8A8A8A8ACACACA8A8A8A0A0A0757575A7A7A7A3A3A34B607C7295B8
      6D8EB96B8EBA6C90BC6B8EB9698CB86A8EBA678DB8698EBA698FBA678DB96488
      B2556C875F88B96087B9686868B2B2B2ACACACACACACAFAFAFACACACAAAAAAAC
      ACACAAAAAAACACACACACACABABABA3A3A3777777A5A5A5A4A4A4}
    NumGlyphs = 2
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 56
    Width = 973
    Height = 215
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    DesignSize = (
      973
      215)
    object DBGrid1: TDBGrid
      Left = 4
      Top = 10
      Width = 965
      Height = 200
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      DataSource = DM.srRes
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'idres'
          Title.Alignment = taCenter
          Title.Caption = #1048#1044
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'date_res'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1073#1088#1086#1085#1080#1088#1086#1074#1072#1085#1080#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 127
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fio'
          Title.Alignment = taCenter
          Title.Caption = #1060#1048#1054' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 181
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'phone'
          Title.Alignment = taCenter
          Title.Caption = #1058#1077#1083'. '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'date_close'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1089#1085#1103#1090#1080#1103' '#1073#1088#1086#1085#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 118
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'userc'
          Title.Alignment = taCenter
          Title.Caption = #1050#1090#1086' '#1089#1085#1103#1083' '#1073#1088#1086#1085#1100
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 161
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TypeBr'
          Title.Alignment = taCenter
          Title.Caption = #1058#1080#1087' '#1073#1088#1086#1085#1080
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TypeZakaz'
          Title.Alignment = taCenter
          Title.Caption = #1044#1086#1089#1090#1072#1074#1082#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TovLoaded'
          Title.Alignment = taCenter
          Title.Caption = #1057#1090#1072#1090#1091#1089' '#1086#1089#1090#1072#1090#1082#1086#1074
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = -1
          Visible = False
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 5
    Top = 382
    Width = 746
    Height = 194
    Anchors = [akLeft, akBottom]
    Caption = ' '#1057#1087#1080#1089#1086#1082' '#1079#1072#1073#1088#1086#1085#1080#1088#1086#1074#1072#1085#1085#1099#1093' '#1087#1088#1077#1087#1072#1088#1072#1090#1086#1074' '
    TabOrder = 1
    DesignSize = (
      746
      194)
    object DBGrid2: TDBGrid
      Left = 4
      Top = 15
      Width = 738
      Height = 174
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Color = clCream
      DataSource = DM.srResPos
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid2DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'art_code'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'names'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 500
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
          Width = 67
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
          Width = 79
          Visible = True
        end>
    end
  end
  object BitBtn2: TBitBtn
    Left = 850
    Top = 549
    Width = 123
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
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
  object bbClearRes: TBitBtn
    Left = 760
    Top = 407
    Width = 212
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1085#1103#1090#1100' '#1073#1088#1086#1085#1100' '#1087#1088#1080' '#1086#1090#1082#1072#1079#1077' '#1082#1083#1080#1077#1085#1090#1072
    TabOrder = 3
    Visible = False
    OnClick = bbClearResClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000D40E0000D40E00001000000010000000FF0000000909
      FF001A1AFF002A2AFF003939FF004848FF005A5AFF006A6AFF007979FF008989
      FF009898FF00A8A8FF00BABAFF00C6C6FF00D7D7FF00FBFBFF00000000999D00
      0000000C53233339000000C23455655360000D23567777664600013568899987
      54A0824679BBBBA8753053579ACDDDBA864D13FFFFFFFFFFFB4913FFFFFFFFFF
      FB5A13ACCEEEFEEDC84993568ABCCBB97640C23678AAAA977460052457889877
      43D00053455666544D00000524444443D0000000C92226900000}
  end
  object BitBtn3: TBitBtn
    Left = 760
    Top = 382
    Width = 212
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1095#1077#1082'...'
    TabOrder = 4
    OnClick = BitBtn3Click
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      18000000000000060000000000000000000000000000000000000000FF0000FF
      0000000000000000FF0000FF0000FF0000000000000000000000FF0000FF0000
      000000000000FF0000FF0000FF0000FF8080808080800000FF0000FF0000FF80
      80808080808080800000FF0000FF8080808080800000FF0000FF0000FF0000FF
      000000FFFFFF000000000000000000FFFFFFFFFFFFFFFFFF000000000000FFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3808080808080808080D3
      D3D3D3D3D3D3D3D3808080808080D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3D3D3D3D3D3D380808080
      8080808080808080808080D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3D3D3D3D3D3D3808080D3
      D3D3808080D3D3D3808080D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3808080808080808080D3
      D3D3D3D3D3D3D3D3D3D3D3808080D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3808080808080808080D3
      D3D3D3D3D3D3D3D3D3D3D3808080D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3808080808080808080D3
      D3D3D3D3D3D3D3D3D3D3D3808080D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFF000000000000000000000000000000FFFFFFFFFFFF000000FFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D380808080808080808080
      8080808080D3D3D3D3D3D3808080D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3D3D3D3D3D3D3D3D3D3D3
      D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      000000FFFFFF000000000000FFFFFF000000FFFFFF000000000000FFFFFFFFFF
      FF0000000000FF0000FF0000FF0000FF808080D3D3D3808080808080D3D3D380
      8080D3D3D3808080808080D3D3D3D3D3D38080800000FF0000FF0000FF0000FF
      0000000000000000FF0000FF0000000000FF0000000000FF0000FF0000000000
      000000000000FF0000FF0000FF0000FF8080808080800000FF0000FF80808000
      00FF8080800000FF0000FF8080808080808080800000FF0000FF}
    NumGlyphs = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 981
    Height = 36
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object Label2: TLabel
      Left = 7
      Top = 11
      Width = 154
      Height = 13
      Caption = #1055#1077#1088#1080#1086#1076': '#1089'                    '#1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 242
      Top = 11
      Width = 43
      Height = 13
      Caption = #1052#1077#1089#1103#1094':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 595
      Top = 11
      Width = 56
      Height = 13
      Caption = #1055#1088#1080#1079#1085#1072#1082':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dtStart: TDateTimePicker
      Left = 70
      Top = 8
      Width = 71
      Height = 21
      Date = 38786.000000000000000000
      Time = 38786.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnCloseUp = dtStartCloseUp
    end
    object dtEnd: TDateTimePicker
      Left = 166
      Top = 8
      Width = 70
      Height = 21
      Date = 38786.000000000000000000
      Time = 38786.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnCloseUp = dtEndCloseUp
    end
    object ComboBox2: TComboBox
      Left = 287
      Top = 8
      Width = 99
      Height = 21
      BevelKind = bkFlat
      Style = csDropDownList
      DropDownCount = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
      OnChange = ComboBox2Change
      OnCloseUp = ComboBox2CloseUp
      Items.Strings = (
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
    object ComboBox1: TComboBox
      Left = 652
      Top = 8
      Width = 145
      Height = 21
      BevelKind = bkFlat
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 1
      ParentFont = False
      TabOrder = 3
      Text = #1040#1082#1090#1080#1074#1085#1099#1077' '#1073#1088#1086#1085#1080#1088#1086#1074#1082#1080
      OnChange = ComboBox1Change
      Items.Strings = (
        #1042#1077#1089#1100' '#1089#1087#1080#1089#1086#1082
        #1040#1082#1090#1080#1074#1085#1099#1077' '#1073#1088#1086#1085#1080#1088#1086#1074#1082#1080
        #1054#1090#1084#1077#1085#1077#1085#1085#1072#1103' '#1073#1088#1086#1085#1100
        #1055#1088#1086#1076#1072#1085#1085#1072#1103' '#1073#1088#1086#1085#1100)
    end
    object BitBtn1: TBitBtn
      Left = 820
      Top = 6
      Width = 156
      Height = 25
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1082#1072#1082' "'#1057#1086#1073#1088#1072#1085#1085#1099#1081'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object CheckBox1: TCheckBox
      Left = 400
      Top = 10
      Width = 176
      Height = 17
      Caption = #1058#1086#1083#1100#1082#1086' '#1079#1072#1082#1072#1079#1099' '#1087#1086' '#1076#1077#1092#1077#1082#1090#1091#1088#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = CheckBox1Click
    end
  end
  object BitBtn4: TBitBtn
    Left = 850
    Top = 524
    Width = 123
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1077#1095#1072#1090#1100' '#1079#1072#1082#1072#1079#1072
    TabOrder = 7
    OnClick = BitBtn4Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000D40E0000D40E00001000000010000000000000001010
      10004F4F4F0077777700B8A38800D0BFB900CEC8C800E8DCCF000000FF00DEDE
      DE00EFEFEF00F7F1E800FFF7EF00FFF7F700FFFFF700FFFFFF00882222222221
      2388883222222222238885556556565542888596966666665388859B77777777
      528886DEAAAAAAAA638885900C777710538885F11FAAAA11638885BBDBD77777
      628886EFFFFAAAAA638885B000000000528885F111111111638885BBCCCBBB77
      638886EFFFFFFDFA638885B000000000628885F111111111938885BECBCCCB9B
      528886EFFFFFFFDF638885AF00000000538885FF11111111938885DFFCCBDBBB
      528885FFFFFFFFFD638885D00FECBC00538886E11FFFFF11938885AFFFFFCBB7
      438885FFFFFFFFFF638885DFFF000C44448885FFFF111F53458885CFEFEFEC74
      488886DFFFFEFF95588886757575757488888999999999958888}
    NumGlyphs = 2
  end
  object Panel2: TPanel
    Left = 4
    Top = 276
    Width = 972
    Height = 104
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 8
    Visible = False
    object Label5: TLabel
      Left = 5
      Top = 10
      Width = 68
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1083#1080#1089#1072':'
    end
    object lbDtpolis: TLabel
      Left = 80
      Top = 10
      Width = 50
      Height = 13
      Caption = 'lbDtpolis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 160
      Top = 10
      Width = 53
      Height = 13
      Caption = #8470' '#1087#1086#1083#1080#1089#1072':'
    end
    object lbNnpolis: TLabel
      Left = 220
      Top = 10
      Width = 50
      Height = 13
      Caption = 'lbDtpolis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 380
      Top = 10
      Width = 79
      Height = 13
      Caption = #1044#1072#1090#1072' '#1076#1086#1089#1090#1072#1074#1082#1080':'
    end
    object dtdostav: TLabel
      Left = 465
      Top = 10
      Width = 51
      Height = 13
      Caption = '27.12.16'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 580
      Top = 30
      Width = 58
      Height = 13
      Caption = #1060#1088#1072#1085#1096#1080#1079#1072':'
    end
    object lbFransh: TLabel
      Left = 640
      Top = 30
      Width = 50
      Height = 13
      Caption = 'lbDtpolis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 5
      Top = 30
      Width = 133
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072' '#1082#1083#1080#1077#1085#1090#1072':'
    end
    object lbPhone: TLabel
      Left = 145
      Top = 30
      Width = 116
      Height = 13
      Caption = '+38 (066) 879-67-87'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 5
      Top = 50
      Width = 109
      Height = 13
      Caption = #1057#1090#1088#1072#1093#1086#1074#1072#1103' '#1082#1086#1084#1087#1072#1085#1080#1103':'
    end
    object lbnnStrah: TLabel
      Left = 120
      Top = 50
      Width = 50
      Height = 13
      Caption = 'lbDtpolis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 580
      Top = 10
      Width = 121
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1089#1090#1072#1082#1080' '#1071#1050#1040#1041#1059':'
    end
    object lbAYKABU: TLabel
      Left = 705
      Top = 10
      Width = 60
      Height = 13
      Caption = 'lbAYKABU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 380
      Top = 30
      Width = 108
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1082#1086#1084#1087#1077#1085#1089#1072#1094#1080#1080':'
    end
    object lbBezn1: TLabel
      Left = 490
      Top = 30
      Width = 50
      Height = 13
      Caption = 'lbDtpolis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 380
      Top = 50
      Width = 53
      Height = 13
      Caption = #8470' '#1079#1072#1103#1074#1082#1080':'
    end
    object lbNumOrder: TLabel
      Left = 440
      Top = 50
      Width = 50
      Height = 13
      Caption = 'lbDtpolis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 5
      Top = 70
      Width = 86
      Height = 13
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbComment: TLabel
      Left = 95
      Top = 70
      Width = 871
      Height = 31
      AutoSize = False
      Caption = 'sdgfd'
      Transparent = True
      WordWrap = True
    end
    object BitBtn5: TBitBtn
      Left = 825
      Top = 29
      Width = 141
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083'-'#1087#1086#1083#1080#1089
      TabOrder = 0
      OnClick = BitBtn5Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000D30E0000D30E00000001000000010000944242008C4A
        4A00944A4A007B525A008C5A5A005A636B0063636B006B6B6B005A6373005A6B
        7300636B73007B6B7300CE7B73004A637B00636B7B006B737B0073737B007B73
        7B00737B7B007B7B7B00B57B7B00C67B7B0052738400737B8400847B84008C7B
        8400AD7B84007B848400848484009C848400A5848400316B8C0039738C005273
        8C00527B8C00637B8C0063848C006B848C008C848C0094848C00A5848C00AD84
        8C00948C8C00AD8C8C0031739400527B940084849400638C94008C8C94008C94
        9400949494004A849C005A849C004A8C9C00638C9C007B949C009C949C00A594
        9C00428CA500528CA5005A8CA5005A94A500949CA500A5A5A500CEA5A5002984
        AD004A94AD005294AD005A94AD006B9CAD0073A5AD0084A5AD00A5A5AD00ADA5
        AD00ADADAD00BDADAD00CEADAD00E7B5AD003194B5003994B5004294B5004A9C
        B5005A9CB500639CB5005AA5B50063A5B5006BA5B5007BA5B50073ADB5007BAD
        B50084ADB5008CADB5008CB5B500B5B5B500DEB5B5002994BD003194BD00319C
        BD00399CBD00429CBD004A9CBD004AA5BD005AA5BD005AADBD0073ADBD007BAD
        BD0073B5BD007BB5BD0084B5BD00299CC60039A5C60042A5C6006BB5C60073B5
        C6007BB5C6007BBDC60084BDC600BDC6C60031A5CE004AADCE0052ADCE006BB5
        CE007BBDCE0084C6CE0042B5D6004ABDD6006BBDD6006BC6D60084C6D60031AD
        DE0031B5DE0042B5DE0073CEDE0084CEDE007BD6DE0084D6DE008CD6DE004AC6
        E70052C6E70063CEE7006BCEE70073CEE70084D6E70084DEE7008CDEE7009CE7
        E7004AC6EF004ACEEF0052CEEF005ACEEF005AD6EF006BD6EF0073DEEF007BDE
        EF007BE7EF008CE7EF009CE7EF0094EFEF00A5EFEF004ACEF7004AD6F70052D6
        F70063DEF7006BDEF70073DEF70073E7F7007BE7F70084E7F70084EFF7008CEF
        F7009CEFF70094F7F700A5F7F700ADF7F700ADFFF700B5FFF700FF00FF007BEF
        FF0084EFFF0094EFFF008CF7FF0094F7FF009CFFFF00ADFFFF00B5FFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00757575757575
        7575757575757575757575750D6F51433D362525171013327575751939237C93
        A2A3A6A79B912405757575101F4F77898B8C99A7A9AD458105755D28400B6F89
        8B8C99A7A99E59950975751D3E0333928B8C99A7A9AA5A870875482B4D045089
        8B8C99A7A9AD54412A757519360E42898B8C99A7A9AD568106753F2B5E023A93
        8B8C99A7A9AC6B980A757511203364898B8C99A7A9AC5A870A75752738347C89
        8B8C99A7A9AC58221B7575322C5077929597A6B2B3B759960775757521635152
        707E84878E9E578C0A7575757531223C68696C747B7B72980E75757575757575
        75316885A9915A371775757575757575757575315BAA5C4A7575}
    end
  end
end
