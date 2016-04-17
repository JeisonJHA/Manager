unit Manager.Core.API.Parser;

interface

uses Classes, SysUtils, Workspace;

type
  IParser = interface
  ['{F6495BF0-8748-4D8D-959A-4444967DDB70}']
    procedure Chaves(ALista: TStrings);
    function ParserText(const ATexto: string): string; overload;
    function ParserText(ASandbox: TWorkspace; const ATexto: string): string; overload;
  end;

implementation

end.
