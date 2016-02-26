unit IDE.Parser.Aplicacao;

interface

uses Classes, SysUtils, Forms, IDE.Aplicacao, Generics.Collections, IDE.IParser,
  Workspace, IDE.Parser;

type
  TIDEParserAplicacao = class(TIDEParser, IParser)
  private
    function PegarValor(ASandbox: TWorkspace; const AChave: string): string; override;
  public
    constructor Create; override;
  end;

implementation

{ TIDEParserAplicacao }

constructor TIDEParserAplicacao.Create;
begin
  inherited;
  FChaves.Add('{APP_DIR}');
end;

function TIDEParserAplicacao.PegarValor(ASandbox: TWorkspace;
  const AChave: string): string;
begin
  if Pos(AChave, '{APP_DIR}') > 0 then
    Exit(IncludeTrailingBackslash(ExtractFilePath(Application.ExeName)));

  Exit(inherited PegarValor(ASandbox, AChave));
end;

end.
