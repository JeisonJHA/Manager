unit Manager.Source.Core.HostLayout.Developer;

interface

uses Classes, SysUtils, Manager.Source.Core.Intf.HostLayout,
  Manager.Source.Core.HostLayout, dxRibbon;

type
  TManagerHostLayoutDeveloper = class(TManagerHostLayout)
  public
    procedure InicializarRibbon; override;
  end;

implementation

{ TManagerHostLayoutDeveloper }

procedure TManagerHostLayoutDeveloper.InicializarRibbon;
var
  tab: TdxRibbonTab;
begin
  tab := MainForm.dxRibbon1.Tabs.Add;
  tab.Caption := 'DEVELOPER';
end;

end.
