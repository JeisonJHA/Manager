unit AcaoExclusao;

interface

uses
  Acao, InstantPersistence, InstantTypes;

type
  TAcaoExclusaoArquivo = class;
  TAcaoExclusaoDiretorio = class;

  TAcaoExclusaoArquivo = class(TAcaoExecutar)
  {IOMETADATA stored; }
  end;

  TAcaoExclusaoDiretorio = class(TAcaoExclusaoArquivo)
  {IOMETADATA stored; }
  end;

implementation

uses
  InstantMetadata;

initialization
  InstantRegisterClasses([
    TAcaoExclusaoArquivo,
    TAcaoExclusaoDiretorio
  ]);

end.
