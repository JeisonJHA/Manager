unit Manager.Core.IDE.Host;

interface

uses Classes, SysUtils, dxRibbon, dxRibbonStatusBar, InstantPresentation,
  dxRibbonBackstageView;

type
  TManagerHost = class(TInterfacedObject)
  public
    procedure CarregarMainMenu(ARibbon: TdxRibbon); virtual; abstract;
    procedure CarregarWorkspaces(AWorkspaces: TInstantSelector); virtual; abstract;
    procedure CarregarBarraStatus(AStatusBar: TdxRibbonStatusBar); virtual; abstract;
    procedure CarregarBackstageView(ABackstageView: TdxRibbonBackstageView); virtual; abstract;
  end;

implementation

end.
