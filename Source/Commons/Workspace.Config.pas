unit Workspace.Config;

interface

uses Classes, SysUtils, JvAppRegistryStorage, Workspace.Constantes;

type
  TWorkspaceConfig = class;

  TWorkspaceConfigSandbox = class(TObject)
  private
    FOwner: TWorkspaceConfig;
    function GetArquivosIni: string;
    procedure SetArquivosIni(const Value: string);
  public
    constructor Create(AOwner: TWorkspaceConfig);
    property ArquivosIni: string read GetArquivosIni write SetArquivosIni;
  end;

  TWorkspaceConfig = class(TJvAppRegistryStorage)
  private
    FSandbox: TWorkspaceConfigSandbox;
    function GetDiretorio: string;
    procedure SetDiretorio(const Value: string);
    function GetDatabaseName: string;
    procedure SetDatabaseName(const Value: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Diretorio: string read GetDiretorio write SetDiretorio;
    property DatabaseName: string read GetDatabaseName write SetDatabaseName;
    property Sandbox: TWorkspaceConfigSandbox read FSandbox;
  end;

implementation

{ TWorkspaceConfig }

constructor TWorkspaceConfig.Create(AOwner: TComponent);
begin
  inherited;
  Root := WIN_KEY;
  FSandbox := TWorkspaceConfigSandbox.Create(Self);
end;

destructor TWorkspaceConfig.Destroy;
begin
  FreeAndNil(FSandbox);
  inherited;
end;

function TWorkspaceConfig.GetDatabaseName: string;
begin
  Exit(ReadString('Database\DatabaseName', String.Empty));
end;

function TWorkspaceConfig.GetDiretorio: string;
begin
  Exit(IncludeTrailingBackslash(ReadString('SCM\Workspace', String.Empty)));
end;

procedure TWorkspaceConfig.SetDatabaseName(const Value: string);
begin
  WriteString('Database\DatabaseName', Value);
end;

procedure TWorkspaceConfig.SetDiretorio(const Value: string);
begin
  WriteString('SCM\Workspace', Value);
end;

{ TWorkspaceConfigSandbox }

constructor TWorkspaceConfigSandbox.Create(AOwner: TWorkspaceConfig);
begin
  FOwner := AOwner;
end;

function TWorkspaceConfigSandbox.GetArquivosIni: string;
begin
  Exit(FOwner.ReadString('Sandbox\ArquivosIni', String.Empty));
end;

procedure TWorkspaceConfigSandbox.SetArquivosIni(const Value: string);
begin
  FOwner.WriteString('Sandbox\ArquivosIni', Value);
end;

end.
