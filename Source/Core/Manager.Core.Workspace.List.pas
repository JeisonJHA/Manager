unit Manager.Core.Workspace.List;

interface

uses Classes, SysUtils, Manager.Core.Configuration, Workspace, Shellapi, filectrl,
  Contnrs, InstantPresentation, Sistema, Forms;

type
  TWorkspaceList = class(TObject)
  private
    FConfiguration: TConfiguration;
    function DeleteFolder(FolderName: String; LeaveFolder: Boolean): Boolean;
  public
    constructor Create(AConfig: TConfiguration); virtual;
    procedure Sandboxes(const ADiretorio: string;
      const AIOSelector: TInstantSelector; AEstruturaTFS: boolean); overload;
    procedure Sandboxes(AIOSelector: TInstantSelector; AEstruturaTFS: boolean); overload;
  end;

implementation

{ TWorkspaceUtils }

uses udtmDatabase;

constructor TWorkspaceList.Create(AConfig: TConfiguration);
begin
  FConfiguration := AConfig;
end;

procedure TWorkspaceList.Sandboxes(const ADiretorio: string;
  const AIOSelector: TInstantSelector; AEstruturaTFS: boolean);
var
  SearchRec: TSearchRec;
  I: integer;
  X: integer;
  diretorios: TStrings;
  Descricao: string;
  Diretorio: string;
  sistemas: TInstantSelector;

  function TratarDescricao(const ADescricao: string): string;
  begin
    Exit(StringReplace(ADescricao, '_', ' ', [rfReplaceAll]));
  end;

  function IsDiretorioProjeto(const ADiretorio: string): boolean;
  var
    I: integer;
  begin
    with sistemas do
    begin
      for I := 0 to Pred(ObjectCount) do
        if (Pos(ADiretorio, TSistema(Objects[I]).NomeDiretorio) > 0) or (FConfiguration.Workspace.EstruturaRTC) then
          Exit(True);
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
    if AEstruturaTFS or (FConfiguration.Workspace.EstruturaRTC) then
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

  sistemas := TInstantSelector.Create(nil);
  diretorios := TStringList.Create;
  try
    diretorios.StrictDelimiter := True;
    diretorios.DelimitedText := ADiretorio;

    sistemas.Connector := dtmDatabase.InstantIBXConnector1;
    sistemas.Command.Text := 'SELECT * FROM TSistema';
    sistemas.Open;

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

        if not IsSandbox(SearchRec.Name, Diretorio) and FConfiguration.Workspace.JazzOnly then
          Continue;

        if not DirectoryExists(IncludeTrailingBackslash(diretorios[X]) +
          SearchRec.Name) then
          Continue;

        I := AIOSelector.AddObject(TWorkspace.Create);
        TWorkspace(AIOSelector.Objects[I]).Descricao := Descricao;
        TWorkspace(AIOSelector.Objects[I]).Diretorio := Diretorio;
      end;
    end;
    sistemas.Close;
    diretorios.Clear;
  finally
    FreeAndNil(sistemas);
    FreeAndNil(diretorios);
  end;
  AIOSelector.Refresh;
end;

procedure TWorkspaceList.Sandboxes(AIOSelector: TInstantSelector; AEstruturaTFS: boolean);
begin
  Sandboxes(FConfiguration.Diretorio, AIOSelector, AEstruturaTFS);
end;

function TWorkspaceList.DeleteFolder(FolderName: String;
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
