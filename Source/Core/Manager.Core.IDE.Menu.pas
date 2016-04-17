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
  if AAcao.InheritsFrom(TAcaoConfigurarBaseDeDadosDB2) then
    Exit(TAcaoConfigurarBaseDeDadosDB2.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoConfigurarBaseDeDadosOracle) then
    Exit(TAcaoConfigurarBaseDeDadosOracle.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoConfigurarBaseDeDadosMSSQL) then
    Exit(TAcaoConfigurarBaseDeDadosMSSQL.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoConfigurarBaseDeDados) then
    Exit(TAcaoConfigurarBaseDeDados.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoMontarAmbiente) then
    Exit(TAcaoMontarAmbiente.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoConjuntoDeBases) then
    Exit(TAcaoConjuntoDeBases.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoCatalogoDeBases) then
    Exit(TAcaoCatalogoDeBases.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoExclusaoArquivo) then
    Exit(TAcaoExclusaoArquivo.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoCopiar) then
    Exit(TAcaoCopiar.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoExecutar) then
    Exit(TAcaoExecutar.Retrieve(AAcao.Id));

  Exit(TAcao.Retrieve(AAcao.Id));
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
  PrepararBarraBasica;
  PrepararConjuntoDeBases('Conjunto de Bases', 37);
  PrepararCatalogoDeBases('Catálogo de Bases', 36);
  PrepararBarraFerramenta;
end;

procedure TIDEMenu.PrepararBarraBasica;
begin

end;

end.
