unit Manager.Core.Workspace.Action;

interface

uses
  Classes, SysUtils, Vcl.ActnList, Workspace.Constantes, Winapi.ShellApi,
  Winapi.Windows, Forms, Manager.Core.IDE, Acao;

type
  TWorkspaceAction = class(TAction)
  private
    FAcao: TAcao;
    procedure InternalOnExecute(Sender: TObject);
    procedure InternalOnUpdate(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Acao: TAcao read FAcao write FAcao;
  end;

  TWorkspaceActionExecute = class(TWorkspaceAction);

  TWorkspaceActionCopy = class(TWorkspaceAction);

implementation

{ TWorkspaceAction }

constructor TWorkspaceAction.Create(AOwner: TComponent);
begin
  inherited;
  OnExecute := InternalOnExecute;
  OnUpdate := InternalOnUpdate;
end;

destructor TWorkspaceAction.Destroy;
begin
  if Assigned(FAcao) then
    FreeAndNil(FAcao);
  inherited;
end;

procedure TWorkspaceAction.InternalOnExecute(Sender: TObject);
begin
  try
    Acao.Executar;
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TWorkspaceAction.InternalOnUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Assigned(Application.Main.CurrentWorkspace);
end;

end.