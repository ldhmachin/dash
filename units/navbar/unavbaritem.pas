unit uNavbarItem;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ExtCtrls, StdCtrls, Controls;

type
  TNavbarItem = class
    private
      Panel: TPanel;
      Lbl: TLabel;
    public
      constructor Create(WC: TWinControl);
  end;

implementation

constructor TNavbarItem.Create(WC: TWinControl);
begin

end;

end.

