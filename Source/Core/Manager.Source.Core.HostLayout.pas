unit Manager.Source.Core.HostLayout;

interface

uses Forms, Classes, SysUtils, Manager.Source.Core.Intf.HostLayout, dxBar,
  Manager.Source.Forms.Main, dxRibbon, dxStatusBar, System.Actions, Vcl.ActnList;

type
  TManagerHostLayout = class(TInterfacedObject, IManagerHostLayout)
  private
    procedure CriarBotaoUpdate;
    procedure CriarGrupoCadastro(ATab: TdxRibbonTab; AToolBar: TdxBar);
    procedure OnAbreTelaExecute(Sender: TObject);
    procedure CriarBotaoBancoDeDados(AToolBar: TdxBar);
    procedure CriarBotaoSistema(AToolBar: TdxBar);
    procedure CriarBotaoAtividades(AToolBar: TdxBar);
    procedure CriarBotaoMenu(AToolBar: TdxBar);
  protected
    FMainForm: TfrmMain;
    function CriarToolBar(ACaption: string): TdxBar;
  public
    constructor Create(AMainForm: TForm);
    procedure InicializarRibbon; virtual;
    procedure InicializarBarraStatus; virtual;

    property MainForm: TfrmMain read FMainForm;
  end;

implementation

{ TManagerHostLayout }

uses Manager.Source.Core.AplicationHelper, Manager.Source.Core.FormUtils;

constructor TManagerHostLayout.Create(AMainForm: TForm);
begin
  FMainForm := TfrmMain(AMainForm);
end;

procedure TManagerHostLayout.InicializarBarraStatus;
var
  panel: TdxStatusBarPanel;
begin
  panel := MainForm.dxRibbonStatusBar1.Panels.Add;
  panel.Text := 'Hello World';
end;

procedure TManagerHostLayout.InicializarRibbon;
var
  tabPrincipal: TdxRibbonTab;
  toolBar: TdxBar;
begin
  tabPrincipal := MainForm.mnuRibbon.Tabs.Add;
  tabPrincipal.Caption := 'PRINCIPAL';

  toolBar := CriarToolBar('Cadastros');

  CriarBotaoUpdate;
  CriarGrupoCadastro(tabPrincipal, toolBar);
end;

function TManagerHostLayout.CriarToolBar(ACaption: string): TdxBar;
begin
  Result := MainForm.bmToolBars.Bars.Add;
  Result.IsMainMenu := True;
  Result.Visible := True;
  Result.DockingStyle := dsTop;
  Result.Caption := ACaption;
end;

procedure TManagerHostLayout.CriarGrupoCadastro(ATab: TdxRibbonTab; AToolBar: TdxBar);
var
  group: TdxRibbonTabGroup;
begin
  group := ATab.Groups.Add;
  group.ToolBar := AToolBar;
  group.Caption := 'Cadastros';

  CriarBotaoSistema(AToolBar);
  CriarBotaoBancoDeDados(AToolBar);
  CriarBotaoAtividades(AToolBar);
  CriarBotaoMenu(AToolBar);
end;

procedure TManagerHostLayout.CriarBotaoSistema(AToolBar: TdxBar);
var
  btnSistemas: TdxBarItemLink;
begin
  // Cadastro de sistemas
  btnSistemas := AToolBar.ItemLinks.Add;
  btnSistemas.Item := TdxBarLargeButton.Create(AToolBar.BarManager);
  btnSistemas.Item.Action := MainForm.aclAtividades.Add;
  btnSistemas.Item.Action.OnExecute := OnAbreTelaExecute;
  TAction(btnSistemas.Item.Action).HelpKeyword := 'TfrmCadastroSistema';
  TAction(btnSistemas.Item.Action).Caption := 'Sistemas';
  TAction(btnSistemas.Item.Action).ImageIndex := 3;
  btnSistemas.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');
end;

procedure TManagerHostLayout.CriarBotaoMenu(AToolBar: TdxBar);
var
  btnMenu: TdxBarItemLink;
  btnAux: TdxBarItemLink;
