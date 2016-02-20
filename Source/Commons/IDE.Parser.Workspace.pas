unit IDE.Parser.Workspace;

interface

uses Classes, SysUtils, Forms, IDE.Aplicacao, Generics.Collections, IDE.IParser,
  IDE.IWorkspace;

type
  TIDEParserWorkspace = class(TInterfacedObject, IParser)
  private
    procedure Chaves(ALista: TStrings);
    function ParserText(const ATexto: string): string;
    function Chave: string;
    function PegarValor(AWorkspace: IWorkspace; const AChave: string): string;
  end;

implementation

var
  KEYS: array[1..2] of string = ('{WS_DIR}','{WS_TITLE}');

{ TIDEParserWorkspace }

function TIDEParserWorkspace.Chave: string;
begin
  Exit('');
end;

procedure TIDEParserWorkspace.Chaves(ALista: TStrings);
var
  I: Integer;
begin
  for I := Low(KEYS) to High(KEYS) do
  begin
    ALista.Add(KEYS[I]);
  end;
end;

function TIDEParserWorkspace.ParserText(const ATexto: string): string;
var
  workspace: IWorkspace;
  I: Integer;
  texto: string;
begin
  texto := ATexto;
  workspace := Application.CurrentWorkspace;
  if not Assigned(workspace) then
    Exit(ATexto);

  for I := Low(KEYS) to High(KEYS) do
  begin
    texto := StringReplace(texto, KEYS[I], PegarValor(workspace, KEYS[I]), []);
  end;

  Exit(texto);
end;

function TIDEParserWorkspace.PegarValor(AWorkspace: IWorkspace; const AChave: string): string;
begin
  if Pos(AChave, '{WS_DIR}') > 0 then
    Exit(AWorkspace.Sandbox.Diretorio)
  else
  if Pos(AChave, '{WS_TITLE}') > 0 then
    Exit(AWorkspace.Sandbox.Descricao);
  Exit('');
end;

end.
