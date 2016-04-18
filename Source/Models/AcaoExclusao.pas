unit AcaoExclusao;

interface

uses
  Forms, SysUtils, ShellAPI, FileCtrl, Acao, InstantPersistence, InstantTypes;

type
  TAcaoExclusaoArquivo = class;
  TAcaoExclusaoDiretorio = class;

  TAcaoExclusaoArquivo = class(TAcaoExecutar)
  {IOMETADATA stored; }
  private
    procedure DeleteDiretory(hHandle: THandle; const sPath: string; Confirm: boolean);
    procedure DeleteUniqueFile(const APath: string);
    procedure DeleteAllFiles(const APath: string);
  protected
    procedure InternalExecute; override;
    procedure InternalAfterExecute; override;
  end;

  TAcaoExclusaoDiretorio = class(TAcaoExclusaoArquivo)
  {IOMETADATA stored; }
  end;

implementation

uses
  InstantMetadata, Manager.Core.IDE.Constants, Manager.Core.IDE;

{ TAcaoExclusaoArquivo }

type
  TTipoExclusao = (teFile, teAllFiles, teDirectory);

function VerificarTipoExclusao(const APath: string): TTipoExclusao;
begin
  if (ExtractFileName(APath) = '*.*') or (ExtractFileName(APath) = '*') or (Pos('*.', ExtractFileName(APath)) > 0) then
    Exit(teAllFiles);

  if DirectoryExists(APath) then
    Exit(teDirectory);

  Exit(teFile);
end;

procedure TAcaoExclusaoArquivo.DeleteAllFiles(const APath: string);
var
  F: TSearchRec;
  path: string;
  file_name: string;
begin
  file_name := ExtractFileName(APath);
  if (Trim(file_name) = '*') then
	  file_name := '*.*';
  
  path := ExtractFilePath(APath);

  if FindFirst(IncludeTrailingBackslash(path) + file_name, faAnyFile, F) = 0 then
  begin
    try
      repeat
        if (F.Attr and faDirectory <> 0) then
        begin
          if (F.Name <> '.') and (F.Name <> '..') then
          begin
            RemoveDir(IncludeTrailingBackslash(path) + F.Name);
          end;
        end else
        begin
          DeleteFile(IncludeTrailingBackslash(path) + F.Name);
        end;
      until FindNext(F) <> 0;
    finally
      FindClose(F);
    end;
  end;
end;

procedure TAcaoExclusaoArquivo.DeleteUniqueFile(const APath: string);
begin
  if FileExists(APath) then
    DeleteFile(APath);
end;

procedure TAcaoExclusaoArquivo.InternalAfterExecute;
begin
  Application.Notify(taExcluir);
end;

procedure TAcaoExclusaoArquivo.InternalExecute;
var
  path: string;
begin
  path := Application.Parser.ParserText(Aplicativo);
  case VerificarTipoExclusao(path) of
    teFile: DeleteUniqueFile(path);
    teAllFiles: DeleteAllFiles(path);
    teDirectory: DeleteDiretory(Application.Handle, path, IsAdmin);
  end;
end;

// utilize a funcão desta forma:  DeleteDir(Self.Handle,'C:TESTE',True);
procedure TAcaoExclusaoArquivo.DeleteDiretory(hHandle: THandle; const sPath: string; Confirm: boolean);
var
  OpStruc: TSHFileOpStruct;
  FromBuffer, ToBuffer: array[0..128] of char;
begin
  fillChar(OpStruc, Sizeof(OpStruc), 0);
  FillChar(FromBuffer, Sizeof(FromBuffer), 0);
  FillChar(ToBuffer, Sizeof(ToBuffer), 0);
  StrPCopy(FromBuffer, sPath);

  with OpStruc do
  begin
    Wnd := hHandle;
    wFunc := FO_DELETE;
    pFrom := @FromBuffer;
    pTo := @ToBuffer;

    if not confirm then
    begin
      fFlags := FOF_NOCONFIRMATION;
    end;

    fAnyOperationsAborted := False;
    hNameMappings := nil;
  end;

  ShFileOperation(OpStruc);
end;

initialization
  InstantRegisterClasses([
    TAcaoExclusaoArquivo,
    TAcaoExclusaoDiretorio
  ]);

end.
