unit Manager.Source.Core.Parser.Workspace;

interface

uses Classes, SysUtils, Forms, Generics.Collections,
  Workspace, Manager.Source.Core.Intf.Parser,
  Manager.Source.Core.Parser;

type
  TParserWorkspace = class(TManagerParser, IManagerParser)
  protected
    function PegarValor(ASandbox: TWorkspace; const AChave: string): string; override;
  public
    constructor Create; override;
  end;

implementation

{ TIDEParserWorkspace }

uses Manager.Source.Core.AplicationHelper;

constructor TParserWorkspace.Create;
begin
  inherited;
  FChaves.Add('{WS_DIR}');
  FChaves.Add('{WS_TITLE}');
end;

function TParserWorkspace.PegarValor(ASandbox: TWorkspace; const AChave: string): string;
begin
  if Pos(AChave, '{WS_DIR}') > 0 then
    Exit(IncludeTrailingBackslash(ASandbox.Diretorio))
  else
  if Pos(AChave, '{WS_TITLE}') > 0 then
    Exit(ASandbox.Descricao);

  Exit(inherited PegarValor(ASandbox, AChave));
end;

end.
