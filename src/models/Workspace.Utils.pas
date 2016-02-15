unit Workspace.Utils;

interface

uses Classes, SysUtils, Workspace.Config, Workspace, Generics.Collections;

type
  TWorkspaceList = class(TList<TWorkspace>);

  TWorkspaceUtils = class(TObject)
  private
    FConfig: TWorkspaceConfig;
  public
    constructor Create(AConfig: TWorkspaceConfig); virtual;
    procedure Sandboxes(var ALista: TWorkspaceList); overload;
    procedure Sandboxes(const ADiretorio: string; var ALista: TWorkspaceList); overload;
  end;

implementation

{ TWorkspaceUtils }

procedure TWorkspaceUtils.Sandboxes(var ALista: TWorkspaceList);
begin
  Sandboxes(FConfig.Diretorio, ALista);
end;

constructor TWorkspaceUtils.Create(AConfig: TWorkspaceConfig);
begin
  FConfig := AConfig;
end;

procedure TWorkspaceUtils.Sandboxes(const ADiretorio: string; var ALista: TWorkspaceList);
var
  SearchRec: TSearchRec;
  I: integer;
begin
  ALista.Clear;

  FindFirst(IncludeTrailingBackslash(ADiretorio) + '*.*', faDirectory, SearchRec);

  while FindNext(SearchRec) = 0 do
  begin
    if (SearchRec.Name = '..') then
      Continue;

    if not DirectoryExists(IncludeTrailingBackslash(ADiretorio) + SearchRec.Name) then
      Continue;

    I := ALista.Add(TWorkspace.Create);
    TWorkspace(ALista.Items[I]).Descricao := ExtractFileName(SearchRec.Name);
    TWorkspace(ALista.Items[I]).Diretorio := IncludeTrailingBackslash(ADiretorio) + SearchRec.Name;
  end;
end;

end.
