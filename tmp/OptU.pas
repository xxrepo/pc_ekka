unit OptU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, Util, OpenLib, Grids,
  DBGrids, DBCtrls;

type

  TChang=Record
          IsChanged:Boolean;   // Были ли изменения
          NeedRestart:Boolean; // Необходимость перезапуска программы
         end;

  TChList=Array of TChang;       

  TOptF = class(TForm)
    Panel1: TPanel;
    TreeView1: TTreeView;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    pnsect31: TPanel;
    Edit1: TLabeledEdit;
    Edit2: TLabeledEdit;
    Edit3: TLabeledEdit;
    Edit4: TLabeledEdit;
    BitBtn3: TBitBtn;
    pnsect32: TPanel;
    Edit5: TLabeledEdit;
    Edit6: TLabeledEdit;
    Label2: TLabel;
    Bevel2: TBevel;
    Label3: TLabel;
    Edit7: TLabeledEdit;
    Image1: TImage;
    Image2: TImage;
    Label4: TLabel;
    Image3: TImage;
    pnsect21: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Image4: TImage;
    Bevel3: TBevel;
    Bevel4: TBevel;
    pnsect22: TPanel;
    DBGrid2: TDBGrid;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Image5: TImage;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Bevel5: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure SetChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);

  private
    FNeedRestart:Boolean;

    procedure SetPanelVis(N:Integer);
    procedure InitAllPanels;
    procedure InitPanel(N:Integer);
    procedure NewItem(N:Integer; B1,B2:Boolean);

    function  GetNumPanel(Pn:TObject):Integer;
    function  SavePanel(N:Integer):Boolean;
    function  SaveChanges:Boolean;
    function  GetTreeIndex(N:Integer):Integer;
    function  GetTreeCaption(I:Integer):String;

  public

    property NeedRestart:Boolean read FNeedRestart;

  end;

const PNSECT='pnsect';

var OptF:TOptF=nil;
    ChList:TChList;
    AGr:Array of Record
                  T:Integer;
                  D:String;
                 end;

implementation

uses MainU, DataModuleU, AESkdU;

{$R *.dfm}

function OptFF(S:TComponent):TOptF;
 begin
  try
   if OptF=nil then OptF:=TOptF.Create(S);
   Result:=OptF;
  except
   Result:=nil;
  end;
 end;

// Create формы
procedure TOptF.FormCreate(Sender: TObject);
 begin
  Caption:=MFC;
  FNeedRestart:=False;
  TreeView1.FullExpand;
  SetLength(ChList,0);
  InitAllPanels;
 end; {FormCreate}

// Номер панели по ее имени
function TOptF.GetNumPanel(Pn:TObject):Integer;
var ss:String;
 begin
  try                        
   ss:=(TComponent(Pn).Name);
   System.Delete(ss,1,Length(PNSECT));
   Result:=StrToInt(ss);
  except
   Result:=0;
  end;
 end; {GetNumPanel}

// инициализация всех панелей
procedure TOptF.InitAllPanels;
var i:Integer;
 begin
  for i:=0 to ComponentCount-1 do
   if Copy(Components[i].Name,1,Length(PNSECT))=PNSECT then
    InitPanel(GetNumPanel(Components[i]));
  // Сброс счетчика изменений
  for i:=Low(ChList) to High(ChList) do ChList[i].IsChanged:=False;
 end; {InitAllPanels}

// Добавляет новый елемент в ChList если нужно
procedure TOptF.NewItem(N:Integer; B1,B2:Boolean);
 begin
  if N>High(ChList) then SetLength(ChList,N+1);
  ChList[N].IsChanged:=B1; ChList[N].NeedRestart:=B2;
 end; {NewItem}

// Инициализация панели по номеру
procedure TOptF.InitPanel(N:Integer);
var CA,i:Integer;
 begin
  Case N of
   21:begin // Группы товаров
       SetLength(AGr,0);
       NewItem(N,False,True);
       MakeGradientHeightI(Image4,clWhite,$009CB8A4);
       DrawSimpleRect(Image4,clBtnFace);
       DM.tbGroups.Close;
       DM.tbGroups.Open;
       for i:=1 to DM.tbGroups.RecordCount do
        begin
         if i=1 then DM.tbGroups.First else DM.tbGroups.Next;
         CA:=High(AGr)+1; SetLength(AGr,CA+1);
         AGr[CA].T:=DM.tbGroups.FieldByName('TYPE_TOV').AsInteger;
         AGr[CA].D:=DM.tbGroups.FieldByName('DESCR').AsString;
        end;
      end;
   22:begin // Скидки
       NewItem(N,False,False);
       MakeGradientHeightI(Image5,clWhite,$0083A8B1);
       DrawSimpleRect(Image5,clBtnFace);
       DM.qrSKD.Close;
       DM.qrSKD.Open;
      end;
   31:begin // Подключение
       NewItem(N,False,True);
       Edit1.Text:=Opt.Server;
       Edit2.Text:=Opt.Base;
       Edit3.Text:=Opt.BaseUser;
       Edit4.Text:=Opt.BasePassw;
       MakeGradientHeightI(Image1,clWhite,$0000C5C5);
       DrawSimpleRect(Image1,clBtnFace);
       MakeGradientHeightI(Image2,clWhite,$00B3B355);
       DrawSimpleRect(Image2,clBtnFace);
      end;
   32:begin // Служебные
       NewItem(N,False,True);
       Edit7.Text:=Prm.AptekaNameRU;
       Edit5.Text:=IntToStr(Prm.AptekaID);
       Edit6.Text:=MainF.ReadFromIni('NChek','0');
       MakeGradientHeightI(Image3,clWhite,$007588D1);
       DrawSimpleRect(Image3,clBtnFace);
      end;
  end;
 end; {InitPanel}

