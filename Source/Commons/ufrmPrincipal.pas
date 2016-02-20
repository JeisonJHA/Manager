unit ufrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, dxSkinsCore,
  dxRibbonCustomizationForm, dxSkinsdxBarPainter, cxContainer, cxEdit,
  dxSkinsForm, dxStatusBar, dxRibbonStatusBar, cxLabel, dxGallery,
  dxGalleryControl, dxRibbonBackstageViewGalleryControl, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, JvComponentBase, JvAppStorage,
  JvAppRegistryStorage, cxTextEdit, Vcl.StdCtrls, Vcl.Buttons, cxPC,
  dxSkinscxPCPainter, dxBarBuiltInMenu, dxTabbedMDI, Workspace.Action,
  Vcl.ExtCtrls, cxMaskEdit, cxSpinEdit, cxSpinButton, JvExControls, JvPageList,
  JvNavigationPane, dxSkinsdxDockControlPainter, dxDockControl, dxDockPanel,
  Workspace.Utils, Workspace.Config, Data.DB, Vcl.Grids, Vcl.DBGrids,
  MdDsCustom, MdDsList, MdDsObjects, Workspace, Datasnap.DBClient, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  InstantPresentation;

type
  TfrmPrincipal = class(TdxRibbonForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxRibbon1: TdxRibbon;
    dxRibbonBackstageView1: TdxRibbonBackstageView;
    dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxRibbonBackstageViewGalleryControl1: TdxRibbonBackstageViewGalleryControl;
    cxLabel1: TcxLabel;
    dxRibbonBackstageViewGalleryControl1Group1: TdxRibbonBackstageViewGalleryGroup;
    dxSkinController1: TdxSkinController;
    dxRibbonBackstageViewGalleryControl1Group1Item1: TdxRibbonBackstageViewGalleryItem;
    ActionList1: TActionList;
    actOpcoes: TAction;
    btnOpcoes: TdxBarLargeButton;
    ribbonGerenciamento: TdxRibbonTab;
    barCadastros: TdxBar;
    actCadSistemas: TAction;
    actCadBaseDados: TAction;
    actCadAplicacoes: TAction;
    btnCadSistemas: TdxBarLargeButton;
    tabOpcoes: TdxRibbonBackstageViewTabSheet;
    regStorage: TJvAppRegistryStorage;
    cxTextEdit1: TcxTextEdit;
    Label1: TLabel;
    cxLabel2: TcxLabel;
    SpeedButton1: TSpeedButton;
    dxTabbedMDIManager1: TdxTabbedMDIManager;
    dxDockingManager1: TdxDockingManager;
    dxDockSite1: TdxDockSite;
    dxDockPanel1: TdxDockPanel;
    Panel1: TPanel;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dtsWorkspaces: TDataSource;
    dxBarSubItem1: TdxBarSubItem;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarSubItem2: TdxBarSubItem;
    btnCadastroAcaoExecutar: TdxBarButton;
    btnCadastroAcaoCopiar: TdxBarButton;
    DBGrid1: TDBGrid;
    btnBancoDeDados: TdxBarSubItem;
    btnCadastroBancoDeDadosOracle: TdxBarLargeButton;
    btnCadastroBancoDeDadosMSSQL: TdxBarLargeButton;
    btnCadastroBancoDeDadosDB2: TdxBarLargeButton;
    iosWorkspaces: TInstantSelector;
    iosWorkspacesDescricao: TStringField;
    iosWorkspacesDiretorio: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure actCadSistemasExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure btnCadastroAcaoExecutarClick(Sender: TObject);
    procedure btnCadastroAcaoCopiarClick(Sender: TObject);
    procedure btnCadastroBancoDeDadosOracleClick(Sender: TObject);
    procedure btnCadastroBancoDeDadosMSSQLClick(Sender: TObject);
    procedure btnCadastroBancoDeDadosDB2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure Teste;
    procedure CarregarVersao;
    procedure InicializarMainMenu;
    procedure InicializarWorkspaceList;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses JvTypes, IDE.Workspace, Winapi.ShellApi, udtmDatabase, Workspace.Constantes,
 Cadastro.Barra.Ferramentas, Cadastro.Acao.Executar, Cadastro.Acao.Copiar,
 IDE.Controller.MainMenu, Cadastro.Sistema, Cadastro.BancoDeDados.Oracle,
 Cadastro.BancoDeDados.DB2, Cadastro.BancoDeDados.MSSQL, IDE.Utils;

{ TForm1 }

procedure TfrmPrincipal.actCadSistemasExecute(Sender: TObject);
begin
  with TfrmCadastroSistema.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.CarregarVersao;
begin
  try
    dxRibbonStatusBar1.Panels[2].Text := 'Versão: ' + IDE.Utils.PegarVersaoAplicacao;
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmPrincipal.DBGrid1DblClick(Sender: TObject);
begin
  if not Assigned(iosWorkspaces.CurrentObject) then
    Exit;

  with TfrmWorkspace.Create(Self, TWorkspace(iosWorkspaces.CurrentObject)) do
  begin
    Show;
  end;
end;

procedure TfrmPrincipal.btnCadastroAcaoCopiarClick(Sender: TObject);
begin
  with TfrmCadastroAcaoCopiar.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.btnCadastroAcaoExecutarClick(Sender: TObject);
begin
  with TfrmCadastroAcaoExecutar.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.btnCadastroBancoDeDadosDB2Click(Sender: TObject);
begin
  with TfrmCadastroBancoDeDadosDB2.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.btnCadastroBancoDeDadosMSSQLClick(Sender: TObject);
begin
  with TfrmCadastroBancoDeDadosMSSQL.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.btnCadastroBancoDeDadosOracleClick(Sender: TObject);
begin
  with TfrmCadastroBancoDeDadosOracle.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.dxBarLargeButton2Click(Sender: TObject);
begin
  with TfrmCadastroBarraFerramentas.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.InicializarMainMenu;
var
  controller: TIDEControllerMainMenu;
begin
  controller := TIDEControllerMainMenu.Create(dxRibbon1, dxBarManager1, ActionList1);
  try
    controller.CarregarBarrasFerramentas(ribbonGerenciamento);
  finally
    FreeAndNil(controller);
  end;
end;

procedure TfrmPrincipal.InicializarWorkspaceList;
var
  utils: TWorkspaceUtils;
  config: TWorkspaceConfig;
  I: integer;
  sandbox: TWorkspace;
begin
  config := TWorkspaceConfig.Create(nil);
  try
    with TWorkspaceUtils.Create(config) do
    begin
      Sandboxes(iosWorkspaces);
      Free;
    end;
  finally
    FreeAndNil(config);
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if iosWorkspaces.Active then
    iosWorkspaces.Close;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  DisableAero := True;
  InicializarWorkspaceList;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  InicializarMainMenu;

  Teste;
  CarregarVersao;
  dxRibbonStatusBar1.Panels[0].Text := dtmDatabase.IBDatabase1.DatabaseName;
end;

procedure TfrmPrincipal.Teste;
begin
  with TWorkspaceConfig.Create(nil) do
  begin
    cxTextEdit1.Text := Diretorio;
    Free;
  end;
end;

end.
