unit Manager.Core.API.Main;

interface

uses Manager.Core.API.Workspace, dxRibbon, Vcl.ActnList, InstantPresentation,
  dxBar;

type
  IMain = interface
    ['{071EB6F2-329E-4B38-B7A6-8D9DE9750B48}']
    function CurrentWorkspace: IWorkspace;
    function RibbonTabs: TdxRibbonTabCollection;
    function ActionList: TActionList;
    function Workspaces: TInstantSelector;
    function TabPrincipal: TdxRibbonTab;
    function ToolBarCadastro: TdxBar;
  end;

implementation

end.
