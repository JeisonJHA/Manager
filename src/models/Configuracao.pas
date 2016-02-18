unit Configuracao;

interface

uses
  InstantPersistence, InstantTypes;

type
  TConfiguracao = class(TInstantObject)
  {IOMETADATA stored;
    PathReferencia: String(255); }
    _PathReferencia: TInstantString;
  private
    function GetPathReferencia: string;
    procedure SetPathReferencia(const Value: string);
  published
    property PathReferencia: string read GetPathReferencia write SetPathReferencia;
  end;

implementation

uses
  InstantMetadata;

{ TConfiguracao }

function TConfiguracao.GetPathReferencia: string;
begin
  Result := _PathReferencia.Value;
end;

procedure TConfiguracao.SetPathReferencia(const Value: string);
begin
  _PathReferencia.Value := Value;
end;

initialization
  InstantRegisterClasses([
    TConfiguracao
  ]);

end.