// Кнопка закрыть
procedure TOptF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end; {BitBtn2Click}

// Выбор елемента дерева
procedure TOptF.TreeView1Change(Sender: TObject; Node: TTreeNode);
 begin
  Label1.Caption:=TreeView1.Selected.Text;
  SetPanelVis(TreeView1.Selected.SelectedIndex);
 end; {TreeView1Change}

// Устанавливает видимость панели по номеру
procedure TOptF.SetPanelVis(N:Integer);
var i:Integer;
 begin
  for i:=0 to ComponentCount-1 do
   if Copy(Components[i].Name,1,Length(PNSECT))=PNSECT then
    if Components[i].Name=PNSECT+IntToStr(N) then TControl(Components[i]).Visible:=True
                                             else TControl(Components[i]).Visible:=False;
 end; {SetPanelVis}

// Фиксация факта измений на панели
procedure TOptF.SetChange(Sender: TObject);
 begin
  ChList[GetNumPanel(TControl(Sender).Parent)].IsChanged:=True;
 end; {SetChange}

// Номер элемента дерева по его SelectedIndex 
function TOptF.GetTreeIndex(N:Integer):Integer;
var i:Integer;
 begin
  try
   for i:=0 to TreeView1.Items.Count-1 do
    if TreeView1.Items[i].SelectedIndex=N then begin Result:=i; Exit; end;
   raise EAbort.Create('');
  except
   Result:=-1;
  end;
 end; {GetTreeIndex}

// Caption элемента дерева
function TOptF.GetTreeCaption(I:Integer):String;
 begin
  try
   if i<0 then raise EAbort.Create('');
   Result:=TreeView1.Items[i].Text;
  except
   Result:='';
  end;
 end; {GetTreeCaption}

// Сохранение изменений одной панели                          
function TOptF.SavePanel(N:Integer):Boolean;
var i,j,q,Ix:Integer;

const SVE='sVe';

 begin
  Ix:=0;
  try
   Ix:=GetTreeIndex(N);
   Case N of
    21:begin
        DM.tbGroups.Close;
        DM.tbGroups.Open;
        if DM.tbGroups.IsEmpty then raise EAbort.Create(SVE+'Группы товаров должны быть определены!');
        q:=0;
        for i:=1 to DM.tbGroups.RecordCount do
         begin
          if i=1 then DM.tbGroups.First else DM.tbGroups.Next;
          for j:=Low(AGr) to High(AGr) do
           if (AGr[j].T=DM.tbGroups.FieldByName('TYPE_TOV').AsInteger) and
              (AGr[j].D=DM.tbGroups.FieldByName('Descr').AsString)     then Inc(q);
         end;
        if (q<>DM.tbGroups.RecordCount) or ((High(AGr)+1)<>(DM.tbGroups.RecordCount)) then ChList[N].IsChanged:=True;
       end;
   end;
   if ChList[N].IsChanged then
    begin
     Case N of
      31:begin // Подключения
          if Not(MainF.WriteToIni('ServerName',Edit1.Text)) then raise EAbort.Create(SVE+'Ошибка записи поля "Имя сервера"');
          if Not(MainF.WriteToIni('BaseName',Edit2.Text)) then raise EAbort.Create(SVE+'Ошибка записи поля "Имя базы"');
          if Not(MainF.WriteToIni('BaseUser',Edit3.Text)) then raise EAbort.Create(SVE+'Ошибка записи поля "Имя пользователя"');
          if Not(MainF.WriteToIni('BasePassw',Edit4.Text)) then raise EAbort.Create(SVE+'Ошибка записи поля "Пароль"');
         end;
      32:begin  // Служебные
          if Not (IsInteger(Edit5.Text)) then raise EAbort.Create(SVE+'Введите числовое значение в поле "Номер аптеки"');
          if Not (IsInteger(Edit6.Text)) then raise EAbort.Create(SVE+'Введите числовое значение в поле "Номер чека"');
          if Edit7.Text='' then raise EAbort.Create(SVE+'Введите значение в поле "Название аптеки"');
          if Not(MainF.WriteToIni('AptekaID',Edit5.Text)) then raise EAbort.Create(SVE+'Ошибка записи поля "Номер аптеки"');
          if Not(MainF.WriteToIni('AptekaName',Edit7.Text)) then raise EAbort.Create(SVE+'Ошибка записи поля "Название аптеки"');
          if Not(MainF.WriteToIni('NChek',Edit6.Text)) then raise EAbort.Create(SVE+'Ошибка записи поля "Номер чека"');
         end;
    end;
    ChList[N].IsChanged:=False;
    if ChList[N].NeedRestart then FNeedRestart:=True;
   end;
   Result:=True;
  except
   on E:Exception do
    begin
     if Ix>=0 then TreeView1.Selected:=TreeView1.Items[Ix];
     if Copy(E.Message,1,Length(SVE))<>SVE then MainF.MessBox('Ошибка сохранения элемента "'+GetTreeCaption(Ix)+'"')
                                           else MainF.MessBox(Copy(E.Message,Length(SVE)+1,Length(E.Message)-Length(SVE)));
     Result:=False;
    end else Result:=False; 
  end;
 end; {SavePanel}

