unit Workspace.Action;

interface

uses
  Classes, SysUtils, Vcl.ActnList, Workspace.Constantes, Winapi.ShellApi,
  Winapi.Windows;

type
  TWorkspaceAction = class(TAction)
  end;

  TWorkspaceActionExecute = class(TWorkspaceAction)
  private
    FParametros: string;
    FExecutavel: string;
  protected
    procedure InternalOnExecute(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    property Executavel: string read FExecutavel write FExecutavel;
    property Parametros: string read FParametros write FParametros;
  end;

  TWorkspaceActionCopy = class(TWorkspaceAction)
  private
    FDestino: string;
    FOrigem: string;
  public
    property Origem: string read FOrigem write FOrigem;
    property Destino: string read FDestino write FDestino;
  end;

implementation

{ TWorkspaceActionExecute }

constructor TWorkspaceActionExecute.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  OnExecute := InternalOnExecute;
end;

procedure TWorkspaceActionExecute.InternalOnExecute(Sender: TObject);
var
  handle: THandle;
  action: TWorkspaceActionExecute;
begin
  try
    action := TWorkspaceActionExecute(Sender);
    ShellExecute(handle, nil, PChar(action.Executavel),
      PChar(action.Parametros), '', SW_SHOWNORMAL);
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.
