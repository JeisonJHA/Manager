unit ufrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView,
  dxSkinsCore, dxRibbonCustomizationForm, dxSkinsdxBarPainter, cxContainer,
  cxEdit, dxSkinsForm, dxStatusBar, dxRibbonStatusBar, cxLabel, dxGallery,
  dxGalleryControl, dxRibbonBackstageViewGalleryControl, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, JvComponentBase, JvAppStorage,
  JvAppRegistryStorage, cxTextEdit, Vcl.StdCtrls, Vcl.Buttons, cxPC,
  dxSkinscxPCPainter, dxBarBuiltInMenu, dxTabbedMDI, Manager.Core.Workspace.Action, Vcl.ExtCtrls,
  cxMaskEdit, cxSpinEdit, cxSpinButton, JvExControls, JvPageList,
  JvNavigationPane, dxSkinsdxDockControlPainter, dxDockControl, dxDockPanel,
  Manager.Core.Workspace.List, Manager.Core.Configuration, Data.DB, Vcl.Grids, Vcl.DBGrids, Workspace,
  Datasnap.DBClient, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, InstantPresentation, Manager.Core.IDE,
  Manager.Core.PromptCommand, Manager.PromptCommand, JvAppIniStorage, JvFormPlacement, Vcl.AppEvnts,
  Vcl.Menus, Manager.Core.IDE.Update, dxAlertWindow;

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
    regStorage: TJvAppRegistryStorage;
    dxTabbedMDIManager1: TdxTabbedMDIManager;
    dxDockingManager1: TdxDockingManager;
    dxDockSite1: TdxDockSite;
    dxDockPanel1: TdxDockPanel;
    Panel1: TPanel;
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
    dxBarSeparator1: TdxBarSeparator;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarSeparator2: TdxBarSeparator;
    dxBarLargeButton4: TdxBarLargeButton;
    JvAppIniFileStorage1: TJvAppIniFileStorage;
    JvFormStorage1: TJvFormStorage;
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
    btnExclusaoDeDiretorio: TdxBarButton;
    dxBarButton1: TdxBarButton;
    actUpdate: TAction;
    dxAlertWindowManager1: TdxAlertWindowManager;
    Timer1: TTimer;
    dockPromptCommand: TdxDockSite;
    dxLayoutDockSite2: TdxLayoutDockSite;
    dxDockPanel2: TdxDockPanel;
    txtConsole: TMemo;
    dxLayoutDockSite1: TdxLayoutDockSite;
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
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure txtConsoleKeyPress(Sender: TObject; var Key: Char);
    procedure dxDockPanel2Activate(Sender: TdxCustomDockControl; Active: Boolean);
    procedure txtConsoleEnter(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure aePrincipalMinimize(Sender: TObject);
    procedure tiPrincipalClick(Sender: TObject);
    procedure mnuFecharClick(Sender: TObject);
    procedure btnCriarConjuntoDeBasesClick(Sender: TObject);
    procedure btnCriarCatalogoDeBasesClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dxAlertWindowManager1ButtonClick(Sender: TObject; AAlertWindow: TdxAlertWindow; AButtonIndex: Integer);
    procedure actOpcoesExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ppmTrayIconChange(Sender: TObject; Source: TMenuItem; Rebuild: Boolean);
  private
    { Private declarations }
    FUpdate: TUpdate;
    procedure CarregarVersao;
    procedure InicializarMainMenu;
    procedure InicializarWorkspaceList;
    procedure CarregarWorkspaceRecentes;
    procedure AbriAbaWorkspace(AWorkspace: TWorkspace);
    procedure SalvarWorkspaceAtual;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  JvTypes, Winapi.ShellApi, udtmDatabase, Workspace.Constantes, IDE.Controller.MainMenu,
  Manager.Core.Utils, IDE.IWorkspace, Manager.Core.Forms.Utils, Manager.Core.Workspace.Recentes;

const
  CONSOLE_TEXTO = 'manager/>';

function ToWorkspace(APage: TdxTabbedMDIPage): IWorkspace;
begin
  Exit(APage.MDIChild as IWorkspace);
end;

{ TForm1 }

procedure TfrmPrincipal.actCadSistemasExecute(Sender: TObject);
begin
  CreateForm('TfrmCadastroSistema').ShowModal;
end;

procedure TfrmPrincipal.CarregarVersao;
begin
  try
    dxRibbonStatusBar1.Panels[1].Text := 'Versão: ' + Manager.Core.Utils.PegarVersaoAplicacao + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32);
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmPrincipal.AbriAbaWorkspace(AWorkspace: TWorkspace);
var
  I: Integer;
  iws: IWorkspace;
