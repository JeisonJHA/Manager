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
  dxBarBuiltInMenu, dxTabbedMDI, Vcl.Menus, Manager.Core.IDE;

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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actOnAbreTelaExecute(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure mnuFecharClick(Sender: TObject);
  private
    { Private declarations }
    FController: TControllerMain;
    function CurrentWorkspace: IWorkspace;
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

function TfrmMain.CurrentWorkspace: IWorkspace;
begin
  Exit(nil);
end;

procedure TfrmMain.DBGrid1DblClick(Sender: TObject);
begin
  Controller.AbriAbaWorkspace(iosWorkspaces.CurrentObject);
end;

destructor TfrmMain.Destroy;
begin
  FreeAndNil(FController);
  inherited;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  DisableAero := True;
  Controller.OnCreate(Self);
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

function TfrmMain.RibbonTabs: TdxRibbonTabCollection;
begin
  Exit(dxRibbon1.Tabs);
end;

function TfrmMain.TabPrincipal: TdxRibbonTab;
begin
  Exit(ribbonTabPrincipal);
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
