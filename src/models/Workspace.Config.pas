unit Workspace.Config;

interface

uses Classes, SysUtils, JvAppRegistryStorage;

type
  TWorkspaceConfig = class(TJvAppRegistryStorage)
  private
    function GetDiretorio: string;
    procedure SetDiretorio(const Value: string);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Diretorio: string read GetDiretorio write SetDiretorio;
  end;

implementation

const
  TheKey = 'Software\Softplan\Manager';
  BaseKey = 'SCM';

{ TWorkspaceConfig }

constructor TWorkspaceConfig.Create(AOwner: TComponent);
begin
  inherited;
  Root := TheKey;
end;

function TWorkspaceConfig.GetDiretorio: string;
begin
  Exit(IncludeTrailingBackslash(ReadString(IncludeTrailingBackslash(BaseKey) + 'Workspace', '')));
end;

procedure TWorkspaceConfig.SetDiretorio(const Value: string);
begin
  WriteString(IncludeTrailingBackslash(BaseKey) + 'Workspace', '');
end;

end.
