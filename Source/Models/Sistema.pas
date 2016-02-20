unit Sistema;

interface

uses
  InstantPersistence, InstantTypes;

type
  TSistema = class(TInstantObject)
  {IOMETADATA stored;
    Descricao: String(255);
    NomeDiretorio: String(255); }
    _Descricao: TInstantString;
    _NomeDiretorio: TInstantString;
  private
    function GetDescricao: string;
    function GetNomeDiretorio: string;
    procedure SetDescricao(const Value: string);
    procedure SetNomeDiretorio(const Value: string);
  published
    property Descricao: string read GetDescricao write SetDescricao;
    property NomeDiretorio: string read GetNomeDiretorio write SetNomeDiretorio;
  end;

implementation

uses
  InstantMetadata;

{ TSistema }

function TSistema.GetDescricao: string;
begin
  Result := _Descricao.Value;
end;

function TSistema.GetNomeDiretorio: string;
begin
  Result := _NomeDiretorio.Value;
end;

procedure TSistema.SetDescricao(const Value: string);
begin
  _Descricao.Value := Value;;
end;

procedure TSistema.SetNomeDiretorio(const Value: string);
begin
  _NomeDiretorio.Value := Value;;
end;

initialization
  InstantRegisterClasses([
    TSistema
  ]);

end.
