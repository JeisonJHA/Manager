unit IDE.Controller.MainMenu;

interface

uses Classes, SysUtils, dxRibbon, dxBar, InstantPresentation, Vcl.ActnList,
  InstantPersistence, Acao, AcaoConjuntoDeBases, BarraFerramenta, Vcl.Menus, DB;

type
  TBarraFerramentaController = class(TPersistent)
  private
    FActionList: TActionList;
    function BuscarAcao(AAcao: TAcao): TAcao;
    procedure AdicionarItem(AToolBar: TdxBar; ABarra: TBarraFerramenta; AAcao: TAcao);
    procedure InternalCarregar(const AClasse: string; ABarSubItem: TdxBarSubItem);
  protected
    procedure OnCompare(Sender, AObject1, AObject2: TObject;
      var Compare: Integer);
  public
    constructor Create(AActionList: TActionList);
    procedure CarregarMenuPrincipal(ATab: TdxRibbonTab);
    procedure CarregarPopupMenuTrayIcon(APopupMenu: TPopupMenu);
    procedure CarregarConjuntoDeBases(ABarSubItem: TdxBarSubItem);
    procedure CarregarCatalogoDeBases(ABarSubItem: TdxBarSubItem);
  end;

implementation

uses udtmDatabase, Workspace.Action, AcaoCatalogoDeBases;

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

procedure TBarraFerramentaController.CarregarCatalogoDeBases(
  ABarSubItem: TdxBarSubItem);
begin
  InternalCarregar('TAcaoCatalogoDeBases', ABarSubItem);
end;

procedure TBarraFerramentaController.CarregarConjuntoDeBases(
  ABarSubItem: TdxBarSubItem);
begin
  InternalCarregar('TAcaoConjuntoDeBases', ABarSubItem);
end;

procedure TBarraFerramentaController.InternalCarregar(const AClasse: string;
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
    Command.Text := Format('SELECT * FROM %s ORDER BY Descricao', [AClasse]);
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

procedure TBarraFerramentaController.OnCompare(Sender, AObject1,
  AObject2: TObject; var Compare: Integer);
begin
  Compare := AnsiCompareText(TAcao(AObject1).Descricao, TAcao(AObject2).Descricao);
end;

procedure TBarraFerramentaController.CarregarMenuPrincipal(ATab: TdxRibbonTab);
var
  I: Integer;
  II: Integer;
  barra: TBarraFerramenta;
  group: TdxRibbonTabGroup;
  bar: TdxBar;
  qryBarraFerramenta: TInstantSelector;
  dtsBarraFerramenta: TDataSource;
begin
  qryBarraFerramenta := TInstantSelector.Create(nil);
  dtsBarraFerramenta := TDataSource.Create(nil);
  try
    qryBarraFerramenta.Connector := dtmDatabase.InstantIBXConnector1;
    qryBarraFerramenta.Command.Text := 'SELECT * FROM TBarraFerramenta';
    qryBarraFerramenta.Open;

    dtsBarraFerramenta.DataSet := qryBarraFerramenta;

    for I := 0 to Pred(qryBarraFerramenta.ObjectCount) do
    begin
      barra := qryBarraFerramenta.Objects[I] as TBarraFerramenta;

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
    qryBarraFerramenta.Close;
  finally
    FreeAndNil(dtsBarraFerramenta);
    FreeAndNil(qryBarraFerramenta);
  end;
end;

procedure TBarraFerramentaController.CarregarPopupMenuTrayIcon(APopupMenu: TPopupMenu);
var
  I: integer;
  Y: integer;
  item: TMenuItem;
  itemBase: TMenuItem;
  acao: TAcao;
  action: TWorkspaceAction;
begin
  with TInstantSelector.Create(nil) do
  try
    Connector := dtmDatabase.InstantIBXConnector1;
    Command.Text := 'SELECT * FROM TAcaoConjuntoDeBases ORDER BY Descricao DESC';
    Open;

    itemBase := TMenuItem.Create(APopupMenu);
    itemBase.Caption := 'Conjunto de Bases';
    itemBase.ImageIndex := 37;
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
    Command.Text := 'SELECT * FROM TAcaoCatalogoDeBases ORDER BY Descricao DESC';
    Open;

    itemBase := TMenuItem.Create(APopupMenu);
    itemBase.Caption := 'Catálogo de Bases';
    itemBase.ImageIndex := 36;
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
    Command.Text := 'SELECT * FROM TBarraFerramenta ORDER BY Descricao DESC';
    Open;

    for I := 0 to Pred(ObjectCount) do
    begin

      itemBase := TMenuItem.Create(APopupMenu);
      itemBase.Caption := TBarraFerramenta(Objects[I]).Descricao;
      itemBase.ImageIndex := 17;
      APopupMenu.Items.Insert(0, itemBase);

      for Y := 0 to TBarraFerramenta(Objects[I]).AcaoCount -1 do
      begin
        if TBarraFerramenta(Objects[I]).Acoes[Y].InheritsFrom(TAcaoCatalogoDeBases) then
          Continue;

        acao := BuscarAcao(TBarraFerramenta(Objects[I]).Acoes[Y] as TAcao);

        action := TWorkspaceAction.Create(FActionList);
        action.Acao := acao;
        action.Caption := acao.Descricao;
        action.ImageIndex := acao.Icone;

        item := TMenuItem.Create(APopupMenu);
        item.Action := action;
        item.Caption := acao.Descricao;
        itemBase.Insert(0, item);
      end;
    end;
    if APopupMenu.Items.IndexOf(itemBase) > 0 then
    begin
      itemBase := TMenuItem.Create(APopupMenu);
      itemBase.Caption := '-';
      APopupMenu.Items.Insert(0, itemBase);
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
