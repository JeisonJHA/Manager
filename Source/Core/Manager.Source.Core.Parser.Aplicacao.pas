unit Manager.Source.Core.Parser.Aplicacao;

interface

uses Classes, SysUtils, Forms, Generics.Collections,
  Workspace, Manager.Source.Core.Intf.Parser,
  Manager.Source.Core.Parser;

type
  TParserAplicacao = class(TManagerParser, IManagerParser)
  protected
    function PegarValor(ASandbox: TWorkspace; const AChave: string): string; override;
  public
    constructor Create; override;
  end;

implementation

{ TIDEParserAplicacao }

uses Manager.Source.Core.AplicationHelper;

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
