unit AcaoConjuntoDeBases;

interface

uses
  Acao, InstantPersistence, InstantTypes, AcaoCatalogoDeBases;

type
  TAcaoConjuntoDeBases = class(TAcao)
  {IOMETADATA stored;
    Acoes: References(TAcaoConfigurarBaseDeDados) external 'AcaoConjDeBases_Acoes';
    Catalogos: References(TAcaoCatalogoDeBases) external 'AcaoConjDeBases_Catalogos'; }
    _Acoes: TInstantReferences;
    _Catalogos: TInstantReferences;
  private
    function GetAcaoCount: Integer;
    function GetAcoes(Index: Integer): TAcaoConfigurarBaseDeDados;
    function GetCatalogoCount: Integer;
    function GetCatalogos(Index: Integer): TAcaoCatalogoDeBases;
    procedure SetAcoes(Index: Integer; Value: TAcaoConfigurarBaseDeDados);
    procedure SetCatalogos(Index: Integer; Value: TAcaoCatalogoDeBases);
  protected
    function GetTipoAcao: string; override;
  public
    procedure DeleteCatalogo(Index: Integer);
    procedure Executar; override;
    function AddAcao(Acao: TAcaoConfigurarBaseDeDados): Integer;
    function AddCatalogo(Catalogo: TAcaoCatalogoDeBases): Integer;
    procedure ClearAcoes;
    procedure ClearCatalogos;
    procedure DeleteAcao(Index: Integer);
    function IndexOfAcao(Acao: TAcaoConfigurarBaseDeDados): Integer;
    function IndexOfCatalogo(Catalogo: TAcaoCatalogoDeBases): Integer;
    procedure InsertAcao(Index: Integer; Acao: TAcaoConfigurarBaseDeDados);
    procedure InsertCatalogo(Index: Integer; Catalogo: TAcaoCatalogoDeBases);
    function RemoveAcao(Acao: TAcaoConfigurarBaseDeDados): Integer;
    function RemoveCatalogo(Catalogo: TAcaoCatalogoDeBases): Integer;
    property AcaoCount: Integer read GetAcaoCount;
    property Acoes[Index: Integer]: TAcaoConfigurarBaseDeDados read GetAcoes write SetAcoes;
    property CatalogoCount: Integer read GetCatalogoCount;
    property Catalogos[Index: Integer]: TAcaoCatalogoDeBases read GetCatalogos write SetCatalogos;
  end;

implementation

uses
  InstantMetadata;

{ TAcaoConjuntoDeBases }

procedure TAcaoConjuntoDeBases.DeleteCatalogo(Index: Integer);
begin
  _Catalogos.Delete(Index);
end;

procedure TAcaoConjuntoDeBases.Executar;
var
  I: Integer;
begin
  inherited Executar;
  for I := 0 to AcaoCount -1 do
    Acoes[I].Executar;

  for I := 0 to CatalogoCount -1 do
    Catalogos[I].Executar;
end;

function TAcaoConjuntoDeBases.AddAcao(Acao: TAcaoConfigurarBaseDeDados): Integer;
begin
  Result := _Acoes.Add(Acao);
end;

function TAcaoConjuntoDeBases.AddCatalogo(Catalogo: TAcaoCatalogoDeBases): Integer;
begin
  Result := _Catalogos.Add(Catalogo);
end;

procedure TAcaoConjuntoDeBases.ClearAcoes;
begin
  _Acoes.Clear;
end;

procedure TAcaoConjuntoDeBases.ClearCatalogos;
begin
  _Catalogos.Clear;
end;

procedure TAcaoConjuntoDeBases.DeleteAcao(Index: Integer);
begin
  _Acoes.Delete(Index);
end;

function TAcaoConjuntoDeBases.GetAcaoCount: Integer;
begin
  Result := _Acoes.Count;
end;

function TAcaoConjuntoDeBases.GetAcoes(Index: Integer): TAcaoConfigurarBaseDeDados;
begin
  Result := _Acoes[Index] as TAcaoConfigurarBaseDeDados;
end;

function TAcaoConjuntoDeBases.GetCatalogoCount: Integer;
begin
  Result := _Catalogos.Count;
end;

function TAcaoConjuntoDeBases.GetCatalogos(Index: Integer): TAcaoCatalogoDeBases;
begin
  Result := _Catalogos[Index] as TAcaoCatalogoDeBases;
end;

function TAcaoConjuntoDeBases.GetTipoAcao: string;
begin
  Exit('Conjunto de bases');
end;

function TAcaoConjuntoDeBases.IndexOfAcao(Acao: TAcaoConfigurarBaseDeDados): Integer;
begin
  Result := _Acoes.IndexOf(Acao);
end;

function TAcaoConjuntoDeBases.IndexOfCatalogo(Catalogo: TAcaoCatalogoDeBases): Integer;
begin
  Result := _Catalogos.IndexOf(Catalogo);
end;

procedure TAcaoConjuntoDeBases.InsertAcao(Index: Integer; Acao: TAcaoConfigurarBaseDeDados);
begin
  _Acoes.Insert(Index, Acao);
end;

procedure TAcaoConjuntoDeBases.InsertCatalogo(Index: Integer; Catalogo: TAcaoCatalogoDeBases);
begin
  _Catalogos.Insert(Index, Catalogo);
end;

function TAcaoConjuntoDeBases.RemoveAcao(Acao: TAcaoConfigurarBaseDeDados): Integer;
begin
  Result := _Acoes.Remove(Acao);
end;

function TAcaoConjuntoDeBases.RemoveCatalogo(Catalogo: TAcaoCatalogoDeBases): Integer;
begin
  Result := _Catalogos.Remove(Catalogo);
end;

procedure TAcaoConjuntoDeBases.SetAcoes(Index: Integer; Value: TAcaoConfigurarBaseDeDados);
begin
  _Acoes[Index] := Value;;
end;

procedure TAcaoConjuntoDeBases.SetCatalogos(Index: Integer; Value: TAcaoCatalogoDeBases);
begin
  _Catalogos[Index] := Value;;
end;

initialization
  InstantRegisterClasses([
    TAcaoConjuntoDeBases
  ]);

end.