begin
  if not Assigned(AWorkspace) then
    Exit;

  for I := 0 to dxTabbedMDIManager1.TabProperties.PageCount - 1 do
  begin
    dxTabbedMDIManager1.TabProperties.Pages[I].MDIChild.GetInterface(IWorkspace, iws);
    if Assigned(iws) and (iws.Sandbox = AWorkspace) then
    begin
      dxTabbedMDIManager1.TabProperties.PageIndex := I;
      Exit;
    end;
  end;

  CreateFormWithSubject('TfrmWorkspace', TObject(AWorkspace)).Show;
end;

procedure TfrmPrincipal.cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  AbriAbaWorkspace(TWorkspace(iosWorkspaces.CurrentObject));
end;

procedure TfrmPrincipal.actOpcoesExecute(Sender: TObject);
begin
  CreateForm('TfrmFormularioOpcoes').ShowModal;
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
  CreateForm('TfrmCadastroAcaoCopiar').ShowModal;
end;

procedure TfrmPrincipal.btnCadastroAcaoExecutarClick(Sender: TObject);
begin
  CreateForm('TfrmCadastroAcaoExecutar').ShowModal;
end;

procedure TfrmPrincipal.btnCadastroBancoDeDadosDB2Click(Sender: TObject);
begin
  CreateForm('TfrmCadastroAcaoConfigurarBaseDeDadosDB2').ShowModal;
end;

procedure TfrmPrincipal.btnCadastroBancoDeDadosMSSQLClick(Sender: TObject);
begin
  CreateForm('TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL').ShowModal;
end;

procedure TfrmPrincipal.btnCadastroBancoDeDadosOracleClick(Sender: TObject);
begin
  CreateForm('TfrmCadastroAcaoConfigurarBaseDeDadosOracle').ShowModal;
end;

procedure TfrmPrincipal.btnCriarConjuntoDeBasesClick(Sender: TObject);
begin
  CreateForm('TfrmCadastroAcaoConjuntoBases').ShowModal;
end;

procedure TfrmPrincipal.dxAlertWindowManager1ButtonClick(Sender: TObject; AAlertWindow: TdxAlertWindow; AButtonIndex: Integer);
begin
  case AButtonIndex of
    0:
      FUpdate.Executar;
  end;
end;

procedure TfrmPrincipal.dxBarLargeButton1Click(Sender: TObject);
begin
  CreateForm('TfrmCadastroAcaoConfigurarBaseDeDados').ShowModal;
end;

procedure TfrmPrincipal.dxBarLargeButton2Click(Sender: TObject);
begin
  CreateForm('TfrmCadastroBarraFerramentas').ShowModal;
end;

procedure TfrmPrincipal.dxBarLargeButton3Click(Sender: TObject);
begin
//  ShowMessage(IntToStr(dxTabbedMDIManager1.TabProperties.PageIndex));
  dockPromptCommand.AutoHide := False;
//  dxLayoutDockSite2.Visible := True;
  dxDockPanel2.Visible := True;
end;

procedure TfrmPrincipal.dxBarLargeButton4Click(Sender: TObject);
begin
  CreateForm('TfrmCadastroAcaoMontarAmbiente').ShowModal;
end;

procedure TfrmPrincipal.btnCriarCatalogoDeBasesClick(Sender: TObject);
begin
  CreateForm('TfrmCadastroAcaoCatalogoBases').ShowModal;
end;

