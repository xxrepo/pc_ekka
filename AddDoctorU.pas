unit AddDoctorU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TAddDoctorF = class(TForm)

    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbDoctor: TComboBox;
    lbNCard: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cbDoctorKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private

   sNum:String;

  public

   Flag:Integer;
   Simple:Boolean;
   aID:Array of Record
                 ID:Integer;
                 Shtr:String;
                end; 

  end;

var AddDoctorF:TAddDoctorF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TAddDoctorF.FormCreate(Sender: TObject);
var i:Integer;
 begin
  Caption:=MFC;
  Flag:=0;
  Simple:=False;
  cbDoctor.Clear;
  SetLength(aID,0);
  DM.QrEx.Close;
  DM.QrEx.SQL.Text:='exec spY_DoctorList ';
  DM.QrEx.Open;

  SetLength(aID,DM.QrEx.RecordCount);
  for i:=1 to DM.QrEx.RecordCount do
   begin
    if i=1 then DM.QrEx.First else DM.QrEx.Next;
    cbDoctor.Items.Add(DM.QrEx.FieldByName('FIO').AsString);
    aID[i-1].ID:=DM.QrEx.FieldByName('ID').AsInteger;
    aID[i-1].Shtr:=DM.QrEx.FieldByName('Shtr').AsString;
   end;
  cbDoctor.ItemIndex:=-1;
 end;

procedure TAddDoctorF.BitBtn2Click(Sender: TObject);
 begin
  Close;
 end;

procedure TAddDoctorF.cbDoctorKeyPress(Sender:TObject; var Key:Char);
var i,q:Integer;

 begin
  if Simple then Exit;
  q:=-1;
  try
   cbDoctor.Enabled:=False;
   if lbNCard.Caption<>'' then
    begin
     MainF.MessBox('Карта уже отсканирована');
     Exit;
    end;

   if Length(sNum)>13 then sNum:='' else
   if Length(sNum)<13 then sNum:=sNum+Key else
    begin
     System.Delete(sNum,2,1);
     if Copy(sNum,1,3)<>'237' then
      begin
       MainF.MessBox('Номер карты неверный. Просканируйте карту еще раз');
       sNum:='';
       cbDoctor.Enabled:=True;
       cbDoctor.SetFocus;
       Exit;
      end;

     for i:=Low(aID) to High(aID) do
      if aID[i].Shtr=sNum then
       begin
        q:=i;
        Break;
       end;
     if q<>-1 then
      begin
       lbNCard.Caption:=sNum;
       cbDoctor.ItemIndex:=q;
       cbDoctor.Enabled:=False;
      end else begin
                cbDoctor.ItemIndex:=-1;
                MainF.MessBox('Доктор с таким штрихкодом не найден! Выберите доктора вручную!');
               end;
    end;
  finally
   if q=-1 then cbDoctor.Enabled:=True;
  end;
 end;

procedure TAddDoctorF.BitBtn1Click(Sender: TObject);
 begin
  if cbDoctor.ItemIndex=-1 then
   begin
    MainF.MessBox('Выберите врача!');
    cbDoctor.SetFocus;
    Exit;
   end else begin
             Flag:=1;
             Close;
            end;
 end;

procedure TAddDoctorF.FormActivate(Sender: TObject);
 begin
  if Simple then
   begin
    Label1.Visible:=False;
    Label2.Visible:=False;
    lbNCard.Visible:=False;
   end; { else begin
             Height:=250;
             Label4.Visible:=True;
            end;}
 end;

end.
