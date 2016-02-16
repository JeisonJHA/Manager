unit Workspace.Action;

interface

uses
  Vcl.ActnList, Workspace.Constantes;

type
  TWorkspaceAction = class(TAction)
  private
    FParametros: string;
    FExecutavel: string;
    FTipo: TTipoAcao;
  public
    property Executavel: string read FExecutavel write FExecutavel;
    property Parametros: string read FParametros write FParametros;
    property Tipo: TTipoAcao read FTipo write FTipo;
  end;

implementation

end.
