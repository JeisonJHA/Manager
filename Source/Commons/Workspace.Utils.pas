unit Workspace.Utils;

interface

uses Classes, SysUtils, Workspace.Config, Workspace, Shellapi, filectrl,
  Contnrs, InstantPresentation, Sistema, Forms, IDE.Aplicacao;

type
  TWorkspaceUtils = class(TObject)
  private
    FConfig: TWorkspaceConfig;
    function DeleteFolder(FolderName: String; LeaveFolder: Boolean): Boolean;
  public
    constructor Create(AConfig: TWorkspaceConfig); virtual;
    procedure Sandboxes(const ADiretorio: string;
      const AIOSelector: TInstantSelector; AEstruturaTFS: boolean); overload;
    procedure Sandboxes(AIOSelector: TInstantSelector; AEstruturaTFS: boolean); overload;
  end;

implementation

{ TWorkspaceUtils }

uses udtmDatabase;

constructor TWorkspaceUtils.Create(AConfig: TWorkspaceConfig);
begin
  FConfig := AConfig;
end;

procedure TWorkspaceUtils.Sandboxes(const ADiretorio: string;
  const AIOSelector: TInstantSelector; AEstruturaTFS: boolean);
var
  SearchRec: TSearchRec;
  I: integer;
  X: integer;
  diretorios: TStrings;
  Descricao: string;
  Diretorio: string;

  function TratarDescricao(const ADescricao: string): string;
  begin
    Exit(StringReplace(ADescricao, '_', ' ', [rfReplaceAll]));
  end;

  function IsDiretorioProjeto(const ADiretorio: string): boolean;
  var
    sistemas: TInstantSelector;
    I: integer;
  begin
    with TInstantSelector.Create(nil) do
    begin
      Connector := dtmDatabase.InstantIBXConnector1;
      Command.Text := 'SELECT * FROM TSistema';
      Open;
      for I := 0 to Pred(ObjectCount) do
        if Pos(ADiretorio, TSistema(Objects[I]).NomeDiretorio) > 0then
          Exit(True);
      Free;
    end;
    Exit(False);
  end;

  function IsSandbox(AFileName: string; var ADiretorio: string): boolean;
  var
    SearchRec: TSearchRec;
    IsSandbox: boolean;
  begin
    IsSandbox := False;
    FindFirst(IncludeTrailingBackslash(ADiretorio) + '*.*', faDirectory, SearchRec);
    if AEstruturaTFS then
    begin
      while FindNext(SearchRec) = 0 do
      begin
        if (SearchRec.Name = '..') then
          Continue;

        if not IsSandbox and (Pos('.jazz', SearchRec.Name) > 0) then
        begin
          IsSandbox := True;
          Continue;
        end;

        if not IsDiretorioProjeto(SearchRec.Name) then
          Continue;

        ADiretorio := IncludeTrailingBackslash(ADiretorio) + SearchRec.Name;
      end;
    end;

    Exit(IsSandbox);
  end;

begin
    if not AIOSelector.Active then
    AIOSelector.Open;

  diretorios := TStringList.Create;
  try
    diretorios.StrictDelimiter := True;
    diretorios.DelimitedText := ADiretorio;

    for X := 0 to diretorios.Count - 1 do
    begin
     if not DirectoryExists(diretorios[X]) then
        Continue;

      FindFirst(IncludeTrailingBackslash(diretorios[X]) + '*.*', faDirectory,
        SearchRec);

      while FindNext(SearchRec) = 0 do
      begin
        Descricao := TratarDescricao(ExtractFileName(SearchRec.Name));
        Diretorio := IncludeTrailingBackslash(diretorios[X]) + SearchRec.Name;

        if (SearchRec.Name = '..') then
          Continue;

        if (Copy(SearchRec.Name, 1, 1) = '.') then
          Continue;

        if not IsSandbox(SearchRec.Name, Diretorio) and Application.Configuracoes.Workspace.JazzOnly then
          Continue;

        if not DirectoryExists(IncludeTrailingBackslash(diretorios[X]) +
          SearchRec.Name) then
          Continue;

        I := AIOSelector.AddObject(TWorkspace.Create);
        TWorkspace(AIOSelector.Objects[I]).Descricao := Descricao;
        TWorkspace(AIOSelector.Objects[I]).Diretorio := Diretorio;
      end;
    end;
    diretorios.Clear;
  finally
    FreeAndNil(diretorios);
  end;
  AIOSelector.Refresh;
end;

procedure TWorkspaceUtils.Sandboxes(AIOSelector: TInstantSelector; AEstruturaTFS: boolean);
begin
  Sandboxes(FConfig.Diretorio, AIOSelector, AEstruturaTFS);
end;

function TWorkspaceUtils.DeleteFolder(FolderName: String;
  LeaveFolder: Boolean): Boolean;
var
  r: TshFileOpStruct;
begin
  Result := False;
  if not DirectoryExists(FolderName) then
    Exit;
  if LeaveFolder then
    FolderName := FolderName + '*.*'
  else if FolderName[Length(FolderName)] = '\' then
    Delete(FolderName, Length(FolderName), 1);
  FillChar(r, SizeOf(r), 0);
  r.wFunc := FO_DELETE;
  r.pFrom := PChar(FolderName);
  r.fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
  Result := ((ShFileOperation(r) = 0) and (not r.fAnyOperationsAborted));
end;

end.
