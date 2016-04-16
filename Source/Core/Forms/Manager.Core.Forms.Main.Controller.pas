unit Manager.Core.Forms.Main.Controller;

interface

uses Forms, Classes, SysUtils, Manager.Core.MainMenu, Manager.Core.IDE,
  Manager.Core.Workspace.List, Manager.Core.Configuration,
  InstantPresentation, Vcl.ActnList, dxBar, Workspace, dxTabbedMDI,
  Manager.Core.API.Workspace, Manager.Core.Workspace.Recentes,
  Manager.Core.API.Observer;

type
  TControllerMain = class(TInterfacedObject, IObserver)
  private
    FForm: TForm;
    FMainMenu: TManagerMainMenu;
    FConfiguration: TConfiguration;
    FWorkspaceList: TWorkspaceList;
    FWorkspacesRecentes: TWorkspacesRecentes;
    procedure Update(Sender: TObject);
    procedure OnTrayIconClick(Sender: TObject);
  public
    constructor Create(AForm: TForm);
    destructor Destroy; override;
    procedure PrepararMainMenu;
    procedure PrepararWorkspaceList(AInstantSelector: TInstantSelector);
    procedure AbriAbaWorkspace(AWorkspace: TObject);
    procedure SalvarWorkspaceAtual;

    procedure OnShow(Sender: TObject);
    procedure OnCreate(Sender: TObject);
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
  FConfiguration := TConfiguration.Create(nil);
  FWorkspaceList := TWorkspaceList.Create(FConfiguration);
  FWorkspacesRecentes := TWorkspacesRecentes.Create;
end;

destructor TControllerMain.Destroy;
begin
  FreeAndNil(FWorkspacesRecentes);
  FreeAndNil(FWorkspaceList);
  FreeAndNil(FConfiguration);
  FreeAndNil(FMainMenu);
  inherited;
end;

procedure TControllerMain.PrepararMainMenu;
begin
  FMainMenu.Load;
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
  PrepararMainMenu;
end;

procedure TControllerMain.OnCreate(Sender: TObject);
begin

end;

procedure TControllerMain.OnShow(Sender: TObject);
begin
  PrepararMainMenu;
  PrepararWorkspaceList(ToMainForm(FForm).iosWorkspaces);
  ToMainForm(FForm).tiPrincipal.OnClick := OnTrayIconClick;
end;

procedure TControllerMain.OnTrayIconClick(Sender: TObject);
begin
  ToMainForm(FForm).tiPrincipal.Visible := False;
  ToMainForm(FForm).Show();
  ToMainForm(FForm).WindowState := wsMaximized;
  Application.BringToFront();
end;

end.
