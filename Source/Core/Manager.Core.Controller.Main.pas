unit Manager.Core.Controller.Main;

interface

uses Forms, Classes, SysUtils, Manager.Core.MainMenu, Manager.Core.IDE,
  Manager.Core.Workspace.List, Manager.Core.Configuration,
  InstantPresentation, Vcl.ActnList, dxBar, Workspace, dxTabbedMDI,
  Manager.Core.API.Workspace;

type
  TControllerMain = class(TObject)
  private
    FMainMenu: TManagerMainMenu;
    FConfiguration: TConfiguration;
    FWorkspaceList: TWorkspaceList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure PrepararMainMenu;
    procedure PrepararWorkspaceList(AInstantSelector: TInstantSelector);
    procedure AbriAbaWorkspace(AWorkspace: TObject);
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

  CreateFormWithSubject('TfrmWorkspace2', TObject(AWorkspace)).Show;
end;

constructor TControllerMain.Create;
begin
  FMainMenu := TManagerMainMenu.Create;
  FConfiguration := TConfiguration.Create(nil);
  FWorkspaceList := TWorkspaceList.Create(FConfiguration);
end;

destructor TControllerMain.Destroy;
begin
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

end.
