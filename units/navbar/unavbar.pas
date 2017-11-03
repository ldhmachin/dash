unit uNavbar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ExtCtrls, Controls;

const
  NAVBAR_HEIGHT = 32;

type
  TNavbar = class
    private
      Panel: TPanel;
      isMoving: Boolean;
      XPos, YPos: Integer;
      procedure MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      procedure MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    public
      property Container: TPanel read Panel;
      constructor Create(WC: TWinControl);
  end;

implementation

uses
  Graphics;

constructor TNavbar.Create(WC: TWinControl);
begin
  isMoving:= False;
  Panel:= TPanel.Create(Nil);
  with Panel do begin
    Parent:= WC;
    Height:= NAVBAR_HEIGHT;
    // anchoring
    Anchors:= [akTop, akLeft, akRight];
    AnchorSide[akTop].Side:= asrTop;
    AnchorSide[akTop].Control:= Parent;
    AnchorSide[akLeft].Side:= asrLeft;
    AnchorSide[akLeft].Control:= Parent;
    AnchorSide[akRight].Side:= asrRight;
    AnchorSide[akRight].Control:= Parent;
    // aesthetic
    BevelOuter:= bvNone;
    BorderStyle:= bsNone;
    Color:= clTeal;
    // events
    OnMouseMove:= @MouseMove;
    OnMouseUp:= @MouseUp;
    OnMouseDown:= @MouseDown;
  end;
end;

procedure TNavbar.MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if isMoving then with Panel do begin
    Parent.Left:= Parent.Left + X - XPos;
    Parent.Top := Parent.Top  + Y - YPos;
  end;
end;

procedure TNavbar.MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  isMoving:= False;
end;

procedure TNavbar.MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  XPos:= X;
  YPos:= Y;
  isMoving:= True;
end;

end.

