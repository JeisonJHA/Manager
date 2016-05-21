unit Manager.Core.Forms.Main.Controller;

interface

uses Forms, Classes, SysUtils, Manager.Core.Ribbon.MainMenu, Manager.Core.IDE,
  Manager.Core.Workspace.List, Manager.Core.Configuration,
  InstantPresentation, Vcl.ActnList, dxBar, Workspace, dxTabbedMDI,
  Manager.Core.API.Workspace, Manager.Core.Workspace.Recentes, DateUtils,
  Manager.Core.API.Observer, Manager.Core.IDE.Constants, Graphics,
  Manager.Core.IDE.Update, Manager.Core.TrayIconMenu, Manager.Core.Utils;

type
  TControllerMain = class(TInterfacedObject, IObserver)
  private
    FForm: TForm;
    FMainMenu: TManagerMainMenu;
    FTrayIconMenu: TTrayIconMenu;
    FConfiguration: TConfiguration;
    FWorkspaceList: TWorkspaceList;
    FWorkspacesRecentes: TWorkspacesRecentes;
    FUpdate: TUpdate;
    procedure Update(Sender: TObject; ATipoAcao: TTipoAcao);
    procedure OnUpdateTimer(Sender: TObject);
    procedure PrepararMainMenu;
    procedure PrepararIDEUpdate;
    procedure PrepararWorkspaceList(AInstantSelector: TInstantSelector);
    procedure CarregarVersao;
    procedure CarregarWorkspaceRecentes;
    function PodeVerificarAtualizacao: boolean;
  public
    constructor Create(AForm: TForm);
    destructor Destroy; override;
    procedure AbriAbaWorkspace(AWorkspace: TObject);
    procedure SalvarWorkspaceAtual;
    procedure ExecutarAtulizacao;

    procedure OnShow(Sender: TObject);
    procedure OnCreate(Sender: TObject);
    procedure OnDestroy(Sender: TObject);
    procedure OnFormClose(Sender: TObject; var Action: TCloseAction);
  end;

implementation

uses Manager.Core.Forms.Utils, Manager.Core.Forms.Main, udtmDatabase;

type
  TTelaAction = class(TAction)
  private
    FClassNameForm: string;
  published
    property ClassNameForm: string read FClassNameForm write FClassNameForm;
  end;

  function ToMainForm(AForm: TForm): TfrmMain;
  begin
    Exit(TfrmMain(AForm));
  end;

{ TControllerMain }

procedure TControllerMain.AbriAbaWorkspace(AWorkspace: TObject);
var
  I: Integer;
  workspace: IWorkspace;
  tela: TForm;
begin
  if not Assigned(AWorkspace) then
    Exit;

  for I := 0 to ToMainForm(FForm).mdiControleTelas.TabProperties.PageCount - 1 do
  begin
    ToMainForm(FForm).mdiControleTelas.TabProperties.Pages[I].MDIChild.GetInterface(IWorkspace, workspace);
    if Assigned(workspace) and (workspace.Sandbox = AWorkspace) then
    begin
      ToMainForm(FForm).mdiControleTelas.TabProperties.PageIndex := I;
      Exit;
    end;
  end;
  tela := CreateFormWithSubject('TfrmWorkspace2', TObject(AWorkspace));
  Application.Register(tela as IObserver);
  tela.Show;
end;

constructor TControllerMain.Create(AForm: TForm);
begin
  FForm := AForm;
  FMainMenu := TManagerMainMenu.Create;
  FTrayIconMenu := TTrayIconMenu.Create;
  FConfiguration := TConfiguration.Create(nil);
  FWorkspaceList := TWorkspaceList.Create(FConfiguration);
  FWorkspacesRecentes := TWorkspacesRecentes.Create;
  FUpdate := TUpdate.Create(ToMainForm(FForm).actUpdate);
end;

destructor TControllerMain.Destroy;
begin
  FreeAndNil(FWorkspacesRecentes);
  FreeAndNil(FWorkspaceList);
  FreeAndNil(FConfiguration);
  FreeAndNil(FTrayIconMenu);
  FreeAndNil(FMainMenu);
  inherited;
end;

procedure TControllerMain.ExecutarAtulizacao;
begin
  FUpdate.Executar;
end;

function TControllerMain.PodeVerificarAtualizacao: boolean;
var
  pode: boolean;
begin
  pode := IncMinute(Application.UltimaVerificacaoAtualizacao, FConfiguration.Aplicacao.TempoVerificaoAtualizacaoAuto) < (Date + Time);
  if pode then
    Application.UltimaVerificacaoAtualizacao := (Date + Time);

  Exit(pode);
end;

procedure TControllerMain.PrepararIDEUpdate;
const
  intMSec = 60 * 1000; // o equivalente a 1 milisegundo
