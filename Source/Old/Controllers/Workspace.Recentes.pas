unit Workspace.Recentes;

interface

uses Classes, SysUtils, Forms;

type
  TSandboxesRecentes = class(TStringList)
  private
    FArquivo: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Salvar();
  end;

implementation

{ TSandboxesRecentes }

constructor TSandboxesRecentes.Create;
begin
  inherited;
  FArquivo := ExtractFilePath(Application.ExeName) + 'sandbox.list';
  if FileExists(FArquivo) then
    LoadFromFile(FArquivo);
end;

destructor TSandboxesRecentes.Destroy;
begin
  Clear;
  inherited;
end;

procedure TSandboxesRecentes.Salvar;
begin
  SaveToFile(FArquivo);
end;

end.
