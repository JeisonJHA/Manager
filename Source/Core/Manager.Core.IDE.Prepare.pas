unit Manager.Core.IDE.Prepare;

interface

uses Classes, SysUtils, Forms, Generics.Collections, Manager.Core.API.Prepare,
  Manager.Core.Forms.Splash;

type
  TIDEPrepare = class(TObject)
  private
    FInicializadores: TList<IPrepare>;
    FSplash: TfrmSplash;
  private
    function InternalGetInteface(AObject: TObject): IPrepare;
  public
    constructor Create;
    procedure Registrar(AInicializador: IPrepare);
    procedure Executar;
    property Splash: TfrmSplash read FSplash;
  end;

implementation

{ TInicializa }

constructor TIDEPrepare.Create;
begin
  FInicializadores := TList<IPrepare>.Create;
  FSplash := TfrmSplash.Create(Application);
end;

procedure TIDEPrepare.Executar;
var
  I: Integer;
begin
  for I := 0 to FInicializadores.Count -1 do
    FInicializadores.Items[I].Executar;
end;

function TIDEPrepare.InternalGetInteface(AObject: TObject): IPrepare;
var
  ini: IPrepare;
begin
  AObject.GetInterface(IPrepare, ini);
  if Assigned(ini) then
    Exit(ini);
  Exit(nil);
end;

procedure TIDEPrepare.Registrar(AInicializador: IPrepare);
begin
  if FInicializadores.IndexOf(AInicializador) < 0 then
    FInicializadores.Add(AInicializador);
end;

end.
