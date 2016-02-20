unit Acao;

interface

uses
  InstantPersistence, InstantTypes;

type
  TAcao = class;
  TAcaoCopiar = class;
  TAcaoExecutar = class;

  TAcao = class(TInstantObject)
  {IOMETADATA stored;
    Descricao: String(255);
    Icone: Integer; }
    _Descricao: TInstantString;
    _Icone: TInstantInteger;
  private
    function GetDescricao: string;
    function GetIcone: Integer;
    procedure SetDescricao(const Value: string);
    procedure SetIcone(Value: Integer);
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
    function GetDestino: string;
    function GetOrigem: string;
    procedure SetDestino(const Value: string);
    procedure SetOrigem(const Value: string);
  published
    property Destino: string read GetDestino write SetDestino;
    property Origem: string read GetOrigem write SetOrigem;
  end;

implementation

uses
  InstantMetadata;

{ TAcao }

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

initialization
  InstantRegisterClasses([
    TAcao,
    TAcaoCopiar,
    TAcaoExecutar
  ]);

end.
