unit DailyOperationSelection;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls,
  StdCtrls, MMSystem, WinSock, DB, ADODB;

type
  TFormDailyOperationSelection = class(TForm)
    Timer1: TTimer;
    pnlBtns: TPanel;
    Panel1: TPanel;
    lblSurname: TLabel;
    lblFirstName: TLabel;
    lblMiddleName: TLabel;
    Timer2: TTimer;
    FQuery: TADOQuery;
    FSProc: TADOStoredProc;
    procedure CreateOperationButtons;
    procedure GetData;
    procedure SelectorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);

  private

    btn: TButton;
    IsCloseAuto1,IsCloseAuto2,FlagClick, Fl, Flag: boolean;
  public
    EmployeeID: int64;
  end;

var
  FormDailyOperationSelection: TFormDailyOperationSelection;

implementation

uses
  DataModuleU, RegPredstU, EnterCash;
//uses Main, EnterCash, WelcomeU;

{$R *.dfm}

procedure TFormDailyOperationSelection.CreateOperationButtons;
var
  I: integer;
  IDFP: int64;
begin
  I         := 0 ;
  Flag      := False ;
  FlagClick := False;
  if IDFP  <> -1 then
  begin
    if FQuery.Active then FQuery.Close;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('select id, operation_name from inform.dbo.daily_operation_avail (' + IntToStr(EmployeeID) + ')');
    FQuery.Open;
    IsCloseAuto1:=FQuery.FieldByName('id').AsInteger=1;
    IsCloseAuto2:=Not IsCloseAuto1;

    while not FQuery.Eof do
    begin
      btn            := TButton.Create(pnlBtns);
      btn.Parent     := pnlBtns;
      btn.Name       := 'daily_operation' + FQuery.FieldByName('id').AsString;
      btn.Tag        := FQuery.FieldByName('id').AsInteger;
      btn.Height     := 90;
      btn.Caption    := FQuery.FieldByName('operation_name').AsString;
      btn.Font.Size  := 20;
      btn.Font.Style := btn.Font.Style+[fsBold];
      btn.Visible    := True;
      btn.Align      := alTop;
      btn.OnClick    := SelectorClick;
      if FQuery.FieldByName('id').AsInteger = 1 then
        Flag := True;
      FQuery.Next;
      inc(I);
    end;
  end
  else
  begin
    Timer1.Enabled     := True;
    pnlBtns.Caption    := 'Сотрудник не опознан';
    pnlBtns.Color      := clRed;
    pnlBtns.Font.Color := clRed;
    pnlBtns.Font.Style := [fsBold];
    pnlBtns.Font.Size  := 25;
    inc(I);
  end;
  pnlBtns.Height:= I * 90 ;
end;

procedure TFormDailyOperationSelection.SelectorClick(Sender: TObject);
var
  Hour, Min, Sec, MSec: Word;
  S:String;
  i:Integer;
  IsKurator:Boolean;
begin
  try
    Timer1.Enabled:=False;
    if (Sender as TButton).Tag=12 then
    begin
