unit Manager.Source.Core.HostLayout.Tester;

interface

uses Classes, SysUtils, Manager.Source.Core.Intf.HostLayout,
  Manager.Source.Core.HostLayout, dxRibbon;

type
  TManagerHostLayoutTester = class(TManagerHostLayout)
  public
    procedure InicializarRibbon; override;
  end;

implementation

procedure TManagerHostLayoutTester.InicializarRibbon;
var
  tab: TdxRibbonTab;
begin
  tab := MainForm.dxRibbon1.Tabs.Add;
  tab.Caption := 'TESTER';
end;

end.