begin
  FUpdate.OnTimer := OnUpdateTimer;
  FUpdate.Interval := Trunc(FConfiguration.Aplicacao.TempoVerificaoAtualizacaoAuto * intMSec);

  FUpdate.Enabled := FConfiguration.Aplicacao.VerificarAtualizacaoAuto;
  if FUpdate.Enabled and PodeVerificarAtualizacao then
  begin
    FUpdate.OnTimer(FUpdate);
  end;
end;

procedure TControllerMain.PrepararMainMenu;
begin
  FMainMenu.Load;
  FTrayIconMenu.Load;
end;

procedure TControllerMain.PrepararWorkspaceList(AInstantSelector: TInstantSelector);
begin
  FWorkspaceList.Sandboxes(AInstantSelector, FConfiguration.Workspace.EstruturaTFS);
end;

function ToWorkspace(APage: TdxTabbedMDIPage): IWorkspace;
begin
  Exit(APage.MDIChild as IWorkspace);
end;

procedure TControllerMain.SalvarWorkspaceAtual;
var
  I: Integer;
  tabProperties: TdxTabbedMDITabProperties;
begin
  tabProperties := ToMainForm(FForm).mdiControleTelas.TabProperties;
  if tabProperties.PageCount = 0 then
  begin
    Exit;
  end;

  FWorkspacesRecentes.Clear;
  for I := 0 to tabProperties.PageCount - 1 do
  begin
    if tabProperties.ActivePage.Index = I then
    begin
      FWorkspacesRecentes.Add(Format('%s=%s', [ToWorkspace(tabProperties.Pages[I]).Sandbox.Descricao, 'True']));
    end
    else
    begin
      FWorkspacesRecentes.Add(Format('%s=%s', [ToWorkspace(tabProperties.Pages[I]).Sandbox.Descricao, 'False']));
    end;
  end;
  FWorkspacesRecentes.Salvar;
end;

procedure TControllerMain.Update(Sender: TObject; ATipoAcao: TTipoAcao);
begin
  if (ATipoAcao in [taExecutar, taCopiar, taExcluir]) then
    Exit;

  PrepararIDEUpdate;
  PrepararMainMenu;
end;

procedure TControllerMain.OnCreate(Sender: TObject);
begin
  Application.RegisterUniqueInstance(APP_GUID);
end;

procedure TControllerMain.OnDestroy(Sender: TObject);
begin
  Application.UnregisterUniqueInstance;
end;

procedure TControllerMain.OnFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  if ToMainForm(FForm).iosWorkspaces.Active then
    ToMainForm(FForm).iosWorkspaces.Close;
  SalvarWorkspaceAtual;
end;

procedure TControllerMain.OnShow(Sender: TObject);
begin
  PrepararIDEUpdate;
  PrepararMainMenu;
  if not ToMainForm(FForm).iosWorkspaces.Active then
    PrepararWorkspaceList(ToMainForm(FForm).iosWorkspaces);

  CarregarVersao;
  ToMainForm(FForm).dxRibbonStatusBar1.Panels[0].Text := AnsiLowerCase(dtmDatabase.IBDatabase1.DatabaseName);
  CarregarWorkspaceRecentes;
end;

procedure TControllerMain.OnUpdateTimer(Sender: TObject);
begin
  if not TUpdate(Sender).HasUpdateAvailable then
    Exit;

  ToMainForm(FForm).alMessageAlert.Show(TUpdate(Sender).ApplicationName, Format('Uma nova versão (%s) foi encontrado. Você quer baixar e instalar?', [TUpdate(Sender).ApplicationVersion]))
end;

procedure TControllerMain.CarregarVersao;
begin
  try
    ToMainForm(FForm).dxRibbonStatusBar1.Panels[1].Text := 'Versão: ' + Manager.Core.Utils.PegarVersaoAplicacao + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32);
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TControllerMain.CarregarWorkspaceRecentes;
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
      for X := 0 to ToMainForm(FForm).iosWorkspaces.ObjectCount - 1 do
      begin
        if TWorkspace(ToMainForm(FForm).iosWorkspaces.Objects[X]).Descricao.Equals(recentes.Names[I]) then
          AbriAbaWorkspace(TWorkspace(ToMainForm(FForm).iosWorkspaces.Objects[X]));
      end;
    end;

    for I := 0 to ToMainForm(FForm).mdiControleTelas.TabProperties.PageCount - 1 do
    begin
      workspace := ToWorkspace(ToMainForm(FForm).mdiControleTelas.TabProperties.Pages[I]);
      if recentes.Values[workspace.Sandbox.Descricao].Equals('True') then
      begin
        ToMainForm(FForm).mdiControleTelas.TabProperties.PageIndex := ToMainForm(FForm).mdiControleTelas.TabProperties.Pages[I].Index;
        Break;
      end;
    end;

  finally
    FreeAndNil(recentes);
  end;
end;

end.
