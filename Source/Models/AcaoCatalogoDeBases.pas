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
  InstantMetadata, Manager.Source.Core.AplicationHelper;

{ TAcaoCatalogoDeBases }

function TAcaoCatalogoDeBases.GetTipoAcao: string;
begin
  Exit('Catálogo de bases');
end;

procedure TAcaoCatalogoDeBases.InternalAfterExecute;
begin
  Application.IDE.Notify;
end;

initialization
  InstantRegisterClasses([
    TAcaoCatalogoDeBases
  ]);

end.
