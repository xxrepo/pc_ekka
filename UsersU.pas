unit UsersU;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DB,
     Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, DBCtrls, Util, Mask, ADODB;

type
  TUsersF = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    Bevel2: TBevel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Image1: TImage;
    DBEdit2: TDBComboBox;
    Label6: TLabel;
    ComboBox1: TComboBox;
    cbZav: TCheckBox;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBGrid2: TDBGrid;
    Label8: TLabel;
    lbSr: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift:TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);

  private

    FStr:String;

    procedure SetVis(V:Boolean);
    procedure ShowUsers(Param: Byte);
    procedure UsersDataChange(Sender: TObject; Field: TField);

  public

  end;

var UsersF:TUsersF;

implementation

uses MainU, DataModuleU;

{$R *.dfm}

procedure TUsersF.FormCreate(Sender: TObject);
var i:Integer;
 begin
  try
   lbSr.Caption:='';
   Caption:=MFC;
   Label7.Caption:='Список пользователей не зарегистрированных по торговой точке '+Prm.AptekaNameRU;
   Label8.Caption:='Список пользователей зарегистрированных по торговой точке '+Prm.AptekaNameRU;
   SetVis(True);
   DM.Qr.Close;
   DM.Qr.SQL.Text:='select * from SprTypeUser where id_type<>7 and id_type<=100 order by id_type';
   DM.Qr.Open;
   ComboBox1.Clear;
   for i:=1 to DM.Qr.RecordCount do
    begin
     if i=1 then DM.Qr.First else DM.Qr.Next;
     ComboBox1.Items.Add(DM.Qr.FieldByName('Descr').AsString);
    end;
   DBGrid2.DataSource.OnDataChange:=UsersDataChange;
   ShowUsers(USERS_ALL);
   ShowUsers(USERS_APT);
  except
   MainF.MessBox('Ошибка открытия таблицы пользователей!');
  end;
 end;

procedure TUsersF.ShowUsers(Param:Byte);
var Qr:TADOQuery;
    ID:Integer;
 begin
  try
   Case Param of
    0:Qr:=DM.qrUsersAll;
    1:Qr:=DM.qrUsersApt else Exit;
   end;
   ID:=-1;
   if Qr.Active then ID:=Qr.FieldByName('ID').AsInteger;
   Qr.Close;
   Qr.Open;
   Qr.Locate('ID',ID,[]);
  except
   MainF.MessBox('Ошибка формирования списка пользователей!');
  end;
 end;

procedure TUsersF.BitBtn1Click(Sender:TObject);
 begin
  Close;
 end;

procedure TUsersF.SetVis(V:Boolean);
 begin
  DBGrid2.Enabled:=V;
  DBGrid1.Enabled:=V;
  DBGrid1.Repaint;
  DBGrid1.Refresh;
  ComboBox1.Enabled:=Not V;
  Label3.Enabled:=Not V;
  Label4.Enabled:=Not V;
  Label5.Enabled:=Not V;
  Label6.Enabled:=Not V;
  DBEdit2.Enabled:=Not V;
  if Not MainF.IsPermit([],P_SILENT) then
   begin
    DBEdit2.Clear;
    DBEdit2.Items.Add('1');
    DBEdit2.Items.Add('3');
    DBEdit2.Items.Add('4');
   end;
  DBEdit3.Enabled:=Not V;
  DBEdit1.Enabled:=Not V;

  BitBtn3.Visible:=V;
  BitBtn5.Visible:=Not V;
  BitBtn6.Visible:=Not V;
  if V=True then cbZav.Enabled:=False else DBEdit2Change(nil);
 end;

procedure TUsersF.BitBtn6Click(Sender:TObject);
 begin
  SetVis(True);
  DM.qrUsersApt.Cancel;
 end;

procedure TUsersF.BitBtn3Click(Sender: TObject);
 begin
  if DM.qrUsersApt.IsEmpty then Exit;
  if (Prm.UserRole<>R_ADMIN) and (DM.qrUsersApt.FieldByName('id_role').AsInteger=R_ADMIN) then Exit;
  try
   SetVis(False);
   DM.qrUsersApt.Edit;
  except
   MainF.MessBox('Ошибка добавления записи!');
  end;
 end;

