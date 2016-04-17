unit Manager.Core.Parser.Manager;

interface

uses Classes, SysUtils, Forms, Generics.Collections, Manager.Core.API.Parser, Workspace;

type
  TParserManager = class(TObject)
  private
    FParsers: TList<IParser>;
  private
    function InternalGetInteface(AObject: TObject): IParser;
  public
    constructor Create;
    procedure Chaves(ALista: TStrings);
    procedure Registrar(AParser: IParser);
    function ParserText(const ATexto: string): string; overload;
    function ParserText(ASandbox: TWorkspace; const ATexto: string): string; overload;
  end;

implementation

{ TIDEControllerParser }

constructor TParserManager.Create;
begin
  FParsers := TList<IParser>.Create;
end;

function TParserManager.InternalGetInteface(AObject: TObject): IParser;
var
  parser: IParser;
begin
  AObject.GetInterface(IParser, parser);
  if Assigned(parser) then
    Exit(parser);
  Exit(nil);
end;

function TParserManager.ParserText(ASandbox: TWorkspace;
  const ATexto: string): string;
var
  I: Integer;
  texto: string;
begin
  texto := ATexto;
  for I := 0 to FParsers.Count -1 do
    if Assigned(ASandbox) then
      texto := FParsers.Items[I].ParserText(ASandbox, texto)
    else
      texto := FParsers.Items[I].ParserText(texto);
  Exit(texto);
end;

procedure TParserManager.Chaves(ALista: TStrings);
var
  I: Integer;
begin
  for I := 0 to FParsers.Count -1 do
  begin
    FParsers.Items[I].Chaves(ALista);
  end;
end;

function TParserManager.ParserText(const ATexto: string): string;
begin
  Exit(ParserText(nil, ATexto));
end;

procedure TParserManager.Registrar(AParser: IParser);
begin
  if FParsers.IndexOf(AParser) < 0 then
    FParsers.Add(AParser);
end;

end.
