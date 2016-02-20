unit BancoDeDados;

interface

uses
  InstantPersistence, InstantTypes, Sistema;

type
  TBancoDeDados = class;
  TBancoDeDadosDB2 = class;
  TBancoDeDadosMSSQL = class;
  TBancoDeDadosOracle = class;

  TBancoDeDados = class(TInstantObject)
  {IOMETADATA stored;
    Descricao: String(255);
    Alias: String(255);
    Usuario: String(255);
    Senha: String(255);
    Sistema: Reference(TSistema); }
    _Alias: TInstantString;
    _Descricao: TInstantString;
    _Senha: TInstantString;
    _Sistema: TInstantReference;
    _Usuario: TInstantString;
  private
    function GetAlias: string;
    function GetDescricao: string;
    function GetSenha: string;
    function GetSistema: TSistema;
    function GetUsuario: string;
    procedure SetAlias(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetSistema(Value: TSistema);
    procedure SetUsuario(const Value: string);
  published
    property Alias: string read GetAlias write SetAlias;
    property Descricao: string read GetDescricao write SetDescricao;
    property Senha: string read GetSenha write SetSenha;
    property Sistema: TSistema read GetSistema write SetSistema;
    property Usuario: string read GetUsuario write SetUsuario;
  end;

  TBancoDeDadosOracle = class(TBancoDeDados)
  {IOMETADATA stored; }
  end;

  TBancoDeDadosMSSQL = class(TBancoDeDados)
  {IOMETADATA stored;
    Instancia: String(255); }
    _Instancia: TInstantString;
  private
    function GetInstancia: string;
    procedure SetInstancia(const Value: string);
  published
    property Instancia: string read GetInstancia write SetInstancia;
  end;

  TBancoDeDadosDB2 = class(TBancoDeDados)
  {IOMETADATA stored; }
  end;

implementation

uses
  InstantMetadata;

{ TBancoDeDados }

function TBancoDeDados.GetAlias: string;
begin
  Result := _Alias.Value;
end;

function TBancoDeDados.GetDescricao: string;
begin
  Result := _Descricao.Value;
end;

function TBancoDeDados.GetSenha: string;
begin
  Result := _Senha.Value;
end;

function TBancoDeDados.GetSistema: TSistema;
begin
  Result := _Sistema.Value as TSistema;
end;

function TBancoDeDados.GetUsuario: string;
begin
  Result := _Usuario.Value;
end;

procedure TBancoDeDados.SetAlias(const Value: string);
begin
  _Alias.Value := Value;;
end;

procedure TBancoDeDados.SetDescricao(const Value: string);
begin
  _Descricao.Value := Value;;
end;

procedure TBancoDeDados.SetSenha(const Value: string);
begin
  _Senha.Value := Value;;
end;

procedure TBancoDeDados.SetSistema(Value: TSistema);
begin
  _Sistema.Value := Value;;
end;

procedure TBancoDeDados.SetUsuario(const Value: string);
begin
  _Usuario.Value := Value;;
end;

{ TBancoDeDadosMSSQL }

function TBancoDeDadosMSSQL.GetInstancia: string;
begin
  Result := _Instancia.Value;
end;

procedure TBancoDeDadosMSSQL.SetInstancia(const Value: string);
begin
  _Instancia.Value := Value;;
end;

initialization
  InstantRegisterClasses([
    TBancoDeDados,
    TBancoDeDadosDB2,
    TBancoDeDadosMSSQL,
    TBancoDeDadosOracle
  ]);

end.
