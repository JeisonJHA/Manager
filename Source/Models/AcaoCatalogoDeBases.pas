unit AcaoCatalogoDeBases;

interface

uses
  Forms, Acao, InstantPersistence, InstantTypes;

type
  TAcaoCatalogoDeBases = class(TAcaoExecutar)
  {IOMETADATA stored; }
  protected
    function GetTipoAcao: string; override;
    procedure InternalAfterExecute; override;
  end;

implementation

uses
  InstantMetadata, Manager.Core.IDE.Constants, Manager.Core.IDE;

{ TAcaoCatalogoDeBases }

function TAcaoCatalogoDeBases.GetTipoAcao: string;
begin
  Exit('Catálogo de bases');
end;

procedure TAcaoCatalogoDeBases.InternalAfterExecute;
begin
  Application.Notify(taCatalogar);
end;

initialization
  InstantRegisterClasses([
    TAcaoCatalogoDeBases
  ]);

end.
