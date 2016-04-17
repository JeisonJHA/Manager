unit Manager.Core.Parser;

interface

uses Classes, SysUtils, Forms, Manager.Core.IDE, Generics.Collections, Manager.Core.API.Parser,
  Workspace;

type
  TParser = class(TInterfacedObject)
  protected
    FChaves: TStrings;
    function ParserText(ASandbox: TWorkspace; const ATexto: string): string; overload;
    function ParserText(const ATexto: string): string; overload;
    procedure Chaves(ALista: TStrings); virtual;
    function PegarValor(ASandbox: TWorkspace; const AChave: string): string; virtual; abstract;
  public
    constructor Create; virtual;
    destructor Destroy; override;
  end;

implementation

procedure TParser.Chaves(ALista: TStrings);
begin
  ALista.AddStrings(FChaves);
end;

constructor TParser.Create;
begin
  FChaves := TStringList.Create;
end;

destructor TParser.Destroy;
begin
  FChaves.Clear;
  FreeAndNil(FChaves);
  inherited;
end;

function TParser.ParserText(const ATexto: string): string;
var
  sandbox: TWorkspace;
begin
  sandbox := Application.CurrentWorkspace.Sandbox;
  if not Assigned(sandbox) then
    Exit(ATexto);

  Exit(ParserText(sandbox, ATexto));
end;

function TParser.ParserText(ASandbox: TWorkspace; const ATexto: string): string;
var
  I: Integer;
  texto: string;
begin
  texto := ATexto;
  for I := 0 to FChaves.Count -1 do
  begin
    texto := StringReplace(texto, FChaves.Strings[I], PegarValor(ASandbox, FChaves.Strings[I]), []);
  end;

  Exit(texto);
end;

end.
