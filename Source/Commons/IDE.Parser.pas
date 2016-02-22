unit IDE.Parser;

interface

uses Classes, SysUtils, Forms, IDE.Aplicacao, Generics.Collections, IDE.IParser,
  IDE.IWorkspace;

type
  TIDEParser = class(TInterfacedObject)
  protected
    FChaves: TStrings;
    function ParserText(const ATexto: string): string;
    procedure Chaves(ALista: TStrings); virtual;
    function PegarValor(AWorkspace: IWorkspace; const AChave: string): string; virtual; abstract;
  public
    constructor Create; virtual;
    destructor Destroy; override;
  end;

implementation

procedure TIDEParser.Chaves(ALista: TStrings);
begin
  ALista.AddStrings(FChaves);
end;

constructor TIDEParser.Create;
begin
  FChaves := TStringList.Create;
end;

destructor TIDEParser.Destroy;
begin
  FChaves.Clear;
  FreeAndNil(FChaves);
  inherited;
end;

function TIDEParser.ParserText(const ATexto: string): string;
var
  workspace: IWorkspace;
  I: Integer;
  texto: string;
begin
  texto := ATexto;
  workspace := Application.CurrentWorkspace;
  if not Assigned(workspace) then
    Exit(ATexto);

  for I := 0 to FChaves.Count -1 do
  begin
    texto := StringReplace(texto, FChaves.Strings[I], PegarValor(workspace, FChaves.Strings[I]), []);
  end;

  Exit(texto);
end;

end.
