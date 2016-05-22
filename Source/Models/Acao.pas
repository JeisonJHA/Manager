unit Acao;

interface

uses
  InstantPersistence, InstantTypes, Winapi.ShellApi, Classes, SysUtils,
  Winapi.Windows, Forms, Manager.Core.IDE, IniFiles, Sistema;

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
    function GetTipoAcao: string; virtual;
    function GetDescricao: string; virtual;
    procedure SetDescricao(const Value: string); virtual;

    procedure InternalExecute; virtual;
    procedure InternalBeforeExecute; virtual;
    procedure InternalAfterExecute; virtual;
  public
    procedure Executar; virtual;
    procedure CopiarPara(AObject: TObject); virtual;
  published
    property Descricao: string read GetDescricao write SetDescricao;
    property Icone: Integer read GetIcone write SetIcone;
    property TipoAcao: string read GetTipoAcao;
  end;

  TAcaoExecutar = class(TAcao)
  {IOMETADATA stored;
    Parametros: String(255);
    Aplicativo: String(255);
    IsAdmin: Boolean; }
    _Aplicativo: TInstantString;
    _IsAdmin: TInstantBoolean;
    _Parametros: TInstantString;
  private
    function GetAplicativo: string;
    function GetIsAdmin: Boolean;
    function GetParametros: string;
    procedure SetAplicativo(const Value: string);
    procedure SetIsAdmin(Value: Boolean);
    procedure SetParametros(const Value: string);
    function RunAsAdmin(hWnd: HWND; filename: string; Parameters: string): Boolean;
  protected
    function GetTipoAcao: string; override;
    procedure InternalExecute; override;
    procedure InternalAfterExecute; override;
  public
  published
    property Aplicativo: string read GetAplicativo write SetAplicativo;
    property IsAdmin: Boolean read GetIsAdmin write SetIsAdmin;
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
  protected
    function GetTipoAcao: string; override;
    procedure InternalExecute; override;
    procedure InternalAfterExecute; override;
  public
    procedure CopiarPara(AObject: TObject); override;
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
  protected
    function GetTipoAcao: string; override;
    procedure InternalExecute; override;
  public
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
    procedure InternalExecute; override;
    procedure InternalAfterExecute; override;
  public
    procedure CopiarPara(AObject: TObject); virtual;
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

uses
  InstantMetadata, Manager.Core.IDE.Constants;

{ TAcao }

procedure TAcao.CopiarPara(AObject: TObject);
begin
  with TAcao(AObject) do
  begin
    Descricao := Self.Descricao;
    Icone := Self.Icone;
  end;
end;

procedure TAcao.Executar;
begin
  InternalBeforeExecute;
  InternalExecute;
  InternalAfterExecute;
end;

function TAcao.GetDescricao: string;
begin
  Result := _Descricao.Value;
end;

function TAcao.GetIcone: Integer;
begin
  Result := _Icone.Value;
end;

function TAcao.GetTipoAcao: string;
begin
  Exit('Indefinida');
end;

procedure TAcao.InternalAfterExecute;
begin
  Application.Notify(taIndefinido);
end;

procedure TAcao.InternalBeforeExecute;
begin
  Application.ExecCommand(Application.Parser.ParserText(Descricao));
end;

procedure TAcao.InternalExecute;
begin
  Exit;
end;

procedure TAcao.SetDescricao(const Value: string);
begin
  _Descricao.Value := Value;;
end;

{ TAcaoExecutar }

procedure TAcaoExecutar.InternalAfterExecute;
begin
  Application.Notify(taExecutar);
end;

procedure TAcaoExecutar.InternalExecute;
var
  handle: THandle;
begin
  try
    inherited InternalExecute;

    if Aplicativo.IsEmpty then
      Exit();

    if IsAdmin then
    begin
      RunAsAdmin(handle, Application.Parser.ParserText(Aplicativo), Application.Parser.ParserText(Parametros));
      Exit;
    end;

    ShellExecute(handle, nil, PChar(Application.Parser.ParserText(Aplicativo)),
      PChar(Application.Parser.ParserText(Parametros)), String.Empty, SW_SHOWNORMAL);
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

