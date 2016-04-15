unit Manager.Core.MainMenu;

interface

uses Classes, SysUtils, Forms, InstantPresentation, InstantPersistence,
  Manager.Core.IDE, BarraFerramenta, Acao, dxRibbon, dxBar, Manager.Core.Workspace.Action;

type
  TManagerMainMenu = class
  private
    FGroups: TInstantSelector;
    function PrepareGroup(ABarraFerramenta: TBarraFerramenta): TdxRibbonTabGroup;
    procedure Action(AGroup: TdxRibbonTabGroup; ABarraFerramenta: TBarraFerramenta; AAcao: TAcao);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Load;
  end;

implementation

uses AcaoCatalogoDeBases, AcaoConjuntoDeBases;

{ TManagerMainMenu }

function BuscarAcao(AAcao: TAcao): TAcao;
begin
  if AAcao.InheritsFrom(TAcaoConfigurarBaseDeDadosDB2) then
    Exit(TAcaoConfigurarBaseDeDadosDB2.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoConfigurarBaseDeDadosOracle) then
    Exit(TAcaoConfigurarBaseDeDadosOracle.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoConfigurarBaseDeDadosMSSQL) then
    Exit(TAcaoConfigurarBaseDeDadosMSSQL.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoConfigurarBaseDeDados) then
    Exit(TAcaoConfigurarBaseDeDados.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoMontarAmbiente) then
    Exit(TAcaoMontarAmbiente.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoConjuntoDeBases) then
    Exit(TAcaoConjuntoDeBases.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoCatalogoDeBases) then
    Exit(TAcaoCatalogoDeBases.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoCopiar) then
    Exit(TAcaoCopiar.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoExecutar) then
    Exit(TAcaoExecutar.Retrieve(AAcao.Id));

  Exit(TAcao.Retrieve(AAcao.Id));
end;

constructor TManagerMainMenu.Create;
begin
  FGroups := TInstantSelector.Create(nil);
  FGroups.Command.Text := 'SELECT * FROM TBarraFerramenta';
end;

destructor TManagerMainMenu.Destroy;
begin
  if FGroups.Active then
    FGroups.Close;
  FreeAndNil(FGroups);
  inherited;
end;

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

function TManagerMainMenu.PrepareGroup(ABarraFerramenta: TBarraFerramenta): TdxRibbonTabGroup;
begin
  if not Application.Main.RibbonTabs[0].Groups.Find(ABarraFerramenta.Descricao, Result) then
  begin
    Result := CreateGroup(Application.Main.RibbonTabs[0], ABarraFerramenta);
    Exit;
  end;
  UpdateGroup(Result, ABarraFerramenta);
end;

function CreateBarItem(AToolBar: TdxBar; ABarraFerramenta: TBarraFerramenta; AAcao: TAcao): TdxBarItemLink;
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

procedure TManagerMainMenu.Load;
var
  I: integer;
  II: Integer;
  group: TdxRibbonTabGroup;
begin
  FGroups.Open;
  for I := 0 to Pred(FGroups.ObjectCount) do
  begin
    group := PrepareGroup(TBarraFerramenta(FGroups.Objects[I]));
    for II := 0 to Pred(TBarraFerramenta(FGroups.Objects[I]).AcaoCount) do
      Action(group, TBarraFerramenta(FGroups.Objects[I]), TAcao(TBarraFerramenta(TBarraFerramenta(FGroups.Objects[I])).Acoes[II]));
  end;
end;

end.
