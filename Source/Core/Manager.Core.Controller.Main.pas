unit Manager.Core.Controller.Main;

interface

uses Forms, Classes, SysUtils, Manager.Core.MainMenu, Manager.Core.IDE,
  Manager.Core.Workspace.List, Manager.Core.Configuration,
  InstantPresentation, Vcl.ActnList, dxBar, Workspace, dxTabbedMDI,
  Manager.Core.API.Workspace, Manager.Core.Workspace.Recentes,
  Manager.Core.API.Observer;

type
  TControllerMain = class(TInterfacedObject, IObserver)
  private
    FMainMenu: TManagerMainMenu;
    FConfiguration: TConfiguration;
    FWorkspaceList: TWorkspaceList;
    FWorkspacesRecentes: TWorkspacesRecentes;
    procedure Update(Sender: TObject);
  public
    constructor Create;
    destructor Destroy; override;
    procedure PrepararMainMenu;
    procedure PrepararWorkspaceList(AInstantSelector: TInstantSelector);
    procedure AbriAbaWorkspace(AWorkspace: TObject);
    procedure SalvarWorkspaceAtual;
  end;

implementation

uses Manager.Core.Forms.Utils;

type
  TTelaAction = class(TAction)
  private
    FClassNameForm: string;
  published
    property ClassNameForm: string read FClassNameForm write FClassNameForm;
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

  for I := 0 to Application.Main.MDIManager.TabProperties.PageCount - 1 do
  begin
    Application.Main.MDIManager.TabProperties.Pages[I].MDIChild.GetInterface(IWorkspace, workspace);
    if Assigned(workspace) and (workspace.Sandbox = AWorkspace) then
    begin
      Application.Main.MDIManager.TabProperties.PageIndex := I;
      Exit;
    end;
  end;
  tela := CreateFormWithSubject('TfrmWorkspace2', TObject(AWorkspace));
  Application.Register(tela as IObserver);
  tela.Show;
end;

constructor TControllerMain.Create;
begin
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
  tabProperties := Application.Main.MDIManager.TabProperties;
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

end.