function TAcaoExecutar.GetIsAdmin: Boolean;
begin
  Result := _IsAdmin.Value;
end;

function TAcaoExecutar.GetParametros: string;
begin
  Result := _Parametros.Value;
end;

function TAcaoExecutar.GetTipoAcao: string;
begin
  Exit('Executar');
end;

function TAcaoExecutar.RunAsAdmin(hWnd: HWND; filename,
  Parameters: string): Boolean;
{
    See Step 3: Redesign for UAC Compatibility (UAC)
    http://msdn.microsoft.com/en-us/library/bb756922.aspx
}
var
    sei: TShellExecuteInfo;
begin
    ZeroMemory(@sei, SizeOf(sei));
    sei.cbSize := SizeOf(TShellExecuteInfo);
    sei.Wnd := hwnd;
    sei.fMask := SEE_MASK_FLAG_DDEWAIT or SEE_MASK_FLAG_NO_UI;
    sei.lpVerb := PChar('runas');
    sei.lpFile := PChar(Filename); // PAnsiChar;
    if not parameters.IsEmpty then
        sei.lpParameters := PChar(parameters); // PAnsiChar;
    sei.nShow := SW_SHOWNORMAL; //Integer;

    Result := ShellExecuteEx(@sei);
end;

procedure TAcaoExecutar.SetAplicativo(const Value: string);
begin
  _Aplicativo.Value := Value;;
end;

procedure TAcaoExecutar.SetIsAdmin(Value: Boolean);
begin
  _IsAdmin.Value := Value;;
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

procedure TAcaoConfigurarBaseDeDados.CopiarPara(AObject: TObject);
begin
  inherited CopiarPara(AObject);
  with TAcaoConfigurarBaseDeDados(AObject) do
  begin
    Alias := Self.Alias;
    DBSenha := Self.DBSenha;
    DBUsuario := Self.DBUsuario;
    Senha := Self.Senha;
    Server := Self.Server;
    Sistema := Self.Sistema;
    Usuario := Self.Usuario;
  end;
end;

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

procedure TAcaoCopiar.InternalAfterExecute;
begin
  Application.Notify(taCopiar);
end;

procedure TAcaoCopiar.InternalExecute;
var
  shellinfo: TSHFileOpStructW;
  path_origem: string;
begin
  inherited InternalExecute;
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

procedure TAcaoCopiar.CopiarPara(AObject: TObject);
begin
  inherited CopiarPara(AObject);
  with TAcaoCopiar(AObject) do
  begin
    Destino := Self.Destino;
    Origem := Self.Origem;
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

function TAcaoCopiar.GetTipoAcao: string;
begin
  Exit('Copiar');
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

procedure TAcaoConfigurarBaseDeDados.InternalAfterExecute;
begin
  Application.Notify(taConfiguarBase);
end;

procedure TAcaoConfigurarBaseDeDados.InternalConfigurarIni(AArquivo: TIniFile);
begin
  AArquivo.WriteString('Cliente', 'LoginAutomatico', Format('%s,%s,1', [Usuario, Senha]));
  AArquivo.WriteString('Database', 'Alias', Alias);
  AArquivo.WriteString('Database', 'Server', Server);
  AArquivo.WriteString('Database', 'TipoBanco', TipoBanco);
end;

procedure TAcaoConfigurarBaseDeDados.InternalExecute;
var
  arquivo: TIniFile;
  path: string;
begin
  inherited InternalExecute;
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

procedure TAcaoMontarAmbiente.InternalExecute;
var
  I: Integer;
begin
  inherited InternalExecute;
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

function TAcaoMontarAmbiente.GetTipoAcao: string;
begin
  Exit('Montagem de ambiente');
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

end.
