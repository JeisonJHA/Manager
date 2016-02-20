unit Workspace.Config;

interface

uses Classes, SysUtils, JvAppRegistryStorage, Workspace.Constantes;

type
  TWorkspaceConfig = class(TJvAppRegistryStorage)
  private
    function GetDiretorio: string;
    procedure SetDiretorio(const Value: string);
    function GetDatabaseName: string;
    procedure SetDatabaseName(const Value: string);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Diretorio: string read GetDiretorio write SetDiretorio;
    property DatabaseName: string read GetDatabaseName write SetDatabaseName;
  end;

implementation

{ TWorkspaceConfig }

constructor TWorkspaceConfig.Create(AOwner: TComponent);
begin
  inherited;
  Root := WIN_KEY;
end;

function TWorkspaceConfig.GetDatabaseName: string;
begin
  Exit(ReadString('Database\DatabaseName', ''));
end;

function TWorkspaceConfig.GetDiretorio: string;
begin
  Exit(IncludeTrailingBackslash(ReadString('SCM\Workspace', '')));
end;

procedure TWorkspaceConfig.SetDatabaseName(const Value: string);
begin
  WriteString('Database\DatabaseName', '');
end;

procedure TWorkspaceConfig.SetDiretorio(const Value: string);
begin
  WriteString('SCM\Workspace', '');
end;

end.
