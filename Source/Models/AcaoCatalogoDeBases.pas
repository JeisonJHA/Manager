unit AcaoCatalogoDeBases;

interface

uses
  Acao, InstantPersistence, InstantTypes;

type
  TAcaoCatalogoDeBases = class(TAcao)
  {IOMETADATA stored;
    Acoes: References(TAcaoConfigurarBaseDeDados) external 'AcaoCatalogoDeBases_Acoes';
    Comandos: References(TAcaoExecutar) external 'AcaoCatalogoDeBases_Comandos'; }
    _Acoes: TInstantReferences;
    _Comandos: TInstantReferences;
  private
    function GetAcaoCount: Integer;
    function GetAcoes(Index: Integer): TAcaoConfigurarBaseDeDados;
    function GetComandoCount: Integer;
    function GetComandos(Index: Integer): TAcaoExecutar;
    procedure SetAcoes(Index: Integer; Value: TAcaoConfigurarBaseDeDados);
    procedure SetComandos(Index: Integer; Value: TAcaoExecutar);
  protected
    function GetTipoAcao: string; override;
  public
    procedure Executar; override;
    function AddAcao(Acao: TAcaoConfigurarBaseDeDados): Integer;
    function AddComando(Comando: TAcaoExecutar): Integer;
    procedure ClearAcoes;
    procedure ClearComandos;
    procedure DeleteAcao(Index: Integer);
    procedure DeleteComando(Index: Integer);
    function IndexOfAcao(Acao: TAcaoConfigurarBaseDeDados): Integer;
    function IndexOfComando(Comando: TAcaoExecutar): Integer;
    procedure InsertAcao(Index: Integer; Acao: TAcaoConfigurarBaseDeDados);
    procedure InsertComando(Index: Integer; Comando: TAcaoExecutar);
    function RemoveAcao(Acao: TAcaoConfigurarBaseDeDados): Integer;
    function RemoveComando(Comando: TAcaoExecutar): Integer;
    property AcaoCount: Integer read GetAcaoCount;
    property Acoes[Index: Integer]: TAcaoConfigurarBaseDeDados read GetAcoes write SetAcoes;
    property ComandoCount: Integer read GetComandoCount;
    property Comandos[Index: Integer]: TAcaoExecutar read GetComandos write SetComandos;
  end;

implementation

uses
  InstantMetadata;

{ TAcaoCatalogoDeBases }

procedure TAcaoCatalogoDeBases.Executar;
var
  I: Integer;
begin
  inherited Executar;
  for I := 0 to AcaoCount -1 do
    Acoes[I].Executar;

  for I := 0 to ComandoCount -1 do
    Comandos[I].Executar;
end;

function TAcaoCatalogoDeBases.AddAcao(Acao: TAcaoConfigurarBaseDeDados): Integer;
begin
  Result := _Acoes.Add(Acao);
end;

function TAcaoCatalogoDeBases.AddComando(Comando: TAcaoExecutar): Integer;
begin
  Result := _Comandos.Add(Comando);
end;

procedure TAcaoCatalogoDeBases.ClearAcoes;
begin
  _Acoes.Clear;
end;

procedure TAcaoCatalogoDeBases.ClearComandos;
begin
  _Comandos.Clear;
end;

procedure TAcaoCatalogoDeBases.DeleteAcao(Index: Integer);
begin
  _Acoes.Delete(Index);
end;

procedure TAcaoCatalogoDeBases.DeleteComando(Index: Integer);
begin
  _Comandos.Delete(Index);
end;

function TAcaoCatalogoDeBases.GetAcaoCount: Integer;
begin
  Result := _Acoes.Count;
end;

function TAcaoCatalogoDeBases.GetAcoes(Index: Integer): TAcaoConfigurarBaseDeDados;
begin
  Result := _Acoes[Index] as TAcaoConfigurarBaseDeDados;
end;

function TAcaoCatalogoDeBases.GetComandoCount: Integer;
begin
  Result := _Comandos.Count;
end;

function TAcaoCatalogoDeBases.GetComandos(Index: Integer): TAcaoExecutar;
begin
  Result := _Comandos[Index] as TAcaoExecutar;
end;

function TAcaoCatalogoDeBases.GetTipoAcao: string;
begin
  Exit('Catálogo de bases');
end;

function TAcaoCatalogoDeBases.IndexOfAcao(Acao: TAcaoConfigurarBaseDeDados): Integer;
begin
  Result := _Acoes.IndexOf(Acao);
end;

function TAcaoCatalogoDeBases.IndexOfComando(Comando: TAcaoExecutar): Integer;
begin
  Result := _Comandos.IndexOf(Comando);
end;

procedure TAcaoCatalogoDeBases.InsertAcao(Index: Integer; Acao: TAcaoConfigurarBaseDeDados);
begin
  _Acoes.Insert(Index, Acao);
end;

procedure TAcaoCatalogoDeBases.InsertComando(Index: Integer; Comando: TAcaoExecutar);
begin
  _Comandos.Insert(Index, Comando);
end;

function TAcaoCatalogoDeBases.RemoveAcao(Acao: TAcaoConfigurarBaseDeDados): Integer;
begin
  Result := _Acoes.Remove(Acao);
end;

function TAcaoCatalogoDeBases.RemoveComando(Comando: TAcaoExecutar): Integer;
begin
  Result := _Comandos.Remove(Comando);
end;

procedure TAcaoCatalogoDeBases.SetAcoes(Index: Integer; Value: TAcaoConfigurarBaseDeDados);
begin
  _Acoes[Index] := Value;;
end;

procedure TAcaoCatalogoDeBases.SetComandos(Index: Integer; Value: TAcaoExecutar);
begin
  _Comandos[Index] := Value;;
end;

initialization
  InstantRegisterClasses([
    TAcaoCatalogoDeBases
  ]);

end.
