unit Workspace.Utils;

interface

uses Classes, SysUtils, Workspace.Config, Workspace,
  Contnrs, MdDsObjects, InstantPresentation;

type
  TWorkspaceUtils = class(TObject)
  private
    FConfig: TWorkspaceConfig;
  public
    constructor Create(AConfig: TWorkspaceConfig); virtual;
    procedure Sandboxes(const ADiretorio: string; const AIOSelector: TInstantSelector); overload;
    procedure Sandboxes(AIOSelector: TInstantSelector); overload;
  end;

implementation

{ TWorkspaceUtils }

constructor TWorkspaceUtils.Create(AConfig: TWorkspaceConfig);
begin
  FConfig := AConfig;
end;

procedure TWorkspaceUtils.Sandboxes(const ADiretorio: string; const AIOSelector: TInstantSelector);
var
  SearchRec: TSearchRec;
  I: integer;
  X: Integer;
  diretorios: TStrings;
begin
  if not AIOSelector.Active then
    AIOSelector.Open;

  diretorios := TStringList.Create;
  try
    diretorios.StrictDelimiter := True;
    diretorios.Delimiter := ';';
    diretorios.DelimitedText := ADiretorio;

    for X := 0 to diretorios.Count -1 do
    begin
      if not DirectoryExists(diretorios[X]) then
        Continue;

      FindFirst(IncludeTrailingBackslash(diretorios[X]) + '*.*', faDirectory, SearchRec);

      while FindNext(SearchRec) = 0 do
      begin
        if (SearchRec.Name = '..') then
          Continue;

        if not DirectoryExists(IncludeTrailingBackslash(diretorios[X]) + SearchRec.Name) then
          Continue;

        I := AIOSelector.AddObject(TWorkspace.Create);
        TWorkspace(AIOSelector.Objects[I]).Descricao := ExtractFileName(SearchRec.Name);
        TWorkspace(AIOSelector.Objects[I]).Diretorio := IncludeTrailingBackslash(diretorios[X]) + SearchRec.Name;
      end;
    end;
    diretorios.Clear;
  finally
    FreeAndNil(diretorios);
  end;
  AIOSelector.Refresh;
end;

procedure TWorkspaceUtils.Sandboxes(AIOSelector: TInstantSelector);
begin
  Sandboxes(FConfig.Diretorio, AIOSelector);
end;

end.
