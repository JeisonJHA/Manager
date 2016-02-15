unit AplicacaoAction;

interface

uses
  Vcl.ActnList;

type
  TAplicacaoAction = class(TAction)
  private
    FParametros: string;
    FExecutavel: string;
  public
    property Executavel: string read FExecutavel write FExecutavel;
    property Parametros: string read FParametros write FParametros;
  end;

implementation

end.
