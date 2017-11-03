unit uScreenCanvas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ExtCtrls, Controls;

const
  EDGE = 4;

type
  TScreenCanvas = class
    private
      Panel: TPanel;
    public
      property Container: TPanel read Panel;
      constructor Create(WC: TWinControl; Topbar_Height: Integer);
  end;

implementation

uses
  Graphics;

constructor TScreenCanvas.Create(WC: TWinControl; Topbar_Height: Integer);
begin
  Panel:= TPanel.Create(Nil);
  with Panel do begin
    Parent:= WC;
    // anchoring
    Anchors:= [akTop, akBottom, akLeft, akRight];
    AnchorSide[akTop].Side:= asrTop;
    AnchorSide[akTop].Control:= Parent;
    AnchorSide[akBottom].Side:= asrBottom;
    AnchorSide[akBottom].Control:= Parent;
    AnchorSide[akLeft].Side:= asrLeft;
    AnchorSide[akLeft].Control:= Parent;
    AnchorSide[akRight].Side:= asrRight;
    AnchorSide[akRight].Control:= Parent;
    BorderSpacing.Top:= Topbar_Height;
    BorderSpacing.Bottom:= EDGE;
    BorderSpacing.Left:= EDGE;
    BorderSpacing.Right:= EDGE;
    // aesthetic
    BevelOuter:= bvNone;
    BorderStyle:= bsNone;
    Color:= clRed;
  end;
end;

end.