procedure TUsersF.BitBtn5Click(Sender:TObject);
var ID:Integer;
 begin
  if IsEmpty(DBEdit1,'Введите значение в поле "'+Label3.Caption+'"',MFC)=False then
   begin
    DBEdit1.SetFocus;
    Exit;
   end else
  if IsEmpty(DBEdit3,'Введите значение в поле "'+Label5.Caption+'"',MFC) then
   if DBEdit2.ItemIndex<0 then
    begin
     MainF.MessBox('Введите значение в поле "'+Label4.Caption+'"');
     DBEdit2.SetFocus;
    end else
   if ComboBox1.ItemIndex<0 then
    begin
     MainF.MessBox('Введите значение в поле "'+Label6.Caption+'"');
     ComboBox1.SetFocus;
    end else try
              if cbZav.Enabled then
               begin
                DM.Qr.Close;
                DM.Qr.SQL.Clear;
                DM.Qr.SQL.Add('update SprUser set IsZam=0 where id_role<>4');
                DM.Qr.SQL.Add('update SprUser set IsZam='+IntToStr(BoolToInt(cbZav.Checked))+' where id='+DM.qrUsersApt.FieldByName('ID').AsString);
                DM.Qr.ExecSQl;
               end;

              if (DM.qrUsersApt.FieldByName('id_role').AsInteger<>R_ADMIN) and (DM.qrUsersApt.FieldByName('id_type').AsInteger<100) then
               begin
                if ComboBox1.ItemIndex<7 then DM.qrUsersApt.FieldByName('id_type').AsInteger:=ComboBox1.ItemIndex
                                         else DM.qrUsersApt.FieldByName('id_type').AsInteger:=ComboBox1.ItemIndex+1;
               end;                          

              DM.qrUsersApt.FieldByName('Login').AsString:=TranslitStr(DM.qrUsersApt.FieldByName('Users').AsString);
              DM.qrUsersApt.Post;
              ShowUsers(USERS_APT);
              SetVis(True);
             except
              on E:Exception do
               begin
                if Pos('duplicate key',E.Message)<>0 then MainF.MessBox('Пользователь с таким именем уже существует!')
                                                     else MainF.MessBox(E.Message);
              end else BitBtn6Click(nil);
            end;
 end;

procedure TUsersF.FormClose(Sender:TObject; var Action:TCloseAction);
 begin
  BitBtn6Click(Nil);
 end;

procedure TUsersF.DBEdit2Change(Sender:TObject);
 begin
  cbZav.Enabled:=DBEdit2.Text='4';
 end;

procedure TUsersF.SpeedButton1Click(Sender:TObject);
var Tg,ID:Integer;
    Qr:TADOQuery;
 begin
  try
   if Sender=nil then Exit;
   Tg:=TSpeedButton(Sender).Tag;
   Case Tg of
    0:begin
       if (Prm.UserRole<>R_ADMIN) and (DM.qrUsersAll.FieldByName('id_role').AsInteger=R_ADMIN) then Exit;
       if DM.qrUsersAll.IsEmpty then Exit;
       ID:=DM.qrUsersAll.FieldByName('ID').AsInteger;
      end;
    1:begin
       if (Prm.UserRole<>R_ADMIN) and (DM.qrUsersApt.FieldByName('id_role').AsInteger=R_ADMIN) then Exit;
       if DM.qrUsersApt.IsEmpty then Exit;
       ID:=DM.qrUsersApt.FieldByName('ID').AsInteger;
      end else Exit;
   end;
   DM.QrEx.Close;
   DM.QrEx.SQL.Text:='update SprUser set reserve='+IntToStr(Tg)+' where id='+IntToStr(ID);
   DM.QrEx.ExecSQL;
   ShowUsers(USERS_ALL);
   ShowUsers(USERS_APT);
   Case Tg of
    0:DM.qrUsersApt.Locate('ID',ID,[]);
    1:DM.qrUsersAll.Locate('ID',ID,[]);
   end;
  except
   MainF.MessBox('Ошибка регистрации пользователя!');
  end;
 end;

procedure TUsersF.UsersDataChange(Sender: TObject; Field: TField);
 begin
  if ComboBox1.Enabled=False then
   begin
    if DM.qrUsersApt.FieldByName('id_type').AsInteger<7 then ComboBox1.ItemIndex:=DM.qrUsersApt.FieldByName('id_type').AsInteger
                                                        else ComboBox1.ItemIndex:=DM.qrUsersApt.FieldByName('id_type').AsInteger-1;
   end;
  cbZav.Checked:=DM.qrUsersApt.FieldByName('IsZam').AsInteger=1;
 end;

procedure TUsersF.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 begin
  if Key in K_ARROW_KEYS then lbSr.Caption:='';
 end;

procedure TUsersF.DBGrid1KeyPress(Sender:TObject; var Key:Char);
var S:String;
 begin
  S:=lbSr.Caption+Key;
  if DM.qrUsersAll.Locate('Users',AnsiUpperCase(S),[loCaseInsensitive,loPartialKey]) then
   begin
    lbSr.Caption:=Copy(DM.qrUsersAll.FieldByName('Users').AsString,1,Length(S));
   end;
 end;

end.
