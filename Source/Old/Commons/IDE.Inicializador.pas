unit IDE.Inicializador;

interface

uses Classes, SysUtils, Forms, Generics.Collections, IDE.Inicializador.Intf,
  IDE.Forms.Splash;

type
  TInicializador = class(TObject)
  private
    FInicializadores: TList<IInicializador>;
    FSplash: TfrmSplash;
  private
    function InternalGetInteface(AObject: TObject): IInicializador;
  public
    constructor Create;
    procedure Registrar(AInicializador: IInicializador);
    procedure Executar;
    property Splash: TfrmSplash read FSplash;
  end;

implementation

{ TInicializa }

constructor TInicializador.Create;
begin
  FInicializadores := TList<IInicializador>.Create;
  FSplash := TfrmSplash.Create(Application);
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