procedure TfrmPrincipal.dxDockPanel2Activate(Sender: TdxCustomDockControl; Active: Boolean);
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
  with TWorkspaceList.Create(Application.Configuration) do
  begin
    Sandboxes(iosWorkspaces, Application.Configuration.Workspace.EstruturaTFS);
    Free;
  end;
end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.ppmTrayIconChange(Sender: TObject; Source: TMenuItem; Rebuild: Boolean);
begin
  SalvarWorkspaceAtual;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  if not TUpdate(Sender).HasUpdateAvailable then
    Exit;

  dxAlertWindowManager1.Show(TUpdate(Sender).ApplicationName, Format('Uma nova versão (%s) foi encontrado. Você quer baixar e instalar?', [TUpdate(Sender).ApplicationVersion]))
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
  Action := caFree;
  if iosWorkspaces.Active then
    iosWorkspaces.Close;
  FreeAndNil(FUpdate);
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  SalvarWorkspaceAtual;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  DisableAero := True;
  InicializarWorkspaceList;
  InicializarMainMenu;
  FUpdate := TUpdate.Create(actUpdate);
  FUpdate.OnTimer := Timer1Timer;
  FUpdate.Interval := Trunc(Application.Configuration.Aplicacao.TempoVerificaoAtualizacaoAuto * 60000);

  if Application.Configuration.Aplicacao.VerificarAtualizacaoAuto then
  begin
    FUpdate.Enabled := True;
    FUpdate.OnTimer(FUpdate);
  end;
end;

function ExcluiQuebra(Str: string): string;
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

  Application.PromptCommand.InputToOutput := True;
  Application.PromptCommand.OutputLines := txtConsole.Lines;
  txtConsole.Lines.Delete(Length(txtConsole.Lines.Text) + 1);

  CarregarVersao;
  dxRibbonStatusBar1.Panels[0].Text := AnsiLowerCase(dtmDatabase.IBDatabase1.DatabaseName);

  CarregarWorkspaceRecentes
end;

procedure TfrmPrincipal.CarregarWorkspaceRecentes;
var
  recentes: TWorkspacesRecentes;
  I: Integer;
  workspace: IWorkspace;
  X: Integer;
begin
  recentes := TWorkspacesRecentes.Create;
  try
    for I := 0 to recentes.Count - 1 do
    begin
      for X := 0 to iosWorkspaces.ObjectCount - 1 do
      begin
        if TWorkspace(iosWorkspaces.Objects[X]).Descricao.Equals(recentes.Names[I]) then
          AbriAbaWorkspace(TWorkspace(iosWorkspaces.Objects[X]));
      end;
    end;

    for I := 0 to dxTabbedMDIManager1.TabProperties.PageCount - 1 do
    begin
      workspace := ToWorkspace(dxTabbedMDIManager1.TabProperties.Pages[I]);
      if recentes.Values[workspace.Sandbox.Descricao].Equals('True') then
      begin
        dxTabbedMDIManager1.TabProperties.PageIndex := dxTabbedMDIManager1.TabProperties.Pages[I].Index;
        Break;
      end;
    end;

  finally
    FreeAndNil(recentes);
  end;
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

procedure TfrmPrincipal.SalvarWorkspaceAtual;
var
  recentes: TWorkspacesRecentes;
  I: Integer;
begin
  if dxTabbedMDIManager1.TabProperties.PageCount = 0 then
  begin
    Exit;
  end;

  recentes := TWorkspacesRecentes.Create;
  try
    recentes.Clear;
    for I := 0 to dxTabbedMDIManager1.TabProperties.PageCount - 1 do
    begin
      if dxTabbedMDIManager1.TabProperties.ActivePage.Index = I then
      begin
        recentes.Add(Format('%s=%s', [ToWorkspace(dxTabbedMDIManager1.TabProperties.Pages[I]).Sandbox.Descricao, 'True']));
      end
      else
      begin
        recentes.Add(Format('%s=%s', [ToWorkspace(dxTabbedMDIManager1.TabProperties.Pages[I]).Sandbox.Descricao, 'False']));
      end;
    end;
    recentes.Salvar;
  finally
    FreeAndNil(recentes);
  end;
end;

end.

