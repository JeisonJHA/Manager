unit Manager.Core.Parser.Aplicacao;

interface

uses Classes, SysUtils, Forms, Manager.Core.IDE, Generics.Collections, Manager.Core.API.Parser,
  Workspace, Manager.Core.Parser;

type
  TParserAplicacao = class(TParser, IParser)
  protected
    function PegarValor(ASandbox: TWorkspace; const AChave: string): string; override;
  public
    constructor Create; override;
  end;

implementation

{ TIDEParserAplicacao }

constructor TParserAplicacao.Create;
begin
  inherited;
  FChaves.Add('{APP_DIR}');
end;

function TParserAplicacao.PegarValor(ASandbox: TWorkspace;
  const AChave: string): string;
begin
  if Pos(AChave, '{APP_DIR}') > 0 then
    Exit(IncludeTrailingBackslash(ExtractFilePath(Application.ExeName)));

  Exit(inherited PegarValor(ASandbox, AChave));
end;

end.
