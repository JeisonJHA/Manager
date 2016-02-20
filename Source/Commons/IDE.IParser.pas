unit IDE.IParser;

interface

uses Classes, SysUtils;

type
  IParser = interface
  ['{F6495BF0-8748-4D8D-959A-4444967DDB70}']
    procedure Chaves(ALista: TStrings);
    function ParserText(const ATexto: string): string;
  end;

implementation

end.
