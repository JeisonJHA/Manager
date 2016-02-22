unit IDE.Controller.MainMenu;

interface

uses Classes, SysUtils, dxRibbon, dxBar, InstantPresentation, Vcl.ActnList,
  InstantPersistence;

type
  TIDEControllerMainMenu = class(TPersistent)
  private
    FRibbon: TdxRibbon;
    FBarManager: TdxBarManager;
    FActionList: TActionList;
  public
    constructor Create(ARibbon: TdxRibbon; ABarManager: TdxBarManager; AActionList: TActionList);
    procedure CarregarBarrasFerramentas(ATab: TdxRibbonTab);
  end;

implementation

uses BarraFerramenta, Acao, udtmDatabase, Workspace.Action;

{ TIDEControllerMainMenu }

procedure TIDEControllerMainMenu.CarregarBarrasFerramentas(ATab: TdxRibbonTab);
var
  I: Integer;
  II: Integer;
  barra: TBarraFerramenta;
  acao: TAcao;
  group: TdxRibbonTabGroup;
  bar: TdxBar;
  link: TdxBarItemLink;
  action: TWorkspaceAction;
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
      bar := FBarManager.Bars.Add;
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
        acao := barra.Acoes[II];

        if acao.InheritsFrom(TAcaoConfigurarBaseDeDadosDB2) then
          acao := TAcaoConfigurarBaseDeDadosDB2.Retrieve(acao.Id)
        else
        if acao.InheritsFrom(TAcaoConfigurarBaseDeDadosOracle) then
          acao := TAcaoConfigurarBaseDeDadosOracle.Retrieve(acao.Id)
        else
        if acao.InheritsFrom(TAcaoConfigurarBaseDeDadosMSSQL) then
          acao := TAcaoConfigurarBaseDeDadosMSSQL.Retrieve(acao.Id)
        else
        if acao.InheritsFrom(TAcaoConfigurarBaseDeDados) then
          acao := TAcaoConfigurarBaseDeDados.Retrieve(acao.Id)
        else
        if acao.InheritsFrom(TAcaoMontarAmbiente) then
          acao := TAcaoMontarAmbiente.Retrieve(acao.Id)
        else
        if acao.InheritsFrom(TAcaoCopiar) then
          acao := TAcaoCopiar.Retrieve(acao.Id)
        else
        if acao.InheritsFrom(TAcaoExecutar) then
          acao := TAcaoExecutar.Retrieve(acao.Id)
        else
          acao := TAcao.Retrieve(acao.Id);

        if not Assigned(acao) then
          Exit;

        action := TWorkspaceAction.Create(FActionList);
        action.Acao := acao;
        action.Category := barra.Descricao;
        action.Caption := acao.Descricao;
        action.ImageIndex := acao.Icone;

        link := bar.ItemLinks.Add;
        link.Item := TdxBarLargeButton.Create(FBarManager);
        link.Item.Action := action;
        link.Item.Category := FBarManager.Categories.IndexOf('Default');
      end;
    end;
    Close;
  finally
    Free;
  end;
end;


constructor TIDEControllerMainMenu.Create(ARibbon: TdxRibbon; ABarManager: TdxBarManager; AActionList: TActionList);
begin
  FRibbon := ARibbon;
  FBarManager := ABarManager;
  FActionList := AActionList;
end;

end.