// Сохранение всех внесеных изменений
function TOptF.SaveChanges:Boolean;
var i:Integer;
    ErMess:String;
 begin
  try
   ErMess:='Ошибка сохранения настроек!';
   for i:=0 to ComponentCount-1 do
    if Copy(Components[i].Name,1,Length(PNSECT))=PNSECT then
     if Not(SavePanel(GetNumPanel(Components[i]))) then
      begin
       ErMess:='';
       raise EAbort.Create('');
      end;
   Result:=True;
  except
   if ErMess<>'' then MainF.MessBox(ErMess);
   Result:=False;
  end;
 end; {SaveChanges}

// Кнопка ОК
procedure TOptF.BitBtn1Click(Sender: TObject);
 begin
  if SaveChanges then
   begin
    if NeedRestart then MainF.MessBox('Чтобы изменения вступили в силу, необходимо перезапустить программу!');
    Close;
   end;
 end; {BitBtn1Click}

// Кнопка Применить
procedure TOptF.BitBtn3Click(Sender: TObject);
 begin
  SaveChanges;
 end; {BitBtn3Click}

// Close формы
procedure TOptF.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  try
   SetLength(AGr,0);
   DM.tbGroups.Close;
   DM.qrSKD.Close;
  except
  end;
 end; {FormClose}

// Кнопка "Изменить"
procedure TOptF.BitBtn5Click(Sender: TObject);
 begin
  if Not(DM.qrSKD.IsEmpty) then
   try
    AESkdF:=TAESkdF.Create(Self);
    try
     AESkdF.Flag:=2;
     AESkdF.ShowModal;
    finally
     AESkdF.Free;
    end;
   except
    MainF.MessBox(ER_CR_FORM);
   end;
 end; {BitBtn5Click}

// Кнопка "Добавить"
procedure TOptF.BitBtn4Click(Sender: TObject);
 begin
  try
   AESkdF:=TAESkdF.Create(Self);
   try
    AESkdF.Flag:=1;
    AESkdF.ShowModal;
   finally
    AESkdF.Free;
   end;
  except
   MainF.MessBox(ER_CR_FORM);
  end;
 end; {BitBtn4Click}

// Кнопка "Удалить" 
procedure TOptF.BitBtn6Click(Sender: TObject);
 begin
  if Not(DM.qrSKD.IsEmpty) then
   begin
    if OpenADOSQL(DM.Qr,'select row_id from skdconstr where ID_LIMIT=IsNull('+DM.qrSKD.FieldByName('Type_Limit').AsString+',0)')>0 then
     begin
      MainF.MessBox('На данную позицию есть ограничения!'+#10+'Необходимо удалить сначала их а потом эту позицию!');
      Exit;
     end;
    if MainF.MessBox('Удалить позицию "'+TrimRight(DM.qrSKD.FieldByName('Descr').AsString)+'"',52)=ID_YES then
     try
      DM.Qr.Close;
      DM.Qr.SQL.Text:='delete from SKD where row_id='+DM.qrSKD.FieldByName('ROW_ID').AsString;
      DM.Qr.ExecSQL;
      DM.qrSKD.Close;
      DM.qrSKD.Open;
     except
      MainF.MessBox('Ошибка удаления позиции.');
     end;
   end;
 end; {BitBtn6Click}

end.
