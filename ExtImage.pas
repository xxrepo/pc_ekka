unit ExtImage;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ExtCtrls;

type

  TExtImage=class(TImage)
  private

    FOnMouseLeave: TNotifyEvent;
    FOnMouseEnter: TNotifyEvent;

    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;

  protected

  public

    property OnMouseLeave:TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnMouseEnter:TNotifyEvent read FOnMouseEnter write FOnMouseEnter;

  end;

  TExtPanel=class(TPanel)
  private

    FOnMouseLeave: TNotifyEvent;
    FOnMouseEnter: TNotifyEvent;

    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;

  protected

  public

    property OnMouseLeave:TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnMouseEnter:TNotifyEvent read FOnMouseEnter write FOnMouseEnter;

  end;

implementation

{ TExtImage }

procedure TExtImage.CMMouseEnter(var Message: TMessage);
 begin
  if Assigned(FOnMouseEnter) then FOnMouseEnter(Self);
 end;

procedure TExtImage.CMMouseLeave(var Message: TMessage);
 begin
  if Assigned(FOnMouseLeave) then FOnMouseLeave(Self);
 end;

{ TExtPanle }

procedure TExtPanel.CMMouseEnter(var Message: TMessage);
 begin
  if Assigned(FOnMouseEnter) then FOnMouseEnter(Self);
 end;

procedure TExtPanel.CMMouseLeave(var Message: TMessage);
 begin
  if Assigned(FOnMouseLeave) then FOnMouseLeave(Self);
 end;

end.
