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
  InstantPresentation, Manager.Core.Controller.Main, Vcl.Grids, Vcl.DBGrids,
  cxPC, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, Vcl.ExtCtrls,
  dxDockPanel, dxDockControl, JvExDBGrids, JvDBGrid, Vcl.StdCtrls,
  dxBarBuiltInMenu, dxTabbedMDI;

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
    dxLayoutDockSite1: TdxLayoutDockSite;
    dxDockPanel1: TdxDockPanel;
    Panel1: TPanel;
    DBGrid1: TJvDBGrid;
    Button1: TButton;
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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure actOnAbreTelaExecute(Sender: TObject);
  private
    { Private declarations }
    FController: TControllerMain;
    function CurrentWorkspace: IWorkspace;
    function RibbonTabs: TdxRibbonTabCollection;
    function ActionList: TActionList;
    function Workspaces: TInstantSelector;
    function TabPrincipal: TdxRibbonTab;
    function ToolBarCadastro: TdxBar;
    procedure OnAbreTelaExecute(Sender: TObject);
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

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  Controller.PrepararMainMenu;
end;

constructor TfrmMain.Create(AOwner: TComponent);
begin
  inherited;
  FController := TControllerMain.Create;
end;

function TfrmMain.CurrentWorkspace: IWorkspace;
begin
  Exit(nil);
end;

destructor TfrmMain.Destroy;
begin
  FreeAndNil(FController);
  inherited;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  DisableAero := True;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  Controller.PrepararMainMenu;
  Controller.PrepararWorkspaceList(iosWorkspaces);
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

function TfrmMain.Workspaces: TInstantSelector;
begin
  Exit(iosWorkspaces);
end;

procedure TfrmMain.OnAbreTelaExecute(Sender: TObject);
begin
end;

end.
