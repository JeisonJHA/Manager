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
  Workspace, Datasnap.DBClient, dxSkinBlack,
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
  InstantPresentation, IDE.Aplicacao, DosCommand, Manager.PromptCommand,
  JvAppIniStorage, JvFormPlacement, Vcl.AppEvnts, Vcl.Menus;

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
    alPrincipal: TActionList;
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
    btnBancoDeDados: TdxBarSubItem;
    btnCadastroBancoDeDadosOracle: TdxBarLargeButton;
    btnCadastroBancoDeDadosMSSQL: TdxBarLargeButton;
    btnCadastroBancoDeDadosDB2: TdxBarLargeButton;
    iosWorkspaces: TInstantSelector;
    iosWorkspacesDescricao: TStringField;
    iosWorkspacesDiretorio: TStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Descricao: TcxGridDBColumn;
    dxDockSite2: TdxDockSite;
    dxDockPanel2: TdxDockPanel;
    dxLayoutDockSite2: TdxLayoutDockSite;
    dxBarSeparator1: TdxBarSeparator;
    dxBarLargeButton1: TdxBarLargeButton;
    txtConsole: TMemo;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarSeparator2: TdxBarSeparator;
    dxBarLargeButton4: TdxBarLargeButton;
    JvAppIniFileStorage1: TJvAppIniFileStorage;
    edtSCMPaths: TcxTextEdit;
    JvFormStorage1: TJvFormStorage;
    tabSandbox: TdxRibbonBackstageViewTabSheet;
    aePrincipal: TApplicationEvents;
    tiPrincipal: TTrayIcon;
    ppmTrayIcon: TPopupMenu;
    mnuFechar: TMenuItem;
    N1: TMenuItem;
    barDebug: TdxBar;
    btnConfigToolbarWorkspace: TdxBarButton;
    btnCriarConjuntoDeBases: TdxBarButton;
    dxBarSeparator3: TdxBarSeparator;
    barCatalogoDeBases: TdxBar;
    btnCatalogar: TdxBarSubItem;
    btnCriarCatalogoDeBases: TdxBarLargeButton;
    btnConjuntoDeBases: TdxBarSubItem;
    btnExclusao: TdxBarSubItem;
    btnExclusaoDeArquivo: TdxBarButton;
    btnExclusaoDeDiretório: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure actCadSistemasExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure btnCadastroAcaoExecutarClick(Sender: TObject);
    procedure btnCadastroAcaoCopiarClick(Sender: TObject);
    procedure btnCadastroBancoDeDadosOracleClick(Sender: TObject);
    procedure btnCadastroBancoDeDadosMSSQLClick(Sender: TObject);
    procedure btnCadastroBancoDeDadosDB2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure txtConsoleKeyPress(Sender: TObject; var Key: Char);
    procedure dxDockPanel2Activate(Sender: TdxCustomDockControl;
      Active: Boolean);
    procedure txtConsoleEnter(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure aePrincipalMinimize(Sender: TObject);
    procedure tiPrincipalClick(Sender: TObject);
    procedure mnuFecharClick(Sender: TObject);
    procedure btnCriarConjuntoDeBasesClick(Sender: TObject);
    procedure btnCriarCatalogoDeBasesClick(Sender: TObject);
  private
    { Private declarations }
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
 IDE.Controller.MainMenu, Cadastro.Sistema, Cadastro.Acao.Configurar.BaseDeDados.Oracle,
 Cadastro.Acao.Configurar.BaseDeDados.DB2, Cadastro.Acao.Configurar.BaseDeDados.MSSQL, IDE.Utils,
 Cadastro.Acao.Configurar.BaseDeDados, IDE.IWorkspace,
 Cadastro.Acao.MontarAmbiente, Cadastro.SCM, Cadastro.Acao.Conjunto.Bases,
 Cadastro.Acao.Catalogo.Bases;

const
  CONSOLE_TEXTO = 'manager/>';

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
    dxRibbonStatusBar1.Panels[1].Text := 'Versão: ' + IDE.Utils.PegarVersaoAplicacao + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32);
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmPrincipal.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  I: Integer;
  iws: IWorkspace;
  workspace: TWorkspace;
begin
  workspace := TWorkspace(iosWorkspaces.CurrentObject);
  if not Assigned(workspace) then
    Exit;

  for I := 0 to dxTabbedMDIManager1.TabProperties.PageCount -1 do
  begin
    dxTabbedMDIManager1.TabProperties.Pages[I].MDIChild.GetInterface(IWorkspace, iws);
    if Assigned(iws) and (iws.Sandbox = workspace) then
    begin
      dxTabbedMDIManager1.TabProperties.PageIndex := I;
      Exit;
    end;
  end;

  with TfrmWorkspace.Create(Self, workspace) do
  begin
    Show;
  end;
end;

