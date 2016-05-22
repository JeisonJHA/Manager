unit Manager.Core.IDE.Menu;

interface

uses Classes, SysUtils, Forms, InstantPresentation, InstantPersistence,
  Manager.Core.IDE, BarraFerramenta, Acao, dxRibbon, dxBar, Manager.Core.Workspace.Action;

type
  TIDEMenu = class(TObject)
  protected
    FBarraFerramenta: TInstantSelector;
    FCatalogoDeBases: TInstantSelector;
    FConjuntoDeBases: TInstantSelector;
    function BuscarAcao(AAcao: TAcao): TAcao; virtual;

    procedure PrepararConjuntoDeBases(const ACaption: string; const AImageIndex: integer); virtual; abstract;
    procedure PrepararCatalogoDeBases(const ACaption: string; const AImageIndex: integer); virtual; abstract;
    procedure PrepararBarraFerramenta; virtual; abstract;
    procedure PrepararBarraBasica; virtual;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Load; virtual;
  end;

implementation

uses AcaoCatalogoDeBases, AcaoConjuntoDeBases, AcaoExclusao;

{ TIDEMenu }

function TIDEMenu.BuscarAcao(AAcao: TAcao): TAcao;
begin
  Exit(TAcao(InstantGetClass(AAcao.ClassName).Retrieve(AAcao.Id)));
end;

constructor TIDEMenu.Create;
begin
  FBarraFerramenta := TInstantSelector.Create(nil);
  FBarraFerramenta.Command.Text := 'SELECT * FROM TBarraFerramenta  ORDER BY Descricao';
  FBarraFerramenta.Open;

  FCatalogoDeBases := TInstantSelector.Create(nil);
  FCatalogoDeBases.Command.Text := 'SELECT * FROM TAcaoCatalogoDeBases ORDER BY Descricao';
  FCatalogoDeBases.Open;

  FConjuntoDeBases := TInstantSelector.Create(nil);
  FConjuntoDeBases.Command.Text := 'SELECT * FROM TAcaoConjuntoDeBases ORDER BY Descricao';
  FConjuntoDeBases.Open;
end;

destructor TIDEMenu.Destroy;
begin
  if FConjuntoDeBases.Active then
    FConjuntoDeBases.Close;
  FreeAndNil(FConjuntoDeBases);

  if FCatalogoDeBases.Active then
    FCatalogoDeBases.Close;
  FreeAndNil(FCatalogoDeBases);

  if FBarraFerramenta.Active then
    FBarraFerramenta.Close;
  FreeAndNil(FBarraFerramenta);
  inherited;
end;

procedure TIDEMenu.Load;
begin
  PrepararConjuntoDeBases('Conjunto de Bases', 37);
  PrepararCatalogoDeBases('Catálogo de Bases', 36);
  PrepararBarraFerramenta;
  PrepararBarraBasica;
end;

procedure TIDEMenu.PrepararBarraBasica;
begin

end;

end.
