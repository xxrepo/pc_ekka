unit DataModuleU;

interface

uses Forms, ADODB, DB, Classes, MainU, SysUtils, Variants, Math, Dialogs;
//  , Dialogs,

type

  TRecordLog=Record
              SQL1:String;
              SQL2:String;
              DtStart:TDateTime;
              DtEnd:TDateTime;
              id_kassa:Integer;
              IP:String;
              Error:String;
             end;

  TDM = class(TDataModule)

    ADOCo: TADOConnection;
    Qr: TADOQuery;
    QrEx: TADOQuery;
    srSprTov: TDataSource;
    qrChek: TADOQuery;
    srChek: TDataSource;
    qrCheknames: TStringField;
    qrChekkol: TIntegerField;
    qrChekcena: TBCDField;
    qrChekprinting: TSmallintField;
    qrCheksumrow: TBCDField;
    qrChekf_nds: TSmallintField;
    spY_EnterKol: TADOStoredProc;
    TimerQr: TADOQuery;
    srOstatCheck: TDataSource;
    qrOstChk: TADOQuery;
    spY_FilterSklad: TADOStoredProc;
    spY_DelKol: TADOStoredProc;
    spY_FilterSkladArt_Code: TIntegerField;
    spY_FilterSkladNames: TStringField;
    spY_FilterSkladF_NDS: TSmallintField;
    spY_FilterSkladCena: TBCDField;
    spY_FilterSkladOstat: TIntegerField;
    spY_InsertArhCh: TADOStoredProc;
    spY_GetServerDate: TADOStoredProc;
    spY_InsertMoves: TADOStoredProc;
    spY_InsertJMoves: TADOStoredProc;
    srGroups: TDataSource;
    srSKD: TDataSource;
    qrSKD: TADOQuery;
    qrSKDROW_ID: TAutoIncField;
    qrSKDType_Skd: TIntegerField;
    qrSKDSumm: TFloatField;
    qrSKDSKD: TIntegerField;
    qrSKDDescr: TStringField;
    qrSKDType_Limit: TSmallintField;
    QrC: TADOQuery;
    Qr1: TADOQuery;
    spY_CheckSKD:TADOStoredProc;
    qrEAN:TADOQuery;
    srEAN:TDataSource;
    spY_CalcRealiz:TADOStoredProc;
    srNaklList:TDataSource;
    qrFind:TADOQuery;
    spY_ShowChek:TADOStoredProc;
    spY_ShowChekart_code: TIntegerField;
    spY_ShowCheknames: TStringField;
    spY_ShowChekkod_name:TIntegerField;
    spY_ShowChekkol:TIntegerField;
    spY_ShowChekcena:TFloatField;
    spY_ShowChekskd:TFloatField;
    srShowChek:TDataSource;
    srChekList:TDataSource;
    spY_FilterSkladIsScan:TIntegerField;
    spY_NaklList: TADOStoredProc;
    srShowNakl: TDataSource;
    spY_NewNakl: TADOStoredProc;
    spY_ReocNakl: TADOStoredProc;
    qrNaklInfo: TADOQuery;
    qrNaklInfoNames: TStringField;
    qrNaklInfoKol: TIntegerField;
    qrNaklInfoCena: TFloatField;
    srNaklInfo: TDataSource;
    spY_Zakaz: TADOStoredProc;
    qrZakaz: TADOQuery;
    srZakaz: TDataSource;
    qrZakazart_code: TIntegerField;
    qrZakaznames: TStringField;
    qrZakazostat: TIntegerField;
    qrZakazrealiz: TIntegerField;
    qrZakazrealiz_period: TIntegerField;
    qrZakazzakaz: TIntegerField;
    qrZakazrealizDay: TBCDField;
    qrZakaztype_tov: TIntegerField;
    qrZakazf_nds: TIntegerField;
    qrZakazdate_zakaz: TDateTimeField;
    qrZakazCountDay: TIntegerField;
    qrZakazplist: TIntegerField;
    qrZakazZAKAZ_OLD: TIntegerField;
    qrZakazZAKAZ_OLD1: TIntegerField;
    qrZakazSPS: TIntegerField;
    qrZakazSummaDay: TBCDField;
    qrZakazotkaz: TSmallintField;
    qrZakazZapas: TIntegerField;
    qrOtkaz: TADOQuery;
    srOtkaz: TDataSource;
    qrNoScan: TADOQuery;
    srNoScan: TDataSource;
    qrATC_: TADOQuery;
    srATC: TDataSource;
    qrATC_Art_Code: TIntegerField;
    qrATC_Names: TStringField;
    qrATC_kol: TIntegerField;
    qrATC_cena: TBCDField;
    qrBack: TADOQuery;
    srBack: TDataSource;
    qrmtPrih: TADOQuery;
    srPrih: TDataSource;
    qrmtRealiz: TADOQuery;
    srRealiz: TDataSource;
    qrmtBackKl: TADOQuery;
    srBackKl: TDataSource;
    srVozr: TDataSource;
    qrmtVozr: TADOQuery;
    qrShowNakl: TADOQuery;
    qrShowNaklnn_nakl: TStringField;
    qrShowNakldate_nakl: TDateTimeField;
    qrShowNaklnames: TStringField;
    qrShowNaklart_code: TIntegerField;
    qrShowNaklkol: TIntegerField;
    qrShowNaklcena: TBCDField;
    qrShowNaklf_nds: TSmallintField;
    spY_CalcSkd: TADOStoredProc;
    qrChekart_code: TIntegerField;
    qrCheksumskd: TBCDField;
    spY_WriteChek: TADOStoredProc;
    QrL: TADOQuery;
    srKSumm: TDataSource;
    QrKSumm: TADOQuery;
    QrKSummUsers: TStringField;
    QrKSummSumma: TBCDField;
    spY_RealizCHP: TADOStoredProc;
    spY_TovRep: TADOStoredProc;
    qrSumZRep: TADOQuery;
    srSumZRep: TDataSource;
    qrSumZRepDescr: TStringField;
    qrSumZRepSumB: TBCDField;
    qrSumZRepSumK: TBCDField;
    qrSumZRepRazn: TBCDField;
    spY_SumZRep: TADOStoredProc;
    QrTh: TADOQuery;
    spY_CheckOst: TADOStoredProc;
    spY_CutBase: TADOStoredProc;
    qrChekSumSkdK: TBCDField;
    qrSpis: TADOQuery;
    srSpis: TDataSource;
    TimerQr1: TADOQuery;
    srHistory: TDataSource;
    qrHistory: TADOQuery;
    qrSpr: TADOQuery;
    srSpr: TDataSource;
    srList: TDataSource;
    spY_MakeLt: TADOStoredProc;
    qrLT: TADOQuery;
    srLT: TDataSource;
    qrLTIDDOC: TIntegerField;
    qrLTDATE_NAKL: TDateTimeField;
    qrLTNN_NAKL: TStringField;
    qrLTSUMMA: TBCDField;
    qrLTF_NDS: TSmallintField;
    qrCancel: TADOQuery;
    srCancel: TDataSource;
    qrGrafik: TADOQuery;
    srGrafik: TDataSource;
    spY_AddGrafik: TADOStoredProc;
    qrTab: TADOQuery;
    srTab: TDataSource;
    qrTabrow_id: TAutoIncField;
    qrTabidtab: TIntegerField;
    qrTabid_user: TSmallintField;
    qrTabusers: TStringField;
    qrTabid_type: TSmallintField;
    qrTabd11: TStringField;
    qrTabd12: TStringField;
    qrTabd21: TStringField;
    qrTabd22: TStringField;
    qrTabd31: TStringField;
    qrTabd32: TStringField;
    qrTabd41: TStringField;
    qrTabd42: TStringField;
    qrTabd51: TStringField;
    qrTabd52: TStringField;
    qrTabd61: TStringField;
    qrTabd62: TStringField;
    qrTabd71: TStringField;
    qrTabd72: TStringField;
    spY_ChekList: TADOStoredProc;
    qrLTList: TADOQuery;
    qrNEDList: TADOQuery;
    srLTList: TDataSource;
    srNEDList: TDataSource;
    qrLTListart_code: TIntegerField;
    qrLTListnames: TStringField;
    qrLTListkol: TSmallintField;
    qrLTListcena: TBCDField;
    qrNEDListart_code: TIntegerField;
    qrNEDListnames: TStringField;
    qrNEDListkol: TSmallintField;
    qrNEDListcena: TBCDField;
    qrL1: TADOQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    SmallintField1: TSmallintField;
    BCDField1: TBCDField;
    qrN1: TADOQuery;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    SmallintField2: TSmallintField;
    BCDField2: TBCDField;
    srL1: TDataSource;
    srN1: TDataSource;
    spY_EnterLN: TADOStoredProc;
    qrL1ROW_ID: TAutoIncField;
    qrN1ROW_ID: TAutoIncField;
    qrPPer: TADOQuery;
    qrPer: TADOQuery;
    srPPer: TDataSource;
    srPer: TDataSource;
    spY_AddPeresort: TADOStoredProc;
    qrPPeridper: TIntegerField;
    qrPPerart_code: TIntegerField;
    qrPPernames: TStringField;
    qrPPerkol: TIntegerField;
    qrPPercena: TBCDField;
    qrPPerSumma: TBCDField;
    qrPeridper: TIntegerField;
    qrPerart_code: TIntegerField;
    qrPernames: TStringField;
    qrPerkol: TIntegerField;
    qrPercena: TBCDField;
    qrPerSumma: TBCDField;
    spY_EditPeresort: TADOStoredProc;
    spY_ReocBackClient: TADOStoredProc;
    spY_CheckBase: TADOStoredProc;
    qrScript: TADOQuery;
    qrEx1: TADOQuery;
    qrSpisNeed: TADOQuery;
    srSpisNeed: TDataSource;
    spY_MakeSpisVozr: TADOStoredProc;
    qrVozrSpis: TADOQuery;
    srVozrSpis: TDataSource;
    qrVozrSpisnames: TStringField;
    qrVozrSpiskol: TIntegerField;
    qrVozrSpiscena: TBCDField;
    qrVozrSpisprinting: TSmallintField;
    qrVozrSpissumrow: TBCDField;
    qrVozrSpisf_nds: TSmallintField;
    qrVozrSpisart_code: TIntegerField;
    qrVozrSpissumskd: TBCDField;
    qrVozrSpisSumSkdK: TBCDField;
    spY_WriteMessToOffice: TADOStoredProc;
    qrTmM: TADOQuery;
    qrArtAdd: TADOQuery;
    srSpisArtAdd: TDataSource;
    Qr2: TADOQuery;
    qrActReoc: TADOQuery;
    srActReoc: TDataSource;
    qrActReocIDDOC: TAutoIncField;
    qrActReocIDVZR: TIntegerField;
    qrActReocIDPRC: TIntegerField;
    qrActReocNN_REOC: TStringField;
    qrActReocDATE_REOC: TDateTimeField;
    qrActReocSUMVZR: TBCDField;
    qrActReocSUMPRC: TBCDField;
    qrList: TADOQuery;
    qrUsersAll: TADOQuery;
    qrUsersApt: TADOQuery;
    srUsersAll: TDataSource;
    srUsersApt: TDataSource;
    qrSpisUser: TADOQuery;
    srSpisUser: TDataSource;
    qrMess: TADOQuery;
    srMess: TDataSource;
    spY_RegPercent: TADOStoredProc;
    srRegPercent: TDataSource;
    qrNonNames: TADOQuery;
    srNonNames: TDataSource;
    qrChekP1: TSmallintField;
    qrChekP2: TSmallintField;
    qrChekP3: TSmallintField;
    qrTabid_role: TSmallintField;
    spY_MakeVedList: TADOStoredProc;
    srVedList: TDataSource;
    qrVedList: TADOQuery;
    spY_MakeVed: TADOStoredProc;
    QrE: TADOQuery;
    QrCr: TADOQuery;
    spY_ChekListDate_Chek: TDateTimeField;
    spY_ChekListNumb_Chek: TIntegerField;
    spY_ChekListvzh: TBCDField;
    spY_ChekListNumCard: TLargeintField;
    spY_ChekListSumma: TBCDField;
    spY_ChekListSumSkd: TBCDField;
    spY_ChekListKassir: TStringField;
    qrBackROW_ID: TIntegerField;
    qrBackDATE_CHEK: TDateTimeField;
    qrBackNUMB_CHEK: TIntegerField;
    qrBackKOD_NAME: TIntegerField;
    qrBackART_CODE: TIntegerField;
    qrBackNAMES: TStringField;
    qrBackKOL: TIntegerField;
    qrBackCENA: TBCDField;
    qrBackKASSA_NUM: TSmallintField;
    qrBackF_NDS: TSmallintField;
    qrBackTYPE_TOV: TSmallintField;
    qrBackID_USER: TSmallintField;
    qrBackID_KASSA: TSmallintField;
    qrBackSKD: TBCDField;
    qrBackNUMCARD: TLargeintField;
    qrBackSUMSKD: TBCDField;
    qrBackCENA_SPR: TBCDField;
    spY_ReindexBase: TADOStoredProc;
    QrDS: TADOQuery;
    Qr3: TADOQuery;
    qrSpisObnov: TADOQuery;
    srSpisObnov: TDataSource;
    qrPList: TADOQuery;
    dsPList: TDataSource;
    qrTerap: TADOQuery;
    IntegerField3: TIntegerField;
    StringField3: TStringField;
    IntegerField4: TIntegerField;
    BCDField3: TBCDField;
    srTerap: TDataSource;
    qrTerapid: TIntegerField;
    qrTeraptype_tov: TSmallintField;
    qrTerapid_gr: TSmallintField;
    Qr4: TADOQuery;
    qrChekskd: TBCDField;
    QrB: TADOQuery;
    qrChVer: TADOQuery;
    qrCopy: TADOQuery;
    QrMessToOff: TADOQuery;
    qrSentM: TADOQuery;
    srSentM: TDataSource;
    TimerQr2: TADOQuery;
    QrEx2: TADOQuery;
    QrEx4: TADOQuery;
    spY_AddToReserve: TADOStoredProc;
    srRes: TDataSource;
    qrRes: TADOQuery;
    qrResPos: TADOQuery;
    srResPos: TDataSource;
    QrCa: TADOQuery;
    qrTabhours: TBCDField;
    qrChekart_name: TStringField;
    qrShAkcii: TADOQuery;
    srShAkcii: TDataSource;
    qrSertif: TADOQuery;
    srSertif: TDataSource;
    qrDhAkcii: TADOQuery;
    qrAArt: TADOQuery;
    srDhAkcii: TDataSource;
    srAArtP: TDataSource;
    qrAAdd: TADOQuery;
    sqAAdd: TDataSource;
    qrChektype_tov: TSmallintField;
    qrDhAkciiP: TADOQuery;
    srDhAkciiP: TDataSource;
    srAArt: TDataSource;
    qrAArtP: TADOQuery;
    qrATC_type_tov: TSmallintField;
    spY_FilterSkladIsMap: TIntegerField;
    Qr5: TADOQuery;
    ADOCoTest: TADOConnection;
    spY_ClearChek: TADOStoredProc;
    qrMBSpis: TADOQuery;
    srMBSpis: TDataSource;
    qrDop: TADOQuery;
    qrDopList: TADOQuery;
    srDop: TDataSource;
    srDopList: TDataSource;
    qrAvt: TADOQuery;
    qrAvtList: TADOQuery;
    srAvt: TDataSource;
    srAvtList: TDataSource;
    Qr6:TADOQuery;
    qrATC_veshestvo: TStringField;
    qrATC_forma: TStringField;
    qrATC_veshestvoen: TStringField;
    qrATC_formaen: TStringField;
    qrATCDop: TADOQuery;
    srATCDop: TDataSource;
    qrATC_cenaup: TBCDField;
    qrScanN: TADOQuery;
    srScanN: TDataSource;
    spY_FilterSkladCenaUp: TBCDField;
    qrZamPrep: TADOQuery;
    srZamPrep: TDataSource;
    qrCounters: TADOQuery;
    srCounters: TDataSource;
    qrCountNums: TADOQuery;
    srCountNums: TDataSource;
    qrTabdolgn: TStringField;
    qrMinus: TADOQuery;
    srMinus: TDataSource;
    Qr7: TADOQuery;
    qrZakazGr: TSmallintField;
    qrZakazZakazAuto: TSmallintField;
    qrZakazFSwitch: TSmallintField;
    qrNazn: TADOQuery;
    srNaznSpis: TDataSource;
    qrNaznSpis: TADOQuery;
    Qr8: TADOQuery;
    qrN: TADOQuery;
    srN: TDataSource;
    QrSt: TADOQuery;
    qrDB: TADOQuery;
    srDB: TDataSource;
    spY_ReindexBases: TADOStoredProc;
    qrMNN: TADOQuery;
    dsMnn: TDataSource;
    qrMnnList: TADOQuery;
    dsMnnList: TDataSource;
    qrWorkTimeK: TADOQuery;
    srWorkTimeK: TDataSource;
    qrWorkTimeP: TADOQuery;
    srWorkTimeP: TDataSource;
    qrTmW: TADOQuery;
    qrZpMess: TADOQuery;
    srZpMess: TDataSource;
    qrDtPrih: TADOQuery;
    srDtPrih: TDataSource;
    qrPrih: TADOQuery;
    srPrih1: TDataSource;
    qrPList1: TADOQuery;
    srPList1: TDataSource;
    tmprU: TADOQuery;
    QrEx3: TADOQuery;
    qrSpisForVozr: TADOQuery;
    srSpisForVozr: TDataSource;
    qrMess1: TADOQuery;
    srMess1: TDataSource;
    QrToOff: TADOQuery;
    srQrToOff: TDataSource;
    qrZakazPrice: TADOQuery;
    srZakazPrice: TDataSource;
    qrResA1: TADOQuery;
    srResA1: TDataSource;
    TimerQr10: TADOQuery;
    qrDateZP: TADOQuery;
    qrZakazP: TADOQuery;
    qrPlanA1: TADOQuery;
    srPlanA1: TDataSource;
    qrVzRes: TADOQuery;
    qrDateVZ: TADOQuery;
    QrG: TADOQuery;
    qrHozZak: TADOQuery;
    srHozZak: TDataSource;
    spY_ChekListKassa_Num: TStringField;
    qrHozZakid: TAutoIncField;
    qrHozZakdescr: TStringField;
    qrHozZaked: TStringField;
    qrHozZakkol: TBCDField;
    QrFnd: TADOQuery;
    spY_AddMessFromApteks: TADOStoredProc;
    dsTovInfo: TDataSource;
    qrShowNaklPriznak: TSmallintField;
    spY_FilterSkladSrokSkd: TBCDField;
    spY_MakeVozvratKarantin: TADOStoredProc;
    spY_WriteJournZ: TADOStoredProc;
    srTovGrafik: TDataSource;
    qrTovGrafik: TADOQuery;
    spY_FilterSkladType_Tov: TSmallintField;
    spY_FilterSkladGr: TIntegerField;
    spY_FilterSkladNds: TStringField;
    spY_FilterSkladUpak: TSmallintField;
    spY_FilterSkladOstatUp: TBCDField;
    qrFi: TADOQuery;
    srFi: TDataSource;
    qrFiDescr: TStringField;
    qrShowNaklisscan: TSmallintField;
    qrShowNaklbox: TLargeintField;
    srNoScanV: TDataSource;
    qrNoScanV: TADOQuery;
    spY_ShowChekSumSkd: TBCDField;
    spY_FilterSkladEndReg: TIntegerField;
    QrCen: TADOQuery;
    qrTabIsDop: TSmallintField;
    qrTabiszam: TSmallintField;
    qrTabDt_Begin: TDateTimeField;
    qrTabDt_End: TDateTimeField;
    tbGroups: TADOTable;
    tbGroupsTYPE_TOV: TSmallintField;
    tbGroupsDescr: TStringField;
    qrTekOtp: TADOQuery;
    srTekOtp: TDataSource;
    qrZakazTekOtp: TSmallintField;
    spY_FilterSkladSkd: TBCDField;
    qrBackCompName: TStringField;
    qrBackIsPrint: TWordField;
    qrATC_sostav: TStringField;
    qrSrokMov: TADOQuery;
    srSrokMov: TDataSource;
    qrZakazEndReg: TDateTimeField;
    srQr6: TDataSource;
    qrChekSumSkdNew: TBCDField;
    qrChekSkdNew: TBCDField;
    qrFolders: TADOQuery;
    qrFiles: TADOQuery;
    srFolders: TDataSource;
    srFiles: TDataSource;
    qrBackAccumSum: TBCDField;
    qrBackSpisSum: TBCDField;
    qrViolations: TADOQuery;
    srViolations: TDataSource;

    spY_FilterSkladIsAnnot: TWordField;
    spY_FilterSkladIsRecipt: TSmallintField;
    spY_FilterSkladColor: TIntegerField;
    spY_NaklListrow_id: TIntegerField;
    spY_NaklListiddoc: TIntegerField;
    spY_NaklListDate_Nakl: TDateTimeField;
    spY_NaklListnn_nakl: TStringField;
    spY_NaklListdebcrd: TSmallintField;
    spY_NaklListf_nds: TSmallintField;
    spY_NaklListSumma: TBCDField;
    spY_NaklListid_user: TSmallintField;
    spY_NaklListcompname: TWideStringField;
    spY_NaklListpriznak: TStringField;
    spY_NaklListCnt: TIntegerField;
    spY_NaklListnumscan: TIntegerField;
    spY_NaklListf: TIntegerField;
    spY_NaklListid_p: TSmallintField;
    spY_NaklListidpriznak: TSmallintField;
    spY_NaklListmarked: TWordField;

    QrX: TADOQuery;
    qrChekCenaP: TBCDField;
    qrChekSumSkdP: TBCDField;
    QrLog: TADOQuery;
    qrWorkPos: TADOQuery;
    srWorkPos: TDataSource;
    qrUp: TADOQuery;
    qrDown: TADOQuery;
    srUp: TDataSource;
    srDown: TDataSource;
    qrSop: TADOQuery;
    srSop: TDataSource;
    Qr11: TADOQuery;
    spY_FilterSkladOstatSklad: TBCDField;
    spY_FilterSkladOstatAptek: TBCDField;
    spY_FilterSkladInPrice: TWordField;
    spY_FilterSkladMakeFrom: TIntegerField;
    QrZ: TADOQuery;
    qrChekSumSpis: TBCDField;
    spY_FilterSkladDescr: TStringField;
    qrAlarm: TADOQuery;
    qrTmA: TADOQuery;
    qrA1: TADOQuery;
    qrA2: TADOQuery;
    qrA3: TADOQuery;
    srA1: TDataSource;
    srA2: TDataSource;
    srA3: TDataSource;
    qrVeshestva: TADOQuery;
    srVeshestva: TDataSource;
    qrvA1: TADOQuery;
    qrvA2: TADOQuery;
    qrvA3: TADOQuery;
    srvA1: TDataSource;
    srvA2: TDataSource;
    srvA3: TDataSource;
    spY_MakeBackAll: TADOStoredProc;
    qrReestr: TADOQuery;
    srReestr: TDataSource;
    tmrS: TADOQuery;
    qrReestr_S_700: TLargeintField;
    qrReestrii_S_4000: TStringField;
    qrReestri_S_2200: TStringField;
    qrReestrii_S_5000: TStringField;
    qrReestr_S_2200: TStringField;
    qrReestr_S_1200: TStringField;
    qrReestri_S_2100: TStringField;
    qrReestrii_N_1900: TBCDField;
    qrReestriii_S_2100: TDateTimeField;
    qrReestr_S_2600: TStringField;
    qrActReocForPrint: TStringField;
    spY_NaklListObl: TSmallintField;
    tmrP: TADOQuery;
    spY_NaklListDeliveryDate: TDateTimeField;
    spY_FilterSkladNumSeriya: TStringField;
    qrChekNumSeriya: TStringField;
    qrSpisNA: TADOQuery;
    srSpisNA: TDataSource;
    Qrtmp: TADOQuery;
    qrArmour: TADOQuery;
    srArmour: TDataSource;
    qrArmCh: TADOQuery;
    srArmCh: TDataSource;
    qrChekidres: TIntegerField;
    spY_FilterSkladKolRes: TIntegerField;
    qrEKKA: TADOQuery;
    qrJPaySlip: TADOQuery;
    srJPaySlip: TDataSource;
    qrJPaySlip1: TADOQuery;
    srJPaySlip1: TDataSource;
    QrLog1: TADOQuery;
    spY_WriteJournZ_: TADOStoredProc;
    qrEKKA1: TADOQuery;
    qrEKKA2: TADOQuery;
    QrKSumm1: TADOQuery;
    StringField4: TStringField;
    BCDField4: TBCDField;
    srKSumm1: TDataSource;
    QrKSumm1cnt: TIntegerField;
    spY_ChekListSummAll: TBCDField;
    spY_FilterSkladKolPrih: TBCDField;
    spY_FilterSkladCenaPrih: TBCDField;
    spY_FilterSkladNaklBox: TStringField;
    qrCheknsort: TIntegerField;
    qrActReocIsPrintCen: TWordField;
    qrTMC: TADOQuery;
    srTMC: TDataSource;
    qrTMCs: TADOQuery;
    srTMCs: TDataSource;
    qrActReocIsPrintAct: TWordField;
    qrReciptList: TADOQuery;
    srReciptList: TDataSource;
    srMakeFrom: TDataSource;
    spY_FilterSkladP1: TSmallintField;
    spY_FilterSkladP2: TSmallintField;
    spY_FilterSkladP3: TSmallintField;
    spY_FilterSkladPL1: TStringField;
    spY_FilterSkladPL2: TStringField;
    spY_FilterSkladPL3: TStringField;
    qrRegDop1: TADOQuery;
    qrRegDop2: TADOQuery;
    qrRegDop3: TADOQuery;
    srRegDop1: TDataSource;
    srRegDop2: TDataSource;
    srRegDop3: TDataSource;
    qrAnalog: TADOQuery;
    srAnalog: TDataSource;
    qrBackvzh: TLargeintField;
    spY_MakeFromList: TADOStoredProc;
    qrBackSumRecipt: TBCDField;
    qrBackTypeRecipt: TWordField;
    qrSpisArtCena: TADOQuery;
    srSpisArtCena: TDataSource;
    qrLgotList: TADOQuery;
    srLgotList: TDataSource;
    qrZamZamena: TADOQuery;
    srZamZamena: TDataSource;
    srMode: TDataSource;
    qrChekPL1: TStringField;
    qrChekPL2: TStringField;
    qrChekPL3: TStringField;
    spY_FilterSkladTypeTov: TWordField;
    qrDiagnostic: TADOQuery;
    srDiagnostic: TDataSource;
    qrRepairRep: TADOQuery;
    srRepairRep: TDataSource;
    QrDiagn: TADOQuery;
    qrAkciiList: TADOQuery;
    srAkciiList: TDataSource;
    QrEx5: TADOQuery;
    qrASpis: TADOQuery;
    srASpis: TDataSource;
    qrASpis1: TADOQuery;
    srASpis1: TDataSource;
    qrSprPart: TADOQuery;
    srSprPart: TDataSource;
    qrSprPartCh: TADOQuery;
    srSprPartCh: TDataSource;
    qrAStatD: TADOQuery;
    srAStatD: TDataSource;
    qrTStatD: TADOQuery;
    srTStatD: TDataSource;
    qrErr: TADOQuery;
    spY_AddToReserveExt: TADOStoredProc;
    qrPlanAptStat: TADOQuery;
    srPlanAptStat: TDataSource;
    QrX1: TADOQuery;
    QrX2: TADOQuery;
    QrExA: TADOQuery;
    QrX3: TADOQuery;
    qrChekIsIApteka: TIntegerField;
    qrAStatD1: TADOQuery;
    srAStatD1: TDataSource;
    qrBackid_doctor: TIntegerField;
    qrBackcard_doctor: TStringField;
    qrBackCenaP: TBCDField;
    qrBackSumSkdP: TBCDField;
    qrUserList: TADOQuery;
    srUserList: TDataSource;
    spY_FilterSkladNamesUA: TStringField;
    qrBackid_strah: TIntegerField;
    qrBackfransh: TBCDField;
    qrBacknn_polis: TStringField;
    qrBackdt_polis: TDateTimeField;
    spY_ChekListIsIApteka: TIntegerField;
    spY_ChekListIsStrah: TIntegerField;
    spY_NaklListid_p_descr: TStringField;
    spY_NaklListIsPostav: TStringField;
    qrNewReoc: TADOQuery;
    srNewReoc: TDataSource;
    qrReocList: TADOQuery;
    spY_NaklListpriznakI: TIntegerField;
    spY_NaklListIsPostavI: TSmallintField;
    qrPRep: TADOQuery;
    qrTotalStat: TADOQuery;
    srTotalStat: TDataSource;
    spY_NaklListEANDriver: TStringField;
    spY_FilterSkladIsSpisAll: TWordField;
    qrNeedAkt: TADOQuery;
    srNeedAkt: TDataSource;
    qrCalcPlan: TADOQuery;
    srCalcPlan: TDataSource;
    qrCalcPlan1: TADOQuery;
    srCalcPlan1: TDataSource;
    qrViolationList: TADOQuery;
    srViolationList: TDataSource;
    qrBackmedname: TStringField;
    qrBackcena_pilot: TBCDField;
    spY_Quarantine: TADOStoredProc;
    dsQuarantine: TDataSource;
    qrQuarantine: TADOQuery;
    spY_ShowChekcenap: TBCDField;
    spY_ShowChektype_tov: TSmallintField;
    spY_ChekListkn: TSmallintField;
    dsZ_insertion: TDataSource;
    qrZ_insertion: TADOQuery;
    qrBonusState: TADOQuery;
    srBonusState: TDataSource;
    QrExC: TADOQuery;
    spY_FilterSkladIsQuarantine: TIntegerField;
    ADOQ_Tmp: TADOQuery;
    tmQr: TADOQuery;
    dsClaimes: TDataSource;
    qrClaimes: TADOQuery;
    qrSeriaArt: TADOQuery;
    srSeriaArt: TDataSource;
    spY_FilterSkladakCena: TBCDField;
    spY_FilterSkladakType: TWordField;
    qrmtPer: TADOQuery;
    srmtPer: TDataSource;
    ADOLog: TADOConnection;
    qrSQLLog: TADOQuery;
    qrRROLog: TADOQuery;
    qrShowNaklTypeScan: TStringField;
    qrShowNaklDtScan: TDateTimeField;
    qrShowNaklUsers: TStringField;
    qrFarmZamCount: TADOQuery;
    srFarmZamCount: TDataSource;
    dsSrokHranWOPlases: TDataSource;
    qrSrokHranWOPlases: TADOQuery;
    dsPrepStorage: TDataSource;
    qrPrepStorage: TADOQuery;
    qrSoputstvCount: TADOQuery;
    dsSoputstvCount: TDataSource;
    spY_FilterSkladsPrioritet: TStringField;
    qrZakazabc_kol: TStringField;
    qrZakazabc_sum: TStringField;
    qrBackFranshStr: TBCDField;
    qrBackTypeChek: TWordField;
    qrBackSumB3: TBCDField;
    qrPMStat: TADOQuery;
    dsPMStat: TDataSource;
    procedure qrOtkazAfterInsert(DataSet: TDataSet);
    procedure qrOtkazAfterPost(DataSet: TDataSet);
    procedure qrBackAfterInsert(DataSet: TDataSet);
    procedure qrListAfterInsert(DataSet: TDataSet);
    procedure srPPerDataChange(Sender: TObject; Field: TField);
    procedure srResDataChange(Sender: TObject; Field: TField);
    procedure srDhAkciiDataChange(Sender: TObject; Field: TField);
    procedure srAArtPDataChange(Sender: TObject; Field: TField);
    procedure srAArtDataChange(Sender: TObject; Field: TField);
    procedure DataModuleCreate(Sender: TObject);
    procedure srDhAkciiPDataChange(Sender: TObject; Field:TField);
    procedure srDopDataChange(Sender:TObject; Field:TField);
    procedure srCountersDataChange(Sender: TObject; Field: TField);
    procedure qrVzResAfterPost(DataSet: TDataSet);
    procedure qrVzResBeforePost(DataSet: TDataSet);
    procedure qrHozZakBeforeInsert(DataSet: TDataSet);
    procedure srFoldersDataChange(Sender: TObject; Field: TField);
    procedure ADOCoExecuteComplete(Connection: TADOConnection; RecordsAffected: Integer; const Error: Error; var EventStatus: TEventStatus; const Command: _Command; const Recordset: _Recordset);
    procedure ADOCoWillExecute(Connection: TADOConnection; var CommandText: WideString; var CursorType: TCursorType; var LockType: TADOLockType; var CommandType: TCommandType; var ExecuteOptions: TExecuteOptions; var EventStatus: TEventStatus; const Command: _Command; const Recordset: _Recordset);

  private


  public

    F:Byte;

    procedure InsertArhChek(var CP:TChekPos);
    procedure WriteChek(var CP:TChekPos; P:Integer=0);
    procedure WriteToJournZ(CP:TChekPos);

    function  MakeVozvratKarantin(ID_User: Integer; Param:Byte=0):Real;
    function  MessBox(Mes:String; Btn:Integer):Integer; overload;
    function  MessBox(Mes:String):Integer;  overload;
    function  GetServerDate:TDateTime;

  end;