begin
  // Cadastro de menu
  btnMenu := AToolBar.ItemLinks.Add;
  btnMenu.Item := TdxBarSubItem.Create(AToolBar.BarManager);
  btnMenu.Item.Caption := 'Barra de Ferramenta';
  btnMenu.Item.ImageIndex := 17;
  btnMenu.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');
  // Adicição do botão barra de ferramentas
  btnAux := TdxBarSubItem(btnMenu.Item).ItemLinks.Add;
  btnAux.Item := TdxBarButton.Create(AToolBar.BarManager);
  btnAux.Item.Action := MainForm.aclAtividades.Add;
  btnAux.Item.Action.OnExecute := OnAbreTelaExecute;
  TAction(btnAux.Item.Action).HelpKeyword := 'TfrmCadastroBarraFerramentas';
  TAction(btnAux.Item.Action).Caption := 'Barra de ferramentas';
  TAction(btnAux.Item.Action).ImageIndex := 15;
  btnAux.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');
end;

procedure TManagerHostLayout.CriarBotaoAtividades(AToolBar: TdxBar);
var
  btnAtividades: TdxBarItemLink;
  btnAux: TdxBarItemLink;
begin
  // Cadastro de atividades
  btnAtividades := AToolBar.ItemLinks.Add;
  btnAtividades.Item := TdxBarSubItem.Create(AToolBar.BarManager);
  btnAtividades.Item.Caption := 'Atividades';
  btnAtividades.Item.ImageIndex := 16;
  btnAtividades.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');
  // Adicição do botão executar
  btnAux := TdxBarSubItem(btnAtividades.Item).ItemLinks.Add;
  btnAux.Item := TdxBarButton.Create(AToolBar.BarManager);
  btnAux.Item.Action := MainForm.aclAtividades.Add;
  btnAux.Item.Action.OnExecute := OnAbreTelaExecute;
  TAction(btnAux.Item.Action).HelpKeyword := 'TfrmCadastroAcaoExecutar';
  TAction(btnAux.Item.Action).Caption := 'Executar';
  TAction(btnAux.Item.Action).ImageIndex := 5;
  btnAux.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');
  // Adicição do botão copiar
  btnAux := TdxBarSubItem(btnAtividades.Item).ItemLinks.Add;
  btnAux.Item := TdxBarButton.Create(AToolBar.BarManager);
  btnAux.Item.Action := MainForm.aclAtividades.Add;
  btnAux.Item.Action.OnExecute := OnAbreTelaExecute;
  TAction(btnAux.Item.Action).HelpKeyword := 'TfrmCadastroAcaoCopiar';
  TAction(btnAux.Item.Action).Caption := 'Copiar';
  TAction(btnAux.Item.Action).ImageIndex := 6;
  btnAux.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');
  // Adicição do botão excluir
  btnAux := TdxBarSubItem(btnAtividades.Item).ItemLinks.Add;
  btnAux.Item := TdxBarButton.Create(AToolBar.BarManager);
  btnAux.Item.Action := MainForm.aclAtividades.Add;
  btnAux.Item.Action.OnExecute := OnAbreTelaExecute;
  TAction(btnAux.Item.Action).HelpKeyword := 'TfrmCadastroAcaoExclusao';
  TAction(btnAux.Item.Action).Caption := 'Excluir';
  TAction(btnAux.Item.Action).ImageIndex := 29;
  btnAux.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');
  // Adicição do botão montar ambiente
  btnAux := TdxBarSubItem(btnAtividades.Item).ItemLinks.Add;
  btnAux.Item := TdxBarButton.Create(AToolBar.BarManager);
  btnAux.Item.Action := MainForm.aclAtividades.Add;
  btnAux.Item.Action.OnExecute := OnAbreTelaExecute;
  TAction(btnAux.Item.Action).HelpKeyword := 'TfrmCadastroAcaoMontarAmbiente';
  TAction(btnAux.Item.Action).Caption := 'Montar ambiente';
  TAction(btnAux.Item.Action).ImageIndex := 20;
  btnAux.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');
  // Adicição do botão catálogo de bases
  btnAux := TdxBarSubItem(btnAtividades.Item).ItemLinks.Add;
  btnAux.Item := TdxBarButton.Create(AToolBar.BarManager);
  btnAux.Item.Action := MainForm.aclAtividades.Add;
  btnAux.Item.Action.OnExecute := OnAbreTelaExecute;
  TAction(btnAux.Item.Action).HelpKeyword := 'TfrmCadastroAcaoCatalogoBases';
  TAction(btnAux.Item.Action).Caption := 'Catálogo de bases';
  TAction(btnAux.Item.Action).ImageIndex := 53;
  btnAux.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');
  // Adicição do botão conjunto de bases
  btnAux := TdxBarSubItem(btnAtividades.Item).ItemLinks.Add;
  btnAux.Item := TdxBarButton.Create(AToolBar.BarManager);
  btnAux.Item.Action := MainForm.aclAtividades.Add;
  btnAux.Item.Action.OnExecute := OnAbreTelaExecute;
  TAction(btnAux.Item.Action).HelpKeyword := 'TfrmCadastroAcaoConjuntoBases';
  TAction(btnAux.Item.Action).Caption := 'Conjunto de bases';
  TAction(btnAux.Item.Action).ImageIndex := 53;
  btnAux.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');
