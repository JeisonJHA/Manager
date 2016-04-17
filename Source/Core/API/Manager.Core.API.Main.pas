unit Manager.Core.API.Main;

interface

uses Manager.Core.API.Workspace, dxRibbon, Vcl.ActnList, InstantPresentation,
  dxBar, dxTabbedMDI, Vcl.ExtCtrls;

type
  IMain = interface
    ['{071EB6F2-329E-4B38-B7A6-8D9DE9750B48}']
    function RibbonTabs: TdxRibbonTabCollection;
    function ActionList: TActionList;
    function Workspaces: TInstantSelector;
    function TabPrincipal: TdxRibbonTab;
    function ToolBarCadastro: TdxBar;
    function MDIManager: TdxTabbedMDIManager;
    function TrayIcon: TTrayIcon;
  end;

implementation

end.
