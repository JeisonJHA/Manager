unit Manager.Core.Forms.Main.Controller;

interface

uses Forms, Classes, SysUtils, Manager.Core.MainMenu, Manager.Core.IDE,
  Manager.Core.Workspace.List, Manager.Core.Configuration,
  InstantPresentation, Vcl.ActnList, dxBar, Workspace, dxTabbedMDI,
  Manager.Core.API.Workspace, Manager.Core.Workspace.Recentes,
  Manager.Core.API.Observer, Manager.Core.IDE.Constants,
  Manager.Core.IDE.Update, Manager.Core.TrayIconMenu;

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
    procedure Update(Sender: TObject);
    procedure OnUpdateTimer(Sender: TObject);
    procedure PrepararMainMenu;
    procedure PrepararIDEUpdate;
    procedure PrepararWorkspaceList(AInstantSelector: TInstantSelector);
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

uses Manager.Core.Forms.Utils, Manager.Core.Forms.Main;

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

procedure TControllerMain.PrepararIDEUpdate;
const
  intMSec = 60 * 1000; // o equivalente a 1 milisegundo
begin
  FUpdate.OnTimer := OnUpdateTimer;
  FUpdate.Interval := Trunc(FConfiguration.Aplicacao.TempoVerificaoAtualizacaoAuto * intMSec);

  FUpdate.Enabled := FConfiguration.Aplicacao.VerificarAtualizacaoAuto;
  if FUpdate.Enabled then
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

procedure TControllerMain.Update(Sender: TObject);
begin
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
end;

procedure TControllerMain.OnShow(Sender: TObject);
begin
  PrepararIDEUpdate;
  PrepararMainMenu;
  if not ToMainForm(FForm).iosWorkspaces.Active then
    PrepararWorkspaceList(ToMainForm(FForm).iosWorkspaces);
end;

procedure TControllerMain.OnUpdateTimer(Sender: TObject);
begin
  if not TUpdate(Sender).HasUpdateAvailable then
    Exit;

  ToMainForm(FForm).alMessageAlert.Show(TUpdate(Sender).ApplicationName, Format('Uma nova versão (%s) foi encontrado. Você quer baixar e instalar?', [TUpdate(Sender).ApplicationVersion]))
end;

end.
