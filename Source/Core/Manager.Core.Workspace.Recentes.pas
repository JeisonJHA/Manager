unit Manager.Core.Workspace.Recentes;

interface

uses Classes, SysUtils, Forms;

type
  TWorkspacesRecentes = class(TStringList)
  private
    FArquivo: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Salvar();
  end;

implementation

{ TSandboxesRecentes }

constructor TWorkspacesRecentes.Create;
begin
  inherited;
  FArquivo := ExtractFilePath(Application.ExeName) + 'sandbox.list';
  if FileExists(FArquivo) then
    LoadFromFile(FArquivo);
end;

destructor TWorkspacesRecentes.Destroy;
begin
  Clear;
  inherited;
end;

procedure TWorkspacesRecentes.Salvar;
begin
  SaveToFile(FArquivo);
end;

end.
