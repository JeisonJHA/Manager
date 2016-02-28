unit AcaoCatalogoDeBases;

interface

uses
  Acao, InstantPersistence, InstantTypes;

type
  TAcaoCatalogoDeBases = class(TAcaoExecutar)
  {IOMETADATA stored; }
  protected
    function GetTipoAcao: string; override;
  end;

implementation

uses
  InstantMetadata;

{ TAcaoCatalogoDeBases }

function TAcaoCatalogoDeBases.GetTipoAcao: string;
begin
  Exit('Catálogo de bases');
end;

initialization
  InstantRegisterClasses([
    TAcaoCatalogoDeBases
  ]);

end.