var DM:TDM;
    RL:TRecordLog;

implementation

uses
  OtkazU, ShareU, PeresortU, WorkResU, AkciiU, ProvizInfoU, CountersU, ViewVzResU, DocumentsU;

{$R *.dfm}

// Вывод настраиваемого окна сообщения
function TDM.MessBox(Mes:String; Btn:Integer):Integer;
 begin
  Result:=Application.MessageBox(PChar(Mes),PChar(MFC),Btn);
 end; {MessBox}

// Вывод сообщения с кнопкой OK и типом MB_ICONWARNING
function TDM.MessBox(Mes:String):Integer;
 begin
  Result:=Application.MessageBox(PChar(Mes),PChar(MFC),48);
 end; {MessBox}

// Возвращает дату на сервере
function TDM.GetServerDate:TDateTime;
 begin
  try
   spY_GetServerDate.Active:=False;
   spY_GetServerDate.Open;
   Result:=spY_GetServerDate.FieldByName('DT').AsDateTime;
  except
   Result:=Now;
  end;
 end;{GetServerDate}

// Добавляет позицию в ArhCheks
procedure TDM.InsertArhChek(var CP:TChekPos);
 begin
  try

   spY_InsertArhCh.Active:=False;

   // Данные, которые постоянны для всех позиций чека

   spY_InsertArhCh.Parameters.ParamValues['@vnumb_chek']:=CP.NumbChek;
   spY_InsertArhCh.Parameters.ParamValues['@vid_user']:=CP.ID_User;
   spY_InsertArhCh.Parameters.ParamValues['@vid_kassa']:=CP.ID_Kassa;
   spY_InsertArhCh.Parameters.ParamValues['@vnumcard']:=CP.NumCard;

   if Prm.IsKurier then
    spY_InsertArhCh.Parameters.ParamValues['@vkassa_num']:=CP.TypeOplatKur
   else
    spY_InsertArhCh.Parameters.ParamValues['@vkassa_num']:=CP.TypeOplat+1;

   spY_InsertArhCh.Parameters.ParamValues['@vdate_chek']:=CP.Date;
   spY_InsertArhCh.Parameters.ParamValues['@vvzh']:=CP.Vzh;


   // Данные, которые могут быть разными для позиций чека
   spY_InsertArhCh.Parameters.ParamValues['@vskd']:=CP.Skd;
   spY_InsertArhCh.Parameters.ParamValues['@vname']:=CP.ArtName;
   spY_InsertArhCh.Parameters.ParamValues['@vkod_name']:=CP.Kod_Name;
   spY_InsertArhCh.Parameters.ParamValues['@vkol']:=CP.Kol;
   spY_InsertArhCh.Parameters.ParamValues['@vcena']:=CP.Cena;
   spY_InsertArhCh.Parameters.ParamValues['@vtype_tov']:=CP.Type_Tov;
   spY_InsertArhCh.Parameters.ParamValues['@IsPrint']:=CP.IsPrint;

   spY_InsertArhCh.Parameters.ParamValues['@ASum']:=CP.AccumSum;
   spY_InsertArhCh.Parameters.ParamValues['@SSum']:=CP.SumSpis;
   spY_InsertArhCh.Parameters.ParamValues['@vsumskd']:=CP.SumSkd;
   spY_InsertArhCh.Parameters.ParamValues['@id_doctor']:=CP.id_doctor;
   spY_InsertArhCh.Parameters.ParamValues['@card_doctor']:=CP.card_doctor;

   spY_InsertArhCh.Parameters.ParamValues['@fransh']:=CP.Fransh;
   spY_InsertArhCh.Parameters.ParamValues['@id_strah']:=CP.id_strah;
   spY_InsertArhCh.Parameters.ParamValues['@nn_polis']:=CP.nn_polis;
   spY_InsertArhCh.Parameters.ParamValues['@dt_polis']:=CP.dt_polis;
   spY_InsertArhCh.Parameters.ParamValues['@rowid']:=CP.Row_id_arh;

   spY_InsertArhCh.Parameters.ParamValues['@franshstr']:=CP.FranshStr;
   spY_InsertArhCh.Parameters.ParamValues['@TypeChek']:=CP.TypeChek;
   spY_InsertArhCh.Parameters.ParamValues['@SumB3']:=CP.SumB3;

   spY_InsertArhCh.Open;
   CP.Row_id_arh:=spY_InsertArhCh.FieldByName('row_id').AsInteger;

  except
   on E:Exception do
    if Pos('duplicate key',E.Message)=0 then AbortM('Ошибка записи в Архив чеков! '+E.Message);
  end;

 end; {InsertArhChek}

