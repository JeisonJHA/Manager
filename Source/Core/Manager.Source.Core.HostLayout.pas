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
  bar: TdxBar;
  action: TAction;

  btnSistemas: TdxBarItemLink;
  btnBaseDados: TdxBarItemLink;
  btnAtividades: TdxBarItemLink;
  btnMenu: TdxBarItemLink;
begin
  group := ATab.Groups.Add;
  group.ToolBar := AToolBar;
  group.Caption := 'Cadastros';

  // Cadastro de sistemas
  btnSistemas := AToolBar.ItemLinks.Add;
  btnSistemas.Item := TdxBarLargeButton.Create(AToolBar.BarManager);
  btnSistemas.Item.Action := MainForm.aclAtividades.Add;
  btnSistemas.Item.Action.OnExecute := OnAbreTelaExecute;
  TAction(btnSistemas.Item.Action).HelpKeyword := 'hello';
  TAction(btnSistemas.Item.Action).Caption := 'Sistemas';
  TAction(btnSistemas.Item.Action).ImageIndex := 3;
  btnSistemas.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');

  // Cadastro de base de dados
  btnSistemas := AToolBar.ItemLinks.Add;
  btnSistemas.Item := TdxBarSubItem.Create(AToolBar.BarManager);
  btnSistemas.Item.Caption := 'Base de dados';
  btnSistemas.Item.ImageIndex := 54;
  btnSistemas.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');

  // Cadastro de atividades
  btnAtividades := AToolBar.ItemLinks.Add;
  btnAtividades.Item := TdxBarSubItem.Create(AToolBar.BarManager);
  btnAtividades.Item.Caption := 'Atividades';
  btnAtividades.Item.ImageIndex := 16;
  btnAtividades.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');

  // Cadastro de menu
  btnMenu := AToolBar.ItemLinks.Add;
  btnMenu.Item := TdxBarSubItem.Create(AToolBar.BarManager);
  btnMenu.Item.Caption := 'Barra de Ferramenta';
  btnMenu.Item.ImageIndex := 17;
  btnMenu.Item.Category := AToolBar.BarManager.Categories.IndexOf('Default');


  xxx
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
