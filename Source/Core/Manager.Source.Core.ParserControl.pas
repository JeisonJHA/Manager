unit Manager.Source.Core.ParserControl;

interface

uses Classes, SysUtils, Forms, Generics.Collections, Workspace,
  Manager.Source.Core.Intf.Parser;

type
  TManagerParsers = class(TList<IManagerParser>);

  TManagerParserControl = class(TObject)
  private
    FParsers: TManagerParsers;
  private
    function InternalGetInteface(AObject: TObject): IManagerParser;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Chaves(ALista: TStrings);
    procedure Registrar(AParser: IManagerParser);
    function ParserText(const ATexto: string): string; overload;
    function ParserText(ASandbox: TWorkspace; const ATexto: string): string; overload;
  end;

implementation

{ TIDEControllerParser }

constructor TManagerParserControl.Create;
begin
  FParsers := TManagerParsers.Create;
end;

destructor TManagerParserControl.Destroy;
begin
  FreeAndNil(FParsers);
  inherited;
end;

function TManagerParserControl.InternalGetInteface(AObject: TObject): IManagerParser;
var
  parser: IManagerParser;
begin
  AObject.GetInterface(IManagerParser, parser);
  if Assigned(parser) then
    Exit(parser);
  Exit(nil);
end;

function TManagerParserControl.ParserText(ASandbox: TWorkspace;
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

procedure TManagerParserControl.Chaves(ALista: TStrings);
var
  I: Integer;
begin
  for I := 0 to FParsers.Count -1 do
  begin
    FParsers.Items[I].Chaves(ALista);
  end;
end;

function TManagerParserControl.ParserText(const ATexto: string): string;
begin
  Exit(ParserText(nil, ATexto));
end;

procedure TManagerParserControl.Registrar(AParser: IManagerParser);
begin
  if FParsers.IndexOf(AParser) < 0 then
    FParsers.Add(AParser);
end;

end.
