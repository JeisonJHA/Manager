unit Manager.Core.Controller.Main;

interface

uses Forms, Classes, SysUtils, Manager.Core.MainMenu, Manager.Core.IDE,
  Manager.Core.Workspace.List, Manager.Core.Configuration,
  InstantPresentation, Vcl.ActnList, dxBar;

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