procedure TfrmPrincipal.aePrincipalMinimize(Sender: TObject);
begin
  Self.Hide();
  Self.WindowState := wsMinimized;
  Self.tiPrincipal.Visible := True;
  Self.tiPrincipal.Animate := True;
  Self.tiPrincipal.ShowBalloonHint;
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
  with TfrmCadastroAcaoConfigurarBaseDeDadosDB2.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.btnCadastroBancoDeDadosMSSQLClick(Sender: TObject);
begin
  with TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.btnCadastroBancoDeDadosOracleClick(Sender: TObject);
begin
  with TfrmCadastroAcaoConfigurarBaseDeDadosOracle.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.btnCriarConjuntoDeBasesClick(Sender: TObject);
begin
  with TfrmCadastroAcaoConjuntoBases.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.dxBarLargeButton1Click(Sender: TObject);
begin
  with TfrmCadastroAcaoConfigurarBaseDeDados.Create(nil) do
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

procedure TfrmPrincipal.dxBarLargeButton3Click(Sender: TObject);
begin

  ShowMessage(IntToStr(dxTabbedMDIManager1.TabProperties.PageIndex));
end;

procedure TfrmPrincipal.dxBarLargeButton4Click(Sender: TObject);
begin
  with TfrmCadastroAcaoMontarAmbiente.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.btnCriarCatalogoDeBasesClick(Sender: TObject);
begin
  with TfrmCadastroAcaoCatalogoBases.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmPrincipal.dxDockPanel2Activate(Sender: TdxCustomDockControl;
  Active: Boolean);
begin
  if txtConsole.CanFocus then
    txtConsole.SetFocus;
end;

procedure TfrmPrincipal.InicializarMainMenu;
var
  controller: TBarraFerramentaController;
begin
  controller := TBarraFerramentaController.Create(Self.alPrincipal);
  try
    controller.CarregarMenuPrincipal(ribbonGerenciamento);
    controller.CarregarPopupMenuTrayIcon(ppmTrayIcon);
    controller.CarregarConjuntoDeBases(btnConjuntoDeBases);
    controller.CarregarCatalogoDeBases(btnCatalogar);
  finally
    FreeAndNil(controller);
  end;
end;

procedure TfrmPrincipal.InicializarWorkspaceList;
begin
  with TWorkspaceUtils.Create(Application.Configuracoes) do
  begin
    Sandboxes(iosWorkspaces);
    Free;
  end;
end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  edtSCMPaths.Text := TfrmCadastroSCM.Configurar(edtSCMPaths.Text);
end;

procedure TfrmPrincipal.tiPrincipalClick(Sender: TObject);
begin
  Self.tiPrincipal.Visible := False;
  Self.Show();
  WindowState := wsMaximized;
  Application.BringToFront();
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
  InicializarMainMenu;
end;

function ExcluiQuebra( Str: String ): String;
var
  texto: string;
begin
  texto := Str;
  texto := StringReplace(texto, #$D#$A, '', [rfReplaceAll]);
  texto := StringReplace(texto, #13#10, '', [rfReplaceAll]);
  Exit(texto);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  {$IFDEF DEBUG}
  barDebug.Visible := True;
  {$ELSE}
  barDebug.Visible := False;
  {$ENDIF}
  Self.Caption := Application.Title;

  Application.TabbedMDIManager(dxTabbedMDIManager1);
  Application.PromptCommand.InputToOutput := True;
  Application.PromptCommand.OutputLines := txtConsole.Lines;
  txtConsole.Lines.Delete(Length(txtConsole.Lines.Text)+1);


  edtSCMPaths.Text := TfrmCadastroSCM.Pegar;
  CarregarVersao;
  dxRibbonStatusBar1.Panels[0].Text := AnsiLowerCase(dtmDatabase.IBDatabase1.DatabaseName);
end;

procedure TfrmPrincipal.txtConsoleEnter(Sender: TObject);
begin
  if txtConsole.CanFocus then
    txtConsole.SetFocus;
  txtConsole.SelStart := Length(CONSOLE_TEXTO);
end;

procedure TfrmPrincipal.txtConsoleKeyPress(Sender: TObject; var Key: Char);
var
  LineNumber: longint;
  Texto: string;
begin
  if (Key = #13) then
  begin
    LineNumber := SendMessage(txtConsole.Handle, EM_LINEFROMCHAR, txtConsole.Selstart, 0);
    Texto := StringReplace(txtConsole.Lines.Strings[LineNumber], CONSOLE_TEXTO, '', [rfReplaceAll, rfIgnoreCase]);
    if not Texto.IsEmpty then
    begin
      Application.PromptCommand.CommandLine := Texto;
      Application.PromptCommand.Execute;
    end;
    txtConsole.Lines.Add(CONSOLE_TEXTO);
//    txtConsoleEnter(txtConsole);
    Abort;
  end;

  if Key = #8 then
  begin
    LineNumber := SendMessage(txtConsole.Handle, EM_LINEFROMCHAR, txtConsole.Selstart, 0);
    Texto := StringReplace(txtConsole.Lines.Strings[LineNumber], CONSOLE_TEXTO, '', [rfReplaceAll, rfIgnoreCase]);
    if Length(Texto) <= 0 then
      Abort;
  end;
end;

end.
