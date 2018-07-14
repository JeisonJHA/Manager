unit Manager.Core.Configuration;

interface

uses Classes, SysUtils, JvAppRegistryStorage, Workspace.Constantes;

type
  TConfiguration = class;

  TConfigurationItem = class(TObject)
  protected
    FOwner: TConfiguration;
  public
    constructor Create(AOwner: TConfiguration);
  end;

  TConfigurationWorkspace = class(TConfigurationItem)
  private
    function GetEstruturaTFS: boolean;
    procedure SetEstruturaTFS(const Value: boolean);
    function GetJazzOnly: boolean;
    procedure SetJazzOnly(const Value: boolean);
    function GetEstruturaRTC: boolean;
    procedure SetEstruturaRTC(const Value: boolean);
  public
    property JazzOnly: boolean read GetJazzOnly write SetJazzOnly;
    property EstruturaTFS: boolean read GetEstruturaTFS write SetEstruturaTFS;
    property EstruturaRTC: boolean read GetEstruturaRTC write SetEstruturaRTC;
  end;

  TConfigurationSandbox = class(TConfigurationItem)
  private
    function GetArquivosIni: string;
    procedure SetArquivosIni(const Value: string);
  public
    property ArquivosIni: string read GetArquivosIni write SetArquivosIni;
  end;

  TConfigurationAplicacao = class(TConfigurationItem)
  private
    function GetVerificarAtualizacaoAuto: boolean;
    procedure SetVerificarAtualizacaoAuto(const Value: boolean);
    function GetTempoVerificaoAtualizacaoAuto: integer;
    procedure SetTempoVerificaoAtualizacaoAuto(const Value: integer);
  public
    property VerificarAtualizacaoAuto: boolean read GetVerificarAtualizacaoAuto write SetVerificarAtualizacaoAuto;
    property TempoVerificaoAtualizacaoAuto: integer read GetTempoVerificaoAtualizacaoAuto write SetTempoVerificaoAtualizacaoAuto;
  end;

  TConfiguration = class(TJvAppRegistryStorage)
  private
    FSandbox: TConfigurationSandbox;
    FAplicacao: TConfigurationAplicacao;
    FWorkspace: TConfigurationWorkspace;
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
    property Workspace: TConfigurationWorkspace read FWorkspace;
    property Sandbox: TConfigurationSandbox read FSandbox;
    property Aplicacao: TConfigurationAplicacao read FAplicacao;
  end;

implementation

{ TWorkspaceConfig }

constructor TConfiguration.Create(AOwner: TComponent);
begin
  inherited;
  Root := WIN_KEY;
  FWorkspace := TConfigurationWorkspace.Create(Self);
  FSandbox := TConfigurationSandbox.Create(Self);
  FAplicacao := TConfigurationAplicacao.Create(Self);
end;

destructor TConfiguration.Destroy;
begin
  FreeAndNil(FAplicacao);
  FreeAndNil(FSandbox);
  FreeAndNil(FWorkspace);
  inherited;
end;

function TConfiguration.GetDatabaseName: string;
begin
  Exit(ReadString('Database\DatabaseName', String.Empty));
end;

function TConfiguration.GetDiretorio: string;
begin
  Exit(IncludeTrailingBackslash(ReadString('SCM\Workspace', String.Empty)));
end;

function TConfiguration.GetPrimeiraExecucao: boolean;
begin
  Exit(ReadInteger('Utils\PrimeiraExecucao', True.ToInteger).ToBoolean());
end;

function TConfiguration.GetSpSQL: string;
begin
  Exit(ReadString('Utils\spSQL', String.Empty));
end;

procedure TConfiguration.SetDatabaseName(const Value: string);
begin
  WriteString('Database\DatabaseName', Value);
end;

procedure TConfiguration.SetDiretorio(const Value: string);
begin
  WriteString('SCM\Workspace', Value);
end;

procedure TConfiguration.SetPrimeiraExecucao(const Value: boolean);
begin
  WriteInteger('Utils\PrimeiraExecucao', Value.ToInteger);
end;

procedure TConfiguration.SetSpSQL(const Value: string);
begin
  WriteString('Utils\spSQL', Value);
end;

{ TWorkspaceConfigSandbox }

function TConfigurationSandbox.GetArquivosIni: string;
begin
  Exit(FOwner.ReadString('Sandbox\ArquivosIni', String.Empty));
end;

procedure TConfigurationSandbox.SetArquivosIni(const Value: string);
begin
  FOwner.WriteString('Sandbox\ArquivosIni', Value);
end;

{ TWorkspaceConfigItem }

constructor TConfigurationItem.Create(AOwner: TConfiguration);
begin
  FOwner := AOwner;
end;

{ TWorkspaceConfigAplicacao }

function TConfigurationAplicacao.GetTempoVerificaoAtualizacaoAuto: integer;
begin
  Exit(FOwner.ReadInteger('Utils\TempoVerificaoAtualizacaoAuto', 60));
end;

function TConfigurationAplicacao.GetVerificarAtualizacaoAuto: boolean;
begin
  Exit(FOwner.ReadInteger('Utils\VerificarAtualizacaoAuto', True.ToInteger).ToBoolean());
end;

procedure TConfigurationAplicacao.SetTempoVerificaoAtualizacaoAuto(
  const Value: integer);
begin
  FOwner.WriteInteger('Utils\TempoVerificaoAtualizacaoAuto', Value);
end;

procedure TConfigurationAplicacao.SetVerificarAtualizacaoAuto(
  const Value: boolean);
begin
  FOwner.WriteInteger('Utils\VerificarAtualizacaoAuto', Value.ToInteger);
end;

{ TWorkspaceConfigWorkspace }

function TConfigurationWorkspace.GetEstruturaRTC: boolean;
begin
  Exit(FOwner.ReadInteger('Workspace\EstruturaRTC', False.ToInteger).ToBoolean());
end;

function TConfigurationWorkspace.GetEstruturaTFS: boolean;
begin
  Exit(FOwner.ReadInteger('Workspace\EstruturaTFS', False.ToInteger).ToBoolean());
end;

function TConfigurationWorkspace.GetJazzOnly: boolean;
begin
  Exit(FOwner.ReadInteger('Workspace\JazzOnly', False.ToInteger).ToBoolean());
end;

procedure TConfigurationWorkspace.SetEstruturaRTC(const Value: boolean);
begin
  FOwner.WriteInteger('Workspace\EstruturaRTC', Value.ToInteger);
end;

procedure TConfigurationWorkspace.SetEstruturaTFS(const Value: boolean);
begin
  FOwner.WriteInteger('Workspace\EstruturaTFS', Value.ToInteger);
end;

procedure TConfigurationWorkspace.SetJazzOnly(const Value: boolean);
begin
  FOwner.WriteInteger('Workspace\JazzOnly', Value.ToInteger);
end;

end.
