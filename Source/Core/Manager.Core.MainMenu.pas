unit Manager.Core.MainMenu;

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

uses udtmDatabase, Manager.Core.Forms.Main;

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
  action := TWorkspaceAction.Create(Application.Main.ActionList);
  action.Acao := BuscarAcao(AAcao);
  action.Category := ABarraFerramenta.Descricao;
  action.Caption := AAcao.Descricao;
  action.ImageIndex := AAcao.Icone;

  Result := AToolBar.ItemLinks.Add;
  Result.Item := TdxBarLargeButton.Create(AToolBar.BarManager);
  Result.Item.Action := action;
  Result.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');
end;

procedure TManagerMainMenu.InternalCarregar(ASelector: TInstantSelector;
  ABarSubItem: TdxBarSubItem);
var
  I: integer;
  acao: TAcao;
  action: TWorkspaceAction;
  link: TdxBarItemLink;
begin
  for I := 0 to Pred(ASelector.ObjectCount) do
  begin
    acao := BuscarAcao(ASelector.Objects[I] as TAcao);

    action := TWorkspaceAction.Create(Application.Main.ActionList);
    action.Acao := acao;
    action.Caption := acao.Descricao;
    action.ImageIndex := acao.Icone;

    link := ABarSubItem.ItemLinks.Add;
    link.Item := TdxBarLargeButton.Create(ABarSubItem.BarManager);
    link.Item.Action := action;
    link.Item.Category := ABarSubItem.BarManager.Categories.IndexOf('Default');
  end;
end;

procedure UpdateBarItem(AAction: TWorkspaceAction; ABarraFerramenta: TBarraFerramenta; AAcao: TAcao);
begin
  AAction.Category := ABarraFerramenta.Descricao;
  AAction.Caption := AAcao.Descricao;
  AAction.ImageIndex := AAcao.Icone;
  AAction.Acao.Refresh;
end;

procedure TManagerMainMenu.Action(AGroup: TdxRibbonTabGroup; ABarraFerramenta: TBarraFerramenta; AAcao: TAcao);

  function FindById(const AId: string; var AAction: TWorkspaceAction): boolean;
  var
    I: Integer;
  begin
    for I := 0 to AGroup.ToolBar.ItemLinks.Count -1 do
    begin
      AAction := TWorkspaceAction(AGroup.ToolBar.ItemLinks[I].Item.Action);
      if AAction.Acao.Id = AId then
        Exit(True);
    end;
    Exit(False);
  end;

var
  action: TWorkspaceAction;
begin
  if not FindById(AAcao.Id, action) then
  begin
    CreateBarItem(AGroup.ToolBar, ABarraFerramenta, AAcao);
    Exit;
  end;
  UpdateBarItem(action, ABarraFerramenta, AAcao);
end;

end.