//     FormMain.IsNext:=False;
//     FormMain.tmrNext.Enabled:=True;
      Close;
      Exit;
    end;
    if not FlagClick then
    begin
      FlagClick := True;
      if FQuery.Active then FQuery.Close;
      FQuery.SQL.Clear;
      FQuery.SQL.Add('select id, operation_name from inform.dbo.daily_operation_avail (' + IntToStr(EmployeeID) + ')');
      FQuery.Open;
      fl := false;
      while not FQuery.Eof do
      begin
        if (Sender as TButton).Tag = FQuery.FieldByName('id').AsInteger then
        begin
          fl:=true;
          break;
        end;
      FQuery.Next;
    end;
    if not Fl then
    begin
      ShowMessage('Ошибка последовательности входа/выхода');
      Close;
    end;
    DecodeTime(Time, Hour, Min, Sec, MSec);

    FQuery.SQL.Clear;
    FQuery.SQL.Text:='exec spY_CheckKurator '+IntToStr(EmployeeID);
    FQuery.Open;
    IsKurator:=FQuery.FieldByName('Res').AsInteger=1;

    if ((Sender as TButton).Tag=2) and (IsKurator=False) then
    begin
      FQuery.SQL.Clear;
      FQuery.SQL.Add('select top 1 id_gamma from EmployyersCanReedMess where id_gamma='+IntToStr(EmployeeID));
      FQuery.Open;
      if FQuery.IsEmpty=False then
      begin
        FQuery.SQL.Clear;
        FQuery.SQL.Add(' select top 1 * from Inform..JMess where IsQueue=1 and (IsNull(id_dest,-1)=-1 or id_dest='+IntToStr(EmployeeID)+') and ');
        FQuery.SQL.Add(' id not in (select id_mess from Inform..JReadMess (nolock) where id_user=(select top 1 id from SprUser where id_gamma='+IntToStr(EmployeeID)+') and done=1)  ');
        FQuery.SQL.Add(' and datem>IsNull((select Min(a.date_chek) from ArhCheks a (nolock) ),getdate()+1000) ');
        FQuery.Open;
        if FQuery.IsEmpty=False then
        begin
          ShowMessage('Вы не можете отсканировать палец для ухода с работы, так как есть непрочитанные сообщения! Необходимо зайти в историю сообщений и прочитать все сообщения!'#10#10);
          Exit;
        end;
      end;

      FQuery.Close;
      FQuery.SQL.Clear;
      FQuery.SQL.Add('select count(*) cnt from apteka_net..SprUser (nolock) where reserve = 0 and id_role <> 0 and id_type in (0,2,7,11) and id_gamma = ' + IntToStr(EmployeeID));
      FQuery.Open;

      if FQuery.FieldByName('cnt').AsInteger>0 then
      begin
        // Проверяем все ли возвраты помечены как отсканированные
        if FQuery.Active then FQuery.Close;
        FQuery.SQL.Clear;
        FQuery.SQL.Add('select nn_nakl,date_nakl from Apteka_net..Jmoves where priznak in (select id from SprPrVozr where NeedMarked=1) and IsNull(Marked,0)=0 and date_nakl>=''2015-05-14'' order by 2 ');
        FQuery.Open;
        if FQuery.IsEmpty=False then
        begin
          S:='';
          for i:=1 to FQuery.RecordCount do
          begin
            if i=1 then FQuery.First else FQuery.Next;
            S:=S+FQuery.FieldByName('date_nakl').AsString+' '+FQuery.FieldByName('nn_nakl').AsString+#10;
          end;
          ShowMessage('Вы не можете отсканировать палец для ухода с работы, так как есть возвраты не помеченные как отсканированные!'#10#10+S);
          Close;
          Exit;
        end;

        // Проверяем все ли переоценки загружены
        if FQuery.Active then FQuery.Close;
        FQuery.SQL.Clear;
        FQuery.SQL.Add('exec spY_NotLoadReocList');
        FQuery.Open;
        if FQuery.IsEmpty=False then
        begin
          S:='';
          for i:=1 to FQuery.RecordCount do
          begin
            if i=1 then FQuery.First else FQuery.Next;
            S:=S+FQuery.FieldByName('date_nakl').AsString+' '+FQuery.FieldByName('nn_nakl').AsString+#10;
          end;
          ShowMessage('Вы не можете отсканировать палец для ухода с работы, так как есть незагруженные переоценки!'#10#10+S);
          Close;
          Exit;
        end;
       end;
     end;

    if FQuery.Active then FQuery.Close;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('select count(*) cnt from apteka_net..SprUser (nolock) where reserve = 0 and id_role <> 0 and id_type in (0, 1) and id_gamma = ' + IntToStr(EmployeeID));
    FQuery.Open;

    if ((Hour >= 18) and (Hour <= 22)) and ((Sender as TButton).Tag=2) and (FQuery.FieldByName('cnt').AsInteger <> 0) and (IsKurator=False) then
    begin
      try
        FormEnterCash := TFormEnterCash.Create(Self);
        try
          if FormEnterCash.ShowModal = mrOk then
          begin
            if FSProc.Active then FSProc.Close;

            FSProc.Parameters.Clear;
            FSProc.ProcedureName:= 'inform.dbo.daily_journal_append';
            FSProc.Parameters.CreateParameter('@p_id', ftInteger, pdInputOutput, 32, 0);
            FSProc.Parameters.CreateParameter('@p_id_employee', ftInteger, pdInput, 32, 0);
            FSProc.Parameters.CreateParameter('@p_id_daily_operation', ftInteger, pdInput, 32, 0);
            FSProc.Parameters.CreateParameter('@p_state', ftInteger, pdInput, 32, 1);
            FSProc.Parameters.CreateParameter('@p_ip', ftString, pdInput, 15, '');
            FSProc.Parameters.CreateParameter('@p_scan_type', ftSmallint, pdInput, 5, 1);
            FSProc.Parameters.ParamByName('@p_id').Value                 := 0;
            FSProc.Parameters.ParamByName('@p_id_employee').Value        := EmployeeID;
            FSProc.Parameters.ParamByName('@p_id_daily_operation').Value := (Sender as TButton).Tag;
            FSProc.ExecProc;
          end
          else
          begin
            ShowMessage('Невозможно отсканироваться. Введите сумму денег!');
            Exit;
          end;
        finally
          FormEnterCash.Free;
        end;
      except
        on E: Exception do
          ShowMessage('Ошибка создания окна "Ввод суммы"' + E.Message);
      end;
    end
    else
    begin
      if FSProc.Active then FSProc.Close;
      FSProc.Parameters.Clear;
      FSProc.ProcedureName:= 'inform.dbo.daily_journal_append';
      FSProc.Parameters.CreateParameter('@p_id', ftInteger, pdInputOutput, 64, 0);
      FSProc.Parameters.CreateParameter('@p_id_employee', ftInteger, pdInput, 64, 0);
      FSProc.Parameters.CreateParameter('@p_id_daily_operation', ftInteger, pdInput, 32, 0);
      FSProc.Parameters.CreateParameter('@p_state', ftInteger, pdInput, 32, 1);
      FSProc.Parameters.CreateParameter('@p_ip', ftString, pdInput, 15, '');
      FSProc.Parameters.CreateParameter('@p_scan_type', ftSmallint, pdInput, 5, 1);
      FSProc.Parameters.ParamByName('@p_id').Value                 := 0;
      FSProc.Parameters.ParamByName('@p_id_employee').Value        := EmployeeID;
      FSProc.Parameters.ParamByName('@p_id_daily_operation').Value := (Sender as TButton).Tag;
      FSProc.ExecProc;

//      FormMain.IsNext:=False;
//      FormMain.tmrNext.Enabled:=True;
//
//      if (Sender as TButton).Tag = 2 then
//       begin
//        WelComeF:=TWelComeF.Create(Self);
//        try
//         WelComeF.ShowModal;
//        finally
//         WelComeF.Free;
//        end;
//       end;
    end;
  end;
  finally
//  FormMain.ListRequery;
    Close;
    RegPredstF.Close;
  end;
end;

procedure TFormDailyOperationSelection.Timer1Timer(Sender: TObject);
begin
  if IsCloseAuto1 then
   begin
    SelectorClick(TButton(pnlBtns.FindComponent('daily_operation1')));
   end;
end;

procedure TFormDailyOperationSelection.Timer2Timer(Sender: TObject);
begin
  if IsCloseAuto2 then
   begin
    SelectorClick(TButton(pnlBtns.FindComponent('daily_operation2')));
   end;
end;

procedure TFormDailyOperationSelection.GetData;
begin
//  if FindComponent('RegPredstF')<>nil then
  begin
    if FQuery.Active then FQuery.Close;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('select');
    FQuery.SQL.Add('  id, surname_ru, firstname_ru, middlename_ru');
    FQuery.SQL.Add('from');
    FQuery.SQL.Add('  inform..d_employee d');
    FQuery.SQL.Add('  left join sprEmplo s on s.id_d = d.id');
    FQuery.SQL.Add('where d.barcode=' + RegPredstF.sSr);
//    FQuery.SQL.Add('select id, surname_ru, firstname_ru, middlename_ru from inform..d_employee (nolock) where barcode = ' + RegPredstF.sSr);
//    FQuery.SQL.Add('select id, surname_ru, firstname_ru, middlename_ru from inform..d_employee (nolock) where id = ' + RegPredstF.sSr);
//    showmessage(FQuery.SQL.Text);
    FQuery.Open;
    EmployeeID:=FQuery.FieldByName('ID').Value;

    if not FQuery.Eof then
    begin
      lblSurname.Caption    := FQuery.FieldByName('surname_ru').AsString;
      lblFirstName.Caption  := FQuery.FieldByName('firstname_ru').AsString;
      lblMiddleName.Caption := FQuery.FieldByName('middlename_ru').AsString;
    end;
  end;
end;

procedure TFormDailyOperationSelection.FormCreate(Sender: TObject);
begin
  GetData;
  CreateOperationButtons;
end;

procedure ghhhhhh;
var
  i:Integer;
begin
  i:=2;
  ShowMessage(IntToStr(i));
  i:=21;
  i:=232;
  i:=2;

  Repeat

  Until False;
end;

procedure TFormDailyOperationSelection.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ghhhhhh;

  if Key = 27 then Close;
end;

end.
