unit Manager.Core.Forms.Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, dxSkinsCore,
  dxRibbonCustomizationForm, dxSkinsdxBarPainter, cxContainer, cxEdit,
  dxSkinsForm, dxStatusBar, dxRibbonStatusBar, cxLabel, dxGallery,
  dxGalleryControl, dxRibbonBackstageViewGalleryControl, Manager.Core.API.Main,
  Manager.Core.API.Workspace, System.Actions, Vcl.ActnList, Data.DB,
  InstantPresentation, Manager.Core.Forms.Main.Controller, Vcl.Grids, Vcl.DBGrids,
  cxPC, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, Vcl.ExtCtrls,
  dxDockPanel, dxDockControl, JvExDBGrids, JvDBGrid, Vcl.StdCtrls,
  dxBarBuiltInMenu, dxTabbedMDI, Vcl.Menus, Manager.Core.IDE, Vcl.AppEvnts,
  dxAlertWindow, InstantExplorer, JvComponentBase, JvFormPlacement,
  JvAppStorage, JvAppIniStorage;

type
  TfrmMain = class(TdxRibbonForm, IMain)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxRibbon1: TdxRibbon;
    ribbonTabPrincipal: TdxRibbonTab;
    dxRibbonBackstageView1: TdxRibbonBackstageView;
    dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxRibbonBackstageViewGalleryControl1: TdxRibbonBackstageViewGalleryControl;
    cxLabel1: TcxLabel;
    dxRibbonBackstageViewGalleryControl1Group1: TdxRibbonBackstageViewGalleryGroup;
    dxSkinController1: TdxSkinController;
    dxRibbonBackstageViewGalleryControl1Group1Item1: TdxRibbonBackstageViewGalleryItem;
    iosWorkspaces: TInstantSelector;
    dtsWorkspaces: TDataSource;
    dxDockSite1: TdxDockSite;
    dxDockPanel1: TdxDockPanel;
    Panel1: TPanel;
    DBGrid1: TJvDBGrid;
    mdiControleTelas: TdxTabbedMDIManager;
    barCadastros: TdxBar;
    aclToolbars: TActionList;
    actCadastroSistema: TAction;
    actFormularioOpcoes: TAction;
    actCadastroAcaoCopiar: TAction;
    actCadastroAcaoExecutar: TAction;
    actCadastroAcaoConfigurarBaseDeDadosDB2: TAction;
    actCadastroAcaoConfigurarBaseDeDadosMSSQL: TAction;
    actCadastroAcaoConfigurarBaseDeDadosOracle: TAction;
    actCadastroAcaoConjuntoBases: TAction;
    actCadastroAcaoConfigurarBaseDeDados: TAction;
    actCadastroBarraFerramentas: TAction;
    actCadastroAcaoMontarAmbiente: TAction;
    actCadastroAcaoCatalogoBases: TAction;
    btnCadastroSistema: TdxBarLargeButton;
    btnOpcoes: TdxBarLargeButton;
    btnCadastroAcaoCopiar: TdxBarLargeButton;
    btnCadastroAcaoExecutar: TdxBarButton;
    btnCadastroAcaoConfigurarBaseDeDadosDB2: TdxBarLargeButton;
    btnCadastroAcaoConfigurarBaseDeDadosMSSQL: TdxBarLargeButton;
    btnCadastroAcaoConfigurarBaseDeDadosOracle: TdxBarLargeButton;
    btnCadastroAcaoConjuntoBases: TdxBarLargeButton;
    btnCadastroAcaoConfigurarBaseDeDados: TdxBarButton;
    btnCadastroBarraFerramentas: TdxBarButton;
    btnCadastroAcaoMontarAmbiente: TdxBarButton;
    btnCadastroAcaoCatalogoBases: TdxBarButton;
    btnBancoDeDados: TdxBarSubItem;
    btnAcoes: TdxBarSubItem;
    dxBarSeparator1: TdxBarSeparator;
    dxBarSeparator2: TdxBarSeparator;
    btnMenu: TdxBarSubItem;
    dxLayoutDockSite1: TdxLayoutDockSite;
    tiPrincipal: TTrayIcon;
    ppmTrayIcon: TPopupMenu;
    N1: TMenuItem;
    mnuFechar: TMenuItem;
    aePrincipal: TApplicationEvents;
    actUpdate: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    alMessageAlert: TdxAlertWindowManager;
    barBaseDeDados: TdxBar;
    btnConjuntoDeBases: TdxBarSubItem;
    btnCatalagoBases: TdxBarSubItem;
    JvAppIniFileStorage1: TJvAppIniFileStorage;
    JvFormStorage1: TJvFormStorage;
    actCadastroAcaoExclusao: TAction;
    btnCadastroAcaoExclusao: TdxBarLargeButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actOnAbreTelaExecute(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure mnuFecharClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aePrincipalMinimize(Sender: TObject);
    procedure tiPrincipalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actUpdateExecute(Sender: TObject);
    procedure alMessageAlertButtonClick(Sender: TObject;
      AAlertWindow: TdxAlertWindow; AButtonIndex: Integer);
    procedure ppmTrayIconChange(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
  private
    { Private declarations }
    FController: TControllerMain;
    function RibbonTabs: TdxRibbonTabCollection;
    function ActionList: TActionList;
    function Workspaces: TInstantSelector;
    function TabPrincipal: TdxRibbonTab;
    function ToolBarCadastro: TdxBar;
    function MDIManager: TdxTabbedMDIManager;
    function TrayIcon: TTrayIcon;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Controller: TControllerMain read FController;
  end;

var
  frmMain: TfrmMain;

implementation

uses udtmDatabase, Manager.Core.Forms.Utils;

{$R *.dfm}

{ TForm1 }

procedure TfrmMain.actOnAbreTelaExecute(Sender: TObject);
begin
  CreateForm(TAction(Sender).HelpKeyword).ShowModal;
end;

procedure TfrmMain.actUpdateExecute(Sender: TObject);
begin
  Controller.ExecutarAtulizacao;
end;

procedure TfrmMain.aePrincipalMinimize(Sender: TObject);
begin
  Self.Hide();
  Self.WindowState := wsMinimized;
  Self.tiPrincipal.Visible := True;
  Self.tiPrincipal.Animate := True;
  Self.tiPrincipal.ShowBalloonHint;
end;

procedure TfrmMain.alMessageAlertButtonClick(Sender: TObject;
  AAlertWindow: TdxAlertWindow; AButtonIndex: Integer);
begin
  case AButtonIndex of
    0: Controller.ExecutarAtulizacao;
  end;
end;

function TfrmMain.ActionList: TActionList;
begin
  Exit(aclToolbars);
end;

constructor TfrmMain.Create(AOwner: TComponent);
begin
  inherited;
  FController := TControllerMain.Create(Self);
  Application.Register(FController);
end;

procedure TfrmMain.DBGrid1DblClick(Sender: TObject);
begin
  Controller.AbriAbaWorkspace(iosWorkspaces.CurrentObject);
end;

destructor TfrmMain.Destroy;
begin
  inherited;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Controller.OnFormClose(Sender, Action);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  DisableAero := True;
  Controller.OnCreate(Self);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  Controller.OnDestroy(Sender);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  Controller.OnShow(Self);
end;

function TfrmMain.MDIManager: TdxTabbedMDIManager;
begin
  Exit(mdiControleTelas);
end;

procedure TfrmMain.mnuFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.ppmTrayIconChange(Sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
  if not Assigned(Controller) then
    Exit;

  Controller.SalvarWorkspaceAtual;
end;

function TfrmMain.RibbonTabs: TdxRibbonTabCollection;
begin
  Exit(dxRibbon1.Tabs);
end;

function TfrmMain.TabPrincipal: TdxRibbonTab;
begin
  Exit(ribbonTabPrincipal);
end;

procedure TfrmMain.tiPrincipalClick(Sender: TObject);
begin
  Self.tiPrincipal.Visible := False;
  Self.Show();
  WindowState := wsMaximized;
  Application.BringToFront();
end;

function TfrmMain.ToolBarCadastro: TdxBar;
begin
  Exit(barCadastros);
end;

function TfrmMain.TrayIcon: TTrayIcon;
begin
  Exit(tiPrincipal);
end;

function TfrmMain.Workspaces: TInstantSelector;
begin
  Exit(iosWorkspaces);
end;

end.