// Полная обработка пробивки чека и возвратов по БД
{procedure TDM.WriteChek(var CP:TChekPos);
 begin
  try
   DM.spY_WriteChek.Close;
   DM.spY_WriteChek.Parameters.ParamValues['@pid_user']:=CP.ID_User;
   DM.spY_WriteChek.Parameters.ParamValues['@pnchek']:=CP.NumbChek;

   if MainF.TypeChek=TC_KURER then
    DM.spY_WriteChek.Parameters.ParamValues['@ptypeopl']:=CP.TypeOplat+2 else

//   if MainF.TypeChek in [TC_SERTIF,TC_STRETCH] then
//    DM.spY_WriteChek.Parameters.ParamValues['@ptypeopl']:=5
//   else
    DM.spY_WriteChek.Parameters.ParamValues['@ptypeopl']:=CP.TypeOplat;

   DM.spY_WriteChek.Parameters.ParamValues['@pid_kassa']:=CP.ID_Kassa;
   DM.spY_WriteChek.Parameters.ParamValues['@dat']:=CP.Date;
   DM.spY_WriteChek.Parameters.ParamValues['@priznak']:=CP.Priznak;
   DM.spY_WriteChek.Parameters.ParamValues['@pvzh']:=CP.Vzh;
   DM.spY_WriteChek.Parameters.ParamValues['@pvzdescr']:=CP.VzDescr;
   DM.spY_WriteChek.Parameters.ParamValues['@pPayRecipt']:=CP.PrPayRecipt;

   if CP.SumSertif>0 then
    begin
     DM.spY_WriteChek.Parameters.ParamValues['@ncStretch']:=CP.NumCardStretch;
     DM.spY_WriteChek.Parameters.ParamValues['@SumSertif']:=CP.SumSertif
    end else begin
              DM.spY_WriteChek.Parameters.ParamValues['@ncStretch']:=-1;
              DM.spY_WriteChek.Parameters.ParamValues['@SumSertif']:=0;
             end;

   DM.spY_WriteChek.Parameters.ParamValues['@IdRes']:=CP.IdRes;
   DM.spY_WriteChek.Parameters.ParamValues['@ncRecipt']:=CP.NumCardRecipt;
   DM.spY_WriteChek.Parameters.ParamValues['@ncProf']:=CP.NumCardProf;
   DM.spY_WriteChek.Parameters.ParamValues['@IDMess']:=CP.IDMess;

   if MainF.TypeChek=TC_PILOT then DM.spY_WriteChek.Parameters.ParamValues['@Pacient']:=CP.Pacient
                              else DM.spY_WriteChek.Parameters.ParamValues['@Pacient']:='';

   DM.spY_WriteChek.Open;

   if DM.spY_WriteChek.IsEmpty then Abort;
   if DM.spY_WriteChek.FieldByName('Res').AsInteger<>1 then Abort;
   CP.Bonus:=DM.spY_WriteChek.FieldByName('Bonus').AsFloat;
   CP.BonusAll:=DM.spY_WriteChek.FieldByName('BonusAll').AsFloat;
  except
   on E:Exception do AbortM('Ошибка записи в архив чеков! '+ExceptMessage(E));
  end;
 end; {WriteChek}


// Полная обработка пробивки чека и возвратов по БД
procedure TDM.WriteChek(var CP:TChekPos; P:Integer=0);
var i,q:Integer;
    SL:TStringList;
 begin
  try

   DM.spY_WriteChek.Close;
   DM.spY_WriteChek.Parameters.ParamValues['@pid_user']:=CP.ID_User;
   DM.spY_WriteChek.Parameters.ParamValues['@pnchek']:=CP.NumbChek;

   if (CP.IsPayMaster=True) or (CP.IsIAptekaCredit=True) then DM.spY_WriteChek.Parameters.ParamValues['@ptypeopl']:=7 else
   if CP.B1  then DM.spY_WriteChek.Parameters.ParamValues['@ptypeopl']:=8 else

   if CP.TypeChek=TC_KURER then DM.spY_WriteChek.Parameters.ParamValues['@ptypeopl']:=CP.TypeOplat+2 else
    begin
     if (Prm.IsKurier) then
      DM.spY_WriteChek.Parameters.ParamValues['@ptypeopl']:=CP.TypeOplatKur //CP.TypeOplat+CP.DopTypeOplat+6 // попытка разделить безготивку 3
     else
     if (CP.TypeOplatBS<>CP.TypeOplat) then
      DM.spY_WriteChek.Parameters.ParamValues['@ptypeopl']:=CP.TypeOplatBS
     else
      DM.spY_WriteChek.Parameters.ParamValues['@ptypeopl']:=CP.TypeOplat+CP.DopTypeOplat
    end;

   if CP.IsPrint=1 then DM.spY_WriteChek.Parameters.ParamValues['@IsPrint']:=1
                   else DM.spY_WriteChek.Parameters.ParamValues['@IsPrint']:=0;

   DM.spY_WriteChek.Parameters.ParamValues['@pid_kassa']:=CP.ID_Kassa;
   DM.spY_WriteChek.Parameters.ParamValues['@dat']:=CP.Date;

   DM.spY_WriteChek.Parameters.ParamValues['@NumGeptralCard']:=CP.NumGeptralCard;
   DM.spY_WriteChek.Parameters.ParamValues['@NumKsareltoCard']:=CP.NumKsareltoCard;

   if CP.IsTerminal then
    begin
     DM.spY_WriteChek.Parameters.ParamValues['@IsTerminal']:=1;
     DM.spY_WriteChek.Parameters.ParamValues['@InvoiceNum']:=CP.InvoiceNum;
     DM.spY_WriteChek.Parameters.ParamValues['@Merchant' ]:=CP.Merchant;
    end else begin
              DM.spY_WriteChek.Parameters.ParamValues['@IsTerminal']:=0;
              DM.spY_WriteChek.Parameters.ParamValues['@InvoiceNum']:=Variants.Null;
              DM.spY_WriteChek.Parameters.ParamValues['@Merchant']:=Variants.Null;
             end;

   if P=0 then DM.spY_WriteChek.Parameters.ParamValues['@priznak']:=CP.Priznak
          else DM.spY_WriteChek.Parameters.ParamValues['@priznak']:=P;

   DM.spY_WriteChek.Parameters.ParamValues['@pvzh']:=CP.Vzh;
   DM.spY_WriteChek.Parameters.ParamValues['@pvzdescr']:=CP.VzDescr;
   DM.spY_WriteChek.Parameters.ParamValues['@pPayRecipt']:=CP.PrPayRecipt;

   if CP.SumSertif>0 then
    begin
     DM.spY_WriteChek.Parameters.ParamValues['@ncStretch']:=CP.NumCardStretch;
     DM.spY_WriteChek.Parameters.ParamValues['@SumSertif']:=CP.SumSertif
    end else begin
              DM.spY_WriteChek.Parameters.ParamValues['@ncStretch']:=-1;
              DM.spY_WriteChek.Parameters.ParamValues['@SumSertif']:=0;
             end;

   if CP.id_doctor>0 then
    begin
     DM.spY_WriteChek.Parameters.ParamValues['@id_doctor']:=CP.id_doctor;
     DM.spY_WriteChek.Parameters.ParamValues['@card_doctor']:=CP.card_doctor;
    end else begin
              DM.spY_WriteChek.Parameters.ParamValues['@id_doctor']:=0;
              DM.spY_WriteChek.Parameters.ParamValues['@card_doctor']:='';
             end;

   DM.spY_WriteChek.Parameters.ParamValues['@IdRes']:=CP.IdRes;
   DM.spY_WriteChek.Parameters.ParamValues['@ncRecipt']:=CP.NumCardRecipt;
   DM.spY_WriteChek.Parameters.ParamValues['@ncProf']:=CP.NumCardProf;
   DM.spY_WriteChek.Parameters.ParamValues['@IDMess']:=CP.IDMess;

   DM.spY_WriteChek.Parameters.ParamValues['@NewVersion']:=1;

   if (CP.TypeChek in TC_DL) then
    begin
     DM.spY_WriteChek.Parameters.ParamValues['@FIODoctor']:=CP.FIODoctor1;
     DM.spY_WriteChek.Parameters.ParamValues['@Pacient']:=CP.Pacient;
     DM.spY_WriteChek.Parameters.ParamValues['@NumRecipt']:=CP.NRecipt;
    end else begin
              DM.spY_WriteChek.Parameters.ParamValues['@FIODoctor']:=Variants.Null;
              DM.spY_WriteChek.Parameters.ParamValues['@Pacient']:='';
              DM.spY_WriteChek.Parameters.ParamValues['@NumRecipt']:=Variants.NULL;
             end;

{
  if (CP.TypeChek=TC_PILOT) or (CP.TypeChek=-1) or (CP.B1=True) then DM.spY_WriteChek.Parameters.ParamValues['@Pacient']:=CP.Pacient
                                                                 else DM.spY_WriteChek.Parameters.ParamValues['@Pacient']:='';
}
  {
   if CP.TypeChek=TC_RECIPT_PL then
    begin
     DM.spY_WriteChek.Parameters.ParamValues['@MedName']:=CP.MedName;
     DM.spY_WriteChek.Parameters.ParamValues['@FIODoctor']:=CP.FIODoctor;
     DM.spY_WriteChek.Parameters.ParamValues['@Pacient']:=CP.Pacient;
     DM.spY_WriteChek.Parameters.ParamValues['@TypeRecipt']:=CP.TypeRecipt;
    end else begin
              DM.spY_WriteChek.Parameters.ParamValues['@MedName']:=NULL;
              DM.spY_WriteChek.Parameters.ParamValues['@PacientAdr']:=NULL;
              DM.spY_WriteChek.Parameters.ParamValues['@Pacient']:=NULL;
              DM.spY_WriteChek.Parameters.ParamValues['@FIODoctor']:=NULL;
              DM.spY_WriteChek.Parameters.ParamValues['@TypeRecipt']:=NULL;
             end;
  }
  {
   if (CP.B1=True) then
    begin
     DM.spY_WriteChek.Parameters.ParamValues['@NumRecipt']:=CP.NumRecipt;
     DM.spY_WriteChek.Parameters.ParamValues['@MedName']:=CP.MedName;
     DM.spY_WriteChek.Parameters.ParamValues['@PacientAdr']:=CP.PacientAdr;
     DM.spY_WriteChek.Parameters.ParamValues['@FIODoctor']:=CP.FIODoctor;
    end else begin
              DM.spY_WriteChek.Parameters.ParamValues['@NumRecipt']:=NULL;
              DM.spY_WriteChek.Parameters.ParamValues['@MedName']:=NULL;
              DM.spY_WriteChek.Parameters.ParamValues['@PacientAdr']:=NULL;
              DM.spY_WriteChek.Parameters.ParamValues['@FIODoctor']:=NULL;
             end;
  }
   for i:=0 to 11 do
    DM.spY_WriteChek.Parameters.ParamValues['@Sum'+IntToStr(i)]:=CP.Sums[i];

   DM.spY_WriteChek.Parameters.ParamValues['@VzhS']:=CP.VzhS;

   if P<>0 then DM.spY_WriteChek.Parameters.ParamValues['@NumZ']:=CP.NumZ
           else DM.spY_WriteChek.Parameters.ParamValues['@NumZ']:=-1;

   DM.spY_WriteChek.Parameters.ParamValues['@Fn']:=CP.Fn;
   DM.spY_WriteChek.Parameters.ParamValues['@TypeEKKA']:=CP.TypeEKKA;

   DM.spY_WriteChek.Parameters.ParamValues['@TypeCard']:=CP.TypeCardNew;

   if (CP.NumCardDnepr<>-1) and (CP.SumSertif>0) then DM.spY_WriteChek.Parameters.ParamValues['@SumDnepr']:=CP.SumSertif
                                                 else DM.spY_WriteChek.Parameters.ParamValues['@SumDnepr']:=0;

//   DM.spY_WriteChek.Parameters.ParamValues['@SumCash']:=CP.SumCashToCard;
//   ShowMessage('12345678');
   DM.spY_WriteChek.Open;
//   ShowMessage('SumChek= '+CurrToStr(DM.spY_WriteChek.FieldByName('SumChek').AsCurrency));

   Cp.ResBack:=DM.spY_WriteChek.FieldByName('ResBack').AsInteger;
   if DM.spY_WriteChek.IsEmpty then raise EAbort.Create('Процедура закрытия чека незавершена!');
   if DM.spY_WriteChek.FieldByName('Res').AsInteger<>1 then raise EAbort.Create('Процедура закрытия чека незавершена!');

    try
     Sl:=TStringList.Create;
     SL.Add(DM.spY_WriteChek.FieldByName('SumChek').AsString+' and '+CurrToStr(CP.SumChek));

     SL.SaveToFile('C:\Log\Sums4.txt');

     SL.Free;
    except
    end;

   if Prm.UserRole<>R_ADMIN then
    begin
     if RoundTo(DM.spY_WriteChek.FieldByName('SumChek').AsCurrency,-2)<>RoundTo(CP.SumChek,-2) then raise EAbort.Create('Неверная сумма чека!');
    end;

   {
    if P<>0 then CP.RealizDay:=DM.spY_WriteChek.FieldByName('RealizDay').AsCurrency+CP.SumChek
           else CP.RealizDay:=DM.spY_WriteChek.FieldByName('RealizDay').AsCurrency;
   }

    DM.QrEx.Close;
//     DM.QrEx.SQL.Text:='select * from PromoKod where id='+DM.spY_WriteChek.FieldByName('id_promo').AsString;
    DM.QrEx.SQL.Text:='exec spY_GetPromoKod '+IntToStr(CP.NumbChek)+','+IntToStr(CP.Vzh);
    DM.QrEx.Open;
    if DM.QrEx.IsEmpty=False then
    CP.IsPromo:=False;
    for q:=Low(CP.PromoStr) to High(CP.PromoStr) do
     begin
      CP.PromoStr[q]:=DM.QrEx.FieldByName('Str'+IntToStr(q+1)).AsString;
      if (CP.IsPromo=False) and (CP.PromoStr[q]<>'') then CP.IsPromo:=True;
     end;

   CP.RealizDay:=DM.spY_WriteChek.FieldByName('RealizDay').AsCurrency;

   CP.Bonus:=DM.spY_WriteChek.FieldByName('Bonus').AsFloat;
   CP.BonusAll:=DM.spY_WriteChek.FieldByName('BonusAll').AsFloat;

  except
   on E:Exception do raise EAbort.Create('Ошибка записи в архив чеков! '+E.Message);
  end;

 end; {WriteChek}

//   AbortM('Ошибка записи в архив чеков! '+ExceptMessage(E));

procedure TDM.WriteToJournZ(CP:TChekPos);
var i:Integer;
 begin

  DM.spY_WriteJournZ.Close;
  DM.spY_WriteJournZ.Parameters.ParamValues['@dt']:=Date;
  DM.spY_WriteJournZ.Parameters.ParamValues['@pvzh']:=CP.Vzh;
  DM.spY_WriteJournZ.Parameters.ParamValues['@pid_kassa']:=Opt.KassaID;
  DM.spY_WriteJournZ.Parameters.ParamValues['@Readonly']:=0;
  DM.spY_WriteJournZ.Parameters.ParamValues['@RealizDay']:=0;

  for i:=0 to 11 do
   DM.spY_WriteJournZ.Parameters.ParamValues['@Sum'+IntToStr(i)]:=CP.Sums[i];

  DM.spY_WriteJournZ.Parameters.ParamValues['@VzhS']:=CP.VzhS;
  DM.spY_WriteJournZ.Parameters.ParamValues['@Fn']:=CP.Fn;

  DM.spY_WriteJournZ.Parameters.ParamValues['@NumZ']:=CP.NumZ;
  DM.spY_WriteJournZ.Parameters.ParamValues['@TypeEKKA']:=CP.TypeEKKA;

  DM.spY_WriteJournZ.Parameters.ParamValues['@DateK']:=CP.DateK;

  for i:=12 to 15 do
   DM.spY_WriteJournZ.Parameters.ParamValues['@Sum'+IntToStr(i)]:=CP.Sums[i];

  DM.spY_WriteJournZ.ExecProc;
  if DM.spY_WriteJournZ.Parameters.ParamValues['@RETURN_VALUE']<>777 then raise EAbort.Create('Ошибка записи информации по Z-отчетам!');

 end;

function TDM.MakeVozvratKarantin(ID_User:Integer; Param:Byte=0):Real;
 begin
  Result:=0;
  spY_MakeVozvratKarantin.Close;
  spY_MakeVozvratKarantin.Parameters.ParamValues['@idu']:=ID_User;
  spY_MakeVozvratKarantin.Parameters.ParamValues['@Param']:=Param;
  spY_MakeVozvratKarantin.Open;
  if DM.spY_MakeVozvratKarantin.FieldByName('Res').AsInteger<>1 then raise EAbort.Create('Невозможно завершить операцию!');
  Result:=DM.spY_MakeVozvratKarantin.FieldByName('SumVzr').AsFloat;
 end;

procedure TDM.qrOtkazAfterInsert(DataSet:TDataSet);
 begin
  DataSet.Cancel;
 end;

procedure TDM.qrOtkazAfterPost(DataSet:TDataSet);
 begin
  if Assigned(OtkazF) then OtkazF.FilterOtkaz;
 end;

procedure TDM.qrBackAfterInsert(DataSet:TDataSet);
 begin
  DataSet.Cancel;
 end;

procedure TDM.qrListAfterInsert(DataSet:TDataSet);
 begin
  DataSet.Cancel;
 end;

procedure TDM.srPPerDataChange(Sender:TObject; Field:TField);
 begin
  if Assigned(PeresortF) then PeresortF.ShowPer;
 end;

procedure TDM.srResDataChange(Sender:TObject; Field:TField);
 begin
  if Not Assigned(WorkResF) then Exit;
  WorkResF.FilterResPos;
  if DM.qrRes.IsEmpty then Exit;
  WorkResF.FlashStatus;
 end;

procedure TDM.srDhAkciiDataChange(Sender:TObject; Field:TField);
 begin
  if AkciiF=nil then Exit;
  if Not AkciiF.Showing then Exit;
  AkciiF.ShowSpis(DM.qrAArt,'art_code');
 end;

procedure TDM.srAArtPDataChange(Sender:TObject; Field:TField);
 begin
  if AkciiF=nil then Exit;
  if Not AkciiF.Showing then Exit;
  AkciiF.ShowAkciiRules;
 end;

procedure TDM.srAArtDataChange(Sender:TObject; Field:TField);
 begin
  if AkciiF=nil then Exit;
  if Not AkciiF.Showing then Exit;
  AkciiF.ShowAkciiAdd;
 end;

procedure TDM.srDopDataChange(Sender:TObject; Field:TField);
 begin
  if ProvizInfoF=nil then Exit;
  if Not ProvizInfoF.Showing then Exit;
  ProvizInfoF.ShowDAList(qrDop,qrDopList);
 end;

procedure TDM.DataModuleCreate(Sender:TObject);
 begin
  ADOCoTest.Connected:=False;
  ADOCo.Connected:=False;
 end;

procedure TDM.srDhAkciiPDataChange(Sender:TObject; Field:TField);
 begin
  if AkciiF=nil then Exit;
  if Not AkciiF.Showing then Exit;
  AkciiF.ShowSpisP(DM.qrAArtP);
 end;

// Provider=SQLOLEDB.1; Password=;Persist Security Info=True; User ID=sa; Initial Catalog=APTEKA_NET; Data Source=SERGEY
// Provider=SQLOLEDB.1; Password=ckj#ktn#djc;Persist Security Info=True; User ID=admin;Initial Catalog=BMESS;Data Source=DB\SQL5
// Provider=SQLNCLI.1;  Password=bmw525; Persist Security Info=True;User ID=sa;Initial Catalog=APTEKA_NET;Data Source=SERGEY\SERG

procedure TDM.srCountersDataChange(Sender:TObject; Field:TField);
 begin
  if Assigned(CountersF) then CountersF.ShowNums;
 end;

procedure TDM.qrVzResAfterPost(DataSet: TDataSet);
 begin
  if Assigned(ViewVzResF)=False then Exit;
  ViewVzResF.ShowVzRes;
 end;

procedure TDM.qrVzResBeforePost(DataSet:TDataSet);
 begin
//  if Assigned(ViewVzResF)=False then Exit;
//  ShowMessage(qrVzRes.FieldByName('KolEdit').AsString);
 end;

procedure TDM.qrHozZakBeforeInsert(DataSet:TDataSet);
 begin
  Abort;
 end;

// Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False; Initial Catalog=BMESS;Data Source=XEON
// Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False; Initial Catalog=EKKA_NET;Data Source=DB\SQL5

procedure TDM.srFoldersDataChange(Sender: TObject; Field: TField);
 begin
  if Assigned(DocumentsF) then DocumentsF.ShowFiles;
 end;

{

  6000 106634796 - 2900
 10500  95717319 - 2097  -- выплачена

 5211 5374 1818 1850

}

procedure TDM.ADOCoWillExecute(Connection: TADOConnection; var CommandText: WideString; var CursorType: TCursorType; var LockType: TADOLockType; var CommandType: TCommandType; var ExecuteOptions: TExecuteOptions; var EventStatus: TEventStatus;  const Command: _Command; const Recordset: _Recordset);
 begin
  if Prm.IsLogAll=False then Exit;
  try
   RL.SQL1:=CommandText;
   RL.DtStart:=Now;
   RL.id_kassa:=Opt.KassaID;
   RL.IP:='';
   if Assigned(MainF) then RL.IP:=MainF.IP;
   RL.Error:='';
  except
  end;
 end;

procedure TDM.ADOCoExecuteComplete(Connection: TADOConnection; RecordsAffected: Integer; const Error: Error; var EventStatus: TEventStatus; const Command: _Command; const Recordset: _Recordset);
 begin
  if Prm.IsLogAll=False then Exit;
  try
   RL.SQL2:='';
   if RL.SQL1<>Command.CommandText then
    RL.SQL2:=Command.CommandText;
   RL.DtEnd:=Now;
   RL.Error:='';
   if Assigned(Error) then RL.Error:=Error.Description;
   qrSQLLog.Close;
   qrSQLLog.SQL.Text:='exec Report..spY_RegisterSQL :pSQL1, :pSQL2, '''+FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz',RL.DtStart)+''','''+FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz',RL.DtEnd)+''',:pIDK,:pIP,:pErr';

//   qrSQLLog.SQL.Text:='exec Report..spY_RegisterSQL :pSQL1, :pSQL2, :pDtStart,:pDtEnd,:pIDK,:pIP,:pErr';
   qrSQLLog.Parameters.ParseSQL(qrSQLLog.SQL.Text,True);
   qrSQLLog.Parameters.ParamByName('pSQL1').Value:=RL.SQL1;
   qrSQLLog.Parameters.ParamByName('pSQL2').Value:=RL.SQL2;
//   qrSQLLog.Parameters.ParamByName('pDtStart').Value:=RL.DtStart;
//   qrSQLLog.Parameters.ParamByName('pDtEnd').Value:=RL.DtEnd;
   qrSQLLog.Parameters.ParamByName('pIDK').Value:=RL.id_kassa;
   qrSQLLog.Parameters.ParamByName('pIP').Value:=RL.IP;
   qrSQLLog.Parameters.ParamByName('pErr').Value:=RL.Error;
   qrSQLLog.ExecSQL;
  except
  end;
 end;

END.


