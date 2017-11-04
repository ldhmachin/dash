unit uMainForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, windows,
  LCLType, ExtCtrls, uSplashscreen, uScreenCanvas, uNavbar;

type
  TWindowStyle = (wsFlat, wsBorder);

const
  WINDOWSTYLE = wsBorder;

type

  { TMainForm }

  TMainForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { private declarations }
  protected
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
  public
    { public declarations }
  end;

var
  MainForm: TMainForm;
  ScreenCanvas: TScreenCanvas;
  Navbar: TNavbar;
//Splash: TSplashscreen;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  with MainForm do begin
    case WINDOWSTYLE of
      wsFlat: BorderStyle:= bsNone;
      wsBorder: BorderStyle:= bsSizeable;
    end;
    Color:= clWhite;
  end;
  Navbar:= TNavbar.Create(MainForm);
  ScreenCanvas:= TScreenCanvas.Create(MainForm, Navbar.Container.Height);
//Splash:= TSplashscreen.Create(MainForm);
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
//Splash.Resize;
end;

procedure TMainForm.WMNCHitTest(var Message: TWMNCHitTest);
const
  EDGEDETECT = 4; // adjust
var
  deltaRect: TRect;
begin
  inherited;
  if BorderStyle = bsNone then
    with Message, deltaRect do
    begin
      Left := XPos - BoundsRect.Left;
      Right := BoundsRect.Right - XPos;
      Top := YPos - BoundsRect.Top;
      Bottom := BoundsRect.Bottom - YPos;
      if (Top < EDGE) and (Left < EDGE) then
        Result := HTTOPLEFT
      else if (Top < EDGE) and (Right < EDGE) then
        Result := HTTOPRIGHT
      else if (Bottom < EDGE) and (Left < EDGE) then
        Result := HTBOTTOMLEFT
      else if (Bottom < EDGE) and (Right < EDGE) then
        Result := HTBOTTOMRIGHT
      else if (Top < EDGE) then
        Result := HTTOP
      else if (Left < EDGE) then
        Result := HTLEFT
      else if (Bottom < EDGE) then
        Result := HTBOTTOM
      else if (Right < EDGE) then
        Result := HTRIGHT
    end;
end;

end.

