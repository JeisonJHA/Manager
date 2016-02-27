unit IDE.Controller.MainMenu;

interface

uses Classes, SysUtils, dxRibbon, dxBar, InstantPresentation, Vcl.ActnList,
  InstantPersistence, Acao, AcaoCatalogoDeBases, BarraFerramenta, Vcl.Menus;

type
  TBarraFerramentaController = class(TPersistent)
  private
    FActionList: TActionList;
    function BuscarAcao(AAcao: TAcao): TAcao;
    procedure AdicionarItem(AToolBar: TdxBar; ABarra: TBarraFerramenta; AAcao: TAcao);
  public
    constructor Create(AActionList: TActionList);
    procedure CarregarMenuPrincipal(ATab: TdxRibbonTab);
    procedure CarregarPopupMenuTrayIcon(APopupMenu: TPopupMenu);
    procedure CarregarCatalogo(ABarSubItem: TdxBarSubItem);
  end;

implementation

uses udtmDatabase, Workspace.Action;

{ TIDEControllerMainMenu }

function TBarraFerramentaController.BuscarAcao(AAcao: TAcao): TAcao;
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

  if AAcao.InheritsFrom(TAcaoCatalogoDeBases) then
    Exit(TAcaoCatalogoDeBases.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoCopiar) then
    Exit(TAcaoCopiar.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoExecutar) then
    Exit(TAcaoExecutar.Retrieve(AAcao.Id));

  Exit(TAcao.Retrieve(AAcao.Id));
end;

procedure TBarraFerramentaController.CarregarCatalogo(
  ABarSubItem: TdxBarSubItem);
var
  I: integer;
  acao: TAcao;
  action: TWorkspaceAction;
  link: TdxBarItemLink;
begin
  with TInstantSelector.Create(nil) do
  try
    Connector := dtmDatabase.InstantIBXConnector1;
    Command.Text := 'SELECT * FROM TAcaoCatalogoDeBases';
    Open;

    for I := 0 to Pred(ObjectCount) do
    begin
      acao := BuscarAcao(Objects[I] as TAcao);

      action := TWorkspaceAction.Create(FActionList);
      action.Acao := acao;
      action.Caption := acao.Descricao;
      action.ImageIndex := acao.Icone;

      link := ABarSubItem.ItemLinks.Add;
      link.Item := TdxBarLargeButton.Create(ABarSubItem.BarManager);
      link.Item.Action := action;
      link.Item.Category := ABarSubItem.BarManager.Categories.IndexOf('Default');
    end;
  finally
    Free;
  end;
end;

procedure TBarraFerramentaController.CarregarMenuPrincipal(ATab: TdxRibbonTab);
var
  I: Integer;
  II: Integer;
  barra: TBarraFerramenta;
  group: TdxRibbonTabGroup;
  bar: TdxBar;
begin
  with TInstantSelector.Create(nil) do
  try
    Connector := dtmDatabase.InstantIBXConnector1;
    Command.Text := 'SELECT * FROM TBarraFerramenta';
    Open;
    for I := 0 to Pred(ObjectCount) do
    begin
      barra := Objects[I] as TBarraFerramenta;

      if barra.AcaoCount <= 0 then
        Continue;

      { Cria a barra de ferramentas }
      bar := ATab.Ribbon.BarManager.Bars.Add;
      bar.Caption := barra.Descricao;
      bar.IsMainMenu := True;
      bar.Visible := True;
      bar.DockingStyle := dsTop;

      { Cria o grupo para a barra de ferramenta }
      group := ATab.Groups.Add;
      group.Caption := barra.Descricao;
      group.ToolBar := bar;

      for II := 0 to barra.AcaoCount -1 do
      begin
        AdicionarItem(bar, barra, barra.Acoes[II]);
      end;
    end;
    Close;
  finally
    Free;
  end;
end;

procedure TBarraFerramentaController.CarregarPopupMenuTrayIcon(APopupMenu: TPopupMenu);
var
  I: integer;
  item: TMenuItem;
  itemBase: TMenuItem;
  acao: TAcao;
  action: TWorkspaceAction;
begin
  with TInstantSelector.Create(nil) do
  try
    Connector := dtmDatabase.InstantIBXConnector1;
    Command.Text := 'SELECT * FROM TAcaoCatalogoDeBases';
    Open;

    itemBase := TMenuItem.Create(APopupMenu);
    itemBase.Caption := 'Catálogo de Bases';
    APopupMenu.Items.Insert(0, itemBase);

    item := TMenuItem.Create(APopupMenu);
    item.Caption := '-';
    APopupMenu.Items.Insert(0, item);

    for I := 0 to Pred(ObjectCount) do
    begin
      acao := BuscarAcao(Objects[I] as TAcao);

      action := TWorkspaceAction.Create(FActionList);
      action.Acao := acao;
      action.Caption := acao.Descricao;
      action.ImageIndex := acao.Icone;

      item := TMenuItem.Create(itemBase);
      item.Action := action;
      item.Caption := acao.Descricao;
      itemBase.Insert(0, item);
    end;
  finally
    Free;
  end;

  with TInstantSelector.Create(nil) do
  try
    Connector := dtmDatabase.InstantIBXConnector1;
    Command.Text := 'SELECT * FROM ANY TAcaoExecutar';
    Open;

    for I := 0 to Pred(ObjectCount) do
    begin
      acao := BuscarAcao(Objects[I] as TAcao);

      action := TWorkspaceAction.Create(FActionList);
      action.Acao := acao;
      action.Caption := acao.Descricao;
      action.ImageIndex := acao.Icone;

      item := TMenuItem.Create(APopupMenu);
      item.Action := action;
      item.Caption := acao.Descricao;
      APopupMenu.Items.Insert(0, item);
    end;
  finally
    Free;
  end;
end;

procedure TBarraFerramentaController.AdicionarItem(AToolBar: TdxBar; ABarra: TBarraFerramenta; AAcao: TAcao);
var
  link: TdxBarItemLink;
  action: TWorkspaceAction;
  acao: TAcao;
begin
  acao := BuscarAcao(AAcao);

  if not Assigned(acao) then
    Exit;

  action := TWorkspaceAction.Create(FActionList);
  action.Acao := AAcao;
  action.Category := ABarra.Descricao;
  action.Caption := AAcao.Descricao;
  action.ImageIndex := AAcao.Icone;

  link := AToolBar.ItemLinks.Add;
  link.Item := TdxBarLargeButton.Create(AToolBar.BarManager);
  link.Item.Action := action;
  link.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');
end;

constructor TBarraFerramentaController.Create(AActionList: TActionList);
begin
  FActionList := AActionList;
end;

end.
