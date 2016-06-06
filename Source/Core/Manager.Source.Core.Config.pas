unit Manager.Source.Core.Config;

interface

uses Classes, SysUtils, JvAppRegistryStorage, Manager.Source.Core.IDE.Consts,
  Manager.Source.Consts;

type
  TManagerConfig = class;

  TManagerConfigItem = class(TObject)
  protected
    FOwner: TManagerConfig;
  public
    constructor Create(AOwner: TManagerConfig);
  end;

  TManagerConfigWorkspace = class(TManagerConfigItem)
  private
    function GetEstruturaTFS: boolean;
    procedure SetEstruturaTFS(const Value: boolean);
    function GetJazzOnly: boolean;
    procedure SetJazzOnly(const Value: boolean);
  public
    property JazzOnly: boolean read GetJazzOnly write SetJazzOnly;
    property EstruturaTFS: boolean read GetEstruturaTFS write SetEstruturaTFS;
  end;

  TManagerConfigSandbox = class(TManagerConfigItem)
  private
    function GetArquivosIni: string;
    procedure SetArquivosIni(const Value: string);
  public
    property ArquivosIni: string read GetArquivosIni write SetArquivosIni;
  end;

  TManagerConfigAplicacao = class(TManagerConfigItem)
  private
    function GetVerificarAtualizacaoAuto: boolean;
    procedure SetVerificarAtualizacaoAuto(const Value: boolean);
    function GetTempoVerificaoAtualizacaoAuto: integer;
    procedure SetTempoVerificaoAtualizacaoAuto(const Value: integer);
  public
    property VerificarAtualizacaoAuto: boolean read GetVerificarAtualizacaoAuto write SetVerificarAtualizacaoAuto;
    property TempoVerificaoAtualizacaoAuto: integer read GetTempoVerificaoAtualizacaoAuto write SetTempoVerificaoAtualizacaoAuto;
  end;

  TManagerConfig = class(TJvAppRegistryStorage)
  private
    FSandbox: TManagerConfigSandbox;
    FAplicacao: TManagerConfigAplicacao;
    FWorkspace: TManagerConfigWorkspace;
    function GetDiretorio: string;
    procedure SetDiretorio(const Value: string);
    function GetDatabaseName: string;
    procedure SetDatabaseName(const Value: string);
    function GetSpSQL: string;
    procedure SetSpSQL(const Value: string);
    function GetPrimeiraExecucao: boolean;
    procedure SetPrimeiraExecucao(const Value: boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Diretorio: string read GetDiretorio write SetDiretorio;
    property DatabaseName: string read GetDatabaseName write SetDatabaseName;
    property SpSQL: string read GetSpSQL write SetSpSQL;
    property PrimeiraExecucao: boolean read GetPrimeiraExecucao write SetPrimeiraExecucao;
    property Workspace: TManagerConfigWorkspace read FWorkspace;
    property Sandbox: TManagerConfigSandbox read FSandbox;
    property App: TManagerConfigAplicacao read FAplicacao;
  end;

implementation

{ TWorkspaceConfig }

constructor TManagerConfig.Create(AOwner: TComponent);
begin
  inherited;
  Root := WIN_KEY;
  FWorkspace := TManagerConfigWorkspace.Create(Self);
  FSandbox := TManagerConfigSandbox.Create(Self);
  FAplicacao := TManagerConfigAplicacao.Create(Self);
end;

destructor TManagerConfig.Destroy;
begin
  FreeAndNil(FAplicacao);
  FreeAndNil(FSandbox);
  FreeAndNil(FWorkspace);
  inherited;
end;

function TManagerConfig.GetDatabaseName: string;
begin
  Exit(ReadString('Database\DatabaseName', String.Empty));
end;

function TManagerConfig.GetDiretorio: string;
begin
  Exit(IncludeTrailingBackslash(ReadString('SCM\Workspace', String.Empty)));
end;

function TManagerConfig.GetPrimeiraExecucao: boolean;
begin
  Exit(ReadInteger('Utils\PrimeiraExecucao', True.ToInteger).ToBoolean());
end;

function TManagerConfig.GetSpSQL: string;
begin
  Exit(ReadString('Utils\spSQL', String.Empty));
end;

procedure TManagerConfig.SetDatabaseName(const Value: string);
begin
  WriteString('Database\DatabaseName', Value);
end;

procedure TManagerConfig.SetDiretorio(const Value: string);
begin
  WriteString('SCM\Workspace', Value);
end;

procedure TManagerConfig.SetPrimeiraExecucao(const Value: boolean);
begin
  WriteInteger('Utils\PrimeiraExecucao', Value.ToInteger);
end;

procedure TManagerConfig.SetSpSQL(const Value: string);
begin
  WriteString('Utils\spSQL', Value);
end;

{ TWorkspaceConfigSandbox }

function TManagerConfigSandbox.GetArquivosIni: string;
begin
  Exit(FOwner.ReadString('Sandbox\ArquivosIni', String.Empty));
end;

procedure TManagerConfigSandbox.SetArquivosIni(const Value: string);
begin
  FOwner.WriteString('Sandbox\ArquivosIni', Value);
end;

{ TWorkspaceConfigItem }

constructor TManagerConfigItem.Create(AOwner: TManagerConfig);
begin
  FOwner := AOwner;
end;

{ TWorkspaceConfigAplicacao }

function TManagerConfigAplicacao.GetTempoVerificaoAtualizacaoAuto: integer;
begin
  Exit(FOwner.ReadInteger('Utils\TempoVerificaoAtualizacaoAuto', 60));
end;

function TManagerConfigAplicacao.GetVerificarAtualizacaoAuto: boolean;
begin
  Exit(FOwner.ReadInteger('Utils\VerificarAtualizacaoAuto', True.ToInteger).ToBoolean());
end;

procedure TManagerConfigAplicacao.SetTempoVerificaoAtualizacaoAuto(
  const Value: integer);
begin
  FOwner.WriteInteger('Utils\TempoVerificaoAtualizacaoAuto', Value);
end;

procedure TManagerConfigAplicacao.SetVerificarAtualizacaoAuto(
  const Value: boolean);
begin
  FOwner.WriteInteger('Utils\VerificarAtualizacaoAuto', Value.ToInteger);
end;

{ TWorkspaceConfigWorkspace }

function TManagerConfigWorkspace.GetEstruturaTFS: boolean;
begin
  Exit(FOwner.ReadInteger('Workspace\EstruturaTFS', False.ToInteger).ToBoolean());
end;

function TManagerConfigWorkspace.GetJazzOnly: boolean;
begin
  Exit(FOwner.ReadInteger('Workspace\JazzOnly', False.ToInteger).ToBoolean());
end;

procedure TManagerConfigWorkspace.SetEstruturaTFS(const Value: boolean);
begin
  FOwner.WriteInteger('Workspace\EstruturaTFS', Value.ToInteger);
end;

procedure TManagerConfigWorkspace.SetJazzOnly(const Value: boolean);
begin
  FOwner.WriteInteger('Workspace\JazzOnly', Value.ToInteger);
end;

end.
