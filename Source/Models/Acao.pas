unit Acao;

interface

uses
  InstantPersistence, InstantTypes, Winapi.ShellApi, Classes, SysUtils,
  Winapi.Windows, Forms, IDE.Aplicacao, IniFiles, Sistema;

type
  TAcao = class;
  TAcaoConfigurarBaseDeDados = class;
  TAcaoConfigurarBaseDeDadosDB2 = class;
  TAcaoConfigurarBaseDeDadosMSSQL = class;
  TAcaoConfigurarBaseDeDadosOracle = class;
  TAcaoCopiar = class;
  TAcaoExecutar = class;
  TAcaoMontarAmbiente = class;

  TAcao = class(TInstantObject)
  {IOMETADATA stored;
    Descricao: String(255);
    Icone: Integer; }
    _Descricao: TInstantString;
    _Icone: TInstantInteger;
  private
    function GetIcone: Integer;
    procedure SetIcone(Value: Integer);
  protected
    function GetDescricao: string; virtual;
    procedure SetDescricao(const Value: string); virtual;
  public
    procedure Executar; virtual;
  published
    property Descricao: string read GetDescricao write SetDescricao;
    property Icone: Integer read GetIcone write SetIcone;
  end;

  TAcaoExecutar = class(TAcao)
  {IOMETADATA stored;
    Parametros: String(255);
    Aplicativo: String(255); }
    _Aplicativo: TInstantString;
    _Parametros: TInstantString;
  private
    function GetAplicativo: string;
    function GetParametros: string;
    procedure SetAplicativo(const Value: string);
    procedure SetParametros(const Value: string);
  public
    procedure Executar; override;
  published
    property Aplicativo: string read GetAplicativo write SetAplicativo;
    property Parametros: string read GetParametros write SetParametros;
  end;

  TAcaoCopiar = class(TAcao)
  {IOMETADATA stored;
    Origem: String(255);
    Destino: String(255); }
    _Destino: TInstantString;
    _Origem: TInstantString;
  private
    path_destino_tmp: string;
    function GetDestino: string;
    function GetOrigem: string;
    procedure SetDestino(const Value: string);
    procedure SetOrigem(const Value: string);
  public
    procedure Executar; override;
  published
    property Destino: string read GetDestino write SetDestino;
    property Origem: string read GetOrigem write SetOrigem;
  end;

  TAcaoMontarAmbiente = class(TAcao)
  {IOMETADATA stored;
    Acoes: References(TAcao) external 'AcaoMontarAmbiente_Acoes'; }
    _Acoes: TInstantReferences;
  private
    function GetAcaoCount: Integer;
    function GetAcoes(Index: Integer): TAcao;
    procedure SetAcoes(Index: Integer; Value: TAcao);
  public
    procedure Executar; override;
    function AddAcao(Acao: TAcao): Integer;
    procedure ClearAcoes;
    procedure DeleteAcao(Index: Integer);
    function IndexOfAcao(Acao: TAcao): Integer;
    procedure InsertAcao(Index: Integer; Acao: TAcao);
    function RemoveAcao(Acao: TAcao): Integer;
    property AcaoCount: Integer read GetAcaoCount;
    property Acoes[Index: Integer]: TAcao read GetAcoes write SetAcoes;
  end;

  TAcaoConfigurarBaseDeDados = class(TAcaoCopiar)
  {IOMETADATA stored;
    Sistema: Reference(TSistema);
    Alias: String(255);
    Usuario: String(255);
    Senha: String(255); }
    _Alias: TInstantString;
    _Senha: TInstantString;
    _Sistema: TInstantReference;
    _Usuario: TInstantString;
  private
    function GetAlias: string;
    function GetSenha: string;
    function GetSistema: TSistema;
    function GetUsuario: string;
    procedure SetAlias(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetSistema(Value: TSistema);
    procedure SetUsuario(const Value: string);
  protected
    function GetDescricao: string; override;
    procedure SetDescricao(const Value: string); override;
    procedure InternalConfigurarIni(AArquivo: TIniFile); virtual;
  public
    procedure Executar; override;
  published
    property Alias: string read GetAlias write SetAlias;
    property Senha: string read GetSenha write SetSenha;
    property Sistema: TSistema read GetSistema write SetSistema;
    property Usuario: string read GetUsuario write SetUsuario;
  end;


  TAcaoConfigurarBaseDeDadosOracle = class(TAcaoConfigurarBaseDeDados)
  {IOMETADATA stored; }
  protected
    procedure InternalConfigurarIni(AArquivo: TIniFile); override;
  end;

  TAcaoConfigurarBaseDeDadosDB2 = class(TAcaoConfigurarBaseDeDados)
  {IOMETADATA stored; }
  protected
    procedure InternalConfigurarIni(AArquivo: TIniFile); override;
  end;

  TAcaoConfigurarBaseDeDadosMSSQL = class(TAcaoConfigurarBaseDeDados)
  {IOMETADATA stored;
    Instancia: String(255); }
    _Instancia: TInstantString;
  private
    function GetInstancia: string;
    procedure SetInstancia(const Value: string);
  protected
    procedure InternalConfigurarIni(AArquivo: TIniFile); override;
  published
    property Instancia: string read GetInstancia write SetInstancia;
  end;

implementation

uses
  InstantMetadata;

{ TAcao }

procedure TAcao.Executar;
begin
  Console(Descricao);
end;

function TAcao.GetDescricao: string;
begin
  Result := _Descricao.Value;
end;

function TAcao.GetIcone: Integer;
begin
  Result := _Icone.Value;
end;

procedure TAcao.SetDescricao(const Value: string);
begin
  _Descricao.Value := Value;;
end;

{ TAcaoExecutar }

procedure TAcaoExecutar.Executar;
var
  handle: THandle;
begin
  try
    inherited Executar;
    ShellExecute(handle, nil, PChar(Application.Parser.ParserText(Aplicativo)),
      PChar(Parametros), '', SW_SHOWNORMAL);
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TAcaoExecutar.GetAplicativo: string;
begin
  Result := _Aplicativo.Value;
end;

function TAcaoExecutar.GetParametros: string;
begin
  Result := _Parametros.Value;
end;

procedure TAcaoExecutar.SetAplicativo(const Value: string);
begin
  _Aplicativo.Value := Value;;
end;

procedure TAcaoExecutar.SetParametros(const Value: string);
begin
  _Parametros.Value := Value;;
end;

{ TAcaoCopiar }

procedure TAcao.SetIcone(Value: Integer);
begin
  _Icone.Value := Value;;
end;

function TAcaoConfigurarBaseDeDados.GetAlias: string;
begin
  Result := _Alias.Value;
end;

function TAcaoConfigurarBaseDeDados.GetDescricao: string;
begin
  Exit(Alias);
end;

function TAcaoConfigurarBaseDeDados.GetSenha: string;
begin
  Result := _Senha.Value;
end;

function TAcaoConfigurarBaseDeDados.GetSistema: TSistema;
begin
  Result := _Sistema.Value as TSistema;
end;

function TAcaoConfigurarBaseDeDados.GetUsuario: string;
begin
  Result := _Usuario.Value;
end;

procedure TAcaoConfigurarBaseDeDados.SetAlias(const Value: string);
begin
  _Alias.Value := Value;;
end;

procedure TAcaoConfigurarBaseDeDados.SetDescricao(const Value: string);
begin
  inherited;
  Alias := Value;
end;

procedure TAcaoConfigurarBaseDeDados.SetSenha(const Value: string);
begin
  _Senha.Value := Value;;
end;

procedure TAcaoConfigurarBaseDeDados.SetSistema(Value: TSistema);
begin
  _Sistema.Value := Value;;
end;

procedure TAcaoConfigurarBaseDeDados.SetUsuario(const Value: string);
begin
  _Usuario.Value := Value;;
end;

procedure TAcaoCopiar.Executar;
var
  shellinfo: TSHFileOpStructW;
  path_origem: string;
begin
  inherited Executar;
  path_origem := Application.Parser.ParserText(Origem);
  path_destino_tmp := Application.Parser.ParserText(Destino);
  try

    if Length(ExtractFileExt(path_destino_tmp)) <= 0 then
      path_destino_tmp := IncludeTrailingBackslash(path_destino_tmp) + ExtractFileName(path_origem);

    if not DirectoryExists(ExtractFilePath(path_destino_tmp)) then
      ForceDirectories(ExtractFilePath(path_destino_tmp));

    if path_origem.IsEmpty then
      Exit;

    if not FileExists(path_origem) then
      Exit;

    CopyFile(PWideChar(path_origem), PWideChar(path_destino_tmp), True);
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

function TAcaoCopiar.GetDestino: string;
begin
  Result := _Destino.Value;
end;

function TAcaoCopiar.GetOrigem: string;
begin
  Result := _Origem.Value;
end;

procedure TAcaoCopiar.SetDestino(const Value: string);
begin
  _Destino.Value := Value;;
end;

procedure TAcaoCopiar.SetOrigem(const Value: string);
begin
  _Origem.Value := Value;;
end;

{ TAcaoConfigurarBaseDeDados }

procedure TAcaoConfigurarBaseDeDados.InternalConfigurarIni(AArquivo: TIniFile);
begin
  AArquivo.WriteString('Database', 'Alias', Alias);
  AArquivo.WriteString('Database', 'Usuario', Usuario);
  AArquivo.WriteString('Database', 'Senha', Senha);
end;

procedure TAcaoConfigurarBaseDeDados.Executar;
var
  arquivo: TIniFile;
  path: string;
begin
  inherited Executar;
  if path_destino_tmp.IsEmpty then
    Exit;

  arquivo := TIniFile.Create(path_destino_tmp);
  try
    InternalConfigurarIni(arquivo);
  finally
    FreeAndNil(arquivo);
  end;
end;

{ TAcaoMontarAmbiente }

function TAcaoMontarAmbiente.AddAcao(Acao: TAcao): Integer;
begin
  Result := _Acoes.Add(Acao);
end;

procedure TAcaoMontarAmbiente.ClearAcoes;
begin
  _Acoes.Clear;
end;

procedure TAcaoMontarAmbiente.DeleteAcao(Index: Integer);
begin
  _Acoes.Delete(Index);
end;

procedure TAcaoMontarAmbiente.Executar;
var
  I: Integer;
begin
  inherited Executar;
  for I := 0 to AcaoCount -1 do
    Acoes[I].Executar;
end;

function TAcaoMontarAmbiente.GetAcaoCount: Integer;
begin
  Result := _Acoes.Count;
end;

function TAcaoMontarAmbiente.GetAcoes(Index: Integer): TAcao;
begin
  Result := _Acoes[Index] as TAcao;
end;

function TAcaoMontarAmbiente.IndexOfAcao(Acao: TAcao): Integer;
begin
  Result := _Acoes.IndexOf(Acao);
end;

procedure TAcaoMontarAmbiente.InsertAcao(Index: Integer; Acao: TAcao);
begin
  _Acoes.Insert(Index, Acao);
end;

function TAcaoMontarAmbiente.RemoveAcao(Acao: TAcao): Integer;
begin
  Result := _Acoes.Remove(Acao);
end;

procedure TAcaoMontarAmbiente.SetAcoes(Index: Integer; Value: TAcao);
begin
  _Acoes[Index] := Value;;
end;

{ TAcaoConfigurarBaseDeDadosMSSQL }

function TAcaoConfigurarBaseDeDadosMSSQL.GetInstancia: string;
begin
  Result := _Instancia.Value;
end;

procedure TAcaoConfigurarBaseDeDadosMSSQL.InternalConfigurarIni(
  AArquivo: TIniFile);
begin
  inherited InternalConfigurarIni(AArquivo);
  AArquivo.WriteString('Database', 'TipoBanco', 'SQLServer');
  AArquivo.WriteString('Database', 'Server', Instancia);
end;

procedure TAcaoConfigurarBaseDeDadosMSSQL.SetInstancia(const Value: string);
begin
  _Instancia.Value := Value;;
end;

{ TAcaoConfigurarBaseDeDadosOracle }

procedure TAcaoConfigurarBaseDeDadosOracle.InternalConfigurarIni(
  AArquivo: TIniFile);
begin
  inherited InternalConfigurarIni(AArquivo);
  AArquivo.WriteString('Database', 'TipoBanco', 'Oracle');
end;

{ TAcaoConfigurarBaseDeDadosDB2 }

procedure TAcaoConfigurarBaseDeDadosDB2.InternalConfigurarIni(
  AArquivo: TIniFile);
begin
  inherited InternalConfigurarIni(AArquivo);
  AArquivo.WriteString('Database', 'TipoBanco', 'DB2');
end;

initialization
  InstantRegisterClasses([
    TAcao,
    TAcaoConfigurarBaseDeDados,
    TAcaoConfigurarBaseDeDadosDB2,
    TAcaoConfigurarBaseDeDadosMSSQL,
    TAcaoConfigurarBaseDeDadosOracle,
    TAcaoCopiar,
    TAcaoExecutar,
    TAcaoMontarAmbiente
  ]);

end.
