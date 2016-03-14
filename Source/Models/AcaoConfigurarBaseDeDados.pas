unit AcaoConfigurarBaseDeDados;

interface

uses InstantPersistence, InstantTypes, AcaoCopiar, IniFiles, Sistema, Classes,
  SysUtils, IDE.Aplicacao;

type
  TAcaoConfigurarBaseDeDados = class;
  TAcaoConfigurarBaseDeDadosDB2 = class;
  TAcaoConfigurarBaseDeDadosMSSQL = class;
  TAcaoConfigurarBaseDeDadosOracle = class;

  TAcaoConfigurarBaseDeDados = class(TAcaoCopiar)
  {IOMETADATA stored;
    Sistema: Reference(TSistema);
    Alias: String(255);
    Usuario: String(255);
    Senha: String(255);
    Server: String(255);
    DBUsuario: String(255);
    DBSenha: String(255); }
    _Alias: TInstantString;
    _DBSenha: TInstantString;
    _DBUsuario: TInstantString;
    _Senha: TInstantString;
    _Server: TInstantString;
    _Sistema: TInstantReference;
    _Usuario: TInstantString;
  private
    function GetAlias: string;
    function GetDBSenha: string;
    function GetDBUsuario: string;
    function GetSenha: string;
    function GetServer: string;
    function GetSistema: TSistema;
    function GetUsuario: string;
    procedure SetAlias(const Value: string);
    procedure SetDBSenha(const Value: string);
    procedure SetDBUsuario(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetServer(const Value: string);
    procedure SetSistema(Value: TSistema);
    procedure SetUsuario(const Value: string);
  protected
    function GetTipoAcao: string; override;
    procedure InternalConfigurarIni(AArquivo: TIniFile); virtual;
    function GetTipoBanco: string; virtual;
  public
    procedure Executar; override;
  published
    property Alias: string read GetAlias write SetAlias;
    property DBSenha: string read GetDBSenha write SetDBSenha;
    property DBUsuario: string read GetDBUsuario write SetDBUsuario;
    property Senha: string read GetSenha write SetSenha;
    property Server: string read GetServer write SetServer;
    property Sistema: TSistema read GetSistema write SetSistema;
    property Usuario: string read GetUsuario write SetUsuario;
    property TipoBanco: string read GetTipoBanco;
  end;

  TAcaoConfigurarBaseDeDadosOracle = class(TAcaoConfigurarBaseDeDados)
  {IOMETADATA stored; }
  protected
    function GetTipoAcao: string; override;
    function GetTipoBanco: string; override;
  end;

  TAcaoConfigurarBaseDeDadosDB2 = class(TAcaoConfigurarBaseDeDados)
  {IOMETADATA stored; }
  protected
    function GetTipoAcao: string; override;
    function GetTipoBanco: string; override;
  end;

  TAcaoConfigurarBaseDeDadosMSSQL = class(TAcaoConfigurarBaseDeDados)
  {IOMETADATA stored; }
  protected
    function GetTipoAcao: string; override;
    function GetTipoBanco: string; override;
  end;

implementation

{ TAcaoConfigurarBaseDeDados }

function TAcaoConfigurarBaseDeDados.GetAlias: string;
begin
  Result := _Alias.Value;
end;

function TAcaoConfigurarBaseDeDados.GetDBSenha: string;
begin
  Result := _DBSenha.Value;
end;

function TAcaoConfigurarBaseDeDados.GetDBUsuario: string;
begin
  Result := _DBUsuario.Value;
end;

function TAcaoConfigurarBaseDeDados.GetSenha: string;
begin
  Result := _Senha.Value;
end;

function TAcaoConfigurarBaseDeDados.GetServer: string;
begin
  Result := _Server.Value;
end;

function TAcaoConfigurarBaseDeDados.GetSistema: TSistema;
begin
  Result := _Sistema.Value as TSistema;
end;

function TAcaoConfigurarBaseDeDados.GetTipoAcao: string;
begin
  Exit('Configuração de base de dados');
end;

function TAcaoConfigurarBaseDeDados.GetTipoBanco: string;
begin
  Exit('Indefinido');
end;

function TAcaoConfigurarBaseDeDados.GetUsuario: string;
begin
  Result := _Usuario.Value;
end;

procedure TAcaoConfigurarBaseDeDados.SetAlias(const Value: string);
begin
  _Alias.Value := Value;;
end;

procedure TAcaoConfigurarBaseDeDados.SetDBSenha(const Value: string);
begin
  _DBSenha.Value := Value;;
end;

procedure TAcaoConfigurarBaseDeDados.SetDBUsuario(const Value: string);
begin
  _DBUsuario.Value := Value;;
end;

procedure TAcaoConfigurarBaseDeDados.SetSenha(const Value: string);
begin
  _Senha.Value := Value;;
end;

procedure TAcaoConfigurarBaseDeDados.SetServer(const Value: string);
begin
  _Server.Value := Value;;
end;

procedure TAcaoConfigurarBaseDeDados.SetSistema(Value: TSistema);
begin
  _Sistema.Value := Value;;
end;

procedure TAcaoConfigurarBaseDeDados.SetUsuario(const Value: string);
begin
  _Usuario.Value := Value;;
end;

procedure TAcaoConfigurarBaseDeDados.InternalConfigurarIni(AArquivo: TIniFile);
begin
  AArquivo.WriteString('Cliente', 'LoginAutomatico', Format('%s,%s,1', [Usuario, Senha]));
  AArquivo.WriteString('Database', 'Alias', Alias);
  AArquivo.WriteString('Database', 'Server', Server);
  AArquivo.WriteString('Database', 'TipoBanco', TipoBanco);
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

{ TAcaoConfigurarBaseDeDadosMSSQL }

function TAcaoConfigurarBaseDeDadosMSSQL.GetTipoAcao: string;
begin
  Exit('Configuração de base de dados MSSQL');
end;

function TAcaoConfigurarBaseDeDadosMSSQL.GetTipoBanco: string;
begin
  Exit('SQLServer');
end;

{ TAcaoConfigurarBaseDeDadosOracle }

function TAcaoConfigurarBaseDeDadosOracle.GetTipoAcao: string;
begin
  Exit('Configuração de base de dados Oracle');
end;

function TAcaoConfigurarBaseDeDadosOracle.GetTipoBanco: string;
begin
  Exit('Oracle');
end;

{ TAcaoConfigurarBaseDeDadosDB2 }

function TAcaoConfigurarBaseDeDadosDB2.GetTipoAcao: string;
begin
  Exit('Configuração de base de dados DB2');
end;

function TAcaoConfigurarBaseDeDadosDB2.GetTipoBanco: string;
begin
  Exit('DB2');
end;

initialization
  InstantRegisterClasses([
    TAcaoConfigurarBaseDeDados,
    TAcaoConfigurarBaseDeDadosDB2,
    TAcaoConfigurarBaseDeDadosMSSQL,
    TAcaoConfigurarBaseDeDadosOracle
  ]);

end.
