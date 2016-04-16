unit Manager.Core.Parser.Workspace;

interface

uses Classes, SysUtils, Forms, Manager.Core.IDE, Generics.Collections, Manager.Core.API.Parser,
  Workspace, Manager.Core.Parser;

type
  TIDEParserWorkspace = class(TParser, IParser)
  protected
    function PegarValor(ASandbox: TWorkspace; const AChave: string): string; override;
  public
    constructor Create; override;
  end;

implementation

{ TIDEParserWorkspace }

constructor TIDEParserWorkspace.Create;
begin
  inherited;
  FChaves.Add('{WS_DIR}');
  FChaves.Add('{WS_TITLE}');
end;

function TIDEParserWorkspace.PegarValor(ASandbox: TWorkspace; const AChave: string): string;
begin
  if Pos(AChave, '{WS_DIR}') > 0 then
    Exit(IncludeTrailingBackslash(ASandbox.Diretorio))
  else
  if Pos(AChave, '{WS_TITLE}') > 0 then
    Exit(ASandbox.Descricao);

  Exit(inherited PegarValor(ASandbox, AChave));
end;

end.
