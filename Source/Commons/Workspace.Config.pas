unit Workspace.Config;

interface

uses Classes, SysUtils, JvAppRegistryStorage, Workspace.Constantes;

type
  TWorkspaceConfig = class;

  TWorkspaceConfigItem = class(TObject)
  protected
    FOwner: TWorkspaceConfig;
  public
    constructor Create(AOwner: TWorkspaceConfig);
  end;

  TWorkspaceConfigSandbox = class(TWorkspaceConfigItem)
  private
    function GetArquivosIni: string;
    procedure SetArquivosIni(const Value: string);
  public
    property ArquivosIni: string read GetArquivosIni write SetArquivosIni;
  end;

  TWorkspaceConfigAplicacao = class(TWorkspaceConfigItem)
  private
    function GetVerificarAtualizacaoAuto: boolean;
    procedure SetVerificarAtualizacaoAuto(const Value: boolean);
    function GetTempoVerificaoAtualizacaoAuto: integer;
    procedure SetTempoVerificaoAtualizacaoAuto(const Value: integer);
  public
    property VerificarAtualizacaoAuto: boolean read GetVerificarAtualizacaoAuto write SetVerificarAtualizacaoAuto;
    property TempoVerificaoAtualizacaoAuto: integer read GetTempoVerificaoAtualizacaoAuto write SetTempoVerificaoAtualizacaoAuto;
  end;

  TWorkspaceConfig = class(TJvAppRegistryStorage)
  private
    FSandbox: TWorkspaceConfigSandbox;
    FAplicacao: TWorkspaceConfigAplicacao;
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
    property Sandbox: TWorkspaceConfigSandbox read FSandbox;
    property Aplicacao: TWorkspaceConfigAplicacao read FAplicacao;
  end;

implementation

{ TWorkspaceConfig }

constructor TWorkspaceConfig.Create(AOwner: TComponent);
begin
  inherited;
  Root := WIN_KEY;
  FSandbox := TWorkspaceConfigSandbox.Create(Self);
  FAplicacao := TWorkspaceConfigAplicacao.Create(Self);
end;

destructor TWorkspaceConfig.Destroy;
begin
  FreeAndNil(FAplicacao);
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

function TWorkspaceConfig.GetPrimeiraExecucao: boolean;
begin
  Exit(ReadInteger('Utils\PrimeiraExecucao', True.ToInteger).ToBoolean());
end;

function TWorkspaceConfig.GetSpSQL: string;
begin
  Exit(ReadString('Utils\spSQL', String.Empty));
end;

procedure TWorkspaceConfig.SetDatabaseName(const Value: string);
begin
  WriteString('Database\DatabaseName', Value);
end;

procedure TWorkspaceConfig.SetDiretorio(const Value: string);
begin
  WriteString('SCM\Workspace', Value);
end;

procedure TWorkspaceConfig.SetPrimeiraExecucao(const Value: boolean);
begin
  WriteInteger('Utils\PrimeiraExecucao', Value.ToInteger);
end;

procedure TWorkspaceConfig.SetSpSQL(const Value: string);
begin
  WriteString('Utils\spSQL', Value);
end;

{ TWorkspaceConfigSandbox }

function TWorkspaceConfigSandbox.GetArquivosIni: string;
begin
  Exit(FOwner.ReadString('Sandbox\ArquivosIni', String.Empty));
end;

procedure TWorkspaceConfigSandbox.SetArquivosIni(const Value: string);
begin
  FOwner.WriteString('Sandbox\ArquivosIni', Value);
end;

{ TWorkspaceConfigItem }

constructor TWorkspaceConfigItem.Create(AOwner: TWorkspaceConfig);
begin
  FOwner := AOwner;
end;

{ TWorkspaceConfigAplicacao }

function TWorkspaceConfigAplicacao.GetTempoVerificaoAtualizacaoAuto: integer;
begin
  Exit(FOwner.ReadInteger('Utils\TempoVerificaoAtualizacaoAuto', 60));
end;

function TWorkspaceConfigAplicacao.GetVerificarAtualizacaoAuto: boolean;
begin
  Exit(FOwner.ReadInteger('Utils\VerificarAtualizacaoAuto', True.ToInteger).ToBoolean());
end;

procedure TWorkspaceConfigAplicacao.SetTempoVerificaoAtualizacaoAuto(
  const Value: integer);
begin
  FOwner.WriteInteger('Utils\TempoVerificaoAtualizacaoAuto', Value);
end;

procedure TWorkspaceConfigAplicacao.SetVerificarAtualizacaoAuto(
  const Value: boolean);
begin
  FOwner.WriteInteger('Utils\VerificarAtualizacaoAuto', Value.ToInteger);
end;

end.
