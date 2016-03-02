unit IDE.Inicializador;

interface

uses Classes, SysUtils, Forms, Generics.Collections, IDE.Inicializador.Intf;

type
  TInicializador = class(TObject)
  private
    FInicializadores: TList<IInicializador>;
  private
    function InternalGetInteface(AObject: TObject): IInicializador;
  public
    constructor Create;
    procedure Registrar(AInicializador: IInicializador);
    procedure Executar;
  end;

implementation

{ TInicializa }

constructor TInicializador.Create;
begin
  FInicializadores := TList<IInicializador>.Create;
end;

procedure TInicializador.Executar;
var
  I: Integer;
begin
  for I := 0 to FInicializadores.Count -1 do
    FInicializadores.Items[I].Executar;
end;

function TInicializador.InternalGetInteface(AObject: TObject): IInicializador;
var
  ini: IInicializador;
begin
  AObject.GetInterface(IInicializador, ini);
  if Assigned(ini) then
    Exit(ini);
  Exit(nil);
end;

procedure TInicializador.Registrar(AInicializador: IInicializador);
begin
  if FInicializadores.IndexOf(AInicializador) < 0 then
    FInicializadores.Add(AInicializador);
end;

end.
