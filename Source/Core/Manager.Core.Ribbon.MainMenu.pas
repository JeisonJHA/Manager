unit Manager.Core.Ribbon.MainMenu;

interface

uses Classes, SysUtils, Forms, InstantPresentation, InstantPersistence,
  Manager.Core.IDE, BarraFerramenta, Acao, dxRibbon, dxBar, Manager.Core.Workspace.Action,
  Manager.Core.IDE.Menu;

type
  TManagerMainMenu = class(TIDEMenu)
  private
    function PrepareGroup(ABarraFerramenta: TBarraFerramenta): TdxRibbonTabGroup;
    procedure Action(AGroup: TdxRibbonTabGroup; ABarraFerramenta: TBarraFerramenta; AAcao: TAcao);
    function CreateBarItem(AToolBar: TdxBar; ABarraFerramenta: TBarraFerramenta;
      AAcao: TAcao): TdxBarItemLink;
    procedure InternalCarregar(ASelector: TInstantSelector; ABarSubItem: TdxBarSubItem);
    procedure PrepararConjuntoDeBases(const ACaption: string; const AImageIndex: integer); override;
    procedure PrepararCatalogoDeBases(const ACaption: string; const AImageIndex: integer); override;
    procedure PrepararBarraFerramenta; override;
  end;

implementation

{ TManagerMainMenu }

uses udtmDatabase, Manager.Core.Forms.Main, Manager.Core.IDE.ActionList;

function CreateRibbonBar(ARibbonTab: TdxRibbonTab; ABarraFerramenta: TBarraFerramenta): TdxBar;
begin
  { Cria a barra de ferramentas }
  Result := ARibbonTab.Ribbon.BarManager.Bars.Add;
  Result.Caption := ABarraFerramenta.Descricao;
  Result.IsMainMenu := True;
  Result.Visible := True;
  Result.DockingStyle := dsTop;
end;

procedure UpdateRibbonBar(ARibbonBar: TdxBar; ABarraFerramenta: TBarraFerramenta);
begin
  ARibbonBar.Caption := ABarraFerramenta.Descricao;
end;

function CreateGroup(ARibbonTab: TdxRibbonTab; ABarraFerramenta: TBarraFerramenta): TdxRibbonTabGroup;
begin
  { Cria o grupo para a barra de ferramenta }
  Result := ARibbonTab.Groups.Add;
  Result.Caption := ABarraFerramenta.Descricao;
  Result.ToolBar := CreateRibbonBar(ARibbonTab, ABarraFerramenta);
end;

procedure UpdateGroup(ARibbonTabGroup: TdxRibbonTabGroup; ABarraFerramenta: TBarraFerramenta);
begin
  ARibbonTabGroup.Caption := ABarraFerramenta.Descricao;
  UpdateRibbonBar(ARibbonTabGroup.ToolBar, ABarraFerramenta);
end;

procedure TManagerMainMenu.PrepararBarraFerramenta;
var
  I: integer;
  II: Integer;
  group: TdxRibbonTabGroup;
begin
  FBarraFerramenta.Open;
  for I := 0 to Pred(FBarraFerramenta.ObjectCount) do
  begin
    group := PrepareGroup(TBarraFerramenta(FBarraFerramenta.Objects[I]));
    for II := 0 to Pred(TBarraFerramenta(FBarraFerramenta.Objects[I]).AcaoCount) do
      Action(group, TBarraFerramenta(FBarraFerramenta.Objects[I]), TAcao(TBarraFerramenta(TBarraFerramenta(FBarraFerramenta.Objects[I])).Acoes[II]));
  end;
end;

procedure TManagerMainMenu.PrepararCatalogoDeBases(const ACaption: string;
  const AImageIndex: integer);
begin
  InternalCarregar(FCatalogoDeBases, TfrmMain(Application.MainForm).btnCatalagoBases);
end;

procedure TManagerMainMenu.PrepararConjuntoDeBases(const ACaption: string;
  const AImageIndex: integer);
begin
  InternalCarregar(FConjuntoDeBases, TfrmMain(Application.MainForm).btnConjuntoDeBases);
end;

function TManagerMainMenu.PrepareGroup(ABarraFerramenta: TBarraFerramenta): TdxRibbonTabGroup;
begin
  if not Application.Main.RibbonTabs[0].Groups.Find(ABarraFerramenta.Descricao, Result) then
  begin
    Result := CreateGroup(Application.Main.RibbonTabs[0], ABarraFerramenta);
    Exit;
  end;
  UpdateGroup(Result, ABarraFerramenta);
end;

function TManagerMainMenu.CreateBarItem(AToolBar: TdxBar; ABarraFerramenta: TBarraFerramenta; AAcao: TAcao): TdxBarItemLink;
var
  action: TWorkspaceAction;
begin
  action := Application.Main.ActionList.Add;
  action.Acao := BuscarAcao(AAcao);
  action.BarraFerramenta := ABarraFerramenta;

  action.Link := AToolBar.ItemLinks.Add;
  action.Link.Item := TdxBarLargeButton.Create(AToolBar.BarManager);
  action.Link.Item.Action := action;
  action.Link.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');

  Exit(action.Link);
end;

procedure TManagerMainMenu.InternalCarregar(ASelector: TInstantSelector;
  ABarSubItem: TdxBarSubItem);
var
  I: integer;
  acao: TAcao;
  action: TWorkspaceAction;
begin
  for I := 0 to Pred(ASelector.ObjectCount) do
  begin
    action := Application.Main.ActionList.GetInternalAction(TAcao(ASelector.Objects[I]).Id);
    if not Assigned(action) then
    begin
      acao := BuscarAcao(ASelector.Objects[I] as TAcao);

      action := Application.Main.ActionList.Add;
      action.Acao := acao;
      action.Link := ABarSubItem.ItemLinks.Add;
      action.link.Item := TdxBarLargeButton.Create(ABarSubItem.BarManager);
      action.link.Item.Action := action;
      action.link.Item.Category := ABarSubItem.BarManager.Categories.IndexOf('Default');
      Continue;
    end;

    action.Refresh;
  end;
end;

procedure TManagerMainMenu.Action(AGroup: TdxRibbonTabGroup; ABarraFerramenta: TBarraFerramenta; AAcao: TAcao);
var
  action: TWorkspaceAction;
begin
  action := Application.Main.ActionList.GetInternalAction(AAcao.Id);
  if not Assigned(action) then
  begin
    CreateBarItem(AGroup.ToolBar, ABarraFerramenta, AAcao);
    Exit;
  end;

  action.Refresh;
end;

end.
