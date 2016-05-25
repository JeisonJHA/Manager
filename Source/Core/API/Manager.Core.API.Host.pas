unit Manager.Core.API.Host;

interface

uses Classes, SysUtils, dxRibbon, dxRibbonStatusBar, InstantPresentation,
  dxRibbonBackstageView;

type
  IManagerHost = interface
    ['{DFD8F08A-B5DC-4CE0-9E14-7771198B5E6C}']
    procedure CarregarMainMenu(ARibbon: TdxRibbon);
    procedure CarregarWorkspaces(AWorkspaces: TInstantSelector);
    procedure CarregarBarraStatus(AStatusBar: TdxRibbonStatusBar);
    procedure CarregarBackstageView(ABackstageView: TdxRibbonBackstageView);
  end;

implementation

end.