end;

procedure TManagerHostLayout.CriarBotaoBancoDeDados(AToolBar: TdxBar);
var
  btnBaseDados: TdxBarItemLink;
  btnAux: TdxBarItemLink;
begin
  // Cadastro de base de dados
  btnBaseDados := AToolBar.ItemLinks.Add;
  btnBaseDados.Item := TdxBarSubItem.Create(AToolBar.BarManager);
  btnBaseDados.Item.Caption := 'Base de dados';
  btnBaseDados.Item.ImageIndex := 54;
  btnBaseDados.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');
  // Adicição do botão oracle
  btnAux := TdxBarSubItem(btnBaseDados.Item).ItemLinks.Add;
  btnAux.Item := TdxBarButton.Create(AToolBar.BarManager);
  btnAux.Item.Action := MainForm.aclAtividades.Add;
  btnAux.Item.Action.OnExecute := OnAbreTelaExecute;
  TAction(btnAux.Item.Action).HelpKeyword := 'TfrmCadastroAcaoConfigurarBaseDeDadosOracle';
  TAction(btnAux.Item.Action).Caption := 'Oracle';
  TAction(btnAux.Item.Action).ImageIndex := 48;
  btnAux.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');
  // Adicição do botão mssql
  btnAux := TdxBarSubItem(btnBaseDados.Item).ItemLinks.Add;
  btnAux.Item := TdxBarButton.Create(AToolBar.BarManager);
  btnAux.Item.Action := MainForm.aclAtividades.Add;
  btnAux.Item.Action.OnExecute := OnAbreTelaExecute;
  TAction(btnAux.Item.Action).HelpKeyword := 'TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL';
  TAction(btnAux.Item.Action).Caption := 'MSSql';
  TAction(btnAux.Item.Action).ImageIndex := 49;
  btnAux.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');
  // Adicição do botão db2
  btnAux := TdxBarSubItem(btnBaseDados.Item).ItemLinks.Add;
  btnAux.Item := TdxBarButton.Create(AToolBar.BarManager);
  btnAux.Item.Action := MainForm.aclAtividades.Add;
  btnAux.Item.Action.OnExecute := OnAbreTelaExecute;
  TAction(btnAux.Item.Action).HelpKeyword := 'TfrmCadastroAcaoConfigurarBaseDeDadosDB2';
  TAction(btnAux.Item.Action).Caption := 'DB2';
  TAction(btnAux.Item.Action).ImageIndex := 47;
  btnAux.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');
end;

procedure TManagerHostLayout.CriarBotaoUpdate;
var
  actUpdate: TAction;
begin
  actUpdate := MainForm.aclAtividades.Add;
  actUpdate.Caption := 'Atualização';
  Application.IDE.Update.Action := actUpdate;
  MainForm.btnUpdate.Action := actUpdate;
end;

procedure TManagerHostLayout.OnAbreTelaExecute(Sender: TObject);
begin
  CreateForm(TAction(Sender).HelpKeyword).ShowModal;
end;

end.
